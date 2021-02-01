# -*- coding: utf-8 -*-
import logging

from xlrd import open_workbook


log = logging.getLogger(__name__)


class FormacodeIsced(object):

	def __init__(self, formacode, grdom, lib, isced_lib, isced_code):
		self.formacode = formacode
		self.grdom = grdom
		self.lib = lib
		self.isced_lib = isced_lib
		self.isced_code = isced_code

	def __repr__(self):
		return '<FormacodeIsced %s -> %s' % (self.formacode, self.isced_code)


isced_codes = set([
	'001',
	'0011',
	'011', '0111', '0112', '0113', '0114',
	'101', '1011', '1012', '1013', '1014', '1015', '102', '1021', '1022', '103', '1031', '1032',
	'104', '1041',
	'002',
	'0021',
	'003',
	'0031',
	'021', '0211', '0212', '0213', '0214', '0215', '022',
	'0221', '0222', '0223', '023', '0231', '0232', '031', '0311', '0312', '0313', '0314',
	'032', '0321', '0322', '041', '0411', '0412', '0413', '0414', '0415', '0416', '0417',
	'042', '0421', '051', '0511', '0512', '052', '0521', '0522', '053', '0531', '0532',
	'0533', '054', '0541', '0542', '061', '0611', '0612', '0613', '071', '0711',
	'0712', '0713', '0714', '0715', '0716', '072', '0721', '0722', '0723', '0724', '073',
	'0731', '0732', '081', '0811', '0812', '082', '0821', '083', '0831', '084', '0841', '091',
	'0911', '0912', '0913', '0914', '0915', '0916', '0917', '092', '0921', '0922', '0923',
])

def scrap_formacodes(formacodes):
	parts = formacodes.strip().split('\n')
	codes = set()
	for p in parts:
		p = p.strip()
		p = p.strip('• ')
		p = p.strip('◾')
		p = p.strip()
		if not p:
			continue
		try:
			sp = p.strip().split()
			codes.add((
				int(sp[0]),
				' '.join(sp[1:])
			))
		except:
			print("BAD VALUE", p)
			pass
	#print codes
	return codes

patch_data_one = """
21754	HABILLEMENT	0212	Fashion
21754	HABILLEMENT	0723	Textiles
22054	TRAVAUX PUBLICS	0732	Building and civil engineering
22454	BÂTIMENT SECOND ŒUVRE	0732	Building and civil engineering
22601	SALLE BLANCHE	0713	Electricity and energy
22685	INSTALLATION THERMIQUE SANITAIRE	0713	Electricity and energy
31307	QUALITÉ HYGIÈNE SÉCURITÉ ENVIRONNEMENT 	1022	Occupational health and safety
31333	CONTRÔLE NON DESTRUCTIF	0413	Management and administration
31354	QUALITÉ	0413	Management and administration
31303	COURANT FOUCAULT	0413	Management and administration
31315	EMISSION ACOUSTIQUE	0413	Management and administration
31320	EXAMEN ULTRASON	0413	Management and administration
31325	INTERFEROMETRIE HOLOGRAPHIQUE	0413	Management and administration
31302	MAGNETOSCOPIE	0413	Management and administration
31304	RADIOGRAPHIE INDUSTRIELLE	0413	Management and administration
31331	RESSUAGE	0413	Management and administration
31301	TEST ETANCHEITE	0413	Management and administration
31310	THERMOGRAPHIE	0413	Management and administration
31606	CONDUITE PROJET INDUSTRIEL	0413	Management and administration
31629	BUREAU MÉTHODES	0413	Management and administration
31854	TRANSPORT 	1041	Transport
32062	RECHERCHE DÉVELOPPEMENT	0413	Management and administration
32070	INNOVATION ENTREPRISE 	0413	Management and administration
32602	GESTION RISQUE FINANCIER	0411	Accounting and taxation
34074	PUBLICITÉ 	0414	Marketing and advertising
34554	COMMERCE	0416	Wholesale and retail sales
41062	BANQUE 	0412	Finance, banking and insurance
41077	GESTION RISQUE BANQUE ASSURANCE	0412	Finance, banking and insurance
42069	EMPLOYÉ COLLECTIVITÉ	1011	Domestic services
42095	TEINTURERIE PRESSING	1011	Domestic services
42097	BLANCHISSERIE	1011	Domestic services
42754	HÔTELLERIE RESTAURATION	1013	Hotel, restaurants and catering
42863	AUDIT SÉCURITÉ	1032	Protection of persons and property
43054	MÉDECINE	0912	Medecine
43454	SANTÉ SECTEUR SANITAIRE	0913	Nursing and midwifery
43454	SANTÉ SECTEUR SANITAIRE	0914 	Medical diagnostic and treatment technology
43479	MAINTENANCE BIOMÉDICALE	0914 	Medical diagnostic and treatment technology
44513	PÉDAGOGIE ALTERNANCE	0111	Education science
44515	DIDACTIQUE LANGUE	0111	Education science
44521	PÉDAGOGIE PUBLIC SPÉCIFIQUE 	0111	Education science
44534	DIDACTIQUE	0111	Education science
44542	PÉDAGOGIE 	0111	Education science
44554	INGÉNIERIE FORMATION PÉDAGOGIE	0111	Education science
44554	INGÉNIERIE FORMATION PÉDAGOGIE	0923	Social work and counselling
44557	INGÉNIERIE FORMATION	0923	Social work and counselling
44569	CONSEIL INSERTION PROFESSIONNELLE	0923	Social work and counselling
44571	ÉDUCABILITÉ COGNITIVE	0111	Education science
44586	FORMATION FORMATEUR	0114	Teacher training with subject specialisation
44577	FORMATION FORMATEUR OCCASIONNEL	0114	Teacher training with subject specialisation
45019	AMEUBLEMENT 	0722	Materials
45027	ART APPLIQUÉ	0212	Fashion, interior and industrial design
46242	INTÉGRATION WEB 	0211	Audio-visual techniques and media production
46324	ÉDITION	0322	Library, information and archival studies
46328	LIBRAIRIE	0322	Library, information and archival studies
46395	LUDOTHÈQUE	0322	Library, information and archival studies
71654	LOGICIEL SGBD	0322	Library, information and archival studies
71654	LOGICIEL SGBD	0611	Computer use
"""

# 42069	EMPLOYÉ COLLECTIVITÉ	1011	Inter-disciplinary programmes and qualifications involving services


def split_patch_one(formacode_isced):
	#print(isced_codes)
	for pline in patch_data_one.split('\n'):
		if pline.strip():
			parts = pline.split('\t')
			if len(parts) == 4:
				code = int(parts[0])
				lib = parts[1]
				isced_code = parts[2].strip()
				assert isced_code in isced_codes, "'%s'" % isced_code
				isced_lib = parts[3]
				fi = FormacodeIsced(code, '', lib, isced_lib, str(isced_code))
				if code in formacode_isced:
					formacode_isced[code].append(fi)
				else:
					formacode_isced[code] = [fi]
			else:
				print("BAD PARTS", parts)




patch_two = """
70154 - logiciel abonnement presse
70254 - logiciel aide décision
70201 - logiciel Business Objects
70202 - logiciel Cognos
70203 - logiciel Crystal Reports
70204 - logiciel Hyperion
71854 - logiciel autre
71801 - géoconcept
71802 - logiciel Tanagra
70354 - logiciel bureautique
70310 - logiciel PREAO
70311 - logiciel Impress
70312 - logiciel Power Point
70320 - logiciel tableur
70321 - logiciel Calc
70322 - logiciel Excel
70323 - logiciel Lotus
70330 - logiciel traitement texte
70331 - logiciel Visio
70332 - logiciel Word
70333 - logiciel Writer
70340 - logiciel Works
70454 - logiciel CFAO
70401 - logiciel Catia
70554 - logiciel documentaire
70501 - logiciel Alexandrie
70502 - logiciel JLB
70503 - logiciel Kentika
70504 - logiciel PMB
70654 - logiciel gestion comptable commerciale
70601 - logiciel Ciel
70602 - logiciel EBP
70603 - logiciel Sage
70754 - logiciel gestion de contenu
70701 - logiciel Drupal
70702 - logiciel eZ Publish
70703 - logiciel Joomla
70704 - logiciel Plone
70705 - logiciel Spip
70706 - logiciel Typo 3
70707 - logiciel WordPress
70854 - logiciel gestion intégré
70801 - logiciel SAP
70954 - logiciel gestion projet
70901 - logiciel MsProject
71054 - logiciel gestion réseau
71001 - logiciel Lan Manager
71002 - logiciel Novell Netware
71154 - logiciel graphique
71110 - logiciel DAO/CAO
71111 - logiciel Autocad
71112 - logiciel Corel Draw
71113 - logiciel Painter
71114 - logiciel Web Designer
71120 - logiciel PAO traitement image
71121 - logiciel Acrobat
71122 - logiciel Illustrator
71123 - logiciel InDesign
71124 - logiciel Photoshop
71125 - logiciel Publisher
71126 - logiciel Scribus
71127 - logiciel XPress
71754 - logiciel libre
71701 - logiciel open source
71254 - logiciel messagerie électronique
71201 - logiciel Exchange
71202 - logiciel Notes
71203 - logiciel Outlook
71204 - logiciel Thunderbird
71354 - logiciel navigateur internet
71301 - logiciel Firefox
71302 - logiciel Google Chrome
71303 - logiciel Internet Explorer
71304 - logiciel Opera
71305 - logiciel Safari
71454 - logiciel page web
71401 - logiciel Director
71402 - logiciel Dreamweaver
71403 - logiciel Flash
71404 - logiciel Frontpage
71554 - logiciel production musicale
71501 - logiciel Cubase
71502 - logiciel Finale
71503 - logiciel Logic Pro
71504 - logiciel Max/MSP
71505 - logiciel Pro Tools
71506 - logiciel Pyramix
71654 - logiciel SGBD
71601 - logiciel Access
71602 - logiciel Filemaker Pro
71603 - logiciel MySQL
71604 - logiciel Oracle
"""


def split_patch_two(formacode_isced):
	for pline in patch_two.split('\n'):
		if pline.strip():
			parts = pline.split('-')
			if len(parts) == 2:
				code = int(parts[0].strip())
				lib = parts[1].strip()
				isced_code = '0611'
				assert isced_code in isced_codes, "'%s'" % isced_code
				isced_lib = 'Computer use'
				fi = FormacodeIsced(code, '', lib, isced_lib, str(isced_code))
				#print code, lib, isced_lib, isced_code
				if code in formacode_isced:
					formacode_isced[code].append(fi)
				else:
					formacode_isced[code] = [fi]
			else:
				print("BAD PARTS", parts)

excluded = """
14254	SCIENCES HUMAINES		rien
61054			rien
62054			rien
62301			rien
62302			rien
63054			rien
63101			rien
64101			rien
64201			rien
64301			rien
"""

patch_data_three = """
12083	TAXIDERMIE	0512	Biology
12526		0712	Environmental protection technology
15094	préparation entrée grande école	0031	    
15254	LANGUES	0231	Language acquisition
21354	PÊCHE AQUACULTURE	0831	Fisherie
22354	BÂTIMENT GROS ŒUVRE	0732	Building and civil engineering
24021	électroménager	0713	Electricity and energy
30854	LANGAGE INFORMATIQUE	0611	Computer use
31348		0413	Management and administration
31359		0413	Management and administration
31371		0413	Management and administration
31374		0413	Management and administration
31375		0413	Management and administration
31380		0413	Management and administration
31648	TRANSFERT TECHNOLOGIE	0413	Management and administration
31654		0413	Management and administration
31754		0416	Wholesale and retail sales
42054		1011	Domestic services
44054		0923	Social work and counselling
44501		0111	Education science
44502		0111	Education science
44508		0413	Management and administration
44510		0111	Education science
44514		0111	Education science
44517		0111	Education science
44573		0111	Education science
44575		0111	Education science
44582		0111	Education science
44584		0111	Education science
44589		0923	Social work and counselling
44590		0923	Social work and counselling
44593		0111	Education science
45075		0416	Wholesale and retail sales
46201		0211	Audio-visual
46211		0416	Wholesale and retail sales
46247		0212	Fashion, interior and industrial design
46307		0322	Library, information and archival studies
46308		0322	Library, information and archival studies
46348		0322	Library, information and archival studies
70000		0611	computer use
"""

def split_patch_three(formacode_isced):
	for pline in patch_data_three.split('\n'):
		if pline.strip():
			parts = pline.split('\t')
			if len(parts) == 4:
				code = int(parts[0])
				lib = parts[1] or u''
				isced_code = parts[2].strip()
				try:
					int(isced_code)
				except ValueError:
					print("BAD code", isced_code)
					continue
				assert isced_code in isced_codes, "'%s'" % isced_code
				isced_lib = parts[3] or ''
				fi = FormacodeIsced(code, '', lib, isced_lib, str(isced_code))
				if code in formacode_isced:
					formacode_isced[code].append(fi)
				else:
					formacode_isced[code] = [fi]
			else:
				print("BAD PARTS", parts)


def build_formacode_isced(filename):
	#print filename
	wb = open_workbook(filename)
	formacode_isced = dict()
	count = 0
	for s in wb.sheets():
		count += 1
		if count != 9:  # Sheet 9
			continue
		for row in range(1, s.nrows):
			if row < 9:
				continue
			isced_lib = s.cell(row, 0).value
			isced_code = s.cell(row, 1).value
			formacodes = s.cell(row, 2).value
			try:
				int(isced_code)
			except ValueError:
				#print "Bad isced code", isced_code
				continue
			if not isced_lib or not isced_code or not formacodes:
				#print "IGNORING", "[%d]" % row, isced_lib, isced_code, len(formacodes)
				pass
			else:
				#print "[%d]" % row, isced_lib, isced_code, len(formacodes)  #, formacodes
				codes = scrap_formacodes(formacodes)
				if not codes:
					continue
				for code, lib in codes:
					if isinstance(isced_code, float):
						isced_code = str(int(isced_code))
					fi = FormacodeIsced(code, '', lib, isced_lib, str(isced_code))
					if code in formacode_isced:
						formacode_isced[code].append(fi)
					else:
						formacode_isced[code] = [fi]
		break  # One sheet only
	split_patch_one(formacode_isced)
	split_patch_two(formacode_isced)
	split_patch_three(formacode_isced)
	return formacode_isced


def isced_from_formacodes(formacodes, formacode_isced):
    transformation = dict()
    codes = list()
    isceds = dict()
    if formacodes:
        for fcode in formacodes:
            isced_codes = formacode_isced.get(int(fcode))
            transformation[fcode] = []
            if isced_codes:
                for isced_code in isced_codes:
                    if isced_code.isced_code:
                        isceds[str(isced_code.isced_code)] = (isced_code.isced_lib, fcode, isced_code.lib)
                        transformation[fcode].append((isced_code.isced_code, isced_code.isced_lib))
                    else:
                        codes.append('Pas de correspondance. [<i>Formacode %s (%s)</i>]' % (
                        	isced_code.formacode, isced_code.lib))
            else:
                codes.append('Pas dans le tableau de conversion. [<i>Formacode %s</i>]' % fcode)
        for k, v in isceds.items():
            codes.insert(0, '<b>%s</b> (%s) [<i>depuis le Formacode %s (%s)</i>]' % (k, v[0], v[1], v[2]))
    return codes, transformation, isceds.keys()


def create_isced_list(formacodes, formacode_isced):
	ta = []
	source = []
	codes, transformation, isceds = isced_from_formacodes(formacodes, formacode_isced)
	for libcode in isceds:
		ta.append(libcode)
	for fcode, isceds in transformation.items():
		if isceds:
			for isced in isceds:
				source.append(u'formation/domaine-formation/code-FORMACODE[%s]: %s (%s)' % (
					fcode,
					isced[0] if isced else 'KO',
					isced[1] if isced else '-',
				))
		else:
			source.append(u'formation/domaine-formation/code-FORMACODE[%s]: %s (%s)' % (
				fcode,
				'KO',
				'-',
			))
	return ta, codes, source


if __name__ == '__main__':
	split_patch_one(None)
