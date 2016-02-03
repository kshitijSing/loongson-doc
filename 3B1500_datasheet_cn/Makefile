VERSION  = 1.5
SOURCES  = $(sort $(wildcard *.md))
FILEBASE = LS3B1500-数据手册
TARGET   = $(FILEBASE)-v${VERSION}.pdf
TEXFILE  = $(FILEBASE)-v${VERSION}.tex
JSONFILE = $(FILEBASE)-v${VERSION}.json
LOTFILE  = $(FILEBASE)-v${VERSION}.lot
TEMPLATE = ../templates/loongson-3b1500-cn.latex
OPTIONS  = --chapters --template=$(TEMPLATE)

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
	@rm -f $(TARGET) $(TEXFILE) $(JSONFILE) *.aux *.lot *.lof *.log *.out *.toc
