
// sutra_book.typ

// A helper macro to wrap any content in a classed <div> for JS to find.
#let classed-block(class, content) = {
  if sys.inputs.output == "html" {
    html.elem("div", attrs: (class: class), content)
  } else {
    content
  }
}

// A Typst macro that operates on content, not strings.
#let ruby-line(..items) = {
  let content = [] // Initialize as an empty content block
  let first = true
  for item in items.pos() {
    if not first {
      content += [ ] // Add a space before subsequent items
    }
    if type(item) == "array" {
      content += ruby(item.at(0))[#item.at(1)]
    } else {
      content += [item] // Ensure item is added as content
    }
    first = false
  }
  content
}

// Define custom functions for your special syntax at the top.
#let ino(symbol_key) = {
  let symbol_content = ""
  if symbol_key == "O" {
    symbol_content = sym.circle.stroked
  } else if symbol_key == "C" {
    symbol_content = sym.circle.filled
  } else if symbol_key == "IO" {
    symbol_content = sym.triangle.stroked.t
  } else if symbol_key == "IC" {
    symbol_content = sym.triangle.filled.t
  } else if symbol_key == "X" {
    symbol_content = sym.times
  } else if symbol_key == "V" { // 'V' found in Enmei Jikku Kannon Gyo, no specific unicode
      symbol_content = "V"
    } else {
    symbol_content = symbol_key // Fallback for unmapped symbols
  }

  super(text(font: "serif", weight: "bold", fill: red, symbol_content))
}

// The trilingual function still just handles layout.
#let trilingual(chinese-content, english-content) = {
  grid(
    columns: (1fr),
    rows: (auto, auto),
    gutter: 8pt,
    classed-block("lang-zh", chinese-content),
    classed-block("lang-en", text(style: "italic", english-content)),
  )
  v(24pt)
}

// === Document Body ===

#if sys.inputs.output == "html" [
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

#align(center)[
  = Three Treasures Sangha Sutra Book
]

== #ino("IO") #ino("IC") Shiku Seigan Mon #ino("IO")

=== Four Infinite Vows

#trilingual(
  ruby-line(
    ("衆生", "Shu jo"),
    ("無邊", "mu hen"),
    ("誓願度", "sei gan do"),
    ino("O"),ino("O"),ino("O")
  ),
  [All beings beyond number, I vow to free.]
)

#trilingual(
  ruby-line(
    ("煩惱", "Bon no"),
    ("無盡", "mu jin"),
    ("誓願斷", "sei gan dan"),
  ),
  [Blind passions without cease, I vow to see through.]
)


// This raw block injects the <script> tag into the final HTML file.
#if sys.inputs.output == "html" [
  #html.elem("script", attrs: (src: "interactivity.js"))
]
