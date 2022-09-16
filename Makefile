all: english chinese

english: build
	docker run --rm -v "$(shell pwd):/data" pdflatex English.tex && rm -f English.aux English.log English.out English.toc

chinese: build
	docker run --rm -v "$(shell pwd):/data" pdflatex Chinese.tex && rm -f Chinese.aux Chinese.log Chinese.out Chinese.toc

build:
	docker build -t pdflatex .

clean:
	rm -f *.aux *.log *.out *.toc *.pdf