#
# This file generates files required to use the lstbayes package
#

# formatting tools
LATEX = pdflatex
TEX = tex

.PHONY: build pdf all

all: build pdf

build: lstbayes.sty

release: build pdf README.md
	zip lstbayes.zip $^  *.sty *.pdf *.ins *.dtx *.tex Makefile

pdf: lstbayes.pdf examples.pdf

lstbayes.sty: lstbayes.ins lstbayes.dtx
	$(TEX) $<

lstbayes.pdf: lstbayes.dtx
	$(LATEX) $<

examples.pdf: examples.tex
	$(LATEX) $<
	$(LATEX) $<

