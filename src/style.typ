
// Read options from command line
#let show-ino = sys.inputs.at("show-ino-notation", default: "false") == "true"

#let project(body) = [
  // Set fonts
  #set text(font: "Noto Sans CJK JP")

  // Don't show ino percussion annotation if not desired
  #show regex("([△▲○●×])([¹²³]*)"): it => {
    if show-ino { it } else { "" }
  }

  // This raw block injects the <script> tag into the final HTML file.
  #if "output" in sys.inputs and sys.inputs.output == "html" [
    #html.elem("script", attrs: (src: "interactivity.js"))
  ]

  #body
]
