<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:gml="http://www.gelaba.org/gml/1.1"
		version="1.0">

  <xsl:output method="text" encoding="utf-8" />

  <xsl:template match="/">
    <xsl:value-of select="gml:definitions/gml:property[@name='lheo:longversion']/@value" />
  </xsl:template>

</xsl:stylesheet>
