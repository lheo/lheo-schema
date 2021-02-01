<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		xmlns:gml="http://www.gelaba.org/gml/1.1"
		xmlns:html="http://www.w3.org/1999/xhtml"
		version="1.0">
	<xsl:param name="page" select="'index'"/>
	<xsl:param name="action" select="'doc'"/>
	<xsl:param name="lheogml" select="'../definition/lheo-gml.xml'"/>
	<xsl:param name="glossaire" select="'../definition/lheo-glossaire.html'" /> 
	<xsl:variable name="docglossaire" select="document($glossaire)" />
	<xsl:variable name="doclheogml" select="document($lheogml)" />

	<xsl:output method="text" encoding="utf-8" />

	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="$action = 'doc'">
				<xsl:choose>
					<xsl:when test="$page = 'index'">
						<xsl:call-template name="page-index"/>
					</xsl:when>
					<xsl:when test="$page = 'structure'">
						<xsl:call-template name="page-structure"/>
					</xsl:when>
					<xsl:when test="$page = 'cercle1'">
						<xsl:call-template name="page-cercle1"/>
					</xsl:when>
					<xsl:when test="$page = 'cercle2'">
						<xsl:call-template name="page-cercle2"/>
					</xsl:when>
					<xsl:when test="$page = 'cercle3'">
						<xsl:call-template name="page-cercle3"/>
					</xsl:when>
					<xsl:when test="$page = 'types'">
						<xsl:call-template name="page-types"/>
					</xsl:when>
					<xsl:when test="$page = 'tables'">
						<xsl:call-template name="page-tables"/>
					</xsl:when>
					<xsl:when test="$page = 'glossaire'">
						<xsl:call-template name="page-glossaire"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:apply-templates select="//gml:definition[@name=$page]" mode="element"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$action = 'table'">
				<xsl:apply-templates select="//gml:dict[@name=$page]" mode="dict"/>
			</xsl:when>
			<xsl:when test="$action = 'list'">
				<xsl:text>LHEOFILES =</xsl:text>
				<xsl:for-each select="//gml:definition">
					<xsl:text> source/lheo/</xsl:text>
					<xsl:value-of select="@name"/>
					<xsl:text>.rst \&#10;</xsl:text>
				</xsl:for-each>
				<xsl:for-each select="//gml:dict">
					<xsl:text> source/lheo/</xsl:text>
					<xsl:value-of select="@name"/>
					<xsl:text>.rst \&#10;</xsl:text>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$action = 'makerules'">
				<xsl:for-each select="//gml:definition">
					<xsl:text>source/lheo/</xsl:text>
					<xsl:value-of select="@name"/>
					<xsl:text>.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)&#10;</xsl:text>
					<xsl:text>&#9;xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page </xsl:text>
					<xsl:value-of select="@name"/>
					<xsl:text> $(GML2SPHINX) $(LHEOGML)</xsl:text>
					<xsl:text>&#10;</xsl:text>
				</xsl:for-each>
				<xsl:for-each select="//gml:dict">
					<xsl:text>source/lheo/</xsl:text>
					<xsl:value-of select="@name"/>
					<xsl:text>.rst: $(GML2SPHINX) $(LHEOGML)&#10;</xsl:text>
					<xsl:text>&#9;xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam action table --stringparam page </xsl:text>
					<xsl:value-of select="@name"/>
					<xsl:text> $(GML2SPHINX) $(LHEOGML)</xsl:text>
					<xsl:text>&#10;</xsl:text>
				</xsl:for-each>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="page-index">
		<xsl:text>LHÉO&#10;</xsl:text>
		<xsl:text>====&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>.. toctree::&#10;</xsl:text>
		<xsl:text>   :maxdepth: 3&#10;</xsl:text>
		<xsl:text>   :includehidden:&#10;</xsl:text>
		<xsl:text>   :caption: Sommaire:&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>   lheo_langage&#10;</xsl:text>
		<!--<xsl:text>   lheo_loms&#10;</xsl:text>-->
		<xsl:text>&#10;</xsl:text>
		<!--
		<xsl:text>Indices and tables&#10;</xsl:text>
		<xsl:text>==================&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>* :ref:`genindex`&#10;</xsl:text>
		<xsl:text>* :ref:`modindex`&#10;</xsl:text>
		<xsl:text>* :ref:`search`&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		-->
	</xsl:template> 

	<xsl:template name="page-structure">
		<xsl:text>Structure générale&#10;</xsl:text>
		<xsl:text>------------------&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>.. toctree::&#10;</xsl:text>
		<xsl:text>   :maxdepth: 3&#10;</xsl:text>
		<xsl:text>   :hidden:&#10;</xsl:text>
		<xsl:text>   :caption: Sommaire&#10;</xsl:text>		
		<xsl:text>&#10;</xsl:text>		
		<xsl:for-each select="//gml:definition[not(gml:property[@name='lheo:cercle'])]">
			<xsl:if test="gml:element_type/gml:sequence or gml:element_type/gml:choice">
				<xsl:text>   lheo/</xsl:text>
				<xsl:value-of select="@name"/>
				<xsl:text>&#10;</xsl:text>
			</xsl:if>
		</xsl:for-each>
		<xsl:text>&#10;</xsl:text>
	</xsl:template> 

	<xsl:template name="page-cercle1">
		<xsl:text>Éléments obligatoires (premier cercle)&#10;</xsl:text>
		<xsl:text>--------------------------------------&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>.. toctree::&#10;</xsl:text>
		<xsl:text>   :maxdepth: 3&#10;</xsl:text>
		<xsl:text>   :hidden:&#10;</xsl:text>
		<xsl:text>   :caption: Sommaire&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>		
		<xsl:for-each select="//gml:definition[gml:property[@name='lheo:cercle']/@value='1']">
			<xsl:text>   lheo/</xsl:text>
			<xsl:value-of select="@name"/>
			<xsl:text>&#10;</xsl:text>
		</xsl:for-each>
		<xsl:text>&#10;</xsl:text>
	</xsl:template> 

	<xsl:template name="page-cercle2">
		<xsl:text>Éléments optionnels (deuxième cercle)&#10;</xsl:text>
		<xsl:text>-------------------------------------&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>.. toctree::&#10;</xsl:text>
		<xsl:text>   :maxdepth: 3&#10;</xsl:text>
		<xsl:text>   :hidden:&#10;</xsl:text>
		<xsl:text>   :caption: Sommaire&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>		
		<xsl:for-each select="//gml:definition[gml:property[@name='lheo:cercle']/@value='2']">
			<xsl:text>   lheo/</xsl:text>
			<xsl:value-of select="@name"/>
			<xsl:text>&#10;</xsl:text>
		</xsl:for-each>
		<xsl:text>&#10;</xsl:text>
	</xsl:template> 

	<xsl:template name="page-cercle3">
		<xsl:text>Éléments d'extension (troisième cercle)&#10;</xsl:text>
		<xsl:text>---------------------------------------&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>.. toctree::&#10;</xsl:text>
		<xsl:text>   :maxdepth: 3&#10;</xsl:text>
		<xsl:text>   :hidden:&#10;</xsl:text>
		<xsl:text>   :caption: Sommaire&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>		
		<xsl:for-each select="//gml:definition[gml:property[@name='lheo:cercle']/@value='3']">
			<xsl:text>   lheo/</xsl:text>
			<xsl:value-of select="@name"/>
			<xsl:text>&#10;</xsl:text>
		</xsl:for-each>
		<xsl:text>&#10;</xsl:text>
	</xsl:template> 

	<xsl:template name="page-types">
		<xsl:text>Types de base&#10;</xsl:text>
		<xsl:text>-------------&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>.. toctree::&#10;</xsl:text>
		<xsl:text>   :maxdepth: 3&#10;</xsl:text>
		<xsl:text>   :hidden:&#10;</xsl:text>
		<xsl:text>   :caption: Sommaire&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:for-each select="//gml:definition[not(gml:property[@name='lheo:cercle'])]">
			<xsl:if test="not(gml:element_type/gml:sequence or gml:element_type/gml:choice)">
				<xsl:text>   lheo/</xsl:text>
				<xsl:value-of select="@name"/>
				<xsl:text>&#10;</xsl:text>
			</xsl:if>
		</xsl:for-each>
		<xsl:text>&#10;</xsl:text>
	</xsl:template> 

	<xsl:template name="page-tables">
		<xsl:text>Tables&#10;</xsl:text>
		<xsl:text>------&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>.. toctree::&#10;</xsl:text>
		<xsl:text>   :maxdepth: 3&#10;</xsl:text>
		<xsl:text>   :hidden:&#10;</xsl:text>
		<xsl:text>   :caption: Sommaire&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
		<xsl:for-each select="//gml:dict">
			<xsl:text>   lheo/</xsl:text>
			<xsl:value-of select="@name"/>
			<xsl:text>&#10;</xsl:text>
		</xsl:for-each>
		<xsl:text>&#10;</xsl:text>
	</xsl:template> 

	<xsl:template name="page-glossaire">
		<xsl:apply-templates select="$docglossaire/html:html/html:body" />
	</xsl:template>

	<xsl:template match="gml:definition" mode="element">
		<xsl:text>.. _</xsl:text>
		<xsl:value-of select="@name"/>
		<xsl:text>:&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>

		<xsl:value-of select="gml:fullname" />
		<xsl:text>&#10;</xsl:text>
		<xsl:call-template name="underline">
			<xsl:with-param name="item" select="'+'"/>
			<xsl:with-param name="count" select="string-length(gml:fullname/text())"/>
		</xsl:call-template>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>

		<xsl:apply-templates select="." mode="example" />

		<xsl:value-of select="normalize-space(gml:doc[@xml:lang='fr']/text())" />
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>

		<xsl:apply-templates select="." mode="tableau"/>
		<xsl:apply-templates select="." mode="attributes"/>
		<xsl:apply-templates select="." mode="utilisations"/>
		<xsl:apply-templates select="." mode="glossaire"/>
	</xsl:template>

 	<xsl:template match="gml:definition" mode="tableau">
		<xsl:choose>
			<xsl:when test="gml:element_type/gml:sequence">
				<xsl:text>Éléments&#10;</xsl:text>
				<xsl:text>""""""""&#10;</xsl:text>
				<xsl:text>&#10;</xsl:text>
				<xsl:text>Séquence ordonnée des éléments suivants:&#10;&#10;</xsl:text>
				<xsl:for-each select="gml:element_type/gml:sequence/gml:element">
					<xsl:text>- ``&lt;</xsl:text>
					<xsl:value-of select="@name"/>
					<xsl:text>&gt;`` :ref:`</xsl:text>
					<xsl:value-of select="@name"/>
					<xsl:text>` [</xsl:text>
					<xsl:choose>
						<xsl:when test="not(@min)">
							<xsl:text>1</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="@min" />
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text>, </xsl:text>
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
					<xsl:text>]&#10;</xsl:text>
				</xsl:for-each>

				<xsl:text>&#10;</xsl:text>
			</xsl:when>
			<xsl:when test="gml:element_type/gml:choice">
				<xsl:text>Éléments&#10;</xsl:text>
				<xsl:text>""""""""&#10;</xsl:text>
				<xsl:text>&#10;</xsl:text>
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
				<xsl:text> répétition des éléments suivants dans le désordre:&#10;&#10;</xsl:text>
				<xsl:for-each select="gml:element_type/gml:choice/gml:choice_element">
					<xsl:text>- ``&lt;</xsl:text>
					<xsl:value-of select="@name"/>
					<xsl:text>&gt;`` :ref:`</xsl:text>
					<xsl:value-of select="@name"/>
					<xsl:text>`&#10;</xsl:text>
				</xsl:for-each>
				<xsl:text>&#10;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>Type&#10;</xsl:text>
				<xsl:text>""""&#10;</xsl:text>
				<xsl:text>&#10;</xsl:text>
				<xsl:apply-templates select="gml:element_type/*" mode="long" />
				<xsl:text>&#10;</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text>&#10;&#10;</xsl:text>		
	</xsl:template>

	<xsl:template match="gml:definition" mode="example">
    	<xsl:variable name="elementname">
      		<xsl:value-of select="@name"/>
    	</xsl:variable>
    
    	<xsl:text>.. code-block:: xml</xsl:text>
    	<xsl:text>&#10;</xsl:text>
    	<xsl:text>&#10;</xsl:text>

    	<!-- CONTENU -->
	    <xsl:choose>
    		<xsl:when test="gml:element_type/gml:sequence">
			    <!-- BALISE ouvrante -->
			    <xsl:text>  &lt;</xsl:text>
			    <xsl:value-of select="$elementname" />
			    <xsl:text>&gt;&#10;</xsl:text>

				<xsl:for-each select="gml:element_type/gml:sequence/gml:element">
					<xsl:call-template name="elementexample">
		    			<xsl:with-param name="name" select="@name" />
					</xsl:call-template>
					<xsl:text>&lt;!-- [</xsl:text>
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
					<xsl:text>] --&gt;</xsl:text>	  
					<xsl:text>&#10;</xsl:text>
				</xsl:for-each>
		    	<!-- BALISE fermante -->
		    	<xsl:text>  &lt;/</xsl:text>
		    	<xsl:value-of select="$elementname" />
		    	<xsl:text>&gt;</xsl:text>
		    	<xsl:text>&#10;</xsl:text>
		    </xsl:when>      
		    <xsl:when test="gml:property[@name='glb:example']">
		    	<!-- BALISE ouvrante -->
			    <xsl:text>  &lt;</xsl:text>
			    <xsl:value-of select="$elementname" />
			    <xsl:text>&gt;</xsl:text>

				<xsl:value-of select="normalize-space(gml:property[@name='glb:example'][1]/@value)" />

		    	<!-- BALISE fermante -->
		    	<xsl:text>&lt;/</xsl:text>
		    	<xsl:value-of select="$elementname" />
		    	<xsl:text>&gt;</xsl:text>
		    	<xsl:text>&#10;</xsl:text>
		    </xsl:when>
		    <xsl:otherwise>
		    	<!-- BALISE ouvrante -->
			    <xsl:text>  &lt;</xsl:text>
			    <xsl:value-of select="$elementname" />
			    <xsl:text>&gt;</xsl:text>

				<xsl:text>...</xsl:text>

		    	<!-- BALISE fermante -->
		    	<xsl:text>&lt;/</xsl:text>
		    	<xsl:value-of select="$elementname" />
		    	<xsl:text>&gt;</xsl:text>
		    	<xsl:text>&#10;</xsl:text>				
		    </xsl:otherwise>
	    </xsl:choose>

    	<xsl:text>&#10;</xsl:text>
    	<xsl:text>&#10;</xsl:text>
  	</xsl:template>

	<xsl:template match="gml:definition[gml:attribute]" mode="attributes">
		<xsl:text>Attributs&#10;</xsl:text>
		<xsl:text>"""""""""&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
	    <xsl:apply-templates select="gml:attribute" />
		<xsl:text>&#10;</xsl:text>
  </xsl:template>
  <xsl:template match="gml:definition" mode="attributes" />

  <xsl:template match="gml:attribute">
    <xsl:text>- ``</xsl:text>
    <xsl:value-of select="@name" />
    <xsl:text>`` (</xsl:text>
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
    <xsl:if test="@value">
      <xsl:text> "``</xsl:text>
      <xsl:value-of select="@value" />
      <xsl:text>``" </xsl:text>
    </xsl:if>
    <xsl:text>) </xsl:text>
    <xsl:apply-templates select="gml:attribute_type/*" />
    <xsl:text>&#10;</xsl:text>
	  </xsl:template>

	<xsl:template match="gml:dict" mode="dict">
		<xsl:text>.. _</xsl:text>
		<xsl:value-of select="@name"/>
		<xsl:text>:&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>

		<xsl:value-of select="gml:fullname" />
		<xsl:text>&#10;</xsl:text>
		<xsl:call-template name="underline">
			<xsl:with-param name="item" select="'+'"/>
			<xsl:with-param name="count" select="string-length(gml:fullname/text())"/>
		</xsl:call-template>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>

		<xsl:value-of select="gml:doc[@xml:lang='fr']" />
	    <xsl:text>&#10;</xsl:text>
	    <xsl:text>&#10;</xsl:text>

	    <xsl:apply-templates select="." mode="table" />
	    <xsl:apply-templates select="." mode="utilisations" />
	    <xsl:apply-templates select="." mode="custom" />
	    <xsl:apply-templates select="." mode="glossaire" />
	</xsl:template>

<xsl:template match="gml:dict" mode="utilisations">
    <xsl:variable name="name" select="@name"/>
    <xsl:variable name="references"
		  select="//gml:definition[.//gml:basic_key/@ref = $name]
			  | //gml:definition[.//gml:attribute_key/@ref = $name]" />
    <xsl:if test="count($references)">
      <xsl:text>Utilisée dans </xsl:text>
      <xsl:for-each select="$references">
	<xsl:text> :ref:`</xsl:text>
	<xsl:value-of select="@name"/>
	<xsl:text>`</xsl:text>
	<xsl:if test="not(position() = last())">
	  <xsl:text>, </xsl:text>
	</xsl:if>
	<xsl:if test="position() = last()">
	  <xsl:text>.</xsl:text>
	</xsl:if>
</xsl:for-each>
	    <xsl:text>&#10;</xsl:text>
	    <xsl:text>&#10;</xsl:text>
	</xsl:if>
  </xsl:template>

	<xsl:template match="gml:dict" mode="table">
		<xsl:if test="gml:entry/gml:key">
			<xsl:text>.. list-table:: Table ``</xsl:text>
			<xsl:value-of select="@name"/>
			<xsl:text>``&#10;</xsl:text>
			<xsl:text>   :widths: 25 75&#10;</xsl:text>
			<xsl:text>   :header-rows: 1&#10;&#10;</xsl:text>
	    	<xsl:text>   * - Clé&#10;</xsl:text>
	    	<xsl:text>     - Valeur&#10;</xsl:text>
			<xsl:apply-templates select="gml:entry/gml:key" mode="entreetable">
				<xsl:sort select="@val" data-type="number" />
			</xsl:apply-templates>
		</xsl:if>
		<xsl:text>&#10;</xsl:text>
	    <xsl:text>&#10;</xsl:text>
  	</xsl:template>

  	<xsl:template match="gml:key" mode="entreetable">
    	<xsl:text>   * - ``</xsl:text>
    	<xsl:value-of select="@val" />
    	<xsl:text>``&#10;</xsl:text>    
    	<xsl:text>     - </xsl:text>
    	<xsl:value-of select="../gml:value[@xml:lang='fr']/@val" />
    	<xsl:text>&#10;</xsl:text>
  	</xsl:template>

	<xsl:template name="elementexample">
    	<xsl:param name="name" />
	    <xsl:text>    &lt;</xsl:text>
	    <xsl:value-of select="$name"/>
	    <xsl:text>&gt;</xsl:text>	  
	    <xsl:text>...</xsl:text>
	    <xsl:text>&lt;/</xsl:text>
	    <xsl:value-of select="$name"/>
	    <xsl:text>&gt; </xsl:text>	  
	</xsl:template>

	<xsl:template match="gml:definition" mode="utilisations">
		<xsl:variable name="name" select="@name"/>
		<xsl:variable name="references"
				select="//gml:definition[.//gml:element/@name = $name and 
					not(gml:property[@name='lheo:extension'])] |
					//gml:definition[.//gml:choice_element/@name = $name and 
					not(gml:property[@name='lheo:extension'])]"/>
		<xsl:if test="count($references)">
			<xsl:text>Utilisé dans </xsl:text>
			<xsl:for-each select="$references">
				<xsl:text>:ref:`</xsl:text>
				<xsl:value-of select="@name"/>
				<xsl:text>`</xsl:text>
				<xsl:if test="not(position() = last())">
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:if test="position() = last()">
					<xsl:text>.</xsl:text>
				</xsl:if>
			</xsl:for-each>
			<xsl:text>&#10;&#10;</xsl:text>
		</xsl:if>
	</xsl:template>

 <xsl:template match="gml:definition|gml:dict" mode="glossaire">
    <xsl:variable name="value" select="gml:property[@name='lheo:glossaire']/@value" />
    <xsl:if test="$value">
    	<xsl:text>.. admonition:: Dans le glossaire LHÉO&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>
    	<xsl:text>   :ref:`</xsl:text>
      	<xsl:value-of select="$docglossaire//html:h3[@class='terme' and html:a[@name=$value]]/html:a/@name"/>
		<xsl:text>-terme`&#10;&#10;</xsl:text>
		<xsl:for-each select="$docglossaire//html:div[@class='entree' and @id=$value]/html:div[@class='definition']/html:p">
			<xsl:text>&#10;   </xsl:text>
			<xsl:apply-templates select="." mode="print"/>
		</xsl:for-each>
      <xsl:text>&#10;&#10;</xsl:text>
    </xsl:if>
  </xsl:template>

	<xsl:template match="gml:basic_text|gml:attribute_text" mode="long">
		<xsl:text>Texte de </xsl:text>
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
		<xsl:text> caractère(s).</xsl:text>
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

  <xsl:template match="gml:attribute_idref">
    <xsl:text>IDREF (</xsl:text>
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

	<xsl:template match="gml:basic_int" mode="long">
		<xsl:text>Entier [</xsl:text>
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
		<xsl:text>].</xsl:text>
	</xsl:template>

  	<xsl:template match="gml:basic_key" mode="long">    
	    <xsl:text>Clé de la table </xsl:text>
    	<xsl:text>:ref:`</xsl:text>
	    <xsl:value-of select="@ref" />
    	<xsl:text>`</xsl:text>
	</xsl:template>

	<xsl:template match="gml:basic_date" mode="long">
    	<xsl:text>Date (format ISO </xsl:text>
    	<xsl:text>``</xsl:text>
    	<xsl:text>AAAAMMJJ</xsl:text>
    	<xsl:text>``). </xsl:text>
    	<xsl:text>Date inconnue: ``00000000`` (min) ou ``99999999`` (max).</xsl:text>
	</xsl:template>

	<xsl:template match="gml:basic_data" mode="long">
		<xsl:text>Données libres.</xsl:text>    
	</xsl:template>

	<xsl:template match="gml:basic_any" mode="long">
		<xsl:text>N'importe quel élément XML ou texte.</xsl:text>
	</xsl:template>

	<xsl:template name="underline">
		<xsl:param name="item" select="'='"/>
		<xsl:param name="count" />
		<xsl:if test="$count &gt; 0">
			<xsl:value-of select="$item" />
			<xsl:call-template name="underline">
				<xsl:with-param name="item" select="$item" />
				<xsl:with-param name="count" select="$count - 1" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<!--
		CUSTOM
	-->
	<xsl:template match="gml:definition" mode="custom" />

	<xsl:template match="gml:dict" mode="custom" />
  
	<xsl:template match="gml:definition[@name='offre-formation']" mode="custom">
		<xsl:text>Lorsque l'attribut ``href`` est renseigné, il devrait
    	contenir l'URL de la description de cette offre au format
    	HTML. Lorsque l'attribut ``file`` est renseigné, il devrait
    	contenir l'URL de cette offre de formation au format XML LHÉO.</xsl:text>
    	<xsl:text>&#10;</xsl:text>
    	<xsl:text>&#10;</xsl:text>
	</xsl:template>

	<!--
    	GLOSSAIRE
	-->

	<xsl:template match="html:body">
    	<xsl:variable name="rev" select="html:div[@class='glossaire']/html:div[@class='grostitre']/html:h1" />
	    <xsl:text>.. _glossaire:&#10;&#10;</xsl:text>

		<xsl:value-of select="$rev" />
		<xsl:text>&#10;</xsl:text>
		<xsl:call-template name="underline">
			<xsl:with-param name="item" select="'+'"/>
			<xsl:with-param name="count" select="string-length($rev)"/>
		</xsl:call-template>
		<xsl:text>&#10;</xsl:text>
		<xsl:text>&#10;</xsl:text>

		<xsl:for-each select="html:div[@class='glossaire']/html:p">
		    <xsl:apply-templates select="." mode="print" />
			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:for-each>

		<xsl:for-each select="html:div[@class='glossaire']/html:div[@class='definitions']/html:div[@class='entree']">
		    <xsl:apply-templates select="." />
			<xsl:text>&#10;</xsl:text>
			<xsl:text>&#10;</xsl:text>
		</xsl:for-each>

	    <xsl:apply-templates select="html:div[@class='glossaire']/html:div[@class='annexes']/html:div[@class='annexe']"/>

	</xsl:template>

	<xsl:template match="html:div[@class='entree']">    
	    <xsl:variable name="terme" select="normalize-space(html:h3/html:a/text())" />
	    <xsl:variable name="id" select="@id" />
	    <xsl:text>.. _</xsl:text>
	    <xsl:value-of select="@id" />
	    <xsl:text>-terme:&#10;&#10;</xsl:text>

	    <xsl:value-of select="$terme" />
		<xsl:text>&#10;</xsl:text>
		<xsl:call-template name="underline">
			<xsl:with-param name="item" select="'^'"/>
			<xsl:with-param name="count" select="string-length($terme)"/>
		</xsl:call-template>
		<xsl:text>&#10;</xsl:text>    
		<xsl:text>&#10;</xsl:text>

	    <xsl:apply-templates select="html:div[@class='definition']"/>
	    <xsl:apply-templates select="html:div[@class='voir']"/>

	    <xsl:variable name="gmlelements" select="$doclheogml//gml:definition[	gml:property[@name='lheo:glossaire']/@value = $id]"/>
	    <xsl:if test="count($gmlelements) &gt; 0">
	    	<xsl:text>Éléménts de LHÉO reliés à cette notion : </xsl:text>
		    <xsl:for-each select="$gmlelements">
		    	<xsl:text>:ref:`</xsl:text>
		    	<xsl:value-of select="@name"/>
		    	<xsl:text>`</xsl:text>
		    	<xsl:if test="not(position() = last())">
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:if test="position() = last()">
					<xsl:text>.</xsl:text>
				</xsl:if>
		    </xsl:for-each>
			<xsl:text>&#10;</xsl:text>    
			<xsl:text>&#10;</xsl:text>
		</xsl:if>

	    <xsl:variable name="gmldicts" select="$doclheogml//gml:dict[	gml:property[@name='lheo:glossaire']/@value = $id]"/>
	    <xsl:if test="count($gmldicts) &gt; 0">
	    	<xsl:text>Tables de LHÉO reliées à cette notion : </xsl:text>
		    <xsl:for-each select="$gmldicts">
		    	<xsl:text>:ref:`</xsl:text>
		    	<xsl:value-of select="@name"/>
		    	<xsl:text>`</xsl:text>
		    	<xsl:if test="not(position() = last())">
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:if test="position() = last()">
					<xsl:text>.</xsl:text>
				</xsl:if>
		    </xsl:for-each>
		    <xsl:text>&#10;</xsl:text>    
			<xsl:text>&#10;</xsl:text>
		</xsl:if>

	</xsl:template>
  
	<xsl:template match="html:div[@class='definition']"> 
    	<xsl:for-each select="html:p">
	    	<xsl:apply-templates select="." mode="print"/>
	        <xsl:text>&#10;&#10;</xsl:text>  
	    </xsl:for-each>
	</xsl:template>

	<xsl:template match="html:div[@class='voir']"> 
    	<xsl:for-each select="html:p">
			<xsl:text>&#10;</xsl:text>    		
      		<xsl:apply-templates select="." mode="print"/>
      		<xsl:text>&#10;&#10;</xsl:text>  
	    </xsl:for-each>
	</xsl:template>

	<xsl:template match="html:p|html:li" mode="print">
    	<xsl:apply-templates mode="print" />
      	<xsl:text>&#10;</xsl:text>  
	</xsl:template>

  	<xsl:template match="text()" mode="print">
  		<xsl:variable name="content" select="normalize-space(.)"/>
  		<xsl:if test="$content != ''">
	    	<xsl:value-of select="$content" />
	    	<xsl:text> </xsl:text>
	    </xsl:if>
  	</xsl:template>

  	<xsl:template match="html:b" mode="print">
    	<xsl:text>*</xsl:text>
    	<xsl:value-of select="text()" mode="print"/>
    	<xsl:text>* </xsl:text>
  	</xsl:template>

	<xsl:template match="html:a[@href]" mode="print">
		<xsl:choose>
			<xsl:when test="substring(@href, 1, 1) = '#'">
			    <xsl:text> :ref:`</xsl:text>
			    <xsl:value-of select="substring-after(@href, '#')" />
			    <xsl:text>-terme` </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text> `</xsl:text>
				<xsl:apply-templates select="text()" mode="print"/>
				<xsl:text> &lt;</xsl:text>
				<xsl:apply-templates select="@href"/>
				<xsl:text>&gt;`_ </xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="html:a[not(@href)]" mode="print">
    	<xsl:apply-templates mode="print" />		
	</xsl:template>

	<xsl:template match="html:div[@class='annexe']">
	    <xsl:variable name="terme" select="normalize-space(html:h3/html:a/text())" />
	    <xsl:text>.. _</xsl:text>
	    <xsl:value-of select="html:h3/html:a/@id" />
	    <xsl:text>-terme:&#10;&#10;</xsl:text>

	    <xsl:text>Annexe : </xsl:text>
	    <xsl:value-of select="$terme" />
		<xsl:text>&#10;</xsl:text>
		<xsl:call-template name="underline">
			<xsl:with-param name="item" select="'^'"/>
			<xsl:with-param name="count" select="string-length($terme) + 9"/>
		</xsl:call-template>
		<xsl:text>&#10;</xsl:text>
 
	    <xsl:for-each select="html:ul/html:li">
	      <xsl:text>- </xsl:text>
    		 <xsl:apply-templates select="." mode="print"/>
    		 	      <xsl:text>&#10;</xsl:text>
	    </xsl:for-each>
      		<xsl:text>&#10;&#10;</xsl:text>  

  </xsl:template>


</xsl:stylesheet>
