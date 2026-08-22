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
- [ ] **B1** — Mise en ligne o2switch (.env serveur, roter secrets, migrations 001→052, cron des rappels) · M
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
- ⚠ **Les drapeaux emoji ne s'affichent pas sur Windows.** Mesuré : la largeur de 🇮🇹 égale
  celle des deux indicateurs régionaux séparés, contre 55 px pour un emoji ordinaire. Windows
  n'a pas de glyphe de drapeau et rend « IT ». Cela concerne les listes, l'Explorer, le
  formulaire de contribution et les fêtes — partout sauf les fiches pays, qui ont le dessin.
  **Non traité**, hors du périmètre choisi

- ⚠ **Deux sessions ont partagé la même base MySQL** pendant ce chantier. `sql/schema.sql`
  régénéré a capté cinq colonnes `emploi_*` créées par l'autre, et la fixture les a nommées.
  `make-atlas.php` écarte désormais — **bruyamment** — toute colonne absente de
  `sql/schema.sql` : la fixture est rechargée dans une base construite à partir de ce
  fichier, et nommer une colonne qu'il ignore fait échouer tout le chargement
- **Question ouverte, non technique** : publier avant d'avoir relu, ou non ? À trancher
  avec l'avis juridique (loi Évin) et la décision de modération

## Ordre suggéré
~~C2+C3~~ → ~~C1~~ → ~~D3+D5~~ → ~~B2~~ → ~~B3~~ → ~~A2~~ → ~~F7~~ → ~~F1~~ → ~~F2~~ → ~~F6+F3+F5~~ → **B1** → F3/F4/F6 → D6/C1b (optionnels)
