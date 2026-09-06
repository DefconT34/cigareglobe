-- ════════════════════════════════════════════════════════
-- 170 — Tous les drapeaux, restaurés depuis les octets
-- ────────────────────────────────────────────────────────
-- LE CONTRÔLE POSÉ PAR LA 168 A TROUVÉ UN SECOND CAS, ET IL N'EST PAS
-- DE MOI. Sur l'atlas en production, MACAO s'affichait
-- « ???????? Macao » — même signature que le drapeau ivoirien : huit
-- points d'interrogation pour deux indicateurs régionaux de quatre
-- octets chacun.
--
-- En base de développement, la valeur est intacte : F09F87B2F09F87B4,
-- soit 🇲🇴. La corruption est donc ANTÉRIEURE — elle vient d'un
-- déploiement plus ancien, passé par la même commande sans
-- `--default-character-set=utf8mb4`. Personne ne l'avait vue parce que
-- personne ne regardait le drapeau de Macao.
--
-- ── POURQUOI RESTAURER LES CENT VINGT ────────────────────
-- Réparer Macao seul corrigerait l'instance, pas la classe. Rien ne dit
-- qu'un troisième drapeau ne s'est pas abîmé autrement qu'en « ? » — un
-- octet perdu ne laisse pas toujours une trace lisible, et la seule
-- façon d'en être sûr est de reposer la valeur connue.
--
-- Ce n'est pas une réécriture à l'aveugle : c'est un ALIGNEMENT SUR LA
-- SOURCE VERSIONNÉE. La base de développement a elle-même été réalignée
-- depuis sql/contenu.sql, donc depuis la production, et elle ne porte
-- aujourd'hui AUCUN drapeau abîmé — vérifié sur les trois tables. Pour
-- cent dix-neuf lignes sur cent vingt, cette migration ne change rien.
--
-- ── ET AUCUN EMOJI N'EST ÉCRIT ICI ───────────────────────
-- Même raison qu'à la 168 : un fichier qui porterait les caractères
-- repasserait par la connexion fautive et reproduirait la panne. Tout
-- est en hexadécimal ASCII, reconverti côté serveur.
--
-- ⚠ LA COMMANDE, ENCORE :
--   mysql --default-character-set=utf8mb4 -u <user> -p <base> < <fichier>
--
-- Et après, sur le serveur : `php tools/prevol.php` — c'est lui qui a
-- trouvé celui-ci, et c'est lui qui trouvera le suivant.
-- ════════════════════════════════════════════════════════

-- producer_countries
UPDATE `producer_countries` SET `flag` = CONVERT(UNHEX('F09F87A7F09F87B7') USING utf8mb4) WHERE `id` = 'brazil';
UPDATE `producer_countries` SET `flag` = CONVERT(UNHEX('F09F87A8F09F87B2') USING utf8mb4) WHERE `id` = 'cameroon';
UPDATE `producer_countries` SET `flag` = CONVERT(UNHEX('F09F87AAF09F87B8') USING utf8mb4) WHERE `id` = 'canaries';
UPDATE `producer_countries` SET `flag` = CONVERT(UNHEX('F09F87A8F09F87B7') USING utf8mb4) WHERE `id` = 'costarica';
UPDATE `producer_countries` SET `flag` = CONVERT(UNHEX('F09F87A8F09F87BA') USING utf8mb4) WHERE `id` = 'cuba';
UPDATE `producer_countries` SET `flag` = CONVERT(UNHEX('F09F87A9F09F87B4') USING utf8mb4) WHERE `id` = 'dominican';
UPDATE `producer_countries` SET `flag` = CONVERT(UNHEX('F09F87AAF09F87A8') USING utf8mb4) WHERE `id` = 'ecuador';
UPDATE `producer_countries` SET `flag` = CONVERT(UNHEX('F09F87ADF09F87B3') USING utf8mb4) WHERE `id` = 'honduras';
UPDATE `producer_countries` SET `flag` = CONVERT(UNHEX('F09F87AEF09F87A9') USING utf8mb4) WHERE `id` = 'indonesia';
UPDATE `producer_countries` SET `flag` = CONVERT(UNHEX('F09F87AEF09F87B9') USING utf8mb4) WHERE `id` = 'italy';
UPDATE `producer_countries` SET `flag` = CONVERT(UNHEX('F09F87A8F09F87AE') USING utf8mb4) WHERE `id` = 'ivorycoast';
UPDATE `producer_countries` SET `flag` = CONVERT(UNHEX('F09F87AFF09F87B2') USING utf8mb4) WHERE `id` = 'jamaica';
UPDATE `producer_countries` SET `flag` = CONVERT(UNHEX('F09F87B2F09F87BD') USING utf8mb4) WHERE `id` = 'mexico';
UPDATE `producer_countries` SET `flag` = CONVERT(UNHEX('F09F87B3F09F87AE') USING utf8mb4) WHERE `id` = 'nicaragua';
UPDATE `producer_countries` SET `flag` = CONVERT(UNHEX('F09F87B5F09F87A6') USING utf8mb4) WHERE `id` = 'panama';
UPDATE `producer_countries` SET `flag` = CONVERT(UNHEX('F09F87B5F09F87AD') USING utf8mb4) WHERE `id` = 'philippines';
UPDATE `producer_countries` SET `flag` = CONVERT(UNHEX('F09F87BAF09F87B8') USING utf8mb4) WHERE `id` = 'usa';

-- lounge_countries
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87A6F09F87B1') USING utf8mb4) WHERE `id` = 'albania';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87A6F09F87A9') USING utf8mb4) WHERE `id` = 'andorra';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87A6F09F87B7') USING utf8mb4) WHERE `id` = 'argentina';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87A6F09F87B2') USING utf8mb4) WHERE `id` = 'armenia';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87A6F09F87BC') USING utf8mb4) WHERE `id` = 'aruba';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87A6F09F87BA') USING utf8mb4) WHERE `id` = 'australia';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87A6F09F87B9') USING utf8mb4) WHERE `id` = 'austria';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87A6F09F87BF') USING utf8mb4) WHERE `id` = 'azerbaijan';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87A7F09F87AD') USING utf8mb4) WHERE `id` = 'bahrain';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87A7F09F87A7') USING utf8mb4) WHERE `id` = 'barbados';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87A7F09F87AA') USING utf8mb4) WHERE `id` = 'belgium';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87A7F09F87AF') USING utf8mb4) WHERE `id` = 'benin';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87A7F09F87BC') USING utf8mb4) WHERE `id` = 'botswana';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87A7F09F87B7') USING utf8mb4) WHERE `id` = 'brazil';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87A7F09F87AC') USING utf8mb4) WHERE `id` = 'bulgaria';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87A7F09F87AB') USING utf8mb4) WHERE `id` = 'burkina';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B0F09F87AD') USING utf8mb4) WHERE `id` = 'cambodia';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87A8F09F87B2') USING utf8mb4) WHERE `id` = 'cameroon';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87A8F09F87A6') USING utf8mb4) WHERE `id` = 'canada';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B0F09F87BE') USING utf8mb4) WHERE `id` = 'caymanisles';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87A8F09F87B1') USING utf8mb4) WHERE `id` = 'chile';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87A8F09F87B3') USING utf8mb4) WHERE `id` = 'china';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87A8F09F87B4') USING utf8mb4) WHERE `id` = 'colombia';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87A8F09F87B7') USING utf8mb4) WHERE `id` = 'costarica';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87ADF09F87B7') USING utf8mb4) WHERE `id` = 'croatia';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87A8F09F87BA') USING utf8mb4) WHERE `id` = 'cuba';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87A8F09F87BE') USING utf8mb4) WHERE `id` = 'cyprus';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87A8F09F87BF') USING utf8mb4) WHERE `id` = 'czech';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87A9F09F87B4') USING utf8mb4) WHERE `id` = 'dominican';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87AAF09F87A8') USING utf8mb4) WHERE `id` = 'ecuador';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87AAF09F87AC') USING utf8mb4) WHERE `id` = 'egypt';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87AAF09F87B9') USING utf8mb4) WHERE `id` = 'ethiopia';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87ABF09F87B7') USING utf8mb4) WHERE `id` = 'france';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87A9F09F87AA') USING utf8mb4) WHERE `id` = 'germany';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87ACF09F87AD') USING utf8mb4) WHERE `id` = 'ghana';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87ACF09F87AE') USING utf8mb4) WHERE `id` = 'gibraltar';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87ACF09F87B7') USING utf8mb4) WHERE `id` = 'greece';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87ACF09F87B9') USING utf8mb4) WHERE `id` = 'guatemala';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87ACF09F87B3') USING utf8mb4) WHERE `id` = 'guinea';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87ADF09F87B3') USING utf8mb4) WHERE `id` = 'honduras';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87ADF09F87B0') USING utf8mb4) WHERE `id` = 'hongkong';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87AEF09F87B3') USING utf8mb4) WHERE `id` = 'india';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87AEF09F87A9') USING utf8mb4) WHERE `id` = 'indonesia';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87AEF09F87B7') USING utf8mb4) WHERE `id` = 'iran';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87AEF09F87B1') USING utf8mb4) WHERE `id` = 'israel';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87AEF09F87B9') USING utf8mb4) WHERE `id` = 'italy';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87A8F09F87AE') USING utf8mb4) WHERE `id` = 'ivorycoast';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87AFF09F87B2') USING utf8mb4) WHERE `id` = 'jamaica';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87AFF09F87B5') USING utf8mb4) WHERE `id` = 'japan';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B0F09F87AA') USING utf8mb4) WHERE `id` = 'kenya';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B0F09F87BC') USING utf8mb4) WHERE `id` = 'kuwait';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B1F09F87A7') USING utf8mb4) WHERE `id` = 'lebanon';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B1F09F87BA') USING utf8mb4) WHERE `id` = 'luxembourg';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B2F09F87B4') USING utf8mb4) WHERE `id` = 'macau';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B2F09F87BE') USING utf8mb4) WHERE `id` = 'malaysia';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B2F09F87B1') USING utf8mb4) WHERE `id` = 'mali';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B2F09F87BD') USING utf8mb4) WHERE `id` = 'mexico';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B2F09F87A8') USING utf8mb4) WHERE `id` = 'monaco';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B2F09F87A6') USING utf8mb4) WHERE `id` = 'morocco';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B3F09F87B1') USING utf8mb4) WHERE `id` = 'netherlands';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B3F09F87AE') USING utf8mb4) WHERE `id` = 'nicaragua';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B3F09F87AC') USING utf8mb4) WHERE `id` = 'nigeria';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B4F09F87B2') USING utf8mb4) WHERE `id` = 'oman';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B5F09F87A6') USING utf8mb4) WHERE `id` = 'panama';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B5F09F87BE') USING utf8mb4) WHERE `id` = 'paraguay';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B5F09F87AA') USING utf8mb4) WHERE `id` = 'peru';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B5F09F87AD') USING utf8mb4) WHERE `id` = 'philippines';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B5F09F87B1') USING utf8mb4) WHERE `id` = 'poland';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B5F09F87B9') USING utf8mb4) WHERE `id` = 'portugal';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B6F09F87A6') USING utf8mb4) WHERE `id` = 'qatar';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B7F09F87B4') USING utf8mb4) WHERE `id` = 'romania';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B7F09F87BA') USING utf8mb4) WHERE `id` = 'russia';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B8F09F87A6') USING utf8mb4) WHERE `id` = 'saudiarabia';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B8F09F87B3') USING utf8mb4) WHERE `id` = 'senegal';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B7F09F87B8') USING utf8mb4) WHERE `id` = 'serbia';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B8F09F87AC') USING utf8mb4) WHERE `id` = 'singapore';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87BFF09F87A6') USING utf8mb4) WHERE `id` = 'southafrica';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B0F09F87B7') USING utf8mb4) WHERE `id` = 'southkorea';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87AAF09F87B8') USING utf8mb4) WHERE `id` = 'spain';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B0F09F87B3') USING utf8mb4) WHERE `id` = 'stkitts';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B2F09F87AB') USING utf8mb4) WHERE `id` = 'stmartin';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87A8F09F87AD') USING utf8mb4) WHERE `id` = 'switzerland';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B9F09F87BC') USING utf8mb4) WHERE `id` = 'taiwan';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B9F09F87BF') USING utf8mb4) WHERE `id` = 'tanzania';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B9F09F87AD') USING utf8mb4) WHERE `id` = 'thailand';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B9F09F87AC') USING utf8mb4) WHERE `id` = 'togo';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87B9F09F87B7') USING utf8mb4) WHERE `id` = 'turkey';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87A6F09F87AA') USING utf8mb4) WHERE `id` = 'uae';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87ACF09F87A7') USING utf8mb4) WHERE `id` = 'uk';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87BAF09F87A6') USING utf8mb4) WHERE `id` = 'ukraine';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87BAF09F87B8') USING utf8mb4) WHERE `id` = 'usa';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87BBF09F87AA') USING utf8mb4) WHERE `id` = 'venezuela';
UPDATE `lounge_countries` SET `flag` = CONVERT(UNHEX('F09F87BBF09F87B3') USING utf8mb4) WHERE `id` = 'vietnam';

-- markets
UPDATE `markets` SET `flag` = CONVERT(UNHEX('F09F87A8F09F87A6') USING utf8mb4) WHERE `id` = 'canada_mkt';
UPDATE `markets` SET `flag` = CONVERT(UNHEX('F09F87A8F09F87B3') USING utf8mb4) WHERE `id` = 'china_mkt';
UPDATE `markets` SET `flag` = CONVERT(UNHEX('F09F87AAF09F87BA') USING utf8mb4) WHERE `id` = 'eu_mkt';
UPDATE `markets` SET `flag` = CONVERT(UNHEX('F09F87ABF09F87B7') USING utf8mb4) WHERE `id` = 'france_mkt';
UPDATE `markets` SET `flag` = CONVERT(UNHEX('F09F87AFF09F87B5') USING utf8mb4) WHERE `id` = 'japan_mkt';
UPDATE `markets` SET `flag` = CONVERT(UNHEX('F09F87B7F09F87BA') USING utf8mb4) WHERE `id` = 'russia_mkt';
UPDATE `markets` SET `flag` = CONVERT(UNHEX('F09F87A8F09F87AD') USING utf8mb4) WHERE `id` = 'switz_mkt';
UPDATE `markets` SET `flag` = CONVERT(UNHEX('F09F87A6F09F87AA') USING utf8mb4) WHERE `id` = 'uae_mkt';
UPDATE `markets` SET `flag` = CONVERT(UNHEX('F09F87ACF09F87A7') USING utf8mb4) WHERE `id` = 'uk_mkt';
UPDATE `markets` SET `flag` = CONVERT(UNHEX('F09F87BAF09F87B8') USING utf8mb4) WHERE `id` = 'usa_mkt';

INSERT INTO `moderation_log`
  (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES
  (NULL,'migration 170','systeme','second_cas_trouve','pays',0,
   'le controle pose par la 168 a trouve un SECOND drapeau abime, et il n est pas de moi : MACAO s affichait « ???????? Macao » sur l atlas en production, meme signature que le drapeau ivoirien. En developpement la valeur est intacte (F09F87B2F09F87B4) : la corruption vient d un deploiement ANTERIEUR, passe par la meme commande sans --default-character-set=utf8mb4. Personne ne l avait vue parce que personne ne regardait le drapeau de Macao'),
  (NULL,'migration 170','systeme','classe_plutot_qu_instance','pays',0,
   'reparer Macao seul corrigerait l instance, pas la classe : rien ne dit qu un troisieme drapeau ne s est pas abime autrement qu en « ? », et la seule facon d en etre sur est de reposer la valeur connue. Les 120 drapeaux des trois tables sont donc realignes sur la source versionnee — pour 119 lignes sur 120 cette migration ne change rien');
