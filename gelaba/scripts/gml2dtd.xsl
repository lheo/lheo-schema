<?xml version="1.0" encoding="utf-8"?>
<!-- 
GML2DTD

Transforms a language described in GML in a DTD.

Copyright 2006 ARMINES/CRI, DGEFP.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:gml="http://www.gelaba.org/gml/1.1"
		version="1.0">

  <xsl:output method="text" encoding="utf-8" />

  <xsl:param name="mode" select="'raw'"/>
  <xsl:param name="withns" select="'no'"/>
  <xsl:param name="element" select="''"/>

  <xsl:include href="libgmlcheck.xsl"/>
  <xsl:include href="libgmldtd.xsl"/>
  <xsl:include href="libgmlutils.xsl"/>

  <xsl:template match="/">
    <xsl:choose>
      <xsl:when test="$mode='raw'">
	<xsl:apply-templates select="gml:definitions" mode="raw"/>
      </xsl:when>
      <xsl:when test="$mode='prefixed'">
	<xsl:apply-templates select="gml:definitions" mode="prefixed"/>
      </xsl:when>
      <xsl:when test="$mode='one'">
	<xsl:apply-templates select="gml:definitions" mode="one"/>
      </xsl:when>
      <xsl:otherwise>
	<xsl:apply-templates select="gml:definitions" mode="check"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="gml:definitions" mode="check">
    <xsl:call-template name="GMLCheck" />
  </xsl:template>

  <xsl:template match="gml:definitions" mode="raw">
    <xsl:call-template name="GMLCheck" />
    <xsl:variable name="ns">
      <xsl:if test="$withns = 'yes'">
	<xsl:call-template name="getDefaultNS" />	  
      </xsl:if>
    </xsl:variable>
    <xsl:for-each select="gml:definition">
      <xsl:call-template name="dtd_dump_definition_raw">
	<xsl:with-param name="cdef" select="." />
	<xsl:with-param name="namespace" select="$ns"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="gml:definitions" mode="one">
    <xsl:variable name="ns">
      <xsl:if test="$withns = 'yes'">
	<xsl:call-template name="getDefaultNS" />
      </xsl:if>
    </xsl:variable>    
    <xsl:call-template name="dtd_dump_definition_raw">
      <xsl:with-param name="cdef" select="gml:definition[@name=$element]" />
      <xsl:with-param name="namespace" select="$ns"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="gml:definitions" mode="prefixed">
    <xsl:variable name="pfx" select="@language"/>
    <xsl:variable name="ns">
      <xsl:call-template name="getDefaultNS" />
    </xsl:variable>

    <xsl:call-template name="dtd_preamble">
      <xsl:with-param name="prefix" select="$pfx"/>
      <xsl:with-param name="namespace" select="$ns"/>
    </xsl:call-template>

    <xsl:for-each select="gml:definition">
      <xsl:call-template name="dtd_dump_qname">
	<xsl:with-param name="cdef" select="." />
	<xsl:with-param name="prefix" select="$pfx"/>
      </xsl:call-template>
    </xsl:for-each>

    <xsl:for-each select="gml:definition">
      <xsl:call-template name="dtd_dump_fields">
	<xsl:with-param name="cdef" select="." />
	<xsl:with-param name="prefix" select="$pfx"/>
      </xsl:call-template>
    </xsl:for-each>

    <xsl:for-each select="gml:definition">
      <xsl:call-template name="dtd_dump_definition">
	<xsl:with-param name="cdef" select="." />
	<xsl:with-param name="prefix" select="$pfx"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="text()|@*"/>

  <xsl:template match="gml:dict"/>

</xsl:stylesheet>
