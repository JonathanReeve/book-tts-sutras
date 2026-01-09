
#set text(font: "Noto Sans CJK JP")

// Read options from command line 
#let show-ino = sys.inputs.at("show-ino-notation", default: "false") == "true"

// Don't show ino percussion annotation if 
#show regex("([△▲○●×])([¹²³]*)"): it => {
  if show-ino { it} else { "" }
}

// This raw block injects the <script> tag into the final HTML file.
#if "output" in sys.inputs and sys.inputs.output == "html" [
  #html.elem("script", attrs: (src: "interactivity.js"))
]
