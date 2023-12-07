title: ODD Initiation
description: Emmanuel Château-Dutier,
theme: theme/remark-dark.css
name: inverse
layout: true
class: inverse

---
template: inverse
class: center middle
name: index

# La syntaxe ODD

### HNU3053/HNU6053 Humanités numériques : Utilisation avancée de la TEI

---
layout: false

# Les composants principaux d’un fichier ODD

Un fichier ODD contient un ensemble de spécifications et de références
* `schemaSpec`
   &nbsp;: définit et identifie un schéma
* `elementSpec`
   &nbsp;: fournit la définition d’élément, entièrement ou en partie
* `elementRef`
   &nbsp;: utilise une définition d’un élément existant
* `classSpec`
   &nbsp;: fournit la définition d’une classe
* `classRef`
   &nbsp;: utilise une définition de classe existante
* `moduleRef`
   &nbsp;: fournit un ensemble de spécifications d’éléments en faisant référence à un module

Un ODD peut combiner plusieurs spécifications pour un même objet

---


# L’élément `<schemaSpec>`

L’élément `<schemaSpec>` est utilisé pour spécifier un schéma

* L’attribut `@ident` est obligatoire, il fournit un nom pour le schéma

* L’attribut `@start` indique le ou les noms des éléments racines du schéma

* L’attribut `@source` indique l’emplacement des déclarations référencées par le schéma (par exemple une version spécifique de la P5)

* Les attributs `@docLang` et `@targetLang` permettent de sélectionner les langues pour les noms ou la description des éléments

```xml
<schemaSpec start="TEI" ident="test"
 source="tei:1.5.0" docLang="fr">
<!-- déclarations -->
</schemaSpec>
```

---

# Composants d’un `<schemaSpec>`

* `<elementSpec>`, `<classSpec>`, `<dataSpec>`, `<macroSpec>`, etc. permettent de spécifier de nouveaux éléments

* `<elementRef>`, `<classRef>`, `<dataRef>`, `<macroRef>`, etc. font référence à des objets déjà existant quelque part

* `<moduleRef>` désigne un ensemble d’objets fournis par un module de la TEI

L’élément `<moduleRef>` permet la sélection d’un ensemble d’objets TEI par défaut dans son entièreté. L’allocation des objets référencés peut être spécifiée par un attribut `@source`. Par défaut il s’agit de la version la plus récente de la TEI P5.

---


# `<moduleRef>` sélection par exclusion

Il est possible de spécifier les éléments que l’on souhaite supprimer parmi ceux proposés par un module

```xml
<schemaSpec start="TEI" ident="test">
  <moduleRef key="core" except="mentioned said"/>
  <!-- ... -->
</schemaSpec>
```

ou aussi&nbsp;:

```xml
<schemaSpec start="TEI" ident="test">
  <moduleRef key="core">
    <elementSpec ident="mentioned" mode="delete"/>
    <elementSpec ident="said" mode="delete"/>
    <!-- ... -->
 </moduleRef>
</schemaSpec>
```

L’attribut `@mode` contrôle la résolution de déclarations multiples

---


# `<moduleRef>` sélection par inclusion

Il est possible de spécifier les éléments que l’on souhaite inclure parmi ceux proposés par un module

```xml
<schemaSpec start="TEI" ident="test">
  <moduleRef key="core" include="mentioned said"/>
  <!-- ... -->
</schemaSpec>
```

ou aussi&nbsp;:

```xml
<schemaSpec start="TEI" ident="test">
  <moduleRef key="core">
    <elementRef key="mentioned"/>
    <elementRef key="said"/>
    <!-- ... -->
  </moduleRef>
</schemaSpec>
```

Attention&nbsp;! un module peut définir bien d’autres choses que des éléments. Les attributs `@include` et `@exclude` ne s’appliquent qu’aux éléments.

---


# Utilisation des modules

* Il n’est pas nécessaire de préciser le module lorsque l’on fait référence à un élément

* Un simple `<elementRef>` suffit pourvu que l’élément concerné soit déclaré dans la source invoquée

* Par contre, il faut préciser le module d’un élément si vous souhaitez inclure ou utiliser une classe de modèle de contenu ou une classe d’attribut

* La plupart des classes TEI étant définies par le module `tei`, celui-ci est à peu près essentiel pour tout ODD TEI.

---


# Spécifications multiples

Le traitement d’un ODD implique la résolution de spécifications multiples pour un même objet.

Supposons deux `<elementSpec>` pour un même élément, la résolution est déterminée par la valeur de l’attribut `@mode`&nbsp;:

* `mode="add"` (par défaut)&nbsp;: effectue une nouvelle déclaration

* `mode="delete"`&nbsp;: aucune déclaration n’est valide, l’élément est supprimé

* `mode="replace"`&nbsp;: cette déclaration remplace entièrement toute autre déclaration

* `mode="change"`&nbsp;: les parties de cette déclaration remplacent les parties correspondantes dans une autre déclaration, le reste ne change pas

---


# Exemples de spécifications multiples

```xml
<schemaSpec start="TEI" ident="testschema">
  <moduleRef key="core" include="p hi"/>
  <elementSpec key="p" mode="delete"/>
</schemaSpec>
```

L’élément `<p>` est supprimé

```xml
<schemaSpec start="TEI" ident="testschema">
  <moduleRef key="core" include="p hi"/>
  <elementSpec key="p" mode="change">
    <desc>Cet élément ne contient que de texte</desc>
    <content>
      <textNode/>
    </content>
  </elementSpec>
</schemaSpec>
```

Le contenu et la description de l’élément `<p>` sont changés, ses autres propriétés (par exemple ses attributs) restent inchangés.

---


# Traitement d’un ODD

* Toutes les déclarations (de type `Spec` ou `Ref`) sont d’abord réunies et canonisées

* Les déclarations multiples sont résolues

* La sortie de cette procédure est ensuite transformée en schéma, et/ou en documentation

Une feuille de style `odd2odd` permet d’effectuer les deux étapes initiales et d’en concerver le résultat&nbsp;: cela s’appelle un .red[Compiled ODD]

Un tel fichier est utilisable comme la source d’un autre ODD (chaînage).

---


# Exemple de personnalisation

```xml
<schemaSpec ident="transMin" start="TEI text div" docLang="fr">
  <moduleRef key="tei"/>
  <moduleRef key="header"
  include="teiHeader fileDesc titleStmt publicationStmt sourceDesc"/>
  <moduleRef key="textstructure" include="TEI text body div"/>
  <elementRef key="ab"/>
  <elementRef key="pb"/>
  <elementRef key="unclear"/>
  <elementRef key="hi"/>
  <elementRef key="name"/>
  <elementRef key="title"/>
  <classRef key="att.global.rendition" except="rendition style"/>
  <classSpec type="atts" ident="att.declaring" mode="delete"/>
  <classSpec type="atts" ident="att.edition" mode="delete"/>
  <classSpec type="atts" ident="att.editLike" mode="delete"/>
</schemaSpec>
```

---


# Exemple de personnalisation

```xml
<schemaSpec ident="transMin"
start="TEI text div" docLang="fr">
  <!-- ... -->
  <elementSpec ident="botName" ns="http://monexcellentprojet.com">
    <desc>nom botanique</desc>
    <desc xml:lang="en">botanical name</desc>
    <classes>
      <memberOf key="model.phrase"/>
      <memberOf key="att.global"/>
    </classes>
    <content>
      <macroRef key="macro.paraContent"/>
    </content>
  </elementSpec>
  <!-- ... -->
</schemaSpec>
```

---


# Définition du contenu d’un élément

Le modèle de contenu d’un élément est défini avec `<content>` qui peut contenir :

* `<elementRef>` : une référence à un élement

* `<classRef>` : une référence à une classe

* `<macroRef>` : une réference à un patron

* `<textNode>` : un morceau de texte

* `<anyElement>` : un élement non-spécifié

Ces différents types de contenus sont regroupé par :

* `<alternate>` une alternation

* `<sequence>` une séquence

Les attributs `@minOccurs` et `@maxOccurs` déterminer leur cardinalité.

---


# Par exemple ...

```xml
<content>
  <alternate maxOccurs="unbounded">
    <classRef key="model.pLike"/>
    <classRef key="model.listLike"/>
  </alternate>
</content>
```

« Un ou plusieurs éléments membres des classes `model.pLike` ou bien `model.listLike` »

```xml
<content>
  <sequence maxOccurs="unbounded">
    <classRef key="model.pLike"/>
    <classRef key="model.listLike"/>
  </sequence>
</content>
```

« Une ou plusieurs répétitions d'un élément de la classe `model.pLike` suivi d'un élément de la classe `model.listLike` »
