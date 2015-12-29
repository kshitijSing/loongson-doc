VERSION=1.1
SOURCES=$(sort $(wildcard *.md))
TARGET=LS3B1500-user-manual-I-v${VERSION}-zh.pdf
TEXFILE=LS3B1500-user-manual-I-v${VERSION}-zh.tex
JSONFILE=LS3B1500-user-manual-I-v${VERSION}-zh.json
LOTFILE=LS3B1500-user-manual-I-v${VERSION}-zh.lot
TEMPLATE=../templates/loongson-3b1500-cn.latex
OPTIONS=--chapters --template=$(TEMPLATE)

all: $(SOURCES) $(TARGET) $(TEMPLATE)

$(TARGET): $(SOURCES) $(TEMPLATE)
	pandoc $(SOURCES) -o $(TEXFILE) $(OPTIONS) -t latex
	perl -0777 -i -pe 's/\\beginblock\n/{/g' $(TEXFILE)
	perl -0777 -i -pe 's/\n\\endblock/}/g'   $(TEXFILE)
	xelatex $(TEXFILE)
	sed -i '/（续）/d' $(LOTFILE)
	xelatex $(TEXFILE)
	sed -i '/（续）/d' $(LOTFILE)

tex: $(SOURCES) $(TEMPLATE)
	pandoc $(SOURCES) -o $(TEXFILE) $(OPTIONS) -t latex

json: $(SOURCES) $(TEMPLATE)
	pandoc $(SOURCES) -o $(JSONFILE) $(OPTIONS) -t json

clean:
	@rm -f $(TARGET) $(TEXFILE) $(JSONFILE)
