-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: localhost    Database: horarios
-- ------------------------------------------------------
-- Server version	8.0.25-0ubuntu0.20.04.1

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
-- Current Database: `horarios`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `horarios` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `horarios`;

--
-- Table structure for table `ambientes`
--

DROP TABLE IF EXISTS `ambientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ambientes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacidad` int unsigned DEFAULT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ambientes`
--

LOCK TABLES `ambientes` WRITE;
/*!40000 ALTER TABLE `ambientes` DISABLE KEYS */;
INSERT INTO `ambientes` VALUES (1,'Aula 306','aula',30,NULL,NULL,NULL),(2,'Aula 307','aula',30,NULL,NULL,NULL),(3,'Aula 308','aula',20,NULL,NULL,NULL),(4,'Aula 305','aula',30,NULL,NULL,NULL),(5,'Lab. de Comp.','laboratorio',30,NULL,NULL,'2021-07-04 03:24:12'),(6,'Aula Maestria','aula',40,NULL,NULL,NULL),(7,'Lab. ETN','laboratorio',30,NULL,NULL,'2021-07-04 03:24:23'),(8,'Aula 304','aula',50,NULL,NULL,NULL),(9,'Lab. de Sistemas','laboratorio',15,NULL,NULL,NULL),(10,'Lab. de Control','laboratorio',15,NULL,NULL,NULL),(11,'Lab. de Telecom','laboratorio',15,NULL,NULL,NULL),(12,'Aula Docentes','aula',20,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ambientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clases`
--

DROP TABLE IF EXISTS `clases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clases` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `materia_id` int unsigned NOT NULL,
  `responsable_id` int unsigned NOT NULL DEFAULT '0',
  `ambiente_id` int unsigned NOT NULL,
  `periodo_id` int unsigned NOT NULL,
  `dia` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hora_ini` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hora_fin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nivel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `paralelo` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `deleted_at` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clases_materia_id_foreign` (`materia_id`),
  KEY `clases_responsable_id_foreign` (`responsable_id`),
  KEY `clases_ambiente_id_foreign` (`ambiente_id`),
  KEY `clases_periodo_id_foreign` (`periodo_id`),
  CONSTRAINT `clases_ambiente_id_foreign` FOREIGN KEY (`ambiente_id`) REFERENCES `ambientes` (`id`),
  CONSTRAINT `clases_materia_id_foreign` FOREIGN KEY (`materia_id`) REFERENCES `materias` (`id`),
  CONSTRAINT `clases_periodo_id_foreign` FOREIGN KEY (`periodo_id`) REFERENCES `periodos` (`id`),
  CONSTRAINT `clases_responsable_id_foreign` FOREIGN KEY (`responsable_id`) REFERENCES `responsables` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=347 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clases`
--

LOCK TABLES `clases` WRITE;
/*!40000 ALTER TABLE `clases` DISABLE KEYS */;
INSERT INTO `clases` VALUES (1,8,394,3,2,'2','13:00','14:30','#0066CC','docente','A','true',NULL,NULL,NULL),(2,8,374,4,2,'6','08:00','11:30','#006600','docente','B','true',NULL,NULL,NULL),(3,8,394,1,2,'4','13:00','14:30','#0066CC','docente','A','true',NULL,NULL,NULL),(4,14,404,2,2,'2','07:45','09:15','#0066CC','docente','A','true',NULL,NULL,NULL),(5,14,404,2,2,'3','16:30','18:00','#0066CC','docente','A','true',NULL,NULL,NULL),(7,21,412,8,2,'2','11:15','12:45','#0066CC','docente','A','true',NULL,NULL,NULL),(8,21,412,1,2,'3','07:45','09:15','#0066CC','docente','A','true',NULL,NULL,NULL),(9,19,371,3,2,'3','09:30','11:00','#0066CC','docente','B','true',NULL,NULL,NULL),(10,19,371,2,2,'3','11:15','12:45','#0066CC','docente','A','true',NULL,NULL,NULL),(11,20,371,2,2,'3','13:00','14:30','#0066CC','docente','B','true',NULL,NULL,NULL),(12,19,371,2,2,'4','09:30','11:00','#0066CC','docente','A','true',NULL,NULL,NULL),(13,19,371,2,2,'4','11:15','12:45','#0066CC','docente','B','true',NULL,NULL,NULL),(14,20,371,2,2,'4','13:00','14:30','#0066CC','docente','B','true',NULL,NULL,NULL),(16,20,413,8,2,'5','14:30','16:00','#0066CC','docente','A','true',NULL,NULL,NULL),(17,22,400,6,2,'2','13:00','14:30','#0066CC','docente','A','true',NULL,NULL,NULL),(18,21,413,8,2,'4','16:00','17:30','#0066CC','docente','A','true',NULL,NULL,NULL),(19,22,400,6,2,'5','13:00','14:30','#0066CC','docente','A','true',NULL,NULL,NULL),(20,22,409,5,2,'1','09:30','11:00','#006600','docente','A','true',NULL,NULL,NULL),(21,22,409,5,2,'2','07:45','09:15','#006600','docente','A','true',NULL,NULL,NULL),(22,8,394,3,3,'2','13:00','14:30','#0066CC','docente','A','true','','',''),(23,8,374,4,3,'6','08:00','11:30','#0066CC','docente','B','true','','',''),(24,8,394,1,3,'4','13:00','14:30','#0066CC','docente','A','true','','',''),(25,14,404,2,3,'2','07:45','09:15','#0066CC','docente','A','true','','',''),(26,14,404,2,3,'3','16:30','18:00','#0066CC','docente','A','true','','',''),(27,20,1,4,3,'1','13:00','14:30','#0066CC','docente','A','true','','',''),(28,21,412,8,3,'2','11:15','12:45','#0066CC','docente','A','true','','',''),(29,21,412,1,3,'3','07:45','09:15','#0066CC','docente','A','true','','',''),(30,19,371,3,3,'3','09:30','11:00','#0066CC','docente','B','true','','',''),(31,19,371,2,3,'3','11:15','12:45','#0066CC','docente','A','true','','',''),(32,20,371,2,3,'3','13:00','14:30','#0066CC','docente','B','true','','',''),(33,19,371,2,3,'4','09:30','11:00','#0066CC','docente','A','true','','',''),(34,19,371,2,3,'4','11:15','12:45','#0066CC','docente','B','true','','',''),(35,20,371,2,3,'4','13:00','14:30','#0066CC','docente','B','true','','',''),(36,20,1,4,3,'5','11:15','12:45','#0066CC','docente','A','true','','',''),(37,20,413,8,3,'5','14:30','16:00','#0066CC','docente','A','true','','',''),(38,22,400,6,3,'2','13:00','14:30','#0066CC','docente','A','true','','',''),(39,21,413,8,3,'4','16:00','17:30','#0066CC','docente','A','true','','',''),(40,22,400,6,3,'5','13:00','14:30','#0066CC','docente','A','true','','',''),(41,22,409,5,3,'1','09:30','11:00','#006600','docente','A','true','','',''),(42,22,409,5,3,'2','07:45','09:15','#006600','docente','A','true','','',''),(43,28,397,8,2,'1','07:45','09:15','#0066CC','docente','B','true',NULL,NULL,NULL),(44,28,397,8,3,'1','07:45','09:15','#0066CC','docente','B','true',NULL,NULL,NULL),(45,28,397,8,2,'2','07:45','09:15','#0066CC','docente','B','true',NULL,NULL,NULL),(46,28,397,8,3,'2','07:45','09:15','#0066CC','docente','B','true',NULL,NULL,''),(47,28,397,8,2,'4','07:45','09:15','#0066CC','docente','B','true',NULL,NULL,NULL),(48,28,397,8,3,'4','07:45','09:15','#0066CC','docente','B','true',NULL,NULL,NULL),(49,28,395,4,2,'5','07:45','09:15','#0066CC','docente','A','true',NULL,NULL,NULL),(50,28,395,4,3,'5','07:45','09:15','#0066CC','docente','A','true',NULL,NULL,NULL),(51,24,388,2,2,'1','11:15','12:45','#0066CC','docente','A','true',NULL,NULL,NULL),(52,24,388,2,3,'1','11:15','12:45','#0066CC','docente','A','true',NULL,NULL,NULL),(53,31,393,6,2,'2','11:15','12:45','#0066CC','docente','A','true',NULL,NULL,NULL),(54,31,393,6,3,'2','11:15','12:45','#0066CC','docente','A','true',NULL,NULL,NULL),(56,28,395,1,3,'2','13:00','14:30','#0066CC','docente','A','true',NULL,NULL,NULL),(60,24,388,8,2,'2','14:45','16:15','#0066CC','docente','A','true',NULL,NULL,NULL),(61,24,388,8,3,'2','14:45','16:15','#0066CC','docente','A','true',NULL,NULL,NULL),(63,30,412,8,2,'3','11:15','12:45','#0066CC','docente','A','true',NULL,NULL,NULL),(64,30,412,8,3,'3','11:15','12:45','#0066CC','docente','A','true',NULL,NULL,NULL),(65,31,393,8,2,'3','13:00','14:30','#0066CC','docente','A','true',NULL,NULL,NULL),(66,31,393,8,3,'3','13:00','14:30','#0066CC','docente','A','true',NULL,NULL,NULL),(67,30,412,8,2,'4','11:15','12:45','#0066CC','docente','A','true',NULL,NULL,NULL),(68,30,412,8,3,'4','11:15','12:45','#0066CC','docente','A','true',NULL,NULL,NULL),(70,25,384,4,2,'1','19:00','20:30','#0066CC','docente','A','true',NULL,NULL,NULL),(71,25,384,4,3,'1','19:00','20:30','#0066CC','docente','A','true',NULL,NULL,NULL),(72,25,384,4,2,'2','19:00','20:30','#0066CC','docente','A','true',NULL,NULL,NULL),(73,25,384,4,3,'2','19:00','20:30','#0066CC','docente','A','true',NULL,NULL,NULL),(74,29,395,7,2,'1','17:30','20:30','#006600','docente','A','true',NULL,NULL,NULL),(75,29,395,7,3,'1','17:30','20:30','#006600','docente','A','true',NULL,NULL,NULL),(76,27,378,5,2,'2','09:30','11:00','#006600','docente','A','true',NULL,NULL,NULL),(77,27,378,5,3,'2','09:30','11:00','#006600','docente','A','true',NULL,NULL,NULL),(78,27,378,5,2,'4','09:30','11:00','#006600','docente','A','true',NULL,NULL,NULL),(79,27,378,5,3,'4','09:30','11:00','#006600','docente','A','true',NULL,NULL,NULL),(80,28,397,7,2,'4','14:00','17:00','#006600','docente','A','true',NULL,NULL,NULL),(81,28,397,7,3,'4','14:00','17:00','#006600','docente','A','true',NULL,NULL,NULL),(83,25,1,7,3,'5','11:00','13:45','#006600','docente','A','true',NULL,NULL,NULL),(86,25,1,7,3,'5','17:00','20:00','#006600','docente','A','true',NULL,NULL,NULL),(87,34,397,8,2,'1','09:30','11:00','#0066CC','docente','A','true',NULL,NULL,NULL),(88,34,397,8,3,'1','09:30','11:00','#0066CC','docente','A','true',NULL,NULL,NULL),(89,36,403,8,2,'1','11:15','12:45','#0066CC','docente','A','true',NULL,NULL,NULL),(90,36,403,8,3,'1','11:15','12:45','#0066CC','docente','A','true',NULL,NULL,NULL),(91,38,400,1,2,'2','09:30','11:00','#0066CC','docente','A','true',NULL,NULL,NULL),(92,38,400,1,3,'2','09:30','11:00','#0066CC','docente','A','true',NULL,NULL,NULL),(95,34,397,8,2,'3','07:45','09:15','#0066CC','docente','A','true',NULL,NULL,NULL),(96,34,397,8,3,'3','07:45','09:15','#0066CC','docente','A','true',NULL,NULL,NULL),(97,33,405,2,2,'3','09:30','11:00','#0066CC','docente','A','true',NULL,NULL,NULL),(98,33,405,2,3,'3','09:30','11:00','#0066CC','docente','A','true',NULL,NULL,NULL),(101,32,1,4,3,'2','13:00','14:30','#0066CC','docente','A','true',NULL,NULL,NULL),(102,34,397,7,2,'3','14:00','17:00','#006600','docente','A','true',NULL,NULL,NULL),(103,34,397,7,3,'3','14:00','17:00','#006600','docente','A','true',NULL,NULL,NULL),(104,33,405,1,2,'4','09:30','11:00','#0066CC','docente','A','true',NULL,NULL,NULL),(105,33,405,1,3,'4','09:30','11:00','#0066CC','docente','A','true',NULL,NULL,NULL),(106,34,397,8,2,'5','07:45','09:15','#0066CC','docente','A','true',NULL,NULL,NULL),(107,34,397,8,3,'5','09:30','11:00','#0066CC','docente','A','true',NULL,NULL,NULL),(109,32,1,4,3,'5','13:00','14:30','#0066CC','docente','A','true',NULL,NULL,NULL),(110,36,403,8,2,'6','11:45','13:15','#0066CC','docente','A','true',NULL,NULL,NULL),(111,36,403,8,3,'6','11:45','13:15','#0066CC','docente','A','true',NULL,NULL,NULL),(112,37,403,9,2,'1','14:00','17:00','#006600','docente','A','true',NULL,NULL,NULL),(113,37,403,9,3,'1','14:00','17:00','#006600','docente','A','true',NULL,NULL,NULL),(114,37,403,9,2,'5','14:00','17:00','#006600','docente','A','true',NULL,NULL,NULL),(115,37,403,9,3,'5','14:00','17:00','#006600','docente','A','true',NULL,NULL,NULL),(116,41,373,4,2,'1','07:45','09:15','#0066CC','docente','A','true',NULL,NULL,NULL),(117,41,373,4,3,'1','07:45','09:15','#0066CC','docente','A','true',NULL,NULL,NULL),(118,43,392,8,2,'1','15:00','16:30','#0066CC','docente','A','true',NULL,NULL,NULL),(119,43,392,8,3,'1','15:00','16:30','#0066CC','docente','A','true',NULL,NULL,NULL),(120,45,391,2,2,'1','16:30','18:00','#0066CC','docente','A','true',NULL,NULL,NULL),(121,45,391,2,3,'1','16:30','18:00','#0066CC','docente','A','true',NULL,NULL,NULL),(122,39,376,3,2,'2','07:45','09:15','#0066CC','docente','A','true',NULL,NULL,NULL),(123,39,376,3,3,'2','07:45','09:15','#0066CC','docente','A','true',NULL,NULL,NULL),(124,47,397,4,2,'2','09:30','11:00','#0066CC','docente','B','true',NULL,NULL,NULL),(125,47,397,4,3,'2','09:30','11:00','#0066CC','docente','B','true',NULL,NULL,NULL),(126,47,376,3,2,'3','07:45','09:15','#0066CC','docente','A','true',NULL,NULL,NULL),(127,47,376,3,3,'3','07:45','09:15','#0066CC','docente','A','true',NULL,NULL,NULL),(128,41,373,8,2,'3','09:30','11:00','#0066CC','docente','A','true',NULL,NULL,NULL),(129,41,373,8,3,'3','09:30','11:00','#0066CC','docente','A','true',NULL,NULL,NULL),(130,43,392,4,2,'3','15:00','17:00','#0066CC','docente','A','true',NULL,NULL,NULL),(131,43,392,4,3,'3','15:00','17:00','#0066CC','docente','A','true',NULL,NULL,NULL),(132,39,376,3,2,'4','07:45','09:15','#0066CC','docente','A','true',NULL,NULL,NULL),(133,39,376,3,3,'4','07:45','09:15','#0066CC','docente','A','true',NULL,NULL,NULL),(134,45,391,8,2,'4','09:30','11:00','#0066CC','docente','A','true',NULL,NULL,NULL),(135,45,391,8,3,'4','09:30','11:00','#0066CC','docente','A','true',NULL,NULL,NULL),(136,47,376,3,2,'4','11:15','12:45','#0066CC','docente','A','true',NULL,NULL,NULL),(137,47,376,3,3,'4','11:15','12:45','#0066CC','docente','A','true',NULL,NULL,NULL),(138,47,397,4,2,'5','09:30','11:00','#0066CC','docente','B','true',NULL,NULL,NULL),(139,47,397,4,3,'5','09:30','11:00','#0066CC','docente','B','true',NULL,NULL,NULL),(140,46,391,7,2,'1','11:15','14:00','#006600','docente','A','true',NULL,NULL,NULL),(141,46,391,7,3,'1','11:15','14:00','#006600','docente','A','true',NULL,NULL,NULL),(142,40,376,7,2,'2','14:00','16:45','#006600','docente','A','true',NULL,NULL,NULL),(143,40,376,7,3,'2','14:00','16:45','#006600','docente','A','true',NULL,NULL,NULL),(144,46,391,7,2,'3','11:15','13:45','#006600','docente','A','true',NULL,NULL,NULL),(145,46,391,7,3,'3','11:15','13:45','#006600','docente','A','true',NULL,NULL,NULL),(146,44,381,11,2,'4','17:30','20:30','#006600','docente','A','true',NULL,NULL,NULL),(147,44,381,11,3,'4','17:30','20:30','#006600','docente','A','true',NULL,NULL,NULL),(148,42,405,10,2,'5','14:00','17:00','#006600','docente','A','true',NULL,NULL,NULL),(149,42,405,1,3,'5','14:00','17:00','#006600','docente','A','true',NULL,NULL,NULL),(150,44,381,11,2,'5','17:30','20:30','#006600','docente','A','true',NULL,NULL,NULL),(151,44,381,11,3,'5','17:30','20:30','#006600','docente','A','true',NULL,NULL,NULL),(152,1,414,10,2,'6','12:00','13:30','#00FF00','auxiliar','A','true','2021-06-01 07:57:15',NULL,NULL),(153,1,414,10,3,'6','12:00','13:30','#00FF00','auxiliar','A','true','2021-06-01 07:57:19',NULL,NULL),(154,18,414,11,2,'6','09:30','11:00','#00FF00','auxiliar','A','true','2021-06-01 07:57:20',NULL,NULL),(155,18,414,11,3,'6','09:30','11:00','#00FF00','auxiliar','A','true','2021-06-01 07:57:23',NULL,NULL),(156,4,414,6,2,'4','07:45','09:15','#00CCFF','auxiliar','A','true','2021-06-01 07:57:24',NULL,NULL),(157,4,414,6,3,'4','07:45','09:15','#00CCFF','auxiliar','A','true','2021-06-01 07:57:26',NULL,NULL),(167,4,414,7,3,'4','15:00','19:00','#006600','docente','B','true','2021-06-01 07:57:27',NULL,NULL),(168,44,414,6,3,'3','15:00','19:00','#006600','docente','A','true','2021-06-01 07:57:28',NULL,NULL),(173,93,414,10,2,'1','3:00 PM','4:30 PM','#00FF00','auxiliar','A','true',NULL,NULL,NULL),(174,93,414,10,3,'1','3:00 PM','4:30 PM','#00FF00','auxiliar','A','true',NULL,NULL,NULL),(175,48,382,2,2,'1','07:45','09:15','#0066CC','docente','A','true',NULL,NULL,NULL),(176,48,382,2,3,'1','07:45','09:15','#0066CC','docente','A','true',NULL,NULL,NULL),(179,48,382,4,2,'2','07:45','09:15','#0066CC','docente','A','true',NULL,NULL,NULL),(180,48,382,4,3,'2','07:45','09:15','#0066CC','docente','A','true',NULL,NULL,NULL),(181,60,406,4,2,'3','07:45','09:15','#0066CC','docente','A','true',NULL,NULL,NULL),(182,60,406,4,3,'3','07:45','09:15','#0066CC','docente','A','true',NULL,NULL,NULL),(183,60,406,8,2,'2','09:30','11:00','#0066CC','docente','A','true',NULL,NULL,NULL),(184,60,406,8,3,'2','09:30','11:00','#0066CC','docente','A','true',NULL,NULL,NULL),(185,49,402,2,2,'5','09:30','11:00','#0066CC','docente','A','true',NULL,NULL,NULL),(186,49,402,2,3,'5','09:30','11:00','#0066CC','docente','A','true',NULL,NULL,NULL),(187,49,402,8,2,'1','13:00','14:30','#0066CC','docente','A','true',NULL,NULL,NULL),(188,49,402,8,3,'1','13:00','14:30','#0066CC','docente','A','true',NULL,NULL,NULL),(189,55,377,8,2,'5','11:15','12:45','#0066CC','docente','A','true',NULL,NULL,NULL),(190,55,377,8,3,'5','11:15','12:45','#0066CC','docente','A','true',NULL,NULL,NULL),(191,51,401,1,2,'5','14:45','16:15','#0066CC','docente','A','true',NULL,NULL,NULL),(192,51,401,1,3,'5','14:45','16:15','#0066CC','docente','A','true',NULL,NULL,NULL),(193,50,402,7,2,'1','14:30','17:30','#006600','docente','A','true',NULL,NULL,NULL),(194,50,402,7,3,'1','14:30','17:30','#006600','docente','A','true',NULL,NULL,NULL),(195,51,401,5,2,'4','07:45','09:15','#006600','docente','A','true',NULL,NULL,NULL),(196,51,401,5,3,'4','07:45','09:15','#006600','docente','A','true',NULL,NULL,NULL),(197,55,377,9,2,'4','11:15','12:45','#006600','docente','A','true',NULL,NULL,NULL),(198,55,377,9,3,'4','11:15','12:45','#006600','docente','A','true',NULL,NULL,NULL),(199,50,402,7,2,'5','14:00','16:15','#006600','docente','A','true',NULL,NULL,NULL),(200,50,402,7,3,'5','14:00','16:15','#006600','docente','A','true',NULL,NULL,NULL),(201,55,377,7,2,'6','08:00','11:00','#006600','docente','A','true',NULL,NULL,NULL),(202,55,377,7,3,'6','08:00','11:00','#006600','docente','A','true',NULL,NULL,NULL),(203,54,391,2,2,'1','09:30','11:00','#0066CC','docente','A','true',NULL,NULL,NULL),(204,54,391,2,3,'1','09:30','11:00','#0066CC','docente','A','true',NULL,NULL,NULL),(205,57,376,3,2,'2','09:30','11:00','#0066CC','docente','A','true',NULL,NULL,NULL),(206,57,376,3,3,'2','09:30','11:00','#0066CC','docente','A','true',NULL,NULL,NULL),(207,57,376,6,2,'3','09:30','11:00','#0066CC','docente','A','true',NULL,NULL,NULL),(208,57,376,6,3,'3','09:30','11:00','#0066CC','docente','A','true',NULL,NULL,NULL),(209,54,391,5,2,'4','11:15','12:45','#006600','docente','A','true',NULL,NULL,NULL),(210,54,391,5,3,'4','11:15','12:45','#006600','docente','A','true',NULL,NULL,NULL),(211,58,376,10,2,'4','14:00','17:00','#006600','docente','A','true',NULL,NULL,NULL),(212,58,376,10,3,'4','14:00','15:30','#006600','docente','A','true',NULL,NULL,NULL),(213,59,396,1,2,'1','09:30','11:00','#0066CC','docente','A','true',NULL,NULL,NULL),(214,59,396,1,3,'1','09:30','11:00','#0066CC','docente','A','true',NULL,NULL,NULL),(215,59,396,4,2,'3','11:15','12:45','#0066CC','docente','A','true',NULL,NULL,NULL),(216,59,396,4,3,'3','11:15','12:45','#0066CC','docente','A','true',NULL,NULL,NULL),(217,59,396,7,2,'2','08:00','10:45','#006600','docente','A','true',NULL,NULL,NULL),(218,59,396,7,3,'2','08:00','10:45','#006600','docente','A','true',NULL,NULL,NULL),(219,66,373,4,2,'1','09:30','11:00','#0066CC','docente','A','true',NULL,NULL,NULL),(220,66,373,4,3,'1','09:30','11:00','#0066CC','docente','A','true',NULL,NULL,NULL),(221,73,400,1,2,'2','11:15','12:45','#0066CC','docente','A','true',NULL,NULL,NULL),(222,73,400,1,3,'2','11:15','12:45','#0066CC','docente','A','true',NULL,NULL,NULL),(223,76,381,8,2,'2','13:00','14:30','#0066CC','docente','A','true',NULL,NULL,NULL),(224,76,381,8,3,'2','13:00','14:30','#0066CC','docente','A','true',NULL,NULL,NULL),(225,62,405,2,2,'3','07:45','09:15','#0066CC','docente','A','true',NULL,NULL,NULL),(226,62,405,2,3,'3','07:45','09:15','#0066CC','docente','A','true',NULL,NULL,NULL),(227,76,381,1,2,'4','07:45','09:15','#0066CC','docente','A','true',NULL,NULL,NULL),(228,76,381,1,3,'4','07:45','09:15','#0066CC','docente','A','true',NULL,NULL,NULL),(229,66,373,4,2,'4','09:30','11:00','#0066CC','docente','A','true',NULL,NULL,NULL),(230,66,373,4,3,'4','09:30','11:00','#0066CC','docente','A','true',NULL,NULL,NULL),(231,73,400,4,2,'4','11:15','12:45','#0066CC','docente','A','true',NULL,NULL,NULL),(232,73,400,4,3,'4','11:15','12:45','#0066CC','docente','A','true',NULL,NULL,NULL),(233,62,405,2,2,'5','07:45','09:15','#0066CC','docente','A','true',NULL,NULL,NULL),(234,62,405,2,3,'5','07:45','09:15','#0066CC','docente','A','true',NULL,NULL,NULL),(235,74,415,8,2,'5','13:00','14:30','#0066CC','docente','A','true',NULL,NULL,NULL),(236,74,415,8,3,'5','13:00','14:30','#0066CC','docente','A','true',NULL,NULL,NULL),(237,74,415,8,2,'6','07:45','09:15','#0066CC','docente','A','true',NULL,NULL,NULL),(238,74,415,8,3,'6','07:45','09:15','#0066CC','docente','A','true',NULL,NULL,NULL),(239,75,416,11,2,'1','11:00','13:45','#006600','docente','A','true',NULL,NULL,NULL),(240,75,416,11,3,'1','11:00','13:45','#006600','docente','A','true',NULL,NULL,NULL),(241,66,373,5,2,'2','14:00','17:00','#006600','docente','A','true',NULL,NULL,NULL),(242,66,373,5,3,'2','14:00','17:00','#006600','docente','A','true',NULL,NULL,NULL),(243,63,405,5,2,'4','14:00','17:00','#006600','docente','A','true',NULL,NULL,NULL),(244,63,405,5,3,'4','14:00','17:00','#006600','docente','A','true',NULL,NULL,NULL),(245,70,375,3,2,'1','14:45','16:15','#0066CC','docente','A','true',NULL,NULL,NULL),(246,70,375,3,3,'1','14:45','16:15','#0066CC','docente','A','true',NULL,NULL,NULL),(247,72,398,1,2,'5','11:15','12:45','#0066CC','docente','A','true',NULL,NULL,NULL),(248,72,398,1,3,'5','11:15','12:45','#0066CC','docente','A','true',NULL,NULL,NULL),(249,70,375,3,2,'5','13:00','14:30','#006600','docente','A','true',NULL,NULL,NULL),(250,70,375,3,3,'5','13:00','14:30','#006600','docente','A','true',NULL,NULL,NULL),(251,72,398,1,2,'5','17:00','18:30','#006600','docente','A','true',NULL,NULL,NULL),(252,72,398,1,3,'5','17:00','18:30','#006600','docente','A','true',NULL,NULL,NULL),(253,71,375,10,2,'1','17:15','20:00','#006600','docente','A','true',NULL,NULL,NULL),(254,71,375,10,3,'1','17:15','20:00','#006600','docente','A','true',NULL,NULL,NULL),(255,69,405,5,2,'3','14:00','17:00','#006600','docente','A','true',NULL,NULL,NULL),(256,69,405,5,3,'3','14:00','17:00','#006600','docente','A','true',NULL,NULL,NULL),(257,82,388,3,2,'1','07:45','09:15','#006600','docente','A','true',NULL,NULL,NULL),(258,82,388,3,3,'1','07:45','09:15','#006600','docente','A','true',NULL,NULL,NULL),(259,92,382,6,2,'1','09:30','11:00','#006600','docente','A','true',NULL,NULL,NULL),(260,92,382,6,3,'1','09:30','11:00','#006600','docente','A','true',NULL,NULL,NULL),(261,91,382,4,2,'1','11:15','12:45','#006600','docente','A','true',NULL,NULL,NULL),(262,91,382,4,3,'1','11:15','12:45','#006600','docente','A','true',NULL,NULL,NULL),(263,82,388,1,2,'2','07:45','09:15','#006600','docente','A','true',NULL,NULL,NULL),(264,82,388,1,3,'2','07:45','09:15','#006600','docente','A','true',NULL,NULL,NULL),(265,91,382,2,2,'2','09:30','11:00','#006600','docente','A','true',NULL,NULL,NULL),(266,91,382,2,3,'2','09:30','11:00','#006600','docente','A','true',NULL,NULL,NULL),(267,84,411,2,2,'2','11:15','12:45','#006600','docente','A','true',NULL,NULL,NULL),(268,84,411,2,3,'2','11:15','12:45','#006600','docente','A','true',NULL,NULL,NULL),(269,92,382,2,2,'4','07:45','09:15','#006600','docente','A','true',NULL,NULL,NULL),(270,92,382,2,3,'4','07:45','09:15','#006600','docente','A','true',NULL,NULL,NULL),(271,89,379,4,2,'4','13:00','14:30','#006600','docente','A','true',NULL,NULL,NULL),(272,89,379,4,3,'4','13:00','14:30','#006600','docente','A','true',NULL,NULL,NULL),(273,89,379,1,2,'5','09:30','11:00','#006600','docente','A','true',NULL,NULL,NULL),(274,89,379,1,3,'5','09:30','11:00','#006600','docente','A','true',NULL,NULL,NULL),(275,84,411,2,2,'5','11:15','12:45','#006600','docente','A','true',NULL,NULL,NULL),(276,84,411,2,3,'5','11:15','12:45','#006600','docente','A','true',NULL,NULL,NULL),(277,92,382,11,2,'1','14:00','16:45','#006600','docente','A','true',NULL,NULL,NULL),(278,92,382,11,3,'1','14:00','16:45','#006600','docente','A','true',NULL,NULL,NULL),(279,90,398,11,2,'5','14:00','16:45','#006600','docente','A','true',NULL,NULL,NULL),(280,90,398,11,3,'5','14:00','16:45','#006600','docente','A','true',NULL,NULL,NULL),(281,85,396,1,2,'1','13:00','14:30','#006600','docente','A','true',NULL,NULL,NULL),(282,85,396,1,3,'1','13:00','14:30','#006600','docente','A','true',NULL,NULL,NULL),(283,85,396,4,2,'3','09:30','11:00','#006600','docente','A','true',NULL,NULL,NULL),(284,85,396,4,3,'3','09:30','11:00','#006600','docente','A','true',NULL,NULL,NULL),(285,65,373,1,2,'3','11:15','12:45','#006600','docente','A','true',NULL,NULL,NULL),(286,65,373,1,3,'3','11:15','12:45','#006600','docente','A','true',NULL,NULL,NULL),(287,79,373,1,2,'3','13:00','14:30','#006600','docente','A','true',NULL,NULL,NULL),(288,79,373,1,3,'3','13:00','14:30','#006600','docente','A','true',NULL,NULL,NULL),(289,79,373,4,2,'4','07:45','09:15','#006600','docente','A','true',NULL,NULL,NULL),(290,79,373,4,3,'4','07:45','09:15','#006600','docente','A','true',NULL,NULL,NULL),(291,65,373,1,2,'4','11:15','12:45','#006600','docente','A','true',NULL,NULL,NULL),(292,65,373,1,3,'4','11:15','12:45','#006600','docente','A','true',NULL,NULL,NULL),(293,87,390,12,2,'4','14:45','16:15','#006600','docente','A','true',NULL,NULL,NULL),(294,87,390,12,3,'4','14:45','16:15','#006600','docente','A','true',NULL,NULL,NULL),(295,87,390,3,2,'5','07:45','09:15','#006600','docente','A','true',NULL,NULL,NULL),(296,87,390,3,3,'5','07:45','09:15','#006600','docente','A','true',NULL,NULL,NULL),(297,88,390,10,2,'1','08:00','11:00','#006600','docente','A','true',NULL,NULL,NULL),(298,88,390,10,3,'1','08:00','11:00','#006600','docente','A','true',NULL,NULL,NULL),(299,86,396,10,2,'2','12:30','14:00','#006600','docente','A','true',NULL,NULL,NULL),(300,86,396,10,3,'2','12:30','14:00','#006600','docente','A','true',NULL,NULL,NULL),(301,81,385,3,2,'3','14:45','16:15','#006600','docente','A','true',NULL,NULL,NULL),(302,81,385,3,3,'3','14:45','16:15','#006600','docente','A','true',NULL,NULL,NULL),(303,81,385,4,2,'1','14:45','16:15','#006600','docente','A','true',NULL,NULL,NULL),(304,81,385,4,3,'1','14:45','16:15','#006600','docente','A','true',NULL,NULL,NULL),(315,93,387,2,2,'5','16:00','17:30','#006600','docente','A','true',NULL,NULL,NULL),(316,93,387,2,3,'5','16:00','17:30','#006600','docente','A','true',NULL,NULL,NULL),(317,93,387,2,2,'6','07:45','09:15','#006600','docente','A','true',NULL,NULL,NULL),(318,93,387,2,3,'6','07:45','09:15','#006600','docente','A','true',NULL,NULL,NULL),(319,94,396,12,2,'1','07:45','09:15','#006600','docente','B','true',NULL,NULL,NULL),(320,94,396,12,3,'1','07:45','09:15','#006600','docente','B','true',NULL,NULL,NULL),(321,94,379,3,2,'1','11:15','12:45','#006600','docente','D','true',NULL,NULL,NULL),(322,94,379,3,3,'1','11:15','12:45','#006600','docente','D','true',NULL,NULL,NULL),(323,94,391,12,2,'2','09:30','11:00','#006600','docente','C','true',NULL,NULL,NULL),(324,94,391,12,3,'2','09:30','11:00','#006600','docente','C','true',NULL,NULL,NULL),(325,94,382,4,2,'2','11:15','12:45','#006600','docente','A','true',NULL,NULL,NULL),(326,94,382,4,3,'2','11:15','12:45','#006600','docente','A','true',NULL,NULL,NULL),(327,94,396,12,2,'3','07:45','09:15','#006600','docente','B','true',NULL,NULL,NULL),(328,94,396,12,3,'3','07:45','09:15','#006600','docente','B','true',NULL,NULL,NULL),(329,94,382,12,2,'4','09:30','11:00','#006600','docente','B','true',NULL,NULL,NULL),(330,94,382,12,3,'4','09:30','11:00','#006600','docente','B','true',NULL,NULL,NULL),(331,94,390,12,2,'4','11:15','12:45','#006600','docente','E','true',NULL,NULL,NULL),(332,94,390,12,3,'4','11:15','12:45','#006600','docente','E','true',NULL,NULL,NULL),(333,95,409,1,2,'5','07:45','09:15','#006600','docente','A','true',NULL,NULL,NULL),(334,95,409,1,3,'5','07:45','09:15','#006600','docente','A','true',NULL,NULL,NULL),(335,94,390,3,2,'5','09:30','11:00','#006600','docente','E','true',NULL,NULL,NULL),(336,94,390,3,3,'5','09:30','11:00','#006600','docente','E','true',NULL,NULL,NULL),(337,95,409,4,2,'6','11:15','12:45','#006600','docente','A','true',NULL,NULL,NULL),(338,95,409,4,3,'6','11:15','12:45','#006600','docente','A','true',NULL,NULL,NULL),(339,94,375,12,2,'4','18:15','19:45','#006600','docente','G','true',NULL,NULL,NULL),(340,94,375,12,3,'4','18:15','19:45','#006600','docente','G','true',NULL,NULL,NULL),(341,94,375,12,2,'5','18:15','19:45','#006600','docente','G','true',NULL,NULL,NULL),(342,94,375,12,3,'5','18:15','19:45','#006600','docente','G','true',NULL,NULL,NULL),(343,94,391,5,2,'3','09:30','11:00','#006600','docente','C','true',NULL,NULL,NULL),(344,94,391,5,3,'3','09:30','11:00','#006600','docente','C','true',NULL,NULL,NULL),(346,93,385,4,3,'6','14:00','15:30','#00FF00','auxiliar','A','true',NULL,NULL,NULL);
/*!40000 ALTER TABLE `clases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `datos`
--

DROP TABLE IF EXISTS `datos`;
/*!50001 DROP VIEW IF EXISTS `datos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `datos` AS SELECT 
 1 AS `id`,
 1 AS `groupId`,
 1 AS `materia`,
 1 AS `title`,
 1 AS `semestre`,
 1 AS `tipo`,
 1 AS `paralelo`,
 1 AS `nivel`,
 1 AS `tituloResponsable`,
 1 AS `responsable`,
 1 AS `ambiente`,
 1 AS `tipoAmbiente`,
 1 AS `capacidad`,
 1 AS `daysOfWeek`,
 1 AS `startTime`,
 1 AS `endTime`,
 1 AS `periodo`,
 1 AS `startDate`,
 1 AS `endDate`,
 1 AS `color`,
 1 AS `ambiente_id`,
 1 AS `periodo_id`,
 1 AS `responsable_id`,
 1 AS `materia_id`,
 1 AS `estado`,
 1 AS `deleted`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia_mencion`
--

DROP TABLE IF EXISTS `materia_mencion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia_mencion` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `materia_id` int unsigned NOT NULL,
  `mencion_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia_mencion`
--

LOCK TABLES `materia_mencion` WRITE;
/*!40000 ALTER TABLE `materia_mencion` DISABLE KEYS */;
INSERT INTO `materia_mencion` VALUES (1,1,2,NULL,NULL),(2,2,2,NULL,NULL),(3,3,2,NULL,NULL),(4,4,2,NULL,NULL),(5,5,2,NULL,NULL),(6,6,2,NULL,NULL),(7,7,2,NULL,NULL),(8,8,2,NULL,NULL),(9,9,2,NULL,NULL),(10,10,2,NULL,NULL),(11,11,2,NULL,NULL),(12,12,2,NULL,NULL),(13,13,2,NULL,NULL),(14,14,2,NULL,NULL),(15,15,2,NULL,NULL),(16,16,2,NULL,NULL),(17,17,2,NULL,NULL),(18,18,2,NULL,NULL),(19,19,2,NULL,NULL),(20,20,2,NULL,NULL),(21,21,2,NULL,NULL),(22,22,2,NULL,NULL),(23,23,2,NULL,NULL),(24,24,2,NULL,NULL),(25,25,2,NULL,NULL),(26,26,2,NULL,NULL),(27,27,2,NULL,NULL),(28,28,2,NULL,NULL),(29,29,2,NULL,NULL),(30,30,2,NULL,NULL),(31,31,2,NULL,NULL),(32,32,2,NULL,NULL),(33,33,2,NULL,NULL),(34,34,2,NULL,NULL),(35,35,2,NULL,NULL),(36,36,2,NULL,NULL),(37,37,2,NULL,NULL),(38,38,2,NULL,NULL),(39,39,2,NULL,NULL),(40,40,2,NULL,NULL),(41,41,2,NULL,NULL),(42,42,2,NULL,NULL),(43,43,2,NULL,NULL),(44,44,2,NULL,NULL),(45,45,2,NULL,NULL),(46,46,2,NULL,NULL),(47,47,2,NULL,NULL),(48,49,2,NULL,NULL),(49,50,2,NULL,NULL),(50,51,2,NULL,NULL),(51,55,2,NULL,NULL),(52,56,2,NULL,NULL),(53,57,2,NULL,NULL),(54,58,2,NULL,NULL),(55,59,2,NULL,NULL),(56,62,2,NULL,NULL),(57,63,2,NULL,NULL),(58,66,2,NULL,NULL),(59,69,2,NULL,NULL),(60,70,2,NULL,NULL),(61,71,2,NULL,NULL),(62,72,2,NULL,NULL),(63,73,2,NULL,NULL),(64,83,2,NULL,NULL),(65,84,2,NULL,NULL),(66,85,2,NULL,NULL),(67,86,2,NULL,NULL),(68,87,2,NULL,NULL),(69,88,2,NULL,NULL),(70,93,2,NULL,NULL),(71,94,2,NULL,NULL),(72,1,4,NULL,NULL),(73,2,4,NULL,NULL),(74,3,4,NULL,NULL),(75,4,4,NULL,NULL),(76,5,4,NULL,NULL),(77,6,4,NULL,NULL),(78,7,4,NULL,NULL),(79,8,4,NULL,NULL),(80,9,4,NULL,NULL),(81,10,4,NULL,NULL),(82,11,4,NULL,NULL),(83,12,4,NULL,NULL),(84,13,4,NULL,NULL),(85,14,4,NULL,NULL),(86,15,4,NULL,NULL),(87,16,4,NULL,NULL),(88,17,4,NULL,NULL),(89,18,4,NULL,NULL),(90,19,4,NULL,NULL),(91,20,4,NULL,NULL),(92,21,4,NULL,NULL),(93,22,4,NULL,NULL),(94,23,4,NULL,NULL),(95,24,4,NULL,NULL),(96,25,4,NULL,NULL),(97,26,4,NULL,NULL),(98,27,4,NULL,NULL),(99,28,4,NULL,NULL),(100,29,4,NULL,NULL),(101,30,4,NULL,NULL),(102,31,4,NULL,NULL),(103,32,4,NULL,NULL),(104,33,4,NULL,NULL),(105,34,4,NULL,NULL),(106,35,4,NULL,NULL),(107,36,4,NULL,NULL),(108,37,4,NULL,NULL),(109,38,4,NULL,NULL),(110,39,4,NULL,NULL),(111,40,4,NULL,NULL),(112,41,4,NULL,NULL),(113,42,4,NULL,NULL),(114,43,4,NULL,NULL),(115,44,4,NULL,NULL),(116,45,4,NULL,NULL),(117,46,4,NULL,NULL),(118,47,4,NULL,NULL),(119,48,4,NULL,NULL),(120,49,4,NULL,NULL),(121,50,4,NULL,NULL),(122,51,4,NULL,NULL),(123,60,4,NULL,NULL),(124,61,4,NULL,NULL),(125,62,4,NULL,NULL),(126,63,4,NULL,NULL),(127,66,4,NULL,NULL),(128,74,4,NULL,NULL),(129,75,4,NULL,NULL),(130,76,4,NULL,NULL),(131,77,4,NULL,NULL),(132,82,4,NULL,NULL),(133,83,4,NULL,NULL),(134,84,4,NULL,NULL),(135,89,4,NULL,NULL),(136,90,4,NULL,NULL),(137,91,4,NULL,NULL),(138,92,4,NULL,NULL),(139,93,4,NULL,NULL),(140,94,4,NULL,NULL),(141,1,3,NULL,NULL),(142,2,3,NULL,NULL),(143,3,3,NULL,NULL),(144,4,3,NULL,NULL),(145,5,3,NULL,NULL),(146,6,3,NULL,NULL),(147,7,3,NULL,NULL),(148,8,3,NULL,NULL),(149,9,3,NULL,NULL),(150,10,3,NULL,NULL),(151,11,3,NULL,NULL),(152,12,3,NULL,NULL),(153,13,3,NULL,NULL),(154,14,3,NULL,NULL),(155,15,3,NULL,NULL),(156,16,3,NULL,NULL),(157,17,3,NULL,NULL),(158,18,3,NULL,NULL),(159,19,3,NULL,NULL),(160,20,3,NULL,NULL),(161,21,3,NULL,NULL),(162,22,3,NULL,NULL),(163,23,3,NULL,NULL),(164,24,3,NULL,NULL),(165,25,3,NULL,NULL),(166,26,3,NULL,NULL),(167,27,3,NULL,NULL),(168,28,3,NULL,NULL),(169,29,3,NULL,NULL),(170,30,3,NULL,NULL),(171,31,3,NULL,NULL),(172,32,3,NULL,NULL),(173,33,3,NULL,NULL),(174,34,3,NULL,NULL),(175,35,3,NULL,NULL),(176,36,3,NULL,NULL),(177,37,3,NULL,NULL),(178,38,3,NULL,NULL),(179,39,3,NULL,NULL),(180,40,3,NULL,NULL),(181,41,3,NULL,NULL),(182,42,3,NULL,NULL),(183,43,3,NULL,NULL),(184,44,3,NULL,NULL),(185,45,3,NULL,NULL),(186,46,3,NULL,NULL),(187,47,3,NULL,NULL),(188,48,3,NULL,NULL),(189,49,3,NULL,NULL),(190,50,3,NULL,NULL),(191,51,3,NULL,NULL),(192,62,3,NULL,NULL),(193,63,3,NULL,NULL),(194,66,3,NULL,NULL),(195,82,3,NULL,NULL),(196,83,3,NULL,NULL),(197,93,3,NULL,NULL),(198,94,3,NULL,NULL),(199,52,3,NULL,NULL),(200,53,3,NULL,NULL),(201,54,3,NULL,NULL),(202,64,3,NULL,NULL),(203,65,3,NULL,NULL),(204,67,3,NULL,NULL),(205,68,3,NULL,NULL),(206,78,3,NULL,NULL),(207,79,3,NULL,NULL),(208,80,3,NULL,NULL),(209,81,3,NULL,NULL),(210,95,3,NULL,NULL),(211,55,4,NULL,NULL),(212,73,4,NULL,NULL),(213,79,2,NULL,NULL),(214,65,2,NULL,NULL),(215,99,2,NULL,NULL),(217,69,3,NULL,NULL),(218,99,3,NULL,NULL),(220,57,3,NULL,NULL),(221,58,3,NULL,NULL);
/*!40000 ALTER TABLE `materia_mencion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias`
--

DROP TABLE IF EXISTS `materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materias` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sigla` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `semestre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pensum_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `materias_pensum_id_foreign` (`pensum_id`),
  CONSTRAINT `materias_pensum_id_foreign` FOREIGN KEY (`pensum_id`) REFERENCES `pensums` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias`
--

LOCK TABLES `materias` WRITE;
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO `materias` VALUES (1,'FIS 100','Fisica Basica Y Laboratorio','teoria','1',1,NULL,NULL),(2,'FIS 100 L','Fisica Basica Y Laboratorio','laboratorio','1',1,NULL,NULL),(3,'MAT 100','Algebra','teoria','1',1,NULL,NULL),(4,'MAT 101','Calculo I','teoria','1',1,NULL,NULL),(5,'QMC 100','Quimica General Y Laboratorio','teoria','1',1,NULL,NULL),(6,'QMC 100 L','Quimica General Y Laboratorio','laboratorio','1',1,NULL,NULL),(7,'MEC 101','Dibujo Tecnico','teoria','1',1,NULL,NULL),(8,'ETN 507','Historia Critica De America Latina','teoria','1',1,NULL,NULL),(9,'FIS 102','Fisica Basica II Y Laboratorio','teoria','2',1,NULL,NULL),(10,'FIS 102 L','Fisica Basica II Y Laboratorio','laboratorio','2',1,NULL,NULL),(11,'MAT 102','Calculo II','teoria','2',1,NULL,NULL),(12,'MAT 103','Algebra Lineal Y Teoria Matricial','teoria','2',1,NULL,NULL),(13,'MAT 208','Analisis De Variable Compleja','teoria','2',1,NULL,NULL),(14,'ETN 401','Probabilidad Y Estadistica','teoria','2',1,NULL,NULL),(15,'FIS 200','Fisica Basica III Y Laboratorio','teoria','3',1,NULL,NULL),(16,'FIS 200 L','Fisica Basica III Y Laboratorio','laboratorio','3',1,NULL,NULL),(17,'MAT 207','Ecuaciones Diferenciales','teoria','3',1,NULL,NULL),(18,'MAT 303','Analisis Vectorial Y Tensorial','teoria','3',1,NULL,NULL),(19,'ETN 302','Teoria De Redes I','teoria','3',1,NULL,NULL),(20,'ETN 406','Tecnologia De Los Componentes','teoria','3',1,NULL,NULL),(21,'ETN 307','Programacion','teoria','3',1,NULL,NULL),(22,'ETN 340','Proyecto I','teoria','3',1,NULL,NULL),(23,'MAT 305','Transformadas Integrales','teoria','4',1,NULL,NULL),(24,'ETN 402','Teoria De Redes II','teoria','4',1,NULL,NULL),(25,'ETN 404','Mediciones Electricas','teoria','4',1,NULL,NULL),(26,'ETN 404 L','Mediciones Electricas','laboratorio','4',1,NULL,NULL),(27,'ETN 501','Fisica Del Estado Solido','teoria','4',1,NULL,NULL),(28,'ETN 503','Electronica I','teoria','4',1,NULL,NULL),(29,'ETN 503 L','Electronica I','laboratorio','4',1,NULL,NULL),(30,'ETN 505','Programacion Y Metodos Numericos','teoria','4',1,NULL,NULL),(31,'ETN 607','Mecanica Aplicada','teoria','4',1,NULL,NULL),(32,'ETN 502','Campos Electromagneticos','teoria','5',1,NULL,NULL),(33,'ETN 506','Analisis De Sistemas Lineales','teoria','5',1,NULL,NULL),(34,'ETN 601','Sistemas Digitales I','teoria','5',1,NULL,NULL),(35,'ETN 601 L','Sistemas Digitales I','laboratorio','5',1,NULL,NULL),(36,'ETN 603','Electronica II','teoria','5',1,NULL,NULL),(37,'ETN 603 L','Electronica II','laboratorio','5',1,NULL,NULL),(38,'ETN 805','Investigacion De Operaciones','teoria','5',1,NULL,NULL),(39,'ETN 606','Conversion Electromagnetica De Energia','teoria','6',1,NULL,NULL),(40,'ETN 606 L','Conversion Electromagnetica De Energia','laboratorio','6',1,NULL,NULL),(41,'ETN 702','Sistemas De Control I','teoria','6',1,NULL,NULL),(42,'ETN 702 L','Sistemas De Control I','laboratorio','6',1,NULL,NULL),(43,'ETN 703','Teoria De Telecomunicaciones I','teoria','6',1,NULL,NULL),(44,'ETN 703 L','Teoria De Telecomunicaciones I','laboratorio','6',1,NULL,NULL),(45,'ETN 821','Sistemas Digitales II','teoria','6',1,NULL,NULL),(46,'ETN 821 L','Sistemas Digitales II','laboratorio','6',1,NULL,NULL),(47,'ETN 640','Proyecto II','teoria','6',1,NULL,NULL),(48,'ETN 1016','Teoria De Telecomunicaciones II','teoria','7',1,NULL,NULL),(49,'ETN 801','Microprocesadores','teoria','7',1,NULL,NULL),(50,'ETN 801 L','Microprocesadores','laboratorio','7',1,NULL,NULL),(51,'ETN 806','Procesos Estocasticos','teoria','7',1,NULL,NULL),(52,'ETN 802','Electronica Industrial','teoria','7',1,NULL,NULL),(53,'ETN 802 L','Electronica Industrial','laboratorio','7',1,NULL,NULL),(54,'ETN 825','Organizacion Y Diseńo De Computadoras','teoria','7',1,NULL,NULL),(55,'ETN 704','Electronica De Pulsos','teoria','7',1,NULL,NULL),(56,'ETN 704 L','Electronica De Pulsos','laboratorio','7',1,NULL,NULL),(57,'ETN 832','Electronica Industrial','teoria','7',1,NULL,NULL),(58,'ETN 832 L','Electronica Industrial','laboratorio','7',1,NULL,NULL),(59,'ETN 902','Sistemas De Control II','teoria','7',1,NULL,NULL),(60,'ETN 814','Lineas De Transmision Y Guias De Onda','teoria','7',1,NULL,NULL),(61,'ETN 814 L','Lineas De Transmision Y Guias De Onda','laboratorio','7',1,NULL,NULL),(62,'ETN 903','Sistemas De Computacion','teoria','8',1,NULL,NULL),(63,'ETN 903 L','Sistemas De Computacion','laboratorio','8',1,NULL,NULL),(64,'ETN 901','Teoria De Sistemas Operativos','teoria','8',1,NULL,NULL),(65,'ETN 1039','Seminarios De Control','teoria','9',1,NULL,NULL),(66,'ETN 1015','Procesamiento Digital De Seńales','teoria','8',1,NULL,NULL),(67,'ETN 1000','Base De Datos','teoria','8',1,NULL,NULL),(68,'ETN 800','Preparacion Y Evaluacion De Proyectos','teoria','8',1,NULL,NULL),(69,'ETN 921','Teoria De Sistemas Operativos','teoria','8',1,NULL,NULL),(70,'ETN 933','Control Y Regulacion Industrial','teoria','8',1,NULL,NULL),(71,'ETN 933 L','Control Y Regulacion Industrial','laboratorio','8',1,NULL,NULL),(72,'ETN 1022','Interaccion Hardware Software','teoria','8',1,NULL,NULL),(73,'ETN 840','Preparacion Y Evaluacion De Proyectos','teoria','8',1,NULL,NULL),(74,'ETN 911','Sistemas De Comunicaciones I','teoria','8',1,NULL,NULL),(75,'ETN 911 L','Sistemas De Comunicaciones I','laboratorio','8',1,NULL,NULL),(76,'ETN 913','Antenas Y Propagacion','teoria','8',1,NULL,NULL),(77,'ETN 913 L','Antenas Y Propagacion','laboratorio','8',1,NULL,NULL),(78,'ETN 1014','Redes De Computadores','teoria','9',1,NULL,NULL),(79,'ETN 1036','Simulacion De Procesos Industriales','teoria','9',1,NULL,NULL),(80,'ETN 1010','Inteligencia Artificial','teoria','9',1,NULL,NULL),(81,'ETN 1001','Ingenieria De Software','teoria','9',1,NULL,NULL),(82,'ETN 1012','Telefonia','teoria','9',1,NULL,NULL),(83,'REC 92','Estudio De Los Recursos Naturales','teoria','9',1,NULL,NULL),(84,'ETN 935','Redes De Datos','teoria','9',1,NULL,NULL),(85,'ETN 1034','Aplicacion De Tecnicas De Control','teoria','9',1,NULL,NULL),(86,'ETN 1034 L','Aplicacion De Tecnicas De Control','laboratorio','9',1,NULL,NULL),(87,'ETN 1037','Instrumentos Industriales','teoria','9',1,NULL,NULL),(88,'ETN 1037 L','Instrumentos Industriales','laboratorio','9',1,NULL,NULL),(89,'ETN 1011','Sistemas De Comunicacion II','teoria','9',1,NULL,NULL),(90,'ETN 1011 L','Sistemas De Comunicacion II','laboratorio','9',1,NULL,NULL),(91,'ETN 1024','Seminario Taller De Telecomunicaciones','teoria','9',1,NULL,NULL),(92,'ETN 1038','Tecnologia De Telecomunicaciones','teoria','9',1,NULL,NULL),(93,'ETN 906','Practica Industrial','teoria','10',1,NULL,NULL),(94,'ETN 1040','Proyecto De Grado','teoria','10',1,NULL,NULL),(95,'ETN 2000','Estrategia Empresarial','teoria','10',1,NULL,NULL);
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mencions`
--

DROP TABLE IF EXISTS `mencions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mencions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mencions`
--

LOCK TABLES `mencions` WRITE;
/*!40000 ALTER TABLE `mencions` DISABLE KEYS */;
INSERT INTO `mencions` VALUES (1,'General',''),(2,'Control',''),(3,'Sistemas',''),(4,'Telecom.','');
/*!40000 ALTER TABLE `mencions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (75,'2019_08_06_172913_create_semestres_table',1),(76,'2019_08_19_000000_create_failed_jobs_table',1),(77,'2020_12_00_140143_create_responsables_table',1),(78,'2020_12_03_125019_create_ambientes_table',1),(79,'2020_12_04_172913_create_pensums_table',1),(80,'2020_12_05_172913_create_mencions_table',1),(81,'2020_12_06_224012_create_materias_table',1),(82,'2020_12_07_151557_create_periodos_table',1),(83,'2020_12_08_175015_create_materia_mencion_table',1),(84,'2020_12_09_213918_create_clases_table',1),(85,'2020_12_10_000000_create_users_table',1),(92,'2014_10_12_100000_create_password_resets_table',2),(93,'2016_06_01_000001_create_oauth_auth_codes_table',2),(94,'2016_06_01_000002_create_oauth_access_tokens_table',2),(95,'2016_06_01_000003_create_oauth_refresh_tokens_table',2),(96,'2016_06_01_000004_create_oauth_clients_table',2),(97,'2016_06_01_000005_create_oauth_personal_access_clients_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('0348c1d1cf92917c21a45fe6acec9e955e43fbbad224acb66f592ca32c765846c22cac0a077e8c2f',21,2,NULL,'[]',0,'2021-04-27 19:53:14','2021-04-27 19:53:14','2022-04-27 15:53:14'),('03dd29f2ea6065af7505263de7801b7d2e494dc821ac43900ba7b4c75622a1fee6504ce5c304d7f4',21,2,NULL,'[]',0,'2021-05-18 14:20:54','2021-05-18 14:20:54','2022-05-18 10:20:54'),('057936c167f32b4e6af68de39dec83105a66d11a0aa418836dbc4f078bc113dc4afeeae25f6cc3bb',21,2,NULL,'[]',0,'2021-07-04 04:46:15','2021-07-04 04:46:15','2022-07-04 00:46:15'),('0d5df317364b5e357137a6179ed27d8e960f2548254e8e9224d1321786c2caa1fe5fc9a910cceb80',16,2,NULL,'[]',0,'2021-04-27 18:40:34','2021-04-27 18:40:34','2022-04-27 14:40:34'),('0e891ea0c947597a852ef29cc88a904562fddbb53333b59d393d918b88da22115c214aba5e9ad16d',16,2,NULL,'[]',0,'2021-05-18 14:33:40','2021-05-18 14:33:40','2022-05-18 10:33:40'),('0e9108ed6fde2b4c837a8f4fca389560ac41f2784729b446ffb6bece8fa53b51a0665e301c35b6d2',16,2,NULL,'[]',0,'2021-04-29 20:18:25','2021-04-29 20:18:25','2022-04-29 16:18:25'),('105f5439472dcb9c781b9434d53c1b53e069d880e4ae91a87196c6ba5c39dd92f6a50a3f873e204d',16,2,NULL,'[]',0,'2021-07-01 04:24:23','2021-07-01 04:24:23','2022-07-01 00:24:23'),('11763c580217e0036197fd7966f9b764ff28fbcf01ca22e3d9ad8ffea26e8c40d7c4989b0d3e4045',21,2,NULL,'[]',0,'2021-05-18 14:19:00','2021-05-18 14:19:00','2022-05-18 10:19:00'),('129612b6b23909b4d9820622b1793dff9a2185ebdf2c17d8f63e038cfdba7987e9bfa19cf4eacc36',16,2,NULL,'[]',0,'2021-06-16 18:05:45','2021-06-16 18:05:45','2022-06-16 14:05:45'),('12b2de04b5fbfd8431e9b62894bb2d9acdb545347ff7331378cc99f64d457d87fb2589815e19fb6a',16,2,NULL,'[]',0,'2021-07-04 03:35:51','2021-07-04 03:35:51','2022-07-03 23:35:51'),('1391add339bf6a6d1304165365b33a1b895bc71daf1a2844d4018600c4d25ea2487cc0b8f0f80b2e',16,2,NULL,'[]',0,'2021-05-18 14:30:17','2021-05-18 14:30:17','2022-05-18 10:30:17'),('1570eed4509160177df25888ae56b4976f99e59cce202223da8048b57b83395e774334d0dfea8b36',16,2,NULL,'[]',0,'2021-06-17 13:18:36','2021-06-17 13:18:36','2022-06-17 09:18:36'),('17c2a06e0325108789af317fdbc053e0fb71730c300083952cdbff00cd9b7c58565daf1095aff0db',16,2,NULL,'[]',0,'2021-05-05 12:31:24','2021-05-05 12:31:24','2022-05-05 08:31:24'),('191845668776680387db7e0a39670c9845ecf9c09efb414a0f480c2df0b51b426fb7e3019aef4edd',21,2,NULL,'[]',0,'2021-04-27 19:50:44','2021-04-27 19:50:44','2022-04-27 15:50:44'),('1d72b2b8d3c266d7175ece1de6e4b44d204140e032547af6e36cc9ce631466f64921bd8d44f0ddb6',16,2,NULL,'[]',0,'2021-06-15 12:28:25','2021-06-15 12:28:25','2022-06-15 08:28:25'),('21a9441d38b65b49911d6327a08ed1d3f2391aa42156e1cd70f1baf9327e62a7b9a720a9b170e156',16,2,NULL,'[]',0,'2021-06-29 13:01:58','2021-06-29 13:01:58','2022-06-29 09:01:58'),('25a67a48368fbd1a9ab66f9af122080ffb250341c0b29e819f9a48c4e0c566f7e1c8d8a2828a2983',16,2,NULL,'[]',0,'2021-05-19 04:19:06','2021-05-19 04:19:06','2022-05-19 00:19:06'),('27ab8cad9dfc89f528764e8b19c4514d83f97ee73c77146e0b291bc1c97be0d7daf0eeea93645597',21,2,NULL,'[]',0,'2021-07-04 05:00:59','2021-07-04 05:00:59','2022-07-04 01:00:59'),('2860249300197d2fafec8519590576d3dd7eff1866f683153f8fd8339a2a04a9ca28e3eba13213b2',16,2,NULL,'[]',0,'2021-05-27 13:33:13','2021-05-27 13:33:13','2022-05-27 09:33:13'),('28c3059188234c91fcc33e28d7eb5bc401c1b8cef7d267d2c69b337b3a44077489fed26d9f0a51a4',16,2,NULL,'[]',0,'2021-05-20 02:03:35','2021-05-20 02:03:35','2022-05-19 22:03:35'),('2a305ba980bbf1e6554de65c8bb950aba75b6f1f6ae7f5ba24e00a36e878ce1cf9d599f82314407d',16,2,NULL,'[]',0,'2021-04-27 02:42:29','2021-04-27 02:42:29','2022-04-26 22:42:29'),('2a4fd3935dc510c7786cb3534dad29a7d5ad49aa0b329fc047cac9a4b322ce34e13c048d837c031b',16,2,NULL,'[]',0,'2021-04-29 13:05:01','2021-04-29 13:05:01','2022-04-29 09:05:01'),('2aa1210a0d57f02854aa463e6cf27d2df609a5e8ec990534a9f76ec773b839f4ec625154427d3bf7',16,1,'MyApp','[]',0,'2021-03-03 22:34:42','2021-03-03 22:34:42','2022-03-03 18:34:42'),('2ad4c7fa1c5a571f0d0c50b308760fbea73228fc9304ee7faf2459dd9ea49aa25d2d8787625d26ca',21,2,NULL,'[]',0,'2021-04-27 20:15:21','2021-04-27 20:15:21','2022-04-27 16:15:21'),('2b9ee269cd61f3c59eaf6aa6707191e26c6a9d0cef4af2517c3b29de11699605d5fdcf6033b89fe6',21,2,NULL,'[]',0,'2021-04-27 19:31:19','2021-04-27 19:31:19','2022-04-27 15:31:19'),('2ff7dd4a45fc11d68c5a9713fa53376e562b6f89ec8ceaa0272718df7cdcd4bf1127d813a0c65b40',21,2,NULL,'[]',0,'2021-04-21 19:25:08','2021-04-21 19:25:08','2022-04-21 15:25:08'),('33be4d90018d895a39217b4d650eb7d0740ce8b3920cd62c18847d8836687e29990336786db7688e',16,2,NULL,'[]',0,'2021-06-14 19:19:15','2021-06-14 19:19:15','2022-06-14 15:19:15'),('3447a4ddfa7521de2c9c715ee360a07690bdf5eceb27bbdf80daab963b8a832561e8d3b9a0517bad',16,2,NULL,'[]',0,'2021-05-18 15:33:11','2021-05-18 15:33:11','2022-05-18 11:33:11'),('388fbfdb113f5081e2c7518c44bf449b028675dcd610d8084422eddbea5e60e49cda200d28ee2c21',21,2,NULL,'[]',0,'2021-07-04 04:56:43','2021-07-04 04:56:43','2022-07-04 00:56:43'),('39ef0e8d4bc8fda0797db727ceb32c4bb9b567d354329f46768ef1517ea724912e7b0864a4979369',21,2,NULL,'[]',0,'2021-07-04 04:26:23','2021-07-04 04:26:23','2022-07-04 00:26:23'),('3aa84a83451181b289db00b3b6b9c694dcaff2c86a6a946070f00eb44268ca8c2faba8a99290ebe7',16,2,NULL,'[]',0,'2021-05-20 01:43:49','2021-05-20 01:43:49','2022-05-19 21:43:49'),('3fd4b3f96ce32077f420348d93f71712bf4d4ddc31ab3ddbc12c2bc8ce1d87aedaa7a1517838ad8f',16,2,NULL,'[]',0,'2021-04-28 21:36:09','2021-04-28 21:36:09','2022-04-28 17:36:09'),('4073aa8eb1d03c718c10a2068a390355aad1a6714c4f037dae19e1c3eeee5e238fdeabdc939e3853',16,2,NULL,'[]',0,'2021-06-19 00:54:43','2021-06-19 00:54:43','2022-06-18 20:54:43'),('42bab5b3e7c20d6a31c7d5b2923e420c68c1d9f20ce1fd02908262dc8c770a0662121ee18ce30eae',16,2,NULL,'[]',0,'2021-05-20 01:38:35','2021-05-20 01:38:35','2022-05-19 21:38:35'),('4459192937657bbfbe4f6231071e275960abe5d585b8c517074fad8730dc92d25874c469834df38e',16,2,NULL,'[]',0,'2021-04-27 19:16:07','2021-04-27 19:16:07','2022-04-27 15:16:07'),('44dd2cd6f6a9529adbea775e41062e7e0818c53c623bcdd880f28d765c5a8d0450ef918994c2ae15',16,2,NULL,'[]',0,'2021-05-18 14:45:48','2021-05-18 14:45:48','2022-05-18 10:45:48'),('45759f3986f35e5b69201ad2a891fb8a8574a45e2ffcd22a674860b72c9b310fec292b18f57469d3',16,2,NULL,'[]',0,'2021-04-27 20:18:03','2021-04-27 20:18:03','2022-04-27 16:18:03'),('46b2aba946041705b656b26dc302128cf5612a952a7ddd959e6dd06b3a8f5bffcbc69f4d4ad717bc',16,2,NULL,'[]',0,'2021-04-27 16:45:58','2021-04-27 16:45:58','2022-04-27 12:45:58'),('477e6d5de10766d27d15ae232ab5ef146d9bc9199e0ac123cdbd92c92daad9911b51627e79e1a70f',21,2,NULL,'[]',0,'2021-04-21 19:41:44','2021-04-21 19:41:44','2022-04-21 15:41:44'),('498783ea9d33101d01be99c0acd3f058cbd2e8232566a57d1742bd00d7ac0bf07532b187886adf9f',21,2,NULL,'[]',0,'2021-07-04 04:59:58','2021-07-04 04:59:58','2022-07-04 00:59:58'),('4ea1b329dba3106206eeadb8181b25c3f39661ce36998eab301c8c7f1248273f089107c3aeec63f3',16,2,NULL,'[]',0,'2021-04-27 16:49:45','2021-04-27 16:49:45','2022-04-27 12:49:45'),('4f0a4735ae654320fcdc3440050e7e298e9d21d76a7a1230de5ff8f11085aad4cf9543c5454b499c',16,2,NULL,'[]',0,'2021-03-03 23:54:42','2021-03-03 23:54:42','2022-03-03 19:54:42'),('4fd3a20c522eb04d4fef092481376bd73d14f5a4a5699a732316c21dfbd9d7e4137b59ebe20e2f0d',16,2,NULL,'[]',0,'2021-05-05 12:36:26','2021-05-05 12:36:26','2022-05-05 08:36:26'),('504d2682437a2e085bdaaa1c7df7ab6de6656f201508b25eb52cf0eb8bf957ef79edfce9d881e825',21,2,NULL,'[]',0,'2021-04-27 19:39:59','2021-04-27 19:39:59','2022-04-27 15:39:59'),('51c35557c374aa7c1e580cf64bec3617db7adbd687c88ebf0bdeefb2fd216a05641ad3c3eb4abd26',16,2,NULL,'[]',0,'2021-05-18 14:40:29','2021-05-18 14:40:29','2022-05-18 10:40:29'),('54bbdb0416c2916e4906ec4aff196a1c5a2f5a25fe1a3a29b9045eee0818726457dbba9ad71c3d2d',16,2,NULL,'[]',0,'2021-06-16 13:30:37','2021-06-16 13:30:37','2022-06-16 09:30:37'),('558f07843ad3f549ebf905507d32b65a37deef24e2c4209359678c168bbf43699a07a0aca692b531',16,2,NULL,'[]',0,'2021-06-29 13:00:46','2021-06-29 13:00:46','2022-06-29 09:00:46'),('55944836658ced59a4c515b36bec4ec6abeebf6428da6a26d97771095c4ce8fdbf6efcc704470802',21,2,NULL,'[]',0,'2021-04-27 19:19:30','2021-04-27 19:19:30','2022-04-27 15:19:30'),('55cdfb113e4e3b2e5556d9ecdde328db78c7534f3b87e71709ed5d94630f3daeb2f98deb01108d14',21,2,NULL,'[]',0,'2021-04-27 19:50:05','2021-04-27 19:50:05','2022-04-27 15:50:05'),('56f4679222c57c7aaaa07a1bf82d6120cc41f80a12bc7cf3b519309bb8c60763314f4ba59f2c35d1',16,2,NULL,'[]',0,'2021-03-24 05:11:04','2021-03-24 05:11:04','2022-03-24 01:11:04'),('58711af8ec78a8f83e2c686ab64bce5a92705aea5f8ebcfa864c64d141f0cd27d957e5ba2c6050de',16,2,NULL,'[]',0,'2021-07-10 11:34:06','2021-07-10 11:34:06','2022-07-10 07:34:06'),('58eeeb4f5cf6d300247e223de4c39c7d4c0051600d67e051f89369159afe9cda2c0027fbbb2355c6',16,2,NULL,'[]',0,'2021-04-27 16:43:55','2021-04-27 16:43:55','2022-04-27 12:43:55'),('5a37e5eb60c79d83d5e092212f55f8440ebd44604aca376a8195c591ae75acb6c518b741083babae',16,2,NULL,'[]',0,'2021-04-27 16:54:28','2021-04-27 16:54:28','2022-04-27 12:54:28'),('5a616918f9dcd7a8ccbc67bba50981613fb88ae30a0c00966c640dc41fa05b19653d3ed8561fa1a4',21,2,NULL,'[]',0,'2021-04-27 19:56:41','2021-04-27 19:56:41','2022-04-27 15:56:41'),('5cfece66ebed691cb2422f189f4ff89978b779f08ffe38d25f67339232366167d992af6572a88211',16,2,NULL,'[]',0,'2021-04-27 16:44:45','2021-04-27 16:44:45','2022-04-27 12:44:45'),('5d3a91b668e9558958f554c82cbe0eb354b9166fee59418cbe9ef152d0cb5f75ccabcf4caf2a26d6',16,2,NULL,'[]',0,'2021-04-27 11:57:24','2021-04-27 11:57:24','2022-04-27 07:57:24'),('5fed2bb1d71132e8cfefc6c2f653f29c57d87dc9ab2902d0358b61943540ed377c2c74111433741a',16,2,NULL,'[]',0,'2021-05-19 03:29:33','2021-05-19 03:29:33','2022-05-18 23:29:33'),('62c2c23daa84a117ee38b61411edc25e034cee8623c81e5aa80e966e0b271f01de984d5fe57a83a0',21,2,NULL,'[]',0,'2021-04-27 20:11:02','2021-04-27 20:11:02','2022-04-27 16:11:02'),('635477efa4cda7702758c96d05c20b1d27c5334cbe4578f676c9d4e490ee2fa731ad1e3b0944302d',16,2,NULL,'[]',0,'2021-04-27 16:16:08','2021-04-27 16:16:08','2022-04-27 12:16:08'),('680595e9802b2619125c3ea9fd10ae38973e467d088225c7636524835d033333188ae79ffcd1bf29',16,2,NULL,'[]',0,'2021-03-03 23:54:20','2021-03-03 23:54:20','2022-03-03 19:54:20'),('6839afe87e6e24973d1600059cf74ba0869362eafe618922a16e6268cead4ae0a9d2e4a06c74a2e3',16,2,NULL,'[]',0,'2021-04-27 11:57:14','2021-04-27 11:57:14','2022-04-27 07:57:14'),('698096b238ede855a2abd6475af5c84c162dd79c327ed5360ec5b794f8aa204e2b5910c8811c93f4',16,2,NULL,'[]',0,'2021-04-27 18:38:03','2021-04-27 18:38:03','2022-04-27 14:38:03'),('6adb972579263471cf5f38a98c634a10def253bc1c110ea953f61f5784af7765ce1549befae51ee6',21,2,NULL,'[]',0,'2021-07-04 04:57:35','2021-07-04 04:57:35','2022-07-04 00:57:35'),('72ffa8473bdd9fb69588745b136f10f8aab509e99329845c923e08e70983c97ac52f4bd42ba21828',21,2,NULL,'[]',0,'2021-04-21 19:53:24','2021-04-21 19:53:24','2022-04-21 15:53:24'),('751eb06b046768b0b99cfe76a5ac07f68c122a9ae3d2f8cf297b5d8f85753d86161fc5bbb1ccb0fb',16,2,NULL,'[]',0,'2021-04-28 15:09:36','2021-04-28 15:09:36','2022-04-28 11:09:36'),('766a927f3dc57fb1b5f582cf3b10ed6cf7689e1c70dcc078b0905a6b554cf2c246697cf12aa5ee09',16,2,NULL,'[]',0,'2021-03-28 22:39:47','2021-03-28 22:39:47','2022-03-28 18:39:47'),('772e5be7ddb20af53d03d5f5e5cc5f116e23f56df38d1de619099e7bce102c66f80fb95a3aed967c',21,2,NULL,'[]',0,'2021-07-04 04:20:47','2021-07-04 04:20:47','2022-07-04 00:20:47'),('7755a297ef1f635c07268bea466a06fbe337ebe2a148d5fd374f05f71321903db9ba4de70d4ce973',16,2,NULL,'[]',0,'2021-05-19 03:31:05','2021-05-19 03:31:05','2022-05-18 23:31:05'),('77fd08a247ea730037c768fbff2090afa3db4f7d7227a4184c5231c7acde45f0373eb1b0e8d69299',21,2,NULL,'[]',0,'2021-07-04 03:36:05','2021-07-04 03:36:05','2022-07-03 23:36:05'),('7879295b7f805f7063c2e8b6e3e5ad14c9d8ca959320aa621c42ea980100f81e156694b69e84635b',16,2,NULL,'[]',0,'2021-04-29 14:10:10','2021-04-29 14:10:10','2022-04-29 10:10:10'),('79cf633e36440addc1d6fac22d31885f78d2d8d0b4e74e3c9cc5fed08fa03616b81c1a6e2574ecf5',16,2,NULL,'[]',0,'2021-07-01 14:58:57','2021-07-01 14:58:57','2022-07-01 10:58:57'),('7e00d08eb332db2140d970b929cc5a1ef9d994134275d45b8dc74e9ef56aeb98a6dafb3c593b797d',16,2,NULL,'[]',0,'2021-05-18 14:36:15','2021-05-18 14:36:15','2022-05-18 10:36:15'),('7e1cdc21df77a66f0ba93bd4ae29ba533f784b908cf75630c481f657b681779cbd9b05206474351e',16,2,NULL,'[]',0,'2021-06-08 13:18:57','2021-06-08 13:18:57','2022-06-08 09:18:57'),('7f62149c4cc8465f62027e7cfca99fbb39aaef8d1baca10b556345eb99e41d8dda716f6aeeadc4a7',16,2,NULL,'[]',0,'2021-06-10 23:06:27','2021-06-10 23:06:27','2022-06-10 19:06:27'),('7fa46e334147c8764fd92f17e524d87414f56bec05a50e77c399cc9efe4d501f155d66e70e2de9c6',16,2,NULL,'[]',0,'2021-06-07 15:10:03','2021-06-07 15:10:03','2022-06-07 11:10:03'),('81606b8a1ba6d2c26a0c41effc87a78f1967c3e12b3c7b85fe8540623ace909fb11a931b9f66acf0',16,2,NULL,'[]',0,'2021-04-29 00:36:37','2021-04-29 00:36:37','2022-04-28 20:36:37'),('832e4c94e85fe4fac91a86bb291f53c1cbf62c93102182671fb72896f1a14d4384fd0e1b4b62bced',16,2,NULL,'[]',0,'2021-03-04 00:07:24','2021-03-04 00:07:24','2022-03-03 20:07:24'),('887c1b9ce840baeb803a4c8cbaa4256d497a1da0b52265793c09ebe409499ebdcca430cdd6c054c4',21,2,NULL,'[]',0,'2021-03-03 23:55:44','2021-03-03 23:55:44','2022-03-03 19:55:44'),('89941b3e90a8d38926c017b5b379129373c3212911d95e88ebd618edcdee5bd336682c6adf0bf3b6',16,2,NULL,'[]',0,'2021-04-27 16:45:23','2021-04-27 16:45:23','2022-04-27 12:45:23'),('8c91f9e1bf1e2d253a4f0bf34b63801406099848603c63e7d65f501ab1f3fabc166809e0ff525449',16,2,NULL,'[]',0,'2021-05-18 14:25:12','2021-05-18 14:25:12','2022-05-18 10:25:12'),('8f3fd62ddb0402625a1232ac8abd11c0dea1cd6a0c55447e50acefe378ac25368c52cd4e645f67ef',21,2,NULL,'[]',0,'2021-04-27 20:25:00','2021-04-27 20:25:00','2022-04-27 16:25:00'),('8f5e360a8165613eeeac509cd168daa2df215830fae323080c7c111887f8230254d2eee4b1e819dd',16,2,NULL,'[]',0,'2021-07-07 14:54:05','2021-07-07 14:54:05','2022-07-07 10:54:05'),('9173314da1980bfa80baf5dbb0f539c5ac644d6c3a26037cb874f511c9eb99ace7c4c0ad5e83594f',16,2,NULL,'[]',0,'2021-05-05 05:31:49','2021-05-05 05:31:49','2022-05-05 01:31:49'),('9232cc3e02874f1425978ce0f1adbf0d6bc601e7cdfe995ec51f09f778896c02024c8b68c40ab7ce',16,2,NULL,'[]',0,'2021-04-21 19:11:21','2021-04-21 19:11:21','2022-04-21 15:11:21'),('927688088a5bf51bb25eb556926fa268ed950401ae97d1b851d7a59b906e257655098adbc40095ef',16,2,NULL,'[]',0,'2021-06-22 17:09:34','2021-06-22 17:09:34','2022-06-22 13:09:34'),('93fb4b18d9e43b15cc0fcb874965e4cdd6d6409afbea595a6c4cfc04ea2af03c60928d46be05d186',21,2,NULL,'[]',0,'2021-07-04 05:13:39','2021-07-04 05:13:39','2022-07-04 01:13:39'),('949ff83b1000635a85f83bb9342fa3be8d9f24b44c646d90f4afae2991e4fbc972d164dd91455960',21,2,NULL,'[]',0,'2021-07-04 04:48:01','2021-07-04 04:48:01','2022-07-04 00:48:01'),('950e8d31017cb59d6d4128005e0e62bb06ce097fba9cfc44441b1d6fa963153ba90444af7c770deb',16,2,NULL,'[]',0,'2021-05-18 14:32:03','2021-05-18 14:32:03','2022-05-18 10:32:03'),('9676bfa10fa9bf8dea383d76cd2c9b25ac499306b9eddcb657ecd535094b66a20421cd368d5342fe',16,2,NULL,'[]',0,'2021-07-04 03:22:22','2021-07-04 03:22:22','2022-07-03 23:22:22'),('97a7aa410d1a091ffbad7e2ce90a4f754f6e0e6dd91f01d1d97fbae7b1763bf10da79dd6cc1f44e3',16,2,NULL,'[]',0,'2021-04-27 19:59:16','2021-04-27 19:59:16','2022-04-27 15:59:16'),('9aff67b0576ef54de9d94ef9547e6e894d210041e6401dff49d3fba646d2fcbbd02153cdc3ec8ab4',16,2,NULL,'[]',0,'2021-04-27 11:49:08','2021-04-27 11:49:08','2022-04-27 07:49:08'),('9b4f1caa3450bb2a2ccf0cc3bcb3b9482c7bd5c948287b58f982dc3f668f051c23e349d2e0bbfed9',16,2,NULL,'[]',0,'2021-07-10 04:14:03','2021-07-10 04:14:03','2022-07-10 00:14:03'),('9c4ad9497e1ff81af58f6a8391ee612782e1f6ef7869a28e8ba9d68229db10dc92c38033ee533cf5',21,2,NULL,'[]',0,'2021-04-21 19:41:30','2021-04-21 19:41:30','2022-04-21 15:41:30'),('9d77418e5048cf2bed44927c1bdf667ba5a8b15a546b49904ff9207512d255024e3f5a47add1d7a3',16,2,NULL,'[]',0,'2021-04-29 14:10:04','2021-04-29 14:10:04','2022-04-29 10:10:04'),('9f3128d07977801bc8528af2d93878d80f0a140f416356e1be0b257c5e0cdf3c0650ead1ec5907be',21,2,NULL,'[]',0,'2021-04-27 19:59:29','2021-04-27 19:59:29','2022-04-27 15:59:29'),('9f5854bb5f5a28e7e0a63bbd846ee01e5a5c40511bcddc06307603ec2a184d381548905e37155541',21,2,NULL,'[]',0,'2021-04-21 17:50:06','2021-04-21 17:50:06','2022-04-21 13:50:06'),('a09905e40961a29e09822933ca034515808fa4f743ed0307a91574356fc7db5212fd8153e54a1f0e',16,2,NULL,'[]',0,'2021-05-18 15:31:57','2021-05-18 15:31:57','2022-05-18 11:31:57'),('a0fbb56ec77bdb7aa022422ca631d1c1eda45d523ebc369055bf9c6521256319e05a704ed829e83e',16,2,NULL,'[]',0,'2021-05-18 14:23:31','2021-05-18 14:23:31','2022-05-18 10:23:31'),('a44fd8b210b1b5bcc7e26c357e83b65677a4cc099713694dca0f124dc9d1cdd5b8647e53c1b34948',21,2,NULL,'[]',0,'2021-07-04 04:54:58','2021-07-04 04:54:58','2022-07-04 00:54:58'),('a586447efe29086888490df2caa9dd0878205407ffc934d16999e3b5e6c82389ea6cf5fa3ac4457d',16,2,NULL,'[]',0,'2021-05-18 14:38:55','2021-05-18 14:38:55','2022-05-18 10:38:55'),('a813ebcaafa782357f8b832f895dd11c2ea63607f39d4a6c66a42f0e41a6a286c161f162223132b1',16,2,NULL,'[]',0,'2021-05-18 14:26:27','2021-05-18 14:26:27','2022-05-18 10:26:27'),('a933af00faa21f84dc788ee5fb3eb4868a75ca6a019c46dc64610265d8a14d5d1feafdb3a7f4697c',16,2,NULL,'[]',0,'2021-06-29 16:32:07','2021-06-29 16:32:07','2022-06-29 12:32:07'),('aa0199d475613d52269a7d857d0d9443591ec5e4ecb1fa74bdafd982eea396621a03560c61fdc090',16,2,NULL,'[]',0,'2021-05-18 14:30:32','2021-05-18 14:30:32','2022-05-18 10:30:32'),('acc8575a1fd91c35efab316e76df6feb95df629dbaefb6265f22b555f09b178326121edcb130e67c',21,2,NULL,'[]',0,'2021-07-04 05:38:55','2021-07-04 05:38:55','2022-07-04 01:38:55'),('ad68ce2d32c9e6d48f01a497f1f35e8486fd3e7b3689e4acb3228216431cf1f16cf35ae509dcc45c',16,2,NULL,'[]',0,'2021-04-27 16:55:19','2021-04-27 16:55:19','2022-04-27 12:55:19'),('ade946b87724dd51594c1baf303c20be3001604974e38075911e177995f05858428652615438da53',16,2,NULL,'[]',0,'2021-05-18 14:41:34','2021-05-18 14:41:34','2022-05-18 10:41:34'),('aece02edc620373dccf0bf161a5084f9e553b5bbc5f4b750a0f0f2e6b8d1c099a9f85ecb78c2e322',21,2,NULL,'[]',0,'2021-04-27 19:42:34','2021-04-27 19:42:34','2022-04-27 15:42:34'),('aef9c4eaa8226b9435620da157c4245d73e513f5915e1ff7cff57fc933e547be93af7621dc39461d',16,2,NULL,'[]',0,'2021-04-27 19:21:10','2021-04-27 19:21:10','2022-04-27 15:21:10'),('afaf8df1dc909b50c79f06e6feb6a37366b0c8ba51d4e4ce60bb2a748e8ab0bde13a1cf2378ce3c7',21,2,NULL,'[]',0,'2021-04-27 19:28:40','2021-04-27 19:28:40','2022-04-27 15:28:40'),('b3ebf3dc1d47337b92bd0fc032be0a284e62b4bcf9115b169c3ed27097728221a4cb6b3e6c6afd39',16,2,NULL,'[]',0,'2021-07-04 06:16:39','2021-07-04 06:16:39','2022-07-04 02:16:39'),('b401edaebc1297d1c6bdf2c3133212a74f995438aa340667d4db8f9a2396914aafbf6f773d35c796',16,2,NULL,'[]',0,'2021-05-18 14:48:34','2021-05-18 14:48:34','2022-05-18 10:48:34'),('b7ed2c8569912851c811bc3a2807ad6f78d0280253347abfb71a848c7845ce6e6e1f158d51aef3de',16,2,NULL,'[]',0,'2021-03-04 00:24:32','2021-03-04 00:24:32','2022-03-03 20:24:32'),('ba7f558c2d58b92c15a68a68bc8af5ceaaa562439eec123edc39a0795c41c3d9336105f9bd4a99e3',16,2,NULL,'[]',0,'2021-05-20 00:35:24','2021-05-20 00:35:24','2022-05-19 20:35:24'),('bafa7d453efbaf2b5e2784441a6016d5cc2364c739f8f76018148e2f9337c4a2f9dad33ef46da6a4',16,2,NULL,'[]',0,'2021-06-01 11:27:32','2021-06-01 11:27:32','2022-06-01 07:27:32'),('bc7a81758c07fcfb929fb5e36ac441378ab9474489ee0f9cd1d008f24451d8991c434f9019824607',16,2,NULL,'[]',0,'2021-04-27 16:42:33','2021-04-27 16:42:33','2022-04-27 12:42:33'),('bcd58754ad88f4b71d27f5994c3c60b4b64526cee81572fc490f0b54881ab5fef13167fd1561db63',16,2,NULL,'[]',0,'2021-05-18 14:39:06','2021-05-18 14:39:06','2022-05-18 10:39:06'),('bd368bab11084dbc1a487daad6b352dee5c06161d2caed75924fd03302e55652eaa11ae9323f6e4f',16,2,NULL,'[]',0,'2021-04-27 16:54:40','2021-04-27 16:54:40','2022-04-27 12:54:40'),('becda9432aa3c6495afa0c45b1e475ba0a15716e1e80df0dcab5b5204c945382c4ba328e6faa8279',16,2,NULL,'[]',0,'2021-04-28 21:18:47','2021-04-28 21:18:47','2022-04-28 17:18:47'),('bff1cc9b59a1e7e77c26edae3bb8caa279f3c9a4da98d0214b10ab6939f0d86cf49571b883cf2815',16,2,NULL,'[]',0,'2021-04-27 16:42:06','2021-04-27 16:42:06','2022-04-27 12:42:06'),('bffdfe027db4e78cb8d2e0be4242ec897f7a33f88054ba99e089f5d01b62ee61f7df0b72f3cf2ba2',16,2,NULL,'[]',0,'2021-05-18 15:47:57','2021-05-18 15:47:57','2022-05-18 11:47:57'),('c0a7535275132e149a816f49357d4b3747616db18cadcce69dfb8da5af0e9484dfc9b0f30873c205',16,2,NULL,'[]',0,'2021-04-29 14:10:13','2021-04-29 14:10:13','2022-04-29 10:10:13'),('c17d6b7374c8040ccf61e441940edd2d74271e3312763c46a99765dc68ba944e47c73b2f34273c36',21,2,NULL,'[]',0,'2021-07-04 04:50:10','2021-07-04 04:50:10','2022-07-04 00:50:10'),('c1f704cc6dd5b57f72675b8b7bbe4d2a1b231f2290fc810fa5158365093ab4d9d5ec9760c8321022',16,2,NULL,'[]',0,'2021-05-18 14:46:03','2021-05-18 14:46:03','2022-05-18 10:46:03'),('c39ae0602fa3180192d74be3c7868d66da22bcb78282241ed0fe5535efcbcee45e0e9914b432931b',16,2,NULL,'[]',0,'2021-04-28 21:43:43','2021-04-28 21:43:43','2022-04-28 17:43:43'),('c4d4b03e718e4787679b24d8a4f8d14b8dfa06418098ff8d12bf35227043f8c510d6b54970197089',16,2,NULL,'[]',0,'2021-05-18 14:41:02','2021-05-18 14:41:02','2022-05-18 10:41:02'),('c5752ed7f3f6841f4a9b2bc42edf46bd5485449425c5ff671c977bc8f8c9d41e25f0dcb4ec35f252',21,2,NULL,'[]',0,'2021-04-27 19:17:31','2021-04-27 19:17:31','2022-04-27 15:17:31'),('c827dc7fffce2c5e551e70f28e6d55955346c62b85a46806ab06cf90babc725ffc759a97c2abc3fc',16,2,NULL,'[]',0,'2021-03-29 01:05:28','2021-03-29 01:05:28','2022-03-28 21:05:28'),('d23c2c83d16a84562201d906c33e4574ead190b66c9c7b1bcb6c5a5cbfebb5caba536ae40ffbd5ce',16,2,NULL,'[]',0,'2021-04-27 16:54:30','2021-04-27 16:54:30','2022-04-27 12:54:30'),('d743db86dd8ac3c0688a96a2513aa5323f9d2ac6e0914256886477854bea49a4b01fd013b8abd18f',21,2,NULL,'[]',0,'2021-07-04 04:26:59','2021-07-04 04:26:59','2022-07-04 00:26:59'),('d7531599221f623eed885462e19af55e21559d55ca81fee9ccc5bc0733f5091e456969c6b0928df5',16,2,NULL,'[]',0,'2021-05-18 14:23:17','2021-05-18 14:23:17','2022-05-18 10:23:17'),('d8058b0ec09bdb51a26468684b0c8d9eff4f22ebe1079c37f102c17f3fa315a579e9d41e9992ac85',16,2,NULL,'[]',0,'2021-04-27 16:47:06','2021-04-27 16:47:06','2022-04-27 12:47:06'),('d89a593c8d16ea72907a0cde5ef52f6ea270568dfe3a76dbd60e24a8dfe08162dd699be3a0181107',16,2,NULL,'[]',0,'2021-04-27 16:38:01','2021-04-27 16:38:01','2022-04-27 12:38:01'),('d979c09edc208851d711b54164dbf83a9a315885ce9a52830ceb3daa2e2949d73f765bc4f23fbf5d',16,2,NULL,'[]',0,'2021-04-27 16:52:43','2021-04-27 16:52:43','2022-04-27 12:52:43'),('d987454d5fe1541d6e1ad8d09992532ab18c9b066e388041f7aa2b9b745a62c461dd4dc2f7dfe937',16,2,NULL,'[]',0,'2021-06-18 01:03:38','2021-06-18 01:03:38','2022-06-17 21:03:38'),('da9ea62f090a3a0621d351f35446c4c34b6dd64c917bbe50f3edee5c863498825ec60407bbad19ab',16,2,NULL,'[]',0,'2021-05-20 02:02:17','2021-05-20 02:02:17','2022-05-19 22:02:17'),('dc40bab565bbb252f4ed98afeca8a1226f5281286048ddcc1401bcd804f52a938013ed155f365903',16,2,NULL,'[]',0,'2021-05-18 14:34:06','2021-05-18 14:34:06','2022-05-18 10:34:06'),('ddce39df0ed0a8b33dc36f33e02029fcc4967159829a1d7cd4a9bc4ec714409cbe40ad3fbc804df3',16,2,NULL,'[]',0,'2021-04-27 19:25:29','2021-04-27 19:25:29','2022-04-27 15:25:29'),('defd8df9041f24e7fadfa2fa9fb0fa8ecf3f8c42906b1831835c7c7884365c1ebee37a613c04336a',16,2,NULL,'[]',0,'2021-03-23 17:10:53','2021-03-23 17:10:53','2022-03-23 13:10:53'),('e795e086fb8668b491b37ff625c2ba0a2cce454d3117c2a37f20a5dcf02999f143d8535fcaa81bce',16,2,NULL,'[]',0,'2021-07-04 04:47:09','2021-07-04 04:47:09','2022-07-04 00:47:09'),('e993e36e740ea3c9ba1f705978a9eaedcbaad846b56883055b6f49cbd05aca01b6ccd01b46396b16',16,2,NULL,'[]',0,'2021-04-27 19:26:48','2021-04-27 19:26:48','2022-04-27 15:26:48'),('e9f6b6fcf74d5bbfddb4ad2e296d0c43d59f3f1d3645bc4dd008cdc0f23afc2e75c1ec1cc2c993b3',16,2,NULL,'[]',0,'2021-04-27 13:48:52','2021-04-27 13:48:52','2022-04-27 09:48:52'),('f295defcd64e6aba4df3fecae575035033eeacc6408cff735ced9f5a443ca804624969183a81354b',21,2,NULL,'[]',0,'2021-07-04 04:08:43','2021-07-04 04:08:43','2022-07-04 00:08:43'),('f5069e83b21c3e2a5419c2d944d0f1ac6743ec9c9fcbd16a4206fc39bb09b47547a70ed9f8c62b6c',16,2,NULL,'[]',0,'2021-03-29 20:54:51','2021-03-29 20:54:51','2022-03-29 16:54:51'),('f7d6c79412e693c52aac77cafd1eabd00e1fd853eaff6cddc47b89123244baf1588b47630da30743',16,2,NULL,'[]',0,'2021-05-27 16:05:38','2021-05-27 16:05:38','2022-05-27 12:05:38'),('f93e41f67875d795718afb7dc39c9981f8a95ca0d4d8aef7e04244681eb2b6d004d83156920446c7',15,1,'MyApp','[]',0,'2021-03-03 22:27:00','2021-03-03 22:27:00','2022-03-03 18:27:00'),('fafb4b949d092a6b24a1d1c39a2976ecbff2b70d0546efe809ce6f862caf8d130da274185e370df2',16,2,NULL,'[]',0,'2021-05-18 14:21:00','2021-05-18 14:21:00','2022-05-18 10:21:00'),('fb544f78cfcd9ce785aaa65ec17f7654a2ccea4c34b8ce43854780c7e527489cf34a99028c15efc0',16,2,NULL,'[]',0,'2021-04-29 20:18:22','2021-04-29 20:18:22','2022-04-29 16:18:22');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','htXUeLHobvC2Nwgjlan80kHlwYcZCT14niN0IpnY',NULL,'http://localhost',1,0,0,'2021-03-03 22:21:48','2021-03-03 22:21:48'),(2,NULL,'Laravel Password Grant Client','ja9rUm6LNvTF4HWUdAsjmPQWvDuKQgk6TMv6V5Tt','users','http://localhost',0,1,0,'2021-03-03 22:21:48','2021-03-03 22:21:48'),(4,NULL,'Laravel Personal Access Client','lR8ybLH1nhtUG6sDfMmNo8nKja04vFmZdi7ZumLh',NULL,'http://localhost',1,0,0,'2021-05-18 14:10:30','2021-05-18 14:10:30'),(5,NULL,'Laravel Password Grant Client','KBH8U5KTeeTKCf8eexo62DGS9a4q9jSyZreQmIuq','users','http://localhost',0,1,0,'2021-05-18 14:10:30','2021-05-18 14:10:30'),(6,NULL,'Laravel Password Grant Client','MlVUjUcCJePspRQ59dov56y5q5fWS7FepqR2o5j6','users','http://localhost',0,1,0,'2021-05-18 14:16:11','2021-05-18 14:16:11');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2021-03-03 22:21:48','2021-03-03 22:21:48'),(2,3,'2021-03-03 23:27:44','2021-03-03 23:27:44'),(3,4,'2021-05-18 14:10:30','2021-05-18 14:10:30');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
INSERT INTO `oauth_refresh_tokens` VALUES ('0050971056f1cff00cf261d3f537265c9c4fc43fa697e61584afee46ff04d252f7882cd92cc2b960','8c91f9e1bf1e2d253a4f0bf34b63801406099848603c63e7d65f501ab1f3fabc166809e0ff525449',0,'2021-06-17 10:25:12'),('013b1f74d58a045f454098e2d17f4ca32a0fef05cb6fa1907632390ff6e25fe36d67fdd408855cb2','9173314da1980bfa80baf5dbb0f539c5ac644d6c3a26037cb874f511c9eb99ace7c4c0ad5e83594f',0,'2021-06-04 01:31:49'),('08d4536d84cecd9060d5b0687b1bfdc1d92142b68cd49d01946655e13bd8a5cd37b8d6152eb489db','d979c09edc208851d711b54164dbf83a9a315885ce9a52830ceb3daa2e2949d73f765bc4f23fbf5d',0,'2021-05-27 12:52:43'),('0914751e7f8255acaaa789d6d0f6582e11568bb812999a71405f9ace176e1571ebedfcbfdce38c83','766a927f3dc57fb1b5f582cf3b10ed6cf7689e1c70dcc078b0905a6b554cf2c246697cf12aa5ee09',0,'2021-04-27 18:39:47'),('0a0cb737206608e5c313d1ca10aeec1cc64f61a7fc72c6768c9baebe944842d5c8c3c3616e322829','62c2c23daa84a117ee38b61411edc25e034cee8623c81e5aa80e966e0b271f01de984d5fe57a83a0',0,'2021-05-27 16:11:02'),('0be95914e05693a621ed7636c6e8686d0e4157cd927b0c5bb07ba30e1bc7f07706fce4a322062ef0','9aff67b0576ef54de9d94ef9547e6e894d210041e6401dff49d3fba646d2fcbbd02153cdc3ec8ab4',0,'2021-05-27 07:49:08'),('0d2d2b3606722eb719ad5666d3317a8a940972dba8ec99b7526c3cc2e080cb3f446a6f2f2e4b91d0','7fa46e334147c8764fd92f17e524d87414f56bec05a50e77c399cc9efe4d501f155d66e70e2de9c6',0,'2021-07-07 11:10:03'),('132ced15f8252151ac9583ef437bfdcf4472becdb6111cccf8c37fb004af77b2aa6f98e96526cb16','bffdfe027db4e78cb8d2e0be4242ec897f7a33f88054ba99e089f5d01b62ee61f7df0b72f3cf2ba2',0,'2021-06-17 11:47:57'),('13f76d363876e3fac31798fc01d3815ac43d18cad084d2c024230d05b2e61ecbce198b8d35315ef5','191845668776680387db7e0a39670c9845ecf9c09efb414a0f480c2df0b51b426fb7e3019aef4edd',0,'2021-05-27 15:50:44'),('1660ef34de559cda7de07039214a7a77001e0d4a0c336f28437c1d1d26b9f71a5655abdc55e1b144','c5752ed7f3f6841f4a9b2bc42edf46bd5485449425c5ff671c977bc8f8c9d41e25f0dcb4ec35f252',0,'2021-05-27 15:17:31'),('1c02d4ed14bc4c4f4ea4b79d686c2499f99c45982a327722c59f3eaa23d1a77d56372c890d085e55','9232cc3e02874f1425978ce0f1adbf0d6bc601e7cdfe995ec51f09f778896c02024c8b68c40ab7ce',0,'2021-05-21 15:11:21'),('1da2f51dbaa20024e8afa74db73b02148ac3002a6a1b8db876621988dc7e2cb9d2ffc5f6348b999c','c0a7535275132e149a816f49357d4b3747616db18cadcce69dfb8da5af0e9484dfc9b0f30873c205',0,'2021-05-29 10:10:13'),('1e81a2b71b16e0e47d4bc31c6f879622156c818d018a56f634b8dd61df85bc18bc52f4bb085e4751','c39ae0602fa3180192d74be3c7868d66da22bcb78282241ed0fe5535efcbcee45e0e9914b432931b',0,'2021-05-28 17:43:43'),('1ff20fc8e3a362bebfd52fe305bd65568a2789d73a671c7f2cf97a684cc332cd236b1243d6b90124','3fd4b3f96ce32077f420348d93f71712bf4d4ddc31ab3ddbc12c2bc8ce1d87aedaa7a1517838ad8f',0,'2021-05-28 17:36:09'),('20bdb0d197cd88021f1bf1c5f5d5081be8576482cc356140b0d2877eb494abe2eb0e1ce094d69896','b7ed2c8569912851c811bc3a2807ad6f78d0280253347abfb71a848c7845ce6e6e1f158d51aef3de',0,'2021-04-02 20:24:32'),('2191eb429cbccf11f641bbf3e51955bee740b982431bfccc3f6eb6d7900a48ab574390bd0fa9e899','d987454d5fe1541d6e1ad8d09992532ab18c9b066e388041f7aa2b9b745a62c461dd4dc2f7dfe937',0,'2021-07-17 21:03:38'),('22b7ff64a8eb6dbbfed4c66f9826bfbfaa1a3ebf591f98c0635a76b8f068bff9aaf8ebf319fbd5a8','89941b3e90a8d38926c017b5b379129373c3212911d95e88ebd618edcdee5bd336682c6adf0bf3b6',0,'2021-05-27 12:45:23'),('23558951b74b7b9d7f6137f82405c63185c4ad66c4b95b368092d7656abd04dcc65b5b4a77d5f0ff','58eeeb4f5cf6d300247e223de4c39c7d4c0051600d67e051f89369159afe9cda2c0027fbbb2355c6',0,'2021-05-27 12:43:55'),('25e7d3fa0d2920307550d91bb4f7992ee6542e0c6ab1fbf323e09bcd7f20f7cde6b31f8f8200c302','4f0a4735ae654320fcdc3440050e7e298e9d21d76a7a1230de5ff8f11085aad4cf9543c5454b499c',0,'2021-04-02 19:54:42'),('265f09121cb9d1f69b944237e29dda0ceb2b977fee43ef866d089cfc16bd3e667a6aeeb7fd538c0e','25a67a48368fbd1a9ab66f9af122080ffb250341c0b29e819f9a48c4e0c566f7e1c8d8a2828a2983',0,'2021-06-18 00:19:06'),('273dfe36addf9c9314dc0424580bd1a07983fca32a5c2e53d174b53a91fc9d4a448cf3a3f4222da6','a813ebcaafa782357f8b832f895dd11c2ea63607f39d4a6c66a42f0e41a6a286c161f162223132b1',0,'2021-06-17 10:26:27'),('299d82e8b05fa50d4cad3916f458b0f5bd150c15006d585332e4fd7343e75ab3250a1eb564df5cea','0d5df317364b5e357137a6179ed27d8e960f2548254e8e9224d1321786c2caa1fe5fc9a910cceb80',0,'2021-05-27 14:40:34'),('29b3242a0ea1e9019674a034a5423b7cff3dc0b95be28c0a3d1fb91ae1b725fa147e0ec81188bf1c','698096b238ede855a2abd6475af5c84c162dd79c327ed5360ec5b794f8aa204e2b5910c8811c93f4',0,'2021-05-27 14:38:03'),('2d0b2d209a43aa59d8cd36099ae13b7791d5f518ee4cdca2522e826a7d08425549fcf47bcfaef78e','1570eed4509160177df25888ae56b4976f99e59cce202223da8048b57b83395e774334d0dfea8b36',0,'2021-07-17 09:18:36'),('2d4151bd89a4bbcee23d4bb7f32e4bf79de90b0fd5044c8cc2733061c5521dff3799cf372eec2788','b3ebf3dc1d47337b92bd0fc032be0a284e62b4bcf9115b169c3ed27097728221a4cb6b3e6c6afd39',0,'2021-08-03 02:16:39'),('300c4ca32ccddd85b1194d49d9516cfa72652b47b88696371d2136a1962ce81223c680a38dd3c06c','7e1cdc21df77a66f0ba93bd4ae29ba533f784b908cf75630c481f657b681779cbd9b05206474351e',0,'2021-07-08 09:18:57'),('329c541afefaf39080d5b628043d97f1799e470d870040311614ef87553b6721bbf625194198ab1e','d89a593c8d16ea72907a0cde5ef52f6ea270568dfe3a76dbd60e24a8dfe08162dd699be3a0181107',0,'2021-05-27 12:38:01'),('33b97df337c3df370c303053c9cc4c79a22827ae1e66ce9af3ac43a6a2d2fe6711cba67c56f19003','a933af00faa21f84dc788ee5fb3eb4868a75ca6a019c46dc64610265d8a14d5d1feafdb3a7f4697c',0,'2021-07-29 12:32:07'),('34192565810367bb6c55197dd5f2a4f3af5acfd69248a7544e7ce88902ba5a478a4f13b29eb2b616','e993e36e740ea3c9ba1f705978a9eaedcbaad846b56883055b6f49cbd05aca01b6ccd01b46396b16',0,'2021-05-27 15:26:48'),('3463cbb11e146d3a86e85b066be7e97991956508c7d216a826a7aeacf4b27ec207fb9a787f4915e1','9f5854bb5f5a28e7e0a63bbd846ee01e5a5c40511bcddc06307603ec2a184d381548905e37155541',0,'2021-05-21 13:50:06'),('34ff57749b83471f170b5b2e0120536ba6dedf7aa95e1cfb289db4d7241fe5165981f39e304566a8','a586447efe29086888490df2caa9dd0878205407ffc934d16999e3b5e6c82389ea6cf5fa3ac4457d',0,'2021-06-17 10:38:55'),('369039df58f23fc9c80a18ef2ef73616e60108b2b2ea634b857eb966efa3cf7b82dd524288c1ab30','9c4ad9497e1ff81af58f6a8391ee612782e1f6ef7869a28e8ba9d68229db10dc92c38033ee533cf5',0,'2021-05-21 15:41:30'),('3992fec554dd0ff539b34f598bcaef94e9679a99bf0eaf218f60c61a6c8709a564d05bb27a3e1df5','6adb972579263471cf5f38a98c634a10def253bc1c110ea953f61f5784af7765ce1549befae51ee6',0,'2021-08-03 00:57:35'),('39b20205a868145d68069f6a1fc13fc4b89eeea5b6815d6f3a53c2aac5f0501edfa992947109330f','5a37e5eb60c79d83d5e092212f55f8440ebd44604aca376a8195c591ae75acb6c518b741083babae',0,'2021-05-27 12:54:28'),('3d43bbab1043f85fde2d8e1b7cedfc167c7c37fda17d938d2928a751a8f30db8b2b7fb50953f5357','fb544f78cfcd9ce785aaa65ec17f7654a2ccea4c34b8ce43854780c7e527489cf34a99028c15efc0',0,'2021-05-29 16:18:22'),('3e5d34eb45a2d477ad46374644d7339bb25d74ef2aa5d2ad8fbbad181842e479ecd1b8b0eaeb0cb4','defd8df9041f24e7fadfa2fa9fb0fa8ecf3f8c42906b1831835c7c7884365c1ebee37a613c04336a',0,'2021-04-22 13:10:53'),('3f62ec82f060229f49ccd8d48311c961f441813aef026354a1cb9dfa2e40e320d963aa8666eb4f5b','aa0199d475613d52269a7d857d0d9443591ec5e4ecb1fa74bdafd982eea396621a03560c61fdc090',0,'2021-06-17 10:30:32'),('4177370bef1a3b47a196fcfa2ed06ebddef544e1ddabba26d09d314093e1edfb5c9cebb2ee5f0007','4073aa8eb1d03c718c10a2068a390355aad1a6714c4f037dae19e1c3eeee5e238fdeabdc939e3853',0,'2021-07-18 20:54:43'),('4482f13e09562b0551af8e62a8ee843692d88604f853d9a07fa8c82475212aec95a7d8e430d63c4c','12b2de04b5fbfd8431e9b62894bb2d9acdb545347ff7331378cc99f64d457d87fb2589815e19fb6a',0,'2021-08-02 23:35:51'),('460fdad0751d397ed643dac8f3582e1226a9619d2043ce5e737b44e0381cba97573f1cd8840d3b2f','45759f3986f35e5b69201ad2a891fb8a8574a45e2ffcd22a674860b72c9b310fec292b18f57469d3',0,'2021-05-27 16:18:03'),('46c031c0961be01d9c4996e971b5526b206389f30b291b9d8403ba5b067eaa57d5c03966d5b971ef','4fd3a20c522eb04d4fef092481376bd73d14f5a4a5699a732316c21dfbd9d7e4137b59ebe20e2f0d',0,'2021-06-04 08:36:26'),('488a8b29240b61671f5d280100ced68f925e6ef1fbd6bfcbac02dcdfe63bf4b0d7f966c6c5c2f934','39ef0e8d4bc8fda0797db727ceb32c4bb9b567d354329f46768ef1517ea724912e7b0864a4979369',0,'2021-08-03 00:26:23'),('4fbe052c04fb8381c4dc67438b2549e25ee34a1918af95e97869bf299ed33afdce556175702432ae','949ff83b1000635a85f83bb9342fa3be8d9f24b44c646d90f4afae2991e4fbc972d164dd91455960',0,'2021-08-03 00:48:01'),('51b51dd08746bb98356d2d61da444cfbaf881211fb4ebf1cb129dd700073a06e09673b37b447c6a7','558f07843ad3f549ebf905507d32b65a37deef24e2c4209359678c168bbf43699a07a0aca692b531',0,'2021-07-29 09:00:46'),('51ccbd61f2a1c36f30bbe1788330f1d68ed44417d6cb7b6e4d548474086f08b6dfb8607652da1c25','f295defcd64e6aba4df3fecae575035033eeacc6408cff735ced9f5a443ca804624969183a81354b',0,'2021-08-03 00:08:43'),('53edbb7e9204bffdc80a56007b0c687df57d7bcd62920a551d87b29183ef42ef24a0f0fb69b2e2de','fafb4b949d092a6b24a1d1c39a2976ecbff2b70d0546efe809ce6f862caf8d130da274185e370df2',0,'2021-06-17 10:21:00'),('590e8750aeccf00b7272d8b4a718650f34dc2c7253bb71b1b438a63ee680280e1f5accbba1d4e75a','c1f704cc6dd5b57f72675b8b7bbe4d2a1b231f2290fc810fa5158365093ab4d9d5ec9760c8321022',0,'2021-06-17 10:46:03'),('5a36088b068e2e5ba2a22211ac01589e649688f332ccb3df5dc99c07e4cc644b4caa641b6b52b18c','8f3fd62ddb0402625a1232ac8abd11c0dea1cd6a0c55447e50acefe378ac25368c52cd4e645f67ef',0,'2021-05-27 16:25:00'),('5b3481c5e170b525d18db5c1c5dee368091fb230386b0b10b332a6e0832d258d072fde12867eb9b3','498783ea9d33101d01be99c0acd3f058cbd2e8232566a57d1742bd00d7ac0bf07532b187886adf9f',0,'2021-08-03 00:59:58'),('5c079d49ad3c3c182b75ed254bad845b0d836f730f90756339c944cbfaa0931fbdba18851726059e','17c2a06e0325108789af317fdbc053e0fb71730c300083952cdbff00cd9b7c58565daf1095aff0db',0,'2021-06-04 08:31:24'),('5c8c7bdf95a9ff886fe7f428517366f2470d1f5fc0cc513a9c00a82a617bb746644a81b6d38eac94','7f62149c4cc8465f62027e7cfca99fbb39aaef8d1baca10b556345eb99e41d8dda716f6aeeadc4a7',0,'2021-07-10 19:06:27'),('5d2dd373e263025bcd7ade5b607183bc71b537c07d44fe7942924a8edea9ec95634b77e63c56404c','e9f6b6fcf74d5bbfddb4ad2e296d0c43d59f3f1d3645bc4dd008cdc0f23afc2e75c1ec1cc2c993b3',0,'2021-05-27 09:48:52'),('613ebaf54744fab42d2f40e6d24315484e686fa9cb5cc624a6fe2935d7d3194619142720a41e8133','9b4f1caa3450bb2a2ccf0cc3bcb3b9482c7bd5c948287b58f982dc3f668f051c23e349d2e0bbfed9',0,'2021-08-09 00:14:03'),('6158404e7c7b50da56ff9ee644c06c987c4e4ffe50bca1674eadb68d67fa58cb2cd9029be8a10ee8','057936c167f32b4e6af68de39dec83105a66d11a0aa418836dbc4f078bc113dc4afeeae25f6cc3bb',0,'2021-08-03 00:46:15'),('6193085f3015e830cd84018ef747e4049a2c705d74586b433daf01d2bcf858971228340e043b4b41','44dd2cd6f6a9529adbea775e41062e7e0818c53c623bcdd880f28d765c5a8d0450ef918994c2ae15',0,'2021-06-17 10:45:48'),('61dea4a5def0bd63648173feba96c53a40c17eaf25d95aea8a651d177e32f2ce52b1e7028cbb4abd','a09905e40961a29e09822933ca034515808fa4f743ed0307a91574356fc7db5212fd8153e54a1f0e',0,'2021-06-17 11:31:57'),('649369f5be0bed07c7e23504bed0e6d679ade24aaf4054e5b60670985edd0b643ee76548f49eaa23','9d77418e5048cf2bed44927c1bdf667ba5a8b15a546b49904ff9207512d255024e3f5a47add1d7a3',0,'2021-05-29 10:10:04'),('65c3bfdc1466b76e6acaa5fcf60101a8c3442c0eee860ec5f041932130c2183d0660e43fe7112f53','5a616918f9dcd7a8ccbc67bba50981613fb88ae30a0c00966c640dc41fa05b19653d3ed8561fa1a4',0,'2021-05-27 15:56:41'),('6682a2e15be103c870a2b0325935a957011f02d2e699b4bd9e7fda2e290f8fbf92d095ae6fc6607b','93fb4b18d9e43b15cc0fcb874965e4cdd6d6409afbea595a6c4cfc04ea2af03c60928d46be05d186',0,'2021-08-03 01:13:39'),('69c54a06a7e71b108ffa24e312628cc4315853e0a0f230121c2c948d22815edeae9f22ef6e0290b4','2ff7dd4a45fc11d68c5a9713fa53376e562b6f89ec8ceaa0272718df7cdcd4bf1127d813a0c65b40',0,'2021-05-21 15:25:08'),('6ad0e5c2c5968711e9bf7cdbe62790d2ebb487186b8a29f8ba11e21c31bd2db155d2682aca73b9a1','f7d6c79412e693c52aac77cafd1eabd00e1fd853eaff6cddc47b89123244baf1588b47630da30743',0,'2021-06-26 12:05:38'),('6ca37c3b0816bb6778216b8c290cbf050a3797c5c51fdee418c9ac5e79fd8eea145213e7a44e9c94','9f3128d07977801bc8528af2d93878d80f0a140f416356e1be0b257c5e0cdf3c0650ead1ec5907be',0,'2021-05-27 15:59:29'),('6e71968a549f2583d5a05cf4246c457fca552bb104a48b64a34b13297ffb013ae88abcd610049b84','129612b6b23909b4d9820622b1793dff9a2185ebdf2c17d8f63e038cfdba7987e9bfa19cf4eacc36',0,'2021-07-16 14:05:45'),('6f2e2599d52cc8a8aa87481ab9fc091ced8d4732dc18f82d1fa385abe3128e27101b1db3b9d08a72','2a4fd3935dc510c7786cb3534dad29a7d5ad49aa0b329fc047cac9a4b322ce34e13c048d837c031b',0,'2021-05-29 09:05:01'),('737c1fc319a0fb0d10aacbc786b3b65c38a59ab5d399095a23d484f1c81256b0a3bf9c552327d02f','0348c1d1cf92917c21a45fe6acec9e955e43fbbad224acb66f592ca32c765846c22cac0a077e8c2f',0,'2021-05-27 15:53:14'),('75372d18db374ec0217d0f39cb6af61c9b2d012e2de18d14434ddc88d55dc8dd7f5c4e19634476fb','0e9108ed6fde2b4c837a8f4fca389560ac41f2784729b446ffb6bece8fa53b51a0665e301c35b6d2',0,'2021-05-29 16:18:25'),('7702048505ee4c965d35fcdc0a7474fb82cb0a2a82804710feb5f8274ed80d6a8e7671976257fa7a','3aa84a83451181b289db00b3b6b9c694dcaff2c86a6a946070f00eb44268ca8c2faba8a99290ebe7',0,'2021-06-18 21:43:49'),('7797416001602c4c2c646e77d6b031d5152addfa30bb43c235d8b758187ceaaed7dabca84ce7a80a','21a9441d38b65b49911d6327a08ed1d3f2391aa42156e1cd70f1baf9327e62a7b9a720a9b170e156',0,'2021-07-29 09:01:58'),('77ed7457b244c095fad507bb3f56430024ad88774d52d18a8d86eb1c447a8cab8aa26d92099e5956','28c3059188234c91fcc33e28d7eb5bc401c1b8cef7d267d2c69b337b3a44077489fed26d9f0a51a4',0,'2021-06-18 22:03:35'),('7caad0f9a7ffcd14721af4d75abe33c5e78069da1bde32c8a226e001d194eb731c59315908c91d94','aece02edc620373dccf0bf161a5084f9e553b5bbc5f4b750a0f0f2e6b8d1c099a9f85ecb78c2e322',0,'2021-05-27 15:42:34'),('7cef625331a8a199fc616c03cad1d809ec6a771802c94ddb92e82b7a344f4b7779b26569f494b525','1d72b2b8d3c266d7175ece1de6e4b44d204140e032547af6e36cc9ce631466f64921bd8d44f0ddb6',0,'2021-07-15 08:28:25'),('7d5d495cee19f25463f8e5f8fecac732039d4faef56463e6e5dcc496360c1e33929c5358e10177e4','da9ea62f090a3a0621d351f35446c4c34b6dd64c917bbe50f3edee5c863498825ec60407bbad19ab',0,'2021-06-18 22:02:17'),('7f56912ac3c0a024785dd59159344811545e6572ef765177d90141a2493f567352742a5956bb353a','7755a297ef1f635c07268bea466a06fbe337ebe2a148d5fd374f05f71321903db9ba4de70d4ce973',0,'2021-06-17 23:31:05'),('7f914c8a3cdf272961d179645509cf8f106c1564cb08c4a4e46f6f97de0b47f2abe920a317ddfd97','bcd58754ad88f4b71d27f5994c3c60b4b64526cee81572fc490f0b54881ab5fef13167fd1561db63',0,'2021-06-17 10:39:06'),('7fffe4eb94e88d45b52fe5a4cb2408d4c26382d00d93bf1d09dd890b076a1535e7ba7ba912870cda','acc8575a1fd91c35efab316e76df6feb95df629dbaefb6265f22b555f09b178326121edcb130e67c',0,'2021-08-03 01:38:55'),('842cb1418b66a3d403cdbe6352954058c60eaa0257ae92ec680534575da1a16dfd3623fb1a6ee9d3','afaf8df1dc909b50c79f06e6feb6a37366b0c8ba51d4e4ce60bb2a748e8ab0bde13a1cf2378ce3c7',0,'2021-05-27 15:28:40'),('84612dac7339c9952fd96e4d4ed6a973336bfca40313579f40f549859cd74f64f95c9acd4d86d539','51c35557c374aa7c1e580cf64bec3617db7adbd687c88ebf0bdeefb2fd216a05641ad3c3eb4abd26',0,'2021-06-17 10:40:29'),('880efb15cdc67449fc9cb7e92b6529c6a6d9aafd37f5a25a430a6677a228bb5a11e807120ed3fbf3','9676bfa10fa9bf8dea383d76cd2c9b25ac499306b9eddcb657ecd535094b66a20421cd368d5342fe',0,'2021-08-02 23:22:22'),('882049541ac731239ae07eca9563abba3b40df613f7bc2637bc8bc726f25680c1008bcfbbf906bc9','becda9432aa3c6495afa0c45b1e475ba0a15716e1e80df0dcab5b5204c945382c4ba328e6faa8279',0,'2021-05-28 17:18:47'),('8a59484d8d6beac12e7f7a88f5b301eb2670f925b1cb22167da6f952d94e8a63a8eda8ba7487f462','72ffa8473bdd9fb69588745b136f10f8aab509e99329845c923e08e70983c97ac52f4bd42ba21828',0,'2021-05-21 15:53:24'),('8ad7edac992da421d18079e8c3675d0cf40cd39927c841232a3eca01070dfe3067560856a5c0c1b1','950e8d31017cb59d6d4128005e0e62bb06ce097fba9cfc44441b1d6fa963153ba90444af7c770deb',0,'2021-06-17 10:32:03'),('8d799822d4d23d2034594c7fd748ec1404c8ad9509ac2169ae1c1b00740abd8db083dd77748ed707','5fed2bb1d71132e8cfefc6c2f653f29c57d87dc9ab2902d0358b61943540ed377c2c74111433741a',0,'2021-06-17 23:29:33'),('8f774e3b1646ac1a0c1cc2ae8f230317957e6e261391a365b4080a7bd8e4e213d26a439f90c0b0f2','2860249300197d2fafec8519590576d3dd7eff1866f683153f8fd8339a2a04a9ca28e3eba13213b2',0,'2021-06-26 09:33:13'),('9016fc67dee55e6d8df53d26c7849d197b161662755a678b67e0dbfc378742a373af4cc173e0108b','56f4679222c57c7aaaa07a1bf82d6120cc41f80a12bc7cf3b519309bb8c60763314f4ba59f2c35d1',0,'2021-04-23 01:11:04'),('91e85b2620aa5441ec215755cca609247dffe0fb84fd10c2a081d9928b0f3167fa1a9664ad8a0c2a','5cfece66ebed691cb2422f189f4ff89978b779f08ffe38d25f67339232366167d992af6572a88211',0,'2021-05-27 12:44:45'),('930c964d0d6957b47f5b1133e84f9c84293148879ca12829e98bd068a9f77ba27e78309b16c2c043','927688088a5bf51bb25eb556926fa268ed950401ae97d1b851d7a59b906e257655098adbc40095ef',0,'2021-07-22 13:09:34'),('94684afdc0962cd5dbbdbeb2872a79cd83bc9a1c7922a8f5f4e5dc301e3ab85fffc00047c9063a01','aef9c4eaa8226b9435620da157c4245d73e513f5915e1ff7cff57fc933e547be93af7621dc39461d',0,'2021-05-27 15:21:10'),('95e02d4560bc622e291855aaaa8a3e85b50e7892b405d05261e4979a68d6975ab3de6176e6f28139','27ab8cad9dfc89f528764e8b19c4514d83f97ee73c77146e0b291bc1c97be0d7daf0eeea93645597',0,'2021-08-03 01:00:59'),('960677f635466ff0336500303e7d726910471f0168ac19ff103e7fdc6fd41890ee89958ab03cd9b1','2b9ee269cd61f3c59eaf6aa6707191e26c6a9d0cef4af2517c3b29de11699605d5fdcf6033b89fe6',0,'2021-05-27 15:31:19'),('969a28a33be8cbb1bdf5a39cb34794aca76febb0512bc9feb511519d66e900db60f1494fcd49d036','f5069e83b21c3e2a5419c2d944d0f1ac6743ec9c9fcbd16a4206fc39bb09b47547a70ed9f8c62b6c',0,'2021-04-28 16:54:51'),('9adbc99e6c61d498be6766797910d30df53adfe320d21aa703c04aceb4c5a669025a34f7827ffff4','2a305ba980bbf1e6554de65c8bb950aba75b6f1f6ae7f5ba24e00a36e878ce1cf9d599f82314407d',0,'2021-05-26 22:42:29'),('9e312bf4f099734644366c9267213182488e413d12b4bcfe1145fbf3284927c16a145543ca8c5944','7e00d08eb332db2140d970b929cc5a1ef9d994134275d45b8dc74e9ef56aeb98a6dafb3c593b797d',0,'2021-06-17 10:36:15'),('9ee91f733bbbf24decad94bf817bdbe8b5d70dc30bd8c3804db44559f2645793a45ac8e0029649e3','7879295b7f805f7063c2e8b6e3e5ad14c9d8ca959320aa621c42ea980100f81e156694b69e84635b',0,'2021-05-29 10:10:10'),('a02427631e33f63165b28a16d9f6f42187744cbbaad1241c79e0adf2561ed55eaba75e55d1907885','388fbfdb113f5081e2c7518c44bf449b028675dcd610d8084422eddbea5e60e49cda200d28ee2c21',0,'2021-08-03 00:56:43'),('a18c131a20e8a209146d6a51b98e30b9e1ac16e5c5a1affddef5bff737e253cd44202d9e28d4ec5d','33be4d90018d895a39217b4d650eb7d0740ce8b3920cd62c18847d8836687e29990336786db7688e',0,'2021-07-14 15:19:15'),('a2eabd4bcfd38be7168dc5d8c287c160ca8bd6acb40922c931b07807c8e4ab102cfa2b2fe527b5da','1391add339bf6a6d1304165365b33a1b895bc71daf1a2844d4018600c4d25ea2487cc0b8f0f80b2e',0,'2021-06-17 10:30:17'),('a721666c3f37aaa70e3f4593ac7c45bf7e47470bf7e07f44ff322e2ffae1e07af8f869e2ba7ab939','832e4c94e85fe4fac91a86bb291f53c1cbf62c93102182671fb72896f1a14d4384fd0e1b4b62bced',0,'2021-04-02 20:07:24'),('a7316d27d1056cbf4acb743a34de4e6b58aa4fe7eb77bdff1013284a6bdeaed0a3164a95b3371ffd','d7531599221f623eed885462e19af55e21559d55ca81fee9ccc5bc0733f5091e456969c6b0928df5',0,'2021-06-17 10:23:17'),('a742535c353ff8eb1df2c32f8f3a940c734b5965ee3837787453dfc7bdc5a5008cd8ddac35aa8710','ddce39df0ed0a8b33dc36f33e02029fcc4967159829a1d7cd4a9bc4ec714409cbe40ad3fbc804df3',0,'2021-05-27 15:25:29'),('a9268d2812b7bf0c46db87f0d6cf06ae6b08fc4aed82a4f5c64a2ed49dd0a01f590de12a868b6a58','ba7f558c2d58b92c15a68a68bc8af5ceaaa562439eec123edc39a0795c41c3d9336105f9bd4a99e3',0,'2021-06-18 20:35:24'),('b3d8749092b6c8d8b51afde93418662e3b18c77b94d08710073bdb3a63483f1a57fb223fb9c898c3','a0fbb56ec77bdb7aa022422ca631d1c1eda45d523ebc369055bf9c6521256319e05a704ed829e83e',0,'2021-06-17 10:23:31'),('b7ba9ba0cfbc3f0cd247f8dab6521e57f9579ea36d325ebb1fddcb877aecf40919c2dd3a77ceb087','0e891ea0c947597a852ef29cc88a904562fddbb53333b59d393d918b88da22115c214aba5e9ad16d',0,'2021-06-17 10:33:40'),('b850817e16412e5d52f9b9692c6fc99a777f50a6fb81abfd70f32be95d52ea61a039bbc018a8f420','4459192937657bbfbe4f6231071e275960abe5d585b8c517074fad8730dc92d25874c469834df38e',0,'2021-05-27 15:16:07'),('ba7343493fa0c117bc7947daba19f728f4568962e8d86e559e711657b623bd6291cc2d7bce1510c3','79cf633e36440addc1d6fac22d31885f78d2d8d0b4e74e3c9cc5fed08fa03616b81c1a6e2574ecf5',0,'2021-07-31 10:58:57'),('bab5cf6ec504fb2e8f12ec4290afa94eec91dac82f11c1c90e5fe8d379d76c9a69d79fb114180d82','03dd29f2ea6065af7505263de7801b7d2e494dc821ac43900ba7b4c75622a1fee6504ce5c304d7f4',0,'2021-06-17 10:20:54'),('bbe601944a73ec04cf1b441a97c97874cdb12746408f2c5ff562af0d3ae8c72efd8ae21010d07f52','477e6d5de10766d27d15ae232ab5ef146d9bc9199e0ac123cdbd92c92daad9911b51627e79e1a70f',0,'2021-05-21 15:41:43'),('bce727810fad06b90c8e8e1c50e0bd61eb8a8479a22df6fd15c0600ed8c4f5a6eac1a48ca1a3a4c5','bafa7d453efbaf2b5e2784441a6016d5cc2364c739f8f76018148e2f9337c4a2f9dad33ef46da6a4',0,'2021-07-01 07:27:32'),('bd8e957bf598ba678dda3228b84b25a4b43c87322122867e5846ea1ef9b5024b89044c534ed22bff','d8058b0ec09bdb51a26468684b0c8d9eff4f22ebe1079c37f102c17f3fa315a579e9d41e9992ac85',0,'2021-05-27 12:47:06'),('beebc068eb401a0e6615780a1425bf2862a5c50aaa9545ee743bcad0cfd1324b1957b887da28df02','54bbdb0416c2916e4906ec4aff196a1c5a2f5a25fe1a3a29b9045eee0818726457dbba9ad71c3d2d',0,'2021-07-16 09:30:37'),('c0ca8d67890114b25a8f863fd030b41d709f6fb0667cfbadd6ea79544a97637dec83e0262fa994e4','105f5439472dcb9c781b9434d53c1b53e069d880e4ae91a87196c6ba5c39dd92f6a50a3f873e204d',0,'2021-07-31 00:24:23'),('c3cc42617857da39b035ce473d9c2dbd103471484162d53976d17d311eca5679349fb7ce9f88b6d3','42bab5b3e7c20d6a31c7d5b2923e420c68c1d9f20ce1fd02908262dc8c770a0662121ee18ce30eae',0,'2021-06-18 21:38:35'),('c466d4f87490b59b66e03f87dc7e407350eb1536b4b3b75472f2786b2764af34feafb981a0d13242','2ad4c7fa1c5a571f0d0c50b308760fbea73228fc9304ee7faf2459dd9ea49aa25d2d8787625d26ca',0,'2021-05-27 16:15:20'),('c46b66a91311fbd6fe11647676d2b0b59edcc40b95eb9b521a6cc53bcf00bad11fb05483a010d5e0','c17d6b7374c8040ccf61e441940edd2d74271e3312763c46a99765dc68ba944e47c73b2f34273c36',0,'2021-08-03 00:50:10'),('c6f67c02b5283b80d722a9c3dddd11ed673ed675bce710f46250847b0e5b4febbb5200a49f51fcc2','81606b8a1ba6d2c26a0c41effc87a78f1967c3e12b3c7b85fe8540623ace909fb11a931b9f66acf0',0,'2021-05-28 20:36:37'),('cbd4da67a878dcdaf687d45cedf66d97de7d2971a81717d670f2e6b4728436f5b2134547144af1e0','c4d4b03e718e4787679b24d8a4f8d14b8dfa06418098ff8d12bf35227043f8c510d6b54970197089',0,'2021-06-17 10:41:02'),('ce14c06986e3b2ff2cbb645f8e6700c224087e96417abb6d93d9c49c25ba02edf94bb11aa99cc3dd','680595e9802b2619125c3ea9fd10ae38973e467d088225c7636524835d033333188ae79ffcd1bf29',0,'2021-04-02 19:54:20'),('cfe62bd19b85492ef5624979d6da03098966389e17f00c99b5d8797c12cb225dae73b8ee393600ad','ad68ce2d32c9e6d48f01a497f1f35e8486fd3e7b3689e4acb3228216431cf1f16cf35ae509dcc45c',0,'2021-05-27 12:55:19'),('d10334a49dae2612e804640de11fb861e0dcdcb7a31bf0d148a77e4914919808614b8c97905713ed','58711af8ec78a8f83e2c686ab64bce5a92705aea5f8ebcfa864c64d141f0cd27d957e5ba2c6050de',0,'2021-08-09 07:34:06'),('d659f2c150cc1e5c3dc0dc7503b6d6f5cec122a062328f750bdb6f38ee44b93a8f607c73ac6c06ab','97a7aa410d1a091ffbad7e2ce90a4f754f6e0e6dd91f01d1d97fbae7b1763bf10da79dd6cc1f44e3',0,'2021-05-27 15:59:16'),('d7f9394bd41f0e8e987589e9e231b63e54a3162b833396da8cfb0794148f27bc1a6ee6e1e430290c','b401edaebc1297d1c6bdf2c3133212a74f995438aa340667d4db8f9a2396914aafbf6f773d35c796',0,'2021-06-17 10:48:34'),('d8bc186e598549eac551ddaa015d776db1d194a9fe596d8d14b23074fc734fc225d13c5a82b83c9a','bff1cc9b59a1e7e77c26edae3bb8caa279f3c9a4da98d0214b10ab6939f0d86cf49571b883cf2815',0,'2021-05-27 12:42:06'),('dcc0326495488e611e955f74e6fc64912341885bb8fa7a095459db470a098812dc98918e81c7215c','5d3a91b668e9558958f554c82cbe0eb354b9166fee59418cbe9ef152d0cb5f75ccabcf4caf2a26d6',0,'2021-05-27 07:57:24'),('de2f8f73485634d9f9ab904319fce52af5198b31d68cb17ba29d90c58621449eeb7e162b73a8d1af','d23c2c83d16a84562201d906c33e4574ead190b66c9c7b1bcb6c5a5cbfebb5caba536ae40ffbd5ce',0,'2021-05-27 12:54:30'),('e13bc30bb1530fa9824fdf70be4f9e219abfd029c11fe3fc8f9e60e10d9bfd6f69b735fcb897ce67','55944836658ced59a4c515b36bec4ec6abeebf6428da6a26d97771095c4ce8fdbf6efcc704470802',0,'2021-05-27 15:19:30'),('e33f5e0aa3ff177052c96cf8bff810244d993e9b906b4ec8ae4421b9f86a872882e2d98e7a9ef427','751eb06b046768b0b99cfe76a5ac07f68c122a9ae3d2f8cf297b5d8f85753d86161fc5bbb1ccb0fb',0,'2021-05-28 11:09:36'),('e7eec8be544b7043246aaaa2cbcdbf973e8d01bc395454e73ab6c8b4ce7f3cffbc17eb3f76304934','d743db86dd8ac3c0688a96a2513aa5323f9d2ac6e0914256886477854bea49a4b01fd013b8abd18f',0,'2021-08-03 00:26:59'),('e97216f1a5dc35717ccfcafedd5da474d3f9ccac7b1662443681c4b159b65f069bc98d6c5bb60cfc','6839afe87e6e24973d1600059cf74ba0869362eafe618922a16e6268cead4ae0a9d2e4a06c74a2e3',0,'2021-05-27 07:57:13'),('ed235ffc3a74ff1bd20a8024d83463d5c36f433b1a7215ca6fbf7a2183112733ea8d9577675f3e65','46b2aba946041705b656b26dc302128cf5612a952a7ddd959e6dd06b3a8f5bffcbc69f4d4ad717bc',0,'2021-05-27 12:45:58'),('efec333ddbc4a20b0923cab497794439fc368689b6054508a832d7460a6684ff2bcfb4007a00da2e','4ea1b329dba3106206eeadb8181b25c3f39661ce36998eab301c8c7f1248273f089107c3aeec63f3',0,'2021-05-27 12:49:45'),('f186069e617bf574d67aab99284ca6ba3007c985ae73aa93ed584a5013441c7ffe0a90dd38d57830','11763c580217e0036197fd7966f9b764ff28fbcf01ca22e3d9ad8ffea26e8c40d7c4989b0d3e4045',0,'2021-06-17 10:19:00'),('f1c3bb091efb460765ceeaeb86500d29adeb1fb373f8e124224e2c983f228a1f8c201c60c1cfeae1','504d2682437a2e085bdaaa1c7df7ab6de6656f201508b25eb52cf0eb8bf957ef79edfce9d881e825',0,'2021-05-27 15:39:59'),('f2c5d56da471ab358170e45a4a5fb032294e79c5da8678e011e75c02fb69830316a799b99f210052','ade946b87724dd51594c1baf303c20be3001604974e38075911e177995f05858428652615438da53',0,'2021-06-17 10:41:34'),('f2dfd6ee4872ad9c47549a4486e64b6e39c775d2c7e7982c2f65405501625ef2e2eefe73de28ce59','3447a4ddfa7521de2c9c715ee360a07690bdf5eceb27bbdf80daab963b8a832561e8d3b9a0517bad',0,'2021-06-17 11:33:11'),('f41c83c4a24428c33982cbb1edddd90cc1e0f3515f01de869a230f41c6b1001b0e9104bcaf5682d1','772e5be7ddb20af53d03d5f5e5cc5f116e23f56df38d1de619099e7bce102c66f80fb95a3aed967c',0,'2021-08-03 00:20:47'),('f48c053fd13086d07c1dc7ea5fff6f70fe0122269edd60bf570ce90031386c7750e93418ee3eb28a','e795e086fb8668b491b37ff625c2ba0a2cce454d3117c2a37f20a5dcf02999f143d8535fcaa81bce',0,'2021-08-03 00:47:09'),('f4db8ebd4d5b4de2eefe26a83e7f7254a21f652695e5c8b2ec38807ffbc501e6f8488d0d95b193ad','635477efa4cda7702758c96d05c20b1d27c5334cbe4578f676c9d4e490ee2fa731ad1e3b0944302d',0,'2021-05-27 12:16:08'),('f5e98cd1ce2f05c3c795a3ca5ecf7a0e5277d872588fd262f690cc544f0c01a6334107950df71ee7','55cdfb113e4e3b2e5556d9ecdde328db78c7534f3b87e71709ed5d94630f3daeb2f98deb01108d14',0,'2021-05-27 15:50:05'),('f5fa8b1b6d706e09c8d9ab5e86335bc0ad3dc378a9618e6f0ff182bbd8f5b3e3f240c8ec35b1b21d','77fd08a247ea730037c768fbff2090afa3db4f7d7227a4184c5231c7acde45f0373eb1b0e8d69299',0,'2021-08-02 23:36:05'),('f83224a584853dda2524f05d1c1e906a395cbcaad2bc8d7f1245e66704d345bf0819b953ed692325','c827dc7fffce2c5e551e70f28e6d55955346c62b85a46806ab06cf90babc725ffc759a97c2abc3fc',0,'2021-04-27 21:05:28'),('f910632754e92a78a12d5b675e7760bbbf026429acf7832ba441825bbe3b4b5bf7bc988144892ab5','bc7a81758c07fcfb929fb5e36ac441378ab9474489ee0f9cd1d008f24451d8991c434f9019824607',0,'2021-05-27 12:42:33'),('fa0cb399181496183a75f083616870be5947d88f25c194b98302fa49181d9b355857520a4f44e3fa','8f5e360a8165613eeeac509cd168daa2df215830fae323080c7c111887f8230254d2eee4b1e819dd',0,'2021-08-06 10:54:05'),('faa3ecf3d5791f9b4ff06050e79b2bcd7557dde9907cc4f1a997042da935743309c02b580e053b26','bd368bab11084dbc1a487daad6b352dee5c06161d2caed75924fd03302e55652eaa11ae9323f6e4f',0,'2021-05-27 12:54:40'),('fb2eb755240da9890e7f6c7de5febf2fd4f15a3bdaaf81fc99baacf5e078621b80c26b5f7b7efde2','a44fd8b210b1b5bcc7e26c357e83b65677a4cc099713694dca0f124dc9d1cdd5b8647e53c1b34948',0,'2021-08-03 00:54:58'),('fb5261d4596e45bb9aa35dcd519f973d86bdae7d71c63bbde7ec84a83ac81deb1f29b6221dc3c486','dc40bab565bbb252f4ed98afeca8a1226f5281286048ddcc1401bcd804f52a938013ed155f365903',0,'2021-06-17 10:34:06'),('fc6cdfefb598f8f6d117474afb8f16ffba8c8e9b0f2f310022d08133760c4041643b85d3a7f8d608','887c1b9ce840baeb803a4c8cbaa4256d497a1da0b52265793c09ebe409499ebdcca430cdd6c054c4',0,'2021-04-02 19:55:44');
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pensums`
--

DROP TABLE IF EXISTS `pensums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pensums` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pensums`
--

LOCK TABLES `pensums` WRITE;
/*!40000 ALTER TABLE `pensums` DISABLE KEYS */;
INSERT INTO `pensums` VALUES (1,'Pensum 2000',NULL,NULL,NULL);
/*!40000 ALTER TABLE `pensums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodos`
--

DROP TABLE IF EXISTS `periodos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periodos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gestion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodos`
--

LOCK TABLES `periodos` WRITE;
/*!40000 ALTER TABLE `periodos` DISABLE KEYS */;
INSERT INTO `periodos` VALUES (2,'1','2021','2021-02-01','2021-07-30',NULL,'2021-07-04 03:25:38'),(3,'2','2021','2021-08-01','2021-12-30',NULL,NULL),(5,'Verano','2021','2021-01-01','2021-01-31',NULL,NULL),(6,'Invierno','2021','2021-07-01','2021-07-30',NULL,NULL);
/*!40000 ALTER TABLE `periodos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsables`
--

DROP TABLE IF EXISTS `responsables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responsables` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ap_paterno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ap_materno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `puesto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=417 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsables`
--

LOCK TABLES `responsables` WRITE;
/*!40000 ALTER TABLE `responsables` DISABLE KEYS */;
INSERT INTO `responsables` VALUES (1,'---',NULL,'*Vacante','.....','docente',NULL,NULL,NULL,NULL,NULL,'2021-07-04 03:18:44'),(371,'Ing','Juan Alberto','Aguilera','Rios','docente','67080690','j.albertoaguilera@gmail.com',NULL,NULL,NULL,NULL),(372,'Ing','Franz','Alvarez','','docente','69878515','franzalvarezg@gmail.com',NULL,NULL,NULL,NULL),(373,'Ing','Oscar Mauricio','Amestegui','Moreno','docente','70634345','mauricioamestegui@gmail.com',NULL,NULL,NULL,NULL),(374,'Ing','Wilma','Amusquivar','Caballero','docente','73274934','wamusca@yahoo.com',NULL,NULL,NULL,NULL),(375,'Ing','Victor ','Laredo','Antezana','docente','71539950','laredo.victor@gmail.com',NULL,NULL,NULL,NULL),(376,'Ing','Hugo','Balderrama','Barrios','docente','79106826','h.balderramabarrios@gmail.com',NULL,NULL,NULL,NULL),(377,'Ing','Hernán','Borja','Omonte','docente','72050499','hborjao@gmail.com',NULL,NULL,NULL,NULL),(378,'Ing','Teodoro','Busch','Decovice','docente','67349971','teodorobuschdekovice@gmail.com',NULL,NULL,NULL,NULL),(379,'Ing','Gonzalo','Caba','M.','docente','77294845','goncabam@hotmail.com',NULL,NULL,NULL,NULL),(380,'Ing','Iván','Caceres','','docente','','icaceres.etn@gmail.com',NULL,NULL,NULL,NULL),(381,'Ing','Jhonny Wilder','Cala','Vargas','docente','72010402','jhonnycala@gmail.com',NULL,NULL,NULL,NULL),(382,'Ing','Jose','Campero','','docente','67022211','camperojose268@gmail.com',NULL,NULL,NULL,NULL),(383,'Ing','Rosio','Carrasco','','docente','72041417','rjcarrasco@umsa.edu.bo',NULL,NULL,NULL,NULL),(384,'Ing','Daniel Saul','Celis','Laguna','docente','','',NULL,NULL,NULL,NULL),(385,'Ing','Juan Gonzalo','Contreras','Candia','docente','68104882','contrerascjg@gmail.com',NULL,NULL,NULL,NULL),(386,'Ing','Juan Carlos','Duchen','Cuellar','docente','72518041','jcduchen@gmail.com',NULL,NULL,NULL,NULL),(387,'Ing','Wilber','Flores','Bustillo','docente','72565811','wsflores@umsa.bo',NULL,NULL,NULL,NULL),(388,'Ing','Marcelo','Gutierrez','','docente','77296881','mar2g6ut@gmail.com',NULL,NULL,NULL,NULL),(389,'Ing','Edwin Ruben','Huanca','Conde','docente','','cpf.huanca.choque.edwin@gmail.com',NULL,NULL,NULL,NULL),(390,'Ing','Alfonzo','Jurado','','docente','72055151','juradoalfonso05@gmail.com',NULL,NULL,NULL,NULL),(391,'Ing','Jorge','León','Gómez','docente','75272720','',NULL,NULL,NULL,NULL),(392,'Ing','Juan Carlos','Machicao','Aparicio','docente','77527989','juanmachicao@gmail.com',NULL,NULL,NULL,NULL),(393,'Ing','Alejandro Martin','Mayori','Machicao','docente','72034828','ammayori@gmail.com',NULL,NULL,NULL,NULL),(394,'Lic','Luis','Medina','Riveros','docente','70544990','lm21650@hotmail.com',NULL,NULL,NULL,NULL),(395,'Ing','David','Molina','','docente','72550472','eduardomolina2503@gmail.com',NULL,NULL,NULL,NULL),(396,'Ing','Jorge Antonio','Nava','Amador','docente','77225519','janava@umsa.bo',NULL,NULL,NULL,NULL),(397,'Ing','Roberto','Oropeza','Crespo','docente','74070114','robertooropezac@gmail.com',NULL,NULL,NULL,NULL),(398,'Ing','Clifford','Paravicini','Hurtado','docente','77569799','clipar@gmail.com',NULL,NULL,NULL,NULL),(399,'Ing','Ramiro','Puch','Terán','docente','75887633','ramiro.puch@hotmail.com',NULL,NULL,NULL,NULL),(400,'Ing','','Quiroga','','docente','72557658','',NULL,NULL,NULL,NULL),(401,'Ing','Juan Carlos','Quispe','','docente','68121282','juancarlos_quispeapaza@hotmail.com',NULL,NULL,NULL,NULL),(402,'Ing','Marcelo','Ramirez','Molina','docente','78960703','marcelo.ramirez.lpz@gmail.com',NULL,NULL,NULL,NULL),(403,'Ing','Jose Arturo','Rios','','docente','71537214','riosjose29@gmail.com',NULL,NULL,NULL,NULL),(404,'Ing','Luis Armando','Rosas','Rivera','docente','76539685','rosas.luis.armando@gmail.com',NULL,NULL,NULL,NULL),(405,'Ing','Javier','Sanabria','Garcia','docente','70581953','javisanabria@gmail.com',NULL,NULL,NULL,NULL),(406,'Ing','Fabian','Tito','Luque','docente','72532323','fabiantito@gmail.com',NULL,NULL,NULL,NULL),(407,'Ing','Máximo','Torrez','','docente','','motorrez1@umsa.bo',NULL,NULL,NULL,NULL),(408,'Ing','Julio Cesar','Uberhuaga','Conde','docente','77556602','juliouberhuaga@gmail.com',NULL,NULL,NULL,NULL),(409,'Ing','Gerardo','Vicente','Sanchez','docente','79566673','gerardovicente8@gmail.com',NULL,NULL,NULL,NULL),(410,'Ing','Edwin Arce','Villanueva','Santos','docente','77514775','',NULL,NULL,NULL,NULL),(411,'Ing','Roberto','Zambrana','Flores','docente','69701279','rzambrana@gmail.com',NULL,NULL,NULL,NULL),(412,'Lic','Virginia','Zota','Uńo','docente','','vizotau@yahoo.com',NULL,NULL,NULL,NULL),(413,'Ing',NULL,'Bustillos',NULL,'docente',NULL,NULL,NULL,NULL,'2021-03-28 23:34:56','2021-03-28 23:34:56'),(414,'Univ','Joel','Vega',NULL,'auxiliar',NULL,NULL,NULL,NULL,'2021-03-28 23:55:26','2021-03-28 23:55:26'),(415,'Ing',NULL,'Paz',NULL,'docente',NULL,NULL,NULL,NULL,'2021-06-29 16:47:30','2021-06-29 16:47:30'),(416,'Ing',NULL,'Zabala',NULL,'docente',NULL,NULL,NULL,NULL,'2021-06-29 16:49:29','2021-06-29 16:49:29');
/*!40000 ALTER TABLE `responsables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semestres`
--

DROP TABLE IF EXISTS `semestres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semestres` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `semestre` int unsigned NOT NULL,
  `mencion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mencion_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semestres`
--

LOCK TABLES `semestres` WRITE;
/*!40000 ALTER TABLE `semestres` DISABLE KEYS */;
INSERT INTO `semestres` VALUES (1,'Primer Semestre',1,'general','1'),(2,'Segundo Semestre',2,'general','1'),(3,'Tercer Semestre',3,'general','1'),(4,'Cuarto Semestre',4,'general','1'),(5,'Quinto Semestre',5,'general','1'),(6,'Sexto Semestre',6,'general','1'),(7,'Septimo Semestre',7,'control','2'),(8,'Octavo Semestre',8,'control','2'),(9,'Noveno Semestre',9,'control','2'),(10,'Decimo Semestre',10,'control','2'),(11,'Septimo Semestre',7,'sistemas','3'),(12,'Septimo Semestre',7,'telecom','4'),(13,'Octavo Semestre',8,'sistemas','3'),(14,'Octavo Semestre',8,'telecom','4'),(15,'Noveno Semestre',9,'sistemas','3'),(16,'Noveno Semestre',9,'telecom','4'),(17,'Decimo Semestre',10,'sistemas','3'),(18,'Decimo Semestre',10,'telecom','4');
/*!40000 ALTER TABLE `semestres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'false',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `responsable_id` int unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_responsable_id_foreign` (`responsable_id`),
  CONSTRAINT `users_responsable_id_foreign` FOREIGN KEY (`responsable_id`) REFERENCES `responsables` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (15,'Pablo','pablo@mail.com','$2y$10$JVr3sY8xtFw8ijazrgie4O5auidVrfZpWrIhEsSLpUkYIiVT1mGx2','administrativo','true',NULL,1,'2021-03-03 22:27:00','2021-03-03 22:27:00',NULL),(16,'joel','admin@mail.com','$2y$10$bdsYPqHY3MNYK.KlORrPq.QyKp.fVizmmqJZ8ZagpIAXdj89qWB1u','administrativo','true',NULL,1,'2021-03-03 22:34:42','2021-03-03 22:34:42',NULL),(21,'Docente','docente@mail.com','$2y$10$bdsYPqHY3MNYK.KlORrPq.QyKp.fVizmmqJZ8ZagpIAXdj89qWB1u','docente','true',NULL,1,'2021-03-03 23:34:29','2021-03-03 23:34:29',NULL),(25,'Nuevo','nuevo@mail.com','$2y$10$pqIjNa9qsSJVYfDKFfUxmuK6.OBvdkeJzgIgnu0luYLey8tgpqyrq','docente','true',NULL,1,'2021-03-03 23:57:31','2021-06-01 12:58:14',NULL),(26,'Joel vega','se@s','$2y$10$vUqJvnTtUd4fiuyvO5MCLOElXc2sUjrt0P4X9p61nj/g45CRD4dRa','docente','true',NULL,1,'2021-03-03 23:57:48','2021-07-04 03:25:52',NULL),(27,'Joel','joel@mail.com','$2y$10$JVr3sY8xtFw8ijazrgie4O5auidVrfZpWrIhEsSLpUkYIiVT1mGx2','administrativo','false',NULL,1,'2021-05-18 13:33:19','2021-05-18 13:33:19',NULL),(28,'prueba','prueba@mail.com','$2y$10$JVr3sY8xtFw8ijazrgie4O5auidVrfZpWrIhEsSLpUkYIiVT1mGx2','administrativo','true',NULL,1,'2021-05-18 13:46:25','2021-06-01 12:58:28',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `horarios`
--

USE `horarios`;

--
-- Final view structure for view `datos`
--

/*!50001 DROP VIEW IF EXISTS `datos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `datos` AS select `clases`.`id` AS `id`,`clases`.`id` AS `groupId`,`materias`.`nombre` AS `materia`,`materias`.`sigla` AS `title`,`materias`.`semestre` AS `semestre`,`materias`.`tipo` AS `tipo`,`clases`.`paralelo` AS `paralelo`,`clases`.`nivel` AS `nivel`,`responsables`.`titulo` AS `tituloResponsable`,`responsables`.`ap_paterno` AS `responsable`,`ambientes`.`nombre` AS `ambiente`,`ambientes`.`tipo` AS `tipoAmbiente`,`ambientes`.`capacidad` AS `capacidad`,`clases`.`dia` AS `daysOfWeek`,`clases`.`hora_ini` AS `startTime`,`clases`.`hora_fin` AS `endTime`,`periodos`.`nombre` AS `periodo`,`periodos`.`start_date` AS `startDate`,`periodos`.`end_date` AS `endDate`,`clases`.`color` AS `color`,`clases`.`ambiente_id` AS `ambiente_id`,`clases`.`periodo_id` AS `periodo_id`,`clases`.`responsable_id` AS `responsable_id`,`clases`.`materia_id` AS `materia_id`,`clases`.`estado` AS `estado`,`clases`.`deleted_at` AS `deleted` from ((((`clases` join `materias` on((`materias`.`id` = `clases`.`materia_id`))) join `responsables` on((`responsables`.`id` = `clases`.`responsable_id`))) join `ambientes` on((`ambientes`.`id` = `clases`.`ambiente_id`))) join `periodos` on((`periodos`.`id` = `clases`.`periodo_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-10 12:16:25
