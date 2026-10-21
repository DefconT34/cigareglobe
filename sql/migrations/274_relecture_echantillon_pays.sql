-- ════════════════════════════════════════════════════════
-- 274 — Relecture d'un échantillon de traductions : huit pays, es/de/zh/ar
-- ────────────────────────────────────────────────────────
-- POURQUOI. Essai demandé avant de décider d'un noindex sur es/de/zh/ar : l'agent
-- expert-traduction a relu, contre le français, les champs `notes` et `production` de huit
-- pays (Cuba, Nicaragua, République dominicaine, Honduras, États-Unis, Mexique, Équateur,
-- Brésil) : 64 textes, 11 corrigés (es 0, de 1, zh 4, ar 6). Aucun contresens, aucun chiffre,
-- aucune date ni aucun nom propre altéré ; les défauts sont des superlatifs interdits en zh et
-- en ar, deux ajouts de sens en zh, « 80百万 », la relative fautive d'Équateur en de, le faux
-- ami « سيجارات » (pluriel de cigarette) dans la fiche Nicaragua. Les 64 textes passent au
-- statut `relu`, signé de l'agent, sceaux recalculés depuis le français. Le mot « سيجارات »
-- n'est pas balayé à la machine : 120 occurrences, dont beaucoup accordées en genre avec leur
-- adjectif, qu'un remplacement aveugle casserait.
-- ════════════════════════════════════════════════════════

UPDATE `producer_countries` SET `production_zh` = 'Habanos 公布营业额，不公布产量。Tabacuba 总裁宣布的2025年目标：工厂产出超过8000万支雪茄，其中出口超过7000万支（2025年6月）。' WHERE `id` = 'cuba';
UPDATE `producer_countries` SET `notes_ar` = 'نحو ستة من كل عشرة أعواد سيجار فاخرة تستوردها الولايات المتحدة تأتي من هنا.' WHERE `id` = 'nicaragua';
UPDATE `producer_countries` SET `notes_zh` = '圣地亚哥与西宝谷集中了全国的大型雪茄工厂。' WHERE `id` = 'dominican';
UPDATE `producer_countries` SET `notes_ar` = 'تتركّز في سانتياغو ووادي سيباو المصانع الكبرى في البلاد.' WHERE `id` = 'dominican';
UPDATE `producer_countries` SET `notes_ar` = 'خاماستران — كوروخو ذائع الصيت خارج كوبا.' WHERE `id` = 'honduras';
UPDATE `producer_countries` SET `notes_zh` = '哈马斯特兰 —— 古巴以外声名卓著的 Corojo。' WHERE `id` = 'honduras';
UPDATE `producer_countries` SET `notes_zh` = '圣安德烈斯 —— maduro 茄衣的标杆。\\n\\n西班牙语媒体描述了：在图伦特家族和 Santa Clara——据《Diario de Xalapa》2023年报道，六十人、多为女性、每天至少两千五百支——之外，还有西瓦潘的 Tabacalera R. Paxtián，四代种植者；并且在韦拉克鲁斯之外，还描述了克雷塔罗州埃塞基耶尔蒙特斯的 Cházaro，它用河谷匠人卷制圣安德烈斯烟叶。圣安德烈斯的 Don Chicho 只有一处提及：未写。' WHERE `id` = 'mexico';
UPDATE `producer_countries` SET `notes_ar` = 'الغطاء السحابي الدائم يحلّ هنا محلّ أقمشة التظليل.\\n\\nمن يلفّ في الإكوادور، بلد الغلاف بامتياز؟ ثلاث ورش في غواياكيل لم تصفها سوى صحيفة Expreso اليومية — Real Fábrica de Cigarros La Clemencia في إل فورتين، لأتيليانو كاستيّانو وإدواردو خورادو، نحو ثلاثة آلاف سيجار في الشهر سنة 2020 تحت علامة Guayacos؛ وورشة فرانكلين كويّو في جنوب المدينة، علامات Equinoccial وLibertador وRumiñahui تُباع في المطار؛ وHacienda Real لخيوفاني ليون، ما يزيد على عشرين عامًا سنة 2022، خمسة أشخاص، صدّرت يومًا إلى فرنسا وألمانيا وإسبانيا. وأُغلقت مجموعة Aray نحو 2015. مصدر واحد لكلّ ورشة: تُسمّى هنا من غير بطاقة ما دام المصدر الثاني غائبًا.' WHERE `id` = 'ecuador';
UPDATE `producer_countries` SET `notes_de` = 'Die ständige Wolkendecke ersetzt hier die Schattentücher.\\n\\nWer rollt in Ecuador, dem Deckblattland schlechthin? Drei Werkstätten in Guayaquil, die allein die Tageszeitung Expreso beschrieben hat — die Real Fábrica de Cigarros La Clemencia in El Fortín von Atiliano Castellano und Eduardo Jurado, etwa dreitausend Zigarren im Monat 2020 unter der Marke Guayacos; die Werkstatt von Franklin Coello im Süden der Stadt, Marken Equinoccial, Libertador und Rumiñahui, am Flughafen verkauft; Hacienda Real von Geovanny León, 2022 seit über zwanzig Jahren bestehend, fünf Personen; sie exportierte einst nach Frankreich, Deutschland und Spanien. Die Gruppe Aray schloss um 2015. Eine Quelle je Werkstatt: Sie werden hier genannt, ohne Eintrag, solange eine zweite Quelle fehlt.' WHERE `id` = 'ecuador';
UPDATE `producer_countries` SET `notes_zh` = '此地终年云层替代了遮阳布。\\n\\n谁在厄瓜多尔——堪称茄衣之国——卷制雪茄？瓜亚基尔的三家作坊，只有《Expreso》日报描述过——El Fortín 区的 Real Fábrica de Cigarros La Clemencia，属于阿蒂利亚诺·卡斯特利亚诺和爱德华多·胡拉多，2020年每月约三千支，品牌 Guayacos；城南弗兰克林·科埃略的作坊，品牌 Equinoccial、Libertador、Rumiñahui，在机场销售；赫奥瓦尼·莱昂的 Hacienda Real，2022年时已逾二十年，五人，曾出口法国、德国和西班牙。Aray 集团约2015年关闭。每家作坊只有一个来源：它们在此点名，第二个来源尚缺时不设词条。' WHERE `id` = 'ecuador';
UPDATE `producer_countries` SET `notes_ar` = 'ماتا فينا — تبغ مادورو من ولاية باهيا، يُقدَّر لحلاوته الخشبية.\\n\\nيضمّ ريكونكافو نحو عشرة مصانع، تقول الصحافة البرتغالية — كروز داس ألماس وكاشويرا وساو فيليكس وساو غونسالو دوس كامبوس وغوفيرنادور مانغابيرا وموريتيبا — وألاغوينياس مصنعين أبعد شمالًا؛ ويصنع أربعة مصنّعين نحو 85 % من القطاع الحرفي، كما تقول Apcab التي كانت تحمل سنة 2026 إلى معهد INPI تسمية منشأ لتبغ ماتا فينا وسيجار ريكونكافو الحرفي. ولا تُعرف أيّ ورشة لفّ يدوي خارج باهيا — لا في الجنوب ولا في ساو باولو.' WHERE `id` = 'brazil';

UPDATE `translation_status` t JOIN `producer_countries` p ON p.`id` = t.`entite_id` AND t.`entite` = 'producer_countries' AND t.`champ` = 'notes'
   SET t.`source_hash` = SHA1(p.`notes`), t.`statut` = 'relu', t.`relecteur` = 'expert-traduction (agent)', t.`maj` = NOW()
 WHERE p.`id` IN ('cuba', 'nicaragua', 'dominican', 'honduras', 'usa', 'mexico', 'ecuador', 'brazil') AND t.`lang` IN ('es','de','zh','ar');
UPDATE `translation_status` t JOIN `producer_countries` p ON p.`id` = t.`entite_id` AND t.`entite` = 'producer_countries' AND t.`champ` = 'production'
   SET t.`source_hash` = SHA1(p.`production`), t.`statut` = 'relu', t.`relecteur` = 'expert-traduction (agent)', t.`maj` = NOW()
 WHERE p.`id` IN ('cuba', 'nicaragua', 'dominican', 'honduras', 'usa', 'mexico', 'ecuador', 'brazil') AND t.`lang` IN ('es','de','zh','ar');

-- ── Contrôle ──
SELECT (SELECT COUNT(*) FROM `translation_status` WHERE `entite` = 'producer_countries' AND `entite_id` IN ('cuba', 'nicaragua', 'dominican', 'honduras', 'usa', 'mexico', 'ecuador', 'brazil') AND `champ` IN ('notes','production') AND `lang` IN ('es','de','zh','ar') AND `statut` = 'relu') = 64 AS soixante_quatre_relues,
       (SELECT COUNT(*) FROM `producer_countries` WHERE `notes_zh` LIKE '%首屈一指%' OR `production_zh` LIKE '%80百万%') = 0 AS zh_nettoye;
