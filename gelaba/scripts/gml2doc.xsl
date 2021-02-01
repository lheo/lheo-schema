<?xml version="1.0" encoding="utf-8"?>
<!-- 
GML2DOC

Transforms a language described in GML into a XHTML documentation.

Copyright 2006 ARMINES/CRI, DGEFP.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:gml="http://www.gelaba.org/gml/1.1"
		xmlns="http://www.w3.org/1999/xhtml"
		version="1.0">

  <xsl:param name="check" select="'no'" />
  <xsl:param name="lang" select="/gml:definitions/@xml:lang" />
  <xsl:param name="css" select="'gmldoc.css'"/>

  <xsl:include href="libgmlcheck.xsl" />
  <xsl:include href="libgmlstrings.xsl" />
  <xsl:include href="libgmldtd.xsl" />

  <xsl:output method="html" encoding="utf-8" indent="yes"/>

  <xsl:template match="/gml:definitions">
    <xsl:if test="$check='yes'">
      <xsl:call-template name="GMLCheck"/>
    </xsl:if>
    <html>
      <head>
	<title>
	  <xsl:call-template name="str_gmldef"/>
	  <xsl:value-of select="@language" />
	</title>
	<style type="text/css" media="screen">
	  <xsl:text>@import "</xsl:text>
	  <xsl:value-of select="$css"/>
	  <xsl:text>";</xsl:text>
	</style>
      </head>
      <body>
	<h1>
	  <xsl:call-template name="str_gmldef"/>
	  <xsl:value-of select="@language" />
	</h1>

	<table>
	  <tr>
	    <th>
	      <xsl:call-template name="str_namespace"/>
	    </th>
	    <td>
	      <xsl:value-of select="@namespace" />
	    </td>
	  </tr>
	  <tr>
	    <th>
	      <xsl:text>xml:lang</xsl:text>
	    </th>
	    <td>
	      <xsl:value-of select="@xml:lang" />
	    </td>
	  </tr>
	  <xsl:if test="@default_root">
	    <tr>
	      <th>
		<xsl:call-template name="str_default_root"/>
	      </th>
	      <td>
		<a href="#{@default_root}"><code><xsl:value-of select="@default_root" /></code></a>
	      </td>
	    </tr>
	  </xsl:if>
	</table>

	<div class="list_of_elements">
	  <ul>
	    <xsl:for-each select="gml:definition">
	      <li>
		<code>
		  <span>
		    <xsl:text>&lt;</xsl:text>		   
		    <a href="#{@name}"><xsl:value-of select="@name"/></a>		    
		    <xsl:text>&gt;</xsl:text>
		  </span>
		</code>
		<xsl:if test="gml:fullname[@xml:lang=$lang]">
		  <xsl:call-template name="str_colon" />
		  <xsl:value-of select="gml:fullname[@xml:lang=$lang]"/>
		</xsl:if>
	      </li>
	    </xsl:for-each>
	  </ul>
	</div>
	
	<xsl:apply-templates select="gml:definition"/>
	<xsl:apply-templates select="gml:dict"/>

	<a href="{@xmlns}"><code><xsl:value-of select="@xmlns" /></code></a>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="gml:definition">
    <div id="{@name}">
      <a name="{@name}"/>

      <div class="definition_name">
	<h1>
	  <xsl:call-template name="str_element" />
	  <xsl:call-template name="str_space" />
	  <code>
	    <xsl:text>&lt;</xsl:text>
	    <span>
	      <xsl:value-of select="@name"/>
	    </span>
	    <xsl:text>&gt;</xsl:text>
	  </code>
	</h1>
      </div>

      <xsl:if test="gml:fullname[@xml:lang=$lang]">
	<div class="definition_fullname">
	  <span>
	    <xsl:value-of select="gml:fullname[@xml:lang=$lang]"/>
	  </span>
	</div>
      </xsl:if>

      <xsl:if test="gml:doc[@xml:lang=$lang]">
	<div class="definition_doc">
	  <h2>
	    <xsl:call-template name="str_description"/>
	  </h2>
	  <p>
	    <xsl:value-of select="gml:doc[@xml:lang=$lang]"/>
	  </p>
	</div>
      </xsl:if>

      <div class="definition_content">
	<h2>
	  <xsl:call-template name="str_content"/>
	</h2>
	<xsl:apply-templates select="gml:element_type"/>
      </div>

      <xsl:if test="gml:attribute">
	<h2>
	  <xsl:call-template name="str_attributes"/>
	</h2>
	<pre>
	  <xsl:call-template name="dtd_dump_attributes">
	    <xsl:with-param name="cdef" select="."/>
	  </xsl:call-template>
	</pre>
	<xsl:apply-templates select="gml:attribute"/>	  
      </xsl:if>

      <!--
      <div class="definition_dtd">
	<h2>
	  <xsl:call-template name="str_dtd_element"/>
	</h2>
	<pre>
	  <xsl:call-template name="dtd_dump_definition">
	    <xsl:with-param name="cdef" select="."/>
	  </xsl:call-template>
	</pre>
      </div>
      -->

      <!-- TODO: element properties. -->
    </div>
    <hr/>
  </xsl:template>

  <xsl:template match="gml:attribute">
    <div class="definition_attribute">
      <h3>
	<xsl:call-template name="str_attribute"/>
	<xsl:call-template name="str_space"/>
	<code><xsl:value-of select="@name"/></code>
	<xsl:if test="gml:fullname[@xml:lang=$lang]">
	  <xsl:call-template name="str_colon"/>
	  <xsl:value-of select="gml:fullname[@xml:lang=$lang]"/>
	</xsl:if>
      </h3>

      <xsl:if test="gml:doc[@xml:lang=$lang]">
	<p>
	  <xsl:value-of select="gml:doc[@xml:lang=$lang]"/>
	</p>
      </xsl:if>
      
      <table class="attribute">
	<tr>
	  <th><xsl:call-template name="str_type"/></th>
	  <td><xsl:value-of select="@type"/></td>
	</tr>
	<xsl:if test="@value">
	  <tr>
	    <th><xsl:call-template name="str_value"/></th>
	    <td><code><xsl:value-of select="@value"/></code></td>
	  </tr>
	</xsl:if>
	<xsl:apply-templates select="gml:attribute_type"/>
      </table>

      <xsl:if test="gml:property">
	<table>
	  <tr>
	    <th><xsl:call-template name="str_pname"/></th>
	    <th><xsl:call-template name="str_description"/></th>
	    <th><xsl:call-template name="str_value"/></th>
	    <th><xsl:call-template name="str_data"/></th>
	  </tr>
	  <xsl:apply-templates select="gml:property"/>
	</table>
      </xsl:if>
    </div>
  </xsl:template>

  <xsl:template match="gml:attribute_type">
    <tr>
      <th><xsl:call-template name="str_contenttype"/></th>
      <td>
	<xsl:choose>
	  <xsl:when test="gml:attribute_int">
	    <xsl:call-template name="str_integer" />
	  </xsl:when>
	  <xsl:when test="gml:attribute_float">
	    <xsl:call-template name="str_float" />
	  </xsl:when>
	  <xsl:when test="gml:attribute_date">
	    <xsl:call-template name="str_date" />
	  </xsl:when>
	  <xsl:when test="gml:attribute_text">
	    <xsl:call-template name="str_text" />
	  </xsl:when>
	  <xsl:when test="gml:attribute_data">
	    <xsl:call-template name="str_data" />
	  </xsl:when>
	  <xsl:when test="gml:attribute_name">
	    <xsl:call-template name="str_name" />
	  </xsl:when>
	  <xsl:when test="gml:attribute_key">
	    <xsl:call-template name="str_key" />
	  </xsl:when>
	  <xsl:when test="gml:attribute_embedded_key">
	    <xsl:call-template name="str_embedded_key" />
	  </xsl:when>
	  <xsl:when test="gml:attribute_id">
	    <xsl:call-template name="str_id" />
	  </xsl:when>
	  <xsl:when test="gml:attribute_idref">
	    <xsl:call-template name="str_idref" />
	  </xsl:when>
	</xsl:choose>
      </td>
    </tr>
    <xsl:apply-templates select="*"/>
  </xsl:template>

  <xsl:template match="gml:attribute_key|gml:attribute_embedded_key">
    <tr>
      <th><xsl:call-template name="str_dictionary"/></th>
      <td><a href="#{@ref}"><xsl:value-of select="@ref"/></a></td>
    </tr>
  </xsl:template>  

  <xsl:template match="gml:attribute_int|gml:attribute_float|gml:attribute_date|gml:attribute_text|gml:attribute_name|gml:attribute_id|gml:attribute_idref|gml:attribute_data">
    <xsl:if test="@vmin">
      <tr>
	<th><xsl:call-template name="str_vmin" /></th>
	<td><xsl:value-of select="@vmin"/></td>
      </tr>
    </xsl:if>
    <xsl:if test="@vmax">
      <tr>
	<th><xsl:call-template name="str_vmax" /></th>
	<td><xsl:value-of select="@vmax"/></td>
      </tr>
    </xsl:if>
    <xsl:if test="@lgmax">
      <tr>
	<th><xsl:call-template name="str_lgmax" /></th>
	<td><xsl:value-of select="@lgmax"/></td>
      </tr>
    </xsl:if>
    <xsl:if test="@lgmin">
      <tr>
	<th><xsl:call-template name="str_lgmin" /></th>
	<td><xsl:value-of select="@lgmin"/></td>
      </tr>
    </xsl:if>
    <xsl:if test="@ref">
      <tr>
	<th><xsl:call-template name="str_dictionary" /></th>
	<td><xsl:value-of select="@ref"/></td>
      </tr>
    </xsl:if>
    <xsl:if test="@regexp">
      <tr>
	<th><xsl:call-template name="str_regexp" /></th>
	<td><xsl:value-of select="@regexp"/></td>
      </tr>
    </xsl:if>
  </xsl:template>



  <xsl:template match="gml:dict">
    <div id="{@name}" class="dict">
      <a name="{@name}"/>

      <div class="dict_name">
	<h1>
	  <xsl:call-template name="str_dictionary"/>
	  <xsl:call-template name="str_space"/>
	  <code>
	    <span>
	      <xsl:value-of select="@name"/>
	    </span>
	  </code>
	</h1>
      </div>

      <xsl:if test="gml:fullname[@xml:lang=$lang]">
	<div class="dict_fullname">
	  <span>
	    <xsl:value-of select="gml:fullname[@xml:lang=$lang]"/>
	  </span>
	</div>
      </xsl:if>

      <xsl:if test="gml:doc[@xml:lang=$lang]">
	<div class="dict_doc">
	  <h2>
	    <xsl:call-template name="str_description"/>
	  </h2>
	  <p>
	    <xsl:value-of select="gml:doc[@xml:lang=$lang]"/>
	  </p>
	</div>
      </xsl:if>
      
      <div class="dict_content">
	<h2>
	  <xsl:call-template name="str_content"/>
	</h2>
	<table>
	  <tr>
	    <th>
	      <xsl:call-template name="str_key" />
	    </th>
	    <th>
	      <xsl:call-template name="str_value" />
	    </th>
	  </tr>
	  <xsl:apply-templates select="gml:entry"/>
	</table>
      </div>
    </div>
    <hr/>
  </xsl:template>
  
  <xsl:template match="gml:entry">
    <tr class="dict_entry">
      <td>
	<xsl:for-each select="gml:key">
	  <code><xsl:value-of select="@val"/></code>
	  <br/>
	</xsl:for-each>
      </td>
      <td>
	<xsl:for-each select="gml:value">
	  <xsl:value-of select="@val"/>
	  <xsl:if test="@xml:lang">
	    <xsl:text> (xml:lang='</xsl:text>
	    <xsl:value-of select="@xml:lang"/>
	    <xsl:text>')</xsl:text>
	  </xsl:if>
	  <br/>
	</xsl:for-each>
      </td>
    </tr>
  </xsl:template>

  <xsl:template match="gml:element_type">
    <xsl:apply-templates select="*"/>
  </xsl:template>

  <!--
      gml:sequence
  -->
  <xsl:template match="gml:sequence">
    <p>
      <xsl:call-template name="str_fullsequence"/>
    </p>
    <pre>
      <xsl:call-template name="dtd_dump_element">
	<xsl:with-param name="cdef" select="../.."/>
      </xsl:call-template>
    </pre>
    <div class="content_type">
      <table>
	<tr>
	  <th class="content_type">
	    <xsl:call-template name="str_sequence" />
	  </th>
	  <th>
	    <xsl:call-template name="str_repeat" />
	  </th>
	  <th>
	    <xsl:call-template name="str_description" />
	  </th>
	</tr>
	<xsl:for-each select="gml:element">
	  <tr>
	    <td>
	      <code><a href="#{@name}"><xsl:value-of select="@name"/></a></code>
	    </td>
	    <td>
	      <xsl:text>[</xsl:text>
	      <xsl:choose>
		<xsl:when test="@min">
		  <xsl:value-of select="@min"/>
		</xsl:when>
		<xsl:otherwise>
		  <xsl:text>1</xsl:text>
		</xsl:otherwise>
	      </xsl:choose>
	      <xsl:text>,</xsl:text>
	      <xsl:choose>
		<xsl:when test="@max">
		  <xsl:choose>
		    <xsl:when test="@max=0">
		      <xsl:text>*</xsl:text>
		    </xsl:when>
		    <xsl:otherwise>
		      <xsl:value-of select="@max"/>
		    </xsl:otherwise>
		  </xsl:choose>
		</xsl:when>
		<xsl:otherwise>
		  <xsl:text>1</xsl:text>
		</xsl:otherwise>
	      </xsl:choose>
	      <xsl:text>]</xsl:text>
	    </td>
	    <td>
	      <xsl:value-of select="gml:doc[@xml:lang=$lang]"/>
	    </td>
	  </tr>
	</xsl:for-each>
      </table>
    </div>
  </xsl:template>

  <!--
      gml:choice
  -->
  <xsl:template match="gml:choice">
    <p>
      <xsl:call-template name="str_fullchoice"/>
    </p>
    <pre>
      <xsl:call-template name="dtd_dump_element">
	<xsl:with-param name="cdef" select="../.."/>
      </xsl:call-template>
    </pre>

    <div class="content_type">
      <table class="content_type">
	<tr>
	  <th class="content_type">
	    <xsl:call-template name="str_choice" />
	  </th>
	  <th>
	    <xsl:call-template name="str_description" />
	  </th>
	</tr>
	<xsl:for-each select="gml:choice_element">
	  <tr>
	    <td>
	      <code><a href="#{@name}"><xsl:value-of select="@name"/></a></code>
	    </td>
	    <td>
	      <xsl:value-of select="gml:doc[@xml:lang=$lang]"/>
	    </td>
	  </tr>
	</xsl:for-each>
      </table>
    </div>
  </xsl:template>

  <xsl:template match="gml:mixed">
    <div class="content_type">
      <xsl:call-template name="str_mixed" />
    </div>
    <table class="mixed_description">
      <tr>
	<th><xsl:call-template name="str_name"/></th>
	<th><xsl:call-template name="str_description"/></th>
      </tr>
      <xsl:apply-templates select="gml:authorized_element" />
    </table>
  </xsl:template>

  <xsl:template match="gml:tree">
    <div class="content_type">
      <xsl:call-template name="str_tree" />
    </div>
    <table class="tree_description">
      <tr>
	<th><xsl:call-template name="str_node"/></th>
	<th><xsl:call-template name="str_leaf"/></th>
	<th><xsl:call-template name="str_description"/></th>
      </tr>
      <tr>
	<td>
	  <code>
	    <xsl:value-of select="@node"/>
	  </code>
	</td>
	<td>
	  <code>
	    <xsl:value-of select="@leaf"/>
	  </code>
	</td>
	<td>
	  <xsl:value-of select="gml:doc[@xml:lang=$lang]"/>		    
	</td>
      </tr>
    </table>
  </xsl:template>

  <xsl:template match="gml:empty">
    <div class="content_type">
      <xsl:call-template name="str_empty" />
    </div>
  </xsl:template>

  <xsl:template match="gml:basic_int">
    <div class="content_type">
      <xsl:call-template name="str_integer" />
    </div>
    <table class="integer_description">
      <tr>
	<th><xsl:call-template name="str_vmin"/></th>
	<th><xsl:call-template name="str_vmax"/></th>
	<th><xsl:call-template name="str_description"/></th>
      </tr>
      <tr>
	<td>
	  <xsl:choose>
	    <xsl:when test="@vmin">
	      <xsl:value-of select="@vmin"/>
	    </xsl:when>
	    <xsl:otherwise>
	      <xsl:text>?</xsl:text>
	    </xsl:otherwise>
	  </xsl:choose>
	</td>
	<td>
	  <xsl:choose>
	    <xsl:when test="@vmax">
	      <xsl:value-of select="@vmax"/>
	    </xsl:when>
	    <xsl:otherwise>
	      <xsl:text>?</xsl:text>
	    </xsl:otherwise>
	  </xsl:choose>
	</td>
	<td>
	  <xsl:value-of select="gml:doc[@xml:lang=$lang]"/>		    
	</td>
      </tr>
    </table>

    <xsl:if test="gml:property">
      <table class="properties">
	<tr>
	  <th><xsl:call-template name="str_pname"/></th>
	  <th><xsl:call-template name="str_description"/></th>
	  <th><xsl:call-template name="str_value"/></th>
	  <th><xsl:call-template name="str_data"/></th>
	</tr>
	<xsl:apply-templates select="gml:property"/>
      </table>
    </xsl:if>
  </xsl:template>

  <xsl:template match="gml:basic_float">
    <div class="content_type">
      <xsl:call-template name="str_float" />
    </div>
    <table class="float_description">
      <tr>
	<th><xsl:call-template name="str_vmin"/></th>
	<th><xsl:call-template name="str_vmax"/></th>
	<th><xsl:call-template name="str_description"/></th>
      </tr>
      <tr>
	<td>
	  <xsl:choose>
	    <xsl:when test="@vmin">
	      <xsl:value-of select="@vmin"/>
	    </xsl:when>
	    <xsl:otherwise>
	      <xsl:text>?</xsl:text>
	    </xsl:otherwise>
	  </xsl:choose>
	</td>
	<td>
	  <xsl:choose>
	    <xsl:when test="@vmax">
	      <xsl:value-of select="@vmax"/>
	    </xsl:when>
	    <xsl:otherwise>
	      <xsl:text>?</xsl:text>
	    </xsl:otherwise>
	  </xsl:choose>
	</td>
	<td>
	  <xsl:value-of select="gml:doc[@xml:lang=$lang]"/>		    
	</td>
      </tr>
    </table>
    <xsl:if test="gml:property">
      <table>
	<tr>
	  <th><xsl:call-template name="str_pname"/></th>
	  <th><xsl:call-template name="str_description"/></th>
	  <th><xsl:call-template name="str_value"/></th>
	  <th><xsl:call-template name="str_data"/></th>
	</tr>
	<xsl:apply-templates select="gml:property"/>
      </table>
    </xsl:if>
  </xsl:template>

  <xsl:template match="gml:basic_date">
    <div class="content_type">
      <xsl:call-template name="str_date" />
      <xsl:call-template name="str_space" />
      <xsl:text>(</xsl:text>
      <xsl:call-template name="str_dateformat" />
      <xsl:text>)</xsl:text>
    </div>
    <table>
      <tr>
	<th><xsl:call-template name="str_vmin"/></th>
	<th><xsl:call-template name="str_vmax"/></th>
	<th><xsl:call-template name="str_description"/></th>
      </tr>
      <tr>
	<td>
	  <xsl:choose>
	    <xsl:when test="@vmin">
	      <xsl:value-of select="@vmin"/>
	    </xsl:when>
	    <xsl:otherwise>
	      <xsl:text>?</xsl:text>
	    </xsl:otherwise>
	  </xsl:choose>
	</td>
	<td>
	  <xsl:choose>
	    <xsl:when test="@vmax">
	      <xsl:value-of select="@vmax"/>
	    </xsl:when>
	    <xsl:otherwise>
	      <xsl:text>?</xsl:text>
	    </xsl:otherwise>
	  </xsl:choose>
	</td>
	<td>
	  <xsl:value-of select="gml:doc[@xml:lang=$lang]"/>		    
	</td>
      </tr>
    </table>
    <xsl:if test="gml:property">
      <table>
	<tr>
	  <th><xsl:call-template name="str_pname"/></th>
	  <th><xsl:call-template name="str_description"/></th>
	  <th><xsl:call-template name="str_value"/></th>
	  <th><xsl:call-template name="str_data"/></th>
	</tr>
	<xsl:apply-templates select="gml:property"/>
      </table>
    </xsl:if>
  </xsl:template>

  <xsl:template match="gml:basic_text">
    <div class="content_type">
      <xsl:call-template name="str_text" />
    </div>
    <table>
      <tr>
	<th><xsl:call-template name="str_lgmin"/></th>
	<th><xsl:call-template name="str_lgmax"/></th>
	<th><xsl:call-template name="str_description"/></th>
      </tr>
      <tr>
	<td>
	  <xsl:choose>
	    <xsl:when test="@lgmin">
	      <xsl:value-of select="@lgmin"/>
	    </xsl:when>
	    <xsl:otherwise>
	      <xsl:text>?</xsl:text>
	    </xsl:otherwise>
	  </xsl:choose>
	</td>
	<td>
	  <xsl:choose>
	    <xsl:when test="@lgmax">
	      <xsl:value-of select="@lgmax"/>
	    </xsl:when>
	    <xsl:otherwise>
	      <xsl:text>?</xsl:text>
	    </xsl:otherwise>
	  </xsl:choose>
	</td>
	<td>
	  <xsl:value-of select="gml:doc[@xml:lang=$lang]"/>		    
	</td>
      </tr>
    </table>
    <xsl:if test="gml:property">
      <table>
	<tr>
	  <th><xsl:call-template name="str_pname"/></th>
	  <th><xsl:call-template name="str_description"/></th>
	  <th><xsl:call-template name="str_value"/></th>
	  <th><xsl:call-template name="str_data"/></th>
	</tr>
	<xsl:apply-templates select="gml:property"/>
      </table>
    </xsl:if>
  </xsl:template>

  <xsl:template match="gml:basic_name">
    <div class="content_type">
      <xsl:call-template name="str_name" />
    </div>
    <table>
      <tr>
	<th><xsl:call-template name="str_lgmin"/></th>
	<th><xsl:call-template name="str_lgmax"/></th>
	<th><xsl:call-template name="str_description"/></th>
      </tr>
      <tr>
	<td>
	  <xsl:choose>
	    <xsl:when test="@lgmin">
	      <xsl:value-of select="@lgmin"/>
	    </xsl:when>
	    <xsl:otherwise>
	      <xsl:text>?</xsl:text>
	    </xsl:otherwise>
	  </xsl:choose>
	</td>
	<td>
	  <xsl:choose>
	    <xsl:when test="@lgmax">
	      <xsl:value-of select="@lgmax"/>
	    </xsl:when>
	    <xsl:otherwise>
	      <xsl:text>?</xsl:text>
	    </xsl:otherwise>
	  </xsl:choose>
	</td>
	<td>
	  <xsl:value-of select="gml:doc[@xml:lang=$lang]"/>		    
	</td>
      </tr>
    </table>
    <xsl:if test="gml:property">
      <table>
	<tr>
	  <th><xsl:call-template name="str_pname"/></th>
	  <th><xsl:call-template name="str_description"/></th>
	  <th><xsl:call-template name="str_value"/></th>
	  <th><xsl:call-template name="str_data"/></th>
	</tr>
	<xsl:apply-templates select="gml:property"/>
      </table>
    </xsl:if>
  </xsl:template>

  <xsl:template match="gml:basic_key">
    <div class="content_type">
      <xsl:call-template name="str_key" />
    </div>
    <table>
      <tr>
	<th><xsl:call-template name="str_dictionary"/></th>
	<th><xsl:call-template name="str_description"/></th>
      </tr>
      <tr>
	<td>
	  <xsl:value-of select="@ref"/>
	</td>
	<td>
	  <xsl:value-of select="gml:doc[@xml:lang=$lang]"/>		    
	</td>
      </tr>
    </table>
    <xsl:if test="gml:property">
      <table>
	<tr>
	  <th><xsl:call-template name="str_pname"/></th>
	  <th><xsl:call-template name="str_description"/></th>
	  <th><xsl:call-template name="str_value"/></th>
	  <th><xsl:call-template name="str_data"/></th>
	</tr>
	<xsl:apply-templates select="gml:property"/>
      </table>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="gml:basic_data">
    <div class="content_type">
      <xsl:call-template name="str_data" />
    </div>
    <table>
      <tr>
	<th><xsl:call-template name="str_description"/></th>
      </tr>
      <tr>
	<td>
	  <xsl:value-of select="gml:doc[@xml:lang=$lang]"/>		    
	</td>
      </tr>
    </table>
    <xsl:if test="gml:property">
      <table>
	<tr>
	  <th><xsl:call-template name="str_pname"/></th>
	  <th><xsl:call-template name="str_description"/></th>
	  <th><xsl:call-template name="str_value"/></th>
	  <th><xsl:call-template name="str_data"/></th>
	</tr>
	<xsl:apply-templates select="gml:property"/>
      </table>
    </xsl:if>
  </xsl:template>

  <xsl:template match="gml:choice_element | gml:authorized_element">
    <tr>
      <td>
	<code>
	  <a href="#{@name}">
	    <xsl:value-of select="@name"/>
	  </a>
	</code>
      </td>
      <td>
	<xsl:value-of select="gml:doc[@xml:lang=$lang]"/>		    
      </td>
    </tr>
  </xsl:template>


  <!--<xsl:template match="gml:element">
    <tr>
      <td>
	<code>
	  <a href="#{@name}">
	    <xsl:value-of select="@name"/>
	  </a>
	</code>
      </td>
      <td>
	<xsl:choose>
	  <xsl:when test="@min">
	    <xsl:value-of select="@min"/>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:text>1</xsl:text>
	  </xsl:otherwise>
	</xsl:choose>
      </td>
      <td>
	<xsl:choose>
	  <xsl:when test="@max">
	    <xsl:value-of select="@max"/>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:text>1</xsl:text>
	  </xsl:otherwise>
	</xsl:choose>
      </td>
      <td>
	<xsl:value-of select="gml:doc[@xml:lang=$lang]"/>		    
      </td>
    </tr>
  </xsl:template>-->


  <xsl:template match="gml:property">
    <tr>
      <td><xsl:value-of select="@name"/></td>
      <td><xsl:value-of select="gml:doc[@xml:lang=$lang]"/></td>
      <td><xsl:value-of select="@value"/></td>
      <td>
	<xsl:choose>
	  <xsl:when test="gml:property_data">
	    <xsl:call-template name="str_yes"/>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:call-template name="str_no"/>
	  </xsl:otherwise>
	</xsl:choose>
      </td>      
    </tr>
  </xsl:template>

  <!--  <xsl:template match="gml:property" mode="attribut">
    <tr>
      <th><xsl:call-template name="str_pname"/></th>
      <td><xsl:value-of select="@name"/></td>
    </tr>
    <xsl:if test="gml:doc[@xml:lang=$lang]">
      <tr>
	<th><xsl:call-template name="str_pdoc"/></th>
	<td><xsl:value-of select="gml:doc[@xml:lang=$lang]"/></td>
      </tr>
    </xsl:if>
    <xsl:if test="@value">
      <tr>
	<th><xsl:call-template name="str_pval"/></th>
	<td><xsl:value-of select="@value"/></td>
      </tr>
    </xsl:if>
    <xsl:if test="gml:property_data">
      <tr>
	<th><xsl:call-template name="str_pdata"/></th>
	<td><xsl:call-template name="str_yes"/></td>
      </tr>
    </xsl:if>
  </xsl:template> -->

  <xsl:template match="text()|@*"/>

</xsl:stylesheet>
