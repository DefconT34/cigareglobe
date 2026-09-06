-- ════════════════════════════════════════════════════════
-- 165 — La Côte d'Ivoire, dix-septième pays producteur
-- ────────────────────────────────────────────────────────
-- LA MIGRATION 164 A REFUSÉ CETTE PROMOTION, et elle avait raison de le
-- faire : lefagot.com parlait d'un « terroir riche » sans jamais dire où
-- la feuille était cultivée. Ouvrir un pays producteur sur la foi de
-- noms de cigares aurait été le raisonnement qui a produit les 98 fiches
-- retirées par le chantier des sources.
--
-- La recherche a répondu. Ce qui manquait n'était pas de la prudence :
-- c'était une source.
--
-- ── CE QUI EST ÉTABLI ────────────────────────────────────
-- 1. LE TABAC EST CULTIVÉ EN CÔTE D'IVOIRE, et pas marginalement : le
--    pays est le premier producteur ouest-africain de feuilles, environ
--    8 071 t/an (données FAO reprises par atlasocio.com). La filière
--    historique est au nord, autour de Bouaké, où la SITAB — filiale
--    d'Imperial Brands — est l'unique cigarettier.
--
-- 2. LA CHAÎNE DU FAGOT EST IVOIRIENNE. « De la récolte des feuilles de
--    tabac en passant par le séchage, la fermentation jusqu'à la mise
--    des bagues, tout le processus se fait en Côte d'Ivoire »
--    — abidjanmag.com (19 juin 2020) et jcdmag.com.
--    ⚠ LA PHRASE EST IDENTIQUE CHEZ LES DEUX : c'est un communiqué
--    relayé deux fois, donc UNE affirmation portée par deux organes, et
--    non deux constats indépendants. C'est le fabricant qui parle.
--
-- 3. LA COMPOSITION PAR TERROIR, elle, vient d'un TIERS : une cave
--    d'Abidjan (vivinto.net) décrit le Fagot Didiévi Tiébissou comme une
--    CAPE DE TIÉBISSOU sur une SOUS-CAPE ET UNE TRIPE DE DIDIÉVI, deux
--    sols distincts, une centaine de jours de vieillissement, format
--    corona. Le même cigare est vendu chez boutique.mamafrica.net.
--
-- 4. ET LA GÉOGRAPHIE CONFIRME. Tiébissou, Didiévi et Djékanou sont
--    TROIS DES QUATRE DÉPARTEMENTS DE LA RÉGION DU BÉLIER, au centre du
--    pays (le quatrième est Toumodi). Un fabricant qui inventerait des
--    noms de terroir ne tomberait pas par accident sur trois
--    subdivisions contiguës d'une même région administrative.
--
-- ── LES TROUS SONT DÉCLARÉS, PAS COMBLÉS ─────────────────
-- `varieties`, `climate`, `soil` et `harvest` RESTENT VIDES. Panama, le
-- plus mince des seize, les porte tous les quatre ; cette fiche-ci ne
-- les portera pas tant qu'une source ne les donnera pas.
--
-- La variété est le manque qui compte. Une source de faible qualité
-- affirme que le pays ne cultive que du BURLEY — un tabac de cigarette.
-- Rien ne dit que le tabac du Bélier passe par le circuit SITAB du nord,
-- et aucune documentation agricole du tabac dans le Bélier n'a été
-- trouvée. On n'écrit donc ni « Burley », ni autre chose.
--
-- `revenue` reste vide aussi : il n'existe pas de ligne d'exportation de
-- cigares ivoiriens. `rev_detail` porte le tonnage de feuilles en
-- disant ce qu'il mesure — toutes variétés confondues. C'est le cas des
-- Canaries, déjà prévu par la page : le bloc se rend dès que l'un des
-- deux est là.
--
-- ── ET UNE PHRASE QUI DEVIENT FAUSSE ─────────────────────
-- La fiche de la maison, posée par la 164, se termine par : « C'est
-- pourquoi la Côte d'Ivoire figure ici comme pays d'établissements et
-- non comme pays producteur. » Cette migration la rend fausse dans les
-- six langues. Elle est réécrite ici, dans la même transaction : une
-- promotion qui laisserait derrière elle une fiche qui la contredit
-- vaudrait moins que pas de promotion du tout.
--
-- ── UNE NOTE QU'IL FAUT CORRIGER AUSSI ───────────────────
-- La migration 163 a consigné que « Tiassalé n'apparaît nulle part sur
-- le site ». C'était vrai de lefagot.com, et FAUX du dossier : les
-- quatre localités que portait l'ancien champ `city` — Abidjan,
-- Tiassalé, Djékanou, Tiébissou — étaient les SITES DE PRODUCTION. Le
-- champ ne devait pas porter quatre villes, mais elles n'étaient pas du
-- bruit. La rectification est au journal.
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/i18n_dump.php > sql/traductions.sql
--   php tools/coords_check.php     ← les trois zones tombent-elles dans le pays
-- ════════════════════════════════════════════════════════

INSERT INTO `producer_countries`
  (`id`, `name`, `flag`, `lat`, `lon`, `color`, `tier`,
   `region`, `region_en`, `region_es`, `region_de`, `region_zh`, `region_ar`,
   `regions`, `varieties`, `tabacaleras`, `brands`,
   `production`, `production_en`, `production_es`, `production_de`, `production_zh`, `production_ar`,
   `revenue`,
   `rev_detail`, `rev_detail_en`, `rev_detail_es`, `rev_detail_de`, `rev_detail_zh`, `rev_detail_ar`,
   `notes`, `notes_en`, `notes_es`, `notes_de`, `notes_zh`, `notes_ar`)
VALUES (
  'ivorycoast', 'Côte d''Ivoire', '🇨🇮', 7.5000, -5.5000, '#8B2BE2', 'emerging',

  -- La huitième macro-région de l'atlas : aucune n'existait pour
  -- l'Afrique de l'Ouest, le Cameroun étant en « Afrique Centrale ».
  'Afrique de l''Ouest', 'West Africa', 'África Occidental', 'Westafrika', '西非', 'غرب أفريقيا',

  -- LES NOMS DOIVENT CORRESPONDRE EXACTEMENT a ceux des zones de
  -- production : coherence_check exige les deux sens — une region
  -- listee sans zone, ou une zone hors liste, est un point que le globe
  -- ne saura pas relier. Le premier jet ecrivait « Tiébissou (Bélier) »
  -- et le controle a refuse les six fois. Le Bélier est dit ailleurs :
  -- dans `production` et dans la note du sommelier.
  '["Tiébissou","Didiévi","Djékanou"]',
  -- VIDE, ET DÉCLARÉ TEL : aucune source ne donne la variété.
  '[]',
  '["Le Fagot Cigar"]',
  -- « Le Fagot » NE SUFFIT PAS : coherence_check verifie que chaque
  -- maison de la table `brands` est annoncee par la fiche de son pays,
  -- et le nom doit etre le meme des deux cotes — sinon la maison existe
  -- en base et reste invisible depuis le globe.
  '[{"name":"Le Fagot Cigar","desc":"Cape de Tiébissou, sous-cape et tripe de Didiévi","iconic":true}]',

  'Production artisanale, région du Bélier',
  'Artisanal production, Bélier region',
  'Producción artesanal, región de Bélier',
  'Handwerkliche Produktion, Region Bélier',
  '手工生产，贝利耶大区',
  'إنتاج حرفي في منطقة بيلييه',

  '',

  'Environ 8 071 t de feuilles de tabac par an, premier tonnage d''Afrique de l''Ouest (FAO) — toutes variétés confondues. La part qui va au cigare n''est isolée par aucune statistique, et il n''existe pas de ligne d''exportation de cigares ivoiriens.',
  'About 8,071 t of tobacco leaf a year, ranking first in West Africa (FAO) — all varieties together. No statistic isolates the share that goes to cigars, and there is no export line for Ivorian cigars.',
  'Unas 8 071 t de hoja de tabaco al año, el primer tonelaje de África Occidental (FAO), todas las variedades juntas. Ninguna estadística aísla la parte destinada al puro, y no existe una línea de exportación de puros marfileños.',
  'Rund 8 071 t Tabakblatt im Jahr, an erster Stelle in Westafrika (FAO) — alle Sorten zusammen. Keine Statistik trennt den Anteil, der in Zigarren geht, und eine Exportposition für ivorische Zigarren gibt es nicht.',
  '每年约 8 071 吨烟叶，在西非居首位（粮农组织数据），且为各品种合计。没有任何统计单列用于雪茄的部分，也不存在科特迪瓦雪茄的出口税目。',
  'نحو 8071 طنًّا من أوراق التبغ سنويًا، وهو الأول في غرب أفريقيا (منظمة الأغذية والزراعة)، بجميع الأصناف مجتمعة. ولا تفصل أي إحصاءة الحصّة الموجّهة إلى السيجار، ولا يوجد بند جمركي لتصدير السيجار الإيفواري.',

  'Le Fagot assemble une cape de Tiébissou sur une sous-cape et une tripe de Didiévi, deux départements voisins du Bélier, après une centaine de jours de vieillissement.',
  'Le Fagot builds a Tiébissou wrapper over a Didiévi binder and filler, two neighbouring departments of the Bélier, after some hundred days of ageing.',
  'Le Fagot monta una capa de Tiébissou sobre un capote y una tripa de Didiévi, dos departamentos vecinos del Bélier, tras un centenar de días de envejecimiento.',
  'Le Fagot legt ein Deckblatt aus Tiébissou über Umblatt und Einlage aus Didiévi, zwei benachbarte Departements des Bélier, nach rund hundert Tagen Reifung.',
  'Fagot 以蒂耶比苏的茄衣，配以迪迪耶维的茄套与茄芯——两地同属贝利耶大区的相邻省份——并经约一百天陈化。',
  'يجمع فاغو غلافًا من تييبيسو فوق غلاف داخلي وحشوة من ديدييفي، وهما مقاطعتان متجاورتان في بيلييه، بعد نحو مئة يوم من التعتيق.'
);

-- ── Les trois zones de culture ───────────────────────────
-- Coordonnées prises aux chefs-lieux de département (Wikipédia), non
-- fabriquées : Tiébissou 7°09′N 5°14′O, Didiévi 7°08′N 4°54′O,
-- Djékanou 6°29′N 5°07′O. `coords_check.php` vérifie qu'elles tombent
-- bien dans le contour ivoirien du TopoJSON que le globe dessine.
--
-- ⚠ LES IDENTIFIANTS SONT ÉCRITS, et c'est la règle posée par la
-- migration 143. `production_zones.id` est AUTO_INCREMENT et la table
-- est VERSIONNÉE dans sql/contenu.sql ; sans identifiant explicite, le
-- développement et la production en tireraient des numéros différents,
-- et sql/traductions.sql — qui désigne les notes PAR LEUR ID — viserait
-- des lignes qui n'existent pas de l'autre côté. Le premier jet l'a
-- oublié, et coherence_check a refusé les trois lignes.
-- 46-48 : au-dessus du maximum existant (45), sans collision avec les
-- trous de la séquence (20, 21, 42, 43).
INSERT INTO `production_zones` (`id`, `country_id`, `name`, `lat`, `lon`, `note`, `color`,
                                `note_en`, `note_es`, `note_de`, `note_zh`, `note_ar`)
VALUES
  (46, 'ivorycoast', 'Tiébissou', 7.1500, -5.2333, 'Le département qui donne la cape du Fagot.', '#8B2BE2',
   'The department that gives Le Fagot its wrapper.',
   'El departamento que da la capa del Fagot.',
   'Das Departement, das dem Fagot sein Deckblatt gibt.',
   '为 Fagot 提供茄衣的省份。',
   'المقاطعة التي تمنح فاغو غلافه الخارجي.'),
  (47, 'ivorycoast', 'Didiévi', 7.1333, -4.9000, 'Sous-cape et tripe du Fagot.', '#8B2BE2',
   'Le Fagot''s binder and filler.',
   'Capote y tripa del Fagot.',
   'Umblatt und Einlage des Fagot.',
   'Fagot 的茄套与茄芯。',
   'الغلاف الداخلي وحشوة فاغو.'),
  -- DJÉKANOU EST MOINS DOCUMENTÉ que les deux autres, et la note le dit
  -- plutôt que de lui prêter un rôle : la maison le cite parmi ses
  -- sites, les caves qui décrivent l'assemblage ne le nomment pas.
  (48, 'ivorycoast', 'Djékanou', 6.4833, -5.1167, 'Cité par la maison parmi ses sites ; son rôle dans l''assemblage n''est pas précisé.', '#8B2BE2',
   'Named by the house among its sites; its role in the blend is not stated.',
   'Citado por la casa entre sus sitios; su papel en la liga no se precisa.',
   'Vom Haus unter seinen Standorten genannt; seine Rolle in der Mischung wird nicht angegeben.',
   '品牌将其列为产地之一，但未说明其在配方中的作用。',
   'تذكره الدار ضمن مواقعها، دون أن تحدّد دوره في الخلطة.');

-- ── La fiche de la maison : une phrase devenue fausse ────
UPDATE `brands` SET
  `history` = 'Le Fagot Cigar roule ses cigares à la main à Abidjan. La maison revendique un savoir-faire local et un produit sans additif, et se présente comme l''ouvrage de jeunes artisans.

Sa gamme porte trois noms : le Robusto, l''Aboussouan et l''assortiment Fagorillos. L''Aboussouan se décline sous des noms de lieux ivoiriens : Le Poro, au nord, Tiébissou et Djékanou, au centre.

La feuille est ivoirienne. Les caves d''Abidjan qui distribuent le Fagot décrivent une cape de Tiébissou sur une sous-cape et une tripe de Didiévi — deux départements voisins de la région du Bélier — et la presse locale rapporte que la récolte, le séchage et la fermentation se font dans le pays. La variété, elle, n''est indiquée nulle part.',

  `history_en` = 'Le Fagot Cigar hand-rolls its cigars in Abidjan. The house claims local craft and an additive-free product, and presents itself as the work of young artisans.

Its range carries three names: the Robusto, the Aboussouan and the Fagorillos assortment. The Aboussouan appears under Ivorian place names: Le Poro, in the north, Tiébissou and Djékanou, in the centre.

The leaf is Ivorian. The Abidjan merchants who sell Le Fagot describe a Tiébissou wrapper over a Didiévi binder and filler — two neighbouring departments of the Bélier region — and the local press reports that harvest, curing and fermentation all happen in the country. The variety, however, is stated nowhere.',

  `history_es` = 'Le Fagot Cigar lía sus puros a mano en Abiyán. La casa reivindica un saber hacer local y un producto sin aditivos, y se presenta como la obra de jóvenes artesanos.

Su gama lleva tres nombres: el Robusto, el Aboussouan y el surtido Fagorillos. El Aboussouan se declina bajo nombres de lugares marfileños: Le Poro, en el norte, Tiébissou y Djékanou, en el centro.

La hoja es marfileña. Las tiendas de Abiyán que distribuyen el Fagot describen una capa de Tiébissou sobre un capote y una tripa de Didiévi —dos departamentos vecinos de la región de Bélier— y la prensa local informa de que la cosecha, el secado y la fermentación se hacen en el país. La variedad, en cambio, no se indica en ninguna parte.',

  `history_de` = 'Le Fagot Cigar rollt seine Zigarren in Abidjan von Hand. Das Haus beansprucht lokales Handwerk und ein Produkt ohne Zusätze und stellt sich als Werk junger Handwerker dar.

Das Sortiment trägt drei Namen: den Robusto, den Aboussouan und das Fagorillos-Sortiment. Der Aboussouan erscheint unter ivorischen Ortsnamen: Le Poro im Norden, Tiébissou und Djékanou im Landesinneren.

Das Blatt ist ivorisch. Die Händler in Abidjan, die den Fagot führen, beschreiben ein Deckblatt aus Tiébissou über Umblatt und Einlage aus Didiévi — zwei benachbarte Departements der Region Bélier — und die lokale Presse berichtet, dass Ernte, Trocknung und Fermentation im Land stattfinden. Die Sorte wird dagegen nirgends genannt.',

  `history_zh` = 'Fagot Cigar 在阿比让手工卷制雪茄。该品牌宣称秉持本地工艺、产品不含任何添加剂，并自述为一群年轻匠人的作品。

产品线有三个名字：Robusto、Aboussouan，以及 Fagorillos 组合装。Aboussouan 以科特迪瓦地名命名：北部的 Le Poro，中部的 Tiébissou 与 Djékanou。

烟叶产自科特迪瓦。阿比让经销该品牌的雪茄行称其以蒂耶比苏的茄衣，配迪迪耶维的茄套与茄芯——两地同属贝利耶大区的相邻省份——当地媒体也报道采收、晾制与发酵均在国内完成。至于品种，则无处提及。',

  `history_ar` = 'يلفّ Fagot Cigar سيجاره يدويًا في أبيدجان. تعلن الدار عن حرفة محلّية ومنتج خالٍ من أي إضافات، وتقدّم نفسها بوصفها عمل حرفيين شبّان.

تحمل التشكيلة ثلاثة أسماء: روبوستو، وأبوسوان، ومجموعة فاغوريّوس. ويصدر أبوسوان بأسماء أماكن إيفوارية: Le Poro في الشمال، وتييبيسو وجيكانو في الوسط.

الورقة إيفوارية. فمتاجر أبيدجان التي توزّع فاغو تصفه بغلاف من تييبيسو فوق غلاف داخلي وحشوة من ديدييفي، وهما مقاطعتان متجاورتان في منطقة بيلييه، وتفيد الصحافة المحلّية بأنّ الجني والتجفيف والتخمير تجري كلّها داخل البلد. أمّا الصنف فلا يُذكر في أي موضع.',

  `updated_at` = NOW()
 WHERE `name` = 'Le Fagot Cigar';

-- ── Les sceaux, calculés depuis les colonnes ─────────────
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'producer_countries', 'ivorycoast', c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'region'     THEN p.`region`
                         WHEN 'production' THEN p.`production`
                         WHEN 'rev_detail' THEN p.`rev_detail`
                         ELSE p.`notes` END),
       'machine', NOW()
  FROM `producer_countries` p
  JOIN (SELECT 'region' champ UNION ALL SELECT 'production'
        UNION ALL SELECT 'rev_detail' UNION ALL SELECT 'notes') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE p.`id` = 'ivorycoast';

INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'production_zones', z.`id`, 'note', l.lang, SHA1(z.`note`), 'machine', NOW()
  FROM `production_zones` z
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE z.`country_id` = 'ivorycoast';

UPDATE `translation_status` t
  JOIN `brands` b ON b.`name` = t.`entite_id`
   SET t.`source_hash` = SHA1(b.`history`), t.`statut` = 'machine', t.`maj` = NOW()
 WHERE t.`entite` = 'brands' AND t.`champ` = 'history' AND t.`entite_id` = 'Le Fagot Cigar';

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 165','systeme','pays_producteur_ouvert','pays',0,
   'la Cote d Ivoire devient le 17e pays producteur. La 164 avait refuse, faute d une source disant OU la feuille est cultivee. Etabli depuis : le pays est le premier producteur ouest-africain de feuilles (~8 071 t/an, FAO) ; une cave d Abidjan (vivinto.net) decrit le Fagot comme une CAPE DE TIEBISSOU sur une SOUS-CAPE ET UNE TRIPE DE DIDIEVI ; et Tiebissou, Didievi et Djekanou sont trois des quatre departements de la region du Belier'),
  (NULL,'migration 165','systeme','source_ponderee','pays',0,
   'la phrase « tout le processus se fait en Cote d Ivoire » est IDENTIQUE chez abidjanmag.com et jcdmag.com : un communique relaye deux fois, donc UNE affirmation du fabricant portee par deux organes, non deux constats independants. La composition par terroir, elle, vient d un tiers commercial qui n a pas interet a l inventer'),
  (NULL,'migration 165','systeme','trous_declares','pays',0,
   'varieties, climate, soil et harvest RESTENT VIDES, et revenue aussi. Panama, le plus mince des seize, les porte tous. La variete est le manque qui compte : une source faible affirme que le pays ne cultive que du Burley (tabac de cigarette), rien ne dit que le tabac du Belier passe par le circuit SITAB du nord, et aucune documentation agricole du Belier n a ete trouvee. On n ecrit ni « Burley » ni autre chose'),
  (NULL,'migration 165','systeme','phrase_devenue_fausse','marque',0,
   'la fiche Le Fagot Cigar se terminait par « C est pourquoi la Cote d Ivoire figure ici comme pays d etablissements et non comme pays producteur ». Reecrite dans les six langues DANS LA MEME MIGRATION : une promotion qui laisserait derriere elle une fiche qui la contredit vaudrait moins que pas de promotion'),
  (NULL,'migration 165','systeme','note_163_rectifiee','lounge',11,
   'la migration 163 a consigne que « Tiassale n apparait nulle part sur le site ». Vrai de lefagot.com, FAUX du dossier : les quatre localites de l ancien champ city — Abidjan, Tiassale, Djekanou, Tiebissou — etaient les SITES DE PRODUCTION. Le champ ne devait pas porter quatre villes, mais elles n etaient pas du bruit');
