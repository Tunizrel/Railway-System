CREATE DATABASE  IF NOT EXISTS `traindb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `traindb`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: traindb
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `Bid` varchar(10) NOT NULL,
  `Price` int NOT NULL,
  `Seat_no` int NOT NULL,
  `Pid` varchar(100) NOT NULL,
  `Tid` varchar(10) NOT NULL,
  `Class` varchar(10) NOT NULL,
  PRIMARY KEY (`Bid`),
  KEY `Pid` (`Pid`),
  KEY `Tid` (`Tid`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`Pid`) REFERENCES `passenger` (`Pid`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`Tid`) REFERENCES `train` (`Tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Eid` varchar(10) NOT NULL,
  `Name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Address` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Phone_no` int NOT NULL,
  `Email` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Gender` char(1) NOT NULL,
  `Tid` varchar(10) DEFAULT NULL,
  `Sid` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Eid`),
  KEY `Tid` (`Tid`),
  KEY `Sid` (`Sid`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`Tid`) REFERENCES `train` (`Tid`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`Sid`) REFERENCES `station` (`Sid`),
  CONSTRAINT `fk_train_tid` FOREIGN KEY (`Tid`) REFERENCES `train` (`Tid`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `Pid` varchar(10) NOT NULL,
  `Name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Address` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Phone_no` int NOT NULL,
  `Email` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Gender` char(1) NOT NULL,
  PRIMARY KEY (`Pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `station` (
  `Sid` varchar(10) NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Location` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`Sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stop_at`
--

DROP TABLE IF EXISTS `stop_at`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stop_at` (
  `Time` date DEFAULT NULL,
  `Sid` varchar(10) NOT NULL,
  `Tid` varchar(10) NOT NULL,
  PRIMARY KEY (`Sid`),
  KEY `Tid` (`Tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train` (
  `Tid` varchar(10) NOT NULL,
  `Brand` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `No_seat` int NOT NULL,
  `Departure_time` date NOT NULL,
  `Arrival_time` date NOT NULL,
  `DT_Id` varchar(10) NOT NULL,
  `A_Id` varchar(10) NOT NULL,
  `Coach_id` varchar(10) DEFAULT NULL,
  `Sid` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Tid`),
  KEY `DT_Id` (`DT_Id`),
  KEY `A_Id` (`A_Id`),
  KEY `Sid` (`Sid`),
  KEY `Coach_id` (`Coach_id`),
  CONSTRAINT `train_ibfk_1` FOREIGN KEY (`DT_Id`) REFERENCES `station` (`Sid`),
  CONSTRAINT `train_ibfk_2` FOREIGN KEY (`A_Id`) REFERENCES `station` (`Sid`),
  CONSTRAINT `train_ibfk_3` FOREIGN KEY (`Sid`) REFERENCES `station` (`Sid`),
  CONSTRAINT `train_ibfk_4` FOREIGN KEY (`Coach_id`) REFERENCES `employee` (`Eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `username` varchar(45) DEFAULT NULL,
  `pass` varchar(45) DEFAULT NULL,
  `Pid` varchar(100) DEFAULT NULL,
  KEY `Pid_idx` (`Pid`),
  CONSTRAINT `Pid` FOREIGN KEY (`Pid`) REFERENCES `passenger` (`Pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-05 14:44:27
