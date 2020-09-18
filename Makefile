DOC=elsarticle-template-harv

all: bib
	pdflatex --halt-on-error --file-line-error ${DOC}.tex
	evince ${DOC}.pdf

bib: first ${DOC}.aux # blg bbl out
	bibtex ${DOC}.aux

first: ${DOC}.tex ./tex/*.tex  # log pdf aux out
	pdflatex --halt-on-error --file-line-error ${DOC}.tex

clear:
	rm -f ${DOC}.{log,pdf,aux,out,bbl,blg}

edit: ${DOC}.tex
	vim ${DOC}.tex

show: ${DOC}.pdf
	evince ${DOC}.pdf

