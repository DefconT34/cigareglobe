-- ════════════════════════════════════════════════════════
-- 142 — Vingt-neuf sources qui désignent un domaine inexistant
-- ────────────────────────────────────────────────────────
-- `tools/sources.php` compte depuis longtemps les domaines cités qui ne
-- résolvent dans aucun DNS. Il en restait vingt-huit après le chantier
-- des 48 « lcdh-locator » ; ils sont ici, un par fiche, dispersés — et
-- la source de chacune de ces fiches N'EST QUE ce domaine.
--
-- Une source qui n'existe pas n'est pas une source faible : c'est un
-- renvoi vers rien, avec l'apparence d'une vérification.
--
-- ── POURQUOI ON NE LES REMPLACE PAS ──────────────────────
-- Plusieurs ressemblent à des coquilles de domaines réels, et j'ai
-- testé les corrections évidentes :
--
--   hotelgrnadospark.com.py  →  granadospark.com.py     résout
--   dubaicreak.com           →  dubaicreek.com          résout
--   sautterscigars.co.uk     →  sautter.com             résout
--   olivosgolf.it            →  olivosgolf.com.ar       résout
--
-- MAIS UN DOMAINE QUI RÉSOUT NE PROUVE RIEN. `cigarclub.com` existe et
-- ne dit pas qu'il appartient au Cigar Club de Turin ; `thebristol.com`
-- est probablement un hôtel américain sans rapport avec celui de
-- Panama. Substituer sur la seule foi d'une résolution DNS, ce serait
-- réinventer des sources — exactement le défaut qu'on répare.
--
-- Le champ dit donc ce qu'on sait : le domaine cité n'existe pas. Le
-- domaine d'origine est consigné au JOURNAL, pas dans le champ — sans
-- quoi `tools/sources.php`, qui extrait les domaines du texte libre,
-- continuerait à les compter. Leçon de la migration 135.
--
-- ── UNE FICHE VA PLUS LOIN QUE SA SOURCE ─────────────────
-- #1369 « Olivos Golf Club — Cigar Terrace » est classée en ITALIE, à
-- « Milano — Via Linate al Campo 20, Segrate », avec un téléphone
-- italien et une description sur « la haute bourgeoisie milanaise ».
--
-- Or l'Olivos Golf Club est à Ingeniero Pablo Nogués, dans la banlieue
-- de Buenos Aires. Fondé en 1926, il accueille le Torneo de Maestros et
-- son domaine est olivosgolf.com.ar. Il n'y a pas d'Olivos Golf Club à
-- Milan.
--
-- Ce n'est donc pas une source fautive : c'est un COMPOSITE — un nom
-- argentin posé sur une adresse milanaise. On ne sait pas lequel des
-- deux est le vrai, et une fiche dont on ignore de quel établissement
-- elle parle ne peut pas être publiée.
--
-- `is_verified = 0` et non un DELETE : le retrait est réversible, et si
-- un club milanais existe à cette adresse, il méritera sa fiche — sous
-- son nom.
--
-- Après cette migration : php tools/sources.php --figer
-- ════════════════════════════════════════════════════════

-- ── Les vingt-neuf sources ───────────────────────────────
UPDATE `lounges`
   SET `source`     = 'à vérifier — le domaine cité n''existe pas',
       `updated_at` = NOW()
 WHERE `id` IN (195, 232, 235, 236, 248, 255, 277, 284, 285, 331, 385, 423,
                427, 433, 435, 810, 828, 836, 1116, 1172, 1190, 1266, 1279,
                1369, 1370, 1391, 1428, 1505, 1576);

-- ── Le composite argentin-milanais ───────────────────────
UPDATE `lounges`
   SET `is_verified` = 0,
       `source`      = 'RETIRÉ — nom d''un club de Buenos Aires posé sur une adresse de Milan',
       `updated_at`  = NOW()
 WHERE `id` = 1369 AND `country_id` = 'italy' AND `name` LIKE 'Olivos Golf Club%';

-- ── La trace : chaque domaine y est nommé ────────────────
INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 142','systeme','source_inexistante','lounge',195,'domaine cite inexistant : boquete.org'),
  (NULL,'migration 142','systeme','source_inexistante','lounge',232,'domaine cite inexistant : leroyalmonceau.com'),
  (NULL,'migration 142','systeme','source_inexistante','lounge',235,'domaine cite inexistant : lacaveducigare.fr'),
  (NULL,'migration 142','systeme','source_inexistante','lounge',236,'domaine cite inexistant : cigare-attitude.com'),
  (NULL,'migration 142','systeme','source_inexistante','lounge',248,'domaine cite inexistant : elfumadorexperto.com'),
  (NULL,'migration 142','systeme','source_inexistante','lounge',255,'domaine cite inexistant : marbella-cigars.com'),
  (NULL,'migration 142','systeme','source_inexistante','lounge',277,'domaine cite inexistant : sautterscigars.co.uk'),
  (NULL,'migration 142','systeme','source_inexistante','lounge',284,'domaine cite inexistant : mitchellscigar.co.uk'),
  (NULL,'migration 142','systeme','source_inexistante','lounge',285,'domaine cite inexistant : levinsmanchestercigars.co.uk'),
  (NULL,'migration 142','systeme','source_inexistante','lounge',331,'domaine cite inexistant : cigarclub.it'),
  (NULL,'migration 142','systeme','source_inexistante','lounge',385,'domaine cite inexistant : thefleming.com.hk'),
  (NULL,'migration 142','systeme','source_inexistante','lounge',423,'domaine cite inexistant : havanasocialdallas.com'),
  (NULL,'migration 142','systeme','source_inexistante','lounge',427,'domaine cite inexistant : marketcigars.com'),
  (NULL,'migration 142','systeme','source_inexistante','lounge',433,'domaine cite inexistant : pacificcigar.ca'),
  (NULL,'migration 142','systeme','source_inexistante','lounge',435,'domaine cite inexistant : havanaclubottawa.com'),
  (NULL,'migration 142','systeme','source_inexistante','lounge',810,'domaine cite inexistant : masasquare.com'),
  (NULL,'migration 142','systeme','source_inexistante','lounge',828,'domaine cite inexistant : thewheatbaker.com'),
  (NULL,'migration 142','systeme','source_inexistante','lounge',836,'domaine cite inexistant : theArushaHotel.com'),
  (NULL,'migration 142','systeme','source_inexistante','lounge',1116,'domaine cite inexistant : hotelgrnadospark.com.py'),
  (NULL,'migration 142','systeme','source_inexistante','lounge',1172,'domaine cite inexistant : thebristol.com.pa'),
  (NULL,'migration 142','systeme','source_inexistante','lounge',1190,'domaine cite inexistant : golfabidjan.ci'),
  (NULL,'migration 142','systeme','source_inexistante','lounge',1266,'domaine cite inexistant : golfdepedrena.com (accentue)'),
  (NULL,'migration 142','systeme','source_inexistante','lounge',1279,'domaine cite inexistant : hamburger-yc.de'),
  (NULL,'migration 142','systeme','source_inexistante','lounge',1370,'domaine cite inexistant : ismeralda.it'),
  (NULL,'migration 142','systeme','source_inexistante','lounge',1391,'domaine cite inexistant : dubaicreak.com'),
  (NULL,'migration 142','systeme','source_inexistante','lounge',1428,'domaine cite inexistant : abenoharukas.jp'),
  (NULL,'migration 142','systeme','source_inexistante','lounge',1505,'domaine cite inexistant : burningtree.org'),
  (NULL,'migration 142','systeme','source_inexistante','lounge',1576,'domaine cite inexistant : cigarmuseum.do'),
  (NULL,'migration 142','systeme','lounge_retire','lounge',1369,
   'Olivos Golf Club est a Buenos Aires, la fiche le placait a Milan (source olivosgolf.it, inexistant)');
