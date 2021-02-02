# -*- coding: utf-8 -*-
import uuid
import os

from lxml import etree

ns = {
	"lheo": "http://www.lheo.org/2.2",
}


class LHEOElement(object):

	namespace = '{%s}' % ns.get('lheo')
	nsmap = {None : ns.get('lheo')}

	def __init__(self, element, parent=None):
		self.element = element
		self.parent = parent

	def identifier(self):
		#idl = []
		#if self.parent is not None:
		#	pid = self.parent.identifier()
		#	if pid:
		#		idl.append(pid)
		numero = self.element.get('numero')
		if numero:
			return numero
		id = self.element.get('id')
		if id:
			return id
		return None

	def xpath(self, expr):
		result = self.element.xpath(expr, namespaces=ns)
		return result

	def get_element(self, elname):
		x = self.xpath('lheo:'+elname)
		if x:
			return x[0]
		return None

	def text_content(self, elname):
		x = self.get_element(elname)
		if x is not None:
			return x.text
		return None

	@classmethod
	def create_element(cls, name):
		element = etree.Element(cls.namespace + name, nsmap=cls.nsmap)
		return element


class LHEOSession(LHEOElement):
	pass


class LHEOAction(LHEOElement):

	def sessions(self):
		for session_el in self.element.xpath('lheo:session', namespaces=ns):
			yield LHEOSession(session_el, self)

	def duree_indicative(self):
		return self.text_content('duree-indicative')


class LHEOFormation(LHEOElement):

	def actions(self):
		for action_el in self.element.xpath('lheo:action', namespaces=ns):
			yield LHEOAction(action_el, self)

	def intitule_formation(self):
		return self.text_content('intitule-formation')

	def objectif_formation(self):
		return self.text_content('objectif-formation')

	def certifiante(self):
		return self.text_content('certifiante')

	def url_formation(self):
		res = self.xpath('lheo:url-formation/lheo:urlweb[1]')
		if res:
			return res[0].text
		return None

	def identifiant_module(self):
		return self.text_content('identifiant-module')

	def organisme_formation_responsable(self):
		return self.get_element('organisme-formation-responsable')

	def formacodes(self):
		dom = self.get_element('domaine-formation')
		formacodes = []
		for f in dom.xpath('lheo:code-FORMACODE', namespaces=ns):
			formacodes.append(f.text)
		return formacodes

	def romes(self):
		dom = self.get_element('domaine-formation')
		codes = []
		for f in dom.xpath('lheo:code-ROME', namespaces=ns):
			codes.append(f.text)
		return codes

	def nsfs(self):
		dom = self.get_element('domaine-formation')
		codes = []
		for f in dom.xpath('lheo:code-NSF', namespaces=ns):
			codes.append(f.text)
		return codes


class LHEOOrganismeFormationResponsable(LHEOElement):

	def identifier(self):
		na = self.text_content('numero-activite')
		if na != None and na != '99999999999' and na != '00000000000':
			return na
		return super().identifier()


class LHEOAdresse(LHEOElement):

	def lignes(self):
		r = self.xpath('lheo:ligne')
		if r:
			for ligne in r:
				yield ligne
		return None

	@property
	def codepostal(self):
		return self.get_element('codepostal')

	@property
	def ville(self):
		return self.get_element('ville')

	@property
	def pays(self):
		return self.get_element('pays')

	def html(self, no_surrounding=False, strong_first=True):
		s = []
		# Lignes
		for ligne in self.lignes():
			if strong_first:
				if s:
					s.append(ligne.text)
				else:
					s.append("<strong>%s</strong>" % ligne.text)
			else:
				s.append(ligne.text)
		# Codepostal / Ville
		if self.codepostal is not None and self.ville is not None:
			cpv = "%s %s" % (self.codepostal.text, self.ville.text)
			s.append(cpv)
		# Pays
		if self.pays is not None:
			s.append(self.pays.text)
		if s:
			if no_surrounding:
				return '<br/>'.join(s)
			else:
				return "<address>\n%s\n</address>" % '<br/>'.join(s)
		return None


class LHEORoot(object):

	namespace = '{%s}' % ns.get('lheo')
	nsmap = {None : ns.get('lheo')}

	def __init__(self, root, idfilename=None):
		self.root = root
		self.ids = dict()
		if idfilename:
			#
			# Read or generate IDs
			#
			if os.path.exists(idfilename):
				print("Read IDs")
				with open(idfilename, 'r') as f:
					for line in f:
						line = line.strip()
						f_n, a_n, s_n, f_id, a_id, s_id, o_id = line.split('|')
						self.ids[(int(f_n), int(a_n), int(s_n))] = (f_id, a_id, s_id, o_id)
			else:
				print("Generate IDs")
				self.build_identifiers()
				with open(idfilename, 'w') as f:
					for k, v in self.ids.items():
						f.write(str('|'.join(map(str, k))))
						f.write('|')
						f.write(str('|'.join(map(str, v))))
						f.write('\n')

	def formations(self):
		for formation_el in self.root.xpath('/lheo:lheo/lheo:offres/lheo:formation', namespaces=ns):
			yield LHEOFormation(formation_el)

	@classmethod
	def create(cls):
		root = etree.Element(cls.namespace + "lheo", nsmap=cls.nsmap)
		etree.SubElement(root, cls.namespace + "offres")

	def build_identifiers(self):
		f_n = 0
		for formation in self.formations():
			f_n += 1
			formation_id = formation.identifier()
			if formation_id is None:
				formation_id = uuid.uuid4().hex
			ofr_element = formation.organisme_formation_responsable()
			assert ofr_element is not None
			ofr = LHEOOrganismeFormationResponsable(ofr_element)
			ofr_identifier = ofr.identifier()
			if ofr_identifier is None:
				ofr_identifier = uuid.uuid4().hex
			a_n = 1
			for action in formation.actions():
				action_id = action.identifier()
				if action_id is None:
					action_id = uuid.uuid4().hex
				s_n = 1
				for session in action.sessions():
					session_id = session.identifier()
					if session_id is None:
						session_id = uuid.uuid4().hex
					if (f_n, a_n, s_n) in self.ids:
						formation_id, action_id, session_id, ofr_identifier = self.ids.get((f_n, a_n, s_n))
					else:
						self.ids[((f_n, a_n, s_n))] = (formation_id, action_id, session_id, ofr_identifier)
