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
-- Table structure for table `Ingredient`
--

DROP TABLE IF EXISTS `Ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ingredient` (
  `ingredient_id` int NOT NULL,
  `Calories` int DEFAULT NULL,
  `fiber` int DEFAULT NULL,
  `Carbohydrates` int DEFAULT NULL,
  `fat` int DEFAULT NULL,
  `Saturated_Fat` int DEFAULT NULL,
  `Sodium` int DEFAULT NULL,
  `Sugar` int DEFAULT NULL,
  `vitamin_d` int DEFAULT NULL,
  `Calcium` int DEFAULT NULL,
  `Iron` int DEFAULT NULL,
  `Potassium` int DEFAULT NULL,
  `ingredient_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ingredient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ingredient`
--

LOCK TABLES `Ingredient` WRITE;
/*!40000 ALTER TABLE `Ingredient` DISABLE KEYS */;
INSERT INTO `Ingredient` VALUES (1,150,2,30,1,1,20,5,0,20,1,100,'Pasta'),(2,50,2,10,0,0,300,5,0,30,1,150,'Tomato Sauce'),(3,250,0,0,20,8,70,0,0,20,2,300,'Beef'),(4,120,3,20,4,1,220,2,0,40,1,100,'Tortillas'),(5,130,1,28,1,0,10,2,0,10,0,30,'Sushi Rice'),(6,5,0,1,0,0,50,0,0,5,0,20,'Nori'),(7,60,2,12,1,0,2,6,0,15,1,30,'Blueberries'),(8,80,0,12,2,1,50,12,1,100,0,150,'Milk'),(9,200,0,0,20,5,300,0,0,20,2,250,'Chicken'),(10,150,2,15,10,2,400,5,0,20,1,100,'Curry Sauce'),(11,70,3,15,2,0,10,3,0,20,1,200,'Mixed Vegetables'),(12,180,2,35,3,1,200,3,0,40,2,150,'Noodles'),(13,60,2,12,1,0,10,6,0,15,1,30,'Beetroot'),(14,30,1,7,0,0,2,4,0,5,0,20,'Vegetables'),(15,200,1,30,6,1,400,2,0,30,3,500,'Seafood'),(16,150,1,33,1,0,0,0,0,10,0,30,'Rice'),(17,260,1,28,15,9,200,5,1,20,1,100,'Croissant Dough'),(18,100,0,0,11,7,80,0,1,20,0,30,'Butter'),(19,250,0,0,20,8,70,0,0,20,2,300,'Lamb'),(20,50,0,12,0,0,100,10,0,20,0,50,'Marinade');
/*!40000 ALTER TABLE `Ingredient` ENABLE KEYS */;
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
