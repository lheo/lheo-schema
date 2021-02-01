Référence du langage LHEO
=========================

Compilation de GeLaBa
---------------------

```
cd gelaba/gml
make
```

Il faut que `xsltproc` soit installé.


Compilation du langage LHEO
---------------------------

La création du langage nécessite que `pdflatex` soit installé. Nous recommandons pour cela la distribution TeX Live qui est disponible sur la plupart des systèmes d'exploitation:

http://www.tug.org/texlive

utilisateurs de windows : utiliser cygwin avec libxslt, make, texlive, git ; attention : les soources du projet ne doivent pas se situer dans un répertoire contenant un espace

Pour créer le langage (DTD, XSD et documentation), il convient de se placer dans le répertoire racine et de taper la commande:

```
make
```

Les fichiers générés se trouvent dans le répertoire:

```
target/x.y.z/
```

où `x.y.z` est le numéro de version du langage.

Pour créer le site web, la commande à utiliser est:

```
make web
```

qui va créer le site sous le répertoire `target`.

Pour nettoyer les fichiers target:

```
make clean-target
```
