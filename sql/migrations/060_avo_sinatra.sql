-- ════════════════════════════════════════════════════════
-- 060 — « On dit qu'il aurait fumé »
-- ────────────────────────────────────────────────────────
-- Trouvée en préparant la traduction du lot Avo : l'anecdote Sinatra
-- affirme qu'il « aurait fumé les premiers Avo prototypes lors d'une
-- session musicale à New York ». Rien ne l'établit.
--
-- ── POURQUOI LE CONTRÔLE NE L'A PAS VUE ─────────────────
--
-- `marques_check.php` cherche une PAROLE prêtée — une phrase entre
-- guillemets. Celle-ci n'en contient pas : elle prête un ACTE. Le
-- « on dit que » et le conditionnel signalent d'ailleurs eux-mêmes que
-- l'auteur ne savait pas.
--
-- On pourrait durcir le motif pour attraper « aurait » suivi d'un nom
-- propre. Ce serait bruyant : le conditionnel sert aussi à des tournures
-- légitimes. La vraie leçon est ailleurs — un contrôle automatique
-- attrape une FORME, et la relecture attrape le reste. Les deux ne se
-- remplacent pas, ce que la parité des colonnes avait déjà montré au lot
-- 058 en trouvant ce que le contrôle de contenu manquait.
--
-- ── CE QUI RESTE ────────────────────────────────────────
--
-- L'entrée d'Avo Uvezian lui-même demeure : elle porte des faits
-- vérifiables sur le fondateur. Le lien entre Uvezian et Sinatra est
-- d'ailleurs déjà dit dans cette entrée-là, sans lui prêter d'acte.
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET
  `celebrities`    = JSON_REMOVE(`celebrities`,    '$[1]'),
  `celebrities_en` = JSON_REMOVE(`celebrities_en`, '$[1]'),
  `celebrities_es` = JSON_REMOVE(`celebrities_es`, '$[1]'),
  `celebrities_de` = JSON_REMOVE(`celebrities_de`, '$[1]'),
  `celebrities_zh` = JSON_REMOVE(`celebrities_zh`, '$[1]'),
  `celebrities_ar` = JSON_REMOVE(`celebrities_ar`, '$[1]')
WHERE `name` = 'Avo';
