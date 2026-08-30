-- ══════════════════════════════════════════════════════════
-- 129 — Deux fiches lues, une affirmation inventée et un terme flottant
-- ──────────────────────────────────────────────────────────
-- Relecture demandée des fiches Atabey et Zino Platinum, signalées par
-- la mesure de cohérence terminologique de la migration 128.
--
-- ── D'ABORD, DEUX FAUX POSITIFS DE MA PROPRE MESURE ───────
--
-- Ces deux fiches employaient `外衣` là où le reste du corpus dit
-- `茄衣` pour la cape. La lecture montre que ce n'est pas la cape :
--
--   Atabey        « 不再为别人的雪茄做外衣 »
--                 ← « non plus HABILLER les cigares des autres »
--   Zino Platinum « 披着…洪都拉斯外衣 »
--                 ← « dans un VÊTEMENT hondurien »
--
-- Les deux traduisent une métaphore, pas une feuille. Ils restent.
-- Une statistique de vocabulaire dit où regarder, jamais quoi corriger.
--
-- ── CE QUE LA LECTURE A TROUVÉ : UNE AFFIRMATION INVENTÉE ─
--
-- La fiche Atabey, sur le Cohiba Behike :
--
--   fr  « le cigare dont le prix a marqué une RUPTURE pour l'industrie
--         cubaine »
--   en  « the cigar whose price marked a break for the Cuban industry »
--   es  « el cigarro MÁS CARO JAMÁS LANZADO por la industria cubana »
--   de  « der TEUERSTEN Zigarre, die die kubanische Industrie JE
--         herausbrachte »
--   zh  « 古巴烟草业推出过的最昂贵的雪茄 »
--   ar  « أغلى سيجار أطلقته الصناعة الكوبية يوماً »
--
-- Quatre langues sur six affirment un SUPERLATIF ABSOLU que ni le
-- français ni l'anglais ne portent. « Marquer une rupture » est un
-- constat ; « le plus cher jamais lancé » est un classement, et il
-- demanderait une source que personne n'a.
--
-- POURQUOI AUCUN CONTRÔLE NE LE VOYAIT : le détecteur de rangs cherche
-- « du monde », « der Welt », « في العالم », 世界/全球. Ici la borne est
-- l'INDUSTRIE CUBAINE — un ensemble nommé, donc réputé sûr. C'est
-- exactement la forme que les migrations 126 et 128 tenaient pour
-- inoffensive : « le plus puissant des grands cubains », « la plus
-- grande manufacture de République dominicaine ».
--
-- La borne rend le rang vérifiable en principe, pas vrai en fait. Un
-- superlatif national introduit PAR la traduction reste une affirmation
-- que la source ne fait pas — et rien ne le détecte aujourd'hui.
--
-- ── ET UN TERME QUI FLOTTE D'UNE COLONNE À L'AUTRE ────────
--
-- `history_zh` dit 茄芯 pour la tripe depuis la migration 128.
-- `gamme_zh` disait 填充 — dans une formule constante sur dix-sept
-- fiches : « X 茄衣，配 Y 填充 ». Un lecteur qui passe de l'histoire
-- d'une marque à sa gamme change de mot pour la même feuille.
--
-- Vingt occurrences examinées une par une. Deux ne sont PAS le nom :
--
--   Cohiba  « 密实填充，在中段释放 » — un bourrage dense, adjectival.
--   Tatuaje, Warped (history_zh) « 以当代配方填充它们 » — le VERBE
--           remplir. Ces colonnes ne sont pas touchées du tout.
--
-- Le remplacement s'ancre donc sur « 配 … 填充 », la formule du nom, et
-- laisse le verbe tranquille. Ashton Cabinet écrit la même chose sans
-- « 配 » — « 多米尼加 Fuente 填充在雪松中陈放两年 » — et se traite à part.
-- ══════════════════════════════════════════════════════════

-- ── Atabey : rendre le constat, retirer le classement ─────
UPDATE `brands` SET
  `history_es` = REPLACE(`history_es`,
     'el cigarro más caro jamás lanzado por la industria cubana',
     'el cigarro cuyo precio marcó una ruptura para la industria cubana'),
  `history_de` = REPLACE(`history_de`,
     'der teuersten Zigarre, die die kubanische Industrie je herausbrachte',
     'jener Zigarre, deren Preis für die kubanische Industrie einen Bruch bedeutete'),
  `history_zh` = REPLACE(`history_zh`,
     '那是古巴烟草业推出过的最昂贵的雪茄',
     '那支雪茄的价格，为古巴烟草业划下了一道断裂'),
  `history_ar` = REPLACE(`history_ar`,
     'أغلى سيجار أطلقته الصناعة الكوبية يوماً',
     'السيجار الذي شكّل سعره قطيعة في الصناعة الكوبية')
WHERE `name` = 'Atabey';

-- ── La tripe, un seul mot dans les deux colonnes ──────────
UPDATE `brands`
   SET `gamme_zh` = REGEXP_REPLACE(`gamme_zh`, '(配[^，。；]{0,30}?)填充', '$1茄芯')
 WHERE `gamme_zh` LIKE '%填充%';

-- La même chose, sans le « 配 » qui sert de repère.
UPDATE `brands`
   SET `gamme_zh` = REPLACE(`gamme_zh`, 'Fuente 填充在雪松中', 'Fuente 茄芯在雪松中')
 WHERE `name` = 'Ashton Cabinet';
