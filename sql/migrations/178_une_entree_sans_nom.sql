-- ════════════════════════════════════════════════════════
-- 178 — Une entrée sans nom vidait la page de la République dominicaine
-- ────────────────────────────────────────────────────────
-- RÉGRESSION DE MA MIGRATION 175, SIGNALÉE PAR L'UTILISATEUR : sur le
-- globe, cliquer la République dominicaine ouvrait un panneau VIDE.
-- Titre, drapeau et sous-titre s'affichaient ; le corps, non.
--
-- ── LA CAUSE ─────────────────────────────────────────────
-- La 175 devait retirer « Fonseca Dominicain » du tableau JSON
-- `producer_countries.brands`. Elle faisait :
--
--   JSON_REMOVE(brands, JSON_UNQUOTE(JSON_SEARCH(brands,'one',
--               'Fonseca Dominicain', NULL, '$[*].name')))
--
-- JSON_SEARCH avec le chemin `$[*].name` rend « $[23].name ». Passé tel
-- quel à JSON_REMOVE, il supprime LA CLÉ `name`, PAS L'OBJET. Il restait
-- donc une entrée orpheline : {"desc":"MATASA, la manufacture de la
-- famille Quesada","iconic":false}, sans nom.
--
-- Pour retirer l'élément, il fallait ôter le suffixe « .name » du chemin
-- et supprimer « $[23] ». C'est ce que fait cette migration, sur la
-- position réelle plutôt que sur un chemin calculé.
--
-- ── POURQUOI TOUTE LA PAGE, ET PAS UNE VIGNETTE ──────────
-- `brandCard()` fait `b.name.replace(/'/g, "\'")`. Sur une entrée sans
-- `name`, la TypeError interrompt la CONSTRUCTION DU innerHTML — qui
-- est une seule concaténation, du badge de rang jusqu'aux marques. Le
-- panneau restait donc entièrement blanc : production, revenus, récolte,
-- climat, sols, régions, variétés, tabacaleras. Huit blocs justes,
-- emportés par une vignette.
--
-- `assets/js/panels.js` filtre désormais les entrées sans nom. La donnée
-- est réparée ici, mais le filtre reste : une liste de vingt-quatre
-- vignettes ne doit pas pouvoir emporter les huit blocs qui la précèdent.
--
-- ── ET LE CONTRÔLE NE POUVAIT PAS LE VOIR ────────────────
-- coherence_check vérifie que chaque maison de la table `brands` est
-- annoncée par son pays. Il ne regardait pas l'inverse : une entrée du
-- JSON qui ne correspond à aucune maison — ou qui n'a pas de nom du
-- tout. La campagne porte maintenant cette assertion.
-- ════════════════════════════════════════════════════════

UPDATE `producer_countries` p
   SET p.`brands` = (
         SELECT JSON_ARRAYAGG(j.v) FROM (
           SELECT jt.v
             FROM `producer_countries` q,
                  JSON_TABLE(q.`brands`, '$[*]' COLUMNS (v JSON PATH '$')) AS jt
            WHERE q.`id` = 'dominican'
              AND JSON_UNQUOTE(JSON_EXTRACT(jt.v, '$.name')) IS NOT NULL
              AND TRIM(JSON_UNQUOTE(JSON_EXTRACT(jt.v, '$.name'))) <> ''
         ) AS j
       ),
       p.`updated_at` = NOW()
 WHERE p.`id` = 'dominican';

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 178','systeme','regression_corrigee','pays',0,
   'REGRESSION DE MA MIGRATION 175, signalee par l utilisateur : sur le globe, cliquer la Republique dominicaine ouvrait un panneau VIDE. JSON_SEARCH avec le chemin $[*].name rend « $[23].name » ; passe tel quel a JSON_REMOVE, il supprime LA CLE name, PAS L OBJET. Il restait une entree orpheline sans nom'),
  (NULL,'migration 178','systeme','une_vignette_emportait_huit_blocs','systeme',0,
   'brandCard() fait b.name.replace(...). Sur une entree sans name, la TypeError interrompt la CONSTRUCTION du innerHTML — une seule concatenation, du badge de rang jusqu aux marques. Le panneau restait entierement blanc : production, revenus, recolte, climat, sols, regions, varietes, tabacaleras. Huit blocs justes emportes par une vignette. panels.js filtre desormais les entrees sans nom'),
  (NULL,'migration 178','systeme','angle_mort_du_controle','systeme',0,
   'coherence_check verifie que chaque maison de la table brands est annoncee par son pays. Il ne regardait pas l inverse : une entree du JSON sans nom, ou qui ne correspond a aucune maison. La campagne porte maintenant cette assertion');
