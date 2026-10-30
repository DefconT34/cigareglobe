-- ════════════════════════════════════════════════════════
-- 298 — Enrichissements, doublons, renommages et une fiche ajoutée
-- ────────────────────────────────────────────────────────
-- CE QU'ON A TROUVÉ. Suite de la 297 (relecture du 29 octobre 2026).
-- 1. Enrichissements : téléphone, site, Instagram, horaires lus sur la page
--    officielle de l'établissement ou de sa maison mère, écrits SEULEMENT là où
--    la colonne était vide (aucune valeur existante n'est écrasée).
-- 2. Trois doublons retirés (#2573 → #63, #183 → #1572, #198 → #2574).
--    Les horaires de #2574 étaient ceux de la galerie, pas ceux de la boutique : effacés.
-- 3. Renommages : #913 (« Churchill Bar » n'existe pas : c'est le Royal Lounge),
--    #282 (La Casa del Habano & Puffin Rooms, pas Turmeaus), #1189 (Radisson Hotel
--    & Apartments Abidjan Plateau, pas Radisson Blu ; adresse non recoupée retirée).
-- 4. #2576 : site trabucul.ro retiré (page en erreur serveur, n'établit rien).
-- 5. Nouvelle fiche #2580 : L'Escale, cigar lounge du Novotel Abidjan Marcory
--    (page officielle Accor + annonce Accor + presse).
-- ════════════════════════════════════════════════════════

UPDATE `lounges` SET `website` = 'https://www.la-casa-del-habano.ch', `updated_at` = NOW() WHERE `id` = 42 AND `country_id` = 'switzerland' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://www.lacasadelhabano-basel.ch', `updated_at` = NOW() WHERE `id` = 43 AND `country_id` = 'switzerland' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://www.lacasadelhabanolugano.ch', `updated_at` = NOW() WHERE `id` = 44 AND `country_id` = 'switzerland' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://la-casa-del-habano-nyon.com', `updated_at` = NOW() WHERE `id` = 45 AND `country_id` = 'switzerland' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `phone` = '+41 91 6463300', `website` = 'https://www.lacasadelhabanomendrisio.com', `updated_at` = NOW() WHERE `id` = 46 AND `country_id` = 'switzerland' AND (`phone` IS NULL OR `phone` = '') AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://lcdhcigars.uk', `updated_at` = NOW() WHERE `id` = 50 AND `country_id` = 'uk' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `instagram` = '@dominiquelondongroup', `updated_at` = NOW() WHERE `id` = 55 AND `country_id` = 'belgium' AND (`instagram` IS NULL OR `instagram` = '');
UPDATE `lounges` SET `website` = 'https://lcdh-amsterdam.com', `updated_at` = NOW() WHERE `id` = 58 AND `country_id` = 'netherlands' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://www.lacasadelhabano-thehague.com', `hours` = 'lundi et dimanche fermé ; mardi-samedi 11h00-18h00 ; fermé Pâques, Fête du Roi, Pentecôte, Noël', `updated_at` = NOW() WHERE `id` = 59 AND `country_id` = 'netherlands' AND (`website` IS NULL OR `website` = '') AND (`hours` IS NULL OR `hours` = '');
UPDATE `lounges` SET `website` = 'https://www.hajenius.com', `hours` = 'lundi fermé ; mardi-samedi 9h30-18h00 ; dimanche 12h00-17h00 ; jours fériés particuliers', `updated_at` = NOW() WHERE `id` = 61 AND `country_id` = 'netherlands' AND (`website` IS NULL OR `website` = '') AND (`hours` IS NULL OR `hours` = '');
UPDATE `lounges` SET `website` = 'https://www.lacasadelhabano.lu', `hours` = 'lundi fermé ; mardi-samedi 10:00-18:00', `updated_at` = NOW() WHERE `id` = 62 AND `country_id` = 'luxembourg' AND (`website` IS NULL OR `website` = '') AND (`hours` IS NULL OR `hours` = '');
UPDATE `lounges` SET `website` = 'https://www.kalimancaribe.com (cité sur la page, non lu : 403)', `updated_at` = NOW() WHERE `id` = 68 AND `country_id` = 'bulgaria' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://lcdhcy.com (page d''accueil vide le 2026-10-29, cité par la fiche officielle)', `updated_at` = NOW() WHERE `id` = 70 AND `country_id` = 'cyprus' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://warszawa.lcdh.pl', `hours` = 'lundi-samedi 12:00-00:00, dimanche 13:00-22:00', `updated_at` = NOW() WHERE `id` = 74 AND `country_id` = 'poland' AND (`website` IS NULL OR `website` = '') AND (`hours` IS NULL OR `hours` = '');
UPDATE `lounges` SET `website` = 'https://krakow.lcdh.pl', `hours` = 'lundi-samedi 12:00-00:00, dimanche 13:00-22:00', `updated_at` = NOW() WHERE `id` = 75 AND `country_id` = 'poland' AND (`website` IS NULL OR `website` = '') AND (`hours` IS NULL OR `hours` = '');
UPDATE `lounges` SET `phone` = '+40 21 490 44 66', `website` = 'https://lerida.ro', `updated_at` = NOW() WHERE `id` = 77 AND `country_id` = 'romania' AND (`phone` IS NULL OR `phone` = '') AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://www.fincatolacasadelhabano.com', `updated_at` = NOW() WHERE `id` = 88 AND `country_id` = 'italy' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://www.remedymilano.it', `hours` = 'Lundi-samedi 18h00-01h00', `updated_at` = NOW() WHERE `id` = 89 AND `country_id` = 'italy' AND (`website` IS NULL OR `website` = '') AND (`hours` IS NULL OR `hours` = '');
UPDATE `lounges` SET `website` = 'https://www.hoteldericci.com', `updated_at` = NOW() WHERE `id` = 90 AND `country_id` = 'italy' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://www.puroaccessori.gr', `hours` = 'lun, mer, sam 9h00-15h30 ; mar, jeu, ven 9h00-21h00 ; dim fermé', `updated_at` = NOW() WHERE `id` = 94 AND `country_id` = 'greece' AND (`website` IS NULL OR `website` = '') AND (`hours` IS NULL OR `hours` = '');
UPDATE `lounges` SET `website` = 'https://cigars.beirutdutyfree.com', `updated_at` = NOW() WHERE `id` = 108 AND `country_id` = 'lebanon' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://lacasadelhabano.com/locateanythingMarker/lcdh-oman-muscat/', `updated_at` = NOW() WHERE `id` = 112 AND `country_id` = 'oman' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://www.cigarclub.co.jp/', `updated_at` = NOW() WHERE `id` = 116 AND `country_id` = 'japan' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://tableauxlounge.jp/', `updated_at` = NOW() WHERE `id` = 119 AND `country_id` = 'japan' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://www.tokyuhotels.co.jp/cerulean-h/eat/r261/index.html', `updated_at` = NOW() WHERE `id` = 120 AND `country_id` = 'japan' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://www.lcdh.com.mo', `updated_at` = NOW() WHERE `id` = 127 AND `country_id` = 'macau' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://www.grandlisboapalace.com', `updated_at` = NOW() WHERE `id` = 129 AND `country_id` = 'macau' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `instagram` = '@lacasadelhabanokl', `hours` = 'tous les jours 12h-minuit', `updated_at` = NOW() WHERE `id` = 134 AND `country_id` = 'malaysia' AND (`instagram` IS NULL OR `instagram` = '') AND (`hours` IS NULL OR `hours` = '');
UPDATE `lounges` SET `website` = 'https://lacasadelhabano.vn/', `updated_at` = NOW() WHERE `id` = 140 AND `country_id` = 'vietnam' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://sofitel-legend-metropole-hanoi.com/', `updated_at` = NOW() WHERE `id` = 141 AND `country_id` = 'vietnam' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://lacasadelhabano.pe', `hours` = '10:00-22:00', `updated_at` = NOW() WHERE `id` = 161 AND `country_id` = 'peru' AND (`website` IS NULL OR `website` = '') AND (`hours` IS NULL OR `hours` = '');
UPDATE `lounges` SET `website` = 'https://lacasadelhabano.pe', `hours` = '10:30-18:30', `updated_at` = NOW() WHERE `id` = 162 AND `country_id` = 'peru' AND (`website` IS NULL OR `website` = '') AND (`hours` IS NULL OR `hours` = '');
UPDATE `lounges` SET `website` = 'https://www.lacasadelhabanocr.com', `instagram` = '@lcdhcostarica', `updated_at` = NOW() WHERE `id` = 164 AND `country_id` = 'costarica' AND (`website` IS NULL OR `website` = '') AND (`instagram` IS NULL OR `instagram` = '');
UPDATE `lounges` SET `phone` = '+1 869 466 1904', `website` = 'https://www.lacasadelhabano.kn', `updated_at` = NOW() WHERE `id` = 171 AND `country_id` = 'stkitts' AND (`phone` IS NULL OR `phone` = '') AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://www.lacasadelhabano.com/locateanythingMarker/lcdh-grand-cayman/', `updated_at` = NOW() WHERE `id` = 173 AND `country_id` = 'caymanisles' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://lacasadelhabano.com/', `updated_at` = NOW() WHERE `id` = 174 AND `country_id` = 'cuba' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://lacasadelhabano.com/', `updated_at` = NOW() WHERE `id` = 175 AND `country_id` = 'cuba' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://lacasadelhabano.com/', `updated_at` = NOW() WHERE `id` = 176 AND `country_id` = 'cuba' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://lacasadelhabano.com/', `updated_at` = NOW() WHERE `id` = 177 AND `country_id` = 'cuba' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `phone` = '+593 2 223 1270', `website` = 'https://lacasadelhabano.com/locateanythingMarker/lcdh-quito/', `updated_at` = NOW() WHERE `id` = 185 AND `country_id` = 'ecuador' AND (`phone` IS NULL OR `phone` = '') AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://www.eschcafe.com.br', `hours` = 'Lun 12h-23h ; mar-ven 12h-1h ; sam 12h-0h ; dim 13h-21h', `updated_at` = NOW() WHERE `id` = 187 AND `country_id` = 'brazil' AND (`website` IS NULL OR `website` = '') AND (`hours` IS NULL OR `hours` = '');
UPDATE `lounges` SET `website` = 'https://www.eschcafe.com.br', `hours` = 'Lun 12h30-22h ; mar-mer 12h30-0h ; jeu-sam 12h30-0h30 ; dim 13h-22h', `updated_at` = NOW() WHERE `id` = 188 AND `country_id` = 'brazil' AND (`website` IS NULL OR `website` = '') AND (`hours` IS NULL OR `hours` = '');
UPDATE `lounges` SET `website` = 'https://lacasadelhabano.com/locateanythingMarker/lcdh-cancun/', `updated_at` = NOW() WHERE `id` = 191 AND `country_id` = 'mexico' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `phone` = '+52 477 755 5596', `website` = 'https://www.cigarsocietymx.com', `updated_at` = NOW() WHERE `id` = 192 AND `country_id` = 'mexico' AND (`phone` IS NULL OR `phone` = '') AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://www.casasdelhabano.com (déclaré sur la fiche ; domaine non testé au DNS, ne pas citer sans contrôle)', `updated_at` = NOW() WHERE `id` = 193 AND `country_id` = 'mexico' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://tabacalera.com.ph', `updated_at` = NOW() WHERE `id` = 196 AND `country_id` = 'philippines' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://www.pacificcigar.com', `updated_at` = NOW() WHERE `id` = 197 AND `country_id` = 'australia' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://www.puffinrooms.co.uk/liverpool', `instagram` = '@puffinrooms', `updated_at` = NOW() WHERE `id` = 281 AND `country_id` = 'uk' AND (`website` IS NULL OR `website` = '') AND (`instagram` IS NULL OR `instagram` = '');
UPDATE `lounges` SET `website` = 'https://lcdhcigars.uk', `updated_at` = NOW() WHERE `id` = 282 AND `country_id` = 'uk' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `hours` = 'Lun-ven 12:00-20:00 ; sam, dim, jours feries 12:00-19:00', `updated_at` = NOW() WHERE `id` = 365 AND `country_id` = 'japan' AND (`hours` IS NULL OR `hours` = '');
UPDATE `lounges` SET `website` = 'https://cohiba-atmosphere.jp/', `updated_at` = NOW() WHERE `id` = 366 AND `country_id` = 'japan' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://www.mamillahotel.com/', `updated_at` = NOW() WHERE `id` = 646 AND `country_id` = 'israel' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://www.clubmacanudo.com/locations/taipei/', `updated_at` = NOW() WHERE `id` = 683 AND `country_id` = 'taiwan' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `instagram` = '@cavadelpurocolombia', `updated_at` = NOW() WHERE `id` = 750 AND `country_id` = 'colombia' AND (`instagram` IS NULL OR `instagram` = '');
UPDATE `lounges` SET `website` = 'https://luxembourg.leroyal.com/', `updated_at` = NOW() WHERE `id` = 913 AND `country_id` = 'luxembourg' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `phone` = '+381 11 2637 690', `hours` = 'Lundi-dimanche 09:00-22:00', `updated_at` = NOW() WHERE `id` = 934 AND `country_id` = 'serbia' AND (`phone` IS NULL OR `phone` = '') AND (`hours` IS NULL OR `hours` = '');
UPDATE `lounges` SET `website` = 'https://www.fairmont.com/en/hotels/kyiv/fairmont-grand-hotel-kyiv/', `hours` = 'Vintage Bar : tous les jours 12h-2h', `updated_at` = NOW() WHERE `id` = 944 AND `country_id` = 'ukraine' AND (`website` IS NULL OR `website` = '') AND (`hours` IS NULL OR `hours` = '');
UPDATE `lounges` SET `website` = 'https://kempinski.com/en/kempinski-hotel-muscat', `hours` = '1897 Cocktail Lounge : lundi-dimanche 17:00-01:00', `updated_at` = NOW() WHERE `id` = 1000 AND `country_id` = 'oman' AND (`website` IS NULL OR `website` = '') AND (`hours` IS NULL OR `hours` = '');
UPDATE `lounges` SET `website` = 'https://www.grandcasebeachclub.com', `updated_at` = NOW() WHERE `id` = 1130 AND `country_id` = 'stmartin' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `phone` = '+507 6673 5402', `website` = 'https://www.lacasadelhabanopanama.com', `updated_at` = NOW() WHERE `id` = 1171 AND `country_id` = 'panama' AND (`phone` IS NULL OR `phone` = '') AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://www.mamounia.com', `hours` = 'tous les jours 16h00-01h00', `updated_at` = NOW() WHERE `id` = 1201 AND `country_id` = 'morocco' AND (`website` IS NULL OR `website` = '') AND (`hours` IS NULL OR `hours` = '');
UPDATE `lounges` SET `website` = 'https://www.caffeflorian.com', `updated_at` = NOW() WHERE `id` = 1367 AND `country_id` = 'italy' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://www.circolodellunione.it', `updated_at` = NOW() WHERE `id` = 1368 AND `country_id` = 'italy' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://www.grandlisboa.com/en/restaurants-n-bars/robuchon-au-dome', `updated_at` = NOW() WHERE `id` = 1449 AND `country_id` = 'macau' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://hotelnacionaldecuba.com', `hours` = 'Habanos Lounge : 12:00-24:00', `updated_at` = NOW() WHERE `id` = 1564 AND `country_id` = 'cuba' AND (`website` IS NULL OR `website` = '') AND (`hours` IS NULL OR `hours` = '');
UPDATE `lounges` SET `website` = 'https://www.metropole.com/fr', `updated_at` = NOW() WHERE `id` = 1616 AND `country_id` = 'monaco' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `hours` = 'tous les jours 08:00-24:00', `updated_at` = NOW() WHERE `id` = 2498 AND `country_id` = 'thailand' AND (`hours` IS NULL OR `hours` = '');
UPDATE `lounges` SET `website` = 'https://www.caravellehotel.com/', `updated_at` = NOW() WHERE `id` = 2505 AND `country_id` = 'vietnam' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `website` = 'https://www.hoteldesalmadies.com', `updated_at` = NOW() WHERE `id` = 2541 AND `country_id` = 'senegal' AND (`website` IS NULL OR `website` = '');
UPDATE `lounges` SET `instagram` = '@hoteldulacbenin', `updated_at` = NOW() WHERE `id` = 2546 AND `country_id` = 'benin' AND (`instagram` IS NULL OR `instagram` = '');
UPDATE `lounges` SET `phone` = '+60 3 3000 8633', `hours` = 'lundi-samedi 13h-minuit, fermé dimanche', `updated_at` = NOW() WHERE `id` = 2558 AND `country_id` = 'malaysia' AND (`phone` IS NULL OR `phone` = '') AND (`hours` IS NULL OR `hours` = '');
UPDATE `lounges` SET `instagram` = '@cavadelpurocolombia', `updated_at` = NOW() WHERE `id` = 2566 AND `country_id` = 'colombia' AND (`instagram` IS NULL OR `instagram` = '');
UPDATE `lounges` SET `instagram` = '@cavadelpurocolombia', `updated_at` = NOW() WHERE `id` = 2567 AND `country_id` = 'colombia' AND (`instagram` IS NULL OR `instagram` = '');

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 29 octobre 2026 : doublon, même adresse (Plaça Coprínceps 3, Escaldes-Engordany) et même enseigne La Casa del Habano que la fiche 63, qui est conservée', `updated_at` = NOW() WHERE `id` = 2573;
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 29 octobre 2026 : doublon, même événement que la fiche 1572 (ProCigar Festival, Santiago), qui est conservée', `updated_at` = NOW() WHERE `id` = 183;
UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 29 octobre 2026 : doublon, même boutique Davidoff de The Strand Arcade que la fiche 2574, qui est conservée', `updated_at` = NOW() WHERE `id` = 198;
UPDATE `lounges` SET `hours` = NULL, `updated_at` = NOW() WHERE `id` = 2574;
UPDATE `lounges` SET `website` = NULL, `updated_at` = NOW() WHERE `id` = 2576 AND `website` LIKE '%trabucul.ro%';
UPDATE `lounges` SET `name` = 'Le Royal Hotel — Royal Lounge', `updated_at` = NOW() WHERE `id` = 913 AND `country_id` = 'luxembourg';
UPDATE `lounges` SET `name` = 'La Casa del Habano — Édimbourg (Puffin Rooms)', `updated_at` = NOW() WHERE `id` = 282 AND `country_id` = 'uk';
UPDATE `lounges` SET
  `name` = 'Radisson Hotel & Apartments Abidjan Plateau — Sky Bar',
  `city` = 'Abidjan, Plateau — Radisson Hotel & Apartments Abidjan Plateau',
  `description` = 'Sky bar de l''hôtel Radisson Hotel & Apartments Abidjan Plateau, annoncé par la presse avant l''ouverture de l''hôtel. Aucune source lue ne mentionne d''espace cigares ; la page officielle de l''hôtel n''a pas pu être lue.',
  `description_en` = 'Sky bar of the Radisson Hotel & Apartments Abidjan Plateau, announced in the press before the hotel opened. No source read mentions a cigar space; the hotel''s official page could not be read.',
  `description_es` = 'Sky bar del Radisson Hotel & Apartments Abidjan Plateau, anunciado por la prensa antes de la apertura del hotel. Ninguna fuente leída menciona un espacio para puros; no se pudo leer la página oficial del hotel.',
  `description_de` = 'Skybar des Radisson Hotel & Apartments Abidjan Plateau, von der Presse vor der Eröffnung des Hotels angekündigt. Keine gelesene Quelle erwähnt einen Zigarrenbereich; die offizielle Seite des Hotels konnte nicht gelesen werden.',
  `description_zh` = '阿比让高原区 Radisson Hotel & Apartments 酒店的空中酒吧，酒店开业前媒体已有报道。所读资料均未提及雪茄空间；未能读取酒店官方页面。',
  `description_ar` = 'بار علوي في فندق Radisson Hotel & Apartments Abidjan Plateau، أعلنت عنه الصحافة قبل افتتاح الفندق. لا يذكر أي مصدر مقروء وجود مساحة للسيجار؛ ولم يتيسّر قراءة الصفحة الرسمية للفندق.',
  `source` = 'à vérifier — relu le 29 octobre 2026 : hospitalitynet.org, annonce du Radisson Hotel & Apartments Abidjan Plateau (sky bar annoncé) ; radissonhotels.com, page Abidjan (seul le Radisson Blu Abidjan Airport y a des pages de restauration) ; aucun espace cigares attesté',
  `updated_at` = NOW()
 WHERE `id` = 1189 AND `country_id` = 'ivorycoast';

INSERT INTO `lounges`
  (`id`, `country_id`, `name`, `city`, `type`, `website`, `source`, `is_verified`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `created_at`, `updated_at`)
SELECT 2580, 'ivorycoast', 'L''Escale (Cigar Lounge) — Novotel Abidjan Marcory', 'Abidjan, Marcory — Boulevard Valéry Giscard d''Estaing', 'Hôtel Cigar Lounge', 'https://all.accor.com/hotel/B1I4/index.fr.shtml', 'all.accor.com, page du Novotel Abidjan Marcory (L''Escale, cigar lounge, lu le 29 octobre 2026) ; hospitalitynet.org, annonce Accor du 22 novembre 2024 ; financialafrik.com, 13 février 2025 (inauguration officielle de l''hôtel le 6 février 2025)', 1,
  'Cigar lounge du Novotel Abidjan Marcory, cité parmi les bars de l''hôtel sur sa page Accor et dans l''annonce d''Accor du 22 novembre 2024. L''hôtel a été inauguré officiellement le 6 février 2025.',
  'Cigar lounge of the Novotel Abidjan Marcory, listed among the hotel''s bars on its Accor page and in Accor''s announcement of 22 November 2024. The hotel was officially inaugurated on 6 February 2025.',
  'Cigar lounge del Novotel Abidjan Marcory, citado entre los bares del hotel en su página de Accor y en el anuncio de Accor del 22 de noviembre de 2024. El hotel se inauguró oficialmente el 6 de febrero de 2025.',
  'Zigarrenlounge des Novotel Abidjan Marcory, auf der Accor-Seite des Hotels und in der Accor-Ankündigung vom 22. November 2024 unter den Bars des Hauses genannt. Das Hotel wurde am 6. Februar 2025 offiziell eingeweiht.',
  '阿比让马尔科里诺富特酒店的雪茄酒廊，在酒店的 Accor 页面和 Accor 2024年11月22日的公告中列入酒店酒吧。酒店于2025年2月6日正式落成。',
  'صالة سيجار في فندق Novotel Abidjan Marcory، مدرجة بين بارات الفندق في صفحته على موقع Accor وفي إعلان Accor بتاريخ 22 نوفمبر 2024. افتُتح الفندق رسميًا في 6 فبراير 2025.',
  NOW(), NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounges` WHERE `id` = 2580);
INSERT INTO `lounge_photos` (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
SELECT 490, 2580, 'placeholder_2580.jpg', 1, 1, 'admin', 1, NOW()
 WHERE NOT EXISTS (SELECT 1 FROM `lounge_photos` WHERE `lounge_id` = 2580);

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'lounges', l.`id`, 'description', g.lang, SHA1(l.`description`), 'machine', NOW()
  FROM `lounges` l
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de' UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') g
 WHERE l.`id` IN (1189, 2580)
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `statut` = 'machine', `maj` = NOW();

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 298';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 298', 'systeme', 'fiches_enrichies', 'systeme', 0, '73 fiches enrichies (champs vides seulement), 3 doublons retirés, 3 renommages, 1 fiche ajoutée'),
  (NULL,'migration 298','systeme','fiche_retiree','lounge',2573,'doublon de la fiche 63'),
  (NULL,'migration 298','systeme','fiche_retiree','lounge',183,'doublon de la fiche 1572'),
  (NULL,'migration 298','systeme','fiche_retiree','lounge',198,'doublon de la fiche 2574'),
  (NULL,'migration 298','systeme','fiche_renommee','lounge',913,'Churchill Bar → Royal Lounge : le site de l''hôtel ne liste aucun Churchill Bar'),
  (NULL,'migration 298','systeme','fiche_renommee','lounge',282,'Turmeaus — Edinburgh → La Casa del Habano (Puffin Rooms) : Turmeaus n''a pas d''adresse à Édimbourg'),
  (NULL,'migration 298','systeme','fiche_renommee','lounge',1189,'Radisson Blu → Radisson Hotel & Apartments Abidjan Plateau ; adresse non recoupée retirée'),
  (NULL,'migration 298','systeme','fiche_ajoutee','lounge',2580,'L''Escale (Cigar Lounge) — Novotel Abidjan Marcory — all.accor.com, hospitalitynet.org, financialafrik.com, lus le 29 octobre 2026');

-- Contrôle : des 1 partout.
SELECT
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (2573, 183, 198) AND `is_verified` = 0 AND `source` LIKE 'RETIRÉ%') = 3 AS `doublons_retires`,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (913, 282, 1189) AND `name` IN ('Le Royal Hotel — Royal Lounge', 'La Casa del Habano — Édimbourg (Puffin Rooms)', 'Radisson Hotel & Apartments Abidjan Plateau — Sky Bar')) = 3 AS `renommees`,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` = 2580 AND `is_verified` = 1) = 1 AS `fiche_ajoutee`,
  (SELECT COUNT(*) FROM `translation_status` WHERE `entite` = 'lounges' AND `champ` = 'description' AND `entite_id` IN ('1189', '2580') AND `statut` = 'machine') = 10 AS `sceaux_remis`;
