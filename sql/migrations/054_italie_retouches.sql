-- ════════════════════════════════════════════════════════
-- 054 — Deux retouches que l'Italie a rendues visibles
-- ────────────────────────────────────────────────────────
-- ── 1. LE TOSCANO NE MENAIT PAS À SA FEUILLE ────────────
--
-- La fiche d'une feuille liste les cigares qui la portent. Cette liste
-- n'est pas stockée : elle se dérive des entrées `cape: true` de la
-- fiche du pays (voir action_feuille). Le Toscano était marqué
-- `iconic` mais pas `cape` — sa fiche Kentucky affichait donc « aucun
-- cigare », ce qui est absurde pour un cigare fait tout entier de cette
-- feuille, cape comprise.
--
-- ── 2. UNE GLOSE QUI NE PARLAIT QUE DU RHUM ─────────────
--
-- La famille « spiritueux » vient d'accueillir la grappa. Or sa glose
-- disait « le rhum et le cigare partagent la canne et le fût de
-- chêne » — vrai du rhum, faux de la grappa, qui vient du marc de
-- raisin et ne connaît pas la canne.
--
-- C'est la limite d'une glose écrite d'après son exemple le plus
-- fréquent plutôt que d'après sa famille. Le glossaire est indexé par
-- (famille, contexte) : chaque phrase doit valoir pour TOUT ce que la
-- famille contient, sinon elle ment dès qu'un membre s'y ajoute.
--
-- La nouvelle formulation dit ce que les eaux-de-vie ont en commun —
-- pas de sucre pour arrondir, et le fût quand il y en a un — puis
-- illustre par deux cas au lieu d'un seul.
--
-- Les cinq traductions de cette glose deviennent périmées : le français
-- a changé, et `i18n_fraicheur` le dira. C'est exactement son travail.
-- ════════════════════════════════════════════════════════

UPDATE `producer_countries`
   SET `brands` = '[{"name":"Toscano","desc":"Le cigare né d''un orage florentin en 1815","iconic":true,"cape":true}]'
 WHERE `id` = 'italy';

UPDATE `aromes`
   SET `texte` = 'Une eau-de-vie n''a pas de sucre pour arrondir les angles : elle rencontre le cigare de plain-pied. Le rhum vieux prolonge la fumée, la grappa la tranche.'
 WHERE `famille` = 'spiritueux' AND `contexte` = 'accord';
