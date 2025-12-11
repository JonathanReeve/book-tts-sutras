# Three Treasures Sangha Sutra Book

## Principles

This sutra book needs to be: 

1. **Legible**: it should be reasonably clear what everything does, for future maintainers to be able to work with. 
2. **Future-proof**: use open-source technologies that won't quickly go obsolete
3. **Unified**: we should have one version of each text, which can produce various outputs. This way we won't have to update several versions of a text, or deal with textual variations or diverging page numbers. 

# Technologies 

In keeping with Zen coding aesthetics, this project tries to stay as close as possible to a bare-bones static website, using HTML, CSS, and JavaScript. However, as HTML can balloon significantly, and can be difficult to manually maintain, we'll write all the content in a lightweight markup language, Markdown, and use another language, Elm, that can transform that to HTML, CSS, and JavaScript. 

# Outputs 

This project effectively has three outputs: 

1. The website, an interactive HTML document for this sutra book.
2. The main PDF, which will be printed out on paper. 
3. The Ino PDF, which is just the main PDF plus ino percussion annotations. 

## The Sutra Book Website 

By default, the text looks almost exactly the same as the print sutra book. However, a sidebar with some checkboxes can enable new features like annotations, footnotes, Chinese characters, and Ino percussion annotations. All of these are optional, and can be toggled on or off. 

## The Sutra Book Main PDF 

The website is the main output, but we can produce a PDF output, for print, with a print.css stylesheet containing print-specific styles. The print styles should remove the interactive elements like checkboxes, extra features like Chinese characters and ino annotations, and format everything nicely for the page. 

## The Sutra Book Ino PDF

This is identical to the main PDF, but adds in percussion annotations.
