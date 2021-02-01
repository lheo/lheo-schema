.. _lheo-plus:

Extension de LHEO pour inclure une liste d'organismes
+++++++++++++++++++++++++++++++++++++++++++++++++++++

.. code-block:: xml

  <lheo-plus>
    <lheo>...</lheo> <!-- [0,1] -->
    <organisme-formation-responsable>...</organisme-formation-responsable> <!-- [0,N] -->
    <extras>...</extras> <!-- [0,N] -->
  </lheo-plus>


Une liste d'organisme permet de lister des organismes ne présentant pas d'offre de formation précise mais un "potentiel".

Éléments
""""""""

Séquence ordonnée des éléments suivants:

- ``<lheo>`` :ref:`lheo` [0, 1]
- ``<organisme-formation-responsable>`` :ref:`organisme-formation-responsable` [0, N]
- ``<extras>`` :ref:`extras` [0, N]



Attributs
"""""""""

- ``numero`` (optionnel) texte (0,N)
- ``info`` (optionnel) texte (0,N)
- ``ref`` (optionnel) texte (0,N)
- ``id`` (optionnel) ID (0,N)
- ``idref`` (optionnel) IDREF (0,N)
- ``tag`` (optionnel) texte (0,N)

