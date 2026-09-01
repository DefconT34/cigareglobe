# Mise en ligne sur o2switch

Procédure exacte pour `thecigarodyssey.com`. Elle suppose acquis ce qui
l'est déjà : domaine, DNS, certificat Let's Encrypt, chaîne email
vérifiée.

**Le juge de paix est `php tools/prevol.php`.** Il sort en 0 quand le
site est en état de partir, en 1 sinon, et il dit lequel des points
bloque. Tout ce document sert à l'amener à 0.

---

## 0. Ce qui doit être vrai avant de commencer

```bash
php tools/prevol.php --autotest    # les contrôles eux-mêmes sont sains
php tests/run.php                  # 499 vérifications, 0 échec
```

Côté serveur, vérifié depuis l'extérieur :

```bash
curl -sI https://thecigarodyssey.com | head -1        # 200, pas d'erreur TLS
```

---

## En une commande, une fois le code sur place

Une clé SSH du serveur vers GitHub étant posée, tout se ramène à ceci —
**exécuté sur le serveur**, jamais depuis le poste :

```bash
git clone git@github.com:DefconT34/cigareglobe.git    # la première fois
cd cigareglobe
# créer le .env (section 4), transférer uploads/ (section 2), puis :
php tools/deployer.php --installer                    # pose la base
```

Et pour chaque mise à jour ensuite :

```bash
php tools/deployer.php                                # git pull + contrôles
```

`deployer.php` **refuse d'installer sur une base non vide**.
`sql/schema.sql` commence par des `DROP TABLE` : rejoué par réflexe à six
mois d'intervalle, il effacerait les comptes, les avis, les messages et
le journal — tout ce que le dépôt ne porte pas, et donc tout ce qu'un
`git pull` ne rendra jamais.

Les sections qui suivent détaillent chaque étape, pour le cas où l'outil
signale un manque.

## 1. Le code

Deux voies. La première est préférable : elle rend les mises à jour
suivantes triviales.

**Par Git (recommandé)** — cPanel → *Git™ Version Control* → *Create* :

| | |
|---|---|
| Clone URL | `https://github.com/DefconT34/cigareglobe.git` |
| Repository Path | `/home/<compte>/repositories/cigareglobe` |

Le dépôt étant **privé**, cPanel demandera un jeton d'accès GitHub
(*Settings → Developer settings → Personal access tokens*, portée `repo`
en lecture). Puis déployez le contenu vers le dossier du domaine.

Les mises à jour suivantes se font alors par un `git pull`, sans
retransférer 500 fichiers.

**Par FTP** — déposez le contenu du dépôt dans le dossier du domaine.
N'envoyez **pas** `.git/`, `node_modules/`, `tests/`, `.env`.

## 2. `uploads/` — 27 Mo qui ne sont pas dans Git

```
uploads/   4 491 fichiers
```

Ce dossier ne sera **jamais** dans le dépôt : ce sont des images, et un
dépôt n'est pas un entrepôt. Il se transfère par FTP, ou s'extrait de la
sauvegarde (`tools/sauvegarde.php`).

Sans lui, les fiches montrent des cadres vides — sans qu'aucune erreur
ne le signale.

## 3. La base — l'ordre compte

Créez la base et son utilisateur dans cPanel → *MySQL® Databases*, puis
depuis phpMyAdmin ou le terminal :

```bash
mysql -u <user> -p <base> < sql/schema.sql       # les tables
mysql -u <user> -p <base> < sql/contenu.sql      # l'atlas : 500 lounges, 118 marques
mysql -u <user> -p <base> < sql/migrations/016_forum_amorce.sql
```

**La troisième ligne n'est pas facultative.** Les rubriques du forum
viennent de `contenu.sql`, mais les sujets d'amorce et le compte « La
Régie » qui les signe vivent dans les tables personnelles, exclues du
dépôt à dessein. Sans `016`, le forum ouvre avec huit rubriques et zéro
sujet.

L'ordre importe aussi : les avis et les messages référencent des
établissements et des rubriques qui doivent exister d'abord.

## 4. Le `.env` de production

À créer à la racine du site — jamais transféré depuis le poste de
développement, dont les valeurs sont volontairement différentes.

```ini
DB_HOST=localhost
DB_NAME=<base o2switch>
DB_USER=<utilisateur>
DB_PASS=<mot de passe>
DB_CHARSET=utf8mb4

SITE_URL=https://thecigarodyssey.com
ALLOWED_ORIGIN=https://thecigarodyssey.com,https://www.thecigarodyssey.com

ADMIN_EMAIL=contact@thecigarodyssey.com
ADMIN_KEY=<voir ci-dessous>

MAIL_DRIVER=brevo
MAIL_API_KEY=<clé Brevo>
MAIL_FROM=noreply@thecigarodyssey.com
MAIL_FROM_NAME=CigarOdyssey
MAIL_REPLY_TO=contact@thecigarodyssey.com
MAIL_LOG_ONLY=false

APP_DEBUG=false
TRUSTED_PROXIES=
```

**`ADMIN_KEY` se génère sur le serveur**, pas ailleurs :

```bash
php tools/cle.php
```

Deux environnements, deux clés. Recopier celle du poste de
développement, c'est faire dépendre la production d'une machine qui
n'est pas protégée comme elle.

**`TRUSTED_PROXIES` reste vide** : le site est servi en direct. Renseigné
à tort, il rouvrirait le trou que le chantier A4 a fermé — les plafonds
de connexion et de contribution se contourneraient par un simple
en-tête.

## 5. Le verdict

```bash
php tools/prevol.php
```

Tant qu'il ne sort pas en 0, ne pas ouvrir au public. Il lit le `.env`
réel et refuse notamment un `MAIL_LOG_ONLY=true` — le réglage qui laisse
le site parfaitement fonctionnel en apparence, et empêche toute
inscription puisque aucun email de vérification ne part.

## 6. Le cron

cPanel → *Tâches Cron*, une fois par jour :

```
php /home/<compte>/<domaine>/tools/forum_rappels.php
```

Sans lui, aucun rappel de rendez-vous ne part. `reminded_at` garantit
qu'un rappel ne part qu'une fois : un cron horaire enverrait vingt-quatre
messages par jour et par inscrit.

---

## Après la mise en ligne — trois vérifications

**1. HSTS.** Le seul contrôle impossible en local, faute de TLS :

```bash
curl -sI https://thecigarodyssey.com | grep -i strict-transport
```

Attendu : `strict-transport-security: max-age=31536000`.

**2. La chaîne d'inscription, de bout en bout.** Créez un compte avec
une adresse Gmail réelle et attendez l'email. C'est la seule preuve que
l'inscription fonctionne — `mail_doctor.php` lit le DNS, il ne lit pas
la boîte du destinataire.

**3. Les mentions légales.** Ouvrez `/legal.php` : l'adresse de contact
doit s'afficher, et non « adresse non renseignée ». Si c'est le cas,
`ADMIN_EMAIL` manque au `.env`.

## Et ce qui ne relève pas du serveur

- **La sauvegarde** (`tools/sauvegarde.php`) doit être déposée **hors de
  la machine** qui la produit. Une sauvegarde restée à côté de ce qu'elle
  protège ne protège de rien.
- **L'identité de l'éditeur** doit être déposée chez o2switch : c'est la
  condition du régime de l'éditeur particulier déclaré dans `legal.php`.
  Sans elle, la dispense d'affichage du nom et de l'adresse tombe.
- **DMARC en `p=none`** signifie « surveille, n'applique rien ». C'est le
  bon réglage au démarrage ; passez à `p=quarantine` une fois les
  rapports propres.
