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

.PHONY: help Makefile html clean pdf all

all: lheobuild.mk lheofiles.mk

lheobuild.mk: $(GML2SPHINX) $(LHEOGML)
	xsltproc --stringparam action makerules -o $@ $(GML2SPHINX) $(LHEOGML)

lheofiles.mk: $(GML2SPHINX) $(LHEOGML)
	xsltproc --stringparam action list -o $@ $(GML2SPHINX) $(LHEOGML)

include lheofiles.mk

# manual
TOCFILES = source/structure.rst \
 source/cercle1.rst \
 source/cercle2.rst \
 source/cercle3.rst \
 source/types.rst \
 source/tables.rst \
 source/glossaire.rst

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

include lheobuild.mk

# Generated
source/glossaire.rst: $(GML2SPHINX) $(LHEOGML) $(LHEOGLO)
	xsltproc -o $@ --stringparam glossaire $(LHEOGLO) --stringparam page glossaire $(GML2SPHINX) $(LHEOGML)

# Manually edited
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

html: Makefile $(LHEOFILES) $(LHEODICTS) $(TOCFILES)
	$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

pdf: Makefile $(LHEOFILES) $(LHEODICTS) $(TOCFILES)
	PAPER=a4 $(SPHINXBUILD) -M latexpdf "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

clean: Makefile
	$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
	rm -f $(LHEOFILES) $(LHEODICTS) $(TOCFILES)
	rm -f lheobuild.mk lheofiles.mk


