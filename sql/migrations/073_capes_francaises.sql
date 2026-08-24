-- ════════════════════════════════════════════════════════
-- 073 — Les capes : 87 étiquettes anglaises dans les six langues
-- ────────────────────────────────────────────────────────
-- Le champ `wrapper` de chaque vitole s'affiche dans une pastille sous
-- le récit. Quatre-vingt-sept de ses valeurs étaient en anglais —
-- « Ecuadorian Sun-Grown », « African Cameroon », « Nicaraguan Oscuro » —
-- et STRICTEMENT IDENTIQUES dans les six colonnes de langue.
--
-- Un lecteur chinois lisait « 茄衣: Ecuadorian Sun-Grown ». Un lecteur
-- français lisait « Wrapper: Ecuadorian Sun-Grown », les deux mots de
-- l'étiquette étant eux-mêmes écrits en dur en anglais dans panels.js.
--
-- ── POURQUOI LA CAMPAGNE NE L'A PAS VU ──────────────────
--
-- `i18n_langue_check` mesure des mots outils anglais — the, and, with,
-- which — dans de la PROSE. « Ecuadorian Sun-Grown » n'en contient
-- aucun : c'est une étiquette de deux mots, sans grammaire.
--
-- Et `i18n_fraicheur` comptait ces cases comme traduites, puisqu'elles
-- sont remplies et scellées sur le bon français. Même angle mort que la
-- fuite d'anglais elle-même, sur un autre type de contenu : les
-- compteurs mesurent la présence, jamais la justesse.
--
-- Le même trou couvrait `force` — cinq libellés (Light … Full), 244
-- pastilles, identiques dans les six langues. Traité côté front : c'est
-- un vocabulaire FERMÉ, il se résout par une clé et non par une
-- traduction ligne à ligne. Les capes, elles, forment un vocabulaire
-- ouvert de noms de variétés : elles restent en base.
--
-- ── CE QUI SE TRADUIT, ET CE QUI NE SE TRADUIT PAS ──────
--
-- Seule l'ORIGINE change de langue. Les variétés — Connecticut Shade,
-- Habano, Corojo, San Andrés, Java, Bahia, Jamastran, Maduro, Oscuro,
-- Colorado, Claro, Natural — sont des noms propres et restent telles
-- quelles, y compris en chinois et en arabe.
--
-- L'ordre des mots suit chaque langue : variété puis origine en
-- français, espagnol, allemand et arabe ; origine puis variété en
-- anglais et en chinois.
--
-- ── CE QUE LE GABARIT NE POUVAIT PAS FAIRE ──────────────
--
-- Deux valeurs ont dû être écrites à la main :
--
--   « Nicaraguan Sun-Grown ou Maduro » offre deux capes AU CHOIX. Le
--   gabarit en faisait une seule cape, « Maduro de plein soleil » : le
--   « ou » porte tout le sens et ne passe pas dans un modèle.
--
--   « Dominican Château de la Fuente » : un nom de finca ne se laisse
--   pas qualifier par un adjectif de nationalité. « Château de la
--   Fuente dominicain » ne se dit pas ; c'est devenu « Château de la
--   Fuente (République dominicaine) ».
--
-- Et une troisième correction porte sur le gabarit lui-même : sans
-- variété devant, « de plein soleil » devient tête de groupe et perd sa
-- préposition — « Plein soleil d'Équateur », non « de plein soleil
-- d'Équateur ».
-- ════════════════════════════════════════════════════════

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[0].wrapper', 'Jamastran du Honduras',
  '$[1].wrapper', 'Équateur')
WHERE `name` = 'Alec Bradley';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[0].wrapper', 'Château de la Fuente (République dominicaine)',
  '$[1].wrapper', 'Cameroun',
  '$[2].wrapper', 'Cameroun')
WHERE `name` = 'Arturo Fuente';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[0].wrapper', 'Cameroun')
WHERE `name` = 'Arturo Fuente Hemingway';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[0].wrapper', 'Maduro du Brésil')
WHERE `name` = 'Arturo Fuente Maduro';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[1].wrapper', 'Plein soleil d''Équateur')
WHERE `name` = 'Ashton';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[0].wrapper', 'Connecticut Shade d''Équateur')
WHERE `name` = 'Ashton Cabinet';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[0].wrapper', 'Java d''Indonésie',
  '$[1].wrapper', 'Java d''Indonésie',
  '$[2].wrapper', 'Java d''Indonésie')
WHERE `name` = 'Café Crème';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[0].wrapper', 'Corojo du Honduras',
  '$[1].wrapper', 'Oscuro du Honduras',
  '$[2].wrapper', 'Équateur')
WHERE `name` = 'Camacho';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[0].wrapper', 'Cameroun',
  '$[1].wrapper', 'Équateur',
  '$[2].wrapper', 'Nicaragua')
WHERE `name` = 'CAO';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[0].wrapper', 'San Andrés Maduro du Mexique')
WHERE `name` = 'CAO Black';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[0].wrapper', 'AVO XO du Cameroun')
WHERE `name` = 'CAO Cameroon';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[1].wrapper', 'Oscuro du Honduras')
WHERE `name` = 'Carlos Toraño Panama';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[0].wrapper', 'Bahia du Brésil',
  '$[1].wrapper', 'Bahia du Brésil',
  '$[2].wrapper', 'Bahia du Brésil')
WHERE `name` = 'Dannemann';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[0].wrapper', 'Dominicaine',
  '$[1].wrapper', 'Plein soleil d''Équateur',
  '$[2].wrapper', 'Nicaragua',
  '$[3].wrapper', 'Colorado d''Équateur')
WHERE `name` = 'Davidoff';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[0].wrapper', 'Indonésie',
  '$[2].wrapper', 'Équateur')
WHERE `name` = 'Drew Estate';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[1].wrapper', 'Équateur',
  '$[2].wrapper', 'Maduro du Honduras')
WHERE `name` = 'General Cigar';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[0].wrapper', 'Java-Sumatra d''Indonésie')
WHERE `name` = 'Henri Wintermans';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[0].wrapper', 'Oscuro du Nicaragua',
  '$[1].wrapper', 'Plein soleil du Nicaragua',
  '$[2].wrapper', 'Équateur')
WHERE `name` = 'Joya de Nicaragua';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[0].wrapper', 'Colorado dominicain',
  '$[2].wrapper', 'Colorado Claro dominicain')
WHERE `name` = 'La Flor Dominicana';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[1].wrapper', 'Oscuro d''Équateur')
WHERE `name` = 'Macanudo';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[1].wrapper', 'Connecticut Shade d''Équateur')
WHERE `name` = 'Montecristo Dominicain';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[0].wrapper', 'Habano Oscuro d''Équateur',
  '$[1].wrapper', 'Connecticut d''Équateur')
WHERE `name` = 'My Father';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[0].wrapper', 'Sumatra d''Équateur',
  '$[1].wrapper', 'Cameroun')
WHERE `name` = 'Oliva';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[0].wrapper', 'Connecticut Shade d''Équateur')
WHERE `name` = 'Oliva Connecticut Reserve';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[0].wrapper', 'Cameroun')
WHERE `name` = 'Oliva Serie G';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[0].wrapper', 'Plein soleil ou Maduro du Nicaragua',
  '$[1].wrapper', 'Maduro du Nicaragua',
  '$[2].wrapper', 'Natural / Maduro du Nicaragua')
WHERE `name` = 'Padrón';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[0].wrapper', 'Oscuro de plein soleil du Nicaragua',
  '$[1].wrapper', 'Habano du Nicaragua')
WHERE `name` = 'Perdomo';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[0].wrapper', 'Connecticut Shade d''Équateur')
WHERE `name` = 'Perdomo Ecuador';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[0].wrapper', 'Oscuro du Nicaragua',
  '$[1].wrapper', 'Honduras',
  '$[2].wrapper', 'Honduras')
WHERE `name` = 'Plasencia';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[1].wrapper', 'Plein soleil d''Équateur')
WHERE `name` = 'Rocky Patel';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[0].wrapper', 'Connecticut Shade d''Équateur')
WHERE `name` = 'Romeo y Julieta Dominicain';

UPDATE `brands` SET `gamme` = JSON_SET(`gamme`,
  '$[0].wrapper', 'San Andrés Maduro du Mexique',
  '$[1].wrapper', 'San Andrés Oscuro du Mexique',
  '$[2].wrapper', 'San Andrés Natural du Mexique')
WHERE `name` = 'Te Amo';

