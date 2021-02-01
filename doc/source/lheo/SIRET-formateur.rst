.. _SIRET-formateur:

SIRET de l'organisme formateur
++++++++++++++++++++++++++++++

.. code-block:: xml

  <SIRET-formateur>
    <SIRET>...</SIRET> <!-- [1,1] -->
    <extras>...</extras> <!-- [0,N] -->
  </SIRET-formateur>


Cet élément permet de préciser le numéro SIRET de l'organisme formateur, c'est-à-dire de l'organisme qui assure la formation.

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

Utilisé dans :ref:`organisme-formateur`.

.. admonition:: Dans le glossaire LHÉO

   :ref:`siren-terme`


   Il s'agit des numéros INSEE d'immatriculation des entreprises (SIREN), ou des établissements employeurs d’une entreprise (SIRET). Le SIRET se compose de l’identifiant entreprise agrémenté de caractères permettant d’identifier chaque établissement employeur au sein de l’entreprise mère. 


