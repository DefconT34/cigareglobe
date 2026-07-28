
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `approved_lounges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `approved_lounges` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `contribution_id` int unsigned NOT NULL,
  `country_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hours` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maps_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_contrib` (`contribution_id`),
  KEY `idx_country` (`country_id`),
  KEY `idx_approved` (`approved_at` DESC),
  CONSTRAINT `fk_approved_contrib` FOREIGN KEY (`contribution_id`) REFERENCES `contributions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `auth_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_attempts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_aa_ip_action_time` (`ip`,`action`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `founded` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `history` text COLLATE utf8mb4_unicode_ci,
  `gamme` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Array of {name,color,story,force,wrapper,vitolas}',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scores` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Distinctions: [{source, score, year, vitola}]',
  `celebrities` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Célébrités associées: [{name, anecdote}]',
  `pairings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Accords: [{type, name, notes}]',
  `limited_eds` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Éditions limitées notables',
  `factory` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tabacalera / manufacture',
  `history_en` text COLLATE utf8mb4_unicode_ci COMMENT 'Histoire en anglais',
  `history_es` text COLLATE utf8mb4_unicode_ci COMMENT 'Histoire en espagnol',
  `history_de` text COLLATE utf8mb4_unicode_ci COMMENT 'Histoire en allemand',
  `history_zh` text COLLATE utf8mb4_unicode_ci COMMENT 'Histoire en chinois',
  `history_ar` text COLLATE utf8mb4_unicode_ci COMMENT 'Histoire en arabe',
  `gamme_en` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Gammes en anglais',
  `gamme_es` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Gammes en espagnol',
  `notes_en` text COLLATE utf8mb4_unicode_ci COMMENT 'Note sommelier EN',
  `notes_es` text COLLATE utf8mb4_unicode_ci COMMENT 'Note sommelier ES',
  `notes_de` text COLLATE utf8mb4_unicode_ci COMMENT 'Note sommelier DE',
  `notes_zh` text COLLATE utf8mb4_unicode_ci COMMENT 'Note sommelier ZH',
  `notes_ar` text COLLATE utf8mb4_unicode_ci COMMENT 'Note sommelier AR',
  `gamme_de` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Gammes en allemand',
  `gamme_zh` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Gammes en chinois',
  `gamme_ar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Gammes en arabe',
  `celebrities_en` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Célébrités EN',
  `celebrities_es` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Célébrités ES',
  `celebrities_de` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Célébrités DE',
  `celebrities_zh` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Célébrités ZH',
  `celebrities_ar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Célébrités AR',
  `pairings_en` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Accords EN',
  `pairings_es` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Accords ES',
  `pairings_de` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Accords DE',
  `pairings_zh` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Accords ZH',
  `pairings_ar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Accords AR',
  PRIMARY KEY (`name`),
  CONSTRAINT `brands_chk_1` CHECK (json_valid(`gamme`)),
  CONSTRAINT `brands_chk_10` CHECK (json_valid(`gamme_ar`)),
  CONSTRAINT `brands_chk_11` CHECK (json_valid(`celebrities_en`)),
  CONSTRAINT `brands_chk_12` CHECK (json_valid(`celebrities_es`)),
  CONSTRAINT `brands_chk_13` CHECK (json_valid(`celebrities_de`)),
  CONSTRAINT `brands_chk_14` CHECK (json_valid(`celebrities_zh`)),
  CONSTRAINT `brands_chk_15` CHECK (json_valid(`celebrities_ar`)),
  CONSTRAINT `brands_chk_16` CHECK (json_valid(`pairings_en`)),
  CONSTRAINT `brands_chk_17` CHECK (json_valid(`pairings_es`)),
  CONSTRAINT `brands_chk_18` CHECK (json_valid(`pairings_de`)),
  CONSTRAINT `brands_chk_19` CHECK (json_valid(`pairings_zh`)),
  CONSTRAINT `brands_chk_2` CHECK (json_valid(`scores`)),
  CONSTRAINT `brands_chk_20` CHECK (json_valid(`pairings_ar`)),
  CONSTRAINT `brands_chk_3` CHECK (json_valid(`celebrities`)),
  CONSTRAINT `brands_chk_4` CHECK (json_valid(`pairings`)),
  CONSTRAINT `brands_chk_5` CHECK (json_valid(`limited_eds`)),
  CONSTRAINT `brands_chk_6` CHECK (json_valid(`gamme_en`)),
  CONSTRAINT `brands_chk_7` CHECK (json_valid(`gamme_es`)),
  CONSTRAINT `brands_chk_8` CHECK (json_valid(`gamme_de`)),
  CONSTRAINT `brands_chk_9` CHECK (json_valid(`gamme_zh`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `contributions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contributions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `country_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Cave à Cigares',
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contributor_email` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contributor_ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `votes_up` int unsigned NOT NULL DEFAULT '0',
  `votes_down` int unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `approved_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_country` (`country_id`),
  KEY `idx_status` (`status`),
  KEY `idx_contrib_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `country_polygons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_polygons` (
  `country_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `points` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Array of [lat,lon]',
  PRIMARY KEY (`country_id`),
  CONSTRAINT `country_polygons_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `producer_countries` (`id`),
  CONSTRAINT `country_polygons_chk_1` CHECK (json_valid(`points`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `email_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_tokens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `token_hash` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('verify','reset') COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` datetime NOT NULL,
  `used_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_et_user` (`user_id`),
  KEY `idx_et_token` (`token_hash`),
  CONSTRAINT `fk_et_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `target_type` enum('lounge','country') COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `list` enum('to_visit','visited','favorite') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'favorite',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_fav` (`user_id`,`target_type`,`target_id`,`list`),
  KEY `idx_fav_user` (`user_id`),
  KEY `idx_fav_target` (`target_type`,`target_id`),
  CONSTRAINT `fk_fav_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `habanos_presence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habanos_presence` (
  `country_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `present` tinyint(1) DEFAULT '1',
  `status` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `founded` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ownership` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hq` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ceo` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revenue` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employees` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `factories` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `marques_officielles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `distributeurs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `description` text COLLATE utf8mb4_unicode_ci,
  `festival` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certifications` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`country_id`),
  CONSTRAINT `habanos_presence_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `producer_countries` (`id`),
  CONSTRAINT `habanos_presence_chk_1` CHECK (json_valid(`factories`)),
  CONSTRAINT `habanos_presence_chk_2` CHECK (json_valid(`marques_officielles`)),
  CONSTRAINT `habanos_presence_chk_3` CHECK (json_valid(`distributeurs`)),
  CONSTRAINT `habanos_presence_chk_4` CHECK (json_valid(`certifications`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `lounge_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lounge_countries` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` decimal(8,4) DEFAULT NULL,
  `lon` decimal(8,4) DEFAULT NULL,
  `color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '#8B2BE2',
  `iso_code` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Code ISO 3166-1 alpha-2 (ex: FR, US, CI)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `lounge_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lounge_photos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `lounge_id` int unsigned NOT NULL,
  `filename` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Nom du fichier stocké sur le serveur',
  `caption` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Légende affichée sous la photo',
  `is_primary` tinyint(1) DEFAULT '0' COMMENT '1 = photo principale (hero)',
  `is_approved` tinyint(1) DEFAULT '1' COMMENT '0 = en attente modération',
  `uploaded_by` enum('admin','community') COLLATE utf8mb4_unicode_ci DEFAULT 'admin',
  `uploader_ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` tinyint unsigned DEFAULT '0' COMMENT 'Ordre d''affichage (0 = premier)',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_lounge` (`lounge_id`),
  KEY `idx_primary` (`lounge_id`,`is_primary`),
  KEY `idx_approved` (`is_approved`),
  KEY `idx_lounge_approved` (`lounge_id`,`is_approved`),
  CONSTRAINT `lounge_photos_ibfk_1` FOREIGN KEY (`lounge_id`) REFERENCES `lounges` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `lounge_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lounge_ratings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `lounge_id` int unsigned NOT NULL,
  `voter_ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'IPv4 ou IPv6',
  `rating` tinyint NOT NULL,
  `rated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_lounge_ip` (`lounge_id`,`voter_ip`),
  KEY `idx_lounge` (`lounge_id`),
  KEY `idx_ip` (`voter_ip`),
  CONSTRAINT `lounge_ratings_ibfk_1` FOREIGN KEY (`lounge_id`) REFERENCES `lounges` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lounge_ratings_chk_1` CHECK ((`rating` between 1 and 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `lounges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lounges` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `source` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `hours` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Ex: Lun-Sam 10h-22h',
  `maps_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Lien Google Maps',
  `website` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '@handle',
  `rating` decimal(2,1) DEFAULT NULL COMMENT 'Note 0.0-5.0',
  `rating_count` int unsigned DEFAULT '0',
  `description_en` text COLLATE utf8mb4_unicode_ci COMMENT 'Description en anglais',
  `description_es` text COLLATE utf8mb4_unicode_ci COMMENT 'Description en espagnol',
  `description_de` text COLLATE utf8mb4_unicode_ci COMMENT 'Description en allemand',
  `description_zh` text COLLATE utf8mb4_unicode_ci COMMENT 'Description en chinois',
  `description_ar` text COLLATE utf8mb4_unicode_ci COMMENT 'Description en arabe',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_country_name` (`country_id`,`name`(191)),
  KEY `idx_country` (`country_id`),
  KEY `idx_country_verified` (`country_id`,`is_verified`),
  KEY `idx_rating` (`rating` DESC),
  KEY `idx_country_rating` (`country_id`,`is_verified`,`rating`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `markets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `markets` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` decimal(8,4) DEFAULT NULL,
  `lon` decimal(8,4) DEFAULT NULL,
  `rank_num` int DEFAULT NULL,
  `consumption` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cigars` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `share` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trend` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `top_brands` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `note` text COLLATE utf8mb4_unicode_ci,
  `color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `markets_chk_1` CHECK (json_valid(`top_brands`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `producer_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producer_countries` (
  `id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `flag` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` decimal(8,4) NOT NULL,
  `lon` decimal(8,4) NOT NULL,
  `region` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tier` enum('major','notable','emerging') COLLATE utf8mb4_unicode_ci DEFAULT 'major',
  `color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `production` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revenue` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rev_detail` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `harvest` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `climate` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `soil` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tabacaleras` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `regions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `varieties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `brands` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Array of {name, desc, iconic}',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `producer_countries_chk_1` CHECK (json_valid(`tabacaleras`)),
  CONSTRAINT `producer_countries_chk_2` CHECK (json_valid(`regions`)),
  CONSTRAINT `producer_countries_chk_3` CHECK (json_valid(`varieties`)),
  CONSTRAINT `producer_countries_chk_4` CHECK (json_valid(`brands`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `producer_geo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producer_geo` (
  `country_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capital` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `population` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coords` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gdp` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `independent` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`country_id`),
  CONSTRAINT `producer_geo_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `producer_countries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `production_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `production_zones` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` decimal(8,4) NOT NULL,
  `lon` decimal(8,4) NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `production_zones_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `producer_countries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `review_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_flags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `review_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_flag_review_user` (`review_id`,`user_id`),
  KEY `idx_flag_review` (`review_id`),
  KEY `fk_flag_user` (`user_id`),
  CONSTRAINT `fk_flag_review` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_flag_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `lounge_id` int unsigned NOT NULL,
  `rating` tinyint unsigned NOT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci,
  `status` enum('published','flagged','removed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_reviews_user_lounge` (`user_id`,`lounge_id`),
  KEY `idx_reviews_lounge` (`lounge_id`),
  CONSTRAINT `fk_reviews_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('member','trusted','moderator','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'member',
  `email_verified` tinyint(1) NOT NULL DEFAULT '0',
  `avatar_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','suspended') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_users_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `votes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `contribution_id` int unsigned NOT NULL,
  `voter_ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vote` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_vote` (`contribution_id`,`voter_ip`),
  CONSTRAINT `fk_votes_contrib` FOREIGN KEY (`contribution_id`) REFERENCES `contributions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

