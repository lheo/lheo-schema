#! /usr/bin/env python
# -*- coding: utf-8 -*-
#

import sys
import re
import io
import optparse

from lxml import etree

def main(argv=None):
	if argv is None:
		argv = sys.argv

	parser = optparse.OptionParser("usage: %prog [options]")
	parser.add_option('', '--html', default=None, help="HTML base file")
	parser.add_option('', '--template', default=None, help="mako template file")
	parser.add_option('', '--mako', default=None, help="generated mako file")

	options, arguments = parser.parse_args(argv[1:])

	glossaire_def_path = options.html
	glossaire_tpl_path = options.template
	glossaire_mako_path = options.mako

	print("HTML definition file: %s" % glossaire_def_path)
	print("MAKO template file: %s" % glossaire_tpl_path)
	print("MAKO output file: %s" % glossaire_mako_path)

	out = open(glossaire_mako_path, 'w')

	with open(glossaire_def_path, 'rb') as f:
		html = f.read()

	with open(glossaire_tpl_path, 'r') as tpl:
		mako = tpl.read()

	parser = etree.HTMLParser(encoding='utf-8', recover=True, remove_comments=True)
	tree = etree.parse(io.BytesIO(html), parser)

	'''
		HTML TEMPLATE
		<div class="entree" id="action">
          <h3 class="terme"><a name="action" >
            Action de formation
          </a></h3>
          <div class="definition">
            <p>
				S'entend de tout ce qui contribue à la conception, à
				l’organisation, et à la mise en œuvre d’une formation.
            </p>
            <p>
            	bla bla
            </p>
          </div>
          <div class="voir"><p>
            Voir aussi <a href="#module-formation">Module de formation</a> et
            <a href="#session-formation">Session de formation</a>.
          </p></div>
        </div>

		GENERATED HTML/MAKO
		<div class="glossaire-box">
			<a class="no-pointer" name="action">
				<h3 class="text-left">
					Action de formation
				</h3>
			</a>
			<p>
				S'entend de tout ce qui contribue à la conception, à l'organisation, et à la mise en
				œuvre
				d'une formation.
				Voir aussi <a href="#module-formation">Module de formation</a> et
				<a href="#session-formation">Session de formation</a>.
			</p>
		</div>
	'''

	content = '<div class="glossaire-container">'
	for element in tree.getroot().iter():
		if element.tag == 'div':
			attrib = element.attrib
			if attrib.get('class') and attrib.get('class') == 'entree':
				content += '<div class="glossaire-single-box">\n'
				for child in element.iter():
					if child.tag == 'h3' and child.attrib.get('class') and child.attrib.get('class') == 'terme':
						anchor = child.find('a')
						content += '<a class="no-pointer" id="%s" name="%s">\n' % (attrib.get('id', ''), attrib.get('id', ''))
						content += '<h3 class="text-left">\n'
						content += anchor.text
						content += '</h3>\n'
						content += '</a>\n'
					if child.tag == 'div' and child.attrib.get('class') and child.attrib.get('class') == 'definition':
						definitions = child.findall('p')
						for p in definitions:
							p_text = get_element_text(p, remove_html=False)
							p_text = p_text.replace(b'<b>', b'')
							p_text = p_text.replace(b'</b>', b'')
							content += p_text.decode('utf-8')
					if child.tag == 'div' and child.attrib.get('class') and child.attrib.get('class') == 'voir':
						voir = child.find('p')
						content += get_element_text(voir, remove_html=False).decode('utf-8')

				content += '</div>'

	content += '</div>'

	#print(mako)
	#print(etree.tostring(tree.getroot(), pretty_print=True))

	out.write(mako.replace('~generated_content~', content))

eu_p_open_re = re.compile(r'<p[^>]*?>', re.U | re.I)
eu_p_close_re = re.compile(r'</p>', re.U | re.I)

def remove_html_tags(html):
    html = eu_p_open_re.sub('', html)
    html = eu_p_close_re.sub('', html)

    return html


def get_element_text(element, remove_html=True):
    if remove_html:
        return remove_html_tags(etree.tostring(element, encoding='utf8')).strip()
    else:
        return etree.tostring(element, encoding='utf8').strip()


if __name__ == "__main__":
    sys.exit(main())

