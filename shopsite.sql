-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	8.0.28-0ubuntu0.20.04.3

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

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'InShopUsers');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add products',7,'add_products'),(26,'Can change products',7,'change_products'),(27,'Can delete products',7,'delete_products'),(28,'Can view products',7,'view_products'),(29,'Can add cashier',8,'add_cashier'),(30,'Can change cashier',8,'change_cashier'),(31,'Can delete cashier',8,'delete_cashier'),(32,'Can view cashier',8,'view_cashier'),(33,'Can add cart',9,'add_cart'),(34,'Can change cart',9,'change_cart'),(35,'Can delete cart',9,'delete_cart'),(36,'Can view cart',9,'view_cart');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (8,'argon2$argon2i$v=19$m=512,t=2,p=2$d0FOWHRsem1lak9G$ZhSgtn/LBKcWY51imx2mDRwcpuWOfbu8bVoxDGRQvKg','2022-04-12 16:18:04.741382',1,'ndj320','','','nabin32@gmail.com',1,1,'2022-02-22 09:35:04.647249'),(10,'argon2$argon2i$v=19$m=512,t=2,p=2$SzYxYkhiajVyVUR2$d9MIkC9uOzVA3aHvoUhHM1bbaupubCKWsj6JUXjOx9M','2022-04-18 20:24:59.055305',0,'ndj','','','',0,1,'2022-04-12 16:06:39.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (96,'2022-02-22 09:36:01.944279','6','naben',3,'',4,8),(97,'2022-02-22 09:36:39.315383','12','12, 6, 2, 3',1,'[{\"added\": {}}]',9,8),(98,'2022-02-22 13:03:31.626565','12','12, 6, 2, 3',3,'',9,8),(99,'2022-02-22 13:25:02.161351','3','3, 2, 1, 1',3,'',9,8),(100,'2022-02-22 15:43:49.746577','8','8, 5, 10, 1',3,'',9,8),(101,'2022-02-24 10:09:07.488657','12','12, 5, 3, 2',1,'[{\"added\": {}}]',9,8),(102,'2022-02-24 16:46:14.945591','9','9, 5, 2, 2',3,'',9,8),(103,'2022-02-24 16:46:32.573450','12','12, 5, 3, 2',3,'',9,8),(104,'2022-02-24 16:47:02.592001','12','12, 5, 9, 1',1,'[{\"added\": {}}]',9,8),(105,'2022-02-26 02:17:27.439163','12','12, 5, 9, 1',2,'[{\"changed\": {\"fields\": [\"completed\"]}}]',9,8),(106,'2022-02-26 02:19:42.159914','11','11, 1, 3, 1',2,'[{\"changed\": {\"fields\": [\"completed\"]}}]',9,8),(107,'2022-02-26 02:19:48.060524','10','10, 1, 2, 2',2,'[{\"changed\": {\"fields\": [\"completed\"]}}]',9,8),(108,'2022-02-26 02:20:00.625006','7','7, 4, 1, 1',2,'[{\"changed\": {\"fields\": [\"completed\"]}}]',9,8),(109,'2022-02-26 02:20:07.456627','6','6, 4, 2, 1',2,'[{\"changed\": {\"fields\": [\"completed\"]}}]',9,8),(110,'2022-02-26 02:20:13.288318','5','5, 3, 2, 3',2,'[{\"changed\": {\"fields\": [\"completed\"]}}]',9,8),(111,'2022-02-26 02:20:18.432547','4','4, 3, 3, 1',2,'[{\"changed\": {\"fields\": [\"completed\"]}}]',9,8),(112,'2022-02-26 02:20:22.864960','1','1, 1, 1, 2',2,'[{\"changed\": {\"fields\": [\"completed\"]}}]',9,8),(113,'2022-04-12 03:50:30.486942','7','nabin',3,'',4,8),(114,'2022-04-12 03:51:34.282825','9','ndj',1,'[{\"added\": {}}]',4,8),(115,'2022-04-12 16:06:08.215804','9','ndj',3,'',4,8),(116,'2022-04-12 16:06:39.847448','10','ndj',1,'[{\"added\": {}}]',4,8),(117,'2022-04-12 16:06:50.459649','10','ndj',2,'[]',4,8);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(9,'shop','cart'),(8,'shop','cashier'),(7,'shop','products');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-12-15 16:52:28.511687'),(2,'auth','0001_initial','2021-12-15 16:52:53.489757'),(3,'admin','0001_initial','2021-12-15 16:53:04.660671'),(4,'admin','0002_logentry_remove_auto_add','2021-12-15 16:53:04.970529'),(5,'admin','0003_logentry_add_action_flag_choices','2021-12-15 16:53:05.148379'),(6,'contenttypes','0002_remove_content_type_name','2021-12-15 16:53:10.061733'),(7,'auth','0002_alter_permission_name_max_length','2021-12-15 16:53:13.106417'),(8,'auth','0003_alter_user_email_max_length','2021-12-15 16:53:13.593078'),(9,'auth','0004_alter_user_username_opts','2021-12-15 16:53:13.875064'),(10,'auth','0005_alter_user_last_login_null','2021-12-15 16:53:16.415963'),(11,'auth','0006_require_contenttypes_0002','2021-12-15 16:53:16.657780'),(12,'auth','0007_alter_validators_add_error_messages','2021-12-15 16:53:16.916999'),(13,'auth','0008_alter_user_username_max_length','2021-12-15 16:53:19.553085'),(14,'auth','0009_alter_user_last_name_max_length','2021-12-15 16:53:22.418966'),(15,'auth','0010_alter_group_name_max_length','2021-12-15 16:53:22.903742'),(16,'auth','0011_update_proxy_permissions','2021-12-15 16:53:23.174324'),(17,'auth','0012_alter_user_first_name_max_length','2021-12-15 16:53:26.028896'),(18,'sessions','0001_initial','2021-12-15 16:53:28.142381'),(22,'shop','0001_initial','2022-01-26 11:37:23.758131'),(23,'shop','0002_cart','2022-01-29 07:15:35.364241'),(24,'shop','0003_cart_completed','2022-02-25 16:08:27.175166');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4lm32a7spcpirpm1abttwjltobkrhiu3','.eJxVjEEOwiAQRe_C2hA6QAGX7j0DmWFAqqYkpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWRpx-N8L0yPMO-I7zrcnU5nWZSO6KPGiX18b5eTncv4OKvX5rFTQ7sJhCIUB0LlhNuQzZ6XEANuTZWcMEClXWowY_6uSBAZKhEpR4fwDhWTec:1nDQ5y:dj2Hl6ZE_1sOsdX02UrdGTK39JPSEiXD_93cRcpuXvo','2022-02-11 12:11:14.802156'),('6xbm8kxd4rjz9h6gfg8nrt9tyhhpjhdp','NmJhOTQ4ZWE5OGQ3ZmM5Y2I1MGI0YzJkNGYyOTUxNWZjOTQ1YmM0NTp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NmNkZjUxYTM4MTQ2MmY0NjY3Nzk5YmYxYThmZGUwYWU2OGVlMmZjIn0=','2022-03-15 06:18:11.143354'),('7nqbrteas14m2so2q7mekno40yzxqkqg','OTcwMDJhMDQxZjE1MDNmZTdiM2NiYThkOGVmYmZmZDg3MGY2MDJhMTp7Il9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjgxYWY2MGMyYWU0ZmRjZWY3Nzg3OGE4Zjc0NjkyNGViNGQ2Y2YxNCJ9','2022-04-27 15:19:04.862994'),('clwhdb97t8fuinlvyek9eipk60wec5k3','NmJhOTQ4ZWE5OGQ3ZmM5Y2I1MGI0YzJkNGYyOTUxNWZjOTQ1YmM0NTp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NmNkZjUxYTM4MTQ2MmY0NjY3Nzk5YmYxYThmZGUwYWU2OGVlMmZjIn0=','2022-03-10 07:49:34.573748'),('ne7ndng0gqe9qfyrxi1snk7hs4fq2hz7','ZGFiNzg3OTBjYzY1NzViZGUwNmI1N2U5MWIxZTlmYjc4NjhlMWU2Yzp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNjVmNjE0NTJmNmMxNzA3MDQ1NWJiNjkxYTY5ZjM1Yjg2MWE0YTdjIn0=','2022-03-12 09:44:19.127750'),('ni9zk24takn8t57se1zfc9ovd21jif1w','.eJxVjEEOwiAQRe_C2pAOVKa4dN8zkIEZpGpKUtqV8e7apAvd_vfef6lA21rC1mQJE6uLAnX63SKlh8w74DvNt6pTnddlinpX9EGbHivL83q4fweFWvnWOCRCikjgkuttZi9IxgNihtibs3WGI4p0BhDAQCdOkuHU-yFbzqTeH-N1N_0:1nElB9:f3qQNE1KqvtDuIyfzIAZaWdBXjIP4RzQcL5aVOljgtQ','2022-02-15 04:54:07.154748'),('salc97u48bh86gd76s4rlromim9imltt','OTcwMDJhMDQxZjE1MDNmZTdiM2NiYThkOGVmYmZmZDg3MGY2MDJhMTp7Il9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjgxYWY2MGMyYWU0ZmRjZWY3Nzg3OGE4Zjc0NjkyNGViNGQ2Y2YxNCJ9','2022-05-01 02:57:56.752926'),('u56ygdd1mufowl6vn7wwl1ffphgrsw8q','NmJhOTQ4ZWE5OGQ3ZmM5Y2I1MGI0YzJkNGYyOTUxNWZjOTQ1YmM0NTp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NmNkZjUxYTM4MTQ2MmY0NjY3Nzk5YmYxYThmZGUwYWU2OGVlMmZjIn0=','2022-03-15 12:20:59.015460'),('yy65acwfssb7hya70pd34hyvz4e9sgio','OTcwMDJhMDQxZjE1MDNmZTdiM2NiYThkOGVmYmZmZDg3MGY2MDJhMTp7Il9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjgxYWY2MGMyYWU0ZmRjZWY3Nzg3OGE4Zjc0NjkyNGViNGQ2Y2YxNCJ9','2022-04-29 07:07:27.387333');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_cart`
--

DROP TABLE IF EXISTS `shop_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_cart` (
  `key` int unsigned NOT NULL,
  `cart_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `product_count` int unsigned NOT NULL,
  `completed` tinyint(1) NOT NULL,
  PRIMARY KEY (`key`),
  CONSTRAINT `shop_cart_chk_1` CHECK ((`key` >= 0)),
  CONSTRAINT `shop_cart_chk_2` CHECK ((`cart_id` >= 0)),
  CONSTRAINT `shop_cart_chk_3` CHECK ((`product_id` >= 0)),
  CONSTRAINT `shop_cart_chk_4` CHECK ((`product_count` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_cart`
--

LOCK TABLES `shop_cart` WRITE;
/*!40000 ALTER TABLE `shop_cart` DISABLE KEYS */;
INSERT INTO `shop_cart` VALUES (4,3,3,1,0),(5,3,2,3,0),(6,4,2,1,0),(7,4,1,1,0),(10,1,2,2,0),(11,1,3,30,0);
/*!40000 ALTER TABLE `shop_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_products`
--

DROP TABLE IF EXISTS `shop_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_products` (
  `product_id` int unsigned NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `product_price` int unsigned NOT NULL,
  `product_mfd` date NOT NULL,
  `product_epd` date NOT NULL,
  `product_quantity` int unsigned NOT NULL,
  PRIMARY KEY (`product_id`),
  CONSTRAINT `shop_products_chk_1` CHECK ((`product_id` >= 0)),
  CONSTRAINT `shop_products_chk_2` CHECK ((`product_price` >= 0)),
  CONSTRAINT `shop_products_chk_3` CHECK ((`product_quantity` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_products`
--

LOCK TABLES `shop_products` WRITE;
/*!40000 ALTER TABLE `shop_products` DISABLE KEYS */;
INSERT INTO `shop_products` VALUES (1,'wiwi',20,'2021-01-24','2022-01-24',10),(2,'Coconut biscuit',10,'2021-01-24','2022-01-24',15),(3,'pringles',100,'2021-01-24','2022-01-24',3),(4,'lays',50,'2021-01-24','2022-01-24',5),(5,'coffee',5,'2021-01-24','2022-01-24',30),(6,'tea',20,'2021-01-24','2022-01-24',15),(7,'sunflower oil',130,'2021-01-24','2022-01-24',5),(8,'mustard oil',160,'2021-01-24','2022-01-24',10),(9,'rice',80,'2021-01-24','2022-01-24',15);
/*!40000 ALTER TABLE `shop_products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-24 17:27:47
