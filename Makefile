all: brainhack-commentary-formatted.tex
	pdflatex brainhack-commentary-formatted.tex
	bibtex brainhack-commentary-formatted
	pdflatex brainhack-commentary-formatted.tex
	pdflatex brainhack-commentary-formatted.tex
	

brainhack-report-formatted.tex: brainhack-commentary.bib brainhack-commentary.md Makefile
	pandoc -s -S -N brainhack-commentary.md -o brainhack-commentary-formatted.tex
	#pandoc -s -S -N --template brainhack-report-template.tex brainhack-report.md -o brainhack_commentary_formatted.tex
	
clean:
	rm *.aux *.bbl *.log *.blg *.out
	