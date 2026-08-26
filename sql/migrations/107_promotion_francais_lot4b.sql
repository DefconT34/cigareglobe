-- ════════════════════════════════════════════════════════
-- 107 — Promotion vers le français, suite du lot 4
-- ────────────────────────────────────────────────────────
-- ── UNE CONTRADICTION ENTRE DEUX COLONNES ───────────────
--
-- Le français de Café Crème décrivait « la petite boîte métallique
-- BLANCHE ». L'anglais dit « the small YELLOW metal box », et la fiche
-- Henri Wintermans — promue en migration 103 — dit également que « son
-- emballage jaune était devenu un raccourci visuel pour l'après-dîner ».
--
-- Deux colonnes de la même base se contredisaient sur la couleur d'un
-- objet. Aucun contrôle ne peut voir cela : `i18n_divergence` compare
-- les dates, pas les adjectifs. C'est le genre de défaut que seule la
-- relecture attrape — et la promotion EST une relecture.
--
-- La boîte est jaune.
--
-- ── DEUX AFFIRMATIONS RETIRÉES ──────────────────────────
--
--   « celle que LES EXPERTS surveillent pour anticiper les tendances à
--     venir » (CAO, français). Quels experts ? L'anglais dit la même
--     chose de façon observable : les amateurs suivent son calendrier de
--     sorties pour la nouveauté, et comptent sur Macanudo pour la
--     régularité. C'est cette version qui est promue.
--
--   « Il reste L'INTRODUCTEUR UNIVERSEL au cigare » (Café Crème,
--     français). Le fait qui restait dans la même phrase suffit et se
--     vérifie : des générations d'Européens ont fumé là leur premier
--     cigare.
--
-- ── ET UNE ATTRIBUTION CORRIGÉE ─────────────────────────
--
-- Le français attribuait la création du Café Crème au FILS de Henri
-- Wintermans. L'anglais l'attribue à Wintermans lui-même, et la fiche
-- Henri Wintermans reste neutre sur ce point. Faute de savoir, le texte
-- ne tranche plus : il dit que le produit sortit en 1958, sans nommer
-- son auteur.
-- ════════════════════════════════════════════════════════

-- ── CAO ─────────────────────────────────────────────────
UPDATE `brands` SET `history` =
'L''histoire de CAO commence avec des pipes, pas des cigares. Cano Ozgener, émigré de Turquie à Nashville dans les années 1960, fonda son affaire en 1968 comme importateur spécialisé de bruyères turques et de pipes en écume de mer — des produits auxquels son origine lui donnait accès par des relations que ses concurrents américains ne pouvaient pas reproduire. Nashville était un lieu improbable pour un négoce de tabac haut de gamme, mais Ozgener avait compris que sa clientèle n''était pas géographique mais démographique : le collectionneur sérieux existe dans chaque ville américaine, et la vente par correspondance permettait de l''atteindre sans boutique.

Le passage au cigare, dans les années 1990, fut à la fois opportuniste et réfléchi. L''engouement américain de cette décennie créait une demande que les manufactures établies peinaient à satisfaire, et Ozgener reconnut dans la culture du cigare le même goût de connaisseur qu''il servait depuis vingt ans sur le marché de la pipe. Le client qui avait passé des années à former son goût en bruyère était exactement celui qui apprécierait des cigares sérieux — et Ozgener avait vingt ans de relation avec lui.

L''identité de CAO fut d''emblée différente de celle des maisons établies. Là où Arturo Fuente parle d''héritage et de continuité familiale, et Davidoff de précision suisse et d''ascendance cubaine, CAO parle d''innovation et de référence culturelle. La gamme Flathead, nommée d''après l''esthétique des moteurs V-twin Harley-Davidson d''époque et dessinée autour d''elle, en fut la déclaration la plus explicite : un cigare premium qui s''adressait directement au monde de l''amateur américain, au lieu de traduire en tabac les conventions du luxe européen. L''assemblage nicaraguayen et hondurien à l''intérieur, lui, était sérieux.

General Cigar racheta CAO en 2007, faisant entrer ce caractère inventif dans un portefeuille auquel la solidité commerciale de Macanudo ne pouvait pas l''apporter. L''acquisition a préservé le rôle de CAO comme marque qui prend les risques du groupe : celle dont les amateurs suivent le calendrier de sorties pour la nouveauté, quand ils comptent sur Macanudo pour la régularité.'
WHERE `name` = 'CAO';

-- ── Café Crème ──────────────────────────────────────────
UPDATE `brands` SET `history` =
'L''intuition commerciale qui a fait naître le Café Crème était simple, et elle a duré : des millions d''Européens qui n''auraient jamais fumé un cigare fumeraient volontiers quelque chose qui ressemble au café et le sent. Henri Wintermans, dont la manufacture d''Eersel approvisionnait depuis les années 1950 le marché néerlandais en petits cigares classiques, vit dans la culture du café de l''Europe d''après-guerre un public que le commerce traditionnel du cigare ne servait pas, et n''aurait pas imaginé servir.

Le produit sorti en 1958 était techniquement un cigarillo : un petit module de fabrication mécanique, cape de Sumatra sur une tripe de Java et de Sumatra, avec un léger traitement à l''extrait de café appliqué à la production. Ce traitement donnait un repère aromatique immédiat, que la douceur de la cape amplifiait. Le caractère d''ensemble n''avait rien d''un grand cigare : ni terre, ni poivre, ni cuir, aucune intensité. Il était doux, régulier, légèrement sucré, et manifestement agréable à côté d''un café servi sur un zinc français ou tiré d''une machine italienne.

La distribution épousa exactement le concept. Wintermans ne visait ni les buralistes ni les caves à cigares : il visait les cafés, les brasseries, les restaurants et les bars d''hôtel. La petite boîte métallique jaune était conçue pour tenir près de la caisse, dans le même registre visuel qu''une boîte d''allumettes ou un paquet de pastilles — territoire de l''achat d''impulsion, non de l''acquisition réfléchie. Le prix confirmait le positionnement : un Café Crème coûtait moins qu''un verre de vin, ce qui rendait le rituel d''après-dîner accessible à des clients qui n''auraient jamais dépensé un centime chez un buraliste.

British American Tobacco racheta l''affaire au début des années 1970, apportant une infrastructure de distribution mondiale à un produit qui avait déjà atteint une pénétration remarquable par les réseaux régionaux du fondateur. Le groupe étendit le Café Crème à des marchés d''Afrique, d''Asie et du Moyen-Orient où le contexte de la culture du café se transposait bien. Des générations d''Européens ont fumé là leur premier cigare.'
WHERE `name` = 'Café Crème';
