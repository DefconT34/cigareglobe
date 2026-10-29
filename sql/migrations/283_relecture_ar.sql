-- ════════════════════════════════════════════════════════
-- 283 — Relecture ar
-- ────────────────────────────────────────────────────────
-- Relecture des traductions « ar » par : expert-traduction (agent).
-- Fichier de verdicts : verdicts_p4_ar.json ; generee par tools/i18n_relecture.php le 2026-10-29.
-- Un texte « corrige » est reecrit ; tout texte relu passe au statut « relu »,
-- avec le nom du relecteur. L'empreinte du francais est verifiee dans le WHERE :
-- un francais qui a change depuis l'export ne se laisse pas declarer relu.
-- ════════════════════════════════════════════════════════

-- habanos_presence|brazil|description|ar — صيغة تفضيل محظورة
UPDATE `habanos_presence` SET `description_ar` = 'ليس للبرازيل تمثيل لدى هابانوس. ويقوم تأثيرها العالمي على تبغ ماتا فينا من باهيا، وهو من أغلفة المادورو الطبيعية الشديدة الطلب. وتستعمله علامات مثل Arturo Fuente Añejo وPadrón 1926 Maduro وCAO. أما في السوق المحلية فتُوزَّع Dannemann، العلامة الوطنية، في ما يزيد على ثمانين بلدًا.'
 WHERE `country_id` = 'brazil' AND SHA1(TRIM(`description`)) = 'e27a15b795ccf2b79ad0559e3194cc60bc223ad4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'brazil' AND `champ` = 'description' AND `lang` = 'ar' AND `source_hash` = 'e27a15b795ccf2b79ad0559e3194cc60bc223ad4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'habanos_presence' AND `entite_id` = 'mexico' AND `champ` = 'description' AND `lang` = 'ar' AND `source_hash` = '54853c00efdf352465831da82bd6ff2397cfba15';
-- lounges|1|description|ar — إضافة «الأول» وعبارة محظورة
UPDATE `lounges` SET `description_ar` = 'افتُتح في السادس من كانون الثاني/يناير 2025 على يد الأخوين كمال وتشاران داسواني. مئة وستون مترًا مربعًا: مستودع ترطيب يمكن دخوله بمساحة 120 م² يضمّ ما يزيد على 450 صنفًا من سيجار هابانوس، وصالة تدخين بمساحة 120 م² تتّسع لمئة وخمسين شخصًا. يفتح من العاشرة صباحًا حتى الثانية فجرًا. المجموعة قائمة منذ 1980، وقد افتتحه زينو دافيدوف بنفسه.'
 WHERE `id` = '1' AND SHA1(TRIM(`description`)) = 'd86cb4aaa4fed70545f6e75ad34d4a48da9f8dfd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1' AND `champ` = 'description' AND `lang` = 'ar' AND `source_hash` = 'd86cb4aaa4fed70545f6e75ad34d4a48da9f8dfd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '11' AND `champ` = 'description' AND `lang` = 'ar' AND `source_hash` = 'f9bf70c6150be2cdec22eafbce3f14f252af0d80';
-- lounges|25|description|ar — إضافة «الفاخرة» وعبارة محظورة
UPDATE `lounges` SET `description_ar` = 'تأسّست عام 1716 وظلّت تعمل دون انقطاع منذ ذلك الحين. من زبائنها التاريخيين: دانتون ونابليون وروبسبير وميرابو وديغا وجورج ساند. ما يزيد على 350 صنفًا من كوبا وهندوراس ونيكاراغوا وجمهورية الدومينيكان، إضافة إلى الغلايين والمشروبات الروحية.'
 WHERE `id` = '25' AND SHA1(TRIM(`description`)) = '9add4375115d51ed75270ee164f73bd14562bc92';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '25' AND `champ` = 'description' AND `lang` = 'ar' AND `source_hash` = '9add4375115d51ed75270ee164f73bd14562bc92';
-- lounges|34|description|ar — مستودع الترطيب وعبارة محظورة
UPDATE `lounges` SET `description_ar` = 'أكبر صالة سيجار في ألمانيا، تأسّست عام 2005. ما يزيد على 3000 صنف، ومستودع ترطيب احترافي يمكن دخوله، وقاعات تذوّق مكيّفة في دوسلدورف.'
 WHERE `id` = '34' AND SHA1(TRIM(`description`)) = '119ebc47799861d1ca4e705dbdedea8c1f3c1476';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '34' AND `champ` = 'description' AND `lang` = 'ar' AND `source_hash` = '119ebc47799861d1ca4e705dbdedea8c1f3c1476';
-- lounges|132|description|ar — بقايا فرنسية وترجمة خاطئة
UPDATE `lounges` SET `description_ar` = 'متجر ديفيدوف الرائد في سنغافورة داخل مركز التسوق الراقي ION Orchard. مستودع ترطيب يضم ما يزيد على 1000 صنف.'
 WHERE `id` = '132' AND SHA1(TRIM(`description`)) = 'c48192d58ab670591d761d2232c1351748c3f880';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '132' AND `champ` = 'description' AND `lang` = 'ar' AND `source_hash` = 'c48192d58ab670591d761d2232c1351748c3f880';
-- lounges|278|description|ar — نص مبتور أُكمل
UPDATE `lounges` SET `description_ar` = 'شرفة السيجار الخاصة في فندق The Ritz London، 150 Piccadilly. متاحة للأعضاء ونزلاء الفندق؛ كوكتيلات مميّزة، وعنوان يخدم الأسرة المالكة منذ ما يزيد على قرن.'
 WHERE `id` = '278' AND SHA1(TRIM(`description`)) = '06d65a309e7fa9e6abd9957d3a005208923c20f4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '278' AND `champ` = 'description' AND `lang` = 'ar' AND `source_hash` = '06d65a309e7fa9e6abd9957d3a005208923c20f4';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '935' AND `champ` = 'description' AND `lang` = 'ar' AND `source_hash` = '13990c6b9aff9826a5130f75df33815459394ee4';
-- lounges|1277|description|ar — عبارة محظورة
UPDATE `lounges` SET `description_ar` = 'فندق قصر أسطوري في بادن بادن. صالة سيجار في الأقبية المعقودة، مع اختيار يزيد على 200 صنف، يقصدها روّاد الكازينو والمنتجع الحراري.'
 WHERE `id` = '1277' AND SHA1(TRIM(`description`)) = '3455c58776547edde25cae7bba4b2846522e0d3d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1277' AND `champ` = 'description' AND `lang` = 'ar' AND `source_hash` = '3455c58776547edde25cae7bba4b2846522e0d3d';

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 283';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 283', 'systeme', 'traductions_relues', 'systeme', 0, 'Relecture « ar » par expert-traduction (agent) : 10 traduction(s) relue(s) — 7 corrigee(s), 3 validee(s) telles quelles ; habanos_presence 2, lounges 8');

SELECT
  (SELECT COUNT(*) FROM `translation_status` WHERE `lang` = 'ar' AND `statut` = 'relu' AND `relecteur` = 'expert-traduction (agent)') >= 10 AS relues,
  (SELECT COUNT(*) FROM `translation_status` WHERE `statut` = 'relu' AND (`relecteur` IS NULL OR `relecteur` = '')) = 0 AS chaque_relecture_a_son_relecteur;
SELECT `lang`, SUM(`statut` = 'relu') AS relues, COUNT(*) AS total FROM `translation_status` GROUP BY `lang`;
