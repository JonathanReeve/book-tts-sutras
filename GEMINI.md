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
