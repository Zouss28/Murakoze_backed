/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.1-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: mydump_db
-- ------------------------------------------------------
-- Server version	11.8.1-MariaDB-4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `_prisma_migrations` VALUES
('00269d40-c4d0-4920-a6e1-ebc95e981f90','873154a252a67e8023bfb869906298d001d6b3e680a233c57d7bc876b2ada5d7','2025-05-16 07:21:13.985','20250516072111_change_category_to_institution_id',NULL,NULL,'2025-05-16 07:21:13.864',1),
('09e2d21b-1d46-4443-9a24-20bf28d85fbe','7702d7335b0474f75f19500ba2104edd572e381908ac53d7ea7aef50fc7ee1b4','2025-05-15 09:12:38.787','20250515091235_added_price_range_table',NULL,NULL,'2025-05-15 09:12:38.741',1),
('0d33a9c7-a15a-4db4-99aa-3df3281bac27','99aeca32a79670ccfd032a0037223e1706ee299a72dc7994bbe6c5b2aeea1bec','2025-04-22 12:25:19.794','20250416104220_make_email_unique',NULL,NULL,'2025-04-22 12:25:19.767',1),
('2e5d784a-fda9-478c-b947-4ea0fdf19ad5','976ed18db28b372feef17b2c7435147863bc8f396742c514d5d33423c55e3c6e','2025-05-27 09:43:58.643','20250527094355_added_email_verification',NULL,NULL,'2025-05-27 09:43:58.624',1),
('2f11ef21-434a-49d2-b2ab-7d22a3c80816','cf758ba966cae2a36c1eb27c347ec3f3ccda903f6713031b39a07ce9c2b35ee4','2025-04-22 12:26:03.150','20250422122600_add_review_table',NULL,NULL,'2025-04-22 12:26:03.055',1),
('35f6757d-c68b-4d2d-b8c5-94342efac8a8','7325db4a7ccc8050b1c45843aec0d0fa0d8103259f307e5ac2ffd289e87885b0','2025-05-27 07:10:22.298','20250527071019_service_rating_table_added',NULL,NULL,'2025-05-27 07:10:22.226',1),
('43c4f28f-8815-480d-b2d3-e6e012df379f','e740f8e3fb88d3af60e98f7bb0b41b086a0cbbac1613a4739ce1cd6de8516899','2025-05-26 09:10:20.090','20250526091017_added_a_survey',NULL,NULL,'2025-05-26 09:10:20.037',1),
('466875f7-7c96-47aa-88a0-8534441444e3','0e9fa29db49f1b75396897e01fcd93931590f2d5dab3609ab60c51602c866d5a','2025-05-08 10:29:29.081','20250505123202_changed_log_and_lat','',NULL,'2025-05-08 10:29:29.081',0),
('471d1305-ea2c-4aaf-b33a-14d977e562a0','7e4e3b1410fdefc7de61204c9bfee719d3fc1b148bf9011bd5e0381d2a607d4d','2025-04-24 09:26:06.812','20250424092604_add_review_id_in_images',NULL,NULL,'2025-04-24 09:26:06.723',1),
('4916de9e-21c5-4fcf-b3b6-47e377210c4c','009cfe68c1402396d62ca203b3d0dbddac342a96d4058ea8b9aa66467d60e138','2025-05-08 10:33:01.794','20250508103259_added_is_approved',NULL,NULL,'2025-05-08 10:33:01.777',1),
('4dc9a303-5806-4c3c-969c-93d8dcac30bf','7f787c9fb79f65eca02f423c2e71c560cd2263779925c0560a57fe0fb5e66921','2025-05-08 10:30:17.167','20250506102215_added_two_buttons','',NULL,'2025-05-08 10:30:17.167',0),
('97c74e92-06c0-4ee0-9d75-3e7baab2163a','c7f1f555201ad20a3de4e00bbe58bf37dcc0127d995012dc05067a67b99d8107','2025-05-27 08:35:24.940','20250527083521_connected_q_and_a',NULL,NULL,'2025-05-27 08:35:24.892',1),
('9c2e95a1-1380-4c0b-b8dc-42f4129d038d','c3e89d014bc2e7faa113b7415cf1dda81ecd9ef12d0368c54fa6ca99cb239f23','2025-05-08 10:21:05.759','20250505095802_add_working_hour','',NULL,'2025-05-08 10:21:05.759',0),
('aa1db9e9-d0b9-415c-8e6c-bfc3a501b007','83ff5b233d37e17c45d06ab9986ded369d30f33ffeb3c38082f5dee2af3f2c89','2025-05-08 12:59:37.504','20250508125934_added_amenities',NULL,NULL,'2025-05-08 12:59:37.485',1),
('ab3a4592-3b7c-48b2-b760-d2baa4d43fa0','9b7351ce9f10afc448c9a67a2f50d907a68c595531bf27796b420d9540e1c0d6','2025-04-22 12:25:19.592','20250416074950_migration_v0',NULL,NULL,'2025-04-22 12:25:17.870',1),
('b1890933-073f-452a-9a11-a39d737a0790','b4f58d87b5704de872d47334dc79e52bca9f0a691994f4c4d509055e443590ef','2025-05-13 13:34:43.955','20250512122840_increased_character_for_icon','',NULL,'2025-05-13 13:34:43.955',0),
('b413f863-5143-4fc3-8e75-8ecb44446f34','6e3c1b030e8dc08e0cfc1c323a0320ab65a16fb02d5edbf3137a599796bfab0b','2025-05-16 07:33:22.412','20250516073312_added_label',NULL,NULL,'2025-05-16 07:33:22.351',1),
('bdec823c-d03a-4952-aa23-a01a461ce60b','39ce6fc2ef150113e4af9d86058fc011eacdf8ddd74c296f98bac19b1272752b','2025-05-13 13:34:18.210','20250509102920_added_amenities','',NULL,'2025-05-13 13:34:18.210',0),
('bfb97104-3aa4-476c-b59d-2dc47fb9a396','16e2d82199edf7f072481eb57c6c42d59ce8f4a1bb77dbe73905861a206555c1','2025-05-15 10:18:52.657','20250515101849_updated_the_price_ranges',NULL,NULL,'2025-05-15 10:18:52.455',1),
('d2680347-121a-4997-bcd2-99302ab88147','02787669a5754223a8c51a5a23c69f972d36985110290a4c32c52b1ca5f686bd','2025-05-27 08:31:04.181','20250527083101_removed_service_id_from_answers',NULL,NULL,'2025-05-27 08:31:04.157',1),
('dcb41191-64a5-4fc4-a460-205275f38f2d','3eb632e10262de08aa1e58de1a5f4a2e22ee222602a2aa0710de8e1585319bc2','2025-04-22 12:25:19.766','20250416093043_migration_v1',NULL,NULL,'2025-04-22 12:25:19.594',1),
('e82af0d9-a24f-485d-a3f3-4fc7aa8eb851','bbf5746876ff73bc5cfe90ad9b8caea2aadf2be3c438cce97a0a1a0f567fd384','2025-05-30 09:35:26.830','20250530093523_added_search_term_for_categories',NULL,NULL,'2025-05-30 09:35:26.785',1),
('ece1b487-4ea5-4803-bc0b-a194614ef61e','0417d7f17a662ec5653b8bc7ed246b32242e823d1d5fd691335d9990555a5a81','2025-05-08 11:30:52.006','20250508113049_changed_time_format',NULL,NULL,'2025-05-08 11:30:51.978',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `amenities`
--

DROP TABLE IF EXISTS `amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `added_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenities`
--

LOCK TABLES `amenities` WRITE;
/*!40000 ALTER TABLE `amenities` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `amenities` VALUES
(1,'Free Wifi','uploads/icons/Free Wifi Icon.png','2025-05-09 10:09:23'),
(2,'Free Parking','uploads/icons/Free Parking Icon.png','2025-05-09 10:09:23'),
(3,'Restaurant','uploads/icons/Restaurant icon.png','2025-05-09 10:09:23'),
(4,'Coffee','uploads/icons/Coffee cup icon.png','2025-05-09 10:09:23'),
(5,'Swimming Pool','uploads/icons/Swimming Pool Icon.png','2025-05-09 10:09:23'),
(6,'King Size Beds','uploads/icons/King Size Bed Icon.png','2025-05-09 10:09:23'),
(7,'Emergency Room','uploads/icons/Emergency Room Icon.png','2025-05-09 10:09:23'),
(8,'Pharmacy On-site','uploads/icons/Pharmacy Medicines.png','2025-05-09 10:09:23'),
(9,'Ambulance Services','uploads/icons/Ambulance Icon.png','2025-05-09 10:09:23'),
(10,'Wheelchair Accessible','uploads/icons/wheelchair.png','2025-05-09 10:09:23'),
(11,'24/7 Services','uploads/icons/24-7 Icon.png','2025-05-09 10:09:23'),
(12,'Same-day Service','uploads/icons/Quick Icon.png','2025-05-09 10:09:23'),
(13,'Background-Checked Staff','uploads/icons/Background Check Icon.png','2025-05-09 10:09:23'),
(14,'Equipment Provided','uploads/icons/Cleaning Cart Icon.png','2025-05-09 10:09:23'),
(15,'Pet-Friendly','uploads/icons/Pet Friendly Animal Care.png','2025-05-09 10:09:23'),
(16,'Blood Bank','uploads/icons/Blood Bank Icon.png','2025-05-09 10:09:23'),
(17,'Child-Friendly','uploads/icons/Child Friendly Icon.png','2025-05-09 10:09:23'),
(18,'CCTV Security','uploads/icons/CCTV Security Camera.png','2025-05-09 10:09:23'),
(19,'Air Conditioning','uploads/icons/Air Conditioner Icon.png','2025-05-09 10:09:23'),
(20,'Health Insurance Accepted','uploads/icons/Health Insurance Icon.png','2025-05-09 10:09:23');
/*!40000 ALTER TABLE `amenities` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `app_releases`
--

DROP TABLE IF EXISTS `app_releases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_releases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `release_version` varchar(64) NOT NULL,
  `app_name` enum('mobile_rating','tablet_rating','tablet_qms_o') NOT NULL,
  `platform` enum('android','ios') NOT NULL,
  `release_note` text DEFAULT NULL,
  `release_url` varchar(255) NOT NULL,
  `minimum_version` varchar(64) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_releases`
--

LOCK TABLES `app_releases` WRITE;
/*!40000 ALTER TABLE `app_releases` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `app_releases` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `registry_type` smallint(6) NOT NULL,
  `institution_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `reason` varchar(255) NOT NULL,
  `date` timestamp NOT NULL,
  `start_time` timestamp NOT NULL,
  `end_time` timestamp NOT NULL,
  `location` varchar(255) NOT NULL,
  `additional_note` varchar(255) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `recurring` smallint(6) DEFAULT 0,
  `notification_status` smallint(6) DEFAULT 1,
  `ticket_created` smallint(6) DEFAULT 0,
  `appointment_cancelled` smallint(6) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `cancellation_reason` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_appointment_creator` (`creator_id`),
  KEY `fk_appointment_institution` (`institution_id`),
  KEY `fk_appointment_operator` (`operator_id`),
  KEY `fk_appointment_service` (`service_id`),
  KEY `fk_appointment_user` (`user_id`),
  CONSTRAINT `fk_appointment_creator` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_appointment_institution` FOREIGN KEY (`institution_id`) REFERENCES `institution` (`id`),
  CONSTRAINT `fk_appointment_operator` FOREIGN KEY (`operator_id`) REFERENCES `qms_operator` (`id`),
  CONSTRAINT `fk_appointment_service` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  CONSTRAINT `fk_appointment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `apps`
--

DROP TABLE IF EXISTS `apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `apps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `institution_id` int(11) NOT NULL,
  `secret_key` varchar(255) DEFAULT NULL,
  `access_key` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_app_institution_id` (`institution_id`),
  CONSTRAINT `fk_app_institution_id` FOREIGN KEY (`institution_id`) REFERENCES `institution` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apps`
--

LOCK TABLES `apps` WRITE;
/*!40000 ALTER TABLE `apps` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `apps` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `audit_trail`
--

DROP TABLE IF EXISTS `audit_trail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_trail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_value` text DEFAULT NULL,
  `new_value` text DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `field` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `model_id` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL,
  `status` enum('1','2','3') DEFAULT NULL,
  `reviewed_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_audit_trail_action` (`action`),
  KEY `idx_audit_trail_field` (`field`),
  KEY `idx_audit_trail_ip` (`ip`),
  KEY `idx_audit_trail_model` (`model`),
  KEY `idx_audit_trail_model_id` (`model_id`),
  KEY `idx_audit_trail_user_agent` (`user_agent`),
  KEY `idx_audit_trail_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_trail`
--

LOCK TABLES `audit_trail` WRITE;
/*!40000 ALTER TABLE `audit_trail` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `audit_trail` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `business_amenities`
--

DROP TABLE IF EXISTS `business_amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_amenities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `institution_id` int(11) DEFAULT NULL,
  `amenitY_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `amenitY_id` (`amenitY_id`,`institution_id`),
  KEY `fk_instititu_id` (`institution_id`),
  CONSTRAINT `fk_amen_id` FOREIGN KEY (`amenitY_id`) REFERENCES `amenities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_instititu_id` FOREIGN KEY (`institution_id`) REFERENCES `institution` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_amenities`
--

LOCK TABLES `business_amenities` WRITE;
/*!40000 ALTER TABLE `business_amenities` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `business_amenities` VALUES
(1,3,1),
(7,4,1),
(26,5,1),
(19,6,1),
(35,10,1),
(44,11,1),
(13,19,1),
(53,20,1),
(2,3,2),
(8,4,2),
(27,5,2),
(20,6,2),
(36,10,2),
(45,11,2),
(14,19,2),
(54,20,2),
(62,21,2),
(70,22,2),
(78,23,2),
(86,24,2),
(3,3,3),
(9,4,3),
(28,5,3),
(21,6,3),
(37,10,3),
(46,11,3),
(15,19,3),
(55,20,3),
(4,3,4),
(10,4,4),
(29,5,4),
(22,6,4),
(38,10,4),
(47,11,4),
(16,19,4),
(56,20,4),
(30,5,5),
(39,10,5),
(48,11,5),
(57,20,5),
(31,5,6),
(40,10,6),
(49,11,6),
(58,20,6),
(63,21,7),
(71,22,7),
(79,23,7),
(87,24,7),
(64,21,8),
(72,22,8),
(80,23,8),
(88,24,8),
(65,21,9),
(73,22,9),
(81,23,9),
(89,24,9),
(32,5,10),
(41,10,10),
(50,11,10),
(59,20,10),
(66,21,10),
(74,22,10),
(82,23,10),
(90,24,10),
(67,21,11),
(75,22,11),
(83,23,11),
(91,24,11),
(94,25,12),
(97,26,12),
(100,27,12),
(103,28,12),
(95,25,13),
(98,26,13),
(101,27,13),
(104,28,13),
(96,25,14),
(99,26,14),
(102,27,14),
(105,28,14),
(68,21,16),
(76,22,16),
(84,23,16),
(92,24,16),
(5,3,17),
(11,4,17),
(23,6,17),
(17,19,17),
(6,3,18),
(12,4,18),
(33,5,18),
(24,6,18),
(42,10,18),
(51,11,18),
(18,19,18),
(60,20,18),
(34,5,19),
(43,10,19),
(52,11,19),
(61,20,19),
(69,21,20),
(77,22,20),
(85,23,20),
(93,24,20);
/*!40000 ALTER TABLE `business_amenities` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `sector_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sector_id` (`sector_id`),
  CONSTRAINT `fk_sector_id` FOREIGN KEY (`sector_id`) REFERENCES `sectors` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `categories` VALUES
(1,'Food/Drinks',NULL),
(2,'Finincial Services',NULL),
(3,'Hotel/Travels',NULL),
(4,'Health/Medical',NULL),
(5,'Home Services',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `category_search_terms`
--

DROP TABLE IF EXISTS `category_search_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_search_terms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `term` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `category_search_terms_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_search_terms`
--

LOCK TABLES `category_search_terms` WRITE;
/*!40000 ALTER TABLE `category_search_terms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `category_search_terms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `change_request`
--

DROP TABLE IF EXISTS `change_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `change_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_value` text DEFAULT NULL,
  `new_value` text DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `model_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `reviewed_by` int(11) DEFAULT NULL,
  `time` datetime NOT NULL,
  `institution_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_change_request_action` (`action`),
  KEY `idx_change_request_ip` (`ip`),
  KEY `idx_change_request_model` (`model`),
  KEY `idx_change_request_model_id` (`model_id`),
  KEY `idx_change_request_user_agent` (`user_agent`),
  KEY `idx_change_request_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_request`
--

LOCK TABLES `change_request` WRITE;
/*!40000 ALTER TABLE `change_request` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `change_request` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(64) DEFAULT NULL,
  `notification_token` varchar(255) DEFAULT NULL,
  `affiliate_id` int(11) DEFAULT NULL,
  `service_id` varchar(256) DEFAULT NULL,
  `serial_number` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `device_type` tinyint(4) NOT NULL DEFAULT 1,
  `gender` int(11) DEFAULT NULL,
  `age_range` int(11) DEFAULT NULL,
  `language` int(11) DEFAULT NULL,
  `notification_enabled` tinyint(1) DEFAULT 0,
  `apiKey` varchar(225) DEFAULT NULL,
  `nonce` int(11) DEFAULT 0,
  `linkShortCode` varchar(16) DEFAULT NULL,
  `linkShortCodeExp` datetime DEFAULT NULL,
  `phone_number` varchar(64) DEFAULT NULL,
  `latest_hb` datetime DEFAULT NULL,
  `latest_hb_version` varchar(64) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `fk_device_affiliate` (`affiliate_id`),
  KEY `fk_service_device` (`service_id`),
  CONSTRAINT `fk_device_affiliate` FOREIGN KEY (`affiliate_id`) REFERENCES `institution` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `device_heartbeat`
--

DROP TABLE IF EXISTS `device_heartbeat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_heartbeat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `device_id` int(11) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `version` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `device_id_idx` (`device_id`),
  KEY `operator_id_idx` (`operator_id`),
  KEY `time_idx` (`time`),
  KEY `version_idx` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_heartbeat`
--

LOCK TABLES `device_heartbeat` WRITE;
/*!40000 ALTER TABLE `device_heartbeat` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `device_heartbeat` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `institution_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `review_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_institution_id` (`institution_id`),
  KEY `fk_user_id` (`user_id`),
  KEY `fk_review_id` (`review_id`),
  CONSTRAINT `fk_institution_id` FOREIGN KEY (`institution_id`) REFERENCES `institution` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_review_id` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_profile` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `images` VALUES
(1,NULL,2,'jpeg','uploads/1745329854372-240918638.jpeg',NULL,'2025-04-22 11:37:10',NULL),
(2,NULL,4,'jpeg','uploads/1745483916662-857229404.jpeg',NULL,'2025-04-24 06:30:50',NULL),
(4,NULL,13,'jpeg','uploads/1745495694171-292395046.jpeg',NULL,'2025-04-24 09:54:54',NULL),
(5,NULL,26,'jpeg','uploads/1745505763005-23047755.jpeg',NULL,'2025-04-24 12:42:43',NULL),
(6,NULL,25,'jpeg','uploads/1745506285371-698202216.jpg',NULL,'2025-04-24 12:44:07',NULL),
(16,1,NULL,'jpg','uploads/bk1.jpg',NULL,'2025-05-07 07:00:37',NULL),
(17,1,NULL,'jpg','uploads/bk2.jpg',NULL,'2025-05-07 07:00:37',NULL),
(18,1,NULL,'jpeg','uploads/bk3.jpeg',NULL,'2025-05-07 07:00:37',NULL),
(19,1,NULL,'jpeg','uploads/bk4.jpeg',NULL,'2025-05-07 07:00:37',NULL),
(20,3,NULL,'png','uploads/java1.png',NULL,'2025-05-07 07:00:37',NULL),
(21,3,NULL,'jpg','uploads/java2.jpg',NULL,'2025-05-07 07:00:37',NULL),
(22,3,NULL,'jpg','uploads/java3.jpg',NULL,'2025-05-07 07:00:37',NULL),
(23,3,NULL,'jpg','uploads/java4.jpg',NULL,'2025-05-07 07:00:37',NULL),
(24,4,NULL,'png','uploads/hut1.png',NULL,'2025-05-07 07:00:37',NULL),
(25,4,NULL,'jpg','uploads/hut2.jpg',NULL,'2025-05-07 07:00:37',NULL),
(26,4,NULL,'jpg','uploads/hut3.jpg',NULL,'2025-05-07 07:00:37',NULL),
(27,4,NULL,'jpeg','uploads/hut4.jpeg',NULL,'2025-05-07 07:00:37',NULL),
(28,5,NULL,'jpeg','uploads/radisson1.jpeg',NULL,'2025-05-07 07:00:37',NULL),
(29,5,NULL,'jpeg','uploads/radisson2.jpeg',NULL,'2025-05-07 07:00:37',NULL),
(30,5,NULL,'jpeg','uploads/radisson3.jpeg',NULL,'2025-05-07 07:00:37',NULL),
(31,5,NULL,'jpeg','uploads/radisson4.jpeg',NULL,'2025-05-07 07:00:37',NULL),
(32,6,NULL,'jpg','uploads/kurry1.jpg',NULL,'2025-05-07 07:00:37',NULL),
(33,6,NULL,'jpg','uploads/kurry2.jpg',NULL,'2025-05-07 07:00:37',NULL),
(34,6,NULL,'jpg','uploads/kurry3.jpg',NULL,'2025-05-07 07:00:37',NULL),
(35,6,NULL,'jpg','uploads/kurry4.jpg',NULL,'2025-05-07 07:00:37',NULL),
(36,7,NULL,'jpg','uploads/i&m1.jpg',NULL,'2025-05-07 07:00:37',NULL),
(37,7,NULL,'jpg','uploads/i&m2.jpg',NULL,'2025-05-07 07:00:37',NULL),
(38,7,NULL,'jpg','uploads/i&m3.jpg',NULL,'2025-05-07 07:00:37',NULL),
(39,7,NULL,'jpg','uploads/i&m4.jpg',NULL,'2025-05-07 07:00:37',NULL),
(40,8,NULL,'jpg','uploads/cogebanque1.jpg',NULL,'2025-05-07 07:00:37',NULL),
(41,8,NULL,'jpg','uploads/cogebanque2.jpg',NULL,'2025-05-07 07:00:37',NULL),
(42,8,NULL,'jpg','uploads/cogebanque3.jpg',NULL,'2025-05-07 07:00:37',NULL),
(43,8,NULL,'jpg','uploads/cogebanque4.jpg',NULL,'2025-05-07 07:00:37',NULL),
(44,9,NULL,'jpg','uploads/copedu1.jpg',NULL,'2025-05-07 07:00:37',NULL),
(45,9,NULL,'jpg','uploads/copedu2.jpg',NULL,'2025-05-07 07:00:37',NULL),
(46,9,NULL,'jpg','uploads/copedu3.jpg',NULL,'2025-05-07 07:00:37',NULL),
(47,9,NULL,'jpeg','uploads/copedu4.jpeg',NULL,'2025-05-07 07:00:37',NULL),
(48,10,NULL,'png','uploads/marriott1.png',NULL,'2025-05-07 07:00:37',NULL),
(49,10,NULL,'png','uploads/marriott2.png',NULL,'2025-05-07 07:00:37',NULL),
(50,10,NULL,'png','uploads/marriott3.png',NULL,'2025-05-07 07:00:37',NULL),
(51,10,NULL,'png','uploads/marriott4.png',NULL,'2025-05-07 07:00:37',NULL),
(52,11,NULL,'png','uploads/serena1.png',NULL,'2025-05-07 07:00:37',NULL),
(53,11,NULL,'png','uploads/serena2.png',NULL,'2025-05-07 07:00:37',NULL),
(54,11,NULL,'png','uploads/serena3.png',NULL,'2025-05-07 07:00:37',NULL),
(55,11,NULL,'png','uploads/serena4.png',NULL,'2025-05-07 07:00:37',NULL),
(56,19,NULL,'jpeg','uploads/filini1.jpeg',NULL,'2025-05-07 07:00:37',NULL),
(57,19,NULL,'jpg','uploads/filini2.jpg',NULL,'2025-05-07 07:00:37',NULL),
(58,19,NULL,'jpeg','uploads/filini3.jpeg',NULL,'2025-05-07 07:00:37',NULL),
(59,19,NULL,'jpg','uploads/filini4.jpg',NULL,'2025-05-07 07:00:37',NULL),
(60,20,NULL,'jpg','uploads/collines1.jpg',NULL,'2025-05-07 07:00:37',NULL),
(61,20,NULL,'jpg','uploads/collines2.jpg',NULL,'2025-05-07 07:00:37',NULL),
(62,20,NULL,'jpg','uploads/collines3.jpg',NULL,'2025-05-07 07:00:37',NULL),
(63,20,NULL,'jpg','uploads/collines4.jpg',NULL,'2025-05-07 07:00:37',NULL),
(67,NULL,NULL,'png','uploads/kurryreview9.png',NULL,'2025-05-07 07:12:55',9),
(68,NULL,NULL,'jpg','uploads/i&mreview11.jpg',NULL,'2025-05-07 07:12:55',11),
(69,NULL,NULL,'jpg','uploads/cogebanquereview13.jpg',NULL,'2025-05-07 07:12:55',13),
(70,NULL,NULL,'jpg','uploads/copedureview16.jpg',NULL,'2025-05-07 07:12:55',16),
(71,NULL,NULL,'png','uploads/marriottreview17.png',NULL,'2025-05-07 07:12:55',17),
(72,NULL,NULL,'png','uploads/serenareview19.png',NULL,'2025-05-07 07:12:55',19),
(73,NULL,NULL,'png','uploads/filinireview22.png',NULL,'2025-05-07 07:12:55',22),
(74,NULL,NULL,'png','uploads/collinesreview24.png',NULL,'2025-05-07 07:12:55',24),
(75,NULL,NULL,'png','uploads/radissonreview8.png',NULL,'2025-05-07 07:12:55',8),
(76,NULL,NULL,'jpeg','uploads/bkreview1.jpeg',NULL,'2025-05-07 08:19:33',1),
(77,NULL,NULL,'png','uploads/javareview4.png',NULL,'2025-05-07 08:19:33',4),
(78,NULL,NULL,'png','uploads/hutreview6.png',NULL,'2025-05-07 08:19:33',6),
(79,NULL,NULL,'jpeg','uploads/1746701796605-235512481.jpg',NULL,'2025-05-08 08:56:36',41),
(80,NULL,NULL,'jpeg','uploads/1746701864435-709468919.jpg',NULL,'2025-05-08 08:57:44',42),
(81,NULL,NULL,'jpeg','uploads/1746701874177-718943475.jpg',NULL,'2025-05-08 08:57:54',43),
(82,NULL,NULL,'jpeg','uploads/1746701892817-841256244.jpg',NULL,'2025-05-08 08:58:12',44),
(83,NULL,NULL,'jpeg','uploads/1746703016368-79333766.jpeg',NULL,'2025-05-08 09:16:56',45),
(84,NULL,NULL,'jpeg','uploads/1746703030366-103518016.jpeg',NULL,'2025-05-08 09:17:10',46),
(85,21,NULL,NULL,'uploads/faisal1.jpg',NULL,'2025-05-08 11:46:29',NULL),
(86,21,NULL,NULL,'uploads/faisal2.jpg',NULL,'2025-05-08 11:46:29',NULL),
(87,21,NULL,NULL,'uploads/faisal3.jpg',NULL,'2025-05-08 11:46:29',NULL),
(88,21,NULL,NULL,'uploads/faisal4.jpg',NULL,'2025-05-08 11:46:29',NULL),
(89,NULL,NULL,NULL,'uploads/faisalreview47.jpeg',NULL,'2025-05-08 11:46:29',47),
(90,NULL,NULL,NULL,'uploads/faisalreview48.jpeg',NULL,'2025-05-08 11:46:29',48),
(91,22,NULL,NULL,'uploads/mbc1.jpg',NULL,'2025-05-08 11:46:29',NULL),
(92,22,NULL,NULL,'uploads/mbc2.jpg',NULL,'2025-05-08 11:46:29',NULL),
(93,22,NULL,NULL,'uploads/mbc3.jpg',NULL,'2025-05-08 11:46:29',NULL),
(94,22,NULL,NULL,'uploads/mbc4.jpeg',NULL,'2025-05-08 11:46:29',NULL),
(95,23,NULL,NULL,'uploads/ndh1.jpg',NULL,'2025-05-08 11:46:29',NULL),
(96,23,NULL,NULL,'uploads/ndh2.jpg',NULL,'2025-05-08 11:46:29',NULL),
(97,23,NULL,NULL,'uploads/ndh3.jpg',NULL,'2025-05-08 11:46:29',NULL),
(98,23,NULL,NULL,'uploads/ndh4.jpg',NULL,'2025-05-08 11:46:29',NULL),
(99,NULL,NULL,NULL,'uploads/ndhreview51.jpg',NULL,'2025-05-08 11:46:29',51),
(100,NULL,NULL,NULL,'uploads/ndhreview52.jpg',NULL,'2025-05-08 11:46:29',52),
(101,24,NULL,NULL,'uploads/baho1.jpg',NULL,'2025-05-08 11:46:29',NULL),
(102,24,NULL,NULL,'uploads/baho2.jpg',NULL,'2025-05-08 11:46:29',NULL),
(103,24,NULL,NULL,'uploads/baho3.jpg',NULL,'2025-05-08 11:46:29',NULL),
(104,24,NULL,NULL,'uploads/baho4.jpg',NULL,'2025-05-08 11:46:29',NULL),
(105,NULL,NULL,NULL,'uploads/bahoreview53.png',NULL,'2025-05-08 11:46:29',53),
(106,25,NULL,NULL,'uploads/bestair1.png',NULL,'2025-05-08 11:46:29',NULL),
(107,25,NULL,NULL,'uploads/bestair2.png',NULL,'2025-05-08 11:46:29',NULL),
(108,25,NULL,NULL,'uploads/bestair3.png',NULL,'2025-05-08 11:46:29',NULL),
(109,25,NULL,NULL,'uploads/bestair4.png',NULL,'2025-05-08 11:46:29',NULL),
(110,NULL,NULL,NULL,'uploads/bestairreview58.png',NULL,'2025-05-08 11:46:29',58),
(111,26,NULL,NULL,'uploads/dakul1.jpg',NULL,'2025-05-08 11:46:29',NULL),
(112,26,NULL,NULL,'uploads/dakul2.jpeg',NULL,'2025-05-08 11:46:29',NULL),
(113,26,NULL,NULL,'uploads/dakul3.png',NULL,'2025-05-08 11:46:29',NULL),
(114,26,NULL,NULL,'uploads/dakul4.jpg',NULL,'2025-05-08 11:46:29',NULL),
(115,27,NULL,NULL,'uploads/shine1.jpg',NULL,'2025-05-08 11:46:29',NULL),
(116,27,NULL,NULL,'uploads/shine2.jpg',NULL,'2025-05-08 11:46:29',NULL),
(117,27,NULL,NULL,'uploads/shine3.jpg',NULL,'2025-05-08 11:46:29',NULL),
(118,27,NULL,NULL,'uploads/shine4.jpg',NULL,'2025-05-08 11:46:29',NULL),
(119,28,NULL,NULL,'uploads/stellar1.jpg',NULL,'2025-05-08 11:46:29',NULL),
(120,28,NULL,NULL,'uploads/stellar2.jpeg',NULL,'2025-05-08 11:46:29',NULL),
(121,28,NULL,NULL,'uploads/stellar3.jpeg',NULL,'2025-05-08 11:46:29',NULL),
(122,28,NULL,NULL,'uploads/stellar4.jpeg',NULL,'2025-05-08 11:46:29',NULL),
(123,NULL,NULL,NULL,'uploads/stellarreview61.jpeg',NULL,'2025-05-08 11:46:29',61),
(124,NULL,NULL,NULL,'uploads/stellarreview62.jpeg',NULL,'2025-05-08 11:46:29',62),
(134,NULL,62,'png','uploads/1747144356640-912720792.png',NULL,'2025-05-13 11:34:13',NULL),
(135,NULL,63,'jpeg','uploads/1747143809915-909603699.jpg',NULL,'2025-05-13 11:43:29',NULL),
(136,NULL,NULL,'png','uploads/1747311377579-377106537.png',NULL,'2025-05-15 10:16:17',63),
(137,NULL,NULL,'png','uploads/1747311389306-371436614.png',NULL,'2025-05-15 10:16:29',64),
(138,NULL,NULL,'png','uploads/1747311436004-408667963.png',NULL,'2025-05-15 10:17:16',65),
(139,NULL,NULL,'png','uploads/1747311534268-352690271.png',NULL,'2025-05-15 10:18:54',66),
(140,NULL,NULL,'png','uploads/1747312026483-650991032.png',NULL,'2025-05-15 10:27:06',67),
(141,NULL,68,'png','uploads/1747313699932-483898111.png',NULL,'2025-05-15 10:33:16',NULL),
(142,NULL,NULL,'jpeg','uploads/1747381675664-474244313.jpeg',NULL,'2025-05-16 05:47:55',68),
(143,NULL,NULL,'png','uploads/1747382206976-977398559.png',NULL,'2025-05-16 05:56:47',69),
(144,NULL,NULL,'jpeg','uploads/1747382642147-92995812.jpg',NULL,'2025-05-16 06:04:02',70),
(145,NULL,NULL,'png','uploads/1747384203129-421738669.png',NULL,'2025-05-16 06:30:03',71),
(146,NULL,73,'png','uploads/1747386983448-856094415.png',NULL,'2025-05-16 07:04:49',NULL),
(147,NULL,NULL,'png','uploads/1747387462647-390346120.png',NULL,'2025-05-16 07:24:22',72),
(148,NULL,NULL,'png','uploads/1747388219016-658941277.png',NULL,'2025-05-16 07:36:59',73),
(149,NULL,NULL,'png','uploads/1747394640270-796662093.png',NULL,'2025-05-16 09:24:00',74),
(150,NULL,79,'png','uploads/1747730053969-286330762.png',NULL,'2025-05-20 06:20:15',NULL),
(151,NULL,NULL,'png','uploads/1747733450760-956186621.png',NULL,'2025-05-20 07:30:50',75),
(152,NULL,NULL,'png','uploads/1747733588431-59580713.png',NULL,'2025-05-20 07:33:08',76),
(153,NULL,NULL,'png','uploads/1747815628321-203938104.png',NULL,'2025-05-21 06:20:28',77),
(154,NULL,NULL,'png','uploads/1747816652217-831454088.png',NULL,'2025-05-21 06:37:32',78),
(155,NULL,NULL,'jpeg','uploads/1747835625002-558943443.jpeg',NULL,'2025-05-21 11:53:45',79);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `institution`
--

DROP TABLE IF EXISTS `institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `institution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(64) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `search_term` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `plan` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `level` tinyint(4) DEFAULT 2,
  `parent_id` int(11) DEFAULT NULL,
  `good_ratings` int(11) DEFAULT NULL,
  `bad_ratings` int(11) DEFAULT NULL,
  `excellent_ratings` int(11) DEFAULT NULL,
  `nps` int(11) DEFAULT NULL,
  `csat` int(11) DEFAULT NULL,
  `queue_autocreation` tinyint(4) DEFAULT 0,
  `queue_manual_creation` tinyint(4) DEFAULT 1,
  `working_hours` varchar(256) DEFAULT NULL,
  `qms_message` varchar(256) DEFAULT NULL,
  `priority_list` longtext DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `app_name` varchar(255) DEFAULT NULL,
  `allowed_context` tinyint(4) DEFAULT 1,
  `host_name` varchar(255) DEFAULT NULL,
  `membership_type` int(11) NOT NULL DEFAULT 1,
  `category_id` int(11) DEFAULT NULL,
  `latest_membership_renew_time` datetime DEFAULT NULL,
  `description` text DEFAULT NULL,
  `latitude` varchar(200) DEFAULT NULL,
  `longitude` varchar(200) DEFAULT NULL,
  `button_one` longtext DEFAULT NULL,
  `button_two` longtext DEFAULT NULL,
  `amenities` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `institution_uuid` (`uuid`),
  KEY `fk_category_id` (`category_id`),
  KEY `fk_institution_plan` (`plan`),
  CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution`
--

LOCK TABLES `institution` WRITE;
/*!40000 ALTER TABLE `institution` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `institution` VALUES
(1,NULL,'Bank of Kigali Plc',NULL,'bk@bk.rw','KN 4 Avenue, No. 12, Plot No. 790, P.O. Box 175, Nyarugenge District, Kigali, Rwanda','4455','https://www.bk.rw',0,'2025-04-24 09:38:08',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,1,NULL,1,2,NULL,'Bank of Kigali Plc is the largest commercial bank in Rwanda, offering a comprehensive range of financial services including loans, savings, investments, mortgages, internet banking, and insurance. Established in 1966, it operates under a license from the National Bank of Rwanda and is listed on both the Rwanda Stock Exchange and the Nairobi Securities Exchange.','-1.948333','30.059722','{   \"label\": \"Visit Our Page\",   \"type\": \"link\",   \"url\": \"https://www.bk.rw/\" }','{     \"label\": \"Our Services\",     \"type\": \"popup\",     \"sections\": [       {         \"title\": \"Personal Banking\",         \"items\": [           { \"name\": \"Savings Accounts\" },           { \"name\": \"Personal Loans\" },           { \"name\": \"Debit & Credit Cards\" }         ]       },       {         \"title\": \"Business Banking\",         \"items\": [           { \"name\": \"Business Accounts\" },           { \"name\": \"Commercial Loans\" },           { \"name\": \"Merchant Services\" }         ]       },       {         \"title\": \"Other Services\",         \"items\": [           { \"name\": \"Mobile Banking\" },           { \"name\": \"ATM Locator\" },           { \"name\": \"Forex Services\" }         ]       }     ]   }',NULL),
(3,NULL,'Java House Kigali Heights',NULL,'info@javahouseafrica.com','KG 7 Avenue, Kigali Heights, Kigali, Rwanda','+250 788 381 132','https://javahouseafrica.com',0,'2025-04-24 12:28:13',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,1,NULL,1,1,NULL,'Java House Kigali Heights is a popular café and restaurant located in the Kigali Heights complex, offering a diverse menu that includes breakfast items, Mexican dishes, pastries, and locally sourced Rwandan coffee. The establishment features both indoor and outdoor seating, providing a vibrant atmosphere suitable for various dining occasions.','-1.9533','30.0932','{        \"label\": \"$\",        \"type\": \"tooltip\",        \"content\": [              \"$: Between 1,000 RWF and 12,000 RWF\",         \"$$: Between 12,000 RWF and 30,000 RWF\",         \"$$$: Between 30,000 RWF and 54,000 RWF\",         \"$$$$: 60,000 RWF and above\"      ]  }','{        \"label\": \"View Our Menu\",        \"type\": \"link\",        \"url\": \"https://javahousetesting.com/wp-content/uploads/2022/04/Java_A4_Kigali_Master_Menu-2.pdf\"  }',NULL),
(4,NULL,'The Hut Restaurant & Boutique Hotel ',NULL,'reservation@thehuthotelrwanda.com','KG 646 Street No.1, Rugando, Kimihurura (Behind Kigali Convention Center), Kigali, Rwanda','+250 783 419 980','https://thehuthotelrwanda.com',0,'2025-04-24 12:33:12',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,1,NULL,1,1,NULL,'The Hut Restaurant & Boutique Hotel is a modern establishment in Kigali, Rwanda, offering a blend of international cuisine and comfortable accommodations. The restaurant features a diverse menu with fresh ingredients, while the boutique hotel provides well-appointed rooms, a rooftop restaurant with scenic views, an outdoor swimming pool, spa services, and a fitness center. Located in a serene neighborhood behind the Kigali Convention Center, it offers a peaceful atmosphere for guests.','-1.9515','30.0932','{        \"label\": \"$\",        \"type\": \"tooltip\",        \"content\": [              \"$: Between 1,000 RWF and 12,000 RWF\",         \"$$: Between 12,000 RWF and 30,000 RWF\",         \"$$$: Between 30,000 RWF and 54,000 RWF\",         \"$$$$: 60,000 RWF and above\"      ]  }','{        \"label\": \"View Our Menu\",        \"type\": \"link\",        \"url\": \"https://thehuthotelrwanda.com/online-ordering/#/products\"  }',NULL),
(5,NULL,'Radisson Blu Hotel & Convention Centre Kigali',NULL,'info.kigali@radissonblu.com','Kimihurura Roundabout, KG 2 Roundabout, P.O. Box 6629, Kigali, Rwanda','+250 252 252 252','https://www.radissonhotels.com/en-us/hotels/radisson-blu-convention-kigali',0,'2025-04-24 12:33:12',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,1,NULL,1,3,NULL,'The Radisson Blu Hotel & Convention Centre in Kigali is a premier 5-star establishment offering 292 modern rooms and suites. Strategically located adjacent to the Kigali Convention Centre, it provides state-of-the-art meeting facilities, a wellness spa, fitness center, outdoor pool, and diverse dining options. Its proximity to Kigali International Airport and the city center makes it ideal for both business and leisure travelers.','-1.95465','30.092757','{   \"label\": \"Visit Our Page\",   \"type\": \"link\",   \"url\": \"https://www.radissonhotels.com/en-us/hotels/radisson-blu-convention-kigali\" }','{     \"label\": \"View Our Services\",     \"type\": \"popup\",     \"sections\": [       {         \"title\": \"Dinning\",         \"items\": [           {             \"name\": \"Cuccina restaurant\",             \"days\": \"Every day\",             \"time\": \"12:30PM-2:30PM\"           },           {             \"name\": \"Iriba Bar & Terrace\",             \"days\": \"Every day\",             \"time\": \"12:30PM-2:30PM\"           },           {             \"name\": \"Soko restaurant\",             \"days\": \"Every day\",             \"time\": \"12:30PM-2:30PM\"           }         ]       },       {         \"title\": \"Experiences\",         \"items\": [           {             \"name\": \"Fitness Center\",             \"days\": \"Every day\",             \"time\": \"12:30PM-2:30PM\"           },           {             \"name\": \"Swimming Pool\",             \"days\": \"Every day\",             \"time\": \"12:30PM-2:30PM\"           },           {             \"name\": \"Saray Spa\",             \"days\": \"Every day\",             \"time\": \"12:30PM-2:30PM\"           }         ]       },       {         \"title\": \"Event Spaces\",         \"items\": [           {             \"name\": \"Meeting & Events\",             \"days\": \"Friday & Saturday\",             \"time\": \"12:30PM-2:30PM\"           },           {             \"name\": \"Weddings\",             \"days\": \"Friday-Sunday\",             \"time\": \"12:30PM-2:30PM\"           },           {             \"name\": \"Event Spaces\",             \"days\": \"Monday, Wednesday, Thursday\",             \"time\": \"12:30PM-2:30PM\"           }         ]       }     ]   }',NULL),
(6,NULL,'Kurry Kingdom',NULL,'kingdomkurry@gmail.com','House No.24, KG 5 Avenue, Kacyiru, Kigali, Rwanda','+250 787 605 789','https://kurrykingdom.rw',0,'2025-04-24 12:33:12',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,1,NULL,1,1,NULL,'Kurry Kingdom is a fine dining Indian restaurant located in Kigali’s Kacyiru district. Housed in a beautifully renovated colonial residence, it offers a blend of traditional Indian cuisine and contemporary culinary creations. The restaurant features multiple dining areas, including a serene garden pavilion, and is known for its authentic North and South Indian dishes prepared with freshly ground herbs and spices. Kurry Kingdom caters to various dietary preferences and is a popular spot for both casual dining and special occasions.','-1.94565','30.08912','{        \"label\": \"$\",        \"type\": \"tooltip\",        \"content\": [              \"$: Between 1,000 RWF and 12,000 RWF\",         \"$$: Between 12,000 RWF and 30,000 RWF\",         \"$$$: Between 30,000 RWF and 54,000 RWF\",         \"$$$$: 60,000 RWF and above\"      ]  }','{        \"label\": \"View Our Menu\",        \"type\": \"link\",        \"url\": \"https://kurrykingdom.rw/#\"  }',NULL),
(7,NULL,'I&M Bank Rwanda',NULL,'info@imbank.co.rw','KN 03 Avenue, No. 9, Nyarugenge District, Kigali, Rwanda','+250 788 162 006','https://www.imbankgroup.com/rw',0,'2025-04-24 13:03:04',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,1,NULL,1,2,NULL,'I&M Bank (Rwanda) Plc is one of Rwanda’s leading commercial banks, offering a wide range of personal, business, and corporate banking services. Established in 1963 as the Banque Commerciale du Rwanda (BCR), it was acquired by I&M Group in 2012 and rebranded in 2013. The bank is part of the I&M Group, which operates across East Africa, and is regulated by the National Bank of Rwanda.','-1.94929','30.06148','{   \"label\": \"Visit Our Page\",   \"type\": \"link\",   \"url\": \"https://www.imbankgroup.com/rw\" }','{     \"label\": \"Our Services\",     \"type\": \"popup\",     \"sections\": [       {         \"title\": \"Personal Banking\",         \"items\": [           { \"name\": \"Savings Accounts\" },           { \"name\": \"Personal Loans\" },           { \"name\": \"Debit & Credit Cards\" }         ]       },       {         \"title\": \"Business Banking\",         \"items\": [           { \"name\": \"Business Accounts\" },           { \"name\": \"Commercial Loans\" },           { \"name\": \"Merchant Services\" }         ]       },       {         \"title\": \"Other Services\",         \"items\": [           { \"name\": \"Mobile Banking\" },           { \"name\": \"ATM Locator\" },           { \"name\": \"Forex Services\" }         ]       }     ]   }',NULL),
(8,NULL,'COGEBANQUE',NULL,'customercare@cogebank.com','Centenary House, KN 63 Street, Avenue de l’Paix, Kigali, Rwanda','+250 788 155 500','https://www.cogebanque.co.rw',0,'2025-04-24 13:03:04',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,1,NULL,1,2,NULL,'COGEBANQUE, officially known as Compagnie Générale de Banque, is a Rwandan commercial bank established in 1999. It offers a range of financial services, including loans and savings, with a focus on customer service and financial inclusivity. In November 2023, Equity Group Holdings Plc acquired a 99.125% stake in COGEBANQUE, making it a subsidiary.','-1.9462','30.0606','{   \"label\": \"Visit Our Page\",   \"type\": \"link\",   \"url\": \"https://www.cogebanque.rw/\" }','{     \"label\": \"Our Services\",     \"type\": \"popup\",     \"sections\": [       {         \"title\": \"Personal Banking\",         \"items\": [           { \"name\": \"Savings Accounts\" },           { \"name\": \"Personal Loans\" },           { \"name\": \"Debit & Credit Cards\" }         ]       },       {         \"title\": \"Business Banking\",         \"items\": [           { \"name\": \"Business Accounts\" },           { \"name\": \"Commercial Loans\" },           { \"name\": \"Merchant Services\" }         ]       },       {         \"title\": \"Other Services\",         \"items\": [           { \"name\": \"Mobile Banking\" },           { \"name\": \"ATM Locator\" },           { \"name\": \"Forex Services\" }         ]       }     ]   }',NULL),
(9,NULL,'COPEDU PLC',NULL,'info@copeduplc.rw','KN 03 Rd, African Union Road, Kicukiro District, Kigali, Rwanda','2012','https://copeduplc.rw',0,'2025-04-24 13:03:04',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,1,NULL,1,2,NULL,'COPEDU PLC is a well-established microfinance institution in Rwanda, licensed by the National Bank of Rwanda (BNR). Founded in 1997, it transitioned from a cooperative to a public limited company in 2013. COPEDU offers a range of financial services, including savings and credit loans, aiming to foster financial inclusion and empower individuals and businesses across Rwanda.','-1.96102','30.11986','{   \"label\": \"Visit Our Page\",   \"type\": \"link\",   \"url\": \"https://copeduplc.rw\" }','{     \"label\": \"Our Services\",     \"type\": \"popup\",     \"sections\": [       {         \"title\": \"Personal Banking\",         \"items\": [           { \"name\": \"Savings Accounts\" },           { \"name\": \"Personal Loans\" },           { \"name\": \"Debit & Credit Cards\" }         ]       },       {         \"title\": \"Business Banking\",         \"items\": [           { \"name\": \"Business Accounts\" },           { \"name\": \"Commercial Loans\" },           { \"name\": \"Merchant Services\" }         ]       },       {         \"title\": \"Other Services\",         \"items\": [           { \"name\": \"Mobile Banking\" },           { \"name\": \"ATM Locator\" },           { \"name\": \"Forex Services\" }         ]       }     ]   }',NULL),
(10,NULL,'Kigali Marriott Hotel',NULL,'reservations.kigali@marriott.com','KN 3 Avenue, Nyarugenge District, Kigali, Rwanda','+250 222 111 111','https://www.marriott.com/en-us/hotels/kglmc-kigali-marriott-hotel/overview/',0,'2025-04-24 13:05:01',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,1,NULL,1,3,NULL,'Kigali Marriott Hotel is a premier 5-star hotel located in the heart of Rwanda’s capital city. The hotel offers luxurious accommodations with floor-to-ceiling windows, marble bathrooms, and modern amenities. Guests can enjoy a variety of on-site facilities, including multiple dining options, a fitness center, spa, outdoor pool, and extensive meeting and event spaces. Its central location provides easy access to the city’s financial district, embassies, and cultural attractions, making it ideal for both business and leisure travelers.','-1.95374','30.06235','{   \"label\": \"Visit Our Page\",   \"type\": \"link\",   \"url\": \"https://www.marriott.com/en-us/hotels/kglmc-kigali-marriott-hotel/overview/\" }','{     \"label\": \"View Our Services\",     \"type\": \"popup\",     \"sections\": [       {         \"title\": \"Dinning\",         \"items\": [           {             \"name\": \"Cuccina restaurant\",             \"days\": \"Every day\",             \"time\": \"12:30PM-2:30PM\"           },           {             \"name\": \"Iriba Bar & Terrace\",             \"days\": \"Every day\",             \"time\": \"12:30PM-2:30PM\"           },           {             \"name\": \"Soko restaurant\",             \"days\": \"Every day\",             \"time\": \"12:30PM-2:30PM\"           }         ]       },       {         \"title\": \"Experiences\",         \"items\": [           {             \"name\": \"Fitness Center\",             \"days\": \"Every day\",             \"time\": \"12:30PM-2:30PM\"           },           {             \"name\": \"Swimming Pool\",             \"days\": \"Every day\",             \"time\": \"12:30PM-2:30PM\"           },           {             \"name\": \"Saray Spa\",             \"days\": \"Every day\",             \"time\": \"12:30PM-2:30PM\"           }         ]       },       {         \"title\": \"Event Spaces\",         \"items\": [           {             \"name\": \"Meeting & Events\",             \"days\": \"Friday & Saturday\",             \"time\": \"12:30PM-2:30PM\"           },           {             \"name\": \"Weddings\",             \"days\": \"Friday-Sunday\",             \"time\": \"12:30PM-2:30PM\"           },           {             \"name\": \"Event Spaces\",             \"days\": \"Monday, Wednesday, Thursday\",             \"time\": \"12:30PM-2:30PM\"           }         ]       }     ]   }',NULL),
(11,NULL,'Kigali Serena Hotel',NULL,'kigali@serenahotels.com','KN 3 Avenue, Nyarugenge District, Kigali, Rwanda','+250 252 597 100','https://www.serenahotels.com/kigali',0,'2025-04-25 05:30:40',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,1,NULL,1,3,NULL,'Kigali Serena Hotel is a 5-star luxury hotel situated in the heart of Kigali, just a five-minute walk from the Central Business District and approximately 10 kilometers from Kigali International Airport. The hotel features 148 rooms and suites that blend Rwandan heritage with contemporary comfort. Amenities include an outdoor swimming pool, spa, fitness center, and multiple dining options such as the Milima Restaurant and Sokoni Café and Bar. The hotel is a preferred choice for international diplomats and executives seeking a private and peaceful retreat.','-1.9563339','30.0627322','{   \"label\": \"Visit Our Page\",   \"type\": \"link\",   \"url\": \"https://www.serenahotels.com/kigali\" }','{     \"label\": \"View Our Services\",     \"type\": \"popup\",     \"sections\": [       {         \"title\": \"Dinning\",         \"items\": [           {             \"name\": \"Cuccina restaurant\",             \"days\": \"Every day\",             \"time\": \"12:30PM-2:30PM\"           },           {             \"name\": \"Iriba Bar & Terrace\",             \"days\": \"Every day\",             \"time\": \"12:30PM-2:30PM\"           },           {             \"name\": \"Soko restaurant\",             \"days\": \"Every day\",             \"time\": \"12:30PM-2:30PM\"           }         ]       },       {         \"title\": \"Experiences\",         \"items\": [           {             \"name\": \"Fitness Center\",             \"days\": \"Every day\",             \"time\": \"12:30PM-2:30PM\"           },           {             \"name\": \"Swimming Pool\",             \"days\": \"Every day\",             \"time\": \"12:30PM-2:30PM\"           },           {             \"name\": \"Saray Spa\",             \"days\": \"Every day\",             \"time\": \"12:30PM-2:30PM\"           }         ]       },       {         \"title\": \"Event Spaces\",         \"items\": [           {             \"name\": \"Meeting & Events\",             \"days\": \"Friday & Saturday\",             \"time\": \"12:30PM-2:30PM\"           },           {             \"name\": \"Weddings\",             \"days\": \"Friday-Sunday\",             \"time\": \"12:30PM-2:30PM\"           },           {             \"name\": \"Event Spaces\",             \"days\": \"Monday, Wednesday, Thursday\",             \"time\": \"12:30PM-2:30PM\"           }         ]       }     ]   }',NULL),
(19,NULL,'Filini Restaurant',NULL,'kcc.kigali@radissonblu.com','Kimihurura Roundabout, P.O. Box 6629, Kigali, Rwanda','+250 252 252 252','https://www.kcc.rw/filini_main.html',0,'2025-05-07 05:51:03',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,1,NULL,1,1,NULL,'Filini Restaurant offers an authentic Italian dining experience in the heart of Kigali. Situated within the Radisson Blu Hotel & Convention Centre, the restaurant boasts a sophisticated ambiance complemented by contemporary design. Guests can indulge in a menu that features classic Italian dishes crafted with fresh ingredients, alongside a curated selection of wines and signature cocktails. Whether you’re in the mood for a hearty pasta, a wood-fired pizza, or a delectable dessert, Filini promises a culinary journey that captures the essence of Italy.','-1.95465','30.092757','{        \"label\": \"$\",        \"type\": \"tooltip\",        \"content\": [              \"$: Between 1,000 RWF and 12,000 RWF\",         \"$$: Between 12,000 RWF and 30,000 RWF\",         \"$$$: Between 30,000 RWF and 54,000 RWF\",         \"$$$$: 60,000 RWF and above\"      ]  }','{        \"label\": \"View Our Menu\",        \"type\": \"link\",        \"url\": \"https://www.visitrwanda.com/wp-content/uploads/2020/07/Filini-Menu-May-2020-Two-Face.pdf\"  }',NULL),
(20,NULL,'Hôtel des Mille Collines',NULL,'info@millecollines.rw','2 KN 6th Avenue, Nyarugenge District, Kigali, Rwanda','+250 788 192 000','https://www.millecollines.rw',0,'2025-05-07 05:51:03',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,1,NULL,1,3,NULL,'Hôtel des Mille Collines is a historic 4-star hotel located in the heart of Kigali’s central business district. Inaugurated in 1973, the hotel gained international recognition during the 1994 Rwandan Genocide, where it provided refuge to over 1,200 people—a story later depicted in the film Hotel Rwanda. The hotel offers 112 rooms and suites, a restaurant, bar, outdoor swimming pool, tennis courts, and conference facilities, making it a prominent destination for both business and leisure travelers.','-1.9469','30.0619','{   \"label\": \"Visit Our Page\",   \"type\": \"link\",   \"url\": \"https://www.millecollines.rw/\" }','{     \"label\": \"View Our Services\",     \"type\": \"popup\",     \"sections\": [       {         \"title\": \"Dinning\",         \"items\": [           {             \"name\": \"Cuccina restaurant\",             \"days\": \"Every day\",             \"time\": \"12:30PM-2:30PM\"           },           {             \"name\": \"Iriba Bar & Terrace\",             \"days\": \"Every day\",             \"time\": \"12:30PM-2:30PM\"           },           {             \"name\": \"Soko restaurant\",             \"days\": \"Every day\",             \"time\": \"12:30PM-2:30PM\"           }         ]       },       {         \"title\": \"Experiences\",         \"items\": [           {             \"name\": \"Fitness Center\",             \"days\": \"Every day\",             \"time\": \"12:30PM-2:30PM\"           },           {             \"name\": \"Swimming Pool\",             \"days\": \"Every day\",             \"time\": \"12:30PM-2:30PM\"           },           {             \"name\": \"Saray Spa\",             \"days\": \"Every day\",             \"time\": \"12:30PM-2:30PM\"           }         ]       },       {         \"title\": \"Event Spaces\",         \"items\": [           {             \"name\": \"Meeting & Events\",             \"days\": \"Friday & Saturday\",             \"time\": \"12:30PM-2:30PM\"           },           {             \"name\": \"Weddings\",             \"days\": \"Friday-Sunday\",             \"time\": \"12:30PM-2:30PM\"           },           {             \"name\": \"Event Spaces\",             \"days\": \"Monday, Wednesday, Thursday\",             \"time\": \"12:30PM-2:30PM\"           }         ]       }     ]   }',NULL),
(21,NULL,'King Faisal Hospital Rwanda',NULL,'info@kfhkigali.com','KG 544 Street 10, Kacyiru, Gasabo, Kigali, Rwanda','+250 788 123 200','https://kfh.rw/',0,'2025-05-08 07:37:27',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,1,NULL,1,4,NULL,'King Faisal Hospital Rwanda is a multi-specialty quaternary hospital providing specialized healthcare in East and Central Africa. With state-of-the-art amenities, equipment, and well-trained staff, it is committed to delivering accessible, affordable, and high-quality care to patients.','-1.9469','30.0619','{   \"label\": \"Visit Our Page\",   \"type\": \"link\",   \"url\": \"https://kfh.rw/\" }','{   \"label\": \"View Our Services\",   \"type\": \"popup\",   \"sections\": [     {       \"title\": \"Outpatient Services\",       \"items\": [         { \"name\": \"General Consultation\" },         { \"name\": \"Specialist Clinics\" },         { \"name\": \"Emergency Care\" }       ]     },     {       \"title\": \"Inpatient Services\",       \"items\": [         { \"name\": \"Surgery\" },         { \"name\": \"Maternity Ward\" },         { \"name\": \"ICU & HDU\" }       ]     },     {       \"title\": \"Diagnostic Services\",       \"items\": [         { \"name\": \"Laboratory Testing\" },         { \"name\": \"Radiology (X-ray, MRI, CT)\" },         { \"name\": \"Ultrasound\" }       ]     }   ] }',NULL),
(22,NULL,'MBC Hospital',NULL,'info@mbchospital.rw','KN 7 Ave, Kigali, Rwanda','+250 787 233 553','https://pharma.rw/places/mbc-hospital/',0,'2025-05-08 07:37:27',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,1,NULL,1,4,NULL,'MBC Hospital is a private healthcare facility offering a range of services including emergency care, internal medicine, surgery, obstetrics & gynecology, and more. The hospital emphasizes patient safety, cleanliness, and compassionate care.','-1.9446','30.0615','{   \"label\": \"Visit Our Page\",   \"type\": \"link\",   \"url\": \"https://pharma.rw/places/mbc-hospital/\" }','{   \"label\": \"View Our Services\",   \"type\": \"popup\",   \"sections\": [     {       \"title\": \"Outpatient Services\",       \"items\": [         { \"name\": \"General Consultation\" },         { \"name\": \"Specialist Clinics\" },         { \"name\": \"Emergency Care\" }       ]     },     {       \"title\": \"Inpatient Services\",       \"items\": [         { \"name\": \"Surgery\" },         { \"name\": \"Maternity Ward\" },         { \"name\": \"ICU & HDU\" }       ]     },     {       \"title\": \"Diagnostic Services\",       \"items\": [         { \"name\": \"Laboratory Testing\" },         { \"name\": \"Radiology (X-ray, MRI, CT)\" },         { \"name\": \"Ultrasound\" }       ]     }   ] }',NULL),
(23,NULL,'Nyarugenge District Hospital',NULL,'info@nyarugengehospital.gov.rw','KN 247 St, Nyarugenge, Kigali, Rwanda','+250 790 666 663','https://www.nyarugengehospital.gov.rw/home',0,'2025-05-08 07:37:27',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,1,NULL,1,4,NULL,'Nyarugenge District Hospital provides comprehensive healthcare services including emergency care, maternal health, and surgical services. The hospital is known for its commitment to patient-centered care and community health initiatives.','-1.9442','30.0610','{   \"label\": \"Visit Our Page\",   \"type\": \"link\",   \"url\": \"https://www.nyarugengehospital.gov.rw/home\" }','{   \"label\": \"View Our Services\",   \"type\": \"popup\",   \"sections\": [     {       \"title\": \"Outpatient Services\",       \"items\": [         { \"name\": \"General Consultation\" },         { \"name\": \"Specialist Clinics\" },         { \"name\": \"Emergency Care\" }       ]     },     {       \"title\": \"Inpatient Services\",       \"items\": [         { \"name\": \"Surgery\" },         { \"name\": \"Maternity Ward\" },         { \"name\": \"ICU & HDU\" }       ]     },     {       \"title\": \"Diagnostic Services\",       \"items\": [         { \"name\": \"Laboratory Testing\" },         { \"name\": \"Radiology (X-ray, MRI, CT)\" },         { \"name\": \"Ultrasound\" }       ]     }   ] }',NULL),
(24,NULL,'Baho International Hospital',NULL,'info@baho.rw','KG 9 Ave 42, Nyarutarama, Kigali, Rwanda','+250 782 343 710','https://x.com/bahointhospital',0,'2025-05-08 07:37:27',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,1,NULL,1,4,NULL,'Baho International Hospital is a private healthcare facility offering a range of medical services. Located in the Nyarutarama area, it provides 24-hour services with a focus on patient comfort and quality care.','-1.9379','30.1015','{   \"label\": \"Visit Our Page\",   \"type\": \"link\",   \"url\": \"https://x.com/bahointhospital\" }','{   \"label\": \"View Our Services\",   \"type\": \"popup\",   \"sections\": [     {       \"title\": \"Outpatient Services\",       \"items\": [         { \"name\": \"General Consultation\" },         { \"name\": \"Specialist Clinics\" },         { \"name\": \"Emergency Care\" }       ]     },     {       \"title\": \"Inpatient Services\",       \"items\": [         { \"name\": \"Surgery\" },         { \"name\": \"Maternity Ward\" },         { \"name\": \"ICU & HDU\" }       ]     },     {       \"title\": \"Diagnostic Services\",       \"items\": [         { \"name\": \"Laboratory Testing\" },         { \"name\": \"Radiology (X-ray, MRI, CT)\" },         { \"name\": \"Ultrasound\" }       ]     }   ] }',NULL),
(25,NULL,'BestAir Cleaning Services',NULL,'info@bestaircleaningservice.rw','KG 688 St 1, Kigali, Rwanda','+250 794 762 218','https://www.bestaircleaningservice.rw/',0,'2025-05-08 07:50:29',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,1,NULL,1,5,NULL,'BestAir Cleaning Services offers professional cleaning solutions for both residential and commercial spaces. Their services include emergency cleaning, event cleaning, post-construction cleaning, industrial cleaning, fumigation, gardening, and maintenance. They utilize modern equipment and eco-friendly products to ensure a healthy environment.','-1.9579','30.1127','{   \"label\": \"Visit Our Page\",   \"type\": \"link\",   \"url\": \"https://x.com/bahointhospital\" }','{   \"label\": \"View Our Services\",   \"type\": \"popup\",   \"sections\": [     {       \"title\": \"Residential Cleaning\",       \"items\": [         { \"name\": \"Home Deep Cleaning\" },         { \"name\": \"Upholstery Cleaning\" },         { \"name\": \"Pest Control\" }       ]     },     {       \"title\": \"Commercial Cleaning\",       \"items\": [         { \"name\": \"Office Cleaning\" },         { \"name\": \"Window Cleaning\" },         { \"name\": \"Sanitization Services\" }       ]     }   ] }',NULL),
(26,NULL,'Dakul Clean',NULL,'info@dakulclean.com','CHIC Building E042B, Nyarugenge, Kigali, Rwanda','+250 783 215 763','https://www.dakulclean.com/',0,'2025-05-08 07:50:29',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,1,NULL,1,5,NULL,'Dakul Clean provides a range of cleaning services, including after-builders cleaning, commercial cleaning, office cleaning, property management cleaning, and specialized services like rug and oven cleaning. They emphasize professionalism and eco-friendly practices.',' -1.9441','30.0619','{   \"label\": \"Visit Our Page\",   \"type\": \"link\",   \"url\": \"https://www.dakulclean.com/\" }','{   \"label\": \"View Our Services\",   \"type\": \"popup\",   \"sections\": [     {       \"title\": \"Residential Cleaning\",       \"items\": [         { \"name\": \"Home Deep Cleaning\" },         { \"name\": \"Upholstery Cleaning\" },         { \"name\": \"Pest Control\" }       ]     },     {       \"title\": \"Commercial Cleaning\",       \"items\": [         { \"name\": \"Office Cleaning\" },         { \"name\": \"Window Cleaning\" },         { \"name\": \"Sanitization Services\" }       ]     }   ] }',NULL),
(27,NULL,'Shine Home Ltd',NULL,'info@shinehome.co.rw','KK 191 St, Kigali, Rwanda','+250 788 450 999','https://www.shinehome.co.rw/',0,'2025-05-08 07:50:29',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,1,NULL,1,5,NULL,'Shine Home Ltd offers comprehensive cleaning services, including residential and office cleaning, general disinfection, tile and paver cleaning, safe relocation, and carpet and sofa cleaning. They are known for their fast, reliable, and health-conscious cleaning solutions.','-1.9441','30.0619','{   \"label\": \"Visit Our Page\",   \"type\": \"link\",   \"url\": \"https://www.shinehome.co.rw/\" }','{   \"label\": \"View Our Services\",   \"type\": \"popup\",   \"sections\": [     {       \"title\": \"Residential Cleaning\",       \"items\": [         { \"name\": \"Home Deep Cleaning\" },         { \"name\": \"Upholstery Cleaning\" },         { \"name\": \"Pest Control\" }       ]     },     {       \"title\": \"Commercial Cleaning\",       \"items\": [         { \"name\": \"Office Cleaning\" },         { \"name\": \"Window Cleaning\" },         { \"name\": \"Sanitization Services\" }       ]     }   ] }',NULL),
(28,NULL,'Stellar Engineering Ltd',NULL,'stellarrwanda@gmail.com','KN 7 Ave, 159 St, Kigali','+250 788 267 679','http://stellarengi.com/',0,'2025-05-08 07:50:29',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,1,NULL,1,5,NULL,'Stellar Engineering Ltd is a leading construction company in Rwanda, offering a wide range of services including electrical installations, plumbing, welding, and maintenance services. They are known for their expertise in MEP (Mechanical, Electrical, and Plumbing) projects.','-1.9441','30.0619','{   \"label\": \"Visit Our Page\",   \"type\": \"link\",   \"url\": \"http://stellarengi.com/\" }','{   \"label\": \"View Our Services\",   \"type\": \"popup\",   \"sections\": [     {       \"title\": \"Core Services\",       \"items\": [         { \"name\": \"Residential Projects\" },         { \"name\": \"Commercial Buildings\" },         { \"name\": \"Renovation & Remodeling\" }       ]     },     {       \"title\": \"Specialties\",       \"items\": [         { \"name\": \"Structural Engineering\" },         { \"name\": \"Project Management\" },         { \"name\": \"Sustainable Construction\" }       ]     }   ] }',NULL);
/*!40000 ALTER TABLE `institution` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `institution_invoices`
--

DROP TABLE IF EXISTS `institution_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `institution_invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_number` text NOT NULL,
  `institution_id` smallint(6) NOT NULL,
  `institution_name` text NOT NULL,
  `period_start` datetime NOT NULL,
  `period_end` datetime NOT NULL,
  `generated_at` timestamp NOT NULL,
  `expiry` timestamp NOT NULL,
  `payment_reference_number` text NOT NULL,
  `ext_payment_reference_number` text DEFAULT NULL,
  `payment_status` enum('FAILED','PENDING','COMPLETED') NOT NULL,
  `payment_status_desc` text DEFAULT NULL,
  `payment_method` text DEFAULT NULL,
  `payment_retries` smallint(6) DEFAULT NULL,
  `status` enum('PENDING','EXPIRED','PAID','CANCELED') NOT NULL,
  `total_amount` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution_invoices`
--

LOCK TABLES `institution_invoices` WRITE;
/*!40000 ALTER TABLE `institution_invoices` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `institution_invoices` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `institution_service_tracking`
--

DROP TABLE IF EXISTS `institution_service_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `institution_service_tracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `institution_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `service_group_name` varchar(255) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `action` tinyint(1) DEFAULT 0,
  `status` tinyint(1) DEFAULT 1,
  `invoice_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution_service_tracking`
--

LOCK TABLES `institution_service_tracking` WRITE;
/*!40000 ALTER TABLE `institution_service_tracking` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `institution_service_tracking` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `login_history`
--

DROP TABLE IF EXISTS `login_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_audit_trail_ip` (`ip`),
  KEY `idx_audit_trail_user_agent` (`user_agent`),
  KEY `idx_audit_trail_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_history`
--

LOCK TABLES `login_history` WRITE;
/*!40000 ALTER TABLE `login_history` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `login_history` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `mms_file`
--

DROP TABLE IF EXISTS `mms_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `mms_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_uuid` varchar(255) NOT NULL,
  `institution_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `comment` varchar(5000) DEFAULT NULL,
  `type` smallint(6) NOT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `first_view_time` timestamp NULL DEFAULT NULL,
  `last_view_time` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mms_file`
--

LOCK TABLES `mms_file` WRITE;
/*!40000 ALTER TABLE `mms_file` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `mms_file` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `seen` tinyint(1) DEFAULT NULL,
  `time_sent` timestamp NULL DEFAULT current_timestamp(),
  `time_seen` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `notification_recipient`
--

DROP TABLE IF EXISTS `notification_recipient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_recipient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_notification` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `seen` int(11) DEFAULT NULL,
  `ticket` int(11) DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_recipient`
--

LOCK TABLES `notification_recipient` WRITE;
/*!40000 ALTER TABLE `notification_recipient` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `notification_recipient` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `option`
--

DROP TABLE IF EXISTS `option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option`
--

LOCK TABLES `option` WRITE;
/*!40000 ALTER TABLE `option` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `option` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `popup_questions`
--

DROP TABLE IF EXISTS `popup_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `popup_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(255) NOT NULL,
  `name_fr` varchar(255) DEFAULT NULL,
  `name_rw` varchar(255) DEFAULT NULL,
  `name_sw` varchar(255) DEFAULT NULL,
  `service_id` text NOT NULL,
  `description_en` varchar(255) NOT NULL,
  `description_fr` varchar(255) DEFAULT NULL,
  `description_rw` varchar(255) DEFAULT NULL,
  `description_sw` varchar(255) DEFAULT NULL,
  `applies_to_bad` tinyint(1) NOT NULL DEFAULT 1,
  `applies_to_good` tinyint(1) NOT NULL DEFAULT 0,
  `applies_to_excellent` tinyint(1) NOT NULL DEFAULT 0,
  `institution_id` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT 0,
  `type` tinyint(4) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_institution` (`institution_id`),
  CONSTRAINT `fk_institution` FOREIGN KEY (`institution_id`) REFERENCES `institution` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `popup_questions`
--

LOCK TABLES `popup_questions` WRITE;
/*!40000 ALTER TABLE `popup_questions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `popup_questions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `popup_questions_answers`
--

DROP TABLE IF EXISTS `popup_questions_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `popup_questions_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `rating_id` int(11) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `answer_id` int(11) NOT NULL,
  `answered_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_popup_questions_possible_answers` (`answer_id`),
  KEY `popup_questions_answers_device_id` (`device_id`),
  KEY `popup_questions_answers_rating_id` (`rating_id`),
  KEY `popup_questions_answers_ticket_id` (`ticket_id`),
  CONSTRAINT `fk_popup_questions_possible_answers` FOREIGN KEY (`answer_id`) REFERENCES `popup_questions_possible_answers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `popup_questions_answers`
--

LOCK TABLES `popup_questions_answers` WRITE;
/*!40000 ALTER TABLE `popup_questions_answers` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `popup_questions_answers` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `popup_questions_possible_answers`
--

DROP TABLE IF EXISTS `popup_questions_possible_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `popup_questions_possible_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `popup_question_id` int(11) NOT NULL,
  `answer_en` varchar(255) NOT NULL,
  `answer_fr` varchar(255) NOT NULL,
  `answer_rw` varchar(255) NOT NULL,
  `answer_sw` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_popup_questions_answers` (`popup_question_id`),
  CONSTRAINT `fk_popup_questions_answers` FOREIGN KEY (`popup_question_id`) REFERENCES `popup_questions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `popup_questions_possible_answers`
--

LOCK TABLES `popup_questions_possible_answers` WRITE;
/*!40000 ALTER TABLE `popup_questions_possible_answers` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `popup_questions_possible_answers` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `price_ranges`
--

DROP TABLE IF EXISTS `price_ranges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `price_ranges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `max_value` int(11) NOT NULL,
  `min_value` int(11) NOT NULL,
  `institution_id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_price_range` (`institution_id`),
  CONSTRAINT `fk_price_range` FOREIGN KEY (`institution_id`) REFERENCES `institution` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_ranges`
--

LOCK TABLES `price_ranges` WRITE;
/*!40000 ALTER TABLE `price_ranges` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `price_ranges` VALUES
(1,12000,0,3,'$'),
(15,54000,30000,4,'$$$'),
(16,30000,12000,6,'$$'),
(17,150000,60000,19,'$$$$'),
(18,50000,180000,5,'$$$$'),
(19,50000,18000,10,'$$$$'),
(20,90000,30000,11,'$$$'),
(21,500000,180000,20,'$$$$'),
(22,50000,25000,1,'$$$'),
(23,50000,25000,7,'$$$'),
(24,10000,2000,8,'$$'),
(25,2000,0,9,'$'),
(26,15000,50000,21,'$$$$'),
(27,50000,20000,22,'$$$'),
(28,5000,0,24,'$'),
(29,20000,5000,25,'$$'),
(30,10000,0,25,'$'),
(31,30000,10000,26,'$$'),
(32,70000,30000,27,'$$$'),
(33,150000,50000,28,'$$');
/*!40000 ALTER TABLE `price_ranges` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `qms_branch_operator`
--

DROP TABLE IF EXISTS `qms_branch_operator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `qms_branch_operator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operator_id` int(11) NOT NULL,
  `institution_id` int(11) NOT NULL,
  `service_id` text NOT NULL,
  `linked_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `fk_qms_branch_operator_institution` (`institution_id`),
  KEY `fk_qms_operator` (`operator_id`),
  CONSTRAINT `fk_qms_branch_operator_institution` FOREIGN KEY (`institution_id`) REFERENCES `institution` (`id`),
  CONSTRAINT `fk_qms_operator` FOREIGN KEY (`operator_id`) REFERENCES `qms_operator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qms_branch_operator`
--

LOCK TABLES `qms_branch_operator` WRITE;
/*!40000 ALTER TABLE `qms_branch_operator` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `qms_branch_operator` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `qms_branch_transactions`
--

DROP TABLE IF EXISTS `qms_branch_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `qms_branch_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_column` (`affiliate_id`,`date`),
  CONSTRAINT `fk_affiliate` FOREIGN KEY (`affiliate_id`) REFERENCES `institution` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qms_branch_transactions`
--

LOCK TABLES `qms_branch_transactions` WRITE;
/*!40000 ALTER TABLE `qms_branch_transactions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `qms_branch_transactions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `qms_counter`
--

DROP TABLE IF EXISTS `qms_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `qms_counter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_service` (`service_id`),
  CONSTRAINT `fk_service` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qms_counter`
--

LOCK TABLES `qms_counter` WRITE;
/*!40000 ALTER TABLE `qms_counter` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `qms_counter` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `qms_customer`
--

DROP TABLE IF EXISTS `qms_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `qms_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_uuid` varchar(64) NOT NULL,
  `device_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(64) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `has_priority_service` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `device_id` (`device_id`),
  CONSTRAINT `qms_customer_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `device` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qms_customer`
--

LOCK TABLES `qms_customer` WRITE;
/*!40000 ALTER TABLE `qms_customer` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `qms_customer` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `qms_operator`
--

DROP TABLE IF EXISTS `qms_operator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `qms_operator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operator_uuid` varchar(64) NOT NULL,
  `institution_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `email_address` varchar(255) NOT NULL,
  `phone_number` varchar(64) DEFAULT NULL,
  `terminal` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_qms_operator_institution` (`institution_id`),
  CONSTRAINT `fk_qms_operator_institution` FOREIGN KEY (`institution_id`) REFERENCES `institution` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qms_operator`
--

LOCK TABLES `qms_operator` WRITE;
/*!40000 ALTER TABLE `qms_operator` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `qms_operator` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `qms_operator_transactions`
--

DROP TABLE IF EXISTS `qms_operator_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `qms_operator_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_transaction_id` int(11) NOT NULL,
  `operator_id` int(11) NOT NULL,
  `transaction` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_branch_transactions` (`branch_transaction_id`),
  KEY `fk_operator` (`operator_id`),
  CONSTRAINT `fk_branch_transactions` FOREIGN KEY (`branch_transaction_id`) REFERENCES `qms_branch_transactions` (`id`),
  CONSTRAINT `fk_operator` FOREIGN KEY (`operator_id`) REFERENCES `qms_operator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qms_operator_transactions`
--

LOCK TABLES `qms_operator_transactions` WRITE;
/*!40000 ALTER TABLE `qms_operator_transactions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `qms_operator_transactions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `qms_queue`
--

DROP TABLE IF EXISTS `qms_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `qms_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `queue_uuid` varchar(64) NOT NULL,
  `service_id` int(11) NOT NULL,
  `queue_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `status` enum('open','paused','stopped','closed') NOT NULL,
  `avg_service_time` float DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `closure_notification` tinyint(4) NOT NULL DEFAULT 0,
  `inter_arrival_time` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qms_queue_ibfk_1` (`service_id`),
  CONSTRAINT `qms_queue_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qms_queue`
--

LOCK TABLES `qms_queue` WRITE;
/*!40000 ALTER TABLE `qms_queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `qms_queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `qms_queue_operator_lnk`
--

DROP TABLE IF EXISTS `qms_queue_operator_lnk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `qms_queue_operator_lnk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `queue_id` int(11) NOT NULL,
  `operator_id` int(11) NOT NULL,
  `operator_uuid` varchar(64) DEFAULT NULL,
  `counter_id` int(11) DEFAULT NULL,
  `first_login` timestamp NULL DEFAULT NULL,
  `last_logout` timestamp NULL DEFAULT NULL,
  `api_key` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qms_queue_operator_lnk_ibfk_1` (`queue_id`),
  KEY `qms_queue_operator_lnk_ibfk_2` (`operator_id`),
  CONSTRAINT `qms_queue_operator_lnk_ibfk_1` FOREIGN KEY (`queue_id`) REFERENCES `qms_queue` (`id`) ON DELETE CASCADE,
  CONSTRAINT `qms_queue_operator_lnk_ibfk_2` FOREIGN KEY (`operator_id`) REFERENCES `qms_operator` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qms_queue_operator_lnk`
--

LOCK TABLES `qms_queue_operator_lnk` WRITE;
/*!40000 ALTER TABLE `qms_queue_operator_lnk` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `qms_queue_operator_lnk` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `qms_ticket`
--

DROP TABLE IF EXISTS `qms_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `qms_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_uuid` varchar(64) NOT NULL,
  `queue_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `ticket_number` varchar(64) NOT NULL,
  `full_ticket_number` varchar(255) DEFAULT NULL,
  `pin` int(11) NOT NULL,
  `status` tinyint(4) DEFAULT 1,
  `service_time` float DEFAULT NULL,
  `estimated_waiting_time` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `waiting_ended_on` timestamp NULL DEFAULT NULL,
  `skipped_at` timestamp NULL DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `on_hold_from` timestamp NULL DEFAULT NULL,
  `skips_count` int(11) DEFAULT 0,
  `prioritized` tinyint(1) DEFAULT 0,
  `reason_id` int(11) DEFAULT NULL,
  `prioritized_at` timestamp NULL DEFAULT NULL,
  `is_next` tinyint(1) DEFAULT 0,
  `prev_ticket_id` int(11) DEFAULT NULL,
  `rating_notification_sent` tinyint(4) NOT NULL DEFAULT 0,
  `source` tinyint(4) NOT NULL DEFAULT 2,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx-unique-qms_ticket-queue_id-ticket_number` (`queue_id`,`ticket_number`),
  KEY `customer_id` (`customer_id`),
  KEY `fk_reason_option` (`reason_id`),
  KEY `queue_id` (`queue_id`),
  CONSTRAINT `fk_reason_option` FOREIGN KEY (`reason_id`) REFERENCES `option` (`id`),
  CONSTRAINT `qms_ticket_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `qms_customer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `qms_ticket_ibfk_2` FOREIGN KEY (`queue_id`) REFERENCES `qms_queue` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qms_ticket`
--

LOCK TABLES `qms_ticket` WRITE;
/*!40000 ALTER TABLE `qms_ticket` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `qms_ticket` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `qms_ticket_assignment`
--

DROP TABLE IF EXISTS `qms_ticket_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `qms_ticket_assignment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `queue_id` int(11) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `counter_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `started_at` timestamp NULL DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `assigned_at` datetime DEFAULT current_timestamp(),
  `state` tinyint(4) DEFAULT 1,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `operator_id` (`operator_id`),
  KEY `qms_ticket_assignment_ibfk_1` (`ticket_id`),
  CONSTRAINT `qms_ticket_assignment_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `qms_ticket` (`id`) ON DELETE CASCADE,
  CONSTRAINT `qms_ticket_assignment_ibfk_2` FOREIGN KEY (`operator_id`) REFERENCES `qms_operator` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qms_ticket_assignment`
--

LOCK TABLES `qms_ticket_assignment` WRITE;
/*!40000 ALTER TABLE `qms_ticket_assignment` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `qms_ticket_assignment` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `state` tinyint(1) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `service_id` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `age_range` int(11) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `nps_score` int(11) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `finger_print` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk1_service_id` (`service_id`),
  KEY `fk_device` (`device_id`),
  CONSTRAINT `fk1_service_id` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  CONSTRAINT `fk_device` FOREIGN KEY (`device_id`) REFERENCES `device` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `rating_assets`
--

DROP TABLE IF EXISTS `rating_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating_assets` (
  `rating_assets_id` int(11) NOT NULL AUTO_INCREMENT,
  `rating_assets_image` varchar(45) DEFAULT NULL,
  `rating_assets_video` varchar(35) DEFAULT NULL,
  `rating_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rating_assets_id`),
  KEY `fk_rating_id` (`rating_id`),
  CONSTRAINT `fk_rating_id` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_assets`
--

LOCK TABLES `rating_assets` WRITE;
/*!40000 ALTER TABLE `rating_assets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `rating_assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `rating_qr_code_sessions`
--

DROP TABLE IF EXISTS `rating_qr_code_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating_qr_code_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `institution_uuid` varchar(255) DEFAULT NULL,
  `service_uuid` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) NOT NULL,
  `finger_print` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `session_token` varchar(255) NOT NULL,
  `session_expiration` timestamp NOT NULL,
  `status` enum('Open','Close') NOT NULL DEFAULT 'Open',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `session_token` (`session_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_qr_code_sessions`
--

LOCK TABLES `rating_qr_code_sessions` WRITE;
/*!40000 ALTER TABLE `rating_qr_code_sessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `rating_qr_code_sessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `rating_reply`
--

DROP TABLE IF EXISTS `rating_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `specific` tinyint(1) DEFAULT NULL,
  `rating_id` int(11) DEFAULT NULL,
  `time` datetime DEFAULT current_timestamp(),
  `reply` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_reply`
--

LOCK TABLES `rating_reply` WRITE;
/*!40000 ALTER TABLE `rating_reply` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `rating_reply` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `institution_id` int(11) NOT NULL,
  `service_ids` longtext NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `report_created_by` int(11) NOT NULL,
  `report_institution_id` longtext NOT NULL,
  `report_recipient` longtext NOT NULL,
  `report_queue_uuid` varchar(36) NOT NULL,
  `report_content_key` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `report_queue_uuid` (`report_queue_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `request_institution`
--

DROP TABLE IF EXISTS `request_institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `request_institution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_name` varchar(45) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `business_certificate` varchar(255) NOT NULL,
  `product_type` varchar(255) NOT NULL,
  `approval_status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_institution`
--

LOCK TABLES `request_institution` WRITE;
/*!40000 ALTER TABLE `request_institution` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `request_institution` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `institution_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `review` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_approved` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `fk_institutions_id` (`institution_id`),
  KEY `fk_users_id` (`user_id`),
  CONSTRAINT `fk_institutions_id` FOREIGN KEY (`institution_id`) REFERENCES `institution` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users_profile` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `reviews` VALUES
(1,2,1,4,'The customer service was efficient and friendly. I appreciate how easy it was to open a new savings account. The waiting time could be shorter though.','2025-05-07 08:12:30',1),
(2,4,1,4,'Their mobile banking app is improving and helpful for quick transactions. I just wish ATM service was available in more rural areas.','2025-05-07 07:29:00',1),
(3,13,3,4,'Nice atmosphere and great coffee! The location at Kigali Heights is perfect for quick business meetups. Wish they had more Rwandan food options.','2025-05-07 07:29:00',1),
(4,26,3,5,'Their burgers are amazing and the staff is super welcoming. It’s my go-to spot on weekends!','2025-05-07 08:13:42',1),
(5,25,4,4,'Beautiful setting and delicious food. The presentation was impressive. Just took a bit long to get served.','2025-05-07 07:29:00',1),
(6,13,4,5,'One of Kigali’s gems. Perfect for date nights with cozy lighting and a lovely menu.','2025-05-07 08:15:15',1),
(7,2,5,5,'Top-notch service and facilities! The rooms are spacious and the breakfast buffet is unbeatable.','2025-05-07 07:29:00',1),
(8,4,5,4,'Perfect for conferences and events. Internet could be faster in some areas though.','2025-05-07 07:29:00',1),
(9,13,6,4,'Great Indian flavors! The butter chicken and naan were amazing. Slightly pricey but worth it.','2025-05-07 07:29:00',1),
(10,26,6,4,'Cozy place with good vegetarian options. I’ll definitely be coming back.','2025-05-07 07:29:00',1),
(11,25,7,3,'Decent banking services, but long queues during peak hours can be frustrating.','2025-05-07 07:29:00',1),
(12,1,7,4,'Reliable for international transfers and business accounts. Their customer reps are professional.','2025-05-07 07:35:22',1),
(13,2,8,4,'Great local bank with helpful staff. Mobile banking app still needs improvement.','2025-05-07 07:29:00',1),
(14,4,8,3,'Service is okay but the app crashes sometimes. Would love faster turnaround for loan processing.','2025-05-07 07:29:00',1),
(15,13,9,4,'Friendly environment and good for small business loans. Staff is very supportive.','2025-05-07 07:29:00',1),
(16,26,9,3,'Their community focus is impressive, but branch service can be slow at times.','2025-05-07 07:29:00',1),
(17,25,10,5,'Luxury and comfort at its best. Room service was exceptional and the spa is relaxing.','2025-05-07 07:29:00',1),
(18,1,10,4,'Beautiful rooms and excellent breakfast. Pool area can get crowded on weekends.','2025-05-07 07:35:22',1),
(19,2,11,4,'Great place to unwind after meetings. Rooms are clean and staff are attentive.','2025-05-07 07:29:00',1),
(20,2,11,4,'Elegant and peaceful. Their restaurant serves really good buffet lunches.','2025-05-07 07:35:22',1),
(21,4,19,4,'Authentic Italian dining in Kigali. Loved the ravioli. Just wish portions were a bit bigger.','2025-05-07 07:29:00',1),
(22,13,19,5,'Classy vibe with excellent pizza and wine selection. Great service too!','2025-05-07 07:29:00',1),
(23,26,20,4,'A historic and charming hotel with excellent views. Restaurant is a bit expensive, though.','2025-05-07 07:29:00',1),
(24,25,20,4,'Very comfortable stay. The pool area and live music nights make it extra special.','2025-05-07 07:29:00',1),
(41,56,1,4,'good','2025-05-08 08:56:36',1),
(42,56,1,2,'wow','2025-05-08 08:57:44',1),
(43,56,1,2,'Fuck you','2025-05-08 08:57:54',0),
(44,56,1,5,'You are a bitch','2025-05-08 08:58:12',0),
(45,56,1,3,'aWESOME','2025-05-08 09:16:56',1),
(46,56,1,5,'Fuck you','2025-05-08 09:17:10',0),
(47,2,21,5,'The medical team was professional and attentive. The facilities are top-notch, and I felt well cared for during my stay.','2025-05-08 10:25:51',1),
(48,4,21,3,'While the doctors were excellent, the waiting time at the outpatient department was longer than expected.','2025-05-08 10:25:51',1),
(49,13,22,4,'The staff was friendly, and the hospital was very clean. I appreciated the prompt attention I received.','2025-05-08 10:25:51',1),
(50,25,22,3,'Overall good service, but the pharmacy was out of stock for some medications I needed.','2025-05-08 10:25:51',1),
(51,26,23,4,'The maternity ward staff were exceptional during my delivery. I felt supported and safe throughout the process.','2025-05-08 10:25:51',1),
(52,2,23,2,'The hospital was overcrowded, and I had to wait several hours before seeing a doctor.','2025-05-08 10:25:51',1),
(53,3,24,4,'The hospital environment is serene, and the staff were very attentive to my needs.','2025-05-08 10:25:51',1),
(54,13,24,3,'Good services overall, but the billing process was a bit confusing and time-consuming.','2025-05-08 10:25:51',1),
(55,25,25,5,'BestAir transformed our office space overnight! The team was punctual, professional, and left everything spotless. Highly recommend their services.','2025-05-08 10:25:51',1),
(56,26,25,3,'The cleaning was thorough, but they arrived later than scheduled. Communication could be improved.','2025-05-08 10:25:51',1),
(57,2,26,5,'Dakul Clean did an exceptional job with our post-renovation cleaning. The house looked brand new!','2025-05-08 10:25:51',1),
(58,4,26,3,'The cleaning was thorough, but scheduling the service was a bit challenging. Once booked, the team delivered as promised.','2025-05-08 10:25:51',1),
(59,13,27,4,'Shine Home made our move stress-free with their efficient cleaning and relocation services. The team was friendly and professional.','2025-05-08 10:25:51',1),
(60,25,27,3,'The cleaning was satisfactory, but there was a slight delay in starting the service. Overall, a decent experience.','2025-05-08 10:25:51',1),
(61,26,28,5,'Stellar Engineering handled our home’s electrical rewiring efficiently. Highly recommend their services.','2025-05-08 10:25:51',1),
(62,2,28,3,'Quality work, but the project took longer than expected. Planning could be better.','2025-05-08 10:25:51',1),
(63,68,3,4,'Hello there since i have been asking for food i\'m not yet receive anything, please can you just help me to bring it at home you can send it with your deliver ','2025-05-15 10:16:17',1),
(64,68,3,4,'Hello there since i have been asking for food i\'m not yet receive anything, please can you just help me to bring it at home you can send it with your deliver ','2025-05-15 10:16:29',1),
(65,68,3,4,'Hello there since i have been asking for food i\'m not yet receive anything, please can you just help me to bring it at home you can send it with your deliver ','2025-05-15 10:17:16',1),
(66,68,3,5,'Hello there i\'m so happy with your service you did for me i\'m so really impressed of what you have done and i can\'t wait to work with you for the next time. ','2025-05-15 10:18:54',1),
(67,68,3,5,'Hello there i just want to let you that your pizza was so amazing i can\'t wait to take the second one this was really delicious keep cooking well. ','2025-05-15 10:27:06',1),
(68,69,1,5,'COOOLLLISM','2025-05-16 05:47:55',1),
(69,70,4,5,'hello thank you for the support it\'s means a lot to me','2025-05-16 05:56:47',1),
(70,72,3,0,'it stink','2025-05-16 06:04:02',1),
(71,71,3,4,'Hello there thank you for the support this was really helpful and i can\'t wait to works with you for next time.','2025-05-16 06:30:03',1),
(72,73,3,5,'Hello there hope you are doing fine i would like to let you know that your services was really helpful and i can\'t wait to see you next time.','2025-05-16 07:24:22',1),
(73,74,3,5,'Hello good people hope you are all doing amazing i\'m just happy with your services you help me out with. i can\'t wait to work with in future','2025-05-16 07:36:59',1),
(74,75,3,5,'hello there i need some could you help me please i just want to make sure i\'m safe that why i need some help','2025-05-16 09:24:00',1),
(75,80,3,5,'Thank you so much guys for your help, your support means a lot to me and i can\'t wait to work with you for next time keep doing the best works.','2025-05-20 07:30:50',1),
(76,80,3,4,'Hello good people i just wanna say thanks for everything you did for supporting me and i can\'t wait to works with you for the next time you are best people never seen ever','2025-05-20 07:33:08',1),
(77,81,3,4,'Good morning i just wanna say thanks for your help because without your help i can\'t be able to achieve this thanks a lot','2025-05-21 06:20:28',1),
(78,82,3,5,'Hi good people i\'m just happy by seeing the way you have welcome me in hotel and your services was really amazing and i can\'t wait to come again next time.','2025-05-21 06:37:32',1),
(79,83,1,3,'Fuck it','2025-05-21 11:53:45',0);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `sectors`
--

DROP TABLE IF EXISTS `sectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sectors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectors`
--

LOCK TABLES `sectors` WRITE;
/*!40000 ALTER TABLE `sectors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sectors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `institution_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `bad_rating_threshold` int(11) DEFAULT 10,
  `group` int(11) DEFAULT NULL,
  `good_ratings` int(11) DEFAULT NULL,
  `bad_ratings` int(11) DEFAULT NULL,
  `excellent_ratings` int(11) DEFAULT NULL,
  `nps` int(11) DEFAULT NULL,
  `csat` int(11) DEFAULT NULL,
  `mean_service_time` int(11) DEFAULT 5,
  `avg_service_time` float DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `inter_arrival_time` float DEFAULT NULL,
  `estimated_time` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_institution_id` (`institution_id`),
  KEY `fk_service_group` (`group`),
  CONSTRAINT `fk_service_group` FOREIGN KEY (`group`) REFERENCES `service_group` (`id`),
  CONSTRAINT `service_ibfk_1` FOREIGN KEY (`institution_id`) REFERENCES `institution` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `serviceReview`
--

DROP TABLE IF EXISTS `serviceReview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `serviceReview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `emoRating` varchar(25) NOT NULL,
  `added_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_Service_id` (`service_id`),
  KEY `fk_Suser_id` (`user_id`),
  CONSTRAINT `fk_Service_id` FOREIGN KEY (`service_id`) REFERENCES `service_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_Suser_id` FOREIGN KEY (`user_id`) REFERENCES `users_profile` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serviceReview`
--

LOCK TABLES `serviceReview` WRITE;
/*!40000 ALTER TABLE `serviceReview` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `serviceReview` VALUES
(1,85,1,8,'Satisfied','2025-05-27 05:56:12');
/*!40000 ALTER TABLE `serviceReview` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `service_group`
--

DROP TABLE IF EXISTS `service_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `name_rw` varchar(255) DEFAULT NULL,
  `name_fr` varchar(255) DEFAULT NULL,
  `name_sw` varchar(255) DEFAULT NULL,
  `search_term` varchar(255) DEFAULT NULL,
  `institution_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `uuid` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `good_ratings` int(11) DEFAULT NULL,
  `bad_ratings` int(11) DEFAULT NULL,
  `excellent_ratings` int(11) DEFAULT NULL,
  `nps` int(11) DEFAULT NULL,
  `csat` int(11) DEFAULT NULL,
  `mean_service_time` int(11) DEFAULT 5,
  `ticket_prefix` varchar(64) DEFAULT NULL,
  `bad_rating_threshold` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_service_group_institution_id` (`institution_id`),
  CONSTRAINT `fk_service_group_institution_id` FOREIGN KEY (`institution_id`) REFERENCES `institution` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_group`
--

LOCK TABLES `service_group` WRITE;
/*!40000 ALTER TABLE `service_group` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `service_group` VALUES
(1,'Food Quality',NULL,NULL,NULL,NULL,3,'2025-05-26 07:29:16','2025-05-26 07:29:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(2,'Cleanliness ',NULL,NULL,NULL,NULL,3,'2025-05-26 07:29:16','2025-05-26 07:29:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(3,'Customer Service',NULL,NULL,NULL,NULL,3,'2025-05-26 07:29:16','2025-05-26 07:29:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(4,'Wait Time',NULL,NULL,NULL,NULL,3,'2025-05-26 07:29:16','2025-05-26 07:29:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(5,'Food Quality',NULL,NULL,NULL,NULL,4,'2025-05-26 07:29:16','2025-05-26 07:29:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(6,'Cleanliness ',NULL,NULL,NULL,NULL,4,'2025-05-26 07:29:16','2025-05-26 07:29:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(7,'Customer Service',NULL,NULL,NULL,NULL,4,'2025-05-26 07:29:16','2025-05-26 07:29:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(8,'Wait Time',NULL,NULL,NULL,NULL,4,'2025-05-26 07:29:16','2025-05-26 07:29:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(9,'Food Quality',NULL,NULL,NULL,NULL,6,'2025-05-26 07:29:16','2025-05-26 07:29:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(10,'Cleanliness',NULL,NULL,NULL,NULL,6,'2025-05-26 07:29:16','2025-05-26 07:29:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(11,'Customer Service',NULL,NULL,NULL,NULL,6,'2025-05-26 07:29:16','2025-05-26 07:29:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(12,'Wait Time',NULL,NULL,NULL,NULL,6,'2025-05-26 07:29:16','2025-05-26 07:29:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(13,'Food Quality',NULL,NULL,NULL,NULL,9,'2025-05-26 07:29:16','2025-05-26 07:29:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(14,'Cleanliness',NULL,NULL,NULL,NULL,9,'2025-05-26 07:29:16','2025-05-26 07:29:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(15,'Customer Service',NULL,NULL,NULL,NULL,9,'2025-05-26 07:29:16','2025-05-26 07:29:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(16,'Wait Time',NULL,NULL,NULL,NULL,9,'2025-05-26 07:29:16','2025-05-26 07:29:16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(17,'Teller Services',NULL,NULL,NULL,NULL,1,'2025-05-26 07:32:05','2025-05-26 07:32:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(18,'ATM Experience',NULL,NULL,NULL,NULL,1,'2025-05-26 07:32:05','2025-05-26 07:32:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(19,'Account Opening',NULL,NULL,NULL,NULL,1,'2025-05-26 07:32:05','2025-05-26 07:32:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(20,'Digital Banking',NULL,NULL,NULL,NULL,1,'2025-05-26 07:32:05','2025-05-26 07:32:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(21,'Teller Services',NULL,NULL,NULL,NULL,7,'2025-05-26 07:32:05','2025-05-26 07:32:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(22,'ATM Experience',NULL,NULL,NULL,NULL,7,'2025-05-26 07:32:05','2025-05-26 07:32:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(23,'Account Opening',NULL,NULL,NULL,NULL,7,'2025-05-26 07:32:05','2025-05-26 07:32:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(24,'Digital Banking',NULL,NULL,NULL,NULL,7,'2025-05-26 07:32:05','2025-05-26 07:32:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(25,'Teller Services',NULL,NULL,NULL,NULL,8,'2025-05-26 07:32:05','2025-05-26 07:32:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(26,'ATM Experience',NULL,NULL,NULL,NULL,8,'2025-05-26 07:32:05','2025-05-26 07:32:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(27,'Account Opening',NULL,NULL,NULL,NULL,8,'2025-05-26 07:32:05','2025-05-26 07:32:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(28,'Digital Banking',NULL,NULL,NULL,NULL,8,'2025-05-26 07:32:05','2025-05-26 07:32:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(29,'Teller Services',NULL,NULL,NULL,NULL,9,'2025-05-26 07:32:05','2025-05-26 07:32:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(30,'ATM Experience',NULL,NULL,NULL,NULL,9,'2025-05-26 07:32:05','2025-05-26 07:32:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(31,'Account Opening',NULL,NULL,NULL,NULL,9,'2025-05-26 07:32:05','2025-05-26 07:32:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(32,'Digital Banking',NULL,NULL,NULL,NULL,9,'2025-05-26 07:32:05','2025-05-26 07:32:05',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(33,'Food & Beverage',NULL,NULL,NULL,NULL,5,'2025-05-26 07:36:38','2025-05-26 07:36:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(34,'Cleanliness',NULL,NULL,NULL,NULL,5,'2025-05-26 07:36:38','2025-05-26 07:36:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(35,'Front Desk',NULL,NULL,NULL,NULL,5,'2025-05-26 07:36:38','2025-05-26 07:36:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(36,'Room Comfort',NULL,NULL,NULL,NULL,5,'2025-05-26 07:36:38','2025-05-26 07:36:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(37,'Food & Beverage',NULL,NULL,NULL,NULL,10,'2025-05-26 07:36:38','2025-05-26 07:36:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(38,'Cleanliness',NULL,NULL,NULL,NULL,10,'2025-05-26 07:36:38','2025-05-26 07:36:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(39,'Front Desk',NULL,NULL,NULL,NULL,10,'2025-05-26 07:36:38','2025-05-26 07:36:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(40,'Room Comfort',NULL,NULL,NULL,NULL,10,'2025-05-26 07:36:38','2025-05-26 07:36:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(41,'Food & Beverage',NULL,NULL,NULL,NULL,11,'2025-05-26 07:36:38','2025-05-26 07:36:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(42,'Cleanliness',NULL,NULL,NULL,NULL,11,'2025-05-26 07:36:38','2025-05-26 07:36:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(43,'Front Desk',NULL,NULL,NULL,NULL,11,'2025-05-26 07:36:38','2025-05-26 07:36:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(44,'Room Comfort',NULL,NULL,NULL,NULL,11,'2025-05-26 07:36:38','2025-05-26 07:36:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(45,'Food & Beverage',NULL,NULL,NULL,NULL,20,'2025-05-26 07:36:38','2025-05-26 07:36:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(46,'Cleanliness',NULL,NULL,NULL,NULL,20,'2025-05-26 07:36:38','2025-05-26 07:36:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(47,'Front Desk',NULL,NULL,NULL,NULL,20,'2025-05-26 07:36:38','2025-05-26 07:36:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(48,'Room Comfort',NULL,NULL,NULL,NULL,20,'2025-05-26 07:36:38','2025-05-26 07:36:38',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(49,'Registration',NULL,NULL,NULL,NULL,21,'2025-05-26 07:39:01','2025-05-26 07:39:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(50,'Consultation',NULL,NULL,NULL,NULL,21,'2025-05-26 07:39:01','2025-05-26 07:39:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(51,'Cleanliness',NULL,NULL,NULL,NULL,21,'2025-05-26 07:39:01','2025-05-26 07:39:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(52,'Pharmacy',NULL,NULL,NULL,NULL,21,'2025-05-26 07:39:01','2025-05-26 07:39:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(53,'Registration',NULL,NULL,NULL,NULL,22,'2025-05-26 07:39:01','2025-05-26 07:39:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(54,'Consultation',NULL,NULL,NULL,NULL,22,'2025-05-26 07:39:01','2025-05-26 07:39:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(55,'Cleanliness',NULL,NULL,NULL,NULL,22,'2025-05-26 07:39:01','2025-05-26 07:39:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(56,'Pharmacy',NULL,NULL,NULL,NULL,22,'2025-05-26 07:39:01','2025-05-26 07:39:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(57,'Registration',NULL,NULL,NULL,NULL,23,'2025-05-26 07:39:01','2025-05-26 07:39:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(58,'Consultation',NULL,NULL,NULL,NULL,23,'2025-05-26 07:39:01','2025-05-26 07:39:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(59,'Cleanliness',NULL,NULL,NULL,NULL,23,'2025-05-26 07:39:01','2025-05-26 07:39:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(60,'Pharmacy',NULL,NULL,NULL,NULL,23,'2025-05-26 07:39:01','2025-05-26 07:39:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(61,'Registration',NULL,NULL,NULL,NULL,24,'2025-05-26 07:39:01','2025-05-26 07:39:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(62,'Consultation',NULL,NULL,NULL,NULL,24,'2025-05-26 07:39:01','2025-05-26 07:39:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(63,'Cleanliness',NULL,NULL,NULL,NULL,24,'2025-05-26 07:39:01','2025-05-26 07:39:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(64,'Pharmacy',NULL,NULL,NULL,NULL,24,'2025-05-26 07:39:01','2025-05-26 07:39:01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(65,'Punctuality',NULL,NULL,NULL,NULL,25,'2025-05-27 11:33:49','2025-05-27 11:33:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(66,'Quality',NULL,NULL,NULL,NULL,25,'2025-05-27 11:33:49','2025-05-27 11:33:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(67,'Communication',NULL,NULL,NULL,NULL,25,'2025-05-27 11:33:49','2025-05-27 11:33:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(68,'Clean-up',NULL,NULL,NULL,NULL,25,'2025-05-27 11:33:49','2025-05-27 11:33:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(69,'Punctuality',NULL,NULL,NULL,NULL,26,'2025-05-27 11:33:49','2025-05-27 11:33:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(70,'Quality',NULL,NULL,NULL,NULL,26,'2025-05-27 11:33:49','2025-05-27 11:33:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(71,'Communication',NULL,NULL,NULL,NULL,26,'2025-05-27 11:33:49','2025-05-27 11:33:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(72,'Clean-up',NULL,NULL,NULL,NULL,26,'2025-05-27 11:33:49','2025-05-27 11:33:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(73,'Punctuality',NULL,NULL,NULL,NULL,27,'2025-05-27 11:33:49','2025-05-27 11:33:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(74,'Quality',NULL,NULL,NULL,NULL,27,'2025-05-27 11:33:49','2025-05-27 11:33:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(75,'Communication',NULL,NULL,NULL,NULL,27,'2025-05-27 11:33:49','2025-05-27 11:33:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(76,'Clean-up',NULL,NULL,NULL,NULL,27,'2025-05-27 11:33:49','2025-05-27 11:33:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(77,'Punctuality',NULL,NULL,NULL,NULL,28,'2025-05-27 11:33:49','2025-05-27 11:33:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(78,'Quality',NULL,NULL,NULL,NULL,28,'2025-05-27 11:33:49','2025-05-27 11:33:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(79,'Communication',NULL,NULL,NULL,NULL,28,'2025-05-27 11:33:49','2025-05-27 11:33:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
(80,'Clean-up',NULL,NULL,NULL,NULL,28,'2025-05-27 11:33:49','2025-05-27 11:33:49',NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL);
/*!40000 ALTER TABLE `service_group` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `survey`
--

DROP TABLE IF EXISTS `survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(64) DEFAULT NULL,
  `type` tinyint(1) DEFAULT 1,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `survey_data` longtext DEFAULT NULL,
  `institution_id` int(11) NOT NULL,
  `service_id` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) DEFAULT 0,
  `access_key` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey`
--

LOCK TABLES `survey` WRITE;
/*!40000 ALTER TABLE `survey` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `survey` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `surveyAnswers`
--

DROP TABLE IF EXISTS `surveyAnswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `surveyAnswers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `scale_rating` int(11) DEFAULT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_Serv_id` (`question_id`),
  CONSTRAINT `fk_Serv_id` FOREIGN KEY (`question_id`) REFERENCES `surveyQuestions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyAnswers`
--

LOCK TABLES `surveyAnswers` WRITE;
/*!40000 ALTER TABLE `surveyAnswers` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `surveyAnswers` VALUES
(1,1,98,'Sucks',1,'2025-05-28 09:43:33');
/*!40000 ALTER TABLE `surveyAnswers` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `surveyQuestions`
--

DROP TABLE IF EXISTS `surveyQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `surveyQuestions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` int(11) NOT NULL,
  `question` text DEFAULT NULL,
  `choices` longtext DEFAULT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_servic_id` (`service_id`),
  CONSTRAINT `fk_servic_id` FOREIGN KEY (`service_id`) REFERENCES `service_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyQuestions`
--

LOCK TABLES `surveyQuestions` WRITE;
/*!40000 ALTER TABLE `surveyQuestions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `surveyQuestions` VALUES
(1,1,'How tasty was your meal?','[\"Very clear\", \"Somewhat clear\", \"Confusing\"]','2025-05-27 12:26:17'),
(2,5,'How tasty was your meal?','[\"Very clear\", \"Somewhat clear\", \"Confusing\"]','2025-05-27 12:26:17'),
(3,9,'How tasty was your meal?','[\"Very clear\", \"Somewhat clear\", \"Confusing\"]','2025-05-27 12:26:17'),
(4,13,'How tasty was your meal?','[\"Very clear\", \"Somewhat clear\", \"Confusing\"]','2025-05-27 12:26:17'),
(5,1,'Did the food meet your expectations?','[\"Exceeded expectations\", \"Met expectations\", \"Below expectations\", \"Far below expectations\"]','2025-05-27 12:26:17'),
(6,5,'Did the food meet your expectations?','[\"Exceeded expectations\", \"Met expectations\", \"Below expectations\", \"Far below expectations\"]','2025-05-27 12:26:17'),
(7,9,'Did the food meet your expectations?','[\"Exceeded expectations\", \"Met expectations\", \"Below expectations\", \"Far below expectations\"]','2025-05-27 12:26:17'),
(8,13,'Did the food meet your expectations?','[\"Exceeded expectations\", \"Met expectations\", \"Below expectations\", \"Far below expectations\"]','2025-05-27 12:26:17'),
(9,2,'Was your table and seating area clean?','[\"Very Clean\", \"Clean\", \"Somewhat Clean\", \"Dirty\"]','2025-05-27 12:32:54'),
(10,6,'Was your table and seating area clean?','[\"Very Clean\", \"Clean\", \"Somewhat Clean\", \"Dirty\"]','2025-05-27 12:32:54'),
(11,10,'Was your table and seating area clean?','[\"Very Clean\", \"Clean\", \"Somewhat Clean\", \"Dirty\"]','2025-05-27 12:32:54'),
(12,14,'Was your table and seating area clean?','[\"Very Clean\", \"Clean\", \"Somewhat Clean\", \"Dirty\"]','2025-05-27 12:32:54'),
(13,2,'How clean was the overall restaurant environment?','[\"Very Clean\", \"Clean\", \"Average\", \"Unclean\", \"Very Unclean\"]','2025-05-27 12:32:54'),
(14,6,'How clean was the overall restaurant environment?','[\"Very Clean\", \"Clean\", \"Average\", \"Unclean\", \"Very Unclean\"]','2025-05-27 12:32:54'),
(15,10,'How clean was the overall restaurant environment?','[\"Very Clean\", \"Clean\", \"Average\", \"Unclean\", \"Very Unclean\"]','2025-05-27 12:32:54'),
(16,14,'How clean was the overall restaurant environment?','[\"Very Clean\", \"Clean\", \"Average\", \"Unclean\", \"Very Unclean\"]','2025-05-27 12:32:54'),
(17,3,'Was the staff polite and respectful?',' [\"Yes\", \"Somewhat\", \"No\"]','2025-05-27 12:32:54'),
(18,7,'Was the staff polite and respectful?',' [\"Yes\", \"Somewhat\", \"No\"]','2025-05-27 12:32:54'),
(19,11,'Was the staff polite and respectful?',' [\"Yes\", \"Somewhat\", \"No\"]','2025-05-27 12:32:54'),
(20,15,'Was the staff polite and respectful?',' [\"Yes\", \"Somewhat\", \"No\"]','2025-05-27 12:32:54'),
(21,3,'Did the waiter attend to your needs promptly?','[\"Immediately\", \"Short Wait\", \"Long Wait\", \"Never Attended\"]','2025-05-27 12:32:54'),
(22,7,'Did the waiter attend to your needs promptly?','[\"Immediately\", \"Short Wait\", \"Long Wait\", \"Never Attended\"]','2025-05-27 12:32:54'),
(23,11,'Did the waiter attend to your needs promptly?','[\"Immediately\", \"Short Wait\", \"Long Wait\", \"Never Attended\"]','2025-05-27 12:32:54'),
(24,15,'Did the waiter attend to your needs promptly?','[\"Immediately\", \"Short Wait\", \"Long Wait\", \"Never Attended\"]','2025-05-27 12:32:54'),
(25,4,'How long did you wait before being served?','[\"Less than 5 minutes\", \"5–10 minutes\", \"10–20 minutes\", \"Over 20 minutes\"]','2025-05-27 12:35:06'),
(26,8,'How long did you wait before being served?','[\"Less than 5 minutes\", \"5–10 minutes\", \"10–20 minutes\", \"Over 20 minutes\"]','2025-05-27 12:35:06'),
(27,12,'How long did you wait before being served?','[\"Less than 5 minutes\", \"5–10 minutes\", \"10–20 minutes\", \"Over 20 minutes\"]','2025-05-27 12:35:06'),
(28,16,'How long did you wait before being served?','[\"Less than 5 minutes\", \"5–10 minutes\", \"10–20 minutes\", \"Over 20 minutes\"]','2025-05-27 12:35:06'),
(29,4,'Was the staff polite and respectful?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-27 12:35:06'),
(30,8,'Was the staff polite and respectful?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-27 12:35:06'),
(31,12,'Was the staff polite and respectful?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-27 12:35:06'),
(32,16,'Was the staff polite and respectful?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-27 12:35:06'),
(33,17,'Was the teller courteous and professional?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-27 12:45:19'),
(34,21,'Was the teller courteous and professional?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-27 12:45:19'),
(35,25,'Was the teller courteous and professional?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-27 12:45:19'),
(36,29,'Was the teller courteous and professional?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-27 12:45:19'),
(37,17,'How efficiently was your transaction handled?','[\"Very Efficient\", \"Efficient\", \"Slow\", \"Very Slow\"]','2025-05-27 12:45:19'),
(38,21,'How efficiently was your transaction handled?','[\"Very Efficient\", \"Efficient\", \"Slow\", \"Very Slow\"]','2025-05-27 12:45:19'),
(39,25,'How efficiently was your transaction handled?','[\"Very Efficient\", \"Efficient\", \"Slow\", \"Very Slow\"]','2025-05-27 12:45:19'),
(40,29,'How efficiently was your transaction handled?','[\"Very Efficient\", \"Efficient\", \"Slow\", \"Very Slow\"]','2025-05-27 12:45:19'),
(41,18,'Was the ATM working properly?','[\"Yes\", \"Partially\", \"No\"]','2025-05-27 12:45:19'),
(42,22,'Was the ATM working properly?','[\"Yes\", \"Partially\", \"No\"]','2025-05-27 12:45:19'),
(43,26,'Was the ATM working properly?','[\"Yes\", \"Partially\", \"No\"]','2025-05-27 12:45:19'),
(44,30,'Was the ATM working properly?','[\"Yes\", \"Partially\", \"No\"]','2025-05-27 12:45:19'),
(45,18,'Did you encounter any transaction errors?',' [\"No errors\", \"Minor issues\", \"Major issues\", \"Could not complete transaction\"]','2025-05-27 12:45:19'),
(46,22,'Did you encounter any transaction errors?',' [\"No errors\", \"Minor issues\", \"Major issues\", \"Could not complete transaction\"]','2025-05-27 12:45:19'),
(47,29,'Did you encounter any transaction errors?',' [\"No errors\", \"Minor issues\", \"Major issues\", \"Could not complete transaction\"]','2025-05-27 12:45:19'),
(48,30,'Did you encounter any transaction errors?',' [\"No errors\", \"Minor issues\", \"Major issues\", \"Could not complete transaction\"]','2025-05-27 12:45:19'),
(49,19,'Was the account opening process smooth?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-27 12:45:19'),
(50,23,'Was the account opening process smooth?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-27 12:45:19'),
(51,27,'Was the account opening process smooth?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-27 12:45:19'),
(52,31,'Was the account opening process smooth?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-27 12:45:19'),
(53,19,'Was the staff knowledgeable and helpful?','[\"Very Helpful\", \"Helpful\", \"Unhelpful\", \"Very Unhelpful\"]','2025-05-27 12:45:19'),
(54,23,'Was the staff knowledgeable and helpful?','[\"Very Helpful\", \"Helpful\", \"Unhelpful\", \"Very Unhelpful\"]','2025-05-27 12:45:19'),
(55,27,'Was the staff knowledgeable and helpful?','[\"Very Helpful\", \"Helpful\", \"Unhelpful\", \"Very Unhelpful\"]','2025-05-27 12:45:19'),
(56,31,'Was the staff knowledgeable and helpful?','[\"Very Helpful\", \"Helpful\", \"Unhelpful\", \"Very Unhelpful\"]','2025-05-27 12:45:19'),
(57,20,'Was it easy to log into your online/mobile banking?','[\"Very Easy\", \"Somewhat Easy\", \"Difficult\", \"Very Difficult\"]','2025-05-27 12:45:19'),
(58,24,'Was it easy to log into your online/mobile banking?','[\"Very Easy\", \"Somewhat Easy\", \"Difficult\", \"Very Difficult\"]','2025-05-27 12:45:19'),
(59,28,'Was it easy to log into your online/mobile banking?','[\"Very Easy\", \"Somewhat Easy\", \"Difficult\", \"Very Difficult\"]','2025-05-27 12:45:19'),
(60,32,'Was it easy to log into your online/mobile banking?','[\"Very Easy\", \"Somewhat Easy\", \"Difficult\", \"Very Difficult\"]','2025-05-27 12:45:19'),
(61,20,'Did you find all the features you needed?','[\"Yes\", \"Some features missing\", \"No\"]','2025-05-27 12:45:19'),
(62,24,'Did you find all the features you needed?','[\"Yes\", \"Some features missing\", \"No\"]','2025-05-27 12:45:19'),
(63,28,'Did you find all the features you needed?','[\"Yes\", \"Some features missing\", \"No\"]','2025-05-27 12:45:19'),
(64,32,'Did you find all the features you needed?','[\"Yes\", \"Some features missing\", \"No\"]','2025-05-27 12:45:19'),
(65,33,'Was your room clean upon arrival?','[\"Very Clean\", \"Clean\", \"Not Clean\"]','2025-05-27 13:02:34'),
(66,37,'Was your room clean upon arrival?','[\"Very Clean\", \"Clean\", \"Not Clean\"]','2025-05-27 13:02:34'),
(67,41,'Was your room clean upon arrival?','[\"Very Clean\", \"Clean\", \"Not Clean\"]','2025-05-27 13:02:34'),
(68,45,'Was your room clean upon arrival?','[\"Very Clean\", \"Clean\", \"Not Clean\"]','2025-05-27 13:02:34'),
(69,33,'Were the bathrooms hygienic?','[\"Yes\", \"Some features missing\", \"No\"]','2025-05-27 13:02:34'),
(70,37,'Were the bathrooms hygienic?','[\"Yes\", \"Some features missing\", \"No\"]','2025-05-27 13:02:34'),
(71,41,'Were the bathrooms hygienic?','[\"Yes\", \"Some features missing\", \"No\"]','2025-05-27 13:02:34'),
(72,45,'Were the bathrooms hygienic?','[\"Yes\", \"Some features missing\", \"No\"]','2025-05-27 13:02:34'),
(73,34,'Was your room clean upon arrival?','[\"Very Clean\", \"Clean\", \"Not Clean\"]','2025-05-27 13:02:34'),
(74,38,'Was your room clean upon arrival?','[\"Very Clean\", \"Clean\", \"Not Clean\"]','2025-05-27 13:02:34'),
(75,42,'Was your room clean upon arrival?','[\"Very Clean\", \"Clean\", \"Not Clean\"]','2025-05-27 13:02:34'),
(76,46,'Was your room clean upon arrival?','[\"Very Clean\", \"Clean\", \"Not Clean\"]','2025-05-27 13:02:34'),
(77,34,'Were the bathrooms hygienic?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-27 13:02:34'),
(78,38,'Were the bathrooms hygienic?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-27 13:02:34'),
(79,42,'Were the bathrooms hygienic?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-27 13:02:34'),
(80,46,'Were the bathrooms hygienic?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-27 13:02:34'),
(81,35,'Was the check-in/check-out process efficient?','[\"Very Efficient\", \"Efficient\", \"Slow\", \"Very Slow\"]','2025-05-27 13:02:34'),
(82,39,'Was the check-in/check-out process efficient?','[\"Very Efficient\", \"Efficient\", \"Slow\", \"Very Slow\"]','2025-05-27 13:02:34'),
(83,43,'Was the check-in/check-out process efficient?','[\"Very Efficient\", \"Efficient\", \"Slow\", \"Very Slow\"]','2025-05-27 13:02:34'),
(84,47,'Was the check-in/check-out process efficient?','[\"Very Efficient\", \"Efficient\", \"Slow\", \"Very Slow\"]','2025-05-27 13:02:34'),
(85,35,'Were your requests handled promptly?','[\"Yes\", \"Sometimes\", \"No\"]','2025-05-27 13:02:34'),
(86,39,'Were your requests handled promptly?','[\"Yes\", \"Sometimes\", \"No\"]','2025-05-27 13:02:34'),
(87,43,'Were your requests handled promptly?','[\"Yes\", \"Sometimes\", \"No\"]','2025-05-27 13:02:34'),
(88,47,'Were your requests handled promptly?','[\"Yes\", \"Sometimes\", \"No\"]','2025-05-27 13:02:34'),
(89,36,'Was the bed comfortable?','[\"Very Comfortable\", \"Comfortable\", \"Uncomfortable\", \"Very Uncomfortable\"]','2025-05-27 13:02:34'),
(90,40,'Was the bed comfortable?','[\"Very Comfortable\", \"Comfortable\", \"Uncomfortable\", \"Very Uncomfortable\"]','2025-05-27 13:02:34'),
(91,44,'Was the bed comfortable?','[\"Very Comfortable\", \"Comfortable\", \"Uncomfortable\", \"Very Uncomfortable\"]','2025-05-27 13:02:34'),
(92,48,'Was the bed comfortable?','[\"Very Comfortable\", \"Comfortable\", \"Uncomfortable\", \"Very Uncomfortable\"]','2025-05-27 13:02:34'),
(93,36,'Was the room well-lit and ventilated?','[\"Excellent\", \"Good\", \"Poor\", \"Very Poor\"]','2025-05-27 13:02:34'),
(94,40,'Was the room well-lit and ventilated?','[\"Excellent\", \"Good\", \"Poor\", \"Very Poor\"]','2025-05-27 13:02:34'),
(95,44,'Was the room well-lit and ventilated?','[\"Excellent\", \"Good\", \"Poor\", \"Very Poor\"]','2025-05-27 13:02:34'),
(96,48,'Was the room well-lit and ventilated?','[\"Excellent\", \"Good\", \"Poor\", \"Very Poor\"]','2025-05-27 13:02:34'),
(97,49,'Was the registration process easy and quick?','[\"Very Easy\", \"Moderate\", \"Difficult\"]','2025-05-28 06:07:55'),
(98,53,'Was the registration process easy and quick?','[\"Very Easy\", \"Moderate\", \"Difficult\"]','2025-05-28 06:07:55'),
(99,57,'Was the registration process easy and quick?','[\"Very Easy\", \"Moderate\", \"Difficult\"]','2025-05-28 06:07:55'),
(100,61,'Was the registration process easy and quick?','[\"Very Easy\", \"Moderate\", \"Difficult\"]','2025-05-28 06:07:55'),
(101,49,'Did you wait long before seeing the doctor?','[\"Less than 15 mins\", \"15–30 mins\", \"30–60 mins\", \"Over 1 hour\"]','2025-05-28 06:07:55'),
(102,53,'Did you wait long before seeing the doctor?','[\"Less than 15 mins\", \"15–30 mins\", \"30–60 mins\", \"Over 1 hour\"]','2025-05-28 06:07:55'),
(103,57,'Did you wait long before seeing the doctor?','[\"Less than 15 mins\", \"15–30 mins\", \"30–60 mins\", \"Over 1 hour\"]','2025-05-28 06:07:55'),
(104,61,'Did you wait long before seeing the doctor?','[\"Less than 15 mins\", \"15–30 mins\", \"30–60 mins\", \"Over 1 hour\"]','2025-05-28 06:07:55'),
(105,50,'Did the doctor listen to your concerns?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-28 06:07:55'),
(106,54,'Did the doctor listen to your concerns?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-28 06:07:55'),
(107,58,'Did the doctor listen to your concerns?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-28 06:07:55'),
(108,62,'Did the doctor listen to your concerns?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-28 06:07:55'),
(109,50,'Did you understand the diagnosis and treatment?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-28 06:07:55'),
(110,54,'Did you understand the diagnosis and treatment?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-28 06:07:55'),
(111,58,'Did you understand the diagnosis and treatment?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-28 06:07:55'),
(112,62,'Did you understand the diagnosis and treatment?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-28 06:07:55'),
(113,51,'Were the consultation and waiting rooms clean?','[\"Very Clean\", \"Clean\", \"Dirty\"]','2025-05-28 06:07:55'),
(114,55,'Were the consultation and waiting rooms clean?','[\"Very Clean\", \"Clean\", \"Dirty\"]','2025-05-28 06:07:55'),
(115,59,'Were the consultation and waiting rooms clean?','[\"Very Clean\", \"Clean\", \"Dirty\"]','2025-05-28 06:07:55'),
(116,63,'Were the consultation and waiting rooms clean?','[\"Very Clean\", \"Clean\", \"Dirty\"]','2025-05-28 06:07:55'),
(117,51,'Were hand sanitizers and/or masks available?','[\"Yes\", \"No\"]','2025-05-28 06:07:55'),
(118,55,'Were hand sanitizers and/or masks available?','[\"Yes\", \"No\"]','2025-05-28 06:07:55'),
(119,59,'Were hand sanitizers and/or masks available?','[\"Yes\", \"No\"]','2025-05-28 06:07:55'),
(120,63,'Were hand sanitizers and/or masks available?','[\"Yes\", \"No\"]','2025-05-28 06:07:55'),
(121,52,'Were prescribed medications available?','[\"All Available\", \"Some Available\", \"None Available\"]','2025-05-28 06:07:55'),
(122,56,'Were prescribed medications available?','[\"All Available\", \"Some Available\", \"None Available\"]','2025-05-28 06:07:55'),
(123,60,'Were prescribed medications available?','[\"All Available\", \"Some Available\", \"None Available\"]','2025-05-28 06:07:55'),
(124,64,'Were prescribed medications available?','[\"All Available\", \"Some Available\", \"None Available\"]','2025-05-28 06:07:55'),
(125,52,'Was the pharmacist helpful and clear?','[\"Very Helpful\", \"Helpful\", \"Not Helpful\"]','2025-05-28 06:07:55'),
(126,56,'Was the pharmacist helpful and clear?','[\"Very Helpful\", \"Helpful\", \"Not Helpful\"]','2025-05-28 06:07:55'),
(127,60,'Was the pharmacist helpful and clear?','[\"Very Helpful\", \"Helpful\", \"Not Helpful\"]','2025-05-28 06:07:55'),
(128,64,'Was the pharmacist helpful and clear?','[\"Very Helpful\", \"Helpful\", \"Not Helpful\"]','2025-05-28 06:07:55'),
(129,65,'Did the workers arrive on time?','[\"Yes\", \"Slightly Late\", \"Very Late\", \"Did Not Arrive\"]','2025-05-28 06:23:05'),
(130,69,'Did the workers arrive on time?','[\"Yes\", \"Slightly Late\", \"Very Late\", \"Did Not Arrive\"]','2025-05-28 06:23:05'),
(131,73,'Did the workers arrive on time?','[\"Yes\", \"Slightly Late\", \"Very Late\", \"Did Not Arrive\"]','2025-05-28 06:23:05'),
(132,77,'Did the workers arrive on time?','[\"Yes\", \"Slightly Late\", \"Very Late\", \"Did Not Arrive\"]','2025-05-28 06:23:05'),
(133,65,'Was the service completed within the estimated time?','[\"Yes\", \"Slight Delay\", \"Significant Delay\"]','2025-05-28 06:23:05'),
(134,69,'Was the service completed within the estimated time?','[\"Yes\", \"Slight Delay\", \"Significant Delay\"]','2025-05-28 06:23:05'),
(135,73,'Was the service completed within the estimated time?','[\"Yes\", \"Slight Delay\", \"Significant Delay\"]','2025-05-28 06:23:05'),
(136,77,'Was the service completed within the estimated time?','[\"Yes\", \"Slight Delay\", \"Significant Delay\"]','2025-05-28 06:23:05'),
(137,66,'Did the service meet your expectations?','[\"Exceeded\", \"Met\", \"Below Expectations\", \"Far Below\"]','2025-05-28 06:23:05'),
(138,70,'Did the service meet your expectations?','[\"Exceeded\", \"Met\", \"Below Expectations\", \"Far Below\"]','2025-05-28 06:23:05'),
(139,74,'Did the service meet your expectations?','[\"Exceeded\", \"Met\", \"Below Expectations\", \"Far Below\"]','2025-05-28 06:23:05'),
(140,78,'Did the service meet your expectations?','[\"Exceeded\", \"Met\", \"Below Expectations\", \"Far Below\"]','2025-05-28 06:23:05'),
(141,66,'Were the materials/tools used appropriate for the job?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-28 06:23:05'),
(142,70,'Were the materials/tools used appropriate for the job?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-28 06:23:05'),
(143,74,'Were the materials/tools used appropriate for the job?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-28 06:23:05'),
(144,78,'Were the materials/tools used appropriate for the job?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-28 06:23:05'),
(145,67,'Were your instructions clearly understood?','[\"Yes\", \"Partially\", \"No\"]','2025-05-28 06:23:05'),
(146,71,'Were your instructions clearly understood?v','[\"Yes\", \"Partially\", \"No\"]','2025-05-28 06:23:05'),
(147,75,'Were your instructions clearly understood?','[\"Yes\", \"Partially\", \"No\"]','2025-05-28 06:23:05'),
(148,79,'Were your instructions clearly understood?','[\"Yes\", \"Partially\", \"No\"]','2025-05-28 06:23:05'),
(149,67,'Were updates provided throughout the service?','[\"Yes\", \"Sometimes\", \"No\"]','2025-05-28 06:23:05'),
(150,71,'Were updates provided throughout the service?','[\"Yes\", \"Sometimes\", \"No\"]','2025-05-28 06:23:05'),
(151,75,'Were updates provided throughout the service?','[\"Yes\", \"Sometimes\", \"No\"]','2025-05-28 06:23:05'),
(152,79,'Were updates provided throughout the service?','[\"Yes\", \"Sometimes\", \"No\"]','2025-05-28 06:23:05'),
(153,68,'Did the workers leave the area clean?','[\"Very Clean\", \"Clean\", \"Not Clean\"]','2025-05-28 06:23:05'),
(154,72,'Did the workers leave the area clean?','[\"Very Clean\", \"Clean\", \"Not Clean\"]','2025-05-28 06:23:05'),
(155,76,'Did the workers leave the area clean?','[\"Very Clean\", \"Clean\", \"Not Clean\"]','2025-05-28 06:23:05'),
(156,80,'Did the workers leave the area clean?','[\"Very Clean\", \"Clean\", \"Not Clean\"]','2025-05-28 06:23:05'),
(157,68,'Were the staff respectful and professional?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-28 06:23:05'),
(158,72,'Were the staff respectful and professional?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-28 06:23:05'),
(159,76,'Were the staff respectful and professional?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-28 06:23:05'),
(160,80,'Were the staff respectful and professional?','[\"Yes\", \"Somewhat\", \"No\"]','2025-05-28 06:23:05');
/*!40000 ALTER TABLE `surveyQuestions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `survey_result`
--

DROP TABLE IF EXISTS `survey_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `survey_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) NOT NULL,
  `rating_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `agent` text DEFAULT NULL,
  `result_data` longtext NOT NULL,
  `replied_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_result`
--

LOCK TABLES `survey_result` WRITE;
/*!40000 ALTER TABLE `survey_result` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `survey_result` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `services` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk-tags-created_by` (`created_by`),
  KEY `fk-tags-updated_by` (`updated_by`),
  CONSTRAINT `fk-tags-created_by` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk-tags-updated_by` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `tip`
--

DROP TABLE IF EXISTS `tip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_reference_id` varchar(255) NOT NULL,
  `disbursement_reference_id` varchar(255) NOT NULL,
  `device_id` int(11) NOT NULL,
  `rating_id` bigint(20) DEFAULT NULL,
  `payee` varchar(64) NOT NULL,
  `payer` varchar(64) NOT NULL,
  `amount` int(11) NOT NULL,
  `tip_amount` int(11) NOT NULL,
  `collection_status` varchar(64) DEFAULT NULL,
  `collection_status_details` longtext DEFAULT NULL,
  `closed_at` timestamp NULL DEFAULT NULL,
  `disbursed_at` timestamp NULL DEFAULT NULL,
  `disbursement_status` varchar(64) DEFAULT NULL,
  `disbursement_status_details` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_tip_device` (`device_id`),
  KEY `fk_tip_rating` (`rating_id`),
  CONSTRAINT `fk_tip_device` FOREIGN KEY (`device_id`) REFERENCES `device` (`id`),
  CONSTRAINT `fk_tip_rating` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tip`
--

LOCK TABLES `tip` WRITE;
/*!40000 ALTER TABLE `tip` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tip` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `role` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `verification_token` varchar(255) DEFAULT NULL,
  `allowed_context` tinyint(4) DEFAULT 1,
  `institution_id` text DEFAULT NULL,
  `last_received_hb_alert_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_received_rating_notification_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `language` varchar(64) DEFAULT NULL,
  `notifications_enabled` tinyint(1) DEFAULT 1,
  `last_login` datetime DEFAULT NULL,
  `allow_auto_approved_changes` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `users_profile`
--

DROP TABLE IF EXISTS `users_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `age_group` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `isVerified` tinyint(1) DEFAULT NULL,
  `verifyToken` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_profile`
--

LOCK TABLES `users_profile` WRITE;
/*!40000 ALTER TABLE `users_profile` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users_profile` VALUES
(1,'John ','Doe','user@example.com','$2b$10$yhO6CioWbs3i4KtNZj0j8.XQlOhrO3CDsSqxtItTvy7uqOflpbj2K',NULL,NULL,NULL,NULL,'2025-04-22 11:01:49',NULL,NULL),
(2,'John ','Doe','user2@example.com','$2b$10$F506hathQVZlqCC8n2Q8/u0sSGDKrU3VFB1PiQ6Tdn6HhOl1PTdb6',NULL,NULL,NULL,NULL,'2025-04-22 11:03:36',NULL,NULL),
(3,'mutoni','josiane','josiane@gmail.com','$2b$10$hqxJ2T.baZDaTdZfqVBDg.93Q6E9ZZ5tuNsnc/ev2uUsDY1L8XVk6',NULL,NULL,NULL,NULL,'2025-04-23 09:34:14',NULL,NULL),
(4,'alan','jonse','alan@gmail.com','asdewq123','0788438','18 to 25','','','2025-04-24 06:17:13',NULL,NULL),
(5,'rudolph','maroyi','rudolph@gmail.com','$2b$10$PfX4zf1mQYqvQ7J.E7H0YuO5bNyzwwqKaNANpfr18cgweV/m1VE62',NULL,NULL,NULL,NULL,'2025-04-24 07:11:28',NULL,NULL),
(6,'jean','jonse','bolebole@gmail.com','asdewq123',NULL,'18 to 25','female',NULL,'2025-04-24 07:37:37',NULL,NULL),
(7,'yves','rushanika','yves@gmail.com','$2b$10$rOpFjkTZSXG3mIRdkrs1g.YEZopls2e80VZrCb18X5Ds/0/gRFX/.',NULL,NULL,NULL,NULL,'2025-04-24 07:38:50',NULL,NULL),
(8,'migele','jean','jean@gmail.com','$2b$10$v9lkcTu6xHkxQYf2b/B0dufVgAzyQ5Ss7K/yNojfY7M5AYtCoUzyu',NULL,NULL,NULL,NULL,'2025-04-24 07:46:42',NULL,NULL),
(9,'Elia','Rams','elia@gmail.com','$2b$10$MwkkOhPlwrPzkfAKjzmF/.BTM6y4z7KnhpIfgKvt3aSwcRNjpm44e',NULL,NULL,NULL,NULL,'2025-04-24 08:03:15',NULL,NULL),
(10,'patrick','mboma','patrick@gmail.com','$2b$10$3xGySDROeHu02T/UOhxDRuq9keAJNPLLLfki/u3oEHH9GWARJOk0G',NULL,NULL,NULL,NULL,'2025-04-24 08:17:24',NULL,NULL),
(11,'felix','musiwa','felix@gmail.com','$2b$10$QeXfB8DVCTd5FbG.ax3OLuEZxIvVEoC0m6hFscctrDJxP8vMpVJ5u',NULL,NULL,NULL,NULL,'2025-04-24 08:24:34',NULL,NULL),
(12,'john','musafiri','john@gmail.com','$2b$10$xGoyIpLYwLjXKmlqo42oe.vLzmdTwU6W88/WBoco9o5K6B.hGVwvW',NULL,NULL,NULL,NULL,'2025-04-24 08:35:17',NULL,NULL),
(13,'zouss','jonse','soem@gmail.com','$2b$10$OwjrO/3c1S.fB2a6yfkcee3rauYXiF57737stm//dZS69rS9wTtxS',NULL,NULL,NULL,NULL,'2025-04-24 09:31:48',NULL,NULL),
(14,'Don','pierre','don@gmail.com','$2b$10$cO9jt3voMZDvd1MPLubiiex8ul.SoJtwRnJTWgbvVzO0iYKLh7xxe',NULL,NULL,NULL,NULL,'2025-04-24 09:49:11',NULL,NULL),
(15,'alice','feza','alice@gmail.com','$2b$10$yPUYnCIxyNZYSu21nYZ4KO4VoIfiHoAiNNVVJqjxD3A3I9lo2tRdq',NULL,NULL,NULL,NULL,'2025-04-24 10:03:58',NULL,NULL),
(16,'waso','masilya','waso@gmail.com','$2b$10$eVclowX8A46nE2pviDMaXuFvgYdI5ZF.SIUy1WKEDVuP1aGTVbglm',NULL,NULL,NULL,NULL,'2025-04-24 10:20:54',NULL,NULL),
(17,'alain ','wita','alain@gmail.com','$2b$10$4.Ne3NYnJBSw6DhaF/rbl.f/ocm.kcUGkOjbiwP8SJknECxwsVwgS',NULL,NULL,NULL,NULL,'2025-04-24 10:26:58',NULL,NULL),
(25,'kika ','wabenga','wabenga@gmail.com','$2b$10$ipI.Z.fDstKUMnJyGYOQ7.rF/t7f3N775scMyx41AP6Jb0SNG5mZ6','0784015138','20-24','male','kigali','2025-04-24 12:18:59',NULL,NULL),
(26,'jean','BB','sone@gmail.com','$2b$10$/aONJpYf2VI24J00hDJBnO/6ZQII89vWveryW67GNN7fnb.zrlrz6',NULL,NULL,NULL,NULL,'2025-04-24 12:41:11',NULL,NULL),
(38,'linda','maroyi','linda@gmail.com','$2b$10$DVY6C6/NQUkg/JnRmmO/V.kWPUCIxSZWeiEPXXE9BzvfoCB89MaI2',NULL,NULL,NULL,NULL,'2025-04-24 10:28:12',NULL,NULL),
(56,'BK Bank','somi','al@gmg.com','$2b$10$HlqGjd4jDTTNTa445t.MRe4lDAlnBGUn/t4AZOH9.hIYbpJCFGVxq',NULL,NULL,NULL,NULL,'2025-05-07 11:46:24',NULL,NULL),
(57,'awezaye23','awezaye','aline@gmail.com','$2b$10$IdCcIdhx6EHIlKFoiXdAOO4o9pWe/fk9C8phvVpPP6SUH/ktUqi66',NULL,NULL,NULL,NULL,'2025-05-08 05:58:18',NULL,NULL),
(58,'mulamba','yvone','mulamba@gmail.com','$2b$10$OwgrqgKVwBvvow/KtYVNBeVbnRl4ZM9akqT84wyMgady8loU4k/Ta','0783512134','20-24','male','kigali','2025-05-08 06:44:06',NULL,NULL),
(59,'justine','faida','justine@gmail.com','$2b$10$AFH6UjSvM/I3Vhc7TUyXcOx1pTjdrHB0DQZW6S9pU2IxPWk0GgBdy','0783512134','20-24','male','kigali','2025-05-08 12:08:39',NULL,NULL),
(60,'mbilizi','stella','stella@gmail.com','$2b$10$4gvijM8/5HYjlR41wIJxB.tDA43dY2plk.QRMnjFxDFxja4h4JbXK','0784015138','20-24','male','kigali','2025-05-08 12:18:53',NULL,NULL),
(61,'esther23','esther21','esther@gmail.com','$2b$10$OCHYy9.YGDqvjngZLsmBS.vbt1880AHVc3XWXPwpPbDmxy0F0e8Z6',NULL,NULL,NULL,NULL,'2025-05-09 06:00:48',NULL,NULL),
(62,'samitamba56','samy34','samitamba56@gmail.com','$2b$10$6tfTWlqG2LUjQxZ8LQPkKePfpthymj16d1JenhBXBi/6izedhM7Y.','0783512134','25-34','Female','gisenyi','2025-05-13 11:28:22',NULL,NULL),
(63,'bube','bubala','mutiku@gmail.com','$2b$10$BE3q17FgDaI.Hxy1WK8uJeMQmT7m0usVb8KDlDfqyTaf94dS6pQLy',NULL,NULL,NULL,NULL,'2025-05-13 11:42:11',NULL,NULL),
(64,'iphone','iphone6','iphone@gmail.com','$2b$10$/XIwA.fzL3JagToLe3GfSOwihueghmpr0/BzYCQRUZhjpd3nbwR4C','0784015138','20-24','male','kigali','2025-05-15 05:37:52',NULL,NULL),
(65,'olivia','mugabo','mutoni@gmail.com','$2b$10$nqXnahqES5BTKhBEk88aoOg6TVVNWh0HZA5uDW8btwW.WJyBWMY16',NULL,NULL,NULL,NULL,'2025-05-15 06:05:18',NULL,NULL),
(67,'malebo','malebo234','malebo@gmail.com','$2b$10$4qN7TCcRNKLel5o1uSs.ROaJq8nguVJqx/xlKrfL3WjyLq1sB.W..','0783512134','20-24','male','kigali','2025-05-15 08:20:38',NULL,NULL),
(68,'ben45','kashamy','kashama45@gmail.com','$2b$10$RW/3KujrhygsToZsYrxsyunrY67i5L1.YFJsenlWeWmaa4XbAYQ0u','0784015138','18-24','Male','gisenyi','2025-05-15 10:14:54',NULL,NULL),
(69,'string','string','alan@example.com','$2b$10$2IluQMsZd5fPJOLWbD2KkeFTIc2GiwHvQ3D7.Or8S9b/vs8Z2EBgW',NULL,NULL,NULL,NULL,'2025-05-16 05:47:06',NULL,NULL),
(70,'clara','clarisse','carine@gmail.com','$2b$10$8yD36T4UKFC8ws38lzjGK.qpMtyXl8DCPsCmhl4r66dWHbfYIBPeK',NULL,NULL,NULL,NULL,'2025-05-16 05:53:47',NULL,NULL),
(71,'clara','clarisee','clara@gmail.com','$2b$10$c/aC8VlTggpbtOVEM4RDnOksdQKhfpbjPQ2PSBGyenulivfVKtJJa','0784015138','20-24','male','kigali','2025-05-16 05:58:23',NULL,NULL),
(72,'string','string','user28@example.com','$2b$10$hTNFbQEfXFwYNnFwGpiu/uB8ebpzHCV8bLbokli7StB0bcjiviJ1y',NULL,NULL,NULL,NULL,'2025-05-16 06:02:51',NULL,NULL),
(73,'sandrine56','sandra45','sandrine@gmail.com','$2b$10$N2t0j4o90MaI0NJRkI2cru.hu1C2zlEzHzeyvCshDtFJpb3PTgvii','0784015138','25-34','Male','gisenyi','2025-05-16 07:02:33',NULL,NULL),
(74,'teta','yeta','teta@gmail.com','$2b$10$8EKTveI10Z4DjSfRh.ya6uYp1KkT/nhTrUizZK.xm.TJzR2O5ZU4i','0784015138','20-24','male','kigali','2025-05-16 07:35:19',NULL,NULL),
(75,'feza','rose','rosali@gmail.com','$2b$10$WZTs26oFpC0Pkm6DYw3wcOknsIXyv3G6rxovK5LJnOzGN4tq8pAjK','0783512134','20-24','male','kigali','2025-05-16 09:22:30',NULL,NULL),
(76,'cher','fai','caro@gmail.com','$2b$10$mL4KEkPlnaUAh6CTC46Bke1QFbzT9JZNfFWb8zMXZMdN853H/g4uW',NULL,NULL,NULL,NULL,'2025-05-16 12:10:35',NULL,NULL),
(77,'aimer','chantal','budinga.com','$2b$10$hVtsPfjIiRXeZ1RiG8Qf0eirfmQ/s4IADCNWhfsvHzd1LGYN5Zp9q',NULL,NULL,NULL,NULL,'2025-05-19 07:11:20',NULL,NULL),
(78,'patrick','patrick23','walumona@gmail.com','$2b$10$Mt8NxRWWpq/F2CVrX075RO.G//HvWY0gwKDksuYh542.axj9PtIBK',NULL,NULL,NULL,NULL,'2025-05-19 09:44:43',NULL,NULL),
(79,'mpasi56','kakouta53','mpasi@gmail.com','$2b$10$feaj8E3lZmB59TFK74cSzuoHtsoppjU2w65DkTA.wlmhXdtw.tbqe','0784015138','35-44','Male','Musanze','2025-05-20 06:19:31',NULL,NULL),
(80,'mechak','elia','mechak@gmail.com','$2b$10$Pzf/uXJLXE7hOPSuITSbm.hEEJJCat2EJdryGAMmGMf7gmOnVrxxy','0784015138','20-24','male','rwanda','2025-05-20 07:29:25',NULL,NULL),
(81,'yoana','yoana23','jacob@gmail.com','$2b$10$i0CK2aR0ibcj6Le6VqOOReeTGuyemOy8.VzuxKnF/rrldB51axfRe',NULL,NULL,NULL,NULL,'2025-05-21 06:16:49',NULL,NULL),
(82,'andrea ','jackson','andrea@gmail.com','$2b$10$I4yfIfQ4qnVRHa7c79k6zuJ1.2NQB.0yU2FVYaJbZchFi8zL3C95q','0784015138','20-24','male','kigali','2025-05-21 06:22:24',NULL,NULL),
(83,'string','string','user23467@example.com','$2b$10$/6Ol.2XB6JX6OD/66orjDenuopeVaMt523bec9lRsrp5xvCnqUtUO',NULL,NULL,NULL,NULL,'2025-05-21 11:52:55',NULL,NULL),
(84,'string','string','zouss@example.com','$2b$10$QJvav5rApSjBMQRk41ppfOLHJyahCnWTs2VA2wNK1KVf96IvPoGVK',NULL,NULL,NULL,NULL,'2025-05-27 05:37:25',NULL,NULL),
(85,'string','string','userwe@example.com','$2b$10$xpyya7UYmXcG5fwMvWG8Geq5LudSyWfW0oXzaxWrrBsl5l9rjqppS',NULL,NULL,NULL,NULL,'2025-05-27 05:49:40',NULL,NULL),
(100,'string','string','alanjonse2@gmail.com','$2b$10$h2rG1t2L7aQX8KTWRoP57egtFJ/u8a8we6YkOFymyl9zcB.KJ1S5a',NULL,NULL,NULL,NULL,'2025-05-29 08:23:29',1,NULL);
/*!40000 ALTER TABLE `users_profile` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `wallet_accounts`
--

DROP TABLE IF EXISTS `wallet_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `account_type_id` int(11) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `balance` float DEFAULT NULL,
  `public_key` varchar(255) DEFAULT NULL,
  `private_key` varchar(255) DEFAULT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_accounts`
--

LOCK TABLES `wallet_accounts` WRITE;
/*!40000 ALTER TABLE `wallet_accounts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `wallet_accounts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `wallet_accounts_types`
--

DROP TABLE IF EXISTS `wallet_accounts_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_accounts_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `abbreviation` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_accounts_types`
--

LOCK TABLES `wallet_accounts_types` WRITE;
/*!40000 ALTER TABLE `wallet_accounts_types` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `wallet_accounts_types` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `wallet_transfers`
--

DROP TABLE IF EXISTS `wallet_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_transfers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` float DEFAULT NULL,
  `currency` varchar(64) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `payer_id` int(11) DEFAULT NULL,
  `payer_account_id` int(11) DEFAULT NULL,
  `payee_address` varchar(255) DEFAULT NULL,
  `payee_name` varchar(255) DEFAULT NULL,
  `payee_account_type` varchar(255) DEFAULT NULL,
  `payee_account_number` varchar(255) DEFAULT NULL,
  `payee_type` varchar(255) DEFAULT NULL,
  `tx_id` varchar(255) DEFAULT NULL,
  `fspid` varchar(255) DEFAULT NULL,
  `ext_trx_id` varchar(255) DEFAULT NULL,
  `pay_money_ext_res` longtext DEFAULT NULL,
  `confirm_party_ext_res` longtext DEFAULT NULL,
  `confirm_quote_ext_res` longtext DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `quote_id` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `transfer_fees` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_transfers`
--

LOCK TABLES `wallet_transfers` WRITE;
/*!40000 ALTER TABLE `wallet_transfers` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `wallet_transfers` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `wallet_users`
--

DROP TABLE IF EXISTS `wallet_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `private_key` varchar(255) DEFAULT NULL,
  `public_key` varchar(255) DEFAULT NULL,
  `initiated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_users`
--

LOCK TABLES `wallet_users` WRITE;
/*!40000 ALTER TABLE `wallet_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `wallet_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `workingHour`
--

DROP TABLE IF EXISTS `workingHour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `workingHour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `institution_id` int(11) NOT NULL,
  `day_of_week` varchar(20) NOT NULL,
  `open_time` time DEFAULT NULL,
  `close_time` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_institit_id` (`institution_id`),
  CONSTRAINT `fk_institit_id` FOREIGN KEY (`institution_id`) REFERENCES `institution` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_institut_id` FOREIGN KEY (`institution_id`) REFERENCES `institution` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workingHour`
--

LOCK TABLES `workingHour` WRITE;
/*!40000 ALTER TABLE `workingHour` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `workingHour` VALUES
(78,1,'Monday','09:00:00','22:00:00'),
(79,1,'Tuesday','09:00:00','22:00:00'),
(80,1,'Wednesday','09:00:00','22:00:00'),
(81,1,'Thursday','09:00:00','22:00:00'),
(82,1,'Friday','09:00:00','22:00:00'),
(83,1,'Saturday','09:00:00','22:00:00'),
(84,1,'Sunday','09:00:00','22:00:00'),
(85,3,'Monday','09:00:00','22:00:00'),
(86,3,'Tuesday','09:00:00','22:00:00'),
(87,3,'Wednesday','09:00:00','22:00:00'),
(88,3,'Thursday','09:00:00','22:00:00'),
(89,3,'Friday','09:00:00','22:00:00'),
(90,3,'Saturday','09:00:00','22:00:00'),
(91,3,'Sunday','09:00:00','22:00:00'),
(92,4,'Monday','09:00:00','22:00:00'),
(93,4,'Tuesday','09:00:00','22:00:00'),
(94,4,'Wednesday','09:00:00','22:00:00'),
(95,4,'Thursday','09:00:00','22:00:00'),
(96,4,'Friday','09:00:00','22:00:00'),
(97,4,'Saturday','09:00:00','22:00:00'),
(98,4,'Sunday','09:00:00','22:00:00'),
(99,5,'Monday','09:00:00','22:00:00'),
(100,5,'Tuesday','09:00:00','22:00:00'),
(101,5,'Wednesday','09:00:00','22:00:00'),
(102,5,'Thursday','09:00:00','22:00:00'),
(103,5,'Friday','09:00:00','22:00:00'),
(104,5,'Saturday','09:00:00','22:00:00'),
(105,5,'Sunday','09:00:00','22:00:00'),
(106,6,'Monday','09:00:00','22:00:00'),
(107,6,'Tuesday','09:00:00','22:00:00'),
(108,6,'Wednesday','09:00:00','22:00:00'),
(109,6,'Thursday','09:00:00','22:00:00'),
(110,6,'Friday','09:00:00','22:00:00'),
(111,6,'Saturday','09:00:00','22:00:00'),
(112,6,'Sunday','09:00:00','22:00:00'),
(113,7,'Monday','09:00:00','22:00:00'),
(114,7,'Tuesday','09:00:00','22:00:00'),
(115,7,'Wednesday','09:00:00','22:00:00'),
(116,7,'Thursday','09:00:00','22:00:00'),
(117,7,'Friday','09:00:00','22:00:00'),
(118,7,'Saturday','09:00:00','22:00:00'),
(119,7,'Sunday','09:00:00','22:00:00'),
(120,8,'Monday','09:00:00','22:00:00'),
(121,8,'Tuesday','09:00:00','22:00:00'),
(122,8,'Wednesday','09:00:00','22:00:00'),
(123,8,'Thursday','09:00:00','22:00:00'),
(124,8,'Friday','09:00:00','22:00:00'),
(125,8,'Saturday','09:00:00','22:00:00'),
(126,8,'Sunday','09:00:00','22:00:00'),
(127,9,'Monday','09:00:00','22:00:00'),
(128,9,'Tuesday','09:00:00','22:00:00'),
(129,9,'Wednesday','09:00:00','22:00:00'),
(130,9,'Thursday','09:00:00','22:00:00'),
(131,9,'Friday','09:00:00','22:00:00'),
(132,9,'Saturday','09:00:00','22:00:00'),
(133,9,'Sunday','09:00:00','22:00:00'),
(134,10,'Monday','09:00:00','22:00:00'),
(135,10,'Tuesday','09:00:00','22:00:00'),
(136,10,'Wednesday','09:00:00','22:00:00'),
(137,10,'Thursday','09:00:00','22:00:00'),
(138,10,'Friday','09:00:00','22:00:00'),
(139,10,'Saturday','09:00:00','22:00:00'),
(140,10,'Sunday','09:00:00','22:00:00'),
(141,11,'Monday','09:00:00','22:00:00'),
(142,11,'Tuesday','09:00:00','22:00:00'),
(143,11,'Wednesday','09:00:00','22:00:00'),
(144,11,'Thursday','09:00:00','22:00:00'),
(145,11,'Friday','09:00:00','22:00:00'),
(146,11,'Saturday','09:00:00','22:00:00'),
(147,11,'Sunday','09:00:00','22:00:00'),
(148,19,'Monday','09:00:00','22:00:00'),
(149,19,'Tuesday','09:00:00','22:00:00'),
(150,19,'Wednesday','09:00:00','22:00:00'),
(151,19,'Thursday','09:00:00','22:00:00'),
(152,19,'Friday','09:00:00','22:00:00'),
(153,19,'Saturday','09:00:00','22:00:00'),
(154,19,'Sunday','09:00:00','22:00:00'),
(155,20,'Monday','09:00:00','22:00:00'),
(156,20,'Tuesday','09:00:00','22:00:00'),
(157,20,'Wednesday','09:00:00','22:00:00'),
(158,20,'Thursday','09:00:00','22:00:00'),
(159,20,'Friday','09:00:00','22:00:00'),
(160,20,'Saturday','09:00:00','22:00:00'),
(161,20,'Sunday','09:00:00','22:00:00'),
(162,21,'Monday','09:00:00','22:00:00');
/*!40000 ALTER TABLE `workingHour` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-06-02 10:31:46
