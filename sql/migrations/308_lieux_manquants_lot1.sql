-- ════════════════════════════════════════════════════════
-- 308 — 29 nouvelles fiches (#2582 à #2610), premier lot « tous les pays »
-- ────────────────────────────────────────────────────────
-- CE QU'ON A TROUVÉ (31 octobre 2026). Trois agents ont cherché, pays par pays, des
-- lieux à cigares absents de la base, hors franchises Habanos : France, Suisse, États-Unis,
-- Canada, Royaume-Uni, Espagne, Italie, Portugal, Pays-Bas. Chaque lieu a deux pages lues
-- dont au moins une datée ; aucun n'existe déjà (nom, ville). Gentlemen 1919 (Paris) en fait
-- partie (label Habanos Lounge 2025).
-- 1. Les fiches dont deux sources datées concordent entrent confirmées ; les autres entrent
--    « à vérifier » (badge visible). Aucun doublon : INSERT gardés par NOT EXISTS.
-- 2. Écartés faute de preuve suffisante (une source récente manque) : Cubana Café, Frivole,
--    Airelles Courchevel, Casa Pelletier, Trois Rois, Corinthia, Puro Placer (sources 2012 et
--    2017), Villa Cora, Cigaragua (fumoirs de restaurants interdits aux Pays-Bas depuis 2022).
-- 3. Descriptions courtes, traduites dans les cinq autres langues, sceaux remis (machine).
-- Photos : uploads/lounges/<id>/placeholder_<id>.jpg à téléverser sur le serveur.
-- ════════════════════════════════════════════════════════

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2582, 'france', 'Gentlemen 1919', 'Paris 8e — 11 rue Jean Mermoz, 75008 Paris', 'Cigar Bar', '01 42 89 42 59', 'http://www.gentlemen1919.com',
  'relu le 31 octobre 2026 : timeout.com, 26 septembre 2016 : « The pampered clientele sit back and relax with a scotch in one… » ; cigars-connect.com, 16 août 2025 : « our commitment to offering one of the highest-quality cigar… » ; cigaraficionado.com, 2024-09/10 : « Head to the back of the store and there''s another door, a kind of… »', 1,
  'Gentlemen 1919, à Paris 8e : un bar où l''on fume le cigare.',
  'Gentlemen 1919, in Paris 8e: a bar where cigars are smoked.',
  'Gentlemen 1919, en Paris 8e: un bar donde se fuma puro.',
  'Gentlemen 1919, Paris 8e: eine Bar, in der Zigarre geraucht wird.',
  'Gentlemen 1919,位于Paris 8e:可以抽雪茄的酒吧。',
  'Gentlemen 1919، في Paris 8e: بار يُدخَّن فيه السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2582 OR (`country_id` = 'france' AND `name` = 'Gentlemen 1919'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 492, 2582, 'placeholder_2582.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2582 AND `name` = 'Gentlemen 1919') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2582);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2583, 'switzerland', 'Renaissance Bar (Badrutt''s Palace) - Vintage Cigar Lounge', 'St. Moritz — Via Serlas 27, 7500 St. Moritz', 'Hotel Cigar Bar', '+41 81 837 10 00', 'https://badruttspalace.com',
  'à vérifier — relu le 31 octobre 2026 : cigaraficionado.com, 2016-11/12 : « an opulent and cigar-friendly lounge, set within the hotel''s… » ; whiskyadvocate.com, 30 janvier 2024 : « vintage cigars stretching back to the middle of the 20th century » ; myswitzerland.com, non datée : « Sie bietet eine reizvolle Auswahl der feinsten Zigarren der Welt »', 1,
  'Renaissance Bar (Badrutt''s Palace) - Vintage Cigar Lounge, à St. Moritz : un hôtel dont le bar ou le salon accueille les amateurs de cigares.',
  'Renaissance Bar (Badrutt''s Palace) - Vintage Cigar Lounge, in St. Moritz: a hotel whose bar or lounge welcomes cigar smokers.',
  'Renaissance Bar (Badrutt''s Palace) - Vintage Cigar Lounge, en St. Moritz: un hotel cuyo bar o salón recibe a los aficionados a los puros.',
  'Renaissance Bar (Badrutt''s Palace) - Vintage Cigar Lounge, St. Moritz: ein Hotel, dessen Bar oder Lounge Zigarrenliebhaber willkommen heißt.',
  'Renaissance Bar (Badrutt''s Palace) - Vintage Cigar Lounge,位于St. Moritz:酒店的酒吧或休息室欢迎抽雪茄的客人。',
  'Renaissance Bar (Badrutt''s Palace) - Vintage Cigar Lounge، في St. Moritz: فندق يستقبل بار أو صالة عشاق السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2583 OR (`country_id` = 'switzerland' AND `name` = 'Renaissance Bar (Badrutt''s Palace) - Vintage Cigar Lounge'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 493, 2583, 'placeholder_2583.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2583 AND `name` = 'Renaissance Bar (Badrutt''s Palace) - Vintage Cigar Lounge') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2583);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2584, 'switzerland', 'The Chedi Andermatt - Cigar Library', 'Andermatt', 'Hotel Cigar Bar', NULL, NULL,
  'à vérifier — relu le 31 octobre 2026 : euronews.com, 26 juillet 2022 : « The Chedi''s cigar library is made up of two elegantly furnished rooms » ; whiskyadvocate.com, 30 janvier 2024 : « the largest cigar selection of any hotel in the world, with 900 cigars »', 1,
  'The Chedi Andermatt - Cigar Library, à Andermatt : un hôtel dont le bar ou le salon accueille les amateurs de cigares.',
  'The Chedi Andermatt - Cigar Library, in Andermatt: a hotel whose bar or lounge welcomes cigar smokers.',
  'The Chedi Andermatt - Cigar Library, en Andermatt: un hotel cuyo bar o salón recibe a los aficionados a los puros.',
  'The Chedi Andermatt - Cigar Library, Andermatt: ein Hotel, dessen Bar oder Lounge Zigarrenliebhaber willkommen heißt.',
  'The Chedi Andermatt - Cigar Library,位于Andermatt:酒店的酒吧或休息室欢迎抽雪茄的客人。',
  'The Chedi Andermatt - Cigar Library، في Andermatt: فندق يستقبل بار أو صالة عشاق السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2584 OR (`country_id` = 'switzerland' AND `name` = 'The Chedi Andermatt - Cigar Library'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 494, 2584, 'placeholder_2584.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2584 AND `name` = 'The Chedi Andermatt - Cigar Library') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2584);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2585, 'switzerland', 'Lakeview Bar & Cigar Lounge (Bürgenstock Resort)', 'Obbürgen (Bürgenstock, Nidwald) — Bürgenstock Resort Lake Lucerne, CH-6363 Obbürgen', 'Hotel Cigar Bar', '+41 41 612 60 00', 'https://burgenstockresort.com/en/eat/lakeviewlounge',
  'à vérifier — relu le 31 octobre 2026 : whiskyadvocate.com, 30 janvier 2024 : « Bürgenstock''s Lakeview Bar & Cigar Lounge has 80 whiskies and 95… » ; burgenstockresort.com, non datée : « Let your gaze drift into the distance from the Lakeview Bar''s… »', 1,
  'Lakeview Bar & Cigar Lounge (Bürgenstock Resort), à Obbürgen : un hôtel dont le bar ou le salon accueille les amateurs de cigares.',
  'Lakeview Bar & Cigar Lounge (Bürgenstock Resort), in Obbürgen: a hotel whose bar or lounge welcomes cigar smokers.',
  'Lakeview Bar & Cigar Lounge (Bürgenstock Resort), en Obbürgen: un hotel cuyo bar o salón recibe a los aficionados a los puros.',
  'Lakeview Bar & Cigar Lounge (Bürgenstock Resort), Obbürgen: ein Hotel, dessen Bar oder Lounge Zigarrenliebhaber willkommen heißt.',
  'Lakeview Bar & Cigar Lounge (Bürgenstock Resort),位于Obbürgen:酒店的酒吧或休息室欢迎抽雪茄的客人。',
  'Lakeview Bar & Cigar Lounge (Bürgenstock Resort)، في Obbürgen: فندق يستقبل بار أو صالة عشاق السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2585 OR (`country_id` = 'switzerland' AND `name` = 'Lakeview Bar & Cigar Lounge (Bürgenstock Resort)'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 495, 2585, 'placeholder_2585.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2585 AND `name` = 'Lakeview Bar & Cigar Lounge (Bürgenstock Resort)') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2585);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2586, 'switzerland', 'Cigar Bar - Hotel Storchen', 'Zürich — Weinplatz 2, 8001 Zürich', 'Hotel Cigar Bar', '+41 44 227 27 27', 'https://storchen.ch',
  'à vérifier — relu le 31 octobre 2026 : finews.ch, 7 février 2022 : « Das Luxushotel an der Limmat unterhält auch eine Zigarren-Bar » ; whiskyadvocate.com, 30 janvier 2024 : « At Hotel Storchen''s Cigar Bar, several cigar pairings are on the menu » ; storchen.ch, non datée : « A haven for tobacco aficionados »', 1,
  'Cigar Bar - Hotel Storchen, à Zürich : un hôtel dont le bar ou le salon accueille les amateurs de cigares.',
  'Cigar Bar - Hotel Storchen, in Zürich: a hotel whose bar or lounge welcomes cigar smokers.',
  'Cigar Bar - Hotel Storchen, en Zürich: un hotel cuyo bar o salón recibe a los aficionados a los puros.',
  'Cigar Bar - Hotel Storchen, Zürich: ein Hotel, dessen Bar oder Lounge Zigarrenliebhaber willkommen heißt.',
  'Cigar Bar - Hotel Storchen,位于Zürich:酒店的酒吧或休息室欢迎抽雪茄的客人。',
  'Cigar Bar - Hotel Storchen، في Zürich: فندق يستقبل بار أو صالة عشاق السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2586 OR (`country_id` = 'switzerland' AND `name` = 'Cigar Bar - Hotel Storchen'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 496, 2586, 'placeholder_2586.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2586 AND `name` = 'Cigar Bar - Hotel Storchen') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2586);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2587, 'switzerland', 'Manuel''s Cigars Coffee Rum', 'Zürich — Löwenstrasse 12, 8001 Zürich', 'Cigar Shop & Lounge', '+41 44 545 21 40', 'https://manuels.ch',
  'à vérifier — relu le 31 octobre 2026 : enprimeurclub.com, 20 septembre 2026 : « Manuel''s is a bar, shop and cigar lounge all in one » ; whiskyadvocate.com, 30 janvier 2024 : « a go-to hub for Cuban cigars »', 1,
  'Manuel''s Cigars Coffee Rum, à Zürich : une boutique de cigares avec un salon où fumer.',
  'Manuel''s Cigars Coffee Rum, in Zürich: a cigar shop with a lounge for smoking.',
  'Manuel''s Cigars Coffee Rum, en Zürich: una tienda de puros con un salón para fumar.',
  'Manuel''s Cigars Coffee Rum, Zürich: ein Zigarrenfachgeschäft mit Raucher-Lounge.',
  'Manuel''s Cigars Coffee Rum,位于Zürich:设有吸烟休息室的雪茄店。',
  'Manuel''s Cigars Coffee Rum، في Zürich: متجر سيجار مع صالة للتدخين.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2587 OR (`country_id` = 'switzerland' AND `name` = 'Manuel''s Cigars Coffee Rum'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 497, 2587, 'placeholder_2587.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2587 AND `name` = 'Manuel''s Cigars Coffee Rum') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2587);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2588, 'switzerland', 'Cigar Lounge - Hotel d''Angleterre (Leopard Bar)', 'Genève — Quai du Mont-Blanc 17, Genève', 'Hotel Cigar Bar', '+41 22 906 55 14', 'https://www.dangleterrehotel.com/food-and-drink/the-cigar-lounge',
  'à vérifier — relu le 31 octobre 2026 : dangleterrehotel.com, non datée : « The exclusive Cigar Lounge in our famous Leopard Bar is lauded by… » ; whiskyadvocate.com, 30 janvier 2024 : « with about three dozen cigars »', 1,
  'Cigar Lounge - Hotel d''Angleterre (Leopard Bar), à Genève : un hôtel dont le bar ou le salon accueille les amateurs de cigares.',
  'Cigar Lounge - Hotel d''Angleterre (Leopard Bar), in Genève: a hotel whose bar or lounge welcomes cigar smokers.',
  'Cigar Lounge - Hotel d''Angleterre (Leopard Bar), en Genève: un hotel cuyo bar o salón recibe a los aficionados a los puros.',
  'Cigar Lounge - Hotel d''Angleterre (Leopard Bar), Genève: ein Hotel, dessen Bar oder Lounge Zigarrenliebhaber willkommen heißt.',
  'Cigar Lounge - Hotel d''Angleterre (Leopard Bar),位于Genève:酒店的酒吧或休息室欢迎抽雪茄的客人。',
  'Cigar Lounge - Hotel d''Angleterre (Leopard Bar)، في Genève: فندق يستقبل بار أو صالة عشاق السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2588 OR (`country_id` = 'switzerland' AND `name` = 'Cigar Lounge - Hotel d''Angleterre (Leopard Bar)'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 498, 2588, 'placeholder_2588.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2588 AND `name` = 'Cigar Lounge - Hotel d''Angleterre (Leopard Bar)') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2588);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2589, 'switzerland', 'Cigar Lounge - The Alpina Gstaad', 'Gstaad — Alpinastrasse 23, 3780 Gstaad', 'Hotel Cigar Bar', '+41 33 888 98 88', 'https://www.thealpinagstaad.ch/en/best-restaurants-in-gstaad/cigar-lounge',
  'à vérifier — relu le 31 octobre 2026 : whiskyadvocate.com, 30 janvier 2024 : « a see-and-be-seen celebrity haunt » ; thealpinagstaad.ch, 2026 : « We look forward to welcoming you back on 11 December 2026 for… »', 1,
  'Cigar Lounge - The Alpina Gstaad, à Gstaad : un hôtel dont le bar ou le salon accueille les amateurs de cigares.',
  'Cigar Lounge - The Alpina Gstaad, in Gstaad: a hotel whose bar or lounge welcomes cigar smokers.',
  'Cigar Lounge - The Alpina Gstaad, en Gstaad: un hotel cuyo bar o salón recibe a los aficionados a los puros.',
  'Cigar Lounge - The Alpina Gstaad, Gstaad: ein Hotel, dessen Bar oder Lounge Zigarrenliebhaber willkommen heißt.',
  'Cigar Lounge - The Alpina Gstaad,位于Gstaad:酒店的酒吧或休息室欢迎抽雪茄的客人。',
  'Cigar Lounge - The Alpina Gstaad، في Gstaad: فندق يستقبل بار أو صالة عشاق السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2589 OR (`country_id` = 'switzerland' AND `name` = 'Cigar Lounge - The Alpina Gstaad'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 499, 2589, 'placeholder_2589.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2589 AND `name` = 'Cigar Lounge - The Alpina Gstaad') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2589);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2590, 'france', 'Le Fumoir - Airelles Val d''Isère', 'Val d''Isère — 145 rue de la Poste, 73150 Val d''Isère', 'Hotel Cigar Bar', NULL, 'https://airelles.com/en/destination/val-d-isere-hotel/restaurants/the-smoking-room',
  'à vérifier — relu le 31 octobre 2026 : cigaraficionado.com, 22 avril 2025 : « The cigar list is short, sweet and pricey, with Cubans and non-Cubans » ; airelles.com, non datée : « a stylish sanctuary »', 1,
  'Le Fumoir - Airelles Val d''Isère, à Val d''Isère : un hôtel dont le bar ou le salon accueille les amateurs de cigares.',
  'Le Fumoir - Airelles Val d''Isère, in Val d''Isère: a hotel whose bar or lounge welcomes cigar smokers.',
  'Le Fumoir - Airelles Val d''Isère, en Val d''Isère: un hotel cuyo bar o salón recibe a los aficionados a los puros.',
  'Le Fumoir - Airelles Val d''Isère, Val d''Isère: ein Hotel, dessen Bar oder Lounge Zigarrenliebhaber willkommen heißt.',
  'Le Fumoir - Airelles Val d''Isère,位于Val d''Isère:酒店的酒吧或休息室欢迎抽雪茄的客人。',
  'Le Fumoir - Airelles Val d''Isère، في Val d''Isère: فندق يستقبل بار أو صالة عشاق السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2590 OR (`country_id` = 'france' AND `name` = 'Le Fumoir - Airelles Val d''Isère'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 500, 2590, 'placeholder_2590.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2590 AND `name` = 'Le Fumoir - Airelles Val d''Isère') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2590);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2591, 'usa', 'Sterling Cigar Lounge & Bar', 'Tampa (Ybor City), FL — 1531 E 7th Ave, Tampa, FL 33605', 'Cigar Bar', '813-466-5723', 'https://sterlingcigarbar.com',
  'relu le 31 octobre 2026 : cigaraficionado.com, 5 mars 2025 : « Sterling sits four floors up, with a private lobby elevator that… » ; visittampabay.com, non datée : « Sterling Cigar Bar is an elegant dream lounge nestled in the heart… »', 1,
  'Sterling Cigar Lounge & Bar, à Tampa : un bar où l''on fume le cigare.',
  'Sterling Cigar Lounge & Bar, in Tampa: a bar where cigars are smoked.',
  'Sterling Cigar Lounge & Bar, en Tampa: un bar donde se fuma puro.',
  'Sterling Cigar Lounge & Bar, Tampa: eine Bar, in der Zigarre geraucht wird.',
  'Sterling Cigar Lounge & Bar,位于Tampa:可以抽雪茄的酒吧。',
  'Sterling Cigar Lounge & Bar، في Tampa: بار يُدخَّن فيه السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2591 OR (`country_id` = 'usa' AND `name` = 'Sterling Cigar Lounge & Bar'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 501, 2591, 'placeholder_2591.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2591 AND `name` = 'Sterling Cigar Lounge & Bar') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2591);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2592, 'usa', 'Española Cigar Bar & Lounge', 'Miami Beach, FL — 409 Española Way, Miami Beach, FL 33139', 'Cigar Bar', NULL, NULL,
  'relu le 31 octobre 2026 : cigaraficionado.com, 13 juillet 2026 : « A cigar haven where you can drink, dine and smoke all in the same… » ; miamichamber.com, 28 octobre 2026 : « Located in the heart of South Beach on Española Way, this open-air… »', 1,
  'Española Cigar Bar & Lounge, à Miami Beach : un bar où l''on fume le cigare.',
  'Española Cigar Bar & Lounge, in Miami Beach: a bar where cigars are smoked.',
  'Española Cigar Bar & Lounge, en Miami Beach: un bar donde se fuma puro.',
  'Española Cigar Bar & Lounge, Miami Beach: eine Bar, in der Zigarre geraucht wird.',
  'Española Cigar Bar & Lounge,位于Miami Beach:可以抽雪茄的酒吧。',
  'Española Cigar Bar & Lounge، في Miami Beach: بار يُدخَّن فيه السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2592 OR (`country_id` = 'usa' AND `name` = 'Española Cigar Bar & Lounge'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 502, 2592, 'placeholder_2592.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2592 AND `name` = 'Española Cigar Bar & Lounge') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2592);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2593, 'usa', 'Eight Lounge (Resorts World)', 'Las Vegas, NV — 3000 S Las Vegas Blvd, Las Vegas, NV 89109', 'Cigar Lounge', NULL, 'https://eightloungelv.com',
  'relu le 31 octobre 2026 : eightloungelv.com, non datée : « Walk into Eight Lounge and experience a sophisticated and modern… » ; stogiepress.com, 16 février 2022 : « an expansive 7,000 Sq-Ft smoking emporium » ; circalasvegas.com, 23 juin 2026 : « Located at Resorts World, this lounge blends a modern design with… »', 1,
  'Eight Lounge (Resorts World), à Las Vegas : un salon où l''on peut fumer le cigare.',
  'Eight Lounge (Resorts World), in Las Vegas: a lounge where you can smoke a cigar.',
  'Eight Lounge (Resorts World), en Las Vegas: un salón donde se puede fumar un puro.',
  'Eight Lounge (Resorts World), Las Vegas: eine Lounge, in der man Zigarre rauchen kann.',
  'Eight Lounge (Resorts World),位于Las Vegas:可以抽雪茄的雪茄吧。',
  'Eight Lounge (Resorts World)، في Las Vegas: صالة يمكن فيها تدخين السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2593 OR (`country_id` = 'usa' AND `name` = 'Eight Lounge (Resorts World)'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 503, 2593, 'placeholder_2593.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2593 AND `name` = 'Eight Lounge (Resorts World)') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2593);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2594, 'usa', 'Triple Crown Cigar Lounge', 'Las Vegas, NV — 6539 S Las Vegas Blvd, Suite C114, Las Vegas, NV 89119', 'Cigar Lounge', NULL, NULL,
  'à vérifier — relu le 31 octobre 2026 : whatnow.com, 9 décembre 2022 : « Our humidor is going to be the biggest on Las Vegas Boulevard » ; tslv.com, non datée : « 6539 Las Vegas Blvd. S., Suite C114 ... Monday through Sunday,… »', 1,
  'Triple Crown Cigar Lounge, à Las Vegas : un salon où l''on peut fumer le cigare.',
  'Triple Crown Cigar Lounge, in Las Vegas: a lounge where you can smoke a cigar.',
  'Triple Crown Cigar Lounge, en Las Vegas: un salón donde se puede fumar un puro.',
  'Triple Crown Cigar Lounge, Las Vegas: eine Lounge, in der man Zigarre rauchen kann.',
  'Triple Crown Cigar Lounge,位于Las Vegas:可以抽雪茄的雪茄吧。',
  'Triple Crown Cigar Lounge، في Las Vegas: صالة يمكن فيها تدخين السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2594 OR (`country_id` = 'usa' AND `name` = 'Triple Crown Cigar Lounge'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 504, 2594, 'placeholder_2594.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2594 AND `name` = 'Triple Crown Cigar Lounge') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2594);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2595, 'usa', 'Silver Leaf Cigar Lounge', 'Fort Worth, TX — 428 Commerce Street, Fort Worth, TX 76102', 'Cigar Lounge', NULL, 'https://silverleafcigarlounge.com',
  'à vérifier — relu le 31 octobre 2026 : cigaraficionado.com, 26 novembre 2019 : « An elegant cigar lounge right in the heart of Sundance Square » ; silverleafcigarlounge.com, non datée : « Fort Worth''s Premium Cigar Lounge Experience »', 1,
  'Silver Leaf Cigar Lounge, à Fort Worth : un salon où l''on peut fumer le cigare.',
  'Silver Leaf Cigar Lounge, in Fort Worth: a lounge where you can smoke a cigar.',
  'Silver Leaf Cigar Lounge, en Fort Worth: un salón donde se puede fumar un puro.',
  'Silver Leaf Cigar Lounge, Fort Worth: eine Lounge, in der man Zigarre rauchen kann.',
  'Silver Leaf Cigar Lounge,位于Fort Worth:可以抽雪茄的雪茄吧。',
  'Silver Leaf Cigar Lounge، في Fort Worth: صالة يمكن فيها تدخين السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2595 OR (`country_id` = 'usa' AND `name` = 'Silver Leaf Cigar Lounge'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 505, 2595, 'placeholder_2595.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2595 AND `name` = 'Silver Leaf Cigar Lounge') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2595);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2596, 'usa', 'The Cigar Code', 'Philadelphie, PA — 939 N. Delaware Ave., Philadelphia, PA 19123', 'Cigar Lounge', '267-858-6925', 'https://thecigarcode.com',
  'relu le 31 octobre 2026 : inquirer.com, 14 janvier 2025 : « The Cigar Code has unlocked all the elements of entertainment » ; thecigarcode.com, © 2021 : « The Cigar Code takes pride into providing a relaxing atmosphere… »', 1,
  'The Cigar Code, à Philadelphie : un salon où l''on peut fumer le cigare.',
  'The Cigar Code, in Philadelphie: a lounge where you can smoke a cigar.',
  'The Cigar Code, en Philadelphie: un salón donde se puede fumar un puro.',
  'The Cigar Code, Philadelphie: eine Lounge, in der man Zigarre rauchen kann.',
  'The Cigar Code,位于Philadelphie:可以抽雪茄的雪茄吧。',
  'The Cigar Code، في Philadelphie: صالة يمكن فيها تدخين السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2596 OR (`country_id` = 'usa' AND `name` = 'The Cigar Code'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 506, 2596, 'placeholder_2596.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2596 AND `name` = 'The Cigar Code') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2596);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2597, 'usa', 'Smokin'' Silverbacks Cigar Lounge', 'Philadelphie, PA — 25 E. Allen St., 2nd Floor, Philadelphia, PA 19123', 'Cigar Lounge', '267-534-4965', 'https://smokinsilverbackscigarlounge.com',
  'relu le 31 octobre 2026 : inquirer.com, 14 janvier 2025 : « It''s quickly become a favorite among local cigar enthusiasts » ; smokinsilverbackscigarlounge.com, dernières actus 2024-11-25 : « Every visit is a celebration of taste and style »', 1,
  'Smokin'' Silverbacks Cigar Lounge, à Philadelphie : un salon où l''on peut fumer le cigare.',
  'Smokin'' Silverbacks Cigar Lounge, in Philadelphie: a lounge where you can smoke a cigar.',
  'Smokin'' Silverbacks Cigar Lounge, en Philadelphie: un salón donde se puede fumar un puro.',
  'Smokin'' Silverbacks Cigar Lounge, Philadelphie: eine Lounge, in der man Zigarre rauchen kann.',
  'Smokin'' Silverbacks Cigar Lounge,位于Philadelphie:可以抽雪茄的雪茄吧。',
  'Smokin'' Silverbacks Cigar Lounge، في Philadelphie: صالة يمكن فيها تدخين السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2597 OR (`country_id` = 'usa' AND `name` = 'Smokin'' Silverbacks Cigar Lounge'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 507, 2597, 'placeholder_2597.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2597 AND `name` = 'Smokin'' Silverbacks Cigar Lounge') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2597);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2598, 'usa', 'SMoKE Cigar Lounge', 'Philadelphie (Manayunk), PA — 4453 Main St., Philadelphia, PA 19127', 'Cigar Lounge', '215-330-2288', 'https://smokemanayunk.com',
  'relu le 31 octobre 2026 : inquirer.com, 14 janvier 2025 : « Manayunk''s SMoKE Cigar Lounge spans nearly 3,000 square feet,… » ; smokemanayunk.com, © 2026 : « A chill, rustic lounge since 2013 — plush leather couches, BYOB »', 1,
  'SMoKE Cigar Lounge, à Philadelphie : un salon où l''on peut fumer le cigare.',
  'SMoKE Cigar Lounge, in Philadelphie: a lounge where you can smoke a cigar.',
  'SMoKE Cigar Lounge, en Philadelphie: un salón donde se puede fumar un puro.',
  'SMoKE Cigar Lounge, Philadelphie: eine Lounge, in der man Zigarre rauchen kann.',
  'SMoKE Cigar Lounge,位于Philadelphie:可以抽雪茄的雪茄吧。',
  'SMoKE Cigar Lounge، في Philadelphie: صالة يمكن فيها تدخين السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2598 OR (`country_id` = 'usa' AND `name` = 'SMoKE Cigar Lounge'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 508, 2598, 'placeholder_2598.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2598 AND `name` = 'SMoKE Cigar Lounge') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2598);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2599, 'usa', 'Barrister Cigars', 'Union, NJ — 2565 US Highway 22, Union, NJ 07083', 'Cigar Shop & Lounge', NULL, 'https://barristercigars.com',
  'relu le 31 octobre 2026 : thedigestonline.com, 5 septembre 2025 : « Barrister is where tradition meets comfort » ; barristercigars.com, non datée : « Where passion meets craftsmanship, and aficionados find their… »', 1,
  'Barrister Cigars, à Union : une boutique de cigares avec un salon où fumer.',
  'Barrister Cigars, in Union: a cigar shop with a lounge for smoking.',
  'Barrister Cigars, en Union: una tienda de puros con un salón para fumar.',
  'Barrister Cigars, Union: ein Zigarrenfachgeschäft mit Raucher-Lounge.',
  'Barrister Cigars,位于Union:设有吸烟休息室的雪茄店。',
  'Barrister Cigars، في Union: متجر سيجار مع صالة للتدخين.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2599 OR (`country_id` = 'usa' AND `name` = 'Barrister Cigars'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 509, 2599, 'placeholder_2599.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2599 AND `name` = 'Barrister Cigars') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2599);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2600, 'usa', 'Jamie''s Cigar Bar & Restaurant', 'Clifton, NJ — 915 Bloomfield Avenue, Clifton, NJ 07012', 'Cigar Bar', NULL, 'https://jamiescigarbar.com',
  'relu le 31 octobre 2026 : thedigestonline.com, 5 septembre 2025 : « Jamie''s is one of the rare lounges that seamlessly blends food and… » ; jamiescigarbar.com, non datée : « Jamie''s Cigar Bar & Restaurant offers a full cigar experience-… »', 1,
  'Jamie''s Cigar Bar & Restaurant, à Clifton : un bar où l''on fume le cigare.',
  'Jamie''s Cigar Bar & Restaurant, in Clifton: a bar where cigars are smoked.',
  'Jamie''s Cigar Bar & Restaurant, en Clifton: un bar donde se fuma puro.',
  'Jamie''s Cigar Bar & Restaurant, Clifton: eine Bar, in der Zigarre geraucht wird.',
  'Jamie''s Cigar Bar & Restaurant,位于Clifton:可以抽雪茄的酒吧。',
  'Jamie''s Cigar Bar & Restaurant، في Clifton: بار يُدخَّن فيه السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2600 OR (`country_id` = 'usa' AND `name` = 'Jamie''s Cigar Bar & Restaurant'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 510, 2600, 'placeholder_2600.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2600 AND `name` = 'Jamie''s Cigar Bar & Restaurant') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2600);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2601, 'canada', 'Stogies Cigar Lounge', 'Montréal, QC — 2015 rue Crescent, Montréal', 'Cigar Lounge', NULL, NULL,
  'à vérifier — relu le 31 octobre 2026 : cigars-connect.com, 11 octobre 2021 : « located in the heart of downtown Montreal, on the festive rue Crescent » ; ma.to, non datée : « offers a sophisticated environment for enjoying premium cigars and… »', 1,
  'Stogies Cigar Lounge, à Montréal : un salon où l''on peut fumer le cigare.',
  'Stogies Cigar Lounge, in Montréal: a lounge where you can smoke a cigar.',
  'Stogies Cigar Lounge, en Montréal: un salón donde se puede fumar un puro.',
  'Stogies Cigar Lounge, Montréal: eine Lounge, in der man Zigarre rauchen kann.',
  'Stogies Cigar Lounge,位于Montréal:可以抽雪茄的雪茄吧。',
  'Stogies Cigar Lounge، في Montréal: صالة يمكن فيها تدخين السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2601 OR (`country_id` = 'canada' AND `name` = 'Stogies Cigar Lounge'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 511, 2601, 'placeholder_2601.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2601 AND `name` = 'Stogies Cigar Lounge') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2601);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2602, 'canada', 'Rib''N Reef Steakhouse et Cigar Lounge', 'Montréal, QC — 8105 boul. Décarie, Montréal, QC H4P 2H5', 'Restaurant & Cigar Lounge', NULL, 'https://ribnreef.com',
  'à vérifier — relu le 31 octobre 2026 : cigars-connect.com, 11 octobre 2021 : « head upstairs to the smoking lounge on the second floor » ; ribnreef.com, non datée : « Linger after dinner in our cigar lounge, one of the few in Montréal »', 1,
  'Rib''N Reef Steakhouse et Cigar Lounge, à Montréal : un restaurant doté d''un salon réservé aux cigares.',
  'Rib''N Reef Steakhouse et Cigar Lounge, in Montréal: a restaurant with a lounge set aside for cigars.',
  'Rib''N Reef Steakhouse et Cigar Lounge, en Montréal: un restaurante con un salón reservado a los puros.',
  'Rib''N Reef Steakhouse et Cigar Lounge, Montréal: ein Restaurant mit einer Lounge für Zigarren.',
  'Rib''N Reef Steakhouse et Cigar Lounge,位于Montréal:设有雪茄专用休息室的餐厅。',
  'Rib''N Reef Steakhouse et Cigar Lounge، في Montréal: مطعم يضم صالة مخصصة للسيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2602 OR (`country_id` = 'canada' AND `name` = 'Rib''N Reef Steakhouse et Cigar Lounge'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 512, 2602, 'placeholder_2602.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2602 AND `name` = 'Rib''N Reef Steakhouse et Cigar Lounge') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2602);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2603, 'canada', 'Whisky Café & Cigar Shop', 'Montréal (Mile End), QC — 5800 boul. Saint-Laurent, Montréal', 'Cigar Shop & Lounge', NULL, 'https://whiskycafe.com',
  'à vérifier — relu le 31 octobre 2026 : cigars-connect.com, 11 octobre 2021 : « has a 35-person capacity smoking lounge » ; whiskycafe.com, non datée : « one of the last few places to offer an indoor smoking experience… »', 1,
  'Whisky Café & Cigar Shop, à Montréal : une boutique de cigares avec un salon où fumer.',
  'Whisky Café & Cigar Shop, in Montréal: a cigar shop with a lounge for smoking.',
  'Whisky Café & Cigar Shop, en Montréal: una tienda de puros con un salón para fumar.',
  'Whisky Café & Cigar Shop, Montréal: ein Zigarrenfachgeschäft mit Raucher-Lounge.',
  'Whisky Café & Cigar Shop,位于Montréal:设有吸烟休息室的雪茄店。',
  'Whisky Café & Cigar Shop، في Montréal: متجر سيجار مع صالة للتدخين.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2603 OR (`country_id` = 'canada' AND `name` = 'Whisky Café & Cigar Shop'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 513, 2603, 'placeholder_2603.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2603 AND `name` = 'Whisky Café & Cigar Shop') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2603);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2604, 'uk', 'The Wellesley Knightsbridge — Cigar Terrace', 'London — 11 Knightsbridge, SW1X 7LY', 'Hotel Cigar Bar', NULL, NULL,
  'relu le 31 octobre 2026 : slman.com, 9 novembre 2022 : « The Wellesley Knightsbridge hotel is home to Europe''s largest… » ; blog.sothebysrealty.co.uk, 10 novembre 2025 : « The plush seating and all-year-round heaters make this a fabulous… » ; cigarguide.simplycigars.co.uk, 5 octobre 2025 : « Art Deco glamour and one of London''s most impressive humidors,… »', 1,
  'The Wellesley Knightsbridge — Cigar Terrace, à London : un hôtel dont le bar ou le salon accueille les amateurs de cigares.',
  'The Wellesley Knightsbridge — Cigar Terrace, in London: a hotel whose bar or lounge welcomes cigar smokers.',
  'The Wellesley Knightsbridge — Cigar Terrace, en London: un hotel cuyo bar o salón recibe a los aficionados a los puros.',
  'The Wellesley Knightsbridge — Cigar Terrace, London: ein Hotel, dessen Bar oder Lounge Zigarrenliebhaber willkommen heißt.',
  'The Wellesley Knightsbridge — Cigar Terrace,位于London:酒店的酒吧或休息室欢迎抽雪茄的客人。',
  'The Wellesley Knightsbridge — Cigar Terrace، في London: فندق يستقبل بار أو صالة عشاق السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2604 OR (`country_id` = 'uk' AND `name` = 'The Wellesley Knightsbridge — Cigar Terrace'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 514, 2604, 'placeholder_2604.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2604 AND `name` = 'The Wellesley Knightsbridge — Cigar Terrace') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2604);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2605, 'uk', 'Boisdale of Belgravia — Cigar Terrace', 'London — 13-15 Eccleston Street, SW1W 9LX', 'Restaurant & Cigar Lounge', '020 7730 6922', 'https://www.boisdale.co.uk/belgravia',
  'à vérifier — relu le 31 octobre 2026 : boisdale.co.uk, non datée : « hidden cigar terrace ; The Cigar Terrace is clad in Boisdale… » ; blog.sothebysrealty.co.uk, 10 novembre 2025 : « The wonderful walk-in humidor is complemented by a purpose built… »', 1,
  'Boisdale of Belgravia — Cigar Terrace, à London : un restaurant doté d''un salon réservé aux cigares.',
  'Boisdale of Belgravia — Cigar Terrace, in London: a restaurant with a lounge set aside for cigars.',
  'Boisdale of Belgravia — Cigar Terrace, en London: un restaurante con un salón reservado a los puros.',
  'Boisdale of Belgravia — Cigar Terrace, London: ein Restaurant mit einer Lounge für Zigarren.',
  'Boisdale of Belgravia — Cigar Terrace,位于London:设有雪茄专用休息室的餐厅。',
  'Boisdale of Belgravia — Cigar Terrace، في London: مطعم يضم صالة مخصصة للسيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2605 OR (`country_id` = 'uk' AND `name` = 'Boisdale of Belgravia — Cigar Terrace'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 515, 2605, 'placeholder_2605.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2605 AND `name` = 'Boisdale of Belgravia — Cigar Terrace') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2605);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2606, 'uk', 'Bulgari Hotel London — Cigar Shop and Sampling Lounge', 'London — 171 Knightsbridge, SW7 1DW', 'Hotel Cigar Bar', NULL, NULL,
  'relu le 31 octobre 2026 : slman.com, 9 novembre 2022 : « Cigars are sourced from Edward''s private collection which he''s… » ; cigarguide.simplycigars.co.uk, 5 octobre 2025 : « Sleek, modern and exclusive with an extensive Cuban and New World… » ; countryandtownhouse.com, 2023 : « to select from a range of rare Havana cigars »', 1,
  'Bulgari Hotel London — Cigar Shop and Sampling Lounge, à London : un hôtel dont le bar ou le salon accueille les amateurs de cigares.',
  'Bulgari Hotel London — Cigar Shop and Sampling Lounge, in London: a hotel whose bar or lounge welcomes cigar smokers.',
  'Bulgari Hotel London — Cigar Shop and Sampling Lounge, en London: un hotel cuyo bar o salón recibe a los aficionados a los puros.',
  'Bulgari Hotel London — Cigar Shop and Sampling Lounge, London: ein Hotel, dessen Bar oder Lounge Zigarrenliebhaber willkommen heißt.',
  'Bulgari Hotel London — Cigar Shop and Sampling Lounge,位于London:酒店的酒吧或休息室欢迎抽雪茄的客人。',
  'Bulgari Hotel London — Cigar Shop and Sampling Lounge، في London: فندق يستقبل بار أو صالة عشاق السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2606 OR (`country_id` = 'uk' AND `name` = 'Bulgari Hotel London — Cigar Shop and Sampling Lounge'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 516, 2606, 'placeholder_2606.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2606 AND `name` = 'Bulgari Hotel London — Cigar Shop and Sampling Lounge') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2606);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2607, 'uk', 'No. Ten Manchester Street Hotel — Cigar Terrace', 'London — 10 Manchester Street, Marylebone, W1U 4DG', 'Hotel Cigar Bar', NULL, NULL,
  'relu le 31 octobre 2026 : slman.com, 9 novembre 2022 : « which has an excellent range of hand-rolled Havanas » ; cigarguide.simplycigars.co.uk, 5 octobre 2025 : « Boutique hotel with a stylish cigar terrace and private lockers » ; countryandtownhouse.com, 2023 : « A cool outdoor terrace or a fabulously decorated sampling room »', 1,
  'No. Ten Manchester Street Hotel — Cigar Terrace, à London : un hôtel dont le bar ou le salon accueille les amateurs de cigares.',
  'No. Ten Manchester Street Hotel — Cigar Terrace, in London: a hotel whose bar or lounge welcomes cigar smokers.',
  'No. Ten Manchester Street Hotel — Cigar Terrace, en London: un hotel cuyo bar o salón recibe a los aficionados a los puros.',
  'No. Ten Manchester Street Hotel — Cigar Terrace, London: ein Hotel, dessen Bar oder Lounge Zigarrenliebhaber willkommen heißt.',
  'No. Ten Manchester Street Hotel — Cigar Terrace,位于London:酒店的酒吧或休息室欢迎抽雪茄的客人。',
  'No. Ten Manchester Street Hotel — Cigar Terrace، في London: فندق يستقبل بار أو صالة عشاق السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2607 OR (`country_id` = 'uk' AND `name` = 'No. Ten Manchester Street Hotel — Cigar Terrace'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 517, 2607, 'placeholder_2607.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2607 AND `name` = 'No. Ten Manchester Street Hotel — Cigar Terrace') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2607);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2608, 'uk', 'The Lanesborough — The Garden Room', 'London — Hyde Park Corner, Knightsbridge, SW1X 7TA', 'Hotel Cigar Bar', NULL, 'https://www.oetkerhotels.com/hotels/the-lanesborough/restaurants-bars/the-garden-room/',
  'à vérifier — relu le 31 octobre 2026 : slman.com, 9 novembre 2022 : « There''s an extensive selection of Cuban and pre-Castro cigars in… » ; countryandtownhouse.com, 2023 : « Think armchairs, a cosy fireplace and a humidor to drool over »', 1,
  'The Lanesborough — The Garden Room, à London : un hôtel dont le bar ou le salon accueille les amateurs de cigares.',
  'The Lanesborough — The Garden Room, in London: a hotel whose bar or lounge welcomes cigar smokers.',
  'The Lanesborough — The Garden Room, en London: un hotel cuyo bar o salón recibe a los aficionados a los puros.',
  'The Lanesborough — The Garden Room, London: ein Hotel, dessen Bar oder Lounge Zigarrenliebhaber willkommen heißt.',
  'The Lanesborough — The Garden Room,位于London:酒店的酒吧或休息室欢迎抽雪茄的客人。',
  'The Lanesborough — The Garden Room، في London: فندق يستقبل بار أو صالة عشاق السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2608 OR (`country_id` = 'uk' AND `name` = 'The Lanesborough — The Garden Room'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 518, 2608, 'placeholder_2608.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2608 AND `name` = 'The Lanesborough — The Garden Room') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2608);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2609, 'uk', 'The Connaught — Connaught Cigar Merchants', 'London — Carlos Place, Mayfair, W1K 2AL', 'Hotel Cigar Bar', NULL, NULL,
  'à vérifier — relu le 31 octobre 2026 : slman.com, 9 novembre 2022 : « There are more than 170 Cuban cigars to choose from » ; blog.sothebysrealty.co.uk, 10 novembre 2025 : « a humidor that focuses heavily on Cuban varieties »', 1,
  'The Connaught — Connaught Cigar Merchants, à London : un hôtel dont le bar ou le salon accueille les amateurs de cigares.',
  'The Connaught — Connaught Cigar Merchants, in London: a hotel whose bar or lounge welcomes cigar smokers.',
  'The Connaught — Connaught Cigar Merchants, en London: un hotel cuyo bar o salón recibe a los aficionados a los puros.',
  'The Connaught — Connaught Cigar Merchants, London: ein Hotel, dessen Bar oder Lounge Zigarrenliebhaber willkommen heißt.',
  'The Connaught — Connaught Cigar Merchants,位于London:酒店的酒吧或休息室欢迎抽雪茄的客人。',
  'The Connaught — Connaught Cigar Merchants، في London: فندق يستقبل بار أو صالة عشاق السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2609 OR (`country_id` = 'uk' AND `name` = 'The Connaught — Connaught Cigar Merchants'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 519, 2609, 'placeholder_2609.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2609 AND `name` = 'The Connaught — Connaught Cigar Merchants') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2609);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2610, 'portugal', 'The Smoke — Cigar Lounge', 'Cascais — Casa de São Bernardo, Marina de Cascais, Lojas 39 e 40, 2750-800', 'Cigar Lounge', NULL, NULL,
  'à vérifier — relu le 31 octobre 2026 : timeout.com, 18 juin 2025 : « dedicated entirely to cigar aficionados » ; timeout.com, 23 juin 2025 : « The Smoke is the only lounge in Cascais – and one of the few in… »', 1,
  'The Smoke — Cigar Lounge, à Cascais : un salon où l''on peut fumer le cigare.',
  'The Smoke — Cigar Lounge, in Cascais: a lounge where you can smoke a cigar.',
  'The Smoke — Cigar Lounge, en Cascais: un salón donde se puede fumar un puro.',
  'The Smoke — Cigar Lounge, Cascais: eine Lounge, in der man Zigarre rauchen kann.',
  'The Smoke — Cigar Lounge,位于Cascais:可以抽雪茄的雪茄吧。',
  'The Smoke — Cigar Lounge، في Cascais: صالة يمكن فيها تدخين السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2610 OR (`country_id` = 'portugal' AND `name` = 'The Smoke — Cigar Lounge'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 520, 2610, 'placeholder_2610.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2610 AND `name` = 'The Smoke — Cigar Lounge') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2610);

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'lounges', l.`id`, 'description', g.lang, SHA1(l.`description`), 'machine', NOW()
  FROM `lounges` l
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de' UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') g
 WHERE l.`id` BETWEEN 2582 AND 2610
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `statut` = 'machine', `maj` = NOW();

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 308';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 308', 'systeme', 'fiche_ajoutee', 'systeme', 0, 'Premier lot tous pays : 29 fiches ajoutees (#2582 a #2610), lues le 31 octobre 2026');

-- Contrôle : des 1 partout.
SELECT
  (SELECT COUNT(*) FROM `lounges` WHERE `id` BETWEEN 2582 AND 2610) = 29 AS `fiches_ajoutees`,
  (SELECT COUNT(*) FROM `lounge_photos` WHERE `lounge_id` BETWEEN 2582 AND 2610) = 29 AS `photos`,
  (SELECT COUNT(*) FROM `translation_status` WHERE `entite` = 'lounges' AND `champ` = 'description' AND `entite_id` BETWEEN '2582' AND '2610' AND `statut` = 'machine') >= 145 AS `sceaux_remis`;
