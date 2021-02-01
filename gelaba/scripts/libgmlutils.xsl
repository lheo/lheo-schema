<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:gml="http://www.gelaba.org/gml/1.1"
		version="1.0">

  <!--<xsl:output method="text" encoding="utf-8" />-->
  
  <xsl:template name="lgminValue">
    <xsl:choose>
      <xsl:when test="@lgmin">
	<xsl:value-of select="@lgmin" />
      </xsl:when>
      <xsl:otherwise>
	<xsl:text>0</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="minValue">
    <xsl:choose>
      <xsl:when test="@min">
	<xsl:value-of select="@min" />
      </xsl:when>
      <xsl:otherwise>
	<xsl:text>1</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="lgmaxValue">
    <xsl:choose>
      <xsl:when test="@lgmax">
	<xsl:choose>
	  <xsl:when test="@lgmax=0">
	    <xsl:text>n</xsl:text>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:value-of select="@lgmax" />
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:when>
      <xsl:otherwise>
	<xsl:text>0</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="maxValue">
    <xsl:choose>
      <xsl:when test="@max">
	<xsl:value-of select="@max" />
      </xsl:when>
      <xsl:otherwise>
	<xsl:text>1</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="getDefaultNS">
    <xsl:variable name="pfx" select="/gml:definitions/@default_ns_prefix" />
    <xsl:value-of select="//gml:namespace[@ns_prefix=$pfx]/@href" />
  </xsl:template>

</xsl:stylesheet>