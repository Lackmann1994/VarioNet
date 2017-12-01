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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `street` varchar(45) NOT NULL COMMENT 'pos=101,  input type="text", required, geocode, html=\n<label for="field">%1$s:</label>\n<br>\n<input class="geocode" type="text" name="%2$s" value="%3$s" required/>\n<br>\n\n',
  `street_nr` int(11) unsigned NOT NULL COMMENT 'pos=102, input type="number", required, geocode html=\n<label for="field">%1$s:</label>\n<br>\n<input class="geocode" type="number" name="%2$s" value="%3$s" required/>\n<br>\n',
  `postcode` int(11) unsigned NOT NULL COMMENT 'pos=103, input type="number", required, geocode html=\n<label for="field">%1$s:</label>\n<br>\n<input class="geocode" type="number" name="%2$s" value="%3$s" required/>\n<br>\n',
  `town` varchar(45) NOT NULL COMMENT 'pos=104, input type="text", required html=\n<label for="field">%1$s:</label>\n<br>\n<input type="text" name="%2$s" value="%3$s" required/>\n<br>\n',
  `region` varchar(45) NOT NULL COMMENT 'pos=105, input type="text", required html=\n<label for="field">%1$s:</label>\n<br>\n<input type="text" name="%2$s" value="%3$s" required/>\n<br>\n',
  `number` int(11) unsigned DEFAULT NULL COMMENT 'pos=106, input type="number",  break, html=\n<label for="field">%1$s:</label>\n<br>\n<input type="number" name="%2$s" value="%3$s" required/>\n<br>\n',
  `coordinate` point DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'musterstreet1',1,11111,'mustertowern1','musterregion1',11111,NULL),(2,'musterstreet2',2,22222,'mustertowern2','musterregion2',22222,NULL),(3,'musterstreet1',1,11111,'mustertowern1','musterregion1',33333,NULL),(4,'musterstreet1',1,11111,'mustertowern1','musterregion1',44444,NULL),(5,'musterstreet5',5,55555,'mustertowern5','musterregion5',55555,NULL),(6,'musterstreet6',6,66666,'mustertowern6','musterregion6',66666,NULL),(7,'Hochreiterstra√üe',1,84329,'1','1',1,'\0\0\0\0\0\0\0¿v0bü.H@°\€K\Z£Ö)@'),(8,'1234',1,11,'1','11',1,'\0\0\0\0\0\0\0NÚ#~\≈ÚB@\⁄\Â[\÷`@'),(9,'1234',1,1,'1','1',1,'\0\0\0\0\0\0\0\Z•Kˇí<F@ıúÙæÒMR¿'),(10,'Hochreiterstra√üe',1,1,'1','1',1,'\0\0\0\0\0\0\0\“\ﬂK\·A\…G@å1∞é\„ˇ.@'),(11,'Hochreiterstra√üe',1,1,'1','1',1,'\0\0\0\0\0\0\0\“\ﬂK\·A\…G@å1∞é\„ˇ.@'),(12,'11',1,1,'1','1',1,'\0\0\0\0\0\0\0\Ó\'c|ò7D@ú5x_ïãR¿'),(13,'11',1,1,'1','1',1,'\0\0\0\0\0\0\0\Ó\'c|ò7D@ú5x_ïãR¿'),(14,'11',1,1,'1','1',1,'\0\0\0\0\0\0\0\Ó\'c|ò7D@ú5x_ïãR¿'),(15,'Hochreiterstra√üe',1,1,'1','1',1,'\0\0\0\0\0\0\0\“\ﬂK\·A\…G@å1∞é\„ˇ.@'),(16,'0',0,0,'0','0',0,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(17,'0',0,0,'0','0',0,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(18,'0',0,0,'0','0',0,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(19,'0',0,0,'0','0',0,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(20,'Hochreiterstra√üe',1,1,'1','1',1,'\0\0\0\0\0\0\0\“\ﬂK\·A\…G@å1∞é\„ˇ.@'),(21,'Hochreiterstra√üe',1,84329,'1','1',1,'\0\0\0\0\0\0\0¿v0bü.H@°\€K\Z£Ö)@'),(22,'Hochreiterstra√üe',1,84329,'1','1',1,'\0\0\0\0\0\0\0¿v0bü.H@°\€K\Z£Ö)@'),(23,'sch√∂nhammer',1,1,'1','1',1,'\0\0\0\0\0\0\0ˇñ\0¸S\\H@.´∞\‡\ (@'),(24,'musterstreet1',1,111111,'1','1',11111111,'\0\0\0\0\0\0\0ˇñ\0¸S\\H@.´∞\‡\ (@'),(25,'musterstreet2',2,22222,'mustertowern2','musterregion2',22222222,'\0\0\0\0\0\0\0ùõ6\„4\\H@éì¬º\«\·(@'),(26,'musterstreet1',1,11111,'1','musterregion1',11111111,NULL),(27,'musterstreet3',3,88888,'mustertowern3','musterregion3',3333,'\0\0\0\0\0\0\0Ûu˛\”=B@I⁄ç>\ÊëW¿'),(28,'musterstreet2',2,22222,'mustertowern2','musterregion2',22222,'\0\0\0\0\0\0\0êMÚ#~∑D@\‚<ú¿t˛Q¿'),(29,'1',11,1,'1','1',1,'\0\0\0\0\0\0\0¿v0bü.H@°\€K\Z£Ö)@'),(30,'1',1,1,'1','1',1,NULL),(31,'1',1,1,'1','1',1,NULL),(32,'1',1,1,'1','1',1,NULL),(33,'1',1,1,'1','1',1,'\0\0\0\0\0\0\0áäq˛&Ü@@’≤µæHAX¿'),(34,'1',1,1,'1','1',1,'\0\0\0\0\0\0\0áäq˛&Ü@@’≤µæHAX¿'),(35,'1',1,2,'1','1',1,'\0\0\0\0\0\0\0áäq˛&Ü@@’≤µæHAX¿'),(36,'musterstreet3',3,33333,'mustertowern3','musterregion3',333333,'\0\0\0\0\0\0\0Ûu˛\”=B@I⁄ç>\ÊëW¿'),(37,'Lurzenhoff',1,84034,'Landshut','Bayern',1111111,'\0\0\0\0\0\0\0\\X7\ﬁGH@1\”ˆØ¨d(@'),(38,'Lurzenhof',1,84034,'Landshut','Bayern',11111,'\0\0\0\0\0\0\0\\X7\ﬁGH@1\”ˆØ¨d(@'),(39,'text',1,1111,'111','111',1111,'\0\0\0\0\0\0\0\Èô^b,GH@\«\⁄\ﬂ\Ÿe(@'),(40,'Hochreiterstra√üe',1,1,'1','1',1111,'\0\0\0\0\0\0\0≥}\»[ÆÜ)@\◊\ﬂÄ.H@'),(41,'Hochreiterstra√üe',1,84329,'1','1',1,NULL),(42,'Hochreiterstra√üe',1,84329,'1','1',1,'\0\0\0\0\0\0\0¿v0bü.H@°\€K\Z£Ö)@');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
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
