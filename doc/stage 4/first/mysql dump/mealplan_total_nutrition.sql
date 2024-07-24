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
-- Table structure for table `total_nutrition`
--

DROP TABLE IF EXISTS `total_nutrition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `total_nutrition` (
  `recipe_id` int NOT NULL,
  `total_calorie` decimal(32,0) DEFAULT NULL,
  `total_fiber` decimal(32,0) DEFAULT NULL,
  `total_carbohydrates` decimal(32,0) DEFAULT NULL,
  `total_fat` decimal(32,0) DEFAULT NULL,
  `total_saturated_fat` decimal(32,0) DEFAULT NULL,
  `total_sodium` decimal(32,0) DEFAULT NULL,
  `total_sugar` decimal(32,0) DEFAULT NULL,
  `total_vitamin_d` decimal(32,0) DEFAULT NULL,
  `total_calcium` decimal(32,0) DEFAULT NULL,
  `total_iron` decimal(32,0) DEFAULT NULL,
  `total_potassium` decimal(32,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `total_nutrition`
--

LOCK TABLES `total_nutrition` WRITE;
/*!40000 ALTER TABLE `total_nutrition` DISABLE KEYS */;
INSERT INTO `total_nutrition` VALUES (1,200,4,40,1,1,320,10,0,50,2,250),(2,370,3,20,24,9,290,2,0,60,3,400),(3,135,1,29,1,0,60,2,0,15,0,50),(4,140,2,24,3,1,52,18,1,115,1,180),(5,350,2,15,30,7,700,5,0,40,3,350),(6,250,5,50,5,1,210,6,0,60,3,350),(7,90,3,19,1,0,12,10,0,20,1,50),(8,350,2,63,7,1,400,2,0,40,3,530),(9,360,1,28,26,16,280,5,2,40,1,130),(10,300,0,12,20,8,170,10,0,40,2,350);
/*!40000 ALTER TABLE `total_nutrition` ENABLE KEYS */;
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
