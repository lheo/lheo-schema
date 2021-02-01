.. _sous-module:

Sous module
+++++++++++

.. code-block:: xml

  <sous-module>
    <reference-module>...</reference-module> <!-- [1,1] -->
    <type-module>...</type-module> <!-- [1,1] -->
    <extras>...</extras> <!-- [0,N] -->
  </sous-module>


Cet élément permet de référencer un sous-module du module/action et de donner son type (obligatoire ou personnalisable).

Éléments
""""""""

Séquence ordonnée des éléments suivants:

- ``<reference-module>`` :ref:`reference-module` [1, 1]
- ``<type-module>`` :ref:`type-module` [1, 1]
- ``<extras>`` :ref:`extras` [0, N]



Attributs
"""""""""

- ``numero`` (optionnel) texte (0,N)
- ``info`` (optionnel) texte (0,N)
- ``ref`` (optionnel) texte (0,N)
- ``id`` (optionnel) ID (0,N)
- ``idref`` (optionnel) IDREF (0,N)
- ``tag`` (optionnel) texte (0,N)

Utilisé dans :ref:`sous-modules`.

