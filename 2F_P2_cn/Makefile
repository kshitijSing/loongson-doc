VERSION=1.1
SOURCES=$(sort $(wildcard *.md))
TARGET=LS2F-user-manual-II-v${VERSION}-zh.pdf
TEXFILE=LS2F-user-manual-II-v${VERSION}-zh.tex
JSONFILE=LS2F-user-manual-II-v${VERSION}-zh.json
TEMPLATE=../templates/loongson-3b1500-cn.latex
OPTIONS=--chapters --template=$(TEMPLATE)

all: $(SOURCES) $(TARGET) $(TEMPLATE)

$(TARGET): $(SOURCES) $(TEMPLATE)
	pandoc $(SOURCES) -o $(TEXFILE) $(OPTIONS) -t latex
	perl -0777 -i -pe 's/\\beginblock\n/{/g' $(TEXFILE)
	perl -0777 -i -pe 's/\n\\endblock/}/g'   $(TEXFILE)
	xelatex $(TEXFILE)
	xelatex $(TEXFILE)

tex: $(SOURCES) $(TEMPLATE)
	pandoc $(SOURCES) -o $(TEXFILE) $(OPTIONS) -t latex

json: $(SOURCES) $(TEMPLATE)
	pandoc $(SOURCES) -o $(JSONFILE) $(OPTIONS) -t json

clean:
	@rm -f $(TARGET) $(TEXFILE) $(JSONFILE)
