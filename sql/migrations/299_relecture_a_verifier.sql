-- ════════════════════════════════════════════════════════
-- 299 — Relecture des fiches « à vérifier » (franchises et autres)
-- ────────────────────────────────────────────────────────
-- CE QU'ON A TROUVÉ. Relecture des 29-30 octobre 2026 (expert-cigare) des 120
-- fiches laissées « à vérifier » par la 297. Les franchises (La Casa del Habano,
-- Cohiba Atmosphere, Davidoff) exigent deux listes officielles ; la liste
-- habanos.com (pages « place ») est restée illisible, la liste Davidoff aussi.
-- 1. 43 fiches reprises : adresse corrigée quand une liste officielle la donne,
--    description ramenée à ce que les sources lues établissent, `source` écrite
--    « à vérifier — relu le 30 octobre 2026 : … ». Traductions (expert-traduction)
--    remises en « machine », sceau recalculé. #113 et #2497 renommées : le
--    directoire lacasadelhabano.com n'a aucune Casa en Arabie saoudite ni à Chiang Mai.
-- 2. 6 fiches retirées (`is_verified = 0`) : l'établissement publie la liste de ses
--    bars sans salon cigares (règle 155 : #386, #787, #951, #813, #1130) ou ne
--    mentionne aucun service cigares (#1449).
-- 3. 17 fiches enrichies (téléphone, site, Instagram, horaires lus sur la page
--    officielle), SEULEMENT là où la colonne était vide.
-- Les autres restent à vérifier : le silence seul ne retire rien.
-- ════════════════════════════════════════════════════════

UPDATE `lounges` SET
  `city` = 'Bruxelles — Rue Faider 1C, 1060 Saint-Gilles',
  `description` = 'Boutique franchisée La Casa del Habano de Bruxelles (Louise), rue Faider 1C. Habanos S.A. y indique Laguito 1492 comme distributeur exclusif.',
  `description_en` = 'Franchised La Casa del Habano shop in Brussels (Louise), rue Faider 1C. Habanos S.A. lists Laguito 1492 there as exclusive distributor.',
  `description_es` = 'Tienda franquiciada La Casa del Habano de Bruselas (Louise), rue Faider 1C. Habanos S.A. indica allí a Laguito 1492 como distribuidor exclusivo.',
  `description_de` = 'Franchise-Geschäft La Casa del Habano in Brüssel (Louise), rue Faider 1C. Habanos S.A. nennt dort Laguito 1492 als Exklusivdistributor.',
  `description_zh` = '布鲁塞尔(Louise)的 La Casa del Habano 特许经营店,位于 rue Faider 1C。Habanos S.A. 在该店处注明 Laguito 1492 为独家经销商。',
  `description_ar` = 'متجر امتياز La Casa del Habano في بروكسل (Louise)، rue Faider 1C. تذكر Habanos S.A. هناك Laguito 1492 كموزّع حصري.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : lacasadelhabano.com, LCDH Bruselas – Rue Faider 1C, 1060; habanos.com, La Casa del Habano Brussels – Louise, Rue Faider 1C ; distributeur Laguito 1492',
  `updated_at` = NOW()
 WHERE `id` = 53 AND `country_id` = 'belgium' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Maastricht — Stationsstraat 33A, 6221 BN',
  `description` = 'La Casa del Habano de Maastricht, franchise inscrite au plan lacasadelhabano.com, Stationsstraat.',
  `description_en` = 'La Casa del Habano in Maastricht, a franchise listed on the lacasadelhabano.com map, Stationsstraat.',
  `description_es` = 'La Casa del Habano de Maastricht, franquicia inscrita en el mapa de lacasadelhabano.com, Stationsstraat.',
  `description_de` = 'La Casa del Habano in Maastricht, Franchise auf der Karte von lacasadelhabano.com verzeichnet, Stationsstraat.',
  `description_zh` = '马斯特里赫特的 La Casa del Habano,列于 lacasadelhabano.com 地图上的特许经营店,位于 Stationsstraat。',
  `description_ar` = 'La Casa del Habano في ماستريخت، امتياز مدرج على خريطة lacasadelhabano.com، Stationsstraat.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : lacasadelhabano.com, LCDH Maastricht : Stationsstraat 33, 6221 BN, Maastricht; lacasadelhabanomaastricht.nl, Stationsstraat 33A, 6221 BN Maastricht ; mardi-samedi 10:00-18:00',
  `updated_at` = NOW()
 WHERE `id` = 60 AND `country_id` = 'netherlands' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Plaça Coprínceps 3, AD700 Escaldes-Engordany',
  `description` = 'Boutique franchisée La Casa del Habano, plaça Coprínceps 3 à Escaldes-Engordany. Ouverte en 1995 d''après le site de la boutique. Habanos S.A. y indique Maori Tabacs S.A. comme distributeur exclusif.',
  `description_en` = 'Franchised La Casa del Habano shop, plaça Coprínceps 3 in Escaldes-Engordany. Opened in 1995 according to the shop''s website. Habanos S.A. lists Maori Tabacs S.A. there as exclusive distributor.',
  `description_es` = 'Tienda franquiciada La Casa del Habano, plaça Coprínceps 3, en Escaldes-Engordany. Abierta en 1995 según el sitio web de la tienda. Habanos S.A. indica allí a Maori Tabacs S.A. como distribuidor exclusivo.',
  `description_de` = 'Franchise-Geschäft La Casa del Habano, plaça Coprínceps 3 in Escaldes-Engordany. Laut der Website des Geschäfts 1995 eröffnet. Habanos S.A. nennt dort Maori Tabacs S.A. als Exklusivdistributor.',
  `description_zh` = 'La Casa del Habano 特许经营店,位于埃斯卡尔德斯-恩戈尔达尼的 plaça Coprínceps 3。据该店网站称,开业于1995年。Habanos S.A. 在该店处注明 Maori Tabacs S.A. 为独家经销商。',
  `description_ar` = 'متجر امتياز La Casa del Habano، plaça Coprínceps 3 في إسكالديس-إنغورداني. افتُتح عام 1995 بحسب موقع المتجر. تذكر Habanos S.A. هناك Maori Tabacs S.A. كموزّع حصري.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : lacasadelhabano.com, LCDH Andorra – Plaza Coprinceps 3, AD700 Escaldes-Engordany; habanos.com, Plaça Coprincep, 3, Escaldes-Engordany ; distributeur exclusif Maori Tabacs S.A; lacasadelhabanoandorra.com, site de la boutique : Plaça Coprínceps, 3, AD700 ; année d''ouverture 1995',
  `updated_at` = NOW()
 WHERE `id` = 63 AND `country_id` = 'andorra' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Sofia — Mall of Sofia, 101 Alexander Stamboliyski Blvd.',
  `description` = 'Boutique franchisée La Casa del Habano dans le Mall of Sofia, 101 boulevard Alexander Stamboliyski. Habanos S.A. y indique Kaliman Caribe comme distributeur exclusif.',
  `description_en` = 'Franchised La Casa del Habano shop in Mall of Sofia, 101 Alexander Stamboliyski Boulevard. Habanos S.A. lists Kaliman Caribe there as exclusive distributor.',
  `description_es` = 'Tienda franquiciada La Casa del Habano en el Mall of Sofia, 101 bulevar Alexander Stamboliyski. Habanos S.A. indica allí a Kaliman Caribe como distribuidor exclusivo.',
  `description_de` = 'Franchise-Geschäft La Casa del Habano in der Mall of Sofia, 101 Alexander-Stamboliyski-Boulevard. Habanos S.A. nennt dort Kaliman Caribe als Exklusivdistributor.',
  `description_zh` = 'La Casa del Habano 特许经营店,位于索非亚购物中心(Mall of Sofia),Alexander Stamboliyski 大道101号。Habanos S.A. 在该店处注明 Kaliman Caribe 为独家经销商。',
  `description_ar` = 'متجر امتياز La Casa del Habano في Mall of Sofia، 101 شارع Alexander Stamboliyski. تذكر Habanos S.A. هناك Kaliman Caribe كموزّع حصري.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : lacasadelhabano.com, LCDH Sofia/Mall : Mall of Sofía, 101 Alexander Stamboliyski Blvd; habanos.com, 101 Alexander Stamboliyski Blvd., Sofia 1000 ; distributeur Kaliman Caribe',
  `updated_at` = NOW()
 WHERE `id` = 68 AND `country_id` = 'bulgaria' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Sofia — 22 San Stefano Str., San Stefano Plaza, rez-de-chaussée, 1000',
  `description` = 'Cohiba Atmosphere de Sofia, exploité par Kaliman Caribe sous licence Habanos S.A. ; ouvert le 20 décembre 2017 selon Habanos S.A.',
  `description_en` = 'Cohiba Atmosphere in Sofia, operated by Kaliman Caribe under licence from Habanos S.A.; opened on 20 December 2017 according to Habanos S.A.',
  `description_es` = 'Cohiba Atmosphere de Sofía, explotado por Kaliman Caribe bajo licencia de Habanos S.A.; abierto el 20 de diciembre de 2017 según Habanos S.A.',
  `description_de` = 'Cohiba Atmosphere in Sofia, betrieben von Kaliman Caribe unter Lizenz von Habanos S.A.; laut Habanos S.A. am 20. Dezember 2017 eröffnet.',
  `description_zh` = '索非亚的 Cohiba Atmosphere,由 Kaliman Caribe 经 Habanos S.A. 授权运营;据 Habanos S.A. 称,于2017年12月20日开业。',
  `description_ar` = 'Cohiba Atmosphere في صوفيا، تديره Kaliman Caribe بترخيص من Habanos S.A.؛ افتُتح في 20 ديسمبر 2017 بحسب Habanos S.A.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : habanos.com, Cohiba Atmosphere Sofia — 22 San Stefano Str., Sofia 1000 ; Kaliman Caribe; cohibaatmosphere.bg, 22 San Stefano Str., Sofia, San Stefano Plaza, ground floor ; 10:00-24:00; habanos.com, Ouvert le 20 décembre 2017',
  `updated_at` = NOW()
 WHERE `id` = 69 AND `country_id` = 'bulgaria' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Bucarest — J.W. Marriott Bucharest Grand Hotel, Calea 13 Septembrie 90, 050726',
  `description` = 'Boutique d''El Único à l''hôtel J.W. Marriott de Bucarest, inscrite au plan des franchises lacasadelhabano.com comme La Casa del Habano (El Único).',
  `description_en` = 'El Único shop in the J.W. Marriott hotel in Bucharest, listed on the lacasadelhabano.com franchise map as La Casa del Habano (El Único).',
  `description_es` = 'Tienda de El Único en el hotel J.W. Marriott de Bucarest, inscrita en el mapa de franquicias de lacasadelhabano.com como La Casa del Habano (El Único).',
  `description_de` = 'Geschäft von El Único im Hotel J.W. Marriott in Bukarest, auf der Franchise-Karte von lacasadelhabano.com als La Casa del Habano (El Único) verzeichnet.',
  `description_zh` = 'El Único 的店铺,位于布加勒斯特 J.W. Marriott 酒店内,在 lacasadelhabano.com 的特许经营店地图上列为 La Casa del Habano (El Único)。',
  `description_ar` = 'متجر El Único في فندق J.W. Marriott في بوخارست، مدرج على خريطة الامتيازات في lacasadelhabano.com باسم La Casa del Habano (El Único).',
  `source` = 'à vérifier — relu le 30 octobre 2026 : lacasadelhabano.com, El Único (LCDH Bucharest) : J.W. Marriott Bucharest, Calea 13 Septembrie 90; el-unico.ro, Liste des magasins : J.W. Marriott, Calea 13 Septembrie nr. 90 ; Athénée Palace absent',
  `updated_at` = NOW()
 WHERE `id` = 76 AND `country_id` = 'romania' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Prague — Kaprova 5, Prague 1, 110 00',
  `description` = 'Cohiba Atmosphere de Prague, répertorié par habanos.com au Kaprova 5 ; Tabak Invest A.S. est le distributeur exclusif indiqué.',
  `description_en` = 'Cohiba Atmosphere in Prague, listed by habanos.com at Kaprova 5; Tabak Invest A.S. is the exclusive distributor indicated.',
  `description_es` = 'Cohiba Atmosphere de Praga, registrado por habanos.com en Kaprova 5; Tabak Invest A.S. figura como distribuidor exclusivo.',
  `description_de` = 'Cohiba Atmosphere in Prag, von habanos.com unter Kaprova 5 aufgeführt; als Exklusivdistributor ist Tabak Invest A.S. angegeben.',
  `description_zh` = '布拉格的 Cohiba Atmosphere,habanos.com 登记地址为 Kaprova 5;注明的独家经销商为 Tabak Invest A.S.。',
  `description_ar` = 'Cohiba Atmosphere في براغ، مدرج لدى habanos.com على العنوان Kaprova 5؛ والموزّع الحصري المذكور هو Tabak Invest A.S.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : habanos.com, Cohiba Atmosphere Praga — Kaprova 5, Praha 1, 110 00 ; Tabak Invest A.S; labodeguitadelmedio.cz, Kaprova 5, Praha 1 ; parle de « Atmosphere Lounge »',
  `updated_at` = NOW()
 WHERE `id` = 81 AND `country_id` = 'czech' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Dubai — The Walk, Jumeirah Beach Residence Complex, face au Ritz-Carlton, Dubai Marina',
  `description` = 'La Casa del Habano de The Walk, Jumeirah Beach Residence, à Dubaï. Franchise répertoriée par habanos.com et par le plan des franchises de lacasadelhabano.com.',
  `description_en` = 'La Casa del Habano at The Walk, Jumeirah Beach Residence, in Dubai. Franchise listed by habanos.com and on the lacasadelhabano.com franchise map.',
  `description_es` = 'La Casa del Habano de The Walk, Jumeirah Beach Residence, en Dubái. Franquicia registrada por habanos.com y en el mapa de franquicias de lacasadelhabano.com.',
  `description_de` = 'La Casa del Habano in The Walk, Jumeirah Beach Residence, in Dubai. Franchise von habanos.com und auf der Franchise-Karte von lacasadelhabano.com aufgeführt.',
  `description_zh` = '迪拜 Jumeirah Beach Residence 的 The Walk 内的 La Casa del Habano。该特许经营店列于 habanos.com 以及 lacasadelhabano.com 的特许经营店地图。',
  `description_ar` = 'La Casa del Habano في The Walk، Jumeirah Beach Residence، في دبي. امتياز مدرج لدى habanos.com وعلى خريطة الامتيازات في lacasadelhabano.com.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : habanos.com, Type La Casa del Habano ; The Walk, Jumeirah Beach Residence Complex, Opp. Ritz Carlton; lacasadelhabano.com, LCDH Dubai /Jumeirah Beach — The Walk, Jumeirah Beach Residence Complex; habanos.com, Liste BME active du 16 oct. 2018 : Jumeirah Beach Residence',
  `updated_at` = NOW()
 WHERE `id` = 97 AND `country_id` = 'uae' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Dubai International Airport — Terminal 3, Unit 4, Dubai Duty Free',
  `description` = 'La Casa del Habano du Dubai Duty Free, terminal 3, unité 4, à l''aéroport international de Dubaï. Franchise répertoriée par habanos.com et par le plan des franchises de lacasadelhabano.com.',
  `description_en` = 'La Casa del Habano at Dubai Duty Free, Terminal 3, Unit 4, at Dubai International Airport. Franchise listed by habanos.com and on the lacasadelhabano.com franchise map.',
  `description_es` = 'La Casa del Habano de Dubai Duty Free, terminal 3, unidad 4, en el aeropuerto internacional de Dubái. Franquicia registrada por habanos.com y en el mapa de franquicias de lacasadelhabano.com.',
  `description_de` = 'La Casa del Habano bei Dubai Duty Free, Terminal 3, Einheit 4, am Dubai International Airport. Franchise von habanos.com und auf der Franchise-Karte von lacasadelhabano.com aufgeführt.',
  `description_zh` = '迪拜国际机场3号航站楼 Dubai Duty Free 4号店铺内的 La Casa del Habano。该特许经营店列于 habanos.com 以及 lacasadelhabano.com 的特许经营店地图。',
  `description_ar` = 'La Casa del Habano في Dubai Duty Free، المبنى 3، الوحدة 4، في مطار دبي الدولي. امتياز مدرج لدى habanos.com وعلى خريطة الامتيازات في lacasadelhabano.com.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : habanos.com, Terminal 3, Unit 4, Dubai Duty Free, Dubai International Airport; lacasadelhabano.com, LCDH Dubai/D.F.Terminal III — Terminal III Unit 4, Dubai Duty Free; habanos.com, Liste BME 2018 : Dubai Duty Free',
  `updated_at` = NOW()
 WHERE `id` = 98 AND `country_id` = 'uae' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Abu Dhabi — Abu Dhabi Mall, Level 1',
  `description` = 'La Casa del Habano de l''Abu Dhabi Mall (niveau 1), à Abu Dhabi. Franchise répertoriée par habanos.com et par le plan des franchises de lacasadelhabano.com.',
  `description_en` = 'La Casa del Habano at Abu Dhabi Mall (level 1), in Abu Dhabi. Franchise listed by habanos.com and on the lacasadelhabano.com franchise map.',
  `description_es` = 'La Casa del Habano del Abu Dhabi Mall (nivel 1), en Abu Dabi. Franquicia registrada por habanos.com y en el mapa de franquicias de lacasadelhabano.com.',
  `description_de` = 'La Casa del Habano in der Abu Dhabi Mall (Ebene 1), in Abu Dhabi. Franchise von habanos.com und auf der Franchise-Karte von lacasadelhabano.com aufgeführt.',
  `description_zh` = '阿布扎比 Abu Dhabi Mall(1层)内的 La Casa del Habano。该特许经营店列于 habanos.com 以及 lacasadelhabano.com 的特许经营店地图。',
  `description_ar` = 'La Casa del Habano في Abu Dhabi Mall (المستوى 1)، في أبوظبي. امتياز مدرج لدى habanos.com وعلى خريطة الامتيازات في lacasadelhabano.com.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : habanos.com, La Casa del Habano – Abu Dhabi ; Abu Dhabi Mall, Level 1; lacasadelhabano.com, LCDH Abu Dhabi /Mall — Abu Dhabi Mall, Level 1; habanos.com, Liste BME 2018 : Abu Dhabi Mall, +971 2 644 1505',
  `updated_at` = NOW()
 WHERE `id` = 99 AND `country_id` = 'uae' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Doha — Unit 27, Porto Arabia Tower 1, The Pearl Qatar',
  `description` = 'La Casa del Habano de Doha, à Porto Arabia (The Pearl Qatar), inscrite au plan des franchises lacasadelhabano.com.',
  `description_en` = 'La Casa del Habano in Doha, at Porto Arabia (The Pearl Qatar), listed on the lacasadelhabano.com franchise map.',
  `description_es` = 'La Casa del Habano de Doha, en Porto Arabia (The Pearl Qatar), inscrita en el mapa de franquicias de lacasadelhabano.com.',
  `description_de` = 'La Casa del Habano in Doha, in Porto Arabia (The Pearl Qatar), auf der Franchise-Karte von lacasadelhabano.com verzeichnet.',
  `description_zh` = '多哈的 La Casa del Habano,位于 Porto Arabia(The Pearl Qatar),列于 lacasadelhabano.com 的特许经营店地图。',
  `description_ar` = 'La Casa del Habano في الدوحة، في Porto Arabia (The Pearl Qatar)، مدرج على خريطة الامتيازات في lacasadelhabano.com.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : lacasadelhabano.com, Unit no. 27, Porto Arabia Tower 1, The Pearl, Doha-Qatar; lacasadelhabano.com, Qatar : « LCDH Doha The Pearl »',
  `updated_at` = NOW()
 WHERE `id` = 101 AND `country_id` = 'qatar' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Doha — Unit 13, Al Rayyan Complex, Al Rayyan Street',
  `description` = 'La Casa del Habano de Doha, dans le complexe Al Rayyan (Al Rayyan Street), inscrite au plan des franchises lacasadelhabano.com.',
  `description_en` = 'La Casa del Habano in Doha, in the Al Rayyan complex (Al Rayyan Street), listed on the lacasadelhabano.com franchise map.',
  `description_es` = 'La Casa del Habano de Doha, en el complejo Al Rayyan (Al Rayyan Street), inscrita en el mapa de franquicias de lacasadelhabano.com.',
  `description_de` = 'La Casa del Habano in Doha, im Komplex Al Rayyan (Al Rayyan Street), auf der Franchise-Karte von lacasadelhabano.com verzeichnet.',
  `description_zh` = '多哈的 La Casa del Habano,位于 Al Rayyan 综合体(Al Rayyan Street),列于 lacasadelhabano.com 的特许经营店地图。',
  `description_ar` = 'La Casa del Habano في الدوحة، في مجمّع Al Rayyan (Al Rayyan Street)، مدرج على خريطة الامتيازات في lacasadelhabano.com.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : lacasadelhabano.com, Unit no.13, Al Rayyan Complex, Al Rayyan Street, Doha; lacasadelhabano.com, Qatar : « LCDH Doha »',
  `updated_at` = NOW()
 WHERE `id` = 102 AND `country_id` = 'qatar' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Salmiya (Koweït) — Marina Mall, Marina Mall Crescent',
  `description` = 'Cohiba Atmosphere du Marina Mall, à Salmiya, répertorié par habanos.com ; Phoenicia T.A.A. (Cyprus) Limited est le distributeur exclusif indiqué.',
  `description_en` = 'Cohiba Atmosphere at Marina Mall, in Salmiya, listed by habanos.com; Phoenicia T.A.A. (Cyprus) Limited is the exclusive distributor indicated.',
  `description_es` = 'Cohiba Atmosphere del Marina Mall, en Salmiya, registrado por habanos.com; Phoenicia T.A.A. (Cyprus) Limited figura como distribuidor exclusivo.',
  `description_de` = 'Cohiba Atmosphere in der Marina Mall, in Salmiya, von habanos.com aufgeführt; als Exklusivdistributor ist Phoenicia T.A.A. (Cyprus) Limited angegeben.',
  `description_zh` = 'Salmiya 的 Marina Mall 内的 Cohiba Atmosphere,列于 habanos.com;注明的独家经销商为 Phoenicia T.A.A. (Cyprus) Limited。',
  `description_ar` = 'Cohiba Atmosphere في Marina Mall، في السالمية، مدرج لدى habanos.com؛ والموزّع الحصري المذكور هو Phoenicia T.A.A. (Cyprus) Limited.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : habanos.com, Cohiba Atmosphere, Marina Mall — Marina Mall Crescent, Salmiya, Kuwait ; Phoenicia; cigaraficionado.com, Avril 2016 : Kuwait parmi les Cohiba Atmosphere existants',
  `updated_at` = NOW()
 WHERE `id` = 105 AND `country_id` = 'kuwait' AND `is_verified` = 1;

UPDATE `lounges` SET
  `name` = 'La Casa Cubana — Djeddah (Palestine Street)',
  `city` = 'Jeddah — Palestine Street, Al Hamra',
  `description` = 'Point de vente de Djeddah, Palestine Street, dans le quartier d''Al Hamra, classé Habanos Specialist sous le nom La Casa Cubana dans l''annuaire habanos.com. Absent du directoire des franchises La Casa del Habano (lacasadelhabano.com).',
  `description_en` = 'Point of sale in Jeddah, Palestine Street, in the Al Hamra district, classified as Habanos Specialist under the name La Casa Cubana in the habanos.com directory. Absent from the La Casa del Habano franchise directory (lacasadelhabano.com).',
  `description_es` = 'Punto de venta de Yeda, Palestine Street, en el barrio de Al Hamra, clasificado como Habanos Specialist con el nombre La Casa Cubana en el directorio de habanos.com. No figura en el directorio de franquicias La Casa del Habano (lacasadelhabano.com).',
  `description_de` = 'Verkaufsstelle in Dschidda, Palestine Street, im Viertel Al Hamra, im Verzeichnis von habanos.com unter dem Namen La Casa Cubana als Habanos Specialist eingestuft. Nicht im Franchise-Verzeichnis von La Casa del Habano (lacasadelhabano.com) enthalten.',
  `description_zh` = '位于吉达 Palestine Street、Al Hamra 区的销售点,在 habanos.com 名录中以 La Casa Cubana 之名列为 Habanos Specialist。未列入 La Casa del Habano 特许经营店名录(lacasadelhabano.com)。',
  `description_ar` = 'نقطة بيع في جدة، Palestine Street، في حي الحمراء، مصنّفة Habanos Specialist باسم La Casa Cubana في دليل habanos.com. غير مدرجة في دليل امتيازات La Casa del Habano (lacasadelhabano.com).',
  `source` = 'à vérifier — relu le 30 octobre 2026 : lacasadelhabano.com, page relue : aucune entrée Arabie saoudite dans le directoire des franchises; moodiedavittreport.com, La Casa Cubana, official distributor of Habanos cigars in Saudi Arabia',
  `updated_at` = NOW()
 WHERE `id` = 113 AND `country_id` = 'saudiarabia' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Beijing — adresse non recoupée (China Central Place non attesté)',
  `description` = 'Cohiba Atmosphere de Beijing, réseau Habanos ; ouverture d''un nouveau club le 30 juillet 2020 selon Habanos S.A. ; adresse actuelle non recoupée.',
  `description_en` = 'Cohiba Atmosphere in Beijing, Habanos network; a new club opened on 30 July 2020 according to Habanos S.A.; current address not cross-checked.',
  `description_es` = 'Cohiba Atmosphere de Pekín, red Habanos; apertura de un nuevo club el 30 de julio de 2020 según Habanos S.A.; dirección actual no contrastada.',
  `description_de` = 'Cohiba Atmosphere in Peking, Habanos-Netzwerk; laut Habanos S.A. Eröffnung eines neuen Clubs am 30. Juli 2020; aktuelle Adresse nicht gegengeprüft.',
  `description_zh` = '北京的 Cohiba Atmosphere,属 Habanos 网络;据 Habanos S.A. 称,一家新俱乐部于2020年7月30日开业;现址未经交叉核实。',
  `description_ar` = 'Cohiba Atmosphere في بكين، ضمن شبكة Habanos؛ افتتاح نادٍ جديد في 30 يوليو 2020 بحسب Habanos S.A.؛ العنوان الحالي لم يُتحقق منه بمصادر أخرى.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : habanos.com, Ouverture 30 juillet 2020, en périphérie, sans adresse; habanos.com, Réouverture 2018 : L217-L218, 8 Wangfujing East Street',
  `updated_at` = NOW()
 WHERE `id` = 126 AND `country_id` = 'china' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Hong Kong — 21/F, Hing Wai Building, 36 Queen''s Road Central',
  `description` = 'Cohiba Atmosphere de Hong Kong, club réservé aux membres, exploité par The Pacific Cigar Co. Ltd. ; ouvert en 2007 selon Habanos S.A.',
  `description_en` = 'Cohiba Atmosphere in Hong Kong, a members-only club, operated by The Pacific Cigar Co. Ltd.; opened in 2007 according to Habanos S.A.',
  `description_es` = 'Cohiba Atmosphere de Hong Kong, club reservado a los socios, explotado por The Pacific Cigar Co. Ltd.; abierto en 2007 según Habanos S.A.',
  `description_de` = 'Cohiba Atmosphere in Hongkong, ein Club nur für Mitglieder, betrieben von The Pacific Cigar Co. Ltd.; laut Habanos S.A. 2007 eröffnet.',
  `description_zh` = '香港的 Cohiba Atmosphere,仅限会员的俱乐部,由 The Pacific Cigar Co. Ltd. 运营;据 Habanos S.A. 称,于2007年开业。',
  `description_ar` = 'Cohiba Atmosphere في هونغ كونغ، نادٍ مخصّص للأعضاء فقط، تديره The Pacific Cigar Co. Ltd.؛ افتُتح عام 2007 بحسب Habanos S.A.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : habanos.com, Cohiba Atmosphere – Members Only, 21/F, Hing Wai Building, 36 Queen''s Road Central; habanos.com, 10 ans du Cohiba Atmosphere de Hong Kong (2017)',
  `updated_at` = NOW()
 WHERE `id` = 128 AND `country_id` = 'hongkong' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Taipei — The Lobby, Grand Hyatt Taipei, 2 Sung Shou Road',
  `description` = 'Casa del Habano de Taipei, dans le hall du Grand Hyatt Taipei, 2 Sung Shou Road, quartier de Xinyi ; approvisionnée par Pacific Cigar, distributeur d''Habanos pour l''Asie-Pacifique.',
  `description_en` = 'Casa del Habano in Taipei, in the lobby of the Grand Hyatt Taipei, 2 Sung Shou Road, Xinyi district; supplied by Pacific Cigar, Habanos distributor for Asia-Pacific.',
  `description_es` = 'Casa del Habano de Taipéi, en el vestíbulo del Grand Hyatt Taipei, 2 Sung Shou Road, distrito de Xinyi; abastecida por Pacific Cigar, distribuidor de Habanos para Asia-Pacífico.',
  `description_de` = 'Casa del Habano in Taipeh, in der Lobby des Grand Hyatt Taipei, 2 Sung Shou Road, Bezirk Xinyi; beliefert von Pacific Cigar, dem Habanos-Distributor für Asien-Pazifik.',
  `description_zh` = '台北的 Casa del Habano,位于信义区 Grand Hyatt Taipei(台北君悦酒店)大堂,松寿路2号(2 Sung Shou Road);由 Habanos 亚太区经销商 Pacific Cigar 供货。',
  `description_ar` = 'Casa del Habano في تايبيه، في بهو Grand Hyatt Taipei، 2 Sung Shou Road، منطقة شينيي؛ تتزوّد من Pacific Cigar، موزّع Habanos لمنطقة آسيا والمحيط الهادئ.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : lacasadelhabano.com, LCDH Taipei, The Lobby, Grand Hyatt Taipei, 2 Sung Shou Road; cigarinspector.com, titre : Inside La Casa del Habano at the Grand Hyatt Taipei (page 403, titre vu en recherche)',
  `updated_at` = NOW()
 WHERE `id` = 130 AND `country_id` = 'taiwan' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Kuala Lumpur — Ground Floor, Bangsar Shopping Centre, 285 Jalan Maarof',
  `description` = 'WIP, restaurant-bar du Bangsar Shopping Centre, désigné Habanos Terrace par Habanos S.A. en 2018. Statut actuel non recoupé.',
  `description_en` = 'WIP, a restaurant-bar in Bangsar Shopping Centre, designated Habanos Terrace by Habanos S.A. in 2018. Current status not cross-checked.',
  `description_es` = 'WIP, restaurante-bar del Bangsar Shopping Centre, designado Habanos Terrace por Habanos S.A. en 2018. Estado actual no contrastado.',
  `description_de` = 'WIP, Restaurant-Bar im Bangsar Shopping Centre, 2018 von Habanos S.A. als Habanos Terrace ausgewiesen. Aktueller Status nicht gegengeprüft.',
  `description_zh` = 'WIP,位于 Bangsar Shopping Centre 的餐厅酒吧,2018年被 Habanos S.A. 指定为 Habanos Terrace。现状未经交叉核实。',
  `description_ar` = 'WIP، مطعم وبار في Bangsar Shopping Centre، صنّفته Habanos S.A. عام 2018 بصفة Habanos Terrace. الوضع الحالي لم يُتحقق منه بمصادر أخرى.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : cigarjournal.com, Habanos S.A. designe WIP Malaysia''s first and only Habanos Terrace (2018)',
  `updated_at` = NOW()
 WHERE `id` = 135 AND `country_id` = 'malaysia' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Bangkok — 63/3 Soi Ruamrudee, Ploenchit Road, Lumpini, Pathumwan, 10330 (étage 2)',
  `description` = 'Salon Cohiba Atmosphere de Bangkok, dans le quartier de Lumpini, ouvert vers 2016 sous la marque Cohiba Atmosphere du réseau Habanos.',
  `description_en` = 'Cohiba Atmosphere lounge in Bangkok, in the Lumpini district, opened around 2016 under the Cohiba Atmosphere brand of the Habanos network.',
  `description_es` = 'Salón Cohiba Atmosphere de Bangkok, en el barrio de Lumpini, abierto hacia 2016 bajo la marca Cohiba Atmosphere de la red Habanos.',
  `description_de` = 'Cohiba-Atmosphere-Lounge in Bangkok, im Viertel Lumpini, um 2016 unter der Marke Cohiba Atmosphere des Habanos-Netzwerks eröffnet.',
  `description_zh` = '曼谷的 Cohiba Atmosphere 雪茄沙龙,位于 Lumpini 区,约于2016年以 Habanos 网络的 Cohiba Atmosphere 品牌开业。',
  `description_ar` = 'صالون Cohiba Atmosphere في بانكوك، في حي لومبيني، افتُتح نحو عام 2016 تحت علامة Cohiba Atmosphere ضمن شبكة Habanos.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : bkmagazine.com, 2/F, Cohiba Atmosphere, 63/3 Soi Ruamrudee, Phloen Chit Rd (liste 2018); cigaraficionado.com, Bangkok : 3 000 sq ft, restaurant italien, bar, 75 casiers (2016)',
  `updated_at` = NOW()
 WHERE `id` = 137 AND `country_id` = 'thailand' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Buenos Aires — Reconquista 976, Retiro, C1003',
  `description` = 'Boutique franchisée La Casa del Habano de Buenos Aires, Reconquista 976, quartier de Retiro. Habanos S.A. y indique Puro Tabaco S.A. comme distributeur exclusif.',
  `description_en` = 'Franchised La Casa del Habano shop in Buenos Aires, Reconquista 976, Retiro district. Habanos S.A. lists Puro Tabaco S.A. there as exclusive distributor.',
  `description_es` = 'Tienda franquiciada La Casa del Habano de Buenos Aires, Reconquista 976, barrio de Retiro. Habanos S.A. indica allí a Puro Tabaco S.A. como distribuidor exclusivo.',
  `description_de` = 'Franchise-Geschäft La Casa del Habano in Buenos Aires, Reconquista 976, Viertel Retiro. Habanos S.A. nennt dort Puro Tabaco S.A. als Exklusivdistributor.',
  `description_zh` = '布宜诺斯艾利斯的 La Casa del Habano 特许经营店,位于 Retiro 区 Reconquista 976。Habanos S.A. 在该店处注明 Puro Tabaco S.A. 为独家经销商。',
  `description_ar` = 'متجر امتياز La Casa del Habano في بوينس آيرس، Reconquista 976، حي ريتيرو. تذكر Habanos S.A. هناك Puro Tabaco S.A. كموزّع حصري.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : lacasadelhabano.com, LA CASA DEL HABANO DE BUENOS AIRES – Reconquista 976, Retiro, CABA (C1003); habanos.com, Reconquista 976, CABA C1003ABT ; distributeur exclusif Puro Tabaco S.A',
  `updated_at` = NOW()
 WHERE `id` = 157 AND `country_id` = 'argentina' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Buenos Aires — Moreno 518, San Telmo, C1091AAL',
  `description` = 'Cohiba Atmosphere de Buenos Aires, dans le quartier de San Telmo ; Puro Tabaco S.A. est le distributeur exclusif indiqué par habanos.com.',
  `description_en` = 'Cohiba Atmosphere in Buenos Aires, in the San Telmo district; Puro Tabaco S.A. is the exclusive distributor indicated by habanos.com.',
  `description_es` = 'Cohiba Atmosphere de Buenos Aires, en el barrio de San Telmo; Puro Tabaco S.A. figura como distribuidor exclusivo en habanos.com.',
  `description_de` = 'Cohiba Atmosphere in Buenos Aires, im Viertel San Telmo; als Exklusivdistributor gibt habanos.com Puro Tabaco S.A. an.',
  `description_zh` = '布宜诺斯艾利斯的 Cohiba Atmosphere,位于 San Telmo 区;habanos.com 注明的独家经销商为 Puro Tabaco S.A.。',
  `description_ar` = 'Cohiba Atmosphere في بوينس آيرس، في حي سان تيلمو؛ والموزّع الحصري الذي تذكره habanos.com هو Puro Tabaco S.A.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : habanos.com, Cohiba Atmosphere Buenos Aires — Moreno 518, C1091AAL CABA ; Puro Tabaco S.A; habanos.com, Ouverture 2017, quartier colonial de San Telmo',
  `updated_at` = NOW()
 WHERE `id` = 158 AND `country_id` = 'argentina' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Bogotá — Centro Comercial El Retiro',
  `description` = 'Point de vente Davidoff déclaré dans le centre commercial El Retiro, à Bogotá (non recoupé par le localisateur de la marque).',
  `description_en` = 'Davidoff point of sale declared at the El Retiro shopping centre, in Bogotá (not cross-checked by the brand''s store locator).',
  `description_es` = 'Punto de venta Davidoff declarado en el centro comercial El Retiro, en Bogotá (no contrastado por el localizador de la marca).',
  `description_de` = 'Davidoff-Verkaufsstelle, im Einkaufszentrum El Retiro in Bogotá angegeben (vom Händlerfinder der Marke nicht gegengeprüft).',
  `description_zh` = '据称位于波哥大 El Retiro 购物中心的 Davidoff 销售点(未经该品牌门店查询工具交叉核实)。',
  `description_ar` = 'نقطة بيع Davidoff مصرّح بها في مركز El Retiro التجاري في بوغوتا (لم يتحقق منها محدّد المتاجر الخاص بالعلامة بمصدر آخر).',
  `source` = 'à vérifier — relu le 30 octobre 2026 : las2orillas.co, El Retiro existe, Zona T de Bogotá ; aucune mention de Davidoff',
  `updated_at` = NOW()
 WHERE `id` = 160 AND `country_id` = 'colombia' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Guatemala City — 4ta Avenida 12-59, Zona 10, Local 4-C, Plaza Fontabella',
  `description` = 'La Casa del Habano de Guatemala City, située dans la Plaza Fontabella, zone 10.',
  `description_en` = 'La Casa del Habano in Guatemala City, located in Plaza Fontabella, zone 10.',
  `description_es` = 'La Casa del Habano de Ciudad de Guatemala, situada en la Plaza Fontabella, zona 10.',
  `description_de` = 'Die Casa del Habano in Guatemala-Stadt, gelegen an der Plaza Fontabella, Zone 10.',
  `description_zh` = '危地马拉城的哈瓦那之家（La Casa del Habano），位于第10区的Plaza Fontabella。',
  `description_ar` = 'لا كاسا ديل هابانو في مدينة غواتيمالا، الواقعة في ساحة فونتابيلا (Plaza Fontabella)، المنطقة 10.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : lacasadelhabano.com, Cuarta Avenida 12-59, Zona 10, Local 4-C, Plaza Fontabella',
  `updated_at` = NOW()
 WHERE `id` = 165 AND `country_id` = 'guatemala' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Port of Falmouth — Cruise Ship Terminal, Shop 202, Building 17B',
  `description` = 'Franchise La Casa del Habano ouverte en 2012 par Vinar Limited au terminal de croisière de Falmouth (Jamaïque), selon une annonce de Habanos S.A.',
  `description_en` = 'La Casa del Habano franchise opened in 2012 by Vinar Limited at the Falmouth cruise terminal (Jamaica), according to an announcement by Habanos S.A.',
  `description_es` = 'Franquicia La Casa del Habano abierta en 2012 por Vinar Limited en la terminal de cruceros de Falmouth (Jamaica), según un anuncio de Habanos S.A.',
  `description_de` = 'Franchise der Casa del Habano, 2012 von Vinar Limited am Kreuzfahrtterminal von Falmouth (Jamaika) eröffnet, laut einer Mitteilung von Habanos S.A.',
  `description_zh` = '据Habanos S.A.的公告，Vinar Limited于2012年在牙买加法尔茅斯邮轮码头开设的哈瓦那之家（La Casa del Habano）特许经营店。',
  `description_ar` = 'فرع امتياز لا كاسا ديل هابانو افتتحته شركة Vinar Limited عام 2012 في محطة السفن السياحية في فالموث (جامايكا)، بحسب إعلان صادر عن Habanos S.A.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : habanos.com, Franchise ouverte en 2012 par Vinar Limited, Shop #202, Cruise Ship Terminal, Falmouth; lacasadelhabano.com, Seule entrée Jamaïque : Montego Bay, Jimmy Cliff Boulevard ; Falmouth non mentionné',
  `updated_at` = NOW()
 WHERE `id` = 168 AND `country_id` = 'jamaica' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Marigot (Saint-Martin) — 71 Port La Royale, 97150',
  `description` = 'Casa del Habano de Marigot, côté français de Saint-Martin, au 71 Port La Royale.',
  `description_en` = 'Casa del Habano in Marigot, on the French side of Saint Martin, at 71 Port La Royale.',
  `description_es` = 'Casa del Habano de Marigot, en el lado francés de San Martín, en el 71 Port La Royale.',
  `description_de` = 'Casa del Habano in Marigot, auf der französischen Seite von Saint-Martin, 71 Port La Royale.',
  `description_zh` = '圣马丁法属一侧马里戈特的哈瓦那之家（Casa del Habano），地址为71 Port La Royale。',
  `description_ar` = 'كاسا ديل هابانو في ماريغو، على الجانب الفرنسي من سان مارتن، في 71 Port La Royale.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : lacasadelhabano.com, Marigot 71 Port La Royale, 97150 Marigot; lacasadelhabano-stmartin.com, Marina Port La Royale in Marigot, Saint-Martin',
  `updated_at` = NOW()
 WHERE `id` = 172 AND `country_id` = 'stmartin' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Estelí',
  `description` = 'Usine My Father Cigars de la famille García, à Estelí (Nicaragua), au bord de la Panaméricaine. L''existence d''un showroom ouvert au public n''a pas été recoupée.',
  `description_en` = 'My Father Cigars factory of the García family, in Estelí (Nicaragua), on the Pan-American Highway. The existence of a showroom open to the public has not been cross-checked.',
  `description_es` = 'Fábrica My Father Cigars de la familia García, en Estelí (Nicaragua), junto a la carretera Panamericana. No se ha contrastado la existencia de una sala de exposición abierta al público.',
  `description_de` = 'Fabrik von My Father Cigars der Familie García in Estelí (Nicaragua), an der Panamericana. Ob es einen öffentlich zugänglichen Showroom gibt, wurde nicht gegengeprüft.',
  `description_zh` = '加西亚家族的My Father Cigars工厂，位于尼加拉瓜埃斯特利，泛美公路旁。是否设有对公众开放的展厅，尚未得到交叉核实。',
  `description_ar` = 'مصنع My Father Cigars التابع لعائلة غارسيا، في إستيلي (نيكاراغوا)، على الطريق السريع بان-أمريكان. لم يجرِ التحقق من وجود صالة عرض مفتوحة للجمهور عبر مصادر متعددة.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : cigaraficionado.com, usine My Father a Esteli, famille Garcia ; aucun showroom lu',
  `updated_at` = NOW()
 WHERE `id` = 181 AND `country_id` = 'nicaragua' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Mexico D.F. — Alejandro Dumas 135, Planta Baja, Local A1, Colonia Polanco',
  `description` = 'La Casa del Habano de Polanco, à Mexico, inscrite au plan des franchises lacasadelhabano.com sous le nom « LCDH Mazarik ».',
  `description_en` = 'La Casa del Habano in Polanco, Mexico City, listed on the lacasadelhabano.com franchise map under the name "LCDH Mazarik".',
  `description_es` = 'La Casa del Habano de Polanco, en Ciudad de México, inscrita en el mapa de franquicias de lacasadelhabano.com con el nombre «LCDH Mazarik».',
  `description_de` = 'Die Casa del Habano in Polanco, Mexiko-Stadt, auf der Franchise-Karte von lacasadelhabano.com unter dem Namen „LCDH Mazarik“ eingetragen.',
  `description_zh` = '墨西哥城波兰科（Polanco）的哈瓦那之家（La Casa del Habano），在lacasadelhabano.com的特许经营店地图上登记为“LCDH Mazarik”。',
  `description_ar` = 'لا كاسا ديل هابانو في بولانكو بمدينة مكسيكو، مدرجة على خريطة فروع الامتياز في lacasadelhabano.com باسم «LCDH Mazarik».',
  `source` = 'à vérifier — relu le 30 octobre 2026 : lacasadelhabano.com, LCDH Mazarik : Alejandro Dumas 135, int. Planta Baja Local A1, Col. Polanco; lacasadelhabano.com, Mexique : entrée « LCDH Mazarik »',
  `updated_at` = NOW()
 WHERE `id` = 190 AND `country_id` = 'mexico' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Manille (adresse d''Intramuros non établie)',
  `description` = 'Boutique du fabricant philippin Tabacalera Incorporada, indiquée à Intramuros, Manille ; non retrouvée sur le site de la maison, qui ne liste que son bureau de Makati.',
  `description_en` = 'Shop of the Philippine manufacturer Tabacalera Incorporada, listed in Intramuros, Manila; not found on the company''s website, which lists only its Makati office.',
  `description_es` = 'Tienda del fabricante filipino Tabacalera Incorporada, indicada en Intramuros, Manila; no figura en el sitio web de la casa, que solo menciona su oficina de Makati.',
  `description_de` = 'Geschäft des philippinischen Herstellers Tabacalera Incorporada, in Intramuros, Manila, angegeben; auf der Website des Unternehmens nicht auffindbar, die nur das Büro in Makati aufführt.',
  `description_zh` = '菲律宾制造商Tabacalera Incorporada的店铺，据称位于马尼拉王城（Intramuros）；在该公司网站上未找到，网站仅列出其马卡蒂（Makati）办公室。',
  `description_ar` = 'متجر الشركة المصنّعة الفلبينية Tabacalera Incorporada، مذكور في إنتراموروس بمانيلا؛ لم يُعثر عليه على موقع الشركة الذي لا يذكر سوى مكتبها في ماكاتي.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : tabacalera.com.ph, une seule adresse : bureau Alphaland Makati Place ; aucun Intramuros; verafiles.org, Tabacalera was founded on November 26, 1881',
  `updated_at` = NOW()
 WHERE `id` = 196 AND `country_id` = 'philippines' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Napoli — Via San Pasquale a Chiaia 74, 80121',
  `description` = 'La Casa del Habano de Naples, installée via San Pasquale a Chiaia, dans la tabaccheria Sisimbro.',
  `description_en` = 'La Casa del Habano in Naples, located on via San Pasquale a Chiaia, inside the Sisimbro tabaccheria.',
  `description_es` = 'La Casa del Habano de Nápoles, situada en la via San Pasquale a Chiaia, dentro del estanco Sisimbro.',
  `description_de` = 'Die Casa del Habano in Neapel, in der Via San Pasquale a Chiaia, in der Tabaccheria Sisimbro.',
  `description_zh` = '那不勒斯的哈瓦那之家（La Casa del Habano），位于via San Pasquale a Chiaia，设在Sisimbro烟草店内。',
  `description_ar` = 'لا كاسا ديل هابانو في نابولي، تقع في via San Pasquale a Chiaia، داخل متجر التبغ (tabaccheria) Sisimbro.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : lacasadelhabano.com, Vía San Pasquale a Chiaia 74, Nápoles ; www.sisimbro.it',
  `updated_at` = NOW()
 WHERE `id` = 330 AND `country_id` = 'italy' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Hong Kong — Sheraton Hong Kong Hotel & Towers, 20 Nathan Road, Kowloon',
  `description` = 'La Casa del Habano de Kowloon, située dans le Sheraton Hong Kong Hotel & Towers, Nathan Road.',
  `description_en` = 'La Casa del Habano in Kowloon, located in the Sheraton Hong Kong Hotel & Towers, Nathan Road.',
  `description_es` = 'La Casa del Habano de Kowloon, situada en el Sheraton Hong Kong Hotel & Towers, Nathan Road.',
  `description_de` = 'Die Casa del Habano in Kowloon, im Sheraton Hong Kong Hotel & Towers an der Nathan Road.',
  `description_zh` = '九龙的哈瓦那之家（La Casa del Habano），位于弥敦道的Sheraton Hong Kong Hotel & Towers内。',
  `description_ar` = 'لا كاسا ديل هابانو في كولون، تقع في فندق Sheraton Hong Kong Hotel & Towers، شارع ناثان.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : lacasadelhabano.com, Sheraton HK Hotel & Towers, 20 Nathan Road, Kowloon',
  `updated_at` = NOW()
 WHERE `id` = 384 AND `country_id` = 'hongkong' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Cape Town — Dock Road, V&A Waterfront, 8001',
  `description` = 'Hôtel One&Only Cape Town, Dock Road, V&A Waterfront. L''existence d''un salon cigares n''a pas été recoupée par les sources lues.',
  `description_en` = 'One&Only Cape Town hotel, Dock Road, V&A Waterfront. The existence of a cigar lounge was not cross-checked in the sources read.',
  `description_es` = 'Hotel One&Only Cape Town, Dock Road, V&A Waterfront. La existencia de un salón de cigarros no se ha contrastado en las fuentes consultadas.',
  `description_de` = 'Hotel One&Only Cape Town, Dock Road, V&A Waterfront. Das Vorhandensein eines Zigarrensalons wurde in den gelesenen Quellen nicht gegengeprüft.',
  `description_zh` = '开普敦One&Only酒店，位于V&A Waterfront的Dock Road。所查阅的资料未能交叉核实是否设有雪茄室。',
  `description_ar` = 'فندق One&Only كيب تاون، شارع دوك (Dock Road)، V&A Waterfront. لم يجرِ التحقق من وجود صالون للسيجار عبر المصادر التي اطُّلع عليها.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : forbestravelguide.com, bars : Vista Bar and Lounge, Wine Loft ; pas de cigares',
  `updated_at` = NOW()
 WHERE `id` = 1208 AND `country_id` = 'southafrica' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Venezia — Piazza San Marco 57',
  `description` = 'Café historique de Venise, daté de 1720 par son site officiel, Piazza San Marco 57. Une dégustation de cigares en terrasse n''est pas établie.',
  `description_en` = 'Historic café in Venice, dated 1720 by its official website, Piazza San Marco 57. Cigar tasting on the terrace is not established.',
  `description_es` = 'Café histórico de Venecia, fechado en 1720 por su sitio web oficial, Piazza San Marco 57. No está establecido que se puedan degustar cigarros en la terraza.',
  `description_de` = 'Historisches Café in Venedig, laut seiner offiziellen Website von 1720, Piazza San Marco 57. Ein Zigarrengenuss auf der Terrasse ist nicht belegt.',
  `description_zh` = '威尼斯的历史悠久的咖啡馆，其官方网站标注创立于1720年，地址为Piazza San Marco 57。在露台品尝雪茄一事尚无确证。',
  `description_ar` = 'مقهى تاريخي في البندقية، يعود تاريخه إلى عام 1720 بحسب موقعه الرسمي، Piazza San Marco 57. لم يثبت إمكان تدخين السيجار على الشرفة.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : caffeflorian.com, « Il Caffè di Venezia dal 1720 » ; adresse Piazza San Marco, 57, 30124 Venezia',
  `updated_at` = NOW()
 WHERE `id` = 1367 AND `country_id` = 'italy' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'La Havane — Hotel Nacional de Cuba, Calle O y 21, Vedado',
  `description` = 'Salon cigares de l''Hotel Nacional de Cuba, installé à l''étage, ouvert en 2022 selon la presse spécialisée ; la Casa del Habano de l''hôtel se trouve en dessous. Le site de l''hôtel annonce un Habanos Lounge ouvert de 12 h à minuit.',
  `description_en` = 'Cigar lounge of the Hotel Nacional de Cuba, located upstairs, opened in 2022 according to the specialist press; the hotel''s Casa del Habano is below it. The hotel''s website announces a Habanos Lounge open from noon to midnight.',
  `description_es` = 'Salón de cigarros del Hotel Nacional de Cuba, situado en la planta superior, abierto en 2022 según la prensa especializada; la Casa del Habano del hotel se encuentra debajo. El sitio web del hotel anuncia un Habanos Lounge abierto de 12:00 a medianoche.',
  `description_de` = 'Zigarrensalon des Hotel Nacional de Cuba, im Obergeschoss gelegen, laut Fachpresse 2022 eröffnet; die Casa del Habano des Hotels befindet sich darunter. Die Website des Hotels kündigt eine Habanos Lounge an, geöffnet von 12 Uhr bis Mitternacht.',
  `description_zh` = '古巴国家酒店（Hotel Nacional de Cuba）的雪茄室，位于楼上，据专业媒体报道于2022年开业；酒店的哈瓦那之家（Casa del Habano）位于其下方。酒店网站称设有Habanos Lounge，营业时间为12:00至午夜。',
  `description_ar` = 'صالون السيجار في فندق Hotel Nacional de Cuba، يقع في الطابق العلوي، وافتُتح عام 2022 بحسب الصحافة المتخصصة؛ وتقع كاسا ديل هابانو الخاصة بالفندق تحته. يعلن موقع الفندق عن Habanos Lounge مفتوح من الساعة 12 ظهرًا حتى منتصف الليل.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : cigaraficionado.com, « hidden cigar lounge upstairs » ; « Opened in 2022 » ; Casa del Habano « downstairs »; hotelnacionaldecuba.com, Habanos Lounge, 12:00 p.m. à 12:00 a.m. ; liste des bars sans salon cigares distinct',
  `updated_at` = NOW()
 WHERE `id` = 1564 AND `country_id` = 'cuba' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Estelí',
  `description` = 'Manufacture La Gran Fabrica Drew Estate, à Estelí (Nicaragua), où Drew Estate organise le programme de visites Cigar Safari. Adresse postale et existence d''un salon permanent non recoupées.',
  `description_en` = 'La Gran Fabrica Drew Estate factory in Estelí (Nicaragua), where Drew Estate runs the Cigar Safari tour program. Postal address and existence of a permanent lounge not cross-checked.',
  `description_es` = 'Fábrica La Gran Fabrica Drew Estate, en Estelí (Nicaragua), donde Drew Estate organiza el programa de visitas Cigar Safari. No se han contrastado la dirección postal ni la existencia de un salón permanente.',
  `description_de` = 'Manufaktur La Gran Fabrica Drew Estate in Estelí (Nicaragua), wo Drew Estate das Besuchsprogramm Cigar Safari veranstaltet. Postanschrift und Vorhandensein eines dauerhaften Salons wurden nicht gegengeprüft.',
  `description_zh` = '位于尼加拉瓜埃斯特利的La Gran Fabrica Drew Estate工厂，Drew Estate在此举办Cigar Safari参观项目。邮政地址及是否设有常设雪茄室，均未得到交叉核实。',
  `description_ar` = 'مصنع La Gran Fabrica Drew Estate في إستيلي (نيكاراغوا)، حيث تنظّم Drew Estate برنامج الزيارات Cigar Safari. لم يجرِ التحقق من العنوان البريدي ولا من وجود صالون دائم عبر مصادر متعددة.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : cigaraficionado.com, La Gran Fabrica Drew Estate, Esteli ; ni adresse ni effectif',
  `updated_at` = NOW()
 WHERE `id` = 1570 AND `country_id` = 'nicaragua' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Estelí',
  `description` = 'Usine Padrón (Tabacos Cubanica S.A.) à Estelí, dans le centre de la ville. Visites connues lors d''événements de presse ; salon ''Sala VIP'' et quartier ''Barrio Sandino'' non recoupés.',
  `description_en` = 'Padrón factory (Tabacos Cubanica S.A.) in Estelí, in the city center. Visits known during press events; ''Sala VIP'' lounge and ''Barrio Sandino'' neighborhood not cross-checked.',
  `description_es` = 'Fábrica Padrón (Tabacos Cubanica S.A.) en Estelí, en el centro de la ciudad. Se conocen visitas durante eventos de prensa; el salón ''Sala VIP'' y el barrio ''Barrio Sandino'' no se han contrastado.',
  `description_de` = 'Fabrik Padrón (Tabacos Cubanica S.A.) in Estelí, im Stadtzentrum. Besuche sind von Presseveranstaltungen bekannt; der Salon „Sala VIP“ und das Viertel „Barrio Sandino“ wurden nicht gegengeprüft.',
  `description_zh` = '位于埃斯特利市中心的Padrón工厂（Tabacos Cubanica S.A.）。已知曾在媒体活动期间开放参观；“Sala VIP”雪茄室及“Barrio Sandino”街区均未得到交叉核实。',
  `description_ar` = 'مصنع Padrón (Tabacos Cubanica S.A.) في إستيلي، في وسط المدينة. عُرفت زيارات له خلال فعاليات صحفية؛ ولم يجرِ التحقق من صالون «Sala VIP» ولا من حي «Barrio Sandino» عبر مصادر متعددة.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : cigaraficionado.com, résultat de recherche : visite de presse de l''usine Padrón à Estelí (page non relue); halfwheel.com, résultat de recherche : Tabacos Cubanica S.A., centre d''Estelí (page 402)',
  `updated_at` = NOW()
 WHERE `id` = 1571 AND `country_id` = 'nicaragua' AND `is_verified` = 1;

UPDATE `lounges` SET
  `name` = 'La Casa Del Habano, Chiangmai (Habanos Specialist)',
  `city` = 'Chiang Mai — 1/5 Soi 9, Nimmanhemin Road, Tumbon Sutep, Muang, 50200',
  `description` = 'Point de vente de Chiang Mai, 1/5 Soi 9, Nimmanhemin Road, classé Habanos Specialist sous le nom La Casa Del Habano, Chiangmai dans l''annuaire habanos.com. Absent du directoire des franchises La Casa del Habano (lacasadelhabano.com).',
  `description_en` = 'Point of sale in Chiang Mai, 1/5 Soi 9, Nimmanhemin Road, classified as Habanos Specialist under the name La Casa Del Habano, Chiangmai in the habanos.com directory. Absent from the La Casa del Habano franchise directory (lacasadelhabano.com).',
  `description_es` = 'Punto de venta de Chiang Mai, 1/5 Soi 9, Nimmanhemin Road, clasificado como Habanos Specialist con el nombre La Casa Del Habano, Chiangmai en el directorio de habanos.com. No figura en el directorio de franquicias La Casa del Habano (lacasadelhabano.com).',
  `description_de` = 'Verkaufsstelle in Chiang Mai, 1/5 Soi 9, Nimmanhemin Road, im Verzeichnis von habanos.com als Habanos Specialist unter dem Namen La Casa Del Habano, Chiangmai geführt. Im Franchise-Verzeichnis der La Casa del Habano (lacasadelhabano.com) nicht enthalten.',
  `description_zh` = '清迈的销售点，地址为Nimmanhemin Road, 1/5 Soi 9，在habanos.com名录中以“La Casa Del Habano, Chiangmai”之名列为Habanos Specialist。未出现在哈瓦那之家（La Casa del Habano）特许经营店名录（lacasadelhabano.com）中。',
  `description_ar` = 'نقطة بيع في شيانغ ماي، 1/5 Soi 9، Nimmanhemin Road، مصنّفة كـ Habanos Specialist باسم La Casa Del Habano, Chiangmai في دليل habanos.com. غير موجودة في دليل فروع الامتياز لـ La Casa del Habano (lacasadelhabano.com).',
  `source` = 'à vérifier — relu le 30 octobre 2026 : lacasadelhabano.com, fiche = LCDH Bangkok / Kempinski Sindhorn, 80 Soi Tonson ; aucune Casa à Chiang Mai; lacasadelhabano.com, Thaïlande : Mandarin Oriental, Siam Kempinski, Sindhorn Kempinski (Bangkok) seulement',
  `updated_at` = NOW()
 WHERE `id` = 2497 AND `country_id` = 'thailand' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Ho Chi Minh-Ville — Caravelle Saigon, 19-23 Lam Son Square, District 1',
  `description` = 'Saigon Saigon Rooftop Bar, bar en terrasse sur le toit de l''hôtel Caravelle Saigon, 19-23 Lam Son Square. Un humidor de cigares cubains y était décrit en 2010 ; aucune source récente lue ne confirme ce service.',
  `description_en` = 'Saigon Saigon Rooftop Bar, a rooftop terrace bar at the Caravelle Saigon hotel, 19-23 Lam Son Square. A humidor of Cuban cigars was described there in 2010; no recent source read confirms this service.',
  `description_es` = 'Saigon Saigon Rooftop Bar, bar en la azotea del hotel Caravelle Saigon, 19-23 Lam Son Square. En 2010 se describía allí un humidor de cigarros cubanos; ninguna fuente reciente consultada confirma este servicio.',
  `description_de` = 'Saigon Saigon Rooftop Bar, Dachterrassenbar des Hotels Caravelle Saigon, 19-23 Lam Son Square. 2010 wurde dort ein Humidor mit kubanischen Zigarren beschrieben; keine gelesene aktuelle Quelle bestätigt diesen Service.',
  `description_zh` = 'Saigon Saigon Rooftop Bar，西贡Caravelle酒店（Caravelle Saigon）的屋顶露台酒吧，地址为19-23 Lam Son Square。2010年曾有资料提到那里有古巴雪茄保湿盒；所查阅的近期资料均未证实该服务。',
  `description_ar` = 'Saigon Saigon Rooftop Bar، بار على شرفة سطح فندق Caravelle Saigon، 19-23 Lam Son Square. وُصف فيه عام 2010 وجود خزانة ترطيب (humidor) للسيجار الكوبي؛ ولا يؤكد أي مصدر حديث جرى الاطلاع عليه هذه الخدمة.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : cigaraficionado.com, article du 25 mars 2010 : humidor Cohiba, Montecristo, Partagas, Romeo y Julieta; caravellehotel.com, SAIGON SAIGON ROOFTOP BAR IS BACK ; aucune mention de cigares',
  `updated_at` = NOW()
 WHERE `id` = 2505 AND `country_id` = 'vietnam' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Singapour — #B1-90, The Shoppes at Marina Bay Sands, 10 Bayfront Avenue',
  `description` = 'Boutique Davidoff of Geneva au niveau B1 des Shoppes at Marina Bay Sands, à Singapour.',
  `description_en` = 'Davidoff of Geneva boutique on level B1 of The Shoppes at Marina Bay Sands, in Singapore.',
  `description_es` = 'Boutique Davidoff of Geneva en el nivel B1 de The Shoppes at Marina Bay Sands, en Singapur.',
  `description_de` = 'Boutique Davidoff of Geneva auf Ebene B1 der Shoppes at Marina Bay Sands in Singapur.',
  `description_zh` = '新加坡滨海湾金沙购物中心（The Shoppes at Marina Bay Sands）B1层的Davidoff of Geneva精品店。',
  `description_ar` = 'متجر Davidoff of Geneva في المستوى B1 من The Shoppes at Marina Bay Sands في سنغافورة.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : marinabaysands.com, Davidoff of Geneva, The Shoppes, #B1-90 (via recherche ; page en timeout); cigarjournal.com, Davidoff Singapore dévoile son concept boutique à Marina Bay Sands (date non lue)',
  `updated_at` = NOW()
 WHERE `id` = 2515 AND `country_id` = 'singapore' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Hong Kong — 11/F, Loke Yew Building, 50-52 Queen''s Road Central, Central',
  `description` = 'La Casa del Habano de Central, au 11e étage du Loke Yew Building, Queen''s Road Central.',
  `description_en` = 'La Casa del Habano in Central, on the 11th floor of the Loke Yew Building, Queen''s Road Central.',
  `description_es` = 'La Casa del Habano de Central, en el piso 11 del Loke Yew Building, Queen''s Road Central.',
  `description_de` = 'Die Casa del Habano in Central, im 11. Stock des Loke Yew Building, Queen''s Road Central.',
  `description_zh` = '中环的哈瓦那之家（La Casa del Habano），位于皇后大道中的Loke Yew Building 11楼。',
  `description_ar` = 'لا كاسا ديل هابانو في سنترال، في الطابق 11 من Loke Yew Building، Queen''s Road Central.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : lacasadelhabano.com, 11/F, Loke Yew Building, 50-52 Queen''s Road Central; lacasadelhabano.com, Hong Kong : Causeway Bay, Hong Kong, Hong Kong/Central',
  `updated_at` = NOW()
 WHERE `id` = 2561 AND `country_id` = 'hongkong' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Bamako — ACI 2000, immeuble du Cinquantenaire',
  `description` = 'Le Cadre VIP, établissement de Bamako à ACI 2000 (site déclaré : lecadre223.com). Sa cave à cigares et sa seconde adresse à l''Hippodrome n''ont pu être recoupées.',
  `description_en` = 'Le Cadre VIP, an establishment in Bamako at ACI 2000 (declared website: lecadre223.com). Its cigar cellar and its second address at the Hippodrome could not be cross-checked.',
  `description_es` = 'Le Cadre VIP, establecimiento de Bamako en ACI 2000 (sitio declarado: lecadre223.com). No se han podido contrastar su cava de cigarros ni su segunda dirección en el Hipódromo.',
  `description_de` = 'Le Cadre VIP, ein Lokal in Bamako im Viertel ACI 2000 (angegebene Website: lecadre223.com). Der Zigarrenkeller und die zweite Adresse am Hippodrom konnten nicht gegengeprüft werden.',
  `description_zh` = 'Le Cadre VIP，位于巴马科ACI 2000区的场所（声明网站：lecadre223.com）。其雪茄酒窖及位于赛马场（Hippodrome）的第二处地址均未能交叉核实。',
  `description_ar` = 'Le Cadre VIP، منشأة في باماكو بحي ACI 2000 (الموقع المعلن: lecadre223.com). لم يتسنَّ التحقق من قبو السيجار فيها ولا من عنوانها الثاني في الهيبودروم عبر مصادر متعددة.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : ',
  `updated_at` = NOW()
 WHERE `id` = 2565 AND `country_id` = 'mali' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Zoug — Gotthardstrasse 20, 6300 Zug',
  `description` = 'Casa del Habano de Zoug, Gotthardstrasse 20, inaugurée le 3 février 2024 selon lacasadelhabano.com. Boutique et salon avec service de bar, sur près de deux cents mètres carrés selon le site de l''exploitant (Siglomundo).',
  `description_en` = 'Casa del Habano in Zug, Gotthardstrasse 20, inaugurated on 3 February 2024 according to lacasadelhabano.com. Shop and lounge with bar service, covering nearly two hundred square meters according to the operator''s website (Siglomundo).',
  `description_es` = 'Casa del Habano de Zug, Gotthardstrasse 20, inaugurada el 3 de febrero de 2024 según lacasadelhabano.com. Tienda y salón con servicio de bar, de casi doscientos metros cuadrados según el sitio web del operador (Siglomundo).',
  `description_de` = 'Casa del Habano in Zug, Gotthardstrasse 20, laut lacasadelhabano.com am 3. Februar 2024 eröffnet. Geschäft und Salon mit Barservice auf knapp zweihundert Quadratmetern, laut der Website des Betreibers (Siglomundo).',
  `description_zh` = '楚格（Zug）的哈瓦那之家（Casa del Habano），地址为Gotthardstrasse 20，据lacasadelhabano.com称于2024年2月3日开业。据运营方（Siglomundo）网站介绍，设有店铺和提供酒吧服务的雪茄室，面积近两百平方米。',
  `description_ar` = 'كاسا ديل هابانو في تسوغ، Gotthardstrasse 20، افتُتحت في 3 فبراير 2024 بحسب lacasadelhabano.com. متجر وصالون مع خدمة بار، على مساحة تقارب مئتي متر مربع بحسب موقع المشغّل (Siglomundo).',
  `source` = 'à vérifier — relu le 30 octobre 2026 : lacasadelhabano.com, LCDH Zug, Gotthardstrasse 20, 6300 Zug, +41 41 558 99 41; siglomundo.ch, Gotthardstrasse 20, 6300 Zug ; almost 200 square meters ; bar service; lacasadelhabano.com, inaugurada le 3 février 2024 (horodatage de la page : 2025-09-24)',
  `updated_at` = NOW()
 WHERE `id` = 2570 AND `country_id` = 'switzerland' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Samnaun — Dorfstrasse 45, 7563 Samnaun-Dorf',
  `description` = 'Casa del Habano de Samnaun, dans les Grisons, à l''hôtel AlpChalet Bellevue, Dorfstrasse 45. Ouverte début 2024 ; salon au rez-de-chaussée et humidor-cave de 40 m² au premier étage, à côté de la réception.',
  `description_en` = 'Casa del Habano in Samnaun, in Graubünden, at the AlpChalet Bellevue hotel, Dorfstrasse 45. Opened in early 2024; lounge on the ground floor and 40 m² humidor-cellar on the first floor, next to the reception.',
  `description_es` = 'Casa del Habano de Samnaun, en los Grisones, en el hotel AlpChalet Bellevue, Dorfstrasse 45. Abierta a principios de 2024; salón en la planta baja y humidor-cava de 40 m² en la primera planta, junto a la recepción.',
  `description_de` = 'Casa del Habano in Samnaun, Graubünden, im Hotel AlpChalet Bellevue, Dorfstrasse 45. Anfang 2024 eröffnet; Salon im Erdgeschoss und Humidor-Keller von 40 m² im ersten Stock, neben der Rezeption.',
  `description_zh` = '格劳宾登州萨姆瑙恩（Samnaun）的哈瓦那之家（Casa del Habano），位于AlpChalet Bellevue酒店，Dorfstrasse 45。2024年初开业；一楼为雪茄室，二楼接待处旁设有40平方米的雪茄保湿酒窖。',
  `description_ar` = 'كاسا ديل هابانو في سامناون، في كانتون غراوبوندن، داخل فندق AlpChalet Bellevue، Dorfstrasse 45. افتُتحت في مطلع 2024؛ صالون في الطابق الأرضي وقبو ترطيب (humidor) بمساحة 40 م² في الطابق الأول، بجانب الاستقبال.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : lacasadelhabano.com, Dorfstrasse 45, 7563 Samnaun-Dorf ; Hotel AlpChalet Bellevue where LCDH is Based; moodiedavittreport.com, article du 1er février 2024 : store has opened ; événement d''ouverture le 20 janvier; lcdh-samnaun.ch, WhatsApp +41 (0) 78 251 26 45',
  `updated_at` = NOW()
 WHERE `id` = 2571 AND `country_id` = 'switzerland' AND `is_verified` = 1;

UPDATE `lounges` SET
  `city` = 'Bruxelles — Place du Grand Sablon 1, 1000 Bruxelles',
  `description` = 'Boutique Davidoff of Geneva de la place du Grand Sablon, à Bruxelles, également référencée comme point de vente Habanos par habanos.com.',
  `description_en` = 'Davidoff of Geneva boutique on the Place du Grand Sablon in Brussels, also listed as a Habanos point of sale by habanos.com.',
  `description_es` = 'Boutique Davidoff of Geneva de la plaza del Grand Sablon, en Bruselas, también referenciada como punto de venta Habanos por habanos.com.',
  `description_de` = 'Boutique Davidoff of Geneva am Place du Grand Sablon in Brüssel, von habanos.com ebenfalls als Habanos-Verkaufsstelle geführt.',
  `description_zh` = '布鲁塞尔大萨布隆广场（Place du Grand Sablon）上的Davidoff of Geneva精品店，habanos.com也将其列为Habanos销售点。',
  `description_ar` = 'متجر Davidoff of Geneva في ساحة غران سابلون (Place du Grand Sablon) في بروكسل، مدرج أيضًا كنقطة بيع لـ Habanos على habanos.com.',
  `source` = 'à vérifier — relu le 30 octobre 2026 : cigarjournal.com, Davidoff Sablon, Place du Grand Sablon 1, 1000 Brussels, T +32 2 512 94 22 (annuaire, non daté); cigarinspector.com, boutique Davidoff sur la place du Grand Sablon (vers 2014)',
  `updated_at` = NOW()
 WHERE `id` = 2575 AND `country_id` = 'belgium' AND `is_verified` = 1;

UPDATE `lounges` SET `website` = 'http://www.lacasadelhabano.com.ar', `updated_at` = NOW()
 WHERE `id` = 157 AND `country_id` = 'argentina' AND `is_verified` = 1 AND (`website` IS NULL OR `website` = '');

UPDATE `lounges` SET `website` = 'http://casadelhabanoantwerp.be/', `updated_at` = NOW()
 WHERE `id` = 52 AND `country_id` = 'belgium' AND `is_verified` = 1 AND (`website` IS NULL OR `website` = '');

UPDATE `lounges` SET `website` = 'https://www.lacasadelhabano.gi', `updated_at` = NOW()
 WHERE `id` = 64 AND `country_id` = 'gibraltar' AND `is_verified` = 1 AND (`website` IS NULL OR `website` = '');

UPDATE `lounges` SET `phone` = '+852 21239952', `website` = 'https://www.pacificcigar.com', `updated_at` = NOW()
 WHERE `id` = 384 AND `country_id` = 'hongkong' AND `is_verified` = 1 AND (`phone` IS NULL OR `phone` = '') AND (`website` IS NULL OR `website` = '');

UPDATE `lounges` SET `phone` = '+852 25281992', `website` = 'https://www.pacificcigar.com', `updated_at` = NOW()
 WHERE `id` = 2561 AND `country_id` = 'hongkong' AND `is_verified` = 1 AND (`phone` IS NULL OR `phone` = '') AND (`website` IS NULL OR `website` = '');

UPDATE `lounges` SET `website` = 'https://www.casadelhabano.it', `updated_at` = NOW()
 WHERE `id` = 87 AND `country_id` = 'italy' AND `is_verified` = 1 AND (`website` IS NULL OR `website` = '');

UPDATE `lounges` SET `website` = 'https://www.sisimbro.it', `updated_at` = NOW()
 WHERE `id` = 330 AND `country_id` = 'italy' AND `is_verified` = 1 AND (`website` IS NULL OR `website` = '');

UPDATE `lounges` SET `instagram` = '@lcdhmexico', `updated_at` = NOW()
 WHERE `id` = 190 AND `country_id` = 'mexico' AND `is_verified` = 1 AND (`instagram` IS NULL OR `instagram` = '');

UPDATE `lounges` SET `website` = 'https://www.lacasadelhabanomaastricht.nl', `instagram` = '@LCDHMaastricht', `hours` = 'lundi et dimanche fermé ; mardi-samedi 10:00-18:00', `updated_at` = NOW()
 WHERE `id` = 60 AND `country_id` = 'netherlands' AND `is_verified` = 1 AND (`website` IS NULL OR `website` = '') AND (`instagram` IS NULL OR `instagram` = '') AND (`hours` IS NULL OR `hours` = '');

UPDATE `lounges` SET `instagram` = '@El_unico_cigars', `hours` = 'lundi-vendredi 10:00-19:00', `updated_at` = NOW()
 WHERE `id` = 76 AND `country_id` = 'romania' AND `is_verified` = 1 AND (`instagram` IS NULL OR `instagram` = '') AND (`hours` IS NULL OR `hours` = '');

UPDATE `lounges` SET `website` = 'https://www.havanacigars.ru', `hours` = 'tous les jours 10:00-22:00', `updated_at` = NOW()
 WHERE `id` = 82 AND `country_id` = 'russia' AND `is_verified` = 1 AND (`website` IS NULL OR `website` = '') AND (`hours` IS NULL OR `hours` = '');

UPDATE `lounges` SET `website` = 'https://www.lacasadelhabano.rs', `hours` = 'lundi-samedi 9h-22h ; dimanche 12h-20h', `updated_at` = NOW()
 WHERE `id` = 78 AND `country_id` = 'serbia' AND `is_verified` = 1 AND (`website` IS NULL OR `website` = '') AND (`hours` IS NULL OR `hours` = '');

UPDATE `lounges` SET `phone` = '+34 928 966 092', `updated_at` = NOW()
 WHERE `id` = 2560 AND `country_id` = 'spain' AND `is_verified` = 1 AND (`phone` IS NULL OR `phone` = '');

UPDATE `lounges` SET `website` = 'https://www.lacasadelhabano-stmartin.com', `updated_at` = NOW()
 WHERE `id` = 172 AND `country_id` = 'stmartin' AND `is_verified` = 1 AND (`website` IS NULL OR `website` = '');

UPDATE `lounges` SET `hours` = 'boutique mardi-vendredi 11h-19h, samedi 11h-17h ; salon mardi-samedi 11h-22h ; fermé dimanche et lundi', `updated_at` = NOW()
 WHERE `id` = 2570 AND `country_id` = 'switzerland' AND `is_verified` = 1 AND (`hours` IS NULL OR `hours` = '');

UPDATE `lounges` SET `instagram` = '@lcdhsamnaun', `updated_at` = NOW()
 WHERE `id` = 2571 AND `country_id` = 'switzerland' AND `is_verified` = 1 AND (`instagram` IS NULL OR `instagram` = '');

UPDATE `lounges` SET `phone` = '+359 877 587 888', `website` = 'https://www.cohibaatmosphere.bg', `hours` = '10h00-24h00 tous les jours', `updated_at` = NOW()
 WHERE `id` = 69 AND `country_id` = 'bulgaria' AND `is_verified` = 1 AND (`phone` IS NULL OR `phone` = '') AND (`website` IS NULL OR `website` = '') AND (`hours` IS NULL OR `hours` = '');

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 30 octobre 2026 : la liste officielle des bars et salons de l''hôtel (press.fourseasons.com, fiche de l''hôtel) ne mentionne aucun salon cigares ; l''hôtel dément la fiche', `updated_at` = NOW()
 WHERE `id` = 386;

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 30 octobre 2026 : la liste officielle des restaurants et bars du resort ne mentionne aucun salon cigares ; seuls des dîners cigares sont évoqués par un ancien article non daté', `updated_at` = NOW()
 WHERE `id` = 787;

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 30 octobre 2026 : la page officielle de l''hôtel (en persan) liste ses restaurants et cafés sans bar à cigares ; seule une « Private Lounge » sans précision y figure', `updated_at` = NOW()
 WHERE `id` = 951;

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 30 octobre 2026 : la page officielle de l''hôtel liste un restaurant et deux bars (Le Djembe Bar, Damu Pool Bar & Grill) sans salon cigares (page lue par extrait de recherche, 403 en direct)', `updated_at` = NOW()
 WHERE `id` = 813;

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 30 octobre 2026 : le site de l''hôtel liste ses lieux de restauration et de bar (Sunset Café, Moonrise Bar & Lounge) sans terrasse cigare', `updated_at` = NOW()
 WHERE `id` = 1130;

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 30 octobre 2026 : le restaurant existe mais ni sa page officielle ni le guide Michelin ne citent de service cigares ou de terrasse : le service n''est pas attesté', `updated_at` = NOW()
 WHERE `id` = 1449;

UPDATE `translation_status` t
  JOIN `lounges` l ON l.`id` = t.`entite_id`
   SET t.`source_hash` = SHA1(l.`description`), t.`statut` = 'machine', t.`maj` = NOW()
 WHERE t.`entite` = 'lounges' AND t.`champ` = 'description' AND t.`entite_id` IN ('53','60','63','68','69','76','81','97','98','99','101','102','105','113','126','128','130','135','137','157','158','160','165','168','172','181','190','196','330','384','1208','1367','1564','1570','1571','2497','2505','2515','2561','2565','2570','2571','2575');

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 299';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 299', 'systeme', 'fiches_relues', 'systeme', 0, 'Relecture des fiches a verifier : 43 reprises, 6 retirees, 17 enrichies, traductions remises en machine'),
  (NULL,'migration 299','systeme','fiche_retiree','lounge',386,'la liste officielle des bars et salons de l''hôtel (press.fourseasons.com, fiche de l''hôtel) ne mentionne aucun salon cigares ; l''hôtel dément la fiche'),
  (NULL,'migration 299','systeme','fiche_retiree','lounge',787,'la liste officielle des restaurants et bars du resort ne mentionne aucun salon cigares ; seuls des dîners cigares sont évoqués par un ancien article non daté'),
  (NULL,'migration 299','systeme','fiche_retiree','lounge',951,'la page officielle de l''hôtel (en persan) liste ses restaurants et cafés sans bar à cigares ; seule une « Private Lounge » sans précision y figure'),
  (NULL,'migration 299','systeme','fiche_retiree','lounge',813,'la page officielle de l''hôtel liste un restaurant et deux bars (Le Djembe Bar, Damu Pool Bar & Grill) sans salon cigares (page lue par extrait de recherche, 403 en direct)'),
  (NULL,'migration 299','systeme','fiche_retiree','lounge',1130,'le site de l''hôtel liste ses lieux de restauration et de bar (Sunset Café, Moonrise Bar & Lounge) sans terrasse cigare'),
  (NULL,'migration 299','systeme','fiche_retiree','lounge',1449,'le restaurant existe mais ni sa page officielle ni le guide Michelin ne citent de service cigares ou de terrasse : le service n''est pas attesté');

-- Contrôle : des 1 partout.
SELECT
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (53,60,63,68,69,76,81,97,98,99,101,102,105,113,126,128,130,135,137,157,158,160,165,168,172,181,190,196,330,384,1208,1367,1564,1570,1571,2497,2505,2515,2561,2565,2570,2571,2575) AND `source` LIKE 'à vérifier — relu le 30 octobre 2026%') = 43 AS `fiches_relues`,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (386,787,951,813,1130,1449) AND `is_verified` = 0 AND `source` LIKE 'RETIRÉ%') = 6 AS `fiches_retirees`,
  (SELECT COUNT(*) FROM `translation_status` WHERE `entite` = 'lounges' AND `champ` = 'description' AND `entite_id` IN ('53','60','63','68','69','76','81','97','98','99','101','102','105','113','126','128','130','135','137','157','158','160','165','168','172','181','190','196','330','384','1208','1367','1564','1570','1571','2497','2505','2515','2561','2565','2570','2571','2575') AND `statut` = 'machine') = 215 AS `sceaux_remis`;
