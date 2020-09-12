-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: e-commerce
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id` int NOT NULL,
  `city_name` varchar(45) NOT NULL,
  `city_shortcode` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `city_shortcode_UNIQUE` (`city_shortcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Anjou','4419'),(2,'San Antonio','9423'),(3,'Eugene','1769'),(4,'Villafranca','2485'),(5,'Redcliffe','9439'),(6,'Stratford','2619'),(7,'Maaseik','6116'),(8,'Fairbanks','9467'),(9,'Scarborough','2882'),(10,'Puerto','2273'),(11,'Blankenfelde','6329'),(12,'Mount Pearl','6852'),(13,'CabodeHornos','6741'),(14,'Lisciano Niccone','8758'),(15,'Volgograd','3126');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint_tickets`
--

DROP TABLE IF EXISTS `complaint_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaint_tickets` (
  `id` int NOT NULL,
  `user_remark_id` int NOT NULL,
  `customer_rep_user_id` int NOT NULL,
  `allotment_timestamp` timestamp NOT NULL,
  `ticket_status_id` int NOT NULL,
  `user_remarks` text NOT NULL,
  `customer_rep_user_final_remark_text` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cus_fk_ut_idx` (`customer_rep_user_id`),
  KEY `ts_fk_tsi_idx` (`ticket_status_id`),
  KEY `uri_fk_ur_idx` (`user_remark_id`),
  CONSTRAINT `cto_fk_utb` FOREIGN KEY (`customer_rep_user_id`) REFERENCES `user_table` (`id`),
  CONSTRAINT `tid_fk_tst` FOREIGN KEY (`ticket_status_id`) REFERENCES `ticket_status` (`id`),
  CONSTRAINT `uj_fk_ussr` FOREIGN KEY (`user_remark_id`) REFERENCES `user_remark` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint_tickets`
--

LOCK TABLES `complaint_tickets` WRITE;
/*!40000 ALTER TABLE `complaint_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `complaint_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_user`
--

DROP TABLE IF EXISTS `employee_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_user` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `official_email` varchar(45) NOT NULL,
  `official_number` int DEFAULT NULL,
  `comments` tinytext NOT NULL,
  `employee_rating` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_id_UNIQUE` (`employee_id`),
  UNIQUE KEY `official_email_UNIQUE` (`official_email`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_user`
--

LOCK TABLES `employee_user` WRITE;
/*!40000 ALTER TABLE `employee_user` DISABLE KEYS */;
INSERT INTO `employee_user` VALUES (1,101,1000,'accumsan.convallis.ante@est.net',383873,'erat eget ipsum. Suspendisse sagittis',3),(2,102,999,'justo.faucibus.lectus@sit.com',627192,'ornare lectus justo eu arcu',3),(3,103,998,'neque@imperdiet.co.uk',231507,'Quisque ac libero nec ligula',3),(4,104,997,'rhoncus@Nulla.edu',173109,'lacinia mattis. Integer eu lacus',4),(5,105,996,'aliquet.molestie.',165129,'ullamcorper nisl arcu iaculis enim',5),(6,106,995,'Donec.consectetuer',238407,'hendrerit id, ante. Nunc mauris',4),(7,107,994,'vestibulum@Aliqu.org',906690,'sapien cursus in, hendrerit consectetuer',3),(8,108,993,'pede.blandit@Mauris.ca',208119,'nunc Quisque ornare tortor at',4),(9,109,992,'augue@erategettincidunt.com',390174,'eu tellus eu augue porttitor',2),(10,110,991,'blandit.congue@adlitoratorquent.ca',452930,'nibh dolor, nonummy feugiat',2),(11,111,990,'vitae@cursus.com',115939,'ut nisi a odio semper',5),(12,112,989,'at.nisi.Cum@penatibuset.co.uk',376021,'tellus Nunc lectus pede ultrices',4),(13,113,988,'fringilla@afelisullr.ca',588360,'lacus pede sagittis augue, eu',2),(14,114,987,'eleifend.non.dapibus@aliquam.com',756390,'convallis ligula. Donec luctus aliquet',1),(15,115,986,'consequat.purus@ulsligula.net',8481536,'ac facilisis facilisis, magna tellus',2);
/*!40000 ALTER TABLE `employee_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logistic_order`
--

DROP TABLE IF EXISTS `logistic_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logistic_order` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `logistic_vendor_user_id` int NOT NULL,
  `allotment` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_status_fetch_id` int NOT NULL,
  `comments` text,
  PRIMARY KEY (`id`),
  KEY `oid_fk_ot_idx` (`order_id`),
  KEY `lvu_fk_lvid_idx` (`logistic_vendor_user_id`),
  KEY `os_fk_if_idx` (`order_status_fetch_id`),
  CONSTRAINT `lvu_fk_lvid` FOREIGN KEY (`logistic_vendor_user_id`) REFERENCES `logistic_vendor_user` (`id`),
  CONSTRAINT `oid_fk_ot` FOREIGN KEY (`order_id`) REFERENCES `order_table` (`id`),
  CONSTRAINT `os_fk_if` FOREIGN KEY (`order_status_fetch_id`) REFERENCES `order_status_fetch` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logistic_order`
--

LOCK TABLES `logistic_order` WRITE;
/*!40000 ALTER TABLE `logistic_order` DISABLE KEYS */;
INSERT INTO `logistic_order` VALUES (80,71,70,'2020-08-27 22:33:40',4,'ORDER AT COURIER HUB'),(81,72,71,'2019-12-13 08:54:29',5,'ORDER IN TRANSIT'),(82,73,72,'2020-12-14 07:13:47',2,'READY FOR PICKUP'),(83,74,73,'2020-04-03 11:35:29',3,'ORDER PICKED UP BY COURIER SERVICE'),(84,75,74,'2021-03-25 12:12:43',1,'ORDER CONFIRMED'),(85,76,70,'2020-07-10 09:56:21',2,NULL);
/*!40000 ALTER TABLE `logistic_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logistic_vendor`
--

DROP TABLE IF EXISTS `logistic_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logistic_vendor` (
  `id` int NOT NULL,
  `logistic_vendor_name` varchar(25) NOT NULL,
  `logistic_vendor_address_line1` varchar(45) NOT NULL,
  `logistic_vendor_address_line2` varchar(45) NOT NULL,
  `logistic_vendor_alt_address_line1` varchar(45) DEFAULT NULL,
  `logistic_vendor_alt_address_line2` varchar(45) DEFAULT NULL,
  `email` varchar(25) NOT NULL,
  `contact_number` int NOT NULL,
  `city_id` int DEFAULT NULL,
  `is_active` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `ctd_fk_cty_idx` (`city_id`),
  CONSTRAINT `ct_fk_cy` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logistic_vendor`
--

LOCK TABLES `logistic_vendor` WRITE;
/*!40000 ALTER TABLE `logistic_vendor` DISABLE KEYS */;
INSERT INTO `logistic_vendor` VALUES (80,'Dominic','P.O. Box 287,','1231 Risus, Street','Fairbanks Hameln Fairbanks','6418 Vitae, St.','ultrices@euorerat.co.uk',5856963,8,1),(81,'Cara','P.O. Box 116, 2962','Libero St.	Scarborough','Sirsa Scarborough	356-2091','Dictum. Road	senectus.et.','netus@risusvariusorci.com',123384,9,0),(82,',Juliet','786-7785 Pellentesque Avenue','Puerto	Campos dos Goytacazes','Puerto	P.O. Box 224,','8406 Tempor Avenue','natouiFuscediam.edu',7899976,10,1),(83,'Hermione','487-3106 Justo Ave','Blankenfelde	Hudson Bay','Blankenfelde','P.O. Box 683,pendisse','dudumullamcorper.com',6987843,11,1),(84,'Benjamin','P.O. Box 498, 8163 Eget,','Ave	Mount Pearl','Hulst Mount Pearl','132-7702 Velit. Road','nec.tis@maurisblandit.org',95221334,12,0),(85,'Quin','9151 Pede, Road	CabodeHornos','Genappe CabodeHornos','364-388 Eros Rd.','pellentesque.tellus.','sem@eratvitae.edu',76643313,13,1),(86,'Teegan','P.O. Box 668 8798 Consectetuer,','Av.Lisciano Niccone','Penhold Lisciano Niccone','594-9816 Penatibus St.','nunc.id@intempus.net',642321,14,0),(87,'Ray','723-6272 Risus Road','Volgograd Zutendaal','Volgograd','211-5876 ParturientStDonec.','tempus@infaucibusorci.ca',3344561,15,1),(88,'Iris','6272 Risus','Hornos','Volgogra','76 Parturient','enim.non.nisi@nNullam.com',213133,4,1);
/*!40000 ALTER TABLE `logistic_vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logistic_vendor_user`
--

DROP TABLE IF EXISTS `logistic_vendor_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logistic_vendor_user` (
  `id` int NOT NULL,
  `logistic_vendor_id` int NOT NULL,
  `user_id` int NOT NULL,
  `is_active` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lgv_fk_vl_idx` (`logistic_vendor_id`),
  KEY `usi_fk_as_idx` (`user_id`),
  CONSTRAINT `usi_fk_as` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`id`),
  CONSTRAINT `vlg_fk_vl` FOREIGN KEY (`logistic_vendor_id`) REFERENCES `logistic_vendor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logistic_vendor_user`
--

LOCK TABLES `logistic_vendor_user` WRITE;
/*!40000 ALTER TABLE `logistic_vendor_user` DISABLE KEYS */;
INSERT INTO `logistic_vendor_user` VALUES (70,80,123,1),(71,81,124,1),(72,82,125,1),(73,83,126,1),(74,84,127,1),(75,85,128,1),(76,86,129,1),(77,87,130,1);
/*!40000 ALTER TABLE `logistic_vendor_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status_fetch`
--

DROP TABLE IF EXISTS `order_status_fetch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status_fetch` (
  `id` int NOT NULL,
  `status_text` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status_fetch`
--

LOCK TABLES `order_status_fetch` WRITE;
/*!40000 ALTER TABLE `order_status_fetch` DISABLE KEYS */;
INSERT INTO `order_status_fetch` VALUES (1,'order confirmed'),(2,'ready for pickup'),(3,'order picked up by courier service'),(4,'order at courier hub'),(5,'order in transit'),(6,'order out for delivery'),(7,'order delivered');
/*!40000 ALTER TABLE `order_status_fetch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_table`
--

DROP TABLE IF EXISTS `order_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_table` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `user_location_id` int NOT NULL,
  `store_product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `total_price_charged` float NOT NULL,
  `order_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `invoice_file_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usd_fk_ut_idx` (`user_id`),
  KEY `usl_fk_ul_idx` (`user_location_id`),
  KEY `spd_fk_sp_idx` (`store_product_id`),
  CONSTRAINT `spd_fk_sp` FOREIGN KEY (`store_product_id`) REFERENCES `store_product` (`id`),
  CONSTRAINT `usd_fk_ut` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`id`),
  CONSTRAINT `usl_fk_ul` FOREIGN KEY (`user_location_id`) REFERENCES `user_location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_table`
--

LOCK TABLES `order_table` WRITE;
/*!40000 ALTER TABLE `order_table` DISABLE KEYS */;
INSERT INTO `order_table` VALUES (71,108,60,42,7,40000,'2021-04-11 11:16:19','ABCD'),(72,102,61,43,5,39000,'2019-11-17 04:58:40','EFGH'),(73,103,62,44,9,70000,'2020-07-17 05:05:28','HIJK'),(74,104,63,45,4,31000,'2020-08-19 12:58:55','LMNO'),(75,105,64,46,11,70000,'2020-09-14 03:01:06','PQRS'),(76,101,60,40,2,1132.22,'2020-07-10 08:51:51',NULL),(99,101,60,40,2,1132.22,'2020-07-10 09:22:59',NULL),(100,101,60,40,2,1132.22,'2020-07-10 09:29:00',NULL),(101,108,67,40,2,1132.22,'2020-07-10 09:44:24',NULL),(102,108,67,40,2,1132.22,'2020-07-10 09:52:31',NULL);
/*!40000 ALTER TABLE `order_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_track`
--

DROP TABLE IF EXISTS `order_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_track` (
  `id` int NOT NULL,
  `logistic_order_id` int NOT NULL,
  `current_location` varchar(45) DEFAULT NULL,
  `current_status` varchar(45) NOT NULL,
  `update_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_status_fetch_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ort_fk_lo_idx` (`logistic_order_id`),
  KEY `ofc_fk_ofs_idx` (`order_status_fetch_id`),
  CONSTRAINT `ofc_fk_ofs` FOREIGN KEY (`order_status_fetch_id`) REFERENCES `order_status_fetch` (`id`),
  CONSTRAINT `ort_fk_lo` FOREIGN KEY (`logistic_order_id`) REFERENCES `logistic_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_track`
--

LOCK TABLES `order_track` WRITE;
/*!40000 ALTER TABLE `order_track` DISABLE KEYS */;
INSERT INTO `order_track` VALUES (90,80,'franko ohio','ORDER AT COURIER HUB','2020-08-27 22:33:40',4),(91,81,'birminghan st.','ORDER IN TRANSIT','2019-12-13 08:54:29',5),(92,82,'frankfurt st.','READY FOR PICKUP','2020-12-14 07:13:47',2),(93,83,'jhonson st.','ORDER PICKED UP BY COURIER SERVICE','2020-04-03 11:35:29',3),(94,84,'st. patrick','ORDER CONFIRMED','2021-03-25 12:12:43',1),(95,85,'ANJOU','READY FOR PICKUP','2020-07-10 09:56:21',2),(484,85,'ANJOU','PICKUP','2020-07-12 08:32:28',2);
/*!40000 ALTER TABLE `order_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `id` int NOT NULL,
  `category` varchar(45) NOT NULL,
  `is_active` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_UNIQUE` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (3,'Mobiles, Computers',1),(13,'Car, Motorbike, Industrial',0),(14,'Mens Fashion',1),(19,'Womens Fashion',0),(31,'Books',1),(44,'Toys,Baby Products,Kids Fashion',0),(47,'TV, Appliances, Electronics',1),(50,'Gift Cards & Mobile Recharges',1),(59,'Home,Kitchen,Pets',0),(62,'Sports,Fitness,Bags,Luggage',0),(70,'Global Store',1),(93,'Beauty,Health,Grocery',1),(96,'Movies, Music & Video Games',0);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_table`
--

DROP TABLE IF EXISTS `product_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_table` (
  `id` int NOT NULL,
  `product_name` varchar(45) NOT NULL,
  `category_id` int NOT NULL,
  `product_description` varchar(45) NOT NULL,
  `unit_price` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id_idx` (`category_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_table`
--

LOCK TABLES `product_table` WRITE;
/*!40000 ALTER TABLE `product_table` DISABLE KEYS */;
INSERT INTO `product_table` VALUES (1,'Exam Central',31,'nec urna et arcu imperdiet',5282,13),(9,'stuff',70,'ac mattis semper, dui lectus',6078,159),(21,'Car Parts',13,'eu, placerat eget, venenatis a,',9510,134),(23,'Fashion Sandals',19,'erat. Sed nunc est, mollis',7512,44),(24,'Watches',14,'Nunc mauris sapien, cursus in',7428,2),(25,'Gold & Diamond Jewellery',19,'urna. Vivamus molestie dapibus ligula.',7513,51),(27,'Security Cameras',47,'tempus non, lacinia at, iaculis',6316,148),(28,'Sunglasses',14,'non sapien molestie orci tincidunt',9406,58),(30,'Diapers',44,'tincidunt orci quis lectus. Nullam',8610,188),(31,'Fiction Books',31,'hendrerit a, arcu. Sed et',9717,75),(32,'Popular Gift Cards',50,'ac mattis velit justo nec',7591,9),(36,'Baby Bath, Skin & Grooming',44,'in consequat enim diam vel',8995,142),(39,'Home Entertainment Systems',47,'quis urna. Nunc quis arcu',8213,93),(40,'All Mobile Accessories',3,'adipiscing non, luctus sit amet',9711,152),(43,'Tablets',3,'egestas. Aliquam nec enim. Nunc',6078,194),(46,'Motorbike Accessories & Parts',13,'in consequat enim diam vel',8995,142),(48,'Car & Bike Care',13,'iaculis odio. Nam interdum enim',8269,47),(49,'Home Storage',59,'enim. Suspendisse aliquet, sem ut',8514,199),(50,'Wedding & Anniversary',50,'iaculis odio. Nam interdum enim',8269,47),(51,'Sports Collectibles',62,'hendrerit a, arcu. Sed et',9717,75),(52,'Car Electronics',13,'eu nibh vulputate mauris sagittis',6133,98),(53,'Power Banks',3,'libero nec ligula consectetuer rhoncus',9493,40),(54,'School Textbooks',31,'cursus, diam at pretium aliquet,',6929,33),(55,'Western Wear',19,'lorem, luctus ut, pellentesque eget,',7717,79),(57,'Toys & Games',44,'ac mattis semper, dui lectus',6078,159),(58,'All Mobile Phones',3,'gravida non, sollicitudin a, malesuada',8781,53),(59,'Cameras',47,'Ut sagittis lobortis mauris. Suspendisse',8884,192),(60,'Televisions',47,'sit amet metus. Aliquam erat',6768,55),(61,'Fashion & Silver Jewellery',19,'hendrerit id ante Nunc mauris',6638,9),(63,'Refurbished & Open Box',62,'erat. Sed nunc est, mollis',7512,44),(64,'Strollers & Prams',44,'tempus non, lacinia at, iaculis',6316,148),(65,'Car Accessories',13,'ac mattis velit justo nec',7591,9),(66,'Shoes',14,'enim. Suspendisse aliquet, sem ut',8514,199),(67,'Cases & Covers',3,'Praesent interdum ligula eu enim.',9288,108),(68,'T-shirts & Polos',14,'leo, in lobortis tellus justo',5491,73),(69,'Speakers',47,'pede blandit congue In scelerisque',5792,164),(70,'Gift Tags, Greeting Cards',50,'eu, placerat eget, venenatis a,',9510,134),(100,'Childrens Books',31,' libero. Donec consectetuer mauris',5679,70),(155,'Personal Care Appliances',93,'ac mattis semper, dui lectus',6078,159),(167,'Blu-ray',96,'nascetur ridiculus mus. Proin vel',6375,114),(309,'Beauty & Grooming',93,'nec urna et arcu imperdiet',5282,13),(478,'Textbooks',31,'adipiscing elit. Etiam laoreet, libero',6721,32),(510,'STEM Toys Store',44,'nascetur ridiculus mus. Proin vel',6375,114),(532,'All Movies & TV Shows',96,'tincidunt orci quis lectus. Nullam',8610,188),(570,'Handbags & Clutches',19,'placerat, augue. Sed molestie. Sed',6242,72),(609,'Home Décor',59,'lorem, luctus ut, pellentesque eget,',7717,79),(876,'Wallets',14,'bibendum fermentum metus. Aenean sed',5039,152);
/*!40000 ALTER TABLE `product_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `store_product_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usid_fk_ustb_idx` (`user_id`),
  KEY `strpd_fk_sp_idx` (`store_product_id`),
  CONSTRAINT `storepd_fk_sp` FOREIGN KEY (`store_product_id`) REFERENCES `store_product` (`id`),
  CONSTRAINT `usk_fk_ut` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
INSERT INTO `shopping_cart` VALUES (120,108,40,2),(121,102,41,6),(122,103,42,7);
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_product`
--

DROP TABLE IF EXISTS `store_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_product` (
  `id` int NOT NULL,
  `storehouse_id` int NOT NULL,
  `product_id` int NOT NULL,
  `store_discount` double NOT NULL,
  `store_additional_cost` double NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `storehouse_id_idx` (`storehouse_id`),
  KEY `product_id_idx` (`product_id`),
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `product_table` (`id`),
  CONSTRAINT `storehouse_id` FOREIGN KEY (`storehouse_id`) REFERENCES `vendor_storehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_product`
--

LOCK TABLES `store_product` WRITE;
/*!40000 ALTER TABLE `store_product` DISABLE KEYS */;
INSERT INTO `store_product` VALUES (40,30,1,10.5,23,12),(41,31,9,11.5,45,32),(42,32,21,9.5,66,34),(43,33,23,2.3,10,75),(44,34,24,5.5,6,76),(45,35,25,1.3,10,67),(46,36,27,11.8,28,78),(47,37,28,7.9,64,231),(48,38,30,8.9,12,12),(49,39,31,5.5,33,32),(50,40,32,10.5,23,34),(51,41,36,11.5,45,75),(52,42,39,9.5,66,76),(53,43,40,2.3,10,67),(54,44,43,5.5,6,78),(55,45,46,1.3,10,231),(56,46,48,11.8,28,12),(57,33,49,7.9,64,32),(58,34,50,8.9,12,34),(59,35,51,5.5,33,75),(60,36,52,10.5,66,76),(61,37,53,11.5,10,67),(62,38,54,9.5,6,78),(63,41,55,2.3,10,231),(64,42,57,5.5,28,12),(65,43,58,1.3,64,32),(66,44,59,11.8,12,34),(67,45,60,7.9,33,75),(68,46,61,8.9,23,76),(69,43,63,5.5,45,67),(70,44,64,10.5,66,78),(71,45,65,11.5,10,231),(72,46,66,9.5,12,55),(73,33,67,2.3,32,45),(74,34,68,5.5,34,32),(75,35,69,1.3,45,75),(76,33,70,11.8,66,76),(77,34,100,7.9,10,32),(78,35,155,8.9,6,34),(79,36,167,5.5,10,12),(80,37,309,10.5,28,32),(81,38,478,11.5,64,34),(82,39,510,9.5,12,75),(83,40,532,2.3,33,76),(84,41,570,5.5,23,82),(85,31,609,1.3,45,82),(86,32,876,11.8,66,43);
/*!40000 ALTER TABLE `store_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_communication`
--

DROP TABLE IF EXISTS `ticket_communication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_communication` (
  `id` int NOT NULL,
  `ticked_id` int NOT NULL,
  `timestamp` timestamp NOT NULL,
  `user_id` int NOT NULL,
  `communicated_text` text NOT NULL,
  `final_remark_from_customer_rep` text NOT NULL,
  `ticket_status_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ti_fk_ct_idx` (`ticked_id`),
  KEY `us_fk_uti_idx` (`user_id`),
  KEY `tsi_fk_ts_idx` (`ticket_status_id`),
  CONSTRAINT `ti_fk_ct` FOREIGN KEY (`ticked_id`) REFERENCES `complaint_tickets` (`id`),
  CONSTRAINT `tsi_fk_ts` FOREIGN KEY (`ticket_status_id`) REFERENCES `ticket_status` (`id`),
  CONSTRAINT `us_fk_uti` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_communication`
--

LOCK TABLES `ticket_communication` WRITE;
/*!40000 ALTER TABLE `ticket_communication` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_communication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_status`
--

DROP TABLE IF EXISTS `ticket_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_status` (
  `id` int NOT NULL,
  `status_text` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_status`
--

LOCK TABLES `ticket_status` WRITE;
/*!40000 ALTER TABLE `ticket_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_location`
--

DROP TABLE IF EXISTS `user_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_location` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `address_line1` varchar(45) NOT NULL,
  `address_line2` varchar(45) DEFAULT NULL,
  `pincode` int NOT NULL,
  `contact_person` int NOT NULL,
  `contact_name` varchar(45) NOT NULL,
  `city_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usloc_fk_userid_idx` (`user_id`),
  KEY `uscityid_fk_city_idx` (`city_id`),
  CONSTRAINT `uscityid_fk_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  CONSTRAINT `usloc_fk_userid` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_location`
--

LOCK TABLES `user_location` WRITE;
/*!40000 ALTER TABLE `user_location` DISABLE KEYS */;
INSERT INTO `user_location` VALUES (60,101,'6638 Dictum Road','Anjou',23134,36785,'Garth',1),(61,102,'714-1697 Cursus Avenue','San Antonio',23135,79231,'Hamilton',2),(62,103,'2261 Magna, Avenue','Eugene',23136,86031,'Cedric',3),(63,104,'4672 At, Avenue','Villafranca',23137,24602,'Aimee',4),(64,105,'6272 Risus','Redcliffe',23138,80735,'Austin',5),(65,106,'8798 Consectetuer, Av.','Stratford',23139,55739,'James',6),(66,107,'P.O. Box 498, 8163 Eget, Ave','Maaseik',23140,84166,'Iris',7),(67,108,'P.O Box 7763','Fairbanks',23141,83515,'Eagan',8),(68,109,'P.O. Box 668','Scarborough',23142,53042,'Chava',9),(69,110,'6272 Risus','Puerto',23143,19484,'Hayden',10),(70,111,'4672 At, Avenue','Blankenfelde',23144,39848,'Addison',11),(71,112,'P.O. Box 287, 1231 Risus, Street','Mount Pearl',23145,96561,'Hedwig',12),(72,113,'P.O. Box 116, 2962 Libero St.','CabodeHornos',23146,93741,'Dylan',13),(73,114,'Eugene	Lisciano','Niccone',23147,48583,'Jescie',14),(74,115,'6638 Dictum Road','Volgograd',23148,75799,'Duncan',15),(75,116,'714-1697 Cursus Avenue','Anjou',23149,466464,'Naida',1),(76,117,'329 Ut Ave	San','Antonio',23150,465664,'Fulton',2),(77,118,'Eugene','Eugene',23151,55664,'Vance',3),(78,119,'6638 Dictum Road','Villafranca',23152,3131313,'Jaden',4),(79,120,'714-1697 Cursus Avenue','Redcliffe',23153,33212123,'Justina',5),(80,121,'2261 Magna, Avenue','Stratford',23154,4233366,'Arsenio',6),(81,122,'4672 At, Avenue','Maaseik',23155,85852122,'Yen',7),(82,123,'P.O. Box 287, 1231 Risus, Street','Fairbanks',23156,5856963,'Dominic',8),(83,124,'P.O. Box 116, 2962 Libero St.','Scarborough',23157,123384,'Cara',9),(84,125,'786-7785 Pellentesque Avenue','Puerto',23158,7899976,'Juliet',10),(85,126,'487-3106 Justo Ave','Blankenfelde',23159,6987843,'Hermione',11),(86,127,'P.O. Box 498, 8163 Eget, Ave','Mount Pearl',23160,221334,'Benjamin',12),(87,128,'9151 Pede, Road','CabodeHornos',23161,76643313,'Quin',13),(88,129,'P.O. Box 668','Volgograd',23162,3344561,'Teegan',14),(89,130,'6272 Risus','Hornos',23163,213133,'Ray',15);
/*!40000 ALTER TABLE `user_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_remark`
--

DROP TABLE IF EXISTS `user_remark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_remark` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `order_id` int NOT NULL,
  `user_remark_text` text NOT NULL,
  `iscomplaint` tinytext NOT NULL,
  `timestamp` text NOT NULL,
  `isaddressed` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ui_fk_ut_idx` (`user_id`),
  KEY `oi_fk_ot_idx` (`order_id`),
  CONSTRAINT `oi_fk_ot` FOREIGN KEY (`order_id`) REFERENCES `order_table` (`id`),
  CONSTRAINT `ui_fk_ut` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_remark`
--

LOCK TABLES `user_remark` WRITE;
/*!40000 ALTER TABLE `user_remark` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_remark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `id` int NOT NULL,
  `user_role` varchar(45) NOT NULL,
  `user_roleshortcode` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_roleshortcodel_UNIQUE` (`user_roleshortcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1001,'CUSTOMER','01'),(1002,'VENDOR','02'),(1003,'EMPLOYEE','03'),(1004,'Logistic_Vendor_User','04'),(1005,'CUSTOMER_REP','05'),(1006,'ADMIN','06');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_table`
--

DROP TABLE IF EXISTS `user_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_table` (
  `id` int NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` int NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `user_role_id` int NOT NULL,
  `is_employee` tinyint NOT NULL,
  `is_active` tinyint NOT NULL,
  `last_sigin` timestamp NOT NULL,
  `password` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`),
  KEY `user_role_id_idx` (`user_role_id`),
  CONSTRAINT `user_role_id` FOREIGN KEY (`user_role_id`) REFERENCES `user_roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_table`
--

LOCK TABLES `user_table` WRITE;
/*!40000 ALTER TABLE `user_table` DISABLE KEYS */;
INSERT INTO `user_table` VALUES (101,'Garth','Price','pede@tristiquesenectus.ca',36785,'Conan Z. Small',1001,1,1,'2021-04-11 11:16:19',5905),(102,'Hamilton','Joyce','aliquet@augueid.co.uk',79231,'Dominique S. Cherry',1001,1,0,'2019-11-17 04:58:40',7446),(103,'Cedric','Mitchell','nascetur.ridiculus.mus@Curabitur.net',86031,'Hyatt B. Webb',1001,1,0,'2020-07-17 05:05:28',6527),(104,'Aimee','Welch','iaculis.enim@triset.co.uk',24602,'Erich Q. Stark',1001,0,1,'2020-08-19 12:58:55',2379),(105,'Austin','Crawford','magna.males.edu',80735,'Blaine V. Bean',1001,0,1,'2020-09-14 03:01:06',4108),(106,'James','Foley','Morbi@posuerecubile.com',55739,'Hayden A. Woodard',1002,1,1,'2020-02-23 12:56:44',8220),(107,'Iris','Stuart','enim.non.nisi@nequeNullam.com',84166,'Hamish V. Stanley',1002,1,0,'2021-01-27 13:01:10',7743),(108,'Eagan','Buckner','nulla.Integer.vulput.net',83515,'Rooney H. Murphy',1003,1,0,'2019-06-27 17:14:19',5712),(109,'Chava','Chambers','sit.amet@enimSed.edu',53042,'Thaddeus L. Powell',1003,0,0,'2021-06-07 10:00:09',8856),(110,'Hayden','Hayden','Pellentesque.com',19484,'Armand V. Mack',1003,0,0,'2020-05-12 16:12:35',9870),(111,'Addison','Crane','velit@amia.or',39848,'Tallulah S. Anthony',1004,0,1,'2019-11-12 11:46:29',1524),(112,'Hedwig','Hinton','id@scelerisque.ca',96561,'Lana T. Mcknight',1004,1,1,'2020-10-07 06:11:43',9847),(113,'Dylan','Martin','dictum.augue@perat.ca',93741,'Kylynn X. Robbins',1005,1,0,'2020-09-03 13:02:47',9000),(114,'Jescie','Strong','morbi@semsemper.edu',48583,'Allen D. Green',1005,0,1,'2019-07-25 15:39:14',9959),(115,'Duncan','Kent','nulla@vel.net',75799,'Uma D. Greene',1006,0,0,'2020-04-13 18:38:58',2050),(116,'Naida','Sydney','erat@posuereenim.edu',466464,'noton_mg',1002,1,1,'2019-11-12 11:46:29',6613),(117,'Fulton','hudson','@posuereenim.edu',465664,'zoton_mg',1002,1,1,'2019-11-12 11:46:29',6643),(118,'Vance','dawson','adadereenim.edu',55664,'zfsfn_mg',1002,1,1,'2020-10-07 06:11:43',6123),(119,'Jaden','johnson','tempus@infaucibusorci.ca',55739,'SweetKristy',1002,1,1,'2020-04-13 18:38:58',4666),(120,'Justina','Reves','fringilla.euismod@ut.co.uk',3344561,'KristyHoney',1002,1,1,'2020-04-14 18:40:58',4552),(121,'Arsenio','Thomas','ligula.s@ullamco.co.uk',3131313,'BubblySnowflake',1002,1,1,'2020-04-11 18:38:58',5566),(122,'Yen','xingping','Cras.pelue@odioapurus.edu',4233366,'AngelicPrincessKristy',1002,1,1,'2020-04-18 18:40:58',3333),(123,'Dominic','kadrick','ultrices@eutemporerat.co.uk',85852122,'FairyPrincessKristy',1002,0,0,'2020-04-10 18:38:58',2215),(124,'Cara','homes','senectus.et.netus@risusvariusorci.com',5856963,'TurboSlayer',1002,1,1,'2020-04-20 18:40:58',1566),(125,'Juliet','roberto','natouiFuscediam.edu',123384,'Cryptichatter',1002,1,1,'2020-04-24 18:38:58',3102),(126,'Hermione','daniel','dudumullamcorper.com',7899976,'SteelTitan',1002,1,1,'2020-04-27 18:31:58',7889),(127,'Benjamin','frank','nec.tis@maurisblandit.org',6987843,'Crash Tv',1002,1,1,'2020-04-28 18:38:58',9885),(128,'Quin','tomus','sem@eratvitae.edu',95221334,'BlazeAssault',1002,1,1,'2020-03-14 18:40:58',5565),(129,'Teegan','trump','nunc.id@intempus.net',76643313,'Venom',1002,1,1,'2020-02-13 18:38:58',4556),(130,'Ray','hughes','bi@puerecubile.com',642321,'Ffrozen',1002,1,1,'2020-04-14 18:40:58',5455);
/*!40000 ALTER TABLE `user_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_storehouse`
--

DROP TABLE IF EXISTS `vendor_storehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_storehouse` (
  `id` int NOT NULL,
  `vendor_id` int NOT NULL,
  `storename` varchar(45) NOT NULL,
  `store_address_line1` varchar(45) NOT NULL,
  `store_address_line2` varchar(45) NOT NULL,
  `pincode` int NOT NULL,
  `city_id` int NOT NULL,
  `is_active` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `venid_fk_ventb_idx` (`vendor_id`),
  KEY `cityid_fk_city_idx` (`city_id`),
  CONSTRAINT `city_fk_ct` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  CONSTRAINT `vid_fk_vt` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_storehouse`
--

LOCK TABLES `vendor_storehouse` WRITE;
/*!40000 ALTER TABLE `vendor_storehouse` DISABLE KEYS */;
INSERT INTO `vendor_storehouse` VALUES (30,10,'Cornucopia','8798 Consectetuer, Av.','Blankenfelde',112345,11,1),(31,11,'The Corner Store',' P.O. Box 464, 9116 Ac Rd.','Anjou',112346,1,1),(32,12,'Sweet Spot',' 329 Ut AveSan','Antonio',112347,2,1),(33,13,'Decorama Boutique','Ap 737-9535 Mi St.','Eugene',112348,3,1),(34,14,'One of a Kind Studio',' 6638 Dictum Road','Villafranca',112349,4,1),(35,15,'Not Just Groceries',' 714-1697 Cursus Avenue','Redcliffe',112350,5,1),(36,16,'The Full Cart',' 2261 Magna, Avenue','Stratford',112351,6,1),(37,17,'Dollar Savings',' Store	4672 At, Avenue','Maaseik',112352,7,1),(38,18,'HeaT','P.O.Box 2871231 Street','Fairbanks',112363,8,1),(39,19,'Farm to Shelf',' P.O. Box 116 2962 Libero St.','Scarborough',112354,9,0),(40,20,'VISCCUSS','786-7785 Pellentesque Avenue','Puerto',112355,10,1),(41,21,'Plentiful Online','487-3106 Justo Ave','Blankenfelde',112356,11,1),(42,22,'The Ladies','SpaceP.O. Box 498, 8163 Eget, Ave','Mount Pearl',112357,12,1),(43,23,'Green Organica','9151 Pede, Road','CabodeHornos',112358,13,1),(44,24,'Wholesome','P.O. Box 668 Lisciano','Niccone',112359,14,1),(45,25,'The Mega','Store723-6272 Risus Road','Volgograd',112360,15,1),(46,26,'Plentiful Online','6272 Risus','Villafranca',112361,4,1);
/*!40000 ALTER TABLE `vendor_storehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_table`
--

DROP TABLE IF EXISTS `vendor_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_table` (
  `id` int NOT NULL,
  `vendor_name` varchar(45) NOT NULL,
  `vendor_address_line1` varchar(45) NOT NULL,
  `vendor_address_line2` varchar(45) NOT NULL,
  `vendor_alt_address_line1` varchar(45) DEFAULT NULL,
  `vendor_alt_address_line2` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `contact_number` int NOT NULL,
  `city_id` int NOT NULL,
  `is_active` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `city_idx` (`city_id`),
  CONSTRAINT `city` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_table`
--

LOCK TABLES `vendor_table` WRITE;
/*!40000 ALTER TABLE `vendor_table` DISABLE KEYS */;
INSERT INTO `vendor_table` VALUES (10,'James','8798 Consectetuer, Av.','Cabodeornos','Penhold Niccone','211-5876 Part StDonec.','Morbi@posuerecubile.com',55739,11,1),(11,'Naida','P.O. Box 464, 9116 Ac Rd.','Anjou','Siheung Anjou','P.O. Box 997, 6008 Praesent St.','erat@posuereenim.edu',466464,1,1),(12,'Fulton','329 Ut Ave','San Antonio','Nasino	San Antonio','P.O. Box 231, 860 Purus Rd.','@posuereenim.edu',465664,2,1),(13,'Vance','Ap 737-9535 Mi St.','Eugene','Rudiano	Eugene','798-970 Magna. Road','adadereenim.edu',55664,3,1),(14,'Jaden','6638 Dictum Road','Villafranca','Poitiers	Villafranca','P.O. Box 319, 5176 Dui St.','fringilla.euismod@ut.co.uk',3131313,4,0),(15,'Justina','714-1697 Cursus Avenue','Redcliffe','Odintsovo	Redcliffe','P.O. Box 808, 1698 Leo. St.','sem@non.co.uk',33212123,5,1),(16,'Arsenio','2261 Magna, Avenue','Stratford','Hody	Stratford','P.O. Box 557, 3802 Magna Rd.','ligula.s@ullamco.co.uk',4233366,6,0),(17,'Yen','4672 At, Avenue','Maaseik','Colli a Volturno	','P.O. Box 11 St.','Cras.pelue@odioapurus.edu',85852122,7,0),(18,'Dominic','P.O. Box 287, 1231 Risus, Street','Fairbanks','Hameln	Fairbanks','6418 Vitae, St.','ultrices@eutemporerat.co.uk',5856963,8,1),(19,'Cara','P.O. Box 116, 2962 Libero St.','Scarborough','Sirsa	Scarborough','356-2091 Dictum. Road','senectus.et.netus@risusvariusorci.com',123384,9,0),(20,'Juliet','786-7785 Pellentesque Avenue','Puerto','Campos dos Goytacazes	Puerto','P.O. Box 224, 8406 Tempor Avenue','natouiFuscediam.edu',7899976,10,1),(21,'Hermione','487-3106 Justo Ave','Blankenfelde','Hudson Bay	Blankenfelde','P.O. Box 683,pendisse','dudumullamcorper.com',6987843,11,1),(22,'Benjamin','P.O. Box 498, 8163 Eget, Ave','Mount Pearl','Hulst	Mount Pearl','132-7702 Velit. Road','nec.tis@maurisblandit.org',95221334,12,0),(23,'Quin','9151 Pede, Road','CabodeHornos','Genappe	CabodeHornos','364-388 Eros Rd.	pellentesque.tellus.','sem@eratvitae.edu',76643313,13,1),(24,'Teegan','P.O. Box 668 	8798 Consectetuer, Av.','Lisciano Niccone','Penhold	Lisciano Niccone','594-9816 Penatibus St.','nunc.id@intempus.net',642321,14,0),(25,'Ray','723-6272 Risus, Road','Volgograd','Zutendaal	Volgograd','211-5876 Parturient StDonec.','tempus@infaucibusorci.ca',3344561,15,1),(26,'Iris','6272 Risus','Hornos','Volgogra','76 Parturient','enim.non.nisi@nequeNullam.com',213133,4,1);
/*!40000 ALTER TABLE `vendor_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_user`
--

DROP TABLE IF EXISTS `vendor_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_user` (
  `id` int NOT NULL,
  `vendor_id` int NOT NULL,
  `user_id` int NOT NULL,
  `is_active` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  KEY `venid_fk_ventb_idx` (`vendor_id`),
  CONSTRAINT `usid_fk_ustb` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`id`),
  CONSTRAINT `venid_fk_ventb` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_user`
--

LOCK TABLES `vendor_user` WRITE;
/*!40000 ALTER TABLE `vendor_user` DISABLE KEYS */;
INSERT INTO `vendor_user` VALUES (1001,10,106,1),(1002,11,107,1),(1003,12,116,1),(1004,13,117,1),(1005,14,118,1),(1006,15,119,1),(1007,16,120,1),(1008,17,121,1),(1009,18,122,1),(1010,19,123,0),(1011,20,124,1),(1012,21,125,1),(1013,22,126,1),(1014,23,127,1),(1015,24,128,1),(1016,25,129,1),(1017,26,130,1);
/*!40000 ALTER TABLE `vendor_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-12 13:19:25
