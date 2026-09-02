-- ════════════════════════════════════════════════════════
-- 137 — Les suggestions demandent désormais un compte
-- ────────────────────────────────────────────────────────
-- LE CHOIX, ET IL EST ASSUMÉ À REBOURS DU PRÉCÉDENT.
--
-- La boîte avait été faite SANS compte, à dessein : exiger inscription
-- puis vérification d'email avant de pouvoir signaler un défaut, c'est
-- n'en recevoir presque aucun — la personne qui vient de repérer une
-- coquille ferme l'onglet plutôt que de s'inscrire.
--
-- Le propriétaire du site tranche dans l'autre sens. Ce qu'on perd :
-- le retour du visiteur de passage, qui est justement celui qu'on ne
-- peut obtenir autrement. Ce qu'on gagne : un interlocuteur
-- identifiable, à qui l'on peut répondre, et un bruit de fond
-- pratiquement nul.
--
-- ── LA COLONNE `email` RESTE ─────────────────────────────
-- Trois remarques ont été envoyées sous l'ancien régime, dont certaines
-- avec une adresse volontaire. Les effacer parce que la règle a changé
-- serait réécrire l'histoire : `email` reste, `user_id` s'ajoute, et
-- l'administration sait afficher l'un ou l'autre selon ce que la ligne
-- porte.
--
-- ── POURQUOI ON NE FIGE PAS LA CLÉ ÉTRANGÈRE EN CASCADE ──
-- `ON DELETE SET NULL` et non `CASCADE` : quand un membre exerce son
-- droit à l'effacement, sa remarque perd son auteur mais reste — elle
-- décrit un défaut du site, pas une personne. C'est la même règle que
-- pour les contributions (voir action_delete_account dans auth.php).
-- ════════════════════════════════════════════════════════

ALTER TABLE `suggestions`
  ADD COLUMN `user_id` INT UNSIGNED NULL DEFAULT NULL AFTER `id`,
  ADD KEY `idx_suggestions_user` (`user_id`),
  ADD CONSTRAINT `fk_suggestions_user`
      FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
