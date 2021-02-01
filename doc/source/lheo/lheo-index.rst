.. _lheo-index:

Résumés d'offres et de d'organismes
+++++++++++++++++++++++++++++++++++

.. code-block:: xml

  <lheo-index>
    <resumes-offres>...</resumes-offres> <!-- [0,1] -->
    <resumes-organismes>...</resumes-organismes> <!-- [0,1] -->
    <extras>...</extras> <!-- [0,N] -->
  </lheo-index>


Cet élément permet de définir une liste de résumé d'offres de formation et d'organismes. Chaque résumé peut contenir un lien (URL) vers une description complète d'offre de formation ou d'organisme.

Éléments
""""""""

Séquence ordonnée des éléments suivants:

- ``<resumes-offres>`` :ref:`resumes-offres` [0, 1]
- ``<resumes-organismes>`` :ref:`resumes-organismes` [0, 1]
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

