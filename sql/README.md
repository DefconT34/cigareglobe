# Base de données CigarOdyssey

Base MySQL (`utf8mb4` / `utf8mb4_unicode_ci`). **33 tables** : atlas
(pays producteurs, marchés, lounges, marques, photos, Habanos…) +
espace client (users, email_tokens, auth_attempts, reviews, favorites) +
espace communautaire (`forum_*`) + réglages du site (`site_languages`).

## Fichiers

- **`schema.sql`** — **schéma de référence** (source de vérité), extrait
  de la vraie base via `mysqldump --no-data`. Toutes les tables + index +
  clés. Recrée une base vide complète.
- **`migrations/`** — évolutions incrémentales, à appliquer dans l'ordre
  sur une base **existante** :
  - `001_users.sql` — comptes (users, email_tokens, auth_attempts)
  - `002_contributions_reviews.sql` — `contributions.user_id` + `reviews`
  - `003_favorites.sql` — favoris & listes
  - `004_review_flags.sql` — signalements d'avis (modération)
  - `005_drop_country_polygons.sql` — retrait des polygones saisis à la main
  - `006_fix_coordinates.sql` — 2 points hors de leur pays (Israël, Semi Vuelta)
    (les contours viennent désormais de la carte du monde du front)
  - `007` → `014` — traductions de l'atlas, fraîcheur, coordonnées,
    approbation des contributions, langue des comptes
  - `015` → `018` — espace communautaire : rubriques et discussions,
    sujets d'amorçage, événements, images de message
  - `019_site_langues.sql` — table `site_languages` : quelles langues le
    site sert, réglées depuis l'administration. La liste des langues
    *connues* reste dans le code (`backend/langues.php`) — la base ne
    fait que cocher dedans.
  - `020_forum_suivi.sql` — suivre un sujet et en être prévenu :
    `forum_follows.notified_at` (le garde-fou contre l'avalanche) et
    `users.notify_forum` (le réglage du profil)
  - `021_marques_orphelines.sql` — **données**, pas structure : onze
    articles de marque qu'aucune fiche pays n'affichait, et 34
    `brands.country_id` qui ne désignaient aucun pays. Vérifiable à tout
    moment par `php tools/marques_check.php`.

  - `022_marques_manquantes.sql` — **données** : Cuba passe de 11 à 27
    marques (le portefeuille Habanos complet), plus La Aurora (1903) et
    J.C. Newman (1895). Sans notes chiffrées ni célébrités : ce sont les
    champs les plus faciles à inventer et les plus difficiles à
    vérifier.

  Le dossier fait foi ; cette liste résume.

## Installer / recréer la base

Nouvelle base (tout d'un coup) :
```bash
mysql -u <user> -p <base> < sql/schema.sql
```
Puis importer les données (dump séparé, non versionné — voir plus bas).

Base existante à mettre à niveau : appliquer les migrations manquantes
dans l'ordre (`001` → `022`).

## Régénérer `schema.sql`

**À faire après chaque migration** : `schema.sql` sert de base aux tests
(`tests/run.php`) et à toute recréation de la base. S'il n'est pas à jour,
les tests échouent sur des tables manquantes.

Après un changement de structure en base, réextraire :
```bash
mysqldump --no-data --skip-comments --no-tablespaces \
  --default-character-set=utf8mb4 <base> \
  | sed -E 's/ AUTO_INCREMENT=[0-9]+//g' > sql/schema.sql
```

**Sous Windows, ne pas rediriger depuis PowerShell** : `>` écrit des
fins de ligne CRLF. `tests/bootstrap.php` découpe le dump instruction
par instruction et normalise désormais les fins de ligne, mais un
fichier CRLF reste une anomalie dans le dépôt. Passer par Git Bash, ou
reconvertir en LF après coup.

Symptôme d'un `schema.sql` oublié après une migration : la moitié de la
campagne d'API échoue sur des **419 (jeton CSRF invalide)**, ce qui
n'a aucun rapport apparent. `current_user()` liste ses colonnes
explicitement ; si l'une manque dans la base de test, la requête lève,
la session ne se résout plus, et toute écriture est refusée. Chercher
du côté du CSRF ne mène nulle part — la cause est une colonne absente.

Symptôme du temps où la normalisation manquait : le fichier entier
formait une seule « instruction », commençant par une directive
`/*!40101 … */` donc ignorée — **zéro table créée**, et l'échec ne se
manifestait qu'au premier `INSERT` sur `lounges`.

## Traductions — `traductions.sql`

Exception assumée à la règle « pas de données dans Git » : les
traductions du contenu représentent des milliers de segments qui ne
vivaient que dans la base locale. Elles ne contiennent aucune donnée
personnelle — ni comptes, ni avis, ni adresses IP.

```bash
php tools/i18n_dump.php > sql/traductions.sql   # sauvegarder
mysql <base> < sql/traductions.sql              # restaurer / appliquer
```

Les `UPDATE` portent sur la **clé primaire**, jamais sur le texte
source : le français de référence est amené à être corrigé, et s'y
accrocher rendrait le fichier caduc au premier ajustement. Le fichier
est rejouable autant de fois qu'on veut.

Le périmètre traduisible est décrit une seule fois, dans
`tools/i18n_contenu_plan.php`, partagé par l'export/import et par ce
dump — deux copies auraient fini par diverger, et la sauvegarde aurait
alors laissé filer des colonnes pourtant traduites.

## Données

`schema.sql` ne contient **que la structure** (jamais de données
personnelles / IP / emails). Le contenu (pays, lounges, marques…) se
sauvegarde séparément et **hors Git** :
```bash
mysqldump --no-create-info <base> \
  producer_countries markets lounge_countries lounges brands \
  habanos_presence producer_geo production_zones country_polygons \
  > seed.data.sql   # à garder hors du dépôt
```
