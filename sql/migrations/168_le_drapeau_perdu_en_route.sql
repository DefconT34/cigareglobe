-- ════════════════════════════════════════════════════════
-- 168 — Le drapeau perdu en route
-- ────────────────────────────────────────────────────────
-- LE DRAPEAU IVOIRIEN EST ARRIVÉ EN PRODUCTION SOUS LA FORME DE HUIT
-- POINTS D'INTERROGATION. Sur /feuilles, la Côte d'Ivoire s'annonçait
-- « ???????? Côte d'Ivoire » quand les seize autres pays portaient le
-- leur.
--
-- ── LA CAUSE N'EST NI LE FICHIER NI LA COLONNE ───────────
-- En base de développement, la valeur est intacte : HEX() donne
-- F09F87A8F09F87AE, soit U+1F1E8 U+1F1EE, et la colonne est bien en
-- `utf8mb4`. Le fichier de la migration 165 porte le bon caractère.
--
-- C'EST LE CLIENT. Un `mysql < migration.sql` lancé sans
-- `--default-character-set=utf8mb4` ouvre la connexion dans le jeu par
-- défaut du serveur, souvent `utf8` — celui de MySQL, qui ne code que
-- TROIS octets. Tout caractère sur quatre octets y est remplacé, octet
-- par octet, par « ? ». Deux caractères de quatre octets font donc huit
-- points d'interrogation, et c'est exactement ce qu'on lisait.
--
-- ── LE PARTAGE DES DÉGÂTS EST CONTRE-INTUITIF ────────────
-- L'arabe, le chinois et les accents français tiennent sur un à trois
-- octets : ils sont passés SANS UNE ÉGRATIGNURE. Les six langues de la
-- fiche s'affichaient parfaitement. Seul l'emoji est tombé.
--
-- Un contrôle qui se serait contenté de vérifier « le texte s'affiche »
-- aurait conclu que tout allait bien. Sur les six migrations déployées
-- ce jour-là, UNE SEULE portait des caractères de quatre octets — la
-- 165, et ses deux indicateurs régionaux. Le dégât tenait en un champ.
--
-- ── LA RÉPARATION NE PEUT PAS PORTER L'EMOJI ─────────────
-- Écrire « 🇨🇮 » dans ce fichier reproduirait la panne : la valeur
-- repasserait par la même connexion. On écrit donc les OCTETS, en
-- hexadécimal ASCII, et on les reconvertit côté serveur. Le fichier ne
-- contient plus rien qu'un jeu de caractères puisse abîmer.
--
-- ── ET UN CONTRÔLE QUI VOIT DEPUIS LE SERVEUR ────────────
-- Aucun outil local ne pouvait attraper ceci : coherence_check vérifie
-- les drapeaux, mais sur la base de développement, où ils sont justes.
-- `tools/prevol.php` tourne SUR LE SERVEUR — c'est le seul endroit d'où
-- le dégât est visible. Il porte désormais un constat BLOQUANT sur les
-- drapeaux abîmés ou vides, et sa remédiation donne la bonne commande.
--
-- ⚠ POUR TOUTES LES MIGRATIONS À VENIR :
--   mysql --default-character-set=utf8mb4 -u <user> -p <base> < <fichier>
-- ════════════════════════════════════════════════════════

UPDATE `producer_countries`
   SET `flag` = CONVERT(UNHEX('F09F87A8F09F87AE') USING utf8mb4)
 WHERE `id` = 'ivorycoast';

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 168','systeme','drapeau_repare','pays',0,
   'le drapeau ivoirien est arrive en production en huit points d interrogation. Ni le fichier ni la colonne n etaient en cause — la colonne est en utf8mb4 et la valeur etait intacte en developpement (HEX = F09F87A8F09F87AE). C est le CLIENT : mysql < fichier sans --default-character-set=utf8mb4 ouvre la connexion en utf8 trois octets, et remplace octet par octet tout caractere sur quatre octets'),
  (NULL,'migration 168','systeme','degats_partages','pays',0,
   'l arabe, le chinois et les accents (un a trois octets) sont passes SANS UNE EGRATIGNURE ; seul l emoji est tombe. Un controle qui aurait verifie « le texte s affiche » aurait conclu que tout allait bien. Sur les six migrations deployees ce jour-la, une seule portait des caracteres de quatre octets — la 165 et ses deux indicateurs regionaux'),
  (NULL,'migration 168','systeme','reparation_immune','pays',0,
   'la reparation N ECRIT PAS l emoji : elle passerait par la meme connexion et retomberait. Le fichier porte les OCTETS en hexadecimal ASCII, reconvertis cote serveur par CONVERT(UNHEX(...) USING utf8mb4). Rien dans ce fichier qu un jeu de caracteres puisse abimer'),
  (NULL,'migration 168','systeme','controle_ajoute','systeme',0,
   'aucun outil local ne pouvait attraper ceci : coherence_check verifie les drapeaux, mais sur la base de developpement ou ils sont justes. tools/prevol.php tourne SUR LE SERVEUR — il porte desormais un constat bloquant sur les drapeaux abimes ou vides, et sa remediation donne la commande avec le jeu de caracteres explicite');
