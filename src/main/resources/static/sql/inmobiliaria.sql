CREATE DATABASE  IF NOT EXISTS `inmobiliaria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `inmobiliaria`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: inmobiliaria
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_cmxo70m08n43599l3h0h07cc6` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'González','juan@email.net','Juan'),(2,'López','maria@email.net','María'),(3,'Martínez','pedro@email.net','Pedro'),(4,'Sánchez','laura@email.net','Laura'),(5,'Ruiz','carlos@email.net','Carlos');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inmueble`
--

DROP TABLE IF EXISTS `inmueble`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inmueble` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `banyos` int NOT NULL,
  `cocina` bit(1) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `fecha_inmueble` date DEFAULT NULL,
  `habitaciones` int NOT NULL,
  `imagen_url` varchar(255) DEFAULT NULL,
  `inmueble_texto` text,
  `nombre` varchar(255) NOT NULL,
  `precio` decimal(38,2) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `propietario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9rfc8yx32ojofj0hyosyo98ck` (`propietario_id`),
  CONSTRAINT `FK9rfc8yx32ojofj0hyosyo98ck` FOREIGN KEY (`propietario_id`) REFERENCES `propietarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inmueble`
--

LOCK TABLES `inmueble` WRITE;
/*!40000 ALTER TABLE `inmueble` DISABLE KEYS */;
INSERT INTO `inmueble` VALUES (1,1,_binary '','Calle Juan XXIII, 5','2023-05-01',2,'https://picsum.photos/200/300?random=1','Acogedor piso en el corazón de Deusto, cerca de la universidad.','Piso en Deusto',200000.00,'Venta',1),(2,1,_binary '\0','Plaza Circular, 1','2023-06-15',1,'https://picsum.photos/200/300?random=2','Moderno apartamento con vistas a la plaza principal de Abando.','Apartamento en Abando',180000.00,'venta',2),(3,2,_binary '','Calle Somera, 12','2023-04-20',3,'https://picsum.photos/200/300?random=3','Encantadora casa de estilo tradicional en el corazón del Casco Viejo.','Casa en el Casco Viejo',350000.00,'venta',3),(4,2,_binary '','Calle Rodríguez Arias, 23','2023-07-10',4,'https://picsum.photos/200/300?random=4','Espectacular ático con amplia terraza en una de las mejores zonas de Indautxu.','Ático en Indautxu',400000.00,'venta',4),(5,1,_binary '','Calle San Francisco, 10','2023-08-05',2,'https://picsum.photos/200/300?random=5','Luminoso piso con vistas al río en el vibrante barrio de Bilbao La Vieja.','Piso en Bilbao La Vieja',250000.00,'alquiler',5),(6,1,_binary '','bonito bonito bonito bonito bonito bonito ','2023-08-05',3,'https://picsum.photos/600/400/?random=1','fsedgasf sda gae gagaewt','Descubrimiento de nueva especie de dinosaurio en Argentina',3213143.00,'Alquiler',4),(7,5,_binary '\0','bonito bonito bonito bonito bonito bonito ','2023-08-05',5,'https://picsum.photos/600/400/?random=1','5gfhdfhjdfxgjdfxfgj  gdfgdfgdfg ','Chorizo',4325423523.00,'Venta',5);
/*!40000 ALTER TABLE `inmueble` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inmueble_servicio`
--

DROP TABLE IF EXISTS `inmueble_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inmueble_servicio` (
  `inmueble_id` bigint NOT NULL,
  `servicio_id` bigint NOT NULL,
  PRIMARY KEY (`inmueble_id`,`servicio_id`),
  KEY `FKqwq55q2twwgvwog4xds3afdkm` (`servicio_id`),
  CONSTRAINT `FK1r6t4rccoi0apjrsijp8j3867` FOREIGN KEY (`inmueble_id`) REFERENCES `inmueble` (`id`),
  CONSTRAINT `FKqwq55q2twwgvwog4xds3afdkm` FOREIGN KEY (`servicio_id`) REFERENCES `servicio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inmueble_servicio`
--

LOCK TABLES `inmueble_servicio` WRITE;
/*!40000 ALTER TABLE `inmueble_servicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `inmueble_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operaciones`
--

DROP TABLE IF EXISTS `operaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operaciones` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_operacion` date NOT NULL,
  `inmueble_id` bigint NOT NULL,
  `usuario_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4nsmag84pvyngjix85wu7cvq1` (`inmueble_id`),
  KEY `FK7l4rea8fogxt1cw20qilq7mr3` (`usuario_id`),
  CONSTRAINT `FK4nsmag84pvyngjix85wu7cvq1` FOREIGN KEY (`inmueble_id`) REFERENCES `inmueble` (`id`),
  CONSTRAINT `FK7l4rea8fogxt1cw20qilq7mr3` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operaciones`
--

LOCK TABLES `operaciones` WRITE;
/*!40000 ALTER TABLE `operaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `operaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propietarios`
--

DROP TABLE IF EXISTS `propietarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propietarios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_e58t6h3b32685g3r00pqu1q34` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propietarios`
--

LOCK TABLES `propietarios` WRITE;
/*!40000 ALTER TABLE `propietarios` DISABLE KEYS */;
INSERT INTO `propietarios` VALUES (1,'Bardem','javier@bardem.com','Javier'),(2,'Romero','amaia@romero.com','Amaia'),(3,'Llorente','fernando@llorente.com','Fernando'),(4,'Aduriz','aritz@aduriz.com','Aritz'),(5,'González','eva@gonzalez.com','Eva');
/*!40000 ALTER TABLE `propietarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (1,'Cocina equipada'),(2,'Terraza'),(3,'Garaje'),(4,'Trastero'),(5,'Jardín');
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `apellido` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `rol` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Lete','javier@email.net','Javier','$2a$12$mof.u/4EIo58hR7On9DnPevyqBC7kb9FHzT.LN/BjF8xOqQVTP1NO','ADMIN'),(2,'Arretxea','koldo@email.net','Koldo','$2a$12$NhIMIVI5wNYc97crXmW9rupNsEbeea1BxPu.H0gSDkiDQrhhmXeZO','ADMIN'),(3,'Peponez','pepe@email.net','Pepe','$2a$12$Dij9cgV3mXDQYtOo4nvQTOLaUz3URoe7DGjhBrqGa1fEEzkNVhBgq','USER'),(4,'Lete','javier@email.net','Javier','$2a$12$mof.u/4EIo58hR7On9DnPevyqBC7kb9FHzT.LN/BjF8xOqQVTP1NO','ADMIN'),(5,'Arretxea','koldo@email.net','Koldo','$2a$12$NhIMIVI5wNYc97crXmW9rupNsEbeea1BxPu.H0gSDkiDQrhhmXeZO','ADMIN'),(6,'Peponez','pepe@email.net','Pepe','$2a$12$Dij9cgV3mXDQYtOo4nvQTOLaUz3URoe7DGjhBrqGa1fEEzkNVhBgq','USER'),(7,'Lete','javier@email.net','Javier','$2a$12$mof.u/4EIo58hR7On9DnPevyqBC7kb9FHzT.LN/BjF8xOqQVTP1NO','ADMIN'),(8,'Arretxea','koldo@email.net','Koldo','$2a$12$NhIMIVI5wNYc97crXmW9rupNsEbeea1BxPu.H0gSDkiDQrhhmXeZO','ADMIN'),(9,'Peponez','pepe@email.net','Pepe','$2a$12$Dij9cgV3mXDQYtOo4nvQTOLaUz3URoe7DGjhBrqGa1fEEzkNVhBgq','USER'),(10,'Lete','javier@email.net','Javier','$2a$12$mof.u/4EIo58hR7On9DnPevyqBC7kb9FHzT.LN/BjF8xOqQVTP1NO','ADMIN'),(11,'Arretxea','koldo@email.net','Koldo','$2a$12$NhIMIVI5wNYc97crXmW9rupNsEbeea1BxPu.H0gSDkiDQrhhmXeZO','ADMIN'),(12,'Peponez','pepe@email.net','Pepe','$2a$12$Dij9cgV3mXDQYtOo4nvQTOLaUz3URoe7DGjhBrqGa1fEEzkNVhBgq','USER'),(13,'Lete','javier@email.net','Javier','$2a$12$mof.u/4EIo58hR7On9DnPevyqBC7kb9FHzT.LN/BjF8xOqQVTP1NO','ADMIN'),(14,'Arretxea','koldo@email.net','Koldo','$2a$12$NhIMIVI5wNYc97crXmW9rupNsEbeea1BxPu.H0gSDkiDQrhhmXeZO','ADMIN'),(15,'Peponez','pepe@email.net','Pepe','$2a$12$Dij9cgV3mXDQYtOo4nvQTOLaUz3URoe7DGjhBrqGa1fEEzkNVhBgq','USER'),(16,'Lete','javier@email.net','Javier','$2a$12$mof.u/4EIo58hR7On9DnPevyqBC7kb9FHzT.LN/BjF8xOqQVTP1NO','ADMIN'),(17,'Arretxea','koldo@email.net','Koldo','$2a$12$NhIMIVI5wNYc97crXmW9rupNsEbeea1BxPu.H0gSDkiDQrhhmXeZO','ADMIN'),(18,'Peponez','pepe@email.net','Pepe','$2a$12$Dij9cgV3mXDQYtOo4nvQTOLaUz3URoe7DGjhBrqGa1fEEzkNVhBgq','USER'),(19,'Lete','javier@email.net','Javier','$2a$12$mof.u/4EIo58hR7On9DnPevyqBC7kb9FHzT.LN/BjF8xOqQVTP1NO','ADMIN'),(20,'Arretxea','koldo@email.net','Koldo','$2a$12$NhIMIVI5wNYc97crXmW9rupNsEbeea1BxPu.H0gSDkiDQrhhmXeZO','ADMIN'),(21,'Peponez','pepe@email.net','Pepe','$2a$12$Dij9cgV3mXDQYtOo4nvQTOLaUz3URoe7DGjhBrqGa1fEEzkNVhBgq','USER'),(22,'Lete','javier@email.net','Javier','$2a$12$mof.u/4EIo58hR7On9DnPevyqBC7kb9FHzT.LN/BjF8xOqQVTP1NO','ADMIN'),(23,'Arretxea','koldo@email.net','Koldo','$2a$12$NhIMIVI5wNYc97crXmW9rupNsEbeea1BxPu.H0gSDkiDQrhhmXeZO','ADMIN'),(24,'Peponez','pepe@email.net','Pepe','$2a$12$Dij9cgV3mXDQYtOo4nvQTOLaUz3URoe7DGjhBrqGa1fEEzkNVhBgq','USER'),(25,'Lete','javier@email.net','Javier','$2a$12$mof.u/4EIo58hR7On9DnPevyqBC7kb9FHzT.LN/BjF8xOqQVTP1NO','ADMIN'),(26,'Arretxea','koldo@email.net','Koldo','$2a$12$NhIMIVI5wNYc97crXmW9rupNsEbeea1BxPu.H0gSDkiDQrhhmXeZO','ADMIN'),(27,'Peponez','pepe@email.net','Pepe','$2a$12$Dij9cgV3mXDQYtOo4nvQTOLaUz3URoe7DGjhBrqGa1fEEzkNVhBgq','USER'),(28,'Lete','javier@email.net','Javier','$2a$12$mof.u/4EIo58hR7On9DnPevyqBC7kb9FHzT.LN/BjF8xOqQVTP1NO','ADMIN'),(29,'Arretxea','koldo@email.net','Koldo','$2a$12$NhIMIVI5wNYc97crXmW9rupNsEbeea1BxPu.H0gSDkiDQrhhmXeZO','ADMIN'),(30,'Peponez','pepe@email.net','Pepe','$2a$12$Dij9cgV3mXDQYtOo4nvQTOLaUz3URoe7DGjhBrqGa1fEEzkNVhBgq','USER'),(31,'Lete','javier@email.net','Javier','$2a$12$mof.u/4EIo58hR7On9DnPevyqBC7kb9FHzT.LN/BjF8xOqQVTP1NO','ADMIN'),(32,'Arretxea','koldo@email.net','Koldo','$2a$12$NhIMIVI5wNYc97crXmW9rupNsEbeea1BxPu.H0gSDkiDQrhhmXeZO','ADMIN'),(33,'Peponez','pepe@email.net','Pepe','$2a$12$Dij9cgV3mXDQYtOo4nvQTOLaUz3URoe7DGjhBrqGa1fEEzkNVhBgq','USER'),(34,'Lete','javier@email.net','Javier','$2a$12$mof.u/4EIo58hR7On9DnPevyqBC7kb9FHzT.LN/BjF8xOqQVTP1NO','ADMIN'),(35,'Arretxea','koldo@email.net','Koldo','$2a$12$NhIMIVI5wNYc97crXmW9rupNsEbeea1BxPu.H0gSDkiDQrhhmXeZO','ADMIN'),(36,'Peponez','pepe@email.net','Pepe','$2a$12$Dij9cgV3mXDQYtOo4nvQTOLaUz3URoe7DGjhBrqGa1fEEzkNVhBgq','USER'),(37,'Lete','javier@email.net','Javier','$2a$12$mof.u/4EIo58hR7On9DnPevyqBC7kb9FHzT.LN/BjF8xOqQVTP1NO','ADMIN'),(38,'Arretxea','koldo@email.net','Koldo','$2a$12$NhIMIVI5wNYc97crXmW9rupNsEbeea1BxPu.H0gSDkiDQrhhmXeZO','ADMIN'),(39,'Peponez','pepe@email.net','Pepe','$2a$12$Dij9cgV3mXDQYtOo4nvQTOLaUz3URoe7DGjhBrqGa1fEEzkNVhBgq','USER'),(40,'Lete','javier@email.net','Javier','$2a$12$mof.u/4EIo58hR7On9DnPevyqBC7kb9FHzT.LN/BjF8xOqQVTP1NO','ADMIN'),(41,'Arretxea','koldo@email.net','Koldo','$2a$12$NhIMIVI5wNYc97crXmW9rupNsEbeea1BxPu.H0gSDkiDQrhhmXeZO','ADMIN'),(42,'Peponez','pepe@email.net','Pepe','$2a$12$Dij9cgV3mXDQYtOo4nvQTOLaUz3URoe7DGjhBrqGa1fEEzkNVhBgq','USER'),(43,'Lete','javier@email.net','Javier','$2a$12$mof.u/4EIo58hR7On9DnPevyqBC7kb9FHzT.LN/BjF8xOqQVTP1NO','ADMIN'),(44,'Arretxea','koldo@email.net','Koldo','$2a$12$NhIMIVI5wNYc97crXmW9rupNsEbeea1BxPu.H0gSDkiDQrhhmXeZO','ADMIN'),(45,'Peponez','pepe@email.net','Pepe','$2a$12$Dij9cgV3mXDQYtOo4nvQTOLaUz3URoe7DGjhBrqGa1fEEzkNVhBgq','USER'),(46,'Lete','javier@email.net','Javier','$2a$12$mof.u/4EIo58hR7On9DnPevyqBC7kb9FHzT.LN/BjF8xOqQVTP1NO','ADMIN'),(47,'Arretxea','koldo@email.net','Koldo','$2a$12$NhIMIVI5wNYc97crXmW9rupNsEbeea1BxPu.H0gSDkiDQrhhmXeZO','ADMIN'),(48,'Peponez','pepe@email.net','Pepe','$2a$12$Dij9cgV3mXDQYtOo4nvQTOLaUz3URoe7DGjhBrqGa1fEEzkNVhBgq','USER'),(49,'Lete','javier@email.net','Javier','$2a$12$mof.u/4EIo58hR7On9DnPevyqBC7kb9FHzT.LN/BjF8xOqQVTP1NO','ADMIN'),(50,'Arretxea','koldo@email.net','Koldo','$2a$12$NhIMIVI5wNYc97crXmW9rupNsEbeea1BxPu.H0gSDkiDQrhhmXeZO','ADMIN'),(51,'Peponez','pepe@email.net','Pepe','$2a$12$Dij9cgV3mXDQYtOo4nvQTOLaUz3URoe7DGjhBrqGa1fEEzkNVhBgq','USER'),(52,'Lete','javier@email.net','Javier','$2a$12$mof.u/4EIo58hR7On9DnPevyqBC7kb9FHzT.LN/BjF8xOqQVTP1NO','ADMIN'),(53,'Arretxea','koldo@email.net','Koldo','$2a$12$NhIMIVI5wNYc97crXmW9rupNsEbeea1BxPu.H0gSDkiDQrhhmXeZO','ADMIN'),(54,'Peponez','pepe@email.net','Pepe','$2a$12$Dij9cgV3mXDQYtOo4nvQTOLaUz3URoe7DGjhBrqGa1fEEzkNVhBgq','USER'),(55,'Lete','javier@email.net','Javier','$2a$12$mof.u/4EIo58hR7On9DnPevyqBC7kb9FHzT.LN/BjF8xOqQVTP1NO','ADMIN'),(56,'Arretxea','koldo@email.net','Koldo','$2a$12$NhIMIVI5wNYc97crXmW9rupNsEbeea1BxPu.H0gSDkiDQrhhmXeZO','ADMIN'),(57,'Peponez','pepe@email.net','Pepe','$2a$12$Dij9cgV3mXDQYtOo4nvQTOLaUz3URoe7DGjhBrqGa1fEEzkNVhBgq','USER'),(58,'Lete','javier@email.net','Javier','$2a$12$mof.u/4EIo58hR7On9DnPevyqBC7kb9FHzT.LN/BjF8xOqQVTP1NO','ADMIN'),(59,'Arretxea','koldo@email.net','Koldo','$2a$12$NhIMIVI5wNYc97crXmW9rupNsEbeea1BxPu.H0gSDkiDQrhhmXeZO','ADMIN'),(60,'Peponez','pepe@email.net','Pepe','$2a$12$Dij9cgV3mXDQYtOo4nvQTOLaUz3URoe7DGjhBrqGa1fEEzkNVhBgq','USER'),(61,'Lete','javier@email.net','Javier','$2a$12$mof.u/4EIo58hR7On9DnPevyqBC7kb9FHzT.LN/BjF8xOqQVTP1NO','ADMIN'),(62,'Arretxea','koldo@email.net','Koldo','$2a$12$NhIMIVI5wNYc97crXmW9rupNsEbeea1BxPu.H0gSDkiDQrhhmXeZO','ADMIN'),(63,'Peponez','pepe@email.net','Pepe','$2a$12$Dij9cgV3mXDQYtOo4nvQTOLaUz3URoe7DGjhBrqGa1fEEzkNVhBgq','USER'),(64,'Lete','javier@email.net','Javier','$2a$12$mof.u/4EIo58hR7On9DnPevyqBC7kb9FHzT.LN/BjF8xOqQVTP1NO','ADMIN'),(65,'Arretxea','koldo@email.net','Koldo','$2a$12$NhIMIVI5wNYc97crXmW9rupNsEbeea1BxPu.H0gSDkiDQrhhmXeZO','ADMIN'),(66,'Peponez','pepe@email.net','Pepe','$2a$12$Dij9cgV3mXDQYtOo4nvQTOLaUz3URoe7DGjhBrqGa1fEEzkNVhBgq','USER'),(67,'Lete','javier@email.net','Javier','$2a$12$mof.u/4EIo58hR7On9DnPevyqBC7kb9FHzT.LN/BjF8xOqQVTP1NO','ADMIN'),(68,'Arretxea','koldo@email.net','Koldo','$2a$12$NhIMIVI5wNYc97crXmW9rupNsEbeea1BxPu.H0gSDkiDQrhhmXeZO','ADMIN'),(69,'Peponez','pepe@email.net','Pepe','$2a$12$Dij9cgV3mXDQYtOo4nvQTOLaUz3URoe7DGjhBrqGa1fEEzkNVhBgq','USER'),(70,'Lete','javier@email.net','Javier','$2a$12$mof.u/4EIo58hR7On9DnPevyqBC7kb9FHzT.LN/BjF8xOqQVTP1NO','ADMIN'),(71,'Arretxea','koldo@email.net','Koldo','$2a$12$NhIMIVI5wNYc97crXmW9rupNsEbeea1BxPu.H0gSDkiDQrhhmXeZO','ADMIN'),(72,'Peponez','pepe@email.net','Pepe','$2a$12$Dij9cgV3mXDQYtOo4nvQTOLaUz3URoe7DGjhBrqGa1fEEzkNVhBgq','USER'),(73,'Lete','javier@email.net','Javier','$2a$12$mof.u/4EIo58hR7On9DnPevyqBC7kb9FHzT.LN/BjF8xOqQVTP1NO','ADMIN'),(74,'Arretxea','koldo@email.net','Koldo','$2a$12$NhIMIVI5wNYc97crXmW9rupNsEbeea1BxPu.H0gSDkiDQrhhmXeZO','ADMIN'),(75,'Peponez','pepe@email.net','Pepe','$2a$12$Dij9cgV3mXDQYtOo4nvQTOLaUz3URoe7DGjhBrqGa1fEEzkNVhBgq','USER');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'inmobiliaria'
--

--
-- Dumping routines for database 'inmobiliaria'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-15 11:49:23
