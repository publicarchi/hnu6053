title: Comment la TEI utilise ODD
description: Lou Burnard Consulting
theme: theme/remark-dark-em.css
name: inverse
layout: true
class: inverse

---

template: inverse
class: center middle
name: index


# Comment la TEI utilise ODD

---
layout:false

# TEI ODD sous le capot

La TEI s’exprime en langage ODD. C’est d’ailleurs la raison initiale pour laquelle le langage fut inventé.

La source TEI P5 (disponible [ici](https://tei-c.org/guidelines/p5/using-the-tei-github-repository/) ) rassemble&nbsp;:
* 39 fichiers en TEI-XML, dont 25 contiennent un chapitre de documentation en XML-TEI, la plupart définissant un module, par exemple `PH-PrimarySources.xml`

* 778 fichiers en TEI-XML, chacun définissant un élément, une classe, ou une macro
* 29 datatypes (`data.xxxx`) par ex. `teidata.sex.xml`
* 116 classes de type modèle (code>model.xxxx) par ex. `model.biblLike.xml`

* 71 classes de type attribut (`att.xxxx`) par ex. `att.divLike.xml`

* 8 macros (macro.xxxx) par ex. `macro.phraseSeq.xml`

* 555 spécifications d’éléments de `ab.xml` jusqu'à `zone.xml`

Nous allons regarder cela de plus près…

<!-- voir slide début -->

---


# Organisation physique des Guidelines

Il ne faut pas confondre l’organisation physique (en fichiers) avec l’organisation logique (en spécifications, etc.)

* Le fichier `guidelines-XX.xml` est la source des Guidelines pour la langue XX.

* Mis à part quelques liminaires (un TEI Header, la page de titre, etc.), il contient plusieurs lignes comme ceci&nbsp;: `<include xmlns="http://www.w3.org/2001/XInclude" href="Guidelines/en/HD-Header.xml"/> `

* Au sein de chaque chapitre, on trouve des `xInclude` similaires pour les objets définis par ce chapitre.

---


# Organisation logique des Guidelines

* À la fin de chaque chapitre définissant un module, il y a (par convention) un élément `<moduleSpec>` qui rassemble toutes les spécifications référencées par le chapitre pour définir un module

* Ces spécifications sont organisées (par commodité) en `<specGrp>`, qui sont ensuite référencées par un `<specGrpRef>`

* Chaque `<specGrp>` regroupe des spécifications d’objet, indiqué par un `xInclude`

---


## Par exemple…

Cette partie de texte des Guidelines&nbsp;:
![](images/ft-1.png)
est généré à partir des lignes de code suivantes&nbsp;:
```xml
<div >
  <head>Module for Tables, Formulæ, Notated Music, and Graphics</head>
  <p>The module described in this chapter provides the following features:
   <moduleSpec xml:id="DFTFF" ident="figures">
     <desc>Tables, formulæ, notated music, and figures</desc>
     <desc xml:lang="fr">Tableaux, formules et graphiques</desc>
   <!-- ... -->
   </moduleSpec> The selection and combination of modules to form a TEI schema is
   described in <ptr target="#STIN"/>.
   <specGrpRef target="#DFTTAB"/>
   <specGrpRef target="#DFTFOR"/>
   <specGrpRef target="#DFTNTM"/>
   <specGrpRef target="#DFTGRA"/>
  </p>
</div>
```


---


# Les pointers (#DFTTAB etc.) indiquent des specGrp, comme ceci …

```xml
<specGrp  xml:id="DFTTAB" n="Tables">
 <include href="../../Specs/table.xml"/>
 <include href="../../Specs/row.xml"/>
 <include href="../../Specs/cell.xml"/>
 </specGrp>
```

et le xInclude apporte la specification elle meme d’un objet, par ex :

```xml
<elementSpec  module="figures" ident="cell">
   <gloss versionDate="2007-06-12" xml:lang="fr" rend="slide">cellule</gloss>
   <desc versionDate="2005-01-14" xml:lang="en">contains one cell of à table.</desc>
   <!-- ... -->
</elementSpec>
```

---


# De quels types d’objet s’agit-il&nbsp;?

* types de données (`datatypes`)

* classes de modèle (`model classes`)

* classes d’attribut (`attribute classes`)

* `macros`

* … et éléments

Nous allons détailler un exemple de chacun de ces objets …

---


# Une spécification ODD

Ouvrez `teidata.pointer.xml` avec oXygen

Comme tout autre spécification TEI…
* C’est un document XML, à valider contre le schéma spécifié

* Avec deux licences open source

* Il y a une description (`<desc>`) répétée en plusieurs langues, chacune identifiée par `@xml:lang` et avec une `@versionDate`

* La spécification est dotée d’un identifiant, fourni par l’attribut `@ident`), et appartient à un module (`@module`)

* Les remarques (`<remarks>`) sont plurilingues de la même manière que les `<desc>`


---


# Spécification d’un datatype

La signification d'un datatype est indiquée par son `<content>` Cet élément peut contenir :
* soit un élément `<dataRef>` soit un element `<valList>`

* un `<dataRef>` peut indiquer un type de donnée en utilisant un attribut `@name` attribute (type défini par XSD) ou un attribut `@key` (type défini par un élément `<dataSpec>`)

* un `<valList>` fournit une liste de `<valItem>`s, chacun définissant une valeur encodée.


---


# D’autres formes de spécification de datatype

Ouvrez `teidata.certainty.xml` avec oXygen

* Dans ce cas, la liste de valeurs possibles (dans `<content>` ) est fermée

* Les attributs utilisant ce datatype seront limités aux valeurs indiquées

Ouvrez `teidata.probCert.xml` avec oXygen

* Dans ce cas, le `<content>` propose une choix entre deux éléments `<dataRef>`

* Les attributs utilisant ce datatype peuvent avoir soit une des valeurs proposés pour `teidata.certainty`, soit une valeur indiquée par l'element `<content>` de `teidata.probability` (à savoir, un nombre réel entre 0 et 1)

---


# Spécification d’une classe modèle

Ouvrez `model.biblLike.xml` avec oXygen

* La spécification d’une classe modèle n’existe que pour être pointée par d’autres spécifications, donc pas grand chose à voir ici

* Comme ailleurs, on se sert d’un élément `<listRef>` pour regrouper des pointeurs sur la partie des Guidelines où cette classe est décrite.

* Notez l’élément `<classes>`&nbsp;: cette classe est réferencée par ("member of") d’autres classes modèles (`model.inter`, etc.). Une référence à la classe model.inter implique donc une référence à cette classe.

* Pour voir l’effet de cette hiérarchie de classes, regardez [la visualisation de cette spécification](http://www.tei-c.org/release/doc/tei-p5-doc/fr/html/ref-model.biblLike.html)

---


# Spécification d’une classe d’attribut

Ouvrez `att.divLike.xml` avec oXygen

* On vous recommande d’ouvrir la vue Sommaire (Fenêtre->Afficher la vue->Sommaire) si besoin est pour visualiser la structure

* La liste des attributs fournis par cette classe est specifiée dans un `<attList>`, qui contient deux `<attDef>` (`@org` et `@uniform`)

* les valeurs disponibles pour un attribut sont spécifiés par un `<datatype>` et éventuellement un `<valList>`, qui rassemblent chaque valeur prévue avec sa définition

* Cette classe est un sous-classe de deux autres (`att.metrical`, et `att.fragmentable`)&nbsp;: si ces classes sont disponibles, les attributs qu’elles fournissent seront donc également disponibles.

---


# Spécification d’un élément

Ouvrez `abstract.xml` avec oXygen

* C’est un élément assez récent (révisé le 2012-12-27) donc il n’y aucune traduction de sa `<desc>` etc. Les parties essentielles d’un `<elementSpec>` sont donc plus évidents.

* Les attributs `@module` et `@ident`

* l’élément `<classes>` qui précise les classes auxquelles cet élément appartient

* l’élément `<content>` qui précise le modèle de contenu de cet élément

* l’élément `<exemplum>` qui contient un exemple de l’usage de l’élément

* facultativement&nbsp;: des remarques (`<remarks>` et des renvois (`<listRef>`)

---


# Les classes TEI

Si on ne comprend pas le système de classes TEI, on aura du mal à comprendre le fonctionnement d’un ODD

* une classe d’attribut comme `att.global` fournit des attributs

* une classe de modélisation comme `model.profileDescPart` regroupe des éléments selon leur sémantique, ou leur possibilités de positionnement&nbsp;:
* model.xxxLike&nbsp;: resemble à un xxx

* model.xxxPart&nbsp;: constitue un xxx


* toute classe peut hériter ses propriétés d’une autre

* on se sert des classes de modélisation surtout dans les définitions de contenu, ce qui permet de les gérer avec une couche d’indirection

---


# Par exemple

```xml
<classes>
   <memberOf key="att.global"/>
   <memberOf key="att.responsibility"/>
   <memberOf key="model.profileDescPart"/>
</classes>
```

* étant membre de `model.profileDescPart`, `<abstract>` peut apparaitre dans `<profileDesc>` parce que le contenu de `<profileDesc>` est
```xml
<classRef  key="model.profileDescPart" maxOccurs="unbounded"/>
```


* en tant que membre de `att.responsibility`, il hérite des attributs `@cert` et `@resp`

* `att.responsibility` lui transmet également l’attribut `@source`, parce qu'elle est memberOf de la classe `att.source`

---


# Définition du contenu d’un élément

L'element `<content>` peut contenir:

* `<elementRef>` : un element

* `<classRef>` une classe d'element

* `<macroRef>` reference a un patron

* `<textNode>` un morceau de texte

* `<anyElement>` : un element non-specifie

Regroupé par :

* `<alternate>` une alternation

* `<sequence>` une séquence

Tous sous contrôle des attributs `@minOccurs` et `@maxOccurs` en ce qui concerne leurs fréquences d'occurence

---


# Par exemple ...

```xml
<content >
  <alternate maxOccurs="unbounded">
    <classRef key="model.pLike"/>
    <classRef key="model.listLike"/>
  </alternate>
</content>
```

« Un ou plusieurs éléments membres des classes `model.pLike` ou bien `model.listLike` »

```xml
<content>
  <sequence maxOccurs="unbounded">
    <classRef key="model.pLike"/>
    <classRef key="model.listLike"/>
  </sequence>
</content>
```

« Une ou plusieurs répétitions d'un élément de la classe `model.pLike` suivi d'un élément de la classe `model.listLike` »

---


# Exemples

l'élément `<egXML>` est utilisé partout dans les Guidelines pour fournir des exemples d'usage directement en XML-TEI. Pour permettre à une validation du contenu de cet élément il est associé avec une autre espace de nommage.

`<p>Par exemple : <egXML > <p>Je ne suis pas un p comme les autres</p> </egXML> </p>`

Oui, c'est une astuce.

---


# Contraintes schematron

* Une spécification d’élément peut aussi contenir un élément `<constraintSpec>` (ou plusieurs), rassemblant des règles exprimées en ISO schematron

* La TEI s’en sert pour exprimer des contraintes additionnelles non exprimables autrement, par exemple des contraintes contextuelles ou concurrentielles

* Le traitement de ces règles nécessite une étape additionnelle dans la validation des documents

* La version courante d’oXygen effectue cela automatiquement, pourvu que votre schéma s'exprime en RELAXNG et vos contraintes s’expriment en ISO schematron.

---


# Exemple de schematron

Ouvrez `span.xml` avec oXygen

* cette spécification comporte plusieurs `<constraintSpec>`, chacun avec son `@ident` et son `@scheme`

* un ou plusieurs `<constraint>` sont possibles

* la contrainte s’exprime en langue ISO schematron, donc dans un autre espace de noms

* par ex. `if @to is supplied on <name/>, @from must be supplied as well` (NB `<name/>` signifie le nom de l’élément qui activera cette règle)

Nous reviendrons sur ce sujet plus loin…

---


# Spécification d’une macro

Ouvrez `macro.phraseSeq.xml` avec oXygen

* Une macro, comme un datatype, fournit une abréviation conventionnelle pour des objets souvent utilisés&nbsp;; dans ce cas, un modèle de contenu.

* L’expansion d’une macro est fournie par un élément `<content>`.

```xml
<content>
 <alternate minOccurs="0" maxOccurs="unbounded">
   <textNode/>
   <classRef key="model.gLike"/>
   <classRef key="model.phrase"/>
   <classRef key="model.global"/>
 </alternate>
</content>
```

« Rien du tout, du texte, ou n’importe combien d’éléments membres de n’importe laquelle des trois classes `model.gLike`, `model.phrase` ou `model.global` »
