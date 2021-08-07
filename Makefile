DEFAULT_GOAL:  pdf


.PHONY: pdf
pdf:
	pdflatex  research/manuscript.tex
