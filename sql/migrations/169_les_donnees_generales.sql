-- ════════════════════════════════════════════════════════
-- 169 — Les données générales, servies dans six langues
-- ────────────────────────────────────────────────────────
-- `producer_geo` PORTE HUIT CHAMPS PAR PAYS — capitale, population,
-- superficie, monnaie, langue, fuseau, PIB, indépendance — et n'était
-- rendue par AUCUNE page serveur. Dix-sept pays, cent trente-six
-- valeurs, réservées à l'application JavaScript. C'est le même défaut
-- que les cinq contenus ouverts précédemment, sur une table qui m'avait
-- échappé au recensement.
--
-- ── POURQUOI UNE MIGRATION AVANT DU CODE ─────────────────
-- La table n'avait AUCUNE COLONNE TRADUITE, et c'était sans conséquence
-- tant que seule l'application la lisait : celle-ci reconstruit la
-- monnaie et la langue à l'exécution, depuis des CODES (data.pays.js) et
-- Intl. Une page serveur ne peut pas faire cela — ou alors en pariant
-- sur `ext-intl`, dont rien ne garantit la présence chez l'hébergeur.
--
-- Rendre les colonnes telles quelles aurait injecté « Espagnol »,
-- « Peso cubain » et « soulèvement dès 1868 » dans les pages allemandes,
-- chinoises et arabes — exactement le défaut que le cliquet du chantier
-- des sources interdit sur les établissements.
--
-- ── CE QUI SE TRADUIT, ET CE QUI NE SE TRADUIT PAS ───────
-- TRADUIT (28 valeurs distinctes seulement, d'où le peu de lignes) :
--   `currency`     15 valeurs — le CODE ISO entre parenthèses ne bouge
--                  pas, seul le nom change : « Peso cubain (CUP) »
--                  devient « Kubanischer Peso (CUP) ».
--   `language`      8 valeurs.
--   `independent`   5 valeurs sur 14 — les autres sont des ANNÉES NUES
--                  (« 1821 », « 1960 ») qui ne se traduisent pas. La
--                  colonne traduite reste vide et page_col() retombe sur
--                  le français, qui donne le même chiffre.
--
-- NON TRADUIT, ET ASSUMÉ :
--   `capital`      des noms propres. « La Havane » est l'exonyme
--                  français de Havana, et l'atlas sert déjà les noms de
--                  pays sans les traduire — « Côte d'Ivoire » s'affiche
--                  tel quel en allemand depuis toujours.
--   `population`, `area`, `gdp`, `timezone`  des nombres et des unités.
--                  La notation reste française (« 87,1 Md$ », virgule
--                  décimale), et c'est DÉJÀ le cas de `revenue`, servi
--                  sur chaque fiche de pays dans les six langues depuis
--                  des mois. Changer ici seulement créerait deux
--                  conventions dans une même page.
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

ALTER TABLE `producer_geo`
  ADD COLUMN `currency_en` VARCHAR(100) NULL, ADD COLUMN `currency_es` VARCHAR(100) NULL,
  ADD COLUMN `currency_de` VARCHAR(100) NULL, ADD COLUMN `currency_zh` VARCHAR(100) NULL,
  ADD COLUMN `currency_ar` VARCHAR(100) NULL,
  ADD COLUMN `language_en` VARCHAR(100) NULL, ADD COLUMN `language_es` VARCHAR(100) NULL,
  ADD COLUMN `language_de` VARCHAR(100) NULL, ADD COLUMN `language_zh` VARCHAR(100) NULL,
  ADD COLUMN `language_ar` VARCHAR(100) NULL,
  ADD COLUMN `independent_en` VARCHAR(50) NULL, ADD COLUMN `independent_es` VARCHAR(50) NULL,
  ADD COLUMN `independent_de` VARCHAR(50) NULL, ADD COLUMN `independent_zh` VARCHAR(50) NULL,
  ADD COLUMN `independent_ar` VARCHAR(50) NULL;

-- ── currency ──
UPDATE `producer_geo` SET `currency_en` = 'Euro (EUR)',
       `currency_es` = 'Euro (EUR)',
       `currency_de` = 'Euro (EUR)',
       `currency_zh` = '欧元（EUR）',
       `currency_ar` = 'يورو (EUR)'
 WHERE `currency` = 'Euro (EUR)';
UPDATE `producer_geo` SET `currency_en` = 'US dollar (USD)',
       `currency_es` = 'Dólar estadounidense (USD)',
       `currency_de` = 'US-Dollar (USD)',
       `currency_zh` = '美元（USD）',
       `currency_ar` = 'الدولار الأمريكي (USD)'
 WHERE `currency` = 'Dollar US (USD)';
UPDATE `producer_geo` SET `currency_en` = 'Brazilian real (BRL)',
       `currency_es` = 'Real brasileño (BRL)',
       `currency_de` = 'Brasilianischer Real (BRL)',
       `currency_zh` = '巴西雷亚尔（BRL）',
       `currency_ar` = 'الريال البرازيلي (BRL)'
 WHERE `currency` = 'Réal brésilien (BRL)';
UPDATE `producer_geo` SET `currency_en` = 'CFA franc (XAF)',
       `currency_es` = 'Franco CFA (XAF)',
       `currency_de` = 'CFA-Franc (XAF)',
       `currency_zh` = '中非法郎（XAF）',
       `currency_ar` = 'الفرنك الأفريقي (XAF)'
 WHERE `currency` = 'Franc CFA (XAF)';
UPDATE `producer_geo` SET `currency_en` = 'Colón (CRC)',
       `currency_es` = 'Colón (CRC)',
       `currency_de` = 'Colón (CRC)',
       `currency_zh` = '科朗（CRC）',
       `currency_ar` = 'الكولون (CRC)'
 WHERE `currency` = 'Colón (CRC)';
UPDATE `producer_geo` SET `currency_en` = 'Cuban peso (CUP)',
       `currency_es` = 'Peso cubano (CUP)',
       `currency_de` = 'Kubanischer Peso (CUP)',
       `currency_zh` = '古巴比索（CUP）',
       `currency_ar` = 'البيزو الكوبي (CUP)'
 WHERE `currency` = 'Peso cubain (CUP)';
UPDATE `producer_geo` SET `currency_en` = 'Dominican peso (DOP)',
       `currency_es` = 'Peso dominicano (DOP)',
       `currency_de` = 'Dominikanischer Peso (DOP)',
       `currency_zh` = '多米尼加比索（DOP）',
       `currency_ar` = 'البيزو الدومينيكي (DOP)'
 WHERE `currency` = 'Peso dominicain (DOP)';
UPDATE `producer_geo` SET `currency_en` = 'Lempira (HNL)',
       `currency_es` = 'Lempira (HNL)',
       `currency_de` = 'Lempira (HNL)',
       `currency_zh` = '伦皮拉（HNL）',
       `currency_ar` = 'الليمبيرا (HNL)'
 WHERE `currency` = 'Lempira (HNL)';
UPDATE `producer_geo` SET `currency_en` = 'Rupiah (IDR)',
       `currency_es` = 'Rupia (IDR)',
       `currency_de` = 'Rupiah (IDR)',
       `currency_zh` = '印尼盾（IDR）',
       `currency_ar` = 'الروبية (IDR)'
 WHERE `currency` = 'Roupie (IDR)';
UPDATE `producer_geo` SET `currency_en` = 'CFA franc (XOF)',
       `currency_es` = 'Franco CFA (XOF)',
       `currency_de` = 'CFA-Franc (XOF)',
       `currency_zh` = '西非法郎（XOF）',
       `currency_ar` = 'الفرنك الأفريقي (XOF)'
 WHERE `currency` = 'Franc CFA (XOF)';
UPDATE `producer_geo` SET `currency_en` = 'Jamaican dollar (JMD)',
       `currency_es` = 'Dólar jamaicano (JMD)',
       `currency_de` = 'Jamaika-Dollar (JMD)',
       `currency_zh` = '牙买加元（JMD）',
       `currency_ar` = 'الدولار الجامايكي (JMD)'
 WHERE `currency` = 'Dollar jamaïcain (JMD)';
UPDATE `producer_geo` SET `currency_en` = 'Mexican peso (MXN)',
       `currency_es` = 'Peso mexicano (MXN)',
       `currency_de` = 'Mexikanischer Peso (MXN)',
       `currency_zh` = '墨西哥比索（MXN）',
       `currency_ar` = 'البيزو المكسيكي (MXN)'
 WHERE `currency` = 'Peso mexicain (MXN)';
UPDATE `producer_geo` SET `currency_en` = 'Córdoba (NIO)',
       `currency_es` = 'Córdoba (NIO)',
       `currency_de` = 'Córdoba (NIO)',
       `currency_zh` = '科多巴（NIO）',
       `currency_ar` = 'الكوردوبا (NIO)'
 WHERE `currency` = 'Córdoba (NIO)';
UPDATE `producer_geo` SET `currency_en` = 'Balboa (PAB) / US dollar (USD)',
       `currency_es` = 'Balboa (PAB) / Dólar estadounidense (USD)',
       `currency_de` = 'Balboa (PAB) / US-Dollar (USD)',
       `currency_zh` = '巴波亚（PAB）/ 美元（USD）',
       `currency_ar` = 'البالبوا (PAB) / الدولار الأمريكي (USD)'
 WHERE `currency` = 'Balboa (PAB) / Dollar US (USD)';
UPDATE `producer_geo` SET `currency_en` = 'Philippine peso (PHP)',
       `currency_es` = 'Peso filipino (PHP)',
       `currency_de` = 'Philippinischer Peso (PHP)',
       `currency_zh` = '菲律宾比索（PHP）',
       `currency_ar` = 'البيزو الفلبيني (PHP)'
 WHERE `currency` = 'Peso philippin (PHP)';

-- ── language ──
UPDATE `producer_geo` SET `language_en` = 'Spanish',
       `language_es` = 'Español',
       `language_de` = 'Spanisch',
       `language_zh` = '西班牙语',
       `language_ar` = 'الإسبانية'
 WHERE `language` = 'Espagnol';
UPDATE `producer_geo` SET `language_en` = 'English',
       `language_es` = 'Inglés',
       `language_de` = 'Englisch',
       `language_zh` = '英语',
       `language_ar` = 'الإنجليزية'
 WHERE `language` = 'Anglais';
UPDATE `producer_geo` SET `language_en` = 'Portuguese',
       `language_es` = 'Portugués',
       `language_de` = 'Portugiesisch',
       `language_zh` = '葡萄牙语',
       `language_ar` = 'البرتغالية'
 WHERE `language` = 'Portugais';
UPDATE `producer_geo` SET `language_en` = 'French / English',
       `language_es` = 'Francés / Inglés',
       `language_de` = 'Französisch / Englisch',
       `language_zh` = '法语 / 英语',
       `language_ar` = 'الفرنسية / الإنجليزية'
 WHERE `language` = 'Français / Anglais';
UPDATE `producer_geo` SET `language_en` = 'Indonesian',
       `language_es` = 'Indonesio',
       `language_de` = 'Indonesisch',
       `language_zh` = '印尼语',
       `language_ar` = 'الإندونيسية'
 WHERE `language` = 'Indonésien';
UPDATE `producer_geo` SET `language_en` = 'Italian',
       `language_es` = 'Italiano',
       `language_de` = 'Italienisch',
       `language_zh` = '意大利语',
       `language_ar` = 'الإيطالية'
 WHERE `language` = 'Italien';
UPDATE `producer_geo` SET `language_en` = 'French',
       `language_es` = 'Francés',
       `language_de` = 'Französisch',
       `language_zh` = '法语',
       `language_ar` = 'الفرنسية'
 WHERE `language` = 'Français';
UPDATE `producer_geo` SET `language_en` = 'Filipino / English',
       `language_es` = 'Filipino / Inglés',
       `language_de` = 'Filipino / Englisch',
       `language_zh` = '菲律宾语 / 英语',
       `language_ar` = 'الفلبينية / الإنجليزية'
 WHERE `language` = 'Filipino/Anglais';

-- ── independent ──
UPDATE `producer_geo` SET `independent_en` = 'Autonomous community of Spain',
       `independent_es` = 'Comunidad autónoma de España',
       `independent_de` = 'Autonome Gemeinschaft Spaniens',
       `independent_zh` = '西班牙自治区',
       `independent_ar` = 'منطقة حكم ذاتي تابعة لإسبانيا'
 WHERE `independent` = 'Communauté autonome d''Espagne';
UPDATE `producer_geo` SET `independent_en` = '1902 (uprising from 1868)',
       `independent_es` = '1902 (levantamiento desde 1868)',
       `independent_de` = '1902 (Aufstand ab 1868)',
       `independent_zh` = '1902 年（1868 年起义）',
       `independent_ar` = '1902 (انتفاضة منذ 1868)'
 WHERE `independent` = '1902 (soulèvement dès 1868)';
UPDATE `producer_geo` SET `independent_en` = '1830 (first call in 1809)',
       `independent_es` = '1830 (primer grito en 1809)',
       `independent_de` = '1830 (erster Ruf 1809)',
       `independent_zh` = '1830 年（1809 年首次呼声）',
       `independent_ar` = '1830 (أول نداء عام 1809)'
 WHERE `independent` = '1830 (premier cri en 1809)';
UPDATE `producer_geo` SET `independent_en` = '1821 (Cry of Dolores in 1810)',
       `independent_es` = '1821 (Grito de Dolores en 1810)',
       `independent_de` = '1821 (Ruf von Dolores 1810)',
       `independent_zh` = '1821 年（1810 年多洛雷斯呼声）',
       `independent_ar` = '1821 (نداء دولوريس عام 1810)'
 WHERE `independent` = '1821 (cri de Dolores en 1810)';
UPDATE `producer_geo` SET `independent_en` = '1946 (from Spain in 1898)',
       `independent_es` = '1946 (de España en 1898)',
       `independent_de` = '1946 (von Spanien 1898)',
       `independent_zh` = '1946 年（1898 年脱离西班牙）',
       `independent_ar` = '1946 (عن إسبانيا عام 1898)'
 WHERE `independent` = '1946 (de l''Espagne en 1898)';

-- ── Les sceaux, calculés depuis les colonnes ─────────────
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'producer_geo', g.`country_id`, c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'currency' THEN g.`currency`
                         WHEN 'language' THEN g.`language`
                         ELSE g.`independent` END),
       'machine', NOW()
  FROM `producer_geo` g
  JOIN (SELECT 'currency' champ UNION ALL SELECT 'language' UNION ALL SELECT 'independent') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE COALESCE(CASE c.champ WHEN 'currency' THEN g.`currency`
                             WHEN 'language' THEN g.`language`
                             ELSE g.`independent` END, '') <> ''
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 169','systeme','table_ouverte','pays',0,
   'producer_geo porte huit champs par pays — capitale, population, superficie, monnaie, langue, fuseau, PIB, independance — et n etait rendue par AUCUNE page serveur : 17 pays, 136 valeurs reservees a l application JavaScript. Meme defaut que les cinq contenus ouverts precedemment, sur une table qui avait echappe au recensement'),
  (NULL,'migration 169','systeme','colonnes_traduites_ajoutees','pays',0,
   'la table n avait aucune colonne traduite, sans consequence tant que seule l application la lisait : celle-ci reconstruit monnaie et langue a l execution depuis des CODES (data.pays.js) et Intl. Une page serveur ne le peut pas — ou alors en pariant sur ext-intl, dont rien ne garantit la presence chez l hebergeur. Les rendre telles quelles aurait injecte « Espagnol » et « Peso cubain » dans les pages allemandes, chinoises et arabes'),
  (NULL,'migration 169','systeme','non_traduit_assume','pays',0,
   'capital reste en noms propres — « La Havane » est l exonyme francais, et l atlas sert deja « Cote d Ivoire » tel quel en allemand. population, area, gdp et timezone restent en notation francaise (« 87,1 Md$ », virgule decimale) : c est DEJA le cas de revenue, servi sur chaque fiche de pays dans les six langues depuis des mois. Changer ici seulement creerait deux conventions dans une meme page'),
  (NULL,'migration 169','systeme','peu_de_valeurs','pays',0,
   '28 valeurs distinctes seulement pour 17 pays : 15 monnaies, 8 langues, et 5 dates d independance sur 14 — les neuf autres sont des ANNEES NUES qui ne se traduisent pas, la colonne traduite reste vide et page_col() retombe sur le francais, qui donne le meme chiffre');
