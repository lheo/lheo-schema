<?xml version="1.0" encoding="utf-8"?>
<!-- 
GML2XSD

Transforms a language described in GML in a XSD.

Copyright 2008 Georges-André Silber.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:gml="http://www.gelaba.org/gml/1.1"
		xmlns:xs="http://www.w3.org/2001/XMLSchema"
		version="1.0">
  
  <xsl:output method="xml" encoding="utf-8" indent="yes" />

  <xsl:param name="mode" select="'raw'"/>
  <xsl:param name="withns" select="'no'"/>
  <xsl:param name="element" select="''"/>
  
  <xsl:include href="libgmlcheck.xsl"/>
  <xsl:include href="libgmlxsd.xsl"/>
  <xsl:include href="libgmlutils.xsl"/>

  <xsl:template match="/">
    <xsl:choose>
      <xsl:when test="$mode='raw'">
	<xsl:apply-templates select="gml:definitions" mode="raw"/>
      </xsl:when>
      <xsl:when test="$mode='one'">
	<xsl:apply-templates select="gml:definitions" mode="one"/>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="gml:definitions" mode="raw">    
    <xsl:call-template name="GMLCheck" />
    <xsl:call-template name="xsd_dump_all_definitions" />
  </xsl:template>

  <xsl:template match="gml:definitions" mode="one">
    <xsl:variable name="ns">
      <xsl:if test="$withns = 'yes'">
	<xsl:call-template name="getDefaultNS" />
      </xsl:if>
    </xsl:variable>    
    <xsl:call-template name="xsd_dump_definition">
      <xsl:with-param name="cdef" select="gml:definition[@name=$element]" />
      <xsl:with-param name="namespace" select="$ns"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="text()|@*"/>

  <xsl:template match="gml:dict"/>

</xsl:stylesheet>
