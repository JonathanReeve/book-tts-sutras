# README

This repository contains a work-in-progress redesign of the sutra book for [Three Treasures Sangha](https://three-treasures-sangha.org/), a lay zen group affiliated with the Diamond Sangha. 

The idea behind this project is to update the book, correcting typographic errors, unifying page numbers between online and print versions, and making it look a little nicer in the process.

The texts are written in Markdown, and exported to HTML (for the web) and PDF (for print) using [Pandoc](https://pandoc.org/). All of this is done automatically, using [GitHub Actions](https://docs.github.com/en/actions).

# How to Edit 

To edit any of these documents, just click the pencil icon at the top right corner of any markdown file (files ending in *.md). If you don't already have a GitHub account, you'll be asked to create one. 

The text is styled in Markdown, a super-simple plain text markup language. Italics are usually written with underscores: _italics_, boldface with stars: **bold**, and links with brackets and parentheses: [a link](https://www.markdownguide.org/). You can use standard key combinations like Control+I to insert these characters. For a more complete guide, see [GitHub's documentation on Markdown](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax), or [The Markdown Guide](https://www.markdownguide.org/). 


# Roadmap

Almost nothing has been implemented, yet, but here are some ideas: 

 - Export to HTML by default, but make a PDF from the HTML. This way we only have to write one stylesheet. 
 - Use [Ruby annotations](https://www.w3schools.com/tags/tag_ruby.asp) to align Chinese characters with their romanizations, pronunciations, and translations. 
 - Allow users to toggle on or off each of those features, i.e., to hide the Chinese characters or the translations, as desired. 
 - Add notes to each sutra, with a short history, links to other versions, and so on. 
 - Normalize spelling, of, e.g., "prajna paramita" to prajñā pāramitā

# Technical Details

The source markdown files are in `source/`. The `Makefile` runs `pandoc` which uses the templates in `templates/` to output HTML and then PDF.
