-- ════════════════════════════════════════════════════════
-- 187 — Aucun cigare de machine dans l'atlas
-- ────────────────────────────────────────────────────────
-- DÉCISION ÉDITORIALE DU PROPRIÉTAIRE DE L'ATLAS, appliquée à
-- l'existant : le cigare de machine n'a pas sa place ici.
--
-- La règle était déjà écrite à moitié. `docs/maisons-absentes.md`
-- excluait « cigarillos et grande distribution » du périmètre, et le
-- même document posait la question ouverte de la tradition européenne —
-- Pays-Bas, Belgique, Allemagne — en disant qu'elle « mérite d'être
-- décidée, pas subie ». Elle est décidée.
--
-- ── CE QUI SORT, ET POURQUOI ────────────────────────────
--
--   Guantanamera      cuba       « le seul havane dont l'argument
--                                principal est d'être fabriqué à la
--                                machine » — sa propre fiche le disait
--   Café Crème        indonesia  « techniquement un cigarillo : un
--                                petit module de fabrication mécanique »
--   Henri Wintermans  indonesia  la maison du Café Crème ; sa gamme ne
--                                portait que lui
--
-- Et l'entrée `El Reloj` du champ `gamme` de J.C. Newman : un cigare
-- produit par les machines des années 1930 de Tampa. LA FICHE J.C.
-- NEWMAN RESTE, et son histoire continue de raconter ces machines —
-- c'est du patrimoine industriel, et la maison est dans l'atlas pour
-- Diamond Crown et Cuesta-Rey, roulés à la main chez Fuente. Ce qui
-- sort, c'est le PRODUIT de machine, pas le récit qui l'explique.
--
-- ── L'INDONÉSIE PERD DEUX FICHES SUR TROIS ──────────────
-- Il reste Taru Martani, et c'est cohérent : elle « roule encore
-- l'essentiel de sa production à la main ». Mais son dernier paragraphe
-- se définissait PAR CONTRASTE avec les deux qui sortent — « la fiche
-- indonésienne ne comptait jusqu'ici que des marques néerlandaises ».
-- Retirer sans réécrire aurait laissé une phrase qui renvoie à des
-- fiches disparues. Elle est réécrite dans les six langues.
--
-- C'est le seul point de couture : la recherche des renvois a montré
-- que les trois marques ne se citaient qu'entre elles, et qu'aucune
-- autre fiche, aucun établissement, aucune feuille et aucun marché ne
-- les nomme.
--
-- ── CUBA N'EST PLUS COMPLET, ET C'EST VOULU ─────────────
-- `docs/maisons-absentes.md` annonçait « Cuba : 28 fiches sur 28 —
-- l'intégralité du portefeuille d'Habanos S.A. ». C'est désormais 27
-- sur 28, PAR CHOIX. Le document le dit ainsi plutôt que de laisser
-- croire à un oubli.
--
-- ⚠ CE QUI RESTE À TRANCHER : DANNEMANN.
-- Sa fiche raconte cent cinquante ans à São Félix da Cachoeira et le
-- terroir du Recôncavo — mais sa `gamme` décrit trois cigarillos :
-- « cigarillo brésilien sous cape Bahia », « format mini, dix minutes,
-- aromatisé vanille ou cerise », et une ligne Premium en cigares pleine
-- longueur. Le Brésil ne compte que quatre fiches ; retirer celle-ci
-- est une décision de pays, pas de produit. ELLE N'EST PAS PRISE ICI.
--
-- ── LES FICHES NE SONT PAS PERDUES ──────────────────────
-- Elles restent dans `sql/contenu.sql` du commit précédent et dans
-- l'historique Git. Le journal de modération ci-dessous dit lesquelles
-- et pourquoi, pour qu'on ne les recrée pas par inadvertance.
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

-- ── Les sceaux des fiches retirées partent avec elles ────
DELETE FROM `translation_status`
 WHERE `entite` = 'brands'
   AND `entite_id` IN ('Guantanamera', 'Café Crème', 'Henri Wintermans');

DELETE FROM `brands`
 WHERE `name` IN ('Guantanamera', 'Café Crème', 'Henri Wintermans');

-- ── J.C. Newman perd son cigare de machine, pas son récit ──
-- La fiche reste : la maison est dans l'atlas pour Diamond Crown et
-- Cuesta-Rey, roulés à la main chez Fuente (migration 181). Le champ
-- `gamme` devient vide, comme celui des sept maisons mères de la 180.
UPDATE `brands` SET
  `gamme` = '[]', `gamme_en` = '[]', `gamme_es` = '[]',
  `gamme_de` = '[]', `gamme_zh` = '[]', `gamme_ar` = '[]',
  `updated_at` = NOW()
 WHERE `name` = 'J.C. Newman';

-- ── Taru Martani ne peut plus se définir par contraste ───
UPDATE `brands` SET
 `history` = REPLACE(`history`,
   'La fiche indonésienne de cet atlas ne comptait jusqu''ici que des marques néerlandaises utilisant du tabac local : celle-ci est la première qui soit indonésienne au sens plein.',
   'C''est aujourd''hui la seule maison indonésienne de cet atlas : les deux autres fiches du pays portaient des marques néerlandaises de fabrication mécanique, et le cigare de machine n''entre pas ici.'),

 `history_en` = REPLACE(`history_en`,
   'The Indonesia page of this atlas counted until now only Dutch brands using local tobacco: this one is the first that is Indonesian in the full sense.',
   'It is today the only Indonesian house in this atlas: the country''s two other entries carried Dutch machine-made brands, and the machine-made cigar has no place here.'),

 `history_es` = REPLACE(`history_es`,
   'La ficha indonesia de este atlas no contaba hasta ahora más que marcas neerlandesas que utilizan tabaco local: esta es la primera que es indonesia en sentido pleno.',
   'Es hoy la única casa indonesia de este atlas: las otras dos fichas del país llevaban marcas neerlandesas de fabricación mecánica, y el puro de máquina no entra aquí.'),

 `history_de` = REPLACE(`history_de`,
   'Die Indonesien-Seite dieses Atlas führte bislang nur niederländische Marken, die lokalen Tabak verwenden: Diese hier ist die erste, die im vollen Sinne indonesisch ist.',
   'Es ist heute das einzige indonesische Haus in diesem Atlas: Die beiden anderen Einträge des Landes führten niederländische Maschinenmarken, und die Maschinenzigarre hat hier keinen Platz.'),

 `history_zh` = REPLACE(`history_zh`,
   '本图册的印尼页此前只有使用本地烟叶的荷兰品牌：这一条是第一个完整意义上属于印尼的。',
   '它如今是本图集中唯一的印尼庄家：该国另外两条曾收录荷兰的机制品牌，而机制雪茄不在本图集之列。'),

 `history_ar` = REPLACE(`history_ar`,
   'ولم تكن صفحة إندونيسيا في هذا الأطلس تضمّ حتى الآن سوى علامات هولندية تستخدم التبغ المحلّي: وهذه أول علامة إندونيسية بالمعنى الكامل.',
   'وهي اليوم الدار الإندونيسية الوحيدة في هذا الأطلس: فالبطاقتان الأخريان للبلد كانتا تحملان علامتين هولنديتين آليّتَي الصنع، والسيجار الآلي لا مكان له هنا.'),

 `updated_at` = NOW()
 WHERE `name` = 'Taru Martani';

-- ── Les sceaux, recalculés depuis les colonnes ───────────
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'brands', b.`name`, c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'history' THEN b.`history` ELSE b.`gamme` END),
       'machine', NOW()
  FROM `brands` b
  JOIN (SELECT 'history' champ UNION ALL SELECT 'gamme') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE b.`name` IN ('Taru Martani', 'J.C. Newman')
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 187','systeme','regle_editoriale','marque',0,
   'DECISION EDITORIALE DU PROPRIETAIRE DE L ATLAS : le cigare de machine n a pas sa place ici. La regle etait deja ecrite a moitie — docs/maisons-absentes.md excluait « cigarillos et grande distribution » du perimetre, et posait la question ouverte de la tradition europeenne en disant qu elle « merite d etre decidee, pas subie ». Elle est decidee, et elle ferme aussi les Pays-Bas, la Belgique et l Allemagne comme pays a ouvrir'),
  (NULL,'migration 187','systeme','fiches_retirees','marque',0,
   'TROIS FICHES RETIREES, chacune sur la foi de son propre texte : Guantanamera (cuba) — « le seul havane dont l argument principal est d etre fabrique a la machine » ; Cafe Creme (indonesia) — « techniquement un cigarillo : un petit module de fabrication mecanique » ; Henri Wintermans (indonesia) — la maison du Cafe Creme, dont la gamme ne portait que lui. Elles restent dans sql/contenu.sql du commit precedent et dans l historique Git : ce journal dit lesquelles et pourquoi, pour qu on ne les recree pas par inadvertance'),
  (NULL,'migration 187','systeme','le_produit_sort_pas_le_recit','marque',0,
   'L ENTREE `El Reloj` DU CHAMP GAMME DE J.C. NEWMAN EST RETIREE — un cigare produit par les machines des annees 1930 de Tampa. MAIS LA FICHE RESTE, et son histoire continue de raconter ces machines : c est du patrimoine industriel, et la maison est dans l atlas pour Diamond Crown et Cuesta-Rey, roules a la main chez Fuente (migration 181). Ce qui sort est le PRODUIT de machine, pas le recit qui l explique. Le champ gamme devient vide, comme celui des sept maisons meres de la 180'),
  (NULL,'migration 187','systeme','couture_apres_retrait','marque',0,
   'LE SEUL POINT DE COUTURE ETAIT TARU MARTANI. Son dernier paragraphe se definissait PAR CONTRASTE avec les deux fiches qui sortent — « la fiche indonesienne ne comptait jusqu ici que des marques neerlandaises ». Retirer sans reecrire aurait laisse une phrase renvoyant a des fiches disparues. Reecrite dans les six langues. La recherche des renvois a montre que les trois marques ne se citaient qu entre elles, et qu aucune autre fiche, aucun etablissement, aucune feuille et aucun marche ne les nomme'),
  (NULL,'migration 187','systeme','cuba_n_est_plus_complet','pays',0,
   'docs/maisons-absentes.md annoncait « Cuba : 28 fiches sur 28 — l integralite du portefeuille d Habanos S.A. ». C est desormais 27 SUR 28, PAR CHOIX. Le document le dit ainsi plutot que de laisser croire a un oubli. Et l Indonesie passe de trois fiches a une : il reste Taru Martani, qui roule encore l essentiel de sa production a la main'),
  (NULL,'migration 187','systeme','dannemann_reste_a_trancher','marque',0,
   'DANNEMANN N EST PAS RETIREE, ET CE N EST PAS UN OUBLI. Sa fiche raconte cent cinquante ans a Sao Felix da Cachoeira et le terroir du Reconcavo, mais sa gamme decrit trois cigarillos : « cigarillo bresilien sous cape Bahia », « format mini, dix minutes, aromatise vanille ou cerise », et une ligne Premium en cigares pleine longueur. Le Bresil ne compte que quatre fiches ; retirer celle-ci est une decision de PAYS, pas de produit, et elle appartient au proprietaire de l atlas');

-- ════════════════════════════════════════════════════════
-- LES DEUX FICHES DE PAYS, EN TOUTES LETTRES
-- ────────────────────────────────────────────────────────
-- Règle des migrations 179 à 186 : aucun `JSON_*`.
-- ════════════════════════════════════════════════════════
-- cuba : 28 → 27 entrées
UPDATE `producer_countries`
   SET `brands` = '[{"desc":"La marque la plus prestigieuse au monde","name":"Cohiba","iconic":true},{"desc":"Référence mondiale du cigare cubain","name":"Montecristo","iconic":true},{"desc":"Fondée en 1845, full body légendaire","name":"Partagás","iconic":true},{"desc":"Favori de Winston Churchill","name":"Romeo y Julieta","iconic":true},{"desc":"Créée par un banquier hambourgeois en 1844","name":"H. Upmann","iconic":false},{"desc":"Puissant, terreux, pour connaisseurs","name":"Bolivar","iconic":false},{"desc":"Jadis réservée aux cadeaux diplomatiques","name":"Trinidad","iconic":false},{"desc":"Marque historique cubaine depuis 1840","name":"Punch","iconic":false},{"desc":"Le creux de Vuelta Abajo, depuis 1865","name":"Hoyo de Monterrey","iconic":true},{"desc":"La seule havane au nom d''un cultivateur","name":"Vegas Robaina","iconic":false},{"desc":"Le secret le mieux gardé du portefeuille Habanos","name":"Quintero","iconic":false},{"desc":"1837, et l''invention de la boîte imprimée","name":"Ramón Allones","iconic":true},{"desc":"1848, la douceur d''avant la mode de la puissance","name":"El Rey del Mundo","iconic":false},{"desc":"1885, et les Medaille d''Or d''avant-guerre","name":"La Gloria Cubana","iconic":false},{"desc":"1876, une marque que se transmettent les initiés","name":"Juan López","iconic":false},{"desc":"1834, la doyenne encore produite","name":"Por Larrañaga","iconic":false},{"desc":"1928, et l''avis de fumer jeune inscrit sur la boîte","name":"Rafael González","iconic":false},{"desc":"1848, l''écuyer plutôt que le chevalier","name":"Sancho Panza","iconic":false},{"desc":"Une marque anglaise à l''assemblage cubain corsé","name":"Saint Luis Rey","iconic":false},{"desc":"1966, créée pour le marché français","name":"Diplomáticos","iconic":false},{"desc":"Le seul havane vendu enveloppé de papier de soie","name":"Fonseca","iconic":false},{"desc":"1996, le retour du double figurado","name":"Cuaba","iconic":false},{"desc":"1999, les quatre forteresses de La Havane","name":"San Cristóbal de La Habana","iconic":false},{"desc":"Le cigare des cultivateurs de Pinar del Río","name":"Vegueros","iconic":false},{"desc":"1973, un havane composé pour le goût français","name":"Quai d''Orsay","iconic":false},{"desc":"Le havane rustique, roulé en feuilles entières","name":"José L. Piedra","iconic":false},{"desc":"1884, la vingt-huitième que l''on oublie toujours","name":"La Flor de Cano","iconic":false}]',
       `updated_at` = NOW()
 WHERE `id` = 'cuba';

-- indonesia : 3 → 1 entrées
UPDATE `producer_countries`
   SET `brands` = '[{"desc":"Cultivé, roulé et signé à Java","name":"Taru Martani","iconic":true}]',
       `updated_at` = NOW()
 WHERE `id` = 'indonesia';

-- ── Le contrôle des six REPLACE de Taru Martani ──────────
-- Un REPLACE qui ne trouve pas son motif ne dit rien et sort en succès.
-- Doit rendre SIX lignes à 1.
SELECT 'fr' AS lang, `history`    LIKE '%seule maison indonésienne de cet atlas%' AS ok FROM `brands` WHERE `name`='Taru Martani'
UNION ALL SELECT 'en', `history_en` LIKE '%only Indonesian house in this atlas%'   FROM `brands` WHERE `name`='Taru Martani'
UNION ALL SELECT 'es', `history_es` LIKE '%única casa indonesia de este atlas%'    FROM `brands` WHERE `name`='Taru Martani'
UNION ALL SELECT 'de', `history_de` LIKE '%einzige indonesische Haus in diesem Atlas%' FROM `brands` WHERE `name`='Taru Martani'
UNION ALL SELECT 'zh', `history_zh` LIKE '%唯一的印尼庄家%'                          FROM `brands` WHERE `name`='Taru Martani'
UNION ALL SELECT 'ar', `history_ar` LIKE '%الدار الإندونيسية الوحيدة%'              FROM `brands` WHERE `name`='Taru Martani';
