<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns="http://www.gelaba.org/gml/1.1">
  <xsl:output encoding="utf-8" method="xml" doctype-system="gml.dtd" indent="yes"/>

  <xsl:template match="/">
    <dict name="dict-pays">
      <fullname xml:lang="fr">Les noms de pays ISO 3166-1 (source : ISO 2007)</fullname>
      <xsl:for-each select="ISO_3166-1_List_fr/ISO_3166-1_Entry">
	<entry>
	  <key val="{ISO_3166-1_Alpha-2_code}" />
	  <value xml:lang="fr" val="{ISO_3166-1_Country_name}" />
	  <property name="lheo:url" value="http://fr.wikipedia.org/wiki/ISO_3166-1#{ISO_3166-1_Alpha-2_code}" />
	</entry>
      </xsl:for-each>
      <property name="version" value="2007" />
      <property name="wikipedia" value="http://fr.wikipedia.org/wiki/ISO_3166-1" />
      <property name="url" value="http://www.iso.org/iso/fr/country_codes.htm" />
    </dict>
  </xsl:template>
</xsl:stylesheet>