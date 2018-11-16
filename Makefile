REFSIZE='\\small'

all: svd.pdf

svd.pdf: svd.tex *.tex
	pdflatex $<
	bibtex  svd
	perl -i -p -e 's|^(\\begin{thebibliography}{.*})$$|$$1\n\n'$(REFSIZE)'|' svd.bbl
	pdflatex $<
	pdflatex $<
	#pdflatex $<
	#dvipdf svd
	rm svd.aux svd.log svd.out
	rm svd.blg svd.bbl 

ieee: svd.tex *.tex
	latex $<
	#bibtex  svd
	latex $<
	latex $<
	dvips -Ppdf -G0 -tletter svd.dvi -o svd.ps
	#dvips -Ppdf svd.dvi -o svd.ps
	ps2pdf -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress svd.ps svd.pdf
	#ps2pdf svd.ps svd.pdf
	rm svd.dvi svd.ps
	rm svd.aux svd.log 
	rm svd.blg svd.bbl 

clean:
	rm svd.pdf #svd.ps svd.dvi 
	rm svd.blg svd.bbl 
	rm svd.aux svd.log 
	rm svd.aux svd.log svd.blg svd.bbl 
