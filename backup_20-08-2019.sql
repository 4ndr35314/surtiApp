-- MySQL dump 10.13  Distrib 8.0.12, for osx10.14 (x86_64)
--
-- Host: localhost    Database: surtiapp_db
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `store_id` int(10) unsigned DEFAULT NULL,
  `role` enum('admin','super') DEFAULT 'admin',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`),
  KEY `admins_store_id_foreign` (`store_id`),
  CONSTRAINT `admins_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'surtiapp.com@gmail.com',1,'super',NULL,NULL),(2,'juan@mail.com',1,'admin',NULL,NULL),(3,'otro@mail.com',4,'admin','2019-05-14 10:48:33','2019-05-14 10:48:33'),(4,'picapiedra@mail.com',5,'admin','2019-05-14 12:13:12','2019-05-14 12:13:12'),(5,'tienda76@mail.com',6,'admin','2019-05-27 23:47:15','2019-05-27 23:47:15');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adonis_schema`
--

DROP TABLE IF EXISTS `adonis_schema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `adonis_schema` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `migration_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adonis_schema`
--

LOCK TABLES `adonis_schema` WRITE;
/*!40000 ALTER TABLE `adonis_schema` DISABLE KEYS */;
INSERT INTO `adonis_schema` VALUES (1,'1502982457399_city_schema',1,'2019-05-10 04:06:01'),(2,'1502983098474_store_schema',1,'2019-05-10 04:06:01'),(3,'1503248427885_user',1,'2019-05-10 04:06:01'),(4,'1503248427886_token',1,'2019-05-10 04:06:01'),(5,'1532359298823_group_schema',2,'2019-05-10 04:06:25'),(6,'1532882937586_category_schema',2,'2019-05-10 04:06:25'),(7,'1532882953883_subcategory_schema',2,'2019-05-10 04:06:25'),(8,'1532883000615_promo_schema',2,'2019-05-10 04:06:25'),(9,'1532883002058_product_schema',2,'2019-05-10 04:06:25'),(10,'1532883024397_image_schema',2,'2019-05-10 04:06:25'),(11,'1532883090213_favorites_schema',2,'2019-05-10 04:06:25'),(12,'1532883146654_search_schema',2,'2019-05-10 04:06:25'),(13,'1532883179088_score_schema',2,'2019-05-10 04:06:25'),(14,'1532883194284_billing_schema',2,'2019-05-10 04:06:25'),(15,'1532883263138_purchase_schema',2,'2019-05-10 04:06:26'),(16,'1534285873909_income_schema',2,'2019-05-10 04:06:26'),(17,'1534287780410_income_products_schema',2,'2019-05-10 04:06:26'),(18,'1534960913193_like_schema',2,'2019-05-10 04:06:26'),(19,'1538751421891_redeem_schema',2,'2019-05-10 04:06:26'),(20,'1556983088902_admin_schema',2,'2019-05-10 04:06:26');
/*!40000 ALTER TABLE `adonis_schema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billings`
--

DROP TABLE IF EXISTS `billings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `billings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice` varchar(255) DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `status` varchar(255) DEFAULT 'pending',
  `shipment_guide` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `billings_user_id_foreign` (`user_id`),
  CONSTRAINT `billings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billings`
--

LOCK TABLES `billings` WRITE;
/*!40000 ALTER TABLE `billings` DISABLE KEYS */;
/*!40000 ALTER TABLE `billings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `logo` varchar(255) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `percentage` float(8,2) DEFAULT '0.05',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Categoria 1','Descripcion categoria 1','categoria-1','https://firebasestorage.googleapis.com/v0/b/adminsurtiapp.appspot.com/o/categories%2Flogo%2F1557614283066.jpg?alt=media&token=1952c89a-2d8b-4e23-b5b0-9e03e0322a69','https://firebasestorage.googleapis.com/v0/b/adminsurtiapp.appspot.com/o/categories%2Fbanner%2F1557614283071.jpg?alt=media&token=5133faf8-85cc-4047-87d5-3ca2c164f703',1,3.00,'2019-05-10 21:03:21','2019-05-27 23:43:33'),(2,'Categoria 2','Descripcio categoria 2','categoria-2','https://firebasestorage.googleapis.com/v0/b/adminsurtiapp.appspot.com/o/categories%2Flogo%2F1557540774932.jpg?alt=media&token=4478dfdb-0a89-4d68-8020-4ccb4348e523','https://firebasestorage.googleapis.com/v0/b/adminsurtiapp.appspot.com/o/categories%2Fbanner%2F1557540774937.jpg?alt=media&token=b1646848-45b1-407c-a1f5-7437ec1764f5',1,3.00,'2019-05-10 21:12:54','2019-05-10 21:12:58'),(3,'Categoria 3','ansdjfnakjsn jnsdfkjans ','categoria-3','https://firebasestorage.googleapis.com/v0/b/adminsurtiapp.appspot.com/o/categories%2Flogo%2F1557961546892.jpg?alt=media&token=435748f0-ae84-463c-be16-dea8a3836405',NULL,1,12.00,'2019-05-15 18:05:46','2019-05-15 18:05:49');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) DEFAULT 'Colombia',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `favorites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `favorites_user_id_foreign` (`user_id`),
  KEY `favorites_product_id_foreign` (`product_id`),
  CONSTRAINT `favorites_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (1,1,1,NULL,NULL),(2,1,6,NULL,NULL),(3,1,7,NULL,NULL);
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `store_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Grupo 1','2',1,1,'2019-05-11 14:20:31','2019-05-27 23:35:33',1),(2,'Grupo 2','2',2,1,'2019-05-11 15:27:46','2019-05-11 15:27:47',1),(3,'Artículos del Hoga','1',3,0,'2019-05-27 22:33:20','2019-05-27 23:36:03',1),(4,'Aseo','2',4,1,'2019-05-27 22:51:24','2019-05-27 23:35:49',1),(5,'Mascotas','3',5,1,'2019-05-27 22:52:19','2019-05-27 23:35:41',1);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `url` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `images_product_id_foreign` (`product_id`),
  CONSTRAINT `images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,5,'https://firebasestorage.googleapis.com/v0/b/adminsurtiapp.appspot.com/o/products%2F4%2F1557606326900.jpg?alt=media&token=83e6fa0d-f6f1-478c-ac80-967d5ce07b3c',1,'2019-05-11 15:25:31','2019-05-11 15:25:31'),(4,5,'https://firebasestorage.googleapis.com/v0/b/adminsurtiapp.appspot.com/o/products%2F4%2F1557612756128.jpg?alt=media&token=667ee8b3-07a0-4927-b3ad-8c8fef9840b6',1,'2019-05-11 17:12:37','2019-05-11 17:12:37'),(6,5,'https://firebasestorage.googleapis.com/v0/b/adminsurtiapp.appspot.com/o/products%2F4%2F1557613156689.jpg?alt=media&token=06a2a9c7-342d-431f-8d0b-70cbd7cdc221',1,'2019-05-11 17:19:18','2019-05-11 17:19:18'),(7,1,'https://firebasestorage.googleapis.com/v0/b/adminsurtiapp.appspot.com/o/products%2F6%2F1557614366063.jpg?alt=media&token=dfab703d-adf9-4f15-acd4-6194374774e2',1,'2019-05-11 17:39:27','2019-05-11 17:39:27'),(8,1,'https://firebasestorage.googleapis.com/v0/b/adminsurtiapp.appspot.com/o/products%2F6%2F1557614366057.jpg?alt=media&token=0508e2e5-3a0b-47a4-8de7-a9bc6a331423',1,'2019-05-11 17:39:27','2019-05-11 17:39:27');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income_products`
--

DROP TABLE IF EXISTS `income_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `income_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `income_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_cost` float(8,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `income_products_income_id_foreign` (`income_id`),
  KEY `income_products_product_id_foreign` (`product_id`),
  CONSTRAINT `income_products_income_id_foreign` FOREIGN KEY (`income_id`) REFERENCES `incomes` (`id`),
  CONSTRAINT `income_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income_products`
--

LOCK TABLES `income_products` WRITE;
/*!40000 ALTER TABLE `income_products` DISABLE KEYS */;
INSERT INTO `income_products` VALUES (1,4,1,3,5000.00,NULL,NULL),(2,5,6,3,5000.00,NULL,NULL),(3,6,7,3,5000.00,NULL,NULL),(4,9,4,2,5000.00,NULL,NULL),(5,9,6,11,3000.00,NULL,NULL),(6,10,12,7,5000.00,NULL,NULL),(7,10,13,19,5000.00,NULL,NULL),(8,11,14,7,5000.00,NULL,NULL),(9,11,15,19,5000.00,NULL,NULL),(10,12,16,7,5000.00,NULL,NULL),(11,12,17,19,5000.00,NULL,NULL),(12,13,18,7,5000.00,NULL,NULL),(13,13,19,19,5000.00,NULL,NULL),(14,14,18,7,5000.00,NULL,NULL),(15,14,19,19,5000.00,NULL,NULL);
/*!40000 ALTER TABLE `income_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incomes`
--

DROP TABLE IF EXISTS `incomes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `incomes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `provider` varchar(255) DEFAULT NULL,
  `billing` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `store_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incomes`
--

LOCK TABLES `incomes` WRITE;
/*!40000 ALTER TABLE `incomes` DISABLE KEYS */;
INSERT INTO `incomes` VALUES (1,'','','2019-05-11 13:55:15','2019-05-11 13:55:15',1),(2,'','','2019-05-11 14:00:53','2019-05-11 14:00:53',1),(3,'','','2019-05-11 14:02:51','2019-05-11 14:02:51',1),(4,'','','2019-05-11 14:03:51','2019-05-11 14:03:51',1),(5,'Proveedor 1 ','123123','2019-05-15 16:47:37','2019-05-15 16:47:37',NULL),(6,'Proveedor 1','423212','2019-05-15 16:49:08','2019-05-15 16:49:08',NULL),(7,'Proveedor 1','213123','2019-05-15 16:59:31','2019-05-15 16:59:31',NULL),(8,'Proveedor 1','121231','2019-05-16 11:20:15','2019-05-16 11:20:15',1),(9,'Proveedor 1','124532','2019-05-16 11:24:55','2019-05-16 11:24:55',1),(10,'Proveedor 1','716787','2019-05-16 12:46:20','2019-05-16 12:46:20',1),(11,'Proveedor 1','124511','2019-05-16 12:47:54','2019-05-16 12:47:54',1),(12,'Proveedor 4','189891','2019-05-16 12:50:20','2019-05-16 12:50:20',1),(13,'Proveedor 5','11898','2019-05-16 12:54:13','2019-05-16 12:54:13',1),(14,'Proveedor7','898778','2019-05-16 12:54:46','2019-05-16 12:54:46',1);
/*!40000 ALTER TABLE `incomes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `likes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `likes_user_id_foreign` (`user_id`),
  KEY `likes_product_id_foreign` (`product_id`),
  CONSTRAINT `likes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT '0',
  `price_before` float(8,2) DEFAULT NULL,
  `price` float(8,2) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `weight` float(8,2) NOT NULL,
  `redeem` int(11) DEFAULT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `limit` int(11) DEFAULT '1',
  `shipment_tax` float(8,2) DEFAULT '0.00',
  `subcategory_id` int(10) unsigned DEFAULT NULL,
  `store_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `promo_id` int(10) DEFAULT NULL,
  `width` float DEFAULT NULL,
  `height` float DEFAULT NULL,
  `depth` float DEFAULT NULL,
  `star` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_subcategory_id_foreign` (`subcategory_id`),
  KEY `products_store_id_foreign` (`store_id`),
  CONSTRAINT `products_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`),
  CONSTRAINT `products_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'ABC123','Producto 1','Descripcion producto 1','producto-1',3,-1.00,15000.00,NULL,NULL,0.40,45000,900,1,0.00,7,1,'2019-05-11 14:03:51','2019-05-11 15:08:17',1,30,70,4,0,1),(2,'ACB879','Producto 87','Descripcion producto','producto-87',12,NULL,5000.00,NULL,NULL,300.00,15000,312,1,0.00,7,1,'2019-05-11 14:57:22','2019-05-11 15:07:37',NULL,34,12,12,0,0),(3,'ACB879','Producto 87','Descripcion producto','producto-87',12,NULL,5000.00,NULL,NULL,300.00,15000,312,1,0.00,7,1,'2019-05-11 14:58:31','2019-05-11 15:07:37',NULL,34,12,12,0,0),(4,'GHA133','Producto 642','Descripcio producto 6567','producto-642',102,NULL,1281.00,NULL,NULL,134.00,12312,123,1,0.00,7,1,'2019-05-11 15:23:31','2019-05-16 11:24:55',NULL,123,13,31,1,NULL),(5,'HJLL123','ajsdnfkaj m k','sadfnajsdnfka','ajsdnfkaj-m-k',1,312312.00,1231.00,NULL,NULL,1231.00,1231,1231,1,0.00,7,1,'2019-05-11 15:25:26','2019-05-11 15:26:13',1,12312,12312,123,NULL,NULL),(6,'ABC123','Producto 1','Descripcion producto 1','producto-1',311,NULL,15000.00,NULL,NULL,0.40,45000,900,5,1200.00,7,NULL,'2019-05-15 16:47:37','2019-05-16 11:24:55',NULL,30,70,4,NULL,NULL),(7,'ABC123','Producto 1','Descripcion producto 1','producto-1',3,NULL,15000.00,NULL,NULL,0.40,45000,900,5,1200.00,7,NULL,'2019-05-15 16:49:08','2019-05-15 16:49:08',NULL,30,70,4,NULL,NULL),(8,'JFV267','Super Producto','Super producto de prueba','super-producto',3,NULL,17000.00,NULL,'M',720.00,17000,270,1,0.00,7,NULL,'2019-05-16 12:32:03','2019-05-16 12:32:03',NULL,39,17,9,NULL,NULL),(9,'JFV267','Super Producto','Super producto de prueba','super-producto',4,NULL,17000.00,NULL,'L',720.00,17000,270,1,0.00,7,NULL,'2019-05-16 12:32:03','2019-05-16 12:32:03',NULL,39,17,9,NULL,NULL),(10,'jnkjkñ123','ainfdksj lk211n2','jandsfkjsaja','ainfdksj-lk211n2',12,NULL,12.00,NULL,NULL,41.00,123,1,1,0.00,7,NULL,'2019-05-16 12:34:47','2019-05-16 12:34:47',NULL,12,12,12,NULL,NULL),(11,'jnkjkñ123','ainfdksj lk211n2','jandsfkjsaja','ainfdksj-lk211n2',211,NULL,12.00,NULL,NULL,41.00,123,1,1,0.00,7,NULL,'2019-05-16 12:34:47','2019-05-16 12:34:47',NULL,12,12,12,NULL,NULL),(12,'JFV267','Super Producto','Super producto de prueba','super-producto',7,NULL,17000.00,NULL,'M',670.00,45000,900,5,1200.00,7,NULL,'2019-05-16 12:46:20','2019-05-16 12:46:20',NULL,30,70,4,NULL,NULL),(13,'JFV267','Super Producto','Super producto de prueba','super-producto',19,NULL,17000.00,NULL,'L',670.00,45000,900,5,1200.00,7,NULL,'2019-05-16 12:46:20','2019-05-16 12:46:20',NULL,30,70,4,NULL,NULL),(14,'JFV267','Super Producto','Super producto de prueba','super-producto',7,NULL,17000.00,NULL,'M',670.00,45000,900,5,1200.00,7,NULL,'2019-05-16 12:47:54','2019-05-16 12:47:54',NULL,30,70,4,NULL,NULL),(15,'JFV267','Super Producto','Super producto de prueba','super-producto',19,NULL,17000.00,NULL,'L',670.00,45000,900,5,1200.00,7,NULL,'2019-05-16 12:47:54','2019-05-16 12:47:54',NULL,30,70,4,NULL,NULL),(16,'JFV267','Super Producto','Super producto de prueba','super-producto',7,NULL,17000.00,NULL,'M',670.00,45000,900,5,1200.00,7,NULL,'2019-05-16 12:50:20','2019-05-16 12:50:20',NULL,30,70,4,NULL,NULL),(17,'JFV267','Super Producto','Super producto de prueba','super-producto',19,NULL,17000.00,NULL,'L',670.00,45000,900,5,1200.00,7,NULL,'2019-05-16 12:50:20','2019-05-16 12:50:20',NULL,30,70,4,NULL,NULL),(18,'JF6752','Super Producto','Super producto de prueba','super-producto',14,NULL,17000.00,NULL,'M',670.00,45000,900,5,1200.00,7,NULL,'2019-05-16 12:54:13','2019-05-16 12:54:46',NULL,30,70,4,NULL,NULL),(19,'JF6752','Super Producto','Super producto de prueba','super-producto',38,NULL,17000.00,NULL,'L',670.00,45000,900,5,1200.00,7,NULL,'2019-05-16 12:54:13','2019-05-16 12:54:46',NULL,30,70,4,NULL,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promos`
--

DROP TABLE IF EXISTS `promos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `promos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `store_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `group_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `promos_store_id_foreign` (`store_id`),
  CONSTRAINT `promos_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promos`
--

LOCK TABLES `promos` WRITE;
/*!40000 ALTER TABLE `promos` DISABLE KEYS */;
INSERT INTO `promos` VALUES (1,'Promo1','Descripcion promo 1','promo1','https://firebasestorage.googleapis.com/v0/b/adminsurtiapp.appspot.com/o/promos%2F1557613682841.jpg?alt=media&token=115ce2fa-2488-4af7-8b4e-5260a83d3a9c',1,1,'2019-05-11 08:22:27','2019-05-27 22:53:10',1),(2,'Promoción 4º','Descripción promoción 4','promocion-4o','https://firebasestorage.googleapis.com/v0/b/adminsurtiapp.appspot.com/o/promos%2F1559014583898.jpg?alt=media&token=5b9064c0-c51b-47ce-a9d7-c8e1fce6ecea',1,1,'2019-05-27 22:36:23','2019-05-27 23:45:17',NULL),(3,'Promo 3','Descripció promo 3','promo-3','https://firebasestorage.googleapis.com/v0/b/adminsurtiapp.appspot.com/o/promos%2F1559015461520.jpg?alt=media&token=9879bfdf-7f32-45d9-87cb-f10e8e2e84b4',1,1,'2019-05-27 22:51:01','2019-05-27 22:51:03',NULL);
/*!40000 ALTER TABLE `promos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_products`
--

DROP TABLE IF EXISTS `purchase_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `purchase_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned DEFAULT NULL,
  `shipment_guide` varchar(255) DEFAULT NULL,
  `price` float(8,2) DEFAULT NULL,
  `shipment_tax` float(8,2) DEFAULT NULL,
  `score` enum('1','2','3','4','5') DEFAULT NULL,
  `status` varchar(255) DEFAULT 'pending',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `purchase_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_products_product_id_foreign` (`product_id`),
  CONSTRAINT `purchase_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_products`
--

LOCK TABLES `purchase_products` WRITE;
/*!40000 ALTER TABLE `purchase_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `purchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `billing_id` int(10) unsigned DEFAULT NULL,
  `score` enum('1','2','3','4','5') DEFAULT NULL,
  `status` varchar(255) DEFAULT 'pending',
  `description` text,
  `shipment_guide` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchases_user_id_foreign` (`user_id`),
  KEY `purchases_product_id_foreign` (`product_id`),
  KEY `purchases_billing_id_foreign` (`billing_id`),
  CONSTRAINT `purchases_billing_id_foreign` FOREIGN KEY (`billing_id`) REFERENCES `billings` (`id`),
  CONSTRAINT `purchases_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `purchases_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redeems`
--

DROP TABLE IF EXISTS `redeems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `redeems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `redeems_user_id_foreign` (`user_id`),
  KEY `redeems_product_id_foreign` (`product_id`),
  CONSTRAINT `redeems_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `redeems_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redeems`
--

LOCK TABLES `redeems` WRITE;
/*!40000 ALTER TABLE `redeems` DISABLE KEYS */;
/*!40000 ALTER TABLE `redeems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scores`
--

DROP TABLE IF EXISTS `scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `scores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `score` enum('1','2','3','4','5') NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `scores_user_id_foreign` (`user_id`),
  KEY `scores_product_id_foreign` (`product_id`),
  CONSTRAINT `scores_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `scores_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scores`
--

LOCK TABLES `scores` WRITE;
/*!40000 ALTER TABLE `scores` DISABLE KEYS */;
/*!40000 ALTER TABLE `scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searches`
--

DROP TABLE IF EXISTS `searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `searches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `times` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `searches_user_id_foreign` (`user_id`),
  KEY `searches_product_id_foreign` (`product_id`),
  CONSTRAINT `searches_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `searches_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searches`
--

LOCK TABLES `searches` WRITE;
/*!40000 ALTER TABLE `searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `nit` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `image` varchar(255) DEFAULT NULL,
  `owner` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES (1,'SurtiApp Marketplace','admin','Chinchina',1,'https://firebasestorage.googleapis.com/v0/b/adminsurtiapp.appspot.com/o/stores%2F1%2F1559018533885.jpg?alt=media&token=26155ca6-3269-4adf-9e68-436b1171ac0a','SurtiApp-Admin','admin',NULL,'2019-05-27 23:42:15',NULL),(2,'Tienda Ejemplo','15177681212-1','',1,NULL,'Pedro perez','312671239','2019-05-14 10:44:01','2019-05-14 10:44:01',''),(3,'Tienda Ejemplo','15177681212-1','',1,NULL,'Pedro perez','312671239','2019-05-14 10:44:27','2019-05-14 10:44:27',''),(4,'Otra tienda de ejemplo','15177681212','',1,NULL,'Otro skdfaslk','1240120910','2019-05-14 10:48:33','2019-05-14 10:48:33',''),(5,'Tienda 45','987654321-0','',1,NULL,'Pedro Picapiedra','3123131283','2019-05-14 12:13:12','2019-05-14 12:13:12',''),(6,'Tienda 76','9876543210','',1,NULL,'Pepito perez','3172891712','2019-05-27 23:47:15','2019-05-27 23:47:15','');
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `subcategories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `logo` varchar(255) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `category_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subcategories_category_id_foreign` (`category_id`),
  CONSTRAINT `subcategories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategories`
--

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
INSERT INTO `subcategories` VALUES (1,'Subcategoria 1','','subcategoria-1','null',NULL,1,1,'2019-05-11 14:05:30','2019-05-11 14:05:30'),(2,'Subcategoria 1','','subcategoria-1','null',NULL,1,1,'2019-05-11 14:06:04','2019-05-11 14:06:04'),(3,'Subcategoria 1','','subcategoria-1','null',NULL,1,1,'2019-05-11 14:06:07','2019-05-11 14:06:07'),(4,'Subcategoria 1','','subcategoria-1','null',NULL,1,1,'2019-05-11 14:06:07','2019-05-11 14:06:07'),(5,'Subcategoria 1','','subcategoria-1','null',NULL,1,1,'2019-05-11 14:06:08','2019-05-11 14:06:08'),(6,'Categoria 54','','categoria-54','null',NULL,1,2,'2019-05-11 14:11:25','2019-05-11 14:11:25'),(7,'Categoria 65','','categoria-65','https://firebasestorage.googleapis.com/v0/b/adminsurtiapp.appspot.com/o/subcategories%2Flogo%2F1557602002149.jpg?alt=media&token=8c299436-fe74-4b48-9057-ef29e294aa54',NULL,1,2,'2019-05-11 14:13:21','2019-05-11 14:13:25');
/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `type` varchar(80) NOT NULL,
  `is_revoked` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokens_token_unique` (`token`),
  KEY `tokens_user_id_foreign` (`user_id`),
  KEY `tokens_token_index` (`token`),
  CONSTRAINT `tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `points` int(11) DEFAULT '0',
  `picture` varchar(255) DEFAULT 'https://images.surtiapp.com/images/user/default',
  `type` enum('admin','user','client') DEFAULT 'client',
  `referring` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Jesus','adnfjaksdnf','cre ajk 123 123','331231112','chinchina','caldas','jesus@mail.com',1,0,'https://images.surtiapp.com/images/user/default','client',NULL,NULL,NULL,NULL);
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

-- Dump completed on 2019-08-20 10:08:29
