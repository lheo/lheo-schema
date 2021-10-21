#-*- coding: utf-8 -*-
BEGIN{
    print "<?xml version=\"1.0\" encoding=\"utf-8\"?>";
    print "<!DOCTYPE dict SYSTEM \"gml.dtd\">";
    print "<dict xmlns=\"http://www.gelaba.org/gml/1.1\" name=\"dict-communes-france\">";
    print "<fullname xml:lang=\"fr\">Communes françaises INSEE (2007)</fullname>";
    print "<doc xml:lang=\"fr\">Communes françaises version 2007 (source: INSEE).</doc>";
}
{
    print "<entry>";
    print "  <key val=\""$4$5"\" />";
    if ($11 == "") print "  <value xml:lang=\"fr\" val=\""$12"\" />";
    if ($11 != "") print "  <value xml:lang=\"fr\" val=\""$11" "$12"\" />";
    #print "  <property name=\"insee:commune\" value=\""$5"\" />";
    #print "  <property name=\"insee:departement\" value=\""$4"\" />";
    #print "  <property name=\"insee:cheflieu\" value=\""$2"\" />";
    #print "  <property name=\"insee:region\" value=\""$3"\" />";
    #print "  <property name=\"insee:upcase\" value=\""$9$10"\" />";
    print "</entry>";
}
END{
    print "<property name=\"version\" value=\"2007\" />";
    print "<property name=\"wikipedia\" value=\"http://fr.wikipedia.org/wiki/Commune_française\" />";
    print "<property name=\"url\" value=\"http://www.insee.fr/fr/nom_def_met/nomenclatures/cog/cog.telechargement.asp\" />";
    print "</dict>";
}
