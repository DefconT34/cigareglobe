# Emails transactionnels et délivrabilité

CigarOdyssey envoie trois messages, tous indispensables au fonctionnement
du compte : confirmation d'adresse, réinitialisation de mot de passe,
notification de contribution à l'administration. Si l'un d'eux tombe
dans les indésirables, le membre est bloqué. Ce document explique le
transport retenu et la configuration DNS qui décide du sort des
messages.

Tout passe par `send_email()` dans [`backend/mailer.php`](../backend/mailer.php).
Aucun code appelant ne connaît le transport : changer de prestataire se
fait dans `.env`, sans toucher à `auth.php` ni à `api.php`.

## Choisir un transport

`MAIL_DRIVER` accepte cinq valeurs.

| Pilote | Usage | Délivrabilité |
|---|---|---|
| `log` | développement — n'envoie rien, écrit dans `backend/cache/mail_outbox.log` | — |
| `mail` | repli | **faible** — pas de DKIM, IP mutualisée |
| `brevo` | API Brevo (ex-Sendinblue) | bonne |
| `mailgun` | API Mailgun | bonne |
| `resend` | API Resend | bonne |

**`mail()` n'est pas un choix viable en production.** La fonction remet
le message au serveur SMTP local de l'hébergement mutualisé : pas de
signature DKIM, et une adresse IP partagée avec des centaines d'autres
sites dont la réputation n'est pas la vôtre. Gmail et Outlook classent
massivement ces messages en spam. Elle reste comme filet de sécurité :
si un pilote HTTP est demandé sans clé d'API, `mailer.php` retombe
dessus plutôt que de laisser les inscriptions échouer en silence.

**Recommandation : Brevo.** Société française, hébergement UE, offre
gratuite de 300 emails par jour — très au-delà du volume attendu — et
une API HTTP simple qui ne demande aucune dépendance PHP supplémentaire
(o2switch fournit cURL). Mailgun et Resend sont équivalents
techniquement ; Resend est le plus simple à configurer, Mailgun le plus
outillé pour l'analyse.

## Configuration

Dans `.env` :

```
MAIL_DRIVER=brevo
MAIL_API_KEY=xkeysib-...
MAIL_FROM=noreply@votredomaine.com
MAIL_FROM_NAME=CigarOdyssey
MAIL_REPLY_TO=contact@votredomaine.com
MAIL_LOG_ONLY=false
```

Points d'attention :

- **`MAIL_FROM` doit être sur le domaine vérifié chez le prestataire.**
  Une adresse `@gmail.com` en expéditeur sera rejetée : le domaine
  d'envoi doit être aligné avec la signature DKIM (exigence DMARC).
- **`MAIL_REPLY_TO` : mettez une adresse réellement relevée**, ou
  laissez le champ vide. Un `Reply-To` pointant vers `noreply@` est
  compté comme un signal négatif par plusieurs filtres.
- Mailgun dans l'UE : ajoutez `MAILGUN_HOST=api.eu.mailgun.net`.
- `MAIL_LOG_ONLY=true` reste prioritaire sur tout le reste : c'est ce
  qui garantit qu'aucun email ne part depuis un poste de développement
  ou depuis la suite de tests.

### ⚠ Sous WAMP : PHP n'a pas de magasin d'autorités

Le premier envoi réel a échoué ainsi :

```
brevo — HTTP 0 : SSL certificate problem: unable to get local issuer certificate
```

Ce n'est **pas** un problème de clé, de DNS ni de prestataire. Sur une
installation WAMP, `curl.cainfo` et `openssl.cafile` sont vides dans
`php.ini` : PHP ne peut vérifier **aucun** certificat TLS, et tous les
pilotes HTTP échouent donc au même endroit. Le `curl` en ligne de
commande, lui, passe — il a son propre magasin, d'où la confusion.

Le remède, dans `php.ini` (un magasin est livré avec phpMyAdmin) :

```ini
curl.cainfo = "C:/wamp64/apps/phpmyadmin5.2.1/vendor/composer/ca-bundle/res/cacert.pem"
```

**Ne jamais désactiver la vérification TLS pour contourner ceci.** Ce
serait transformer un test de délivrabilité en test de rien du tout, et
la ligne survivrait au déploiement.

Le défaut est propre à Windows : un hébergement Linux a le magasin du
système, et n'y est pas exposé.

## Ce qui a été vérifié en production

Configuration retenue : **Brevo**, domaine authentifié par CNAME
(`brevo1._domainkey`, `brevo2._domainkey`), code de vérification en TXT.

Deux pièges rencontrés à la pose, tous deux du même genre — **un
enregistrement existait déjà** :

- **DMARC** : l'hébergeur en avait posé un (`v=DMARC1; p=none;`). Deux
  enregistrements `_dmarc` rendent les deux invalides : il faut
  **modifier** l'existant, pas en ajouter un second.
- **SPF** : idem, un seul est permis par domaine. Celui de l'hébergeur
  reste tel quel — l'authentification par CNAME n'en a pas besoin, c'est
  DKIM qui fait passer DMARC.

Résultat mesuré, message reçu chez Gmail : `dkim=pass` avec
`domain=thecigarodyssey.com`, `dmarc=pass`, **boîte principale**.

Un diagnostic vert ne prouve que la configuration. Seul l'en-tête d'un
message réellement reçu prouve la délivrabilité — `mail_doctor.php`
lit le DNS, il ne lit pas la boîte du destinataire.

## Les trois enregistrements DNS

C'est ici que se joue la délivrabilité, bien plus que dans le choix du
prestataire. Les trois sont à publier chez votre registrar sur le
domaine de `MAIL_FROM`.

### SPF — qui a le droit d'envoyer pour ce domaine

Un unique enregistrement TXT sur le domaine :

```
v=spf1 include:spf.brevo.com ~all
```

Un domaine ne doit porter **qu'un seul** `v=spf1`. Si vous en avez
déjà un (hébergeur, messagerie), fusionnez les `include:` dedans plutôt
que d'en ajouter un second — deux enregistrements font échouer la
vérification. Terminez par `~all` (souple) ou `-all` (strict), jamais
`+all` qui autorise le monde entier à usurper votre domaine.

Valeurs selon le prestataire : `include:spf.brevo.com`,
`include:mailgun.org`, `include:amazonses.com` (Resend).

### DKIM — la signature cryptographique

Le prestataire fournit un ou plusieurs enregistrements à publier sur
`<sélecteur>._domainkey.votredomaine.com`. Brevo en donne deux
(`brevo1`, `brevo2`), Resend un (`resend`), Mailgun un (`mailo` ou un
sélecteur personnalisé). Copiez-les tels quels depuis l'interface du
prestataire : la clé publique ne se devine pas.

C'est DKIM qui fait la différence la plus nette sur le classement en
boîte de réception, parce qu'il survit aux redirections là où SPF ne
survit pas.

### DMARC — la politique en cas d'échec

Un TXT sur `_dmarc.votredomaine.com` :

```
v=DMARC1; p=none; rua=mailto:dmarc@votredomaine.com
```

Depuis février 2024, **Gmail et Yahoo exigent un enregistrement DMARC**
pour accepter du courrier automatisé. Commencez en `p=none`
(surveillance seule, aucun message rejeté), lisez les rapports agrégés
reçus sur l'adresse `rua` pendant deux à trois semaines, puis passez à
`p=quarantine` une fois certain que tous vos envois légitimes passent.

## Vérifier

```bash
php tools/mail_doctor.php
```

Le script affiche le pilote effectivement retenu, contrôle SPF, DKIM et
DMARC sur le domaine de `MAIL_FROM`, et sort en code 1 si un problème
bloquant subsiste. Deux garde-fous évitent les faux diagnostics : il
refuse de conclure si le résolveur DNS est injoignable, et détecte les
résolveurs qui répondent à n'importe quel nom (box opérateur, DNS
captif) — dans ces deux cas il signale que les vérifications sont
ignorées plutôt que d'annoncer des enregistrements absents.

**Lancez-le depuis le serveur de production.** Depuis un poste de
travail, le résolveur local fausse fréquemment les résultats.

Pour un test de bout en bout :

```bash
php tools/mail_doctor.php --to=votre@adresse.com
```

Ouvrez ensuite le message reçu et, chez Gmail, « Afficher l'original » :
les trois lignes `SPF`, `DKIM` et `DMARC` doivent indiquer `PASS`. Un
`DKIM: FAIL` ou un `DMARC: FAIL` alors que les enregistrements existent
signale presque toujours un `MAIL_FROM` sur un domaine différent de
celui qui est signé.

## En développement

`MAIL_LOG_ONLY=true` dans `.env` : rien ne part, tout est écrit dans
`backend/cache/mail_outbox.log`. C'est là qu'on récupère les liens de
confirmation et de réinitialisation pour tester le parcours de compte
sans boîte mail. La suite de tests fonctionne sur ce principe.

Ce journal s'accumule d'une session à l'autre ; videz-le si vous vous
perdez dans les jetons.


## Les emails que le site envoie

| Quand | Clés `mail_i18n()` | Coupable depuis le profil ? |
|---|---|---|
| Vérification d'adresse, mot de passe oublié | (gabarits d'`auth.php`) | non — indispensables |
| Contribution approuvée | `appr_*` | non |
| **Rendez-vous dans deux jours** | `evt_rappel_*` | **non** |
| **Rendez-vous annulé** | `evt_annul_*` | **non** |

Les deux derniers ne se coupent pas, volontairement : ils portent une
information que l'inscrit **ne peut pas deviner**, alors qu'il a bloqué
une soirée. Tout le reste des notifications communautaires (réponses,
mentions) sera, lui, réglable — c'est l'étape 4 de `docs/communaute.md`.

### Le rappel J-2 est une tâche planifiée

```bash
php tools/forum_rappels.php            # envoie
php tools/forum_rappels.php --dry-run  # liste qui recevrait quoi, sans envoyer
```

Sur o2switch (cron du cPanel), une ligne quotidienne :

```
0 9 * * * /usr/local/bin/php /home/<compte>/<site>/tools/forum_rappels.php
```

`forum_attendance.reminded_at` garantit qu'un rappel ne part **qu'une
fois** : sans lui, un cron horaire enverrait vingt-quatre emails par
jour et par inscrit — de quoi faire classer le domaine en spam pour de
bon. Un envoi qui échoue n'est pas marqué : le passage suivant
réessaiera.

Le **passage en « passé »** d'un rendez-vous, lui, n'a pas besoin de
cron : il se rattrape à la lecture de l'agenda. Un statut qui dépend
d'une horloge doit se corriger tout seul, sinon un cron oublié laisse un
agenda plein de rendez-vous d'avant-hier annoncés comme « à venir ».

## Ce qui est déjà pris en charge côté code

Sans intervention de votre part, `send_email()` :

- génère une **alternative texte** à partir du HTML, en explicitant les
  liens (`Confirmer mon email : https://…`) — un message HTML seul est
  pénalisé par les filtres ;
- construit un **multipart/alternative** valide pour le repli `mail()`,
  avec en-têtes `Date`, `Message-ID`, `Auto-Submitted`, sujet encodé en
  RFC 2047 et enveloppe d'expéditeur (`-f`) alignée sur `MAIL_FROM`
  pour que le `Return-Path` corresponde au domaine SPF ;
- **réessaie une fois** après une panne passagère (réseau, HTTP 429 ou
  5xx) sur les pilotes HTTP ;
- **ne divulgue jamais** l'erreur de transport au client : les échecs
  partent dans `mail_outbox.log` et restent lisibles via
  `mail_last_error()` côté serveur.
