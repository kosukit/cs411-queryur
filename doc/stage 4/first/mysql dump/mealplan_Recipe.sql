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
-- Table structure for table `Recipe`
--

DROP TABLE IF EXISTS `Recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Recipe` (
  `recipe_id` int NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `recipe_name` varchar(255) DEFAULT NULL,
  `instructions` text,
  `img_url` varchar(255) DEFAULT NULL,
  `cook_mins` int DEFAULT NULL,
  PRIMARY KEY (`recipe_id`),
  KEY `email` (`email`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `recipe_ibfk_1` FOREIGN KEY (`email`) REFERENCES `Student` (`email`),
  CONSTRAINT `recipe_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `Category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recipe`
--

LOCK TABLES `Recipe` WRITE;
/*!40000 ALTER TABLE `Recipe` DISABLE KEYS */;
INSERT INTO `Recipe` VALUES (1,'alice@illinois.edu',1,'Classic Spaghetti','Boil pasta, cook sauce, mix together.','image/classic_spaghetti.jpg',30),(2,'bob@illinois.edu',2,'Beef Tacos','Cook beef, assemble tacos with toppings.','image/beef_tacos.jpg',20),(3,'charlie@illinois.edu',3,'Sushi Rolls','Prepare rice, roll with fish and vegetables.','image/sushi_rolls.jpg',40),(4,'diana@illinois.edu',4,'Blueberry Pancakes','Mix ingredients, cook on griddle.','image/blueberry_pancakes.jpg',15),(5,'eve@illinois.edu',5,'Chicken Curry','Cook chicken, add spices and simmer.','image/chicken_curry.jpg',45),(6,'alice@illinois.edu',6,'Vegetable Chow Mein','Stir fry vegetables, add noodles and sauce.','image/vegetable_chow_mein.jpg',25),(7,'bob@illinois.edu',7,'Traditional Borscht','Boil beets, add vegetables and simmer.','image/traditional_borscht.jpg',60),(8,'charlie@illinois.edu',8,'Seafood Paella','Cook rice, add seafood and simmer.','image/seafood_paella.jpg',50),(9,'diana@illinois.edu',9,'Buttery Croissant','Prepare dough, bake until golden.','image/buttery_croissant.jpg',180),(10,'eve@illinois.edu',10,'Lamb Kebab','Marinate lamb, grill on skewers.','image/lamb_kebab.jpg',35);
/*!40000 ALTER TABLE `Recipe` ENABLE KEYS */;
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
