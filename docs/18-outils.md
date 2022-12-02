## HNU3052/HNU6052 Humanités numériques : introduction à la TEI

# Quelques outils

---

## 1. Quelques outils pour travailler avec ses données

---

### 1. Quelques outils pour travailler avec ses données
## **CSS** Cascading stylesheets

[https://www.w3.org/Style/CSS/Overview.en.html](https://www.w3.org/Style/CSS/Overview.en.html)

---

### 1. Quelques outils pour travailler avec ses données
## TEI Boilerplate

http://dcl.slis.indiana.edu/teibp/

---

### 1. Quelques outils pour travailler avec ses données
##  TEI stylesheets

Framework de transformations XML-TEI  
Sebastian Rhatz (Oxford)  
https://github.com/TEIC/Stylesheets

---

### 1. Quelques outils pour travailler avec ses données
## OxGarage

WebService (REST) pour transformer des documents.  
Basé sur les TEI Stylesheets

http://oxgarage.oucs.ox.ac.uk:8080/ege-webclient/

???

> OxGarage is a web, and RESTful, service to manage the transformation of documents between a variety of formats. The majority of transformations use the Text Encoding Initiative format as a pivot format. It is a good tool for conversion from TEI to Word (.docx), or Word (.docx) to TEI, but also does many other formats.


---

### 1. Quelques outils pour travailler avec ses données
## CollateX et Juxta

http://collatex.net  
http://www.juxtasoftware.org

---

### 1. Quelques outils pour travailler avec ses données
## TEI ToolBox

[http://ciham-digital.huma-num.fr/teitoolbox/](http://ciham-digital.huma-num.fr/teitoolbox/)

---

### 1. Quelques outils pour travailler avec ses données
## TXM Textométrie

http://textometrie.ens-lyon.fr


???

Née en France dans les années 80, la Textométrie a développé des techniques puissantes et originales pour l’analyse de grands corpus de textes.

Reprenant les acquis de la lexicométrie et de la statistique textuelle, elle propose des outils et des méthodes éprouvés dans de multiples branches des SHS et statistiquement solidement fondés.

TreeTagger pour l’étiquetage morphosyntaxique et la lemmatisation.

---

## 2. Diverses solutions de publication pour la TEI

---

### 2. Diverses solutions de publication pour la TEI
## TEI Publisher

Une application de publication basée sur TEI : [https://teipublisher.com](https://teipublisher.com)

---

### 2. Diverses solutions de publication pour la TEI
## Solutions de publications en environnement LAMP

???

Il n’existe pour le moment pas de CMS (Content Manager System) véritablement dédié à la publication de fichiers XML-TEI. Cela s’explique notamment par le fait que la TEI n’est pas à proprement parler un standard mais qu’elle constitue plutôt un cadre de travail personnalisable en fonctions des besoins particuliers d’un projet de recherche. Les spécificités dans l’encodage des fichiers compliquent, voire rendent impossible, la production de transformations génériques.

Un certain nombre de solutions pour la publication de fichiers TEI sur le web ont cependant été développées dans l’environnement le plus courant, LAMP (Linux, Apache HTTP, MySql, PHP). Compte-tenu de la très large utilisation des CMS (Content Manager System) pour la publication web, plusieurs tentatives ont été mises en place pour faciliter la publication de fichiers TEI à l’aide de ces logiciels.

---

### 2. Diverses solutions de publication pour la TEI
## CETEIcean

[https://github.com/TEIC/CETEIcean](https://github.com/TEIC/CETEIcean)

CEITEIcean est une bibliothèque JavaScript (ES6) qui permet le rendu direct de documents TEI dans le navigateur en utilisant les web components de HTML5.

---

### 2. Diverses solutions de publication pour la TEI
## Omeka + TeiDisplay

[Omeka](http://omeka.org/) est un CMS libre et open source développé par le [Roy Rosenzweig Center for History and New Media](http://chnm.gmu.edu/). Spécialement destiné au secteur patrimonial et culturel, cette solution de publication adopte un grand nombre de standards pour gérer des collections de ressources avec leurs métadonnées (EAD, Dublin Core, utilisation de vocabulaires, etc.). Plusieurs modules qui étendent les fonctionnalités du CMS offrent des outils adaptés au domaine historique et universitaire (frises chronologiques, entrepôt OAI-PMH, etc.).

[TeiDisplay](http://omeka.org/codex/Plugins/TeiDisplay) est une extension (plugin) créée pour publier des fichiers TEI associés à un item Omeka en utilisant une transformation XSLT. La transformation par défaut propose un rendu intégral du texte ou par segment, génère une table des matières, et des métadonnées Dublin Core à partir de l’en-tête TEI du fichier. Plusieurs options de configuration de la transformation sont disponibles par le biais d’une interface d’administration.

???

## Avantages/Inconvénients

S’agissant d’une solution relativement légère et prête à l’emploi, l’utilisation de ce module peut intéresser des projets modestes disposant d’un encodage XML-TEI assez sommaire compatible avec la transformation proposée par défaut. Le contexte d’utilisation est plutôt celui de la publication de collections de ressources patrimoniales et culturelles parmi lesquelles on voudrait facilement publier des sources textuelles. Le programme XSLT peut au besoin être adapté, mais Omeka étant une application PHP, l’utilisation de XSLT est limitée à la version 1.0, ce qui peut considérablement limiter les traitements.

---

### 2. Diverses solutions de publication pour la TEI
## TEICHI (Text Encoding Initiative Computer-Human Interaction) Framework

[Framework TEICHI](http://www.teichi.org)

Le [Framework TEICHI](http://www.teichi.org) est un outil modulaire destiné à présenter des documents encodés avec la [TEI Lite](http://www.tei-c.org/Guidelines/Customization/Lite/) (une personnalisation restreinte de la TEI) comme des pages sur un site fonctionnant avec le CMS (Content Manager System) libre et open source [Drupal](https://drupal.org). Il se compose de quatre modules (TEI Content, TEI Download, TEI Imageviewer, et TEI Search) qui servent ensemble à présenter facilement sur le web des documents encodés en TEI.

C’est une solution bien adaptée pour des projets éditoriaux relativement simples (il ne prend pas en charge le module de critique textuelle de la TEI). Les documents XML-TEI sont gérés dans la base de données de Drupal. Comme ce CMS, le module a été conçu pour des créateurs de contenus sans connaissances techniques particulières. Il est complètement intégré à Drupal.

???

D’autres solutions d’intégration avec Drupal sont brièvement présentées sur le [wiki de la TEI](http://wiki.tei-c.org/index.php/Drupal).

Plus généralement, sur l’utilisation de Drupal pour les humanités, voir ["When Not to Use Drupal", _Drupal for Humanists_](http://drupal.forhumanists.org/book/when-not-use-drupal)

Voir également sur la [liste de discussion TEI](http://tei-l.970651.n3.nabble.com/TEI-amp-Drupal-revisited-td4022207.html)
et [ici](http://listserv.brown.edu/archives/cgi-bin/wa?A2=tei-l;5685b681.1310)

Le projet [DARE project](http://dare.uni-koeln.de/) annonçait il y a quelques mois son intention de publier des modules pour Drupal.

Il est possible d’utiliser le module feeds de Drupal afin de rendre du contenu en XML. Celui-ci permet l’utilisation d’expressions XPath relativement élémentaires. Ici encore, il ne s’agit pas à proprement parler d’utiliser Drupal comme un gestionnaire de contenu mais plutôt comme une simple plate-forme de publication.

---

### 2. Diverses solutions de publication pour la TEI
## Diple

L’École des chartes avait développé pour ses propres besoin une solution logicielle PHP libre et open source pour la publication de documents XML-TEI. Un certain nombre des publications actuelles de l’École sont publiées au moyen de Diple.

Après le départ des deux ingénieurs en charge des développements, le logiciel n’est plus maintenu. L’École des chartes s’oriente actuellement vers un partenariat avec la chaîne éditoriale des Presses universitaires de Caen. Cependant, il est probable que l’application continue d’être développée dans un autre contexte sous un autre nom.

[http://oeuvres.github.io/Teinte/](http://oeuvres.github.io/Teinte/)

---

### 2. Diverses solutions de publication pour la TEI
## Versionning Machine

http://v-machine.org

Cette solution de publication légère est d’abord destinée à des contenus courts qui disposent de plusieurs témoins. La transformation a lieu côté navigateur ou est réalisée avant la publication.

---

### 2. Diverses solutions de publication pour la TEI
## Edition Visualization Technology (EVT)

[https://visualizationtechnology.wordpress.com](https://visualizationtechnology.wordpress.com)

EVT est une solution légère pour la publication d’éditions hyperdiplomatiques.

---

### 2. Diverses solutions de publication pour la TEI
## Getty : Digital Workspace

http://blogs.getty.edu/iris/creating-getty-scholars-workspace-lessons-from-the-digital-humanities-trenches/

Le Getty développe actuellement un projet d’espace de travail numérique dans le cadre du projet Digital Mellini + Montagny.
La plate-forme d’édition paraît relativement rudimentaire et paraît plutôt orientée sur la collaboration entre chercheurs.


---

### 2. Diverses solutions de publication pour la TEI
## Solutions en environnement Java (ou mixte)

???

La plupart des applications XML natives ont été développées en environnement Java. Cela tient notamment au fait que, jusqu’à présent, les processeurs XSLT et XQuery les plus efficaces sont développés en Java. Du point de vue de l’hébergement d’application web, cela peut présenter un certain nombre d’inconvénients car leur déploiement nécessite un conteneur de servlets Java. Un tel environnement de développement web ne correspond pas à l’offre classique LAMP (Linux, Apache HTTP, MySql, PHP ) des hébergeurs de site web. Comme elle peut être coûteuse en ressources elle présente souvent un surcoût non négligeable, par ailleurs, elle peut poser des problèmes de sécurité. En France, la TGIR HumaNum met cependant à disposition des hébergements de ce type dans le cadre de sa grille de service.

---

### 2. Diverses solutions de publication pour la TEI
## Islandora

[Islandora](http://islandora.ca/)

Développé par la Bibliothèque de Robertson de l’université Prince Edward Island, [Islandora](http://islandora.ca/) est un système de gestion de contenu pour le domaine universitaire. C’est une combinaison de Drupal et de Fedora.

Pour la TEI le dispositif permet de traiter des livres avec un certain nombre d’automatisation. Le logiciel dispose d’un module  WYSIWYG (What You See Is What You Get) d’édition des fichiers TEI qui permet la validation contre un schéma RelaxNG. Ce module rédigé en Javascript est configurable.

De nouveaux développements doivent, dans un avenir proche, permettre d’étendre considérablement les fonctionnalités de cet éditeur à la fois pour la TEI et pour l’annotation sémantique avec des balisages externes tant en WYSIWYG qu’en édition directe du code.

---

### 2. Diverses solutions de publication pour la TEI
## CWRC-Writer

[CWRC-Writer](https://sites.google.com/site/cwrcwriterhelp/)

Outil de balisage WYSIWYG : Ce dispositif est plutôt dédié à des projets de grande ampleur. Néanmoins, l’outil WYSIWYG de balisage peut s’avérer intéressant pour ouvrir l’encodage à des contributions de non spécialistes.

---

### 2. Diverses solutions de publication pour la TEI
## Kiln

[Kiln](https://github.com/kcl-ddh/kiln)

[Kiln documentation](http://kiln.readthedocs.org/en/latest/)

Cette solution développée pour la publication des sources du KingsCollege est mise à disposition en open source. Elle est adossée à une base de données XML native et à l’utilisation d’un moteur de recherche Solr. Il n’y a semble-t-il pas vraiment de communauté d’utilisateurs.

---

### 2. Diverses solutions de publication pour la TEI
## TextGrid

[TextGrid](http://www.textgrid.de/)

Framework de publication + Mutualisation

TextGrid est un important framework de publication de sources textuelles développée avec des financements européens. La solution ne semble pas d’une très grande légèreté pour des projets de petite échelle.

---

### 2. Diverses solutions de publication pour la TEI
## Text Text Link Editor

[Text Text Link Editor](https://dev2.dariah.eu/wiki/display/TextGrid/Text+Text+Link+Editor)

---

### 2. Diverses solutions de publication pour la TEI
## Muruca

[Muruca](http://muruca.netseven.it/)

**Solution commerciale**

**Module d’annotation sémantique (the Pund It)**

Muruca est une solution commerciale de publication de sources XML-TEI développée par la Société Seven. Cette suite logicielle est actuellement employée dans le cadre de nombreux projets universitaires, mais elle est assez coûteuse.

---

### 2. Diverses solutions de publication pour la TEI
## Scalable architecture for Digital Editions SADE

[Sade](http://www.bbaw.de/telota/software/sade/)

Basé sur la base de données XML native eXist-db, cette suite logicielle suppose un environnement Java. Elle permet une présentation flexible de divers contenus.

Adapté à plus de contextes éditoriaux que TEICHI, mais pas de fonctionnalités "out-of-the-box". Le logiciel propose un environnement d’annotation et de transcription proche d’un CMS.

---

### 2. Diverses solutions de publication pour la TEI
## TAPAS

[http://tapasproject.org)](http://tapasproject.org)

[TAPAS (TEI Archiving Publishing and Access Service)](http://tapasproject.org) est un projet de plateforme de publication et d’archivage pour la TEI.

Il s’adresse à des projets ne disposant pas de ressources institutionnelles suffisantes pour publier leurs documents TEI. C’est un projet collaboratif et ouvert en cours de réalisation. Le service est accessible aux membres de la TEI

???

L’architecture du service est adossée à Fedora pour l’archivage. L’API semble construite avec la base de données XML native eXist. Le service proposera des bacs à sable pour pouvoir immédiatement publier et visualiser ses données sur le web. Une interface standard de publication sera proposée mais les utilisateurs avancés disposeront de possibilités pour développer leurs propres XSLT et leurs CSS.

---

### 2. Diverses solutions de publication pour la TEI
## eLaborate (Hygens ING)

[eLaborate](http://www.e-laborate.nl/en/)

**Visualisation en panneaux reconfigurables**

[eLaborate](http://www.e-laborate.nl/en/) est une plate-forme web collaborative pour l’édition de manuscrits. Elle propose aux éditeurs une visualisation par panneaux reconfigurables pour visualiser les fac-simili en regard de la transcription, etc. Le même dispositif est utilisé pour la transcription et la publication. L’outil permet la publication simultanée des modifications et des annotations à l’ensemble des utilisateurs.

Le projet devait être déployée sur [Clarin](http://www.clarin.nl) en 2012.
L’accès à la plate-forme est pour le moment réservée aux chercheurs de l’Huygens ING.

Un exemple d’édition réalisée à l’aide de cet outil est disponible [ici](http://martianus.huygensinstituut.knaw.nl/path).

---

## Conclusion

???
Les solutions de publications en environnement LAMP se caractérisent généralement par leur limitation. Celles-ci sont d’abord contraintes par des questions techniques. Les autres suites logicielles développées pour la publication de sources XML-TEI ont le plus généralement été développées en environnement Java. Elles ont le plus souvent été développée dans le cadre de bibliothèques numériques ou d’initiatives d’ampleur nationale. Ces sont habituellement des solutions lourdes qui articulent des composants logiciels nombreux autour d’une base de données XML-native.

Il peut certainement exister une voie médiane entre d’une part les solutions de publication légères en environnement LAMP et ces grandes suites logicielles pour la publication. Il y a quelques années, le framework Cocoon a beaucoup servi à construire de telles applications conçues sur des filières de traitement XSLT. Ce projet est depuis en perte de vitesse et a beaucoup été supplanté par les bases de données XML-natives. Ces bases de données proposent depuis plusieurs années des solutions simples pour construire des applications web à partir de sources XML. Au cours de la conférence Prague XML 2012, Adam Retter a présenté une proposition de normalisation pour des applications REST exprimées au moyen d’annotations XQuery. Ce projet de spécification a depuis été implémenté chez la plupart des fabriquants de base de données XML natives et permet d’envisager des applications portables entre les différents systèmes de base de données.


---

## Orientations bibliographiques

* Boot, Peter. "Some Digital Editions and Some Remaining Challenges." Janus, Estudios sobre el siglo de oro , no. 1 (2012). [http://www.janusdigital.es/articulo.htm?id=7](http://www.janusdigital.es/articulo.htm?id=7)
* Pape, Sebastian, Christof Schöch, and Lutz Wegner. "TEICHI and the Tools Paradox." Journal of the Text Encoding Initiative , no. 2, Selected Papers from the 2010 TEI Conference (2012). [http://jtei.revues.org/432](http://jtei.revues.org/432)
* Stapelfeldt, Kirsta, and Donald Moses. "Islandora and TEI: Current and Emerging Applications/Approaches." Journal of the Text Encoding Initiative , no. 5 (2013). [http://jtei.revues.org/790](http://jtei.revues.org/790)

---

* Beaulieu, Anne, Karina van Dalen-Oskam, and Joris van Zundert. "Between Tradition and Web 2.0 : ELaborate As a Social Experiment in Humanities Scholarship." In Social Software and the Evolution of User Expertise. Edited by Tatjana Takševa. 2013.
* Flanders, Julia, and Scott Hamlin. "TAPAS: Building a TEI Publishing and Repository Service." Journal of the Text Encoding Initiative 5 (2013). [http://jtei.revues.org/788](http://jtei.revues.org/788)
* Roberto Rosselli Del Turco, Giancarlo Buomprisco, Chiara Di Pietro, Julia Kenny, Raffaele Masotti, and Jacopo Pugliese, « Edition Visualization Technology: A Simple Tool to Visualize TEI-based Digital Editions », Journal of the Text Encoding Initiative, n° 8, 2014-2015. http://jtei.revues.org/1077

---

TEI Tools, site de la Text Encoding Initiative, http://www.tei-c.org/Tools/

http://wiki.tei-c.org/index.php/Category:Tools

* The UVic Image Markup Tool Project http://tapor.uvic.ca/~mholmes/image_markup/index.php
* Tile, Text-image linking environment, [http://mith.umd.edu/tile/](http://mith.umd.edu/tile/)
* Philologic, [https://sites.google.com/site/philologic3/](https://sites.google.com/site/philologic3/)
* Ediarum, [http://www.bbaw.de/en/telota/software/ediarum](http://www.bbaw.de/en/telota/software/ediarum)
* Virtual Machine, [http://v-machine.org/samples.php](http://v-machine.org/samples.php)
* The Canadian Writing Research Collaboratory, [http://www.cwrc.ca](http://www.cwrc.ca)
* TextGrid, [http://www.textgrid.de/en/](http://www.textgrid.de/en/)

---

## Orientations (suite)

* Concordance, http://www.concordancesoftware.co.uk
* [http://interedition](http://interedition)-tools.appspot.com
* Brat rapid annotation tool, [http://brat.nlplab.org](http://brat.nlplab.org)
* The Digital Classicist, [http://www.digitalclassicist.org](http://www.digitalclassicist.org) et [https://wiki.digitalclassicist.org/Category](https://wiki.digitalclassicist.org/Category):Tools
* Digital Classics Association, [http://dca.drupalgardens.com](http://dca.drupalgardens.com)
* Philologie à venir, [http://philologia.hypotheses.org](http://philologia.hypotheses.org)
* http://textvis.lnu.se
* http://www.tapor.ca
