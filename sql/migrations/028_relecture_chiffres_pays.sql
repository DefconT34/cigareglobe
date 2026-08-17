-- ════════════════════════════════════════════════════════
-- 028 — Lot 1 de la relecture : les 21 valeurs chiffrées des fiches pays
-- ────────────────────────────────────────────────────────
-- Les douze fiches pays d'origine ont été écrites de mémoire. Vingt et
-- une de leurs valeurs portent un chiffre — un volume de production, un
-- montant d'exportation, une altitude, un rang mondial. Aucune n'avait
-- de source.
--
-- La règle de docs/relecture.md s'applique : une valeur qu'on ne source
-- pas est RETIRÉE, pas conservée avec un astérisque. Le visiteur ne voit
-- pas nos réserves, et une donnée douteuse publiée vaut une donnée
-- fausse.
--
-- ── CE QUI EST SOURCÉ, ET REMPLACE L'INVENTÉ ────────────
--
--   CUBA. « $500M d'exportations annuelles » était faux de 40 %.
--   Corporación Habanos, S.A. a présenté ses comptes 2024 le 24 février
--   2025, à l'ouverture du XXVe Festival del Habano : 827 millions de
--   dollars de chiffre d'affaires (habanos.com, communiqué officiel).
--   Ce n'est pas un chiffre d'« exportations » mais le CA mondial du
--   distributeur — l'intitulé change avec la valeur.
--   Le volume « ~90M cigares/an » n'a lui aucune source : Habanos ne
--   publie plus d'unités depuis des années. Il est retiré.
--
--   RÉP. DOMINICAINE. Le volume était le plus faux de tous : « ~400M
--   cigares/an » pour 181 millions de cigares roulés main exportés en
--   2024, chiffre donné par Iván Hernández Guzmán, directeur de
--   l'Instituto Dominicano del Tabaco, au Dominican Cigar Expo 2025.
--   (Les 8,2 milliards de cigares mécaniques ne sont pas du ressort de
--   cet atlas.) En valeur, « $1.2B » était en revanche proche : 1,34
--   milliard de dollars, même source.
--   « exportations (1er mondial) » perd son rang : personne ne publie
--   de classement mondial en valeur, et le Nicaragua expédie plus
--   d'unités. Reste le nom de la source.
--
--   NICARAGUA. « ~350M cigares/an » et « $850M » cédaient à la
--   réputation du pays. La Cigar Association of America compte 253
--   millions de cigares premium entrés aux États-Unis en 2024 — près de
--   60 % des 430,03 millions importés, en hausse de 2,7 %. Le pays est
--   bien le premier fournisseur des États-Unis, ce que la fiche peut
--   dire ; « 350M produits » ne se déduit de rien.
--   En valeur, la seule statistique publique est COMTRADE : 368 M$
--   d'exportations de tabac vers les États-Unis en 2024. La ligne
--   douanière mêle cigares et cigarettes et ne couvre qu'une
--   destination — le détail le dit, sans quoi le chiffre tromperait
--   autant qu'un chiffre inventé.
--
--   HONDURAS. 67 millions de cigares premium vers les États-Unis en
--   2024, en baisse de 3,3 % (même source CAA). Le « $220M » n'a pas
--   d'équivalent sourçable : retiré.
--
-- ── CE QUI EST RETIRÉ FAUTE DE SOURCE ───────────────────
--
--   Huit montants d'exportation — Brésil $120M, Cameroun $45M,
--   Équateur $180M, États-Unis $380M, Indonésie $220M, Mexique $85M,
--   Panama $12M, Philippines $35M. Aucune statistique publique n'isole
--   le cigare premium dans ces pays : ce sont soit des vendeurs de
--   feuille dont la récolte part chez des fabricants étrangers, soit
--   des productions trop petites pour être recensées. La colonne passe
--   à NULL, et rev_detail — qui, lui, EST traduit — dit pourquoi.
--
--   Écrire « Non publié » dans revenue aurait été un piège : la colonne
--   n'a pas d'équivalents _en/_es/_de/_zh/_ar, donc la mention serait
--   restée en français sur les cinq autres langues. Le panneau rend
--   déjà « — » sur une valeur vide (panels.js), ce qui ne se traduit
--   pas. Les trois mots laissés par 027 dans le même angle mort
--   (« Confidentielle » ×2, « Marginale ») partent avec.
--
--   ÉQUATEUR, « 1er fournisseur mondial wrapper ». L'affirmation est
--   partout dans la presse spécialisée et nulle part chiffrée. Ce qui
--   se vérifie est plus intéressant : la couverture nuageuse permanente
--   des contreforts andins y remplace les toiles d'ombrage, ce qui est
--   la raison même de sa domination. On garde la cause, on lâche le
--   rang.
--
--   BRÉSIL, « ~10M cigares premium/an » : aucune source. Retiré.
--
--   DEUX ALTITUDES. Honduras « 900-1200m » — les vallées de Jamastran
--   et de Danlí sont à 600-800 m ; la valeur était fausse. Panama
--   « Chiriquí 1400m » — Boquete est vers 1200 m et le tabac pousse
--   plus bas. Aucune des deux n'était sourcée, les deux disparaissent
--   au profit du lieu, qui lui est juste.
--
-- Les colonnes traduites de production, rev_detail et soil deviennent
-- périmées pour les lignes touchées : c'est exactement ce que le
-- garde-fou E6 (tools/i18n_fraicheur.php, appelé par tests/run.php)
-- doit signaler. Elles sont réexportées et réimportées dans la foulée.
-- revenue n'a pas de colonnes traduites — c'est un montant.
-- ════════════════════════════════════════════════════════

-- ── Les quatre pays dont un chiffre est sourcé ───────────

UPDATE producer_countries SET
    production = 'Volumes non publiés par Habanos',
    revenue    = '827 M$ (2024)',
    rev_detail = 'chiffre d''affaires Habanos S.A.'
WHERE id = 'cuba';

UPDATE producer_countries SET
    production = '181 M cigares roulés main exportés (2024)',
    revenue    = '1,34 Md$ (2024)',
    rev_detail = 'exportations de cigares (Intabaco)'
WHERE id = 'dominican';

UPDATE producer_countries SET
    production = '253 M cigares premium vers les États-Unis (2024)',
    revenue    = '368 M$ (2024)',
    rev_detail = 'exportations de tabac vers les États-Unis (COMTRADE)'
WHERE id = 'nicaragua';

UPDATE producer_countries SET
    production = '67 M cigares premium vers les États-Unis (2024)',
    revenue    = NULL,
    rev_detail = 'importations américaines relevées par la CAA'
WHERE id = 'honduras';

-- ── Les huit montants sans source ────────────────────────

UPDATE producer_countries SET
    production = 'Mata Fina et Mata Norte, volumes non publiés',
    revenue    = NULL,
    rev_detail = 'aucune statistique n''isole le cigare premium'
WHERE id = 'brazil';

UPDATE producer_countries SET
    revenue    = NULL,
    rev_detail = 'wrapper vendu de gré à gré aux fabricants'
WHERE id = 'cameroon';

UPDATE producer_countries SET
    production = 'Wrapper d''ombre cultivé sans toile, sous couvert nuageux',
    revenue    = NULL,
    rev_detail = 'feuilles vendues aux fabricants, hors statistique'
WHERE id = 'ecuador';

UPDATE producer_countries SET
    revenue    = NULL,
    rev_detail = 'wrapper Sumatra vendu en gros, hors statistique'
WHERE id = 'indonesia';

UPDATE producer_countries SET
    revenue    = NULL,
    rev_detail = 'wrapper San Andrés vendu aux fabricants'
WHERE id = 'mexico';

UPDATE producer_countries SET
    revenue    = NULL,
    rev_detail = 'volumes artisanaux non recensés'
WHERE id = 'panama';

UPDATE producer_countries SET
    revenue    = NULL,
    rev_detail = 'production domestique non recensée'
WHERE id = 'philippines';

UPDATE producer_countries SET
    revenue    = NULL,
    rev_detail = 'wrapper Connecticut vendu aux fabricants'
WHERE id = 'usa';

-- ── Le même angle mort, hérité de 027 ────────────────────
-- Trois mentions françaises dans une colonne non traduite. rev_detail
-- porte déjà l'explication dans les six langues.

UPDATE producer_countries SET revenue = NULL
WHERE id IN ('canaries', 'costarica', 'jamaica');

-- ── Les deux altitudes ───────────────────────────────────

UPDATE producer_countries SET
    soil = 'Argilo-calcaire des vallées de l''Est'
WHERE id = 'honduras';

UPDATE producer_countries SET
    soil = 'Volcanique du Chiriquí'
WHERE id = 'panama';

-- La même altitude survivait dans la note de la zone Chiriquí, affichée
-- sur la même fiche, quelques lignes plus bas. La relecture des zones
-- est le lot 4 ; laisser ici une valeur qu'on vient de retirer trois
-- lignes plus haut aurait été incohérent à l'écran. Le lieu est juste,
-- l'altitude ne l'est pas.
UPDATE production_zones SET
    note = 'Sur les pentes du Volcán Barú'
WHERE country_id = 'panama' AND name = 'Chiriquí';
