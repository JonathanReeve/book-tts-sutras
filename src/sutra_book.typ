

#import "@preview/rubby:0.10.2": get-ruby

// sutra_book.typ

// A helper macro to wrap any content in a classed <div> for JS to find.
#let classed-block(class, content) = {
  if "output" in sys.inputs and sys.inputs.output == "html" {
    html.elem("div", attrs: (class: class), content)
  } else {
    content
  }
}

#let eng(content) = {
  classed-block("lang-en", text(style: "italic", content))
}

#let zh(content) = {
  classed-block("lang-zh", text(style: "italic", content))
} 



#let ino_note(text_content) = {
  set text(fill: red) // Just print text in red
  text_content
}

#let ruby = get-ruby(
  size: 0.5em,
  dy: 0pt,
  pos: top,
  alignment: "center",
  delimiter: "|",
  auto-spacing: true,
)





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

= Three Treasures Sangha Sutra Book

== △ ▲ Shiku Seigan Mon △

=== Four Infinite Vows

#classed-block("lang-zh", [
  #ruby[shu|jo|mu|hen|sei|gan|do][衆|生|無|邊|誓|願|度] ○$3$
])
#eng[All beings beyond number, I vow to free.]

#classed-block("lang-zh", [
  #ruby[bon|no|mu|jin|sei|gan|dan][煩|惱|無|盡|誓|願|斷]
])
#eng[Blind passions without cease, I vow to see through.]

#classed-block("lang-zh", [
  #ruby[ho|mon|mu|ryo|sei|gan|gaku][法|門|無|量|誓|願|學] △$3$
])
#eng[Dharma gates beyond measure, I vow to realize.]

#classed-block("lang-zh", [
  #ruby[butsu|do|mu|jo|sei|gan|jo][佛|道|無|上|誓|願|成] △$3$ △$1,2,3$
])
#eng[Buddha ways without end△$3$, I vow to △$3$embody△$1,2$ △$3...$.]


#pagebreak()

= Early Morning Sutras

== ○ ○ ○ The Five Remembrances

#ino_note([All O are ten seconds long.])

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
#if "output" in sys.inputs and sys.inputs.output == "html" [
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

#classed-block("lang-zh", [
  #ruby[kan|ji|zai|bo|satsu|gyō|jin|han|nya|ha|ra|mit|ta|ji][觀|自|在|菩|薩|行|深|般|若|波|羅|蜜|多|時]
])
#eng[Avalokiteshvara Bodhisattva, practicing deep Prajna Paramita,]
#classed-block("lang-zh", [
  #ruby[shō|ken|go|un|kai|kū|do|is|sai|ku|yaku][照|見|五|蘊|皆|空|度|一|切|苦|厄]
])
#eng[clearly saw that all five skandhas are empty, transforming all suffering and distress.]
#classed-block("lang-zh", [
  #ruby[sha|ri|shi|shiki|fu|i|kū|kū|fu|i|shiki][舎|利|子|色|不|異|空|空|不|異|色]
])
#eng[Shariputra, form is no other than emptiness, emptiness no other than form;]
#classed-block("lang-zh", [
  #ruby[shiki|soku|ze|kū|kū|soku|ze|shiki][色|即|是|空|空|即|是|色]
])
#eng[form is exactly emptiness, emptiness exactly form;]
#classed-block("lang-zh", [
  #ruby[ju|sō|gyō|shiki|yaku|bu|nyo|ze][受|想|行|識|亦|復|如|是]
])
#eng[sensation, perception, mental reaction, consciousness, are also like this.]
#classed-block("lang-zh", [
  #ruby[sha|ri|shi|ze|sho|hō|kū|sō|fu|shō|fu|metsu][舎|利|子|是|諸|法|空|相|不|生|不|滅]
])
#eng[Shariputra, all things are essentially empty—not born, not destroyed;]
#classed-block("lang-zh", [
  #ruby[fu|kū|fu|jō|fu|zō|fu|gen][不|垢|不|浄|不|増|不|減]
])
#eng[not stained, not pure; without loss, without gain.]
#classed-block("lang-zh", [
  #ruby[ze|ko|kū|chū|mu|shiki|mu|ju|sō|gyō|shiki][是|故|空|中|無|色|無|受|想|行|識]
])
#eng[Therefore in emptiness there is no form, no sensation, perception, mental reaction, consciousness;]
#classed-block("lang-zh", [
  #ruby[mu|gen|ni|bi|zetsu|shin|i][無|眼|耳|鼻|舌|身|意]
])
#eng[no eye, ear, nose, tongue, body, mind,]
#classed-block("lang-zh", [
  #ruby[mu|shiki|shō|kō|mi|soku|hō][無|色|声|香|味|触|法]
])
#eng[no color, sound, scent, taste, touch, thought;]
#classed-block("lang-zh", [
  #ruby[mu|gen|kai|nai|shi|mu|ishiki|kai][無|眼|界|乃|至|無|意|識|界]
])
#eng[no seeing and so on to no thinking;]
#classed-block("lang-zh", [
  #ruby[mu|mu|myō|yaku|mu|mu|myō|jin][無|無|明|亦|無|無|明|尽]
])
#eng[no ignorance and also no ending of ignorance,]
#classed-block("lang-zh", [
  #ruby[nai|shi|mu|rō|shi|yaku|mu|rō|shi|jin][乃|至|無|老|死|亦|無|老|死|尽]
])
#eng[and so on to no old age and death and also no ending of old age and death;]
#classed-block("lang-zh", [
  #ruby[mu|ku|shū|metsu|dō][無|苦|集|滅|道]
])
#eng[no suffering, cause of suffering, cessation, path;]
#classed-block("lang-zh", [
  #ruby[mu|chi|yaku|mu|toku|i|mu|sho|toku|ko][無|智|亦|無|得|以|無|所|得|故]
])
#eng[no wisdom and no attainment.]
#classed-block("lang-zh", [
  #ruby[bo|dai|sat|ta|e|han|nya|ha|ra|mit|ta|ko][菩|提|薩|埵|依|般|若|波|羅|蜜|多|故]
])
#eng[Since there is nothing to attain, the Bodhisattva lives by Prajna Paramita,]
#classed-block("lang-zh", [
  #ruby[shin|mu|kei|ge|mu|kei|ge|ko|mu|u|ku|fu][心|無|罣|礙|無|罣|礙|故|無|有|恐|怖]
])
#eng[with no hindrance in the mind; no hindrance and therefore no fear;]
#classed-block("lang-zh", [
  #ruby[on|ri|is|sai|ten|dō|mu|sō|ku|gyō|ne|han][遠|離|一|切|顛|倒|夢|想|究|竟|涅|槃]
])
#eng[far beyond delusive thinking, right here is Nirvana.]
#classed-block("lang-zh", [
  #ruby[san|ze|sho|butsu|e|han|nya|ha|ra|mit|ta|ko][三|世|諸|仏|依|般|若|波|羅|蜜|多|故]
])
#eng[All Buddhas of past, present and future live by Prajna Paramita,]
#classed-block("lang-zh", [
  #ruby[toku|a|no|ku|ta|ra|san|myaku|san|bo|dai][得|阿|耨|多|羅|三|藐|三|菩|提]
])
#eng[attaining Anuttara-samyak-sambodhi.]
#classed-block("lang-zh", [
  #ruby[ko|chi|han|nya|ha|ra|mit|ta][故|知|般|若|波|羅|蜜|多]
])
#eng[Therefore know that Prajna Paramita is the great mantra, the vivid mantra,]
#classed-block("lang-zh", [
  #ruby[ze|dai|jin|shu|ze|dai|myō|shu][是|大|神|呪|是|大|明|呪]
])
#eng[the unsurpassed mantra, the supreme mantra,]
#classed-block("lang-zh", [
  #ruby[ze|mu|jō|shu|ze|mu|tō|dō|shu][是|無|上|呪|是|無|等|等|呪]
])
#eng[which completely removes all suffering.]
#classed-block("lang-zh", [
  #ruby[nō|jo|is|sai|ku|shin|jitsu|fu|ko][能|除|一|切|苦|真|実|不|虚]
])
#eng[This is truth, not mere formality.]
#classed-block("lang-zh", [
  #ruby[ko|setsu|han|nya|ha|ra|mit|ta|shu][故|説|般|若|波|羅|蜜|多|呪]
])
#eng[Therefore set for the Prajna Paramita mantra,]
#classed-block("lang-zh", [
  #ruby[soku|setsu|shu|watsu][即|説|呪|曰]
])
#eng[set forth this mantra and proclaim:]
#classed-block("lang-zh", [
  #ruby[gya|tei|gya|tei|ha|ra|gya|tei|ha|ra|sō|gya|tei|bo|dhi|so|waka][羯|諦|羯|諦|波|羅|羯|諦|波|羅|僧|羯|諦|菩|薩|婆|訶]
])
#eng[Gate Gate Paragate Parasamgate Bodhi Swaha!]

#pagebreak()

== Sho Sai Myo Kichijo Darani
=== Dharani for Dispelling Misfortune

#ino_note([3 times. Mokugyo throughout.])

#classed-block("lang-zh", [
  #ruby[no|mo|san|man|da|mo|to|nan][南|無|三|曼|多|母|駄|喃]
])
#eng[Veneration to all enlightened ones!]
#classed-block("lang-zh", [
  #ruby[o|ha|ra|chi|ko|to|sha|so|no|nan][阿|跋|囉|底|賀|多|舍|喃]
])
#eng[The incomparable bodhi-power that banishes misfortune!]
#classed-block("lang-zh", [
  #ruby[to|ji|to|en|gya|gya|gya|ki|gya|ki|un|nun][怛|姪|他|唵|佉|佉|佉|呬|佉|呬|吽|吽]
])
#eng[Om! The Buddha of reality, wisdom, nirvana!]
#classed-block("lang-zh", [
  #ruby[shi|fu|ra|shi|fu|ra|ha|ra|shi|fu|ra|ha|ra|shi|fu|ra][入|嚩|囉|入|嚩|囉|鉢|囉|鉢|囉]
])
#eng[Light, light! Great light, great light!]
#classed-block("lang-zh", [
  #ruby[chi|shu|sa|chi|shu|sa|shu|shi|ri|shu|shi|ri][底|哩|底|哩|娑|婆|訶|娑|婆|訶]
])
#eng[With no categories, this mysterious power saves all beings.]
#classed-block("lang-zh", [
  #ruby[so|ha|ja|so|ha|ja|sen|chi|gya|shi|ri|ei][莎|婆|訶|莎|婆|訶|戰|地|伽|隸|娑|婆|訶]
])
#eng[Misfortune goes, happiness comes.]
#classed-block("lang-zh", [
  #ruby[so|mo|ko][莎|婆|訶]
])
#eng[Swaha!]

#pagebreak()

*Leader:*
Our words ring out through space beyond the stars;
their virtue and compassion echo back from all the many beings;
we recite the "Great Prajna Paramita Heart Sutra"
#text(size: 0.8em, [Or: Maka Hannya Haramita Shin Gyo])
and the "Sho Sai Myo Kichijo Darani"
for renewal of the Buddha-mind in fields and forests,
homes and streets, throughout the world,
in grateful thanks to all our many guides along the ancient way;

#v(1em)

*Assembly:*
●All Buddhas throughout space and ○time;
all Bodhisattvas, Mahasattvas ○;
the great Prajna Paramita ○.

#pagebreak()

= Sesshin Dedication
*in gassho*

*Leader:*
Buddha nature pervades the whole universe, existing right here now. With our reciting of "The Great Prajna Paramita Heart Sutra" (Maka Hannya Haramita Shingyo) and the "Sho Sai Myo Kichijo Dharani," let us unite with:

#v(1em)

*Assembly:*
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

*Leader:*

All founding teachers, past, present, future, Dai Busso.
Let true Dharma continue, Sangha relations become complete;

#v(1em)

*Assembly:*

●All Buddhas throughout space and time; ○
All Bodhisattvas, Mahasattvas; ○
The great Prajna Paramita ○

#pagebreak()

= ○ ● Torei Zenji: Bodhisattva's Vow

*Leader:*

I am only a simple disciple, ○
but I offer these respectful words:

#v(1em)

*Assembly:*

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

#ino_note([Mokugyo throughout])

#classed-block("lang-zh", [
  #ruby[kan|ze|on][觀|世|音]
])
#eng[Kannon!]
#classed-block("lang-zh", [
  #ruby[na|mu|butsu][南|無|佛]
])
#eng[Veneration to the Buddha!]
#classed-block("lang-zh", [
  #ruby[yo|butsu|u|in][與|佛|有|因]
])
#eng[With Buddha's cause,]
#classed-block("lang-zh", [
  #ruby[yo|butsu|u|en][與|佛|有|緣]
])
#eng[With Buddha's effect;]
#classed-block("lang-zh", [
  #ruby[bup|po|so|en][佛|法|相|緣]
])
#eng[Affinity with Buddha, Dharma, Sangha]
#classed-block("lang-zh", [
  #ruby[jo|raku|ga|jo][常|樂|我|淨]
])
#eng[Eternity, bliss, self, purity;]
#classed-block("lang-zh", [
  #ruby[cho|nen|kan|ze|on][朝|念|觀|世|音]
])
#eng[Mornings my thoughts are Kannon,]
#classed-block("lang-zh", [
  #ruby[bo|nen|kan|ze|on][暮|念|觀|世|音]
])
#eng[Evenings my thoughts are Kannon,]
#classed-block("lang-zh", [
  #ruby[nen|nen|ju|shin|ki][念|念|從|心|起]
])
#eng[Thought after thought arises in the mind,]
#classed-block("lang-zh", [
  #ruby[nen|nen|fu|ri|shin][念|念|不|離|心]
])
#eng[Thoughts are not separate from the mind.]

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

*All:*
●All Buddhas throughout space and time; ○
all Bodhisattvas, Mahasattvas; ○
the great prajna paramita ○

#pagebreak()

= Teisho Sutras

== ○ ○ ○ ● On Opening the Dharma V ○
*in gassho*

#ino_note([If you remain in your place during Teisho, use the Daikeisu (big bell). If you move your seat for Teisho, take the inkin with you and use that.])

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
