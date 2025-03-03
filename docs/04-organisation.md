title: Organisation de la TEI
description: Emmanuel Château-Dutier,
theme: theme/remark-dark-em.css
name: inverse
layout: true
class: inverse


---
template: inverse
class: center middle
name: index


# Organisation de la TEI

---
layout: false

## Un cadre de travail flexible et modulaire

Les [22 modules](http://www.tei-c.org/release/doc/tei-p5-doc/en/html/ST.html#STMA) de la TEI

* Classement des éléments de la TEI par domaines d’application

* Chaque module fait l’objet d’un chapitre de la documentation

Classes et macros


* [Classes de modèle](http://www.tei-c.org/release/doc/tei-p5-doc/en/html/REF-CLASSES-MODEL.html)

* [Classes d’attribut](http://www.tei-c.org/release/doc/tei-p5-doc/en/html/REF-CLASSES-ATTS.html)

* [Macros et types de données](http://www.tei-c.org/release/doc/tei-p5-doc/en/html/REF-MACROS.html)

???

Dès l’origine, la TEI a été conçue pour être employée comme un ensemble de briques permettant de construire des schémas spécifiques pour un projet donné.

L’infrastructure de la Proposition numéro 5 de la TEI (P5) consiste en&nbsp;:
* vingt-deux modules parmi lesquels sont répartis les nombreux éléments de la TEI qui font l’objet d’une importante documentation textuelle

* ils sont formellement classés dans des classes de modèle et d’attributs auxquels on peut faire appel pour spécifier un schéma.

---


## Se repérer sur le site du Consortium

[http://www.tei-c.org](http://www.tei-c.org)

### Consortium

* Actualités

* Groupes de travail

* Wiki

### Guidelines

* Consultation des chapitres

* Description des éléments

* Classes

???

### Le site du consortium

Un site web très touffu dans lequel on peut parfois se perdre. On peut accéder à la liste des membres. Vous avez également un lien vers l’[Journal of the TEI](https://jtei.revues.org) dans le menu activités.

Vous disposez également d’un Wiki sur la TEI qui est un regroupement de tutoriaux, projets de la TEI. Une liste des projets utilisant la TEI. Il n’est pas obligatoire de déclarer que l’on travaille avec TEI. C’est une démarche libre, puisqu’il s’agit d’un logiciel libre avec lequel on fait ce que l’on veut.

Une partie du Wiki est consacrée aux outils. Si vous deviez démarrer un gros projet, c’est une bonne page pour déterminer les outils existants pour faire l’état de l’art. Mais, si elle constitue un passage obligé, cette page n’est évidemment pas exhaustif.

Les Guidelines, mais aussi About avec une rubrique sur l’histoire du projet.

La liste de discussion&nbsp;: il vous suffit de fournir votre nom et votre adresse courriel pour être abonné.

### Détail des Guidelines

* Consultation des chapitres

* Navigation par élément

* Consultation des classes

* Outils

Les parties concernant les spécifications formelles des Guidelines ont fait l’objet de traduction par le groupe Afnor. Des exemples correspondants à la pratique française ont été introduits.

En revanche le corps principal des Guidelines n’existe qu’en une seule langue. Si vous commencez un projet, rien ne vaudra une lecture attentive des chapitres qui vous intéressent. Il s’agit d’une recommandation de base. Ici c’est même un préalable, car si EAD par exemple est souple et facile à comprendre et cerner, TEI l’est beaucoup moins. Pour commencer à travailler avec TEI, la première consigne est de commencer à lire la documentation.

---


## Guidelines

* 23 chapitres par ordre d’intérêt

* 5 premiers chapitres généralistes

* 7 suivants discutent de type de textes en particulier

* 9 chapitres spécialisés

* 2 derniers chapitres sur la conformance

???

Le corps de l’édition actuelle des Guidelines contient vingt-trois chapitres arrangés dans un ordre croissant d’intérêt particulier. Les cinq premiers chapitres abordent en détail les questions importantes pour les personnes envisageant d’employer la TEI pour n’importe quel type de texte. Les sept chapitres suivants focalisent sur des genres de textes spécifiques : versifiés, dramatiques, textes oraux, dictionnaires, et manuscrits. Les neuf derniers chapitres s’occupent de sujets variés concernant plutôt des applications spécialisées. Enfin, les deux derniers chapitres s’occupent de l’utilisation de ODD qui sert à déclarer son utilisation de la TEI, et les questions de conformance et d’interopérabilité.

Bien évidemment, ces Guidelines ne sont pas faites pour être lues de bout en bout (même si vous pouvez le faire&nbsp;!). Il s’agit plutôt d’une documentation de référence.

Généralement, les chapitres suivent tous une organisation similaire. Ils débutent par des considérations générales sur le sujet traité. Repérer les navigations hypertextuelles (renvois), les tables de descriptions d’éléments et d’attributs, les exemples, et à la fin des chapitres le récapitulatif des éléments contenus dans les modules décrits par les chapitres.

---


# Rappels terminologiques

La TEI définit plusieurs éléments de la manière suivante&nbsp;:

* un **nom canonique** `<gi>` pour l’élément et optionnellement d’autres noms dans d’autres langues

* une **description canonique**, optionnellement traduite

* une déclaration d’appartenance à une classe

* la définition de chacun de ses attributs

* une définition de son **modèle de contenu** (ce qui peut apparaître où)

* des exemples d’utilisation et des notes

### Les modules

Les modules sont utilisés pour grouper un ensembles d’éléments par domaine d’utilisation de la TEI

### Les classes

Les classes de modèle de contenu ou les classes d’attributs réunissent des éléments qui partagent les mêmes modèles de contenus ou les mêmes attributs

---


# Le système de module

Par commodité, les éléments sont regroupés par domaine d’application qui correspondent aux chapitres de la TEI.
* `analysis`&nbsp;: Simple analytic mechanism
* `certainty`&nbsp;: Certainty and uncertainty
* `core`&nbsp;: Elements common in many TEI document
* `corpus`&nbsp;: Corpus texts
* `dictionaries`&nbsp;: Dictionaries
* `drama`&nbsp;: Performance texts
* ...&nbsp;: ...

On peut créer un schéma TEI en sélectionnant des modules et en désignant les éléments à inclure ou exclure.

---

## Les 22 [modules](http://www.tei-c.org/release/doc/tei-p5-doc/en/html/ST.html#STMA) de la TEI

![](images/modulesTEI.png)
---


## Les 22 [modules](http://www.tei-c.org/release/doc/tei-p5-doc/en/html/ST.html#STMA) de la TEI

Regroupés par domaine d’application, à chaque module correspond un chapitre des [Guidelines](http://www.tei-c.org/Guidelines/)

Trois modules habituellement requis&nbsp;:

* [`core`](http://www.tei-c.org/release/doc/tei-p5-doc/en/html/CO.html) éléments disponibles dans tous les documents TEI

* [`header`](http://www.tei-c.org/release/doc/tei-p5-doc/en/html/HD.html) en-tête TEI

* [`textstructure`](http://www.tei-c.org/release/doc/tei-p5-doc/en/html/DS.html) structure de text par défaut


&amp; [`tei`](http://www.tei-c.org/release/doc/tei-p5-doc/en/html/ST.html) infrastructure TEI

ex d’autres modules spécialisés&nbsp;: [`namesdates`](http://www.tei-c.org/release/doc/tei-p5-doc/en/html/ND.html) pour les noms et dates, [[`transcr`](http://www.tei-c.org/release/doc/tei-p5-doc/en/html/PH.html) pour la critique textuelle, [`msdescription`](http://www.tei-c.org/release/doc/tei-p5-doc/en/html/MS.html) pour la description de manuscrits, [`figure`](http://www.tei-c.org/release/doc/tei-p5-doc/en/html/FT.html) facsimili, ...

???

Les modules constituent avant tout un moyen commode de grouper par domaine d’application les nombreux éléments de la TEI (ils sont actuellement au nombre de 555).

Chaque module fait l’objet d’une description littérale dans un chapitre des Guidelines.

Trois de ces modules sont habituellement requis lors de la production d’un schéma (`core`, `header`, et `textstructure`, on utilise également `tei` pour RelaxNG).

Outre ces trois modules, on fait fréquemment appel aux modules suivants `figures`, `namesdates`, `linking`, `transcr`.

* Le module [`namesdates`](http://www.tei-c.org/release/doc/tei-p5-doc/en/html/ND.html) est particulièrement adapté pour la description des entités historiques de type personnes et lieux.
* Le module [`figure`](http://www.tei-c.org/release/doc/tei-p5-doc/en/html/FT.html) est utilisé conjointement avec `transcr` pour traiter la description des facsimili.
* [`transcr`](http://www.tei-c.org/release/doc/tei-p5-doc/en/html/PH.html) est destiné à la transcription de manuscrit et à la transcription de sources primaires. Y trouvera par exemple des éléments pour signaler un passage rayé, un ajout dans la marge (glose marginale), une abréviation, etc.
* [`msdescription`](http://www.tei-c.org/release/doc/tei-p5-doc/en/html/MS.html) sert à la description de manuscrits. Quand fait une édition de texte, besoin de décrire la source que l’on édite, on y trouver les éléments nécessaires.
* Il est également possible d’utiliser le module `dictionaries` pour le traitement d’un glossaire.
* Module `drama` pour la transcription du texte oral pas la même chose que texte de base. Composante de temps.
* `textCrit` lorsque l’on a besoin d’encoder un apparat critique, quand étudie un texte qui a plusieurs témoins, plusieurs manuscrits qui constitue plusieurs leçons d’un texte `transcrit` (variantes) critical aparatus
* `linking` qui concerne le modèle de lien

---

# Comment choisir&nbsp;?

Tout choisir (TEI all), n’est pas vraiment une bonne idée. La TEI est conçue de manière à ce que l’utilisateur puisse créer des schémas personnalisés qui sont des ensembles restreints de la TEI.

Afin de faciliter la prise en main, la TEI propose plusieurs sous-ensembles d’usage courant ÷

* TEI Lite

* TEI Bare

* TEI Simple

* jTEI Article


Il est également possible de spécifier son propre schéma de diverses manières grâce au langage ODD

---


# Le système de .red[classe]

La TEI distingue plus de 540 éléments. Ces éléments sont organisés dans des classes pour faciliter la compréhension du modèle, sa modularité et sa modification.

* Les **classes d’attribut** (Attribute class)&nbsp;: regroupe les éléments qui partagent les mêmes attributs
* Les **classes de modèle de contenu** (Model class)&nbsp;: regroupent les éléments qui peuvent apparaître dans les mêmes contextes (et qui sont souvent sémantiquement en rapport)

Les classes peuvent contenir d’autres classes.

Un élément peut être membre d’un nombre indéterminé de classe, indépendamment du module auquel il appartient.

---


# Les classes d’attribut

Les **classes d’attribut** (*Attribute class*) reçoivent généralement des noms adjectivaux et commencent par le préfixe att&nbsp;: p. ex.&nbsp;`att.naming`, `att.typed`

**Tous les membres de la classe héritent des attributs de cette classe**

* Tous les membres de `att.canonical` héritent de ses attributs `@key` et `@ref`

* Tous les membres de `att.typed` héritent des attributs `@type` et `@subtype`

--> Si l’on souhaite qu’un élément porte l’attribut `@type`, il suffit d’ajouter cet élément à la classe `att.typed` plutôt que de définir ses attributs spécifiquements sur cet élément.

---


# L’exemple de la classe `att.global`

La classe d’attribut `att.global` est définie par [https://www.tei-c.org/release/doc/tei-p5-doc/en/html/ref-att.global.html](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/ref-att.global.html)
* `@xml:id`&nbsp;: un identifiant unique
* `@xml:lang`&nbsp;: la langue du contenu de l’élément
* `@n`&nbsp;: un nombre ou un nom pour un élément
* `@rend`&nbsp;: la manière dont l’élément en question est rendu ou présenté dans la source

---


# Les classes de modèles de contenu

Les **classes de modèles de contenu** (*Model Classes*) regroupent les éléments qui sont autorisés dans les mêmes contextes.

Par exemple, si vous ajoutez un élément qui est attendu partout où un élément `<bibl>` est autorisé, il suffit de l’ajouter à la classe `model.biblLike`

* les classes de modèles de contenu ont habituellement un sufixe *Like* ou *Part*

* les membres de `model.pLike` sont toutes les choses qui se comportent de manière similaire aux paragraphes et sont permis au même endroit que les paragraphes

* les membres de `model.pPart.edit` sont des éléments pour des interventions éditoriales simples comme `<corr>` ou `<del>`

* les éléments de `model.pPart.data` sont les éléments de données tels que `<name>`, `<num>`, `<date>`, …

---


# Structure de base des modèles

On reconnaît généralement trois classes d’éléments
* **divisions**&nbsp;: divisions de haut niveau d’un texte
* **chunks**&nbsp;: éléments tels que les paragraphes qui apparaissent dans des textes ou des divisions mais pas dans d’autres chunks
* **phrase-level element**&nbsp;: des éléments tels que les mises en exergues, qui peuvent seulement intervenir au sein de chunks
* **inter-level element**&nbsp;: tels que les listes qui peuvent apparaître soit dans ou entre les chunks
* **components elements**&nbsp;: qui peuvent apparaître directement dans des textes ou des divisions

---


## Conventions de nommage

### Identifiants génériques

Les noms d’éléments sont les identifiants génériques

ex&nbsp;: `<name>` correspond à `name`

### Référence aux attributs

prennent la forme `@attname`, où "attname" est le nom de l’attribut

ex&nbsp;: `@name` correspond à `name`

Les noms TEI ressemblent à des mots anglais ... mais on peut les modifier

Par convention, on se sert du « camelCase »

---


## Conventions de nommage (.red[suite])

### Références aux classes

de la forme `model.divLike` pour les classes de modèle

de la forme `att.global` pour les classes d’attribut.

### Macros et types de données

de la forme `macro.paraContent` pour les macros

de la forme `teidata.pointer` pour les types de données.

suffixes `Part`, `Like`

racine `global` pour indiquer que les membres de la classe sont permis n’importe où dans un document TEI

suffixes additionnels préfixés par `.`

ex&nbsp;: `model.divPart`, `model.divPart.spoken`

???

Introduire la notion d’héritage à partir des conventions de nommage des classes&nbsp;:

Le premier suffixe "Part" si les membres de la classe sont tous fils de l’élément racine, ou "Like" les membres de la classe sont tous enfant de l’élément racine.

La racine de nom "global" est utilisée pour indiquer que les membres de la classe sont permis partout dans un document TEI

Il est possible d’ajouter des suffixes additionnels, préfixés par un "." pour distinguer des sous-classes sémantiques ou structurelles.

Par exemple la classe des éléments qui font partie de div est appelée `model.divPart`. Cette classe inclue dans une sous-classe les éléments qui peuvent faire partie d’une division dans un texte oral, qui est alors nommée `model.divPart.spoken`

---


## Déclaration du contenu d’un élément

* `<sequence>` Indique une séquence

* `<alternate>` Indique un choix

* `@minOccurs` Indique le nombre minimal de répétitions (par défaut 1)

* `@maxOccurs`Indique le nombre maximal de répétitions (par défaut 1)

* `<elementRef>` Indique la présence d’un élément

* `<classRef>` Indique la présence d’un ou de plusieurs éléments d’une classe spécifique

???

## Déclaration du contenu d’élément

* `<sequence>` Indique une séquence, c’est-à-dire que les composants sont présentés dans l'ordre où il faut les trouver.

* `<alternate>`Indique un choix, c’est-à-dire que l’on choisit entre tous les composants.

* `@minOccurs` et `@maxOccurs` sont d’habitude utilisés ensemble pour indiquer la cardinalité d’un composant. Si absent, ils ont tout les deux une valeur de 1.

* `<elementRef>` Indique un élément par son attribut `@key`

* `<classRef>` Indique une classe d'éléments par son attribut `@key`. La signification varie selon la valeur de son attribut `@expand`. Par défaut, il correspond à un élément (n’importe lequel) de la classe indiquée.
