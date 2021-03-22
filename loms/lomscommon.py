# -*- coding: utf-8 -*-
import sys
import re
from collections import Counter
import uuid

from lxml import etree

import lheocommon
import formacode

ns = {
	"loms": "http://data.europa.eu/europass/qms-xml/schema/learning-opportunities"
}

content_hacks = {
	"f24c98135a2543b3adea164f8450f18d": """A compter de la rentrée 2020, la classe de terminale est organisée en enseignements communs, en enseignements de spécialité et en enseignements optionnels de manière à préparer progressivement à la poursuite d'études. Les enseignements communs dispensés à tous les élèves sont les suivants (horaires hebdomadaires) : philosophie (4 h); histoire - géographie (3 h), langues vivantes A et B ( 4 h ; la langue vivante B peut être étrangère ou régionale), éducation physique et sportive (2 h), enseignement scientifique (2 h), enseignement moral et civique (18 h annuelles). En plus des enseignements communs, l'élève doit suivre deux enseignements de spécialité de 6 heures hebdomadaires parmi ceux déjà choisis en classe de première . A titre exceptionnel, le choix d'un enseignement de spécialité différent de ceux choisis en classe de première, est possible après avis du conseil de classe en fin d'année de première. Ces deux enseignements de spécialité sont choisis dans la liste suivante : 1) arts (un enseignement au choix parmi arts plastiques, cinéma-audiovisuel, danse, histoire des arts, théâtre, musique ou arts du cirque), 2) histoire - géographie, géopolitique et sciences politiques, 3) humanités, littérature et philosophie, 4) langues, littératures et cultures étrangères, 5) littérature et langues et cultures de l'Antiquité, 6) mathématiques, 7) numérique et sciences informatiques, 8) physique-chimie, 9) sciences de la vie et de la Terre, 10) sciences de l'ingénieur (enseignement complété par 2 h de sciences physique), 11) sciences économiques et sociales, 12) biologie-écologie (uniquement dans les lycées agricoles). Les élèves qui le souhaitent peuvent choisir un enseignement optionnel de 3 h hebdomadaires parmi : mathématiques complémentaires (pour les élèves ne choisissant pas en terminale la spécialité "mathématiques"), mathématiques expertes (pour les élèves choississant en terminale la spécialité "mathématiques") ou droit et grand enjeux du monde contemporain ; et un autre enseignement optionnel de 3 h hebdomadaires parmi : langue vivante C étrangère ou régionale, langues et cultures de l'Antiquité : latin ou grec (peuvent être choisis en plus d'un autre enseignement optionnel),éducation physique et sportive, arts (un enseignement au choix parmi arts plastiques, cinéma-audiovisuel, danse, histoire des arts, musique ou théâtre avec possibilité de cumuler, en enseignement de spécialité et en enseignement optionnel, deux enseignements relevant d'un même domaine artistique ou non), et en lycée agricole uniquement : hippologie et équitation, agronomie-économie-territoires, pratiques sociales et culturelles. Les élèves bénéficient d'un accompagnement personnalisé (volume horaire déterminé selon les besoins des élèves) dont une aide à l'orientation. L'accompagnement personnalisé est destiné à soutenir la capacité d'apprendre et de progresser des élèves, notamment dans leur travail personnel, à améliorer leurs compétences et à contribuer à la constructio"""
}


class LOMSRoot(object):

	namespace = '{%s}' % ns.get('loms')
	nsmap = {None : ns.get('loms')}

	def __init__(self, root):
		self.root = root

		r = self.root.xpath(
			'/loms:qmsLearningOpportunities/loms:learningOpportunities',
			namespaces=ns)
		self.learning_opportunities = r[0] if r else None

		r = self.root.xpath(
			'/loms:qmsLearningOpportunities/loms:learningSpecificationReferences',
			namespaces=ns)
		self.learning_specification_references = r[0] if r else None

		r = self.root.xpath(
			'/loms:qmsLearningOpportunities/loms:learningOutcomeReferences',
			namespaces=ns)
		self.learning_outcome_references = r[0] if r else None

		r = self.root.xpath(
			'/loms:qmsLearningOpportunities/loms:agentReferences',
			namespaces=ns)
		self.agent_references = r[0] if r else None

	@classmethod
	def create(cls):
		root = etree.Element(cls.namespace + "qmsLearningOpportunities", nsmap=cls.nsmap)
		etree.SubElement(root, cls.namespace + "learningOpportunities")
		etree.SubElement(root, cls.namespace + "learningSpecificationReferences")
		etree.SubElement(root, cls.namespace + "learningOutcomeReferences")
		etree.SubElement(root, cls.namespace + "agentReferences")
		return cls(root)


class LOMSElement(object):

	namespace = '{%s}' % ns.get('loms')
	nsmap = {None : ns.get('loms')}

	def __init__(self, element, parent=None):
		self.element = element
		self.parent = parent

	@classmethod
	def create_element(cls, name):
		element = etree.Element(cls.namespace + name, nsmap=cls.nsmap)
		return element

	@classmethod
	def create(cls, name):
		element = cls.create_element(name)
		return cls(element)


class LOMSLearningOpportunity(LOMSElement):

	@classmethod
	def create(cls):
		return super().create("learningOpportunity")


class LOMSOrganization(LOMSElement):

	@classmethod
	def create(cls):
		return super().create("organization")


class LOMSTransformer(object):

	def __init__(self, lheo_root, formacode_isced, provider, ids):
		"""root: lheo XML document's root"""
		#self.root = root
		self.lheo_root = lheo_root
		self.loms_root = LOMSRoot.create()
		self.opportunities = []
		self.organizations = dict()  # organizations organised by IDs
		self.specifications = dict()  # organized by IDs
		self.outcomes = dict()
		self.formacode_isced = formacode_isced
		self.provider = provider
		self.ids = ids
		self.counters = Counter()

	def transform_formation(self, formation, f_n):
		self.counters['formation'] += 1
		formation_id = formation.identifier()
		if formation_id is None:
			formation_id = uuid.uuid4().hex
		formacodes = formation.formacodes()
		if not formacodes:
			print("ERROR: no formacode in formation %s." % formation_id, file=sys.stderr)
			print("   NSF: %s" % formation.nsfs(), file=sys.stderr)
			print("   ROME: %s" % formation.romes(), file=sys.stderr)
			return 0
		isced_codes, isceds, tsources = formacode.create_isced_list(formacodes, self.formacode_isced)
		if not isced_codes:
			from pprint import pformat
			print("ERROR formacode not found in formation %s." % formation_id, file=sys.stderr)
			print("  %s" % isceds, file=sys.stderr)
			print("  %s" % tsources, file=sys.stderr)
			return 0
		ofr_element = formation.organisme_formation_responsable()
		assert ofr_element is not None
		ofr = lheocommon.LHEOOrganismeFormationResponsable(ofr_element)
		ofr_identifier = ofr.identifier()
		if ofr_identifier is None:
			ofr_identifier = uuid.uuid4().hex
		# PARCOURS (ONISEP)
		parcours_s = None
		parcours = formation.xpath(
			"lheo:extras[@info='PARCOURS ACTION ONISEP']/lheo:extra[@info='PARCOURS ACTION ONISEP']")
		if parcours:
			ls = []
			for parcour in parcours:
				ps = []
				lib = parcour.xpath("lheo:extra[@info='LIBELLE PARCOURS ACTION ONISEP']", namespaces=lheocommon.ns)
				if lib:
					ps.append(lib[0].text.lstrip('.'))
				sits = parcour.xpath("lheo:extra[@info='SITUATION PARCOURS ACTION ONISEP']", namespaces=lheocommon.ns)
				if sits:
					sl = []
					for sit in sits:
						sl.append(sit.text)
					ps.append("[%s]" % ", ".join(sl))
				ls.append(" ".join(ps))
			parcours_s = "Parcours : " + " ; ".join(ls) + "."
		a_n = 1
		for action in formation.actions():
			self.counters['action'] += 1
			action_id = action.identifier()
			if action_id is None:
				action_id = uuid.uuid4().hex

			# duree-indicative -> duration
			duration = None
			duree_indicative = action.duree_indicative()
			if duree_indicative is not None:
				d_r = re.compile("(\d)+\sans?", re.IGNORECASE)
				d_m = d_r.search(duree_indicative)
				if d_m is not None:
					duration = 'P' + d_m.group(1) + 'Y'

			s_n = 1
			for session in action.sessions():
				self.counters['session'] += 1
				session_id = session.identifier()
				if session_id is None:
					session_id = uuid.uuid4().hex
				if (f_n, a_n, s_n) in self.ids:
					formation_id, action_id, session_id, ofr_identifier = self.ids.get((f_n, a_n, s_n))
				else:
					self.ids[((f_n, a_n, s_n))] = (formation_id, action_id, session_id, ofr_identifier)
				# THIS IS WHERE THE TRANSFORMATION OCCURS
				#
				# agentReferences/organization
				#
				ofr_id = 'ofr:' + self.provider + ':' + ofr_identifier
				if ofr_id in self.organizations:
					loms_organization = self.organizations.get(ofr_id)
				else:
					loms_organization = LOMSElement.create_element('organization')
					loms_organization.set('id', ofr_id)
					# Name
					pref_label = LOMSElement.create_element('prefLabel')
					text = LOMSElement.create_element('text')
					pref_label.append(text)
					text.set('lang', 'fr')
					text.set('content-type', 'text/plain')  # TODO: check content
					text.text = ofr.text_content('nom-organisme')
					loms_organization.append(pref_label)
					# homepage
					wpages = ofr.xpath('lheo:coordonnees-organisme/lheo:coordonnees/lheo:web/lheo:urlweb')
					if wpages:
						for wpage in wpages:
							homepage = LOMSElement.create_element('homepage')
							homepage.set('uri', wpage.text)
							loms_organization.append(homepage)
					# Space location
					location = LOMSElement.create_element('hasLocation')
					r = ofr.xpath('lheo:coordonnees-organisme/lheo:coordonnees/lheo:adresse')
					if r:
						has_address = LOMSElement.create_element('hasAddress')
						full_address = LOMSElement.create_element('fullAddress')
						text = LOMSElement.create_element('text')
						text.set('lang', 'fr')
						text.set('content-type', 'text/html')
						adresse = lheocommon.LHEOAdresse(r[0])
						text.text = adresse.html()
						full_address.append(text)
						has_address.append(full_address)
						location.append(has_address)
					spatial_code = LOMSElement.create_element('spatialCode')
					spatial_code.set('uri', 'http://publications.europa.eu/resource/authority/country/FRA')
					location.append(spatial_code)
					loms_organization.append(location)
					self.organizations[ofr_id] = loms_organization
					self.loms_root.agent_references.append(loms_organization)
				#
				# /agentReferences/organization
				#
				#
				# learningOpportunityReferences/learningOpportunity
				#
				lo = LOMSLearningOpportunity.create()
				#
				# identifier = "formation[@numero|@id] + '/' + action[@numero|@id] + '/' + session[@numero|@id]"
				# identifier -> learningOpportunity/@id
				# identifier -> learningOpportunity/identifier
				#
				full_id = ':'.join((formation_id, action_id, session_id))
				lo_id = 'lo:' + self.provider + ':' + full_id
				ls_id = 'ls:' + self.provider + ':' + full_id
				loc_id = 'otc:' + self.provider + ':' + full_id
				lo.element.set('id', lo_id)  # learningOpportunity/@id
				identifier = LOMSElement.create_element('identifier')
				identifier.text = session_id
				identifier.set("schemeID", "IDEO")
				identifier.set("schemeAgencyName", "ONISEP")
				identifier.set("spatialID", "http://publications.europa.eu/resource/authority/country/FRA")
				lo.element.append(identifier)  # learningOpportunity/identifier
				identifiant_module = formation.identifiant_module()
				if identifiant_module:
					identifier = LOMSElement.create_element('identifier')
					identifier.text = session_id
					identifier.set("type", "module")
					identifier.set("spatialID", "http://publications.europa.eu/resource/authority/country/FRA")
					lo.element.append(identifier)  # learningOpportunity/identifier
				#
				# formation/intitule-formation -> learningOpportunity/title/text
				#
				title = LOMSElement.create_element('title')
				text = LOMSElement.create_element('text')
				title.append(text)
				text.set('lang', 'fr')
				text.set('content-type', 'text/plain')  # TODO: check content
				text.text = formation.intitule_formation()
				lo.element.append(title)
				#
				# formation/objectif-formation -> learningOpportunity/description/text
				#
				# Pas totalement satisfaisant car la notion d'objectif de formation rejoint
				# la notion d'*outcome* dans LOMS, sauf qu'un *outcome* LOMS est formalisé
				# et nécessite un titre.
				#
				description = LOMSElement.create_element('description')  # Type: Note
				text = LOMSElement.create_element('text')
				description.append(text)
				text.set('lang', 'fr')
				text.set('content-type', 'text/plain')  # TODO: check content
				objf_s = formation.objectif_formation()
				objf_s = objf_s.replace('¿', '.')
				if parcours_s:
					objf_s = objf_s.lstrip('-')
					objf_s += ' ' + parcours_s
				text.text = objf_s
				if session_id in content_hacks:
					text.text = content_hacks.get(session_id)
				subject = LOMSElement.create_element('subject')
				description.append(subject)
				subject.set('uri', 'http://data.europa.eu/esco/qualification-topics#learning-outcomes')
				lo.element.append(description)
				#
				# formation/url-formation/urlweb[0] -> learningOpportunity/homepage
				#
				url_formation = formation.url_formation()
				if url_formation and 'www.adressrlr.cndp.fr' not in url_formation:
					if not url_formation.startswith('http://') and not url_formation.startswith('https://'):
						url_formation = 'http://' + url_formation
					# Add ID as an anchor
					url_formation += "#" + lo_id
					homepage = LOMSElement.create_element('homepage')
					homepage.set('uri', url_formation)
					language = LOMSElement.create_element('language')
					language.set('uri', 'http://publications.europa.eu/resource/authority/language/FRA')
					homepage.append(language)
					lo.element.append(homepage)
				#
				# TODO: formation/sous-modules -> learningOpportunity/hasPart
				#
				#
				# learningOpportunity/providedBy
				#
				provided_by = LOMSElement.create_element('providedBy')
				provided_by.set('idref', ofr_id)
				lo.element.append(provided_by)
				#
				# /learningOpportunity/providedBy
				#
				#
				# learningOpportunity/specifiedBy
				#
				specified_by = LOMSElement.create_element('specifiedBy')
				specified_by.set('idref', ls_id)
				lo.element.append(specified_by)
				#
				# /learningOpportunity/specifiedBy
				#
				#
				# learningOpportunity/referenceLanguage
				#
				reference_language = LOMSElement.create_element('referenceLanguage')
				reference_language.set('uri', 'http://publications.europa.eu/resource/authority/language/FRA')
				lo.element.append(reference_language)
				# add to structure
				self.opportunities.append(lo)
				self.loms_root.learning_opportunities.append(lo.element)
				#
				# /learningOpportunityReferences/learningOpportunity
				#

				#
				# learningOutcomesReferences/learningOutcome
				#
				# Same ID as the learningOpportunity (no difference in LHEO)
				assert loc_id not in self.outcomes
				loc = LOMSElement.create_element('learningOutcome')
				loc.set('id', loc_id)
				# prefLabel
				pref_label = LOMSElement.create_element('prefLabel')
				text = LOMSElement.create_element('text')
				pref_label.append(text)
				text.set('lang', 'fr')
				text.set('content-type', 'text/plain')  # TODO: check content
				text.text = formation.intitule_formation()
				loc.append(pref_label)
				# description
				description = LOMSElement.create_element('description')  # Type: Note
				text = LOMSElement.create_element('text')
				description.append(text)
				text.set('lang', 'fr')
				text.set('content-type', 'text/html')
				text.text = formation.text_content('resultats-attendus')
				subject = LOMSElement.create_element('subject')
				description.append(subject)
				subject.set('uri', 'http://data.europa.eu/esco/qualification-topics#learning-outcomes')
				loc.append(description)
				# Add to structure
				self.outcomes[loc_id] = loc
				self.loms_root.learning_outcome_references.append(loc)
				#
				# /learningOutcomesReferences/learningOutcome
				#

				#
				# learningSpecificationReferences/learningSpecification
				#
				# Same ID as the learningOpportunity (no difference in LHEO)
				assert ls_id not in self.specifications
				ls = LOMSElement.create_element('learningSpecification')
				ls.set('id', ls_id)
				# title
				title = LOMSElement.create_element('title')
				text = LOMSElement.create_element('text')
				title.append(text)
				text.set('lang', 'fr')
				text.set('content-type', 'text/plain')  # TODO: check content
				text.text = formation.intitule_formation()
				ls.append(title)
				# hasISCED-FCode
				for isced in isced_codes:
					uri = 'http://data.europa.eu/esco/isced-f/' + isced
					hasisced_fcode = LOMSElement.create_element('hasISCED-FCode')
					hasisced_fcode.set('uri', uri)
					ls.append(hasisced_fcode)
				# duration
				if duration is not None:
					duration_element = LOMSElement.create_element('duration')
					duration_element.text = duration
					ls.append(duration_element)
				# learningOutcomes
				learning_outcomes = LOMSElement.create_element('learningOutcomes')
				learning_outcome = LOMSElement.create_element('learningOutcome')
				learning_outcome.set('idref', loc_id)
				learning_outcomes.append(learning_outcome)
				ls.append(learning_outcomes)
				# Add to structure
				self.specifications[ls_id] = ls
				self.loms_root.learning_specification_references.append(ls)
				#
				# /learningSpecificationReferences/learningSpecification
				#
				s_n += 1
			a_n += 1
		return 1

	def transform(self, limit=None, after=None):
		self.counters = Counter()
		f_n = 1
		for formation in self.lheo_root.formations():
			self.transform_formation(formation, f_n)
			f_n += 1
