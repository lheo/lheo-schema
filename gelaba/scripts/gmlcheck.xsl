<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:gml="http://www.gelaba.org/gml/1.1"
		version="1.0">

  <!-- TODO: comment vérifier que la DTD est bien là? -->
  <!--       le plus simple est de faire un xmllint   -->
  <!--       Donc, créer un gmlcheck.sh ? -->
  
  <xsl:import href="libgmlcheck.xsl" />
  <xsl:output method="text" encoding="utf-8" />

  <xsl:template match="/">
    <xsl:apply-templates select="." mode="GMLCheck" />
  </xsl:template>

  <xsl:template match="text()|@*"/>

</xsl:stylesheet>
