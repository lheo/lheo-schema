<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:gml="http://www.gelaba.org/gml/1.0"
		version="1.0">

  <xsl:param name="doctables" select="''"/>
  <xsl:param name="lang" select="'fr'"/>

  <xsl:variable name="dlang" select="/gml:definitions/@xml:lang"/>

  <xsl:output method="xml" encoding="utf-8" indent="yes" />

  <xsl:template match="/gml:definitions">
    <xsl:element name="xsl:stylesheet">
      <xsl:attribute name="xmlns:{@language}">
	<xsl:value-of select="@namespace" />
      </xsl:attribute>
      <xsl:attribute name="version">
	<xsl:text>1.0</xsl:text>
      </xsl:attribute>

      <xsl:apply-templates select="gml:definition" mode="content"/>
      <xsl:apply-templates select="gml:definition" mode="fullname"/>

      <xsl:apply-templates select="gml:dict"/>

    </xsl:element>
  </xsl:template>

  <xsl:template match="gml:definition" mode="content">
    <xsl:element name="xsl:template">
      <xsl:attribute name="match">
	<xsl:value-of select="@name" />
      </xsl:attribute>
      <xsl:attribute name="mode">
	<xsl:text>content</xsl:text>
      </xsl:attribute>
      <xsl:element name="xsl:value-of">
	<xsl:attribute name="select">
	  <xsl:text>text()</xsl:text>
	</xsl:attribute>	
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template match="gml:definition" mode="fullname">
    <xsl:element name="xsl:template">
      <xsl:attribute name="match">
	<xsl:value-of select="@name" />
      </xsl:attribute>
      <xsl:attribute name="mode">
	<xsl:text>fullname</xsl:text>
      </xsl:attribute>      
      <xsl:element name="xsl:text">
	<xsl:apply-templates select="gml:fullname" />
      </xsl:element>
    </xsl:element>
  </xsl:template>


  <xsl:template match="gml:fullname[@xml:lang=$lang or @xml:lang=$dlang]">
    <xsl:value-of select="text()" />
  </xsl:template>
  <xsl:template match="gml:fullname" />

  <xsl:template match="gml:dict[gml:property/@name='gml:service']">
    <xsl:variable name="docfile" select="gml:property[@name='gml:service']/@value" />
    <xsl:variable name="docdict" select="document($docfile)" />

    <xsl:element name="xsl:template">
      <xsl:attribute name="name">
	<xsl:text>dict_</xsl:text>
	<xsl:value-of select="@name" />
      </xsl:attribute>
      <xsl:element name="xsl:param">
	<xsl:attribute name="name">
	  <xsl:text>key</xsl:text>
	</xsl:attribute>
      </xsl:element>
      <xsl:element name="xsl:choose">
	<xsl:for-each select="$docdict/gml:dict/gml:entry/gml:key">
	  <xsl:element name="xsl:when">
	    <xsl:attribute name="test">
	      <xsl:text>$key='</xsl:text>
	      <xsl:value-of select="@val" />
	      <xsl:text>'</xsl:text>
	    </xsl:attribute>
	    <xsl:element name="xsl:text">
	      <xsl:apply-templates select="../gml:value"/>
	    </xsl:element>
	  </xsl:element>
	</xsl:for-each>
	<xsl:element name="xsl:otherwise">
	  <xsl:element name="xsl:text">
	    <xsl:text>UNKNOWN</xsl:text>
	  </xsl:element>
	</xsl:element>
      </xsl:element>
    </xsl:element>

  </xsl:template>

  <xsl:template match="gml:dict">
    
  </xsl:template>

  <xsl:template match="gml:value[@xml:lang=$lang or @xml:lang=$dlang]">
    <xsl:value-of select="@val" />
  </xsl:template>
  <xsl:template match="gml:value" />

</xsl:stylesheet>
