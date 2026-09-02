-- ════════════════════════════════════════════════════════
-- 135 — Les quarante-huit fiches « La Casa del Habano »
-- ────────────────────────────────────────────────────────
-- LE PROBLÈME. Quarante-huit établissements citaient
-- `lcdh-locator.com` comme source. Ce domaine N'EXISTE PAS — il ne
-- résout dans aucun DNS. C'est le plus gros bloc du corpus adossé à une
-- source fabriquée : un dixième des fiches du site.
--
-- La doctrine du projet est « aucune note sans source ». Une source
-- inventée est pire qu'une source absente : elle donne l'apparence de la
-- vérification, et c'est elle qui m'a fait croire ces fiches solides.
--
-- ── CE QUI EST ÉTABLI ────────────────────────────────────
-- La Casa del Habano est le réseau franchisé de Habanos S.A. : il ne
-- vend QUE des habanos, c'est-à-dire des cigares cubains. Or la vente
-- de cigares cubains reste interdite aux États-Unis en 2026 — l'embargo
-- de 1962 n'a jamais été levé, et l'autorisation d'importation
-- personnelle accordée sous Obama a été supprimée le 24 septembre 2020.
--
-- Une Casa del Habano à Chicago ou à Houston NE PEUT PAS EXISTER. Ces
-- deux fiches ne sont pas incomplètes : elles sont fausses.
--
-- ── CE QUI N'EST PAS ÉTABLI ──────────────────────────────
-- Les quarante-six autres. Le réseau compte environ 140 boutiques dans
-- plus de soixante pays, et Vienne, Madrid, Florence, Osaka ou Nairobi
-- sont des marchés plausibles. La liste officielle
-- (lacasadelhabano.com) est derrière un portail d'âge qu'on ne
-- contourne pas, et habanos.com y renvoie sans la reproduire.
--
-- Ne pouvant vérifier, on ne supprime pas : effacer quarante-six
-- adresses probablement réelles pour cause de citation fautive ferait
-- plus de dégâts que le défaut lui-même. On dit ce qu'on sait, et le
-- champ `source` cesse de mentir.
--
-- ── POURQUOI is_verified = 0 ET NON UN DELETE ────────────
-- Le retrait est RÉVERSIBLE. L'application filtre déjà sur ce drapeau,
-- et les pages servies le font depuis aujourd'hui (voir
-- PAGE_FICHE_PUBLIABLE dans backend/pages_lib.php) : les deux fiches
-- disparaissent du site, du plan de site et des compteurs de pays, mais
-- la ligne reste consultable en administration si l'on veut y revenir.
--
--
-- ⚠ LE NOM DU DOMAINE FAUTIF NE FIGURE PAS DANS LE TEXTE DE
-- REMPLACEMENT. Premier jet : il y était, en explication — et
-- tools/sources.php, qui extrait les domaines du texte libre, continuait
-- donc à compter quarante-huit fiches citant un domaine inexistant. Le
-- champ `source` dit ce qu'il en est AUJOURD'HUI ; d'où l'on vient est
-- écrit dans le journal de modération, plus bas.
--
-- ⚠ /cave/419 et /cave/422 rendront 404. C'est la bonne réponse, et
-- Google retirera les deux adresses à son prochain passage.
-- ════════════════════════════════════════════════════════

-- ── Les deux impossibles ─────────────────────────────────
UPDATE `lounges`
   SET `is_verified` = 0,
       `source`      = 'RETIRÉ — La Casa del Habano ne vend que des habanos, dont la vente est interdite aux États-Unis (embargo).',
       `updated_at`  = NOW()
 WHERE `id` IN (419, 422)
   AND `country_id` = 'usa'
   AND `name` LIKE 'La Casa del Habano%';

-- ── Les autres : la source cesse de mentir ───────────────
-- Elles restent publiées. Le champ dit désormais ce qu'il en est :
-- l'établissement appartient vraisemblablement au réseau, et personne
-- ne l'a vérifié contre la liste officielle.
UPDATE `lounges`
   SET `source`     = 'à vérifier — réseau La Casa del Habano, liste officielle non recoupée',
       `updated_at` = NOW()
 WHERE `source` LIKE '%lcdh-locator.com%';

-- ── La trace ─────────────────────────────────────────────
INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL, 'migration 135', 'systeme', 'lounge_retire', 'lounge', 419,
   'La Casa del Habano aux Etats-Unis : impossible (embargo)'),
  (NULL, 'migration 135', 'systeme', 'lounge_retire', 'lounge', 422,
   'La Casa del Habano aux Etats-Unis : impossible (embargo)'),
  (NULL, 'migration 135', 'systeme', 'sources_corrigees', 'lounge', 0,
   '48 fiches citaient lcdh-locator.com, domaine inexistant');
