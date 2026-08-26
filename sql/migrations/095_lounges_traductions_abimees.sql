-- ════════════════════════════════════════════════════════
-- 095 — Cinq fiches jamais traduites, et un oubli de la 093
-- ────────────────────────────────────────────────────────
-- Trouvé en cherchant si `lounges` portait des affirmations non sourcées
-- (le trou que la 093 et la 094 signalaient sans le combler).
--
-- ── LA SIGNATURE ────────────────────────────────────────
--
-- La colonne ANGLAISE de la fiche « La Casa del Habano — Ho Chi Minh »
-- disait :
--
--     « First et seule La Casa del Habano du Viandnam, openede le 1er
--       août 2021. Archi inspirée du patrimoine colonial saigonnais. »
--
-- « Viandnam », c'est *Vietnam* où « et » a été remplacé par « and »
-- À L'INTÉRIEUR du mot. Ces cinq fiches n'ont jamais été traduites :
-- elles ont subi une substitution de mots sans limite de mot. Le reste
-- de la phrase est resté en français.
--
-- ── COMMENT LES TROUVER SANS SE TROMPER ─────────────────
--
-- Chercher « and » collé dans un mot ramène `brands`, `Sandton`,
-- `grandfather`, `thousands` — 73 fiches de bruit. Le test qui tranche
-- est réversible : on remet « et » à la place de « and », et on regarde
-- si le mot obtenu est PRÉSENT DANS LA COLONNE FRANÇAISE de la même
-- fiche. `civandte` → `civette` ✓. `grandfather` → `gretfather` ✗.
--
-- Mesuré ainsi sur les trois tables narratives et trois langues :
--   `brands`             : 0 fiche  — les marques sont saines
--   `producer_countries` : 0 fiche
--   `lounges`            : 5 fiches, les mêmes en en/es/de
--
-- ── ET L'OUBLI DE LA 093 ────────────────────────────────
--
-- La migration 093 a retiré « Cigar Journal Award » et les « 270
-- facings » de la fiche BURN by Rocky Patel. Du FRANÇAIS seulement.
-- Les cinq colonnes traduites l'annonçaient toujours.
--
-- C'est le septième cas du chantier où un même fait, écrit à deux
-- adresses, n'est corrigé qu'à une seule — et le premier que je me
-- fais à moi-même dans ce lot.
--
-- ⚠ `i18n_fraicheur` affichait 100 %. Il compare l'empreinte de la
-- source à celle scellée, pas la traduction à son sens : resceller
-- déclare « à jour » sans rien retraduire. Une fiche entièrement en
-- français dans sa colonne anglaise lui paraît fraîche.
--
-- ── TROIS AFFIRMATIONS AU PASSAGE ───────────────────────
--
-- #25  « la plus ancienne civette encore en activité au monde » — un
--      rang mondial que personne ne mesure. La date de fondation, elle,
--      est vérifiable et se suffit.
-- #63  « benchmark international » — anglicisme, et rang sans mesure.
-- #425 « flagship » → « boutique amirale », comme en 094.
--      « Archi » (#140) était une troncature, pas un mot.
-- ════════════════════════════════════════════════════════

-- ── #25 — À La Civette ──────────────────────────────────
UPDATE `lounges` SET
  `description` = 'Fondée en 1716 et en activité sans interruption depuis. Clients historiques : Danton, Napoléon, Robespierre, Mirabeau, Degas, George Sand. Plus de 350 références de Cuba, du Honduras, du Nicaragua et de République dominicaine. Pipes et spiritueux.',
  `description_en` = 'Founded in 1716 and trading without interruption ever since. Historic patrons: Danton, Napoleon, Robespierre, Mirabeau, Degas, George Sand. Over 350 references from Cuba, Honduras, Nicaragua and the Dominican Republic. Pipes and fine spirits.',
  `description_es` = 'Fundada en 1716 y en activo sin interrupción desde entonces. Clientes históricos: Danton, Napoleón, Robespierre, Mirabeau, Degas, George Sand. Más de 350 referencias de Cuba, Honduras, Nicaragua y República Dominicana. Pipas y licores selectos.',
  `description_de` = '1716 gegründet und seither ohne Unterbrechung in Betrieb. Historische Kunden: Danton, Napoleon, Robespierre, Mirabeau, Degas, George Sand. Über 350 Referenzen aus Kuba, Honduras, Nicaragua und der Dominikanischen Republik. Pfeifen und edle Spirituosen.',
  `description_zh` = '1716 年创立，此后经营从未中断。历史上的顾客包括丹东、拿破仑、罗伯斯庇尔、米拉波、德加与乔治·桑。备有 350 余款来自古巴、洪都拉斯、尼加拉瓜和多米尼加共和国的产品，另售烟斗与精致烈酒。',
  `description_ar` = 'تأسّست عام 1716 وظلّت تعمل دون انقطاع منذ ذلك الحين. من زبائنها التاريخيين: دانتون ونابليون وروبسبير وميرابو وديغا وجورج ساند. أكثر من 350 صنفًا من كوبا وهندوراس ونيكاراغوا وجمهورية الدومينيكان، إضافة إلى الغلايين والمشروبات الروحية الفاخرة.'
WHERE `id` = 25;

-- ── #63 — La Casa del Habano, Escaldes-Engordany ────────
UPDATE `lounges` SET
  `description` = 'Ouverte en 1995. Cave humidifiée à hygrométrie régulée, gamme Habanos complète, séries limitées et éditions régionales.',
  `description_en` = 'Opened in 1995. Climate-controlled humidified cellar, the full Habanos range, limited series and regional editions.',
  `description_es` = 'Abierta en 1995. Bodega humidificada con higrometría regulada, gama Habanos completa, series limitadas y ediciones regionales.',
  `description_de` = '1995 eröffnet. Klimatisierter Humidorraum, komplettes Habanos-Sortiment, limitierte Serien und Regionaleditionen.',
  `description_zh` = '1995 年开业。设恒湿恒温雪茄库，哈瓦那系列齐全，另有限量版与区域版。',
  `description_ar` = 'افتُتح عام 1995. مخزن ترطيب مضبوط الرطوبة، وتشكيلة هابانوس كاملة، وإصدارات محدودة وإقليمية.'
WHERE `id` = 63;

-- ── #140 — La Casa del Habano, Hô Chi Minh-Ville ────────
UPDATE `lounges` SET
  `description` = 'Première et seule La Casa del Habano du Vietnam, inaugurée le 1er août 2021. Architecture inspirée du patrimoine colonial saïgonnais.',
  `description_en` = 'The first and only La Casa del Habano in Vietnam, opened on 1 August 2021. The architecture draws on Saigon''s colonial heritage.',
  `description_es` = 'La primera y única La Casa del Habano de Vietnam, inaugurada el 1 de agosto de 2021. Arquitectura inspirada en el patrimonio colonial saigonés.',
  `description_de` = 'Das erste und einzige La Casa del Habano Vietnams, eröffnet am 1. August 2021. Die Architektur greift das koloniale Erbe Saigons auf.',
  `description_zh` = '越南首家也是唯一一家 La Casa del Habano，2021 年 8 月 1 日开业。建筑取材于西贡的殖民时期遗产。',
  `description_ar` = 'أول وأوحد فرع لـ«لا كازا ديل هابانو» في فيتنام، افتُتح في 1 أغسطس 2021. عمارته مستوحاة من التراث الكولونيالي في سايغون.'
WHERE `id` = 140;

-- ── #152 — BURN by Rocky Patel : ce que la 093 a manqué ─
UPDATE `lounges` SET
  `description_en` = 'The first BURN store, opened in 2010. A large stock on open shelving, plus a full food menu — a place to spend the evening, not just to buy.',
  `description_es` = 'La primera tienda BURN, abierta en 2010. Amplio surtido en estanterías abiertas y una carta de restauración completa: un lugar para pasar la velada, no solo para comprar.',
  `description_de` = 'Der erste BURN-Store, 2010 eröffnet. Großes Sortiment in offenen Regalen und eine vollständige Speisekarte — ein Ort für den ganzen Abend, nicht nur zum Einkaufen.',
  `description_zh` = '首家 BURN 门店，2010 年开业。开放式货架陈列大量存货，并提供完整餐单——这里适合消磨整晚，而不只是买了就走。',
  `description_ar` = 'أول متجر لـ«بيرن»، افتُتح عام 2010. مخزون واسع معروض على رفوف مفتوحة، وقائمة طعام كاملة — مكان تُمضى فيه السهرة، لا للشراء فحسب.'
WHERE `id` = 152;

-- ── #425 — Nat Sherman, New York ────────────────────────
UPDATE `lounges` SET
  `description` = 'Héritage de Nat Sherman, racheté par Davidoff — boutique amirale monumentale face à Grand Central.',
  `description_en` = 'The Nat Sherman legacy, acquired by Davidoff — a monumental flagship store facing Grand Central.',
  `description_es` = 'El legado de Nat Sherman, adquirido por Davidoff: tienda insignia monumental frente a Grand Central.',
  `description_de` = 'Das Erbe von Nat Sherman, von Davidoff übernommen — ein monumentaler Flagship-Store gegenüber Grand Central.',
  `description_zh` = '纳特·谢尔曼的传承，由大卫杜夫收购——面朝中央车站的巨型旗舰店。',
  `description_ar` = 'إرث نات شيرمان، الذي استحوذت عليه دافيدوف — متجر رئيس ضخم يقابل محطة غراند سنترال.'
WHERE `id` = 425;

-- ── #919 — The Caleta Hotel, Gibraltar ──────────────────
UPDATE `lounges` SET
  `description_en` = 'The Caleta Hotel''s cigar terrace, overlooking Catalan Bay beach — with a view across the Strait.',
  `description_es` = 'Terraza de cigarros del Caleta Hotel frente a la playa de Catalan Bay, con vistas al Estrecho.',
  `description_de` = 'Die Zigarrenterrasse des Caleta Hotel gegenüber dem Strand von Catalan Bay — mit Blick auf die Meerenge.',
  `description_zh` = '卡莱塔酒店的雪茄露台，正对加泰罗尼亚湾海滩，可眺望海峡。',
  `description_ar` = 'شرفة السيجار في فندق كاليتا المطلّة على شاطئ خليج كاتالان — بإطلالة على المضيق.'
WHERE `id` = 919;
