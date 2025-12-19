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

#let note(text_content) = {
  set text(size: 0.8em, fill: gray)
  [#strong("Note:")] #text_content
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

= Three Treasures Sangha Sutra Book

== △ ▲ Shiku Seigan Mon △

=== Four Infinite Vows

#trilingual(
  ruby-line(
    ("衆生", "Shu jo"),
    ("無邊", "mu hen"),
    ("誓願度", "sei gan do"),
    ○$3$
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

#trilingual(
  ruby-line(
    ("法門", "Ho mon"),
    ("無量", "mu ryo"),
    ("誓願學", "sei gan gaku"),
    △$3$
  ),
  [Dharma gates beyond measure, I vow to realize.]
)

#trilingual(
  ruby-line(
    ("佛道", "Butsu do"),
    △$3$,
    ("無上", "mu jo"),
    ("誓願成", "sei gan jo"),
    △$1,2,3$
  ),
  [Buddha ways without end△$3$, I vow to △$3$embody△$1,2$ △$3...$.]
)


#pagebreak()

= Early Morning Sutras

== ○ ○ ○ The Five Remembrances

#ino_note("All O are ten seconds long.")

1. ● I am of the nature to grow old.
There is no way to escape growing old. ○

2. ● I am of the nature to have ill health.
There is no way to escape having ill health. ○

3. ● I am of the nature to die.
There is no way to escape death. ○

4. ● All that is dear to me and everyone I love
are of the nature to change.
There is no way to escape being separated from them. ○

5. ● My actions are my only true belongings.
I cannot escape the consequences of my actions.
My actions are the ground on which I stand. ○ ○ ○

#pagebreak()

== ○ ○ ○ ● Purification ○
*in gassho*

All the evil karma ever created by me since of old, ○$3$
on account of my beginningless greed, hatred, and ignorance,
born of my conduct, speech and thought,
I ○$3$ now confess ○$3$ openly and ●$1,2$ ○$3$ fully.


// This raw block injects the <script> tag into the final HTML file.
#if sys.inputs.output == "html" [
  #html.elem("script", attrs: (src: "interactivity.js"))
]

#pagebreak()

= Morning Sutra Service

== ○ ○ ○ ● Ti-Sarana
*in gassho*

Buddham saranam gacchami;
dhammam saranam gacchami;
sangham saranam gacchami.

#v(1em)

I take refuge in the Buddha:
I take refuge in the Dharma;
I take refuge in the Sangha.

#v(1em)

Buddham saranam gacchami;
dhammam saranam gacchami;
sangham saranam gacchami. ○

#pagebreak()

== ○ ○ ● Vandana
*in gassho*

Namo tassa bhagavato arahato sammasambuddhasa ○

#pagebreak()

== The Great Prajna Paramita Heart Sutra

#trilingual(
  ruby-line(("觀", "Kan"), ("自在", "jizai"), ("菩薩", "bosatsu"), ("行", "gyō"), ("深", "jin"), ("般若", "hannya"), ("波羅蜜多", "haramitta"), ("時", "ji")),
  [Avalokiteshvara Bodhisattva, practicing deep Prajna Paramita,]
)
#trilingual(
  ruby-line(("照", "shō"), ("見", "ken"), ("五蘊", "go un"), ("皆", "kai"), ("空", "kū"), ("度", "do"), ("一切", "issai"), ("苦厄", "ku yaku")),
  [clearly saw that all five skandhas are empty, transforming all suffering and distress.]
)
#trilingual(
  ruby-line(("舎利子", "sharishi"), ("色", "shiki"), ("不異", "fu i"), ("空", "kū"), ("空", "kū"), ("不異", "fu i"), ("色", "shiki")),
  [Shariputra, form is no other than emptiness, emptiness no other than form;]
)
#trilingual(
  ruby-line(("色", "shiki"), ("即是", "soku ze"), ("空", "kū"), ("空", "kū"), ("即是", "soku ze"), ("色", "shiki")),
  [form is exactly emptiness, emptiness exactly form;]
)
#trilingual(
  ruby-line(("受想行識", "ju sō gyō shiki"), ("亦復如是", "yaku bu nyo ze")),
  [sensation, perception, mental reaction, consciousness, are also like this.]
)
#trilingual(
  ruby-line(("舎利子", "sharishi"), ("是諸法空相", "ze sho hō kū sō"), ("不生不滅", "fu shō fu metsu")),
  [Shariputra, all things are essentially empty—not born, not destroyed;]
)
#trilingual(
  ruby-line(("不垢不浄", "fu kū fu jō"), ("不増不減", "fu zō fu gen")),
  [not stained, not pure; without loss, without gain.]
)
#trilingual(
  ruby-line(("是故空中無色", "ze ko kū chū mu shiki"), ("無受想行識", "mu ju sō gyō shiki")),
  [Therefore in emptiness there is no form, no sensation, perception, mental reaction, consciousness;]
)
#trilingual(
  ruby-line(("無眼耳鼻舌身意", "mu gen ni bi zetsu shin i")),
  [no eye, ear, nose, tongue, body, mind,]
)
#trilingual(
  ruby-line(("無色声香味触法", "mu shiki shō kō mi soku hō")),
  [no color, sound, scent, taste, touch, thought;]
)
#trilingual(
  ruby-line(("無眼界", "mu gen kai"), ("乃至無意識界", "nai shi mu ishiki kai")),
  [no seeing and so on to no thinking;]
)
#trilingual(
  ruby-line(("無無明", "mu mumyō"), ("亦無無明尽", "yaku mu mumyō jin")),
  [no ignorance and also no ending of ignorance,]
)
#trilingual(
  ruby-line(("乃至無老死", "nai shi mu rōshi"), ("亦無老死尽", "yaku mu rōshi jin")),
  [and so on to no old age and death and also no ending of old age and death;]
)
#trilingual(
  ruby-line(("無苦集滅道", "mu ku shū metsu dō")),
  [no suffering, cause of suffering, cessation, path;]
)
#trilingual(
  ruby-line(("無智亦無得", "mu chi yaku mu toku"), ("以無所得故", "i mu sho toku ko")),
  [no wisdom and no attainment.]
)
#trilingual(
  ruby-line(("菩提薩埵", "bodai sattā'), ("依般若波羅蜜多故", "e hannya haramitta ko")),
  [Since there is nothing to attain, the Bodhisattva lives by Prajna Paramita,]
)
#trilingual(
  ruby-line(("心無罣礙", "shin mu keige"), ("無罣礙故", "mu keige ko"), ("無有恐怖", "mu u ku fu")),
  [with no hindrance in the mind; no hindrance and therefore no fear;]
)
#trilingual(
  ruby-line(("遠離一切顛倒夢想", "onri issai tendō musō"), ("究竟涅槃", "ku gyō nehan")),
  [far beyond delusive thinking, right here is Nirvana.]
)
#trilingual(
  ruby-line(("三世諸仏", "sanze shobutsu"), ("依般若波羅蜜多故", "e hannya haramitta ko")),
  [All Buddhas of past, present and future live by Prajna Paramita,]
)
#trilingual(
  ruby-line(("得阿耨多羅三藐三菩提", "toku anokutara sanmyaku sambodai")),
  [attaining Anuttara-samyak-sambodhi.]
)
#trilingual(
  ruby-line(("故知般若波羅蜜多", "ko chi hannya haramitta")),
  [Therefore know that Prajna Paramita is the great mantra, the vivid mantra,]
)
#trilingual(
  ruby-line(("是大神呪", "ze dai jin shu"), ("是大明呪", "ze dai myō shu")),
  [the unsurpassed mantra, the supreme mantra,]
)
#trilingual(
  ruby-line(("是無上呪", "ze mu jō shu"), ("是無等等呪", "ze mu tō dō shu")),
  [which completely removes all suffering.]
)
#trilingual(
  ruby-line(("能除一切苦", "nō jo issai ku"), ("真実不虚", "shin jitsu fu ko")),
  [This is truth, not mere formality.]
)
#trilingual(
  ruby-line(("故説般若波羅蜜多呪", "ko setsu hannya haramitta shu")),
  [Therefore set for the Prajna Paramita mantra,]
)
#trilingual(
  ruby-line(("即説呪曰", "soku setsu shu watsu")),
  [set forth this mantra and proclaim:]
)
#trilingual(
  ruby-line(("羯諦", "gyatei"), ("羯諦", "gyatei"), ("波羅羯諦", "haragyatei"), ("波羅僧羯諦", "harasōgyatei"), ("菩DE薩婆訶", "bodhi sowaka")),
  [Gate Gate Paragate Parasamgate Bodhi Swaha!]
)

#pagebreak()

== Sho Sai Myo Kichijo Darani
=== Dharani for Dispelling Misfortune

#ino_note("Ino: 3 times. Mokugyo throughout.")

#trilingual(
  ruby-line(("南無", "No mo"), ("三曼多", "San man da"), ("母駄喃", "Moto nan")),
  [Veneration to all enlightened ones!]
)
#trilingual(
  ruby-line(("阿", "O"), ("跋囉底", "ha ra chi"), ("賀多", "koto sha"), ("舍", "sono"), ("喃", "nan")),
  [The incomparable bodhi-power that banishes misfortune!]
)
#trilingual(
  ruby-line(("怛姪他", "To ji to"), ("唵", "en"), ("佉佉", "gya gya"), ("佉呬", "gya ki"), ("佉呬", "gya ki"), ("吽吽", "un nun")),
  [Om! The Buddha of reality, wisdom, nirvana!]
)
#trilingual(
  ruby-line(("入嚩囉", "Shifu ra"), ("入嚩囉", "Shifu ra"), ("鉢囉", "hara shifu ra"), ("鉢囉", "hara shifu ra")),
  [Light, light! Great light, great light!]
)
#trilingual(
  ruby-line(("底哩", "Chishu sa"), ("底哩", "Chishu sa"), ("娑婆訶", "shushi ri"), ("娑婆訶", "shushi ri")),
  [With no categories, this mysterious power saves all beings.]
)
#trilingual(
  ruby-line(("莎婆訶", "Soha ja"), ("莎婆訶", "soha ja"), ("戰地", "sen chi"), ("伽隸", "gya shiri"), ("娑婆訶", "ei")),
  [Misfortune goes, happiness comes.]
)
#trilingual(
  ruby-line(("莎婆訶", "Somo ko")),
  [Swaha!]
)

#pagebreak()

= Zenkai Dedication
*in gassho*

#set text(weight: "bold")[Leader:]
Our words ring out through space beyond the stars;
their virtue and compassion echo back from all the many beings;
we recite the "Great Prajna Paramita Heart Sutra"
#text(size: 0.8em, [Or: Maka Hannya Haramita Shin Gyo])
and the "Sho Sai Myo Kichijo Darani"
for renewal of the Buddha-mind in fields and forests,
homes and streets, throughout the world,
in grateful thanks to all our many guides along the ancient way;

#v(1em)

#set text(weight: "bold")[Assembly:]
●All Buddhas throughout space and ○time;
all Bodhisattvas, Mahasattvas ○;
the great Prajna Paramita ○.

#pagebreak()

= Sesshin Dedication
*in gassho*

#set text(weight: "bold")[Leader:]
Buddha nature pervades the whole universe, existing right here now. With our reciting of "The Great Prajna Paramita Heart Sutra" (Maka Hannya Haramita Shingyo) and the "Sho Sai Myo Kichijo Dharani," let us unite with:

#v(1em)

#set text(weight: "bold")[Assembly:]
- ● The Ancient Seven Buddhas, Dai Busso
- ● Shakyamuni Buddha, Dai Busso
- ● Mahaprajapati Gautami, Dai Busso
  #h(1em) maha prajApati go'tami
- ● Vimalakirti, Dai Busso
  #h(1.5em) vi'mala kIrti
- ● Patacara, Dai Busso
  #h(1em) p'ta chAra
- ● Bhadda Kapilani
- ● Bodhidarma
- ● Shitou Xiqian
  #h(1em) shure'-toe she-chwen
- ● Mazu Daoji
  #h(1em) ma'-zoo dao'-ee
- ● Dongshan Liangjie
  #h(1em) dong-shan liang-jay
- ● Pang Yun Jushi
  #h(1em) pong yun jew-sure
- ● Pang Lingzhao
  #h(1em) pong ling-jao
- ● Liu Tiemo
  #h(1em) leo tyeh'-mo
- ● Jishou Daojen
  #h(1em) jee-show dow-ren
- ● Dahui Zonggao
  #h(1em) da-whey zong-gao
- ● Miao Dao
  #h(1em) meow dow
- ● Miao Zong
  #h(1em) meow zong
- ● Dogen Kigen
- ● Keizan Jokin
- ● Daiun Sogaku
- ● Hakuun Ryoko
- ● Koun Zenshin
- ● Single-Mind Aitken
- ● Dawn-Cloud Aitken

#v(1em)

#set text(weight: "bold")[Leader:]

All founding teachers, past, present, future, Dai Busso.
Let true Dharma continue, Sangha relations become complete;

#v(1em)

#set text(weight: "bold")[Assembly:]

●All Buddhas throughout space and time; ○
All Bodhisattvas, Mahasattvas; ○
The great Prajna Paramita ○

#pagebreak()

= ○ ● Torei Zenji: Bodhisattva's Vow

#set text(weight: "bold")[Leader:]

I am only a simple disciple, ○
but I offer these respectful words:

#v(1em)

#set text(weight: "bold")[Assembly:]

When I regard the true nature of the many dharmas,
I find them all to be sacred forms
of the Tathagata's never-failing essence.
Each particle of matter, each moment,
is no other than the Tathagata's inexpressible radiance.
With this realization, our virtuous ancestors,
with compassionate minds and hearts,
gave tender care to beasts and birds.

Among us, in our own daily lives,
who is not reverently grateful for the protections of life:
food, drink, and clothing!
Though they are inanimate things,
they are nonetheless the warm flesh and blood,
the merciful incarnations of Buddha.

All the more, we can be especially sympathetic
and affectionate with foolish people,
particularly with someone who becomes a sworn enemy
and persecutes us with abusive language.
That very abuse conveys the Buddha's boundless loving-kindness.
It is a compassionate device to liberate us entirely
from the mean-spirited delusions that we have built up
with our wrongful conduct from the beginningless past.
With our response to such abuse
we completely relinquish ourselves
and the most profound and pure faith arises.

At the peak of each thought a lotus flower opens,
and on each flower there is revealed a Buddha.
Everywhere is the Pure Land in its beauty.
We see fully the Tathagata's radiant light
right where we are.
May we retain this mind
and extend it throughout the world ○
so that we and all beings ○
become mature in Buddha's wisdom. ○

#pagebreak()

== ○ ● × Enmei Jikku Kannon VGyo ○
*in gassho*

#ino_note("Mokugyo throughout")

#trilingual(
  ruby-line(("觀", "Kan"), ("世音", "ze on")),
  [Kannon!]
)
#trilingual(
  ruby-line(("南無", "Na mu"), ("佛", "butsu")),
  [Veneration to the Buddha!]
)
#trilingual(
  ruby-line(("與佛", "Yo butsu"), ("有因", "u in")),
  [With Buddha's cause,]
)
#trilingual(
  ruby-line(("與佛", "Yo butsu"), ("有緣", "u en")),
  [With Buddha's effect;]
)
#trilingual(
  ruby-line(("佛法", "Bup po"), ("相緣", "so en")),
  [Affinity with Buddha, Dharma, Sangha]
)
#trilingual(
  ruby-line(("常樂", "Jo raku"), ("我淨", "ga jo")),
  [Eternity, bliss, self, purity;]
)
#trilingual(
  ruby-line(("朝念", "Cho nen"), ("觀", "Kan"), ("世音", "ze on")),
  [Mornings my thoughts are Kannon,]
)
#trilingual(
  ruby-line(("暮念", "Bo nen"), ("觀", "Kan"), ("世音", "ze on")),
  [Evenings my thoughts are Kannon,]
)
#trilingual(
  ruby-line(("念念", "Nen nen"), ("從心", "ju shin"), ("起", "ki")),
  [Thought after thought arises in the mind,]
)
#trilingual(
  ruby-line(("念念", "Nen nen"), ("不離", "fu ri"), ("心", "shin")),
  [Thoughts are not separate from the mind.]
)

#pagebreak()

= Dedication
*in gassho*

The Buddha and his teachers and his many sons and daughters
turn the Dharma wheel to show the wisdom of the stones and clouds;
we dedicate the virtues of reciting Torei Zenji's Bodhisattva's Vow and the Enmei Jikku Kannon Gyo to:
- Choro Nyogen, Dai Busso
- Hannya Gempo, Dai Busso
- Mita Soen, Dai Busso
and to our relatives and companions of the past who rest in deepest samadhi;

#v(1em)

#set text(weight: "bold")[All:]
●All Buddhas throughout space and time; ○
all Bodhisattvas, Mahasattvas; ○
the great prajna paramita ○

#pagebreak()

= Teisho Sutras

== ○ ○ ○ ● On Opening the Dharma V ○
*in gassho*

#ino_note("Ino: if you remain in your place during Teisho, use the Daikeisu (big bell). If you move your seat for Teisho, take the inkin with you and use that.")

The dharma, incomparably profound and minutely subtle, ●$3$
Is rarely encountered, even in hundreds of thousands of millions of ages;
We now can see it, hear it, accept and hold it;
May we ●completely realize the true ●meaning
Of the Tathagata ●$1,2$ ○$3$


#pagebreak()

= Evening Sutra Service
*in gassho*

== ○ ○ ○ ● Hakuin Zenji: Song of Zazen ○

All beings by nature are Buddha,
As ice by nature is water.
Apart from water there is no ice;
Apart from beings, no Buddha.

How sad that people ignore the near
And search for truth afar:
Like someone in the midst of water
Crying out in thirst;
Like a child of a wealthy home
Wandering among the poor.

Lost on dark paths of ignorance,
We wander through the Six Worlds;
From dark path to dark path
When shall we be freed from birth and death?

Oh, the zazen of the Mahayana!
To this the highest praise!
Devotion, repentance, training,
The many Paramitas
All have their source in zazen.

Those who try zazen even once
Wipe away beginningless crimes.
Where are all the dark paths then?
The Pure Land itself is near

Those who hear this truth even once
And listen with a grateful heart,
Treasuring it, revering it,
Gain blessings without end.

Much more, those who turn about
And bear witness to self-nature,
Self nature that is no-nature,
Go far beyond mere doctrine.

Here effect and cause are the same;
The Way is neither two nor three.

With form that is no-form,
Going and coming we are never astray;
With thought that is no-thought,
Singing and dancing are the voice of the Law.

Boundless and free is the sky of Samadhi!
Bright the full moon of wisdom!
Truly, is anything missing now?
Nirvana is right here, before our eyes; ○
This very place is the Lotus Land; ○
This very body, the Buddha. ○
