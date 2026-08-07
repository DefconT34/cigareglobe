# Tests de bout en bout (Playwright)

Complément des tests d'API (`tests/run.php`). Ceux-ci pilotent un vrai
navigateur et vérifient ce que l'utilisateur voit : globe, panneaux,
recherche, Explorer, langues, accessibilité clavier, affichage mobile.

## Lancer

```bash
npm install                  # une fois
npx playwright install chromium
npm run test:e2e
```

Autres commandes :

```bash
npm run test:e2e:ui                              # mode interactif
npm run test:e2e -- --headed                     # navigateur visible
npm run test:e2e -- tests/e2e/globe.spec.js      # un seul fichier
npm run test:e2e:report                          # rapport HTML du dernier run
```

## Ce que ça met en place tout seul

`playwright.config.js` démarre un serveur PHP sur le **port 8100** (le
serveur de développement reste libre sur 8099) et `global-setup.js`
reconstruit la base de test avant la campagne.

**La base applicative n'est jamais touchée.** Le serveur reçoit
`DB_NAME=<base>_test`, qui prime sur le `.env` du projet.

Sur le poste de développement, le PHP du `PATH` n'a pas `pdo_mysql` :
la configuration détecte automatiquement celui de WAMP. Pour forcer un
autre interpréteur :

```bash
PHP_BIN=/chemin/vers/php npm run test:e2e
```

## Le jeu de données

Sans pays ni marchés, `data.php` renvoie des tableaux vides et le globe
s'affiche nu. `tests/fixtures/atlas.sql` fournit donc les tables de
référence complètes (12 pays producteurs, 10 marchés, 92 pays à
lounges, 37 zones), 40 établissements et les 4 marques emblématiques de
Cuba.

Il est **généré**, pas écrit à la main. Après une évolution du schéma
ou des données de référence :

```bash
php tests/fixtures/make-atlas.php
```

Même discipline que `sql/schema.sql` — voir `sql/README.md`.

## Organisation

| Fichier | Couvre |
|---|---|
| `globe.spec.js` | chargement, peinture du canvas, colonne de boutons, infobulle |
| `search.spec.js` | ouverture, raccourci, loupe unique, recherche d'un pays |
| `panels.spec.js` | fiche pays, exclusivité des deux panneaux, modale de marque, fête nationale |
| `explorer.spec.js` | ouverture, champ de filtre, filtres texte et région |
| `i18n.spec.js` | changement de langue sur les deux champs de recherche |
| `a11y.spec.js` | clavier, étiquettes, alternative textuelle du globe |
| `responsive.spec.js` | mode mobile (projet `chromium-mobile`, Pixel 7) |

Plusieurs tests portent la mention **Régression** avec le commit
d'origine : ils gardent un défaut déjà corrigé de revenir. Quand vous
corrigez un bug visible dans l'interface, ajoutez-y le test
correspondant plutôt que de créer un fichier.

## Pourquoi un seul travailleur

Le serveur intégré de PHP traite une requête à la fois, et
`PHP_CLI_SERVER_WORKERS` n'existe pas sous Windows. En parallèle, les
navigations expirent. La campagne s'exécute donc séquentiellement,
comme la suite PHP. Comptez quelques minutes.

## Pourquoi les fichiers JS et CSS ne passent pas par le serveur

`tests/e2e/statique.js` intercepte les ressources **inertes** et les
sert depuis le disque. Sans cela, un tiers des parcours échouaient au
premier essai et repassaient au retry — jamais sur une assertion,
toujours sur l'expiration de `page.goto()` dans `ouvrir()`.

Deux causes, mesurées en chargeant la page 8 fois de suite :

| | chargements > 18 s | `goto` médian |
|---|---|---|
| sans interception | 3 / 8 | 5,6 s |
| interception | 0 / 8 | 3,1 s (max 4,0 s) |

1. **`php -S` lâche une connexion sur la rafale.** Une page demande une
   quarantaine de ressources ; le serveur annonce `Connection: close`,
   donc chacune ouvre sa propre connexion TCP. Il lui arrive d'en
   accepter une puis de ne jamais la servir — le relevé Chrome montre
   `connect=5 ms` puis 19 s d'attente avant `ERR_CONNECTION_RESET`. Les
   scripts classiques s'exécutant dans l'ordre, toute la page attend
   derrière.
2. **Les ressources tierces sont interrogées pour de vrai.**
   `fonts.googleapis.com` (importé par `themes.css`) et `unpkg.com`
   (Leaflet, chargé par `explorer.js`) coûtaient ~2 s par chargement,
   7 s au pire relevé — délai compté dans `load`, donc dans `goto`.
   Elles sont désormais téléchargées **une fois** puis relues depuis
   `tests/e2e/.cache-tiers/` (hors dépôt).

Effet sur la campagne complète : **36 réussites, 9,8 min, aucun
réessai** — contre 12 parcours sur 36 rattrapés au retry et 21 min
auparavant. Les réessais sont donc retombés de 2 à `1` en intégration
continue et `0` en local : une instabilité résiduelle doit se voir tout
de suite plutôt qu'être rattrapée en silence.

Ce que cela **ne masque pas** : les octets servis sont ceux du disque,
sans transformation ; une URL erronée ou un fichier absent n'est pas
intercepté et repart vers le serveur, qui répond 404 comme avant. Seul
le transport change — et ce transport n'est pas celui de la production,
où Apache sert les fichiers, jamais `php -S`. Tout le dynamique
(`/`, `index.php`, `backend/*.php`) passe par le serveur, inchangé.

Un filtre a par ailleurs pu être **resserré** : `collecteErreurs()`
écartait tout message commençant par `Failed to load resource`, prefixe
commun aux coupures de transport **et** aux réponses 404. Un fichier
absent ou une URL mal réécrite passait donc inaperçu. Le préfixe est
retiré ; les coupures restent filtrées par les motifs `net::ERR_*`, qui
figurent dans le même message. Vérifié : un chargement complet ne
produit aucune réponse non-2xx, en bureau comme en mobile.

### Ce qui a été écarté

- **Préchauffage dans `globalSetup`.** Mesuré : `index.php` répond en
  28 ms à froid (cache `backend/cache/` vide, `i18n.js` de 200 Ko à
  analyser) contre 13–24 ms à chaud. Le cache par langue n'a jamais été
  en cause ; préchauffer n'aurait rien changé.
- **Augmenter `navigationTimeout`.** Le budget de 30 s n'était pas
  serré : un chargement sain tient en 3–4 s, et les échecs étaient des
  blocages de ~19 s, pas une lenteur graduelle. Relever le seuil aurait
  transformé un échec en test lent sans supprimer le blocage. Le seuil
  reste à 30 s, soit ~8× la marge d'un chargement sain.

## Points d'entrée par lien profond

Cliquer une cible sur le canvas dépendrait de la rotation du globe au
moment du test. Les tests de panneaux passent donc par les liens
profonds déjà supportés par l'application :

```
/?country=cuba     /?lounge=<id>     /?brand=Cohiba     /?market=<id>
```

## Forcer la fête nationale

La célébration ne se déclenche que le jour de la fête du pays cliqué. Un
test qui attendrait cette date ne s'exécuterait qu'une fois l'an, et
échouerait les 364 autres jours. `?fete=<ISO>` force le cas :

```
/?country=cuba&fete=CU
```

Ce n'est pas une porte dérobée de circonstance : le paramètre n'accepte
que deux lettres, comparées à une table fermée. Un code inconnu ne
produit rien.
