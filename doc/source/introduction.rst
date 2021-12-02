Introduction
============

Cette documentation décrit le langage LHÉO, qui permet de décrire de manière structurée et normalisée un flux d'offre de formations. Ce langage a été conçu afin d'échanger des données sur l'offre de formation entre les systèmes d'information des différents acteurs du champ de la formation professionnelle: organismes de formation, financeurs, diffuseurs.

Actuellement en version 2.3, les principaux changements de cette version sont décrits dans le chapitre :ref:`changements`.

Une version `PDF <lheo.pdf>`_ de cette documentation est également disponible.

Schémas XML
-----------

Actuellement implémenté en XML, il est matérialisé par les éléments techniques suivants:

- une DTD: `lheo.dtd <lheo.dtd>`_
- un schema XML: `lheo.xsd <lheo.xsd>`_

Ce langage est décrit dans le chapitre :ref:`lheo-langage`. La structure générale d'un fichier XML au format LHÉO est présentée dans le fichier exemple: `lheo-exemple.xml <lheo-exemple.xml>`_

.. _tables_reference_referentiels:

Tables de référence et référentiels externes
--------------------------------------------

Le langage utilise une série de tables de référence (:ref:`tables`), fournissant des listes fermées de valeurs normalisées pour certains concepts. Un fichier XML (`lheo-tables.xml <lheo-tables.xml>`_) contient une représentation structurée de ces tables.

Le langage utilise également plusieurs référentiels externes:

- le `Code Officiel Géographique (COG) <https://www.insee.fr/fr/information/2560452>`_ de l'INSEE contenant la liste des communes (:ref:`code-INSEE-commune`, :ref:`ville`), cantons (:ref:`code-INSEE-canton`), départements (:ref:`departement`),  régions (:ref:`region`) et pays (:ref:`pays`, :ref:`langue-formation`),
- le `Formacode <https://formacode.centre-inffo.fr>`_ dans l'élément :ref:`code-FORMACODE`
- la `Nomenclature des spécialités de formation (NSF) <https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000006526701>`_ dans l'élément :ref:`code-NSF`
- le `Répertoire Opérationnel des Métiers et des Emplois (ROME) <https://www.pole-emploi.fr/employeur/vos-recrutements/le-rome-et-les-fiches-metiers.html>`_ dans l'élément :ref:`code-ROME`
- le `RNCP <https://www.francecompetences.fr/recherche_certificationprofessionnelle/>`_ dans l'élément :ref:`code-RNCP`
- le `Répertoire Spécifique (RS) <https://www.francecompetences.fr/fiche/comment-une-demande-denregistrement-au-rsch-est-elle-evaluee/>`_ dans l'élément :ref:`code-RS`
- le `CPF <https://www.moncompteformation.gouv.fr/>`_ dans l'élément :ref:`code-CPF`
- le code `ELU <https://www.moncompteformation.gouv.fr/>`_ dans l'élément :ref:`code-ELU`
- la base `CertifInfo <https://www.certifinfo.org/>`_ dans l'élément :ref:`code-CERTIFINFO`

Afin de garantir la qualité des adresses utilisées dans les offres de formation, l'utilisation de la `Base Adresse Nationale (BAN) <https://www.data.gouv.fr/fr/datasets/base-adresse-nationale/>`_ est recommandée. La base `SIRENE de l'INSEE <https://www.data.gouv.fr/fr/datasets/base-sirene-des-entreprises-et-de-leurs-etablissements-siren-siret/>`_ devrait également être utilisée pour les numéros SIREN/SIRET des entreprises et leurs dénominations officielles.

Glossaire
---------

Le langage utilise également le :ref:`glossaire` destiné à expliciter les termes du champ de la formation. Ce glossaire est également disponible sous la forme d'une page unique au format HTML: `lheo-glossaire.html <lheo-glossaire.html>`_

.. _identifiants:

Identifiants
------------

Des attributs présents sur tous les éléments de LHÉO peuvent être utilisés en tant qu'identifiant:

- ``@numero``: texte. Peut contenir n'importe quel texte et n'a pas besoin d'être unique.
- ``@id``: ID. Le type de données ID ne peut pas être numérique uniquement et ne doit pas contenir d'espace (il est de type ``xml:id`` `https://www.w3.org/TR/xml-id <https://www.w3.org/TR/xml-id/>`_). Il doit être unique dans tout le document XML. L'attribut ``@idref``, de type ``xml:id`` également, doit faire référence à un attribut ``@id`` existant ailleurs dans le document XML.
- ``@uri``: attribut de type ``xs:anyURI`` (`https://www.w3.org/TR/xmlschema11-2/#anyURI <https://www.w3.org/TR/xmlschema11-2/#anyURI>`_), sans contrainte d'unicité.

L'élément :ref:`identifiant-module` permet également de créer un identifiant pour une formation, mais cet identifiant est normalement réservé au contexte de la modularisation.