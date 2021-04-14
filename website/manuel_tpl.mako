# -*- coding: utf-8 -*-
<%inherit file="../site.mako"/>

<!-- HEADER -->
<div class="bs-docs-header dev-bloc" id="content" tabindex="-1">
    <div class="container">
        <h1 class="titre-langage">Manuel Lhéo 2.3</h1>

        <p>
            Guide d'utilisation du format XML de Lhéo
        </p>

        <div id="dev-pix">
            <img src="/static/img/backgrounds/dev.png" alt="illustration univers développeurs">
        </div>
    </div>
</div>

<!-- ScrollToTop Button -->
<a class="bloc-button btn btn-d scrollToTop" onclick="scrollToTarget('1')">
    <span class="fa fa-chevron-up"></span>
</a>
<!-- ScrollToTop Button END-->


<div class="container devdoc">
    <div class="row">
        <div class="col-md-3">
            <div data-spy="affix" data-offset-top="550" data-offset-bottom="555"
                 class="bs-sidebar hidden-print well affix-top hidden-xs hidden-sm side-menu" id="doc-navmenu"
                 role="complementary">
                <ul class="nav bs-sidenav">
                    <li class="main active"><a href="#introduction">Introduction</a></li>
                    <li class=""><a href="#lheo-xml">Format XML de Lhéo</a></li>
                    <li class=""><a href="#attributs">Attributs</a></li>
                    <li class=""><a href="#premier-cercle">Premier cercle</a></li>
                    <li class=""><a href="#deuxieme-cercle">Deuxième cercle</a></li>
                    <li class=""><a href="#troisieme-cercle">Éléments d'extension</a></li>
                    <li class=""><a href="#structure">Éléments structurants</a></li>
                    <li class=""><a href="#detail">Détail des éléments</a></li>
                    <li class=""><a href="#tables">Liste de valeurs fermées</a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-9" role="main">
            <h1 id="introduction">Introduction</h1>

            <p>
                Lhéo est un dialecte XML de description de l'information sur l'offre
                de formation. Ce langage permet d'exprimer de façon cohérente une
                action de formation qui peut ensuite être lue, diffusée, classée et
                décrite par le plus grand nombre.
            </p>

            <p>
                Lhéo se compose de schémas (grammaires XML), d'un glossaire et de
                tables de références représentés sous la forme de fichiers XML. Il est
                accompagné par des outils (scripts, exemples) qui facilitent sa mise
                en oeuvre dans les systèmes informatiques existants et réduisent les
                coûts d'intégration.
            </p>

            <p>
                L'objectif de Lhéo est de proposer un langage de référence de l'offre
                de formation lisible prioritairement par le grand public et adapté aux
                besoins des prescripteurs et des financeurs. Il renforce l'efficacité
                des nombreux réseaux qui opèrent au service du public et permet de
                développer des portails cohérents et suffisamment exhaustifs sur
                l'offre de formation de portée nationale ou régionale.
            </p>

            <p>
                L'application de Lhéo est prévue en deux temps. Elle concerne d'abord
                l'offre relevant de la commande publique: État, collectivités
                territoriales et partenaires sociaux, puis, après concertation, pourra
                être généralisée à toutes les offres de formation (éducation
                nationale, entreprise, ...).
            </p>

            <p>
                Le langage est structuré en deux cercles d'informations normatifs,
                permettant de renseigner un nombre minimal mais commun
                d'informations. Ces deux cercles peuvent être complétés par des
                éléments d'extension dont le contenu est libre, pouvant ainsi être
                adapté aux besoins de chaque structure.
            </p>

            <p>
                Le premier cercle d'informations est le «noyau dur» du référentiel
                Lhéo: il contient les informations minimales communes qui sont
                systématiquement présentes dans la description de toute offre de
                formation. La présence de ces données est exigée depuis la collecte
                des offres (appel à projets) jusqu'à la diffusion de l'information
                recueillie dans les catalogues d'offres de formation. Dans le format XML représentant
                Lhéo, il s'afit de tous les éléments obligatoires.
            </p>

            <p>
                Le deuxième cercle d'informations complète le noyau dur. Les données
                qui y sont décrites peuvent également être exigées, dans la phase
                d'appel à projets, par tout commanditaire partenaire de la démarche
                Lhéo. Toutefois, pour diffuser l'information sur les offres, la
                présence des données du second cercle n'est pas obligatoire. Cette
                mesure permet aux commanditaires d'adapter la publication de leur
                catalogue d'offres à leur politique de communication. Dans le format XML de Lhéo, ces informations
                sont présentes sous la forme d'éléments optionnels.
            </p>

            <p>
                Au delà de ces deux cercles d'information, chaque structure peut
                étendre ce référentiel par des données supplémentaires, en fonction de
                sa stratégie, de ses objectifs, de ses spécificités et de ses besoins
                de gestion. Ces informations supplémentaires peuvent être ajoutées par
                le biais des éléments <code>&lt;extras&gt;</code> qui
                se trouvent à plusieurs endroits de la représentation XML de LHÉO.
            </p>


            <h2 id="lheo-xml">Le format XML de Lhéo</h2>

            <p>La DTD complète de Lhéo est disponible à l'URL&nbsp;:
                <a href="/2.3/lheo.dtd">http://www.lheo.org/2.3/lheo.dtd</a>.</p>

            <p>Le schéma XML W3C de Lhéo est disponible à l'URL&nbsp;:
                <a href="/2.3/lheo.xsd">http://www.lheo.org/2.3/lheo.xsd</a>.</p>

            <p>Ces deux grammaires permettent d'avoir deux niveaux de
                validation différents. La DTD ne procède qu'à une validation
                structurelle alors que le schéma XML W3C teste également la
                validité du contenu des éléments (uniquement le type de
                données).</p>

            <p>
                L'élément racine par défaut d'un document en XML LHÉO est
                l'élément <code>&lt;lheo&gt;</code>.
            </p>

            <h2 id="attributs">Attributs</h2>

            <p>
                Tous les éléments composant le langage XML LHÉO possèdent des attributs XML identiques.
                Ces attributs sont les suivants, ici exprimés avec le formalisme DTD :
            </p>
            <pre>xmlns CDATA #FIXED 'http://www.lheo.org/2.3'
numero CDATA #IMPLIED
info CDATA #IMPLIED
ref CDATA #IMPLIED
id ID #IMPLIED
idref IDREF #IMPLIED
tag CDATA #IMPLIED</pre>

            <p>Hormis pour l'attribut <code>xmlns</code> qui a une
                valeur fixe, le contenu de ces attributs n'est pas normalisé et
                peut-être utilisé librement pour des besoins de gestion ou pour
                coder des informations supplémentaires. Les applications
                traitant le format XML de Lhéo peuvent ignorer complètement ces
                informations.
            </p>

            ~elements_premier_cercle~

            ~elements_deuxieme_cercle~

            ~elements_extension~

            ~elements_structurants~

            <h2 id="detail">Détail des éléments</h2>

            <p>
                Nous présentons ci-dessous la liste des éléments XML du langage LHÉO. Lorsque l'élément
                contient une séquence ordonnée, chaque élément de la séquence est précédé par un
                intervalle donnant le nombre minimal et maximal de répétitions successives d'un élément.
                Par exemple [0,1] signifie que l'élément est optionnel (nombre minimal d'éléments à 0 et
                maximal à 1). [1,1] signifie que l'élément est obligatoire, [0,3] qu'il peut être répété
                de 0 à 3 fois. Quand le nombre de répétition n'est pas borné, on utilise la lettre N
                pour signifier que l'élément peut être répété un nombre arbitraire de fois. Ainsi, [1,N]
                signifie que l'élément peut être répété autant de fois qu'on le désire.
            </p>
            ~detail_elements~

            <h2 id="tables">Liste de valeurs fermées (tables)</h2>

            <p>
                Le fichier XML complet contenant toutes les tables se trouve à l'adresse&nbsp;:
                <a href="http://lheo.org/2.3/lheo-tables.xml">http://www.lheo.org/2.3/lheo-tables.xml</a>.
                Voici la liste des tables&nbsp;:
            </p>
            ~tables~
        </div>
    </div>
</div>