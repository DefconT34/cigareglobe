-- ════════════════════════════════════════════════════════
-- 102 — Promotion vers le français, lot 2 sur 8
-- ────────────────────────────────────────────────────────
-- Suite de la migration 101. Trois fiches dont le français était un
-- moignon de moins de 350 caractères ; la migration 103 traite les trois
-- dernières du lot.
--
-- ── CE QUE LA PROMOTION FILTRE, ENCORE ──────────────────
--
--   « America's most celebrated wrapper leaf » (Perdomo Ecuador) — un
--     rang national. Le texte dit désormais que la vallée du Connecticut
--     « a fait la réputation du tabac américain » : le fait, sans le
--     classement.
--
--   « the most elegant style in the market » (Perdomo Ecuador) — un
--     premier rang de marché, la forme même que les migrations 089→093
--     ont retirée quinze fois.
--
--   « the darkest commercially available Honduran-blend wrapper in the
--     major American catalog » (CAO Black) — personne ne mesure la
--     noirceur des capes du marché. Ce qui reste est vérifiable et dit
--     l'essentiel : une feuille qui a fermenté à l'intensité maximale
--     sans céder structurellement.
--
-- ── CE QUI EST GARDÉ, ET POURQUOI ───────────────────────
--
-- « the most challenging proposition in the CAO catalog » et « the
-- catalog's most accessible line » (Oliva Serie G) restent : un rang
-- INTERNE à un catalogue est vérifiable par qui l'ouvre. C'est la même
-- distinction qu'en migration 100 — le spécifique et attribuable reste,
-- le vague et inattribuable part. Le premier est en outre attribué à
-- CAO, qui « présente » sa gamme ainsi.
--
-- « blenders prize it » n'est pas une récompense mais l'anglais pour
-- *apprécié* : c'est l'un des onze faux amis écartés en migration 100.
-- ════════════════════════════════════════════════════════

-- ── Perdomo Ecuador ─────────────────────────────────────
UPDATE `brands` SET `history` =
'L''histoire du Connecticut Shade compte deux chapitres. Le premier se déroule dans la vallée du Connecticut, où un sol sableux et une lumière diffuse produisent depuis plus de deux siècles la cape qui a fait la réputation du tabac américain. Le second — moins connu, et à certains égards plus intéressant — se joue en Équateur, où les planteurs ont compris dans les années 1990 que l''altitude quasi équatoriale et une couverture nuageuse constante pouvaient reproduire les conditions qui font la singularité du Connecticut Shade.

Le Connecticut Shade équatorien pousse à des altitudes où l''air plus rare et la diffusion régulière des nuages créent naturellement ce que les planteurs du Connecticut doivent obtenir à l''aide d''ombrières. Il en sort une feuille qui garde l''onctuosité propre au Connecticut, avec une complexité supplémentaire tirée des sols volcaniques et du microclimat des Andes. Plusieurs grandes maisons — Davidoff au premier rang — s''approvisionnent aujourd''hui en Équateur plutôt que dans le Connecticut.

La gamme Ecuador de Perdomo bâtit toute sa proposition sur ce choix d''approvisionnement. La cape, issue de cette culture d''altitude, apporte à l''assemblage une texture plus soyeuse et une teneur en huiles plus marquée que le Connecticut Shade courant. Dessous, une tripe nicaraguayenne de Jalapa — plus légère que celle du Perdomo 20th Anniversary, calibrée pour laisser la cape mener — donne des notes de crème, de vanille douce et de céréales grillées, sans le poids qui écraserait la délicatesse de l''Ecuador.

La gamme est la face douce d''une maison connue pour sa puissance nicaraguayenne. Nick Perdomo a bâti sa réputation en montrant que le tabac du Nicaragua pouvait rivaliser de complexité et de profondeur avec le cubain. L''Ecuador tient un autre raisonnement : la même plantation et la même précision d''assemblage, appliquées à des matériaux plus légers, produisent une élégance qui ne doit rien à la force.'
WHERE `name` = 'Perdomo Ecuador';

-- ── CAO Black ───────────────────────────────────────────
UPDATE `brands` SET `history` =
'La vallée mexicaine de San Andrés s''étend dans l''État de Veracruz, entre la côte du golfe du Mexique et les volcans de l''Orizaba, à des altitudes de 800 à 1 200 mètres. Sols volcaniques, humidité constante apportée par les masses d''air du golfe, températures tempérées par l''altitude : ces conditions donnent un tabac qui ne ressemble à aucun autre sur le continent américain. La feuille de San Andrés est sombre — naturellement, sans la fermentation prolongée qui produit les maduros du Connecticut ou du Brésil — et porte une amertume particulière, que les assembleurs recherchent pour sa capacité à tenir un assemblage face à la douceur des tripes plus légères.

La cape San Andrés Maduro de la gamme Black pousse ce terroir à son terme. La feuille, déjà sombre à l''état naturel, subit une fermentation prolongée qui la mène jusqu''au presque noir et transforme son amertume en un caractère épicé complexe. Le résultat n''est pas une couleur ajoutée mais une feuille qui a fermenté à l''intensité maximale sans céder structurellement.

Sur la tripe nicaraguayenne et hondurienne que CAO emploie dans tout son catalogue premium, cette cape crée un profil sans équivalent dans la gamme. Le premier tiers donne du cacao pur — ni sucré ni dilué, l''amertume franche du chocolat de couverture. Le deuxième introduit réglisse et poivre de Cayenne, dans une combinaison qui rappelle le mole mexicain — ce n''est pas un hasard : la tradition des piments de San Andrés cohabite avec celle du tabac. Le dernier tiers s''achève sur une finale longue et chaude d''épices sombres et d''expresso.

CAO présente la Black comme la proposition la plus exigeante de son catalogue — un cigare pour les fumeurs qui ont dépassé le goût de la douceur et de la crème dominant les gammes Connecticut et Cameroon, et qui cherchent délibérément l''intensité. Elle a trouvé son public chez les amateurs qui trouvent les nicaraguayens corsés trop linéaires et cherchent la dimension aromatique particulière qu''apporte une cape mexicaine sombre.'
WHERE `name` = 'CAO Black';

-- ── Oliva Serie G ───────────────────────────────────────
UPDATE `brands` SET `history` =
'La Serie G occupe une position précise dans le catalogue Oliva : c''est la gamme qui répond à la question de ce qu''une cape camerounaise fait au tabac nicaraguayen, quand l''une et l''autre sont choisies avec la précision que la maison réserve à ses lignes hautes.

Cape du Cameroun sur tripe nicaraguayenne de Jalapa n''est pas une combinaison rare — on la trouve partout sur le marché premium — mais l''exécution change tout. Les feuilles retenues par Oliva pour la Serie G viennent du milieu de gamme de la province du Centre : plus sombres et plus complexes que ce qui entre dans les camerounais courants, sans la structure de coût des sélections AVO XO réservées aux gammes plus chères. Il en résulte une cape qui donne chocolat et épice douce à un prix qui autorise le cigare quotidien.

La tripe de Jalapa — récoltée sur les plantations d''Oliva — ajoute sous cette douceur la profondeur terreuse propre à la maison. L''ensemble se tient en mi-corsé à corsé, sans la puissance frontale de la Serie V : noisette et chocolat au lait d''abord, puis café et cèdre, vers une finale de poivre doux et de fruits secs. C''est un cigare qui tient sa complexité sur toute sa longueur, sans à-coups d''intensité.

La Serie G a été conçue comme la porte d''entrée du catalogue — celle qui fait découvrir ce que le tabac de Jalapa sait faire, avant la Serie V et le Melanio. Dans les faits, elle est aussi devenue la gamme vers laquelle les fumeurs expérimentés reviennent quand ils veulent la qualité sans l''exigence physique d''un corsé. Ce double rôle, seuil et destination, compte autant que sa position de ligne la plus accessible du catalogue.'
WHERE `name` = 'Oliva Serie G';
