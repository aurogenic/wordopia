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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userID` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `emailID` varchar(320) NOT NULL,
  `password` varchar(45) NOT NULL,
  `followersCount` int NOT NULL DEFAULT '0',
  `followersList` mediumtext NOT NULL,
  `followingCount` int NOT NULL,
  `followingList` mediumtext NOT NULL,
  `postCount` int NOT NULL,
  `posts` mediumtext NOT NULL,
  `feed` mediumtext NOT NULL,
  `createdDate` date NOT NULL,
  `likedPosts` text NOT NULL,
  `savedPosts` mediumtext NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('longlostAuthor','The Author','test2@gmail.com','rahul15vs',2,'test1;;samed;',1,'test1',2,'longlostAuthor_I Wandered Lonely as a Cloud;longlostAuthor_SOCIAL ENGINEERING:','RMH_Doraemons Time-Traveling Adventure;piii_The Untold Story OF Shinchan;;test1_How to start a stroy;test1_fall;test1_Cooking Lessons ','2023-12-29','longlostAuthor_I Wandered Lonely as a Cloud;test1_Cooking Lessons ;','test1_words;test1_The Enchanted Lighthouse;'),('piii','priya patil','piii@gmail.com','priyapatil',1,'test1',2,'test1;RMH',1,'piii_The Untold Story OF Shinchan;','RMH_Doraemons Time-Traveling Adventure;piii_The Untold Story OF Shinchan;','2024-01-11','',''),('RMH','Rajani M H','rajani@gmail.com','123456789',3,'piii;test1;RMH',1,'RMH',1,'RMH_Doraemons Time-Traveling Adventure;',';','2024-01-11','RMH_Doraemons Time-Traveling Adventure','RMH_Doraemons Time-Traveling Adventure;'),('samed','samed','samed@gmail.com','samed',0,'',1,'longlostAuthor',0,'','RMH_Doraemons Time-Traveling Adventure;piii_The Untold Story OF Shinchan;;','2024-01-01','test1_fall;longlostAuthor_SOCIAL ENGINEERING:','test1_How to start a stroy;test1_words;test1_The Enchanted Lighthouse;'),('test1','testUser','test1@gmail.com','rahul15vs',3,'piii;test1;;longlostAuthor',4,'piii;test1;RMH;;longlostAuthor;',5,'test1_The Enchanted Lighthouse;test1_words;test1_How to start a stroy;test1_fall;test1_Cooking Lessons ',';','2023-12-27','piii_The Untold Story OF Shinchan;;RMH_Doraemons Time-Traveling Adventure;longlostAuthor_I Wandered Lonely as a Cloud;longlostAuthor_SOCIAL ENGINEERING:;test1_How to start a stroy;test1_The Enchanted Lighthouse;test1_Cooking Lessons ','piii_The Untold Story OF Shinchan;;test1_Cooking Lessons ;test1_words;test1_How to start a stroy;longlostAuthor_I Wandered Lonely as a Cloud;');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-13 15:25:45
