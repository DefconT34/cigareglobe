-- ════════════════════════════════════════════════════════
-- 104 — Promotion vers le français, lot 3
-- ────────────────────────────────────────────────────────
-- Premières fiches de la seconde moitié du chantier. Ce n'est plus
-- remplacer un moignon : le français fait déjà 800 caractères, l'anglais
-- 2 200, et les deux disent en partie la même chose autrement. Il faut
-- FUSIONNER, en gardant ce que le français avait de mieux tourné.
--
-- ── CE QUE LA PROMOTION FILTRE ──────────────────────────
--
--   « without the consistent NUMBER-ONE RANKINGS that come, by
--     definition, only once a year » (Alec Bradley) — une allusion au
--     classement annuel de la presse. C'est la troisième fois que le
--     prix 2011 de cette maison ressort : migration 099 dans cinq
--     anecdotes, migration 100 dans `history_ar`, et ici en anglais.
--     Un même fait à trois adresses, retiré trois fois.
--
--   « The allocations sold out within hours » et « retailers reported
--     customers calling daily for months » — deux chiffres que personne
--     n'a comptés. La liste d'attente de deux ans, elle, figurait déjà
--     dans le français et se garde.
--
--   « the finest Dominican sourcing and manufacturing precision in the
--     island's industry » (Ashton) — un rang. Ce qui reste dit mieux, et
--     se vérifie : les deux maisons partagent un plancher de qualité,
--     puisque ce que les Fuente acceptent de signer de leur nom, ils le
--     produisent aussi pour Taylor.
--
-- ── ET CE QUI EST GARDÉ, PARCE QU'ATTRIBUÉ ──────────────
--
-- « Taylor believed the BEST Dominican factory was producing at a level
-- that deserved a premium brand » : c'est sa conviction de 1985, dite
-- comme telle. L'atlas rapporte un jugement, il ne le porte pas.
--
-- ── UNE CORRECTION AU PASSAGE ───────────────────────────
--
-- Le français d'Alec Bradley disait « Alec Bradley devint une référence
-- mondiale ». Aucun motif ne l'attrapait — « référence mondiale » n'est
-- ni « le plus … du monde » ni « premier … mondial » —, mais c'est le
-- même genre d'affirmation. Le texte dit désormais ce qui s'observe :
-- la maison est sortie du cercle des initiés.
-- ════════════════════════════════════════════════════════

-- ── Alec Bradley ────────────────────────────────────────
UPDATE `brands` SET `history` =
'La décision d''Alan Rubin de quitter la vente de matériel médical, en 1996, pour entrer dans le cigare tenait à la fois de la passion et du calcul, dans des proportions qu''il n''a jamais précisées. Fumeur sérieux depuis sa vingtaine, il s''était forgé au fil des années une thèse sur ce qui manquait au marché américain : des cigares d''une vraie exigence, vendus à un prix qui permette de fumer tous les jours plutôt que de rationner.

Il donna à l''entreprise le nom de ses deux fils, Alec et Bradley — et non le sien. Le geste posait d''emblée que l''affaire était personnelle autant que commerciale, et que sa réussite ou son échec se mesureraient autrement qu''en chiffre d''affaires trimestriel.

Les premières années furent aussi difficiles que la suite le laisse deviner. Rubin parcourait les États-Unis d''un compte à l''autre, ouvrant le coffre de sa voiture pour montrer ses échantillons, bâtissant un réseau de distribution détaillant par détaillant, sans antécédents ni relations héritées.

Le lien avec le Honduras, noué au début des années 2000 avec les manufactures de la famille Plasencia, donna à la maison la qualité de feuille et la précision de roulage que son ambition réclamait. Le Honduras était alors éclipsé commercialement par l''émergence du Nicaragua, mais les sols de la vallée de Jamastran, marqués par le corojo, et le savoir-faire des Plasencia sur plusieurs générations donnaient un tabac avec lequel un assembleur de goût pouvait travailler au plus haut niveau.

Le Prensado, sorti en 2011, montra ce que cet investissement avait produit. Robusto pressé, cape corojo hondurienne cultivée par les Plasencia sur un assemblage guatémaltèque et hondurien, il fit connaître la maison bien au-delà du cercle des initiés — jusque-là, Alec Bradley restait un nom que peu de fumeurs auraient su placer. La liste d''attente se maintint plus de deux ans.

La maison a continué depuis sans chercher l''effet : le Tempus, le Medalist, la série Black Market déclinent la même approche — des assemblages honduriens et guatémaltèques sérieux, roulés avec précision, vendus sans tapage.'
WHERE `name` = 'Alec Bradley';

-- ── Ashton ──────────────────────────────────────────────
UPDATE `brands` SET `history` =
'L''histoire d''Ashton commence à Philadelphie, en 1985, dans une boutique spécialisée où William Ashton Taylor avait passé des années à vendre les cigares des autres et à développer une insatisfaction informée. La République dominicaine, devenue dans les années 1970 la principale alternative à Cuba pour les fumeurs américains, produisait des cigares de qualité très inégale — certains excellents, beaucoup simplement corrects. Taylor était convaincu que la meilleure manufacture dominicaine travaillait à un niveau qui méritait une marque premium, et que le marché ne lui avait pas encore donné ce véhicule.

Cette manufacture, c''était Arturo Fuente. La relation nouée avec Carlos Fuente Sr. en 1985 tient toujours : chaque cigare Ashton est produit dans les ateliers Fuente, à partir de tabacs que la famille sélectionne et fermente selon les spécifications que Taylor et Carlito ont mises au point ensemble. L''arrangement signifie aussi que les deux maisons partagent un plancher de qualité — ce que la famille Fuente accepte de signer de son nom, elle le produit aussi pour la marque de Taylor.

Le catalogue qui en est sorti couvre toute l''étendue de l''expression dominicaine. Les gammes Connecticut Shade classiques disent la proposition de fond : racée, crémeuse, d''une régularité de construction que peu de maisons tiennent. Les lignes VSG — Virgin Sun Grown — emploient une cape équatorienne cultivée au soleil pour un caractère plus plein, qui a surpris les fumeurs ne connaissant d''Ashton que ses expressions douces. La Cabinet Selection, vieillie en caisses de cèdre espagnol après roulage, montre la maison à son sommet de raffinement.

L''identité de la marque tient de Philadelphie : sobre, attentive à la qualité, plus intéressée par l''exécution que par le théâtre du monde du cigare. Là où Davidoff est genevois et froid, Ashton est philadelphien et chaleureux. Elle ne fait pas parler d''elle avec des formats extrêmes ou des assemblages inattendus ; elle fait des cigares vers lesquels les amateurs expérimentés reviennent sans être déçus, ce qui est plus difficile qu''il n''y paraît.'
WHERE `name` = 'Ashton';
