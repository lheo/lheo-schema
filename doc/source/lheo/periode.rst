.. _periode:

Période
+++++++

.. code-block:: xml

  <periode>
    <debut>...</debut> <!-- [1,1] -->
    <fin>...</fin> <!-- [1,1] -->
    <extras>...</extras> <!-- [0,N] -->
  </periode>


Cet élément permet de définir une période comprise entre deux dates. Il faut garantir que debut >= fin.

Éléments
""""""""

Séquence ordonnée des éléments suivants:

- ``<debut>`` :ref:`debut` [1, 1]
- ``<fin>`` :ref:`fin` [1, 1]
- ``<extras>`` :ref:`extras` [0, N]



Attributs
"""""""""

- ``numero`` (optionnel) texte (0,N)
- ``info`` (optionnel) texte (0,N)
- ``ref`` (optionnel) texte (0,N)
- ``id`` (optionnel) ID (0,N)
- ``idref`` (optionnel) IDREF (0,N)
- ``tag`` (optionnel) texte (0,N)

Utilisé dans :ref:`session`, :ref:`periode-inscription`.

