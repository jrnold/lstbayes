#
# This file generates files required to use the lstlangbayes package
#

# formatting tools
LATEX = pdflatex
MAKEINDEX = makeindex
TEX = tex

.PHONY: build pdf all

all: build pdf

build: lstlangbayes.sty

pdf: lstlangbayes.pdf

lstlangbayes.sty: lstlangbayes.ins lstlangbayes.dtx
	$(TEX) $<

# lstlangbayes.pdf: lstlangbayes.dtx
# 	$(LATEX) ${<:.sty=.dtx}

