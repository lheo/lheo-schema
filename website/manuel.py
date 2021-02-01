#! /usr/bin/env python
# -*- coding: utf-8 -*-
#

import sys
import optparse
import StringIO

from lxml import etree

ns = {
	'gml': 'http://www.gelaba.org/gml/1.1',
	'xhtml': 'http://www.w3.org/1999/xhtml'
}
elements_cercle1 = {}
elements_cercle2 = {}
elements_cercle3 = {}
elements_structurants = {}
tables = {}
all_elements = {}

def generate_element_table(elements, caption=''):
	html = '<table class="table table-striped">\n'
	html += '<caption>%s</caption>' % caption
	html += '<tbody>\n'
	html += '<tr><th>Nom de l\'élément</th><th>Balise XML</th></tr>'
	for name, e in elements.iteritems():
		html += '<tr>\n'
		html += '<td><a href="#%s" title="%s">%s</a></td>\n' % (name, name, e.fullname.encode('utf-8'))
		html += '<td><code>&lt;%s&gt;</code></td>\n' % name
		html += '</tr>\n'

	html += '</tbody>\n'
	html += '</table>\n'

	return html

def generate_element_detail(element, gmltree):
	'''
	<h3 id="domaine-formation">Domaine de la formation (NSF, FORMACODE, ROME)</h3>

            <div class="description-element">
                <p><code>&lt;domaine-formation&gt;</code></p>
                <p>Contient une séquence ordonnée des éléments&nbsp;:</p>
                <ul>
                    <li>[0,5] <code>&lt;code-FORMACODE&gt;</code> <a href="#code-FORMACODE">Code FORMACODE</a></li>
                    <li>[0,3] <code>&lt;code-NSF&gt;</code> <a href="#code-NSF">Code NSF</a></li>
                    <li>[0,5] <code>&lt;code-ROME&gt;</code> <a href="#code-ROME">Code ROME</a></li>
                    <li>[0,N] <code>&lt;extras&gt;</code> <a href="#extras">Conteneur d'éléments d'extension (cercle 3)</a></li>
                </ul>
                <p><b>Description de l'élément</b></p>
                <p>
                    Cet élément contient des listes de codes décrivant le domaine de
                    la formation, en utilisant les nomenclatures NSF (Nomenclature
                    des Spécialités de Formation), ROME (Répertoire Opérationnel des
                    Métiers et des Emplois) et/ou le FORMACODE (thésaurus de l'offre
                    de formation du Centre Inffo). Règle de gestion : le premier code
                    FORMACODE doit être considéré comme le FORMACODE principal.
                </p>
                <p>Définition dans le glossaire&nbsp;: <a href="/glossaire#domaine-formation">
                Domaine de la formation</a></p>
                <p><b>Utilisé dans&nbsp;:</b> <code>&lt;<a href="#formation">formation</a>&gt;</code></p>
            </div>
	'''
	html = '<h3 id="%s">%s</h3>\n' % (element.name, element.fullname)
	html += '<div class="description-element">\n'
	html += '<p><code>&lt;%s&gt;</code></p>\n' % element.name
	if element.value_info != '':
		html += element.value_info
	if len(element.sequence) > 0:
		html += '<ul>\n'
		sequence = gmltree.findall('.//gml:definition[@name="%s"]/gml:element_type/gml:sequence/gml:element' % element.name, namespaces=ns)
		for e in sequence:
			bounds = ''
			if e.attrib.get('min') is not None and e.attrib.get('max') is not None:
				bounds = u'[%s,%s]&nbsp;' % (e.attrib.get('min'), e.attrib.get('max') if  e.attrib.get('max') != '0' else 'N')
			elif e.attrib.get('min') is None and e.attrib.get('max') is None:
				bounds = u'[1,1]&nbsp;'
			elif e.attrib.get('min') is None:
				bounds = u'[1,%s]&nbsp;' % e.attrib.get('max')
			elif e.attrib.get('max') is None:
				bounds = u'[%s,1]&nbsp;' % e.attrib.get('min')

			html += '<li>%s<code>&lt;%s&gt;</code>&nbsp;<a href="#%s">%s</a></li>\n' % (bounds, e.attrib.get('name'), e.attrib.get('name'), all_elements.get(e.attrib.get('name')).fullname)

		html += '</ul>\n'

	if element.doc != '':
		html += u'<p><b>Description de l\'élément</b></p>\n'
		html += u'<p>%s</p>\n' % element.doc

	if element.link_glossaire != '':
		html += u'<p>Définition dans le glossaire&nbsp;: <a href="/glossaire#%s">%s</a></p>\n' % (element.link_glossaire, element.fullname)
	if len(all_elements.get(element.name).refname) > 0:
		html += u'<p><b>Utilisé dans&nbsp;:&nbsp;</b>'
		for ref in all_elements.get(element.name).refname:
			html += u'<a href="#%s"><code>&lt;%s&gt;</code></a>, ' % (ref, ref)
		html = html[:-2]
		html += u'</p>\n'
	html += u'</div>'

	return html.encode('utf-8')

def generate_details(gmltree):
	html = ''

	for k, e in elements_cercle1.iteritems():
		html += generate_element_detail(e, gmltree)
	for k, e in elements_cercle2.iteritems():
		html += generate_element_detail(e, gmltree)
	for k, e in elements_cercle3.iteritems():
		html += generate_element_detail(e, gmltree)
	for k, e in elements_structurants.iteritems():
		html += generate_element_detail(e, gmltree)

	return html

def generate_tables():
	html = u''

	# Génération de la liste des tables
	html += u'<ul>\n'
	for name, table in tables.iteritems():
		html += u'<li><a title="%s" href="#%s">%s</a> (<code>%s</code>)</li>\n' % (name, name, table.fullname, name)

	html += u'</ul>\n'

	# Génération des détails sur les tables
	html += u'<div class="table">\n'
	for name, table in tables.iteritems():

		html += u'<table class="table table-striped">\n'
		html += u'<caption>\n'
		html += u'<h3 id="%s">%s [<code>%s</code>]</h3>\n' % (name, table.fullname, name)
		html += u'<p>\n'
		html += u'\u00C9lément(s) de LH\u00C9O utilisant cette table&nbsp;:\n'
		for elt_name in table.ref_names:
			html += u'<code>&lt;<a href="#%s">%s</a>&gt;</code>,&nbsp;' % (elt_name, elt_name)
		html = html[:-7]
		html += u'</p>\n'
		html += u'</caption>\n'

		html += u'<thead>\n'
		html += u'<tr><th>Clé(s)</th><th>Valeur</th></tr>\n'
		html += u'</thead>\n'
		html += u'<tbody>\n'
		for key in sorted(table.entries):
			html += u'<tr>\n'
			html += u'<td class="cle-table"><code>%s</code></td>\n' % key
			html += u'<td class="valeur-table">%s</td>\n' % table.entries.get(key)
			html += u'</tr>\n'
		html += u'\n'
		html += u'</tbody>\n'
		html += u'</table>\n'
	html += u'</div>\n'

	return html.encode('utf-8')

def main(argv=None):
	if argv is None:
		argv = sys.argv

	parser = optparse.OptionParser("usage: %prog [options]")
	parser.add_option('', '--gml', default=None, help="GML definition file")

	options, arguments = parser.parse_args(argv[1:])

	gml_def_path = options.gml
	tpl_langage_mako_path = './manuel_tpl.mako'

	out = open('../target/2.2/langage.mako', 'w')

	with open(tpl_langage_mako_path, 'r') as tpl:
		mako = tpl.read()

	with open(gml_def_path, 'r') as f:
		gml = f.read()

	gml_parser = etree.XMLParser(encoding='utf-8', remove_comments=True)
	gml_tree = etree.parse(StringIO.StringIO(gml), gml_parser)

	# Construction des structures de données contenant les éléments
	# Tables GML (doivent être construites avant les éléments GML
	dicts = gml_tree.findall('.//gml:dict', namespaces=ns)
	for dict in dicts:
		gml_table = GmlTable(dict.get('name'))
		fullname = dict.find('gml:fullname', ns)
		if fullname is not None:
			gml_table.fullname = fullname.text

		entries = dict.findall('gml:entry', ns)
		for entry in entries:
			key = entry.find('gml:key', ns)
			value = entry.find('gml:value', ns)

			gml_table.entries[key.get('val')] = value.get('val')

		tables[gml_table.name] = gml_table

	# Eléments GML
	definitions = gml_tree.findall('.//gml:definition', namespaces=ns)
	for definition in definitions:
		gml_elt = GmlElement(definition.get('name'))
		fullname = definition.find('gml:fullname', ns)
		if fullname is not None:
			gml_elt.fullname = fullname.text
		doc = definition.find('gml:doc', ns)
		if doc is not None:
			gml_elt.doc = doc.text

		element_type = definition.find('gml:element_type', ns)
		for type in element_type:
			gml_type = type.tag.replace('{%s}'%ns['gml'], '')
			if gml_type == 'basic_key':
				gml_elt.table_refname = type.get('ref')
				gml_elt.value_info = u'<p>Contient une clé alphanumérique issue de la table&nbsp;<a href="#%s">%s</a></p>\n' % (gml_elt.table_refname, tables[gml_elt.table_refname].fullname)
			if gml_type == 'sequence':
				gml_elt.value_info = u'<p>Contient une séquence ordonnée des éléments&nbsp;:</p>\n'
				for e in element_type[0]:
					gml_elt.sequence[e.get('name')] = {'min': e.get('min'), 'max': 'N' if e.get('min') == "0" and e.get('max') == '0' else e.get('max')}
			if gml_type == 'basic_text':
				gml_elt.value_info = u'Contient un texte de %s à %s caractères alphanumériques.' % (type.get('lgmin'), type.get('lgmax'))
			if gml_type == 'basic_int':
				gml_elt.value_info = u'Contient un entier compris entre %s à %s.' % (type.get('vmin'), type.get('vmax'))

		l_glossaire = definition.find('gml:property[@name="lheo:glossaire"]', ns)
		if l_glossaire is not None:
			gml_elt.link_glossaire = l_glossaire.attrib.get('value', '')

		cercle = definition.find('gml:property[@name="lheo:cercle"]', ns)
		if cercle is not None:
			gml_elt.cercle = int(cercle.attrib.get('value', '0'))

		if gml_elt.cercle == 1:
			elements_cercle1[gml_elt.name] = gml_elt
		if gml_elt.cercle == 2:
			elements_cercle2[gml_elt.name] = gml_elt
		if gml_elt.cercle == 3:
			elements_cercle3[gml_elt.name] = gml_elt
		if gml_elt.cercle == 0:
			elements_structurants[gml_elt.name] = gml_elt

		all_elements[gml_elt.name] = gml_elt

	# Etablissement des liens entre éléments et tables
	for name, e in all_elements.iteritems():
		if e.table_refname != '':
			tables.get(e.table_refname).ref_names.append(name)
		for k, v in e.sequence.iteritems():
			all_elements[k].refname.append(name)


	# génération du html pour le tableau des éléments du premier cercle
	mako = mako.replace('~elements_premier_cercle~',
	                    generate_element_table(elements_cercle1,
	                                           caption='<h2 id="premier-cercle">Éléments du premier cercle d\'informations</h2>'))

	# génération du html pour le tableau des éléments du deuxième cercle
	mako = mako.replace('~elements_deuxieme_cercle~',
	                    generate_element_table(elements_cercle2, caption='<h2 id="deuxieme-cercle">Éléments du deuxième cercle d\'informations</h2>'))

	# génération du html pour le tableau des éléments du troisième cercle
	mako = mako.replace('~elements_extension~',
	                    generate_element_table(elements_cercle3,
                                               caption='<h2 id="troisieme-cercle">Éléments d\'extension</h2>\
											            <p>\
											                Les balises <code>&lt;extras&gt;</code> et <code>&lt;extra&gt;</code>\
											                permettent d\'ajouter des informations qui ne sont pas\
											                normalisées dans le langage Lhéo ou des éléments définis dans la\
											                DTD utilisée dans le document XML.\
											            </p>'))

	# génération du html pour le tableau des éléments du troisième cercle
	mako = mako.replace('~elements_structurants~',
	                    generate_element_table(elements_structurants,
	                                           caption='<h2 id="structure">Éléments structurants</h2>\
											            <p>\
											                Ces éléments permettent de structurer et de hiérarchiser l\'information des différents cercles du langage\
											                ou sont des types de base utilisés à plusieurs endroits du format XML.\
											            </p>'))

	# génération du html pour le détail des éléments
	mako = mako.replace('~detail_elements~', generate_details(gml_tree))

	# génération du html pour la liste des tables
	mako = mako.replace('~tables~', generate_tables())


	out.write(mako)


class GmlElement(object):
	def __init__(self, name):
		self.name = name
		self.fullname = ''
		self.doc = ''
		self.link_glossaire = ''
		self.cercle = 0
		self.value_info = u''
		self.sequence = {}
		self.refname = []
		self.table_refname = ''

class GmlTable(object):
	def __init__(self, name):
		self.name = name
		self.fullname = ''
		self.entries = {}
		self.ref_names = []


if __name__ == "__main__":
	sys.exit(main())