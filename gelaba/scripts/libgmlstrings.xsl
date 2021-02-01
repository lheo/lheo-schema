<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:gml="http://www.gelaba.org/gml/1.1"
		version="1.0">

  <xsl:output method="text" encoding="utf-8" />

  <xsl:template name="str_gmldef">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>GML definition of </xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Définition GML de </xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_space">
    <xsl:text> </xsl:text>
  </xsl:template>

  <xsl:template name="str_element">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Element</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Élément</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_description">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Description</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Description</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_attributes">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Attributes</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Attributs</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_attribute">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Attribute</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Attribut</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_name">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Name</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Nom</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_type">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Type</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Type</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_value">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Value</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Valeur</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_fullname">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Fullname</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Libellé</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_format">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Format</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Format</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_dateformat">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>YYYYMMDD</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>AAAAMMJJ</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>


  <xsl:template name="str_contenttype">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Content type</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Type de contenu</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_integer">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Integer number</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Nombre entier</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_float">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Real number</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Nombre réel</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_date">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Date</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Date</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_text">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Text</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Texte</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_key">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Key</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Clé</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_embedded_key">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Embedded key</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Clé intégrée</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_id">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Identifier</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Identificateur</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_idref">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Identifier reference</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Référence à un identificateur</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_data">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Raw data</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Données brutes</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_dictionary">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Dictionary</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Dictionnaire</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_content">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Content</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Contenu</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_sequence">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Ordered sequence</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Séquence ordonnée</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_fullsequence">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>This element contains an ordered sequence.</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Cet élément contient une séquence ordonnée</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_choice">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Authorized elements</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Éléments autorisés</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_fullchoice">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>This element can contain one element among several authorized elements.</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Cet élément peut contenir un élément parmi plusieurs éléments autorisés.</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_mixed">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Authorized elements</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Éléments autorisés</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_fullmixed">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>This element can contain one element among several authorized elements.</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Cet élément peut contenir un élément parmi plusieurs éléments autorisés.</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_tree">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Tree structure</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Structure d'arbre</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_empty">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Empty element</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Élément vide</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_min">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Min</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Min</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_max">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Max</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Max</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_dtd_element">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>DTD element</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Élément de DTD</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_node">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Node</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Noeud</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_leaf">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Leaf</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Feuille</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_vmin">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Minimum value</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Valeur minimale</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_vmax">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Maximal value</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Valeur maximale</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_lgmin">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Minimum length</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Longueur minimale</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_lgmax">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Maximal length</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Longueur maximale</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_pname">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Property</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Propriété</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_pval">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Property value</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Valeur de propriété</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_pdata">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Property data</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Données de propriété</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_pdoc">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Property description</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Description de propriété</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_yes">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>yes</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>oui</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_no">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>no</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>non</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_regexp">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>no</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>non</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_colon">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>: </xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text> : </xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_repeat">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Repeat</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Répétition</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_namespace">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Namespace</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Espace de noms</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="str_default_root">
    <xsl:choose>
      <xsl:when test="$lang='en'">
	<xsl:text>Default root</xsl:text>
      </xsl:when>
      <xsl:when test="$lang='fr'">
	<xsl:text>Racine par défaut</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>