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

  - Nouvel élément :ref:`SIRET-lieu-formation` en cercle 2

- `PEL-38: Nouvel élément UAI <https://gitlab.com/lheo/lheo-schema/-/issues/38>`_

  - Nouvelle entrée de glossaire :ref:`uai-terme`
  - Nouveau type de base :ref:`code-UAI`
  - Nouvel élément :ref:`code-UAI-organisme-formation` optionnel dans :ref:`organisme-formation-responsable`
  - Nouvel élément :ref:`code-UAI-lieu-formation` optionnel dans :ref:`lieu-de-formation`
  - Nouvel élément :ref:`code-UAI-formateur` optionnel dans :ref:`organisme-formateur`

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
  - Changement dans les titres et documentations pour refléter la multiplicité
  - :ref:`lieu-de-formation` devenant optionnel, il passe en cercle 2
  
- `PEL-37: Nouvelle table des niveaux <https://gitlab.com/lheo/lheo-schema/-/issues/37>`_

  - Ajout des niveaux de la nouvelle nomenclature dans :ref:`dict-niveaux`

- `PEL-20: Multivaluation de langue-formation <https://gitlab.com/lheo/lheo-schema/-/issues/23>`_

  - Passage de 1 à 5 répétitions possibles de :ref:`langue-formation` dans :ref:`action`

- `PEL-40: Évolutions de la table des financeurs <https://gitlab.com/lheo/lheo-schema/-/issues/2>`_

  - Nouvelles entrées dans la table :ref:`dict-financeurs`
  - Nouvelle entrée de glossaire :ref:`prf-terme`

- `PEL-8: Valorisation d’une formation <https://gitlab.com/lheo/lheo-schema/-/issues/11>`_

  - Ajout d'une URL sur la session: :ref:`url-session` dans :ref:`session`
  - Introduction: ajout d'informations sur les bases tierces :ref:`tables_reference_referentiels`

- `PEL-42: Nouvelles entrées du glossaire sur l'apprentissage et l'alternance <https://gitlab.com/lheo/lheo-schema/-/issues/39>`_

  - Nouvelle entrée de glossaire :ref:`alternant-terme`
  - Nouvelle entrée de glossaire :ref:`apprenti-terme`
  - Nouvelle entrée de glossaire :ref:`contrat-apprentissage-terme`

- `PEL-4: Date prévisionnelle d'entrée en session <https://gitlab.com/lheo/lheo-schema/-/issues/7>`_

  - Modification de la documentation de :ref:`session`
  - Nouvelle entrée de glossaire :ref:`es-cadencees-terme`
  - Modification de l'entrée de glossaire :ref:`dates-debut-fin-stage-terme`

- `PEL-11: Recrutement <https://gitlab.com/lheo/lheo-schema/-/issues/14>`_

  - Nouvel élément :ref:`commentaire`
  - Nouvelle table :ref:`dict-modalite-recrutement`
  - Nouvel élément :ref:`modalite-recrutement`
  - Nouvel élément :ref:`a-distance`
  - Nouvel élément :ref:`nb-places`
  - Nouvel élément :ref:`heure-debut`
  - Nouvel élément :ref:`heure-fin`
  - Nouvel élément :ref:`recrutement` dans :ref:`session`

- `PEL-35: Nouvel élément Enseignements <https://gitlab.com/lheo/lheo-schema/-/issues/35>`_

  - Nouvel élément :ref:`obligatoire`
  - Nouvelle table :ref:`dict-type-enseignement`
  - Nouvel élément :ref:`type-enseignement`
  - Nouvel élément :ref:`libelle-enseignement`
  - Nouvel élément :ref:`enseignement` dans :ref:`action`

- `PEL-9: Équipements à la charge des apprenants <https://gitlab.com/lheo/lheo-schema/-/issues/12>`_

  - Nouvelle table :ref:`dict-type-equipement`
  - Nouvel élément :ref:`type-equipement`
  - Nouvel élément :ref:`equipement` dans :ref:`action`
  - Nouvelle entrée de glossaire :ref:`equipement-charge-apprenants-terme`
  - Modification de la document de :ref:`frais-restants`

- `PEL-13: Bloc de Compétences et multi-certification <https://gitlab.com/lheo/lheo-schema/-/issues/16>`_

  - Nouvel élément :ref:`reference-code-FORMACODE`
  - Nouvel élément :ref:`reference-code-CERTIFINFO`
  - Nouvel élément :ref:`reference-code-RNCP`
  - Nouvel élément :ref:`reference-code-RS`
  - Nouvel élément :ref:`reference-certification` (dans :ref:`session`, :ref:`blocs-competences`, :ref:`organisme-formateur`)
  - Nouvel élément :ref:`libelle-bloc`
  - Nouvel élément :ref:`code-bloc`
  - Nouvel élément :ref:`bloc-competences`
  - Nouvelle table :ref:`dict-type-validation-blocs`
  - Nouvel élément :ref:`validation-blocs`
  - Nouvel élément :ref:`blocs-competences` dans :ref:`session`
  - Modification de l'entrée de glossaire :ref:`attestation-stage-terme`
  - Modification de l'entrée de glossaire :ref:`certification-terme`
  - Nouvelle entrée de glossaire :ref:`certification-qualite-terme`
  - Modification de l'entrée de glossaire :ref:`certification-acquis-terme`
  - Modification de l'entrée de glossaire :ref:`certification-pro-terme`
  - Nouvelle entrée de glossaire :ref:`bloc-competences-terme`
  - Nouvelle entrée de glossaire :ref:`validation-terme`
  - Modification de l'entrée de glossaire :ref:`module-formation-terme`

- `PEL-2: Effectif minimal, Capacité d'accueil simultanée et Capacité d'accueil cumulée <https://gitlab.com/lheo/lheo-schema/-/issues/1>`_

  - Nouvel élément :ref:`effectif-minimal`
  - Nouvel élément :ref:`capacite-simultanee`
  - Nouvel élément :ref:`capacite-cumulee`
  - Nouvelle table :ref:`dict-type-alternance`
  - Nouvel élément :ref:`type-alternance`
  - Nouvel élément de glossaire :ref:`effectif-terme`
  - Nouvel élément de glossaire :ref:`apprenant-terme`
  - Nouvel élément de glossaire :ref:`stagiaire-terme`

- `PEL-5: Cycle de l'alternance <https://gitlab.com/lheo/lheo-schema/-/issues/8>`_

  - Nouvel élément de glossaire :ref:`alternance-terme`
  - Nouvel élément de glossaire :ref:`modalites-alternance-terme`
  - Nouvel élément de glossaire :ref:`contrat-alternance-terme`
  - Nouvel élément de glossaire :ref:`contrat-professionnalisation-terme`
  - Nouvelle table :ref:`dict-unite-rythme`
  - Nouvel élément :ref:`unite-rythme-alternance`
  - Nouvel élément :ref:`unites-entreprise`
  - Nouvel élément :ref:`unites-centre`
  - Nouvel élément :ref:`rythme-alternance`

- `PEL-15: Multi Modalités FI/FA/CA/CP d’une session avec mixité des publics et cycles <https://gitlab.com/lheo/lheo-schema/-/issues/18>`_

  - Nouvelle table :ref:`dict-type-cycle`
  - Nouvel élément :ref:`type-cycle`
  - Nouvel élément :ref:`duree-cycle` (dans :ref:`action`)
  - Nouvel élément :ref:`annee-cycle`
  - Nouvel élément :ref:`alternance` (dans :ref:`cycle`)
  - Nouvel élément :ref:`cycle` (dans :ref:`session`)

- `PEL-33: Meilleures pratiques : identifiants <https://gitlab.com/lheo/lheo-schema/-/issues/33>`_
  
  - Ajout d'un chapitre dans la documentation :ref:`identifiants`

