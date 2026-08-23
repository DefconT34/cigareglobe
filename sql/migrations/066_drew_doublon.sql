-- ════════════════════════════════════════════════════════
-- 066 — Deux fiches, un homme, deux versions
-- ────────────────────────────────────────────────────────
-- Drew Estate et Liga Privada portent chacune une anecdote sur Jonathan
-- Drew. C'est légitime — Liga Privada est une gamme de Drew Estate —
-- mais les deux racontent la MÊME chose autrement :
--
--   Drew Estate  : « La Liga Privada No.9 fut composée "pour quinze
--                    amis" — elle a depuis été fumée par plusieurs
--                    millions de personnes. »
--   Liga Privada : « Le No.9 fut composé en une nuit pour "épater
--                    quinze amis". Il en a épité quelques millions
--                    depuis. »
--
-- Trois écarts entre les deux : « pour » contre « pour épater », une
-- composition « en une nuit » qui n'apparaît que dans la seconde, et une
-- coquille — « il en a ÉPITÉ quelques millions ».
--
-- C'est le troisième cas de ce genre dans ce chantier, après l'anecdote
-- de Kennedy présente sur Montecristo ET H. Upmann avec deux
-- protagonistes différents. Le motif est constant : un même fait écrit à
-- deux endroits diverge, et aucun contrôle ne peut le voir puisque
-- chaque fiche est cohérente avec elle-même.
--
-- ── CE QU'ON GARDE, ET OÙ ───────────────────────────────
--
-- La citation part dans les deux cas : « pour épater quinze amis » n'est
-- pas sourçable, et les deux versions divergentes en sont la preuve.
--
-- Le fait — Drew assemble de nuit, en musique, et ne divulgue pas
-- l'origine de ses tabacs — reste sur DREW ESTATE, la maison. Liga
-- Privada, qui est une gamme, garde une entrée qui parle de la gamme
-- plutôt que de refaire le portrait de l'homme.
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET `celebrities` = JSON_SET(`celebrities`, '$[0].anecdote',
  'Drew assemble de nuit, souvent après minuit et en musique. Il n''a jamais divulgué précisément l''origine des tabacs de la Liga Privada — une opacité assumée, rare dans un métier qui aime détailler ses provenances.')
WHERE `name` = 'Drew Estate';

UPDATE `brands` SET `celebrities` = JSON_SET(`celebrities`, '$[0].anecdote',
  'La Liga Privada est née comme une série confidentielle avant de devenir la gamme la plus recherchée de Drew Estate. Son succès a créé un problème que la maison n''avait pas prévu : une demande que la production ne suit pas, et des ruptures devenues structurelles.')
WHERE `name` = 'Liga Privada';
