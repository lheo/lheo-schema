<?xml version="1.0" encoding="utf-8"?>
<!-- 
GML2TREE

Dumps a list of elements contained in a language, in a recursive way, one element per line.

Copyright 2006 ARMINES/CRI, DGEFP.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:gml="http://www.gelaba.org/gml/1.1"
		version="1.0">

  <xsl:include href="libgmlcheck.xsl" />

  <xsl:output method="text" encoding="utf-8" />

  <xsl:param name="root" select="''" />    

  <xsl:template name="def">
    <xsl:param name="path" />

    <xsl:text>ELEMENT </xsl:text>
    <xsl:value-of select="@name"/>
    <xsl:call-template name="nl"/>

    <xsl:choose>
      <xsl:when test="gml:element_type/gml:sequence">
	<xsl:for-each select="gml:element_type/gml:sequence/gml:element">
	  <xsl:variable name="n" select="@name"/>
	  <xsl:variable name="element" select="@name"/>
	  <xsl:variable name="path_suffix">
	    <xsl:value-of select="$element"/>
	    <xsl:text>/</xsl:text>
	  </xsl:variable>
	  <xsl:variable name="path_comparator">
	    <xsl:text>/</xsl:text>
	    <xsl:value-of select="$path_suffix"/>
	  </xsl:variable>
	  <xsl:if test="not(contains($path, $path_comparator))">		
	    <xsl:for-each select="//gml:definition[@name=$n]">
	      <xsl:call-template name="def">
		<xsl:with-param name="path" select="concat($path, $path_suffix)"/>
	      </xsl:call-template>
	    </xsl:for-each>
	  </xsl:if>
	</xsl:for-each>
      </xsl:when>
      <xsl:when test="gml:element_type/gml:choice">
	<xsl:for-each select="gml:element_type/gml:choice/gml:choice_element">
	  <xsl:variable name="n" select="@name"/>
	  <xsl:variable name="element" select="@name"/>
	  <xsl:variable name="path_suffix">
	    <xsl:value-of select="$element"/>
	    <xsl:text>/</xsl:text>
	  </xsl:variable>
	  <xsl:variable name="path_comparator">
	    <xsl:text>/</xsl:text>
	    <xsl:value-of select="$path_suffix"/>
	  </xsl:variable>
	  <xsl:if test="not(contains($path, $path_comparator))">			   
	    <xsl:for-each select="//gml:definition[@name=$n]">
	      <xsl:call-template name="def">
		<xsl:with-param name="path" select="concat($path, $path_suffix)"/>
	      </xsl:call-template>
	    </xsl:for-each>
	  </xsl:if>
	</xsl:for-each>
      </xsl:when>
      <xsl:when test="gml:element_type/gml:basic_key">
	<xsl:text>DICT </xsl:text>
	<xsl:value-of select="gml:element_type/gml:basic_key/@ref"/>
	<xsl:call-template name="nl"/>
      </xsl:when>
    </xsl:choose>

    <xsl:for-each select="gml:attribute/gml:attribute_type/gml:attribute_key">
      <xsl:text>DICT </xsl:text>
      <xsl:value-of select="@ref"/>
      <xsl:call-template name="nl"/>
    </xsl:for-each>

    <xsl:for-each select="gml:attribute/gml:attribute_type/gml:attribute_embedded_key">
      <xsl:text>DICT </xsl:text>
      <xsl:value-of select="@ref"/>
      <xsl:call-template name="nl"/>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template match="/gml:definitions">
    <xsl:call-template name="GMLCheck"/>
    <xsl:for-each select="gml:definition[@name=$root]">
      <xsl:call-template name="def"/>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="text()"/>

  <xsl:template name="nl">
    <xsl:text>
</xsl:text>
  </xsl:template>

</xsl:stylesheet>
