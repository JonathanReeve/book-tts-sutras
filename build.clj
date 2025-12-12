#!/usr/bin/env bb

;; A single-file, barebones static site generator for the Sutra book.
;; This script contains all logic, content, and styles.
;; To run: ./build.clj
;; Output: ./public/index.html

(require '[clojure.java.io :as io]
         '[hiccup.core :as h])

;; -- 1. JavaScript for Interactivity --
;; The JS is defined as a string and will be embedded directly in the HTML.
(def javascript
  "document.addEventListener('DOMContentLoaded', () => {
      const romajiToggle = document.getElementById('toggle-romaji');
      const translationToggle = document.getElementById('toggle-translation');

      function toggleElements(selector, show, displayType = 'block') {
          document.querySelectorAll(selector).forEach(el => {
              el.style.display = show ? displayType : 'none';
          });
      }

      romajiToggle.addEventListener('change', (e) => {
          toggleElements('rt', e.target.checked, 'inline-block');
      });

      translationToggle.addEventListener('change', (e) => {
          toggleElements('.translation-lang', e.target.checked, 'block');
      });

      // Set initial state from checkbox default
      toggleElements('rt', romajiToggle.checked, 'inline-block');
      toggleElements('.translation-lang', translationToggle.checked, 'block');
  });")


;; -- 2. Styles as a String --
;; All CSS is defined here as a raw string.
(def styles
  "body {
     font-family: Iowan Old Style, Apple Garamond, Baskerville, Times New Roman, Droid Serif, Times, Source Serif Pro, serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol;
     line-height: 1.6;
     display: flex;
   }
   h1, h2, h3 { font-weight: normal; }
   .sidebar {
     width: 200px;
     padding: 1em;
     border-right: 1px solid #ccc;
   }
   .main-content {
     flex: 1;
     padding: 1em;
   }
   .trilingual-line { margin-bottom: 1em; }
   ruby {
     display: inline-flex;
     flex-direction: column-reverse;
     font-size: 1.5em;
   }
   rt {
     font-size: 0.5em;
     color: #666;
     display: none;
   }
   .translation-lang {
     color: #444;
     font-style: italic;
     margin-left: 1em;
     display: none;
   }
   .ino-annotation {
     font-family: monospace;
     font-size: 0.8em;
     font-weight: bold;
     color: red;
     vertical-align: super;
   }
   @media print {
     body { display: block; }
     .sidebar { display: none; }
     rt { display: inline-block; }
     .translation-lang { display: block; }
   }")


;; -- 3. Helper Functions --
;; Functions to generate special markup.
(defn ino [symbol]
  [:span.ino-annotation (str symbol)])

(defn trilingual [main-text romaji-text english-text]
  [:div.trilingual-line
   [:p.main-lang
    [:ruby main-text [:rt romaji-text]]]
   [:p.translation-lang english-text]])


;; -- 4. Sutra Content --
;; The actual content of the sutras, represented as Clojure data.
(def sutra-content
  [[:h1 "Three Treasures Sangha Sutra Book"]
   [:h2 (ino "'IO") " Shiku Seigan Mon " (ino "'IC")]
   (trilingual "衆生無邊誓願度" "Shu jo mu hen sei gan do" "All beings beyond number, I vow to free.")
   (trilingual "煩惱無盡誓願斷" "Bon no mu jin sei gan dan" "Blind passions without cease, I vow to see through.")
   (trilingual "法門無量誓願學" "Ho mon mu ryo sei gan gaku" "Dharma gates beyond measure, I vow to realize.")
   (trilingual "佛道無上誓願成" "Butsu do mu jo sei gan jo" "Buddha ways without end, I vow to embody.")

   [:h2 (ino "'O O O'") " The Five Remembrances"]
   [:p "1. " (ino "'C'") " I am of the nature to grow old."]
   [:p "There is no way to escape growing old. " (ino "'O'")]
   [:p "2. " (ino "'C'") " I am of the nature to have ill health."]
   [:p "There is no way to escape having ill health. " (ino "'O'")]])


;; -- 5. Page Layout --
;; The main Hiccup template for the page.
(defn page-layout [content]
  [:html
   [:head
    [:meta {:charset "UTF-8"}]
    [:title "Three Treasures Sangha Sutra Book"]
    [:style styles]] ; Embed styles directly
   [:body
    [:div.sidebar
     [:h3 "Options"]
     [:div
      [:input#toggle-romaji {:type "checkbox"}]
      [:label {:for "toggle-romaji"} "Show Romaji"]]
     [:div
      [:input#toggle-translation {:type "checkbox"}]
      [:label {:for "toggle-translation"} "Show Translation"]]]

    (apply vector :div.main-content content)

    [:script javascript]]]) ; Embed javascript directly


;; -- 6. Main Build Function --
(defn -main []
  (println "Building sutra book...")
  (.mkdirs (io/file "public"))
  (let [html-content (h/html (page-layout sutra-content))]
    (spit "public/index.html" html-content))
  (println "Build complete. Open public/index.html to view."))

;; Run the build
(-main)
