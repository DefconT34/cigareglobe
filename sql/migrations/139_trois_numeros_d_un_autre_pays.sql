-- ════════════════════════════════════════════════════════
-- 139 — Trois numéros qui appartiennent à un autre pays
-- ────────────────────────────────────────────────────────
-- La migration 138 a effacé trente-trois numéros reconnaissables à leur
-- forme — 1234, 4567, une même touche répétée. Ceux-ci ne se voient pas
-- à leur forme : ils sont parfaitement plausibles. Seul l'INDICATIF les
-- trahit, et il désigne un autre pays que celui de la fiche.
--
--   #17   La Casa del Habano — Le Caire      +961 → le LIBAN
--   #185  La Casa del Habano — Quito         +511 → le PÉROU
--   #167  La Casa del Habano — Montego Bay   +1 877 → numéro vert
--                                            américain, pas la Jamaïque
--
-- POURQUOI CEUX-LÀ ET PAS LES CINQ. Deux autres fiches portent un
-- numéro américain — Drew Estate et Padrón — et c'est PLAUSIBLE : ce
-- sont des entreprises basées aux États-Unis, qui publient leur numéro
-- de siège. On ne touche pas à ce qu'on ne sait pas faux.
--
-- Un cigare du Caire ne se commande pas à Beyrouth, et composer ce
-- numéro fait sonner chez quelqu'un qui n'a rien demandé. Même
-- raisonnement que pour les trente-trois : on ne connaît pas le vrai
-- numéro, l'inventer serait refaire l'erreur, et le champ vide est la
-- seule réponse honnête.
--
-- ⚠ CES TROIS FICHES CITENT « PDF officiel Habanos S.A. » COMME SOURCE.
-- Une source officielle ne donne pas un indicatif libanais pour Le
-- Caire. La source elle-même est donc douteuse sur ces lignes — mais
-- elle l'est peut-être seulement sur elles, et 107 fiches la citent.
-- On efface le numéro faux ; on ne condamne pas la source sur trois
-- cas. Le sujet reste ouvert.
--
-- Après cette migration : php tools/etablissements.php --figer
-- ════════════════════════════════════════════════════════

UPDATE `lounges`
   SET `phone` = NULL, `updated_at` = NOW()
 WHERE `id` IN (17, 167, 185);

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL, 'migration 139', 'systeme', 'telephones_vides', 'lounge', 17,
   'indicatif libanais (+961) pour un etablissement du Caire'),
  (NULL, 'migration 139', 'systeme', 'telephones_vides', 'lounge', 185,
   'indicatif peruvien (+51) pour un etablissement de Quito'),
  (NULL, 'migration 139', 'systeme', 'telephones_vides', 'lounge', 167,
   'numero vert americain (+1 877) pour un etablissement jamaicain');
