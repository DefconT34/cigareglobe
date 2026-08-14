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
- **B3** : nom & domaine unifiés — CigarOdyssey / cigarodyssey.com partout (backend, emails, SEO, manifeste, CI, docs)
- **B2** : email transactionnel — pilotes Brevo/Mailgun/Resend derrière `send_email()`, alternative texte, multipart, diagnostic SPF/DKIM/DMARC (`tools/mail_doctor.php`), `docs/emails.md`

## ⏳ À faire

### A. Sécurité & robustesse
- [x] ~~**A1** — Clé admin hors URL (session + CSRF)~~ ✅
- [x] ~~**A2** — CORS restreint au domaine réel (liste d'origines, `*` en local)~~ ✅
- [x] ~~**A3** — Revue de sécurité (XSS stocké, fuites d'erreurs, CSP, CORS)~~ ✅

### B. Déploiement
- [ ] **B1** — Mise en ligne o2switch (.env serveur, roter secrets, migrations 001→022, cron des rappels) · M
- [x] ~~**B2** — Délivrabilité email (pilotes transactionnels + diagnostic DNS)~~ ✅ · reste à souscrire chez un prestataire au moment de B1
- [x] ~~**B3** — Nom & domaine unifiés (CigarOdyssey / cigarodyssey.com)~~ ✅ · *débloque A2*

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

## Ordre suggéré
~~C2+C3~~ → ~~C1~~ → ~~D3+D5~~ → ~~B2~~ → ~~B3~~ → ~~A2~~ → ~~F7~~ → ~~F1~~ → ~~F2~~ → ~~F6+F3+F5~~ → **B1** → F3/F4/F6 → D6/C1b (optionnels)
