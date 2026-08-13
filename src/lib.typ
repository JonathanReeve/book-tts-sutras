
// Functions we will import for use in the sutra book

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

// Helper for centered stage directions
#let in-gassho() = align(center, text(style: "italic", size: 0.95em)[in gassho])

// Reusable liturgical inclusions
#let purification() = [
== ○ ○ ○ ● Purification ○
#in-gassho()

All the evil karma ever created by me since of old, ○³ \
on account of my beginningless greed, hatred, and ignorance, \
born of my conduct, speech and thought, \
I ○³ now confess ○³ openly and  fully. ●¹² ○³
]

#let ti-sarana() = [
== ○ ○ ○ ● Ti-Sarana
#in-gassho()

Buddham saranam gacchami; \
dhammam saranam gacchami; \
sangham saranam gacchami. \

#v(1em)

I take refuge in the Buddha; \
I take refuge in the Dharma; \
I take refuge in the Sangha. \

#v(1em)

Buddham saranam gacchami; \
dhammam saranam gacchami; \
sangham saranam gacchami. ○
]

#let sesshin-dedication() = [
== Sesshin Dedication
#in-gassho()

*Leader:*
Buddha nature pervades the whole universe, existing right here now. With our reciting of "The Great Prajñā pāramitā Heart Sutra" (Maka Hannya Haramita Shingyō) and the "Sho Sai Myo Kichijo Dharani," let us unite with:

#v(0.4em)

*Assembly:*

#set text(size: 10.5pt)
#grid(
  columns: (auto, 1fr),
  column-gutter: 1.2em,
  row-gutter: 0.28em,
  [● The Ancient Seven Buddhas, Dai Bussō], [],
  [● Śākyamuni Buddha, Dai Bussō], [],
  [● Mahaprajapati Gautami, Dai Bussō], text(style: "italic", size: 0.88em)[maha prajāpati go'tami],
  [● Vimalakirti, Dai Bussō], text(style: "italic", size: 0.88em)[vi'mala kīrti],
  [● Patacara, Dai Bussō], text(style: "italic", size: 0.88em)[p'ta chāra],
  [● Bhadda Kapilani, Dai Bussō], text(style: "italic", size: 0.88em)[b'da kapilāni],
  [● Bodhidharma, Dai Bussō], [],
  [● Shitou Xiqian, Dai Bussō], text(style: "italic", size: 0.88em)[shure'-toe she-chwen],
  [● Mazu Daoji, Dai Bussō], text(style: "italic", size: 0.88em)[ma'-zoo dao'-ee],
  [● Dongshan Liangjie, Dai Bussō], text(style: "italic", size: 0.88em)[dong-shan liang-jay],
  [● Pang Yun Jushi, Dai Bussō], text(style: "italic", size: 0.88em)[pong yun jew-sure],
  [● Pang Lingzhao, Dai Bussō], text(style: "italic", size: 0.88em)[pong ling-jao],
  [● Liu Tiemo, Dai Bussō], text(style: "italic", size: 0.88em)[leo tyeh'-mo],
  [● Jishou Daojen, Dai Bussō], text(style: "italic", size: 0.88em)[jee-show dow-ren],
  [● Dahui Zonggao, Dai Bussō], text(style: "italic", size: 0.88em)[da-whey zong-gao],
  [● Miao Dao, Dai Bussō], text(style: "italic", size: 0.88em)[meow dow],
  [● Miao Zong, Dai Bussō], text(style: "italic", size: 0.88em)[meow zong],
  [● Dōgen Kigen, Dai Bussō], [],
  [● Keizan Jokin, Dai Bussō], [],
  [● Daiun Sogaku, Dai Bussō], [],
  [● Hakuun Ryoko, Dai Bussō], [],
  [● Koun Zenshin, Dai Bussō], [],
  [● Single-Mind Aitken, Dai Bussō], [],
  [● Dawn-Cloud Aitken, Dai Bussō], []
)

#v(0.4em)

*Leader:*
All founding teachers, past, present, future, Dai Bussō. \
Let true Dharma continue, Sangha relations become complete; \

#v(0.4em)

*Assembly:*
● All Buddhas throughout space and time; ○ \
All Bodhisattvas, Mahasattvas; ○ \
The great Prajñā pāramitā ○
]

// Helper for ruby annotations
#let above(word, top) = {
  let zh_size = 1.3em
  let ro_size = 0.72em

  if sys.inputs.at("target", default: "pdf") == "html" {
    html.elem("ruby", [
      #classed-span("lang-zh", text(size: zh_size, word))
      #html.elem("rt", classed-span("lang-ro", text(size: ro_size, top)))
    ])
  } else {
    box(
      inset: (x: 0.18em, y: 0pt),
      grid(
        columns: 1,
        gutter: 4pt,
        align: center + horizon,
        text(font: ("EB Garamond 12", "Libertinus Serif"), size: ro_size, top),
        text(font: ("Noto Serif CJK JP", "Noto Serif CJK SC"), weight: "regular", size: zh_size, word)
      )
    )
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
