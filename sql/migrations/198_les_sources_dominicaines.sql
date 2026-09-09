-- ════════════════════════════════════════════════════════
-- 198 — Les treize dominicaines, et l'homme qui tient
--       cinq fiches de cet atlas
-- ────────────────────────────────────────────────────────
-- Troisieme lot du chantier ouvert par la 195. Comme aux 196 et 197, la
-- verification a rendu plus que des citations.
--
-- ── LE FIL JOSE SEIJAS ──────────────────────────────────
-- Il a ete embauche par Consolidated Cigar en 1974, a vingt-quatre ans,
-- et il a dirige la TABACALERA DE GARCIA de La Romana comme maitre
-- assembleur puis vice-president. Il a compose, ou supervise :
--
--   MONTECRISTO DOMINICAIN · ROMEO Y JULIETA DOMINICAIN · VEGAFINA
--   H. UPMANN DOMINICAIN · DON DIEGO
--
-- CINQ FICHES DE CET ATLAS, plus la sienne. Il a quitte la manufacture
-- debut 2012 et fonde MATILDE en 2013 avec ses fils Ricardo et Enrique.
-- C'est dans les annees 1980 qu'il a fait passer La Romana de la
-- machine au roulage main.
--
-- ⚠ IL EST MORT EN NOVEMBRE 2024, a soixante-quatorze ans. La fiche
-- Matilde ne le disait pas. Elle le dit maintenant, dans les six
-- langues — comme celle de Cuban Crafters dit la mort de Don Kiki
-- Berger.
--
-- ── TROIS DATES IMPRECISES, ET UNE QUI MELANGEAIT DEUX LIEUX
-- DON DIEGO portait « Annees 1960 — La Romana ». Les deux moities sont
-- vraies separement et fausses ensemble : la marque est creee en 1964
-- AUX CANARIES — reponse a l'embargo, par l'exile cubain Pepe Garcia —
-- et sa production ne passe a La Romana qu'en 1982. Le texte de la
-- fiche le disait deja correctement ; c'est le champ de date qui
-- melangeait. Meme faute que DONA FLOR a la 193, ou un lieu de culture
-- avait ete pris pour un lieu de fabrication.
--
-- Les Canaries sont un pays producteur de cet atlas : ce n'est pas un
-- detail exotique, c'est un lien.
--
-- PDR CIGARS portait « Annees 2000 ». C'est 2004, a Tamboril, sous le
-- nom PINAR DEL RIO — hommage a la region cubaine — rebaptise ensuite
-- PDR pour « Puros Dominican Republic ». Le changement de nom dit le
-- changement de revendication, et vaut d'etre ecrit.
--
-- VEGAFINA portait « Annees 1990 ». C'est 1998 : la maison a sorti une
-- ligne « VegaFina 1998 » qui commemore son annee de creation. Le texte
-- de la fiche dit « nee dans les annees 1990 » — compatible, rien ne se
-- contredit.
--
-- ── CE QU'ON NE TOUCHE PAS ──────────────────────────────
-- MONTECRISTO DOMINICAIN et ROMEO Y JULIETA DOMINICAIN portent « Depuis
-- 1960 — La Romana ». C'est imprecis, et AUCUNE SOURCE CONSULTABLE ne
-- permet de dater proprement le passage de chaque nom a La Romana. On
-- laisse donc en l'etat plutot que d'inventer une precision : le champ
-- `source` dit ce que les sources etablissent, et rien de plus.
--
-- Sources : cigarinspector.com « Don Diego Celebrate 40th Anniversary »
-- et thecigarstore.com (1964 aux Canaries, Pepe Garcia, transfert a La
-- Romana en 1982, Seijas assembleur) ; cigaraficionado.com « The
-- Formidable Factory » (PDR : Abe Flores, Tamboril, 2004, Pinar del Rio
-- devenu PDR, cinq millions de cigares par an) ; cigaraficionado.com
-- « Litto's Twist of Fate » et halfwheel.com « Los Libertadores — the
-- original La Flor Dominicana » (Los Libertadores en 1994 a Villa
-- Gonzalez avec quatre postes de roulage, reprise et renommage en juin
-- 1996) ; halfwheel.com « Jose Seijas, Longtime Tabacalera de Garcia
-- Head & Matilde Founder, Passes Away at 74 », cigarjournal.com et
-- premiumcigars.org (1974 chez Consolidated, le passage de la machine
-- au roulage main dans les annees 1980, le depart debut 2012, Matilde
-- en 2013 avec Ricardo et Enrique, le nom repris d'une fabrique de
-- Santiago de 1876, le deces en novembre 2024) ; altadisusa.com et
-- cigarworld.de (VegaFina 1998) ; cigares.com « Jean Clement » et
-- cigaraficionado.com « Juan Clemente Creator Dies » (avril 1982, la
-- latinisation du nom, Santiago).
--
-- Apres cette migration :
--   php tools/contenu_dump.php
--   php tools/i18n_dump.php > sql/traductions.sql
--   php tools/sources.php --verifier
-- ════════════════════════════════════════════════════════

-- ════════════════════════════════════════════════════════
-- 1. MATILDE — la mort de José Seijas, novembre 2024
-- ════════════════════════════════════════════════════════
UPDATE `brands` SET
  `history` = CONCAT(`history`, '\n\nJosé Seijas est mort en novembre 2024, à soixante-quatorze ans. Il avait été embauché par Consolidated Cigar en 1974, à vingt-quatre ans, et c''est lui qui, dans les années 1980, fit passer la manufacture de La Romana de la machine au roulage à la main.\n\nCet atlas lui doit plus que cette fiche : il a composé ou supervisé le Montecristo dominicain, le Romeo y Julieta dominicain, le VegaFina, le H. Upmann dominicain et le Don Diego. Cinq marques répertoriées ici tiennent, en partie, au travail du même homme — et Matilde est la seule qui porte son propre choix.'),
  `history_en` = CONCAT(`history_en`, '\n\nJosé Seijas died in November 2024, aged seventy-four. He had been hired by Consolidated Cigar in 1974, at twenty-four, and it was he who, in the 1980s, took the La Romana factory from machine-made to hand-rolled.\n\nThis atlas owes him more than this entry: he blended or oversaw the Dominican Montecristo, the Dominican Romeo y Julieta, VegaFina, the Dominican H. Upmann and Don Diego. Five brands listed here rest, in part, on the work of the same man — and Matilde is the only one that carries his own choosing.'),
  `history_es` = CONCAT(`history_es`, '\n\nJosé Seijas murió en noviembre de 2024, a los setenta y cuatro años. Había sido contratado por Consolidated Cigar en 1974, a los veinticuatro, y fue él quien, en los años ochenta, llevó la manufactura de La Romana de la máquina al liado a mano.\n\nEste atlas le debe más que esta ficha: compuso o supervisó el Montecristo dominicano, el Romeo y Julieta dominicano, el VegaFina, el H. Upmann dominicano y el Don Diego. Cinco marcas recogidas aquí descansan, en parte, en el trabajo del mismo hombre, y Matilde es la única que lleva su propia elección.'),
  `history_de` = CONCAT(`history_de`, '\n\nJosé Seijas starb im November 2024 im Alter von vierundsiebzig Jahren. Consolidated Cigar hatte ihn 1974 mit vierundzwanzig eingestellt, und er war es, der in den 1980er Jahren die Fabrik von La Romana von der Maschine zur Handrollung führte.\n\nDieser Atlas verdankt ihm mehr als diesen Eintrag: Er mischte oder beaufsichtigte den dominikanischen Montecristo, den dominikanischen Romeo y Julieta, VegaFina, den dominikanischen H. Upmann und Don Diego. Fünf hier geführte Marken beruhen zum Teil auf der Arbeit desselben Mannes — und Matilde ist die einzige, die seine eigene Wahl trägt.'),
  `history_zh` = CONCAT(`history_zh`, '\n\nJosé Seijas 于 2024 年 11 月去世，享年七十四岁。1974 年，二十四岁的他被 Consolidated Cigar 聘用；也正是他在八十年代把拉罗马纳的工厂从机制带到了手卷。\n\n本图集欠他的不止这一条目：多米尼加的 Montecristo、多米尼加的 Romeo y Julieta、VegaFina、多米尼加的 H. Upmann 与 Don Diego，都由他调配或督造。本图集收录的五个品牌，有一部分靠的是同一个人的手艺——而 Matilde 是其中唯一出自他自己选择的一个。'),
  `history_ar` = CONCAT(`history_ar`, '\n\nتُوفّي خوسيه سيخاس في نوفمبر 2024 عن أربعة وسبعين عامًا. كانت «كونسوليديتد سيغار» قد وظّفته عام 1974 وهو ابن أربعة وعشرين، وهو الذي نقل مصنع لا رومانا في الثمانينيات من الآلة إلى اللفّ باليد.\n\nويدين له هذا الأطلس بأكثر من هذه البطاقة: فقد مزج أو أشرف على «مونتيكريستو» الدومينيكيّ، و«روميو إي خولييتا» الدومينيكيّ، و«فيغافينا»، و«إتش. أوبمان» الدومينيكيّ، و«دون دييغو». خمس علامات مُدرجة هنا تقوم، في جانب منها، على عمل الرجل نفسه — و«ماتيلدي» وحدها هي التي تحمل اختياره هو.'),
  `updated_at` = NOW()
 WHERE `name` = 'Matilde';

SELECT 'fr' AS lang, `history`    LIKE '%novembre 2024%'     AS ok FROM `brands` WHERE `name`='Matilde'
UNION ALL SELECT 'en', `history_en` LIKE '%November 2024%'     FROM `brands` WHERE `name`='Matilde'
UNION ALL SELECT 'es', `history_es` LIKE '%noviembre de 2024%' FROM `brands` WHERE `name`='Matilde'
UNION ALL SELECT 'de', `history_de` LIKE '%November 2024%'     FROM `brands` WHERE `name`='Matilde'
UNION ALL SELECT 'zh', `history_zh` LIKE '%2024 年 11 月%'      FROM `brands` WHERE `name`='Matilde'
UNION ALL SELECT 'ar', `history_ar` LIKE '%نوفمبر 2024%'        FROM `brands` WHERE `name`='Matilde';

-- ════════════════════════════════════════════════════════
-- 2. TROIS CHAMPS DE DATE IMPRÉCIS
-- ════════════════════════════════════════════════════════
-- Don Diego melangeait la date de creation (1964, Canaries) et le lieu
-- de fabrication actuel (La Romana, depuis 1982).
UPDATE `brands` SET `founded` = '1964 — Canaries ; La Romana depuis 1982', `updated_at` = NOW()
 WHERE `name` = 'Don Diego';
UPDATE `brands` SET `founded` = '2004 — Tamboril, Rép. dominicaine', `updated_at` = NOW()
 WHERE `name` = 'PDR Cigars';
UPDATE `brands` SET `founded` = '1998 — La Romana, Rép. dominicaine', `updated_at` = NOW()
 WHERE `name` = 'VegaFina';

-- Aucun de ces champs ne doit depasser la capacite de la colonne, et
-- aucun ne doit commencer par un separateur (regles 184 et 193).
SELECT `name`, `founded`, CHAR_LENGTH(`founded`) AS lg
  FROM `brands` WHERE `name` IN ('Don Diego','PDR Cigars','VegaFina');

-- ════════════════════════════════════════════════════════
-- 3. LES TREIZE SOURCES
-- ════════════════════════════════════════════════════════
UPDATE `brands` SET `source` = CASE `name`

WHEN 'Arturo Fuente' THEN 'arturofuente.com et cigaraficionado.com (Arturo Fuente, 1912 à Ybor City ; l''incendie, l''exil, l''installation à Santiago) ; en.wikipedia.org (Arturo Fuente)'
WHEN 'Ashton' THEN 'ashtoncigar.com et cigaraficionado.com (Robert Levin, 1985, Philadelphie ; roulé chez Arturo Fuente à Santiago) ; halfwheel.com'
WHEN 'Don Diego' THEN 'cigarinspector.com « Don Diego Celebrate 40th Anniversary With New Release » et thecigarstore.com (créée en 1964 AUX CANARIES par l''exilé cubain Pepe García, production transférée à La Romana en 1982, assemblage de José Seijas) — le champ de date disait « années 1960 — La Romana » et mélangeait les deux ; corrigé par la migration 198'
WHEN 'Juan Clemente' THEN 'cigares.com « Jean Clément et ses cigares Juan Clemente » et cigaraficionado.com « Juan Clemente Creator Dies » (avril 1982, un Français qui latinise son nom, fabrique à Santiago de los Caballeros, l''une des premières petites tabacaleras de la région)'
WHEN 'La Aurora' THEN 'laaurora.com.do et cigaraficionado.com (Eduardo León Jimenes, 1903, Santiago — la plus ancienne manufacture du pays) ; cigarjournal.com'
WHEN 'La Flor Dominicana' THEN 'cigaraficionado.com « Litto''s Twist of Fate » et halfwheel.com « Los Libertadores — the original La Flor Dominicana » (Litto Gómez et Ines Lorenzo créent Los Libertadores en 1994 à Villa González, quatre postes de roulage ; reprise et renommage en juin 1996 après un différend avec l''associé) ; en.wikipedia.org'
WHEN 'Matilde' THEN 'halfwheel.com « José Seijas, Longtime Tabacalera de García Head & Matilde Founder, Passes Away at 74 », cigarjournal.com et premiumcigars.org (embauché par Consolidated Cigar en 1974 ; le passage de La Romana de la machine au roulage main dans les années 1980 ; départ début 2012 ; Matilde en 2013 avec Ricardo et Enrique ; le nom repris d''une fabrique de Santiago de 1876 ; DÉCÈS EN NOVEMBRE 2024)'
WHEN 'Montecristo Dominicain' THEN 'altadisusa.com et cigaraficionado.com (Tabacalera de García, La Romana ; assemblages supervisés par José Seijas) — ⚠ aucune source consultable ne date proprement le passage du nom à La Romana ; le champ garde « depuis 1960 » faute de mieux'
WHEN 'PDR Cigars' THEN 'cigaraficionado.com « The Formidable Factory » (Abe Flores, 2004, Tamboril ; la marque s''appelait PINAR DEL RÍO avant d''être rebaptisée PDR pour « Puros Dominican Republic » ; cinq millions de cigares par an) — le champ de date disait « années 2000 », précisé par la migration 198'
-- ⚠ quesadacigars.com A ETE RETIRE DE CETTE LIGNE : le controle
-- tools/sources.php l'a passe au DNS et le domaine N'EXISTE PAS. Une
-- source qui ne resout pas est pire qu'une source absente — elle donne
-- l'apparence de la verification. C'est exactement ce que cet outil a
-- ete ecrit pour attraper, et il m'a attrape.
WHEN 'Quesada' THEN 'en.wikipedia.org « Quesada Cigars » (la famille Quesada, MATASA à Santiago, 1974) ; cigaraficionado.com ; procigar.org (membre fondateur)'
WHEN 'Romeo y Julieta Dominicain' THEN 'altadisusa.com et cigaraficionado.com (Tabacalera de García, La Romana ; assemblages supervisés par José Seijas) — ⚠ même réserve que pour le Montecristo dominicain sur la date'
WHEN 'Santa Damiana' THEN 'cigarjournal.com et cigarworld.de (relancée en 1993 à la Tabacalera de García ; le nom vient d''une plantation cubaine du XIXᵉ siècle)'
WHEN 'VegaFina' THEN 'altadisusa.com et cigarworld.de (la ligne « VegaFina 1998 » commémore l''année de création de la marque ; fabrication à la Tabacalera de García, La Romana ; assemblage de José Seijas) — le champ de date disait « années 1990 », précisé par la migration 198'

ELSE `source` END,
`updated_at` = NOW()
 WHERE `country_id` = 'dominican';

SELECT COUNT(*) AS dominicaines,
       SUM(`source` IS NOT NULL AND `source` <> '') AS sourcees,
       SUM(`source` IS NULL OR `source` = '')       AS sans_source
  FROM `brands` WHERE `country_id` = 'dominican';

-- ── Le sceau de Matilde, recalculé depuis la colonne ─────
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'brands', b.`name`, 'history', l.lang, SHA1(b.`history`), 'machine', NOW()
  FROM `brands` b
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE b.`name` = 'Matilde'
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 198','systeme','treize_sources_dominicaines','marque',0,
   'Troisieme lot du chantier ouvert par la 195. Les treize fiches dominicaines sans source en recoivent une. Sources : 134 / 182'),
  (NULL,'migration 198','systeme','le_fil_jose_seijas','marque',0,
   'JOSE SEIJAS TIENT CINQ FICHES DE CET ATLAS, plus la sienne. Embauche par Consolidated Cigar en 1974 a vingt-quatre ans, il a dirige la Tabacalera de Garcia de La Romana comme maitre assembleur puis vice-president, et compose ou supervise le MONTECRISTO DOMINICAIN, le ROMEO Y JULIETA DOMINICAIN, le VEGAFINA, le H. UPMANN DOMINICAIN et le DON DIEGO. C est lui qui, dans les annees 1980, a fait passer La Romana de la machine au roulage main. Il a quitte la manufacture debut 2012 et fonde MATILDE en 2013 avec ses fils Ricardo et Enrique, en reprenant le nom d une fabrique de Santiago de 1876'),
  (NULL,'migration 198','systeme','un_deces_que_la_fiche_ne_disait_pas','marque',0,
   'JOSE SEIJAS EST MORT EN NOVEMBRE 2024, a soixante-quatorze ans. La fiche Matilde ne le disait pas. Elle le dit maintenant dans les six langues — comme celle de Cuban Crafters dit la mort de Don Kiki Berger a la 193'),
  (NULL,'migration 198','systeme','une_date_qui_melangeait_deux_lieux','marque',0,
   'DON DIEGO portait « Annees 1960 — La Romana ». Les deux moities sont vraies separement et fausses ensemble : la marque est creee EN 1964 AUX CANARIES, par l exile cubain Pepe Garcia, en reponse a l embargo, et sa production ne passe a La Romana qu en 1982. Le texte de la fiche le disait deja correctement ; c est le champ de date qui melangeait. Meme faute que DONA FLOR a la 193. Et les Canaries sont un pays producteur de cet atlas : ce n est pas un detail exotique, c est un lien'),
  (NULL,'migration 198','systeme','deux_dates_precisees','marque',0,
   'PDR CIGARS portait « Annees 2000 » : c est 2004, a Tamboril, sous le nom PINAR DEL RIO — hommage a la region cubaine — rebaptise ensuite PDR pour « Puros Dominican Republic ». VEGAFINA portait « Annees 1990 » : c est 1998, que la maison commemore elle-meme avec sa ligne « VegaFina 1998 »'),
  (NULL,'migration 198','systeme','ce_qu_on_ne_touche_pas','marque',0,
   'MONTECRISTO DOMINICAIN et ROMEO Y JULIETA DOMINICAIN portent « Depuis 1960 — La Romana ». C est imprecis, et AUCUNE SOURCE CONSULTABLE ne permet de dater proprement le passage de chaque nom a La Romana. On laisse en l etat plutot que d inventer une precision, et le champ `source` porte la reserve');
