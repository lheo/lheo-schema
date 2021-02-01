.. _formation:

Offre de formation
++++++++++++++++++

.. code-block:: xml

  <formation>
    <domaine-formation>...</domaine-formation> <!-- [1,1] -->
    <intitule-formation>...</intitule-formation> <!-- [1,1] -->
    <objectif-formation>...</objectif-formation> <!-- [1,1] -->
    <resultats-attendus>...</resultats-attendus> <!-- [1,1] -->
    <contenu-formation>...</contenu-formation> <!-- [1,1] -->
    <certifiante>...</certifiante> <!-- [1,1] -->
    <contact-formation>...</contact-formation> <!-- [1,1] -->
    <parcours-de-formation>...</parcours-de-formation> <!-- [1,1] -->
    <code-niveau-entree>...</code-niveau-entree> <!-- [1,1] -->
    <objectif-general-formation>...</objectif-general-formation> <!-- [0,1] -->
    <certification>...</certification> <!-- [0,5] -->
    <code-niveau-sortie>...</code-niveau-sortie> <!-- [0,1] -->
    <url-formation>...</url-formation> <!-- [0,1] -->
    <action>...</action> <!-- [1,N] -->
    <organisme-formation-responsable>...</organisme-formation-responsable> <!-- [1,1] -->
    <identifiant-module>...</identifiant-module> <!-- [0,1] -->
    <positionnement>...</positionnement> <!-- [0,1] -->
    <sous-modules>...</sous-modules> <!-- [0,1] -->
    <modules-prerequis>...</modules-prerequis> <!-- [0,1] -->
    <extras>...</extras> <!-- [0,N] -->
  </formation>


Cet élément décrit une offre de formation, tous les aspects organisationnels de cette formation et les organismes liés à cette formation.

Éléments
""""""""

Séquence ordonnée des éléments suivants:

- ``<domaine-formation>`` :ref:`domaine-formation` [1, 1]
- ``<intitule-formation>`` :ref:`intitule-formation` [1, 1]
- ``<objectif-formation>`` :ref:`objectif-formation` [1, 1]
- ``<resultats-attendus>`` :ref:`resultats-attendus` [1, 1]
- ``<contenu-formation>`` :ref:`contenu-formation` [1, 1]
- ``<certifiante>`` :ref:`certifiante` [1, 1]
- ``<contact-formation>`` :ref:`contact-formation` [1, 1]
- ``<parcours-de-formation>`` :ref:`parcours-de-formation` [1, 1]
- ``<code-niveau-entree>`` :ref:`code-niveau-entree` [1, 1]
- ``<objectif-general-formation>`` :ref:`objectif-general-formation` [0, 1]
- ``<certification>`` :ref:`certification` [0, 5]
- ``<code-niveau-sortie>`` :ref:`code-niveau-sortie` [0, 1]
- ``<url-formation>`` :ref:`url-formation` [0, 1]
- ``<action>`` :ref:`action` [1, N]
- ``<organisme-formation-responsable>`` :ref:`organisme-formation-responsable` [1, 1]
- ``<identifiant-module>`` :ref:`identifiant-module` [0, 1]
- ``<positionnement>`` :ref:`positionnement` [0, 1]
- ``<sous-modules>`` :ref:`sous-modules` [0, 1]
- ``<modules-prerequis>`` :ref:`modules-prerequis` [0, 1]
- ``<extras>`` :ref:`extras` [0, N]



Attributs
"""""""""

- ``href`` (optionnel) texte (0,N)
- ``file`` (optionnel) texte (0,N)
- ``numero`` (optionnel) texte (0,N)
- ``info`` (optionnel) texte (0,N)
- ``ref`` (optionnel) texte (0,N)
- ``id`` (optionnel) ID (0,N)
- ``idref`` (optionnel) IDREF (0,N)
- ``tag`` (optionnel) texte (0,N)
- ``datemaj`` (optionnel) texte (0,N)
- ``datecrea`` (optionnel) texte (0,N)

Utilisé dans :ref:`offres`.

