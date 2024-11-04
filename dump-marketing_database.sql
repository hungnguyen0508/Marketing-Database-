-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: marketing_database
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `camchan_on_run`
--

DROP TABLE IF EXISTS `camchan_on_run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camchan_on_run` (
  `CampaignID` int NOT NULL,
  `ChannelID` int NOT NULL,
  `Budget` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`CampaignID`,`ChannelID`),
  KEY `ChannelID` (`ChannelID`),
  CONSTRAINT `camchan_on_run_ibfk_1` FOREIGN KEY (`CampaignID`) REFERENCES `dim_campaigns` (`CampaignID`),
  CONSTRAINT `camchan_on_run_ibfk_2` FOREIGN KEY (`ChannelID`) REFERENCES `dim_channels` (`ChannelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camchan_on_run`
--

LOCK TABLES `camchan_on_run` WRITE;
/*!40000 ALTER TABLE `camchan_on_run` DISABLE KEYS */;
INSERT INTO `camchan_on_run` VALUES (1,1,1000000.00),(2,2,500000.00),(3,3,2000000.00),(3,4,2500000.00),(4,3,1500000.00),(4,4,1000000.00);
/*!40000 ALTER TABLE `camchan_on_run` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_campaigns`
--

DROP TABLE IF EXISTS `dim_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_campaigns` (
  `CampaignID` int NOT NULL,
  `Name` varchar(255) NOT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `Budget` decimal(10,2) DEFAULT NULL,
  `Objective` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CampaignID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_campaigns`
--

LOCK TABLES `dim_campaigns` WRITE;
/*!40000 ALTER TABLE `dim_campaigns` DISABLE KEYS */;
INSERT INTO `dim_campaigns` VALUES (1,'Summer Sale 2024','2024-06-01','2024-08-31',5000000.00,'Increase Sales'),(2,'Back to School 2024','2024-08-01','2024-09-30',3000000.00,'Engage Students'),(3,'Holiday Sale 2024','2024-11-01','2024-12-31',7000000.00,'Boost Holiday Sales'),(4,'New Year Promotion 2025','2024-12-15','2025-01-15',4000000.00,'Attract New Customers');
/*!40000 ALTER TABLE `dim_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_channels`
--

DROP TABLE IF EXISTS `dim_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_channels` (
  `ChannelID` int NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text,
  PRIMARY KEY (`ChannelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_channels`
--

LOCK TABLES `dim_channels` WRITE;
/*!40000 ALTER TABLE `dim_channels` DISABLE KEYS */;
INSERT INTO `dim_channels` VALUES (1,'Facebook Ads','Advertising on Facebook'),(2,'Google Ads','Advertising on Google'),(3,'Instagram Ads','Advertising on Instagram'),(4,'Email Marketing','Promotional emails to customers');
/*!40000 ALTER TABLE `dim_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_customers`
--

DROP TABLE IF EXISTS `dim_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_customers` (
  `CustomerID` int NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_customers`
--

LOCK TABLES `dim_customers` WRITE;
/*!40000 ALTER TABLE `dim_customers` DISABLE KEYS */;
INSERT INTO `dim_customers` VALUES (1,'Nguyen Van A','nva@example.com','0123456789','1990-05-15','Hanoi',33,'Male'),(2,'Tran Thi B','ttb@example.com','0987654321','1985-10-22','Ho Chi Minh City',38,'Female'),(3,'Le Van C','lvc@example.com','0123456780','1992-01-10','Da Nang',32,'Male'),(4,'Nguyen Thi D','ntd@example.com','0987654320','1988-03-22','Hai Phong',36,'Female'),(5,'Tran Van E','tve@example.com','0123456790','1985-12-15','Can Tho',38,'Male');
/*!40000 ALTER TABLE `dim_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_prodcategory`
--

DROP TABLE IF EXISTS `dim_prodcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_prodcategory` (
  `CategoryID` int NOT NULL,
  `CategoryName` varchar(255) NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_prodcategory`
--

LOCK TABLES `dim_prodcategory` WRITE;
/*!40000 ALTER TABLE `dim_prodcategory` DISABLE KEYS */;
INSERT INTO `dim_prodcategory` VALUES (1,'Electronics'),(2,'Mobiles'),(3,'Tablets'),(4,'Wearables');
/*!40000 ALTER TABLE `dim_prodcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_products`
--

DROP TABLE IF EXISTS `dim_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_products` (
  `ProductID` int NOT NULL,
  `SupplierID` int DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `CategoryID` int DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Description` text,
  PRIMARY KEY (`ProductID`),
  KEY `SupplierID` (`SupplierID`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `dim_products_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `dim_suppliers` (`SupplierID`),
  CONSTRAINT `dim_products_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `dim_prodcategory` (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_products`
--

LOCK TABLES `dim_products` WRITE;
/*!40000 ALTER TABLE `dim_products` DISABLE KEYS */;
INSERT INTO `dim_products` VALUES (1,1,'Laptop',1,15000000.00,'High-end laptop'),(2,2,'Smartphone',2,7000000.00,'Latest model smartphone'),(3,3,'Tablet',1,9000000.00,'Latest model tablet'),(4,4,'Smartwatch',2,3000000.00,'Water-resistant smartwatch');
/*!40000 ALTER TABLE `dim_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dim_suppliers`
--

DROP TABLE IF EXISTS `dim_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_suppliers` (
  `SupplierID` int NOT NULL,
  `SupplierName` varchar(255) NOT NULL,
  `Contact` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Notes` text,
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_suppliers`
--

LOCK TABLES `dim_suppliers` WRITE;
/*!40000 ALTER TABLE `dim_suppliers` DISABLE KEYS */;
INSERT INTO `dim_suppliers` VALUES (1,'ABC Supplies','Mr. Le','contact@abc.com','123 ABC Street, Hanoi','Reliable supplier'),(2,'XYZ Co.','Ms. Pham','info@xyz.com','456 XYZ Avenue, Ho Chi Minh City','Fast delivery'),(3,'DEF Products','Mr. Nguyen','contact@def.com','789 DEF Boulevard, Hanoi','Good quality products'),(4,'GHI Supplies','Ms. Nguyen','info@ghi.com','101 GHI Road, Ho Chi Minh City','Excellent service');
/*!40000 ALTER TABLE `dim_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fact_interaction`
--

DROP TABLE IF EXISTS `fact_interaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fact_interaction` (
  `InteractionID` int NOT NULL,
  `CustomerID` int DEFAULT NULL,
  `ChannelID` int DEFAULT NULL,
  `CampaignID` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`InteractionID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `ChannelID` (`ChannelID`),
  KEY `CampaignID` (`CampaignID`),
  CONSTRAINT `fact_interaction_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `dim_customers` (`CustomerID`),
  CONSTRAINT `fact_interaction_ibfk_2` FOREIGN KEY (`ChannelID`) REFERENCES `dim_channels` (`ChannelID`),
  CONSTRAINT `fact_interaction_ibfk_3` FOREIGN KEY (`CampaignID`) REFERENCES `dim_campaigns` (`CampaignID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fact_interaction`
--

LOCK TABLES `fact_interaction` WRITE;
/*!40000 ALTER TABLE `fact_interaction` DISABLE KEYS */;
INSERT INTO `fact_interaction` VALUES (1,1,1,1,'2024-07-05','Click'),(2,2,2,2,'2024-09-02','View'),(3,3,3,3,'2024-11-05','Click'),(4,4,4,4,'2024-12-22','View'),(5,1,1,1,'2024-06-20','Click'),(6,2,2,2,'2024-09-03','View'),(7,3,3,3,'2024-11-01','Click'),(8,4,4,4,'2024-12-18','View'),(9,1,1,1,'2024-06-02','Click'),(10,1,1,1,'2024-06-10','View'),(11,2,1,1,'2024-06-15','Share'),(12,3,1,1,'2024-06-18','Like'),(13,3,2,1,'2024-06-18','Like'),(14,1,2,1,'2024-06-05','View'),(15,2,2,1,'2024-06-12','Click'),(16,3,2,1,'2024-06-20','Share'),(17,4,4,1,'2024-06-23','Like'),(18,1,2,2,'2024-08-02','View'),(19,4,2,2,'2024-08-05','Click'),(20,5,2,2,'2024-08-08','Like'),(21,2,2,2,'2024-08-12','View'),(22,1,3,2,'2024-08-01','Click'),(23,3,3,2,'2024-08-03','Share'),(24,4,3,2,'2024-08-04','Like'),(25,2,3,2,'2024-08-10','View'),(26,2,4,3,'2024-11-03','Click'),(27,3,4,3,'2024-11-06','View'),(28,4,4,3,'2024-11-08','Click'),(29,5,4,3,'2024-11-10','View'),(30,2,3,3,'2024-11-02','Click'),(31,3,3,3,'2024-11-04','Share'),(32,1,3,3,'2024-11-05','Like'),(33,5,3,3,'2024-11-09','View'),(34,4,4,4,'2024-12-20','View'),(35,5,4,4,'2024-12-22','Click'),(36,1,4,4,'2024-12-24','Like'),(37,3,4,4,'2024-12-26','View'),(38,2,1,4,'2024-12-19','Click'),(39,3,1,4,'2024-12-21','Like'),(40,4,1,4,'2024-12-23','View'),(41,5,1,4,'2024-12-27','Share');
/*!40000 ALTER TABLE `fact_interaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetail` (
  `ID` int NOT NULL,
  `OrderID` int DEFAULT NULL,
  `ProductID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Revenue` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `OrderID` (`OrderID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `dim_products` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
INSERT INTO `orderdetail` VALUES (1,1,1,2,30000000.00),(2,2,2,1,7000000.00),(3,3,3,1,9000000.00),(4,4,4,2,6000000.00),(5,5,1,1,15000000.00),(6,5,3,1,9000000.00),(7,6,2,2,14000000.00),(8,7,3,3,27000000.00),(9,8,4,1,3000000.00);
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL,
  `CustomerID` int DEFAULT NULL,
  `Created_at` datetime DEFAULT NULL,
  `CampaignID` int DEFAULT NULL,
  `ShippedDate` date DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `CampaignID` (`CampaignID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `dim_customers` (`CustomerID`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`CampaignID`) REFERENCES `dim_campaigns` (`CampaignID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2024-07-10 14:30:00',1,'2024-07-15'),(2,2,'2024-09-05 10:00:00',2,'2024-09-10'),(3,3,'2024-11-10 11:00:00',3,'2024-11-15'),(4,4,'2024-12-20 09:30:00',4,'2024-12-25'),(5,1,'2024-07-15 10:00:00',1,'2024-07-20'),(6,2,'2024-09-10 15:45:00',2,'2024-09-15'),(7,3,'2024-11-12 12:30:00',3,'2024-11-18'),(8,4,'2024-12-25 09:00:00',4,'2024-12-30'),(9,1,'2024-06-15 11:45:00',1,'2024-06-18'),(10,2,'2024-06-17 14:00:00',1,'2024-06-20'),(11,3,'2024-06-25 10:30:00',1,'2024-06-28'),(12,4,'2024-06-30 08:15:00',1,'2024-07-02'),(13,5,'2024-08-01 13:00:00',2,'2024-08-05'),(14,1,'2024-08-07 16:20:00',2,'2024-08-10'),(15,2,'2024-08-12 12:45:00',2,'2024-08-15'),(16,3,'2024-08-18 09:00:00',2,'2024-08-20'),(17,4,'2024-11-10 11:30:00',3,'2024-11-15'),(18,5,'2024-11-15 15:00:00',3,'2024-11-18'),(19,2,'2024-11-20 10:10:00',3,'2024-11-23'),(20,3,'2024-11-22 09:45:00',3,'2024-11-25'),(21,1,'2024-12-18 10:30:00',4,'2024-12-22'),(22,3,'2024-12-20 14:40:00',4,'2024-12-25'),(23,4,'2024-12-24 09:50:00',4,'2024-12-28'),(24,5,'2024-12-28 16:30:00',4,'2025-01-02'),(25,1,'2024-06-02 10:30:00',1,'2024-06-06'),(28,5,'2024-08-01 13:00:00',2,'2024-08-05'),(29,2,'2024-08-03 11:40:00',2,'2024-08-07'),(32,4,'2024-08-14 16:00:00',2,'2024-08-17'),(33,5,'2024-08-16 10:35:00',2,'2024-08-18'),(34,1,'2024-11-01 08:50:00',3,'2024-11-05'),(35,3,'2024-11-08 14:30:00',3,'2024-11-12'),(36,4,'2024-11-11 10:00:00',3,'2024-11-15'),(37,2,'2024-11-13 13:45:00',3,'2024-11-17'),(38,5,'2024-11-17 09:10:00',3,'2024-11-21'),(40,3,'2024-12-21 15:30:00',4,'2024-12-25'),(41,5,'2024-12-27 16:30:00',4,'2024-12-31');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'marketing_database'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-04 23:57:30
