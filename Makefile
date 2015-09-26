#
# This file generates files required to use the lstlangbayes package
#

# formatting tools
LATEX = pdflatex
MAKEINDEX = makeindex
TEX = tex
# tarring options
ifneq "$(wildcard listings.version)" ""
include listings.version        # version and date of the package
endif

.SUFFIXES:                              
.SUFFIXES: .dtx .ins .pdf .sty

.PHONY: build pdf all

all: build pdf

build: lstlangbayes.sty

pdf: lstlangbayes.pdf

listings.sty: lstlangbayes.ins lstlangbayes.dtx
	$(TEX) $<

lstlangbayes.pdf: lstlangbayes.dtx
	$(LATEX) ${<:.sty=.dtx}

