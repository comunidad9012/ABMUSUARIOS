-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: saludtest333
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `Usuario_user_id` int NOT NULL,
  `Fecha_creacion` varchar(45) DEFAULT NULL,
  `Estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cart_id`,`Usuario_user_id`),
  KEY `fk_Carrito_Usuario_idx` (`Usuario_user_id`),
  CONSTRAINT `fk_Carrito_Usuario` FOREIGN KEY (`Usuario_user_id`) REFERENCES `usuario` (`user_id`) on delete cascade
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
INSERT INTO `carrito` VALUES (1,13,'7/15/2023','1'),(2,40,'11/19/2022','0'),(3,13,'3/19/2023','1'),(4,42,'2/12/2023','1'),(5,20,'7/6/2023','1'),(6,26,'4/15/2023','0'),(7,18,'10/16/2023','1'),(8,11,'9/29/2023','1'),(9,50,'9/4/2023','0'),(10,16,'11/28/2022','0'),(11,31,'8/25/2023','0'),(12,7,'5/4/2023','0'),(13,40,'7/4/2023','0'),(14,29,'4/20/2023','1'),(15,24,'6/9/2023','1'),(16,31,'3/9/2023','1'),(17,33,'9/19/2023','1'),(18,22,'10/4/2023','1'),(19,11,'12/20/2022','0'),(20,40,'1/23/2023','0'),(21,15,'6/23/2023','1'),(22,6,'3/15/2023','1'),(23,32,'12/8/2022','0'),(24,44,'11/9/2022','1'),(25,24,'6/16/2023','0'),(26,38,'9/30/2023','1'),(27,18,'10/10/2023','1'),(28,23,'4/14/2023','0'),(29,10,'5/15/2023','0'),(30,30,'2/9/2023','1'),(31,23,'9/19/2023','1'),(32,21,'9/25/2023','1'),(33,36,'3/17/2023','1'),(34,17,'4/26/2023','1'),(35,25,'4/25/2023','0'),(36,26,'10/5/2023','0'),(37,4,'6/17/2023','0'),(38,42,'1/7/2023','1'),(39,48,'4/4/2023','1'),(40,12,'3/7/2023','0'),(41,15,'2/10/2023','1'),(42,40,'5/29/2023','0'),(43,3,'6/2/2023','1'),(44,46,'11/10/2022','1'),(45,18,'3/2/2023','1'),(46,3,'9/10/2023','0'),(47,11,'4/27/2023','0'),(48,45,'5/4/2023','0'),(49,41,'4/17/2023','1'),(50,18,'4/17/2023','1');
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito_has_producto`
--

DROP TABLE IF EXISTS `carrito_has_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito_has_producto` (
  `Carrito_cart_id` int NOT NULL AUTO_INCREMENT,
  `Carrito_Usuario_user_id` int NOT NULL,
  `Producto_product_id` int NOT NULL,
  `TotalProduct` int DEFAULT NULL,
  PRIMARY KEY (`Carrito_cart_id`,`Carrito_Usuario_user_id`,`Producto_product_id`),
  KEY `fk_Carrito_has_Producto_Producto1_idx` (`Producto_product_id`),
  KEY `fk_Carrito_has_Producto_Carrito1_idx` (`Carrito_cart_id`,`Carrito_Usuario_user_id`),
  CONSTRAINT `fk_Carrito_has_Producto_Carrito1` FOREIGN KEY (`Carrito_cart_id`, `Carrito_Usuario_user_id`) REFERENCES `carrito` (`cart_id`, `Usuario_user_id`)on delete cascade,
  CONSTRAINT `fk_Carrito_has_Producto_Producto1` FOREIGN KEY (`Producto_product_id`) REFERENCES `producto` (`product_id`)on delete cascade
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito_has_producto`
--

LOCK TABLES `carrito_has_producto` WRITE;
/*!40000 ALTER TABLE `carrito_has_producto` DISABLE KEYS */;
INSERT INTO `carrito_has_producto` VALUES (1,13,45,34),(2,40,24,2),(3,13,40,4),(4,42,35,5),(5,20,2,7),(6,26,1,9),(7,18,46,12),(8,11,38,19),(9,50,45,14),(10,16,24,15),(11,31,16,16),(12,7,47,20),(13,40,24,21),(14,29,15,4),(15,24,21,5),(16,31,34,2),(17,33,50,1),(18,22,19,4),(19,11,40,6),(20,40,47,7),(21,15,17,8),(22,6,40,16),(23,32,21,17),(24,44,39,29),(25,24,5,33),(26,38,49,12),(27,18,8,25),(28,23,48,12),(29,10,16,6),(30,30,32,7),(31,23,33,9),(32,21,15,1),(33,36,40,3),(34,17,24,12),(35,25,14,15),(36,26,14,16),(37,4,17,18),(38,42,49,19),(39,48,38,20),(40,12,11,22),(41,15,15,23),(42,40,14,24),(43,3,31,26),(44,46,16,22),(45,18,1,23),(46,3,32,16),(47,11,36,12),(48,45,46,35),(49,41,25,12),(50,18,31,19);
/*!40000 ALTER TABLE `carrito_has_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `categoria_id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Plantas medicinales'),(2,'Suplementos'),(3,'Snacks'),(4,'Aceites'),(5,'Fitness'),(6,'Granel');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_has_producto`
--

DROP TABLE IF EXISTS `categoria_has_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_has_producto` (
  `Categoria_categoria_id` int NOT NULL AUTO_INCREMENT,
  `Producto_product_id` int NOT NULL,
  PRIMARY KEY (`Categoria_categoria_id`,`Producto_product_id`),
  KEY `fk_Categoria_has_Producto_Producto1_idx` (`Producto_product_id`),
  KEY `fk_Categoria_has_Producto_Categoria1_idx` (`Categoria_categoria_id`),
  CONSTRAINT `fk_Categoria_has_Producto_Categoria1` FOREIGN KEY (`Categoria_categoria_id`) REFERENCES `categoria` (`categoria_id`) on delete cascade,
  CONSTRAINT `fk_Categoria_has_Producto_Producto1` FOREIGN KEY (`Producto_product_id`) REFERENCES `producto` (`product_id`)on delete cascade
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_has_producto`
--

LOCK TABLES `categoria_has_producto` WRITE;
/*!40000 ALTER TABLE `categoria_has_producto` DISABLE KEYS */;
INSERT INTO `categoria_has_producto` VALUES (5,1),(5,2),(3,3),(6,4),(1,5),(1,6),(4,7),(1,8),(3,9),(5,10),(3,11),(1,12),(1,13),(2,14),(1,15),(2,16),(3,17),(6,18),(5,19),(5,20),(5,21),(3,22),(1,23),(2,24),(6,25),(6,26),(4,27),(4,28),(5,29),(1,30),(6,31),(3,32),(1,33),(4,34),(3,35),(4,36),(3,37),(1,38),(4,39),(3,40),(3,41),(1,42),(2,43),(4,44),(1,45),(4,46),(5,47),(1,48),(6,49),(2,50);
/*!40000 ALTER TABLE `categoria_has_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `comentario_id` int NOT NULL AUTO_INCREMENT,
  `Usuario_user_id` int NOT NULL,
  `Producto_product_id` int NOT NULL,
  `Fecha_comen` varchar(45) DEFAULT NULL,
  `Puntuacion_comen` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`comentario_id`,`Usuario_user_id`,`Producto_product_id`),
  KEY `fk_Comentarios_Usuario1_idx` (`Usuario_user_id`),
  KEY `fk_Comentarios_Producto1_idx` (`Producto_product_id`),
  CONSTRAINT `fk_Comentarios_Producto1` FOREIGN KEY (`Producto_product_id`) REFERENCES `producto` (`product_id`) on delete cascade,
  CONSTRAINT `fk_Comentarios_Usuario1` FOREIGN KEY (`Usuario_user_id`) REFERENCES `usuario` (`user_id`)on delete cascade
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (1,48,13,'11/25/2022','2'),(2,49,44,'7/19/2023','2'),(3,20,39,'10/2/2023','4'),(4,50,48,'2/23/2023','5'),(5,12,36,'8/27/2023','5'),(6,9,13,'12/29/2022','4'),(7,46,20,'7/2/2023','1'),(8,34,44,'12/13/2022','2'),(9,11,46,'4/18/2023','5'),(10,4,22,'9/7/2023','5'),(11,19,3,'12/26/2022','1'),(12,34,44,'7/17/2023','2'),(13,1,5,'9/13/2023','2'),(14,36,21,'12/25/2022','5'),(15,12,26,'4/17/2023','5'),(16,32,33,'4/19/2023','2'),(17,39,40,'2/14/2023','4'),(18,45,24,'9/18/2023','4'),(19,14,8,'4/8/2023','5'),(20,15,30,'11/23/2022','1'),(21,35,9,'8/19/2023','5'),(22,26,9,'1/29/2023','2'),(23,46,37,'11/1/2022','5'),(24,10,19,'3/7/2023','2'),(25,9,3,'11/16/2022','4'),(26,34,4,'2/18/2023','2'),(27,26,27,'2/2/2023','1'),(28,40,38,'12/12/2022','2'),(29,23,11,'12/29/2022','4'),(30,44,16,'1/15/2023','5'),(31,25,40,'6/26/2023','3'),(32,10,20,'4/10/2023','2'),(33,36,20,'8/11/2023','5'),(34,3,35,'3/27/2023','2'),(35,22,13,'4/26/2023','1'),(36,14,15,'4/14/2023','4'),(37,22,9,'2/15/2023','3'),(38,9,14,'1/28/2023','5'),(39,11,34,'9/23/2023','4'),(40,25,18,'8/29/2023','2'),(41,20,6,'5/20/2023','2'),(42,28,29,'8/18/2023','2'),(43,29,6,'7/16/2023','4'),(44,29,27,'1/5/2023','5'),(45,47,49,'4/9/2023','1'),(46,22,47,'12/23/2022','2'),(47,44,21,'3/25/2023','2'),(48,39,34,'6/12/2023','1'),(49,6,24,'9/25/2023','1'),(50,32,6,'2/4/2023','4');
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `compra_id` int NOT NULL AUTO_INCREMENT,
  `Usuario_user_id` int NOT NULL,
  `Fecha_compra` varchar(45) DEFAULT NULL,
  `Total` int DEFAULT NULL,
  `Cantidad` int DEFAULT NULL,
  PRIMARY KEY (`compra_id`,`Usuario_user_id`),
  KEY `fk_Compra_Usuario1_idx` (`Usuario_user_id`),
  CONSTRAINT `fk_Compra_Usuario1` FOREIGN KEY (`Usuario_user_id`) REFERENCES `usuario` (`user_id`) on delete cascade
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,19,'10/11/2023',73,79),(2,42,'4/12/2023',63,76),(3,16,'8/14/2023',0,26),(4,19,'3/22/2023',51,8),(5,15,'6/19/2023',16,19),(6,4,'5/11/2023',84,80),(7,38,'5/1/2023',76,38),(8,31,'12/5/2022',43,94),(9,42,'4/9/2023',99,36),(10,14,'10/4/2023',32,32),(11,39,'1/18/2023',19,87),(12,2,'1/12/2023',60,58),(13,40,'11/30/2022',17,20),(14,30,'7/12/2023',53,42),(15,15,'12/5/2022',49,18),(16,3,'4/11/2023',82,67),(17,10,'10/30/2023',78,99),(18,18,'12/30/2022',24,80),(19,47,'3/26/2023',87,23),(20,17,'3/21/2023',45,4),(21,8,'11/14/2022',26,64),(22,38,'9/17/2023',29,82),(23,42,'1/20/2023',83,72),(24,5,'8/25/2023',57,34),(25,20,'10/23/2023',49,96),(26,31,'3/19/2023',54,18),(27,2,'5/2/2023',78,62),(28,1,'3/22/2023',12,23),(29,4,'10/11/2023',35,70),(30,13,'7/1/2023',21,21),(31,14,'10/8/2023',63,72),(32,38,'10/2/2023',8,64),(33,46,'11/28/2022',54,62),(34,20,'9/25/2023',16,8),(35,11,'11/26/2022',25,80),(36,20,'1/9/2023',39,52),(37,22,'7/9/2023',80,60),(38,35,'7/16/2023',76,71),(39,21,'10/28/2023',72,96),(40,27,'1/27/2023',84,77),(41,12,'5/24/2023',35,89),(42,38,'11/15/2022',89,6),(43,2,'1/30/2023',65,100),(44,45,'10/13/2023',79,46),(45,30,'8/16/2023',54,60),(46,11,'11/2/2022',71,30),(47,41,'12/27/2022',66,18),(48,22,'7/4/2023',26,64),(49,45,'7/20/2023',72,57),(50,8,'4/27/2023',38,1);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Precio` int DEFAULT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `Estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Ocean Spray - green gray',402,'Verbenaceae','1'),(2,'Water - Evian 355 Ml',433,'Asteraceae','1'),(3,'Wiberg Super Cure',610,'Cactaceae','0'),(4,'Wine - George Duboeuf Rose',791,'Trichotheliaceae','0'),(5,'Orange Roughy 6/8 Oz',726,'Polygalaceae','0'),(6,'Veal - Knuckle',746,'Asteraceae','0'),(7,'Okra',508,'Caliciaceae','1'),(8,'Onions - Pearl',332,'Poaceae','1'),(9,'Bread - Bistro Sour',614,'Melastomataceae','1'),(10,'Veal - Tenderloin, Untrimmed',777,'Loasaceae','0'),(11,'Iced Tea Concentrate',163,'Cyperaceae','0'),(12,'Sauce Tomato Pouch',882,'Costaceae','0'),(13,'Soup V8 Roasted Red Pepper',510,'Asteraceae','0'),(14,'Juice - Tomato, 48 Oz',456,'Fagaceae','1'),(15,'Table Cloth 90x90 Colour',11,'Poaceae','0'),(16,'Chocolate Liqueur - Godet White',886,'Monoblastiaceae','0'),(17,'Wine - Mondavi Coastal Private',41,'Rosaceae','0'),(18,'Lemon Pepper',475,'Cuscutaceae','1'),(19,'Catfish - Fillets',391,'Phyllachoraceae','1'),(20,'Fish - Scallops, Cold Smoked',999,'Polemoniaceae','1'),(21,'Lettuce - Frisee',610,'Fabaceae','0'),(22,'Liqueur - Melon',883,'Fabaceae','0'),(23,'Wine - Charddonnay Errazuriz',290,'Acanthaceae','1'),(24,'Veal - Eye Of Round',547,'Liliaceae','1'),(25,'Fondant - Icing',612,'Asteraceae','0'),(26,'Coconut Milk - Unsweetened',78,'Styracaceae','0'),(27,'Chocolate - Pistoles, White',556,'Fagaceae','0'),(28,'Garlic',59,'Brassicaceae','0'),(29,'Scampi Tail',573,'Dicranaceae','1'),(30,'Tomatoes Tear Drop',958,'Hymeneliaceae','0'),(31,'Mushroom - Enoki, Dry',837,'Poaceae','0'),(32,'Seedlings - Buckwheat, Organic',833,'Asteraceae','0'),(33,'Wine - White, Chardonnay',802,'Parmeliaceae','0'),(34,'Wine - Puligny Montrachet A.',274,'Poaceae','0'),(35,'Creme De Menth - White',833,'Scrophulariaceae','1'),(36,'Tuna - Fresh',688,'Cactaceae','1'),(37,'Wine - White, Ej',530,'Acanthaceae','0'),(38,'Scallop - St. Jaques',432,'Cyperaceae','1'),(39,'Cheese - Parmigiano Reggiano',974,'Fabaceae','1'),(40,'Pork - Belly Fresh',71,'Selaginellaceae','0'),(41,'Soup - Campbells Mac N Cheese',569,'Ericaceae','0'),(42,'Paper Towel Touchless',51,'Acanthaceae','0'),(43,'Bread Bowl Plain',766,'Ericaceae','0'),(44,'Bagel - Everything Presliced',41,'Hydrophyllaceae','0'),(45,'Bread - Ciabatta Buns',26,'Euphorbiaceae','1'),(46,'Sambuca - Opal Nera',533,'Apiaceae','1'),(47,'Lid - 16 Oz And 32 Oz',520,'Asteraceae','1'),(48,'Pork - Chop, Frenched',712,'Liliaceae','0'),(49,'Seedlings - Mix, Organic',824,'Grammitidaceae','0'),(50,'Pork - Side Ribs',580,'Bataceae','0');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_has_compra`
--

DROP TABLE IF EXISTS `producto_has_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_has_compra` (
  `Producto_product_id` int NOT NULL,
  `Compra_compra_id` int NOT NULL,
  `Compra_Usuario_user_id` int NOT NULL,
  PRIMARY KEY (`Producto_product_id`,`Compra_compra_id`,`Compra_Usuario_user_id`),
  KEY `fk_Producto_has_compra_Compra1_idx` (`Compra_compra_id`,`Compra_Usuario_user_id`),
  CONSTRAINT `fk_Producto_has_compra_Compra1` FOREIGN KEY (`Compra_compra_id`, `Compra_Usuario_user_id`) REFERENCES `compra` (`compra_id`, `Usuario_user_id`) on delete cascade,
  CONSTRAINT `fk_Producto_has_compra_Producto1` FOREIGN KEY (`Producto_product_id`) REFERENCES `producto` (`product_id`)on delete cascade
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_has_compra`
--

LOCK TABLES `producto_has_compra` WRITE;
/*!40000 ALTER TABLE `producto_has_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto_has_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Contraseña` varchar(45) DEFAULT NULL,
  `Correo_elec` varchar(45) DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `Fecha_regis` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Reggis','jN4?j}%8D.bhlKQG','rattkins0@geocities.jp','034 Surrey Alley','12/27/2022'),(2,'Abram','bP5(hd}\'0','rgethin1@over-blog.com','8046 Declaration Junction','12/29/2024'),(3,'Annalee','kT9*Vp`%QmfJhSH','ateasell2@a8.net','5 Harbort Pass','2/6/2023'),(4,'Emaleesss','jA0/V2d6Y3Rg|RG','epechell3@ning.com','3612 Moose Avenue','6/23/2023'),(5,'Lissa','eG1)uS>MCE1cC','lduding4@cbslocal.com','9128 7th Trail','9/6/2023'),(6,'Gerhardt','nI8!Ec!YXCKj0rgP','gbesemer5@rediff.com','536 Pawling Terrace','12/18/2022'),(7,'Garfield','mT5+XB|.tkP0qgTl','ghugueville6@wikia.com','249 Talisman Drive','5/1/2023'),(8,'Prissie','kF3{u4CGZ1','pmaclachlan7@yolasite.com','5 Park Meadow Crossing','4/1/2023'),(9,'Saleem','bG5$T6tQRzy|0hmg','sgallant8@pen.io','0520 Waubesa Lane','8/27/2023'),(10,'Mozelle','wH5=?&&P5','mkezar9@princeton.edu','2587 Stone Corner Alley','9/6/2023'),(11,'Maudie','uR3_2IRdx|\0E5U2','mrevansa@gravatar.com','45 Browning Lane','2/14/2023'),(12,'Roderigo','wL1#lvo|Ag9Gsr','rlamploughb@4shared.com','4 Mcguire Crossing','9/6/2023'),(13,'Hayward','aD9`.Q2`9X)}L!','hromanellic@barnesandnoble.com','74 Mayer Way','10/6/2023'),(14,'Carmon','mH3@yG)vb0e','cricketsd@dailymotion.com','2865 Tennyson Junction','10/4/2023'),(15,'Kingston','mW2|~|k2h=O}h.','kmachele@ameblo.jp','24 Emmet Parkway','11/6/2022'),(16,'Rosette','nK1\"RXvGzOe=~O','rstaleyf@xing.com','24 Schmedeman Avenue','5/30/2023'),(17,'Tiebold','jO7/DNvg','tsticklesg@baidu.com','47415 Southridge Hill','5/17/2023'),(18,'Christoph','bS3\'Hp/1$','ctruitth@topsy.com','6428 Macpherson Crossing','7/12/2023'),(19,'Cindra','pM2&MES`af','ckenderi@tinypic.com','78 Superior Trail','1/6/2023'),(20,'Jammal','yO6)%t<aE(==x','jdavydochj@time.com','7149 Coleman Parkway','5/18/2023'),(21,'Aldon','aQ9+~OLhQiU`uvik','acoutthartk@opensource.org','727 Sunnyside Point','4/10/2023'),(22,'Shawn','rF0%`rnw`fIy','snormadelll@wordpress.com','3670 Everett Circle','6/24/2023'),(23,'Herta','vC6*%<N?$4g\"%.$','hparisom@howstuffworks.com','17 Maywood Avenue','9/9/2023'),(24,'Thorin','mK9>Yj(P3JK.D','tspavenn@ca.gov','1 Corscot Alley','10/10/2023'),(25,'Mort','eF6.,TAtUbH4uN','mcostio@scribd.com','02 Namekagon Trail','3/23/2023'),(26,'Oren','xP0@x(\'%','okilgrewp@over-blog.com','00 Brentwood Junction','10/12/2023'),(27,'Neil','lB6)&kWZ57qbSl','nheardq@ed.gov','3574 Sundown Way','11/8/2022'),(28,'Audre','pY0~p`Xb\"','awallsr@gizmodo.com','788 Vermont Junction','12/12/2022'),(29,'Cristiano','fD9&$.Ovy(i1,E93','cmquhans@opera.com','27924 Schmedeman Court','7/5/2023'),(30,'Abbe','lR7`~Py&V/,J','agorbellt@opera.com','6852 Spenser Junction','12/2/2022'),(31,'Andrej','gC2%G%{&vvBv*','aolubyu@dot.gov','2 Magdeline Court','7/5/2023'),(32,'Fenelia','bN9.|ShY~','fgoodrumv@businessinsider.com','3530 Riverside Trail','9/29/2023'),(33,'Windham','sB9,m&7d(7B/2+','wmatousekw@lulu.com','423 Surrey Crossing','1/15/2023'),(34,'Llewellyn','yV2}`YzP)M/E.n`n','lollerx@scientificamerican.com','46487 Coleman Crossing','11/6/2022'),(35,'Reginald','lH4/(wnP~S(_Tv','rtomaszynskiy@ted.com','7990 Tomscot Plaza','9/7/2023'),(36,'Ezmeralda','yZ6=9#<%','emarvelz@imgur.com','58 Bashford Pass','5/26/2023'),(37,'Lyndsey','zA5\'@GiYd9@(gY','lspink10@prlog.org','79 Schmedeman Junction','11/24/2022'),(38,'Ezekiel','oN2+?\'|I,','emcavinchey11@merriam-webster.com','7849 Armistice Pass','5/14/2023'),(39,'Kassey','eN6=Z/YDmqe~','ktaberer12@nps.gov','5178 Park Meadow Circle','2/28/2023'),(40,'Corrie','aS7(/{ao55Rc&6?','ccahn13@craigslist.org','62 Vernon Street','9/21/2023'),(41,'Vasilis','gH8\"*bSvotx!%yg8','vpendle14@typepad.com','7 La Follette Avenue','8/20/2023'),(42,'Benny','gA1&jUj+{sG','bryley15@independent.co.uk','55 East Road','10/4/2023'),(43,'Zea','mJ3%?6L9LRTb1>','zfiddeman16@dyndns.org','9687 Lawn Parkway','8/25/2023'),(44,'Kirby','cR7~xevg7z\'','kjager17@naver.com','7 Thompson Terrace','8/2/2023'),(45,'Arluene','vI5?}0_Pmw{kn','abernath18@meetup.com','708 Jenifer Street','5/12/2023'),(46,'Daria','eG7.|A%ztjIQx(','dtanner19@admin.ch','28 Cambridge Center','1/10/2023'),(47,'Janeczka','yR1!)H/YYXR%qik','jgrumell1a@chronoengine.com','3 Kings Park','5/21/2023'),(48,'Pauly','rI7.*6\"P','pdureden1b@jiathis.com','70 Mayer Trail','10/31/2023'),(49,'Ronny','tH9$!/i=7{','reloy1c@utexas.edu','20205 Lighthouse Bay Junction','6/2/2023'),(50,'Curry','dZ3%2AWXc`!','ccarlyon1d@weather.com','0661 Kropf Trail','8/24/2023');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valoracion`
--

DROP TABLE IF EXISTS `valoracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valoracion` (
  `rating_id` int NOT NULL AUTO_INCREMENT,
  `Usuario_user_id` int NOT NULL,
  `Producto_product_id` int NOT NULL,
  `Puntuacion` varchar(45) DEFAULT NULL,
  `Fecha` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`rating_id`,`Usuario_user_id`,`Producto_product_id`),
  KEY `fk_Valoracion_Usuario1_idx` (`Usuario_user_id`),
  KEY `fk_Valoracion_Producto1_idx` (`Producto_product_id`),
  CONSTRAINT `fk_Valoracion_Producto1` FOREIGN KEY (`Producto_product_id`) REFERENCES `producto` (`product_id`)on delete cascade,
  CONSTRAINT `fk_Valoracion_Usuario1` FOREIGN KEY (`Usuario_user_id`) REFERENCES `usuario` (`user_id`) on delete cascade
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valoracion`
--

LOCK TABLES `valoracion` WRITE;
/*!40000 ALTER TABLE `valoracion` DISABLE KEYS */;
INSERT INTO `valoracion` VALUES (1,31,3,'3','8/22/2023'),(2,46,18,'5','5/11/2023'),(3,41,9,'3','2/9/2023'),(4,29,29,'1','6/18/2023'),(5,13,33,'3','11/7/2022'),(6,29,18,'1','3/7/2023'),(7,10,42,'3','8/17/2023'),(8,16,42,'2','8/9/2023'),(9,40,8,'3','10/21/2023'),(10,35,9,'4','3/3/2023'),(11,13,1,'2','4/1/2023'),(12,27,37,'1','11/2/2022'),(13,4,10,'4','7/16/2023'),(14,12,41,'3','7/5/2023'),(15,34,6,'3','9/21/2023'),(16,18,9,'4','8/8/2023'),(17,13,50,'1','3/15/2023'),(18,46,3,'3','9/17/2023'),(19,16,6,'4','2/5/2023'),(20,40,4,'5','3/2/2023'),(21,29,1,'2','11/1/2022'),(22,39,37,'2','9/6/2023'),(23,26,29,'2','11/11/2022'),(24,46,27,'5','6/6/2023'),(25,13,16,'5','5/22/2023'),(26,10,23,'4','3/20/2023'),(27,9,37,'1','4/27/2023'),(28,26,6,'1','3/2/2023'),(29,45,18,'1','9/13/2023'),(30,17,23,'2','9/13/2023'),(31,41,18,'2','9/25/2023'),(32,20,5,'2','11/17/2022'),(33,4,29,'4','6/11/2023'),(34,19,3,'1','1/16/2023'),(35,22,40,'4','6/20/2023'),(36,5,19,'3','4/14/2023'),(37,38,3,'5','12/28/2022'),(38,42,8,'2','11/26/2022'),(39,2,15,'2','9/23/2023'),(40,39,42,'5','7/23/2023'),(41,2,20,'5','1/7/2023'),(42,18,50,'5','10/2/2023'),(43,28,3,'4','5/21/2023'),(44,45,32,'3','7/29/2023'),(45,27,11,'3','12/13/2022'),(46,40,25,'1','12/25/2022'),(47,41,46,'1','1/6/2023'),(48,41,35,'1','5/3/2023'),(49,17,19,'5','7/20/2023'),(50,22,22,'5','9/3/2023');
/*!40000 ALTER TABLE `valoracion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-23 16:37:39
