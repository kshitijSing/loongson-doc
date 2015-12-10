VERSION=1.1
SOURCES=$(sort $(wildcard *.md))
TARGET=龙芯3B1500用户手册（下）-v${VERSION}.pdf
TEXFILE=龙芯3B1500用户手册（下）-v${VERSION}.tex
TEMPLATE=../templates/loongson-3b1500-cn.latex
OPTIONS=--chapters --template=$(TEMPLATE)

ifdef V
	OPTIONS=$(OPTIONS) --verbose
endif

all: $(SOURCES) $(TARGET)

$(TARGET): $(SOURCES)
	pandoc $+ -o $(TEXFILE) $(OPTIONS) -t latex
	perl -0777 -i -pe 's/\\beginblock\n/{/g' $(TEXFILE)
	perl -0777 -i -pe 's/\n\\endblock/}/g'   $(TEXFILE)
	xelatex $(TEXFILE)
	xelatex $(TEXFILE)

tex: $(SOURCES)
	pandoc $+ -o $(TEXFILE) $(OPTIONS) -t latex

json: $(SOURCES)
	pandoc $+ -o main.json $(OPTIONS) -t json

clean:
	@rm -f $(TARGET) main.tex main.json
