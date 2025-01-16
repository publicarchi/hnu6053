# Documentation bimodale (prose + diapositives)

À partir d'un document HTML bien balisé, on peut produire une présentation sous forme de diapositives qui suit la logique du texte (et non celle du diaporama).

## Outils et bibliothèques

- [reveal.js](https://revealjs.com/) : bibliothèque ubiquitaire pour produire des présentations dans le navigateur.

## Rédaction

Les diapositives sont indiquées par des balises à même la prose à l’aide de l’attribut `data-diapositive`.

```html
<div data-diapositive="">
  <p>Ce paragraphe se retrouvera dans une diapositive</p>
</div>
```

Certains contenus devraient figurer _exclusivment_ dans le diaporama.
On donnera donc une valeur `seulement` à l’attribut `data-diapositive` `seulement`.

```html
<div data-diapositive="seulement">
  <p>Ce paragraphe sera invisible dans la prose, mais apparaîtra dans le diaporama.</p>
</div>
```

Chaque élément diapositive peut comporter l’ensemble des options reveal.js sous forme d’attributs.a

```html
<!-- Une diapositive au fond noir qui présente une image en plein écran -->
<div data-diapositive="seulement" data-background-color="#000" data-background-image="cite-radieuse-marseille.jpg" data-background-size="contain"></div>

<!-- Une diapositive avec l'une des couleurs du thème -->
<section data-diapositive="seulement" data-background-color="var(--bleu-royal)">Une autre diapo</section>
```

## Feuilles de style CSS

La division des styles se fait selon des pratiques rigoureuses, tout en ayant recours au moins d'outillage externe que possible (transpilateur SASS, plugins postCSS, etc.).

<details>
<summary><strong>Précisions sur l’écriture des styles</strong></summary>

### Styles généraux

Il y a très peu de styles généraux.

Contairement aux styles modulaires des composants, il faut charger les feuilles de styles généraux en premier.
L'ordre des styles subséquents n'a pas d'importance.

- `reset.css`: aussi connu sous les noms de "normalize" ou "preflight", il s'agit de remettre certains styles à zéro pour s'assurer d'une certaine uniformité d'un navigateur à l'autre, mais aussi lors de la rédaction de nouveaux composants. Ce fichier devrait contenir aussi peu de règles que possibles.
- `variables.css`: les variables CSS globales auxquelles on aura recours dans l'ensemble du projet, comme les couleurs, les familles typographiques, etc. On pourra d'ailleurs y spécifier des variables globales en fonction de caractéristiques du média (`ex. @media (prefers-color-scheme: dark)`, `@media print`, etc.).
- `global.css`: les styles globaux qui sont absolument nécessaires, comme le réglage de la couleur de la mise en surbrillance du texte du document. À moins de très rares exceptions, ce fichier ne devrait contenir aucune règle. Chaque règle doit y être justifiée en commentaire.

### Composants

Les composants adhèrent à la méthodologie [BEM CSS](https://getbem.com/), ce qui garantit la modularité des blocs, dont le changement ou le retrait n'affecte pas les styles des autres composants.

Chaque composant est réputé **autonome**: il ne doit pas être affecté par des styles globaux (autres que les règles du `reset.css`) ni ne devrait dépendre d'autres composantes.
Cela permet de garantir une certaine prévisibilité ou cohérence à travers l'ensemble du projet et surtout de réduire les effets de bord (_side effects_) liés à l'introduction de nouveaux styles.

Exemples:

- `bloc`: un bloc est une **unité autonome**. On l'appelle aussi un composant (_component_).
  - `bloc--variante`: deux traits d'union indiquent une variante. Sur un élément, on doit combiner les deux classes (ex. `class="bloc bloc--variante"`). 
- `bloc__enfant`: un élément enfant d'un bloc autonome. Cet élément est semi-autonome: il n'implique pas une hiérarchie précise (il n'est pas forcément le descendant direct du parent), mais on ne devrait jamais le retrouver en dehors de son bloc parent.
  - `bloc__fille-ou-garcon`: les noms d'enfants peuvent être composés avec des traits d'union simples (non consécutifs).
  - `bloc__enfant--variante`: deux traits d'union indiquent une variante. Sur un élément, on doit combiner les deux classes, la base et sa variante (ex. `class="bloc__enfant bloc__enfant--variante"`).
- `bloc__enfant__petit-enfant`: les éléments enfants peuvent avoir des petits-enfants lorsque qu'une telle hiérarchie est explicitement nécessaire. On évitera néanmoins d'y recourir le plus possible. Ne pas créer d'hiérarchies de plus de 3 générations.

### Rédaction des règles d'un composant

```css
.bloc {
  /*
  * 0. Variables
  * Les variables auxquelles un composant recourt sont déclarées au début.
  * Les variables globales y sont également exposées.
  * Les variables du composant sont préfixées d'un nom logique pour faciliter
  * la lecture contextuelle des variables.
  */
  --bloc-text-color: #0a0a0a;
  --bloc-background-color: #d2d2d2;

  /*
   * 1. Taille et positionnement
   * Les règles liées à la taille, au positionnement et à la disposition
   * (espacement, marge, disposition sous forme de bloc, flex, etc.)
   * sont toujours déclarées *avant* les propriétés plus cosmétiques.
   */
   margin-block: 1.5rem;
   padding: .25rem;
   display: flex;
   flex-direction: column;
   gap: .5rem;

   /*
    * 2. Propriétés cosmétiques
    * Les propriétés liées à la couleur, au text et aux bordures (etc.)
    * sont énoncées après les règles liées à la taille et au positionnement.
    * Cela ne signifie pas qu'elles sont moins importantes, mais que leurs
    * implications sont différentes (taille de la boîte, interaction spatiale
    * avec les autres éléments sur la page...).
    * 
    * On y spécifiera aussi, en tout dernier, les effets d'animation, comme les
    * propriétés de transition. Celles-ci sont sont souvent combinées avec un
    * autre état, ex. `:hover`, ou une autre classe, ex. `.is-active`.
    */
    color: var(--bloc-text-color);
    background-color: var(--bloc-background-color);
    border-radius: .35rem;
    /* Effets d'animation et de transition */
    transition: background-color .25s;
}
.bloc:hover {
  /*
   * On préférera changer les variables (déclarées ou exposées dans les règles du bloc)
   * plutôt que de répéter les propriétés elles-mêmes.
   */
  --bloc-background-color: #f1f1f1; /* utilisé dans la déclaration du bloc */
}
```

</details>

---

Louis-Olivier Brassard <louis-olivier.brassard@umontreal.ca>
