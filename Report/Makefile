MAINTEX = report

TEMP_EXTS = aux bbl bcf run.xml blg brf log out idx \
			ind ilg synctex.gz fdb_latexmk fls nav snm toc vrb dvi

remove_temps = $(foreach ext, $(TEMP_EXTS), $(shell rm -f $(1).$(ext)))

.PHONY: all
all: clean 

.PHONY: clean
clean:
	@echo
	@echo "Deleting temporary LaTeX/BibTex files for '$(MAINTEX)'"
	@echo
	@rm -f .log
	$(call remove_temps, $(MAINTEX))  

.PHONY: cleanx
cleanx: clean
	@rm -f $(MAINTEX).pdf

.PHONY: pdf
pdf:
	@echo
	@echo "Compiling PDF $(MAINTEX)"
	@echo
	pdflatex $(MAINTEX).tex
	pdflatex $(MAINTEX).tex