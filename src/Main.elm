module Main exposing (..)

import Browser
import Html exposing (Html, Attribute, div, span, text)
import Html.Attributes
import Markdown
import Markdown.Html
import Parser exposing ((|.), (|=), Parser)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
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
| Four Infinite Vows

## @{O O O} The Five Remembrances

@{Note: All O are ten seconds long.}

1. @{C} I am of the nature to grow old.
There is no way to escape growing old. @{O}

## @{O O O C} Purification @{O} (^)

All the evil karma ever created by me since of old, @{O3}
on account of my beginningless greed, hatred, and ignorance,
born of my conduct, speech and thought,
I @{O3} now confess @{O3} openly and @{C1,2 O3} fully.
"""


type CustomBlock
    = TrilingualTranslation (List TranslationLine)


type alias TranslationLine =
    { chineseRomaji : List ChineseRomaji
    , english : String
    }


type alias ChineseRomaji =
    { chinese : String
    , romaji : Maybe String
    }


type CustomInline
    = InoAnnotation String
    | InoNote String


inoParser : Parser String
inoParser =
    Parser.succeed identity
        |. Parser.symbol "@{"
        |= Parser.chompWhile (\c -> c /= '}')
        |. Parser.symbol "}"


chineseRomajiParser : Parser ChineseRomaji
chineseRomajiParser =
    Parser.succeed ChineseRomaji
        |= Parser.chompWhile isChineseChar
        |= Parser.oneOf
            [ Parser.succeed Just
                |. Parser.symbol "("
                |= Parser.chompWhile (\c -> c /= ')')
                |. Parser.symbol ")"
            , Parser.succeed Nothing
            ]


isChineseChar : Char -> Bool
isChineseChar char =
    char >= '\u{4E00}' && char <= '\u{9FFF}'


translationLineParser : Parser TranslationLine
translationLineParser =
    Parser.succeed TranslationLine
        |= Parser.loop [] (\_ -> Parser.chompWhile (\c -> c == ' ') |> Parser.map (\_ -> ()) >> chineseRomajiParser)
        |. Parser.chompWhile (\c -> c == ' ')
        |. Parser.symbol "|"
        |. Parser.chompWhile (\c -> c == ' ')
        |= Parser.chompUntil (\c -> c == '\n' || c == '\r')


toCustomInline : String -> CustomInline
toCustomInline content =
    if String.startsWith "Note: " content then
        InoNote (String.dropLeft 6 content)

    else
        InoAnnotation content


viewCustomInline : CustomInline -> Html msg
viewCustomInline custom =
    case custom of
        InoAnnotation content ->
            span [] [ text (inoToSymbols content) ]

        InoNote note ->
            span [ Html.Attributes.style "font-style" "italic" ] [ text ("Note: " ++ note) ]


customInlineParser : Parser (Html msg)
customInlineParser =
    inoParser
        |> Parser.map toCustomInline
        |> Parser.map viewCustomInline


translationBlockParser : Parser CustomBlock
translationBlockParser =
    Parser.succeed TrilingualTranslation
        |. Parser.symbol ":::translation"
        |. Parser.spaces
        |= Parser.loop [] (\_ -> translationLineParser |. Parser.spaces)
        |. Parser.symbol ":::"


customBlockParser : Parser (Html msg)
customBlockParser =
    Parser.map viewCustomBlock translationBlockParser


viewCustomBlock : CustomBlock -> Html msg
viewCustomBlock customBlock =
    case customBlock of
        TrilingualTranslation lines ->
            div
                [ Html.Attributes.class "trilingual-translation" ]
                (List.map viewTranslationLine lines)


viewTranslationLine : TranslationLine -> Html msg
viewTranslationLine line =
    div []
        ([ span [ Html.Attributes.class "chinese-romaji" ]
            (List.map viewChineseRomaji line.chineseRomaji)
         , span [ Html.Attributes.class "english" ] [ text line.english ]
         ]
        )


viewChineseRomaji : ChineseRomaji -> Html msg
viewChineseRomaji cr =
    case cr.romaji of
        Just romaji ->
            Html.node "ruby" []
                [ text cr.chinese
                , Html.node "rt" [] [ text romaji ]
                ]

        Nothing ->
            text cr.chinese


inoToSymbols : String -> String
inoToSymbols content =
    content
        |> String.words
        |> List.map
            (\part ->
                case part of
                    "O" ->
                        "▢"

                    "C" ->
                        "▣"

                    "IO" ->
                        "△"

                    "IC" ->
                        "▲"

                    "X" ->
                        "🐟"

                    _ ->
                        ""
            )
        |> String.join " "


view : Model -> Html Msg
view model =
    let
        renderer =
            Markdown.Html.defaultRenderer
                |> Markdown.withCustom
                    { inline = Just customInlineParser
                    , block = Just customBlockParser
                    }
    in
    div []
        (markdownText
            |> Markdown.parse
            |> Result.map (Markdown.toHtmlWith renderer)
            |> Result.withDefault []
        )
