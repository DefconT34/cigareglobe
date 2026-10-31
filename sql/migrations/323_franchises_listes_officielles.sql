-- ════════════════════════════════════════════════════════
-- 323 — Franchises : 15 confirmées par les listes officielles, 1 doublon retiré
-- ────────────────────────────────────────────────────────
-- CE QU'ON A TROUVÉ (31 octobre 2026). Les deux listes officielles ont été lues à la machine. Habanos S.A. : les 4 436 pages
-- « place » de habanos.com (plan de site), avec adresse et pays. La Casa del Habano : les catégories du plan des franchises de
-- lacasadelhabano.com (pays et villes ; le localisateur n'expose pas les adresses). Davidoff : le localisateur davidoff.com,
-- onglet par onglet (55 boutiques en propre, 14 partenaires, 1 636 dépositaires).
-- Confirmées (adresse concordante sur la liste officielle, plus une seconde lecture) : La Casa del Habano de Hambourg (Chilehaus),
-- Athènes, Doha (The Pearl), l'aéroport de Bahreïn, Beyrouth (Verdun), Saint-Kitts, l'Hostal Conde Villanueva (classé
-- Habanos Lounge par habanos.com), Melbourne ; Davidoff New York (515 Madison, nom corrigé : la fiche disait 535), Las Vegas,
-- Sydney, Bruxelles (Sablon), Bucarest (Băneasa), Belgrade (numéro 2 au localisateur, 11 sur le site de la boutique :
-- divergence écrite), Londres (dépositaire agréé). Descriptions réécrites en six langues pour Athènes, Bahreïn et Hambourg,
-- dont les anciens textes disaient le statut de franchise non établi. #117 est le doublon de #365 (même adresse de Ginza).
-- Non confirmées, laissées « à vérifier » : Saint-Pétersbourg (habanos.com : 9 Ligovskiy, la fiche dit Bolshoï prospekt),
-- Esch Café Rio (habanos.com : Leblon ; la fiche dit Centro), Lima (autre centre commercial), Tokyo Cigar Club (Azabudai,
-- non Nishiazabu), Casa Partagás (Industria), Doha Al Rayyan (classé « Otros »). Absentes des pages habanos.com mais
-- présentes au plan lacasadelhabano.com : Jamaïque, Caïmans, Saint-Martin, Guatemala, Bogotá, Tenerife, Madrid. Singapour
-- (Fullerton) est absente des deux listes, mais l'hôtel la publie : rien n'est retiré. Aucune absence de Davidoff ne se conclut
-- (le localisateur ne couvre ni l'Afrique, ni le Moyen-Orient, ni la plupart des villes d'Asie).
-- ════════════════════════════════════════════════════════

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : habanos.com, page « La Casa del Habano Hamburg » : Burchardstr. 15, Chilehaus C, Hambourg ; lacasadelhabano.com, plan des franchises : catégorie Hamburgo ; habanos.com, 13 juin 2025 : autre Casa à Hambourg (famille Duske)',
  `description` = 'La Casa del Habano de Hambourg, au Chilehaus (Burchardstraße 15), bâtiment de 1924 inscrit au patrimoine mondial de l''UNESCO avec le quartier des Kontorhäuser. Habanos S.A. la répertorie à cette adresse, et le plan des franchises lacasadelhabano.com cite Hambourg ; d''autres Casas figurent dans la ville.',
  `description_en` = 'La Casa del Habano in Hamburg, in the Chilehaus (Burchardstraße 15), a 1924 building listed as a UNESCO World Heritage Site with the Kontorhaus district. Habanos S.A. lists it at this address, and the franchise map of lacasadelhabano.com names Hamburg; other Casas are listed in the city.',
  `description_es` = 'La Casa del Habano de Hamburgo, en el Chilehaus (Burchardstraße 15), edificio de 1924 inscrito en el Patrimonio Mundial de la UNESCO con el barrio de los Kontorhäuser. Habanos S.A. la incluye en esta dirección y el mapa de franquicias de lacasadelhabano.com cita Hamburgo; en la ciudad figuran otras Casas.',
  `description_de` = 'La Casa del Habano in Hamburg, im Chilehaus (Burchardstraße 15), einem Gebäude von 1924, das mit dem Kontorhausviertel zum UNESCO-Welterbe gehört. Habanos S.A. verzeichnet sie unter dieser Adresse, und der Franchise-Plan von lacasadelhabano.com nennt Hamburg; in der Stadt gibt es weitere Casas.',
  `description_zh` = '汉堡的La Casa del Habano，位于智利大楼（Chilehaus，Burchardstraße 15号），这座1924年建成的建筑与办公楼区一同列入联合国教科文组织世界遗产。Habanos S.A.在此地址列出该店，lacasadelhabano.com的加盟店地图也列有汉堡；该市另有其他Casa。',
  `description_ar` = 'لا كاسا ديل هابانو في هامبورغ، في مبنى تشيلهاوس (Burchardstraße 15)، وهو مبنى يعود إلى عام 1924 ومدرج في التراث العالمي لليونسكو مع حي الكونتورهاوس. تدرجها Habanos S.A. في هذا العنوان، وتذكر خريطة الامتياز على lacasadelhabano.com هامبورغ؛ وتوجد في المدينة كازات أخرى.',
  `updated_at` = NOW()
 WHERE `id` = 35 AND `is_verified` = 1;

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : habanos.com, page « La Casa Del Habano Athens, Greece » : K. Varnali 42, N. Erithrea ; lacasadelhabano.com, plan des franchises : catégorie Atenas ; puroaccessori.gr : même adresse, rubrique Habanos Specialist',
  `description` = 'La Casa del Habano d''Athènes, au 42 K. Varnali, à Nea Erythraia, répertoriée par habanos.com et par le plan des franchises lacasadelhabano.com. Le magasin Puro Accessori occupe la même adresse.',
  `description_en` = 'La Casa del Habano in Athens, at K. Varnali 42 in Nea Erythraia, listed by habanos.com and by the franchise map of lacasadelhabano.com. The Puro Accessori shop is at the same address.',
  `description_es` = 'La Casa del Habano de Atenas, en K. Varnali 42, en Nea Erythraia, incluida en habanos.com y en el mapa de franquicias de lacasadelhabano.com. La tienda Puro Accessori está en la misma dirección.',
  `description_de` = 'La Casa del Habano in Athen, K. Varnali 42 in Nea Erythraia, verzeichnet auf habanos.com und im Franchise-Plan von lacasadelhabano.com. Das Geschäft Puro Accessori befindet sich unter derselben Adresse.',
  `description_zh` = '雅典的La Casa del Habano，位于Nea Erythraia的K. Varnali 42号，已列入habanos.com和lacasadelhabano.com的加盟店地图。Puro Accessori店铺位于同一地址。',
  `description_ar` = 'لا كاسا ديل هابانو في أثينا، العنوان K. Varnali 42 في نيا إريثريا، وهي مدرجة في habanos.com وفي خريطة الامتياز على lacasadelhabano.com. ويقع متجر Puro Accessori في العنوان نفسه.',
  `updated_at` = NOW()
 WHERE `id` = 94 AND `is_verified` = 1;

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : habanos.com, page « Casa Del Habano » : Pearl, Porto Arabia, Parcel 1, Doha ; lacasadelhabano.com, plan des franchises : catégorie Doha (« LCDH Doha The Pearl », lacasadelhabano.com, lu le 30 octobre 2026)',
  `updated_at` = NOW()
 WHERE `id` = 101 AND `is_verified` = 1;

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : habanos.com, page « La Casa Del Habano – Airport » : Bahrain Duty-Free Shop, aéroport international de Bahreïn ; lacasadelhabano.com, plan des franchises : catégorie Manama ; habanos.com, 30 sept. 2021 : Habanos Specialist et Habanos Lounge du même duty free',
  `description` = 'La Casa del Habano de l''aéroport international de Bahreïn, dans la boutique de Bahrain Duty Free, répertoriée par habanos.com et par le plan des franchises lacasadelhabano.com. Les pages plus anciennes de habanos.com ne la désignaient que comme Habanos Specialist et Habanos Lounge.',
  `description_en` = 'La Casa del Habano at Bahrain International Airport, in the Bahrain Duty Free shop, listed by habanos.com and by the franchise map of lacasadelhabano.com. Older habanos.com pages described it only as a Habanos Specialist and Habanos Lounge.',
  `description_es` = 'La Casa del Habano del aeropuerto internacional de Baréin, en la tienda de Bahrain Duty Free, incluida en habanos.com y en el mapa de franquicias de lacasadelhabano.com. Páginas más antiguas de habanos.com la describían solo como Habanos Specialist y Habanos Lounge.',
  `description_de` = 'La Casa del Habano am Internationalen Flughafen Bahrain, im Geschäft von Bahrain Duty Free, verzeichnet auf habanos.com und im Franchise-Plan von lacasadelhabano.com. Ältere Seiten von habanos.com nannten sie nur Habanos Specialist und Habanos Lounge.',
  `description_zh` = '巴林国际机场的La Casa del Habano，位于巴林免税店内，已列入habanos.com和lacasadelhabano.com的加盟店地图。habanos.com较早的页面仅将其列为Habanos Specialist和Habanos Lounge。',
  `description_ar` = 'لا كاسا ديل هابانو في مطار البحرين الدولي، داخل متجر Bahrain Duty Free، وهي مدرجة في habanos.com وفي خريطة الامتياز على lacasadelhabano.com. وكانت صفحات habanos.com الأقدم تصفها فقط بأنها Habanos Specialist وHabanos Lounge.',
  `updated_at` = NOW()
 WHERE `id` = 106 AND `is_verified` = 1;

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : habanos.com, page « La Casa Del Habano – Beirut » : Verdun Main Street, Saab Building ; lacasadelhabano.com, plan des franchises : catégorie Beirut (lacasadelhabano.com, Verdun, Down Town, lu le 29 octobre 2026)',
  `updated_at` = NOW()
 WHERE `id` = 109 AND `is_verified` = 1;

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : habanos.com, page « La Casa Del Habano Saint Kitts And Nevis » : Building 29, Port Zante, Basseterre ; lacasadelhabano.com, plan des franchises : catégorie Basseterre ; lacasadelhabano.kn, site officiel',
  `updated_at` = NOW()
 WHERE `id` = 171 AND `is_verified` = 1;

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : habanos.com, page « Lcdh Conde De Villanueva » : Mercaderes, Amargura y Lamparrilla, La Havane, classée Habanos Lounge/Habanos Terrace et non La Casa del Habano ; lacasadelhabano.com, plan des franchises : catégorie La Habana ; lacasadelhabano.com (Calle Mercaderes, esq. Amargura, lu le 29 octobre 2026)',
  `updated_at` = NOW()
 WHERE `id` = 176 AND `is_verified` = 1;

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : habanos.com, page « La Casa del Habano » : Ground Floor, Grand Hyatt Melbourne, Melbourne 3000 ; lacasadelhabano.com, plan des franchises : catégorie Australia (LCDH Melbourne et LCDH Sydney, lacasadelhabano.com, lu le 29 octobre 2026)',
  `updated_at` = NOW()
 WHERE `id` = 197 AND `is_verified` = 1;

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : localisateur davidoff.com (55 boutiques en propre, 14 partenaires, 1 636 dépositaires), onglet des boutiques en propre : « Davidoff of Geneva since 1911 – Madison », 515 Madison Ave, New York, NY 10022 ; cigaraficionado.com, 19 août 2025 : flagship au 515, réouverture après rénovation. Le magazine de pipes qui cite le 535 date d''avant le déménagement de 2010',
  `name` = 'Davidoff of Geneva — New York (515 Madison Ave)',
  `updated_at` = NOW()
 WHERE `id` = 146 AND `is_verified` = 1;

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : localisateur davidoff.com (55 boutiques en propre, 14 partenaires, 1 636 dépositaires), onglet des boutiques en propre : Las Vegas, 3200 S Las Vegas Blvd #1245, NV 89109 ; davidoffcigarbarlv.com : même adresse (page non datée). Le Palazzo, 3325 Las Vegas Blvd, est l''adresse antérieure',
  `updated_at` = NOW()
 WHERE `id` = 415 AND `is_verified` = 1;

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : localisateur davidoff.com (55 boutiques en propre, 14 partenaires, 1 636 dépositaires), onglet des boutiques en propre : Sydney The Strand Arcade, 412-414 George Street, Shop 29, NSW 2000 ; cigarjournal.com, 7 mai 2025 : première boutique Davidoff of Geneva d''Australie',
  `updated_at` = NOW()
 WHERE `id` = 2574 AND `is_verified` = 1;

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : localisateur davidoff.com (55 boutiques en propre, 14 partenaires, 1 636 dépositaires), onglet des boutiques en propre : « Sablon », Pl. du Grand Sablon 1, 1000 Bruxelles ; cigarjournal.com, annuaire non daté : même adresse',
  `updated_at` = NOW()
 WHERE `id` = 2575 AND `is_verified` = 1;

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : localisateur davidoff.com (55 boutiques en propre, 14 partenaires, 1 636 dépositaires), onglet des boutiques en propre : Șoseaua București-Ploiești 42D, Bucarest 15011 ; baneasa.ro : page Magasin Davidoff du centre commercial, même adresse',
  `updated_at` = NOW()
 WHERE `id` = 2577 AND `is_verified` = 1;

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : localisateur davidoff.com (55 boutiques en propre, 14 partenaires, 1 636 dépositaires), onglet des boutiques en propre : Đure Jakšića 2, 11000 Beograd ; davidoffshop.rs : Đure Jakšića 11, opérateur Julieta Plus d.o.o. Divergence de numéro (2 / 11), non tranchée',
  `updated_at` = NOW()
 WHERE `id` = 934 AND `is_verified` = 1;

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : davidofflondon.com, page contact : 35 St. James''s Street, SW1A 1HD ; localisateur davidoff.com, onglet des dépositaires agréés (1 636) : « Davidoff of London », même adresse ; non boutique en propre',
  `updated_at` = NOW()
 WHERE `id` = 276 AND `is_verified` = 1;

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 31 octobre 2026 : doublon de #365 ; même adresse (Ginza 8-5-6, Chuo City) que la boutique en propre du localisateur davidoff.com (lu le 31 octobre 2026), déjà fiche à part', `updated_at` = NOW()
 WHERE `id` = 117 AND `is_verified` = 1;

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'lounges', l.`id`, 'description', g.lang, SHA1(l.`description`), 'machine', NOW()
  FROM `lounges` l
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de' UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') g
 WHERE l.`id` IN (35, 94, 106)
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `statut` = 'machine', `maj` = NOW();

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 323';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 323', 'systeme', 'fiches_relues', 'systeme', 0, 'Franchises : 15 confirmees par les listes officielles, 1 doublon retire (117), lus le 31 octobre 2026');

-- Contrôle : des 1 partout.
SELECT
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (35, 94, 101, 106, 109, 171, 176, 197, 146, 415, 2574, 2575, 2577, 934, 276) AND `source` LIKE 'relu le 31 octobre 2026%') = 15 AS `confirmees`,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` = 117 AND `is_verified` = 0 AND `source` LIKE 'RETIRÉ — relu le 31 octobre 2026%') = 1 AS `retiree`,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` = 146 AND `name` LIKE '%515 Madison%') = 1 AS `nom`,
  (SELECT COUNT(*) FROM `translation_status` t JOIN `lounges` l ON l.`id` = t.`entite_id` WHERE t.`entite` = 'lounges' AND t.`champ` = 'description' AND l.`id` IN (35, 94, 106) AND t.`source_hash` = SHA1(l.`description`)) = 15 AS `sceaux`;
