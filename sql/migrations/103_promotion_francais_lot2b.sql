-- ════════════════════════════════════════════════════════
-- 103 — Promotion vers le français, fin du lot 2
-- ────────────────────────────────────────────────────────
-- Les trois dernières fiches dont le français était un moignon.
-- Avec celles-ci, les onze fiches à moignon sont traitées ; restent 29
-- fiches où le français fait déjà 700 à 1 200 caractères et l'anglais
-- 2 000 à 3 200 — un travail de FUSION, plus lent que le remplacement.
--
-- ── CE QUE LA PROMOTION FILTRE, ENCORE ──────────────────
--
--   « one of the most recognized cigar formats in European history »
--     (Henri Wintermans) — un rang. La preuve qui le suivait, elle, se
--     garde et dit davantage : dans les années 1970, le Café Crème était
--     dans tous les cafés d'Europe de l'Ouest.
--
--   « mechanisms that NO OTHER European market could match » — devient
--     « que peu d'autres places européennes possédaient ».
--
--   « the most celebrated shade-grown leaf in the Americas — the
--     standard against which every other Connecticut-style wrapper is
--     measured » (CAO America). Le fait qui reste se vérifie : le sol
--     sablo-limoneux, et la réputation du style. Le classement, non.
--
--   « the most complete expression of that profile currently available
--     in the international market » (La Flor de la Isabela) — un rang
--     de marché, retiré.
--
--   « a flavor dimension that appears in NO OTHER major tobacco-growing
--     region at comparable concentration » — adouci en « rare parmi les
--     grandes régions productrices ». La caractérisation comparative qui
--     suit — cubain terreux, nicaraguayen poivré, hondurien lourd,
--     dominicain neutre — reste : elle décrit, elle ne classe pas.
--
-- ── ET CE QUI EST GARDÉ ─────────────────────────────────
--
-- « the crown's most productive colonial tobacco operation » : un rang
-- INTERNE aux possessions espagnoles, historique et borné. Même
-- distinction qu'en migration 100 — le spécifique et attribuable reste.
-- ════════════════════════════════════════════════════════

-- ── La Flor de la Isabela ───────────────────────────────
UPDATE `brands` SET `history` =
'L''histoire du tabac philippin est l''une des plus anciennes et des moins racontées du cigare premium. L''administration coloniale espagnole reconnut la qualité de la feuille de la vallée de Cagayan dès le XVIIe siècle et établit un monopole du tabac — la Real Compañía de Filipinas — qui contrôla production, prix et exportation pendant plus d''un siècle. Quand ce monopole fut dissous, en 1881, le tabac philippin approvisionnait le marché espagnol depuis des générations, et les communautés paysannes de l''archipel avaient mis au point des techniques de culture adaptées au sol et au climat de Cagayan.

La Flor de la Isabela naquit cette même année 1881, en même temps que Tabacalera, comme marque sœur destinée à occuper une autre place sur le marché. Là où Tabacalera irait vers les expressions les plus pleines du tabac philippin, La Flor de la Isabela fut conçue pour montrer ce que les feuilles de Cagayan et d''Ilocos ont de plus délicat — cette floralité, cette légèreté herbacée qui distinguent le tabac des Philippines.

Le nom rend hommage à la reine Isabelle II d''Espagne, sous le règne de laquelle le monopole fut réorganisé et à l''époque de laquelle les Philippines constituaient la plus productive des exploitations tabacales de la Couronne. C''est une référence historique inscrite sur chaque bague.

Les feuilles de Cagayan et d''Ilocos retenues pour la marque le sont pour leurs qualités florales — ce caractère légèrement mentholé et herbacé qui apparaît à la rétro-olfaction et dans la longue finale des bons cigares philippins. C''est une dimension aromatique rare parmi les grandes régions productrices. Le tabac cubain est terreux ; le nicaraguayen, poivré ; le hondurien, lourd ; le dominicain, neutre et racé. Le philippin est floral — un registre qui parle aux palais tournés vers le thé vert, le cèdre frais et l''épice légère plutôt que vers la terre sombre et le cacao.'
WHERE `name` = 'La Flor de la Isabela';

-- ── Henri Wintermans ────────────────────────────────────
UPDATE `brands` SET `history` =
'Henri Wintermans entra dans le métier du cigare en 1904, avec l''instinct d''un fabricant et une ambition commerciale conforme à la tradition marchande néerlandaise. Installé à Eersel, dans le sud des Pays-Bas — une région où l''on fabriquait des cigares depuis le début du XIXe siècle, approvisionnée par les réseaux coloniaux qui contrôlaient une part importante de la production de Sumatra et de Java —, il bâtit une manufacture qui se distingua dès ses premières années par la qualité de son approvisionnement indonésien.

Ce lien avec le tabac indonésien fut l''avantage structurel qui définit le modèle de la maison pendant un demi-siècle. Les Pays-Bas administraient les Indes néerlandaises depuis le XVIIe siècle, et les maisons de négoce d''Amsterdam avaient développé, pour sélectionner et vieillir le tabac de Java et de Sumatra, des mécanismes que peu d''autres places européennes possédaient. Wintermans s''appuya sur ce réseau pour obtenir des capes et des sous-capes de qualité constante pour ses petits modules — des produits destinés au fumeur européen de tous les jours, non au collectionneur.

Le Café Crème, lancé en 1958, devint le produit emblématique de la maison. Petit cigarillo de fabrication mécanique, au léger arôme café venu pour partie de la cape indonésienne et pour partie d''un traitement appliqué à la production, il occupa une place que rien d''autre ne remplissait : accessible, régulier, abordable, et clairement du cigare plutôt qu''un compromis avec la cigarette. Dans les années 1970, il était présent dans tous les cafés, bars et restaurants d''Europe de l''Ouest, et son emballage jaune était devenu un raccourci visuel pour l''après-dîner.

British American Tobacco racheta l''affaire au début des années 1970, dans son mouvement de consolidation du marché européen du cigare. Le Café Crème continua sans reformulation notable — le groupe avait compris que son attrait tenait à sa régularité, et que le modifier abîmerait précisément ce qui faisait sa valeur. Les cigares et cigarillos Henri Wintermans sont toujours produits aujourd''hui, toujours à partir de feuilles d''origine indonésienne.'
WHERE `name` = 'Henri Wintermans';

-- ── CAO America ─────────────────────────────────────────
UPDATE `brands` SET `history` =
'CAO America est une déclaration d''indépendance — non pas politique, mais agricole. Lancée en 2004, elle arrive à un moment où le cigare premium ne parlait plus que de puissance nicaraguayenne et de terre hondurienne. La conversation portait sur l''Amérique centrale. CAO répondit en regardant vers le nord, vers les champs qui avaient approvisionné les fumeurs américains pendant trois siècles, avant que la révolution cubaine et l''essor nicaraguayen ne redessinent le marché.

Le principe est simple, et presque provocant de précision : du tabac américain à 100 %, dans chaque composant. Les capes viennent de la vallée du Connecticut, dont le sol sablo-limoneux donne la feuille d''ombre qui a fait la réputation du style. Les sous-capes viennent du comté de Lancaster, en Pennsylvanie, où l''on cultive le broadleaf depuis le XVIIe siècle. Les tripes mêlent des feuilles de Virginie — où la culture du tabac est antérieure aux États-Unis eux-mêmes — et à nouveau du Connecticut.

Techniquement, cela produit un cigare entièrement hors du profil centraméricain qui domine le secteur. Les America sont plus ronds, plus doux, plus herbacés que les nicaraguayens. Ils ont l''onctuosité que donne naturellement un bon Connecticut Shade, avec des notes de foin sec, de cèdre chaud et la légère note de noisette d''une feuille de Pennsylvanie bien séchée. La force moyenne laisse le tabac s''exprimer sans le poivre et la terre qui marquent le style nicaraguayen.

La gamme se heurta d''abord au scepticisme de détaillants habitués à vendre de l''intensité. Le tabac américain était associé, un peu injustement, au marché de masse mécanisé plutôt qu''au premium artisanal. CAO America prit ce préjugé de front, en se présentant comme le produit d''un choix de terroir délibéré et non d''un calcul commercial. Le succès qui suivit — surtout sur les marchés où l''élégance prime sur la puissance — a validé le pari.'
WHERE `name` = 'CAO America';
