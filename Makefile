#
# PATHS
#
CDIR=$(shell pwd)
GELABA ?= ../gelaba/gelaba
TARGET=${CDIR}/target
DEFS=${CDIR}/definition

#
# Tools
#
SH=bash
XSLTPROC=xsltproc
CP=cp
ECHO=echo
SED=sed

#
# GeLaBa scripts
#
GML_DTD=${GELABA}/gml/gml-ns.dtd.generated
GML2VERSION=${GELABA}/scripts/gml2version.xsl
GML2NAME=${GELABA}/scripts/gml2name.xsl
GML2DTD=${GELABA}/scripts/gml2dtd.xsl
GML2EXAMPLE=${GELABA}/scripts/gml2example.xsl
GML2DICT=${GELABA}/scripts/gml2dict.xsl
GML2XSD=${GELABA}/scripts/gml2xsd.xsl

#
# LHEO definition
#
LHEO_LANGAGE=${DEFS}/lheo-gml.xml
LHEO_GLOSSAIRE=${DEFS}/lheo-glossaire.html
VERSION=$(shell ${XSLTPROC} ${GML2VERSION} ${LHEO_LANGAGE})
NAME=$(shell ${XSLTPROC} ${GML2NAME} ${LHEO_LANGAGE})

#
# CIBLE AVEC VERSION
#
VTARGET=${TARGET}/${VERSION}

#
# TARGETS
#
DTD_LHEO=${VTARGET}/lheo.dtd
XSD_LHEO=${VTARGET}/lheo.xsd
STRUCT_LHEO_EXAMPLE=${VTARGET}/lheo-exemple.xml
LHEO_GLOSSAIRE_TARGET=${VTARGET}/lheo-glossaire.html
TABLES_LHEO=${VTARGET}/lheo-tables.xml

FILES=\
 ${VTARGET}\
 ${DTD_LHEO}\
 ${TABLES_LHEO}\
 ${STRUCT_LHEO_EXAMPLE}\
 ${LHEO_GLOSSAIRE_TARGET}\
 ${XSD_LHEO}

.PHONY: doc

all: ${FILES} doc

${VTARGET}:
	@${SH} target.sh ${VERSION}
${DTD_LHEO}: ${LHEO_LANGAGE} ${GML2DTD}
	@${ECHO} "Generation ${DTD_LHEO}"
	@${XSLTPROC} --stringparam withns 'yes' --stringparam mode prefixed -o $@ ${GML2DTD} ${LHEO_LANGAGE}
${XSD_LHEO}: ${LHEO_LANGAGE} ${GML2XSD}
	@${ECHO} "Generation ${XSD_LHEO}"
	@${XSLTPROC} -o /tmp/lheo.xsd.temp ${GML2XSD} ${LHEO_LANGAGE}
	@${SED} 's/__GMLCOLON__/:/g' /tmp/lheo.xsd.temp > $@
${TABLES_LHEO}: ${LHEO_LANGAGE} ${LHEO_TABLES} ${GML2DICT}
	@${ECHO} "Generation $@"
	@${XSLTPROC} -o $@ ${GML2DICT} ${LHEO_LANGAGE}
${LHEO_GLOSSAIRE_TARGET}: ${LHEO_GLOSSAIRE}
	@${ECHO} "Copie $@"
	@${CP} $^ $@
${STRUCT_LHEO_EXAMPLE}: ${LHEO_LANGAGE} ${GML2EXAMPLE}
	@${ECHO} "Generation $@"
	@xsltproc --stringparam outputnamespace yes --stringparam exampleproperty yes --stringparam doctype "no" --stringparam complete yes --stringparam root lheo --stringparam indent '  ' -o $@ ${GML2EXAMPLE} ${LHEO_LANGAGE}

clean:
	rm -fr ${TARGET}
	(cd doc; make clean)

doc:
	(cd doc; make html)
	(cd doc; make pdf)
