<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:gml="http://www.gelaba.org/gml/1.1"
		xmlns="http://www.w3.org/1999/xhtml">

  <xsl:output method="xml" encoding="utf-8" indent="yes"
	      doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	      doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" />
  
  <xsl:param name="url-micro" select="'http://www.gelaba.org/gml/1.1/microformat'" />
  <xsl:param name="css" select="''" />

  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head profile="{$url-micro}">
	<title><xsl:value-of select="gml:definitions/@language" /></title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<xsl:if test="string-length($css) &gt; 0">
	  <style type="text/css" media="screen">
	    <xsl:text>@import url("</xsl:text>
	    <xsl:value-of select="$css" />
	    <xsl:text>");</xsl:text>
	  </style>
	</xsl:if>
      </head>
      <body>
	<xsl:apply-templates select="gml:definitions" />
      </body>
    </html>
  </xsl:template>

  <!--
      
      definitions
  
  -->

  <xsl:template match="gml:definitions">
    <div lang="{@xml:lang}" xml:lang="{@xml:lang}" class="gmlDefinitions">
      <h1><span class="language"><xsl:value-of select="@language" /></span></h1>      
      <dl class="globalProperties">
	<dt>Version</dt>
	<dd><span class="version"><xsl:value-of select="@version" /></span></dd>
	<dt>Espace de noms</dt>
	<dd><code>xmlns="<span class="namespace"><xsl:value-of select="@namespace" /></span>"</code></dd>
	<dt>Racine par défaut</dt>
	<dd><code>&lt;<span class="default_root"><xsl:value-of select="@default_root" /></span>&gt;</code></dd>
      </dl>
      <div class="gmlGroup">
	<h2>Éléments obligatoires (cercle 1)</h2>
	<xsl:apply-templates select="gml:definition[gml:property[@name='lheo:cercle'][@value='1']]" />
      </div>
      <div class="gmlGroup">
	<h2>Éléments facultatifs (cercle 2)</h2>
	<xsl:apply-templates select="gml:definition[gml:property[@name='lheo:cercle'][@value='2']]" />
      </div>
      <div class="gmlGroup">
	<h2>Types de données basiques et structurants</h2>
	<xsl:apply-templates select="gml:definition[not(gml:property[@name='lheo:cercle'])]" />
      </div>
      <div class="gmlDictionaries">
	<h2>Dictionnaires</h2>
	<xsl:apply-templates select="gml:dict" />
      </div>
    </div>
  </xsl:template>

  <!--
      
      definition
      
  -->

  <xsl:template match="gml:definition">
    <div class="gmlDefinition">
      <div class="gmlName">
	<a name="{@name}"><code>&lt;<span class="name" title="{gml:fullname[@xml:lang=/gml:definitions/@xml:lang]}"><xsl:value-of select="@name" /></span>&gt;</code></a>
	<span> </span>
	<xsl:apply-templates select="gml:element_type" />
	<!--
	<xsl:if test="gml:attribute">
	  <xsl:for-each select="gml:attribute">
	    <br />
	    <xsl:apply-templates select="." />
	  </xsl:for-each>
	</xsl:if>
	-->
	<xsl:if test="gml:property">
	  <xsl:for-each select="gml:property">
	    <br />
	    <xsl:apply-templates select="." />
	  </xsl:for-each>
	</xsl:if>
      </div>
      <xsl:if test="gml:doc[@xml:lang=/gml:definitions/@xml:lang]">
	<div class="gmlDoc">
	  <p><xsl:value-of select="gml:doc[@xml:lang=/gml:definitions/@xml:lang]" /></p>
	</div>
      </xsl:if>
    </div>
  </xsl:template>

  <!--
      
      definition/element_type/sequence
  
  -->
  
  <xsl:template match="gml:element_type[gml:sequence]">
    <xsl:text>(</xsl:text>
    <xsl:for-each select="gml:sequence/gml:element">
      <xsl:variable name="min">
	<xsl:choose>
	  <xsl:when test="not(@min)"><xsl:number value="1"/></xsl:when>
	  <xsl:otherwise><xsl:value-of select="@min"/></xsl:otherwise>
	</xsl:choose>
      </xsl:variable>
      <xsl:variable name="max">
	<xsl:choose>
	  <xsl:when test="not(@max)"><xsl:number value="1"/></xsl:when>
	  <xsl:otherwise><xsl:value-of select="@max"/></xsl:otherwise>
	</xsl:choose>
      </xsl:variable>
      <code>
	<a href="#{@name}"><xsl:value-of select="@name" /></a>
	<xsl:choose>
	  <xsl:when test="$min=1 and $max=0">
	    <xsl:text>+</xsl:text>
	  </xsl:when>
	  <xsl:when test="$min=1 and $max&gt;1">
	    <xsl:text>+</xsl:text>
	    <xsl:value-of select="$max" />
	  </xsl:when>
	  <xsl:when test="$min=0 and $max=1">
	    <xsl:text>?</xsl:text>
	  </xsl:when>
	  <xsl:when test="$min=0 and $max=0">
	    <xsl:text>*</xsl:text>
	  </xsl:when>
	  <xsl:when test="$min=0 and $max&gt;1">
	    <xsl:text>*</xsl:text>
	    <xsl:value-of select="$max" />
	  </xsl:when>
	  <xsl:when test="$min&gt;1 and $max&gt;1">
	    <xsl:text>[</xsl:text>
	    <xsl:value-of select="$min" />
	    <xsl:text>,</xsl:text>
	    <xsl:value-of select="$max" />
	  </xsl:when>	  
	</xsl:choose>
      </code>
      <xsl:if test="not(position()=last())">
	<xsl:text>, </xsl:text>
      </xsl:if>
    </xsl:for-each>
    <xsl:text>)</xsl:text>
  </xsl:template>

  <!--
      
      definition/element_type/empty
      
  -->

  <xsl:template match="gml:element_type[gml:empty]">
    EMPTY
  </xsl:template>

  <!--
      
      definition/element_type/choice
      
  -->

  <xsl:template match="gml:element_type[gml:choice]">
    <xsl:variable name="min">
      <xsl:choose>
	<xsl:when test="not(gml:choice/@min)"><xsl:number value="1"/></xsl:when>
	<xsl:otherwise><xsl:value-of select="gml:choice/@min"/></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="max">
      <xsl:choose>
	<xsl:when test="not(gml:choice/@max)"><xsl:number value="1"/></xsl:when>
	<xsl:otherwise><xsl:value-of select="gml:choice/@max"/></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:text>(</xsl:text>
    <xsl:for-each select="gml:choice/gml:choice_element">
      <code>
	<a href="#{@name}"><xsl:value-of select="@name" /></a>
      </code>
      <xsl:if test="not(position()=last())">
	<xsl:text> | </xsl:text>
      </xsl:if>
    </xsl:for-each>
    <xsl:text>)</xsl:text>    
    <xsl:choose>
      <xsl:when test="$min=1 and $max=0">
	<xsl:text>+</xsl:text>
      </xsl:when>
      <xsl:when test="$min=1 and $max&gt;1">
	<xsl:text>+</xsl:text>
	<xsl:value-of select="$max" />
      </xsl:when>
      <xsl:when test="$min=0 and $max=1">
	<xsl:text>?</xsl:text>
      </xsl:when>
      <xsl:when test="$min=0 and $max=0">
	<xsl:text>*</xsl:text>
      </xsl:when>
      <xsl:when test="$min=0 and $max&gt;1">
	<xsl:text>*</xsl:text>
	<xsl:value-of select="$max" />
      </xsl:when>
      <xsl:when test="$min&gt;1 and $max&gt;1">
	<xsl:text>[</xsl:text>
	<xsl:value-of select="$min" />
	<xsl:text>,</xsl:text>
	<xsl:value-of select="$max" />
      </xsl:when>	  
    </xsl:choose>    
  </xsl:template>

  <!--
      
      definition/element_type/basic_text
      
  -->

  <xsl:template match="gml:element_type[gml:basic_text]">
    (#PCDATA) Texte de <xsl:value-of select="gml:basic_text/@lgmin" /> à <xsl:value-of select="gml:basic_text/@lgmax" /> caractères.
  </xsl:template>

  <!--
      
      definition/element_type/basic_key
      
  -->
  
  <xsl:template match="gml:element_type[gml:basic_key]">
    (#PCDATA) Clé de la table <code><xsl:value-of select="gml:basic_key/@ref" /></code>.
  </xsl:template>

  <!--
      
      definition/element_type/basic_data
      
  -->
  
  <xsl:template match="gml:element_type[gml:basic_data]">
    (#PCDATA)
  </xsl:template>
  
  <!--
      
      definition/element_type/*
      
  -->
  
  <xsl:template match="gml:element_type">
    (#PCDATA) type inconnu
  </xsl:template>

  <!--
      
      attribute
      
  -->
  
  <xsl:template match="gml:attribute">
    <code> <xsl:value-of select="@name" /><xsl:text>=</xsl:text></code>
    <xsl:apply-templates select="gml:attribute_type" />
    <xsl:choose>
      <xsl:when test="@type='default'">
	<code> (DEFAULT "</code>
	<xsl:value-of select="@value" />
	<code>"</code>
      </xsl:when>
      <xsl:when test="@type='fixed'">
	<code> (FIXED "</code>
	<xsl:value-of select="@value" />
	<code>"</code>
      </xsl:when>
      <xsl:when test="@type='optional'">
	<code> (OPTIONAL</code>
      </xsl:when>
      <xsl:when test="@type='required'">
	<code> (REQUIRED</code>
      </xsl:when>
    </xsl:choose>
    <xsl:text>)</xsl:text>
  </xsl:template>

  <!--
      
      attribute_type
      
  -->
  
  <xsl:template match="gml:attribute_type[gml:attribute_int]">
    <code>INT[</code>
    <code>,</code>
    <code>]</code>
  </xsl:template>
  <xsl:template match="gml:attribute_type[gml:attribute_float]">
    <code>FLOAT[</code>
    <code>,</code>
    <code>]</code>
  </xsl:template>
  <xsl:template match="gml:attribute_type[gml:attribute_date]">
    <code>DATE[</code>
    <code>,</code>
    <code>]</code>
  </xsl:template>
  <xsl:template match="gml:attribute_type[gml:attribute_text]">
    <code>TEXT[</code>
    <code>,</code>
    <code>]</code>
  </xsl:template>
  <xsl:template match="gml:attribute_type[gml:attribute_name]">
    <code>NAME[</code>
    <code>,</code>
    <code>]</code>
  </xsl:template>
  <xsl:template match="gml:attribute_type[gml:attribute_key]">
    <code>KEY from <a href="#{gml:attribute_key/@ref}"><xsl:value-of select="gml:attribute_key/@ref" /></a></code>
  </xsl:template>
  <xsl:template match="gml:attribute_type[gml:attribute_embedded_key]">
    <code>EMBEDDED_KEY from <a href="#{gml:attribute_key/@ref}"><xsl:value-of select="gml:attribute_key/@ref" /></a></code>
  </xsl:template>
  <xsl:template match="gml:attribute_type[gml:attribute_id]">
    <code>ID</code>
  </xsl:template>
  <xsl:template match="gml:attribute_type[gml:attribute_idref]">
    <code>IDREF</code>
  </xsl:template>
  <xsl:template match="gml:attribute_type[gml:attribute_date]">
    <code>DATA</code>
  </xsl:template>

  <!--
      
      dict
      
  -->
  
  <xsl:template match="gml:dict">
    <div class="gmlDict">
      <div class="gmlName">
	<a name="{@name}"><code><span class="name" title="{gml:fullname[@xml:lang=/gml:definitions/@xml:lang]}"><xsl:value-of select="@name" /></span></code></a>
	<xsl:text> </xsl:text>
	<xsl:value-of select="gml:fullname[@xml:lang=/gml:definitions/@xml:lang]" />
	<xsl:if test="gml:property[@name='glb:full']">
	  <xsl:text> (extrait)</xsl:text>
	</xsl:if>
	<xsl:if test="gml:property">
	  <xsl:for-each select="gml:property">
	    <br />
	    <xsl:apply-templates select="." />
	  </xsl:for-each>
	</xsl:if>
      </div>
      <dl>
	<xsl:apply-templates select="gml:entry" />
      </dl>
    </div>
  </xsl:template>

  <!--
      
      entry
      
  -->

  <xsl:template match="gml:entry">
    <xsl:apply-templates select="gml:key" />
    <xsl:apply-templates select="gml:value[@xml:lang=/gml:definitions/@xml:lang]" />
  </xsl:template>

  <!--
      
      entry/key
      
  -->

  <xsl:template match="gml:key">
    <dt><xsl:value-of select="@val" /></dt>
  </xsl:template>

  <!--
      
      entry/value
      
  -->

  <xsl:template match="gml:value">
    <dd><xsl:value-of select="@val" /></dd>
  </xsl:template>

  <!--
      
      property
      
  -->
  
  <xsl:template match="gml:property">
    Property : <code> <xsl:value-of select="@name" /><xsl:text> </xsl:text><xsl:value-of select="@value" /></code>
  </xsl:template>

</xsl:stylesheet>