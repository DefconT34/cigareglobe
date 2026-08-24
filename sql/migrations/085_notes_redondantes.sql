-- ════════════════════════════════════════════════════════
-- 085 — Deux notes qui disent la même chose
-- ────────────────────────────────────────────────────────
-- Signalé par un lecteur sur la fiche Corojo du Honduras : « Épices » et
-- « Poivre » y figuraient côte à côte, et le poivre EST une épice.
--
-- ── UN SIGNAL QUI EXISTAIT DÉJÀ, ET QUE PERSONNE NE LISAIT ──
--
-- Le glossaire d'arômes (migration 051) range chaque libellé dans une
-- FAMILLE, et sert une phrase par famille. La règle est explicite :
--
--   'epices' => ['epice', 'poivre']
--
-- « Épices » et « Poivre » tombent donc dans la même famille, et la
-- fiche affichait deux fois la même icône et deux fois la même glose.
-- Le doublon était visible à l'écran depuis la migration 051 ; il
-- suffisait de comparer les familles d'une même liste pour le voir.
--
-- Le balayage complet en trouve six, tous dans `notes` :
--
--   Épices + Poivre    cuba-corojo, honduras-corojo,
--                      panama-corojo, equateur-habano
--   Douceur + Crème    dominicaine-san-vicente, equateur-connecticut
--
-- Aucun terme muet en revanche : les soixante-dix libellés tombent tous
-- dans une famille.
--
-- ── LE PRINCIPE DE CORRECTION ───────────────────────────
--
-- On garde le terme le plus PRÉCIS — « Poivre » plutôt qu'« Épices »,
-- « Crème » plutôt que « Douceur » — et on remplace le générique par une
-- note d'une autre famille, tirée de ce que la fiche dit déjà :
--
--   panama-corojo  : le texte parle de « sol volcanique »  → Terre
--   honduras-corojo: « la puissance de la souche d'origine » → Terre
--   cuba-corojo    : cape fine, registre classique           → Cuir
--   equateur-habano: « apporte du corps »                    → Bois
--   san-vicente    : « texture souple, goût crémeux »        → Foin
--   ecuador-conn.  : « assemblages doux du matin »           → Foin
--
-- Le sens inverse — garder « Épices » et citer le poivre dans sa glose —
-- n'était pas possible : la glose appartient à la FAMILLE et se partage
-- entre toutes les feuilles. Y écrire « poivre » l'aurait affiché sur
-- des fiches qui n'en portent pas.
--
-- Les neuf termes employés existent tous ailleurs dans l'atlas, déjà
-- traduits : aucun nouveau libellé n'entre par cette migration.
-- ════════════════════════════════════════════════════════

UPDATE `feuilles` SET `notes` = JSON_ARRAY('Poivre', 'Cèdre', 'Cuir')
WHERE `id` = 'cuba-corojo';

UPDATE `feuilles` SET `notes` = JSON_ARRAY('Poivre', 'Cuir', 'Terre')
WHERE `id` = 'honduras-corojo';

UPDATE `feuilles` SET `notes` = JSON_ARRAY('Poivre', 'Cèdre', 'Terre')
WHERE `id` = 'panama-corojo';

UPDATE `feuilles` SET `notes` = JSON_ARRAY('Poivre', 'Cuir', 'Bois')
WHERE `id` = 'equateur-habano';

UPDATE `feuilles` SET `notes` = JSON_ARRAY('Crème', 'Bois clair', 'Foin')
WHERE `id` = 'dominicaine-san-vicente';

UPDATE `feuilles` SET `notes` = JSON_ARRAY('Crème', 'Amande', 'Foin')
WHERE `id` = 'equateur-connecticut';
