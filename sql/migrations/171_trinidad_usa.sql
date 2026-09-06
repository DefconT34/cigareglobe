-- ════════════════════════════════════════════════════════
-- 171 — Trinidad USA, la quatrième jumelle
-- ────────────────────────────────────────────────────────
-- L'ATLAS PORTAIT TRINIDAD (CUBA) ET TROIS JUMELLES AMÉRICAINES —
-- Cohiba USA, Partagás USA, Romeo y Julieta USA — et pas la quatrième.
-- Un lecteur qui cherchait qui fabrique le Trinidad vendu aux
-- États-Unis ne trouvait rien, alors que le motif était établi trois
-- fois à côté.
--
-- ── ET L'HISTOIRE N'EST PAS CELLE DES AUTRES ─────────────
-- C'est le point qui justifie une fiche à part entière plutôt qu'une
-- ligne. Cohiba USA et Partagás USA sont des noms CUBAINS que General
-- Cigar a déposés aux États-Unis dans le vide créé par l'embargo :
-- l'atlas le dit déjà, « un vide de propriété intellectuelle que
-- General Cigar occupa rapidement et légalement ».
--
-- Trinidad, non. La famille Trinidad a fondé Trinidad y Hermanos à Cuba
-- en 1905 ; la Révolution l'a confisquée ; la famille a fait rouler des
-- Trinidad non cubains par les Fuente à Tampa dès 1968, puis en
-- République dominicaine en 1997 ; elle a GAGNÉ contre Cuba devant les
-- tribunaux américains en 2001, et vendu la marque à Altadis U.S.A. en
-- 2002. C'est la maison d'origine qui récupère son propre nom avant de
-- le céder — le contraire d'un dépôt opportuniste.
-- Source : cigaraficionado.com, « The Tale of Trinidad ».
--
-- ── UNE FICHE QUI NE TIENT PAS DANS UNE USINE ────────────
-- Les trois autres jumelles ont une adresse : General Cigar, Santiago
-- de los Caballeros. Le Trinidad américain est MULTI-SITES, et le champ
-- `factory` le dit :
--   · Trinidad Santiago  → Tabacalera Palma, de José « Jochy » Blanco,
--     République dominicaine ; pur dominicain, tabacs du Cibao.
--   · Trinidad Espiritu   → A.J. Fernandez, Estelí, Nicaragua.
-- Les assemblages sont menés par Rafael Nodal pour Altadis.
-- Sources : altadisusa.com (page officielle Trinidad Santiago),
-- cigaraficionado.com, cigar-coop.com.
--
-- ── CE QU'ON N'ÉCRIT PAS ─────────────────────────────────
--   `force` et `vitolas` : aucune source fiable pour l'ensemble de la
--   gamme. Le rendu les omet sans laisser de ligne vide — éprouvé par
--   la campagne sur le module sans cape du Fagot.
--   `pairings`, `celebrities`, `limited_eds` : rien de sourcé.
--   LE CATALOGUE DE 2003 — Coloniales, Fundadores, Reyes, Robusto
--   Extra, Robusto T — est cité dans l'histoire, et NON dans la gamme :
--   le site du fabricant ne le présente plus, mais aucune source ne dit
--   qu'il soit arrêté. Le dire arrêté serait affirmer ; le mettre en
--   gamme serait affirmer l'inverse.
--   L'ESPIRITU No. 2 : le fabricant annonce une cape et une tripe
--   différentes du premier sans les détailler. La fiche le dit ainsi.
--
-- ── ET LA FICHE DU PAYS DOIT L'ANNONCER ──────────────────
-- coherence_check l'exige, et l'a appris à la migration 167 : une
-- maison que `producer_countries.brands` ne nomme pas existe en base et
-- reste invisible depuis le globe. Le nom doit être le MÊME des deux
-- côtés.
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

INSERT INTO `brands`
  (`name`, `country_id`, `founded`, `factory`, `history`, `gamme`,
   `history_en`, `history_es`, `history_de`, `history_zh`, `history_ar`,
   `gamme_en`, `gamme_es`, `gamme_de`, `gamme_zh`, `gamme_ar`)
VALUES (
  'Trinidad USA', 'usa', '2002 — États-Unis (Altadis USA)',
  'Tabacalera Palma (Rép. dominicaine) et A.J. Fernandez (Estelí, Nicaragua)',

  'La famille Trinidad fonde Trinidad y Hermanos à Cuba en 1905. Diego Trinidad Jr. reprend l''affaire en 1920 et l''incorpore en 1958 sous le nom TTT Trinidad ; la Révolution la confisque.

Exilés, les Trinidad font rouler un Trinidad non cubain par les Fuente, à Tampa, dès 1968. La production s''arrête une dizaine d''années plus tard, quand les Fuente déménagent. Une seconde tentative, dominicaine et de nouveau avec les Fuente, a lieu en 1997 et tourne court elle aussi.

La famille porte l''affaire devant les tribunaux américains et obtient en 2001 les droits de vente aux États-Unis. En 2002, elle vend la marque et ces droits à Altadis U.S.A.

C''est ce qui distingue cette maison de Cohiba USA et de Partagás USA : ces deux-là sont des noms cubains que General Cigar a déposés aux États-Unis dans le vide créé par l''embargo. Ici, c''est la maison d''origine qui a récupéré son propre nom avant de le céder.

Le catalogue de 2003 — Coloniales, Fundadores, Reyes, Robusto Extra, Robusto T — était entièrement dominicain. Le fabricant ne le présente plus aujourd''hui, sans dire pour autant qu''il soit arrêté.',

  '[{"name":"Trinidad Santiago","color":"#7B3F00","wrapper":"République dominicaine (puro)","story":"Pur dominicain, assemblé par José « Jochy » Blanco dans sa Tabacalera Palma, en République dominicaine, à partir de tabacs de la vallée du Cibao. Rafael Nodal en a revu la composition pour Altadis."},{"name":"Trinidad Espiritu No. 1","color":"#5D4037","wrapper":"Nicaragua (puro)","story":"Puro nicaraguayen, roulé chez A.J. Fernandez à Estelí. Premier volet d''une série dont chaque épisode se réclame d''une région productrice différente."},{"name":"Trinidad Espiritu No. 2","color":"#6D4C41","story":"La suite de la série. Le fabricant en annonce une cape et une tripe différentes de celles du premier, sans les détailler."},{"name":"Trinidad Espiritu No. 3","color":"#4E342E","story":"Paru en 2024, sur des tabacs mexicains et nicaraguayens — le volet mexicain de la série."},{"name":"Trinidad x Tommy Bahama Island Collection","color":"#8D6E63","story":"Une série née d''une collaboration avec la marque de vêtements Tommy Bahama."}]',

  'The Trinidad family founded Trinidad y Hermanos in Cuba in 1905. Diego Trinidad Jr. took over in 1920 and incorporated the firm in 1958 as TTT Trinidad; the Revolution confiscated it.

In exile, the Trinidads had a non-Cuban Trinidad rolled by the Fuentes, in Tampa, from 1968. Production stopped about ten years later, when the Fuentes moved away. A second attempt, Dominican and again with the Fuentes, came in 1997 and was equally short-lived.

The family took the matter to the American courts and secured the United States selling rights in 2001. In 2002 it sold the brand and those rights to Altadis U.S.A.

That is what sets this house apart from Cohiba USA and Partagás USA: those two are Cuban names that General Cigar registered in the United States, in the vacuum left by the embargo. Here it is the original house that recovered its own name before parting with it.

The 2003 catalogue — Coloniales, Fundadores, Reyes, Robusto Extra, Robusto T — was entirely Dominican. The maker no longer shows it today, without saying that it has been stopped.',

  'La familia Trinidad funda Trinidad y Hermanos en Cuba en 1905. Diego Trinidad Jr. toma el relevo en 1920 y la incorpora en 1958 con el nombre TTT Trinidad; la Revolución la confisca.

En el exilio, los Trinidad hacen liar un Trinidad no cubano por los Fuente, en Tampa, desde 1968. La producción se detiene una decena de años más tarde, cuando los Fuente se mudan. Un segundo intento, dominicano y de nuevo con los Fuente, tiene lugar en 1997 y también dura poco.

La familia lleva el asunto a los tribunales estadounidenses y obtiene en 2001 los derechos de venta en Estados Unidos. En 2002 vende la marca y esos derechos a Altadis U.S.A.

Es lo que distingue a esta casa de Cohiba USA y de Partagás USA: esos dos son nombres cubanos que General Cigar registró en Estados Unidos, en el vacío creado por el embargo. Aquí es la casa de origen la que recuperó su propio nombre antes de cederlo.

El catálogo de 2003 —Coloniales, Fundadores, Reyes, Robusto Extra, Robusto T— era enteramente dominicano. El fabricante ya no lo presenta hoy, sin decir por ello que se haya interrumpido.',

  'Die Familie Trinidad gründet 1905 auf Kuba Trinidad y Hermanos. Diego Trinidad Jr. übernimmt 1920 und wandelt das Haus 1958 in TTT Trinidad um; die Revolution enteignet es.

Im Exil lassen die Trinidads ab 1968 eine nicht-kubanische Trinidad von den Fuentes in Tampa rollen. Die Produktion endet rund zehn Jahre später, als die Fuentes fortziehen. Ein zweiter Anlauf, dominikanisch und erneut mit den Fuentes, folgt 1997 und bleibt ebenso kurz.

Die Familie zieht vor amerikanische Gerichte und erhält 2001 die Vertriebsrechte für die Vereinigten Staaten. 2002 verkauft sie die Marke samt diesen Rechten an Altadis U.S.A.

Das unterscheidet dieses Haus von Cohiba USA und Partagás USA: Jene beiden sind kubanische Namen, die General Cigar in den Vereinigten Staaten eintragen ließ, in der Lücke, die das Embargo hinterließ. Hier hat das ursprüngliche Haus den eigenen Namen zurückgeholt, bevor es ihn abgab.

Der Katalog von 2003 — Coloniales, Fundadores, Reyes, Robusto Extra, Robusto T — war vollständig dominikanisch. Der Hersteller zeigt ihn heute nicht mehr, ohne dabei zu sagen, dass er eingestellt wurde.',

  'Trinidad 家族于 1905 年在古巴创办 Trinidad y Hermanos。迭戈·特立尼达二世 1920 年接手，1958 年以 TTT Trinidad 之名注册公司；革命后企业被没收。

流亡之后，特立尼达家族自 1968 年起委托富恩特家族在坦帕卷制非古巴版 Trinidad。约十年后富恩特迁址，生产随之停止。1997 年双方在多米尼加再度合作，同样为时不长。

家族将此事诉至美国法院，并于 2001 年取得在美国的销售权。2002 年，家族将品牌连同这些权利售予 Altadis U.S.A.。

这正是本品牌与 Cohiba USA、Partagás USA 的不同之处：后两者是 General Cigar 在禁运造成的空白中于美国注册的古巴名称。而此处，是原创家族先取回了自己的名字，然后才将其转让。

2003 年的产品目录——Coloniales、Fundadores、Reyes、Robusto Extra、Robusto T——全为多米尼加产。制造商如今已不再展示，但也未言明其已停产。',

  'أسّست عائلة ترينيداد شركة «ترينيداد إي إرمانوس» في كوبا عام 1905. تولّى دييغو ترينيداد الابن الإدارة عام 1920 وسجّلها عام 1958 باسم TTT Trinidad، ثم صادرتها الثورة.

وفي المنفى، عهدت العائلة إلى آل فوينتي بلفّ سيجار ترينيداد غير كوبي في تامبا ابتداءً من 1968. توقّف الإنتاج بعد نحو عشر سنوات حين انتقل آل فوينتي. وجرت محاولة ثانية في الدومينيكان عام 1997، مع آل فوينتي أيضًا، ولم تدُم طويلًا هي الأخرى.

رفعت العائلة القضية أمام المحاكم الأمريكية ونالت عام 2001 حقوق البيع في الولايات المتحدة، ثم باعت عام 2002 العلامة وهذه الحقوق إلى Altadis U.S.A.

وهذا ما يميّز هذه الدار عن Cohiba USA وPartagás USA: فهاتان اسمان كوبيّان سجّلتهما General Cigar في الولايات المتحدة، في الفراغ الذي خلّفه الحظر. أمّا هنا فالدار الأصلية هي التي استعادت اسمها قبل أن تتنازل عنه.

أمّا كتالوغ 2003 — كولونيالِس، وفونداذورِس، وريِس، وروبوستو إكسترا، وروبوستو تي — فكان دومينيكيًّا بالكامل. ولم يعد الصانع يعرضه اليوم، دون أن يقول إنّه أُوقف.',

  '[{"name":"Trinidad Santiago","color":"#7B3F00","wrapper":"Dominican Republic (puro)","story":"A Dominican puro, blended by José “Jochy” Blanco at his Tabacalera Palma, in the Dominican Republic, from Cibao valley tobaccos. Rafael Nodal reworked the blend for Altadis."},{"name":"Trinidad Espiritu No. 1","color":"#5D4037","wrapper":"Nicaragua (puro)","story":"A Nicaraguan puro, rolled at A.J. Fernandez in Estelí. First instalment of a series whose every episode claims a different growing region."},{"name":"Trinidad Espiritu No. 2","color":"#6D4C41","story":"The next in the series. The maker announces a wrapper and filler different from the first, without detailing them."},{"name":"Trinidad Espiritu No. 3","color":"#4E342E","story":"Released in 2024, on Mexican and Nicaraguan tobaccos — the Mexican instalment of the series."},{"name":"Trinidad x Tommy Bahama Island Collection","color":"#8D6E63","story":"A series born of a collaboration with the clothing brand Tommy Bahama."}]',

  '[{"name":"Trinidad Santiago","color":"#7B3F00","wrapper":"República Dominicana (puro)","story":"Puro dominicano, ligado por José «Jochy» Blanco en su Tabacalera Palma, en República Dominicana, con tabacos del valle del Cibao. Rafael Nodal revisó la composición para Altadis."},{"name":"Trinidad Espiritu No. 1","color":"#5D4037","wrapper":"Nicaragua (puro)","story":"Puro nicaragüense, liado en A.J. Fernandez, en Estelí. Primera entrega de una serie cuyo cada episodio se reclama de una región productora distinta."},{"name":"Trinidad Espiritu No. 2","color":"#6D4C41","story":"La continuación de la serie. El fabricante anuncia una capa y una tripa distintas de las del primero, sin detallarlas."},{"name":"Trinidad Espiritu No. 3","color":"#4E342E","story":"Aparecido en 2024, con tabacos mexicanos y nicaragüenses: la entrega mexicana de la serie."},{"name":"Trinidad x Tommy Bahama Island Collection","color":"#8D6E63","story":"Una serie nacida de una colaboración con la marca de ropa Tommy Bahama."}]',

  '[{"name":"Trinidad Santiago","color":"#7B3F00","wrapper":"Dominikanische Republik (Puro)","story":"Ein dominikanischer Puro, von José „Jochy“ Blanco in seiner Tabacalera Palma in der Dominikanischen Republik gemischt, aus Tabaken des Cibao-Tals. Rafael Nodal hat die Mischung für Altadis überarbeitet."},{"name":"Trinidad Espiritu No. 1","color":"#5D4037","wrapper":"Nicaragua (Puro)","story":"Ein nicaraguanischer Puro, bei A.J. Fernandez in Estelí gerollt. Erster Teil einer Reihe, deren jede Folge sich auf eine andere Anbauregion beruft."},{"name":"Trinidad Espiritu No. 2","color":"#6D4C41","story":"Die Fortsetzung der Reihe. Der Hersteller kündigt ein anderes Deckblatt und eine andere Einlage als beim ersten an, ohne sie zu benennen."},{"name":"Trinidad Espiritu No. 3","color":"#4E342E","story":"2024 erschienen, auf mexikanischen und nicaraguanischen Tabaken — der mexikanische Teil der Reihe."},{"name":"Trinidad x Tommy Bahama Island Collection","color":"#8D6E63","story":"Eine Reihe aus einer Zusammenarbeit mit der Bekleidungsmarke Tommy Bahama."}]',

  '[{"name":"Trinidad Santiago","color":"#7B3F00","wrapper":"多米尼加（纯产地）","story":"多米尼加纯产地雪茄，由何塞·「霍奇」·布兰科在其位于多米尼加的 Tabacalera Palma 工厂配制，用料取自西瓦奥谷。拉斐尔·诺达尔为 Altadis 重新调整了配方。"},{"name":"Trinidad Espiritu No. 1","color":"#5D4037","wrapper":"尼加拉瓜（纯产地）","story":"尼加拉瓜纯产地雪茄，于埃斯特利的 A.J. Fernandez 工厂卷制。系列首作，各作分别取材于不同产区。"},{"name":"Trinidad Espiritu No. 2","color":"#6D4C41","story":"系列续作。制造商宣称其茄衣与茄芯与首作不同，但未作说明。"},{"name":"Trinidad Espiritu No. 3","color":"#4E342E","story":"2024 年推出，采用墨西哥与尼加拉瓜烟叶，是该系列的墨西哥篇。"},{"name":"Trinidad x Tommy Bahama Island Collection","color":"#8D6E63","story":"与服装品牌 Tommy Bahama 合作推出的系列。"}]',

  '[{"name":"Trinidad Santiago","color":"#7B3F00","wrapper":"جمهورية الدومينيكان (نقي)","story":"سيجار دومينيكي نقي، خلطه خوسيه «خوتشي» بلانكو في مصنعه تاباكاليرا بالما بجمهورية الدومينيكان، من تبغ وادي سيباو. وقد أعاد رفائيل نودال ضبط الخلطة لصالح Altadis."},{"name":"Trinidad Espiritu No. 1","color":"#5D4037","wrapper":"نيكاراغوا (نقي)","story":"سيجار نيكاراغوي نقي، يُلفّ لدى A.J. Fernandez في إستيلي. وهو أول أجزاء سلسلة يستلهم كلّ جزء منها منطقة إنتاج مختلفة."},{"name":"Trinidad Espiritu No. 2","color":"#6D4C41","story":"الجزء التالي من السلسلة. يعلن الصانع عن غلاف وحشوة مختلفين عن الأول، دون أن يفصّلهما."},{"name":"Trinidad Espiritu No. 3","color":"#4E342E","story":"صدر عام 2024 من تبغ مكسيكي ونيكاراغوي، وهو الجزء المكسيكي من السلسلة."},{"name":"Trinidad x Tommy Bahama Island Collection","color":"#8D6E63","story":"سلسلة وُلدت من تعاون مع علامة الملابس Tommy Bahama."}]'
);

-- ── La fiche du pays doit annoncer la maison ─────────────
-- Sans cela, coherence_check refuse : « la marque existe en base mais
-- la fiche du pays ne l'annonce pas — invisible depuis le globe ». Le
-- nom doit être IDENTIQUE des deux côtés.
UPDATE `producer_countries`
   SET `brands` = JSON_ARRAY_APPEND(`brands`, '$',
         JSON_OBJECT('name', 'Trinidad USA',
                     'desc', 'La maison d''origine a récupéré son nom en 2001, puis l''a vendu à Altadis',
                     'iconic', FALSE)),
       `updated_at` = NOW()
 WHERE `id` = 'usa'
   AND JSON_SEARCH(`brands`, 'one', 'Trinidad USA') IS NULL;

-- ── Les sceaux, calculés depuis les colonnes ─────────────
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'brands', 'Trinidad USA', c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'history' THEN b.`history` ELSE b.`gamme` END),
       'machine', NOW()
  FROM `brands` b
  JOIN (SELECT 'history' champ UNION ALL SELECT 'gamme') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE b.`name` = 'Trinidad USA';

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 171','systeme','maison_ajoutee','marque',0,
   'Trinidad USA, 120e maison. L atlas portait Trinidad (Cuba) et TROIS jumelles americaines — Cohiba USA, Partagas USA, Romeo y Julieta USA — et pas la quatrieme. Un lecteur cherchant qui fabrique le Trinidad vendu aux Etats-Unis ne trouvait rien, alors que le motif etait etabli trois fois a cote'),
  (NULL,'migration 171','systeme','histoire_distincte','marque',0,
   'Cohiba USA et Partagas USA sont des noms CUBAINS que General Cigar a deposes aux Etats-Unis dans le vide cree par l embargo. Trinidad non : la famille Trinidad a fonde Trinidad y Hermanos a Cuba en 1905, la Revolution l a confisquee, la famille a fait rouler des Trinidad non cubains par les Fuente a Tampa des 1968 puis en Republique dominicaine en 1997, a GAGNE contre Cuba devant les tribunaux americains en 2001 et vendu la marque a Altadis U.S.A. en 2002. Source : cigaraficionado.com, « The Tale of Trinidad »'),
  (NULL,'migration 171','systeme','production_multi_sites','marque',0,
   'les trois autres jumelles ont UNE adresse (General Cigar, Santiago de los Caballeros). Le Trinidad americain est multi-sites : Trinidad Santiago chez Tabacalera Palma de Jose « Jochy » Blanco en Republique dominicaine, Trinidad Espiritu chez A.J. Fernandez a Esteli au Nicaragua, assemblages menes par Rafael Nodal pour Altadis. Sources : altadisusa.com, cigaraficionado.com, cigar-coop.com'),
  (NULL,'migration 171','systeme','catalogue_2003_hors_gamme','marque',0,
   'Coloniales, Fundadores, Reyes, Robusto Extra et Robusto T sont cites dans l HISTOIRE et non dans la gamme : le site du fabricant ne les presente plus, mais aucune source ne dit qu ils soient arretes. Les dire arretes serait affirmer ; les mettre en gamme serait affirmer l inverse'),
  (NULL,'migration 171','systeme','champs_laisses_vides','marque',0,
   'force et vitolas : aucune source fiable pour l ensemble de la gamme, et le rendu les omet sans laisser de ligne vide — eprouve par la campagne sur le module sans cape du Fagot. pairings, celebrities, limited_eds : rien de source. L Espiritu No. 2 dit que le fabricant annonce une cape et une tripe differentes sans les detailler, plutot que d inventer lesquelles');
