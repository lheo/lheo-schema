.. _organisme-financeur:

Organisme financeur
+++++++++++++++++++

.. code-block:: xml

  <organisme-financeur>
    <code-financeur>...</code-financeur> <!-- [1,1] -->
    <nb-places-financees>...</nb-places-financees> <!-- [0,1] -->
    <extras>...</extras> <!-- [0,N] -->
  </organisme-financeur>


Identifie un organisme financeur

Éléments
""""""""

Séquence ordonnée des éléments suivants:

- ``<code-financeur>`` :ref:`code-financeur` [1, 1]
- ``<nb-places-financees>`` :ref:`nb-places-financees` [0, 1]
- ``<extras>`` :ref:`extras` [0, N]



Attributs
"""""""""

- ``numero`` (optionnel) texte (0,N)
- ``info`` (optionnel) texte (0,N)
- ``ref`` (optionnel) texte (0,N)
- ``id`` (optionnel) ID (0,N)
- ``idref`` (optionnel) IDREF (0,N)
- ``tag`` (optionnel) texte (0,N)

Utilisé dans :ref:`action`.

