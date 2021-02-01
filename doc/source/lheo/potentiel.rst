.. _potentiel:

Potentiel
+++++++++

.. code-block:: xml

  <potentiel>
    <code-FORMACODE>...</code-FORMACODE> <!-- [1,25] -->
    <extras>...</extras> <!-- [0,N] -->
  </potentiel>


Cet élément contient une liste de codes du FORMACODE indiquant le potentiel d'un organisme de formation.

Éléments
""""""""

Séquence ordonnée des éléments suivants:

- ``<code-FORMACODE>`` :ref:`code-FORMACODE` [1, 25]
- ``<extras>`` :ref:`extras` [0, N]



Attributs
"""""""""

- ``numero`` (optionnel) texte (0,N)
- ``info`` (optionnel) texte (0,N)
- ``ref`` (optionnel) texte (0,N)
- ``id`` (optionnel) ID (0,N)
- ``idref`` (optionnel) IDREF (0,N)
- ``tag`` (optionnel) texte (0,N)

Utilisé dans :ref:`organisme-formation-responsable`, :ref:`organisme-formateur`.

