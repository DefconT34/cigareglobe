-- ════════════════════════════════════════════════════════
-- 133 — Abidjan : mettre à sa place ce qu'on savait déjà
-- ────────────────────────────────────────────────────────
-- CE QUE CETTE MIGRATION FAIT, ET SURTOUT CE QU'ELLE NE FAIT PAS.
--
-- Les quinze adresses d'Abidjan sont à 6 % de complétude. La demande
-- était de les remplir. Or on ne remplit pas une fiche d'établissement
-- avec de la vraisemblance : un horaire inventé envoie quelqu'un devant
-- une porte fermée, et une coordonnée approximative l'envoie ailleurs.
-- Ce qui est faux est pire que ce qui est vide, parce que le vide se
-- voit et que le faux se croit.
--
-- Cette migration ne déplace donc QUE ce que les fiches disaient déjà,
-- dans leur propre texte, vers le champ qui lui revient :
--
--   #1  « Ouvert 10h-2h »            écrit dans la description
--   #4  « Instagram: @cigarro.ci »            idem
--   #5  « Instagram: @cigarro.ci »            idem
--   #8  « Instagram: @irokoloungeabidjan »    idem
--   #11 « Instagram: @fagot_cigare »          idem
--
-- Aucune valeur nouvelle. Rien qui ne soit déjà en base, sourcé comme
-- le reste de la fiche. C'est du rangement, pas de la saisie.
--
-- POURQUOI LES DESCRIPTIONS NE SONT PAS NETTOYÉES EN PASSANT.
-- « Instagram: @cigarro.ci » restera dans le texte alors que le compte
-- a désormais sa colonne. La redondance est laide et elle est
-- délibérée : `lounges.description` porte 2 500 traductions scellées
-- (translation_status), et y toucher les périmerait toutes en silence.
-- Une répétition visible coûte moins qu'un corpus de traductions
-- désynchronisé sans que rien ne le dise.
--
-- CE QUI RESTE À FAIRE, ET QUI NE PEUT PAS L'ÊTRE D'ICI : les horaires
-- des quatorze autres, les sites web, et les quinze positions. Elles se
-- relèvent sur place ou sur la page Maps de chaque établissement —
-- clic droit, la première ligne du menu donne le couple de
-- coordonnées. L'onglet Adresses de l'administration est fait pour ça.
-- ════════════════════════════════════════════════════════

-- L'horaire du flagship Zino, tel que sa propre fiche l'annonce.
UPDATE `lounges` SET `hours` = '10h–2h'
 WHERE `id` = 1 AND `country_id` = 'ivorycoast' AND (`hours` IS NULL OR `hours` = '');

-- Les comptes Instagram, sans l'arobase : le front fabrique l'adresse
-- (instagram.com/<compte>), et la garder produisait instagram.com/@nom,
-- qui est une 404.
UPDATE `lounges` SET `instagram` = 'cigarro.ci'
 WHERE `id` IN (4, 5) AND `country_id` = 'ivorycoast'
   AND (`instagram` IS NULL OR `instagram` = '');

UPDATE `lounges` SET `instagram` = 'irokoloungeabidjan'
 WHERE `id` = 8 AND `country_id` = 'ivorycoast'
   AND (`instagram` IS NULL OR `instagram` = '');

UPDATE `lounges` SET `instagram` = 'fagot_cigare'
 WHERE `id` = 11 AND `country_id` = 'ivorycoast'
   AND (`instagram` IS NULL OR `instagram` = '');
