.. _resume-offre:

Résumé d'une offre de formation
+++++++++++++++++++++++++++++++

.. code-block:: xml

  <resume-offre>
    <domaine-formation>...</domaine-formation> <!-- [1,1] -->
    <intitule-formation>...</intitule-formation> <!-- [1,1] -->
    <nom-organisme>...</nom-organisme> <!-- [1,1] -->
    <SIRET>...</SIRET> <!-- [1,1] -->
    <codepostal>...</codepostal> <!-- [0,1] -->
    <code-INSEE-commune>...</code-INSEE-commune> <!-- [0,1] -->
    <ville>...</ville> <!-- [1,1] -->
    <departement>...</departement> <!-- [1,1] -->
    <region>...</region> <!-- [0,1] -->
    <certifiante>...</certifiante> <!-- [1,1] -->
    <code-niveau-entree>...</code-niveau-entree> <!-- [1,1] -->
    <prise-en-charge-frais-possible>...</prise-en-charge-frais-possible> <!-- [1,1] -->
    <modalites-enseignement>...</modalites-enseignement> <!-- [0,1] -->
    <code-public-vise>...</code-public-vise> <!-- [1,10] -->
    <nombre-heures-total>...</nombre-heures-total> <!-- [0,1] -->
    <session>...</session> <!-- [0,N] -->
    <contact-formation-resume>...</contact-formation-resume> <!-- [0,1] -->
    <certification>...</certification> <!-- [0,5] -->
    <extras>...</extras> <!-- [0,N] -->
  </resume-offre>




Éléments
""""""""

Séquence ordonnée des éléments suivants:

- ``<domaine-formation>`` :ref:`domaine-formation` [1, 1]
- ``<intitule-formation>`` :ref:`intitule-formation` [1, 1]
- ``<nom-organisme>`` :ref:`nom-organisme` [1, 1]
- ``<SIRET>`` :ref:`SIRET` [1, 1]
- ``<codepostal>`` :ref:`codepostal` [0, 1]
- ``<code-INSEE-commune>`` :ref:`code-INSEE-commune` [0, 1]
- ``<ville>`` :ref:`ville` [1, 1]
- ``<departement>`` :ref:`departement` [1, 1]
- ``<region>`` :ref:`region` [0, 1]
- ``<certifiante>`` :ref:`certifiante` [1, 1]
- ``<code-niveau-entree>`` :ref:`code-niveau-entree` [1, 1]
- ``<prise-en-charge-frais-possible>`` :ref:`prise-en-charge-frais-possible` [1, 1]
- ``<modalites-enseignement>`` :ref:`modalites-enseignement` [0, 1]
- ``<code-public-vise>`` :ref:`code-public-vise` [1, 10]
- ``<nombre-heures-total>`` :ref:`nombre-heures-total` [0, 1]
- ``<session>`` :ref:`session` [0, N]
- ``<contact-formation-resume>`` :ref:`contact-formation-resume` [0, 1]
- ``<certification>`` :ref:`certification` [0, 5]
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

