-- MySQL dump 10.16  Distrib 10.1.16-MariaDB, for osx10.6 (i386)
--
-- Host: localhost    Database: oophp
-- ------------------------------------------------------
-- Server version	10.1.16-MariaDB

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
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Account` (
  `id` char(4) NOT NULL,
  `name` varchar(8) DEFAULT NULL,
  `balance` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES ('1111','Adam',10.00),('2222','Eva',7.00);
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cart`
--

DROP TABLE IF EXISTS `Cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer` (`customer`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`customer`) REFERENCES `Customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cart`
--

LOCK TABLES `Cart` WRITE;
/*!40000 ALTER TABLE `Cart` DISABLE KEYS */;
INSERT INTO `Cart` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `Cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CartRow`
--

DROP TABLE IF EXISTS `CartRow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CartRow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart` int(11) DEFAULT NULL,
  `product` int(11) DEFAULT NULL,
  `items` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart` (`cart`),
  KEY `product` (`product`),
  CONSTRAINT `cartrow_ibfk_1` FOREIGN KEY (`cart`) REFERENCES `Cart` (`id`),
  CONSTRAINT `cartrow_ibfk_2` FOREIGN KEY (`product`) REFERENCES `Product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CartRow`
--

LOCK TABLES `CartRow` WRITE;
/*!40000 ALTER TABLE `CartRow` DISABLE KEYS */;
INSERT INTO `CartRow` VALUES (1,1,3,2),(2,1,4,2),(3,2,1,1),(4,2,2,1),(5,2,3,1),(6,2,4,96);
/*!40000 ALTER TABLE `CartRow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Course`
--

DROP TABLE IF EXISTS `Course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Course` (
  `code` char(6) NOT NULL,
  `nick` char(12) DEFAULT NULL,
  `points` decimal(3,1) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `nick_unique` (`nick`),
  KEY `index_name` (`name`),
  KEY `index_points` (`points`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Course`
--

LOCK TABLES `Course` WRITE;
/*!40000 ALTER TABLE `Course` DISABLE KEYS */;
INSERT INTO `Course` VALUES ('DV1506','webgl',7.5,'Spelteknik för webben'),('DV1531','python',7.5,'Programmering och Problemlösning med Python'),('DV1546','webapp',7.5,'Webbapplikationer för mobila enheter'),('DV1547','linux',7.5,'Programmera webbtjänster i Linux'),('DV1561','javascript',7.5,'Programmering med JavaScript'),('PA1436','design',7.5,'Teknisk webbdesign och användbarhet'),('PA1437','oopython',7.5,'Objektorienterad design och programmering med Python'),('PA1439','htmlphp',7.5,'Webbteknologier'),('PA1444','dbjs',10.0,'Webbprogrammering och databaser');
/*!40000 ALTER TABLE `Course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'Mumin','Trollet'),(2,'Mamma','Mumin'),(3,'Pappa','Mumin');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InvenShelf`
--

DROP TABLE IF EXISTS `InvenShelf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InvenShelf` (
  `shelf` char(6) NOT NULL,
  `description` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`shelf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InvenShelf`
--

LOCK TABLES `InvenShelf` WRITE;
/*!40000 ALTER TABLE `InvenShelf` DISABLE KEYS */;
INSERT INTO `InvenShelf` VALUES ('AAA101','House A, aisle A, part A, shelf 101'),('AAA102','House A, aisle A, part A, shelf 102');
/*!40000 ALTER TABLE `InvenShelf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inventory`
--

DROP TABLE IF EXISTS `Inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_id` int(11) DEFAULT NULL,
  `shelf_id` char(6) DEFAULT NULL,
  `items` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prod_id` (`prod_id`),
  KEY `shelf_id` (`shelf_id`),
  KEY `index_items` (`items`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`prod_id`) REFERENCES `Product` (`id`),
  CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`shelf_id`) REFERENCES `InvenShelf` (`shelf`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inventory`
--

LOCK TABLES `Inventory` WRITE;
/*!40000 ALTER TABLE `Inventory` DISABLE KEYS */;
INSERT INTO `Inventory` VALUES (6,1,'AAA101',99),(7,2,'AAA102',99),(8,3,'AAA101',99),(9,4,'AAA102',4),(10,5,'AAA102',100);
/*!40000 ALTER TABLE `Inventory` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER LogInventoryUpdate
AFTER UPDATE
ON Inventory
	FOR EACH ROW
BEGIN
	IF NEW.items < 5 THEN
		INSERT INTO InventoryLog (`what`, `prod_id`, `old_amount`, `new_amount`)
        VALUES ("trigger", NEW.prod_id, OLD.items, NEW.items);
END IF;
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `InventoryLog`
--

DROP TABLE IF EXISTS `InventoryLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InventoryLog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `what` varchar(20) DEFAULT NULL,
  `when` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `prod_id` int(11) DEFAULT NULL,
  `old_amount` decimal(10,0) DEFAULT NULL,
  `new_amount` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InventoryLog`
--

LOCK TABLES `InventoryLog` WRITE;
/*!40000 ALTER TABLE `InventoryLog` DISABLE KEYS */;
INSERT INTO `InventoryLog` VALUES (1,'trigger','2017-06-12 13:57:49',4,100,4);
/*!40000 ALTER TABLE `InventoryLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoice`
--

DROP TABLE IF EXISTS `Invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` int(11) DEFAULT NULL,
  `customer` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `order` (`order`),
  KEY `customer` (`customer`),
  CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`order`) REFERENCES `Order` (`id`),
  CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`customer`) REFERENCES `Customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoice`
--

LOCK TABLES `Invoice` WRITE;
/*!40000 ALTER TABLE `Invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `Invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InvoiceRow`
--

DROP TABLE IF EXISTS `InvoiceRow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InvoiceRow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice` int(11) DEFAULT NULL,
  `product` int(11) DEFAULT NULL,
  `items` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice` (`invoice`),
  KEY `product` (`product`),
  CONSTRAINT `invoicerow_ibfk_1` FOREIGN KEY (`invoice`) REFERENCES `Invoice` (`id`),
  CONSTRAINT `invoicerow_ibfk_2` FOREIGN KEY (`product`) REFERENCES `Product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InvoiceRow`
--

LOCK TABLES `InvoiceRow` WRITE;
/*!40000 ALTER TABLE `InvoiceRow` DISABLE KEYS */;
/*!40000 ALTER TABLE `InvoiceRow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  `deleted` datetime DEFAULT NULL,
  `delivery` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer` (`customer`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`customer`) REFERENCES `Customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order`
--

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;
INSERT INTO `Order` VALUES (1,2,'2017-06-12 13:57:49',NULL,NULL,NULL);
/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderRow`
--

DROP TABLE IF EXISTS `OrderRow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderRow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order` int(11) DEFAULT NULL,
  `product` int(11) DEFAULT NULL,
  `items` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order` (`order`),
  KEY `product` (`product`),
  CONSTRAINT `orderrow_ibfk_1` FOREIGN KEY (`order`) REFERENCES `Order` (`id`),
  CONSTRAINT `orderrow_ibfk_2` FOREIGN KEY (`product`) REFERENCES `Product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderRow`
--

LOCK TABLES `OrderRow` WRITE;
/*!40000 ALTER TABLE `OrderRow` DISABLE KEYS */;
INSERT INTO `OrderRow` VALUES (1,1,1,1),(2,1,2,1),(3,1,3,1),(4,1,4,96);
/*!40000 ALTER TABLE `OrderRow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prod2Cat`
--

DROP TABLE IF EXISTS `Prod2Cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prod2Cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_id` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prod_id` (`prod_id`),
  KEY `cat_id` (`cat_id`),
  CONSTRAINT `prod2cat_ibfk_1` FOREIGN KEY (`prod_id`) REFERENCES `Product` (`id`),
  CONSTRAINT `prod2cat_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `ProdCategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prod2Cat`
--

LOCK TABLES `Prod2Cat` WRITE;
/*!40000 ALTER TABLE `Prod2Cat` DISABLE KEYS */;
INSERT INTO `Prod2Cat` VALUES (1,1,1),(2,1,2),(3,3,1),(4,3,2),(5,2,4),(6,2,1),(7,4,4),(8,4,1),(9,5,1),(10,5,2);
/*!40000 ALTER TABLE `Prod2Cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProdCategory`
--

DROP TABLE IF EXISTS `ProdCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProdCategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProdCategory`
--

LOCK TABLES `ProdCategory` WRITE;
/*!40000 ALTER TABLE `ProdCategory` DISABLE KEYS */;
INSERT INTO `ProdCategory` VALUES (1,'kitchen'),(2,'utensils'),(3,'plates'),(4,'egg-cups');
/*!40000 ALTER TABLE `ProdCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(20) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,'Blender',90,'blender.jpg'),(2,'Egg Cup 1',90,'egg-cup-1.jpg'),(3,'Cheese Slicer',90,'cheese-slicer.jpg'),(4,'Egg Cup 2',90,'egg-cup-2.jpg'),(5,'Kitchen Utensils',400,'utensils-kitchen.jpg');
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` char(120) COLLATE utf8_swedish_ci DEFAULT NULL,
  `slug` char(120) COLLATE utf8_swedish_ci DEFAULT NULL,
  `title` varchar(120) COLLATE utf8_swedish_ci DEFAULT NULL,
  `data` text COLLATE utf8_swedish_ci,
  `type` char(20) COLLATE utf8_swedish_ci DEFAULT NULL,
  `filter` varchar(80) COLLATE utf8_swedish_ci DEFAULT NULL,
  `published` datetime DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`),
  UNIQUE KEY `slug` (`slug`),
  KEY `index_title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,'hem',NULL,'Hem','Detta är min hemsida. Den är skriven i [url=http://en.wikipedia.org/wiki/BBCode]bbcode[/url] vilket innebär att man kan formattera texten till [b]bold[/b] och [i]kursiv stil[/i] samt hantera länkar.\n\nDessutom finns ett filter \'nl2br\' som lägger in <br>-element istället för \\n, det är smidigt, man kan skriva texten precis som man tänker sig att den skall visas, med radbrytningar.','page','bbcode,nl2br','2017-05-26 00:00:00','2017-05-26 08:26:58',NULL,NULL),(2,'om',NULL,'Om','Detta är en sida om mig och min webbplats. Den är skriven i [Markdown](http://en.wikipedia.org/wiki/Markdown). Markdown innebär att du får bra kontroll över innehållet i din sida, du kan formattera och sätta rubriker, men du behöver inte bry dig om HTML.\n\nRubrik nivå 2\n-------------\n\nDu skriver enkla styrtecken för att formattera texten som **fetstil** och *kursiv*. Det finns ett speciellt sätt att länka, skapa tabeller och så vidare.\n\n###Rubrik nivå 3\n\nNär man skriver i markdown så blir det läsbart även som textfil och det är lite av tanken med markdown.','page','markdown','2017-05-26 00:00:00','2017-05-26 08:26:58','2017-05-26 00:00:00',NULL),(3,'blogpost-1','valkommen-till-min-blogg','Välkommen till min blogg!','Detta är en bloggpost.\r\n\r\nNär det finns länkar till andra webbplatser så kommer de länkarna att bli klickbara.\r\n\r\nhttp://dbwebb.se är ett exempel på en länk som blir klickbar.','post','clickable,nl2br','2017-05-26 00:00:00','2017-05-26 08:26:58',NULL,NULL),(4,'blogpost-2','nu-har-sommaren-kommit','Nu har sommaren kommit','Detta är en bloggpost som berättar att sommaren har kommit, ett budskap som kräver en bloggpost.','post','nl2br','2017-05-26 00:00:00','2017-05-26 08:26:58',NULL,NULL),(5,'blogpost-3','nu-har-hosten-kommit','Nu har hösten kommit','Detta är en bloggpost som berättar att sommaren har kommit, ett budskap som kräver en bloggpost','post','nl2br','2017-05-26 00:00:00','2017-05-26 08:26:58',NULL,NULL),(6,'dddf','testsida','Testsida','','','','0000-00-00 00:00:00','2017-05-26 10:08:43',NULL,NULL),(7,'dsdfdsf','hej','test','asdf','','','0000-00-00 00:00:00','2017-05-26 10:11:24',NULL,'2017-05-26 14:21:43'),(8,'ddd','test','test','','','','0000-00-00 00:00:00','2017-05-26 10:15:53',NULL,'2017-05-26 14:20:08'),(9,'d','d','tree','','d','','0000-00-00 00:00:00','2017-05-26 10:28:04',NULL,'2017-06-03 13:34:21'),(10,'asdfg','nu-har-sommaren-kommitt','Nu har sommaren kommitt','','','','0000-00-00 00:00:00','2017-05-26 18:07:47',NULL,NULL),(11,'hejasd','hejasd','hejasdf','','','','0000-00-00 00:00:00','2017-05-26 18:35:37',NULL,'2017-05-27 12:44:06'),(12,'sidebar','sidebar','Sidebar','En lista\r\n-------\r\n*   Listobjekt 1\r\n*   Listobjekt 2\r\n*   Listobjekt 3','block','markdown','2017-05-27 00:00:00','2017-05-27 02:44:42',NULL,NULL),(13,'hhh','hhh','hhh','','','','0000-00-00 00:00:00','2017-05-27 03:03:07',NULL,'2017-05-27 12:44:01'),(14,NULL,NULL,'h',NULL,NULL,NULL,NULL,'2017-06-03 11:14:18',NULL,NULL),(15,NULL,NULL,'e',NULL,NULL,NULL,NULL,'2017-06-03 11:24:34',NULL,NULL),(16,NULL,NULL,'3',NULL,NULL,NULL,NULL,'2017-06-03 11:26:10',NULL,NULL),(17,NULL,NULL,'ggg',NULL,NULL,NULL,NULL,'2017-06-03 11:34:56',NULL,NULL),(18,NULL,NULL,'sdf',NULL,NULL,NULL,NULL,'2017-06-03 11:35:13',NULL,NULL),(19,NULL,NULL,'3',NULL,NULL,NULL,NULL,'2017-06-03 11:36:41',NULL,NULL),(20,NULL,NULL,'dd',NULL,NULL,NULL,NULL,'2017-06-03 11:38:22',NULL,NULL);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `gravatar` varchar(100) DEFAULT NULL,
  `role` varchar(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2y$10$YDf2FG3riX9TytT.lKNXJu142M3l0oaZu1oO.A7MMZ1VAS74YIqtS','http://s.gravatar.com/avatar/63a61804b34024a097b950820e0dc955?s=80','1'),(2,'doe','$2y$10$FHCgtuatoNeMfXsv7mXhh.bF1aFbM8p/KrpKRvY3shB0U1oI04KIu','doe','0'),(3,'bin','$2y$10$T/i0cY.UV/xQS0q/l4bEoeB4REHjvrDjfppAPQL8k5Pupvhfa.CXC','bin','1'),(4,'sixten','$2y$10$oiwXFthCJcp/aATV20gUPepW6n5ppyiCtQxliTqRu4tqtlcs71ak.',NULL,'0'),(5,'G','$2y$10$NAEGMBTCrMAnjch4zfSrLuP7wzf2Wa91JNYqxnLeB3jVaW5viHZ66','G','0'),(6,'g','$2y$10$vPRBhkxrSojH2J5qKouWt.xbgPZjJByqpgRyo6AFls0BSbcshyLC6','g','0'),(7,'d','$2y$10$V3YNAT.o3K5HGDqcJG2TPed5omU84CI9tfg0LYnj3jWGwR9/ozbiq',NULL,'0'),(8,'ff','$2y$10$d3J60lMKAqKWEmZEf9QHlOV8y8ZNJ1EoycHmsCtHb0qS26O9jxQUe','ff','0'),(9,'f','$2y$10$kFwb0g5hmOkmAUvWwXHROusDnP1YrX8exIgFwfOu70i5FmSlEIS4C','f','0'),(10,'s','$2y$10$bTzxfkJqB4CR41/Uc9k83eZW9YXBlsWT55ydH7/y5jqBDemFPjIyS','','0'),(11,'r','$2y$10$fF7JICH1EYIrqkRQsFiY3Orgvtx6GgttD6XZppPoelmswi88WXoTm','','0'),(12,'t','$2y$10$ZWj0/lwSViGFxwRCRw3Kre10964GjSfQUpDwgCdrsOR4kOoUIsHsS','','0'),(13,'hh','$2y$10$pcw8dRXC0HfuB25vBqEGs.45/PW9lUG6GRGYCqVFfzBwiG5GYvvp.','','0'),(14,'jens','$2y$10$DlzjeGuNhed2cyfdfclJSOFEhjICvGnE4bHd.K0koTZvKuQabBaJi',NULL,'0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vcartdetails`
--

DROP TABLE IF EXISTS `vcartdetails`;
/*!50001 DROP VIEW IF EXISTS `vcartdetails`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vcartdetails` (
  `CartNumber` tinyint NOT NULL,
  `CartRow` tinyint NOT NULL,
  `Description` tinyint NOT NULL,
  `Items` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vinventory`
--

DROP TABLE IF EXISTS `vinventory`;
/*!50001 DROP VIEW IF EXISTS `vinventory`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vinventory` (
  `shelf` tinyint NOT NULL,
  `location` tinyint NOT NULL,
  `items` tinyint NOT NULL,
  `description` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vinventorylog`
--

DROP TABLE IF EXISTS `vinventorylog`;
/*!50001 DROP VIEW IF EXISTS `vinventorylog`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vinventorylog` (
  `description` tinyint NOT NULL,
  `prod_id` tinyint NOT NULL,
  `when` tinyint NOT NULL,
  `old_amount` tinyint NOT NULL,
  `new_amount` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vorderdetails`
--

DROP TABLE IF EXISTS `vorderdetails`;
/*!50001 DROP VIEW IF EXISTS `vorderdetails`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vorderdetails` (
  `OrderNumber` tinyint NOT NULL,
  `OrderRow` tinyint NOT NULL,
  `Description` tinyint NOT NULL,
  `Items` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vplocklist`
--

DROP TABLE IF EXISTS `vplocklist`;
/*!50001 DROP VIEW IF EXISTS `vplocklist`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vplocklist` (
  `OrderNumber` tinyint NOT NULL,
  `OrderRow` tinyint NOT NULL,
  `Description` tinyint NOT NULL,
  `Items` tinyint NOT NULL,
  `Shelf` tinyint NOT NULL,
  `ShelfLocation` tinyint NOT NULL,
  `ItemsAvailable` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vproduct`
--

DROP TABLE IF EXISTS `vproduct`;
/*!50001 DROP VIEW IF EXISTS `vproduct`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vproduct` (
  `id` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `image` tinyint NOT NULL,
  `category` tinyint NOT NULL,
  `price` tinyint NOT NULL,
  `items` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vcartdetails`
--

/*!50001 DROP TABLE IF EXISTS `vcartdetails`*/;
/*!50001 DROP VIEW IF EXISTS `vcartdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vcartdetails` AS select `C`.`id` AS `CartNumber`,`R`.`id` AS `CartRow`,`P`.`description` AS `Description`,`R`.`items` AS `Items` from ((`cart` `C` left join `cartrow` `R` on((`C`.`id` = `R`.`cart`))) left join `product` `P` on((`R`.`product` = `P`.`id`))) order by `R`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vinventory`
--

/*!50001 DROP TABLE IF EXISTS `vinventory`*/;
/*!50001 DROP VIEW IF EXISTS `vinventory`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vinventory` AS select `S`.`shelf` AS `shelf`,`S`.`description` AS `location`,`I`.`items` AS `items`,`P`.`description` AS `description` from ((`inventory` `I` join `invenshelf` `S` on((`I`.`shelf_id` = `S`.`shelf`))) join `product` `P` on((`P`.`id` = `I`.`prod_id`))) order by `S`.`shelf` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vinventorylog`
--

/*!50001 DROP TABLE IF EXISTS `vinventorylog`*/;
/*!50001 DROP VIEW IF EXISTS `vinventorylog`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vinventorylog` AS select `product`.`description` AS `description`,`inventorylog`.`prod_id` AS `prod_id`,`inventorylog`.`when` AS `when`,`inventorylog`.`old_amount` AS `old_amount`,`inventorylog`.`new_amount` AS `new_amount` from (`inventorylog` join `product` on((`inventorylog`.`prod_id` = `product`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vorderdetails`
--

/*!50001 DROP TABLE IF EXISTS `vorderdetails`*/;
/*!50001 DROP VIEW IF EXISTS `vorderdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vorderdetails` AS select `O`.`id` AS `OrderNumber`,`R`.`id` AS `OrderRow`,`P`.`description` AS `Description`,`R`.`items` AS `Items` from ((`order` `O` join `orderrow` `R` on((`O`.`id` = `R`.`order`))) join `product` `P` on((`R`.`product` = `P`.`id`))) order by `R`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vplocklist`
--

/*!50001 DROP TABLE IF EXISTS `vplocklist`*/;
/*!50001 DROP VIEW IF EXISTS `vplocklist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vplocklist` AS select `O`.`id` AS `OrderNumber`,`R`.`id` AS `OrderRow`,`P`.`description` AS `Description`,`R`.`items` AS `Items`,`S`.`shelf` AS `Shelf`,`S`.`description` AS `ShelfLocation`,`I`.`items` AS `ItemsAvailable` from ((((`order` `O` join `orderrow` `R` on((`O`.`id` = `R`.`order`))) join `product` `P` on((`R`.`product` = `P`.`id`))) join `inventory` `I` on((`P`.`id` = `I`.`prod_id`))) join `invenshelf` `S` on((`I`.`shelf_id` = `S`.`shelf`))) order by `R`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vproduct`
--

/*!50001 DROP TABLE IF EXISTS `vproduct`*/;
/*!50001 DROP VIEW IF EXISTS `vproduct`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vproduct` AS select `P`.`id` AS `id`,`P`.`description` AS `description`,`P`.`image` AS `image`,group_concat(distinct `PC`.`category` separator ',') AS `category`,`P`.`price` AS `price`,`I`.`items` AS `items` from (((`product` `P` left join `prod2cat` `P2C` on((`P`.`id` = `P2C`.`prod_id`))) left join `prodcategory` `PC` on((`PC`.`id` = `P2C`.`cat_id`))) left join `inventory` `I` on((`P`.`id` = `I`.`prod_id`))) group by `P`.`id` order by `P`.`description` */;
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

-- Dump completed on 2017-06-13 10:14:07
