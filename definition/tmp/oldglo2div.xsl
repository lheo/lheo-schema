<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns="http://www.w3.org/1999/xhtml"  
		version="1.0">

  <xsl:param name="deffile" select="''" />

  <xsl:output method="xml" encoding="utf-8" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

  <xsl:variable name="defs" select="document($deffile)" />

  <xsl:template match="/glossaire">
    <html xml:lang="fr">
      <head>
	<title>
	  <xsl:text>Glossaire LHÉO (</xsl:text>
	  <xsl:value-of select="document($defs)/definitions/@version" />
	  <xsl:value-of select="document($defs)/definitions/@revision" />
	  <xsl:text>)</xsl:text>	  
	</title>
      </head>
      <body>
	<div class="grostitre">
	  <h1>
	    <xsl:text>Glossaire LHÉO (</xsl:text>
	    <xsl:value-of select="document($defs)/definitions/@version" />
	    <xsl:value-of select="document($defs)/definitions/@revision" />
	    <xsl:text>)</xsl:text>
	  </h1>
	</div>
	<xsl:apply-templates select="preambule" />
	<xsl:apply-templates select="entrees" />

	<div class="annexes">
	  <h2 class="annexes">Annexes</h2>
	  <div class="annexe">
	    <h3 class="annexe">
	      <a name="annexeI">Liste des financeurs potentiels</a>
	    </h3>
	    <ul>
	      <li>AGEFIPH - Association nationale de GEstion du Fonds pour l'Insertion Professionnelle des personnes Handicapées</li>
	      <li>Entreprise</li>
	      <li>État</li>
	      <li>Conseil Régional</li>
	      <li>Conseil Général</li>
	      <li>Collectivité locale</li>
	      <li>FSE - Fond Social Européen</li>
	      <li>Unédic</li>
	      <li>OPCA - Organisme Paritaire Collecteur Agréé</li> 
	      <li>FAS - Fonds d'Action Sociale pour les travailleurs immigrés et leurs familles</li>
	      <li>Autres financeurs publics</li>
	      <li>Autres financeurs privés</li>
	    </ul>
	  </div>
	  <div class="annexe">
	    <h3 class="annexe"><a name="bibliographie">Bibliographie</a></h3>
	    <ul>
	      <li>
		<a name="NFX50-750">
		  AFNOR - Norme NF X 50-750 : formation professionnelle, terminologie, juillet 1996.
		</a>
	      </li>
	      <li>
		<a name="NFX50-751">
		  AFNOR - Norme FD X 50-751 : formation professionnelle, terminologie, fascicule explicatif, juillet 1996.
		</a>
	      </li>
	    </ul>
	  </div>
	</div>
	
      </body>
    </html>
  </xsl:template>

  <xsl:template match="entrees">
    <div class="definitions">
      <h2 class="definitions">Définitions</h2>
      <xsl:apply-templates select="entree" />
    </div>
  </xsl:template>

  <xsl:template match="entree">
    <div class="entree" id="{terme/@id}">
      <h3 class="terme">
	<a name="{terme/@id}">
	  <xsl:apply-templates select="terme"/>
	</a>
      </h3>
      <div class="definition">
	<xsl:for-each select="definition">
	  <xsl:apply-templates select="p" />
	</xsl:for-each>
      </div>
      <xsl:apply-templates select="voir" />
    </div>
  </xsl:template>

  <xsl:template match="p">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="voir">
    <div class="voir">
      <xsl:apply-templates select="p" />
    </div>
  </xsl:template>

  <xsl:template match="bib|lien">
    <a href="#{@idref}"><xsl:apply-templates /></a>
  </xsl:template>

  <xsl:template match="refannexe">
    <a href="#{@idref}"><xsl:apply-templates /></a>
  </xsl:template>

  <xsl:template match="b">
    <b><xsl:apply-templates /></b>
  </xsl:template>
</xsl:stylesheet>