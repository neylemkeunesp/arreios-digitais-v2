.PHONY: all html pdf pptx clean

SLIDES_LIGHT  = arreios-digitais-v2
SLIDES_DARK   = arreios-digitais-v2-dark
SVG_ASSETS    = $(wildcard assets/*.svg)
PNG_ASSETS    = $(SVG_ASSETS:.svg=.png)

# Converte SVGs para PNGs em alta resolução
assets/%.png: assets/%.svg
	rsvg-convert -w 1200 $< -o $@

# Gera todos os assets
assets: $(PNG_ASSETS)

# HTML
html: assets
	./node_modules/.bin/marp $(SLIDES_LIGHT).md  --html --allow-local-files -o $(SLIDES_LIGHT).html
	./node_modules/.bin/marp $(SLIDES_DARK).md --html --allow-local-files -o $(SLIDES_DARK).html

# PDF
pdf: assets
	./node_modules/.bin/marp $(SLIDES_LIGHT).md  --pdf  --allow-local-files -o $(SLIDES_LIGHT).pdf
	./node_modules/.bin/marp $(SLIDES_DARK).md --pdf  --allow-local-files -o $(SLIDES_DARK).pdf

# PPTX (requer python-pptx no .venv)
pptx:
	.venv/bin/python scripts/build_pptx.py

# Tudo
all: html pdf pptx

clean:
	rm -f $(PNG_ASSETS) $(SLIDES_LIGHT).{html,pdf,pptx} $(SLITES_DARK).{html,pdf,pptx}
	rm -rf .cache
