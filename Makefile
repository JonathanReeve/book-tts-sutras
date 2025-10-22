# Makefile for converting sutras.md to sutras.pdf and sutras.html

# Variables
SRC_DIR = source
TARGET_DIR = target
MD_FILES = $(wildcard $(SRC_DIR)/*.md)
BASE_NAMES = $(patsubst $(SRC_DIR)/%.md,%,$(MD_FILES))
HTML_FILES = $(patsubst %,$(TARGET_DIR)/%.html,$(BASE_NAMES))

# Default target
all: $(HTML_FILES)

# Rule to convert markdown to HTML
$(TARGET_DIR)/%.html: $(SRC_DIR)/%.md translation-filter.py
	@mkdir -p $(TARGET_DIR)
	pandoc $< -o $@ --template=templates/template.html --standalone --embed-resources --filter ./translation-filter.py

# Clean up generated files
clean:
	rm -f $(TARGET_DIR)/*.html

.PHONY: all clean
