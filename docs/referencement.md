# Référencement — ce que les moteurs voient

## Le constat de départ

Mesuré en production le 2 septembre 2026, avant ce chantier :

| | |
|---|---|
| Adresses au plan de site | **16** — six pages d'accueil, dix fils de discussion |
| Liens dans le HTML brut de la page d'accueil | **1** |
| `<h1>` de chaque page du site | *« Avez-vous 18 ans ou plus ? »* |
| Pages pour les 500 établissements | **0** |
| Pages pour les 118 maisons | **0** |
| Pages pour les 108 pays | **0** |

Tout le contenu vivait dans le JavaScript. `index.php` savait déjà servir
les **balises** d'une marque ou d'un fil (`?brand=`, `?sujet=`), mais aucune
n'avait de **corps de page** : un moteur lisait un titre et une description,
puis une coquille vide.

Autrement dit : le site était inatteignable pour qui n'en connaissait pas
déjà l'adresse.

## Le choix : de vraies pages, pas du rendu dans la coquille

On pouvait injecter le texte dans `index.html` et laisser l'application le
recouvrir. Deux raisons de ne pas le faire :

- un texte que le JavaScript efface au démarrage **disparaît du DOM que
  Google indexe** — Google exécute le JavaScript ;
- un texte qu'on laisse sous un calque plein écran est **un texte caché**.

`page.php` sert donc de vraies pages, lisibles sans JavaScript, qui ne posent
aucune de ces deux questions. Bénéfice de côté : le site devient consultable
sur une connexion qui ne charge pas 500 Ko de scripts.

## Le plan d'adressage

| Adresse | Ce qu'elle sert |
|---|---|
| `/` · `/en/` · `/es/` · `/de/` · `/zh/` · `/ar/` | l'application (globe) |
| `/atlas` | l'index : tous les pays, toutes les maisons |
| `/pays/<id>` | un pays — production, zones, maisons, établissements |
| `/cave/<id>-<slug>` | un établissement |
| `/marque/<slug>` | une maison |

Le préfixe de langue est optionnel et vaut pour toutes : `/pays/cuba` est le
français, `/ar/pays/cuba` l'arabe.

**Un seul vocabulaire de segments, en français.** Le site a une langue
d'origine ; multiplier les segments par langue aurait multiplié les règles de
réécriture sans rien apporter — le référencement se joue sur le slug et sur
le contenu, pas sur le mot `pays`.

**L'identifiant numérique d'un établissement fait foi** ; le slug qui le suit
n'est là que pour l'humain et pour le lien partagé. `/cave/5` et
`/cave/5-cigarro-ci` mènent au même endroit, et renommer un établissement ne
casse aucune adresse déjà indexée.

## Ce qui relie tout

Un plan de site fait **connaître** des adresses ; ce sont les **liens** qui
leur donnent du poids et qui font revenir les robots.

- la page d'accueil mène à `/atlas` (dans le portail d'âge — c'est le seul
  endroit du HTML brut où un lien est certain d'être lu) ;
- `/atlas` mène aux 108 pays et aux 118 maisons ;
- chaque pays mène à ses établissements et à ses maisons ;
- chaque établissement et chaque maison remontent vers leur pays.

## Les canoniques

L'application écrit `?country=cuba` dans la barre d'adresse dès qu'un panneau
s'ouvre, et ces adresses se partagent. Elles montrent le même contenu que
`/pays/cuba`.

`index.php` déclare donc `/pays/cuba` comme **canonique** de `?country=cuba`,
et n'émet alors aucun `hreflang` — c'est la page canonique qui porte les
siens.

⚠ La valeur de `?country=` est **vérifiée en base**, pas seulement par une
expression régulière : elle entre dans la clé du fichier de cache, et un
identifiant simplement « bien formé » aurait permis d'en faire écrire autant
qu'on veut avec `?country=aaaa`, `aaab`, `aaac`…

## Le portail d'âge

Il est présent sur les pages servies aussi, et c'est voulu : ce sont des
portes d'entrée depuis un moteur de recherche, souvent la **première** page
vue du site. Une porte d'entrée sans portail serait un contournement.

Son CSS a été **extrait** de `components.css` vers `assets/css/agegate.css` :
`page.php` le porte sans charger les 78 Ko de la feuille de l'application. Le
recopier aurait donné deux portails à corriger au lieu d'un.

`agegate.js` est réemployé tel quel ; les quatre chaînes dont il a besoin (au
refus seulement) sont rendues par le serveur, plutôt que de charger 200 Ko de
dictionnaire.

Un contenu derrière un portail d'âge s'indexe normalement — c'est le cas de
tous les sites de vin et de spiritueux — parce que le HTML servi est le même
pour tout le monde. Servir autre chose aux robots serait du *cloaking*, et
c'est exactement ce qu'on ne fait pas ici.

## Le `<h1>`

Le portail d'âge portait un `<h1>` : « Avez-vous 18 ans ou plus ? » était donc
le seul titre de niveau 1 de tout le site. Il est passé en `<p>` — le rôle de
dialogue garde son nom accessible par `aria-labelledby`, qui ne demande aucun
niveau de titre.

Le démoter laissait la page **sans `h1` du tout**, ce qui n'est pas mieux :
`.title-main` (« CIGAR ODYSSEY », déjà affiché dans l'en-tête) l'est devenu.
D'où le `margin:0` ajouté à sa règle — un `h1` arrive avec 0.67em de marge par
défaut, qui descendait l'en-tête entier.

## Ce qu'il reste à faire, hors code

1. **Déclarer le site à Google Search Console** et y soumettre
   `https://thecigarodyssey.com/sitemap.xml`. Sans cela, l'indexation prend
   des semaines au lieu de jours.
2. Faire de même chez **Bing Webmaster Tools** (qui alimente aussi DuckDuckGo
   et ChatGPT).
3. Surveiller le rapport *Couverture* : c'est lui qui dira si les 640 pages
   sont indexées, et sinon pourquoi.

⚠ **Ce que ce chantier ne règle pas.** Les pages existent et sont lisibles ;
leur contenu reste ce qu'il est. Cinq cents établissements sans horaires,
sans site web et sans coordonnées, décrits en 112 caractères en moyenne,
donnent cinq cents pages minces. L'indexation les rendra visibles — elle ne
les rendra pas bonnes. Voir le point 2 de la feuille de route.

## Le cache des pages

Mesuré en production après la mise en ligne, une page servie par PHP répondait :

```
Cache-Control: public, max-age=300,max-age=3600
```

Deux durées contradictoires dans un même en-tête. `mod_expires`, dans le
`.htaccess`, ne **remplace** pas le `Cache-Control` de l'application : il
**ajoute** le sien. Selon le cache qui lit cette ligne, une correction restait
invisible cinq minutes ou une heure. Le JSON du globe portait de même
`no-cache, max-age=300`.

**Le défaut était antérieur à ce chantier** : la page d'accueil l'avait déjà.

### La sortie n'était pas de retirer la règle d'Apache

Elle sert aux fichiers statiques, qui n'ont personne pour parler à leur place,
et `.htaccess` a déjà mis ce site à terre une fois.

`mod_expires` **s'abstient lorsque la réponse porte déjà un `Expires`**.
Vérifié plutôt que supposé : `backend/admin.php`, qui ouvre une session PHP
(laquelle pose `Expires: Thu, 19 Nov 1981`), n'a jamais reçu de `max-age`
surnuméraire. **Les points authentifiés étaient donc déjà protégés** — aucune
réponse portant des données personnelles n'a été concernée.

### Trois fonctions, dans `backend/config.php`

| | |
|---|---|
| `cache_public(int $s)` | réutilisable tel quel pendant *s* secondes |
| `cache_revalider()` | gardé, mais redemandé à chaque usage (`no-cache`) |
| `cache_jamais()` | qu'aucun cache ne doit garder (`no-store`) |

Chacune pose **les deux en-têtes ensemble**. C'est là tout l'objet : pour qu'on
ne puisse plus poser l'un en oubliant l'autre.

La campagne interdit désormais tout `header('Cache-Control…')` écrit à la main
ailleurs que dans `config.php` — c'est ainsi que le défaut était arrivé.

⚠ `php -S`, employé par la campagne, n'a pas `mod_expires` : **la duplication ne
s'y reproduit pas**. Ce qui est éprouvé est l'invariant qui la prévient — toute
réponse qui pose un `Cache-Control` pose aussi un `Expires` — et le fait
qu'aucun en-tête ne porte deux `max-age`.
