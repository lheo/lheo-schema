LHÉO
====

Cette documentation décrit le langage LHÉO, qui permet de décrire de manière structurée et normalisée un flux d'offre de formations. Ce langage a été conçu afin d'échanger des données sur l'offre de formation entre les systèmes d'information des différents acteurs du champ de la formation professionnelle: organismes de formation, financeurs, diffuseurs.

Actuellement en version 2.3, les principaux changements de cette version sont décrits dans le chapitre :ref:`changements`.

Schémas XML
-----------

Actuellement implémenté en XML, il est matérialisé par les éléments techniques suivants:

- une DTD: `lheo.dtd </2.3/lheo.dtd>`_
- un schema XML: `lheo.xsd </2.3/lheo.xsd>`_

Ce langage est décrit dans le chapitre :ref:`lheo-langage`. La structure générale d'un fichier XML au format LHÉO est présentée dans le fichier exemple: `lheo-exemple.xml </2.3/lheo-exemple.xml>`_

Tables de référence et référentiels externes
--------------------------------------------

Le langage utilise une série de tables de référence (:ref:`tables`), fournissant des listes fermées de valeurs normalisées pour certains concepts. Un fichier XML (`lheo-tables.xml </2.3/lheo-tables.xml>`_) contient une représentation structurée de ces tables.

Le langage utilise également plusieurs référentiels externes:

- le `Formacode <https://formacode.centre-inffo.fr>`_ dans l'élément :ref:`code-FORMACODE`
- la `Nomenclature des spécialités de formation (NSF) <https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000006526701>`_ dans l'élément :ref:`code-NSF`
- le `Répertoire Opérationnel des Métiers et des Emplois (ROME) <https://www.pole-emploi.fr/employeur/vos-recrutements/le-rome-et-les-fiches-metiers.html>`_ dans l'élément :ref:`code-ROME`
- le `RNCP <https://www.francecompetences.fr/recherche_certificationprofessionnelle/>`_ dans l'élément :ref:`code-RNCP`
- le `Répertoire Spécifique (RS) <https://www.francecompetences.fr/fiche/comment-une-demande-denregistrement-au-rsch-est-elle-evaluee/>`_ dans l'élément :ref:`code-RS`
- le `CPF <https://www.moncompteformation.gouv.fr/>`_ dans l'élément :ref:`code-CPF`
- le code `ELU <https://www.moncompteformation.gouv.fr/>`_ dans l'élément :ref:`code-ELU`
- la base `CertifInfo <https://www.certifinfo.org/>`_ dans l'élément :ref:`code-CERTIFINFO`

Glossaire
---------

Le langage utilise également le :ref:`glossaire` destiné à expliciter les termes du champ de la formation. Ce glossaire est également disponible sous la forme d'une page unique au format HTML: `lheo-glossaire.html </2.3/lheo-glossaire.html>`_


.. toctree::
   :maxdepth: 1
   :includehidden:
   :caption: Sommaire:

   changements
   lheo_langage
   tables
   glossaire

