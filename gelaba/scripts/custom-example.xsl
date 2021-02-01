<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:gml="http://www.gelaba.org/gml/1.1"
		version="1.0">

  <xsl:template name="print_name_begin">
    <xsl:param name="name"/>    
    <xsl:value-of select="$name"/>
  </xsl:template>

  <xsl:template name="print_name_end">
    <xsl:param name="name"/>    
    <xsl:value-of select="$name"/>
  </xsl:template>

  <xsl:template name="nl">
    <xsl:text>&#10;</xsl:text>
  </xsl:template>

</xsl:stylesheet>
