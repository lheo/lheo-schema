.. _certification:

Certification préparée
++++++++++++++++++++++

.. code-block:: xml

  <certification>
    <code-RNCP>...</code-RNCP> <!-- [0,1] -->
    <code-CERTIFINFO>...</code-CERTIFINFO> <!-- [0,1] -->
    <extras>...</extras> <!-- [0,N] -->
  </certification>


Cet élément donne le code d'une certification dans le service Certifinfo et/ou dans le RNCP.

Éléments
""""""""

Séquence ordonnée des éléments suivants:

- ``<code-RNCP>`` :ref:`code-RNCP` [0, 1]
- ``<code-CERTIFINFO>`` :ref:`code-CERTIFINFO` [0, 1]
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

