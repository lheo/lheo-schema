# -*- coding: utf-8 -*-
"""Transform a LHÉO 2.2 document into a LOMS 1.0.0 document.
"""
import sys
import argparse
import os

from lxml import etree

import lheocommon
import lomscommon
import formacode
from ideo import url_generator

alignement_formacode_fname = 'alignement_isced_formacode_final_20201201.xls'


def main():
	parser = argparse.ArgumentParser(description='transform a lheo document into static website.')
	parser.add_argument('filename', type=str,
						help='LHEO XML document to transform')
	parser.add_argument('output', type=str,
						help='target directory')
	parser.add_argument('--loms', action="store_true", default=False)
	parser.add_argument('--alignement-formacode', type=str,
						default=os.path.join(os.path.dirname(os.path.abspath(__file__)),
							alignement_formacode_fname),
						help='file containing aligned data')
	parser.add_argument('--provider', type=str, default='ideo',
						help='provider of the LHEO information')
	parser.add_argument('--source', type=str, default=None,
						help='source of the LHEO information')
	args = parser.parse_args()

	formacode_isced = None
	if args.loms:
		formacode_isced = formacode.build_formacode_isced(args.alignement_formacode)

	#
	# Read XML file
	#
	print("Parse input file")
	filename = args.filename
	with open(filename, 'r') as f:
		xmldoc = etree.parse(f)
	root = xmldoc.getroot()
	idfilename = args.filename + '.ids'
	lheo_root = lheocommon.LHEORoot(root, idfilename=idfilename)

	#
	# Create index
	#
	idx_root = etree.Element(lheocommon.LHEOElement.namespace + 'lheo-leger',
							 nsmap=lheocommon.LHEOElement.nsmap)
	idx_root.set('info', args.source)

	filenames = list()
	for f in lheo_root.formations():
		filename = os.path.join(f.identifier() + '.xml')
		filenames.append(filename)
	l = len(filenames)
	count = 0
	for i, t in enumerate(zip(lheo_root.formations(), filenames)):
		f, filename = t
		prec = filenames[i - 1] if i > 0 else None
		suiv = filenames[i + 1] if i < (l - 1) else None
		extras = f.create_element('extras')
		extras.set("info", "navigation")
		extra = f.create_element('extra')
		extra.set("info", "index")
		extra.text = str(i+1)
		extras.append(extra)
		extra = f.create_element('extra')
		extra.set("info", "current")
		extra.text = filename
		extras.append(extra)
		if prec:
			extra = f.create_element('extra')
			extra.set("info", "previous")
			extra.text = prec[:-4]
			extras.append(extra)
		if suiv:
			extra = f.create_element('extra')
			extra.set("info", "next")
			extra.text = suiv[:-4]
			extras.append(extra)
		if args.loms:
			loms_filename = None
			loms_transformer = lomscommon.LOMSTransformer(lheo_root,
														  formacode_isced, args.provider,
														  ids=lheo_root.ids,
														  url_generator=url_generator)
			c = loms_transformer.transform_formation(f, i + 1)
			if c > 0:
				loms_filename = 'loms_' + filename
				loms_filepath = os.path.join(args.output, loms_filename)
				with open(loms_filepath, 'w') as lof:
					xml_content = str(etree.tostring(loms_transformer.loms_root.root, pretty_print=True),
									  encoding='utf-8')
					lof.write('<?xml version="1.0" encoding="utf-8"?>\n')
					lof.write('<?xml-stylesheet type="text/xsl" href="loms.xsl"?>\n')
					lof.write(xml_content)
				extra = f.create_element('extra')
				extra.set("info", "loms")
				extra.text = loms_filename
				extras.append(extra)

		f.element.append(extras)
		filepath = os.path.join(args.output, filename)
		with open(filepath, 'w') as of:
			xml_content = str(etree.tostring(f.element, pretty_print=True, encoding='utf-8'), encoding='utf-8')
			of.write('<?xml version="1.0" encoding="utf-8"?>\n')
			of.write('<?xml-stylesheet type="text/xsl" href="formation.xsl"?>\n')
			of.write(xml_content)
			print(filename)

		ifor = f.create_element('resume-formation')
		ifor.set('index', str(i+1))
		title = f.create_element('intitule-formation')
		title.text = f.intitule_formation()
		ifor.append(title)
		cer = f.create_element('certifiante')
		cer.text = f.certifiante()
		ifor.append(cer)
		url = f.create_element('url')
		url.text = filename
		ifor.append(url)
		if args.loms and loms_filename:
			url_loms = f.create_element('url-loms')
			url_loms.text = loms_filename
			ifor.append(url_loms)
		idx_root.append(ifor)
		count += 1

	idx_root.set('numero', str(count))

	indexpath = os.path.join(args.output, 'index.xml')
	with open(indexpath, 'w') as idxf:
		xml_content = str(etree.tostring(idx_root, pretty_print=True, encoding='utf-8'), encoding='utf-8')
		idxf.write('<?xml version="1.0" encoding="utf-8"?>\n')
		idxf.write('<?xml-stylesheet type="text/xsl" href="index.xsl"?>\n')
		idxf.write(xml_content)
		print(indexpath)

	return 0

if __name__ == "__main__":
	sys.exit(main())
