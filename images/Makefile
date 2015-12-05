VPATH=cn fpu cp0 instruction-set
TEMPLATE=../templates/bytefield-cn.latex
OPTIONS=--template=$(TEMPLATE) --latex-engine=xelatex

SOURCES_CN=$(wildcard cn/*.tex)
TARGETS_CN=$(patsubst cn/%.tex,%.pdf,$(SOURCES_CN))
SOURCES_CP0=$(wildcard cp0/*.tex)
TARGETS_CP0=$(patsubst cp0/%.tex,%.pdf,$(SOURCES_CP0))
SOURCES_FPU=$(wildcard fpu/*.tex)
TARGETS_FPU=$(patsubst fpu/%.tex,%.pdf,$(SOURCES_FPU))
SOURCES_IS=$(wildcard instruction-set/*.tex)
TARGETS_IS=$(patsubst instruction-set/%.tex,%.pdf,$(SOURCES_IS))

ifdef V
	OPTIONS=$(OPTIONS) --verbose
endif

.PHONY: all clean

all: cn fpu cp0 instruction-set

cn: $(SOURCES_CN) $(TARGETS_CN)

fpu: $(SOURCES_FPU) $(TARGETS_FPU)

cp0: $(SOURCES_CP0) $(TARGETS_CP0)

instruction-set: $(TARGETS_IS) $(TEMPLATE)

%.pdf: %.tex
	echo "\input{$<}" | pandoc -o $@ $(OPTIONS)
	pdfcrop $@ $@

clean:
	@rm -f $(TARGETS_CN) $(TARGETS_FPU) $(TARGETS_CP0) $(TARGETS_IS)
