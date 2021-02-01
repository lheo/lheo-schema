.. _session:

Session de formation
++++++++++++++++++++

.. code-block:: xml

  <session>
    <periode>...</periode> <!-- [1,1] -->
    <adresse-inscription>...</adresse-inscription> <!-- [1,1] -->
    <modalites-inscription>...</modalites-inscription> <!-- [0,1] -->
    <periode-inscription>...</periode-inscription> <!-- [0,1] -->
    <etat-recrutement>...</etat-recrutement> <!-- [0,1] -->
    <extras>...</extras> <!-- [0,N] -->
  </session>


Cet élément permet de préciser une session de formation en format fixe.

Éléments
""""""""

Séquence ordonnée des éléments suivants:

- ``<periode>`` :ref:`periode` [1, 1]
- ``<adresse-inscription>`` :ref:`adresse-inscription` [1, 1]
- ``<modalites-inscription>`` :ref:`modalites-inscription` [0, 1]
- ``<periode-inscription>`` :ref:`periode-inscription` [0, 1]
- ``<etat-recrutement>`` :ref:`etat-recrutement` [0, 1]
- ``<extras>`` :ref:`extras` [0, N]



Attributs
"""""""""

- ``numero`` (optionnel) texte (0,N)
- ``info`` (optionnel) texte (0,N)
- ``ref`` (optionnel) texte (0,N)
- ``id`` (optionnel) ID (0,N)
- ``idref`` (optionnel) IDREF (0,N)
- ``tag`` (optionnel) texte (0,N)
- ``datemaj`` (optionnel) texte (0,N)
- ``datecrea`` (optionnel) texte (0,N)

Utilisé dans :ref:`action`.

.. admonition:: Dans le glossaire LHÉO

   :ref:`session-formation-terme`


   Période pendant laquelle une action de formation sera réalisée dans un centre de formation ou dans une entreprise et regroupant généralement plusieurs participants en simultané. 


