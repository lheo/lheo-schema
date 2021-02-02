.PHONY: all build dirs publish
TARGET ?= /tmp/europass
SOURCE ?= ~/source_data/europass2020
PYTHONLIB = lheo2web.py lheo2loms.py lheocommon.py lomscommon.py

all: build

dirs:
	@mkdir -p $(TARGET)/auvergne_rhone_alpes
	@mkdir -p $(TARGET)/bourgogne_franche_comte
	@mkdir -p $(TARGET)/bretagne
	@mkdir -p $(TARGET)/centre_val_de_loire
	@mkdir -p $(TARGET)/collectivites_outre_mer
	@mkdir -p $(TARGET)/corse
	@mkdir -p $(TARGET)/grand_est
	@mkdir -p $(TARGET)/guadeloupe
	@mkdir -p $(TARGET)/guyane
	@mkdir -p $(TARGET)/hauts_de_france
	@mkdir -p $(TARGET)/la_reunion
	@mkdir -p $(TARGET)/martinique
	@mkdir -p $(TARGET)/mayotte
	@mkdir -p $(TARGET)/normandie
	@mkdir -p $(TARGET)/nouvelle_aquitaine
	@mkdir -p $(TARGET)/dispositif_nouvelle_aquitaine
	@mkdir -p $(TARGET)/dispositif_occitanie
	@mkdir -p $(TARGET)/dispositif_pays_de_loire
	@mkdir -p $(TARGET)/dispositif_provence_alpes_cote_azur

TARGETS = $(TARGET)/auvergne_rhone_alpes/index.xml \
  $(TARGET)/bourgogne_franche_comte/index.xml \
  $(TARGET)/bretagne/index.xml \
  $(TARGET)/centre_val_de_loire/index.xml \
  $(TARGET)/collectivites_outre_mer/index.xml \
  $(TARGET)/corse/index.xml \
  $(TARGET)/grand_est/index.xml \
  $(TARGET)/guadeloupe/index.xml \
  $(TARGET)/guyane/index.xml \
  $(TARGET)/hauts_de_france/index.xml \
  $(TARGET)/la_reunion/index.xml \
  $(TARGET)/martinique/index.xml \
  $(TARGET)/mayotte/index.xml \
  $(TARGET)/normandie/index.xml \
  $(TARGET)/nouvelle_aquitaine/index.xml \
  $(TARGET)/dispositif_nouvelle_aquitaine/index.xml \
  $(TARGET)/dispositif_occitanie/index.xml \
  $(TARGET)/dispositif_pays_de_loire/index.xml \
  $(TARGET)/dispositif_provence_alpes_cote_azur/index.xml

build: dirs $(TARGETS)

$(TARGET)/auvergne_rhone_alpes/index.xml: $(SOURCE)/lheo-20201111072520_auvergne_rhone_alpes.xml $(PYTHONLIB)
	python lheo2web.py --loms $< --source "Auvergne-Rhônes-Alpes" $(TARGET)/auvergne_rhone_alpes

$(TARGET)/bourgogne_franche_comte/index.xml: $(SOURCE)/lheo-20201111073351_Bourgogne_franche_comte.xml $(PYTHONLIB)
	python lheo2web.py --loms $< --source "Bourgogne-Franche-Comté" $(TARGET)/bourgogne_franche_comte

$(TARGET)/bretagne/index.xml: $(SOURCE)/lheo-20201111074526_bretagne.xml $(PYTHONLIB)
	python lheo2web.py --loms $< --source "Bretagne" $(TARGET)/bretagne

$(TARGET)/centre_val_de_loire/index.xml: $(SOURCE)/lheo-20201111075844_centre_val_de_loire.xml $(PYTHONLIB)
	python lheo2web.py --loms $< --source "Centre-Val de Loire" $(TARGET)/centre_val_de_loire

$(TARGET)/collectivites_outre_mer/index.xml: $(SOURCE)/lheo-20201111080924_collectivites_outre_mer.xml $(PYTHONLIB)
	python lheo2web.py --loms $< --source "Collectivités d'Outre-Mer" $(TARGET)/collectivites_outre_mer

$(TARGET)/corse/index.xml: $(SOURCE)/lheo-20201111082818_corse.xml $(PYTHONLIB)
	python lheo2web.py --loms $< --source "Corse" $(TARGET)/corse

$(TARGET)/grand_est/index.xml: $(SOURCE)/lheo-20201111083650_grand_est.xml $(PYTHONLIB)
	python lheo2web.py --loms $< --source "Grand Est" $(TARGET)/grand_est

$(TARGET)/guadeloupe/index.xml: $(SOURCE)/lheo-20201111084623_guadeloupe.xml $(PYTHONLIB)
	python lheo2web.py --loms $< --source "Guadeloupe" $(TARGET)/guadeloupe

$(TARGET)/guyane/index.xml: $(SOURCE)/lheo-20201111085607_guyane.xml $(PYTHONLIB)
	python lheo2web.py --loms $< --source "Guyane" $(TARGET)/guyane

$(TARGET)/hauts_de_france/index.xml: $(SOURCE)/lheo-20201111130048_haut_de_France.xml $(PYTHONLIB)
	python lheo2web.py --loms $< --source "Hauts-de-France" $(TARGET)/hauts_de_france

$(TARGET)/la_reunion/index.xml: $(SOURCE)/lheo-20201111130934_la_reunion.xml $(PYTHONLIB)
	python lheo2web.py --loms $< --source "La Réunion" $(TARGET)/la_reunion

$(TARGET)/martinique/index.xml: $(SOURCE)/lheo-20201111132102_martinique.xml $(PYTHONLIB)
	python lheo2web.py --loms $< --source "Martinique" $(TARGET)/martinique

$(TARGET)/mayotte/index.xml: $(SOURCE)/lheo-20201111133058_mayotte.xml $(PYTHONLIB)
	python lheo2web.py --loms $< --source "Mayotte" $(TARGET)/mayotte

$(TARGET)/normandie/index.xml: $(SOURCE)/lheo-20201111134041_normandie.xml $(PYTHONLIB)
	python lheo2web.py --loms $< --source "Normandie" $(TARGET)/normandie

$(TARGET)/nouvelle_aquitaine/index.xml: $(SOURCE)/lheo-20201111134752_nouvelle_aquitaine.xml $(PYTHONLIB)
	python lheo2web.py --loms $< --source "Nouvelle-Aquitaine" $(TARGET)/nouvelle_aquitaine

$(TARGET)/dispositif_nouvelle_aquitaine/index.xml: $(SOURCE)/lheo-20201112093331_dispositf_nouvelle_aquitaine.xml $(PYTHONLIB)
	python lheo2web.py --loms $< --source "Nouvelle-Aquitaine (Dispositif)" $(TARGET)/dispositif_nouvelle_aquitaine

$(TARGET)/dispositif_occitanie/index.xml: $(SOURCE)/lheo-20201112093908_dispositf_occitanie.xml $(PYTHONLIB)
	python lheo2web.py --loms $< --source "Occitanie (Dispositif)" $(TARGET)/dispositif_occitanie

$(TARGET)/dispositif_pays_de_loire/index.xml: $(SOURCE)/lheo-20201112094359_dispositf_pays_de_loire.xml $(PYTHONLIB)
	python lheo2web.py --loms $< --source "Pays de Loire (Dispositif)" $(TARGET)/dispositif_pays_de_loire

$(TARGET)/dispositif_provence_alpes_cote_azur/index.xml: $(SOURCE)/lheo-20201112095420_dispositf_provence_alpes_Azur.xml $(PYTHONLIB)
	python lheo2web.py --loms $< --source "Provence-Alpes-Côte d'Azur (Dispositif)" $(TARGET)/dispositif_provence_alpes_cote_azur

publish: build
	rsync --archive --verbose $(TARGET) lheo@boreon.silbercafe.net:www_onisep/data
	rsync --archive --verbose *.xsl lheo@boreon.silbercafe.net:www_onisep/data/europass/auvergne_rhone_alpes
	rsync --archive --verbose *.xsl lheo@boreon.silbercafe.net:www_onisep/data/europass/bourgogne_franche_comte
	rsync --archive --verbose *.xsl lheo@boreon.silbercafe.net:www_onisep/data/europass/bretagne
	rsync --archive --verbose *.xsl lheo@boreon.silbercafe.net:www_onisep/data/europass/centre_val_de_loire
	rsync --archive --verbose *.xsl lheo@boreon.silbercafe.net:www_onisep/data/europass/collectivites_outre_mer
	rsync --archive --verbose *.xsl lheo@boreon.silbercafe.net:www_onisep/data/europass/corse
	rsync --archive --verbose *.xsl lheo@boreon.silbercafe.net:www_onisep/data/europass/grand_est
	rsync --archive --verbose *.xsl lheo@boreon.silbercafe.net:www_onisep/data/europass/guadeloupe
	rsync --archive --verbose *.xsl lheo@boreon.silbercafe.net:www_onisep/data/europass/guyane
	rsync --archive --verbose *.xsl lheo@boreon.silbercafe.net:www_onisep/data/europass/hauts_de_france
	rsync --archive --verbose *.xsl lheo@boreon.silbercafe.net:www_onisep/data/europass/la_reunion
	rsync --archive --verbose *.xsl lheo@boreon.silbercafe.net:www_onisep/data/europass/martinique
	rsync --archive --verbose *.xsl lheo@boreon.silbercafe.net:www_onisep/data/europass/mayotte
	rsync --archive --verbose *.xsl lheo@boreon.silbercafe.net:www_onisep/data/europass/normandie
	rsync --archive --verbose *.xsl lheo@boreon.silbercafe.net:www_onisep/data/europass/nouvelle_aquitaine
	rsync --archive --verbose *.xsl lheo@boreon.silbercafe.net:www_onisep/data/europass/dispositif_nouvelle_aquitaine
	rsync --archive --verbose *.xsl lheo@boreon.silbercafe.net:www_onisep/data/europass/dispositif_occitanie
	rsync --archive --verbose *.xsl lheo@boreon.silbercafe.net:www_onisep/data/europass/dispositif_pays_de_loire
	rsync --archive --verbose *.xsl lheo@boreon.silbercafe.net:www_onisep/data/europass/dispositif_provence_alpes_cote_azur
	rsync --archive --verbose index.html lheo@boreon.silbercafe.net:www_onisep/data/europass
