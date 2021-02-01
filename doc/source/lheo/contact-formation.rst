.. _contact-formation:

Contact de l'offre de formation
+++++++++++++++++++++++++++++++

.. code-block:: xml

  <contact-formation>
    <coordonnees>...</coordonnees> <!-- [1,1] -->
    <extras>...</extras> <!-- [0,N] -->
  </contact-formation>


Cet élément contient les coordonnées (typiquement un nom, avec une adresse ou un numéro de téléphone, une adresse de courrier électronique, etc.) d'un contact pouvant donner des renseignements sur l'offre de formation.

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

Utilisé dans :ref:`formation`.

.. admonition:: Dans le glossaire LHÉO

   :ref:`contact-offre-terme`


   Il s'agit du nom et du numéro de téléphone, de l'adresse postale ou électronique de la personne habilitée à donner des renseignements sur l'action de formation. Cette personne peut être également le contact de l'organisme responsable de l'offre. 


