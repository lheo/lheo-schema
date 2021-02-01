<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:gml="http://www.gelaba.org/gml/1.1"
                xmlns:html="http://www.w3.org/1999/xhtml">

    <xsl:output method="html" encoding="utf-8" indent="yes" omit-xml-declaration="yes"/>

    <xsl:param name="urlglossaire" select="''"/>
    <xsl:param name="fichierglossaire" select="''"/>
    <xsl:param name="mode" select="'tables'"/>
    <xsl:variable name="docglossaire" select="document($fichierglossaire)"/>

    <xsl:template match="/">
        <xsl:variable name="urlversion">
            <xsl:value-of select="gml:definitions/gml:property[@name='glb:baseurl']/@value"/>
            <xsl:text>/</xsl:text>
            <xsl:value-of select="gml:definitions/@version"/>
        </xsl:variable>
        <xsl:variable name="defns" select="gml:definitions/@default_ns_prefix"/>
        <xsl:variable name="ns" select="gml:definitions/gml:namespace[@ns_prefix=$defns]/@href"/>

        # -*- coding: utf-8 -*-
        <div class="row voffset">
            <div class="col-sm-4">
                <h3 class="mg-md tc-dark-slate-blue">
                    Le premier cercle d'informations
                </h3>
                <h4 class="mg-md tc-dark-slate-blue">Éléments obligatoires</h4>
                <ul class="list-unstyled elements">
                    <xsl:for-each select="//gml:definition[gml:property[@name='lheo:cercle']/@value='1']">
                        <li>
                            <p>
                                <a href="/langage#{@name}" title="{@name}">
                                    <xsl:value-of select="gml:fullname[@xml:lang='fr']/text()"/>
                                </a>
                            </p>
                        </li>
                    </xsl:for-each>
                </ul>
            </div>
            <div class="col-sm-4">
                <h3 class="mg-md tc-dark-slate-blue">
                    Le deuxième cercle d'informations
                </h3>
                <h4 class="mg-md tc-dark-slate-blue">Éléments optionnels</h4>
                <ul class="list-unstyled elements">
                    <xsl:for-each select="//gml:definition[gml:property[@name='lheo:cercle']/@value='2']">
                        <li>
                            <p>
                                <a href="/langage#{@name}" title="{@name}">
                                    <xsl:value-of select="gml:fullname[@xml:lang='fr']/text()"/>
                                </a>
                            </p>
                        </li>
                    </xsl:for-each>
                </ul>
            </div>
            <div class="col-sm-4">
                <h3 class="mg-md tc-dark-slate-blue">
                    Les éléments d'extension
                </h3>

                <p>
                    Au delà de ces deux cercles d'informations,
                    chaque structure peut étendre ce référentiel
                    par des données supplémentaires, en fonction de sa stratégie,
                    de ses objectifs, de ses spécificités et de ses besoins de gestion.
                </p>

                <p>
                    Les éléments obligatoires et optionnels peuvent être étendus avec
                    l'ajout d'éléments apportant des précisions. De nouveaux éléments
                    peuvent également être ajoutés à différents endroits de la structure de données.
                </p>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>
