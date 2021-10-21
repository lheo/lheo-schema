#-*- coding: utf-8 -*-
BEGIN{
    print "<?xml version=\"1.0\" encoding=\"utf-8\"?>";
    print "<!DOCTYPE dict SYSTEM \"gml.dtd\">";
    print "<dict xmlns=\"http://www.gelaba.org/gml/1.1\" name=\"dict-departements-france\">";
    print "<fullname xml:lang=\"fr\">Départements français (2007)</fullname>";
    print "<doc xml:lang=\"fr\">Départements français version 2007 (source: INSEE).</doc>";
}
/REGION/{}
{
    print "<entry>";
    print "  <key val=\""$2"\" />";
    print "  <value xml:lang=\"fr\" val=\""$6"\" />";
    print "  <property name=\"insee:cheflieu\" value=\""$3"\" />";
    print "  <property name=\"insee:region\" value=\""$1"\" />";
    print "  <property name=\"insee:NCC\" value=\""$5"\" />";
    print "</entry>";
}
END{
    print "<property name=\"version\" value=\"2007\" />";
    print "<property name=\"wikipedia\" value=\"http://fr.wikipedia.org/wiki/Départements_français\" />";
    print "<property name=\"url\" value=\"http://www.insee.fr/fr/nom_def_met/nomenclatures/cog/cog.telechargement.asp\" />";
    print "</dict>";
}
