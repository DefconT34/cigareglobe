-- ════════════════════════════════════════════════════════
-- 153 — Les trente-quatre dernières, et sept doublons
-- ────────────────────────────────────────────────────────
-- CE QUI A CHANGÉ LA MÉTHODE. Ces trente-quatre fiches étaient
-- dispersées sur vingt-sept pays : une recherche par pays, sans
-- mutualisation possible. En cherchant l'Italie, un annuaire est
-- apparu — `habanomag.com`, qui reprend les fiches de habanos.com et du
-- site officiel La Casa del Habano, classées par ville, par pays et par
-- ÉCHELON. Quinze pages de la catégorie « La Casa del Habano », plus
-- une page par pays pour ceux qui n'y figuraient pas : la liste
-- mondiale se lit d'un bloc. Ce qui devait coûter vingt-sept enquêtes
-- en a coûté une.
--
-- ── LA CONTRAINTE D'UNICITÉ A CORRIGÉ MON PLAN ───────────
-- J'avais écrit neuf corrections : rendre à chaque pays sa vraie
-- adresse. La base a refusé la première — `uq_country_name` — parce que
-- la Grèce avait DÉJÀ une fiche « La Casa del Habano — Athènes ».
--
-- En vérifiant les huit autres, le même constat sept fois. L'atlas
-- détenait déjà la bonne adresse, sourcée, et l'import du 22 mars en
-- avait ajouté un SECOND exemplaire dans une autre ville :
--
--   Grèce       #94  Athènes, K. Varnali 42          ← juste
--               #971 Mykonos, Matogianni 56          ← doublon inventé
--   Équateur    #185 Quito, Av. Seis de Diciembre    ← juste
--               #1148 Guayaquil, Mall del Sol        ← doublon
--   Costa Rica  #164 San José, 75 m est de l'ambassade des États-Unis
--               #1109 San José, Multiplaza Escazú    ← doublon
--   Brésil      #187 São Paulo, Alameda Lorena 1899  ← juste
--               #470 São Paulo, Oscar Freire 940     ← doublon
--               #188 Rio, Rua Dias Ferreira 78       ← juste
--               #472 Rio, Shopping Leblon            ← doublon
--   Oman        #112 Mascate, Oasis by the Sea       ← juste
--               #999 Mascate, Shangri-La             ← doublon
--   Taïwan      #130 Taipei, Agora Garden            ← juste
--               #684 Kaohsiung                       ← doublon
--
-- Les fiches justes portent toutes des identifiants BAS — elles
-- viennent du fonds initial, sourcé « PDF officiel Habanos S.A. ». Les
-- doublons portent les identifiants de l'import. Corriger l'adresse du
-- doublon, comme je m'y apprêtais, aurait donné deux fiches identiques
-- au lieu d'une fausse.
--
-- C'est un garde-fou qui a fait son travail, et il faut le dire : sans
-- lui j'aurais dupliqué sept établissements en croyant les réparer.
--
-- ── LES DEUX VRAIES CORRECTIONS ──────────────────────────
--   #384 HONG KONG — la fiche disait « InterContinental, 18 Salisbury
--        Road ». La Casa del Habano de Kowloon est au SHERATON, 20
--        Nathan Road. (Il en existe une seconde à Hong Kong Island,
--        50-52 Queen's Road Central, que l'atlas ignore.)
--   #1171 PANAMÁ — la fiche disait « Multiplaza Pacific Mall ». Elle
--        est dans le CASCO ANTIGUO, Calle 1ra, Paseo de las Bóvedas.
--
-- ── LES VINGT-CINQ PAYS SANS CASA DEL HABANO ─────────────
-- Ils ont souvent autre chose, et le journal le nomme :
--   France      Habanos Specialist : Tabac Mercière à Lyon, Le Temps de
--               Vivre à Toulouse
--   Japon       deux LCDH, mais à TOKYO — Azabudai et Roppongi
--   Chine       deux LCDH, mais à PÉKIN — St. Regis et Westin ;
--               Shanghai et Chengdu ont des Cohiba Atmosphere
--   Canada      Montréal et Toronto, pas Calgary (trois Specialist)
--   Israël      Rishon LeZion et Haïfa, pas Tel Aviv
--   Turquie     le duty free de l'aéroport d'Istanbul
--   Autriche    Specialist à Linz, Wiener Neustadt, Schwechat
--   Croatie     Havana Cigar Shop, Frankopanska 22, Specialist
--   Philippines The Divan of Tabac, Peninsula Manila, Specialist
--   Ghana       D Real Trading, Habanos Point, Patrice Lumumba Road
--   Kenya       Maya Duty Free, aéroports de Nairobi et Mombasa
--   Ukraine     Tabakerka, Kyiv et Vinnytsia, Habanos Lounge
--   Égypte      les boutiques hors taxes de l'aéroport du Caire
--   Indonésie, Venezuela, Guatemala, Honduras, Paraguay, Corée du Sud
--               aucune entrée d'aucun échelon
--
-- ── LE MOTIF, CONFIRMÉ UNE DERNIÈRE FOIS ─────────────────
-- La plupart de ces fiches placent l'enseigne dans LE CENTRE COMMERCIAL
-- OU L'HÔTEL LE PLUS CONNU de la ville : Multiplaza Escazú, Mall del
-- Sol, Grand Indonesia, Tunjungan Plaza, Ramat Aviv Mall, Westgate,
-- Greenbelt 5, Lotte World Tower, Han Shin Arena, Ritz-Carlton,
-- Sheraton, Four Seasons, Shangri-La. C'est la signature d'un contenu
-- fabriqué depuis un nom de ville : on choisit l'adresse la plus
-- plausible, et elle l'est pour tout le monde sauf pour celui qui s'y
-- rend.
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/sources.php --figer
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

-- ── Hong Kong : le Sheraton, pas l'InterContinental ──────
UPDATE `lounges` SET
  `city` = 'Hong Kong — Sheraton Hong Kong Hotel & Towers, 20 Nathan Road, Kowloon',
  `phone` = NULL, `source` = 'habanomag.com, d''après habanos.com',
  `description`    = 'La Casa del Habano de Kowloon, au Sheraton de Nathan Road. Approvisionnée par Pacific Cigar, distributeur d''Habanos pour l''Asie-Pacifique.',
  `description_en` = 'La Casa del Habano in Kowloon, at the Sheraton on Nathan Road. Supplied by Pacific Cigar, the Habanos distributor for Asia-Pacific.',
  `description_es` = 'La Casa del Habano de Kowloon, en el Sheraton de Nathan Road. Abastecida por Pacific Cigar, distribuidor de Habanos para Asia-Pacífico.',
  `description_de` = 'La Casa del Habano in Kowloon, im Sheraton an der Nathan Road. Beliefert von Pacific Cigar, dem Habanos-Distributor für Asien-Pazifik.',
  `description_zh` = '位于九龙弥敦道喜来登酒店的 La Casa del Habano。由亚太区哈伯纳斯经销商 Pacific Cigar 供货。',
  `description_ar` = '«لا كاسا ديل هابانو» في كولون، داخل فندق شيراتون بشارع ناثان. يزوّدها Pacific Cigar، موزّع هابانوس لآسيا والمحيط الهادئ.',
  `updated_at` = NOW()
 WHERE `id` = 384 AND `country_id` = 'hongkong';

-- ── Panamá : le Casco Antiguo, pas le Multiplaza ─────────
UPDATE `lounges` SET
  `name` = 'La Casa del Habano — Panamá (Casco Antiguo)',
  `city` = 'Ciudad de Panamá — Calle 1ra, Paseo de las Bóvedas, Casco Antiguo San Felipe',
  `phone` = NULL, `source` = 'habanomag.com, d''après habanos.com',
  `description`    = 'Unique La Casa del Habano du Panamá, sur le Paseo de las Bóvedas, au bord du Casco Antiguo.',
  `description_en` = 'Panama''s only La Casa del Habano, on the Paseo de las Bóvedas at the edge of the Casco Antiguo.',
  `description_es` = 'Única La Casa del Habano de Panamá, en el Paseo de las Bóvedas, al borde del Casco Antiguo.',
  `description_de` = 'Panamas einzige La Casa del Habano, am Paseo de las Bóvedas am Rand der Altstadt.',
  `description_zh` = '巴拿马唯一的 La Casa del Habano，位于老城区边缘的 Paseo de las Bóvedas。',
  `description_ar` = 'المتجر الوحيد «لا كاسا ديل هابانو» في بنما، على ممشى لاس بوفيداس عند حافة المدينة القديمة.',
  `updated_at` = NOW()
 WHERE `id` = 1171 AND `country_id` = 'panama';

UPDATE `translation_status` t
  JOIN `lounges` l ON l.`id` = t.`entite_id`
   SET t.`source_hash` = SHA1(l.`description`), t.`statut` = 'machine', t.`maj` = NOW()
 WHERE t.`entite` = 'lounges' AND t.`champ` = 'description'
   AND t.`entite_id` IN ('384','1171');

-- ── Les sept doublons ────────────────────────────────────
UPDATE `lounges`
   SET `is_verified` = 0,
       `source`      = 'RETIRÉ — doublon : l''atlas porte déjà cette Casa del Habano à sa vraie adresse',
       `updated_at`  = NOW()
 WHERE `id` IN (470, 472, 684, 971, 999, 1109, 1148);

-- ── Les vingt-cinq villes sans Casa del Habano ───────────
UPDATE `lounges`
   SET `is_verified` = 0,
       `source`      = 'RETIRÉ — l''annuaire du réseau ne place aucune Casa del Habano dans cette ville',
       `updated_at`  = NOW()
 WHERE `id` IN (234, 239, 364, 367, 374, 376, 378, 434, 623, 626, 644, 688,
                785, 788, 819, 824, 831, 937, 945, 967, 1106, 1112, 1115, 1145, 1174);

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 153','systeme','methode','lounge',0,'annuaire habanomag.com (reprend habanos.com et le site officiel LCDH) : liste mondiale par ville, pays et echelon — 15 pages lues, plus une page par pays absent'),
  (NULL,'migration 153','systeme','garde_fou','lounge',0,'la contrainte uq_country_name a refuse la premiere correction : la Grece avait deja sa fiche d Athenes. Verification faite, sept des neuf corrections prevues auraient duplique un etablissement que l atlas detenait deja juste'),
  (NULL,'migration 153','systeme','fiche_corrigee','lounge',384,'Kowloon est au Sheraton, 20 Nathan Road — pas a l InterContinental ; une seconde LCDH existe a Hong Kong Island'),
  (NULL,'migration 153','systeme','fiche_corrigee','lounge',1171,'Panama : Casco Antiguo San Felipe, Paseo de las Bovedas — pas le Multiplaza Pacific'),
  (NULL,'migration 153','systeme','doublons_retires','lounge',0,'7 doublons de fiches justes : #971 (vs #94 Athenes), #1148 (vs #185 Quito), #1109 (vs #164 San Jose), #470 (vs #187 Sao Paulo), #472 (vs #188 Rio), #999 (vs #112 Mascate), #684 (vs #130 Taipei)'),
  (NULL,'migration 153','systeme','lounges_retires','lounge',0,'25 villes sans LCDH : France (Specialist a Lyon et Toulouse), Japon (Tokyo), Chine (Pekin), Canada (Montreal, Toronto), Israel (Rishon LeZion, Haifa), Turquie (duty free Istanbul), Autriche, Croatie, Philippines, Ghana, Kenya, Ukraine, Egypte (autres echelons), Indonesie, Venezuela, Guatemala, Honduras, Paraguay, Coree du Sud (aucune entree)'),
  (NULL,'migration 153','systeme','a_documenter','lounge',0,'LCDH a documenter, adresses relevees : Tokyo Azabudai 2-3-9 Minato-ku ; Tokyo Roppongi 7-chome DM Bldg 18-11 ; Pekin St. Regis shop F1163 ; Pekin Westin Financial Street 9B ; Montreal 1434 Sherbrooke West ; Toronto 111 Yorkville Ave ; Hong Kong Island 11/F Loke Yew Building 50-52 Queen s Road Central ; Rio Centro Esch Cafe Rua do Rosario 107 ; Israel Rishon LeZion 6 Yaldei Teheran et Haifa CC Ein-Hamifratz');
