CREATE DATABASE  IF NOT EXISTS `tiideair` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tiideair`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tiideair
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `flightschedules`
--

DROP TABLE IF EXISTS `flightschedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flightschedules` (
  `flight_number` int NOT NULL AUTO_INCREMENT,
  `airline_code` varchar(45) DEFAULT NULL,
  `departure_date_time` datetime DEFAULT NULL,
  `arival_date_time` datetime DEFAULT NULL,
  `origin_airport_code` varchar(45) DEFAULT NULL,
  `destination_airport_code` varchar(45) DEFAULT NULL,
  `destination` varchar(50) DEFAULT NULL,
  `arrival_city` varchar(50) DEFAULT NULL,
  `departure_city` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`flight_number`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flightschedules`
--

LOCK TABLES `flightschedules` WRITE;
/*!40000 ALTER TABLE `flightschedules` DISABLE KEYS */;
INSERT INTO `flightschedules` VALUES (1,'GH3255','2020-03-10 02:30:30','2020-03-10 06:20:30','MMA2','GHA524','Canada','Ontario','Abuja'),(2,'VS141','2020-04-08 07:00:20','2020-04-08 09:00:00','EIA','DAL444','USA','Dallas','Enugu'),(3,'YUY523','2020-02-25 12:09:10','2020-02-25 02:45:10','MMI','KUM23','Ghana','Accra','Lagos');
/*!40000 ALTER TABLE `flightschedules` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-17  2:43:36
