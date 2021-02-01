.. _organisme-formateur:

Organisme formateur
+++++++++++++++++++

.. code-block:: xml

  <organisme-formateur>
    <SIRET-formateur>...</SIRET-formateur> <!-- [1,1] -->
    <raison-sociale-formateur>...</raison-sociale-formateur> <!-- [1,1] -->
    <contact-formateur>...</contact-formateur> <!-- [0,1] -->
    <potentiel>...</potentiel> <!-- [0,1] -->
    <extras>...</extras> <!-- [0,N] -->
  </organisme-formateur>


Cet élément décrit l'organisme formateur.

Éléments
""""""""

Séquence ordonnée des éléments suivants:

- ``<SIRET-formateur>`` :ref:`SIRET-formateur` [1, 1]
- ``<raison-sociale-formateur>`` :ref:`raison-sociale-formateur` [1, 1]
- ``<contact-formateur>`` :ref:`contact-formateur` [0, 1]
- ``<potentiel>`` :ref:`potentiel` [0, 1]
- ``<extras>`` :ref:`extras` [0, N]



Attributs
"""""""""

- ``numero`` (optionnel) texte (0,N)
- ``info`` (optionnel) texte (0,N)
- ``ref`` (optionnel) texte (0,N)
- ``id`` (optionnel) ID (0,N)
- ``idref`` (optionnel) IDREF (0,N)
- ``tag`` (optionnel) texte (0,N)

Utilisé dans :ref:`action`.

.. admonition:: Dans le glossaire LHÉO

   :ref:`organisme-formateur-terme`


   Il s'agit, pour une action de formation donnée, de l'organisme qui concrètement la réalise. 


