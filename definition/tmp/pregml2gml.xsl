<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns="http://www.gelaba.org/gml/1.0"
		version="1.0">

  <xsl:param name="doctables" select="''"/>
  <xsl:param name="lang" select="'fr'"/>

  <xsl:output method="xml" encoding="utf-8" indent="yes" doctype-system="gml.dtd"/>

  <xsl:template match="definitions">
    <definitions 
	language="lheo"
	namespace="http://www.lheo.org/{@version}"
	xml:lang="fr"
	default_root="lheo">
      <xsl:apply-templates select="definition"/>
      <xsl:apply-templates select="definition-base"/>
      <xsl:call-template name="common_definitions"/>
      <xsl:call-template name="tables"/>
      <xsl:apply-templates select="@*" mode="props"/>      
    </definitions>
  </xsl:template>

  <xsl:template match="definition-base | definition">
    <xsl:comment>
      <xsl:text>  </xsl:text>
      <xsl:value-of select="motcle"/>
      <xsl:text>  </xsl:text>
    </xsl:comment>
    <definition name="{motcle}">
      <xsl:apply-templates select="libelle"/>
      <xsl:apply-templates select="commentaire"/>
      <xsl:apply-templates select="." mode="type"/>
      <xsl:call-template name="common_attributes"/>
      <xsl:apply-templates select="aspect"/>
      <xsl:apply-templates select="exemple-contenu"/>
      <xsl:apply-templates select="@type" mode="props"/>
      <xsl:apply-templates select="@cercle" mode="props"/>
      <xsl:apply-templates select="@racine" mode="props"/>
      <xsl:apply-templates select="@atomique" mode="props"/>
      <xsl:apply-templates select="glossaire" mode="props"/>
    </definition>
  </xsl:template>

  <xsl:template name="tables">
    <xsl:apply-templates select="document($doctables)/tables/table"/>
  </xsl:template>

  <xsl:template match="table">
    <dict name="dict-{@id}">
      <xsl:apply-templates select="titre"/>
      <xsl:apply-templates select="entree"/>
      <xsl:if test="@extrait='oui'">
	<property name="gml:service" value="dict-{@id}.xml" />
      </xsl:if>
    </dict>
  </xsl:template>

  <xsl:template match="definition-base | definition" mode="type">

    <xsl:choose>
      <xsl:when test="@type='alpha'">
	<element_type>
	  <xsl:element name="basic_text">
	    <xsl:if test="longueur/@min">
	      <xsl:attribute name="lgmin">
		<xsl:value-of select="longueur/@min" />
	      </xsl:attribute>
	    </xsl:if>
	    <xsl:if test="longueur/@max">
	      <xsl:attribute name="lgmax">
		<xsl:value-of select="longueur/@max" />
	      </xsl:attribute>
	    </xsl:if>
	  </xsl:element>
	</element_type>
      </xsl:when>

      <xsl:when test="@type='num'">
	<element_type>
	  <xsl:element name="basic_text">
	    <xsl:if test="longueur/@min">
	      <xsl:attribute name="lgmin">
		<xsl:value-of select="longueur/@min" />
	      </xsl:attribute>
	    </xsl:if>
	    <xsl:if test="longueur/@max">
	      <xsl:attribute name="lgmax">
		<xsl:value-of select="longueur/@max" />
	      </xsl:attribute>
	    </xsl:if>
	  </xsl:element>
	</element_type>
      </xsl:when>

      <xsl:when test="@type='sequence'">
	<element_type>
	  <xsl:element name="sequence">
	    <xsl:for-each select="sequence/element">
	      <element name="{.}">
		<xsl:if test="@optionnel='1' or @optionnel='2'">
		  <xsl:attribute name="min">0</xsl:attribute>
		  <xsl:attribute name="max">1</xsl:attribute>
		</xsl:if>
	      </element>
	    </xsl:for-each>
	  </xsl:element>
	</element_type>
      </xsl:when>

      <xsl:when test="@type='basic'">
	<element_type>
	  <xsl:element name="sequence">
	    <element name="{typedebase}">
	      <xsl:attribute name="min">1</xsl:attribute>
	      <xsl:attribute name="max">1</xsl:attribute>
	    </element>
	  </xsl:element>
	</element_type>
      </xsl:when>

      <xsl:when test="@type='bool'">
	<element_type>
	  <xsl:element name="basic_int">
	    <xsl:attribute name="vmin">0</xsl:attribute>
	    <xsl:attribute name="vmax">1</xsl:attribute>
	  </xsl:element>
	</element_type>
      </xsl:when>

      <xsl:when test="@type='date'">
	<element_type>
	  <xsl:element name="basic_text">
	    <xsl:attribute name="lgmin">10</xsl:attribute>
	    <xsl:attribute name="lgmax">10</xsl:attribute>
	  </xsl:element>
	</element_type>
      </xsl:when>

      <xsl:when test="@type='reel'">
	<element_type>
	  <xsl:element name="basic_float">
	    <xsl:attribute name="vmin">0</xsl:attribute>
	    <xsl:choose>
	      <xsl:when test="longueur/@max=8">
		<xsl:attribute name="vmax">99999999</xsl:attribute>
	      </xsl:when>
	      <xsl:when test="longueur/@max=4">
		<xsl:attribute name="vmax">9999</xsl:attribute>
	      </xsl:when>
	    </xsl:choose>
	  </xsl:element>
	</element_type>
      </xsl:when>

      <xsl:when test="@type='liste'">
	<element_type>
	  <xsl:element name="sequence">
	    <element name="{elementdeliste}">
	      <xsl:if test="longueur/@min">
		<xsl:attribute name="min">
		  <xsl:value-of select="longueur/@min" />
		</xsl:attribute>
	      </xsl:if>
	      <xsl:if test="longueur/@max">
		<xsl:attribute name="max">
		  <xsl:choose>
		    <xsl:when test="longueur/@max = '-1'">
		      <!-- 0 means infinity in GML -->
		      <xsl:text>0</xsl:text>
		    </xsl:when>
		    <xsl:otherwise>
		      <xsl:value-of select="longueur/@max" />
		    </xsl:otherwise>
		  </xsl:choose>
		</xsl:attribute>
	      </xsl:if>
	    </element>
	  </xsl:element>
	</element_type>
      </xsl:when>

	<xsl:when test="@type='reference'">
	  <element_type>
	    <xsl:element name="empty" />
	  </element_type>
	</xsl:when>

	<xsl:when test="@type='any'">
	  <element_type>
	    <choice min="0" max="0">
	      <choice_element name="extras" /> 
	      <choice_element name="extra" />
	    </choice>
	  </element_type>
	</xsl:when>

	<xsl:when test="@type='code'">
	  <element_type>
	    <basic_key ref="dict-{table}"/>
	  </element_type>
	</xsl:when>

	<xsl:otherwise>
	  <xsl:message terminate="yes">
	    <xsl:text>ERROR: unknown type "</xsl:text>
	    <xsl:value-of select="@type"/>
	    <xsl:text>"</xsl:text>
	  </xsl:message>
	</xsl:otherwise>
      </xsl:choose>

  </xsl:template>

  <xsl:template match="libelle|titre">
    <fullname xml:lang="{$lang}">
      <xsl:value-of select="normalize-space(.)" />
    </fullname>
  </xsl:template>

  <xsl:template match="commentaire">
    <doc xml:lang="{$lang}"><xsl:apply-templates select="p" /></doc>
  </xsl:template>

  <xsl:template match="p">
    <xsl:value-of select="normalize-space(.)" />
  </xsl:template>

  <xsl:template match="aspect|exemple-contenu">
    <property name="{name(.)}" value="{normalize-space(.)}" />
  </xsl:template>

  <xsl:template match="entree">
    <entry>
      <xsl:apply-templates select="cle"/>
      <xsl:apply-templates select="valeur"/>
    </entry>
  </xsl:template>

  <xsl:template match="valeur">
    <value xml:lang="{$lang}" val="{normalize-space(.)}" />
  </xsl:template>

  <xsl:template match="cle">
    <key val="{normalize-space(.)}" />
  </xsl:template>

  <xsl:template match="text()|@*"/>

  <xsl:template match="@*" mode="props">
    <property name="{name(.)}" value="{normalize-space(.)}" />
  </xsl:template>

  <xsl:template match="glossaire" mode="props">
    <property name="{name(.)}" value="{normalize-space(.)}" />
  </xsl:template>

  <xsl:template name="common_attributes">
     <attribute name="numero" type="optional">
	<attribute_type>
	  <attribute_text/>
	</attribute_type>
      </attribute>
     <attribute name="info" type="optional">
	<attribute_type>
	  <attribute_text/>
	</attribute_type>
      </attribute>
     <attribute name="ref" type="optional">
	<attribute_type>
	  <attribute_text/>
	</attribute_type>
      </attribute>
      <attribute name="id" type="optional">
	<attribute_type>
	  <attribute_id/>
	</attribute_type>
      </attribute>
  </xsl:template>

  <xsl:template name="common_definitions">
    <definition name="extras">
      <element_type>
	<choice min="0" max="0">
	  <choice_element name="extras" /> 
	  <choice_element name="extra" />
	</choice>
      </element_type>
      <xsl:call-template name="common_attributes"/>
    </definition>
    <definition name="extra">
      <element_type>
	<basic_data/>
      </element_type>      
      <xsl:call-template name="common_attributes"/>
    </definition>
  </xsl:template>

  <xsl:template match="listeexemples">
    <examples xml:lang="fr">
      <xsl:apply-templates select="exemples" />
    </examples>
  </xsl:template>

  <xsl:template match="exemples">
    <xsl:apply-templates select="ex" />
  </xsl:template>

  <xsl:template match="ex">
    <example name="{../@balise}" valid="yes">
      <example_content>
	<xsl:value-of select="." />
      </example_content>
    </example>
  </xsl:template>

</xsl:stylesheet>
