# CigarOdyssey — feuille de route

Suivi des chantiers. Après chaque chantier terminé : cocher ici, puis
re-présenter la liste restante et suggérer le point suivant.
Effort : P = Petit · M = Moyen · G = Gros.


> Le récit de chaque chantier terminé est dans `docs/journal.md`.

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
### B. Déploiement
- [x] ~~**B1** — Mise en ligne o2switch~~ ✅
- [x] ~~**B7** — Le contrôle d'avant-vol~~ ✅
- [x] ~~**B4a** — Le contenu de l'atlas entre dans le dépôt~~ ✅
- [x] ~~**B4b1** — Sauvegarde de ce que Git ne portera jamais~~ ✅
- [x] ~~**B4b2** — La sauvegarde tient sur un seul disque~~ ✅ (29 octobre 2026) : l'archive du 14 octobre (18,4 Mo, 80 814 INSERT, 4 863 fichiers) est rouverte par `sauvegarde.php --verifier` et copiée sur un disque dur externe ; `uploads/` du serveur compte 4 863 fichiers, soit exactement ceux de l'archive. **Reste** : poser le cron nocturne (`docs/deploiement.md`, « Sauvegarder avant d'agir, et chaque nuit ») et rapatrier de temps en temps une archive fraîche ; l'archive contient les comptes : disque gardé en lieu sûr, ou chiffrée.
- [x] ~~**B5a** — Le droit à l'effacement (RGPD art. 17)~~ ✅
- [x] ~~**B5b** — Mentions légales, confidentialité, conditions~~ ✅ *(partiel — voir B5c)*
- [x] ~~**B5c** — Les faits que seul l'éditeur connaît~~ ✅
- [x] ~~**B6** — HSTS, et les fichiers qui protègent la production~~ ✅
- [x] ~~**B2** — Délivrabilité email (pilotes transactionnels + diagnostic DNS)~~ ✅
- [x] ~~**B9** — La chaîne email éprouvée pour de bon~~ ✅
- [x] ~~**B3** — Nom & domaine unifiés (CigarOdyssey / cigarodyssey.com)~~ ✅ · *débloque A2*
- [x] ~~**B8** — Le domaine acheté : `thecigarodyssey.com`~~ ✅
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
- [x] ~~**C2** — Vrai schéma SQL versionné~~ ✅
- [x] ~~**C3** — README + doc d'architecture~~ ✅
- [x] ~~**C4** — Tests de fumée API (50 vérifications) + CI~~ ✅
- [x] ~~**C5** — Tests de bout en bout du front (Playwright) + CI~~ ✅ · *prérequis levé pour C1b*
### D. Fonctionnel / produit
- [x] ~~**D32** — Une cape n'est pas une marque~~ ✅ · migration `023`
- [x] ~~**D36** — Trois pays producteurs de plus, et trois écartés~~ ✅ · migration `027`
- [x] ~~**D35** — Relecture sur sources : quatre erreurs, six précisions~~ ✅ · migration `026`
- [x] ~~**D34** — Douze maisons de plus, et une erreur d'inventaire réparée~~ ✅ · migration `025`
- [x] ~~**D33** — Vingt-cinq maisons que l'atlas ignorait~~ ✅ · migration `024`
- [x] ~~**D31** — Les marques qui manquaient à l'atlas~~ ✅ · migration `022`
- [x] ~~**D30** — Onze marques que rien ne reliait au site~~ ✅ · migration `021`
- [x] ~~**D29** — Deux parcours qui ne mesuraient plus rien~~ ✅
- [x] ~~**D28** — Une seule recherche~~ ✅
- [x] ~~**D27** — Référencement des discussions~~ ✅
- [x] ~~**D26** — Suivre un sujet, et apprendre qu'on a reçu une réponse~~ ✅ · migration `020`
- [x] ~~**D25** — Activité récente et ancrage sur l'atlas~~ ✅
- [x] ~~**D24** — Deux détails de l'espace communautaire~~ ✅
- [x] ~~**D23** — Les langues s'ouvrent et se ferment depuis l'administration~~ ✅ · migration `019`
- [x] ~~**D22** — Photos dans les messages de la communauté~~ ✅
- [x] ~~**D21** — Bouton de rotation automatique du globe~~ ✅
- [x] ~~**D19** — Portail d'âge à l'arrivée (18 ans)~~ ✅
- [x] ~~**D20** — Communauté : les deux points d'entrée à la charte, et le menu mobile~~ ✅
- [x] ~~**E1c** — Espace communautaire, **V1 : les discussions**~~ ✅
- [x] ~~**E1d** — Espace communautaire, **V2 : les événements**~~ ✅
- [x] ~~**E1e** — Espace communautaire, **V3 : le modérateur**~~ ✅
- [x] ~~**D1** — Modération des avis (signalement + écran admin)~~ ✅
- [x] ~~**D2** — Contributeur de confiance (promotion + publication directe)~~ ✅
- [x] ~~**D3** — Retirer le champ email redondant du modal contribution~~ ✅
- [x] ~~**D4** — Globe : navigation clavier + alternative textuelle~~ ✅
- [x] ~~**D5** — Globe : zoom centré sur le curseur~~ ✅
- [ ] **D6** — Globe : réécriture WebGL (globe.gl/Three.js) · G · optionnel
- [x] ~~**D16** — Zoom : double-tape sur le globe, plus nulle part ailleurs~~ ✅
- [x] ~~**D17** — Partager une marque comme un article~~ ✅
- [x] ~~**D18** — Le partage, pour de vrai sur téléphone~~ ✅
- [x] ~~**E5** — `action=all` ne servait que le globe~~ ✅
- [x] ~~**D15** — Globe figé sur mobile après fermeture d'un panneau~~ ✅
- [x] ~~**D13** — L'approbation crée un vrai établissement, et prévient l'auteur~~ ✅ · migration 013
- [x] ~~**D14** — L'email d'approbation dans la langue de l'utilisateur~~ ✅ · migration 014
  - [ ] Reste : la **description libre** du contributeur, qui elle demanderait un service
    de traduction. Décision reportée
- [x] ~~**D8** — Position sur place dans « Signaler un établissement »~~ ✅ · migration 011
- [x] ~~**D9** — Drapeaux animés : 4 défauts corrigés~~ ✅
- [x] ~~**D10** — Fiche pratique du pays : devise, langue, heure + fuseau, distance~~ ✅
- [x] ~~**D12** — Itinéraire et distance sur chaque fiche d'établissement~~ ✅ · migration 012
- [x] ~~**D11** — Rebond du marqueur sélectionné~~ ✅
- [x] ~~**D7** — Fête nationale : bannière et confettis au clic sur un pays, le jour dit~~ ✅
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
- [x] ~~**F4c** — Texte libre dans les colonnes JSON : migration 008 (`content_translations`), 101 valeurs distinctes → 505 traductions, export à zéro. Corrige aussi le rendu qui figeait le bloc Habanos en français.~~ ✅
### E. Dette technique
- [x] ~~**E1** — Simplifier `data.php` (DESCRIBE défensifs retirés)~~ ✅
- [x] ~~**E2** — topojson + carte monde auto-hébergés, GA retiré~~ ✅
- [x] ~~**E3** — Frontières réelles des pays producteurs (table `country_polygons` supprimée)~~ ✅
- [x] ~~**E4** — Audit des coordonnées (152 points testés, 2 corrigées : Israël, Semi Vuelta)~~ ✅
- [x] ~~**E5** — Les copies figées du contenu, embarquées dans le front~~ ✅
- [x] ~~**E6** — Rien ne relie une traduction à la version du français dont elle est issue~~ ✅
### R. Relecture du contenu
*Plan détaillé : `docs/relecture.md`.*
- [x] ~~**R0** — Reboucler l'audit géométrique + en faire un outil~~ ✅
- [x] ~~**R1** — Les 21 valeurs chiffrées des fiches pays~~ ✅ · migration `028`
- [x] ~~**R2** — Les valeurs des fiches pratiques~~ ✅ · migration `029` · `tools/geo_banquemondiale.php`
- [x] ~~**R3** — Les 90 fêtes nationales~~ ✅
- [x] ~~**R4** — Les zones de production~~ ✅ · migration `030`
- [x] ~~**R5** — La prose des fiches~~ ✅ · migration `031` · `tools/coherence_check.php`
- [x] ~~**R2 bis** — Les 45 valeurs que R2 avait écartées~~ ✅ · migration `032`
- [x] ~~**R2 ter** — Les 78 autres pays de `data.pays.js`~~ ✅ · `coherence_check.php`
- [x] ~~**R1 bis** — Les revenus manquants~~ ✅ · migrations `033`, `034`
- [x] ~~**R1 ter** — Le tiret devient une phrase~~ ✅ · `panels.js`, `components.css`
- [x] ~~**R1 quater** — Les États-Unis, et le critère appliqué à tous~~ ✅ · migration `035`
- [x] ~~**R1 quinquies** — Un revenu pour quatorze pays sur quinze~~ ✅ · migration `036`
- **La relecture est terminée** — six lots. Ce qu'il en reste n'est pas une liste de
  corrections mais **quatre contrôles branchés sur la campagne** : `i18n_fraicheur.php` (E6),
  `coords_check.php` (R0), `geo_banquemondiale.php` (R2), `coherence_check.php` (R5). Les trois
  premiers existaient déjà sous une forme ou une autre et **ne servaient à rien faute de code
  de sortie** — c'est le motif qui revient le plus dans ce journal
- ⚠ **Ce que la relecture ne dit toujours pas** : le compteur « relue » est à **zéro sur 6 405
  traductions**. Aucun humain n'a validé les cinq langues étrangères. Cette dette-là ne se
  comble pas par un outil


## En cours

### Vague 1 — avant toute communication de masse (audit du 9 octobre 2026)

Le point existentiel du 9 octobre conclut : mature en partie, pas prêt pour une
communication de masse (moyenne 2,4/5). Huit bloquants (P0), dont six touchent
le code. Fait (986 → 1026 assertions, un commit par sujet) :
- **1.1 Vote** : compte vérifié + CSRF, ne publie plus (signal pour la modération).
- **1.2 Fichiers internes** : `CLAUDE.md`, `README.md`, `dev/` exclus du rsync et fermés
  en 404 ; `prevol.php` bloque sur un `.htaccess` vide.
- **1.3 Sauvegarde** : `sauvegarde.php --tout` (toute la base), cron nocturne et dump avant
  migration documentés dans `docs/deploiement.md`.
- **1.4 Juridique** : case des conditions à l'inscription + trace (migration 260), purges
  réelles (tentatives 1 jour, jetons 1 jour après expiration, audience 25 mois), `legal.php`
  aligné.
- **1.5 Tabac** : `/cave/` en noindex et hors plan de site, JSON-LD `Place`, agenda des
  rendez-vous réservé aux membres.
- **1.6 Retour** : flux Atom `/atom.xml` (30 dernières maisons), signal `boot_ok`
  (`backend/boot.php`, appelé quand le globe a ses données).
- **1.7 Lieux non relus** : badge « non vérifié » (globe, explorateur, page) sur les 204 fiches
  publiées sans lecture datée dans `source` ; aucune dépublication à l'époque. Les ~10 offres
  invraisemblables de l'audit (Paris Yacht Marina, Port of Southampton, Savoy American Bar…) sont
  **tranchées : retirées** (migration 271 et suivantes, fiches `is_verified = 0`, motif dans `source`).

Reste, côté utilisateur : brancher le cron nocturne (l'archive du 14 octobre est rapatriée, B4b2),
ticket o2switch (offre, JetBackup, erreurs 429), journaux d'accès du 8 octobre (« /.env »),
rotation DB_PASS / ADMIN_KEY / MAIL_API_KEY après le déploiement, avocat (loi Évin
L3512-4, exception « éditeur hors UE ») et juriste d'Abidjan, représentant UE et ARTCI.
Fait (vague 2, lot 1, migrations 261 et 262) : fiches phares (Fuente, Cohiba et Cohiba USA, Padrón,
Davidoff et Oettinger Davidoff), page Cuba, méta-texte des maisons, pays et feuilles. Reste, côté
nous : les lots 2 à 8 de la vague 2 (ci-dessous) ; mention sanitaire persistante sur l'accueil du globe (FAITE : ligne fixée en bas du globe) ;
message de repli de l'accueil FAIT (15 s sans démarrage : « Recharger la page ») ; regroupement des 40 requêtes de l'accueil (vague 4,
selon la réponse d'o2switch sur les 429).
### Vague 2 — relire les fiches suivantes (expert cigare, un lot de huit à la fois)

Ordre, d'après l'audit du 9 octobre et un balayage des phrases à risque (superlatifs, citations,
chiffres) ; chaque lot = vérification page par page, traduction, migration :
- **Lot 2 — FAIT (migration 263, 16 octobre)** : H. Upmann, Montecristo, Partagás, Bolívar, Hoyo de Monterrey,
  Punch, Romeo y Julieta, Trinidad. **Lot 3** — Ramón Allones, Vegas Robaina, Vegueros,
  Quintero, José L. Piedra, Diplomáticos, Cuaba, El Rey del Mundo (**lot 3 FAIT, migration 264, 16 octobre**). **Lot 4 — FAIT (migration 265, 16 octobre)** : Por Larrañaga, La Gloria
  Cubana, Juan López, Rafael González, Sancho Panza, Saint Luis Rey, Quai d'Orsay, San Cristóbal, La
  Flor de Cano, Fonseca. La page Cuba a relevé les contradictions internes de ces fiches (Partagás
  « n'a jamais déménagé », Montecristo à Romeo y Julieta, Quintero Vuelta Arriba / Abajo, José L. Piedra
  « feuilles entières », le compte « vingt et une marques »).
- **Lot 5 — FAIT (migration 266, 17 octobre)** — New World : Drew Estate (« Marvin Samuels » pour Samel, rachat par
  Swisher de 2014 absent), Liga Privada, My Father, Oliva, Perdomo, Plasencia, Alec Bradley, CAO.
  **Lot 6 — FAIT (migration 267, 17 octobre)** : Camacho, Joya de Nicaragua, La Flor Dominicana, Avo, Macanudo, Zino Platinum, Excalibur,
  Santa Damiana.
  **Lot 7 — FAIT (migration 268, 21 octobre)** : fiches « ligne » classées par pays de roulage (Arturo Fuente Hemingway et
  Maduro, CAO Cameroon / Black / America, Oliva Serie G et Connecticut Reserve, Perdomo Ecuador ;
  renommage de Perdomo Ecuador en Perdomo Legacy Connecticut : fait, migration 272).
  **Lot 8 — FAIT (migration 269, 21 octobre)** : Partagás USA, Romeo y Julieta USA, Dannemann, Te Amo, Tabacalera, General Cigar, Villiger ;
  La Flor de la Isabela fusionnée dans Tabacalera (migration 270, FAIT). **Vague 2 close** : 271 (quinze établissements dépubliés), 272 (Perdomo Legacy Connecticut).
- Hors lots : Toscano (Classico et Toscanello à la machine selon les importateurs), le classement de
  Villiger / Oettinger Davidoff / Burger Söhne en Suisse, les paragraphes doublés de Villiger Söhne en
  zh et ar, « shared with H. Upmann » dans l'anglais de Punch. Détail et phrases à risque : fichier de
  travail `lots_vague2.md` du carnet de session.

### La relecture des traductions (migration 234, `tools/i18n_relecture.php`)

Chantier ouvert : 9 220 traductions « machine », relues lot par lot par
`expert-traduction`, anglais d'abord, orthographe britannique. Colonne
`translation_status.relecteur` (qui a relu), cliquet
`sql/i18n_relues.json`, tests : aucune relecture sans nom, les relues
ne reculent pas. Chaque lot = une migration (`--importer`).
- **236** — anglais des pays, zones, présence Habanos, marchés, lexique,
  arômes : 370 relus, 27 corrigés (calques, glossaire *factory* /
  *representation* / *machine-made*, intensifs perdus, un contresens
  *bench* pour pupitre).
- **237** — anglais des feuilles : 186 relus, 20 corrigés (glossaire :
  *cigar cellars*, *sun-grown*, *factory*, *moho azul* gardé ; « douceur »
  rendue *mildness* comme partout ailleurs ; calques).
- **274 à 280** — zh et ar, par morceaux de 28 000 caractères français, les
  agents ne rendant que leurs corrections : 275-276 (883 textes par langue : pays, marchés,
  zones, arômes, lexique, feuilles, établissements), 277-278 (historique de 67 fiches de
  marques), 279-280 (859 textes `gamme`, `celebrities`, `pairings`, éditions limitées :
  zh 358 corrigés, ar 447 corrigés, 0 refus). Environ 4,5 M de jetons pour 279-280.
  État : 9 522 relues sur 10 500. Le reste en machine n'est pas à relire : 184 fiches de lounges dépubliées par langue (`is_verified = 0`, jamais affichées) et 13 « indépendance » de producer_geo qui sont de simples années, sans traduction. Si une fiche dépubliée est rétablie, la relire alors. 282-284 = reliquat zh/ar et tout l'anglais.
- **285** — allemand, tout le reste (169 corrigés sur 1 808).
- **286** — espagnol, tout le reste (233 corrigés sur 1 808).
- **287** — producer_geo (devise, langue, indépendance de 31 pays), 400 textes relus, 1 corrigé ; hors plan de l'exporteur, migration écrite à la main avec la garde d'empreinte.
- **281** — trois domaines morts (lefagot.com, zirahotel.com, espinashotel.com) : Fagot
  Cigare et Zira en « à vérifier », Espinas Palace retiré. Reste ouvert : lire la page
  officielle du Zira (403) ou appeler l'hôtel ; la sonde `lounges_sondes.json` notait
  lefagot.com « ok » en septembre (page de registraire ?).

### Huitième recensement — les marques des catalogues (`docs/recensement-8.md`)

Toutes les marques que vendent cigares.com, cigarworld.de, Neptune,
Holt's et Atlantic confrontées à l'atlas : 649 noms, 322 à trier
(`expert-cigare`, treize lots de vingt-cinq, verdicts `fiche` / `gamme` /
`mention` / `doublon` / `hors_perimetre` / `fabricant_tu` /
`introuvable`), puis contradiction des `fiche`, puis écriture par lots de
pays. Tri : terminé (322 noms) ; contradiction : terminée (188 examinés ;
réexamen de Puriscal terminé) ; écriture : 120 fiches migrées (239 à
241, 243 à 245, 247 à 249 et 253, l'atlas à 382 marques) ; Haïti est
ouvert (252 et 253) ; les ajouts aux fiches existantes sont migrés pour
les lots 01 à 09 (250, 251 et 254), sans reste. **Recensement terminé** :
120 fiches, Haïti ouvert, 36 lignes et 23 paragraphes ajoutés, 92 noms sans
fiche (docs/recensement-8-exclus.md). Livrée en chemin : la 238, les noms que
les fiches citent deviennent trouvables. Les fiches hôtes que les
ajouts contredisaient sont corrigées (255 à 258 : Puriscal, douze
maisons, Holt's / Helvada / Herr Lehmann, les restes, le pays de Rocky Patel,
d'Ozgener et de Miami Cigar & Co. avec la gamme d'Ozgener : 259). Reste à
l'utilisateur, voir « En réserve » de `docs/recensement-8.md` : Tatiana
et la Special Selection de Miami Cigar, les gammes de Rocky Patel, Costa de
Tabacosta, Swag.

### Reste du lot 21 (migration `235`)

- Trois caves Zino sans rue : Cosmos, Sofitel, Plateau (zino.ci ne publie que e-mail et téléphone ; relu le 29 octobre 2026, rien d'établi).

### Reste de la 242 — autour des salons de C.Gars Ltd

- Chester (fiche 50) et Soho (fiche 283) : **réglés, migration 289** (Chester au 32 Watergate Street, « célèbre » retiré ; Soho retiré, aucune boutique à Old Compton Street). Knutsford : la Casa de C.Gars (10 Minshull Street) n'est pas confirmée, pas de fiche. Trois caves Zino : Cosmos = Boulevard Principal, Yopougon (habanos.com), sans numéro, non écrit ; Sofitel et Plateau : aucune rue publiée.
- Zira Hotel, Belgrade (fiche 935) : **retiré, migration 288** (hôtel non-fumeur hors terrasse, aucun cigar bar décrit) ; à rétablir si l'hôtel (+381 11 331 4800) en confirme un.

### Audit n° 2 (29 octobre 2026) et pilote États-Unis

Moyenne 3,1/5 (2,4 le 9 octobre). Pas d'annonce large avant : regroupement des scripts déployé (commit 3c222cc), cron nocturne, sonde d'uptime et certificat (échéance 30 novembre), ticket 429 o2switch, rotation de DB_PASS / ADMIN_KEY / MAIL_API_KEY après lecture des journaux du 8 octobre, polices Google hébergées en local, page légale refaite (statut de l'éditeur, représentant UE, ARTCI), avis d'avocat sur la loi Évin. Dépôt GitHub public : à trancher.
- Contenu à corriger : chiffres d'export contradictoires des pays (`producer_countries.revenue` / `habanos_presence.revenue`), titre « Habanos S.A. » des pays non cubains, superlatifs.
- États-Unis : 21 fiches relues (migration 292 : 4 fermetures). Reste 17 fiches : 10 à corriger, 6 à vérifier, 1 confirmée ; fiche 151 à relire à la main. Coût mesuré ≈ 5 000 jetons par fiche (sans contradicteur). Étendre aux autres pays si le pilote convainc : États-Unis, France, Royaume-Uni, Espagne, Allemagne d'abord.
- Relecture des lieux (suite du pilote) : États-Unis, France, Allemagne, Espagne, Royaume-Uni faits (migrations 293, 294, 296) ; restent les autres pays (336 lieux publiés avant, 67 relus). Fiches à renommer (noms que les sources contredisent : 27 « Le Gaspard », 228 « Habanos House », 1244 et 1245 « — Fumoir », 278 « Cigar Terrace », 282, 1507 « Members Lounge »), 1506 Breakers, 1507 Augusta National et 1300 (club privé fermé au public) à trancher, fiche 151 à relire à la main, 26 Pall Mall à créer si deux sources officielles.
- Relecture des lieux (297, 298 et 299) faite — 299 : 120 fiches « à vérifier » relues, 43 reprises, 6 retirées (hôtels sans salon cigares), 17 enrichies ; 80 restent « à vérifier » faute de seconde liste officielle lisible (habanos.com pages « place », localisateur davidoff.com), — 305 : 4 lieux confirmés (Macanudo NY, Iwan Ries, Monte-Carlo Cigar Club, Lobby Bar Métropole), 5 noms corrigés ; tous les lots de relecture sont faits : 133 fiches à l'origine, 115 restent « à vérifier » (35 LCDH/Davidoff, 80 autres) faute de seconde source lue (Davidoff, LCDH sans adresse officielle, hôtels sans salon attesté) ; pistes : Gimeno→Domingo Cigars, Altamira Suites, Cava Magallanes (boutique) — 304 : 8 lieux hors franchise confirmés par deux sources (Civette, Aristide, Remedy, De' Ricci, R261, Bertie, Royal Luxembourg, Hotel Nacional) ; 40 restent « à vérifier » sur 48 relus ; reste ~45 fiches hors franchise à relire ; erreurs de fiche à corriger (#1575, #1572, #1566, #182, #36, #184) — 303 : 6 franchises LCDH confirmées une à une (Bonn, Harrods, Porto, HCMC, Lomé renommée, Kreuzlingen) ; 33 restent « à vérifier » dont les 11 Davidoff (aucune source officielle accessible) ; lot suivant : ~93 fiches hors franchise (hôtels, bars, festivals) — 302 : 11 Cohiba Atmosphere + 2 Davidoff (Marina Bay Sands, Pavilion KL) confirmés, doublon 128/382 tranché (#382 retirée) ; restent « à vérifier » 11 Davidoff (localisateur sans recherche par ville), 2 doublons Estelí (179/1571, 180/1570) sans source officielle — 301 : 41 franchises confirmées par la liste habanos.com lue au navigateur (réserve levée), 4 noms corrigés ; restent « à vérifier » les Cohiba Atmosphere, Davidoff, fiches absentes de la liste et doublons — 300 : #186 et #919 retirées, #787 remise à vérifier ; doublons 179/1571, 180/1570, 128/382 indécidables sans adresse officielle (lire habanos.com et davidoff.com dans un navigateur) ; Black Lotus Cigar Club (Douala, Habanos Specialist) à instruire. Avant 299 : 89 reprises, 18 retraits (15 + 3 doublons), 73 fiches enrichies (champs vides seulement), 3 renommages, L'Escale ajoutée (#2580). Restent : téléphone divergent 63 (+376 869 225) / ex-2573 (869 255).
- Pays (295) fait. Reste : « La terre à tabac la plus réputée au monde » (Vuelta Abajo, zone 1), USITC / UN Comtrade à lire directement.
- Sécurité P1 faits (voir journal) ; reste à votre charge : rotation des secrets, dépôt GitHub public, polices Google (téléchargement à autoriser).
- Données à vendre (plan de l'agent monétisation, hypothèses de prix non fondées sur le marché) : export CSV par pays, veille mensuelle ; base réelle 336 lieux publiés, dont 166 datés.

### Enrichissement des lieux, tous pays (migrations 306 à 311, 31 octobre 2026)

- Fait : 306-307 (suites de la relecture), 308 (29 fiches : France, Suisse, États-Unis, Canada, Royaume-Uni, Portugal), 309 (3 en Allemagne), 310 (12 dans le monde), 311 (Estonie, Lettonie, Suède créées + 4 fiches). Fiches #2582 à #2629, la plupart « à vérifier ». Base : 572 lieux.
- 312 à 318 faits (Asie, Amériques, villes américaines, Qatar, renommages, lexique, Mapamba, Hongrie et Dubaï) : base à 586 lieux, 98 pays de lieux. Les pistes nommées (Nairobi, Varsovie, Doha, Vienne, Oslo, Curaçao, Bahamas…) sont épuisées faute de seconde source.
- 319 fait (31 octobre 2026) : 106 fiches non vérifiées relues, 23 confirmées, 5 retirées. Restent à instruire : #1611, #1127, #1000, #834, #2541, #1390/#1392 ; 7 « introuvables » sans démenti ; franchises (Davidoff, Cohiba Atmosphere, LCDH) sans seconde liste officielle. 320 fait (31 octobre 2026) : #2588 renommée ; #646, #1566, #1575 étaient déjà réécrites. 324 fait : #2562, #161, #177 confirmées et renommées ; #83 et #116 restent à adresse divergente. 323 fait (31 octobre 2026) : 15 franchises confirmées par les listes officielles lues à la machine, #117 retirée (doublon de #365) ; restent à instruire Saint-Pétersbourg, Esch Café Rio, Lima, Tokyo Cigar Club, Casa Partagás (adresse différente sur habanos.com), Doha Al Rayyan, Singapour Fullerton, WIP Kuala Lumpur, Habanos House Paris, Enjoy Casino (une seule liste). 322 fait : #179 et #180 ramenées à l'attesté ; #232, #278, doublon #179/#1571 restent sans seconde source lue.
- Photos : après chaque import, lancer `cd ~/public_html && php tools/placeholders.php --tout` (pas depuis `~/repositories`, qui n'a ni la base ni le dossier servi).
- En cours : lots 8 (Asie-Pacifique) et 9 (Amériques, Caraïbes) confiés à des agents ; viendront Afrique, Golfe, Europe de l'Est, villes américaines (Los Angeles, Chicago, Dallas, Boston, Washington, San Francisco, Seattle, La Nouvelle-Orléans, Denver).
- À trancher par vous : Mapamba House (ville, pays, graphie) ; doublons Padrón #179/#1571 ; « Le Club Fumoir » (Grand Hôtel du Bois de Boulogne) à instruire.
- Mis de côté à votre demande : corrections de design (audit : focus, contrastes `--gold-text` / `--on-gold`, cibles tactiles 44 px, badges, polices auto-hébergées).
- Lexique : 20 → 86 termes (migrations 315 et 316, conservation, authenticité, variétés de tabac, fabrication) ; objectif 80-100 atteint. Page « Conserver ses cigares » faite (/conserver). Reste en contenu : « fabrication pas à pas », calendrier, marchés 10 → 25.
- Fonctions faites (31 octobre 2026) : « Près de moi », icônes PWA, JSON-LD BreadcrumbList, export RGPD art. 20. Restent, du moins au plus coûteux : export .ics (il faut d'abord un calendrier d'événements structuré), mode hors ligne ; filtres partageables faits (hash d'URL) ; puis glossaire (20 → 80 termes), conservation, authenticité, variétés de tabac ; carnet de dégustation et humidor personnel (7 à 11 jours). Aucune fonction de vente (loi Évin).

## Ordre suggéré
~~C2+C3~~ → ~~C1~~ → ~~D3+D5~~ → ~~B2~~ → ~~B3~~ → ~~A2~~ → ~~F7~~ → ~~F1~~ → ~~F2~~ → ~~F6+F3+F5~~ → ~~B1~~ → ~~F3/F4/F6~~ → ~~**B4b2**~~ → D6/C1b (optionnels)

---

Le détail de tout ce qui est coché ci-dessus, et le récit des
chantiers menés depuis la migration `038`, sont dans
`docs/journal.md`.