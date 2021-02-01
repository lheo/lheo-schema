.. _adresse:

Adresse
+++++++

.. code-block:: xml

  <adresse>
    <ligne>...</ligne> <!-- [1,4] -->
    <codepostal>...</codepostal> <!-- [1,1] -->
    <ville>...</ville> <!-- [1,1] -->
    <departement>...</departement> <!-- [0,1] -->
    <code-INSEE-commune>...</code-INSEE-commune> <!-- [0,1] -->
    <code-INSEE-canton>...</code-INSEE-canton> <!-- [0,1] -->
    <region>...</region> <!-- [0,1] -->
    <pays>...</pays> <!-- [0,1] -->
    <geolocalisation>...</geolocalisation> <!-- [0,1] -->
    <extras>...</extras> <!-- [0,N] -->
  </adresse>


Cet élément contient une adresse postale.

Éléments
""""""""

Séquence ordonnée des éléments suivants:

- ``<ligne>`` :ref:`ligne` [1, 4]
- ``<codepostal>`` :ref:`codepostal` [1, 1]
- ``<ville>`` :ref:`ville` [1, 1]
- ``<departement>`` :ref:`departement` [0, 1]
- ``<code-INSEE-commune>`` :ref:`code-INSEE-commune` [0, 1]
- ``<code-INSEE-canton>`` :ref:`code-INSEE-canton` [0, 1]
- ``<region>`` :ref:`region` [0, 1]
- ``<pays>`` :ref:`pays` [0, 1]
- ``<geolocalisation>`` :ref:`geolocalisation` [0, 1]
- ``<extras>`` :ref:`extras` [0, N]



Attributs
"""""""""

- ``numero`` (optionnel) texte (0,N)
- ``info`` (optionnel) texte (0,N)
- ``ref`` (optionnel) texte (0,N)
- ``id`` (optionnel) ID (0,N)
- ``idref`` (optionnel) IDREF (0,N)
- ``tag`` (optionnel) texte (0,N)

Utilisé dans :ref:`adresse-inscription`, :ref:`adresse-information`, :ref:`coordonnees`.

