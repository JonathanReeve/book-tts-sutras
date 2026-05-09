
// Functions we will import for use in the sutra book

#set text(font: "Noto Sans CJK JP")

#let in-glossary = state("in-glossary", false)

// A helper macro to wrap any content in a classed <span> for JS to find.
#let classed-span(classname, content) = {
  if sys.inputs.at("target", default: "pdf") == "html" {
    html.elem("span", content, attrs: (class: classname))
  } else {
    content
  }
}

// A helper macro to wrap any content in a classed <div> for JS to find.
#let classed-block(classname, content) = {
  if sys.inputs.at("target", default: "pdf") == "html" {
    html.elem("div", content, attrs: (class: classname))
  } else {
    content
  }
}

// English Wrapper
#let eng(body) = {
  let content = text(lang: "en", style: "italic", body)
  classed-span("lang-en", content)
}

// Helper for glossary links
#let gloss-link(it, target) = {
  if sys.inputs.at("target", default: "pdf") == "html" {
    context {
      if in-glossary.get() {
        it
      } else {
        classed-span("glossary-link", link(target, it))
      }
    }
  } else {
    it
  }
}

// Helper for ruby annotations
#let above(word, top) = {
  // Triple the sizes as requested
  let zh_size = 1.2em
  let ro_size = 1em

  if sys.inputs.at("target", default: "pdf") == "html" {
    html.elem("ruby", [
      #classed-span("lang-zh", text(size: zh_size, word))
      #html.elem("rt", classed-span("lang-ro", text(size: ro_size, top)))
    ])
  } else {
    box(grid(
      columns: 1,
      gutter: 12pt, // Increased gutter for larger text
      align: center,
      text(size: ro_size, top),
      text(size: zh_size, word)
    ))
  }
}

#let ino_note(text_content) = {
  let show-ino-input = sys.inputs.at("show-ino-notation", default: "false") == "true"
  let is-html = sys.inputs.at("target", default: "pdf") == "html"
  
  let content = [
    #set text(fill: gray, size: 0.8em)
    *Note:* #text_content
  ]

  if is-html {
    classed-block("ino-note", content)
  } else if show-ino-input {
    content
  }
}

#let zh(left, right) = {
  let left_array = left.text.split("|")
  let right_array = right.text.split("|")

  if left_array.len() != right_array.len() {
    panic("Ruby text has imbalanced sides. Left: " + str(left_array.len()) + ", Right: " + str(right_array.len()))
  }

  let ruby_content = {
    let sum_body = () 
    for i in range(left_array.len()) {
      sum_body += (
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


#if sys.inputs.at("target", default: "pdf") == "html" [
  #html.elem("div", attrs: (class: "controls"), [
    #html.elem("h3", [Display Options])
    #html.elem("label", [
      #html.elem("input", attrs: (type: "checkbox", id: "show-zh", checked: "true"))
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
      #html.elem("input", attrs: (type: "checkbox", id: "show-ino", checked: "true"))
      Show Ino Notes
    ])
    #html.elem("label", [
      #html.elem("input", attrs: (type: "checkbox", id: "show-links", checked: "true"))
      Show Links to Glossary
    ])
  ])
]

// This raw block injects the <script> tag into the final HTML file.
#if sys.inputs.at("target", default: "pdf") == "html" [
  #html.elem("script", attrs: (src: "interactivity.js"))
]
