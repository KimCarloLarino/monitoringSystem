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
-- Table structure for table `tblnotification`
--

DROP TABLE IF EXISTS `tblnotification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblnotification` (
  `notifId` varchar(10) NOT NULL,
  `notifSessionId` varchar(10) NOT NULL,
  `notifTime` datetime NOT NULL,
  `notifType` varchar(50) NOT NULL,
  `notifNameDescription` mediumtext NOT NULL,
  PRIMARY KEY (`notifId`),
  KEY `tblnotification_ibfk_1` (`notifSessionId`),
  CONSTRAINT `tblnotification_ibfk_1` FOREIGN KEY (`notifSessionId`) REFERENCES `tblsession` (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblnotification`
--

LOCK TABLES `tblnotification` WRITE;
/*!40000 ALTER TABLE `tblnotification` DISABLE KEYS */;
INSERT INTO `tblnotification` VALUES ('0001','123456789','2024-06-06 12:16:00','Student Login','Kim Carlo Larino has started his session'),('0002','123456789','2024-06-06 14:16:00','Student Logout','Kim Carlo Larino has ended his session');
/*!40000 ALTER TABLE `tblnotification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblprocess`
--

DROP TABLE IF EXISTS `tblprocess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblprocess` (
  `processId` varchar(10) NOT NULL,
  `processSessionId` varchar(10) NOT NULL,
  `processName` varchar(255) NOT NULL,
  `processStartTime` datetime NOT NULL,
  `processEndTime` datetime NOT NULL,
  PRIMARY KEY (`processId`),
  KEY `tblprocess_ibfk_1` (`processSessionId`),
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
  `sessionId` varchar(10) NOT NULL,
  `sessionUserId` varchar(10) NOT NULL,
  `sessionStartTime` datetime DEFAULT NULL,
  `sessionEndTime` datetime DEFAULT NULL,
  `sessionDuration` varchar(10) DEFAULT NULL,
  `sessionStatus` varchar(20) NOT NULL,
  PRIMARY KEY (`sessionId`),
  UNIQUE KEY `sessionId_UNIQUE` (`sessionId`),
  KEY `tblsession_ibfk_1` (`sessionUserId`),
  CONSTRAINT `tblsession_ibfk_1` FOREIGN KEY (`sessionUserId`) REFERENCES `tbluser` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsession`
--

LOCK TABLES `tblsession` WRITE;
/*!40000 ALTER TABLE `tblsession` DISABLE KEYS */;
INSERT INTO `tblsession` VALUES ('123456789','2021-10589','2024-06-05 15:16:00','2024-06-05 17:16:00','02:00:00','Finished'),('987654321','2021-10589','2024-06-06 12:16:00','2024-06-06 12:16:00','','On-Going');
/*!40000 ALTER TABLE `tblsession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetting`
--

DROP TABLE IF EXISTS `tblsetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblsetting` (
  `settingSessionId` varchar(10) NOT NULL,
  `settingName` varchar(255) NOT NULL,
  `settingType` enum('Feature','Program','Website') NOT NULL,
  `settingWhitelistBlacklist` enum('Whitelist','Blacklist') NOT NULL,
  `settingBlockNotification` enum('Block','Notification') NOT NULL,
  PRIMARY KEY (`settingSessionId`)
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
  `userId` varchar(10) NOT NULL,
  `userEmail` varchar(64) NOT NULL,
  `userPassword` varchar(64) NOT NULL,
  `userRole` varchar(20) NOT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `tbluser_chk_1` CHECK ((`userRole` in (_utf8mb4'Student',_utf8mb4'Professor',_utf8mb4'Employee',_utf8mb4'Leader',_utf8mb4'Admin')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbluser`
--

LOCK TABLES `tbluser` WRITE;
/*!40000 ALTER TABLE `tbluser` DISABLE KEYS */;
INSERT INTO `tbluser` VALUES ('2003-10001','janalbert.julian@lpulaguna.edu.ph','1234','Professor'),('2021-10091','christophergalano@lpulaguna.edu.ph','1234','Student'),('2021-10589','kimcarlolarino@lpulaguna.edu.ph','1234','Student'),('2021-10674','reymondcalinog@lpulaguna.edu.ph','1234','Student');
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

-- Dump completed on 2024-06-06 16:49:57
