#-*- coding: utf-8 -*-
BEGIN{
    print "<?xml version=\"1.0\" encoding=\"utf-8\"?>";
    print "<!DOCTYPE dict SYSTEM \"gml.dtd\">";
    print "<dict xmlns=\"http://www.gelaba.org/gml/1.1\" name=\"dict-regions-france\">";
    print "<fullname xml:lang=\"fr\">Régions françaises (2007)</fullname>";
    print "<doc xml:lang=\"fr\">Régions françaises version 2007 (source: INSEE).</doc>";
}
/REGION/{}
{
    print "<entry>";
    print "  <key val=\""$1"\" />";
    print "  <value xml:lang=\"fr\" val=\""$5"\" />";
    print "  <property name=\"insee:cheflieu\" value=\""$2"\" />";
    print "  <property name=\"iso:pays\" value=\"FR\" />";
    print "</entry>";
}
END{
    print "<property name=\"version\" value=\"2007\" />";
    print "<property name=\"wikipedia\" value=\"http://fr.wikipedia.org/wiki/Région_française\" />";
    print "<property name=\"url\" value=\"http://www.insee.fr/fr/nom_def_met/nomenclatures/cog/cog.telechargement.asp\" />";
    print "</dict>";
}
