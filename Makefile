# LATEX: pdflatex | xelatex | lualatex
LATEX = pdflatex
LATEX_FLAGS = -shell-escape
BIBTEX = bibtex

TARGET = main.pdf
TEX_FILES = $(wildcard *.tex)

all: $(TARGET)

$(TARGET): $(TEX_FILES)
	$(LATEX) $(LATEX_FLAGS) main.tex
	$(BIBTEX) main
	$(LATEX) $(LATEX_FLAGS) main.tex
	$(BIBTEX) main
	$(LATEX) $(LATEX_FLAGS) main.tex

clean:
	-rm -f *.log *.toc *.tac *.aux *.dvi *.ps *.bbl *.blg *.tmp *.nav *.out *.snm *.vrb *.rel *.cut *.abs *.xmpi *.xmpdata *~
	-rm -rf out _minted* auto
	-rm -f $(TARGET)

cleanall: clean
	-rm -rf out auto
