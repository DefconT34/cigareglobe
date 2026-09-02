-- ════════════════════════════════════════════════════════
-- 134 — Retirer la saisie d'essai qui était publique
-- ────────────────────────────────────────────────────────
-- CE QU'ELLE ÉTAIT. La fiche #2556, « Cohiba'r », Mermoz :
--
--   téléphone     +225 0101010101
--   description   « Lounge et civette / Ambiance basique »
--   source        (vide)
--
-- Un numéro à dix fois le même chiffre, une description de deux mots,
-- aucune source. Elle vient de la contribution #1, envoyée le
-- 18 mars 2026 et approuvée le 7 août — vraisemblablement pendant un
-- essai du formulaire de contribution, l'approbation valant alors
-- validation de la mécanique et non du contenu.
--
-- POURQUOI ELLE COMPTAIT. Elle n'était pas restée dans un coin :
-- /cave/2556 répondait 200, affichait le numéro fictif, et figurait au
-- plan de site soumis à Google. Un visiteur qui compose ce numéro en
-- conclut que le reste du site vaut la même chose.
--
-- CE QUI EN DÉPENDAIT : rien. Aucune photo, aucun avis, aucune note,
-- aucun favori. Vérifié avant, et c'est la raison pour laquelle la
-- suppression est franche plutôt qu'un masquage.
--
-- LA CONTRIBUTION REPASSE À « rejected ». Une contribution « approved »
-- dont l'établissement n'existe plus dans l'atlas est une contradiction :
-- l'écran de modération montrerait une approbation sans objet. Le
-- registre de ce qui s'est passé, lui, est le journal de modération —
-- et il reçoit la trace ci-dessous.
--
-- APRÈS COUP : /cave/2556 rendra 404, et c'est la bonne réponse. Google
-- retirera l'adresse de son index au prochain passage.
-- ════════════════════════════════════════════════════════

DELETE FROM `lounges` WHERE `id` = 2556 AND `country_id` = 'ivorycoast';

UPDATE `contributions`
   SET `status` = 'rejected', `updated_at` = NOW()
 WHERE `id` = 1 AND `name` = 'Cohiba’r' AND `status` = 'approved';

-- La trace. `portee = 'systeme'` : ce n'est ni un administrateur ni un
-- modérateur qui a cliqué, c'est une migration — et le journal doit
-- pouvoir le dire plutôt que d'attribuer le geste à quelqu'un.
INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL, 'migration 134', 'systeme', 'lounge_supprime', 'lounge', 2556,
   'saisie d''essai publique : telephone fictif, aucune source');
