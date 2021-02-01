<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:gml="http://www.gelaba.org/gml/1.1"
                xmlns:html="http://www.w3.org/1999/xhtml">

    <xsl:param name="gmldef" select="''"/>
    <xsl:output method="html" encoding="utf-8" indent="no" omit-xml-declaration="yes"/>

    <xsl:template match="/">
        # -*- coding: utf-8 -*-

        <!-- pb for writing the following line because of the '%'
            <%inherit file="../site.mako"/>\
        -->

        <!-- Main container -->
        <div class="page-container">

            <!-- bloc-54 -->
            <div class="bloc bgc-ube d-bloc" id="bloc-54">
                <div class="container bloc-lg">
                    <div class="row">
                        <div class="col-sm-12">
                            <h1 class="mg-md  tc-white">
                                Index des tables du langage Lhéo
                            </h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <ul class="list-unstyled">
                                <xsl:for-each select="//gml:dict">
                                    <li>
                                        <h6>
                                            <a class="mg-sm tc-white" title="{@name}" href="#{@name}">
                                                <xsl:value-of select="gml:fullname[@xml:lang='fr']"/>
                                            </a>

                                            <xsl:text>  (</xsl:text>
                                            <xsl:value-of select="@name"/>
                                            <xsl:text>)</xsl:text>
                                        </h6>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- bloc-54 END -->

            <!-- bloc-55 -->
            <div class="bloc tc-dark-slate-blue bgc-white l-bloc" id="bloc-55">
                <div class="container bloc-lg">
                    <div class="row">
                        <div class="col-sm-12">
                            <h3 class="mg-md  tc-dark-slate-blue">
                                Contenu des tables
                            </h3>
                            <xsl:for-each select="//gml:dict">
                                <xsl:apply-templates select="."/>
                            </xsl:for-each>
                        </div>
                    </div>
                </div>
            </div>
            <!-- bloc-55 END -->


        </div>
        <!-- Main container END -->

    </xsl:template>


    <xsl:template match="gml:dict">
        <xsl:variable name="gmldoc" select="document($gmldef)"/>
        <div class="table">
            <h4>
                <a title="{@name}" name="{@name}"></a>
                <xsl:value-of select="gml:fullname[@xml:lang='fr']"/>
                <xsl:text> [</xsl:text>
                <code>
                    <xsl:value-of select="@name"/>
                </code>
                <xsl:text>]</xsl:text>
            </h4>

            <xsl:variable name="name" select="@name"/>
            <xsl:variable name="references"
                          select="$gmldoc//gml:definition[.//gml:basic_key/@ref = $name]"/>
            <xsl:if test="count($references)">
                <p>
                    Élément(s) de LHÉO utilisant cette table :
                    <xsl:for-each select="$references">
                        <code>
                            <xsl:text>&lt;</xsl:text>
                            <!--<a href="/lheo#{@name}">-->
                            <code>
                                <xsl:value-of select="@name"/>
                            </code>
                            <!--</a>-->
                            <xsl:text>&gt;</xsl:text>
                        </code>
                        <xsl:if test="not(position() = last())">
                            <xsl:text>,</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                </p>
            </xsl:if>

            <xsl:apply-templates select="gml:doc[@xml:lang='fr']"/>
            <div class="table-responsive" style="max-width: 320px;">
                <table summary="{gml:fullname[@xml:lang='fr']}" class="table">
                    <thead>
                        <tr>
                            <th class="text-left">Clé(s)</th>
                            <th class="text-left">Valeur</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates select="gml:entry"/>
                    </tbody>
                </table>
            </div>

        </div>
    </xsl:template>

    <xsl:template match="gml:entry">
        <tr>
            <td class="cle-table text-left" style="min-width: 60px;">
                <xsl:for-each select="gml:key">
                    <code>
                        <xsl:value-of select="@val"/>
                    </code>
                    <xsl:if test="position() != last()">,</xsl:if>
                </xsl:for-each>
            </td>
            <td class="valeur-table text-left" style="min-width: 260px;">
                <xsl:choose>
                    <xsl:when test="gml:property[@name='lheo:url']">
                        <a href="{gml:property[@name='lheo:url']/@value}">
                            <xsl:value-of select="gml:value[@xml:lang='fr']/@val"/>
                        </a>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="gml:value[@xml:lang='fr']/@val"/>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="entree[../@extrait='oui' and position() &gt; 20]">
    </xsl:template>

    <xsl:template match="entree[../@extrait='oui' and position() = last()]">
        <tr>
            <td class="cle-table" align="center">
                <pre>...</pre>
            </td>
            <td class="valeur-table" align="center">...</td>
        </tr>
        <tr>
            <td class="cle-table" align="center">
                <pre>
                    <xsl:value-of select="cle"/>
                </pre>
            </td>
            <td class="valeur-table" align="center">
                <xsl:value-of select="valeur"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="gml:doc">
        <p>
            <xsl:value-of select="."/>
        </p>
    </xsl:template>

    <xsl:template match="text()"/>

</xsl:stylesheet>