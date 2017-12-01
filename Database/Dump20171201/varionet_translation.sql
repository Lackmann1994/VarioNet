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
-- Table structure for table `translation`
--

DROP TABLE IF EXISTS `translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `name_de` varchar(45) DEFAULT NULL,
  `name_en` varchar(45) DEFAULT NULL,
  `name_fr` varchar(45) DEFAULT NULL,
  `desc_de` varchar(256) DEFAULT NULL,
  `desc_en` varchar(256) DEFAULT NULL,
  `desc_fr` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translation`
--

LOCK TABLES `translation` WRITE;
/*!40000 ALTER TABLE `translation` DISABLE KEYS */;
INSERT INTO `translation` VALUES (1,'email','E-Mail','e-mail','e-mail','NULL','NULL','NULL'),(2,'login','Anmeldung','login','missing','NULL','NULL','NULL'),(3,'password','Passwort','password','missing','NULL','NULL','NULL'),(4,'language','Sprache','language','missing','NULL','NULL','NULL'),(5,'overview','Übersicht','overview','missing','NULL','NULL','NULL'),(6,'logged_as','Eingeloggt als','logged in as','missing','NULL','NULL','NULL'),(7,'last_login','Letzer login','last login','missing','NULL','NULL','NULL'),(8,'reset_filter','Filter zurücksetzen','reset filter','missing','Durch die Schaltfläche Filter zurücksetzen werden alle Kunden und Anlagen angezeigt','NULL','NULL'),(9,'german','Deutsch','German','missing','NULL','NULL','NULL'),(10,'english','Englisch','English','missing','NULL','NULL','NULL'),(11,'french','Französisch','French','missing','NULL','NULL','NULL'),(12,'password_to_short','Passwort zu kurtz','password to short','missing','NULL','NULL','NULL'),(13,'wrong_password','Passwort passt nicht zur Email','Password doesnt match email','missing','NULL','NULL','NULL'),(14,'wrong_email','Email existiert nicht','Email doesnt exist','missing','NULL','NULL','NULL'),(15,'overview','Übersicht','Overview','missing','NULL','NULL','NULL'),(16,'client_overview','Kunden Übersicht','client overview','missing','NULL','NULL','NULL'),(17,'client_create','Kunde anlegen','create client','missing','NULL','NULL','NULL'),(18,'system_overview','Anlagen Übersicht','system overview','missing','NULL','NULL','NULL'),(19,'system_create','Anlage anlegen','create system','missing','NULL','NULL','NULL'),(20,'client','Kunde','client','missing','NULL','NULL','NULL'),(21,'client_id','Kunden Nr.','client id','missing','NULL','NULL','NULL'),(22,'firstname','Vorname','firstname','missing','NULL','NULL','NULL'),(23,'lastname','Nachname','lastname','missing','NULL','NULL','NULL'),(24,'street','Straße','street','missing','NULL','NULL','NULL'),(25,'postcode','PLZ','postcode','missing','NULL','NULL','NULL'),(26,'town','Stadt','town','missing','NULL','NULL','NULL'),(27,'number','Nummer','number','missing','NULL','NULL','NULL'),(28,'client_search','suchen','search','missing','suche nach Kunde, Kunden Nr, Vorname ...','search for client, client id, firstname ...','missing'),(29,'system_search','suchen','search','missing','suche nach Anlage, Ip, addresse ...','search for system, ip, adresse ...','missing'),(30,'reset_filter','Filter zurücksetzen','reset filter','missing','NULL','NULL','NULL'),(31,'system_id','Anlagen Nr.','system id','missing','NULL','NULL','NULL'),(32,'system_ip','Anlagen Ip','system ip','missing','NULL','NULL','NULL'),(33,'name','Name','name','missing','NULL','NULL','NULL'),(34,'system','Anlage','system','missing','NULL','NULL','NULL'),(35,'password2','Passwort wiederholen','repeat password','missing','NULL','NULL','NULL'),(36,'super_client','Übergeordneter Benutzer','superclient','missing','NULL','NULL','NULL'),(37,'street_number','Straßen Nr.','street number','missing','NULL','NULL','NULL'),(38,'region','Region','region','missing','NULL','NULL','NULL'),(39,'logout_timer','Auslogzeit','logout timer','missing','NULL','NULL','NULL'),(40,'logo','Logo','logo','missing','NULL','NULL','NULL'),(41,'description_intern','Interne Beschreibeung','description(intern)','missing','NULL','NULL','NULL'),(42,'description_extern','Externe Beschreibung','description(extern)','missing','NULL','NULL','NULL'),(43,'create','Anlegen','create','missing','NULL','NULL','NULL'),(44,'change','Ändern','change','missing','NULL','NULL','NULL'),(45,'delete','Löschen','delete','missing','NULL','NULL','NULL'),(46,'delete_confirm','Möchten sie wirklich löschen?','are you sure to delete?','missing','NULL','NULL','NULL'),(47,'change_password','Passwort ändern','change password','missing','NULL','NULL','NULL'),(48,'old_password','Altes Passwort','old password','missing','NULL','NULL','NULL'),(49,'ip_address','Ip Adresse','ip address','missing','NULL','NULL','NULL'),(50,'client_client_id','Übergeordenter Benutzer','superclient','missing','NULL','NULL','NULL'),(51,'status','Status','status','missing','NULL','NULL','NULL'),(52,'on_top_10m','Mit aufsatz 10m','on top 10m','missing','NULL','NULL','NULL'),(53,'washing','Wäscher','washing','missing','NULL','NULL','NULL'),(54,'dryer','Trockner','dryer','missing','NULL','NULL','NULL'),(55,'control','Steuerung','control','missing','NULL','NULL','NULL'),(56,'switch_cabinet','Schaltschrank','switch cabinet','missing','NULL','NULL','NULL'),(57,'display','Display Nr.','display','missing','NULL','NULL','NULL'),(58,'qt','QT','qt','missing','NULL','NULL','NULL'),(59,'image','Images','image','missing','NULL','NULL','NULL'),(60,'link','Link','link','missing','NULL','NULL','NULL'),(61,'password_hash','Passwort','password','missing','NULL','NULL','NULL'),(62,'password_hash2','Passwort wiederholen','repeate password','missing','NULL','NULL','NULL'),(63,'components','Komponenetn','components','missing','NULL','NULL','NULL'),(64,'street_nr','Straßen Nr.','street number','missing','NULL','NULL','NULL'),(65,'captcha','Captcha','captcha','captcha',NULL,NULL,NULL),(66,'de','Deutsch','German','missing',NULL,NULL,NULL),(67,'fr','Französisch','French','missing',NULL,NULL,NULL),(68,'en','Englisch','English','missing',NULL,NULL,NULL),(69,'fergot_password','Passwort vergessen?','fergot password?','missing',NULL,NULL,NULL),(70,'remember_me','Daten merken','remember me','missing',NULL,NULL,NULL),(71,'no_email','Keine Email','missing email','missing',NULL,NULL,NULL),(72,'no_password','Kein Passwort','missing password','missing',NULL,NULL,NULL),(73,'no_captcha_code','Kein Captcha','missing captcha','missing',NULL,NULL,NULL),(74,'wrong_captcha','Captcha stimmt nicht überein','captcher doesnt match','missing',NULL,NULL,NULL),(75,'submit','Absenden','submit','missing',NULL,NULL,NULL),(76,'enter_username','Benutzername Eintragen','enter username','missing',NULL,NULL,NULL),(77,'enter_password','Password Eingeben','enter password','missing',NULL,NULL,NULL),(78,'enter_captcha','Captcha Eingeben','enter captcha','missing',NULL,NULL,NULL),(79,'logout','Ausloggen','logout','missing',NULL,NULL,NULL),(80,'id','id','id','id',NULL,NULL,NULL);
/*!40000 ALTER TABLE `translation` ENABLE KEYS */;
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
