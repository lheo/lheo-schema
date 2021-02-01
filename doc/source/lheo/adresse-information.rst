.. _adresse-information:

Adresse d'information
+++++++++++++++++++++

.. code-block:: xml

  <adresse-information>
    <adresse>...</adresse> <!-- [1,1] -->
    <extras>...</extras> <!-- [0,N] -->
  </adresse-information>


Cet élément permet d'indiquer l'adresse où obtenir des informations sur la formation.

Éléments
""""""""

Séquence ordonnée des éléments suivants:

- ``<adresse>`` :ref:`adresse` [1, 1]
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

   :ref:`lieu-date-inscription-terme`


   Indiquent la ou les adresse(s) précise(s) du/des lieu(x) où se déroulent les actions d'information et d'inscription pour une action de formation donnée. Toutes les dates associées aux actions d'information et aux périodes d'inscription doivent être également précisées. 


