<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns="http://www.w3.org/1999/xhtml"
		version="1.0">
  <xsl:output method="xml" indent="yes"/>
 
 <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="*" priority="1">
    <xsl:choose>
      <xsl:when test="name(.)='a' and @id = @name">
	<a>
	  <xsl:for-each select="@*">
	    <xsl:if test="name(.) != 'id'">
	      <xsl:attribute name="{name(.)}">
		<xsl:value-of select="."/>
	      </xsl:attribute>
	    </xsl:if>
	  </xsl:for-each>
	  <xsl:apply-templates/>
	</a>
      </xsl:when>
      <xsl:otherwise>
	<xsl:element name="{name(.)}">
	  <xsl:for-each select="@*">
	    <xsl:attribute name="{name(.)}">
	      <xsl:value-of select="."/>
	    </xsl:attribute>
	  </xsl:for-each>
	  <xsl:apply-templates/>
	</xsl:element>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


</xsl:stylesheet>