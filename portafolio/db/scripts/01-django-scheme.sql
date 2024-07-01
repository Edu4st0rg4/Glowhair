-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: portal_db
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `block` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `enumeration` varchar(10) DEFAULT NULL,
  `latitude` decimal(9,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `zipcode` int(11) DEFAULT NULL,
  `communes_towns_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `communes_towns_id` (`communes_towns_id`),
  CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`communes_towns_id`) REFERENCES `communes_towns` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'Alameda',NULL,NULL,'8750',NULL,NULL,NULL,13101);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$720000$QZU96Zk7h9LHSdoQMMy5Am$CPbDc1DfmMfxsb5X3TjuOiIt8aoGuynrI6equ+6+AUc=','2024-05-19 23:36:08.567724',1,'admin','','','admin@admin.cl',1,1,'2024-04-20 00:00:35.844174'),(2,'pbkdf2_sha256$720000$nCfJ2HBICH8PnEDFmMqY8J$irRNDFKu27zJS8Pfqe1Pwx4l79qtb75ZzgdMxMjIRe4=',NULL,0,'custom','Pedro','Torre','ptorresb@example.cl',0,1,'2024-05-19 23:40:30.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `products_id` int(11) NOT NULL,
  `shopping_session_id` int(11) NOT NULL,
  PRIMARY KEY (`products_id`,`shopping_session_id`),
  KEY `shopping_session_id` (`shopping_session_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`shopping_session_id`) REFERENCES `shopping_session` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Flavored Milk','Flavored Milk'),(2,'Alcohol Beer','Alcohol Beer');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communes_towns`
--

DROP TABLE IF EXISTS `communes_towns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communes_towns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `latitude` decimal(9,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `provinces_townships_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `provinces_townships_id` (`provinces_townships_id`),
  CONSTRAINT `communes_towns_ibfk_1` FOREIGN KEY (`provinces_townships_id`) REFERENCES `provinces_townships` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16306 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communes_towns`
--

LOCK TABLES `communes_towns` WRITE;
/*!40000 ALTER TABLE `communes_towns` DISABLE KEYS */;
INSERT INTO `communes_towns` VALUES (1101,'Iquique',-20.223200,-70.146300,11),(1107,'Alto Hospicio',-20.267700,-70.100700,11),(1401,'Pozo Almonte',-20.253200,-69.784800,14),(1402,'Camiña',-19.311800,-69.426400,14),(1403,'Colchane',-19.278700,-68.634300,14),(1404,'Huara',-19.996300,-69.771800,14),(1405,'Pica',-20.488900,-69.328900,14),(2101,'Antofagasta',-23.649900,-70.406900,21),(2102,'Mejillones',-23.096200,-70.449800,21),(2103,'Sierra Gorda',-22.892100,-69.320300,21),(2104,'Taltal',-25.405400,-70.482600,21),(2201,'Calama',-22.454200,-68.933700,22),(2202,'Ollagüe',-21.223800,-68.252900,22),(2203,'San Pedro de Atacama',-22.915700,-68.200400,22),(2301,'Tocopilla',-22.085800,-70.193000,23),(2302,'María Elena',-22.163900,-69.417100,23),(3101,'Copiapó',-27.365400,-70.331400,31),(3102,'Caldera',-27.066800,-70.817000,31),(3103,'Tierra Amarilla',-27.487700,-70.269600,31),(3201,'Chañaral',-26.342500,-70.610700,32),(3202,'Diego de Almagro',-26.377100,-70.048800,32),(3301,'Vallenar',-28.577700,-70.756600,33),(3302,'Alto del Carmen',-28.750800,-70.488300,33),(3303,'Freirina',-28.500100,-71.076000,33),(3304,'Huasco',-28.451800,-71.224400,33),(4101,'La Serena',-29.896600,-71.242200,41),(4102,'Coquimbo',-29.968000,-71.337000,41),(4103,'Andacollo',-30.235700,-71.082800,41),(4104,'La Higuera',-29.497000,-71.265600,41),(4105,'Paiguano',-30.249600,-70.383200,41),(4106,'Vicuña',-30.028700,-70.710800,41),(4201,'Illapel',-31.624200,-71.162600,42),(4202,'Canela',-31.393500,-71.457800,42),(4203,'Los Vilos',-31.915700,-71.510700,42),(4204,'Salamanca',-31.773700,-70.971700,42),(4301,'Ovalle',-30.594200,-71.198300,43),(4302,'Combarbalá',-31.176400,-70.997800,43),(4303,'Monte Patria',-30.829100,-70.698400,43),(4304,'Punitaqui',-30.825600,-71.258500,43),(4305,'Río Hurtado',-30.260300,-70.666800,43),(5101,'Valparaíso',-33.043600,-71.623100,51),(5102,'Casablanca',-33.326200,-71.398300,51),(5103,'Concón',-32.930500,-71.519100,51),(5104,'Juan Fernández',-33.616700,-78.866700,51),(5105,'Puchuncaví',-32.749900,-71.396000,51),(5107,'Quintero',-32.787200,-71.527400,51),(5109,'Viña del Mar',-33.044500,-71.522400,51),(5201,'Isla de Pascua',-27.150400,-109.423000,52),(5301,'Los Andes',-32.834700,-70.597100,53),(5302,'Calle Larga',-32.951400,-70.552400,53),(5303,'Rinconada',-32.876500,-70.708500,53),(5304,'San Esteban',-32.693000,-70.370300,53),(5401,'La Ligua',-32.449000,-71.230900,54),(5402,'Cabildo',-32.409500,-71.079800,54),(5403,'Papudo',-32.469900,-71.384200,54),(5404,'Petorca',-32.196500,-70.831800,54),(5405,'Zapallar',-32.593300,-71.368600,54),(5501,'Quillota',-32.879300,-71.250800,55),(5502,'Calera',-32.783700,-71.158600,55),(5503,'Hijuelas',-32.867100,-71.092900,55),(5504,'La Cruz',-32.825800,-71.259200,55),(5506,'Nogales',-32.692300,-71.189400,55),(5601,'San Antonio',-33.581200,-71.613000,56),(5602,'Algarrobo',-33.333200,-71.602300,56),(5603,'Cartagena',-33.534100,-71.462800,56),(5604,'El Quisco',-33.415600,-71.655600,56),(5605,'El Tabo',-33.484700,-71.586200,56),(5606,'Santo Domingo',-33.707600,-71.630100,56),(5701,'San Felipe',-32.746400,-70.748900,57),(5702,'Catemu',-32.698100,-70.956000,57),(5703,'Llaillay',-32.889900,-70.894200,57),(5704,'Panquehue',-32.807900,-70.842800,57),(5705,'Putaendo',-32.627900,-70.716500,57),(5706,'Santa María',-32.744600,-70.654000,57),(5801,'Quilpué',-33.049200,-71.443500,58),(5802,'Limache',-33.003500,-71.261300,58),(5803,'Olmué',-33.013200,-71.152500,58),(5804,'Villa Alemana',-33.042900,-71.372400,58),(6101,'Rancagua',-34.162000,-70.741000,61),(6102,'Codegua',-34.044200,-70.513100,61),(6103,'Coinco',-34.291800,-70.970600,61),(6104,'Coltauco',-34.249800,-71.079100,61),(6105,'Doñihue',-34.202400,-70.932500,61),(6106,'Graneros',-34.070900,-70.750100,61),(6107,'Las Cabras',-34.294500,-71.306600,61),(6108,'Machalí',-34.293800,-70.337100,61),(6109,'Malloa',-34.445500,-70.944900,61),(6110,'Mostazal',-33.977200,-70.709200,61),(6111,'Olivar',-34.218600,-70.835500,61),(6112,'Peumo',-34.379800,-71.168700,61),(6113,'Pichidegua',-34.375800,-71.346900,61),(6114,'Quinta de Tilcoco',-34.367000,-71.009600,61),(6115,'Rengo',-34.401700,-70.856100,61),(6116,'Requínoa',-34.353300,-70.679700,61),(6117,'San Vicente',-34.438100,-71.079200,61),(6201,'Pichilemu',-34.386900,-72.003200,62),(6202,'La Estrella',-34.203700,-71.607300,62),(6203,'Litueche',-34.106900,-71.720400,62),(6204,'Marchihue',-34.397900,-71.614400,62),(6205,'Navidad',-34.006800,-71.810100,62),(6206,'Paredones',-34.697200,-71.897800,62),(6301,'San Fernando',-34.584000,-70.987400,63),(6302,'Chépica',-34.730300,-71.268800,63),(6303,'Chimbarongo',-34.755200,-70.975300,63),(6304,'Lolol',-34.768900,-71.645300,63),(6305,'Nancagua',-34.661500,-71.174900,63),(6306,'Palmilla',-34.604200,-71.358300,63),(6307,'Peralillo',-34.459300,-71.500000,63),(6308,'Placilla',-34.613500,-71.095100,63),(6309,'Pumanque',-34.605200,-71.644300,63),(6310,'Santa Cruz',-34.638300,-71.367000,63),(7101,'Talca',-35.428800,-71.660700,71),(7102,'Constitución',-35.330900,-72.413900,71),(7103,'Curepto',-35.091000,-72.021600,71),(7104,'Empedrado',-35.621300,-72.247300,71),(7105,'Maule',-35.505700,-71.706900,71),(7106,'Pelarco',-35.372300,-71.327800,71),(7107,'Pencahue',-35.305100,-71.828400,71),(7108,'Río Claro',-35.282700,-71.266500,71),(7109,'San Clemente',-35.534000,-71.486500,71),(7110,'San Rafael',-35.294200,-71.525400,71),(7201,'Cauquenes',-35.973800,-72.314200,72),(7202,'Chanco',-35.733700,-72.533300,72),(7203,'Pelluhue',-35.814500,-72.573600,72),(7301,'Curicó',-34.975600,-71.223500,73),(7302,'Hualañé',-34.976200,-71.804300,73),(7303,'Licantén',-34.959100,-72.026900,73),(7304,'Molina',-35.089600,-71.278800,73),(7305,'Rauco',-34.929500,-71.311100,73),(7306,'Romeral',-34.963400,-71.120500,73),(7307,'Sagrada Familia',-34.994900,-71.379800,73),(7308,'Teno',-34.870100,-71.089500,73),(7309,'Vichuquén',-34.859400,-72.007400,73),(7401,'Linares',-35.849500,-71.585000,74),(7402,'Colbún',-35.692700,-71.406700,74),(7403,'Longaví',-35.965700,-71.681600,74),(7404,'Parral',-36.140000,-71.824400,74),(7405,'Retiro',-36.045800,-71.759100,74),(7406,'San Javier',-35.603500,-71.736200,74),(7407,'Villa Alegre',-35.686800,-71.670400,74),(7408,'Yerbas Buenas',-35.688200,-71.563600,74),(8101,'Concepción',-36.814800,-73.029300,81),(8102,'Coronel',-37.026500,-73.149800,81),(8103,'Chiguayante',-36.904600,-73.016400,81),(8104,'Florida',-36.820900,-72.662100,81),(8105,'Hualqui',-37.014500,-72.866200,81),(8106,'Lota',-37.090600,-73.154700,81),(8107,'Penco',-36.742300,-72.998000,81),(8108,'San Pedro de la Paz',-36.863500,-73.108500,81),(8109,'Santa Juana',-37.172600,-72.935200,81),(8110,'Talcahuano',-36.736400,-73.104700,81),(8111,'Tomé',-36.617700,-72.957900,81),(8112,'Hualpén',-36.782700,-73.145400,81),(8201,'Lebu',-37.607900,-73.650800,82),(8202,'Arauco',-37.257000,-73.283900,82),(8203,'Cañete',-37.803900,-73.401600,82),(8204,'Contulmo',-38.026000,-73.258100,82),(8205,'Curanilahue',-37.475900,-73.353000,82),(8206,'Los álamos',-37.674700,-73.389600,82),(8207,'Tirúa',-38.331500,-73.379400,82),(8301,'Los ángeles',-37.473000,-72.350700,83),(8302,'Antuco',-37.327300,-71.677500,83),(8303,'Cabrero',-37.037400,-72.405700,83),(8304,'Laja',-37.276800,-72.717100,83),(8305,'Mulchén',-37.714700,-72.239400,83),(8306,'Nacimiento',-37.501100,-72.676300,83),(8307,'Negrete',-37.597400,-72.564600,83),(8308,'Quilaco',-37.679900,-72.007400,83),(8309,'Quilleco',-37.433500,-71.876100,83),(8310,'San Rosendo',-37.202100,-72.748000,83),(8311,'Santa Bárbara',-37.662700,-72.018400,83),(8312,'Tucapel',-37.290100,-71.949100,83),(8313,'Yumbel',-37.096400,-72.556200,83),(8314,'Alto Biobío',-37.870800,-71.610600,83),(9101,'Temuco',-38.736200,-72.598900,91),(9102,'Carahue',-38.711600,-73.165100,91),(9103,'Cunco',-38.930700,-72.026400,91),(9104,'Curarrehue',-39.359200,-71.588100,91),(9105,'Freire',-38.953800,-72.621900,91),(9106,'Galvarino',-38.408500,-72.780400,91),(9107,'Gorbea',-39.094800,-72.672200,91),(9108,'Lautaro',-38.528600,-72.427000,91),(9109,'Loncoche',-39.368100,-72.631500,91),(9110,'Melipeuco',-38.842900,-71.687100,91),(9111,'Nueva Imperial',-38.744500,-72.948200,91),(9112,'Padre las Casas',-38.765800,-72.592900,91),(9113,'Perquenco',-38.415400,-72.372500,91),(9114,'Pitrufquén',-38.982900,-72.642900,91),(9115,'Pucón',-39.282400,-71.954500,91),(9116,'Saavedra',-38.780300,-73.389700,91),(9117,'Teodoro Schmidt',-38.998900,-73.093000,91),(9118,'Toltén',-39.202200,-73.200400,91),(9119,'Vilcún',-38.670100,-72.223800,91),(9120,'Villarrica',-39.280300,-72.218200,91),(9121,'Cholchol',-38.596000,-72.844500,91),(9201,'Angol',-37.803000,-72.701700,92),(9202,'Collipulli',-37.952800,-72.432300,92),(9203,'Curacautín',-38.431700,-71.889800,92),(9204,'Ercilla',-38.058700,-72.358000,92),(9205,'Lonquimay',-38.450100,-71.374000,92),(9206,'Los Sauces',-37.975400,-72.828800,92),(9207,'Lumaco',-38.163600,-72.891800,92),(9208,'Purén',-38.032600,-73.072800,92),(9209,'Renaico',-37.665400,-72.568700,92),(9210,'Traiguén',-38.250900,-72.664700,92),(9211,'Victoria',-38.233600,-72.332900,92),(10101,'Puerto Montt',-41.463300,-72.931400,101),(10102,'Calbuco',-41.777500,-73.141500,101),(10103,'Cochamó',-41.488000,-72.303800,101),(10104,'Fresia',-41.154200,-73.422400,101),(10105,'Frutillar',-41.116700,-73.050000,101),(10106,'Los Muermos',-41.399700,-73.465100,101),(10107,'Llanquihue',-41.257400,-73.005400,101),(10108,'Maullín',-41.617200,-73.595600,101),(10109,'Puerto Varas',-41.316000,-72.983600,101),(10201,'Castro',-42.480000,-73.762500,102),(10202,'Ancud',-41.865700,-73.833600,102),(10203,'Chonchi',-42.623200,-73.773900,102),(10204,'Curaco de Vélez',-42.440400,-73.603700,102),(10205,'Dalcahue',-42.377600,-73.652100,102),(10206,'Puqueldón',-42.601500,-73.671400,102),(10207,'Queilén',-42.900100,-73.482700,102),(10208,'Quellón',-43.115600,-73.617200,102),(10209,'Quemchi',-42.142600,-73.475000,102),(10210,'Quinchao',-42.472000,-73.489800,102),(10301,'Osorno',-40.574700,-73.131900,103),(10302,'Puerto Octay',-40.975500,-72.883300,103),(10303,'Purranque',-40.908500,-73.165300,103),(10304,'Puyehue',-40.680600,-72.599000,103),(10305,'Río Negro',-40.782900,-73.231900,103),(10306,'San Juan de la Costa',-40.515600,-73.399700,103),(10307,'San Pablo',-40.411800,-73.010200,103),(10401,'Chaitén',-42.916800,-72.716400,104),(10402,'Futaleufú',-43.185900,-71.866600,104),(10403,'Hualaihué',-42.096700,-72.404400,104),(10404,'Palena',-43.616200,-71.817600,104),(11101,'Coihaique',-45.575800,-72.062100,111),(11102,'Lago Verde',-44.223600,-71.839600,111),(11201,'Aysén',-45.397500,-72.699300,112),(11202,'Cisnes',-44.728000,-72.682800,112),(11203,'Guaitecas',-43.878100,-73.748500,112),(11301,'Cochrane',-47.249400,-72.578400,113),(11302,'O\'Higgins',-48.464300,-72.561300,113),(11303,'Tortel',-47.824200,-73.564500,113),(11401,'Chile Chico',-46.540100,-71.721800,114),(11402,'Río Ibáñez',-46.293800,-71.935700,114),(12101,'Punta Arenas',-53.164100,-70.930500,121),(12102,'Laguna Blanca',-52.300100,-71.161200,121),(12103,'Río Verde',-52.581400,-71.512800,121),(12104,'San Gregorio',-52.313500,-69.684200,121),(12201,'Cabo de Hornos',-54.935200,-67.604100,122),(12202,'Antártica',-64.358900,-60.820300,122),(12301,'Porvenir',-53.289800,-70.363300,123),(12302,'Primavera',-52.712200,-69.249600,123),(12303,'Timaukel',-54.287700,-69.164400,123),(12401,'Natales',-51.721900,-72.520800,124),(12402,'Torres del Paine',-50.989600,-73.089300,124),(13101,'Santiago Centro',-33.441700,-70.654100,131),(13102,'Cerrillos',-33.497000,-70.711200,131),(13103,'Cerro Navia',-33.426700,-70.743400,131),(13104,'Conchalí',-33.386200,-70.672700,131),(13105,'El Bosque',-33.563800,-70.671400,131),(13106,'Estación Central',-33.450300,-70.675100,131),(13107,'Huechuraba',-33.366500,-70.631500,131),(13108,'Independencia',-33.419600,-70.662700,131),(13109,'La Cisterna',-33.538000,-70.661200,131),(13110,'La Florida',-33.522500,-70.595200,131),(13111,'La Granja',-33.537300,-70.618800,131),(13112,'La Pintana',-33.590200,-70.632200,131),(13113,'La Reina',-33.456500,-70.534900,131),(13114,'Las Condes',-33.415400,-70.583700,131),(13115,'Lo Barnechea',-33.299300,-70.374800,131),(13116,'Lo Espejo',-33.524700,-70.691600,131),(13117,'Lo Prado',-33.448900,-70.721000,131),(13118,'Macul',-33.492000,-70.596800,131),(13119,'Maipú',-33.521300,-70.757200,131),(13120,'Ñuñoa',-33.460700,-70.592700,131),(13121,'Pedro Aguirre Cerda',-33.489100,-70.672900,131),(13122,'Peñalolén',-33.490400,-70.510500,131),(13123,'Providencia',-33.421400,-70.603300,131),(13124,'Pudahuel',-33.418400,-70.832400,131),(13125,'Quilicura',-33.355100,-70.727800,131),(13126,'Quinta Normal',-33.428000,-70.696400,131),(13127,'Recoleta',-33.417300,-70.630300,131),(13128,'Renca',-33.414100,-70.712900,131),(13129,'San Joaquín',-33.496100,-70.624500,131),(13130,'San Miguel',-33.501700,-70.648900,131),(13131,'San Ramón',-33.534900,-70.639200,131),(13132,'Vitacura',-33.386300,-70.569800,131),(13201,'Puente Alto',-33.607900,-70.577800,132),(13202,'Pirque',-33.738400,-70.491400,132),(13203,'San José de Maipo',-33.692100,-70.132500,132),(13301,'Colina',-33.199600,-70.670200,133),(13302,'Lampa',-33.286300,-70.878900,133),(13303,'Tiltil',-33.065500,-70.846500,133),(13401,'San Bernardo',-33.591300,-70.702000,134),(13402,'Buin',-33.754000,-70.716300,134),(13403,'Calera de Tango',-33.632600,-70.782100,134),(13404,'Paine',-33.867300,-70.730300,134),(13501,'Melipilla',-33.686600,-71.213900,135),(13502,'Alhué',-34.035500,-71.028000,135),(13503,'Curacaví',-33.406300,-71.133300,135),(13504,'María Pinto',-33.515400,-71.119100,135),(13505,'San Pedro',-33.877900,-71.460900,135),(13601,'Talagante',-33.664300,-70.929600,136),(13602,'El Monte',-33.666200,-71.029400,136),(13603,'Isla de Maipo',-33.753600,-70.886200,136),(13604,'Padre Hurtado',-33.576100,-70.800300,136),(13605,'Peñaflor',-33.614100,-70.887600,136),(14101,'Valdivia',-39.820100,-73.245700,141),(14102,'Corral',-39.889200,-73.433000,141),(14103,'Lanco',-39.452200,-72.774700,141),(14104,'Los Lagos',-39.863600,-72.812400,141),(14105,'Máfil',-39.665400,-72.957500,141),(14106,'Mariquina',-39.539900,-72.962100,141),(14107,'Paillaco',-40.070700,-72.870800,141),(14108,'Panguipulli',-39.643600,-72.336500,141),(14201,'La Unión',-40.295100,-73.082900,142),(14202,'Futrono',-40.124300,-72.393000,142),(14203,'Lago Ranco',-40.312000,-72.500200,142),(14204,'Río Bueno',-40.333000,-72.951300,142),(15101,'Arica',-18.477000,-70.322100,151),(15102,'Camarones',-19.008900,-69.907400,151),(15201,'Putre',-18.179800,-69.554400,152),(15202,'General Lagos',-17.832400,-69.609400,152),(16101,'Chillán',-36.601300,-72.109300,161),(16102,'Bulnes',-36.742200,-72.301800,161),(16103,'Chillán Viejo',-36.633300,-72.140400,161),(16104,'El Carmen',-36.896400,-72.021800,161),(16105,'Pemuco',-36.986500,-72.019100,161),(16106,'Pinto',-36.697800,-71.893400,161),(16107,'Quillón',-36.738300,-72.469000,161),(16108,'San Ignacio',-36.818600,-71.988300,161),(16109,'Yungay',-37.122000,-72.013200,161),(16201,'Quirihue',-36.283900,-72.541400,162),(16202,'Cobquecura',-36.131800,-72.791100,162),(16203,'Coelemu',-36.487700,-72.702200,162),(16204,'Ninhue',-36.401100,-72.397000,162),(16205,'Portezuelo',-36.529000,-72.433000,162),(16206,'Ránquil',-36.648500,-72.606400,162),(16207,'Treguaco',-36.409500,-72.660300,162),(16301,'San Carlos',-36.422100,-71.959400,163),(16302,'Coihueco',-36.616600,-71.834400,163),(16303,'Ñiquén',-36.284800,-71.899400,163),(16304,'San Fabián',-36.553800,-71.548700,163),(16305,'San Nicolás',-36.499600,-72.212600,163);
/*!40000 ALTER TABLE `communes_towns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persons_id` int(11) DEFAULT NULL,
  `communes_towns_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `persons_id` (`persons_id`),
  KEY `communes_towns_id` (`communes_towns_id`),
  CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `customers_ibfk_2` FOREIGN KEY (`persons_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `customers_ibfk_3` FOREIGN KEY (`communes_towns_id`) REFERENCES `communes_towns` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,1,6203,2),(2,2,13101,1);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-04-19 23:57:07.504316'),(2,'auth','0001_initial','2024-04-19 23:57:08.662459'),(3,'admin','0001_initial','2024-04-19 23:57:08.949871'),(4,'admin','0002_logentry_remove_auto_add','2024-04-19 23:57:08.973872'),(5,'admin','0003_logentry_add_action_flag_choices','2024-04-19 23:57:08.997043'),(6,'contenttypes','0002_remove_content_type_name','2024-04-19 23:57:09.248868'),(7,'auth','0002_alter_permission_name_max_length','2024-04-19 23:57:09.342090'),(8,'auth','0003_alter_user_email_max_length','2024-04-19 23:57:09.390883'),(9,'auth','0004_alter_user_username_opts','2024-04-19 23:57:09.404261'),(10,'auth','0005_alter_user_last_login_null','2024-04-19 23:57:09.531634'),(11,'auth','0006_require_contenttypes_0002','2024-04-19 23:57:09.544116'),(12,'auth','0007_alter_validators_add_error_messages','2024-04-19 23:57:09.566726'),(13,'auth','0008_alter_user_username_max_length','2024-04-19 23:57:09.693140'),(14,'auth','0009_alter_user_last_name_max_length','2024-04-19 23:57:09.791677'),(15,'auth','0010_alter_group_name_max_length','2024-04-19 23:57:09.815976'),(16,'auth','0011_update_proxy_permissions','2024-04-19 23:57:09.830420'),(17,'auth','0012_alter_user_first_name_max_length','2024-04-19 23:57:09.956120'),(18,'sessions','0001_initial','2024-04-19 23:57:10.042263');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,'INVOICE','Tributary Document'),(2,'ELECTRONIC INVOICE','Electronic Tributary Document'),(3,'TICKET','Tributary Document'),(4,'ELECTRONIC TICKET','Electronic Tributary Document');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail` varchar(150) DEFAULT NULL,
  `persons_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `persons_id` (`persons_id`),
  CONSTRAINT `emails_ibfk_1` FOREIGN KEY (`persons_id`) REFERENCES `persons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persons_id` int(11) DEFAULT NULL,
  `communes_towns_id` int(11) DEFAULT NULL,
  `offices_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `persons_id` (`persons_id`),
  KEY `communes_towns_id` (`communes_towns_id`),
  KEY `offices_id` (`offices_id`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`persons_id`) REFERENCES `persons` (`id`),
  CONSTRAINT `employees_ibfk_3` FOREIGN KEY (`communes_towns_id`) REFERENCES `communes_towns` (`id`),
  CONSTRAINT `employees_ibfk_4` FOREIGN KEY (`offices_id`) REFERENCES `offices` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,2,13101,1,1);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genders`
--

DROP TABLE IF EXISTS `genders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genders`
--

LOCK TABLES `genders` WRITE;
/*!40000 ALTER TABLE `genders` DISABLE KEYS */;
INSERT INTO `genders` VALUES (1,'male','Male Genders of Persons.'),(2,'female','Female Genders of Persons.'),(3,'others','Others Genders of Persons.');
/*!40000 ALTER TABLE `genders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT NULL,
  `products_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_id` (`products_id`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offices`
--

DROP TABLE IF EXISTS `offices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `addresses_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_id` (`addresses_id`),
  CONSTRAINT `offices_ibfk_1` FOREIGN KEY (`addresses_id`) REFERENCES `addresses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offices`
--

LOCK TABLES `offices` WRITE;
/*!40000 ALTER TABLE `offices` DISABLE KEYS */;
INSERT INTO `offices` VALUES (1,'Sucursal Central',NULL,1);
/*!40000 ALTER TABLE `offices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `sales_id` int(11) DEFAULT NULL,
  `customers_id` int(11) DEFAULT NULL,
  `payments_types_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_id` (`sales_id`),
  KEY `customers_id` (`customers_id`),
  KEY `payments_types_id` (`payments_types_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`sales_id`) REFERENCES `sales` (`id`),
  CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`customers_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `payments_ibfk_3` FOREIGN KEY (`payments_types_id`) REFERENCES `payments_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments_types`
--

DROP TABLE IF EXISTS `payments_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments_types`
--

LOCK TABLES `payments_types` WRITE;
/*!40000 ALTER TABLE `payments_types` DISABLE KEYS */;
INSERT INTO `payments_types` VALUES (1,'DEBIT CARD','Debit Card Payments Type'),(2,'CREDIT CARD','Credit Card Payments Type');
/*!40000 ALTER TABLE `payments_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `national_identification` varchar(30) DEFAULT NULL,
  `names` varchar(50) DEFAULT NULL,
  `lastname` varchar(120) DEFAULT NULL,
  `second_lastname` varchar(120) DEFAULT NULL,
  `genders_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `genders_id` (`genders_id`),
  CONSTRAINT `persons_ibfk_1` FOREIGN KEY (`genders_id`) REFERENCES `genders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons`
--

LOCK TABLES `persons` WRITE;
/*!40000 ALTER TABLE `persons` DISABLE KEYS */;
INSERT INTO `persons` VALUES (1,'chilean','Pedro','Torres','Barra',1),(2,'chilean','ADMIN',NULL,NULL,3);
/*!40000 ALTER TABLE `persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phones`
--

DROP TABLE IF EXISTS `phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(150) DEFAULT NULL,
  `persons_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `persons_id` (`persons_id`),
  CONSTRAINT `phones_ibfk_1` FOREIGN KEY (`persons_id`) REFERENCES `persons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phones`
--

LOCK TABLES `phones` WRITE;
/*!40000 ALTER TABLE `phones` DISABLE KEYS */;
/*!40000 ALTER TABLE `phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `sale_price` decimal(10,0) DEFAULT NULL,
  `categories_id` int(11) DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_id` (`categories_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES 
(1,'Crema Cabello Ondulado','uwu',10000,1,'https://i.imgur.com/4ut0wfJ.png'),
(2,'Termo protector capilar','uwu',10000,1,'https://i.imgur.com/siVLySK.png'),
(3,'Matizador Rubio','uwu',10000,1,'https://i.imgur.com/dkDT7ac.png'),
(4,'Shampoo profesional Limpiador','uwu',10000,2,'https://i.imgur.com/EuFEUd9.png');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provinces_townships`
--

DROP TABLE IF EXISTS `provinces_townships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provinces_townships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `latitude` decimal(9,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `regiones_states_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `regiones_states_id` (`regiones_states_id`),
  CONSTRAINT `provinces_townships_ibfk_1` FOREIGN KEY (`regiones_states_id`) REFERENCES `regiones_states` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provinces_townships`
--

LOCK TABLES `provinces_townships` WRITE;
/*!40000 ALTER TABLE `provinces_townships` DISABLE KEYS */;
INSERT INTO `provinces_townships` VALUES (11,'Iquique',-20.801100,-70.096300,1),(14,'Tamarugal',-39.856700,-72.608900,1),(21,'Antofagasta',-24.564600,-69.287700,2),(22,'El Loa',-22.319600,-68.510700,2),(23,'Tocopilla',-22.230600,-69.466600,2),(31,'Copiapó',-27.576500,-70.026900,2),(32,'Chañaral',-26.359900,-70.598100,2),(33,'Huasco',-28.560400,-70.614600,2),(41,'Elqui',-29.833500,-70.801400,4),(42,'Choapa',-31.800600,-70.982700,4),(43,'Limarí',-30.734200,-70.995700,4),(51,'Valparaíso',-33.138100,-71.561700,5),(52,'Isla de Pascua',-27.121200,-109.366000,5),(53,'Los Andes',-32.954400,-70.316300,5),(54,'Petorca',-32.196500,-70.831800,5),(55,'Quillota',-32.900900,-71.294700,5),(56,'San Antonio',-33.664800,-71.459700,5),(57,'San Felipe de Aconcagua',-32.746400,-70.748900,5),(58,'Marga Marga',-33.065000,-71.371100,5),(61,'Cachapoal',-36.450000,-71.733300,6),(62,'Cardenal Caro',-34.281200,-71.857100,6),(63,'Colchagua',-34.676100,-71.097300,6),(71,'Talca',-35.392100,-71.612500,7),(72,'Cauquenes',-35.973800,-72.314200,7),(73,'Curicó',-35.170400,-70.895400,7),(74,'Linares',-35.849500,-71.585000,7),(81,'Concepción',-36.814800,-73.029300,8),(82,'Arauco',-37.727700,-73.307500,8),(83,'Biobío',-37.473900,-72.157200,8),(91,'Cautín',-38.727000,-72.598900,9),(92,'Malleco',-37.803000,-72.701700,9),(101,'Llanquihue',-41.453000,-72.613500,10),(102,'Chiloé',-43.117000,-73.998400,10),(103,'Osorno',-40.736900,-72.984900,10),(104,'Palena',-43.444900,-72.092300,10),(111,'Coihaique',-45.286500,-71.779200,11),(112,'Aysén',-46.384800,-72.295500,11),(113,'Capitán Prat',-47.923200,-72.924500,11),(114,'General Carrera',-46.557000,-72.412300,11),(121,'Magallanes',-53.631600,-71.592400,12),(122,'Antártica Chilena',-55.028000,-67.631800,12),(123,'Tierra del Fuego',-53.742200,-69.224900,12),(124,'Última Esperanza',-51.016300,-73.428500,12),(131,'Santiago',-33.441700,-70.654100,13),(132,'Cordillera',-33.698400,-70.168200,13),(133,'Chacabuco',-33.150300,-70.713200,13),(134,'Maipo',-33.796300,-70.735300,13),(135,'Melipilla',-33.736900,-71.174300,13),(136,'Talagante',-33.666500,-70.933100,13),(141,'Valdivia',-39.781100,-72.509800,14),(142,'Ranco',-40.411400,-72.498800,14),(151,'Arica',-18.713900,-69.752200,15),(152,'Parinacota',-18.313500,-69.378800,15),(161,'Diguillín',-366.197000,-721.014000,16),(162,'Itata',-367.639000,-724.491000,16),(163,'Punilla',-364.261000,-719.708000,16);
/*!40000 ALTER TABLE `provinces_townships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regiones_states`
--

DROP TABLE IF EXISTS `regiones_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regiones_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `latitude` decimal(9,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regiones_states`
--

LOCK TABLES `regiones_states` WRITE;
/*!40000 ALTER TABLE `regiones_states` DISABLE KEYS */;
INSERT INTO `regiones_states` VALUES (1,'Tarapacá',-20.164000,-69.554100),(2,'Antofagasta',-23.750300,-69.600000),(3,'Atacama',-27.527600,-70.249400),(4,'Coquimbo',-30.830100,-70.981600),(5,'Valparaíso',-32.903900,-71.026200),(6,'Del Libertador Gral. Bernardo O\'Higgins',-34.429400,-71.039300),(7,'Del Maule',-35.589200,-71.500700),(8,'Del Biobío',-37.244200,-72.466100),(9,'De la Araucanía',-38.550500,-72.438200),(10,'De los Lagos',-42.107100,-72.642500),(11,'Aysén del Gral. Carlos Ibáñez del Campo',-46.277200,-73.662800),(12,'Magallanes y de la Antártica Chilena',-54.355100,-70.528400),(13,'Metropolitana de Santiago',-33.441700,-70.654100),(14,'De los Ríos',-39.908600,-72.703400),(15,'Arica y Parinacota',-18.507500,-69.645100),(16,'Ñuble',-366.191000,-720.182000);
/*!40000 ALTER TABLE `regiones_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `government_taxes` decimal(10,2) DEFAULT NULL,
  `state_taxes` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `documents_id` int(11) DEFAULT NULL,
  `offices_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_id` (`documents_id`),
  KEY `offices_id` (`offices_id`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`documents_id`) REFERENCES `documents` (`id`),
  CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`offices_id`) REFERENCES `offices` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_details`
--

DROP TABLE IF EXISTS `sales_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `sales_id` int(11) DEFAULT NULL,
  `products_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_id` (`sales_id`),
  KEY `products_id` (`products_id`),
  CONSTRAINT `sales_details_ibfk_1` FOREIGN KEY (`sales_id`) REFERENCES `sales` (`id`),
  CONSTRAINT `sales_details_ibfk_2` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_details`
--

LOCK TABLES `sales_details` WRITE;
/*!40000 ALTER TABLE `sales_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_session`
--

DROP TABLE IF EXISTS `shopping_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customers_id` (`customers_id`),
  CONSTRAINT `shopping_session_ibfk_1` FOREIGN KEY (`customers_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_session`
--

LOCK TABLES `shopping_session` WRITE;
/*!40000 ALTER TABLE `shopping_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-10 20:02:28
