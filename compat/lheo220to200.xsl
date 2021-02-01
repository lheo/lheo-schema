<?xml version="1.0" encoding="utf-8"?>
<!--
Permet de passer de LHEO-Index 2.2 a LHEO-Index 2.0.0
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns="http://www.lheo.org/2.0"
        xmlns:lheo22="http://www.lheo.org/2.2"
                version="1.0">
    
    <xsl:variable name="lcase" 
        select="'abcdefghijklmnopqrstuvwxyzéèêëÉÈÊËàâäÀÂÄçôöÔÖÛûüÜïÏ'" />
    <xsl:variable name="ucase" 
        select="'ABCDEFGHIJKLMNOPQRSTUVWXYZEEEEEEEEAAAAAACOOOOUUUUII'" />
    
    <xsl:output method="xml" encoding="utf-8"/>
    
    <!-- Indentité (par défaut on copie tout) -->
    <xsl:template match="*">
        <xsl:element name="{name(.)}">
            <xsl:for-each select="@*">
                <xsl:if 
                  test="not(name(.)='datecrea') and not(name(.)='datemaj')">
                    <xsl:attribute name="{name(.)}">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:if>
            </xsl:for-each>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="lheo22:resume-offre">
        <xsl:element name="resume-offre">
        <xsl:for-each select="@*">
            <xsl:if 
              test="not(name(.)='datecrea') and not(name(.)='datemaj')">
                <xsl:attribute name="{name(.)}">
                    <xsl:value-of select="."/>
                </xsl:attribute>
            </xsl:if>
        </xsl:for-each>
        <xsl:apply-templates select="lheo22:domaine-formation"/>
        <xsl:apply-templates select="lheo22:intitule-formation"/>
        <xsl:apply-templates select="lheo22:nom-organisme"/>
        <xsl:apply-templates select="lheo22:SIRET"/>
        <xsl:apply-templates select="lheo22:code-postal"/>
        <xsl:apply-templates select="lheo22:code-INSEE-commune"/>
        <xsl:apply-templates select="lheo22:ville"/>
        <xsl:apply-templates select="lheo22:departement"/>
        <xsl:apply-templates select="lheo22:region"/>
        <xsl:apply-templates select="lheo22:certifiante"/>
        <xsl:apply-templates select="lheo22:code-niveau-entree"/>
        <xsl:apply-templates select="lheo22:prise-en-charge-frais-possible"/>
        <xsl:apply-templates select="lheo22:modalites-enseignement"/>
        <xsl:call-template name="get_one_code">
            <xsl:with-param name="pos" select="." />
        </xsl:call-template>
        <xsl:apply-templates select="lheo22:nombre-heures-total"/>
        <xsl:apply-templates select="lheo22:session"/>
        <xsl:apply-templates select="lheo22:contact-formation-resume"/>
        <xsl:apply-templates select="lheo22:certification"/>
        <xsl:apply-templates select="lheo22:extras"/>
        </xsl:element>
    </xsl:template>
    
    <!-- Ces elements ne sont pas en LHEO-Index 2.0 -->
    <xsl:template match="lheo22:adresse-inscription" />
    <xsl:template match="lheo22:modalites-inscription" />
    <xsl:template match="lheo22:periode-inscription" />
    <xsl:template match="lheo22:etat-recrutement" />
    
    <xsl:template name="get_one_code">
        <xsl:param name="pos" />
        <xsl:variable name="codes">
            <xsl:for-each select="$pos//lheo22:code-public-vise[@ref='V10']">
                <xsl:variable name="code" select="text()"/>
                <xsl:choose>
                    <!-- TOUT PUBLIC -->
                    <xsl:when test="$code='83056'">
                        <xsl:text>80056</xsl:text>
                    </xsl:when>
                    <!-- EN EMPLOI -->
                    <xsl:when test="$code='82058' or $code='82044'"> 
                        <xsl:text>80044</xsl:text>
                    </xsl:when>
                    <!-- SANS EMPLOI -->
                    <xsl:when test="$code='80001' or $code='80006'"> 
                        <xsl:text>80011</xsl:text>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
            <xsl:for-each select="$pos//lheo22:code-public-vise[@ref='V9']">
                <xsl:variable name="code" select="text()"/>
                <xsl:choose>
                    <!-- TOUT PUBLIC -->
                    <xsl:when test="$code='80056'">
                        <xsl:text>80056</xsl:text>
                    </xsl:when>
                    <!-- EN EMPLOI -->
                    <xsl:when test="$code='80044'">
                        <xsl:text>80044</xsl:text>
                    </xsl:when>
                    <!-- SANS EMPLOI -->
                    <xsl:when test="$code='80011'">
                        <xsl:text>80011</xsl:text>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
        </xsl:variable>
        <!-- Prend un seul code de la liste, le premier. -->
        <xsl:element name="code-public-vise">
            <xsl:attribute name="ref">V9</xsl:attribute> <!-- Force V9 -->
            <xsl:choose>
                <xsl:when test="string-length($codes)>5">
                    <xsl:value-of select="substring($codes,1,5)"/>
                </xsl:when>
                <xsl:when test="string-length($codes)=5">
                    <xsl:value-of select="$codes"/>
                </xsl:when>
                <xsl:otherwise>
                    <!--
                    <xsl:variable name="codesdebug">
                    <xsl:for-each select="$pos//lheo22:code-public-vise[@ref='V10']">
                        <xsl:value-of select="text()" />
                    </xsl:for-each>
                </xsl:variable>
                    <xsl:text>80056/[</xsl:text><xsl:value-of select="$codesdebug"/>
                    <xsl:text>]</xsl:text>
                    -->
                    <xsl:text>80056</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>

    <xsl:template match="text()">
        <xsl:value-of select="normalize-space(.)"/>
    </xsl:template>

    <xsl:template match="lheo22:codes-NSF[count(lheo22:code-NSF)=0]" />

</xsl:stylesheet>

