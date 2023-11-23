
title: Introduction à One Document Does It All (ODD)
description: Emmanuel Château-Dutier,
theme: theme/remark-dark-em.css
name: inverse
layout: true
class: inverse

---
class: center middle



# One Document Does It All (ODD), Introduction

## HNU6053


---
template: inverse
class: center middle
name: index


# Introduction à One Document Does It All (ODD)

---
layout: false

# Qu’est-ce qu’un ODD

* Un langage de spécification de document applicable pour n’importe quel type balisage

* ODD est le langage de définition et de maintenance de la TEI

* Celui-ci peut être utilisé pour déclarer une personnalisation TEI

---


# La TEI, un modèle extensible pour l’encodage des textes

La Text Encoding Initiative (TEI) offre un cadre de travail personnalisable et extensible pour traiter tout type de document textuels dans le contexte académique.

Elle offre&nbsp;:
* un cadre de travail pour l’édition structurée

* un vocabulaire et des outils pour produire des textes balisés

* des mécanismes étendus de personnalisation et d’extension


---


# De quoi avons nous besoin&nbsp;?

La documentation d’une édition structurée réclame deux choses complémentaires&nbsp;:
Un .red[schéma formel] (à l’instar d’autres langages informatiques tels que DTD, RELAX NG, W3C Schema, Schematron) pour contrôler l’édition
* déterminer quelles sont les balises disponibles

* dans quels contextes

* avec quels attributs

* avec quelles valeurs

* en respectant quelles contraintes

Une .red[documentation] pour expliciter aux utilisateurs/développeurs nos principes éditoriaux, nos principes de choix de balises, etc.&nbsp;:
* dans plusieurs langues naturelles&nbsp;;

* dans plusieurs formats de fichier (PDF, MsWord, HTML, epub,...).


---


# Pourquoi ODD&nbsp;?

Ces différents pré-requis pourraient être satisfaits de diverses manières.

ODD présente plusieurs avantages&nbsp;:
* il utilise un format XML bien établi,

* il fait partie intégrante du système de la TEI,

* il permet un traitement fortement intégré avec d’autres systèmes TEI,

* son utilisation améliore la pérennisation à long terme d’une édition

* il permet de partager des standardisations


---


# L’idée essentielle de ODD

.red[O]ne .red[D]ocument .red[D]oes it all

Un vocabulaire spécialisé pour la déclaration et la documentation&nbsp;:
* des types d’élément XML, indépendamment de l’utilisation d’autres langages de schémas

* des patrons (macros)

* des types de données (datatypes)

* des classes et des sous-classes d’éléments

* des regroupements de déclarations (specGrp)
des références à d’autres schémas

Un .red[schéma] peut combiner&nbsp;:
* n’importe quel objet qui figure dans la liste ci-dessus

* des références à un regroupement prédéfini de tels objets (moduleRef)


---


# Un ODD peut combiner plusieurs spécifications

Un ODD peut combiner plusieurs spécifications pour un même objet

* une spécification canonique telle que référencée dans les Guidelines

* une ou plusieurs spécifications complètement ou en partie modifiées

* des spécifications explicitées ou héritées d’un autre ODD

* le statut de chaque spécification supplémentaire est explicité par son attribut `@mode` (par défaut `add`)

---


# Le langage de spécification de la TEI

La TEI est exprimée dans le langage ODD. C’est d’ailleurs à cette fin que le langage a été mis au point.

Le code source disponible à cette adresse, [http://www.tei-c.org/release/xml/tei/odd/Source/](http://www.tei-c.org/release/xml/tei/odd/Source/), rassemble&nbsp;:

* 39 fichiers en TEI, dont 25 chapitres de la documentation correspondant à un module

* 832 fichiers TEI qui définissent un élément, une classe, un type de donnée ou encore une macro&nbsp;:
* 33 types de données (`teidata.xxx`)

* 118 classes de modèle de contenu (xxx.model.xxx)

* 73 classes d’attribut (`att.xxx`)

* 36 macros (`macro.xxx`)

* 567 spécifications d’éléments de `ab.xml` jusqu’à `zone.xml`


---


# Un fichier ODD peut également consister en une personnalisation

On utilise le même langage pour spécifier une personnalisation de la TEI.

Cette personnalisation peut être spécifiée par rapport à une autre spécification ODD, habituellement une version des Guidelines.

* en sélectionnant des modules

* en sélectionnant parmi les objets définis par ces modules (éléments, classes, datatypes, macros)

* en supprimant ou en modifiant les attributs de ces objets

* en modifiant ou en remplaçant certaines parties de ces spécifications (p. ex. les valList)

* éventuellement avec la spécification d’objets nouveaux

---


# Comment créer un ODD&nbsp;?

Un ODD est un document TEI comme les autres mais qui utilise le vocabulaire spécifique décrit dans le module `tagdocs`.

Il y a plusieurs manières possibles de créer un fichier ODD&nbsp;:
* avec une interface graphique comme [Roma](http://www.tei-c.org/Roma)

* par génération automatique avec [ODD By Example](http://teic.github.io/TCW/howtoGenerate-fr.html)

* En le rédigeant manuellement.


---


# TP01 – Manipuler un fichier ODD avec Roma

* Télécharger le fichier ODD [jTEI Article](https://tei-c.org/guidelines/customization/jtei/)

* Charger le schéma dans [Roma](http://www.tei-c.org/Roma)

* Observer les personnalisations

* Ouvrir le fichier XML

---


# TP02 – Générer un fichier ODD à partir d’un exemple

[http://teic.github.io/TCW/howtoGenerate-fr.html]()

* Ouvrir un fichier XML-TEI

* Configurer un scénario de transformation dans Oxygen de la manière suivante&nbsp;:
* Choisir Transformation -&gt; Configurer le/les scénario(s) de transformation depuis le menu Document

* Cliquer sur Nouveau et choisissez "XML Transformation with XSLT"

* Donner un nom à votre scénario (par exemple, oddByExample)

* Laisser XML URL tel quel.

* Changer XSL URL pour pointer vers la feuille de style XSLT oddbyexample.xsl dans le répertoire de votre Framework TEI. Entrer `${frameworks}/tei/xml/tei/stylesheet/tools/oddbyexample.xsl`

* Choisir le processeur Saxon-PE &gt;9.4.0.4 comme processeur

* Cliquer sur l’engrenage près de cette boîte de dialogue pour choisir les Options avancées : vous avez besoin de renseigner la valeur `main` pour Template("-it") puis valider


* Observer les personnalisations

* Ouvrir le fichier XML

* Cliquer ensuite sur le bouton Paramètres : vous devez régler le paramètre corpus pour contenir le nom complet du répertoire que vous voulez analyser. Supposant que vous avez ouvert un des fichiers mentionnés à la première étape ci-dessus, vous pouvez seulement donner au paramètre la valeur ${cfd} et cliquer sur OK.

* Définissez les paramètres voulus dans l’onglet sortie

* Exécuter la transformation Lancer la transformation en cliquant sur le bouton `Appliquer les scénarios associés`
