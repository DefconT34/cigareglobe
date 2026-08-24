-- ════════════════════════════════════════════════════════
-- 080 — « Moho azul » : le français était la seule langue à ne pas traduire
-- ────────────────────────────────────────────────────────
-- Signalé par un lecteur : « moho azul, qu'est-ce que c'est ? »
--
-- C'est le champignon qui a détruit les récoltes cubaines à la fin des
-- années 1970 et forcé la création des hybrides résistants dont
-- descendent la plupart des tabacs d'aujourd'hui. En français il
-- s'appelle le MILDIOU BLEU du tabac.
--
-- ── LA GLOSE DÉPENDAIT DE L'ORDRE DE LECTURE ────────────
--
-- Le terme apparaît sur quatre fiches de feuilles. Une seule
-- l'expliquait :
--
--   Habano 2000  : « le moho azul — un champignon — arrive à Cuba »
--   Corojo       : « Le moho azul chassera l'originale… »
--   Criollo 98   : « Une réponse cubaine au moho azul : … »
--   Havana 92    : « née de la lutte contre le moho azul. »
--
-- Ces fiches s'ouvrent indépendamment. Rien ne garantit qu'on lise
-- Habano 2000 en premier, et le lecteur qui entre par Criollo 98 lit un
-- mot espagnol qu'aucune phrase ne lui explique.
--
-- C'est le même motif que les défauts des migrations précédentes : une
-- information est juste à un endroit et absente à un autre, et chaque
-- fiche reste cohérente avec elle-même.
--
-- ── CE QUI REND CE CAS PARTICULIER ──────────────────────
--
-- Les cinq autres langues, elles, ont TRADUIT :
--
--   en : blue mould        de : Blauschimmel
--   es : moho azul (c'est l'espagnol, donc le nom commun)
--   ar : العفن الأزرق
--
-- Le français est la seule des six à avoir gardé le terme espagnol. La
-- campagne de traduction cherchait de l'anglais dans les colonnes
-- traduites ; personne ne cherchait de l'ESPAGNOL dans la colonne
-- source. Un mot étranger non traduit dans la langue de départ ne
-- déclenche aucun compteur — il ne peut être signalé que par un lecteur.
--
-- Le terme espagnol reste en apposition là où il éclaire quelque chose :
-- c'est le nom sous lequel les Cubains l'ont vécu.
--
-- ── ET UNE COQUILLE CHINOISE, DANS LES QUATRE FICHES ────
--
-- Le chinois écrivait 霉霜病 au lieu de 霜霉病 — les deux caractères du
-- milieu inversés. 霜霉病 est le mildiou ; 霉霜病 ne veut rien dire. La
-- faute est identique sur les quatre fiches, donc recopiée d'une
-- traduction à l'autre.
-- ════════════════════════════════════════════════════════

-- ── Français : nommer la maladie ────────────────────────
UPDATE `feuilles` SET `genese` = REPLACE(`genese`,
  'le moho azul — un champignon — arrive à Cuba',
  'le mildiou bleu — le moho azul des Cubains, un champignon qui ravage les plants — arrive à Cuba')
WHERE `id` = 'cuba-habano-2000';

UPDATE `feuilles` SET `genese` = REPLACE(`genese`,
  'Le moho azul chassera l''originale des champs cubains',
  'Le mildiou bleu — le moho azul, ce champignon qui s''attaque aux plants — chassera l''originale des champs cubains')
WHERE `id` = 'honduras-corojo';

UPDATE `feuilles` SET `genese` = REPLACE(`genese`,
  'Une réponse cubaine au moho azul :',
  'Une réponse cubaine au mildiou bleu, le moho azul :')
WHERE `id` = 'nicaragua-criollo-98';

UPDATE `feuilles` SET `genese` = REPLACE(`genese`,
  'née de la lutte contre le moho azul.',
  'née de la lutte contre le mildiou bleu, le moho azul des planteurs cubains.')
WHERE `id` = 'nicaragua-havana-92';

-- ── Chinois : 霉霜病 → 霜霉病 ────────────────────────────
UPDATE `feuilles` SET `genese_zh` = REPLACE(`genese_zh`, '霉霜病', '霜霉病')
WHERE `genese_zh` LIKE '%霉霜病%';

UPDATE `feuilles` SET `caracteres_zh` = REPLACE(`caracteres_zh`, '霉霜病', '霜霉病')
WHERE `caracteres_zh` LIKE '%霉霜病%';

UPDATE `feuilles` SET `culture_zh` = REPLACE(`culture_zh`, '霉霜病', '霜霉病')
WHERE `culture_zh` LIKE '%霉霜病%';
