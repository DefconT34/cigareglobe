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
référence complètes (12 pays producteurs, 10 marchés, 93 pays à
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
| `panels.spec.js` | fiche pays, exclusivité des deux panneaux, modale de marque |
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

## Points d'entrée par lien profond

Cliquer une cible sur le canvas dépendrait de la rotation du globe au
moment du test. Les tests de panneaux passent donc par les liens
profonds déjà supportés par l'application :

```
/?country=cuba     /?lounge=<id>     /?brand=Cohiba     /?market=<id>
```
