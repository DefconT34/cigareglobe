-- ════════════════════════════════════════════════════════
-- 156 — Trente-trois fiches publiées sans la moindre image
-- ────────────────────────────────────────────────────────
-- LE CONSTAT. Sur quatre cent huit fiches publiées, trente-trois n'ont
-- aucune ligne dans `lounge_photos` : ni photographie, ni carte. Sur le
-- site, elles s'affichent sans rien là où les autres montrent quelque
-- chose.
--
-- Ce sont, sans exception, les fiches corrigées ou créées pendant les
-- chantiers 143 à 155 — Bertie, El Fumador, Le Cadre, les deux Canaries,
-- Hong Kong Island, les hôtels ouest-africains gardés sous réserve. Les
-- migrations ont soigné le texte et oublié l'image.
--
-- ── CE QUI EST INSCRIT, ET CE QUI NE L'EST PAS ───────────
-- On n'ajoute pas des photographies : il n'y en a pas. Une seule fiche
-- de tout l'atlas en porte une vraie — la façade du lounge d'Abidjan,
-- prise sur place. Les quatre cent quarante autres images sont des
-- CARTES engendrées, qui portent le nom, la ville et le pays et ne
-- prétendent à rien d'autre.
--
-- Aller chercher des photographies ailleurs sur le Web serait
-- s'approprier le travail de quelqu'un ; en fabriquer serait inventer
-- l'apparence de lieux réels — exactement ce que treize migrations
-- viennent de retirer. Une devanture inventée mentirait mieux qu'une
-- adresse fausse.
--
-- ── LES IDENTIFIANTS SONT ÉCRITS ─────────────────────────
-- 443 à 475, à la suite du dernier existant. Règle posée par la
-- migration 143 : `AUTO_INCREMENT` ne vaut que pour une base, et deux
-- bases finiraient avec deux numérotations pour les mêmes lignes.
--
-- ── ⚠ LES OCTETS NE VOYAGENT PAS AVEC CETTE MIGRATION ────
-- `lounge_photos` est versionnée ; `uploads/` ne l'est pas, et
-- `.cpanel.yml` l'exclut du déploiement. Cette migration pose les
-- LIGNES ; les IMAGES se fabriquent sur place :
--
--   php tools/placeholders.php --tout
--
-- À lancer des deux côtés — sur le poste et sur le serveur. Sans cela,
-- trente-trois fiches pointeraient vers un fichier absent, ce qui est
-- pire que de ne rien pointer.
-- ════════════════════════════════════════════════════════

INSERT INTO `lounge_photos`
  (`id`, `lounge_id`, `filename`, `is_primary`, `is_approved`, `uploaded_by`, `sort_order`, `created_at`)
VALUES
  (443, 2497, 'placeholder_2497.jpg', 1, 1, 'admin', 1, NOW()),
  (444, 2498, 'placeholder_2498.jpg', 1, 1, 'admin', 1, NOW()),
  (445, 2505, 'placeholder_2505.jpg', 1, 1, 'admin', 1, NOW()),
  (446, 2509, 'placeholder_2509.jpg', 1, 1, 'admin', 1, NOW()),
  (447, 2515, 'placeholder_2515.jpg', 1, 1, 'admin', 1, NOW()),
  (448, 2517, 'placeholder_2517.jpg', 1, 1, 'admin', 1, NOW()),
  (449, 2524, 'placeholder_2524.jpg', 1, 1, 'admin', 1, NOW()),
  (450, 2536, 'placeholder_2536.jpg', 1, 1, 'admin', 1, NOW()),
  (451, 2537, 'placeholder_2537.jpg', 1, 1, 'admin', 1, NOW()),
  (452, 2538, 'placeholder_2538.jpg', 1, 1, 'admin', 1, NOW()),
  (453, 2539, 'placeholder_2539.jpg', 1, 1, 'admin', 1, NOW()),
  (454, 2540, 'placeholder_2540.jpg', 1, 1, 'admin', 1, NOW()),
  (455, 2541, 'placeholder_2541.jpg', 1, 1, 'admin', 1, NOW()),
  (456, 2542, 'placeholder_2542.jpg', 1, 1, 'admin', 1, NOW()),
  (457, 2543, 'placeholder_2543.jpg', 1, 1, 'admin', 1, NOW()),
  (458, 2544, 'placeholder_2544.jpg', 1, 1, 'admin', 1, NOW()),
  (459, 2546, 'placeholder_2546.jpg', 1, 1, 'admin', 1, NOW()),
  (460, 2547, 'placeholder_2547.jpg', 1, 1, 'admin', 1, NOW()),
  (461, 2549, 'placeholder_2549.jpg', 1, 1, 'admin', 1, NOW()),
  (462, 2550, 'placeholder_2550.jpg', 1, 1, 'admin', 1, NOW()),
  (463, 2552, 'placeholder_2552.jpg', 1, 1, 'admin', 1, NOW()),
  (464, 2553, 'placeholder_2553.jpg', 1, 1, 'admin', 1, NOW()),
  (465, 2554, 'placeholder_2554.jpg', 1, 1, 'admin', 1, NOW()),
  (466, 2555, 'placeholder_2555.jpg', 1, 1, 'admin', 1, NOW()),
  (467, 2557, 'placeholder_2557.jpg', 1, 1, 'admin', 1, NOW()),
  (468, 2558, 'placeholder_2558.jpg', 1, 1, 'admin', 1, NOW()),
  (469, 2559, 'placeholder_2559.jpg', 1, 1, 'admin', 1, NOW()),
  (470, 2560, 'placeholder_2560.jpg', 1, 1, 'admin', 1, NOW()),
  (471, 2561, 'placeholder_2561.jpg', 1, 1, 'admin', 1, NOW()),
  (472, 2562, 'placeholder_2562.jpg', 1, 1, 'admin', 1, NOW()),
  (473, 2563, 'placeholder_2563.jpg', 1, 1, 'admin', 1, NOW()),
  (474, 2564, 'placeholder_2564.jpg', 1, 1, 'admin', 1, NOW()),
  (475, 2565, 'placeholder_2565.jpg', 1, 1, 'admin', 1, NOW());

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL, 'migration 156', 'systeme', 'images_posees', 'lounge', 0,
   '33 fiches publiees n avaient aucune ligne dans lounge_photos — toutes issues des chantiers 143 a 155. Cartes engendrees, pas des photographies : l atlas n en porte qu une seule vraie, la facade du lounge d Abidjan. Les octets se fabriquent par tools/placeholders.php --tout, des deux cotes.');
