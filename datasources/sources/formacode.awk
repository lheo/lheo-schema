#-*- coding: utf-8 -*-
BEGIN{
    FS=";";
    print "<?xml version=\"1.0\" encoding=\"utf-8\"?>";
    print "<!DOCTYPE dict SYSTEM \"gml.dtd\">";
    print "<dict xmlns=\"http://www.gelaba.org/gml/1.1\" name=\"dict-FORMACODE\">";
    print "<fullname xml:lang=\"fr\">Formacode 8ème édition (septembre 2003)</fullname>";
    print "<doc xml:lang=\"fr\">Thésaurus Formacode 8ème édition de septembre 2003 (source: Centre INFFO).</doc>";
}
$4=="DOM"{
    print "<entry>";
    print "  <key val=\""$1"\" />";
    print "  <value xml:lang=\"fr\" val=\""$3"\" />";
    if ($7 != "") print "  <property name=\"cinfo:filsde\" value=\""$7"\" />";
    print "  <property name=\"cinfo:hierarchie\" value=\""$5"\" />";
    if ($13 != "" && $13 !~ "\"") print "  <property name=\"cinfo:NSF\" value=\""$13"\" />";
    if ($14 != "") print "  <property name=\"cinfo:ROME\" value=\""$14"\" />";
    print "  <property name=\"lheo:url\" value=\"http://www.centre-inffo.fr/spip.php?page=formacode&amp;recherche="$1"\" />";
    print "</entry>";
}
END{
    print "<entry>";
    print "  <key val=\"99999\" />";
    print "  <value xml:lang=\"fr\" val=\"information non communiquée\" />";
    print "  <property name=\"cinfo:upcase\" value=\"INFORMATION NON COMMUNIQUEE\" />";
    print "</entry>";
    print "<property name=\"version\" value=\"septembre 2003\" />";
    print "<property name=\"url\" value=\"http://www.centre-inffo.fr/Le-Formacode-R-thesaurus-de-l.html\" />";
    print "</dict>";
}