-- ══════════════════════════════════════════════════════════
-- 127 — Trois textes que le nouveau contrôle a fait sortir
-- ──────────────────────────────────────────────────────────
-- `tools/i18n_melange_check.php` pèse, phrase par phrase, les
-- mots-outils anglais contre ceux de la langue attendue. Il a trouvé
-- trois choses au premier passage, dont une que quatre contrôles
-- successifs avaient laissée passer.
--
-- ── 1. LA FICHE DE NANCY : LES COLONNES SONT INVERSÉES ────
--
-- Le contrôle a signalé de l'anglais dans la colonne FRANÇAISE :
--
--   description     « Historic tobacconist on the magnificent Place
--                     Stanislas… »            ← de l'anglais
--   description_en  « CIVANDTE historique sur la magnifique place… »
--   description_es  « CIVYTE histórico sur la magnifique place… »
--   description_de  « CIVUNDTE historisch sur la magnifique place… »
--   description_zh  « Civette 历史悠久 sur la magnifique place… »
--   description_ar  « Civette تاريخي sur la magnifique place… »
--
-- Les cinq traductions portent le MÊME français, abîmé chacune à sa
-- façon : « civette » où « et » a été remplacé par « and », « y »,
-- « und ». C'est la substitution sans limite de mot de la migration 095.
--
-- POURQUOI LE DÉTECTEUR RÉVERSIBLE DE LA 095 NE L'A JAMAIS VUE : il
-- vérifie qu'un mot abîmé redevient un mot PRÉSENT DANS LA COLONNE
-- FRANÇAISE de la même ligne. Ici « civandte » redevient bien
-- « civette » — mais la colonne française contient de l'anglais, où le
-- mot ne figure pas. Le contrôle cherchait sa preuve dans une case
-- elle-même fausse.
--
-- Le français est donc reconstruit, et il PROMEUT ce que l'anglais
-- portait en plus : le caractère baroque de la place et son classement
-- UNESCO, absents de la version française d'origine. Puis les cinq
-- langues sont retraduites depuis lui.
--
-- ── 2. CAO FLATHEAD, EN QUATRE LANGUES ────────────────────
--
--   es « Inspired by Harley-Davidson V-twin motorcycles, each format
--        NOMBRADA POR an engine part. […] Full body, notas de cuero,
--        BLACK CAFÉ, chocolate, motor oil (really). »
--
-- Anglais dans les quatre colonnes, avec deux ou trois mots remplacés
-- par leur équivalent. Le chinois et l'arabe n'ont même que leurs notes
-- de dégustation de traduites — « 风味包括： 皮革, black 咖啡 ».
-- Retraduits depuis le français.
--
-- ── 3. COHIBA, UN FRAGMENT DE TROIS MOTS ──────────────────
--
--   de « Die Fülle des Cognacs verstärkt die Holznoten OF THE BEHIKE. »
--
-- Trouvé au premier passage du contrôle, puis rendu invisible par son
-- propre garde-fou : le retrait des noms propres s'appuie sur la
-- majuscule, et l'allemand capitalise ses substantifs — « die Holznoten
-- of the Behike » a la forme exacte de « Man of the Year ». La limite
-- est écrite dans l'en-tête du contrôle ; la correction, elle, se fait
-- ici à la main.
-- ══════════════════════════════════════════════════════════

-- ── Tabacs Petitjean — Nancy (lounges #238) ────────────────
UPDATE `lounges` SET
  `description`    = 'Civette historique sur la magnifique place Stanislas, la place baroque de Nancy classée à l''UNESCO. L''une des adresses à cigares les mieux situées de France.',
  `description_en` = 'Historic tobacconist on the magnificent Place Stanislas, Nancy''s UNESCO-listed baroque square. One of France''s most beautifully located cigar addresses.',
  `description_es` = 'Estanco histórico en la magnífica plaza Stanislas, la plaza barroca de Nancy declarada Patrimonio de la Humanidad por la UNESCO. Una de las direcciones cigarreras mejor situadas de Francia.',
  `description_de` = 'Historischer Tabakladen an der prächtigen Place Stanislas, dem UNESCO-gelisteten Barockplatz von Nancy. Eine der am schönsten gelegenen Zigarrenadressen Frankreichs.',
  `description_zh` = '位于宏伟的斯坦尼斯拉斯广场上的老字号烟草店——这座南锡的巴洛克广场已列入联合国教科文组织名录。它是法国选址最美的雪茄地址之一。',
  `description_ar` = 'متجر تبغ عريق في ساحة ستانيسلاس الفخمة، ساحة نانسي الباروكية المدرجة على قائمة اليونسكو. من أجمل عناوين السيجار موقعًا في فرنسا.'
WHERE `id` = 238;

-- Le français ayant changé, ses cinq traductions seraient déclarées
-- périmées. Elles viennent d'être écrites depuis lui : on re-scelle ces
-- cinq lignes, et elles seules.
UPDATE `translation_status` ts
  JOIN `lounges` l ON l.`id` = ts.`entite_id`
   SET ts.`source_hash` = SHA1(TRIM(l.`description`))
 WHERE ts.`entite`    = 'lounges'
   AND ts.`entite_id` = '238'
   AND ts.`champ`     = 'description';

-- ── CAO Flathead, gamme[1].story ──────────────────────────
UPDATE `brands` SET
  `gamme_es` = JSON_SET(`gamme_es`, '$[1].story', 'Inspirada en los motores Harley-Davidson V-twin, cada formato lleva el nombre de una pieza: V660 Carb, V554 Piston, V770 Engine. Capa de Ecuador sobre tripa nicaragüense y hondureña. Recia, con notas de cuero, café negro, chocolate y aceite de motor —de verdad. Un puro de carretera y de la América industrial.'),
  `gamme_de` = JSON_SET(`gamme_de`, '$[1].story', 'Von den V-Twin-Motoren von Harley-Davidson inspiriert, trägt jedes Format den Namen eines Bauteils: V660 Carb, V554 Piston, V770 Engine. Deckblatt aus Ecuador über nicaraguanischer und honduranischer Einlage. Kräftig, mit Noten von Leder, schwarzem Kaffee, Schokolade und Motoröl — wirklich. Eine Zigarre der Landstraße und des industriellen Amerika.'),
  `gamme_zh` = JSON_SET(`gamme_zh`, '$[1].story', '取灵感于哈雷戴维森 V-twin 发动机，每个规格都以一个零件命名：V660 Carb、V554 Piston、V770 Engine。厄瓜多尔茄衣，包裹尼加拉瓜与洪都拉斯芯叶。风格厚重，带皮革、黑咖啡、巧克力，以及机油的气息——真的。这是一支属于公路与工业美国的雪茄。'),
  `gamme_ar` = JSON_SET(`gamme_ar`, '$[1].story', 'مستوحاة من محرّكات هارلي ديفيدسون ثنائية الأسطوانة، ويحمل كل قياس اسم قطعة من المحرّك: V660 Carb، وV554 Piston، وV770 Engine. غلاف من الإكوادور فوق حشوة نيكاراغوية وهندوراسية. قوية، بنكهات الجلد والقهوة السوداء والشوكولاتة وزيت المحرّك — فعلًا. سيجارة الطريق وأمريكا الصناعية.')
WHERE `name` = 'CAO';

-- ── Cohiba, pairings[0].notes (allemand) ──────────────────
UPDATE `brands`
   SET `pairings_de` = JSON_SET(`pairings_de`, '$[0].notes',
       'Die Fülle des Cognacs verstärkt die Holznoten des Behike. Eine klassische Paarung für besondere Anlässe.')
 WHERE `name` = 'Cohiba';
