-- ════════════════════════════════════════════════════════
-- 233 — Lot 20 : les réseaux à deux sources
-- ────────────────────────────────────────────────────────
-- LA 232 A CONCLU SUR UN SEUL ANNUAIRE, ET IL ÉTAIT INCOMPLET. Les
-- 4 437 pages « place » de habanos.com ne portent pas toutes les Casas
-- del Habano : le site de la franchise elle-même, lacasadelhabano.com,
-- tient un plan des franchises (180 marqueurs, état du 30 août 2026,
-- lisible par ses catégories région → pays → ville malgré la
-- vérification d'âge) et une chronique datée des ouvertures. Ce plan
-- compte des Casas à Riyad, Khobar, Djeddah, Madrid, Mascate, Chiang
-- Mai ; la chronique annonce Tbilissi (ouverte le 20 octobre 2025) et
-- León (13 octobre 2023) — six fiches que la 232 avait dépubliées ou
-- requalifiées sur le silence d'un seul annuaire. Elles reviennent,
-- avec les deux sources écrites.
--
-- LA LEÇON, ET LA RÈGLE QUI EN SORT : une absence ne se conclut que
-- sur DEUX listes officielles, ou sur une liste et la propre parole
-- de l'établissement. Un seul annuaire, si complet paraisse-t-il, ne
-- retire rien.
--
-- ── CE QUE LES DEUX LISTES RENDENT ENSEMBLE ──────────────
--   · 6 fiches RESTAURÉES (Tbilissi — sous son vrai pays, la Géorgie,
--     créé ici —, León, Riyad, Khobar, Madrid avec réserve, et
--     Montréal / Toronto avec réserve : le plan compte deux Casas au
--     Canada, Windsor et une sans ville) ; Djeddah, Mascate, Chiang Mai
--     retrouvent leur nom et leur type de Casa, l'écart de l'annuaire
--     étant écrit ;
--   · 6 fiches DÉPUBLIÉES, absentes des deux listes : Barbade (que la
--     franchise avait annoncée en 2012), Botswana, Mali, Paraguay,
--     Venezuela, Égypte ;
--   · 7 fiches de pays que habanos.com ne couvre pas et que le plan
--     confirme : Aruba, Caïmans, Guatemala, Jamaïque (deux), Saint-
--     Martin, Togo ;
--   · 80 fiches présentes dans les deux : le plan s'ajoute à la source.
--
-- ── DAVIDOFF, LU EN ENTIER ───────────────────────────────
-- Le localisateur davidoff.com ne s'arrête pas à sa cinquième page :
-- 56 boutiques en propre (dont Genève rue de Rive, page six), 14
-- partenaires, 1 636 dépositaires, tous lus depuis les données que la
-- page charge, sans franchir la vérification d'âge. Les dépositaires
-- couvrent 44 pays (Amérique du Nord, Europe, Amérique latine, Hong
-- Kong, Japon, Côte d'Ivoire), pas la Grèce, la Serbie, Israël, la
-- Corée, l'Indonésie, le Nigeria ni les Caraïbes.
--   · 4 CORRIGÉES : Tokyo (Ginza 8-5-6, pas Ginza Six), Las Vegas (3200
--     Las Vegas Blvd, pas le Palazzo), Belgrade (Đure Jakšića 2, pas
--     Knez Mihailova), Londres (Davidoff of London est un dépositaire
--     agréé, la boutique d'Edward Sahakian, pas une boutique en propre) ;
--   · 15 DÉPUBLIÉES, absentes d'un pays que le localisateur couvre :
--     São Paulo, Toronto, Santiago, Medellín (le dépositaire y est La
--     Cava del Puro, fiche 2566), Milan, Rome, Luxembourg, Madrid,
--     Barcelone, Miami Bal Harbour, Beverly Hills, Hong Kong IFC,
--     Manille SM Megamall, Taipei Shin Kong, Shanghai Plaza 66 ;
--   · 17 GARDÉES, dans des pays que le localisateur ne couvre pas (la
--     France n'y a que ses satellites de Roissy) : on l'écrit ;
--   · La Cava del Puro (Bogotá, Medellín, Carthagène) : dépositaire
--     Davidoff selon le localisateur — une seconde source officielle.
--
-- ── LES TRADUCTIONS ──────────────────────────────────────
-- Sept fiches réécrites (Djeddah, Madrid, León, Tokyo, Las Vegas,
-- Belgrade, Londres) : cinq traductions chacune, rescellées depuis la
-- colonne. Les dépubliées gardent les leurs.
--
-- Après cette migration :
--   php tools/lounges_fraicheur.php --sonder
--   php tools/lounges_fraicheur.php --figer
--   php tools/sources.php --figer
--   php tools/contenu_dump.php
-- ════════════════════════════════════════════════════════

-- ── 0. La Géorgie entre dans les pays d'établissements ──
INSERT INTO `lounge_countries` (`id`, `name`, `flag`, `lat`, `lon`, `color`, `iso_code`)
VALUES ('georgia', 'Géorgie', '🇬🇪', 41.7151, 44.8271, '#8B2BE2', 'GE')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`), `iso_code` = VALUES(`iso_code`);

-- ── 1. Casas del Habano restaurées : le plan des franchises les compte ──
UPDATE `lounges` SET `country_id` = 'georgia', `type` = 'La Casa del Habano Officielle', `is_verified` = 1, `source` = 'lacasadelhabano.com, actualité du 3 novembre 2025 : ouverture commerciale le 20 octobre 2025, inauguration officielle annoncée pour le début de 2026 (lue le 18 septembre 2026) — absente de l''annuaire habanos.com (4 437 lieux, lu le 17 septembre 2026) et du plan des franchises, tous deux en retard sur cette annonce ; la fiche rangeait Tbilissi en Azerbaïdjan, corrigé', `updated_at` = NOW()
 WHERE `id` = 145;
UPDATE `lounges` SET `is_verified` = 1, `source` = 'PDF officiel Habanos S.A. ; plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) : deux Casas à Riyad ; l''annuaire habanos.com (4 437 lieux, lu le 17 septembre 2026) n''y classe que La Casa Cubana, Habanos Specialist — les deux écrits ; l''adresse de la fiche n''est confirmée par aucun des deux', `updated_at` = NOW()
 WHERE `id` = 114 AND `country_id` = 'saudiarabia';
UPDATE `lounges` SET `is_verified` = 1, `source` = 'PDF officiel Habanos S.A. ; plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) : une Casa à Khobar ; l''annuaire habanos.com (4 437 lieux, lu le 17 septembre 2026) n''y classe que La Casa Cubana, Habanos Specialist, 4733 Prince Faisal Bin Fahd Road — les deux écrits ; l''adresse de la fiche n''est confirmée par aucun des deux', `updated_at` = NOW()
 WHERE `id` = 115 AND `country_id` = 'saudiarabia';
UPDATE `lounges` SET `is_verified` = 1, `source` = 'à vérifier — relu le 18 septembre 2026 : le plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) compte deux Casas au Canada, Windsor et une seconde sans ville ; l''annuaire habanos.com (4 437 lieux, lu le 17 septembre 2026) n''a que Windsor ; le site de la franchise a publié sur cette Casa en 2015 (dîner Veuve Clicquot, 29 juillet 2015)', `updated_at` = NOW()
 WHERE `id` = 153 AND `country_id` = 'canada';
UPDATE `lounges` SET `is_verified` = 1, `source` = 'à vérifier — relu le 18 septembre 2026 : le plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) compte deux Casas au Canada, Windsor et une seconde sans ville ; l''annuaire habanos.com (4 437 lieux, lu le 17 septembre 2026) n''a que Windsor ; le site de la franchise a publié sur cette Casa en 2016 (bar ouvert, dix-septième anniversaire)', `updated_at` = NOW()
 WHERE `id` = 154 AND `country_id` = 'canada';
UPDATE `lounges` SET `type` = 'La Casa del Habano Officielle', `source` = 'plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) : une Casa à Mascate ; l''annuaire habanos.com (4 437 lieux, lu le 17 septembre 2026) classe sa fiche La Casa Del Habano – Oman, Oasis by the Sea, en Habanos Specialist — les deux écrits ; téléphone pris à l''annuaire', `updated_at` = NOW()
 WHERE `id` = 112 AND `country_id` = 'oman';
UPDATE `lounges` SET `type` = 'La Casa del Habano Officielle', `source` = 'plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) : une Casa à Chiang Mai ; l''annuaire habanos.com (4 437 lieux, lu le 17 septembre 2026) classe sa fiche La Casa Del Habano, Chiangmai, 1/5 Soi 9 Nimmanhemin Road, en Habanos Specialist — les deux écrits ; téléphone pris à l''annuaire', `updated_at` = NOW()
 WHERE `id` = 2497 AND `country_id` = 'thailand';

-- ── 2. Corrigées, dans les six langues ──────────────────
UPDATE `lounges` SET
  `name` = 'La Casa del Habano — Jeddah (Palestine Street)',
  `city` = 'Jeddah — Palestine Street, Al Hamra',
  `type` = 'La Casa del Habano Officielle',
  `phone` = '+966 12 667 2752',
  `website` = NULL,
  `is_verified` = 1,
  `source` = 'PDF officiel Habanos S.A. ; plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) : une Casa à Djeddah ; l''annuaire habanos.com (4 437 lieux, lu le 17 septembre 2026) classe la même adresse La Casa Cubana, Habanos Specialist — les deux écrits ; téléphone pris à l''annuaire',
  `description` = 'Casa del Habano de Djeddah, Palestine Street, dans le quartier d''Al Hamra. Le plan des franchises de La Casa del Habano la compte ; l''annuaire habanos.com classe la même adresse sous le nom La Casa Cubana, Habanos Specialist — les deux sont écrits.',
  `description_en` = 'Casa del Habano of Jeddah, Palestine Street, in the Al Hamra district. The La Casa del Habano franchise map counts it; the habanos.com directory lists the same address under the name La Casa Cubana, Habanos Specialist — both are written.',
  `description_es` = 'Casa del Habano de Yeda, Palestine Street, en el barrio de Al Hamra. El mapa de franquicias de La Casa del Habano la cuenta; el directorio de habanos.com registra la misma dirección con el nombre La Casa Cubana, Habanos Specialist — se escriben las dos.',
  `description_de` = 'Casa del Habano von Dschidda, Palestine Street, im Viertel Al Hamra. Die Franchise-Karte von La Casa del Habano zählt sie; das Verzeichnis von habanos.com führt dieselbe Adresse unter dem Namen La Casa Cubana, Habanos Specialist — beides ist geschrieben.',
  `description_zh` = '吉达的 Casa del Habano，位于哈姆拉区巴勒斯坦街。La Casa del Habano 的特许经营地图将其计入；habanos.com 的名录则以 La Casa Cubana（Habanos Specialist）之名列出同一地址——两者都写在这里。',
  `description_ar` = 'Casa del Habano في جدّة، شارع فلسطين بحيّ الحمراء. تعدّها خريطة امتيازات La Casa del Habano؛ ويدرج دليل habanos.com العنوان نفسه باسم La Casa Cubana بوصفه Habanos Specialist — والاثنان مكتوبان.',
  `updated_at` = NOW()
 WHERE `id` = 113 AND `country_id` = 'saudiarabia';
UPDATE `lounges` SET
  `name` = 'La Casa del Habano — Madrid',
  `city` = 'Madrid — Paseo de Recoletos 1',
  `type` = 'La Casa del Habano Officielle',
  `phone` = NULL,
  `website` = NULL,
  `is_verified` = 1,
  `source` = 'à vérifier — relu le 18 septembre 2026 : le plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) compte une Casa à Madrid ; l''annuaire habanos.com (4 437 lieux, lu le 17 septembre 2026) n''en classe aucune en Espagne ; l''adresse de la fiche, paseo de Recoletos 1, et le nom Club Pasión Habanos qu''elle portait (club madrilène, calle Ferraz 2) ne sont confirmés par aucun des deux',
  `description` = 'Adresse répertoriée paseo de Recoletos 1, à Madrid. Le plan des franchises de La Casa del Habano compte une Casa à Madrid ; l''annuaire habanos.com n''en classe aucune en Espagne, et cette adresse n''est confirmée par aucun des deux.',
  `description_en` = 'An address listed at Paseo de Recoletos 1, Madrid. The La Casa del Habano franchise map counts one Casa in Madrid; the habanos.com directory classes none in Spain, and this address is confirmed by neither.',
  `description_es` = 'Dirección registrada en el paseo de Recoletos 1, Madrid. El mapa de franquicias de La Casa del Habano cuenta una Casa en Madrid; el directorio de habanos.com no clasifica ninguna en España, y esta dirección no la confirma ninguno de los dos.',
  `description_de` = 'Eine unter Paseo de Recoletos 1, Madrid, verzeichnete Adresse. Die Franchise-Karte von La Casa del Habano zählt eine Casa in Madrid; das Verzeichnis von habanos.com führt keine in Spanien, und diese Adresse bestätigt keines von beiden.',
  `description_zh` = '登记于马德里雷科莱托斯大道1号的一处地址。La Casa del Habano 的特许经营地图在马德里计有一家 Casa；habanos.com 的名录在西班牙未归类任何一家，而这一地址两者都未确认。',
  `description_ar` = 'عنوان مسجَّل في باسيو دي ريكوليتوس 1 بمدريد. تعدّ خريطة امتيازات La Casa del Habano بيتًا واحدًا في مدريد؛ ولا يصنّف دليل habanos.com أيًّا منها في إسبانيا، ولا يؤكّد هذا العنوان أيٌّ منهما.',
  `updated_at` = NOW()
 WHERE `id` = 30 AND `country_id` = 'spain';
UPDATE `lounges` SET
  `name` = 'La Casa del Habano — León',
  `city` = 'León, Guanajuato — Plaza Campestre, Blvd José María Morelos 1502, local 21',
  `type` = 'La Casa del Habano Officielle',
  `phone` = NULL,
  `website` = NULL,
  `is_verified` = 1,
  `source` = 'lacasadelhabano.com, actualité du 7 novembre 2023 : inaugurée le 13 octobre 2023, Plaza Campestre, humidor sur deux niveaux de plus de cinquante mille cigares (lue le 18 septembre 2026) — la fiche disait octobre 2024 ; absente de l''annuaire habanos.com (4 437 lieux, lu le 17 septembre 2026) et du plan des franchises, tous deux en retard sur cette annonce',
  `description` = 'Inaugurée le 13 octobre 2023 à León, dans le Guanajuato, Plaza Campestre, sur le boulevard José María Morelos : humidor sur deux niveaux d''une capacité de plus de cinquante mille cigares, salon intérieur. La fiche disait octobre 2024 ; c''est l''annonce de la franchise qui date.',
  `description_en` = 'Inaugurated on 13 October 2023 in León, Guanajuato, at Plaza Campestre on Boulevard José María Morelos: a two-level humidor with room for more than fifty thousand cigars, and an indoor lounge. The entry said October 2024; the franchise''s own announcement gives the date.',
  `description_es` = 'Inaugurada el 13 de octubre de 2023 en León, Guanajuato, en Plaza Campestre, sobre el bulevar José María Morelos: humidor de dos niveles con capacidad para más de cincuenta mil puros y salón interior. La ficha decía octubre de 2024; la fecha la da el anuncio de la propia franquicia.',
  `description_de` = 'Eröffnet am 13. Oktober 2023 in León, Guanajuato, in der Plaza Campestre am Boulevard José María Morelos: ein zweistöckiger Humidor für über fünfzigtausend Zigarren und eine Lounge im Inneren. Der Eintrag nannte Oktober 2024; das Datum stammt aus der Ankündigung der Franchise selbst.',
  `description_zh` = '2023年10月13日在瓜纳华托州莱昂开业，位于何塞·玛丽亚·莫雷洛斯大道的 Plaza Campestre：两层雪茄保湿房可存放五万余支雪茄，另设室内休息厅。此前词条写的是2024年10月；日期以特许经营方自己的公告为准。',
  `description_ar` = 'افتُتح في 13 أكتوبر 2023 في ليون بولاية غواناخواتو، في بلازا كامبيستري على جادة خوسيه ماريا موريلوس: خزانة ترطيب على طابقين تتّسع لما يزيد على خمسين ألف سيجار، وصالة داخلية. كانت البطاقة تقول أكتوبر 2024؛ والتاريخ من إعلان الامتياز نفسه.',
  `updated_at` = NOW()
 WHERE `id` = 192 AND `country_id` = 'mexico';
UPDATE `lounges` SET
  `name` = 'Davidoff of Geneva since 1911 — Ginza',
  `city` = 'Tokyo — Ginza 8-5-6, Chuo-ku',
  `type` = 'Davidoff Flagship',
  `phone` = '+81 3 5537 5585',
  `website` = 'https://davidoffgeneva.jp/',
  `is_verified` = 1,
  `source` = 'le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : boutique en propre Davidoff of Geneva since 1911 – Ginza, Chuo City, Ginza 8 Chome-5-6, avec salon, davidoffgeneva.jp — la fiche la plaçait au Ginza Six, 6-10-1, que le localisateur ne connaît pas',
  `description` = 'Boutique Davidoff of Geneva since 1911 de Ginza, 8-5-6 Ginza, dans l''arrondissement de Chuo à Tokyo, avec salon ; le localisateur de la marque la liste parmi ses boutiques en propre. La fiche la plaçait au Ginza Six, 6-10-1, une adresse que le localisateur ne connaît pas.',
  `description_en` = 'Davidoff of Geneva since 1911 shop in Ginza, 8-5-6 Ginza, in Tokyo''s Chuo ward, with a lounge; the brand''s locator lists it among its own stores. The entry placed it at Ginza Six, 6-10-1, an address the locator does not know.',
  `description_es` = 'Tienda Davidoff of Geneva since 1911 de Ginza, 8-5-6 Ginza, en el distrito de Chuo en Tokio, con salón; el localizador de la marca la registra entre sus tiendas propias. La ficha la situaba en Ginza Six, 6-10-1, una dirección que el localizador no conoce.',
  `description_de` = 'Davidoff-of-Geneva-since-1911-Boutique in Ginza, 8-5-6 Ginza, im Tokioter Bezirk Chuo, mit Lounge; der Store-Locator der Marke führt sie unter ihren eigenen Geschäften. Der Eintrag setzte sie ins Ginza Six, 6-10-1, eine Adresse, die der Locator nicht kennt.',
  `description_zh` = '东京中央区银座8-5-6的 Davidoff of Geneva since 1911 精品店，设有休息厅；品牌的门店定位器将其列入自营门店。此前词条把它放在银座六丁目6-10-1的 Ginza Six，定位器并不知道这一地址。',
  `description_ar` = 'متجر Davidoff of Geneva since 1911 في غينزا، 8-5-6 غينزا بحيّ تشوو في طوكيو، مع صالة؛ يدرجه محدّد المتاجر الخاصّ بالعلامة ضمن متاجرها الخاصّة. كانت البطاقة تضعه في Ginza Six، 6-10-1، وهو عنوان لا يعرفه المحدّد.',
  `updated_at` = NOW()
 WHERE `id` = 365 AND `country_id` = 'japan';
UPDATE `lounges` SET
  `name` = 'Davidoff of Geneva since 1911 — Las Vegas',
  `city` = 'Las Vegas, NV — 3200 S Las Vegas Blvd, suite 1245',
  `type` = 'Davidoff Flagship',
  `phone` = '+1 702 473 5001',
  `website` = 'http://www.davidoffcigarbarlv.com/',
  `is_verified` = 1,
  `source` = 'le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : boutique en propre Davidoff of Geneva since 1911 – Las Vegas, 3200 S Las Vegas Blvd #1245, avec salon, davidoffcigarbarlv.com — la fiche la plaçait au Palazzo, 3325 Las Vegas Blvd, que le localisateur ne connaît pas',
  `description` = 'Boutique Davidoff of Geneva since 1911 de Las Vegas, 3200 South Las Vegas Boulevard, suite 1245, avec salon et bar à cigares ; le localisateur de la marque la liste parmi ses boutiques en propre. La fiche la plaçait au Palazzo, 3325 Las Vegas Boulevard, une adresse que le localisateur ne connaît pas.',
  `description_en` = 'Davidoff of Geneva since 1911 shop in Las Vegas, 3200 South Las Vegas Boulevard, suite 1245, with a lounge and cigar bar; the brand''s locator lists it among its own stores. The entry placed it at the Palazzo, 3325 Las Vegas Boulevard, an address the locator does not know.',
  `description_es` = 'Tienda Davidoff of Geneva since 1911 de Las Vegas, 3200 South Las Vegas Boulevard, local 1245, con salón y bar de puros; el localizador de la marca la registra entre sus tiendas propias. La ficha la situaba en el Palazzo, 3325 Las Vegas Boulevard, una dirección que el localizador no conoce.',
  `description_de` = 'Davidoff-of-Geneva-since-1911-Boutique in Las Vegas, 3200 South Las Vegas Boulevard, Suite 1245, mit Lounge und Zigarrenbar; der Store-Locator der Marke führt sie unter ihren eigenen Geschäften. Der Eintrag setzte sie ins Palazzo, 3325 Las Vegas Boulevard, eine Adresse, die der Locator nicht kennt.',
  `description_zh` = '拉斯维加斯南拉斯维加斯大道3200号1245室的 Davidoff of Geneva since 1911 精品店，设有休息厅和雪茄吧；品牌的门店定位器将其列入自营门店。此前词条把它放在拉斯维加斯大道3325号的 Palazzo，定位器并不知道这一地址。',
  `description_ar` = 'متجر Davidoff of Geneva since 1911 في لاس فيغاس، 3200 جادة لاس فيغاس الجنوبية، جناح 1245، مع صالة وبار سيجار؛ يدرجه محدّد المتاجر الخاصّ بالعلامة ضمن متاجرها الخاصّة. كانت البطاقة تضعه في البالاتسو، 3325 جادة لاس فيغاس، وهو عنوان لا يعرفه المحدّد.',
  `updated_at` = NOW()
 WHERE `id` = 415 AND `country_id` = 'usa';
UPDATE `lounges` SET
  `name` = 'Davidoff of Geneva since 1911 — Belgrade',
  `city` = 'Belgrade — Đure Jakšića 2, 11000 Beograd',
  `type` = 'Davidoff Flagship',
  `phone` = NULL,
  `website` = 'https://www.davidoffshop.rs/',
  `is_verified` = 1,
  `source` = 'le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : boutique en propre Davidoff of Geneva since 1911, Đure Jakšića 2, Beograd, davidoffshop.rs — la fiche la plaçait Knez Mihailova 6, que le localisateur ne connaît pas',
  `description` = 'Boutique Davidoff of Geneva since 1911 de Belgrade, Đure Jakšića 2, à deux pas de la rue Knez Mihailova ; le localisateur de la marque la liste parmi ses boutiques en propre. La fiche la plaçait Knez Mihailova 6, une adresse que le localisateur ne connaît pas.',
  `description_en` = 'Davidoff of Geneva since 1911 shop in Belgrade, Đure Jakšića 2, a few steps from Knez Mihailova street; the brand''s locator lists it among its own stores. The entry placed it at Knez Mihailova 6, an address the locator does not know.',
  `description_es` = 'Tienda Davidoff of Geneva since 1911 de Belgrado, Đure Jakšića 2, a dos pasos de la calle Knez Mihailova; el localizador de la marca la registra entre sus tiendas propias. La ficha la situaba en Knez Mihailova 6, una dirección que el localizador no conoce.',
  `description_de` = 'Davidoff-of-Geneva-since-1911-Boutique in Belgrad, Đure Jakšića 2, wenige Schritte von der Knez-Mihailova-Straße; der Store-Locator der Marke führt sie unter ihren eigenen Geschäften. Der Eintrag setzte sie nach Knez Mihailova 6, eine Adresse, die der Locator nicht kennt.',
  `description_zh` = '贝尔格莱德久雷·亚克希奇街2号的 Davidoff of Geneva since 1911 精品店，距克内兹·米哈伊洛瓦街几步之遥；品牌的门店定位器将其列入自营门店。此前词条把它放在克内兹·米哈伊洛瓦街6号，定位器并不知道这一地址。',
  `description_ar` = 'متجر Davidoff of Geneva since 1911 في بلغراد، شارع دجوره ياكشيتش 2، على خطوات من شارع كنيز ميهايلوفا؛ يدرجه محدّد المتاجر الخاصّ بالعلامة ضمن متاجرها الخاصّة. كانت البطاقة تضعه في كنيز ميهايلوفا 6، وهو عنوان لا يعرفه المحدّد.',
  `updated_at` = NOW()
 WHERE `id` = 934 AND `country_id` = 'serbia';
UPDATE `lounges` SET
  `name` = 'Davidoff of London — St James''s Street',
  `city` = 'London — 35 St James''s Street, SW1A 1HD',
  `type` = 'Davidoff Appointed Merchant',
  `phone` = '+44 20 7930 3079',
  `website` = 'https://www.davidofflondon.com/',
  `is_verified` = 1,
  `source` = 'le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : Davidoff of London, 35 St James''s Street, classée dépositaire agréé (Davidoff Appointed Merchant), non boutique en propre ; davidofflondon.com, qui se présente comme la boutique de cigares d''Edward Sahakian',
  `description` = 'Davidoff of London, 35 St James''s Street, dans la rue des marchands de cigares de St James''s : la boutique d''Edward Sahakian, qui porte le nom de la marque et en tient toute la gamme. Le localisateur Davidoff la classe parmi ses dépositaires agréés, non parmi ses boutiques en propre.',
  `description_en` = 'Davidoff of London, 35 St James''s Street, in the cigar merchants'' street of St James''s: Edward Sahakian''s shop, which bears the brand''s name and carries its whole range. The Davidoff locator classes it among its appointed merchants, not among its own stores.',
  `description_es` = 'Davidoff of London, 35 St James''s Street, en la calle de los comerciantes de puros de St James''s: la tienda de Edward Sahakian, que lleva el nombre de la marca y ofrece toda su gama. El localizador Davidoff la clasifica entre sus distribuidores autorizados, no entre sus tiendas propias.',
  `description_de` = 'Davidoff of London, 35 St James''s Street, in der Straße der Zigarrenhändler von St James''s: das Geschäft von Edward Sahakian, das den Namen der Marke trägt und ihr ganzes Sortiment führt. Der Davidoff-Locator stuft es unter seine autorisierten Händler ein, nicht unter seine eigenen Geschäfte.',
  `description_zh` = '伦敦圣詹姆斯街35号的 Davidoff of London，位于圣詹姆斯的雪茄商街：爱德华·萨哈基安的店铺，冠以品牌之名并经营其全系列产品。Davidoff 的门店定位器将其归入授权经销商，而非自营门店。',
  `description_ar` = 'Davidoff of London، 35 شارع سانت جيمس، في شارع تجّار السيجار بسانت جيمس: متجر إدوارد ساهاكيان، الذي يحمل اسم العلامة ويقدّم تشكيلتها كاملة. يصنّفه محدّد متاجر Davidoff ضمن وكلائها المعتمدين لا ضمن متاجرها الخاصّة.',
  `updated_at` = NOW()
 WHERE `id` = 276 AND `country_id` = 'uk';

-- ── 3. Présentes au plan, dans un pays que l'annuaire habanos.com ne couvre pas ──
UPDATE `lounges` SET `source` = 'PDF officiel Habanos S.A. ; plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) : une Casa dans cette ville ; l''annuaire habanos.com (4 437 lieux, lu le 17 septembre 2026) ne couvre pas ce pays', `updated_at` = NOW()
 WHERE `id` IN (165, 167, 168, 169, 172, 173) AND `is_verified` = 1;
UPDATE `lounges` SET `source` = CONCAT(`source`, ' ; plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) : une Casa dans cette ville'), `updated_at` = NOW()
 WHERE `id` = 2542 AND `is_verified` = 1 AND `source` NOT LIKE '%30 août 2026%';

-- ── 4. Absentes des deux listes officielles : dépubliées ──
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 18 septembre 2026 : absente du plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) et de l''annuaire habanos.com (4 437 lieux, lu le 17 septembre 2026) ; la franchise avait annoncé son ouverture à Holetown le 17 mars 2012 (Puros Corp., 180 m²), elle ne la liste plus', `updated_at` = NOW()
 WHERE `id` = 170 AND `country_id` = 'barbados';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 18 septembre 2026 : absente du plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) — l''Afrique n''y compte que Lomé et Casablanca — et de l''annuaire habanos.com (4 437 lieux, lu le 17 septembre 2026)', `updated_at` = NOW()
 WHERE `id` = 12 AND `country_id` = 'botswana';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 18 septembre 2026 : absente du plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) — l''Afrique n''y compte que Lomé et Casablanca — et de l''annuaire habanos.com (4 437 lieux, lu le 17 septembre 2026)', `updated_at` = NOW()
 WHERE `id` = 13 AND `country_id` = 'mali';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 18 septembre 2026 : absente du plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) et de l''annuaire habanos.com (4 437 lieux, lu le 17 septembre 2026) ; le site de la franchise en parlait encore en octobre 2016', `updated_at` = NOW()
 WHERE `id` = 166 AND `country_id` = 'paraguay';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 18 septembre 2026 : absente du plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) — 61 Casas d''Amérique latine et des Caraïbes, aucune au Venezuela — et de l''annuaire habanos.com (4 437 lieux, lu le 17 septembre 2026)', `updated_at` = NOW()
 WHERE `id` = 163 AND `country_id` = 'venezuela';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 18 septembre 2026 : absente du plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) et de l''annuaire habanos.com (4 437 lieux, lu le 17 septembre 2026), qui n''a en Égypte que deux boutiques hors taxes d''aéroport', `updated_at` = NOW()
 WHERE `id` = 17 AND `country_id` = 'egypt';

-- ── 5. Présentes dans les deux listes : 76 fiches, le plan s'ajoute à la source ──
UPDATE `lounges` SET `source` = CONCAT(`source`, ' ; plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) : une Casa dans cette ville'), `updated_at` = NOW()
 WHERE `id` IN (14, 15, 39, 40, 42, 43, 44, 45, 50, 52, 53, 55, 58, 59, 60, 62, 64, 65, 67, 68, 70, 71, 74, 75, 76, 80, 82, 83, 85, 87, 88, 91, 92, 94, 96, 97, 98, 99, 101, 102, 103, 104, 106, 108, 109, 110, 111, 116, 122, 123, 127, 130, 134, 136, 140, 155, 156, 157, 161, 162, 164, 174, 175, 177, 185, 187, 188, 190, 191, 193, 330, 384, 1171, 2561, 2562, 2564) AND `is_verified` = 1 AND `source` NOT LIKE '%30 août 2026%';

-- ── 6. Davidoff : absentes d'un pays que le localisateur couvre ──
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 18 septembre 2026 : absente de le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : au Brésil, la marque n''a que deux dépositaires, Caruso Lounge (Itaim Bibi et Haddock Lobo), aucune boutique en propre', `updated_at` = NOW()
 WHERE `id` = 469 AND `country_id` = 'brazil';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 18 septembre 2026 : absente de le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : à Toronto, la marque n''a que des dépositaires (Metro Cigar, 126A Cumberland St, à Yorkville ; Havana Castle ; Avenue Cigars…), aucune boutique en propre au 130 Bloor Street West', `updated_at` = NOW()
 WHERE `id` = 431 AND `country_id` = 'canada';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 18 septembre 2026 : absente de le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : au Chili, la marque n''a qu''un dépositaire, Puros CL, avenida Kennedy 5741, Las Condes', `updated_at` = NOW()
 WHERE `id` = 743 AND `country_id` = 'chile';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 18 septembre 2026 : absente de le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : à Medellín, le dépositaire Davidoff est La Cava del Puro, carrera 38 no 10A-26 — la fiche 2566 de cet atlas —, aucune boutique en propre calle 10', `updated_at` = NOW()
 WHERE `id` = 748 AND `country_id` = 'colombia';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 18 septembre 2026 : absente de le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : à Milan, la marque n''a que des dépositaires (via Carducci 12, galleria Vittorio Emanuele II 12, Savinelli via Orefici 2), aucune boutique via Solferino', `updated_at` = NOW()
 WHERE `id` = 325 AND `country_id` = 'italy';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 18 septembre 2026 : absente de le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : à Rome, la marque n''a que des dépositaires (piazza Barberini, via della Rotonda, piazza del Popolo…), aucune boutique via Condotti', `updated_at` = NOW()
 WHERE `id` = 327 AND `country_id` = 'italy';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 18 septembre 2026 : absente de le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : au Luxembourg, la marque n''a que deux dépositaires (Cigar Humidor, 2 rue Alphonse Weicker ; Liberté 56), aucune boutique rue Philippe II', `updated_at` = NOW()
 WHERE `id` = 912 AND `country_id` = 'luxembourg';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 18 septembre 2026 : absente de le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : en Espagne, la marque n''a que des estancos dépositaires, aucune boutique calle Serrano', `updated_at` = NOW()
 WHERE `id` = 247 AND `country_id` = 'spain';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 18 septembre 2026 : absente de le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : en Espagne, la marque n''a que des estancos dépositaires, aucune boutique avinguda Diagonal', `updated_at` = NOW()
 WHERE `id` = 251 AND `country_id` = 'spain';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 18 septembre 2026 : absente de le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : ses boutiques en propre de Floride sont à Hollywood (Hard Rock) ; à Miami, six dépositaires, aucun à Bal Harbour', `updated_at` = NOW()
 WHERE `id` = 410 AND `country_id` = 'usa';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 18 septembre 2026 : absente de le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : aucune boutique ni dépositaire à Beverly Hills', `updated_at` = NOW()
 WHERE `id` = 421 AND `country_id` = 'usa';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 18 septembre 2026 : absente de le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : à Hong Kong, les boutiques en propre sont Harbour City, Landmark (15 Queen''s Road Central) et Peninsula, plus deux satellites d''aéroport — pas l''IFC Mall', `updated_at` = NOW()
 WHERE `id` = 383 AND `country_id` = 'hongkong';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 18 septembre 2026 : absente de le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : à Manille, les boutiques en propre sont City of Dreams, Makati Shangri-La et Shangri-La The Fort — pas le SM Megamall', `updated_at` = NOW()
 WHERE `id` = 1175 AND `country_id` = 'philippines';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 18 septembre 2026 : absente de le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : à Taipei, la boutique en propre est la Regent Flagship Boutique, Zhongshan North Road, plus un satellite d''aéroport — pas le Shin Kong Mitsukoshi', `updated_at` = NOW()
 WHERE `id` = 682 AND `country_id` = 'taiwan';
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 18 septembre 2026 : absente de le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : en Chine, les boutiques en propre sont à Pékin (Sanlitun), Ningbo, Shenzhen, Zhengzhou, Jinan et Sanya, plus les satellites d''aéroport — aucune à Shanghai', `updated_at` = NOW()
 WHERE `id` = 375 AND `country_id` = 'china';

-- Davidoff : pays que le localisateur ne couvre pas — on l'écrit, on ne conclut rien
UPDATE `lounges` SET `source` = CONCAT(`source`, ' ; le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) ne couvre pas ce pays'), `updated_at` = NOW()
 WHERE `id` IN (624, 645, 687, 786, 827, 915, 918, 947, 970, 1120, 1123, 1126, 1129, 1132) AND `is_verified` = 1 AND `source` NOT LIKE '%18 septembre 2026%';
UPDATE `lounges` SET `source` = CONCAT(`source`, ' ; le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) ne porte, en France, que ses satellites d''aéroport de Roissy'), `updated_at` = NOW()
 WHERE `id` IN (229, 233, 240) AND `is_verified` = 1 AND `source` NOT LIKE '%18 septembre 2026%';
-- La Cava del Puro : dépositaire Davidoff, une seconde source officielle
UPDATE `lounges` SET `source` = CONCAT(`source`, ' ; le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) la classe dépositaire Davidoff (Davidoff Appointed Merchant)'), `updated_at` = NOW()
 WHERE `id` IN (750, 2566, 2567) AND `is_verified` = 1 AND `source` NOT LIKE '%Appointed Merchant%';

-- ── Les sceaux des traductions réécrites, depuis la colonne ──
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'lounges', l.`id`, 'description', g.lang, SHA1(l.`description`), 'machine', NOW()
  FROM `lounges` l
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de' UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') g
 WHERE l.`id` IN (30, 113, 192, 276, 365, 415, 934)
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `statut` = 'machine', `maj` = NOW();

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 233';
INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 233','systeme','fiche_restauree','lounge',145,'Tbilissi : ouverte le 20 octobre 2025 selon la franchise, rangee en Georgie'),
  (NULL,'migration 233','systeme','fiche_restauree','lounge',114,'plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) : deux Casas à Riyad ; l''annuaire habanos.com (4 437 lieux, lu le 17 septembre 2026) n''y classe que La Casa Cuba'),
  (NULL,'migration 233','systeme','fiche_restauree','lounge',115,'plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) : une Casa à Khobar ; l''annuaire habanos.com (4 437 lieux, lu le 17 septembre 2026) n''y classe que La Casa Cuban'),
  (NULL,'migration 233','systeme','fiche_restauree_avec_reserve','lounge',153,'le plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) compte deux Casas au Canada, Windsor et une seconde sans ville ; l''annuaire habanos.com (4 437 lieux, lu le 1'),
  (NULL,'migration 233','systeme','fiche_restauree_avec_reserve','lounge',154,'le plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) compte deux Casas au Canada, Windsor et une seconde sans ville ; l''annuaire habanos.com (4 437 lieux, lu le 1'),
  (NULL,'migration 233','systeme','fiche_reseau_requalifiee','lounge',112,'plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) : une Casa à Mascate ; l''annuaire habanos.com (4 437 lieux, lu le 17 septembre 2026) classe sa fiche La Casa Del'),
  (NULL,'migration 233','systeme','fiche_reseau_requalifiee','lounge',2497,'plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) : une Casa à Chiang Mai ; l''annuaire habanos.com (4 437 lieux, lu le 17 septembre 2026) classe sa fiche La Casa '),
  (NULL,'migration 233','systeme','fiche_corrigee','lounge',113,'La Casa del Habano — Jeddah (Palestine Street) — PDF officiel Habanos S.A. ; plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) : une Casa à Djeddah ; l''annuaire habanos.co'),
  (NULL,'migration 233','systeme','fiche_corrigee','lounge',30,'La Casa del Habano — Madrid — à vérifier — relu le 18 septembre 2026 : le plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) compte une Casa à Madrid ; l'),
  (NULL,'migration 233','systeme','fiche_corrigee','lounge',192,'La Casa del Habano — León — lacasadelhabano.com, actualité du 7 novembre 2023 : inaugurée le 13 octobre 2023, Plaza Campestre, humidor sur deux niveaux de plus de cinquante mille cigares ('),
  (NULL,'migration 233','systeme','fiche_corrigee','lounge',365,'Davidoff of Geneva since 1911 — Ginza — le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : boutique en propre Davidoff of Geneva since'),
  (NULL,'migration 233','systeme','fiche_corrigee','lounge',415,'Davidoff of Geneva since 1911 — Las Vegas — le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : boutique en propre Davidoff of Geneva since'),
  (NULL,'migration 233','systeme','fiche_corrigee','lounge',934,'Davidoff of Geneva since 1911 — Belgrade — le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : boutique en propre Davidoff of Geneva since'),
  (NULL,'migration 233','systeme','fiche_corrigee','lounge',276,'Davidoff of London — St James''s Street — le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : Davidoff of London, 35 St James''s Street, c'),
  (NULL,'migration 233','systeme','fiche_depubliee','lounge',170,'absente du plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) et de l''annuaire habanos.com (4 437 lieux, lu le 17 septembre 2026) ; la franchise avait annoncé son ouverture à Holetown le 17 mars 2012 (Puros Corp., 180 m²), elle ne la liste plus'),
  (NULL,'migration 233','systeme','fiche_depubliee','lounge',12,'absente du plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) — l''Afrique n''y compte que Lomé et Casablanca — et de l''annuaire habanos.com (4 437 lieux, lu le 17 septembre 2026)'),
  (NULL,'migration 233','systeme','fiche_depubliee','lounge',13,'absente du plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) — l''Afrique n''y compte que Lomé et Casablanca — et de l''annuaire habanos.com (4 437 lieux, lu le 17 septembre 2026)'),
  (NULL,'migration 233','systeme','fiche_depubliee','lounge',166,'absente du plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) et de l''annuaire habanos.com (4 437 lieux, lu le 17 septembre 2026) ; le site de la franchise en parlait encore en octobre 2016'),
  (NULL,'migration 233','systeme','fiche_depubliee','lounge',163,'absente du plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) — 61 Casas d''Amérique latine et des Caraïbes, aucune au Venezuela — et de l''annuaire habanos.com (4 437 lieux, lu le 17 septembre 2026)'),
  (NULL,'migration 233','systeme','fiche_depubliee','lounge',17,'absente du plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) et de l''annuaire habanos.com (4 437 lieux, lu le 17 septembre 2026), qui n''a en Égypte que deux boutiques hors taxes d''aéroport'),
  (NULL,'migration 233','systeme','fiche_depubliee','lounge',469,'absente de le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : au Brésil, la marque n''a que deux dépositaires, Caruso Lounge (Itaim Bibi et Haddock Lobo), aucune boutique en propre'),
  (NULL,'migration 233','systeme','fiche_depubliee','lounge',431,'absente de le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : à Toronto, la marque n''a que des dépositaires (Metro Cigar, 126A Cumberland St, à Yorkville ; Havana Castle ; Avenue Cigars…), aucune boutique en propre au 130 Bloor Street West'),
  (NULL,'migration 233','systeme','fiche_depubliee','lounge',743,'absente de le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : au Chili, la marque n''a qu''un dépositaire, Puros CL, avenida Kennedy 5741, Las Condes'),
  (NULL,'migration 233','systeme','fiche_depubliee','lounge',748,'absente de le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : à Medellín, le dépositaire Davidoff est La Cava del Puro, carrera 38 no 10A-26 — la fiche 2566 de cet atlas —, aucune boutique en propre calle 10'),
  (NULL,'migration 233','systeme','fiche_depubliee','lounge',325,'absente de le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : à Milan, la marque n''a que des dépositaires (via Carducci 12, galleria Vittorio Emanuele II 12, Savinelli via Orefici 2), aucune boutique via Solferino'),
  (NULL,'migration 233','systeme','fiche_depubliee','lounge',327,'absente de le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : à Rome, la marque n''a que des dépositaires (piazza Barberini, via della Rotonda, piazza del Popolo…), aucune boutique via Condotti'),
  (NULL,'migration 233','systeme','fiche_depubliee','lounge',912,'absente de le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : au Luxembourg, la marque n''a que deux dépositaires (Cigar Humidor, 2 rue Alphonse Weicker ; Liberté 56), aucune boutique rue Philippe II'),
  (NULL,'migration 233','systeme','fiche_depubliee','lounge',247,'absente de le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : en Espagne, la marque n''a que des estancos dépositaires, aucune boutique calle Serrano'),
  (NULL,'migration 233','systeme','fiche_depubliee','lounge',251,'absente de le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : en Espagne, la marque n''a que des estancos dépositaires, aucune boutique avinguda Diagonal'),
  (NULL,'migration 233','systeme','fiche_depubliee','lounge',410,'absente de le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : ses boutiques en propre de Floride sont à Hollywood (Hard Rock) ; à Miami, six dépositaires, aucun à Bal Harbour'),
  (NULL,'migration 233','systeme','fiche_depubliee','lounge',421,'absente de le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : aucune boutique ni dépositaire à Beverly Hills'),
  (NULL,'migration 233','systeme','fiche_depubliee','lounge',383,'absente de le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : à Hong Kong, les boutiques en propre sont Harbour City, Landmark (15 Queen''s Road Central) et Peninsula, plus deux satellites d''aéroport — pas l''IFC Mall'),
  (NULL,'migration 233','systeme','fiche_depubliee','lounge',1175,'absente de le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : à Manille, les boutiques en propre sont City of Dreams, Makati Shangri-La et Shangri-La The Fort — pas le SM Megamall'),
  (NULL,'migration 233','systeme','fiche_depubliee','lounge',682,'absente de le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : à Taipei, la boutique en propre est la Regent Flagship Boutique, Zhongshan North Road, plus un satellite d''aéroport — pas le Shin Kong Mitsukoshi'),
  (NULL,'migration 233','systeme','fiche_depubliee','lounge',375,'absente de le localisateur davidoff.com (56 boutiques en propre, 14 partenaires, 1 636 dépositaires, lu le 18 septembre 2026) : en Chine, les boutiques en propre sont à Pékin (Sanlitun), Ningbo, Shenzhen, Zhengzhou, Jinan et Sanya, plus les satellites d''aéroport — aucune à Shanghai'),
  (NULL,'migration 233','systeme','lot_20_reseaux_a_deux_sources','systeme',0,'Le plan des franchises lacasadelhabano.com (30 aout 2026) corrige la 232 : 8 Casas restaurees (dont Tbilissi sous la Georgie, creee), 2 requalifiees, 7 confirmees dans des pays hors annuaire, 6 depubliees absentes des deux listes, 76 presentes dans les deux. Davidoff, localisateur lu en entier : 4 corrigees, 15 depubliees, 17 gardees hors couverture. Regle : une absence se conclut sur deux listes officielles, jamais sur une');

SELECT
  (SELECT COUNT(*) FROM `lounge_countries` WHERE `id` = 'georgia' AND `iso_code` = 'GE') = 1 AS georgie,
  (SELECT `country_id` = 'georgia' AND `is_verified` = 1 FROM `lounges` WHERE `id` = 145) AS tbilissi_en_georgie,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (145, 114, 115, 153, 154, 113, 30, 192) AND `is_verified` = 1) = 8 AS restaurees,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (112, 2497, 113) AND `type` = 'La Casa del Habano Officielle') = 3 AS requalifiees,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (170, 12, 13, 166, 163, 17, 469, 431, 743, 748, 325, 327, 912, 247, 251, 410, 421, 383, 1175, 682, 375) AND `is_verified` = 0 AND `source` LIKE 'RETIRÉ — relu le 18 septembre 2026%') = 21 AS depubliees,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (14, 15, 39, 40, 42, 43, 44, 45, 50, 52, 53, 55, 58, 59, 60, 62, 64, 65, 67, 68, 70, 71, 74, 75, 76, 80, 82, 83, 85, 87, 88, 91, 92, 94, 96, 97, 98, 99, 101, 102, 103, 104, 106, 108, 109, 110, 111, 116, 122, 123, 127, 130, 134, 136, 140, 155, 156, 157, 161, 162, 164, 174, 175, 177, 185, 187, 188, 190, 191, 193, 330, 384, 1171, 2561, 2562, 2564, 165, 167, 168, 169, 172, 173, 2542) AND `source` LIKE '%30 août 2026%') = 83 AS plan_ajoute,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (624, 645, 687, 786, 827, 915, 918, 947, 970, 1120, 1123, 1126, 1129, 1132, 229, 233, 240) AND `is_verified` = 1 AND `source` LIKE '%18 septembre 2026%') = 17 AS davidoff_gardees,
  (SELECT `name` LIKE 'Davidoff of London%%' AND `website` = 'https://www.davidofflondon.com/' FROM `lounges` WHERE `id` = 276) AS londres_depositaire,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (750, 2566, 2567) AND `source` LIKE '%%Appointed Merchant%%') = 3 AS cava_depositaire,
  (SELECT COUNT(*) FROM `translation_status` t JOIN `lounges` l ON l.`id` = t.`entite_id` WHERE t.`entite` = 'lounges' AND t.`champ` = 'description' AND l.`id` IN (30, 113, 192, 276, 365, 415, 934) AND t.`source_hash` = SHA1(l.`description`)) = 35 AS sceaux_a_jour,
  (SELECT COUNT(*) FROM `lounges` WHERE CHAR_LENGTH(`source`) >= 495) = 0 AS aucune_source_tronquee;
SELECT COUNT(*) AS publiables FROM `lounges` WHERE `is_verified` = 1;