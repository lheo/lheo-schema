<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		xmlns="http://www.w3.org/1999/xhtml"
		xmlns:html="http://www.w3.org/1999/xhtml" 
		xmlns:gml="http://www.gelaba.org/gml/1.1"
		version="1.0">
  
  <xsl:output method="html" indent="yes" encoding="utf-8"/>

  <xsl:param name="urlglossaire" select="''"/>

  <!--
      <xsl:param name="urldtd" select="'/dtd.html'"/>
      <xsl:param name="urlxsd" select="'/xsd.html'"/>
  -->
  <!--<xsl:param name="fichiertables" select="'tables.xml'"/>-->

  <xsl:param name="fichierglossaire" select="''"/>
  <xsl:param name="mode" select="'tables'"/>
  
  <!--<xsl:variable name="doctables" select="document($fichiertables)"/>-->

  <xsl:variable name="docglossaire" select="document($fichierglossaire)"/>
  
  <xsl:template match="/">
		<xsl:variable name="urlversion">
			<xsl:value-of select="gml:definitions/gml:property[@name='glb:baseurl']/@value" />
			<xsl:text>/</xsl:text>
			<xsl:value-of select="gml:definitions/@version" />
		</xsl:variable>
    <xsl:variable name="defns" select="gml:definitions/@default_ns_prefix" />
    <xsl:variable name="ns" select="gml:definitions/gml:namespace[@ns_prefix=$defns]/@href" />
    <div class="elements">
      <h1>
	<xsl:value-of select="gml:definitions/gml:property[@name='lheo:longversion']/@value"/>
      </h1>
      
      <table>
	<tr>
	  <td class="title">FPI</td>	    
	  <td>
	    <code>
	      <xsl:value-of select="gml:definitions/gml:property[@name='glb:FPI']/@value"/>
	    </code>
	  </td>
	</tr>
	<tr>
	  <td class="title">URL de base de la version</td>
	  <td>
	    <code><a href="{gml:definitions/@version}"><xsl:value-of select="$urlversion" /></a></code>
	  </td>
	</tr>
	<tr>
	  <td class="title">XMLNS</td>
	  <td>
	    <code><xsl:value-of select="$ns" /></code>
	  </td>
	</tr>
	<tr>
	  <td class="title">DTD</td>
	  <td>
	    <code><a href="{gml:definitions/@version}/lheo.dtd">lheo.dtd</a></code>
	  </td>
	</tr>
	<tr>
	  <td class="title">XSD</td>
	  <td>
	    <code><a href="{gml:definitions/@version}/lheo.xsd">lheo.xsd</a></code>
	  </td>
	</tr>
      </table>

      <p>
	Nous présentons ci-dessous la liste les éléments XML du
	langage LHÉO. Lorsque l'élément contient une séquence
	ordonnée, chaque élément de la séquence est précédé par un
	intervalle donnant le nombre minimal et maximal de répétitions
	successives d'un élément. Par exemple [0,1] signifie que
	l'élément est optionnel (nombre minimal d'éléments à 0 et
	maximal à 1). [1,1] signifie que l'élément est obligatoire,
	[0,3] qu'il peut être répété de 0 à 3 fois. Quand le nombre de
	répétition n'est pas borné, on utilise la lettre N pour
	signifier que l'élément peut être répété un nombre arbitraire
	de fois. Ainsi, [1,N] signifie que l'élément peut être répété
	autant de fois qu'on le désire.
      </p>

      <div>
	<h2>Attributs</h2>
	<p>
	  Tous les éléments composant le langage XML LHÉO possèdent
	  des attributs XML identiques. Ces attributs sont les
	  suivants, ici exprimés avec le formalisme DTD :
	</p>
	<pre>xmlns CDATA #FIXED '<xsl:value-of select="$ns" />'
numero  CDATA #IMPLIED
info  CDATA #IMPLIED
ref  CDATA #IMPLIED
id  ID #IMPLIED
idref  IDREF #IMPLIED
tag  CDATA #IMPLIED</pre>
      </div>
      <div class="elements-index">
	<h2>Éléments du premier cercle d'informations</h2>
	<div class="table">
	  <table>
	    <tr>
	      <th>
		<xsl:text>Nom de l'élément</xsl:text>
	      </th>
	      <th>
		<xsl:text>Balise XML</xsl:text>
	      </th>
	    </tr>
	    <xsl:for-each select="//gml:definition[gml:property[@name='lheo:cercle']/@value='1']">
	      <!--<xsl:sort select="motcle"/>-->
	      <tr>
		<td>
		<a href="#{@name}" title="{@name}">
		  <xsl:value-of select="gml:fullname[@xml:lang='fr']/text()"/>
		</a>
	      </td>
	      <td>
		<code>
		  <xsl:text>&lt;</xsl:text>
		  <xsl:value-of select="@name"/>
		  <xsl:text>&gt;</xsl:text>
		</code>
	      </td>
	    </tr>
	  </xsl:for-each>
	</table>
      </div>

      <h2>Éléments du deuxième cercle d'informations</h2>
      <div class="table">
	<table>
	  <tr>
	    <th>
	      <xsl:text>Nom de l'élément</xsl:text>
	    </th>
	    <th>
	      <xsl:text>Balise XML</xsl:text>
	    </th>
	  </tr>
	  <xsl:for-each select="//gml:definition[gml:property[@name='lheo:cercle']/@value='2']">
	    <!--<xsl:sort select="motcle"/>-->
	    <tr>
	      <td>
		<a href="#{@name}" title="{@name}">
		  <xsl:value-of select="gml:fullname[@xml:lang='fr']/text()"/>
		</a>
	      </td>
	      <td>
		<code>
		  <xsl:text>&lt;</xsl:text>
		  <xsl:value-of select="@name"/>
		  <xsl:text>&gt;</xsl:text>
		</code>
	      </td>
	    </tr>
	  </xsl:for-each>
	</table>
      </div>

      <h2>Éléments du troisième cercle d'informations (extensions)</h2>
      <div class="table">
	<table>
	  <tr>
	    <th>
	      <xsl:text>Nom de l'élément</xsl:text>
	    </th>
	    <th>
	      <xsl:text>Balise XML</xsl:text>
	    </th>
	  </tr>
	  <xsl:for-each select="//gml:definition[gml:property[@name='lheo:cercle']/@value='3']">
	    <!--<xsl:sort select="motcle"/>-->
	    <tr>
	      <td>
		<a href="#{@name}" title="{@name}">
		  <xsl:value-of select="gml:fullname[@xml:lang='fr']/text()"/>
		</a>
	      </td>
	      <td>
		<code>
		  <xsl:text>&lt;</xsl:text>
		  <xsl:value-of select="@name"/>
		  <xsl:text>&gt;</xsl:text>
		</code>
	      </td>
	    </tr>
	  </xsl:for-each>
	</table>
      </div>


      <h2>Éléments structurants et types de base de LHÉO</h2>
      <div class="table">
	<table>
	  <tr>
	    <th>
	      <xsl:text>Nom de l'élément</xsl:text>
	    </th>
	    <th>
	      <xsl:text>Balise XML</xsl:text>
	    </th>
	  </tr>
	  <xsl:for-each select="//gml:definition[not(gml:property[@name='lheo:cercle'])
				and not(gml:property[@name='lheo:extension'])]">
	    <!--<xsl:sort select="motcle"/>-->
	    <tr>
	      <td>
		<a href="#{@name}" title="{@name}">
		  <xsl:value-of select="gml:fullname[@xml:lang='fr']/text()"/>
		</a>
	      </td>
	      <td>
		<code>
		  <xsl:text>&lt;</xsl:text>
		  <xsl:value-of select="@name"/>
		  <xsl:text>&gt;</xsl:text>
		</code>
	      </td>
	    </tr>
	  </xsl:for-each>
	</table>
      </div>

    <div class="elements-details">	
      <h2>Détail des éléments</h2>
      <xsl:apply-templates select="//gml:definition[gml:property[@name='lheo:cercle']/@value='1']"/>
      <xsl:apply-templates select="//gml:definition[gml:property[@name='lheo:cercle']/@value='2']"/>
      <xsl:apply-templates select="//gml:definition[gml:property[@name='lheo:cercle']/@value='3']"/>
      <xsl:apply-templates select="//gml:definition[not(gml:property[@name='lheo:cercle'])
				   and not(gml:property[@name='lheo:extension'])]" />
      
    </div>
      </div>
    </div>
  </xsl:template>
  
  <xsl:template match="gml:definition">
    <div class="description-element">
      <a name="{@name}" />
      <table class="table-element">
	<tr>
	  <td>
	    <code><xsl:text>&lt;</xsl:text><xsl:value-of select="@name"/><xsl:text>&gt;</xsl:text></code><xsl:text> </xsl:text>
	    <b><xsl:apply-templates select="gml:fullname[@xml:lang='fr']"/></b>
	    <!--<xsl:text> [</xsl:text><a href="{$urldtd}#{motcle}">DTD</a><xsl:text>]</xsl:text>
	    <xsl:text> [</xsl:text><a href="{$urlxsd}#{motcle}">XSD</a><xsl:text>]</xsl:text>-->
	    <!--
	  </td>
	</tr>
	<tr class="titre"> 
	  <td>
	    <b>Type de contenu</b>
	  </td>
	</tr>
	<tr>
	  <td>-->
	    <br/>
	    <xsl:text>Contient </xsl:text>
	    <xsl:apply-templates select="." mode="affiche-type"/>
	  </td>
	</tr>

	<xsl:if test="gml:doc[@xml:lang='fr']">
	  <tr class="titre">
	    <td>
	      <b>Description de l'élément</b>
	    </td>
	  </tr>
	  <tr>
	    <td>
	      <xsl:apply-templates select="gml:doc[@xml:lang='fr']"/>
	    </td>
	  </tr>
	</xsl:if>

	<xsl:apply-templates select="gml:property[@name='lheo:glossaire']" />

	<!--<xsl:apply-templates select="exemple-contenu"/>-->
	<xsl:variable name="name" select="@name"/>
	<xsl:variable name="references"
		      select="//gml:definition[.//gml:element/@name = $name and not(gml:property[@name='lheo:extension'])] |
		              //gml:definition[.//gml:choice_element/@name = $name and not(gml:property[@name='lheo:extension'])]"/>
	<xsl:if test="count($references)">
	  <tr class="titre">
	    <td>
	      <b>Utilisé dans </b>
	    </td>
	  </tr>
	  <tr>
	    <td>
	      <xsl:for-each select="$references">
		<code><xsl:text>&lt;</xsl:text><a href="#{@name}"><xsl:value-of select="@name"/></a><xsl:text>&gt;</xsl:text></code>
		<xsl:if test="not(position() = last())">
		  <xsl:text>, </xsl:text>
		</xsl:if>
	      </xsl:for-each>
	    </td>
	  </tr>
	</xsl:if>
      </table>
    </div>
    <br/>
  </xsl:template>
  
  <xsl:template match="gml:property[@name='lheo:glossaire']">
    <tr>
      <td>
	<xsl:variable name="cur" select="@value"/>
	<xsl:text>Définition dans le glossaire : </xsl:text>
	<a href="{$urlglossaire}#{@value}">
	  <xsl:value-of 
	      select="$docglossaire//html:div[@class='entree'][@id=$cur]/html:h3/html:a"/>
	</a>
      </td>
    </tr>    
  </xsl:template>
  
  <xsl:template match="exemple-contenu">
    <tr class="titre">
      <td>
	<b>Exemple d'élément</b>
      </td>
    </tr>
    <tr>
      <td>
	<code><xsl:text>&lt;</xsl:text><xsl:value-of select="../motcle"/><xsl:text>&gt;</xsl:text></code>
	<xsl:value-of select="text()"/>
	<code><xsl:text>&lt;/</xsl:text><xsl:value-of select="../motcle"/><xsl:text>&gt;</xsl:text></code>		
      </td>
    </tr>
  </xsl:template>
    

  <xsl:template match="gml:definition[gml:element_type/gml:basic_key]" mode="affiche-type">
    <xsl:variable name="ref" select="gml:element_type/gml:basic_key/@ref"/>
    <xsl:text>une clé alphanumérique issue de la table </xsl:text>
    <a href="{$urltables}#{$ref}">
      <xsl:value-of select="//gml:dict[@name=$ref]/gml:fullname[@xml:lang='fr']" />
    </a><xsl:text>.</xsl:text>
  </xsl:template>

  <xsl:template match="gml:definition[gml:element_type/gml:basic_text]" mode="affiche-type">
    <xsl:variable name="cur" select="gml:element_type/gml:basic_text"/>
    <xsl:text>un texte de </xsl:text>
    <xsl:value-of select="$cur/@lgmin" />
    <xsl:text> à </xsl:text>
    <xsl:value-of select="$cur/@lgmax" />
    <xsl:text> caractères alphanumériques.</xsl:text>
  </xsl:template>

  <xsl:template match="gml:definition[gml:element_type/gml:basic_date]" mode="affiche-type">
    <xsl:text>une date au format ISO </xsl:text>
    <code>AAAAMMJJ</code>
    <xsl:text>. Utiliser </xsl:text>
    <code>AAAAMM00</code>
    <xsl:text> pour indiquer un mois, </xsl:text>
    <code>AAAA0000</code>
    <xsl:text> pour indiquer une année et </xsl:text>
    <code>00000000</code>
    <xsl:text> (valeur minimale) ou </xsl:text>
    <code>99999999</code>
    <xsl:text> (valeur maximale) pour indiquer une date inconnue.</xsl:text>
  </xsl:template>

  <xsl:template match="gml:definition[gml:element_type/gml:basic_int]" mode="affiche-type">
    <xsl:variable name="cur" select="gml:element_type/gml:basic_int"/>
    <xsl:text>un entier compris entre </xsl:text>
    <xsl:value-of select="$cur/@vmin" />
    <xsl:text> et </xsl:text>
    <xsl:value-of select="$cur/@vmax" />
    <xsl:text>.</xsl:text>
  </xsl:template>

  <xsl:template match="gml:definition[gml:element_type/gml:basic_data]" mode="affiche-type">
    <xsl:text>des caractères alphanumériques.</xsl:text>
  </xsl:template>

  <xsl:template match="gml:definition[gml:element_type/gml:sequence]" mode="affiche-type">
    <xsl:text>une séquence ordonnée des éléments :</xsl:text>
    <xsl:apply-templates select="gml:element_type/gml:sequence"/>
  </xsl:template>

  <xsl:template match="gml:definition[gml:element_type/gml:choice]" mode="affiche-type">
    <xsl:text>une séquence de </xsl:text>
    <xsl:value-of select="gml:element_type/gml:choice/@min" />
    <xsl:text> à </xsl:text>
    <xsl:apply-templates select="gml:element_type/gml:choice/@max" />
    <xsl:text> éléments choisi(s) parmi :</xsl:text>
    <xsl:apply-templates select="gml:element_type/gml:choice"/>
  </xsl:template>

  <xsl:template match="gml:definition" mode="affiche-type">
    <xsl:variable name="cur" select="."/>
    <xsl:text>INCONNU</xsl:text>
  </xsl:template>

  <xsl:template match="@max">
    <xsl:choose>
      <xsl:when test=". = 0">
	<xsl:text>N</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="." />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="gml:sequence">
    <ul>
      <xsl:apply-templates select="gml:element"/>
    </ul>
  </xsl:template>

  <xsl:template match="gml:choice">
    <ul>
      <xsl:apply-templates select="gml:choice_element"/>
    </ul>
  </xsl:template>
  
  <xsl:template name="affiche-libelle">
    <xsl:param name="ident" select="''"/>
    <xsl:variable name="value" select="//gml:definition[@name=$ident]/gml:fullname[@xml:lang='fr']"/>
    <xsl:choose>
      <xsl:when test="string-length($value) &gt; 0">
	<xsl:value-of select="$value"/>
      </xsl:when>
      <xsl:otherwise>
	<xsl:text>PAS TROUVE</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="gml:element">
    <xsl:variable name="cur" select="."/>
    <li>
      <xsl:choose>
	<xsl:when test="@min=1 and @max=1" />
	<xsl:when test="@min and @max">
	  <xsl:text>[</xsl:text>
	  <xsl:value-of select="@min" />
	  <xsl:text>,</xsl:text>
	  <xsl:choose>
	    <xsl:when test="@max=0">
	      <xsl:text>N</xsl:text>
	    </xsl:when>
	    <xsl:otherwise>
	      <xsl:value-of select="@max" />
	    </xsl:otherwise>
	  </xsl:choose>
	  <xsl:text>] </xsl:text>
	</xsl:when>
      </xsl:choose>
      <code><xsl:text>&lt;</xsl:text><xsl:value-of select="@name"/><xsl:text>&gt;</xsl:text></code>
      <xsl:text> </xsl:text>
      <a href="#{@name}">
	<xsl:call-template name="affiche-libelle">
	  <xsl:with-param name="ident" select="string(@name)"/>
	</xsl:call-template>
      </a>
    </li>
  </xsl:template>

  <xsl:template match="gml:choice_element">
    <xsl:variable name="cur" select="."/>
    <li>
      <code><xsl:text>&lt;</xsl:text><xsl:value-of select="@name"/><xsl:text>&gt;</xsl:text></code>
      <xsl:text> </xsl:text>
      <a href="#{@name}">
	<xsl:call-template name="affiche-libelle">
	  <xsl:with-param name="ident" select="string(@name)"/>
	</xsl:call-template>
      </a>
    </li>
  </xsl:template>

  <!--
      
      Affichage de la structure

  -->

  <xsl:template name="print_lt">
    <xsl:text>&lt;</xsl:text>
  </xsl:template>
  
  <xsl:template name="print_gt">
    <xsl:text>&gt;</xsl:text>
  </xsl:template>

</xsl:stylesheet>
