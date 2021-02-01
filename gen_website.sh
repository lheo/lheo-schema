#!/usr/bin/env bash

VENV_BIN=/Users/karim/dev/tools/venvs/reference/bin
REFERENCE_BASE_DIR=`pwd`

GLOSSAIRE_DEF=$REFERENCE_BASE_DIR/definition/lheo-glossaire.html
GLOSSAIRE_TPL=$REFERENCE_BASE_DIR/website/glossaire_tpl.mako
GLOSSAIRE_MAKO=$REFERENCE_BASE_DIR/target/2.2/glossaire.mako

GML_DEF=$REFERENCE_BASE_DIR/definition/lheo-gml.xml
D3JS_JSON=$REFERENCE_BASE_DIR/target/2.2/formation_tree.json

echo $REFERENCE_BASE_DIR

echo "activating python venv: $VENV_BIN/activate"
source $VENV_BIN/activate

cd ./website/
echo "Generating glossaire web page"
python glossaire.py --html $GLOSSAIRE_DEF --template $GLOSSAIRE_TPL --mako $GLOSSAIRE_MAKO

echo "Generating d3js json data"
python d3js_data.py --gml $GML_DEF --glossaire $GLOSSAIRE_DEF --json $D3JS_JSON