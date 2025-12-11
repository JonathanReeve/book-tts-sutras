module Main exposing (..) 

import Browser
import Debug
import Html exposing (Html, Attribute, div, span, text, pre)
import Html.Attributes
import Http
import Json.Encode
import Markdown.Block exposing (Block(..))
import Markdown.Config as Config
import Markdown.Inline exposing (Inline(..), defaultHtml)
import Parser exposing ((|.), (|=), Parser)
import Regex
import RemoteData exposing (RemoteData)


main : Program () Model Msg
main = 
    Browser.element
        { init = \() -> init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


type alias Model =
    { sutras : WebData String
    }


type alias WebData a =
    RemoteData Http.Error a


init : ( Model, Cmd Msg )
init =
    (
        {
            sutras = RemoteData.Loading
        }
        ,
        Http.get
            {
                url = "../content/sutras.md"
            ,
                expect = Http.expectString GotSutras
            }
    )

type Msg
    = GotSutras (Result Http.Error String)
    | NoOp

type alias TranslationLine =
    {
        chineseRomaji : List ChineseRomaji
    ,
        english : String
    }


type alias ChineseRomaji =
    {
        chinese : String
    ,
        romaji : Maybe String
    }


isChineseChar : Char -> Bool
isChineseChar char =
    char >= '\u{4E00}' && char <= '\u{9FFF}'


chineseRomajiParser : Parser ChineseRomaji
chineseRomajiParser =
    Parser.succeed ChineseRomaji
        |= (Parser.chompWhile isChineseChar |> Parser.getChompedString)
        |= Parser.oneOf
            [
                Parser.succeed Just
                    |. Parser.symbol "("
                    |= (Parser.chompWhile (\c -> c /= ')') |> Parser.getChompedString)
                    |. Parser.symbol ")"
            ,
                Parser.succeed Nothing
            ]

translationLineParser : Parser TranslationLine
translationLineParser =
    Parser.succeed TranslationLine
        |= Parser.loop [] (\previous ->
            Parser.oneOf
                [
                    Parser.succeed (\new -> Parser.Loop (new :: previous))
                        |= chineseRomajiParser
                ,
                    Parser.succeed (Parser.Done (List.reverse previous))
                ]
        )
        |. Parser.chompWhile (\c -> c == ' ')
        |. Parser.symbol "|"
        |. Parser.chompWhile (\c -> c == ' ')
        |= (Parser.chompUntilEndOr "\n" |> Parser.getChompedString)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        _ = Debug.log "update" msg
    in
    case msg of
        GotSutras result ->
            (
                {
                    model | sutras = RemoteData.fromResult result
                }
                ,
                Cmd.none
            )
        NoOp ->
            ( model, Cmd.none )


viewTranslationLine : TranslationLine -> Html msg
viewTranslationLine line =
    div []
        [
            span [ Html.Attributes.class "chinese-romaji" ]
                (List.map viewChineseRomaji line.chineseRomaji)
        ,
            span [ Html.Attributes.class "english" ] [ text line.english ]
        ]


viewChineseRomaji : ChineseRomaji -> Html msg
viewChineseRomaji cr =
    case cr.romaji of
        Just romaji ->
            Html.node "ruby" []
                [
                    text cr.chinese
                ,
                    Html.node "rt" [] [ text romaji ]
                ]

        Nothing ->
            text cr.chinese


inoSymbols : String -> String
inoSymbols content =
    content
        |> String.words
        |> List.map
            (\part ->
                case part of
                    "O" -> "▢"
                    "C" -> "▣"
                    "IO" -> "△"
                    "IC" -> "▲"
                    "X" -> "🐟"
                    _ -> ""
            )
        |> String.join " "


renderBlock : Block () () -> List (Html Msg)
renderBlock block =
    let
        customInlineRenderer : Inline () -> Html Msg
        customInlineRenderer inline =
            case inline of
                Markdown.Inline.HtmlInline "ino-annotation" attrs _ ->
                    let
                        content =
                            attrs
                                |> List.filter (\( key, _ ) -> key == "content")
                                |> List.head
                                |> Maybe.andThen (\( _, value ) -> value)
                                |> Maybe.withDefault ""
                    in
                    if String.startsWith "Note: " content then
                        span [ Html.Attributes.style "font-style" "italic" ] [ text content ]
                    else
                        span [] [ text (inoSymbols content) ]

                _ ->
                    Markdown.Inline.defaultHtml Nothing inline
    in
    case block of
        Paragraph content inlines ->
            if String.startsWith "<trilingual-translation>" content then
                let
                    translationContent =
                        content
                            |> String.dropLeft (String.length "<trilingual-translation>")
                            |> String.dropRight (String.length "</trilingual-translation>")

                    lines =
                        translationContent
                            |> String.lines
                            |> List.filterMap (Parser.run translationLineParser >> Result.toMaybe)
                in
                [ div [ Html.Attributes.class "trilingual-translation" ] (List.map viewTranslationLine lines) ]
            else
                Markdown.Block.defaultHtml (Just renderBlock) (Just customInlineRenderer) block

        _ ->
            Markdown.Block.defaultHtml (Just renderBlock) (Just customInlineRenderer) block


view : Model -> Html Msg
view model =
    let
        preprocessInoAnnotations text =
            let
                _ = Debug.log "preprocessInoAnnotations input" text
                parts = String.split "@{" text
            in
            case parts of
                first :: rest ->
                    first ++ (rest |> List.map (\s ->
                        case String.split "}" s of
                            content :: after ->
                                "<ino-annotation content=\"" ++ content ++ "\" />" ++ (String.join "}" after)
                            _ -> s
                        ) |> String.join "")
                [] -> ""
        
        customOptions =
            Config.defaultOptions
                |> (\options -> { options | rawHtml = Config.DontParse })
    in
    div []
        [ case model.sutras of
            RemoteData.NotAsked ->
                text ""

            RemoteData.Loading ->
                text "Loading..."

            RemoteData.Failure error ->
                text ("Error: " ++ Debug.toString error)

            RemoteData.Success markdownText ->
                div []
                    (markdownText
                        |> preprocessInoAnnotations
                        |> Markdown.Block.parse (Just customOptions)
                        |> List.take 2
                        |> List.concatMap renderBlock)
        ]
