.. _contact-organisme:

Contact avec l'organisme
++++++++++++++++++++++++

.. code-block:: xml

  <contact-organisme>
    <coordonnees>...</coordonnees> <!-- [1,1] -->
    <extras>...</extras> <!-- [0,N] -->
  </contact-organisme>


Cet élément permet de donner les coordonnées (typiquement un nom, avec une adresse ou un numéro de téléphone, une adresse de courrier électronique, etc.) d'une personne de l'organisme responsable de l'offre à contacter.

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

   :ref:`contact-organisme-terme`


   Il s'agit du nom et du numéro de téléphone, de l'adresse postale ou électronique de la personne habilitée à donner des renseignements sur l'action de formation ou l'ensemble des formations proposées par l'organisme responsable de l'offre, voire sur l'organisme lui-même. 


