-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: db_monitoring_system
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `tblaccesscontrol`
--

DROP TABLE IF EXISTS `tblaccesscontrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblaccesscontrol` (
  `accessControlId` int NOT NULL,
  `accessControlUserId` int DEFAULT NULL,
  `accessControlSettingId` int DEFAULT NULL,
  `accessControlAccessLevel` enum('view','edit','delete') DEFAULT NULL,
  PRIMARY KEY (`accessControlId`),
  KEY `accessControlUserId` (`accessControlUserId`),
  KEY `accessControlSettingId` (`accessControlSettingId`),
  CONSTRAINT `tblaccesscontrol_ibfk_1` FOREIGN KEY (`accessControlUserId`) REFERENCES `tbluser` (`userId`),
  CONSTRAINT `tblaccesscontrol_ibfk_2` FOREIGN KEY (`accessControlSettingId`) REFERENCES `tblsetting` (`settingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblaccesscontrol`
--

LOCK TABLES `tblaccesscontrol` WRITE;
/*!40000 ALTER TABLE `tblaccesscontrol` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblaccesscontrol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblnotification`
--

DROP TABLE IF EXISTS `tblnotification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblnotification` (
  `notifId` int NOT NULL,
  `notifSessionId` int DEFAULT NULL,
  `notifTime` datetime DEFAULT NULL,
  `notifType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`notifId`),
  KEY `notifSessionId` (`notifSessionId`),
  CONSTRAINT `tblnotification_ibfk_1` FOREIGN KEY (`notifSessionId`) REFERENCES `tblsession` (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblnotification`
--

LOCK TABLES `tblnotification` WRITE;
/*!40000 ALTER TABLE `tblnotification` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblnotification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblprocess`
--

DROP TABLE IF EXISTS `tblprocess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblprocess` (
  `processId` int NOT NULL,
  `processSessionId` int DEFAULT NULL,
  `processName` varchar(255) DEFAULT NULL,
  `processStartTime` datetime DEFAULT NULL,
  `processEndTime` datetime DEFAULT NULL,
  PRIMARY KEY (`processId`),
  KEY `processSessionId` (`processSessionId`),
  CONSTRAINT `tblprocess_ibfk_1` FOREIGN KEY (`processSessionId`) REFERENCES `tblsession` (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblprocess`
--

LOCK TABLES `tblprocess` WRITE;
/*!40000 ALTER TABLE `tblprocess` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblprocess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsession`
--

DROP TABLE IF EXISTS `tblsession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblsession` (
  `sessionId` int NOT NULL,
  `sessionUserId` int DEFAULT NULL,
  `sessionStartTime` datetime DEFAULT NULL,
  `sessionEndTime` datetime DEFAULT NULL,
  `sessionDuration` int DEFAULT NULL,
  PRIMARY KEY (`sessionId`),
  KEY `sessionUserId` (`sessionUserId`),
  CONSTRAINT `tblsession_ibfk_1` FOREIGN KEY (`sessionUserId`) REFERENCES `tbluser` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsession`
--

LOCK TABLES `tblsession` WRITE;
/*!40000 ALTER TABLE `tblsession` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblsession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetting`
--

DROP TABLE IF EXISTS `tblsetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblsetting` (
  `settingId` int NOT NULL,
  `settingName` varchar(255) DEFAULT NULL,
  `settingType` enum('feature','program','website') DEFAULT NULL,
  `settingWhitelistBlacklist` enum('whitelist','blacklist') DEFAULT NULL,
  `settingBlockNotification` enum('block','notification') DEFAULT NULL,
  PRIMARY KEY (`settingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetting`
--

LOCK TABLES `tblsetting` WRITE;
/*!40000 ALTER TABLE `tblsetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblsetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbluser`
--

DROP TABLE IF EXISTS `tbluser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbluser` (
  `userId` int NOT NULL,
  `userEmail` varchar(64) DEFAULT NULL,
  `userPassword` varchar(64) DEFAULT NULL,
  `userRole` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `tbluser_chk_1` CHECK ((`userRole` in (_utf8mb4'student',_utf8mb4'professor')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbluser`
--

LOCK TABLES `tbluser` WRITE;
/*!40000 ALTER TABLE `tbluser` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbluser` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-06 14:00:40
