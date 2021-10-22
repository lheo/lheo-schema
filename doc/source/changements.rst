.. _changements:

Changements dans cette version
------------------------------

- Nouveau domaine pour l'espace de noms: `http://lheo.gouv.fr/2.3 <http://lheo.gouv.fr/2.3>`_
- `PEL-27: Précisions sur raison-sociale-formateur <https://gitlab.com/lheo/lheo-schema/-/issues/27>`_
  
  - Précisions dans la documentation de :ref:`raison-sociale`
  - Précisions dans la documentation de :ref:`raison-sociale-formateur`
  
- `PEL-26: Précisions sur nombre-heures-total <https://gitlab.com/lheo/lheo-schema/-/issues/26>`_
  
  - Nouveau titre, *Informations sur le nombre d’heures* devient :ref:`duree-indicative`
  - Précisions dans la documentation de :ref:`duree-indicative`
  - Précisions dans la documentation de :ref:`nombre-heures-total`
  - Suppression de l'entrée du glossaire *Informations sur le nombre d'heures total*
  - Lien de :ref:`nombre-heures-total` avec l'entrée de glossaire :ref:`nombre-heures-total-max-terme`

- `PEL-29: Dates de création, modification et export <https://gitlab.com/lheo/lheo-schema/-/issues/29>`_
  
  - Ajout sur tous les éléments de trois attributs ``horodatage-creation``, ``horodatage-modification``, ``horodatage-export`` de type `dateTime <https://www.w3.org/TR/xmlschema-2/#dateTime>`_
  - Passage au format GML 1.2 pour la représentation du schéma LHÉO, pour le support du type d'attribut ``attribute_datetime``

- `PEL-28: Attribut uri <https://gitlab.com/lheo/lheo-schema/-/issues/28>`_
  
  - Ajout sur tous les éléments d'un attribut ``uri`` de type `anyURI <https://www.w3.org/TR/xmlschema11-2/#anyURI>`_

- `PEL-43: Passage à un code CERTIFINFO jusqu'à 10 caractères <https://gitlab.com/lheo/lheo-schema/-/issues/42>`_

  - Changement de la taille maximale de :ref:`code-CERTIFINFO` de 6 à 10 caractères

- `PEL-34: Nouvel élément SIRET <https://gitlab.com/lheo/lheo-schema/-/issues/34>`_

  - Nouvel élément :ref:`SIRET-lieu-formation`

- `PEL-38: Nouvel élément UAI <https://gitlab.com/lheo/lheo-schema/-/issues/38>`_

  - Nouvelle entrée de glossaire :ref:`uai-terme`
  - Nouveau type de base :ref:`code-UAI`
  - Élément :ref:`code-UAI` optionnel dans :ref:`SIRET-formateur`, :ref:`SIRET-lieu-formation`, :ref:`SIRET-organisme-formation`

- `PEL-39: Nouveaux codes pour les types de référentiels utilisés par la Caisse des dépôts <https://gitlab.com/lheo/lheo-schema/-/issues/40>`_

  - Nouveau type de base :ref:`code-ELU`
  - Nouveau type de base :ref:`code-CPF`
  - Nouveau type de base :ref:`code-RS`
  - Passage de 6 à 10 caractères maximum pour :ref:`code-RNCP`
  - Nouvel élément :ref:`code-type-formation` en cercle 2 dans :ref:`formation`

- `PEL-6: Données de contact <https://gitlab.com/lheo/lheo-schema/-/issues/9>`_

  - Nouveau dictionnaire :ref:`dict-type-contact`
  - Nouvel élément :ref:`type-contact`
  - Nouvel élément :ref:`contact-session`
  - Multivaluation de :ref:`contact-session` (dans :ref:`session`), :ref:`contact-formation` (dans :ref:`formation`), :ref:`contact-organisme` (dans :ref:`organisme-formation-responsable`), :ref:`contact-formateur` (dans :ref:`organisme-formateur`)
  - Mise-à-jour des entrées de glossaire :ref:`contact-offre-terme` et :ref:`contact-organisme-terme`

- `PEL-17: Ajout d'une dénomination dans les adresses <https://gitlab.com/lheo/lheo-schema/-/issues/20>`_

  - Nouvel élément :ref:`denomination`
  - Nouvel élément optionnel :ref:`denomination` dans :ref:`adresse`

- `PEL-14: Cardinalités Organisme formateur et Lieu de formation <https://gitlab.com/lheo/lheo-schema/-/issues/17>`_

  - Changement de cardinalité de :ref:`organisme-formateur` dans :ref:`action`: de 0,1 à 0,n
  - Changement de cardinalité de :ref:`lieu-de-formation` dans :ref:`action`: de 1,1 à 0,n
