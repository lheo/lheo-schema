.. _coordonnees:

Coordonnées
+++++++++++

.. code-block:: xml

  <coordonnees>
    <civilite>...</civilite> <!-- [0,1] -->
    <nom>...</nom> <!-- [0,1] -->
    <prenom>...</prenom> <!-- [0,1] -->
    <ligne>...</ligne> <!-- [0,3] -->
    <adresse>...</adresse> <!-- [0,1] -->
    <telfixe>...</telfixe> <!-- [0,1] -->
    <portable>...</portable> <!-- [0,1] -->
    <fax>...</fax> <!-- [0,1] -->
    <courriel>...</courriel> <!-- [0,1] -->
    <web>...</web> <!-- [0,1] -->
    <extras>...</extras> <!-- [0,N] -->
  </coordonnees>


Cet élément contient des coordonnées.

Éléments
""""""""

Séquence ordonnée des éléments suivants:

- ``<civilite>`` :ref:`civilite` [0, 1]
- ``<nom>`` :ref:`nom` [0, 1]
- ``<prenom>`` :ref:`prenom` [0, 1]
- ``<ligne>`` :ref:`ligne` [0, 3]
- ``<adresse>`` :ref:`adresse` [0, 1]
- ``<telfixe>`` :ref:`telfixe` [0, 1]
- ``<portable>`` :ref:`portable` [0, 1]
- ``<fax>`` :ref:`fax` [0, 1]
- ``<courriel>`` :ref:`courriel` [0, 1]
- ``<web>`` :ref:`web` [0, 1]
- ``<extras>`` :ref:`extras` [0, N]



Attributs
"""""""""

- ``numero`` (optionnel) texte (0,N)
- ``info`` (optionnel) texte (0,N)
- ``ref`` (optionnel) texte (0,N)
- ``id`` (optionnel) ID (0,N)
- ``idref`` (optionnel) IDREF (0,N)
- ``tag`` (optionnel) texte (0,N)

Utilisé dans :ref:`contact-formation`, :ref:`lieu-de-formation`, :ref:`coordonnees-organisme`, :ref:`contact-organisme`, :ref:`contact-formateur`.

