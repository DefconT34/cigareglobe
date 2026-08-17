-- ════════════════════════════════════════════════════════
-- 029 — Lot 2 de la relecture : les fiches pratiques
-- ────────────────────────────────────────────────────────
-- Le plan annonçait 108 valeurs pour douze pays. La migration 027 en a
-- ajouté trois : 135 valeurs, neuf champs sur quinze pays.
--
-- ── CE QUI N'EST JAMAIS AFFICHÉ : 45 valeurs sur 135 ────
--
-- devise, langue et fuseau ne sont PAS montrés. `fiche.js` les remplace
-- par Intl, qui les nomme dans la langue du visiteur — la table n'a
-- aucune colonne de langue, et ces trois lignes s'affichaient donc en
-- français dans les six langues jusqu'à ce que ce repli soit écrit.
-- `data.pays.js` couvrant les quinze pays, la valeur de la base ne peut
-- plus se déclencher pour aucun d'eux.
--
-- Elles ne sont donc pas relues : ce serait vérifier ce que personne ne
-- lit. Elles restent comme repli d'un seizième pays qui manquerait à
-- `data.pays.js`. C'est la leçon du lot 1, appliquée à l'envers —
-- vérifier d'abord que le champ arrive à l'écran.
--
-- ── POPULATION ET PIB : hors de cette migration ─────────
--
-- QUATORZE PIB PÉRIMÉS SUR QUATORZE, plusieurs de 30 à 48 % : Mexique
-- $1.3T pour 1,83 T$, Nicaragua $15B pour 22,2 Md$, Honduras $28B pour
-- 39,6 Md$. Tous portaient « (2022) ». Les populations étaient fausses
-- dans les deux sens — Brésil 215 M annoncés pour 212,8 M réels, Rép.
-- dominicaine 10,8 M pour 11,5 M.
--
-- Les corriger ici les aurait figés une seconde fois. Ils sont
-- désormais tenus par `tools/geo_banquemondiale.php`, qui les tire de
-- l'API de la Banque mondiale — source primaire, en JSON, avec l'année
-- attachée à chaque point. Son mode `--verifier` tourne HORS LIGNE dans
-- la campagne et échoue si une valeur n'annonce pas son année ou passe
-- les trois ans.
--
-- Un chiffre cubain fait exception, et l'outil le dispense nommément :
-- la Banque mondiale n'a plus de PIB pour Cuba après 2020. Ce n'est pas
-- « on n'a pas regardé », c'est « personne ne publie ».
--
-- ── CE QUE CETTE MIGRATION CORRIGE ──────────────────────
-- ════════════════════════════════════════════════════════

-- ── Les Canaries, hors de la Banque mondiale ─────────────
-- Ce n'est pas un pays : l'API n'en a pas. Population tenue à la main
-- depuis l'INE espagnol — 2 272 734 habitants au 1er janvier 2026,
-- Estadística Continua de Población. La valeur portait « 2,2 M » sans
-- année, ce que --verifier refuse desormais pour tout le monde.

UPDATE producer_geo SET population = '2,3 M (2026)' WHERE country_id = 'canaries';

-- ── Une superficie fausse de 14 % ────────────────────────
-- Les Philippines annonçaient 343 448 km². Leur superficie totale est
-- de 300 000 km² — 298 170 de terres émergées et 1 830 d'eaux
-- intérieures. Les treize autres superficies ont été confrontées aux
-- valeurs conventionnelles et sont justes ; c'était la seule fausse.
--
-- Note de méthode : la Banque mondiale ne sert à rien ici. Elle publie
-- les TERRES ÉMERGÉES (Cuba 103 800) là où une fiche pays affiche la
-- SUPERFICIE TOTALE (Cuba 109 884). Deux mesures différentes, et les
-- confondre aurait fait passer treize valeurs justes pour fausses.

UPDATE producer_geo SET area = '300 000 km²' WHERE country_id = 'philippines';

-- ── Une capitale en anglais au milieu d'une colonne française ──
-- « Panama City » voisinait avec La Havane, Saint-Domingue et Mexico.

UPDATE producer_geo SET capital = 'Panama' WHERE country_id = 'panama';

-- ── Quatre indépendances qui contredisaient le site lui-même ──
-- La fiche pratique donnait une année, `data.fetes.js` — relu sur
-- sources au lot 3 — en donnait une autre, sur la même fiche. Le
-- visiteur lisait « Indépendance 1902 » et « fête nationale du 10
-- octobre 1868 » à quelques centimètres l'un de l'autre.
--
-- Aucune des deux n'était fausse : elles répondent à deux questions.
-- Le cri de rupture n'est pas la naissance de l'État, et c'est
-- précisément ce qui méritait d'être écrit plutôt qu'arbitré en
-- silence. Même parti pris qu'au lot 3 pour les quatre pays à dates
-- concurrentes.

--   Cuba : Grito de Yara le 10 octobre 1868, début de la première
--   guerre d'indépendance. La République n'est proclamée que le 20 mai
--   1902, au départ de l'occupation américaine.
UPDATE producer_geo SET independent = '1902 (soulèvement dès 1868)' WHERE country_id = 'cuba';

--   Équateur : Primer Grito de Independencia le 10 août 1809. L'État
--   équatorien naît de la sécession d'avec la Grande-Colombie, en 1830.
UPDATE producer_geo SET independent = '1830 (premier cri en 1809)' WHERE country_id = 'ecuador';

--   Mexique : Grito de Dolores le 16 septembre 1810. L'indépendance
--   n'est consommée qu'en 1821, aux traités de Córdoba.
UPDATE producer_geo SET independent = '1821 (cri de Dolores en 1810)' WHERE country_id = 'mexico';

--   Philippines : indépendance déclarée de l'Espagne le 12 juin 1898,
--   obtenue des États-Unis le 4 juillet 1946. La fête nationale est
--   revenue à la date de 1898 en 1962 ; la fiche ne retenait que 1946.
UPDATE producer_geo SET independent = '1946 (de l''Espagne en 1898)' WHERE country_id = 'philippines';

-- ── La coordonnée affichée ne désignait pas le marqueur ──
--
-- `producer_geo.coords` portait les coordonnées de la CAPITALE quand le
-- marqueur du globe — celui que `tools/coords_check.php` valide depuis
-- le lot 0 — porte le CENTRE du pays. Sur les petits pays les deux se
-- confondent ; sur les grands, non :
--
--     États-Unis   affiché 39°N 77°O (Washington)  marqueur 37,1N 95,7O
--     Mexique      affiché 19°N 99°O (Mexico)      marqueur 23,6N 102,6O
--     Brésil       affiché 16°S 48°O (Brasília)    marqueur 14,2S 51,9O
--
-- Six pays sur quinze s'écartaient de plus de deux degrés, jusqu'à
-- 18,7° pour les États-Unis — deux mille kilomètres.
--
-- Le pire n'est pas l'écart, c'est ce qui se trouve à côté : la
-- DISTANCE au visiteur, que `fiche.js` calcule sur `lat`/`lon`. La
-- fiche américaine affichait donc une coordonnée et, collée contre
-- elle, une distance mesurée depuis un autre point.
--
-- La colonne disparaît. `panels.js` met désormais en forme `lat`/`lon`,
-- si bien que la position affichée, le marqueur du globe, la distance
-- et l'audit géométrique du lot 0 désignent tous le même point. Une
-- valeur qu'on peut dériver ne se stocke pas : c'est une occasion de
-- diverger, et celle-ci avait divergé.

-- Seule instruction NON REJOUABLE de la migration : les UPDATE
-- ci-dessus se relancent sans risque, cet ALTER echoue une fois la
-- colonne partie. `sql/schema.sql` a ete regenere sans elle, si bien
-- qu'une installation neuve part deja du bon etat et n'a pas a rejouer
-- ce fichier.
ALTER TABLE producer_geo DROP COLUMN coords;
