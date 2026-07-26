# Espace client CigarGlobe — cahier des charges

> Cadrage validé le 2026-07-26. Décisions produit : comptes complets,
> authentification **email + mot de passe**, **compte requis** pour contribuer
> et noter (consultation libre). Ce document précède l'implémentation.

## 1. Objectif

Remplacer l'identité actuelle par **adresse IP** (fragile, contournable, non
attribuable) par de **vrais comptes utilisateurs**, et bâtir dessus quatre
familles de fonctionnalités.

## 2. Rôles

| Rôle | Droits |
|---|---|
| **Visiteur** (anonyme) | Explorer le globe, consulter pays / marchés / lounges. Lecture seule. |
| **Membre** | Contribuer des établissements *signés*, noter + avis, favoris, profil. |
| **Contributeur de confiance** | Ajouts auto-approuvés (après N contributions validées, N configurable). Édition de ses ajouts. |
| **Modérateur** | Modération des contributions / avis (reprend le dashboard `admin.php`). |
| **Admin** | Tout + gestion des rôles. |

## 3. Fonctionnalités (validées)

1. **Contributions attribuées** — « Mes établissements », suivi du statut
   (en attente / approuvé / rejeté), édition de ses propres ajouts.
2. **Favoris & listes** — sauvegarder des lounges en listes (« à visiter »,
   « visités », « favoris »), suivre des pays.
3. **Avis & notes vérifiés** — note (1–5) + avis texte + photo, liés au compte,
   **en remplacement du vote/notation par IP**. Un avis par utilisateur et par
   établissement (éditable).
4. **Profil & passeport** — profil public (pseudo, avatar, bio), pays
   « collectionnés » (dérivés des lounges visités), badges de contribution.

## 4. Authentification

- **Email + mot de passe**, haché via `password_hash()` (`PASSWORD_DEFAULT`,
  bcrypt/argon2 selon l'hébergeur). Jamais de mot de passe en clair, jamais en
  log.
- **Sessions PHP natives** (même origine que le site) : cookie `HttpOnly`,
  `Secure`, `SameSite=Lax`. Simple et robuste sur hébergement mutualisé.
- **Vérification d'email** obligatoire avant de pouvoir contribuer/noter
  (pas avant de naviguer). Lien à usage unique, expirant.
- **Réinitialisation de mot de passe** par lien email à usage unique.
- **Protections** : limitation de débit sur login/inscription (anti-brute-force),
  jeton **CSRF** sur toutes les requêtes qui modifient l'état (sessions par cookie),
  validation stricte des entrées, `voter_ip` conservé en secours anti-abus.

### ⚠ Point d'attention — délivrabilité email
`mail()` sur mutualisé finit souvent en spam. On isole l'envoi derrière une
fonction `send_email()` : implémentation `mail()` (avec en-têtes + SPF/DKIM
o2switch) au départ, **swappable** vers un service transactionnel (Brevo,
Mailgun… offres gratuites) sans toucher au reste. Décision différée, non bloquante.

## 5. Modèle de données (nouvelles tables)

```sql
users
  id, email (UNIQUE), password_hash, display_name,
  role ENUM('member','trusted','moderator','admin') DEFAULT 'member',
  email_verified TINYINT DEFAULT 0, avatar_url, bio,
  status ENUM('active','suspended') DEFAULT 'active',
  created_at, last_login_at

email_tokens
  id, user_id, token_hash, type ENUM('verify','reset'),
  expires_at, used_at

favorites
  id, user_id, lounge_id NULL, country_id NULL,
  list ENUM('to_visit','visited','favorite'), created_at
  UNIQUE(user_id, lounge_id, list)

reviews                       -- remplace lounge_ratings pour le futur
  id, user_id, lounge_id, rating TINYINT (1..5),
  title, body TEXT, status ENUM('published','flagged','removed'),
  created_at, updated_at
  UNIQUE(user_id, lounge_id)
```

Rattachements sur l'existant : `contributions.user_id` (NULL = ancien anonyme),
la note agrégée `lounges.rating` se recalcule désormais depuis `reviews`.

## 6. Migration de l'existant

- `lounges` / `approved_lounges` : contenu vérifié → inchangé.
- `contributions` en attente (IP) : conservées, `user_id` = NULL.
- `lounge_ratings` (IP) : gelées comme base historique ; les nouvelles notes
  passent par `reviews`. La moyenne affichée peut fusionner les deux au départ.

## 7. Endpoints backend (ajouts)

- `auth.php` : `register`, `verify`, `login`, `logout`, `forgot`, `reset`, `me`.
- `account.php` (ou extension d'`api.php`) : `favorites` (add/remove/list),
  `my_contributions`, `review` (create/update/delete). Toutes ces actions
  exigent une session valide + jeton CSRF.

## 8. Ordre de construction proposé

Chaque étape est livrable et testable indépendamment :

- **Étape A — Socle d'authentification** : table `users` + `email_tokens`,
  inscription / vérification / connexion / déconnexion / reset, sessions,
  CSRF, rate-limit, UI (modale compte). *Rien d'autre ne change pour l'instant.*
- **Étape B — Contributions & avis liés au compte** : compte requis pour
  contribuer/noter, `contributions.user_id`, table `reviews`, page
  « Mes contributions ». (Familles 1 & 3 + décision « compte requis ».)
- **Étape C — Favoris & listes** : table `favorites`, UI d'enregistrement
  et pages de listes. (Famille 2.)
- **Étape D — Profil & passeport** : profil public, pays collectionnés,
  badges. (Famille 4 — couche de finition.)

## 9. Note d'architecture front

L'espace client ajoute beaucoup d'UI (modale auth, pages compte, mes
contributions, favoris, avis). L'entasser dans l'`index.html` monolithique
(7 649 lignes) aggraverait la dette. **Recommandation** : sortir le code de
l'espace client dans des modules/fichiers séparés dès l'Étape A — une
amorce de la Phase 3 (restructuration front) menée en parallèle.
