.. _modules-prerequis:

Modules prérequis
+++++++++++++++++

.. code-block:: xml

  <modules-prerequis>
    <reference-module>...</reference-module> <!-- [1,N] -->
    <extras>...</extras> <!-- [0,N] -->
  </modules-prerequis>


Cet élément permet de références les modules prérequis par l'action/module.

Éléments
""""""""

Séquence ordonnée des éléments suivants:

- ``<reference-module>`` :ref:`reference-module` [1, N]
- ``<extras>`` :ref:`extras` [0, N]



Attributs
"""""""""

- ``numero`` (optionnel) texte (0,N)
- ``info`` (optionnel) texte (0,N)
- ``ref`` (optionnel) texte (0,N)
- ``id`` (optionnel) ID (0,N)
- ``idref`` (optionnel) IDREF (0,N)
- ``tag`` (optionnel) texte (0,N)

Utilisé dans :ref:`formation`.

