Correspondance entre LHÉO et LOMS
=================================

Ce document présente une correspondance possible entre LHÉO 2.2 et le format LOMS 1.0.0 (voir :ref:`loms:LOMS`).

Le concept de formation, d'action, de session ou encore d'organisme de formation responsable n'existe pas en LOMS. D'autre part, une formation LHÉO contient de manière hiérarchique toutes les informations sous l'élément principal :ref:`formation`, alors qu'un flux LOMS "éclate" les informations entre plusieurs éléments qui ne sont pas sous le même élément principal. Dès lors, une approche de transformation classique prenant une formation et la transformant en un élément :ref:`loms:learningopportunity-element` n'est pas possible directement avec une simple transformation XSLT (par exemple).



.. code-block::

	formation -> learningOpportunity
		domaine-formation
		intitule-formation -> lo/title
		objectif-formation -> lo/description
		resultats-attendus
		...
		url-formation -> lo/homepage
		action -> lo, learningSpecification
		organisme-formation-responsable(@id) -> lo/providedBy(@id)
		identifiant-module -> lo/identifier
		positionnement
		sous-modules
		modules-prerequis
		extras



