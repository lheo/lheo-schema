<?xml version="1.0" encoding="UTF-8" ?>
<!--
	gml2clib
	Created by Georges-André Silber on 2007-03-12.
	Copyright (c) 2007 GAS. All rights reserved.
-->

<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:gml="http://www.gelaba.org/gml/1.1">

	<xsl:output encoding="UTF-8" method="text" />

	<xsl:variable name="language" select="/gml:definitions/@language" />

	<xsl:template match="/">
		<xsl:apply-templates select="gml:definitions" />
		<xsl:apply-templates select="gml:definitions" mode="strings" />
		<xsl:apply-templates select="gml:definitions" mode="language" />
	</xsl:template>
	
	<xsl:template match="gml:definitions">
		<xsl:text>typedef enum {&#10;</xsl:text>
		<xsl:text>  DEFNONE = 0,&#10;</xsl:text>
		<xsl:text>  DEFFIRST = 1,&#10;</xsl:text>
		<xsl:apply-templates select="gml:definition" mode="ident" />
		<xsl:text>  DEFLAST = </xsl:text>
		<xsl:value-of select="count(gml:definition)" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>} </xsl:text>
		<xsl:value-of select="translate($language,'-','_')" />
		<xsl:text>Identifiers;&#10;</xsl:text>
		
		<xsl:apply-templates select="gml:definition" mode="struct" />				
	</xsl:template>

	<xsl:template match="gml:definitions" mode="strings">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>char * </xsl:text>
		<xsl:value-of select="translate($language,'-','_')" />
		<xsl:text>Elements[] = {&#10;</xsl:text>
		<xsl:text>  NULL,&#10;</xsl:text>
		<xsl:apply-templates select="gml:definition" mode="strings" />
		<xsl:text>  NULL</xsl:text>
		<xsl:text>&#10;} </xsl:text>
	</xsl:template>

	<xsl:template match="gml:definitions" mode="language">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>typedef union </xsl:text>
		<xsl:value-of select="translate($language,'-','_')" />
		<xsl:text>_language {&#10;</xsl:text>
		<xsl:text>Elements[] = {&#10;</xsl:text>
		<xsl:text>  NULL,&#10;</xsl:text>
		<xsl:apply-templates select="gml:definition" mode="strings" />
		<xsl:text>  NULL</xsl:text>
		<xsl:text>&#10;} </xsl:text>
	</xsl:template>
	
	<xsl:template match="gml:definition" mode="ident">
		<xsl:text>  DEF_</xsl:text>
		<xsl:value-of select="translate($language,'-','_')" />
		<xsl:text>_</xsl:text>
		<xsl:value-of select="translate(@name,'-','_')" />
		<xsl:text> = </xsl:text>
		<xsl:value-of select="position()" />
		<xsl:text>,&#10;</xsl:text>
	</xsl:template>
	
	<xsl:template match="gml:definition" mode="struct">
		<xsl:text>&#10;</xsl:text>
		<xsl:text>struct element_</xsl:text>
		<xsl:value-of select="translate($language,'-','_')" />
		<xsl:text>_</xsl:text>
		<xsl:value-of select="translate(@name,'-','_')" />
		<xsl:text> {&#10;</xsl:text>
		<xsl:text>&#10;} element_</xsl:text>
		<xsl:value-of select="translate($language,'-','_')" />
		<xsl:text>_</xsl:text>
		<xsl:value-of select="translate(@name,'-','_')" />		
		<xsl:text>;&#10;</xsl:text>
	</xsl:template>
	
	<xsl:template match="gml:definition" mode="strings">
		<xsl:text>  "</xsl:text>
		<xsl:value-of select="@name" />
		<xsl:text>",&#10;</xsl:text>
	</xsl:template>

</xsl:stylesheet>
