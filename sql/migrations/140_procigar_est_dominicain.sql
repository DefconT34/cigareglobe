-- ════════════════════════════════════════════════════════
-- 140 — ProCigar : la description, et ses cinq traductions
-- ────────────────────────────────────────────────────────
-- CE QUE LA FICHE AFFIRMAIT :
--
--   « Festival international du cigare combinant Estelí (Nicaragua) et
--     Santiago (RD). »
--
-- CE QU'IL EN EST. ProCigar est l'Asociación de Fabricantes de Cigarros
-- de la República Dominicana. Son festival annuel se tient en février,
-- ENTIÈREMENT en République Dominicaine : à La Romana, où se trouve la
-- Tabacalera de García, et à Santiago de los Caballeros, cœur de
-- l'industrie dominicaine du cigare. L'édition 2026 était la dix-huitième,
-- du 15 au 20 février. Estelí est au Nicaragua et relève d'un autre
-- festival.
--
-- Sources : procigar.org, cigaraficionado.com, premiumcigars.org —
-- vérifiées, et non écrites de mémoire.
--
-- La migration 138 avait déjà reclassé la fiche au dominicain, corrigé
-- son nom et sa ville. Elle avait LAISSÉ la description, en le disant :
-- celle-ci porte cinq traductions scellées, et la changer sans les
-- refaire les aurait périmées en silence.
--
-- ── POURQUOI LES SIX TEXTES CHANGENT ENSEMBLE ────────────
-- `translation_status` scelle chaque traduction par le SHA1 de sa
-- source française. Modifier le français sans toucher au reste laisse
-- cinq lignes qui prétendent traduire un texte qui n'existe plus — et
-- la campagne le dirait, ce qui est déjà ça, mais le site aurait servi
-- entre-temps cinq contresens dans cinq langues.
--
-- Le sceau est recalculé DEPUIS LA COLONNE (`SHA1(description)`) et non
-- écrit à la main : une empreinte recopiée finit par ne plus
-- correspondre au texte qu'elle scelle, et c'est précisément ce qu'un
-- sceau doit rendre impossible.
--
-- Le statut reste « machine » : ces traductions n'ont pas été relues
-- par un humain, et prétendre le contraire fausserait le seul compteur
-- qui dit où en est la relecture du corpus.
--
-- Après cette migration : php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

UPDATE `lounges` SET
  `name` = 'ProCigar Festival — Santiago & La Romana',
  `city` = 'Santiago de los Caballeros et La Romana (chaque février)',

  `description` = 'Festival annuel de l''association des fabricants dominicains (Procigar), en février. Visites de manufactures et de champs de tabac entre Santiago de los Caballeros et La Romana, dégustations et rencontres avec les torcedores.',

  `description_en` = 'Annual festival of the Dominican cigar manufacturers'' association (Procigar), held in February. Factory and tobacco-field visits between Santiago de los Caballeros and La Romana, tastings and encounters with the rollers.',

  `description_es` = 'Festival anual de la asociación de fabricantes dominicanos (Procigar), en febrero. Visitas a fábricas y a campos de tabaco entre Santiago de los Caballeros y La Romana, catas y encuentros con los torcedores.',

  `description_de` = 'Jährliches Festival des dominikanischen Herstellerverbands (Procigar), im Februar. Besuche von Manufakturen und Tabakfeldern zwischen Santiago de los Caballeros und La Romana, Verkostungen und Begegnungen mit den Torcedores.',

  `description_zh` = '多米尼加雪茄制造商协会（Procigar）的年度节庆，每年二月举行。在圣地亚哥－德洛斯卡瓦耶罗斯与拉罗马纳之间参观制造厂与烟田，品鉴雪茄并与卷制师傅见面。',

  `description_ar` = 'مهرجان سنويّ تقيمه جمعية صنّاع السيجار الدومينيكيين (بروسيغار) في شباط/فبراير. زيارات للمصانع وحقول التبغ بين سانتياغو دي لوس كاباييروس ولا رومانا، وجلسات تذوّق ولقاءات مع اللافّين.',

  `updated_at` = NOW()
 WHERE `id` = 1572 AND `country_id` = 'dominican';

-- Le sceau, recalculé depuis la colonne elle-même.
UPDATE `translation_status`
   SET `source_hash` = (SELECT SHA1(`description`) FROM `lounges` WHERE `id` = 1572),
       `statut`      = 'machine',
       `maj`         = NOW()
 WHERE `entite` = 'lounges' AND `entite_id` = '1572' AND `champ` = 'description';

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL, 'migration 140', 'systeme', 'description_corrigee', 'lounge', 1572,
   'ProCigar est entierement dominicain : Esteli (Nicaragua) retire des six langues');
