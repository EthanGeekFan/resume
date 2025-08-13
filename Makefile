# Resume Build System using gomplate (no Python dependencies)
# This Makefile uses gomplate for template rendering

.PHONY: all english chinese generate build install-gomplate clean help legacy-english legacy-chinese

# Prevent Make from deleting intermediate .tex files
.PRECIOUS: %.tex

# Default target - build both main resumes
all: english chinese academic-english

# Universal pattern rules for any YAML file
# Generate .tex from resume.*.yaml files
%.tex: resume.%.yaml resume_template.gomplate.tex
	@echo "Generating $@ from $<..."
	gomplate --file resume_template.gomplate.tex --datasource data=$< --out $@

# Generate .pdf from .tex files
%.pdf: %.tex
	@echo "Compiling $@ from $<..."
	docker run --rm -v "$(shell pwd):/data" pdflatex $< && rm -f $*.aux $*.log $*.out $*.toc

# Convenience targets for main resume files
english: english.pdf
	@echo "english resume generated successfully!"

chinese: chinese.pdf
	@echo "chinese resume generated successfully!"

academic-english: academic.english.pdf
	@echo "academic-english resume generated successfully!"

# Generate LaTeX files from templates and data using gomplate
generate:
	@echo "Generating LaTeX files from templates using gomplate..."
	gomplate --file resume_template.gomplate.tex --datasource data=resume.english.yaml --out english.tex
	gomplate --file resume_template.gomplate.tex --datasource data=resume.chinese.yaml --out chinese.tex

# Generate specific language
generate-english:
	@echo "Generating english LaTeX file using gomplate..."
	gomplate --file resume_template.gomplate.tex --datasource data=resume.english.yaml --out english.tex

generate-chinese:
	@echo "Generating chinese LaTeX file using gomplate..."
	gomplate --file resume_template.gomplate.tex --datasource data=resume.chinese.yaml --out chinese.tex

# Legacy targets for english and chinese (with explicit generation)
english-legacy: generate-english build
	@echo "Compiling english resume (legacy mode)..."
	docker run --rm -v "$(shell pwd):/data" pdflatex english.tex && rm -f english.aux english.log english.out english.toc

chinese-legacy: generate-chinese build
	@echo "Compiling chinese resume (legacy mode)..."
	docker run --rm -v "$(shell pwd):/data" pdflatex chinese.tex && rm -f chinese.aux chinese.log chinese.out chinese.toc

# Legacy targets for direct LaTeX compilation (without template generation)
legacy-english: build
	@echo "Compiling english resume (legacy mode)..."
	docker run --rm -v "$(shell pwd):/data" pdflatex english.tex && rm -f english.aux english.log english.out english.toc

legacy-chinese: build
	@echo "Compiling chinese resume (legacy mode)..."
	docker run --rm -v "$(shell pwd):/data" pdflatex chinese.tex && rm -f chinese.aux chinese.log chinese.out chinese.toc

# Build Docker image for LaTeX compilation
build:
	@echo "Building pdflatex Docker image..."
	docker build -t pdflatex .

# Install gomplate (cross-platform)
install-gomplate:
	@echo "Installing gomplate..."
	@if command -v brew >/dev/null 2>&1; then \
		echo "Installing via Homebrew..."; \
		brew install gomplate; \
	elif command -v curl >/dev/null 2>&1; then \
		echo "Installing via curl..."; \
		curl -o /usr/local/bin/gomplate -sSL https://github.com/hairyhenderson/gomplate/releases/download/v3.11.5/gomplate_linux-amd64; \
		chmod +x /usr/local/bin/gomplate; \
	else \
		echo "Please install gomplate manually from https://docs.gomplate.ca/installing/"; \
	fi

# Clean generated files
clean:
	@echo "Cleaning generated files..."
	rm -f *.aux *.log *.out *.toc *.pdf

# Clean everything including generated LaTeX files (use with caution)
clean-all: clean
	@echo "Cleaning all generated files including LaTeX files..."
	@echo "WARNING: This will remove all generated .tex files"
	@read -p "Are you sure? [y/N] " -n 1 -r; \
	echo; \
	if [[ $$REPLY =~ ^[Yy]$$ ]]; then \
		rm -f *.tex; \
	fi

# Help target
help:
	@echo "Resume Build System (gomplate version)"
	@echo "===================================="
	@echo ""
	@echo "This version uses gomplate for template rendering (no Python dependencies)"
	@echo ""
	@echo "Universal Usage:"
	@echo "  <name>.pdf       - Generate PDF from resume.<name>.yaml (e.g., 'make example.pdf')"
	@echo "  <name>.tex       - Generate LaTeX from resume.<name>.yaml (e.g., 'make example.tex')"
	@echo ""
	@echo "Convenience targets:"
	@echo "  english         - Generate english.pdf from resume.english.yaml"
	@echo "  chinese         - Generate chinese.pdf from resume.chinese.yaml"
	@echo ""
	@echo "Standard targets:"
	@echo "  all              - Build both english and chinese PDFs (default)"
	@echo "  english-legacy   - Generate and build english PDF (explicit generation)"
	@echo "  chinese-legacy   - Generate and build chinese PDF (explicit generation)"
	@echo "  generate         - Generate both LaTeX files from templates"
	@echo "  generate-english - Generate only english LaTeX file"
	@echo "  generate-chinese - Generate only chinese LaTeX file"
	@echo "  build           - Build Docker image for LaTeX compilation"
	@echo "  install-gomplate - Install gomplate CLI tool"
	@echo "  clean           - Clean auxiliary files and PDFs"
	@echo "  clean-all       - Clean everything including generated LaTeX files"
	@echo "  help            - Show this help message"
	@echo ""
	@echo "Legacy targets (compile existing LaTeX files without template generation):"
	@echo "  legacy-english  - Compile english.tex directly"
	@echo "  legacy-chinese  - Compile chinese.tex directly"
	@echo ""
	@echo "Examples:"
	@echo "  make english           # Generate english.pdf from resume.en.yaml"
	@echo "  make chinese           # Generate chinese.pdf from resume.zh.yaml"
	@echo ""
	@echo "Setup:"
	@echo "  1. Run 'make install-gomplate' to install gomplate"
	@echo "  2. Create resume.<name>.yaml with your content"
	@echo "  3. Run 'make <name>.pdf' to generate your resume" 