# Base de données CigarOdyssey

Base MySQL (`utf8mb4` / `utf8mb4_unicode_ci`). 19 tables : atlas
(pays producteurs, marchés, lounges, marques, photos, Habanos…) +
espace client (users, email_tokens, auth_attempts, reviews, favorites).

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

## Installer / recréer la base

Nouvelle base (tout d'un coup) :
```bash
mysql -u <user> -p <base> < sql/schema.sql
```
Puis importer les données (dump séparé, non versionné — voir plus bas).

Base existante à mettre à niveau : appliquer les migrations manquantes
dans l'ordre (001 → 002 → 003 → 004 → 005 → 006).

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
