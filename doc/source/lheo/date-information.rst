.. _date-information:

Date d'information
++++++++++++++++++

.. code-block:: xml

  <date-information>
    <date>...</date> <!-- [1,1] -->
    <extras>...</extras> <!-- [0,N] -->
  </date-information>


Cet élément permet d'indiquer la date d'une séance d'information sur la formation (une séance d'information ayant lieu à un endroit précis).

Éléments
""""""""

Séquence ordonnée des éléments suivants:

- ``<date>`` :ref:`date` [1, 1]
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


