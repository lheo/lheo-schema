.. _domaine-formation:

Domaine de la formation (NSF, FORMACODE, ROME)
++++++++++++++++++++++++++++++++++++++++++++++

.. code-block:: xml

  <domaine-formation>
    <code-FORMACODE>...</code-FORMACODE> <!-- [0,5] -->
    <code-NSF>...</code-NSF> <!-- [0,3] -->
    <code-ROME>...</code-ROME> <!-- [0,5] -->
    <extras>...</extras> <!-- [0,N] -->
  </domaine-formation>


Cet élément contient des listes de codes décrivant le domaine de la formation, en utilisant les nomenclatures NSF (Nomenclature des Spécialités de Formation), ROME (Répertoire Opérationnel des Métiers et des Emplois) et/ou le FORMACODE (thésaurus de l'offre de formation du Centre Inffo). Règle de gestion : le premier code FORMACODE doit être considéré comme le FORMACODE principal.

Éléments
""""""""

Séquence ordonnée des éléments suivants:

- ``<code-FORMACODE>`` :ref:`code-FORMACODE` [0, 5]
- ``<code-NSF>`` :ref:`code-NSF` [0, 3]
- ``<code-ROME>`` :ref:`code-ROME` [0, 5]
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

.. admonition:: Dans le glossaire LHÉO

   :ref:`domaine-formation-terme`


   Les champs intellectuels dans lesquels vient s’inscrire une action de formation, considérée dans son contenu, son programme ou ses objectifs affichés (NSF, FORMACODE). 


