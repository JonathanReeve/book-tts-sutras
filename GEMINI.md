# Roadmap

- [ ] Make sure we get line breaks working as expected
  - [ ] Verse and poetry should have line breaks after each line
  - [ ] Typically this is achieved by putting a backslash at the end of the line
  - [ ] But since we have so much verse in this, maybe we could use a function in the style.typ and apply it everywhere? That way we wouldn't have to have so many backslashes
- [ ] Concentrate on making this beautiful typography. 
  - [ ] We want large, legible type in a beautiful font, 
  - [ ] with lots of negative space around it to allow the design to breathe.
  - [ ] Ligatures and other standard typographical devices should be added.
  - [ ] All other well-known advice with respect to typography should be followed: designing good kerning, good line spacing, and so on
- [ ] Always make sure we have all three outputs building successfully: 
  1. the print PDF (with no percussion annotations and no ino notes) 
  2. the Ino PDF (with percussion annotations and ino notes) 
  3. the HTML (with no ino annotations and no ino notes) 
- [ ] Ensure that Chinese characters are displaying correctly 
- [ ] Ensure that the HTML version has a sidebar which toggles on and off various elements: 
  - [ ] Toggle on/off chinese characters
  - [ ] Toggle on/off ino annotations
  - [ ] Toggle on/off hyperlinks to explanatory notes
- [ ] Add a table of contents to the beginning
- [ ] Change the paper size to something more narrow, for verse 
- [ ] Use proper citations for the book sources listed in the footnotes 
- [ ] Create [Hyragriva YAML entries](https://github.com/typst/hayagriva/blob/main/docs/file-format.md) for each book mentioned in a citation
- [ ] Regularize all spellings, following editorial conventions listed in the README
- [ ] Add a bibliography at the end
- [ ] Add more explanatory notes to the notes: we want to explain sanskrit, chinese, and japanese terms like _prajna paramita_ and _skandhas_ and everything else
  - [ ] In the HTML version, we can automatically set up hyperlinks for each explanatory note, such that clicking on _skandhas_ takes us to the glossary entry for that 
  - [ ] This should be an option which, like the other options (to toggle Chinese characters, toggle pronunciation notes, etc) should be toggle-able

