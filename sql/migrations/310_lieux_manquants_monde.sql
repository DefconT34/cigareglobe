-- ════════════════════════════════════════════════════════
-- 310 — 12 nouvelles fiches dans le monde (#2614 à #2625)
-- ────────────────────────────────────────────────────────
-- CE QU'ON A TROUVÉ (31 octobre 2026). Trois agents ont cherché des lieux absents de la base en Asie-Pacifique, au Moyen-Orient, en Europe et dans les Amériques. Douze retenus, tous « à vérifier » (sources souvent anciennes ou non datées) : Singapour, Hong Kong, Australie, Malaisie, Turquie, Émirats, Arabie saoudite, États-Unis (Houston, Atlanta, Nashville), République dominicaine. Quatre lieux d'Estonie, de Lettonie et de Suède attendent la création de ces pays dans l'atlas. Descriptions courtes, six langues, sceaux « machine ».
-- Photos : uploads/lounges/<id>/placeholder_<id>.jpg à téléverser sur le serveur.
-- ════════════════════════════════════════════════════════

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2614, 'singapore', 'The Connoisseur Divan', 'Singapour — #01-62, UE Square, 207 River Valley Road, Singapore 238275', 'Cigar Shop & Lounge', '+65 6733 7141', 'https://pacificcigar.com/location/the-connoisseur-divan/',
  'à vérifier — relu le 31 octobre 2026 : pacificcigar.com, 2026 : « Largest of its kind, walk-in humidor with Cuban products and… » ; citynomads.com, 26 septembre 2017 : « Luxurious, old-school venue with premium single malts and close to… » ; diffordsguide.com, non daté : « around 300 Cuban cigars, about 100 bottles mostly single malt Scotch »', 1,
  'The Connoisseur Divan, à Singapour : une boutique de cigares avec un salon où fumer.',
  'The Connoisseur Divan, in Singapour: a cigar shop with a lounge for smoking.',
  'The Connoisseur Divan, en Singapour: una tienda de puros con un salón para fumar.',
  'The Connoisseur Divan, Singapour: ein Zigarrenfachgeschäft mit Raucher-Lounge.',
  'The Connoisseur Divan,位于Singapour:设有吸烟休息室的雪茄店。',
  'The Connoisseur Divan، في Singapour: متجر سيجار مع صالة للتدخين.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2614 OR (`country_id` = 'singapore' AND `name` = 'The Connoisseur Divan'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 524, 2614, 'placeholder_2614.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2614 AND `name` = 'The Connoisseur Divan') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2614);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2615, 'hongkong', 'Red Chamber Cigar Divan', 'Hong Kong (Central) — Shop 405-406A, 4/F, Pedder Building, 12 Pedder Street, Central, Hong Kong', 'Cigar Shop & Lounge', NULL, 'https://pacificcigar.com/location/red-chamber-cigar-divan/',
  'à vérifier — relu le 31 octobre 2026 : pacificcigar.com, non daté : « opened in 2002 and moved to the 4th floor of Pedder Building in 2012 » ; igafencu.com, 26 juin 2021 : « Chinese-inspired decor, over 100 private lockers, a VIP room »', 1,
  'Red Chamber Cigar Divan, à Hong Kong : une boutique de cigares avec un salon où fumer.',
  'Red Chamber Cigar Divan, in Hong Kong: a cigar shop with a lounge for smoking.',
  'Red Chamber Cigar Divan, en Hong Kong: una tienda de puros con un salón para fumar.',
  'Red Chamber Cigar Divan, Hong Kong: ein Zigarrenfachgeschäft mit Raucher-Lounge.',
  'Red Chamber Cigar Divan,位于Hong Kong:设有吸烟休息室的雪茄店。',
  'Red Chamber Cigar Divan، في Hong Kong: متجر سيجار مع صالة للتدخين.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2615 OR (`country_id` = 'hongkong' AND `name` = 'Red Chamber Cigar Divan'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 525, 2615, 'placeholder_2615.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2615 AND `name` = 'Red Chamber Cigar Divan') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2615);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2616, 'hongkong', 'Pacific Cigar Divan (Euro Trade Centre)', 'Hong Kong (Central) — 24/F, Euro Trade Centre, 21-23 Des Voeux Road Central, Central, Hong Kong', 'Cigar Shop & Lounge', NULL, 'https://pacificcigar.com/',
  'à vérifier — relu le 31 octobre 2026 : pacificcigar.com, 2026 : « Pacific Cigar Divan, Hong Kong: 24/F, Euro Trade Centre, 21-23 Des… » ; habanos.com, 17 août 2018 : « reopened after renovation and expansion... private room... walk-in… »', 1,
  'Pacific Cigar Divan (Euro Trade Centre), à Hong Kong : une boutique de cigares avec un salon où fumer.',
  'Pacific Cigar Divan (Euro Trade Centre), in Hong Kong: a cigar shop with a lounge for smoking.',
  'Pacific Cigar Divan (Euro Trade Centre), en Hong Kong: una tienda de puros con un salón para fumar.',
  'Pacific Cigar Divan (Euro Trade Centre), Hong Kong: ein Zigarrenfachgeschäft mit Raucher-Lounge.',
  'Pacific Cigar Divan (Euro Trade Centre),位于Hong Kong:设有吸烟休息室的雪茄店。',
  'Pacific Cigar Divan (Euro Trade Centre)، في Hong Kong: متجر سيجار مع صالة للتدخين.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2616 OR (`country_id` = 'hongkong' AND `name` = 'Pacific Cigar Divan (Euro Trade Centre)'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 526, 2616, 'placeholder_2616.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2616 AND `name` = 'Pacific Cigar Divan (Euro Trade Centre)') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2616);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2617, 'australia', 'Siglo (Melbourne Supper Club)', 'Melbourne — 161 Spring Street, Melbourne VIC 3000', 'Cigar Bar', '03 9654 6631', NULL,
  'à vérifier — relu le 31 octobre 2026 : broadsheet.com.au, 2 janvier 2024 : « the humidor is a sight to behold » ; timeout.com, 31 mars 2021 : « Cigars served with caviar and Champagne for celebrations »', 1,
  'Siglo (Melbourne Supper Club), à Melbourne : un bar où l''on fume le cigare.',
  'Siglo (Melbourne Supper Club), in Melbourne: a bar where cigars are smoked.',
  'Siglo (Melbourne Supper Club), en Melbourne: un bar donde se fuma puro.',
  'Siglo (Melbourne Supper Club), Melbourne: eine Bar, in der Zigarre geraucht wird.',
  'Siglo (Melbourne Supper Club),位于Melbourne:可以抽雪茄的酒吧。',
  'Siglo (Melbourne Supper Club)، في Melbourne: بار يُدخَّن فيه السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2617 OR (`country_id` = 'australia' AND `name` = 'Siglo (Melbourne Supper Club)'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 527, 2617, 'placeholder_2617.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2617 AND `name` = 'Siglo (Melbourne Supper Club)') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2617);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2618, 'malaysia', 'Havana Club (Concorde Hotel)', 'Kuala Lumpur — Concorde Hotel, 2 Jalan Sultan Ismail, 50250 Kuala Lumpur', 'Cigar Bar', '03-6411 3133', 'http://havana-club.com.my/',
  'à vérifier — relu le 31 octobre 2026 : thepeak.com.my, 20 janvier 2023 : « One of the first cigar lounges to open in Kuala Lumpur, in 1990 » ; robbreport.com.my, 9 mai 2019 : « curated selection of over 150 vintage and rare cigars »', 1,
  'Havana Club (Concorde Hotel), à Kuala Lumpur : un bar où l''on fume le cigare.',
  'Havana Club (Concorde Hotel), in Kuala Lumpur: a bar where cigars are smoked.',
  'Havana Club (Concorde Hotel), en Kuala Lumpur: un bar donde se fuma puro.',
  'Havana Club (Concorde Hotel), Kuala Lumpur: eine Bar, in der Zigarre geraucht wird.',
  'Havana Club (Concorde Hotel),位于Kuala Lumpur:可以抽雪茄的酒吧。',
  'Havana Club (Concorde Hotel)، في Kuala Lumpur: بار يُدخَّن فيه السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2618 OR (`country_id` = 'malaysia' AND `name` = 'Havana Club (Concorde Hotel)'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 528, 2618, 'placeholder_2618.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2618 AND `name` = 'Havana Club (Concorde Hotel)') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2618);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2619, 'turkey', 'Le Fumoir — Çırağan Palace Kempinski', 'Istanbul — Çırağan Caddesi 32, Beşiktaş', 'Hotel Cigar Bar', '+90 212 326 4620', 'https://www.kempinski.com/en/ciragan-palace/restaurants-bars/le-fumoir',
  'à vérifier — relu le 31 octobre 2026 : cigaraficionado.com, 13 décembre 2023 : « A large cigar lounge in the gardens of the Ciragan Palace, on the… » ; kempinski.com, 2026 : « Bar, Cigar Lounge, Snack Bar ; Forbes Travel Guide 2025 Star Bars »', 1,
  'Le Fumoir — Çırağan Palace Kempinski, à Istanbul : un hôtel dont le bar ou le salon accueille les amateurs de cigares.',
  'Le Fumoir — Çırağan Palace Kempinski, in Istanbul: a hotel whose bar or lounge welcomes cigar smokers.',
  'Le Fumoir — Çırağan Palace Kempinski, en Istanbul: un hotel cuyo bar o salón recibe a los aficionados a los puros.',
  'Le Fumoir — Çırağan Palace Kempinski, Istanbul: ein Hotel, dessen Bar oder Lounge Zigarrenliebhaber willkommen heißt.',
  'Le Fumoir — Çırağan Palace Kempinski,位于Istanbul:酒店的酒吧或休息室欢迎抽雪茄的客人。',
  'Le Fumoir — Çırağan Palace Kempinski، في Istanbul: فندق يستقبل بار أو صالة عشاق السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2619 OR (`country_id` = 'turkey' AND `name` = 'Le Fumoir — Çırağan Palace Kempinski'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 529, 2619, 'placeholder_2619.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2619 AND `name` = 'Le Fumoir — Çırağan Palace Kempinski') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2619);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2620, 'uae', 'Vintage Cigar Lounge Dubai', 'Dubai — Al Barsha, entre Mall of the Emirates et Dubai Hills Mall', 'Cigar Lounge', NULL, NULL,
  'à vérifier — relu le 31 octobre 2026 : cigardojo.com, 13 janvier 2025 : « first Dubai location of Vintage Cigar Group, Al Barsha district » ; cigarslover.com, 21 janvier 2025 : « smoking lounge, private VIP rooms and a retail area »', 1,
  'Vintage Cigar Lounge Dubai, à Dubai : un salon où l''on peut fumer le cigare.',
  'Vintage Cigar Lounge Dubai, in Dubai: a lounge where you can smoke a cigar.',
  'Vintage Cigar Lounge Dubai, en Dubai: un salón donde se puede fumar un puro.',
  'Vintage Cigar Lounge Dubai, Dubai: eine Lounge, in der man Zigarre rauchen kann.',
  'Vintage Cigar Lounge Dubai,位于Dubai:可以抽雪茄的雪茄吧。',
  'Vintage Cigar Lounge Dubai، في Dubai: صالة يمكن فيها تدخين السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2620 OR (`country_id` = 'uae' AND `name` = 'Vintage Cigar Lounge Dubai'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 530, 2620, 'placeholder_2620.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2620 AND `name` = 'Vintage Cigar Lounge Dubai') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2620);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2621, 'saudiarabia', 'La Casa Cubana Cigar Lounge — Crowne Plaza Digital City', 'Riyadh — Crowne Plaza Hotel Digital City, Riyadh', 'Hotel Cigar Bar', NULL, NULL,
  'à vérifier — relu le 31 octobre 2026 : cigaraficionado.com, 6 février 2025 : « launch event at La Casa Cubana Cigar Lounge, Crowne Plaza Hotel… » ; moodiedavittreport.com, 7 février 2025 : « new La Casa Cubana Cigar Lounge at the Crowne Plaza Hotel in Riyadh »', 1,
  'La Casa Cubana Cigar Lounge — Crowne Plaza Digital City, à Riyadh : un hôtel dont le bar ou le salon accueille les amateurs de cigares.',
  'La Casa Cubana Cigar Lounge — Crowne Plaza Digital City, in Riyadh: a hotel whose bar or lounge welcomes cigar smokers.',
  'La Casa Cubana Cigar Lounge — Crowne Plaza Digital City, en Riyadh: un hotel cuyo bar o salón recibe a los aficionados a los puros.',
  'La Casa Cubana Cigar Lounge — Crowne Plaza Digital City, Riyadh: ein Hotel, dessen Bar oder Lounge Zigarrenliebhaber willkommen heißt.',
  'La Casa Cubana Cigar Lounge — Crowne Plaza Digital City,位于Riyadh:酒店的酒吧或休息室欢迎抽雪茄的客人。',
  'La Casa Cubana Cigar Lounge — Crowne Plaza Digital City، في Riyadh: فندق يستقبل بار أو صالة عشاق السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2621 OR (`country_id` = 'saudiarabia' AND `name` = 'La Casa Cubana Cigar Lounge — Crowne Plaza Digital City'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 531, 2621, 'placeholder_2621.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2621 AND `name` = 'La Casa Cubana Cigar Lounge — Crowne Plaza Digital City') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2621);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2622, 'usa', 'Joseph''s Cigar Lounge', 'Houston, TX — 3334 Edloe St., Houston, TX 77027', 'Cigar Lounge', NULL, 'https://www.josephscigar.com',
  'à vérifier — relu le 31 octobre 2026 : cigaraficionado.com, 14 mai 2026 : « contemporary, polished cigar lounge near the Galleria, plush… » ; josephscigar.com, non datée : « Houston (Edloe) 3334 Edloe St. ; plus de 1 500 types de cigares »', 1,
  'Joseph''s Cigar Lounge, à Houston : un salon où l''on peut fumer le cigare.',
  'Joseph''s Cigar Lounge, in Houston: a lounge where you can smoke a cigar.',
  'Joseph''s Cigar Lounge, en Houston: un salón donde se puede fumar un puro.',
  'Joseph''s Cigar Lounge, Houston: eine Lounge, in der man Zigarre rauchen kann.',
  'Joseph''s Cigar Lounge,位于Houston:可以抽雪茄的雪茄吧。',
  'Joseph''s Cigar Lounge، في Houston: صالة يمكن فيها تدخين السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2622 OR (`country_id` = 'usa' AND `name` = 'Joseph''s Cigar Lounge'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 532, 2622, 'placeholder_2622.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2622 AND `name` = 'Joseph''s Cigar Lounge') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2622);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2623, 'usa', 'BURN by Rocky Patel — Atlanta (The Battery)', 'Atlanta, GA — 900 Battery Avenue SE, Suite 1000, Atlanta, GA 30339', 'Cigar Lounge', NULL, 'https://www.burnbyrockypatel.com/atlanta',
  'à vérifier — relu le 31 octobre 2026 : burnbyrockypatel.com, non datée : « humidor de plus de 400 cigares, V.I.P. Lounge, Best Cigar Lounge… » ; cigaraficionado.com, 7 mai 2019 : « 5,000-square-foot cigar lounge in The Battery Atlanta, fourth Burn… »', 1,
  'BURN by Rocky Patel — Atlanta (The Battery), à Atlanta : un salon où l''on peut fumer le cigare.',
  'BURN by Rocky Patel — Atlanta (The Battery), in Atlanta: a lounge where you can smoke a cigar.',
  'BURN by Rocky Patel — Atlanta (The Battery), en Atlanta: un salón donde se puede fumar un puro.',
  'BURN by Rocky Patel — Atlanta (The Battery), Atlanta: eine Lounge, in der man Zigarre rauchen kann.',
  'BURN by Rocky Patel — Atlanta (The Battery),位于Atlanta:可以抽雪茄的雪茄吧。',
  'BURN by Rocky Patel — Atlanta (The Battery)، في Atlanta: صالة يمكن فيها تدخين السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2623 OR (`country_id` = 'usa' AND `name` = 'BURN by Rocky Patel — Atlanta (The Battery)'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 533, 2623, 'placeholder_2623.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2623 AND `name` = 'BURN by Rocky Patel — Atlanta (The Battery)') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2623);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2624, 'usa', 'Byron Lounge — The Ariston', 'Nashville, TN — The Ariston, 508 Church St, Nashville, TN', 'Cigar Lounge', '+1 615-730-9641', 'https://thearistonbar.com/',
  'à vérifier — relu le 31 octobre 2026 : cigaraficionado.com, 12 décembre 2023 : « 2,400-square-foot lounge on the second floor of The Ariston, open… » ; cigarinspector.com, 15 décembre 2023 : « second-floor space inside The Ariston, heart of downtown Nashville » ; atly.com, non datée : « The Ariston, 508 Church St, Nashville ; +1 615-730-9641 »', 1,
  'Byron Lounge — The Ariston, à Nashville : un salon où l''on peut fumer le cigare.',
  'Byron Lounge — The Ariston, in Nashville: a lounge where you can smoke a cigar.',
  'Byron Lounge — The Ariston, en Nashville: un salón donde se puede fumar un puro.',
  'Byron Lounge — The Ariston, Nashville: eine Lounge, in der man Zigarre rauchen kann.',
  'Byron Lounge — The Ariston,位于Nashville:可以抽雪茄的雪茄吧。',
  'Byron Lounge — The Ariston، في Nashville: صالة يمكن فيها تدخين السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2624 OR (`country_id` = 'usa' AND `name` = 'Byron Lounge — The Ariston'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 534, 2624, 'placeholder_2624.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2624 AND `name` = 'Byron Lounge — The Ariston') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2624);

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `phone`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2625, 'dominican', 'Arturo Fuente Cigar Club — Santo Domingo', 'Santo Domingo — Av. 27 de Febrero 211, Santo Domingo', 'Cigar Lounge', '809-683-2771', NULL,
  'à vérifier — relu le 31 octobre 2026 : enprimeurclub.com, 24 août 2026 : « Av 27 de Febrero 211 ; ouvert en 1996 ; lun-sam 9h-0h, fiche revue… » ; cigar-coop.com, 18 juin 2026 : « first club opened in June 1996 ; luxury cigar lounge, full bar,… »', 1,
  'Arturo Fuente Cigar Club — Santo Domingo, à Santo Domingo : un salon où l''on peut fumer le cigare.',
  'Arturo Fuente Cigar Club — Santo Domingo, in Santo Domingo: a lounge where you can smoke a cigar.',
  'Arturo Fuente Cigar Club — Santo Domingo, en Santo Domingo: un salón donde se puede fumar un puro.',
  'Arturo Fuente Cigar Club — Santo Domingo, Santo Domingo: eine Lounge, in der man Zigarre rauchen kann.',
  'Arturo Fuente Cigar Club — Santo Domingo,位于Santo Domingo:可以抽雪茄的雪茄吧。',
  'Arturo Fuente Cigar Club — Santo Domingo، في Santo Domingo: صالة يمكن فيها تدخين السيجار.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2625 OR (`country_id` = 'dominican' AND `name` = 'Arturo Fuente Cigar Club — Santo Domingo'));

INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 535, 2625, 'placeholder_2625.jpg', 1, 1, 'admin', 1, NOW()
 WHERE EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2625 AND `name` = 'Arturo Fuente Cigar Club — Santo Domingo') AND NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2625);

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'lounges', l.`id`, 'description', g.lang, SHA1(l.`description`), 'machine', NOW()
  FROM `lounges` l
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de' UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') g
 WHERE l.`id` BETWEEN 2614 AND 2625
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `statut` = 'machine', `maj` = NOW();

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 310';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 310', 'systeme', 'fiche_ajoutee', 'systeme', 0, 'Monde : 12 fiches ajoutees (#2614 a #2625), lues le 31 octobre 2026');

-- Contrôle : des 1 partout.
SELECT
  (SELECT COUNT(*) FROM `lounges` WHERE `id` BETWEEN 2614 AND 2625) = 12 AS `fiches_ajoutees`,
  (SELECT COUNT(*) FROM `lounge_photos` WHERE `lounge_id` BETWEEN 2614 AND 2625) = 12 AS `photos`,
  (SELECT COUNT(*) FROM `translation_status` WHERE `entite` = 'lounges' AND `champ` = 'description' AND `entite_id` BETWEEN '2614' AND '2625' AND `statut` = 'machine') >= 60 AS `sceaux_remis`;
