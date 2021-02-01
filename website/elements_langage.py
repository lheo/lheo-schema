#! /usr/bin/env python
# -*- coding: utf-8 -*-
#

import sys
import optparse
import StringIO
import re

from lxml import etree, html

'''
	Ce script génère 2 fichiers mako, un pour la liste des éléments du cercle 1 et l'autre pour le cercle 2.
	Ce dernier dispose les éléments sur 2 colonnes.
'''

# éléments du cercle 1 à prendre en compte
cercle_1 = [
	'section:Offre de formation',
	'domaine-formation',
	'intitule-formation',
	'objectif-formation',
	'resultats-attendus',
	'contenu-formation',
	'certifiante',
	'contact-formation',
	'parcours-de-formation',
	'code-niveau-entree',
	'niveau-entree-obligatoire',
	'section:Organisme de formation responsable'
	'numero-activite',
	'SIRET-organisme-formation',
	'nom-organisme',
	'raison-sociale',
	'coordonnees-organisme',
	'contact-organisme',
	'section:Action de formation',
	'rythme-formation',
	'code-public-vise',
	'niveau-entree-obligatoire',
	'modalites-alternance',
	'modalites-enseignement',
	'conditions-specifiques',
	'prise-en-charge-frais-possible',
	'lieu-de-formation',
	'modalites-entrees-sorties',
	'section:Session de formation',
	'periode',
	'adresse-inscription'
]
# éléments du cercle 2 à prendre en compte
cercle_2 = [
	'section:Offre de formation',
	'objectif-general-formation',
	'certification',
	'code-niveau-sortie',
	'url-formation',
	'section:Organisme de formation responsable',
	'renseignements-specifiques',
	'potentiel',
	'section:Action de formation',
	'info-public-vise',
	'url-action',
	'adresse-information',
	'date-information',
	'restauration',
	'hebergement',
	'transport',
	'acces-handicapes',
	'langue-formation',
	'modalites-recrutement',
	'modalites-pedagogiques',
	'frais-restants',
	'code-perimetre-recrutement',
	'infos-perimetre-recrutement',
	'prix-horaire-TTC',
	'prix-total-TTC',
	'duree-indicative',
	'nombre-heures-centre',
	'nombre-heures-entreprise',
	'nombre-heures-total',
	'detail-conditions-prise-en-charge',
	'conventionnement',
	'duree-conventionnee',
	'section:Session de formation',
	'modalites-inscription',
	'periode-inscription',
	'etat-recrutement',
	'section:Organisme formateur',
	'SIRET-formateur',
	'raison-sociale-formateur',
	'contact-formateur',
	'potentiel',
	'section:Organisme financeur',
	'code-financeur',
	'nb-places-financees',
	'section:Modularisation',
	'identifiant-module',
	'positionnement',
	'sous-modules',
	'modules-prerequis'
]
# namespace
ns = {
	'gml': 'http://www.gelaba.org/gml/1.1',
	'xhtml': 'http://www.w3.org/1999/xhtml'
}


def get_glossaire_def(tree, name):
	glossaire_def = ''
	a_tag_re = re.compile(ur'<a[^>]*?>(.+)</a>', re.U | re.I)

	for elt in tree.cssselect('div.entree#%s div.definition > p' % name):
		glossaire_def = etree.tostring(elt, encoding='utf8').strip()
		m = a_tag_re.search(glossaire_def)
		if m and m.group(1):
			glossaire_def = a_tag_re.sub(m.group(1), glossaire_def)

	return glossaire_def.replace('"', '&quot;')

def sanitize_html(html):
	html = html.replace('"', '&quot;')
	html = html.replace("<p>", '')
	html = html.replace("</p>", '<br /><br />')

	return html


def main(argv=None):
	if argv is None:
		argv = sys.argv

	parser = optparse.OptionParser("usage: %prog [options]")
	parser.add_option('', '--gml', default=None, help="GML definition file")
	parser.add_option('', '--glossaire', default=None, help="Glossaire definition file")
	parser.add_option('', '--cercle1', default=None, help="generated cercle1 element file")
	parser.add_option('', '--cercle2', default=None, help="generated cercle2 element file")

	options, arguments = parser.parse_args(argv[1:])

	gml_def_path = options.gml
	glossaire_def_path = options.glossaire
	mako_cercle1 = options.cercle1
	mako_cercle2 = options.cercle2

	print("Mako éléments cercle1: %s" % mako_cercle1)
	print("Mako éléments cercle2: %s" % mako_cercle2)

	c1 = open(mako_cercle1, 'w')
	c2 = open(mako_cercle2, 'w')

	with open(gml_def_path, 'r') as f:
		gml = f.read()

	gml_parser = etree.XMLParser(encoding='utf-8', remove_comments=True)
	gml_tree = etree.parse(StringIO.StringIO(gml), gml_parser)

	with open(glossaire_def_path, 'r') as f:
		glossaire_html = f.read()

	tree = html.fromstring(glossaire_html)

	cercle_1_content = ''

	# construction de la liste des éléments du cercle1
	in_section = False
	for elt_name in cercle_1:
		if elt_name.startswith('section:'):
			if in_section:
				cercle_1_content += '</ul>\n'

			section = elt_name.replace('section:', '')
			cercle_1_content += '<h5 class="voffset">%s</h5>\n' % section
			cercle_1_content += '<ul class="list-unstyled elements">\n'

			in_section = True
		else:
			element = gml_tree.find('.//gml:definition[@name="%s"]' % elt_name, namespaces=ns)
			label = element.find('gml:fullname', ns)
			doc = element.find('gml:doc', ns)
			doc_text = doc.text.encode('utf-8') if doc is not None else ''
			# on supprime la majuscule sur la première lettre
			if doc_text != '':
				doc_text = doc_text.strip()
				doc_text = '%s%s' % (doc_text[0].lower(), doc_text[1:])

			tooltip = '%sDans le format XML&nbsp;:&nbsp;%s' % (get_glossaire_def(tree, elt_name), doc_text)

			tooltip = sanitize_html(tooltip)

			cercle_1_content += '<li><p><a href="/langage#%s" ' \
								'title="%s" ' \
								'data-toggle="tooltip" ' \
								'data-placement="top">%s</a></p></li>\n' % (elt_name, tooltip, label.text.encode('utf-8'))

	cercle_1_content += '</ul>\n'

	c1.write(cercle_1_content)
	c1.close()

	# construction de la liste des éléments du cercle2
	in_section = False
	new_col = False
	cercle_2_content = '<div class="row">'
	cercle_2_content += '<div class="col-sm-6">'
	for elt_name in cercle_2:
		if elt_name.startswith('section:'):
			if in_section:
				cercle_2_content += '</ul>\n'

			section = elt_name.replace('section:', '')

			if section == 'Session de formation':
				new_col = True

			if new_col:
				cercle_2_content += '</div>'
				cercle_2_content += '<div class="col-sm-6">'
				new_col = False

			cercle_2_content += '<h5 class="voffset">%s</h5>\n' % section
			cercle_2_content += '<ul class="list-unstyled elements">\n'
			in_section = True
		else:
			element = gml_tree.find('.//gml:definition[@name="%s"]' % elt_name, namespaces=ns)
			label = element.find('gml:fullname', ns)
			doc = element.find('gml:doc', ns)
			doc_text = doc.text.encode('utf-8') if doc is not None else ''
			# on supprime la majuscule sur la première lettre
			if doc_text != '':
				doc_text = doc_text.strip()
				doc_text = '%s%s' % (doc_text[0].lower(), doc_text[1:])

			tooltip = '%sDans le format XML&nbsp;:&nbsp;%s' % (get_glossaire_def(tree, elt_name), doc_text)

			tooltip = sanitize_html(tooltip)

			cercle_2_content += '<li><p><a href="/langage#%s" ' \
								'title="%s" ' \
								'data-toggle="tooltip" ' \
								'data-placement="top">%s</a></p></li>\n' % (elt_name, tooltip, label.text.encode('utf-8'))

	cercle_2_content += '</ul>\n'
	cercle_2_content += '</div>\n</div>'

	c2.write(cercle_2_content)
	c2.close()

	'''
	<div class="row">
    <div class="col-sm-6">
        <h5 class="voffset">Offre de formation</h5>
        <ul class="list-unstyled elements">
            <li><p><a href="/langage#objectif-general-formation" title="objectif-general-formation">Objectif
                général de la formation</a></p></li>
            <li><p><a href="/langage#certification" title="certification">Certification préparée</a></p>
            </li>

	'''

if __name__ == "__main__":
	sys.exit(main())