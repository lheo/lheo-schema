<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:gml="http://www.gelaba.org/gml/1.1"
		version="1.0">

  <xsl:param name="gmldef" select="''" />
  <xsl:output  method="html" indent="yes" encoding="utf-8"/>
  
  <xsl:template match="/">
    <xsl:variable name="gmldoc" select="document($gmldef)" />
    <xsl:variable name="defns" select="$gmldoc/gml:definitions/@default_ns_prefix" />
    <xsl:variable name="ns" select="$gmldoc/gml:definitions/gml:namespace[@ns_prefix=$defns]/@href" />
    <xsl:variable name="version" select="$gmldoc/gml:definitions/@version" />
    <div class="tables">
      <p>
	Le fichier XML complet contenant toutes les tables se trouve à l'adresse :
	<a href="http://lheo.org/{$version}/lheo-tables.xml">http://lheo.org/<xsl:value-of select="$version"/>/lheo-tables.xml</a>
      </p>
      <div class="tables-list">
	<h2>Index des tables</h2>
	<ul>
	  <xsl:for-each select="//gml:dict">
	    <li>
	      <a title="{@name}" href="#{@name}">
		<xsl:value-of select="gml:fullname[@xml:lang='fr']"/>
		
		<!--<xsl:if test="@extrait = 'oui'">
		  <xsl:text> (extrait)</xsl:text>
		</xsl:if>-->
	      </a>
	      <xsl:text> (</xsl:text>
	      <code><xsl:value-of select="@name"/></code>
	      <xsl:text>)</xsl:text>
	    </li>
	  </xsl:for-each>
	</ul>
      </div>
      <h2>Contenu des tables</h2>
      <xsl:for-each select="//gml:dict">
	<xsl:apply-templates select="."/>
      </xsl:for-each>
    </div>
  </xsl:template>

  <xsl:template  match="gml:dict">
    <xsl:variable name="gmldoc" select="document($gmldef)" />
    <div class="table">
      <h3>
	<a title="{@name}" name="{@name}">
	  <xsl:value-of select="gml:fullname[@xml:lang='fr']"/>
	</a>
	<xsl:text> [</xsl:text>
	<code><xsl:value-of select="@name"/></code>
	<xsl:text>]</xsl:text>
      </h3>

      <xsl:variable name="name" select="@name"/>
      <xsl:variable name="references"
		    select="$gmldoc//gml:definition[.//gml:basic_key/@ref = $name]"/>
      <xsl:if test="count($references)">
	<p>
	  Élément(s) de LHÉO utilisant cette table :
	  <xsl:for-each select="$references">
	    <code><xsl:text>&lt;</xsl:text><a href="lheo.html#{@name}"><xsl:value-of select="@name"/></a><xsl:text>&gt;</xsl:text></code>
	    <xsl:if test="not(position() = last())">
	      <xsl:text>, </xsl:text>
	    </xsl:if>
	  </xsl:for-each>
	</p>
      </xsl:if>

      <xsl:apply-templates select="gml:doc[@xml:lang='fr']" />
      <table summary="{gml:fullname[@xml:lang='fr']}">
	<thead>
	  <tr>
	    <th align="left">Clé(s)</th>
	    <th align="left">Valeur</th>
	  </tr>
	</thead>
	<tbody>
	  <xsl:apply-templates select="gml:entry"/>
	</tbody>
      </table>
      
    </div>
  </xsl:template>
  
  <xsl:template match="gml:entry">    
    <tr>                
      <td class="cle-table" align="left">
	<xsl:for-each select="gml:key">
	  <code><xsl:value-of select="@val"/></code>
	  <xsl:if test="position() != last()">, </xsl:if>
	</xsl:for-each>
      </td>
      <td class="valeur-table" align="left">
	<xsl:choose>
	  <xsl:when test="gml:property[@name='lheo:url']">
	    <a href="{gml:property[@name='lheo:url']/@value}">
	      <xsl:value-of select="gml:value[@xml:lang='fr']/@val"/>
	    </a>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:value-of select="gml:value[@xml:lang='fr']/@val"/>
	  </xsl:otherwise>
	</xsl:choose>
      </td>
    </tr>
  </xsl:template>

  <xsl:template  match="entree[../@extrait='oui' and position() &gt; 20]">    
  </xsl:template>

  <xsl:template  match="entree[../@extrait='oui' and position() = last()]">    
    <tr>                
      <td class="cle-table" align="center"><pre>...</pre></td>
      <td class="valeur-table" align="center">...</td>
    </tr>
    <tr>                
      <td class="cle-table" align="center"><pre><xsl:value-of select="cle"/></pre></td>
      <td class="valeur-table" align="center"><xsl:value-of select="valeur"/></td>
    </tr>
  </xsl:template>

  <xsl:template match="gml:doc">
    <p>
      <xsl:value-of select="."/>
    </p>
  </xsl:template>

  <xsl:template match="text()" />
</xsl:stylesheet>
