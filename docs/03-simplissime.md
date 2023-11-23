title: Initiation ODDAn ODD Initiation
description: Emmanuel Château-Dutier,
theme: theme/remark-dark-em.css
name: inverse
layout: true
class: inverse


---
template: inverse
class: center middle
name: index


# Un exemple très simple

---
layout: false

# Un exemple très simple pour un livre

Nous utilisons un élément `<book>`, qui contient un mélange d’éléments `<para>`s et `<image>`s. Nous ne connaissons rien de la TEI, et n’en avons pas envie. De même pour les espaces de noms.

```xml
<schemaSpec ns="" start="book" ident="bookSchema">
  <elementSpec ident="book">
    <desc>Élément racine d’un schéma simplissime pour encoder les livres</desc>
    <content>
      <alternate maxOccurs="unbounded">
        <elementRef key="para"/>
        <elementRef key="image"/>
      </alternate>
    </content>
  </elementSpec>
  <!-- ... la suite à la prochaine diapo -->
</schemaSpec>
```

---


# Un exemple très simple pour un livre  (suite)

```xml
<schemaSpec ns="" start="stuff" ident="oddex-1">
  <!-- ... suite -->
  <elementSpec ident="para">
    <desc>un paragraphe de text </desc>
    <content>
      <textNode/>
    </content>
  </elementSpec>
  <elementSpec ident="image">
    <desc>un élément vide qui pointe sur un fichier graphique</desc>
    <content/>
    <attList>
      <attDef ident="href">
        <desc>fournit l’URI de l’objet ciblé</desc>
        <datatype>
          <dataRef name="anyURI"/>
        </datatype>
      </attDef>
    </attList>
  </elementSpec>
</schemaSpec>
```

---


# Et une fois que l’on a fait ça&nbsp;?

* On peut maintenant générer un schéma RELAX NG, W3C, ou DTD à l’aide d’une transformation XSLT

* On peut extraire les fragments documentaires, notamment les descriptions des éléments et des attributs

TEI fournit un élément spécialisé pour cela&nbsp;:
```xml
<specList>
  <specDesc key="para"/>
  <specDesc key="picture"/>
</specList>
```


Ce balisage générera quelque chose comme&nbsp;

* `<para>` : un paragraphe de texte

* `<picture>` : un élément vide qui pointe sur un fichier graphique

---


# .red[TP.] Essayons avec oXygen…

* Démarrez oXygen
* Créez un nouveau fichier (`CTRL-N`)
* Sélectionnez `Modèles du Framework > TEI > ODD Customization` dans le menu `Choisir un modèle de fichier` de la boîte de dialogue `Nouveau`, puis cliquez sur `Créer`
* Dans le document, remplacer l’élément `<schemaSpec>` proposé par le contenu du fichier `oddex-1.xml`
* Enregistrez votre ODD sous le nom `oddex-1.odd`
* Sélectionnez les Scénario de Transformation `TEI ODD to RELAX NG XML` et `TEI ODD to HTML` pour générer un schéma et sa documentation à partir de cet ODD
* Prendre connaissance de la documentation
* Validez le fichier test `oddex-1-test.xml` contre le schéma `out/oddex-1.rnc` que vous venez de générer

---


# Notions de .red[classe]

Dans le monde réel, le contenu de nos éléments `<book>` ne se limite pas uniquement à des `<para>` et des `<image>`... On souhaite regrouper tous les éléments qui peuvent apparaître au sein d’un `book`&nbsp;: nous appelons ce regroupement une classe, pour laquelle nous proposons le nom `bookPart`.

Dans la spécification de l’élément, l’élément `<classes>` indique l’association d’un élément sa classe ou ses classe:
```xml
<elementSpec ident="para">
  <classes>
    <memberOf key="bookPart"/>
  </classes>
</elementSpec>
```


Voici une définition pour la classe `bookPart`.

```xml
<classSpec ident="bookPart" type="model">
  <desc>éléments qui ont la possibilité de figurer dans un <gi>book</gi></desc>
</classSpec>
```

---


# Définition d’une classe de modèle de contenu

Au lieu de lister exhaustivement tous les composants possibles d’un `<book>`, il suffit maintenant de déclarer que cet élément est composé des membres de la classe `bookPart` .

```xml
<elementSpec ident="book">
  <desc>Élément racine d’un schéma simplissime pour encoder les livres</desc>
  <content>
    <classRef key="bookPart" minOccurs="1" maxOccurs="unbounded"></classRef>
  </content>
</elementSpec>
```

(Désormais, lorsque nous découvrirons l’existence de listes dans les livres, nous saurons quoi faire...)

---


# Définition d’une classe d’attribut

Dans le monde réel, il est très probable que plusieurs éléments différents disposent des même attributs&nbsp;: aussi il peut être commode de les définir en une seule fois.

ODD permet de déclarer que tous les éléments ayant en commun un ensemble d’attributs constituent une classe d’attributs, que nous pouvons définir de la manière suivante : 
```xml
<classSpec  ident="pointing" type="atts">
  <desc>regroupe les éléments comportant l’attribut <att>href</att></desc>
  <attList>
    <attDef ident="href">
      <desc>fournit l’URI de l’objet ciblé</desc>
      <datatype>
        <dataRef name="anyURI"/>
      </datatype>
    </attDef>
  </attList>
</classSpec>
```


---


# .red[TP.] Testez votre compréhension

* Ouvrez le fichier `oddex-2.odd` avec oXygen et comparez le avec `oddex-1.odd`

* Créez une nouvelle version du schéma à partir de cet ODD

* Assurez vous que le fichier test `oddex-1-test.xml` reste valide contre cette nouvelle version du schéma

* Examinez l’effet des références aux classes

---


# Contrôle des valeurs d’un attribut

Les valeurs possibles d’un attribut peuvent être contrôlées de plusieurs manières&nbsp;:
* Par référence à un `datatype` (type de donnée) externe, par ex `anyURI ` ou `ID` (ce sont des datatypes standards, définis par le W3C)

* En fournissant notre propre liste des valeurs avec l’élément `<valList>`

* Par référence à un `datatype` (type de donnée) interne défini par un `<dataSpec>` interne à notre ODD


---


# Exemple

```xml
<classSpec ident="bookAtts" type="atts">
  <desc>attributs applicables aux objets contenus par des <gi>book</gi></desc>
  <attList>
    <attDef ident="xml:id">
      <desc>fournit un identifiant unique pour le composant</desc>
      <datatype>
        <dataRef name="ID"/>
      </datatype>
    </attDef>
    <attDef ident="status">
      <desc>indique le statut du composant</desc>
      <valList>
        <valItem ident="red"/>
        <valItem ident="green"/>
        <valItem ident="unknown"/>
      </valList>
    </attDef>
    <attDef ident="version">
      <desc>indique le numéro de version du composant</desc>
      <datatype>
        <dataRef key="teidata.versionNumber"/>
      </datatype>
    </attDef>
  </attList>
</classSpec>
```

---


# .[TP.] Tester votre compréhension…

* Insérez dans votre fichier `oddex-2.odd` la définition d’une deuxieme classe d’attribut (vous trouverez un exemple dans le fichier `oddex-2.xml`)

* Ajoutez un `<memberOf>` à la spécification de l’élément `<para>` pour qu’il participe à cette nouvelle classe

* Générez un schéma et assurez-vous que le fichier `oddex-1-test.xml` reste valide avec cette version du schéma.

* Contrôlez qu’oXygen vous propose ces nouveaux attributs, et qu’il contraint correctement les valeurs possibles

---


# Comment produire une documentation ?

Afin d’améliorer le système, il nous resterait à ajouter de la documentation. Par exemple :
* Des gloses, des descriptions en plusieurs langues

* des exemples d’emploi

* des contraintes plus sophistiquées
* des modèles de contenu plus complexes

* des contraintes variables selon le contexte

Et comme dans tout projet de documentation&nbsp;: nous aurons besoin de pouvoir indiquer la version, les référencements extérieurs et internes, prposer des mappings ontologiques, etc.

---


# Fournir des exemples d’utilisation

Comme on décrit un schéma XML, on va inclure des exemples d’utilsiation en XML. Si la documentation s’exprime également en XML, il faut être astucieux… Il y a trois approches possibles&nbsp;:
* tout cacher avec un "CDATA marked section" (magique, hérité de SGML)

* tout échapper en utilisant des appels d’entité (`&amp;`, `&lt;`, etc.)

* utiliser un autre espace de nommage !


Seule la dernière solutions vous permet de valider vos exemples&nbsp;: ce qui est très avantageux.

---


# Par exemple

- `<![CDATA[<p>un paragraphe</p> ]]> `

- `&amp;lt;p>un paragraphe&amp;lt;/p>`

- `<egXML xmlns="http://www.tei-c.org/ns/examples"> <p>un paragraphe</p> </egXML>`

---


# Définition d’un modèle de contenu

Un élément XML peut contenir...

* Rien du tout

* Seulement du texte sans balise&nbsp;: `<textNode>`

* Des référence(s) à d’autres éléments&nbsp;: `<elementRef>`

* Des référence(s) à des classes d’éléments : `<classRef>`

* Des alternance(s) des précedents : `<alternate>`

* Des séquence(s) des précedents : `<sequence>`

* Et tous ces composants sont répétables... `@minOccurs` et `@maxOccurs`

---


# Notions d’espace de nom

* Un `namespace` (espace de noms) fournit une manière d’associer et de distinguer un groupe de termes, typiquement d’éléments XML.

* Jusqu’à présent, tout ce qui a été nommé dans notre schéma appartient à un namespace "nul".

* Supposons que nous souhaitions ajouter un nouvel élément `<para>` avec un modèle de contenu moins restreint. Ce `<para>` contiendra un mélange de texte et des images, mais nous souhaitons l'appeler un `<para>` quand même. Pour le distinguer du `<para>` existant, il faut donc l’associer à un autre espace de nom.

* L’attribut `@ns` est disponible sur `<elementSpec>` pour préciser un espace de noms. Pour des raisons techniques, il faut aussi spécifier un préfixe unique.

---


# Exemple d’espace de nom

```xml
<elementSpec ident="para" ns="http://myNamespace.org" prefix="extra">
  <desc>une paragraph contenant de text et facultativement des images</desc>
  <classes>
    <memberOf key="bookPart"/>
  </classes>
  <content>
    <alternate maxOccurs="unbounded" minOccurs="0">
      <textNode/>
      <elementRef key="image"/>
    </alternate>
  </content>
</elementSpec>
```

Notez bien que ce nouvel élément fait partie de la classe `bookPart` ; sinon il ne serait pas disponible dans nos documents.

---


# .red[TP.] Tester votre compréhension...

* Chargez le fichier `oddex-3.odd` et générez un schéma comme d’habitude

* Est-ce que le fichier `oddex-1-test.xml` reste valide avec cette version du schéma ?

* Et le fichier `oddex-3-test.xml` ?

* Ajoutez des traductions dans d’autres langues (allemand, russe, italien, anglais...) des descriptions d’éléments

* Modifiez l’élément `<my:para>` pour lui donner les attributs `@xml:id` et `@status`

* Modifiez la définition de l’attribut `@status` pour lui permettre de prendre la valeur `orange`.

* Ajoutez un exemple d’utilisation pour quelques-uns des éléments spécifiés par votre ODD

---


# Un mot sur la TEI

Admettons enfin que notre `<para>` n’est pas si loin de l’élément TEI `<p>`, que notre `<image>` ressemble beaucoup à l’élément TEI `<graphic>`, et que notre `<book>` pourrait être considéré comme un élément TEI `<div>`. Comment ré-écrire ce schéma pour profiter des définitions TEI existantes&nbsp;?

```xml
<schemaSpec start="div" ident="testSchema-2" source="tei:1.6.0">
  <elementRef key="div"/>
  <elementRef key="p"/>
  <elementRef key="graphic"/>
  <elementRef key="figure"/>
  <moduleRef key="tei"/>
</schemaSpec>
```

L’élément `<moduleRef>` nous fournit un ensemble de définitions infrastructurales, notamment pour les classes utilisées partout dans le systeme TEI. À part cela, nous n’avons besoin que de référencer les éléments TEI souhaités avec un `<elementRef>`.

---


# Création d’un schéma TEI

* Chargez le fichier `oddex-tei.odd` avec oXygen et comparez le avec les versions précédentes

* Transformez ce fichier en schéma, comme d’habitude.

* Le fichier `oddex-3-test.xml` contient une version TEI de notre fichier de test initial&nbsp;: validez-le avec le schéma que vous venez de créer.

* Notez qu’un document TEI doit utiliser l’espace de nommage TEI

* Notez également que les concepts TEI et les nôtres ne sont pas forcément identiques (par ex, usage de `<graphic>`)

Plus tard, nous verrons comment la TEI se sert du système ODD…
