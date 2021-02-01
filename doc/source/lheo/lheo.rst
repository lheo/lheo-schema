.. _lheo:

Élément racine d'un fichier en LHÉO/XML
+++++++++++++++++++++++++++++++++++++++

.. code-block:: xml

  <lheo>
    <offres>...</offres> <!-- [1,1] -->
    <extras>...</extras> <!-- [0,N] -->
  </lheo>


Élément racine d'un document XML au format LHÉO.

Éléments
""""""""

Séquence ordonnée des éléments suivants:

- ``<offres>`` :ref:`offres` [1, 1]
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

