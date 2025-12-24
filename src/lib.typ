// Functions we will import for use in the sutra book

#import "src/ruby.typ": get-ruby

#if sys.inputs.at("show-ino-notation", default: "true") == "false" {
  show regex("([△▲○●×])([¹²³]*)"): ""
}

// sutra_book.typ

// A helper macro to wrap any content in a classed <div> for JS to find.
// 1. A robust helper for inline spans
#let classed-span(classname, content) = {
  // Check for the CLI input "target". Default to "pdf" if not present.
  if sys.inputs.at("target", default: "pdf") == "html" {
    html.elem("span", content, attrs: (class: classname))
  } else {
    content
  }
}

// 2. English Wrapper
// Applies italics AND sets Typst's internal lang to "en" (good for hyphenation)
#let eng(body) = {
  let content = text(lang: "en", style: "italic", body)
  classed-span("lang-en", content)
}

#let ruby = get-ruby(
  size: 0.5em,
  dy: 0pt,
  pos: top,
  alignment: "center",
  delimiter: "|",
  auto-spacing: true,
)

// 3. Chinese Wrapper
// Sets lang to "zh" (crucial for correct CJK font selection)
#let zh(left_str, right_str) = {
  let left = text(left_str)
  let right = text(right_str)
  if left.text.split("|").len() != right.text.split("|").len() {
    panic("Ruby text has imbalanced sides. Left: " + str(left.text.split("|").len()) + ", Right: " + str(right.text.split("|").len()))
  }
  let content = text(lang: "zh", ruby(left, right))
  classed-span("lang-zh", content)
}


#let ino_note(text_content) = {
  set text(fill: red) // Just print text in red
  text_content
}

#let ino(content) = {
  if sys.inputs.at("show-ino-notation", default: "true") == "true" {
    content
  } else {
    []
  }
}




// 1. Define the 'above' function (from previous step)
#let above(word, top) = box(grid(
  columns: 1,
  gutter: 4pt,
  align: center,
  text(size: 0.6em, top),
  word
))


#if "output" in sys.inputs and sys.inputs.output == "html" [
  #html.elem("div", attrs: (class: "controls"), [
    #html.elem("h3", [Display Options])
    #html.elem("label", [
      #html.elem("input", attrs: (type: "checkbox", id: "show-zh"))
      Show Chinese
    ])
    #html.elem("label", [
      #html.elem("input", attrs: (type: "checkbox", id: "show-ro", checked: "true"))
      Show Romaji
    ])
    #html.elem("label", [
      #html.elem("input", attrs: (type: "checkbox", id: "show-en", checked: "true"))
      Show English
    ])
    #html.elem("label", [
      #html.elem("input", attrs: (type: "checkbox", id: "show-ino"))
      Show Ino Notes
    ])
  ])
]

// This raw block injects the <script> tag into the final HTML file.
#if "output" in sys.inputs and sys.inputs.output == "html" [
  #html.elem("script", attrs: (src: "interactivity.js"))
]
