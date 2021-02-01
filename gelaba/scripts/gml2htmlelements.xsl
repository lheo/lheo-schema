<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		xmlns="http://www.w3.org/1999/xhtml"
		xmlns:gml="http://www.gelaba.org/gml/1.1"
		version="1.0">

  <xsl:output method="xml" indent="yes" encoding="utf-8" />

  <xsl:param name="lang" select="'fr'" />
  <xsl:param name="mode" select="'htmltables'" />
  <xsl:param name="links" select="'yes'" />
  <xsl:param name="name" select="''"/>
  <xsl:param name="withns" select="'no'"/>
  <xsl:param name="hideproperty" select="'yes'"/>
  
  <xsl:param name="element.fullname" select="'Name'"/>
  <xsl:param name="element.name" select="'Element'"/>
  <xsl:param name="element.content" select="'Content'"/>
  <xsl:param name="element.attribute" select="'Attribute'"/>
  <xsl:param name="element.attribute.type" select="'Attribute type'"/>
  <xsl:param name="element.documentation" select="'Documentation'"/>
  <xsl:param name="property.name" select="'Property'"/>
  <xsl:param name="property.value" select="'Value'"/>
  <xsl:param name="property.data" select="'Extra data'"/>
  <xsl:param name="property.doc" select="'Doc'"/>
  <xsl:param name="element_type.sequence" select="'Sequence'"/>
  <xsl:param name="element_type.choice" select="'Choice'"/>
  <xsl:param name="element_type.int" select="'Integer'"/>
  <xsl:param name="element_type.float" select="'Float'"/>
  <xsl:param name="element_type.date" select="'Date'"/>
  <xsl:param name="element_type.text" select="'Text'"/>
  <xsl:param name="element_type.name" select="'Name'"/>
  <xsl:param name="element_type.empty" select="'Empty element'"/>
  <xsl:param name="element_type.data" select="'Raw data'"/>
  <xsl:param name="element_type.key" select="'Dictionary key'"/>
  <xsl:param name="title.min" select="'min'"/>
  <xsl:param name="title.max" select="'max'"/>
  <xsl:param name="title.vmin" select="'min value'"/>
  <xsl:param name="title.vmax" select="'max value'"/>
  <xsl:param name="title.lgmin" select="'min length'"/>
  <xsl:param name="title.lgmax" select="'max length'"/>
  <xsl:param name="title.elements" select="'Total elements'"/>
  <xsl:param name="title.regexp" select="'Regular expression'"/>
  <xsl:param name="title.values" select="'Values'"/>
  <xsl:param name="title.dictionary" select="'Dictionary'"/>
  <xsl:param name="title.service" select="'Service'"/>
  <xsl:param name="title.external_service" select="'External service'"/>
  <xsl:param name="value.notdefined" select="'-'"/>
  <xsl:param name="title.doc" select="'doc'"/>
  <xsl:param name="title.keys" select="'Keys'"/>
  <xsl:param name="title.value" select="'Value'"/>
  <xsl:param name="title.data" select="'Extra data'"/>
    
  <xsl:template match="/gml:definitions">
    <xsl:choose>
      <xsl:when test="$mode='htmltables'">
	<xsl:choose>
	  <xsl:when test="$name">
	    <div class="gml.definitions">
	      <xsl:apply-templates select="gml:definition[@name=$name]" />
	    </div>
	  </xsl:when>
	  <xsl:otherwise>
	    <div class="gml.definitions">
	      <xsl:apply-templates select="gml:definition" />
	    </div>	    
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:when>
      <xsl:when test="$mode='dictionaries'">
	<xsl:choose>
	  <xsl:when test="$name">
	    <div class="gml.dictionaries">
	      <xsl:apply-templates select="gml:dict[@name=$name]" />
	    </div>
	  </xsl:when>
	  <xsl:otherwise>
	    <div class="gml.dictionaries">
	      <xsl:apply-templates select="gml:dict" />
	    </div>	    
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:when>
      <xsl:otherwise>
	<div class="gml.doc">
	  <div class="gml.definitions">
	    <xsl:apply-templates select="gml:definition" />
	  </div>	    
	  <div class="gml.dictionaries">
	    <xsl:apply-templates select="gml:dict" />
	  </div>
	</div>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="gml:definition" >
    <div class="gml.definition">
      <!-- Name, fullname -->
      <h3>
	<xsl:apply-templates select="@name" />
	<xsl:apply-templates select="gml:fullname[@xml:lang=$lang]" />
      </h3>

      <!-- Doc -->
      <xsl:apply-templates select="gml:doc[@xml:lang=$lang]" />

      <!-- Type -->
      <xsl:apply-templates select="gml:element_type" />

      <!-- Atributes  -->
      <!--<xsl:apply-templates select="gml:attribute" />-->

      <!-- Properties -->

      <!-- Used by -->
    </div>
  </xsl:template>

  <xsl:template match="gml:element_type[gml:sequence]" >
    <table class="gml.definition.content">
      <tr>
	<th><xsl:value-of select="$element_type.sequence"/></th>
	<th><xsl:value-of select="$title.min"/></th>
	<th><xsl:value-of select="$title.max"/></th>
	<th><xsl:value-of select="$title.doc"/></th>
      </tr>
      <xsl:for-each select="gml:sequence/gml:element">	
	<tr>
	  <td>
	    <xsl:text>&lt;</xsl:text>
	    <xsl:apply-templates select="@name" mode="html-element-reference"/>
	    <xsl:text>&gt;</xsl:text>		      
	  </td>
	  <td>
	    <xsl:apply-templates select="." mode="showmin"/>		    
	  </td>
	  <td>
	    <xsl:apply-templates select="." mode="showmax"/>		    
	  </td>
	  <td>
	    <xsl:apply-templates select="gml:doc[@xml:lang=$lang]" />
	  </td>
	</tr>
      </xsl:for-each>
    </table>
  </xsl:template>

  <xsl:template match="gml:element_type[gml:choice]" >
    <table class="gml.definition.content">
      <tr>
	<th><xsl:value-of select="$element_type.choice"/></th>
	<th><xsl:value-of select="$title.min"/></th>
	<th><xsl:value-of select="$title.max"/></th>
	<th><xsl:value-of select="$title.doc"/></th>
      </tr>
      <tr>
	<th>
	  <xsl:value-of select="$title.elements"/>
	</th>
	<td>	    
	  <xsl:apply-templates select="gml:choice" mode="showmin"/>		    
	</td>
	<td>	    
	  <xsl:apply-templates select="gml:choice" mode="showmax"/>		    
	</td>
	<td></td>
      </tr>      
      <xsl:for-each select="gml:choice/gml:choice_element">	
	<tr>
	  <td>
	    <xsl:text>&lt;</xsl:text>
	    <xsl:apply-templates select="@name" mode="html-element-reference"/>
	    <xsl:text>&gt;</xsl:text>		      
	  </td>
	  <td>
	  </td>
	  <td>
	  </td>
	  <td>
	    <xsl:apply-templates select="gml:doc[@xml:lang=$lang]" />
	  </td>
	</tr>
      </xsl:for-each>
    </table>
  </xsl:template>

  <xsl:template match="gml:element_type[gml:empty]" >
    <table class="gml.definition.content">
      <tr>
	<th><xsl:value-of select="$element_type.empty"/></th>
      </tr>
    </table>
  </xsl:template>

  <xsl:template match="gml:element_type[gml:basic_int]|gml:element_type[gml:basic_float]|gml:element_type[gml:basic_date]" >
    <table class="gml.definition.content">
      <tr>
	<th>
	  <xsl:choose>
	    <xsl:when test="gml:basic_int">
	      <xsl:value-of select="$element_type.int"/>
	    </xsl:when>
	    <xsl:when test="gml:basic_float">
	      <xsl:value-of select="$element_type.float"/>
	    </xsl:when>
	    <xsl:when test="gml:basic_date">
	      <xsl:value-of select="$element_type.date"/>
	    </xsl:when>
	  </xsl:choose>
	</th>
	<th><xsl:value-of select="$title.vmin"/></th>
	<th><xsl:value-of select="$title.vmax"/></th>
	<th><xsl:value-of select="$title.doc"/></th>
      </tr>
      <tr>
	<td>
	  <xsl:text> </xsl:text>
	</td>
	<td>
	  <xsl:apply-templates select="descendant::node()" mode="showvmin"/>		    
	</td>
	<td>
	  <xsl:apply-templates select="descendant::node()" mode="showvmax"/>		    
	</td>
	<td>
	  <xsl:apply-templates select="gml:doc[@xml:lang=$lang]" />
	</td>
      </tr>
      <xsl:if test="descendant::node()/gml:property and not($hideproperty='yes')">
	<tr>
	  <th>
	    <xsl:value-of select="$property.name"/>
	  </th>
	  <th>
	    <xsl:value-of select="$property.value"/>
	  </th>
	  <th>
	    <xsl:value-of select="$property.data"/>
	  </th>
	  <th>
	    <xsl:value-of select="$property.doc"/>
	  </th>
	</tr>
	<xsl:for-each select="descendant::node()/gml:property">
	  <tr>
	    <xsl:apply-templates select="."/>
	  </tr>
	</xsl:for-each>
      </xsl:if>
    </table>
  </xsl:template>

  <xsl:template match="gml:element_type[gml:basic_text]" >
    <table class="gml.definition.content">
      <tr>
	<th>
	  <xsl:value-of select="$element_type.text"/>
	</th>
	<th><xsl:value-of select="$title.lgmin"/></th>
	<th><xsl:value-of select="$title.lgmax"/></th>
	<th><xsl:value-of select="$title.regexp"/></th>
	<th><xsl:value-of select="$title.doc"/></th>
      </tr>
      <tr>
	<td>
	  <xsl:text> </xsl:text>
	</td>
	<td>
	  <xsl:apply-templates select="descendant::node()" mode="showlgmin"/>		    
	</td>
	<td>
	  <xsl:apply-templates select="descendant::node()" mode="showlgmax"/>		    
	</td>
	<td>
	  <xsl:value-of select="descendant::node()/@regexp"/>		    
	</td>
	<td>
	  <xsl:apply-templates select="gml:doc[@xml:lang=$lang]" />
	</td>
      </tr>
      <xsl:if test="descendant::node()/gml:property and not($hideproperty='yes')">
	<tr>
	  <th>
	    <xsl:value-of select="$property.name"/>
	  </th>
	  <th>
	    <xsl:value-of select="$property.value"/>
	  </th>
	  <th>
	    <xsl:value-of select="$property.data"/>
	  </th>
	  <th>
	    <xsl:value-of select="$property.doc"/>
	  </th>
	  <th>
	  </th>
	</tr>
	<xsl:for-each select="descendant::node()/gml:property">
	  <tr>
	    <xsl:apply-templates select="."/>
	    <td></td>
	  </tr>
	</xsl:for-each>
      </xsl:if>
    </table>
  </xsl:template>

  <xsl:template match="gml:element_type[gml:basic_name]" >
    <table class="gml.definition.content">
      <tr>
	<th>
	  <xsl:value-of select="$element_type.name"/>
	</th>
	<th><xsl:value-of select="$title.lgmin"/></th>
	<th><xsl:value-of select="$title.lgmax"/></th>
	<th><xsl:value-of select="$title.doc"/></th>
      </tr>
      <tr>
	<td>
	  <xsl:text> </xsl:text>
	</td>
	<td>
	  <xsl:apply-templates select="descendant::node()" mode="showlgmin"/>		    
	</td>
	<td>
	  <xsl:apply-templates select="descendant::node()" mode="showlgmax"/>		    
	</td>
	<td>
	  <xsl:apply-templates select="gml:doc[@xml:lang=$lang]" />
	</td>
      </tr>
      <xsl:if test="descendant::node()/gml:property and not($hideproperty='yes')">
	<tr>
	  <th>
	    <xsl:value-of select="$property.name"/>
	  </th>
	  <th>
	    <xsl:value-of select="$property.value"/>
	  </th>
	  <th>
	    <xsl:value-of select="$property.data"/>
	  </th>
	  <th>
	    <xsl:value-of select="$property.doc"/>
	  </th>
	</tr>
	<xsl:for-each select="descendant::node()/gml:property">
	  <tr>
	    <xsl:apply-templates select="."/>
	  </tr>
	</xsl:for-each>
      </xsl:if>
    </table>
  </xsl:template>

  <xsl:template match="gml:element_type[gml:basic_key]" >
    <table class="gml.definition.content">
      <tr>
	<th><xsl:value-of select="$element_type.key"/></th>
	<th><xsl:value-of select="$title.dictionary"/></th>
	<th><xsl:value-of select="$title.values"/></th>
	<th><xsl:value-of select="$title.doc"/></th>
      </tr>
      <tr>
	<td>
	  <xsl:text> </xsl:text>
	</td>
	<td>
	  <xsl:apply-templates select="descendant::node()/@ref" mode="showdict"/>		    
	</td>
	<td>
	  <xsl:apply-templates select="descendant::node()/@ref" mode="showkeys"/>		    
	</td>
	<td>
	  <xsl:apply-templates select="gml:doc[@xml:lang=$lang]" />
	</td>
      </tr>
      <xsl:if test="descendant::node()/gml:property and not($hideproperty='yes')">
	<tr>
	  <th>
	    <xsl:value-of select="$property.name"/>
	  </th>
	  <th>
	    <xsl:value-of select="$property.value"/>
	  </th>
	  <th>
	    <xsl:value-of select="$property.data"/>
	  </th>
	  <th>
	    <xsl:value-of select="$property.doc"/>
	  </th>
	</tr>
	<xsl:for-each select="descendant::node()/gml:property">
	  <tr>
	    <xsl:apply-templates select="."/>
	  </tr>
	</xsl:for-each>
      </xsl:if>
    </table>
  </xsl:template>

  <xsl:template match="gml:element_type[gml:basic_data]" >
    <table class="gml.definition.content">
      <tr>
	<th><xsl:value-of select="$element_type.data"/></th>
      </tr>
    </table>
  </xsl:template>

  <!-- PROPERTY -->
  <xsl:template match="gml:property">
    <td><xsl:value-of select="@name"/></td>
    <td><xsl:value-of select="@value"/></td>
    <td>
      <xsl:if test="gml:data">
	<xsl:text>*</xsl:text>
      </xsl:if>
    </td>
    <td>
      <xsl:apply-templates select="gml:doc[@xml:lang=$lang]"/>
    </td>    
  </xsl:template>
  
  <!-- MIN, MAX, ETC... -->
  <xsl:template match="gml:choice | gml:element" mode="showmin">
    <xsl:choose>
      <xsl:when test="not(@min)">
	<xsl:text>1</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="@min"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="gml:choice | gml:element" mode="showmax">
    <xsl:choose>
      <xsl:when test="not(@max)">
	<xsl:text>1</xsl:text>
      </xsl:when>
      <xsl:when test="@max='0'">
	<xsl:value-of select="$value.notdefined" />
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="@max"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="gml:basic_int | gml:basic_float | gml:basic_date | gml:attribute_int | gml:attribute_float | gml:attribute_date" 
		mode="showvmin">
    <xsl:choose>
      <xsl:when test="not(@vmin)">
	<xsl:value-of select="$value.notdefined"/>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="@vmin"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="gml:basic_int | gml:basic_float | gml:basic_date | gml:attribute_int | gml:attribute_float | gml:attribute_date" 
		mode="showvmax">
    <xsl:choose>
      <xsl:when test="not(@vmax)">
	<xsl:value-of select="$value.notdefined"/>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="@max"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="gml:basic_name | gml:basic_text | gml:attribute_name | gml:attribute_text" 
		mode="showlgmin">
    <xsl:choose>
      <xsl:when test="not(@lgmin)">
	<xsl:value-of select="$value.notdefined"/>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="@lgmin"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="gml:basic_name | gml:basic_text | gml:attribute_name | gml:attribute_text" 
		mode="showlgmax">
    <xsl:choose>
      <xsl:when test="not(@lgmax)">
	<xsl:value-of select="$value.notdefined"/>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="@lgmax"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- FULLNAME -->
  <xsl:template match="gml:fullname[@xml:lang=$lang]" >
    <xsl:text> - </xsl:text><xsl:value-of select="text()" />
  </xsl:template>
  
  <!-- DOC -->
  <xsl:template match="gml:doc[@xml:lang=$lang]" >
    <p>
      <xsl:value-of select="text()"/>
    </p>
  </xsl:template>

  <!-- NAME -->
  <xsl:template match="@name" >    
    <code>	  
      <xsl:text>&lt;</xsl:text>
      <xsl:apply-templates select="." mode="html-element-definition"/>
      <xsl:text>&gt;</xsl:text>
    </code>
  </xsl:template>
  <xsl:template match="@name[$links='yes']" mode="html-element-reference">
    <a href="#{.}"><xsl:value-of select="." /></a>
  </xsl:template>
  <xsl:template match="@name[$links='no']" mode="html-element-reference">
    <xsl:value-of select="." />
  </xsl:template>
  <xsl:template match="@name[$links='yes']" mode="html-element-definition">
    <a name="{.}"><xsl:value-of select="." /></a>
  </xsl:template>
  <xsl:template match="@name[$links='no']" mode="html-element-definition">
    <xsl:value-of select="." />
  </xsl:template>

  <!-- DICTIONARIES -->
  <xsl:template match="@ref[$links='yes']" mode="showdict">
    <a href="#{.}"><xsl:value-of select="." /></a>
  </xsl:template>
  <xsl:template match="@ref[$links='no']" mode="showdict">
    <xsl:value-of select="." />
  </xsl:template>
  <xsl:template match="@ref[$links='no']" mode="showkeys">
    <xsl:variable name="ref" select="."/>
    <xsl:for-each select="//gml:dict[@name=$ref]/gml:entry/gml:key">
      <xsl:value-of select="@val"/>
      <xsl:if test="not(position()=last())"><xsl:text> </xsl:text></xsl:if>
    </xsl:for-each>
    <xsl:if test="not(//gml:dict[@name=$ref]/gml:property[@name='gml:standalone'])">
      <xsl:text> ...</xsl:text>
    </xsl:if>
  </xsl:template>
  <xsl:template match="@ref[$links='yes']" mode="showkeys">
    <xsl:variable name="ref" select="."/>
    <xsl:for-each select="//gml:dict[@name=$ref]/gml:entry/gml:key">
      <a href="#{$ref}_{@val}"><xsl:value-of select="@val"/></a>
      <xsl:if test="not(position()=last())"><xsl:text> </xsl:text></xsl:if>
    </xsl:for-each>
    <xsl:if test="not(//gml:dict[@name=$ref]/gml:property[@name='gml:standalone'])">
      <xsl:text> ...</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="gml:dict">
    <h3>
      <xsl:if test="gml:property[@name='gml:standalone']">
	<xsl:value-of select="$title.dictionary"/>
      </xsl:if>
      <xsl:if test="gml:property[@name='gml:service']">
	<xsl:if test="gml:property[@name='gml:standalone']">
	  <xsl:text>/</xsl:text>
	</xsl:if>
	<xsl:value-of select="$title.service"/>
      </xsl:if>
      <xsl:if test="gml:property[@name='gml:external_service']">
	<xsl:if test="gml:property[@name='gml:standalone'] or gml:property[@name='gml:service']">
	  <xsl:text>/</xsl:text>
	</xsl:if>
	<xsl:value-of select="$title.external_service"/>
      </xsl:if>
      <xsl:text> </xsl:text>
      <code><xsl:apply-templates select="@name" mode="html-element-definition"/></code>
      <xsl:apply-templates select="gml:fullname[@xml:lang=$lang]"/>
    </h3>

    <xsl:apply-templates select="gml:doc[@xml:lang=$lang]"/>
    
    <table class="dictionary">
      <tr>
	<th><xsl:value-of select="$title.keys"/></th>
	<th><xsl:value-of select="$title.value"/></th>
	<th><xsl:value-of select="$title.data"/></th>
	<th><xsl:value-of select="$title.doc"/></th>
	<th></th>
      </tr>

      <xsl:for-each select="gml:entry">
	<xsl:apply-templates select="."/>
      </xsl:for-each>

      <xsl:if test="gml:property and not($hideproperty='yes')">
	<tr>
	  <th>
	    <xsl:value-of select="$property.name"/>
	  </th>
	  <th>
	    <xsl:value-of select="$property.value"/>
	  </th>
	  <th>
	    <xsl:value-of select="$property.data"/>
	  </th>
	  <th>
	    <xsl:value-of select="$property.doc"/>
	  </th>
	  <th></th>
	</tr>
	<xsl:for-each select="gml:property">
	  <tr>
	    <xsl:apply-templates select="."/>
	    <td></td>
	  </tr>
	</xsl:for-each>
      </xsl:if>
    </table>
  </xsl:template>

  <xsl:template match="gml:entry">
    <tr>
      <td>
	<xsl:for-each select="gml:key">
	  <xsl:apply-templates select="." mode="html-element-definition"/>
	  <xsl:if test="not(position()=last())">
	    <xsl:text>, </xsl:text>
	  </xsl:if>
	</xsl:for-each>
      </td>
      <td>
	<xsl:for-each select="gml:value">
	  <xsl:value-of select="@val"/>
	  <xsl:if test="@xml:lang">
	    <xsl:text> (lang='</xsl:text>
	    <xsl:value-of select="@xml:lang"/>
	    <xsl:text>')</xsl:text>
	  </xsl:if>
	  <xsl:if test="not(position()=last())">
	    <br/>
	  </xsl:if>
	</xsl:for-each>
      </td>
      <td>
	<xsl:value-of select="gml:value[@xml:lang=$lang]/gml:data"/>
      </td>
      <td>
	<xsl:apply-templates select="gml:doc[@xml:lang=$lang]"/>
      </td>
    </tr>
    <xsl:if test="gml:property and not($hideproperty='yes')">
      <tr>
	<th></th>	
	<th>
	  <xsl:value-of select="$property.name"/>
	</th>
	<th>
	  <xsl:value-of select="$property.value"/>
	</th>
	<th>
	  <xsl:value-of select="$property.data"/>
	</th>
	<th>
	  <xsl:value-of select="$property.doc"/>
	</th>
	</tr>
	<xsl:for-each select="gml:property">
	  <tr>
	    <td></td>	    
	    <xsl:apply-templates select="."/>
	  </tr>
	</xsl:for-each>
      </xsl:if>
  </xsl:template>

  <xsl:template match="gml:key[$links='yes']" mode="html-element-definition">
    <a name="{../../@name}-{@val}"><xsl:value-of select="@val" /></a>
  </xsl:template>
  <xsl:template match="gml:key[$links='no']" mode="html-element-definition">
    <xsl:value-of select="@val" />
  </xsl:template>

</xsl:stylesheet>
