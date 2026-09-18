# CLAUDE.md — CigarOdyssey

Atlas mondial du cigare premium (`thecigarodyssey.com`) : maisons, pays
producteurs, zones, feuilles, établissements, en six langues
(fr → en/es/de/zh/ar). Communication en français avec l'utilisateur,
qui déploie lui-même après chaque lot ; on vérifie ensuite en production.
Ce fichier fait foi pour tout ce qui est dans `C:\CLAUDE\cigareglobe\` ;
le `CLAUDE.md` du dossier parent décrit un autre projet (LiquidLink).

## Stack et commandes

- PHP 8 (`C:\wamp64\bin\php\php8.4.0\php.exe`), MySQL 9.1 locale
  (`C:\wamp64\bin\mysql\mysql9.1.0\bin\mysql`, base `qffk5199_cigare`),
  accès dans `.env` (jamais dans le code ni ici). `sql_mode` non strict :
  **un varchar trop court tronque en silence** — d'où les assertions de
  longueur dans les générateurs et la sonde varchar de `tests/run.php`.
- Front : `index.html` + `assets/js/*.js` en vanilla, sans build ;
  `page.php` rend les fiches côté serveur (`type=atlas|pays|cave|marque|
  feuilles|feuille|lexique|aromes|marches`) ; `backend/` (api, auth,
  `pages_lib.php`, `moderation_lib.php`, `config.php`).
- Aperçu local : `.claude/launch.json` (Apache WAMP, port 8098,
  `dev/httpd-cigarodyssey.conf`) — jamais de serveur lancé à la main.

```
php tests/run.php                       # ~980 assertions ; recrée une base de test, lance son propre serveur
php tools/lounges_fraicheur.php --verifier   # cliquet : fiches d'établissements à relire, sites morts
php tools/sources.php --verifier | --figer   # domaines cités (DNS) contre le sceau sql/sources_domaines.json
php tools/coherence_check.php ; marques_check.php ; coords_check.php ; geo_banquemondiale.php --verifier
php tools/i18n_superlatif_check.php ; i18n_langue_check.php ; i18n_melange_check.php ; i18n_divergence.php ; i18n_fraicheur.php
php tools/contenu_dump.php              # réécrit sql/contenu.sql (le contenu versionné) après toute migration
php tools/placeholders.php --tout       # cartes des établissements (uploads/, non versionné : à lancer des deux côtés)
php tools/prevol.php                    # sur le serveur, après déploiement
```

Après chaque migration, dans l'ordre : appliquer en local
(`mysql --default-character-set=utf8mb4 … < sql/migrations/NNN_*.sql`),
`contenu_dump`, `sources --figer`, tous les guardrails, `tests/run.php`,
docs (`docs/roadmap.md` + le `docs/recensement-N.md` du chantier),
commit **sur master** (pas de branche), push, puis donner à l'utilisateur
les commandes de déploiement — une par bloc `bash`, dans l'ordre de
`docs/deploiement.md` (git pull → Deploy HEAD Commit cPanel → `diff -rq`
→ migrations une par commande → `prevol.php`). Quand il dit « c'est
fait », vérifier les pages en production avec curl.

## Le contenu, et comment on l'écrit

- Tables : `brands`, `producer_countries`, `production_zones`, `feuilles`,
  `lounges` (+ `lounge_countries`, `lounge_photos`), `habanos_presence`,
  `markets`, lexique, arômes. Le français est la source ; les cinq
  traductions sont des colonnes suffixées (`_en` … `_ar`) **scellées** dans
  `translation_status` (`source_hash = SHA1(colonne française)`, statut
  `machine` ; `relu` seulement par un humain). Toute réécriture d'un texte
  français **rescelle** ses traductions dans la même migration.
- Une fiche d'établissement se dépublie (`is_verified = 0`, `source =
  'RETIRÉ — …'`), ne s'efface jamais. Ids explicites pour toute nouvelle
  ligne (derniers connus : `lounges` 2567, `lounge_photos` 477,
  `production_zones` 55), gardés par `NOT EXISTS`.
- **Aucune migration écrite à la main** : un générateur Python dans le
  carnet de session (`genNNN.py` — dictionnaires `F[...]`, `q()` pour
  l'échappement, `W(fr,en,es,de,zh,ar)`, assertions de longueur et de
  superlatifs, `%%` dans les gabarits) produit
  `sql/migrations/NNN_titre.sql` : en-tête qui dit ce qu'on a trouvé et
  pourquoi on tranche ainsi, instructions rejouables, `moderation_log`
  DELETE + INSERT (`acteur_nom = 'migration NNN'`), et un SELECT de
  contrôle final qui **doit rendre des 1 partout**. Tester à blanc :
  `START TRANSACTION; … ROLLBACK;`.

### Règles éditoriales (toutes en vigueur)

- Pas de cigare de machine ; une maison se classe là où le cigare est
  **roulé aujourd'hui** ; pas de fiche sans fabrique nommée, sauf silence
  documenté ; **règle Ortega** : pas de fiche au présent sur une maison
  invérifiable sans dire son état.
- Les dires d'une maison sont **attribués**, jamais adoptés ; notes de
  presse et palmarès retirés ; une divergence de dates **s'écrit**, ne se
  tranche pas ; sources en langue locale déclarées.
- Tout domaine cité passe au DNS (`checkdnsrr`) ; **un domaine mort ou
  reconverti ne se cite pas**, même pour dire qu'il est mort ; les poignées
  Instagram vont dans la colonne `instagram`, pas dans `source`.
- Établissements : TripAdvisor, Google Maps, Yelp, Foursquare, « fourni
  par l'établissement » ne confirment rien ; « fermé » exige une source
  qui le dise ; « introuvable » après trois requêtes en langue locale et
  en anglais, puis un contradicteur ; l'hôtel qui **publie la liste de ses
  bars** sans salon cigares dément la fiche (155) ; le silence seul ne
  retire rien (Afrique de l'Ouest). Une fiche relue s'écrit
  « à vérifier — relu le JJ mois AAAA : … » (classe `relue`, dix-huit mois).
- Prose : pas de superlatifs en zh (最, 第一) ni en ar (أفضل, أكثر, أندر,
  أشهر — « mois » = شهور) ; pas de cyrillique ; pas de parole rapportée
  entre guillemets ; une fiche « à vérifier » ne décrit **aucune offre**
  (premium, clientèle, atmosphère…). Longueurs : `brands.founded` ≤ 49,
  `brands.factory` < 200, `lounges.source` ≤ 500, `name`/`city` ≤ 200.
- Les vérifications factuelles se confient aux agents de `~/.claude/agents`
  (`expert-cigare` en relecteur puis en contradicteur, sorties JSON à
  schéma). Quand un annuaire a un plan de site (habanos.com :
  `wp-sitemap-posts-place-*.xml`), le lire à la machine vaut mieux qu'un
  agent : les workflows meurent à la limite de session.

## Pièges connus

- Les heredocs de Git Bash mangent `\b`, `\\` et `\r\n` dans les scripts
  Python : écrire les scripts avec l'outil Write, lancer avec
  `PYTHONIOENCODING=utf-8`. Les `docs/*.md` sont en CRLF.
- `tests/run.php` a rendu deux fois une alerte transitoire (visiteur
  anonyme vu connecté, 5 ou 87 échecs) verte au second passage : relancer
  avant de chercher ; instrumenter si cela revient.
- Le Deploy HEAD Commit de cPanel peut ne rien copier sans le dire : le
  `diff -rq` après déploiement n'est pas facultatif (`docs/deploiement.md`).
- `uploads/` n'est ni versionné ni déployé : cartes et photos se
  fabriquent sur le serveur ; la sauvegarde (B4b2) est le seul point
  bloquant de la roadmap.

État et suite dans `docs/roadmap.md` (fin de fichier) et
`docs/recensement-7.md` ; mémoire de session dans
`~/.claude/projects/C--CLAUDE/memory/cigareglobe-projet.md`.
