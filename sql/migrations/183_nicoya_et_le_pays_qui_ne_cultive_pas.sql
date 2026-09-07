-- ════════════════════════════════════════════════════════
-- 183 — Nicoya, et le pays qui ne cultive pas
-- ────────────────────────────────────────────────────────
-- ⚠ CETTE MIGRATION CORRIGE UNE ERREUR DE `docs/maisons-absentes.md`,
-- et donc une recommandation de ce dépôt.
--
-- Le document annonçait : « Australie — Nicoya Cigars — un continent de
-- plus ». C'est FAUX, et la vérification l'établit sans ambiguïté :
--
--   La culture commerciale du tabac s'est arrêtée en Australie en
--   OCTOBRE 2006, à Myrtleford, dans le nord-est du Victoria — d'où
--   venaient quatre-vingt-quinze pour cent de la récolte nationale.
--   Elle y est ILLÉGALE depuis. Aucun producteur sous licence.
--
-- Nicoya ne contient donc pas un gramme de tabac australien, et ne peut
-- pas en contenir. C'est une marque australienne roulée à Estelí, chez
-- A.J. Fernández — que l'atlas porte déjà.
--
-- ── LA CONFUSION QUE CELA RÉVÈLE ────────────────────────
-- « Une maison est basée là » n'est pas « ce pays produit ». Le
-- document faisait cette confusion sur ses QUATRE dernières lignes :
-- Pays-Bas, Belgique et Allemagne y figuraient aussi comme des pays à
-- ouvrir — alors qu'ils sont DÉJÀ des pays d'adresses de l'atlas, comme
-- l'Australie, comme la Suisse où la migration 180 a rattaché trois
-- maisons mères. Le document est corrigé en même temps que la base.
--
-- ── D'OÙ LE CLASSEMENT DE CETTE FICHE ───────────────────
-- `country_id` = `nicaragua`. L'atlas classe une MARQUE par le lieu où
-- le cigare est fait, pas par la nationalité de qui le vend. Deux
-- précédents, et ils sont exacts :
--
--   Casdagli        maison britannique, fiche costaricienne
--   Diamond Crown   marque américaine, fiche dominicaine (migration 181)
--
-- La distinction avec les trois maisons suisses de la migration 180
-- tient à ce qu'elles sont des SOCIÉTÉS dont le siège est suisse, pas
-- des marques. Nicoya est une marque.
--
-- L'Australie reste ce qu'elle est déjà dans l'atlas : un pays
-- d'adresses. On y fume, on n'y cultive pas.
--
-- ── ET LE PRIX EST DIT, PARCE QU'IL N'EST PAS DU CIGARE ─
-- Un robusto Nicoya se vend autour de cinquante dollars australiens
-- pièce, la boîte de vingt autour de mille. C'est l'accise qui parle,
-- pas la manufacture — et un lecteur qui compare des prix d'un pays à
-- l'autre doit le savoir. Aucun rang mondial n'est affirmé pour autant.
--
-- ── LE TABLEAU JSON EST POSÉ EN TOUTES LETTRES ──────────
-- Règle des migrations 179 à 182 : aucun `JSON_*`.
-- `producer_countries.brands` pour `nicaragua` passe de vingt et une à
-- vingt-deux entrées, écrites entières.
--
-- Sources : cigarjournal.com « New boutique cigar line honors people of
-- Nicaragua » (Gerard Hayes, 2016, le nom, A.J. Fernández, les deux
-- assemblages), halfwheel.com « Nicoya Cigars to Make U.S. Debut at
-- 2016 IPCPR » (composition détaillée, sous-cape mexicaine du Medios),
-- cigarworld.com.au (formats et prix australiens en vigueur),
-- abc.net.au « Growers agree to leave Myrtleford tobacco industry »
-- (octobre 2006), et les sources publiques sur l'illégalité de la
-- culture en Australie depuis.
--
-- Après cette migration :
--   php tools/contenu_dump.php
--   php tools/i18n_dump.php > sql/traductions.sql
-- ════════════════════════════════════════════════════════

INSERT INTO `brands`
  (`name`, `country_id`, `founded`, `factory`, `history`, `gamme`,
   `history_en`, `history_es`, `history_de`, `history_zh`, `history_ar`,
   `gamme_en`, `gamme_es`, `gamme_de`, `gamme_zh`, `gamme_ar`)
VALUES

('Nicoya', 'nicaragua', '2016 — maison australienne, roulée au Nicaragua',
 'Tabacalera A.J. Fernández, Estelí, Nicaragua',

 'Nicoya est une marque australienne qui ne contient pas un gramme de tabac australien — et qui ne peut pas en contenir. La culture commerciale du tabac s''est arrêtée en Australie en octobre 2006, à Myrtleford, dans le nord-est du Victoria, d''où venaient quatre-vingt-quinze pour cent de la récolte nationale. Elle y est illégale depuis, et il n''existe plus de producteur sous licence.

Gerard Hayes, Australien, lance la marque en 2016 et la finance lui-même. Il va à Estelí et en repart avec un fabricant : A.J. Fernández, que cet atlas porte déjà. Le nom qu''il choisit dit ce qu''il devait — « nicoya » désigne les gens du Nicaragua, et c''est à eux que la marque est dédiée. Elle se montre aux États-Unis la même année, au salon de l''IPCPR.

C''est pourquoi cette fiche est nicaraguayenne et non australienne. L''atlas classe une marque par le lieu où le cigare est fait, pas par la nationalité de qui le vend : Casdagli est une maison britannique roulée au Costa Rica, Diamond Crown une marque américaine roulée en République dominicaine. L''Australie reste dans l''atlas ce qu''elle y est déjà — un pays d''adresses. On y fume, on n''y cultive pas.

Deux assemblages, un seul format : le robusto, cinq pouces sur cinquante-deux. Le prix australien mérite d''être dit, parce qu''il ne tient pas au cigare : une pièce se vend autour de cinquante dollars australiens, la boîte de vingt autour de mille. C''est l''accise qui parle, pas la manufacture.',

 '[{"name":"Nicoya Medios","color":"#A0522D","force":"Medium","wrapper":"Habano Rosado d''Équateur","vitolas":["Robusto"],"story":"Le plus doux des deux, en robusto de cinq pouces sur cinquante-deux. Cape Habano Rosado d''Équateur, sous-cape mexicaine, tripe de habano 2000 dominicain et de visos d''Estelí, d''Ometepe et de Jalapa — c''est au viso de Jalapa que la maison attribue la douceur qu''elle revendique."},{"name":"Nicoya Fuertes","color":"#8B0000","force":"Full","wrapper":"Habano d''Équateur","vitolas":["Robusto"],"story":"Le versant corsé, au même format. Sous la cape équatorienne, la tripe est entièrement nicaraguayenne : ligero du Valle Criollo d''Estelí, visos d''Ometepe et de Jalapa, seco de Condega."}]',

 'Nicoya is an Australian brand that contains not a gram of Australian tobacco — and cannot. Commercial tobacco growing ended in Australia in October 2006, at Myrtleford in north-east Victoria, where ninety-five per cent of the national crop came from. It has been illegal there since, and there is no licensed grower left.

Gerard Hayes, an Australian, launched the brand in 2016 and funded it himself. He went to Estelí and came back with a maker: A.J. Fernández, whom this atlas already holds. The name he chose says what it owed — "nicoya" refers to the people of Nicaragua, and it is to them that the brand is dedicated. It showed in the United States the same year, at the IPCPR trade show.

That is why this entry is Nicaraguan and not Australian. This atlas files a brand by where the cigar is made, not by the nationality of whoever sells it: Casdagli is a British house rolled in Costa Rica, Diamond Crown an American brand rolled in the Dominican Republic. Australia stays in the atlas as what it already is — a country of addresses. People smoke there; they do not grow.

Two blends, one format: the robusto, five inches by fifty-two. The Australian price is worth stating, because it has nothing to do with the cigar: a single goes for around fifty Australian dollars, a box of twenty for around a thousand. That is the excise speaking, not the factory.',

 'Nicoya es una marca australiana que no contiene ni un gramo de tabaco australiano, y que no puede contenerlo. El cultivo comercial de tabaco cesó en Australia en octubre de 2006, en Myrtleford, en el noreste de Victoria, de donde venía el noventa y cinco por ciento de la cosecha nacional. Allí es ilegal desde entonces, y ya no queda ningún productor con licencia.

Gerard Hayes, australiano, lanza la marca en 2016 y la financia él mismo. Va a Estelí y vuelve con un fabricante: A.J. Fernández, que este atlas ya recoge. El nombre que elige dice lo que debía: «nicoya» designa a la gente de Nicaragua, y a ellos está dedicada la marca. Se presenta en Estados Unidos ese mismo año, en el salón de la IPCPR.

Por eso esta ficha es nicaragüense y no australiana. El atlas clasifica una marca por el lugar donde se hace el puro, no por la nacionalidad de quien lo vende: Casdagli es una casa británica liada en Costa Rica, Diamond Crown una marca estadounidense liada en la República Dominicana. Australia sigue siendo en el atlas lo que ya es: un país de direcciones. Allí se fuma, no se cultiva.

Dos ligadas, un solo formato: el robusto, cinco pulgadas por cincuenta y dos. El precio australiano merece decirse, porque no depende del puro: una pieza se vende en torno a cincuenta dólares australianos, la caja de veinte en torno a mil. Es el impuesto especial el que habla, no la manufactura.',

 'Nicoya ist eine australische Marke, die kein Gramm australischen Tabak enthält — und keinen enthalten kann. Der kommerzielle Tabakanbau endete in Australien im Oktober 2006, in Myrtleford im Nordosten Victorias, woher fünfundneunzig Prozent der Landesernte kamen. Seither ist er dort illegal, und es gibt keinen lizenzierten Anbauer mehr.

Gerard Hayes, Australier, brachte die Marke 2016 heraus und finanzierte sie selbst. Er fuhr nach Estelí und kam mit einem Hersteller zurück: A.J. Fernández, den dieser Atlas bereits führt. Der Name, den er wählte, sagt, was er schuldete — "nicoya" bezeichnet die Menschen Nicaraguas, und ihnen ist die Marke gewidmet. Im selben Jahr zeigte sie sich in den Vereinigten Staaten, auf der IPCPR-Messe.

Deshalb steht dieser Eintrag unter Nicaragua und nicht unter Australien. Dieser Atlas ordnet eine Marke dort ein, wo die Zigarre gemacht wird, nicht nach der Nationalität dessen, der sie verkauft: Casdagli ist ein britisches Haus, in Costa Rica gerollt, Diamond Crown eine amerikanische Marke, in der Dominikanischen Republik gerollt. Australien bleibt im Atlas, was es dort schon ist — ein Land der Adressen. Dort wird geraucht, nicht angebaut.

Zwei Mischungen, ein Format: der Robusto, fünf Zoll auf zweiundfünfzig. Der australische Preis gehört genannt, denn er hat mit der Zigarre nichts zu tun: ein Stück kostet um die fünfzig australische Dollar, die Kiste zu zwanzig um die tausend. Da spricht die Verbrauchsteuer, nicht die Manufaktur.',

 'Nicoya 是一个澳大利亚品牌，却不含一克澳大利亚烟叶——而且也不可能含有。澳大利亚的商业烟草种植已于 2006 年 10 月终止，终点是维多利亚州东北部的默特尔福德，全国九成五的收成曾出自那里。此后在澳大利亚种植烟草即属违法，也不再有任何持牌种植者。

澳大利亚人 Gerard Hayes 于 2016 年推出这个品牌，并自行出资。他前往埃斯特利，带回了一位制造商：A.J. Fernández——本图集已有其条目。他所选的名字道出了这份亏欠：「nicoya」指的是尼加拉瓜人，品牌正是献给他们的。同年，它在美国 IPCPR 展会上亮相。

这正是本条目归入尼加拉瓜而非澳大利亚的原因。本图集按雪茄的制作地为品牌归类，而非按销售者的国籍：Casdagli 是在哥斯达黎加卷制的英国庄，Diamond Crown 是在多米尼加共和国卷制的美国品牌。澳大利亚在本图集中仍是它本来的身份——一个有地址的国家。那里有人吸，却无人种。

两种配方，一种尺寸：罗布图，五英寸乘五十二环径。澳大利亚的售价值得一提，因为它与雪茄本身无关：单支约五十澳元，二十支一盒约一千澳元。说话的是消费税，不是工厂。',

 'نيكويا علامة أسترالية لا تحتوي غرامًا واحدًا من التبغ الأسترالي — ولا يمكن أن تحتوي. فقد توقّفت الزراعة التجارية للتبغ في أستراليا في أكتوبر 2006، في ميرتلفورد شمال شرقي فيكتوريا، حيث كان يأتي منها خمسة وتسعون في المئة من المحصول الوطني. وهي محظورة هناك منذ ذلك الحين، ولم يعد ثمّة مزارع مرخَّص واحد.

أطلق الأسترالي جيرارد هايز العلامة عام 2016 ومَوّلها بنفسه. ذهب إلى إستيلي وعاد بمُصنِّع: أ. ج. فرنانديز، الذي يضمّه هذا الأطلس أصلًا. والاسم الذي اختاره يقول ما كان يدين به — فـ«نيكويا» تشير إلى أهل نيكاراغوا، ولهم أُهديت العلامة. وقد ظهرت في الولايات المتحدة العام نفسه، في معرض IPCPR.

ولهذا صُنّفت هذه البطاقة نيكاراغوية لا أسترالية. فالأطلس يصنّف العلامة بمكان صنع السيجار، لا بجنسية بائعه: كازداغلي دار بريطانية تُلَفّ في كوستاريكا، ودايموند كراون علامة أمريكية تُلَفّ في الجمهورية الدومينيكية. أمّا أستراليا فتبقى في الأطلس ما هي عليه أصلًا: بلد عناوين. فيها يُدخَّن، ولا يُزرَع.

مزيجان، ومقاس واحد: روبوستو بخمس بوصات في اثنين وخمسين. ويستحقّ السعر الأسترالي أن يُذكر لأنّه لا يعود إلى السيجار: القطعة بنحو خمسين دولارًا أستراليًا، وعلبة العشرين بنحو ألف. هنا تتكلّم الضريبة، لا المصنع.',

 '[{"name":"Nicoya Medios","color":"#A0522D","force":"Medium","wrapper":"Ecuadorian Habano Rosado","vitolas":["Robusto"],"story":"The milder of the two, a robusto five inches by fifty-two. Ecuadorian Habano Rosado wrapper, Mexican binder, filler of Dominican habano 2000 and visos from Estelí, Ometepe and Jalapa — the house credits the Jalapa viso for the sweetness it claims."},{"name":"Nicoya Fuertes","color":"#8B0000","force":"Full","wrapper":"Ecuadorian Habano","vitolas":["Robusto"],"story":"The fuller side, in the same format. Under the Ecuadorian wrapper the filler is wholly Nicaraguan: ligero from Estelí''s Valle Criollo, visos from Ometepe and Jalapa, seco from Condega."}]',

 '[{"name":"Nicoya Medios","color":"#A0522D","force":"Medium","wrapper":"Habano Rosado de Ecuador","vitolas":["Robusto"],"story":"El más suave de los dos, en robusto de cinco pulgadas por cincuenta y dos. Capa Habano Rosado de Ecuador, capote mexicano, tripa de habano 2000 dominicano y de visos de Estelí, Ometepe y Jalapa: la casa atribuye al viso de Jalapa la dulzura que reivindica."},{"name":"Nicoya Fuertes","color":"#8B0000","force":"Full","wrapper":"Habano de Ecuador","vitolas":["Robusto"],"story":"La vertiente con más cuerpo, en el mismo formato. Bajo la capa ecuatoriana, la tripa es enteramente nicaragüense: ligero del Valle Criollo de Estelí, visos de Ometepe y Jalapa, seco de Condega."}]',

 '[{"name":"Nicoya Medios","color":"#A0522D","force":"Medium","wrapper":"Habano Rosado aus Ecuador","vitolas":["Robusto"],"story":"Die mildere der beiden, ein Robusto von fünf Zoll auf zweiundfünfzig. Deckblatt Habano Rosado aus Ecuador, mexikanisches Umblatt, Einlage aus dominikanischem Habano 2000 und Visos aus Estelí, Ometepe und Jalapa — die Süße, die das Haus beansprucht, schreibt es dem Jalapa-Viso zu."},{"name":"Nicoya Fuertes","color":"#8B0000","force":"Full","wrapper":"Habano aus Ecuador","vitolas":["Robusto"],"story":"Die kräftigere Seite, im selben Format. Unter dem ecuadorianischen Deckblatt ist die Einlage vollständig nicaraguanisch: Ligero aus dem Valle Criollo bei Estelí, Visos aus Ometepe und Jalapa, Seco aus Condega."}]',

 '[{"name":"Nicoya Medios","color":"#A0522D","force":"Medium","wrapper":"厄瓜多尔 Habano Rosado","vitolas":["Robusto"],"story":"两者中较柔和的一款，罗布图，五英寸乘五十二环径。茄衣为厄瓜多尔 Habano Rosado，茄套为墨西哥叶，茄芯用多米尼加 habano 2000 与来自埃斯特利、奥梅特佩和哈拉帕的 viso——品牌把它所标榜的甜润归功于哈拉帕的 viso。"},{"name":"Nicoya Fuertes","color":"#8B0000","force":"Full","wrapper":"厄瓜多尔 Habano","vitolas":["Robusto"],"story":"较浓的一侧，尺寸相同。厄瓜多尔茄衣之下，茄芯全部来自尼加拉瓜：埃斯特利瓦耶克里奥略的 ligero、奥梅特佩与哈拉帕的 viso、孔德加的 seco。"}]',

 '[{"name":"Nicoya Medios","color":"#A0522D","force":"Medium","wrapper":"هابانو روسادو إكوادوري","vitolas":["Robusto"],"story":"الألطف بين الاثنين، روبوستو بخمس بوصات في اثنين وخمسين. غلاف هابانو روسادو إكوادوري، ورابط مكسيكي، وحشوة من هابانو 2000 دومينيكي ومن فيسو إستيلي وأوميتيبي وخالابا — وتنسب الدار الحلاوة التي تدّعيها إلى فيسو خالابا."},{"name":"Nicoya Fuertes","color":"#8B0000","force":"Full","wrapper":"هابانو إكوادوري","vitolas":["Robusto"],"story":"الوجه الأقوى، بالمقاس نفسه. تحت الغلاف الإكوادوري تكون الحشوة نيكاراغوية بالكامل: ليغيرو من بايي كريولو قرب إستيلي، وفيسو من أوميتيبي وخالابا، وسيكو من كونديغا."}]');

-- ════════════════════════════════════════════════════════
-- LES SCEAUX, CALCULÉS DEPUIS LES COLONNES
-- ════════════════════════════════════════════════════════
INSERT INTO `translation_status` (`entite`, `entite_id`, `champ`, `lang`, `source_hash`, `statut`, `maj`)
SELECT 'brands', b.`name`, c.champ, l.lang,
       SHA1(CASE c.champ WHEN 'history' THEN b.`history` ELSE b.`gamme` END),
       'machine', NOW()
  FROM `brands` b
  JOIN (SELECT 'history' champ UNION ALL SELECT 'gamme') c
  JOIN (SELECT 'en' lang UNION ALL SELECT 'es' UNION ALL SELECT 'de'
        UNION ALL SELECT 'zh' UNION ALL SELECT 'ar') l
 WHERE b.`name` = 'Nicoya'
    ON DUPLICATE KEY UPDATE `source_hash` = VALUES(`source_hash`), `maj` = NOW();

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 183','systeme','recommandation_du_depot_infirmee','marque',0,
   'CETTE MIGRATION CORRIGE UNE ERREUR DE docs/maisons-absentes.md, et donc une recommandation de ce depot. Le document annoncait « Australie — Nicoya Cigars — un continent de plus ». C EST FAUX : la culture commerciale du tabac s est arretee en Australie en octobre 2006 a Myrtleford, dans le nord-est du Victoria d ou venaient 95% de la recolte nationale, et elle y est illegale depuis. Nicoya ne contient pas un gramme de tabac australien et ne peut pas en contenir'),
  (NULL,'migration 183','systeme','confusion_maison_et_production','systeme',0,
   'LA CONFUSION REVELEE VAUT POUR QUATRE LIGNES, PAS UNE. « Une maison est basee la » n est pas « ce pays produit ». Le tableau « ce qui etendrait la carte » portait aussi Pays-Bas, Belgique et Allemagne comme des pays a ouvrir — alors qu ils sont DEJA des pays d adresses de l atlas, comme l Australie, comme la Suisse ou la migration 180 a rattache trois maisons meres. Le document est corrige en meme temps que la base'),
  (NULL,'migration 183','systeme','classement_par_lieu_de_fabrication','marque',0,
   'country_id = nicaragua. L atlas classe une MARQUE par le lieu ou le cigare est fait, pas par la nationalite de qui le vend. Deux precedents exacts : Casdagli, maison britannique a fiche costaricienne, et Diamond Crown, marque americaine a fiche dominicaine (migration 181). La distinction avec les trois maisons suisses de la 180 tient a ce qu elles sont des SOCIETES au siege suisse, pas des marques. L Australie reste un pays d adresses : on y fume, on n y cultive pas'),
  (NULL,'migration 183','systeme','prix_dit_car_exogene','marque',0,
   'LE PRIX AUSTRALIEN EST ECRIT PARCE QU IL NE TIENT PAS AU CIGARE : environ cinquante dollars australiens la piece, mille la boite de vingt. C est l accise qui parle, pas la manufacture, et un lecteur qui compare des prix d un pays a l autre doit le savoir. Aucun rang mondial n est affirme pour autant');

-- ════════════════════════════════════════════════════════
-- LE TABLEAU `brands` DU NICARAGUA, EN TOUTES LETTRES
-- ════════════════════════════════════════════════════════
UPDATE `producer_countries`
   SET `brands` = '[{"desc":"Référence absolue du Nicaragua premium","name":"Padrón","iconic":true},{"desc":"Pepin Garcia, maître torcedor légendaire","name":"My Father","iconic":true},{"desc":"Serie V mondialement reconnue","name":"Oliva","iconic":true},{"desc":"Liga Privada, révolution moderne","name":"Drew Estate","iconic":true},{"desc":"Plus grand producteur familial","name":"Plasencia","iconic":false},{"desc":"Élégance et puissance fusionnées","name":"Rocky Patel","iconic":false},{"desc":"Maître du Connecticut nicaraguayen","name":"Perdomo","iconic":false},{"desc":"Plus ancienne manufacture du pays","name":"Joya de Nicaragua","iconic":false},{"desc":"Le mélange privé de Jonathan Drew, devenu culte","name":"Liga Privada","iconic":false},{"desc":"Maison suisse de 1888, roulée à Estelí","name":"Villiger","iconic":false},{"desc":"Le rouleur que les autres marques employaient sans le nommer","name":"A.J. Fernandez","iconic":true},{"desc":"D''abord un planteur de Jalapa, ensuite une marque","name":"Aganorsa Leaf","iconic":true},{"desc":"La grammaire cubaine, la matière nicaraguayenne","name":"Tatuaje","iconic":false},{"desc":"Celle qui a rendu le petit format respectable","name":"Illusione","iconic":false},{"desc":"Un cigare ancré dans une culture, pas seulement un terroir","name":"Foundation Cigar Company","iconic":false},{"desc":"Granada plutôt qu''Estelí, et l''atelier ouvert aux visiteurs","name":"Mombacho","iconic":false},{"desc":"Une marque qui s''est offert sa propre manufacture","name":"Espinosa","iconic":true},{"desc":"Pas d''usine : elle choisit son rouleur selon l''assemblage","name":"Crowned Heads","iconic":true},{"desc":"Des noms cubains d''avant 1960, des assemblages d''aujourd''hui","name":"Warped","iconic":false},{"desc":"Maison nicaraguayenne, encore peu documentée ici","name":"Capitol","iconic":false},{"desc":"Repris par la famille García en décembre 2019, après quarante-cinq ans chez Quesada","name":"Fonseca Nicaraguayen","iconic":false},{"name":"Nicoya","desc":"Maison australienne roulée à Estelí — l''Australie ne cultive plus depuis 2006","iconic":false}]',
       `updated_at` = NOW()
 WHERE `id` = 'nicaragua';
