.. _coordonnees-organisme:

Coordonnées de l'organisme
++++++++++++++++++++++++++

.. code-block:: xml

  <coordonnees-organisme>
    <coordonnees>...</coordonnees> <!-- [1,1] -->
    <extras>...</extras> <!-- [0,N] -->
  </coordonnees-organisme>


Cet élément permet de donner les coordonnées complètes de l'organisme responsable de l'offre.

Éléments
""""""""

Séquence ordonnée des éléments suivants:

- ``<coordonnees>`` :ref:`coordonnees` [1, 1]
- ``<extras>`` :ref:`extras` [0, N]



Attributs
"""""""""

- ``numero`` (optionnel) texte (0,N)
- ``info`` (optionnel) texte (0,N)
- ``ref`` (optionnel) texte (0,N)
- ``id`` (optionnel) ID (0,N)
- ``idref`` (optionnel) IDREF (0,N)
- ``tag`` (optionnel) texte (0,N)

Utilisé dans :ref:`organisme-formation-responsable`.

.. admonition:: Dans le glossaire LHÉO

   :ref:`coordonnees-organisme-terme`


   Elles indiquent les coordonnées de l'organisme juridiquement responsable de l'action de formation. 


