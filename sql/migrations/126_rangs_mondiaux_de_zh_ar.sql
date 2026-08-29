-- ══════════════════════════════════════════════════════════
-- 126 — Les dix rangs mondiaux que le contrôle ne cherchait pas
-- ──────────────────────────────────────────────────────────
-- Élargis aux tournures allemandes, chinoises et arabes, les motifs de
-- `marques_check` ont fait apparaître DIX affirmations de rang mondial
-- restées vivantes dans des colonnes que personne ne relisait. Le
-- français de chacune de ces fiches n'en porte aucune : elles avaient
-- été retirées côté français et espagnol, et laissées ailleurs.
--
-- Montecristo à lui seul l'affirmait en trois langues. La migration 108
-- avait retiré « le cigare le plus vendu du monde » du français et de
-- l'espagnol ; l'allemand, le chinois et l'arabe le disaient encore.
--
-- ── CE QUE CETTE MIGRATION EST, ET N'EST PAS ───────────────
--
-- C'est un RETRAIT, pas une retraduction. Neuf de ces dix colonnes
-- portent `source_hash = 'PERIMEE-PROMOTION'` : elles sont déjà
-- inscrites au chantier de refonte, et seront réécrites en entier
-- depuis le français actuel. La dixième (PDR Cigars) est périmée depuis
-- la migration 123, qui a réécrit son français.
--
-- On aurait donc pu attendre. Mais attendre, c'est continuer de publier
-- dix affirmations invérifiables dans trois langues, et le chantier de
-- refonte se compte en centaines d'heures.
--
-- CONSÉQUENCE ASSUMÉE : le scellement n'est PAS touché. Ces dix
-- traductions restent périmées, parce qu'elles le sont — retirer une
-- phrase fausse ne rend pas juste le reste du texte. Le compte des 175
-- en attente ne bouge pas d'une unité.
--
-- ── CHAQUE REMPLACEMENT DIT CE QUE DIT LE FRANÇAIS ─────────
--
-- Le fragment fautif est remplacé, jamais la phrase entière : ce qui
-- l'entoure a été traduit correctement et n'a rien à faire ici.
-- ══════════════════════════════════════════════════════════

-- ── Cohiba (zh) ────────────────────────────────────────────
-- « la marque la plus connue, la plus contrefaite et la plus convoitée
-- au monde » — le français ne classe rien : il note l'ironie du nom
-- taïno, et laisse les contrefaçons parler d'elles-mêmes.
UPDATE `brands` SET `history_zh` = REPLACE(`history_zh`,
  '科伊巴如今是全球最知名、最被仿冒、最令人垂涎的雪茄品牌。',
  '讽刺之处正在于此——一支层层礼仪包裹的雪茄，用的却是它自身最古老、最赤裸的名字。')
WHERE `name` = 'Cohiba';

-- ── Davidoff (zh) ──────────────────────────────────────────
-- « le cigare le plus cher au monde pendant 25 ans ». Le français dit
-- vingt-DEUX ans, et parle d'objet de désir, pas de prix record : la
-- durée était fausse en plus du rang.
UPDATE `brands` SET `history_zh` = REPLACE(`history_zh`,
  '——25年间全球最昂贵的雪茄。',
  '——在长达二十二年里，它是所有自认懂雪茄之人的欲望之物。')
WHERE `name` = 'Davidoff';

-- ── Joya de Nicaragua (zh) ─────────────────────────────────
-- « souvent décrit comme le cigare le plus fort au monde ». « Souvent
-- décrit » n'est pas une source : c'est une façon de ne pas en donner.
UPDATE `brands` SET `history_zh` = REPLACE(`history_zh`,
  '常被描述为世界最强雪茄',
  '把尼加拉瓜式的浓烈推到了这家老厂所能驾驭的极限')
WHERE `name` = 'Joya de Nicaragua';

-- ── La Flor Dominicana (de, zh) ────────────────────────────
-- « le plus grand cigare produit en série au monde ». Le français s'en
-- tient au fait vérifiable : le format exige un moule fabriqué pour
-- cette maison seule.
UPDATE `brands` SET `history_de` = REPLACE(`history_de`,
  'die weltweit größte Serienzigarre',
  'ein Doppel-Torpedo, dessen Format eine eigens für das Haus angefertigte Form verlangt')
WHERE `name` = 'La Flor Dominicana';

UPDATE `brands` SET `history_zh` = REPLACE(`history_zh`,
  '全球量产最大的雪茄',
  '一支双鱼雷，其尺寸需要一副专为本厂定制的模具')
WHERE `name` = 'La Flor Dominicana';

-- ── Montecristo (de, zh, ar) — le même fait, trois adresses ─
-- Le français : « à la fin des années 1940, le No.4 s'était imposé
-- comme la définition du cigare de tous les jours ». Une place dans les
-- habitudes, pas dans un classement que personne ne publie.
UPDATE `brands` SET `history_de` = REPLACE(`history_de`,
  'ist die meistverkaufte Zigarre der Welt',
  'galt Ende der 1940er Jahre als die Definition der Zigarre für jeden Tag')
WHERE `name` = 'Montecristo';

UPDATE `brands` SET `history_zh` = REPLACE(`history_zh`,
  '是全球销量最高的雪茄',
  '在1940年代末成了日常雪茄的定义')
WHERE `name` = 'Montecristo';

UPDATE `brands` SET `history_ar` = REPLACE(`history_ar`,
  'هو أكثر السيجار مبيعًا في العالم',
  'صار في أواخر الأربعينيات تعريفًا لسيجار كل يوم')
WHERE `name` = 'Montecristo';

-- ── Partagás (zh) ──────────────────────────────────────────
-- « la plus ancienne manufacture de cigares encore en activité au
-- monde ». Le français dit ce qui s'observe, et c'est plus fort : cent
-- quatre-vingts ans à la même adresse, sans jamais fermer.
UPDATE `brands` SET `history_zh` = REPLACE(`history_zh`,
  '它是全球仍在运营的最古老雪茄工厂。',
  '一百八十年来，它从未搬迁、从未关闭、从未改作他用。')
WHERE `name` = 'Partagás';

-- ── PDR Cigars (zh) ────────────────────────────────────────
-- « la ville qui roule le plus de cigares au monde par habitant ». La
-- migration 123 l'a retiré du français : personne ne tient ce ratio.
-- Reste ce qui s'observe.
UPDATE `brands` SET `history_zh` = REPLACE(`history_zh`,
  '这座城市按人均计算大概是世界上卷制雪茄最多的地方',
  '在这座城市，卷制雪茄占据了人口中不寻常的一部分')
WHERE `name` = 'PDR Cigars';
