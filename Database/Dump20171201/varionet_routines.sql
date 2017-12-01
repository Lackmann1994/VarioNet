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
-- Dumping events for database 'varionet'
--

--
-- Dumping routines for database 'varionet'
--
/*!50003 DROP FUNCTION IF EXISTS `levenshtein` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `levenshtein`( s1 VARCHAR(255), s2 VARCHAR(255) ) RETURNS int(11)
    DETERMINISTIC
BEGIN
    DECLARE s1_len, s2_len, i, j, c, c_temp, cost INT;
    DECLARE s1_char CHAR;
    -- max strlen=255
    DECLARE cv0, cv1 VARBINARY(256);
    SET s1_len = CHAR_LENGTH(s1), s2_len = CHAR_LENGTH(s2), cv1 = 0x00, j = 1, i = 1, c = 0;
    IF s1 = s2 THEN
      RETURN 0;
    ELSEIF s1_len = 0 THEN
      RETURN s2_len;
    ELSEIF s2_len = 0 THEN
      RETURN s1_len;
    ELSE
      WHILE j <= s2_len DO
        SET cv1 = CONCAT(cv1, UNHEX(HEX(j))), j = j + 1;
      END WHILE;
      WHILE i <= s1_len DO
        SET s1_char = SUBSTRING(s1, i, 1), c = i, cv0 = UNHEX(HEX(i)), j = 1;
        WHILE j <= s2_len DO
          SET c = c + 1;
          IF s1_char = SUBSTRING(s2, j, 1) THEN 
            SET cost = 0; ELSE SET cost = 1;
          END IF;
          SET c_temp = CONV(HEX(SUBSTRING(cv1, j, 1)), 16, 10) + cost;
          IF c > c_temp THEN SET c = c_temp; END IF;
            SET c_temp = CONV(HEX(SUBSTRING(cv1, j+1, 1)), 16, 10) + 1;
            IF c > c_temp THEN 
              SET c = c_temp; 
            END IF;
            SET cv0 = CONCAT(cv0, UNHEX(HEX(c))), j = j + 1;
        END WHILE;
        SET cv1 = cv0, i = i + 1;
      END WHILE;
    END IF;
    RETURN c;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_client` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_client`(_id INT)
BEGIN

	DELETE FROM client WHERE id= _id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_component` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_component`(_id INT)
BEGIN

	DELETE FROM `varionet`.`component`
	WHERE id = _id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_system` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_system`(_id INT)
BEGIN

	DELETE FROM system WHERE id= _id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_client` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_client`(
	_firstname VARCHAR(45),
    _lastname VARCHAR(45),
    _email VARCHAR(45),
    _super_client VARCHAR(45),
    _logo binary,
    _logout_timer INT,
	_street VARCHAR(45), 
    _street_nr INT,
    _postcode INT,
    _town VARCHAR(45),
    _region VARCHAR(45),
    _number INT,
    _description_intern VARCHAR(45),
    _description_extern VARCHAR(45),
    _password_hash VARCHAR(255),
    _lat FLOAT(10,6),
    _lng FLOAT(10,6)
    
)
BEGIN

DECLARE _coordinate POINT;
SET _coordinate = GeomFromText(CONCAT('POINT(',_lat, ' ', _lng,')'));

INSERT INTO address (street, street_nr, postcode, town, region, number, coordinate)
     VALUES (_street, _street_nr, _postcode, _town, _region, _number, _coordinate);
INSERT INTO client (firstname, lastname, password_hash, email, super_client, logo, logout_timer, address_id, description_intern, description_extern)
     VALUES (_firstname, _lastname, _password_hash, _email, _super_client, _logo, _logout_timer, LAST_INSERT_ID(), _description_intern, _description_extern);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_component` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_component`(
_system_id INT,
_type VARCHAR(45),
_name VARCHAR(45),
_number INT
)
BEGIN

INSERT 
	INTO component (system_id, type, name, number) 
	VALUES (_system_id, _type, _name, _number);
      
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_data`(
_data_name2 VARCHAR(45),
_data_section VARCHAR(45),
_data_value JSON,
_client_id INT,
_system_id INT,
_sub_section INT
)
BEGIN

	INSERT INTO `varionet`.`data` (`data_type_id`, `data_value`, `client_id`, `system_id`, `sub_section`)
	SELECT id, _data_value, _client_id, _system_id, _sub_section
	FROM data_type
	WHERE data_name2 = _data_name2
	AND data_section = _data_section
	LIMIT 1;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_system` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_system`(
	_ip_address VARCHAR(45),
	_client_id INT,
    _status INT,
	_on_top_10m INT,
	_washing VARCHAR(45),
	_dryer VARCHAR(45),
	_control VARCHAR(45),
	_switch_cabinet VARCHAR(45),
	_display INT,
	_qt INT,
	_image INT,
	_link VARCHAR(45),
	_street VARCHAR(45), 
    _street_nr INT,
    _postcode INT,
    _town VARCHAR(45),
    _region VARCHAR(45),
    _number INT,
    _description_intern VARCHAR(45),
    _description_extern VARCHAR(45),
	_password_hash VARCHAR(255),
    _lat FLOAT(10,6),
    _lng FLOAT(10,6)
)
BEGIN

DECLARE _coordinate POINT;
SET _coordinate = GeomFromText(CONCAT('POINT(',_lat, ' ', _lng,')'));

INSERT INTO address (street, street_nr, postcode, town, region, number, coordinate)
	VALUES (_street, _street_nr, _postcode, _town, _region, _number, _coordinate);
INSERT INTO system(ip_address, client_id, status, on_top_10m, 
	washing, dryer, control, switch_cabinet, display, qt, image, link, address_id, description_intern, description_extern, password_hash)
	VALUES(INET_ATON(_ip_address), _client_id, _status, _on_top_10m, 
	_washing, _dryer, _control, _switch_cabinet, _display, _qt, _image, _link, LAST_INSERT_ID(), _description_intern, _description_extern, _password_hash);
   

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_array_types` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_array_types`(_data_section VARCHAR(45))
BEGIN

	SELECT 
		data_name,
		data_name2,
		config_group,
		permission,
		data_type,
		data_name_de,
		data_name_en, 
		data_name_fr,
		data_tooltip_de, 
		data_tooltip_en, 
		data_tooltip_fr, 
		data_coefficient, 
		data_min_val, 
		data_max_val, 
		data_unit,
		IFNULL(LENGTH(array_type) - LENGTH(REPLACE(array_type, ':', ''))+1, 0)  as length,
		SUBSTRING_INDEX(SUBSTRING_INDEX(array_type, ':', 1), ':', -1) as array_type_0,
		SUBSTRING_INDEX(SUBSTRING_INDEX(array_type, ':', 2), ':', -1) as array_type_1,
		SUBSTRING_INDEX(SUBSTRING_INDEX(array_type, ':', 3), ':', -1) as array_type_2,
		SUBSTRING_INDEX(SUBSTRING_INDEX(array_type, ':', 4), ':', -1) as array_type_3,
        system_defines_0.define_value as array_length_0,
        system_defines_1.define_value as array_length_1,
        system_defines_2.define_value as array_length_2,
        system_defines_3.define_value as array_length_3
	FROM data_type
    LEFT JOIN system_defines as system_defines_0 ON system_defines_0.define_name = SUBSTRING_INDEX(SUBSTRING_INDEX(array_type, ':', 1), ':', -1)
    LEFT JOIN system_defines as system_defines_1 ON system_defines_1.define_name = SUBSTRING_INDEX(SUBSTRING_INDEX(array_type, ':', 2), ':', -1)
    LEFT JOIN system_defines as system_defines_2 ON system_defines_2.define_name = SUBSTRING_INDEX(SUBSTRING_INDEX(array_type, ':', 3), ':', -1)
    LEFT JOIN system_defines as system_defines_3 ON system_defines_3.define_name = SUBSTRING_INDEX(SUBSTRING_INDEX(array_type, ':', 4), ':', -1)
	WHERE data_section = _data_section
    AND config_group IS NOT NULL;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_branch` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_branch`(branchroot INT)
BEGIN
	/* some comment
     *
     */
	SELECT c2.id, c2.super_client, CONCAT_WS(" ", c2.firstname, c2.lastname) AS `name` FROM
	client c, client c2, client_path p, client_path p2
	WHERE c.id = branchroot AND
		p2.client_id = c.id AND
		p.path LIKE(CONCAT(p2.path,'%')) AND
		c2.id = p.client_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_branch_filtered` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_branch_filtered`(
	branchroot INT,
	filter VARCHAR(45),
	filter_range INT,
	client_id_on VARCHAR(2),
	firstname_on VARCHAR(2),
	lastname_on VARCHAR(2),
	street_on VARCHAR(2),
	postcode_on VARCHAR(2),
	town_on VARCHAR(2),
	number_on VARCHAR(2)
)
BEGIN
	
    SELECT branch.id 
    FROM(
		SELECT c2.* 
        FROM client c, client c2, client_path p, client_path p2
		WHERE c.id = branchroot 
        AND	p2.client_id = c.id 
        AND	p.path LIKE(CONCAT(p2.path,'%')) 
		AND c2.id = p.client_id) AS branch
	LEFT JOIN address ON branch.address_id = address.id 
	WHERE client_id_on = 'on' AND levenshtein(filter, branch.id) between 0 and filter_range
	OR firstname_on = 'on' AND levenshtein(filter, firstname) between 0 and filter_range
	OR lastname_on= 'on' AND levenshtein(filter, lastname) between 0 and filter_range
	OR street_on = 'on' AND levenshtein(filter, street) between 0 and filter_range
	OR postcode_on = 'on' AND levenshtein(filter, postcode) between 0 and filter_range
	OR town_on = 'on' AND levenshtein(filter, town) between 0 and filter_range
	OR number_on = 'on' AND levenshtein(filter, number) between 0 and filter_range;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_branch_till` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_branch_till`(branchroot INT, till INT)
BEGIN

	SELECT client.id as id, super_client, path, CONCAT_WS(" ", firstname, lastname) AS `name`
	FROM client
	LEFT JOIN client_path ON client.id = client_id
	WHERE path like(CONCAT((
		SELECT path 
		FROM client
		LEFT JOIN client_path ON client.id = client_id
		WHERE client.id = branchroot), '%'))
	AND NOT path like(CONCAT((
		SELECT path 
		FROM client
		LEFT JOIN client_path ON client.id = client_id
		WHERE client.id = till), '%'));

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_client` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_client`(
_id INT
)
BEGIN
/*

*/
	SELECT
		client.id,
        firstname,
        lastname,
        email,
        super_client,
        logo,
        logout_timer,
        last_login,
        
        street,
        street_nr,
        postcode,
        town,
        region,
        number,
        X(coordinate) AS latitude,
        Y(coordinate) AS longitude,
        
        description_intern,
        description_extern
    FROM client
    LEFT JOIN address ON address_id = address.id
    WHERE client.id = _id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_client_inputs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_client_inputs`()
BEGIN

SELECT *
FROM(
	SELECT COLUMN_NAME, COLUMN_COMMENT, COLUMN_DEFAULT
	FROM `information_schema`.`columns` 
	WHERE `table_schema` = 'varionet' 
    AND `table_name` in ('address','client')
    ORDER BY COLUMN_COMMENT ASC) as a
WHERE LENGTH(COLUMN_COMMENT) > 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_components` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_components`(_id INT)
BEGIN

SELECT *
FROM component
WHERE system_id = _id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_component_inputs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_component_inputs`()
BEGIN

SELECT * 
FROM(
	SELECT COLUMN_NAME, COLUMN_COMMENT, COLUMN_DEFAULT
	FROM `information_schema`.`columns` 
	WHERE `table_schema` = 'varionet' 
    AND `table_name` in ('component')
    ORDER BY COLUMN_COMMENT ASC) as a
WHERE LENGTH(COLUMN_COMMENT) > 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_data`(
	_client_id INT,
    _system_id INT,
    _sub_section INT,
    _data_name2 VARCHAR(45),
    _data_section VARCHAR(45),
    _time_from TIMESTAMP,
    _time_to TIMESTAMP
)
BEGIN
	
    IF _time_from is NULL
		THEN SET _time_from = '2000-01-01 00:00:00';
    END IF;
    
	IF _time_to is NULL
		THEN SET _time_to = NOW();
    END IF;

	SELECT
		data_value, 
        timestamp,
		IFNULL(LENGTH(array_type) - LENGTH(REPLACE(array_type, ':', ''))+1, 0)  as length,
		SUBSTRING_INDEX(SUBSTRING_INDEX(array_type, ':', 1), ':', -1) as array_type_0,
		SUBSTRING_INDEX(SUBSTRING_INDEX(array_type, ':', 2), ':', -1) as array_type_1,
		SUBSTRING_INDEX(SUBSTRING_INDEX(array_type, ':', 3), ':', -1) as array_type_2,
		SUBSTRING_INDEX(SUBSTRING_INDEX(array_type, ':', 4), ':', -1) as array_type_3,
        system_defines_0.define_value as array_length_0,
        system_defines_1.define_value as array_length_1,
        system_defines_2.define_value as array_length_2,
        system_defines_3.define_value as array_length_3
	FROM data
	LEFT JOIN data_type ON data.data_type_id = data_type.id
    LEFT JOIN system_defines as system_defines_0 ON system_defines_0.define_name = SUBSTRING_INDEX(SUBSTRING_INDEX(array_type, ':', 1), ':', -1)
    LEFT JOIN system_defines as system_defines_1 ON system_defines_1.define_name = SUBSTRING_INDEX(SUBSTRING_INDEX(array_type, ':', 2), ':', -1)
    LEFT JOIN system_defines as system_defines_2 ON system_defines_2.define_name = SUBSTRING_INDEX(SUBSTRING_INDEX(array_type, ':', 3), ':', -1)
    LEFT JOIN system_defines as system_defines_3 ON system_defines_3.define_name = SUBSTRING_INDEX(SUBSTRING_INDEX(array_type, ':', 4), ':', -1)
	WHERE client_id = _client_id
	AND data.system_id = _system_id
	AND (sub_section = _sub_section OR sub_section IS NULL)
	AND data_name2 = _data_name2
	AND data_section = _data_section
	AND timestamp BETWEEN _time_from AND _time_to;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_default_language` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_default_language`(_id INT)
BEGIN

SELECT `client`.`default_language`
FROM `varionet`.`client`
WHERE `client`.`id` = _id;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_for_section_tree` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_for_section_tree`(_system_id INT)
BEGIN

	SELECT type, permission, number
	FROM section
	WHERE system_id = _system_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_id_ip_address_coordinate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_id_ip_address_coordinate`(id INT)
BEGIN

	SELECT
		system.id,
		INET_NTOA(ip_address) AS ip_address,
        X(coordinate) AS latitude,
        Y(coordinate) AS longitude
    FROM system
    LEFT JOIN address ON address_id = address.id
    WHERE client_id = id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_name_coordinate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_name_coordinate`(
_id INT
)
BEGIN

	SELECT 
		client.id, 
		CONCAT_WS(" ", `firstname`, `lastname`) AS `name`,
		ST_X(coordinate) AS latitude,
        ST_Y(coordinate) AS longitude
    FROM `client`
    LEFT JOIN address ON address_id = address.id 
    WHERE client.id = _id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_password_hash_client` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_password_hash_client`(_id INT)
BEGIN

	SELECT password_hash
	From client
	WHERE id = _id;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_password_hash_system` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_password_hash_system`(_id INT)
BEGIN

	SELECT password_hash
	From system
	WHERE id = _id;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_subcliets` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_subcliets`(branchroot INT)
BEGIN
	SELECT id
    FROM client 
    WHERE super_client = branchroot;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_system` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_system`(
_id INT
)
BEGIN
	SELECT
		INET_NTOA(ip_address) AS ip_address,
        client_id,
        status,
        on_top_10m,
        washing,
        dryer,
        
        control,
        switch_cabinet,
        display,
        qt,
        image,
        link,
        
        street,
        street_nr,
        postcode,
        town,
        region,
        number,
        
        description_intern,
        description_extern
    FROM system
    LEFT JOIN address ON address_id = address.id
    WHERE system.id = _id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_system_inputs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_system_inputs`()
BEGIN

SELECT * 
FROM(
	SELECT COLUMN_NAME, COLUMN_COMMENT, COLUMN_DEFAULT
	FROM `information_schema`.`columns` 
	WHERE `table_schema` = 'varionet' 
    AND `table_name` in ('system', 'address')
    ORDER BY COLUMN_COMMENT ASC) as a
WHERE LENGTH(COLUMN_COMMENT) > 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `select_system_of_client` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_system_of_client`(
_id INT
)
BEGIN
	SELECT
		system.id,
		INET_NTOA(ip_address) AS ip_address,
        client_id,
        status,
        on_top_10m,
        washing,
        dryer,
        
        control,
        switch_cabinet,
        display,
        qt,
        image,
        link,
        
        street,
        street_nr,
        postcode,
        town,
        region,
        number,
        X(coordinate) AS latitude,
        Y(coordinate) AS longitude,
        
        description_intern,
        description_extern
    FROM system
    LEFT JOIN address ON address_id = address.id
    WHERE system.client_id = _id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_client` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_client`(
	_id INT,
    
	_firstname VARCHAR(45),
	_lastname VARCHAR(45),
	_email VARCHAR(45),
	_super_client INT,
	_logo blob,
	_logout_timer INT,
    
	_street VARCHAR(45),
	_street_nr INT,
	_postcode INT,
	_town VARCHAR(45),
	_region VARCHAR(45),
	_number INT,
    
	_description_intern VARCHAR(45),
	_description_extern VARCHAR(45),
    
    _lat FLOAT(10,6),
    _lng FLOAT(10,6)
)
BEGIN

DECLARE _coordinate POINT;
SET _coordinate = GeomFromText(CONCAT('POINT(',_lat, ' ', _lng,')'));

      UPDATE client
      LEFT JOIN address ON address_id = address.id  
      SET firstname = _firstname,
          lastname = _lastname,
          email = _email,
          super_client = _super_client,
          logo = _logo,
          logout_timer = _logout_timer,
          description_intern = _description_intern,
          description_extern = _description_extern,
          street = _street,
          street_nr= _street_nr,
          postcode = _postcode,
          region = _region,
          town = _town,
          number = _number,
          coordinate = _coordinate
      WHERE client.id = _id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_default_language` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_default_language`(_client_id INT, _default_language VARCHAR(2))
BEGIN

	UPDATE `varionet`.`client`
	SET `default_language` = _default_language
	WHERE `id` = _id;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_last_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_last_login`(id INT)
BEGIN

	UPDATE `varionet`.`client` SET `last_login`=now() WHERE `id`=id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_password_hash_client` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_password_hash_client`(
	_password_hash VARCHAR(255),
    _id INT
    )
BEGIN

	UPDATE client
	SET password_hash = _password_hash
	WHERE id= _id;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_password_hash_system` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_password_hash_system`(
	_password_hash VARCHAR(255),
    _id INT
    )
BEGIN

	UPDATE system
	SET password_hash = _password_hash
	WHERE id= _id;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_system` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_system`(
	_id INT,
    
	_ip_address VARCHAR(45),
	_client_id INT,
    _status INT,
	_on_top_10m VARCHAR(45),
    _washing VARCHAR(45),
	_dryer VARCHAR(45),
    
	_control VARCHAR(45),
	_switch_cabinet VARCHAR(45),
	_display VARCHAR(45),
	_qt VARCHAR(45),
	_image VARCHAR(45),
	_link VARCHAR(45),
    
	_street VARCHAR(45),
	_street_nr INT,
	_postcode INT,
	_town VARCHAR(45),
	_region VARCHAR(45),
    _number INT,
    
	_description_intern VARCHAR(45),
	_description_extern VARCHAR(45),
    _lat FLOAT(10,6),
    _lng FLOAT(10,6)
)
BEGIN

DECLARE _coordinate POINT;
SET _coordinate = GeomFromText(CONCAT('POINT(',_lat, ' ', _lng,')'));

      UPDATE system
      LEFT JOIN address ON address_id = address.id  
      SET ip_address = INET_ATON(_ip_address),
		  client_id =_client_id,
		  on_top_10m = _on_top_10m,
          washing = _washing,
		  dryer = _dryer,
		  control = _control,
		  switch_cabinet = _switch_cabinet,
		  display = _display,
		  qt = _qt,
	      image = _image,
		  link = _link,
          description_intern = _description_intern,
          description_extern = _description_extern,
          street = _street,
          street_nr = _street_nr,
          postcode = _postcode,
          region = _region,
          town = _town,
          number = _number,
          coordinate = _coordinate
      WHERE system.id = _id;

END ;;
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

-- Dump completed on 2017-12-01 11:25:55
