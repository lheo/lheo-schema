<?xml version="1.0" encoding="utf-8"?>
<!-- 
GML2MM

Creates a mind map compatible with FreeMind (http://freemind.sourceforge.net)

Copyright 2006 ARMINES/CRI, DGEFP.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:gml="http://www.gelaba.org/gml/1.1"
		version="1.0">

  <xsl:include href="libgmlcheck.xsl" />
  <xsl:include href="libgmlutils.xsl" />

  <xsl:output method="xml" encoding="utf-8" indent="yes" />

  <xsl:param name="check" select="'yes'" />    
  <xsl:param name="root" select="''" />    
  <xsl:param name="lang" select="'en'" />    

  <xsl:template name="calldef">
    <xsl:param name="cname"/>
    <xsl:for-each select="/gml:definitions/gml:definition[@name=$cname]">
      <xsl:call-template name="def"/>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="def">
    <node>
      <xsl:attribute name="TEXT">
	<xsl:text>&lt;html&gt;&#xa;</xsl:text>
	<xsl:text>&lt;head&gt;&#xa;</xsl:text>
	<xsl:text>&lt;/head&gt;&#xa;</xsl:text>
	<xsl:text>&lt;body width=&quot;&quot;&gt; &#xa;</xsl:text>
	<xsl:text>&lt;p align=&quot;center&quot;&gt;&#xa;</xsl:text>      
	<xsl:value-of select="gml:fullname[@xml:lang=$lang]"/>
	<xsl:text>&lt;br&gt;</xsl:text>
	<xsl:text>&lt;small&gt;</xsl:text>
	<xsl:text>&lt;code&gt;</xsl:text>
	<xsl:text>&amp;lt;</xsl:text>
	<xsl:value-of select="@name"/>
	<xsl:text>&amp;gt;&lt;/code&gt;</xsl:text>
	<xsl:text>&lt;/small&gt;&#xa0;&#xa;</xsl:text>
	<xsl:text>&lt;/p&gt;&#xa;</xsl:text>
	<xsl:text>&lt;/body&gt;&#xa;</xsl:text>
	<xsl:text>&lt;/html&gt;&#xa;</xsl:text>
      </xsl:attribute>
      <xsl:choose>
	  <xsl:when test="gml:element_type/gml:sequence">
	    <xsl:attribute name="FOLDED">
	      <xsl:text>true</xsl:text>
	    </xsl:attribute>
	    <xsl:for-each select="gml:element_type/gml:sequence/gml:element">
	      <xsl:call-template name="calldef">
		<xsl:with-param name="cname" select="@name"/>
	      </xsl:call-template>
	    </xsl:for-each>
	  </xsl:when>
	  <xsl:when test="gml:element_type/gml:basic_text">
	    <node>
	      <xsl:attribute name="TEXT">
		<xsl:text>TEXT</xsl:text>
		<xsl:text> [</xsl:text>
		<xsl:for-each select="gml:element_type/gml:basic_text">
		  <xsl:call-template name="lgminValue"/>
		</xsl:for-each>
		<xsl:text>,</xsl:text>		
		<xsl:for-each select="gml:element_type/gml:basic_text">
		  <xsl:call-template name="lgmaxValue"/>
		</xsl:for-each>
		<xsl:text>]</xsl:text>		
	      </xsl:attribute>
	    </node>
	  </xsl:when>
	  <xsl:when test="gml:element_type/gml:basic_key">
	    <xsl:variable name="dname" select="gml:element_type/gml:basic_key/@ref"/>
	    <node>
	      <xsl:attribute name="TEXT">
		<xsl:text>CODE FROM </xsl:text>
		<xsl:value-of select="$dname"/>
	      </xsl:attribute>
	    </node>
	  </xsl:when>
	</xsl:choose>
    </node>
  </xsl:template>

  <xsl:template match="gml:definitions">
    <xsl:if test="$check='yes'">
      <xsl:call-template name="check"/>
    </xsl:if>
    
    <map>
      <xsl:for-each select="gml:definition[@name=$root]">
	<xsl:call-template name="def"/>
      </xsl:for-each>
    </map>
  </xsl:template>

  <xsl:template match="text()"/>

</xsl:stylesheet>
