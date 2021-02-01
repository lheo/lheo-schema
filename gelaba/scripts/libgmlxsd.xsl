<?xml version="1.0" encoding="utf-8"?>
<!-- 
LIBGMLXSD

Library of templates to transforms a language described in GML in a XSD (W3C XML Schema).

Copyright 2008 ARMINES/CRI, DGEFP.

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
  
  <xsl:output method="xml" encoding="utf-8" />
  
  <xsl:template name="xsd_dump_all_definitions">
    <xs:schema>
      <xsl:attribute name="targetNamespace">
    <xsl:call-template name="getDefaultNS" />
      </xsl:attribute>
      
      <xsl:for-each select="gml:namespace">
    <xsl:attribute name="xmlns__GMLCOLON__{@ns_prefix}">
      <xsl:value-of select="@href" />
    </xsl:attribute>
      </xsl:for-each>

      <xsl:attribute name="elementFormDefault">qualified</xsl:attribute>

      <!-- 
       TODO Cas des multiples namespaces...  Je ne sais pas
       comment faire en XSLT pour ajouter des déclarations de
       namespaces de la forme xmlns:prefix, autrement qu'en les
       déclarant dans l'élément de document du fichier XSLT.
       
       Par exemple, ceci:
       
       <xsl:attribute name="xmlns:toto">
        <xsl:text>Une:URI</xsl:text>
       </xsl:attribute>
       
       Ne fonctionne pas. Une solution est d'utiliser une
       bidouille qui consiste à cacher le namespace au processeur
       XSLT en utilisant un nom comme "xmlns__GMLCOLON__toto" qui
       sera ensuite remplacé à coup de 'sed' par le nom
       "xmlns:toto".
      -->

      <xsl:for-each select="gml:definition">
    <xsl:call-template name="xsd_dump_definition">
      <xsl:with-param name="cdef" select="." />
      <xsl:with-param name="namespace">
        <xsl:call-template name="getDefaultNS" />
      </xsl:with-param>
    </xsl:call-template>
      </xsl:for-each>
    </xs:schema>
  </xsl:template>

  <xsl:template name="xsd_dump_definition">
    <xsl:param name="cdef"/>
    <xsl:param name="namespace"/>
    
    <xsl:variable name="prefixNS">
      <xsl:choose>
    <xsl:when test="$cdef/@ns_prefix">
      <xsl:value-of select="$cdef/@ns_prefix" />
      <xsl:text>__GMLCOLON__</xsl:text>
    </xsl:when>
    <xsl:when test="/gml:definitions/@default_ns_prefix">
      <xsl:value-of select="/gml:definitions/@default_ns_prefix" />
      <xsl:text>__GMLCOLON__</xsl:text>
    </xsl:when>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="name" select="$cdef/@name" />
    
    <!-- Attributs -->
    <xsl:if test="$cdef/gml:attribute">
      <xs:attributeGroup name="{$name}-attributes">
    <xsl:apply-templates select="$cdef/gml:attribute" />
      </xs:attributeGroup>
    </xsl:if>

    <!-- Types -->
    <xsl:apply-templates select="$cdef/gml:element_type">
      <xsl:with-param name="prefix" select="$prefixNS" />
    </xsl:apply-templates>

    <!-- Element -->
    <xs:element name="{$name}" type="{$prefixNS}{$name}-type" />

    <!-- TODO: annotations GML -->
  </xsl:template>
  
  <!-- sequence or choice -->
  <xsl:template match="gml:element_type[gml:sequence or gml:choice]">
    <xsl:param name="prefix" />
    <xs:complexType name="{../@name}-subtype">
      <xsl:apply-templates select="gml:sequence|gml:choice">
    <xsl:with-param name="prefix" select="$prefix" />
      </xsl:apply-templates>
    </xs:complexType>
    <xs:complexType name="{../@name}-type">
      <xs:complexContent>
    <xs:extension base="{$prefix}{../@name}-subtype">
      <xs:attributeGroup ref="{$prefix}{../@name}-attributes"/>
    </xs:extension>
      </xs:complexContent>
    </xs:complexType>
  </xsl:template>  

  <xsl:template match="gml:sequence">
    <xsl:param name="prefix" />
    <xs:sequence>
      <xsl:apply-templates select="gml:element">
    <xsl:with-param name="prefix" select="$prefix" />
      </xsl:apply-templates>
    </xs:sequence>
  </xsl:template>

  <xsl:template match="gml:element">
    <xsl:param name="prefix" />
    <xs:element ref="{$prefix}{@name}">
      <xsl:attribute name="minOccurs">
    <xsl:call-template name="minValue" />
      </xsl:attribute>
      <xsl:attribute name="maxOccurs">
    <xsl:variable name="mv">
      <xsl:call-template name="maxValue" />
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$mv='0'">
        <xsl:text>unbounded</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$mv" />
      </xsl:otherwise>
    </xsl:choose>
      </xsl:attribute>
    </xs:element>
  </xsl:template>

  <xsl:template match="gml:choice">
    <xsl:param name="prefix" />
    <xs:choice>
      <xsl:attribute name="minOccurs">
    <xsl:call-template name="minValue" />
      </xsl:attribute>
      <xsl:attribute name="maxOccurs">
    <xsl:variable name="mv">
      <xsl:call-template name="maxValue" />
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$mv='0'">
        <xsl:text>unbounded</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$mv" />
      </xsl:otherwise>
    </xsl:choose>
      </xsl:attribute>
      <xsl:apply-templates select="gml:choice_element">
    <xsl:with-param name="prefix" select="$prefix" />
      </xsl:apply-templates>
    </xs:choice>
  </xsl:template>

  <xsl:template match="gml:choice_element">
    <xsl:param name="prefix" />
    <xs:element ref="{$prefix}{@name}" />
  </xsl:template>

  <!--
      
      Basic types
      
  -->

  <xsl:template match="gml:element_type[gml:empty]">
    <xsl:param name="prefix" />
    <xs:complexType name="{../@name}-type">
      <xs:attributeGroup ref="{$prefix}{../@name}-attributes"/>
    </xs:complexType>
  </xsl:template>

  <xsl:template match="gml:element_type[gml:basic_int]">
    <xsl:param name="prefix" />
    <xs:simpleType name="{../@name}-subtype">
      <xs:restriction base="xs:long">
    <!-- TODO: minInclusive, maxInclusive -->
      </xs:restriction>
    </xs:simpleType>
    <xs:complexType name="{../@name}-type">
      <xs:simpleContent>
    <xs:extension base="{$prefix}{../@name}-subtype">
      <xs:attributeGroup ref="{$prefix}{../@name}-attributes"/>
    </xs:extension>
      </xs:simpleContent>
    </xs:complexType>
  </xsl:template>

  <xsl:template match="gml:element_type[gml:basic_float]">
    <xsl:param name="prefix" />
    <xsl:message terminate="yes">
      <xsl:text>basic_float</xsl:text>
      <xsl:text>NOT YET IMPLEMENTED</xsl:text>
    </xsl:message>
  </xsl:template>

  <xsl:template match="gml:element_type[gml:basic_date]">
    <xsl:param name="prefix" />
    <xs:simpleType name="{../@name}-subtype">
      <xs:restriction base="xs:token">
    <xs:length value="8" />
    <xs:pattern value="[0-9][0-9][0-9][0-9][019][0-9][01239][0-9]" />
      </xs:restriction>
    </xs:simpleType>
    <xs:complexType name="{../@name}-type">
      <xs:simpleContent>
    <xs:extension base="{$prefix}{../@name}-subtype">
      <xs:attributeGroup ref="{$prefix}{../@name}-attributes"/>
    </xs:extension>
      </xs:simpleContent>
    </xs:complexType>
  </xsl:template>

  <xsl:template match="gml:element_type[gml:basic_text]">
    <xsl:param name="prefix" />
    <xsl:apply-templates select="gml:basic_text">
      <xsl:with-param name="prefix" select="$prefix" />
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="gml:basic_text">
    <xsl:param name="prefix" />
    <xsl:variable name="maxv">
      <xsl:call-template name="lgmaxValue" />
    </xsl:variable>
    <xsl:variable name="minv">
      <xsl:call-template name="lgminValue" />
    </xsl:variable>
    <xs:simpleType name="{../../@name}-subtype">
      <xs:restriction base="xs:string">
    <xsl:choose>
      <xsl:when test="$minv&gt;0">
        <xs:minLength value="{$minv}" />
      </xsl:when>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="$maxv='n'" />
      <xsl:when test="$maxv&gt;0">
        <xs:maxLength value="{$maxv}" />
      </xsl:when>
    </xsl:choose>
    <xsl:if test="@regexp">
      <xs:pattern value="{@regexp}" />
    </xsl:if>
      </xs:restriction>
    </xs:simpleType>
    <xs:complexType name="{../../@name}-type">
      <xs:simpleContent>
    <xs:extension base="{$prefix}{../../@name}-subtype">
      <xs:attributeGroup ref="{$prefix}{../../@name}-attributes"/>
    </xs:extension>
      </xs:simpleContent>
    </xs:complexType>
  </xsl:template>

  <xsl:template match="gml:element_type[gml:basic_name]">
    <xsl:param name="prefix" />
    <xsl:message terminate="yes">
      <xsl:text>basic_name</xsl:text>
      <xsl:text>NOT YET IMPLEMENTED</xsl:text>
    </xsl:message>
  </xsl:template>

  <xsl:template match="gml:element_type[gml:basic_key]">
    <xsl:param name="prefix" />
    <xsl:variable name="dictionary" select="gml:basic_key/@ref" />
    <xs:simpleType name="{../@name}-subtype">
      <xs:restriction base="xs:token">
    <xsl:for-each select="/gml:definitions/gml:dict[@name=$dictionary]/gml:entry/gml:key">
      <xs:enumeration value="{@val}" />
    </xsl:for-each> 
      </xs:restriction>
    </xs:simpleType>
    <xs:complexType name="{../@name}-type">
      <xs:simpleContent>
    <xs:extension base="{$prefix}{../@name}-subtype">
      <xs:attributeGroup ref="{$prefix}{../@name}-attributes"/>
    </xs:extension>
      </xs:simpleContent>
    </xs:complexType>
  </xsl:template>

  <xsl:template match="gml:element_type[gml:basic_data]">
    <xsl:param name="prefix" />
    <xs:simpleType name="{../@name}-subtype">
      <xs:restriction base="xs:string">
      </xs:restriction>
    </xs:simpleType>
    <xs:complexType name="{../@name}-type">
      <xs:simpleContent>
    <xs:extension base="{$prefix}{../@name}-subtype">
      <xs:attributeGroup ref="{$prefix}{../@name}-attributes"/>
    </xs:extension>
      </xs:simpleContent>
    </xs:complexType>
    <!-- TODO: est-ce que ca a un sens la difference entre string et data ? -->
  </xsl:template>

  <xsl:template match="gml:element_type[gml:basic_any]">
    <xsl:param name="prefix" />
    <xs:complexType name="{../@name}-type">
        <xs:complexContent>
            <xs:extension base="xs:anyType">
                <xs:attributeGroup ref="{$prefix}{../@name}-attributes"/>
            </xs:extension>
        </xs:complexContent>
    </xs:complexType>
  </xsl:template>

  <!--
      
      Attributes
      
  -->
  
  <xsl:template match="gml:attribute[gml:attribute_type/gml:attribute_int]">
    <xs:attribute name="{@name}" type="xs:integer">
      <!-- TODO: optionnel, etc... -->
    </xs:attribute>
    <!--<xsl:message terminate="yes">
      <xsl:text>attribute_int</xsl:text>
      <xsl:text>NOT YET IMPLEMENTED</xsl:text>
    </xsl:message>-->
  </xsl:template>

  <xsl:template match="gml:attribute[gml:attribute_type/gml:attribute_float]">
    <xs:attribute name="{@name}" type="xs:float">
      <!-- TODO: optionnel, etc... -->
    </xs:attribute>
    <!--<xsl:message terminate="yes">
      <xsl:text>attribute_float</xsl:text>
      <xsl:text>NOT YET IMPLEMENTED</xsl:text>
    </xsl:message>-->
  </xsl:template>

  <xsl:template match="gml:attribute[gml:attribute_type/gml:attribute_date]">
    <xs:attribute name="{@name}" type="xs:string">
      <!-- TODO: regular expression to specify the date -->
    </xs:attribute>    
    <!--<xsl:message terminate="yes">
      <xsl:text>attribute_date</xsl:text>
      <xsl:text>NOT YET IMPLEMENTED</xsl:text>
    </xsl:message>-->
  </xsl:template>

  <xsl:template match="gml:attribute[gml:attribute_type/gml:attribute_text]">
    <xs:attribute name="{@name}" type="xs:string">
      <!-- TODO: optional, etc... -->
    </xs:attribute>
      <!--<xsl:message terminate="yes">
      <xsl:text>attribute_text</xsl:text>
      <xsl:text>NOT YET IMPLEMENTED</xsl:text>
      </xsl:message>-->
  </xsl:template>

  <xsl:template match="gml:attribute[gml:attribute_type/gml:attribute_name]">
    <xs:attribute name="{@name}" type="xs:Name">
      <!-- TODO: optional, etc... -->
    </xs:attribute>
    <!--
    <xsl:message terminate="yes">
      <xsl:text>attribute_name</xsl:text>
      <xsl:text>NOT YET IMPLEMENTED</xsl:text>
    </xsl:message>-->
  </xsl:template>

  <xsl:template match="gml:attribute[gml:attribute_type/gml:attribute_key]">
    <xs:attribute name="{@name}" type="xs:string">
      <!-- TODO: optional, etc... -->
    </xs:attribute>
    <!--
    <xsl:message terminate="yes">
      <xsl:text>attribute_key</xsl:text>
      <xsl:text>NOT YET IMPLEMENTED</xsl:text>
    </xsl:message>-->
  </xsl:template>

  <xsl:template match="gml:attribute[gml:attribute_type/gml:attribute_embedded_key]">
    <xs:attribute name="{@name}" type="xs:string">
      <!-- TODO: optional, etc... -->
    </xs:attribute>
    <!--
    <xsl:message terminate="yes">
      <xsl:text>attribute_embedded_key</xsl:text>
      <xsl:text>NOT YET IMPLEMENTED</xsl:text>
    </xsl:message>-->
  </xsl:template>

  <xsl:template match="gml:attribute[gml:attribute_type/gml:attribute_id]">
    <xs:attribute name="{@name}" type="xs:ID">
      <!-- TODO: optional, etc... -->
      <!-- TODO: ca a un sens Name ? -->
    </xs:attribute>
    <!--
    <xsl:message terminate="yes">
      <xsl:text>attribute_id</xsl:text>
      <xsl:text>NOT YET IMPLEMENTED</xsl:text>
    </xsl:message>-->
  </xsl:template>

  <xsl:template match="gml:attribute[gml:attribute_type/gml:attribute_idref]">
    <xs:attribute name="{@name}" type="xs:IDREF">
      <!-- TODO: optional, etc... -->
      <!-- TODO: ca a un sens Name ? -->
    </xs:attribute>
    <!--<xsl:message terminate="yes">
      <xsl:text>attribute_idref</xsl:text>
      <xsl:text>NOT YET IMPLEMENTED</xsl:text>
    </xsl:message>-->
  </xsl:template>

  <xsl:template match="gml:attribute[gml:attribute_type/gml:attribute_data]">
    <xs:attribute name="{@name}" type="xs:string">
      <!-- TODO: optional, etc... -->
    </xs:attribute>
    <!--<xsl:message terminate="yes">
      <xsl:text>attribute_data</xsl:text>
      <xsl:text>NOT YET IMPLEMENTED</xsl:text>
    </xsl:message>-->
  </xsl:template>
</xsl:stylesheet>
