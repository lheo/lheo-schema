.. _action:

Action de formation
+++++++++++++++++++

.. code-block:: xml

  <action>
    <rythme-formation>...</rythme-formation> <!-- [1,1] -->
    <code-public-vise>...</code-public-vise> <!-- [1,10] -->
    <info-public-vise>...</info-public-vise> <!-- [0,1] -->
    <niveau-entree-obligatoire>...</niveau-entree-obligatoire> <!-- [1,1] -->
    <modalites-alternance>...</modalites-alternance> <!-- [1,1] -->
    <modalites-enseignement>...</modalites-enseignement> <!-- [1,1] -->
    <conditions-specifiques>...</conditions-specifiques> <!-- [1,1] -->
    <prise-en-charge-frais-possible>...</prise-en-charge-frais-possible> <!-- [1,1] -->
    <lieu-de-formation>...</lieu-de-formation> <!-- [1,1] -->
    <modalites-entrees-sorties>...</modalites-entrees-sorties> <!-- [1,1] -->
    <url-action>...</url-action> <!-- [0,1] -->
    <session>...</session> <!-- [1,N] -->
    <adresse-information>...</adresse-information> <!-- [0,1] -->
    <date-information>...</date-information> <!-- [0,3] -->
    <restauration>...</restauration> <!-- [0,1] -->
    <hebergement>...</hebergement> <!-- [0,1] -->
    <transport>...</transport> <!-- [0,1] -->
    <acces-handicapes>...</acces-handicapes> <!-- [0,1] -->
    <langue-formation>...</langue-formation> <!-- [0,1] -->
    <modalites-recrutement>...</modalites-recrutement> <!-- [0,1] -->
    <modalites-pedagogiques>...</modalites-pedagogiques> <!-- [0,1] -->
    <code-modalite-pedagogique>...</code-modalite-pedagogique> <!-- [0,5] -->
    <frais-restants>...</frais-restants> <!-- [0,1] -->
    <code-perimetre-recrutement>...</code-perimetre-recrutement> <!-- [0,1] -->
    <infos-perimetre-recrutement>...</infos-perimetre-recrutement> <!-- [0,1] -->
    <prix-horaire-TTC>...</prix-horaire-TTC> <!-- [0,1] -->
    <prix-total-TTC>...</prix-total-TTC> <!-- [0,1] -->
    <duree-indicative>...</duree-indicative> <!-- [0,1] -->
    <nombre-heures-centre>...</nombre-heures-centre> <!-- [0,1] -->
    <nombre-heures-entreprise>...</nombre-heures-entreprise> <!-- [0,1] -->
    <nombre-heures-total>...</nombre-heures-total> <!-- [0,1] -->
    <detail-conditions-prise-en-charge>...</detail-conditions-prise-en-charge> <!-- [0,1] -->
    <conventionnement>...</conventionnement> <!-- [0,1] -->
    <duree-conventionnee>...</duree-conventionnee> <!-- [0,1] -->
    <organisme-formateur>...</organisme-formateur> <!-- [0,1] -->
    <organisme-financeur>...</organisme-financeur> <!-- [0,8] -->
    <extras>...</extras> <!-- [0,N] -->
  </action>


Cet élément décrit une action de formation.

Éléments
""""""""

Séquence ordonnée des éléments suivants:

- ``<rythme-formation>`` :ref:`rythme-formation` [1, 1]
- ``<code-public-vise>`` :ref:`code-public-vise` [1, 10]
- ``<info-public-vise>`` :ref:`info-public-vise` [0, 1]
- ``<niveau-entree-obligatoire>`` :ref:`niveau-entree-obligatoire` [1, 1]
- ``<modalites-alternance>`` :ref:`modalites-alternance` [1, 1]
- ``<modalites-enseignement>`` :ref:`modalites-enseignement` [1, 1]
- ``<conditions-specifiques>`` :ref:`conditions-specifiques` [1, 1]
- ``<prise-en-charge-frais-possible>`` :ref:`prise-en-charge-frais-possible` [1, 1]
- ``<lieu-de-formation>`` :ref:`lieu-de-formation` [1, 1]
- ``<modalites-entrees-sorties>`` :ref:`modalites-entrees-sorties` [1, 1]
- ``<url-action>`` :ref:`url-action` [0, 1]
- ``<session>`` :ref:`session` [1, N]
- ``<adresse-information>`` :ref:`adresse-information` [0, 1]
- ``<date-information>`` :ref:`date-information` [0, 3]
- ``<restauration>`` :ref:`restauration` [0, 1]
- ``<hebergement>`` :ref:`hebergement` [0, 1]
- ``<transport>`` :ref:`transport` [0, 1]
- ``<acces-handicapes>`` :ref:`acces-handicapes` [0, 1]
- ``<langue-formation>`` :ref:`langue-formation` [0, 1]
- ``<modalites-recrutement>`` :ref:`modalites-recrutement` [0, 1]
- ``<modalites-pedagogiques>`` :ref:`modalites-pedagogiques` [0, 1]
- ``<code-modalite-pedagogique>`` :ref:`code-modalite-pedagogique` [0, 5]
- ``<frais-restants>`` :ref:`frais-restants` [0, 1]
- ``<code-perimetre-recrutement>`` :ref:`code-perimetre-recrutement` [0, 1]
- ``<infos-perimetre-recrutement>`` :ref:`infos-perimetre-recrutement` [0, 1]
- ``<prix-horaire-TTC>`` :ref:`prix-horaire-TTC` [0, 1]
- ``<prix-total-TTC>`` :ref:`prix-total-TTC` [0, 1]
- ``<duree-indicative>`` :ref:`duree-indicative` [0, 1]
- ``<nombre-heures-centre>`` :ref:`nombre-heures-centre` [0, 1]
- ``<nombre-heures-entreprise>`` :ref:`nombre-heures-entreprise` [0, 1]
- ``<nombre-heures-total>`` :ref:`nombre-heures-total` [0, 1]
- ``<detail-conditions-prise-en-charge>`` :ref:`detail-conditions-prise-en-charge` [0, 1]
- ``<conventionnement>`` :ref:`conventionnement` [0, 1]
- ``<duree-conventionnee>`` :ref:`duree-conventionnee` [0, 1]
- ``<organisme-formateur>`` :ref:`organisme-formateur` [0, 1]
- ``<organisme-financeur>`` :ref:`organisme-financeur` [0, 8]
- ``<extras>`` :ref:`extras` [0, N]



Attributs
"""""""""

- ``numero`` (optionnel) texte (0,N)
- ``info`` (optionnel) texte (0,N)
- ``ref`` (optionnel) texte (0,N)
- ``id`` (optionnel) ID (0,N)
- ``idref`` (optionnel) IDREF (0,N)
- ``tag`` (optionnel) texte (0,N)
- ``datemaj`` (optionnel) texte (0,N)
- ``datecrea`` (optionnel) texte (0,N)

Utilisé dans :ref:`formation`.

.. admonition:: Dans le glossaire LHÉO

   :ref:`action-terme`


   S'entend de tout ce qui contribue à la conception, à l’organisation, et à la mise en œuvre d’une formation. 


