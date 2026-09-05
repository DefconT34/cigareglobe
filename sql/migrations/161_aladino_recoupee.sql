-- ════════════════════════════════════════════════════════
-- 161 — Aladino : trois faits recoupés, dont une cape d'un autre pays
-- ────────────────────────────────────────────────────────
-- LA MARQUE ÉTAIT DÉJÀ LÀ. Demandée à l'ajout, Aladino figure au
-- catalogue depuis août 2026, parmi les douze maisons honduriennes,
-- avec son histoire traduite en cinq langues, sa gamme et ses accords.
-- Il n'y avait rien à créer — mais trois choses à corriger.
--
-- ── 1. LA CAPE DU MADURO N'EST PAS UN COROJO ─────────────
-- La fiche disait : « Le même tabac, cape fermentée plus longtemps »,
-- avec « Corojo Maduro » comme cape.
--
-- C'est faux, et ce n'est pas un détail. L'Aladino Maduro porte une
-- cape SAN ANDRÉS, du Mexique — le seul tabac de la gamme qui ne vienne
-- pas des terres de la famille. Sous-cape corojo hondurien, tripe du
-- Jamastran. Ce n'est donc pas « le même tabac fermenté plus
-- longtemps » : c'est une autre feuille, d'un autre pays.
--
-- Pour une maison dont TOUT l'argument est de ne fumer que son propre
-- corojo, dire que le maduro est le même tabac renverse le sens de la
-- gamme. Un lecteur qui cherche un puro hondurien achèterait le
-- contraire de ce qu'il croit.
--
-- ── 2. L'ANNÉE ──────────────────────────────────────────
-- `founded` disait 2016 ; JRE Tobacco et Aladino sont lancés en 2015.
--
-- ── 3. CE QUE L'HISTOIRE TAISAIT ─────────────────────────
-- Elle écrivait « une grande maison hondurienne qu'il a vendue au début
-- des années 2000 ». C'est CAMACHO, cédée à Davidoff en 2008 — huit ans
-- plus tard que « le début des années 2000 ». Julio R. Eiroa plante à
-- Danlí depuis 1963, et le nom vient d'El Cine Aladino, salle des
-- années 1970 que la famille a transformée en manufacture : l'usine Las
-- Lomas, où les cigares sont roulés aujourd'hui.
--
-- Nommer Camacho n'est pas un détail non plus : c'est ce qui explique
-- pourquoi un planteur de quatre-vingts ans fonde une marque neuve.
--
-- ── CE QU'ON N'AJOUTE PAS, ET POURQUOI ───────────────────
-- Deux lignes de plus sont attestées — un cameroun sorti en 2020, une
-- Vintage Selection. Mais aucune source ne donne leur cape ni leur
-- force, et le champ `gamme` demande les deux. Les inscrire en
-- devinant serait exactement le défaut que les migrations 142 à 160
-- viennent de retirer de sept cents fiches.
--
-- Elles sont donc mentionnées dans l'HISTOIRE, où l'on peut dire
-- qu'elles existent sans prétendre les décrire.
--
-- Le statut des traductions reste « machine ».
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET
  `founded` = '2015 — Danlí, Honduras',

  `history` = 'Julio R. Eiroa plante du tabac à Danlí depuis 1963. Il fut l''homme de Camacho, dont il fit avec son fils Christian l''une des grandes maisons honduriennes, avant de la céder à Davidoff en 2008. Au fil des années il rachète les fermes d''État de la vallée du Jamastran, où la famille cultive encore.

Il revient en 2015 avec son fils aîné Justo et fonde JRE Tobacco, pour faire exactement ce qu''il voulait : un cigare entièrement composé de corojo cultivé sur ses propres terres.

Le corojo est une semence cubaine d''avant les hybrides modernes, réputée difficile — rendements faibles, sensibilité aux maladies — et abandonnée par la plupart des planteurs au profit de variétés plus dociles. En continuer la culture est un choix coûteux, et c''est tout l''argument de la maison : Aladino se présente comme un cigare d''avant, au sens agricole du terme.

Le nom vient d''El Cine Aladino, salle de cinéma de Danlí des années 1970 que la famille a transformée en manufacture — l''usine Las Lomas, où les cigares sont roulés. La gamme s''est étoffée depuis : un maduro en 2018, un cameroun en 2020, une Vintage Selection.',

  `history_en` = 'Julio R. Eiroa has been growing tobacco in Danlí since 1963. He was the man behind Camacho, which he and his son Christian built into one of the great Honduran houses before selling it to Davidoff in 2008. Over the years he bought up the state tobacco farms of the Jamastran valley, where the family still grows.

He returned in 2015 with his eldest son Justo and founded JRE Tobacco, to do exactly what he had wanted to do: a cigar made entirely of corojo grown on his own land.

Corojo is a Cuban seed from before the modern hybrids, notoriously difficult — low yields, prone to disease — and abandoned by most growers in favour of more forgiving varieties. Keeping it in the ground is an expensive choice, and it is the whole argument of the house: Aladino presents itself as a cigar from before, in the agricultural sense.

The name comes from El Cine Aladino, a 1970s cinema in Danlí that the family turned into a factory — the Las Lomas works, where the cigars are rolled. The range has grown since: a maduro in 2018, a Cameroon in 2020, a Vintage Selection.',

  `history_es` = 'Julio R. Eiroa cultiva tabaco en Danlí desde 1963. Fue el hombre de Camacho, que él y su hijo Christian convirtieron en una de las grandes casas hondureñas antes de venderla a Davidoff en 2008. Con los años fue comprando las fincas estatales del valle de Jamastrán, donde la familia sigue cultivando.

Volvió en 2015 con su hijo mayor Justo y fundó JRE Tobacco para hacer exactamente lo que quería: un puro compuesto enteramente de corojo cultivado en sus propias tierras.

El corojo es una semilla cubana anterior a los híbridos modernos, célebre por su dificultad — rendimientos bajos, sensibilidad a las enfermedades — y abandonada por la mayoría de los cultivadores en favor de variedades más dóciles. Seguir sembrándola es una decisión cara, y es todo el argumento de la casa: Aladino se presenta como un puro de antes, en el sentido agrícola.

El nombre viene de El Cine Aladino, una sala de los años setenta en Danlí que la familia transformó en fábrica: la planta Las Lomas, donde se tuercen los puros. La gama ha crecido desde entonces: un maduro en 2018, un camerún en 2020, una Vintage Selection.',

  `history_de` = 'Julio R. Eiroa baut seit 1963 Tabak in Danlí an. Er war der Mann hinter Camacho, das er mit seinem Sohn Christian zu einem der großen honduranischen Häuser machte, bevor er es 2008 an Davidoff verkaufte. Über die Jahre erwarb er die staatlichen Tabakfarmen des Jamastran-Tals, wo die Familie bis heute anbaut.

2015 kehrte er mit seinem erstgeborenen Sohn Justo zurück und gründete JRE Tobacco, um genau das zu tun, was er wollte: eine Zigarre ganz aus Corojo von eigenem Boden.

Corojo ist ein kubanischer Samen aus der Zeit vor den modernen Hybriden, berüchtigt schwierig — geringe Erträge, krankheitsanfällig — und von den meisten Pflanzern zugunsten gefügigerer Sorten aufgegeben. Ihn weiter anzubauen ist eine teure Entscheidung und das ganze Argument des Hauses: Aladino versteht sich als Zigarre von früher, im landwirtschaftlichen Sinn.

Der Name stammt von El Cine Aladino, einem Kino der 1970er Jahre in Danlí, das die Familie zur Manufaktur umbaute — dem Werk Las Lomas, in dem die Zigarren gerollt werden. Das Sortiment ist seither gewachsen: ein Maduro 2018, ein Cameroon 2020, eine Vintage Selection.',

  `history_zh` = '胡利奥·R·艾罗亚自 1963 年起在丹利种植烟草。他曾是 Camacho 的掌舵人，与儿子克里斯蒂安一同将其经营成洪都拉斯的大字号，并于 2008 年售予大卫杜夫。多年间他陆续买下哈马斯特兰谷的国营烟田，家族至今仍在此耕作。

2015 年，他与长子胡斯托一同回归，创办 JRE Tobacco，只为做成他一直想做的事：一支完全由自家土地所产科罗霍烟叶制成的雪茄。

科罗霍是现代杂交品种出现之前的古巴种，以难伺候著称——产量低、易染病——多数种植者早已改种更温顺的品种。坚持种它是一个昂贵的选择，而这正是这家字号的全部主张：Aladino 自称是一支「从前的雪茄」，就农艺意义而言。

店名取自 El Cine Aladino，丹利一家 1970 年代的电影院，家族将其改建为工厂，即今日卷制雪茄的 Las Lomas 厂。此后产品线有所扩充：2018 年的马杜罗、2020 年的喀麦隆种，以及一款 Vintage Selection。',

  `history_ar` = 'يزرع خوليو ر. إيروا التبغ في دانلي منذ عام 1963. كان الرجل الذي يقف خلف كاماتشو، وقد جعلها مع ابنه كريستيان من كبرى الدور الهندوراسية قبل أن يبيعها لدافيدوف عام 2008. وعلى مرّ السنين اشترى مزارع التبغ الحكومية في وادي خاماستران، حيث ما تزال العائلة تزرع.

عاد عام 2015 مع ابنه البكر خوستو وأسّس JRE Tobacco ليفعل تحديدًا ما أراده: سيجار مصنوع بالكامل من تبغ الكوروخو المزروع في أرضه.

الكوروخو بذرة كوبية سابقة للهجائن الحديثة، معروفة بصعوبتها — محصول ضعيف وقابلية للأمراض — وقد هجرها معظم المزارعين لصالح أصناف أطوع. الاستمرار في زراعتها خيار مكلف، وهو كامل حجّة الدار: يقدّم Aladino نفسه سيجارًا من زمن مضى، بالمعنى الزراعي.

الاسم مأخوذ من El Cine Aladino، دار سينما في دانلي من سبعينيات القرن الماضي حوّلتها العائلة إلى مصنع — معمل لاس لوماس حيث تُلفّ السيجار اليوم. وقد اتّسعت التشكيلة منذ ذلك الحين: مادورو عام 2018، وكاميرون عام 2020، وسلسلة Vintage Selection.',

  `gamme` = '[{"name":"Aladino Corojo","color":"#8B4513","force":"Medium","wrapper":"Corojo authentique","vitolas":["Corona","Robusto"],"story":"Cent pour cent corojo cultivé par la famille : une semence d''avant les hybrides, difficile et peu rentable. Fruits secs, bois, cuir, avec une acidité fine que les variétés modernes ont perdue."},{"name":"Aladino Maduro","color":"#3E2723","force":"Full","wrapper":"San Andrés (Mexique)","vitolas":["Toro"],"story":"Paru en 2018. Cape maduro de San Andrés, au Mexique — le seul tabac de la gamme qui ne vienne pas des terres de la famille. Sous-cape corojo hondurienne, tripe du Jamastran. Cacao, café, cèdre et poivre noir."}]',

  `gamme_en` = '[{"name":"Aladino Corojo","color":"#8B4513","force":"Medium","wrapper":"Authentic Corojo","vitolas":["Corona","Robusto"],"story":"One hundred per cent corojo grown by the family: a seed from before the hybrids, difficult and unprofitable. Dried fruit, wood, leather, with a fine acidity that modern varieties have lost."},{"name":"Aladino Maduro","color":"#3E2723","force":"Full","wrapper":"San Andrés (Mexico)","vitolas":["Toro"],"story":"Released in 2018. A San Andrés maduro wrapper from Mexico — the only tobacco in the range that does not come from the family''s own land. Honduran corojo binder, Jamastran filler. Cocoa, coffee, cedar and black pepper."}]',

  `gamme_es` = '[{"name":"Aladino Corojo","color":"#8B4513","force":"Medium","wrapper":"Corojo auténtico","vitolas":["Corona","Robusto"],"story":"Cien por cien corojo cultivado por la familia: una semilla anterior a los híbridos, difícil y poco rentable. Frutos secos, madera, cuero, con una acidez fina que las variedades modernas han perdido."},{"name":"Aladino Maduro","color":"#3E2723","force":"Full","wrapper":"San Andrés (México)","vitolas":["Toro"],"story":"Salió en 2018. Capa maduro de San Andrés, en México: el único tabaco de la gama que no procede de las tierras de la familia. Capote corojo hondureño, tripa de Jamastrán. Cacao, café, cedro y pimienta negra."}]',

  `gamme_de` = '[{"name":"Aladino Corojo","color":"#8B4513","force":"Medium","wrapper":"Echter Corojo","vitolas":["Corona","Robusto"],"story":"Hundert Prozent Corojo aus eigenem Anbau: ein Samen aus der Zeit vor den Hybriden, schwierig und wenig einträglich. Trockenfrüchte, Holz, Leder, mit einer feinen Säure, die moderne Sorten verloren haben."},{"name":"Aladino Maduro","color":"#3E2723","force":"Full","wrapper":"San Andrés (Mexiko)","vitolas":["Toro"],"story":"2018 erschienen. Maduro-Deckblatt aus San Andrés in Mexiko — der einzige Tabak des Sortiments, der nicht vom eigenen Boden stammt. Honduranisches Corojo-Umblatt, Einlage aus dem Jamastran. Kakao, Kaffee, Zeder und schwarzer Pfeffer."}]',

  `gamme_zh` = '[{"name":"Aladino Corojo","color":"#8B4513","force":"Medium","wrapper":"纯正科罗霍","vitolas":["Corona","Robusto"],"story":"百分之百家族自种科罗霍：现代杂交品种出现之前的老种，难伺候且收益微薄。风味见干果、木质与皮革，带一缕现代品种已失去的细致酸度。"},{"name":"Aladino Maduro","color":"#3E2723","force":"Full","wrapper":"圣安德烈斯（墨西哥）","vitolas":["Toro"],"story":"2018 年推出。采用墨西哥圣安德烈斯马杜罗茄衣，是全系列中唯一并非产自家族土地的烟叶。茄套为洪都拉斯科罗霍，茄芯取自哈马斯特兰谷。可可、咖啡、雪松与黑胡椒。"}]',

  `gamme_ar` = '[{"name":"Aladino Corojo","color":"#8B4513","force":"Medium","wrapper":"كوروخو أصيل","vitolas":["Corona","Robusto"],"story":"كوروخو خالص من زراعة العائلة: بذرة سابقة للهجائن، صعبة وقليلة المردود. فواكه مجفّفة وخشب وجلد، مع حموضة رقيقة فقدتها الأصناف الحديثة."},{"name":"Aladino Maduro","color":"#3E2723","force":"Full","wrapper":"سان أندريس (المكسيك)","vitolas":["Toro"],"story":"صدر عام 2018. غلاف مادورو من سان أندريس في المكسيك — التبغ الوحيد في التشكيلة الذي لا يأتي من أرض العائلة. رابط كوروخو هندوراسي وحشوة من وادي خاماستران. كاكاو وقهوة وأرز وفلفل أسود."}]',

  `updated_at` = NOW()
 WHERE `name` = 'Aladino';

UPDATE `translation_status` t
  JOIN `brands` b ON b.`name` = 'Aladino'
   SET t.`source_hash` = SHA1(CASE t.`champ` WHEN 'history' THEN b.`history` WHEN 'gamme' THEN b.`gamme` END),
       t.`statut` = 'machine', t.`maj` = NOW()
 WHERE t.`entite` = 'brands' AND t.`entite_id` = 'Aladino' AND t.`champ` IN ('history','gamme');

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 161','systeme','fait_corrige','marque',0,
   'Aladino Maduro : la cape est une SAN ANDRES du Mexique, pas un « corojo fermente plus longtemps ». Pour une maison dont tout l argument est de ne fumer que son propre corojo, dire que le maduro est le meme tabac renverse le sens de la gamme'),
  (NULL,'migration 161','systeme','fait_corrige','marque',0,
   'Aladino : fondee en 2015 et non 2016 ; la maison vendue est CAMACHO, cedee a Davidoff en 2008 et non « au debut des annees 2000 » ; Julio R. Eiroa plante a Danli depuis 1963 ; le nom vient d El Cine Aladino, salle des annees 1970 devenue l usine Las Lomas'),
  (NULL,'migration 161','systeme','rang_retire','marque',0,
   'premiere redaction : « le Jamastran, l une des regions de tabac les plus reputees au monde ». marques_check l a refusee dans les cinq langues — un rang mondial ne se verifie pas, meme quand une source l affirme. Remplace par ce qui est constatable : la famille y cultive encore'),
  (NULL,'migration 161','systeme','non_ajoute','marque',0,
   'deux lignes attestees — un cameroun de 2020 et une Vintage Selection — ne sont pas inscrites a la gamme : aucune source ne donne leur cape ni leur force, et le champ demande les deux. Elles sont mentionnees dans l histoire, ou l on peut dire qu elles existent sans pretendre les decrire');
