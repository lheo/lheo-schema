FILES=gml.dtd.generated gml-ns.dtd.generated gml.html gml.elements gml.dictionaries
all: ${FILES}
gml.dtd.generated: gml.xml ../scripts/gml2dtd.xsl
	xsltproc -o $@ ../scripts/gml2dtd.xsl gml.xml
gml-ns.dtd.generated: gml.xml ../scripts/gml2dtd.xsl
	xsltproc --stringparam withns yes --stringparam mode prefixed -o $@ ../scripts/gml2dtd.xsl gml.xml
gml.html: gml.xml ../scripts/gml2doc.xsl
	xsltproc --stringparam css gmldoc.css --stringparam check yes -o $@ ../scripts/gml2doc.xsl gml.xml
gml.elements: gml.xml ../scripts/gml2elements.xsl
	xsltproc --stringparam check yes -o $@ ../scripts/gml2elements.xsl gml.xml
gml.dictionaries: gml.xml ../scripts/gml2dict.xsl
	xsltproc --stringparam check yes -o $@ ../scripts/gml2dict.xsl gml.xml

# DO NOT ASSUME TRANG
#trang:  gml.rnc gml.rng gml.xsd
#gml.rnc: gml.dtd
#	trang gml.dtd gml.rnc
#gml.rng: gml.dtd
#	trang gml.dtd gml.rng
#gml.xsd: gml.dtd
#	trang gml.dtd gml.xsd

clean:
	rm -f ${FILES} *~
