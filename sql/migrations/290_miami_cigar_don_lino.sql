-- ════════════════════════════════════════════════════════
-- 290 — Miami Cigar & Co. : la série dominicaine de Don Lino
-- ────────────────────────────────────────────────────────
-- La gamme disait « Depuis 2021, la marque compte aussi une série dominicaine » ;
-- la page de la maison (octobre 2026) ne montre que Don Lino Africa. La phrase
-- reprend ce que Cigar Coop a annoncé en 2021, et dit que la maison ne la montre
-- plus. Vérification par expert-cigare, 29 octobre 2026. Les cinq traductions
-- sont réécrites à la main et remises à « machine » (le français a changé).
-- Tabacosta : rien à changer — la fiche lit Halfwheel (Costa Platinum, 2016).
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET `gamme` = REPLACE(`gamme`, 'Depuis 2021, la marque compte aussi une série dominicaine, Connecticut et Maduro : Cigar Coop écrit la fabrique non communiquée en juillet 2021, puis nomme Tabacalera El Artista en août 2021.', 'En 2021, Cigar Coop annonce une série dominicaine, Connecticut et Maduro : fabrique non communiquée en juillet 2021, puis Tabacalera El Artista nommée en août 2021 ; la page de la maison ne la montre plus en octobre 2026.'), `updated_at` = NOW() WHERE `name` = 'Miami Cigar & Co.' AND `country_id` = 'nicaragua';
UPDATE `brands` SET `gamme_en` = REPLACE(`gamme_en`, 'Since 2021 the brand has also included a Dominican series, Connecticut and Maduro: Cigar Coop writes the factory as undisclosed in July 2021, then names Tabacalera El Artista in August 2021.', 'In 2021 Cigar Coop announced a Dominican series, Connecticut and Maduro: factory undisclosed in July 2021, then Tabacalera El Artista named in August 2021; the house''s page no longer shows it in October 2026.'), `updated_at` = NOW() WHERE `name` = 'Miami Cigar & Co.' AND `country_id` = 'nicaragua';
UPDATE `brands` SET `gamme_es` = REPLACE(`gamme_es`, 'Desde 2021, la marca cuenta también con una serie dominicana, Connecticut y Maduro: Cigar Coop escribe la fábrica como no divulgada en julio de 2021, y luego nombra a Tabacalera El Artista en agosto de 2021.', 'En 2021, Cigar Coop anunció una serie dominicana, Connecticut y Maduro: fábrica no divulgada en julio de 2021, luego Tabacalera El Artista nombrada en agosto de 2021; la página de la casa ya no la muestra en octubre de 2026.'), `updated_at` = NOW() WHERE `name` = 'Miami Cigar & Co.' AND `country_id` = 'nicaragua';
UPDATE `brands` SET `gamme_de` = REPLACE(`gamme_de`, 'Seit 2021 umfasst die Marke auch eine dominikanische Serie, Connecticut und Maduro: Cigar Coop gibt die Fabrik im Juli 2021 als nicht angegeben an und nennt im August 2021 dann Tabacalera El Artista.', '2021 kündigte Cigar Coop eine dominikanische Serie an, Connecticut und Maduro: Fabrik im Juli 2021 nicht angegeben, im August 2021 dann Tabacalera El Artista genannt; die Seite des Hauses zeigt sie im Oktober 2026 nicht mehr.'), `updated_at` = NOW() WHERE `name` = 'Miami Cigar & Co.' AND `country_id` = 'nicaragua';
UPDATE `brands` SET `gamme_zh` = REPLACE(`gamme_zh`, '2021年起，该牌子还有一个多米尼加系列，Connecticut 与 Maduro：Cigar Coop 在2021年7月把工厂写作未公开，2021年8月则点名 Tabacalera El Artista。', '2021年，Cigar Coop 宣布推出多米尼加系列，Connecticut 与 Maduro：2021年7月工厂未公开，2021年8月点名 Tabacalera El Artista；2026年10月，该厂牌官网页面已不再展示该系列。'), `updated_at` = NOW() WHERE `name` = 'Miami Cigar & Co.' AND `country_id` = 'nicaragua';
UPDATE `brands` SET `gamme_ar` = REPLACE(`gamme_ar`, 'ومنذ 2021 تضمّ العلامة أيضًا سلسلة دومينيكية، Connecticut وMaduro: تكتب Cigar Coop أنّ المصنع غير معلن في تموز/يوليو 2021، ثم تسمّي Tabacalera El Artista في آب/أغسطس 2021.', 'في عام 2021 أعلنت Cigar Coop عن سلسلة دومينيكية، Connecticut وMaduro: المصنع غير معلن في تموز/يوليو 2021، ثم سُمّي Tabacalera El Artista في آب/أغسطس 2021؛ ولا تعرضها صفحة الدار في تشرين الأول/أكتوبر 2026.'), `updated_at` = NOW() WHERE `name` = 'Miami Cigar & Co.' AND `country_id` = 'nicaragua';

UPDATE `translation_status` t JOIN `brands` b ON b.`name` = t.`entite_id`
   SET t.`source_hash` = SHA1(b.`gamme`), t.`statut` = 'machine', t.`maj` = NOW()
 WHERE t.`entite` = 'brands' AND t.`entite_id` = 'Miami Cigar & Co.' AND t.`champ` = 'gamme';

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 290';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 290', 'systeme', 'fiche_corrigee', 'marque', 0, 'Miami Cigar & Co. : serie dominicaine de Don Lino dite annoncee en 2021, absente de la page de la maison en octobre 2026');

SELECT (SELECT COUNT(*) FROM `brands` WHERE `name` = 'Miami Cigar & Co.' AND `gamme` NOT LIKE '%Depuis 2021%' AND `gamme` LIKE '%ne la montre plus%') = 1 AS fr_a_jour,
       (SELECT COUNT(*) FROM `translation_status` WHERE `entite_id` = 'Miami Cigar & Co.' AND `champ` = 'gamme' AND `statut` = 'machine') = 5 AS sceaux_remis;
