LATEX_SOURCES=$(wildcard *.tex)
BIBTEX_SOURCES=$(wildcard *.bib)
PDF_DOCUMENTS=$(LATEX_SOURCES:.tex=.pdf)

# keep this in sync with the .gitignore and the LaTeX packages in use - they all like their files. Eh.
CRUD_EXTENSIONS=aux bbl bcf blg fdb_latexmk fls ftd ftg ftn glg glo gls ist lof log lot out run.xml tdo toc upa upb
CRUD_FILES=$(foreach ext,$(CRUD_EXTENSIONS),$(wildcard *.$(ext)))

.PHONY: all clean

%.pdf: %.tex $(BIBTEX_SOURCES)
	latexmk -pdf $<

# default target: build PDFs from those LaTeX files. Cause totally!
all: $(PDF_DOCUMENTS)

clean:
	latexmk -c $(LATEX_SOURCES)

# [sic] nope, that is the correct title. Look it up: Misstree is WAY COOLER than Mr!
mreproper: $(CRUD_FILES)
	rm -f -- $(CRUD_FILES)

shiny: mreproper clean $(PDF_DOCUMENTS)
	rm -f $(PDF_DOCUMENTS)
