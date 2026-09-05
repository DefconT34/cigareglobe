-- ════════════════════════════════════════════════════════
-- 154 — Quatre adresses qui manquaient, et six qui ne manquaient pas
-- ────────────────────────────────────────────────────────
-- PREMIER CHANTIER QUI AJOUTE. Depuis la migration 142, dix migrations
-- de suite n'ont fait que retirer ou corriger. L'annuaire du réseau,
-- lu à la migration 153, a révélé une dizaine d'adresses réelles que
-- l'atlas semblait ignorer. Elles étaient consignées au journal sous
-- « a_documenter » ; ce chantier devait les publier.
--
-- ── VÉRIFICATION D'ABORD : SIX ÉTAIENT DÉJÀ LÀ ───────────
-- Avant d'écrire dix INSERT, on regarde ce que la base contient. Bien
-- en a pris :
--
--   Tokyo Azabudai   #116 « La Casa del Habano by Cigar Club Iikura »
--                    2-3-9 Azabudai, Minato-ku — la même
--   Pékin Westin     #122 — la même
--   Pékin St. Regis  #123 — la même
--   Montréal         #153, 1434 Sherbrooke Ouest — la même
--   Toronto          #154, Yorkville Avenue — la même
--   Tokyo Roppongi   #118 « Le Connaisseur — Roppongi » — la maison
--                    est là, sous son nom d'enseigne
--
-- Le fonds initial de l'atlas — les fiches à identifiant bas, sourcées
-- « PDF officiel Habanos S.A. » — est nettement plus juste que ce que
-- trois mois de corrections laissaient croire. Ce sont les 57 fiches de
-- l'import du 22 mars qui portaient le défaut, pas le socle.
--
-- ── DEUX ÉCARTS D'UN CHIFFRE, QU'ON NE TRANCHE PAS ───────
--   Toronto : l'atlas dit 113 Yorkville Avenue, l'annuaire 111. Un
--   numéro d'écart, deux sources, aucune raison de préférer l'une.
--   Tokyo Roppongi : l'atlas dit 1-14-1 Nishiazabu, l'annuaire DM Bldg
--   18-11, Roppongi 7-chome. Déménagement ou seconde adresse : on ne
--   sait pas.
--
-- Les deux vont au journal. Changer une adresse juste pour une autre
-- adresse également sourcée, sans savoir laquelle est à jour, c'est
-- déplacer le problème en croyant le résoudre.
--
-- ── ET UNE QUESTION OUVERTE SUR TEL-AVIV ─────────────────
-- #111 « La Casa del Habano — Tel Aviv (David InterContinental) » ne
-- figure pas à l'annuaire, qui ne connaît en Israël que Rishon LeZion
-- et Haïfa. Elle n'est PAS retirée : l'annuaire est un tiers, il peut
-- être incomplet, et #111 vient du fonds sourcé. Le doute est consigné,
-- pas tranché.
--
-- ── LES QUATRE QUI MANQUAIENT VRAIMENT ───────────────────
--   Hong Kong Island — la seconde de la ville, à Central
--   Rio de Janeiro Centro — le troisième Esch Café
--   Rishon LeZion et Haïfa — les deux Casa del Habano d'Israël,
--   exploitées sous l'enseigne Hermitage
--
-- Identifiants ÉCRITS (2561-2564), règle de la migration 143.
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/sources.php --figer
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`,
   `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
VALUES

(2561, 'hongkong',
 'La Casa del Habano — Hong Kong Island',
 'Hong Kong — 11/F, Loke Yew Building, 50-52 Queen''s Road Central, Central',
 'La Casa del Habano Officielle',
 'habanomag.com, d''après habanos.com', 1,
 'Seconde La Casa del Habano de Hong Kong, au onzième étage du Loke Yew Building, à Central. La première est au Sheraton de Kowloon. Approvisionnée par Pacific Cigar.',
 'Hong Kong''s second La Casa del Habano, on the eleventh floor of the Loke Yew Building in Central. The first is at the Sheraton in Kowloon. Supplied by Pacific Cigar.',
 'Segunda La Casa del Habano de Hong Kong, en la undécima planta del Loke Yew Building, en Central. La primera está en el Sheraton de Kowloon. Abastecida por Pacific Cigar.',
 'Zweite La Casa del Habano Hongkongs, im elften Stock des Loke Yew Building in Central. Die erste liegt im Sheraton in Kowloon. Beliefert von Pacific Cigar.',
 '香港第二家 La Casa del Habano，位于中环乐怡大厦十一楼。第一家在九龙喜来登酒店。由 Pacific Cigar 供货。',
 'ثاني «لا كاسا ديل هابانو» في هونغ كونغ، في الطابق الحادي عشر من مبنى لوك يو بحي سنترال. والأولى في فندق شيراتون بكولون. يزوّدها Pacific Cigar.',
 NOW(), NOW()),

(2562, 'brazil',
 'Esch Café — Rio Centro (La Casa del Habano)',
 'Rio de Janeiro — Rua do Rosário 107, Centro',
 'La Casa del Habano Officielle',
 'habanomag.com, d''après habanos.com', 1,
 'Troisième Casa del Habano du Brésil sous l''enseigne Esch Café, au centre de Rio. Les deux autres sont à Leblon et à São Paulo. Approvisionnée par Emporium Cigars.',
 'Brazil''s third Casa del Habano trading as Esch Café, in central Rio. The other two are in Leblon and São Paulo. Supplied by Emporium Cigars.',
 'Tercera Casa del Habano de Brasil bajo la enseña Esch Café, en el centro de Río. Las otras dos están en Leblon y São Paulo. Abastecida por Emporium Cigars.',
 'Dritte Casa del Habano Brasiliens unter dem Namen Esch Café, im Zentrum von Rio. Die beiden anderen liegen in Leblon und São Paulo. Beliefert von Emporium Cigars.',
 '巴西第三家以 Esch Café 为名的 Casa del Habano，位于里约市中心。另外两家在莱布隆与圣保罗。由 Emporium Cigars 供货。',
 'ثالث «كاسا ديل هابانو» في البرازيل تحت اسم إيش كافيه، في وسط ريو. والاثنتان الأخريان في ليبلون وساو باولو. يزوّدها Emporium Cigars.',
 NOW(), NOW()),

(2563, 'israel',
 'Hermitage Beyond Spirit — Rishon LeZion',
 'Rishon LeZion — 6 rue Yaldei Teheran',
 'La Casa del Habano Officielle',
 'habanomag.com, d''après habanos.com', 1,
 'Casa del Habano de Rishon LeZion, sous l''enseigne Hermitage. Approvisionnée par Barone Tobacco Trading, distributeur d''Habanos en Israël.',
 'Casa del Habano in Rishon LeZion, trading as Hermitage. Supplied by Barone Tobacco Trading, the Habanos distributor in Israel.',
 'Casa del Habano de Rishon LeZion, bajo la enseña Hermitage. Abastecida por Barone Tobacco Trading, distribuidor de Habanos en Israel.',
 'Casa del Habano in Rischon LeZion, unter dem Namen Hermitage. Beliefert von Barone Tobacco Trading, dem Habanos-Distributor in Israel.',
 '位于里雄莱锡安的 Casa del Habano，以 Hermitage 为店名。由以色列哈伯纳斯经销商 Barone Tobacco Trading 供货。',
 '«كاسا ديل هابانو» في ريشون لتسيون، تحت اسم هيرميتاج. يزوّدها Barone Tobacco Trading، موزّع هابانوس في إسرائيل.',
 NOW(), NOW()),

(2564, 'israel',
 'Hermitage — Haïfa',
 'Haïfa — centre commercial Ein-Hamifratz',
 'La Casa del Habano Officielle',
 'habanomag.com, d''après habanos.com', 1,
 'Casa del Habano de Haïfa, au centre commercial Ein-Hamifratz, sous l''enseigne Hermitage.',
 'Casa del Habano in Haifa, at the Ein-Hamifratz shopping centre, trading as Hermitage.',
 'Casa del Habano de Haifa, en el centro comercial Ein-Hamifratz, bajo la enseña Hermitage.',
 'Casa del Habano in Haifa, im Einkaufszentrum Ein-Hamifratz, unter dem Namen Hermitage.',
 '位于海法 Ein-Hamifratz 购物中心的 Casa del Habano，以 Hermitage 为店名。',
 '«كاسا ديل هابانو» في حيفا، داخل مركز عين همفراتس التجاري، تحت اسم هيرميتاج.',
 NOW(), NOW());

INSERT INTO `translation_status`
  (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'lounges', f.`fid`, 'description', l.`lang`,
       (SELECT SHA1(`description`) FROM `lounges` WHERE `id` = f.`fid`),
       'machine', NOW()
  FROM (SELECT 2561 AS `fid` UNION ALL SELECT 2562
        UNION ALL SELECT 2563 UNION ALL SELECT 2564) AS f
  CROSS JOIN (SELECT 'en' AS `lang` UNION ALL SELECT 'es' UNION ALL SELECT 'de'
              UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') AS l;

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 154','systeme','fiche_ajoutee','lounge',2561,'La Casa del Habano Hong Kong Island, 11/F Loke Yew Building, 50-52 Queen s Road Central'),
  (NULL,'migration 154','systeme','fiche_ajoutee','lounge',2562,'Esch Cafe Centro, Rua do Rosario 107, Rio de Janeiro — troisieme LCDH du Bresil'),
  (NULL,'migration 154','systeme','fiche_ajoutee','lounge',2563,'Hermitage Beyond Spirit, 6 Yaldei Teheran, Rishon LeZion'),
  (NULL,'migration 154','systeme','fiche_ajoutee','lounge',2564,'Hermitage, centre commercial Ein-Hamifratz, Haifa'),
  (NULL,'migration 154','systeme','deja_presentes','lounge',0,'six des dix adresses relevees a la migration 153 etaient DEJA dans l atlas : Tokyo Azabudai #116, Pekin Westin #122, Pekin St. Regis #123, Montreal #153, Toronto #154, Tokyo Roppongi #118. Le fonds initial est plus juste que les corrections ne le laissaient croire'),
  (NULL,'migration 154','systeme','ecart_non_tranche','lounge',154,'Toronto : l atlas dit 113 Yorkville Avenue, l annuaire 111. Deux sources, un chiffre d ecart, aucune raison de preferer l une'),
  (NULL,'migration 154','systeme','ecart_non_tranche','lounge',118,'Tokyo Roppongi : l atlas dit 1-14-1 Nishiazabu, l annuaire DM Bldg 18-11 Roppongi 7-chome. Demenagement ou seconde adresse, non tranche'),
  (NULL,'migration 154','systeme','doute_consigne','lounge',111,'Tel Aviv (David InterContinental) ne figure pas a l annuaire, qui ne connait en Israel que Rishon LeZion et Haifa. Non retiree : l annuaire est un tiers et peut etre incomplet, et #111 vient du fonds source');
