<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:gml="http://www.gelaba.org/gml/1.1"
		xmlns:html="http://www.w3.org/1999/xhtml">

  <xsl:param name="gmldef" select="''" />

  <xsl:output method="xml" encoding="utf-8" indent="yes" />
  
  <xsl:template match="/">
    <xsl:variable name="gmldoc" select="document($gmldef)" />
    <xsl:variable name="defns" select="$gmldoc/gml:definitions/@default_ns_prefix" />
    <xsl:variable name="ns" select="$gmldoc/gml:definitions/gml:namespace[@ns_prefix=$defns]/@href" />
    <xsl:variable name="version" select="$gmldoc/gml:definitions/@version" />
    <div>
      <p>
	Le glossaire complet sous la forme d'un fichier XHTML se trouve à l'URL
	<a href="http://lheo.org/{$version}/lheo-glossaire.html">http://lheo.org/<xsl:value-of select="$version"/>/lheo-glossaire.html</a>
      </p>
      <xsl:copy-of select="//html:div[@class='glossaire']" />
    </div>
  </xsl:template>
</xsl:stylesheet>