FILES=lheo.xml dict-FORMACODE.xml dict-NSF.xml dict-ROME.xml dict-departements-france.xml dict-pays.xml dict-regions-france.xml glossaire.html exemples.xml lheo.xsl

all: ${FILES}

lheo.xml: ../src/definitions/definitions.xml pregml2gml.xsl ../src/definitions/tables.xml
	xsltproc --stringparam doctables ../src/definitions/tables.xml -o $@ pregml2gml.xsl ../src/definitions/definitions.xml

lheo.xsl: lheo.xml gml2xsl.xsl
	xsltproc -o $@ gml2xsl.xsl lheo.xml

exemples.xml: ../src/definitions/exemples.xml pregml2gml.xsl 
	xsltproc -o $@ pregml2gml.xsl $<

dict-%.xml: ../services/table_%.xml pregml2gml.xsl 
	xsltproc -o $@ pregml2gml.xsl $<
glossaire.html: ../src/definitions/glossaire.xml oldglo2div.xsl
	xsltproc -o $@ oldglo2div.xsl $<
clean:
	rm -f ${FILES} *~