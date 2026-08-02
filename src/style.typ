
// Read options from command line
#let show-ino = sys.inputs.at("show-ino-notation", default: "false") == "true"

#let project(body) = [
  // Set fonts and basic text properties
  #set text(
    font: ("Libertinus Serif", "Noto Serif", "Noto Sans CJK JP"),
    size: 12pt,
    ligatures: true,
    kerning: true,
  )

  // Bibliography style: Chicago Manual of Style
  #set bibliography(style: "chicago-author-date")

  // Paper size: A5
  #set page(
    paper: "a5",
    margin: (inside: 20mm, outside: 15mm, top: 20mm, bottom: 20mm),
  )

  // Typography settings
  #set par(
    leading: 0.65em,
    spacing: 1.1em,
    justify: false, // Poetry shouldn't be justified
  )

  // Heading styles for elegant book design
  #show heading.where(level: 1): it => {
    pagebreak(weak: true)
    v(1.5em)
    set align(center)
    set text(size: 1.6em, weight: "regular", font: "Libertinus Serif Display")
    it.body
    v(1em)
  }

  #show heading.where(level: 2): it => {
    set align(center)
    set text(size: 1.25em, weight: "bold")
    block(above: 1.4em, below: 0.8em, it.body)
  }

  #show heading.where(level: 3): it => {
    set align(center)
    set text(size: 1.05em, weight: "regular", style: "italic")
    block(above: 1em, below: 0.6em, it.body)
  }

  // Don't show ino percussion annotation if not desired
  #show regex("([△▲○●×])([¹²³]*)"): it => {
    if show-ino { 
      text(fill: rgb("#b22222"), it) // Firebrick red
    } else { 
      "" 
    }
  }

  #body
]
