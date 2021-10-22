# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = source
BUILDDIR      = build
GML2SPHINX ?= gml2sphinx.xsl
LHEOGML ?= ../definition/lheo-gml.xml
LHEOGLO ?= ../definition/lheo-glossaire.html
PUBLISHDIR ?= www_dev/languages/lheo/2.3/doc
PUBLISHHOST ?= lheo@boreon.silbercafe.net
PRODDIR ?= lheo-schema/2.3/doc
PRODHOST ?= lheo@lheo.gouv.fr

# Generated: xsltproc --stringparam action list  gml2sphinx.xsl ../definition/lheo-gml.xml
LHEOFILES = source/lheo/domaine-formation.rst \
 source/lheo/intitule-formation.rst \
 source/lheo/nom-organisme.rst \
 source/lheo/objectif-formation.rst \
 source/lheo/resultats-attendus.rst \
 source/lheo/contenu-formation.rst \
 source/lheo/certifiante.rst \
 source/lheo/rythme-formation.rst \
 source/lheo/duree-indicative.rst \
 source/lheo/contact-formation.rst \
 source/lheo/contact-session.rst \
 source/lheo/parcours-de-formation.rst \
 source/lheo/objectif-general-formation.rst \
 source/lheo/certification.rst \
 source/lheo/code-type-formation.rst \
 source/lheo/lheo.rst \
 source/lheo/offres.rst \
 source/lheo/formation.rst \
 source/lheo/action.rst \
 source/lheo/organisme-formation-responsable.rst \
 source/lheo/potentiel.rst \
 source/lheo/organisme-formateur.rst \
 source/lheo/niveau-entree-obligatoire.rst \
 source/lheo/code-niveau-entree.rst \
 source/lheo/code-niveau-sortie.rst \
 source/lheo/url-formation.rst \
 source/lheo/modalites-alternance.rst \
 source/lheo/modalites-enseignement.rst \
 source/lheo/conditions-specifiques.rst \
 source/lheo/code-modalite-pedagogique.rst \
 source/lheo/prise-en-charge-frais-possible.rst \
 source/lheo/frais-restants.rst \
 source/lheo/langue-formation.rst \
 source/lheo/lieu-de-formation.rst \
 source/lheo/modalites-entrees-sorties.rst \
 source/lheo/session.rst \
 source/lheo/adresse-inscription.rst \
 source/lheo/adresse-information.rst \
 source/lheo/date-information.rst \
 source/lheo/url-action.rst \
 source/lheo/numero-activite.rst \
 source/lheo/SIRET-organisme-formation.rst \
 source/lheo/SIRET-lieu-formation.rst \
 source/lheo/raison-sociale.rst \
 source/lheo/coordonnees-organisme.rst \
 source/lheo/type-contact.rst \
 source/lheo/contact-organisme.rst \
 source/lheo/contact-formateur.rst \
 source/lheo/renseignements-specifiques.rst \
 source/lheo/organisme-financeur.rst \
 source/lheo/nb-places-financees.rst \
 source/lheo/modalites-recrutement.rst \
 source/lheo/modalites-pedagogiques.rst \
 source/lheo/SIRET-formateur.rst \
 source/lheo/raison-sociale-formateur.rst \
 source/lheo/code-perimetre-recrutement.rst \
 source/lheo/infos-perimetre-recrutement.rst \
 source/lheo/prix-horaire-TTC.rst \
 source/lheo/prix-total-TTC.rst \
 source/lheo/nombre-heures-centre.rst \
 source/lheo/nombre-heures-entreprise.rst \
 source/lheo/nombre-heures-total.rst \
 source/lheo/detail-conditions-prise-en-charge.rst \
 source/lheo/conventionnement.rst \
 source/lheo/duree-conventionnee.rst \
 source/lheo/code-financeur.rst \
 source/lheo/restauration.rst \
 source/lheo/hebergement.rst \
 source/lheo/transport.rst \
 source/lheo/acces-handicapes.rst \
 source/lheo/positionnement.rst \
 source/lheo/etat-recrutement.rst \
 source/lheo/identifiant-module.rst \
 source/lheo/reference-module.rst \
 source/lheo/sous-modules.rst \
 source/lheo/modules-prerequis.rst \
 source/lheo/sous-module.rst \
 source/lheo/type-module.rst \
 source/lheo/code-NSF.rst \
 source/lheo/code-FORMACODE.rst \
 source/lheo/code-ROME.rst \
 source/lheo/code-public-vise.rst \
 source/lheo/info-public-vise.rst \
 source/lheo/code-RNCP.rst \
 source/lheo/code-CERTIFINFO.rst \
 source/lheo/code-UAI.rst \
 source/lheo/code-RS.rst \
 source/lheo/code-CPF.rst \
 source/lheo/code-ELU.rst \
 source/lheo/coordonnees.rst \
 source/lheo/SIRET.rst \
 source/lheo/adresse.rst \
 source/lheo/ligne.rst \
 source/lheo/prenom.rst \
 source/lheo/civilite.rst \
 source/lheo/nom.rst \
 source/lheo/codepostal.rst \
 source/lheo/code-INSEE-commune.rst \
 source/lheo/code-INSEE-canton.rst \
 source/lheo/ville.rst \
 source/lheo/departement.rst \
 source/lheo/region.rst \
 source/lheo/pays.rst \
 source/lheo/geolocalisation.rst \
 source/lheo/latitude.rst \
 source/lheo/longitude.rst \
 source/lheo/courriel.rst \
 source/lheo/web.rst \
 source/lheo/urlweb.rst \
 source/lheo/telfixe.rst \
 source/lheo/portable.rst \
 source/lheo/fax.rst \
 source/lheo/numtel.rst \
 source/lheo/modalites-inscription.rst \
 source/lheo/periode.rst \
 source/lheo/periode-inscription.rst \
 source/lheo/debut.rst \
 source/lheo/fin.rst \
 source/lheo/date.rst \
 source/lheo/extras.rst \
 source/lheo/extra.rst \
 source/lheo/lheo-index.rst \
 source/lheo/resumes-offres.rst \
 source/lheo/resumes-organismes.rst \
 source/lheo/resume-offre.rst \
 source/lheo/resume-organisme.rst \
 source/lheo/contact-formation-resume.rst \
 source/lheo/lheo-plus.rst \
 source/lheo/dict-boolean.rst \
 source/lheo/dict-modalites-enseignement.rst \
 source/lheo/dict-modalites-es.rst \
 source/lheo/dict-etat-recrutement.rst \
 source/lheo/dict-AIS.rst \
 source/lheo/dict-perimetre-recrutement.rst \
 source/lheo/dict-financeurs.rst \
 source/lheo/dict-type-parcours.rst \
 source/lheo/dict-type-positionnement.rst \
 source/lheo/dict-type-module.rst \
 source/lheo/dict-niveaux.rst \
 source/lheo/dict-type-contact.rst

# manual
TOCFILES = source/index.rst \
 source/structure.rst \
 source/cercle1.rst \
 source/cercle2.rst \
 source/cercle3.rst \
 source/types.rst \
 source/tables.rst \
 source/glossaire.rst

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

# Generated: xsltproc --stringparam action makerules gml2sphinx.xsl ../definition/lheo-gml.xml 
source/lheo/domaine-formation.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page domaine-formation $(GML2SPHINX) $(LHEOGML)
source/lheo/intitule-formation.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page intitule-formation $(GML2SPHINX) $(LHEOGML)
source/lheo/nom-organisme.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page nom-organisme $(GML2SPHINX) $(LHEOGML)
source/lheo/objectif-formation.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page objectif-formation $(GML2SPHINX) $(LHEOGML)
source/lheo/resultats-attendus.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page resultats-attendus $(GML2SPHINX) $(LHEOGML)
source/lheo/contenu-formation.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page contenu-formation $(GML2SPHINX) $(LHEOGML)
source/lheo/certifiante.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page certifiante $(GML2SPHINX) $(LHEOGML)
source/lheo/rythme-formation.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page rythme-formation $(GML2SPHINX) $(LHEOGML)
source/lheo/duree-indicative.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page duree-indicative $(GML2SPHINX) $(LHEOGML)
source/lheo/contact-formation.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page contact-formation $(GML2SPHINX) $(LHEOGML)
source/lheo/contact-session.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page contact-session $(GML2SPHINX) $(LHEOGML)
source/lheo/parcours-de-formation.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page parcours-de-formation $(GML2SPHINX) $(LHEOGML)
source/lheo/objectif-general-formation.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page objectif-general-formation $(GML2SPHINX) $(LHEOGML)
source/lheo/certification.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page certification $(GML2SPHINX) $(LHEOGML)
source/lheo/lheo.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page lheo $(GML2SPHINX) $(LHEOGML)
source/lheo/offres.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page offres $(GML2SPHINX) $(LHEOGML)
source/lheo/formation.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page formation $(GML2SPHINX) $(LHEOGML)
source/lheo/action.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page action $(GML2SPHINX) $(LHEOGML)
source/lheo/organisme-formation-responsable.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page organisme-formation-responsable $(GML2SPHINX) $(LHEOGML)
source/lheo/potentiel.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page potentiel $(GML2SPHINX) $(LHEOGML)
source/lheo/organisme-formateur.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page organisme-formateur $(GML2SPHINX) $(LHEOGML)
source/lheo/niveau-entree-obligatoire.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page niveau-entree-obligatoire $(GML2SPHINX) $(LHEOGML)
source/lheo/code-niveau-entree.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page code-niveau-entree $(GML2SPHINX) $(LHEOGML)
source/lheo/code-niveau-sortie.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page code-niveau-sortie $(GML2SPHINX) $(LHEOGML)
source/lheo/url-formation.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page url-formation $(GML2SPHINX) $(LHEOGML)
source/lheo/modalites-alternance.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page modalites-alternance $(GML2SPHINX) $(LHEOGML)
source/lheo/modalites-enseignement.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page modalites-enseignement $(GML2SPHINX) $(LHEOGML)
source/lheo/conditions-specifiques.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page conditions-specifiques $(GML2SPHINX) $(LHEOGML)
source/lheo/code-modalite-pedagogique.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page code-modalite-pedagogique $(GML2SPHINX) $(LHEOGML)
source/lheo/prise-en-charge-frais-possible.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page prise-en-charge-frais-possible $(GML2SPHINX) $(LHEOGML)
source/lheo/frais-restants.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page frais-restants $(GML2SPHINX) $(LHEOGML)
source/lheo/langue-formation.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page langue-formation $(GML2SPHINX) $(LHEOGML)
source/lheo/lieu-de-formation.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page lieu-de-formation $(GML2SPHINX) $(LHEOGML)
source/lheo/modalites-entrees-sorties.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page modalites-entrees-sorties $(GML2SPHINX) $(LHEOGML)
source/lheo/session.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page session $(GML2SPHINX) $(LHEOGML)
source/lheo/adresse-inscription.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page adresse-inscription $(GML2SPHINX) $(LHEOGML)
source/lheo/adresse-information.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page adresse-information $(GML2SPHINX) $(LHEOGML)
source/lheo/date-information.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page date-information $(GML2SPHINX) $(LHEOGML)
source/lheo/url-action.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page url-action $(GML2SPHINX) $(LHEOGML)
source/lheo/numero-activite.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page numero-activite $(GML2SPHINX) $(LHEOGML)
source/lheo/SIRET-organisme-formation.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page SIRET-organisme-formation $(GML2SPHINX) $(LHEOGML)
source/lheo/raison-sociale.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page raison-sociale $(GML2SPHINX) $(LHEOGML)
source/lheo/coordonnees-organisme.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page coordonnees-organisme $(GML2SPHINX) $(LHEOGML)
source/lheo/type-contact.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page type-contact $(GML2SPHINX) $(LHEOGML)
source/lheo/contact-organisme.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page contact-organisme $(GML2SPHINX) $(LHEOGML)
source/lheo/contact-formateur.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page contact-formateur $(GML2SPHINX) $(LHEOGML)
source/lheo/renseignements-specifiques.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page renseignements-specifiques $(GML2SPHINX) $(LHEOGML)
source/lheo/organisme-financeur.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page organisme-financeur $(GML2SPHINX) $(LHEOGML)
source/lheo/nb-places-financees.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page nb-places-financees $(GML2SPHINX) $(LHEOGML)
source/lheo/modalites-recrutement.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page modalites-recrutement $(GML2SPHINX) $(LHEOGML)
source/lheo/modalites-pedagogiques.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page modalites-pedagogiques $(GML2SPHINX) $(LHEOGML)
source/lheo/SIRET-formateur.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page SIRET-formateur $(GML2SPHINX) $(LHEOGML)
source/lheo/raison-sociale-formateur.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page raison-sociale-formateur $(GML2SPHINX) $(LHEOGML)
source/lheo/code-perimetre-recrutement.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page code-perimetre-recrutement $(GML2SPHINX) $(LHEOGML)
source/lheo/infos-perimetre-recrutement.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page infos-perimetre-recrutement $(GML2SPHINX) $(LHEOGML)
source/lheo/prix-horaire-TTC.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page prix-horaire-TTC $(GML2SPHINX) $(LHEOGML)
source/lheo/prix-total-TTC.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page prix-total-TTC $(GML2SPHINX) $(LHEOGML)
source/lheo/nombre-heures-centre.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page nombre-heures-centre $(GML2SPHINX) $(LHEOGML)
source/lheo/nombre-heures-entreprise.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page nombre-heures-entreprise $(GML2SPHINX) $(LHEOGML)
source/lheo/nombre-heures-total.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page nombre-heures-total $(GML2SPHINX) $(LHEOGML)
source/lheo/detail-conditions-prise-en-charge.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page detail-conditions-prise-en-charge $(GML2SPHINX) $(LHEOGML)
source/lheo/conventionnement.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page conventionnement $(GML2SPHINX) $(LHEOGML)
source/lheo/duree-conventionnee.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page duree-conventionnee $(GML2SPHINX) $(LHEOGML)
source/lheo/code-financeur.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page code-financeur $(GML2SPHINX) $(LHEOGML)
source/lheo/restauration.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page restauration $(GML2SPHINX) $(LHEOGML)
source/lheo/hebergement.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page hebergement $(GML2SPHINX) $(LHEOGML)
source/lheo/transport.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page transport $(GML2SPHINX) $(LHEOGML)
source/lheo/acces-handicapes.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page acces-handicapes $(GML2SPHINX) $(LHEOGML)
source/lheo/positionnement.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page positionnement $(GML2SPHINX) $(LHEOGML)
source/lheo/etat-recrutement.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page etat-recrutement $(GML2SPHINX) $(LHEOGML)
source/lheo/identifiant-module.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page identifiant-module $(GML2SPHINX) $(LHEOGML)
source/lheo/reference-module.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page reference-module $(GML2SPHINX) $(LHEOGML)
source/lheo/sous-modules.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page sous-modules $(GML2SPHINX) $(LHEOGML)
source/lheo/modules-prerequis.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page modules-prerequis $(GML2SPHINX) $(LHEOGML)
source/lheo/sous-module.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page sous-module $(GML2SPHINX) $(LHEOGML)
source/lheo/type-module.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page type-module $(GML2SPHINX) $(LHEOGML)
source/lheo/code-NSF.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page code-NSF $(GML2SPHINX) $(LHEOGML)
source/lheo/code-FORMACODE.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page code-FORMACODE $(GML2SPHINX) $(LHEOGML)
source/lheo/code-ROME.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page code-ROME $(GML2SPHINX) $(LHEOGML)
source/lheo/code-public-vise.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page code-public-vise $(GML2SPHINX) $(LHEOGML)
source/lheo/info-public-vise.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page info-public-vise $(GML2SPHINX) $(LHEOGML)
source/lheo/code-RNCP.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page code-RNCP $(GML2SPHINX) $(LHEOGML)
source/lheo/code-CERTIFINFO.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page code-CERTIFINFO $(GML2SPHINX) $(LHEOGML)
source/lheo/coordonnees.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page coordonnees $(GML2SPHINX) $(LHEOGML)
source/lheo/SIRET.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page SIRET $(GML2SPHINX) $(LHEOGML)
source/lheo/adresse.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page adresse $(GML2SPHINX) $(LHEOGML)
source/lheo/ligne.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page ligne $(GML2SPHINX) $(LHEOGML)
source/lheo/prenom.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page prenom $(GML2SPHINX) $(LHEOGML)
source/lheo/civilite.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page civilite $(GML2SPHINX) $(LHEOGML)
source/lheo/nom.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page nom $(GML2SPHINX) $(LHEOGML)
source/lheo/codepostal.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page codepostal $(GML2SPHINX) $(LHEOGML)
source/lheo/code-INSEE-commune.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page code-INSEE-commune $(GML2SPHINX) $(LHEOGML)
source/lheo/code-INSEE-canton.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page code-INSEE-canton $(GML2SPHINX) $(LHEOGML)
source/lheo/ville.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page ville $(GML2SPHINX) $(LHEOGML)
source/lheo/departement.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page departement $(GML2SPHINX) $(LHEOGML)
source/lheo/region.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page region $(GML2SPHINX) $(LHEOGML)
source/lheo/pays.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page pays $(GML2SPHINX) $(LHEOGML)
source/lheo/geolocalisation.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page geolocalisation $(GML2SPHINX) $(LHEOGML)
source/lheo/latitude.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page latitude $(GML2SPHINX) $(LHEOGML)
source/lheo/longitude.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page longitude $(GML2SPHINX) $(LHEOGML)
source/lheo/courriel.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page courriel $(GML2SPHINX) $(LHEOGML)
source/lheo/web.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page web $(GML2SPHINX) $(LHEOGML)
source/lheo/urlweb.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page urlweb $(GML2SPHINX) $(LHEOGML)
source/lheo/telfixe.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page telfixe $(GML2SPHINX) $(LHEOGML)
source/lheo/portable.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page portable $(GML2SPHINX) $(LHEOGML)
source/lheo/fax.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page fax $(GML2SPHINX) $(LHEOGML)
source/lheo/numtel.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page numtel $(GML2SPHINX) $(LHEOGML)
source/lheo/modalites-inscription.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page modalites-inscription $(GML2SPHINX) $(LHEOGML)
source/lheo/periode.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page periode $(GML2SPHINX) $(LHEOGML)
source/lheo/periode-inscription.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page periode-inscription $(GML2SPHINX) $(LHEOGML)
source/lheo/debut.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page debut $(GML2SPHINX) $(LHEOGML)
source/lheo/fin.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page fin $(GML2SPHINX) $(LHEOGML)
source/lheo/date.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page date $(GML2SPHINX) $(LHEOGML)
source/lheo/extras.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page extras $(GML2SPHINX) $(LHEOGML)
source/lheo/extra.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page extra $(GML2SPHINX) $(LHEOGML)
source/lheo/lheo-index.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page lheo-index $(GML2SPHINX) $(LHEOGML)
source/lheo/resumes-offres.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page resumes-offres $(GML2SPHINX) $(LHEOGML)
source/lheo/resumes-organismes.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page resumes-organismes $(GML2SPHINX) $(LHEOGML)
source/lheo/resume-offre.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page resume-offre $(GML2SPHINX) $(LHEOGML)
source/lheo/resume-organisme.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page resume-organisme $(GML2SPHINX) $(LHEOGML)
source/lheo/contact-formation-resume.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page contact-formation-resume $(GML2SPHINX) $(LHEOGML)
source/lheo/lheo-plus.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page lheo-plus $(GML2SPHINX) $(LHEOGML)
source/lheo/code-UAI.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page code-UAI $(GML2SPHINX) $(LHEOGML)
source/lheo/code-RS.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page code-RS $(GML2SPHINX) $(LHEOGML)
source/lheo/code-CPF.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page code-CPF $(GML2SPHINX) $(LHEOGML)
source/lheo/code-ELU.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page code-ELU $(GML2SPHINX) $(LHEOGML)
source/lheo/SIRET-lieu-formation.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page SIRET-lieu-formation $(GML2SPHINX) $(LHEOGML)
source/lheo/code-type-formation.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page code-type-formation $(GML2SPHINX) $(LHEOGML)	
source/lheo/dict-boolean.rst: $(GML2SPHINX) $(LHEOGML)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam action table --stringparam page dict-boolean $(GML2SPHINX) $(LHEOGML)
source/lheo/dict-modalites-enseignement.rst: $(GML2SPHINX) $(LHEOGML)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam action table --stringparam page dict-modalites-enseignement $(GML2SPHINX) $(LHEOGML)
source/lheo/dict-modalites-es.rst: $(GML2SPHINX) $(LHEOGML)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam action table --stringparam page dict-modalites-es $(GML2SPHINX) $(LHEOGML)
source/lheo/dict-etat-recrutement.rst: $(GML2SPHINX) $(LHEOGML)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam action table --stringparam page dict-etat-recrutement $(GML2SPHINX) $(LHEOGML)
source/lheo/dict-AIS.rst: $(GML2SPHINX) $(LHEOGML)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam action table --stringparam page dict-AIS $(GML2SPHINX) $(LHEOGML)
source/lheo/dict-perimetre-recrutement.rst: $(GML2SPHINX) $(LHEOGML)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam action table --stringparam page dict-perimetre-recrutement $(GML2SPHINX) $(LHEOGML)
source/lheo/dict-financeurs.rst: $(GML2SPHINX) $(LHEOGML)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam action table --stringparam page dict-financeurs $(GML2SPHINX) $(LHEOGML)
source/lheo/dict-type-parcours.rst: $(GML2SPHINX) $(LHEOGML)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam action table --stringparam page dict-type-parcours $(GML2SPHINX) $(LHEOGML)
source/lheo/dict-type-positionnement.rst: $(GML2SPHINX) $(LHEOGML)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam action table --stringparam page dict-type-positionnement $(GML2SPHINX) $(LHEOGML)
source/lheo/dict-type-module.rst: $(GML2SPHINX) $(LHEOGML)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam action table --stringparam page dict-type-module $(GML2SPHINX) $(LHEOGML)
source/lheo/dict-niveaux.rst: $(GML2SPHINX) $(LHEOGML)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam action table --stringparam page dict-niveaux $(GML2SPHINX) $(LHEOGML)
source/lheo/dict-type-contact.rst: $(GML2SPHINX) $(LHEOGML)
	xsltproc  -o $@ --stringparam glossaire $(LHEOGLO) --stringparam action table --stringparam page dict-type-contact $(GML2SPHINX) $(LHEOGML)

# Generated
source/glossaire.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page glossaire $(GML2SPHINX) $(LHEOGML)

# Manually edited
source/index.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page index $(GML2SPHINX) $(LHEOGML)
source/structure.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page structure $(GML2SPHINX) $(LHEOGML)
source/cercle1.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page cercle1 $(GML2SPHINX) $(LHEOGML)
source/cercle2.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page cercle2 $(GML2SPHINX) $(LHEOGML)
source/cercle3.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page cercle3 $(GML2SPHINX) $(LHEOGML)
source/types.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page types $(GML2SPHINX) $(LHEOGML)
source/tables.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page tables $(GML2SPHINX) $(LHEOGML)

.PHONY: help Makefile html clean

html: Makefile $(LHEOFILES) $(TOCFILES)
	$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

clean: Makefile
	$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
	rm -f $(LHEOFILES) $(TOCFILES)

publish: html
	ssh $(PUBLISHHOST) "mkdir -p $(PUBLISHDIR)"
	rsync --archive --verbose build/html/. $(PUBLISHHOST):$(PUBLISHDIR)

publish-prod: html
	ssh $(PRODHOST) "mkdir -p $(PRODDIR)"
	rsync --archive --verbose build/html/. $(PRODHOST):$(PRODDIR)
