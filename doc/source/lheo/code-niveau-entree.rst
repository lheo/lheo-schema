.. _code-niveau-entree:

Niveau à l'entrée en formation
++++++++++++++++++++++++++++++

.. code-block:: xml

  <code-niveau-entree>1</code-niveau-entree>


Cet élément décrit le niveau à l'entrée en formation. Ce niveau peut être souhaité ou exigé en fonction de la valeur du code contenu dans l'élément 'niveau-entree-obligatoire'. Règle de gestion: si il y a plusieurs niveaux d’entrée possibles, prendre le niveau minimal.

Type
""""

Clé de la table :ref:`dict-niveaux`


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

   :ref:`niveau-entree-terme`


   Il correspond au niveau de titre ou de diplôme acquis par le demandeur de formation au moment de son entrée dans l'action. 


