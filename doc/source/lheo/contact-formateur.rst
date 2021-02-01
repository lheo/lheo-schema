.. _contact-formateur:

Contact avec l'organisme formateur
++++++++++++++++++++++++++++++++++

.. code-block:: xml

  <contact-formateur>
    <coordonnees>...</coordonnees> <!-- [1,1] -->
    <extras>...</extras> <!-- [0,N] -->
  </contact-formateur>


Cet élément permet de donner les coordonnées (typiquement un nom, avec une adresse ou un numéro de téléphone, une adresse de courrier électronique, etc.) d'une personne de l'organisme formateur.

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

Utilisé dans :ref:`organisme-formateur`.

