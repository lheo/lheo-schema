.. _objectif-general-formation:

Objectif général de la formation
++++++++++++++++++++++++++++++++

.. code-block:: xml

  <objectif-general-formation>8</objectif-general-formation>


Cet élément indique l'objectif général de la formation. Il utilise pour cela la table Pôle emploi utilisée pour l'AIS (Attestation d'Inscription à un Stage). Le but de cette nomenclature est de fixer un référentiel stable et standardisé pour définir l'objectif général d'une formation. Dans le cadre de cette nomenclature, la notion de formation qualifiante regroupe les deux notions: formation certifiante ou professionnalisante. Règle importante de codage: certains stages peuvent cumuler plusieurs objectifs différents. Les catégories 2/3 et 4 peuvent être compatibles avec les catégories 6, 7 et 8. Un stage certifiant peut par exemple relever aussi du perfectionnement. Lorsque ce sera possible, on admettra donc plusieurs codages. Néanmoins, les applications informatiques ne sont pas toujours compatibles avec une double codification. Il est donc nécessaire d'instaurer une priorité de codage. À ce titre, si un stage répond à plusieurs objectifs, la catégorie 6, 7 ou 8 sera privilégiée.

Type
""""

Clé de la table :ref:`dict-AIS`


Attributs
"""""""""

- ``numero`` (optionnel) texte (0,N)
- ``info`` (optionnel) texte (0,N)
- ``ref`` (optionnel) texte (0,N)
- ``id`` (optionnel) ID (0,N)
- ``idref`` (optionnel) IDREF (0,N)
- ``tag`` (optionnel) texte (0,N)

Utilisé dans :ref:`formation`.

.. admonition:: Dans le glossaire LHÉO

   :ref:`objectif-general-formation-terme`


   Il peut s'agir d'une session de *certification* , de *professionnalisation* , de *préparation à la qualification* , de *remise à niveau* , de *(re)mobilisation* , de *perfectionnement* ou de *création d'entreprise* . Ces catégories sont de type administratif et sont décrites ci-dessous. 

   *Certification* - Cette catégorie comprend l'ensemble des formations sanctionnées par le passage d'une certification (diplôme, titre, certificat de qualification professionnelle). Les certifications regroupent l'ensemble des diplômes généraux de l'éducation nationale et de l'enseignement supérieur (diplômes nationaux, diplômes des universités) ainsi que l'ensemble des certifications professionnelles inscrites au Répertoire national des certifications professionnelles (RNCP). 

   *Professionnalisation* - Les objectifs des formations professionnalisantes sont très proches de ceux des formations certifiantes professionnelles, mais elles ne donnent lieu à aucun diplôme, titre ou certificat inscrit au RNCP. Comme les formations certifiantes professionnelles, ces formations visent à enseigner les techniques et connaissances propres à rendre un individu opérationnel dans un métier (ou plus généralement sur un type de poste de travail). Attention à ne pas confondre avec les formations de perfectionnement, qui visent à approfondir les compétences de publics déjà opérationnels dans un métier ou un poste donné. 

   *Préparation à la qualification* - Cette catégorie comprend les formations qui préparent à l'entrée dans toute formation qualifiante (i.e. certifiante ou professionnalisante), quelque soit son niveau. On y inclut bien sûr les formations de pré-qualification pour les jeunes (des Conseils régionaux) par exemple. Les formations de préparation aux concours sont donc incluses dans cette catégorie. En effet, elles préparent à l'entrée dans une école ou plus généralement à un cursus composé de périodes de formation et de périodes d'application pratique. Ce n'est qu'à la fin de ce cursus que la réussite du titre final aura lieu. Il convient de ne pas confondre les actions de préparation à la qualification s'adressant aux jeunes non qualifiés, avec les formations aux savoirs de base. Même s'ils comportent des modules de remise à niveau, leur finalité est bien, dans un métier donné, de préparer à l'entrée dans une formation qualifiante pour ce métier. 

   *Remise à niveau, maîtrise des savoirs de base, initiation* - Il s'agit là de sessions de remise à niveau ou d'initiation à des compétences ou techniques transversales à une large gamme de métiers. Il peut s'agir de remise à niveau dans les disciplines générales (français, lutte contre l'illettrisme, mathématiques de base), mais également d'initiation aux langues, d'initiation aux logiciels courants de bureautique (tableur, traitement de texte, autre) ou d'initiation à Internet (messagerie et navigation) et aux autres compétences clés. 

   *(Re)mobilisation, aide à l'élaboration de projet professionnel* - Cette catégorie rassemble l'ensemble des sessions de formation visant à analyser les perspectives d'orientation des apprenants en tenant compte de leurs motivations, de leurs capacités professionnelles ainsi que des difficultés sociales qu'ils ont éventuellement rencontrées. Ils peuvent intégrer un travail sur les savoirs de base ou des modules de familiarisation avec le milieu de l'entreprise. Ces sessions ne se confondent pas avec les sessions de formation de préqualification qui s'inscrivent quant à elles dans un métier défini et constituent une étape avant d'entreprendre une action certifiante ou professionnalisante. 

   *Perfectionnement, élargissement des compétences* - Les formations de cette catégorie s'adressent à un public de personnes déjà opérationnelles dans leur activité professionnelle occupée ou recherchée, mais qui désirent approfondir leurs compétences ou acquérir des compétences supplémentaires. Elles favorisent l'adaptation des salariés à leur poste de travail, l'évolution ou le maintien dans leur emploi. Dans le cas particulier du perfectionnement, ces formations supposent explicitement des pré-requis (qualification ou expérience professionnelle). Par exemple, cette catégorie comprend les sessions de niveau avancé de langue, de bureautique et d'utilisation des outils Internet. Elle comprend aussi les sessions de développement personnel pour les salariés. 


