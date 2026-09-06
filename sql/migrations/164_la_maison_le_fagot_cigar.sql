-- ════════════════════════════════════════════════════════
-- 164 — La maison Le Fagot Cigar
-- ────────────────────────────────────────────────────────
-- LA 119e MAISON, ET LA PREMIÈRE HORS D'UN PAYS PRODUCTEUR. Les 118
-- autres ont toutes leur `country_id` dans `producer_countries`. La
-- Côte d'Ivoire est un pays d'ÉTABLISSEMENTS. `page_marque()` prévoit
-- le cas depuis toujours — un LEFT JOIN sur `lounge_countries` — mais
-- aucune donnée ne l'avait jamais emprunté. Le chemin a été éprouvé
-- par la campagne AVANT cette migration, pas après.
--
-- ── POURQUOI UNE MAISON ET PAS UN PAYS PRODUCTEUR ────────
-- La question s'est posée, et la réponse tient à une phrase absente.
-- lefagot.com dit « savoir-faire local », « un terroir riche »,
-- « feuilles minutieusement sélectionnées ». IL NE DIT JAMAIS OÙ LA
-- FEUILLE EST CULTIVÉE.
--
-- Les trois déclinaisons de l'Aboussouan portent des noms de lieux
-- ivoiriens — Le Poro au nord, Tiébissou et Djékanou au centre — et
-- c'est troublant. Mais ce sont des NOMS DE PRODUITS. Un atelier peut
-- parfaitement rouler à la main à Abidjan des feuilles importées ;
-- c'est même le cas le plus fréquent.
--
-- Ouvrir un dix-septième pays producteur reviendrait à affirmer un
-- climat, un sol, une saison de récolte, des régions de culture et des
-- variétés dont aucune source ne dispose — sur la foi de noms de
-- cigares. Le plus mince des seize, Panama, porte tout cela plus un
-- chiffre douanier. C'est exactement le raisonnement qui avait produit
-- les 98 fiches retirées par le chantier des sources.
--
-- CE MANQUE EST ÉCRIT DANS LA FICHE ELLE-MÊME, dans les six langues :
-- le lecteur apprend que la maison parle d'un terroir sans dire où le
-- tabac pousse, et pourquoi la Côte d'Ivoire figure en pays d'adresses.
-- Le jour où la réponse viendra, elle viendra d'Abidjan.
--
-- ── CE QU'ON N'ÉCRIT PAS ─────────────────────────────────
--   `founded`  le site ne donne aucune date. On n'en invente pas.
--   `scores`, `pairings`, `celebrities`, `limited_eds` — rien de sourcé.
--   Les superlatifs du fabricant — « l'équilibre parfait », « une
--   expérience unique et exclusive », « nos meilleures pièces » — sont
--   sa réclame. Ce qui est repris l'est ATTRIBUÉ : « que la maison
--   présente comme », « qu'elle annonce en petite quantité ».
--
-- ── UN GARDE-FOU A REFUSÉ UNE CITATION, ET IL AVAIT RAISON
-- Le premier jet citait le site : « uniquement la feuille, le geste et
-- le temps ». `marques_check` l'a rejetée — « prête une parole ». La
-- citation était pourtant réelle et attribuée, et le fichier prévoit un
-- mécanisme d'exception (Kipling, El Rey del Mundo).
--
-- ON N'EN A PAS OUVERT UNE. La phrase ne disait rien de plus que « sans
-- additif », déjà écrit deux mots plus tôt : elle était DÉCORATIVE. Une
-- exception se réserve à ce qu'une paraphrase perdrait. En ouvrir une
-- pour de l'ornement use le garde-fou pour les fois où il aura raison
-- contre quelque chose qui compte.
--
-- « terroir riche » reste entre guillemets, et n'a pas été signalé :
-- c'est un TERME, pas une parole, et il porte tout le sens du
-- paragraphe — sans les guillemets, l'atlas affirmerait le terroir au
-- lieu de rapporter que la maison le revendique.
--
-- ── UN DÉTAIL DE LANGUE ──────────────────────────────────
-- Le chinois et l'arabe écrivent « Fagot Cigar » sans l'article, comme
-- l'en-tête du site (« FAGOT CIGARE »). Ce n'est pas une coquette :
-- « Le Fagot » et « Le Poro » feraient DEUX jetons français dans une
-- colonne idéographique, et le cliquet de la campagne se déclenche à
-- deux — à raison, une écriture idéographique n'emploie aucun
-- mot-outil latin.
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

INSERT INTO `brands`
  (`name`, `country_id`, `factory`, `history`, `gamme`,
   `history_en`, `history_es`, `history_de`, `history_zh`, `history_ar`,
   `gamme_en`, `gamme_es`, `gamme_de`, `gamme_zh`, `gamme_ar`)
VALUES (
  'Le Fagot Cigar',
  'ivorycoast',
  'Abidjan, Côte d''Ivoire',

  'Le Fagot Cigar roule ses cigares à la main à Abidjan. La maison revendique un savoir-faire local et un produit sans additif, et se présente comme l''ouvrage de jeunes artisans.

Sa gamme porte trois noms : le Robusto, l''Aboussouan et l''assortiment Fagorillos. L''Aboussouan se décline sous des noms de lieux ivoiriens : Le Poro, au nord, Tiébissou et Djékanou, au centre.

Ce que le site ne dit pas, et que l''atlas ne suppose donc pas : d''où vient la feuille. La maison parle d''un « terroir riche » sans indiquer où le tabac est cultivé. C''est pourquoi la Côte d''Ivoire figure ici comme pays d''établissements et non comme pays producteur.',

  '[{"name":"Robusto","color":"#7A4A21","story":"Le format que la maison présente comme son classique, roulé à la main."},{"name":"Aboussouan","color":"#5C3317","story":"La ligne se décline sous des noms de lieux ivoiriens : Le Poro, au nord, que la maison annonce en petite quantité, ainsi que Tiébissou et Djékanou, au centre."},{"name":"Fagorillos","color":"#8B5A2B","story":"Un assortiment de plusieurs modules, proposé pour la découverte ou pour offrir. Les cigares se vendent à l''unité ou en fagots."}]',

  'Le Fagot Cigar hand-rolls its cigars in Abidjan. The house claims local craft and an additive-free product, and presents itself as the work of young artisans.

Its range carries three names: the Robusto, the Aboussouan and the Fagorillos assortment. The Aboussouan appears under Ivorian place names: Le Poro, in the north, Tiébissou and Djékanou, in the centre.

What the site does not say, and what this atlas therefore does not assume: where the leaf comes from. The house speaks of a “rich terroir” without stating where the tobacco is grown. That is why Côte d''Ivoire appears here as a country of establishments and not as a producing country.',

  'Le Fagot Cigar lía sus puros a mano en Abiyán. La casa reivindica un saber hacer local y un producto sin aditivos, y se presenta como la obra de jóvenes artesanos.

Su gama lleva tres nombres: el Robusto, el Aboussouan y el surtido Fagorillos. El Aboussouan se declina bajo nombres de lugares marfileños: Le Poro, en el norte, Tiébissou y Djékanou, en el centro.

Lo que el sitio no dice, y que este atlas no supone: de dónde viene la hoja. La casa habla de un «terruño rico» sin indicar dónde se cultiva el tabaco. Por eso Costa de Marfil figura aquí como país de establecimientos y no como país productor.',

  'Le Fagot Cigar rollt seine Zigarren in Abidjan von Hand. Das Haus beansprucht lokales Handwerk und ein Produkt ohne Zusätze und stellt sich als Werk junger Handwerker dar.

Das Sortiment trägt drei Namen: den Robusto, den Aboussouan und das Fagorillos-Sortiment. Der Aboussouan erscheint unter ivorischen Ortsnamen: Le Poro im Norden, Tiébissou und Djékanou im Landesinneren.

Was die Website nicht sagt und dieser Atlas deshalb nicht unterstellt: woher das Blatt stammt. Das Haus spricht von einem „reichen Terroir“, ohne anzugeben, wo der Tabak angebaut wird. Deshalb steht die Elfenbeinküste hier als Land der Adressen und nicht als Anbauland.',

  'Fagot Cigar 在阿比让手工卷制雪茄。该品牌宣称秉持本地工艺、产品不含任何添加剂，并自述为一群年轻匠人的作品。

产品线有三个名字：Robusto、Aboussouan，以及 Fagorillos 组合装。Aboussouan 以科特迪瓦地名命名：北部的 Le Poro，中部的 Tiébissou 与 Djékanou。

官网没有说明、本图集因此也不作推断的一点是：烟叶从何而来。该品牌提到「丰饶的风土」，却未指明烟草种植地。正因如此，科特迪瓦在此列为设有雪茄场所的国家，而非产烟国。',

  'يلفّ Fagot Cigar سيجاره يدويًا في أبيدجان. تعلن الدار عن حرفة محلّية ومنتج خالٍ من أي إضافات، وتقدّم نفسها بوصفها عمل حرفيين شبّان.

تحمل التشكيلة ثلاثة أسماء: روبوستو، وأبوسوان، ومجموعة فاغوريّوس. ويصدر أبوسوان بأسماء أماكن إيفوارية: Le Poro في الشمال، وتييبيسو وجيكانو في الوسط.

أمّا ما لا يقوله الموقع، وما لا يفترضه هذا الأطلس بناءً على ذلك، فهو منشأ الورقة. تتحدّث الدار عن «تربة غنيّة» دون أن تحدّد مكان زراعة التبغ. لهذا تَرد ساحل العاج هنا بلدَ عناوين لا بلدَ إنتاج.',

  '[{"name":"Robusto","color":"#7A4A21","story":"The format the house presents as its classic, hand-rolled."},{"name":"Aboussouan","color":"#5C3317","story":"The line appears under Ivorian place names: Le Poro, in the north, which the house announces in small quantities, along with Tiébissou and Djékanou, in the centre."},{"name":"Fagorillos","color":"#8B5A2B","story":"An assortment of several modules, offered for discovery or as a gift. The cigars are sold singly or in bundles."}]',

  '[{"name":"Robusto","color":"#7A4A21","story":"El formato que la casa presenta como su clásico, liado a mano."},{"name":"Aboussouan","color":"#5C3317","story":"La línea aparece bajo nombres de lugares marfileños: Le Poro, en el norte, que la casa anuncia en pequeña cantidad, además de Tiébissou y Djékanou, en el centro."},{"name":"Fagorillos","color":"#8B5A2B","story":"Un surtido de varios módulos, propuesto para descubrir o para regalar. Los puros se venden por unidades o en haces."}]',

  '[{"name":"Robusto","color":"#7A4A21","story":"Das Format, das das Haus als seinen Klassiker vorstellt, von Hand gerollt."},{"name":"Aboussouan","color":"#5C3317","story":"Die Linie erscheint unter ivorischen Ortsnamen: Le Poro im Norden, das das Haus in kleiner Menge ankündigt, sowie Tiébissou und Djékanou im Landesinneren."},{"name":"Fagorillos","color":"#8B5A2B","story":"Ein Sortiment mehrerer Module, angeboten zum Entdecken oder zum Verschenken. Die Zigarren werden einzeln oder im Bund verkauft."}]',

  '[{"name":"Robusto","color":"#7A4A21","story":"品牌自称的经典规格，手工卷制。"},{"name":"Aboussouan","color":"#5C3317","story":"该系列以科特迪瓦地名命名：北部的 Le Poro，品牌称其产量稀少；此外还有中部的 Tiébissou 与 Djékanou。"},{"name":"Fagorillos","color":"#8B5A2B","story":"由数款雪茄组成的组合装，供尝鲜或馈赠。雪茄可单支或成捆购买。"}]',

  '[{"name":"Robusto","color":"#7A4A21","story":"القياس الذي تقدّمه الدار بوصفه كلاسيكيّها، ملفوف يدويًا."},{"name":"Aboussouan","color":"#5C3317","story":"يصدر هذا الخط بأسماء أماكن إيفوارية: Le Poro في الشمال، وتعلن الدار أنّه يُنتج بكمّيات قليلة، إلى جانب تييبيسو وجيكانو في الوسط."},{"name":"Fagorillos","color":"#8B5A2B","story":"مجموعة تضمّ عدّة طرازات، تُقترح للاكتشاف أو للإهداء. ويُباع السيجار بالقطعة أو في حزم."}]'
);

-- ── Les sceaux, calculés depuis les colonnes ─────────────
-- Cinq langues x deux champs. `pairings` et `celebrities` restent vides
-- et n'ont donc pas de sceau : c'est la règle déjà suivie par les 118
-- autres maisons — 590 lignes pour `gamme`, 265 seulement pour
-- `celebrities`.
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'brands', 'Le Fagot Cigar', c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'history' THEN b.`history` ELSE b.`gamme` END),
       'machine', NOW()
  FROM `brands` b
  JOIN (SELECT 'history' champ UNION ALL SELECT 'gamme') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE b.`name` = 'Le Fagot Cigar';

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 164','systeme','maison_ajoutee','marque',0,
   'Le Fagot Cigar, Abidjan — 119e maison de l atlas et LA PREMIERE hors d un pays producteur. Les 118 autres ont toutes leur country_id dans producer_countries. page_marque() prevoit le cas depuis toujours (LEFT JOIN sur lounge_countries) mais aucune donnee ne l avait jamais emprunte : le chemin a ete eprouve par la campagne AVANT cette migration'),
  (NULL,'migration 164','systeme','promotion_refusee','pays',0,
   'la Cote d Ivoire N EST PAS passee pays producteur. lefagot.com dit « savoir-faire local », « terroir riche », « feuilles minutieusement selectionnees » et NE DIT JAMAIS OU LA FEUILLE EST CULTIVEE. Les trois declinaisons de l Aboussouan portent des noms de lieux ivoiriens, mais ce sont des noms de PRODUITS : un atelier peut rouler a Abidjan des feuilles importees. Ouvrir un 17e pays producteur imposerait d affirmer climat, sol, recolte, regions et varietes sur la foi de noms de cigares'),
  (NULL,'migration 164','systeme','manque_publie','marque',0,
   'le manque est ECRIT DANS LA FICHE, dans les six langues : le lecteur apprend que la maison parle d un terroir sans dire ou le tabac pousse, et pourquoi la Cote d Ivoire figure en pays d adresses'),
  (NULL,'migration 164','systeme','reclame_non_reprise','marque',0,
   '« l equilibre parfait », « une experience unique et exclusive », « nos meilleures pieces » sont la reclame du fabricant. Ce qui est repris l est ATTRIBUE : « que la maison presente comme », « qu elle annonce en petite quantite ». `founded` reste vide : le site ne donne aucune date');
