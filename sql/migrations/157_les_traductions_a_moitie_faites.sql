-- ════════════════════════════════════════════════════════
-- 157 — Cinq fiches dont les traductions n'ont jamais été faites
-- ────────────────────────────────────────────────────────
-- CE QUE LES CONTRÔLES NE VOYAIENT PAS. Trois outils surveillent les
-- traductions : `i18n_melange_check` cherche l'anglais dans les colonnes
-- qui ne sont pas la sienne, `i18n_langue_check` les écritures
-- étrangères et les mots abîmés, `i18n_divergence` les écarts de volume
-- et les faits ajoutés. Tous les trois sont au vert.
--
-- Aucun ne cherchait le FRANÇAIS resté dans les colonnes traduites.
--
-- Cinq fiches ont été traduites par une substitution mot à mot qui n'a
-- remplacé que certains jetons. Le résultat se lit tel quel :
--
--   #1  en : « Opened le 6 janv. 2025 par les frères Kamal… »
--       de : « Eröffnund le 6 janv. 2025 par les frères… »
--   #2  en : « Openede in Dec. 2020. »
--   #36 zh : « Façade 历史悠久 de marchand 的Porto… »
--   #120 en : la phrase française entière, avec « Ouvert » changé en
--            « Open » et rien d'autre
--   #411 es : « La Casa del Habano oficialle de Miami, grande cava y
--            espace lounge. »
--
-- ── LA PLUS GRAVE N'EST PAS LA PLUS VISIBLE ──────────────
-- #411 est le Casa de Montecristo de General Cigar, à Miami. Ses
-- colonnes espagnole, allemande, chinoise et arabe affirment que c'est
-- une LA CASA DEL HABANO — une franchise Habanos, donc un contrat avec
-- un tiers, que le français n'affirme pas et que rien n'atteste.
--
-- C'est exactement la faute que les migrations 141 à 155 ont passé
-- treize chantiers à retirer des champs `type` et `source`. Elle
-- survivait dans la PROSE TRADUITE, où aucun contrôle ne regardait, et
-- seulement pour les lecteurs qui ne lisent pas le français.
--
-- ── UNE ERREUR DE SENS, ET DEUX FAUX POSITIFS ────────────
-- #36 est à HAMBOURG. Le français dit « façade historique de marchand
-- de Porto » — un marchand de vin de Porto. Les traductions ont compris
-- la VILLE : « merchant's front in Porto », « comerciante en Oporto ».
-- La boutique change de pays en changeant de langue.
--
-- En revanche #36 et #282 avaient été signalées à tort par la première
-- sonde : leurs traductions écrivent « La Casa del Habano » là où le
-- français dit « réseau LCDH » et « spécialiste des Habanos ». C'est une
-- traduction fidèle d'un acronyme, pas une affirmation ajoutée. On ne
-- touche pas.
--
-- ── #411 : UNE CONTRADICTION QU'ON RETIRE PLUTÔT QUE DE LA TRADUIRE ─
-- La description situe la boutique « dans le quartier de Brickell » ;
-- l'adresse de la fiche dit « 1535 NW 79th Ave, Doral ». Vingt
-- kilomètres séparent les deux, et rien ne permet de trancher.
--
-- La mention du quartier est retirée du FRANÇAIS aussi. Traduire en
-- quatre langues une localisation contestée l'aurait multipliée par
-- quatre ; la garder en français seul l'aurait laissée là où elle est
-- née. « À Miami » est vrai dans les deux lectures.
--
-- Le français de cette fiche est réécrit pour une seconde raison : « Le
-- plus grand cave humidifiée où l'on entre du sud de la Floride » n'est
-- pas du français. C'est déjà de la traduction automatique, depuis
-- l'anglais cette fois.
--
-- ── LE STATUT RESTE « MACHINE » ──────────────────────────
-- Ces textes sont meilleurs que ceux qu'ils remplacent ; ils n'ont pas
-- été relus par un humain pour autant. `translation_status.statut` reste
-- à `machine`, et le compteur de relecture continue d'annoncer zéro sur
-- 6 920. Le jour où il annoncera autre chose, ce sera vrai.
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

-- ── #1 Abidjan, le vaisseau amiral ───────────────────────
UPDATE `lounges` SET
  `description_en` = 'Opened on 6 January 2025 by the brothers Kamal and Charan Daswani. One hundred and sixty square metres: a 120 m² walk-in humidor holding over 450 Habanos references, and a 120 m² smoking lounge seating 150. Open 10am to 2am. The group has traded since 1980; its first shop was opened by Zino Davidoff himself.',
  `description_es` = 'Inaugurada el 6 de enero de 2025 por los hermanos Kamal y Charan Daswani. Ciento sesenta metros cuadrados: humidor accesible de 120 m² con más de 450 referencias de habanos, y salón de fumadores de 120 m² para 150 personas. Abierto de 10:00 a 2:00. El grupo opera desde 1980; su primera tienda la inauguró el propio Zino Davidoff.',
  `description_de` = 'Am 6. Januar 2025 von den Brüdern Kamal und Charan Daswani eröffnet. Hundertsechzig Quadratmeter: ein begehbarer Humidor von 120 m² mit über 450 Habanos-Referenzen und eine Raucherlounge von 120 m² für 150 Personen. Geöffnet von 10 bis 2 Uhr. Die Gruppe besteht seit 1980; ihr erstes Geschäft eröffnete Zino Davidoff persönlich.',
  `description_zh` = '2025 年 1 月 6 日由卡迈勒与查兰·达斯瓦尼兄弟开设。总面积一百六十平方米：一百二十平方米的步入式恒湿雪茄柜，陈列逾四百五十款哈伯纳斯；另设一百二十平方米、可容纳一百五十人的雪茄休息厅。营业时间 10:00 至次日 02:00。集团自 1980 年经营至今，首家门店由齐诺·大卫杜夫亲自揭幕。',
  `description_ar` = 'افتُتح في السادس من كانون الثاني/يناير 2025 على يد الأخوين كمال وتشاران داسواني. مئة وستون مترًا مربعًا: مستودع ترطيب يمكن دخوله بمساحة 120 م² يضمّ أكثر من 450 صنفًا من سيجار هابانوس، وصالة تدخين بمساحة 120 م² تتّسع لمئة وخمسين شخصًا. يفتح من العاشرة صباحًا حتى الثانية فجرًا. المجموعة قائمة منذ 1980، وقد افتتح زينو دافيدوف متجرها الأول بنفسه.',
  `updated_at` = NOW()
 WHERE `id` = 1 AND `country_id` = 'ivorycoast';

-- ── #2 Abidjan, Cap Sud ──────────────────────────────────
UPDATE `lounges` SET
  `description_en` = 'Opened in December 2020. The full range of Habanos brands, alongside Arturo Fuente, Davidoff, Rocky Patel, La Flor Dominicana, Plasencia and Gurkha. Accessories by Elie Bleu, Chacom and Zippo.',
  `description_es` = 'Inaugurada en diciembre de 2020. Toda la gama de marcas Habanos, junto a Arturo Fuente, Davidoff, Rocky Patel, La Flor Dominicana, Plasencia y Gurkha. Accesorios de Elie Bleu, Chacom y Zippo.',
  `description_de` = 'Im Dezember 2020 eröffnet. Das gesamte Habanos-Sortiment sowie Arturo Fuente, Davidoff, Rocky Patel, La Flor Dominicana, Plasencia und Gurkha. Accessoires von Elie Bleu, Chacom und Zippo.',
  `updated_at` = NOW()
 WHERE `id` = 2 AND `country_id` = 'ivorycoast';

-- ── #36 Hambourg, et non Porto ───────────────────────────
UPDATE `lounges` SET
  `description_en` = 'A historic port-wine merchant''s shopfront, and an official Habanos specialist. The full range of Cuban cigars. Pairings with Prime''s Rum (a Caribbean blend) and more than 150 vintage ports and madeiras, one of them from 1870. A future member of the La Casa del Habano network.',
  `description_es` = 'Antigua fachada de comerciante de oporto, y especialista oficial de Habanos. Toda la gama de puros cubanos. Maridajes con Prime''s Rum (mezcla caribeña) y más de 150 oportos y madeiras añejos, uno de ellos de 1870. Futuro miembro de la red La Casa del Habano.',
  `description_de` = 'Historische Fassade eines Portweinhändlers und offizieller Habanos-Spezialist. Das vollständige Sortiment kubanischer Zigarren. Pairings mit Prime''s Rum (karibischer Blend) und über 150 gereiften Portweinen und Madeiras, darunter ein 1870er. Künftiges Mitglied des La-Casa-del-Habano-Netzes.',
  `description_zh` = '门面沿用旧时波特酒商行的样式，为哈伯纳斯官方认证专门店。古巴雪茄品类齐全。可搭配 Prime''s Rum（加勒比调和朗姆），以及逾一百五十款陈年波特与马德拉，其中一款为 1870 年份。将加入 La Casa del Habano 网络。',
  `description_ar` = 'واجهة تاريخية لتاجر نبيذ بورتو، ومتجر متخصّص معتمد من هابانوس. تشكيلة كاملة من السيجار الكوبي. مزاوجات مع Prime''s Rum (مزيج كاريبي) وأكثر من مئة وخمسين صنفًا من نبيذ بورتو والماديرا المعتّق، أحدها من عام 1870. عضو مرتقب في شبكة لا كاسا ديل هابانو.',
  `updated_at` = NOW()
 WHERE `id` = 36 AND `country_id` = 'germany';

-- ── #120 Tokyo, la phrase restée française ───────────────
UPDATE `lounges` SET
  `description_en` = 'A rock-themed cigar bar in the Cerulean Tower Hotel. Two hundred and seventy cigars across forty-five vitolas, from Cuba and the Dominican Republic: Davidoff, Cohiba, Montecristo, Partagás. Japanese single malts and cognacs. Open from 4pm to midnight.',
  `description_es` = 'Bar de puros de ambiente rock en el Cerulean Tower Hotel. Doscientos setenta puros de cuarenta y cinco vitolas, de Cuba y la República Dominicana: Davidoff, Cohiba, Montecristo, Partagás. Whiskies japoneses single malt y coñacs. Abierto de 16:00 a medianoche.',
  `description_de` = 'Zigarrenbar im Rock-Stil im Cerulean Tower Hotel. Zweihundertsiebzig Zigarren in fünfundvierzig Formaten, aus Kuba und der Dominikanischen Republik: Davidoff, Cohiba, Montecristo, Partagás. Japanische Single Malts und Cognacs. Geöffnet von 16 Uhr bis Mitternacht.',
  `description_zh` = '位于策乐音大厦酒店内的摇滚主题雪茄吧。备有来自古巴与多米尼加的四十五种规格、共二百七十支雪茄：大卫杜夫、高希霸、蒙特克里斯托、帕特加斯。另供应日本单一麦芽威士忌与干邑。营业时间 16:00 至午夜。',
  `description_ar` = 'بار سيجار بطابع الروك داخل فندق سيروليان تاور. مئتان وسبعون سيجارًا من خمسة وأربعين قياسًا، من كوبا وجمهورية الدومينيكان: دافيدوف، كوهيبا، مونتيكريستو، بارتاغاس. ويسكي ياباني سينغل مولت وكونياك. يفتح من الرابعة عصرًا حتى منتصف الليل.',
  `updated_at` = NOW()
 WHERE `id` = 120 AND `country_id` = 'japan';

-- ── #411 Miami : la franchise affirmée en quatre langues ─
UPDATE `lounges` SET
  `description`    = 'Le concept store amiral de General Cigar, à Miami. La plus grande cave humidifiée accessible du sud de la Floride, fauteuils de salon haut de gamme, et l''ensemble du portefeuille des grandes marques.',
  `description_en` = 'General Cigar''s flagship concept store in Miami. The largest walk-in humidor in South Florida, premium lounge seating, and the full portfolio of the major brands.',
  `description_es` = 'La tienda insignia de General Cigar en Miami. El mayor humidor accesible del sur de Florida, butacas de salón de alta gama y toda la cartera de las grandes marcas.',
  `description_de` = 'Der Flagship-Concept-Store von General Cigar in Miami. Der größte begehbare Humidor Südfloridas, hochwertige Loungesessel und das gesamte Portfolio der großen Marken.',
  `description_zh` = 'General Cigar 在迈阿密的旗舰概念店。设有南佛罗里达最大的步入式恒湿雪茄柜、高级休息区座席，并陈列各大品牌的完整产品线。',
  `description_ar` = 'المتجر الرئيسي لمفهوم General Cigar في ميامي. أكبر مستودع ترطيب يمكن دخوله في جنوب فلوريدا، ومقاعد صالة فاخرة، وتشكيلة كاملة من كبرى العلامات.',
  `updated_at` = NOW()
 WHERE `id` = 411 AND `country_id` = 'usa';

-- ── Les sceaux, recalculés depuis les colonnes ───────────
UPDATE `translation_status` t
  JOIN `lounges` l ON l.`id` = t.`entite_id`
   SET t.`source_hash` = SHA1(l.`description`), t.`statut` = 'machine', t.`maj` = NOW()
 WHERE t.`entite` = 'lounges' AND t.`champ` = 'description'
   AND t.`entite_id` IN ('1','2','36','120','411');

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 157','systeme','traductions_refaites','lounge',0,
   '5 fiches traduites par substitution mot a mot : #1, #2, #36, #120, #411. Le francais restait dans les colonnes en/es/de/zh/ar — aucun des trois controles i18n ne cherchait cela'),
  (NULL,'migration 157','systeme','affiliation_retiree','lounge',411,
   'les colonnes es, de, zh et ar affirmaient « La Casa del Habano » pour le Casa de Montecristo de General Cigar : une franchise Habanos que le francais n affirme pas et que rien n atteste. La faute des migrations 141-155, survivante dans la prose traduite'),
  (NULL,'migration 157','systeme','sens_corrige','lounge',36,
   'Duske & Duske est a HAMBOURG. « marchand de Porto » (le vin) etait traduit par la VILLE : « merchant in Porto », « comerciante en Oporto ». La boutique changeait de pays en changeant de langue'),
  (NULL,'migration 157','systeme','mention_retiree','lounge',411,
   'la description situait la boutique « quartier de Brickell », l adresse dit « 1535 NW 79th Ave, Doral » — vingt kilometres d ecart, rien ne permet de trancher. Mention retiree des six langues plutot que multipliee par quatre'),
  (NULL,'migration 157','systeme','faux_positifs','lounge',0,
   'la premiere sonde signalait aussi #36 et #282 : leurs traductions ecrivent « La Casa del Habano » la ou le francais dit « reseau LCDH » et « specialiste des Habanos ». Traduction fidele d un acronyme, pas un fait ajoute. Non touchees');
