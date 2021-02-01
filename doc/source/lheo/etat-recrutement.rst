.. _etat-recrutement:

Etat du recrutement
+++++++++++++++++++

.. code-block:: xml

  <etat-recrutement>1</etat-recrutement>


cette donnée permet à l’organisme responsable de la session de formation d’indiquer, à un instant donné, si il recrute sur la session. Elle peut prendre les valeurs : ouvert, tant que l’organisme dispose de places à proposer sur la session; fermé, dès que le nombre de places maximum est atteint; suspendu, dès lors que l’inscription est interrompue et qu’il demeure possible de s’inscrire à une date ultérieure sur cette même session (exemple: cas des entrées/sorties permanentes).

Type
""""

Clé de la table :ref:`dict-etat-recrutement`


Attributs
"""""""""

- ``numero`` (optionnel) texte (0,N)
- ``info`` (optionnel) texte (0,N)
- ``ref`` (optionnel) texte (0,N)
- ``id`` (optionnel) ID (0,N)
- ``idref`` (optionnel) IDREF (0,N)
- ``tag`` (optionnel) texte (0,N)

Utilisé dans :ref:`session`.

.. admonition:: Dans le glossaire LHÉO

   :ref:`etat-recrutement-terme`


   Cette donnée permet à l’organisme responsable de la session de formation d’indiquer, à un instant donné, s’il recrute sur la session. Elle peut prendre les valeurs : "ouvert", tant que l’organisme dispose de places à proposer sur la session ; "fermé", dès que le nombre de places maximum est atteint ; "suspendu", dès lors que l’inscription est interrompue et qu’il demeure possible de s’inscrire à une date ultérieure sur cette même session (exemple : cas des entrées/sorties permanentes). 


