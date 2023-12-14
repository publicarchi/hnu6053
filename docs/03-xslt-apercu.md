title: Usage avancé de la TEI
description: Emmanuel Château-Dutier,
theme: theme/remark-dark-em.css
name: inverse
layout: true
class: inverse

---
template: inverse
class: center middle
name: index

# Rétro-ingénierie d’une XSLT simple

### HNU3053/HNU6053 Humanités numériques : Utilisation avancée de la TEI

---
layout: false

## Introduction

???

Au cours de cette première présentation, nous commencerons par examiner le modèle de données XML, puis nous aborderons les diverses expressions XPath et de leur types, avant de nous concentrer sur des expressions servant à décrire des chemins pour sélectionner des ensembles de nœuds dans un arbre XML.

---

## Qu’est-ce que XSLT ?

Un langage informatique, certes !

- XSL e**X**tensible **S**tylesheet **L**anguage
- un langage informatique dont les spécifications ont été publiées par le W3C en novembre 1999, en même temps que celles du langage XPath (XML Path) pour sa première version
- XSL se compose de deux parties XSL**T** pour **Transformations** et XSL**-FO** pour **Formating Object**
- la [seconde version du langage XSLT](http://www.w3.org/TR/xslt20/) a été publiée en 2007 en même temps que [XPath 2.0](http://www.w3.org/TR/xpath20/)
- une version 3.0 publiée en 2017.


---

## Cahier des charges de XSLT

- langage de transformation de XML
- capable de générer d’autres formats à partir du document source
- écrit en XML
- qui permet la réutilisation d’instructions
- sans ordre de traitement
- extensible

XSLT est un **langage déclaratif**, basé sur des instructions (ou règles) non ordonnées

Depuis sa version 2, XSLT est **langage fonctionnel, Turing complet**

???

Un langage déclaratif, basé sur des instructions (ou règles) non ordonnées : (comme CSS) mais dont les fonctionnalités sont bien plus avancées.

Cela donne un langage déclaratif basé sur des instructions (on dit des règles) non ordonnées, comme CSS, mais dont les fonctionnalités sont beaucoup plus puissantes.

XSLT 2.0 est langage fonctionnel, turing complet : on peut dire que c’est un langage fonctionnel car il est sans effets de bords (il n’y a pas de modifications de l’environnement ou du document source au cours du traitement)

---

## XSLT est un langage hôte de XPath

> XPath is a language for addressing parts of an XML document, designed to be used by both XSLT and XPointer
>
> The primary purpose of XPath is to address parts of an XML document.
>
> [XML Path Language 2.0, 2003](http://www.w3.org/TR/xpath20/)

???

Afin de pouvoir manipuler un document XML, il est tout d’abord nécessaire de pouvoir accéder aux éléments de l’arbre. C’est précisément la vocation du langage XPath développé par le W3C :

- "XPath is a language for addressing parts of an XML document, designed to be used by both XSLT and XPointer"
- "The primary purpose of XPath is to address parts of an XML document."

Comme le suggère cette première citation, XPath a d’abord été conçu pour être utilisé au sein de langages dits hôtes ayant besoin d’identifier des portions précises dans un document. On utilise ainsi XPath avec XSLT pour sélectionner des nœuds, extraire des informations, ou encore effectuer des tests.

Les expressions XPath peuvent aussi être utiles pour naviguer précisément dans des documents XML en créant des pointeurs hypertextes sophistiqués dans le contexte du langage XPointer.

Plusieurs utilisations de XPath sont donc possibles

- pour désigner des ensembles de nœuds dans une transformation XSLT
- pour contrôler la qualité d’un document XML (exploration, analyse, vérification)
- pour paralléliser des textes

---

## Historique XSLT/XPath

- première version du langage publiée en 1999
- immédiatement utilisée par **XSLT 1.0**
- premier langage de la famille XML à opérer sur un modèle de données
- seconde version du langage spécifiée en 2007
- support par les langages **XSLT 2.0** et **XQuery 1.0**
- s’appuie sur **XML Data Model** publié la même année[*], **version 3 en 2018**.

[XML Path Language (XPath) 2.0](http://www.w3.org/TR/xpath20/), [XQuery 1.0 and XPath 2.0 Data Model (XDM)](http://www.w3.org/TR/xpath-datamodel/), [XSL Transformations (XSLT) Version 2.0](http://www.w3.org/TR/xslt20/)

???

La première version du langage a été publiée en 1999 et fut immédiatement utilisée par XSLT 1.0.

XPath est le premier langage de la famille XML à avoir opéré sur un **modèle de données** au sens d’un cadre formel permettant la représentation et la manipulation de données. La description de la version 1.0 de ce langage, publiée en 1999, contient en effet la description d’un modèle de données très simple où un document XML est représenté comme un arbre pouvant être composé de **sept types de nœuds**.

La seconde version du langage, XPath 2.0, a été spécifiée en 2007 et a servi de support aux langages XSLT 2.0 et XQuery 1.0.

La seconde version de XPath, s’appuie sur XML Data Model publié en même temps que la spécification XPath 2.0.

La version 3 a été développée en même temps que XSLT et XQuery 3 et publiée en 2017-2018.

---

## Processus de transformation **XSLT**

![xsltProcessing](images/xsltProcessing.svg)

???

Ce schéma présente le processus à l’œuvre lorsque l’on associe une feuille de style et un document source.

Un programme XSLT spécifie une sortie à produire à partir d’un segment ou d’un fichier XML, si ce segment existe dans le document fourni en entrée et répond à certains critères.

XSLT n’est pas un langage procédural, car un programme XSLT se compose d’une collection de règles modèles qui définissent la sortie à produire lorsque des motifs particuliers concordent dans l’entrée.

Le résultat est une fonction de l’entrée.

---

## Processus de traitement (en bref)
XSLT est **une application XML pour la spécification de règles permettant de transformer un document XML en un autre document XML**

- un document XSLT contient des règles modèles
- chaque règle possède un motif ainsi qu’un modèle
- un processeur XSLT compare ces motifs avec les nœuds d’un document XSLT donné en entrée
- lorsqu’il y a correspondance il écrit le modèle de cette règle dans l’arbre de destination
- une fois le processus terminé, il sérialise l’arbre de sortie en un autre document XML ou dans un autre format comme du texte brut, un fichier CSV, ou du HTML

???

Un document XSLT – c’est-à-dire une feuille de style XSLT – contient des règles modèles.

Chaque règle possède un motif ainsi qu’un modèle. **On utilise XPath pour identifier les éléments à traiter**.

Un processeur XSLT compare les nœuds d’un document XML fourni en entrée avec les règles modèles présentes dans une feuille de style.

Lorsqu’il y a correspondance, il écrit le modèle de cette règle dans l’arbre de destination.

Une fois le processus terminé, il sérialise l’arbre de sortie en un autre document XML ou dans un autre format comme du texte brut, un fichier CSV, ou du HTML
(XML en concentré, p. 157)

---

background-image: url(images/whatXsltCanDo.png)

---

## Cas d’utilisation

- passage d’un modèle à l’autre
- transformation pour un site statique
- transformation dynamique (framework XML)
- base de données XML-native (XQuery + XSLT)

Besoins

- un ou plusieurs documents XML bien formés
- un programme XSLT
- un processeur

???

- passage d’un modèle à l’autre
- transformation pour un site statique
- transformation dynamique (framework XML)
- base de données XML-native

Besoin

- d’un document bien formé
- un programme XSLT
- un processeur

**Démonstration**

---

## Associer un document à une XSLT avec Oxygen

### faire une transformation avec Oxygen

Pour mémoire, cf. le guide suivant :

[http://dh.obdurodon.org/transformation-scenario.html](http://dh.obdurodon.org/transformation-scenario.html)

### transformation

- document XML en entrée : [../exemples/exercice-Angouleme.xml](../exemples/)
- programme XSLT [../xslt/tei2html.xsl](../xsl/)

---

## Que s’est-il passé ?

- **parsing** du document source et création en mémoire d’une représentation arborescente
- recherche dans le programme XSLT d’une règle s’appliquant à la racine du document XML, si elle existe : exécution de l’instruction et création d’un morceau de l’arbre résultat
- sauf si la règle commande de sélectionner un autre nœud, retour à l’arbre source et parcours de cet arbre dans l’ordre du document (du haut vers le bas, de gauche à droite) en cherchant à chaque fois une règle dédiée
- s’il y a plusieurs règles applicables à un même nœud des règles de priorité s’appliquent ; s’il n’y a pas de règle applicable pour un nœud à traiter, alors le processeur applique les instructions par défaut
- à la fin du processus sérialisation de l’arbre résultat pour produire en sortie un flux textuel selon les instructions spécifiées en tête de programme (en HTML, en XML, etc.)

???

Bien comprendre la notion d’arbre : vous comprenez maintenant sans doute mieux pour quelle raison il était si important de bien comprendre la notion d’arbre se fondant sur le modèle abstrait de XML.

Celui-ci est mobilisé par le processeur dans l’ordre de parcours du document et appliqué au produit de la transformation. Ce modèle abstrait a l’avantage de décrire de façon non ambiguë la structure et le contenu d’un document XML.

---

## Structure d’un programme XSLT

- Un programme XSLT est un fichier XML
- L’**élément racine** est `xsl:stylesheet` (ou `xsl:transform`) avec un attribut `@version` pour spécifier la version du langage et une déclaration d’espace de nom `xmlns`
- Un des **éléments de haut niveau**, `xsl:output` spécifie un format de sortie.
- Les **règles** sont spécifiées avec `xsl:template`

---

## Structure d’un programme

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xpath-default-namespace="http://www.tei-c.org/ns/1.0"
  xmlns="http://www.w3.org/1999/xhtml"
  version="2.0">
  <xsl:output method="xml" encoding="UTF-8" indent="yes" />
</xsl:stylesheet>
```

---

## Les règles

Les instructions de transformation sont englobées dans des éléments `xsl:template` qui constituent des **règles**. Ces règles possèdent obligatoirement :

- soit un attribut `match` qui indique au moyen d’une expression XPath le motif (*pattern*) auquel un nœud XML doit répondre pour que la règle soit exécutée

```xml
<xsl:template match="hi">
  <!-- corps de règle -->
</xsl:template>
```

- soit un attribut `@name` pour créer une règle nommée qui pourra être utilisée ailleurs en l’appelant par son nom. Un dispositif similaire à celui d’une macro.

```xml
<xsl:template name="regleNommee">
  <!-- corps de règle -->
<xsl:teplate
```

---

## Corps des règles

Le **corps d’une règle** contenue dans `xsl:template` comporte les instructions qui s’appliquent aux nœuds correspondant au motif indiqué dans l’attribut `@match`

- Ces **instructions** sont exprimées à l’aide des éléments XML définis par le langage XSLT.

  - `xsl:apply-templates` applique les règles en descendant en profondeur
  - `xsl:value-of` évalue la contenu textuel d’un nœud
  - `xsl:copy` copie la valeur d’un nœud
  - des constructeurs

---

## Contructeurs

- `xsl:element` génère un nœud élément
- `xsl:attribute` génère un nœud attribut
- `xsl:sequence` génère une séquence
- `xsl:text` génère un nœud textuel

---

## Ex 01 : règle vide

---

## Règles internes ou par défaut
Lorsque le processeur trouve un nœud qui ne correspond à aucun motif, il applique les instructions de transformation par défaut suivantes :

- pour un nœud élément ou pour le nœud document : il passe aux nœuds enfants
- pour un nœud texte : il sort la valeur textuelle
- pour un nœud attribut : il sort la valeur textuelle

voir les [/xsl/instructionsParDefaut.xsl](/xsl/instructionsParDefaut.xsl)

???

### Que faut-il faire
On a donc toujours besoin d’écrire ce genre de choses
`<xsl:template match="div"/>` pour sortir un élément du flux textuel.

---

## Ex 02 : copie à l’identique

---

### Comment fonctionne cette règle de recopie ?

```xml
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
```
voir le fichier  [/xsl/01CopieIdentique.xsl](/xsl/01CopieIdentique.xsl)


???

Lorsque l’on transforme un document, on a souvent besoin de recopier le contenu initial d’un document.
Une telle règle s’avère très utile dans deux cas de figures :
- lorsque l’on démarre un travail d’écriture de programme et que l’on n’a pas écrit toutes les instructions
- dans le cas où l’on voudrait agir précisément sur certains nœuds, ou en ajouter, tout en gardant l’essentiel du document initial

Cette règle est instanciée pour tous les nœuds, et pour les nœud attributs quels que soient leur nom.

Elle copie le nœud courant, puis applique les règles en descendant dans l’ordre de parcours du document en sélectionnant les nœud attributs.

Ou bien elle se contente d’indiquer au processeur de descendre dans l’ordre de parcours du document en appliquant les règles.

Comme vous l’aurez compris, cette règle est récursive. S’il y a un attribut, la même règle s’applique et copie le nœud attribut.
S’il n’y a pas d’attribut la règle copie les nœuds.

Conjointement avec l’instruction par défaut, cette règle créée donc une copie à l’identique du document.

---

## Ex 03, modifier un fichier

- supprimer les commentaires dans le fichier résultat ;
- supprimer les attributs `@xml-id` de `p` ;

---

## Production d’une page XHTML à partir d’un fichier XML-TEI

---

## Ex 01

### générer une structure XHTML

- En partant de [/xsl/02tei2html00.xsl](/xsl/02tei2html00.xsl) Écrire une XSLT pour générer une structure en HTML à partir du fichier [/corriges/acteRoyalFinal.tei.xml](/corriges/acteRoyalFinal.tei.xml)
- Configurer un scénario de transformation qui enregistre le résultat sous le nom "test.html" dans le répertoire `html` et l’ouvre dans le navigateur par défaut

Solution : [/xsl/02tei2html01.xsl](/xsl/02tei2html01.xsl)


---

## Ex 02

### Écrire une règle (de type pull) pour créer titre de la page

Solution : [/xsl/02tei2html02.xsl](/xsl/02tei2html02.xsl)


---

## Ex 03
### traiter le front de chaque texte

Solution : [/xsl/02tei2html03.xsl](/xsl/02tei2html03.xsl)


---

## Ex 04
### écrire une règle avec une instruction conditionnelle (xsl:if) pour le sous-titre

Renseigner les informations sur l’édition en utilisant les données du teiHeader

Solution : [/xsl/02tei2html04.xsl](/xsl/02tei2html04.xsl)

---

## XSLT, Bibliographie & liens utiles

### Ouvrages de référence

- Kay, Michael. 2008. *XSLT 2.0 and XPath 2.0: programmer’s reference*. 4th ed. Wrox programmer’s references. Indianapolis, IN : Wiley Pub.
- Tennison, Jeni. 2002. *Beginning XSLT*. Birmingham, UK : Wrox.
- Tennison, Jeni. 2005. *Beginning XSLT 2.0: from novice to professional*. Berkeley, CA : New York : Apress ; Distributed to the book trade in the United States by Springer-Verlag.
- Philippe Rigaux, Bernd Amann, *Comprendre XSLT*, Paris : O’Reilly, 2002. [mais XSLT 1.0]

---

## Liens utiles

- Emmanuel Chateau-Dutier, Josselin Morvan. Modern XML, Selected XML resources from the ANR Experts projet for the NA+DAH Getty advanced workshop. https://gist.github.com/emchateau/912e3de4710bd9f385d407a7a576078c
- [XSL-List – Open Forum on XSL](http://mulberrytech.com/xsl/xsl-list/)
- [XML Slack](https://join.slack.com/t/xmlcom/shared_invite/zt-ebhux9sm-bkyxD0alWjgtvcE8zzcHZQ)
- [Jeni’s XSLT Pages](http://www.jenitennison.com/xslt/index.html)
- [Zvon XSLT](http://zvon.org/comp/m/xslt.html)
- [XML Please](http://www.xmlplease.com)
