CREATE DATABASE  IF NOT EXISTS `varionet` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `varionet`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: varionet
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `data`
--

DROP TABLE IF EXISTS `data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `data_value` json NOT NULL,
  `client_id` int(10) unsigned DEFAULT NULL,
  `system_id` int(10) unsigned NOT NULL,
  `sub_section` int(10) unsigned DEFAULT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `data_data_type_idx` (`data_type_id`),
  KEY `data_client_idx` (`client_id`),
  KEY `data_system_id_idx` (`system_id`),
  CONSTRAINT `data_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `data_data_type` FOREIGN KEY (`data_type_id`) REFERENCES `data_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `data_system_id` FOREIGN KEY (`system_id`) REFERENCES `system` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data`
--

LOCK TABLES `data` WRITE;
/*!40000 ALTER TABLE `data` DISABLE KEYS */;
INSERT INTO `data` VALUES (1,1,'1',1,1,NULL,'2017-08-20 16:12:43'),(2,659,'1',1,1,NULL,'2017-08-20 16:27:32'),(3,659,'[1, 1, 1]',1,1,NULL,'2017-08-20 16:27:55'),(4,659,'[1, 1, 1]',1,1,0,'2017-08-20 19:56:00'),(5,67,'[1, 0]',1,1,1,'2017-08-20 23:43:28'),(6,67,'[0, 0]',1,1,1,'2017-08-20 23:43:35'),(7,67,'[1, 0]',1,1,1,'2017-08-20 23:43:45'),(8,67,'[0, 0]',1,1,1,'2017-08-20 23:43:48'),(9,67,'[1, 0]',1,1,1,'2017-08-20 23:44:01'),(10,67,'[0, 0]',1,1,1,'2017-08-20 23:44:04'),(11,67,'[1, 0]',1,1,1,'2017-08-20 23:44:20'),(12,67,'[0, 0]',1,1,1,'2017-08-20 23:44:29'),(13,67,'[1, 0]',1,1,NULL,'2017-08-20 23:44:42'),(14,67,'[0, 0]',1,1,NULL,'2017-08-20 23:46:23'),(15,67,'[1, 0]',1,1,NULL,'2017-08-20 23:49:49'),(16,68,'[2, 0]',1,1,NULL,'2017-08-20 23:49:49'),(17,67,'[0, 0]',1,1,NULL,'2017-08-20 23:50:00'),(18,68,'[2, 0]',1,1,NULL,'2017-08-20 23:50:00'),(19,69,'[2, 0]',1,1,NULL,'2017-08-20 23:50:00'),(20,67,'[1, 0]',1,1,NULL,'2017-08-20 23:50:15'),(21,68,'[2, 0]',1,1,NULL,'2017-08-20 23:50:15'),(22,69,'[2, 0]',1,1,NULL,'2017-08-20 23:50:15'),(23,67,'[0, 0]',1,1,NULL,'2017-08-20 23:50:55'),(24,68,'[2, 0]',1,1,NULL,'2017-08-20 23:50:55'),(25,69,'[2, 0]',1,1,NULL,'2017-08-20 23:50:55'),(26,56,'[\"Test 2             \", \"Test 2             \"]',1,1,NULL,'2017-08-20 23:50:55'),(27,67,'[1, 0]',1,1,NULL,'2017-08-20 23:51:33'),(28,68,'[2, 0]',1,1,NULL,'2017-08-20 23:51:33'),(29,69,'[2, 0]',1,1,NULL,'2017-08-20 23:51:33'),(30,56,'[\"abc\", \"Test 2             \"]',1,1,NULL,'2017-08-20 23:51:33'),(31,67,'[0, 0]',1,1,NULL,'2017-08-20 23:54:05'),(32,68,'[2, 0]',1,1,NULL,'2017-08-20 23:54:05'),(33,69,'[2, 0]',1,1,NULL,'2017-08-20 23:54:05'),(34,56,'[\"abc\", \"Test 2             \"]',1,1,NULL,'2017-08-20 23:54:05'),(35,67,'[1, 0]',1,1,NULL,'2017-08-20 23:54:59'),(36,68,'[2, 0]',1,1,NULL,'2017-08-20 23:54:59'),(37,69,'[2, 0]',1,1,NULL,'2017-08-20 23:54:59'),(38,56,'[\"abc\", \"Test 2             \"]',1,1,NULL,'2017-08-20 23:54:59'),(39,67,'[0, 0]',1,1,NULL,'2017-08-20 23:55:14'),(40,68,'[2, 0]',1,1,NULL,'2017-08-20 23:55:14'),(41,69,'[2, 0]',1,1,NULL,'2017-08-20 23:55:14'),(42,56,'[\"abc\", \"Test 2             \"]',1,1,NULL,'2017-08-20 23:55:14'),(43,67,'[1, 0]',1,1,NULL,'2017-08-20 23:55:27'),(44,68,'[0, 0]',1,1,NULL,'2017-08-20 23:55:27'),(45,69,'[2, 0]',1,1,NULL,'2017-08-20 23:55:27'),(46,56,'[\"abc\", \"Test 2             \"]',1,1,NULL,'2017-08-20 23:55:27'),(47,193,'[1, 0, 0, 0, 0]',1,1,4,'2017-08-21 00:15:03'),(48,193,'[1, 0, 0, 0, 0]',1,1,4,'2017-08-21 00:15:48'),(49,67,'[0, 0]',1,1,NULL,'2017-08-21 08:26:20'),(50,67,'[1, 0]',1,1,NULL,'2017-08-21 08:27:42'),(51,67,'[0, 0]',1,1,NULL,'2017-08-21 08:28:09'),(52,67,'[1, 0]',1,1,NULL,'2017-08-21 08:28:36'),(53,67,'[0, 0]',1,1,NULL,'2017-08-22 07:39:43'),(54,67,'[1, 0]',1,1,NULL,'2017-08-22 07:40:10'),(55,193,'[1, 0, 0, 0, 0]',1,1,1,'2017-08-22 07:40:10'),(56,67,'[0, 0]',1,1,NULL,'2017-08-22 11:27:28'),(57,68,'[1, 0]',1,1,NULL,'2017-08-22 11:29:56'),(58,55,'[\"test@schoenhammer.e                   \", \"test@schoenhammer.de                   \"]',1,1,NULL,'2017-08-22 14:00:03'),(59,55,'[\"test@schoenhammr.de                   \", \"test@schoenhammer.de                   \"]',1,1,NULL,'2017-08-22 14:07:06'),(60,56,'[\"Test 1            \", \"Test 2             \"]',1,1,NULL,'2017-08-22 14:09:29'),(61,56,'[\"Test 1           \", \"Test 2             \"]',1,1,NULL,'2017-08-22 14:09:32'),(62,53,'\"shoenhammer.gmbh@t-online.de          \"',1,1,NULL,'2017-08-22 14:33:56'),(63,52,'\"195.3.9671        \"',1,1,NULL,'2017-08-22 14:33:56'),(64,51,'\"080400888120      \"',1,1,NULL,'2017-08-22 14:33:57'),(65,50,'\"2qdmndj           \"',1,1,NULL,'2017-08-22 14:33:57'),(66,49,'\"166795000                             \"',1,1,NULL,'2017-08-22 14:33:57'),(67,56,'[\"Tet 1             \", \"Test 2             \"]',1,1,NULL,'2017-08-22 14:33:57'),(68,55,'[\"testschoenhammer.de                   \", \"test@schoenhammer.de                   \"]',1,1,NULL,'2017-08-22 14:33:57'),(69,1,'\"VARINET           \"',1,1,NULL,'2017-08-22 14:33:57'),(70,2,'\"KUNDENAME         \"',1,1,NULL,'2017-08-22 14:33:57'),(71,55,'[\"test@schoenhammer.de                   \", \"test@choenhammer.de                   \"]',1,1,NULL,'2017-08-22 15:27:04'),(72,56,'[\"Test 1             \", \"Test 2            \"]',1,1,NULL,'2017-08-22 15:27:04'),(73,49,'\"167395000                             \"',1,1,NULL,'2017-08-22 15:27:04'),(74,50,'\"qdmundj           \"',1,1,NULL,'2017-08-22 15:27:04'),(75,51,'\"0804008888120     \"',1,1,NULL,'2017-08-22 15:27:04'),(76,52,'\"15.3.96.71        \"',1,1,NULL,'2017-08-22 15:27:04'),(77,53,'\"shoenhammer.gmbh@t-online.de          \"',1,1,NULL,'2017-08-22 15:27:04'),(78,55,'[\"test@schoenhammer.de                   \", \"test@choenhammer.de                   \"]',1,1,NULL,'2017-08-22 15:27:07'),(79,56,'[\"Test 1             \", \"Test 2            \"]',1,1,NULL,'2017-08-22 15:27:07'),(80,49,'\"167395000                             \"',1,1,NULL,'2017-08-22 15:27:07'),(81,50,'\"qdmundj           \"',1,1,NULL,'2017-08-22 15:27:07'),(82,51,'\"0804008888120     \"',1,1,NULL,'2017-08-22 15:27:07'),(83,52,'\"15.3.96.71        \"',1,1,NULL,'2017-08-22 15:27:07'),(84,53,'\"shoenhammer.gmbh@t-online.de          \"',1,1,NULL,'2017-08-22 15:27:07'),(85,55,'[\"test@schoenhammer.de                   \", \"test@choenhammer.de                   \"]',1,1,NULL,'2017-08-22 15:27:07'),(86,56,'[\"Test 1             \", \"Test 2            \"]',1,1,NULL,'2017-08-22 15:27:07'),(87,49,'\"167395000                             \"',1,1,NULL,'2017-08-22 15:27:07'),(88,50,'\"qdmundj           \"',1,1,NULL,'2017-08-22 15:27:07'),(89,51,'\"0804008888120     \"',1,1,NULL,'2017-08-22 15:27:07'),(90,52,'\"15.3.96.71        \"',1,1,NULL,'2017-08-22 15:27:07'),(91,53,'\"shoenhammer.gmbh@t-online.de          \"',1,1,NULL,'2017-08-22 15:27:07'),(92,55,'[\"test@schoenhammer.de                   \", \"test@choenhammer.de                   \"]',1,1,NULL,'2017-08-22 15:27:07'),(93,56,'[\"Test 1             \", \"Test 2            \"]',1,1,NULL,'2017-08-22 15:27:07'),(94,49,'\"167395000                             \"',1,1,NULL,'2017-08-22 15:27:07'),(95,50,'\"qdmundj           \"',1,1,NULL,'2017-08-22 15:27:07'),(96,51,'\"0804008888120     \"',1,1,NULL,'2017-08-22 15:27:07'),(97,52,'\"15.3.96.71        \"',1,1,NULL,'2017-08-22 15:27:07'),(98,53,'\"shoenhammer.gmbh@t-online.de          \"',1,1,NULL,'2017-08-22 15:27:07'),(99,55,'[\"test@schoenhammer.de                   \", \"test@choenhammer.de                   \"]',1,1,NULL,'2017-08-22 15:27:07'),(100,56,'[\"Test 1             \", \"Test 2            \"]',1,1,NULL,'2017-08-22 15:27:07'),(101,49,'\"167395000                             \"',1,1,NULL,'2017-08-22 15:27:07'),(102,50,'\"qdmundj           \"',1,1,NULL,'2017-08-22 15:27:07'),(103,51,'\"0804008888120     \"',1,1,NULL,'2017-08-22 15:27:07'),(104,52,'\"15.3.96.71        \"',1,1,NULL,'2017-08-22 15:27:07'),(105,53,'\"shoenhammer.gmbh@t-online.de          \"',1,1,NULL,'2017-08-22 15:27:07'),(106,55,'[\"test@schoenhammer.de                   \", \"test@choenhammer.de                   \"]',1,1,NULL,'2017-08-22 15:27:07'),(107,56,'[\"Test 1             \", \"Test 2            \"]',1,1,NULL,'2017-08-22 15:27:07'),(108,49,'\"167395000                             \"',1,1,NULL,'2017-08-22 15:27:07'),(109,50,'\"qdmundj           \"',1,1,NULL,'2017-08-22 15:27:07'),(110,51,'\"0804008888120     \"',1,1,NULL,'2017-08-22 15:27:07'),(111,52,'\"15.3.96.71        \"',1,1,NULL,'2017-08-22 15:27:07'),(112,53,'\"shoenhammer.gmbh@t-online.de          \"',1,1,NULL,'2017-08-22 15:27:07'),(113,55,'[\"test@schoenhammer.de                   \", \"test@choenhammer.de                   \"]',1,1,NULL,'2017-08-22 15:27:08'),(114,56,'[\"Test 1             \", \"Test 2            \"]',1,1,NULL,'2017-08-22 15:27:08'),(115,49,'\"167395000                             \"',1,1,NULL,'2017-08-22 15:27:08'),(116,50,'\"qdmundj           \"',1,1,NULL,'2017-08-22 15:27:08'),(117,51,'\"0804008888120     \"',1,1,NULL,'2017-08-22 15:27:08'),(118,52,'\"15.3.96.71        \"',1,1,NULL,'2017-08-22 15:27:08'),(119,53,'\"shoenhammer.gmbh@t-online.de          \"',1,1,NULL,'2017-08-22 15:27:08'),(120,55,'[\"test@schoenhammer.de                   \", \"test@choenhammer.de                   \"]',1,1,NULL,'2017-08-22 15:27:08'),(121,56,'[\"Test 1             \", \"Test 2            \"]',1,1,NULL,'2017-08-22 15:27:08'),(122,49,'\"167395000                             \"',1,1,NULL,'2017-08-22 15:27:08'),(123,50,'\"qdmundj           \"',1,1,NULL,'2017-08-22 15:27:08'),(124,51,'\"0804008888120     \"',1,1,NULL,'2017-08-22 15:27:08'),(125,52,'\"15.3.96.71        \"',1,1,NULL,'2017-08-22 15:27:08'),(126,53,'\"shoenhammer.gmbh@t-online.de          \"',1,1,NULL,'2017-08-22 15:27:08'),(127,55,'[\"test@schoenhammer.de                   \", \"test@choenhammer.de                   \"]',1,1,NULL,'2017-08-22 15:27:09'),(128,56,'[\"Test 1             \", \"Test 2            \"]',1,1,NULL,'2017-08-22 15:27:09'),(129,49,'\"167395000                             \"',1,1,NULL,'2017-08-22 15:27:09'),(130,50,'\"qdmundj           \"',1,1,NULL,'2017-08-22 15:27:09'),(131,51,'\"0804008888120     \"',1,1,NULL,'2017-08-22 15:27:09'),(132,52,'\"15.3.96.71        \"',1,1,NULL,'2017-08-22 15:27:09'),(133,53,'\"shoenhammer.gmbh@t-online.de          \"',1,1,NULL,'2017-08-22 15:27:09'),(134,74,'[2, 1]',1,1,NULL,'2017-08-22 15:27:16'),(135,74,'[2, 1]',1,1,NULL,'2017-08-22 15:27:23'),(136,55,'[\"test@schoenhammer.de                   \", \"test@scoenhammer.de                   \"]',1,1,NULL,'2017-08-22 15:27:23'),(137,74,'[2, 1]',1,1,NULL,'2017-08-22 15:27:29'),(138,55,'[\"test@schoenhammer.de                   \", \"test@scoenhammer.de                   \"]',1,1,NULL,'2017-08-22 15:27:29'),(139,56,'[\"Test 1             \", \"Tes 2             \"]',1,1,NULL,'2017-08-22 15:27:29'),(140,49,'\"166739000                             \"',1,1,NULL,'2017-08-22 15:27:29'),(141,50,'\"2qdmndj           \"',1,1,NULL,'2017-08-22 15:27:29'),(142,51,'\"080408888120      \"',1,1,NULL,'2017-08-22 15:27:29'),(143,52,'\"195.3.6.71        \"',1,1,NULL,'2017-08-22 15:27:29'),(144,53,'\"schoenammer.gmbh@t-online.de          \"',1,1,NULL,'2017-08-22 15:27:29'),(145,74,'[2, 1]',1,1,NULL,'2017-08-22 15:27:37'),(146,55,'[\"test@schoenhammer.de                   \", \"testscoenhammer.de                   \"]',1,1,NULL,'2017-08-22 15:27:37'),(147,56,'[\"Test 1             \", \"Te 2             \"]',1,1,NULL,'2017-08-22 15:27:37'),(148,49,'\"16679000                             \"',1,1,NULL,'2017-08-22 15:27:37'),(149,50,'\"2qdmdj           \"',1,1,NULL,'2017-08-22 15:27:37'),(150,51,'\"08040888120      \"',1,1,NULL,'2017-08-22 15:27:37'),(151,52,'\"195.36.71        \"',1,1,NULL,'2017-08-22 15:27:37'),(152,53,'\"schoenamer.gmbh@t-online.de          \"',1,1,NULL,'2017-08-22 15:27:37'),(153,2,'\"KUNDENAME         \"',1,1,NULL,'2017-08-22 15:27:37'),(154,1,'\"VARIOET           \"',1,1,NULL,'2017-08-22 15:27:37'),(155,13,'2',1,1,NULL,'2017-08-23 07:39:12'),(156,11,'1',1,1,NULL,'2017-08-23 07:46:02'),(157,11,'0',1,1,NULL,'2017-08-23 07:46:09'),(158,11,'1',1,1,NULL,'2017-08-23 07:46:17'),(159,162,'50',1,1,3,'2017-08-28 09:25:21'),(160,67,'[1, 0]',1,1,NULL,'2017-08-29 07:41:04'),(161,67,'[0, 0]',1,1,NULL,'2017-08-29 07:41:49'),(162,68,'[0, 0]',1,1,NULL,'2017-08-29 07:41:49'),(163,67,'[0, 0]',1,1,NULL,'2017-08-29 10:18:45'),(164,54,'[1, 1]',1,1,NULL,'2017-08-29 10:18:45'),(165,67,'[0, 0]',1,1,NULL,'2017-08-29 10:19:24'),(166,54,'[1, 1]',1,1,NULL,'2017-08-29 10:19:24'),(167,68,'[1, 0]',1,1,NULL,'2017-08-29 10:20:15'),(168,68,'[1, 0]',1,1,NULL,'2017-08-29 10:20:39'),(169,67,'[0, 0]',1,1,NULL,'2017-08-29 10:20:39'),(170,67,'[0, 0]',1,1,NULL,'2017-08-29 10:22:32'),(171,67,'[0, 0]',1,1,NULL,'2017-08-29 10:22:46'),(172,67,'[0, 0]',1,1,NULL,'2017-08-29 10:22:53'),(173,67,'[0, 0]',1,1,NULL,'2017-08-29 10:23:17'),(174,67,'[0, 0]',1,1,NULL,'2017-08-29 10:23:24'),(175,54,'[1, 1]',1,1,NULL,'2017-08-29 10:23:24'),(176,67,'[0, 0]',1,1,NULL,'2017-08-29 10:23:30'),(177,54,'[1, 1]',1,1,NULL,'2017-08-29 10:23:30'),(178,67,'[0, 0]',1,1,NULL,'2017-08-29 10:23:40'),(179,54,'[1, 1]',1,1,NULL,'2017-08-29 10:23:40'),(180,67,'[0, 0]',1,1,NULL,'2017-08-29 10:23:50'),(181,54,'[1, 1]',1,1,NULL,'2017-08-29 10:23:50'),(182,68,'[1, 0]',1,1,NULL,'2017-08-29 10:23:50'),(183,68,'[1, 0]',1,1,NULL,'2017-08-29 10:24:30'),(184,68,'[1, 0]',1,1,NULL,'2017-08-29 10:24:40'),(185,67,'[0, 0]',1,1,NULL,'2017-08-29 10:24:40'),(186,67,'[0, 0]',1,1,NULL,'2017-08-29 10:25:23'),(187,67,'[0, 0]',1,1,NULL,'2017-08-29 10:25:33'),(188,67,'[0, 0]',1,1,NULL,'2017-08-29 10:25:43'),(189,67,'[0, 0]',1,1,NULL,'2017-08-29 10:25:48'),(190,54,'[1, 1]',1,1,NULL,'2017-08-29 10:25:48'),(191,67,'[0, 0]',1,1,NULL,'2017-08-29 10:26:02'),(192,54,'[1, 1]',1,1,NULL,'2017-08-29 10:26:02'),(193,67,'[0, 0]',1,1,NULL,'2017-08-29 10:26:20'),(194,54,'[1, 1]',1,1,NULL,'2017-08-29 10:26:20'),(195,67,'[1, 0]',1,1,NULL,'2017-08-29 10:46:04'),(196,67,'[1, 0]',1,1,NULL,'2017-08-29 10:46:18'),(197,54,'[1, 1]',1,1,NULL,'2017-08-29 10:46:18'),(198,67,'[1, 0]',1,1,NULL,'2017-08-29 10:46:52'),(199,54,'[1, 1]',1,1,NULL,'2017-08-29 10:46:52'),(200,67,'[0, 0]',1,1,NULL,'2017-08-29 10:47:13'),(201,67,'[0, 0]',1,1,NULL,'2017-08-29 10:50:58'),(202,67,'[0, 0]',1,1,NULL,'2017-08-29 11:11:54'),(203,67,'[0, 0]',1,1,NULL,'2017-08-29 11:12:09'),(204,67,'[0, 0]',1,1,NULL,'2017-08-29 11:12:17'),(205,67,'[1, 0]',1,1,NULL,'2017-08-29 11:24:07'),(206,67,'[1, 0]',1,1,NULL,'2017-08-29 11:24:12'),(207,67,'[0, 0]',1,1,NULL,'2017-08-29 11:24:15'),(208,67,'[1, 0]',1,1,NULL,'2017-08-29 11:24:21'),(209,54,'[1, 1]',1,1,NULL,'2017-08-29 11:24:21'),(210,67,'[0, 1]',1,1,NULL,'2017-08-29 11:24:35'),(211,54,'[0, 1]',1,1,NULL,'2017-08-29 11:24:35'),(212,67,'[0, 1]',1,1,NULL,'2017-08-29 11:24:50'),(213,54,'[0, 1]',1,1,NULL,'2017-08-29 11:24:50'),(214,68,'[0, 1]',1,1,NULL,'2017-08-29 11:24:50'),(215,67,'[0, 1]',1,1,NULL,'2017-08-29 11:25:01'),(216,54,'[0, 1]',1,1,NULL,'2017-08-29 11:25:01'),(217,68,'[0, 2]',1,1,NULL,'2017-08-29 11:25:01'),(218,67,'[0, 1]',1,1,NULL,'2017-08-29 11:25:13'),(219,54,'[1, 1]',1,1,NULL,'2017-08-29 11:25:13'),(220,68,'[0, 2]',1,1,NULL,'2017-08-29 11:25:13'),(221,67,'[0, 0]',1,1,NULL,'2017-08-29 11:25:27'),(222,54,'[1, 1]',1,1,NULL,'2017-08-29 11:25:27'),(223,68,'[0, 2]',1,1,NULL,'2017-08-29 11:25:27'),(224,67,'[0, 0]',1,1,NULL,'2017-08-29 11:25:35'),(225,54,'[0, 1]',1,1,NULL,'2017-08-29 11:25:35'),(226,68,'[0, 2]',1,1,NULL,'2017-08-29 11:25:35'),(227,67,'[1, 1]',1,1,NULL,'2017-08-29 11:26:08'),(228,54,'[0, 1]',1,1,NULL,'2017-08-29 11:26:09'),(229,68,'[0, 2]',1,1,NULL,'2017-08-29 11:26:09'),(230,67,'[1, 1]',1,1,NULL,'2017-08-29 11:26:20'),(231,54,'[1, 1]',1,1,NULL,'2017-08-29 11:26:20'),(232,68,'[0, 2]',1,1,NULL,'2017-08-29 11:26:20'),(233,67,'[1, 1]',1,1,NULL,'2017-08-29 11:26:38'),(234,54,'[1, 1]',1,1,NULL,'2017-08-29 11:26:38'),(235,67,'[1, 0]',1,1,NULL,'2017-08-29 11:44:48'),(236,67,'[1, 0]',1,1,NULL,'2017-08-29 15:10:47'),(237,54,'[1, 1]',1,1,NULL,'2017-08-29 15:10:47'),(238,68,'[-4, 0]',1,1,NULL,'2017-08-29 15:10:47'),(239,69,'[-4, 0]',1,1,NULL,'2017-08-29 15:10:47'),(240,67,'[1, 0]',1,1,NULL,'2017-08-29 15:11:19'),(241,54,'[1, 1]',1,1,NULL,'2017-08-29 15:11:19'),(242,68,'[-4, 0]',1,1,NULL,'2017-08-29 15:11:19'),(243,69,'[-4, 0]',1,1,NULL,'2017-08-29 15:11:19'),(244,95,'[112, 100, 100, 100, 100]',1,1,3,'2017-08-29 15:11:19'),(245,67,'[0, 0]',1,1,NULL,'2017-09-04 11:59:38'),(246,68,'[1, 0]',1,1,NULL,'2017-09-18 06:46:15'),(247,68,'[1, 0]',1,1,NULL,'2017-09-18 06:47:39'),(248,91,'[251, 250, 250, 250, 250]',1,1,0,'2017-09-18 06:47:39'),(249,68,'[1, 0]',1,1,NULL,'2017-09-18 06:48:18'),(250,91,'[251, 250, 250, 250, 250]',1,1,0,'2017-09-18 06:48:18'),(251,91,'[201, 200, 150, 200, 200]',1,1,10,'2017-09-18 06:48:18'),(252,68,'[1, 0]',1,1,NULL,'2017-09-18 06:49:59'),(253,73,'[1, 1]',1,1,NULL,'2017-09-18 06:49:59'),(254,91,'[251, 250, 250, 250, 250]',1,1,0,'2017-09-18 06:49:59'),(255,91,'[201, 200, 150, 200, 200]',1,1,10,'2017-09-18 06:49:59'),(256,68,'[1, 0]',1,1,NULL,'2017-09-18 06:50:03'),(257,73,'[0, 1]',1,1,NULL,'2017-09-18 06:50:03'),(258,91,'[251, 250, 250, 250, 250]',1,1,0,'2017-09-18 06:50:03'),(259,91,'[201, 200, 150, 200, 200]',1,1,10,'2017-09-18 06:50:03'),(260,68,'[1, 0]',1,1,NULL,'2017-09-18 06:50:44'),(261,73,'[1, 1]',1,1,NULL,'2017-09-18 06:50:44'),(262,91,'[251, 250, 250, 250, 250]',1,1,0,'2017-09-18 06:50:44'),(263,91,'[201, 200, 150, 200, 200]',1,1,10,'2017-09-18 06:50:44'),(264,68,'[1, 0]',1,1,NULL,'2017-09-18 11:06:36'),(265,68,'[1, 0]',1,1,NULL,'2017-09-18 11:07:35'),(266,91,'[201, 200, 150, 200, 200]',1,1,5,'2017-09-18 11:07:35'),(267,68,'[5, 0]',1,1,NULL,'2017-09-29 14:27:40'),(268,68,'[5, 0]',1,1,NULL,'2017-09-29 14:29:51'),(269,91,'[203, 200, 150, 200, 200]',1,1,3,'2017-09-29 14:29:51'),(270,74,'[0, 1222]',1,1,NULL,'2017-10-05 09:58:24');
/*!40000 ALTER TABLE `data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-01 11:25:55
