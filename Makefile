SRC = src/sutra_book.typ
PUBLIC = public

HTML_OUT = $(PUBLIC)/sutra_book.html
INO_PDF_OUT = $(PUBLIC)/sutra_book_ino.pdf
PRINT_PDF_OUT = $(PUBLIC)/sutra_book_print.pdf

NOTO_SANS_CJK = $(shell nix-build --no-out-link '<nixpkgs>' -A noto-fonts-cjk-sans)/share/fonts/opentype
NOTO_SERIF_CJK = $(shell nix-build --no-out-link '<nixpkgs>' -A noto-fonts-cjk-serif)/share/fonts/opentype
LIBERTINUS = $(shell nix-build --no-out-link '<nixpkgs>' -A libertinus)/share/fonts/opentype
EB_GARAMOND = $(shell nix-build --no-out-link '<nixpkgs>' -A eb-garamond)/share/fonts

FONT_PATHS = --font-path $(NOTO_SANS_CJK) --font-path $(NOTO_SERIF_CJK) --font-path $(LIBERTINUS) --font-path $(EB_GARAMOND)


.PHONY: all html ino-pdf print-pdf clean

all: html ino-pdf print-pdf

$(PUBLIC):
	mkdir -p $(PUBLIC)

html: $(HTML_OUT)

$(HTML_OUT): $(SRC) | $(PUBLIC)
	typst compile --root . $(SRC) $(HTML_OUT) --features html --input show-ino-notation=false --input target=html $(FONT_PATHS)

ino-pdf: $(INO_PDF_OUT)

$(INO_PDF_OUT): $(SRC) | $(PUBLIC)
	typst compile --root . $(SRC) $(INO_PDF_OUT) --input show-ino-notation=true $(FONT_PATHS)

print-pdf: $(PRINT_PDF_OUT)

$(PRINT_PDF_OUT): $(SRC) | $(PUBLIC)
	typst compile --root . $(SRC) $(PRINT_PDF_OUT) --input show-ino-notation=false $(FONT_PATHS)

clean:
	rm -rf $(PUBLIC)
