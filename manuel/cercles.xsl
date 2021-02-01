<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		xmlns:gml="http://www.gelaba.org/gml/1.1"
		xmlns:html="http://www.w3.org/1999/xhtml"
		xmlns:lheo="http://www.lheo.org/1.3.0"
		version="1.0">

  <xsl:output method="text" encoding="utf-8" />

  <xsl:template match="/">
    
    Les éléments du langage LHÉO sont organisés en deux cercles: un
    premier cercle d'élément obligatoire et un second cercle
    d'éléments optionnels.

    Les éléments du premier cercle sont les suivants:
    
    \begin{description}
    <xsl:apply-templates select="//gml:definition[gml:property[@name='lheo:cercle']/@value='1']" /> 
    \end{description}


    Les éléments du second cercle sont les suivants:

    \begin{description}
    <xsl:apply-templates select="//gml:definition[gml:property[@name='lheo:cercle']/@value='2']" />
    \end{description}
  </xsl:template>

  <xsl:template match="gml:definition">
    <xsl:text>\item[</xsl:text><xsl:value-of select="gml:fullname[@xml:lang='fr']"/>
    <xsl:choose>
      <xsl:when test="gml:property[@name='lheo:cercle']/@value='2'">
	<xsl:text> (optionnel)</xsl:text>
      </xsl:when>
    </xsl:choose>    
    <xsl:text>]</xsl:text>
    <xsl:value-of select="gml:doc[@xml:lang='fr']" />
    <xsl:if test="gml:element_type/gml:basic_key">
      <xsl:variable name="did" select="gml:element_type/gml:basic_key/@ref" />
      <xsl:text> Voir la table "</xsl:text>
      <xsl:value-of select="//gml:dict[@name=$did]/gml:fullname[@xml:lang='fr']" />
      <xsl:text>" de LHÉO \cite{WEB-LHEO}.</xsl:text>
    </xsl:if>
  </xsl:template>
 
</xsl:stylesheet>
