# Three Treasures Sangha Sutra Book

This repository contains a work-in-progress redesign of the sutra book for [Three Treasures Sangha](https://three-treasures-sangha.org/), a lay zen group affiliated with the Diamond Sangha. 

The idea behind this project is to update the book, correcting typographic errors, unifying page numbers between online and print versions, and making it look a little nicer in the process.

The texts are written in Markdown, and exported to HTML (for the web) and PDF (for print) using [Elm](https://elm-lang.org/). All of this is done automatically, using [GitHub Actions](https://docs.github.com/en/actions).

# Contents of this Repository

 - content/sutras.md: this is the main text of the sutra book. Edit this one. 
 - src/Main.elm: the main logic for parsing the sutra book and creating the outputs. 
 - target/: this directory contains files produced from the code. Don't edit these. 

# How to Edit 

To edit any of these documents, just click the pencil icon at the top right corner of any markdown file (files ending in *.md). If you don't already have a GitHub account, you'll be asked to create one. 

The text is styled in Markdown, a super-simple plain text markup language. Italics are usually written with underscores: _italics_, boldface with stars: **bold**, and links with brackets and parentheses: [a link](https://www.markdownguide.org/). You can use standard key combinations like Control+I to insert these characters. For a more complete guide, see [GitHub's documentation on Markdown](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax), or [The Markdown Guide](https://www.markdownguide.org/). 

## Principles

This sutra book needs to be: 

1. **Legible**: it should be reasonably clear what everything does, for future maintainers to be able to work with. 
2. **Future-proof**: use open-source technologies that won't quickly go obsolete
3. **Unified**: we should have one version of each text, which can produce various outputs. This way we won't have to update several versions of a text, or deal with textual variations or diverging page numbers. 

## Technologies 

In keeping with Zen coding aesthetics, this project tries to stay as close as possible to a bare-bones static website, using HTML, CSS, and JavaScript. However, as HTML can balloon significantly, and can be difficult to manually maintain, we'll write all the content in a lightweight markup language, Markdown, and use another language, Elm, that can transform that to HTML, CSS, and JavaScript. 

## Outputs 

This project effectively has three outputs: 

1. The website, an interactive HTML document for this sutra book.
2. The main PDF, which will be printed out on paper. 
3. The Ino PDF, which is just the main PDF plus ino percussion annotations. 

### The Sutra Book Website 

By default, the text looks almost exactly the same as the print sutra book. However, a sidebar with some checkboxes can enable new features like annotations, footnotes, Chinese characters, and Ino percussion annotations. All of these are optional, and can be toggled on or off. 

### The Sutra Book Main PDF 

The website is the main output, but we can produce a PDF output, for print, with a print.css stylesheet containing print-specific styles. The print styles should remove the interactive elements like checkboxes, extra features like Chinese characters and ino annotations, and format everything nicely for the page. 

### The Sutra Book Ino PDF

This is identical to the main PDF, but adds in percussion annotations.

# Roadmap

Almost nothing has been implemented, yet, but here are some ideas: 

 - Export to HTML by default, but make a PDF from the HTML. This way we only have to write one stylesheet. 
 - Use [Ruby annotations](https://www.w3schools.com/tags/tag_ruby.asp) to align Chinese characters with their romanizations, pronunciations, and translations. 
 - Allow users to toggle on or off each of those features, i.e., to hide the Chinese characters or the translations, as desired. 
 - Add notes to each sutra, with a short history, links to other versions, and so on. 
 - Normalize spelling, of, e.g., "prajna paramita" to prajñā pāramitā

# Technical Details

The source markdown files are in `content/`. Elm converts the markdown to HTML. 
  
## Zen Markdown

Zen Markdown is a superset of Markdown with a few additions. 

### Trilingual Translations

One new feature of this markup is trilingual translations. 

This allows us to have Chinese, Japanese (rōmaji), and English side-by-side, and to toggle them on and off. 

```markdown
<trilingual-translation>
衆生(Shu jo) 無邊(mu hen) 誓願度(sei gan do)  
| All beings beyond number, I vow to free.
煩惱(Bon no) 無盡(mu jin) 誓願斷 (sei gan dan) 
| Blind passions without cease, I vow to see through.
法門(Ho mon) 無量(mu ryo) 誓願學(sei gan gaku)  
| Dharma gates beyond measure, I vow to realize.
佛道(Butsu do)  無上(mu jo) 誓願成(sei gan jo) 
| Buddha ways without end, I vow to embody .
</trilingual-translation>
```

That's basically just a shorthand way of writing : 

```html
<ruby>衆生<rt>Shu jo</rt></ruby>
<ruby>無邊<rt>mu hen</rt></ruby>
<ruby>誓願度<rt>sei gan do</rt></ruby>
```

### Ino Annotations

The chant leader (_ino_) will usually punctuate chants with closed (muted) or open (resonant) hits on a _kei_ (磬子, a large bell) or _rin_ (鈴, a smaller bell), an _inkin_ (引鏧, a small, handheld bell), or a _mokugyo_ (木魚, a wooden fish). 

|               | Markup | Rendered |
|:-------------:|:------:|:--------:|
| Kei, Open     | @{O}   | ▢        |
| Kei, Closed   | @{C}   | ▣        |
| Inkin, Open   | @{IO}  | △        |
| Inkin, Closed | @{IC}  | ▲        |
| Mokugyo       | @{X}   | 🐟       |

Sometimes there are notes for the _ino_ marked up like `@{Note: ... }`. 

