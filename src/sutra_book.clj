(ns sutra-book
  (:require [nextjournal.clerk :as clerk]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1. State Management
;; A single atom to control the visibility of different UI elements.
;; defonce ensures it's not re-evaluated on every file save.
(defonce !ui-state
  (atom {:show-chinese? false
         :show-romaji?  true
         :show-english? true
         :show-ino?     false}))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2. Styling
;; Clerk can embed CSS directly into the page.
(clerk/html
  [:style
   "
body {
  font-family: Iowan Old Style, Apple Garamond, Baskerville, Times New Roman, Droid Serif, Times, Source Serif Pro, serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol;
}
.two-col-layout {
  display: grid;
  grid-template-columns: 250px 1fr;
  gap: 2rem;
}
.sidebar {
  font-size: 0.9rem;
  padding: 0 1rem;
  border-right: 1px solid #eee;
}
.sidebar h3 {
  font-weight: normal;
  border-bottom: 1px solid #eee;
  padding-bottom: 0.5rem;
}
.sidebar label {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  margin-bottom: 0.5rem;
}
.main-content {
  line-height: 1.8;
}
.main-content h1, .main-content h2 {
  font-weight: normal;
  border-bottom: 1px solid #eee;
  padding-bottom: 0.5rem;
  margin-top: 2rem;
}
.trilingual-line {
  margin: 1.5rem 0;
  display: grid;
  gap: 0.25rem;
}
.ruby {
  display: inline-flex;
  flex-direction: column-reverse;
  font-size: 1.8em;
  line-height: 1.2;
}
.rt {
  font-size: 0.4em;
  color: #666;
  opacity: 0.9;
}
.sidenote-parent {
  position: relative;
}
.sidenote {
  position: absolute;
  top: 0;
  left: 105%;
  width: 150px;
  font-size: 0.75rem;
  line-height: 1.4;
  color: #666;
  border-left: 2px solid #ccc;
  padding-left: 0.5rem;
  opacity: 0.9;
}
.ino-annotation {
  font-family: monospace;
  font-size: 0.8em;
  font-weight: bold;
  color: red;
  vertical-align: super;
}
"])

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 3. Content Components & Custom Syntax
;; These functions generate Hiccup and are the building blocks of the sutra book.

(defn ino
  "Original 'ino' annotation helper."
  [symbol]
  [:span.ino-annotation (str symbol)])

(defn trilingual
  "Renders a trilingual line, reacting to the UI state."
  [chinese romaji english]
  (let [state @!ui-state]
    [:div.trilingual-line
     (when (:show-chinese? state)
       [:p.chinese chinese])
     (when (:show-romaji? state)
       [:p.romaji romaji])
     (when (:show-english? state)
       [:p.english [:i english]])]))

(defn sidenote
  "Renders text with a sidenote. Replaces the ^[] syntax."
  [text note]
  [:span.sidenote-parent text [:span.sidenote note]])

(defn ino-note
  "Renders an Ino sidenote, visible only when the toggle is on.
  Replaces the @{} syntax."
  [note]
  (when (:show-ino? @!ui-state)
    (sidenote (ino "♫") note)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4. UI Components

(defn controls
  "Renders the sidebar controls that modify the !ui-state atom."
  []
  (let [state @!ui-state]
    [:div
     [:h3 "Display Options"]
     [:label
      [:input {:type :checkbox
               :checked (:show-chinese? state)
               :on-change #(swap! !ui-state update :show-chinese? not)}]
      "Show Chinese"]
     [:label
      [:input {:type :checkbox
               :checked (:show-romaji? state)
               :on-change #(swap! !ui-state update :show-romaji? not)}]
      "Show Romaji"]
     [:label
      [:input {:type :checkbox
               :checked (:show-english? state)
               :on-change #(swap! !ui-state update :show-english? not)}]
      "Show English"]
     [:label
      [:input {:type :checkbox
               :checked (:show-ino? state)
               :on-change #(swap! !ui-state update :show-ino? not)}]
      "Show Ino Notes"]]))

(defn sidebar
  "Renders the entire sidebar."
  []
  [:div.sidebar
   [controls]
   ;; The TOC would go here. For now, it's just controls.
   ])

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 5. The Sutra Content
;; The main content of the book, represented as a vector of Clojure data.
;; We use our custom functions like `sidenote` and `ino-note` here.

(def sutra-content
  [:div.main-content
   [:h1 "Three Treasures Sangha Sutra Book"]

   [:h2 (ino "'IO") " Shiku Seigan Mon " (ino "'IC")]
   [trilingual "衆生無邊誓願度" "Shu jo mu hen sei gan do" "All beings beyond number, I vow to free."]
   [trilingual "煩惱無盡誓願斷" "Bon no mu jin sei gan dan" "Blind passions without cease, I vow to see through."]
   [trilingual "法門無量誓願學" "Ho mon mu ryo sei gan gaku" "Dharma gates beyond measure, I vow to realize."]
   [trilingual "佛道無上誓願成" "Butsu do mu jo sei gan jo" "Buddha ways without end, I vow to embody."]

   [:h2 (ino "'O O O'") " The Five Remembrances"]
   (clerk/md
     "1. I am of the nature to grow old. There is no way to escape growing old.")
   (clerk/md
     "2. I am of the nature to have ill health. There is no way to escape having ill health.")
   (clerk/md
     "3. I am of the nature to die. There is no way to escape death.")
   (clerk/md
     "4. All that is dear to me and everyone I love are of the nature to change. There is no way to escape being separated from them.")
   (clerk/md
     "5. My actions are my only true belongings. I cannot escape the consequences of my actions. My actions are the ground upon which I stand.")
    
   [:p "Here is an example of a sidenote. " (sidenote "This text" "This is the note that appears on the side.")]
   [:p "Here is an example of an Ino percussion note. " (ino-note "A short, sharp clap.")]

   ])

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 6. Main Layout
;; The top-level component that lays out the entire page.
;; Clerk will render the result of the last form in the file, which is this.
[:div.two-col-layout
 [sidebar]
 sutra-content]
