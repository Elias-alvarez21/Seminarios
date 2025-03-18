-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: sestock
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `categoryId` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Almacen','2024-08-21 08:04:28',NULL),(2,'Bebidas','2024-08-21 08:04:28',NULL),(3,'Frutas y Verduras','2024-08-21 08:04:28',NULL),(4,'Carnicería','2024-08-21 08:04:28',NULL),(5,'Lácteos','2024-08-21 08:04:28',NULL),(6,'Perfumería','2024-08-21 08:04:28',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movements`
--

DROP TABLE IF EXISTS `movements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movements` (
  `movementId` bigint unsigned NOT NULL AUTO_INCREMENT,
  `productId` int unsigned NOT NULL,
  `userId` int unsigned NOT NULL,
  `typeId` tinyint unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `quantity` mediumint NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `observations` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`movementId`),
  KEY `productIdForeign` (`productId`),
  KEY `userIdForeign` (`userId`),
  KEY `typeIdForeign` (`typeId`),
  CONSTRAINT `productIdForeign` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`),
  CONSTRAINT `typeIdForeign` FOREIGN KEY (`typeId`) REFERENCES `types` (`typeId`),
  CONSTRAINT `userIdForeign` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movements`
--

LOCK TABLES `movements` WRITE;
/*!40000 ALTER TABLE `movements` DISABLE KEYS */;
INSERT INTO `movements` VALUES (1,1,1,1,'2024-08-16 08:08:42',NULL,500,500.60,NULL),(2,4,2,2,'2024-08-18 08:08:42',NULL,500,700.75,NULL),(3,8,1,3,'2024-08-21 08:08:42',NULL,500,999.99,NULL),(4,1,1,1,'2024-08-21 08:08:42',NULL,500,500.60,NULL),(5,4,2,2,'2024-08-24 08:08:42',NULL,500,700.75,NULL),(6,8,1,3,'2024-08-24 08:08:42',NULL,500,999.99,NULL);
/*!40000 ALTER TABLE `movements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `productId` int unsigned NOT NULL AUTO_INCREMENT,
  `categoryId` tinyint unsigned NOT NULL,
  `denomination` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional_info` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(8,2) NOT NULL,
  `stock` mediumint NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`productId`),
  KEY `categoryIdForeign` (`categoryId`),
  CONSTRAINT `categoryIdForeign` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,'Galletitas de Cereales',NULL,299.99,500,'2024-08-21 08:04:45',NULL,1),(2,1,'Copos de Maíz 500 grs.',NULL,450.00,250,'2024-08-21 08:04:47',NULL,1),(3,1,'Tostadas de Arroz',NULL,235.99,400,'2024-08-21 08:04:50',NULL,1),(4,2,'Gaseosa 1.5L',NULL,630.00,100,'2024-08-21 08:05:02',NULL,1),(5,2,'Gaseosa 2L',NULL,750.25,150,'2024-08-21 08:07:52',NULL,1),(6,2,'Gaseosa 3L',NULL,870.45,125,'2024-08-21 08:07:52',NULL,1),(7,3,'Tomate 1K',NULL,299.99,250,'2024-08-21 08:07:52',NULL,1),(8,3,'Lechuga 1K',NULL,820.50,250,'2024-08-21 08:07:52',NULL,1),(9,3,'Zapallo 1K',NULL,500.70,255,'2024-08-21 08:07:52',NULL,1),(10,4,'Milanesa 1K',NULL,1299.99,500,'2024-08-21 08:07:52',NULL,1),(11,4,'Carne Picada 1K',NULL,1000.00,1000,'2024-08-21 08:07:52',NULL,1),(12,4,'Bola de Lomo 1K',NULL,1400.00,400,'2024-08-21 08:07:52',NULL,1),(13,5,'Leche 1L',NULL,299.99,700,'2024-08-21 08:07:52',NULL,1),(14,5,'Queso Crema 380 grs.',NULL,499.99,100,'2024-08-21 08:07:52',NULL,1),(15,5,'Yogurth 150 grs.',NULL,199.15,50,'2024-08-21 08:07:52',NULL,1),(16,6,'Shampoo 500 Ml.',NULL,400.99,200,'2024-08-21 08:07:52',NULL,1),(17,6,'Dentrífico 90 grs.',NULL,470.00,100,'2024-08-21 08:07:52',NULL,1),(18,6,'Jabón de Tocador 120x3',NULL,630.00,200,'2024-08-21 08:07:52',NULL,1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `types` (
  `typeId` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `detail` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (1,'Efectivo','2024-08-21 08:07:57',NULL),(2,'Débito','2024-08-21 08:07:57',NULL),(3,'Crédito','2024-08-21 08:07:57',NULL),(4,'Cheque','2024-08-21 08:07:57',NULL),(5,'Billetera Virtual','2024-08-21 08:07:57',NULL),(6,'Transferencia','2024-08-21 08:07:57',NULL);
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userId` int unsigned NOT NULL AUTO_INCREMENT,
  `surname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Encargado','E.','encargado@mail.com','2024-08-21 08:04:33',NULL,1),(2,'Repositor','R.','repositor@mail.com','2024-08-21 08:04:37',NULL,1),(3,'Vendedor','V.','vendedor@mail.com','2024-08-21 08:04:40',NULL,1),(4,'Cajero','C.','cajero@mail.com','2024-08-21 08:04:42',NULL,1);
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

-- Dump completed on 2024-08-22 12:24:32
