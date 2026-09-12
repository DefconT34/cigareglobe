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

## 0. L'ordre, quand une migration accompagne du code

Le dépôt est cloné **hors** de la racine web (`~/repositories/cigareglobe`)
et recopié vers `public_html` par `.cpanel.yml`. Une mise à jour compte
donc **trois** gestes, et leur ordre n'est pas libre :

```bash
cd ~/repositories/cigareglobe && git pull          # 1. le dépôt
# 2. la recopie : cPanel → Git™ Version Control → Deploy HEAD Commit
mysql --default-character-set=utf8mb4 -u <user> -p <base> < sql/migrations/<n>.sql
php ~/public_html/tools/prevol.php                # 4. le contrôle, SUR LE SERVEUR
```

### ⚠ Le quatrième geste n'est pas facultatif

`prevol.php` est le **seul outil de ce dépôt qui lit la base servie**. La
campagne de tests, elle, vérifie la base de développement : une migration
qui ne prendrait pas entièrement laisserait une base juste ici et fausse
là-bas **sans qu'aucun test ne bouge**.

### ⚠⚠ Et la vérification par le Web se heurte à un cache de 5 minutes

Le serveur répond `Cache-Control: public, max-age=300`. Une page demandée
juste après la migration peut donc être servie **telle qu'elle était
avant** — contenu d'hier, en-têtes d'aujourd'hui, aucun indice visible.

**C'est arrivé, et cela a coûté une migration inutile** (la `201`) : deux
fiches paraissaient servies sans leur source, la source était en base
depuis six migrations, et seules les requêtes suivantes — hors cache —
l'ont montré. La sonde qui a tranché n'était pas une page mais la base
elle-même :

```bash
mysql -u <user> -p <base> -e "SELECT acteur_nom, COUNT(*) FROM moderation_log WHERE acteur_nom LIKE 'migration 2%' GROUP BY acteur_nom ORDER BY acteur_nom;"
```

Chaque migration écrit sa trace dans `moderation_log` : ce tableau dit
**exactement** lesquelles ont tourné sur la base servie, et il ne ment
pas, lui.

Pour contrôler une page malgré le cache, il faut le casser :

```bash
curl -sH 'Cache-Control: no-cache' "https://thecigarodyssey.com/marque/<slug>?_=$(date +%s)" | grep -c pg-source
```

### ⚠ La recopie passe par cPanel, JAMAIS par un rsync tapé à la main

L'étape 2 exécute `.cpanel.yml`, qui porte **`--chmod=D755,F644`**. Ce
drapeau n'est pas cosmétique : `rsync -a` recopie les permissions de la
**source**, et le clone de cPanel est en `700`. Un rsync recopié à la main
sans ce drapeau pose `700` sur `public_html`, et Apache — qui n'est pas
propriétaire des fichiers — ne peut plus rien lire.

Le symptôme ne parle pas de permissions, ce qui fait perdre le plus de
temps :

```
Forbidden — You don't have permission to access this resource.
Server unable to read htaccess file, denying access to be safe
```

Apache refuse **tout le site** parce qu'il ne peut pas lire un
`.htaccess` : ne sachant pas ce que ce fichier lui aurait interdit, il
interdit. Les fichiers sont intacts, la base est juste, le site est noir.

**C'est arrivé.** Une commande rsync donnée de mémoire, sans relire
`.cpanel.yml`. Réparation :

```bash
chmod 755 <racine> && find <racine> -type d -exec chmod 755 {} + \
  && find <racine> -type f -exec chmod 644 {} +
```

`prevol.php` porte désormais le constat `permissions`, **bloquant**, qui
vérifie le bit de lecture des autres sur la racine servie, les cinq
`.htaccess` et les trois points d'entrée. C'est le seul outil qui tourne
sur le serveur, donc le seul d'où ce défaut soit visible — les
permissions du dépôt de développement n'ont aucun rapport avec celles de
`public_html`.

**Le code d'abord, la migration ensuite.** La règle vient d'un cas réel :
la migration 149 vide la colonne `maps_url`, dont l'ancien code se sert
pour afficher le bouton « Google Maps ». Appliquée avant la recopie, elle
a laissé le site sans aucun lien de carte — la donnée retirée, et le code
qui la lisait encore en place.

L'inverse est sans danger : du code neuf devant une base pas encore
migrée lit des colonnes qui existent déjà. C'est le retrait qui blesse,
jamais l'ajout.

Une migration qui ne fait qu'ajouter ou corriger des lignes se passe
dans n'importe quel ordre. Celles qui **retirent** — colonne vidée,
table supprimée, valeur mise à NULL — se lancent après.

### ⚠ Le Deploy HEAD Commit peut ne rien copier — et ne le dit pas

**C'est arrivé deux fois la même semaine** (11 et 12 septembre 2026). Le
bouton de cPanel a rendu la main sans erreur, la migration avait tourné,
`prevol.php` était vert — et `public_html/assets/js/search.js` était
toujours celui de la veille : 28 436 octets contre 28 978 dans le dépôt.
Une réparation de la recherche déployée « avec succès » ne cherchait
toujours rien. Les deux fois, **relancer le Deploy a suffi**.

La cause n'est pas établie. L'hypothèse la plus plausible : cPanel refuse
silencieusement de déployer un clone dont l'arbre de travail n'est pas
propre — un fichier modifié sur le serveur, un `.env` ou une sortie
d'outil qui traîne — et ne l'écrit nulle part. D'où le geste ajouté
**avant** le bouton :

```bash
cd ~/repositories/cigareglobe && git pull && git status --short
```

Si la seconde commande affiche quoi que ce soit, le régler avant de
cliquer (`git stash`, ou supprimer le fichier étranger). Puis, **après**
le bouton, ne pas croire cPanel sur parole — comparer le dépôt et la
racine servie sur ce que le commit a touché :

```bash
diff -rq ~/repositories/cigareglobe/assets ~/public_html/assets ; diff -rq ~/repositories/cigareglobe/backend ~/public_html/backend
```

Rien en sortie : la recopie a eu lieu. Une ligne `Files … differ` : le
Deploy n'a pas copié, le relancer. Depuis l'extérieur, la même chose se
lit dans l'en-tête `Last-Modified` — un fichier daté de la veille alors
que le commit est du jour n'a pas été recopié :

```bash
curl -sI "https://thecigarodyssey.com/assets/js/search.js?_=$(date +%s)" | grep -i last-modified
```

Le cache de 5 minutes ne s'applique pas ici : `Last-Modified` est la date
du fichier sur le disque, pas celle de la réponse. Et le JS est servi
avec `max-age=604800` — une semaine — donc une page qui tourne encore
mal après un Deploy réussi peut simplement tenir l'ancien fichier en
cache navigateur ; la chaîne de requête unique (`?_=…`) contourne cela.

L'ordre complet, avec ce cinquième geste inséré, devient :

```bash
cd ~/repositories/cigareglobe && git pull && git status --short   # 1. le dépôt — et il doit être propre
# 2. la recopie : cPanel → Git™ Version Control → Deploy HEAD Commit
diff -rq ~/repositories/cigareglobe/assets ~/public_html/assets     # 2b. la recopie a-t-elle eu lieu ?
mysql --default-character-set=utf8mb4 -u <user> -p <base> < sql/migrations/<n>.sql
php ~/public_html/tools/prevol.php                                   # 4. le contrôle, SUR LE SERVEUR
```

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
mysql --default-character-set=utf8mb4 -u <user> -p <base> < sql/schema.sql
mysql --default-character-set=utf8mb4 -u <user> -p <base> < sql/contenu.sql
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


---

## ⚠ `--default-character-set=utf8mb4` n'est pas facultatif

Le drapeau ivoirien 🇨🇮 est arrivé en production sous la forme de **huit points
d'interrogation**, alors que la colonne est en `utf8mb4` et que la valeur était
intacte en développement (`HEX()` donnait `F09F87A8F09F87AE`).

La cause n'est ni le fichier ni la colonne : **c'est le client**. Un
`mysql < migration.sql` sans jeu de caractères explicite ouvre la connexion dans
le jeu par défaut du serveur, souvent `utf8` — celui de MySQL, qui ne code que
**trois octets**. Tout caractère sur quatre octets y est remplacé, octet par
octet, par `?`.

**Le partage des dégâts est contre-intuitif** : l'arabe, le chinois et les
accents français (un à trois octets) passent sans une égratignure ; seuls les
emoji tombent. Un contrôle qui vérifierait « le texte s'affiche » conclurait que
tout va bien.

`tools/prevol.php` porte maintenant un constat **bloquant** sur les drapeaux
abîmés — c'est le seul outil qui tourne sur le serveur, donc le seul d'où le
dégât est visible.

Et une réparation ne doit **jamais** réécrire le caractère : elle repasserait par
la même connexion. On écrit les octets en hexadécimal ASCII —
`CONVERT(UNHEX('…') USING utf8mb4)` — pour que le fichier ne contienne plus rien
qu'un jeu de caractères puisse abîmer. Voir la migration `168`.

---

## ⚠ MariaDB n'est pas MySQL : pas de fonction `JSON_*` dans une migration

Le poste de développement tourne sous **MySQL**, o2switch sous **MariaDB**. Leurs
fonctions JSON ne se comportent pas pareil.

La migration `178` reconstruisait `producer_countries.brands` avec `JSON_TABLE`
puis `JSON_ARRAYAGG`. Sur MySQL, la colonne garde son type à travers la table
dérivée et le résultat est un tableau d'**objets**. Sur MariaDB, le type se perd
et l'agrégat empile des **chaînes** :

```
"{\"desc\": \"Opus X…\", \"name\": \"Arturo Fuente\", \"iconic\": true}"
```

*(l'espace après les deux-points est la signature de MariaDB)*

**La migration passait toute la campagne en local et cassait la page en ligne.**
Et le symptôme était trompeur : `brandCard()` fait `b.name.replace(...)`, la
`TypeError` interrompait la construction du `innerHTML`, et le panneau du pays
restait **blanc** — production, revenus, climat et sols compris. Huit blocs justes
emportés par une liste.

**La règle** : dans une migration, un tableau JSON s'écrit **en toutes lettres**,
comme une chaîne littérale. Aucun moteur ne peut interpréter de travers
`'["Tiébissou","Didiévi"]'`.

`tools/prevol.php` porte un constat **bloquant** sur les tableaux `brands` mal
formés — c'est le seul outil qui tourne sur le serveur, donc le seul d'où la
divergence est visible.

---

## Search Console et Bing : la vérification de propriété

Les deux moteurs demandent de prouver qu'on possède le domaine. Le jeton n'est
pas un secret — il est public par construction — mais il change de compte en
compte : il vit donc dans le `.env` du serveur, jamais dans le dépôt.

```
VERIF_GOOGLE=le_jeton_donné_par_Google
VERIF_BING=le_jeton_donné_par_Bing
```

**Coller le jeton SEUL, pas la balise entière.** Google affiche
`<meta name="google-site-verification" content="ABC…" />` ; ce qui va dans le
`.env`, c'est uniquement le contenu de `content`. Le code pose la balise.

### ⚠ Deux pièges, rencontrés tous les deux

1. **La balise doit être posée par `index.php` autant que par `page.php`.** Les
   moteurs vérifient **la page d'accueil**, servie par `index.php`. Une balise
   posée seulement dans `page.php` échouerait à la vérification tout en étant
   bien présente dans le code — introuvable seulement à l'adresse contrôlée.

2. **La clé du cache d'accueil porte les jetons.** `index.php` sert l'accueil
   depuis un cache-fichier dont la clé est faite de dates de modification.
   Éditer le `.env` ne touche aucun fichier source : sans cette précaution, le
   cache aurait continué à servir une accueil sans balise, indéfiniment.

Six assertions de la campagne tiennent ces deux points.

### Vérifier depuis l'extérieur

```bash
curl -s "https://thecigarodyssey.com/?_=$(date +%s)" | grep -o 'google-site-verification[^>]*'
```

Puis, dans Search Console, soumettre le plan de site :
`https://thecigarodyssey.com/sitemap.xml`
