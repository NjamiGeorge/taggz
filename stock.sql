-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: stock
-- ------------------------------------------------------
-- Server version	5.7.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add supplier',7,'add_supplier'),(20,'Can change supplier',7,'change_supplier'),(21,'Can delete supplier',7,'delete_supplier'),(25,'Can add product',9,'add_product'),(26,'Can change product',9,'change_product'),(27,'Can delete product',9,'delete_product'),(28,'Can add customer',10,'add_customer'),(29,'Can change customer',10,'change_customer'),(30,'Can delete customer',10,'delete_customer'),(31,'Can add product image',11,'add_productimage'),(32,'Can change product image',11,'change_productimage'),(33,'Can delete product image',11,'delete_productimage'),(40,'Can add category',14,'add_category'),(41,'Can change category',14,'change_category'),(42,'Can delete category',14,'delete_category'),(46,'Can add shoe',16,'add_shoe'),(47,'Can change shoe',16,'change_shoe'),(48,'Can delete shoe',16,'delete_shoe'),(49,'Can add category',17,'add_category'),(50,'Can change category',17,'change_category'),(51,'Can delete category',17,'delete_category'),(52,'Can add site',18,'add_site'),(53,'Can change site',18,'change_site'),(54,'Can delete site',18,'delete_site'),(55,'Can add registration profile',19,'add_registrationprofile'),(56,'Can change registration profile',19,'change_registrationprofile'),(57,'Can delete registration profile',19,'delete_registrationprofile'),(58,'Can add checkout',20,'add_checkout'),(59,'Can change checkout',20,'change_checkout'),(60,'Can delete checkout',20,'delete_checkout'),(61,'Can add variation',21,'add_variation'),(62,'Can change variation',21,'change_variation'),(63,'Can delete variation',21,'delete_variation'),(64,'Can add cart item',22,'add_cartitem'),(65,'Can change cart item',22,'change_cartitem'),(66,'Can delete cart item',22,'delete_cartitem'),(67,'Can add cart',23,'add_cart'),(68,'Can change cart',23,'change_cart'),(69,'Can delete cart',23,'delete_cart'),(70,'Can add guest checkout',24,'add_guestcheckout'),(71,'Can change guest checkout',24,'change_guestcheckout'),(72,'Can delete guest checkout',24,'delete_guestcheckout'),(73,'Can add user address',25,'add_useraddress'),(74,'Can change user address',25,'change_useraddress'),(75,'Can delete user address',25,'delete_useraddress'),(76,'Can add order',26,'add_order'),(77,'Can change order',26,'change_order'),(78,'Can delete order',26,'delete_order'),(79,'Can add shoe',27,'add_shoe'),(80,'Can change shoe',27,'change_shoe'),(81,'Can delete shoe',27,'delete_shoe'),(82,'Can add transaction',28,'add_transaction'),(83,'Can change transaction',28,'change_transaction'),(84,'Can delete transaction',28,'delete_transaction');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$hZm8VAa7JsDi$LZ2RCSQiuG+tcSfV+3ExUuO72nFhwTj650xHe+VOIHI=','2017-10-23 04:32:57',1,'njami','','','njamygeorge9@gmail.com',1,1,'2017-01-22 14:38:31'),(6,'pbkdf2_sha256$30000$ZmF9vKErloJ0$9LVfZt3RgsVY9mJlJ0XRkFbSQtO1e7twWIdvq4qMgG8=','2017-08-10 12:48:53',0,'john','','','njamigeorge@yahoo.com',0,1,'2017-07-10 17:47:22'),(7,'pbkdf2_sha256$30000$tpMxFL0qNcsK$Dpp6MEgl+Uzg0MzPq0XUsLXv0OSls5nalQUvGoJ+rfs=','2017-07-10 18:27:44',0,'johncon','','','kinuthianaftali@outlook.com',0,1,'2017-07-10 18:26:47'),(8,'pbkdf2_sha256$30000$A2LyJnJ3UtWP$j6ZPOVt3ugKe/vIv8sLRppC+SxYwFA3/R+MtIhB0jb0=','2017-10-13 09:11:31',0,'ivy','','','ivygithui@gmail.com',0,1,'2017-10-01 05:32:34');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_cart`
--

DROP TABLE IF EXISTS `cart_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subtotal` decimal(20,2) NOT NULL,
  `tax_percentage` decimal(10,5) NOT NULL,
  `total` decimal(60,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_cart_e8701ad4` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_cart`
--

LOCK TABLES `cart_cart` WRITE;
/*!40000 ALTER TABLE `cart_cart` DISABLE KEYS */;
INSERT INTO `cart_cart` VALUES (4,'2017-07-06 23:10:26.286753','2017-07-10 17:10:16.641537',1,0.00,0.08500,25.00),(5,'2017-07-10 07:47:31.338649','2017-07-10 09:58:17.305124',1,8200.00,0.08500,25.00),(6,'2017-07-10 10:38:41.833202','2017-07-10 10:38:41.945598',1,2000.00,0.08500,25.00),(7,'2017-07-10 10:38:51.316957','2017-07-10 10:38:51.448674',1,2000.00,0.08500,25.00),(8,'2017-07-10 10:41:11.319446','2017-07-10 10:41:11.456887',1,2600.00,0.08500,25.00),(9,'2017-07-10 10:43:07.980337','2017-07-10 10:43:42.223682',1,2000.00,0.08500,25.00),(11,'2017-07-10 18:03:04.370195','2017-07-10 18:03:11.535957',1,2000.00,0.08500,25.00),(15,'2017-07-17 07:56:54.678952','2017-07-23 01:22:26.577010',1,4000.00,0.08500,25.00),(16,'2017-07-25 05:47:26.595035','2017-07-25 06:01:18.648738',6,2000.00,0.08500,25.00),(17,'2017-07-25 06:02:43.384668','2017-08-06 06:01:57.570757',1,18000.00,0.08500,25.00),(18,'2017-08-06 06:07:25.880560','2017-08-06 06:07:26.341218',1,6000.00,0.08500,25.00),(19,'2017-08-06 06:09:21.773796','2017-08-06 06:09:46.842632',1,2600.00,0.08500,25.00),(20,'2017-08-06 08:07:00.460818','2017-08-06 08:07:17.480032',1,6000.00,0.08500,25.00),(21,'2017-08-06 08:07:43.669975','2017-08-06 08:13:43.069404',1,6000.00,0.08500,25.00),(22,'2017-08-06 08:20:45.711260','2017-08-06 08:20:45.975351',1,6000.00,0.08500,25.00),(23,'2017-08-06 13:37:54.645953','2017-08-06 13:48:25.609011',1,2600.00,0.08500,25.00),(24,'2017-08-06 14:16:41.175833','2017-08-07 16:02:10.622042',1,2000.00,0.08500,25.00),(25,'2017-08-09 18:16:28.016880','2017-08-09 18:16:28.156761',1,8000.00,0.08500,25.00),(26,'2017-08-11 11:18:15.102125','2017-08-15 15:53:57.881061',1,0.00,0.08500,25.00),(27,'2017-08-15 23:14:05.235532','2017-08-18 05:54:11.105467',1,2000.00,0.08500,25.00),(28,'2017-08-18 06:07:13.029376','2017-08-18 07:38:18.550184',1,6800.00,0.08500,25.00),(29,'2017-08-18 07:55:34.018680','2017-08-18 09:42:01.247417',1,0.00,0.08500,25.00),(30,'2017-08-18 09:42:15.105068','2017-08-18 09:42:15.284413',1,2600.00,0.08500,25.00),(31,'2017-08-18 09:58:54.412452','2017-08-18 10:36:21.447899',1,2000.00,0.08500,25.00),(32,'2017-08-18 11:21:15.550652','2017-08-18 11:21:15.815424',1,2000.00,0.08500,25.00),(33,'2017-08-18 11:38:23.475054','2017-08-18 11:46:14.698777',1,2000.00,0.08500,25.00),(34,'2017-08-18 12:26:21.224827','2017-08-18 12:26:21.373538',1,2600.00,0.08500,25.00),(35,'2017-08-18 12:26:21.454296','2017-08-21 08:18:24.292584',1,2600.00,0.08500,25.00),(36,'2017-08-21 12:40:57.853743','2017-08-21 12:41:40.640447',1,3400.00,0.08500,25.00),(37,'2017-08-22 04:48:42.305387','2017-08-22 05:08:00.599876',1,2000.00,0.08500,25.00),(38,'2017-08-22 05:35:02.280128','2017-08-22 05:35:02.395338',1,2600.00,0.08500,25.00),(39,'2017-08-22 05:35:02.477703','2017-08-22 05:49:29.726193',1,2600.00,0.08500,25.00),(40,'2017-08-22 08:59:28.205975','2017-08-22 08:59:28.423716',1,2600.00,0.08500,25.00),(41,'2017-08-22 08:59:28.503842','2017-08-22 08:59:28.691417',1,2600.00,0.08500,25.00),(42,'2017-08-23 10:55:47.724806','2017-08-23 10:55:55.617089',1,5200.00,0.08500,25.00),(43,'2017-08-23 11:40:02.651245','2017-08-23 11:40:03.124585',1,2000.00,0.08500,25.00),(44,'2017-08-23 13:02:59.291533','2017-08-23 13:10:01.331266',1,4600.00,0.08500,25.00),(45,'2017-08-23 13:32:40.706840','2017-08-23 14:48:34.782958',1,7200.00,0.08500,25.00),(46,'2017-08-24 04:23:50.257549','2017-08-24 04:37:26.459424',1,14600.00,0.08500,25.00),(47,'2017-08-24 04:38:21.860470','2017-08-24 05:10:06.476951',1,0.00,0.08500,25.00),(48,'2017-08-24 05:25:45.213093','2017-08-24 07:06:21.729382',1,2000.00,0.08500,25.00),(49,'2017-08-24 07:12:59.354685','2017-08-24 07:12:59.923204',1,2000.00,0.08500,25.00),(50,'2017-08-24 07:30:34.465875','2017-08-24 07:32:36.064395',1,4600.00,0.08500,25.00),(51,'2017-08-24 07:37:12.028621','2017-08-24 07:40:31.788586',1,2600.00,0.08500,25.00),(52,'2017-08-24 07:40:54.623269','2017-08-24 07:54:50.814905',1,2000.00,0.08500,25.00),(53,'2017-08-27 05:52:00.524015','2017-09-10 22:28:00.180061',1,2600.00,0.08500,25.00),(54,'2017-09-10 22:31:08.567457','2017-09-10 22:31:32.432619',1,8000.00,0.08500,25.00),(55,'2017-09-13 20:31:40.017865','2017-09-15 04:31:34.930621',1,6000.00,0.08500,25.00),(56,'2017-09-15 04:42:26.448639','2017-09-15 04:42:26.894477',1,2600.00,0.08500,25.00),(57,'2017-09-15 04:46:44.464801','2017-09-15 04:46:44.826187',1,2000.00,0.08500,25.00),(58,'2017-09-15 04:53:57.283134','2017-09-15 05:17:54.107891',1,0.00,0.08500,25.00),(59,'2017-09-15 05:18:03.241801','2017-09-15 05:18:03.527478',1,2600.00,0.08500,25.00),(60,'2017-09-15 05:34:26.597520','2017-09-15 05:41:59.563350',1,2600.00,0.08500,25.00),(61,'2017-09-15 05:58:08.453588','2017-09-15 07:26:27.305069',1,2000.00,0.08500,25.00),(62,'2017-09-15 08:27:51.355755','2017-09-15 18:39:26.493417',1,1400.00,0.08500,25.00),(63,'2017-09-15 18:40:11.243952','2017-09-15 18:40:11.401003',1,2600.00,0.08500,25.00),(64,'2017-09-18 13:36:46.464246','2017-09-18 13:36:46.636661',1,2000.00,0.08500,25.00),(65,'2017-09-18 13:37:29.664246','2017-09-18 13:37:54.558560',1,3400.00,0.08500,25.00),(66,'2017-09-19 18:45:58.511060','2017-09-22 08:17:22.185001',1,2600.00,0.08500,25.00),(67,'2017-09-22 09:10:54.161080','2017-09-28 21:57:56.302224',1,7400.00,0.08500,7400.00),(68,'2017-09-24 08:41:45.109987','2017-09-24 08:41:45.189720',1,2600.00,0.08500,2600.00),(69,'2017-09-24 08:41:45.168006','2017-09-24 10:22:55.042385',1,17600.00,0.08500,17600.00),(70,'2017-09-24 10:28:12.251450','2017-09-24 10:28:12.342330',1,2000.00,0.08500,2000.00),(71,'2017-09-24 10:28:12.279648','2017-09-24 10:28:12.403054',1,2000.00,0.08500,2000.00),(72,'2017-09-24 10:28:12.315517','2017-09-24 10:28:24.096022',1,6000.00,0.08500,6000.00),(73,'2017-09-28 22:49:12.889211','2017-09-29 02:49:43.521594',1,21800.00,0.08500,21800.00),(74,'2017-09-29 02:51:38.927161','2017-10-01 05:29:29.201785',1,8600.00,0.08500,8600.00),(75,'2017-10-01 19:08:52.001477','2017-10-01 19:08:52.051122',1,0.00,0.08500,0.00),(76,'2017-10-01 19:08:52.196669','2017-10-01 19:08:52.424322',1,2600.00,0.08500,2600.00),(77,'2017-10-01 19:08:52.211107','2017-10-03 05:52:58.186220',1,0.00,0.08500,0.00),(78,'2017-10-03 06:04:06.159917','2017-10-03 06:04:06.297768',1,0.00,0.08500,0.00),(79,'2017-10-03 06:04:32.041876','2017-10-03 06:04:43.650110',1,7800.00,0.08500,7800.00),(80,'2017-10-03 06:26:30.168471','2017-10-03 06:26:30.457872',1,2600.00,0.08500,2600.00),(81,'2017-10-03 06:27:07.099328','2017-10-03 06:27:07.331070',1,2600.00,0.08500,2600.00),(82,'2017-10-03 06:36:16.337844','2017-10-03 07:04:42.678086',1,2600.00,0.08500,2600.00),(83,'2017-10-03 07:45:20.145416','2017-10-03 07:45:20.664420',1,2600.00,0.08500,2600.00),(84,'2017-10-03 08:19:31.612233','2017-10-03 08:19:32.058766',1,2000.00,0.08500,2000.00),(85,'2017-10-03 08:25:12.671993','2017-10-03 08:25:21.538895',1,2600.00,0.08500,2600.00),(86,'2017-10-03 18:52:09.253348','2017-10-03 18:52:12.846274',1,0.00,0.08500,0.00),(87,'2017-10-04 03:44:24.291509','2017-10-04 03:44:24.486576',1,2000.00,0.08500,2000.00),(88,'2017-10-04 03:51:19.270343','2017-10-04 03:51:26.995811',1,2000.00,0.08500,2000.00),(89,'2017-10-04 04:05:01.337788','2017-10-04 04:05:01.543020',1,1400.00,0.08500,1400.00),(90,'2017-10-04 04:06:37.751250','2017-10-04 04:06:38.002146',1,2000.00,0.08500,2000.00),(91,'2017-10-04 04:13:30.836700','2017-10-04 04:13:31.068593',1,2000.00,0.08500,2000.00),(92,'2017-10-04 04:18:14.310473','2017-10-04 04:18:14.620132',1,2600.00,0.08500,2600.00),(93,'2017-10-04 04:21:18.146776','2017-10-04 04:21:18.395382',1,2000.00,0.08500,2000.00),(94,'2017-10-04 04:40:41.381457','2017-10-04 06:36:17.855319',1,6000.00,0.08500,6000.00),(95,'2017-10-06 17:04:58.976835','2017-10-06 17:04:59.248888',1,2000.00,0.08500,2000.00),(96,'2017-10-06 17:08:28.575945','2017-10-06 18:44:07.877523',1,2600.00,0.08500,2600.00),(97,'2017-10-06 18:53:43.564024','2017-10-06 19:04:38.995242',1,4600.00,0.08500,4600.00),(98,'2017-10-06 19:18:35.237700','2017-10-06 19:21:47.870185',1,2600.00,0.08500,2600.00),(99,'2017-10-06 19:24:53.656691','2017-10-06 19:24:53.881914',1,2000.00,0.08500,2000.00),(100,'2017-10-06 19:32:27.906486','2017-10-06 19:47:19.774838',1,2000.00,0.08500,2000.00),(101,'2017-10-06 19:48:34.764255','2017-10-06 20:02:54.604782',1,4600.00,0.08500,4600.00),(102,'2017-10-06 23:06:28.361965','2017-10-06 23:06:28.737594',1,2000.00,0.08500,2000.00),(103,'2017-10-06 23:11:31.254370','2017-10-08 05:47:48.005571',1,2000.00,0.08500,2000.00),(104,'2017-10-09 12:12:12.164126','2017-10-09 12:12:59.770048',1,3400.00,0.08500,3400.00),(105,'2017-10-09 13:55:45.795119','2017-10-10 21:55:05.224936',1,0.00,0.08500,0.00),(106,'2017-10-10 21:55:13.966294','2017-10-13 09:04:52.688233',1,2000.00,0.08500,2000.00),(107,'2017-10-13 09:32:15.627167','2017-10-13 10:41:12.217482',1,2000.00,0.08500,2000.00),(108,'2017-10-13 10:41:23.965218','2017-10-14 15:55:35.737060',1,4600.00,0.08500,4600.00),(109,'2017-10-14 15:56:46.974064','2017-10-14 17:50:10.125461',1,4600.00,0.08500,4600.00),(110,'2017-10-14 19:18:33.615400','2017-10-14 21:58:53.458523',1,4600.00,0.08500,4600.00),(111,'2017-10-14 22:00:42.045358','2017-10-14 22:51:26.389256',1,4600.00,0.08500,4600.00),(112,'2017-10-14 22:52:54.129074','2017-10-14 23:09:10.403962',1,1400.00,0.08500,1400.00),(113,'2017-10-16 04:11:35.344352','2017-10-16 04:12:08.759247',1,1400.00,0.08500,1400.00),(114,'2017-10-16 04:51:09.855001','2017-10-16 04:51:10.414717',1,2000.00,0.08500,2000.00),(115,'2017-10-18 05:40:53.087888','2017-10-18 06:06:50.443531',1,0.00,0.08500,0.00),(116,'2017-10-20 07:04:53.227875','2017-10-21 07:13:03.581699',1,4600.00,0.08500,4600.00),(117,'2017-10-21 07:18:16.318939','2017-10-21 07:18:16.932915',1,1400.00,0.08500,1400.00),(118,'2017-10-22 09:20:05.412939','2017-10-22 09:20:23.733718',1,0.00,0.08500,0.00);
/*!40000 ALTER TABLE `cart_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_cartitem`
--

DROP TABLE IF EXISTS `cart_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_cartitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(10) unsigned NOT NULL,
  `cart_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `line_item_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_cartitem_cart_id_370ad265_fk_cart_cart_id` (`cart_id`),
  KEY `cart_cartitem_item_id_f315a26e_fk_stock_variation_id` (`item_id`),
  CONSTRAINT `cart_cartitem_cart_id_370ad265_fk_cart_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart_cart` (`id`),
  CONSTRAINT `cart_cartitem_item_id_f315a26e_fk_stock_variation_id` FOREIGN KEY (`item_id`) REFERENCES `stock_variation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_cartitem`
--

LOCK TABLES `cart_cartitem` WRITE;
/*!40000 ALTER TABLE `cart_cartitem` DISABLE KEYS */;
INSERT INTO `cart_cartitem` VALUES (9,1,5,1,2600.00),(10,4,5,2,5600.00),(12,1,6,4,2000.00),(13,1,7,4,2000.00),(14,1,8,1,2600.00),(15,1,9,5,2000.00),(19,1,11,5,2000.00),(24,2,15,4,4000.00),(26,1,16,3,2000.00),(29,9,17,5,18000.00),(30,3,18,3,6000.00),(31,1,19,1,2600.00),(32,3,20,5,6000.00),(34,3,21,3,6000.00),(35,3,22,3,6000.00),(36,1,23,1,2600.00),(38,1,24,4,2000.00),(39,4,25,4,8000.00),(43,1,27,4,2000.00),(44,1,28,1,2600.00),(45,3,28,2,4200.00),(46,1,30,1,2600.00),(48,1,31,4,2000.00),(49,1,32,4,2000.00),(51,1,33,4,2000.00),(52,1,34,1,2600.00),(53,1,35,1,2600.00),(54,1,36,4,2000.00),(55,1,36,2,1400.00),(56,1,37,4,2000.00),(57,1,38,1,2600.00),(60,1,39,1,2600.00),(61,1,40,1,2600.00),(62,1,41,1,2600.00),(63,2,42,1,5200.00),(64,1,43,4,2000.00),(65,1,44,4,2000.00),(66,1,44,1,2600.00),(69,1,45,4,2000.00),(70,2,45,1,5200.00),(72,6,46,4,12000.00),(73,1,46,1,2600.00),(76,1,48,4,2000.00),(77,1,49,4,2000.00),(80,1,50,4,2000.00),(81,1,50,1,2600.00),(82,1,51,1,2600.00),(83,1,52,4,2000.00),(84,1,53,1,2600.00),(85,4,54,4,8000.00),(86,3,55,3,6000.00),(87,1,56,1,2600.00),(88,1,57,4,2000.00),(92,1,59,1,2600.00),(95,1,60,1,2600.00),(97,1,61,4,2000.00),(99,1,62,2,1400.00),(100,1,63,1,2600.00),(101,1,64,3,2000.00),(102,1,65,2,1400.00),(103,1,65,4,2000.00),(104,1,66,1,2600.00),(106,1,68,1,2600.00),(110,1,69,4,2000.00),(111,6,69,1,15600.00),(113,1,70,4,2000.00),(114,1,71,4,2000.00),(115,3,72,4,6000.00),(116,2,67,2,2800.00),(117,1,67,1,2600.00),(119,1,67,5,2000.00),(123,7,73,4,14000.00),(124,3,73,1,7800.00),(125,1,74,1,2600.00),(126,3,74,4,6000.00),(127,1,76,1,2600.00),(130,3,79,1,7800.00),(131,1,80,1,2600.00),(132,1,81,1,2600.00),(134,1,82,1,2600.00),(135,1,83,1,2600.00),(136,1,84,4,2000.00),(137,1,85,1,2600.00),(138,1,87,4,2000.00),(139,1,88,4,2000.00),(140,1,89,2,1400.00),(141,1,90,4,2000.00),(142,1,91,4,2000.00),(143,1,92,1,2600.00),(144,1,93,4,2000.00),(146,3,94,4,6000.00),(147,1,95,4,2000.00),(148,1,96,1,2600.00),(150,1,97,1,2600.00),(151,1,97,4,2000.00),(154,1,98,1,2600.00),(155,1,99,4,2000.00),(157,1,100,4,2000.00),(158,1,101,1,2600.00),(159,1,101,4,2000.00),(160,1,102,4,2000.00),(161,1,103,3,2000.00),(162,1,104,2,1400.00),(163,1,104,4,2000.00),(179,1,106,4,2000.00),(182,1,107,4,2000.00),(185,1,108,4,2000.00),(186,1,108,1,2600.00),(187,1,109,4,2000.00),(188,1,109,1,2600.00),(189,1,110,4,2000.00),(190,1,110,1,2600.00),(191,1,111,4,2000.00),(192,1,111,1,2600.00),(194,1,112,2,1400.00),(195,1,113,2,1400.00),(196,1,114,4,2000.00),(199,1,116,1,2600.00),(200,1,116,4,2000.00),(201,1,117,2,1400.00);
/*!40000 ALTER TABLE `cart_cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-01-31 21:38:47','1','tony',1,'[{\"added\": {}}]',7,1),(2,'2017-01-31 21:44:55','1','Trousers',1,'[{\"added\": {}}]',NULL,1),(3,'2017-01-31 21:45:16','1','khaki',1,'[{\"added\": {}}]',9,1),(4,'2017-01-31 23:14:03','2','official shirts',1,'[{\"added\": {}}]',NULL,1),(5,'2017-01-31 23:14:17','3','Jeans',1,'[{\"added\": {}}]',NULL,1),(6,'2017-01-31 23:14:55','4','shorts',1,'[{\"added\": {}}]',NULL,1),(7,'2017-01-31 23:15:07','5','Boxers',1,'[{\"added\": {}}]',NULL,1),(8,'2017-01-31 23:15:18','6','official shoes',1,'[{\"added\": {}}]',NULL,1),(9,'2017-01-31 23:15:24','7','casual shoes',1,'[{\"added\": {}}]',NULL,1),(10,'2017-01-31 23:15:37','8','T-shirts',1,'[{\"added\": {}}]',NULL,1),(11,'2017-01-31 23:15:47','9','second-hand tshirts',1,'[{\"added\": {}}]',NULL,1),(12,'2017-01-31 23:16:00','10','second-hand trousers',1,'[{\"added\": {}}]',NULL,1),(13,'2017-01-31 23:16:36','11','jackets and blazers',1,'[{\"added\": {}}]',NULL,1),(14,'2017-01-31 23:16:48','12','belts',1,'[{\"added\": {}}]',NULL,1),(15,'2017-01-31 23:17:05','13','vests and body hugs',1,'[{\"added\": {}}]',NULL,1),(16,'2017-01-31 23:17:38','14','sweaters and Jampers',1,'[{\"added\": {}}]',NULL,1),(17,'2017-01-31 23:28:56','2','jeans',1,'[{\"added\": {}}]',9,1),(18,'2017-01-31 23:29:29','3','jeans',1,'[{\"added\": {}}]',9,1),(19,'2017-02-04 23:11:40','1','khaki',1,'[{\"added\": {}}]',11,1),(20,'2017-02-10 09:36:49','15','shirts',1,'[{\"added\": {}}]',NULL,1),(21,'2017-02-10 10:06:49','4','slim fit shirt',1,'[{\"added\": {}}]',9,1),(22,'2017-02-10 10:08:03','16','wallets',1,'[{\"added\": {}}]',NULL,1),(23,'2017-02-10 10:08:39','1','Njami',1,'[{\"added\": {}}]',10,1),(24,'2017-02-10 10:31:55','2','Russian',1,'[{\"added\": {}}]',10,1),(25,'2017-02-10 11:06:33','3','slim fit shirt',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',11,1),(26,'2017-02-10 16:11:25','2','Ngugi',1,'[{\"added\": {}}]',7,1),(27,'2017-02-10 16:12:30','3','Big Ben',1,'[{\"added\": {}}]',7,1),(28,'2017-02-10 16:13:39','2','jeans',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',11,1),(29,'2017-02-13 00:10:21','5','boxer',1,'[{\"added\": {}}]',9,1),(30,'2017-02-13 00:14:33','17','caps',1,'[{\"added\": {}}]',NULL,1),(31,'2017-02-13 00:18:09','4','boxer',1,'[{\"added\": {}}]',11,1),(32,'2017-02-14 08:20:27','1','zara man',1,'[{\"added\": {}}]',NULL,1),(33,'2017-02-14 08:21:05','1','zara man',2,'[{\"changed\": {\"fields\": [\"size\"]}}]',NULL,1),(34,'2017-04-22 11:57:41','3','dfd',3,'',NULL,1),(35,'2017-04-22 11:57:41','2','sdf',3,'',NULL,1),(36,'2017-04-28 07:12:32','6','Artigian lofa',1,'[{\"added\": {}}]',9,1),(37,'2017-04-28 12:32:14','2','nike',1,'[{\"added\": {}}]',NULL,1),(38,'2017-05-22 11:11:24','5','slim fit shirt',3,'',11,1),(39,'2017-05-22 13:28:47','6','boxer',3,'',11,1),(40,'2017-05-26 14:12:40','3','slim fit shirt',3,'',11,1),(41,'2017-05-26 14:14:15','4','slim fit shirt',1,'[{\"added\": {}}]',11,1),(42,'2017-05-26 14:22:28','5','Artigian lofa',1,'[{\"added\": {}}]',11,1),(43,'2017-05-26 14:23:10','1','shoes',1,'[{\"added\": {}}]',14,1),(44,'2017-05-26 14:23:15','6','Artigian lofa',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',9,1),(45,'2017-05-26 14:24:47','2','boxers',1,'[{\"added\": {}}]',14,1),(46,'2017-05-26 14:25:31','6','boxer',1,'[{\"added\": {}}]',11,1),(47,'2017-05-26 14:25:34','5','boxer',2,'[{\"changed\": {\"fields\": [\"category\", \"image\"]}}]',9,1),(48,'2017-05-26 14:25:49','4','slim fit shirt',2,'[{\"changed\": {\"fields\": [\"size\", \"image\"]}}]',9,1),(49,'2017-05-26 14:26:01','3','jeans',3,'',9,1),(50,'2017-05-26 14:28:04','7','jeans',1,'[{\"added\": {}}]',11,1),(51,'2017-05-26 14:28:53','3','trousers',1,'[{\"added\": {}}]',14,1),(52,'2017-05-26 14:29:21','2','jeans',2,'[{\"changed\": {\"fields\": [\"category\", \"size\", \"image\"]}}]',9,1),(53,'2017-05-26 14:30:54','8','khaki',1,'[{\"added\": {}}]',11,1),(54,'2017-05-26 14:31:08','1','khaki',2,'[{\"changed\": {\"fields\": [\"category\", \"size\", \"image\"]}}]',9,1),(55,'2017-05-26 14:38:06','4','caps and others',1,'[{\"added\": {}}]',14,1),(56,'2017-05-26 14:39:34','7','cap',1,'[{\"added\": {}}]',9,1),(57,'2017-05-26 14:42:51','9','cap',1,'[{\"added\": {}}]',11,1),(58,'2017-05-26 14:43:08','7','cap',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',9,1),(59,'2017-05-29 10:09:22','8','adidas sport shoe',1,'[{\"added\": {}}]',9,1),(60,'2017-05-29 10:09:54','10','adidas sport shoe',1,'[{\"added\": {}}]',11,1),(61,'2017-05-29 10:09:58','8','adidas sport shoe',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',9,1),(62,'2017-05-29 11:25:52','3','clarks official',1,'[{\"added\": {}}]',NULL,1),(63,'2017-05-30 06:54:46','5','shirts',1,'[{\"added\": {}}]',14,1),(64,'2017-05-30 06:55:14','4','slim fit shirt',2,'[{\"changed\": {\"fields\": [\"category\"]}}]',9,1),(65,'2017-06-18 11:22:00','6','',3,'',NULL,1),(66,'2017-06-18 11:22:00','5','',3,'',NULL,1),(67,'2017-06-18 11:22:00','4','',3,'',NULL,1),(68,'2017-06-18 11:22:00','3','',3,'',NULL,1),(69,'2017-06-18 11:39:49','8','adidas sport shoe',2,'[{\"changed\": {\"fields\": [\"details\"]}}]',9,1),(70,'2017-06-18 11:39:59','7','cap',2,'[{\"changed\": {\"fields\": [\"details\"]}}]',9,1),(71,'2017-06-18 11:40:11','6','Artigian lofa',2,'[{\"changed\": {\"fields\": [\"details\"]}}]',9,1),(72,'2017-06-18 11:40:17','5','boxer',2,'[]',9,1),(73,'2017-06-18 11:40:29','4','slim fit shirt',2,'[{\"changed\": {\"fields\": [\"details\"]}}]',9,1),(74,'2017-06-18 11:40:45','2','jeans',2,'[{\"changed\": {\"fields\": [\"details\"]}}]',9,1),(75,'2017-06-18 11:40:54','1','khaki',2,'[{\"changed\": {\"fields\": [\"details\"]}}]',9,1),(76,'2017-06-18 11:41:25','5','shirts',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',14,1),(77,'2017-06-18 11:42:38','4','caps and others',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',14,1),(78,'2017-06-18 11:43:18','3','trousers',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',14,1),(79,'2017-06-18 11:43:45','2','boxers',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',14,1),(80,'2017-06-18 11:44:15','1','shoes',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',14,1),(81,'2017-06-19 05:59:51','2','jeans',2,'[{\"changed\": {\"fields\": [\"size\"]}}]',9,1),(82,'2017-06-19 06:02:39','1','khaki',2,'[{\"changed\": {\"fields\": [\"size\"]}}]',9,1),(83,'2017-06-19 06:02:53','5','boxer',2,'[{\"changed\": {\"fields\": [\"size\"]}}]',9,1),(84,'2017-06-19 06:04:39','4','slim fit shirt',2,'[{\"changed\": {\"fields\": [\"size\"]}}]',9,1),(85,'2017-06-19 09:11:33','10','adidas sport shoe',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',11,1),(86,'2017-06-19 12:51:17','8','',3,'',NULL,1),(87,'2017-06-20 21:13:08','1','hugo boss official',1,'[{\"added\": {}}]',16,1),(88,'2017-06-25 09:46:44','12','boxer',3,'',NULL,1),(89,'2017-06-25 09:46:44','11','jeans',3,'',NULL,1),(90,'2017-06-25 09:46:44','10','cap',3,'',NULL,1),(91,'2017-06-25 09:46:44','9','Artigian lofa',3,'',NULL,1),(92,'2017-06-25 09:46:44','7','slim fit shirt',3,'',NULL,1),(93,'2017-06-25 09:46:44','1','sfd',3,'',NULL,1),(94,'2017-06-25 10:03:58','19','ddf',3,'',NULL,1),(95,'2017-06-25 10:12:52','17','boxer',3,'',NULL,1),(96,'2017-06-25 10:12:52','16','slim fit shirt',3,'',NULL,1),(97,'2017-06-25 10:12:52','15','jeans',3,'',NULL,1),(98,'2017-06-25 10:12:52','14','adidas sport shoe',3,'',NULL,1),(99,'2017-06-25 10:12:52','13','cap',3,'',NULL,1),(100,'2017-06-25 13:07:50','20','shoe',1,'[{\"added\": {}}]',NULL,1),(101,'2017-06-25 13:19:30','20','shoe',3,'',NULL,1),(102,'2017-06-25 13:48:23','2','khaki trouser',2,'[{\"changed\": {\"fields\": [\"name\", \"size\"]}}]',NULL,1),(103,'2017-07-06 18:19:07','1','straight',1,'[{\"added\": {}}]',21,1),(104,'2017-07-07 03:26:30','2','slim fit',1,'[{\"added\": {}}]',21,1),(105,'2017-07-09 07:34:39','3','elastic size',1,'[{\"added\": {}}]',21,1),(106,'2017-07-09 07:35:04','3','regular fit',2,'[{\"changed\": {\"fields\": [\"product\", \"title\", \"price\", \"sale_price\"]}}]',21,1),(107,'2017-07-09 08:58:45','4','slim',1,'[{\"added\": {}}]',21,1),(108,'2017-07-09 08:59:34','5','height 42',1,'[{\"added\": {}}]',21,1),(109,'2017-07-10 17:37:50','3','ngeroge',3,'',3,1),(110,'2017-07-10 17:46:32','5','john',3,'',3,1),(111,'2017-07-10 18:02:54','2','johncon',3,'',3,1),(112,'2017-07-10 18:02:54','4','ngeorge',3,'',3,1),(113,'2017-07-11 00:01:19','1','abc@gmail.com',1,'[{\"added\": {}}]',24,1),(114,'2017-07-11 00:02:02','1','umoja',1,'[{\"added\": {}}]',25,1),(115,'2017-07-11 00:02:26','2','johncon@gmail.com',1,'[{\"added\": {}}]',24,1),(116,'2017-07-11 00:03:03','2','likoni',1,'[{\"added\": {}}]',25,1),(117,'2017-07-11 03:36:47','2','likoni',2,'[{\"changed\": {\"fields\": [\"type\"]}}]',25,1),(118,'2017-07-11 03:36:56','1','umoja',2,'[{\"changed\": {\"fields\": [\"type\"]}}]',25,1),(119,'2017-07-11 03:39:48','3','thika',1,'[{\"added\": {}}]',25,1),(120,'2017-07-17 08:51:18','1','1',2,'[{\"deleted\": {\"object\": \"straight\", \"name\": \"cart item\"}}]',23,1),(121,'2017-07-17 08:51:30','1','1',3,'',23,1),(122,'2017-07-17 08:51:58','13','13',3,'',23,1),(123,'2017-07-17 08:51:58','12','12',3,'',23,1),(124,'2017-07-17 08:51:58','10','10',3,'',23,1),(125,'2017-07-17 08:51:58','3','3',3,'',23,1),(126,'2017-07-17 08:51:58','2','2',3,'',23,1),(127,'2017-07-17 09:42:53','14','14',3,'',23,1),(128,'2017-08-21 09:11:41','7','njami',3,'',10,1),(129,'2017-08-24 06:01:28','1','official',1,'[{\"added\": {}}]',27,1),(130,'2017-08-25 08:42:17','9','sport shoe',1,'[{\"added\": {}}]',9,1),(131,'2017-08-25 08:43:09','12','sport shoe',1,'[{\"added\": {}}]',11,1),(132,'2017-08-25 08:52:28','12','sport shoe',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',11,1),(133,'2017-08-25 08:53:13','12','sport shoe',2,'[]',11,1),(134,'2017-08-25 08:54:38','9','sport shoe',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',9,1),(135,'2017-08-25 09:08:08','3','trousers',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',14,1),(136,'2017-09-13 21:38:06','13','adidas sport shoe',1,'[{\"added\": {}}]',11,1),(137,'2017-09-13 21:38:27','5','Artigian lofa',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',11,1),(138,'2017-09-13 21:50:42','14','khaki',1,'[{\"added\": {}}]',11,1),(139,'2017-09-13 21:50:53','15','khaki',1,'[{\"added\": {}}]',11,1),(140,'2017-10-06 17:35:18','18','kimani@gmail.com',2,'[]',24,1),(141,'2017-10-06 17:36:37','17','mukami@gmail.com',2,'[{\"changed\": {\"fields\": [\"email\"]}}]',24,1),(142,'2017-10-06 17:39:23','17','alan@ymail.com',2,'[{\"changed\": {\"fields\": [\"email\", \"braintree_id\"]}}]',24,1),(143,'2017-10-06 17:40:47','20','kamam@gmail.com',1,'[{\"added\": {}}]',24,1),(144,'2017-10-06 17:42:24','20','test@gmail.com',2,'[{\"changed\": {\"fields\": [\"email\", \"braintree_id\"]}}]',24,1),(145,'2017-10-06 17:45:13','20','test2@gmai.com',2,'[{\"changed\": {\"fields\": [\"email\", \"braintree_id\"]}}]',24,1),(146,'2017-10-06 17:46:07','15','classic@gmail.com',2,'[]',24,1),(147,'2017-10-06 17:46:19','6','you@cfs.com',2,'[]',24,1),(148,'2017-10-13 09:08:01','8','ivy',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',3,1),(149,'2017-10-13 09:11:10','8','ivy',2,'[{\"changed\": {\"fields\": [\"is_active\"]}}]',3,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(2,'auth','permission'),(3,'auth','user'),(23,'cart','cart'),(22,'cart','cartitem'),(5,'contenttypes','contenttype'),(28,'django_pesapal','transaction'),(24,'orders','guestcheckout'),(26,'orders','order'),(25,'orders','useraddress'),(19,'registration','registrationprofile'),(6,'sessions','session'),(17,'shoes','category'),(16,'shoes','shoe'),(18,'sites','site'),(14,'stock','category'),(20,'stock','checkout'),(10,'stock','customer'),(9,'stock','product'),(11,'stock','productimage'),(27,'stock','shoe'),(7,'stock','supplier'),(21,'stock','variation');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-01-22 10:43:44'),(2,'auth','0001_initial','2017-01-22 10:43:52'),(3,'admin','0001_initial','2017-01-22 10:43:54'),(4,'admin','0002_logentry_remove_auto_add','2017-01-22 10:43:54'),(5,'contenttypes','0002_remove_content_type_name','2017-01-22 10:43:56'),(6,'auth','0002_alter_permission_name_max_length','2017-01-22 10:43:56'),(7,'auth','0003_alter_user_email_max_length','2017-01-22 10:43:56'),(8,'auth','0004_alter_user_username_opts','2017-01-22 10:43:56'),(9,'auth','0005_alter_user_last_login_null','2017-01-22 10:43:56'),(10,'auth','0006_require_contenttypes_0002','2017-01-22 10:43:57'),(11,'auth','0007_alter_validators_add_error_messages','2017-01-22 10:43:57'),(12,'auth','0008_alter_user_username_max_length','2017-01-22 10:43:57'),(13,'sessions','0001_initial','2017-01-22 10:43:58'),(14,'stock','0001_initial','2017-01-22 10:43:58'),(15,'stock','0002_auto_20170119_1942','2017-01-22 10:44:03'),(16,'stock','0003_productimage','2017-01-22 10:44:04'),(17,'stock','0004_auto_20170122_0950','2017-01-22 10:44:05'),(18,'stock','0005_product_category','2017-01-22 10:44:07'),(19,'stock','0006_auto_20170122_0957','2017-01-22 10:44:08'),(20,'stock','0007_auto_20170122_0958','2017-01-22 10:44:09'),(21,'stock','0008_auto_20170122_1001','2017-01-22 10:44:11'),(22,'stock','0009_auto_20170122_1013','2017-01-22 10:44:12'),(23,'stock','0010_auto_20170122_1016','2017-01-22 10:44:14'),(24,'stock','0011_remove_product_category','2017-01-22 10:44:14'),(25,'stock','0012_delete_category','2017-01-22 10:44:15'),(26,'stock','0013_auto_20170122_1043','2017-01-22 10:44:17'),(27,'stock','0014_auto_20170210_1005','2017-02-10 10:05:49'),(28,'stock','0015_category_description','2017-02-10 10:05:50'),(29,'stock','0016_auto_20170210_1028','2017-02-10 10:29:06'),(30,'stock','0017_auto_20170211_1110','2017-02-13 01:05:47'),(31,'stock','0018_auto_20170211_1111','2017-02-13 01:05:47'),(32,'stock','0019_auto_20170211_1113','2017-02-13 01:05:47'),(33,'stock','0020_auto_20170211_1113','2017-02-13 01:05:47'),(34,'stock','0021_auto_20170211_1114','2017-02-13 01:05:47'),(35,'stock','0022_auto_20170211_1123','2017-02-13 01:05:47'),(36,'stock','0023_auto_20170213_0018','2017-02-13 01:05:47'),(37,'stock','0024_shoe','2017-02-14 07:58:36'),(38,'stock','0025_auto_20170214_0807','2017-02-14 08:08:04'),(39,'stock','0026_auto_20170214_0819','2017-02-14 08:19:57'),(40,'stock','0027_auto_20170214_0829','2017-02-14 08:29:11'),(41,'stock','0028_auto_20170307_0953','2017-03-07 10:02:00'),(42,'stock','0029_auto_20170307_0954','2017-03-07 10:02:00'),(43,'stock','0030_auto_20170307_0956','2017-03-07 10:02:00'),(44,'stock','0031_product_date','2017-03-07 10:02:00'),(45,'stock','0032_auto_20170311_0627','2017-03-11 06:27:13'),(46,'stock','0033_auto_20170311_0633','2017-03-11 10:08:30'),(47,'stock','0034_auto_20170311_0646','2017-03-11 10:08:30'),(48,'stock','0035_orders','2017-04-22 11:34:58'),(49,'stock','0036_auto_20170422_1134','2017-04-22 11:34:58'),(50,'stock','0037_auto_20170505_1237','2017-05-05 12:38:02'),(51,'stock','0038_auto_20170505_1243','2017-05-05 13:08:20'),(52,'stock','0039_remove_product_category','2017-05-05 13:08:20'),(53,'stock','0040_delete_category','2017-05-05 13:08:21'),(54,'stock','0041_category','2017-05-05 13:08:21'),(55,'stock','0042_product_category','2017-05-05 13:08:21'),(56,'stock','0043_product_image','2017-05-22 13:08:06'),(57,'stock','0044_remove_product_image','2017-05-23 16:11:37'),(58,'stock','0045_product_image','2017-05-26 14:20:26'),(59,'stock','0046_auto_20170526_1439','2017-05-26 14:39:25'),(60,'stock','0047_auto_20170530_0536','2017-05-30 05:37:04'),(61,'stock','0048_auto_20170530_0815','2017-05-30 08:16:07'),(62,'stock','0049_checkout','2017-06-01 18:46:55'),(63,'stock','0050_auto_20170618_0600','2017-06-18 06:00:52'),(64,'stock','0051_auto_20170618_1103','2017-06-18 11:03:28'),(65,'stock','0052_auto_20170618_1104','2017-06-18 11:04:25'),(66,'stock','0053_auto_20170618_1105','2017-06-18 11:05:46'),(67,'stock','0054_product_details','2017-06-18 11:39:07'),(68,'stock','0055_auto_20170619_0541','2017-06-19 05:41:22'),(69,'stock','0056_auto_20170619_0559','2017-06-19 05:59:18'),(70,'stock','0057_auto_20170619_0601','2017-06-19 06:01:38'),(71,'stock','0058_auto_20170619_0608','2017-06-19 06:08:15'),(72,'stock','0059_auto_20170619_0927','2017-06-19 09:27:11'),(73,'stock','0060_auto_20170619_0930','2017-06-19 09:30:30'),(74,'stock','0061_delete_shoe','2017-06-20 21:01:24'),(75,'shoes','0001_initial','2017-06-20 21:10:09'),(76,'shoes','0002_auto_20170620_2136','2017-06-20 21:38:57'),(77,'shoes','0003_auto_20170620_2138','2017-06-20 21:38:57'),(78,'shoes','0004_auto_20170620_2204','2017-06-20 22:05:28'),(79,'stock','0062_product_status','2017-06-23 13:51:49'),(80,'registration','0001_initial','2017-06-27 11:39:04'),(81,'registration','0002_registrationprofile_activated','2017-06-27 11:39:04'),(82,'registration','0003_migrate_activatedstatus','2017-06-27 11:39:04'),(83,'sites','0001_initial','2017-06-27 11:39:05'),(84,'sites','0002_alter_domain_unique','2017-06-27 11:39:05'),(85,'stock','0063_auto_20170705_0806','2017-07-05 08:06:27'),(86,'stock','0064_auto_20170705_1038','2017-07-05 10:39:12'),(87,'stock','0065_variation','2017-07-06 18:17:41'),(88,'cart','0001_initial','2017-07-06 20:56:17'),(89,'cart','0002_auto_20170709_1208','2017-07-09 12:08:30'),(90,'cart','0003_cartitem_line_item_total','2017-07-10 09:19:35'),(91,'cart','0004_cart_subtotal','2017-07-10 09:42:10'),(92,'cart','0005_auto_20170710_1038','2017-07-10 10:38:35'),(93,'orders','0001_initial','2017-07-10 21:56:37'),(94,'orders','0002_auto_20170710_2239','2017-07-10 22:39:25'),(95,'orders','0003_useraddress','2017-07-10 23:59:58'),(96,'orders','0004_auto_20170711_0331','2017-07-11 03:32:01'),(97,'orders','0005_remove_useraddress_shipping_address','2017-07-11 03:36:30'),(98,'orders','0006_order','2017-07-13 09:01:42'),(99,'cart','0006_auto_20170713_1240','2017-07-13 12:41:04'),(100,'orders','0007_auto_20170715_0019','2017-07-15 00:19:46'),(101,'cart','0007_auto_20170715_0050','2017-07-15 00:50:10'),(102,'orders','0008_order_status','2017-07-16 12:04:29'),(103,'cart','0008_remove_cart_tax_total','2017-07-17 06:01:03'),(104,'cart','0009_auto_20170717_0612','2017-07-17 06:13:03'),(105,'cart','0010_auto_20170717_0833','2017-07-17 08:39:42'),(106,'cart','0011_auto_20170717_0834','2017-07-17 08:39:42'),(107,'cart','0012_auto_20170717_0835','2017-07-17 08:39:42'),(108,'cart','0013_auto_20170717_0836','2017-07-17 08:39:42'),(109,'cart','0014_auto_20170717_0949','2017-07-17 09:50:02'),(110,'cart','0015_auto_20170717_1011','2017-07-17 10:11:31'),(111,'orders','0009_auto_20170723_0100','2017-07-23 01:00:33'),(112,'cart','0016_auto_20170725_0547','2017-07-25 05:47:15'),(113,'stock','0066_auto_20170818_0827','2017-08-18 08:27:46'),(114,'stock','0067_auto_20170821_0807','2017-08-21 08:21:59'),(115,'stock','0068_auto_20170821_0815','2017-08-21 08:21:59'),(116,'stock','0069_remove_customer_product','2017-08-21 08:48:29'),(117,'stock','0070_auto_20170821_0851','2017-08-21 08:52:32'),(118,'stock','0071_remove_customer_created_at','2017-08-21 08:52:32'),(119,'stock','0072_customer_created_at','2017-08-21 08:59:04'),(120,'stock','0073_auto_20170821_1113','2017-08-21 11:13:33'),(121,'stock','0074_customer_size','2017-08-21 12:14:56'),(122,'orders','0010_auto_20170824_0559','2017-08-24 05:59:41'),(123,'stock','0075_shoe','2017-08-24 05:59:43'),(124,'stock','0076_customer_product','2017-08-27 10:27:51'),(125,'orders','0011_order_date','2017-09-22 08:37:42'),(126,'orders','0012_auto_20170922_0839','2017-09-22 08:41:49'),(127,'orders','0013_auto_20170922_0841','2017-09-22 08:41:49'),(128,'stock','0077_auto_20170922_0839','2017-09-22 08:43:00'),(129,'stock','0078_auto_20170922_0841','2017-09-22 08:43:00'),(130,'orders','0014_auto_20170922_1843','2017-09-22 18:43:15'),(131,'orders','0015_auto_20170922_1844','2017-09-22 18:44:14'),(132,'stock','0079_auto_20170922_1843','2017-09-22 18:44:41'),(133,'stock','0080_auto_20170922_1844','2017-09-22 18:44:41'),(134,'django_pesapal','0001_initial','2017-09-28 19:17:52'),(135,'django_pesapal','0002_transaction_payment_status','2017-09-28 19:17:53'),(136,'django_pesapal','0003_transaction_payment_method','2017-09-28 19:17:54'),(137,'django_pesapal','0004_auto_20150812_0051','2017-09-28 19:17:54'),(138,'django_pesapal','0005_auto_20160503_1036','2017-09-28 19:17:54'),(139,'orders','0016_auto_20170924_0840','2017-09-28 19:17:55'),(140,'orders','0017_auto_20170928_1917','2017-09-28 19:17:55'),(141,'stock','0081_auto_20170924_0840','2017-09-28 19:17:56'),(142,'stock','0082_auto_20170928_1917','2017-09-28 19:17:56'),(143,'orders','0018_auto_20170928_1929','2017-09-28 19:30:06'),(144,'stock','0083_auto_20170928_1929','2017-09-28 19:30:07'),(145,'orders','0019_guestcheckout_braintree_id','2017-10-04 09:43:14'),(146,'orders','0020_auto_20171006_1913','2017-10-06 19:13:15'),(147,'orders','0021_auto_20171006_1946','2017-10-06 19:46:59'),(148,'orders','0022_remove_order_order_id','2017-10-06 20:04:05'),(149,'orders','0023_auto_20171010_2321','2017-10-10 23:21:40'),(150,'orders','0024_order_order_id','2017-10-14 22:46:39');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_pesapal_transaction`
--

DROP TABLE IF EXISTS `django_pesapal_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_pesapal_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pesapal_transaction` char(32) NOT NULL,
  `merchant_reference` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `created` datetime(6) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `payment_method` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_pesapal_transaction_merchant_reference_2a40709c_uniq` (`merchant_reference`,`pesapal_transaction`),
  KEY `django_pesapal_transaction_6c2669a6` (`merchant_reference`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_pesapal_transaction`
--

LOCK TABLES `django_pesapal_transaction` WRITE;
/*!40000 ALTER TABLE `django_pesapal_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_pesapal_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1man2qdpiekuthts1jhclbn6zqmwzkew','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-10-27 09:24:53'),('1qswj49qd0rpu7l9ptgmlggd92mzq4rs','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-09-29 04:46:35'),('2squh7el9r92l7ru50mdwr02wx8b4o24','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-10-17 06:27:01'),('4iy9i5tsgowdu7lm38ugc5u41ghxlj96','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-11-05 09:20:26'),('51vxfswb3vwmvrxs3yiladx3b1ucxcph','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-10-08 10:27:52'),('5onfxdz341wnfhj9pxv10kkzyxq7jn71','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-09-07 08:02:08'),('7rdusn28ynfn8428havbt7trfjqox9m4','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-10-17 08:17:55'),('8egljcxrb5eouk5r59me8ug7nqgm08te','ZmNiYzhhYjE0ZDA5OTc4MzJlNDNkYWU5ODI2ODlmM2VlZjgzMGY4MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiZ3Vlc3RfY2hlY2tvdXRfaWQiOjMsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwic2hpcHBpbmdfYWRkcmVzc19pZCI6NCwiX3Nlc3Npb25fZXhwaXJ5IjowLCJfYXV0aF91c2VyX2hhc2giOiIxODI5ZGYxODk2ZWJlY2MyYTVhZmMyY2E2MTc4ZWMwZGU4NjQxNmVkIiwiYmlsbGluZ19hZGRyZXNzX2lkIjozfQ==','2017-08-23 18:17:20'),('8zj94fttitqhsbq962w4shr2mg2vthtn','ZmZlMzRhN2JhNDE1MmJmZWE3Yzg0ZTNmZTIyYmNhOWZmNDc5ODc2Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjE4MjlkZjE4OTZlYmVjYzJhNWFmYzJjYTYxNzhlYzBkZTg2NDE2ZWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-02-10 20:02:18'),('9w0g3exqirgekn98deyzos0nt6u32i0j','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-10-27 09:06:17'),('afennohrw4s7vqs4kcmwhlwiktsl9m3g','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-10-17 06:04:09'),('apzpfbz8n8tee81xaxily53guq9u9byr','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-10-28 15:56:40'),('asazudwrs9jdhlvawmkvbigudeahqttk','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-10-20 18:53:38'),('az3ks5im1gtm5s5mz7pzkd3vf8fqnv32','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-10-17 06:26:21'),('bixw2ei21dwzw5wdl7vcoawd81yb2ctx','ZmZlMzRhN2JhNDE1MmJmZWE3Yzg0ZTNmZTIyYmNhOWZmNDc5ODc2Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjE4MjlkZjE4OTZlYmVjYzJhNWFmYzJjYTYxNzhlYzBkZTg2NDE2ZWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-05-10 00:05:32'),('bltkzwa6s1e2d0lbeorq7qticveq57yz','ZmZlMzRhN2JhNDE1MmJmZWE3Yzg0ZTNmZTIyYmNhOWZmNDc5ODc2Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjE4MjlkZjE4OTZlYmVjYzJhNWFmYzJjYTYxNzhlYzBkZTg2NDE2ZWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-07-30 12:30:11'),('bsdqp5iuopisb38g962umi548aq307sf','ZmZlMzRhN2JhNDE1MmJmZWE3Yzg0ZTNmZTIyYmNhOWZmNDc5ODc2Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjE4MjlkZjE4OTZlYmVjYzJhNWFmYzJjYTYxNzhlYzBkZTg2NDE2ZWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-07-09 13:18:13'),('c26e7a8n4rchh9vxdkrg080kyfh5ei0z','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-09-29 05:17:58'),('cr9soyrqr3ow9dbj7ojsnoini72f0htq','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-09-07 07:37:07'),('dbbb62ujmx6oqn2hzvis4xgv9zdje892','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-10-27 09:08:12'),('eh6mnr1aoi19qpcm1tgeozcuyzmo9vsg','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-10-17 18:52:19'),('fpbz81m0qvnp11vssqpvbsi4k42tugt9','YjZlMDc1NWNmZDYzMjExMzFkMjUwZjI0OGEwNDdmMWNkMzA0ODY2Njp7ImNhcnRfaWQiOjM4LCJfc2Vzc2lvbl9leHBpcnkiOjB9','2017-09-05 05:35:02'),('gduc6aqlip9f7xf1wolce8wvg52w0mix','MzlmYzQzODdmMWMzODk5ZjA3NzgzZDU3NTI5YzBmZmMwNDBkNDE2NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE4MjlkZjE4OTZlYmVjYzJhNWFmYzJjYTYxNzhlYzBkZTg2NDE2ZWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiY2FydF9pdGVtX2NvdW50IjowfQ==','2017-11-07 06:40:46'),('hah4ucbninumucz3p4ob2ero9yxqussk','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-11-04 07:17:25'),('iem6e3oyijx307ylj9hd4hzjwlyv0wz4','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-10-08 08:41:33'),('im3pr123cd5cy4yewb5zlvdwh4zyz6u5','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-09-29 18:40:02'),('j95rk3if5d4yk1zia7lntyml0yzz2qhm','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-10-15 05:30:44'),('jfluv45fe0icqz7y5hen484hcnaysqmd','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-10-30 04:50:49'),('jlt8joqmz8fjg4ergvq2304aocm9bnad','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-10-17 07:24:13'),('jnfmvs8hayzd5q77uccu5xe1j5n4jqri','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-10-23 05:03:16'),('jnw9mrlra0e662a4g0r2sjwcr2efpbw0','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-09-07 04:23:41'),('m8eju2dlnyj42fqquufugn8htnc04bau','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-10-20 19:48:29'),('mffbnbk6nn9em9ulyvuqkhgq1plwl5yo','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-10-02 13:43:17'),('mgw2sgpd9m7opk8wtgrt33p2xshb8tcf','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-11-01 15:38:37'),('mkh0znglqrfdbb2vgj4iogsdmsj7zjq3','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-09-06 13:13:47'),('nrakhz3raaulnxmlfsad5hnbnl9usxsv','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-09-08 08:37:19'),('nv8jj3yolp3gymo46lm2wbcap8kylrem','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-10-20 19:24:48'),('ogof9h6txw4m7isimdtp3654rnd21u5u','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-10-24 21:55:07'),('oxudk0480sf5ey0os82bc1x0sb0mwluj','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-10-20 19:32:23'),('pbr2theolffieuygyaabw03nyu94ilwv','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-10-27 09:11:22'),('pf4c00iprstllyw9pmti0j861ev7xf4a','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-09-07 04:38:17'),('qb57i6qkcnhyhh7b9jl4j1h1dxki855o','NjZjMDZkN2NjYTRkNGRiODk2ODRmMWQ3NzNmZWZhZDA0YjNkYjFkMTp7ImNhcnRfaWQiOjQwLCJfc2Vzc2lvbl9leHBpcnkiOjB9','2017-09-05 08:59:28'),('sboomyvgmywnqjzi7r82r3gin2ipb4ll','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-10-20 23:11:20'),('sm3ri13v545ymnkw8ha0jefryioay8w1','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-10-23 12:21:36'),('swu6winrcippm1ix4e6bir82krv3xv5t','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-09-07 07:40:42'),('t685oazofd962z91hkvf6x6sdynvlxh7','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-10-13 02:50:55'),('trkhnh8sx0sp7zg0xd3jcrbp1zvt8qxg','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-09-07 05:25:38'),('u1yem6cgcmzqmvnixkkm16a87mcifdc8','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-10-17 07:17:51'),('uloek96fd0cyazdobfe7r58s2uveoemf','NGJhZmM1ZGM4ZDhhOGIyYzZhZWRlNzdiMzUxMTFmOTNkMjZjOTU5Njp7ImNhcnRfaWQiOjM0LCJfc2Vzc2lvbl9leHBpcnkiOjB9','2017-09-01 12:26:21'),('vt80wcif55j67anz3bdim7t8wkjbm0dj','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-11-05 18:26:39'),('wlwjx89uzmsfxis7lgv1yk9o5s7i3iou','ODRlNDNiYTA2ZGI3MzlhZWY5YmYxZTYyZmYwYmU5NTFjZTg1YjQ1ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwib3JkZXJfaWQiOjQ4LCJndWVzdF9jaGVja291dF9pZCI6MywiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJzaGlwcGluZ19hZGRyZXNzX2lkIjo0LCJfc2Vzc2lvbl9leHBpcnkiOjAsImNhcnRfaXRlbV9jb3VudCI6MSwiX2F1dGhfdXNlcl9oYXNoIjoiMTgyOWRmMTg5NmViZWNjMmE1YWZjMmNhNjE3OGVjMGRlODY0MTZlZCIsImNhcnRfaWQiOjcyLCJiaWxsaW5nX2FkZHJlc3NfaWQiOjN9','2017-10-08 10:29:48'),('xibo61y44f7ecwuu7c6ujl9wy6cyld6f','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-10-18 04:06:31'),('z55m9s5h971ldwtw8hjzozm7fq2nw2l3','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-09-07 12:51:25'),('zaj3591xf251y96u18wt52tegn6k2q4n','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-10-27 10:41:19'),('zwg2mi599ud5xns0n9c75fgn8klbntpz','NTRjMjdhMDg1NmI3ODk1MWE5NzNmNDFhMWYzOTdmMDlhMjA5YTJiNTp7ImNhcnRfaXRlbV9jb3VudCI6MH0=','2017-10-17 05:53:20');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_guestcheckout`
--

DROP TABLE IF EXISTS `orders_guestcheckout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_guestcheckout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `braintree_id` varchar(120),
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_guestcheckout_email_41c44798_uniq` (`email`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `orders_guestcheckout_user_id_9ca0d6b7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_guestcheckout`
--

LOCK TABLES `orders_guestcheckout` WRITE;
/*!40000 ALTER TABLE `orders_guestcheckout` DISABLE KEYS */;
INSERT INTO `orders_guestcheckout` VALUES (2,'johncon@gmail.com',7,NULL),(3,'njamygeorge9@gmail.com',1,'276429181'),(4,'njamigeorge@yahoo.com',6,NULL),(5,'me@cfd.com',NULL,NULL),(6,'you@cfs.com',NULL,'619954653'),(7,'jdbc@gmail.com',NULL,NULL),(8,'adbc@ymail.com',NULL,NULL),(9,'abdc1@gmail.com',NULL,NULL),(10,'wow@gmail.com',NULL,NULL),(11,'youidi@gmail.com',NULL,NULL),(12,'sfsfd@gmail.com',NULL,NULL),(13,'johnkimani@gmail.com',NULL,NULL),(14,'viber2@gmail.com',NULL,NULL),(15,'classic@gmail.com',NULL,'281783283'),(16,'cx@gmail.com',NULL,NULL),(17,'alan@ymail.com',NULL,'583574334'),(18,'kimani@gmail.com',NULL,'853250973'),(19,'kamama@gmail.com',NULL,'405687899'),(20,'test2@gmai.com',NULL,'837184716'),(24,'shirt@gmail.com',NULL,'409839269'),(25,'mine@gmail.com',NULL,'112035769'),(26,'goddy@gmail.com',NULL,'826684716'),(27,'kaka@gmail.com',NULL,'149182794'),(28,'you1@cfc.com',NULL,'181505744'),(29,'sport@gmail.com',NULL,'112557919'),(30,'sp@gmail.com',NULL,'898217481'),(31,'sfsfssf@gmail.com',NULL,'696229549'),(32,'moha@gmail.com',NULL,'203240783');
/*!40000 ALTER TABLE `orders_guestcheckout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_order`
--

DROP TABLE IF EXISTS `orders_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shipping_total_price` decimal(10,2) NOT NULL,
  `order_total` decimal(10,2) NOT NULL,
  `billing_address_id` int(11) DEFAULT NULL,
  `cart_id` int(11) NOT NULL,
  `shipping_address_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(120) NOT NULL,
  `date` datetime(6) NOT NULL,
  `order_id` varchar(10),
  PRIMARY KEY (`id`),
  KEY `orders_order_cart_id_7e0252e3_fk_cart_cart_id` (`cart_id`),
  KEY `orders_orde_billing_address_id_deb02e83_fk_orders_useraddress_id` (`billing_address_id`),
  KEY `orders_ord_shipping_address_id_c4f8227a_fk_orders_useraddress_id` (`shipping_address_id`),
  KEY `orders_order_user_id_e9b59eb1_fk_orders_guestcheckout_id` (`user_id`),
  CONSTRAINT `orders_ord_shipping_address_id_c4f8227a_fk_orders_useraddress_id` FOREIGN KEY (`shipping_address_id`) REFERENCES `orders_useraddress` (`id`),
  CONSTRAINT `orders_orde_billing_address_id_deb02e83_fk_orders_useraddress_id` FOREIGN KEY (`billing_address_id`) REFERENCES `orders_useraddress` (`id`),
  CONSTRAINT `orders_order_cart_id_7e0252e3_fk_cart_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart_cart` (`id`),
  CONSTRAINT `orders_order_user_id_e9b59eb1_fk_orders_guestcheckout_id` FOREIGN KEY (`user_id`) REFERENCES `orders_guestcheckout` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_order`
--

LOCK TABLES `orders_order` WRITE;
/*!40000 ALTER TABLE `orders_order` DISABLE KEYS */;
INSERT INTO `orders_order` VALUES (1,10.99,35.99,NULL,15,NULL,NULL,'created','2017-09-22 08:36:59.450821',NULL),(2,10.99,35.99,NULL,16,NULL,NULL,'created','2017-09-22 08:36:59.450821',NULL),(3,10.99,35.99,3,17,4,3,'completed','2017-09-22 08:36:59.450821',NULL),(4,10.99,35.99,3,18,4,3,'completed','2017-09-22 08:36:59.450821',NULL),(5,10.99,35.99,3,19,4,3,'completed','2017-09-22 08:36:59.450821',NULL),(6,10.99,35.99,3,20,4,3,'completed','2017-09-22 08:36:59.450821',NULL),(7,10.99,35.99,3,21,4,3,'completed','2017-09-22 08:36:59.450821',NULL),(8,10.99,35.99,3,22,4,3,'completed','2017-09-22 08:36:59.450821',NULL),(9,10.99,35.99,NULL,23,NULL,NULL,'created','2017-09-22 08:36:59.450821',NULL),(10,10.99,35.99,3,24,4,3,'completed','2017-09-22 08:36:59.450821',NULL),(11,10.99,35.99,3,25,4,3,'completed','2017-09-22 08:36:59.450821',NULL),(12,10.99,35.99,NULL,26,NULL,NULL,'created','2017-09-22 08:36:59.450821',NULL),(13,10.99,35.99,NULL,27,NULL,NULL,'created','2017-09-22 08:36:59.450821',NULL),(14,10.99,35.99,3,28,4,3,'completed','2017-09-22 08:36:59.450821',NULL),(15,10.99,35.99,NULL,30,NULL,NULL,'created','2017-09-22 08:36:59.450821',NULL),(16,10.99,35.99,NULL,31,NULL,NULL,'created','2017-09-22 08:36:59.450821',NULL),(17,10.99,35.99,NULL,32,NULL,NULL,'created','2017-09-22 08:36:59.450821',NULL),(18,10.99,35.99,NULL,33,NULL,NULL,'created','2017-09-22 08:36:59.450821',NULL),(19,10.99,35.99,3,36,4,3,'completed','2017-09-22 08:36:59.450821',NULL),(20,10.99,35.99,3,41,4,3,'completed','2017-09-22 08:36:59.450821',NULL),(21,10.99,35.99,3,42,4,3,'completed','2017-09-22 08:36:59.450821',NULL),(22,10.99,35.99,3,43,4,3,'completed','2017-09-22 08:36:59.450821',NULL),(23,10.99,35.99,3,44,4,3,'created','2017-09-22 08:36:59.450821',NULL),(24,10.99,35.99,3,45,4,3,'created','2017-09-22 08:36:59.450821',NULL),(25,10.99,35.99,3,46,4,3,'completed','2017-09-22 08:36:59.450821',NULL),(26,10.99,35.99,NULL,47,NULL,NULL,'created','2017-09-22 08:36:59.450821',NULL),(27,10.99,35.99,3,48,4,3,'completed','2017-09-22 08:36:59.450821',NULL),(28,10.99,35.99,3,49,7,3,'completed','2017-09-22 08:36:59.450821',NULL),(29,10.99,35.99,3,50,7,3,'completed','2017-09-22 08:36:59.450821',NULL),(30,10.99,35.99,NULL,51,NULL,NULL,'created','2017-09-22 08:36:59.450821',NULL),(31,10.99,35.99,NULL,52,NULL,NULL,'created','2017-09-22 08:36:59.450821',NULL),(32,10.99,35.99,3,53,4,3,'completed','2017-09-22 08:36:59.450821',NULL),(33,10.99,35.99,3,54,4,3,'completed','2017-09-22 08:36:59.450821',NULL),(34,10.99,35.99,3,55,4,3,'completed','2017-09-22 08:36:59.450821',NULL),(35,10.99,35.99,3,56,4,3,'completed','2017-09-22 08:36:59.450821',NULL),(36,10.99,35.99,11,57,10,13,'completed','2017-09-22 08:36:59.450821',NULL),(37,10.99,35.99,11,58,12,3,'created','2017-09-22 08:36:59.450821',NULL),(38,10.99,35.99,15,59,14,14,'completed','2017-09-22 08:36:59.450821',NULL),(39,10.99,35.99,15,60,14,14,'completed','2017-09-22 08:36:59.450821',NULL),(40,10.99,35.99,3,61,4,3,'completed','2017-09-22 08:36:59.450821',NULL),(41,10.99,35.99,3,62,4,3,'created','2017-09-22 08:36:59.450821',NULL),(42,10.99,35.99,16,63,17,15,'completed','2017-09-22 08:36:59.450821',NULL),(43,10.99,35.99,16,64,17,15,'completed','2017-09-22 08:36:59.450821',NULL),(44,10.99,35.99,16,65,17,15,'completed','2017-09-22 08:36:59.450821',NULL),(45,10.99,35.99,19,66,18,16,'completed','2017-09-22 08:36:59.450821',NULL),(46,10.99,7410.99,19,67,18,3,'completed','2017-09-22 08:51:05.008922',NULL),(47,10.99,7210.99,3,69,4,3,'created','2017-09-24 08:40:38.662061',NULL),(48,10.99,6010.99,3,72,4,3,'created','2017-09-24 10:14:14.524988',NULL),(49,10.99,19210.99,3,73,4,3,'created','2017-09-28 23:46:44.072806',NULL),(50,10.99,8610.99,3,74,4,3,'completed','2017-10-01 05:29:37.906674',NULL),(51,10.99,7810.99,3,79,4,3,'created','2017-10-03 06:17:37.787214',NULL),(52,10.99,2610.99,3,80,4,3,'completed','2017-10-03 06:26:35.980677',NULL),(53,10.99,2610.99,20,81,21,17,'completed','2017-10-03 06:27:12.800443',NULL),(54,10.99,2610.99,20,82,21,3,'completed','2017-10-03 06:37:13.312835',NULL),(55,10.99,2610.99,3,83,4,3,'completed','2017-10-03 07:45:22.740154',NULL),(56,10.99,2010.99,3,84,4,3,'completed','2017-10-03 08:19:34.512173',NULL),(57,10.99,2610.99,3,85,4,3,'completed','2017-10-03 08:25:26.343739',NULL),(58,10.99,2010.99,22,87,23,18,'completed','2017-10-04 03:44:27.267501',NULL),(59,10.99,2010.99,22,88,23,18,'completed','2017-10-04 03:51:28.531047',NULL),(60,10.99,1410.99,22,89,23,18,'completed','2017-10-04 04:05:03.815489',NULL),(61,10.99,2010.99,24,90,25,19,'completed','2017-10-04 04:06:40.094588',NULL),(62,10.99,2010.99,24,91,25,19,'completed','2017-10-04 04:13:33.107721',NULL),(63,10.99,2610.99,24,92,25,19,'completed','2017-10-04 04:18:16.991695',NULL),(64,10.99,2010.99,24,93,25,19,'completed','2017-10-04 04:21:20.407791',NULL),(65,10.99,6010.99,24,94,25,19,'completed','2017-10-04 04:40:43.901902',NULL),(66,10.99,2010.99,24,95,25,19,'completed','2017-10-06 17:05:01.509555',NULL),(67,10.99,2610.99,24,96,25,3,'created','2017-10-06 17:26:28.791156',NULL),(68,10.99,4610.99,26,97,27,24,'completed','2017-10-06 18:53:46.263001',NULL),(69,10.99,2610.99,26,98,27,3,'created','2017-10-06 19:18:38.783835',NULL),(70,10.99,2010.99,28,99,29,3,'created','2017-10-06 19:24:55.563860',NULL),(71,10.99,2010.99,30,100,31,3,'created','2017-10-06 19:32:30.483925',NULL),(72,10.99,4610.99,32,101,33,3,'paid','2017-10-06 19:48:36.866233',NULL),(73,10.99,2010.99,3,102,4,3,'created','2017-10-06 23:06:33.089460',NULL),(74,10.99,2010.99,34,103,35,3,'created','2017-10-06 23:11:33.370093',NULL),(75,10.99,3410.99,3,104,4,3,'paid','2017-10-09 12:12:20.876480',NULL),(76,10.99,2610.99,36,105,37,3,'created','2017-10-09 13:55:48.092146',NULL),(77,10.99,2010.99,38,106,39,3,'created','2017-10-10 21:55:16.673406',NULL),(78,10.99,2010.99,3,107,4,3,'created','2017-10-13 09:32:21.124228',NULL),(79,10.99,4610.99,3,108,4,3,'created','2017-10-13 10:41:26.627198',NULL),(80,10.99,4610.99,3,109,4,3,'paid','2017-10-14 16:07:24.357787',NULL),(81,10.99,4610.99,3,110,4,3,'paid','2017-10-14 19:18:38.595776',NULL),(82,10.99,4610.99,3,111,4,3,'paid','2017-10-14 22:00:48.002756','k2w6h017'),(83,10.99,1410.99,3,112,4,3,'paid','2017-10-14 22:52:58.837172','6xjd2ywg'),(84,10.99,1410.99,3,113,4,3,'paid','2017-10-16 04:12:18.232909','2bmfk3hr'),(85,10.99,2010.99,3,114,4,3,'created','2017-10-16 04:51:14.257887',NULL),(86,10.99,2010.99,NULL,115,NULL,NULL,'created','2017-10-18 05:40:55.218829',NULL),(87,10.99,4610.99,40,116,41,32,'paid','2017-10-20 07:04:56.484082','63h5m4sz'),(88,10.99,1410.99,3,117,4,3,'paid','2017-10-21 07:18:20.580842','jjjwtsbx'),(89,10.99,2010.99,NULL,118,NULL,NULL,'created','2017-10-22 09:20:10.410317',NULL);
/*!40000 ALTER TABLE `orders_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_useraddress`
--

DROP TABLE IF EXISTS `orders_useraddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_useraddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `postal_code` varchar(70) NOT NULL,
  `post_address` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `phone` varchar(128),
  PRIMARY KEY (`id`),
  KEY `orders_useraddress_user_id_4cbed1a8_fk_orders_guestcheckout_id` (`user_id`),
  CONSTRAINT `orders_useraddress_user_id_4cbed1a8_fk_orders_guestcheckout_id` FOREIGN KEY (`user_id`) REFERENCES `orders_guestcheckout` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_useraddress`
--

LOCK TABLES `orders_useraddress` WRITE;
/*!40000 ALTER TABLE `orders_useraddress` DISABLE KEYS */;
INSERT INTO `orders_useraddress` VALUES (2,'likoni','Mombasa','00200',456,2,'billing',NULL),(3,'thika','thika','01000',983,3,'billing',NULL),(4,'imara','Nairobi','00100',890,3,'shipping',NULL),(5,'kawangware','Nairobi','0001',945,5,'shipping',NULL),(6,'highway','ruiru','223',124,6,'billing',NULL),(7,'mombasa-lane','Mombasa','00500',350,3,'shipping',NULL),(8,'sfd','ddd','022',956,12,'shipping',NULL),(9,'sfsf','dfsd','022',303,12,'shipping',NULL),(10,'moi-lane','Eldoret','0001',459,13,'shipping',NULL),(11,'nakuru-lane','nakuru','0100',555,13,'billing',NULL),(12,'kitui-avenue','kitui','00001',789,13,'shipping',NULL),(13,'kitui-avenue','kitui','00001',455,13,'shipping',NULL),(14,'viber-street','viber','001001',456,14,'shipping',NULL),(15,'viber-street','viber','001001',456,14,'billing',NULL),(16,'narok-street','narok','0200',223,15,'billing',NULL),(17,'narok-street','narok','0200',22,15,'shipping',NULL),(18,'garissa street','Garissa','00300',456,16,'shipping',NULL),(19,'garissa street','Garissa','00300',456,16,'billing',NULL),(20,'nyahururu-avenue','Nyahururu','963',200,17,'billing',NULL),(21,'nyahururu-avenue','Nyahururu','963',200,17,'shipping',NULL),(22,'embu-lane','embu','258',2,18,'billing',NULL),(23,'embu-lane','embu','258',2,18,'shipping',NULL),(24,'meru-lane','meru','789',7,19,'billing',NULL),(25,'meru-lane','meru','789',7,19,'shipping',NULL),(26,'limuru-lane','limuru','236',2,24,'billing',NULL),(27,'limuru-lane','limuru','236',2,24,'shipping',NULL),(28,'mwiki-lane','mwiki','00101',200,25,'billing',NULL),(29,'mwiki-lane','mwiki','00101',200,25,'shipping',NULL),(30,'kasarani-lane','kasarani','003',300,26,'billing',NULL),(31,'kasarani-lane','kasarani','003',300,26,'shipping',NULL),(32,'mama-ngina','thika','01000',234,27,'billing',NULL),(33,'mama-ngina','thika','01000',234,27,'shipping',NULL),(34,'mama-ngina','mtwapa','0020',200,28,'billing',NULL),(35,'mama-ngina','mtwapa','0020',200,28,'shipping',NULL),(36,'kiambu bar','kiambu','01000',235,30,'billing',NULL),(37,'kiambu bar','kiambu','00001',235,30,'shipping',NULL),(38,'turkana-river','Turkana','0020',235,31,'billing',NULL),(39,'turkana-river','turkana','0020',235,31,'shipping',NULL),(40,'eastleigh','nairobi','0020',500,32,'billing','+254724245632'),(41,'eastleigh','nairobi','0020',500,32,'shipping','+254724245632');
/*!40000 ALTER TABLE `orders_useraddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_registrationprofile`
--

DROP TABLE IF EXISTS `registration_registrationprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_registrationprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activation_key` varchar(40) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activated` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `registration_registrationprofil_user_id_5fcbf725_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_registrationprofile`
--

LOCK TABLES `registration_registrationprofile` WRITE;
/*!40000 ALTER TABLE `registration_registrationprofile` DISABLE KEYS */;
INSERT INTO `registration_registrationprofile` VALUES (5,'4c5af2977372e002e5d7a9eec40044d3a6d853ae',6,1),(6,'21ccfed2852f5f6780cbcc76173264b1b7a360ba',7,1),(7,'4a8f3e08f0017b349355bb663a16c490a532eae1',8,0);
/*!40000 ALTER TABLE `registration_registrationprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_category`
--

DROP TABLE IF EXISTS `stock_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_category` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_category`
--

LOCK TABLES `stock_category` WRITE;
/*!40000 ALTER TABLE `stock_category` DISABLE KEYS */;
INSERT INTO `stock_category` VALUES (1,'shoes','leather'),(2,'boxers','genuine cotton'),(3,'trousers','tailored'),(4,'caps and others','all size fits all'),(5,'shirts','slim fit');
/*!40000 ALTER TABLE `stock_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_checkout`
--

DROP TABLE IF EXISTS `stock_checkout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_checkout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(10) unsigned DEFAULT NULL,
  `contact` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_checkout`
--

LOCK TABLES `stock_checkout` WRITE;
/*!40000 ALTER TABLE `stock_checkout` DISABLE KEYS */;
INSERT INTO `stock_checkout` VALUES (1,NULL,NULL,NULL,2,723556555);
/*!40000 ALTER TABLE `stock_checkout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_customer`
--

DROP TABLE IF EXISTS `stock_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `contact` varchar(100) NOT NULL,
  `created_at` date,
  `size` varchar(10),
  `product` varchar(20),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_customer`
--

LOCK TABLES `stock_customer` WRITE;
/*!40000 ALTER TABLE `stock_customer` DISABLE KEYS */;
INSERT INTO `stock_customer` VALUES (8,'name',NULL,'724241341','2017-08-21',NULL,NULL),(9,'name',NULL,'723556555','2017-08-21',NULL,NULL),(10,'sfdf',NULL,'255555','2017-08-21',NULL,NULL),(11,'sfsfs',NULL,'252255','2017-08-21',NULL,NULL),(12,'me',NULL,'723556555','2017-08-22','34',NULL),(13,'sfdf',NULL,'2222222','2017-08-27','66',''),(14,'sfsf',NULL,'5555555','2017-08-27','sfsf',''),(15,'sfsf',NULL,'5555555','2017-09-04','sfsf',''),(16,'fdsf',NULL,'724241341','2017-09-15','34',''),(17,'dfs',NULL,'723556555','2017-09-15','55','object1.name'),(18,'me',NULL,'724242342','2017-09-15','20',''),(19,'njami',NULL,'723556555','2017-09-15','32',''),(20,'sff',NULL,'723556555','2017-09-15','3',''),(21,'dfdfff',NULL,'222222','2017-09-15','28',''),(22,'sfsdfd',NULL,'724242342','2017-09-15','29',''),(23,'sfdsfdsf',NULL,'723556555','2017-09-15','24',''),(24,'sfsdffdfsfds',NULL,'2323256','2017-09-15','28',''),(25,'dfdfdff',NULL,'723556555','2017-09-15','42',''),(26,'sfdff',NULL,'724245632','2017-09-15','33',''),(27,'sfdfd',NULL,'723556555','2017-09-15','33',''),(28,'sfdfds',NULL,'724242342','2017-09-15','66',''),(29,'sfdfd',NULL,'23232561','2017-09-15','54',''),(30,'sfdfd',NULL,'2253225','2017-09-15','88',''),(31,'sfdfd',NULL,'78954235','2017-09-15','23',''),(32,'sfdfd',NULL,'2575548','2017-09-15','xl',''),(33,'sfdfd',NULL,'2255','2017-09-15','',''),(34,'myname',NULL,'23232323','2017-09-15','36',''),(35,'denoo',NULL,'740770753','2017-09-18','34',''),(36,'sff',NULL,'724242342','2017-09-30','35',''),(37,'ccc',NULL,'422522','2017-09-30','23',''),(38,'sfsfsf',NULL,'724242342','2017-10-04','35',''),(39,'DFDF',NULL,'2323256','2017-10-06','33',NULL),(40,'ddfdf',NULL,'7222','2017-10-06','33',''),(41,'dfdf',NULL,'2322','2017-10-06','36',''),(42,'sfsfdfdffd',NULL,'2222222','2017-10-06','22',''),(43,'njalas',NULL,'2252255','2017-10-07','32',''),(44,'sfdf',NULL,'724241341','2017-10-13','34','khaki'),(45,'njami',NULL,'724242342','2017-10-14','l','slim fit shirt'),(46,'mine',NULL,'723556555','2017-10-14','30','jeans'),(47,'dfdf',NULL,'723556555','2017-10-16','30','jeans'),(48,'dfdf',NULL,'723556555','2017-10-16','34','khaki'),(49,'test',NULL,'564897','2017-10-16','30','jeans'),(50,'dfdf',NULL,'2265','2017-10-16','34','khaki'),(51,'njjjj',NULL,'724241341','2017-10-16','33',''),(52,'sfdf',NULL,'723556555','2017-10-16','33',''),(53,'njmi',NULL,'25520','2017-10-16','35',''),(54,'meme',NULL,'723556555','2017-10-16','2525',''),(55,'njami',NULL,'724241341','2017-10-16','32',''),(56,'joshua',NULL,'723556555','2017-10-23','32','khaki');
/*!40000 ALTER TABLE `stock_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_product`
--

DROP TABLE IF EXISTS `stock_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `buying_price` int(10) unsigned NOT NULL,
  `size` varchar(20) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `entry_date` date,
  `category_id` int(11) NOT NULL,
  `image_id` int(11),
  `details` varchar(50),
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_product_c5bcd634` (`supplier_id`),
  KEY `stock_product_b583a629` (`category_id`),
  KEY `stock_product_f33175e6` (`image_id`),
  CONSTRAINT `stock_product_image_id_d6b38746_fk_stock_productimage_id` FOREIGN KEY (`image_id`) REFERENCES `stock_productimage` (`id`),
  CONSTRAINT `stock_product_supplier_id_83db2fdd_fk_stock_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `stock_supplier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_product`
--

LOCK TABLES `stock_product` WRITE;
/*!40000 ALTER TABLE `stock_product` DISABLE KEYS */;
INSERT INTO `stock_product` VALUES (1,'khaki',2500,5,1500,'34',1,NULL,3,8,'brand new','y'),(2,'jeans',2500,12,1500,'30',1,NULL,3,7,'second hand camera','y'),(4,'slim fit shirt',1500,48,1000,'l',1,NULL,5,4,'second hand camera','y'),(5,'boxer',800,5,300,'elastic',1,NULL,2,6,'branded','y'),(6,'Artigian lofa',4500,2,1000,'l',3,'2017-04-28',1,5,'second hand Camera','y'),(7,'cap',1500,6,800,'elastic',2,'2017-05-26',4,9,'second hand','y'),(8,'adidas sport shoe',4500,3,2000,'elastic',3,'2017-05-29',1,10,'brand new','y'),(9,'sport shoe',3500,2,1500,'elastic',1,'2017-08-25',1,12,'flat sport shoe','y');
/*!40000 ALTER TABLE `stock_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_productimage`
--

DROP TABLE IF EXISTS `stock_productimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_productimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_productimage_product_id_934a2d4d_fk_stock_product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_productimage`
--

LOCK TABLES `stock_productimage` WRITE;
/*!40000 ALTER TABLE `stock_productimage` DISABLE KEYS */;
INSERT INTO `stock_productimage` VALUES (2,'2/khaki',2),(4,'None/DSCF2199.JPG',4),(5,'5/img_2.jpg',6),(6,'None/boxer.jpg',5),(7,'None/jeans.jpg',2),(8,'None/khaki.jpg',1),(9,'None/DSCF2245.JPG',7),(10,'10/IMG_20170521_145411.jpg',8),(12,'12/img-8.jpg',9),(13,'None/img_1.jpg',8),(14,'None/img_4.jpg',1),(15,'None/img_5.jpg',1);
/*!40000 ALTER TABLE `stock_productimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_shoe`
--

DROP TABLE IF EXISTS `stock_shoe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_shoe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `buying_price` int(10) unsigned NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `size` varchar(20) NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_shoe_image_id_15a3e9fe_fk_stock_productimage_id` (`image_id`),
  CONSTRAINT `stock_shoe_image_id_15a3e9fe_fk_stock_productimage_id` FOREIGN KEY (`image_id`) REFERENCES `stock_productimage` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_shoe`
--

LOCK TABLES `stock_shoe` WRITE;
/*!40000 ALTER TABLE `stock_shoe` DISABLE KEYS */;
INSERT INTO `stock_shoe` VALUES (1,'official',3000,5000,'10',10);
/*!40000 ALTER TABLE `stock_shoe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_supplier`
--

DROP TABLE IF EXISTS `stock_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `contact` int(11) NOT NULL,
  `item` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_supplier`
--

LOCK TABLES `stock_supplier` WRITE;
/*!40000 ALTER TABLE `stock_supplier` DISABLE KEYS */;
INSERT INTO `stock_supplier` VALUES (1,'tony',724241341,'Trousers'),(2,'Ngugi',710646853,'Khaki second hand'),(3,'Big Ben',710944093,'gikomba shoes');
/*!40000 ALTER TABLE `stock_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_variation`
--

DROP TABLE IF EXISTS `stock_variation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_variation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `sale_price` int(10) unsigned DEFAULT NULL,
  `inventory` int(10) unsigned DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_variation_product_id_168970b6_fk_stock_product_id` (`product_id`),
  CONSTRAINT `stock_variation_product_id_168970b6_fk_stock_product_id` FOREIGN KEY (`product_id`) REFERENCES `stock_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_variation`
--

LOCK TABLES `stock_variation` WRITE;
/*!40000 ALTER TABLE `stock_variation` DISABLE KEYS */;
INSERT INTO `stock_variation` VALUES (1,'straight',2600,NULL,NULL,2),(2,'slim fit',1500,1400,5,4),(3,'regular fit',2000,2000,3,2),(4,'slim',2000,2000,3,1),(5,'height 42',2000,2000,5,1);
/*!40000 ALTER TABLE `stock_variation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-25 11:52:34
