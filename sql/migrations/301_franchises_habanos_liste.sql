-- ════════════════════════════════════════════════════════
-- 301 — Franchises confirmées par la liste officielle de habanos.com
-- ────────────────────────────────────────────────────────
-- CE QU'ON A TROUVÉ. Les migrations 297 à 299 avaient laissé « à vérifier » les
-- franchises La Casa del Habano : la règle exige deux listes officielles et la
-- liste de habanos.com (pages « Where to buy ») était illisible pour les agents.
-- Lue le 31 octobre 2026 dans le navigateur, région par région, filtre « La Casa
-- del Habano » : 70 points de vente en Europe, 41 en Afrique et Moyen-Orient,
-- 21 en Asie-Pacifique, 54 en Amérique.
-- 1. 41 fiches figurent à la fois dans cette liste et dans celle de
--    lacasadelhabano.com (déjà citée dans leur `source`) : la réserve « à vérifier »
--    tombe, la lecture est datée.
-- 2. #2497 (Chiang Mai) : listée « La Casa Del Habano, Chiangmai » par habanos.com
--    hors catégorie La Casa del Habano, absente du directoire lacasadelhabano.com :
--    c'est bien un Habanos Specialist, comme son nom l'annonce.
-- 3. 4 noms corrigés d'après les listes : #65 (aucun Sheraton), #67 (Intercontinental,
--    pas Radisson SAS), #76 (J.W. Marriott, pas Athénée Palace), #188 (Leblon).
-- Les descriptions ne bougent pas : aucune traduction à refaire.
-- ════════════════════════════════════════════════════════

UPDATE `lounges` SET `name` = 'La Casa del Habano — Tirana', `source` = 'relu le 31 octobre 2026 : habanos.com (located at ''Asim Zeneli'' in Tirana (ouverture 7 octobre 2021) ; aucune mention de Sheraton) ; lacasadelhabano.com (Albania : LCDH Tirana (nom seul, sans adresse)) ; habanos.com, liste officielle des points de vente, région Europe, lue le 31 octobre 2026 : « La Casa Del Habano Tirana (Albania / Tirana) »', `updated_at` = NOW()
 WHERE `id` = 65 AND `country_id` = 'albania' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com, LCDH Andorra – Plaza Coprinceps 3, AD700 Escaldes-Engordany; habanos.com, Plaça Coprincep, 3, Escaldes-Engordany ; distributeur exclusif Maori Tabacs S.A; lacasadelhabanoandorra.com, site de la boutique : Plaça Coprínceps, 3, AD700 ; année d''ouverture 1995 ; habanos.com, liste officielle des points de vente, région Europe, lue le 31 octobre 2026 : « La Casa Del Habano - Andorra (Escaldes - Engordany) »', `updated_at` = NOW()
 WHERE `id` = 63 AND `country_id` = 'andorra' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com, LCDH Bruselas – Rue Faider 1C, 1060; habanos.com, La Casa del Habano Brussels – Louise, Rue Faider 1C ; distributeur Laguito 1492 ; habanos.com, liste officielle des points de vente, région Europe, lue le 31 octobre 2026 : « La Casa Del Habano Brussels - Louise (Brussels) »', `updated_at` = NOW()
 WHERE `id` = 53 AND `country_id` = 'belgium' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `name` = 'La Casa del Habano — Sofia (Intercontinental)', `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com (LCDH Sofia/Intercontinental : 4 Narodno Sabranie Square, 1169 Sofia) ; habanos.com (Kaliman Caribe, licence Habanos S.A. en Bulgarie (opérateur du réseau)) ; habanos.com, liste officielle des points de vente, région Europe, lue le 31 octobre 2026 : « La Casa Del Habano Intercontinental (Bulgaria / Sofia) »', `updated_at` = NOW()
 WHERE `id` = 67 AND `country_id` = 'bulgaria' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com, LCDH Sofia/Mall : Mall of Sofía, 101 Alexander Stamboliyski Blvd; habanos.com, 101 Alexander Stamboliyski Blvd., Sofia 1000 ; distributeur Kaliman Caribe ; habanos.com, liste officielle des points de vente, région Europe, lue le 31 octobre 2026 : « La Casa Del Habano Mall Sofia (Bulgaria / Sofia) »', `updated_at` = NOW()
 WHERE `id` = 68 AND `country_id` = 'bulgaria' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com (LCDH Praga, Dlouhá 35, Praha 1, 11000 Praha) ; cigaraficionado.com (Dlouhá 35/730, Prague 1 ; official La Casa del Habano (5 sept. 2017)) ; habanos.com, liste officielle des points de vente, région Europe, lue le 31 octobre 2026 : « La Casa Del Habano - Praha (Czech Republic / Praha) »', `updated_at` = NOW()
 WHERE `id` = 80 AND `country_id` = 'czech' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com (La Casa Del Habano KRAKÓW, Sławkowska 26, 31-014 Kraków) ; krakow.lcdh.pl (ul. Sławkowska 26, 31-014 Kraków ; lun-sam 12:00-00:00, dim 13:00-22:00) ; habanos.com, liste officielle des points de vente, région Europe, lue le 31 octobre 2026 : « Casa Del Habano Krakow (Poland / Kraków) »', `updated_at` = NOW()
 WHERE `id` = 75 AND `country_id` = 'poland' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com (Bleicherweg 18, 8002 Zürich (fiche officielle du réseau)) ; habanos.com (actualité Habanos S.A. sur le réseau suisse (4 sept. 2024)) ; habanos.com, liste officielle des points de vente, région Europe, lue le 31 octobre 2026 : « La Casa Del Habano - Zürich (Switzerland / Zürich) »', `updated_at` = NOW()
 WHERE `id` = 42 AND `country_id` = 'switzerland' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : habanos.com (Rue de Rive 34, 1260 Nyon ; ''only La Casa del Habano in Suisse Romandie'' (15 juin 2021)) ; habanos.com (titre : dixième LCDH de Suisse à Montreux (donc ''seule'' caduc)) ; lacasadelhabano.com (Rue de Rive 34, 1260 Nyon, Vaud) ; habanos.com, liste officielle des points de vente, région Europe, lue le 31 octobre 2026 : « La Casa Del Habano Nyon (Switzerland / Nyon) »', `updated_at` = NOW()
 WHERE `id` = 45 AND `country_id` = 'switzerland' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : habanos.com (Via Angelo Maspoli 11, next to FoxTown ; ninth in Switzerland ; ouverture 26 avril (4 sept. 2024)) ; lacasadelhabano.com (fiche officielle LCDH Mendrisio, Via Angelo Maspoli) ; habanos.com (Genève ''ninth'' en nov. 2025 et Mendrisio dans les huit existantes : divergence de numérotation) ; habanos.com, liste officielle des points de vente, région Europe, lue le 31 octobre 2026 : « La Casa Del Habano Mendrisio (Switzerland / Mendrisio) »', `updated_at` = NOW()
 WHERE `id` = 46 AND `country_id` = 'switzerland' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com, LCDH Zug, Gotthardstrasse 20, 6300 Zug, +41 41 558 99 41; siglomundo.ch, Gotthardstrasse 20, 6300 Zug ; almost 200 square meters ; bar service; lacasadelhabano.com, inaugurada le 3 février 2024 (horodatage de la page : 2025-09-24) ; habanos.com, liste officielle des points de vente, région Europe, lue le 31 octobre 2026 : « La Casa Del Habano Zug (Switzerland / Zug) »', `updated_at` = NOW()
 WHERE `id` = 2570 AND `country_id` = 'switzerland' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com, Dorfstrasse 45, 7563 Samnaun-Dorf ; Hotel AlpChalet Bellevue where LCDH is Based; moodiedavittreport.com, article du 1er février 2024 : store has opened ; événement d''ouverture le 20 janvier; lcdh-samnaun.ch, WhatsApp +41 (0) 78 251 26 45 ; habanos.com, liste officielle des points de vente, région Europe, lue le 31 octobre 2026 : « La Casa Del Habano Samnaun (Switzerland / Samnaun Dorf) »', `updated_at` = NOW()
 WHERE `id` = 2571 AND `country_id` = 'switzerland' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com, LCDH Maastricht : Stationsstraat 33, 6221 BN, Maastricht; lacasadelhabanomaastricht.nl, Stationsstraat 33A, 6221 BN Maastricht ; mardi-samedi 10:00-18:00 ; habanos.com, liste officielle des points de vente, région Europe, lue le 31 octobre 2026 : « La Casa Del Habano Maastricht (Netherlands / Maastricht) »', `updated_at` = NOW()
 WHERE `id` = 60 AND `country_id` = 'netherlands' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com, Vía San Pasquale a Chiaia 74, Nápoles ; www.sisimbro.it ; habanos.com, liste officielle des points de vente, région Europe, lue le 31 octobre 2026 : « LA CASA DEL HABANO NAPOLI (Italy / NAPOLI) »', `updated_at` = NOW()
 WHERE `id` = 330 AND `country_id` = 'italy' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `name` = 'La Casa del Habano — Bucarest (JW Marriott)', `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com, El Único (LCDH Bucharest) : J.W. Marriott Bucharest, Calea 13 Septembrie 90; el-unico.ro, Liste des magasins : J.W. Marriott, Calea 13 Septembrie nr. 90 ; Athénée Palace absent ; habanos.com, liste officielle des points de vente, région Europe, lue le 31 octobre 2026 : « La Casa Del Habano (Romania / Bucharest) »', `updated_at` = NOW()
 WHERE `id` = 76 AND `country_id` = 'romania' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : habanos.com (23 juil. 2018 : Casa de Francfort ouverte en mai, centre-ville) ; annuaire habanos.com lu le 17 septembre 2026 et plan des franchises lacasadelhabano.com (état du 30 août 2026, lu le 18 septembre 2026) : une Casa dans cette ville. Numéro de rue non retrouvé ; habanos.com, liste officielle des points de vente, région Europe, lue le 31 octobre 2026 : « La Casa Del Habano Frankfurt (Germany / Frankfurt) »', `updated_at` = NOW()
 WHERE `id` = 39 AND `country_id` = 'germany' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com (Al Khaleej Building, Al Sawani Center, Ground Floor, Abu Baker Street, Salhiya, Kuwait City) ; lacasadelhabano.com (Koweït : « LA CASA DEL HABANO-KUWAIT CITY » (3 entrées Koweït au total)) ; habanos.com, liste officielle des points de vente, région Afrique / Moyen-Orient, lue le 31 octobre 2026 : « La Casa Del Habano-Kuwait City (Kuwait / Kuwait City) »', `updated_at` = NOW()
 WHERE `id` = 103 AND `country_id` = 'kuwait' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com (Airport Duty Paid — Shop No. FF-09, Kuwait International Airport, Departure) ; lacasadelhabano.com (Koweït : entrées « AIRPORT DUTY PAID » et « KUWAIT DUTY FREE-T 4 TERMINAL ») ; habanos.com, liste officielle des points de vente, région Afrique / Moyen-Orient, lue le 31 octobre 2026 : « La Casa Del Habano-Airport (Kuwait / Farwaniya) »', `updated_at` = NOW()
 WHERE `id` = 104 AND `country_id` = 'kuwait' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com (La Casa del Habano, Departures (Duty Free), Beirut ; Rafic Hariri International Airport, Terminal Building) ; lacasadelhabano.com (Liban : 2 entrées seulement (aéroport Departures, Verdun Down Town)) ; cigars.beirutdutyfree.com (Beirut Duty Free, Main Terminal Building ; pas de distinction arrivées/est) ; habanos.com, liste officielle, région Afrique / Moyen-Orient, lue le 31 octobre 2026 : « La Casa Del Habano - Beirut Airport Duty Free »', `updated_at` = NOW()
 WHERE `id` = 108 AND `country_id` = 'lebanon' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : habanos.com, Type La Casa del Habano ; The Walk, Jumeirah Beach Residence Complex, Opp. Ritz Carlton; lacasadelhabano.com, LCDH Dubai /Jumeirah Beach — The Walk, Jumeirah Beach Residence Complex; habanos.com, Liste BME active du 16 oct. 2018 : Jumeirah Beach Residence ; habanos.com, liste officielle des points de vente, région Afrique / Moyen-Orient, lue le 31 octobre 2026 : « Lcdh - The Walk, Jumeirah Beach Residence Complex (UAE / Dubai) »', `updated_at` = NOW()
 WHERE `id` = 97 AND `country_id` = 'uae' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : habanos.com, Terminal 3, Unit 4, Dubai Duty Free, Dubai International Airport; lacasadelhabano.com, LCDH Dubai/D.F.Terminal III — Terminal III Unit 4, Dubai Duty Free; habanos.com, Liste BME 2018 : Dubai Duty Free ; habanos.com, liste officielle des points de vente, région Afrique / Moyen-Orient, lue le 31 octobre 2026 : « La Casa Del Habano - Teminal 3. Airport (UAE / Dubai) »', `updated_at` = NOW()
 WHERE `id` = 98 AND `country_id` = 'uae' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : habanos.com, La Casa del Habano – Abu Dhabi ; Abu Dhabi Mall, Level 1; lacasadelhabano.com, LCDH Abu Dhabi /Mall — Abu Dhabi Mall, Level 1; habanos.com, Liste BME 2018 : Abu Dhabi Mall, +971 2 644 1505 ; habanos.com, liste officielle des points de vente, région Afrique / Moyen-Orient, lue le 31 octobre 2026 : « Lcdh - Abu Dhabi Mall, Level 1 (UAE / Abu Dhabi) »', `updated_at` = NOW()
 WHERE `id` = 99 AND `country_id` = 'uae' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com (North Entrance, The Westin Beijing, 9B Financial Street, Xicheng District, 100032) ; habanos.com, liste officielle des points de vente, région Asie-Pacifique, lue le 31 octobre 2026 : « Beijing Lcdh Westin Shop (China / Beijing) »', `updated_at` = NOW()
 WHERE `id` = 122 AND `country_id` = 'china' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com (Shop No.F1163, The St. Regis Hotel, 21 Jianguomen Outer St. 100020 Beijing) ; habanos.com, liste officielle des points de vente, région Asie-Pacifique, lue le 31 octobre 2026 : « Beijing Lcdh St. Regis Shop (China / Beijing) »', `updated_at` = NOW()
 WHERE `id` = 123 AND `country_id` = 'china' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com, Sheraton HK Hotel & Towers, 20 Nathan Road, Kowloon ; habanos.com, liste officielle des points de vente, région Asie-Pacifique, lue le 31 octobre 2026 : « La Casa Del Habano - Kowloon (Hong Kong / Kowloon) »', `updated_at` = NOW()
 WHERE `id` = 384 AND `country_id` = 'hongkong' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com, 11/F, Loke Yew Building, 50-52 Queen''s Road Central; lacasadelhabano.com, Hong Kong : Causeway Bay, Hong Kong, Hong Kong/Central ; habanos.com, liste officielle des points de vente, région Asie-Pacifique, lue le 31 octobre 2026 : « La Casa Del Habano - Hong Kong Island (Hong Kong) »', `updated_at` = NOW()
 WHERE `id` = 2561 AND `country_id` = 'hongkong' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com, LCDH Taipei, The Lobby, Grand Hyatt Taipei, 2 Sung Shou Road; cigarinspector.com, titre : Inside La Casa del Habano at the Grand Hyatt Taipei (page 403, titre vu en recherche) ; habanos.com, liste officielle des points de vente, région Asie-Pacifique, lue le 31 octobre 2026 : « La Casa Del Habano - Taipei (Taiwan / Taipei) »', `updated_at` = NOW()
 WHERE `id` = 130 AND `country_id` = 'taiwan' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com (Thailand : LCDH Bangkok/Mandarin Oriental ; Kempinski Siam Paragon ; Kempinski Sindhorn) ; bkmagazine.com (Mandarin Oriental Hotel, 48 Oriental Avenue ; 02-267-1596 ; 12pm-1am (article du 15 nov. 2018)) ; habanos.com, liste officielle des points de vente, région Asie-Pacifique, lue le 31 octobre 2026 : « La Casa Del Habano - Bangkok (Thailand / Bangkok) »', `updated_at` = NOW()
 WHERE `id` = 136 AND `country_id` = 'thailand' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com, LA CASA DEL HABANO DE BUENOS AIRES – Reconquista 976, Retiro, CABA (C1003); habanos.com, Reconquista 976, CABA C1003ABT ; distributeur exclusif Puro Tabaco S.A ; habanos.com, liste officielle des points de vente, région Amérique / Caraïbes, lue le 31 octobre 2026 : « Casa Del Habano De Buenos Aires (Argentina / CABA) »', `updated_at` = NOW()
 WHERE `id` = 157 AND `country_id` = 'argentina' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : casadelhabanochile.cl (Hotel W, Isidora Goyenechea 3000, S-104 (nivel -1), Las Condes) ; lacasadelhabano.com (Hotel W, Ave. Isidora Goyenechea 3000, Local S104, Santiago de Chile) ; habanos.com (article du 19 sept. 2016 ; Intercigar Comercial Limitada / Puro Tabaco S.A. (résultat de recherche habanos.com, 2012)) ; habanos.com, liste officielle, région Amérique / Caraïbes, lue le 31 octobre 2026 : « La Casa Del Habano Chile »', `updated_at` = NOW()
 WHERE `id` = 159 AND `country_id` = 'chile' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : habanos.com (article du 11 août 2025 : dîner du 15 juillet, plus de 50 passionnés, 30 ans de franchise à Windsor) ; lacasadelhabano.com (LCDH Windsor listée (Canada : Edmonton, Windsor)) ; cigaraficionado.com (2020 : Windsor fermée près de trois ans après un incendie voisin de 2017, réouverture envisagée) ; habanos.com, liste officielle des points de vente, région Amérique / Caraïbes, lue le 31 octobre 2026 : « La Casa Del Habano - Windsor (Canada / Windsor) »', `updated_at` = NOW()
 WHERE `id` = 155 AND `country_id` = 'canada' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : habanos.com (Inaugurée le 9 mars 2022 ; ''over 450m2'' ; ''the elegant Rohrmoser Boulevard'' (article du 18 mars 2022)) ; lacasadelhabano.com (Adresse : 300 metros Oeste de Plaza Mayor, frente a Boulevard Pavas, San José) ; habanos.com (Activités au ''La Casa del Habano in San José'', 15-17 mai 2025 (article du 2 juin 2025)) ; habanos.com, liste officielle, région Amérique / Caraïbes, lue le 31 octobre 2026 : « La Casa Del Habano Rohrmoser »', `updated_at` = NOW()
 WHERE `id` = 164 AND `country_id` = 'costarica' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : habanos.com (La Casa del Habano Quito : Av. Gonzalez Suarez 120 y Orellana, Hotel Quito ; distributeur Vegas del Caribe S.A.C) ; lacasadelhabano.com (LCDH Quito, Avenida González Suárez, 170109 Quito ; répertoire lacasadelhabano.com/directorio liste LCDH Quito sous Ecuador) ; habanos.com, liste officielle des points de vente, région Amérique / Caraïbes, lue le 31 octobre 2026 : « La Casa Del Habano Quito (Ecuador / Quito) »', `updated_at` = NOW()
 WHERE `id` = 185 AND `country_id` = 'ecuador' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com (Av. Encalada N°1601, Santiago de Surco, Lima, Perú) ; lacasadelhabano.pe (Av. La Encalada 1601 ; 10:30 a. m. a 6:30 p. m) ; habanos.com, liste officielle des points de vente, région Amérique / Caraïbes, lue le 31 octobre 2026 : « La Casa Del Habano Lima - La Encalada (Peru / Lima) »', `updated_at` = NOW()
 WHERE `id` = 162 AND `country_id` = 'peru' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com, LCDH Mazarik : Alejandro Dumas 135, int. Planta Baja Local A1, Col. Polanco; lacasadelhabano.com, Mexique : entrée « LCDH Mazarik » ; habanos.com, liste officielle des points de vente, région Amérique / Caraïbes, lue le 31 octobre 2026 : « Casa Del Habano Mazaryk (Mexico / Distrito Federal) »', `updated_at` = NOW()
 WHERE `id` = 190 AND `country_id` = 'mexico' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com (Boulevard Kukulkán km.12.7, Zona Hotelera, 77500 Cancún) ; habanos.com, liste officielle des points de vente, région Amérique / Caraïbes, lue le 31 octobre 2026 : « Lcdh - Cancun (Mexico / Cancun) »', `updated_at` = NOW()
 WHERE `id` = 191 AND `country_id` = 'mexico' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com (Diez de Sollano y Dávalos, No.4 Int.3, San Miguel de Allende, 37700 Guanajuato) ; habanos.com, liste officielle des points de vente, région Amérique / Caraïbes, lue le 31 octobre 2026 : « Casa Del Habano San Miguel Allende (Mexico) »', `updated_at` = NOW()
 WHERE `id` = 193 AND `country_id` = 'mexico' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com (Calle Primera, Casco Antiguo, Paseo de las Bóvedas, Ciudad Panamá) ; habanos.com (opened Nov 28, 2019 ''In the center of the Old Town of Panama City'') ; lacasadelhabanopanama.com (boutique en ligne La Casa del Habano Panamá (sans adresse)) ; habanos.com, liste officielle des points de vente, région Amérique / Caraïbes, lue le 31 octobre 2026 : « Casa Del Habano De Panamá (Panama / Ciudad De Panamá) »', `updated_at` = NOW()
 WHERE `id` = 1171 AND `country_id` = 'panama' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com (LCDH Sao Paulo/Jardins : Rua Oscar Freire, Nº 450, Bairro Cerqueira César) ; eschcafe.com.br (Esch Oscar : R. Oscar Freire, 450, Jardim Paulista ; La Casa del Habano officielle) ; habanos.com (Article du 13 oct. 2022 : La Casa del Habano Esch Café, 15 ans, São Paulo) ; habanos.com, liste officielle des points de vente, région Amérique / Caraïbes, lue le 31 octobre 2026 : « Esch Café – Casa Del Habano (Brazil / São Paulo) »', `updated_at` = NOW()
 WHERE `id` = 187 AND `country_id` = 'brazil' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `name` = 'La Casa del Habano — Rio de Janeiro (Leblon)', `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com (LCDH Río de Janeiro/Leblon : Rua Dias Ferreira 78A, Leblon) ; eschcafe.com.br (Esch Leblon : Rua Dias Ferreira, 78, Leblon, Rio de Janeiro) ; habanos.com, liste officielle des points de vente, région Amérique / Caraïbes, lue le 31 octobre 2026 : « Esch Café – Casa Del Habano (Brazil / Rio De Janeiro) »', `updated_at` = NOW()
 WHERE `id` = 188 AND `country_id` = 'brazil' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com (Hotel Nacional de Cuba, Calle 21 y O, Vedado, Plaza, La Habana) ; cigaraficionado.com (La Casa del Habano, Hotel Nacional, Calle 21 y O, Vedado (guide 2011)) ; habanos.com, liste officielle des points de vente, région Amérique / Caraïbes, lue le 31 octobre 2026 : « Lcdh Hotel Nacional (Cuba / La Habana) »', `updated_at` = NOW()
 WHERE `id` = 175 AND `country_id` = 'cuba' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

UPDATE `lounges` SET `source` = 'relu le 31 octobre 2026 : lacasadelhabano.com, fiche = LCDH Bangkok / Kempinski Sindhorn, 80 Soi Tonson ; aucune Casa à Chiang Mai (catégorie Habanos Specialist); lacasadelhabano.com, Thaïlande : Mandarin Oriental, Siam Kempinski, Sindhorn Kempinski (Bangkok) seulement ; habanos.com, liste officielle des points de vente, région Asie-Pacifique, lue le 31 octobre 2026 : « La Casa Del Habano, Chiangmai »', `updated_at` = NOW()
 WHERE `id` = 2497 AND `country_id` = 'thailand' AND `is_verified` = 1 AND `source` LIKE 'à vérifier%';

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 301';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 301', 'systeme', 'fiches_relues', 'systeme', 0, 'Franchises confirmees par la liste officielle habanos.com : 42 fiches, 4 noms corriges');

-- Contrôle : des 1 partout.
SELECT
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (65,63,53,67,68,80,75,42,45,46,2570,2571,60,330,76,39,103,104,108,97,98,99,122,123,384,2561,130,136,157,159,155,164,185,162,190,191,193,1171,187,188,175,2497) AND `source` LIKE 'relu le 31 octobre 2026%') = 42 AS `fiches_confirmees`,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (65,67,76,188) AND `name` NOT LIKE '%Sheraton%' AND `name` NOT LIKE '%Radisson%' AND `name` NOT LIKE '%Ath_n_e%' AND `name` NOT LIKE '%Ipanema%') = 4 AS `noms_corriges`;
