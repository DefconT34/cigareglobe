-- ════════════════════════════════════════════════════════
-- 100 — Les récompenses : ce qui reste, ce qui part
-- ────────────────────────────────────────────────────────
-- Aucun motif de presse ne contenait de mot signifiant « récompense ».
-- C'est ainsi que « Tras el galardón de 2011 » avait survécu chez Alec
-- Bradley dans cinq colonnes (migration 099). Le balayage complet, dans
-- les six langues, ramène 26 occurrences.
--
-- ── ONZE NE DÉSIGNENT AUCUN PRIX ────────────────────────
--
-- Écartées par le motif, une par une, plutôt que par une tolérance
-- globale qui aurait aussi laissé passer les vraies :
--
--   « prized for its mildness », « blenders prize it » — l'anglais pour
--     *apprécié*. Le motif ignore `prize` et ne garde que `award`.
--   « le lieu PRIME sur la marque » — verbe français. Le motif exige
--     désormais l'accent : `primé`, jamais `prime`. Écrit « prim[ée]s? »,
--     il acceptait les deux, la classe contenant le e nu.
--   « Prime's Rum » — une marque de rhum.
--   « Gran Premio », « 大奖赛 », « الجائزة الكبرى » — le Grand Prix de
--     Monaco, une course automobile, dans trois langues.
--   « the Nobel Prize in Literature » — Churchill. Un fait historique
--     vérifiable, pas une distinction de cigare.
--
-- ── QUATRE RESTENT, ET C'EST LA MÊME LIGNE QUE PARTOUT ──
--
-- Ce que le projet retire depuis la migration 057, ce n'est pas la
-- distinction : c'est celle que PERSONNE NE PEUT ALLER VOIR. Sont restés
-- « fondée en 1787 », « 555 m », « plus de mille ouvriers », « organisé
-- par Habanos S.A. depuis 1999 » — tous spécifiques et attribuables.
--
-- « Davidoff Best Performance EMEA 2021 » nomme son donneur, sa
-- catégorie, sa région et son année. Un lecteur peut le chercher. Il
-- relève de la première catégorie, et les quatre établissements
-- concernés — Cava Magallanes, Dagbladhandel Vandevenne, Lerida
-- International, Mohilla — sont admis par exception NOMMÉE dans l'outil.
--
-- ── DEUX PARTENT ────────────────────────────────────────
--
-- « Brasserie artisanale primée » et « art contemporain primé » ne
-- disent ni par qui, ni pour quoi, ni quand. C'est la forme vague, celle
-- qui donne l'air d'une caution sans en être une.
--
-- Le fait vérifiable est conservé dans les deux cas : Cigar City Brewing
-- reste une brasserie artisanale qui accorde ses bières aux cigares, le
-- RuMa reste un hôtel qui expose de l'art malaisien contemporain.
--
-- ── ET UN SUPERLATIF DE VILLE ───────────────────────────
--
-- Le RuMa était aussi « l'hôtel de luxe le plus audacieux de Kuala
-- Lumpur sur le plan du design ». RANGS_MONDIAUX ne le voit pas : il
-- cherche « au monde », et celui-ci porte sur une ville. L'audace en
-- design ne se mesure pas davantage à l'échelle d'une capitale qu'à
-- celle de la planète.
--
-- ── LE MOTIF CHINOIS AVAIT UN TROU ──────────────────────
--
-- Cinq langues sortaient, pas le chinois. Il dit « 屡获殊荣 » — « maintes
-- fois distingué » — sans le caractère 奖 que le motif exigeait. Cinq
-- langues sur six est le symptôme d'un motif incomplet, pas d'une base
-- propre : c'est la quatrième fois du chantier.
-- ════════════════════════════════════════════════════════

-- ── #1508 — Cigar City Brewing ──────────────────────────
UPDATE `lounges` SET
  `description` = 'Brasserie artisanale qui associe ses bières à des cigares locaux. Terrasse, cave humidifiée où l''on entre, accords bières-cigares honduriens et nicaraguayens.',
  `description_en` = 'A craft brewery pairing its own beers with local cigars. Terrace, walk-in humidified cellar, and beer pairings for Honduran and Nicaraguan cigars.',
  `description_es` = 'Cervecería artesanal que combina sus cervezas con puros locales. Terraza, bodega humidificada por la que se entra y maridajes de cerveza con puros hondureños y nicaragüenses.',
  `description_de` = 'Craft-Brauerei, die ihre Biere mit lokalen Zigarren verbindet. Terrasse, begehbarer Humidorraum und Bier-Zigarren-Pairings aus Honduras und Nicaragua.',
  `description_zh` = '精酿酒厂，将自酿啤酒与本地雪茄相搭配。设露台与可步入的恒湿雪茄库，提供啤酒与洪都拉斯、尼加拉瓜雪茄的搭配。',
  `description_ar` = 'مصنع جعة حرفي يجمع بين بيرته والسيجار المحلي. تراس، ومخزن ترطيب يُدخل إليه، ومزاوجات بين البيرة والسيجار الهندوراسي والنيكاراغوي.'
WHERE `id` = 1508;

-- ── #2511 — The RuMa Hotel ──────────────────────────────
UPDATE `lounges` SET
  `description` = 'Bar à cigares intimiste du RuMa, hôtel de luxe de Kuala Lumpur. Habanos et cigares du Nouveau Monde sélectionnés, cocktails d''auteur, art malaisien contemporain dans tout l''établissement.',
  `description_en` = 'The RuMa''s intimate cigar bar, in a Kuala Lumpur luxury hotel. A selection of Habanos and New World cigars, signature cocktails, and contemporary Malaysian art throughout.',
  `description_es` = 'Bar de puros íntimo del RuMa, hotel de lujo de Kuala Lumpur. Selección de habanos y puros del Nuevo Mundo, cócteles de autor y arte malasio contemporáneo por todo el hotel.',
  `description_de` = 'Die intime Zigarrenbar des RuMa, eines Luxushotels in Kuala Lumpur. Ausgewählte Habanos und New-World-Zigarren, Signature-Cocktails und zeitgenössische malaysische Kunst im ganzen Haus.',
  `description_zh` = 'The RuMa 内私密的雪茄吧，位于吉隆坡的一家豪华酒店。精选哈瓦那雪茄与新世界雪茄、手作鸡尾酒，全馆陈列马来西亚当代艺术。',
  `description_ar` = 'بار السيجار الحميم في «الرُّما»، وهو فندق فاخر في كوالالمبور. تشكيلة مختارة من سيجار هابانوس وسيجار العالم الجديد، وكوكتيلات مبتكرة، وفن ماليزي معاصر في أرجاء الفندق.'
WHERE `id` = 2511;
