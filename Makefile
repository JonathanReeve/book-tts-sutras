SRC = src/sutra_book.typ
PUBLIC = public

HTML_OUT = $(PUBLIC)/sutra_book.html
INO_PDF_OUT = $(PUBLIC)/sutra_book_ino.pdf
PRINT_PDF_OUT = $(PUBLIC)/sutra_book_print.pdf

TYPST_ROOT = $(shell dirname $(SRC))
TYPST_INPUT = $(shell basename $(SRC))

.PHONY: all html ino-pdf print-pdf clean

all: html ino-pdf print-pdf

html: $(HTML_OUT)

$(HTML_OUT): $(SRC)
	typst compile --root $(TYPST_ROOT) $(TYPST_INPUT) $(HTML_OUT) --features html

ino-pdf: $(INO_PDF_OUT)

$(INO_PDF_OUT): $(SRC)
	typst compile --root $(TYPST_ROOT) $(TYPST_INPUT) $(INO_PDF_OUT) --input show-ino-notation=true

print-pdf: $(PRINT_PDF_OUT)

$(PRINT_PDF_OUT): $(SRC)
	typst compile --root $(TYPST_ROOT) $(TYPST_INPUT) $(PRINT_PDF_OUT) --input show-ino-notation=false

clean:
	rm -f $(HTML_OUT) $(INO_PDF_OUT) $(PRINT_PDF_OUT)
