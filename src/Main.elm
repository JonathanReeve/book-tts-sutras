module Main exposing (..) 

import Browser
import Html exposing (Html, Attribute, div, span, text)
import Html.Attributes
import Markdown.Block
import Markdown.Html
import Markdown.Parser
import Markdown.Renderer
import Parser exposing ((|.), (|=), Parser)
import Regex


main : Program () Model Msg
main = 
    Browser.sandbox
        {
            init = init
        ,   view = view
        ,   update = update
        }


type alias Model =
    {}


init : Model
init =
    {}


type Msg
    = NoOp


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model


markdownText : String
markdownText =
    """
# @{IO IC} Shiku Seigan Mon (^) @{IO}

:::translation
| Four Infinite Vows
:::

## @{O O O} The Five Remembrances

@{Note: All O are ten seconds long.}

1. @{C} I am of the nature to grow old.
There is no way to escape growing old. @{O}

## @{O O O C} Purification @{O} (^)

:::translation
All the evil karma ever created by me since of old, @{O3} | on account of my beginningless greed, hatred, and ignorance,
born of my conduct, speech and thought, | born of my conduct, speech and thought,
I @{O3} now confess @{O3} openly and @{C1,2 O3} fully. | I now confess openly and fully.
:::
"""


preprocess : String -> String
preprocess markdown =
    let
        translationRegex =
            Regex.fromString "(?s):::translation\n(.*?):::"
                |> Maybe.withDefault Regex.never

        replaceTranslation match =
            case List.head match.submatches of
                Just (Just content) ->
                    "<trilingual-translation content=\"" ++ content ++ "\"></trilingual-translation>"

                _ ->
                    ""

        preprocessInoAnnotations text =
            let
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

    in
    markdown
        |> Regex.replace translationRegex replaceTranslation
        |> preprocessInoAnnotations


type alias TranslationLine =
    {
        chineseRomaji : List ChineseRomaji
    ,   english : String
    }


type alias ChineseRomaji =
    {
        chinese : String
    ,   romaji : Maybe String
    }


chineseRomajiParser : Parser ChineseRomaji
chineseRomajiParser =
    Parser.succeed ChineseRomaji
        |= Parser.chompWhile isChineseChar
        |= Parser.oneOf
            [
                Parser.succeed Just
                    |. Parser.symbol "("
                    |= Parser.chompWhile (\c -> c /= ')')
                    |. Parser.symbol ")"
            ,
                Parser.succeed Nothing
            ]


isChineseChar : Char -> Bool
isChineseChar char =
    char >= '\u{4E00}' && char <= '\u{9FFF}'


translationLineParser : Parser TranslationLine
translationLineParser =
    Parser.succeed TranslationLine
        |= Parser.loop [] (\previous ->
            Parser.oneOf
                [ Parser.succeed (\new -> Parser.Loop (new :: previous))
                    |= chineseRomajiParser
                , Parser.succeed (Parser.Done (List.reverse previous))
                ]
        )
        |. Parser.chompWhile (\c -> c == ' ')
        |. Parser.symbol "|"
        |. Parser.chompWhile (\c -> c == ' ')
        |= Parser.chompUntil (\c -> c == '\n' || c == '\r')


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

oSymbols : String -> String
oSymbols content =
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


renderer : Markdown.Renderer.Renderer (Html msg)
renderer =
    let
        baseRenderer =
            Markdown.Renderer.defaultHtmlRenderer
    in 
    { baseRenderer
        | html =
            \html ->
                Markdown.Html.oneOf
                    [
                        Markdown.Html.tag "trilingual-translation"
                            (\attrs markdown ->
                                let
                                    content =
                                        attrs
                                            |> List.filter (\( key, _ ) -> key == "content")
                                            |> List.head
                                            |> Maybe.map Tuple.second
                                            |> Maybe.withDefault ""

                                    lines =
                                        content
                                            |> String.lines
                                            |> List.filterMap (Parser.run translationLineParser >> Result.toMaybe)
                                in
                                div [ Html.Attributes.class "trilingual-translation" ] (List.map viewTranslationLine lines)
                            )
                    ,
                        Markdown.Html.tag "ino-annotation"
                            (\attrs markdown ->
                                let
                                    content =
                                        attrs
                                            |> List.filter (\( key, _ ) -> key == "content")
                                            |> List.head
                                            |> Maybe.map Tuple.second
                                            |> Maybe.withDefault ""
                                in
                                if String.startsWith "Note: " content then
                                    span [ Html.Attributes.style "font-style" "italic" ] [ text content ]

                                else
                                    span [] [ text (oSymbols content) ]
                            )
                    ]
                    html
    }


view : Model -> Html Msg
view model =
    div []
        (
            markdownText
                |> preprocess
                |> Markdown.Parser.parse
                |> Result.mapError Markdown.Parser.deadEndToString
                |> Result.andThen (Markdown.Renderer.render renderer)
                |> Result.map (List.singleton << div [])
                |> Result.withDefault []
        )
