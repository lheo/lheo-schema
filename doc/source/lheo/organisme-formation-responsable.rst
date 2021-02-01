.. _organisme-formation-responsable:

Organisme de formation responsable
++++++++++++++++++++++++++++++++++

.. code-block:: xml

  <organisme-formation-responsable>
    <numero-activite>...</numero-activite> <!-- [1,1] -->
    <SIRET-organisme-formation>...</SIRET-organisme-formation> <!-- [1,1] -->
    <nom-organisme>...</nom-organisme> <!-- [1,1] -->
    <raison-sociale>...</raison-sociale> <!-- [1,1] -->
    <coordonnees-organisme>...</coordonnees-organisme> <!-- [1,1] -->
    <contact-organisme>...</contact-organisme> <!-- [1,1] -->
    <renseignements-specifiques>...</renseignements-specifiques> <!-- [0,1] -->
    <potentiel>...</potentiel> <!-- [0,1] -->
    <extras>...</extras> <!-- [0,N] -->
  </organisme-formation-responsable>


Cet élément décrit l'organisme de formation responsable de la formation.

Éléments
""""""""

Séquence ordonnée des éléments suivants:

- ``<numero-activite>`` :ref:`numero-activite` [1, 1]
- ``<SIRET-organisme-formation>`` :ref:`SIRET-organisme-formation` [1, 1]
- ``<nom-organisme>`` :ref:`nom-organisme` [1, 1]
- ``<raison-sociale>`` :ref:`raison-sociale` [1, 1]
- ``<coordonnees-organisme>`` :ref:`coordonnees-organisme` [1, 1]
- ``<contact-organisme>`` :ref:`contact-organisme` [1, 1]
- ``<renseignements-specifiques>`` :ref:`renseignements-specifiques` [0, 1]
- ``<potentiel>`` :ref:`potentiel` [0, 1]
- ``<extras>`` :ref:`extras` [0, N]



Attributs
"""""""""

- ``href`` (optionnel) texte (0,N)
- ``file`` (optionnel) texte (0,N)
- ``numero`` (optionnel) texte (0,N)
- ``info`` (optionnel) texte (0,N)
- ``ref`` (optionnel) texte (0,N)
- ``id`` (optionnel) ID (0,N)
- ``idref`` (optionnel) IDREF (0,N)
- ``tag`` (optionnel) texte (0,N)

Utilisé dans :ref:`formation`.

.. admonition:: Dans le glossaire LHÉO

   :ref:`organisme-responsable-terme`


   Il s'agit, pour une action de formation donnée, de l'organisme juridiquement chargé de l'offre de formation proposée. Il est l'organisme signataire des documents contractuels relatifs à l'offre. C'est l'organisme qui engage sa responsabilité auprès du financeur de l'action de formation. 


