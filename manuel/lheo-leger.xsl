<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		xmlns:gml="http://www.gelaba.org/gml/1.1"
		xmlns:html="http://www.w3.org/1999/xhtml"
		xmlns:lheo="http://www.lheo.org/1.3.0"
		version="1.0">

  <xsl:output method="text" encoding="utf-8" />

  <xsl:variable name="revision_language" select="//gml:property[@name='svn:Rev']/@value" />
  
  <xsl:template match="/">
    <xsl:text>\section{Le format XML LHÉO-Léger}&#10;</xsl:text>

    <xsl:apply-templates select="//gml:definition[gml:property[@name='lheo:extension']/@value='lheo-leger']" 
			 mode="element" />

    <xsl:text>\begin{verbatim}&#10;</xsl:text>
    <xsl:text>&lt;adresse&gt;&#10;</xsl:text>
    <xsl:text>  &lt;ligne&gt;...&lt;/ligne&gt;&#10;</xsl:text>
    <xsl:text>  ...&#10;</xsl:text>
    <xsl:text>  &lt;extras info="geolocalisation"&gt;&#10;</xsl:text>
    <xsl:text>    &lt;extra info="latitude"&gt;45.804363&lt;/extra&gt;&#10;</xsl:text>
    <xsl:text>    &lt;extra info="longitude"&gt;4.887452&lt;/extra&gt;&#10;</xsl:text>
    <xsl:text>  &lt;/extras&gt;&#10;</xsl:text>
    <xsl:text>&lt;/adresse&gt;&#10;</xsl:text>
    <xsl:text>\end{verbatim}&#10;</xsl:text>
    <xsl:text>&#10;&#10;</xsl:text>

    <xsl:text>
      Les attributs \texttt{info} ne sont pas obligatoires mais ils
      permettent d'identifier une information. Il est important de
      noter que les valeurs d'attribut \texttt{geolocalisation},
      \texttt{latitude} et \texttt{longitude} sont des valeurs
      arbitraires, non normalisées. Une application traitant des
      documents au format XML LHÉO peut ignorer totalement ces
      données. Elles n'ont de sens que pour une application ou le
      traitement des informations de géolocalisation à ce format aura
      été prévu.
    </xsl:text>
    <xsl:text>&#10;&#10;</xsl:text>
    
    <xsl:text>
      Les possibilités d'utilisation sont nombreuses. Un autre exemple
      pourrait être d'ajouter le potentiel d'un organisme de formation grâce
      à une liste de codes FORMACODE:
    </xsl:text>
    <xsl:text>&#10;&#10;</xsl:text>

    <xsl:text>\begin{verbatim}&#10;</xsl:text>
    <xsl:text>&lt;organisme-formation-responsable&gt;&#10;</xsl:text>
    <xsl:text>  &lt;numero-activite&gt;...&lt;/numero-activite&gt;&#10;</xsl:text>
    <xsl:text>  ...&#10;</xsl:text>
    <xsl:text>  &lt;extras info="potentiel"&gt;&#10;</xsl:text>
    <xsl:text>    &lt;extra&gt;31006&lt;/extra&gt;&#10;</xsl:text>
    <xsl:text>    &lt;extra&gt;31020&lt;/extra&gt;&#10;</xsl:text>
    <xsl:text>    &lt;extra&gt;31021&lt;/extra&gt;&#10;</xsl:text>
    <xsl:text>  &lt;/extras&gt;&#10;</xsl:text>
    <xsl:text>&lt;/organisme-formation-responsable&gt;&#10;</xsl:text>
    <xsl:text>\end{verbatim}&#10;</xsl:text>
    <xsl:text>&#10;&#10;</xsl:text>

    <xsl:apply-templates select="//gml:definition[gml:property[@name='lheo:cercle']/@value='3']" 
			 mode="element" />

    <xsl:text>\subsection{Éléments structurants et types de base}&#10;</xsl:text>    
    <xsl:apply-templates select="//gml:definition[not(gml:property[@name='lheo:cercle'])
				 and not(gml:property[@name='lheo:extension']) 
				 and (gml:element_type/gml:sequence)]" mode="element" />

    <xsl:apply-templates select="//gml:definition[not(gml:property[@name='lheo:cercle'])
				 and not(gml:property[@name='lheo:extension']) 
				 and not(gml:element_type/gml:sequence)]" mode="element" />

    <xsl:text>\section{Tables}&#10;</xsl:text>

    <!--TODO: bafouille-->

    <xsl:text>Les tables sont disponibles dans un fichier XML qui se trouve à l'URL:\\&#10;</xsl:text>
    <xsl:text>\url{</xsl:text>
    <xsl:value-of select="//gml:namespace[@ns_prefix='lheo']/@href" />
    <xsl:text>/tables.xml}.&#10;&#10;</xsl:text>
    
    <!--
    <xsl:text>Le format XML est relativement simplea DTD du format XML utilisé pour représenter les tables se trouve à l'URL:\\&#10;</xsl:text>
    <xsl:text>\url{</xsl:text>
    <xsl:value-of select="//gml:namespace[@ns_prefix='lheo']/@href" />
    <xsl:text>/doc/gml.dtd}.</xsl:text>
    -->

    <xsl:apply-templates select="//gml:dict" mode="dict" />

    <!--
    <xsl:text>\section{Services}&#10;</xsl:text>
    TODO
    -->

    <xsl:text>\section{Le format XML LHÉO-Léger}&#10;</xsl:text>

    <xsl:text>\input{manuel-lheo-leger.tex}&#10;</xsl:text>

    <xsl:apply-templates select="//gml:definition[not(gml:property[@name='lheo:cercle'])
				 and gml:property[@name='lheo:extension' and @value='lheo-leger']]" 
			 mode="element">
      <xsl:with-param name="section_name" select="'subsection'" />
    </xsl:apply-templates>

    <xsl:text>\appendix</xsl:text>

    <xsl:apply-templates select="$docglossaire/html:html/html:body" />

    <!--
	TODO: bafouille
	<xsl:text>\section{Extension: LHÉO-Plus}&#10;</xsl:text>    
    -->
    <!--
	<xsl:apply-templates select="//gml:definition[not(gml:property[@name='lheo:cercle'])
	and gml:property[@name='lheo:extension' and @value='lheo-plus']]" 
	mode="element">
	<xsl:with-param name="section_name" select="'subsection'" />
	</xsl:apply-templates>
    -->

    <!--<xsl:call-template name="outils-validation" />-->

    <xsl:text>\newpage</xsl:text>
    <xsl:text>\section{Exemple de fichier LHÉO contenant une offre}&#10;</xsl:text>
    <xsl:text>\label{exemple:lheo}&#10;</xsl:text>

    <xsl:text>\noindent Ce fichier XML se trouve à l'URL:\\&#10;</xsl:text>
    <xsl:text>\url{</xsl:text>
    <xsl:value-of select="//gml:namespace[@ns_prefix='lheo']/@href" />
    <xsl:text>/lheo-exemple.xml}.&#10;&#10;</xsl:text>

    <xsl:text>\fvset{fontsize=\scriptsize}&#10;</xsl:text>
    <xsl:text>\VerbatimInput{../target/1.3.0/lheo-exemple.xml}&#10;</xsl:text>

   <xsl:text>\newpage</xsl:text>
    <xsl:text>\section{Exemple de fichier LHÉO-Léger contenant le résume d'une offre}&#10;</xsl:text>
    <xsl:text>\label{exemple:lheo-leger}&#10;</xsl:text>

    <xsl:text>\noindent Ce fichier XML se trouve à l'URL:\\&#10;</xsl:text>
    <xsl:text>\url{</xsl:text>
    <xsl:value-of select="//gml:namespace[@ns_prefix='lheo']/@href" />
    <xsl:text>/lheo-leger-exemple.xml}.&#10;&#10;</xsl:text>

    <xsl:text>\fvset{fontsize=\scriptsize}&#10;</xsl:text>
    <xsl:text>\VerbatimInput{../target/1.3.0/lheo-leger-exemple.xml}&#10;</xsl:text>

    <!--<xsl:text>{\small&#10;</xsl:text>
    <xsl:text>\listinginput[5]{10}{../target/1.3.0/lheo-exemple.xml}</xsl:text>
    <xsl:text>}&#10;</xsl:text>-->
    
    <xsl:text>\newpage</xsl:text>
    <xsl:text>\section{Table synthétique des types de base de LHÉO}&#10;</xsl:text>
    <xsl:text>{\small\noindent\begin{longtable}{|l|l|l|}&#10;</xsl:text>
    <xsl:text>\hline</xsl:text>
    <xsl:text>\multicolumn{3}{|c|}{\textbf{Table synthétique des types de base de LHÉO}}\\\hline</xsl:text>
    <xsl:text>\textbf{élément} &amp; \textbf{type} &amp; \textbf{voir}\\\hline\hline&#10;</xsl:text>
    <xsl:text>\endfirsthead&#10;</xsl:text>
    <xsl:text>\hline</xsl:text>
    <xsl:text>\multicolumn{3}{|c|}{\textbf{Table synthétique des types de base de LHÉO (suite)}}\\\hline</xsl:text>
    <xsl:text>\textbf{élément} &amp; \textbf{type} &amp; \textbf{voir}\\\hline\hline&#10;</xsl:text>
    <xsl:text>\endhead&#10;</xsl:text>    
    <xsl:text>\hline \multicolumn{3}{r}{\emph{Suite page suivante}} \\&#10;</xsl:text>
    <xsl:text>\endfoot&#10;</xsl:text>
    <xsl:text>\hline&#10;</xsl:text>
    <xsl:text>\endlastfoot&#10;</xsl:text>
    <xsl:apply-templates select="//gml:definition[not(.//gml:sequence) 
				 and not(.//gml:choice) and not (.//gml:empty)]" 
			 mode="synthesebasic">
      <xsl:sort select="@name" />
    </xsl:apply-templates>
    <xsl:text>\hline\end{longtable}}</xsl:text>

    <xsl:text>
      \twocolumn
      \printindex
    </xsl:text>

    <xsl:text>\end{document}&#10;</xsl:text>
  </xsl:template>

  <xsl:template match="gml:definition" mode="element">
    <xsl:param name="section_name" select="'subsubsection'" />
    <xsl:apply-templates select="." mode="section">
      <xsl:with-param name="section_name" select="$section_name" />
    </xsl:apply-templates>
    <xsl:apply-templates select="." mode="tableau" />
    <xsl:apply-templates select="." mode="attributs" />        
    <xsl:apply-templates select="." mode="utilisations" />        
    <xsl:apply-templates select="." mode="glossaire" />        
    <xsl:apply-templates select="." mode="custom" />    
  </xsl:template>

  <xsl:template match="gml:definition" mode="glossaire">
    <xsl:variable name="value" select="gml:property[@name='lheo:glossaire']/@value" />
    <xsl:if test="$value">
      <xsl:text>\begin{flushleft}&#10;</xsl:text>
      <xsl:text>Voir dans le glossaire </xsl:text>
      <xsl:text>\textit{</xsl:text>
      <xsl:value-of select="$docglossaire//html:h3[@class='terme' and html:a[@name=$value]]/html:a"/>
      <xsl:text>} (\rappel{glossaire:</xsl:text>
      <xsl:value-of select="$value"/>
      <xsl:text>})</xsl:text>
      <xsl:text>\end{flushleft}&#10;</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="gml:definition" mode="utilisations">
    <xsl:variable name="name" select="@name"/>
    <xsl:variable name="references"
		  select="//gml:definition[.//gml:element/@name = $name and 
			  not(gml:property[@name='lheo:extension'])] |
			  //gml:definition[.//gml:choice_element/@name = $name and 
			  not(gml:property[@name='lheo:extension'])]"/>
    <xsl:if test="count($references)">
      <xsl:text>\begin{flushleft}&#10;</xsl:text>
      <xsl:text>Utilisé dans </xsl:text>
      <xsl:for-each select="$references">
	<xsl:text>\texttt{&lt;</xsl:text>
	<xsl:value-of select="@name"/>
	<xsl:text>&gt;} (\rappel{element:</xsl:text>
	<xsl:value-of select="@name"/>
	<xsl:text>})</xsl:text>
	<xsl:if test="not(position() = last())">
	  <xsl:text>, </xsl:text>
	</xsl:if>
	<xsl:if test="position() = last()">
	  <xsl:text>.</xsl:text>
	</xsl:if>
      </xsl:for-each>
      <xsl:text>\end{flushleft}&#10;</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="gml:definition" mode="section">
    <xsl:param name="section_name" select="'subsubsection'" />
    <xsl:text>\</xsl:text>
    <xsl:value-of select="$section_name" />
    <xsl:text>{\texttt{&lt;</xsl:text>
    <xsl:value-of select="@name" />
    <xsl:text>&gt;}}</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>\label{element:</xsl:text>
    <xsl:value-of select="@name" />
    <xsl:text>}</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>\index{Éléments!</xsl:text>
    <xsl:text>\texttt{&lt;</xsl:text>
    <xsl:value-of select="@name" />
    <xsl:text>&gt;}</xsl:text>
    <xsl:if test="gml:property[@name='lheo:cercle']">
      <xsl:text> (cercle </xsl:text>
      <xsl:value-of select="gml:property[@name='lheo:cercle']/@value" />
      <xsl:text>)</xsl:text>
    </xsl:if>
    <xsl:text>}</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>

  <xsl:template match="gml:definition" mode="example">
    <xsl:variable name="elementname">
      <xsl:value-of select="@name"/>
    </xsl:variable>
    
    <xsl:text>{\small\begin{alltt}</xsl:text>
    <xsl:text>&#10;</xsl:text>

    <!-- BALISE ouvrante -->
    <xsl:text>&lt;\textbf{</xsl:text>
    <xsl:value-of select="$elementname" />
    <xsl:text>}&gt;</xsl:text>

    <!-- CONTENU -->
    <xsl:choose>
      <xsl:when test="gml:element_type/gml:sequence">
	<xsl:for-each select="gml:element_type/gml:sequence/gml:element">
	  <xsl:call-template name="elementexample">
	    <xsl:with-param name="name" select="@name" />
	  </xsl:call-template>
	  <xsl:text>[</xsl:text>
	  <xsl:choose>
	    <xsl:when test="not(@min)">
	      <xsl:text>1</xsl:text>
	    </xsl:when>
	    <xsl:otherwise>
	      <xsl:value-of select="@min" />
	    </xsl:otherwise>
	  </xsl:choose>
	  <xsl:text>,</xsl:text>
	  <xsl:choose>
	    <xsl:when test="not(@max)">
	      <xsl:text>1</xsl:text>
	    </xsl:when>
	    <xsl:when test="@max='0'">
	      <xsl:text>N</xsl:text>
	    </xsl:when>
	    <xsl:otherwise>
	      <xsl:value-of select="@max" />
	    </xsl:otherwise>
	  </xsl:choose>
	  <xsl:text>]</xsl:text>	  
	</xsl:for-each>
	<xsl:text>&#10;</xsl:text>
      </xsl:when>      
      <xsl:when test="gml:property[@name='glb:example']">
	<xsl:text>&#10;</xsl:text>
	<xsl:value-of select="gml:property[@name='glb:example'][1]/@value" />
	<xsl:text>&#10;</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:text>&#10;</xsl:text>
	<xsl:text>...</xsl:text>
	<xsl:text>&#10;</xsl:text>
      </xsl:otherwise>
    </xsl:choose>

    <!-- BALISE fermante -->
    <xsl:text>&lt;/\textbf{</xsl:text>
    <xsl:value-of select="$elementname" />
    <xsl:text>}&gt;</xsl:text>
    <xsl:text>&#10;</xsl:text>

    <xsl:text>\end{alltt}}</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>

  <xsl:template match="gml:definition[gml:attribute]" mode="attributs">
    <xsl:variable name="defns" select="//gml:definitions/@default_ns_prefix" />
    <xsl:variable name="ns" select="//gml:definitions/gml:namespace[@ns_prefix=$defns]/@href" />
    <xsl:text>\begin{tabular}{|l|l|l|}\hline&#10;</xsl:text>
    <xsl:text>\multicolumn{3}{|p{.95\textwidth}|}{\textbf{Attributs}} \\\hline&#10;</xsl:text>
    <xsl:text>nom d'attribut &amp; type &amp; type de données\\\hline&#10;</xsl:text>
    <xsl:if test="string-length($ns)&gt;0">
      <xsl:text>\texttt{xmlns} &amp; fixe &amp; </xsl:text>
      <xsl:text>\texttt{"}\url{</xsl:text>
      <xsl:value-of select="$ns" />
      <xsl:text>}\texttt{"}\\&#10;</xsl:text>
    </xsl:if>
    <xsl:apply-templates select="gml:attribute" />
    <xsl:text>\hline\end{tabular}&#10;</xsl:text>    
  </xsl:template>
  <xsl:template match="gml:definition" mode="attributs" />

  <xsl:template match="gml:attribute">
    <xsl:text>\texttt{</xsl:text>
    <xsl:value-of select="@name" />
    <xsl:text>}</xsl:text>
    <xsl:text>&amp;</xsl:text>
    <xsl:choose>
      <xsl:when test="@type='optional'">
	<xsl:text>optionnel</xsl:text>
      </xsl:when>
      <xsl:when test="@type='required'">
	<xsl:text>obligatoire</xsl:text>
      </xsl:when>
      <xsl:when test="@type='fixed'">
	<xsl:text>fixe</xsl:text>
      </xsl:when>
      <xsl:when test="@type='default'">
	<xsl:text>défaut</xsl:text>
      </xsl:when>
    </xsl:choose>
    <xsl:text>&amp;</xsl:text>
    <xsl:if test="@value">
      <xsl:text>\texttt{"</xsl:text>
      <xsl:value-of select="@value" />
      <xsl:text>"} </xsl:text>
    </xsl:if>
    <xsl:apply-templates select="gml:attribute_type/*" />
    <xsl:text>\\&#10;</xsl:text>
  </xsl:template>

  <xsl:template match="gml:definition" mode="tableau">
    <xsl:if test="gml:fullname[@xml:lang='fr']">
      <xsl:text>\begin{flushleft}&#10;</xsl:text>
      <xsl:text>\textbf{</xsl:text>
      <xsl:value-of select="gml:fullname"/>
      <xsl:text>.} </xsl:text>
      <xsl:value-of select="gml:doc[@xml:lang='fr']" />
      <xsl:text>&#10;</xsl:text>
      <xsl:text>\end{flushleft}&#10;</xsl:text>
    </xsl:if>

    <xsl:text>\begin{flushleft}&#10;</xsl:text>
    <xsl:choose>
      <xsl:when test="gml:element_type/gml:sequence">
	<xsl:text>\begin{tabular}{|l|c|c|l|}\hline&#10;</xsl:text>
	<xsl:text>\multicolumn{4}{|p{.95\textwidth}|}{\textbf{\texttt{&lt;</xsl:text>
	<xsl:value-of select="@name" />	
	<xsl:text>&gt;}}</xsl:text>
	<xsl:if test="gml:property[@name='lheo:cercle']">
	  <xsl:text> (cercle </xsl:text>
	  <xsl:value-of select="gml:property[@name='lheo:cercle']/@value" />
	  <xsl:text>)</xsl:text>
	</xsl:if>
	<xsl:text>}</xsl:text>
	<xsl:text>\\\hline&#10;</xsl:text>
	<xsl:text>séquence ordonnée des éléments &amp; répétition min &amp; répétition max &amp; voir \\\hline&#10;</xsl:text>
	<xsl:for-each select="gml:element_type/gml:sequence/gml:element">
	  <xsl:text>\texttt{&lt;</xsl:text>
	  <xsl:value-of select="@name"/>
	  <xsl:text>&gt;}</xsl:text>
	  <xsl:text>&amp;</xsl:text>
	  <xsl:choose>
	    <xsl:when test="not(@min)">
	      <xsl:text>1</xsl:text>
	    </xsl:when>
	    <xsl:otherwise>
	      <xsl:value-of select="@min" />
	    </xsl:otherwise>
	  </xsl:choose>
	  <xsl:text>&amp;</xsl:text>
	  <xsl:choose>
	    <xsl:when test="not(@max)">
	      <xsl:text>1</xsl:text>
	    </xsl:when>
	    <xsl:when test="@max='0'">
	      <xsl:text>N</xsl:text>
	    </xsl:when>
	    <xsl:otherwise>
	      <xsl:value-of select="@max" />
	    </xsl:otherwise>
	  </xsl:choose>
	  <xsl:text>&amp;</xsl:text>
	  <xsl:text>\rappel{element:</xsl:text>
	  <xsl:value-of select="@name"/>
	  <xsl:text>}</xsl:text>
	  <xsl:text>\\&#10;</xsl:text>
	</xsl:for-each>
	<xsl:text>\hline\end{tabular}&#10;</xsl:text>
      </xsl:when>
      <xsl:when test="gml:element_type/gml:choice">
	<xsl:text>\begin{tabular}{|l|l|}\hline&#10;</xsl:text>
	<xsl:text>\multicolumn{2}{|p{.95\textwidth}|}{\textbf{\texttt{&lt;</xsl:text>
	<xsl:value-of select="@name" />	
	<xsl:text>&gt;}}</xsl:text>
	<xsl:if test="gml:property[@name='lheo:cercle']">
	  <xsl:text> (cercle </xsl:text>
	  <xsl:value-of select="gml:property[@name='lheo:cercle']/@value" />
	  <xsl:text>)</xsl:text>
	</xsl:if>
	<xsl:text>}\\\hline&#10;</xsl:text>
	<xsl:text>Série de </xsl:text>
	<xsl:choose>
	  <xsl:when test="not(@min)">
	    <xsl:text>0</xsl:text>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:value-of select="@min" />
	  </xsl:otherwise>
	</xsl:choose>
	<xsl:text> à </xsl:text>
	<xsl:choose>
	  <xsl:when test="not(@max)">
	    <xsl:text>N</xsl:text>
	  </xsl:when>
	  <xsl:when test="@max='0'">
	    <xsl:text>N</xsl:text>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:value-of select="@max" />
	  </xsl:otherwise>
	</xsl:choose>
	<xsl:text> des élément(s) &amp; voir \\\hline&#10;</xsl:text>
	<xsl:for-each select="gml:element_type/gml:choice/gml:choice_element">
	  <xsl:text>\texttt{&lt;</xsl:text>
	  <xsl:value-of select="@name"/>
	  <xsl:text>&gt;}</xsl:text>
	  <xsl:text>&amp;</xsl:text>
	  <xsl:text>\rappel{element:</xsl:text>
	  <xsl:value-of select="@name"/>
	  <xsl:text>}</xsl:text>
	  <xsl:text>\\&#10;</xsl:text>
	</xsl:for-each>
	<xsl:text>\hline\end{tabular}&#10;</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:text>\begin{tabular}{|p{.95\textwidth}|}\hline&#10;</xsl:text>
	<xsl:text>\textbf{\texttt{&lt;</xsl:text>
	<xsl:value-of select="@name" />	
	<xsl:text>&gt;}}</xsl:text>
	<xsl:if test="gml:property[@name='lheo:cercle']">
	  <xsl:text> (cercle </xsl:text>
	  <xsl:value-of select="gml:property[@name='lheo:cercle']/@value" />
	  <xsl:text>)</xsl:text>
	</xsl:if>	
	<xsl:text>\\\hline&#10;</xsl:text>
	<xsl:apply-templates select="gml:element_type/*" mode="long" />
	<xsl:text>\\\hline&#10;</xsl:text>
	<xsl:text>\end{tabular}&#10;</xsl:text>	
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates select="." mode="example" />
    <xsl:text>\end{flushleft}</xsl:text>	
    <xsl:text>&#10;</xsl:text>

    

  </xsl:template>

  <xsl:template match="gml:basic_text|gml:attribute_text">
    <xsl:text>texte (</xsl:text>
    <xsl:choose>
      <xsl:when test="not(@lgmin)">
	<xsl:text>0</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="@lgmin" />
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>,</xsl:text>
    <xsl:choose>
      <xsl:when test="not(@lgmax)">
	<xsl:text>N</xsl:text>
      </xsl:when>
      <xsl:when test="@lgmax='0'">
	<xsl:text>N</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="@lgmax" />
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>)</xsl:text>
  </xsl:template>

  <xsl:template match="gml:basic_text|gml:attribute_text" mode="long">
    <xsl:text>texte de </xsl:text>
    <xsl:choose>
      <xsl:when test="not(@lgmin)">
	<xsl:text>0</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="@lgmin" />
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text> à </xsl:text>
    <xsl:choose>
      <xsl:when test="not(@lgmax)">
	<xsl:text>N</xsl:text>
      </xsl:when>
      <xsl:when test="@lgmax='0'">
	<xsl:text>N</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="@lgmax" />
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text> caractère(s)</xsl:text>
  </xsl:template>

  <xsl:template match="gml:attribute_id">
    <xsl:text>ID (</xsl:text>
    <xsl:choose>
      <xsl:when test="not(@lgmin)">
	<xsl:text>0</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="@lgmin" />
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>,</xsl:text>
    <xsl:choose>
      <xsl:when test="not(@lgmax)">
	<xsl:text>N</xsl:text>
      </xsl:when>
      <xsl:when test="@lgmax='0'">
	<xsl:text>N</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="@lgmax" />
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>)</xsl:text>
  </xsl:template>

  <xsl:template match="gml:basic_int">
    <xsl:text>entier [</xsl:text>
    <xsl:choose>
      <xsl:when test="not(@vmin)">
	<xsl:text>0</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="@vmin" />
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>,</xsl:text>
    <xsl:choose>
      <xsl:when test="not(@vmax)">
	<xsl:text>N</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="@vmax" />
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>]</xsl:text>
  </xsl:template>

  <xsl:template match="gml:basic_int" mode="long">
    <xsl:text>entier [</xsl:text>
    <xsl:choose>
      <xsl:when test="not(@vmin)">
	<xsl:text>0</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="@vmin" />
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>,</xsl:text>
    <xsl:choose>
      <xsl:when test="not(@vmax)">
	<xsl:text>N</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="@vmax" />
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>]</xsl:text>
  </xsl:template>

  <xsl:template match="gml:basic_key">    
    <xsl:text>clé (</xsl:text>
    <xsl:text>\texttt{</xsl:text>
    <xsl:value-of select="@ref" />
    <xsl:text>})</xsl:text>
  </xsl:template>

  <xsl:template match="gml:basic_key" mode="long">    
    <xsl:text>clé de la table </xsl:text>
    <xsl:text>\texttt{</xsl:text>
    <xsl:value-of select="@ref" />
    <xsl:text>}</xsl:text>
    <xsl:text>, voir </xsl:text>
    <xsl:text>\rappel{table:</xsl:text>
    <xsl:value-of select="@ref"/>
    <xsl:text>}</xsl:text>
  </xsl:template>

  <xsl:template match="gml:basic_date">
    <xsl:text>date (</xsl:text>
    <xsl:text>\texttt{</xsl:text>
    <xsl:text>AAAAMMJJ</xsl:text>
    <xsl:text>})</xsl:text>
  </xsl:template>

  <xsl:template match="gml:basic_date" mode="long">
    <xsl:text>date (format ISO </xsl:text>
    <xsl:text>\texttt{</xsl:text>
    <xsl:text>AAAAMMJJ</xsl:text>
    <xsl:text>}). </xsl:text>
    <xsl:text>Date inconnue: 00000000 (min) ou 99999999 (max).</xsl:text>
  </xsl:template>

  <xsl:template match="gml:basic_data">
    <xsl:text>libre</xsl:text>    
  </xsl:template>

  <xsl:template match="gml:basic_data" mode="long">
    <xsl:text>libre</xsl:text>    
  </xsl:template>

  <xsl:template match="gml:definition" mode="synthesebasic">
    <xsl:text>\texttt{&lt;</xsl:text>
    <xsl:value-of select="@name" />
    <xsl:text>&gt;}</xsl:text>    
    <xsl:text>&amp;</xsl:text>
    <xsl:apply-templates select="gml:element_type/*" />
    <xsl:text>&amp;</xsl:text>
    <xsl:text>\rappel{element:</xsl:text>
    <xsl:value-of select="@name"/>
    <xsl:text>}</xsl:text>
    <xsl:text>\\&#10;</xsl:text>
  </xsl:template>

  <xsl:template name="elementexample">
    <xsl:param name="name" />
    <xsl:text>&#10;</xsl:text>
    <xsl:text>  &lt;</xsl:text>
    <xsl:value-of select="$name"/>
    <xsl:text>&gt;</xsl:text>	  
    <xsl:text>...</xsl:text>
    <xsl:text>&lt;/</xsl:text>
    <xsl:value-of select="$name"/>
    <xsl:text>&gt; </xsl:text>	  
  </xsl:template>

  <xsl:template match="text()"/>

  <xsl:template match="gml:dict" mode="utilisations">
    <xsl:variable name="name" select="@name"/>
    <xsl:variable name="references"
		  select="//gml:definition[.//gml:basic_key/@ref = $name]
			  | //gml:definition[.//gml:attribute_key/@ref = $name]" />
    <xsl:if test="count($references)">
      <xsl:text>\begin{flushleft}&#10;</xsl:text>
      <xsl:text>Utilisée dans </xsl:text>
      <xsl:for-each select="$references">
	<xsl:text>\texttt{&lt;</xsl:text>
	<xsl:value-of select="@name"/>
	<xsl:text>&gt;} (\rappel{element:</xsl:text>
	<xsl:value-of select="@name"/>
	<xsl:text>})</xsl:text>
	<xsl:if test="not(position() = last())">
	  <xsl:text>, </xsl:text>
	</xsl:if>
	<xsl:if test="position() = last()">
	  <xsl:text>.</xsl:text>
	</xsl:if>
      </xsl:for-each>
      <xsl:text>\end{flushleft}&#10;</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="gml:dict" mode="dict">
    <xsl:param name="section_name" select="'subsection'" />
    <xsl:text>\</xsl:text>
    <xsl:value-of select="$section_name" />
    <xsl:text>{Table \texttt{</xsl:text>
    <xsl:value-of select="@name" />
    <xsl:text>}}</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>\label{table:</xsl:text>
    <xsl:value-of select="@name" />
    <xsl:text>}</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>\index{Tables!\texttt{&lt;</xsl:text>
    <xsl:value-of select="@name" />
    <xsl:text>&gt;}}</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>&#10;</xsl:text>

    <xsl:if test="gml:fullname[@xml:lang='fr']">
      <xsl:text>\begin{flushleft}&#10;</xsl:text>
      <xsl:text>\textbf{</xsl:text>
      <xsl:value-of select="gml:fullname"/>
      <xsl:text>.} </xsl:text>
      <xsl:choose>
	<xsl:when test="gml:property[@name='glb:full']">
	  <xsl:value-of
	      select="document(gml:property[@name='glb:full']/@value)//gml:doc[@xml:lang='fr']" />
	</xsl:when>
	<xsl:otherwise>
	  <xsl:value-of select="gml:doc[@xml:lang='fr']" />
	</xsl:otherwise>
      </xsl:choose>
      <xsl:text>&#10;</xsl:text>
      <xsl:text>\end{flushleft}&#10;</xsl:text>
    </xsl:if>

    <xsl:apply-templates select="." mode="utilisations" />

    <xsl:apply-templates select="." mode="custom" />
    <!--<xsl:text>\begin{center}&#10;</xsl:text>-->
    <xsl:apply-templates select="." mode="table" />
    <!--<xsl:text>\end{center}&#10;</xsl:text>-->

  </xsl:template>

  <xsl:template match="gml:dict" mode="table">
    <xsl:text>\noindent\begin{longtable}{|l|p{.75\textwidth}|}&#10;</xsl:text>
    <xsl:text>\hline</xsl:text>
    <xsl:text>\multicolumn{2}{|c|}{\textbf{</xsl:text>
    <xsl:if test="gml:property[@name='glb:full']">
      <xsl:text>Extrait: </xsl:text>
    </xsl:if>
    <xsl:value-of select="gml:fullname[@xml:lang='fr']" />
    <xsl:text>}}\\\hline</xsl:text>
    <xsl:text>\textbf{clé} &amp; \textbf{valeur} \\\hline\hline&#10;</xsl:text>
    <xsl:text>\endfirsthead&#10;</xsl:text>
    <xsl:text>\hline</xsl:text>
    <xsl:text>\multicolumn{2}{|c|}{\textbf{</xsl:text>
    <xsl:if test="gml:property[@name='glb:full']">
      <xsl:text>Extrait: </xsl:text>
    </xsl:if>
    <xsl:value-of select="gml:fullname[@xml:lang='fr']" />    
    <xsl:text> (suite)}}\\\hline</xsl:text>
    <xsl:text>\textbf{clé} &amp; \textbf{valeur} \\\hline\hline&#10;</xsl:text>
    <xsl:text>\endhead&#10;</xsl:text>    
    <xsl:text>\hline \multicolumn{2}{r}{\emph{Suite page suivante}} \\&#10;</xsl:text>
    <xsl:text>\endfoot&#10;</xsl:text>
    <xsl:text>\hline&#10;</xsl:text>
    <xsl:if test="gml:property[@name='glb:full']">
      <xsl:text>\multicolumn{2}{|c|}{\emph{Voir la table complète:}} \\&#10;</xsl:text>
      <xsl:text>\multicolumn{2}{|c|}{\small\url{http://www.lheo.org/tables.html\#</xsl:text>
      <xsl:value-of select="@name" />
      <xsl:text>}}\\\hline&#10;</xsl:text>
    </xsl:if>
    <xsl:text>\endlastfoot&#10;</xsl:text>
    <xsl:choose>
      <xsl:when test="gml:property[@name='glb:full']">
	<xsl:apply-templates select="document(gml:property[@name='glb:full']/@value)//gml:entry[position()&lt;20]/gml:key" mode="entreetable">
	  <xsl:sort select="@val" data-type="number" />
	</xsl:apply-templates>
	<!--<xsl:text>\hline\multicolumn{2}{|c|}{\emph{Voir la table complète:}} \\&#10;</xsl:text>
	<xsl:text>\multicolumn{2}{|c|}{\small</xsl:text>
	<xsl:text>\url{http://www.lheo.org/tables.html\#</xsl:text>
	<xsl:value-of select="@name" />
	<xsl:text>}}</xsl:text>
	<xsl:text>\\&#10;</xsl:text>-->
      </xsl:when>
      <xsl:otherwise>
	<xsl:apply-templates select="gml:entry/gml:key" mode="entreetable">
	  <xsl:sort select="@val" data-type="number" />
	</xsl:apply-templates>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>\hline\end{longtable}</xsl:text>
  </xsl:template>

  <xsl:template match="gml:key" mode="entreetable">
    <xsl:text>\texttt{</xsl:text>
    <xsl:value-of select="@val" />
    <xsl:text>}</xsl:text>    
    <xsl:text>&amp;</xsl:text>
    <xsl:value-of select="../gml:value[@xml:lang='fr']/@val" />    
    <xsl:text>\\&#10;</xsl:text>
  </xsl:template>

  <!--
      GLOSSAIRE
  -->

  <xsl:template match="html:body">
    <xsl:variable name="rev" select="html:div[@class='glossaire']/html:div[@class='version']/html:table/html:tr[html:td='Revision']/html:td[not(@class='title')]" />

    <xsl:text>\section{Glossaire LHÉO (révision </xsl:text>
    <xsl:value-of select="substring-after(substring-before($rev, ' $'), '$Rev: ')" />
    <xsl:text>)}&#10;</xsl:text>
    <xsl:apply-templates select="html:div[@class='glossaire']/html:p[1]" mode="print" />
    <xsl:text>\subsection{Les entrées du glossaire}&#10;</xsl:text>
    <xsl:apply-templates select="html:div[@class='glossaire']/html:div[@class='definitions']" />
    <xsl:text>\subsection{Annexes du glossaire}&#10;</xsl:text>
    <xsl:apply-templates select="html:div[@class='glossaire']/html:div[@class='annexes']/html:div[@class='annexe']"/>
  </xsl:template>

  <xsl:template match="html:div[@class='definitions']">
    <xsl:apply-templates select="html:div[@class='entree']" />
  </xsl:template>

  <xsl:template match="html:div[@class='entree']">    
    <xsl:variable name="terme" select="html:h3/html:a" />
    <xsl:text>\subsubsection</xsl:text>
    <xsl:text>{</xsl:text>
    <xsl:value-of select="$terme" />
    <xsl:text>}</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>\label{glossaire:</xsl:text>
    <xsl:value-of select="@id" />
    <xsl:text>}</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>\index{Glossaire!</xsl:text>
    <xsl:value-of select="$terme" />
    <xsl:text>}</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>&#10;</xsl:text>
    
    <xsl:apply-templates select="html:div[@class='definition']"/>
    <xsl:apply-templates select="html:div[@class='voir']"/>
  </xsl:template>
  
  <xsl:template match="html:div[@class='definition']"> 
    <xsl:for-each select="html:p">
      <xsl:text>\begin{flushleft}&#10;</xsl:text>  
      <xsl:apply-templates select="." mode="print" />
      <xsl:text>\end{flushleft}&#10;</xsl:text>  
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="html:div[@class='voir']"> 
    <xsl:for-each select="html:p">
      <xsl:text>\begin{flushleft}&#10;</xsl:text>  
      <xsl:apply-templates select="." mode="printhref" />
      <xsl:text>\end{flushleft}&#10;</xsl:text>  
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="html:p" mode="print">
    <xsl:apply-templates mode="print" />
  </xsl:template>

  <xsl:template match="text()" mode="print">
    <xsl:value-of select="." />
  </xsl:template>

  <xsl:template match="@href" mode="print" />

  <xsl:template match="html:a" mode="print">
    <xsl:apply-templates mode="print" />
  </xsl:template>

  <xsl:template match="html:p" mode="printhref">
    <xsl:apply-templates mode="printhref" />
  </xsl:template>

  <xsl:template match="text()" mode="printhref">
    <xsl:value-of select="." />
  </xsl:template>

  <xsl:template match="html:a" mode="printhref">
    <xsl:text>\emph{</xsl:text>
    <xsl:value-of select="text()" />
    <xsl:text>}</xsl:text>
    <xsl:text> (</xsl:text>
    <xsl:text>\rappel{glossaire:</xsl:text>
    <xsl:value-of select="substring-after(@href,'#')"/>
    <xsl:text>}</xsl:text>
    <xsl:text>)</xsl:text>
  </xsl:template>

  <xsl:template match="html:div[@class='annexe']">    
    <xsl:variable name="terme" select="html:h3/html:a" />
    <xsl:text>\subsubsection</xsl:text>
    <xsl:text>{</xsl:text>
    <xsl:value-of select="$terme" />
    <xsl:text>}</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>\label{glossaire:</xsl:text>
    <xsl:value-of select="html:h3/html:a/@id" />
    <xsl:text>}</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>\index{Glossaire!Annexe: </xsl:text>
    <xsl:value-of select="$terme" />
    <xsl:text>}</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>&#10;</xsl:text>
    <xsl:text>\begin{itemize}</xsl:text>
    <xsl:for-each select="html:ul/html:li">
      <xsl:text>\item </xsl:text>
      <xsl:value-of select="text()" />
    </xsl:for-each>
    <xsl:text>\end{itemize}</xsl:text>
  </xsl:template>

  <xsl:template match="outils-validation">
    <xsl:text>\newpage</xsl:text>
    <xsl:text>\section{Outils pour valider des fichiers au format XML LHÉO}&#10;</xsl:text>
    <xsl:text>\label{sec:outils}&#10;</xsl:text>

    <xsl:text>
      Lorsqu'une application doit traiter des fichiers au format LHÉO
      (produire ou lire des fichiers), il est important de vérifier
      que ces fichiers soient \textbf{valides}, c'est-à-dire qu'ils
      respectent la grammaire de LHÉO (DTD et Schéma XML W3C).

      Pour valider des fichiers XML à l'aide d'une DTD ou d'un Schéma
      XML W3C, il faut utiliser un \emph{parseur} validant,
      c'est-à-dire une application qui est capable de lire le XML, de
      vérifier que le XML est \emph{bien formé} puis de valider ces
      fichiers à l'aide de la DTD et/ou du Schéma XML W3C fourni à
      l'application.

      Il existe de nombreuses applications, gratuites ou commerciales,
      capables d'effectuer un tel traitement. La plupart des langages
      de programmation modernes (Java, C, Python, Perl, ...)
      intègrent, parfois même en standard, des bibliothèques capables
      de manipuler du XML et de valider des fichiers XML.

      Dans ce document, nous allons prendre comme exemple
      d'application intégrant un parseur validant l'application
      \texttt{xmllint} qui fait partie du paquetage \texttt{libxml2},
      une bibliothèque open-source et gratuite de manipulation de XML
      écrite en C (voir \url{http://www.xmlsoft.org}).

      L'outil \texttt{xmllint} permet de lire un fichier XML et de
      vérifier qu'il est bien formé et qu'il est valide par rapport à
      une DTD ou un schéma.
    </xsl:text>
  </xsl:template>

  <!--
  CUSTOM
  -->
  <xsl:template match="gml:definition" mode="custom" />
  <xsl:template match="gml:dict" mode="custom" />
  
  <xsl:template match="gml:definition[@name='offre-formation']" mode="custom">
    <xsl:text>\begin{flushleft}&#10;</xsl:text>
    <xsl:text>
      Lorsque l'attribut \texttt{href} est renseigné, il devrait
      contenir l'URL de la description de cette offre au format
      HTML. Lorsque l'attribut \texttt{file} est renseigné, il devrait
      contenir l'URL de cette offre de formation au format XML LHÉO.
    </xsl:text>
    <xsl:text>\end{flushleft}&#10;</xsl:text>
  </xsl:template>



 
</xsl:stylesheet>
