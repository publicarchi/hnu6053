# One Document Does It All (ODD), Introduction

### HNU3053/HNU6053 Humanités numériques : Utilisation avancée de la TEI

~~~

# Introduction à One Document Does It All (ODD)

Note:

Lorsque l’on édite des textes, l’infrastructure de la TEI permet de soutenir le travail de l’éditeur en lui proposant un appareillage technique pour l’enregistrement des annontations. Elle offre un cadre de travail pour l’édition des textes qui permet de modéliser des éditions et offre de nombreux mécanismes de personnalisation. Ces modèles de documents ou ces personnalisations s’expriment dans un langage TEI, One Document Does It All (ODD) qui permet de générer différents formats de schémas pour travailler son son édition.

À l’instar de XML Schema du W3C ou de RelaxNG, ODD propose un langage très complet pour décrire une classe de document et munir son édition d’une documentation formelle. C’est le langage utilisé pour la spécification technique de la TEI qui est mis à disposition des utilisateurs pour déclarer leur utlisation de la TEI ainsi que leurs personnalisations.

~~~

## Qu’est-ce qu’un ODD

* Un langage de spécification de document applicable pour n’importe quel type balisage

* ODD est le langage de définition et de maintenance de la TEI

* Celui-ci peut être utilisé pour déclarer une personnalisation TEI

Note:

One Document Does it all (ODD) propose un langage de spécification de document applicable à n’importe quel type de balisage. Il s’agit du langage de spécification et de mainenance utilisé par la Text Encoding Initiative. Si le modèle peut être utilisé pour spécifier n’importe quelle classe de documents, il est habituellement employé pour déclarer 

~~~

## La TEI, un modèle extensible pour l’encodage des textes

La Text Encoding Initiative (TEI) offre un cadre de travail personnalisable et extensible pour traiter tout type de document textuels dans le contexte académique.

Elle offre&nbsp;:
* un cadre de travail pour l’édition structurée

* un vocabulaire et des outils pour produire des textes balisés

* des mécanismes étendus de personnalisation et d’extension


~~~

## De quoi avons nous besoin&nbsp;?

La documentation d’une édition structurée réclame deux choses complémentaires&nbsp;:
Un **schéma formel** (à l’instar d’autres langages informatiques tels que DTD, RELAX NG, W3C Schema, Schematron) pour contrôler l’édition

* déterminer quelles sont les balises disponibles

* dans quels contextes

* avec quels attributs, avec quelles valeurs

* en respectant quelles contraintes

Une **documentation** pour expliciter aux utilisateurs/développeurs nos principes éditoriaux, nos principes de choix de balises, etc.&nbsp;:
* dans plusieurs langues naturelles&nbsp;;

* dans plusieurs formats de fichier (PDF, MsWord, HTML, epub,...).

~~~

## Pourquoi ODD&nbsp;?

Ces différents pré-requis pourraient être satisfaits de diverses manières. L’utilisation d’ODD présente plusieurs avantages&nbsp;:

* il utilise un format XML bien établi,

* il fait partie intégrante du système de la TEI,

* il permet un traitement fortement intégré avec d’autres systèmes TEI,

* son utilisation améliore la pérennisation à long terme d’une édition

* il permet de partager des standardisations


~~~


## L’idée essentielle de ODD

One Document Does it all

Un vocabulaire spécialisé pour la déclaration et la documentation&nbsp;:
* des types d’élément XML, indépendamment de l’utilisation d’autres langages de schémas

* des patrons (macros)

* des types de données (datatypes)

* des classes et des sous-classes d’éléments

* des regroupements de déclarations (specGrp)
des références à d’autres schémas

Un **schéma** peut combiner&nbsp;:
* n’importe quel objet qui figure dans la liste ci-dessus

* des références à un regroupement prédéfini de tels objets (moduleRef)


~~~


## Un ODD peut combiner plusieurs spécifications

Un ODD peut combiner plusieurs spécifications pour un même objet

* une spécification **canonique** telle que référencée dans les Guidelines

* une ou plusieurs spécifications complètement ou en partie **modifiées**

* des spécifications explicitées ou héritées d’un autre ODD

* le statut de chaque spécification supplémentaire est explicité par son attribut `@mode` (par défaut `add`)

~~~


## Le langage de spécification de la TEI

La TEI est exprimée dans le langage ODD. C’est d’ailleurs à cette fin que le langage a d’abord été mis au point. 

Le code source disponible à cette adresse, [http://www.tei-c.org/release/xml/tei/odd/Source/](http://www.tei-c.org/release/xml/tei/odd/Source/), rassemble (en janvier 2025)&nbsp;:

* 39 fichiers en TEI, dont 25 chapitres de la documentation correspondant à un module
* 835 fichiers TEI qui définissent un élément, une classe, un type de donnée ou encore une macro&nbsp;:
  * 33 types de données (`teidata.xxx`)
  * 126 classes de modèle de contenu (`xxx.model.xxx`)
  * 81 classes d’attribut (`att.xxx`)
  * 36 modèles de données (`teidata.xxx`) et 6 fichiers de macros (`macro.xxx`)
  * 585 spécifications d’éléments de `ab.xml` jusqu’à `zone.xml`)



~~~


# Un fichier ODD peut également consister en une personnalisation

On utilise le même langage pour spécifier une personnalisation de la TEI.

Cette personnalisation peut être définie par rapport à une autre spécification ODD, habituellement une version des *Guidelines*.

* en sélectionnant des modules

* en sélectionnant parmi les objets définis par ces modules (éléments, classes, datatypes, macros)

* en supprimant ou en modifiant les attributs de ces objets

* en modifiant ou en remplaçant certaines parties de ces spécifications (p. ex. les valList)

* éventuellement avec la spécification d’objets nouveaux

~~~


## Comment créer un ODD&nbsp;?

Un ODD est un document TEI comme les autres mais qui utilise le vocabulaire spécifique décrit dans le module `tagdocs`. cf. https://tei-c.org/release/doc/tei-p5-doc/en/html/TD.html

Il y a plusieurs manières possibles de créer un fichier ODD&nbsp;:
* par l’intermédiaire d’une interface graphique comme [Roma](http://www.tei-c.org/Roma)

* par génération automatique avec [ODD By Example](http://teic.github.io/TCW/howtoGenerate-fr.html)

* En le rédigeant manuellement.


~~~


## TP01 – Manipuler un fichier ODD avec Roma

* Télécharger le fichier ODD [jTEI Article](https://tei-c.org/guidelines/customization/jtei/)

* Charger le schéma dans [Roma](http://www.tei-c.org/Roma)

* Observer les personnalisations

* Ouvrir le fichier XML résultat de l’export ODD

~~~


## TP02 – Générer un fichier ODD à partir d’un exemple

[http://teic.github.io/TCW/howtoGenerate.html](http://teic.github.io/TCW/howtoGenerate.html)

* Ouvrir un fichier XML-TEI

* Configurer un scénario de transformation dans Oxygen de la manière suivante&nbsp;:
* Choisir Transformation -&gt; Configurer le/les scénario(s) de transformation depuis le menu Document

* Cliquer sur Nouveau et choisissez "XML Transformation with XSLT"

* Donner un nom à votre scénario (par exemple, oddByExample)

~~~

## TP02 – Générer un fichier ODD à partir d’un exemple (suite)

* Laisser XML URL tel quel.

* Changer XSL URL pour pointer vers la feuille de style XSLT oddbyexample.xsl dans le répertoire de votre Framework TEI. Entrer `${frameworks}/tei/xml/tei/stylesheet/tools/oddbyexample.xsl`

* Choisir le processeur Saxon-PE &gt;9.4.0.4 comme processeur

* Cliquer sur l’engrenage près de cette boîte de dialogue pour choisir les Options avancées : vous avez besoin de renseigner la valeur `main` pour Template("-it") puis valider

~~~

## TP02 – Générer un fichier ODD à partir d’un exemple (suite)

* Observer les personnalisations

* Ouvrir le fichier XML résultat

* Cliquer ensuite sur le bouton Paramètres : vous devez régler le paramètre corpus pour contenir le nom complet du répertoire que vous voulez analyser. Supposant que vous avez ouvert un des fichiers mentionnés à la première étape ci-dessus, vous pouvez seulement donner au paramètre la valeur `${cfd}` et cliquer sur OK.

* Définissez les paramètres voulus dans l’onglet sortie

* Exécuter la transformation Lancer la transformation en cliquant sur le bouton `Appliquer les scénarios associés`

~~~

## Orientations bibliographiques

- « 24 Using the TEI ». s. d. The TEI Guidelines. Consulté le 14 janvier 2025. https://tei-c.org/release/doc/tei-p5-doc/en/html/USE.html.
- Burnard, Lou. 2013. « Resolving the Durand Conundrum ». *Journal of the Text Encoding Initiative*, no Issue 6 (septembre). https://doi.org/10.4000/jtei.842.
- Burnard, Lou. 2015. « Personnaliser la TEI ». In *Qu’est-ce que la Text Encoding Initiative ?*, traduit par Marjorie Burghart. Encyclopédie numérique. Marseille: OpenEdition Press. https://doi.org/10.4000/books.oep.1304.
- Burnard, Lou. 2020. « What Is TEI Conformance, and Why Should You Care? » *Journal of the Text Encoding Initiative*, no Issue 12 (mai). https://doi.org/10.4000/jtei.1777.
- Knuth, Donald Ervin. 1992. *Literate Programming*. CSLI Lecture Notes, no. 27. Stanford, Calif. : Center for the Study of Language and Information.
- Rahtz, Sebastian, et Lou Burnard. 2013. « Reviewing the TEI ODD System ». In *Proceedings of the 2013 ACM Symposium on Document Engineering*, 193‑96. Florence Italy: ACM. https://doi.org/10.1145/2494266.2494321.
- Viglianti, Raffaele. s. d. « One Document Does-it-all (ODD): a language for documentation, schema generation, and customization from the Text Encoding Initiative ». In . Washington, DC. Consulté le 14 janvier 2025. https://doi.org/10.4242/BalisageVol24.Viglianti01.

~~~

## Exemples de personnalisations

- Bauman, Syd. 2020. « A TEI Customization for Writing TEI Customizations ». *Journal of the Text Encoding Initiative*, no Issue 12 (mai). https://doi.org/10.4000/jtei.2573.
- Erjavec, Tomaž, et Andrej Pančur. 2021. « The Parla-CLARIN Recommendations for Encoding Corpora of Parliamentary Proceedings ». *Journal of the Text Encoding Initiative*, no Issue 14 (mars). https://doi.org/10.4000/jtei.4133.
- Holmes, Martin. 2020. « Using ODD for HTML ». *Journal of the Text Encoding Initiative*, no Issue 13 (mai). https://doi.org/10.4000/jtei.3106.
- Kokaze, Naoki, Kiyonori Nagasaki, Makoto Gotō, Yuta Hashimoto, A. Charles Muller, et Masahiro Shimoda. 2020. « Toward a Model for Marking up Non-SI Units and Measurements ». *Journal of the Text Encoding Initiative*, no Issue 12 (mai). https://doi.org/10.4000/jtei.1996.
- Romary, Laurent, et Charles Riondet. 2018. « EAD ODD: A Solution for Project-Specific EAD Schemes ». *Archival Science* 18 (2): 165‑84. https://doi.org/10.1007/s10502-018-9290-y.
- Tomasek, Kathryn, et Syd Bauman. 2013. « Encoding Financial Records for Historical Research ». *Journal of the Text Encoding Initiative*, no Issue 6 (septembre). https://doi.org/10.4000/jtei.895.

~~~

## Tutoriaux

- « Getting Started with P5 ODDs – TEI: Text Encoding Initiative ». s. d. Consulté le 9 juin 2024. https://tei-c.org/guidelines/customization/getting-started-with-p5-odds/.
- Bauman, Syd, et Julia Flanders. s. d. « TEI Customization Primer ». Northeastern University Women Writers Project. Northeastern University Women Writers Project. Consulté le 14 janvier 2025. https://www.wwp.neu.edu/outreach/resources/customization.html.
- 
