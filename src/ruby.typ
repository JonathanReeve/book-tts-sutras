// A library for displaying ruby annotations [furigana]. 
// Adapted from https://github.com/uwni/ruby-typ/blob/main/ruby.typ

#let _ruby(rt, rb, size, pos, dy, alignment, delimiter) = {
    let rb_array = if type(rb) == "content" {
        let (inner, func) = extract_content(rb)
        inner.split(delimiter).map(func)
    } else if type(rb) == "string" {
        rb.split(delimiter)
    } else {(rb,)}
    assert(type(rb_array) == "array")
}

#let get_ruby(
  size: .5em, 
  dy: 0pt, 
  pos: top,
  alignment: "center", 
  delimiter: "|"
) = (rt, rb, alignment: alignment) => _ruby(rt, rb, size, pos, dy, alignment, delimiter)

#let test() = [
  #set box(stroke: red+.001pt)
  #set text(size: 50pt)
  #show: align.with(center)
  #let ruby = get_ruby(pos: bottom)
  #ruby("した")[下]
  #let ruby = get_ruby()
  #ruby("うえ")[上]
]

//#test()
