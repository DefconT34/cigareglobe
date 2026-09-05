-- ════════════════════════════════════════════════════════
-- 160 — Quatre dernières, dont une aux colonnes interverties
-- ────────────────────────────────────────────────────────
-- CE QUE LE SEUIL CACHAIT. La sonde de la 158 exigeait TROIS mots
-- français dans le même texte. Abaissée à deux, elle trouve quatre
-- fiches de plus — et une nuée de faux positifs espagnols, parce que
-- l'espagnol emploie vraiment « de la », « en el », « los ».
--
-- La leçon vaut d'être écrite : le seuil qui convient à l'allemand ne
-- convient pas à l'espagnol, et pas du tout au chinois. Dans une
-- colonne chinoise ou arabe, DEUX mots-outils français suffisent —
-- ces écritures n'en emploient aucun.
--
-- ── #421 : LES COLONNES SONT INTERVERTIES ────────────────
-- C'est le cas le plus retourné du lot. Sa colonne FRANÇAISE contient
-- de l'anglais :
--
--   description    : « Davidoff's iconic Rodeo Drive flagship in
--                     Beverly Hills. White-glove service… »
--   description_en : « Flagship Davidoff sur Rodeo Drive —
--                     localisation iconique, service blanc gant. »
--
-- Les cinq colonnes traduites portent la même phrase française. Ce
-- n'est pas une traduction ratée : c'est le texte source rangé du
-- mauvais côté, et l'anglais servi aux six langues.
--
-- Le français est donc RÉÉCRIT depuis l'anglais — le seul des deux qui
-- soit dans la langue de sa colonne — et le sceau suit.
--
-- ── #146 : trois langues sur cinq, dont l'anglais ────────
-- « Temple mondial Davidoff in New York. Cave 1 500+ references,
-- lounge VIP, cigares custom-made. » Deux mots ont bougé.
--
-- ── #682 et #1174 : le reste du français ─────────────────
-- « du quartier Xinyi — face à Taipei 101 » dans une colonne chinoise,
-- « le mall luxe du quartier Makati » dans une colonne arabe.
--
-- Statut inchangé : « machine ».
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

-- ── #146 New York ────────────────────────────────────────
UPDATE `lounges` SET
  `description_en` = 'Davidoff''s global flagship in New York. A humidor holding more than 1,500 references, a VIP lounge, and cigars made to order.',
  `description_zh` = '大卫杜夫在纽约的全球旗舰店。恒湿雪茄柜藏有逾一千五百款产品，另设贵宾休息厅，并提供定制雪茄服务。',
  `description_ar` = 'المتجر الرئيسي العالمي لدافيدوف في نيويورك. مستودع ترطيب يضمّ أكثر من ألف وخمسمئة صنف، وصالة لكبار الزوّار، وسيجار يُصنع حسب الطلب.',
  `updated_at` = NOW() WHERE `id` = 146;

-- ── #421 Beverly Hills : le français réécrit ─────────────
UPDATE `lounges` SET
  `description`    = 'Le vaisseau amiral de Davidoff sur Rodeo Drive, à Beverly Hills. Service attentif, collection Davidoff complète, casiers privés pour les clients réguliers.',
  `description_en` = 'Davidoff''s Rodeo Drive flagship in Beverly Hills. White-glove service, the complete Davidoff collection, and private humidor storage for regular clients.',
  `description_es` = 'La tienda insignia de Davidoff en Rodeo Drive, en Beverly Hills. Servicio esmerado, colección Davidoff completa y casilleros privados para los clientes habituales.',
  `description_de` = 'Davidoffs Flagshipstore am Rodeo Drive in Beverly Hills. Aufmerksamer Service, die vollständige Davidoff-Kollektion und private Humidorfächer für Stammkunden.',
  `description_zh` = '大卫杜夫在比佛利山罗迪欧大道的旗舰店。服务周到，陈列大卫杜夫完整系列，并为常客提供私人储柜。',
  `description_ar` = 'متجر دافيدوف الرئيسي في شارع روديو درايف ببيفرلي هيلز. خدمة دقيقة، وتشكيلة دافيدوف الكاملة، وخزائن ترطيب خاصة للزبائن الدائمين.',
  `updated_at` = NOW() WHERE `id` = 421;

-- ── #682 Taipei ──────────────────────────────────────────
UPDATE `lounges` SET
  `description_zh` = '大卫杜夫专门店，设于信义区新光三越旗舰店内，与台北 101 相对。',
  `description_ar` = 'متجر دافيدوف داخل الفرع الرئيسي لشين كونغ ميتسوكوشي بحي شينيي، قبالة برج تايبيه 101.',
  `updated_at` = NOW() WHERE `id` = 682;

-- ── #1174 Manille (dépubliée) ────────────────────────────
UPDATE `lounges` SET
  `description_ar` = '«لا كاسا ديل هابانو» داخل مركز غرينبلت 5 التجاري الفاخر، بحي ماكاتي في مانيلا.',
  `updated_at` = NOW() WHERE `id` = 1174;

-- ── Les sceaux ───────────────────────────────────────────
UPDATE `translation_status` t
  JOIN `lounges` l ON l.`id` = t.`entite_id`
   SET t.`source_hash` = SHA1(l.`description`), t.`statut` = 'machine', t.`maj` = NOW()
 WHERE t.`entite` = 'lounges' AND t.`champ` = 'description'
   AND t.`entite_id` IN ('146','421','682','1174');

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 160','systeme','colonnes_interverties','lounge',421,
   'la colonne FRANCAISE contenait de l anglais et les cinq colonnes traduites la meme phrase francaise : le texte source etait range du mauvais cote. Le francais est reecrit depuis l anglais, seul des deux a etre dans la langue de sa colonne'),
  (NULL,'migration 160','systeme','traductions_refaites','lounge',0,
   '#146 (en, zh, ar), #682 (zh, ar), #1174 (ar) : du francais restait dans les colonnes'),
  (NULL,'migration 160','systeme','seuil_par_langue','lounge',0,
   'le seuil de la sonde ne peut pas etre le meme pour toutes les langues : trois mots francais dans un texte allemand sont un defaut, deux dans un texte espagnol sont normaux (« de la », « en el »), et deux dans un texte chinois ou arabe sont deja de trop — ces ecritures n emploient aucun mot-outil latin');
