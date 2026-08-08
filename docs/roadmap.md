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
