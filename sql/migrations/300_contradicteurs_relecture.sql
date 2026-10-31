-- ════════════════════════════════════════════════════════
-- 300 — Contradicteurs sur la relecture des « à vérifier »
-- ────────────────────────────────────────────────────────
-- CE QU'ON A TROUVÉ. Passage du contradicteur (30 octobre 2026) sur les cas laissés
-- ouverts par la 299 :
-- · #186 retirée : aucune Casa del Habano au Cameroun sur les deux listes officielles.
-- · #919 retirée : fermeture datée par deux articles de presse (2021, 2022).
-- · #787 remise en « à vérifier » (retrait de la 299 contesté : un cigar bar est décrit
--   au restaurant Sundara en 2015), renommée et redécrite ; traductions remises en machine.
-- · Doublons 179/1571, 180/1570, 128/382 : le contradicteur ne les tranche pas (aucune
--   adresse officielle lue) ; rien n'est fusionné.
-- ════════════════════════════════════════════════════════
UPDATE `lounges` SET
  `name` = 'Sundara — Four Seasons Resort Bali at Jimbaran Bay',
  `is_verified` = 1,
  `description` = 'Sundara, restaurant du Four Seasons Resort Bali at Jimbaran Bay. Un cigar bar y était décrit par un article de 2015 ; aucune source récente ne confirme ce service.',
  `description_en` = 'Sundara, restaurant at the Four Seasons Resort Bali at Jimbaran Bay. A cigar bar there was described in a 2015 article; no recent source confirms this service.',
  `description_es` = 'Sundara, restaurante del Four Seasons Resort Bali at Jimbaran Bay. Un artículo de 2015 describía allí un cigar bar; ninguna fuente reciente confirma este servicio.',
  `description_de` = 'Sundara, Restaurant des Four Seasons Resort Bali at Jimbaran Bay. Ein Artikel von 2015 beschrieb dort eine Cigar Bar; keine aktuelle Quelle bestätigt diesen Service.',
  `description_zh` = 'Sundara,巴厘岛金巴兰湾四季度假酒店(Four Seasons Resort Bali at Jimbaran Bay)的餐厅。2015 年的一篇文章曾提到那里设有雪茄吧;目前没有近期来源证实这项服务。',
  `description_ar` = 'سوندارا، مطعم في فور سيزونز ريزورت بالي في خليج جيمباران (Four Seasons Resort Bali at Jimbaran Bay). وصف مقال نُشر عام 2015 وجود بار للسيجار فيه؛ ولا يوجد أي مصدر حديث يؤكد هذه الخدمة.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : centurion-magazine.com, novembre 2015, le restaurant Sundara du Four Seasons Jimbaran y a « un cigar bar » ; press.fourseasons.com, communiqué d''août 2024 sur Sundara, sans mention de cigares ; le nom « The Cigar Room » n''est attesté nulle part',
  `updated_at` = NOW()
 WHERE `id` = 787 AND `country_id` = 'indonesia';

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 30 octobre 2026 : les deux listes officielles (lacasadelhabano.com, habanos.com) n''ont aucune Casa del Habano au Cameroun ; la source citée ne parle pas de Douala', `updated_at` = NOW() WHERE `id` = 186 AND `country_id` = 'cameroon';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 30 octobre 2026 : hôtel fermé fin 2021 (Gibraltar Chronicle, 23 août 2021 ; Olive Press, 9 janvier 2022 ; démoli en 2022)', `updated_at` = NOW() WHERE `id` = 919 AND `country_id` = 'gibraltar';

UPDATE `translation_status` t
  JOIN `lounges` l ON l.`id` = t.`entite_id`
   SET t.`source_hash` = SHA1(l.`description`), t.`statut` = 'machine', t.`maj` = NOW()
 WHERE t.`entite` = 'lounges' AND t.`champ` = 'description' AND t.`entite_id` = '787';

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 300';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 300', 'systeme', 'fiches_relues', 'systeme', 0, 'Contradicteurs : 2 retraits (186, 919), 787 remise a verifier'),
  (NULL,'migration 300','systeme','fiche_retiree','lounge',186,'les deux listes officielles (lacasadelhabano.com, habanos.com) n''ont aucune Casa del Habano au Cameroun ; la source citée ne parle pas de Douala'),
  (NULL,'migration 300','systeme','fiche_retiree','lounge',919,'hôtel fermé fin 2021 (Gibraltar Chronicle, 23 août 2021 ; Olive Press, 9 janvier 2022 ; démoli en 2022)');

-- Contrôle : des 1 partout.
SELECT
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (186,919) AND `is_verified` = 0 AND `source` LIKE 'RETIRÉ%') = 2 AS `retirees`,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` = 787 AND `is_verified` = 1 AND `source` LIKE 'à vérifier — relu le 30 octobre 2026%') = 1 AS `fiche_787`,
  (SELECT COUNT(*) FROM `translation_status` WHERE `entite` = 'lounges' AND `champ` = 'description' AND `entite_id` = '787' AND `statut` = 'machine') = 5 AS `sceaux_remis`;
