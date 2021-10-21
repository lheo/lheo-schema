#-*- coding: utf-8 -*-
BEGIN{
    print "<?xml version=\"1.0\" encoding=\"utf-8\"?>";
    print "<!DOCTYPE dict SYSTEM \"gml.dtd\">";
    print "<dict xmlns=\"http://www.gelaba.org/gml/1.1\" name=\"dict-cantons-france\">";
    print "<fullname xml:lang=\"fr\">Cantons français INSEE (2007)</fullname>";
    print "<doc xml:lang=\"fr\">Cantons français version 2007 (source: INSEE).</doc>";
}
{
    print "<entry>";
    print "  <key val=\""$2$4"\" />";
    print "  <value xml:lang=\"fr\" val=\""$11$12"\" />";
#    print "  <property name=\"insee:departement\" value=\""$2"\" />";
    print "  <property name=\"insee:cheflieu\" value=\""$6"\" />";
#    print "  <property name=\"insee:canton\" value=\""$4"\" />";
#    print "  <property name=\"insee:region\" value=\""$1"\" />";
#    print "  <property name=\"insee:arrondissement\" value=\""$3"\" />";
#    print "  <property name=\"insee:upcase\" value=\""$9$10"\" />";
    print "</entry>";
}
END{
    print "<property name=\"version\" value=\"2007\" />";
    print "<property name=\"wikipedia\" value=\"http://fr.wikipedia.org/wiki/Canton_français\" />";
    print "<property name=\"url\" value=\"http://www.insee.fr/fr/nom_def_met/nomenclatures/cog/cog.telechargement.asp\" />";
    print "</dict>";
}
