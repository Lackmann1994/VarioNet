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
-- Table structure for table `system`
--

DROP TABLE IF EXISTS `system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `address_id` int(11) unsigned NOT NULL,
  `client_id` int(11) unsigned NOT NULL COMMENT 'pos=002, select',
  `ip_address` binary(16) DEFAULT NULL COMMENT 'pos=001, input type="ip_address", required, html=\n<label for="field">%1$s:</label>\n<br>\n<input type="text" name="%2$s" value="%3$s" required/>\n<br>',
  `status` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'pos=003, input type="number", html=\n<label for="field">%1$s:</label>\n<br>\n<input type="number" name="%2$s" value="%3$s" required/>\n<br>',
  `on_top_10m` tinyint(4) DEFAULT NULL COMMENT 'pos=004, input type="number", html=\n<label for="field">%1$s:</label>\n<br>\n<input type="number" name="%2$s" value="%3$s"/>\n<br>',
  `washing` varchar(45) DEFAULT NULL COMMENT 'pos=005, input type="text", html=\n<label for="field">%1$s:</label>\n<br>\n<input type="text" name="%2$s" value="%3$s"/>\n<span class="error"></span>\n<br>',
  `dryer` varchar(45) DEFAULT NULL COMMENT 'pos=006, input type="text", break, html=\n<label for="field">%1$s:</label>\n<br>\n<input type="text" name="%2$s" value="%3$s" />\n<br>',
  `control` varchar(45) DEFAULT NULL COMMENT 'pos=007, input type="text", html=\n<label for="field">%1$s:</label>\n<br>\n<input type="text" name="%2$s" value="%3$s"/>\n<br>',
  `switch_cabinet` varchar(45) DEFAULT NULL COMMENT 'pos=008, input type="text", html=\n<label for="field">%1$s:</label>\n<br>\n<input type="text" name="%2$s" value="%3$s"/>\n<br>',
  `display` int(11) DEFAULT NULL COMMENT 'pos=009, input type="number", html=\n<label for="field">%1$s:</label>\n<br>\n<input type="number" name="%2$s" value="%3$s"/>\n<br>',
  `qt` int(11) DEFAULT NULL COMMENT 'pos=010, input type="number", html=\n<label for="field">%1$s:</label>\n<br>\n<input type="text" name="%2$s" value="%3$s"/>\n<br>',
  `image` int(11) DEFAULT NULL COMMENT 'pos=011, input type="number", html=\n<label for="field">%1$s:</label>\n<br>\n<input type="number" name="%2$s" value="%3$s" />\n<br>',
  `link` varchar(45) DEFAULT NULL COMMENT 'pos=012, input type="text", break, html=\n<label for="field">%1$s:</label>\n<br>\n<input type="text" name="%2$s" value="%3$s"/>\n<br>',
  `password_hash` varchar(256) DEFAULT NULL COMMENT 'pos=203, input type="password", required, html=\n<label for="field">%1$s:</label>\n<br>\n<input type="password" name="%2$s" required id="field" data-indicator="pwindicator"/>\n<div id="pwindicator" style="display: inline-block">\n<div class="bar"></div>\n<div class="label"></div>\n</div>\n<br>\n<label for="field">%1$s:</label>\n<br>\n<input type="password" name="%2$s2" required/>\n<br>',
  `description_intern` text COMMENT 'pos=201, textarea, html=\n<label for="field">%1$s:</label>\n<br>\n<textarea name="%2$s" cols="23" rows="3" >%3$s</textarea>\n<br>',
  `description_extern` text COMMENT 'pos=202, textarea, html=\n<label for="field">%1$s:</label>\n<br>\n<textarea name="%2$s" cols="23" rows="3" >%3$s</textarea>\n<br>',
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_address_idx` (`address_id`),
  KEY `system_client_idx` (`client_id`),
  CONSTRAINT `system_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `system_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system`
--

LOCK TABLES `system` WRITE;
/*!40000 ALTER TABLE `system` DISABLE KEYS */;
INSERT INTO `system` VALUES (1,26,1,'3232235523\0\0\0\0\0\0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$2y$10$YYNlOAgQDV.9KMVSkCfLNOrtjmTzC8aylUpkWFIMC11SGZtYISv8m',NULL,NULL,NULL),(2,28,2,'3232235522\0\0\0\0\0\0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$2y$10$CFio1zVM72K/zuqqUVPZCu8O/KGaJyxfjTX0z5zpuVTgy6jVZJCFi',NULL,NULL,NULL),(3,28,4,'?\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$2y$10$CFio1zVM72K/zuqqUVPZCu8O/KGaJyxfjTX0z5zpuVTgy6jVZJCFi',NULL,NULL,NULL),(11,41,1,'3232235521\0\0\0\0\0\0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$2y$10$V3sO0pe08ngEVLpXiaaUD.PEL4AS3FMFgQUzbSeRswG9Kkt690orC','1','1',NULL),(12,42,1,'3232235522\0\0\0\0\0\0',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$2y$10$QKnKNuTPlD9nGxzut65z1.W1KiM8.KfBxLoi9C1sWebSVnkeuyoV6',NULL,NULL,NULL);
/*!40000 ALTER TABLE `system` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-01 11:25:54
