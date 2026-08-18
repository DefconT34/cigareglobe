-- ════════════════════════════════════════════════════════
-- 034 — Ce que les statistiques nationales donnent, et ce qu'elles ne
--       donnent pas
-- ────────────────────────────────────────────────────────
-- Onze fiches sur quinze affichaient un tiret dans « Revenus annuels ».
-- C'était le choix de la migration 028 — une valeur non sourcée est
-- retirée — mais onze tirets se lisent comme un trou, même accompagnés
-- de leur explication.
--
-- La migration 033 a montré pourquoi l'accès public de COMTRADE ne peut
-- pas les combler : sur la Rép. dominicaine, la même série rend 3,2 M$
-- en 2024 et 1 032 M$ en 2023. Reste la voie longue, pays par pays, sur
-- les statistiques nationales.
--
-- ── PHILIPPINES : un volume, et pas une valeur ──────────
--
-- La National Tobacco Administration publie ses chiffres d'exportation
-- chaque janvier. Pour 2024 : 3,84 MILLIONS DE CIGARES exportés, en
-- baisse de 21,6 %. Le chiffre est repris à l'identique par deux
-- rédactions indépendantes, et il est SPÉCIFIQUE AUX CIGARES — ce qui
-- est exactement ce qui manquait.
--
-- Il remplit `production`, qui n'annonçait aucun nombre. Il ne remplit
-- PAS `revenue` : la NTA publie les volumes de cigares et la valeur du
-- TABAC BRUT (94,59 M$ en 2024), jamais la valeur des cigares. Les
-- confondre aurait refait l'erreur nicaraguayenne de la migration 028,
-- corrigée par la 033 — un chiffre juste sous un mauvais intitulé.
--
-- Le détail affiché sous le tiret le dit désormais précisément, plutôt
-- que de parler de production « non recensée » alors qu'elle l'est.
--
-- ── L'ORDRE DE GRANDEUR MÉRITE D'ÊTRE VU ────────────────
--
-- 3,84 millions de cigares, quand le Nicaragua en exporte autour de
-- trois cents millions. Ce n'est pas une déception, c'est l'information
-- elle-même : les Philippines roulent depuis l'époque espagnole et ne
-- pèsent plus rien dans le commerce mondial du cigare. Une fiche qui
-- n'ose pas ce chiffre laisse croire le contraire.
--
-- ── BRÉSIL : 576 015 dollars, et le chemin pour y arriver ──
--
-- L'API de ComexStat (api-comexstat.mdic.gov.br) répond mais son
-- limiteur bloque par adresse IP sur une fenêtre bien plus longue que
-- les « 10 secondes » annoncées : onze tentatives réparties sur une
-- heure, toutes refusées.
--
-- Le même ministère publie les DÉCLARATIONS DOUANIÈRES BRUTES, sans
-- quota — une source strictement supérieure, puisque l'API n'en est
-- qu'une vue :
--
--   https://balanca.economia.gov.br/balanca/bd/comexstat-bd/ncm/EXP_2024.csv
--   colonnes : CO_ANO;CO_MES;CO_NCM;…;KG_LIQUIDO;VL_FOB
--   filtrer   : CO_NCM = 24021000 (charutos e cigarrilhas)
--
-- Résultat 2024, fichier complet : 81 déclarations, 7 140 kg,
-- 576 015 dollars FOB.
--
-- ── ET LE PIÈGE, QUI A FAILLI PASSER ────────────────────
--
-- Ces fichiers font cent mégaoctets et la connexion les coupe sans
-- prévenir. `curl | grep` rend alors MOINS DE LIGNES SANS AUCUNE
-- ERREUR : le compte paraît simplement plus petit.
--
-- Quatre chiffres ont été produits ainsi avant qu'on s'en aperçoive.
-- Le pire annonçait « aucune exportation de cigares en 2021 » — le flux
-- s'était arrêté avant. Un autre donnait 46 445 dollars pour 2023 : le
-- fichier était descendu à SEIZE POUR CENT.
--
-- Deux garde-fous, désormais obligatoires pour ce genre de source :
--   1. comparer les octets reçus au Content-Length annoncé, et reprendre
--      avec `curl -C -` tant qu'ils diffèrent (vingt-quatre reprises
--      ont été nécessaires ici) ;
--   2. compter au passage une valeur TÉMOIN dont on connaît l'ordre de
--      grandeur — ici les 1 129 lignes de feuille (code 2401), que le
--      Brésil exporte massivement. Un témoin ridicule dénonce la
--      troncature ; un compte de cigares faible, non.
--
-- ── CE QUE LE CHIFFRE DIT ───────────────────────────────
--
-- 0,58 million de dollars contre 425 pour le Nicaragua : un rapport de
-- sept cents. Le Brésil ne vend pas de cigares, il vend de la FEUILLE —
-- il en est le premier exportateur mondial. Ne PAS se rabattre sur les
-- 2,977 milliards annoncés par le SindiTabaco pour 2024 : c'est tout le
-- tabac brésilien, feuille comprise.
--
-- `production` disait « volumes non publiés ». C'est faux : ils le
-- sont, à la tonne près.
--
-- ── HONDURAS : rien trouvé ──────────────────────────────
--
-- La Banque centrale publie bien un commerce extérieur détaillé, mais
-- aucune de ses communications reprises publiquement n'isole les puros.
-- COMTRADE donne 142,2 M$ pour 2023, avec un tonnage cohérent — mais
-- c'est la source que la migration 033 vient de déclarer trop instable
-- pour qu'on lui confie une valeur publiée. La retenir ici au motif que
-- ce chiffre-là « a l'air juste » reviendrait à publier mon jugement.
-- Le tiret reste.
-- ════════════════════════════════════════════════════════

UPDATE producer_countries SET
    production = '3,84 M cigares exportés (2024)',
    rev_detail = 'la NTA publie les volumes, pas la valeur des cigares'
WHERE id = 'philippines';

UPDATE producer_countries SET
    production = 'Mata Fina et Mata Norte — 7,1 t de cigares exportées (2024)',
    revenue    = '0,58 M$ (2024)',
    rev_detail = 'exportations de cigares, douanes brésiliennes (NCM 2402.10)'
WHERE id = 'brazil';
