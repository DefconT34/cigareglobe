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
- [ ] **B1** — Mise en ligne o2switch (.env serveur, roter secrets, migrations 001→006) · M
- [x] ~~**B2** — Délivrabilité email (pilotes transactionnels + diagnostic DNS)~~ ✅ · reste à souscrire chez un prestataire au moment de B1
- [x] ~~**B3** — Nom & domaine unifiés (CigarOdyssey / cigarodyssey.com)~~ ✅ · *débloque A2*

### C. Qualité & structure
- [x] ~~**C1** — Externalisation du front (CSS + 23 modules JS hors index.html)~~ ✅
- [ ] **C1b** — (optionnel) Migration Vite/ESM (build + import/export) · G · à évaluer, non prioritaire · le filet de tests front existe désormais
- [x] ~~**C2** — Vrai schéma SQL versionné~~ ✅
- [x] ~~**C3** — README + doc d'architecture~~ ✅
- [x] ~~**C4** — Tests de fumée API (50 vérifications) + CI~~ ✅
- [x] ~~**C5** — Tests de bout en bout du front (Playwright) + CI~~ ✅ · *prérequis levé pour C1b*

### D. Fonctionnel / produit
- [x] ~~**D1** — Modération des avis (signalement + écran admin)~~ ✅
- [x] ~~**D2** — Contributeur de confiance (promotion + publication directe)~~ ✅
- [x] ~~**D3** — Retirer le champ email redondant du modal contribution~~ ✅
- [x] ~~**D4** — Globe : navigation clavier + alternative textuelle~~ ✅
- [x] ~~**D5** — Globe : zoom centré sur le curseur~~ ✅
- [ ] **D6** — Globe : réécriture WebGL (globe.gl/Three.js) · G · optionnel

### F. Internationalisation
*Audit et plan détaillés : `docs/i18n.md`. Les 222 clés de `i18n.js` sont
complètes dans les 6 langues ; le déficit est ailleurs.*
- [x] ~~**F7** — Garde-fous : parité des clés (`tools/i18n_check.php`, 12 vérifications) + balayage des 6 langues avec cliquet~~ ✅
- [ ] **F1** — Rapatrier les 88 chaînes codées en dur du front dans `i18n.js` · M
- [ ] **F2** — Codes d'erreur côté serveur (92 messages), traduits côté front · M · dépend de F1
- [ ] **F5** — RTL arabe : vérifier les composants récents (`#side-fabs`, champ Explorer) · P
- [ ] **F6** — Référencement multilingue (`hreflang`, `lang` dynamique, URLs par langue) · M · **décision requise**
- [ ] **F3** — Colonnes de traduction manquantes, 6 tables (migration 007) · M
- [ ] **F4** — Remplir le contenu (~514 segments → ~2 570 traductions) · G · dépend de F3

### E. Dette technique
- [x] ~~**E1** — Simplifier `data.php` (DESCRIBE défensifs retirés)~~ ✅
- [x] ~~**E2** — topojson + carte monde auto-hébergés, GA retiré~~ ✅
- [x] ~~**E3** — Frontières réelles des pays producteurs (table `country_polygons` supprimée)~~ ✅
- [x] ~~**E4** — Audit des coordonnées (152 points testés, 2 corrigées : Israël, Semi Vuelta)~~ ✅

## Ordre suggéré
~~C2+C3~~ → ~~C1~~ → ~~D3+D5~~ → ~~B2~~ → ~~B3~~ → ~~A2~~ → ~~F7~~ → **F1+F2** → B1 → F3/F4/F6 → D6/C1b (optionnels)
