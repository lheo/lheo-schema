<?xml version="1.0" encoding="utf-8"?>
<!-- 
GML2EXAMPLE

Dumps an example of XML file, in a recursive way.

Copyright 2006 ARMINES/CRI, DGEFP.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:gml="http://www.gelaba.org/gml/1.1"
		version="1.0">

  <xsl:output method="text" encoding="utf-8" />

  <xsl:include href="libgmlcheck.xsl" />
  <xsl:include href="libgmlexample.xsl" />

  <xsl:param name="check" select="'no'" />    
  <xsl:param name="root" select="''" />    
  <xsl:param name="outputfixed" select="'no'" />    
  <xsl:param name="outputprefixed" select="'no'" />    
  <xsl:param name="outputnamespace" select="'no'" />
  <xsl:param name="allattributes" select="'no'" />
  <xsl:param name="complete" select="'no'" />    
  <xsl:param name="doctype-public"/>    
  <xsl:param name="doctype-system"/>    
  <xsl:param name="doctypecontent"/>    
  <xsl:param name="xml-stylesheet"/>    
  <xsl:param name="xml-stylesheet-type" select="'text/xsl'"/>    
  <xsl:param name="indent"/>    
  <xsl:param name="lt" select="'&lt;'" />    
  <xsl:param name="gt" select="'&gt;'" />    
  <xsl:param name="maxdepth" select="'0'" />    
  <xsl:param name="examplefile" select="''" />    
  <xsl:param name="exampleposition" select="'1'" />    

  <xsl:template match="/gml:definitions">
    <xsl:variable name="exampledoc">
      <xsl:if test="string-length($examplefile) &gt; 0">
	<xsl:value-of select="document($examplefile)" />
      </xsl:if>
    </xsl:variable>

    <xsl:if test="$check='yes'">
      <xsl:call-template name="check"/>
    </xsl:if>

    <xsl:call-template name="print_begin"/>
    
    <xsl:call-template name="print_stylesheet">
      <xsl:with-param name="xml-stylesheet" select="$xml-stylesheet"/>    
    </xsl:call-template>

    <xsl:call-template name="print_doctype">
      <xsl:with-param name="doctype-public" select="$doctype-public"/>    
      <xsl:with-param name="doctype-system" select="$doctype-system"/>
      <xsl:with-param name="root" select="$root"/>
      <xsl:with-param name="doctypecontent" select="$doctypecontent" />    
    </xsl:call-template>

    <xsl:for-each select="gml:definition[@name=$root]">
      <xsl:call-template name="def">
	<xsl:with-param name="path">
	  <xsl:text>/</xsl:text><xsl:value-of select="@name"/><xsl:text>/</xsl:text>
	</xsl:with-param>
	<xsl:with-param name="outputfixed" select="$outputfixed"/>
	<xsl:with-param name="outputnamespace" select="$outputnamespace"/>
	<xsl:with-param name="prefix">
	  <xsl:if test="$outputprefixed = 'yes'">
	    <xsl:value-of select="../@language"/>
	  </xsl:if>
	</xsl:with-param>
	<xsl:with-param name="complete" select="$complete"/>
	<xsl:with-param name="indent" select="$indent"/>
	<xsl:with-param name="maxdepth" select="$maxdepth"/>
	<xsl:with-param name="lt" select="$lt" />    
	<xsl:with-param name="gt" select="$gt" />
 	<xsl:with-param name="examplefile" select="$examplefile"/>
	<xsl:with-param name="exampledoc" select="$exampledoc"/>
	<xsl:with-param name="exampleposition" select="$exampleposition" />
      </xsl:call-template>
    </xsl:for-each>
    <xsl:call-template name="nl"/>
  </xsl:template>

  <xsl:template match="text()"/>

</xsl:stylesheet>
