.. _periode-inscription:

Période d'inscription
+++++++++++++++++++++

.. code-block:: xml

  <periode-inscription>
    <periode>...</periode> <!-- [1,1] -->
  </periode-inscription>


Cet élément permet de définir une période d'inscription comprise entre deux dates. Il faut garantir que debut >= fin.

Éléments
""""""""

Séquence ordonnée des éléments suivants:

- ``<periode>`` :ref:`periode` [1, 1]



Attributs
"""""""""

- ``numero`` (optionnel) texte (0,N)
- ``info`` (optionnel) texte (0,N)
- ``ref`` (optionnel) texte (0,N)
- ``id`` (optionnel) ID (0,N)
- ``idref`` (optionnel) IDREF (0,N)
- ``tag`` (optionnel) texte (0,N)

Utilisé dans :ref:`session`.

