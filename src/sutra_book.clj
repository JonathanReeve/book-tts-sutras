(ns sutra-book
  (:require [nextjournal.clerk :as clerk]))

(defn ino [text]
  [:span {:style {:font-family "monospace"
                  :font-size "0.8em"
                  :font-weight "bold"
                  :color "red"
                  :vertical-align "super"}}
   text])

(defn note [text]
  [:p.text-sm.text-gray-500
   [:span.font-bold "Note:"]
   text])

;; # Three Treasures Sangha
;; ## Sutra Book

;; ## `(ino "IO IC")` Shiku Seigan Mon (^) `(ino "IO")`
;; ### Four Infinite Vows 
(clerk/html
 [:div
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "衆生" [:rt "Shu jo"]] " " [:ruby "無邊" [:rt "mu hen"]] " " [:ruby "誓願度" [:rt "sei gan do"]] " " (ino "IO3")]
   [:p.english [:i "All beings beyond number, I vow to free."]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "煩惱" [:rt "Bon no"]] " " [:ruby "無盡" [:rt "mu jin"]] " " [:ruby "誓願斷" [:rt "sei gan dan"]]]
   [:p.english [:i "Blind passions without cease, I vow to see through."]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "法門" [:rt "Ho mon"]] " " [:ruby "無量" [:rt "mu ryo"]] " " [:ruby "誓願學" [:rt "sei gan gaku"]] " " (ino "IO3")]
   [:p.english [:i "Dharma gates beyond measure, I vow to realize."]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "佛道" [:rt "Butsu do"]] " " (ino "IO3") " " [:ruby "無上" [:rt "mu jo"]] " " [:ruby "誓願成" [:rt "sei gan jo"]] " " (ino "IO1,2,3")]
   [:p.english [:i "Buddha ways without end" (ino "IO3") ", I vow to " (ino "IO3") "embody" (ino "IO1,2") " " (ino "IO3...") "."]]]])

;; # Early Morning Sutras
;; ## `(ino "O O O")` The Five Remembrances

(note "All O are ten seconds long.")

;; 1. `(ino "C")` I am of the nature to grow old.
;; There is no way to escape growing old. `(ino "O")`
;; 2. `(ino "C")` I am of the nature to have ill health.
;; There is no way to escape having ill health. `(ino "O")`
;; 3. `(ino "C")` I am of the a nature to die.
;; There is no way to escape death. `(ino "O")`
;; 4. `(ino "C")` All that is dear to me and everyone I love
;; are of the nature to change.
;; There is no way to escape being separated from them. `(ino "O")`
;; 5. `(ino "C")` My actions are my only true belongings.
;; I cannot escape the consequences of my actions.
;; My actions are the ground upon which I stand. `(ino "O O O")`

;; ## `(ino "O O O C")` Purification `(ino "O")` (^)
;; All the evil karma ever created by me since of old, `(ino "O3")`
;; on account of my beginningless greed, hatred, and ignorance,
;; born of my conduct, speech and thought,
;; I `(ino "O3")` now confess `(ino "O3")` openly and `(ino "C1,2 O3")` fully.

;; # Morning Sutra Service

;; ## `(ino "O O O")` Ti-Sarana `(ino "C")` (^)

;; Buddham saranam gacchami;
;; dhammam saranam gacchami;
;; sangham saranam gacchami.

;; I take refuge in the Buddha:
;; I take refuge in the Dharma;
;; I take refuge in the Sangha.

;; Buddham saranam gacchami;
;; dhammam saranam gacchami;
;; sangham saranam gacchami. `(ino "O")`

;; ## `(ino "O O")` Vandana `(ino "C")` (^)

;; Namo tassa bhagavato arahato sammasambuddhasa `(ino "O")`

;; ## The Great Prajna Paramita Heart Sutra

(clerk/html
 [:div
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "觀" [:rt "Kan"]] " " [:ruby "自在" [:rt "jizai"]] " " [:ruby "菩薩" [:rt "bosatsu"]] " " [:ruby "行" [:rt "gyō"]] " " [:ruby "深" [:rt "jin"]] " " [:ruby "般若" [:rt "hannya"]] " " [:ruby "波羅蜜多" [:rt "haramitta"]] " " [:ruby "時" [:rt "ji"]]]
   [:p.english [:i "Avalokiteshvara Bodhisattva, practicing deep Prajna Paramita,"]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "照" [:rt "shō"]] " " [:ruby "見" [:rt "ken"]] " " [:ruby "五蘊" [:rt "go un"]] " " [:ruby "皆" [:rt "kai"]] " " [:ruby "空" [:rt "kū"]] " " [:ruby "度" [:rt "do"]] " " [:ruby "一切" [:rt "issai"]] " " [:ruby "苦厄" [:rt "ku yaku"]]]
   [:p.english [:i "clearly saw that all five skandhas are empty, transforming all suffering and distress."]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "舎利子" [:rt "sharishi"]] " " [:ruby "色" [:rt "shiki"]] " " [:ruby "不異" [:rt "fu i"]] " " [:ruby "空" [:rt "kū"]] " " [:ruby "空" [:rt "kū"]] " " [:ruby "不異" [:rt "fu i"]] " " [:ruby "色" [:rt "shiki"]]]
   [:p.english [:i "Shariputra, form is no other than emptiness, emptiness no other than form;"]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "色" [:rt "shiki"]] " " [:ruby "即是" [:rt "soku ze"]] " " [:ruby "空" [:rt "kū"]] " " [:ruby "空" [:rt "kū"]] " " [:ruby "即是" [:rt "soku ze"]] " " [:ruby "色" [:rt "shiki"]]]
   [:p.english [:i "form is exactly emptiness, emptiness exactly form;"]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "受想行識" [:rt "ju sō gyō shiki"]] " " [:ruby "亦復如是" [:rt "yaku bu nyo ze"]]]
   [:p.english [:i "sensation, perception, mental reaction, consciousness, are also like this."]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "舎利子" [:rt "sharishi"]] " " [:ruby "是諸法空相" [:rt "ze sho hō kū sō"]] " " [:ruby "不生不滅" [:rt "fu shō fu metsu"]]]
   [:p.english [:i "Shariputra, all things are essentially empty—not born, not destroyed;"]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "不垢不浄" [:rt "fu kū fu jō"]] " " [:ruby "不増不減" [:rt "fu zō fu gen"]]]
   [:p.english [:i "not stained, not pure; without loss, without gain."]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "是故空中無色" [:rt "ze ko kū chū mu shiki"]] " " [:ruby "無受想行識" [:rt "mu ju sō gyō shiki"]]]
   [:p.english [:i "Therefore in emptiness there is no form, no sensation, perception, mental reaction, consciousness;"]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "無眼耳鼻舌身意" [:rt "mu gen ni bi zetsu shin i"]]]
   [:p.english [:i "no eye, ear, nose, tongue, body, mind,"]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "無色声香味触法" [:rt "mu shiki shō kō mi soku hō"]]]
   [:p.english [:i "no color, sound, scent, taste, touch, thought;"]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "無眼界" [:rt "mu gen kai"]] " " [:ruby "乃至無意識界" [:rt "nai shi mu ishiki kai"]]]
   [:p.english [:i "no seeing and so on to no thinking;"]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "無無明" [:rt "mu mumyō"]] " " [:ruby "亦無無明尽" [:rt "yaku mu mumyō jin"]]]
   [:p.english [:i "no ignorance and also no ending of ignorance,"]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "乃至無老死" [:rt "nai shi mu rōshi"]] " " [:ruby "亦無老死尽" [:rt "yaku mu rōshi jin"]]]
   [:p.english [:i "and so on to no old age and death and also no ending of old age and death;"]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "無苦集滅道" [:rt "mu ku shū metsu dō"]]]
   [:p.english [:i "no suffering, cause of suffering, cessation, path;"]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "無智亦無得" [:rt "mu chi yaku mu toku"]] " " [:ruby "以無所得故" [:rt "i mu sho toku ko"]]]
   [:p.english [:i "no wisdom and no attainment."]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "菩提薩埵" [:rt "bodai sattā"]] " " [:ruby "依般若波羅蜜多故" [:rt "e hannya haramitta ko"]]]
   [:p.english [:i "Since there is nothing to attain, the Bodhisattva lives by Prajna Paramita,"]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "心無罣礙" [:rt "shin mu keige"]] " " [:ruby "無罣礙故" [:rt "mu keige ko"]] " " [:ruby "無有恐怖" [:rt "mu u ku fu"]]]
   [:p.english [:i "with no hindrance in the mind; no hindrance and therefore no fear;"]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "遠離一切顛倒夢想" [:rt "onri issai tendō musō"]] " " [:ruby "究竟涅槃" [:rt "ku gyō nehan"]]]
   [:p.english [:i "far beyond delusive thinking, right here is Nirvana."]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "三世諸仏" [:rt "sanze shobutsu"]] " " [:ruby "依般若波羅蜜多故" [:rt "e hannya haramitta ko"]]]
   [:p.english [:i "All Buddhas of past, present and future live by Prajna Paramita,"]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "得阿耨多羅三藐三菩提" [:rt "toku anokutara sanmyaku sambodai"]]]
   [:p.english [:i "attaining Anuttara-samyak-sambodhi."]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "故知般若波羅蜜多" [:rt "ko chi hannya haramitta"]]]
   [:p.english [:i "Therefore know that Prajna Paramita is the great mantra, the vivid mantra,"]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "是大神呪" [:rt "ze dai jin shu"]] " " [:ruby "是大明呪" [:rt "ze dai myō shu"]]]
   [:p.english [:i "the unsurpassed mantra, the supreme mantra,"]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "是無上呪" [:rt "ze mu jō shu"]] " " [:ruby "是無等等呪" [:rt "ze mu tō dō shu"]]]
   [:p.english [:i "which completely removes all suffering."]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "能除一切苦" [:rt "nō jo issai ku"]] " " [:ruby "真実不虚" [:rt "shin jitsu fu ko"]]]
   [:p.english [:i "This is truth, not mere formality."]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "故説般若波羅蜜多呪" [:rt "ko setsu hannya haramitta shu"]]]
   [:p.english [:i "Therefore set for the Prajna Paramita mantra,"]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "即説呪曰" [:rt "soku setsu shu watsu"]]]
   [:p.english [:i "set forth this mantra and proclaim:"]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "羯諦" [:rt "gyatei"]] " " [:ruby "羯諦" [:rt "gyatei"]] " " [:ruby "波羅羯諦" [:rt "haragyatei"]] " " [:ruby "波羅僧羯諦" [:rt "harasōgyatei"]] " " [:ruby "菩DE薩婆訶" [:rt "bodhi sowaka"]]]
   [:p.english [:i "Gate Gate Paragate Parasamgate Bodhi Swaha!"]]]])

;; # Sho Sai Myo Kichijo Darani
;; Dharani for Dispelling Misfortune

;; `(note "3 times. Mokugyo throughout.")` 

(clerk/html
 [:div
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "南無" [:rt "No mo"]] " " [:ruby "三曼多" [:rt "San man da"]] " " [:ruby "母駄喃" [:rt "Moto nan"]]]
   [:p.english [:i "Veneration to all enlightened ones!"]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "阿" [:rt "O"]] " " [:ruby "跋囉底" [:rt "ha ra chi"]] " " [:ruby "賀多" [:rt "koto sha"]] " " [:ruby "舍" [:rt "sono"]] " " [:ruby "喃" [:rt "nan"]]]
   [:p.english [:i "The incomparable bodhi-power that banishes misfortune!"]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "怛姪他" [:rt "To ji to"]] " " [:ruby "唵" [:rt "en"]] " " [:ruby "佉佉" [:rt "gya gya"]] " " [:ruby "佉呬" [:rt "gya ki"]] " " [:ruby "佉呬" [:rt "gya ki"]] " " [:ruby "吽吽" [:rt "un nun"]]]
   [:p.english [:i "Om! The Buddha of reality, wisdom, nirvana!"]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "入嚩囉" [:rt "Shifu ra"]] " " [:ruby "入嚩囉" [:rt "shifu ra"]] " " [:ruby "鉢囉" [:rt "hara shifu ra"]] " " [:ruby "鉢囉" [:rt "hara shifu ra"]]]
   [:p.english [:i "Light, light! Great light, great light!"]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "底哩" [:rt "Chishu sa"]] " " [:ruby "底哩" [:rt "chishu sa"]] " " [:ruby "娑婆訶" [:rt "shushi ri"]] " " [:ruby "娑婆訶" [:rt "shushi ri"]]]
   [:p.english [:i "With no categories, this mysterious power saves all beings."]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "莎婆訶" [:rt "Soha ja"]] " " [:ruby "莎婆訶" [:rt "soha ja"]] " " [:ruby "戰地" [:rt "sen chi"]] " " [:ruby "伽隸" [:rt "gya shiri"]] " " [:ruby "娑婆訶" [:rt "ei"]]]
   [:p.english [:i "Misfortune goes, happiness comes."]]]
  [:div.trilingual-line
   [:p.chinese-romaji [:ruby "莎婆訶" [:rt "Somo ko"]]]
   [:p.english [:i "Swaha!"]]]])

;; # Zenkai Dedication (^)

;; _Leader_:
;; Our words ring out through space beyond the stars;
;; their virtue and compassion echo back from all the many beings;
;; we recite the "Great Prajna Paramita Heart Sutra"
;; `(ino "Or: Maka Hannya Haramita Shin Gyo")`
;; and the "Sho Sai Myo Kichijo Darani"
;; for renewal of the Buddha-mind in fields and forests,
;; homes and streets, throughout the world,
;; in grateful thanks to all our many guides along the ancient way;

;; _Assembly_:
;; `(ino "C")`All Buddhas throughout space and `(ino "O")`time;
;; all Bodhisattvas, Mahasattvas`(ino "O")`;
;; the great Prajna Paramita`(ino "O")`.

;; # Sesshin Dedication (^)

;; _Leader_:
;; Buddha nature pervades the whole universe, existing right here now. With our reciting of "The Great Prajna Paramita Heart Sutra" (Maka Hannya Haramita Shingyo) and the "Sho Sai Myo Kichijo Dharani," let us unite with:

;; _Assembly_:

;; `(ino "C")` The Ancient Seven Buddhas, Dai Busso
;; `(ino "C")` Shakyamuni Buddha, Dai Busso
;; `(ino "C")` Mahaprajapati Gautami, Dai Busso
;; | maha prajApati go'tami
;; `(ino "C")` Vimalakirti, Dai Busso
;; | vi'mala kIrti
;; `(ino "C")` Patacara, Dai Busso 
;; | p'ta chAra
;; `(ino "C")` Bhadda Kapilani
;; `(ino "C")` Bodhidarma
;; `(ino "C")` Shitou Xiqian 
;; | shure'-toe she-chwen
;; `(ino "C")` Mazu Daoji
;; | ma'-zoo dao'-ee
;; `(ino "C")` Dongshan Liangjie
;; | dong-shan liang-jay
;; `(ino "C")` Pang Yun Jushi
;; | pong yun jew-sure 
;; `(ino "C")` Pang Lingzhao
;; | pong ling-jao
;; `(ino "C")` Liu Tiemo
;; | leo tyeh'-mo
;; `(ino "C")` Jishou Daojen
;; | jee-show dow-ren
;; `(ino "C")` Dahui Zonggao
;; | da-whey zong-gao
;; `(ino "C")` Miao Dao
;; | meow dow
;; `(ino "C")` Miao Zong
;; | meow zong
;; `(ino "C")` Dogen Kigen
;; `(ino "C")` Keizan Jokin
;; `(ino "C")` Daiun Sogaku
;; `(ino "C")` Hakuun Ryoko
;; `(ino "C")` Koun Zenshin
;; `(ino "C")` Single-Mind Aitken
;; `(ino "C")` Dawn-Cloud Aitken

;; _Leader_:

;; All founding teachers, past, present, future, Dai Busso.
;; Let true Dharma continue, Sangha relations become complete;

;; _Assembly_:

;; `(ino "C")`All Buddhas throughout space and time;`(ino "O")`
;; All Bodhisattvas, Mahasattvas;`(ino "O")`
;; The great Prajna Paramita`(ino "O")`

;; # `(ino "O C")` Torei Zenji: Bodhisattva's Vow
    
;; _Leader_:

;; I am only a simple disciple,`(ino "O")`
;; but I offer these respectful words:

;; _Assembly_:

;; When I regard the true nature of the many dharmas,
;; I find them all to be sacred forms
;; of the Tathagata's never-failing essence.
;; Each particle of matter, each moment,
;; is no other than the Tathagata's inexpressible radiance.
;; With this realization, our virtuous ancestors,
;; with compassionate minds and hearts,
;; gave tender care to beasts and birds.

;; Among us, in our own daily lives,
;; who is not reverently grateful for the protections of life:
;; food, drink, and clothing!
;; Though they are inanimate things,
;; they are nonetheless the warm flesh and blood,
;; the merciful incarnations of Buddha.

;; All the more, we can be especially sympathetic
;; and affectionate with foolish people,
;; particularly with someone who becomes a sworn enemy
;; and persecutes us with abusive language.
;; That very abuse conveys the Buddha's boundless loving-kindness.
;; It is a compassionate device to liberate us entirely
;; from the mean-spirited delusions that we have built up
;; with our wrongful conduct from the beginningless past.
;; With our response to such abuse
;; we completely relinquish ourselves
;; and the most profound and pure faith arises.

;; At the peak of each thought a lotus flower opens,
;; and on each flower there is revealed a Buddha.
;; Everywhere is the Pure Land in its beauty.
;; We see fully the Tathagata's radiant light
;; right where we are.
;; May we retain this mind 
;; and extend it throughout the world `(ino "O")`
;; so that we and all beings `(ino "O")`
;; become mature in Buddha's wisdom. `(ino "O")`

;; # `(ino "O C X")` Enmei Jikku Kannon `(ino "V")`Gyo (^) `(ino "O")`

;; `(note "Mokugyo throughout")` 

(clerk/html
 [:div
  [:div.trilingual-line
   [:p.chinese-romaji "Kan ze on"]
   [:p.english [:i "Kannon!"]]]
  [:div.trilingual-line
   [:p.chinese-romaji "Na mu butsu"]
   [:p.english [:i "Veneration to the Buddha!"]]]
  [:div.trilingual-line
   [:p.chinese-romaji "Yo butsu u in"]
   [:p.english [:i "With Buddha's cause,"]]]
  [:div.trilingual-line
   [:p.chinese-romaji "Yo butsu u en"]
   [:p.english [:i "With Buddha's effect;"]]]
  [:div.trilingual-line
   [:p.chinese-romaji "Bup po so en"]
   [:p.english [:i "Affinity with Buddha, Dharma, Sangha"]]]
  [:div.trilingual-line
   [:p.chinese-romaji "Jo raku ga jo"]
   [:p.english [:i "Eternity, bliss, self, purity;"]]]
  [:div.trilingual-line
   [:p.chinese-romaji "Cho nen Kan ze on"]
   [:p.english [:i "Mornings my thoughts are Kannon,"]]]
  [:div.trilingual-line
   [:p.chinese-romaji "Bo nen Kan ze on"]
   [:p.english [:i "Evenings my thoughts are Kannon,"]]]
  [:div.trilingual-line
   [:p.chinese-romaji "Nen nen ju shin ki"]
   [:p.english [:i "Thought after thought arises in the mind,"]]]
  [:div.trilingual-line
   [:p.chinese-romaji "Nen nen fu ri shin"]
   [:p.english [:i "Thoughts are not separate from the mind."]]]])

;; # Dedication (^)

;; The Buddha and his teachers and his many sons and daughters
;; turn the Dharma wheel to show the wisdom of the stones and clouds; 
;; we dedicate the virtues of reciting Torei Zenji's Bodhisattva's Vow and the Enmei Jikku Kannon Gyo to: 
;;   Choro Nyogen, Dai Busso
;;   Hannya Gempo, Dai BUsso
;;   Mita Soen, Dai Busso
;; and to our relatives and companions of the past who rest in deepest samadhi; 

;; _All_: 
;; `(ino "C")`All Buddhas throughout space and time; `(ino "O")` 
;; all Bodhisattvas, Mahasattvas; `(ino "O")`
;; the great prajna paramita `(ino "O")`

;; # Teisho Sutras

;; ## `(ino "O O O C")` On Opening the `(ino "V")`Dharma `(ino "O")` (^)

;; The dharma, incomparably profound and minutely subtle, `(ino "C3")`
;; Is rarely encountered, even in hundreds of thousands of millions of ages; 
;; We now can see it, hear it, accept and hold it; 
;; May we `(ino "C")`completely realize the true `(ino "C")`meaning 
;; Of the Tathagata `(ino "C1,2 O3")`

(note "If you remain in your place during Teisho, use the Daikeisu (big bell). If you move your seat for Teisho, take the inkin with you and use that.")

;; # Evening Sutra Service (^)

;; `(ino "O O O C")` Hakuin Zenji: Song of Zazen `(ino "O")`

;; All beings by nature are Buddha,
;; As ice by nature is water. 
;; Apart from water there is no ice; 
;; Apart from beings, no Buddha. 

;; How sad that people ignore the near 
;; And search for truth afar: 
;; Like someone in the midst of water 
;; Crying out in thirst; 
;; Like a child of a wealthy home 
;; Wandering among the poor. 

;; Lost on dark paths of ignorance, 
;; We wander through the Six Worlds; 
;; From dark path to dark path
;; When shall we be freed from birth and death? 

;; Oh, the zazen of the Mahayana! 
;; To this the highest praise! 
;; Devotion, repentance, training, 
;; The many Paramitas
;; All have their source in zazen. 

;; Those who try zazen even once 
;; Wipe away beginningless crimes. 
;; Where are all the dark paths then? 
;; The Pure Land itself is near 

;; Those who hear this truth even once 
;; And listen with a grateful heart, 
;; Treasuring it, revering it, 
;; Gain blessings without end. 

;; Much more, those who turn about 
;; And bear witness to self-nature,
;; Self nature that is no-nature,
;; Go far beyond mere doctrine. 

;; Here effect and cause are the same; 
;; The Way is neither two nor three. 

;; With form that is no-form, 
;; Going and coming we are never astray; 
;; With thought that is no-thought, 
;; Singing and dancing are the voice of the Law. 

;; Boundless and free is the sky of Samadhi!
;; Bright the full moon of wisdom!
;; Truly, is anything missing now? 
;; Nirvana is right here, before our eyes; `(ino "O")`
;; This very place is the Lotus Land; `(ino "O")`
;; This very body, the Buddha. `(ino "O")`

;; # Dedication (^)

;; _Ino_: 
;; The sky of Samadha and the moonlight of wisdom are the temple of our practice; 
;; our friends and family members guide us as we walk the ancient path; 
;; we dedicate the virtues of reciting Hakuin Zenji's Song of Zazen to: 

;;   Linji Yixuan, Dai Busso; (lin-gee yee-shwen) 
;;   Hakuin Ekaku, Dai Busso; 
  
;; and to the guardians of the Dharma and the protectors of our sacred hall. 

;; _Assembly_: 

;; `(ino "C")` All Buddhas throughout space and time, `(ino "O")`
;; All Bodhisattvas, Mahasattvas, `(ino "O")`
;; The great Praja Paramita. `(ino "O")` 


;; # Dedication (^) 

;; _Ino_: 
;; In the purity and clarity of the Dharmakaya,
;; in the fullness and perfection of the Sambhogakaya, 
;; in the infinite variety of the Nirmanakaya, 
;; we dedicate our sesshin (and our Jkai) and our reciting of 
;; the Great Praja Paramita Heart Sutra to: 
;; (the Maka Hannya Haramita Shin Gyo to:) 

;;   the Ancient Seven Buddhas, Dai Busso,
;;   Shakyamuni Buddha, Dai Busso,
;;   all Founding Teachers, past, present, future, Dai Busso; 
  
;; and for the enlightenment of bushes and grasses,
;; and the many beings of the world; 
;; (insert special dedication when necessary) 

;; _Assembly_: 
;; `(ino "C")` All Buddhas throughout space and time, `(ino "O")` 
;; All Bodhisattvas, Mahasattvas, `(ino "O")`
;; The great Prajna Paramita `(ino "O")`
  
;; # Readings from Dogen

;; ## Zazen Universally Recommended

;; ### 1 

;; Fundamentally speaking, the basis of the Way is perfectly pervasive. How could it be contingent on practice and verification? The vehicle of the Ancestors is naturally unrestricted. Why should we expend sustained effort? Surely the whole being is far beyond defilement; who could believe in a method to polish it? It is never apart from this very place; what is the use of a pilgrimage to practice it? And yet, with just a hair's breadth of distinction, the gap is like tha t between heaven and earth. Once the slightest like or dislike arises, all is confused and the mind is lost.
;; You should know that repeated migrations through eons of time depend on a single moment's reflection; losing your way in this world of defilement derives from your failure to stop deliberation. If you wish to transcend the extreme beyond, just directly accede to the Way.

;; Though you might be proud of your understanding and replete with insight, having gotten hold of the wisdom that knows at a glance, though you may have attained the Way and clarified the Mind, giving rise to the spirit that assaults the heavens, you may still be loitering near the entrance, lacking something of the vital path of liberation. Even in the case of the Buddha, innately wise though he was, we see traces of his six years of sitting erect, and in the case of Bodhidharma, though he succeeded to the Mind seal, we still hear of his famous nine years facing the wall. When even the ancient sages practiced like this, how could people today dispense with pursuing the Way? Therefore, stop your intellectual exercise of investigating words and chasing after talk; study the reverse way, turn the light and shine it back. Body and mind will drop away of themselves, and your original face will appear. If you want such an experience, exert yourselves urgently.

;; ### 2

;; For studying Zen, one should have quiet quarters. Be moderate in food and
;; drink. Cast aside all involvements and discontinue all affairs. Do not think of good or evil; do not preoccupy yourself with right or wrong. Halt the revolutions of your mind, intellect, and consciousness; stop your calculating thoughts, ideas, and perceptions. Do not try to make yourself a Buddha, much less be attached to sitting still.

;; In a place where you can sit regularly, spread a thick mat and place a cushion on it. Sit in either the full lotus or the half lotus position. For the full lotus, first place your right foot on your left thigh; then place your left foot on your right thigh. For the half lotus, simply rest your left foot on your right thigh.

;; Loosen your robe and belt, and arrange them properly. Next, place your right
;; hand on your left foot, and your left on your right palm. Touch the tips of your thumbs together. Then straighten your body and sit erect. Do not lean to the left or right, backward or forward.

;; Your ears should be in line with your shoulders, and your nose in line with
;; your navel. Touch your tongue against the front of your palate and close your lips and teeth. Your eyes should always remain open. Breathe gently through your nose.

;; Once you have regulated your posture, take a breath and exhale fully. Swing
;; to the left and right. Sitting fixedly, think without thoughts. How do you think without thoughts? Nonthinking. This is the essential art of zazen. Zazen is not the practice of dhyana: it is simply the Dharma gate of ease and joy. It is the practice and verification of ultimate bodhi. The genjo koan—baskets and cages cannot capture it!

;; If you grasp the point of this practice, the four elements of your body will become light and easy, your spirit will be fresh and sharp, thoughts will be correct and clear; the flavor of the Dharma will sustain your spirit, and you will be calm, pure, and joyful. Your daily life will express your true natural state. Once you achieve clarification of the truth, you may be likened to a dragon entering the water or a tiger taking to the mountains. You should realize that when Right Thought is present, dullness and agitation cannot intrude. When you arise from sitting, move
;; slowly and arise calmly; do not be hasty or undignified.

;; ### 3

;; When we try zazen, we see that transcending the profane and surpassing the holy, shedding this body while seated and fleeing this while standing, are totally subject to its power. Surely, then, to grasp the turn of a chance presented by a finger, a pole, a needle or a mallet, and to present the verification of accord with a whisk, a fist, a staff or a shout—these are not to be understood through the discriminations of thinking, much less through the practice and verification of supernormal powers. They necessarily represent activity beyond sound and form; how could they fail to provide a standard before knowledge and understanding?

;; Therefore, it does not matter whether one is very smart or very stupid. In this practice there is no distinction between those of sharp and dull faculties. Single-minded exertion is itself pursuit of the Way. Practice and verification are by nature undefiled. Advancement to enlightenment is just an everyday affair. In our world and the other quarters, from the Western Heaven to the Eastern Earth, all equally maintain the Buddha seal, while each enjoys a particular style of teaching. As you are, therefore, devote yourself exclusively to your practice of zazen. There are ten thousand distinctions and a thousand differences, but your fundamental concern is
;; to study Zen and pursue the Way.

;; ### 4

;; Why abandon the seat in your own home to wander in vain through the dusty regions of another land? If you make one false step, you miss what is right before you. Since you already have the functioning essence of a human body, do not pass your days in vain. Maintain the integral work of the Buddha Way. Who can carelessly take pleasure at sparks from flint? Truly, form and substance are like the dew on the grass, and the fortunes of life like a flash of lightning: in an instant they are emptied, in a moment they are lost.

;; Eminent students of the Dharma, you are long accustomed to groping for the elephant. Please do not doubt the true dragon. Apply yourselves to the Way that points directly at reality; honor the one who is beyond learning and free of rank. Accord with the bodhi of all the Buddhas; succeed to the samadhi of all the Ancestors. If you conduct yourself as such a person for a long time, you will become such a person. Your storehouse of treasures will open of itself, and you may use them as you will.

(note "Version by Robert Aitken, based on the translation by Carl Bielefeldt, _Dōgen's Manuals of Zen Meditation_, 1988")


;; ## Actualizing the Fundamental Point

(note "Translation and copyright by Paul Jaffe, _Flowers Fall: a Commentary on Dogen's Genjokoan_, 1996.") 

;; ## The Four Virtues of a Bodhisattva

(note "Translation and copyright by Lew Richmond and Kazuaki Tanahashi, _Moon in a Dewdrop_, 1985. Adapted by Three Treasures Sangha, 2005")


;; ## Dai-O Kokushi: On Zen 

;; ## Song of Enlightenment

(note "Attributed to Yung-chia Hsuan-chue [Yongjia Xuanjue], d. 713. Translation and revisions by Robert Aitken and copyright by the Honolulu Diamond Sangha, 1991.") 

;; ## The Coincidence of Opposites 

(note "Attributed to Shih-T'ou Hsi-ch'ien [Shitou Xiqian], 700–790. Translation and copyright by Nelson Foster and Jack Shoemaker, _The Roaring Stream: A New Zen Reader_, 1996.") 

;; ## Song of the Grass-Roof Hermitage 

(note "Attributed to Shih-T'ou Hsi-ch'ien [Shitou Xiqian], 700–790. Translation and copyright by Taigen Dan Leighton, _Cultivating the Empty Field: the Silent Illumination of Zen Master Hongzhi, 1987]")

;; ## Discourse on Love 

(note "Metta Sutta (Suttanipata 1) adapted by Thich Nhat Hanh for the _Plum Village Chantin Book_")

;; ## Discourse on Happiness

(note "Mahamangala Sutta (Suttanipata 1) adapted by Thich Nhat Hanh for the _Plum Village Chanting Book")