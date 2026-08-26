-- ════════════════════════════════════════════════════════
-- 092 — Le vocabulaire des récits de gamme, second lot
-- ────────────────────────────────────────────────────────
-- Les vingt-huit récits restants. Après ce lot, le français de l'atlas
-- ne porte plus « wrapper », « blend », « full body » ni « medium-full »
-- nulle part.
--
-- ── SIX AFFIRMATIONS TROUVÉES EN RELISANT ───────────────
--
--   General Cigar : « le best-seller américain DEPUIS 30 ANS ». Déjà
--   retirée de la fiche Macanudo à la migration 070 — la même phrase
--   vivait aussi sur la fiche du groupe, mot pour mot. Cinquième doublon
--   divergent du chantier, et le premier où LA CORRECTION elle-même
--   n'avait touché qu'une des deux copies.
--
--   Liga Privada : « la Unico Serie Papas Fritas est devenue LÉGENDAIRE »
--   et « Chaque édition est ÉPUISÉE AVANT MÊME d'atteindre les étals ».
--   Une rareté annoncée que rien ne mesure — la même que Don Carlos
--   (migration 070) et Trinidad (072).
--
--   Liga Privada : « le T52 est SOUVENT PRÉFÉRÉ au No.9 par les
--   fumeurs ». Préféré par qui, mesuré comment.
--
--   Drew Estate : « la révolte ouvrière LA PLUS RÉUSSIE de l'industrie ».
--
--   Santa Damiana : « le cigare de golf premium PAR EXCELLENCE ».
--
-- ── ET UN NOM DE FORMAT QUI N'EN EST PAS UN ─────────────
--
-- Ashton : « cape équatorienne SUN-GROWN ». Ici l'anglicisme est dans le
-- nom même de la gamme — « VSG, Virgin Sun Grown » — donc le nom propre
-- reste, et seule la description passe au français.
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  'Lancée en 1999 — l''autre Ashton. Cape d''Équateur cultivée en plein soleil, sur assemblage nicaraguayen et dominicain. Corsée : café noir, chocolat, poivre de Cayenne. La VSG révèle une maison capable de puissance quand elle choisit de l''exercer.')
WHERE `name` = 'Ashton';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[2].story',
  'Créée par les torcedores eux-mêmes — les ouvriers de l''usine voulaient un cigare aussi bon que la Liga Privada à un prix qu''ils pouvaient payer. Assemblage proche du No.9, sous une cape d''Équateur moins coûteuse. Notes de chocolat, café, poivre.')
WHERE `name` = 'Drew Estate';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[2].story',
  'Cape San Andrés du Mexique, fermentée — notes de chocolat noir, espresso, épices profondes. La réponse hondurienne au goût du maduro : moins sucrée que les maduros cubains, plus terreuse, plus directe.')
WHERE `name` = 'Excalibur';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'La gamme la plus vendue de la maison aux États-Unis. Cape Connecticut Shade, douce et crémeuse, sur assemblage dominicain et jamaïcain. Notes de crème, cèdre léger, noisette. Format Café Baron de Rothschild (42 x 127mm). Le cigare des terrasses ensoleillées et des après-midi sans urgence.')
WHERE `name` = 'General Cigar';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  'Série inspirée des moteurs Harley-Davidson V-twin, aux formats nommés d''après des pièces : V660 Carb, V554 Piston, V770 Engine. Cape d''Équateur sur nicaraguayen et hondurien. Corsée, notes de cuir, café noir, chocolat. Cigare de route et d''Amérique profonde.')
WHERE `name` = 'General Cigar';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[2].story',
  'La gamme haute de General Cigar sous le nom Punch. Cape maduro du Honduras sur nicaraguayen et hondurien. Notes de chocolat noir, bois fumé, poivre. La face obscure de Punch — puissante là où la gamme classique est accessible.')
WHERE `name` = 'General Cigar';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Cape Ilocos sur tabac de Cagayan. Notes florales, herbes fraîches, légère menthe. Légère et très accessible. La gamme la plus délicate des Philippines — pour découvrir le terroir asiatique sans être intimidé.')
WHERE `name` = 'La Flor de la Isabela';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  '« T » pour Toro, « 52 » pour le calibre. Cape Connecticut Broadleaf, sélectionnée plus étroitement encore que pour le No.9. Profil légèrement différent — plus chocolaté, moins café, plus fruité : figue, datte. Disponibilité plus restreinte que le No.9.')
WHERE `name` = 'Liga Privada';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[2].story',
  'Éditions très limitées — un assemblage différent chaque année, pour un format différent. La Papas Fritas, minuscule (38 x 89mm), est celle dont on parle le plus : cent pour cent Nicaragua vieilli trois ans, format de poche, intensité maximale. Les volumes sont faibles et la disponibilité irrégulière.')
WHERE `name` = 'Liga Privada';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Cape Connecticut Shade d''Équateur sur nicaraguayen léger. Notes de crème, pain grillé, vanille. Légère à mi-corsée, très accessible. Le format Robusto est celui qui laisse l''évolution aller au bout — quarante-cinq minutes de douceur nicaraguayenne.')
WHERE `name` = 'Oliva Connecticut Reserve';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Cape camerounaise sur nicaraguayen de Jalapa. Notes de noisette, chocolat au lait, café crème. Mi-corsée à corsée, équilibrée. Le format No.4 (Robusto) est le plus demandé. L''accessibilité de la maison sans rien céder sur le terroir de Jalapa.')
WHERE `name` = 'Oliva Serie G';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[3].story',
  'Lancée en 2014, hommage à Dámaso Padrón, fils du fondateur. Cape Connecticut, douceur assumée. La Dámaso montre que la maison sait faire doux et élégant sans rien céder sur la construction. Notes de crème, pain brioché, noisette grillée. Pour qui cherche la finesse nicaraguayenne.')
WHERE `name` = 'Padrón';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Gamme haute, sous cape San Andrés du Mexique. Profil terreux et épicé, en hommage au Partagás cubain. Notes de chocolat noir, poivre noir, sous-bois. Pour les amateurs américains qui cherchent l''intensité sans accès à l''original.')
WHERE `name` = 'Partagás USA';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  'Assemblage Habano — cape nicaraguayenne cultivée sous ombrière, sur ligero nicaraguayen. Notes de café crème, épices douces, bois de cèdre. Mi-corsée à corsée, équilibrée. La gamme de tous les jours chez Perdomo — accessible sans rien céder sur la construction.')
WHERE `name` = 'Perdomo';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Cape Connecticut Shade d''Équateur sur nicaraguayen. Notes de crème, vanille, noisette. Légère à mi-corsée. La gamme pour découvrir Perdomo sans s''engager d''emblée sur le corsé du 20th Anniversary.')
WHERE `name` = 'Perdomo Ecuador';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Le nom renvoie à l''origine des capes du premier assemblage, récoltées en 1992 — pas à l''âge du tabac vendu aujourd''hui. Cape Ecuador Connecticut sur tabacs honduriens et nicaraguayens. Notes de noisette grillée, caramel, bois clair. Mi-corsée à corsée, équilibrée ; la série Vintage reste l''une des propositions les plus narratives du marché : chaque millésime raconte une récolte.')
WHERE `name` = 'Rocky Patel';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Gamme d''entrée — cape Connecticut dominicaine sur assemblage de Saint-Domingue. Crémeuse, douce, accessible. Notes de noisette, bois clair, épices douces. Le Romeo y Julieta américain de tous les jours.')
WHERE `name` = 'Romeo y Julieta USA';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  'Gamme médiane — cape d''Équateur sur assemblage nicaraguayen enrichi. Plus de corps et de complexité que la 1875, avec cèdre, poivre blanc et café. Pour ceux qui trouvent la 1875 trop légère.')
WHERE `name` = 'Romeo y Julieta USA';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'La proposition phare — cape Connecticut Shade sur assemblage dominicain pur. Notes de crème, noisette, cèdre blanc. Quarante-cinq minutes de sophistication légère, dans un registre qui n''exige rien du fumeur.')
WHERE `name` = 'Santa Damiana';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  'Cape camerounaise sur assemblage dominicain, allongé de quelques pour cent de Nicaragua. Un peu plus de corps que la Cabinet, avec noisette grillée et chocolat au lait. Toujours dans le registre doux, mais avec plus de complexité.')
WHERE `name` = 'Santa Damiana';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Le produit phare — cape San Andrés Maduro sur assemblage mexicain et nicaraguayen. Notes de chocolat au lait, vanille, café crème. Mi-corsée, douce. Le format Robusto est celui que la maison recommande. La douceur paradoxale du maduro mexicain : sombre à l''œil, suave en bouche. De quoi faire passer un amateur de Connecticut Shade aux capes sombres.')
WHERE `name` = 'Te Amo';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  'Corsée — la face puissante. Cape San Andrés oscuro du Mexique sur ligero mexicain pur. Notes de chocolat noir, réglisse, terre volcanique. Rares et recherchées, les Revolution montrent la dimension tellurique du tabac de Veracruz — le sol volcanique dans chaque bouffée.')
WHERE `name` = 'Te Amo';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[2].story',
  'Cape San Andrés naturelle, non maduro, sur dominicain et mexicain. Notes de noisette, herbes séchées, légère épice. Mi-corsée, accessible. La gamme pour découvrir Te Amo sans l''engagement du maduro.')
WHERE `name` = 'Te Amo';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[2].story',
  'Robusto court (48 x 122mm) — le plus accessible de la gamme. Toute la signature Robaina — cape oscuro, notes terreuses profondes — dans un format de quarante minutes. Le point d''entrée dans l''univers Robaina.')
WHERE `name` = 'Vegas Robaina';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  'La gamme d''exception — hommage au Tessin, la Suisse italophone. Cape oscuro d''Équateur sur assemblage nicaraguayen et brésilien. Profil plus intense, chocolat noir et poivre long. La réponse suisse à la question de ce que l''Europe peut opposer aux grandes maisons du Nouveau Monde.')
WHERE `name` = 'Villiger';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[2].story',
  'Collaboration avec la famille Cuellar, à Estelí. Cape Colorado naturelle sur assemblage nicaraguayen pur. Le positionnement suisse dans le Nouveau Monde — précis, régulier, moins aventureux que Padrón mais très fiable.')
WHERE `name` = 'Villiger';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'La gamme phare — Corona hondurienne sous cape Corojo naturelle. Florale et herbacée, elle développe bois blanc, café léger et épices douces sur cinquante minutes. Le pont entre l''élégance Davidoff et l''intensité hondurienne.')
WHERE `name` = 'Zino Platinum';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  'La proposition plus puissante — cape oscuro du Honduras sur assemblage de Jamastrán enrichi de nicaraguayen. Notes terreuses et épicées, structure plus affirmée. Pour les amateurs Davidoff qui cherchent un palier de puissance de plus.')
WHERE `name` = 'Zino Platinum';
