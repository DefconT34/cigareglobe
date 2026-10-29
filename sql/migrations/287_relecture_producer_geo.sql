-- ════════════════════════════════════════════════════════
-- 287 — Relecture des données générales des pays (producer_geo)
-- ────────────────────────────────────────────────────────
-- Devise, langue et indépendance de 31 pays, cinq langues, relues par
-- expert-traduction (agent). `producer_geo` n'est pas dans le plan de
-- l'exporteur : la migration est écrite à la main, avec la même garde
-- (empreinte du français dans le WHERE). Les années seules (13 « indépendance »)
-- n'ont pas de traduction et restent « machine ».
-- ════════════════════════════════════════════════════════

UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'aruba' AND `champ` = 'currency' AND `lang` = 'en' AND `source_hash` = 'f1c1ccd24907baee370a58b3e198dcb0d9f50595';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'aruba' AND `champ` = 'currency' AND `lang` = 'es' AND `source_hash` = 'f1c1ccd24907baee370a58b3e198dcb0d9f50595';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'aruba' AND `champ` = 'currency' AND `lang` = 'de' AND `source_hash` = 'f1c1ccd24907baee370a58b3e198dcb0d9f50595';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'aruba' AND `champ` = 'currency' AND `lang` = 'zh' AND `source_hash` = 'f1c1ccd24907baee370a58b3e198dcb0d9f50595';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'aruba' AND `champ` = 'currency' AND `lang` = 'ar' AND `source_hash` = 'f1c1ccd24907baee370a58b3e198dcb0d9f50595';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'aruba' AND `champ` = 'language' AND `lang` = 'en' AND `source_hash` = '9dfb164a4b478fa04851c9396e3edaa8e488260b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'aruba' AND `champ` = 'language' AND `lang` = 'es' AND `source_hash` = '9dfb164a4b478fa04851c9396e3edaa8e488260b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'aruba' AND `champ` = 'language' AND `lang` = 'de' AND `source_hash` = '9dfb164a4b478fa04851c9396e3edaa8e488260b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'aruba' AND `champ` = 'language' AND `lang` = 'zh' AND `source_hash` = '9dfb164a4b478fa04851c9396e3edaa8e488260b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'aruba' AND `champ` = 'language' AND `lang` = 'ar' AND `source_hash` = '9dfb164a4b478fa04851c9396e3edaa8e488260b';
UPDATE `producer_geo` SET `independent_en` = 'Part of the Kingdom of the Netherlands since 1986' WHERE `country_id` = 'aruba' AND SHA1(`independent`) = '8bde744a52a35964cfca6381338511db742e88b6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'aruba' AND `champ` = 'independent' AND `lang` = 'en' AND `source_hash` = '8bde744a52a35964cfca6381338511db742e88b6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'aruba' AND `champ` = 'independent' AND `lang` = 'es' AND `source_hash` = '8bde744a52a35964cfca6381338511db742e88b6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'aruba' AND `champ` = 'independent' AND `lang` = 'de' AND `source_hash` = '8bde744a52a35964cfca6381338511db742e88b6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'aruba' AND `champ` = 'independent' AND `lang` = 'zh' AND `source_hash` = '8bde744a52a35964cfca6381338511db742e88b6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'aruba' AND `champ` = 'independent' AND `lang` = 'ar' AND `source_hash` = '8bde744a52a35964cfca6381338511db742e88b6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'azores' AND `champ` = 'currency' AND `lang` = 'en' AND `source_hash` = '34085cff4c62098d3744619fc7e632c98a15ec84';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'azores' AND `champ` = 'currency' AND `lang` = 'es' AND `source_hash` = '34085cff4c62098d3744619fc7e632c98a15ec84';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'azores' AND `champ` = 'currency' AND `lang` = 'de' AND `source_hash` = '34085cff4c62098d3744619fc7e632c98a15ec84';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'azores' AND `champ` = 'currency' AND `lang` = 'zh' AND `source_hash` = '34085cff4c62098d3744619fc7e632c98a15ec84';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'azores' AND `champ` = 'currency' AND `lang` = 'ar' AND `source_hash` = '34085cff4c62098d3744619fc7e632c98a15ec84';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'azores' AND `champ` = 'language' AND `lang` = 'en' AND `source_hash` = 'c5ca5daee04ff719d7ae5fbd6a62dfbb3533c46c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'azores' AND `champ` = 'language' AND `lang` = 'es' AND `source_hash` = 'c5ca5daee04ff719d7ae5fbd6a62dfbb3533c46c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'azores' AND `champ` = 'language' AND `lang` = 'de' AND `source_hash` = 'c5ca5daee04ff719d7ae5fbd6a62dfbb3533c46c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'azores' AND `champ` = 'language' AND `lang` = 'zh' AND `source_hash` = 'c5ca5daee04ff719d7ae5fbd6a62dfbb3533c46c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'azores' AND `champ` = 'language' AND `lang` = 'ar' AND `source_hash` = 'c5ca5daee04ff719d7ae5fbd6a62dfbb3533c46c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'azores' AND `champ` = 'independent' AND `lang` = 'en' AND `source_hash` = '2013afb0855b1cdd1ba2124f1dea7386636f1db5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'azores' AND `champ` = 'independent' AND `lang` = 'es' AND `source_hash` = '2013afb0855b1cdd1ba2124f1dea7386636f1db5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'azores' AND `champ` = 'independent' AND `lang` = 'de' AND `source_hash` = '2013afb0855b1cdd1ba2124f1dea7386636f1db5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'azores' AND `champ` = 'independent' AND `lang` = 'zh' AND `source_hash` = '2013afb0855b1cdd1ba2124f1dea7386636f1db5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'azores' AND `champ` = 'independent' AND `lang` = 'ar' AND `source_hash` = '2013afb0855b1cdd1ba2124f1dea7386636f1db5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'bahamas' AND `champ` = 'currency' AND `lang` = 'en' AND `source_hash` = 'db4da02cf6655842fa0aead8d3e4f16f302a963f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'bahamas' AND `champ` = 'currency' AND `lang` = 'es' AND `source_hash` = 'db4da02cf6655842fa0aead8d3e4f16f302a963f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'bahamas' AND `champ` = 'currency' AND `lang` = 'de' AND `source_hash` = 'db4da02cf6655842fa0aead8d3e4f16f302a963f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'bahamas' AND `champ` = 'currency' AND `lang` = 'zh' AND `source_hash` = 'db4da02cf6655842fa0aead8d3e4f16f302a963f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'bahamas' AND `champ` = 'currency' AND `lang` = 'ar' AND `source_hash` = 'db4da02cf6655842fa0aead8d3e4f16f302a963f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'bahamas' AND `champ` = 'language' AND `lang` = 'en' AND `source_hash` = 'c06595d9433fc1f1794970b196c6b91df2633f8d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'bahamas' AND `champ` = 'language' AND `lang` = 'es' AND `source_hash` = 'c06595d9433fc1f1794970b196c6b91df2633f8d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'bahamas' AND `champ` = 'language' AND `lang` = 'de' AND `source_hash` = 'c06595d9433fc1f1794970b196c6b91df2633f8d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'bahamas' AND `champ` = 'language' AND `lang` = 'zh' AND `source_hash` = 'c06595d9433fc1f1794970b196c6b91df2633f8d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'bahamas' AND `champ` = 'language' AND `lang` = 'ar' AND `source_hash` = 'c06595d9433fc1f1794970b196c6b91df2633f8d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'bahamas' AND `champ` = 'independent' AND `lang` = 'en' AND `source_hash` = '1fec67f992f287a71ab8ef92091603179e770549';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'bahamas' AND `champ` = 'independent' AND `lang` = 'es' AND `source_hash` = '1fec67f992f287a71ab8ef92091603179e770549';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'bahamas' AND `champ` = 'independent' AND `lang` = 'de' AND `source_hash` = '1fec67f992f287a71ab8ef92091603179e770549';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'bahamas' AND `champ` = 'independent' AND `lang` = 'zh' AND `source_hash` = '1fec67f992f287a71ab8ef92091603179e770549';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'bahamas' AND `champ` = 'independent' AND `lang` = 'ar' AND `source_hash` = '1fec67f992f287a71ab8ef92091603179e770549';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'brazil' AND `champ` = 'currency' AND `lang` = 'en' AND `source_hash` = '8487e125f22ab65d9beb85a56aadd5712787bfb9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'brazil' AND `champ` = 'currency' AND `lang` = 'es' AND `source_hash` = '8487e125f22ab65d9beb85a56aadd5712787bfb9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'brazil' AND `champ` = 'currency' AND `lang` = 'de' AND `source_hash` = '8487e125f22ab65d9beb85a56aadd5712787bfb9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'brazil' AND `champ` = 'currency' AND `lang` = 'zh' AND `source_hash` = '8487e125f22ab65d9beb85a56aadd5712787bfb9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'brazil' AND `champ` = 'currency' AND `lang` = 'ar' AND `source_hash` = '8487e125f22ab65d9beb85a56aadd5712787bfb9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'brazil' AND `champ` = 'language' AND `lang` = 'en' AND `source_hash` = 'c5ca5daee04ff719d7ae5fbd6a62dfbb3533c46c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'brazil' AND `champ` = 'language' AND `lang` = 'es' AND `source_hash` = 'c5ca5daee04ff719d7ae5fbd6a62dfbb3533c46c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'brazil' AND `champ` = 'language' AND `lang` = 'de' AND `source_hash` = 'c5ca5daee04ff719d7ae5fbd6a62dfbb3533c46c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'brazil' AND `champ` = 'language' AND `lang` = 'zh' AND `source_hash` = 'c5ca5daee04ff719d7ae5fbd6a62dfbb3533c46c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'brazil' AND `champ` = 'language' AND `lang` = 'ar' AND `source_hash` = 'c5ca5daee04ff719d7ae5fbd6a62dfbb3533c46c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'cameroon' AND `champ` = 'currency' AND `lang` = 'en' AND `source_hash` = '69558f452767d7488e94f52e37073a73f4f6e13e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'cameroon' AND `champ` = 'currency' AND `lang` = 'es' AND `source_hash` = '69558f452767d7488e94f52e37073a73f4f6e13e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'cameroon' AND `champ` = 'currency' AND `lang` = 'de' AND `source_hash` = '69558f452767d7488e94f52e37073a73f4f6e13e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'cameroon' AND `champ` = 'currency' AND `lang` = 'zh' AND `source_hash` = '69558f452767d7488e94f52e37073a73f4f6e13e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'cameroon' AND `champ` = 'currency' AND `lang` = 'ar' AND `source_hash` = '69558f452767d7488e94f52e37073a73f4f6e13e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'cameroon' AND `champ` = 'language' AND `lang` = 'en' AND `source_hash` = '7a172db6fd87565e6b2068a625ef363290a79a76';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'cameroon' AND `champ` = 'language' AND `lang` = 'es' AND `source_hash` = '7a172db6fd87565e6b2068a625ef363290a79a76';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'cameroon' AND `champ` = 'language' AND `lang` = 'de' AND `source_hash` = '7a172db6fd87565e6b2068a625ef363290a79a76';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'cameroon' AND `champ` = 'language' AND `lang` = 'zh' AND `source_hash` = '7a172db6fd87565e6b2068a625ef363290a79a76';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'cameroon' AND `champ` = 'language' AND `lang` = 'ar' AND `source_hash` = '7a172db6fd87565e6b2068a625ef363290a79a76';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'canaries' AND `champ` = 'currency' AND `lang` = 'en' AND `source_hash` = '34085cff4c62098d3744619fc7e632c98a15ec84';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'canaries' AND `champ` = 'currency' AND `lang` = 'es' AND `source_hash` = '34085cff4c62098d3744619fc7e632c98a15ec84';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'canaries' AND `champ` = 'currency' AND `lang` = 'de' AND `source_hash` = '34085cff4c62098d3744619fc7e632c98a15ec84';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'canaries' AND `champ` = 'currency' AND `lang` = 'zh' AND `source_hash` = '34085cff4c62098d3744619fc7e632c98a15ec84';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'canaries' AND `champ` = 'currency' AND `lang` = 'ar' AND `source_hash` = '34085cff4c62098d3744619fc7e632c98a15ec84';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'canaries' AND `champ` = 'language' AND `lang` = 'en' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'canaries' AND `champ` = 'language' AND `lang` = 'es' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'canaries' AND `champ` = 'language' AND `lang` = 'de' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'canaries' AND `champ` = 'language' AND `lang` = 'zh' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'canaries' AND `champ` = 'language' AND `lang` = 'ar' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'canaries' AND `champ` = 'independent' AND `lang` = 'en' AND `source_hash` = '13972d70feeb128fd66f08a7f8d9bfa837e74f81';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'canaries' AND `champ` = 'independent' AND `lang` = 'es' AND `source_hash` = '13972d70feeb128fd66f08a7f8d9bfa837e74f81';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'canaries' AND `champ` = 'independent' AND `lang` = 'de' AND `source_hash` = '13972d70feeb128fd66f08a7f8d9bfa837e74f81';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'canaries' AND `champ` = 'independent' AND `lang` = 'zh' AND `source_hash` = '13972d70feeb128fd66f08a7f8d9bfa837e74f81';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'canaries' AND `champ` = 'independent' AND `lang` = 'ar' AND `source_hash` = '13972d70feeb128fd66f08a7f8d9bfa837e74f81';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'china' AND `champ` = 'currency' AND `lang` = 'en' AND `source_hash` = '403362489b3353746130912dcdbf2f028fef4465';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'china' AND `champ` = 'currency' AND `lang` = 'es' AND `source_hash` = '403362489b3353746130912dcdbf2f028fef4465';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'china' AND `champ` = 'currency' AND `lang` = 'de' AND `source_hash` = '403362489b3353746130912dcdbf2f028fef4465';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'china' AND `champ` = 'currency' AND `lang` = 'zh' AND `source_hash` = '403362489b3353746130912dcdbf2f028fef4465';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'china' AND `champ` = 'currency' AND `lang` = 'ar' AND `source_hash` = '403362489b3353746130912dcdbf2f028fef4465';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'china' AND `champ` = 'language' AND `lang` = 'en' AND `source_hash` = 'f26af9184bdef42566d132401aa2a9774799ae56';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'china' AND `champ` = 'language' AND `lang` = 'es' AND `source_hash` = 'f26af9184bdef42566d132401aa2a9774799ae56';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'china' AND `champ` = 'language' AND `lang` = 'de' AND `source_hash` = 'f26af9184bdef42566d132401aa2a9774799ae56';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'china' AND `champ` = 'language' AND `lang` = 'zh' AND `source_hash` = 'f26af9184bdef42566d132401aa2a9774799ae56';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'china' AND `champ` = 'language' AND `lang` = 'ar' AND `source_hash` = 'f26af9184bdef42566d132401aa2a9774799ae56';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'china' AND `champ` = 'independent' AND `lang` = 'en' AND `source_hash` = '962d0170375ba25b578df811e9563db3322c4e8c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'china' AND `champ` = 'independent' AND `lang` = 'es' AND `source_hash` = '962d0170375ba25b578df811e9563db3322c4e8c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'china' AND `champ` = 'independent' AND `lang` = 'de' AND `source_hash` = '962d0170375ba25b578df811e9563db3322c4e8c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'china' AND `champ` = 'independent' AND `lang` = 'zh' AND `source_hash` = '962d0170375ba25b578df811e9563db3322c4e8c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'china' AND `champ` = 'independent' AND `lang` = 'ar' AND `source_hash` = '962d0170375ba25b578df811e9563db3322c4e8c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'colombia' AND `champ` = 'currency' AND `lang` = 'en' AND `source_hash` = 'c4cdfa2f4b5f613fd26a7222a7f55738af0c010b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'colombia' AND `champ` = 'currency' AND `lang` = 'es' AND `source_hash` = 'c4cdfa2f4b5f613fd26a7222a7f55738af0c010b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'colombia' AND `champ` = 'currency' AND `lang` = 'de' AND `source_hash` = 'c4cdfa2f4b5f613fd26a7222a7f55738af0c010b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'colombia' AND `champ` = 'currency' AND `lang` = 'zh' AND `source_hash` = 'c4cdfa2f4b5f613fd26a7222a7f55738af0c010b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'colombia' AND `champ` = 'currency' AND `lang` = 'ar' AND `source_hash` = 'c4cdfa2f4b5f613fd26a7222a7f55738af0c010b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'colombia' AND `champ` = 'language' AND `lang` = 'en' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'colombia' AND `champ` = 'language' AND `lang` = 'es' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'colombia' AND `champ` = 'language' AND `lang` = 'de' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'colombia' AND `champ` = 'language' AND `lang` = 'zh' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'colombia' AND `champ` = 'language' AND `lang` = 'ar' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'colombia' AND `champ` = 'independent' AND `lang` = 'en' AND `source_hash` = '2a7e1d11108c71331f3f9b7dafc28dfac437aa54';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'colombia' AND `champ` = 'independent' AND `lang` = 'es' AND `source_hash` = '2a7e1d11108c71331f3f9b7dafc28dfac437aa54';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'colombia' AND `champ` = 'independent' AND `lang` = 'de' AND `source_hash` = '2a7e1d11108c71331f3f9b7dafc28dfac437aa54';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'colombia' AND `champ` = 'independent' AND `lang` = 'zh' AND `source_hash` = '2a7e1d11108c71331f3f9b7dafc28dfac437aa54';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'colombia' AND `champ` = 'independent' AND `lang` = 'ar' AND `source_hash` = '2a7e1d11108c71331f3f9b7dafc28dfac437aa54';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'costarica' AND `champ` = 'currency' AND `lang` = 'en' AND `source_hash` = 'a7a218cc1d358cda19655ffe5f6bf68d4670c7a1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'costarica' AND `champ` = 'currency' AND `lang` = 'es' AND `source_hash` = 'a7a218cc1d358cda19655ffe5f6bf68d4670c7a1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'costarica' AND `champ` = 'currency' AND `lang` = 'de' AND `source_hash` = 'a7a218cc1d358cda19655ffe5f6bf68d4670c7a1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'costarica' AND `champ` = 'currency' AND `lang` = 'zh' AND `source_hash` = 'a7a218cc1d358cda19655ffe5f6bf68d4670c7a1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'costarica' AND `champ` = 'currency' AND `lang` = 'ar' AND `source_hash` = 'a7a218cc1d358cda19655ffe5f6bf68d4670c7a1';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'costarica' AND `champ` = 'language' AND `lang` = 'en' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'costarica' AND `champ` = 'language' AND `lang` = 'es' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'costarica' AND `champ` = 'language' AND `lang` = 'de' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'costarica' AND `champ` = 'language' AND `lang` = 'zh' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'costarica' AND `champ` = 'language' AND `lang` = 'ar' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'cuba' AND `champ` = 'currency' AND `lang` = 'en' AND `source_hash` = '3d07c2b94cf616d637e0c72582ca3541279491dc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'cuba' AND `champ` = 'currency' AND `lang` = 'es' AND `source_hash` = '3d07c2b94cf616d637e0c72582ca3541279491dc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'cuba' AND `champ` = 'currency' AND `lang` = 'de' AND `source_hash` = '3d07c2b94cf616d637e0c72582ca3541279491dc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'cuba' AND `champ` = 'currency' AND `lang` = 'zh' AND `source_hash` = '3d07c2b94cf616d637e0c72582ca3541279491dc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'cuba' AND `champ` = 'currency' AND `lang` = 'ar' AND `source_hash` = '3d07c2b94cf616d637e0c72582ca3541279491dc';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'cuba' AND `champ` = 'language' AND `lang` = 'en' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'cuba' AND `champ` = 'language' AND `lang` = 'es' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'cuba' AND `champ` = 'language' AND `lang` = 'de' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'cuba' AND `champ` = 'language' AND `lang` = 'zh' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'cuba' AND `champ` = 'language' AND `lang` = 'ar' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'cuba' AND `champ` = 'independent' AND `lang` = 'en' AND `source_hash` = '8847050d53b5d11963d8aa8544228aa7064be165';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'cuba' AND `champ` = 'independent' AND `lang` = 'es' AND `source_hash` = '8847050d53b5d11963d8aa8544228aa7064be165';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'cuba' AND `champ` = 'independent' AND `lang` = 'de' AND `source_hash` = '8847050d53b5d11963d8aa8544228aa7064be165';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'cuba' AND `champ` = 'independent' AND `lang` = 'zh' AND `source_hash` = '8847050d53b5d11963d8aa8544228aa7064be165';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'cuba' AND `champ` = 'independent' AND `lang` = 'ar' AND `source_hash` = '8847050d53b5d11963d8aa8544228aa7064be165';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'dominican' AND `champ` = 'currency' AND `lang` = 'en' AND `source_hash` = '37a551f65ac2dc480d6bc46347e845e3137713be';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'dominican' AND `champ` = 'currency' AND `lang` = 'es' AND `source_hash` = '37a551f65ac2dc480d6bc46347e845e3137713be';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'dominican' AND `champ` = 'currency' AND `lang` = 'de' AND `source_hash` = '37a551f65ac2dc480d6bc46347e845e3137713be';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'dominican' AND `champ` = 'currency' AND `lang` = 'zh' AND `source_hash` = '37a551f65ac2dc480d6bc46347e845e3137713be';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'dominican' AND `champ` = 'currency' AND `lang` = 'ar' AND `source_hash` = '37a551f65ac2dc480d6bc46347e845e3137713be';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'dominican' AND `champ` = 'language' AND `lang` = 'en' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'dominican' AND `champ` = 'language' AND `lang` = 'es' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'dominican' AND `champ` = 'language' AND `lang` = 'de' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'dominican' AND `champ` = 'language' AND `lang` = 'zh' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'dominican' AND `champ` = 'language' AND `lang` = 'ar' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'ecuador' AND `champ` = 'currency' AND `lang` = 'en' AND `source_hash` = '8e6858f66ca4d79fbd52d9846c44b036e13de836';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'ecuador' AND `champ` = 'currency' AND `lang` = 'es' AND `source_hash` = '8e6858f66ca4d79fbd52d9846c44b036e13de836';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'ecuador' AND `champ` = 'currency' AND `lang` = 'de' AND `source_hash` = '8e6858f66ca4d79fbd52d9846c44b036e13de836';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'ecuador' AND `champ` = 'currency' AND `lang` = 'zh' AND `source_hash` = '8e6858f66ca4d79fbd52d9846c44b036e13de836';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'ecuador' AND `champ` = 'currency' AND `lang` = 'ar' AND `source_hash` = '8e6858f66ca4d79fbd52d9846c44b036e13de836';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'ecuador' AND `champ` = 'language' AND `lang` = 'en' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'ecuador' AND `champ` = 'language' AND `lang` = 'es' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'ecuador' AND `champ` = 'language' AND `lang` = 'de' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'ecuador' AND `champ` = 'language' AND `lang` = 'zh' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'ecuador' AND `champ` = 'language' AND `lang` = 'ar' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'ecuador' AND `champ` = 'independent' AND `lang` = 'en' AND `source_hash` = 'd4db66371ee6cdfbab53947fcb6e6fe17cb628dd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'ecuador' AND `champ` = 'independent' AND `lang` = 'es' AND `source_hash` = 'd4db66371ee6cdfbab53947fcb6e6fe17cb628dd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'ecuador' AND `champ` = 'independent' AND `lang` = 'de' AND `source_hash` = 'd4db66371ee6cdfbab53947fcb6e6fe17cb628dd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'ecuador' AND `champ` = 'independent' AND `lang` = 'zh' AND `source_hash` = 'd4db66371ee6cdfbab53947fcb6e6fe17cb628dd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'ecuador' AND `champ` = 'independent' AND `lang` = 'ar' AND `source_hash` = 'd4db66371ee6cdfbab53947fcb6e6fe17cb628dd';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'germany' AND `champ` = 'currency' AND `lang` = 'en' AND `source_hash` = '34085cff4c62098d3744619fc7e632c98a15ec84';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'germany' AND `champ` = 'currency' AND `lang` = 'es' AND `source_hash` = '34085cff4c62098d3744619fc7e632c98a15ec84';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'germany' AND `champ` = 'currency' AND `lang` = 'de' AND `source_hash` = '34085cff4c62098d3744619fc7e632c98a15ec84';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'germany' AND `champ` = 'currency' AND `lang` = 'zh' AND `source_hash` = '34085cff4c62098d3744619fc7e632c98a15ec84';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'germany' AND `champ` = 'currency' AND `lang` = 'ar' AND `source_hash` = '34085cff4c62098d3744619fc7e632c98a15ec84';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'germany' AND `champ` = 'language' AND `lang` = 'en' AND `source_hash` = 'f1dbd9162d9bcb6184f931e9b016d5db679baed0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'germany' AND `champ` = 'language' AND `lang` = 'es' AND `source_hash` = 'f1dbd9162d9bcb6184f931e9b016d5db679baed0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'germany' AND `champ` = 'language' AND `lang` = 'de' AND `source_hash` = 'f1dbd9162d9bcb6184f931e9b016d5db679baed0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'germany' AND `champ` = 'language' AND `lang` = 'zh' AND `source_hash` = 'f1dbd9162d9bcb6184f931e9b016d5db679baed0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'germany' AND `champ` = 'language' AND `lang` = 'ar' AND `source_hash` = 'f1dbd9162d9bcb6184f931e9b016d5db679baed0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'germany' AND `champ` = 'independent' AND `lang` = 'en' AND `source_hash` = 'a0131c71849d0492241c8001367cbaba6dbf42a8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'germany' AND `champ` = 'independent' AND `lang` = 'es' AND `source_hash` = 'a0131c71849d0492241c8001367cbaba6dbf42a8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'germany' AND `champ` = 'independent' AND `lang` = 'de' AND `source_hash` = 'a0131c71849d0492241c8001367cbaba6dbf42a8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'germany' AND `champ` = 'independent' AND `lang` = 'zh' AND `source_hash` = 'a0131c71849d0492241c8001367cbaba6dbf42a8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'germany' AND `champ` = 'independent' AND `lang` = 'ar' AND `source_hash` = 'a0131c71849d0492241c8001367cbaba6dbf42a8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'haiti' AND `champ` = 'currency' AND `lang` = 'en' AND `source_hash` = '2cfb6fd927d3df020313d19ef306e7fe9d77d3eb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'haiti' AND `champ` = 'currency' AND `lang` = 'es' AND `source_hash` = '2cfb6fd927d3df020313d19ef306e7fe9d77d3eb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'haiti' AND `champ` = 'currency' AND `lang` = 'de' AND `source_hash` = '2cfb6fd927d3df020313d19ef306e7fe9d77d3eb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'haiti' AND `champ` = 'currency' AND `lang` = 'zh' AND `source_hash` = '2cfb6fd927d3df020313d19ef306e7fe9d77d3eb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'haiti' AND `champ` = 'currency' AND `lang` = 'ar' AND `source_hash` = '2cfb6fd927d3df020313d19ef306e7fe9d77d3eb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'haiti' AND `champ` = 'language' AND `lang` = 'en' AND `source_hash` = 'c8778b2b54855be91cf819c60792e346855890cf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'haiti' AND `champ` = 'language' AND `lang` = 'es' AND `source_hash` = 'c8778b2b54855be91cf819c60792e346855890cf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'haiti' AND `champ` = 'language' AND `lang` = 'de' AND `source_hash` = 'c8778b2b54855be91cf819c60792e346855890cf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'haiti' AND `champ` = 'language' AND `lang` = 'zh' AND `source_hash` = 'c8778b2b54855be91cf819c60792e346855890cf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'haiti' AND `champ` = 'language' AND `lang` = 'ar' AND `source_hash` = 'c8778b2b54855be91cf819c60792e346855890cf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'haiti' AND `champ` = 'independent' AND `lang` = 'en' AND `source_hash` = '5d993ff22ed78d540e09a79be05be87a26beda6b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'haiti' AND `champ` = 'independent' AND `lang` = 'es' AND `source_hash` = '5d993ff22ed78d540e09a79be05be87a26beda6b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'haiti' AND `champ` = 'independent' AND `lang` = 'de' AND `source_hash` = '5d993ff22ed78d540e09a79be05be87a26beda6b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'haiti' AND `champ` = 'independent' AND `lang` = 'zh' AND `source_hash` = '5d993ff22ed78d540e09a79be05be87a26beda6b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'haiti' AND `champ` = 'independent' AND `lang` = 'ar' AND `source_hash` = '5d993ff22ed78d540e09a79be05be87a26beda6b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'honduras' AND `champ` = 'currency' AND `lang` = 'en' AND `source_hash` = 'a26e62cd4cabf32e4dd6ac591575fb601b4db546';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'honduras' AND `champ` = 'currency' AND `lang` = 'es' AND `source_hash` = 'a26e62cd4cabf32e4dd6ac591575fb601b4db546';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'honduras' AND `champ` = 'currency' AND `lang` = 'de' AND `source_hash` = 'a26e62cd4cabf32e4dd6ac591575fb601b4db546';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'honduras' AND `champ` = 'currency' AND `lang` = 'zh' AND `source_hash` = 'a26e62cd4cabf32e4dd6ac591575fb601b4db546';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'honduras' AND `champ` = 'currency' AND `lang` = 'ar' AND `source_hash` = 'a26e62cd4cabf32e4dd6ac591575fb601b4db546';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'honduras' AND `champ` = 'language' AND `lang` = 'en' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'honduras' AND `champ` = 'language' AND `lang` = 'es' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'honduras' AND `champ` = 'language' AND `lang` = 'de' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'honduras' AND `champ` = 'language' AND `lang` = 'zh' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'honduras' AND `champ` = 'language' AND `lang` = 'ar' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'indonesia' AND `champ` = 'currency' AND `lang` = 'en' AND `source_hash` = 'dfc6c20c32bd6ba0e0f9a11f48692d5017ebfd3e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'indonesia' AND `champ` = 'currency' AND `lang` = 'es' AND `source_hash` = 'dfc6c20c32bd6ba0e0f9a11f48692d5017ebfd3e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'indonesia' AND `champ` = 'currency' AND `lang` = 'de' AND `source_hash` = 'dfc6c20c32bd6ba0e0f9a11f48692d5017ebfd3e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'indonesia' AND `champ` = 'currency' AND `lang` = 'zh' AND `source_hash` = 'dfc6c20c32bd6ba0e0f9a11f48692d5017ebfd3e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'indonesia' AND `champ` = 'currency' AND `lang` = 'ar' AND `source_hash` = 'dfc6c20c32bd6ba0e0f9a11f48692d5017ebfd3e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'indonesia' AND `champ` = 'language' AND `lang` = 'en' AND `source_hash` = '982943d1a1a6e457e26e40d41c19537f9776f899';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'indonesia' AND `champ` = 'language' AND `lang` = 'es' AND `source_hash` = '982943d1a1a6e457e26e40d41c19537f9776f899';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'indonesia' AND `champ` = 'language' AND `lang` = 'de' AND `source_hash` = '982943d1a1a6e457e26e40d41c19537f9776f899';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'indonesia' AND `champ` = 'language' AND `lang` = 'zh' AND `source_hash` = '982943d1a1a6e457e26e40d41c19537f9776f899';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'indonesia' AND `champ` = 'language' AND `lang` = 'ar' AND `source_hash` = '982943d1a1a6e457e26e40d41c19537f9776f899';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'italy' AND `champ` = 'currency' AND `lang` = 'en' AND `source_hash` = '34085cff4c62098d3744619fc7e632c98a15ec84';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'italy' AND `champ` = 'currency' AND `lang` = 'es' AND `source_hash` = '34085cff4c62098d3744619fc7e632c98a15ec84';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'italy' AND `champ` = 'currency' AND `lang` = 'de' AND `source_hash` = '34085cff4c62098d3744619fc7e632c98a15ec84';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'italy' AND `champ` = 'currency' AND `lang` = 'zh' AND `source_hash` = '34085cff4c62098d3744619fc7e632c98a15ec84';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'italy' AND `champ` = 'currency' AND `lang` = 'ar' AND `source_hash` = '34085cff4c62098d3744619fc7e632c98a15ec84';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'italy' AND `champ` = 'language' AND `lang` = 'en' AND `source_hash` = '1a2387f84d4b90cad1e50e257e063d1f8dbf2f8f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'italy' AND `champ` = 'language' AND `lang` = 'es' AND `source_hash` = '1a2387f84d4b90cad1e50e257e063d1f8dbf2f8f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'italy' AND `champ` = 'language' AND `lang` = 'de' AND `source_hash` = '1a2387f84d4b90cad1e50e257e063d1f8dbf2f8f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'italy' AND `champ` = 'language' AND `lang` = 'zh' AND `source_hash` = '1a2387f84d4b90cad1e50e257e063d1f8dbf2f8f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'italy' AND `champ` = 'language' AND `lang` = 'ar' AND `source_hash` = '1a2387f84d4b90cad1e50e257e063d1f8dbf2f8f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'ivorycoast' AND `champ` = 'currency' AND `lang` = 'en' AND `source_hash` = 'baf3562005f2ca4af6ff5efc23c79c337d9b315b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'ivorycoast' AND `champ` = 'currency' AND `lang` = 'es' AND `source_hash` = 'baf3562005f2ca4af6ff5efc23c79c337d9b315b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'ivorycoast' AND `champ` = 'currency' AND `lang` = 'de' AND `source_hash` = 'baf3562005f2ca4af6ff5efc23c79c337d9b315b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'ivorycoast' AND `champ` = 'currency' AND `lang` = 'zh' AND `source_hash` = 'baf3562005f2ca4af6ff5efc23c79c337d9b315b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'ivorycoast' AND `champ` = 'currency' AND `lang` = 'ar' AND `source_hash` = 'baf3562005f2ca4af6ff5efc23c79c337d9b315b';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'ivorycoast' AND `champ` = 'language' AND `lang` = 'en' AND `source_hash` = '2ca514ebd7c3a61fe53823a0785c326287c4ede8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'ivorycoast' AND `champ` = 'language' AND `lang` = 'es' AND `source_hash` = '2ca514ebd7c3a61fe53823a0785c326287c4ede8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'ivorycoast' AND `champ` = 'language' AND `lang` = 'de' AND `source_hash` = '2ca514ebd7c3a61fe53823a0785c326287c4ede8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'ivorycoast' AND `champ` = 'language' AND `lang` = 'zh' AND `source_hash` = '2ca514ebd7c3a61fe53823a0785c326287c4ede8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'ivorycoast' AND `champ` = 'language' AND `lang` = 'ar' AND `source_hash` = '2ca514ebd7c3a61fe53823a0785c326287c4ede8';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'jamaica' AND `champ` = 'currency' AND `lang` = 'en' AND `source_hash` = 'ca2b3a9d0e13f54a5854cb2d058ca202c597c27f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'jamaica' AND `champ` = 'currency' AND `lang` = 'es' AND `source_hash` = 'ca2b3a9d0e13f54a5854cb2d058ca202c597c27f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'jamaica' AND `champ` = 'currency' AND `lang` = 'de' AND `source_hash` = 'ca2b3a9d0e13f54a5854cb2d058ca202c597c27f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'jamaica' AND `champ` = 'currency' AND `lang` = 'zh' AND `source_hash` = 'ca2b3a9d0e13f54a5854cb2d058ca202c597c27f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'jamaica' AND `champ` = 'currency' AND `lang` = 'ar' AND `source_hash` = 'ca2b3a9d0e13f54a5854cb2d058ca202c597c27f';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'jamaica' AND `champ` = 'language' AND `lang` = 'en' AND `source_hash` = 'c06595d9433fc1f1794970b196c6b91df2633f8d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'jamaica' AND `champ` = 'language' AND `lang` = 'es' AND `source_hash` = 'c06595d9433fc1f1794970b196c6b91df2633f8d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'jamaica' AND `champ` = 'language' AND `lang` = 'de' AND `source_hash` = 'c06595d9433fc1f1794970b196c6b91df2633f8d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'jamaica' AND `champ` = 'language' AND `lang` = 'zh' AND `source_hash` = 'c06595d9433fc1f1794970b196c6b91df2633f8d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'jamaica' AND `champ` = 'language' AND `lang` = 'ar' AND `source_hash` = 'c06595d9433fc1f1794970b196c6b91df2633f8d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'mexico' AND `champ` = 'currency' AND `lang` = 'en' AND `source_hash` = 'c2f989c220ae04b1045191712f04ddcd550ea523';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'mexico' AND `champ` = 'currency' AND `lang` = 'es' AND `source_hash` = 'c2f989c220ae04b1045191712f04ddcd550ea523';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'mexico' AND `champ` = 'currency' AND `lang` = 'de' AND `source_hash` = 'c2f989c220ae04b1045191712f04ddcd550ea523';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'mexico' AND `champ` = 'currency' AND `lang` = 'zh' AND `source_hash` = 'c2f989c220ae04b1045191712f04ddcd550ea523';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'mexico' AND `champ` = 'currency' AND `lang` = 'ar' AND `source_hash` = 'c2f989c220ae04b1045191712f04ddcd550ea523';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'mexico' AND `champ` = 'language' AND `lang` = 'en' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'mexico' AND `champ` = 'language' AND `lang` = 'es' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'mexico' AND `champ` = 'language' AND `lang` = 'de' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'mexico' AND `champ` = 'language' AND `lang` = 'zh' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'mexico' AND `champ` = 'language' AND `lang` = 'ar' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'mexico' AND `champ` = 'independent' AND `lang` = 'en' AND `source_hash` = 'c6a42af42afd0a8ffa665b9b8a35543572968c09';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'mexico' AND `champ` = 'independent' AND `lang` = 'es' AND `source_hash` = 'c6a42af42afd0a8ffa665b9b8a35543572968c09';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'mexico' AND `champ` = 'independent' AND `lang` = 'de' AND `source_hash` = 'c6a42af42afd0a8ffa665b9b8a35543572968c09';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'mexico' AND `champ` = 'independent' AND `lang` = 'zh' AND `source_hash` = 'c6a42af42afd0a8ffa665b9b8a35543572968c09';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'mexico' AND `champ` = 'independent' AND `lang` = 'ar' AND `source_hash` = 'c6a42af42afd0a8ffa665b9b8a35543572968c09';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'mozambique' AND `champ` = 'currency' AND `lang` = 'en' AND `source_hash` = '8275fe8ecc0bc458c661f053c6e99dc04894a8c9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'mozambique' AND `champ` = 'currency' AND `lang` = 'es' AND `source_hash` = '8275fe8ecc0bc458c661f053c6e99dc04894a8c9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'mozambique' AND `champ` = 'currency' AND `lang` = 'de' AND `source_hash` = '8275fe8ecc0bc458c661f053c6e99dc04894a8c9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'mozambique' AND `champ` = 'currency' AND `lang` = 'zh' AND `source_hash` = '8275fe8ecc0bc458c661f053c6e99dc04894a8c9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'mozambique' AND `champ` = 'currency' AND `lang` = 'ar' AND `source_hash` = '8275fe8ecc0bc458c661f053c6e99dc04894a8c9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'mozambique' AND `champ` = 'language' AND `lang` = 'en' AND `source_hash` = 'c5ca5daee04ff719d7ae5fbd6a62dfbb3533c46c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'mozambique' AND `champ` = 'language' AND `lang` = 'es' AND `source_hash` = 'c5ca5daee04ff719d7ae5fbd6a62dfbb3533c46c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'mozambique' AND `champ` = 'language' AND `lang` = 'de' AND `source_hash` = 'c5ca5daee04ff719d7ae5fbd6a62dfbb3533c46c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'mozambique' AND `champ` = 'language' AND `lang` = 'zh' AND `source_hash` = 'c5ca5daee04ff719d7ae5fbd6a62dfbb3533c46c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'mozambique' AND `champ` = 'language' AND `lang` = 'ar' AND `source_hash` = 'c5ca5daee04ff719d7ae5fbd6a62dfbb3533c46c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'netherlands' AND `champ` = 'currency' AND `lang` = 'en' AND `source_hash` = '34085cff4c62098d3744619fc7e632c98a15ec84';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'netherlands' AND `champ` = 'currency' AND `lang` = 'es' AND `source_hash` = '34085cff4c62098d3744619fc7e632c98a15ec84';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'netherlands' AND `champ` = 'currency' AND `lang` = 'de' AND `source_hash` = '34085cff4c62098d3744619fc7e632c98a15ec84';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'netherlands' AND `champ` = 'currency' AND `lang` = 'zh' AND `source_hash` = '34085cff4c62098d3744619fc7e632c98a15ec84';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'netherlands' AND `champ` = 'currency' AND `lang` = 'ar' AND `source_hash` = '34085cff4c62098d3744619fc7e632c98a15ec84';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'netherlands' AND `champ` = 'language' AND `lang` = 'en' AND `source_hash` = 'ed742421a8940feb68928e32e00acd0b073658cf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'netherlands' AND `champ` = 'language' AND `lang` = 'es' AND `source_hash` = 'ed742421a8940feb68928e32e00acd0b073658cf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'netherlands' AND `champ` = 'language' AND `lang` = 'de' AND `source_hash` = 'ed742421a8940feb68928e32e00acd0b073658cf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'netherlands' AND `champ` = 'language' AND `lang` = 'zh' AND `source_hash` = 'ed742421a8940feb68928e32e00acd0b073658cf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'netherlands' AND `champ` = 'language' AND `lang` = 'ar' AND `source_hash` = 'ed742421a8940feb68928e32e00acd0b073658cf';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'netherlands' AND `champ` = 'independent' AND `lang` = 'en' AND `source_hash` = '698e8eb39b5c4f1d2826249b65a3b55bb4852cb9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'netherlands' AND `champ` = 'independent' AND `lang` = 'es' AND `source_hash` = '698e8eb39b5c4f1d2826249b65a3b55bb4852cb9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'netherlands' AND `champ` = 'independent' AND `lang` = 'de' AND `source_hash` = '698e8eb39b5c4f1d2826249b65a3b55bb4852cb9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'netherlands' AND `champ` = 'independent' AND `lang` = 'zh' AND `source_hash` = '698e8eb39b5c4f1d2826249b65a3b55bb4852cb9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'netherlands' AND `champ` = 'independent' AND `lang` = 'ar' AND `source_hash` = '698e8eb39b5c4f1d2826249b65a3b55bb4852cb9';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'nicaragua' AND `champ` = 'currency' AND `lang` = 'en' AND `source_hash` = '7faef28c0c03a71af2d4742a9095e2ed5eaed85c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'nicaragua' AND `champ` = 'currency' AND `lang` = 'es' AND `source_hash` = '7faef28c0c03a71af2d4742a9095e2ed5eaed85c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'nicaragua' AND `champ` = 'currency' AND `lang` = 'de' AND `source_hash` = '7faef28c0c03a71af2d4742a9095e2ed5eaed85c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'nicaragua' AND `champ` = 'currency' AND `lang` = 'zh' AND `source_hash` = '7faef28c0c03a71af2d4742a9095e2ed5eaed85c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'nicaragua' AND `champ` = 'currency' AND `lang` = 'ar' AND `source_hash` = '7faef28c0c03a71af2d4742a9095e2ed5eaed85c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'nicaragua' AND `champ` = 'language' AND `lang` = 'en' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'nicaragua' AND `champ` = 'language' AND `lang` = 'es' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'nicaragua' AND `champ` = 'language' AND `lang` = 'de' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'nicaragua' AND `champ` = 'language' AND `lang` = 'zh' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'nicaragua' AND `champ` = 'language' AND `lang` = 'ar' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'panama' AND `champ` = 'currency' AND `lang` = 'en' AND `source_hash` = '2198ec710956e2c10174d9175f7756cbe7af0dee';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'panama' AND `champ` = 'currency' AND `lang` = 'es' AND `source_hash` = '2198ec710956e2c10174d9175f7756cbe7af0dee';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'panama' AND `champ` = 'currency' AND `lang` = 'de' AND `source_hash` = '2198ec710956e2c10174d9175f7756cbe7af0dee';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'panama' AND `champ` = 'currency' AND `lang` = 'zh' AND `source_hash` = '2198ec710956e2c10174d9175f7756cbe7af0dee';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'panama' AND `champ` = 'currency' AND `lang` = 'ar' AND `source_hash` = '2198ec710956e2c10174d9175f7756cbe7af0dee';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'panama' AND `champ` = 'language' AND `lang` = 'en' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'panama' AND `champ` = 'language' AND `lang` = 'es' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'panama' AND `champ` = 'language' AND `lang` = 'de' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'panama' AND `champ` = 'language' AND `lang` = 'zh' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'panama' AND `champ` = 'language' AND `lang` = 'ar' AND `source_hash` = '7927b840a929f8e258dd40f49bfeab89cb6dbf12';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'peru' AND `champ` = 'currency' AND `lang` = 'en' AND `source_hash` = '5fe32d3738015fc637b16b6c7b0969dc2a3ca9b6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'peru' AND `champ` = 'currency' AND `lang` = 'es' AND `source_hash` = '5fe32d3738015fc637b16b6c7b0969dc2a3ca9b6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'peru' AND `champ` = 'currency' AND `lang` = 'de' AND `source_hash` = '5fe32d3738015fc637b16b6c7b0969dc2a3ca9b6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'peru' AND `champ` = 'currency' AND `lang` = 'zh' AND `source_hash` = '5fe32d3738015fc637b16b6c7b0969dc2a3ca9b6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'peru' AND `champ` = 'currency' AND `lang` = 'ar' AND `source_hash` = '5fe32d3738015fc637b16b6c7b0969dc2a3ca9b6';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'peru' AND `champ` = 'language' AND `lang` = 'en' AND `source_hash` = '758a5d1e213a8f5cc2f2bdb8e29bb3f64e7ea441';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'peru' AND `champ` = 'language' AND `lang` = 'es' AND `source_hash` = '758a5d1e213a8f5cc2f2bdb8e29bb3f64e7ea441';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'peru' AND `champ` = 'language' AND `lang` = 'de' AND `source_hash` = '758a5d1e213a8f5cc2f2bdb8e29bb3f64e7ea441';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'peru' AND `champ` = 'language' AND `lang` = 'zh' AND `source_hash` = '758a5d1e213a8f5cc2f2bdb8e29bb3f64e7ea441';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'peru' AND `champ` = 'language' AND `lang` = 'ar' AND `source_hash` = '758a5d1e213a8f5cc2f2bdb8e29bb3f64e7ea441';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'peru' AND `champ` = 'independent' AND `lang` = 'en' AND `source_hash` = '3104741f3794bcbf404adf10a65313eaba6aca3e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'peru' AND `champ` = 'independent' AND `lang` = 'es' AND `source_hash` = '3104741f3794bcbf404adf10a65313eaba6aca3e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'peru' AND `champ` = 'independent' AND `lang` = 'de' AND `source_hash` = '3104741f3794bcbf404adf10a65313eaba6aca3e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'peru' AND `champ` = 'independent' AND `lang` = 'zh' AND `source_hash` = '3104741f3794bcbf404adf10a65313eaba6aca3e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'peru' AND `champ` = 'independent' AND `lang` = 'ar' AND `source_hash` = '3104741f3794bcbf404adf10a65313eaba6aca3e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'philippines' AND `champ` = 'currency' AND `lang` = 'en' AND `source_hash` = '7070df8955b6b8777b34de87732037e45d07d502';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'philippines' AND `champ` = 'currency' AND `lang` = 'es' AND `source_hash` = '7070df8955b6b8777b34de87732037e45d07d502';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'philippines' AND `champ` = 'currency' AND `lang` = 'de' AND `source_hash` = '7070df8955b6b8777b34de87732037e45d07d502';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'philippines' AND `champ` = 'currency' AND `lang` = 'zh' AND `source_hash` = '7070df8955b6b8777b34de87732037e45d07d502';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'philippines' AND `champ` = 'currency' AND `lang` = 'ar' AND `source_hash` = '7070df8955b6b8777b34de87732037e45d07d502';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'philippines' AND `champ` = 'language' AND `lang` = 'en' AND `source_hash` = 'fd9875c3e683fabe5f2d9a2d3b84d2b2987e0239';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'philippines' AND `champ` = 'language' AND `lang` = 'es' AND `source_hash` = 'fd9875c3e683fabe5f2d9a2d3b84d2b2987e0239';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'philippines' AND `champ` = 'language' AND `lang` = 'de' AND `source_hash` = 'fd9875c3e683fabe5f2d9a2d3b84d2b2987e0239';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'philippines' AND `champ` = 'language' AND `lang` = 'zh' AND `source_hash` = 'fd9875c3e683fabe5f2d9a2d3b84d2b2987e0239';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'philippines' AND `champ` = 'language' AND `lang` = 'ar' AND `source_hash` = 'fd9875c3e683fabe5f2d9a2d3b84d2b2987e0239';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'philippines' AND `champ` = 'independent' AND `lang` = 'en' AND `source_hash` = '5f9d87033f20a609373dd2362cfe542bfad4806a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'philippines' AND `champ` = 'independent' AND `lang` = 'es' AND `source_hash` = '5f9d87033f20a609373dd2362cfe542bfad4806a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'philippines' AND `champ` = 'independent' AND `lang` = 'de' AND `source_hash` = '5f9d87033f20a609373dd2362cfe542bfad4806a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'philippines' AND `champ` = 'independent' AND `lang` = 'zh' AND `source_hash` = '5f9d87033f20a609373dd2362cfe542bfad4806a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'philippines' AND `champ` = 'independent' AND `lang` = 'ar' AND `source_hash` = '5f9d87033f20a609373dd2362cfe542bfad4806a';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'puertorico' AND `champ` = 'currency' AND `lang` = 'en' AND `source_hash` = '609587f6fc4007554b40bbc117e182c91562a660';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'puertorico' AND `champ` = 'currency' AND `lang` = 'es' AND `source_hash` = '609587f6fc4007554b40bbc117e182c91562a660';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'puertorico' AND `champ` = 'currency' AND `lang` = 'de' AND `source_hash` = '609587f6fc4007554b40bbc117e182c91562a660';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'puertorico' AND `champ` = 'currency' AND `lang` = 'zh' AND `source_hash` = '609587f6fc4007554b40bbc117e182c91562a660';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'puertorico' AND `champ` = 'currency' AND `lang` = 'ar' AND `source_hash` = '609587f6fc4007554b40bbc117e182c91562a660';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'puertorico' AND `champ` = 'language' AND `lang` = 'en' AND `source_hash` = '7f94183efdfffcc0bbc771721f1263813bccb93d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'puertorico' AND `champ` = 'language' AND `lang` = 'es' AND `source_hash` = '7f94183efdfffcc0bbc771721f1263813bccb93d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'puertorico' AND `champ` = 'language' AND `lang` = 'de' AND `source_hash` = '7f94183efdfffcc0bbc771721f1263813bccb93d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'puertorico' AND `champ` = 'language' AND `lang` = 'zh' AND `source_hash` = '7f94183efdfffcc0bbc771721f1263813bccb93d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'puertorico' AND `champ` = 'language' AND `lang` = 'ar' AND `source_hash` = '7f94183efdfffcc0bbc771721f1263813bccb93d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'puertorico' AND `champ` = 'independent' AND `lang` = 'en' AND `source_hash` = '85797ab6d37c47380572e765c78a125a7779f40c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'puertorico' AND `champ` = 'independent' AND `lang` = 'es' AND `source_hash` = '85797ab6d37c47380572e765c78a125a7779f40c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'puertorico' AND `champ` = 'independent' AND `lang` = 'de' AND `source_hash` = '85797ab6d37c47380572e765c78a125a7779f40c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'puertorico' AND `champ` = 'independent' AND `lang` = 'zh' AND `source_hash` = '85797ab6d37c47380572e765c78a125a7779f40c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'puertorico' AND `champ` = 'independent' AND `lang` = 'ar' AND `source_hash` = '85797ab6d37c47380572e765c78a125a7779f40c';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'russia' AND `champ` = 'currency' AND `lang` = 'en' AND `source_hash` = 'eaba02eb40ad4fa94dab98ac382623926292c191';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'russia' AND `champ` = 'currency' AND `lang` = 'es' AND `source_hash` = 'eaba02eb40ad4fa94dab98ac382623926292c191';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'russia' AND `champ` = 'currency' AND `lang` = 'de' AND `source_hash` = 'eaba02eb40ad4fa94dab98ac382623926292c191';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'russia' AND `champ` = 'currency' AND `lang` = 'zh' AND `source_hash` = 'eaba02eb40ad4fa94dab98ac382623926292c191';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'russia' AND `champ` = 'currency' AND `lang` = 'ar' AND `source_hash` = 'eaba02eb40ad4fa94dab98ac382623926292c191';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'russia' AND `champ` = 'language' AND `lang` = 'en' AND `source_hash` = 'e7fa7af006462b8fefcaf286273cf1132c99fb27';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'russia' AND `champ` = 'language' AND `lang` = 'es' AND `source_hash` = 'e7fa7af006462b8fefcaf286273cf1132c99fb27';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'russia' AND `champ` = 'language' AND `lang` = 'de' AND `source_hash` = 'e7fa7af006462b8fefcaf286273cf1132c99fb27';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'russia' AND `champ` = 'language' AND `lang` = 'zh' AND `source_hash` = 'e7fa7af006462b8fefcaf286273cf1132c99fb27';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'russia' AND `champ` = 'language' AND `lang` = 'ar' AND `source_hash` = 'e7fa7af006462b8fefcaf286273cf1132c99fb27';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'russia' AND `champ` = 'independent' AND `lang` = 'en' AND `source_hash` = 'c6ca21d82182456cd05d99eb10dccf3e51045a0e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'russia' AND `champ` = 'independent' AND `lang` = 'es' AND `source_hash` = 'c6ca21d82182456cd05d99eb10dccf3e51045a0e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'russia' AND `champ` = 'independent' AND `lang` = 'de' AND `source_hash` = 'c6ca21d82182456cd05d99eb10dccf3e51045a0e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'russia' AND `champ` = 'independent' AND `lang` = 'zh' AND `source_hash` = 'c6ca21d82182456cd05d99eb10dccf3e51045a0e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'russia' AND `champ` = 'independent' AND `lang` = 'ar' AND `source_hash` = 'c6ca21d82182456cd05d99eb10dccf3e51045a0e';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'southafrica' AND `champ` = 'currency' AND `lang` = 'en' AND `source_hash` = 'd0bd175ea14a4276684821dee5509b267f33e7b5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'southafrica' AND `champ` = 'currency' AND `lang` = 'es' AND `source_hash` = 'd0bd175ea14a4276684821dee5509b267f33e7b5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'southafrica' AND `champ` = 'currency' AND `lang` = 'de' AND `source_hash` = 'd0bd175ea14a4276684821dee5509b267f33e7b5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'southafrica' AND `champ` = 'currency' AND `lang` = 'zh' AND `source_hash` = 'd0bd175ea14a4276684821dee5509b267f33e7b5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'southafrica' AND `champ` = 'currency' AND `lang` = 'ar' AND `source_hash` = 'd0bd175ea14a4276684821dee5509b267f33e7b5';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'southafrica' AND `champ` = 'language' AND `lang` = 'en' AND `source_hash` = 'fe171c766efd44a2f32c36e06df26212262f14c0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'southafrica' AND `champ` = 'language' AND `lang` = 'es' AND `source_hash` = 'fe171c766efd44a2f32c36e06df26212262f14c0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'southafrica' AND `champ` = 'language' AND `lang` = 'de' AND `source_hash` = 'fe171c766efd44a2f32c36e06df26212262f14c0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'southafrica' AND `champ` = 'language' AND `lang` = 'zh' AND `source_hash` = 'fe171c766efd44a2f32c36e06df26212262f14c0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'southafrica' AND `champ` = 'language' AND `lang` = 'ar' AND `source_hash` = 'fe171c766efd44a2f32c36e06df26212262f14c0';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'southafrica' AND `champ` = 'independent' AND `lang` = 'en' AND `source_hash` = 'a2c0d54d1e177f21228681b4da7e294e4a2e1217';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'southafrica' AND `champ` = 'independent' AND `lang` = 'es' AND `source_hash` = 'a2c0d54d1e177f21228681b4da7e294e4a2e1217';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'southafrica' AND `champ` = 'independent' AND `lang` = 'de' AND `source_hash` = 'a2c0d54d1e177f21228681b4da7e294e4a2e1217';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'southafrica' AND `champ` = 'independent' AND `lang` = 'zh' AND `source_hash` = 'a2c0d54d1e177f21228681b4da7e294e4a2e1217';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'southafrica' AND `champ` = 'independent' AND `lang` = 'ar' AND `source_hash` = 'a2c0d54d1e177f21228681b4da7e294e4a2e1217';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'usa' AND `champ` = 'currency' AND `lang` = 'en' AND `source_hash` = '8e6858f66ca4d79fbd52d9846c44b036e13de836';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'usa' AND `champ` = 'currency' AND `lang` = 'es' AND `source_hash` = '8e6858f66ca4d79fbd52d9846c44b036e13de836';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'usa' AND `champ` = 'currency' AND `lang` = 'de' AND `source_hash` = '8e6858f66ca4d79fbd52d9846c44b036e13de836';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'usa' AND `champ` = 'currency' AND `lang` = 'zh' AND `source_hash` = '8e6858f66ca4d79fbd52d9846c44b036e13de836';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'usa' AND `champ` = 'currency' AND `lang` = 'ar' AND `source_hash` = '8e6858f66ca4d79fbd52d9846c44b036e13de836';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'usa' AND `champ` = 'language' AND `lang` = 'en' AND `source_hash` = 'c06595d9433fc1f1794970b196c6b91df2633f8d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'usa' AND `champ` = 'language' AND `lang` = 'es' AND `source_hash` = 'c06595d9433fc1f1794970b196c6b91df2633f8d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'usa' AND `champ` = 'language' AND `lang` = 'de' AND `source_hash` = 'c06595d9433fc1f1794970b196c6b91df2633f8d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'usa' AND `champ` = 'language' AND `lang` = 'zh' AND `source_hash` = 'c06595d9433fc1f1794970b196c6b91df2633f8d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'usa' AND `champ` = 'language' AND `lang` = 'ar' AND `source_hash` = 'c06595d9433fc1f1794970b196c6b91df2633f8d';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'zimbabwe' AND `champ` = 'currency' AND `lang` = 'en' AND `source_hash` = 'b9bb0602934e96d57abfdfaa0cbd984723cbebcb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'zimbabwe' AND `champ` = 'currency' AND `lang` = 'es' AND `source_hash` = 'b9bb0602934e96d57abfdfaa0cbd984723cbebcb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'zimbabwe' AND `champ` = 'currency' AND `lang` = 'de' AND `source_hash` = 'b9bb0602934e96d57abfdfaa0cbd984723cbebcb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'zimbabwe' AND `champ` = 'currency' AND `lang` = 'zh' AND `source_hash` = 'b9bb0602934e96d57abfdfaa0cbd984723cbebcb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'zimbabwe' AND `champ` = 'currency' AND `lang` = 'ar' AND `source_hash` = 'b9bb0602934e96d57abfdfaa0cbd984723cbebcb';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'zimbabwe' AND `champ` = 'language' AND `lang` = 'en' AND `source_hash` = 'c8db37743f3e862f1d38617da648514b6e23da31';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'zimbabwe' AND `champ` = 'language' AND `lang` = 'es' AND `source_hash` = 'c8db37743f3e862f1d38617da648514b6e23da31';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'zimbabwe' AND `champ` = 'language' AND `lang` = 'de' AND `source_hash` = 'c8db37743f3e862f1d38617da648514b6e23da31';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'zimbabwe' AND `champ` = 'language' AND `lang` = 'zh' AND `source_hash` = 'c8db37743f3e862f1d38617da648514b6e23da31';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'zimbabwe' AND `champ` = 'language' AND `lang` = 'ar' AND `source_hash` = 'c8db37743f3e862f1d38617da648514b6e23da31';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'zimbabwe' AND `champ` = 'independent' AND `lang` = 'en' AND `source_hash` = 'e72045c701f7cbafabb0f3c53869dd7d03576b49';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'zimbabwe' AND `champ` = 'independent' AND `lang` = 'es' AND `source_hash` = 'e72045c701f7cbafabb0f3c53869dd7d03576b49';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'zimbabwe' AND `champ` = 'independent' AND `lang` = 'de' AND `source_hash` = 'e72045c701f7cbafabb0f3c53869dd7d03576b49';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'zimbabwe' AND `champ` = 'independent' AND `lang` = 'zh' AND `source_hash` = 'e72045c701f7cbafabb0f3c53869dd7d03576b49';
UPDATE `translation_status` SET `statut` = 'relu', `relecteur` = 'expert-traduction (agent)', `maj` = NOW()
 WHERE `entite` = 'producer_geo' AND `entite_id` = 'zimbabwe' AND `champ` = 'independent' AND `lang` = 'ar' AND `source_hash` = 'e72045c701f7cbafabb0f3c53869dd7d03576b49';

DELETE FROM `moderation_log` WHERE `acteur_nom` = 'migration 287';
INSERT INTO `moderation_log` (`acteur_id`, `acteur_nom`, `portee`, `action`, `cible_type`, `cible_id`, `detail`)
VALUES (NULL, 'migration 287', 'systeme', 'traductions_relues', 'systeme', 0, 'Relecture producer_geo par expert-traduction (agent) : 400 traduction(s) relue(s), 1 corrigee(s)');

SELECT (SELECT COUNT(*) FROM `translation_status` WHERE `entite` = 'producer_geo' AND `statut` = 'relu') = 400 AS relues;
