<?xml version="1.0" encoding="utf-8"?>
<!-- 
LIBGMLDTD

Library of templates to transforms a language described in GML in a DTD.

Copyright 2006 ARMINES/CRI, DGEFP.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:gml="http://www.gelaba.org/gml/1.1"
		version="1.0">

  <xsl:output method="text" encoding="utf-8" />

  <xsl:template name="dtd_preamble">
    <xsl:param name="prefix"/>
    <xsl:param name="namespace"/>
    <xsl:param name="prefixed"/>

    <xsl:call-template name="dtd-local-entity">
      <xsl:with-param name="name">NS.prefixed</xsl:with-param>
    </xsl:call-template>
    <xsl:choose>
      <xsl:when test="$prefixed='true'">
	<xsl:text> "INCLUDE"</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:text> "IGNORE"</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:call-template name="close" />

    <xsl:call-template name="dtd-local-entity">
      <xsl:with-param name="name">
	<xsl:value-of select="$prefix"/>
	<xsl:text>.prefixed</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:text> </xsl:text>
    <xsl:text>"</xsl:text>
    <xsl:text>%NS.prefixed;</xsl:text>
    <xsl:text>"</xsl:text>
    <xsl:call-template name="close" />

    <xsl:call-template name="dtd-local-entity">
      <xsl:with-param name="name">
	<xsl:value-of select="$prefix"/>
	<xsl:text>.prefix</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:text> </xsl:text>
    <xsl:text>"</xsl:text>
    <xsl:value-of select="$prefix"/>
    <xsl:text>"</xsl:text>
    <xsl:call-template name="close" />

    <xsl:call-template name="dtd-local-entity">
      <xsl:with-param name="name">
	<xsl:value-of select="$prefix"/>
	<xsl:text>.xmlns</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:text> </xsl:text>
    <xsl:text>"</xsl:text>
    <xsl:value-of select="$namespace"/>
    <xsl:text>"</xsl:text>
    <xsl:call-template name="close" />

    <xsl:text>&lt;![%</xsl:text>
    <xsl:value-of select="$prefix"/>
    <xsl:text>.prefixed;[</xsl:text>
    <xsl:call-template name="nl" />
    <!-- .pfx -->
    <xsl:call-template name="dtd-local-entity">
      <xsl:with-param name="name">
	<xsl:value-of select="$prefix"/>
	<xsl:text>.pfx</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:text> </xsl:text>
    <xsl:text>"%</xsl:text>
    <xsl:value-of select="$prefix"/>
    <xsl:text>.prefix;:"</xsl:text>
    <xsl:call-template name="close" />
    <!-- .xmlns.attrib -->
    <xsl:call-template name="dtd-local-entity">
      <xsl:with-param name="name">
	<xsl:value-of select="$prefix"/>
	<xsl:text>.xmlns.attrib</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:text> </xsl:text>
    <xsl:text>"xmlns:%</xsl:text>
    <xsl:value-of select="$prefix"/>
    <xsl:text>.prefix; CDATA #FIXED '%</xsl:text>
    <xsl:value-of select="$prefix"/>    
    <xsl:text>.xmlns;'"</xsl:text>
    <xsl:call-template name="close" />
    <xsl:text>]]&gt;</xsl:text>
    <xsl:call-template name="nl" />

    <!-- .pfx -->
    <xsl:call-template name="dtd-local-entity">
      <xsl:with-param name="name">
	<xsl:value-of select="$prefix"/>
	<xsl:text>.pfx</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:text> </xsl:text>
    <xsl:text>""&gt;</xsl:text>
    <xsl:call-template name="nl"/>
    <!-- .xmlns.attrib -->
    <xsl:call-template name="dtd-local-entity">
      <xsl:with-param name="name">
	<xsl:value-of select="$prefix"/>
	<xsl:text>.xmlns.attrib</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:text> </xsl:text>
    <xsl:text>"xmlns CDATA #FIXED '%</xsl:text>
    <xsl:value-of select="$prefix"/>    
    <xsl:text>.xmlns;'"&gt;</xsl:text>
    <xsl:call-template name="nl" />
  </xsl:template>

  <xsl:template name="dtd_dump_qname">
    <xsl:param name="cdef"/>
    <xsl:param name="prefix"/>

    <xsl:call-template name="dtd-local-entity">
      <xsl:with-param name="name">
	<xsl:value-of select="$cdef/@name"/>
	<xsl:text>.qname</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:text> </xsl:text>
    <xsl:text>"%</xsl:text>
    <xsl:value-of select="$prefix"/>    
    <xsl:text>.pfx;</xsl:text>
    <xsl:value-of select="$cdef/@name"/>
    <xsl:text>"&gt;</xsl:text>
    <xsl:call-template name="nl" />
  </xsl:template>

  <xsl:template name="dtd_dump_fields">
    <xsl:param name="cdef"/>
    <xsl:param name="prefix"/>

    <xsl:call-template name="dtd-local-entity">
      <xsl:with-param name="name">
	<xsl:value-of select="$cdef/@name"/>
	<xsl:text>.fields</xsl:text>
      </xsl:with-param>
    </xsl:call-template>

    <xsl:text> </xsl:text>
    <xsl:text>"</xsl:text>
    <xsl:apply-templates select="$cdef/gml:element_type"
			 mode="fields"/>
    <xsl:text>"&gt;</xsl:text>
    <xsl:call-template name="nl" />
  </xsl:template>

  <xsl:template name="dtd_dump_element">
    <xsl:param name="cdef"/>

    <xsl:call-template name="dtd-element">
      <xsl:with-param name="name" select="$cdef/@name"/>
    </xsl:call-template>
    <xsl:apply-templates select="$cdef/gml:element_type"
			 mode="libgmldtd"/>
    <xsl:call-template name="close" />
  </xsl:template>

  <xsl:template name="dtd_dump_attributes">
    <xsl:param name="cdef"/>
    <xsl:if test="$cdef/gml:attribute">
      <xsl:call-template name="dtd-attributes">
	<xsl:with-param name="name" select="$cdef/@name"/>
      </xsl:call-template>
      <xsl:apply-templates select="$cdef/gml:attribute"
			   mode="libgmldtd"/>
      <xsl:call-template name="close" />
    </xsl:if>
  </xsl:template>

  <xsl:template name="dtd_dump_definition">
    <xsl:param name="cdef"/>
    <xsl:param name="prefix"/>

    <xsl:call-template name="dtd-element">
      <xsl:with-param name="name" select="$cdef/@name"/>
    </xsl:call-template>
    <xsl:apply-templates select="$cdef/gml:element_type"
			 mode="libgmldtd"/>
    <xsl:call-template name="close" />

    <xsl:call-template name="dtd-attributes">
      <xsl:with-param name="name" select="$cdef/@name"/>
    </xsl:call-template>

    <xsl:call-template name="nl"/>
    <xsl:text>  %</xsl:text>
    <xsl:value-of select="$prefix"/>
    <xsl:text>.xmlns.attrib;</xsl:text>     

    <xsl:apply-templates select="$cdef/gml:attribute"
			 mode="libgmldtd"/>
    <xsl:call-template name="close" />

  </xsl:template>

  <xsl:template name="dtd_dump_definition_raw">
    <xsl:param name="cdef"/>
    <xsl:param name="namespace"/>

    <xsl:call-template name="dtd-element-raw">
      <xsl:with-param name="name" select="$cdef/@name"/>
    </xsl:call-template>
    <xsl:apply-templates select="$cdef/gml:element_type"
			 mode="libgmldtd_raw"/>
    <xsl:call-template name="close" />

    <xsl:if test="string-length($namespace)&gt;0 or $cdef/gml:attribute">
      <xsl:call-template name="dtd-attributes-raw">
	<xsl:with-param name="name" select="$cdef/@name"/>
      </xsl:call-template>
      <xsl:if test="string-length($namespace)&gt;0">
	<xsl:call-template name="nl"/>
	<xsl:text>  xmlns CDATA #FIXED "</xsl:text>
	<xsl:value-of select="$namespace" />
	<xsl:text>"</xsl:text>
      </xsl:if>
      
      <xsl:apply-templates select="$cdef/gml:attribute"
			   mode="libgmldtd"/>
      
      <xsl:call-template name="close" />
    </xsl:if>
  </xsl:template>

  <xsl:template match="gml:element_type"
		mode="libgmldtd">
    <xsl:apply-templates select="*" mode="libgmldtd_type"/>
  </xsl:template>

  <xsl:template match="gml:element_type"
		mode="libgmldtd_raw">
    <xsl:apply-templates select="*" mode="libgmldtd_type_raw"/>
  </xsl:template>

  <xsl:template match="gml:element_type"
		mode="fields">
    <xsl:apply-templates select="*" mode="fields"/>
  </xsl:template>

  <xsl:template match="gml:sequence" mode="libgmldtd_type">
    <xsl:text>(%</xsl:text>
    <xsl:value-of select="../../@name"/>
    <xsl:text>.fields;)</xsl:text>
  </xsl:template>

  <xsl:template match="gml:sequence" mode="fields">
    <xsl:for-each select="gml:element">
      <xsl:text>%</xsl:text>
      <xsl:value-of select="@name" />
      <xsl:text>.qname;</xsl:text>
      <xsl:choose>
	<xsl:when test="@min=0 and (@max=0 or @max&gt;1)">
	  <xsl:text>*</xsl:text>
	</xsl:when>
	<xsl:when test="@min&gt;0 and (@max=0 or @max&gt;1)">
	  <xsl:text>+</xsl:text>
	</xsl:when>
	<xsl:when test="@min=0 and (@max=1 or not(@max))">
	  <xsl:text>?</xsl:text>
	</xsl:when>
      </xsl:choose>
      <xsl:if test="position()!=last()">
	<xsl:text>,</xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="gml:sequence" mode="libgmldtd_type_raw">
    <xsl:text>(</xsl:text>
    <xsl:for-each select="gml:element">
      <xsl:value-of select="@name" />
      <xsl:choose>
	<xsl:when test="@min=0 and (@max=0 or @max&gt;1)">
	  <xsl:text>*</xsl:text>
	</xsl:when>
	<xsl:when test="@min&gt;0 and (@max=0 or @max&gt;1)">
	  <xsl:text>+</xsl:text>
	</xsl:when>
	<xsl:when test="@min=0 and (@max=1 or not(@max))">
	  <xsl:text>?</xsl:text>
	</xsl:when>
      </xsl:choose>
      <xsl:if test="position()!=last()">
	<xsl:text>,</xsl:text>
      </xsl:if>
    </xsl:for-each>
    <xsl:text>)</xsl:text>
  </xsl:template>

  <xsl:template match="gml:choice" mode="libgmldtd_type">
    <xsl:text>(%</xsl:text>
    <xsl:value-of select="../../@name"/>
    <xsl:text>.fields;)</xsl:text>
    <xsl:choose>
      <xsl:when test="@min=0 and (@max=0 or @max&gt;1)">
	<xsl:text>*</xsl:text>
      </xsl:when>
      <xsl:when test="@min&gt;0 and (@max=0 or @max&gt;1)">
	<xsl:text>+</xsl:text>
      </xsl:when>
      <xsl:when test="@min=0 and (@max=1 or not(@max))">
	<xsl:text>?</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="gml:choice" mode="fields">
    <xsl:for-each select="gml:choice_element">
      <xsl:text>%</xsl:text>
      <xsl:value-of select="@name" />
      <xsl:text>.qname;</xsl:text>
      <xsl:if test="position()!=last()">
	<xsl:text>|</xsl:text>
      </xsl:if>
    </xsl:for-each>    
  </xsl:template>

  <xsl:template match="gml:choice" mode="libgmldtd_type_raw">
    <xsl:text>(</xsl:text>
    <xsl:for-each select="gml:choice_element">
      <xsl:value-of select="@name" />
      <xsl:if test="position()!=last()">
	<xsl:text>|</xsl:text>
      </xsl:if>
    </xsl:for-each>    
    <xsl:text>)</xsl:text>
    <xsl:choose>
      <xsl:when test="@min=0 and (@max=0 or @max&gt;1)">
	<xsl:text>*</xsl:text>
      </xsl:when>
      <xsl:when test="@min&gt;0 and (@max=0 or @max&gt;1)">
	<xsl:text>+</xsl:text>
      </xsl:when>
      <xsl:when test="@min=0 and (@max=1 or not(@max))">
	<xsl:text>?</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="gml:basic_any" mode="libgmldtd_type">
    <xsl:text>ANY</xsl:text>
  </xsl:template>
  <xsl:template match="node()" mode="libgmldtd_type">
    <xsl:text>(#PCDATA)</xsl:text>
  </xsl:template>
  <xsl:template match="gml:basic_any" mode="libgmldtd_type_raw">
    <xsl:text>ANY</xsl:text>
  </xsl:template>
  <xsl:template match="node()" mode="libgmldtd_type_raw">
    <xsl:text>(#PCDATA)</xsl:text>
  </xsl:template>

  <xsl:template match="gml:empty" mode="libgmldtd_type">
    <xsl:text>EMPTY</xsl:text>
  </xsl:template>
  <xsl:template match="gml:empty" mode="libgmldtd_type_raw">
    <xsl:text>EMPTY</xsl:text>
  </xsl:template>

  <xsl:template match="node()|gml:empty" mode="fields"/>

  <xsl:template name="nl">
    <xsl:text>&#10;</xsl:text>
  </xsl:template>

  <xsl:template name="close">
    <xsl:text>&gt;</xsl:text>
    <xsl:call-template name="nl"/>
  </xsl:template>

  <xsl:template name="dtd-element">
    <xsl:param name="name" />
    <xsl:call-template name="nl" />
    <xsl:text>&lt;!ELEMENT %</xsl:text>
    <xsl:value-of select="$name"/>
    <xsl:text>.qname; </xsl:text>
  </xsl:template>

  <xsl:template name="dtd-element-raw">
    <xsl:param name="name" />
    <xsl:call-template name="nl" />
    <xsl:text>&lt;!ELEMENT </xsl:text>
    <xsl:value-of select="$name"/>
    <xsl:text> </xsl:text>
  </xsl:template>

  <xsl:template name="dtd-attributes">
    <xsl:param name="name" />
    <xsl:call-template name="nl" />
    <xsl:text>&lt;!ATTLIST %</xsl:text>
    <xsl:value-of select="$name"/>
    <xsl:text>.qname; </xsl:text>
  </xsl:template>

  <xsl:template name="dtd-attributes-raw">
    <xsl:param name="name" />
    <xsl:call-template name="nl" />
    <xsl:text>&lt;!ATTLIST </xsl:text>
    <xsl:value-of select="$name"/>
    <xsl:text> </xsl:text>
  </xsl:template>

  <xsl:template name="dtd-local-entity">
    <xsl:param name="name" />
    <xsl:call-template name="nl" />
    <xsl:text>&lt;!ENTITY % </xsl:text>
    <xsl:value-of select="$name"/>
    <xsl:text> </xsl:text>
  </xsl:template>
    
  <xsl:template match="gml:attribute"
		mode="libgmldtd">
    <xsl:call-template name="nl"/>
    <xsl:text>  </xsl:text>
    <xsl:value-of select="@name" />
    <xsl:text> </xsl:text>
    <xsl:apply-templates select="gml:attribute_type"
			 mode="libgmldtd"/>
    <xsl:choose>
      <xsl:when test="@type = 'default'">
	<xsl:text>"</xsl:text>
	<xsl:value-of select="@value"/>
	<xsl:text>"</xsl:text>
      </xsl:when>
      <xsl:when test="@type = 'fixed'">
	<xsl:text>#FIXED "</xsl:text>
	<xsl:value-of select="@value"/>
	<xsl:text>"</xsl:text>
      </xsl:when>
      <xsl:when test="@type = 'optional'">
	<xsl:text>#IMPLIED</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:text>#REQUIRED</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="gml:attribute_type"
		mode="libgmldtd">
    <xsl:apply-templates select="*" mode="libgmldtd_attribute"/>
  </xsl:template>
  
  <xsl:template match="gml:attribute_embedded_key" mode="libgmldtd_attribute">
    <xsl:variable name="refd" select="@ref" />
    <xsl:text> (</xsl:text>
    <xsl:apply-templates select="//gml:dict[@name=$refd]" mode="libgmldtd_attribute"/>
    <xsl:text>) </xsl:text>
  </xsl:template>

  <xsl:template match="gml:dict" mode="libgmldtd_attribute">
    <xsl:for-each select="gml:entry">
      <xsl:for-each select="gml:key">
	<xsl:value-of select="@val"/>
	<xsl:if test="position()!=last()">
	  <xsl:text>|</xsl:text>
	</xsl:if>
      </xsl:for-each>
      <xsl:if test="position()!=last()">
	<xsl:text>|</xsl:text>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="gml:attribute_id" mode="libgmldtd_attribute">
    <xsl:text> ID </xsl:text>
  </xsl:template>

  <xsl:template match="gml:attribute_idref" mode="libgmldtd_attribute">
    <xsl:text> IDREF </xsl:text>
  </xsl:template>

  <xsl:template match="gml:attribute_name" mode="libgmldtd_attribute">
    <xsl:text> NMTOKEN </xsl:text>
  </xsl:template>

  <xsl:template match="node()" mode="libgmldtd_attribute">
    <xsl:text> CDATA </xsl:text>
  </xsl:template>

</xsl:stylesheet>
