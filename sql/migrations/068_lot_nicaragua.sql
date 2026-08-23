-- ════════════════════════════════════════════════════════
-- 068 — La sixième échappée : ce n'est plus la forme, c'est la colonne
-- ────────────────────────────────────────────────────────
-- Cinq fois déjà, une affirmation de presse est passée parce qu'elle
-- était écrite autrement (« Score 96 », « Score Cigar Aficionado 93 »,
-- « Top 25 », « scores 93-95 », « Score parfait 100/100 »).
--
-- La sixième est d'une autre nature. My Father annonce :
--
--   « le seul torcedor au monde à avoir fondé deux maisons obtenant le
--     cigare de l'année n°1 — […] en 2007, puis My Father en 2012 »
--
-- Le motif reconnaît « cigare de l'année » — il l'a même appris à la
-- migration 064. Ce qui l'a sauvée, c'est l'endroit : le contrôle ne
-- lisait QUE `gamme[].story`. Cette phrase est dans
-- `celebrities[].anecdote`, et `pairings[].notes` n'était pas lu non
-- plus.
--
-- Élargir le motif ne servait donc à rien. Le contrôle balaie désormais
-- les trois champs. Deuxième leçon, distincte de la première : un
-- contrôle rate aussi ce qu'il ne REGARDE pas — et une idée voyage d'une
-- colonne à l'autre aussi facilement que d'une tournure à l'autre.
--
-- ── UNE EXCEPTION ASSUMÉE ───────────────────────────────
--
-- Le balayage élargi lève un second cas, El Rey del Mundo : « fait
-- imprimer sur ses boîtes qu'elle produit le meilleur cigare de la
-- terre ». Ce n'en est pas un. La fiche ne prétend pas que ce cigare est
-- le meilleur : elle rapporte un slogan de 1848, et le qualifie
-- elle-même de « réclame la plus immodeste du XIXe siècle havanais ».
--
-- Une exception nommée vaut mieux qu'un motif affaibli pour la contenir.
-- Elle est déclarée dans AFFIRMATIONS_HISTORIQUES et affichée à chaque
-- passage vert, avec sa raison : une exception qu'on ne voit plus
-- redevient un trou.
--
-- ── DEUX FAITS FAUX DANS LE MÊME LOT ────────────────────
--
-- 1. My Father accordait un café « Nicaraguan Jinotega single origin »
--    en le décrivant comme « le café des mêmes collines d'Estelí ».
--    Jinotega et Estelí sont deux départements distincts, à une centaine
--    de kilomètres l'un de l'autre. La phrase se contredit en son
--    milieu ; c'est justement l'accord de terroir qu'elle vantait qui
--    n'existe pas.
--
-- 2. Rocky Patel : « Tabac hondurien et nicaraguayen vieilli depuis
--    1992 ». Lu en 2026, cela annonce trente-quatre ans de vieillissement
--    dans un cigare de production courante. C'est exactement le défaut
--    de Trinidad et son millésime 1985 (migration 062) : un nom de
--    gamme lu comme une date de récolte permanente. Le 1992 désigne
--    l'origine des capes du premier assemblage, pas l'âge du tabac
--    qu'on achète aujourd'hui.
--
-- Et deux fois « le Le Bijou » — l'article doublé, dans deux champs
-- différents de la même fiche.
--
-- ── UNE FAUSSE ALERTE QUI DÉCOUVRE UN VRAI DÉFAUT ───────
--
-- En essayant d'étendre AUSSI le détecteur de paroles prêtées aux trois
-- champs, deux textes se sont allumés : Oliva (« la 'zone dorée' ») et
-- Trinidad (« le meilleur 'petit cigare' cubain »). Ni l'un ni l'autre
-- n'est une parole prêtée : ce sont des apostrophes de citation autour
-- d'un TERME, pas d'une phrase attribuée à quelqu'un.
--
-- Sauf que la seconde cachait autre chose : « souvent considéré comme
-- LE MEILLEUR petit cigare cubain » est un superlatif invérifiable — et
-- le motif de presse ne l'attrapait pas, parce qu'il cherche
-- « meilleur cigare » et que le mot « petit » s'est glissé entre les
-- deux.
--
-- Les deux textes sont réécrits sans apostrophes de terme. Le détecteur
-- de paroles peut alors balayer les trois champs sans une seule fausse
-- alerte.
--
-- ── « WRAPPER » : UN CONSTAT, PAS ENCORE UN CHANTIER ─────
--
-- Ces fiches écrivent « Wrapper Connecticut » là où la migration 064
-- écrivait « Cape Connecticut ». Le relevé complet donne 127
-- anglicismes techniques dans 84 textes FRANÇAIS (wrapper ×75, blend
-- ×36, medium-full ×10, puis binder, filler, sun-grown, shade-grown).
--
-- Cela dépasse ce lot et n'est pas traité ici : seuls les treize textes
-- réécrits ci-dessous passent à « cape ». Le reste est signalé à
-- l'utilisateur — c'est un chantier de vocabulaire, à décider, pas une
-- correction à glisser dans une migration de traduction.
--
-- À noter tout de même : MOTS_ANGLAIS, dans le détecteur de fuite,
-- contient wrapper, filler, binder et blend. Le français source
-- alimente donc le vocabulaire qui sert à détecter l'anglais résiduel.
-- ════════════════════════════════════════════════════════

-- ── My Father ───────────────────────────────────────────
UPDATE `brands` SET `celebrities` = JSON_SET(`celebrities`, '$[0].anecdote',
  'Pepin a fondé deux maisons successives : El Rey de los Habanos, minuscule atelier de Calle Ocho à Miami, puis My Father à Estelí, où l''usine et la famille se sont installées ensemble. Son fils Jaime dirige désormais les opérations pendant que Pepin, passé soixante-dix ans, roule encore les prototypes lui-même.')
WHERE `name` = 'My Father';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[2].story',
  'Hommage aux manufactures cubaines d''avant-révolution. Cape maduro Connecticut Broadleaf sur nicaraguayen vieilli. Notes de chocolat noir, café froid, mélasse. Plus douce que la Le Bijou 1922, plus accessible, tout aussi remarquable. L''entrée dans l''univers My Father pour les amateurs de maduro.')
WHERE `name` = 'My Father';

UPDATE `brands` SET `pairings` = JSON_SET(`pairings`, '$[1].notes',
  'Le café de Jinotega, cultivé en altitude à une centaine de kilomètres au nord d''Estelí. Ses notes de fruits noirs et de cacao répondent à celles de la Le Bijou 1922.')
WHERE `name` = 'My Father';

-- ── Perdomo ─────────────────────────────────────────────
-- « teste chaque blend en LES fumant » : accord rompu au milieu de la
-- phrase. Relu au moment de le traduire, comme presque tout le reste.
UPDATE `brands` SET `celebrities` = JSON_SET(`celebrities`, '$[0].anecdote',
  'Perdomo teste chaque assemblage en le fumant à l''aveugle — sans savoir quel prototype il a en main. Il a mis au point cette méthode après avoir constaté que sa connaissance de l''assemblage influençait son jugement. La rigueur d''un scientifique dans l''atelier d''un artisan.')
WHERE `name` = 'Perdomo';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[2].story',
  'La gamme prix-doux de Perdomo — directement nommée du prénom du fondateur. Cape Connecticut sur nicaraguayen. Notes de noisette grillée, café au lait, légère douceur. Idéale pour découvrir la maison sans s''engager sur un 20th Anniversary.')
WHERE `name` = 'Perdomo';

-- ── Oliva ───────────────────────────────────────────────
UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  'Cape camerounaise sur nicaraguayen. La gamme médiane d''Oliva — moins corsée que la Serie V, plus complexe que la Serie O. Notes de noix de cajou, bois de cèdre, épices douces. Le format No.4 (Robusto) est particulièrement équilibré. L''entrée idéale dans l''univers Oliva.')
WHERE `name` = 'Oliva';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[2].story',
  'Concept lancé en 2008 : des cigares d''une dizaine de centimètres seulement, pour des calibres allant jusqu''à 60. L''idée tient en une phrase — la zone la plus intéressante d''un cigare est son tiers central, alors pourquoi ne pas commencer directement là. La Nub donne accès d''emblée à la complexité maximale, et le format court et large s''est depuis répandu chez d''autres maisons.')
WHERE `name` = 'Oliva';

UPDATE `brands` SET `pairings` = JSON_SET(`pairings`, '$[1].notes',
  'La bière locale, légère et rafraîchissante, est l''accord le plus quotidien qui soit au Nicaragua — celui de fin de journée, dans les régions de plantation elles-mêmes.')
WHERE `name` = 'Oliva';

-- ── Rocky Patel ─────────────────────────────────────────
UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[0].story',
  'Le nom renvoie à l''origine des capes du premier assemblage, récoltées en 1992 — pas à l''âge du tabac vendu aujourd''hui. Cape Ecuador Connecticut sur tabacs honduriens et nicaraguayens. Notes de noisette grillée, caramel, bois clair. Medium-Full équilibré, et la série Vintage reste l''une des propositions les plus narratives du marché : chaque millésime raconte une récolte.')
WHERE `name` = 'Rocky Patel';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  'Lancée pour les 50 ans de Rocky Patel — l''homme, pas la marque. Assemblage hondurien-nicaraguayen complexe, cape d''Équateur cultivée en plein soleil. Notes de café, épices orientales, sous-bois. Format Toro, 50 x 152mm. Une gamme qui reste dans l''ombre des séries Vintage alors qu''elle en dit autant sur la maison.')
WHERE `name` = 'Rocky Patel';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[2].story',
  'La gamme accessible de la maison. Formats Robusto et Toro, cape Connecticut, tabacs hondurien et nicaraguayen. Notes douces de crème et de noisette. Le premier Rocky Patel pour un néophyte — facile d''approche, régulier, gratifiant. Prix démocratique.')
WHERE `name` = 'Rocky Patel';

-- ── Trinidad : superlatif entre apostrophes ─────────────
UPDATE `brands` SET `gamme` = JSON_SET(`gamme`, '$[1].story',
  'Petit Corona (40 x 110mm). La gamme courte de Trinidad — accessible, florale, douce. En vingt minutes, le Reyes délivre toute la complexité florale et crémeuse de la maison sans demander le temps d''un Fundadores. C''est le format par lequel on entre dans la marque.')
WHERE `name` = 'Trinidad';
