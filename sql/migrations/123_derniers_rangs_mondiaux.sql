-- ════════════════════════════════════════════════════════
-- 123 — Les rangs mondiaux hors campagne de promotion
-- ────────────────────────────────────────────────────────
-- Le cliquet en comptait vingt-deux. Décomposés, ils ne représentent pas
-- vingt-deux problèmes :
--
--   11 sont des traductions DÉJÀ EN ATTENTE de refonte (Cohiba,
--      Davidoff, Joya de Nicaragua, Partagás, Montecristo, La Flor
--      Dominicana). Elles traduisent l'ancien français, celui d'avant la
--      promotion, qui portait le rang. Elles disparaîtront avec la
--      retraduction — sans travail propre.
--    4 étaient des FAUX POSITIFS, corrigés dans l'outil (voir plus bas).
--    7 sont réels, et c'est l'objet de cette migration.
--
-- ── LE FAUX POSITIF : « DU MONDE CUBAIN » ───────────────
--
-- Vegueros : « l'une des portes d'entrée les plus honnêtes DU MONDE
-- CUBAIN », et son espagnol « las puertas de entrada más honestas DEL
-- MUNDO CUBANO ».
--
-- Le motif s'arrêtait à « du monde » sans voir l'adjectif qui suit. Or
-- « le monde cubain » est une SPHÈRE, pas la planète. Quatre entrées du
-- cliquet sur vingt-deux étaient cette seule phrase, comptée deux fois
-- en français et deux fois en espagnol.
--
-- La garde est explicite plutôt que générique : refuser tout mot suivant
-- écarterait « la plus copiée du monde ET la plus convoitée », qui est
-- bien un rang.
--
-- ── LES SEPT RÉELS ──────────────────────────────────────
--
-- La Aurora (fr, ar) : « la région qui deviendra le PREMIER BASSIN
--   MONDIAL du cigare premium ». La vallée du Cibao est bien le cœur de
--   la production dominicaine — c'est ce que dit désormais le texte, et
--   cela se vérifie sans classer la planète.
--
-- PDR Cigars (fr, ar) : « Tamboril, la ville qui roule SANS DOUTE LE
--   PLUS DE CIGARES AU MONDE PAR HABITANT ». Le « sans doute » est une
--   précaution honnête, mais personne ne tient ce ratio. Ce qui reste
--   est observable : à Tamboril, le roulage occupe une part inhabituelle
--   de la population.
--
-- Montecristo, `gamme` (fr, es) : « Petit Corona (42 x 129mm), cigare LE
--   PLUS VENDU DU MONDE ». Troisième adresse de ce fait : la migration
--   108 l'avait retiré de `history` en français, et l'espagnol de
--   `history` attend sa refonte. Il vivait aussi dans `gamme`.
--
-- Matilde (ar seulement) : l'arabe dit « la PLUS GRANDE MANUFACTURE DE
--   SIJAR FAKHIR AU MONDE », quand le français dit déjà « l'une des plus
--   grandes DU SECTEUR ». La traduction n'a pas suivi une correction
--   antérieure du français. C'est la neuvième fois du chantier qu'un
--   même fait n'est corrigé qu'à une de ses adresses.
-- ════════════════════════════════════════════════════════

-- ── La Aurora ───────────────────────────────────────────
UPDATE `brands` SET
  `history` = REPLACE(`history`,
    'la région qui deviendra, trois quarts de siècle plus tard, le premier bassin mondial du cigare premium',
    'la région qui deviendra, trois quarts de siècle plus tard, le cœur de la production dominicaine de cigares premium'),
  `history_ar` = REPLACE(`history_ar`,
    'المنطقة التي ستصير، بعد ثلاثة أرباع قرن، أكبر حوض للسيجار الفاخر في العالم',
    'المنطقة التي ستصير، بعد ثلاثة أرباع قرن، قلب الإنتاج الدومينيكي للسيجار الفاخر')
WHERE `name` = 'La Aurora';

-- ── PDR Cigars ──────────────────────────────────────────
UPDATE `brands` SET
  `history` = REPLACE(`history`,
    'est installée à Tamboril, la ville qui roule sans doute le plus de cigares au monde par habitant',
    'est installée à Tamboril, ville dominicaine où le roulage de cigares occupe une part inhabituelle de la population'),
  `history_ar` = REPLACE(`history_ar`,
    'تقع في تامبوريل، المدينة التي تلفّ على الأرجح أكبر عدد من السيجار للفرد في العالم',
    'تقع في تامبوريل، المدينة الدومينيكية التي يشغل فيها لفّ السيجار نسبة غير معتادة من السكان')
WHERE `name` = 'PDR Cigars';

-- ── Montecristo, gamme ──────────────────────────────────
UPDATE `brands` SET
  `gamme` = REPLACE(`gamme`,
    'Petit Corona (42 x 129mm), cigare le plus vendu du monde.',
    'Petit Corona (42 x 129mm), la vitole qui a défini le cigare de tous les jours.'),
  `gamme_es` = REPLACE(`gamme_es`,
    'Petit Corona (42 x 129mm), el cigarro más vendido del mundo. Accesible, equilibrado, perfecto tanto para principiantes como para expertos. Notas de toast, cashew, white pimienta.',
    'Petit Corona (42 x 129mm), la vitola que definió el puro de todos los días. Accesible, equilibrado, perfecto tanto para principiantes como para expertos. Notas de pan tostado, anacardo y pimienta blanca.')
WHERE `name` = 'Montecristo';

-- ── ET DES NOTES DE DÉGUSTATION À MOITIÉ TRADUITES ──────
--
-- La phrase espagnole qui portait le rang disait aussi : « Notas de
-- TOAST, CASHEW, WHITE pimienta ». Trois mots anglais dans une colonne
-- espagnole, dont un à cheval — « white pimienta » pour *pimienta
-- blanca*.
--
-- Aucun contrôle ne le voyait. Le détecteur de mots abîmés de la
-- migration 095 cherche une substitution RÉVERSIBLE (« discry » →
-- « discret ») ; ici les mots anglais sont intacts, simplement pas
-- traduits. Et `i18n_langue_check` exige TROIS mots-outils anglais pour
-- conclure : « toast », « cashew » et « white » sont des mots pleins,
-- pas des mots-outils.
--
-- Trouvé parce que la phrase du rang mondial passait juste à côté. Il
-- reste vraisemblablement d'autres notes dans ce cas ; c'est un chantier
-- à ouvrir, pas un cas isolé à refermer ici.

-- ── Matilde : l'arabe rejoint le français ───────────────
UPDATE `brands` SET
  `history_ar` = REPLACE(`history_ar`,
    'أدار خوسيه سيخاس عقوداً أكبر مصنع سيجار فاخر في العالم، في لا رومانا',
    'أدار خوسيه سيخاس عقوداً مصنع لا رومانا، أحد أكبر مصانع القطاع')
WHERE `name` = 'Matilde';
