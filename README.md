# CigarOdyssey

Atlas interactif mondial du cigare premium : globe des pays producteurs
et marchés, annuaire de lounges & caves (avec photos, notes et avis), et
espace membre (contributions, favoris, profil). PWA multilingue
(fr/en/es/de/zh/ar).


## Stack

- **Front** : `index.html` (application monolithique en JavaScript vanilla —
  globe en canvas 2D, carte Leaflet pour l'Explorer) + modules de l'espace
  client dans `assets/js/` (`account`, `reviews`, `favorites`, `profile`)
  et `assets/css/account.css`. PWA (`manifest.json`, `sw.js`).
- **Backend** : PHP 8, dossier `backend/`. MySQL (`utf8mb4`).
- **Config** : via `.env` (aucun secret dans le code).

## Prérequis

- PHP 8.x avec l'extension **pdo_mysql**
- MySQL 8+ (ex. via **WAMP**)

## Lancer en local

1. **Base de données** — créer la base et importer le schéma :
   ```bash
   mysql -u root -p -e "CREATE DATABASE cigarodyssey CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
   mysql -u root -p cigarodyssey < sql/schema.sql
   ```
   (puis importer un jeu de données si disponible — voir `sql/README.md`).

2. **Configuration** — copier le modèle et renseigner les accès :
   ```bash
   cp .env.example .env
   # éditer .env : DB_NAME, DB_USER, DB_PASS, etc.
   # en dev, mettre MAIL_LOG_ONLY=true (les emails vont dans backend/cache/mail_outbox.log)
   ```

3. **Serveur** — servir la racine du projet (le PHP doit avoir pdo_mysql) :
   ```bash
   php -S 127.0.0.1:8099 -t .
   # avec WAMP : C:\wamp64\bin\php\php8.x\php.exe -S 127.0.0.1:8099 -t .
   ```
   → http://127.0.0.1:8099/index.html

> Les endpoints backend sont relatifs (`/backend/…`) : le front et l'API
> sont servis depuis la même origine, aucune configuration d'URL à faire.

## Structure

```
index.html            Application front (globe, panneaux, PWA)
assets/js/            Modules espace client (account, reviews, favorites, profile)
assets/css/           Styles espace client (theme-aware)
backend/
  config.php          Chargeur .env + connexion PDO (sans secret)
  auth.php            Authentification (register, verify, login, reset…)
  auth_lib.php        Session sécurisée, CSRF, rate-limit, utilisateur courant
  mailer.php          Envoi d'email — pilotes log/mail/brevo/mailgun/resend
  api.php             Contributions, avis, favoris, profil, modération
  data.php            Données de l'atlas (globe, pays, lounges, marques…)
  photos.php          Upload & gestion des photos de lounges
  admin.php           Interface de modération
  .htaccess           Protection de config.php
sql/
  schema.sql          Schéma de référence (structure complète)
  migrations/         Évolutions incrémentales (001→006)
docs/
  roadmap.md          Feuille de route (chantiers restants + ordre)
  espace-client.md    Cahier des charges de l'espace membre
uploads/lounges/      Photos uploadées (hors Git)
```

## API (aperçu)

- `auth.php?action=` : `me` · `register` · `verify` · `login` · `logout` · `forgot` · `reset` · `resend`
- `api.php?action=` : `submit` · `vote` · `rate` · `review` · `reviews` · `my_contributions` · `my_ratings` · `fav_toggle` · `fav_states` · `fav_list` · `profile` · `profile_update` (+ modération admin)
- `data.php?action=` : `globe` · `country` · `lounges` · `brand` · `market` · `all`
- `photos.php?action=` : upload / gestion (admin)

Les actions qui écrivent au nom de l'utilisateur exigent une session et un
jeton **CSRF** (obtenu via `auth.php?action=me`), et un compte à l'email vérifié.

## Base de données

Voir `sql/README.md` (schéma de référence, migrations, régénération, seed).

## CORS

`ALLOWED_ORIGIN` (dans `.env`) liste les origines autorisées à lire
l'API depuis un navigateur, séparées par des virgules :

```
ALLOWED_ORIGIN=https://cigarodyssey.com,https://www.cigarodyssey.com   # production
ALLOWED_ORIGIN=*                                                        # local
```

Le domaine nu et le sous-domaine `www` sont **deux origines
distinctes** : déclarer les deux si les deux répondent. La comparaison
est exacte, jamais un préfixe — `https://cigarodyssey.com.exemple.net`
est refusé.

À savoir : CORS n'empêche que la lecture *par un navigateur* depuis un
autre site. Il ne protège pas d'une récupération serveur à serveur, qui
ne passe par aucune de ces vérifications.

## Tests

Deux suites complémentaires. Toutes deux reconstruisent une **base
dédiée** à partir de `sql/schema.sql` : la base applicative n'est jamais
modifiée.

```bash
php tests/run.php     # API : 83 vérifications (auth, CSRF, modération, emails, CORS)
npm run test:e2e      # Front : navigateur réel (globe, panneaux, recherche, i18n, a11y, mobile)
```

```bash
TEST_DB=ma_base_test php tests/run.php   # nom de base personnalisé
```

Détails des tests de bout en bout : `tests/e2e/LISEZ-MOI.md`. Playwright
est une dépendance de **développement uniquement** — le site reste sans
étape de build, rien de `node_modules/` n'est déployé.

> Après toute nouvelle migration, **régénérer `sql/schema.sql`**
> (voir `sql/README.md`) : les tests partent de ce fichier et signaleront
> sinon des tables manquantes.

L'intégration continue (`.github/workflows/tests.yml`) exécute les deux
suites sur un service MySQL à chaque *push*.

## Emails

`send_email()` est le point d'entrée unique ; le transport se choisit
dans `.env` via `MAIL_DRIVER` (`log`, `mail`, `brevo`, `mailgun`,
`resend`) sans toucher au code appelant. La configuration DNS (SPF,
DKIM, DMARC) et le diagnostic sont détaillés dans `docs/emails.md`.

```bash
php tools/mail_doctor.php            # contrôle transport + DNS
php tools/mail_doctor.php --to=vous@exemple.com   # + envoi de test
```

## Déploiement

Non couvert ici pour l'instant — étapes détaillées dans `docs/roadmap.md`
(chantier B1 : `.env` serveur, rotation des secrets, migrations 001→006,
enregistrements DNS des emails).
