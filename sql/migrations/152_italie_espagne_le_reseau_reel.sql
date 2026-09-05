-- ════════════════════════════════════════════════════════
-- 152 — Italie et Espagne : le réseau réel, et deux boutiques oubliées
-- ────────────────────────────────────────────────────────
-- Nouveau bloc : les quarante et une fiches que la migration 135 avait
-- relabellées « réseau La Casa del Habano, liste officielle non
-- recoupée ». Elles sont dispersées sur vingt-neuf pays ; on commence
-- par les deux plus fournis.
--
-- ── L'ITALIE EN A TROIS, ET L'ATLAS EN AVAIT SIX ─────────
-- Diadema S.p.A., distributeur officiel des havanes en Italie, a
-- annoncé l'ouverture de la TROISIÈME Casa del Habano du pays, « après
-- celle de Milan et de Rome ». C'est Naples.
--
-- L'atlas portait déjà Milan (#87, via Anfossi 28) et Rome (#88, via
-- Colonna Antonina 34), toutes deux sourcées. Restaient quatre fiches :
-- Florence, Venise, Naples, Bari.
--
--   #330 NAPLES est RÉELLE — mais ce n'est pas « via Chiaia 79 ». C'est
--        la Tabaccheria SISIMBRO, fondée en 1959 par Franco Sisimbro,
--        via San Pasquale a Chiaia 74, devenue Casa del Habano en 2019 —
--        la cent-cinquantième au monde. Le téléphone aussi était faux.
--   #326 Florence, #328 Venise, #332 Bari : il n'y en a que trois en
--        Italie, et ce sont Milan, Rome et Naples.
--
-- ── L'ESPAGNE : UNE LECTURE QUE J'AI DÛ CORRIGER ─────────
-- Le site `lacasadelhabano-dl.es` annonce DEUX boutiques, toutes deux
-- aux Canaries. J'ai failli en conclure que l'Espagne n'en avait que
-- deux. C'est faux : ce site est celui d'UN EXPLOITANT, pas du réseau
-- espagnol. Madrid en a — Habanos S.A. tient des pages pour deux
-- adresses madrilènes, Claudio Coello 56 et Plaza Perú 5.
--
-- Ce qui reste vrai après correction : « Paseo de la Castellana 36 »
-- (#246) ne figure dans aucune de ces sources, pas plus que Valence ou
-- Bilbao.
--
-- ON NE DEVINE PAS QUELLE FICHE PORTE QUELLE ADRESSE. Trois adresses
-- madrilènes circulent — Recoletos 1 que l'atlas porte déjà en #30,
-- sourcée par le PDF officiel, plus Claudio Coello et Plaza Perú. On
-- pouvait réécrire #246 avec l'une des deux ; ce serait choisir au
-- hasard laquelle la fiche « veut dire ». Elle est dépubliée, et les
-- deux adresses vont au journal pour un chantier qui saura les
-- départager.
--
-- ── DEUX BOUTIQUES QUE L'ATLAS IGNORAIT ──────────────────
-- L'exploitant canarien publie ses deux adresses en entier. Elles sont
-- ajoutées : c'est la première fois de ce chantier qu'une source donne
-- assez pour créer une fiche plutôt que pour en retirer une.
--
-- Identifiants ÉCRITS (2559, 2560), règle posée par la migration 143.
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/sources.php --figer
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

-- ── Naples : Sisimbro, et sa vraie rue ───────────────────
UPDATE `lounges` SET
  `name`   = 'La Casa del Habano — Napoli (Sisimbro)',
  `city`   = 'Napoli — Via San Pasquale a Chiaia 74, 80121',
  `phone`  = '+39 081 406983',
  `source` = 'habanos.com — fiche officielle La Casa del Habano Napoli',

  `description`    = 'Troisième Casa del Habano d''Italie, après Milan et Rome. La tabaccheria Sisimbro, ouverte en 1959 entre la piazza Amedeo et la piazza San Pasquale, a rejoint le réseau en 2019. Cave et salon pour fumer sur place.',

  `description_en` = 'Third Casa del Habano in Italy, after Milan and Rome. The Sisimbro tabaccheria, opened in 1959 between Piazza Amedeo and Piazza San Pasquale, joined the network in 2019. Humidor and a lounge for smoking on site.',

  `description_es` = 'Tercera Casa del Habano de Italia, tras Milán y Roma. La tabaccheria Sisimbro, abierta en 1959 entre la piazza Amedeo y la piazza San Pasquale, entró en la red en 2019. Humidor y salón para fumar in situ.',

  `description_de` = 'Dritte Casa del Habano Italiens, nach Mailand und Rom. Die Tabaccheria Sisimbro, 1959 zwischen Piazza Amedeo und Piazza San Pasquale eröffnet, kam 2019 ins Netz. Humidor und Lounge zum Rauchen vor Ort.',

  `description_zh` = '意大利第三家 La Casa del Habano，继米兰与罗马之后。Sisimbro 烟草行于 1959 年开设于阿梅代奥广场与圣帕斯夸莱广场之间，2019 年加入该网络。设雪茄柜与可现场吸烟的休息厅。',

  `description_ar` = 'ثالث «كاسا ديل هابانو» في إيطاليا، بعد ميلانو وروما. افتُتح متجر التبغ سيسيمبرو عام 1959 بين ساحة أميديو وساحة سان باسكوالي، وانضمّ إلى الشبكة عام 2019. مستودع ترطيب وصالة للتدخين في المكان.',

  `updated_at` = NOW()
 WHERE `id` = 330 AND `country_id` = 'italy';

UPDATE `translation_status`
   SET `source_hash` = (SELECT SHA1(`description`) FROM `lounges` WHERE `id` = 330),
       `statut` = 'machine', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '330' AND `champ` = 'description';

-- ── Les trois villes italiennes qui n'en ont pas ─────────
UPDATE `lounges`
   SET `is_verified` = 0,
       `source`      = 'RETIRÉ — l''Italie a trois Casa del Habano : Milan, Rome et Naples',
       `updated_at`  = NOW()
 WHERE `id` IN (326, 328, 332);

-- ── Les trois espagnoles que rien n'atteste ──────────────
UPDATE `lounges`
   SET `is_verified` = 0,
       `source`      = 'RETIRÉ — cette adresse ne figure dans aucune source du réseau espagnol',
       `updated_at`  = NOW()
 WHERE `id` IN (246, 253, 256);

-- ── Les deux Canaries, publiées par leur exploitant ──────
INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`,
   `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
VALUES
(2559, 'spain',
 'La Casa del Habano — Tenerife',
 'Costa Adeje (Tenerife) — Dukes Shopping Centre, avenida de Bruselas 14, local S1-24, 38679',
 'La Casa del Habano Officielle',
 'https://www.lacasadelhabano-dl.es/boutiques',
 'lacasadelhabano-dl.es',
 1,
 'Casa del Habano de Costa Adeje, dans le sud de Tenerife, au centre commercial Dukes.',
 'Casa del Habano in Costa Adeje, in the south of Tenerife, at the Dukes shopping centre.',
 'Casa del Habano de Costa Adeje, en el sur de Tenerife, en el centro comercial Dukes.',
 'Casa del Habano in Costa Adeje im Süden Teneriffas, im Einkaufszentrum Dukes.',
 '位于特内里费岛南部阿德赫海岸 Dukes 购物中心的 La Casa del Habano。',
 '«كاسا ديل هابانو» في كوستا أديخي، جنوب تينيريفي، داخل مركز دوكس التجاري.',
 NOW(), NOW()),

(2560, 'spain',
 'La Casa del Habano — Gran Canaria',
 'Puerto Rico de Gran Canaria — Centro Comercial Mogán Mall, avenida Tomás Roca Bosch 9, 35130',
 'La Casa del Habano Officielle',
 'https://www.lacasadelhabano-dl.es/boutiques',
 'lacasadelhabano-dl.es',
 1,
 'Casa del Habano de Puerto Rico de Gran Canaria, au centre commercial Mogán Mall.',
 'Casa del Habano in Puerto Rico de Gran Canaria, at the Mogán Mall shopping centre.',
 'Casa del Habano de Puerto Rico de Gran Canaria, en el centro comercial Mogán Mall.',
 'Casa del Habano in Puerto Rico de Gran Canaria, im Einkaufszentrum Mogán Mall.',
 '位于大加那利岛波多黎各镇 Mogán Mall 购物中心的 La Casa del Habano。',
 '«كاسا ديل هابانو» في بويرتو ريكو دي غران كناريا، داخل مركز موغان مول التجاري.',
 NOW(), NOW());

INSERT INTO `translation_status`
  (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'lounges', f.`fid`, 'description', l.`lang`,
       (SELECT SHA1(`description`) FROM `lounges` WHERE `id` = f.`fid`),
       'machine', NOW()
  FROM (SELECT 2559 AS `fid` UNION ALL SELECT 2560) AS f
  CROSS JOIN (SELECT 'en' AS `lang` UNION ALL SELECT 'es' UNION ALL SELECT 'de'
              UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') AS l;

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 152','systeme','fiche_corrigee','lounge',330,'Naples est la tabaccheria Sisimbro, via San Pasquale a Chiaia 74, entree au reseau en 2019 — pas via Chiaia 79 ; telephone corrige ; source habanos.com'),
  (NULL,'migration 152','systeme','lounge_retire','lounge',326,'l Italie a trois Casa del Habano : Milan, Rome, Naples (Diadema, distributeur officiel)'),
  (NULL,'migration 152','systeme','lounge_retire','lounge',328,'l Italie a trois Casa del Habano : Milan, Rome, Naples'),
  (NULL,'migration 152','systeme','lounge_retire','lounge',332,'l Italie a trois Casa del Habano : Milan, Rome, Naples'),
  (NULL,'migration 152','systeme','lounge_retire','lounge',246,'Paseo de la Castellana 36 ne figure dans aucune source du reseau ; Madrid a Claudio Coello 56 et Plaza Peru 5'),
  (NULL,'migration 152','systeme','lounge_retire','lounge',253,'aucune Casa del Habano attestee a Valence'),
  (NULL,'migration 152','systeme','lounge_retire','lounge',256,'aucune Casa del Habano attestee a Bilbao'),
  (NULL,'migration 152','systeme','fiche_ajoutee','lounge',2559,'La Casa del Habano Tenerife, Dukes Shopping Centre, Costa Adeje ; source lacasadelhabano-dl.es'),
  (NULL,'migration 152','systeme','fiche_ajoutee','lounge',2560,'La Casa del Habano Gran Canaria, Mogan Mall, Puerto Rico ; source lacasadelhabano-dl.es'),
  (NULL,'migration 152','systeme','a_documenter','lounge',0,'La Casa del Habano Madrid, Calle Claudio Coello 56, 28001 — adresse a recouper avant publication'),
  (NULL,'migration 152','systeme','a_documenter','lounge',0,'La Casa del Habano Madrid, Plaza Peru 5, 28016 — adresse a recouper avant publication');
