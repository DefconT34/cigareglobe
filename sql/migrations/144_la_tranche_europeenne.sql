-- ════════════════════════════════════════════════════════
-- 144 — Les douze fiches européennes dont la source n'existait pas
-- ────────────────────────────────────────────────────────
-- LA MÉTHODE, ET POURQUOI ELLE CHANGE ICI. La migration 142 a relabellé
-- vingt-huit fiches dont le domaine cité ne résout nulle part. Elle
-- disait ce qu'on ne savait pas ; elle ne cherchait pas ce qu'on aurait
-- pu savoir. Bertie (migration 143) a montré ce que ça coûtait : une
-- fiche signalée depuis la veille portait l'adresse d'un autre
-- établissement, et il a fallu qu'un lecteur le dise.
--
-- On reprend donc les vingt-sept restantes, une par une, à la source
-- primaire. Voici les douze européennes. Chacune a reçu au moins deux
-- vérifications indépendantes, et l'absence de résultat n'a jamais
-- suffi seule : pour le Royaume-Uni, le registre des détaillants de
-- Hunters & Frankau — le distributeur Habanos britannique — a servi de
-- second témoin.
--
-- QUATRE VERDICTS, ET ILS NE SE TRAITENT PAS PAREIL.
--
-- ── 1. L'ÉTABLISSEMENT EXISTE, LA FICHE SE TROMPE ────────
-- #232 « Le Bar Long — Hôtel Le Royal Monceau ». L'hôtel est réel, au
-- 37 avenue Hoche, et le Bar Long aussi — mais c'est le BAR de l'hôtel,
-- signé Starck. Le salon cigares du Royal Monceau est le VIÑALES
-- LOUNGE, ouvert en 2018, avec sa propre page chez Raffles. La fiche
-- désignait la mauvaise salle du bon hôtel.
--
-- #277 « Sautter of Mayfair ». Réel, et à la bonne adresse depuis plus
-- de trente ans. Deux détails faux : le code postal est W1K 2TW et non
-- W1K 2TL, et la maison tient une SECONDE adresse à Knightsbridge que
-- l'atlas ignore. Le téléphone, lui, était juste.
--
-- ── 2. UN NOM RÉEL POSÉ SUR LE MAUVAIS PAYS ──────────────
-- #255 « Club 33 Cigars — Marbella ». Le Cigar Lounge 33 existe, il est
-- référencé sur habanos.com — à RHODE-SAINT-GENÈSE, en Belgique, sur la
-- route de Bruxelles à Waterloo. Il n'y en a pas à Puerto Banús. Même
-- forme qu'Olivos (142) et que Bertie (143) : un nom véritable déplacé
-- de mille cinq cents kilomètres.
--
-- ── 3. LE LIEU EXISTE, LA SALLE DE CIGARES NON ───────────
-- #1266 « Real Club de Golf de Pedreña — Cigar Room ». Le club est
-- réel, fondé en 1928, c'est celui de Seve Ballesteros, et son
-- téléphone est juste. Mais la fiche ne parle pas du club : elle parle
-- d'une salle de cigares, et rien nulle part ne l'atteste. Une fiche
-- dont le SUJET n'est pas attesté n'a pas de sujet.
--
-- ── 4. RIEN, NULLE PART ──────────────────────────────────
-- Huit fiches ne correspondent à aucun établissement retrouvable, et
-- les vraies enseignes de la même rue portent d'autres noms :
--
--   #235 La Cave du Cigare, Cannes, 20 rue d'Antibes
--        → la civette de la rue d'Antibes est La Civette Carlton, au 93
--   #236 Cigare Attitude, Nice, rue de la Liberté
--        → les caves niçoises sont Civette Lépante, Flamme et Fumée
--   #248 El Fumador Experto, Madrid, calle Hortaleza 8
--   #284 Mitchell's of Glasgow, 11 Hanover Street
--        → absent du registre Hunters & Frankau ; Glasgow a Robert
--          Graham 1874 et Turmeaus, 111 West George Street
--   #285 Levin's Tobacconist, Manchester, 3 St Ann Street
--        → absent du même registre ; le buraliste de St Ann's Square
--          est Aston's of Manchester, au 12, depuis 1978
--   #331 Cigar Club Torino, via Roma 295
--        → Turin a Casa del Sigaro (via Mazzini 52), Puromotivo,
--          Giachino, et une tabaccheria via Roma 368 — pas celle-ci
--   #1279 Hamburg Yacht Club — Hafenterrasse
--        → Hambourg a le Norddeutscher Regatta Verein et le Hamburger
--          Segel-Club ; aucun « Hamburger Yacht Club »
--   #1370 Porto Cervo Marina — La Piazzetta Cigars
--        → la Piazzetta est la place du village ; l'institution du port
--          est le Yacht Club Costa Smeralda
--
-- ── POURQUOI ON DÉPUBLIE AU LIEU D'EFFACER ───────────────
-- `is_verified = 0` et non un DELETE, dix fois. L'absence de preuve
-- n'est pas la preuve de l'absence : un commerce discret peut exister
-- sans laisser de trace en ligne, et effacer fermerait la porte. La
-- dépublication, elle, se défait d'un UPDATE le jour où quelqu'un
-- apporte une adresse.
--
-- Ce qu'on refuse, c'est de PUBLIER. Une fiche affirme à son lecteur
-- qu'un commerce existe à une adresse. Sans un seul élément qui
-- l'atteste, et avec pour toute source un domaine inventé, cette
-- affirmation n'a rien derrière elle.
--
-- ── LES TRADUCTIONS ──────────────────────────────────────
-- Les deux fiches CORRIGÉES changent de description : leurs cinq
-- traductions sont réécrites et rescellées avec elles, le sceau
-- recalculé depuis la colonne (leçon de la 140). Les dix dépubliées
-- gardent les leurs telles quelles — elles ne sont plus servies, et
-- réécrire un texte qu'on retire serait du travail sur du vide.
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/sources.php --figer
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

-- ── 1a. Le Royal Monceau : la bonne salle ────────────────
UPDATE `lounges` SET
  `name`    = 'Viñales Lounge — Le Royal Monceau',
  `city`    = 'Paris 8e — 37 avenue Hoche, 75008',
  `website` = 'https://www.raffles.com/paris/dining/vinales-lounge/',
  `source`  = 'raffles.com',

  `description`    = 'Salon cigares du Royal Monceau, ouvert en 2018. Fauteuils club en cuir, ouvrages d''art et terrasse donnant sur une cour privée de l''hôtel. Accès à la journée, payant, pour les clients de l''hôtel comme pour les visiteurs.',

  `description_en` = 'Cigar lounge of Le Royal Monceau, opened in 2018. Leather club armchairs, art books and a terrace opening onto one of the hotel''s private courtyards. Paid day access, for hotel guests and outside visitors alike.',

  `description_es` = 'Salón de puros de Le Royal Monceau, abierto en 2018. Sillones club de cuero, libros de arte y una terraza que da a uno de los patios privados del hotel. Acceso de día, de pago, tanto para huéspedes como para visitantes externos.',

  `description_de` = 'Zigarrenlounge des Royal Monceau, eröffnet 2018. Lederne Clubsessel, Kunstbände und eine Terrasse zu einem der privaten Innenhöfe des Hauses. Kostenpflichtiger Tageszugang, für Hotelgäste wie für externe Besucher.',

  `description_zh` = '皇家蒙梭酒店的雪茄吧，2018 年开设。皮质俱乐部扶手椅、艺术书籍，以及一处朝向酒店私人庭院的露台。提供日间付费入场，酒店住客与外来访客均可。',

  `description_ar` = 'صالة السيجار في فندق لو رويال مونسو، افتُتحت عام 2018. مقاعد نادٍ جلدية، وكتب فنية، وشرفة تطلّ على أحد الأفنية الخاصة بالفندق. دخول يومي مدفوع، لنزلاء الفندق وللزوار من الخارج على السواء.',

  `updated_at` = NOW()
 WHERE `id` = 232 AND `country_id` = 'france';

UPDATE `translation_status`
   SET `source_hash` = (SELECT SHA1(`description`) FROM `lounges` WHERE `id` = 232),
       `statut`      = 'machine', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '232' AND `champ` = 'description';

-- ── 1b. Sautter : le code postal, le site, la seconde adresse ─
UPDATE `lounges` SET
  `city`    = 'London — 106 Mount Street, Mayfair, W1K 2TW',
  `website` = 'https://www.sauttercigars.com/',
  `source`  = 'sauttercigars.com',

  `description`    = 'Maison de Mount Street fondée il y a plus de cinquante ans, installée à cette adresse depuis plus de trente. Havanes vieillis et millésimes anciens. Une seconde adresse à Knightsbridge, 8 Raphael Street.',

  `description_en` = 'Mount Street house founded over fifty years ago, at this address for more than thirty. Aged Havanas and old vintages. A second address in Knightsbridge, 8 Raphael Street.',

  `description_es` = 'Casa de Mount Street fundada hace más de cincuenta años, en esta dirección desde hace más de treinta. Habanos envejecidos y añadas antiguas. Una segunda dirección en Knightsbridge, 8 Raphael Street.',

  `description_de` = 'Haus in der Mount Street, vor über fünfzig Jahren gegründet, seit mehr als dreißig Jahren an dieser Adresse. Gereifte Havannas und alte Jahrgänge. Eine zweite Adresse in Knightsbridge, 8 Raphael Street.',

  `description_zh` = '芒特街的老字号，创立逾五十年，在此地址经营超过三十年。以陈年哈瓦那雪茄与旧年份存货见长。另于骑士桥 8 Raphael Street 设有第二家门店。',

  `description_ar` = 'دار في شارع ماونت تأسست قبل أكثر من خمسين عامًا، وفي هذا العنوان منذ أكثر من ثلاثين. سيجار هافانا معتّق وسنوات إنتاج قديمة. ولها عنوان ثانٍ في نايتسبريدج، 8 Raphael Street.',

  `updated_at` = NOW()
 WHERE `id` = 277 AND `country_id` = 'uk';

UPDATE `translation_status`
   SET `source_hash` = (SELECT SHA1(`description`) FROM `lounges` WHERE `id` = 277),
       `statut`      = 'machine', `maj` = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '277' AND `champ` = 'description';

-- ── 2. Le nom belge posé sur Puerto Banús ────────────────
UPDATE `lounges`
   SET `is_verified` = 0,
       `source`      = 'RETIRÉ — Cigar Lounge 33 est en Belgique, la fiche le place à Puerto Banús',
       `updated_at`  = NOW()
 WHERE `id` = 255 AND `country_id` = 'spain';

-- ── 3. Le club existe, sa salle de cigares n'est pas attestée ─
UPDATE `lounges`
   SET `is_verified` = 0,
       `source`      = 'RETIRÉ — le club de golf existe, sa salle de cigares n''est attestée nulle part',
       `updated_at`  = NOW()
 WHERE `id` = 1266 AND `country_id` = 'spain';

-- ── 4. Les huit que rien n'atteste ───────────────────────
UPDATE `lounges`
   SET `is_verified` = 0,
       `source`      = 'RETIRÉ — aucune trace de cet établissement, et le domaine cité n''existe pas',
       `updated_at`  = NOW()
 WHERE `id` IN (235, 236, 248, 284, 285, 331, 1279, 1370);

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 144','systeme','fiche_corrigee','lounge',232,'le salon cigares du Royal Monceau est le Vinales Lounge, pas Le Bar Long qui est le bar de l hotel ; source raffles.com'),
  (NULL,'migration 144','systeme','fiche_corrigee','lounge',277,'code postal W1K 2TW et non 2TL ; seconde adresse a Knightsbridge ; source sauttercigars.com'),
  (NULL,'migration 144','systeme','lounge_retire','lounge',255,'Cigar Lounge 33 est a Rhode-Saint-Genese en Belgique (habanos.com), la fiche le placait a Puerto Banus'),
  (NULL,'migration 144','systeme','lounge_retire','lounge',1266,'le Real Golf de Pedrena existe ; aucune source n atteste la salle de cigares dont la fiche parle'),
  (NULL,'migration 144','systeme','lounge_retire','lounge',235,'aucune trace ; la civette de la rue d Antibes a Cannes est La Civette Carlton au 93'),
  (NULL,'migration 144','systeme','lounge_retire','lounge',236,'aucune trace ; les caves nicoises attestees sont Civette Lepante et Flamme et Fumee'),
  (NULL,'migration 144','systeme','lounge_retire','lounge',248,'aucune trace calle Hortaleza a Madrid'),
  (NULL,'migration 144','systeme','lounge_retire','lounge',284,'absent du registre Hunters & Frankau ; Glasgow a Robert Graham 1874 et Turmeaus'),
  (NULL,'migration 144','systeme','lounge_retire','lounge',285,'absent du registre Hunters & Frankau ; St Ann s Square a Aston s of Manchester depuis 1978'),
  (NULL,'migration 144','systeme','lounge_retire','lounge',331,'aucune trace via Roma 295 ; Turin a Casa del Sigaro, Puromotivo, Giachino'),
  (NULL,'migration 144','systeme','lounge_retire','lounge',1279,'aucun Hamburger Yacht Club ; Hambourg a le Norddeutscher Regatta Verein et le Hamburger Segel-Club'),
  (NULL,'migration 144','systeme','lounge_retire','lounge',1370,'aucune trace ; l institution de Porto Cervo est le Yacht Club Costa Smeralda');
