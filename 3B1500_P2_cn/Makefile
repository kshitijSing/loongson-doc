VERSION=1.1
SOURCES=$(sort $(wildcard *.md))
TARGET=龙芯3B1500用户手册（下）-v${VERSION}.pdf
TEMPLATE=../templates/loongson-3b1500-cn.latex
OPTIONS=--chapters --template=$(TEMPLATE)

ifdef V
	OPTIONS=$(OPTIONS) --verbose
endif

all: $(SOURCES) $(TARGET)

$(TARGET): $(SOURCES)
	pandoc $+ -o $@ $(OPTIONS) --latex-engine=xelatex

tex: $(SOURCES)
	pandoc $+ -o 00-main.tex $(OPTIONS) -t latex

json: $(SOURCES)
	pandoc $+ -o 00-main.json $(OPTIONS) -t json

clean:
	@rm -f $(TARGET) 00-main.tex
