-- ════════════════════════════════════════════════════════
-- 098 — Ce que le contrôle a vu la première fois qu'il a regardé
-- ────────────────────────────────────────────────────────
-- `marques_check` balaie désormais `lounges` et `producer_countries`,
-- et il lit enfin le FRANÇAIS de `brands` — la boucle itérait sur les
-- clés de PRESSE_LANGUES (en, es, de, zh, ar) et sautait la colonne
-- source depuis toujours.
--
-- Cette migration corrige tout ce qui relève des deux tables nouvelles.
-- Les 29 rangs mondiaux de `brands` sont mis au cliquet, pas corrigés :
-- douze marques dans six langues, c'est une campagne à part.
--
-- ── UNE CONSOMMATION DE TABAC PRÊTÉE ────────────────────
--
-- Excalibur : « Il la fumait quotidiennement ». C'est exactement la
-- catégorie pour laquelle cet outil a été écrit — la migration 057 en
-- avait retiré quatre — et elle vivait dans les six colonnes depuis,
-- invisible faute que le français soit lu.
--
-- Le reste de l'anecdote (la fierté, le refus de retoucher l'assemblage)
-- n'est pas davantage sourcé, mais ne prête pas un usage du tabac à une
-- personne réelle. On retire la phrase, pas le paragraphe.
--
-- ── DEUX RANGS DANS `lounges` ───────────────────────────
--
-- #1566 « Le plus grand événement mondial du cigare ». Le Festival del
--       Habano est le rendez-vous de référence, et cela se dit sans
--       superlatif : la date et l'organisateur suffisent.
-- #1570 « L'une des plus grandes manufactures du monde ». La fiche donne
--       elle-même la mesure — mille ouvriers. Un chiffre vaut mieux
--       qu'un rang.
--
-- Ces deux-là ont fait apparaître DEUX TROUS de plus dans le motif
-- français, corrigés dans l'outil :
--   « L'UNE DES plus grandes … du monde » — le motif exigeait le, la ou
--     les, et « des » lui échappait, alors que le superlatif relatif
--     affirme le même rang.
--   « le plus grand événement MONDIAL » — dit par l'adjectif, sans la
--     locution « du monde ».
--
-- (Note d'écriture : pas de point-virgule en fin de ligne de commentaire.
--  Le découpeur d'instructions coupe sur « ;\n », et une ligne de
--  commentaire ainsi tranchée est repartie comme instruction à part —
--  MySQL l'accepte en silence. Sept exécutions pour six UPDATE : c'est le
--  comptage croisé qui l'a montré, pas l'absence d'erreur.)
--
-- ── ET LE BRÉSIL, DANS SIX LANGUES ──────────────────────
--
-- « Mata Fina — l'un des maduros les plus réputés au monde. » La seule
-- fiche de `producer_countries` concernée, mais elle l'était partout.
--
-- Trois des six formes ne déclenchaient rien : « uno de los maduros más
-- reputados del mundo », « einer der renommiertesten Maduros der Welt »,
-- « من أشهر أنواع المادورو في العالم ». Le motif espagnol exigeait le
-- superlatif ABSOLU (« el más … del mundo »), l'allemand n'admettait
-- aucun nom entre « der …ste » et « der Welt », et l'arabe ne connaissait
-- qu'une seule des façons de former un superlatif. Corrigé dans l'outil.
--
-- ── DEUX FICHES JAMAIS TRADUITES, ENCORE ────────────────
--
-- Trouvées en réparant un trou de mon propre détecteur de la 095 : il
-- exigeait une lettre APRÈS le marqueur (`civandte`), et laissait passer
-- le marqueur en FIN de mot. « Elite Cigar Abidjan » portait `discrand`,
-- `discry` et `discrund` — `discret` substitué — dans trois colonnes, et
-- le contrôle était vert.
--
--   #119 Tableaux Lounge — cinq colonnes en français, `parquand` inclus
--    #99 Elite Cigar Abidjan — idem, avec du franglais dans le français
--        lui-même (« cadre discret et cosy, cigar shop »)
-- ════════════════════════════════════════════════════════

-- ── Excalibur : la phrase, dans les six colonnes ────────
UPDATE `brands` SET
  `celebrities`    = REPLACE(`celebrities`,    'Il la fumait quotidiennement et refusait', 'Il refusait'),
  `celebrities_en` = REPLACE(`celebrities_en`, 'He smoked it daily and categorically refused', 'He categorically refused'),
  `celebrities_es` = REPLACE(`celebrities_es`, 'La fumaba a diario y rechazaba', 'Rechazaba'),
  `celebrities_de` = REPLACE(`celebrities_de`, 'Er rauchte sie täglich und lehnte', 'Er lehnte'),
  `celebrities_zh` = REPLACE(`celebrities_zh`, '他每日抽它，并断然拒绝', '他断然拒绝'),
  `celebrities_ar` = REPLACE(`celebrities_ar`, 'كان يدخّنه يوميًا، ورفض قطعًا', 'ورفض قطعًا')
WHERE `name` = 'Excalibur';

-- ── #1566 — Festival del Habano ─────────────────────────
UPDATE `lounges` SET
  `description` = 'Rendez-vous annuel organisé par Habanos S.A. depuis 1999. Galas, dégustations de vitoles exclusives, enchères de caves d''exception.',
  `description_en` = 'The annual gathering organised by Habanos S.A. since 1999. Galas, tastings of exclusive vitolas, and auctions of exceptional humidors.',
  `description_es` = 'Cita anual organizada por Habanos S.A. desde 1999. Galas, degustación de vitolas exclusivas y subastas de humidores excepcionales.',
  `description_de` = 'Das jährliche Treffen, seit 1999 von Habanos S.A. veranstaltet. Galas, Verkostungen exklusiver Vitolas und Auktionen außergewöhnlicher Humidore.',
  `description_zh` = '由 Habanos S.A. 自 1999 年起举办的年度盛会。设晚宴、独家规格品鉴与珍稀雪茄柜拍卖。',
  `description_ar` = 'الملتقى السنوي الذي تنظّمه هابانوس ش.م. منذ 1999. حفلات، وتذوّق لمقاسات حصرية، ومزادات لمرطّبات استثنائية.'
WHERE `id` = 1566;

-- ── #1570 — Drew Estate Factory ─────────────────────────
UPDATE `lounges` SET
  `description` = 'Manufacture de Drew Estate à Estelí (Liga Privada, Undercrown) : plus de mille ouvriers. Visite d''usine avec salon de dégustation et vente directe.',
  `description_en` = 'Drew Estate''s factory in Estelí (Liga Privada, Undercrown): over a thousand workers. Factory tour with a tasting lounge and direct sales.',
  `description_es` = 'Fábrica de Drew Estate en Estelí (Liga Privada, Undercrown): más de mil trabajadores. Visita a la fábrica con lounge de degustación y venta directa.',
  `description_de` = 'Die Manufaktur von Drew Estate in Estelí (Liga Privada, Undercrown): über tausend Beschäftigte. Werksführung mit Verkostungslounge und Direktverkauf.',
  `description_zh` = '德鲁庄园位于埃斯特利的制造厂（Liga Privada、Undercrown），员工逾千人。设参观导览与品鉴厅，可直接选购。',
  `description_ar` = 'مصنع «درو إستيت» في إستيلي (ليغا بريفادا، أندركراون): أكثر من ألف عامل. جولة في المصنع مع صالة تذوّق وبيع مباشر.'
WHERE `id` = 1570;

-- ── Brésil — la seule fiche de producer_countries ───────
UPDATE `producer_countries` SET
  `notes`    = 'Mata Fina — tabac maduro de Bahia, recherché pour sa douceur boisée.',
  `notes_en` = 'Mata Fina — a maduro tobacco from Bahia, prized for its woody sweetness.',
  `notes_es` = 'Mata Fina — tabaco maduro de Bahía, apreciado por su dulzor amaderado.',
  `notes_de` = 'Mata Fina — ein Maduro-Tabak aus Bahia, geschätzt für seine holzige Süße.',
  `notes_zh` = 'Mata Fina——来自巴伊亚的马杜罗烟叶，以木质甜韵见长。',
  `notes_ar` = 'ماتا فينا — تبغ مادورو من ولاية باهيا، يُقدَّر لحلاوته الخشبية.'
WHERE `name` = 'Brésil';

-- ── #99 — Elite Cigar Abidjan ───────────────────────────
UPDATE `lounges` SET
  `description` = 'Repaire d''amateurs, cadre discret et chaleureux. Restaurant, salon, boutique de cigares et terrasse.',
  `description_en` = 'A haven for aficionados, discreet and warm. Restaurant, lounge, cigar shop and terrace.',
  `description_es` = 'Refugio de aficionados, de ambiente discreto y acogedor. Restaurante, salón, tienda de puros y terraza.',
  `description_de` = 'Ein Treffpunkt für Liebhaber, diskret und behaglich. Restaurant, Lounge, Zigarrenladen und Terrasse.',
  `description_zh` = '雪茄爱好者聚集地，环境低调温馨。设餐厅、休息室、雪茄专卖店与露台。',
  `description_ar` = 'ملتقى عشاق السيجار، بأجواء هادئة ودافئة. مطعم، وصالة، ومتجر سيجار، وشرفة.'
WHERE `name` = 'Elite Cigar Abidjan';

-- ── #119 — Tableaux Lounge, Daikanyama ──────────────────
UPDATE `lounges` SET
  `description` = 'Salon international à Daikanyama. Jazz live de musiciens de passage, vaste cave humidifiée, cocktails soignés. Lustres, parquet poli, fauteuils de cuir.',
  `description_en` = 'An international lounge in Daikanyama. Live jazz from visiting musicians, an extensive humidified cellar, carefully made cocktails. Chandeliers, polished parquet, leather armchairs.',
  `description_es` = 'Salón internacional en Daikanyama. Jazz en directo con músicos de paso, amplia bodega humidificada y cócteles cuidados. Lámparas de araña, parqué pulido y sillones de cuero.',
  `description_de` = 'Eine internationale Lounge in Daikanyama. Live-Jazz durchreisender Musiker, ein großer Humidorraum und sorgfältig gemixte Cocktails. Kronleuchter, poliertes Parkett, Ledersessel.',
  `description_zh` = '位于代官山的国际风格休息室。有客座乐手的现场爵士乐、宽敞的恒湿雪茄库与精心调制的鸡尾酒。水晶吊灯、抛光木地板与皮质扶手椅。',
  `description_ar` = 'صالة ذات طابع دولي في دايكانياما. جاز حيّ بعزف موسيقيين زائرين، ومخزن ترطيب واسع، وكوكتيلات متقنة. ثريّات، وأرضية باركيه مصقولة، وأرائك جلدية.'
WHERE `id` = 119;
