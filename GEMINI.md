# Roadmap

- [x] Make sure we get line breaks working as expected
  - [x] Verse and poetry should have line breaks after each line
  - [x] Implemented a global rule in `style.typ` to treat newlines as line breaks.
- [x] Concentrate on making this beautiful typography. 
  - [x] Large, legible type with Libertinus Serif and Noto CJK.
  - [x] Lots of negative space and narrow paper size for verse.
  - [x] Ligatures and kerning enabled.
- [x] Always make sure we have all three outputs building successfully: 
  1. the print PDF (with no percussion annotations and no ino notes) 
  2. the Ino PDF (with percussion annotations and ino notes) 
  3. the HTML (with no ino annotations and no ino notes) 
- [x] Ensure that Chinese characters are displaying correctly 
  - [x] Increased size significantly (tripled) for legibility.
- [x] Ensure that the HTML version has a sidebar which toggles on and off various elements: 
  - [x] Toggle on/off chinese characters
  - [x] Toggle on/off ino annotations
  - [x] Toggle on/off hyperlinks to explanatory notes
- [x] Add a table of contents to the beginning
- [x] Change the paper size to something more narrow, for verse 
- [x] Use proper citations for the book sources listed in the footnotes 
- [x] Create [Hyragriva YAML entries](https://github.com/typst/hayagriva/blob/main/docs/file-format.md) for each book mentioned in a citation
- [x] Regularize all spellings, following editorial conventions listed in the README
- [x] Add a bibliography at the end
- [x] Add more explanatory notes to the notes: we want to explain sanskrit, chinese, and japanese terms like _prajna paramita_ and _skandhas_ and everything else
  - [x] In the HTML version, automated hyperlinks to the glossary.
  - [x] Toggle-able via the sidebar.

## New Tasks
- [x] Add github action based on nix which runs make and has all the requisite tools installed
- [x] Fix bibliography. On page 47 of "Ino Book 2023.pdf" there is a list of sources. Make sure each text with a source has a related bibliographic entry. 
- [x] Fix ruby text display: the ruby annotations above chinese characters don't have enough whitespace around them to be readable as syllables. Find a way to give these enough space and also make the chinese character spacing consistent. How does latex do it? Find a way to make it beautiful. 
- [x] Add in missing sections from PDF
- [x] Add title page
- [x] Make some things into includes. The Jukai ceremony includes Ti-Sarana and Purification, for example. Rather than just copy-paste let's write a function that includes it elsewhere. 
- [x] Make yourself a skill for good design and typography, based on https://github.com/nutlope/hallmark and other design skillsets, but geared for Typst. Then apply this skill to revising the book. 
- [x] Proofread everything

### Page-by-Page Typographic Review TODOs
- [ ] **Page Numbers & Pagination**: Enable page numbering in Typst (`#set page(numbering: "1")`) and position page numbers consistently.
- [ ] **Front Matter Page Numbering**: Suppress page numbers on the Title Page (p. 1) and use unnumbered/Roman pages for Table of Contents (pp. 2–3), starting page 1 on "Opening Recitations" (p. 4).
- [ ] **Facing Page Binding**: Set `#set page(binding: left)` in `style.typ` so inside/outside margins flip correctly across facing pages (recto/verso).
- [ ] **Running Headers**: Add running headers (e.g., chapter/sutra title on verso, book title on recto) to assist navigation.
- [ ] **CJK & Serif Harmony**: Switch CJK font from `Noto Sans CJK JP` to `Noto Serif CJK JP` so Chinese characters harmonize optically with Libertinus Serif body text.
- [ ] **CJK Character Weight**: Fix ultra-light rendering of Chinese characters by setting regular font weight for CJK text.
- [ ] **Ruby Text Line-Wrap**: Prevent orphan Romaji ruby syllables (e.g. `ze` on top of p. 9, `bo` on top of p. 10) by keeping ruby blocks grouped within non-breaking line units.
- [ ] **Footnote Citation Parens**: Remove redundant parens in footnote citations (e.g. `See (Author 1985)` -> `See Author 1985`).
- [ ] **Footnote Number Spacing**: Add proper spacing between footnote markers and footnote text in the footer (fix `1Translation...`).
- [ ] **Eliminate Low-Density Page Spills**: Fix 4-line orphan page spill on page 59 (*Mangala Sutta*) and balance short pages (p. 6, 19, 22, 65).
- [ ] **H1 Heading Wraps**: Fix awkward line breaking in long H1 headers (e.g., `Diamond Sangha Jukai and Renewal Ceremony` on p. 60).
- [ ] **Recto Chapter Starts**: Set major section breaks to start on odd (recto) pages (`pagebreak(to: "odd")`).
- [ ] **Table of Contents Styling**: Format level-1 chapter titles in bold with extra spacing in the TOC.
- [ ] **Glossary Styling**: Format glossary terms with hanging indents and distinct term/definition spacing (pp. 66–71).
- [ ] **Bibliography Hanging Indents**: Change bibliography entries from center/block indents to standard Chicago author-date hanging indents (p. 72).
- [ ] **Sesshin Dedication Phonetics**: Clean up capitalization in phonetic guides on page 14 (e.g., `prajApati` -> `prajāpati`).


## Completed Tasks
- [x] Bibliography and Hayagriva setup.
- [x] Glossary with automated linking and state management (to avoid linking within the glossary itself).
- [x] HTML Sidebar with comprehensive toggles.
- [x] Narrow format (125mm x 200mm) for portable verse books.
- [x] Regularized IAST and Pinyin spellings throughout.
- [x] Native HTML `<ruby>` tag support for the web version.
- [x] Fixed all-caps in H1 headers.
- [x] Tripled size of Chinese characters and Ruby text.
- [x] Global newline-to-linebreak rule for verse-heavy content.
