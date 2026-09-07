-- ════════════════════════════════════════════════════════
-- 179 — MariaDB n'est pas MySQL : le JSON s'écrit en toutes lettres
-- ────────────────────────────────────────────────────────
-- SIGNALÉ PAR L'UTILISATEUR : « les marques pour la République
-- dominicaine ne s'affichent pas en ligne ». En local, les vingt-trois
-- vignettes se rendaient. En production, ZÉRO.
--
-- ── CE QUE LA PRODUCTION SERVAIT ─────────────────────────
-- Chaque entrée de `producer_countries.brands` était une CHAÎNE
-- contenant du JSON, au lieu d'être un objet :
--
--   "{\"desc\": \"Opus X…\", \"name\": \"Arturo Fuente\", \"iconic\": true}"
--
-- L'espace après les deux-points est la signature de MariaDB. Les dix-
-- sept autres pays étaient intacts : le défaut ne touchait QUE la
-- République dominicaine.
--
-- ── LA CAUSE : MA MIGRATION 178 ──────────────────────────
-- Elle reconstruisait le tableau avec `JSON_TABLE(...)` puis
-- `JSON_ARRAYAGG(...)`. Sur MySQL — ce que fait tourner le poste de
-- développement — la colonne JSON garde son type à travers la table
-- dérivée, et le résultat est un tableau d'objets. Sur MARIADB — ce que
-- fait tourner o2switch — le type se perd, et l'agrégat empile des
-- CHAÎNES.
--
-- La migration passait donc les contrôles en local et cassait la page
-- en ligne. Je ne peux pas éprouver MariaDB ici : c'est une divergence
-- que la campagne, par construction, ne verra jamais.
--
-- ── LA PARADE, ET ELLE EST SIMPLE ────────────────────────
-- ON N'ÉCRIT PLUS DE JSON AVEC DES FONCTIONS JSON. Le tableau est posé
-- EN TOUTES LETTRES, comme une chaîne littérale — ce que faisaient
-- toutes les migrations antérieures (« ["Tiébissou","Didiévi"] ») et
-- ce qu'aucun moteur ne peut interpréter de travers.
--
-- Les migrations 173 et 175 employaient JSON_ARRAY_APPEND et
-- JSON_MERGE_PRESERVE ; elles ont, elles, produit des objets corrects
-- sur MariaDB — vérifié pays par pays dans le navigateur, sur le site
-- en ligne. Seule la 178 divergeait. Mais la règle vaut pour toutes :
-- une fonction dont le comportement dépend du moteur n'a pas sa place
-- dans une migration qu'on ne peut pas rejouer sur les deux.
--
-- ── ET UN CONTRÔLE QUI VOIT DEPUIS LE SERVEUR ────────────
-- Comme pour les drapeaux de la migration 168, aucun outil local ne
-- pouvait attraper ceci : la base de développement est juste.
-- `tools/prevol.php` tourne SUR LE SERVEUR — il porte désormais un
-- constat bloquant sur les tableaux `brands` mal formés.
--
-- ⚠ LA COMMANDE, TOUJOURS :
--   mysql --default-character-set=utf8mb4 -u <user> -p <base> < <fichier>
-- ════════════════════════════════════════════════════════

UPDATE `producer_countries`
   SET `brands` = '
[{"desc":"Opus X — les plus convoités au monde","name":"Arturo Fuente","iconic":true},{"desc":"Luxe suisse, manufacture dominicaine","name":"Davidoff","iconic":true},{"desc":"Artisanat d''exception depuis 1996","name":"La Flor Dominicana","iconic":true},{"desc":"Standard mondial du Connecticut","name":"Macanudo","iconic":false},{"desc":"ESG et VSG, intemporels","name":"Ashton","iconic":false},{"desc":"Créée par le pianiste Avo Uvezian","name":"Avo","iconic":false},{"desc":"La douceur comme valeur absolue, depuis 1993","name":"Santa Damiana","iconic":false},{"desc":"1903, la plus ancienne manufacture dominicaine","name":"La Aurora","iconic":true},{"desc":"Repartir de zéro après une carrière entière","name":"E.P. Carrillo","iconic":true},{"desc":"1974, avant la vague — et toujours familiale","name":"Quesada","iconic":false},{"desc":"Tamboril, où la même main roule plusieurs bagues","name":"PDR Cigars","iconic":false},{"desc":"L''autre Montecristo, celui d''après 1960","name":"Montecristo Dominicain","iconic":true},{"desc":"Même bague que le havane, autre cigare","name":"Romeo y Julieta Dominicain","iconic":false},{"desc":"Le cigare que des dizaines de milliers de gens fument vraiment","name":"VegaFina","iconic":true},{"desc":"Un bon cigare selon le marché d''avant la mode de la puissance","name":"Don Diego","iconic":false},{"desc":"Né d''une boîte de nuit genevoise, et cela s''entend","name":"The Griffin''s","iconic":false},{"desc":"Un industriel redevenu artisan","name":"Matilde","iconic":false},{"desc":"La bague au pied du cigare — personne d''autre n''a osé","name":"Juan Clemente","iconic":false},{"desc":"Cape venue du Cameroun, cigares roulés ici","name":"Meerapfel","iconic":false},{"desc":"Née chez El Credito, à Miami, en 1972","name":"La Gloria Cubana Dominicaine","iconic":false},{"desc":"Tabacalera de García, La Romana","name":"H. Upmann Dominicain","iconic":false},{"desc":"Ne subsiste que hors de Cuba","name":"Henry Clay","iconic":false},{"desc":"Collection non cubaine annoncée en 2016","name":"Por Larrañaga Dominicain","iconic":false}]',
       `updated_at` = NOW()
 WHERE `id` = 'dominican';

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 179','systeme','divergence_de_moteur','systeme',0,
   'MA MIGRATION 178 RECONSTRUISAIT producer_countries.brands avec JSON_TABLE puis JSON_ARRAYAGG. Sur MySQL — le poste de developpement — la colonne JSON garde son type a travers la table derivee et le resultat est un tableau d OBJETS. Sur MariaDB — o2switch — le type se perd et l agregat empile des CHAINES. La migration passait tous les controles en local et cassait la page en ligne'),
  (NULL,'migration 179','systeme','parade','systeme',0,
   'ON N ECRIT PLUS DE JSON AVEC DES FONCTIONS JSON. Le tableau est pose EN TOUTES LETTRES, comme une chaine litterale — ce que faisaient toutes les migrations anterieures et ce qu aucun moteur ne peut interpreter de travers. Les migrations 173 et 175 employaient JSON_ARRAY_APPEND et JSON_MERGE_PRESERVE et ont produit des objets corrects sur MariaDB, verifie pays par pays dans le navigateur ; mais la regle vaut pour toutes'),
  (NULL,'migration 179','systeme','controle_ajoute','systeme',0,
   'comme pour les drapeaux de la 168, aucun outil local ne pouvait attraper ceci : la base de developpement est juste. prevol.php tourne SUR LE SERVEUR et porte desormais un constat bloquant sur les tableaux brands mal formes — element non-objet, ou objet sans nom');
