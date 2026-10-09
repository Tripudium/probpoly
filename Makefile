MAIN=gaussian-conditioning
MINTED?=0

TEXFILES := $(MAIN).tex $(wildcard sections/*.tex) $(wildcard paper-sections/*.tex)
ARXIV_EXT := tex sty cls bst bib bbl bbx cbx png jpg pdf eps tikz

.PHONY: all draft final watch clean lint format bbl arxiv

all: draft

draft:
	@MINTED=$(MINTED) latexmk -pdf -interaction=nonstopmode $(MAIN).tex

final:
	@MINTED=$(MINTED) latexmk -pdf -interaction=nonstopmode -halt-on-error $(MAIN).tex

watch:
	@MINTED=$(MINTED) latexmk -pdf -pvc -interaction=nonstopmode $(MAIN).tex

bbl:
	@MINTED=$(MINTED) latexmk -pdf -interaction=nonstopmode $(MAIN).tex

clean:
	@latexmk -C
	@rm -f $(MAIN).bbl $(MAIN).run.xml

lint:
	@chktex -q -I0 -n1 -n8 -n46 $(TEXFILES) || true

format:
	@latexindent -w $(TEXFILES)

# Build first so the .bbl (required by arXiv) exists, then copy sources.
arxiv: final
	@rm -rf arxiv && mkdir arxiv
	@rsync -a --prune-empty-dirs \
		--exclude 'arxiv' --exclude '.git' --exclude '.github' \
		--exclude '$(MAIN).pdf' \
		--include '*/' $(foreach e,$(ARXIV_EXT),--include '*.$(e)') --exclude '*' \
		. arxiv/
	@echo "arxiv package in ./arxiv"
