#
# This file generates files required to use the lstbayes package
#

# formatting tools
LATEX = pdflatex
MAKEINDEX = makeindex
TEX = tex

.PHONY: build pdf all

all: build pdf

build: lstbayes.sty

pdf: lstbayes.pdf

lstbayes.sty: lstbayes.ins lstbayes.dtx
	$(TEX) $<

lstbayes.pdf: lstbayes.dtx
	$(LATEX) $<

