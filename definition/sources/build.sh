# -*- coding: utf-8 -*-
echo "DEPARTEMENTS"
grep -v 'REGION' departements-france-2007-insee.txt | awk -F'\t' -f departements-france-2007-insee.awk > lheo-dict-departements-france.xml

echo "REGIONS"
grep -v 'REGION' regions-france-2007-insee.txt | awk -F'\t' -f regions-france-2007-insee.awk > lheo-dict-regions-france.xml

echo "COMMUNES"
grep -v 'CHEFLIEU' communes-france-2007.txt | awk -F'\t' -f communes-france-2007.awk > lheo-dict-communes-france.xml

echo "CANTONS"
grep -v 'REGION' cantons-france-2007-insee.txt | awk -F'\t' -f cantons-france-2007-insee.awk > lheo-dict-cantons-france.xml

echo "PAYS"
xsltproc -o lheo-dict-pays.xml pays.xsl iso_3166-1_list_fr.xml

# export FCod.xsl vers FCod.csv
# ouverture dans Textmate pour réencodage utf-8 / LF
# Replace/find dans textmate de ".*" (tout vire) a cause de CSV.
echo "FORMACODE" 
awk -f formacode.awk FCod-utf-8.csv > lheo-dict-FORMACODE.xml

# export RomeFCod.xsl vers RomeFCod.csv
# ouverture dans Textmate pour réencodage utf-8 / LF
echo "ROME"
awk -f rome.awk RomeFCod-utf-8.csv > lheo-dict-ROME.xml

