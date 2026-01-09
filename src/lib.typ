// Functions we will import for use in the sutra book

#set text(font: "Noto Sans CJK JP")

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

// 1. Define the 'above' function (from previous step)
#let above(word, top) = box(grid(
  columns: 1,
  gutter: 4pt,
  align: center,
  text(size: 0.6em, top),
  word
))

#let ino_note(text_content) = {
  set text(fill: red) // Just print text in red
  text_content
}

#let zh(left, right) = {
  let left_array = left.text.split("|")
  let right_array = right.text.split("|")

  if left_array.len() != right_array.len() {
    panic("Ruby text has imbalanced sides. Left: " + str(left_array.len()) + ", Right: " + str(right_array.len()))
  }

  let ruby_content = {
    let sum_body = () // Initialize as an empty array
    for i in range(left_array.len()) {
      sum_body += ( // Use the + operator to append
        above(
          text(right_array.at(i)),
          text(size: 1em, left_array.at(i))
        ),
      )
    }
    sum_body.join()
  }

  text(lang: "zh", ruby_content)
}


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
