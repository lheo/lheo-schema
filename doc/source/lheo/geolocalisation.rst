.. _geolocalisation:

Géolocalisation
+++++++++++++++

.. code-block:: xml

  <geolocalisation>
    <latitude>...</latitude> <!-- [1,1] -->
    <longitude>...</longitude> <!-- [1,1] -->
    <extras>...</extras> <!-- [0,N] -->
  </geolocalisation>


Coordonnées géographiques (latitude, longitude) exprimées en degré décimal (système WGS84)

Éléments
""""""""

Séquence ordonnée des éléments suivants:

- ``<latitude>`` :ref:`latitude` [1, 1]
- ``<longitude>`` :ref:`longitude` [1, 1]
- ``<extras>`` :ref:`extras` [0, N]



Attributs
"""""""""

- ``numero`` (optionnel) texte (0,N)
- ``info`` (optionnel) texte (0,N)
- ``ref`` (optionnel) texte (0,N)
- ``id`` (optionnel) ID (0,N)
- ``idref`` (optionnel) IDREF (0,N)
- ``tag`` (optionnel) texte (0,N)

Utilisé dans :ref:`adresse`.

