<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:gml="http://www.gelaba.org/gml/1.1"
                xmlns:html="http://www.w3.org/1999/xhtml">

    <xsl:output method="html" encoding="utf-8" indent="no" omit-xml-declaration="yes"/>

    <xsl:param name="urlglossaire" select="''"/>
    <xsl:param name="fichierglossaire" select="''"/>
    <xsl:param name="mode" select="'tables'"/>
    <xsl:variable name="docglossaire" select="document($fichierglossaire)"/>

    <xsl:template match="/">
        <xsl:variable name="urlversion">
            <xsl:value-of select="gml:definitions/gml:property[@name='glb:baseurl']/@value"/>
            <xsl:text>/</xsl:text>
            <xsl:value-of select="gml:definitions/@version"/>
        </xsl:variable>
        <xsl:variable name="defns" select="gml:definitions/@default_ns_prefix"/>
        <xsl:variable name="ns" select="gml:definitions/gml:namespace[@ns_prefix=$defns]/@href"/>

        # -*- coding: utf-8 -*-

        <!-- pb for writing the following line because of the '%'
            <%inherit file="../site.mako"/>\
        -->

        <!-- Main container -->
        <div class="page-container">
            <!-- bloc-35 -->
            <div class="bloc bgc-ube bg-city-overlay d-bloc" id="bloc-35">
                <div class="container bloc-lg">
                    <div class="row">
                        <div class="col-sm-12">
                            <h1 class="mg-md  tc-white">
                                <xsl:value-of select="gml:definitions/gml:property[@name='lheo:longversion']/@value"/>
                            </h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <ul class="list-unstyled">
                                <li>
                                    <h6 class=" mg-sm tc-white">
                                        FPI
                                    </h6>
                                </li>
                                <li>
                                    <h6 class=" mg-sm tc-white">
                                        URL de base de la version
                                    </h6>
                                </li>
                                <li>
                                    <h6 class=" mg-sm tc-white">
                                        XMLNS
                                    </h6>
                                </li>
                                <li>
                                    <h6 class=" mg-sm tc-white">
                                        DTD
                                    </h6>
                                </li>
                                <li>
                                    <h6 class=" mg-sm tc-white">
                                        XSD
                                    </h6>
                                </li>
                            </ul>
                        </div>
                        <div class="col-sm-6">
                            <ul class="list-unstyled">
                                <li>
                                    <h6 class=" mg-sm tc-white">
                                        <xsl:value-of select="gml:definitions/gml:property[@name='glb:FPI']/@value"/>
                                    </h6>
                                </li>
                                <li>
                                    <!--<a href="{gml:definitions/@version}">-->
                                        <h6 class=" mg-sm tc-white">
                                            <xsl:value-of select="$urlversion"/>
                                        </h6>
                                    <!--</a>-->
                                </li>
                                <li>
                                    <h6 class=" mg-sm tc-white">
                                        <xsl:value-of select="$ns"/>
                                    </h6>
                                </li>
                                <li>
                                    <a href="{gml:definitions/@version}/lheo.dtd">
                                        <h6 class=" mg-sm tc-white">
                                            lheo.dtd
                                        </h6>
                                    </a>
                                </li>
                                <li>
                                    <a href="{gml:definitions/@version}/lheo.xsd">
                                        <h6 class=" mg-sm tc-white">
                                            lheo.xsd
                                        </h6>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- bloc-35 END -->

            <!-- bloc-36 -->
            <div class="bloc bgc-white l-bloc" id="bloc-36">
                <div class="container bloc-lg">
                    <div class="row">
                        <div class="col-sm-12">
                            <h1 class="mg-md  tc-dark-slate-blue">
                                Liste des éléments XML
                            </h1>
                            <h2 class="mg-md  tc-olive-drab-7">
                                Nous présentons ci-dessous la liste les éléments XML du langage LHÉO. Lorsque l'élément
                                contient une séquence ordonnée, chaque élément de la séquence est précédé par un
                                intervalle donnant le nombre minimal et maximal de répétitions successives d'un élément.
                                Par exemple [0,1] signifie que l'élément est optionnel (nombre minimal d'éléments à 0 et
                                maximal à 1). [1,1] signifie que l'élément est obligatoire, [0,3] qu'il peut être répété
                                de 0 à 3 fois. Quand le nombre de répétition n'est pas borné, on utilise la lettre N
                                pour signifier que l'élément peut être répété un nombre arbitraire de fois. Ainsi, [1,N]
                                signifie que l'élément peut être répété autant de fois qu'on le désire.
                            </h2>
                            <div class="divider-h">
                                <span class="divider"></span>
                            </div>
                            <h3 class="mg-md  tc-dark-slate-blue">
                                Attributs
                            </h3>
                            <h2 class="mg-md  tc-olive-drab-7">
                                Tous les éléments composant le langage XML LHÉO possèdent des attributs XML identiques.
                                Ces attributs sont les suivants, ici exprimés avec le formalisme DTD :
                            </h2>
                            <ul class="list-unstyled">
                                <li>
                                    <h2 class=" tc-olive-drab-7 mg-clear">
                                        xmlns CDATA #FIXED '<xsl:value-of select="$ns"/>'
                                    </h2>
                                </li>
                                <li>
                                    <h2 class=" tc-olive-drab-7 mg-clear">
                                        numero CDATA #IMPLIED
                                    </h2>
                                </li>
                                <li>
                                    <h2 class=" tc-olive-drab-7 mg-clear">
                                        info CDATA #IMPLIED
                                    </h2>
                                </li>
                                <li>
                                    <h2 class=" tc-olive-drab-7 mg-clear">
                                        ref CDATA #IMPLIED
                                    </h2>
                                </li>
                                <li>
                                    <h2 class=" tc-olive-drab-7 mg-clear">
                                        id ID #IMPLIED
                                    </h2>
                                </li>
                                <li>
                                    <h2 class=" tc-olive-drab-7 mg-clear">
                                        idref IDREF #IMPLIED
                                    </h2>
                                </li>
                                <li>
                                    <h2 class=" tc-olive-drab-7 mg-clear">
                                        tag CDATA #IMPLIED
                                    </h2>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- bloc-36 END -->

            <!-- bloc-37 -->
            <div class="bloc bgc-anti-flash-white l-bloc tc-dark-slate-blue" id="bloc-37">
                <div class="container bloc-lg">
                    <div class="row">
                        <div class="col-sm-12">
                            <h3 class="mg-md  tc-dark-slate-blue">
                                Éléments du premier cercle d'informations
                            </h3>
                            <h2 class="mg-md  tc-olive-drab-7">
                                C'est le « Noyau dur » du référentiel Lhéo : il contient les informations minimales
                                communes qui sont systématiquement présentes dans la description de toute offre de
                                formation. La présence de ces données est exigée depuis la collecte des offres (appel à
                                projets) jusqu'à la diffusion de l'information recueillie dans les catalogues d'offres
                                de formation.
                            </h2>
                            <div class="row">
                                <div class="col-sm-6">
                                    <ul class="list-unstyled">
                                        <li>
                                            <h4 class="mg-md  tc-outer-space">
                                                Nom de l'élément
                                            </h4>
                                        </li>
                                        <xsl:for-each
                                                select="//gml:definition[gml:property[@name='lheo:cercle']/@value='1']">
                                            <li>
                                                <p>
                                                    <a href="#{@name}" title="{@name}">
                                                        <xsl:value-of select="gml:fullname[@xml:lang='fr']/text()"/>
                                                    </a>
                                                </p>
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                </div>
                                <div class="col-sm-6">
                                    <ul class="list-unstyled">
                                        <li>
                                            <h4 class="mg-md  tc-outer-space">
                                                Balise XML
                                            </h4>
                                        </li>
                                        <xsl:for-each
                                                select="//gml:definition[gml:property[@name='lheo:cercle']/@value='1']">
                                            <li>
                                                <p>
                                                    <code>
                                                        <xsl:text>&lt;</xsl:text>
                                                        <xsl:value-of select="@name"/>
                                                        <xsl:text>&gt;</xsl:text>
                                                    </code>
                                                </p>
                                            </li>
                                        </xsl:for-each>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- bloc-37 END -->

            <!-- bloc-38 -->
            <div class="bloc l-bloc bgc-white tc-dark-slate-blue" id="bloc-38">
                <div class="container bloc-lg">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="row voffset">
                                <div class="col-sm-12">
                                    <h3 class="mg-md  tc-dark-slate-blue">
                                        Éléments du deuxième cercle d'informations
                                    </h3>
                                    <h2 class="mg-md  tc-olive-drab-7">
                                        Il complète le noyau dur. Les données qui y sont décrites peuvent également être
                                        exigées, dans la phase d'appel à projets, par tout commanditaire partenaire de
                                        la démarche Lhéo. Toutefois, pour diffuser l'information sur les offres, la
                                        présence des données du second cercle n'est pas obligatoire. Cette mesure permet
                                        aux commanditaires d'adapter la publication de leur catalogue d'offres à leur
                                        politique de communication.
                                    </h2>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <ul class="list-unstyled">
                                                <li>
                                                    <h4 class="mg-md  tc-outer-space">
                                                        Nom de l'élément
                                                    </h4>
                                                </li>
                                                <xsl:for-each
                                                        select="//gml:definition[gml:property[@name='lheo:cercle']/@value='2']">
                                                    <li>
                                                        <p>
                                                            <a href="#{@name}" title="{@name}">
                                                                <xsl:value-of
                                                                        select="gml:fullname[@xml:lang='fr']/text()"/>
                                                            </a>
                                                        </p>
                                                    </li>
                                                </xsl:for-each>
                                            </ul>
                                        </div>
                                        <div class="col-sm-6">
                                            <ul class="list-unstyled">
                                                <li>
                                                    <h4 class="mg-md  tc-outer-space">
                                                        Balise XML
                                                    </h4>
                                                </li>
                                                <xsl:for-each
                                                        select="//gml:definition[gml:property[@name='lheo:cercle']/@value='2']">
                                                    <li>
                                                        <p>
                                                            <code>
                                                                <xsl:text>&lt;</xsl:text>
                                                                <xsl:value-of select="@name"/>
                                                                <xsl:text>&gt;</xsl:text>
                                                            </code>
                                                        </p>
                                                    </li>
                                                </xsl:for-each>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- bloc-38 END -->

            <!-- bloc-39 -->
            <div class="bloc bgc-anti-flash-white l-bloc tc-dark-slate-blue" id="bloc-39">
                <div class="container bloc-lg">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="row voffset">
                                <div class="col-sm-12">
                                    <div class="row voffset">
                                        <div class="col-sm-12">
                                            <h3 class="mg-md  tc-dark-slate-blue">
                                                Éléments du troisième cercle d'informations
                                            </h3>
                                            <h2 class="mg-md  tc-olive-drab-7">
                                                Au delà de ces deux cercles d'information, chaque structure pourra
                                                étendre ce référentiel par des données supplémentaires, en fonction de
                                                sa stratégie, de ses objectifs, de ses spécificités et de ses besoins de
                                                gestion.
                                            </h2>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <ul class="list-unstyled">
                                                        <li>
                                                            <h4 class="mg-md  tc-outer-space">
                                                                Nom de l'élément
                                                            </h4>
                                                        </li>
                                                        <xsl:for-each
                                                                select="//gml:definition[gml:property[@name='lheo:cercle']/@value='3']">
                                                            <li>
                                                                <p>
                                                                    <a href="#{@name}" title="{@name}">
                                                                        <xsl:value-of
                                                                                select="gml:fullname[@xml:lang='fr']/text()"/>
                                                                    </a>
                                                                </p>
                                                            </li>
                                                        </xsl:for-each>
                                                    </ul>
                                                </div>
                                                <div class="col-sm-6">
                                                    <ul class="list-unstyled">
                                                        <li>
                                                            <h4 class="mg-md  tc-outer-space">
                                                                Balise XML
                                                            </h4>
                                                        </li>
                                                        <xsl:for-each select="//gml:definition[gml:property[@name='lheo:cercle']/@value='3']">
                                                            <li>
                                                                <p>
                                                                    <code>
                                                                        <xsl:text>&lt;</xsl:text>
                                                                        <xsl:value-of select="@name"/>
                                                                        <xsl:text>&gt;</xsl:text>
                                                                    </code>
                                                                </p>
                                                            </li>
                                                        </xsl:for-each>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- bloc-39 END -->

            <!-- bloc-40 -->
            <div class="bloc l-bloc bgc-white tc-dark-slate-blue" id="bloc-40">
                <div class="container bloc-lg">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="row voffset">
                                <div class="col-sm-12">
                                    <div class="row voffset">
                                        <div class="col-sm-12">
                                            <div class="row voffset">
                                                <div class="col-sm-12">
                                                    <h3 class="mg-md  tc-dark-slate-blue">
                                                        Éléments structurants et types de base de LHÉO
                                                    </h3>
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <ul class="list-unstyled">
                                                                <li>
                                                                    <h4 class="mg-md  tc-outer-space">
                                                                        Nom de l'élément
                                                                    </h4>
                                                                </li>
                                                                <xsl:for-each select="//gml:definition[not(gml:property[@name='lheo:cercle'])
                                                                        and not(gml:property[@name='lheo:extension'])]">
                                                                    <li>
                                                                        <p>
                                                                            <a href="#{@name}" title="{@name}">
                                                                                <xsl:value-of
                                                                                        select="gml:fullname[@xml:lang='fr']/text()"/>
                                                                            </a>
                                                                        </p>
                                                                    </li>
                                                                </xsl:for-each>
                                                            </ul>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <ul class="list-unstyled">
                                                                <li>
                                                                    <h4 class="mg-md  tc-outer-space">
                                                                        Balise XML
                                                                    </h4>
                                                                </li>
                                                                <xsl:for-each select="//gml:definition[not(gml:property[@name='lheo:cercle'])
                                                                        and not(gml:property[@name='lheo:extension'])]">
                                                                    <li>
                                                                        <p>
                                                                            <code>
                                                                                <xsl:text>&lt;</xsl:text>
                                                                                <xsl:value-of select="@name"/>
                                                                                <xsl:text>&gt;</xsl:text>
                                                                            </code>
                                                                        </p>
                                                                    </li>
                                                                </xsl:for-each>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- bloc-40 END -->

            <!-- bloc-41 -->
            <div class="bloc bgc-anti-flash-white l-bloc tc-olive-drab-7" id="bloc-41">
                <div class="container bloc-lg">
                    <div class="row voffset">
                        <div class="col-sm-12">
                            <div class="row voffset">
                                <div class="col-sm-12">
                                    <div class="row voffset">
                                        <div class="col-sm-12">
                                            <h3 class="mg-md  tc-dark-slate-blue">
                                                Détail des éléments
                                            </h3>
                                            <xsl:apply-templates
                                                    select="//gml:definition[gml:property[@name='lheo:cercle']/@value='1']"/>
                                            <xsl:apply-templates
                                                    select="//gml:definition[gml:property[@name='lheo:cercle']/@value='2']"/>
                                            <xsl:apply-templates
                                                    select="//gml:definition[gml:property[@name='lheo:cercle']/@value='3']"/>
                                            <xsl:apply-templates select="//gml:definition[not(gml:property[@name='lheo:cercle'])
                                                and not(gml:property[@name='lheo:extension'])]"/>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- bloc-41 END -->

        </div>
    </xsl:template>

    <!-- Détail des éléments -->
    <xsl:template match="gml:definition">
        <div class="description-element">
            <a name="{@name}"/>
            <table class="table-element">
                <tr>
                    <td>
                        <code>
                            <xsl:text>&lt;</xsl:text>
                            <xsl:value-of select="@name"/>
                            <xsl:text>&gt;</xsl:text>
                        </code>
                        <xsl:text></xsl:text>
                        <b>
                            <xsl:apply-templates select="gml:fullname[@xml:lang='fr']"/>
                        </b>
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

                <xsl:apply-templates select="gml:property[@name='lheo:glossaire']"/>

                <!--<xsl:apply-templates select="exemple-contenu"/>-->
                <xsl:variable name="name" select="@name"/>
                <xsl:variable name="references"
                              select="//gml:definition[.//gml:element/@name = $name and not(gml:property[@name='lheo:extension'])] |
		              //gml:definition[.//gml:choice_element/@name = $name and not(gml:property[@name='lheo:extension'])]"/>
                <xsl:if test="count($references)">
                    <tr class="titre">
                        <td>
                            <b>Utilisé dans</b>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <xsl:for-each select="$references">
                                <!--<code>-->
                                    <xsl:text>&lt;</xsl:text>
                                    <a href="#{@name}">
                                        <xsl:value-of select="@name"/>
                                    </a>
                                    <xsl:text>&gt;</xsl:text>
                                <!--</code>-->
                                <xsl:if test="not(position() = last())">
                                    <xsl:text>,</xsl:text>
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
                <xsl:text>Définition dans le glossaire :</xsl:text>
                <a href="{$urlglossaire}#{@value}">
                    <xsl:value-of select="$docglossaire//html:div[@class='entree'][@id=$cur]/html:h3/html:a"/>
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
                <code>
                    <xsl:text>&lt;</xsl:text>
                    <xsl:value-of select="../motcle"/>
                    <xsl:text>&gt;</xsl:text>
                </code>
                <xsl:value-of select="text()"/>
                <code>
                    <xsl:text>&lt;/</xsl:text>
                    <xsl:value-of select="../motcle"/>
                    <xsl:text>&gt;</xsl:text>
                </code>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="gml:definition[gml:element_type/gml:basic_key]" mode="affiche-type">
        <xsl:variable name="ref" select="gml:element_type/gml:basic_key/@ref"/>
        <xsl:text>une clé alphanumérique issue de la table </xsl:text>
        <a href="{$urltables}#{$ref}">
            <xsl:value-of select="//gml:dict[@name=$ref]/gml:fullname[@xml:lang='fr']"/>
        </a>
        <xsl:text>.</xsl:text>
    </xsl:template>

    <xsl:template match="gml:definition[gml:element_type/gml:basic_text]" mode="affiche-type">
        <xsl:variable name="cur" select="gml:element_type/gml:basic_text"/>
        <xsl:text>un texte de </xsl:text>
        <xsl:value-of select="$cur/@lgmin"/>
        <xsl:text> à </xsl:text>
        <xsl:value-of select="$cur/@lgmax"/>
        <xsl:text> caractères alphanumériques.</xsl:text>
    </xsl:template>

    <xsl:template match="gml:definition[gml:element_type/gml:basic_date]" mode="affiche-type">
        <xsl:text>une date au format ISO</xsl:text>
        <code>AAAAMMJJ</code>
        <xsl:text>. Utiliser</xsl:text>
        <code>AAAAMM00</code>
        <xsl:text>pour indiquer un mois,</xsl:text>
        <code>AAAA0000</code>
        <xsl:text>pour indiquer une année et</xsl:text>
        <code>00000000</code>
        <xsl:text>(valeur minimale) ou</xsl:text>
        <code>99999999</code>
        <xsl:text>(valeur maximale) pour indiquer une date inconnue.</xsl:text>
    </xsl:template>

    <xsl:template match="gml:definition[gml:element_type/gml:basic_int]" mode="affiche-type">
        <xsl:variable name="cur" select="gml:element_type/gml:basic_int"/>
        <xsl:text>un entier compris entre </xsl:text>
        <xsl:value-of select="$cur/@vmin"/>
        <xsl:text> et </xsl:text>
        <xsl:value-of select="$cur/@vmax"/>
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
        <xsl:value-of select="gml:element_type/gml:choice/@min"/>
        <xsl:text> à </xsl:text>
        <xsl:apply-templates select="gml:element_type/gml:choice/@max"/>
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
                <xsl:value-of select="."/>
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
                <xsl:when test="@min=1 and @max=1"/>
                <xsl:when test="@min and @max">
                    <xsl:text>[</xsl:text>
                    <xsl:value-of select="@min"/>
                    <xsl:text>,</xsl:text>
                    <xsl:choose>
                        <xsl:when test="@max=0">
                            <xsl:text>N</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="@max"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:text>]</xsl:text>
                </xsl:when>
            </xsl:choose>
            <code>
                <xsl:text>&lt;</xsl:text>
                <xsl:value-of select="@name"/>
                <xsl:text>&gt;</xsl:text>
            </code>
            <xsl:text></xsl:text>
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
            <code>
                <xsl:text>&lt;</xsl:text>
                <xsl:value-of select="@name"/>
                <xsl:text>&gt;</xsl:text>
            </code>
            <xsl:text></xsl:text>
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
