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
- [ ] Fix bibliography. On page 47 of "Ino Book 2023.pdf" there is a list of sources. Make sure each text with a source has a related bibliographic entry. 
- [ ] Fix ruby text display: the ruby annotations above chinese characters don't have enough whitespace around them to be readable as syllables. Find a way to give these enough space and also make the chinese character spacing consistent. How does latex do it? Find a way to make it beautiful. 
- [ ] Add in missing sections from PDF
- [ ] Add title page
- [ ] Make some things into includes. The Jukai ceremony includes Ti-Sarana and Purification, for example. Rather than just copy-paste let's write a function that includes it elsewhere. 
- [ ] Make yourself a skill for good design and typography, based on https://github.com/nutlope/hallmark and other design skillsets, but geared for Typst. Then apply this skill to revising the book. 
- [ ] Proofread everything

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
