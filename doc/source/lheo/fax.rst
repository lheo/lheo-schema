.. _fax:

Fax
+++

.. code-block:: xml

  <fax>
    <numtel>...</numtel> <!-- [1,3] -->
    <extras>...</extras> <!-- [0,N] -->
  </fax>


Cet élément contient une liste de numéros de FAX.

Éléments
""""""""

Séquence ordonnée des éléments suivants:

- ``<numtel>`` :ref:`numtel` [1, 3]
- ``<extras>`` :ref:`extras` [0, N]



Attributs
"""""""""

- ``numero`` (optionnel) texte (0,N)
- ``info`` (optionnel) texte (0,N)
- ``ref`` (optionnel) texte (0,N)
- ``id`` (optionnel) ID (0,N)
- ``idref`` (optionnel) IDREF (0,N)
- ``tag`` (optionnel) texte (0,N)

Utilisé dans :ref:`coordonnees`.

