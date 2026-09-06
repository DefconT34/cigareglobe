-- ════════════════════════════════════════════════════════
-- 167 — Ce qu'un pays producteur porte, et qui manquait
-- ────────────────────────────────────────────────────────
-- LA MIGRATION 165 A OUVERT UN PAYS SANS REGARDER TOUT CE QU'UN PAYS
-- PORTE. Un recensement des tables à clé pays le montre :
--
--   table              couverture des 17   Côte d'Ivoire
--   ─────────────────  ─────────────────   ─────────────
--   brands                    17/17        1
--   producer_geo              16/17        ABSENTE  ← le seul trou
--   lounges                   16/17        14         universel
--   production_zones          16/17        3
--   feuilles                  15/17        ABSENTE
--   habanos_presence          12/17        ABSENTE
--
-- `producer_geo` EST LA SEULE TABLE QUE LES SEIZE PAYS PRODUCTEURS
-- PRÉCÉDENTS ONT TOUS. La Côte d'Ivoire en était la seule exception, et
-- c'est moi qui l'ai créée en ouvrant le pays sans elle. Les deux autres
-- sont facultatives — Costa Rica n'a pas de feuille, cinq pays n'ont pas
-- de fiche Habanos — mais il y a de quoi les remplir sans rien inventer.
--
-- ── 1. LES DONNÉES GÉNÉRALES ─────────────────────────────
-- Source : fiche pays du ministère français des Affaires étrangères
-- (diplomatie.gouv.fr) — superficie 322 463 km², population 32 M (2025),
-- PIB 87,11 Md$ (2024), capitale Yamoussoukro, français, franc CFA.
--
-- DEUX PIÈGES ÉVITÉS :
--   · LA MONNAIE N'EST PAS CELLE DU CAMEROUN. Les deux disent « franc
--     CFA », mais le Cameroun est en XAF (Afrique centrale) et la Côte
--     d'Ivoire en XOF (Afrique de l'Ouest). Ce sont deux monnaies
--     distinctes, de même parité. data.pays.js portait déjà « CI: XOF ».
--   · LA CAPITALE EST YAMOUSSOUKRO, et le champ le dit — mais les
--     quatorze adresses de l'atlas et l'atelier du Fagot sont à ABIDJAN.
--     Le champ porte donc les deux, comme les Canaries portent déjà
--     « Las Palmas / Santa Cruz ». Un lecteur qui ne lirait que
--     « Yamoussoukro » ne comprendrait pas la carte.
--
-- ── 2. DEUX FEUILLES, ET CE QU'ELLES N'ONT PAS ───────────
-- Les feuilles de l'atlas portent des NOMS DE LIEUX — « Arapiraca »,
-- « Mata Fina » —, jamais des noms de variétés. Tiébissou et Didiévi
-- suivent cette règle.
--
-- Elles sont PLUS MAIGRES que les trente autres, et c'est assumé :
-- `caracteres`, `notes` et `pairings` restent vides. Les caves décrivent
-- des arômes boisés et floraux pour L'ASSEMBLAGE des deux feuilles, pas
-- pour chacune ; les répartir serait inventer. La genèse dit ce qu'on
-- sait et ce qu'on ne sait pas, plutôt que de meubler.
--
-- ── 3. LA FICHE HABANOS ──────────────────────────────────
-- Sur le patron du Cameroun et du Brésil : `present` = 0, un statut qui
-- dit pourquoi le pays est là malgré tout. Ni chiffre d'affaires, ni
-- effectif, ni dirigeant, ni distributeur, ni certification — rien de
-- tout cela n'est documenté. Le festival dit « aucun », comme au
-- Cameroun.
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

-- ── Les données générales ────────────────────────────────
INSERT INTO `producer_geo`
  (`country_id`, `capital`, `population`, `area`, `currency`, `language`, `timezone`, `gdp`, `independent`)
VALUES
  ('ivorycoast', 'Yamoussoukro (Abidjan, siège du gouvernement)', '32,0 M (2025)',
   '322 463 km²', 'Franc CFA (XOF)', 'Français', 'UTC+0', '87,1 Md$ (2024)', '1960');

-- ── ET UNE LECTURE DE MA PART QUI ÉTAIT FAUSSE ──────────
-- La migration 165 a laissé `varieties` vide en le comptant parmi les
-- trous, au motif qu'« aucune source ne donne la variété ». C'était une
-- MÉPRISE SUR LE CHAMP : `varieties` ne porte pas le cultivar botanique,
-- il porte LES TABACS NOMMÉS DU PAYS — le Brésil y met « Mata Fina »,
-- « Mata Norte », « Arapiraca », qui sont des lieux. Et c'est cette
-- liste qui rend les fiches de feuilles atteignables : coherence_check
-- a refusé les deux nouvelles feuilles, « injoignables ».
--
-- Le champ se remplit donc, sans rien affirmer de botanique. Le cultivar
-- reste inconnu, et c'est la genèse des deux feuilles qui le dit.
UPDATE `producer_countries`
   SET `varieties` = '["Tiébissou","Didiévi"]', `updated_at` = NOW()
 WHERE `id` = 'ivorycoast';

-- ── Les deux feuilles du Bélier ──────────────────────────
INSERT INTO `feuilles`
  (`id`, `name`, `country_id`, `emploi`, `emploi_en`, `emploi_es`, `emploi_de`, `emploi_zh`, `emploi_ar`,
   `genese`, `genese_en`, `genese_es`, `genese_de`, `genese_zh`, `genese_ar`,
   `culture`, `culture_en`, `culture_es`, `culture_de`, `culture_zh`, `culture_ar`)
VALUES
  ('cote-d-ivoire-tiebissou', 'Tiébissou', 'ivorycoast',
   'Cape', 'Wrapper', 'Capa', 'Deckblatt', '茄衣', 'غلاف خارجي',

   'Feuille du département de Tiébissou, au centre de la Côte d''Ivoire. Elle n''est connue que par le cigare qu''elle habille : les caves d''Abidjan qui vendent Le Fagot lui attribuent la cape. Aucune documentation agricole du tabac dans le Bélier n''a été trouvée, et la variété n''est indiquée nulle part.',
   'A leaf from the Tiébissou department, in central Côte d''Ivoire. It is known only through the cigar it dresses: the Abidjan merchants who sell Le Fagot credit it with the wrapper. No agricultural record of tobacco in the Bélier has been found, and the variety is stated nowhere.',
   'Hoja del departamento de Tiébissou, en el centro de Costa de Marfil. Solo se la conoce por el puro que viste: las tiendas de Abiyán que venden Le Fagot le atribuyen la capa. No se ha encontrado documentación agrícola del tabaco en Bélier, y la variedad no se indica en ninguna parte.',
   'Ein Blatt aus dem Departement Tiébissou im Landesinneren der Elfenbeinküste. Bekannt ist es nur durch die Zigarre, die es umhüllt: Die Händler in Abidjan, die den Fagot führen, schreiben ihm das Deckblatt zu. Ein landwirtschaftlicher Nachweis für Tabak im Bélier wurde nicht gefunden, und die Sorte wird nirgends genannt.',
   '产自科特迪瓦中部蒂耶比苏省的烟叶。人们只能通过它所包裹的雪茄认识它：阿比让经销 Le Fagot 的雪茄行称其为茄衣。贝利耶地区并无可查的烟草农业记录，品种也无处提及。',
   'ورقة من مقاطعة تييبيسو وسط ساحل العاج. لا تُعرف إلّا من خلال السيجار الذي تكسوه: فمتاجر أبيدجان التي تبيع فاغو تنسب إليها الغلاف الخارجي. ولم يُعثر على أي توثيق زراعي للتبغ في بيلييه، ولا يُذكر الصنف في أي موضع.',

   'Le Bélier connaît un climat baouléen, tropical humide de transition, avec deux saisons des pluies et 1 000 à 1 400 mm par an. Les sols y sont ferrallitiques, sur un substratum essentiellement granitique.',
   'The Bélier has a Baoulé-type climate, a humid tropical transition with two rainy seasons and 1,000 to 1,400 mm a year. Its soils are ferrallitic, over an essentially granitic bedrock.',
   'El Bélier tiene un clima de tipo baulé, tropical húmedo de transición, con dos estaciones de lluvias y de 1 000 a 1 400 mm al año. Sus suelos son ferralíticos, sobre un zócalo esencialmente granítico.',
   'Der Bélier hat ein Klima vom Baoulé-Typ, ein feuchttropisches Übergangsklima mit zwei Regenzeiten und 1 000 bis 1 400 mm im Jahr. Die Böden sind ferrallitisch, über einem im Wesentlichen granitischen Sockel.',
   '贝利耶属巴乌莱型过渡性湿润热带气候，一年两个雨季，年降水 1 000 至 1 400 毫米。当地为铁铝土，基底以花岗岩为主。',
   'يسود بيلييه مناخ من نوع باوليه، مداري رطب انتقالي، بموسمين مطيرين و1000 إلى 1400 مم سنويًا. وتربته فيرالّيتية فوق قاعدة غرانيتية في معظمها.'),

  ('cote-d-ivoire-didievi', 'Didiévi', 'ivorycoast',
   'Sous-cape et tripe', 'Binder and filler', 'Capote y tripa', 'Umblatt und Einlage', '茄套与茄芯', 'غلاف داخلي وحشوة',

   'Feuille du département de Didiévi, voisin de Tiébissou dans la région du Bélier. Les caves d''Abidjan lui attribuent la sous-cape et la tripe du Fagot — c''est le second des deux sols dont elles disent que naissent les arômes du cigare. Comme sa voisine, elle n''a pas de variété connue.',
   'A leaf from the Didiévi department, next to Tiébissou in the Bélier region. The Abidjan merchants credit it with Le Fagot''s binder and filler — the second of the two soils from which they say the cigar''s aromas come. Like its neighbour, it has no known variety.',
   'Hoja del departamento de Didiévi, vecino de Tiébissou en la región de Bélier. Las tiendas de Abiyán le atribuyen el capote y la tripa del Fagot: es el segundo de los dos suelos de los que, según dicen, nacen los aromas del puro. Como su vecina, no tiene variedad conocida.',
   'Ein Blatt aus dem Departement Didiévi, dem Nachbarn von Tiébissou in der Region Bélier. Die Händler in Abidjan schreiben ihm Umblatt und Einlage des Fagot zu — der zweite der beiden Böden, aus denen nach ihren Worten die Aromen der Zigarre stammen. Wie beim Nachbarn ist keine Sorte bekannt.',
   '产自迪迪耶维省的烟叶，与贝利耶大区的蒂耶比苏相邻。阿比让的雪茄行称其为 Le Fagot 的茄套与茄芯，是他们所说的赋予雪茄香气的两种土壤中的第二种。与邻省的烟叶一样，其品种不详。',
   'ورقة من مقاطعة ديدييفي المجاورة لتييبيسو في منطقة بيلييه. تنسب إليها متاجر أبيدجان الغلاف الداخلي والحشوة في فاغو، وهي ثاني التربتين اللتين تقول إنّ نكهات السيجار تأتي منهما. وكجارتها، لا يُعرف لها صنف.',

   'Le Bélier connaît un climat baouléen, tropical humide de transition, avec deux saisons des pluies et 1 000 à 1 400 mm par an. Les sols y sont ferrallitiques, sur un substratum essentiellement granitique.',
   'The Bélier has a Baoulé-type climate, a humid tropical transition with two rainy seasons and 1,000 to 1,400 mm a year. Its soils are ferrallitic, over an essentially granitic bedrock.',
   'El Bélier tiene un clima de tipo baulé, tropical húmedo de transición, con dos estaciones de lluvias y de 1 000 a 1 400 mm al año. Sus suelos son ferralíticos, sobre un zócalo esencialmente granítico.',
   'Der Bélier hat ein Klima vom Baoulé-Typ, ein feuchttropisches Übergangsklima mit zwei Regenzeiten und 1 000 bis 1 400 mm im Jahr. Die Böden sind ferrallitisch, über einem im Wesentlichen granitischen Sockel.',
   '贝利耶属巴乌莱型过渡性湿润热带气候，一年两个雨季，年降水 1 000 至 1 400 毫米。当地为铁铝土，基底以花岗岩为主。',
   'يسود بيلييه مناخ من نوع باوليه، مداري رطب انتقالي، بموسمين مطيرين و1000 إلى 1400 مم سنويًا. وتربته فيرالّيتية فوق قاعدة غرانيتية في معظمها.');

-- ── La fiche Habanos ─────────────────────────────────────
INSERT INTO `habanos_presence`
  (`country_id`, `present`, `status_color`, `hq`,
   `status`, `status_en`, `status_es`, `status_de`, `status_zh`, `status_ar`,
   `ownership`, `ownership_en`, `ownership_es`, `ownership_de`, `ownership_zh`, `ownership_ar`,
   `description`, `description_en`, `description_es`, `description_de`, `description_zh`, `description_ar`,
   `festival`, `festival_en`, `festival_es`, `festival_de`, `festival_zh`, `festival_ar`,
   `factories`, `marques_officielles`, `distributeurs`, `certifications`)
VALUES (
  'ivorycoast', 0, '#B8860B', 'Abidjan, Riviéra Palmeraie',

  'PRODUCTION ARTISANALE NATIONALE', 'NATIONAL ARTISANAL PRODUCTION',
  'PRODUCCIÓN ARTESANAL NACIONAL', 'NATIONALE HANDWERKLICHE PRODUKTION',
  '本土手工生产', 'إنتاج حرفي وطني',

  'Le Fagot Cigar, entreprise ivoirienne indépendante',
  'Le Fagot Cigar, an independent Ivorian company',
  'Le Fagot Cigar, empresa marfileña independiente',
  'Le Fagot Cigar, ein unabhängiges ivorisches Unternehmen',
  'Le Fagot Cigar，科特迪瓦独立企业',
  'شركة Le Fagot Cigar الإيفوارية المستقلّة',

  'La Côte d''Ivoire n''a pas de représentation Habanos. Sa présence dans l''atlas tient à une production entièrement nationale : la feuille vient des départements de Tiébissou et Didiévi, dans la région du Bélier, et le roulage se fait à Abidjan. Le pays est par ailleurs le premier producteur ouest-africain de feuilles de tabac, mais cette filière-là est celle de la cigarette, au nord, autour de Bouaké.',
  'Côte d''Ivoire has no Habanos representation. Its place in the atlas rests on an entirely domestic production: the leaf comes from the Tiébissou and Didiévi departments, in the Bélier region, and the rolling is done in Abidjan. The country is also West Africa''s leading grower of tobacco leaf, but that industry is the cigarette one, in the north, around Bouaké.',
  'Costa de Marfil no tiene representación de Habanos. Su lugar en el atlas se debe a una producción enteramente nacional: la hoja procede de los departamentos de Tiébissou y Didiévi, en la región de Bélier, y el liado se hace en Abiyán. El país es además el primer productor de hoja de tabaco de África Occidental, pero esa industria es la del cigarrillo, en el norte, en torno a Bouaké.',
  'Die Elfenbeinküste hat keine Habanos-Vertretung. Ihr Platz im Atlas beruht auf einer vollständig einheimischen Produktion: Das Blatt stammt aus den Departements Tiébissou und Didiévi in der Region Bélier, gerollt wird in Abidjan. Das Land ist zudem Westafrikas größter Anbauer von Tabakblatt, doch jene Branche ist die der Zigarette, im Norden rund um Bouaké.',
  '科特迪瓦没有哈瓦那雪茄（Habanos）的代表机构。它之所以进入本图集，是因为其生产完全在本国完成：烟叶来自贝利耶大区的蒂耶比苏与迪迪耶维两省，卷制则在阿比让进行。该国同时是西非最大的烟叶种植国，但那一产业属于北部布瓦凯一带的卷烟业。',
  'ليس لساحل العاج تمثيل لهابانوس. ووجودها في هذا الأطلس يقوم على إنتاج وطني بالكامل: فالورقة تأتي من مقاطعتَي تييبيسو وديدييفي في منطقة بيلييه، ويجري اللفّ في أبيدجان. والبلد أيضًا أكبر مُنتِج لأوراق التبغ في غرب أفريقيا، غير أنّ تلك الصناعة هي صناعة السجائر، في الشمال حول بواكيه.',

  'Aucun festival cigare national', 'No national cigar festival',
  'Ningún festival nacional del puro', 'Kein nationales Zigarrenfestival',
  '无全国性雪茄节', 'لا يوجد مهرجان وطني للسيجار',

  '[{"name":"Le Fagot Cigar","city":"Abidjan","marques":["Le Fagot"]}]',
  '[]', '[]', '[]'
);

-- ── Les sceaux, calculés depuis les colonnes ─────────────
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'feuilles', f.`id`, c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'emploi' THEN f.`emploi`
                         WHEN 'genese' THEN f.`genese`
                         ELSE f.`culture` END),
       'machine', NOW()
  FROM `feuilles` f
  JOIN (SELECT 'emploi' champ UNION ALL SELECT 'genese' UNION ALL SELECT 'culture') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE f.`country_id` = 'ivorycoast';

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'habanos_presence', 'ivorycoast', c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'status'    THEN h.`status`
                         WHEN 'ownership' THEN h.`ownership`
                         WHEN 'festival'  THEN h.`festival`
                         ELSE h.`description` END),
       'machine', NOW()
  FROM `habanos_presence` h
  JOIN (SELECT 'status' champ UNION ALL SELECT 'ownership'
        UNION ALL SELECT 'description' UNION ALL SELECT 'festival') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE h.`country_id` = 'ivorycoast';

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 167','systeme','trou_comble','pays',0,
   'producer_geo est la SEULE table que les seize pays producteurs precedents ont tous, et la Cote d Ivoire en etait la seule exception — trou cree par la migration 165, qui a ouvert le pays sans la remplir. Source : fiche pays du ministere francais des Affaires etrangeres (diplomatie.gouv.fr)'),
  (NULL,'migration 167','systeme','piege_evite','pays',0,
   'LA MONNAIE N EST PAS CELLE DU CAMEROUN : les deux disent « franc CFA » mais le Cameroun est en XAF (Afrique centrale) et la Cote d Ivoire en XOF (Afrique de l Ouest) — deux monnaies distinctes de meme parite. Et la capitale est Yamoussoukro alors que les quatorze adresses de l atlas sont a ABIDJAN : le champ porte les deux, comme les Canaries portent « Las Palmas / Santa Cruz »'),
  (NULL,'migration 167','systeme','lecture_rectifiee','pays',0,
   'la migration 165 a laisse `varieties` vide en le comptant parmi les trous, au motif qu aucune source ne donne la variete. MEPRISE SUR LE CHAMP : varieties ne porte pas le cultivar botanique mais LES TABACS NOMMES du pays — le Bresil y met « Mata Fina », « Mata Norte », « Arapiraca », qui sont des lieux. Et c est cette liste qui rend les fiches de feuilles atteignables : coherence_check a refuse les deux nouvelles feuilles, « injoignables ». Le cultivar reste inconnu, et c est la genese des feuilles qui le dit'),
  (NULL,'migration 167','systeme','feuilles_maigres_assumees','pays',0,
   'Tiebissou et Didievi suivent la regle des feuilles de l atlas — des NOMS DE LIEUX (« Arapiraca », « Mata Fina »), jamais des noms de variete. Elles sont plus maigres que les trente autres : caracteres, notes et pairings restent VIDES. Les caves decrivent des aromes boises et floraux pour L ASSEMBLAGE des deux feuilles, pas pour chacune ; les repartir serait inventer'),
  (NULL,'migration 167','systeme','habanos_sans_representation','pays',0,
   'fiche sur le patron du Cameroun et du Bresil : present = 0, un statut qui dit pourquoi le pays est la malgre tout. Ni chiffre d affaires, ni effectif, ni dirigeant, ni distributeur, ni certification — rien de tout cela n est documente. La description distingue les DEUX filieres : le cigare artisanal du Belier, au centre, et la cigarette de Bouake, au nord');
