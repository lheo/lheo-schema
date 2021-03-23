# -*- coding: utf-8 -*-
"""Transform a LHÉO 2.2 document into a LOMS 1.0.0 document.
"""
import sys
import argparse
from collections import Counter
import uuid
import os

from lxml import etree

import formacode
import lheocommon
import lomscommon
from ideo import url_generator

alignement_formacode_fname = 'alignement_isced_formacode_final_20201201.xls'


def main():
	parser = argparse.ArgumentParser(description='transform a lheo document into a loms document.')
	parser.add_argument('filename', type=str,
						help='LHEO XML document to transform')
	parser.add_argument('output', type=str,
						help='target LOMS file')
	parser.add_argument('--limit', type=int, default=0,
						help='number of <formation> elements to transform')
	parser.add_argument('--after', type=int, default=0,
						help='ignore some documents')
	parser.add_argument('--alignement-formacode', type=str, 
						default=os.path.join(os.path.dirname(os.path.abspath(__file__)), 
							alignement_formacode_fname),
						help='file containing aligned data')
	parser.add_argument('--provider', type=str, default='ideo',
						help='provider of the LHEO information')

	args = parser.parse_args()

	formacode_isced = formacode.build_formacode_isced(args.alignement_formacode)
	#from pprint import pprint
	#pprint(formacode_isced)

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
	# Transform LHEO data to LOMS
	#
	loms_transformer = lomscommon.LOMSTransformer(lheo_root, formacode_isced, args.provider, ids=lheo_root.ids,
		url_generator=url_generator)
	loms_transformer.transform(limit=args.limit, after=args.after)
	print(loms_transformer.counters)
	with open(args.output, 'w') as f:
		f.write(str(etree.tostring(loms_transformer.loms_root.root, pretty_print=True), encoding='utf-8'))

	return 0


if __name__ == "__main__": 
	sys.exit(main())
