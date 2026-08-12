-- ════════════════════════════════════════════════════════
-- 020 — Suivre un sujet, et l'apprendre
-- ────────────────────────────────────────────────────────
-- `forum_follows` existait depuis la migration 015 et son point d'API
-- depuis le premier jour, mais AUCUN bouton du front ne les appelait :
-- la table ne s'est jamais remplie, et rien n'a jamais été envoyé.
--
-- Conséquence : on écrivait un message et on ne savait qu'on avait reçu
-- une réponse qu'en revenant vérifier. Sur un espace où il se dit une
-- chose par jour, personne ne revient. C'est la fonction qui transforme
-- des messages en conversation.
--
-- Deux colonnes suffisent.
--
-- `notified_at` est le garde-fou contre l'avalanche : on prévient UNE
-- fois, puis plus rien tant que la personne n'est pas revenue lire. Un
-- fil animé enverrait sinon vingt courriels dans l'après-midi, et le
-- premier réflexe serait de couper les notifications — donc de ne plus
-- revenir du tout. La colonne est remise à NULL quand le suiveur ouvre
-- le sujet : « revenue lire » se constate, il n'y a pas à l'estimer au
-- temps écoulé.
--
-- `users.notify_forum` est le réglage, dans le profil. Il vaut 1 par
-- défaut : une notification qu'il faut activer n'existe pas, et celle-ci
-- ne part qu'aux sujets que l'on suit — donc jamais sans une action
-- délibérée.
-- ════════════════════════════════════════════════════════

ALTER TABLE `forum_follows`
  ADD COLUMN `notified_at` TIMESTAMP NULL DEFAULT NULL AFTER `created_at`;

ALTER TABLE `users`
  ADD COLUMN `notify_forum` TINYINT(1) NOT NULL DEFAULT 1 AFTER `lang`;
