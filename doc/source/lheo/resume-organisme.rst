.. _resume-organisme:

Résumé d'un organisme
+++++++++++++++++++++

.. code-block:: xml

  <resume-organisme>
    <nom-organisme>...</nom-organisme> <!-- [1,1] -->
    <raison-sociale>...</raison-sociale> <!-- [1,1] -->
    <SIRET>...</SIRET> <!-- [1,1] -->
    <numero-activite>...</numero-activite> <!-- [1,1] -->
    <extras>...</extras> <!-- [0,N] -->
  </resume-organisme>




Éléments
""""""""

Séquence ordonnée des éléments suivants:

- ``<nom-organisme>`` :ref:`nom-organisme` [1, 1]
- ``<raison-sociale>`` :ref:`raison-sociale` [1, 1]
- ``<SIRET>`` :ref:`SIRET` [1, 1]
- ``<numero-activite>`` :ref:`numero-activite` [1, 1]
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

