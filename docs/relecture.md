# Relecture des fiches pays — plan

Les douze fiches pays d'origine, leurs fiches pratiques, leurs zones de
production et les quatre-vingt-dix dates de fête nationale ont été
**écrites de mémoire** au début du projet. Rien n'a été vérifié depuis.

Ce document dit quoi vérifier, dans quel ordre, et ce qu'on fait d'une
valeur qu'on n'arrive pas à sourcer.

---

## Ce qui a déclenché ce plan

La migration `026` a relu sur sources les dix articles de marque que
`024` et `025` signalaient comme « moins documentés ». **Quatre
affirmations sur dix étaient fausses**, dont deux que rien, dans le
texte, ne présentait comme incertain :

| Ce qui était écrit | Ce qui est vrai |
|---|---|
| Suerdieck, maison vivante | Fermée en 2000 |
| Meerapfel, « première maison camerounaise » | Roule en Rép. dominicaine |
| Matilde, prénom de la femme du fondateur | Elle s'appelle Carmen |
| Alhambra, capital espagnol | Société suisse |

Un taux d'erreur de 40 % sur un échantillon **que j'avais moi-même
signalé comme douteux**. Les fiches pays n'ont jamais été signalées du
tout, ce qui ne veut pas dire qu'elles sont meilleures — seulement
qu'elles n'ont pas été regardées.

---

## La surface à relire

| Objet | Volume | Vérifiable ? |
|---|---|---|
| Fiches pays (12) — `production`, `revenue`, `rev_detail`, `harvest`, `climate`, `soil`, `notes`, `tabacaleras`, `regions`, `varieties` | **178 valeurs**, dont **21 portent un chiffre** | en partie |
| Fiches pratiques (12) — capitale, population, superficie, monnaie, langue, coordonnées, fuseau, PIB, indépendance | **108 valeurs** | oui, sources publiques |
| Zones de production | **37** (nom + coordonnées + note) | noms et lieux oui, notes non |
| Fêtes nationales | **90 dates** (jour, mois, année, type) | oui |
| Coordonnées des 12 pays | 12 couples lat/lon | oui, géométriquement |

Environ **cinq cents affirmations**. Ce n'est pas relisable en une
passe, et ça n'a pas la même valeur partout : d'où le découpage.

---

## Séquencement

### ⚠ Préalable : faire E6 d'abord

**Rien ne relie une traduction à la version du français dont elle est
issue.** Corriger un texte laisse les colonnes `*_en`, `*_es`… remplies
de la traduction de l'ANCIENNE version, et `i18n_lot.php --reste` les
compte comme complètes : le compteur affiche 100 % et la fiche traduite
dit autre chose que la fiche française.

C'est arrivé pour de vrai avec `026` — dix articles corrigés, dix
traductions devenues fausses et invisibles, colonnes vidées à la main.

Une relecture qui corrige cinq cents valeurs sans ce garde-fou
produirait le même silence, cinquante fois. **E6 avant tout le reste.**

---

### ~~Lot 0 — Reboucler l'audit géométrique~~ ✅ **fait**

L'audit E4 a testé 152 points en 2023 et corrigé deux erreurs (Israël,
Semi Vuelta). Il n'a **laissé aucun outil** : la migration `027` a
ajouté trois pays et quatre zones que personne n'a vérifiés.

- Écrire `tools/coords_check.php` : chaque point tombe-t-il dans le pays
  qu'il prétend désigner ? Les contours viennent déjà du front
  (`assets/data/countries-110m.json`, cf. E3)
- Le brancher sur `tests/run.php` pour qu'il ne rouille plus
- Passer les 15 pays, les 41 zones, les 92 pays à lounges, les 10 marchés

**Pourquoi en premier** : c'est mécanique, ça ne demande aucune source
extérieure, et ça referme une régression déjà installée.

---

### Lot 1 — Les 21 valeurs chiffrées des fiches pays · M

Les plus risquées : ce sont des affirmations vérifiables, et fausses
elles décrédibilisent tout le reste.

- « ~90M cigares/an », « $500M d'exportations annuelles », « ~400M
  cigares/an », « 1er exportateur mondial en valeur »…
- Source de référence à fixer AVANT de commencer : rapports Habanos
  S.A. pour Cuba, statistiques d'exportation nationales ailleurs
- **Règle** : une valeur qu'on ne source pas est **retirée**, pas
  conservée avec un astérisque. C'est ce qu'a fait `027` pour les trois
  nouveaux pays — ils n'ont ni revenus ni volumes plutôt que des
  chiffres inventés

---

### Lot 2 — Les 108 valeurs des fiches pratiques · M

Capitale, population, superficie, monnaie, langue, fuseau, PIB, année
d'indépendance. Mécaniquement vérifiables, une seule source suffit pour
la plupart.

- Attention aux valeurs **datées** : « $100B (2022) » vieillit. Décider
  si on met à jour ou si on retire l'année
- Cas particuliers déjà connus : les Canaries n'ont pas de PIB propre ni
  d'indépendance (`027` y a mis « Communauté autonome d'Espagne »), les
  États-Unis ont plusieurs fuseaux

---

### ~~Lot 3 — Les 90 fêtes nationales~~ ✅ **fait — 2 erreurs sur 90**

Jour, mois, année, et le type (`i` = indépendance, `n` = fête
nationale). Le type se trompe facilement : la fête nationale française
n'est pas une indépendance, celle de l'Autriche est une déclaration de
neutralité.

- Vérifiables une par une
- Le fichier est déjà commenté pays par pays (`data.fetes.js`), ce qui
  rend la relecture rapide

**Résultat** : 88 des 90 entrées confrontées à une source, **deux
erreurs**. Le Koweït célébrait une fête nationale prise pour une
indépendance ; la Croatie avait changé de date en 2020 sans que la
mémoire le sache. Quatre pays où deux dates se disputent le titre
(Burkina Faso, Inde, Maroc, Corée du Sud) sont désormais documentés
plutôt qu'arbitrés en silence.

**Deux fausses alertes méritent d'être retenues pour les lots suivants.**
Des synthèses de sources secondaires ont poussé à « corriger » le Pérou
et le Paraguay, dont les entrées étaient justes. Un résumé de moteur de
recherche n'est pas une source : il faut remonter à la page qui tranche,
sinon la relecture introduit autant d'erreurs qu'elle en retire.

---

### Lot 4 — Les 37 zones de production · M

- **Noms et emplacements** : vérifiables (Vuelta Abajo, Jamastran,
  Estelí, San Andrés Tuxtla…). Le lot 0 aura déjà validé la géométrie
- **Notes** : éditoriales. « Meilleure terre à tabac au monde » n'est
  pas un fait, c'est une opinion — à garder ou à reformuler, pas à
  sourcer

---

### Lot 5 — La prose · G

Les 157 valeurs restantes : `climate`, `soil`, `notes`, `tabacaleras`,
`regions`, `varieties`.

Elles ne se vérifient pas ligne à ligne. Ce qu'on cherche ici est
différent : **repérer les endroits où la prose affirme un fait précis**
— une date, un rang mondial, une paternité — et traiter ces
affirmations-là comme le lot 1.

Exemple typique : « Premier producteur mondial en volume » pour le
Nicaragua, ou « Mata Fina — meilleur wrapper Maduro du monde » pour le
Brésil. Le second est une opinion assumée ; le premier est une
affirmation qui se vérifie.

---

## Ce qu'on fait d'une valeur non sourcée

**On la retire.** Pas de valeur marquée « à vérifier » qui resterait
affichée : le visiteur ne voit pas nos astérisques, et une donnée
douteuse publiée vaut une donnée fausse.

C'est la règle appliquée par `027` aux trois nouveaux pays, et elle a
un effet secondaire utile : une fiche visiblement incomplète appelle la
contribution, alors qu'une fiche pleine de chiffres inventés ferme le
sujet.

---

## Coût et ordre conseillé

| Lot | Effort | Dépendance |
|---|---|---|
| E6 (garde-fou traductions) | P | — |
| 0 — audit géométrique + outil | P | — |
| 1 — 21 chiffres des fiches pays | M | E6 |
| 3 — 90 fêtes nationales | M | — (pas de traduction) |
| 2 — 108 valeurs des fiches pratiques | M | E6 |
| 4 — 37 zones | M | E6, lot 0 |
| 5 — la prose | G | E6 |

**Les lots 0 et 3 ne dépendent de rien** et peuvent partir tout de
suite. Le reste attend E6, sous peine de laisser derrière soi des
traductions périmées que rien ne signale.

---

## Une question à trancher avant de commencer

Faut-il **publier** avant d'avoir relu ?

Le contenu actuel est plausible et bien écrit ; il est aussi
invérifié à hauteur d'un tiers d'erreurs constatées sur l'échantillon
qu'on a testé. Deux positions défendables :

- **Relire d'abord.** Un atlas qui se trompe sur le PIB du Honduras
  perd la confiance qu'il demande sur le reste
- **Publier et corriger.** Le site n'est pas une encyclopédie, et une
  fiche pays sert surtout de contexte autour des marques et des
  établissements — qui, eux, ont été relus

Ce n'est pas une décision technique. Elle se prend avec l'avis
juridique déjà en attente (loi Évin) et la décision sur la modération.
