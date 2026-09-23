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
- Suite : établissements (357 fiches publiées sur 522 — les dépubliées
  ne se relisent pas ; lot exporté en trois parts), maisons (histoire,
  célébrités, accords — 611 k caractères, `gamme` en JSON à traiter par
  structure), puis es, de, zh, ar.

### Reste du lot 21 (migration `235`)

- Trois caves Zino sans rue : Cosmos, Sofitel, Plateau.

## Ordre suggéré
~~C2+C3~~ → ~~C1~~ → ~~D3+D5~~ → ~~B2~~ → ~~B3~~ → ~~A2~~ → ~~F7~~ → ~~F1~~ → ~~F2~~ → ~~F6+F3+F5~~ → ~~B1~~ → ~~F3/F4/F6~~ → **B4b2** (sauvegarde, bloquant) → D6/C1b (optionnels)

---

Le détail de tout ce qui est coché ci-dessus, et le récit des
chantiers menés depuis la migration `038`, sont dans
`docs/journal.md`.