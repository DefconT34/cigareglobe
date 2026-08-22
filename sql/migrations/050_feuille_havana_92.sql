-- ════════════════════════════════════════════════════════
-- 050 — Havana 92, la génération d'avant
-- ────────────────────────────────────────────────────────
-- L'audit d'exhaustivité a relevé neuf noms de variétés cités dans la
-- prose des fiches sans figurer dans aucune liste. Huit ne devaient pas
-- y figurer :
--
--   Silver Tongue, Habana 2000  → des ALIAS de Cow Tongue et
--                                 d'Habano 2000
--   Bell 61-10                  → un tabac a CIGARETTES, parent d'un
--                                 croisement
--   Klaten                      → une RÉGION de Java Centre, déjà dans
--                                 `regions`
--   Habana P.R.                 → variété parente du Criollo 98, plus
--                                 cultivée
--   Cimaba, Viscaya, Isabela    → trois souches philippines que la
--                                 migration 047 regroupe délibérément
--                                 sous « Tabac natif de Cagayan »
--
-- Le neuvième est un vrai manque.
--
-- ── HAVANA 92 EST VIVANTE ───────────────────────────────
--
-- Ce n'est ni un alias ni un ancêtre disparu : les sources disent que
-- quelques hectares nicaraguayens la portent encore. Une variété
-- cultivée que l'atlas nommait sans la lister.
--
-- Elle est de la génération d'avant : c'est ELLE qui a été croisée avec
-- Habana P.R. pour donner le Criollo 98, lequel a ensuite été recroisé
-- avec le Corojo de 1947 pour donner le Corojo 99. Les trois fiches
-- nicaraguayennes racontent donc désormais trois étapes de la même
-- lignée, dans l'ordre.
--
-- ── CE QUE CETTE FICHE NE DIT PAS ───────────────────────
--
-- Les sources consultées la mentionnent comme semence encore en terre,
-- sans en décrire le profil. La fiche dit donc sa PLACE dans la lignée
-- — qui est établie — et se garde de lui prêter des arômes qu'aucune
-- source ne lui attribue.
--
-- Ses notes et ses accords sont ceux de la famille Habano dont elle
-- fait partie, et le texte le dit plutôt que de faire croire à une
-- dégustation qui n'a pas eu lieu.
-- ════════════════════════════════════════════════════════

INSERT INTO `feuilles`
  (`id`, `name`, `country_id`, `emploi`, `genese`, `culture`, `caracteres`, `notes`, `pairings`)
VALUES (
  'nicaragua-havana-92',
  'Havana 92',
  'nicaragua',
  'Tripe et sous-cape',
  'La génération d''avant. C''est elle que les agronomes cubains ont croisée avec Habana P.R. pour obtenir le Criollo 98, lequel a ensuite été recroisé avec le Corojo de 1947 pour donner le Corojo 99. Les trois feuilles nicaraguayennes sont donc trois étapes de la même lignée, née de la lutte contre le moho azul.',
  'Ses deux descendantes se partagent l''essentiel des surfaces du pays ; elle n''occupe plus que quelques hectares. Une semence qu''on n''a pas abandonnée, sans qu''elle soit redevenue majoritaire.',
  'Les sources la citent comme semence encore en terre sans en décrire le profil. Cette fiche dit donc sa place dans la lignée, qui est établie, et s''abstient de lui prêter des arômes que personne ne lui attribue : ce qu''on lui connaît est celui de la famille Habano.',
  '["Épices","Corps","Terre"]',
  '["Rhum ambré","Café serré","Chocolat noir"]'
);

-- L'étiquette doit désigner la fiche, sinon celle-ci est injoignable
-- (migration 048). `tools/coherence_check.php` le surveille.
UPDATE `producer_countries`
   SET `varieties` = '["Corojo 99","Criollo 98","Habano","Havana 92"]'
 WHERE `id` = 'nicaragua';
