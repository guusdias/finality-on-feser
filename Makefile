OUTPUT_DIR := docs
PDF_OUTPUT := $(OUTPUT_DIR)/finality-on-feser.pdf
DOCX_OUTPUT := $(OUTPUT_DIR)/finality-on-feser.docx
SOURCES := $(wildcard src/*.md)

.PHONY: pdf docx

pdf:
	@mkdir -p $(OUTPUT_DIR)
	@if [ -z "$(SOURCES)" ]; then \
		echo "Nenhum capítulo encontrado em src/*.md"; \
	else \
		pandoc $(SOURCES) --bibliography=referencias.bib --csl=abnt.csl -o $(PDF_OUTPUT); \
	fi

docx:
	@mkdir -p $(OUTPUT_DIR)
	@if [ -z "$(SOURCES)" ]; then \
		echo "Nenhum capítulo encontrado em src/*.md"; \
	else \
		pandoc $(SOURCES) --bibliography=referencias.bib --csl=abnt.csl -o $(DOCX_OUTPUT); \
	fi
