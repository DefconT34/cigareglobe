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

### ~~⚠ Préalable : faire E6 d'abord~~ ✅ **fait**

**Rien ne relie une traduction à la version du français dont elle est
issue.** Corriger un texte laisse les colonnes `*_en`, `*_es`… remplies
de la traduction de l'ANCIENNE version, et `i18n_lot.php --reste` les
compte comme complètes : le compteur affiche 100 % et la fiche traduite
dit autre chose que la fiche française.

C'est arrivé pour de vrai avec `026` — dix articles corrigés, dix
traductions devenues fausses et invisibles, colonnes vidées à la main.

Une relecture qui corrige cinq cents valeurs sans ce garde-fou
produirait le même silence, cinquante fois.

**C'est fait** — et la surprise est que l'instrument existait depuis la
migration `009` : `translation_status` stocke déjà l'empreinte du
français, `i18n_fraicheur.php` sait la comparer. Il sortait toujours en
`0`, donc rien ne pouvait s'en servir et personne ne le lançait. Il a
désormais un code de sortie et `tests/run.php` l'appelle.

Les lots suivants peuvent donc corriger le français sans laisser
derrière eux des traductions périmées : la campagne les signalera.

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

### ~~Lot 1 — Les 21 valeurs chiffrées des fiches pays~~ ✅ **fait — migration `028`**

Les plus risquées : ce sont des affirmations vérifiables, et fausses
elles décrédibilisent tout le reste.

**Résultat : 4 valeurs sur 21 ont pu être sourcées, 17 sont tombées.**

| | Ce qui était écrit | Ce qui est vrai |
|---|---|---|
| Cuba | $500M d'exportations | **827 M$** de CA Habanos (2024, communiqué officiel) — et ce ne sont pas des « exportations » |
| Rép. dom. | ~400M cigares/an | **181 M** roulés main exportés (2024, Intabaco) |
| Nicaragua | ~350M cigares/an, $850M | **253 M** vers les USA (2024, CAA) ; **368 M$** (COMTRADE, USA seuls) |
| Honduras | ~80M cigares/an | **67 M** vers les USA (2024, CAA) |

Les huit autres montants (Brésil, Cameroun, Équateur, États-Unis,
Indonésie, Mexique, Panama, Philippines) n'ont **aucune** statistique
publique derrière eux : ce sont des vendeurs de feuille ou des
productions trop petites pour être recensées. Retirés. Idem pour le
rang « 1er fournisseur mondial wrapper » de l'Équateur, pour les deux
altitudes de sol, et pour le « 1er mondial » dominicain.

**Trois choses apprises, qui valent pour les lots suivants :**

1. **Le chiffre juste peut porter le mauvais intitulé.** Les 827 M$
   cubains sont le chiffre d'affaires mondial d'un distributeur, pas
   des exportations. Corriger la valeur sans corriger le libellé aurait
   laissé une erreur en place.
2. **Une source honnête peut induire en erreur par son périmètre.** Les
   368 M$ nicaraguayens mêlent cigares et cigarettes et ne couvrent
   qu'une destination. Mis côte à côte avec les 1,34 Md$ dominicains,
   ils suggèrent un classement qui n'existe pas — d'où le périmètre
   écrit dans le détail, juste sous le montant.
3. **`revenue` n'a pas de colonnes traduites.** Y écrire « Non publié »
   aurait affiché du français aux cinq autres langues. La colonne passe
   à `NULL`, le panneau rend « — », et `rev_detail` — traduit, lui —
   porte l'explication. Les trois mentions laissées par `027` dans le
   même angle mort sont parties avec.

**Le garde-fou E6 a servi pour de vrai** : les 20 textes français
corrigés ont rendu 100 traductions périmées, la campagne les a
signalées, elles ont été refaites et rescellées. C'est précisément le
silence que le lot précédent devait supprimer.

**Et le lot a buté sur un neuvième silence, du même genre que les huit
précédents.** Le point 2 ci-dessus supposait que le périmètre s'affiche
sous le montant. Il ne s'affichait pas : `panels.js` lisait
`c.revDetail` alors que l'API sert `rev_detail`. Un champ rempli sur
quinze pays, traduit en six langues, sauvegardé dans `traductions.sql`,
contrôlé par la campagne de fraîcheur — et rendu nulle part. Aucun test
ne le couvrait, parce qu'un sous-titre facultatif qui reste vide ne
ressemble pas à une panne.

**Leçon pour les lots suivants** : vérifier que le champ qu'on corrige
arrive à l'écran, pas seulement qu'il arrive en base. Les deux ne se
déduisent pas l'un de l'autre.

---

### ~~Lot 2 — Les valeurs des fiches pratiques~~ ✅ **fait — migration `029`**

Le plan annonçait 108 valeurs pour douze pays. `027` en a ajouté
trois : **135 valeurs**, neuf champs sur quinze pays.

**45 d'entre elles ne sont jamais affichées.** Devise, langue et fuseau
sont remplacés par `Intl`, qui les nomme dans la langue du visiteur ;
`data.pays.js` couvrant les quinze pays, la valeur de la base ne peut
se déclencher pour aucun. Les relire aurait été vérifier ce que
personne ne lit — c'est la leçon du lot 1 appliquée en amont.

**Sur les 90 restantes :**

| Ce qui était écrit | Ce qui est vrai |
|---|---|
| 14 PIB marqués « (2022) » | **14 périmés sur 14** — Mexique `$1.3T` pour 1,83 T$, Nicaragua `$15B` pour 22,2 Md$, Honduras `$28B` pour 39,6 Md$ |
| 14 populations sans année | fausses dans les deux sens — Brésil 215 M pour 212,8 M, Rép. dom. 10,8 M pour 11,5 M |
| Philippines `343 448 km²` | **300 000 km²** (298 170 de terres, 1 830 d'eaux) |
| Cuba « Indépendance 1902 » | vrai, mais la même fiche affiche « fête nationale du 10 octobre 1868 » |
| `coords` = la capitale | le marqueur est le **centre du pays** — 18,7° d'écart aux États-Unis |
| Panama « Panama City » | en anglais au milieu d'une colonne française |

**Ce qui a été fait plutôt que corrigé.** Réécrire quatorze PIB à la
main aurait donné rendez-vous à la même panne en 2029. Ils sont
désormais tenus par `tools/geo_banquemondiale.php`, qui les tire de
l'API de la Banque mondiale — JSON, par pays, l'année attachée à chaque
point. Son `--verifier` tourne **hors ligne** dans la campagne et
échoue si une valeur n'annonce pas son année ou passe les trois ans.
Une campagne ne doit pas dépendre du réseau.

Cuba est dispensé nommément : la Banque mondiale n'a plus rien après
2020. La différence entre « on n'a pas regardé depuis quatre ans » et
« personne ne publie » doit être écrite quelque part, sinon la première
se déguise en seconde.

**Et une valeur qu'on peut dériver ne se stocke pas.** La colonne
`coords` est supprimée : `panels.js` met en forme `lat`/`lon`. La
position affichée, le marqueur, la distance au visiteur et l'audit du
lot 0 désignent maintenant le même point. Le pire n'était pas l'écart
mais son voisinage — la fiche américaine affichait une coordonnée et,
collée contre elle, une distance mesurée depuis un autre endroit.

*(Le repli qui servait quand `coords` manquait écrivait « °N » et
« °O » en dur : il plaçait le Brésil dans l'hémisphère nord et
l'Indonésie à l'ouest de Greenwich. Il ne s'était jamais déclenché.)*

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

### ~~Lot 4 — Les zones de production~~ ✅ **fait — migration `030`**

Elles étaient 41, pas 37 : `027` en avait ajouté quatre.

**Ce lot montre la limite du lot 0.** Les trois zones camerounaises
tombaient toutes dans le Cameroun — `coords_check.php` les validait
donc sans broncher — et toutes les trois étaient à cinq cents
kilomètres de l'endroit où pousse la cape. *Un point peut être dans le
bon pays et au mauvais endroit, et aucune vérification automatique ne
dira jamais cela.*

| Ce qui était écrit | Ce qui est vrai |
|---|---|
| Cameroun : Mont Cameroun, Mungo, Wouri | la côte volcanique de Douala. La cape pousse **à l'Est, autour de Batouri**, en plein soleil, sur des terres sans engrais — rien de volcanique |
| Rép. dom. : La Romana, « Plantation Arturo Fuente » | **Tabacalera de García** (1971), la plus grande du pays. Fuente est à Santiago, 200 km plus loin |
| Indonésie : Lombok | du **Virginia pour cigarettes**. Le troisième centre du tabac à cigare est **Klaten**, à Java Centre |
| Nicaragua : Condega, « haute altitude » | **560 m — la plus basse des trois vallées**, Estelí étant à 844 m. Son sol rocailleux donne une feuille plus fine |

**Deux zones ont été retirées plutôt que déplacées au jugé.** Batouri
est le seul lieu camerounais que les sources nomment ; Mungo et Wouri
ne sont pas des régions à tabac. Trente-neuf zones valent mieux que
quarante et une dont deux inventées.

**L'erreur camerounaise débordait sur la fiche pays** : `soil` disait
« volcanique », `regions` listait les trois lieux faux, et `varieties`
annonçait un « Cameroon Shade » pour un tabac de plein soleil. Corrigés
avec, comme l'altitude du Panama au lot 1 — laisser la contradiction
sur la même fiche n'aurait eu aucun sens.

**Les opinions restent des opinions.** Quatre notes énonçaient un
superlatif au présent de l'indicatif, ce qui les faisait lire comme des
mesures : « Meilleure terre à tabac au monde » est devenu « la terre à
tabac la plus réputée au monde ». La réputation est vraie ; le
classement n'existe pas.

Et deux mots d'anglais sont partis — « Jamastran Valley »,
« Microclimate » — comme « Panama City » au lot 2.

---

### ~~Lot 5 — La prose~~ ✅ **fait — migration `031`**

162 valeurs : `climate`, `soil`, `harvest`, `notes`, et les trois
listes `tabacaleras`, `regions`, `varieties`.

#### La moitié des défauts venait des lots précédents

C'est la découverte de ce lot, et elle est inconfortable. **Sept
affirmations retirées ou corrigées en R1 et R4 avaient survécu ici**,
dans un autre champ de la même fiche :

| Corrigé en | Où ça a survécu |
|---|---|
| « Premier exportateur mondial en valeur » retiré de `rev_detail` (`028`) | vivait toujours dans `notes`, quinze lignes plus bas |
| « Lombok » retiré des zones (`030`) — c'est du Virginia pour cigarettes | restait dans `regions` **et** dans `varieties` |
| « Jamastran Valley » francisé en zone (`030`) | pas dans `regions` |
| Superlatifs des notes de zone reformulés (`030`) | intacts dans les notes de pays |

**Une correction ne suit pas la donnée : elle suit le champ.** Tant
qu'un même fait est écrit à trois endroits, le corriger une fois n'en
corrige qu'un tiers — et les deux autres continuent de s'afficher sur
la même page. Rien ne pouvait le voir : chaque champ était juste
vis-à-vis de lui-même.

`tools/coherence_check.php` regarde désormais ce qui doit concorder
**entre** les champs : la liste `regions` contre les zones réellement
posées sur le globe, et le retour des rangs mondiaux non sourcés.
Vérifié en cassant volontairement les deux garde-fous.

#### Trois erreurs de fait inédites

| Ce qui était écrit | Ce qui est vrai |
|---|---|
| Cuba, « Sol volcanique rouge » | débris **calcaires** érodés et limons du Quaternaire. Rouges et ferrugineux, d'où la confusion — mais Cuba n'a pratiquement pas de volcanisme |
| Cameroun, « BAT Cameroun » | un **cigarettier**. La cape a été tenue par le monopole **SEITA** jusqu'en 1993 et est négociée depuis 120 ans par **M. Meerapfel & Söhne** |
| Philippines, « Burley · Virginia » | des tabacs à **cigarettes** — exactement la faute de Lombok au lot 4 |

Et le Brésil listait **Suerdieck** parmi ses producteurs actuels alors
que la migration `026` avait déjà établi sa fermeture en 2000. La
maison reste nommée — elle compte dans l'histoire du Mata Fina — mais
datée.

#### Les opinions restent des opinions

Cinq superlatifs énoncés au présent de l'indicatif se lisaient comme
des mesures. Le plan citait « Mata Fina — meilleur wrapper Maduro du
monde » comme l'exemple type de l'opinion assumée : elle est conservée,
mais elle s'annonce désormais comme telle.

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
| ~~E6 (garde-fou traductions)~~ ✅ | P | — |
| ~~0 — audit géométrique + outil~~ ✅ | P | — |
| ~~1 — 21 chiffres des fiches pays~~ ✅ | M | E6 |
| ~~3 — 90 fêtes nationales~~ ✅ | M | — (pas de traduction) |
| ~~2 — les fiches pratiques~~ ✅ | M | E6 |
| ~~4 — les zones~~ ✅ | M | E6, lot 0 |
| ~~5 — la prose~~ ✅ | G | E6 |

### ~~Reprise — les 45 valeurs écartées du lot 2~~ ✅ **fait — migration `032`**

Le lot 2 avait délibérément **non** relu devise, langue et fuseau des
quinze pays : `Intl` les remplace toujours à l'écran. Elles restent
pourtant le repli d'un seizième pays qui manquerait à `data.pays.js`,
et c'est à ce titre qu'elles ont été reprises.

**Quarante et une sur quarante-cinq étaient justes** — le meilleur taux
de toute la relecture, et c'est logique : une devise et un fuseau
bougent rarement, là où un PIB vieillit tout seul. Quatre défauts de
forme (Panama sans code ISO, « Córdoba oro » pour le córdoba,
« Fr./Anglais » abrégé, Brésil et Mexique annonçant un fuseau unique
alors qu'ils sont dans `PAYS_MULTIFUSEAUX`).

#### Mais le vrai défaut n'était pas dans la base

**`producer_geo` avait raison et l'écran avait tort** — l'inverse de ce
qu'on cherchait.

`data.pays.js` est indexé par code ISO, et ce code est **déduit du
drapeau**. Les Canaries arborent 🇪🇸 : leur fiche héritait de toute la
ligne espagnole, fuseau compris, et affichait **l'heure de Madrid —
une heure de trop toute l'année**, l'archipel étant à UTC+0 quand la
péninsule est à UTC+1. La base disait « UTC+0 », c'est-à-dire juste, et
ce repli juste ne pouvait pas se déclencher.

Corrigé par `TERRITOIRES_INFOS`, indexé par identifiant de fiche —
puisque c'est justement le drapeau qui ne discrimine pas.
`coherence_check.php` compare désormais les deux copies, code ISO
contre code ISO et décalage contre décalage standard.

**Une leçon de méthode sur le contrôle lui-même.** Sa première version
acceptait le décalage d'hiver *ou* celui d'été, pour ne pas faire
échouer Cuba six mois par an. La contre-épreuve l'a démasquée : « UTC+1 »
injecté sur les Canaries passait sans bruit, puisque c'est leur heure
d'été. **Un contrôle qui accepte les deux réponses ne vérifie rien.**
Il lit maintenant le drapeau `isdst` des transitions IANA.

### ~~Reprise — les 78 autres pays de `data.pays.js`~~ ✅ **fait**

Le fichier porte depuis sa création la mention « **À RELIRE, saisi de
mémoire** » et couvre 93 pays — les quinze producteurs et les 78 qui
servent les fiches d'établissements.

**Les relire un par un aurait refait l'erreur qu'on corrige.** PHP
embarque les deux sources de référence : **tzdata** pour les fuseaux,
**ICU/CLDR** pour les devises. 234 valeurs confrontées mécaniquement à
une autorité plutôt qu'à un souvenir.

| Ce qui était écrit | Ce qui est vrai |
|---|---|
| Sint Maarten, `ANG` | **`XCG`** — le florin caribéen a remplacé celui des Antilles néerlandaises le **31 mars 2025**, et l'ancien n'a plus cours depuis le 1er juillet 2025 |
| `PAYS_MULTIFUSEAUX` : 8 pays | **12** — manquaient le Chili (île de Pâques), l'Équateur (Galápagos), l'Espagne (Canaries) et le Portugal (Açores) |

Tout le reste concordait : 93 devises, 93 fuseaux, tous les codes de
langue. **Deux défauts sur 234.**

**Les deux manques les plus gênants sont ceux qu'on avait déjà sous les
yeux.** L'Espagne, dont les Canaries ont leur propre fiche de pays
producteur — celle-là même dont on venait de corriger l'heure. Et
l'Équateur, **pays producteur relu à la main au lot 2**, dont j'avais
noté les Galápagos sans en tirer la conséquence. L'audit mécanique a vu
ce que la relecture attentive avait laissé passer.

**Un pays est écarté délibérément.** tzdata rattache
`Europe/Simferopol` à l'Ukraine, à UTC+3 : c'est l'heure imposée en
Crimée occupée, quand l'heure légale ukrainienne est UTC+2 sur tout le
territoire. Signaler UA comme « pays à plusieurs fuseaux » entérinerait
l'occupation. Le contrôle le propose ; on le refuse, et la raison est
écrite dans le code — sinon quelqu'un « corrigera » l'écart un jour.

**Et une demi-réparation rattrapée de justesse.** L'astérisque
« plusieurs fuseaux » vient lui aussi de `PAYS_MULTIFUSEAUX`, indexé par
code ISO donc par drapeau. Une fois l'Espagne ajoutée à la liste, les
Canaries — qui n'ont qu'un fuseau et affichaient enfin le bon — se
voyaient signalées « plusieurs fuseaux » par héritage. Corriger le
fuseau sans corriger l'astérisque n'aurait réparé que la moitié de la
fiche.

Ces deux contrôles sont désormais dans `coherence_check.php`. Ils
valent surtout pour l'avenir : une devise qui change ou un pays qui
abandonne l'heure d'été apparaîtront à la mise à jour suivante d'ICU ou
de tzdata, sans que personne ait à y penser.

---

**La relecture est terminée.** Les six lots sont passés.

Ce qui en reste n'est pas une liste de corrections mais **quatre
contrôles branchés sur la campagne**, là où il n'y en avait aucun :

| Outil | Ce qu'il empêche |
|---|---|
| `i18n_fraicheur.php` (E6) | qu'une traduction décrive un français qui a changé |
| `coords_check.php` (lot 0) | qu'un point se trompe de pays |
| `geo_banquemondiale.php` (lot 2) | qu'un chiffre daté vieillisse en silence |
| `coherence_check.php` (lot 5) | qu'un même fait dise deux choses selon le champ |

Les trois premiers existaient sous une forme ou une autre et **ne
servaient à rien faute de code de sortie**. C'est le motif qui revient
le plus souvent dans ce journal : l'instrument était là, personne ne le
lançait, et le défaut qu'il aurait vu est resté des années.

**Ce que la relecture ne dit toujours pas.** Aucune de ces valeurs
n'est *relue* au sens de `translation_status` : le compteur « relue »
est à zéro sur 5 580 traductions. Un humain n'a validé aucune des cinq
langues étrangères. C'est la prochaine dette, et elle ne se comble pas
par un outil.

---

## Une dernière leçon, arrivée après coup

En comblant les revenus manquants (`033`, `034`), on a produit **quatre
chiffres faux d'affilée** sans qu'aucun signal ne se déclenche.

Les déclarations douanières brésiliennes font cent mégaoctets. La
connexion les coupe sans prévenir, et `curl | grep` rend alors moins de
lignes **sans aucune erreur**. Le plus trompeur annonçait « aucune
exportation de cigares en 2021 » — le flux s'était arrêté avant. Un
autre donnait 46 445 dollars pour 2023, tiré d'un fichier descendu à
seize pour cent.

C'est la même maladie que tout le reste de ce journal, sous une forme
nouvelle : **un compte faible ressemble exactement à un compte juste.**
Rien ne distingue « peu de lignes parce qu'il y en a peu » de « peu de
lignes parce que le fichier est tronqué ».

Le remède qui a marché tient en deux gestes :

1. **Vérifier la complétude, pas le succès.** Comparer les octets reçus
   au `Content-Length` annoncé — `curl` sort en 0 sur un flux coupé.
2. **Compter un témoin dont on connaît l'ordre de grandeur.** Ici les
   1 129 lignes de feuille que le Brésil exporte massivement. *Un
   témoin ridicule dénonce la troncature ; un faible compte de cigares,
   non.*

Le second geste est le plus transposable, et c'est celui qui manquait
partout ailleurs : **quand on mesure quelque chose de rare, mesurer en
même temps quelque chose d'abondant.**

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
