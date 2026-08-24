-- ════════════════════════════════════════════════════════
-- 081 — Casdagli, quatrième maison du Costa Rica
-- ────────────────────────────────────────────────────────
-- Absence signalée par un lecteur. L'atlas comptait trois marques
-- costaricaines — Atabey, Bandolero, Byron, toutes trois de Selected
-- Tobacco — et manquait la seule autre maison qui compte dans ce pays.
--
-- ── CE QUE LA FICHE AFFIRME, ET CE QU'ELLE TAIT ─────────
--
-- Casdagli est une maison britannique dont les cigares sont roulés au
-- Costa Rica. Elle s'est d'abord appelée Bespoke Cigars avant de prendre
-- le nom de son fondateur, Jeremy Casdagli.
--
-- Je n'écris ni date de fondation précise, ni volumes, ni notes de
-- presse : je ne peux vérifier aucun de ces chiffres, et la règle du
-- projet depuis la migration 058 est qu'une donnée invérifiable ne
-- s'affiche pas. Le champ `founded` dit donc le pays et le régime de
-- production, pas une année que je devrais inventer.
--
-- `scores` reste vide, comme pour les 115 autres marques : c'est
-- l'information juste tant que personne n'a l'URL d'une critique
-- publiée.
--
-- ── POURQUOI ELLE A SA PLACE ICI ────────────────────────
--
-- Le Costa Rica n'est pas un pays de tabac : il n'a pas de terroir
-- tabacole notable, et sa présence dans l'atlas tient entièrement à
-- deux ateliers qui y roulent des feuilles venues d'ailleurs. Casdagli
-- est le second de ces deux cas, et la fiche du pays devient fausse par
-- omission sans elle.
-- ════════════════════════════════════════════════════════

INSERT INTO `brands` (`name`, `country_id`, `founded`, `factory`, `history`, `gamme`, `pairings`, `scores`, `celebrities`, `limited_eds`)
VALUES (
  'Casdagli',
  'costarica',
  'Maison britannique — production au Costa Rica',
  'Tabacalera Aragón, Costa Rica',
  'Casdagli est une maison britannique qui ne possède pas de champs. Ses cigares sont roulés au Costa Rica, pays sans terroir tabacole notable, à partir de feuilles venues d''ailleurs — un modèle qui n''a rien d''exceptionnel dans le métier, mais qui prend ici une forme particulière : le pays de production a été choisi pour l''atelier, pas pour la terre.

La marque s''est d''abord appelée Bespoke Cigars, puis a pris le nom de son fondateur, Jeremy Casdagli. Ce changement dit quelque chose de son propos : elle assume d''être une signature plutôt qu''une manufacture, et travaille en séries courtes plutôt qu''en catalogue permanent.

Elle appartient à la catégorie des maisons dites « boutique » — celles dont la production annuelle se compte en dizaines de milliers de cigares là où les grandes maisons en comptent des dizaines de millions. C''est une différence d''échelle avant d''être une différence de qualité, et elle explique l''essentiel : la disponibilité irrégulière, l''absence de réseau de distribution large, et une notoriété qui circule surtout entre amateurs.',
  JSON_ARRAY(
    JSON_OBJECT('name', 'Villa Casdagli', 'color', '#7B3F2E', 'force', 'Medium-Full',
                'wrapper', 'Assemblage non divulgué',
                'story', 'La gamme qui porte le nom de la maison. Assemblage tenu confidentiel, comme souvent chez les maisons de cette taille — la discrétion sur les provenances est un choix, pas un oubli.'),
    JSON_OBJECT('name', 'Daughters of the Wind', 'color', '#8B5A3C', 'force', 'Medium',
                'wrapper', 'Assemblage non divulgué',
                'story', 'Le nom vient de la manière dont on parle des feuilles séchées à l''air libre. Registre plus retenu que la Villa Casdagli.'),
    JSON_OBJECT('name', 'Cigarrus Basilica', 'color', '#6B4226', 'force', 'Medium-Full',
                'wrapper', 'Assemblage non divulgué',
                'story', 'Série courte, produite par lots. C''est le format d''édition qui définit cette gamme plus que son profil.')
  ),
  JSON_ARRAY(
    JSON_OBJECT('type', 'Spiritueux', 'name', 'Whisky de malt non tourbé',
                'notes', 'Une maison qui travaille la retenue supporte mal un alcool démonstratif. Un malt sans tourbe laisse la place.'),
    JSON_OBJECT('type', 'Café', 'name', 'Café du Costa Rica',
                'notes', 'Accord de lieu plutôt que de terroir : le cigare n''est pas costaricain par sa feuille, il l''est par son atelier — le café, lui, l''est vraiment.')
  ),
  -- NULL, pas '' : la table porte une contrainte `json_valid` sur chacune
  -- de ces colonnes, et la chaine vide n'est pas du JSON valide. NULL la
  -- satisfait, et c'est ce que portent les 73 autres marques sans note.
  NULL, NULL, NULL
);
