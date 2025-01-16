# XPath

### HNU3053/HNU6053 Humanités numériques : Utilisation avancée de la TEI

~~~

# Le modèle de données de XML

Note:

La syntaxe XML correspond en réalité à un modèle abstrait désigné XDM XML Data Model

http://www.w3.org/TR/xpath-datamodel/

~~~

# Les nœuds dans le modèle XDM

Dans le XML Data Model (XDM) un document est une structure d’arbre qui peut être composée de **sept types de nœuds**.

- `document node` (nœud document)
- `element node` (nœud élément)
- `attribute node` (nœud attribut)
- `comment node` (nœud commentaire)
- `processing instruction node` (nœud instruction de traitement)
- `text node` (nœud texte)
- `namespace node` (nœud espace de nom)

http://www.w3.org/TR/xpath-datamodel/

Note:
## les nœuds dans le modèle XDM

Dans le XML Data Model (XDM) un document est une structure d’arbre qui peut être composée de **sept types de nœuds**. En abordant le modèle de données de XML, on monte en abstraction par rapport à ce que vous savez déjà peut-être de XML. La syntaxe XML décrit en réalité un modèle abstrait à partir duquel on va pouvoir travailler informatiquement.

Ces **nœud** sont les sept types de nœuds définis dans le modèle de données XPath 1.0, à l’exception du nœud racine rebaptisé `document node` au lieu de `root node` :

- `document node` (nœud document)
- `element node` (nœud élément)
- `attribute node` (nœud attribut)
- `comment node` (nœud commentaire)
- `processing instruction node` (nœud instruction de traitement)
- `text node` (nœud texte)
- `namespace node` (nœud espace de nom)

http://www.w3.org/TR/xpath-datamodel/

~~~

## Contraintes des nœuds

Les éléments d’un document XML bien formé répondent à un certain nombre de contraintes

![diagramme UML](./images/contraintes.png)

Note:
### Contraintes des nœuds (rappel)

Les éléments d’un document XML bien formé répondent à plusieurs contraintes :

- un nœud document ne doit pas avoir de nœud père et peut avoir des nœuds fils qui peuvent être des nœuds élément, texte, commentaire, ou instruction de traitement
- un nœud élément peut avoir un nœud père qui doit être un nœud document ou élément et peut avoir des nœuds fils qui doivent être des nœuds espace de noms, attributs, élément, texte, commentaire ou instruction de traitement
- les nœuds fils d’un nœud document ou élément qui sont des nœuds élément, texte, commentaire ou instruction de traitement sont appelés les enfants de ce nœud
- un nœud document ou élément ne doit pas avoir deux enfants consécutifs qui sont des nœuds textes
- un nœud document ou élément ne doit pas avoir d’enfants qui sont des nœuds textes dont le contenu est vide
- un nœud espace de nom ou attribut peut avoir un nœud père qui doit être un nœud élément
- un nœud texte, commentaire ou instruction de traitement peut avoir un nœud père qui doit être un nœud élément ou document

~~~

## Ordre du document

- le nœud racine est le premier nœud après le nœud document

- les nœuds `element` précèdent leurs nœuds fils

- l’ordre relatif des nœuds frères entre eux est déterminé par leur ordre d’apparition dans la représentation balisée

- les nœuds `attribute` et `namespace` précèdent les nœuds fils de cet élément

- les nœuds `namespace` précèdent les nœuds `attribute`

- l’ordre des nœuds `namespace` et `attributs` dépend de l’implantation

Note:
###Ordre du document

Un document XML (ou un fragment de document) est composé d’une hiérarchie de nœuds. Chaque nœud a une identité et il existe un ordre du document.

Autrement dit, les nœuds qui sont accessibles lors d’une session de travail sont munis d’un ordre, qu’on appelle **ordre du document**. Cet ordre est défini tel que correspondant à l’ordre dans lequel le premier caractère de la représentation XML de chaque nœud apparaît dans le document XML balisé (après expansion des entités générales).

- le nœud racine est le premier nœud element après le nœud document, il contient tous les autres éléments

- les nœuds `element` précèdent leurs nœuds fils

- l’ordre relatif des nœuds frères entre eux est déterminé par leur ordre d’apparition dans la représentation balisée **(autrement dit, les nœuds descendants d’un nœud apparaissent avant le nœud frère)**

- les nœuds `attribute` et `namespace` précèdent les nœuds fils de cet élément

- les nœuds namespace précèdent les nœuds `attribute`

- l’ordre des nœuds `namespace` et `attribute` dépend de l’implantation

~~~

# Exercice 01

~~~

### Exercice : Produire la représentation arborescente de [phares.tei.xml](./exemplesTEI/phares.tei.xml)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<body xmlns="http://www.tei-c.org/ns/1.0" n="spleenEtIdeal">
  <div type="longPoem">
    <head>Les Phares</head>
    <lg type="stanza">
<l n="1">Rubens, fleuve d’oubli, jardin de la paresse,</l>
<l n="2">Oreiller de chair fraîche où l’on ne peut aimer,</l>
<l n="3">Mais où la vie afflue et s’agite sans cesse,</l>
<l n="4">Comme l’air dans le ciel et la mer dans la mer ;</l>
<!-- nœud commentaire -->
    </lg>
    <lg type="stanza">
<l n="5">Léonard de Vinci, miroir profond et sombre,</l>
<l n="6">Où des anges charmants, avec un doux souris</l>
<l n="7">Tout chargé de mystère, apparaissent à l’ombre</l>
<l n="8">Des glaciers et des pins qui ferment leur pays ;</l>
    </lg>
    <gap reason="sampling" quantity="9" unit="stanza"/>
  </div>
  <div type="shortPoem">
    <head>La Muse malade</head>
    <gap reason="sampling" quantity="4" unit="stanza"/>
  </div>
</body>
```

~~~

## Sérialisation arborescente de [phares.tei.xml](./exemplesTEI/phares.tei.xml)

![solution](./images/diagram01.svg)

Note:
On peut décrire la relation hiérarchique entre les nœuds d’un document XML en faisant l’analogie avec une famille.

### Enfant
- Un élément peut avoir zéro, un ou plusieurs autres éléments enfants. Il peut également avoir des enfants texte, commentaire, et instruction de traitement.
- Les attributs ne sont pas considérés comme les enfants d’un élément
- Un nœud document peut avoir un élément fils (celui qui contiendra tous les autres) mais aussi des fils commentaire, ou instruction de traitement.

### Parent
Le parent d’un élément est soit un autre élément soit un nœud document. Le parent d’un attribut est l’élément qui le porte.

Attention ! Même si les attributs ne sont pas considérés comme fils des éléments, les éléments sont les parents des attributs !

### Ancêtre
Les ancêtres sont les nœuds parents, les parents des parents, etc.

### Descendants
Les descendants sont les enfants, petits-enfants, et tous les descendants d’un nœud.

### Sibling
Les siblings d’un nœuds sont les autres enfants de son parent. Les attributs ne sont pas considéré comme des siblings.

~~~

background-image: url(./images/composants.svg)

# Les composants du modèle de données XML

Note:
Une autre manière possible de visualiser les différentes composantes définies par le modèle de données XML.

détailler séquence, item, etc.

~~~

background-image: url(./images/xmlSimplifiedXDM.svg)

# Version simplifiée du modèle XDM

.footnote[Eric Van der List. Simplified XDM. https://xmllondon.com/2014/slides/vlist/index.html#/step-16 CC-By 4.0]

~~~

## Le modèle [XDM](http://www.w3.org/TR/xpath-datamodel/) (suite)
#### Les nœuds ont une .red[identité] :

Chaque nœud possède une identité unique. On peut avoir deux nœuds avec le même nom et le même contenu dans le document source, mais cela ne signifie pas qu’ils auront la même identité. L’identité est unique pour chaque nœud, elle est affectée par le processeur.

#### Aux nœuds sont attachées différentes propriétés :

- Les éléments et les attributs possèdent un nom.
  Ces noms sont accessibles à l’aide des fonctions `node-name()`, `name()`, `local-name()`
- Pour chaque type de nœud, il est possible de déterminer ce que l’on appelle sa .red[valeur de chaîne] (`string value`) qui correspond schématiquement à son contenu textuel.
  On peut accéder à la valeur textuelle d’un élément avec la fonction `string()`
- On peut encore extraire d’un nœud sa .red[valeur typée] (`typed value`), son nom qualifié, etc.

Note:

### identité d’un nœud

Les nœuds ont une identité. Deux nœuds créés par deux expressions différentes sont distincts même s’ils ont le même nom, les mêmes fils, etc.

Chaque nœud possède une identité unique. On peut avoir deux nœuds avec le même nom et le même contenu dans le document source, mais cela ne signifie pas qu’ils auront la même identité. L’identité est unique pour chaque nœud, elle est affectée par le processeur.

### Aux nœuds sont attachées différentes propriétés :

### nom

En outre, les éléments et les attributs possèdent un nom. Ces noms sont accessibles à l’aide des fonctions `node-name()`, `name()`, `local-name()`

### Valeur textuelle

Par exemple, pour chaque type de nœud, il est possible de déterminer ce que l’on appelle sa valeur de chaîne (`string value`) qui correspond schématiquement à son contenu textuel.

Les nœuds peuvent avoir deux types de valeur, une valeur de chaîne et une valeur typée. Tous les nœuds ont un contenu textuel (string value). La valeur textuelle d’un élément est la concaténation des données caractères de cet élément et de ses descendants.

On peut accéder à la valeur textuelle d’un élément avec la fonction `string()`

On peut encore extraire d’un nœud sa valeur typée (`typed value`), son nom qualifié, etc.

Globalement : se souvenir qu’un nœud possède un nom, et une valeur textuelle à laquelle on pourra accéder à l’aide d’une expression XPath

~~~

# Notion de schéma

~~~

## Modèles de documents

**Définissent les contraintes que doit respecter une certaine classe de documents**

#### Syntaxes

Diverses syntaxes peuvent être utilisées pour écrire de tels modèles

- DTD (partie intégrante de la norme XML 1.0), la plus utilisée encore aujourd’hui ;
- [schémas XML](<http://www.w3.org/XML/Schema>), norme du W3C publiée en mai 2001 ; 2e édition octobre 2004 ;
- [schémas RelaxNG](<http://www.relaxng.org/>), norme ISO/IEC 19757-2, depuis 2003, amendée en 2008.

#### Validation

Beaucoup d’applications XML sont validantes, ainsi un processeur XSLT n’opérera de transformation à partir d’un document XML associé à un modèle que si ce document XML est valide.

Note:

Les schémas, qui peuvent s’écrire en XML quelle que soit la syntaxe choisie, permettent de contraindre plus fortement que les DTD le contenu des attributs et des éléments, et gèrent les espaces de noms.
Un parseur sachant interpréter la syntaxe utilisée pourra vérifier qu’un document est conforme à un modèle donné (est valide).

Exemples de parseurs : ceux intégrés aux éditeurs XML, aux navigateurs Web ; xmllint dans la librairie libxml, etc.

Beaucoup d’applications XML sont validantes, ainsi un processeur XSLT n’opérera de transformation à partir d’un document XML associé à un modèle que si ce document XML est valide.

~~~

## Un schéma

#### Définition d’une grammaire

#### Choix des séquences d’éléments

#### Choix des cardinalités

#### Définition de contextes

#### Valeurs prédéfinies

#### Valeurs typées
