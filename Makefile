# Makefile for converting sutras.md to sutras.pdf and sutras.html

# Variables
MD_FILE = sutras.md
BASE_NAME = sutras

# Output files
PDF_FILE = $(BASE_NAME).pdf
HTML_FILE = $(BASE_NAME).html

# Default target
all: $(PDF_FILE) $(HTML_FILE)

# Rule to convert markdown to PDF
%.pdf: $(MD_FILE)
	pandoc $(MD_FILE) -o $@

# Rule to convert markdown to HTML
%.html: $(MD_FILE)
	pandoc $(MD_FILE) -o $@

# Clean up generated files
clean:
	rm -f $(BASE_NAME).pdf $(BASE_NAME).html

.PHONY: all clean
