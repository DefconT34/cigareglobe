# Espace communautaire CigarOdyssey — cahier des charges

> Cadrage rédigé le 2026-08-09, **avant** toute implémentation. Ce document
> formalise une demande produit et propose des arbitrages ; les points listés
> au §12 restent à trancher.

## 1. Objectif

CigarOdyssey sait aujourd'hui présenter **des lieux et des maisons** : un atlas,
des fiches, des avis. Il ne sait pas faire parler ses visiteurs **entre eux**.

L'espace communautaire ajoute cette dimension : des aficionados qui échangent par
thématique, se donnent rendez-vous, et documentent une pratique — conservation,
dégustation, accords — que la fiche d'un établissement ne peut pas porter.

Trois usages, dans cet ordre de priorité :

1. **Discuter** — sujets par rubrique, réponses, étiquettes.
2. **Se retrouver** — annoncer et rejoindre des rencontres et dégustations.
3. **Transmettre** — que les bons sujets restent trouvables (recherche,
   étiquettes, épinglage), plutôt que de défiler.

### Ce que ce n'est pas

- Ni une messagerie privée (hors périmètre, §12.5).
- Ni une place de marché : **aucune vente, aucun échange de cigares entre
  membres**. Voir §10, contrainte réglementaire.
- Ni un réseau social à fil d'actualité : la matière est thématique, pas
  chronologique.

## 2. Ce sur quoi on s'appuie

Rien n'est à construire de zéro. L'espace client livré en juillet fournit déjà :

| Existant | Réemployé pour |
|---|---|
| `users` (rôles `member` / `trusted` / `moderator` / `admin`, `status`, `lang`) | Droits d'écriture, sanctions, langue des notifications |
| `moderation_lib.php` | Signalement → file d'attente → décision, même mécanique que les avis |
| `review_flags` | Modèle du signalement communautaire |
| `mail_t()` + `users.lang` | Notifications dans la langue du membre, sans prestataire payant |
| Contributeur de confiance (promotion au seuil) | Publication sans file d'attente, plafonds relevés |
| `lounges`, `brands`, `producer_countries` | **Ancrage** d'un sujet ou d'un événement sur une entité de l'atlas |
| i18n (387 clés × 6 langues) | Toute l'interface de l'espace |

C'est le point important : la communauté n'est pas un module à part, elle
**se branche sur l'atlas**. Un sujet peut porter sur un établissement précis ;
un événement se tient dans un lounge référencé ; une discussion sur une maison
apparaît sur la fiche de cette maison.

## 3. Rôles et droits

| | Lire | Répondre | Ouvrir un sujet | Créer un événement | Modérer |
|---|:--:|:--:|:--:|:--:|:--:|
| Visiteur | ✅ | — | — | — | — |
| Membre (email vérifié) | ✅ | ✅ | ✅ | — | — |
| Contributeur de confiance | ✅ | ✅ | ✅ | ✅ | — |
| Modérateur | ✅ | ✅ | ✅ | ✅ | ✅ |

**Lecture publique, écriture authentifiée** — même règle que les avis, et même
raison : le contenu doit être indexable et partageable, la responsabilité doit
être attribuable.

**Créer un événement demande le statut de confiance.** Un rendez-vous physique
annoncé par un compte de trois minutes est le principal vecteur d'abus d'un tel
espace. Le seuil existant (N contributions validées) sert de filtre ; un
modérateur peut accorder le droit à la demande.

## 4. Organisation : rubriques ET étiquettes

La demande mentionne « thématiques » *et* « tags ». Ce sont deux besoins
distincts, et les confondre produit soit un fouillis, soit une arborescence
morte. Proposition : **les deux, avec des rôles séparés**.

### 4.1 Rubriques — fermées, traduites, peu nombreuses

Une liste **courte et fixe**, définie en base, traduite dans les six langues.
Elle donne la carte des lieux où l'on peut écrire.

| Rubrique | Contenu attendu |
|---|---|
| **Les cigares** | Modules, vitoles, millésimes, éditions limitées, impressions de fumée |
| **Conservation & cave** | Hygrométrie, humidificateurs, vieillissement, incidents |
| **Dégustation & accords** | Méthode, accords spiritueux / café, notes de dégustation |
| **Établissements & voyages** | Retours de lounges, adresses, douanes, voyages tabac |
| **Maisons & manufactures** | Histoire, gammes, actualité des marques |
| **Rencontres & dégustations** | *Rubrique d'événements — voir §6* |
| **Débutants** | Premières questions, sans jugement |
| **La Régie** | Vie du site, suggestions, signalements de données erronées |

Huit rubriques : assez pour orienter, assez peu pour que chacune vive. **Une
rubrique ne se crée pas depuis l'interface** — c'est une décision éditoriale,
donc une migration SQL.

### 4.2 Étiquettes — libres, plates, gouvernées par l'usage

Sur un sujet : **1 à 5 étiquettes**, saisie libre avec autocomplétion.

- Normalisation à l'écriture : minuscules, accents conservés, espaces →
  tirets (`Cohiba Behike` → `cohiba-behike`).
- **Pas de hiérarchie, pas de synonymes automatiques.** Un modérateur peut
  fusionner deux étiquettes (`humidor` → `humidificateur`) ; c'est le seul
  outil de gouvernance, et il suffit.
- Une étiquette vue **moins de 3 fois** n'est pas proposée en autocomplétion :
  cela évite le champ pollué par les fautes de frappe du premier jour.
- Page `/etiquette/<slug>` : tous les sujets portant l'étiquette, toutes
  rubriques confondues. C'est ce qui rend la transversalité possible —
  `#vieillissement` traverse *Conservation* et *Les cigares*.

### 4.3 Ancrage sur l'atlas

Un sujet peut porter, en plus de ses étiquettes, **une référence** à une entité
du site : un lounge, une marque ou un pays. La fiche correspondante affiche
alors « 3 discussions », et l'espace communautaire cesse d'être une île.

## 5. Discussions

- **Fil plat, pas d'arborescence.** Les réponses imbriquées produisent des
  conversations illisibles au-delà de deux niveaux, sur tous les forums qui les
  ont essayées. Une réponse peut *citer* un message précis (ancre + extrait) :
  cela couvre le besoin réel sans l'arbre.
- **Rédaction** : texte simple + un sous-ensemble de Markdown (gras, italique,
  listes, citation, lien). **Pas de HTML**, pas d'insertion d'images externes
  (voir §10, sécurité).
- ✅ **Photos : jusqu'à 3 par message**, en vignettes sous le texte, agrandies au
  clic. Téléversées sur le serveur et **reconstruites** (`backend/image_lib.php`),
  jamais copiées : cela supprime les EXIF — donc la position GPS du téléphone —
  et neutralise les fichiers polyglottes. Une image abaisse le seuil de masquage
  à **2 signalements** : une image choquante fait ses dégâts en cinq secondes, là
  où un paragraphe se lit et s'oublie.
  La **qualité de compression est choisie image par image** : on encode, on relit,
  on compare au PSNR, et on garde la plus basse qui reste sous le seuil de perte —
  jusqu'à −53 % sur une image douce, jamais plus lourd qu'avant sur une image
  bruitée.
- ❌ **Pas d'affiche d'événement.** Une affiche est par définition un support
  promotionnel ; portant le logo d'une maison, ce serait de la publicité pour le
  tabac au sens le plus littéral. Une photo de son propre cigare est un
  témoignage, une affiche n'en est pas un. **En tête de l'avis juridique** (§10).
- **Édition** de son propre message pendant 30 minutes, puis marquage
  « modifié le … ». La suppression par l'auteur laisse une pierre tombale
  (« message retiré par son auteur ») : effacer un message au milieu d'un
  échange rend la suite incompréhensible.
- **Réactions** : une seule, « 👍 utile ». Un jeu d'émojis transforme le
  compteur en bruit ; un signal unique permet de remonter les bonnes réponses.
- **Solution acceptée** : dans *Débutants* et *Conservation*, l'auteur d'un
  sujet peut marquer une réponse comme celle qui a résolu sa question. Elle
  remonte sous le premier message. C'est ce qui rend l'archive utile.
- **Épinglage** (modérateur) : jusqu'à 3 sujets en tête de rubrique.

## 6. Événements

Un événement est un **sujet muni de champs structurés** — il vit dans la même
table de discussions, avec un enregistrement complémentaire. Cela évite un
second système de commentaires : la discussion de préparation *est* le fil du
sujet.

### Champs

| Champ | Règle |
|---|---|
| Titre, description | Comme un sujet |
| **Date et heure de début** | Obligatoire. Stockée en **UTC**, saisie et affichée dans le fuseau du lieu |
| Durée / heure de fin | Facultative |
| **Lieu** | Soit un `lounge_id` de l'atlas (recommandé), soit une adresse libre + coordonnées |
| Type | Dégustation · Rencontre informelle · Passage d'un artisan · Salon / festival · En ligne |
| Capacité | Facultative. Atteinte ⇒ inscriptions en **liste d'attente** |
| Participation | `intéressé` / `je viens` / `annulé`, modifiable jusqu'au jour J |
| Organisateur | L'auteur. Un co-organisateur peut être ajouté |
| Statut | `à venir` · `passé` · `annulé` (avec motif, notifié aux inscrits) |

### Affichages

1. **Agenda** de la rubrique : à venir d'abord, puis archives.
2. **Sur le globe** : les événements à venir apparaissent comme marqueurs
   temporaires, distincts des lounges. C'est l'atout que personne d'autre n'a —
   *voir où ça se passe* est exactement ce que ce site sait faire.
3. **Sur la fiche du lounge** hôte : « Prochaine dégustation le … ».
4. **Rappel par email** à J-2 aux inscrits, dans leur langue (`mail_t`).

### Garde-fous

- Un événement se crée **au plus 12 mois** à l'avance, et se modifie jusqu'à
  son début.
- Passé la date, il devient une archive en lecture seule (le fil reste ouvert
  pour les retours).
- **Aucune billetterie, aucun paiement.** Un lien externe vers la billetterie
  de l'organisateur est autorisé ; le site ne collecte pas d'argent (§10).

## 7. Notifications

Réemploi intégral de `mail_t()` + `users.lang` — aucun prestataire
supplémentaire, aucune traduction serveur (règle **F2** : le serveur ne traduit
pas, `mail_i18n()` reste l'exception assumée).

| Événement | Destinataire | Défaut |
|---|---|---|
| Réponse à mon sujet | Auteur | ✅ activé |
| Réponse après la mienne dans un fil suivi | Suiveurs | ✅ activé |
| Mention `@pseudo` | Membre cité | ✅ activé |
| Événement à J-2 | Inscrits | ✅ activé |
| Événement modifié / annulé | Inscrits | ✅ toujours (non désactivable) |
| Décision de modération me concernant | Auteur | ✅ toujours |

Chaque catégorie se coupe depuis le profil (§ *Préférences*), et **un
récapitulatif quotidien** remplace l'envoi immédiat pour qui le préfère : c'est
la seule protection efficace contre le désabonnement en masse.

## 8. Modération

La mécanique existe déjà pour les avis (`moderation_lib.php`, `review_flags`) —
on la réemploie plutôt que d'en écrire une seconde.

- **Signalement** par tout membre, avec motif (hors sujet · publicité · propos
  déplacés · donnée fausse · autre).
- **Seuil automatique** : 3 signalements distincts masquent le message
  (`status = 'flagged'`) en attendant décision. Un contenu problématique ne
  doit pas attendre qu'un modérateur se réveille.
- **File d'attente** dans `admin.php`, onglet *Communauté*, à côté des avis et
  des contributions.
- **Sanctions graduées** : avertissement → mise en lecture seule (7 / 30 jours)
  → suspension du compte (`users.status = 'suspended'`, déjà en base).
- **Traçabilité** : toute décision est journalisée avec son auteur et son motif.
  Un modérateur doit pouvoir être audité.

### Anti-abus, dès la première version

- Email **vérifié** obligatoire pour écrire.
- Plafonds par 24 h : 3 sujets, 30 réponses, 1 événement (relevés pour les
  contributeurs de confiance). Même logique que le plafond de contributions.
- Délai de 30 s entre deux messages.
- **Aucun lien externe** dans les 5 premiers messages d'un compte : c'est ce
  qui coupe 90 % du spam, pour trois lignes de code.
- Réutilisation d'`auth_attempts` pour la limitation par IP.

## 9. Langues — le point délicat

Le site parle **six langues**. Le contenu communautaire, lui, est écrit par des
humains dans **une** langue, et la règle du projet est ferme : *le serveur ne
traduit pas*.

Conséquence à assumer : un espace communautaire multilingue non traduit se
fragmente en six communautés qui ne se voient pas, ou en une seule où cinq
groupes ne comprennent rien.

**Proposition retenue** — la langue est une propriété du sujet, pas du site :

- Chaque sujet porte la langue de son auteur (`lang`, pré-remplie, modifiable).
- Un **filtre de langue** en tête de rubrique, réglé par défaut sur la langue
  d'affichage **+ l'anglais**. Les autres restent accessibles en un clic.
- L'interface (rubriques, boutons, libellés) est traduite normalement.
- **Aucune traduction automatique**, ni au dépôt ni à l'affichage. Le sujet de
  la traduction des contributions est déjà parqué en attendant un prestataire
  (roadmap) ; on ne le rouvre pas ici.

*Alternative écartée* : n'ouvrir la communauté qu'en français et en anglais.
Plus simple, mais cela contredit un site dont le référencement multilingue est
un chantier abouti (**F6**).

## 10. Contraintes juridiques et de sécurité

Ces points ne sont pas des détails d'implémentation : ils conditionnent ce que
la fonctionnalité a le droit d'être.

### Tabac

- Le cigare est un **produit du tabac**. En France, la loi Évin interdit la
  propagande et la publicité, directe ou indirecte, en faveur du tabac ; les
  règles varient d'un pays à l'autre, et le site est multilingue.
- **Conséquences retenues** : aucune vente, aucune petite annonce, aucun
  échange entre membres ; pas de contenu sponsorisé par un fabricant ou un
  buraliste ; **mention sanitaire** en pied de l'espace communautaire ;
  **âge minimum 18 ans**.
- ✅ **Portail d'âge à l'arrivée** (`assets/js/agegate.js`), sur tout le site et
  pas seulement dans l'espace communautaire. Il est **visible par défaut dans le
  HTML** — construit à l'envers, il suffirait de couper JavaScript pour entrer —
  et la réponse vit dans `localStorage`, jamais dans un cookie : rien ne part au
  serveur, rien n'est à déclarer dans une bannière de consentement.
  Il ne *vérifie* pas l'âge : aucun site ne le peut sans pièce d'identité. Il
  fait ce que la loi attend d'un éditeur — avertir et demander.
- ⚠ **Un avis juridique est nécessaire avant mise en ligne**, en particulier
  sur la frontière entre communauté d'amateurs et promotion. Ce document
  n'en tient pas lieu.

### Données personnelles

- Un événement expose un lieu et une heure de rendez-vous : la liste des
  inscrits n'est visible que de l'organisateur et des autres inscrits.
- Droit à l'effacement : la suppression d'un compte anonymise ses messages
  (« Membre supprimé ») sans les effacer, pour ne pas trouer les discussions.

### Sécurité applicative

- Échappement systématique à l'affichage (leçon d'**A3** : XSS stocké corrigé).
- **Pas de HTML dans les messages** — Markdown restreint, rendu côté serveur ou
  par une bibliothèque sans `innerHTML` brut.
- Images téléversées sur le serveur uniquement (pas d'URL externe : traçage et
  contenu substituable après modération).
- CSP déjà resserrée (**E1/E2**) : tout nouveau rendu doit s'y conformer.

## 11. Modèle de données

Six tables. Nommage et conventions alignés sur l'existant (`utf8mb4_unicode_ci`,
`created_at` en `timestamp`, clés étrangères en `ON DELETE CASCADE`).

```
forum_sections     id, slug, position, icon, is_events, created_at
                   (libellés dans content_translations, comme le reste de l'atlas)

forum_topics       id, section_id, user_id, title, slug, lang,
                   ref_type ENUM('lounge','brand','country',NULL), ref_id,
                   status ENUM('open','locked','flagged','removed'),
                   is_pinned, solved_post_id, views,
                   last_post_at, posts_count, created_at, updated_at

forum_posts        id, topic_id, user_id, body, quote_post_id,
                   status ENUM('published','flagged','removed'),
                   edited_at, created_at

forum_tags         id, slug, label, uses_count
forum_topic_tags   topic_id, tag_id                       (clé primaire double)

forum_events       topic_id (PK, FK), starts_at_utc, ends_at_utc, timezone,
                   lounge_id, place_label, lat, lon, kind, capacity,
                   status ENUM('upcoming','past','cancelled'), cancel_reason

forum_attendance   event_topic_id, user_id, state ENUM('interested','going','cancelled'),
                   created_at                             (clé primaire double)

forum_flags        id, post_id, user_id, reason, created_at, resolved_at, resolved_by
forum_follows      topic_id, user_id, created_at          (clé primaire double)
```

Notes :

- `last_post_at` et `posts_count` sont **dénormalisés** : une liste de rubrique
  ne doit pas faire un `COUNT(*)` par sujet.
- `slug` sur les sujets pour des URLs lisibles et indexables
  (`/communaute/conservation/hygrometrie-70-ou-65-12`).
- `forum_events` s'appuie sur `topic_id` comme clé primaire : un événement
  **est** un sujet, il n'en a pas un.
- Migrations `015` → `018`, puis `sql/schema.sql` régénéré par mysqldump.

## 12. Décisions

| # | Question | Décision |
|---|---|---|
| 12.1 | **Périmètre** | ✅ V1 discussions **livrée** · ✅ V2 événements **livrée** |
| 12.2 | **Qui peut créer un événement** | ✅ **Contributeurs de confiance** (option a) |
| 12.3 | **Langues** | ✅ **Les six, avec filtre** (§9) |
| 12.4 | Réputation | À trancher — les rôles existants (`trusted`) suffisent pour l'instant |
| 12.5 | Messagerie privée | Hors périmètre |
| 12.6 | Modération | À trancher avant ouverture publique |

## 13. Ordre de construction proposé

| Étape | Contenu | Effort | État |
|---|---|---|---|
| **1** | Migration 015, rubriques, sujets et réponses, rendu Markdown, échappement | M | ✅ |
| **2** | Étiquettes, filtre par étiquette, autocomplétion au seuil de 3 usages | P | ✅ |
| **3** | Signalement, masquage au seuil, onglet Communauté, plafonds anti-abus | M | ✅ |
| **4** | Notifications email + préférences du profil | P | ⏳ |
| **5** | Ancrage sur l'atlas (colonnes `ref_type`/`ref_id` posées ; reste l'affichage sur les fiches) | P | ⏳ |
| **6** | Événements : champs, inscriptions, agenda, rappels | M | ✅ |
| **7** | Événements sur le globe | P | ✅ |
| **8** | Référencement : URLs par langue, `sitemap`, `hreflang`, Open Graph par sujet | P | ⏳ |

### Ce que la V1 livre exactement

- 8 rubriques, libellés **dans i18n.js** et non en base : une rubrique est une
  liste fixe décidée éditorialement, donc de l'interface — le serveur ne traduit
  toujours pas
- Sujets et réponses en **fil plat**, Markdown restreint **rendu par le serveur**
  (`forum_lib.php`) : on échappe tout d'abord, puis on réintroduit une poignée de
  balises. L'inverse est la façon dont on écrit une faille XSS
- Le message est stocké **brut** : ce qui est stocké échappé ne peut plus être
  ré-analysé, ni ré-échappé le jour où le rendu change
- Filtre de langue par sujet (`lang`), réglé par défaut sur la langue d'affichage
  **+ l'anglais**
- Étiquettes libres, plates, non proposées sous 3 usages
- Signalement → **masquage automatique à 3 signalements distincts**, file dans
  `admin.php?tab=forum`
- Plafonds : 3 sujets et 30 messages par jour, 30 s entre deux messages, **pas de
  lien externe avant 5 messages** — triplés pour un contributeur de confiance
- Retrait par l'auteur = **pierre tombale**, pas un trou dans la conversation
- `user_id` nullable avec `ON DELETE SET NULL` : un compte supprimé laisse
  « Membre supprimé », l'archive reste lisible
- **Un sujet d'amorce par rubrique** (migration `016`), signé d'un compte dédié
  « La Régie » qui **ne peut pas se connecter** (empreinte `*`, jamais un
  hachage valide). Aucune fausse réponse : un dialogue fabriqué se repère et
  décrédibilise le reste. Deux fils en anglais, parce que le filtre par défaut
  ne montre à un anglophone que l'anglais — sans eux il trouverait le vide

### Ce que la V2 livre exactement

- Un événement **est** un sujet (migration `017`, `topic_id` en clé primaire) :
  la préparation se discute dans le fil, pas dans un second système de commentaires
- **UTC pour l'instant, fuseau du lieu à côté.** Vérifié à Paris en janvier *et*
  en juillet : un décalage en dur donnerait la même réponse aux deux dates
- Organiser demande le statut de **contributeur de confiance**
- Capacité facultative ; au-delà, **liste d'attente déduite** du rang
  d'inscription — et l'on annonce le rang, pas seulement « complet »
- **Marqueur sur le globe** : losange or battant, distinct des triangles violets
  des établissements. Un rendez-vous est temporaire, il n'appartient pas à l'atlas
- « Prochain rendez-vous » sur la fiche de l'établissement hôte, en **une** requête
  pour tout le panneau
- Annulation : le rendez-vous reste visible, barré, avec son motif ; les inscrits
  sont prévenus par email dans leur langue, sans possibilité de couper cet envoi
- Rappel **J-2** par `tools/forum_rappels.php` (cron quotidien) ; `reminded_at`
  garantit qu'il ne part qu'une fois
- La **péremption se rattrape à la lecture** : un cron oublié ne laisse pas un
  agenda plein de rendez-vous d'avant-hier annoncés comme « à venir »
- **Aucune billetterie, aucun paiement** — le site n'encaisse rien (§10)

**Chaque étape sort avec ses tests** — vérifications d'API dans `tests/run.php`
et parcours Playwright — selon la règle du dépôt : *un parcours qui n'exécute
pas le geste ne dit rien sur ce geste*.

**Prérequis** : ce chantier suppose **B1** (mise en ligne) faite. Une communauté
se lance une fois, devant de vrais visiteurs ; la répéter sur un site local n'a
pas de sens.

## 14. Comment on saura que ça marche

| Indicateur | Cible à 3 mois |
|---|---|
| Sujets ouverts par semaine | ≥ 5 |
| Part des sujets ayant au moins une réponse | ≥ 70 % |
| Membres ayant écrit au moins une fois | ≥ 15 % des inscrits |
| Événements créés | ≥ 1 par mois |
| Délai médian de traitement d'un signalement | < 24 h |

Sous ces seuils, la bonne décision est de **réduire le nombre de rubriques**
avant d'ajouter des fonctionnalités : un forum vide se vide plus vite qu'il ne
se remplit.
