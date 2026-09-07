-- ════════════════════════════════════════════════════════
-- 176 — Trois usines mal attribuées en République dominicaine
-- ────────────────────────────────────────────────────────
-- VÉRIFICATION SYSTÉMATIQUE DES VINGT-DEUX FICHES DOMINICAINES. Trois
-- portent une usine fausse, et deux de ces trois sont des maisons
-- majeures de l'atlas. Aucune de ces erreurs n'est de moi : elles sont
-- là depuis l'import.
--
-- ── 1 ET 2. DAVIDOFF ET AVO NE SORTENT PAS DE MATASA ─────
-- L'atlas attribue les deux à « Manufactura de Tabacos S.A. (MATASA),
-- Santiago ». MATASA est la manufacture de LA FAMILLE QUESADA — l'atlas
-- porte d'ailleurs la maison Quesada sous ce nom et avec cette usine.
--
-- Davidoff et Avo sortent de TABADOM — Tabacos Dominicanos S.A. —,
-- fondée en février 1984 par Hendrik « Henke » Kelner à Villa González,
-- et vendue plus tard à Davidoff. Kelner y a produit les AVO AVANT les
-- Davidoff ; les premiers Davidoff dominicains datent de 1990. Le même
-- atelier fait aussi les Griffin's et les Troya.
--
-- La fiche d'Avo répétait l'erreur EN TOUTES LETTRES, dans les six
-- langues : « la manufacture MATASA, à Santiago — celle-là même où se
-- développait la production dominicaine de Davidoff ». La phrase est
-- juste sur le fond — c'est bien le même atelier que Davidoff — et
-- fausse sur le nom. Elle est corrigée sans être défaite.
--
-- ── 3. MACANUDO N'EST PAS FAIT À LA ROMANA ───────────────
-- L'atlas écrit « General Cigar, La Romana et Santiago ». La Romana est
-- la Tabacalera de García, c'est-à-dire l'usine d'ALTADIS — celle des
-- Montecristo, Romeo y Julieta et H. Upmann dominicains, que l'atlas
-- porte correctement par ailleurs. Macanudo est roulé à SANTIAGO, chez
-- General Cigar Dominicana, depuis le transfert de la Jamaïque en 2000.
--
-- Mettre les deux villes revenait à faire cohabiter dans une même ligne
-- deux groupes concurrents.
--
-- ── ET UN CHAMP VAGUE QU'ON PEUT REMPLIR ─────────────────
-- The Griffin's portait « Rép. dominicaine » — vrai, mais sans contenu.
-- La même source qui corrige Davidoff et Avo nomme l'atelier : Tabadom
-- produit « Davidoffs, Avos, Troyas and The Griffin's ».
--
-- Sources : cigaraficionado.com (« Tobacco Man », « Kelner — Davidoff's
-- Tobacco Guru »), cigarjournal.com, en.wikipedia.org (Macanudo).
--
-- ── CE QUE CETTE VÉRIFICATION DIT DU RESTE ───────────────
-- Les dix-huit autres fiches dominicaines ont été recoupées et tiennent :
-- Fuente et Ashton chez Tabacalera A. Fuente, Quesada chez MATASA,
-- E.P. Carrillo à la Tabacalera La Alianza, La Aurora et La Flor
-- Dominicana dans leurs propres murs, et les six marques d'Altadis —
-- Don Diego, Montecristo, Romeo y Julieta, H. Upmann, Henry Clay,
-- Santa Damiana, VegaFina — à la Tabacalera de García.
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

UPDATE `brands`
   SET `factory` = 'Tabadom (Tabacos Dominicanos), Villa González / Santiago, Rép. dominicaine',
       `updated_at` = NOW()
 WHERE `name` = 'Davidoff';

UPDATE `brands`
   SET `factory` = 'Tabadom (Tabacos Dominicanos), Villa González / Santiago — l''atelier de Davidoff',
       `history`    = REPLACE(`history`,
         'la manufacture MATASA, à Santiago — celle-là même où se développait la production dominicaine de Davidoff.',
         'la manufacture Tabadom, à Villa González — celle qu''Hendrik Kelner avait fondée en 1984, et où se développait la production dominicaine de Davidoff.'),
       `history_en` = REPLACE(`history_en`,
         'the MATASA factory in Santiago — the same facility where Davidoff''s Dominican production was being developed.',
         'the Tabadom factory in Villa González — the one Hendrik Kelner had founded in 1984, where Davidoff''s Dominican production was being developed.'),
       `history_es` = REPLACE(`history_es`,
         'la manufactura MATASA, en Santiago —aquella misma donde se desarrollaba la producción dominicana de Davidoff.',
         'la manufactura Tabadom, en Villa González —la que Hendrik Kelner había fundado en 1984, y donde se desarrollaba la producción dominicana de Davidoff.'),
       `history_de` = REPLACE(`history_de`,
         -- ⚠ LE VERBE EST SEPARABLE. « anbahnen » rejette son « an » en
         -- fin de proposition : « bahnte die Begegnung mit der
         -- Manufaktur MATASA in Santiago AN — eben jener… ». Le premier
         -- jet omettait ce mot, et la substitution allemande n'a rien
         -- remplace pendant que les cinq autres passaient. Une
         -- verification par langue l'a montre.
         'Manufaktur MATASA in Santiago an — eben jener, in der Davidoffs dominikanische Produktion entstand.',
         'Manufaktur Tabadom in Villa González an — jener, die Hendrik Kelner 1984 gegründet hatte und in der Davidoffs dominikanische Produktion entstand.'),
       `history_zh` = REPLACE(`history_zh`,
         '他与圣地亚哥 MATASA 工厂的相识——正是大卫杜夫多米尼加生产线所在的那家。',
         '他与比亚冈萨雷斯 Tabadom 工厂的相识——那是亨德里克·凯尔纳 1984 年创办的工厂，也正是大卫杜夫多米尼加生产线所在之处。'),
       `history_ar` = REPLACE(`history_ar`,
         'بمصنع MATASA في سانتياغو — المصنع نفسه الذي كان يتطوّر فيه إنتاج دافيدوف الدومينيكي.',
         'بمصنع تابادوم في بيّا غونثاليث — المصنع الذي أسّسه هندريك كيلنر عام 1984، والذي كان يتطوّر فيه إنتاج دافيدوف الدومينيكي.'),
       `updated_at` = NOW()
 WHERE `name` = 'Avo';

UPDATE `brands`
   SET `factory` = 'General Cigar Dominicana, Santiago, Rép. dominicaine',
       `updated_at` = NOW()
 WHERE `name` = 'Macanudo';

UPDATE `brands`
   SET `factory` = 'Tabadom (Tabacos Dominicanos), Villa González / Santiago, Rép. dominicaine',
       `updated_at` = NOW()
 WHERE `name` = 'The Griffin''s';

-- ── Le sceau d'Avo, recalculé depuis la colonne ──────────
UPDATE `translation_status` t
  JOIN `brands` b ON b.`name` = t.`entite_id`
   SET t.`source_hash` = SHA1(b.`history`), t.`statut` = 'machine', t.`maj` = NOW()
 WHERE t.`entite` = 'brands' AND t.`champ` = 'history' AND t.`entite_id` = 'Avo';

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 176','systeme','usine_corrigee','marque',0,
   'DAVIDOFF et AVO etaient attribues a MATASA, qui est la manufacture de la famille QUESADA — l atlas porte d ailleurs la maison Quesada sous ce nom et avec cette usine. Les deux sortent de TABADOM (Tabacos Dominicanos), fondee en fevrier 1984 par Hendrik « Henke » Kelner a Villa Gonzalez et vendue plus tard a Davidoff. Kelner y produisait les AVO AVANT les Davidoff ; les premiers Davidoff dominicains datent de 1990'),
  (NULL,'migration 176','systeme','erreur_repetee_en_prose','marque',0,
   'la fiche d Avo repetait l erreur EN TOUTES LETTRES dans les six langues : « la manufacture MATASA, a Santiago — celle-la meme ou se developpait la production dominicaine de Davidoff ». La phrase etait juste sur le fond (c est bien le meme atelier que Davidoff) et fausse sur le nom. Corrigee sans etre defaite : elle nomme desormais Tabadom et Kelner'),
  (NULL,'migration 176','systeme','usine_corrigee','marque',0,
   'MACANUDO etait donne a « General Cigar, La Romana et Santiago ». La Romana est la Tabacalera de Garcia, c est-a-dire l usine d ALTADIS — celle des Montecristo, Romeo y Julieta et H. Upmann dominicains que l atlas porte correctement par ailleurs. Mettre les deux villes faisait cohabiter dans une meme ligne deux groupes concurrents. Macanudo est roule a SANTIAGO, chez General Cigar Dominicana, depuis le transfert de la Jamaique en 2000'),
  (NULL,'migration 176','systeme','champ_vague_rempli','marque',0,
   'The Griffin s portait « Rep. dominicaine » — vrai mais sans contenu. La meme source qui corrige Davidoff et Avo nomme l atelier : Tabadom produit « Davidoffs, Avos, Troyas and The Griffin s »'),
  (NULL,'migration 176','systeme','verification_du_reste','marque',0,
   'les dix-huit autres fiches dominicaines ont ete recoupees et tiennent : Fuente et Ashton chez Tabacalera A. Fuente, Quesada chez MATASA, E.P. Carrillo a la Tabacalera La Alianza, La Aurora et La Flor Dominicana dans leurs propres murs, et les marques d Altadis a la Tabacalera de Garcia');
