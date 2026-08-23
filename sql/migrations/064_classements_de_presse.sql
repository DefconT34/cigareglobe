-- ════════════════════════════════════════════════════════
-- 064 — Les classements, troisième forme de la même affirmation
-- ────────────────────────────────────────────────────────
-- Après « Score 96 » (migration 059) et « Score Cigar Aficionado 93 »
-- (migration 061), voici la troisième : « régulièrement classé parmi
-- les 25 meilleurs cigares de l'année », « plusieurs fois dans le
-- Top 25 », « régulièrement dans le top 3 des ventes ».
--
-- Aucun chiffre n'y est attaché au mot « score ». Le motif ne les voyait
-- donc pas, alors qu'elles disent exactement la même chose : une
-- distinction de presse que rien ne permet de vérifier.
--
-- ── CE QUE CETTE RÉPÉTITION APPREND ─────────────────────
--
-- Trois fois de suite, un contrôle écrit pour une affirmation a raté la
-- même affirmation dite autrement. Ce n'est pas un défaut de rigueur :
-- c'est la limite d'un contrôle par motif. Il attrape une FORME, et une
-- idée a autant de formes qu'on veut bien lui en donner.
--
-- La leçon pratique tient en une phrase : chaque fois qu'on écrit un
-- motif, il faut chercher dans les données la même idée sous une autre
-- tournure — pas se contenter de vérifier que le motif attrape les cas
-- connus.
--
-- ── UNE NUANCE SUR « TOP 3 DES VENTES » ─────────────────
--
-- Café Crème parle d'un rang de VENTES, pas d'une note de dégustation.
-- C'est une affirmation d'une autre nature — commerciale plutôt que
-- critique — mais elle est tout aussi invérifiable, et elle emprunte la
-- même autorité du chiffre. Elle part avec les autres, et la phrase dit
-- ce qui reste vrai : c'est une version mentholée qui se vend bien.
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[3].story',
  'Cape Connecticut Broadleaf maduro vieillie en fûts de cognac — une première à son lancement en 1999. Notes de cognac, chocolat belge, noix de cajou. L''Añejo No.77 Shark, au format figurado, est la vitole que les amateurs de la maison guettent.')
WHERE `name` = 'Arturo Fuente';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  'Version mentholée — arôme de menthe sur tabac de Java. Pour les fumeurs qui cherchent la fraîcheur. Moins traditionnelle que l''Original, elle a trouvé son public parmi les cigarillos aromatisés.')
WHERE `name` = 'Café Crème';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  'Le format le plus répandu (50 x 124mm) — quarante-cinq minutes, profil terreux et épicé dès les premières bouffées. La référence hondurienne accessible, pour qui cherche du corps sans extrémisme.')
WHERE `name` = 'Excalibur';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  'Gamme maduro, cape Connecticut Broadleaf fermentée trois ans. Notes de chocolat au lait, café torréfié, et une douceur paradoxale malgré la puissance.')
WHERE `name` = 'Partagás USA';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[2].story',
  'La pièce maîtresse de la gamme — cape Connecticut Broadleaf fermentée deux ans. Chocolat au lait, café torréfié, caramel sombre. C''est là que la marque américaine montre le mieux qu''elle s''est construit une identité propre.')
WHERE `name` = 'Romeo y Julieta USA';
