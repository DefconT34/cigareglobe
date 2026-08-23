-- ════════════════════════════════════════════════════════
-- 071 — La citation sans verbe : ce que le détecteur regardait vraiment
-- ────────────────────────────────────────────────────────
-- Septième échappée du chantier, et la plus instructive.
--
-- La Flor Dominicana portait ceci, sous un en-tête « José Blanco » :
--
--   Blanco crée chaque nouveau cigare en aveugle […]. « Si tu sais ce
--   que tu fumes, tu n'évalues plus le cigare. Tu évalues tes
--   attentes. »
--
-- Une citation entière, deux phrases, entre guillemets, attribuée à une
-- personne VIVANTE. Le détecteur ne l'a jamais vue.
--
-- ── POURQUOI ────────────────────────────────────────────
--
-- Parce qu'il cherchait un VERBE : « dit », « déclara », « confia », un
-- deux-points, une incise « répondit-il ». Il détectait la syntaxe de
-- l'attribution, pas le fait de la citation.
--
-- Or ici il n'y a aucun verbe. La phrase est simplement posée après un
-- point. C'est l'EN-TÊTE de la fiche qui l'attribue — « José Blanco »,
-- en gras, au-dessus. L'attribution est faite par la mise en page, et
-- une expression régulière ne lit pas la mise en page.
--
-- Les deux premières leçons du chantier portaient sur la FORME de
-- l'idée (cinq écritures d'une note de presse) puis sur la COLONNE où
-- elle se cache (migration 068). Celle-ci porte sur le MARQUEUR : le
-- contrôle s'était accroché à un indice grammatical qui peut
-- simplement ne pas être là.
--
-- La règle ajoutée ne cherche plus de verbe du tout. Une portion entre
-- guillemets d'au moins quarante caractères, ou qui contient une phrase
-- complète, est une parole prêtée. Les guillemets d'ironie entourent un
-- terme — « zone dorée », « petit cigare » — donc courts et sans point :
-- ils passent. Vérifié sur les 116 fiches, trois déclenchements, zéro
-- fausse alerte.
--
-- ── LES DEUX AUTRES ─────────────────────────────────────
--
-- Santa Damiana : « Un grand cigare doux est infiniment plus difficile
-- à créer qu'un grand cigare puissant », répète-t-il depuis trente ans.
-- Le verbe était là — mais « répète » ne figurait pas dans la liste, qui
-- contenait « dit », « déclara », « confia », « raconta »... Une liste
-- de verbes est un inventaire ouvert, et un inventaire ouvert est
-- toujours incomplet. Hendrik Kelner est vivant.
--
-- Partagás USA : « le terroir de Cuba ne se transplante pas », introduit
-- par « en soulignant que » — verbe absent de la liste lui aussi.
--
-- Les trois citations partent. Ce qui reste dans chaque fiche est le
-- fait, pas la phrase : Blanco assemble à l'aveugle, Kelner travaille le
-- cigare doux, Cifuentes a conseillé des manufactures américaines.
--
-- ── UNE PRATIQUE, DEUX MAISONS ──────────────────────────
--
-- La migration 068 a réécrit chez Perdomo une anecdote de dégustation à
-- l'aveugle. Celle de Blanco dit presque la même chose. Rien ne prouve
-- qu'une fiche ait copié l'autre — deux fabricants peuvent
-- parfaitement travailler ainsi — mais les deux textes sont désormais
-- écrits pour ne pas se paraphraser.
--
-- ── ET LE RESTE DU LOT ──────────────────────────────────
--
-- « L'Armagnac vieillit » pour « vieilli » chez Partagás : troisième
-- faute d'accord ou d'orthographe du chantier, toutes trouvées en
-- traduisant.
--
-- « Un Good Things Stout » accompagnait une entrée intitulée « Porter
-- irlandais » : une bière porter annoncée, un stout dans le texte, et
-- une marque que je ne peux pas vérifier. La phrase dit maintenant le
-- style, pas un nom.
--
-- « La gamme la plus vendue de CAO en Europe » rejoint les affirmations
-- de vente retirées à la migration 070.
-- ════════════════════════════════════════════════════════

-- ── Les trois paroles prêtées ───────────────────────────
UPDATE `brands` SET `celebrities` = JSON_SET(`celebrities`, '$[0].anecdote',
  'Blanco compose ses assemblages sans savoir ce qu''il a en main : les cigares d''essai lui sont présentés sans indication de contenu. L''idée n''est pas de se méfier de son goût, mais de l''empêcher de retrouver ce qu''il a lui-même prévu.')
WHERE `name` = 'La Flor Dominicana';

UPDATE `brands` SET `celebrities` = JSON_SET(`celebrities`, '$[0].anecdote',
  'L''assembleur derrière Santa Damiana — et aussi Davidoff Dominican, Avo et une douzaine d''autres marques — est l''un des techniciens du tabac les moins médiatisés et les plus influents de l''industrie. Son registre est le cigare doux et complexe, plus exigeant à tenir que la puissance : un assemblage léger ne cache aucun défaut.')
WHERE `name` = 'Santa Damiana';

UPDATE `brands` SET `celebrities` = JSON_SET(`celebrities`, '$[0].anecdote',
  'Le dernier propriétaire privé du Partagás havanais avant la nationalisation de 1960 a fini sa carrière aux États-Unis, où il a conseillé plusieurs manufactures. Sa présence a donné à la branche américaine une continuité de savoir-faire — mais pas de terroir, et c''est toute la question que pose une marque cubaine fabriquée ailleurs.')
WHERE `name` = 'Partagás USA';

-- ── CAO ─────────────────────────────────────────────────
UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Cape camerounaise sur assemblage hondurien et dominicain. Notes de chocolat au lait, noisette, herbes douces. Mi-corsée, équilibrée. La cape camerounaise apporte une onctuosité reconnaissable — légèrement sucrée en surface, plus complexe à mi-parcours. C''est la gamme par laquelle CAO s''est installée en Europe.')
WHERE `name` = 'CAO';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[2].story',
  '100 % nicaraguayen — une déclaration, dans un monde d''assemblages multi-pays. Cape, sous-cape et tripe viennent toutes du Nicaragua. Notes de café pur, cacao, poivre noir. La gamme des puristes du terroir nicaraguayen.')
WHERE `name` = 'CAO';

-- ── Partagás ────────────────────────────────────────────
UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[3].story',
  'La gamme d''entrée — mais chez Partagás, l''entrée est relative. Les Habaneros Short sont les cigares du plaisir quotidien à La Havane même. Courts (42 x 110mm), intenses, vingt minutes. La saveur cubaine populaire, sans cérémonie.')
WHERE `name` = 'Partagás';

UPDATE `brands` SET `pairings` = JSON_SET(`pairings`, '$[0].notes',
  'La profondeur terreuse de l''Armagnac vieilli résonne avec le côté rustique et puissant d''une Serie D. Accord pour connaisseurs.')
WHERE `name` = 'Partagás';

UPDATE `brands` SET `pairings` = JSON_SET(`pairings`, '$[1].notes',
  'Surprenant mais redoutable — le grain torréfié d''un stout irlandais amplifie les notes de cacao de la Serie D.')
WHERE `name` = 'Partagás';

-- ── La Flor Dominicana ──────────────────────────────────
UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[2].story',
  'La gamme médiane — cape Colorado sur dominicain vieilli. Notes de noisette, bois de cèdre, vanille légère. Mi-corsée à corsée, équilibrée. L''entrée dans l''univers LFD pour les amateurs que la puissance du Double Ligero fait hésiter.')
WHERE `name` = 'La Flor Dominicana';
