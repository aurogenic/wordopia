CREATE DATABASE  IF NOT EXISTS `wordopia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `wordopia`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: wordopia
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `userstable`
--

DROP TABLE IF EXISTS `userstable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userstable` (
  `userID` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `emailID` varchar(320) NOT NULL,
  `password` varchar(45) NOT NULL,
  `followersCount` int NOT NULL DEFAULT '0',
  `followersList` json NOT NULL,
  `followingCount` int NOT NULL,
  `followingList` json NOT NULL,
  `postCount` int NOT NULL,
  `posts` json NOT NULL,
  `feed` json NOT NULL,
  `createdDate` date NOT NULL,
  `likedPosts` json NOT NULL,
  `savedPosts` json NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userstable`
--

LOCK TABLES `userstable` WRITE;
/*!40000 ALTER TABLE `userstable` DISABLE KEYS */;
INSERT INTO `userstable` VALUES ('longlostAuthor','The Author','test2@gmail.com','rahul15vs',3,'[\"test1\", \"puneet\", \"samed\"]',0,'[]',2,'[\"longlostAuthor~I Wandered Lonely as a Cloud\", \"longlostAuthor~SOCIAL ENGINEERING:\"]','[\"puneet~Rediscovering Ancient Dwaraka: A Marvel of Ancient Civilization\", \"test1~The Enduring Legacy of Spider-Man: Weaving a Cinematic Web\", \"test1~Quantum Entanglement: The Mysterious Dance of Interconnected Particles\", \"test1~Navigating the Digital Frontier: The Imperative of Cybersecurity\", \"puneet~Biosynthesis: Unraveling Natures Molecular Symphony\"]','2023-12-29','[\"test1~Embracing Tomorrow: The Unstoppable Rise of Automation\", \"puneet~Quantum Computing\", \"longlostAuthor~I Wandered Lonely as a Cloud\", \"puneet~ Black Holes: Cosmic Enigmas Shrouded in Darkness\"]','[\"test1~Embracing Tomorrow: The Unstoppable Rise of Automation\", \"test1~words\", \"test1~The Enchanted Lighthouse\"]'),('piii','priya patil','piii@gmail.com','priyapatil',2,'[\"test1\", \"samed\"]',2,'[\"test1\", \"RMH\"]',1,'[\"piii~The Untold Story OF Shinchan\"]','[]','2024-01-11','[\"test1~The Enduring Legacy of Spider-Man: Weaving a Cinematic Web\", \"test1~Quantum Entanglement: The Mysterious Dance of Interconnected Particles\", \"puneet~ Black Holes: Cosmic Enigmas Shrouded in Darkness\", \"puneet~The Rise of Artificial Intelligence in Everyday Life\", \"test1~The Enchanted Lighthouse\"]','[\"test1~The Enchanted Lighthouse\", \"puneet~ Black Holes: Cosmic Enigmas Shrouded in Darkness\", \"puneet~The Rise of Artificial Intelligence in Everyday Life\"]'),('pratik_','prateek','prateek@gmail.com','prateek',0,'[]',0,'[]',0,'[]','[\"puneet~Rediscovering Ancient Dwaraka: A Marvel of Ancient Civilization\", \"test1~The Enduring Legacy of Spider-Man: Weaving a Cinematic Web\", \"test1~Quantum Entanglement: The Mysterious Dance of Interconnected Particles\", \"test1~Navigating the Digital Frontier: The Imperative of Cybersecurity\", \"puneet~Biosynthesis: Unraveling Natures Molecular Symphony\", \"test1~Embracing Tomorrow: The Unstoppable Rise of Automation\"]','2024-01-18','[\"longlostAuthor~I Wandered Lonely as a Cloud\"]','[]'),('puneet','puneet','puneet@gmail.com','rahul15vs',0,'[]',2,'[\"longlostAuthor\", \"test1\"]',5,'[\"puneet~Rediscovering Ancient Dwaraka: A Marvel of Ancient Civilization\", \"puneet~Biosynthesis: Unraveling Natures Molecular Symphony\", \"puneet~ Black Holes: Cosmic Enigmas Shrouded in Darkness\", \"puneet~Quantum Computing\", \"puneet~The Rise of Artificial Intelligence in Everyday Life\"]','[\"puneet~Rediscovering Ancient Dwaraka: A Marvel of Ancient Civilization\"]','2024-01-14','[\"test1~The Enduring Legacy of Spider-Man: Weaving a Cinematic Web\", \"test1~fall\", \"RMH~Doraemons Time-Traveling Adventure\", \"puneet~The Rise of Artificial Intelligence in Everyday Life\"]','[\"test1~Cooking Lessons \", \"puneet~The Rise of Artificial Intelligence in Everyday Life\"]'),('rahul_00','rahul','test3@gmail.com','rahul15vs',0,'[]',0,'[]',0,'[]','[\"puneet~Rediscovering Ancient Dwaraka: A Marvel of Ancient Civilization\", \"test1~The Enduring Legacy of Spider-Man: Weaving a Cinematic Web\", \"test1~Quantum Entanglement: The Mysterious Dance of Interconnected Particles\", \"test1~Navigating the Digital Frontier: The Imperative of Cybersecurity\", \"puneet~Biosynthesis: Unraveling Natures Molecular Symphony\", \"test1~Embracing Tomorrow: The Unstoppable Rise of Automation\"]','2024-01-20','[]','[]'),('rahul_di','rahul','rahuldi@gmail.com','rahul15vs',0,'[]',0,'[]',0,'[]','[\"puneet~Rediscovering Ancient Dwaraka: A Marvel of Ancient Civilization\", \"test1~The Enduring Legacy of Spider-Man: Weaving a Cinematic Web\", \"test1~Quantum Entanglement: The Mysterious Dance of Interconnected Particles\", \"test1~Navigating the Digital Frontier: The Imperative of Cybersecurity\", \"puneet~Biosynthesis: Unraveling Natures Molecular Symphony\", \"test1~Embracing Tomorrow: The Unstoppable Rise of Automation\"]','2024-01-20','[\"puneet~ Black Holes: Cosmic Enigmas Shrouded in Darkness\"]','[\"puneet~ Black Holes: Cosmic Enigmas Shrouded in Darkness\"]'),('RMH','Rajani M H','rajani@gmail.com','123456789',4,'[\"test1\", \"piii\", \"RMH\", \"samed\"]',1,'[\"RMH\"]',1,'[\"RMH~Doraemons Time-Traveling Adventure\"]','[\"puneet~Rediscovering Ancient Dwaraka: A Marvel of Ancient Civilization\", \"test1~The Enduring Legacy of Spider-Man: Weaving a Cinematic Web\"]','2024-01-11','[\"test1~Embracing Tomorrow: The Unstoppable Rise of Automation\", \"RMH~Doraemons Time-Traveling Adventure\"]','[\"RMH~Doraemons Time-Traveling Adventure\"]'),('samed','samed','samed@gmail.com','samed',0,'[]',4,'[\"longlostAuthor\", \"piii\", \"test1\", \"RMH\"]',0,'[]','[\"puneet~Rediscovering Ancient Dwaraka: A Marvel of Ancient Civilization\", \"test1~The Enduring Legacy of Spider-Man: Weaving a Cinematic Web\", \"test1~Quantum Entanglement: The Mysterious Dance of Interconnected Particles\", \"test1~Navigating the Digital Frontier: The Imperative of Cybersecurity\", \"puneet~Biosynthesis: Unraveling Natures Molecular Symphony\", \"test1~Embracing Tomorrow: The Unstoppable Rise of Automation\", \"puneet~The Rise of Artificial Intelligence in Everyday Life\", \"puneet~Quantum Computing\"]','2024-01-01','[\"123\", \"test1~fall\", \"longlostAuthor~SOCIAL ENGINEERING:\"]','[\"test1~The Enchanted Lighthouse\", \"test1~How to start a stroy\", \"test1~words\"]'),('test1','testUser','test1@gmail.com','rahul15vs',4,'[\"piii\", \"test1\", \"puneet\", \"samed\"]',3,'[\"test1\", \"RMH\", \"piii\"]',9,'[\"test1~The Enduring Legacy of Spider-Man: Weaving a Cinematic Web\", \"test1~Quantum Entanglement: The Mysterious Dance of Interconnected Particles\", \"test1~Navigating the Digital Frontier: The Imperative of Cybersecurity\", \"test1~Embracing Tomorrow: The Unstoppable Rise of Automation\", \"test1~The Enchanted Lighthouse\", \"test1~words\", \"test1~How to start a stroy\", \"test1~fall\", \"test1~Cooking Lessons \"]','[\"puneet~Rediscovering Ancient Dwaraka: A Marvel of Ancient Civilization\"]','2023-12-27','[\"puneet~Biosynthesis: Unraveling Natures Molecular Symphony\", \"test1~Navigating the Digital Frontier: The Imperative of Cybersecurity\", \"test1~Quantum Entanglement: The Mysterious Dance of Interconnected Particles\", \"test1~Embracing Tomorrow: The Unstoppable Rise of Automation\", \"longlostAuthor~I Wandered Lonely as a Cloud\", \"test1~Cooking Lessons \", \"test1~words\", \"test1~The Enchanted Lighthouse\", \"puneet~The Rise of Artificial Intelligence in Everyday Life\", \"puneet~Quantum Computing\", \"longlostAuthor~SOCIAL ENGINEERING:\", \"RMH~Doraemons Time-Traveling Adventure\"]','[\"test1~Embracing Tomorrow: The Unstoppable Rise of Automation\", \"piii~The Untold Story OF Shinchan\", \"longlostAuthor~I Wandered Lonely as a Cloud\", \"test1~words;test1~How to start a stroy\", \"test1~words\"]');
/*!40000 ALTER TABLE `userstable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-13 15:25:46
