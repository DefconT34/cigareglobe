-- ════════════════════════════════════════════════════════
-- 238 — Les noms que les fiches citent : une colonne, et la
--       recherche qui la lit
-- ────────────────────────────────────────────────────────
-- LE TROU. La recherche du site lit, pour chaque maison, son nom, les
-- noms de sa gamme et les cent premiers caractères de son histoire
-- (action `recherche` de backend/data.php, assets/js/search.js). Tout
-- ce que l'histoire écrit plus loin est hors de portée. Or l'atlas a
-- choisi, pour certains noms, de les écrire EN PROSE et non en gamme :
-- une commande de détaillant n'est pas le catalogue de la maison qui
-- la roule (Black Swan, 194). Mesuré le 24 septembre : « Black Swan »,
-- « Oliveros », « King Havano », « Zechbauer » — écrits dans cinq
-- fiches — ne rendaient AUCUN résultat.
--
-- Le huitième recensement en ajoute une vingtaine : des marques de
-- détaillants et d'importateurs roulées par une maison de l'atlas
-- (Maria Mancini chez Plasencia…). Les écrire sans qu'on puisse les
-- trouver, c'était faire le rattachement en base et le défaire à
-- l'écran — la faute que search.js décrit déjà pour les gammes.
--
-- ── LA DÉCISION (utilisateur, 24 septembre) ─────────────
-- Les rendre trouvables, sans les ranger en gamme. D'où `mentions` :
-- un tableau JSON de NOMS, rien d'autre — l'histoire dit qui, quand et
-- pour qui ; la colonne ne sert qu'à retrouver la fiche. Le serveur la
-- sert sous la clé `m` de l'index (omise quand elle est vide), et
-- search.js l'indexe comme une ligne : taper « Black Swan » rend Oliva,
-- avec le nom trouvé affiché devant. L'affichage de la fiche ne change
-- pas.
--
-- ── CE QUI EST REMPLI ───────────────────────────────────
-- Les six fiches dont l'histoire écrit aujourd'hui un nom que ni leur
-- nom ni leur gamme ne portent : Black Swan chez ses quatre fabriques
-- (Oliva, Rocky Patel, E.P. Carrillo, Joya de Nicaragua) ; Oliveros et
-- King Havano chez Swag, dont l'histoire dit qu'ils sont des étiquettes
-- de Boutique Blends ; Zechbauer chez Vegas de Santiago, dont l'atelier
-- roule les bagues de la maison munichoise. Sindicato et Powstanie
-- citent aussi Black Swan, mais pour s'en distinguer : ils n'en sont
-- pas les fabricants, la colonne ne les nomme pas.
--
-- Le code accompagne la base : backend/data.php (index servi, fiche,
-- `all`), assets/js/search.js (les deux chemins de l'index),
-- sql/schema.sql, et quatre contrôles dans tests/run.php.
-- ════════════════════════════════════════════════════════

ALTER TABLE `brands`
  ADD COLUMN `mentions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
             COMMENT 'Noms que l''histoire cite sans qu''ils soient des lignes de la gamme (commande de tiers, marque roulée pour un détaillant, autre nom) : lus par la recherche. Depuis la 238.'
             AFTER `source`,
  ADD CONSTRAINT `brands_chk_mentions` CHECK (json_valid(`mentions`));

UPDATE `brands` SET `mentions` = CASE `name`
  WHEN 'Oliva' THEN '["Black Swan"]'
  WHEN 'Rocky Patel' THEN '["Black Swan"]'
  WHEN 'E.P. Carrillo' THEN '["Black Swan"]'
  WHEN 'Joya de Nicaragua' THEN '["Black Swan"]'
  WHEN 'Swag' THEN '["Oliveros","King Havano"]'
  WHEN 'Vegas de Santiago' THEN '["Zechbauer"]'
END
 WHERE `name` IN ('Oliva', 'Rocky Patel', 'E.P. Carrillo', 'Joya de Nicaragua', 'Swag', 'Vegas de Santiago');

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 238';
INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 238','systeme','noms_cites_trouvables','marque',0,
   'brands.mentions créée, lue par la recherche ; remplie pour Oliva (Black Swan), Rocky Patel (Black Swan), E.P. Carrillo (Black Swan), Joya de Nicaragua (Black Swan), Swag (Oliveros, King Havano), Vegas de Santiago (Zechbauer)');

SELECT
  (SELECT COUNT(*) FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'brands' AND COLUMN_NAME = 'mentions') = 1 AS colonne,
  (SELECT COUNT(*) FROM `brands` WHERE `mentions` IS NOT NULL) = 6 AS remplies,
  (SELECT JSON_CONTAINS(`mentions`, '"Black Swan"') FROM `brands` WHERE `name` = 'Oliva') AS `Oliva — Black Swan`,
  (SELECT JSON_CONTAINS(`mentions`, '"Black Swan"') FROM `brands` WHERE `name` = 'Rocky Patel') AS `Rocky Patel — Black Swan`,
  (SELECT JSON_CONTAINS(`mentions`, '"Black Swan"') FROM `brands` WHERE `name` = 'E.P. Carrillo') AS `E.P. Carrillo — Black Swan`,
  (SELECT JSON_CONTAINS(`mentions`, '"Black Swan"') FROM `brands` WHERE `name` = 'Joya de Nicaragua') AS `Joya de Nicaragua — Black Swan`,
  (SELECT JSON_CONTAINS(`mentions`, '"Oliveros"') FROM `brands` WHERE `name` = 'Swag') AS `Swag — Oliveros`,
  (SELECT JSON_CONTAINS(`mentions`, '"King Havano"') FROM `brands` WHERE `name` = 'Swag') AS `Swag — King Havano`,
  (SELECT JSON_CONTAINS(`mentions`, '"Zechbauer"') FROM `brands` WHERE `name` = 'Vegas de Santiago') AS `Vegas de Santiago — Zechbauer`,
  (SELECT SUM(CHAR_LENGTH(`detail`) >= 255) = 0 FROM `moderation_log` WHERE `acteur_nom` = 'migration 238') AS journal_non_tronque;
