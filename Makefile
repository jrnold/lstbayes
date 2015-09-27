#
# This file generates files required to use the lstbayes package
#

# formatting tools
PYTHON = python3
SHELL = bash
LATEX = pdflatex
TEX = tex

.PHONY: build pdf all

all: build pdf

build: lstbayes.sty

release: build pdf README.md
	-rm lstbayes.zip
	if [ -d lstbayes ]; then rm -rf ./lstbayes; fi
	mkdir lstbayes
	cp *.pdf *.ins *.dtx *.tex README.md Makefile lstbayes
	zip -r lstbayes.zip lstbayes

pdf: lstbayes.pdf examples.pdf

lstbayes.dtx: lstbayes.dtx.mustache
	$(PYTHON) lstbayes.py $< > $@

lstbayes.sty: lstbayes.ins lstbayes.dtx
	$(TEX) $<

lstbayes.pdf: lstbayes.dtx
	$(LATEX) $<

examples.pdf: examples.tex
	$(LATEX) $<
	$(LATEX) $<

