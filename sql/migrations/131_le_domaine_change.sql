-- ════════════════════════════════════════════════════════
-- 131 — Le site prend son domaine : thecigarodyssey.com
-- ────────────────────────────────────────────────────────
-- POURQUOI CETTE MIGRATION
--
-- `cigarodyssey.com` était déposé depuis 2016 par quelqu'un d'autre —
-- vérifié auprès du registre, pas supposé. Le domaine retenu est donc
-- `thecigarodyssey.com`. La MARQUE ne change pas : « CigarOdyssey »
-- reste partout. Seule l'adresse bouge.
--
-- La plupart des occurrences vivent dans des fichiers et se corrigent
-- en les éditant. DEUX vivent en base, et c'est pour elles que cette
-- migration existe :
--
--   1. `users.email` du compte « La Régie », qui signe les sujets
--      d'amorce du forum (migration 016). Son hachage de mot de passe
--      est « * » : il ne se connecte jamais, mais son adresse
--      s'affiche et doit être cohérente avec le domaine.
--
--   2. `lounges.source` de 60 établissements, où la valeur est le
--      domaine lui-même — la façon de dire « relevé par nos soins »
--      plutôt que repris d'une source extérieure. Laisser l'ancien
--      domaine y renverrait le lecteur vers un site qui n'est pas le
--      nôtre : c'est une attribution fausse, pas une simple coquille.
--
-- La migration 016 est modifiée EN PARALLÈLE, pour qu'une installation
-- neuve crée directement la bonne adresse. Les deux ne se marchent pas
-- dessus : sur une base neuve, 016 pose déjà la bonne valeur et les
-- clauses WHERE ci-dessous ne trouvent rien.
--
-- Idempotente : rejouée, elle ne trouve plus rien à changer.
-- ════════════════════════════════════════════════════════

UPDATE `users`
   SET `email` = 'regie@thecigarodyssey.com'
 WHERE `email` = 'regie@cigarodyssey.com';

UPDATE `lounges`
   SET `source` = 'thecigarodyssey.com'
 WHERE `source` = 'cigarodyssey.com';
