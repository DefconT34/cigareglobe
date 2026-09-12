# CigarOdyssey — feuille de route

Suivi des chantiers. Après chaque chantier terminé : cocher ici, puis
re-présenter la liste restante et suggérer le point suivant.
Effort : P = Petit · M = Moyen · G = Gros.

## ✅ Fait
- Phase 0 : mise sous Git, `.gitignore`, schéma reconstruit, retrait OLD/debug, bugs B1/B2
- Phase 1 : centralisation des URLs API (relatives `/backend`)
- Config par `.env` (secrets hors code)
- Espace client A→D : auth · contributions/avis · favoris/listes · profil/passeport/badges
- Local sur base réelle `qffk5199_cigare` (aucun lien o2switch)
- Globe : perf (cache thème) · a11y (reduced-motion) · pause boucle · halo · étiquettes · inertie · fondu limbe
- **C2** : vrai schéma SQL (`sql/schema.sql` via mysqldump, 19 tables) + `sql/README.md` à jour
- **C3** : README projet (lancement local, structure, endpoints, base, déploiement)
- **C1** : externalisation du front — CSS (3 fichiers) + JS (23 modules) sortis d'index.html (7826 → 373 lignes), 27 fichiers dans assets/. Zéro régression.
- **D3** : champ email redondant retiré du formulaire de contribution (backend utilise l'email du compte)
- **D5** : zoom molette centré sur le curseur (ancrage exact du point géographique, repli propre)
- **D2** : contributeur de confiance — promotion auto au seuil, publication directe, plafond relevé, badge
- **D1** : modération des avis — signalement membre, onglet admin, logique d'approbation factorisée (moderation_lib)
- **A1** : clé admin hors URL — auth par session, CSRF sur les actions, clé retirée du JS
- **D4** : globe accessible — pilotage clavier, focus visible, liste « Explorer sans le globe » équivalente
- **E1+E2** : data.php sans DESCRIBE (+7 tests), topojson/carte auto-hébergés, GA retiré, CSP resserrée
- **C4** : tests de fumée API (50 vérifications, base dédiée) + workflow CI
- **A3** : revue sécurité — XSS stocké corrigé (échappement + URLs), fuites d'erreurs colmatées, CSP + Permissions-Policy, CORS/credentials assaini
- **E3** : frontières réelles pour les pays producteurs (table `country_polygons` supprimée, migration 005)
- **E4** : audit géométrique des 152 points du globe — 2 coordonnées corrigées (migration 006)
- **C5** : tests de bout en bout Playwright (36 parcours : globe, panneaux, recherche, Explorer, langues, a11y, mobile) + jeu de donnees versionne + CI
- **F4** : contenu de l'atlas traduit — pays, marchés, zones et Habanos à 100 % dans les 6 langues ; traduction par motifs pour les valeurs chiffrées
- **F6** : référencement multilingue — URLs par langue (`/en/`…), hreflang, sitemap, `index.php` qui sert le bon en-tête
- **F3** : colonnes de traduction du contenu (migration 007) + repli dans `data.php`
- **F5** : RTL arabe vérifié, infobulle bornée à la fenêtre
- **F2** : messages du serveur — 35 codes stables, traduits côté front par `tErr()`, jamais par PHP
- **F1** : interface entièrement traduite — 102 clés dans 6 langues, 12 modules câblés, 3 modules qui ne se retraduisaient jamais corrigés
- **F7** : garde-fous multilingues — parité des clés, couverture du contenu en base, balayage des 6 langues à cliquet, RTL `#side-fabs` corrigé
- **A2** : CORS restreint — liste d'origines comparées exactement, `photos.php` rallié, 11 vérifications
- **B3** : nom & domaine unifiés — CigarOdyssey partout (backend, emails, SEO, manifeste, CI, docs) · *domaine revu en B8*
- **B8** : domaine acheté — `thecigarodyssey.com`, posé dans 14 fichiers + migration `131` (La Régie et 60 `lounges.source`) ; la marque, elle, ne bouge pas
- **B2** : email transactionnel — pilotes Brevo/Mailgun/Resend derrière `send_email()`, alternative texte, multipart, diagnostic SPF/DKIM/DMARC (`tools/mail_doctor.php`), `docs/emails.md`
- **E1e** : le modérateur — `admin_scope()` (portée `admin` / `moderator`), écran de nomination, journal de modération (migration 130), retrait réversible d'une photo, 51 vérifications
- **A4** : l'adresse du visiteur ne se déclare plus soi-même — `TRUSTED_PROXIES`, chaîne `X-Forwarded-For` lue depuis la droite, trois exemplaires de la fonction réduits à un, 18 vérifications
- **B7** : contrôle d'avant-vol — `php tools/prevol.php` refuse le décollage tant que le `.env` porte des valeurs de développement ; 17 environnements construits en garantissent la justesse
- **B4b1** : sauvegarde de ce que Git ne porte pas — `tools/sauvegarde.php` (uploads + 20 tables personnelles), **restauration éprouvée** : 9 234 lignes, 0 écart ; le garde-fou de destination vise la racine servie, pas seulement Git
- **B4a** : le contenu de l'atlas entre dans le dépôt — `sql/contenu.sql` (17 tables, 5 Mo) engendré par `tools/contenu_dump.php`, sans aucune donnée personnelle ; reconstruction vérifiée octet pour octet

## ⏳ À faire

### A. Sécurité & robustesse
- [x] ~~**A1** — Clé admin hors URL (session + CSRF)~~ ✅
- [x] ~~**A2** — CORS restreint au domaine réel (liste d'origines, `*` en local)~~ ✅
- [x] ~~**A3** — Revue de sécurité (XSS stocké, fuites d'erreurs, CSP, CORS)~~ ✅
- [x] ~~**A4** — L'adresse du visiteur ne se déclare plus soi-même~~ ✅
  - `client_ip()` lisait `CF-Connecting-IP`, puis `X-Forwarded-For`, puis `X-Real-IP`, et ne
    retombait sur `REMOTE_ADDR` qu'en dernier. **Ces trois en-têtes sont écrits par
    l'appelant.** Servi en direct — le cas sur un mutualisé —, le site retenait donc une
    adresse choisie par celui qu'il cherchait à brider : un en-tête différent à chaque
    requête, et plus aucun plafond ne mordait (connexions, contributions, cadences du forum)
  - Nouvelle règle : `REMOTE_ADDR` par défaut, les en-têtes lus **seulement** si
    `REMOTE_ADDR` figure dans `TRUSTED_PROXIES` (vide par défaut, et c'est le bon réglage)
  - La chaîne `X-Forwarded-For` se lit **depuis la droite** en sautant les maillons connus :
    chaque relais ajoute à droite, donc lire à gauche retenait la valeur forgée **jusque
    derrière un vrai proxy** — le trou restait ouvert là même où l'en-tête est légitime
  - **Trois exemplaires** de cette fonction coexistaient (`auth_lib`, `api`, `photos`) et les
    trois faisaient confiance au client ; celle de `photos.php` ne découpait même pas la
    liste. Une seule fait foi désormais
  - 18 vérifications (424 → 442), dont la contre-épreuve : un second serveur lancé avec
    `TRUSTED_PROXIES=127.0.0.1` doit au contraire **honorer** l'en-tête. Refuser un en-tête ne
    prouve pas qu'on sait le lire

### B. Déploiement
- [x] ~~**B1** — Mise en ligne o2switch~~ ✅
  - ⚠ Le décompte disait « 001→072 » : il y a **130** migrations.
  - **`php tools/prevol.php` décide.** Il sort en 1 tant qu'un point bloque. ⚠ **Lancé sur le
    poste de développement, il sortira toujours en 1** — `MAIL_LOG_ONLY`, `SITE_URL` locale,
    `ALLOWED_ORIGIN` ouvert sont les valeurs justes *en local*. Il ne juge que le serveur.
  - Le site sert `200` sur `https://thecigarodyssey.com`, plan de site à 725 URLs
  - Déploiement par **cPanel Git™ Version Control** : dépôt cloné dans
    `~/repositories/cigareglobe`, recopié vers `public_html` par `.cpanel.yml`. `public_html`
    n'est donc **pas** une copie de travail Git — `git pull` s'y lance dans le dépôt, jamais
    dans la racine servie
  - Le `.env` n'existe que dans `public_html` : les outils qui parlent à la base ne
    fonctionnent pas depuis le dépôt, et c'est voulu
- [x] ~~**B7** — Le contrôle d'avant-vol~~ ✅
  - **Rien n'empêchait de mettre en ligne avec le `.env` du poste de développement.** Relevé
    ici : `MAIL_LOG_ONLY=true`, `SITE_URL=http://127.0.0.1:8099`, `ALLOWED_ORIGIN=*`,
    `ADMIN_EMAIL=dev@example.com`
  - Le premier suffit à **tuer le site sans rien casser de visible** : sans email de
    vérification, personne ne confirme son adresse — donc aucun avis, aucune contribution,
    aucun message. La page s'affiche, le globe tourne, l'espace communautaire est mort-né.
    On l'apprendrait par le message d'un visiteur, comme pour les tuiles CARTO
  - 13 contrôles bloquants, 1 avertissement, 3 rappels (cron, sauvegarde, DNS) — ces derniers
    ne se lisant dans aucun fichier, les taire laisserait croire que le contrôle couvre tout
  - **`legal.php` devient un bloqueur mécanique** : tant qu'il porte « À COMPLÉTER », le
    décollage est refusé. B5c ne peut plus s'oublier
  - **Un contrôle qui ne se prouve pas ne vaut rien.** Lancé ici, il DOIT crier : il ne peut
    donc pas se vérifier en passant au vert. `--autotest` le confronte à 17 environnements
    construits — un propre, seize piégés — et vérifie les deux échecs possibles : ne pas voir
    un défaut, **et** crier sur un réglage sain. Lancé par la campagne (478 vérifications)
- [x] ~~**B4a** — Le contenu de l'atlas entre dans le dépôt~~ ✅
  - **Mesuré avant d'agir** : base vierge construite depuis le seul dépôt → **29 des 31
    tables peuplées revenaient vides**. `data.php?action=globe` renvoyait cinq tableaux
    vides, et la page d'accueil répondait quand même `200`. Un site en ligne, mis en page,
    et creux. `sql/README.md` renvoyait à « un dump séparé, non versionné » **qui n'existait
    pas**, et aucune migration n'insère de `lounges` ni de `brands` — ces tables sont
    antérieures au dépôt
  - `tools/contenu_dump.php` → `sql/contenu.sql` (5,0 Mo, 17 tables). Verse l'éditorial et la
    référence ; laisse dehors **tout ce qui appartient aux gens** — comptes, avis, favoris,
    messages, contributions, journal. Ces tables se sauvegardent, elles ne se versionnent pas
  - **Épreuve** : reconstruite depuis `schema.sql` + `contenu.sql`, la base rend des réponses
    **identiques octet pour octet** sur `globe`, `country` et `brand` — et ne contient
    aucune donnée personnelle
  - L'outil **refuse de tourner** si une table de la base n'est classée ni dans la liste
    versée ni dans la liste exclue : une table ajoutée demain ne peut plus sortir du
    déploiement en silence. `--verifier` tourne à chaque campagne (443 vérifications)
  - Le rejeu des 130 migrations (`tools/rejeu_migrations.php`) a été lancé : ses 29 échecs
    sont le bruit que son propre en-tête annonce — rejeu sur une base qui a déjà tout reçu
- [x] ~~**B4b1** — Sauvegarde de ce que Git ne portera jamais~~ ✅
  - `tools/sauvegarde.php` : archive datée de `uploads/` (4 315 fichiers, 27 Mo) et des
    **20 tables personnelles** — comptes, avis, messages, contributions, journal. 5,1 Mo
    compressés, rotation sur 7 jours
  - **La liste des tables n'est pas recopiée** : elle est lue dans `contenu_dump.php`. Les
    deux outils se partagent la base par construction — ce que l'un verse dans Git, l'autre
    le laisse. Une liste recopiée aurait divergé, et cela se serait vu le jour de la
    restauration, c'est-à-dire le pire jour possible
  - **Restauration éprouvée pour de bon**, pas seulement l'archive relue : base vierge,
    `schema.sql` + `contenu.sql` + le dump de l'archive → **9 234 lignes, 0 écart sur les
    37 tables**, accents intacts, et le site sert des réponses identiques à
    `data.php?action=globe` et `country`
  - Le `.env` en est **absent** : une archive faite pour voyager ne transporte pas le mot de
    passe de la base ni la clé d'administration
  - **Le garde-fou s'est trompé de critère, et le test l'a montré.** Première version : « pas
    dans Git, donc sûr ». Mise à l'épreuve en visant `docs/`, elle a écrit 5 Mo de données
    personnelles dans l'arborescence servie par Apache — le `.gitignore` porte `*.zip`, donc
    invisible pour Git et **téléchargeable par le Web**. Le critère qui compte d'abord est
    d'être hors de la racine servie. 5 cas construits (483 vérifications)
- [ ] **B4b2** — **La sauvegarde tient sur un seul disque** · **bloquant** · P
  - ~~`git remote -v` ne renvoie rien~~ → **réglé** : `origin` pointe sur
    `github.com/DefconT34/cigareglobe`, et le serveur en tire ses déploiements. Le code et le
    contenu versionné sont à deux endroits
  - **Ce qui reste, et qui est le vrai sujet** : `uploads/` (4 507 fichiers, 28 Mo) et les
    20 tables personnelles ne sont dans aucun dépôt, par construction
  - **L'archive a été fabriquée sur le serveur** (5 sept. 2026), dans
    `/home2/koko6788/cigarodyssey-sauvegardes/`, hors de la racine servie — vérifié depuis
    l'extérieur : dix chemins plausibles testés, tous en `404`
  - ⚠ **Elle n'a pas encore été rapatriée.** Tant qu'elle reste sur o2switch elle ne protège
    de rien : elle disparaîtra avec ce qu'elle sauvegarde. Le point reste donc ouvert
  - Une fois le fichier descendu, `php tools/sauvegarde.php --verifier <fichier>` le rouvre
    et le recompte ; le `.env` en est absent par construction (mot de passe de la base et clé
    d'administration ne voyagent pas dans un fichier fait pour être copié ailleurs)
- [x] ~~**B5a** — Le droit à l'effacement (RGPD art. 17)~~ ✅
  - `auth.php` exposait register/login/logout/forgot/reset/resend : **on pouvait s'inscrire
    et pas s'effacer**. La seule porte du site qui n'existait que dans un sens
  - **Le piège** : onze tables portent une clé étrangère qui suit le `DELETE`, mais
    `contributions` n'en porte **aucune** — et garde `contributor_email` et
    `contributor_ip`. Un effacement qui laisse derrière lui l'adresse de celui qui demandait
    à être oublié est pire qu'un effacement absent : il donne la conscience tranquille
  - Le mot de passe est **redemandé** : aucun autre geste du site n'est irréversible
  - Les messages du forum **restent**, signés « Membre supprimé » (`ON DELETE SET NULL`) —
    la règle posée avec le forum, et elle vaut toujours
  - Un administrateur est refusé : il se retrouverait dehors sans que personne le fasse
    rentrer. Arbitrage assumé et écrit : les décisions prises **au titre d'un rôle** gardent
    leur signature au journal ; le reste est anonymisé
  - Email d'adieu envoyé **avant** l'effacement — seule seconde où l'adresse existe encore —
    et qui dit à qui n'a rien demandé que quelqu'un avait accès à sa session
  - 22 vérifications (443 → 465), effacement éprouvé **à l'écran** de bout en bout
- [x] ~~**B5b** — Mentions légales, confidentialité, conditions~~ ✅ *(partiel — voir B5c)*
  - `legal.php` : trois documents, trois ancres, un fichier. Lien dans l'écran d'âge, le seul
    que tout visiteur traverse — ce site n'a pas de pied de page
  - **En français seulement, délibérément** : un texte juridique traduit par la même main que
    la prose de l'atlas engagerait sans que personne n'ait relu ce qu'il engage
  - La politique de confidentialité est **dérivée du schéma réel**, table par table — pas un
    modèle recopié. Elle nomme ce qui reste après une suppression, et pourquoi
- [x] ~~**B5c** — Les faits que seul l'éditeur connaît~~ ✅
  - Les 8 blocs `[[ À COMPLÉTER ]]` ne demandaient pas à être remplis : ils posaient la
    mauvaise question. L'éditeur est une **personne physique non professionnelle**, et
    l'article **6-III-2 de la LCEN** le dispense d'afficher son identité — à condition de
    l'avoir déposée chez l'hébergeur. Le document dit ce régime, et dit qu'il n'est pas
    l'anonymat
  - **DEUX ENCARTS DE CHANTIER ONT ÉTÉ SERVIS AU PUBLIC PENDANT TOUTE LA MISE EN SERVICE** —
    « DEUX POINTS À CONFIRMER », « À VÉRIFIER AVANT LA MISE EN LIGNE ». Ils s'adressaient à
    l'éditeur et c'est le visiteur qui les lisait. Un document juridique qui annonce lui-même
    qu'il n'est pas fini se contredit : le fond était bon, l'encart disait le contraire
  - **Aucun contrôle ne les voyait** : le seul qui lisait ce fichier cherchait
    « À COMPLÉTER », un marqueur qu'ils ne portaient pas. `prevol.php` cherche désormais
    l'**attribut** `class="lg-todo"` — et non la classe CSS, sans quoi il accuserait à jamais
    sa propre feuille de style, faute déjà commise deux fois dans ce projet
  - L'un des deux points s'est **réglé par la mesure** : le serveur dit lui-même
    o2switch (`koko6788@cerisier`, `/home2/koko6788`), et l'adresse *Chemin des Pardiaux* est
    confirmée au registre — ⚠ *boulevard Gustave Flaubert* est l'**ancienne**, celle que la
    mémoire propose. L'autre — l'identité déposée chez l'hébergeur — est devenu un **rappel
    d'avant-vol** : aucun fichier ne peut y répondre
  - Portage des données (RGPD art. 20) : **assumé par écrit**, comme le prévoyait
    l'alternative. Une section dit au visiteur que l'export est manuel et par où le demander
  - 14 vérifications (695 → 709), dont 8 cas construits sur la détection elle-même
  - Une relecture juridique conditionne la traduction des trois documents
- [x] ~~**B6** — HSTS, et les fichiers qui protègent la production~~ ✅
  - **HSTS** : la redirection http→https ne protégeait pas la **première** visite — la
    requête en clair part avant de savoir qu'il fallait chiffrer, et c'est celle-là qu'on
    intercepte. `max-age=31536000`, émis sur TLS seulement
  - **`<If "%{HTTPS} == 'on'">` plutôt que `env=HTTPS`, pour une raison mesurée** : `SetEnvIf`
    ne peut pas définir `HTTPS`, que mod_ssl se réserve. La forme `env=` était donc
    **inéprouvable** — une faute de frappe dans le nom de la variable aurait donné, en local,
    exactement le même silence qu'une directive correcte. L'expression, elle, se vérifie :
    condition inversée à `'off'`, l'en-tête apparaît en clair ; remise à `'on'`, il disparaît
  - **Ni `includeSubDomains` ni `preload`** : la première engage des sous-domaines qui
    n'existent pas encore, la seconde s'inscrit dans les navigateurs eux-mêmes et se retire
    en des mois. Un contrôle **casse** si on les ajoute — pour que ce soit une décision
  - **`uploads/lounges/.htaccess` entre dans le dépôt.** Une exception ne suffisait pas :
    `uploads/*` exclut le dossier, et Git ne descend pas dans un dossier exclu. Il faut
    réadmettre le dossier, réexclure son contenu, puis rouvrir le seul fichier voulu
  - Garde-fou : la campagne vérifie que sept fichiers de production sont suivis — **et
    qu'aucune image de membre ne l'est**. Une exception trop large les ferait entrer par
    milliers, sans que personne le voie avant le premier clone
  - 12 vérifications (465 → 477)
- [x] ~~**B2** — Délivrabilité email (pilotes transactionnels + diagnostic DNS)~~ ✅
- [x] ~~**B9** — La chaîne email éprouvée pour de bon~~ ✅
  - Brevo souscrit, domaine authentifié par CNAME (`brevo1/2._domainkey`), clé posée
  - **Deux enregistrements existaient déjà** et ne devaient pas être dupliqués : le `_dmarc`
    de l'hébergeur (modifié, pas ajouté) et son SPF (laissé intact — l'authentification par
    CNAME n'en a pas besoin, c'est DKIM qui fait passer DMARC). Deux `_dmarc` ou deux SPF
    rendent les deux invalides
  - **Mesuré, pas supposé** : message reçu chez Gmail avec `dkim=pass`
    (`domain=thecigarodyssey.com`), `dmarc=pass`, **boîte principale**
  - Le premier envoi avait échoué sur `unable to get local issuer certificate` — défaut
    **local** : WAMP laisse `curl.cainfo` vide, donc PHP ne vérifie aucun certificat TLS et
    tous les pilotes HTTP tombent au même endroit. Contourné par un magasin d'autorités
    explicite, **jamais** en désactivant la vérification. Documenté dans `docs/emails.md`
  - Rappel tiré de là : un diagnostic vert ne prouve que la configuration. `mail_doctor.php`
    lit le DNS ; il ne lit pas la boîte du destinataire
- [x] ~~**B3** — Nom & domaine unifiés (CigarOdyssey / cigarodyssey.com)~~ ✅ · *débloque A2*
  - ⚠ Le domaine visé alors n'était **pas disponible** — vérifié auprès du registre : déposé
    depuis 2016. Remplacé par `thecigarodyssey.com` en **B8**. L'entrée est laissée telle
    quelle : elle dit ce qui a été fait ce jour-là, pas ce qui est vrai aujourd'hui
- [x] ~~**B8** — Le domaine acheté : `thecigarodyssey.com`~~ ✅
  - **La marque ne change pas.** « CigarOdyssey » reste partout ; seule l'adresse bouge.
    C'est pourquoi 14 fichiers ont suffi là où un rebaptême en aurait touché 65
  - `cigarodyssey.com` est déposé depuis 2016-12-07, **jamais servi** (parking Dotster), et
    en statut `clientHold` — le registrar demande au registre de ne pas le publier dans le
    DNS. C'est ce qui m'avait fait conclure à tort qu'il était libre : l'absence de DNS n'est
    pas l'absence de dépôt, et seul le registre fait foi
  - Le préfixe « the » ne coûte presque rien **ici précisément** : la version canonique ne
    résout vers rien, donc celui qui tape de mémoire tombe sur une erreur, pas sur un
    concurrent. C'est ce qui distingue ce choix d'un tiret ou d'un `.co`
  - **Deux valeurs vivaient en base** (migration `131`) : l'adresse de « La Régie », et
    `lounges.source` de **60 établissements** où le domaine signifie « relevé par nos soins ».
    Y laisser l'ancien nom aurait renvoyé le lecteur vers un site qui n'est pas le nôtre —
    une attribution fausse, pas une coquille
  - `sql/contenu.sql` et `tests/fixtures/atlas.sql` sont **réengendrés**, jamais édités : leur
    en-tête le dit, et une retouche à la main aurait été effacée à la génération suivante

### C. Qualité & structure
- [x] ~~**C1** — Externalisation du front (CSS + 23 modules JS hors index.html)~~ ✅
- [ ] **C1b** — (optionnel) Migration Vite/ESM (build + import/export) · G · à évaluer, non prioritaire · le filet de tests front existe désormais
  - **Son seul bénéfice concret est déjà acquis** : le cache-busting, obtenu en quelques
    lignes dans `index.php`, sans étape de build. Le déploiement reste une copie de fichiers.
  - Ce qu'apporterait encore Vite : dépendances explicites (79 globales → imports), 31 requêtes
    → 3, minification. Réel, mais rentable sur un code qui grossit à plusieurs mains
  - Ce qu'il coûterait ici : le déploiement cesse d'être une copie ; la réécriture des balises
    par `index.php`, l'interception disque de `tests/e2e/statique.js` et le cache du service
    worker sont tous indexés sur les chemins actuels ; et **5 outils PHP lisent `i18n.js`
    comme un fichier texte** — source et bundle pourraient diverger, ce qui est précisément
    la classe de bogues que ce dépôt produit en série
- [x] ~~**C1c** — Cache-busting des fichiers statiques~~ ✅
  - Le `.htaccess` demande **une semaine** de cache sur les JS/CSS : un visiteur déjà venu
    gardait l'ancien script sept jours après une mise en ligne. Le correctif des continents
    du 7 août ne l'aurait atteint qu'une semaine plus tard
  - `index.php` accroche la date de modification à chaque URL (`?v=6a763ab2`), **par fichier** :
    modifier une feuille de style ne fait pas retélécharger les 520 Ko
  - L'empreinte du cache de page couvre désormais tous les statiques — sans quoi la page
    servie aurait gardé l'ancien `?v=` et le cache-busting n'aurait rien busté
- [x] ~~**C2** — Vrai schéma SQL versionné~~ ✅
- [x] ~~**C3** — README + doc d'architecture~~ ✅
- [x] ~~**C4** — Tests de fumée API (50 vérifications) + CI~~ ✅
- [x] ~~**C5** — Tests de bout en bout du front (Playwright) + CI~~ ✅ · *prérequis levé pour C1b*

### D. Fonctionnel / produit
- [x] ~~**D32** — Une cape n'est pas une marque~~ ✅ · migration `023`
  - La fiche du **Cameroun** annonçait « Marques emblématiques » puis listait CAO Cameroon,
    Arturo Fuente Hemingway et Oliva Serie G — trois cigares roulés au Honduras, en
    République dominicaine et au Nicaragua. Aucun n'est camerounais. Ce que le Cameroun leur
    donne, c'est sa **cape**, et leurs articles le disaient déjà (« wrapper importé du
    Cameroun ») : seul le titre de la section prétendait autre chose. Même cas en Équateur,
    et sur une entrée du Brésil et une du Mexique
  - **Trois relations, pas deux** : marque du pays · marque du pays roulée ailleurs · cigare
    à cape d'ici. Le drapeau qu'on voit sur un cigare est souvent celui de son usine ; son
    goût doit beaucoup à un pays qui n'y figure pas. La troisième section le rend lisible,
    avec une phrase d'explication que les deux autres n'ont pas besoin d'avoir
  - **Le critère n'est pas une opinion** : une entrée est « cape » quand SON PROPRE ARTICLE
    dit que la contribution du pays est la cape. Rien n'est déduit
  - Trois cas voisins écartés, et pourquoi : l'**Indonésie** garde ses deux entrées (usines
    déclarées à Java et Sumatra — elles produisent sur place) ; les **États-Unis** gardent
    leurs marques américaines roulées à l'étranger, qui sont l'inverse exact du cas ;
    **Cuba** n'est pas concernée
  - Un pays sans marque à lui n'affiche plus deux sections sous un titre faux : elles
    disparaissent, et la troisième dit ce qu'il en est
  - ~~**Défaut repéré, non corrigé** : « Punch » figure sur la fiche de Cuba *et* sur celle du
    Honduras, mais un seul article existe — le cubain.~~ ✅ **réparé par `024`**
- [x] ~~**D36** — Trois pays producteurs de plus, et trois écartés~~ ✅ · migration `027`
  - L'atlas comptait **douze** pays producteurs ; il en compte **quinze**. Chaque candidat a
    été vérifié sur sources AVANT d'écrire une ligne — c'est la leçon de `026`
  - **Jamaïque.** Dans les années 1960-1970, après l'embargo américain, c'était le premier
    pays du cigare des Caraïbes hors de Cuba. Royal Jamaica (1935) et la manufacture Temple
    Hall de Kingston — **où Macanudo est né** avant de devenir dominicain. Le 12 septembre
    1988, l'ouragan Gilbert détruit l'usine et mille acres de tabac à May Pen ; les marques
    partent en République dominicaine dans l'année. **On peut dater la fin d'une industrie
    nationale au jour près**
  - **Îles Canaries.** La Vuelta Abajo a été colonisée par des paysans canariens : après
    1960, plusieurs familles tabacoles cubaines sont revenues sur la terre de leurs aïeux.
    Benjamín Menéndez ouvre en 1961 la Compañía Insular Tabacalera à Las Palmas et y lance
    **Montecruz**, copie du Montecristo qu'il venait de perdre — habillé de cape
    camerounaise, ce qui a installé cette feuille dans le goût américain
  - **Costa Rica.** Un seul acteur : Selected Tobacco, fondée en 2012 par **Nelson
    Alfonso**, l'artiste cubain qui avait dessiné l'identité du Cohiba Behike. Atabey, Byron
    et Bandolero, en volumes minuscules
  - **Trois écartés, et pourquoi** : le **Pérou** et la **Colombie** fournissent de la
    feuille — du corps, une épice douce — que d'autres mettent dans leurs tripes, mais
    aucune maison vérifiable ne s'y rattache ; les ajouter voudrait dire publier deux fiches
    sans marques et aux chiffres inventés. **Haïti** : aucune source trouvée sur une
    production cigarière, ancienne ou actuelle. Écrire ces fiches, c'était les fabriquer
  - **Pas de chiffre inventé** : ces trois fiches n'ont ni revenus ni volumes chiffrés ni
    calendrier de récolte. Les colonnes sont descriptives ou vides plutôt que fausses — à
    la différence des douze fiches existantes, toujours en attente de relecture

- [x] ~~**D35** — Relecture sur sources : quatre erreurs, six précisions~~ ✅ · migration `026`
  - Les dix maisons que `024` et `025` signalaient « moins documentées, à vérifier » l'ont
    été, une par une, sur sources extérieures. **Quatre affirmations étaient fausses** — dont
    deux que rien, dans le texte, ne présentait comme incertain
  - **Suerdieck n'existe plus.** L'article la décrivait au présent. Elle a fermé sa dernière
    usine de Cruz das Almas **en 2000**, après cent huit ans. L'atlas disait vivante une
    maison morte
  - **Meerapfel ne roule pas au Cameroun** mais en République dominicaine. Ma formule
    « la première maison que le Cameroun peut dire sienne » était donc fausse : le pays n'y
    fabrique rien. Par le critère posé en `023`, l'entrée passe en **`cape`** — et le
    Cameroun redevient ce qu'il est, un pays de feuille sans manufacture premium
  - **Matilde ne porte pas le prénom de la femme du fondateur** (elle s'appelle Carmen). Le
    nom vient de la Tabacalera La Matilde, fabrique dominicaine de 1876 à 1910. La vraie
    histoire était meilleure que celle que j'avais inventée
  - **Alhambra n'était pas espagnole.** L'article déduisait du nom — le palais de Grenade —
    que le capital venait d'Espagne. La société fondée à Manille en 1898 était **suisse**.
    L'inférence était jolie et fausse
  - Six précisions : Taru Martani (1918, rebaptisée par le sultan Hamengkubuwono IX — « la
    feuille qui fait vivre ») · Juan Clemente (la bague au pied **protège** l'extrémité
    fragile) · Bering (Tampa 1905 → Swisher → Danlí 1990 → **Plasencia** 2002) · Matacan
    (même usine que Te Amo, donc **quatre entrées Turrent** sur la fiche mexicaine) ·
    The Griffin's (Davidoff est arrivé **après**, pour l'export) · Warped (TABSA + El Titan
    de Bronze, bouquet *entubado*)
  - **Un piège que l'outillage ne voit pas** : corriger le français laisse les colonnes
    traduites remplies de l'ANCIEN texte. `--reste` les compte comme complètes. Il a fallu
    vider les colonnes à la main pour forcer la reprise. Rien ne relie une traduction à la
    version du français dont elle est issue — à traiter (voir **E6**)

- [x] ~~**D34** — Douze maisons de plus, et une erreur d'inventaire réparée~~ ✅ · migration `025`
  - **La migration `022` mentait sans le savoir.** Elle annonçait que Cuba tenait « le
    portefeuille Habanos COMPLET » avec 27 marques. **La Flor de Cano manquait** : fondée en
    1884, produite en petites quantités et surtout présente en éditions régionales, c'est
    précisément la marque qu'on oublie en récitant la liste. Cuba en compte 28
  - **96 → 108 articles.** Nicaragua +3 (Espinosa, Crowned Heads, Warped) · Rép. dominicaine
    +5 (VegaFina, Don Diego, The Griffin's, Matilde, Juan Clemente) · États-Unis, Honduras,
    Mexique, Cuba +1
  - **Une relation que l'atlas ne montrait nulle part** : Crowned Heads et Warped n'ont pas
    d'usine. Elles composent des assemblages et les font rouler chez d'autres. Une marque
    peut donc être d'un pays sans rien y fabriquer, et le cigare qu'on tient peut sortir
    d'un atelier dont le nom n'est écrit nulle part sur la boîte
  - **`est_prose()` écartait des phrases en silence.** Sa règle exigeait trois mots ET soit
    un mot d'une liste fermée, soit un accent. « Pas d'usine : elle choisit son rouleur
    selon l'assemblage » n'a ni l'un ni l'autre : la description de Crowned Heads était
    classée « nom propre » et **n'apparaissait même pas dans l'export**. Rien ne signalait
    qu'elle manquait. Règle ajoutée : cinq mots ou plus, c'est une phrase. Le correctif a
    révélé **trois autres segments** invisibles depuis toujours
  - **À relire en priorité** : Warped, The Griffin's, Matilde, Juan Clemente, Bering et
    Matacan sont moins documentées ; leurs dates sont au conditionnel dans le texte. Six
    maisons, qui s'ajoutent aux quatre de `024`
  - Les 108 articles restent à **100 %** dans les six langues

- [x] ~~**D33** — Vingt-cinq maisons que l'atlas ignorait~~ ✅ · migration `024`
  - Point de départ : **A.J. Fernandez ne figurait pas sur la fiche du Nicaragua**. L'un des
    assembleurs les plus demandés de sa génération, absent du pays où il roule — et le
    Nicaragua, premier producteur premium du monde en volume, n'affichait que dix noms
  - **71 → 96 articles.** Nicaragua +6 · Rép. dominicaine +5 · Honduras +6 (dont l'article
    « Punch Honduras » qui manquait) · Mexique +2 · Brésil +2 · Philippines, États-Unis,
    Cameroun, Indonésie +1
  - ~~**Le Cameroun et l'Indonésie gagnent leur première maison en propre.**~~ ⚠ **à moitié
    faux, corrigé par `026`** : Meerapfel fait rouler ses cigares en République dominicaine.
    Le Cameroun n'a donc toujours aucune maison en propre, et l'entrée est passée en `cape`.
    Seule Taru Martani (Yogyakarta, 1918) tient : elle, elle roule bien chez elle
  - **Le même nom, deux maisons** : Punch, Hoyo de Monterrey, Montecristo et Romeo y Julieta
    existent en version cubaine et non cubaine, séparées par la nationalisation de 1960.
    L'atlas les distingue désormais au lieu de renvoyer tout le monde vers l'article cubain
  - **À relire en priorité** : Suerdieck, Alhambra, Taru Martani et Meerapfel sont beaucoup
    moins documentées que les autres. Leurs dates de fondation sont écrites au conditionnel
    dans le texte plutôt que données pour acquises
- [x] ~~**D31** — Les marques qui manquaient à l'atlas~~ ✅ · migration `022`
  - **Cuba passe de 11 à 27 marques**, soit le portefeuille complet de Habanos S.A. Il en
    manquait seize, dont plusieurs des plus anciennes encore produites : Por Larrañaga
    (1834), Ramón Allones (1837), El Rey del Mundo et Sancho Panza (1848)
  - **La Aurora** (1903), la plus ancienne manufacture dominicaine — déjà là depuis soixante
    ans quand l'exode cubain a fait du pays la capitale du cigare premium. Son absence était
    la plus criante de la fiche dominicaine
  - **J.C. Newman** (1895), la plus ancienne entreprise familiale américaine encore en
    activité, et la dernière grande fabrique en fonctionnement de Ybor City. La fiche des
    États-Unis ne listait qu'une *entreprise* — General Cigar — et une extension de marque
  - **Ni notes chiffrées, ni célébrités, ni éditions limitées.** Ce sont les champs les plus
    faciles à inventer et les plus difficiles à vérifier : une note « Cigar Aficionado
    94/2021 » fausse serait indiscernable d'une vraie. Les colonnes restent vides, et le
    front ne les affiche pas
  - Les **descriptions courtes sont traduites** dans les cinq autres langues (le dictionnaire
    `content_translations`, versionné dans `sql/traductions.sql`) ; les articles longs
    restent en français et retombent dessus, ce que la couverture affiche honnêtement à 75 %
  - Défaut réparé au passage : sur un lien direct `?brand=…`, le surtitre affichait
    « MAISON · » suivi de rien. La marque connaît son pays — on le lui demande
  - ⚠ Le texte vient des connaissances du rédacteur, comme les 92 fiches pays et les 90 dates
    de fête nationale déjà en attente de relecture
- [x] ~~**D30** — Onze marques que rien ne reliait au site~~ ✅ · migration `021`
  - Une fiche pays n'affiche que les marques inscrites dans **sa** liste. Onze articles
    n'y figuraient nulle part : rédigés, dotés de leur gamme, de leurs notes et de leurs
    accords, **traduits dans les six langues** — et introuvables autrement qu'en devinant
    l'adresse `?brand=…`. Parmi eux **Hoyo de Monterrey**, l'une des cinq grandes cubaines
  - `brands.country_id` ne désignait aucun pays connu dans **34 lignes sur 53** : un import
    qui avait gardé le drapeau et le nom (« 🇨🇺 Cuba »), un identifiant dominicain écrit de
    deux façons, et la Suisse qui n'est pas un pays producteur. C'est le champ dont la
    recherche se sert pour rejoindre le pays d'une marque
  - Le pays d'accueil est celui de l'**usine**, tel que l'article le déclare lui-même — pas
    une déduction. Les deux cas qui se discutent (Villiger, suisse mais roulée à Estelí ;
    Romeo y Julieta USA, qui portait un identifiant dominicain quand ses deux sœurs
    portaient « usa ») sont écrits dans l'en-tête de la migration
  - **Défaut révélé par la correction** : trente-deux vitoles sur cent quarante-neuf n'ont
    ni force ni cape en base, et le front écrivait « Force: undefined ». Toutes
    appartenaient à ces onze articles — le défaut existait depuis toujours, il a fallu les
    rendre visibles pour le voir
  - `tools/marques_check.php` garde l'état : aucun article sans fiche, aucun `country_id`
    orphelin, aucun nom listé sans article. Le contenu de l'atlas ne vivant pas dans Git,
    c'est un outil à lancer sur la base réelle, pas un test de la campagne
- [x] ~~**D29** — Deux parcours qui ne mesuraient plus rien~~ ✅
  - `infobulle › apparait au survol` échouait **une fois sur dix**, uniquement en
    campagne complète. Le point de survol est trouvé dans le navigateur, puis la souris
    s'y rend depuis le pilote : entre les deux, le globe continuait de tourner. À
    2,75 °/s ce n'est rien sur une machine libre, et assez pour manquer un marqueur
    quand elle porte 91 parcours. La rotation est **figée** avant l'échantillonnage :
    ce parcours mesure l'infobulle, pas l'adresse d'une cible mobile
  - `infobulle › reste masquee sous un panneau` se déclarait **« sauté »** dès qu'aucun
    marqueur ne passait sous le panneau — c'est-à-dire au hasard de l'angle du globe, et
    sans bruit. Il fait désormais tourner le globe par pas de 15° jusqu'à en trouver un.
    *Un parcours qui n'exécute pas le geste ne dit rien sur ce geste* — et celui-là ne
    le disait plus une fois sur deux
- [x] ~~**D28** — Une seule recherche~~ ✅
  - Trois entrées jusqu'ici : la loupe de l'en-tête, l'Explorer, et la communauté avec
    sa propre navigation. Chercher « Cohiba » doit rendre la maison, les établissements
    qui la servent **et** les discussions
  - Le reste de l'index vit déjà dans le navigateur ; seules les discussions manquaient.
    Elles arrivent du serveur **après** les résultats locaux et se posent en dessous :
    la recherche ne doit pas attendre le réseau pour répondre ce qu'elle sait déjà
  - Un **jeton** écarte les réponses en retard : le réseau ne rend pas les réponses dans
    l'ordre où on les demande, et une frappe ancienne écrasait une frappe récente
  - Sur les **titres et les étiquettes**, pas sur le corps des messages : un `LIKE '%…%'`
    sur vingt mille messages balaierait la table à chaque frappe. Le jour où cela vaudra
    la peine, ce sera un index FULLTEXT, pas un LIKE plus large
  - Les jokers de `LIKE` sont neutralisés : « % » saisi dans la barre est un caractère,
    pas un opérateur — sans quoi il aurait rendu tous les sujets du site
- [x] ~~**D27** — Référencement des discussions~~ ✅
  - L'espace communautaire vivait dans un calque JavaScript : les moteurs n'en voyaient
    **rien**, et le plan de site n'annonçait que six pages d'accueil. Or les discussions
    sont le seul contenu qui grandit sans qu'on l'écrive
  - `index.php` sert désormais les balises d'un sujet (`?sujet=42`) — titre, description
    tirée du premier message, canonique, `og:type=article`. Même mécanique que `?brand=`,
    et pour la même raison : les robots lisent le HTML brut sans l'exécuter
  - **Un sujet n'a pas d'alternatives de langue.** Il est écrit dans une langue, par une
    personne, et le serveur ne traduit pas : lui déclarer six `hreflang` annoncerait cinq
    traductions qui n'existent pas. La page est servie dans la langue du sujet, quelle
    que soit celle demandée
  - `sitemap.php` annonce les sujets avec leur `lastmod` : un fil qui vit se réindexe,
    un fil clos ne coûte rien
- [x] ~~**D26** — Suivre un sujet, et apprendre qu'on a reçu une réponse~~ ✅ · migration `020`
  - `forum_follows` et le point d'API existaient depuis la migration 015, **sans qu'aucun
    bouton ne les appelle** : la table ne s'est jamais remplie, rien n'est jamais parti
  - **On suit ce qu'on écrit**, d'office : personne ne pense à cocher « prévenez-moi »
    avant d'avoir posé sa question, et la réponse est la raison même d'avoir écrit
  - **Le garde-fou contre l'avalanche** : on prévient une fois, puis plus rien tant que
    la personne n'est pas revenue lire. `notified_at` est remis à NULL quand le suiveur
    ouvre le sujet — « revenue lire » se constate, il n'y a pas à l'estimer au temps écoulé
  - L'email porte le **nom** de l'auteur et un **extrait** : un « nouvelle réponse » nu se
    lit comme du bruit et finit en filtre
  - Un envoi qui échoue ne marque pas `notified_at` : la prochaine réponse réessaiera
- [x] ~~**D25** — Activité récente et ancrage sur l'atlas~~ ✅
  - Il fallait ouvrir les **huit rubriques une à une** pour savoir s'il s'était passé
    quelque chose. La liste voyage dans la même réponse que les rubriques : deux requêtes
    pour un écran se paient chez un hébergeur mutualisé qui n'en traite qu'une à la fois
  - « En discuter » sur la fiche d'une maison et la carte d'un établissement. Le lien va
    dans les **deux sens** — un ancrage à sens unique laisse sans contexte ceux qui
    arrivent par un lien partagé
  - L'identifiant seul ne suffit pas au retour : l'atlas ouvre un établissement par le
    **pays** qui le contient. Le serveur sert donc le pays et le libellé avec la référence
- [x] ~~**D24** — Deux détails de l'espace communautaire~~ ✅
  - **Il n'existe pas d'émoji de cigare.** Unicode a `🚬`, une cigarette : l'objet que ce
    site ne traite pas, et dont l'image dessert exactement ce qu'il défend. La rubrique
    « Les cigares » porte donc un module **dessiné** — bague et braise comprises —, les
    sept autres gardant leur émoji. Le tracé vit dans le front, avec les libellés de
    rubrique, pour la même raison qu'eux : c'est de la présentation
  - **« Retour aux rubriques » ne ressemblait pas à un bouton** : texte doré nu, en Cinzel
    9 px — la fonte et le corps des intitulés décoratifs qui l'entourent. Il prend le
    gabarit des autres commandes de la barre, et son chevron recule au survol pour dire le
    sens. En RTL, le chevron se retourne
- [x] ~~**D23** — Les langues s'ouvrent et se ferment depuis l'administration~~ ✅ · migration `019`
  - La liste des six langues était **recopiée à cinq endroits** (`index.php`, `sitemap.php`,
    `auth_lib.php`, deux fois dans `forum.js`). En fermer une le temps d'en relire les
    traductions demandait une mise en ligne — et cinq fichiers à ne pas oublier
  - Deux listes, qu'il ne faut pas confondre : celles que le site **sait dire**
    (les dictionnaires d'`i18n.js`, donc du code) et celles qu'il **propose** (la table).
    L'administration ne fait que cocher dans la première ; une septième langue ne se règle
    pas ici, elle s'écrit
  - **Le français n'est pas fermable** : il est le repli de toute traduction manquante,
    du serveur au front. La case est verrouillée *et* la règle est portée par le code —
    un formulaire est ce qu'on lui envoie, pas ce qu'il affiche
  - **Fermer ne supprime rien.** Les messages gardent leur langue et redeviennent visibles
    tels quels si on la rouvre ; les comptes gardent leur préférence. Ce qui change : le
    drapeau disparaît, `/de/` répond en français, le plan de site et les `hreflang` ne
    l'annoncent plus, et on n'écrit plus de nouveau message dedans. **Lire et écrire ne se
    valident pas sur la même liste** — c'est toute la subtilité
  - **Pas une requête SQL de plus par visite** : `index.php` répond sans toucher à la base,
    et c'est délibéré. La liste est recopiée dans un fichier de cache dont la **date de
    modification** entre dans l'empreinte des pages — cocher une langue les périme comme le
    ferait une feuille de style modifiée. Le nom de la base entre dans le nom du fichier,
    sans quoi le serveur de test et celui de développement, qui partagent le même dossier,
    se seraient dicté leurs réglages
  - `filemtime()` a la **seconde** pour unité : enregistrer et recharger dans la même
    seconde laissait passer la page précédente. Les pages en cache sont donc **effacées**
    à l'enregistrement — six fichiers, deux fois par an
  - 19 vérifications d'API, dont la contre-épreuve : rouvrir rend le drapeau, l'adresse et
    le `hreflang`
- [x] ~~**D22** — Photos dans les messages de la communauté~~ ✅
  - Trois images au plus par message, vignettes sous le texte, agrandissement au clic.
    **Pas d'affiche d'événement** : une affiche est par définition un support promotionnel, et
    portant le logo d'une maison ce serait de la publicité pour le tabac au sens le plus
    littéral. Une photo de son propre cigare est un témoignage ; une affiche n'en est pas un
  - **Le ré-encodage est obligatoire** (`backend/image_lib.php`) : l'image n'est jamais copiée,
    elle est décodée puis reconstruite. Cela supprime les **EXIF** — donc la position GPS que
    le téléphone glisse dans chaque photo — et neutralise les fichiers **polyglottes**. Les
    deux sont vérifiés : un JPEG portant « GPS-48.8566,2.3522 » et un JPEG suivi de code PHP
    ressortent l'un et l'autre nettoyés
  - L'ancien repli `move_uploaded_file()` **a disparu** : il copiait le fichier brut quand GD
    manquait. Acceptable tant que seule l'administration téléversait, plus du tout depuis que
    la communauté le peut. On refuse désormais l'image plutôt que de la stocker sans l'avoir
    reconstruite — et `photos.php` passe par la même chaîne, une seule à auditer
  - `uploads/.htaccess` interdit toute exécution : seconde barrière, indépendante de la première
  - **Une image abaisse le seuil de masquage à 2 signalements** (3 pour du texte) : un
    paragraphe déplacé se lit et s'oublie, une image choquante fait ses dégâts en cinq secondes
  - `post_id` nullable : on téléverse avant de publier. Les images jamais publiées sont effacées
    au bout de 24 h, **au téléversement suivant du même membre** — un nettoyage qui dépend d'un
    cron oublié laisse un dossier qui enfle en silence
  - **La qualité est choisie, pas fixée.** Une qualité JPEG figée traite de la même façon
    une photo au grain marqué et une macro sur fond sombre. On encode, on relit, on compare
    au PSNR, et on garde la qualité **la plus basse** dont l'écart reste sous le seuil
    (44 dB pour l'image, 38 pour la vignette). Plus le JPEG progressif, gratuit
  - **On commence par la qualité de référence (86)**, et c'est ce qui rend l'algorithme
    incapable d'empirer les choses. Le PSNR punit le bruit, que l'œil pardonne : sur une
    photo grenue il plafonne vers 25 dB quelle que soit la qualité. Une recherche naïve
    concluait « il faut monter » et rendait un fichier **30 % plus lourd** (630 → 818 ko).
    En testant 86 d'abord, ce cas se reconnaît au premier essai — et devient le plus rapide
  - Mesuré : **−53 %** sur une image douce (44 ko → 21 ko, PSNR 44,1) · **−10 %** sur une
    photo texturée, par le seul passage en progressif · coût 0,45 à 0,6 s par image
  - **Écarté après mesure** : la réduction par paliers successifs. Le conseil vaut pour
    `imagecopyresized` ; `imagecopyresampled` moyenne déjà la zone source. Écart relevé aux
    facteurs 2, 4 et 8 : **+0,00 %, +0,09 %, −0,15 %**. Le code a été retiré plutôt que gardé
    avec une justification que la mesure contredit
  - 27 vérifications d'API et 3 parcours Playwright
- [x] ~~**D21** — Bouton de rotation automatique du globe~~ ✅
  - `autoRot` existait depuis toujours — le globe tourne seul au chargement — mais **aucune
    commande ne le pilotait**. Le moindre geste l'arrête (glisser, choisir un pays, ouvrir
    Explorer) et rien ne permettait de le relancer : sur téléphone, une fois arrêtée, la
    rotation ne revenait plus de la visite
  - Le bouton ⟳ ne dépend **d'aucun capteur, d'aucune permission, d'aucun HTTPS** — il marche
    partout, du premier coup. C'est ce qui le distingue du gyroscope
  - **Pourquoi le gyroscope (🔄) restait invisible** : il exige un appareil tactile *et*
    `DeviceOrientationEvent`, que les navigateurs réservent aux **contextes sécurisés**. Servi
    en `http://192.168.x.x`, le site n'y a pas droit et le bouton n'était jamais créé — sans
    un mot d'explication. `http://localhost` est traité comme sécurisé, d'où un test qui
    passait pendant que le téléphone ne voyait rien
  - **L'état se relit, il ne se mémorise pas.** `autoRot` est modifiée par six fichiers ; un
    bouton qui garderait son propre état mentirait dès le premier glissement. Il compare la
    valeur réelle deux fois par seconde et s'éteint tout seul
  - Respecte `prefers-reduced-motion` : la boucle y gèle déjà la rotation, le bouton n'est
    donc pas créé — en proposer un qui ne ferait rien serait pire que rien
- [x] ~~**D19** — Portail d'âge à l'arrivée (18 ans)~~ ✅
  - Le cigare est un **produit du tabac** : l'accès est réservé aux personnes majeures.
    Le portail se dresse au centre, au-dessus de tout — écran de chargement compris —
    et ne se ferme ni par Échap ni par un clic à côté
  - **Visible par défaut dans le HTML**, retiré par un court script d'en-tête pour qui a
    déjà répondu. Construit à l'envers — masqué puis montré par JS — il suffirait de couper
    JavaScript pour entrer
  - **Pas de cookie** : la réponse vit dans `localStorage`, sur le poste, et ne part jamais
    au serveur. Rien à déclarer dans une bannière de consentement
  - Il ne **vérifie** pas l'âge (aucun site ne le peut sans pièce d'identité) et ne
    géolocalise pas : l'âge légal varie (18 en France, 21 aux États-Unis, 20 au Japon), le
    texte renvoie donc à « l'âge légal dans votre pays »
  - « Non » n'enferme personne : message d'au revoir et retour possible sur sa réponse.
    Aucune redirection d'autorité vers un site tiers
  - Les **67 parcours existants le franchissent d'avance** (`aide.js`), sinon ils
    échoueraient d'un coup sur un calque qui n'est pas leur sujet. 6 parcours dédiés
- [x] ~~**D20** — Communauté : les deux points d'entrée à la charte, et le menu mobile~~ ✅
  - Les boutons « Communauté » sortaient **sans style** : Arial 13 px, bordure `outset`
    grise, le rendu par défaut du navigateur. Dans l'en-tête, la pastille reprend
    exactement le gabarit de `#mktToggle` / `#loungeToggle`, dans l'or du site — c'est son
    espace, pas une catégorie de l'atlas. Dans le menu mobile, le gabarit des entrées du
    compte, juste en dessous
  - **Voile derrière le menu mobile.** Sur un téléphone de 400 px il couvre un peu plus de
    la moitié de l'écran, et la fiche ouverte derrière continuait de se lire sur le côté :
    deux panneaux de même valeur, empilés. Le voile dit lequel a la main, et le clic
    dessus referme. C'est un **élément à part** et non un `::before` du menu — la fermeture
    au clic extérieur teste « le menu contient-il la cible ? », et un pseudo-élément aurait
    désigné le menu lui-même
  - La feuille passe de 220 px à `min(280px, 86vw)`, défilante quand l'écran est court.
    Le réglage vit dans `responsive.css`, chargé **après** `components.css` : posé ailleurs,
    il était écrasé sans bruit
  - **Le nom du site avait disparu sur téléphone.** L'en-tête est une seule ligne de flex ;
    à 400 px elle dispose de 376 px, dont 152 pour le titre, 34 pour le compte et 36 pour
    le menu. « MARCHÉS » et « LOUNGES » en pesaient 160 à elles deux — le bloc de droite
    débordait et se dessinait **par-dessus** le titre, qui perdait déjà 38 px. Les 106 px
    de « COMMUNAUTÉ » l'ont effacé entièrement
  - Sur téléphone, les trois bascules ne gardent que leur **pictogramme** (leur libellé
    faisait 7 px, il n'était pas lu ; chacune conserve son `aria-label`). Mesuré à 400 px :
    bloc de gauche **0 → 171 px**, le nom tient enfin en entier. Sous 380 px, le nom passe
    à 15 px et les pastilles se resserrent de 2 px
  - Parcours de non-régression : le nom ne doit être **ni tronqué ni recouvert**
- [x] ~~**E1c** — Espace communautaire, **V1 : les discussions**~~ ✅
  - Cahier des charges : [docs/communaute.md](communaute.md). Décisions retenues : discussions
    seules (événements en V2), **les six langues avec filtre**
  - 8 rubriques dont les **libellés vivent dans i18n.js**, pas en base : une rubrique est une
    liste fixe décidée éditorialement, donc de l'interface. Le serveur ne traduit toujours pas
  - Markdown restreint **rendu côté serveur** : on échappe tout d'abord, puis on réintroduit
    une poignée de balises — l'inverse est la façon dont on écrit une faille XSS (leçon d'A3).
    Le message est stocké **brut** : un texte stocké échappé ne peut plus être ré-analysé
  - **Filtre de langue** par sujet, réglé sur la langue d'affichage + l'anglais. Sans lui, une
    rubrique serait un empilement où cinq lecteurs sur six ne comprennent rien
  - Anti-abus : masquage à **3 signalements distincts** sans attendre un modérateur, 3 sujets
    et 30 messages/jour, 30 s entre deux messages, **aucun lien externe avant 5 messages**
  - Un compte supprimé laisse ses messages sous « Membre supprimé » (`ON DELETE SET NULL`) :
    effacer au milieu d'un échange rend la suite incompréhensible
  - **Un sujet d'amorce par rubrique** (migration `016`) : aucune rubrique vide au premier
    jour. Question ouverte, aucune fausse réponse, signée d'un compte « La Régie » qui ne
    peut pas se connecter. Deux fils en anglais, sans quoi un anglophone trouverait le vide
  - Le compte de sujets d'une rubrique suit le **même** filtre que la liste : annoncer
    « 2 sujets » puis n'en montrer qu'un est pire que ne rien annoncer
  - 58 vérifications d'API et 8 parcours Playwright
- [x] ~~**E1d** — Espace communautaire, **V2 : les événements**~~ ✅
  - **Un événement EST un sujet** muni de champs structurés (`topic_id` en clé primaire) : la
    préparation se discute dans le fil, et il n'y a pas un second système de commentaires
  - **L'heure est stockée en UTC, le fuseau du lieu à côté.** Aucun des deux ne remplace
    l'autre : l'UTC seul ne dit pas à quelle heure locale ça commence, le fuseau seul
    n'ordonne pas deux rendez-vous sur deux continents, et une heure locale nue se décale
    deux fois par an. Vérifié à Paris **en janvier et en juillet** — un décalage en dur
    donnerait la même réponse aux deux
  - **Organiser demande le statut de confiance** : un rendez-vous physique annoncé par un
    compte de trois minutes est le principal vecteur d'abus de ce genre d'espace
  - **La liste d'attente se déduit** du rang d'inscription et de la capacité, elle n'est pas
    un état stocké — un état se désynchroniserait au premier désistement. Et l'on annonce le
    RANG : « complet » laisse croire qu'il n'y a rien à espérer
  - **Les rendez-vous sur le globe** : losange or battant, distinct des triangles violets des
    établissements. Voir *où* ça se passe est exactement ce que ce site sait faire
  - « Prochain rendez-vous » sur la fiche de l'établissement hôte — **une** requête pour tout
    le panneau, le serveur n'en traitant qu'une à la fois
  - Annulation : le rendez-vous reste visible, barré, avec son motif, et les inscrits sont
    prévenus par email dans leur langue. Ils avaient bloqué une soirée
  - Rappel J-2 par `tools/forum_rappels.php` (cron). `reminded_at` garantit qu'il ne part
    qu'une fois : un cron horaire enverrait sinon vingt-quatre emails par jour et par inscrit
  - La péremption se rattrape **à la lecture**, pas par une tâche planifiée : un cron oublié
    laisserait un agenda plein de rendez-vous d'avant-hier annoncés comme « à venir »
  - 35 vérifications d'API et 6 parcours Playwright
  - ⚠ Avis juridique nécessaire avant ouverture publique (produit du tabac, promotion, âge)
- [x] ~~**E1e** — Espace communautaire, **V3 : le modérateur**~~ ✅
  - **Le rôle existait et personne ne pouvait le porter.** `moderator` était câblé à six
    endroits et valait `admin` partout, mais `admin.php` interrogeait la porte *sans passer
    la base* : le chemin du rôle n'était jamais emprunté. Le seul compte qui l'avait —
    « La Régie » — a `*` pour hachage et ne peut pas se connecter. Zéro test le mentionnait
  - **`admin_scope()` remplace le oui/non par un jusqu'où** : `admin` (clé, ou compte de rôle
    admin) et `moderator`. Fermé à la modération : les langues, l'écran des membres, l'export
    complet, la suppression définitive d'une photo — l'irréversible, le global et le méta
  - **Un menu n'est pas une serrure.** Une seule liste `$DOMAINE_ACTION` / `$DOMAINE_ONGLET`
    nourrit l'affichage *et* la garde des POST ; le test forge la requête à la main avec un
    jeton CSRF valide et vérifie le 403 — puis que rien n'a été écrit
  - **`photos.php?action=hide`** : le retrait réversible n'existait pas. Un modérateur avait
    le choix entre laisser une image déplacée et effacer un fichier pour toujours
  - **Onglet Membres** : nommer un modérateur demandait un `UPDATE` à la main, ce qui revient
    à n'en jamais nommer. Trois refus — `admin` ne s'attribue pas ici (il vaut la clé), un
    administrateur ne se rétrograde pas ici, un compte de signature garde son rôle
  - **Journal de modération** (migration `130`) — §8 du cahier des charges, jusqu'ici non
    tenu : seul `forum_flags.resolved_by` traçait quoi que ce soit. `acteur_nom` est **figé**
    au moment de l'acte et **aucune** clé étrangère ne pointe `users` : une cascade effacerait
    les décisions de celui qu'on audite. La portée `systeme` couvre les chemins sans auteur
    humain — « publié directement par Alice, aucun modérateur n'est passé »
  - Le journal est **lisible par les deux portées** : le cacher au modérateur en ferait une
    surveillance plutôt qu'un registre
  - 51 vérifications d'API (373 → 424)
  - Reste ouvert : les **sanctions graduées** (avertissement → lecture seule 7/30 j →
    suspension). `users.status` ne connaît qu'`active`/`suspended`, lu au seul login. À faire
    quand il y aura du monde à sanctionner
- [x] ~~**D1** — Modération des avis (signalement + écran admin)~~ ✅
- [x] ~~**D2** — Contributeur de confiance (promotion + publication directe)~~ ✅
- [x] ~~**D3** — Retirer le champ email redondant du modal contribution~~ ✅
- [x] ~~**D4** — Globe : navigation clavier + alternative textuelle~~ ✅
- [x] ~~**D5** — Globe : zoom centré sur le curseur~~ ✅
- [ ] **D6** — Globe : réécriture WebGL (globe.gl/Three.js) · G · optionnel
- [x] ~~**D16** — Zoom : double-tape sur le globe, plus nulle part ailleurs~~ ✅
  - `touch-action: manipulation` sur tous les éléments interactifs : le zoom natif du
    navigateur ne se déclenche plus sur un bouton, et le délai de ~300 ms disparaît
  - Le globe garde `touch-action: none` et compose lui-même la double-tape (aucun
    évènement `dbltap` n'existe) ; il zoome **vers le point visé**, comme la molette
  - Plafond **3 → 6**. Les bornes étaient recopiées à **cinq** endroits, dont la jauge du
    curseur — les relever sans elle aurait bloqué le curseur en haut. Centralisées dans
    `clampZoom()`
- [x] ~~**D17** — Partager une marque comme un article~~ ✅
  - **Aperçu propre à la marque** : `index.php` lit `?brand=`, récupère l'histoire dans la
    langue demandée et écrit les balises Open Graph. Impossible en JavaScript — les robots
    de WhatsApp, LinkedIn ou Slack lisent le HTML brut sans l'exécuter
  - Le **cache de page** inclut la marque, sinon le premier partage figeait sa carte pour
    tout le site. La clé vient de la **base**, jamais de l'URL : un tiers ne peut pas créer
    de fichiers de cache à volonté
  - ~~Lisibilité : mesure à 34 em, corps 12 → 14,5 px~~ **revu** : l'histoire suit désormais
    « Profondeur de Gamme » — 12,5 px, interligne 1,68, pleine largeur. La colonne étroite et
    centrée était *rentrée* par rapport à tout ce qui la suivait, et sensiblement plus grosse :
    deux articles empilés plutôt qu'un seul. La cohérence de la page l'emporte sur le confort
    théorique d'une mesure idéale
  - Bouton de partage sur la fiche (`navigator.share` avec titre et résumé, repli
    presse-papiers) et `data-i18n-title` ajouté au moteur i18n pour les infobulles
  - **Le partage produit une IMAGE**, pas un lien copié : une fiche 1080×1350 lue
    directement dans la conversation, sans clic. Le lien l'accompagne, il ne la remplace pas
    (`assets/js/fiche-partage.js`)
  - La fiche cite la typographie de l'article au pixel près — l'interlettrage du surtitre est
    posé **lettre à lettre**, un canvas n'en ayant pas
  - **Thème clair imposé** : une carte est vue par d'autres, dans des fils blancs ; une fiche
    en « Minuit » y ferait un trou noir
  - **Pas de drapeau emoji** : un canvas Windows rend les indicateurs régionaux en losanges,
    et l'image est produite sur le poste du visiteur
- [x] ~~**D18** — Le partage, pour de vrai sur téléphone~~ ✅
  - **Le même bouton partout** : même pastille, même place qu'en bureau. Un bouton qui change
    de forme et de position d'un écran à l'autre se réapprend à chaque fois
  - La cible tactile ne se voit pas : une zone sensible de **44 px** entoure la pastille, qui
    garde ses 26 px à l'œil (`::before` en débord négatif — du remplissage l'aurait déplacée).
    Vérifiée en tapant **hors du dessin**
  - **Le geste doit survivre au dessin.** `navigator.share()` exige une activation
    transitoire : dessiner la fiche (5 polices + un PNG de 300 Ko) prend **1,1 s** — assez
    pour que Safari juge le geste périmé et refuse. La fiche est donc dessinée pendant la
    lecture ; au clic, `share()` part en **2 ms**. Mesuré dans les deux sens
  - Défaut trouvé par ce test : `requestIdleCallback` **sans échéance ne se déclenche jamais**
    sur une page animée. La préparation était morte, le partage repartait pour 1,6 s.
    `{ timeout: 600 }` la garantit
  - **Le bas de la fiche porte les distinctions** : grille de deux colonnes, six notes au
    plus, l'histoire s'adaptant à la place restante — jamais l'inverse
  - **Filigrane de feuilles de tabac**, dessiné en courbes (une image serait un aller-retour
    réseau au moment précis du partage). Les nervures ne sont pas décoratives : sans elles la
    silhouette se lit comme une goutte. 5 % d'opacité — à 10 % on la voit derrière le texte,
    à 2 % elle ne survit pas à la recompression de WhatsApp
  - Vérifié **en relisant les pixels du PNG** : rien de tout cela n'est dans le DOM
    (`tests/e2e/partage.spec.js`)
- [x] ~~**E5** — `action=all` ne servait que le globe~~ ✅
  - Il capturait la sortie de `action_globe()` par `ob_start()`, mais `jout()` **termine le
    script** : la capture ne rendait jamais la main et le bloc qui ajoute `brands` et
    `habanos` était mort. La réponse restait un JSON valide — rien ne le signalait
  - Trouvé en écrivant un test qui s'appuyait dessus. 4 vérifications ajoutées
- [x] ~~**D15** — Globe figé sur mobile après fermeture d'un panneau~~ ✅
  - Sur mobile la boucle de rendu se met en pause hors de l'onglet Globe ; seul
    `switchMobileTab('globe')` la relance. Fermer par la **croix** ne le faisait pas :
    le panneau disparaissait, le globe réapparaissait **immobile**
  - Cause : `interactions.js` définissait la bonne fermeture, mais `panels.js` — chargé
    après — réassignait `panelClose.onclick`. **`.onclick =` remplace au lieu d'ajouter** :
    le bon gestionnaire était mort depuis l'introduction du mode mobile
  - Invisible sur bureau (`_globeHidden()` exige `mobile-mode`) et invisible en test :
    les 46 parcours ouvraient des panneaux sans jamais en fermer un en mode mobile
  - Fermeture unifiée dans `closePanels()`, doublons supprimés, test de non-régression
    vérifié dans les deux sens
- [x] ~~**D13** — L'approbation crée un vrai établissement, et prévient l'auteur~~ ✅ · migration 013
  - **Défaut corrigé** : `data.php` lisait `approved_lounges WHERE status = 'approved'` —
    colonne qui n'a jamais existé. L'erreur SQL était avalée par un `catch` posé pour
    tolérer l'absence de la table, la liste revenait vide **en silence**, et un
    établissement approuvé n'apparaissait **jamais** sur le site
  - L'approbation crée désormais une ligne dans `lounges` : notation, avis, favoris,
    photos, colonnes de traduction et `lat`/`lon` viennent avec
  - `contribution_id` unique → un rejeu ne duplique pas ; une insertion sans effet est
    **journalisée** plutôt que muette (c'est le silence qui avait masqué le défaut)
  - Cohiba’r repris au passage : la Côte d'Ivoire passe de 14 à 15 établissements
  - **Email au contributeur** à l'approbation, pointant la fiche créée (`?lounge=<id>`).
    Pas d'email pour la publication directe d'un contributeur de confiance : l'interface
    le lui dit déjà, un envoi dans la seconde ferait mécanique
  - 9 vérifications, dont la présence de l'email et son absence au rejeu
- [x] ~~**D14** — L'email d'approbation dans la langue de l'utilisateur~~ ✅ · migration 014
  - `users.lang` renseigné à l'inscription depuis la **langue du site** — un choix, pas une
    déduction. Repli sur `Accept-Language`, puis le français. Modifiable dans le profil
  - **Écarté** : déduire la langue du pays (Cameroun fr·en, Suisse de·fr·it, Belgique
    nl·fr·de — ce n'est pas une fonction, et il faudrait une base GeoIP payante) ;
    un champ nationalité (≠ langue, friction, donnée collectée sans nécessité)
  - **Aucun service payant** : le corps de l'email est fait de six phrases fixes,
    traduites une fois dans `mail_i18n()`
  - Première et **seule exception** à la règle F2 « le serveur ne traduit pas » — un email
    n'a pas de front pour le faire. Documenté dans `docs/i18n.md`
  - **Sélecteur dans le profil** : les noms viennent de `I18N[code].lang_name` (chaque langue
    dans sa propre langue), donc **une seule clé ajoutée** — la note qui précise que ce
    réglage gouverne les emails, pas l'affichage du site
  - **Défaut trouvé en testant** : une valeur invalide écrasait la préférence. `langue_demandee()`
    retombe toujours sur une langue valable — juste à l'inscription, faux dans le profil où
    le repli détruisait un choix délibéré. Correspondance stricte désormais, 5 vérifications
  - [ ] Reste : la **description libre** du contributeur, qui elle demanderait un service
    de traduction. Décision reportée
- [x] ~~**D8** — Position sur place dans « Signaler un établissement »~~ ✅ · migration 011
  - `lat`/`lon` sur `contributions` **et** `approved_lounges` : la position survit à l'approbation
  - Jamais demandée d'office ; un refus n'empêche pas l'envoi. Le serveur écarte hors-plage,
    non numérique, latitude seule et le point (0,0) — sans refuser la contribution
  - 8 vérifications dans `tests/run.php`
- [x] ~~**D9** — Drapeaux animés : 4 défauts corrigés~~ ✅
  - **Cuba avait une bande centrale rouge** au lieu de bleue
  - Les trois boucles ne s'arrêtaient jamais — dont une repeignant un canvas **plein écran**
    à chaque trame, panneau fermé (`stopFlags()`)
  - Le panneau d'un marché héritait du drapeau du pays précédent
  - Les tricolores verticaux (Cameroun, Mexique) ne flottaient pas ; `prefers-reduced-motion` ajouté
- [x] ~~**D10** — Fiche pratique du pays : devise, langue, heure + fuseau, distance~~ ✅
  - **Dans le panneau GAUCHE**, celui des données de pays — il portait déjà des lignes
    Devise/Langue/Fuseau, un encart de plus à droite faisait doublon (retiré)
  - A révélé une fuite monolingue : `producer_geo` n'a **aucune colonne de langue** et n'est pas
    dans le plan de traduction. « Peso cubain », « Espagnol », « UTC−5 » s'affichaient en
    français dans les six langues. Le balayage i18n ne l'avait jamais vu — il n'ouvre pas de
    fiche pays. `Intl` les nomme désormais correctement, la base servant de repli
  - Et une donnée fausse : la base disait « UTC−5 » pour Cuba, qui est à **UTC−4** en heure
    d'été. L'heure vivante corrige d'elle-même
  - `data.pays.js` ne contient que des **codes** → **zéro dette de traduction**
  - Distance à côté des coordonnées, calculée **sur demande** (haversine)
  - **Données à relire** — saisies de mémoire, comme les dates de fête
- [x] ~~**D12** — Itinéraire et distance sur chaque fiche d'établissement~~ ✅ · migration 012
  - **Itinéraire** : fonctionne sur les **499 fiches dès aujourd'hui** — Google résout une
    destination en texte, l'adresse suffit. Origine = position de l'utilisateur si connue
  - **Distance** : exige des coordonnées. `lounges` n'en avait aucune, et les 419 `maps_url`
    sont des URL de *recherche* par nom, pas des points. Migration 012 ajoute `lat`/`lon`,
    servies par `data.php` ; la distance ne s'affiche **que** pour un établissement qui en a
  - **0/499 aujourd'hui.** Elles se rempliront par les contributions géolocalisées (D8).
    Approximer par les coordonnées du pays a été écarté : les 31 établissements américains
    auraient affiché la même distance, présentée comme celle du lounge
- [x] ~~**D11** — Rebond du marqueur sélectionné~~ ✅
  - Courbe de balle : saut 9 px, rebond secondaire 2 px, **pause au sol** — ce qui distingue
    un rebond d'un clignotement ; ombre portée pour le relief
  - Une seule translation du repère par image, vérifiée en instrumentant `gc.translate` :
    aucun autre marqueur n'est déplacé. Les zones de production restent au sol
  - `prefers-reduced-motion` → hauteur **zéro**, pas une valeur figée qui suspendrait le marqueur
- [x] ~~**D7** — Fête nationale : bannière et confettis au clic sur un pays, le jour dit~~ ✅
  - 90 dates dans `assets/js/data.fetes.js`, indexées par code ISO **dérivé du drapeau emoji**
    (`lounge_countries.iso_code` est vide sur 18 lignes ; le drapeau, lui, est partout)
  - A mis au jour deux incohérences de `lounge_countries`, corrigées par la **migration 010** :
    le Brésil figurait deux fois (7 établissements d'un côté, le code ISO de l'autre), et
    Saint-Martin portait 🇸🇽 alors que ses trois adresses sont dans la partie française.
    Le catalogue passe de 93 à **92 pays** — ce que `seo_description` annonçait déjà.
  - Hors base, volontairement : y verser 90 pays aurait fait retomber les compteurs de
    traduction de 100 % à moins. Une date ne se traduit pas ; seuls les libellés
    passent par `t()` (4 clés × 6 langues)
  - Ne se déclenche que le bon jour, une fois par pays et par visite, n'intercepte
    aucun clic, respecte `prefers-reduced-motion`, mirroité en RTL
  - Pour le voir : `?fete=CU`, ou `testerFete('BR')` en console
  - **Les 90 dates restent à relire** — saisies de mémoire, pas extraites d'une source
    faisant autorité. Même réserve que les traductions.

### F. Internationalisation
*Audit et plan détaillés : `docs/i18n.md`. Les 222 clés de `i18n.js` sont
complètes dans les 6 langues ; le déficit est ailleurs.*
- [x] ~~**F7** — Garde-fous : parité des clés (`tools/i18n_check.php`, 12 vérifications) + balayage des 6 langues avec cliquet~~ ✅
- [x] ~~**F1** — Rapatrier les chaînes codées en dur du front dans `i18n.js`~~ ✅ · 102 clés, 12 modules
- [x] ~~**F2** — Codes d'erreur côté serveur, traduits côté front~~ ✅ · 35 codes, 10 vérifications
- [x] ~~**F5** — RTL arabe vérifié de bout en bout~~ ✅ · infobulle bornée à la fenêtre
- [x] ~~**F6** — Référencement multilingue : URLs par langue, hreflang, sitemap~~ ✅
- [x] ~~**F3** — Colonnes de traduction manquantes (migration 007)~~ ✅
- [x] ~~**F4** — Contenu de l'atlas traduit~~ ✅ · les 4 tables de référence à 100 % dans les 6 langues
- [x] ~~**F4b** — Prose longue~~ ✅ **100 %** (4 545 / 4 545) · export à zéro
  - [x] ~~499 descriptions d'établissements, 5 langues~~ ✅ audit à zéro sur tous les axes
  - [x] ~~`brands.celebrities`, `brands.pairings`~~ ✅ 100 %
  - [x] ~~`brands.history`~~ ✅ 10 sources × 4 langues, ~62 000 car. produits
  - [x] ~~`brands.gamme`~~ ✅ 10 sources × 4 langues, JSON reconstruit à partir de la source
  - [x] ~~**55 valeurs `[]`**~~ ✅ onze marques dont les cinq colonnes `gamme_*` valaient
    « tableau vide » : pleines pour les compteurs, mais `traduire()` les préférait au
    français et la section gamme s'affichait **vide** hors français. Nouveau garde-fou
    `tools/i18n_json.php`. Voir `docs/i18n.md`.
- [x] ~~**F4c** — Texte libre dans les colonnes JSON : migration 008 (`content_translations`), 101 valeurs distinctes → 505 traductions, export à zéro. Corrige aussi le rendu qui figeait le bloc Habanos en français.~~ ✅

### E. Dette technique
- [x] ~~**E1** — Simplifier `data.php` (DESCRIBE défensifs retirés)~~ ✅
- [x] ~~**E2** — topojson + carte monde auto-hébergés, GA retiré~~ ✅
- [x] ~~**E3** — Frontières réelles des pays producteurs (table `country_polygons` supprimée)~~ ✅
- [x] ~~**E4** — Audit des coordonnées (152 points testés, 2 corrigées : Israël, Semi Vuelta)~~ ✅
- [x] ~~**E5** — Les copies figées du contenu, embarquées dans le front~~ ✅
  - **Ce n'était pas une copie, c'en était six.** `data.inline.js`, `data.countries.js`,
    `data.markets.js`, `data.geo.js`, `data.zones.js`, `data.habanos.js` et
    `data.lounges.js` faisaient chacune un `var X = [...]` **non gardé** : la dernière
    chargée écrasait toutes les précédentes. `data.inline.js` — celle que j'avais consignée
    — était donc morte depuis le début, écrasée quelques lignes plus bas par
    `data.countries.js`, qui portait le même contenu périmé
  - Toutes dataient d'avant `021`→`024` : **8 marques cubaines au lieu de 27**, aucun drapeau
    `cape`, ni Meerapfel ni A.J. Fernandez. Rien à l'écran ne disait laquelle des deux
    versions on lisait
  - **La requête ne partait qu'au `DOMContentLoaded`**, soit après l'exécution de tous les
    scripts : le globe était dessiné, cliquable, et la requête pas même partie. Mesuré sur
    le poste : 390 ms de fenêtre en local, serveur chaud — bien davantage sur une vraie
    liaison
  - **Remède retenu** : n'embarquer que de quoi *dessiner le globe* — identifiants, noms,
    drapeaux, coordonnées. `data.amorce.js` (13 Ko) remplace les sept fichiers (~109 Ko),
    et il est **généré depuis la base** par `tools/amorce_generer.php`, qui sait aussi se
    vérifier (`--verifier`). On ne peut pas afficher une donnée périmée qu'on n'embarque pas
  - Chaque entrée porte `amorce:1`. Un panneau qui en reçoit une **attend la base** au lieu
    de rendre : il affiche l'indicateur de chargement, puis le contenu réel — ou un message
    d'erreur si la base ne répond pas. Jamais un état figé présenté comme actuel
  - Effet de bord non prévu : le dictionnaire `_TRANSLATE` / `_tr()` vivait au sommet de
    `data.countries.js` et est bien vivant, lui. Déplacé dans `traduire.js`

- [x] ~~**E6** — Rien ne relie une traduction à la version du français dont elle est issue~~ ✅
  - **L'instrument existait déjà.** `translation_status` (migration `009`) stocke l'empreinte
    du français au moment de la traduction, et `tools/i18n_fraicheur.php` sait la comparer.
    J'avais proposé de construire ce qui était là depuis le début
  - **Pourquoi il n'a jamais servi** : il sortait toujours en `0`. Un contrôle sans code de
    sortie ne peut être branché nulle part, donc personne ne le lance. Même maladie que R0 —
    un instrument qui existe et qu'on n'appelle pas ne protège de rien
  - Il a maintenant des dents (sortie `1` sur périmée / non scellée / manquante) et
    `tests/run.php` l'appelle. **337 assertions.** Vérifié en cassant volontairement un texte
    français : 5 traductions signalées périmées, sortie 1, puis restauration
  - **Un vrai défaut trouvé au passage, invisible depuis `027`** : `segments()` regroupe par
    valeur française et prend `MAX(champ_lang)` — il suffit qu'UNE ligne porte la traduction
    pour que la valeur passe pour traduite. La Jamaïque et le Costa Rica héritaient de
    « Caraïbes » et « Amérique Centrale », déjà traduits ailleurs : l'export ne proposait
    rien, l'état affichait 100 %, et **l'API rendait du français dans les six langues**
  - Remède : `i18n_contenu.php --propager` recopie une traduction connue sur toutes les
    lignes qui partagent le même français. La traduction est par valeur, le stockage par
    ligne ; il manquait l'étape entre les deux. 10 cases réparées

### R. Relecture du contenu
*Plan détaillé : `docs/relecture.md`.*
- [x] ~~**R0** — Reboucler l'audit géométrique + en faire un outil~~ ✅
  - `tools/coords_check.php` décode le TopoJSON que le front dessine déjà (E3) et teste
    **158 points** : 15 pays, 41 zones, 92 pays à lounges, 10 marchés. Branché sur
    `tests/run.php` — **336 assertions** désormais
  - **Aucun point ne se trompe de pays.** 139 dans leur polygone, 4 en marge côtière
    (≤ 1°, simplification du fond 110m), 12 hors carte (micro-États absents du fond)
  - **Ce que l'outil a révélé n'est pas une erreur de coordonnées** : les Canaries tombent
    à 12° du polygone « Spain », parce que le fond 110m ne dessine pas l'archipel. Le point
    est juste, la carte est grossière. Exception nommée dans `SANS_FOND`, avec sa raison —
    une entité, jamais une catégorie : si Cuba dérive un jour, l'outil le dira quand même
  - **Conséquence visible à l'écran** : le marqueur des Canaries flotte sur l'Atlantique.
    C'est géographiquement exact ; seul un fond plus fin (500 Ko de plus) y changerait
    quelque chose
- [x] ~~**R1** — Les 21 valeurs chiffrées des fiches pays~~ ✅ · migration `028`
  - **4 sourcées, 17 retirées.** Cuba : `$500M` → **827 M$** de CA Habanos 2024 (communiqué
    officiel du XXVe Festival del Habano). Rép. dom. : `~400M cigares/an` → **181 M** roulés
    main exportés, et `$1.2B` → **1,34 Md$** (Intabaco). Nicaragua : `~350M` → **253 M** vers
    les USA (CAA), `$850M` → **368 M$** (COMTRADE). Honduras : `~80M` → **67 M** (CAA)
  - Les huit montants restants n'ont aucune statistique publique derrière eux — vendeurs de
    feuille ou productions non recensées. Retirés, avec le rang « 1er fournisseur mondial
    wrapper » de l'Équateur, le « 1er mondial » dominicain et les deux altitudes de sol
  - **Le chiffre juste peut porter le mauvais intitulé** : les 827 M$ sont le CA mondial d'un
    distributeur, pas des « exportations annuelles ». Et une source honnête peut tromper par
    son périmètre — les 368 M$ mêlent cigares et cigarettes vers une seule destination, ce que
    le détail affiché sous le montant dit désormais
  - **Angle mort trouvé** : `revenue` n'a pas de colonnes `_en/_es/…`. Y écrire « Non publié »
    aurait montré du français aux cinq autres langues. La colonne passe à `NULL`, le panneau
    rend « — », et `rev_detail` porte l'explication traduite. Les trois mentions laissées par
    `027` dans le même angle mort sont parties avec
  - **E6 a servi pour de vrai** : 20 textes français corrigés → 100 traductions périmées
    signalées par la campagne, refaites, rescellées. Exactement le silence qu'il devait tuer
  - **Défaut trouvé en chemin — la légende n'avait jamais été affichée.** `panels.js` lisait
    `c.revDetail` quand l'API sert `rev_detail` : elle fait `SELECT *` et ne renomme rien. La
    ligne sous le montant était donc vide depuis toujours, sans que rien ne le signale
    puisque le champ est facultatif. Un champ rempli, traduit en six langues, sauvegardé — et
    jamais montré. C'est elle qui porte le périmètre des chiffres : sans elle, `368 M$` et
    `1,34 Md$` se lisaient comme comparables
  - **Défaut trouvé en chemin — 133 serveurs de test orphelins.** `tests/bootstrap.php`
    lançait `php -S` sans `bypass_shell` : sous Windows `proc_open` passe par `cmd.exe`, donc
    `proc_terminate()` tuait l'enveloppe et laissait le serveur écouter. Un par campagne
    depuis le 7 août. Et comme un processus Windows hérite des descripteurs de son parent,
    chacun gardait ouverte la sortie standard de sa campagne : `php tests/run.php | grep …`
    ne rendait jamais la main. **Ce qu'on mettait sur le compte d'un tampon de `grep` était
    cette fuite.** Corrigé des deux côtés (`bypass_shell`, puis `taskkill /F /T` de contrôle)
  - ⚠ Les 133 déjà en place datent d'avant le correctif et sont à balayer une fois
- [x] ~~**R2** — Les valeurs des fiches pratiques~~ ✅ · migration `029` · `tools/geo_banquemondiale.php`
  - 135 valeurs (et non 108 : `027` a ajouté trois pays). **45 ne sont jamais affichées** —
    devise, langue et fuseau sont remplacés par `Intl`, et `data.pays.js` couvre les quinze
    pays. Les relire aurait été vérifier ce que personne ne lit
  - **14 PIB périmés sur 14**, tous marqués « (2022) » : Mexique `$1.3T` → **1,83 T$**,
    Nicaragua `$15B` → **22,2 Md$**, Honduras `$28B` → **39,6 Md$**. Populations fausses dans
    les deux sens : Brésil 215 M → **212,8 M**, Rép. dom. 10,8 M → **11,5 M**
  - **Tenus plutôt que corrigés.** `tools/geo_banquemondiale.php` les tire de l'API de la
    Banque mondiale (JSON, l'année attachée à chaque point). `--verifier` tourne **hors
    ligne** dans la campagne — une campagne ne doit pas dépendre du réseau — et échoue si une
    valeur n'annonce pas son année ou passe les trois ans. **338 assertions**
  - Cuba dispensé nommément : la Banque mondiale n'a plus rien après 2020. « On n'a pas
    regardé depuis quatre ans » et « personne ne publie » doivent se distinguer quelque part
  - Philippines : `343 448 km²` → **300 000 km²**, faux de 14 %. Les treize autres superficies
    sont justes — la Banque mondiale ne sert à rien ici, elle publie les terres émergées quand
    une fiche affiche la superficie totale
  - Quatre indépendances **se contredisaient avec le site lui-même** : la fiche disait « 1902 »
    pour Cuba quand `data.fetes.js`, relu en R3, affichait le 10 octobre 1868 sur la même page.
    Aucune n'était fausse — le cri de rupture n'est pas la naissance de l'État. Les deux dates
    sont désormais écrites (Cuba, Équateur, Mexique, Philippines) plutôt qu'arbitrées en silence
  - **La colonne `coords` est supprimée.** Elle portait la capitale quand le marqueur porte le
    centre du pays : 18,7° d'écart aux États-Unis, où l'on affichait Washington. Le pire était
    son voisinage — la distance au visiteur, calculée sur `lat`/`lon`, s'affichait collée
    contre elle. `panels.js` dérive désormais la position du marqueur : une valeur dérivable ne
    se stocke pas, c'est une occasion de diverger, et celle-ci avait divergé
  - Le repli qui servait quand `coords` manquait écrivait « °N » et « °O » en dur — il plaçait
    le Brésil dans l'hémisphère nord. Il ne s'était jamais déclenché ; il est maintenant le
    chemin unique, et corrigé
  - ⚠ **Jakarta reste la capitale de l'Indonésie**, confirmé par la Cour constitutionnelle le
    12 mai 2026 : le décret de transfert vers Nusantara n'est pas signé. Valeur juste
    aujourd'hui, à resurveiller — exactement le cas croate de R3
- [x] ~~**R3** — Les 90 fêtes nationales~~ ✅
  - **88 des 90 confrontées à une source.** Les deux exceptions sont des déductions, pas des
    oublis : le 4 juillet 1776 ne demande pas de source, et Saint-Martin est une collectivité
    française dont la fête est celle de la France, vérifiée
  - **Deux erreurs trouvées et corrigées.** Le **Koweït** était donné comme indépendance au
    25/02/1961 : c'est la fête nationale, pas l'indépendance (19/06/1961), et la date renvoie
    à l'avènement de 1950. La **Croatie** était au 25/06/1991 ; elle est revenue au 30/05/1990
    le 1ᵉʳ janvier 2020, par une loi de 2019. Sa valeur était **juste jusqu'en 2019** — une
    donnée peut devenir fausse sans que personne n'y touche
  - **Deux fausses alertes, aussi instructives.** Des synthèses de sources secondaires ont
    poussé à corriger le Pérou vers le 29/07 et le Paraguay vers le 14/05 : les deux entrées
    étaient justes. Vérifier protège dans les deux sens, à condition de remonter à une source
    qui tranche plutôt qu'à un résumé
  - **Quatre cas où deux dates se disputent le titre** — Burkina Faso, Inde, Maroc, Corée du
    Sud célèbrent aussi autre chose. Le fichier retient l'indépendance et **le documente** ;
    changer d'avis tient en une ligne
  - Taux d'erreur final : **2 sur 90**. Le fichier est désormais la partie la mieux étayée de
    l'atlas — les fiches pays, elles, attendent toujours
- [x] ~~**R4** — Les zones de production~~ ✅ · migration `030`
  - Elles étaient **41**, pas 37 : `027` en avait ajouté quatre. Il en reste **39**
  - **Ce lot montre la limite de R0.** Les trois zones camerounaises tombaient toutes dans le
    Cameroun — `coords_check.php` les validait sans broncher — et toutes les trois étaient à
    500 km de l'endroit où pousse la cape. *Un point peut être dans le bon pays et au mauvais
    endroit ; aucune vérification automatique ne dira jamais cela*
  - **Cameroun** : Mont Cameroun, Mungo et Wouri sont la côte volcanique de Douala. La cape
    pousse **à l'Est, autour de Batouri**, en plein soleil, sur des terres si riches qu'elles
    ne demandent pas d'engrais. Batouri est le seul lieu que les sources nomment : les deux
    autres zones sont **retirées** plutôt que déplacées au jugé
  - **Rép. dominicaine** : La Romana n'est pas « Plantation Arturo Fuente » mais **Tabacalera
    de García** (1971), la plus grande manufacture du pays — Montecristo, Romeo y Julieta,
    H. Upmann. Fuente est à Santiago, 200 km plus loin
  - **Indonésie** : Lombok produit du **Virginia pour cigarettes**, pas du tabac à cigare. Le
    troisième centre historique est **Klaten**, à Java Centre
  - **Nicaragua** : Condega n'est pas « haute altitude » — **560 m, la plus basse des trois
    vallées**, contre 844 m pour Estelí. Son sol rocailleux donne une feuille plus fine
  - **L'erreur camerounaise débordait sur la fiche pays** : `soil` disait « volcanique »,
    `regions` listait les trois lieux faux, `varieties` annonçait un « Cameroon Shade » pour un
    tabac de plein soleil. Corrigés avec — comme l'altitude du Panama en R1
  - Quatre superlatifs énoncés au présent de l'indicatif disent désormais la réputation plutôt
    que le classement : « Meilleure terre à tabac au monde » → « la plus réputée au monde ».
    La réputation est vraie, le classement n'existe pas
  - Deux mots d'anglais partis : « Jamastran Valley », « Microclimate » — comme « Panama City »
    en R2. **338 assertions**, 60 traductions refaites
- [x] ~~**R5** — La prose des fiches~~ ✅ · migration `031` · `tools/coherence_check.php`
  - 162 valeurs : `climate`, `soil`, `harvest`, `notes`, et les listes `tabacaleras`,
    `regions`, `varieties`
  - **La moitié des défauts venait des lots précédents.** Sept affirmations retirées en R1 et
    R4 avaient survécu dans un autre champ de la même fiche : « Premier exportateur mondial en
    valeur », retiré de `rev_detail` par `028`, vivait toujours dans `notes` ; « Lombok »,
    retiré des zones par `030`, restait dans `regions` **et** `varieties` ; « Jamastran
    Valley », francisé en zone, pas dans `regions`
  - **Une correction ne suit pas la donnée, elle suit le champ.** Tant qu'un même fait est
    écrit à trois endroits, le corriger une fois n'en corrige qu'un tiers. Rien ne pouvait le
    voir : chaque champ était juste vis-à-vis de lui-même
  - `tools/coherence_check.php` compare désormais `regions` aux zones réellement posées sur le
    globe et refuse le retour des rangs mondiaux non sourcés. **Vérifié en cassant
    volontairement les deux garde-fous.** Branché sur la campagne — **339 assertions**
  - **Trois erreurs de fait inédites.** Cuba : la Vuelta Abajo n'est pas volcanique mais faite
    de débris **calcaires** érodés et de limons du Quaternaire — rouges et ferrugineux, d'où la
    confusion. Cameroun : « BAT Cameroun » est un **cigarettier** ; la cape a été tenue par le
    monopole **SEITA** jusqu'en 1993 et est négociée depuis 120 ans par **M. Meerapfel &
    Söhne**. Philippines : « Burley · Virginia » sont des tabacs à **cigarettes**, exactement la
    faute de Lombok en R4
  - Le Brésil listait **Suerdieck** parmi ses producteurs actuels alors que `026` avait établi
    sa fermeture en 2000. La maison reste nommée — elle compte dans l'histoire du Mata Fina —
    mais datée
  - Cinq superlatifs disent la réputation plutôt que le classement, comme en R4

- [x] ~~**R2 bis** — Les 45 valeurs que R2 avait écartées~~ ✅ · migration `032`
  - Devise, langue et fuseau des 15 pays : le repli que `Intl` remplace toujours à l'écran.
    **41 sur 45 étaient justes** — le meilleur taux de la relecture, logique pour des données
    de référence stables. Quatre défauts de forme (Panama sans code ISO, « Córdoba oro »,
    « Fr./Anglais », Brésil et Mexique annonçant un fuseau unique alors qu'ils sont dans
    `PAYS_MULTIFUSEAUX`)
  - **Le vrai défaut n'était pas dans la base : `producer_geo` avait raison et l'écran avait
    tort.** `data.pays.js` est indexé par code ISO, **déduit du drapeau** — les Canaries
    arborent 🇪🇸 et héritaient donc de `Europe/Madrid`. Leur fiche affichait **l'heure de
    Madrid, une heure de trop toute l'année**. La base disait « UTC+0 », c'est-à-dire juste,
    et ce repli juste ne pouvait pas se déclencher
  - Corrigé par `TERRITOIRES_INFOS`, indexé par identifiant de fiche — c'est le drapeau qui ne
    discrimine pas. `coherence_check.php` compare désormais les deux copies
  - **Leçon sur le contrôle lui-même** : sa première version acceptait le décalage d'hiver *ou*
    celui d'été pour ménager Cuba. La contre-épreuve l'a démasquée — « UTC+1 » injecté sur les
    Canaries passait sans bruit. **Un contrôle qui accepte les deux réponses ne vérifie rien.**
    Il lit maintenant le drapeau `isdst` des transitions IANA
- [x] ~~**R2 ter** — Les 78 autres pays de `data.pays.js`~~ ✅ · `coherence_check.php`
  - Le fichier portait depuis sa création « **À RELIRE, saisi de mémoire** » et couvre 93 pays.
    **Les relire un par un aurait refait l'erreur qu'on corrige** : PHP embarque **tzdata**
    pour les fuseaux et **ICU/CLDR** pour les devises. 234 valeurs confrontées à une autorité
    plutôt qu'à un souvenir
  - **Deux défauts sur 234.** Sint Maarten annonçait `ANG` : le florin caribéen **`XCG`** l'a
    remplacé le 31 mars 2025, l'ancien n'ayant plus cours depuis le 1er juillet 2025. Et
    `PAYS_MULTIFUSEAUX` n'en comptait que 8 au lieu de **12** — manquaient le Chili (île de
    Pâques), l'Équateur (Galápagos), l'Espagne (Canaries), le Portugal (Açores)
  - **Les deux manques les plus gênants étaient sous nos yeux** : l'Espagne, dont les Canaries
    ont leur propre fiche — celle dont on venait de corriger l'heure — et l'Équateur, **pays
    producteur relu à la main en R2**, dont j'avais noté les Galápagos sans en tirer la
    conséquence. L'audit mécanique a vu ce que la relecture attentive avait laissé passer
  - **L'Ukraine est écartée délibérément** : tzdata lui rattache `Europe/Simferopol` à UTC+3,
    l'heure imposée en Crimée occupée, quand l'heure légale ukrainienne est UTC+2 partout. Le
    contrôle le propose, on le refuse, et la raison est écrite dans le code
  - **Demi-réparation rattrapée** : l'astérisque « plusieurs fuseaux » vient aussi de
    `PAYS_MULTIFUSEAUX`, indexé par drapeau. L'Espagne ajoutée, les Canaries se voyaient
    signalées « plusieurs fuseaux » par héritage alors qu'elles n'en ont qu'un
  - Ces contrôles valent surtout pour l'avenir : une devise qui change apparaîtra à la mise à
    jour suivante d'ICU. **339 assertions**
- [x] ~~**R1 bis** — Les revenus manquants~~ ✅ · migrations `033`, `034`
  - Onze fiches sur quinze affichaient un tiret. Choix assumé de `028` — une valeur non sourcée
    est retirée — mais onze tirets se lisent comme un trou
  - **Nicaragua : le chiffre mesurait la mauvaise chose.** `028` avait remplacé un `$850M`
    inventé par 368 M$ sourcés, mais sur les exportations de **tabac** vers les **États-Unis** —
    ligne douanière mêlant cigares et cigarettes, une seule destination. La bonne mesure est
    HS 2402.10 vers le monde : **425 M$ (2023)**, série cohérente sur trois ans
  - **Philippines** : la NTA publie **3,84 M de cigares exportés (2024)**. Remplit `production`,
    pas `revenue` — la NTA donne les volumes de cigares et la valeur du **tabac brut**, jamais la
    valeur des cigares
  - **Brésil : 576 015 $ (2024)**, 7,1 t. L'API ComexStat est bloquée par quota IP ; le même
    ministère publie les **déclarations douanières brutes** sans quota — source supérieure,
    l'API n'en étant qu'une vue
  - ⚠ **Le piège, qui a failli passer.** Ces fichiers font 100 Mo et la connexion les coupe sans
    prévenir : `curl | grep` rend alors **moins de lignes sans aucune erreur**. Quatre chiffres
    brésiliens ont été produits ainsi — le pire annonçait « aucune exportation en 2021 », un
    autre donnait 46 445 $ pour 2023 à partir d'un fichier descendu à **16 %**
  - Deux garde-fous obligatoires pour ce genre de source, écrits dans `034` : comparer les
    octets reçus au `Content-Length` et reprendre avec `curl -C -` (24 reprises ici) ; et
    compter un **témoin** dont on connaît l'ordre de grandeur — les 1 129 lignes de feuille que
    le Brésil exporte massivement. *Un témoin ridicule dénonce la troncature ; un faible compte
    de cigares, non*
  - **Correction d'une affirmation précédente** : `033` rangeait les chiffres bas de COMTRADE
    pour le Brésil parmi les fragments. Inférence fausse — ils étaient justes. Le commentaire est
    amendé : « incomplet de façon imprévisible », pas « faux partout »
  - Neuf tirets restent, tous assumés : cinq pays vendent de la **feuille**, pas des cigares
- [x] ~~**R1 ter** — Le tiret devient une phrase~~ ✅ · `panels.js`, `components.css`
  - Neuf fiches sans montant affichaient « — ». Le choix était juste, la lecture ne l'était pas :
    un tiret se lit comme une **donnée manquante**, et neuf tirets sous une étiquette qui promet
    un montant font passer l'atlas pour incomplet
  - Or la raison est souvent l'information la plus intéressante de la fiche. Sans montant,
    l'explication prend désormais la place principale — « le wrapper est vendu de gré à gré aux
    fabricants » plutôt qu'un blanc
  - **Volontairement pas le style du chiffre** : italique, plus petit, moins contrasté
    (`.rev-absente`, `.lex-v-raison`). Une phrase ne doit pas se lire comme une valeur
  - Le panneau gauche n'affichait même **pas** le détail : son tiret solitaire ne disait rien du
    tout. Il porte maintenant la même raison
- [x] ~~**R1 quater** — Les États-Unis, et le critère appliqué à tous~~ ✅ · migration `035`
  - `033` avait retenu le Nicaragua sur un critère explicite — série de plusieurs années **sans
    trou**, valeur et tonnage évoluant ensemble — **sans passer les huit autres pays au même
    test**. Un critère qui ne sert qu'une fois n'est pas un critère
  - **États-Unis : 15,6 M$ (2024)**, six ans pleins de 40,8 à 15,6 M$, 91 à 136 $/kg. Retenu
  - Écartés : Honduras (trous en 2019, 21, 22, 24), Indonésie (2019 vaut vingt fois les autres),
    Panama (19,9 M$ en 2020, 0,00 en 2023), et Cameroun / Équateur / Jamaïque / Mexique, quasi
    nuls — ce qui n'est pas une lacune mais l'information : ces pays vendent de la **feuille**
  - **Le Costa Rica passe le critère et est écarté quand même.** Sa série est propre mais
    contredit sa propre fiche : 100 t, une douzaine de millions de pièces, pour « un seul
    acteur, séries très limitées ». Deux affirmations contradictoires sur la même page, ce que
    R5 a passé une migration à retirer
  - **Le doute costaricien a révélé une imprécision générale** : HS 2402.10 n'est pas « les
    cigares » mais « cigares, cheroots **et cigarillos** ». Trois fiches annonçaient
    « exportations de cigares » — même défaut que le Nicaragua de `028`, un chiffre juste sous
    un intitulé trop large
  - ⚠ **Le test a cassé une seconde fois, et c'était ma faute** : il prenait les États-Unis comme
    exemple de pays *sans* montant, et cette migration leur en donne un. Il épinglait un **pays**
    là où il devait épingler un **comportement**. Combler un revenu manquant est un progrès :
    ça ne doit pas faire rougir la campagne
  - **Cinq pays chiffrés, dix qui disent pourquoi**
- [x] ~~**R1 quinquies** — Un revenu pour quatorze pays sur quinze~~ ✅ · migration `036`
  - **La voie qui manquait** : jusqu'ici on demandait à chaque pays ce qu'il **exporte**. Les
    petits producteurs déclarent mal et par à-coups. On demande désormais aux **États-Unis ce
    qu'ils importent** de lui — le Census américain déclare avec une régularité que le Honduras
    n'a pas, et les États-Unis sont le premier marché mondial du cigare
  - Séries pleines sur six ans : **Honduras 115 M$**, **Indonésie 8,7 M$**, **Costa Rica
    2,95 M$**
  - **Le Costa Rica se règle de lui-même** : `035` l'avait écarté parce que ses 100 t
    contredisaient « un seul acteur, séries très limitées ». Vu des douanes américaines,
    2,95 M$ pour 19 t — compatible. La contradiction venait du chiffre mondial, pas de la fiche
  - **Mesurer ce que le pays vend vraiment.** Cameroun, Équateur et Mexique n'exportent aucun
    cigare vers les États-Unis — six ans de zéro. Ils vendent de la **feuille** ; les mesurer au
    cigare revenait à peser un boulanger au poids de sa farine. HS 2401 leur donne un chiffre
    qui décrit leur métier : **Mexique 13,7 M$**, **Équateur 2,65 M$**, **Cameroun 0,73 M$**
  - ⚠ **La colonne n'est plus homogène, et c'est assumé.** Trois bases coexistent — CA d'un
    distributeur (Cuba), exportations mondiales (Rép. dom., Nicaragua, Brésil, États-Unis),
    importations américaines (les autres). Les uniformiser serait pire : tout ramener aux
    importations américaines mettrait **Cuba à zéro** (embargo). La parade est celle de R1 —
    `rev_detail` s'affiche sous le montant et nomme sa base
  - **Jamaïque : 0 M$, et il est juste.** Aucune importation américaine sur six ans ; comme les
    États-Unis déclarent exhaustivement, cette absence *est* la donnée
  - **Îles Canaries : le seul pays sans montant.** L'ISTAC publie bien leur commerce extérieur
    séparément — **127 M€** de tabac exporté en 2024, devant la banane — mais l'essentiel est de
    la **cigarette** et la part du cigare n'est pas ventilée. Publier les 127 M€ referait pour la
    quatrième fois l'erreur de `028`. Le détail affiche le fait **et** sa limite
- **La relecture est terminée** — six lots. Ce qu'il en reste n'est pas une liste de
  corrections mais **quatre contrôles branchés sur la campagne** : `i18n_fraicheur.php` (E6),
  `coords_check.php` (R0), `geo_banquemondiale.php` (R2), `coherence_check.php` (R5). Les trois
  premiers existaient déjà sous une forme ou une autre et **ne servaient à rien faute de code
  de sortie** — c'est le motif qui revient le plus dans ce journal
- ⚠ **Ce que la relecture ne dit toujours pas** : le compteur « relue » est à **zéro sur 6 405
  traductions**. Aucun humain n'a validé les cinq langues étrangères. Cette dette-là ne se
  comble pas par un outil

### Les fiches de feuilles (migrations `038`→`052`)

- **29 fiches, 15 pays producteurs**, chacune avec genèse, culture, caractères, notes et
  accords dans les six langues. Toutes atteignables : `coherence_check.php` vérifie
  désormais **les deux sens** — une fiche qu'aucune étiquette ne désigne est injoignable,
  une étiquette sans fiche est un article qu'on croit écrit et qui ne l'est pas
- **Le glossaire des arômes** (`051`) : vingt phrases qui rendent « Terre » ou « Cuir »
  compréhensibles à qui ne pratique pas. Clé `(famille, contexte)`, parce que *Cacao* en
  note annonce ce qu'on va goûter et *Chocolat noir* en accord ce qu'on boit à côté
  - Cette clé composée a révélé un défaut dormant depuis `009` : les outils i18n
    identifiaient une ligne par la **première** colonne de sa clé primaire, et le dump
    recopiait donc une glose sur l'autre. Voir `docs/relecture.md`, dernière section
- **Deux étiquettes restaient sans article** ; elles ne demandaient pas le même geste
  (`052`). *Ecuador Sumatra* était un vrai manque — la troisième cape équatorienne, entre
  la douceur de la Connecticut et le corps de l'Habano. Le *« Claro »* mexicain était une
  **erreur de catégorie** : c'est une nuance de cape, pas une variété. Le corpus le disait
  déjà — dans les fiches de marques, « Claro » n'apparaît jamais seul, toujours accolé à
  une variété (« Habano Claro », « Colorado Claro »). Retiré plutôt que documenté
- ⚠ **Reste en français dans les six langues** : le champ `emploi` (« Cape », « Tripe et
  sous-cape »), sous-titre de chaque fiche. Vocabulaire fermé de neuf valeurs, jamais
  déclaré dans le plan de traduction

### L'Italie, seizième pays producteur (`053`, `054`)

- **Le seul terroir d'Europe continentale**, et l'une des deux seules origines au monde
  à sécher son tabac à cigare **au feu** — l'autre étant le Kentucky/Tennessee américain.
  Kentucky cultivé en Valtiberina (Toscane-Ombrie) et en Campanie, qui donne le Toscano
- **36,0 M$ (2024)**, exportations de cigares vers le monde (COMTRADE, HS 2402.10). Série
  complète sur six ans, mais **2020, 2022 et 2024 sont revenues vides au premier appel** :
  trois relances les ont remplies. Témoin de complétude posé à côté — le tabac brut italien
  (HS 2401) sort à 417 M$ pour 55 633 t, donc l'endpoint ne tronquait pas
  - Ces 417 M$ ont été **écartés comme base de revenu** : c'est surtout du Virginia pour la
    cigarette, et les prendre referait l'erreur des Canaries
  - Le montant ne mesure que l'export ; le Toscano se vend d'abord en Italie, et `notes` le dit
- Le Veneto est **volontairement absent** des zones : on y cultive du Bright pour la
  cigarette. L'y mettre répéterait l'erreur de Lombok, retirée par `030`
- La grappa a rejoint la famille « spiritueux » de `famille_arome`, et la glose de cette
  famille a dû être **réécrite** : elle parlait de canne et de fût de chêne, ce qui est vrai
  du rhum et faux de la grappa. Une glose écrite d'après son exemple le plus fréquent ment
  dès qu'un membre s'ajoute à la famille
### Les drapeaux dessinés, repris un par un

Les drapeaux des fiches pays sont **peints en code** sur canvas, et ondulent. Le choix a été
confirmé plutôt que remplacé par des images — mais il fallait qu'ils ressemblent aux vrais.

- **Quatre pays n'avaient aucun dessin** : Costa Rica, Canaries, Jamaïque, et l'Italie depuis
  `053`. Ils tombaient sur trois bandes grises — un défaut **invisible par construction**,
  puisque trois bandes grises sont un dessin valide pour qui ne connaît pas le drapeau attendu
- **Huit corrections** sur les douze existants, trouvées en les faisant rendre côte à côte
  plutôt qu'en lisant le code :
  - Cuba et Philippines : triangle de hampe **écrasé** (0,62 et 0,72 au lieu de √3/2 ≈ 0,87)
  - Philippines : **deux étoiles sur trois hors du triangle**, posées sur le bleu et le rouge
  - Honduras : cinq étoiles en zigzag sur toute la largeur au lieu d'un quinconce centré
  - Nicaragua : l'emblème était un **losange rouge** ; c'est un triangle à volcans et arc-en-ciel
  - Brésil : la banderole était un arc **sur le flanc droit** du globe ; elle le traverse. Et
    8 étoiles au lieu de 27
  - Équateur : armoiries réduites à une tache grise translucide
  - Rép. dominicaine et Panama : peints au `fillRect` nu, donc **raides** pendant que les
    autres flottaient
  - Mexique : l'aigle était un empilement de trois disques
- Les armoiries du Mexique, de l'Équateur et de la Rép. dominicaine restent des **stylisations
  assumées** : à trente pixels, un blason est une silhouette
- `coherence_check.php` compare désormais `FLAGS_DESSINES` à `producer_countries` — c'est le
  contrôle qui manquait, et qui aurait signalé l'Italie le jour même de `053`
### Puis les quatre-vingt-sept autres

Les seize pays producteurs faits, restaient les **92 pays à lounges et les 10 marchés** —
87 identifiants sans dessin, soit **78 drapeaux réels** une fois les doublons de marché
(`usa_mkt`, `france_mkt`…) renvoyés vers le pays qu'ils désignent.

- **Une table déclarative plutôt que cent `case`.** À seize, écrire chaque drapeau en code
  tenait ; à quatre-vingt-quatorze, chaque tricolore aurait recopié les mêmes trois lignes.
  `FLAGS_SPEC` décrit en une ligne les drapeaux qui se ramènent à des bandes plus, parfois,
  une figure. Seuls les quatorze qui n'entrent dans aucun moule — Union Jack, pairle
  sud-africain, taegeuk coréen, dentelures du Qatar — gardent un tracé dédié
- **Les emblèmes complexes sont des stylisations assumées** et le code le dit : sphère
  armillaire portugaise, aigle égyptien, armes du Guatemala, chahada saoudienne. À trente
  pixels, un blason est une silhouette — on cherche la lecture juste, pas le fac-similé
- **Un défaut trouvé au rendu, invisible autrement** : l'Australie ne peignait que son canton
  et ses étoiles, sans champ bleu. Sur une vignette blanche ça ressemblait à un drapeau ;
  sur le panneau sombre du site, à un trou. La liste était complète, la fonction ne jetait
  pas, aucun compteur ne bronchait
- **Deux garde-fous, tous deux vus échouer** :
  - `coherence_check.php` couvre désormais les **trois** familles de fiches — producteurs,
    pays à lounges, marchés — soit 118 fiches. Ne vérifier que les seize producteurs aurait
    laissé quatre-vingt-sept fiches sur des bandes grises
  - `tests/e2e/drapeaux.spec.js` mesure la **surface peinte** de chaque drapeau sur quatre
    trames d'animation. C'est la seule chose qui attrape le cas australien : en le
    réintroduisant, le test le dénonce à 27 % de couverture

### Les emoji remplacés par des vignettes dessinées

- **Le défaut, mesuré** : la largeur de 🇮🇹 égale celle des deux indicateurs régionaux pris
  séparément, contre 55 px pour un emoji ordinaire. Windows n'embarque aucun glyphe de
  drapeau et rend « IT ». macOS, iOS et Android les affichent parfaitement — c'est pourquoi
  le défaut a tenu si longtemps : **il ne se voit pas chez celui qui développe sur Mac**
- Puisque `drawFlag()` sait tracer les 103 fiches, on s'en sert : une **vignette PNG en
  data-URL**, mise en cache par identifiant et par taille. Pas de fichier à héberger, pas de
  requête réseau, rien à autoriser dans la CSP. L'Explorer affiche 500 vignettes tirées de
  185 dessins
- Six emplacements basculés : en-tête de fiche pays, en-tête du panneau lounges, cartes de
  l'Explorer, bulle de regroupement, bandeau de fête nationale. Là où une image est
  impossible — les `<option>` du formulaire de contribution — l'emoji est **retiré** plutôt
  que laissé : « IT Italie » n'aide personne
- La **liste d'accessibilité** perd aussi ses emoji : un lecteur d'écran sous Windows épelait
  « I T » avant chaque nom de pays, qui est déjà écrit juste après
- Trois assertions Playwright verrouillent l'ensemble, dont une qui cherche explicitement le
  plan U+1F1E6–U+1F1FF dans les cartes : si un emoji de drapeau revient, elle le dit

### Ce que les fiches de marques affirmaient (`056`, `057`, `058`)

Un inventaire des 116 maisons a mesuré **274 assertions non sourçables** — 61 notes
chiffrées, 73 anecdotes, 140 éditions limitées — soit **1 644 une fois les six langues
comptées, un quart du contenu traduit de l'atlas**. Le compteur `relue` est toujours à zéro.

- **Les paroles prêtées d'abord** (`057`), parce que c'est le seul endroit où une erreur de
  contenu cesse d'être un problème avec un lecteur pour devenir un problème avec une
  personne. Sur huit citations, **une seule était authentique** : le vers de Kipling dans
  « The Betrothed ». Les sept autres étaient des aphorismes plausibles attribués à des gens
  réels. Retirées, avec trois affirmations sur la consommation de **personnes vivantes** —
  Michael Jordan, Jack Nicholson, Arnold Schwarzenegger — et celle d'Alain Ducasse
  - Cinq entrées réécrites sans la parole inventée : le fait documenté tenait sans elle
  - Les suppressions passent par `JSON_REMOVE` sur **les six colonnes à la fois**, index
    décroissants. Retirer `[1]` du français seul aurait décalé le reste : le lecteur anglais
    aurait lu l'anecdote de Churchill sous le nom de Groucho Marx
- **Les 61 notes chiffrées retirées** (`058`). Aucune n'était sourçable. Signal
  supplémentaire : **52 des 61 tombaient entre 2018 et 2023**, en une montée régulière
  jusqu'à douze pour la seule année 2022 — une bibliographie réellement compilée est
  grumeleuse, contient les classements anciens et célèbres, et a des trous
- **`tools/marques_check.php`** empêche le stock de se reconstituer. Trois règles, **toutes
  vues échouer** avant d'être gardées : `source_url` en http(s) exigé sur toute note ; aucune
  parole prêtée hors liste explicite ; et les six colonnes de chaque tableau doivent porter
  le même nombre d'entrées
  - ⚠ **C'est la troisième règle qui a trouvé ce que les deux autres manquaient.** Drew Estate
    et Macanudo portaient deux anecdotes en français et **une seule dans les cinq autres
    langues**. Les deux orphelines étaient précisément du genre que `057` retirait, et avaient
    survécu au balayage parce qu'elles ne contiennent ni citation ni verbe de consommation.
    Le contrôle de forme rattrape ce que le contrôle de fond laisse passer — les deux ne se
    remplacent pas
- **`056`** avait enrichi onze marcas cubaines sur des faits d'histoire seulement, et laissé
  `scores` vide d'emblée. Quatre marcas restent sans rubrique — Juan López, La Flor de Cano,
  Saint Luis Rey, Vegueros — faute de fait documenté, ce qui est l'information juste
### La fuite d'anglais dans les colonnes traduites (`059`→`072`)

Des colonnes espagnoles, allemandes, chinoises et arabes contenaient de l'**anglais** — et pas
une bribe : le texte anglais entier, recopié tel quel dans les quatre langues. Le récit du
My Father Le Bijou 1922 était le même texte anglais dans les quatre.

- **Aucun compteur ne pouvait le voir.** `i18n_fraicheur` compte les cases REMPLIES et vérifie
  de quel français elles dérivent. Une case remplie d'anglais est remplie, et scellée sur le
  bon français : la traduction existe, elle est simplement dans la mauvaise langue.
  « 100 % traduit » était vrai et ne disait rien
- **`tools/i18n_langue_check.php`** mesure des mots outils anglais avec un **témoin français** :
  4 sur 575 déclencheraient le détecteur, donc il ne compte pas des faux positifs. Le chantier
  faisant ~131 000 caractères, il fonctionne au **cliquet** — le compte ne peut que descendre,
  et aucun élément nouveau ne peut apparaître
- **691 → 0**, en quinze lots. Progression du cliquet : 691 → 635 → 551 → 535 → 459 → 368 →
  360 → 329 *(mesure affinée, +37 défauts réels révélés)* → 323 → 315 → 249 → 181 → 125 → 73
  → 27 → **0**. Fraîcheur pleine, zéro écriture étrangère, 116 fiches vertes
- ⚠ **6 695 traductions, 0 relue par un humain.** Le compteur `relue` reste à zéro : c'est le
  seul chiffre qui engage quelqu'un, et personne n'est encore engagé

**Ce que la relecture a trouvé, et qu'une traduction mécanique aurait recopié :**

- **Montecristo portait l'anecdote de Kennedy — qui concerne H. Upmann.** Et les deux versions
  se contredisaient : chez H. Upmann ce sont les cigares de Kennedy, chez Montecristo « les
  cigares préférés de Pierre Salinger », qui était l'attaché envoyé les acheter. Aucun contrôle
  ne pouvait le voir : chaque fiche était cohérente **avec elle-même** — la panne du lot R5,
  celle qui avait fait naître `coherence_check`
- **Dix-neuf notes de presse cachées dans la prose** des vitoles, en deux vagues. La seconde
  (six) a survécu à la première parce que mon motif exigeait le nombre *juste après* « score »,
  et que le nom de la revue s'intercale : « Score Cigar Aficionado 93 ». **Troisième fois dans
  ce chantier qu'un contrôle rate par sa forme et non par son intention**
- **Deux affirmations au conditionnel** : Sinatra qui « aurait fumé les premiers prototypes
  Avo », Clark Gable qui « aurait fumé plus de 300 cigares » sur un tournage. Un chiffre précis
  sous un conditionnel — la combinaison la plus trompeuse qui soit
- Une suppression par expression régulière a été **refusée** : elle produisait « Lancée 2004,
  Cigar Aficionado. » et « lors du lancement. ». Les dix-neuf récits sont réécrits à la main
### Ce que les douze lots suivants ont trouvé (`062`→`072`)

**Sept fois, un contrôle écrit pour une affirmation a raté la même affirmation.** Les sept
échappées ne sont pas sept étourderies : elles se rangent sur **trois axes distincts**, et
c'est ce classement qui vaut d'être retenu.

- **Axe 1 — la FORME de l'idée.** Cinq écritures d'une note de presse : « Score 96 » (`059`),
  « Score Cigar Aficionado 93 » (`061`, le nom de la revue s'intercale), « Top 25 » / « classé
  parmi » (`064`, pas de mot « score »), « scores 93-95 » (`065`, le pluriel bloque `\b`),
  « Score parfait 100/100 » (`067`, trois chiffres et non deux). Puis « le meilleur PETIT
  cigare cubain » (`068`), où l'adjectif s'intercale
- **Axe 2 — la COLONNE.** « Le cigare de l'année n°1 » chez My Father (`068`). Le motif
  connaissait la formule ; il ne lisait que `gamme.story`, et elle était dans
  `celebrities.anecdote`. **Un contrôle rate aussi ce qu'il ne regarde pas.** Les trois champs
  narratifs sont balayés depuis
- **Axe 3 — le MARQUEUR.** La Flor Dominicana posait deux phrases entières entre guillemets,
  après un point, **sans aucun verbe** (`071`). Le détecteur cherchait la syntaxe de
  l'attribution — « dit », « déclara », un deux-points. Ici l'attribution était faite par
  **l'en-tête de la fiche**, « José Blanco » en gras au-dessus, et une expression régulière ne
  lit pas la mise en page. `citation_en_soi()` ne cherche plus de verbe : une portion citée
  longue, ou contenant une phrase complète, suffit

**Trois personnes réelles, trois citations inventées** — dont deux **vivantes** : José Blanco
(La Flor Dominicana) et Hendrik Kelner (Santa Damiana). Plus Ramón Cifuentes (Partagás USA).
Chez Kelner le verbe était là — « répète-t-il » — mais absent de la liste. **Un inventaire de
verbes est toujours incomplet ;** c'est pour cela que la règle ne s'y appuie plus.

- **Bianca Jagger retirée** de Joya de Nicaragua (`069`) : « souvent photographiée avec des
  cigares » ne renvoie à aucune photo, et la seule chose vérifiable — être née à Managua — ne
  relie personne à une marque. Personne vivante, militante des droits humains, rangée parmi les
  figures d'une marque de tabac sans l'avoir jamais dit
- **Un en-tête qui contredisait son texte** (`069`) : la migration `065` avait réécrit
  l'anecdote de Joya pour dire qu'aucune préférence de Nixon n'est attestée — et laissé le
  titre « Richard Nixon » au-dessus. **Ma propre correction était incomplète, et aucun contrôle
  ne compare un en-tête à son texte**
- **Trois dates de marque collées à une gamme** : Trinidad 1985 (`062`), Rocky Patel « vieilli
  depuis 1992 » (`068`), Romeo y Julieta « lancée en 1875 » (`070`). Une fiche de gamme veut une
  date, et la seule disponible est celle de la maison
- **Quatre doublons divergents** : Kennedy sur Montecristo *et* H. Upmann, Drew Estate *et*
  Liga Privada (`066`, avec la coquille « il en a **épité** quelques millions »). Chaque fiche
  est cohérente **avec elle-même** — le seul angle mort que `coherence_check` ne couvre pas
- **Cinq fautes de français dans le texte source** — « teste chaque blend en **les** fumant »
  (`068`), « un accord d'**une** raffinement absolu » (`069`), « l'Armagnac **vieillit** »
  (`071`), « le cognac d'entrée gamme » et « poivre **commun** aux deux » (`072`). **Toutes les
  cinq trouvées en traduisant, aucune en relisant le français.** Relire sa propre langue, c'est
  glisser sur le sens déjà connu ; traduire oblige à décider ce que chaque mot fait
- **`--autotest`** : le détecteur de paroles ayant échoué cinq fois, `marques_check.php` porte
  désormais **douze cas construits** — chacun une tournure qui l'a déjà pris en défaut — joués
  à chaque campagne. Un passage vert sur le corpus du jour ne dit rien de la santé du contrôle
- **Une exception nommée plutôt qu'un motif affaibli** : El Rey del Mundo *rapporte* un slogan
  de 1848 en le qualifiant de réclame immodeste. `AFFIRMATIONS_HISTORIQUES` la déclare et la
  réaffiche à chaque passage vert — une exception qu'on ne voit plus redevient un trou
- **Un compromis assumé** : le deux-points et « comme » ont quitté les marqueurs de parole. Ils
  produisaient deux faux positifs constants (« L'idée : la 'zone dorée' », « considéré comme le
  meilleur 'petit cigare' »). Le prix : une citation **courte** introduite par un seul
  deux-points n'est plus vue. Le même signe sert aux deux usages, on ne peut pas avoir les deux

### Trois signalements d'un lecteur (`080`→`082`)

Trois remarques d'usage, dont une a mis au jour un angle mort que **aucun compteur du projet ne
pouvait voir**.

**« Moho azul, qu'est-ce que c'est ? »** C'est le champignon qui a détruit les récoltes cubaines
à la fin des années 1970 — en français, le **mildiou bleu**. Il apparaît sur quatre fiches de
feuilles, et **une seule l'expliquait** (« — un champignon — », sur Habano 2000). Ces fiches
s'ouvrent indépendamment : le lecteur qui entre par Criollo 98 lit un mot espagnol que rien ne
lui explique. Même motif que les défauts précédents — juste à un endroit, absent à un autre.

> Ce qui rend ce cas nouveau : **les cinq autres langues avaient traduit** (blue mould,
> Blauschimmel, العفن الأزرق). Le français était la seule des six à garder le terme espagnol.
> La campagne cherchait de l'anglais dans les colonnes traduites ; **personne ne cherchait de
> l'espagnol dans la colonne source**. Un mot étranger non traduit dans la langue de départ ne
> déclenche aucun contrôle — il ne peut être signalé que par un lecteur.

Au passage, une coquille chinoise identique sur les quatre fiches : **霉霜病** au lieu de
**霜霉病**, les deux caractères du milieu inversés. Recopiée d'une traduction à l'autre.

**Deux maisons manquantes**, portant l'atlas à 118 marques :

- **Casdagli** (`081`) — quatrième maison du Costa Rica, après Atabey, Bandolero et Byron, toutes
  trois de Selected Tobacco. Le Costa Rica n'a pas de terroir tabacole : sa présence dans l'atlas
  tient entièrement à deux ateliers qui y roulent des feuilles venues d'ailleurs, et la fiche du
  pays devenait fausse par omission sans la seconde.
**⚠ Les deux étaient invisibles depuis le globe** (`084`). Insérer une ligne dans `brands` ne
suffit pas : la liste affichée sur la page d'un pays vient d'ailleurs, du JSON
`producer_countries.brands`. **Même fait, deux domiciles** — et écrire dans l'un n'inscrit rien
dans l'autre. Les deux fiches répondaient 200 sur leur URL et la recherche les trouvait ; le
chemin le plus naturel, ouvrir le pays et lire ses maisons, ne les montrait pas.

C'est le défaut de la migration 021, « les onze articles que personne ne pouvait ouvrir ». Le
balayage complet n'a trouvé que ces deux-là : les 116 autres figurent bien dans la fiche de leur
pays — c'est mon insertion qui était incomplète, pas le modèle. `coherence_check` vérifie
désormais ce sens-là aussi, et la contre-épreuve échoue comme elle doit.

- **Capitol** (`082`) — maison nicaraguayenne. La fiche ne porte **que** le nom et le pays :
  ni année, ni atelier, ni gammes. Ces rubriques restent vides, comme pour Juan López, La Flor
  de Cano, Saint Luis Rey et Vegueros. La tentation, sur une marque qu'on connaît mal, est
  d'écrire ce que disent les revendeurs — « assemblage nicaraguayen corsé, poivre et cacao » —
  ce qui est plausible pour n'importe quel cigare nicaraguayen, donc ne dit rien, et **aurait
  exactement l'air d'un fait**. La fiche existe malgré son vide parce que l'absence trompe
  davantage : un atlas qui ne mentionne pas une maison laisse croire qu'elle n'existe pas.

Le logo fourni n'est pas repris : marque déposée, et le chantier des logos reste suspendu à
l'avis loi Évin.

### Le vocabulaire, terminé (`089`→`094`)

Six lots. Le français de l'atlas ne porte plus `wrapper`, `blend`, `full body` ni `medium-full`
nulle part — hors **noms propres** conservés : « VSG — Virgin Sun Grown » (gamme Ashton),
« American Barrel-Aged » (gamme Camacho), « Toro Sun Grown Natural » (format Perdomo).

| lot | portée |
|---|---|
| `089`–`090` | `brands.history`, 25 fiches → **0** |
| `091`–`092` | `brands.gamme`, 55 récits → **0** |
| `093` | reliquat + deux fiches d'établissement |
| `094` | `lounges.description`, 17 « walk-in humidor » et 2 fiches entièrement en anglais |

**Ce que la relecture a fait remonter, encore.** Remplacer un mot oblige à relire la phrase, et
chaque lot a livré des défauts qui n'avaient rien à voir avec le vocabulaire :

- **quinze affirmations non sourçables** — « la référence mondiale du Honduran Corojo », « le
  laboratoire le plus actif de l'industrie », « l'un des rares wrappers du monde », « la seule
  maison à », « les cigares les plus doux du marché », « le best-seller depuis 30 ans », « la
  révolte ouvrière la plus réussie », « le cigare de golf premium par excellence »… Aucune n'est
  attrapée par le motif des rangs mondiaux : *du marché*, *de l'industrie*, *la seule*, *que
  personne n'avait osés* sont autant de façons de dire un premier rang sans écrire « monde ».
- **un conditionnel sur Sinatra** — « le cigare que Sinatra aurait aimé fumer ». La migration
  `060` s'appelait *avo_sinatra* : elle avait traité l'anecdote et laissé le récit de gamme.
- **un doublon que ma propre correction avait manqué** — « le best-seller américain depuis 30
  ans » vivait sur la fiche Macanudo **et** sur celle de General Cigar. La migration `070` n'en
  avait corrigé qu'une.
- un néologisme (« capes connecticutaises »), une répétition (« la gamme entrée de gamme »), et
  des hybrides franco-anglais en série : « Wrapper Camerounais sur Dominican », « Blend
  Pennsylvania-Virginia-Connecticut wrapper ».

⚠ **Deux tables restent hors de tout contrôle d'affirmation.** `marques_check` balaie les quatre
champs narratifs de `brands` dans les six langues ; il ne regarde ni `lounges` — 500 fiches,
écrites en partie par des contributeurs, où j'ai trouvé un « Cigar Journal Award » — ni
`producer_countries`, où la migration `074` avait déjà dû retirer deux superlatifs mondiaux.

⚠ **Et le français n'est contrôlé par personne pour les langues étrangères.**
`i18n_langue_check` cherche de l'anglais dans les colonnes *traduites* : la colonne française est
sa référence. Deux fiches d'établissement y étaient **entièrement en anglais** sans que rien ne
le signale — même angle mort que « moho azul » (`080`), où le français était la seule des six
langues à ne pas avoir traduit.

### Les récompenses, dans les six langues (`100`)

Aucun motif de presse ne contenait de mot signifiant « récompense » — c'est ainsi que
« Tras el galardón de 2011 » avait survécu chez Alec Bradley dans cinq colonnes (`099`). Le
balayage complet en ramène **26**.

**Onze ne désignent aucun prix**, et sont écartées une par une plutôt que par une tolérance
globale qui aurait aussi laissé passer les vraies :

| faux ami | ce que c'est |
|---|---|
| *prized for its mildness*, *blenders prize it* | l'anglais pour **apprécié** — le motif ignore `prize`, ne garde que `award` |
| « le lieu **prime** sur la marque » | un verbe français |
| « **Prime**'s Rum » | une marque de rhum |
| *Gran Premio*, 大奖赛, الجائزة الكبرى | le **Grand Prix de Monaco**, dans trois langues |
| *the Nobel Prize in Literature* | Churchill — un fait historique vérifiable |

⚠ **Écrit `prim[ée]s?`, le motif acceptait aussi bien « primé » que « prime »** : la classe
contient le *e* nu. L'accent devait être **obligatoire**, sans quoi le verbe et la marque de rhum
repassaient tous les deux.

**La ligne, la même que partout.** Ce que le projet retire depuis `057`, ce n'est pas la
distinction : c'est celle *que personne ne peut aller voir*. Sont restés « fondée en 1787 »,
« 555 m », « plus de mille ouvriers », « organisé par Habanos S.A. depuis 1999 » — spécifiques et
attribuables.

- **Quatre restent** — « Davidoff Best Performance EMEA 2021 » nomme donneur, catégorie, région et
  année : un lecteur peut le chercher. Les quatre établissements sont admis par exception
  **nommée**, et le rapport de l'outil les **affiche** : une exception qu'on ne voit pas est une
  tolérance cachée.
- **Deux partent** — « brasserie artisanale **primée** », « art contemporain **primé** » : ni par
  qui, ni pour quoi, ni quand. Le fait vérifiable est conservé dans les deux cas.
- Et un superlatif de ville au passage — « l'hôtel de luxe le plus audacieux de Kuala Lumpur sur le
  plan du design ». `RANGS_MONDIAUX` cherche « au monde » et ne voit pas les rangs municipaux.

⚠ **Cinq langues sortaient, pas le chinois** — il dit « 屡获殊荣 », *maintes fois distingué*, sans
le caractère 奖 que le motif exigeait. Cinq langues sur six est le symptôme d'un motif incomplet,
pas d'une base propre : **quatrième fois du chantier**.

### La promotion vers le français, terminée (`101`→`118`)

Les **40 fiches** où `history_en` était un texte autonome sont promues. Le français est redevenu
la source partout : `history_en` n'est plus, nulle part, un texte que cinq lecteurs sur six ne
voient pas. Dix-huit migrations, dix lots, **63 066 caractères** portés en français.

**Le compteur monte avant de descendre, et c'est le but.** Promouvoir une fiche retire un écart en
anglais et en crée quatre, en attente de traduction : `−1 + 4 = +3`. Le détail par langue, ajouté
au rapport de `i18n_divergence` pour rendre la campagne lisible, dit où l'on en est —
**`en 1`** (contre 40 au départ, et le dernier n'est pas une marque mais un établissement trop
court), contre `ar 66 · de 45 · es 45 · zh 95` en attente. **200 traductions sont nommées** dans
`i18n_attente_baseline.json`, non rescellées : les sceller les déclarerait à jour sans qu'une
seule ait été refaite.

**Le cliquet des rangs mondiaux passe de 29 à 22.** Sept réglés en passant : Cohiba, Montecristo,
Davidoff, Joya de Nicaragua, Trinidad, Partagás, Tabacalera.

#### Ce que la promotion a filtré

Faire passer ce texte par le français, c'est le faire passer par les contrôles. Par famille :

- **Cinq notes de presse**, toutes indénombrables et donc invisibles par construction —
  « scores in the upper 90s », « earn scores between 92 and 96 », « earning scores above 90 from
  specialist publications ». L'outil détecte le *nom d'une revue* ; aucune ne le donne.
- **Quatre variantes de « many experts consider »** — « les connaisseurs sérieux s'accordent »
  (Bolívar), « several serious tasters » (Camacho), « several reviewers described » (Perdomo),
  « considéré par les connaisseurs » (Montecristo).
- **Une quinzaine de rangs** : mondiaux, de marché, de catalogue, de ville.

⚠ **Le français affirme plus que l'anglais.** Quatre fois, c'est la version *anglaise* qui était la
plus rigoureuse : « composa *Strangers in the Night* » contre « contribué à » (Avo) ; la boîte
Café Crème « blanche » contre « yellow » ; l'étymologie de *pleased as Punch* affirmée contre
« became, **briefly**, one of the meanings » ; « la plus ancienne manufacture des Amériques »
(Dannemann) que l'anglais ne dit pas. La colonne source est celle qui affirme le plus — et c'est
précisément celle que les contrôles lisaient le moins avant `098`.

#### Les erreurs de fait qu'aucun contrôle ne pouvait voir

| fiche | défaut |
|---|---|
| Davidoff | « pendant **25 ans** » contre « for **22 years** » — 1968→1990 |
| Café Crème | la boîte dite **blanche** dans une colonne, **jaune** dans deux autres |
| Joya de Nicaragua | « the Jalapa **and Jalapa** Valleys » |
| H. Upmann | « named in tribute to Bolívar's greatest rival for Churchill's affection » |
| Drew Estate | « Connecticut Broadleaf **Habano** » — la cape que `096` avait corrigée ailleurs |
| Dannemann | le français taisait le **travail d'esclaves africains** à l'origine de la culture bahianaise |

Une durée n'est pas une date, une couleur n'est pas un nombre : `i18n_divergence` compare les
années, pas les adjectifs. **C'est la relecture qui les attrape — et la promotion est une
relecture.**

#### Et le cas le plus persistant

« Macanudo, **la marque la plus vendue aux USA** » : retiré par `070` (une seule de ses deux
adresses), revenu autrement sur la fiche Macanudo et retiré par `109`, retrouvé sur la fiche
General Cigar et retiré par `116`. **Trois lots, trois retraits, un seul fait.**

⚠ **Reste à faire** : les 200 traductions en attente. Le français a doublé sur 40 fiches ;
es/de/zh/ar traduisent encore l'ancien texte court.

### Une traduction dit-elle ce que dit sa source ? (`099`)

Chantiers 5 (divergence de `history`) et 6 (relecture humaine). **Je ne peux pas être le relecteur
humain** — six langues, 1 518 620 caractères. Ce qui suit ramène 17 heures de lecture aveugle à
une liste ordonnée.

**La mesure a changé le diagnostic.** La feuille de route parlait de « 43 fiches mal alignées ».
Comparer des longueurs brutes entre le chinois et l'allemand n'a aucun sens : le chinois écrit la
même chose en trois fois moins de signes. Rapporté au **rapport médian de chaque langue**
(`en 0.96 · es 0.95 · de 1.00 · zh 0.30 · ar 0.71`), le tableau réel est :

- **40 fiches où `history_en` n'est pas une traduction** mais un texte autonome — 63 066 caractères
  d'écart, et **aucune phrase partagée d'une fiche à l'autre** : ce n'est ni du remplissage ni du
  copié-collé, mais de l'écriture spécifique et bonne. Cinq lecteurs sur six ne la voient jamais.
- **~30 fiches où es/de/zh/ar font le quart du français** : des traductions d'un français plus
  ancien, que l'expansion du texte source a laissées sur place.

⚠ **Décision éditoriale en attente, pas technique.** Ces 63 066 caractères font le double du
format habituel du site (médiane 1 051 caractères par fiche). Soit on les *promeut* — traduction
vers le français puis les quatre autres, ~315 000 caractères de travail — soit on les *ramène* au
français et l'on perd de la bonne écriture. Ce n'est pas à moi de trancher.

**`tools/i18n_divergence.php`** pose la question que `i18n_fraicheur` ne pose pas. Celui-ci compare
l'*empreinte* de la source à celle scellée et affiche 100 % ; il ne compare jamais la traduction à
son *sens*. Le nouvel outil mesure le volume par rapport à la médiane de chaque langue, et surtout
les **dates qu'une traduction affirme sans que sa source les contienne** — une date est le fait le
plus vérifiable d'un texte et le plus comparable entre écritures : 2014 s'écrit 2014 en arabe comme
en chinois.

**Quinze signalements au premier passage, et un motif net** : quand *plusieurs* langues portent la
même date, c'est le français qui l'a perdue ; quand *une seule* la porte, elle l'a inventée.

- ⚠ **Une note de presse complète, vivante en arabe.** `history_ar` d'Alec Bradley : « en 2011,
  Prensado a reçu le prix du cigare **n°1 de CA, 96 points** ». Revue, rang, points — exactement ce
  que les migrations `057`, `058` et `077` ont passé des semaines à retirer. Elle a échappé à
  **trois** motifs d'un cheveu : l'arabe place le nombre *après* le mot (`نقاط 96`), `REVUES_CITEES`
  connaissait « في CA » mais pas « من CA », et un mot s'intercalait entre la revue et le chiffre.
- **Le même prix dans les cinq anecdotes** — le français disait « quand la maison a percé », les
  cinq traductions « après le prix 2011 ». Le français avait été corrigé seul.
- **Un cigare inventé** — Oliva, arabe : « puis vint le Melanio en 2014 ». Aucune autre colonne ne
  le mentionne, et 2014 est son année de récompense. Le texte arabe fait le *tiers* du français et
  invente pourtant un fait.

⚠ **Aucun motif de presse ne contient de mot signifiant « récompense »** — ni *award*, ni
*galardón*, ni *Auszeichnung*, ni 获奖, ni جائزة. Un balayage d'essai en trouve **26** occurrences,
dont plusieurs vraies. Chantier à ouvrir.

**Le contrôle est au cliquet** (248 écarts de volume, 5 faits bénins connus), câblé dans
`tests/run.php` — 371 assertions — et vérifié réfutable. Sa première version écartait du contrôle
des faits *toute* fiche divergente en volume, ce qui masquait la fiche Oliva : une traduction plus
**courte** qui invente une date est plus suspecte, pas moins.

### Les affirmations hors `brands` (`097`→`098`)

Deux chantiers annoncés comme « une heure » et « une à deux heures ». Le premier a tenu. Le
second a montré que le contrôle qu'il fallait étendre était **aveugle bien au-delà** des deux
tables visées.

**`097` — les onze rangs mondiaux de `lounges`, triés un par un.** Il n'y avait pas de motif à
appliquer : un rang sur un *établissement* n'est pas de la réclame de la même façon qu'un rang sur
un cigare.

- **Gardé** — « la plus haute tour de Corée » (Lotte World Tower, 555 m) : rang national,
  vérifiable, sur une structure. Il figure comme exception *nommée et motivée* dans l'outil.
- **Retiré** — « L'hôtel le plus luxueux du monde **(7 étoiles)** » : aucun système de classement
  hôtelier ne compte sept étoiles. « le plus grand centre commercial du monde » : contesté selon
  la mesure retenue. « Le plus ancien **cigare merchant** au monde » : la maison le dit d'elle-même,
  et l'expression n'était ni du français ni de l'anglais.
- ⚠ **Un superlatif devenu faux.** « le bâtiment le plus haut de Tokyo » désignait Tokyo Midtown
  (248 m), exact de 2007 à 2023 ; Azabudai Hills culmine depuis à 330 m. *Un rang est daté même
  quand il est juste.*

**Trois fiches n'étaient pas traduites** — signature différente de la `095` : non plus des mots
cassés, mais des **locutions françaises entières** laissées en place (`位于plus grand 购物中心
du monde`). Dont une, Ritz-Carlton Tokyo, dont la colonne *anglaise* comptait deux mots traduits
sur seize.

**`098` — et un trou dans mon propre détecteur.** Le test réversible de la `095` exigeait une
lettre **après** le marqueur (`civandte`) et laissait passer le marqueur en **fin** de mot :
« Elite Cigar Abidjan » portait `discrand`, `discry`, `discrund` — *discret* substitué — dans
trois colonnes, et le contrôle était vert. Élargir le motif a d'abord produit du bruit
(`brand`→`bret`, `land`→`let`) : il a fallu deux gardes, la **correspondance en mot entier** et un
minimum de cinq lettres. Les vrais cas conservent la racine française et la dépassent tous.

**Ce que le contrôle a vu la première fois qu'il a regardé :**

| trouvé | où |
|---|---|
| une **consommation de tabac prêtée** (« Il la fumait quotidiennement ») | `brands`, six colonnes |
| deux rangs mondiaux | `lounges` |
| un rang mondial dans **les six langues** | `producer_countries` (Brésil) |
| **29 rangs mondiaux** sur 12 marques | `brands` — mis au cliquet |

⚠ **La boucle de `brands` ne lisait pas le français.** Elle itérait sur les clés de
`PRESSE_LANGUES` — en, es, de, zh, ar. La colonne source en portait **dix** rangs mondiaux, jamais
lus. Le contrôle annonçait « les SIX langues sont balayées » tout en n'en lisant que cinq.

⚠ **Et le motif avait cinq trous**, tous trouvés en le confrontant à de vrais textes : `des plus
… du monde` (superlatif relatif), `… mondial` par l'adjectif, `uno de los … más … del mundo`,
`einer der …sten X der Welt`, et les six façons arabes de former un superlatif là où il n'en
connaissait qu'une.

**Deux faux positifs écartés, sans affaiblir le contrôle** : « إطلالة بزاوية 360 **درجة** » est une
vue à 360 *degrés* — une note de cigare plafonne à 100, ce qui suffit à trancher. Et « 8 **000
points** de vente » n'est pas une note : le séparateur de milliers ouvrait une frontière de mot au
milieu du chiffre.

**Le cliquet, plutôt que le silence.** Les 29 rangs de `brands` demandent de réécrire douze fiches
en six langues — une campagne. Ils sont **nommés** dans `tools/marques_rangs_baseline.json` : le
stock ne peut plus grossir, et il est écrit noir sur blanc au lieu d'être invisible. Vérifié
réfutable : témoin posé → sortie 1, témoin retiré → 0.

### Liga Privada : deux signalements, quatre défauts (`096`)

Un lecteur signale deux choses sur la fiche. Les deux sont justes, et chacune en cachait une autre.

**« les humidores »** est le pluriel *espagnol*. Balayé sur toute la base : le mot apparaît trois
fois. Les deux autres sont dans `lounges`, colonnes `description_es` et `description_de` — où
`humidores` et `Humidore` sont les pluriels **corrects** de ces langues. Une seule occurrence est
fautive. Le réflexe « corriger les trois » aurait cassé deux traductions justes.

**« il livre une douceur paradoxale » — du cigare ou de la feuille ?** Des deux, et c'est le
défaut. Le sujet précédent était « la cape », féminin ; les adjectifs et le pronom, masculins.
La phrase décrivait l'aspect de la *feuille* (sombre, huileuse, presque noire) puis l'équilibre en
bouche du *cigare*, sans jamais nommer le second. Les deux sujets sont maintenant nommés.

**Ce que la relecture a ajouté :**

- **une cape pour deux, alors qu'il y en a deux.** « La cape Connecticut Broadleaf Habano » fond
  en une seule les capes de deux modules que le texte cite lui-même : No.9 → Connecticut Broadleaf
  maduro ; T52 → habano de la vallée du Connecticut, récoltée à la tige. *Broadleaf Habano* ne
  désigne aucune feuille.
- **une divergence entre les six colonnes.** `fr` et `en` disaient que les boîtes « se vendirent
  en heures » ; `zh` et `ar`, « 45 minutes chez le premier détaillant ». Deux récits du même
  épisode, aucun sourçable — le texte ne s'appuie plus sur le chiffre. L'anglais portait en
  revanche une explication que les cinq autres n'avaient pas (on ne fait pas plus de Liga Privada
  sans cultiver plus de cape, et il faut trois ans) : elle dit *pourquoi*, et passe dans les six.
- **un superlatif de marché** — « les cigares "sérieux" les plus recherchés du marché ».

### Le trou de `lounges`, comblé — et le contrôle qui manquait (`095`)

Les deux lots précédents signalaient que `lounges` échappait à tout contrôle d'affirmation. En
allant y voir, ce n'est pas une affirmation que j'ai trouvée en premier. La colonne **anglaise**
de la fiche Hô Chi Minh disait :

> « First et seule La Casa del Habano du **Viandnam**, openede le 1er août 2021. »

`Viandnam`, c'est *Vietnam* où « et » a été remplacé par « and » **à l'intérieur du mot**. Cinq
fiches n'ont jamais été traduites : elles ont subi une substitution de mots posée sans limite de
mot, et le reste de la phrase est resté en français. Traduites pour de bon, dans les cinq langues.

**Le test qui tranche est réversible.** Chercher « and » collé dans un mot ramène `brands`,
`Sandton`, `grandfather`, `thousands` — 73 fiches de bruit. On remet « et » à la place, et on
regarde si le mot obtenu figure dans la colonne *française de la même ligne* :
`civandte`→`civette` ✓, `grandfather`→`gretfather` ✗. Mesuré ainsi : `brands` 0,
`producer_countries` 0, `lounges` 5 — les mêmes en en/es/de.

Le détecteur est désormais **dans `i18n_langue_check`**, à tolérance zéro comme les écritures
étrangères, et vérifié réfutable : témoin posé → code de sortie 1, témoin retiré → 0.

⚠ **Et un oubli qui est le mien.** La migration `093` avait retiré « Cigar Journal Award » et les
« 270 facings » de la fiche BURN by Rocky Patel — du **français seulement**. Les cinq colonnes
traduites l'annonçaient toujours. Septième cas du chantier où un même fait, écrit à deux adresses,
n'est corrigé qu'à une seule ; le premier que je me fais à moi-même.

⚠ **`i18n_fraicheur` affichait 100 % pendant tout ce temps.** Il compare l'empreinte de la source
à celle scellée — jamais la traduction à son sens. Une fiche entièrement en français dans sa
colonne anglaise lui paraît fraîche. C'est un contrôle de *synchronisation*, pas de *qualité*, et
il ne faut pas lui demander autre chose.

**Restent à traiter** : huit rangs mondiaux dans `lounges` (Burj Al Arab, Augusta, Pebble Beach,
Royal Melbourne, Dubai Mall…). Plusieurs portent sur le **lieu** et non sur le cigare, et
certains sont factuels — le tri demande un jugement au cas par cas, pas un motif.

### La divergence de `history` (`086`→`088`)

**La mesure d'abord.** Sur 118 fiches, l'anglais de `history` est bien une traduction pour 75
d'entre elles — médiane du rapport de longueur : **0,96**. Mais **43 dépassent x1,6**, jusqu'à
x7,14. Là, ce n'est plus une version : c'est un autre texte, qu'aucun contrôle n'a jamais relu
puisqu'ils tournent tous sur le français.

Comparer les longueurs ne suffisait pas — le chinois est naturellement plus court. J'ai donc
comparé les **faits** : années et nombres présents dans une langue et absents du français.
Résultat : **121 faits ajoutés, 352 perdus** sur 262 couples (marque, langue).

**Ce que les faits ajoutés cachaient :**

| | |
|---|---|
| six notes de presse | « awarded it scores between 92 and 95 », « rated it between 91 and 94 », « a 96-point score », « على 97 في CA » |
| sept rangs mondiaux | « the world's best-selling cigar », « the most important independent tobacco family in the world », « the most complex cigar ever » |
| une consommation attribuée | Avo : « having smoked his own cigars daily throughout his final years » |

**Changement de méthode.** Neuf fois, un motif écrit pour « une note de presse » avait raté la
même affirmation dite autrement. Courir après les formes ne marche pas : il y en a toujours une
de plus. Le marqueur robuste n'est pas la forme du chiffre, c'est le **nom de la revue** — une
fiche n'a aucune raison de citer Cigar Aficionado sinon pour s'en prévaloir. `marques_check`
balaie désormais les noms de revues, les rangs mondiaux et les consommations attribuées, **dans
les six langues**.

**Et quatre défauts en français**, que le motif français ratait parce qu'il exigeait « du monde »
collé à l'adjectif : « la plus grande manufacture de cigares premium **du monde** », « le plus
cher **jamais** lancé ». L'un d'eux est de ma main — la migration 072 avait recopié « le thé le
plus floral du monde » en traitant l'anglicisme et pas le superlatif. **Corriger une chose dans
une phrase ne garantit pas d'avoir lu le reste.**

⚠ **Le détecteur de fuite d'anglais a un seuil.** Trois entrées espagnoles étaient restées en
anglais, dont deux en hybride — « Nombrada por the ocean liner sunk in 1915 ». `i18n_langue_check`
annonce pourtant zéro : son seuil est de **trois mots outils par texte**, et une entrée courte
passe dessous. Le compte était exact et incomplet.

⚠ **L'écart de volume reste.** Ce lot corrige ce qui est faux ou invérifiable, pas la divergence
elle-même. Aligner les six colonnes demanderait de retraduire ~65 000 caractères, ou d'enrichir
le français depuis un anglais dont je ne peux vérifier aucune source.

### Deux notes qui disaient la même chose (`085`)

Signalé par un lecteur sur la fiche Corojo du Honduras : « Épices » et « Poivre » y figuraient
côte à côte, et le poivre **est** une épice.

**Le signal existait déjà, et personne ne le lisait.** Le glossaire d'arômes range chaque libellé
dans une famille — `'epices' => ['epice', 'poivre']` — et sert une phrase par famille. Deux notes
d'une même famille affichaient donc **deux fois la même icône et la même glose**. Le doublon
était visible à l'écran depuis la migration 051 ; il suffisait de comparer les familles d'une
même liste.

Six cas en tout, tous dans `notes` : quatre « Épices + Poivre » (Corojo de Cuba, du Honduras, du
Panamá ; Habano d'Équateur) et deux « Douceur + Crème » (San Vicente, Ecuador Connecticut).
Aucun libellé muet en revanche — les soixante-dix tombent tous dans une famille.

**La correction garde le terme le plus précis** — « Poivre » plutôt qu'« Épices » — et remplace
le générique par une note d'une autre famille, tirée de ce que la fiche dit déjà : « sol
volcanique » → Terre pour le Panamá, « goût crémeux » → Foin pour San Vicente. Le sens inverse,
suggéré par le lecteur — garder « Épices » et citer le poivre dans sa glose — n'était pas
possible : la glose appartient à la **famille** et se partage entre toutes les feuilles ; y
écrire « poivre » l'aurait affiché sur des fiches qui n'en portent pas.

**⚠ Mon contrôle s'est sauté lui-même.** Écrit dans `coherence_check`, il commençait par
`if (function_exists('famille_arome'))` — or la fonction vivait dans `data.php`, que cet outil ne
charge pas. Le bloc était donc ignoré **en silence** : zéro défaut trouvé, zéro protection. Les
familles vivent désormais dans `backend/aromes.php`, inclus des deux côtés, et le garde-fou est
retiré. Contre-épreuve : la redondance remise est bien signalée.

> Deuxième fois dans la journée — après le test du lexique — qu'un contrôle mesure sa **propre
> disponibilité** au lieu de la propriété voulue.

Et en extrayant le fichier, j'ai placé le `require_once` à l'endroit où la fonction est utilisée,
ligne 590. Or le routeur de `data.php` s'exécute ligne 78 : les fonctions d'un fichier inclus
plus bas ne sont pas remontées par PHP, et `action=feuille` répondait 500. **Le piège est
documenté deux fonctions plus loin dans ce même fichier**, à propos des constantes.

### Le lexique du métier (`083`)

Ouvert à la suite du signalement ci-dessus. Vingt entrées, six langues, servies avec la fiche.

**Ce qui n'y entre pas.** Les *variétés* de tabac — habano, corojo, criollo, broadleaf, sumatra —
ont déjà leur fiche, et l'étiquette qui la porte est cliquable. Le manque portait sur le
vocabulaire de **fabrication**, qu'aucune fiche ne couvrait : les trois parties du cigare (cape,
sous-cape, tripe), les étages du plant (ligero, viso, seco, volado, medio tiempo), l'atelier
(torcedor, galera, lector, entubado, pilón), les formes (vitole, figurado, perfecto, pressé en
boîte) et les robes (claro, maduro, oscuro).

`corona` en est écarté : c'est à la fois une vitole et un morceau de nom de gamme (Double
Corona). Une glose qui s'affiche au mauvais endroit est pire qu'une absence.

**Le mécanisme réutilise celui des arômes** plutôt que d'en inventer un second : détection sur le
**français**, restitution dans la langue du lecteur. C'est la règle déjà écrite dans
`action_feuille` — le front reçoit 茄衣 et ne pourrait pas y reconnaître une cape ; le serveur, lui,
a la source sous la main.

La colonne `variantes` porte les formes (`vitole|vitoles|vitola|vitolas`) comme des chaînes
**littérales**, passées à `preg_quote` : rien de ce qui vient de la base n'entre dans une
expression régulière sans échappement. Plafond de six entrées par fiche — sans lui, « cape » et
« tripe » étant partout depuis le passage de vocabulaire, le bloc deviendrait un pavé identique
sur 118 fiches.

**⚠ Mon premier test ne pouvait pas échouer.** Il vérifiait que le lexique est aussi fourni en
allemand qu'en français — mais la marque de test n'avait pas de `history_de`, donc `traduire`
retombait sur le français et une détection faite *après* traduction lisait encore « cape ».
Vérifié en introduisant le défaut : **les sept assertions restaient vertes**. La marque de test
porte désormais un allemand réel, et la contre-épreuve échoue comme elle doit (« attendu 3,
obtenu 0 »).

> C'est la leçon de la migration 077 appliquée à mon propre test : mesurer une **présence** n'est
> pas mesurer la **propriété voulue**. Un contrôle qui ne peut pas échouer ne protège de rien.

`lexique` est déclaré dans les **deux** listes de champs traduisibles — `backend/data.php` et
`tools/i18n_contenu_plan.php` — et `tests/bootstrap.php` le rejoue comme donnée de référence, au
même titre qu'`aromes` : sans la table, la fiche se sert avec un bloc vide, ce qui ressemble
trait pour trait à une fiche dont aucun terme n'est reconnu.

### Le vocabulaire, et ce qu'il a fait remonter (`073`→`079`)

Chantier ouvert pour remplacer « wrapper » par « cape » dans le français. Il a mis au jour
**quatre défauts d'une tout autre gravité**, tous invisibles aux compteurs.

**⚠ Quarante notes affichées sous un contrôle vert.** `marques_check` annonçait, à chaque
campagne : « 0 note chiffrée, toutes accompagnées d'une source consultable ». Littéralement
vrai — la migration 058 avait vidé la **colonne** `scores`, et le contrôle lisait cette
colonne. Quarante notes vivaient dans le **sous-tableau** `gamme[].scores`, avec revue, note et
année, et `panels.js` les affichait en pastille dorée sur chaque fiche, dans les six langues.

> Les leçons précédentes portaient sur la **forme** d'une idée, sur la **colonne** où elle se
> cache, sur le **marqueur** grammatical auquel un contrôle s'accroche. Celle-ci est d'un autre
> ordre : le contrôle vérifiait un **contenant**, pas une **donnée**. Vider `scores` et
> contrôler `scores` ne prouve rien — elle avait une seconde adresse. **Un contrôle qui ne peut
> pas échouer ne protège de rien**, et celui-ci n'avait jamais échoué depuis la migration 058.

Corrigé par la migration `077`. Le contrôle lit désormais les deux adresses, vérifie la parité
des sous-tableaux entre langues (le français en avait 40, les autres 38), et `panels.js` refuse
d'afficher une note sans `source_url` — trois barrières au lieu d'une.

**⚠ Cent six affirmations vivantes dans les cinq langues traduites.** Depuis la migration 058,
chaque note retirée l'a été du **français**, et le contrôle ne lisait que le français. Le
lecteur allemand voyait toujours « eine 96 im Cigar Aficionado », l'espagnol « logró un 96 ».
`marques_check` balaie désormais les six langues (`PRESSE_LANGUES`), vérifié en réintroduisant
une affirmation en allemand seul.

**Une note de presse sans chiffre.** « Score parfait par plusieurs experts » chez Cohiba, dans
les six langues. Le motif exigeait le mot « score » **et** un nombre ; « parfait » dit
exactement « 100/100 » sans l'écrire. Huitième forme de la même affirmation, et la première à
se passer entièrement de chiffre — l'hypothèse tacite du motif que personne n'avait écrite.

**Onze affirmations dans `brands.history`**, champ hors du balayage — deuxième fois après My
Father (`068`), où j'avais justement élargi le périmètre. Trois des dix premières alertes
étaient des **faux positifs de mon propre motif** (« le meilleur cigare serait celui qu'il
roulerait lui-même » est une conviction de 1912) : ce qui fait le classement n'est pas le mot
« meilleur », c'est le champ sur lequel il porte.

**Deux vocabulaires de données jamais traduits** — invisibles à `i18n_langue_check`, qui mesure
des mots outils dans de la **prose** :

| | volume | traitement |
|---|---|---|
| `force` | 244 pastilles, 5 libellés anglais identiques dans les 6 langues | clé i18n côté front |
| `wrapper` | 87 étiquettes anglaises identiques dans les 6 langues | traduites en base (`073`) |

Et deux libellés **écrits en dur en anglais** dans `panels.js` — `Force:` et `Wrapper:` — juste
à côté d'un `t('bm_distinctions')` traduit. Plus la ligne d'accroche du site, qui en **français**
disait « The World's Premium Cigar Atlas » quand les cinq autres langues étaient traduites.

**Le piège du compteur qui lit la structure.** Mon premier inventaire annonçait 736 anglicismes
au lieu de 246 : il balayait le JSON brut et comptait la **clé** `"wrapper":` comme du texte.
Refait deux fois de plus avec `"scores":`. Trois occurrences du même piège en une journée.

**Deux fautes rattrapées à la relecture**, toutes deux dans l'outil et non dans le contenu :
un découpage en phrases qui **supprimait toutes les espaces après les points** (séparateur jeté
par `preg_split`), et des motifs espagnol et allemand qui rataient « logró un 96 » et « eine
96 » — la forme la plus courante. Le découpage est désormais vérifié **réversible** avant tout
traitement. Une suppression de phrase peut aussi **orpheliner la suivante** (« Über Nacht wurde
Alec Bradley zur weltweiten Referenz » — le lendemain de quoi ?) : ces phrases-là ne portent
aucune affirmation, donc aucun motif ne les voit.

⚠ **Le vocabulaire anglais est aussi dans les traductions** : 155 occurrences dans 113 valeurs
espagnoles, allemandes, chinoises et arabes — `Blend` ×99, `Wrapper` ×33, `Full body` ×15 — dont
**82 % en allemand**, qui dit ailleurs « Mischung » et « Deckblatt ». Le relevé n'est juste
qu'en excluant les clés `force` et `wrapper`, sinon 162 faux « medium-full » viennent du champ
de force. C'est la **quatrième** fois dans ce chantier qu'un compteur lit la structure au lieu
du contenu.

⚠ **Reste ouvert : 82 textes de vocabulaire français** (`brands.gamme` 57, `brands.history` 25), et
surtout — **les six colonnes de `history` ne sont pas des traductions les unes des autres**.
L'anglais d'Alec Bradley fait 2 461 caractères pour 794 en français ; l'espagnol en fait 320.
Sur 116 fiches, 43 anglaises, 32 espagnoles, 32 allemandes, 37 chinoises et 34 arabes sortent
des proportions attendues. Ce sont des **textes différents**, pas des versions — et
`i18n_fraicheur` les compte à jour parce qu'elles sont scellées sur le bon français.

Note de vocabulaire : `MOTS_ANGLAIS`, dans le détecteur de fuite, contient `wrapper`, `filler`,
`binder` et `blend` — **le français source alimente le vocabulaire qui sert à détecter l'anglais
résiduel** (témoin à 1/568).

### Le « flottement » des campagnes : cause trouvée

Signalé plusieurs fois dans ce journal comme *« deux transients observés sous exécution
parallèle, sans cause identifiée »*. La cause est établie : des **processus PHP orphelins**.

`tools/i18n_contenu.php --importer` sur toute la base prend de longues minutes. Lancé en tâche de
fond puis abandonné faute de patience, le processus **continue** — et continue d'écrire en base.
Quatre s'étaient accumulés, à 38 % de CPU à eux seuls.

Le symptôme : un test d'animation du globe échouant à **1,4959 deg/s pour un seuil à 1,5** — 0,3 %
en dessous, et reproductible tant que la machine était chargée. Après arrêt des quatre orphelins,
le même test passe. Ce sont eux, aussi, qui expliquent les échecs sporadiques des tests de
téléversement.

**La leçon d'exploitation** : un rescellement complet ne se lance pas en tâche de fond « au cas
où ». Il faut soit l'attendre, soit le cibler — resceller 20 valeurs prend une seconde, en
resceller 6 925 prend un quart d'heure. Et vérifier `Get-Process php` avant de conclure qu'un
test est instable.

⚠ **Piège d'exploitation** : `tools/i18n_dump.php` écrit sur la **sortie standard**. La bonne
commande est `php tools/i18n_dump.php > sql/traductions.sql` ; un `> /dev/null` par réflexe ne
produit rien et laisse le fichier versionné en retard sur la base, sans que rien ne le signale.
`coherence_check` rejoue bien chaque `UPDATE` du fichier, mais un UPDATE périmé désigne toujours
une ligne : le contrôle reste vert sur un fichier obsolète.

⚠ Le champ `name`, qui ne doit jamais être traduit, porte encore « Spanish Empire » en espagnol,
allemand, chinois et arabe pour Tabacalera ; « Aztecs and Totonacs » pour Te Amo ; « The
European Café » pour Café Crème.

### Les étiquettes : lisibles, et cliquables pour de bon

- **Le corps était à 7 px**, et le suffixe « ▶ La feuille » à `.85em` de 7 px, soit **5,95 px
  à 55 % d'opacité**. Sous le seuil où l'on lit quoi que ce soit. Porté à 9 px / 7,92 px / 0,75
- **La cliquable et l'inerte ne différaient que par `cursor:pointer` et un effet de survol** —
  donc rien au premier coup d'œil, rien au clavier, et rien du tout sur mobile où le survol
  n'existe pas. La cliquable porte désormais trois marques permanentes : fond teinté de sa
  propre couleur, bordure pleine, chevron. L'inerte est **déclarée** (`tag-inerte`, contour
  pointillé) au lieu d'être déduite d'une absence de classe
- Le chevron `▶` était **enfermé dans les six chaînes traduites** : du mobilier d'interface
  dans du contenu traduit, impossible à styler, recopié six fois et pointant du mauvais côté
  en arabe. Passé en CSS, avec son inversion RTL
- L'élément porte `role="button"` et `tabindex="0"` mais **aucun anneau de focus** :
  atteignable au clavier, invisible une fois atteint
- `color-mix` a un repli explicite : là où il n'est pas connu la déclaration est ignorée, et
  la cliquable garderait le fond de l'inerte — exactement la confusion qu'on corrige
- Contraste vérifié en thème sombre : **4,68:1**, au-dessus du seuil AA

### L'emploi des feuilles, dans les six langues (`055`)

- Le sous-titre de chaque fiche de feuille — « Cape », « Tripe et sous-cape » — s'affichait
  en **français dans les six langues**
- **Le compteur ne pouvait pas le voir** : `emploi` n'était déclaré dans aucun des deux plans
  de traduction, et `i18n_fraicheur` annonçait 100 % — ce qui était vrai des champs *déclarés*
  et muet sur celui qui ne l'était pas. Un champ hors périmètre n'est pas « manquant », il est
  absent
- Vocabulaire fermé de neuf valeurs, traduit dans le vocabulaire du métier :
  *Wrapper/Binder/Filler*, *Capa/Capote/Tripa*, *Deckblatt/Umblatt/Einlage*, 茄衣/茄套/茄芯,
  غلاف/رابط/حشوة. Les traductions viennent d'un chantier parallèle dont la migration n'avait
  jamais atteint le dépôt — elles ont été relues puis reprises
- Le garde-fou est désormais automatique et **vérifié** : en introduisant une dixième valeur,
  `i18n_fraicheur` la signale aussitôt comme cinq traductions manquantes, ce que
  `tests/run.php` fait échouer

- ⚠ **Deux sessions ont partagé la même base MySQL** pendant ce chantier. `sql/schema.sql`
  régénéré a capté cinq colonnes `emploi_*` créées par l'autre, et la fixture les a nommées.
  `make-atlas.php` écarte désormais — **bruyamment** — toute colonne absente de
  `sql/schema.sql` : la fixture est rechargée dans une base construite à partir de ce
  fichier, et nommer une colonne qu'il ignore fait échouer tout le chargement
- **Question ouverte, non technique** : publier avant d'avoir relu, ou non ? À trancher
  avec l'avis juridique (loi Évin) et la décision de modération

## Ordre suggéré
~~C2+C3~~ → ~~C1~~ → ~~D3+D5~~ → ~~B2~~ → ~~B3~~ → ~~A2~~ → ~~F7~~ → ~~F1~~ → ~~F2~~ → ~~F6+F3+F5~~ → **B1** → F3/F4/F6 → D6/C1b (optionnels)

## Approfondir les fiches plutôt que d'en ajouter (point 2)

**L'état mesuré au 2 septembre 2026**, sur 500 établissements :

| | |
|---|---|
| horaires | **0 / 500** |
| coordonnées | **0 / 500** |
| site web | **0 / 500** |
| photo réelle | **1 / 442** |
| description ≥ 200 car. | 43 / 500 (médiane : 95 caractères) |
| téléphone | 465 / 500 |
| **complétude moyenne** | **6 %** — 0 fiche complète |

### On a d'abord cherché à extraire, pas à saisir

Avant d'écrire une ligne : les **419 `maps_url` sont des liens de recherche**
Google fabriqués depuis le nom et la ville — aucune coordonnée dedans, et
aucune garantie que le lieu existe sur Maps. Les descriptions ne portaient que
**5 comptes Instagram** et **4 horaires**.

Il n'y avait rien à extraire. La saisie est humaine, et le code ne peut que la
rendre rapide et mesurable.

### Ce qui a été livré

1. **Un barème, en un seul endroit** (`backend/completude_lib.php`). Les poids
   suivent les questions qu'un visiteur se pose, dans l'ordre : horaires 25,
   coordonnées 20, description 20, photo 15, site 15, téléphone 5. Le téléphone
   pèse peu parce qu'il est déjà là sur 465 fiches — lui donner du poids aurait
   gonflé le score sans rien apprendre.
2. **`tools/completude.php`** — l'état général, le détail par pays
   (`--pays=france`), le plan de travail, et `--autotest`.
3. **L'onglet Adresses** dans l'administration. Il n'existait *aucun* moyen de
   remplir un horaire : la donnée manquait faute d'endroit où la mettre.

### Deux décisions à connaître

**L'ordre de travail est par nombre d'adresses, pas par score.** Une page de
pays qui porte 24 fiches complètes vaut mieux que 24 pays qui en portent une.
On finit un pays avant de passer au suivant, et le plan ne coupe jamais un pays
en deux.

⚠ **L'écran ne touche pas aux descriptions.** `lounges.description` porte
**2 500 traductions scellées** (`translation_status`) : les modifier depuis
l'administration les périmerait toutes en silence. L'écran ne saisit que ce qui
n'a pas de langue — horaires, site, Instagram, coordonnées, téléphone, soit
**65 des 100 points**, et ceux qui sont à zéro. Les descriptions passent par la
chaîne de traduction, qui sait resceller.

### Le rendu attendait déjà les données

L'application affiche horaires, site, Instagram, distance et itinéraire depuis
longtemps (`app.js`) ; `page.php` les affiche désormais aussi, et déclare la
position en `GeoCoordinates` **uniquement quand elle existe** — un `geo` à zéro
placerait l'établissement dans le golfe de Guinée, et Google le croirait.

### Ce que ce chantier ne fait pas

Il ne remplit aucune fiche. Il dit ce qui manque, où, dans quel ordre, et donne
l'écran pour le saisir. Les 50 premières fiches sont un travail de bureau — une
heure pour une dizaine d'adresses, en croisant le site de l'établissement et sa
page Maps.

⚠ **Un piège rencontré pendant le développement** : les essais de saisie ont
modifié `lounges`, qui est une table **versionnée** (`sql/contenu.sql`). Seul
`php tools/contenu_dump.php --verifier` l'a signalé — et une restauration faite
de mémoire plutôt que lue dans le fichier a réintroduit un mauvais numéro de
téléphone. Le fichier versionné fait foi ; on le relit, on ne s'en souvient pas.

### Les sources citées existent-elles ? (découvert en faisant le point 2)

En cherchant le site officiel de trois établissements d'Abidjan, deux des
domaines cités dans leur colonne `source` se sont révélés ne pas exister :
`golfabidjan.ci` ne résout pas, `bocachicaabidjan.com` rend 404.

Le contrôle systématique des **156 domaines** cités par les 498 fiches sourcées :

| | |
|---|---|
| domaines qui n'existent pas (DNS) | **29** |
| fiches concernées | **76 sur 498** |
| dont `lcdh-locator.com` | **48 fiches** à lui seul |

Plusieurs ressemblent à des domaines écrits de mémoire : `hotelgrnadospark.com.py`
(pour *granados*), `dubaicreak.com` (pour *creek*), `arturo-fuente.com` (le vrai
est `arturofuente.com`), `sautterscigars.co.uk` (le vrai est `sautter.co.uk`).

⚠ **Ce que cela ne dit pas.** Qu'un domaine n'existe pas ne prouve pas que
l'établissement n'existe pas — une Casa del Habano est bien réelle, même citée
depuis un domaine inventé. Ce qui est mesuré est la **traçabilité**, pas la
véracité. Mais la doctrine du projet est « aucune note sans source », et une
source qui n'existe pas est **pire** qu'une source absente : elle donne
l'apparence de la vérification.

**Deux erreurs factuelles trouvées au passage**, sur des fiches que je croyais
les mieux documentées :

- **#1189 « Le Radisson Blu — Sky Bar Cigares »** la place au *Plateau, avenue
  Franchet d'Esperey*. Il n'y a qu'un Radisson Blu à Abidjan, et il est à
  **l'aéroport (Port-Bouët)**. Le téléphone de la fiche ne correspond pas non
  plus à celui de l'hôtel.
- **#1191 « Sofitel Abidjan Hotel Ivoire — Fumoir »** : l'adresse est bonne,
  mais la page officielle Accor déclare l'établissement **« 100% Non Smoking
  Property »** et ne mentionne aucun fumoir. Le téléphone diffère d'un chiffre.

### L'outil et le cliquet

`tools/sources.php` — l'état, `--figer` (sceau versionné dans
`sql/sources_domaines.json`), `--verifier`, `--autotest`.

⚠ **Le contrôle se fait au DNS, pas en HTTP.** Mesuré : depuis la machine de
développement, `ethiopianairlines.com`, `thebreakers.com` et `serenahotels.com`
rendent tous `000` en HTTPS, y compris avec un en-tête de navigateur — ils sont
pourtant bien réels. Un contrôle HTTP aurait accusé **46** domaines au lieu de
29, et l'accusation aurait été fausse une fois sur trois.

La campagne, elle, **n'interroge pas le réseau** : elle compare la base au sceau.
Tout domaine cité doit y figurer — une source qui apparaît sans que personne ne
l'ait regardée fait échouer la campagne. Le nombre de fiches non traçables est
une **dette dont on interdit la croissance**, pas un objectif de qualité.

### Les 48 fiches « La Casa del Habano » (migrations `134`, `135`)

**Ce qui est établi.** La Casa del Habano est le réseau franchisé de Habanos
S.A. : il ne vend **que** des habanos, c'est-à-dire des cigares cubains. Or la
vente de cigares cubains reste interdite aux États-Unis en 2026 — l'embargo de
1962 n'a jamais été levé, et l'autorisation d'importation personnelle accordée
sous Obama a été supprimée le 24 septembre 2020.

Une Casa del Habano à **Chicago** ou à **Houston** ne peut pas exister. Ces deux
fiches ne sont pas incomplètes : elles sont fausses.

**Ce qui n'est pas établi.** Les quarante-six autres. Le réseau compte environ
140 boutiques dans plus de soixante pays, et Vienne, Madrid, Florence, Osaka ou
Nairobi sont des marchés plausibles. La liste officielle (`lacasadelhabano.com`)
est derrière un portail d'âge, et `habanos.com` y renvoie sans la reproduire.

Ne pouvant vérifier, **on ne supprime pas** : effacer 46 adresses probablement
réelles pour cause de citation fautive ferait plus de dégâts que le défaut. Leur
champ `source` cesse simplement de mentir — il dit désormais *« à vérifier —
réseau La Casa del Habano, liste officielle non recoupée »*.

| | avant | après |
|---|---|---|
| domaines inexistants cités | 29 | **28** |
| fiches non traçables | 76 | **28** |
| établissements publiables | 500 | **497** |

### `is_verified` valait pour l'application, pas pour les pages servies

Défaut trouvé en préparant ce retrait : `data.php` filtre sur `is_verified`
depuis toujours ; `page.php` et `sitemap.php` ne le faisaient pas. Tant qu'aucune
fiche n'était marquée non vérifiée, la différence ne se voyait pas — mais elle
aurait publié, **sur les pages que Google indexe**, précisément ce que la
modération avait retiré de l'application.

Un retrait qui ne retire qu'à moitié est le pire des deux mondes : invisible à
celui qui l'a décidé, visible à tous les autres. Corrigé par
`PAGE_FICHE_PUBLIABLE`, et éprouvé dans les deux sens — la contre-épreuve remet
la fiche en ligne et vérifie qu'elle revient, sans quoi un filtre qui masquerait
*tout* aurait passé le contrôle.

⚠ **Le retrait est réversible** : `is_verified = 0` plutôt qu'un `DELETE`. Les
deux lignes restent consultables en administration si la décision doit être
revue. `/cave/419` et `/cave/422` rendent 404, ce qui est la bonne réponse.

⚠ **Piège rencontré** : le premier texte de remplacement mentionnait
`lcdh-locator.com` en explication — et `tools/sources.php`, qui extrait les
domaines du texte libre, continuait donc à compter 48 fiches citant un domaine
inexistant. Le champ `source` dit ce qu'il en est **aujourd'hui** ; d'où l'on
vient est écrit dans le journal de modération.

### Le « PDF officiel Habanos S.A. » : le soupçon était mal placé (`141`)

Trois fiches citant cette source portaient un indicatif d'un autre pays, et j'en
avais conclu qu'elle était douteuse. **Mesuré, c'est l'inverse** :

| | fiches | numéros faux | taux |
|---|---|---|---|
| Bloc « PDF officiel Habanos S.A. » | 110 | 5 | **4,5 %** |
| Reste du corpus | 387 | 31 | **8,0 %** |

Cette source est meilleure que la moyenne. Elle n'a pas été touchée.

### Où l'excès se logeait réellement

**181 fiches revendiquent « La Casa del Habano »**, alors que le réseau réel en
compte environ 140. En les rangeant par source :

| Source | Fiches | |
|---|---|---|
| PDF officiel Habanos S.A. | 96 | plausible |
| ex-`lcdh-locator.com` | 45 | déjà signalées (migration `135`) |
| **`thecigarodyssey.com`** | **21** | **le site lui-même** |
| `habanos.com`, `lacasadelhabano.com`, `jjfox.co.uk`… | 19 | sourcées |

96 + 19 = 115, en deçà des 140 réelles. C'est en ajoutant les deux blocs
non sourcés qu'on dépasse.

### La citation circulaire

Soixante fiches portaient `thecigarodyssey.com` en source, et **vingt-huit
revendiquaient une affiliation officielle** : 21 La Casa del Habano, 2 Cohiba
Atmosphere, 5 Davidoff.

Une affiliation officielle est un fait qui concerne un **tiers** — elle décrit
une relation commerciale entre une enseigne et Habanos S.A. ou Davidoff.
L'affirmer sur la seule autorité du site qui l'affirme n'est pas une source
faible : c'est l'absence de source, déguisée en source.

Les 21 sont d'un même import du 22 mars, toutes dans des villes secondaires —
Rosario, Antofagasta, Penang, Chiang Mai, Cotonou, Lomé, Conakry. Précisément
les endroits où une succursale plausible s'invente sans qu'on aille vérifier.

⚠ **On ne supprime rien** : certaines existent sûrement. Le champ `source` cesse
seulement de laisser croire à une vérification qui n'a pas eu lieu — avec deux
formulations, parce qu'un hôtel qui a un fumoir énonce un fait ordinaire, tandis
qu'une enseigne qui se dit franchisée engage un tiers.

---

## La campagne des sources (migrations `142`→`156`)

Quatre blocs de fiches dont la source ne tenait pas, repris un par un.
**501 → 408 fiches publiables** : 98 retirées, une cinquantaine corrigées,
dix ajoutées. Il ne reste dans l'atlas aucune fiche dont la source soit une
invention.

| Bloc | Départ | Fin |
|---|---|---|
| Domaine cité inexistant | 28 | 0 |
| Affiliation officielle sans source externe | 28 | 0 |
| Réseau LCDH, liste non recoupée | 41 | 0 |
| Sans source externe | 31 | 0 |

### Ce que le défaut avait de particulier
**Il ne se voyait jamais sur une fiche.** Chacune était plausible : bon nom
d'enseigne, bonne ville, adresse crédible. Ce qui trahissait était toujours
*collectif* — le nombre par pays, la date d'import commune, la source unique
inexistante. Un lecteur ne peut pas voir ça ; un contrôle mécanique, si.

Deux formes revenaient. **Un nom réel déplacé** : Olivos Golf Club de Buenos
Aires à Milan, Cigar Lounge 33 de Belgique à Marbella, Pacific Cigar de Hong
Kong à Vancouver, Bertie du bon quartier au mauvais hôtel. Et **un salon
inventé dans un lieu vrai** : le Hemingway Bar d'Arusha (le vrai s'appelle
Hatari), la Cigar Terrace de Dubaï (le club a QD's et sa chicha). La seconde
est la plus coûteuse à débusquer : la moitié de la fiche est exacte.

### L'import du 22 mars
Cinquante-sept fiches posées d'un coup, toutes avec un téléphone et **aucune**
avec un site, des horaires ou des coordonnées. Il prenait une enseigne réelle
et la **répliquait sur les grandes villes du pays** : Malaisie 1 vraie / 4
affichées, Afrique de l'Ouest 1/5, Colombie 1/5, Argentine 2/4, Chili 1/4,
Italie 3/6, Espagne 0 sur le continent. Le fonds initial — identifiants bas,
source « PDF officiel Habanos S.A. » — s'est révélé **nettement plus juste**
que trois mois de corrections ne le laissaient croire.

### Trois raccourcis que la mesure a réfutés
- Le bloc « PDF officiel Habanos S.A. » soupçonné à tort : **4,5 %** de
  téléphones faux contre 8,0 % dans le reste du corpus — meilleur que la moyenne.
- La forme des numéros de téléphone : 44,6 % de motifs décoratifs contre 21,2 %
  ailleurs… mais **42,1 % contre 38,5 % à pays égal**. Un artefact de
  composition géographique, `8888` étant recherché en Asie.
- Seize adresses annoncées manquantes : il y en avait **quatre**, les six autres
  étaient déjà dans l'atlas.

### Deux garde-fous ont mieux vu que l'auteur
Le sceau `translation_status` (migration `140`) et la contrainte
`uq_country_name` (migration `153`), qui a refusé une correction et révélé que
**sept des neuf prévues auraient dupliqué** un établissement déjà juste.

### La méthode, à la fin
`habanomag.com` reprend les fiches de habanos.com et du site officiel LCDH,
classées par ville, par pays **et par échelon**. Quinze pages lues d'un bloc ont
réglé ce qui demandait vingt-sept enquêtes. Le réseau a trois échelons — La Casa
del Habano, Habanos Specialist, Habanos Point — que l'import confondait en un
seul, ce qui prête à un commerce une franchise qu'il n'a pas obtenue.

### Ce qui reste ouvert, et qui est dit tel quel
**Quinze fiches d'hôtels d'Afrique de l'Ouest** — Dakar, Cotonou, Ouagadougou,
Bamako, Lomé, Conakry — sont gardées publiées sans confirmation ni démenti.
Retirer sur ce silence reviendrait à faire disparaître une région parce qu'elle
est moins indexée. Le champ `source` le dit.

**Six adresses réelles** attendent au journal (`action = 'a_documenter'`) faute
d'adresse postale : quatre Habanos Points du Bénin et de Guinée, la seconde
Casa del Habano de Bangkok, le Habanos Specialist de Hanoï.

---

## Les images des fiches (migration `156`, `tools/placeholders.php`)

**Une seule vraie photographie dans tout l'atlas** : la façade du lounge
d'Abidjan. Les 407 autres images sont des **cartes engendrées** — nom, ville,
pays, une marque graphique — et c'est délibéré. Chercher des photos ailleurs
serait s'approprier le travail de quelqu'un ; en fabriquer serait inventer
l'apparence de lieux réels, exactement le défaut que la campagne des sources
vient de retirer.

- Les 440 cartes d'origine étaient faites **hors du dépôt**, à la police bitmap
  de GD : rouge sur bleu marine, cinq pixels de haut, un cigare fait d'un
  rectangle. Refaites : palette du site (or sur presque-noir), police
  vectorielle quand le serveur en a une, cigare conique à bague et pied allumé.
- **33 fiches publiées n'avaient aucune ligne** dans `lounge_photos` — toutes
  issues des chantiers `143`→`155`. Elles s'affichaient sans rien.
- La carte ne répète plus ce qui est déjà dit : ni la ville que le nom porte
  (180 fiches), ni la ville qui **est** le pays (15 états-villes).
- ⚠ **Les octets ne voyagent pas avec le code.** `uploads/` est exclu du
  déploiement : la migration pose les lignes, `php tools/placeholders.php --tout`
  fabrique les images, et il faut le lancer **sur le serveur**.

`Last-Modified` et la taille du fichier, lus ensemble, disent où un déploiement
coince : horodatage frais + taille inchangée = la regénération tourne mais le
code est vieux.

---

## Ce que les pages serveur ne servaient pas

Un recoupement mécanique — pour chaque colonne que `backend/pages_lib.php`
SÉLECTIONNE, la chercher dans `page.php` — a rendu **huit colonnes muettes**
sur trois types de page. Aucune n'était visible fiche par fiche : chaque page
paraissait complète. C'est encore le collectif qui a parlé.

### La fiche de marque
`gamme` ne rendait que le **nom** des lignes. Cape, force, vitoles et récit de
**279 modules sur 117 maisons** n'atteignaient pas la page indexable. `pairings`
était même sélectionnée par la requête et affichée nulle part, de même que
`celebrities` et `limited_eds`. ≈ 101 000 caractères remis au lecteur.

### La fiche de pays
- `tier` — le rang de production, renseigné sur **16 pays sur 16**.
- `region` — la macro-région (« Caraïbes », « Amérique du Sud »).
- `rev_detail` — **ce que le chiffre mesure**. « 0,58 M$ (2024) » sur la fiche
  du Brésil se lisait comme le poids d'une industrie ; la colonne disait
  « exportations de cigares et cigarillos (douanes brésiliennes) ». Servir le
  nombre sans sa définition, c'est publier un chiffre faux.
- Les Canaries ont l'explication **sans** le chiffre : le bloc se rend dès que
  l'un des deux est là.
- 192 champs remplis — 16 pays × 2 colonnes × 6 langues, 5 125 caractères.
- `flag` reste délibérément non rendue : Windows ne compose pas les emoji de
  drapeau, et « CU » en 38 px sous le titre se lit comme une coquille.

### La fiche d'établissement — le plus coûteux
`source` était sélectionnée et rendue **nulle part**. 407 fiches sur 408 en
portent une, 9 377 caractères. Tout le chantier des quatre blocs s'est mené au
nom de « aucune fiche sans source », 98 fiches retirées pour ce motif — et la
règle restait **invérifiable par celui qu'elle protège**.

Pire : la migration `155` avait gardé **dix-huit fiches publiées** en écrivant
dans `source` « à vérifier — l'hôtel existe, son salon cigares n'est recoupé
nulle part ». La décision était bonne, mais elle tenait sur une phrase de la
migration : *« le champ source dit désormais exactement l'état »*. Il ne le
disait à personne. Ces dix-huit fiches se présentaient comme les 389 autres.

Deux rendus, parce que ce sont deux choses :
- **une citation** (« habanos.com officiel 2024 », « PDF officiel Habanos S.A. »)
  se rend **telle quelle** dans les six langues — on ne traduit pas une
  référence ; seul le libellé suit la langue ;
- **« à vérifier — … »** n'est pas une source mais son absence : on rend la
  **réserve traduite** (« Nicht bestätigte Angabe »), jamais la note française.

`rating` / `rating_count` restent sélectionnées et **non rendues**, et c'est
écrit dans le code : trois fiches sur 408 portent une note, toutes à 5,0,
chacune sur **un seul vote**. Afficher « ★ 5,0 » laisserait croire à un
classement là où il n'y a qu'une voix.

`maps_url` disparaît de la requête : la migration `149` l'a vidée sur les 508
fiches et le lien se construit au rendu.

### Reste ouvert
- **#11 Fagot Cigare (Abidjan)** est la **seule** fiche publiée sans aucune
  source. L'utilisateur est sur place.
- La `source` n'a pas de colonnes traduites : une valeur sur 173 est de la prose
  française sans domaine (#2524, Alvear Palace). Elle est vraie ; lui fabriquer
  un domaine pour faire propre serait la faute que ce chantier a défaite.

---

## Les dix-huit descriptions qui en disaient trop (migration `162`)

Rendre la source visible a rendu une contradiction visible. Les dix-huit fiches
marquées « ⚠ Information non recoupée » portaient une description qui affirmait
**exactement ce que la réserve déclare inconnu** :

> « Habanos premium pour la communauté d'affaires internationale de Dakar et le
> corps diplomatique. » — #2537 Radisson Blu Dakar
>
> « Fréquentée par les chefs d'État lors des sommets de la CEDEAO. » — #2538

Le bandeau et la prose se démentaient à deux lignes d'intervalle. Ces phrases
viennent toutes de l'import du 22 mars, du même geste que les 98 fiches retirées
par le chantier des quatre blocs.

**Ce qui reste** : le nom de l'établissement, sa nature, son quartier — c'est-à-dire
ce que la migration `155` a réellement établi, *l'hôtel existe*. **Ce qui part** :
l'offre de cigares, la clientèle, les superlatifs, et les dates non sourcées
(1960, 1967, 1975, 1984). La phrase finale est la même pour quinze fiches, et
c'est voulu : elles partagent un état, pas une histoire.

**Trois cas qui ne sont pas des hôtels**
- **#745 Viña del Mar** — ce n'est pas le salon qui manque, c'est le commerce.
- **#250 Barcelone** — c'est l'appartenance au réseau franchisé qui manque. Son
  champ `type` disait « La Casa del Habano Officielle », **rendu au-dessus de la
  description** : la page se contredisait elle-même. Passé à « Cave & Lounge ».
- **#413 Tampa** — celui-ci portait une **impossibilité**, pas une incertitude.
  La fiche annonçait « La Casa del Habano de Tampa » ; le réseau vend des cigares
  cubains et n'a aucune adresse aux États-Unis, où ces produits ne sont pas
  vendus. Même faute que le #411 Miami de la migration `157`.

**Aucune fiche n'est retirée** : le motif de la `155` tient toujours.

Un cliquet garde la porte — aucune fiche non recoupée ne peut décrire une offre
(`premium`, `clientèle`, `corps diplomatique`, superlatifs). Les mots choisis sont
des mots **d'affirmation**, pas du sujet : « Habanos » en est absent, parce que
#250 le nomme pour dire qu'il manque, et que nommer ce qui manque est le
contraire de l'affirmer.

---

## Fagot Cigare : la dernière des 408 (migration `163`)

`#11 Fagot Cigare`, à Abidjan, était la **seule fiche publiée sans aucune
source**. L'utilisateur, qui est sur place, a fourni le site officiel —
[lefagot.com](https://lefagot.com). **Le compte des fiches sans source est
maintenant à zéro**, et un cliquet l'y maintient.

En la documentant, trois autres défauts sont apparus :

- **La prose affirmait ce que la source ne dit pas.** « Seule fabrique
  artisanale de cigares ivoiriens » — le site ne revendique nulle part d'être
  la seule. « Cigares sur mesure, live cigar show » — ni l'un ni l'autre n'y
  figurent.
- **Les cinq traductions étaient des substitutions mot à mot** : *« Only factory
  artisanal de cigares ivoiriens »*, *« Einzige Fabrik artisanale de cigares
  ivoiriens »*. La faute exacte des migrations `157`→`160`.
- **`city` listait quatre localités** — « Abidjan (et Tiassalé, Djékanou,
  Tiébissou) ». Djékanou et Tiébissou sont des **noms de cigares** de la gamme
  Aboussouan, pas des adresses ; Tiassalé n'apparaît nulle part.

### Une sonde qui manquait, et une qui ne marche pas
Cette fiche a **échappé aux deux sondes** de français résiduel : elles cherchent
des mots-outils français (`de la`, `du`, `le`, `les`) et ce résidu n'en porte
aucun. Elle a été trouvée en **lisant la ligne**, pas par un outil.

Une sonde de remplacement a été essayée puis **rejetée par la mesure** : compter
le taux de mots communs entre le français et sa traduction. Sur le corpus,
**312 fiches dépassent 50 %**, et celles du haut du classement — #4, #13, #17 —
sont de l'anglais et de l'allemand parfaitement corrects. Le recouvrement mesure
les **noms propres**, pas la traduction.

### Ce qui reste ouvert
Le site ne décrit pas un point de vente : il décrit un **fabricant**, avec trois
lignes nommées (Robusto, Aboussouan — Le Poro, Tiébissou, Djékanou — et
Fagorillos) et un terroir revendiqué. La Côte d'Ivoire est pourtant dans
`lounge_countries`, pas dans `producer_countries`. Ouvrir un pays producteur
demande un rang, une région, des récoltes, un climat, des sols et six langues :
c'est un chantier, pas une ligne.

---

## La maison Le Fagot Cigar (migration `164`)

**La 119ᵉ maison, et la première hors d'un pays producteur.** Les 118 autres ont
toutes leur `country_id` dans `producer_countries` ; la Côte d'Ivoire est un pays
d'établissements. `page_marque()` prévoit le cas depuis toujours — un `LEFT JOIN`
sur `lounge_countries` — mais **aucune donnée ne l'avait jamais emprunté**. Le
chemin a été éprouvé par la campagne **avant** la migration, pas après.

### Pourquoi la Côte d'Ivoire n'est PAS passée pays producteur
La réponse tient à une phrase absente. lefagot.com dit « savoir-faire local »,
« un terroir riche », « feuilles minutieusement sélectionnées ». **Il ne dit
jamais où la feuille est cultivée.**

Les trois déclinaisons de l'Aboussouan portent des noms de lieux ivoiriens —
Le Poro au nord, Tiébissou et Djékanou au centre — et c'est troublant. Mais ce
sont des **noms de produits**. Un atelier peut parfaitement rouler à la main à
Abidjan des feuilles importées.

Ouvrir un dix-septième pays producteur imposerait d'affirmer un climat, un sol,
une saison de récolte, des régions de culture et des variétés dont aucune source
ne dispose — **sur la foi de noms de cigares**. Le plus mince des seize, Panama,
porte tout cela plus un chiffre douanier.

**Ce manque est écrit dans la fiche elle-même, dans les six langues.** Le lecteur
apprend que la maison parle d'un terroir sans dire où le tabac pousse, et
pourquoi la Côte d'Ivoire figure en pays d'adresses.

### Un garde-fou a refusé une citation, et il avait raison
Le premier jet citait le site — « uniquement la feuille, le geste et le temps ».
`marques_check` l'a rejetée : *prête une parole*. La citation était pourtant
réelle et attribuée, et un mécanisme d'exception existe (Kipling, El Rey del
Mundo). **On n'en a pas ouvert une** : la phrase ne disait rien de plus que
« sans additif », écrit deux mots plus tôt. Une exception se réserve à ce qu'une
paraphrase perdrait ; en ouvrir une pour de l'ornement use le garde-fou pour les
fois où il aura raison contre quelque chose qui compte.

### Ce qui débloquerait la promotion
Trois réponses, que seul quelqu'un à Abidjan peut obtenir :
1. **La feuille est-elle cultivée en Côte d'Ivoire, ou importée ?**
2. Si ivoirienne : où — le Poro ? le Bélier ? — et quelle variété ?
3. Existe-t-il une ligne d'exportation de cigares ivoiriens aux douanes ?

---

## Cinq contenus qui n'avaient aucune adresse

**163 492 caractères, en six langues, que rien n'exposait.** Les feuilles, le
lexique, les arômes, les marchés et la présence d'Habanos vivaient en base et
n'étaient servis que par l'application JavaScript : ni adresse, ni lien, ni plan
de site. Un robot ne pouvait pas les atteindre, un lecteur sans JavaScript non
plus.

| | lignes | caractères (×6 langues) |
|---|---|---|
| `feuilles` | 30 | 103 446 |
| `habanos_presence` | 12 | 27 704 |
| `lexique` | 20 | 12 868 |
| `aromes` | 20 | 10 456 |
| `markets` | 10 | 9 018 |

**`production_zones` n'en faisait pas partie.** Je l'avais annoncée dans la même
liste — c'était faux. `page_pays()` la sélectionne depuis toujours et `page.php`
la rend sous « Zones de culture ». Cinq entités, pas six. Un test le vérifie
maintenant plutôt que de me croire sur parole.

### Ce qui a été ouvert
- `/feuilles` — les trente tabacs **groupés par pays**, parce qu'une feuille est
  d'abord un terroir ; une liste alphabétique ne dirait rien.
- `/feuille/<id>` — genèse, culture, caractères, notes, accords, et les cigares
  qui la portent (dérivés de `producer_countries.brands`, comme le fait l'app).
- `/lexique` — vingt termes **d'une traite**, avec ancres. Une définition de deux
  phrases ne fait pas une page : vingt adresses maigres se seraient concurrencées.
- `/aromes` — notes et accords **séparés** : `contexte` distingue ce qu'on trouve
  de ce qu'on propose. Les mélanger ferait croire qu'on boit du cuir.
- `/marches` — les dix marchés, classés.
- La présence d'Habanos **sur les douze pages de pays** concernées.

**34 adresses nouvelles × 6 langues = 204**, toutes au plan de site (639 → 673).

### Les liens comptent autant que les pages
Les quatre index sont liés **en haut de l'atlas**, avant les listes de pays — pas
après cent dix-neuf maisons. Un plan de site fait connaître une adresse ; c'est un
lien qui lui donne du poids. Quatre pages orphelines auraient été le même défaut
sous une autre forme, et un test le garde.

### Un défaut de fabrique corrigé au passage
`page_col()` ne savait pas préfixer une table. `feuilles` et `producer_countries`
portent toutes deux une colonne `notes` ; la requête les joint, et MySQL refusait.
Sans ce paramètre il fallait renoncer à la jointure ou écrire le `COALESCE` à la
main — c'est-à-dire à côté de la seule fabrique qui connaît les langues.

---

## La Côte d'Ivoire, dix-septième pays producteur (migration `165`)

La migration `164` avait **refusé** cette promotion, et elle avait raison :
lefagot.com parlait d'un « terroir riche » sans jamais dire où la feuille était
cultivée. Ce qui manquait n'était pas de la prudence — c'était une source.

### Ce qui est établi
1. **Le tabac est cultivé en Côte d'Ivoire**, et pas marginalement : ~8 071 t/an
   de feuilles, premier tonnage d'Afrique de l'Ouest (FAO). Filière historique au
   nord, autour de Bouaké, où la SITAB (Imperial Brands) est l'unique cigarettier.
2. **La chaîne du Fagot est ivoirienne** — « de la récolte […] jusqu'à la mise des
   bagues, tout le processus se fait en Côte d'Ivoire » (abidjanmag.com,
   19 juin 2020 ; jcdmag.com). ⚠ La phrase est **identique chez les deux** : un
   communiqué relayé deux fois, donc *une* affirmation du fabricant, pas deux
   constats.
3. **La composition par terroir vient d'un tiers** : une cave d'Abidjan
   (vivinto.net) décrit une **cape de Tiébissou** sur une **sous-cape et une tripe
   de Didiévi**, deux sols, ~100 jours de vieillissement.
4. **La géographie confirme** : Tiébissou, Didiévi et Djékanou sont trois des
   quatre départements de la **région du Bélier**. Un fabricant qui inventerait des
   terroirs ne tomberait pas sur trois subdivisions contiguës d'une même région.

### Les trous sont déclarés, pas comblés
`varieties`, `climate`, `soil`, `harvest` et `revenue` **restent vides**. Panama,
le plus mince des seize précédents, les porte tous. La variété est le manque qui
compte : une source faible affirme que le pays ne cultive que du **Burley** — un
tabac de cigarette — mais rien ne dit que le tabac du Bélier passe par le circuit
SITAB du nord. On n'écrit ni « Burley » ni autre chose. **Un test garde qu'un
champ vide disparaît au lieu de s'annoncer** : « Climat » suivi de rien dirait au
lecteur que l'information existe et s'est perdue.

### Trois garde-fous ont eu raison contre moi
- `coherence_check` : `regions` doit correspondre **exactement** aux noms des
  zones (j'écrivais « Tiébissou (Bélier) » d'un côté, « Tiébissou » de l'autre),
  et `producer_countries.brands` doit nommer la maison **telle qu'elle existe**
  en base (« Le Fagot » ≠ « Le Fagot Cigar » — la maison serait restée invisible
  depuis le globe).
- `i18n_superlatif_check` : trois traductions disaient « le plus grand tonnage »
  là où le français dit « premier ». Passées à l'ordinal.
- **L'oubli de la règle 143** : `production_zones.id` est auto-incrémenté *et*
  versionné. Sans identifiant explicite, développement et production divergent et
  `traductions.sql` vise des lignes inexistantes. Figés à 46-48.

### Une note de la 163 rectifiée
« Tiassalé n'apparaît nulle part sur le site » était vrai de lefagot.com et
**faux du dossier** : les quatre localités de l'ancien champ `city` étaient les
sites de production.

### Reste ouvert
**La variété.** Une question à Fagot suffirait.

---

## Le climat et le sol du Bélier (migration `166`)

Deux des cinq trous de la fiche ivoirienne se referment. **La condition que je
m'étais fixée est tenue** : la source porte sur un **périmètre du Bélier**, pas
sur la Côte d'Ivoire en général — sinon j'aurais écrit une généralité déguisée en
fait tabacole.

**Source** : *« Intégration de données topographiques et hydrographiques […] cas
d'un périmètre de la région du Bélier en Côte d'Ivoire »*,
[Physio-Géo](https://journals.openedition.org/physio-geo/4120), revue de
géographie physique (OpenEdition).

- **Climat baouléen** — tropical humide de *transition* entre l'équatorial à
  quatre saisons du sud et le tropical humide à deux saisons du nord ;
  1 000 à 1 400 mm/an en deux périodes (avril-juin, septembre-octobre).
- **Sols ferrallitiques** sur un substratum **essentiellement granitique**.

### Ce qu'on n'en déduit pas
`harvest` **reste vide**, et c'est le point délicat. Le régime des pluies est
documenté, mais un calendrier de **récolte du tabac** ne s'en déduit pas : la date
de coupe dépend de la variété, de la conduite de la plante et du séchage. Écrire
« Avr – Juin » parce qu'il pleut à ce moment-là serait exactement la faute que
cette migration se refuse.

La source mentionne aussi des **gleysols** le long du Kan et de la Marahoué, en
les disant favorables à la **riziculture irriguée**. Les nommer dans un champ de
fiche tabac laisserait croire qu'ils portent le tabac : on ne garde que le sol
dominant.

### L'écart avec Panama, recompté
**Trois champs**, et non cinq : `varieties`, `harvest`, `revenue`.
Les deux premiers, une question à Fagot les refermerait. Le troisième restera
probablement vide — la filière est intérieure, il n'existe pas de ligne
d'exportation ; les Canaries sont déjà dans ce cas et la page sait le rendre.

---

## Ce qu'un pays producteur porte (migration `167`)

La migration `165` a ouvert un pays **sans regarder tout ce qu'un pays porte**.
Un recensement des tables à clé pays le montre :

| table | couverture des 17 | Côte d'Ivoire |
|---|---|---|
| `brands` | 17/17 | ✓ |
| **`producer_geo`** | **16/17** | **ABSENTE** ← seul trou universel |
| `lounges` | 16/17 | ✓ 14 |
| `production_zones` | 16/17 | ✓ 3 |
| `feuilles` | 15/17 | ABSENTE |
| `habanos_presence` | 12/17 | ABSENTE |

`producer_geo` est **la seule table que les seize pays producteurs précédents ont
tous**, et la Côte d'Ivoire en était la seule exception — un trou que j'avais créé.
Source : [fiche pays du ministère français des Affaires étrangères](https://www.diplomatie.gouv.fr/fr/information-par-pays/cote-d-ivoire/presentation-de-la-cote-d-ivoire).

**Deux pièges évités** : la monnaie n'est **pas** celle du Cameroun — les deux
disent « franc CFA » mais le Cameroun est en **XAF** et la Côte d'Ivoire en
**XOF**, deux monnaies distinctes de même parité. Et la capitale est
**Yamoussoukro** alors que les quatorze adresses de l'atlas sont à **Abidjan** :
le champ porte les deux, comme les Canaries portent « Las Palmas / Santa Cruz ».

### Une lecture de ma part qui était fausse
La `165` avait laissé `varieties` vide en le comptant parmi les trous, « faute de
source sur la variété ». **Méprise sur le champ** : `varieties` ne porte pas le
cultivar botanique, il porte **les tabacs nommés du pays** — le Brésil y met
« Mata Fina », « Arapiraca », qui sont des lieux. Et c'est cette liste qui rend
les fiches de feuilles atteignables : `coherence_check` a refusé les deux
nouvelles feuilles, *« injoignables »*. Le champ se remplit donc sans rien
affirmer de botanique.

### Deux feuilles, plus maigres et assumées
`caracteres`, `notes` et `pairings` restent **vides** : les caves décrivent des
arômes boisés et floraux pour **l'assemblage** des deux feuilles, pas pour
chacune. Les répartir serait inventer. La genèse dit ce qu'on sait et ce qu'on ne
sait pas plutôt que de meubler.

### L'écart avec Panama, re-recompté
**Deux champs** : `harvest` et `revenue`. Une question à Fagot referme le premier ;
le second restera probablement vide — la filière est intérieure.

---

## Le drapeau perdu en route (migration `168`)

Le drapeau ivoirien 🇨🇮 est arrivé en production sous la forme de **huit points
d'interrogation** — `???????? Côte d'Ivoire` sur l'index des feuilles, quand les
seize autres pays portaient le leur.

**Ni le fichier ni la colonne n'étaient en cause** : la colonne est en `utf8mb4`,
et en développement `HEX()` donnait `F09F87A8F09F87AE`. C'est **le client** : un
`mysql < migration.sql` sans `--default-character-set=utf8mb4` ouvre la connexion
dans le jeu par défaut du serveur, souvent `utf8` — celui de MySQL, qui ne code
que **trois octets**. Tout caractère sur quatre octets y est remplacé octet par
octet par `?`. Deux indicateurs régionaux font huit points d'interrogation.

**Le partage des dégâts est contre-intuitif.** L'arabe, le chinois et les accents
(un à trois octets) sont passés sans une égratignure — les six langues de la fiche
s'affichaient parfaitement. Seul l'emoji est tombé. Un contrôle qui aurait vérifié
« le texte s'affiche » aurait conclu que tout allait bien.

Sur les six migrations déployées ce jour-là, **une seule** portait des caractères
de quatre octets. Le dégât tenait en un champ.

### La réparation ne peut pas porter l'emoji
L'écrire dans le fichier reproduirait la panne : la valeur repasserait par la même
connexion. On écrit les **octets**, en hexadécimal ASCII, reconvertis côté serveur
par `CONVERT(UNHEX('…') USING utf8mb4)`.

### Un contrôle qui voit depuis le serveur
Aucun outil local ne pouvait attraper ceci — `coherence_check` vérifie les
drapeaux, mais sur la base de développement, où ils sont justes. **`prevol.php`
tourne sur le serveur** : c'est le seul endroit d'où le dégât est visible. Il porte
désormais un constat **bloquant** sur les drapeaux abîmés ou vides, dont la
remédiation donne la commande avec le jeu de caractères explicite.

---

## Les données générales (migration `169`)

`producer_geo` porte **huit champs par pays** — capitale, population, superficie,
monnaie, langue, fuseau, PIB, indépendance — et n'était rendue par **aucune page
serveur**. Dix-sept pays, 136 valeurs, réservées à l'application JavaScript.
C'est le même défaut que les cinq contenus ouverts précédemment, sur une table
qui avait échappé au recensement.

### Pourquoi une migration avant du code
La table n'avait **aucune colonne traduite**, et c'était sans conséquence tant que
seule l'application la lisait : celle-ci reconstruit monnaie et langue à
l'exécution, depuis des **codes** (`data.pays.js`) et `Intl`. Une page serveur ne
le peut pas — ou alors en pariant sur `ext-intl`, dont rien ne garantit la
présence chez l'hébergeur.

Les rendre telles quelles aurait injecté « Espagnol », « Peso cubain » et
« soulèvement dès 1868 » dans les pages allemandes, chinoises et arabes.

**28 valeurs distinctes seulement** : 15 monnaies (le code ISO entre parenthèses
ne bouge pas), 8 langues, et 5 dates d'indépendance sur 14 — les neuf autres sont
des **années nues** qui ne se traduisent pas, et `page_col()` retombe sur le
français, qui donne le même chiffre.

### Non traduit, et assumé
`capital` reste en noms propres — « La Havane » est l'exonyme français, et l'atlas
sert déjà « Côte d'Ivoire » tel quel en allemand. `population`, `area`, `gdp` et
`timezone` restent en notation française (« 87,1 Md$ », virgule décimale) : c'est
**déjà** le cas de `revenue`, servi sur chaque fiche de pays dans les six langues
depuis des mois. Changer ici seulement créerait deux conventions dans une même page.

### Un tiret n'est pas une valeur
Le PIB des Canaries est stocké « — » : un marqueur d'absence hérité de
l'application, qui l'affiche pour tenir sa grille. Une page servie n'a pas de
grille à tenir, et « PIB : — » coifferait le vide d'un libellé — exactement ce que
le cliquet des trous déclarés interdit deux blocs plus bas. Un test le garde, avec
la contre-épreuve : le libellé revient dès qu'il y a un chiffre.

### Et `schema.sql` suit
Les nouvelles colonnes y sont ajoutées à la main : une migration modifie la base
vivante, `schema.sql` définit la base neuve. Sans cela toute la campagne tombe en
cascade — c'est arrivé, cinq échecs d'un coup, dont un « l'arabe est servi de
droite à gauche » sans rapport apparent.

---

## Tous les drapeaux, restaurés (migration `170`)

**Le contrôle posé par la `168` a trouvé un second cas, et il n'est pas de moi.**
Sur l'atlas en production, **Macao** s'affichait `???????? Macao` — même signature
que le drapeau ivoirien. En développement la valeur est intacte
(`F09F87B2F09F87B4`) : la corruption vient d'un **déploiement antérieur**, passé
par la même commande sans `--default-character-set=utf8mb4`. Personne ne l'avait
vue parce que personne ne regardait le drapeau de Macao.

**Réparer Macao seul corrigerait l'instance, pas la classe.** Rien ne dit qu'un
troisième drapeau ne s'est pas abîmé autrement qu'en `?` — un octet perdu ne laisse
pas toujours une trace lisible, et la seule façon d'en être sûr est de reposer la
valeur connue. Les 120 drapeaux des trois tables sont donc réalignés sur la source
versionnée. Ce n'est pas une réécriture à l'aveugle : la base de développement a
elle-même été réalignée depuis `contenu.sql`, donc depuis la production, et elle
ne porte aujourd'hui **aucun** drapeau abîmé. Pour 119 lignes sur 120, la migration
ne change rien — vérifié par empreinte avant/après.

Aucun emoji n'est écrit dans le fichier : tout est en hexadécimal ASCII,
reconverti côté serveur. Un fichier qui porterait les caractères repasserait par
la connexion fautive et reproduirait la panne.

---

## Trinidad USA, la quatrième jumelle (migration `171`)

L'atlas portait **Trinidad (Cuba)** et trois jumelles américaines — Cohiba USA,
Partagás USA, Romeo y Julieta USA — et **pas la quatrième**. Un lecteur qui
cherchait qui fabrique le Trinidad vendu aux États-Unis ne trouvait rien, alors
que le motif était établi trois fois à côté.

### L'histoire n'est pas celle des autres
Cohiba USA et Partagás USA sont des noms **cubains** que General Cigar a déposés
aux États-Unis dans le vide créé par l'embargo. Trinidad, non :

> La famille Trinidad fonde *Trinidad y Hermanos* à Cuba en **1905** ; la
> Révolution la confisque. Exilés, les Trinidad font rouler un Trinidad non
> cubain par les **Fuente, à Tampa, dès 1968** — arrêt une dizaine d'années plus
> tard. Seconde tentative dominicaine, encore avec les Fuente, en **1997**. La
> famille **gagne contre Cuba devant les tribunaux américains en 2001**, et vend
> la marque à **Altadis U.S.A. en 2002**.
> — [Cigar Aficionado, *The Tale of Trinidad*](https://www.cigaraficionado.com/article/the-tale-of-trinidad)

C'est la maison d'origine qui récupère son propre nom avant de le céder.

### Une fiche qui ne tient pas dans une usine
Les trois autres jumelles ont **une** adresse. Le Trinidad américain est
**multi-sites** : *Santiago* chez Tabacalera Palma (José « Jochy » Blanco,
République dominicaine), *Espiritu* chez A.J. Fernandez (Estelí, Nicaragua),
assemblages menés par Rafael Nodal pour Altadis.

### Ce qu'on n'écrit pas
`force`, `vitolas`, `pairings`, `celebrities`, `limited_eds` : rien de sourcé.
Le catalogue de 2003 — Coloniales, Fundadores, Reyes, Robusto Extra, Robusto T —
est cité dans **l'histoire** et non dans la gamme : le fabricant ne le présente
plus, mais aucune source ne dit qu'il soit arrêté. Le dire arrêté serait
affirmer ; le mettre en gamme serait affirmer l'inverse.

### Un titre vide sur les cent vingt fiches
Trouvé en vérifiant la fiche neuve, et **présent depuis le premier jour** :
l'histoire de la maison passait par `bloc('')`, qui posait un `<h2></h2>` **vide**.
Un titre de niveau deux sans texte n'est pas invisible — un lecteur d'écran
l'annonce, et il ouvre une section qui ne dit pas de quoi elle parle. L'histoire
se rend maintenant en `pg-chapo`, comme le fait déjà la fiche d'établissement.

---

## Les neuf jumelles non cubaines (migrations `172` et `173`)

L'atlas documentait **sept fois** le motif « même nom, deux marques » et en
laissait **dix** ouverts. Neuf sont ajoutées ; l'atlas compte **129 maisons**.

**Le piège qui les avait cachées** : un recoupement par le nom les déclare
« déjà présentes », puisque le nom cubain est en base. Faux positifs **de fond** —
c'est ce qui avait laissé passer Trinidad USA jusqu'à ce qu'un lecteur le
remarque.

| Honduras | Rép. dominicaine |
|---|---|
| Bolívar Honduras | La Gloria Cubana Dominicaine |
| El Rey del Mundo Honduras | H. Upmann Dominicain |
| Saint Luis Rey Honduras | Henry Clay |
| Gispert | Por Larrañaga Dominicain |
| | Fonseca Dominicain |

### Neuf, et non dix
**Sancho Panza non cubain n'est pas créé** : STG a annoncé en janvier 2026 le
retrait de son tarif de Sancho Panza et Los Statos Deluxe. Ouvrir une fiche de
maison vivante pour une marque qu'on cesse de vendre serait affirmer le contraire
de ce qu'on sait.

### Deux qui ne sont pas des jumelles
**Gispert** : ici c'est *Cuba* qui a lâché le nom — Habanos a arrêté en 2005,
Altadis avait relancé dès 2003 au Honduras. **Henry Clay** : même cas. Toutes
deux entrent sans suffixe, puisqu'il n'y a personne en face.

### Ce qui fait la valeur du bloc : les renvois internes
Trois fiches mènent à des maisons **déjà** dans l'atlas — La Gloria Cubana
Dominicaine à **E.P. Carrillo** (le même homme, Ernesto Perez-Carrillo), Gispert à
**La Flor de Copán** (la même usine), Fonseca Dominicain à **Quesada** (la même
famille). Et El Rey del Mundo Honduras partage ses rouleurs avec Punch et Hoyo
Honduras, chez HATSA.

### Deux actionnariats périmés, trouvés en chemin (migration `172`)
L'atlas affirmait **deux fois** qu'Imperial Brands possède ce qu'il a vendu en
octobre 2020 : la moitié d'Habanos (passée à **Allied Cigar Corporation**) sur la
page de Cuba, et Altadis USA (passée à **Gemstone Investment Holding**) sur la
fiche Romeo y Julieta USA. Dans les six langues, depuis presque six ans.

**Aucun contrôle ne pouvait le voir** : `marques_check` vérifie qu'une affirmation
est *sourçable*, pas qu'elle est encore *vraie* ; les contrôles i18n comparent les
langues entre elles, et les six disaient la même chose fausse. Un fait daté ne se
démode pas d'un coup — il reste juste, puis devient faux sans rien changer à sa
forme. On écrit désormais la **date** avec le fait.

### Deux garde-fous, encore
`marques_check` a refusé « l'une des plus grandes manufactures au monde » pour la
Tabacalera de García. C'était sourcé, mais les chiffres qui suivent — deux mille
personnes, quarante millions de cigares par an — disent plus et se vérifient. Le
classement est retiré, pas excepté.

`i18n_fraicheur` a compté trente traductions sans empreinte : mon sceau excluait
les gammes `[]`. Or `Capitol` porte « [] » **et cinq sceaux** — le sceau dit que la
traduction correspond au français, et « [] » traduit « [] » exactement.

---

## Le Mozambique et Bongani (migration `174`)

Le Mozambique n'était dans l'atlas **ni** comme producteur **ni** comme pays
d'adresses. Il entre par une seule maison — **Bongani** — et devient le
**18ᵉ pays producteur**, le second africain ouvert en trois mois après la Côte
d'Ivoire, et le premier d'Afrique australe (9ᵉ macro-région).

**Kamal Moukheiber**, libanais de naissance, HEC Paris, quinze ans de banque
d'investissement à Londres (Credit Suisse, Lehman Brothers), s'installe à Maputo
en 2013 pour un projet immobilier. L'idée lui vient dans un café, en regardant des
clients fumer. Premier cigare : **décembre 2016**. Un maître cigarier dominicain,
passé par General Cigar sur Macanudo, forme des rouleuses mozambicaines — première
promotion diplômée en 2017. L'atelier de la **Baixa**, à Maputo, sort une dizaine
de milliers de cigares par mois.

Le tabac est cultivé au Mozambique par des paysans **sous contrat**, à partir de
**semences dominicaines**. La **cape vient du Cameroun** — que l'atlas porte comme
producteur de cape — et les cigares vieillissent dans des **feuilles de cèdre du
Ghana**. La maison se vend jusqu'en **Côte d'Ivoire**, ouverte trois migrations
plus tôt.

### Une étiquette que le fabricant ne revendique pas
On lit partout — Wikipédia le premier — que Bongani est « la première marque de
cigares **entièrement** africaine ». **Le fondateur ne dit pas cela** : il
revendique une sélection guidée par la qualité, d'Afrique comme d'ailleurs, et la
tripe mêle des tabacs africains et non africains, dominicains compris.
« Premier cigare africain » se défend ; « entièrement africain » est une formule
de reprise de presse, et l'atlas ne la reprend pas.

### Les trous, déclarés — et plus larges qu'en Côte d'Ivoire
`regions`, `varieties`, `climate`, `soil`, `harvest` et `revenue` restent vides.
Une couverture de presse attribue le tabac à la province de **Manica**, mais c'est
une source unique et indirecte, et la fiche Wikipédia de la province ne mentionne
**aucune** culture de tabac. Pour la Côte d'Ivoire, deux caves décrivaient
l'assemblage par terroir et une revue de géographie décrivait la région : ici,
rien de tel. Ni zone de culture, ni coordonnées, ni feuille.

### Deux leçons appliquées
Le **drapeau** est écrit en hexadécimal et reconverti côté serveur — leçon de la
migration `168`. Et `producer_geo` est remplie du même geste : la `167` avait
appris que c'est la seule table que **tous** les pays producteurs portent.

### Un troisième garde-fou découvert
`coherence_check` a refusé : *« aucun drapeau dessiné dans flags.js — la fiche
affiche trois bandes grises »*. Le drapeau mozambicain est donc dessiné :
trois bandes, deux liserés blancs, un triangle de hampe, une étoile. **L'emblème
officiel — livre, houe et fusil — n'est pas dessiné et ne le sera pas** : le
rendre « à peu près » donnerait un objet qui ressemble à une arme sans en être une.

---

## Vérification des fiches dominicaines (migration `176`)

Les **22 fiches** de la République dominicaine ont été recoupées une à une.
Toutes répondent, la page pays les liste toutes, et il ne reste aucune trace de
`Fonseca Dominicain` après son passage au Nicaragua. **Mais trois portaient une
usine fausse**, et aucune de ces erreurs n'était récente : elles étaient là depuis
l'import.

### Davidoff et Avo n'ont jamais été faits chez MATASA
L'atlas les attribuait tous deux à « Manufactura de Tabacos S.A. (MATASA),
Santiago ». **MATASA est la manufacture de la famille Quesada** — l'atlas porte
d'ailleurs la maison Quesada sous ce nom et avec cette usine, ce qui rendait la
contradiction visible pour qui lisait les deux fiches.

Les deux sortent de **Tabadom** (Tabacos Dominicanos), fondée en février 1984 par
**Hendrik « Henke » Kelner** à Villa González, et vendue plus tard à Davidoff.
Kelner y produisait les **Avo avant les Davidoff** ; les premiers Davidoff
dominicains datent de 1990. Le même atelier fait aussi les Griffin's et les Troya.

La fiche d'Avo **répétait l'erreur en toutes lettres, dans les six langues**. Elle
est corrigée sans être défaite : la phrase disait vrai sur le fond — c'est bien le
même atelier que Davidoff — et faux sur le nom.

### Macanudo n'est pas fait à La Romana
L'atlas écrivait « General Cigar, La Romana et Santiago ». **La Romana est la
Tabacalera de García, c'est-à-dire l'usine d'Altadis** — celle des Montecristo,
Romeo y Julieta et H. Upmann dominicains, que l'atlas porte correctement par
ailleurs. Mettre les deux villes faisait cohabiter dans une même ligne deux
groupes concurrents. Macanudo est roulé à Santiago, chez General Cigar Dominicana,
depuis le transfert de la Jamaïque en 2000.

### Un champ vague rempli
**The Griffin's** portait « Rép. dominicaine » — vrai, mais sans contenu. La même
source qui corrige Davidoff et Avo nomme l'atelier.

### Et un piège de langue
La substitution allemande n'a rien remplacé pendant que les cinq autres passaient :
**« anbahnen » est un verbe séparable** et rejette son « an » en fin de
proposition. Une vérification langue par langue l'a montré — un `REPLACE` qui
échoue ne dit rien, il laisse simplement le texte fautif en place.

### Ce que la vérification dit du reste
Les dix-huit autres tiennent : Fuente et Ashton chez Tabacalera A. Fuente, Quesada
chez MATASA, E.P. Carrillo à la Tabacalera La Alianza, La Aurora et La Flor
Dominicana dans leurs propres murs, et les marques d'Altadis à la Tabacalera de
García.

---

## MariaDB n'est pas MySQL (migration `179`)

**Signalé par l'utilisateur : « les marques pour la République dominicaine ne
s'affichent pas en ligne ».** En local, les vingt-trois vignettes se rendaient.
En production, zéro.

En production, chaque entrée de `producer_countries.brands` était une **chaîne**
contenant du JSON au lieu d'être un objet — avec l'espace après les deux-points
qui est la signature de MariaDB. Les dix-sept autres pays étaient intacts.

**La cause est ma migration `178`** : elle reconstruisait le tableau avec
`JSON_TABLE` puis `JSON_ARRAYAGG`. Sur **MySQL** — le poste de développement — la
colonne garde son type JSON à travers la table dérivée. Sur **MariaDB** —
o2switch — le type se perd et l'agrégat empile des chaînes.

**La migration passait toute la campagne en local et cassait la page en ligne.**
C'est une divergence que la campagne, par construction, ne verra jamais : je ne
peux pas éprouver MariaDB ici.

### La parade
**On n'écrit plus de JSON avec des fonctions JSON.** Le tableau est posé en toutes
lettres, comme une chaîne littérale — ce que faisaient toutes les migrations
antérieures, et ce qu'aucun moteur ne peut interpréter de travers.

Les migrations `173` et `175` employaient `JSON_ARRAY_APPEND` et
`JSON_MERGE_PRESERVE` ; vérification pays par pays dans le navigateur sur le site
en ligne : elles ont produit des objets corrects sur MariaDB. Seule la `178`
divergeait. Mais la règle vaut pour toutes.

### Le symptôme était trompeur
`brandCard()` fait `b.name.replace(...)`. Sur une entrée sans `name`, la
`TypeError` interrompt la construction du `innerHTML` — une seule concaténation,
du badge de rang jusqu'aux marques. Le panneau restait **entièrement blanc**.
`panels.js` filtre désormais les entrées sans nom : une liste de vingt-trois
vignettes ne doit pas pouvoir emporter les huit blocs qui la précèdent.

### Et un contrôle qui voit depuis le serveur
Comme pour les drapeaux de la `168`, aucun outil local ne pouvait attraper ceci :
la base de développement est juste. `tools/prevol.php` porte désormais un constat
**bloquant** sur les tableaux `brands` mal formés, avec une remédiation qui dit
quoi faire — réécrire en toutes lettres, sans fonction `JSON_*`.

---

## Les sept maisons mères (migration `180`)

**L'atlas portait une douzaine de marques sans jamais nommer qui les fait.**
Davidoff, Avo, The Griffin's, Camacho et Zino Platinum sont d'un même groupe
suisse ; Atabey, Byron et Bandolero d'un même homme ; Flor de Selva d'une maison
hondurienne fondée par une femme. Aucun de ces propriétaires n'avait de fiche.

C'est le même défaut que les huit colonnes muettes, mais à l'échelle d'une
entreprise : la donnée existait, elle n'était nommée nulle part.

| maison | ce que l'atlas portait déjà d'elle |
|---|---|
| **Oettinger Davidoff** (Suisse, 1875) | Davidoff, Avo, The Griffin's, Camacho, Zino Platinum |
| **Villiger Söhne** (Suisse, 1888) | Villiger |
| **Burger Söhne** (Suisse, 1864) | Dannemann |
| **Selected Tobacco** (Costa Rica, 2012) | Atabey, Byron, Bandolero |
| **Maya Selva Cigars** (Honduras, 1995) | Flor de Selva |
| **Boutique Blends** (Rép. dom., 2011) | — *(Aging Room, Swag)* |
| **Forged Cigar Company** (USA, 2021) | Cohiba USA, Punch Honduras, Bolívar Honduras… |

### Trois sont suisses, et la Suisse n'est pas productrice
Elles sont rattachées à `switzerland`, **pays d'adresses** de l'atlas. C'est le
chemin de code qu'a ouvert Le Fagot Cigar en Côte d'Ivoire — `page_marque()` joint
`lounge_countries` — et que la campagne éprouve depuis. `coherence_check` n'exige
d'annonce que pour les pays producteurs.

### La leçon de la 179 appliquée
Les quatre tableaux `producer_countries.brands` modifiés ici sont posés **entiers,
en littéral**. Aucune fonction `JSON_*` : c'est ce qui avait vidé la page de la
République dominicaine sur MariaDB.

### Forged n'est pas une manufacture, et sa fiche le dit
Société de **distribution**, créée le 13 janvier 2021 par Scandinavian Tobacco
Group. Sa fiche explique aussi pourquoi l'atlas ne porte **pas** de Sancho Panza
non cubain : le rebattage de février 2026 l'a retiré du tarif avec Los Statos
Deluxe.

### Trois superlatifs refusés
`marques_check` et `i18n_superlatif_check` ont refusé « troisième producteur
mondial » en allemand et en arabe, et « sa première boutique » en chinois — des
superlatifs que le français ne porte pas. Reformulés en ordinal, pas exceptés.

---

## Migration `181` — Les deux marques de J.C. Newman

**139 marques**, 18 pays producteurs, 844 assertions, 0 échec, huit contrôles
verts, 7 290 sceaux à jour.

L'atlas portait **J.C. Newman sans ses deux marques premium**. Diamond Crown
n'existait que sous la forme d'une ligne de trois phrases dans le champ `gamme`
de la maison mère ; **Cuesta-Rey n'existait nulle part**.

### La confusion ligne/marque, prise à l'envers
`docs/maisons-absentes.md` a identifié vingt-sept **lignes** que les index
prennent pour des maisons. Ici c'est l'inverse : deux **marques** de plein droit
réduites à des lignes.

| marque | ce qu'elle est |
|---|---|
| **Cuesta-Rey** (1884, Ybor City) | plus ancienne que la maison qui la possède ; rachetée par Stanford Newman en 1958, roulée chez Fuente depuis les années 1980 |
| **Diamond Crown** (1995) | la commande de Stanford Newman à Carlos Fuente Sr. pour le centenaire — une gamme entière au diamètre 54 quand le marché s'arrêtait à 52 |

### Pourquoi elles sont dominicaines et leur maison américaine
Le précédent est dans l'atlas et il est exact : **Ashton**. William Ashton Taylor
est de Philadelphie, sa marque est américaine, sa fiche est dominicaine parce que
ses cigares sortent de la Tabacalera A. Fuente. Diamond Crown et Cuesta-Rey sont
le même montage — marque américaine, tabac et main dominicains. Les trois fiches
se renvoient l'une à l'autre.

### La fiche de la maison mère corrigée dans la foulée
Son dernier paragraphe disait « plusieurs gammes fabriquées en République
dominicaine, dont Diamond Crown » et ignorait Cuesta-Rey. Il nomme désormais les
deux et dit pourquoi elles sont classées ailleurs, **dans les six langues**. Son
champ `gamme` perd l'entrée Diamond Crown, devenue doublon d'une fiche entière —
patron de la migration `180`, où les maisons mères nomment leurs marques en prose.

### Les six REPLACE sont vérifiés par la migration elle-même
Un `REPLACE` qui ne trouve pas son motif **ne dit rien et sort en succès** :
c'est ainsi qu'un REPLACE allemand avait silencieusement échoué au chantier des
jumelles. La migration finit donc par un `SELECT` qui doit rendre **six lignes à
1**. Elle les a rendues.

### Ce que la fiche n'énonce pas comme un fait
`jcnewman.com` attribue à Cuesta-Rey le titre de cigare officiel du roi
Alphonse XIII d'Espagne. Aucune source indépendante ne le confirme : la fiche
l'**attribue explicitement à la maison** — « c'est elle qui le dit » — plutôt que
de l'énoncer. Même traitement que les notes de presse sans `source_url`.

### Reste de la liste des maisons absentes
**67**, dont : les six canariennes (Dos Santos/La Regenta, Canaritos, El Sitio,
Kolumbus, Puros Artesanos Julio, Montealto), Nicoya en Australie, et la scène
boutique nicaraguayenne et dominicaine.

---

## Migration `182` — Les six maisons canariennes

**145 marques**, 18 pays producteurs, 850 assertions, 0 échec, huit contrôles
verts, 7 360 sceaux à jour. **Plus aucune maison canarienne ne manque.**

Les Canaries étaient le pays producteur le plus pauvre de l'atlas : deux fiches
pour un archipel qui **cultive et roule au même endroit** — ce que presque aucun
autre endroit d'Europe ne fait. Elles passent de deux à huit.

| maison | où | ce qu'elle apporte |
|---|---|---|
| **Dos Santos** | Las Palmas de Gran Canaria, 1921 | la seule qui ne soit pas de La Palma ; quatre générations, et des volumes qui disent ce qu'elle est vraiment |
| **Montealto** | Breña Alta, 1917/1918 | la plus ancienne fabrique encore en activité de l'archipel |
| **Finca Tabaquera El Sitio** | Breña Alta, 2005 | un champ avant d'être une marque : seule à cultiver sa cape sous bâches |
| **Puros Artesanos Julio** | Breña Alta, 2000 | la plantation est en face de l'atelier |
| **Kolumbus** | La Palma | longfiller intégralement palmero, vieilli en caves de cèdre |
| **Canaritos** | Güímar, Tenerife | l'autre modèle canarien : shortfiller, feuille importée |

### L'homonymie qui piégeait la fiche de pays
`tabacaleras` portait « Compañía Insular Tabacalera » comme s'il n'y en avait
qu'une. Il y en a **deux**, à quarante ans et une mer d'écart : celle de
Benjamín Menéndez (Gran Canaria, 1961, le Montecruz) et la **Compañía Insular de
Tabaco de La Palma** (Breña Alta, 1917/1918, le Montealto). La fiche Montealto
écrit la distinction en toutes lettres — même les répertoires d'entreprises
confondent les deux.

### Une colonne muette, et un fait manquant
`Vargas.founded` disait « La Palma, Îles Canaries » : **un lieu dans un champ de
date**, donc rien. C'est 1925, Santa Cruz de La Palma, Enrique Vargas de Paz et
son frère Felipe.

Et `notes` s'arrêtait à l'exil cubain de 1960, en taisant ce qui explique l'état
actuel de l'archipel : **le mildiou bleu a détruit les plantations de La Palma en
1967.** Il reste des ateliers ; il n'y a plus d'industrie. Les six fiches ne se
lisent pas sans cela.

### Trois garde-fous ont refusé le premier jet — aucun n'a été excepté
| contrôle | ce qu'il a vu | ce qui a été fait |
|---|---|---|
| `marques_check` | El Sitio citait « Cigar Journal » dans **douze colonnes**, sans `source_url` vers le classement | mention retirée |
| `coherence_check` | `regions` annonçait trois lieux sans zone derrière ; `varieties` annonçait « Breña » sans fiche | deux vraies zones créées (49, 50) ; Santa Cruz retirée (mêmes coordonnées que « La Palma ») ; Breña retirée — c'est le nom que Kolumbus donne à la feuille palmera, qui a déjà sa fiche |
| `i18n_superlatif_check` | deux traductions affirmaient un rang que le français ne porte pas | le chinois de Dos Santos et un « más que » espagnol chez Kolumbus, reformulés |

### La fiche Kolumbus dit ce qu'elle ne sait pas
Trois amis l'ont fondée ; la maison ne publie ni leur nom ni son année, et
l'atlas ne les invente pas — même traitement que la variété du tabac de Fagot.
En revanche elle porte un fait qu'aucune autre n'a : le règlement européen
**Track & Trace**, écrit contre le trafic de cigarettes et étendu au cigare,
chiffré par zigarren.zone à plus de soixante-dix mille francs suisses
d'investissement et **une année entière sans aucune exportation**. C'est le genre
de raison pour laquelle une scène disparaît sans que personne l'ait décidé.

### Reste de la liste des maisons absentes
**61**, dont Nicoya (Australie), la scène boutique nicaraguayenne et dominicaine,
et la tradition européenne (Pays-Bas, Belgique) — qui change la nature de
l'atlas et mérite d'être décidée, pas subie.

---

## Migrations `183` et `184` — Nicoya, et huit phrases coupées net

**146 marques**, 18 pays producteurs, 862 assertions, 0 échec, huit contrôles
verts.

### `183` — Nicoya : une recommandation de ce dépôt, infirmée

`docs/maisons-absentes.md` annonçait « **Australie — Nicoya Cigars — un
continent de plus** ». C'était **faux**, et la vérification l'établit sans
ambiguïté : la culture commerciale du tabac a cessé en Australie en **octobre
2006**, à Myrtleford, d'où venaient 95 % de la récolte nationale, et elle y est
**illégale** depuis.

Nicoya ne contient donc pas un gramme de tabac australien et ne peut pas en
contenir. C'est une marque australienne — Gerard Hayes, 2016, autofinancée —
roulée à Estelí chez **A.J. Fernández**, que l'atlas porte déjà. Sa fiche est
**nicaraguayenne**, comme Casdagli est costaricienne et Diamond Crown
dominicaine : l'atlas classe une marque par le lieu où le cigare est fait.

**La confusion valait pour quatre lignes, pas une.** Le tableau « ce qui
étendrait la carte » portait aussi Pays-Bas, Belgique et Allemagne comme des
pays à ouvrir — alors qu'ils sont **déjà** des pays d'adresses de l'atlas. La
vraie question n'était pas « faut-il ouvrir un pays ? » mais « **l'atlas
porte-t-il le cigare de machine ?** ». Le document est corrigé.

Le prix australien est écrit sur la fiche parce qu'il ne tient pas au cigare :
une pièce autour de 50 AUD, la boîte de vingt autour de 1 000. C'est l'accise
qui parle.

### `184` — Huit phrases coupées net, en ligne depuis des mois

**Trouvé en écrivant la fiche Nicoya.** Elle affichait « production au
Nicaragu ». La chaîne faisait 51 caractères, `brands.founded` est un
`varchar(50)`, et MySQL l'a tronquée **sans rien dire** — l'INSERT sort en
succès.

En vérifiant, **huit autres fiches** étaient dans le même état :

| marque | ce qu'on lisait | ce qui manquait |
|---|---|---|
| **Suerdieck** | « fermée en 2 » | **l'année de fermeture, 2000** |
| **Crowned Heads** | « (production au Nicarag » | la parenthèse n'était jamais fermée |
| **La Aurora** | « République Domi » | |
| **Juan Clemente** | « Rép. dominicain » | |
| **Bering** | « au Honduras dep » | depuis 1990 |
| **Warped** | « et en Florid » | |
| **The Griffin's** | « pour un club de Genève ou » | |
| **Meerapfel** | « cape du Cameroun, » | virgule en suspens |

**Pourquoi rien ne l'a vu.** La valeur est une chaîne valide. La fiche
s'affiche, le rendu est correct, les sceaux sont à jour, `i18n_fraicheur`
compte 100 %. L'anomalie n'est **que dans le sens**, et seulement pour qui lit
la phrase jusqu'au bout.

**Rien n'a été inventé** : chaque phrase se reconstitue depuis sa propre fiche.
Le cas de Suerdieck est le plus net — `founded` avait perdu l'année, mais
`factory` disait « usine fermée en 2000 ».

**Le contrôle qui l'aurait vu** est désormais dans `coherence_check` : un texte
libre dont la longueur tombe **pile** sur la capacité de sa colonne n'y tombe
pas par hasard. La largeur est lue dans `INFORMATION_SCHEMA` plutôt qu'écrite en
dur — la colonne peut être élargie un jour. Il couvre `brands.founded`,
`brands.factory`, `brands.name` et `lounges.name`.

Un faux positif reste possible : une phrase peut mesurer exactement cinquante
caractères. Le remède est alors d'un mot — reformuler.

*Note : le test « la mesure est en caractères, pas en octets » a d'abord échoué
sur une erreur d'arithmétique de ma part — j'avais compté 44 là où la base
disait 45. Le garde-fou a servi tout de suite, et contre moi.*

### Reste de la liste des maisons absentes
**60**, dont la scène boutique nicaraguayenne et dominicaine (une vingtaine de
fiches courtes), et la question éditoriale du cigare de machine européen.

---

## Migration `185` — La scène boutique nicaraguayenne, premier lot

**152 marques**, 18 pays producteurs, 862 assertions, 0 échec, huit contrôles
verts, 7 430 sceaux à jour.

| maison | qui | où elle fait rouler |
|---|---|---|
| **Dunbarton Tobacco & Trust** | Steve Saka, 2015, ex-président de Drew Estate | Joya de Nicaragua et NACSA |
| **RoMa Craft Tobac** | Rosales et Martin, 2012 | **son propre atelier**, NicaSueño |
| **Viaje** | Andre Farkas, 2008 | Aganorsa |
| **Room101** | Matt Booth, 2009 | A.J. Fernández, Joya, **et HATSA au Honduras** |
| **L'Atelier** | Pete Johnson, 2012 — le même que Tatuaje | My Father |
| **La Aroma de Cuba** | nom cubain des années 1880, refait en 2009 | My Father |

### Ce que le lot dit d'un seul coup
**Cinq de ces six maisons n'ont pas d'usine.** Elles composent et font rouler
ailleurs — chez quatre manufactures que l'atlas porte déjà. Avec Crowned Heads
et Warped, déjà présentes, le modèle n'est plus l'exception : c'est la règle de
la scène boutique. Et il brouille la lecture du drapeau, parce que le cigare
qu'on tient sort d'un atelier dont le nom ne figure nulle part sur la boîte.

RoMa Craft est l'exception, et son histoire dit pourquoi : les premiers
CroMagnon ont été roulés **dans le garage** de l'assembleur Esteban Disla en
2010 ; l'atelier NicaSueño a été bâti l'année suivante.

### Une production éclatée, écrite plutôt que tue
Room101 sort de **trois** manufactures, dans **deux** pays. La fiche est
nicaraguayenne parce que l'atlas classe par le lieu principal — et elle le dit,
au lieu de laisser croire à une origine unique.

### Winston Churchill, refusé une deuxième fois
Le matériel commercial de La Aroma de Cuba le compte parmi ses premiers
fumeurs, à l'époque cubaine — exactement comme celui de Vargas aux Canaries,
refusé à la migration `182`. La fiche le **rapporte à qui l'affirme** et ne le
reprend pas à son compte. Les notes de presse sont écartées de même, faute de
`source_url`, et « la seule marque boutique fabriquée exclusivement chez
A.J. Fernández » n'est pas repris : c'est un rang, pas un fait.

### Trois reprises, dont une qu'aucun outil ne pouvait voir
| ce qui a été vu | par qui | ce qui a été fait |
|---|---|---|
| « Green River Sucker One » entre guillemets, lu comme une parole prêtée | `marques_check` | c'est un nom de cultivar, mais le contrôle a raison sur la forme — guillemets retirés dans les six langues |
| quatre superlatifs chinois contre deux au français chez L'Atelier, et un « أكثر » arabe là où le français dit « plus direct » | `i18n_superlatif_check` | reformulés |
| **« des cinq autres de ce lot »** | *personne* | « ce lot » est le découpage du fichier de migration, pas une notion du site : le processus de travail avait fui dans le texte publié. Trouvé en relisant le rendu réel |

Ce troisième cas est le plus instructif : aucun contrôle ne peut voir qu'une
phrase est correcte, sourcée, traduite — et incompréhensible pour qui la lit.

### La leçon de la `184`, appliquée avant écriture
Les six `founded` ont été comptés **avant** insertion, et tiennent tous sous 49
caractères. `coherence_check` refuse désormais toute valeur qui tombe pile sur
la capacité de sa colonne.

### Reste de la liste des maisons absentes
**54**. Prochain lot possible au Nicaragua : Southern Draw (Robert et Sharon
Holt, **2014** — le recensement disait 2015), Padilla, HVC, Fratello,
Curivari, Black Label Trading. Puis la scène dominicaine : Aging Room,
Tabacalera La Palma, La Palina, Kristoff, Caldwell.

---

## Migration `186` — La scène boutique dominicaine

**158 marques**, 18 pays producteurs, 865 assertions, 0 échec, huit contrôles
verts, 7 490 sceaux à jour.

| maison | qui |
|---|---|
| **Tabacalera Palma** | la fabrique elle-même, 1936 — José Arnaldo Blanco II |
| **Aging Room** | Rafael Nodal, 2011, chez Jochy Blanco |
| **Swag** | l'autre marque de Boutique Blends |
| **Kristoff** | Glen Case, 2004 |
| **Caldwell Cigar Co.** | Robert Caldwell, 2014 |
| **Casa Cuevas** | la famille Cuevas, Tabacalera Las Lavas |

### Ce lot fait l'inverse du précédent
Le lot nicaraguayen (`185`) montrait des maisons **sans usine**. Celui-ci
**nomme trois fabriques** que l'atlas citait déjà sans jamais leur donner de
fiche : Tabacalera Palma, Tabacalera Las Lavas et Tabacalera von Eicken. Trois
adresses derrière une bonne partie du catalogue dominicain.

Tabacalera Palma reçoit sa propre fiche parce qu'elle est la plus ancienne des
trois — 1936 — et parce que **quatre marques de cet atlas en dépendent** :
Aging Room, Swag, la Matilde, et le Trinidad Santiago d'Altadis.

### Un nœud resserré
La migration `180` avait créé `Boutique Blends` en annonçant qu'elle portait
Aging Room et Swag. Les deux marques existent enfin, et le renvoi fonctionne
dans les deux sens. **Rafael Nodal apparaît désormais quatre fois** dans
l'atlas. Et **Oliveros**, que le recensement listait comme une maison absente,
n'en est pas une : c'est une étiquette de Boutique Blends.

### La Palina écartée délibérément
Le recensement la classait en République dominicaine. Elle se fabrique au
Honduras, au Nicaragua, en République dominicaine **et** à Miami chez El Titan
de Bronze. Aucun lieu principal ne se dégage, et lui en inventer un serait
refaire l'erreur de Nicoya (`183`). **Elle attend une décision, pas une
approximation.**

### La traduction avait fabriqué un classement qui n'existe pas
`marques_check` a vu « رقم 1 » dans l'arabe d'Aging Room et l'a lu comme une
note de presse. C'était **« Bin No. 1 »**, un nom de produit, que la traduction
avait rendu en chiffres arabes. Le nom reste désormais en caractères latins.

C'est un défaut de traduction d'un genre nouveau dans ce dépôt : le français ne
disait rien de faux, et la version arabe affirmait un rang.

`i18n_superlatif_check` a par ailleurs vu quatre rangs de trop, dont un
« die nächste » allemand — une forme en `-ste` lue comme un superlatif là où le
français dit « suivante ».

### Un écart trouvé en vérifiant, qui n'en était pas un
Le panneau dominicain annonce **Meerapfel**, dont la fiche est rattachée au
**Cameroun**. Ce n'est pas un défaut : le Cameroun est dans cet atlas un pays
**de feuille**, pas de roulage — ses quatre marques sont toutes roulées
ailleurs sous une cape camerounaise. Les deux rattachements sont vrais.

Mais rien ne protégeait `producer_countries.brands` d'une **faute de frappe**,
et ces tableaux sont écrits à la main depuis la migration `179` — parce que les
fonctions `JSON_*` divergent entre MySQL et MariaDB. Écrire à la main protège
du moteur, pas de la coquille.

`coherence_check` vérifie donc désormais que chaque nom annoncé correspond à une
fiche — **n'importe où**, pas forcément dans le même pays, sans quoi le modèle
camerounais casserait. Éprouvé en injectant « Casa Cuevaz » : le contrôle l'a
vu, et s'est tu une fois la faute retirée.

### Reste de la liste des maisons absentes
**48**. Au Nicaragua : Southern Draw, Padilla, HVC, Fratello, Curivari, Black
Label Trading. En République dominicaine, il ne reste que des cas particuliers —
La Palina à trancher, Nomad à vérifier, Gurkha (faite chez Las Lavas), Paul
Garmirian, Zino.

---

## Migration `187` — Aucun cigare de machine dans l'atlas

**155 marques** — trois de moins qu'à la migration précédente. 865 assertions,
0 échec, huit contrôles verts.

**Décision éditoriale du propriétaire de l'atlas, appliquée à l'existant.** La
règle était déjà écrite à moitié : `docs/maisons-absentes.md` excluait les
cigarillos du périmètre, et posait la question européenne en disant qu'elle
« mérite d'être décidée, pas subie ». Elle est décidée.

### Ce qui sort, sur la foi de son propre texte
| fiche | ce qu'elle disait d'elle-même |
|---|---|
| **Guantanamera** (Cuba) | « le seul havane dont l'argument principal est d'être fabriqué à la machine » |
| **Café Crème** (Indonésie) | « techniquement un cigarillo : un petit module de fabrication mécanique » |
| **Henri Wintermans** (Indonésie) | la maison du Café Crème ; sa gamme ne portait que lui |

Aucune n'a été jugée de l'extérieur : chacune se décrivait ainsi.

### Le produit sort, pas le récit
L'entrée `El Reloj` de la gamme de **J.C. Newman** est retirée — un cigare
produit par les machines des années 1930 de Tampa. **La fiche reste**, et son
histoire continue de raconter ces machines : c'est du patrimoine industriel, et
la maison est dans l'atlas pour Diamond Crown et Cuesta-Rey, roulés à la main
chez Fuente. Son champ `gamme` devient vide, comme celui des sept maisons mères
de la `180`.

### Ce que retirer casse — et le seul point de couture
La recherche des renvois, faite **avant** la suppression, a montré que les trois
marques ne se citaient qu'entre elles : aucune autre fiche, aucun établissement,
aucune feuille, aucun marché ne les nomme.

Sauf une phrase. **Taru Martani** se définissait par contraste : « la fiche
indonésienne ne comptait jusqu'ici que des marques néerlandaises ». Supprimer
sans réécrire aurait laissé un renvoi vers des fiches disparues. Réécrite dans
les six langues, avec le `SELECT` de contrôle des six `REPLACE` — six lignes à 1.

### Deux conséquences assumées
- **Cuba passe de 28 fiches à 27**, et le document dit *par choix* plutôt que de
  laisser croire à un oubli. Le portefeuille d'Habanos en compte 28.
- **L'Indonésie passe de trois fiches à une.** Il reste Taru Martani, qui
  « roule encore l'essentiel de sa production à la main ».

### La règle ferme aussi la question européenne
Pays-Bas, Belgique et Allemagne n'étaient candidats que par des maisons de
cigarillos. Les trois lignes sont closes dans le recensement.

### Le partage passe entre la main et la machine
Pas entre la feuille entière et le hachis. **Canaritos** roule à la main une
tripe de morceaux de feuille : elle reste, et sa fiche le dit. De même José L.
Piedra et Quintero à Cuba.

### ⚠ Ce qui reste à trancher : Dannemann
Sa fiche raconte cent cinquante ans à São Félix da Cachoeira et le terroir du
Recôncavo — mais sa `gamme` décrit trois cigarillos : « cigarillo brésilien sous
cape Bahia », « format mini, dix minutes, aromatisé vanille ou cerise », et une
ligne Premium en cigares pleine longueur. **Le Brésil ne compte que quatre
fiches** : la retirer est une décision de pays, pas de produit. Elle n'a pas été
prise ici.

### Les fiches ne sont pas perdues
Elles restent dans le `sql/contenu.sql` du commit précédent et dans l'historique
Git. Le journal de modération dit lesquelles et pourquoi — pour qu'on ne les
recrée pas par inadvertance.

---

## Migration `188` — La scène boutique, second lot

**161 marques**, 18 pays producteurs, 865 assertions, 0 échec, huit contrôles
verts, 7 500 sceaux à jour.

| maison | qui | où elle fait rouler |
|---|---|---|
| **Southern Draw** | Robert et Sharon Holt, 2014 | A.J. Fernández — **un seul atelier** |
| **HVC Cigars** | Reinier Lorenzo, 2011 | Aganorsa, puis **sa propre fabrique depuis 2021** |
| **Fratello** | Omar de Frias, ingénieur NASA, 2013 | Joya de Nicaragua |
| **Curivari** | Andreas Throuvalas, 2003 | Estelí — la maison ne nomme pas sa fabrique |
| **Black Label Trading Co.** | James et Angela Brown, 2013 | **Fábrica Oveja Negra, la sienne depuis 2015** |
| **Padilla** | Ernesto Padilla, 2003 | El Titan de Bronze, Miami — d'où `usa` |

### La règle de la `187` appliquée en amont, pas seulement en aval
**Les six ont été vérifiées roulées main avant d'être écrites.** Black Label
Trading déclare « 100 % handmade » ; HVC revendique les méthodes traditionnelles
à la main ; Curivari le procédé cubain et la triple coiffe. Aucune ne fait de
cigarillo. La règle « aucun cigare de machine » n'est pas seulement un filtre de
retrait — c'est d'abord un critère d'entrée.

### Padilla est américaine, pas nicaraguayenne
Le recensement la classait au Nicaragua. Son **Padilla Miami**, gamme
emblématique, est roulé à **El Titan de Bronze**, dans la Petite Havane —
l'atelier de Calle Ocho que l'atlas porte déjà sous `usa`. Le tabac est
nicaraguayen, cultivé par Aganorsa, mais **l'atlas classe par le lieu où le
cigare est fait** : règle de Casdagli, de Diamond Crown et de Nicoya.

D'autres gammes viennent de Raíces Cubanas au Honduras et d'A.J. Fernández au
Nicaragua. La fiche l'écrit, comme celle de Room101.

C'est la **troisième** fois que le recensement se trompe de pays — après Nicoya
et La Palina. Le motif est toujours le même : la nationalité du fondateur prise
pour le lieu de fabrication.

### Deux maisons ont fini par avoir des murs
La migration `185` montrait cinq maisons sur six **sans usine**. Celle-ci montre
la suite de l'histoire :

- **HVC** a passé dix ans chez Aganorsa avant d'ouvrir sa fabrique à Estelí en
  2021 ; partie très petite, elle produit aujourd'hui près d'un million de
  cigares par an.
- **Black Label Trading** a ouvert la Fábrica Oveja Negra en 2015, deux ans
  après ses débuts — une fabrique conçue pour ressembler à un atelier d'artiste.

**Le modèle sans usine n'est pas toujours un état définitif : c'est parfois une
étape.** Southern Draw est le cas inverse et mérite d'être noté — elle ne fait
rouler qu'à **un seul** endroit, quand Crowned Heads, Dunbarton et Room101 en
emploient chacune plusieurs.

### Une reprise
`i18n_superlatif_check` a vu un superlatif chinois de trop chez Curivari —
quatre contre trois au français. Reformulé.

### Reste de la liste des maisons absentes
**42**. Au Nicaragua il ne reste que la petite scène : La Barba, Protocol,
Regius, Cornelius & Anthony, 262, Emilio, Nick's Sticks, Viaje… Au Honduras,
neuf maisons entières n'ont pas encore été touchées : Asylum, CLE, Maya Selva,
Oscar Valladares, Micallef, Don Tomas, HPC, 777.

---

## Migration `189` — Qui fait quoi : Dannemann corrigée, La Palina tranchée

**162 marques**, 865 assertions, 0 échec, huit contrôles verts.

Deux demandes, et une **consigne durable** : nommer les collaborations entre
maisons et le rôle de chacune.

### 1. Dannemann : la réponse était en deux temps
La question posée était « à retirer si ce sont des cigarillos faits à la
machine ». **Le groupe fait les deux, mais pas au même endroit :**

| site | ce qu'il produit |
|---|---|
| **São Félix da Cachoeira, Bahia** | **longfiller roulé main**, par des *charuteiras* |
| Lübbecke, Allemagne | cigarillos, machine |
| Brissago et Reinach, Suisse | cigarillos et cigares de spécialité |

La fiche porte la maison brésilienne, celle du Recôncavo, qui roule à la main.
**Elle reste.** Ce qui sort, ce sont les **deux entrées de cigarillos** de son
champ `gamme` — Speciale et Pierrot, ce dernier « aromatisé vanille ou cerise ».
Il reste la Premium, réécrite pour dire ce qu'elle est. Même partage que chez
J.C. Newman à la `187` : le produit de machine sort, la maison reste.

### ⚠ Et une contradiction entre deux fiches de l'atlas
**Trouvée en vérifiant la chaîne de propriété — exactement ce que la consigne
demandait de faire.**

- `Dannemann` disait : « rachat par le groupe **Swisher International** »
- `Burger Söhne` disait : « en 1988, elle rachète **Dannemann GmbH** à Lübbecke »

C'est Burger Söhne qui a raison : `dannemann-group.com` déclare le groupe suisse
et familial. Swisher International est une société américaine étrangère à cette
chaîne — elle figure en revanche à juste titre sur la fiche **Bering**, qu'elle a
bien possédée.

**Aucun contrôle ne pouvait le voir** : deux affirmations vraies séparément,
fausses ensemble. Corrigé dans les six langues, avec le `SELECT` de contrôle des
six `REPLACE`.

### 2. La Palina : la recherche a donné mieux que la réponse attendue
Écartée délibérément à la `186`, faute de lieu principal. La recherche a tranché
et a livré la clé : **la maison se décrit elle-même comme un négociant**. Elle ne
possède aucune fabrique, mais elle possède son tabac, ses produits finis et ses
marques.

| gamme | qui la roule |
|---|---|
| **Goldie** (par **un seul** rouleur) et **Mr. Sam** | El Titan de Bronze, Miami |
| **Classic** | PDR Cigars, Rép. dominicaine |
| **El Diario**, **Maduro** | Raíces Cubanas, Honduras |
| **Nicaragua Oscuro** | A.J. Fernández, Nicaragua |
| **1896** | Graycliff, Bahamas |

**Trois de ces cinq partenaires ont déjà leur fiche dans cet atlas**, et la fiche
les nomme. `country_id` = `usa` : le Goldie et deux autres gammes sortent de
Miami — même raisonnement que Padilla à la `188`.

Le récit vaut d'être noté : Samuel Paley fonde la marque en 1896 et la baptise du
prénom de sa femme, **Goldie**. Son fils vend les cigares par la radio, prend en
1928 le contrôle du réseau qui diffusait l'émission, quitte le cigare et fait de
**CBS** ce qu'elle est devenue. Le petit-fils relance le nom en 2010 — et le
Goldie porte toujours le prénom de l'arrière-grand-mère.

### La consigne « qui fait quoi » entre au recensement
`docs/maisons-absentes.md` porte désormais une section dédiée, avec le tableau
des rôles pour les maisons récentes. Ce n'est pas un ornement : c'est en
vérifiant cette chaîne qu'on a trouvé la contradiction Dannemann.

### Une reprise
`i18n_superlatif_check` a vu un superlatif chinois de trop chez La Palina.
Reformulé.

---

## Migration `190` — Le cercle Eiroa, et deux ateliers d'Estelí

**166 marques**, 865 assertions, 0 échec, huit contrôles verts.

| maison | qui | où |
|---|---|---|
| **CLE Cigar Company** | Christian Eiroa, 2012 | Danlí, Honduras |
| **Asylum** | Tom Lazuka et Christian Eiroa, 2012 | NACSA, Estelí — **nicaragua** |
| **Oscar Valladares** | Oscar et Hector Valladares, Bayron Duarte, 2012 | Danlí, Honduras |
| **Micallef** | Al Micallef et la famille Gómez Sánchez, 2016 | fabrique 1934, Estelí — **nicaragua** |

**Quatre fiches et non six.** Don Tomas, HPC et 777 n'ont pas été assez
documentées pour être écrites. Mieux vaut quatre fiches sourcées que six dont
deux tiennent sur des pages de détaillants.

### La consigne « qui fait quoi » rend le plus sur ce lot
Les quatre maisons ne sont pas isolées : ce sont des **chaînes de personnes**, et
chaque maillon a déjà sa fiche dans cet atlas.

**Le cercle Eiroa, sur trois générations**
- **Generoso J. Eiroa** quitte l'Espagne pour Cuba ; ferme de tabac à Pinar del Río
- **Julio Eiroa** travaille avec Angel Oliva, fonde sa ferme dans la vallée de Jamastran — c'est lui d'**Aladino**, que l'atlas porte
- **Christian Eiroa** possède **Camacho** avec son père et la **vend à Davidoff en 2008** — Camacho et Oettinger Davidoff sont dans l'atlas, et c'est la même histoire vue des deux bouts ; il fonde CLE en juillet 2012 et Asylum avec Tom Lazuka

**La chaîne Micallef, sur trois générations aussi**
- **Pedro F. Gómez** roulait chez **H. Upmann**, à La Havane
- sa belle-fille travaillait chez **Partagás**
- ses petits-fils **Joel et Edel** tiennent la fabrique 1934 d'Estelí

**L'équipe Valladares, formée ailleurs**
- Oscar : neuf ans chez **Rocky Patel** · Bayron Duarte : vingt ans entre **General Cigar** et **Oliva**

### ⚠ Quatrième et cinquième erreur de pays du recensement
`docs/maisons-absentes.md` classait **Asylum et Micallef au Honduras**. Les deux
sont fausses. Asylum sort principalement de la NACSA à Estelí ; Micallef de la
fabrique 1934 d'Estelí, où le Honduras n'apparaît que dans la **tripe**.

Après Nicoya, La Palina et Padilla, cela fait **cinq**. Le motif ne varie pas :
la nationalité ou le domicile du fondateur pris pour le lieu de fabrication. Le
document porte désormais cet avertissement **en tête de sa méthode**, avec le
tableau des cinq cas.

Une date corrigée au passage : Oscar Valladares est de **2012**, pas 2013 —
comme Southern Draw était de 2014 et non 2015.

### Un cinéma devenu fabrique
La fabrique Aladino de Danlí, où se fait la part hondurienne d'Asylum, **était un
cinéma**, et il appartenait au grand-père de Christian Eiroa. Elle a par ailleurs
été l'une des premières installations tabacoles certifiées par Bayer CropScience.

### Une reprise
`i18n_superlatif_check` a vu un « أفضل » arabe chez Oscar Valladares là où le
français dit « se lit mieux ». Reformulé.

---

## Migration `191` — Quatre maisons, et les ateliers qui les portent

**170 marques**, 865 assertions, 0 échec, huit contrôles verts.

| maison | qui | où |
|---|---|---|
| **Ferio Tego** | Michael Herklots et Brendon Scott, 2021 | Quesada (Licey) et Plasencia (Estelí) — **dominican** |
| **Paul Garmirian** | 1990, Washington D.C. | O.K. Cigars, campus Tabadom — **dominican** |
| **Gurkha** | relancée par Kaizad Hansotia | sa propre usine d'Estelí depuis 2017 — **nicaragua** |
| **La Barba** | Tony Bellatto et Craig Rossi, 2013 | Tabacalera William Ventura — **dominican** |

### ⚠ Avant d'écrire : vérifier contre la base, pas contre le document
Le recensement annonçait **37 maisons absentes**. La base en disait **28**.

Six y figuraient encore alors qu'elles étaient faites — HVC, Fratello, Curivari,
Black Label Trading (`188`) et Selected Tobacco (`180`). Et **Zino n'est pas une
maison** : c'est une ligne d'Oettinger Davidoff, que sa propre fiche nomme déjà,
exactement comme Oliveros est une étiquette de Boutique Blends.

*Un document de travail vieillit plus vite que la base qu'il décrit. Il se relit
contre elle, jamais l'inverse.* Le document porte désormais cet avertissement.

### ⚠ Sixième et septième erreur de pays
- **Gurkha** était classée en République dominicaine. Elle a **racheté** sa
  fabrique — l'American Caribbean Cigars, à Estelí — en **mai 2017**. Las Lavas
  produit aussi pour elle, mais l'usine qui lui appartient est nicaraguayenne.
- **La Barba** était classée au Nicaragua. Elle a **quitté le Honduras** : son
  premier cigare sortait de la fabrique Aladino de Danlí, tout est passé depuis
  à la Tabacalera William Ventura.

Sept erreurs de pays au total, et le motif ne varie jamais.

### « Qui fait quoi » : six partenaires déjà dans l'atlas
- **Ferio Tego** est née de la fin de **Nat Sherman** : Altria a fermé sa
  division cigare en 2020 après quatre-vingt-dix ans, et deux anciens de la
  maison lui ont racheté les marques. **Quesada** fait le Metropolitan — qu'il
  avait composé pour Nat Sherman au milieu des années 1990 — et deux Timeless ;
  **Plasencia** fait les deux autres.
- **Paul Garmirian** est roulé chez **O.K. Cigars**, la fabrique du groupe
  Davidoff qui fait l'**Avo**, sur le campus **Tabadom** que l'atlas nomme déjà
  chez Davidoff et The Griffin's. Une maison d'auteur roulée chez un industriel.
- **La Barba** est passée d'**Aladino** — l'ancien cinéma de la famille Eiroa —
  à l'atelier des **Ventura**, celui où **Caldwell** fait composer ses
  assemblages.

### Un récit attribué, pas repris
Gurkha fait remonter son nom à **1887**, dans l'Inde britannique. Aucune source
indépendante ne l'établit : la fiche l'attribue à la maison, comme elle l'a fait
pour Alphonse XIII chez Cuesta-Rey et pour Churchill chez Vargas et La Aroma de
Cuba.

### Reste
**24 maisons**, et le compte est vérifié contre la base :

| pays | reste |
|---|---|
| Nicaragua — 6 | Protocol, Regius, Cornelius & Anthony, 262, Emilio, Nick's Sticks |
| Rép. dominicaine — 3 | Nomad, Arsen, Star Cigar |
| Honduras — 3 | Don Tomas, HPC, 777 |
| Costa Rica — 2 | Chaman, Vegas de Santiago |
| États-Unis — 2 | 7-20-4, Cuban Crafters |
| Mexique, Indonésie, Brésil — 4 | Windsor, Wolf & Eagles, Le Cèdre, Menendez Amerino |
| « sans pays fixe » — 4 | Dunhill, Siglo, Helix, El Rico Habano — **à requalifier** : ce sont probablement des lignes, comme Zino et Oliveros |

---

## Migrations `192` et `193` — le recensement est clos

**182 marques**, 872 assertions, 0 échec, huit contrôles verts.

Les vingt-quatre dernières maisons du recensement ont été traitées d'un bloc.
**Onze seulement sont devenues des fiches** — plus une douzième qui n'était pas
dans la liste.

| sort | combien |
|---|---|
| écrites | 11 (+ **De Los Reyes Cigars**, née d'une requalification) |
| requalifiées — ce ne sont pas des maisons | 7 |
| non écrites, faute de sources | 6 |

C'est le résultat principal, et il n'était pas prévisible : **plus d'un nom sur
deux ne méritait pas d'entrée.**

### `192` — Les commanditaires : sept marques, aucun atelier
Protocol, Regius, Cornelius & Anthony, 262 Cigars, Emilio Cigars, Nomad, 7-20-4.
Toutes sous `nicaragua`, et **aucune ne fabrique**. À elles seules elles nomment
**onze ateliers**, dont sept ont déjà leur fiche ici.

| maison | qui fait quoi |
|---|---|
| **Protocol** | deux policiers ; **La Zona** (Espinosa) avec Hector Alfonso Sr., puis **San Lotano** (A.J. Fernández) |
| **Regius** | maison londonienne ; **Plasencia**, Estelí |
| **Cornelius & Anthony** | **La Zona** pour l'essentiel, **El Titan de Bronze** à Miami pour la ligne Cornelius |
| **262 Cigars** | **Tabacalera Carreras** (Craig Cunningham) et **TacaNicsa** (Eradio Pichardo) |
| **Emilio Cigars** | **A.J. Fernández**, **My Father**, puis **Oveja Negra** (Black Label Trading) — trois fabriques, un seul nom sur la bague |
| **Nomad** | **Tabacalera L&V** (Rép. dom.), **A.J. Fernández** et **Oveja Negra** |
| **7-20-4** | **Tabacos de Oriente** (Néstor Plasencia, Honduras), puis **J. Fuego** à Estelí depuis juillet 2021 |

**Une maison qui fait aussi de la machine.** Cornelius & Anthony est une filiale
de **S&M Brands**, société familiale de Virginie qui fabrique des cigarettes et
de petits cigares de machine. Rien de cela n'entre ici : la fiche porte le seul
versant roulé main, et l'écrit — même partage qu'à la `187` chez J.C. Newman et
qu'à la `189` chez Dannemann.

### `193` — Ceux qui possèdent leur atelier
Cuban Crafters, Vegas de Santiago, De Los Reyes Cigars, Menendez Amerino,
Don Tomas. Le contrepoint exact du lot précédent : quatre possèdent leur
manufacture, et **deux cultivent en plus leur propre tabac**.

- **Vegas de Santiago** est la seule maison costaricienne qui cultive ce qu'elle
  roule — Santiago de Puriscal, plus de mille cent mètres, plus de quatre-vingts
  ans de plantations. Elle roule aussi des bagues de détaillants européens, dont
  **Zechbauer**, la maison de Munich.
- **De Los Reyes** tient les deux bouts : **Leo Reyes** cultive, **Nirka Reyes**
  dirige l'atelier — qui fait ses marques *et* roule **Debonaire**,
  **Fittipaldi** et **Patoro**.
- **Menendez Amerino** fabrique **Dona Flor**, qui a sa propre fiche ici. Même
  partage qu'entre Tabacalera Palma et Aging Room.
- **Don Tomas** avait été écartée à la `190` « faute de sources suffisantes ».
  La recherche menée pour ce lot en a trouvé : 1975, Danlí, créée par
  **U.S. Tobacco**, roulée chez **HATSA** sous **Estélo Padrón** — le même
  atelier et le même homme que la fiche Bolívar Honduras nommait déjà. Le refus
  de la `190` était une prudence, pas un verdict.

### Sept requalifications
| nom | ce qu'il est |
|---|---|
| **Chaman** | gamme de Vegas de Santiago |
| **Arsen** | marque de **De Los Reyes Cigars** — et cette requalification a fait *entrer* une vraie maison dans l'atlas |
| **Nick's Sticks** | gamme de **Perdomo**, déjà présente, mais écrite au singulier |
| **Dunhill** | licence de British American Tobacco, faite par General Cigar ; BAT a quitté le cigare mi-2018 |
| **Helix** | ligne de General Cigar, retirée du tarif en octobre 2024 |
| **El Rico Habano** | marque d'El Crédito, 1970, Miami ; retirée en octobre 2024 |
| **Siglo** | la série de vitoles du Cohiba cubain — la fiche existe déjà |

### Six non écrites, et le document dit pourquoi
**Star Cigar** (notice promotionnelle sans fabrique ni date), **HPC** (un récit
de marque, aucun fondateur, aucune fabrique nommée), **777**, **Windsor**,
**Wolf & Eagles** (rien), **Le Cèdre** — il existe bien une marque brésilienne
voisine, *Le Cigar*, mais ce n'est pas le même nom, et l'atlas n'écrit pas une
fiche sur une ressemblance.

### Trois erreurs de pays de plus — dix au total
**Nomad** était donnée pour dominicaine : elle a commencé ainsi, mais l'essentiel
de ses seize assemblages sort du Nicaragua depuis 2013. **7-20-4** était donnée
pour américaine : le nom est une adresse de Manchester, mais rien n'a jamais été
fabriqué dans le New Hampshire. **Cuban Crafters** était donnée pour américaine :
le magasin est à Miami, la fabrique est à Estelí. Toujours le même motif.

### Ce que la relecture a corrigé dans des fiches existantes
- **Dona Flor** se disait faite « années 1990, à Cruz das Almas ». C'est **1982**,
  et la fabrique est à **São Gonçalo dos Campos** : un **lieu de culture pris
  pour un lieu de fabrication**. Trouvé en écrivant la fiche de la fabrique —
  exactement comme la contradiction Dannemann à la `189`.
- **Bolívar Honduras** a été retirée du tarif par Scandinavian Tobacco Group en
  **octobre 2024**, avec El Rico Habano et Helix. La fiche le dit maintenant dans
  les six langues. Le renseignement est venu d'un nom qu'on n'a *pas* écrit.
- **Trois `founded` commençaient par un tiret orphelin** — « — Rép. dominicaine
  (Altadis USA) » : l'année attendue devant manquait, et le tiret est resté seul.
  H. Upmann Dominicain, Henry Clay, Saint Luis Rey Honduras.
- **Kolumbus** portait un lieu dans son champ de date, l'erreur déjà corrigée
  chez Vargas à la `182`.

### Un contrôle de plus
`coherence_check` refuse désormais un `founded` qui **commence par un
séparateur**. La règle est volontairement étroite : elle **ne refuse pas un
champ sans année**. Une quinzaine de fiches n'en ont pas et le *disent* —
Kolumbus : « Année non publiée — La Palma, Canaries » —, parce que la maison ne
la publie pas et que l'atlas ne l'invente pas. Ce qu'on refuse, c'est la forme
mutilée, pas l'absence assumée. Sept assertions l'éprouvent, dont le piège
multioctet : `« — »` fait trois octets, et un contrôle écrit avec `$v[0]`
aurait laissé passer les trois fiches.

### Trois reprises demandées par les garde-fous
- `marques_check` a lu « intégralement artisanal » entre guillemets comme une
  **parole prêtée** chez Menendez Amerino. Les guillemets sautent, la phrase
  reste attribuée.
- `i18n_superlatif_check` a trouvé six superlatifs absents du français. Chez
  **Regius**, le superlatif était **dans la source** — « la ligne que le marché
  britannique connaît *le mieux* » — et il avait essaimé en allemand, chinois et
  arabe : c'est la source qui a été réécrite, pas seulement les traductions.
- Deux écarts arabes restants sont des **homographes** : dans « trois mois en
  chambre de cèdre », le mot lu comme un superlatif signifie *mois*. Figés au
  cliquet, avec la raison écrite.

### Une tension signalée, non corrigée
La fiche **Casdagli** dit que le Costa Rica est un « pays sans terroir tabacole
notable ». **Vegas de Santiago** y cultive son propre tabac depuis plus de
quatre-vingts ans. La nouvelle fiche pose explicitement les deux — le pays des
maisons sans terroir, et l'exception qui cultive — plutôt que de réécrire
Casdagli, dont la phrase reste vraie au sens où le tabac costaricien n'est pas
une référence internationale. **À relire si une troisième fiche costaricienne
arrive.**

### Reste
**Rien.** `docs/maisons-absentes.md` est clos et ne propose plus de liste.

---

## Migration `194` — Black Swan : quatre maisons pour un nom qui n'est à aucune

**182 marques** (aucune ajoutée), 872 assertions, 0 échec, neuf contrôles verts.

Vérification demandée : **Black Swan n'était pas dans l'atlas — et n'y entrera
pas sous forme de fiche.** Le nom appartient à **CigarPage**, un détaillant
américain, qui en a fait une **série dont chaque édition est confiée à une
manufacture différente** et bâtie sur un lot de tabac particulier trouvé chez
elle.

| édition | maison | pays | assemblage |
|---|---|---|---|
| 1 — 2023 | **Oliva** | Nicaragua | cape Connecticut Broadleaf, sous-cape équatorienne, tripe nicaraguayenne |
| 2 — janvier 2024 | **Rocky Patel** | Honduras | cape corojo, sous-cape hondurienne, tripe hondurienne et nicaraguayenne |
| 3 | **E.P. Carrillo** | Rép. dominicaine | — |
| 4 — 2025 | **Joya de Nicaragua** | Nicaragua | cape criollo d'Équateur de semence cubaine, sous-cape habano nicaraguayenne, tripe longue de Jalapa et d'Estelí |

**Les quatre avaient déjà leur fiche.** Chacune dit désormais ce qu'*elle* a
fait et renvoie aux trois autres — c'est la consigne « qui fait quoi » appliquée
à un cas où le nom sur la bague et la main qui roule ne sont pas de la même
maison.

### Ce que ce cas a corrigé dans la règle elle-même
`docs/maisons-absentes.md` mettait hors périmètre les **exclusivités de
détaillants** — 5 Vegas, 898 Collection, Morro Castle — en les qualifiant de
« marques de catalogue **sans maison derrière** ». Black Swan est une
exclusivité de détaillant **et** a quatre maisons derrière elle.

**Le critère n'était donc pas le bon.** Ce n'est pas l'exclusivité qui exclut,
c'est le **fabricant tu**. La règle est réécrite en ce sens.

### Pas de fiche, et pas non plus dans le champ `gamme`
La distinction compte : `gamme` porte le catalogue **propre** d'une maison. Le
Black Swan est une **commande**, en quantité limitée, vendue par un seul
détaillant — l'y ranger dirait que la maison le propose, ce qui est faux. Il va
en prose, là où l'atlas écrit déjà qui fait quoi pour qui.

C'est exactement la différence avec l'**Orchant Seleccion** de Regius
(migration `192`), qui *est* au `gamme` : celui-là est une bague de détaillant
posée sur un cigare que la maison fait par ailleurs sous son propre nom.

### Rocky Patel est fichée `nicaragua`, et son Black Swan est hondurien
Ce n'est pas une contradiction : son champ `factory` porte déjà « Toraño
International, Danlí, Honduras + Estelí, Nicaragua ». Le paragraphe le rappelle,
parce qu'**un pays de fiche désigne l'essentiel de la production, pas sa
totalité** — nuance que les dix erreurs de pays du recensement rendaient
nécessaire d'écrire noir sur blanc.

### Ce que ces paragraphes refusent d'écrire
Le détaillant **note ses propres cigares** et qualifie la série de rareté
extrême. Rien de tout cela n'entre : ce sont des arguments de vente, pas des
sources — même règle que pour les scores de presse sans `source_url`. Seuls les
faits vérifiables sont repris : qui fabrique, où, avec quoi, et quand.

**Tripe longue et roulé main vérifiés avant écriture** (règle `187`).

---

## Migration `195` — `brands.source` : la discipline devient lisible

**182 marques**, 881 assertions, 0 échec, dix contrôles verts.

### Le manque
`lounges` porte une colonne `source` depuis toujours, et **508 fiches sur 508**
en remplissent une. `brands` **n'avait pas de colonne du tout**. La doctrine du
projet — « aucune fiche sans source » — était donc vérifiable pour les caves et
**invisible pour les maisons**, alors que les maisons sont ce que l'atlas écrit
le plus : moins de fiches, mais des textes dix fois plus longs.

### Ce qui est rempli, et ce qui ne l'est pas
| | sourcées | sans source |
|---|---|---|
| **caves** | 508 / 508 | 0 |
| **maisons** | **77 / 182** | **105** |

**Aucune source n'est inventée.** Les soixante-dix-sept sont reprises des
**en-têtes des migrations** qui ont écrit ces fiches — `171`, `173`, `174`,
`176`, `180` à `194` —, où elles étaient déjà consignées **en commentaire, hors
de portée du lecteur**. Cette migration ne fait que les déplacer du commentaire
vers la base.

**Les cent cinq autres restent à `NULL`, et c'est le point.** Leur source n'a
jamais été enregistrée. En fabriquer une pour faire propre serait exactement la
faute que `tools/sources.php` a été écrit pour attraper — vingt-huit domaines
cités qui n'existaient pas, par soixante-quinze fiches. **Une source absente est
honnête ; une source inventée donne l'apparence de la vérification.**

Le trou est donc **un chiffre, pas un silence** : `tools/sources.php` l'affiche
table par table à chaque exécution.

### Les cinquante-deux nouveaux domaines résolvent tous
`tools/sources.php --verifier` a passé au DNS les cinquante-deux domaines
qu'apporte cette migration. **Aucun n'est inexistant** — c'est ce qui autorisait
à les figer au sceau, qui compte désormais 194 domaines.

### Deux précisions que le champ écrit lui-même
- **Oliva, Rocky Patel, E.P. Carrillo et Joya de Nicaragua** ne reçoivent une
  source **que pour leur paragraphe Black Swan** (migration `194`). Le reste de
  leur fiche est antérieur et sans source enregistrée : le champ le dit mot pour
  mot, plutôt que de laisser croire que la citation couvre la fiche entière.
- **Fonseca** est *la* fiche où une source périmée a produit une erreur — la
  `173` l'a donnée pour dominicaine sur la foi d'une liste Wikipédia qui n'avait
  pas suivi le rachat de décembre 2019, et la `175` l'a corrigée. Son champ
  `source` raconte les deux.

### Ce que le champ n'est pas
Ce n'est pas un `source_url` : c'est du **texte libre**, comme chez `lounges`.
Il porte des domaines, des titres d'articles, parfois une mention non
électronique. `tools/sources.php` en extrait les domaines et vérifie qu'ils
résolvent — **il mesure la traçabilité, pas la véracité**.

Le préfixe « à vérifier » y garde le sens qu'il a chez les caves : ce n'est pas
une source, c'est son absence déclarée, et la page rend une **réserve traduite**
au lieu de la citation française.

### Le rendu
`page.php` sert le bloc sur la fiche de maison comme sur la fiche de cave —
citation rendue telle quelle, libellé traduit, et **rien du tout** quand la
colonne est vide. Ce sont **deux branches distinctes** du fichier : un correctif
appliqué à l'une ne suit pas l'autre, d'où huit assertions qui rejouent les
trois mêmes cas sur la fiche de marque, contre-épreuve comprise.

### Reste
Les **105 maisons sans source**. Les remplir demande de retrouver, fiche par
fiche, d'où venait un texte écrit avant que la colonne existe — c'est un
chantier de relecture, pas une migration.

---

## Migration `196` — les vingt-sept cubaines, et une fiche qui se contredisait

**182 marques**, 895 assertions, 0 échec, neuf contrôles verts.
**Sources : 104 / 182** (78 restantes, contre 105 avant ce lot).

Premier lot du chantier ouvert par la `195`. Les vingt-sept fiches cubaines sont
le groupe le plus net : elles ont toutes une **page officielle chez leur
propriétaire**.

### La vérification a précédé la citation
Le portefeuille annoncé sur `habanos.com` a été relevé **avant** de citer quoi
que ce soit. Les vingt-six marques de la page « Marcas » plus **Quintero**
(portefeuille volume, avec José L. Piedra et Vegueros) font exactement les
vingt-sept fiches cubaines de l'atlas — aucune ne manque d'un côté ni de
l'autre.

### Et elle a trouvé une contradiction interne
**Bolívar** portait « 1901 — La Havane » dans son champ `founded` et
**« Fondée en 1902 »** dans la première phrase de **son propre texte**.
`habanos.com` tranche : *« The Bolívar brand was created in 1902. »*

**Aucun contrôle ne pouvait le voir** : une date dans un champ et une date dans
une phrase sont deux chaînes valides, et rien ne les comparait. Le contrôle de
troncature mesure une longueur, celui du tiret orphelin une première lettre — ni
l'un ni l'autre ne *lit* la valeur. Même famille que la contradiction Dannemann
de la `189`, sauf qu'ici **les deux affirmations étaient dans la même fiche**.

### Une date gardée avec sa variance
**Fonseca** : l'atlas dit 1892. `habanos.com` **ne donne pas d'année** et écrit
« in the last decade of the 19th century » ; Wikipédia donne 1892, d'autres
sources 1891. Les trois sont compatibles, et la fiche elle-même dit « depuis la
fin du XIXe siècle ». On garde 1892 **et** on écrit la variance dans le champ
`source` — c'est précisément à cela qu'il sert.

### Un contrôle de plus, et trois façons de le rater
`coherence_check` compare désormais l'année du champ `founded` à celle que le
texte donne en toutes lettres. Le chemin pour y arriver vaut d'être écrit :

1. **La première sonde était vide sans le dire.** Le motif enchaînait « en » et
   l'année *sans séparateur* : il ne cherchait que « en1902 », ne trouvait jamais
   rien, et rendait **zéro écart sur une base qui en portait un**. Le sondage qui
   devait mesurer l'ampleur du défaut n'avait rien mesuré du tout. Un contrôle
   vide se lit exactement comme un contrôle vert.
2. **La deuxième était trop large.** Elle signalait dix fiches, dont **neuf faux
   positifs**. Le plus parlant : Vegas Robaina, « né en 1919 » — c'est la
   naissance d'**Alejandro Robaina**, pas la création de la marque. « Lancée en »
   et « ouverte en » sont tombées pour le même motif : elles datent une gamme ou
   un atelier. Il ne reste que *fondée en* et *créée en*.
3. **Une expression régulière ne sait pas QUI est fondé dans une phrase.**
   Quatre fiches datent la fondation de quelqu'un d'autre que la maison dont
   elles parlent — la HATSA de Frank Llaneza chez El Rey del Mundo Honduras, par
   exemple. Elles sont **nommées avec leur raison**, comme les fuseaux assumés
   plus haut dans le même fichier. Et un garde-fou inverse signale toute
   exception qui **cesse de servir** : sans lui, elle couvrirait un jour un vrai
   défaut sur la même fiche.

Douze assertions éprouvent la sonde sans base, dont la contre-épreuve de la
version cassée.

### Reste
**78 maisons sans source** : 17 nicaraguayennes, 13 dominicaines, 12
honduriennes, 8 américaines, et le reste par petits groupes.

---

## Migration `197` — les dix-sept nicaraguayennes : une maison fermée, une fiche qui ne savait rien

**182 marques**, 895 assertions, 0 échec, neuf contrôles verts.
**Sources : 121 / 182** (61 restantes).

Deuxième lot du chantier ouvert par la `195`. Comme pour les cubaines à la `196`,
**la vérification a rendu plus que des citations.**

### Mombacho a fermé, et l'atlas la décrivait au présent
Le **9 juin 2023**, Cameron Heaps, fondateur de Mombacho, et Jared Michaeli,
président de Favilli, ont annoncé la **fermeture définitive** de la maison et
leur retrait du métier. Claudio Sgroi, président et maître assembleur, était
parti en 2021 ; la demeure achetée en 2014 avait été convertie en lieu d'accueil
de luxe, et la marque n'a pas retrouvé son marché.

La fiche de l'atlas, elle, disait — **au présent, depuis trois ans** — « la
maison roule là où passent les voyageurs, dans une demeure ancienne ouverte aux
visiteurs ». Et le tableau du pays annonçait « l'atelier ouvert aux visiteurs ».

Même défaut que Bolívar Honduras à la `193` : **une fiche juste le jour où elle a
été écrite, fausse depuis, et qui n'a pas changé de forme en changeant de
valeur.** Corrigée dans les six langues, plus le champ `founded` et la
description du pays.

### Capitol : la fiche disait ne rien savoir, et elle avait raison de le dire
Elle déclarait explicitement ignorer l'année, l'atelier et les gammes, et
laissait ses rubriques vides **en expliquant pourquoi**. C'était la bonne
décision au moment où elle a été prise. La recherche menée pour ce lot a rendu
ce qui manquait — et c'est un cas de collaboration exemplaire :

| qui | quoi |
|---|---|
| **Rafael Nodal** | compose — celui d'Aging Room et de Boutique Blends, qui dirige aussi le produit chez Altadis USA |
| **Plasencia** | fabrique, à Estelí, chez Nestor Plasencia |
| **Tabacalera** | possède et distribue |

Les deux premiers ont déjà leur fiche ici. Trois vitoles font tout le catalogue —
Jack, Casino, Gala — et le thème des années 1920 vient du goût de Nodal pour le
jazz, et pour Duke Ellington en particulier. **L'année de lancement reste non
établie, et le champ le dit** — comme chez Kolumbus et Vegas de Santiago.

### Une date posée, une variance écrite
- **A.J. Fernandez** portait « années 2000 — Estelí ». C'est **2003**, la
  fondation de la Tabacalera Fernández **avec six rouleurs**. Le texte de la
  fiche ne porte aucune année : rien ne se contredit.
- **Warped** : l'atlas dit 2007 ; Cigar Aficionado, dans son entretien avec Kyle
  Gellis, écrit qu'il a lancé Warped **en 2009**, encore étudiant. On garde 2007
  et le champ `source` porte l'écart — même traitement que Fonseca à la `196`.

### Le sceau des sources
Quatre domaines nouveaux — `blindmanspuff.com`, `foundationcigarcompany.com`,
`perdomocigars.com`, `plasenciacigars.com` — **tous résolvent**. Le sceau en
compte 198.

### Reste
**61 maisons sans source** : 13 dominicaines, 12 honduriennes, 8 américaines,
5 mexicaines, et le reste par groupes de un à quatre.

---

## Migration `198` — les treize dominicaines, et l'homme qui tient cinq fiches

**182 marques**, 895 assertions, 0 échec, neuf contrôles verts.
**Sources : 134 / 182** (48 restantes).

### Le fil José Seijas
Embauché par Consolidated Cigar en 1974, à vingt-quatre ans, il a dirigé la
**Tabacalera de García** de La Romana comme maître assembleur puis
vice-président. Il a composé ou supervisé :

**Montecristo dominicain · Romeo y Julieta dominicain · VegaFina ·
H. Upmann dominicain · Don Diego**

**Cinq fiches de cet atlas, plus la sienne.** C'est lui qui, dans les années
1980, a fait passer La Romana de la machine au roulage à la main. Il a quitté la
manufacture début 2012 et fondé **Matilde** en 2013 avec ses fils Ricardo et
Enrique, en reprenant le nom d'une fabrique de Santiago de 1876.

**Il est mort en novembre 2024, à soixante-quatorze ans. La fiche Matilde ne le
disait pas.** Elle le dit maintenant, dans les six langues — comme celle de
Cuban Crafters dit la mort de Don Kiki Berger.

### Une date qui mélangeait deux lieux
**Don Diego** portait « années 1960 — La Romana ». Les deux moitiés sont vraies
séparément et **fausses ensemble** : la marque est créée **en 1964 aux
Canaries** — par l'exilé cubain Pepe García, en réponse à l'embargo — et sa
production ne passe à **La Romana qu'en 1982**. Le texte de la fiche le disait
déjà correctement ; c'est le champ de date qui mélangeait. Même faute que Dona
Flor à la `193`.

Et les Canaries sont un pays producteur de cet atlas : ce n'est pas un détail
exotique, c'est un lien.

### Deux dates précisées
- **PDR Cigars** : « années 2000 » → **2004**, à Tamboril. La marque s'appelait
  **Pinar del Río** — hommage à la région cubaine — avant d'être rebaptisée
  **PDR** pour *Puros Dominican Republic*. Le changement de nom dit le changement
  de revendication.
- **VegaFina** : « années 1990 » → **1998**, année que la maison commémore
  elle-même avec sa ligne « VegaFina 1998 ».

### Ce qu'on ne touche pas
**Montecristo dominicain** et **Romeo y Julieta dominicain** portent « depuis
1960 — La Romana ». C'est imprécis, et **aucune source consultable** ne permet de
dater proprement le passage de chaque nom à La Romana. On laisse en l'état
plutôt que d'inventer une précision, et le champ `source` porte la réserve.

### ⚠ Le contrôle des sources m'a pris en défaut
J'avais cité **`quesadacigars.com`** pour la fiche Quesada.
`tools/sources.php --verifier` l'a passé au DNS : **le domaine n'existe pas.**

C'est exactement la faute que cet outil a été écrit pour attraper — vingt-huit
domaines morts cités par soixante-quinze fiches, à l'époque. **Une source qui ne
résout pas est pire qu'une source absente : elle donne l'apparence de la
vérification.** Ligne réécrite sur `en.wikipedia.org`, `cigaraficionado.com` et
`procigar.org`.

Les cinq autres domaines nouveaux résolvent ; le sceau en compte 203.

### Reste
**48 maisons sans source** : 12 honduriennes, 8 américaines, 5 mexicaines, 4
camerounaises, 4 costariciennes, et le reste par groupes de un à trois.

---

## Migration `199` — les douze honduriennes : deux dates sans année, deux réserves écrites

**182 marques**, 895 assertions, 0 échec, neuf contrôles verts.
**Sources : 146 / 182** (36 restantes).

### Deux champs de date qui ne portaient qu'un lieu
**Baccarat** disait « Danlí, Honduras » et **La Flor de Copán** « Santa Rosa de
Copán, Honduras ». Un lieu à la place d'une date — l'erreur corrigée chez Vargas
à la `182` et chez Kolumbus à la `193`.

**Le contrôle ajouté à la `193` ne les voyait pas, et c'est voulu** : il refuse
un champ qui *commence par un séparateur*, pas un champ *sans année*, parce
qu'une quinzaine de fiches n'ont pas d'année et le **disent**. Celles-ci ne le
disaient pas : elles mettaient un lieu à la place. C'est une troisième forme du
même défaut, et elle échappe encore à toute règle automatique.

| | avant | après |
|---|---|---|
| **Baccarat** | Danlí, Honduras | 1871 revendiqué ; relancé en 1978 |
| **La Flor de Copán** | Santa Rosa de Copán, Honduras | 1975 — Santa Rosa de Copán, Honduras |

### Le fil Eiroa, encore
**Baccarat était fait par Julio Eiroa**, père de Christian — celui d'**Aladino**,
de **CLE** et d'**Asylum**, trois fiches de cet atlas. Davidoff a racheté la
marque en 2008 avec **Camacho**, et elle sort aujourd'hui de la fabrique Camacho
de Rancho Jamastran, à Danlí. **Quatre fiches se touchent sur cette ligne.**

Et **La Flor de Copán** a un fondateur : **Jorge Bueso Arias**, qui a rapporté de
Cuba la semence plantée à Yarguera. La manufacture naît en 1975 de *Tabacos
Hondureños*, société de culture fondée une dizaine d'années plus tôt.

### Deux réserves écrites, non tranchées
- **Bering** : le champ `factory` dit « Danlí (Plasencia) ». Les sources disent
  que Swisher, après avoir racheté Corral-Wodiska en 1985, a d'abord fait rouler
  **sous contrat** à partir de 1990, puis **bâti sa propre fabrique** à Danlí au
  milieu des années 1990. L'attribution à Plasencia daterait de la période du
  contrat. Aucune source consultée ne la confirme ni ne la dément pour
  aujourd'hui : **le champ reste, et la réserve est écrite.**
- **Excalibur** : le champ dit 1983 ; les sources donnent la ligne comme née chez
  Hoyo **dans les années 1970**, et devenue marque distincte **en 1992** selon
  d'autres. Trois dates, aucune qui s'impose — l'écart est écrit.

⚠ Ces mêmes sources rappellent que le **Bering de 1905 était un cigare de
machine** à tripe longue. Celui d'aujourd'hui, hondurien, est roulé main : c'est
lui que porte l'atlas, la règle `187` est respectée. La fiche gagnerait à écrire
cette bascule un jour ; ce lot ne fait que la consigner.

### ⚠ Deuxième domaine mort en deux lots
J'avais cité **`mayaselva.com`** pour Flor de Selva. Le DNS dit qu'il **n'existe
pas** ; le domaine de la maison est `mayaselvacigars.com`. Après
`quesadacigars.com` à la `198`, cela fait **deux domaines inventés en deux
lots** — et deux fois c'est le contrôle qui les a vus, pas moi. Le sceau compte
maintenant 213 domaines, tous vérifiés.

### Reste
**36 maisons sans source** : 8 américaines, 5 mexicaines, 4 camerounaises,
4 costariciennes, 3 équatoriennes, 3 philippines, et le reste par un ou deux.

---

## Migration `200` — le chantier des sources est clos

**182 marques**, 897 assertions, 0 échec, neuf contrôles verts.

| | sourcées | sans source |
|---|---|---|
| **caves** | 508 / 508 | 0 |
| **maisons** | **182 / 182** | **0** |

**230 domaines cités, aucun mort.** Pour la première fois, la doctrine « aucune
fiche sans source » est vérifiable **des deux côtés** de l'atlas — et un cliquet
de campagne l'y maintient : une marque ajoutée sans source fait désormais
échouer les tests, avec sa contre-épreuve.

### Une deuxième fiche qui se contredisait
**Tabacalera** portait « 1782 — Manille » dans son champ `founded`, alors que le
texte de **sa propre fiche** dit « En 1881, la Couronne espagnole dissout la Real
Compañía de Filipinas ». 1782 est l'année du **monopole royal**, pas celle de la
maison — fondée à Barcelone le 26 novembre 1881 par le marquis de Comillas.

C'est la deuxième après Bolívar, et **la deuxième fois que la sonde des dates
contradictoires passe à côté** : elle ne lit que « fondée en » et « créée en »,
et cette fiche écrit « la Couronne dissout ». La sonde reste étroite — c'est ce
qui la rend fiable — mais son angle mort est maintenant documenté deux fois.

### Une date qui avait glissé d'une fiche à sa voisine
**Temple Hall** disait « L'usine n'a pas survécu à 1988 ». **Faux**, et l'erreur
vient d'une confusion entre les **deux histoires jamaïcaines** :

| | ce qui s'est passé |
|---|---|
| **Royal Jamaica** | l'ouragan Gilbert détruit en 1988 la fabrique de Gore à Kingston et mille acres à May Pen |
| **Temple Hall** | la fabrique a tenu **douze ans de plus** : General Cigar l'a fermée en **2000** et a transféré la production en République dominicaine |

Deux fiches voisines, deux fins différentes, et la date de l'une avait glissé sur
l'autre. Corrigé dans les six langues.

### Le fil Menéndez — troisième occurrence du même genre
**Montecruz** est l'œuvre de **Benjamin Menéndez**, fils d'Alonso — la famille
qui faisait Montecristo et H. Upmann à Cuba. Il ouvre la Compañía Insular
Tabacalera à Las Palmas en **1961** et y fait un cigare qui copie assumément le
Montecristo, jusqu'aux épées croisées.

L'atlas porte déjà **Menendez Amerino** au Brésil et **Montecristo** à Cuba :
**trois fiches, trois pays, une même famille chassée de La Havane.** Après le fil
Seijas (`198`) et le fil Eiroa (`199`), c'est le troisième réseau que ce chantier
met au jour — et aucun n'était visible avant qu'on cherche les sources.

Et l'arrêt **Menendez v. Faber, Coe and Gregg (1972)** a établi le droit des
fabricants exilés à commercialiser leurs versions des marques qu'ils faisaient à
Cuba : c'est le **fondement juridique** de toute une moitié de cet atlas — les
homonymes non cubains de la migration `173`.

### Deux domaines morts, attrapés AVANT écriture
`casaturrent.com` et `nuevamatacapan.com` ne résolvent pas. Cette fois ils sont
passés au DNS **avant** d'être cités, et non après — après deux lots où le
contrôle avait dû me rattraper (`quesadacigars.com` à la `198`,
`mayaselva.com` à la `199`).

### Quatre réserves écrites, huit fiches de cape
| fiche | réserve |
|---|---|
| **Suerdieck** | les sources datent la fin des activités de **décembre 1999** ; le champ dit 2000 |
| **Carlos Toraño Panama** | aucune source ne date l'installation au Chiriquí ; le champ retient 2001 sans confirmation. Carlos Toraño est mort en février 2022 |
| **Santa Clara 1830** | 1830 est **revendiqué**, l'atlas ne l'adopte pas |
| **Toscano** | l'orage d'août 1815 est une **légende**, et les sources officielles la nomment ainsi |

Et **huit fiches ne décrivent pas une maison mais une cape** — Arturo Fuente
Maduro et Hemingway, CAO Cameroon et Black, Oliva Serie G et Connecticut
Reserve, Ashton Cabinet, Perdomo Ecuador. Leur source le dit en toutes lettres,
pour qu'on ne les lise pas comme des manufactures locales.

### Ce que le chantier a produit en tout
Cinq lots, `195` à `200`. Au-delà des sources :

- **deux fiches qui se contredisaient** sur leur propre date (Bolívar, Tabacalera) ;
- **une erreur de fait** (Temple Hall, 1988 au lieu de 2000) ;
- **deux maisons fermées** que l'atlas décrivait au présent (Mombacho, Temple Hall) ;
- **un décès** absent d'une fiche (José Seijas, Matilde) ;
- **une fiche qui disait ne rien savoir** et qui sait maintenant (Capitol) ;
- **six dates imprécises** posées (A.J. Fernandez, PDR, VegaFina, Baccarat, La Flor de Copán, Casa Turrent) ;
- **une date qui mélangeait deux lieux** (Don Diego) ;
- **trois lieux dans un champ de date** corrigés, et deux absences enfin déclarées ;
- **trois réseaux de personnes** mis au jour — Seijas, Eiroa, Menéndez ;
- **trois domaines morts** trouvés, dont deux par le contrôle et un par prudence ;
- **un contrôle de plus** et **vingt-et-une assertions** nouvelles.

### Reste
**Rien, de ce chantier.** Le point faible de l'atlas reste ce qu'il était : les
**7 975 traductions au statut `machine`, dont aucune n'a été relue par un
humain**.

---

## Migration `201` — une migration inutile, et pourquoi je l'ai écrite

**⚠ Cette section a été réécrite : la version d'origine affirmait un défaut qui
n'existait pas.**

### Ce que j'ai cru voir
Après le déploiement des migrations `194` à `200`, deux fiches — **Menendez
Amerino** et **Vegas de Santiago** — paraissaient servies sans leur source. J'en
ai conclu à une migration qui n'aurait pas pris entièrement, et j'ai écrit la
`201` pour réparer.

### Ce qui était vrai
**Rien de cela.** Les deux sondes lancées sur la base servie l'ont montré sans
ambiguïté :

| sonde | ce qu'elle a dit |
|---|---|
| `SELECT acteur_nom, COUNT(*) FROM moderation_log …` | les migrations `195` à `201` y sont **toutes**, et complètes |
| `SELECT name, HEX(name), CHAR_LENGTH(source) …` | `4D656E…6F` — **aucun caractère invisible** ; sources de **156** et **202** caractères |

**Les sources étaient en base depuis la `195`.** La `201` n'a rien réparé : elle
a réécrit deux valeurs identiques.

### La vraie cause
Le serveur répond **`Cache-Control: public, max-age=300`**. Mes vérifications par
le Web, lancées dans les minutes suivant la migration, ont lu des pages **rendues
avant elle** — contenu d'avant, en-têtes d'aujourd'hui, aucun indice visible.
Refaites en cassant le cache, les mêmes requêtes rendent **179 fiches sur 179**
avec leur bloc source.

### Ce que j'ai mal fait
1. **Conclure à un défaut de données sur la foi de pages Web**, sans vérifier que
   je lisais l'état courant.
2. **Écrire la migration corrective avant d'avoir la mesure** qui l'aurait rendue
   inutile — alors que les deux sondes qui tranchent tiennent en deux lignes, et
   que je les ai rédigées *après*.
3. **Consigner au journal une hypothèse non vérifiée.** Le journal doit porter ce
   qui est mesuré, pas ce qui est supposé. La migration `202` l'y rectifie.

### Ce qui reste, et qui est bon
Le contrôle ajouté à **`tools/prevol.php`** — le compte des fiches servies sans
source, marques et établissements. Il lit **la base servie**, sur le serveur, et
il est donc **insensible au cache HTTP qui m'a trompé**. Six cas d'autotest
l'éprouvent. C'est la seule chose utile que cet épisode a produite, et elle reste.

`docs/deploiement.md` porte désormais **le quatrième geste** — lancer
`prevol.php` sur le serveur après chaque déploiement — et l'avertissement sur le
cache de cinq minutes, avec la sonde `moderation_log` qui dit quelles migrations
ont réellement tourné.

---

## Migration `202` — la rectification au journal

Aucune donnée changée. Trois affirmations fausses de la `201` sont corrigées dans
`moderation_log`, avec la vraie cause et la liste de ce que j'ai mal fait. Le
journal de modération est la trace d'audit de cet atlas : y laisser une hypothèse
démentie vaut moins que rien.

**Vérifié en production, cache cassé : 179 fiches annoncées, 179 avec leur
source, aucune en échec.**

---

## Migration `203` — de quoi savoir si quelqu'un vient

**917 assertions, 0 échec.** `audience --autotest` : 0 échec.

### Le constat qui a ouvert ce chantier
**Le site n'avait aucune mesure.** Ni Google Analytics, ni Plausible, ni Matomo,
ni compteur maison. « Je n'ai pas encore d'audience » n'était donc pas un
constat, mais **une absence de constat** : trois cents visiteurs par mois arrivés
par la recherche auraient été invisibles.

### Pourquoi pas Google Analytics
Le portique d'âge de ce site porte ce commentaire, et il fait doctrine :

> « il ne pose pas de cookie. Le choix vit dans localStorage [...] et pas une
> ligne de plus dans une bannière de consentement »

Poser GA4, c'est un cookie, donc une bannière, donc **un obstacle de plus entre
un visiteur et une fiche — sur un site qui n'a pas encore de visiteurs**. Et
c'est confier à un tiers la seule chose qu'on cherche à savoir.

### Ce qui est enregistré, et ce qui ne l'est pas
| enregistré | pas enregistré |
|---|---|
| date, type de page, chemin, langue | **aucune adresse IP** |
| **domaine** référent (`google.com`) | jamais l'URL de recherche, qui porte la requête tapée |
| drapeau robot | aucun user-agent complet, aucun cookie |

**L'empreinte mérite son paragraphe.** Pour compter des *visiteurs* et non des
pages, il faut distinguer deux lectures sans identifier personne. On stocke douze
caractères de `SHA256(sel_du_jour + ip + ua)`, où le sel dérive d'`ADMIN_KEY` et
de la date :

- **irréversible** — l'IP n'est pas retrouvable ;
- **non corrélable** — le sel change à minuit, donc personne n'est suivi d'un
  jour sur l'autre ;
- **inutile volée** — sans `ADMIN_KEY`, la table ne dit rien.

Sans `ADMIN_KEY`, aucune empreinte n'est fabriquée : mieux vaut compter des pages
sans pouvoir compter des personnes qu'une empreinte prévisible.

### Trois décisions qui font mentir un rapport, et leurs contre-épreuves
1. **Le référent.** Une URL de résultats porte la requête tapée — un nom, une
   adresse, une maladie. On ne garde que l'hôte.
2. **Les robots.** Un site neuf reçoit surtout des explorateurs ; les mêler aux
   lecteurs donnerait une courbe flatteuse et fausse. Ils sont **séparés, pas
   supprimés** — et trois vrais navigateurs servent de contre-épreuve, parce
   qu'une règle trop gourmande les classerait en robots et le rapport ne
   montrerait plus personne.
3. **La 404 n'est pas une visite.** La mesure est posée *après* la résolution :
   vérifié en direct, sept requêtes dont une introuvable donnent huit vues et
   zéro pour la 404.

### Ce que cette mesure ne verra pas, et le dit
Le `.htaccess` pose une heure de cache sur le HTML, l'hébergeur répond
`max-age=300`. **Une page servie depuis un cache n'atteint pas PHP.** Les
chiffres sont un **plancher** — et `tools/audience.php` le répète à chaque
exécution. C'est le même cache qui m'avait fait croire à un défaut de sources à
la `201` ; cette fois il est nommé dans l'outil plutôt que découvert après coup.

Sur l'accueil, la mesure est posée **avant** la branche de cache-fichier
d'`index.php` — sinon la page la plus visitée aurait été comptée une fois par
heure et non une fois par visiteur.

### Search Console
`VERIF_GOOGLE` et `VERIF_BING` dans le `.env` posent les balises de vérification.
Vides par défaut, aucune balise n'est rendue. Le jeton n'est pas un secret, mais
il change de compte en compte et n'a rien à faire dans le code.

### Ce que le garde-fou du dépôt a attrapé
`contenu_dump.php` a refusé de tourner tant que la table `audience` n'était ni
versée ni exclue **avec une raison écrite**. Elle est exclue : cette mesure
appartient au serveur qui l'a recueillie, et verser des empreintes de visiteurs
dans un dépôt Git — même irréversibles, même expirées à minuit — n'a aucun sens.

---

## `vignettes.php` — l'image qu'on voit AVANT de cliquer

**929 assertions, 0 échec.**

### Le constat, et il est pire que ce que j'annonçais
Je vous avais dit que « les 738 pages partagent une seule vignette ». **C'était
faux, et dans le mauvais sens** : elles déclaraient toutes `og:image` vers
`/og-image.jpg`, **un fichier qui n'existe pas** — ni dans le dépôt, ni sur le
serveur, où il répond **404**.

Autrement dit, depuis le premier jour, **chaque lien de ce site partagé sur
WhatsApp, LinkedIn, X ou Slack affichait une carte sans image**. Et rien ne
pouvait le signaler : *une balise qui pointe dans le vide est une balise
parfaitement valide.*

### Ce qui existait déjà, et que je n'avais pas regardé
`tools/placeholders.php` fabrique depuis longtemps une **carte par
établissement** — fond presque noir, cigare dessiné, nom, ville, pays, signature.
475 existent, dont une vraie photographie (la façade du lounge d'Abidjan). Elles
étaient là, servies nulle part dans les aperçus.

### Ce que j'ai ajouté
`tools/vignettes.php` **réemploie le dessin de `placeholders.php`** — même
palette, même police, même cigare — au format des réseaux, **1200 × 630** :

| | combien |
|---|---|
| `uploads/og/defaut.jpg` | le repli |
| `uploads/og/marque-<slug>.jpg` | 182 |
| `uploads/og/pays-<id>.jpg` | 95 |

Les établissements gardent leur carte existante — **on ne la refait pas, et
surtout on ne l'écrase pas** : l'une d'elles est une vraie photo.

### La règle qui sort du défaut
**On ne déclare une image que si le fichier existe.** `page_vignette()` prend une
liste de candidats et rend le premier présent sur le disque, ou `null` — et
l'appelant n'écrit alors **aucune balise**. Une carte sans visuel vaut mieux
qu'une carte cassée.

Cela compte double ici : **`uploads/` est exclu du déploiement**, donc une carte
engendrée sur le poste de développement n'existera jamais en production tant que
l'outil n'y aura pas tourné.

### Et le gabarit ne fige plus rien
`index.html` portait les deux balises en dur. **C'est ce qui rendait le défaut
inguérissable** : une balise figée dans le gabarit est une balise qu'on ne peut
pas taire. Elles en sont retirées ; `index.php` les *ajoute* désormais, ou pas.

Un cliquet de la campagne interdit le retour de `/og-image.jpg` en dur dans les
deux points d'entrée — et il m'a repris une fois pendant ce chantier.

### Reprise — la carte de pays se répétait

La première version portait « Cuba » en titre **et** « C U B A » en bas. Le
dessin vient des **établissements**, où la ligne du haut est le nom du lieu et
celle du bas le pays ; pour un pays, les deux sont la même chose. Un doublon sur
la seule image que verra celui qui n'a pas encore cliqué.

Les deux lignes portent désormais ce que l'atlas **sait** du pays :

| | avant | après |
|---|---|---|
| sous-titre | *(vide)* | `27 maisons · 9 caves` |
| ligne du bas | `C U B A` | `PAYS PRODUCTEUR` / `CAVES ET LOUNGES` |

Deux cartes de pays ne se ressemblent plus, et chacune dit quelque chose.

**Le singulier n'est pas une coquetterie** : « 1 maisons » sur une carte de
partage se voit longtemps, parce que les réseaux mettent ces images en cache et
qu'un déploiement ne les corrige pas. Cinq assertions le tiennent, plus deux qui
vérifient que la garde de `ph_ville()` — celle qui efface un sous-titre répétant
le nom — empêche le doublon de revenir.

`--pays` refait les 95 cartes de pays sans toucher aux 182 cartes de maisons.

---

## Onglet Audience dans l'administration

**942 assertions, 0 échec.**

Lire le rapport demandait une session SSH. Un chiffre qu'on ne peut pas regarder
sans ouvrir un terminal est un chiffre qu'on ne regarde pas — et c'est
l'habitude qui compte, pas le tableau.

### Une seule implémentation des comptes
Les fonctions de lecture — `audience_resume()`, `audience_classement()`,
`audience_jours()`, `audience_prete()` — vivent dans `backend/audience.php` et
servent **à la fois** l'outil en ligne de commande et l'onglet.

**Aucun des deux ne contient de requête sur `audience`**, et trois assertions
l'interdisent. C'est la règle que ce dépôt applique déjà au portique d'âge et à
la fabrique d'adresses : *deux fabriques finissent toujours par diverger*. Ici,
la divergence donnerait deux chiffres différents pour la même question, sans
qu'on sache lequel croire — pire que pas de mesure.

### Réservé à l'administration
`audience` rejoint `PORTEE_ADMIN_SEULEMENT`. **Un modérateur juge des
contributions ; il n'a pas à savoir combien de monde vient ni par quel chemin.**
Le menu masque l'onglet, et la garde le refuse — le menu n'est pas une serrure.

### La page dit ce qu'elle ne mesure pas
L'outil en ligne de commande répète à chaque exécution que les chiffres sont un
plancher à cause du cache. L'onglet le répète aussi, en évidence sous les
compteurs. **Un tableau de bord qui affiche un nombre sans sa réserve est pire
qu'un terminal qui l'écrit** : on finit par croire le nombre.

Et le zéro est nommé : « aucune vue enregistrée » s'accompagne des deux raisons
possibles, parce qu'un zéro muet se lit comme une panne de l'outil.

### Ce qu'on ne montre jamais
Les empreintes. Des agrégats, uniquement — ces douze caractères ne servent qu'à
compter, les afficher changerait la nature de ce qu'on stocke.

---

## Les langues que les moteurs explorent

**947 assertions, 0 échec.** `audience --autotest` : 0 échec.

Le premier rapport à sept jours ne pouvait pas répondre à la question qui
commande la suite. Le classement `langues` **ne compte que les lecteurs** — les
robots en sont exclus, comme partout ailleurs dans cette mesure, et c'est juste :
les mêler donnerait une courbe flatteuse et fausse. Mais sur un site sans
audience, les lecteurs sont trop peu pour dire quoi que ce soit. **Sur 339 vues à
sept jours, 16 visiteurs et un seul jour actif ; 92 passages de robots.**

Or la question qui décide de la surface linguistique n'est pas « dans quelle
langue lisent les gens » : c'est **quelles langues les moteurs explorent**. C'est
elle qui dira si les six versions sont indexées, et donc si les **7 975
traductions automatiques jamais relues** sont un actif ou un risque à l'échelle.

La colonne `lang` était enregistrée pour les robots depuis la migration 203. Il
ne manquait que la vue pour la lire : ``'langues_robots' => ["`lang`", 1]``, une
ligne dans la liste fermée de `audience_classement()`.

### Deux tableaux de langues, et c'est voulu
| Tableau | Population | Ce qu'il répond |
| --- | --- | --- |
| Langues des lecteurs | robots exclus | qui lit quoi — muet tant qu'il n'y a personne |
| Langues que les explorateurs ont lues | robots seuls | quelles versions sont indexées |

Les deux portent des titres distincts, dans le terminal comme dans l'onglet :
« Langues » affiché deux fois ferait **trancher la surface linguistique sur le
mauvais chiffre**. Deux assertions tiennent la séparation — l'une vérifie que la
nouvelle vue ne montre que les robots, l'autre que l'ancienne continue de les
exclure.

L'onglet ajoute sous chaque tableau ce que sa population signifie ; le terminal
donne des pourcentages et signale explicitement le cas « plusieurs langues
explorées », qui est celui qui change la décision.

```bash
php ~/public_html/tools/audience.php --jours 7 --robots
```

---

## Les dettes nommées — et ce qu'elles cachaient

**947 assertions, 0 échec.** Tous les contrôles verts, `sources` re-figé à 231
domaines, `contenu.sql` régénéré. Migration **204**.

La feuille de route portait cinq petites dettes : quatre réserves écrites dans
des champs `source` et une tension entre deux fiches du Costa Rica. **Deux
n'étaient pas des réserves mais des symptômes.**

### Ce qui se lève sans rien changer
**Bering.** La réserve disait qu'aucune source ne confirmait l'attribution
« (Plasencia) ». Or `jaimemontilla.com`, **déjà citée par la fiche**, écrit qu'en
2002 Swisher a vendu *la marque et l'usine* à Nestor Plasencia — et le corps de
la fiche le disait aussi, en toutes lettres. J'avais écrit une réserve contre un
fait que mes deux propres textes portaient. Défaut de lecture, pas manque de
source.

**Suerdieck.** « Décembre 1999 » et « 2000 » ne se contredisent pas : l'activité
cesse fin 1999, la dernière usine de Cruz das Almas ferme en 2000 avec cent
licenciements. Deux moments, pas deux versions.

### Excalibur — une histoire entièrement fausse
La fiche attribuait la marque à **Villiger Söhne**, à **Hendrik Kelner** et aux
plantations **Eiroa**, puis sa revente à **Altadis**. C'est une confusion de
noms : *Villiger* (le suisse) pour **Villazon** (le tampeño de Frank Llaneza).
Rien ne relie Kelner ni les Eiroa à cette marque, et l'acheteur de 1997 est
**General Cigar**, pour 81,4 M$.

Et la même invention vivait dans `celebrities`, où une anecdote prêtait une
attitude à **Heinrich Villiger**, personne réelle et nommée. Réécrire
l'historique sans nettoyer ce champ aurait laissé la fiche se contredire un écran
plus bas.

Ce que disent les sources : Excalibur naît d'un **empêchement de marque**, pas
d'une idée de style — Villazon ne pouvait pas utiliser le nom Hoyo de Monterrey
hors des États-Unis. *« Comme nous ne pouvons pas utiliser Hoyo de Monterrey,
nous avons développé une marque appelée Excalibur, que nous vendons en Allemagne
et en Angleterre »*, Dan Blumenthal, alors président de Villazon.

La date de 1983 n'avait **aucune source**. Elle passe à 1981 (*Cigar
Aficionado*, mai 2021 : la ligne « turns 40 this year »), et la fiche **écrit
désormais la divergence** — 1970s / 1981 / 1992 — au lieu de trancher en
silence. La fabrique passe de « Manufactura de Puros Jamastran S.A. », que rien
n'établit, à la **HATSA de Danlí**.

### Le Panama était inventé de bout en bout
La réserve ne portait que sur une date. La vérification a montré qu'**aucune
source n'établit qu'un cigare Toraño ait jamais été fabriqué au Panama**, ni
qu'un tabac de Chiriquí soit entré dans un de leurs assemblages. Le « 2001 » du
champ datait le lancement de la ligne *Exodus 1959*, pas une installation.

En retirant la fiche, `habanos_presence` s'est trouvée porter la même invention,
**avec des chiffres** : un PDG (« Carlos Toraño (pionnier) »), un chiffre
d'affaires (« ~$12M USD »), un effectif (« 500+ »), une fabrique à Volcán fondée
en 2001, et « La Palina Panama » — maison réelle, mais pas panaméenne. **Un
chiffre inventé est pire qu'un champ vide : il se cite.** Tout cela est NULL ou
documenté désormais.

| Avant | Après |
| --- | --- |
| Carlos Toraño Panama, « pionnier du cigare panaméen premium » | fiche supprimée |
| Terroir à Boquete, 1 200–1 800 m, employé dans l'Exodus 1959 | rien — aucune source |
| ~$12M USD, 500+ employés, PDG Carlos Toraño | NULL |
| « Production artisanale croissance » | « Artisanale, très réduite » |

Ce qui est documenté prend la place : mars 1981, **Gilberto Oliva et Nestor
Plasencia** portent des semences cubaines à Coclé ; la Coclé Tobacco Factory
ouvre à Peñonomé la même année, Tabacos Panamá S.A. à La Pintada en 1984, et
**Miriam Padilla** fonde **Joyas de Panamá** en février 1986. Industrie
largement effondrée depuis — un reportage de 2025 trouve les ateliers à l'arrêt.

**Aucune fiche de maison n'est écrite en remplacement**, et le pays ne l'annonce
pas non plus dans `brands` : le contrôle 7 de `coherence_check` refuse à juste
titre un nom qui ouvre une carte sur rien. Mes sources sur Joyas de Panamá sont
un site touristique et une notice de guide ; en écrire une fiche complète
répéterait exactement la faute corrigée ici. **Le Panama est donc le premier pays
de cet atlas sans aucune maison** — un état honnête, pas un accident.

### Costa Rica — la tension tranchée par un fait, pas par un arbitrage
La fiche Casdagli disait le Costa Rica « sans terroir tabacole notable » ; la
fiche Vegas de Santiago décrit, dans le même pays, une maison qui cultive son
tabac à plus de 1 100 m depuis plus de quatre-vingts ans.

**Les deux maisons sont au même endroit.** Casdagli écrit elle-même que sa
coopération « avec Tabacos de Costa Rica S.A., *alors connue sous le nom de Vegas
Santiago*, a commencé en 2012 », et que Villa Casdagli est faite là sous la
conduite du maître assembleur **Olman Guzmán**. Zechbauer, de son côté, présente
**Olman León Guzmán** comme le chef de la fabrique Vegas de Santiago et dit le
tabac cultivé sur ces pentes depuis plus de 80 ans. Même lieu, même homme, même
altitude.

La phrase à corriger n'était donc pas une nuance : **elle niait l'existence du
terroir à l'endroit exact où la maison fait rouler ses cigares.** Ce qui survit
de l'idée de départ est dit autrement — la *feuille* de Casdagli vient d'ailleurs
(Pérou, Nicaragua, Équateur, Rép. dominicaine, cape et sous-cape équatoriennes).

Le champ `factory` nommait « Tabacalera Aragón », introuvable dans les sources de
la maison. Ce sont **IGM, à San José** (Daughters of the Wind, Cypher 3311) et
**Tabacos de Costa Rica, à Puriscal** (Villa Casdagli). Et la fiche porte
désormais sa date : fondée en **1997** sous le nom de *Bespoke Cigars*, rebaptisée
au **printemps 2018**.

### Deux garde-fous ont fait leur travail, et un a été étendu
`coherence_check` a refusé la ligne orpheline de `traductions.sql` et la carte
Panama qui n'aurait ouvert sur rien. `i18n_fraicheur` a exigé les sceaux du pays
et de `habanos_presence`. `i18n_superlatif_check` a refusé un « der sein
liebster » allemand que le français ne portait pas.

`marques_check` refusait les trois citations nouvelles. L'exemption est passée
par `AFFIRMATIONS_HISTORIQUES`, **nommée fiche par fiche et motivée** — parce que
`CITATIONS_SOURCEES` est indexée par `$qui`, qui vaut toujours « récit » dans un
historique : y déclarer « récit » aurait exempté les 181 fiches d'un coup. Ce
qu'on autorise est précisément ce que la règle cherche : une parole **attribuée**,
tirée d'une source nommée dans le champ `source`. La citation flottante reste
refusée.

### Et une fuite trouvée en passant
`moderation_log.detail` est un `varchar(255)` **qui tronque en silence** : les
quatre entrées de la 202 et les quatre de la 203 font toutes *exactement* 255
caractères — coupées en pleine phrase sans qu'un mot le signale. J'y suis tombé
au premier essai de la 204, huit entrées sur onze. Le contrôle en fin de
migration refuse désormais de passer si une entrée atteint la limite.

### Ce qui reste tiède au Panama
`production_zones` annonce **Boquete — « microclimat d'altitude »**. Boquete est
bien dans le Chiriquí, sur les pentes du Volcán Barú, et les fiches de feuilles
(`panama-habano`, `panama-corojo`) sont correctement sourcées sur Chiriquí et
Sortova. Mais **aucune source ne nomme Boquete comme zone tabacole** : à trancher
si une source le permet un jour.

---

## « Je ne retrouve pas la marque Saga » — et la recherche ne trouvait rien

**964 assertions, 0 échec.** Tous les contrôles verts, `sources` re-figé à 234
domaines. Migration **205** et correction du code de recherche.

Un lecteur a signalé deux choses : il ne retrouvait pas Saga, *celle qui produit
le Blend N°7*, et le Panama n'avait plus de maison. La première a ouvert un
défaut bien plus large que le signalement.

### Mesuré dans le navigateur : aucune maison n'était trouvable

| Frappe | Avant | Après |
| --- | --- | --- |
| `saga` | *(rien)* | De Los Reyes Cigars — **Saga ·** 🇩🇴 |
| `blend no. 7` | *(rien)* | De Los Reyes Cigars — **Saga Blend No. 7 ·** 🇩🇴 |
| `padron` | *(rien)* | Padrón 🇳🇮 |
| `davidoff` | *(rien)* | Davidoff 🇩🇴 |
| `arsen` | *(rien)* | De Los Reyes Cigars — **Arsen ·** 🇩🇴 |
| `abidjan` | *(rien)* | les trois établissements d'Abidjan |

Pas seulement Saga : **aucune des 181 maisons, aucun des 408 établissements
vérifiés.** Seuls les pays sortaient. **Trois causes**, toutes dans
`assets/js/search.js` :

1. **L'index n'avait rien à lire.** `BRANDS_DB` et `LOUNGES` sont déclarés à
   `{}` par `data.amorce.js`, et le chargement paresseux ne les remplit **qu'au
   clic, une fiche à la fois**. La recherche indexait deux objets vides.
2. **`[object Object]`, dix fois.** Les mots-clés d'un pays faisaient
   `concat(c.brands).join(' ')` sur un tableau d'**objets**
   `{name, desc, iconic}`. Le repli qui aurait pu sauver la recherche de marque
   — la trouver par son pays — ne fonctionnait pas non plus.
3. **Aucun repli d'accents.** `padron` ne trouvait pas `Padrón`. Sur un atlas
   dont la moitié des noms portent un accent espagnol, c'est disqualifiant.

### Ce qui répare
Une action dédiée, `data.php?action=recherche`, qui ne rend **que des noms** —
181 maisons avec leur pays et leurs gammes, 408 établissements avec leur ville :
62 Ko brut, demandés **à la première ouverture de la boîte**, pas au chargement
de la page. L'amorce reste légère, ce qui était toute la raison de
`data.amorce.js`.

Les **noms de gamme entrent dans l'index**, et c'est ce qui rattrape un modèle
entier de cet atlas : le recensement a délibérément replié **vingt-sept lignes**
prises pour des maisons dans la fiche de leur fabrique — Saga et Arsen chez De
Los Reyes, Chaman chez Vegas de Santiago, Zino chez Oettinger Davidoff, Oliveros
chez Boutique Blends. Ce sont exactement les noms qu'un lecteur tape, et
**aucun n'était trouvable** : le travail de rattachement était fait en base et
défait à l'écran.

Et quand la correspondance vient d'une gamme, le résultat **le dit** :
« Saga · 🇩🇴 Rép. Dominicaine ». Taper « Saga » et voir « De Los Reyes Cigars »
sans un mot d'explication se lit comme une erreur de la recherche.

### Saga Blend No. 7
La fiche écrivait « Golden Age, **Blend**, Short Tales ». La série s'appelle
**Blend No. 7**, et c'est sous ce nom qu'on la cherche : le lecteur avait le bon
nom, c'est l'atlas qui portait l'approximation. Elle devient une entrée de gamme
à elle — cape brésilienne dite Cobra de la ferme Reyes, sous-cape Habano
dominicaine, tripe dominicaine et centraméricaine, trois formats.

### Le Panama retrouve une maison — vingt-quatre heures après
La 204 avait retiré une fiche inventée et n'avait rien mis à la place, faute de
source : *« mes sources sont un site touristique et une notice de guide »*.
C'était la bonne décision au moment où je l'ai prise, et elle n'a pas tenu un
jour — parce que chercher dans la bonne direction a fini par donner du
journalisme.

`newsroompanama.com` a publié le **14 septembre 2025** un article qui nomme la
fondatrice, le mois, le lieu, la technique et la reprise par le fils :
**Joyas de Panamá**, fondée par **Miriam Padilla** en février 1986 à La Pintada,
Coclé — première fabrique de cigares permanente du pays, roulage entièrement à
la main sur semence cubaine. Padilla avait été directrice de production chez
Gilberto Oliva avant de monter la sienne. L'atelier s'est arrêté en 2023 (covid,
puis sa retraite) ; son fils **Braulio Zurita** l'a rouvert et le dirige.

**`gamme` reste à `[]`.** La maison ne publie aucun nom de ligne vérifiable, et
quatorze fiches de cet atlas sont dans ce cas. En inventer serait répéter
exactement la faute retirée la veille.

### Sortová existe dans deux provinces
La feuille `panama-habano` affirmait que **tout** le tabac panaméen vient du
Chiriquí. La presse panaméenne place le tabac de Joyas de Panamá dans le
**Coclé** — La Pintada, Sonadora, Sortová. Or il existe aussi un Sortová dans le
district de Bugaba, au Chiriquí. Les deux feuilles nomment désormais la
divergence au lieu de choisir ; laisser « tout » remettait une contradiction
interne dans l'atlas, la veille du jour où elle venait d'en être retirée.

### Trois garde-fous ont refusé cette migration
- **`i18n_fraicheur`** : cinq cases vides — la `gamme` de Joyas valait `[]` en
  français et `NULL` ailleurs. « Vide » dit qu'on sait qu'il n'y a rien ;
  « absent » dit qu'on n'a pas regardé.
- **`i18n_superlatif_check`**, deux fois : « 第一家 » en chinois et
  « am meisten » en allemand affirmaient plus que le français, qui attribue la
  formule à la presse. Retirés, pas justifiés.
- **`coherence_check`** avait déjà exigé, à la 204, qu'un pays n'annonce que des
  maisons ayant une fiche. L'annonce du Panama redevient légitime parce que la
  fiche existe.

### Et une erreur de ma part dans les tests
J'ai d'abord interrogé `test_pdo()` — la base **de test**, une copie jetable qui
ne porte pas le contenu des migrations. Cinq assertions ont échoué sur une base
pourtant juste. Le contrôle final sur les langues servies ouvre sa propre
connexion **pour cette raison exacte** ; je ne l'avais pas lu avant d'écrire à
côté.

---

## Décision : les six langues restent ouvertes — 11 septembre 2026

**Point 3 de l'ordre convenu, tranché.** L'ordre était : mesurer → réparer la
diffusion → trancher la surface linguistique → structurer. Les deux premiers
sont faits ; celui-ci se décide sur les chiffres ci-dessous, pas sur une
intuition.

### Ce que le rapport d'audience a dit (7 jours, lu le 11 septembre)

| Langue | Passages de robots | Part |
| --- | --- | --- |
| fr | 815 | 34 % |
| en | 334 | 14 % |
| es | 319 | 13 % |
| zh | 318 | 13 % |
| de | 299 | 13 % |
| ar | 296 | 12 % |

**2 381 passages de robots** contre 92 la semaine précédente — ×26 depuis la
soumission du plan de site. Les cinq traductions sont balayées à ~300 passages
chacune : **un balayage systématique**. Les 7 690 traductions automatiques
jamais relues sont en cours d'indexation. Google a envoyé ses **5 premiers
visiteurs** ; les lecteurs sont français à 98 % (fr 393, en 7, ar 3, de 3, es 2),
ce qui ne dit rien de la demande — seulement que l'audience n'existe pas encore.

### La décision, et ses raisons
**Les six langues restent ouvertes.**

1. **Fermer maintenant, c'est jeter l'indexation au moment où elle commence.**
   Retirer une langue du plan de site et des hreflang remet son compteur à zéro.
2. **Le risque « contenu généré à l'échelle » vise le contenu mince.** Le
   contenu de l'atlas est unique et sourcé fiche par fiche ; une traduction
   machine d'un texte substantiel n'est pas un texte vide.
3. **Les dérives mécaniques sont tenues** par quatre contrôles —
   `i18n_langue_check`, `i18n_superlatif_check`, `i18n_divergence`,
   `i18n_melange_check` — qui ont refusé trois textes cette semaine même.
4. **Les lecteurs étant français, fermer ne gagne rien aujourd'hui** et supprime
   le seul chemin vers les autres.

### La condition, et le filet
- **Condition** : avant toute démarche vers des professionnels — la piste
  retenue pour la monétisation —, faire relire par un locuteur **un échantillon
  de 30 fiches par langue**. « 0 relue par un humain » reste le seul chiffre qui
  engage quelqu'un, et un acheteur espagnol jugera l'espagnol.
- **Filet** : l'onglet *Langues* de l'administration ferme une langue en un
  clic, sans rien supprimer. Une langue qui s'avère mauvaise à la relecture se
  ferme le jour même.

### Ce qui reste de l'ordre convenu
Le point 4 — **structurer** (société, hébergement, monétisation) — attend une
audience mesurée, pas des robots. Rien à faire tant que les visiteurs distincts
se comptent en dizaines.

---

## Second recensement des maisons absentes — 12 septembre 2026

**Document : `docs/maisons-absentes-2.md`.** Aucun code, aucune migration :
une recherche, et le constat qu'elle impose.

Le premier recensement s'était clos le 7 septembre sur « il n'y a pas de
point 7 ». Il était clos **contre sa propre liste** — l'index de Cigar
Aficionado, la page Wikipédia — pas contre le marché. Un test de **210 noms de
maisons connues contre l'index que sert le site** donne : 126 fiches, 14 lignes
de gamme trouvables, **70 absents** — dont **≈ 41 maisons réelles, roulées main,
jamais recensées**, vérifiées une à une (roulage, fabrique, pays, activité,
sources ; 30 domaines DNS-vérifiés).

| pays de fabrication | à écrire |
| --- | --- |
| Nicaragua | 18 |
| République dominicaine | 13 |
| Honduras | 7 |
| Mexique | 2 |
| Costa Rica | 1 |

Ce que la scène boutique a d'inattendu : **une dizaine de fabriques que l'atlas
nomme déjà dans ses fiches sans leur en donner une** — Tabacalera William
Ventura (Caldwell, La Barba), Kelner Boutique Factory (Casdagli), J. Fuego
(7-20-4), Reyes Family Cigars (Kafie). Même défaut que Tabacalera Palma avant
la 186, à l'échelle d'un lot entier.

Et neuf fiches présentes ont quelque chose à dire qu'elles ne disent pas
encore — Oliva possède Cuba Aliados et Puros Indios depuis août 2021 ; la
fabrique de Caldwell et La Barba a brûlé en 2022 ; Vegas de Santiago roule une
troisième marque, MBombay ; Nomad appartient à Ezra Zion.

**Ordre recommandé** : les fabriques déjà nommées (4), les fabriques-maisons
(11), les historiques (2), la scène sans usine par fabrique de rattachement
(24), puis une migration de requalification pour dix-neuf lignes. Sept à huit
lots, au rythme des migrations 180 à 193 — et une part tombera à l'écriture,
comme à chaque fois.

---

## Lot 1 du second recensement — les fabriques déjà nommées

**964 assertions, 0 échec** (trois passages). Tous les contrôles verts,
`sources` re-figé, `contenu.sql` régénéré. Migration **207**. L'atlas passe à
**186 maisons**, toutes sourcées.

Quatre fiches, et les quatre réparent un renvoi dans le vide — l'atlas les
nommait dans d'autres fiches sans leur avoir donné d'entrée, le défaut de
Tabacalera Palma avant la 186 :

| fiche | pays | nommée par |
| --- | --- | --- |
| **Tabacalera William Ventura** | Rép. dominicaine | Caldwell, La Barba |
| **Kelner Boutique Factory** | Rép. dominicaine | Casdagli |
| **J. Fuego** | Nicaragua | 7-20-4 |
| **Reyes Family Cigars** | Honduras | Kafie (à venir) |

### Ce que la recherche a rendu en passant
- **777 n'était pas introuvable.** Le premier recensement la cherchait comme
  maison hondurienne et concluait « rien ». C'est une marque de J. Fuego, à
  Estelí — rangée sous le mauvais pays.
- **La fabrique de Caldwell et de La Barba a brûlé** le 26 septembre 2022
  (800 000 cigares perdus, aucun blessé), rouverte en mars 2024. Les deux
  fiches ne le disaient pas ; un paragraphe en six langues le dit.
- **Oliva porte désormais Cuba Aliados, Puros Indios et Roly**, avec la date
  (août 2021) et l'origine. L'usine de Danlí n'était pas dans la vente :
  Reyes Family Cigars reste au Honduras — le lieu de fabrication, toujours.
- Le nom **Eiroa** revient : C.L.E. distribue les Reyes depuis 2016.

### Trois garde-fous ont travaillé
`i18n_superlatif_check` a refusé un « 最终 » chinois que le français ne
portait pas. Le contrôle de journal a compté une entrée à 255 — raccourcie.
Et **`sources.php` a refusé `cigarpublic.com`**, cité sans avoir été
DNS-vérifié : sa résolution est instable. Écarté — une source qu'on ne peut
pas rouvrir n'en est pas une, et c'est exactement la faute que la liste de
vérification du lot prétendait avoir évitée.

**Lot suivant** : les onze fabriques-maisons (Luciano, Agrotabacos, Karen
Berger, Tabacalera Aragón, PDR, Cuban Stock, Blackbird, Gran Habano, Cavalier
Genève, Kafie 1901, Rojas).

---

## Lot 2a — quatre fabriques nicaraguayennes

**964 assertions, 0 échec.** Tous les contrôles verts, `contenu.sql` régénéré.
Migration **208**. L'atlas passe à **190 maisons**.

| fiche | ce qu'elle apporte |
| --- | --- |
| **Luciano Cigars** (ex-ACE Prime) | la fabrique d'un Cubain parti en 2005, au prénom d'un financier brésilien ; présentés par **E.P. Carrillo** en 2008 ; 64 rouleurs, 3 millions de cigares ; roule **Crowned Heads** et **Ozgener** |
| **Agrotabacos** | Condega, 1995, les Ortez ; 60 % de la production pour des tiers, dont **Altadis** ; roule Ventura et Lampert |
| **Karen Berger Cigars** | Max Berger fuit la Pologne pour Cuba, son fils Kiki refait la fabrique au Nicaragua, sa veuve la dirige depuis 2014 — **et c'est la fabrique de Cuban Crafters**, dont la fiche nommait l'usine sans dire à qui elle était |
| **Rojas Cigars** | un ancien cinéma d'Estelí ; l'assembleur d'Ezra Zion, Nomad, Emilio et Stolen Throne — quatre maisons avant la sienne |

**Tabacalera Aragón est reportée** : son site ne donne pas d'année de fondation,
et la seule relation documentée par la presse (Jas Sum Kral, 2018–2024) est
terminée. Une fiche qui ne tiendrait que sur le site de la maison répéterait la
faute du Toraño Panama.

`i18n_superlatif_check` a refusé deux mots : un « die jüngsten » allemand, et un
« أشهر » arabe qui voulait dire *mois* — faux positif du détecteur, mais le
cliquet ne se discute pas : « شهور » dit la même chose sans le déclencher.

**Lot suivant (2b)** : les fabriques-maisons dominicaines et honduriennes —
PDR, Cuban Stock, Blackbird, Gran Habano, Cavalier Genève, Kafie 1901.

---

## Lot 2b — dominicaines et honduriennes

**964 assertions, 0 échec.** Tous les contrôles verts, `sources` re-figé à 236
domaines, `contenu.sql` régénéré. Migration **209**. L'atlas passe à
**195 maisons**.

| fiche | pays | ce qu'elle apporte |
| --- | --- | --- |
| **PDR Cigars** | Rép. dominicaine | Abe Flores, Tamboril, 2008 ; cinq millions de cigares, **moitié pour La Palina, Gurkha, Viaje et Kristoff** — quatre fiches gagnent une cible de renvoi |
| **Cuban Stock** | Rép. dominicaine | 1996 ; vingt marques ; usine de zone franche depuis 2016 — une fabrique de volume, dite comme telle |
| **Blackbird** | Rép. dominicaine | 2016 ; des oiseaux pour noms ; **toute la feuille de Tabacalera Palma** |
| **Kafie 1901** | **Rép. dominicaine** | un chirurgien hondurien retiré à 38 ans ; usine à Danlí 2017–2021, **fermée** (ouragans, pandémie) ; toute la production chez **La Aurora** |
| **Gran Habano** | Honduras | les Rico, colombiens depuis 1920 ; usine et fermes propres à Danlí depuis 1998 |
| **Cavalier Genève** | Honduras | un Genevois, une usine à lui à Danlí, un losange d'or sur chaque cigare |

### Une erreur de pays évitée avant écriture
Le recensement classait Kafie 1901 au **Honduras**, avec son usine de Danlí. La
recherche a rendu la suite : l'usine a fermé en novembre 2021 et toute la
production est passée à La Aurora. **Le pays d'une fiche est celui où l'on
roule aujourd'hui.** C'est la onzième erreur de ce type que les recensements
rattrapent — et la première rattrapée *avant* d'être écrite plutôt qu'après.

### La doctrine des notes de presse, appliquée à des fiches neuves
J'avais écrit deux classements — un Top 25 de 2007 pour Gran Habano, un de
2014 pour PDR — et `marques_check` les a refusés, à raison : c'est
**exactement ce que la migration 058 a retiré de toutes les fiches**. Retirés,
pas justifiés. Une fiche neuve ne rouvre pas une règle close.

`i18n_superlatif_check` a refusé sept mots dans quatre langues, dont un « أشهر »
arabe qui voulait dire *mois* — pour la deuxième fois. Réécrit.

**Restent du lot 2** : Tabacalera Aragón (reportée). **Lot suivant (3)** : les
deux historiques — Te-Amo et Miami Cigar & Co.

---

## Lot 3 — les historiques, et une fiche qui était déjà là

**965 assertions, 0 échec.** Tous les contrôles verts. Migration **210**.
L'atlas passe à **196 maisons** — pas 197 : voir ci-dessous.

**Miami Cigar & Co.** est écrite : Nestor Miranda, Cubain, vingt-cinq ans
dans les spiritueux ; société fondée en 1989 avec Mariana ; Don Lino née à
l'usine d'U.S. Tobacco au Honduras — celle de Don Tomás —, douze millions de
cigares en 1996, deux ans hors marché quand UST cesse, sauvée par Guillermo
León chez La Aurora en 1999 ; la Collection au nom du fondateur chez My
Father. Une maison sans usine qui en nomme trois, et trois fiches de l'atlas
reliées.

### Te Amo était déjà dans l'atlas
Le second recensement l'avait donnée absente. Mon test cherchait « Te-Amo »
avec un trait d'union ; la fiche s'appelle « Te Amo ». **Le repli d'accents ne
repliait pas les tirets — et la recherche du site non plus** : un lecteur qui
tapait « te-amo » ne trouvait rien. Corrigé dans `search.js` : tirets, points
et soulignés deviennent des espaces, des deux côtés ; « 7 20 4 » trouve
« 7-20-4 », « j fuego » trouve « J. Fuego ». Assertion ajoutée.

La fiche existante était de première génération — texte générique sur les
Totonaques, fabrique « Tabacos San Andrés » que rien n'établit, date 1963.
Elle est **réécrite sous son nom** : 1966 selon Alberto Turrent lui-même
(Cigar Aficionado, 2009 ; halfwheel dit 1963, l'écart est écrit), Nueva
Matacapan de Tabacos, propriété d'Altadis depuis 2000 et toujours faite par
les Turrent — le cas Bolívar Honduras chez STG. Un premier essai local avait
inséré un doublon « Te-Amo » ; la migration le supprime et le contrôle le
vérifie.

**Leçon de méthode** : un recensement qui teste des noms doit replier ce que
la recherche replie. Le prochain test le fera.

**Lot suivant (4)** : la scène sans usine, par fabrique de rattachement.

---

## Lot 4a — la scène sans usine, chez Plasencia, De Los Reyes et William Ventura

**965 assertions, 0 échec.** Tous les contrôles verts, `sources` re-figé à 243
domaines. Migration **211**. L'atlas passe à **203 maisons**.

Sept maisons qui composent et font rouler ailleurs, rangées par la fabrique qui
les roule — parce que chacune renvoie à une fiche que les lots précédents ont
posée :

| chez | maisons |
| --- | --- |
| **Plasencia** (Estelí) | 1502, Crux, Blanco |
| **De Los Reyes** (Santiago) | Debonaire House, Patoro |
| **William Ventura** (Tamboril) | ADVentura, Freud |

**Une douzième erreur de pays évitée** : le recensement classait Blanco au
Honduras, « pays principal à trancher ». La source tranche — roulée au
Nicaragua chez Plasencia, cousins de la famille depuis quatre-vingts ans.

**Le nom d'Eiroa revient une septième fois** : C.L.E. distribue l'édition
américaine de la Serie P de Patoro. Et les renvois de De Los Reyes vers
Debonaire et Patoro deviennent réciproques.

Deux garde-fous : `coherence_check` a vu un `founded` tronqué à cinquante
caractères (raccourci), `marques_check` une revue nommée pour dater une
divergence — reformulée en « la presse du métier » plutôt qu'exemptée.

**Lot suivant (4b)** : chez Rojas (Stolen Throne, Ezra Zion), chez My Father
(Ortega), chez Pichardo (Ozgener), et les isolées.

---

## Lot 4b — la scène nicaraguayenne sans usine, chez Rojas, Luciano, Rocky Patel, La Corona et Aganorsa

**965 assertions, 0 échec.** Tous les contrôles verts, `sources` re-figé à 250
domaines. Migration **212**. L'atlas passe à **209 maisons**.

Six maisons sans usine, rangées par la fabrique qui les roule :

| chez | maisons |
| --- | --- |
| **Rojas** (Estelí) | Stolen Throne, Ezra Zion |
| **Luciano** (Estelí) | Ozgener Family Cigars *(Aramas chez La Alianza, E.P. Carrillo)* |
| **Rocky Patel / TAVICUSA** | All Saints |
| **La Corona** (Omar González-Alemán) | Serino — fabrique nommée, sans fiche : pas de marque propre |
| **Aganorsa / Casa Fernández** | Sindicato |

**Ortega reportée** : la seule trace récente est un catalogue de détaillant
annonçant le retour du Cubao, sans date ni confirmation d'activité. Une fiche
au présent sur une maison peut-être dormante serait la faute de Mombacho à
l'envers.

**Sindicato n'est pas Black Swan** : la fiche pose la distinction — une
société de détaillants avec un catalogue permanent et une fabrique nommée,
pas une série commandée à des fabriques tournantes.

**Deux renvois deviennent réciproques** : Nomad appartient à Ezra Zion depuis
septembre 2018 (la fiche Nomad le dira au lot 5) ; CAO et Ozgener sont père
et fils. Rojas roule désormais pour quatre fiches de l'atlas.

Un garde-fou que les outils n'ont pas vu : « nouvelle société de l'année »
décernée par halfwheel à Ozgener — une distinction de presse, retirée dans
les six langues avant application, comme les Top 25 du lot 2b.

**Lot suivant (4c)** : Jas Sum Kral, Fable, Jake Wyatt, Hiram & Solomon, Epic,
Chogüí, Principle, Casa 1910, Bombay Tobak. Puis le **lot 5**, les
requalifications dans les gammes existantes (dont Nomad → Ezra Zion).

---

## Lot 4c — les isolées de quatre pays

**965 assertions, 0 échec.** Tous les contrôles verts, `sources` re-figé à 252
domaines. Migration **213**. L'atlas passe à **216 maisons**.

Sept maisons sans usine, rangées par le pays où elles sont roulées :

| pays | maisons | chez |
| --- | --- | --- |
| **Nicaragua** | Fable | Nica Sueño (RoMa Craft), puis Córdoba & Morales depuis oct. 2025 |
| **Honduras** | Jake Wyatt | Tabacalera San Jerónimo, Danlí, depuis 2026 |
| **Rép. dominicaine** | Hiram & Solomon, Epic, Chogüí, Principle | PDR · von Eicken (la fabrique de Kristoff) · Manufactura Rivas · KBF |
| **Costa Rica** | Bombay Tobak (MBombay) | Tabacos de Costa Rica, Puriscal |

**Deux maisons reportées, chacune pour une raison écrite** : Jas Sum Kral a
quitté Tabacalera Aragón le 11 octobre 2024 et n'a jamais nommé sa nouvelle
fabrique ; Casa 1910, dit la presse en mars 2026, ne divulgue pas quelle
fabrique mexicaine roule ses cigares, et ses deux lignes faites ailleurs sont
arrêtées. Sans fabrique nommée, pas de fiche — la règle qui a écarté
Dissident et Sagrado.

**Deux divergences écrites au lieu d'être tranchées** : Jake Wyatt disait
posséder une fabrique (Casamorabo) ; la presse établit en 2026 que tout
part chez San Jerónimo après des ateliers dominicains — la fiche attribue
l'affirmation à la maison et classe au Honduras. Principle : ~2011 au
recensement, 2013 par la devise de la maison.

**Six renvois rendus réciproques** : PDR → Hiram & Solomon, KBF →
Principle, Kristoff → Epic (même fabrique), De Los Reyes → Chogüí (tabacs
de Leo Reyes), Warped → Chogüí (Venture 1492), RoMa Craft → Fable. Et
**Vegas de Santiago reçoit un paragraphe** en six langues : MBombay est la
troisième marque de l'atlas roulée à Puriscal.

Deux garde-fous : `coherence_check` a vu trois `founded` à cinquante
caractères (raccourcis), `i18n_superlatif_check` un « أندر » arabe là où le
français dit « plus rare qu'on ne le croit » — reformulé.

**Lot suivant (5)** : les requalifications dans les gammes existantes —
dix-neuf lignes du recensement, dont Nomad → Ezra Zion.

---

## Lot 5 — les requalifications

**965 assertions, 0 échec.** Tous les contrôles verts, `sources` re-figé à 255
domaines. Migration **214**. Aucune maison créée : l'atlas reste à
**216 maisons**, mais seize lignes que le recensement testait comme des
maisons entrent dans le `gamme` de celle qui les possède, en six langues,
chacune avec une notice qui dit ce qu'elle est.

| maison | lignes ajoutées |
| --- | --- |
| Black Label Trading | Black Works Studio (nov. 2015, même fabrique) |
| Aganorsa Leaf | Condega (rachetée 2002 avec Tropical Tobacco) |
| J.C. Newman | Brick House, Perla del Mar, Quorum |
| La Aurora | León Jimenes |
| Drew Estate | Herrera Estelí (2013, Willy Herrera), Kentucky Fire Cured |
| Rocky Patel | Hamlet (Paredes parti en août 2022, Tabaquero arrêtée) |
| Tatuaje | Cabaiguan |
| RoMa Craft | Baka (2019, cape du Cameroun) |
| A.J. Fernández | Enclave, Días de Gloria |
| Espinosa | 601 |
| Davidoff | Cusano (rachetée juin 2009) |
| Warped | Guardian of the Farm (2016), Cloud Hopper (2017) — chez Aganorsa |

**Une fiche corrigée en passant** : J.C. Newman disait « la famille ne roule
rien elle-même ». Faux depuis 2011 — PENSA, à Estelí, roule Quorum, Perla del
Mar et Brick House, plus de cent mille cigares par jour, co-dirigée par Omar
Ortez, l'homme d'Agrotabacos (lot 2a). Le paragraphe est remplacé en six
langues et la fiche dit qu'une première version se trompait.

**Non traitées, et pourquoi** : Archetype/Psyko Seven — Ventura n'a pas de
fiche, le recensement la croyait présente ; Lost & Found — une société à
part, pas une ligne de Caldwell ; Belinda — marque retirée, aucune source
vérifiée ; Deadwood, Isla del Sol, 20 Acre Farm, Indomina — non sourcées
dans ce lot.

Un garde-fou : le journal a été tronqué trois fois de suite à 255 avant
de tenir — la liste des seize noms ne rentre pas dans un `detail`.

**Le second recensement est clos.** Reste, de ses reports : Tabacalera
Aragón, Ortega, Jas Sum Kral, Casa 1910 (fabrique non nommée) ; Dissident,
Sagrado, Hooten Young, Lampert (même règle). Ils reviendront si la presse
nomme leurs fabriques.
