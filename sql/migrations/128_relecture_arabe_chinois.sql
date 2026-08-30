-- ══════════════════════════════════════════════════════════
-- 128 — Relecture de l'arabe et du chinois : ce que la refonte a introduit
-- ──────────────────────────────────────────────────────────
-- CE QUE MESURE UNE RELECTURE, ET QUE HUIT CONTRÔLES NE MESURENT PAS.
--
-- Les contrôles savent dire qu'une phrase n'est pas dans sa langue,
-- qu'elle affirme un rang que la source ne fait pas, qu'elle porte une
-- année absente du français. Aucun ne sait dire si le mot employé est
-- LE BON, ni s'il est le même d'une fiche à l'autre.
--
-- Les 43 fiches refaites pendant la refonte des périmées emploient, pour
-- quatre notions, un vocabulaire différent des 75 autres. L'atlas se lit
-- comme si deux traducteurs avaient travaillé sans glossaire — ce qui
-- est exactement ce qui s'est passé.
--
-- ── CHINOIS : TROIS TERMES, ET DEUX SONT FAUTIFS ──────────
--
--   芯叶 (13 fiches, les miennes) contre 茄芯 (15, le corpus).
--     La triade du métier est 茄衣 / 茄套 / 茄芯 — cape, sous-cape,
--     tripe. `茄衣` était déjà employé partout ; `芯叶` cassait la série
--     au milieu.
--
--   卷烟师 (8, les miennes) contre 卷制师 (4, le corpus).
--     卷烟 désigne la CIGARETTE. « 卷烟师 » se lit donc « rouleur de
--     cigarettes » dans une encyclopédie du cigare. Ce n'est pas une
--     variante, c'est une erreur. 卷烟工 (2) part avec.
--
--   下部谷地 (14, les miennes) contre 阿巴霍谷 (5) et « Vuelta Abajo »
--     en latin (3).
--     La Vuelta Abajo est un nom de lieu ; je l'avais TRADUIT
--     littéralement — « la vallée basse ». Le corpus la nomme 阿巴霍谷,
--     et garde le latin là où il l'oppose à la Vuelta Arriba (Quintero,
--     Hoyo de Monterrey), ce qui reste nécessaire. On s'aligne sur le
--     corpus, et le latin ne bouge pas.
--
-- ── ARABE : UN TERME AMBIGU, ALIGNÉ SUR LE PLUS CLAIR ─────
--
--   ملفّ (5 fiches, le corpus) contre لافّ (9, les miennes).
--     Les deux sont défendables — ملفّو القرن التاسع عشر est bien un
--     nom d'agent. Mais ملفّ s'écrit comme le mot « dossier », et le
--     lecteur doit lever l'ambiguïté par le contexte. لافّ, de لفّ,
--     n'a pas ce défaut. Ici l'alignement se fait donc dans l'autre
--     sens : cinq fiches changent, pas neuf.
--
-- ── ET CE QU'UNE LECTURE SUIVIE A TROUVÉ ──────────────────
--
-- Quatre textes lus en entier — Dannemann (zh), Trinidad (zh), Punch
-- (ar), Joya de Nicaragua (ar). Trois fautes de langue, dont une
-- d'accord :
--
--   ar « وكان إعادة البناء تدريجيًّا ومقصودًا » — إعادة est FÉMININ.
--   ar « أكثر المنشآت الصناعية » là où le sens est « la plupart » :
--        معظم. « أكثر » dit « plus nombreuses ».
--   ar « من أكثر سيجار … حديثًا عنه » — pluriel attendu : سيجارات … عنها.
--
-- Et deux calques du français en chinois, corrects mais lourds :
--   « 此后需求就没有停止超过供给 » → « 此后需求一直超过供给 »
--   « 能这样说的用心消费品并不多 » → « …讲究的消费品… »
--
-- LA LECTURE N'A PORTÉ QUE SUR QUATRE TEXTES SUR QUATRE-VINGT-SIX. Ce
-- qui suit corrige ce qui a été vu et mesuré ; le reste attend une
-- relecture par un locuteur, que ce fichier ne remplace pas.
-- ══════════════════════════════════════════════════════════

-- ── Chinois : la triade du métier ─────────────────────────
UPDATE `brands` SET `history_zh` = REPLACE(`history_zh`, '芯叶', '茄芯') WHERE `history_zh` LIKE '%芯叶%';
UPDATE `brands` SET `gamme_zh`   = REPLACE(`gamme_zh`,   '芯叶', '茄芯') WHERE `gamme_zh`   LIKE '%芯叶%';
UPDATE `brands` SET `pairings_zh`= REPLACE(`pairings_zh`,'芯叶', '茄芯') WHERE `pairings_zh`LIKE '%芯叶%';

-- ── Chinois : le rouleur n'est pas un cigarettier ─────────
UPDATE `brands` SET `history_zh` = REPLACE(REPLACE(`history_zh`, '卷烟师', '卷制师'), '卷烟工', '卷制师')
 WHERE `history_zh` LIKE '%卷烟师%' OR `history_zh` LIKE '%卷烟工%';
UPDATE `brands` SET `gamme_zh` = REPLACE(REPLACE(`gamme_zh`, '卷烟师', '卷制师'), '卷烟工', '卷制师')
 WHERE `gamme_zh` LIKE '%卷烟师%' OR `gamme_zh` LIKE '%卷烟工%';
-- Les deux colonnes que le premier jet avait oubliees : le terme vit
-- aussi dans les accords et les anecdotes.
UPDATE `brands` SET `pairings_zh` = REPLACE(REPLACE(`pairings_zh`, '卷烟师', '卷制师'), '卷烟工', '卷制师')
 WHERE `pairings_zh` LIKE '%卷烟师%' OR `pairings_zh` LIKE '%卷烟工%';
UPDATE `brands` SET `celebrities_zh` = REPLACE(REPLACE(`celebrities_zh`, '卷烟师', '卷制师'), '卷烟工', '卷制师')
 WHERE `celebrities_zh` LIKE '%卷烟师%' OR `celebrities_zh` LIKE '%卷烟工%';

-- ── Chinois : un nom de lieu ne se traduit pas ────────────
UPDATE `brands` SET `history_zh` = REPLACE(`history_zh`, '下部谷地', '阿巴霍谷') WHERE `history_zh` LIKE '%下部谷地%';
UPDATE `brands` SET `gamme_zh`   = REPLACE(`gamme_zh`,   '下部谷地', '阿巴霍谷') WHERE `gamme_zh`   LIKE '%下部谷地%';
UPDATE `brands` SET `pairings_zh`= REPLACE(`pairings_zh`,'下部谷地', '阿巴霍谷') WHERE `pairings_zh`LIKE '%下部谷地%';

-- ── Arabe : le rouleur, sans ambiguïté ────────────────────
--
-- Les formes fléchies sont reprises une par une, et c'est nécessaire :
-- la fiche Crowned Heads dit « تختار الدار ملفّها تبعاً للخلطة » — « la
-- maison choisit SON PROFIL selon l'assemblage ». C'est l'autre sens du
-- mot, parfaitement correct, et une substitution sur la racine seule
-- l'aurait transformé en « son rouleur ».
--
-- C'est précisément l'ambiguïté qui motive l'alignement : là où le
-- lecteur doit trancher entre « rouleur » et « dossier », le texte perd
-- une seconde. `لافّ` ne pose pas la question.
UPDATE `brands` SET `history_ar` =
  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(`history_ar`,
    'الملفّين', 'اللافّين'), 'ملفّين', 'لافّين'), 'ملفّو', 'لافّو'), 'ملفّي', 'لافّي'), 'ملفّ ', 'لافّ ')
 WHERE `history_ar` LIKE '%ملفّ%';
UPDATE `brands` SET `gamme_ar` =
  REPLACE(REPLACE(REPLACE(`gamme_ar`,
    'الملفّين', 'اللافّين'), 'ملفّين', 'لافّين'), 'ملفّو', 'لافّو')
 WHERE `gamme_ar` LIKE '%ملفّين%' OR `gamme_ar` LIKE '%ملفّو%';

-- ── Les fautes de langue relevées à la lecture ────────────
UPDATE `brands`
   SET `history_ar` = REPLACE(REPLACE(`history_ar`,
       'وكان إعادة البناء تدريجيًّا ومقصودًا',
       'وكانت إعادة البناء تدريجية ومقصودة'),
       'محافظًا على استمرار ما كانت أكثر المنشآت الصناعية لتحتمله',
       'محافظًا على استمرارية ما كانت معظم المنشآت الصناعية لتحتملها')
 WHERE `name` = 'Joya de Nicaragua';

UPDATE `brands`
   SET `history_ar` = REPLACE(`history_ar`,
       'من أكثر سيجار الكتالوغ الهافاني حديثًا عنه',
       'من أكثر سيجارات الكتالوغ الهافاني حديثًا عنها')
 WHERE `name` = 'Punch';

UPDATE `brands`
   SET `history_zh` = REPLACE(`history_zh`,
       '此后需求就没有停止超过供给', '此后需求一直超过供给')
 WHERE `name` = 'Trinidad';

UPDATE `brands`
   SET `history_zh` = REPLACE(REPLACE(REPLACE(`history_zh`,
       '能这样说的用心消费品并不多', '能这样说的讲究消费品并不多'),
       '被数百年的泛滥与沉积养厚', '由数百年的泛滥与沉积淤积得深厚'),
       '把小雪茄与小卷烟当作负担得起的日常习惯', '把小雪茄与迷你雪茄当作负担得起的日常习惯')
 WHERE `name` = 'Dannemann';
