module Main exposing (..)

import Browser
import Html exposing (Html, div, span, text)
import Html.Attributes
import Markdown.Inline
import Markdown.Parser
import Markdown.Renderer
import Parser


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


type CustomInline
    = InoAnnotation String
    | InoNote String


inoParser : Parser.Parser String
inoParser =
    Parser.succeed identity
        |. Parser.symbol "@{"
        |= Parser.chompWhile (\c -> c /= '}')
        |. Parser.symbol "}"


toCustomInline : String -> CustomInline
toCustomInline content =
    if String.startsWith "Note: " content then
        InoNote (String.dropLeft 6 content)

    else
        InoAnnotation content


customInlineParser : Markdown.Parser.Parser CustomInline
customInlineParser =
    Markdown.Parser.take inoParser
        |> Markdown.Parser.map toCustomInline


inlineParser : Markdown.Parser.Parser (Markdown.Inline.Inline CustomInline)
inlineParser =
    Markdown.Parser.oneOf
        [ Markdown.Parser.map Markdown.Inline.Custom customInlineParser
        , Markdown.Parser.inline
        ]


customRenderer : Markdown.Renderer.Renderer CustomInline
customRenderer =
    { render = renderCustom
    , text = Markdown.Renderer.default.text
    }


renderCustom : CustomInline -> List (Html msg)
renderCustom custom =
    case custom of
        InoAnnotation content ->
            [ text (inoToSymbols content) ]

        InoNote note ->
            [ span [ Html.Attributes.style "font-style" "italic" ] [ text ("Note: " ++ note) ] ]


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
        ast =
            Markdown.Parser.parse
                { block = Markdown.Parser.block
                , inline = inlineParser
                }
                markdownText
                |> Result.withDefault []
    in
    div []
        (Markdown.Renderer.render customRenderer ast)
