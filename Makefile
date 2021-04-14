#
# PATHS
#
CDIR=$(shell pwd)
GELABA ?= ../../rec/gelaba/gelaba
TARGET=${CDIR}/target
DEFS=${CDIR}/definition
MANUEL=${CDIR}/manuel

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
LHEO_CHANGES=${DEFS}/changements.html
LHEO_SCHEMA=${DEFS}/lheo-2.0.0.pdf
LHEO_RDDL=${DEFS}/version.html
LHEO_LANGAGE=${DEFS}/lheo-gml.xml
LHEO_GLOSSAIRE=${DEFS}/lheo-glossaire.html
VERSION=$(shell ${XSLTPROC} ${GML2VERSION} ${LHEO_LANGAGE})
NAME=$(shell ${XSLTPROC} ${GML2NAME} ${LHEO_LANGAGE})
LHEO_MANUEL=${MANUEL}/manuel.xsl
LHEO_MANUEL_INTRO=${MANUEL}/manuel-introduction.tex
LHEO_MANUEL_LEGER=${MANUEL}/manuel-lheo-index.tex
LHEO_MANUEL_FIGURE=${MANUEL}/fonctionnement_recherche.pdf
TABLE_MODALITE_V9_SOURCE=${DEFS}/dict-code-modalite-pedagogique-V9.xml
TABLE_PUBLIC_V9_SOURCE=${DEFS}/dict-public-vise-formacode-V9.xml
TABLE_NSF_SOURCE=${DEFS}/lheo-dict-NSF.xml
TABLE_MODALITES_PEDAGOGIQUES_FORMACODES_SOURCE=${DEFS}/dict-modalites-pedagogiques-formacodes-V10.xml
TABLE_FINANCEURS_FORMACODES_SOURCE=${DEFS}/dict-financeurs-formacodes-V10.xml
TABLE_FOAD_SOURCE=${DEFS}/dict-FOAD.xml
TABLE_PUBLIC_VISE_FORMACODE_SOURCE=${DEFS}/dict-public-vise-formacode-V10.xml
TABLE_NIVEAUX_SOURCE=${DEFS}/dict-niveaux.xml
TABLE_MODALITES_ES_SOURCE=${DEFS}/dict-modalites-es.xml
TABLE_AIS_SOURCE=${DEFS}/dict-AIS.xml
TABLE_PERIMETRE_RECRUTEMENT_SOURCE=${DEFS}/dict-perimetre-recrutement.xml
TABLE_ETAT_RECRUTEMENT_SOURCE=${DEFS}/dict-etat-recrutement.xml
DOC=doc

#
# CIBLE AVEC VERSION
#
VTARGET=${TARGET}/${VERSION}
VTARGETDOC=${TARGET}/${VERSION}/${DOC}
RDDLTARGET=${TARGET}/${VERSION}/index.html

#
# TARGETS
#
GML_DTD_TARGET=${VTARGETDOC}/gml.dtd
GML_LHEO=${VTARGETDOC}/lheo-gml.xml
DTD_LHEO=${VTARGET}/lheo.dtd
XSD_LHEO=${VTARGET}/lheo.xsd
CHANGES_LHEO=${VTARGET}/changements.html
PDF_SCHEMA_LHEO=${VTARGET}/lheo-schema.pdf
STRUCT_LHEO_FULL=${VTARGETDOC}/lheo-structure-full.xml
STRUCT_LHEO_EXAMPLE=${VTARGET}/lheo-exemple.xml
STRUCT_LHEO_LEGER_EXAMPLE=${VTARGET}/lheo-index-exemple.xml
STRUCT_LHEO=${VTARGETDOC}/lheo-structure.xml
MANUEL_LHEO=${VTARGET}/lheo.pdf
LHEO_GLOSSAIRE_TARGET=${VTARGET}/lheo-glossaire.html
TABLES_LHEO=${VTARGET}/lheo-tables.xml
TABLE_MODALITE_V9=${VTARGET}/dict-code-modalite-pedagogique-V9.xml
TABLE_PUBLIC_V9=${VTARGET}/dict-public-vise-formacode-V9.xml
TABLE_NSF_V1=${VTARGET}/dict-NSF-V1.xml
TABLE_MODALITES_PEDAGOGIQUES_FORMACODES_V10=${VTARGET}/dict-modalites-pedagogiques-formacodes-V10.xml
TABLE_FINANCEURS_FORMACODES_V10=${VTARGET}/dict-financeurs-formacodes-V10.xml
TABLE_FOAD=${VTARGET}/dict-FOAD.xml
TABLE_PUBLIC_VISE_FORMACODE=${VTARGET}/dict-public-vise-formacode-V10.xml
TABLE_NIVEAUX=${VTARGET}/dict-niveaux.xml
TABLE_MODALITES_ES=${VTARGET}/dict-modalites-es.xml
TABLE_AIS=${VTARGET}/dict-AIS.xml
TABLE_PERIMETRE_RECRUTEMENT=${VTARGET}/dict-perimetre-recrutement.xml
TABLE_ETAT_RECRUTEMENT=${VTARGET}/dict-etat-recrutement.xml
GLOSSAIRE_BRUT=${VTARGET}/glossaire.txt
LHEO_BRUT=${VTARGET}/lheo.txt
TABLES_BRUT=${VTARGET}/tables.txt
FILES=\
 ${VTARGET}\
 ${CHANGES_LHEO}\
 ${PDF_SCHEMA_LHEO}\
 ${GML_LHEO}\
 ${GML_DTD_TARGET}\
 ${DTD_LHEO}\
 ${STRUCT_LHEO_FULL}\
 ${STRUCT_LHEO_EXAMPLE}\
 ${STRUCT_LHEO_LEGER_EXAMPLE}\
 ${STRUCT_LHEO}\
 ${LHEO_GLOSSAIRE_TARGET}\
 ${MANUEL_LHEO}\
 ${TABLE_MODALITE_V9}\
 ${TABLE_PUBLIC_V9}\
 ${TABLE_NSF_V1}\
 ${TABLE_MODALITES_PEDAGOGIQUES_FORMACODES_V10}\
 ${TABLE_FINANCEURS_FORMACODES_V10}\
 ${TABLE_FOAD}\
 ${TABLE_PUBLIC_VISE_FORMACODE}\
 ${TABLE_NIVEAUX}\
 ${TABLE_MODALITES_ES}\
 ${TABLE_AIS}\
 ${TABLE_PERIMETRE_RECRUTEMENT}\
 ${TABLE_ETAT_RECRUTEMENT}\
 ${RDDLTARGET}\
 ${XSD_LHEO}\
 ${GLOSSAIRE_BRUT}\
 ${TABLES_BRUT}\
 ${LHEO_BRUT}

MANUEL_AUX=\
 ${MANUEL}/lheo.aux\
 ${MANUEL}/lheo.idx\
 ${MANUEL}/lheo.ilg\
 ${MANUEL}/lheo.ind\
 ${MANUEL}/lheo.log\
 ${MANUEL}/lheo.out\
 ${MANUEL}/lheo.pdf\
 ${MANUEL}/lheo.tex\
 ${MANUEL}/lheo.toc

all: ${FILES}

${VTARGET}:
	@${SH} target.sh ${VERSION} ${DOC}
${RDDLTARGET}: ${LHEO_RDDL} 
	@${ECHO} "Generation ${RDDLTARGET}"
	@${CP} $^ $@

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
${GML_LHEO}: ${LHEO_LANGAGE}
	@${ECHO} "Copie $@"
	@${CP} $^ $@
${GML_DTD_TARGET}: ${GML_DTD}
	@${ECHO} "Copie $@"
	@${CP} $^ $@
${GML2MICRO_TARGET}: ${GML2MICRO}
	@${ECHO} "Copie $@"
	@${CP} $^ $@
${LHEO_GLOSSAIRE_TARGET}: ${LHEO_GLOSSAIRE}
	@${ECHO} "Copie $@"
	@${CP} $^ $@
${CHANGES_LHEO}: ${LHEO_CHANGES}
	@${ECHO} "Copie $@"
	@${CP} $^ $@
${PDF_SCHEMA_LHEO}: ${LHEO_SCHEMA}
	@${ECHO} "Copie $@"
	@${CP} $^ $@
${TABLE_MODALITE_V9}: ${TABLE_MODALITE_V9_SOURCE}
	@${ECHO} "Copie $@"
	@${CP} $^ $@
${TABLE_PUBLIC_V9}: ${TABLE_PUBLIC_V9_SOURCE}
	@${ECHO} "Copie $@"
	@${CP} $^ $@
${TABLE_NSF_V1}: ${TABLE_NSF_SOURCE}
	@${ECHO} "Copie $@"
	@${CP} $^ $@
${TABLE_MODALITES_PEDAGOGIQUES_FORMACODES_V10}: ${TABLE_MODALITES_PEDAGOGIQUES_FORMACODES_SOURCE}
	@${ECHO} "Copie $@"
	@${CP} $^ $@
${TABLE_FINANCEURS_FORMACODES_V10}: ${TABLE_FINANCEURS_FORMACODES_SOURCE}
	@${ECHO} "Copie $@"
	@${CP} $^ $@
${TABLE_FOAD}: ${TABLE_FOAD_SOURCE}
	@${ECHO} "Copie $@"
	@${CP} $^ $@
${TABLE_PUBLIC_VISE_FORMACODE}: ${TABLE_PUBLIC_VISE_FORMACODE_SOURCE}
	@${ECHO} "Copie $@"
	@${CP} $^ $@
${TABLE_NIVEAUX}: ${TABLE_NIVEAUX_SOURCE}
	@${ECHO} "Copie $@"
	@${CP} $^ $@
${TABLE_MODALITES_ES}: ${TABLE_MODALITES_ES_SOURCE}
	@${ECHO} "Copie $@"
	@${CP} $^ $@
${TABLE_AIS}: ${TABLE_AIS_SOURCE}
	@${ECHO} "Copie $@"
	@${CP} $^ $@
${TABLE_PERIMETRE_RECRUTEMENT}: ${TABLE_PERIMETRE_RECRUTEMENT_SOURCE}
	@${ECHO} "Copie $@"
	@${CP} $^ $@
${TABLE_ETAT_RECRUTEMENT}: ${TABLE_ETAT_RECRUTEMENT_SOURCE}
	@${ECHO} "Copie $@"
	@${CP} $^ $@

${STRUCT_LHEO_FULL}: ${LHEO_LANGAGE} ${GML2EXAMPLE}
	@${ECHO} "Generation $@"
	@xsltproc --stringparam doctype-system "lheo.dtd" --stringparam complete yes --stringparam root lheo --stringparam indent ' ' -o $@ ${GML2EXAMPLE} ${LHEO_LANGAGE}

${STRUCT_LHEO_EXAMPLE}: ${LHEO_LANGAGE} ${GML2EXAMPLE}
	@${ECHO} "Generation $@"
	@xsltproc --stringparam outputnamespace yes --stringparam exampleproperty yes --stringparam doctype "no" --stringparam complete yes --stringparam root lheo --stringparam indent '  ' -o $@ ${GML2EXAMPLE} ${LHEO_LANGAGE}

${STRUCT_LHEO_LEGER_EXAMPLE}: ${LHEO_LANGAGE} ${GML2EXAMPLE}
	@${ECHO} "Generation $@"
	@xsltproc --stringparam outputnamespace yes --stringparam exampleproperty yes --stringparam doctype "no" --stringparam complete yes --stringparam root lheo-index --stringparam indent '  ' -o $@ ${GML2EXAMPLE} ${LHEO_LANGAGE}

${STRUCT_LHEO}: ${LHEO_LANGAGE} ${GML2EXAMPLE}
	@${ECHO} "Generation $@"
	@xsltproc --stringparam doctype-system "lheo.dtd" --stringparam complete no --stringparam root lheo --stringparam indent ' ' -o $@ ${GML2EXAMPLE} ${LHEO_LANGAGE}

${MANUEL_LHEO}: ${LHEO_LANGAGE} ${STRUCT_LHEO_EXAMPLE} ${STRUCT_LHEO_LEGER_EXAMPLE} ${LHEO_GLOSSAIRE} ${LHEO_MANUEL} ${LHEO_MANUEL_INTRO} ${LHEO_MANUEL_LEGER} ${LHEO_MANUEL_FIGURE}
	@${ECHO} "Generation $@"
	@(cd ${MANUEL}; ${XSLTPROC} --stringparam glossaire ${LHEO_GLOSSAIRE} -o lheo.tex ${LHEO_MANUEL} ${LHEO_LANGAGE}; pdflatex lheo; pdflatex lheo; pdflatex lheo; makeindex lheo; pdflatex lheo; pdflatex lheo; cp lheo.pdf $@)

${VTARGET}/lheo.txt: ${TARGET}/elements.xml
	@${ECHO} "Generation de $@" 
	@(echo "<html>" > $@)
	@(sed 's/glossaire.html/glossaire/g' $^ >> $@)
	@(sed 's/tables.html/tables/g' $^ >> $@)
	@(echo "</html>" >> $@)

${VTARGET}/glossaire.txt: ${TARGET}/glossaire.xml
	@${ECHO} "Generation de $@" 
	@(echo "<html>" > $@)
	@(cat $^ >> $@)
	@(echo "</html>" >> $@)

${VTARGET}/tables.txt: ${TARGET}/tables.xml
	@${ECHO} "Generation de $@"
	@(echo "<html>" > $@)
	@(cat $^ >> $@)
	@(echo "</html>" >> $@)

clean-target:
	rm -fr ${TARGET}
	rm -fr ${TARGET_ND}
	rm -f ${MANUEL_AUX}

##
##
# WEB CONSTRUCTION
##
##

WEBSITE=${CDIR}/website

#
# WEB PAGES TEMPLATES
#
WEBPAGE=${WEBSITE}/webpage.xsl
ELEMENTS=${WEBSITE}/elements.xsl
GLOSSAIRE=${WEBSITE}/glossaire.xsl
TABLES=${WEBSITE}/tables.xsl
TPL_CSS=${WEBSITE}/layout.css
TPL_IMAGES=${WEBSITE}/images/logo.gif ${WEBSITE}/images/manuel.png ${WEBSITE}/images/cdr_bouton.gif ${WEBSITE}/images/schema-cercles.png
TPL_MENU=menu-essai.xml
TPL_INDEX=index_tpl.xml
TPL_PRODUCTION=production_tpl.xml
TPL_EQUIPE=equipe_tpl.xml
TPL_DOWNLOAD=download_tpl.xml
TPL_NOUVELLES=nouvelles_tpl.xml
TPL_LANGAGE=langage_tpl.xml
TPL_GLOSSAIRE=glossaire_tpl.xml
TPL_TABLES=tables_tpl.xml
TPL_LHEO=lheo_tpl.xml

#
# WEB TARGETS
#
LONGVERSION=$(shell ${XSLTPROC} ${WEBSITE}/longversion.xsl ${LHEO_LANGAGE})
CSS=layout.css
WEB_CSS=${TARGET}/${CSS}
WEB_IMAGES=${TARGET}/logo.gif ${TARGET}/manuel.png ${TARGET}/cdr_bouton.gif ${TARGET}/schema-cercles.png
WEB_INDEX=${TARGET}/index.html
WEB_PRODUCTION=${TARGET}/production.html
WEB_EQUIPE=${TARGET}/equipe.html
WEB_DOWNLOAD=${TARGET}/download.html
WEB_NOUVELLES=${TARGET}/nouvelles.html
WEB_LANGAGE=${TARGET}/langage.html
WEB_GLOSSAIRE=${TARGET}/glossaire.html
WEB_TABLES=${TARGET}/tables.html
WEB_LHEO=${TARGET}/lheo.html
WEB_FILES=\
 ${WEB_CSS}\
 ${WEB_IMAGES}\
 ${WEB_INDEX}\
 ${WEB_PRODUCTION}\
 ${WEB_EQUIPE}\
 ${WEB_NOUVELLES}\
 ${WEB_LANGAGE}\
 ${WEB_GLOSSAIRE}\
 ${WEB_TABLES}\
 ${WEB_LHEO}\
 ${WEB_DOWNLOAD}

web: ${FILES} ${WEB_FILES}
${WEB_INDEX}: ${WEBPAGE} ${WEBSITE}/${TPL_INDEX} ${WEBSITE}/${TPL_MENU}
	@${ECHO} "Generation de $@" 
	@${XSLTPROC} \
                 --stringparam css ${CSS} \
                 --stringparam content ${TPL_INDEX} \
                 --stringparam extra-content '' \
                 --stringparam content-left '' \
                 --stringparam menu ${TPL_MENU} \
                 --stringparam menu-item 'menu-index' \
                 --stringparam submenu 'menu-index' \
                 --stringparam version "${VERSION}" \
                 --stringparam longversion "${LONGVERSION}" \
                -o $@ ${WEBPAGE} ${WEBSITE}/${TPL_INDEX}
${WEB_PRODUCTION}: ${WEBPAGE}  ${WEBSITE}/${TPL_PRODUCTION} ${WEBSITE}/${TPL_MENU}
	@${ECHO} "Generation de $@" 
	@${XSLTPROC} \
                 --stringparam css ${CSS} \
                 --stringparam content ${TPL_PRODUCTION} \
                 --stringparam extra-content '' \
                 --stringparam content-left '' \
                 --stringparam menu ${TPL_MENU} \
                 --stringparam menu-item 'menu-production' \
                 --stringparam submenu 'menu-production' \
                 --stringparam version "${VERSION}" \
                 --stringparam longversion "${LONGVERSION}" \
                -o $@ ${WEBPAGE} ${WEBSITE}/${TPL_PRODUCTION}
${WEB_EQUIPE}: ${WEBPAGE} ${WEBSITE}/${TPL_EQUIPE} ${WEBSITE}/${TPL_MENU}
	@${ECHO} "Generation de $@" 
	@${XSLTPROC} \
                 --stringparam css ${CSS} \
                 --stringparam content ${TPL_EQUIPE} \
                 --stringparam extra-content '' \
                 --stringparam content-left '' \
                 --stringparam menu ${TPL_MENU} \
                 --stringparam menu-item 'menu-equipe' \
                 --stringparam submenu 'menu-equipe' \
                 --stringparam version "${VERSION}" \
                 --stringparam longversion "${LONGVERSION}" \
                -o $@ ${WEBPAGE} ${WEBSITE}/${TPL_EQUIPE}
${WEB_DOWNLOAD}: ${WEBPAGE} ${WEBSITE}/${TPL_DOWNLOAD} ${WEBSITE}/${TPL_MENU}
	@${ECHO} "Generation de $@" 
	@${XSLTPROC} \
                 --stringparam css ${CSS} \
                 --stringparam content ${TPL_DOWNLOAD} \
                 --stringparam extra-content '' \
                 --stringparam content-left '' \
                 --stringparam menu ${TPL_MENU} \
                 --stringparam menu-item 'menu-download' \
                 --stringparam version "${VERSION}" \
                 --stringparam longversion "${LONGVERSION}" \
                -o $@ ${WEBPAGE} ${WEBSITE}/${TPL_DOWNLOAD}
${WEB_NOUVELLES}: ${WEBPAGE} ${WEBSITE}/${TPL_NOUVELLES} ${WEBSITE}/${TPL_MENU}
	@${ECHO} "Generation de $@" 
	@${XSLTPROC} \
                 --stringparam css ${CSS} \
                 --stringparam content ${TPL_NOUVELLES} \
                 --stringparam extra-content '' \
                 --stringparam content-left '' \
                 --stringparam menu ${TPL_MENU} \
                 --stringparam menu-item 'menu-nouvelles' \
                 --stringparam submenu 'menu-nouvelles' \
                 --stringparam version "${VERSION}" \
                 --stringparam longversion "${LONGVERSION}" \
                -o $@ ${WEBPAGE} ${WEBSITE}/${TPL_NOUVELLES}
${WEB_LANGAGE}: ${WEBPAGE} ${WEBSITE}/${TPL_LANGAGE} ${WEBSITE}/${TPL_MENU}
	@${ECHO} "Generation de $@" 
	@${XSLTPROC} \
                 --stringparam css ${CSS} \
                 --stringparam content ${TPL_LANGAGE} \
                 --stringparam extra-content '' \
                 --stringparam content-left '' \
                 --stringparam menu ${TPL_MENU} \
                 --stringparam menu-item 'menu-langage' \
                 --stringparam submenu 'menu-langage' \
                 --stringparam version "${VERSION}" \
                 --stringparam longversion "${LONGVERSION}" \
                -o $@ ${WEBPAGE} ${WEBSITE}/${TPL_LANGAGE}
${WEB_GLOSSAIRE}: ${WEBPAGE} ${WEBSITE}/${TPL_GLOSSAIRE} ${WEBSITE}/${TPL_MENU} ${TARGET}/glossaire.xml
	@${ECHO} "Generation de $@" 
	@${XSLTPROC} \
                 --stringparam css ${CSS} \
                 --stringparam content ${TPL_GLOSSAIRE} \
                 --stringparam extra-content ${TARGET}/glossaire.xml \
                 --stringparam content-left '' \
                 --stringparam menu ${TPL_MENU} \
                 --stringparam menu-item 'menu-glossaire' \
                 --stringparam submenu 'menu-langage' \
                 --stringparam version "${VERSION}" \
                 --stringparam longversion "${LONGVERSION}" \
                -o $@ ${WEBPAGE} ${WEBSITE}/${TPL_GLOSSAIRE}
${WEB_TABLES}: ${WEBPAGE} ${WEBSITE}/${TPL_TABLES} ${WEBSITE}/${TPL_MENU} ${TARGET}/tables.xml
	@${ECHO} "Generation de $@" 
	@${XSLTPROC} \
                 --stringparam css ${CSS} \
                 --stringparam content ${TPL_TABLES} \
                 --stringparam extra-content ${TARGET}/tables.xml \
                 --stringparam content-left '' \
                 --stringparam menu ${TPL_MENU} \
                 --stringparam menu-item 'menu-tables' \
                 --stringparam submenu 'menu-langage' \
                 --stringparam version "${VERSION}" \
                 --stringparam longversion "${LONGVERSION}" \
                -o $@ ${WEBPAGE} ${WEBSITE}/${TPL_TABLES}
${WEB_LHEO}: ${WEBPAGE} ${WEBSITE}/${TPL_LHEO} ${WEBSITE}/${TPL_MENU} ${TARGET}/elements.xml
	@${ECHO} "Generation de $@" 
	@${XSLTPROC} \
                 --stringparam css ${CSS} \
                 --stringparam content ${TPL_LHEO} \
                 --stringparam extra-content ${TARGET}/elements.xml \
                 --stringparam content-left '' \
                 --stringparam menu ${TPL_MENU} \
                 --stringparam menu-item 'menu-lheo' \
                 --stringparam submenu 'menu-langage' \
                 --stringparam version "${VERSION}" \
                 --stringparam longversion "${LONGVERSION}" \
                -o $@ ${WEBPAGE} ${WEBSITE}/${TPL_LHEO}
${WEB_CSS}: ${TPL_CSS}
	@${ECHO} "Generation de $@" 
	@${CP} $^ $@
${WEB_IMAGES}: ${TPL_IMAGES}
	@${ECHO} "Generation de $@" 
	@${CP} ${TPL_IMAGES} ${TARGET}

${TARGET}/elements.xml: ${ELEMENTS} ${GML_LHEO} ${LHEO_GLOSSAIRE_TARGET}
	@${ECHO} "Generation de $@" 
	@${XSLTPROC} \
		 --stringparam urlglossaire '/glossaire.html' \
		 --stringparam urltables '/tables.html' \
		 --stringparam fichierglossaire ${LHEO_GLOSSAIRE_TARGET} \
                 --stringparam gmldef ${GML_LHEO} \
                 -o $@ ${ELEMENTS} ${GML_LHEO}
${TARGET}/glossaire.xml: ${GLOSSAIRE} ${LHEO_GLOSSAIRE_TARGET} ${GML_LHEO}
	@${ECHO} "Generation de $@" 
	@${XSLTPROC} --stringparam gmldef ${GML_LHEO} -o $@ ${GLOSSAIRE} ${LHEO_GLOSSAIRE_TARGET}
${TARGET}/tables.xml: ${TABLES} ${TABLES_LHEO} ${GML_LHEO}
	@${ECHO} "Generation de $@" 
	@${XSLTPROC} --stringparam gmldef ${GML_LHEO} -o $@ ${TABLES} ${TABLES_LHEO}


##############
# NEW DESIGN #
##############
#
# PATHS
#
TARGET_ND=${CDIR}/target-nd

#
# VARIABLES
#
ELEMENTS_ND=${WEBSITE}/langage.xsl
ELEMENTS_SHORT_ND=${WEBSITE}/langage_short.xsl
TABLES_ND=${WEBSITE}/tables_nd.xsl
GLOSSAIRE_ND=${WEBSITE}/glossaire_nd.xsl
LHEO_GLOSSAIRE_ND=${DEFS}/lheo-glossaire-nd.mako
LHEO_GLOSSAIRE_TARGET_ND=${TARGET_ND}/glossaire.mako
WEB_LHEO_ND=${TARGET_ND}/langage.mako
WEB_SHORT_LHEO_ND=${TARGET_ND}/langage_short.mako
WEB_TABLES_ND=${TARGET_ND}/tables.mako
WEB_GLOSSAIRE_ND=${TARGET_ND}/glossaire.mako
WEB_FILES_ND=\
 ${WEB_CSS}\
 ${WEB_IMAGES}\
 ${WEB_INDEX}\
 ${WEB_PRODUCTION}\
 ${WEB_EQUIPE}\
 ${WEB_NOUVELLES}\
 ${WEB_LANGAGE}\
 ${WEB_GLOSSAIRE_ND}\
 ${WEB_TABLES_ND}\
 ${WEB_LHEO_ND}\
 ${WEB_SHORT_LHEO_ND}\
 ${WEB_DOWNLOAD}


#
# WEB TARGETS
#

web-nd: ${FILES} ${WEB_FILES_ND} ${LHEO_GLOSSAIRE_TARGET_ND}

#
# WEB PAGES TEMPLATES
#
${WEB_LHEO_ND}: ${ELEMENTS_ND} ${GML_LHEO}
	@${ECHO} "Generation de $@"
	@${XSLTPROC} \
        --stringparam urlglossaire '/glossaire' \
        --stringparam urltables '/tables' \
        --stringparam fichierglossaire ${LHEO_GLOSSAIRE_TARGET} \
        --stringparam version "${VERSION}" \
        --stringparam longversion "${LONGVERSION}" \
        -o $@ ${ELEMENTS_ND} ${GML_LHEO}

${WEB_SHORT_LHEO_ND}: ${ELEMENTS_SHORT_ND} ${GML_LHEO}
	@${ECHO} "Generation de $@"
	@${XSLTPROC} \
        --stringparam urlglossaire '/glossaire' \
        --stringparam urltables '/tables' \
        --stringparam fichierglossaire ${LHEO_GLOSSAIRE_TARGET} \
        --stringparam version "${VERSION}" \
        --stringparam longversion "${LONGVERSION}" \
        -o $@ ${ELEMENTS_SHORT_ND} ${GML_LHEO}

${WEB_TABLES_ND}: ${TABLES_ND} ${GML_LHEO}
	@${ECHO} "Generation de $@"
	@${XSLTPROC} \
                 --stringparam version "${VERSION}" \
                 --stringparam longversion "${LONGVERSION}" \
                 --stringparam gmldef ${GML_LHEO} \
                -o $@ ${TABLES_ND} ${GML_LHEO}

${LHEO_GLOSSAIRE_TARGET_ND}: ${LHEO_GLOSSAIRE_ND}
	@${ECHO} "Copie $@"
	@mkdir -p target-nd
	@${CP} $^ $@