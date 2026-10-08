-- ════════════════════════════════════════════════════════
-- 252 — Haïti entre dans l'atlas
-- ────────────────────────────────────────────────────────
-- D'OÙ ELLE VIENT. Bohekio, marque de Supreme Tobacco S.A., roulée à
-- la main en Haïti et vendue aux États-Unis en 2024, a été confirmée par
-- le contradicteur du huitième recensement (lot 02). L'atlas range chaque
-- maison dans le pays où ses cigares sont roulés aujourd'hui, et Haïti
-- n'était pas un pays de l'atlas : décision de l'utilisateur du 24
-- septembre, « ouvrir Haïti », comme la 215 l'a fait pour les Bahamas,
-- les Açores, Porto Rico et la Chine. Cette migration ouvre le pays ; la
-- fiche Bohekio vient avec la suivante.
--
-- ── CE QUE LA FICHE DIT, ET CE QU'ELLE DÉCLARE NE PAS SAVOIR ──
-- Fait : Supreme Tobacco, établie en 2015, cultive à Mirebalais, dans le
-- Plateau Central, et roule Bohekio (lancée au salon de la PCA en 2021) ;
-- le tabac haïtien est ancien (Saint-Domingue le cultive vers 1690 et
-- jusqu'en 1700) ; la Compagnie des Tabacs Comme Il Faut fait la cigarette
-- depuis 1927 ; un atelier de Jacmel roulait environ 4 000 cigares par
-- trimestre en 2009 ; la FAO chiffre la feuille à 558 tonnes en 2024.
-- Déclaré : aucun chiffre d'exportation de cigares, aucune récolte, aucun
-- climat, aucune variété de graine nommée par la maison, aucune zone ni
-- variété posée sur la carte : le Plateau Central est une région, non une
-- zone de la carte, et Corojo et Broadleaf ne sont que les mots de deux
-- détaillants pour la ligne Colors (ils sont dans la fiche Bohekio, avec
-- leur attribution).
--
-- ── LA CARTE ────────────────────────────────────────────
-- Aucune page lue ne place l'usine de Supreme Tobacco dans le Plateau
-- Central ni dans une commune précise : la maison affiche une adresse à
-- Pétion-Ville (département de l'Ouest) et ne cite que Mirebalais pour la
-- culture. Le point de la carte (19,15 N ; 72,017 O) est posé sur la
-- région, le Plateau Central ; Mirebalais (18,83 N ; 72,11 O) est la zone
-- de culture, non un roulage attesté.
--
-- ── LES CHIFFRES ────────────────────────────────────────
-- Population (11,9 M, 2025), PIB en dollars courants (32,1 Md$, 2025) et
-- superficie (27 750 km², 2023) viennent de la Banque mondiale, qui
-- publie pour 2024 un PIB de 24,3 Md$ : l'écart de 2025 est le sien. La
-- superficie n'est pas publiée au-delà de 2023.
--
-- ── LE CODE QUI ACCOMPAGNE LA BASE ──────────────────────
-- flags.js : le drapeau haïtien dessiné (bleu, rouge, rectangle blanc et
-- un palmier vert : les armoiries ne se dessinent pas à cette taille, la
-- simplification est assumée) et déclaré dans FLAGS_DESSINES ;
-- data.pays.js : HT (gourde, français et créole, America/Port-au-Prince) ;
-- coords_check.php : HT en ISO 332 ; geo_banquemondiale.php : haiti => HT.
-- Sans cela coherence_check refuse le pays.
--
-- ── SOURCES DE LA FICHE PAYS ────────────────────────────
-- data.worldbank.org, api.worldbank.org, ourworldindata.org, fao.org,
-- tradingeconomics.com, media.un.org, en.wikipedia.org, fr.wikipedia.org,
-- supremetobaccohaiti.com, thecolddraw.co.nz, neptunecigar.com,
-- blackboxcigarclub.com.
--
-- Rejouable : INSERT … ON DUPLICATE KEY UPDATE ; sceaux `machine`.
-- ════════════════════════════════════════════════════════

-- ── HAÏTI ──
INSERT INTO `producer_countries` (`id`, `name`, `flag`, `lat`, `lon`, `color`, `tier`, `region`, `region_en`, `region_es`, `region_de`, `region_zh`, `region_ar`, `regions`, `varieties`, `tabacaleras`, `brands`, `production`, `production_en`, `production_es`, `production_de`, `production_zh`, `production_ar`, `revenue`, `rev_detail`, `rev_detail_en`, `rev_detail_es`, `rev_detail_de`, `rev_detail_zh`, `rev_detail_ar`, `soil`, `soil_en`, `soil_es`, `soil_de`, `soil_zh`, `soil_ar`, `notes`, `notes_en`, `notes_es`, `notes_de`, `notes_zh`, `notes_ar`)
VALUES ('haiti',
  'Haïti',
  CONVERT(UNHEX('F09F87ADF09F87B9') USING utf8mb4),
  19.1500,
  -72.0170,
  '#1F4FA3',
  'emerging',
  'Caraïbes',
  'Caribbean',
  'Caribe',
  'Karibik',
  '加勒比地区',
  'الكاريبي',
  '[]',
  '[]',
  '["Supreme Tobacco S.A.","Rocher (Yvan Milord, Jacmel, atelier de 2009)"]',
  '[]',
  'Cigares roulés main par Supreme Tobacco S.A. ; tabac cultivé à Mirebalais, dans le Plateau Central',
  'Cigars hand-rolled by Supreme Tobacco S.A.; tobacco grown in Mirebalais, in the Central Plateau',
  'Puros torcidos a mano por Supreme Tobacco S.A.; tabaco cultivado en Mirebalais, en la Meseta Central',
  'Von Supreme Tobacco S.A. von Hand gerollte Zigarren; Tabak in Mirebalais im Zentralplateau angebaut',
  'Supreme Tobacco S.A. 手工卷制雪茄；烟草种植于中央高原的米尔巴莱',
  'سيجار ملفوف يدويًا من Supreme Tobacco S.A.؛ التبغ مزروع في ميرباليه في الهضبة الوسطى',
  '',
  'Aucun chiffre d''exportation de tabac ou de cigares haïtiens n''est publié. Le profil d''Haïti de la FAO range le tabac parmi les produits vendus et exportés, sans volume ; les données Comtrade relayées par Trading Economics ne montrent, pour les cigares haïtiens, que 10 dollars vers la Thaïlande en 2013. En octobre 2026, la page des revendeurs de Supreme Tobacco liste des points de vente en Haïti, aux États-Unis (distribution par City of Palms Cigar Distribution, dit la maison) et en Allemagne (Cigar World).',
  'No export figure for Haitian tobacco or cigars is published. The FAO profile of Haiti lists tobacco among the products sold and exported, without a volume; the Comtrade data relayed by Trading Economics show, for Haitian cigars, only 10 dollars to Thailand in 2013. In October 2026, the resellers page of Supreme Tobacco lists points of sale in Haiti, in the United States (distribution by City of Palms Cigar Distribution, says the house) and in Germany (Cigar World).',
  'No se publica ninguna cifra de exportación de tabaco o de puros haitianos. El perfil de Haití de la FAO sitúa el tabaco entre los productos vendidos y exportados, sin volumen; los datos de Comtrade difundidos por Trading Economics solo muestran, para los puros haitianos, 10 dólares hacia Tailandia en 2013. En octubre de 2026, la página de revendedores de Supreme Tobacco enumera puntos de venta en Haití, en Estados Unidos (distribución a cargo de City of Palms Cigar Distribution, dice la casa) y en Alemania (Cigar World).',
  'Es werden keine Exportzahlen für haitianischen Tabak oder haitianische Zigarren veröffentlicht. Das Haiti-Profil der FAO führt Tabak unter den verkauften und exportierten Erzeugnissen auf, ohne Mengenangabe; die von Trading Economics weitergegebenen Comtrade-Daten zeigen für haitianische Zigarren nur 10 Dollar nach Thailand im Jahr 2013. Im Oktober 2026 listet die Wiederverkäuferseite von Supreme Tobacco Verkaufsstellen in Haiti, in den USA (Vertrieb durch City of Palms Cigar Distribution, sagt das Haus) und in Deutschland (Cigar World) auf.',
  '海地烟草或雪茄的出口数字均未公布。FAO 的海地概况将烟草列入已销售和出口的产品，但未给出数量；Trading Economics 转载的 Comtrade 数据显示，海地雪茄仅有2013年出口泰国的10美元。2026年十月，Supreme Tobacco 的经销商页面列出了位于海地、美国（据品牌方称，由 City of Palms Cigar Distribution 分销）和德国（Cigar World）的销售点。',
  'لا تُنشر أي أرقام لصادرات التبغ أو السيجار الهايتي. وتدرج نبذة FAO عن هايتي التبغ ضمن المنتجات المباعة والمصدَّرة دون ذكر حجم؛ أما بيانات Comtrade التي ينقلها موقع Trading Economics فلا تُظهر للسيجار الهايتي سوى 10 دولارات إلى تايلاند في عام 2013. وفي أكتوبر 2026، تدرج صفحة تجار إعادة البيع لدى Supreme Tobacco نقاط بيع في هايتي والولايات المتحدة (التوزيع عبر City of Palms Cigar Distribution، بحسب الدار) وألمانيا (Cigar World).',
  'Terres dites fertiles à Mirebalais, irriguées (dit Supreme Tobacco)',
  'Land said to be fertile at Mirebalais, irrigated (says Supreme Tobacco)',
  'Tierras que se dicen fértiles en Mirebalais, irrigadas (dice Supreme Tobacco)',
  'Als fruchtbar bezeichnetes Land in Mirebalais, bewässert (so Supreme Tobacco)',
  '米尔巴莱的土地据称肥沃，并有灌溉（据 Supreme Tobacco 称）',
  'أراضٍ توصف بأنها خصبة في ميرباليه، مروية (بحسب Supreme Tobacco)',
  'Le tabac est ancien dans l''île : Supreme Tobacco dit que sa culture en Haïti remonte aux Taïnos. Sous la colonie française de Saint-Domingue, il est encore cultivé vers 1690, quand le botaniste Charles Plumier propose de supprimer le Parti du tabac, et la culture résiste jusqu''en 1700.

Au XXe siècle, la cigarette industrielle s''installe : la Compagnie des Tabacs Comme Il Faut est établie en 1927 à Port-au-Prince ; en octobre 2026, Wikipédia (en anglais) la dit propriété de Luckett, Inc., de Louisville, et seul fabricant de cigarettes du pays. Sous François Duvalier, la Régie du Tabac recueille les recettes du monopole d''État sur le tabac ; sa date de naissance et son sort actuel ne sont pas établis. La FAO chiffre la production de feuille à 558 tonnes en 2024, contre 130 en 1961, une série quasi constante depuis les années 2000 et probablement estimée.

Les cigares roulés main restent rares. En 2009, un reportage de l''ONU montre à Jacmel l''atelier d''Yvan Milord, marque Rocher : environ 4 000 cigares par trimestre, avec le tabac de planteurs locaux, vendus sur place. Supreme Tobacco, établie en 2015, cultive à Mirebalais, dans le Plateau Central, et roule les cigares Bohekio, lancés en 2021 ; les capes de Bohekio, du Maduro et de Colors sont dominicaines ou équatoriennes.',
  'Tobacco is long established on the island: Supreme Tobacco says that its cultivation in Haiti goes back to the Taínos. Under the French colony of Saint-Domingue, it is still grown around 1690, when the botanist Charles Plumier proposes abolishing the Parti du tabac, and cultivation holds out until 1700.

In the twentieth century, the industrial cigarette takes hold: the Compagnie des Tabacs Comme Il Faut is established in 1927 in Port-au-Prince; in October 2026, Wikipedia (in English) says it is owned by Luckett, Inc., of Louisville, and is the country''s only cigarette manufacturer. Under François Duvalier, the Régie du Tabac collects the revenues of the state tobacco monopoly; its date of birth and its present fate are not established. The FAO puts leaf production at 558 tonnes in 2024, against 130 in 1961, a series that has been almost constant since the 2000s and is probably estimated.

Hand-rolled cigars remain rare. In 2009, a UN report shows, in Jacmel, the workshop of Yvan Milord, Rocher brand: about 4 000 cigars a quarter, made with tobacco from local growers and sold on the spot. Supreme Tobacco, established in 2015, grows in Mirebalais, in the Central Plateau, and rolls the Bohekio cigars, launched in 2021; the wrappers of Bohekio, of the Maduro and of Colors are Dominican or Ecuadorian.',
  'El tabaco es antiguo en la isla: Supreme Tobacco dice que su cultivo en Haití se remonta a los taínos. Bajo la colonia francesa de Saint-Domingue, todavía se cultiva hacia 1690, cuando el botánico Charles Plumier propone suprimir el Parti du tabac, y el cultivo resiste hasta 1700.

En el siglo XX se instala el cigarrillo industrial: la Compagnie des Tabacs Comme Il Faut se establece en 1927 en Puerto Príncipe; en octubre de 2026, Wikipedia (en inglés) la dice propiedad de Luckett, Inc., de Louisville, y único fabricante de cigarrillos del país. Bajo François Duvalier, la Régie du Tabac recoge los ingresos del monopolio estatal del tabaco; su fecha de nacimiento y su suerte actual no están establecidas. La FAO cifra la producción de hoja en 558 toneladas en 2024, frente a 130 en 1961, una serie casi constante desde los años 2000 y probablemente estimada.

Los puros torcidos a mano siguen siendo raros. En 2009, un reportaje de la ONU muestra en Jacmel el taller de Yvan Milord, marca Rocher: unos 4 000 puros por trimestre, con tabaco de cultivadores locales, vendidos allí mismo. Supreme Tobacco, establecida en 2015, cultiva en Mirebalais, en la Meseta Central, y tuerce los puros Bohekio, lanzados en 2021; las capas de Bohekio, del Maduro y de Colors son dominicanas o ecuatorianas.',
  'Der Tabak hat auf der Insel eine lange Geschichte: Supreme Tobacco sagt, dass sein Anbau in Haiti auf die Taínos zurückgeht. Unter der französischen Kolonie Saint-Domingue wird er um 1690 noch angebaut, als der Botaniker Charles Plumier vorschlägt, den Parti du tabac abzuschaffen, und der Anbau hält bis 1700 durch.

Im zwanzigsten Jahrhundert setzt sich die industrielle Zigarette durch: Die Compagnie des Tabacs Comme Il Faut wird 1927 in Port-au-Prince gegründet; im Oktober 2026 bezeichnet Wikipedia (auf Englisch) sie als Eigentum von Luckett, Inc., aus Louisville, und als einzigen Zigarettenhersteller des Landes. Unter François Duvalier vereinnahmt die Régie du Tabac die Einnahmen des staatlichen Tabakmonopols; ihr Gründungsdatum und ihr heutiges Schicksal sind nicht belegt. Die FAO beziffert die Blattproduktion auf 558 Tonnen im Jahr 2024, gegenüber 130 im Jahr 1961, eine seit den 2000er-Jahren nahezu konstante und wahrscheinlich geschätzte Reihe.

Handgerollte Zigarren bleiben selten. Im Jahr 2009 zeigt eine UN-Reportage in Jacmel die Werkstatt von Yvan Milord, Marke Rocher: etwa 4 000 Zigarren pro Quartal, mit dem Tabak lokaler Pflanzer hergestellt und vor Ort verkauft. Supreme Tobacco, 2015 gegründet, baut in Mirebalais im Zentralplateau an und rollt die Zigarren Bohekio, die 2021 eingeführt wurden; die Deckblätter von Bohekio, vom Maduro und von Colors sind dominikanisch oder ecuadorianisch.',
  '烟草在岛上历史悠久：Supreme Tobacco 称，海地的烟草种植可追溯到泰诺人。在法属圣多明各殖民地时期，约1690年仍在种植烟草，当时植物学家 Charles Plumier 提议取消 Parti du tabac，而种植一直坚持到1700年。

在二十世纪，工业化生产的香烟逐渐确立：Compagnie des Tabacs Comme Il Faut 于1927年在太子港成立；2026年十月，Wikipedia（英文版）称该公司归位于 Louisville 的 Luckett, Inc. 所有，并且是该国唯一的香烟制造商。在 François Duvalier 执政时期，Régie du Tabac 收取国家烟草专卖的收入；其成立日期和现状均无法确定。FAO 将烟叶产量定为2024年的558吨，对比1961年的130吨；该数列自2000年代以来几乎不变，且很可能是估算值。

手工卷制的雪茄依然少见。2009年，联合国的一则报道展示了雅克梅勒的 Yvan Milord 作坊，品牌 Rocher：每季度约4 000支雪茄，使用本地种植者的烟草，就地销售。2015年成立的 Supreme Tobacco 在中央高原的米尔巴莱种植烟草，并卷制2021年推出的 Bohekio 雪茄；Bohekio、Maduro 和 Colors 的茄衣来自多米尼加或厄瓜多尔。',
  'التبغ قديم العهد في الجزيرة: تقول Supreme Tobacco إن زراعته في هايتي تعود إلى التاينو. وفي ظل المستعمرة الفرنسية سان دومينغ، لا يزال يُزرع نحو عام 1690، حين يقترح عالم النبات Charles Plumier إلغاء Parti du tabac، وتصمد زراعته حتى عام 1700.

في القرن العشرين، تترسّخ السيجارة الصناعية: تأسست Compagnie des Tabacs Comme Il Faut في عام 1927 في بورت أو برانس؛ وفي أكتوبر 2026، تقول Wikipedia (بالإنجليزية) إنها مملوكة لشركة Luckett, Inc. من Louisville، وإنها المصنِّع الوحيد للسجائر في البلاد. وفي عهد François Duvalier، تجمع Régie du Tabac إيرادات احتكار الدولة للتبغ؛ ولم يثبت تاريخ نشأتها ولا مصيرها الحالي. وتذكر FAO أن إنتاج الأوراق بلغ 558 طنًا في عام 2024، مقابل 130 في عام 1961، وهي سلسلة شبه ثابتة منذ سنوات الـ2000 ومن المرجح أنها مقدَّرة.

يظل السيجار الملفوف يدويًا نادرًا. في عام 2009، يعرض تقرير للأمم المتحدة في جاكميل ورشة Yvan Milord، علامة Rocher: نحو 4 000 سيجار في كل ربع سنة، بتبغ مزارعين محليين، ويُباع في المكان نفسه. أما Supreme Tobacco، التي تأسست في عام 2015، فتزرع في ميرباليه، في الهضبة الوسطى، وتلفّ سيجار Bohekio، الذي أُطلق في عام 2021؛ وأغلفة Bohekio وMaduro وColors الخارجية دومينيكانية أو إكوادورية.')
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`), `flag` = VALUES(`flag`), `lat` = VALUES(`lat`), `lon` = VALUES(`lon`), `color` = VALUES(`color`), `tier` = VALUES(`tier`), `region` = VALUES(`region`), `region_en` = VALUES(`region_en`), `region_es` = VALUES(`region_es`), `region_de` = VALUES(`region_de`), `region_zh` = VALUES(`region_zh`), `region_ar` = VALUES(`region_ar`), `regions` = VALUES(`regions`), `varieties` = VALUES(`varieties`), `tabacaleras` = VALUES(`tabacaleras`), `brands` = VALUES(`brands`), `production` = VALUES(`production`), `production_en` = VALUES(`production_en`), `production_es` = VALUES(`production_es`), `production_de` = VALUES(`production_de`), `production_zh` = VALUES(`production_zh`), `production_ar` = VALUES(`production_ar`), `revenue` = VALUES(`revenue`), `rev_detail` = VALUES(`rev_detail`), `rev_detail_en` = VALUES(`rev_detail_en`), `rev_detail_es` = VALUES(`rev_detail_es`), `rev_detail_de` = VALUES(`rev_detail_de`), `rev_detail_zh` = VALUES(`rev_detail_zh`), `rev_detail_ar` = VALUES(`rev_detail_ar`), `soil` = VALUES(`soil`), `soil_en` = VALUES(`soil_en`), `soil_es` = VALUES(`soil_es`), `soil_de` = VALUES(`soil_de`), `soil_zh` = VALUES(`soil_zh`), `soil_ar` = VALUES(`soil_ar`), `notes` = VALUES(`notes`), `notes_en` = VALUES(`notes_en`), `notes_es` = VALUES(`notes_es`), `notes_de` = VALUES(`notes_de`), `notes_zh` = VALUES(`notes_zh`), `notes_ar` = VALUES(`notes_ar`);

INSERT INTO `producer_geo` (`country_id`, `capital`, `population`, `area`, `currency`, `language`, `timezone`, `gdp`, `independent`, `currency_en`, `currency_es`, `currency_de`, `currency_zh`, `currency_ar`, `language_en`, `language_es`, `language_de`, `language_zh`, `language_ar`, `independent_en`, `independent_es`, `independent_de`, `independent_zh`, `independent_ar`)
VALUES ('haiti', 'Port-au-Prince', '11,9 M (2025)', '27 750 km² (2023)', 'Gourde (HTG)', 'Français, créole haïtien', 'UTC−5', '32,1 Md$ (2025)', '1804 (de la France)', 'Gourde (HTG)', 'Gourde (HTG)', 'Gourde (HTG)', '古德（HTG）', 'الجوردة (HTG)', 'French, Haitian Creole', 'Francés, criollo haitiano', 'Französisch, Haitianisches Kreol', '法语、海地克里奥尔语', 'الفرنسية، الكريولية الهايتية', '1804 (from France)', '1804 (de Francia)', '1804 (von Frankreich)', '1804年（脱离法国）', '1804 (عن فرنسا)')
ON DUPLICATE KEY UPDATE `capital` = VALUES(`capital`), `population` = VALUES(`population`), `area` = VALUES(`area`), `currency` = VALUES(`currency`), `language` = VALUES(`language`), `timezone` = VALUES(`timezone`), `gdp` = VALUES(`gdp`), `independent` = VALUES(`independent`), `currency_en` = VALUES(`currency_en`), `currency_es` = VALUES(`currency_es`), `currency_de` = VALUES(`currency_de`), `currency_zh` = VALUES(`currency_zh`), `currency_ar` = VALUES(`currency_ar`), `language_en` = VALUES(`language_en`), `language_es` = VALUES(`language_es`), `language_de` = VALUES(`language_de`), `language_zh` = VALUES(`language_zh`), `language_ar` = VALUES(`language_ar`), `independent_en` = VALUES(`independent_en`), `independent_es` = VALUES(`independent_es`), `independent_de` = VALUES(`independent_de`), `independent_zh` = VALUES(`independent_zh`), `independent_ar` = VALUES(`independent_ar`);

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'producer_countries', p.`id`, c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'region' THEN p.`region` WHEN 'production' THEN p.`production`
                         WHEN 'rev_detail' THEN p.`rev_detail` WHEN 'soil' THEN p.`soil` ELSE p.`notes` END), 'machine', NOW()
  FROM `producer_countries` p
  JOIN (SELECT 'region' champ UNION ALL SELECT 'production' UNION ALL SELECT 'rev_detail' UNION ALL SELECT 'soil' UNION ALL SELECT 'notes') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de' UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE p.`id` = 'haiti'
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'producer_geo', g.`country_id`, c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'currency' THEN g.`currency` WHEN 'language' THEN g.`language` ELSE g.`independent` END), 'machine', NOW()
  FROM `producer_geo` g
  JOIN (SELECT 'currency' champ UNION ALL SELECT 'language' UNION ALL SELECT 'independent') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de' UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE g.`country_id` = 'haiti'
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 252';
INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 252','systeme','pays_ouvert','pays',0,
   'Haiti (Bohekio, Supreme Tobacco) : pays de roulage, point de carte sur le Plateau Central (19.15) ; population, PIB et superficie de la Banque mondiale avec leur annee'),
  (NULL,'migration 252','systeme','code_accompagne_la_base','pays',0,
   'flags.js : haiti dessine (palmier seul, simplification assumee) et declare dans FLAGS_DESSINES ; data.pays.js : HT ; coords_check : HT en ISO 332 ; geo_banquemondiale : haiti => HT. Sans cela coherence_check refuse le pays.');

SELECT
  (SELECT COUNT(*) FROM `producer_countries` WHERE `id` = 'haiti') = 1 AS pays,
  (SELECT COUNT(*) FROM `producer_geo` WHERE `country_id` = 'haiti') = 1 AS geo,
  (SELECT CHAR_LENGTH(`flag`) FROM `producer_countries` WHERE `id` = 'haiti') = 2 AS drapeau_entier,
  (SELECT COUNT(*) FROM `translation_status` WHERE `entite` IN ('producer_countries','producer_geo') AND `entite_id` = 'haiti') = 40 AS sceaux,
  (SELECT SUM(CHAR_LENGTH(`detail`) >= 255) = 0 FROM `moderation_log` WHERE `acteur_nom` = 'migration 252') AS journal_non_tronque;
SELECT COUNT(*) AS pays_producteurs FROM `producer_countries`;
