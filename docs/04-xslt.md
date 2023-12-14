# title: Usage avancé de la TEI

description: Emmanuel Château-Dutier,
theme: theme/remark-dark-em.css
name: inverse
layout: true
class: inverse

---
# Introduction à XSLT

## HNU3052/HNU6052 Humanités numériques : introduction à la TEI

???

Transformation simple tei2html.

Ceci n’est pas une formation complète! son objectif est de ...

* vous donner un avant-goût des possibilités offertes par les normes XSLT et XPath
* surtout dans le domaine de traitement des documents « XML-TEI », principalement donc sortis des sciences humaines
* aborder les concepts fondamentaux et les usages les plus répandus du norme XSLT

Lorsque l’on veut appliquer des traitements à des documents XML (transformation de documents p.e. pour produire une page web, création de liens hypertextes, extraction sélective d’informations p.e. dans une base de données XML native), il est souvent nécessaire de pouvoir localiser des fragments précis au sein de documents XML.

Une des caractéristiques essentielles du langage XPath, est qu’il s’appuie sur un modèle de données (le XML Data Model à partir de la version 2.0) dont la connaissance est essentielle pour une bonne compréhension du langage.

Il s’agit d’un véritable langage fonctionnel typé. Ainsi, l’utilisateur manipule des expressions et non des instructions, et l’évaluation de ces expressions produit des valeurs appartenant à des types définis dans un système de types. La version 2.0 langage intègre le riche système de types de XML Schema. Parmi de nombreux ajouts très utiles, la version 3.0 a principalement introduit les fonctions de haut niveau ainsi que de nouveaux types de contenus, les objets maps et les tableaux.

Au cours de cette première présentation, nous commencerons par examiner le modèle de données XML, puis nous aborderons les diverses expressions XPath et de leur types, avant de nous concentrer sur des expressions servant à décrire des chemins pour sélectionner des ensembles de nœuds dans un arbre XML.

---
layout:false

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

## Historique XPath / XSLT

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

## Qu’est-ce que XSLT ?

Une transformation est exprimée sous la forme d’une **feuile de style** (*stylesheet*). Une feuille de style est constituée d’un ou plusieurs documents XML bien formés ses conformant à la spécification sur les espaces de noms.

- un mélange d’éléments définis par XSLT 
  (dans l’espace de nom `http://www.w3.org/1999/XSL/Transform` )
- un mélange d’autres éléments XML

Une transformation décrit des **règles modèles** (*template rules*) pour transformer les données en entrée en données de sortie. 

- **arbre source** (*source tree*)
- **arbre résultat** (*result tree*)

La transformation est réalisée au moyen d’un ensemble de **règles modèles (*template rules*)**. Un règle modèle associe un **motif (*pattern*)** qui correspond typiquement à des nœuds dans le document sources, avec un **constructeur de séquence (*sequence constructor*)**. 

???

## Qu’est-ce que XSLT ?

[librement adapté de la spécification]

**Une transformation est exprimée sous la forme d’une feuile de style (stylesheet). Une feuille de style est constituée d’un ou plusieurs documents XML bien formés ses conformant à la spécification sur les espaces de noms.**

Une feuille de style, inclue généralement un mélange d’éléments définis par XSLT placés dans l’espace de nom de XSLT `http://www.w3.org/1999/XSL/Transform` et un mélange d’autres éléments.

Le terme feuille de style reflète le fait que XSLT est destiné à ajouter des informations de stylage à des documents sources XML en les transformant en un document consistant de XSL formating objects (XSL-FO) ou dans un autre format de présentation comme HTML, XHTML, ou SVG. Cependant XSLT est également employé pour toutes sortes de tâche de transformation, et pas seulement dans des buts de formattage ou d’applications de présentation.

**Une transformation exprimée en XSLT décrit des règles pour transformer les données en entrée en données de sortie.** Ces données seront toute des instances du XDM data model. Dans le cas le plus simple et le plus commun, l’entrée est un document XML désigné **arbre source (source tree)**, la sortie est un document XML appelé **arbre résultat (result tree)**. Il est également possible de traiter plusieurs documents sources ou de générer plusieurs documents résultats et de traiter d’autres formats que XML.

La transformation est réalisée au moyen d’un ensemble de **règles modèles (*template rules*)**. Un règle modèle associe un **motif (*pattern*)** qui correspond typiquement à des nœuds dans le document sources, avec un **constructeur de séquence (*sequence constructor*)**. Dans la plupart des cas, le constructeur de séquence provoquera la cosnrtuction de nouveaux nœuds qui peuvent faire partie d’un **arbre résultat (*result tree*)**. La structure de l’arbre résulatt peut être complètement différente de la structure des arbres sources. Lors de la construction d’un abre résultat, les nœuds des arbres sources peuvent être filtrés et réordonnés, et des structures arbritraires peuvent être ajoutées. Ce mécanisme permet à une feuille de style d’être applicable à une large classe de documents qui présentent des structures sources similaires.

Les **feuilles de style (*stylesheets*)** on une structure modulaire ; elles peuvent contenir plusierus package développés indépendamment les uns des autres, et chaque package peut cosntitué en plusieurs modules de feuilles de style.

- [Definition: un **motif (*pattern*)** spécifie un ensemble de conditions sur un item. Un item qui satisfie les conditions matche le motif ; un item qui ne satisfait pas les conditions ne matche pas.]
  Il existe deux types de motifs :
  - Un **motif de prédicat (*predicate pattern*)** est écrit sous la forme d’un point `.` suivi par un ou plusieurs prédicats entre crochets et matche n’importe quel item pour lesquels chaque prédicat est évalué vrai `true`.
    Cette construction peut être employée pour matcher des items de n’importe quel type (nœud, valeur atomique, ou un item de fonction).
  - un **motif de sélection (*selection pattern*)** utilise un sous-ensemble de la syntaxe des expressions de chemin (path expressions), et il est défini pour matcher un nœud dans l’expression de chemin correspondante qui sélectionne le nœud. Les motifs de sélection peuvent aussi être formés en combinaison d’autres motifs utilisant l’union, l’intersection et différents opérateurs.
- [Definition: un **constructeur de séquence (*sequence constructor*)** est une séquence de zéro ou plusieurs nœuds adjascents dans la feuille de style qui peuvent être évalués pour retourenr une séquence de nœuds, des valeurs atomiques, ou des items de fonction.

---

## Le point sur les versions

- [XSLT 1.0](https://www.w3.org/TR/xslt/) (1999)

- [XSLT 2.0](https://www.w3.org/TR/xslt20/), (2007)
  Group by, Améliorations XPath 2.0
  Inclue dans une série de 8 documents : XPath 2.0, XQuery 1.0, XQueryX 1.0, XSLT 2.0, Data Model (XDM), Functions and Operators, Formal Semantics, Serialization.

- [XSLT 3.0](https://www.w3.org/TR/xslt-30/) (2017)

  Streaming, packaging, sérialisations, JSON, améliorations syntaxiques, améliorations introduites par XPath 3.1, nouveaux types `map` et `array`, higher order functions

- [XSLT 4.0](https://www.saxonica.com/qt4specs/XT/Overview-diff.html) (en préparation)

cf. [XSLT cover page](https://www.w3.org/TR/xslt/)

???

À quelques différences près, on peut considérer XPath et XSLT1 comme des sous-ensembles de XSLT2 et XPath 2.

On abordera aujourd’hui principalement XPath 3.1 et XSLT 3.0 pour plus de facilité.

Pendant longtemps problème de compatibilité XPath 2.0 avec environnement PHP.
En passe d’être réglé par le portage du processeur Saxon en C++.

Certaines choses plus simples à faire en XPath 2.0 qu’avec XPath 1.0. Mais plus grande complexité du langage.

Une partie seulement de la version 3 est supportée par les processeurs libres. La couverture la plus complète du standard est offerte par Saxon qui propose également un processeur en JavaScript. Dans le domaine de XQuery, on travaille habituellement avec la version 3.1.

[XPath and XQuery Functions and Operators 3.1](https://www.w3.org/TR/xpath-functions-31/)

---

background-image: url(images/whatXsltCanDo.png)

---

## Cas d’utilisation

- passage d’un modèle à l’autre
- transformation pour un site statique
- transformation dynamique (framework XML)
- base de données XML-native

Besoins

- d’un document bien formé
- un programme XSLT
- un processeur

---

## Le processus de traitement (en bref)

**XSLT est une application XML pour la spécification de règles permettant de transformer un document XML en un autre document XML**

- un document XSLT contient des **règles modèles**
- chaque règle possède un **motif** ainsi qu’un **modèle**
- un **processeur** XSLT compare ces motifs avec les nœuds d’un document XSLT donné en entrée
- lorsqu’il y a correspondance il écrit le modèle de cette règle dans l’**arbre de destination**
- une fois le processus terminé, il **sérialise** l’arbre de sortie en un autre document XML ou dans un autre format comme du texte brut, un fichier CSV, ou du HTML

???

Un document XSLT – c’est-à-dire une feuille de style XSLT – contient des règles modèles.

Chaque règle possède un motif ainsi qu’un modèle. **On utilise XPath pour identifier les éléments à traiter**.

Un processeur XSLT compare les nœuds d’un document XML fourni en entrée avec les règles modèles présentes dans une feuille de style.

Lorsqu’il y a correspondance, il écrit le modèle de cette règle dans l’arbre de destination.

Une fois le processus terminé, il sérialise l’arbre de sortie en un autre document XML ou dans un autre format comme du texte brut, un fichier CSV, ou du HTML
(XML en concentré, p. 157)

**Démonstration**

---

## Ex. Associer un document à une XSLT avec Oxygen

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

- **`xsl:stylesheet`** est l’élément racine, l’attribut mandataire **`@version`** déclare la version du langage utilisée
- **`xsl:template`** permet de déclarer des règles

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.tei-c.org/ns/1.0"
  version="3.0">
  <xsl:output method="xml" encoding="UTF-8"/>
  <xsl:template match="/">
    <!-- corps de règle -->
  </xsl:template>
</xsl:stylesheet>
```

---

## Les règles

Les instructions de transformation sont englobées dans des éléments `xsl:template` qui constituent des **règles**. Chaque règle porte obligatoirement :

- soit un attribut **`@match`** qui indique au moyen d’une expression XPath le motif ou pattern auquel un nœud XML doit répondre pour que la transformation soit réalisée

```xml
<xsl:template match="/">
  <!-- corps de règle -->
</xsl:template>
```

- soit un attribut **`@name`** pour créer une règle nommée qui porura être utilisée en l’appelant par son nom (dispositif similaire à une macro)

```xml
<xsl:template name="getIds">
  <!-- corps de règle -->
</xsl:template>
```

---

## Corps des règles

Le **corps d’une règle** contenue dans `xsl:template` comporte les instructions qui s’appliquent aux nœuds correspondant au motif indiqué dans l’attribut `match`

Ces **instructions** sont exprimées à l’aide des éléments XML définis par le langage XSLT.

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

### Constructeurs littéraux

Il est possible

---

## Ex 01 : règle vide

---

### Règles internes ou par défaut

Lorsque le processeur trouve un nœud qui ne correspond à aucun motif, il applique les instructions de transformation par défaut suivantes :

- pour un nœud élément ou pour le nœud document : il passe aux nœuds enfants
- pour un nœud texte : il sort la valeur textuelle
- pour un nœud attribut : il sort la valeur textuelle

voir les [../xsl/instructionsParDefaut.xsl](../xsl/instructionsParDefaut.xsl)

???

### Que faut-il faire

On a donc toujours besoin d’écrire ce genre de choses
`<xsl:template match="div"/>` pour sortir un élément du flux textuel.

---

### Sortie d’un élement du flux de traitement

Pour sortir un élément du flux de traitement, il suffit d’écrire une règle vide

```xml
<xsl:template match="div" />
```

Supprime tous les éléments div.

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

voir le fichier  [../xsl/01CopieIdentique.xsl](../xsl/01CopieIdentique.xsl)


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

## Ex 03, Suppression

En utilisant des instructions `xsl:template` comment peut-on supprimer un élément du flux au cours de la copie du document ?

- supprimer les commentaires dans le fichier résultat ;
- supprimer les attributs `@xml-id` de `p` ;

---

## Utilisation des règles modèles

Les règles modèles `xsl:template` s’appliquent au motif (*pattern*) défini par l’attribut **`@match`**. Ce motif est exprimé sous la forme d’une expression XPath.

- Les règles sont instantiées selon l’ordre de traitement du document.
- On instantie habituellement la transformation avec un `xsl:apply-template` avec un attribut `@match="/"` qui part du nœud document
- Il est possible de définir l’ordre de traitement du document en utilisant les instructions `xsl:apply-template` avec l’attribut `@select`

---

## Ex. 01 générer une structure XHTML

On souhaite créer une page HTML à partir d’un document XML-TEI.

- En partant de [../xsl/02tei2html00.xsl](../xsl/02tei2html00.xsl) Écrire une XSLT pour générer une structure en HTML à partir du fichier [../exercices/tei.zip](/exercices/tei.zip)
- Configurer un scénario de transformation qui enregistre le résultat sous le nom "test.html" dans le répertoire `html` et l’ouvre dans le navigateur par défaut

Solution : [../xsl/02tei2html01.xsl](../xsl/02tei2html01.xsl)


---

## Ex 02

### Écrire une règle (de type *pull*) pour créer le titre de la page

En utilisant une règle-modèle, créer un titre HTML pour le document résultat.

Solution : [..xsl/02tei2html02.xsl](../xsl/02tei2html02.xsl)

???

Comment sélectionner titre principal ? Comment travailler avec deux titres ?


---

## Ex 03

### Définir un ordre de traitement du document

- traiter l’entête TEI du document
- préparer le traiter les différentes parties du document de `body` et `back`dans des `section` HTML distinctes.

Solution : [../xsl/02tei2html03.xsl](../xsl/02tei2html03.xsl)

---

## Boucles et récursions

- l’utilisation de règles `xsl:template` permet de traiter la récursion en XSLT
- `xsl:for-each` exécution d’instructions en bouclant sur chacun des nœuds désignés par l’attribut `select`.
  - le processuer traite les items dans la séquence définie par l’attribut mandataire `@select` successivement, chacun leur tour dans l’ordre du document (le nœud contexte `.` change)
  - `xsl:sort` trie la séquence de nœuds sélectionnés par `xsl:for-each` ou `xsl:apply-templates`
- `xsl:foreach-group` avec les attributs `@select` et `@group-by` permet de travailler sur des groupes d’éléments (nous ne couvrirons pas son utilisation)

---

## Instructions conditionnelles

- `xsl:if` instruction conditionnelle

```xml
<xsl:if test="@type">
  <!-- do something -->
</xsl:if>
```

- `xsl:choose` exécution d’une série de tests exprimés par une série de sous éléments `xsl:when`

```xml
<xsl:choose>
  <xsl:when test="@ref[starts-with(., '#')]">
      <!-- do something -->
  </xsl:when>
  <xsl:otherwise>
      <!-- do something -->
  </xsl:otherwise>
</xsl:choose>
```

---

## Ex 04

### Traiter l’entête du document

Fournir au début de la page HTML une notice du document.

- Traiter les titres avec une instruction conditionnelle `xsl:if` pour les sous-titre
- Traiter les contributeurs
- Traiter la description de la source

Solution : [../xsl/02tei2html04.xsl](../xsl/02tei2html04.xsl)

---

## Variables

- `xsl:variable` déclaration d’une variable
- `xsl:param` déclaration d’un paramètre

Notion de portée de la variable.

---

## Ex 05
### Traiter Les items de la table des matières

Solution : [../xsl/02tei2html05.xsl](../xsl/02tei2html05.xsl)

---

## Ex 06
### Générer les notes de commentaire

Solution : [../xsl/02tei2html06.xsl](../xsl/02tei2html06.xsl)

---

## Ex 07
### Générer les notes d’apparat critique

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

---

Cours en ligne

- Beshero-Bondar, Elisa. s. d. « NewtFire DH Courses and Workshops ». Consulté le 1 décembre 2022. https://newtfire.org/courses/.