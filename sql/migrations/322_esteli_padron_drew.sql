-- ════════════════════════════════════════════════════════
-- 322 — Estelí : Padrón (#179) et Drew Estate (#180), descriptions ramenées à ce qui est attesté
-- ────────────────────────────────────────────────────────
-- CE QU'ON A TROUVÉ (31 octobre 2026). Un agent a relu #179, #1571 et #180 (trois requêtes en espagnol et en anglais).
-- #179 et #1571 renvoient à la même usine, Tabacos Cubanica S.A., au centre d'Estelí ; padron.com ne liste que le bureau de
-- Miami ; aucune boutique publique, aucune Sala VIP attestées : doublon non prouvé, rien n'est retiré. #180 : visites guidées
-- et Cigar Safari à La Gran Fabrica attestés, lounge public et réservation non. Les deux descriptions (« éditions limitées
-- directes » ; « réservation requise ») affirmaient plus que les sources : réécrites en six langues, source datée, traductions
-- rescellées. #232 (Royal Monceau) et #278 (Ritz) : rien de lu qui change leur fiche, laissées telles quelles ; le renommage
-- « Club Viñales » ne repose que sur une page de 2018, alors que la page de l'hôtel lue le 29 octobre dit « Viñales Lounge ».
-- ════════════════════════════════════════════════════════

UPDATE `lounges` SET `source` = 'à vérifier — relu le 31 octobre 2026 : padron.com (ne liste que le bureau de Miami) ; cigar-coop.com, 2023 : usine Tabacos Cubanica S.A., centre d''Estelí. Aucune boutique ouverte au public attestée par une page lue ; peut désigner la même usine que la fiche voisine Padrón Cigars Factory.',
  `description` = 'Fiche à vérifier. Padrón fabrique ses cigares à Estelí, au Nicaragua. Aucune boutique ouverte au public n''est attestée par une source lue ; la fiche peut désigner la même usine que la fiche voisine Padrón Cigars Factory.',
  `description_en` = 'Entry to be verified. Padrón makes its cigars in Estelí, Nicaragua. No shop open to the public is attested by any source read; the entry may refer to the same factory as the neighbouring Padrón Cigars Factory entry.',
  `description_es` = 'Ficha por verificar. Padrón fabrica sus cigarros en Estelí, Nicaragua. Ninguna fuente leída acredita una tienda abierta al público; la ficha puede referirse a la misma fábrica que la ficha vecina Padrón Cigars Factory.',
  `description_de` = 'Eintrag noch zu prüfen. Padrón fertigt seine Zigarren in Estelí, Nicaragua. Ein für die Öffentlichkeit geöffnetes Geschäft ist durch keine gelesene Quelle belegt; der Eintrag kann dieselbe Fabrik meinen wie der benachbarte Eintrag Padrón Cigars Factory.',
  `description_zh` = '待核实条目。Padrón在尼加拉瓜埃斯特利制作雪茄。没有任何已读来源证明这里有对公众开放的商店；该条目可能与相邻的Padrón Cigars Factory条目指的是同一家工厂。',
  `description_ar` = 'إدخال قيد التحقق. تصنع Padrón سيجارها في إستيلي بنيكاراغوا. لا يثبت أي مصدر مقروء وجود متجر مفتوح للجمهور، وقد يشير هذا الإدخال إلى المصنع نفسه الذي يشير إليه الإدخال المجاور Padrón Cigars Factory.',
  `updated_at` = NOW()
 WHERE `id` = 179;

UPDATE `lounges` SET `source` = 'à vérifier — relu le 31 octobre 2026 : drewestate.com et communiqué du 13 décembre 2019 : visites guidées et programme Cigar Safari à La Gran Fabrica ; visites de 2025 relevées dans des résultats de recherche. Lounge ouvert au public, réservation et adresse non attestés par une page lue.',
  `description` = 'La Gran Fabrica de Drew Estate, à Estelí, au Nicaragua, accueille des visites guidées, dont le programme Cigar Safari. L''existence d''un lounge ouvert au public et ses conditions d''accès ne sont pas attestées par une source lue.',
  `description_en` = 'Drew Estate''s La Gran Fabrica, in Estelí, Nicaragua, hosts guided tours, including the Cigar Safari programme. No source read attests a lounge open to the public or its terms of access.',
  `description_es` = 'La Gran Fabrica de Drew Estate, en Estelí, Nicaragua, ofrece visitas guiadas, entre ellas el programa Cigar Safari. Ninguna fuente leída acredita un salón abierto al público ni sus condiciones de acceso.',
  `description_de` = 'Drew Estates La Gran Fabrica in Estelí, Nicaragua, bietet Führungen an, darunter das Programm Cigar Safari. Ein öffentlich zugänglicher Lounge und seine Zugangsbedingungen sind durch keine gelesene Quelle belegt.',
  `description_zh` = 'Drew Estate位于尼加拉瓜埃斯特利的La Gran Fabrica提供导览参观，包括Cigar Safari项目。没有任何已读来源证明这里有对公众开放的雪茄室及其进入条件。',
  `description_ar` = 'يستقبل مصنع La Gran Fabrica التابع لـ Drew Estate في إستيلي بنيكاراغوا زيارات مصحوبة بمرشد، منها برنامج Cigar Safari. لا يثبت أي مصدر مقروء وجود صالون مفتوح للجمهور ولا شروط الدخول إليه.',
  `updated_at` = NOW()
 WHERE `id` = 180;

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'lounges', l.`id`, 'description', g.lang, SHA1(l.`description`), 'machine', NOW()
  FROM `lounges` l
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de' UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') g
 WHERE l.`id` IN (179, 180)
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `statut` = 'machine', `maj` = NOW();

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 322';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 322', 'systeme', 'fiches_relues', 'systeme', 0, 'Esteli : 179 et 180 ramenees a ce qui est atteste, lues le 31 octobre 2026');

-- Contrôle : des 1 partout.
SELECT
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (179, 180) AND `source` LIKE 'à vérifier — relu le 31 octobre 2026%') = 2 AS `sources`,
  (SELECT COUNT(*) FROM `translation_status` t JOIN `lounges` l ON l.`id` = t.`entite_id` WHERE t.`entite` = 'lounges' AND t.`champ` = 'description' AND l.`id` IN (179, 180) AND t.`source_hash` = SHA1(l.`description`)) = 10 AS `sceaux`;
