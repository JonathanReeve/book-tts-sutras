
// Read options from command line
#let show-ino = sys.inputs.at("show-ino-notation", default: "false") == "true"

#let project(body) = [
  // Set fonts and basic text properties
  #set text(
    font: ("Libertinus Serif", "Noto Serif", "Noto Sans CJK JP"),
    size: 12.5pt,
    ligatures: true,
    kerning: true,
  )

  // Narrow paper size for verse
  #set page(
    width: 148mm, // A5 
    height: 210mm,
    margin: (inside: 20mm, outside: 15mm, top: 20mm, bottom: 20mm),
  )

  // Typography settings
  #set par(
    leading: 0.7em,
    spacing: 1.2em,
    justify: false, // Poetry shouldn't be justified
  )

  // Heading styles for a "beautiful" look
  #show heading: set block(above: 2em, below: 1.2em)
  
  #show heading.where(level: 1): it => {
    pagebreak(weak: true)
    v(2em)
    set align(center)
    set text(size: 1.6em, weight: "regular", font: "Libertinus Serif Display")
    it.body
    v(1em)
  }

  #show heading.where(level: 2): it => {
    set align(center)
    set text(size: 1.3em, weight: "bold")
    it
  }

  #show heading.where(level: 3): it => {
    set align(center)
    set text(size: 1.1em, weight: "regular", style: "italic")
    it
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
