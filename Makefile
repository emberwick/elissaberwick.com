# Define variables
OUTPUT = _site/index.html
DEPENDENCIES = index.qmd teaching.qmd research.qmd _quarto.yml Makefile

# Default target
all: $(OUTPUT)

# Rule to generate the output file by running quarto render
$(OUTPUT): $(DEPENDENCIES)
	rm -rf docs
	quarto render
	mv _site docs
	cp assets/CNAME docs/CNAME
	
# Phony target to avoid confusion with any files named 'clean'
.PHONY: clean

# Clean up the build directory
clean:
	rm -rf _site
