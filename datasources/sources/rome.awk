#-*- coding: utf-8 -*-
BEGIN{
    FS=";";
    print "<?xml version=\"1.0\" encoding=\"utf-8\"?>";
    print "<!DOCTYPE dict SYSTEM \"gml.dtd\">";
    print "<dict xmlns=\"http://www.gelaba.org/gml/1.1\" name=\"dict-ROME\">";
    print "<fullname xml:lang=\"fr\">ROME</fullname>";
    print "<doc xml:lang=\"fr\">Répertoire Opérationnel des Métiers et des Emplois (source: ANPE).</doc>";
}
{
    print "<entry>";
    print "  <key val=\""$1"\" />";
    print "  <value xml:lang=\"fr\" val=\""$2"\" />";
    print "  <property name=\"rome:formacode\" value=\""$3"\" />";
    print "  <property name=\"rome:url\" value=\"http://www.anpe.fr/espacecandidat/romeligne/RliRechercheRome.do?typeAffichageRome=id&amp;codeRomeId="$1"\" />";
    print "</entry>";
}
END{
    print "<entry>";
    print "  <key val=\"00999\" />";
    print "  <value xml:lang=\"fr\" val=\"Métier non défini\" />";
    print "</entry>";
    print "<property name=\"version\" value=\"septembre 2003\" />";
    print "<property name=\"url\" value=\"http://www.anpe.fr/rome/aide/aide_en_ligne.html\" />";
    print "</dict>";
}