-- ════════════════════════════════════════════════════════
-- 146 — Malaisie et Singapour : deux enseignes interverties
-- ────────────────────────────────────────────────────────
-- NOUVEAU CHANTIER, MÊME MÉTHODE. La migration 141 a relabellé
-- vingt-huit fiches qui revendiquent une affiliation officielle — La
-- Casa del Habano, Cohiba Atmosphere, Davidoff — sans autre source que
-- le site lui-même. Une affiliation est un fait qui concerne un TIERS :
-- elle décrit une relation commerciale entre une enseigne et Habanos
-- S.A. ou Davidoff, et l'affirmer sur sa propre autorité n'est pas une
-- source. On les reprend, en commençant par la Malaisie et Singapour.
--
-- ── UNE PISTE MESURÉE, ET ABANDONNÉE ─────────────────────
-- Ces vingt-huit fiches viennent d'un import du 22 mars 2026 qui en a
-- posé cinquante-sept d'un coup, toutes avec un téléphone et AUCUNE
-- avec un site, des horaires ou des coordonnées. J'ai cherché à les
-- disqualifier en bloc par la forme de leurs numéros : 44,6 % du lot
-- finissent par un motif décoratif (8888, 0202, 6600) contre 21,2 %
-- dans le reste du corpus.
--
-- L'écart s'effondre dès qu'on compare À PAYS ÉGAL : 42,1 % contre
-- 38,5 %. L'import est concentré en Asie et en Amérique latine, où les
-- standards téléphoniques sont ronds de toute façon — 8888 est
-- recherché en Malaisie, à Singapour, au Vietnam. Le premier chiffre ne
-- mesurait que la composition géographique du lot.
--
-- C'est la deuxième hypothèse de ce genre que la mesure réfute, après
-- celle sur le « PDF officiel Habanos S.A. ». Il n'y a pas de raccourci
-- statistique : chaque fiche se vérifie une par une.
--
-- ── CE QUE LA VÉRIFICATION A TROUVÉ : UNE INVERSION ──────
-- À Kuala Lumpur, l'import place La Casa del Habano au PAVILION et
-- Davidoff à SURIA KLCC. C'est exactement l'inverse :
--
--   · La Casa del Habano de Malaisie est UNIQUE, au Mandarin Oriental,
--     niveau P1, depuis 1998. Elle est DÉJÀ dans l'atlas — la fiche
--     #134, avec le bon numéro (+60 3 2380 1311) et une vraie source.
--     #2508 en est un doublon posé à une adresse qui n'est pas la
--     sienne.
--   · Le magasin du Pavilion est le DAVIDOFF, Lot 2.33.02, niveau 2,
--     Couture Pavilion — le centre commercial le publie lui-même.
--
-- Même figure à Singapour : l'import met La Casa del Habano à Marina
-- Bay Sands et Davidoff à Ngee Ann City. Or c'est DAVIDOFF qui est à
-- Marina Bay Sands, The Shoppes le publie ; et les points de vente
-- Habanos de Singapour sont ceux de la Pacific Cigar Company — Four
-- Seasons, Nehsons Building, UE Square — dont aucun n'est à MBS.
--
-- L'erreur n'est pas un détail d'adresse : elle attribue à une maison
-- la boutique d'une autre, dans les deux sens.
--
-- ── CE QUI N'EXISTE PAS ──────────────────────────────────
-- #2510 Penang (Gurney Plaza) et #2513 Johor Bahru (Paradigm Mall) :
-- l'exploitant malaisien publie ses adresses sur lcdh.com.my et n'en
-- annonce qu'une seule pour La Casa del Habano. Habanos S.A. a fêté
-- « les vingt ans de La Casa del Habano EN MALAISIE » au singulier.
--
-- #2512 « Mandarin Oriental KL — Cigar Lounge » décrit le salon de
-- l'hôtel où se trouve précisément la fiche #134 : c'est le même lieu,
-- compté deux fois.
--
-- ── ET UNE QUI MANQUAIT ──────────────────────────────────
-- Le même exploitant annonce un COHIBA ATMOSPHERE au 20 Jalan
-- Teknologi 3/4, Kota Damansara, Petaling Jaya. L'atlas l'ignorait. On
-- l'ajoute : la source est l'exploitant lui-même, ce qui est la source
-- normale pour une affiliation — un franchisé qui nomme sa propre
-- enseigne, et non un site tiers qui la lui prête.
--
-- L'identifiant est ÉCRIT (2558), comme la migration 143 l'a établi :
-- AUTO_INCREMENT ne vaut que pour une base, et deux bases finiraient
-- avec deux adresses publiques pour la même fiche.
--
-- ── TÉLÉPHONES ──────────────────────────────────────────
-- Celui de #2515 est effacé plutôt que conservé : rien ne l'atteste, et
-- un numéro faux fait sonner chez quelqu'un qui n'a rien demandé.
-- Raisonnement de la migration 139.
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/sources.php --figer
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

-- ── Kuala Lumpur : Davidoff est au Pavilion ──────────────
UPDATE `lounges` SET
  `name`    = 'Davidoff — Kuala Lumpur (Pavilion KL)',
  `city`    = 'Kuala Lumpur — Pavilion KL, Lot 2.33.02, niveau 2, Couture Pavilion, 168 Jalan Bukit Bintang',
  `phone`   = '+60 3 2141 1466',
  `hours`   = '10h–22h',
  `website` = 'https://www.pavilion-kl.com/store/davidoff/',
  `source`  = 'pavilion-kl.com',

  `description`    = 'Magasin phare Davidoff de Kuala Lumpur, au deuxième niveau du Pavilion, dans l''aile Couture. Quarante-deux mètres carrés au concept « Davidoff of Geneva – since 1911 ».',

  `description_en` = 'Davidoff flagship store in Kuala Lumpur, on level two of Pavilion, in the Couture wing. Forty-two square metres built to the "Davidoff of Geneva – since 1911" concept.',

  `description_es` = 'Tienda insignia de Davidoff en Kuala Lumpur, en el segundo nivel de Pavilion, en el ala Couture. Cuarenta y dos metros cuadrados con el concepto «Davidoff of Geneva – since 1911».',

  `description_de` = 'Davidoff-Flagshipstore in Kuala Lumpur, auf Ebene zwei des Pavilion, im Couture-Flügel. Zweiundvierzig Quadratmeter nach dem Konzept „Davidoff of Geneva – since 1911".',

  `description_zh` = '大卫杜夫在吉隆坡的旗舰店，位于柏威年广场二层 Couture 区。面积四十二平方米，按「Davidoff of Geneva – since 1911」概念设计。',

  `description_ar` = 'المتجر الرئيسي لدافيدوف في كوالالمبور، في الطابق الثاني من مركز بافيليون، جناح كوتور. اثنان وأربعون مترًا مربعًا وفق مفهوم «Davidoff of Geneva – since 1911».',

  `updated_at` = NOW()
 WHERE `id` = 2509 AND `country_id` = 'malaysia';

UPDATE `translation_status`
   SET `source_hash` = (SELECT SHA1(`description`) FROM `lounges` WHERE `id` = 2509),
       `statut` = 'machine', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2509' AND `champ` = 'description';

-- ── Singapour : Davidoff est à Marina Bay Sands ──────────
UPDATE `lounges` SET
  `name`    = 'Davidoff of Geneva — Marina Bay Sands',
  `city`    = 'Singapour — The Shoppes at Marina Bay Sands, 10 Bayfront Avenue',
  `phone`   = NULL,
  `website` = 'https://www.marinabaysands.com/shopping/davidoff-of-geneva.html',
  `source`  = 'marinabaysands.com',

  `description`    = 'Boutique Davidoff des Shoppes at Marina Bay Sands. Humidor accessible, accessoires et un coin dédié aux spiritueux ; la marque y présente aussi d''autres cigares premium.',

  `description_en` = 'Davidoff boutique at The Shoppes at Marina Bay Sands. Walk-in humidor, accessories and a dedicated spirits corner; the store also carries other premium cigar brands.',

  `description_es` = 'Boutique Davidoff en The Shoppes at Marina Bay Sands. Humidor accesible, accesorios y un rincón dedicado a los destilados; la tienda ofrece también otras marcas de puros premium.',

  `description_de` = 'Davidoff-Boutique in The Shoppes at Marina Bay Sands. Begehbarer Humidor, Accessoires und eine eigene Spirituosenecke; das Geschäft führt auch andere Premiumzigarren.',

  `description_zh` = '位于滨海湾金沙购物商城的大卫杜夫专门店。设步入式恒湿雪茄柜、配件区与烈酒专区，并陈列其他高端雪茄品牌。',

  `description_ar` = 'متجر دافيدوف في ذا شوبس بمارينا باي ساندز. مستودع ترطيب يمكن دخوله، وإكسسوارات، وركن مخصّص للمشروبات الروحية؛ ويعرض المتجر أيضًا ماركات سيجار فاخرة أخرى.',

  `updated_at` = NOW()
 WHERE `id` = 2515 AND `country_id` = 'singapore';

UPDATE `translation_status`
   SET `source_hash` = (SELECT SHA1(`description`) FROM `lounges` WHERE `id` = 2515),
       `statut` = 'machine', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '2515' AND `champ` = 'description';

-- ── Les doublons et les adresses inventées ───────────────
UPDATE `lounges`
   SET `is_verified` = 0,
       `source`      = 'RETIRÉ — doublon de la seule La Casa del Habano du pays, à une adresse qui n''est pas la sienne',
       `updated_at`  = NOW()
 WHERE `id` IN (2508, 2514);

UPDATE `lounges`
   SET `is_verified` = 0,
       `source`      = 'RETIRÉ — l''exploitant du réseau n''annonce pas cette adresse',
       `updated_at`  = NOW()
 WHERE `id` IN (2510, 2513);

UPDATE `lounges`
   SET `is_verified` = 0,
       `source`      = 'RETIRÉ — même lieu que la fiche 134, compté deux fois',
       `updated_at`  = NOW()
 WHERE `id` = 2512 AND `country_id` = 'malaysia';

-- ── Le Cohiba Atmosphere que l'atlas ignorait ────────────
INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`,
   `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
VALUES (
  2558,
  'malaysia',
  'Cohiba Atmosphere — Kota Damansara',
  'Petaling Jaya — 20 Jalan Teknologi 3/4, Kota Damansara',
  'Cohiba Atmosphere Officiel',
  'https://lcdh.com.my/',
  'lcdh.com.my',
  1,

  'Salon Cohiba Atmosphere de la région de Kuala Lumpur, à Kota Damansara, tenu par l''exploitant de La Casa del Habano de Malaisie.',

  'Cohiba Atmosphere lounge in the Kuala Lumpur area, at Kota Damansara, run by the operator of La Casa del Habano Malaysia.',

  'Salón Cohiba Atmosphere del área de Kuala Lumpur, en Kota Damansara, gestionado por el operador de La Casa del Habano de Malasia.',

  'Cohiba-Atmosphere-Lounge im Großraum Kuala Lumpur, in Kota Damansara, betrieben vom Betreiber von La Casa del Habano Malaysia.',

  '位于吉隆坡地区哥打白沙罗的 Cohiba Atmosphere 雪茄吧，由马来西亚 La Casa del Habano 的经营者管理。',

  'صالة كوهيبا أتموسفير في منطقة كوالالمبور، بكوتا دامانسارا، يديرها مشغّل لا كاسا ديل هابانو في ماليزيا.',

  NOW(), NOW()
);

INSERT INTO `translation_status`
  (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'lounges', 2558, 'description', l.`lang`,
       (SELECT SHA1(`description`) FROM `lounges` WHERE `id` = 2558),
       'machine', NOW()
  FROM (SELECT 'en' AS `lang` UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') AS l;

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 146','systeme','fiche_corrigee','lounge',2509,'le magasin du Pavilion KL est le Davidoff, Lot 2.33.02 niveau 2, et non La Casa del Habano ; source pavilion-kl.com'),
  (NULL,'migration 146','systeme','fiche_corrigee','lounge',2515,'Davidoff Singapour est a Marina Bay Sands et non a Ngee Ann City ; telephone non atteste efface ; source marinabaysands.com'),
  (NULL,'migration 146','systeme','lounge_retire','lounge',2508,'La Casa del Habano de Malaisie est unique, au Mandarin Oriental — deja la fiche 134'),
  (NULL,'migration 146','systeme','lounge_retire','lounge',2514,'Marina Bay Sands abrite Davidoff ; les points Habanos de Singapour sont ceux de Pacific Cigar (Four Seasons, Nehsons, UE Square)'),
  (NULL,'migration 146','systeme','lounge_retire','lounge',2510,'lcdh.com.my n annonce aucune adresse a Penang'),
  (NULL,'migration 146','systeme','lounge_retire','lounge',2513,'lcdh.com.my n annonce aucune adresse a Johor Bahru'),
  (NULL,'migration 146','systeme','lounge_retire','lounge',2512,'le salon cigares du Mandarin Oriental KL est La Casa del Habano elle-meme, fiche 134'),
  (NULL,'migration 146','systeme','fiche_ajoutee','lounge',2558,'Cohiba Atmosphere de Kota Damansara, annonce par l exploitant malaisien sur lcdh.com.my');
