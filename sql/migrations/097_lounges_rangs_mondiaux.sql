-- ════════════════════════════════════════════════════════
-- 097 — Les rangs mondiaux de `lounges`, triés un par un
-- ────────────────────────────────────────────────────────
-- Onze occurrences sur sept fiches. Contrairement aux lots précédents,
-- il n'y avait pas de motif à appliquer : un rang mondial sur un
-- ÉTABLISSEMENT n'est pas de la réclame de la même façon qu'un rang sur
-- un cigare. Chaque cas a été jugé séparément.
--
-- ── CE QU'ON GARDE ──────────────────────────────────────
--
-- #688 « la plus haute tour de Corée » — le Lotte World Tower culmine à
-- 555 m et c'est bien le plus haut bâtiment de Corée du Sud. Un rang
-- national, vérifiable, sur une structure : il reste.
--
-- ── CE QU'ON RETIRE, ET POURQUOI ────────────────────────
--
-- #1390 « L'hôtel le plus luxueux du monde (7 étoiles) ». Aucun système
--       de classement hôtelier ne compte sept étoiles : le Burj Al Arab
--       est officiellement cinq étoiles de luxe. C'est de la réclame,
--       reprise à son compte.
-- #100  « le plus grand centre commercial du monde ». Contesté selon la
--       mesure retenue — surface totale, surface commerciale, nombre de
--       boutiques. Et le Dubai Mall n'a pas besoin d'un superlatif.
-- #47   « Le plus ancien cigare merchant au monde ». La maison le dit
--       d'elle-même. La date de fondation — 1787 — est vérifiable et
--       porte davantage. (« cigare merchant » n'était par ailleurs ni du
--       français ni de l'anglais.)
-- #1507 « le club de golf le plus célèbre au monde », #1509 « l'un des
--       golfs les plus célèbres », #2535 « les expériences cigare les
--       plus hautes du monde » : la célébrité et la hauteur d'une
--       terrasse ne se mesurent pas. Les faits restent (le Masters,
--       le Pacifique, 3 400 m).
-- #1612 « selon les classements internationaux » a l'apparence d'une
--       source, mais ne nomme aucun classement. Le fait géographique —
--       le sandbelt de Melbourne — vaut mieux.
--
-- ── ET TROIS FICHES QUI N'ÉTAIENT PAS TRADUITES ─────────
--
-- Trouvées en relisant les six colonnes avant d'écrire. Signature
-- différente de celle de la migration 095 : ici, ce ne sont pas des mots
-- cassés mais des LOCUTIONS FRANÇAISES entières laissées en place.
--
--   #100 zh : « 大卫杜夫旗舰店 位于plus grand 购物中心 du monde. »
--   #121 en : « Cigar lounges au 45e étage du bâtiment le plus haut
--              de Tokyo. Vue panoramique sur la ville. Humidor soigné. »
--              — deux mots traduits sur seize.
--   #688 zh : « 哈瓦那之家 au 5e étage 的Lotte World Tower »
--
-- Le détecteur de la 095 ne pouvait pas les voir : il cherche un mot
-- français cassé par substitution, pas une locution intacte. Six valeurs
-- au total, toutes dans `lounges`. Mesuré sur les neuf tables de
-- `plan_contenu()` : `brands`, `feuilles`, `producer_countries` et les
-- autres sont indemnes.
--
-- ── UNE PHRASE DEVENUE FAUSSE ───────────────────────────
--
-- #121 « le bâtiment le plus haut de Tokyo » désignait la tour Tokyo
-- Midtown (248 m), exacte de 2007 à 2023. Depuis, Azabudai Hills Mori JP
-- Tower culmine à 330 m. Le superlatif n'est pas seulement invérifiable
-- ici : il a cessé d'être vrai. Un rang est daté même quand il est juste.
-- ════════════════════════════════════════════════════════

-- ── #47 — James J. Fox, Londres ─────────────────────────
UPDATE `lounges` SET
  `description` = 'Maison fondée en 1787 par Robert Lewis, réunie à James J. Fox en 1992. Salon de dégustation de 27 places au premier étage, musée Churchill au sous-sol. Clients historiques : Winston Churchill — sa dernière commande date du 23 décembre 1964 — et Oscar Wilde. L''un des rares lieux du Royaume-Uni où l''on peut fumer à l''intérieur, au titre de l''exemption accordée aux buralistes spécialisés.',
  `description_en` = 'Founded in 1787 by Robert Lewis and merged with James J. Fox in 1992. A 27-seat tasting lounge on the first floor, a Churchill museum in the basement. Historic customers: Winston Churchill — his last order dated 23 December 1964 — and Oscar Wilde. One of the few places in the UK where you may smoke indoors, under the exemption granted to specialist tobacconists.',
  `description_es` = 'Casa fundada en 1787 por Robert Lewis y unida a James J. Fox en 1992. Salón de degustación de 27 plazas en la primera planta y museo Churchill en el sótano. Clientes históricos: Winston Churchill —su último pedido data del 23 de diciembre de 1964— y Oscar Wilde. Uno de los pocos lugares del Reino Unido donde se puede fumar en interior, al amparo de la exención concedida a los estancos especializados.',
  `description_de` = '1787 von Robert Lewis gegründet, 1992 mit James J. Fox zusammengeführt. Verkostungslounge mit 27 Plätzen im ersten Stock, Churchill-Museum im Untergeschoss. Historische Kunden: Winston Churchill — seine letzte Bestellung datiert vom 23. Dezember 1964 — und Oscar Wilde. Einer der wenigen Orte im Vereinigten Königreich, an denen drinnen geraucht werden darf, dank der Ausnahme für Fachhändler.',
  `description_zh` = '1787 年由 Robert Lewis 创立，1992 年与 James J. Fox 合并。二楼设 27 座品鉴厅，地下层设丘吉尔博物馆。历史客户包括温斯顿·丘吉尔——他最后一笔订单为 1964 年 12 月 23 日——与奥斯卡·王尔德。依照给予专业烟草商的豁免，这里是英国少数可在室内吸烟的场所之一。',
  `description_ar` = 'أسّسها روبرت لويس عام 1787 واندمجت مع «جيمس ج. فوكس» عام 1992. صالة تذوّق بسبعة وعشرين مقعدًا في الطابق الأول، ومتحف تشرشل في الطابق السفلي. من زبائنها التاريخيين ونستون تشرشل — وآخر طلبية له بتاريخ 23 ديسمبر 1964 — وأوسكار وايلد. وبفضل الاستثناء الممنوح لتجار التبغ المتخصّصين، هي من الأماكن القليلة في المملكة المتحدة التي يُسمح فيها بالتدخين داخل المبنى.'
WHERE `id` = 47;

-- ── #100 — Davidoff, Dubai Mall (+ zh et ar non traduits) ─
UPDATE `lounges` SET
  `description` = 'Boutique amirale Davidoff au Dubai Mall. Cave humidifiée et salon privé.',
  `description_en` = 'Davidoff flagship store at the Dubai Mall. Humidified cellar and private lounge.',
  `description_es` = 'Tienda insignia de Davidoff en el Dubai Mall. Bodega humidificada y salón privado.',
  `description_de` = 'Davidoff-Flagship-Store in der Dubai Mall. Humidorraum und privater Lounge-Bereich.',
  `description_zh` = '大卫杜夫在迪拜购物中心的旗舰店。设恒湿雪茄库与私人休息室。',
  `description_ar` = 'متجر دافيدوف الرئيس في «دبي مول». مخزن ترطيب وصالة خاصة.'
WHERE `id` = 100;

-- ── #121 — Ritz-Carlton Tokyo (en, zh, ar non traduits) ──
UPDATE `lounges` SET
  `description` = 'Salon cigares au 45e étage de la tour Tokyo Midtown. Vue panoramique sur la ville, cave humidifiée soignée.',
  `description_en` = 'Cigar lounge on the 45th floor of the Tokyo Midtown tower. Panoramic views over the city and a well-kept humidified cellar.',
  `description_es` = 'Salón de puros en la planta 45 de la torre Tokyo Midtown. Vistas panorámicas de la ciudad y bodega humidificada cuidada.',
  `description_de` = 'Zigarrenlounge im 45. Stock des Tokyo-Midtown-Turms. Panoramablick über die Stadt und ein sorgfältig gepflegter Humidorraum.',
  `description_zh` = '位于东京中城大厦 45 层的雪茄休息室。可全景俯瞰城市，恒湿雪茄库打理得当。',
  `description_ar` = 'صالة سيجار في الطابق الخامس والأربعين من برج «طوكيو ميدتاون». إطلالة بانورامية على المدينة، ومخزن ترطيب مُعتنى به.'
WHERE `id` = 121;

-- ── #688 — La Casa del Habano, Lotte World Tower ─────────
-- Le rang national reste : il est vérifiable.
UPDATE `lounges` SET
  `description` = 'La Casa del Habano au 5e étage de la Lotte World Tower, la plus haute tour de Corée du Sud.',
  `description_en` = 'La Casa del Habano on the fifth floor of the Lotte World Tower, South Korea''s tallest building.',
  `description_es` = 'La Casa del Habano en la quinta planta de la Lotte World Tower, la torre más alta de Corea del Sur.',
  `description_de` = 'La Casa del Habano im fünften Stock des Lotte World Tower, des höchsten Gebäudes Südkoreas.',
  `description_zh` = '哈瓦那之家位于乐天世界大厦 5 层——韩国最高的摩天楼。',
  `description_ar` = '«لا كاسا ديل هابانو» في الطابق الخامس من برج «لوتّي وورلد»، أعلى برج في كوريا الجنوبية.'
WHERE `id` = 688;

-- ── #1390 — Burj Al Arab ────────────────────────────────
UPDATE `lounges` SET
  `description` = 'Hôtel emblématique de Dubaï, sur son île artificielle. Skyview Bar au 27e étage : sélection de habanos, vue à 360° sur la ville et la mer.',
  `description_en` = 'Dubai''s landmark hotel, on its own artificial island. The Skyview Bar on the 27th floor: a selection of Habanos and 360° views over the city and the sea.',
  `description_es` = 'Hotel emblemático de Dubái, sobre su isla artificial. Skyview Bar en la planta 27: selección de habanos y vistas de 360° a la ciudad y al mar.',
  `description_de` = 'Dubais Wahrzeichen-Hotel auf seiner künstlichen Insel. Die Skyview Bar im 27. Stock: eine Auswahl an Habanos und 360°-Blick über Stadt und Meer.',
  `description_zh` = '迪拜的地标酒店，建于人工岛上。27 层 Skyview 酒吧备有哈瓦那雪茄精选，可 360 度俯瞰城市与海景。',
  `description_ar` = 'فندق دبي الأيقوني القائم على جزيرته الاصطناعية. بار «سكاي فيو» في الطابق السابع والعشرين: تشكيلة من سيجار هابانوس وإطلالة بزاوية 360 درجة على المدينة والبحر.'
WHERE `id` = 1390;

-- ── #1507 — Augusta National ────────────────────────────
UPDATE `lounges` SET
  `description` = 'Club de golf d''Augusta, hôte du Masters. Salon des membres où l''on fume traditionnellement après le parcours — accès sur invitation uniquement.',
  `description_en` = 'The Augusta golf club, host of the Masters. A members'' lounge where a cigar after the round is tradition — access by invitation only.',
  `description_es` = 'Club de golf de Augusta, sede del Masters. Salón de socios donde el puro tras la vuelta es tradición; acceso solo por invitación.',
  `description_de` = 'Der Golfclub von Augusta, Austragungsort des Masters. Members'' Lounge, in der die Zigarre nach der Runde Tradition hat — Zutritt nur auf Einladung.',
  `description_zh` = '奥古斯塔高尔夫俱乐部，美国大师赛主办场地。会员厅中，球局后点一支雪茄是传统——仅限受邀者进入。',
  `description_ar` = 'نادي أوغستا للغولف، مضيف بطولة الماسترز. صالة الأعضاء حيث تدخين السيجار بعد الجولة تقليد راسخ — الدخول بدعوة فقط.'
WHERE `id` = 1507;

-- ── #1509 — Pebble Beach ────────────────────────────────
UPDATE `lounges` SET
  `description` = 'Parcours de bord de mer face à l''océan Pacifique. Tap Room et sa sélection de cigares, dégustation au coucher du soleil sur le green du 18.',
  `description_en` = 'A links course on the Pacific shore. The Tap Room and its cigar selection, with sunset tastings on the 18th green.',
  `description_es` = 'Campo costero frente al océano Pacífico. El Tap Room y su selección de puros, con degustación al atardecer en el green del 18.',
  `description_de` = 'Küstenplatz direkt am Pazifik. Der Tap Room mit seiner Zigarrenauswahl und Verkostung bei Sonnenuntergang auf dem 18. Grün.',
  `description_zh` = '正对太平洋的海滨球场。Tap Room 备有雪茄精选，可在第 18 洞果岭上迎着落日品鉴。',
  `description_ar` = 'ملعب ساحلي يطلّ على المحيط الهادئ. صالة «تاب روم» بتشكيلتها من السيجار، وتذوّق عند الغروب على غرين الحفرة الثامنة عشرة.'
WHERE `id` = 1509;

-- ── #1612 — Royal Melbourne ─────────────────────────────
UPDATE `lounges` SET
  `description` = 'Parcours du sandbelt de Melbourne, dans la brousse australienne. Spike Bar, où l''on fume traditionnellement après le parcours.',
  `description_en` = 'A Melbourne Sandbelt course, set in the Australian bush. The Spike Bar, where a cigar after the round is tradition.',
  `description_es` = 'Campo del Sandbelt de Melbourne, en pleno bush australiano. Spike Bar, donde el puro tras la vuelta es tradición.',
  `description_de` = 'Ein Platz im Melbourne Sandbelt, im australischen Buschland. Die Spike Bar, in der die Zigarre nach der Runde Tradition hat.',
  `description_zh` = '位于墨尔本沙带的球场，坐落在澳洲丛林之中。Spike Bar 中，球局后点一支雪茄是传统。',
  `description_ar` = 'ملعب في «الحزام الرملي» بملبورن، وسط الأدغال الأسترالية. صالة «سبايك بار» حيث تدخين السيجار بعد الجولة تقليد.'
WHERE `id` = 1612;

-- ── #2535 — Hotel Monasterio, Cusco ─────────────────────
UPDATE `lounges` SET
  `description` = 'Terrasse cigares de l''Hotel Monasterio, installé dans un monastère jésuite du XVIe siècle, à 3 400 mètres d''altitude. Habanos aux portes du Machu Picchu.',
  `description_en` = 'The cigar terrace of the Hotel Monasterio, housed in a 16th-century Jesuit monastery at 3,400 metres. Habanos at the gateway to Machu Picchu.',
  `description_es` = 'Terraza de puros del Hotel Monasterio, instalado en un monasterio jesuita del siglo XVI a 3400 metros de altitud. Habanos a las puertas del Machu Picchu.',
  `description_de` = 'Die Zigarrenterrasse des Hotel Monasterio in einem Jesuitenkloster des 16. Jahrhunderts auf 3400 Metern Höhe. Habanos am Tor zum Machu Picchu.',
  `description_zh` = 'Monasterio 酒店的雪茄露台，坐落于海拔 3400 米的 16 世纪耶稣会修道院内。在通往马丘比丘的门户享用哈瓦那雪茄。',
  `description_ar` = 'تراس السيجار في فندق «موناستيريو»، القائم في دير يسوعي من القرن السادس عشر على ارتفاع 3400 متر. سيجار هابانوس عند بوابة ماتشو بيتشو.'
WHERE `id` = 2535;
