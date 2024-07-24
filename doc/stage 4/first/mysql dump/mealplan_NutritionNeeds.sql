CREATE DATABASE  IF NOT EXISTS `mealplan` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mealplan`;
-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (x86_64)
--
-- Host: 127.0.0.1    Database: mealplan
-- ------------------------------------------------------
-- Server version	9.0.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `NutritionNeeds`
--

DROP TABLE IF EXISTS `NutritionNeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NutritionNeeds` (
  `email` varchar(255) NOT NULL,
  `Calories` int DEFAULT NULL,
  `fiber` int DEFAULT NULL,
  `Carbohydrates` int DEFAULT NULL,
  `fat` int DEFAULT NULL,
  `Sodium` int DEFAULT NULL,
  `Sugar` int DEFAULT NULL,
  `vitamin_d` int DEFAULT NULL,
  `Calcium` int DEFAULT NULL,
  `Iron` int DEFAULT NULL,
  `Potassium` int DEFAULT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `nutritionneeds_ibfk_1` FOREIGN KEY (`email`) REFERENCES `Student` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NutritionNeeds`
--

LOCK TABLES `NutritionNeeds` WRITE;
/*!40000 ALTER TABLE `NutritionNeeds` DISABLE KEYS */;
INSERT INTO `NutritionNeeds` VALUES ('alice@illinois.edu',2000,25,275,70,2300,50,15,1000,18,3500),('bob@illinois.edu',2500,30,300,80,2400,60,20,1200,20,4000),('charlie@illinois.edu',1800,28,250,65,2200,55,10,900,16,3200),('diana@illinois.edu',2200,26,280,75,2350,53,18,1100,19,3600),('eve@illinois.edu',2100,27,290,72,2250,58,12,1050,17,3400);
/*!40000 ALTER TABLE `NutritionNeeds` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-23 22:39:10
