all: brainhack-commentary-formatted.tex
	pdflatex brainhack-commentary-formatted.tex
	bibtex brainhack-commentary-formatted
	pdflatex brainhack-commentary-formatted.tex
	pdflatex brainhack-commentary-formatted.tex
		
clean:
	rm *.aux *.bbl *.log *.blg *.out *.ent brainhack-commentary-formatted.tex 
	