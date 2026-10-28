-- ════════════════════════════════════════════════════════
-- 281 — Trois domaines morts : lefagot.com, zirahotel.com, espinashotel.com
-- ────────────────────────────────────────────────────────
-- CE QU'ON A TROUVÉ. `sources.php --verifier` (28 octobre 2026) : trois domaines
-- résolus en septembre sont inexistants au DNS (nslookup 8.8.8.8 : NXDOMAIN).
-- Règle : un domaine mort ne se cite pas. Chaque fiche a été relue par
-- expert-cigare (recherches en langue locale et en anglais), puis la fiche 950
-- passée à un contradicteur qui a lu les pages de chaque salon de l'hôtel.
--
--   #11  Fagot Cigare (Abidjan) — aucun nouveau domaine, aucun compte, aucune
--        presse, aucune fermeture attestée : GARDÉE, « à vérifier », sans offre
--        décrite ; `website` (mort) effacé. La marque Le Fagot Cigar perd la
--        citation du domaine dans sa `source` ; son texte n'est pas touché ; les deux fiches de feuilles (Didiévi, Tiébissou)
--        qui citaient le domaine disent désormais « site de la maison, depuis disparu du DNS ».
--   #935 Zira Hotel (Belgrade) — l'hôtel est actif, aucun cigar bar décrit, mais
--        la page officielle (403) n'a pas pu être lue : le silence seul ne retire
--        rien. GARDÉE, « à vérifier », description ramenée à ce qu'on sait.
--   #950 Espinas Palace (Téhéran) — l'hôtel publie la liste de ses salons (Sky
--        Lounge, Diba VIP Hall, Laton VIP Hall, Sunset Café) : aucun salon
--        cigares. Règle de la fiche 155 : RETIRÉE (`is_verified = 0`). L'adresse
--        de la fiche (Sheikh Bahaei / Chamran) était de surcroît fausse.
--
-- Après cette migration : contenu_dump, sources --figer.
-- ════════════════════════════════════════════════════════

UPDATE `lounges` SET
  `description` = 'Atelier de cigares annoncé à Abidjan, dans le quartier de la Riviéra Palmeraie ; aucune source publique ne confirme son activité aujourd''hui.',
  `description_en` = 'A cigar workshop listed in the Riviéra Palmeraie district of Abidjan; no public source confirms that it is active today.',
  `description_es` = 'Taller de puros indicado en el barrio de Riviéra Palmeraie de Abiyán; ninguna fuente pública confirma que siga activo hoy.',
  `description_de` = 'Im Viertel Riviéra Palmeraie von Abidjan verzeichnete Zigarrenwerkstatt; keine öffentliche Quelle bestätigt ihre heutige Tätigkeit.',
  `description_zh` = '该处标注在阿比让 Riviera Palmeraie 区设有雪茄作坊，但没有公开来源证实其目前仍在营业。',
  `description_ar` = 'ورشة سيجار يُشار إليها في حي ريفييرا بالميري بمدينة أبيدجان، لكن لا يؤكد أي مصدر عام أنها ما زالت تعمل اليوم.',
  `source` = 'à vérifier — relu le 28 octobre 2026 : le site officiel de la maison n''existe plus ; aucune page, aucun compte ni article de presse ne confirme l''activité actuelle de l''atelier (cinq requêtes en français et en anglais)',
  `website` = NULL,
  `updated_at` = NOW()
 WHERE `id` = 11 AND `country_id` = 'ivorycoast';

UPDATE `lounges` SET
  `description` = 'Zira Hotel, Ruzveltova 35, à Zvezdara, Belgrade. Un cigar bar y est annoncé ; aucune source publique ne le décrit.',
  `description_en` = 'Zira Hotel, Ruzveltova 35, in Zvezdara, Belgrade. A cigar bar is listed there; no public source describes it.',
  `description_es` = 'Zira Hotel, Ruzveltova 35, en Zvezdara, Belgrado. Se indica allí un cigar bar; ninguna fuente pública lo describe.',
  `description_de` = 'Zira Hotel, Ruzveltova 35, in Zvezdara, Belgrad. Eine Zigarrenbar ist dort verzeichnet; keine öffentliche Quelle beschreibt sie.',
  `description_zh` = 'Zira Hotel，位于贝尔格莱德兹韦兹达拉区鲁兹维尔托娃街35号。该处标注设有雪茄吧，但没有公开来源对其作出描述。',
  `description_ar` = 'فندق Zira، شارع روزفلتوفا 35، في حي زفيزدارا ببلغراد. يُشار إلى وجود بار للسيجار فيه، لكن لا يصفه أي مصدر عام.',
  `source` = 'à vérifier — relu le 28 octobre 2026 : l''hôtel est référencé sous le nom Golden Tulip Zira Belgrade ; son cigar bar n''est décrit par aucune page ni aucun listing lus ; l''ancien site de l''hôtel n''existe plus',
  `updated_at` = NOW()
 WHERE `id` = 935 AND `country_id` = 'serbia';

UPDATE `lounges` SET `is_verified` = 0, `source` = 'RETIRÉ — relu le 28 octobre 2026 : la liste publiée des salons de l''hôtel (Sky Lounge, Diba VIP Hall, Laton VIP Hall, Sunset Café) ne compte aucun salon cigares — le Sunset Café est un salon à narguilé, les deux VIP Hall des salles de réunion ; recherches en persan et en anglais sans résultat ; l''adresse de la fiche est fausse (l''hôtel est à Saadat Abad, place Bahrood) ; à rétablir si une page est apportée', `updated_at` = NOW()
 WHERE `id` = 950 AND `country_id` = 'iran';

UPDATE `brands` SET `source` = 'Site officiel de la maison, lu avant sa disparition du DNS (constatée le 28 octobre 2026), et repris sur la fiche de l''établissement Fagot Cigare (#11). Aucune année de fondation n''y était publiée'
 WHERE `name` = 'Le Fagot Cigar' AND `country_id` = 'ivorycoast';

UPDATE `feuilles` SET `source` = REPLACE(`source`, 'lefagot.com (', 'site de la maison Le Fagot Cigar, depuis disparu du DNS (')
 WHERE `id` IN ('cote-d-ivoire-didievi','cote-d-ivoire-tiebissou');

UPDATE `translation_status` t
  JOIN `lounges` l ON l.`id` = t.`entite_id`
   SET t.`source_hash` = SHA1(l.`description`), t.`statut` = 'machine', t.`maj` = NOW()
 WHERE t.`entite` = 'lounges' AND t.`champ` = 'description' AND t.`entite_id` IN ('11','935');

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 281';
INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 281','systeme','domaine_mort_retire','lounge',11,
   'lefagot.com inexistant au DNS : source reecrite a verifier, description sans offre, website efface ; marque Le Fagot Cigar : citation du domaine retiree'),
  (NULL,'migration 281','systeme','domaine_mort_retire','lounge',935,
   'zirahotel.com inexistant au DNS : source a verifier, description ramenee a ce qui est sourcable ; le domaine reconverti de l hotel n est pas cite'),
  (NULL,'migration 281','systeme','fiche_retiree','lounge',950,
   'espinashotel.com inexistant ; la liste publiee des salons de l hotel ne compte aucun salon cigares (regle de la fiche 155) ; adresse de la fiche fausse');

-- Contrôle : des 1 partout.
SELECT
  (SELECT COUNT(*) FROM `lounges` WHERE `id` IN (11,935) AND `source` LIKE 'à vérifier — relu le 28 octobre 2026%') = 2 AS `deux_a_verifier`,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` = 950 AND `is_verified` = 0 AND `source` LIKE 'RETIRÉ%') = 1 AS `espinas_retire`,
  (SELECT COUNT(*) FROM `lounges` WHERE `id` = 11 AND `website` IS NULL) = 1 AS `website_efface`,
  (SELECT COUNT(*) FROM `feuilles` WHERE `source` LIKE '%lefagot.com%') = 0 AS `feuilles_nettoyees`,
  (SELECT COUNT(*) FROM `lounges` WHERE `source` LIKE '%lefagot.com%' OR `source` LIKE '%zirahotel.com%' OR `source` LIKE '%espinashotel.com%') = 0 AS `plus_de_domaine_mort`,
  (SELECT COUNT(*) FROM `translation_status` WHERE `entite` = 'lounges' AND `champ` = 'description' AND `entite_id` IN ('11','935') AND `statut` = 'machine') = 10 AS `sceaux_remis`;
