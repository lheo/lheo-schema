.PHONY: all build dirs publish
TARGET ?= /tmp/europass
SOURCE ?= ~/source_data/selection_onisep_europass_202101
PYTHONLIB = lheo2web.py lheo2loms.py lheocommon.py lomscommon.py

all: build

dirs:
	@mkdir -p $(TARGET)/selection-lheo-20210126082011
	@mkdir -p $(TARGET)/selection-lheo-20210125171403
	@mkdir -p $(TARGET)/selection-lheo-20210125175151
	@mkdir -p $(TARGET)/selection-lheo-20210125175400
	@mkdir -p $(TARGET)/selection-lheo-20210125165543

TARGETS = $(TARGET)/selection-lheo-20210126082011/index.xml \
  $(TARGET)/selection-lheo-20210125171403/index.xml \
  $(TARGET)/selection-lheo-20210125175151/index.xml \
  $(TARGET)/selection-lheo-20210125175400/index.xml \
  $(TARGET)/selection-lheo-20210125165543/index.xml

build: dirs $(TARGETS)

$(TARGET)/selection-lheo-20210126082011/index.xml: $(SOURCE)/lheo-20210126082011.xml $(PYTHONLIB)
	python lheo2web.py --loms $< --source "Sélection 20210126082011" $(TARGET)/selection-lheo-20210126082011

$(TARGET)/selection-lheo-20210125171403/index.xml: $(SOURCE)/lheo-20210125171403.xml $(PYTHONLIB)
	python lheo2web.py --loms $< --source "Sélection 20210125171403" $(TARGET)/selection-lheo-20210125171403

$(TARGET)/selection-lheo-20210125175151/index.xml: $(SOURCE)/lheo-20210125175151.xml $(PYTHONLIB)
	python lheo2web.py --loms $< --source "Sélection 20210125175151" $(TARGET)/selection-lheo-20210125175151

$(TARGET)/selection-lheo-20210125175400/index.xml: $(SOURCE)/lheo-20210125175400.xml $(PYTHONLIB)
	python lheo2web.py --loms $< --source "Sélection 20210125175400" $(TARGET)/selection-lheo-20210125175400

$(TARGET)/selection-lheo-20210125165543/index.xml: $(SOURCE)/lheo-20210125165543.xml $(PYTHONLIB)
	python lheo2web.py --loms $< --source "Sélection 20210125165543" $(TARGET)/selection-lheo-20210125165543

publish: build
	rsync --archive --verbose $(TARGET) lheo@boreon.silbercafe.net:www_onisep/data
	rsync --archive --verbose *.xsl lheo@boreon.silbercafe.net:www_onisep/data/europass/selection-lheo-20210126082011
	rsync --archive --verbose *.xsl lheo@boreon.silbercafe.net:www_onisep/data/europass/selection-lheo-20210125171403
	rsync --archive --verbose *.xsl lheo@boreon.silbercafe.net:www_onisep/data/europass/selection-lheo-20210125175151
	rsync --archive --verbose *.xsl lheo@boreon.silbercafe.net:www_onisep/data/europass/selection-lheo-20210125175400
	rsync --archive --verbose *.xsl lheo@boreon.silbercafe.net:www_onisep/data/europass/selection-lheo-20210125165543
	rsync --archive --verbose index.html lheo@boreon.silbercafe.net:www_onisep/data/europass
