<?xml version="1.0" encoding="utf-8"?>
<!-- 
GML2ELEMENTS

Dumps a list of elements contained in a language.

Copyright 2006 ARMINES/CRI, DGEFP.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:gml="http://www.gelaba.org/gml/1.1"
		version="1.0">

  <xsl:include href="libgmlcheck.xsl" />

  <xsl:output method="text" encoding="utf-8" />

  <xsl:param name="check" select="'yes'" />    

  <xsl:template match="gml:definitions">
    <xsl:if test="$check='yes'">
      <xsl:call-template name="GMLCheck"/>
    </xsl:if>

    <xsl:for-each select="gml:definition">
      <xsl:call-template name="dump-definition">
	<xsl:with-param name="element" select="." />
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="dump-definition">
    <xsl:param name="element" select="."/>
    <xsl:value-of select="$element/@name"/>
    <xsl:call-template name="nl" />
  </xsl:template>

  <xsl:template match="text()"/>

  <xsl:template name="nl">
    <xsl:text>&#10;</xsl:text>
  </xsl:template>

</xsl:stylesheet>
