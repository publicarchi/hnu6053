title: HTML en abrégé
description: Emmanuel Château-Dutier,
theme: theme/remark-dark-em.css
name: inverse
layout: true
class: inverse

---
template: inverse
class: center middle
name: index

# HTML en abrégé

### HNU3053/HNU6053 Humanités numériques : Utilisation avancée de la TEI

---
layout: false

## Introduction

???

L’exercice que nous allons réaliser consiste en la conversion d’un document XML-TEI en HTML. Voici une présentation rapide du langage de balisage HTML qui, maintenant que vous êtes familiers avec XML, ne devrait pas poser trop de difficultés.

---

## Historique du langage

HyperText Markup Language (HTML)

- Type MIME : `text/html`
- Extension : `.html`
- 1989, 1993
- HTML 3.0 (1995), HTML 3.2 (1997), HTML 4.0 (1997)
- XHTML 1.0 (2000)
- norme [ISO/IEC 15445:2000](ISO/IEC 15445:2000)
- [HTML5](https://html.spec.whatwg.org/multipage/) (WHATWG)

Basé sur Standard Generalized Markup Language (SGML)

https://html.spec.whatwg.org

???

De 1990 à 1995, le langage de balisage hypertextuel HTML a fait l’objet de plusieurs révisions et d’extensions sous la responsabilité du CERN puis de l’IETF.

Lors de sa création le World Wide Web consortium récupère la spécification de HTML. Une tentative de révision sous le nom de HTML 3.0 est avortée en 1995. Un approche plus pragmatique débouche en 1997 avec HTML 3.2 bientôt suivie de HTML 4.0.

L’année suivante le W3C engage le travail sur une sérialisation XML de HTML 4.0 qui est publiée sous le nom de XHTML 1.0 en 2000. Débute ensuite un travail sur XHTML2. 

1998, publication du DOM Level 1, puis DOM Level 2 en 2003, et DOM Level 3 en 2004 par les éditeurs de logiciels.

2003, publication de XForms. 2004, début du travail sur HTML5. Plusieurs acteurs s’opposèrent à ces évolutions en raison de leur non rétrocompatibilité. Peu après, Apple, Mozilla, and Opera décidèrent de collaborer sous la houlette du WHATWG. 2006, manifeste un intérêt pour travailler sur HTML5 et publient une spécification sous copyright. 

Travail paralèle jusqu’en 2011. 2019 accord du W3C version unique de la spécification.

> HTML is the World Wide Web's core markup language. Originally, HTML was primarily designed as a language for semantically describing scientific documents. Its general design, however, has enabled it to be adapted, over the subsequent years, to describe a number of other types of documents and even applications.

---

## Structure de base

```html
<!DOCTYPE html>
<html lang="en">
 <head>
  <title>Sample page</title>
 </head>
 <body>
  <h1>Sample page</h1>
  <p>This is a <a href="demo.html">simple</a> sample.</p>
  <!-- this is a comment -->
 </body>
</html>
```

---

## Sections

- [`body`](https://html.spec.whatwg.org/#the-body-element) corps de page
- [`header`](https://html.spec.whatwg.org/#the-header-element) entête
- [`nav`](https://html.spec.whatwg.org/#the-nav-element) navigation
- [`footer`](https://html.spec.whatwg.org/#the-footer-element) pied de page
- [`section`](https://html.spec.whatwg.org/#the-section-element) section
- [`article`](https://html.spec.whatwg.org/#the-article-element) article
- [`aside`](https://html.spec.whatwg.org/#the-aside-element) contenu à côté d’un article
- [`h1`, `h2`, `h3`, `h4`, `h5`, et `h6`](https://html.spec.whatwg.org/#the-h1,-h2,-h3,-h4,-h5,-and-h6-elements) titres

---

## Groupement de contenus

- [`main`](https://html.spec.whatwg.org/#the-main-element) contenu principal
- [`div`](https://html.spec.whatwg.org/#the-div-element) division
- [`p`](https://html.spec.whatwg.org/#the-p-element) paragraphes
- [`pre`](https://html.spec.whatwg.org/#the-pre-element) contenu formaté
- [`blockquote`](https://html.spec.whatwg.org/#the-blockquote-element) block de citation
- [`ol`](https://html.spec.whatwg.org/#the-ol-element) liste ordonnée
- [`ul`](https://html.spec.whatwg.org/#the-ul-element) liste non numérotée
- [`li`](https://html.spec.whatwg.org/#the-li-element) item de liste
- [`figure`](https://html.spec.whatwg.org/#the-figure-element) figure

???

https://developer.mozilla.org/en-US/blog/aria-accessibility-html-landmark-roles/

---

## Sémantiques textuelle

- [`em`](https://html.spec.whatwg.org/#the-em-element) mise en exergue
- [`strong`](https://html.spec.whatwg.org/#the-strong-element) accentuation
- [`span`](https://html.spec.whatwg.org/#the-span-element) segment
- [`br`](https://html.spec.whatwg.org/#the-br-element) saut de ligne
- [`sub` et `sup`](https://html.spec.whatwg.org/#the-sub-and-sup-elements) indices et exposants
- [`u`](https://html.spec.whatwg.org/#the-u-element)
- [`mark`](https://html.spec.whatwg.org/#the-mark-element) markage

Modifications

- [`ins`](https://html.spec.whatwg.org/#the-ins-element) insertions
- [`del`](https://html.spec.whatwg.org/#the-del-element) supressions

---

```html
<p>I am <em>glad</em> you weren't <em>late</em>.</p>
```



---

## Ancres

[`a`](https://html.spec.whatwg.org/#the-a-element) ancre

```html
<a href="url">ancre</a>
```

## Contenus embarqués

1. [`source`](https://html.spec.whatwg.org/#the-source-element)
2. [`img`](https://html.spec.whatwg.org/#the-img-element) image

---

```html
<a
    href="https://www.mozilla.org/en-US/"
    title="The best place to find more information about Mozilla's mission and how to contribute">
    the Mozilla homepage</a>.
```



```html
<a href="https://developer.mozilla.org/en-US/">
  <img src="mdn_logo.svg" alt="MDN Web Docs" />
</a>
```



---

## Références 

[HTML : HypeText Markup Language, Mozilla](https://developer.mozilla.org/en-US/docs/Web/HTML)

