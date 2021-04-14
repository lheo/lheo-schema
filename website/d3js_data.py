#! /usr/bin/env python
# -*- coding: utf-8 -*-
#

import sys
import optparse
import io
import json
import re

from lxml import etree, html

# nom GML des éléments à intégrer dans le schéma d3js
schema_elements = [
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
	'objectif-general-formation',
	'certification',
	'code-niveau-sortie',
	'url-formation',
	'action',
	'rythme-formation',
	'code-public-vise',
	'modalites-alternance',
	'modalites-enseignement',
	'conditions-specifiques',
	'prise-en-charge-frais-possible',
	'lieu-de-formation',
	'modalites-entrees-sorties',
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
	'session',
	'periode',
	'adresse-inscription',
	'modalites-inscription',
	'periode-inscription',
	'etat-recrutement',
	'session/extras',
	'organisme-formateur',
	'SIRET-formateur',
	'raison-sociale-formateur',
	'contact-formateur',
	'organisme-formateur/extras',
	'organisme-financeur',
	'code-financeur',
	'nb-places-financees',
	'organisme-financeur/extras',
	'organisme-formation-responsable',
	'numero-activite',
	'SIRET-organisme-formation',
	'nom-organisme',
	'raison-sociale',
	'coordonnees-organisme',
	'contact-organisme',
	'renseignements-specifiques',
	'potentiel',
	'organisme-formation-responsable/extras',
	# Modularisation
	'identifiant-module',
	'positionnement',
	'sous-modules',
	'modules-prerequis'
]

modularisation_elements = [
	'identifiant-module',
	'positionnement',
	'sous-modules',
	'modules-prerequis'
]

elements_with_extra = [
	'session',
	'organisme-formateur',
	'organisme-financeur',
	'organisme-formation-responsable'
]

ns = {
	'gml': 'http://www.gelaba.org/gml/1.1',
	'xhtml': 'http://www.w3.org/1999/xhtml'
}

def get_glossaire_def(tree, name):
	glossaire_def = ''
	a_tag_re = re.compile(r'<a[^>]*?>(.+)</a>', re.U | re.I)

	for elt in tree.cssselect('div.entree#%s div.definition > p' % name):
		glossaire_def = etree.tostring(elt, encoding='utf8').strip().decode('utf-8')
		m = a_tag_re.search(glossaire_def)
		if m and m.group(1):
			glossaire_def = a_tag_re.sub(m.group(1), glossaire_def)

	return glossaire_def


def main(argv=None):
	if argv is None:
		argv = sys.argv

	parser = optparse.OptionParser("usage: %prog [options]")
	parser.add_option('', '--gml', default=None, help="GML definition file")
	parser.add_option('', '--glossaire', default=None, help="Glossaire definition file")
	parser.add_option('', '--json', default=None, help="generated json file")

	options, arguments = parser.parse_args(argv[1:])

	gml_def_path = options.gml
	glossaire_def_path = options.glossaire
	json_data_path = options.json

	print("GML definition file: %s" % gml_def_path)
	print("Glossaire definition file: %s" % glossaire_def_path)
	print("JSON data output file: %s" % json_data_path)

	with open(gml_def_path, 'rb') as f:
		gml = f.read()

	gml_parser = etree.XMLParser(encoding='utf-8', remove_comments=True)
	gml_tree = etree.parse(io.BytesIO(gml), gml_parser)

	with open(glossaire_def_path, 'rb') as f:
		glossaire_html = f.read()

	tree = html.fromstring(glossaire_html)

	definitions = gml_tree.findall('.//gml:definition', namespaces=ns)

	root = SchemaElement()
	root.name = 'root'
	root.label = 'Offre de formation'

	modularisation = SchemaElement()
	modularisation.label = 'Modularisation'
	modularisation.cercle = 2

	extra = SchemaElement()
	extra.label = 'Extras (cercle 3)'
	extra.cercle = 3

	tmp_elements = {}
	# 1ere passe pour créer les instances d'éléments
	for definition in definitions:
		name = definition.get('name')
		if name not in schema_elements or name in tmp_elements:
			continue

		element = SchemaElement()
		element.name = name
		label = definition.find('gml:fullname', ns)
		element.label = label.text if label is not None else name

		if element.name == 'action'\
				or element.name == 'session':
			element.label += ' (+)'
			element.cercle = 1
		if element.name == 'organisme-formation-responsable'\
				or element.name == 'periode':
			element.cercle = 1
		if element.name == 'organisme-formateur'\
				or element.name == 'code-financeur':
			element.cercle = 2

		doc = definition.find('gml:doc', ns)
		doc_text = doc.text if doc is not None else ''
		# on supprime la majuscule sur la première lettre
		if doc_text != '':
			doc_text = doc_text.strip()
			doc_text = '%s%s' % (doc_text[0].lower(), doc_text[1:])
		element.tooltip = '%sDans le format XML&nbsp;:&nbsp;%s' % (get_glossaire_def(tree, element.name), doc_text)

		props = definition.findall('gml:property', ns)
		for prop in props:
			if prop.attrib and prop.attrib.get('name') == 'lheo:cercle':
				element.cercle = int(prop.attrib.get('value', '1'))

		if element.name in modularisation_elements:
			modularisation.set_links(element)
		else:
			root.set_links(element)

		if element.name in elements_with_extra:
			element.set_links(extra.clone())

		tmp_elements[element.name] = element

	# 2e passe pour créer les liens père <-> fils
	for definition in definitions:
		name = definition.get('name')
		if name not in tmp_elements:
			continue

		element = tmp_elements[name]
		element_type = definition.find('gml:element_type', ns)
		gml_type = None
		if len(element_type) > 0: # There are children
			if element.name == 'periode-inscription':
				continue
			gml_type = element_type[0].tag.replace('{%s}'%ns['gml'], '')
			if gml_type == 'sequence':
				for e in element_type[0]: # elements of the sequence
					child_name = e.get('name')
					if child_name not in tmp_elements:
						continue

					child = tmp_elements[child_name]
					if child_name not in modularisation_elements:
						element.set_links(child)

					root.remove_child(child)

		#print('Definition: %s' % definition)

	root.set_links(modularisation)

	# tri (cercle 1 / cercle 2 / cercle 3 / has_children)
	SchemaElement.sort_children(root)


	with open(json_data_path, "w") as f:
		f.write(json.dumps(root.json(), indent=4))

	'''
	GML
	<definition name="domaine-formation">
    	<fullname xml:lang="fr">Domaine de la formation (NSF, FORMACODE, ROME)</fullname>
    	<doc xml:lang="fr">
    		...
    	</doc>
    	<element_type>
			<sequence>
				<element name="numero-activite" />
				<element name="SIRET-organisme-formation"/>
				<element name="nom-organisme" />
				<element name="raison-sociale" />
				<element name="coordonnees-organisme" />
				<element name="contact-organisme" />
				<element name="renseignements-specifiques" min="0" max="1"/>
				<element name="potentiel" min="0" max="1"/>
				<element name="extras" min="0" max="0"/>
			</sequence>
		</element_type>
    	...
    	<property name="lheo:cercle" value="1"/>
    	...
    </definition>

    JSON
    {"id": <gml name-attribute>, "name": "Domaine de la ...", "cercle": <gml property value>, "tooltip": <doc glossaire + doc gml>}
	'''


class SchemaElement(object):
	def __init__(self, parent=None):
		self.name = ''
		self.label = ''
		self.cercle = 0
		self.tooltip = ''
		self.children = []
		self.parent = parent
		self.ref_counter = 0

	def json(self):
		json = {}
		if self.name != '':
			json['lheo-id'] = self.name
		if self.label.startswith('Domaine de la formation'):
			json['name'] = u'Domaine de la formation'
		else:
			json['name'] = self.label
		if self.cercle > 0:
			json['cercle'] = self.cercle
		if self.tooltip != '':
			json['tooltip'] = self.tooltip
		if len(self.children) > 0:
			json['children'] = [c.json() for c in self.children]

		return json

	def set_links(self, element):
		if self.name == 'root':
			element.parent = self
			self.children.append(element)
		elif element.ref_counter == 0:
			element.parent = self
			self.children.append(element)
			element.ref_counter += 1
		elif element.ref_counter >= 1:
			clone = element.clone()
			clone.parent = self
			self.children.append(clone)
			clone.ref_counter = 1

	def remove_child(self, element):
		if element in self.children:
			self.children.remove(element)
			if self.name != 'root':
				element.ref_counter -= 1

	def clone(self):
		clone = SchemaElement()
		clone.name = self.name
		clone.label = self.label
		clone.cercle = self.cercle
		clone.tooltip = self.tooltip
		clone.parent = self.parent
		clone.ref_counter = 0
		clone.children = list(self.children)

		return clone

	@staticmethod
	def sort_children(element):
		element.children.sort(key=lambda x: x.cercle)
		element.children.sort(key=lambda x: len(x.children)>0)
		for c in element.children:
			SchemaElement.sort_children(c)




if __name__ == "__main__":
	sys.exit(main())