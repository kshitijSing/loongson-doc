SOURCES  = $(wildcard *.md)
TARGETS  = $(SOURCES:.md=.pdf)
TEMPLATE = ../../templates/land-listing.latex
OPTIONS  = --template=$(TEMPLATE)

all: $(SOURCES) $(TARGETS) $(TEMPLATE)

%.pdf: %.md $(TEMPLATE)
	pandoc $< $(OPTIONS) -t latex -o $@

clean:
	@rm -f *.pdf
