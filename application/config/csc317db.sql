-- MySQL dump 10.13  Distrib 8.0.29, for macos12 (x86_64)
--
-- Host: localhost    Database: csc317db
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment` mediumtext NOT NULL,
  `fk_postId` int NOT NULL,
  `fk_authorId` int NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `comment_author_idx` (`fk_authorId`),
  KEY `comment_belongsTo_idx` (`fk_postId`),
  CONSTRAINT `comment_author` FOREIGN KEY (`fk_authorId`) REFERENCES `users` (`id`),
  CONSTRAINT `comment_belongsTo` FOREIGN KEY (`fk_postId`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'this is a test comment from curl',10,9,'2022-05-19 03:01:13'),(2,'this is a test comment from curl',10,9,'2022-05-19 03:04:00'),(3,'Comment',18,9,'2022-05-19 13:07:43');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `description` mediumtext NOT NULL,
  `photopath` varchar(2048) NOT NULL,
  `thumbnail` varchar(2048) NOT NULL,
  `active` int NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `fk_userId` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `post_author_idx` (`fk_userId`),
  CONSTRAINT `post_author` FOREIGN KEY (`fk_userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (7,'test 1 title','test 1 description','public/images/uploads/1dbfecc4abad74175d5b155cd5249945a284092954f8.png','public/images/uploads/thumbnail-1dbfecc4abad74175d5b155cd5249945a284092954f8.png',1,'2022-05-12 22:14:59',4),(8,'test 2 title','test 2 description','public/images/uploads/02ffb541d17180fe1a8d26885e8d2277bcddefe34cf8.png','public/images/uploads/thumbnail-02ffb541d17180fe1a8d26885e8d2277bcddefe34cf8.png',1,'2022-05-12 22:15:30',4),(9,'My First Post','Just trying this out and seeing what happens. This picture looks nice!','public/images/uploads/843dcfa4bfb8a6ade99f766eb0518f33b340ee8eb574.jpeg','public/images/uploads/thumbnail-843dcfa4bfb8a6ade99f766eb0518f33b340ee8eb574.jpeg',1,'2022-05-18 17:36:23',7),(10,'My 2nd Post','Thought I\'d upload another one to continue testing this out. With a longer caption. I hope the css doesn\'t look ugly because of this. That would be really annoying to fix!!!','public/images/uploads/864da7f1af3ee888e6472c7e637b1efde5b8ebfe0b02.jpeg','public/images/uploads/thumbnail-864da7f1af3ee888e6472c7e637b1efde5b8ebfe0b02.jpeg',1,'2022-05-18 17:38:03',7),(11,'Another one!','Yes, the css did get messed up on the last one.','public/images/uploads/066f9a122e704c27049dd898f0ba93a0b2033cbd42c9.jpeg','public/images/uploads/thumbnail-066f9a122e704c27049dd898f0ba93a0b2033cbd42c9.jpeg',1,'2022-05-18 17:47:23',7),(12,'This is Really Fun','The CSS is holding up too. Knock on wood... I really don\'t want to jinx this.....','public/images/uploads/ef48ec22f420b04ad12bd4ac4a8b89e390e25ffea8b9.jpeg','public/images/uploads/thumbnail-ef48ec22f420b04ad12bd4ac4a8b89e390e25ffea8b9.jpeg',1,'2022-05-18 17:49:29',7),(13,'What Happens with a very very very very very long title???','And a super long caption. I really hope it still works because this took so long to do. I would hate to fix everything again. I really really don\'t want to change my css again. It\'s really frustrating. Trying to come up with more things to say. I think this is long enough. Maybe.','public/images/uploads/9f0c3d81e9213e77f263327a51d0a9924f2d43792c6b.jpeg','public/images/uploads/thumbnail-9f0c3d81e9213e77f263327a51d0a9924f2d43792c6b.jpeg',1,'2022-05-18 17:51:47',7),(14,'Posting on Another Account','It looks like the cards stay a fixed size, but the longer the caption on a new post the longer they all get. Idk what to about this...','public/images/uploads/ec80113e99f910fceae9821ef0336084098af0195f41.jpeg','public/images/uploads/thumbnail-ec80113e99f910fceae9821ef0336084098af0195f41.jpeg',1,'2022-05-18 17:55:11',8),(15,'Making More Posts','This is still fun though.','public/images/uploads/5d4ce9b00f7159127faeeab2cd081f3c7205ac018342.jpeg','public/images/uploads/thumbnail-5d4ce9b00f7159127faeeab2cd081f3c7205ac018342.jpeg',1,'2022-05-18 17:55:50',8),(16,'One More To Fill the Home Page','The background image isn\'t long enough for these cards. Maybe I should get rid of it?','public/images/uploads/335ae5753284acc0d0d2aceea1bb78c455d419054561.jpeg','public/images/uploads/thumbnail-335ae5753284acc0d0d2aceea1bb78c455d419054561.jpeg',1,'2022-05-18 17:57:19',8),(17,'Post Model','post post model','public/images/uploads/0ead36f830bd0c67b9ddcaddbf64f37fd25fdef04397.jpeg','public/images/uploads/thumbnail-0ead36f830bd0c67b9ddcaddbf64f37fd25fdef04397.jpeg',1,'2022-05-18 21:03:10',9),(18,'another post test ','Trying to make sure this actually works','public/images/uploads/21b1f93e2443097c597ef5c9a4a995a43c7ff48c298e.webp','public/images/uploads/thumbnail-21b1f93e2443097c597ef5c9a4a995a43c7ff48c298e.webp',1,'2022-05-18 21:04:33',9);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active` int NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'test01','test@test.com','Mypassw0rd!',1,'2022-04-28 00:02:04'),(2,'test02','test02@test.com','123456',1,'2022-04-28 01:01:17'),(3,'test03','test03@test.com','123456',1,'2022-04-28 14:20:47'),(4,'test06','test06@test.com','$2b$15$GJyYTIqlrrRuzZ73FQm23..GQvvE9OmWOqjtd6ndSxdbLQdQ0ZAu2',1,'2022-04-28 15:56:50'),(5,'adtest1','adtest@test.com','$2b$15$cD5XINJVCfgsOVYPwYxNi.LCrMPmLtvolrO0GX9EVrcIEVmOZyoy6',1,'2022-05-11 20:52:06'),(6,'adtest2','adtest2@test.com','$2b$15$D012CCAAnxqot6s9M/NxceT8zrwU4r7Fm8cHv.watB/mBs9E72b2O',1,'2022-05-11 20:54:40'),(7,'adtest00','adtest07@test.com','$2b$15$IlXUTpmhA99mg59TLI1Aj.2KzyvflUsXWIqg6d4PjwYVEY3Pi9zQS',1,'2022-05-18 17:32:12'),(8,'adtest7','adtest7@test.com','$2b$15$jyIOx.ew6adPjBDZCqxgAugQZjz6sgTpxh2SqzRXGHCytNK7fJ..2',1,'2022-05-18 17:53:37'),(9,'adtest9','adtest9@test.com','$2b$15$VdkBpHemUMmBvBhWFadXT.RMMYhaha3K.jh.BvJ5NI3ie5vWYX/ZO',1,'2022-05-18 20:12:19'),(10,'registertest1','registertest1@test.com','$2b$15$ju1yeuvjicfUeUKitaRUGON3oj.GgoYC.6XCotq8wkfDsINKSJSgC',1,'2022-05-18 20:13:12'),(11,'refactortest1','refactor1@test.com','$2b$15$zgx9bxXRB9I3RPOkkVJ2iuMmhEX5gWTjvSAfR/LbzYfg9K.NmjvGu',1,'2022-05-18 20:30:08');
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

-- Dump completed on 2022-05-19 13:09:37
