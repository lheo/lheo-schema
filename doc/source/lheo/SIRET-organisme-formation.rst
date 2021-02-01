.. _SIRET-organisme-formation:

Numéro SIRET de l'organisme de formation
++++++++++++++++++++++++++++++++++++++++

.. code-block:: xml

  <SIRET-organisme-formation>
    <SIRET>...</SIRET> <!-- [1,1] -->
    <extras>...</extras> <!-- [0,N] -->
  </SIRET-organisme-formation>


Cet élément permet de préciser le numéro SIRET de l'organisme responsable de l'offre.

Éléments
""""""""

Séquence ordonnée des éléments suivants:

- ``<SIRET>`` :ref:`SIRET` [1, 1]
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

   :ref:`siren-terme`


   Il s'agit des numéros INSEE d'immatriculation des entreprises (SIREN), ou des établissements employeurs d’une entreprise (SIRET). Le SIRET se compose de l’identifiant entreprise agrémenté de caractères permettant d’identifier chaque établissement employeur au sein de l’entreprise mère. 


