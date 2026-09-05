-- ════════════════════════════════════════════════════════
-- 163 — Fagot Cigare a une source
-- ────────────────────────────────────────────────────────
-- LA DERNIÈRE DES 408. Depuis la migration 141, `source` est renseignée
-- sur 407 fiches publiées. Une seule restait vide : #11, Fagot Cigare, à
-- Abidjan. L'utilisateur, qui est sur place, a fourni le site officiel —
-- lefagot.com. C'est la seule source qui manquait à l'atlas entier.
--
-- ── EN LA DOCUMENTANT, TROIS DÉFAUTS SONT APPARUS ────────
--
-- 1. LA PROSE AFFIRMAIT CE QUE LA SOURCE NE DIT PAS.
--    « Seule fabrique artisanale de cigares ivoiriens » — le site ne
--    revendique nulle part d'être la seule. « Cigares sur mesure, live
--    cigar show » — ni l'un ni l'autre n'y figurent. Ce sont des
--    affirmations de l'import du 18 mars, pas des faits du fabricant.
--
-- 2. LES TRADUCTIONS ÉTAIENT DES SUBSTITUTIONS MOT À MOT, la faute
--    exacte des migrations 157→160 :
--      en : « Only factory artisanal de cigares ivoiriens »
--      es : « Única fábrica artisanale de cigares ivoiriens »
--      de : « Einzige Fabrik artisanale de cigares ivoiriens »
--    CETTE FICHE A ÉCHAPPÉ AUX DEUX SONDES, et il faut le dire : celle
--    de la campagne cherche des mots-outils français — « de la », « du »,
--    « le », « les » — et ce résidu-ci n'en porte aucun. Elle n'a pas
--    été trouvée par un outil mais en lisant la ligne.
--
-- 3. LE HANDLE INSTAGRAM ÉTAIT DANS LA PROSE — « Instagram:
--    @fagot_cigare » — alors que la colonne `instagram` le porte déjà et
--    que la page en fait un lien. Il était donc rendu deux fois, dont
--    une en texte mort.
--
-- ── CE QUE LE SITE ÉTABLIT, ET RIEN DE PLUS ──────────────
--   · une fabrique artisanale : « roulé à la main », « feuilles
--     minutieusement sélectionnées », « sans additifs, sans artifices »
--   · l'adresse : Riviéra Palmeraie, après la cité universitaire de la
--     Riviéra 2 — le quartier de Cocody où l'atlas porte déjà #10
--   · la gamme : Robusto, Aboussouan (décliné Le Poro, Tiébissou,
--     Djékanou), et l'assortiment Fagorillos
--   · la vente à l'unité ou en fagots
--
-- ── CE QU'ON N'ÉCRIT PAS, ET POURQUOI ────────────────────
--   · LA BOUTIQUE EN LIGNE. Le site l'annonce, /shop répond « Aucun
--     produit défini ». Annoncer une vente en ligne qui n'a rien à
--     vendre tromperait le lecteur.
--   · LE SECOND NUMÉRO. Le site en porte deux : le lien `tel:` du menu
--     donne +225 07 04 05 70 70 — celui que la fiche portait déjà, et
--     qui se trouve ainsi recoupé — tandis que la page contact affiche
--     « +225 07 04 05 0 07 07 », mal formé. On garde le premier.
--   · TIASSALÉ. Le champ `city` listait « Abidjan (et Tiassalé,
--     Djékanou, Tiébissou) ». Le site confirme Djékanou et Tiébissou —
--     ce sont des NOMS DE CIGARES de la gamme Aboussouan, pas des
--     adresses. Tiassalé n'apparaît nulle part. Le champ redevient une
--     ville et une adresse, comme sur les douze autres fiches d'Abidjan.
--
-- ── ET UN CONSTAT QUI DÉPASSE CETTE FICHE ────────────────
-- Le site ne décrit pas un point de vente : il décrit un FABRICANT, avec
-- trois lignes nommées et un terroir revendiqué. La Côte d'Ivoire est
-- pourtant dans `lounge_countries`, pas dans `producer_countries`. Ce
-- n'est pas corrigé ici — ouvrir un pays producteur demande un rang, une
-- région, des récoltes, un climat, des sols, et six langues. C'est noté
-- à la feuille de route, pas décidé en passant.
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/sources.php --figer
--   php tools/i18n_dump.php > sql/traductions.sql
--   php tools/placeholders.php --fiche 11     ← SUR LE SERVEUR
-- ════════════════════════════════════════════════════════

UPDATE `lounges` SET
  `source`         = 'lefagot.com officiel',
  `website`        = 'https://lefagot.com',
  `city`           = 'Abidjan, Riviéra Palmeraie — après la cité universitaire de la Riviéra 2',
  `description`    = 'Fabrique artisanale de cigares à Abidjan, dans le quartier de la Riviéra Palmeraie. Les cigares sont roulés à la main à partir de feuilles sélectionnées, sans additif. La gamme compte le Robusto, l''Aboussouan — décliné en Le Poro, Tiébissou et Djékanou — et l''assortiment Fagorillos, vendus à l''unité ou en fagots.',
  `description_en` = 'An artisanal cigar workshop in the Riviéra Palmeraie district of Abidjan. The cigars are hand-rolled from selected leaves, with no additives. The range comprises the Robusto, the Aboussouan — in its Le Poro, Tiébissou and Djékanou versions — and the Fagorillos assortment, sold singly or in bundles.',
  `description_es` = 'Taller artesanal de puros en el barrio de Riviéra Palmeraie de Abiyán. Los puros se lían a mano con hojas seleccionadas, sin aditivos. La gama incluye el Robusto, el Aboussouan —en sus versiones Le Poro, Tiébissou y Djékanou— y el surtido Fagorillos, a la venta por unidades o en haces.',
  `description_de` = 'Manufaktur für handgerollte Zigarren im Viertel Riviéra Palmeraie von Abidjan. Die Zigarren werden aus ausgewählten Blättern von Hand gerollt, ohne Zusätze. Zum Sortiment gehören der Robusto, der Aboussouan — in den Ausführungen Le Poro, Tiébissou und Djékanou — sowie das Fagorillos-Sortiment, einzeln oder im Bund erhältlich.',
  `description_zh` = '位于阿比让里维埃拉·帕尔梅雷区的手工雪茄作坊。雪茄以精选烟叶手工卷制，不添加任何辅料。产品包括 Robusto、Aboussouan（分 Le Poro、Tiébissou、Djékanou 三款）以及 Fagorillos 组合装，可单支或成捆购买。',
  `description_ar` = 'ورشة حرفية لصناعة السيجار في حي ريفييرا بالميري بمدينة أبيدجان. تُلفّ السيجار يدويًا من أوراق منتقاة، دون أي إضافات. تضمّ التشكيلة روبوستو، وأبوسوان بإصداراته لو بورو وتييبيسو وجيكانو، ومجموعة فاغوريّوس، وتُباع بالقطعة أو في حزم.',
  `updated_at`     = NOW()
 WHERE `id` = 11 AND `country_id` = 'ivorycoast';

-- ── La légende de la carte, coupée en plein mot ──────────
-- « Fagot Cigare — Abidjan (et Tiassalé » : la légende reprenait le
-- champ `city`, parenthèse ouverte comprise, et s'arrêtait au milieu.
-- Elle suit maintenant la ville seule.
UPDATE `lounge_photos` SET `caption` = 'Fagot Cigare — Abidjan'
 WHERE `lounge_id` = 11 AND `filename` = 'placeholder_11.jpg';

-- ── Le sceau, recalculé depuis la colonne ────────────────
UPDATE `translation_status` t
  JOIN `lounges` l ON l.`id` = t.`entite_id`
   SET t.`source_hash` = SHA1(l.`description`), t.`statut` = 'machine', t.`maj` = NOW()
 WHERE t.`entite` = 'lounges' AND t.`champ` = 'description' AND t.`entite_id` = '11';

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 163','systeme','source_posee','lounge',11,
   'derniere des 408 : #11 Fagot Cigare etait la seule fiche publiee sans aucune source. lefagot.com, site officiel, fourni par l utilisateur qui est a Abidjan. Le telephone que la fiche portait deja s en trouve recoupe : le lien tel: du menu donne le meme +225 07 04 05 70 70'),
  (NULL,'migration 163','systeme','affirmations_retirees','lounge',11,
   '« Seule fabrique artisanale de cigares ivoiriens » — le site ne revendique nulle part d etre la seule. « Cigares sur mesure, live cigar show » — ni l un ni l autre n y figurent. Affirmations de l import du 18 mars, pas des faits du fabricant'),
  (NULL,'migration 163','systeme','traductions_refaites','lounge',11,
   'les cinq colonnes traduites etaient des substitutions mot a mot : « Only factory artisanal de cigares ivoiriens », « Einzige Fabrik artisanale de cigares ivoiriens ». La fiche a ECHAPPE aux sondes des migrations 157-160 et au cliquet de la campagne : tous cherchent des mots-outils francais, et ce residu n en porte aucun. Trouvee en lisant la ligne, pas par un outil'),
  (NULL,'migration 163','systeme','ville_corrigee','lounge',11,
   '`city` listait « Abidjan (et Tiassale, Djekanou, Tiebissou) ». Djekanou et Tiebissou sont des NOMS DE CIGARES de la gamme Aboussouan, pas des adresses ; Tiassale n apparait nulle part sur le site. Le champ redevient une ville et une adresse'),
  (NULL,'migration 163','systeme','a_documenter','lounge',11,
   'le site decrit un FABRICANT, avec trois lignes nommees et un terroir revendique. La Cote d Ivoire est dans lounge_countries, pas dans producer_countries. Ouvrir un pays producteur demande rang, region, recoltes, climat, sols et six langues : note a la feuille de route, pas decide en passant');
