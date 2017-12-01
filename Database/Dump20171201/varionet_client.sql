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
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL COMMENT 'pos=001, input type="text", required, html=\n<label for="field">%1$s:</label>\n<br>\n<input type="text" name="%2$s" value="%3$s" required/>\n<br>',
  `lastname` varchar(45) NOT NULL COMMENT 'pos=002, input type="text", required, html=\n<label for="field">%1$s:</label>\n<br>\n<input type="text" name="%2$s" value="%3$s" required/>\n<br>',
  `password_hash` varchar(256) NOT NULL COMMENT 'pos=203, input type="password", required, html=\n<label for="field">%1$s:</label>\n<br>\n<input type="password" name="%2$s" required id="field" data-indicator="pwindicator"/>\n<div id="pwindicator" style="display: inline-block">\n<div class="bar"></div>\n<div class="label"></div>\n</div>\n<br>\n<label for="field">%1$s:</label>\n<br>\n<input type="password" name="%2$s2" required/>\n<br>',
  `email` varchar(45) NOT NULL COMMENT 'pos=004, input type="email", required, html=\n<label for="field">%1$s:</label>\n<br>\n<input type="email" name="%2$s" value="%3$s" required/>\n<br>\n',
  `super_client` int(11) unsigned DEFAULT NULL COMMENT 'pos=005, select, required',
  `logo` blob COMMENT 'pos=006, input type="file", html=\n<label for="field">%1$s:</label>\n<br>\n<input type="file" name="%2$s" value="%3$s"/>\n<br>',
  `address_id` int(11) unsigned NOT NULL,
  `last_login` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `logout_timer` int(11) unsigned NOT NULL DEFAULT '60' COMMENT 'pos=007, input type="number", break, html=\n<label for="field">%1$s:</label>\n<br>\n<input type="number" name="%2$s" value="%3$s" required/>\n<br>\n',
  `description_intern` text COMMENT 'pos=201, textarea html=\n<label for="field">%1$s:</label>\n<br>\n<textarea name="%2$s" cols="23" rows="3" >%3$s</textarea>\n<br>',
  `description_extern` text COMMENT 'pos=202, textarea, permission="root", html=\n<label for="field">%1$s:</label>\n<br>\n<textarea name="%2$s" cols="23" rows="3" >%3$s</textarea>\n<br>',
  `default_language` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `client_client_idx` (`super_client`),
  KEY `client_address_idx` (`address_id`),
  CONSTRAINT `client_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `client_client` FOREIGN KEY (`super_client`) REFERENCES `client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'test1','test1','$2y$10$N0Ja2.xfl.cNBiZ258gbD.I9oD14ZvS2aSJ18k5Qk26yq0PTeYN2O','test1@test1.de',NULL,NULL,1,'2017-10-12 11:21:51',60,'1',NULL,'de'),(2,'test2','test2','$2y$10$RoU1W2m4ARH0ZTCO/hmO3eaY96vWL9O0Ucs8FFIXCNczboZBISwty','Test2@test2.de',1,NULL,25,'2017-10-12 11:21:51',60,NULL,NULL,'en'),(3,'Max','Muster','$2y$10$61rw8pwizwNLdUclCSragOH92iNWHWso5IhzJjBQiKK/HyEzsBPYe','max@muster.de',1,NULL,27,'2017-10-12 11:21:51',60,NULL,NULL,NULL),(4,'test3','test3','$2y$10$vuqnTw1DVMWNJXQsevPw3uuTomd6sigC0tjR1QDu4klF5Obq1pIT.','test3@test3.de',2,NULL,36,'2017-10-12 11:21:51',60,'3','3',NULL),(5,'new(changed)','new','$2y$10$o7pKi2BWV6Hnd5WHX/FTg.OJBEe7EeBwrXwFLctqgsTNDkBJm6LS6','new@new.de',1,NULL,37,'2017-10-12 11:21:51',60,NULL,NULL,NULL),(6,'demo1','demo','$2y$10$N0Ja2.xfl.cNBiZ258gbD.I9oD14ZvS2aSJ18k5Qk26yq0PTeYN2O','demo1@demo.de',1,NULL,1,'2017-11-23 07:31:05',60,NULL,NULL,NULL),(7,'demo2','demo','$2y$10$N0Ja2.xfl.cNBiZ258gbD.I9oD14ZvS2aSJ18k5Qk26yq0PTeYN2O','demo2@demo.de',1,NULL,1,'2017-11-23 07:31:33',60,NULL,NULL,NULL),(8,'demo3','demo','$2y$10$N0Ja2.xfl.cNBiZ258gbD.I9oD14ZvS2aSJ18k5Qk26yq0PTeYN2O','demo3@demo.de',1,NULL,1,'2017-11-23 07:32:11',60,NULL,NULL,NULL),(9,'demo4','demo','$2y$10$N0Ja2.xfl.cNBiZ258gbD.I9oD14ZvS2aSJ18k5Qk26yq0PTeYN2O','demo4@demo.de',1,NULL,1,'2017-11-23 07:32:11',60,NULL,NULL,NULL),(10,'demo5','demo','$2y$10$N0Ja2.xfl.cNBiZ258gbD.I9oD14ZvS2aSJ18k5Qk26yq0PTeYN2O','demo5@demo.de',1,NULL,1,'2017-11-23 07:32:11',60,NULL,NULL,NULL),(11,'demo6','demo','$2y$10$N0Ja2.xfl.cNBiZ258gbD.I9oD14ZvS2aSJ18k5Qk26yq0PTeYN2O','demo6@demo.de',1,NULL,1,'2017-11-23 07:32:11',60,NULL,NULL,NULL),(12,'demo7','demo','$2y$10$N0Ja2.xfl.cNBiZ258gbD.I9oD14ZvS2aSJ18k5Qk26yq0PTeYN2O','demo7@demo.de',1,NULL,1,'2017-11-23 07:32:46',60,NULL,NULL,NULL),(13,'demo8','demo','$2y$10$N0Ja2.xfl.cNBiZ258gbD.I9oD14ZvS2aSJ18k5Qk26yq0PTeYN2O','demo8@demo.de',1,NULL,1,'2017-11-23 07:32:46',60,NULL,NULL,NULL),(14,'demo9','demo','$2y$10$N0Ja2.xfl.cNBiZ258gbD.I9oD14ZvS2aSJ18k5Qk26yq0PTeYN2O','demo9@demo.de',1,NULL,1,'2017-11-23 07:32:46',60,NULL,NULL,NULL),(15,'demo10','demo','$2y$10$N0Ja2.xfl.cNBiZ258gbD.I9oD14ZvS2aSJ18k5Qk26yq0PTeYN2O','demo10@demo.de',1,NULL,1,'2017-11-23 07:32:46',60,NULL,NULL,NULL);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER insert_client_path AFTER INSERT ON client
	FOR EACH ROW BEGIN
		DECLARE parent_path TEXT DEFAULT '';
        SELECT path into parent_path FROM client_path WHERE id = NEW.super_client;
        INSERT INTO client_path (`client_id`, `path`)
		VALUES(
			NEW.id, CONCAT(IF(LENGTH(parent_path) < 2, '/', parent_path), NEW.id, '/')
        );
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER update_client_path BEFORE UPDATE ON client
	FOR EACH ROW BEGIN
		DECLARE old_path TEXT DEFAULT '';
        DECLARE new_path TEXT DEFAULT '';
        SELECT path INTO old_path FROM client_path WHERE client_id = NEW.id;
        SELECT path INTO new_path FROM client_path WHERE client_id = NEW.super_client;
        UPDATE client_path set path = 
			REPLACE(path, old_path, CONCAT(IF(LENGTH(new_path) < 2, '/', new_path), NEW.id, '/') )
            WHERE LEFT(path, LENGTH(old_path)) = old_path;
		END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `varionet`.`delete_client_path` BEFORE DELETE ON `client` FOR EACH ROW
BEGIN

	DELETE FROM `varionet`.`client_path`
	WHERE client_id = OLD.id;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-01 11:25:54
