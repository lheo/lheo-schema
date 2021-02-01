# Synthèse des travaux LHÉO 2.3

1er février 2018

Note ajoutée le 5/2/2020

État courant des travaux dans la branche 2.3:

https://gitlab.com/lheo/reference/tree/2.3


## Évolutions d'éléments toujours en discussion pour la version 2.3

### [Coordonnées] Évolution de la longueur max de la balise ligne et/ou création d'une nouvelle balise

https://gitlab.com/lheo/reference/issues/32

L'Onisep utilise les balises `<ligne>` des coordonnées d'organisme pour faire figurer des noms ou compléments de noms d'établissements, dont la structuration peut être complexe. La limite actuelle de 50 caractères est régulièrement problématique.

L'Onisep propose au COTEC :

- soit de passer la limite à 255 caractères pour la balise <ligne>
- soit de créer une balise spécifique de type <libelle-etablissement>

En fonction du choix retenu, l'issue sera labellisée uniquement "évolution" ou "nouvel élément".

COTEC 12/12/2017: piste de modification évoquée:

```
<adresse>
[0,1] <denomination> [0,255]
[1,4] <ligne> Ligne
[1,1] <codepostal> Code postal
[1,1] <ville> Ville
[0,1] <departement>
```

COTEC 1/2/1018: proposition acceptée avec réserves:

proposition acceptée avec réserves.

- manque un exemple de contenu
- justifier et expliciter les cas d'usages


### Information collective

https://gitlab.com/lheo/reference/issues/35

Information liée au processus de recrutement des stagiaires (systématique pour pôle emploi, les régions) demandée par les prescripteurs => proposition que cet ensemble soit repris en cercle 2.

COTEC 12/12/2017: structure de cet élément tel qu'il est utilisé aujourd'hui en cercle 3:

```
<session>
  <!-- ... -->
<info-collective>
  <lieu-deroulement><adresse></adresse></lieu-deroulement>
  <nb-places></nb-places>
  <periode>
    <date-deroulement></date-deroulement>
    <heure-debut></heure-debut>
    <heure-fin></heure-fin>
  </periode>
  <commentaire></commentaire> <!-- ?,500 -->
</info-collective> <!-- * -->
</session>
```

Similaire aux informations `adresse-information` et `date-information` portées par l'action de formation, avec un commentaire et des heures de début et de fin en plus.

Pas de décision prise lors de ce COTEC.

COTEC 1/2/2018:

- faut-il mettre cet élément au niveau de l'action ou de la session (le COTEC penche pour l'action)?
- définir la notion d'Information collective dans le glossaire
- trouver un autre nom pour `nb-places` qui prête à confusion (avec le nombre de places de la session/action)


## Évolutions des tables, toujours en discussion pour la version 2.3

### Table des niveaux

https://gitlab.com/lheo/reference/issues/33

La tableau des niveaux actuellement utilisé dans Lhéo, `dict-niveaux`, est une table propre.

Deux interrogations: doit-on continuer à maintenir cette table dans Lhéo ou doit-on la considérer comme une table de référence externe?

Dans le cas où on conserve la gestion de cette table au sein de Lhéo, il conviendrait de la mettre à jour: les libellés font référence à la maîtrise et il n'est fait nul part mention des niveaux européens, qu'il faudrait très certainement traiter aussi.

De plus, la nomenclature française des niveaux est elle aussi en train d'évoluer, il faudra s'interroger sur une possible anticipation de la prise en compte de cette nomenclature dans Lhéo (elle sera utilisée au moins par les référentiels RNCP et Certif Info lors de sa sortie).

`dict-niveaux`

Utilisé dans <code-niveau-entree> et <code-niveau-sortie> (formation)

| LHÉO | Valeur                                                          |
| ---- | :-------------------------------------------------------------- |
| 0    | information non communiquée                                     |
| 1    | sans niveau spécifique                                          |
| 2    | niveau VI (illettrisme, analphabétisme)                         |
| 3    | niveau V bis (préqualification)                                 |
| 4    | niveau V (CAP, BEP, CFPA du premier degré)                      |
| 5    | niveau IV (BP, BT, baccalauréat professionnel ou technologique) |
| 6    | niveau III (BTS, DUT)                                           |
| 7    | niveau II (licence ou maîtrise universitaire)                   |
| 8    | niveau I (supérieur à la maîtrise)                              |

COTEC 1/2/2018: le COTEC décide de ne pas trancher cette question, cela sort du champ du COTEC. À débattre en COPIL: quel référentiel doit-on intégrer dans LHÉO?

Note du 5/2/2020 (GAS): il existe une nouvelle table qu'il faudra
utiliser.

> Une note de France Compétences publiée fin 2019 revient sur la
> construction du nouveau "cadre national de certifications",
> désormais articulée au "cadre européen des certifications". Elle
> précise aussi la classification des certifications professionnelles
> par niveau au sein du cadre national, ainsi que les critères de
> gradation des compétences et la méthode de classification des
> niveaux.

> Faute d’être inscrite au RNCP, une formation menant à une
> certification ne pourra pas être financée via les fonds de la
> formation professionnelle, en particulier au titre du CPF.

> Les diplômes conférant le grade de master y sont désormais classés
> au niveau 7 et le diplôme national de doctorat au niveau 8. Dans
> l’ancien cadre, ils étaient tous répertoriés dans un même niveau
> (niveau I).



## Éléments étudiés, non retenus pour la version 2.3

### Notion de nombre minimum/maximum de places

https://gitlab.com/lheo/reference/issues/12

COPIL du 19 décembre 2012: le court échange sur la notion de nombre de places, pour laquelle un travail spécifique d’approfondissement est envisagé pour 2013, fait apparaître la nécessité de distinguer plusieurs points autour de cette notion dans cette perspective:

- la notion de nombre minimum/maximum de places disponibles selon qu’il s’agit de contraintes pédagogiques (point de vue ingénierie de niveau action) ou commerciales (point de vue de celui qui gère la session de formation)
- la capacité intrinsèque d’accueil indiquée par l’organisme responsable de l’action de formation, du nombre de places réservé par tel ou tel financeur (public notamment) ou encore du nombre de places disponibles pour remplir la session (pour le remplissage d’une session)
- le niveau de maille pertinent de chacune de ses données (action, session)

COTEC 1/2/2018: fait basculer le langage vers un outil de gestion, n'a pas sa place dans LHEO (information typique pour le cercle 3 pour des échanges de gré à gré).

### Période d'interruption

https://gitlab.com/lheo/reference/issues/36

Quand lʼorganisme de formation interrompt la formation pendant la session en cours, utile pour gérer notamment les interruptions de + de 15 jours (changement du statut du demandeur): à étudier pour le cercle 2.

```
<extras info="periode-interruption">
```

COTEC du 12/12/2017: relève des parcours (en conformité avec Agora). Le COTEC ne se positionne pas comme un élément prioritaire à instruire pour LHEO 2.3.


### Descendre le lieu de formation dans la session

https://gitlab.com/lheo/reference/issues/18

Question posée au COPIL du 19 décembre 2012. Il faudrait faire des statistiques pour savoir quelle serait la meilleure solution: utiliser OffreInfo ou l'offre P3?

COTEC 12/12/2017: l'usage correspond au modèle actuel, il n'est pas nécessaire de le changer.


### Extra session-perimee

https://gitlab.com/lheo/reference/issues/34

```
<extras info="session-perimee">
```

Nécessite un cadre dʼusage collectif établi pour passer dans le langage: à ce stade, pas dʼusage utile pour dʼautres cercles.

COTEC 12/12/2017: information de gestion propre à certains acteurs et caduque dans leurs SI, bien positionnée en cercle 3.


### Extra delegation

https://gitlab.com/lheo/reference/issues/37

```
<extras info="delegation">
```

Nʼa pas vocation à être utilisé car très peu dʼusage en région: à confirmer.

COTEC 12/12/2017: information spécifique à certaines régions, bien positionnée en cercle 3.


### Extra specificites-session

https://gitlab.com/lheo/reference/issues/38

```
<extras info="specificites-session">
```

commentaire sur les spécificités de la session (Informations complémentaires sur les dates à renseigner par exemple lorsque les dates de début et de fin ne sont pas connues): nʼa pas vocation à être utilisé de façon générale (à confirmer)

COTEC 12/12/2017: information bien positionnée en cercle 3.


### Extra eligibite-cpf

```
<extras info="eligibilite-cpf">
```

sans doute à remonter au niveau de lʼaction mais doit rester en extra car relatif à un dispositif spécifique => imaginer un nouvel élément décrivant un dispositif de financement au sens large (principe dʼéligibilité).

Voici une série de balises utilisées dans le flux Offre Info typé pour Aude Formation qui véhiculent les informations relatives à l'éligibilité CPF.

```
<extras info="eligibilite-cpf">		
	<extra info="source">
	<extra info="debut-validite">
	<extra info="fin-validite">
	<extra info="public">
	<extra info="france-entiere">
	<extra info="region">
	<extra info="inter-branche">
	<extra info="branche">
</extras>
```

Le COTEC doit se prononcer sur l'intérêt de faire remonter ce groupe de balise dans un autre cercle. Chaque membre du COTEC donnera son analyse et son argumentaire dans un un commentaire.

| Balise | Min | Max | Type| Description |
| -------- | -------- | -------- | -------- | -------- |
| `<extras info="eligibilite-cpf">`   | **0**   | **N**   | avec attribut numero   |L'attribut numero est l'identifiant de la formation au CPF |
| ` <extra info="source">`   | **0**   | **1**   | 255 caractères  | Organisme à l’origine de la liste (COPANEF, COPAREF, CPNE) |
| `<extra info="debut-validite"> ` | **1**   | **1**   | Date | |
| `<extra info="fin-validite"> ` | **1**   | **1**   | Date   | |
| `<extra info="public">` | **1**   | **1**   | entier[1,3]   | 1 : salarié, 2 : demandeur d’emploi, 3 : tout public  |
| ` <extra info="france-entiere">   `   | **1**   | **1**   | booléen (oui / non)   |Eligibilité sur France entière ou pas (avec contrôle de cohérence avec balise suivante) |
| `<extra info="region"> `   | **0**   | **N**   | 2 caractères   |Code INSEE de la région (dans le cas où "france-entiere"=0) |
| `<extra info="inter-branche">`   | **1**   | **1**   | booléen (oui / non)   |Eligibilité quelle que soit la branche  (avec contrôle de cohérence avec balise suivante) |
| `<extra info="branche">`   | **0**   | **N**   | 6 caractères   |Code APE sur 6 caractères : exemple 26.52Z Horlogerie (dans le cas ou la balise "inter-branche" = 0) |

Origine des balises extra : flux RCO Offre Info à destination d'Aude Formation (Pôle Emploi).

COTEC 12/12/2017: pas pertinent dans le langage, maintient en cercle 3.
