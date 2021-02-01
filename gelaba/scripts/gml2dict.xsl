<?xml version="1.0" encoding="utf-8"?>
<!-- 
GML2DICT

Extract the dictionnaries from a GML description.

Copyright 2006 ARMINES/CRI, DGEFP.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:gml="http://www.gelaba.org/gml/1.1"
		xmlns="http://www.gelaba.org/gml/1.1"
		version="1.0">

  <xsl:output method="xml" encoding="utf-8" indent="yes" />

  <xsl:param name="check" select="'yes'" />    


  <xsl:template match="/gml:definitions">
    <dictionaries xml:lang="{@xml:lang}">
      <xsl:apply-templates select="gml:dict" />
    </dictionaries>
  </xsl:template>

  <xsl:template match="gml:dict[gml:property[@name='glb:full']]">
    <xsl:copy-of select="document(gml:property[@name='glb:full']/@value)" />
  </xsl:template>

  <xsl:template match="gml:dict">
    <xsl:copy-of select="." />
  </xsl:template>

  <xsl:template match="text()"/>

</xsl:stylesheet>
