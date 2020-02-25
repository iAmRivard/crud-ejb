CREATE DATABASE  IF NOT EXISTS `prueba_bancaria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `prueba_bancaria`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: prueba_bancaria
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cliente` (
  `cod_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `dui` varchar(45) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  PRIMARY KEY (`cod_cliente`),
  UNIQUE KEY `dui_UNIQUE` (`dui`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Samuel','Gonzalez','02030619-9','2019-01-01'),(2,'Emanuel','Zelaya','78945612-3','2019-03-21'),(4,'Oscar','Suares','748945612-3','2019-03-21'),(5,'Emanuel','Rodríguez','4561378-9','2019-03-21'),(6,'Jose','Zelaya','45612398-7','2019-03-21'),(7,'Jose','Martinez','15947863-2','2019-03-21'),(8,'er','wert','65464565465','2019-03-21'),(9,'Oscar','Suares2','45612378-9','2019-03-21'),(10,'Manuel','De Jesus','78912345-6','2019-03-21'),(11,'Manuel','De Jesus2','565615','2019-03-21'),(12,'Guille','Nose','78945618-3','2019-03-21'),(13,'Guille2','De Jesus2','78912645-2','2019-03-21'),(14,'Manuel2','De Jesus','78912345-2','2019-03-21'),(15,'Robert','Karl','456197124','2019-03-21'),(16,'Prueba de ingreso','Hola','7894344941-4','2019-03-23'),(20,'df','dfd','45612378-7','2019-03-23'),(21,'Brayan','Show','15978632-4','2019-03-23'),(22,'Brayan2','Show2','15978632-3','2019-03-23'),(23,'Brayan3','Show2','15978632-6','2019-03-23'),(24,'fdg','fdgfd','fdg','2019-03-23'),(25,'dfd','Show2','15947663-2','2019-03-23'),(26,'Brayan3','dfd','789434941-4','2019-03-23'),(27,'fgss','fds','fds','2019-03-23'),(28,'Brayan3','Show2','789434641-4','2019-03-23'),(29,'Brayan3','Hola','15947863-3','2019-03-23'),(30,'Prueba de in','Show2','789434941-3','2019-03-23'),(31,'dfd','Show2','78943464566','2019-03-23'),(32,'dfd','Show2','15978632-8','2019-03-23'),(33,'dfd','Show2','15978632-7','2019-03-23'),(34,'dfd','Show','1597863','2019-03-23'),(35,'Yo','Tu','02030619-5','2019-03-26');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cuenta` (
  `numero_cuenta` varchar(10) NOT NULL,
  `nombre_cuenta` varchar(50) NOT NULL,
  `monto_apertura` decimal(10,2) DEFAULT NULL,
  `fecha_apertura` date DEFAULT NULL,
  `saldo` decimal(10,2) DEFAULT NULL,
  `cod_cliente` int(11) NOT NULL,
  `estado_cuenta` char(1) DEFAULT NULL,
  PRIMARY KEY (`numero_cuenta`),
  KEY `cuentas_clientes_FK` (`cod_cliente`),
  CONSTRAINT `fk_cliente` FOREIGN KEY (`cod_cliente`) REFERENCES `cliente` (`cod_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
INSERT INTO `cuenta` VALUES ('CUENTA-001','Ahorro',300.00,'2019-03-15',300.00,2,'A'),('CUENTA-002','Ahorrito1',500.00,'2019-03-23',700.00,1,'A'),('CUENTA-003','Ahorrito2',200.00,'2019-03-23',200.00,13,'A'),('CUENTA-004','Ahorrito3',200.00,'2019-03-23',200.00,16,'A'),('CUENTA-005','Ahorrito5',500.00,'2019-03-23',500.00,16,'A'),('CUENTA-006','Ahorrito2',700.00,'2019-03-23',700.00,1,'A'),('CUENTA-007','Ahorrito',700.00,'2019-03-23',700.00,9,'A'),('CUENTA-008','Ahorro',800.00,'2019-03-25',700.00,1,'A'),('CUENTA-010','Ahorrito',800.00,'2019-03-26',800.00,35,'A');
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_transaccion`
--

DROP TABLE IF EXISTS `tipos_transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tipos_transaccion` (
  `id_tipo_transaccion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_transaccion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_transaccion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_transaccion`
--

LOCK TABLES `tipos_transaccion` WRITE;
/*!40000 ALTER TABLE `tipos_transaccion` DISABLE KEYS */;
INSERT INTO `tipos_transaccion` VALUES (1,'Abono'),(2,'Retiro');
/*!40000 ALTER TABLE `tipos_transaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaccion`
--

DROP TABLE IF EXISTS `transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `transaccion` (
  `id_transaccion` int(11) NOT NULL AUTO_INCREMENT,
  `valor_monetario` decimal(10,2) DEFAULT NULL,
  `fecha_transaccion` date DEFAULT NULL,
  `id_tipo_transaccion` int(11) DEFAULT NULL,
  `numero_cuenta` varchar(10) NOT NULL,
  PRIMARY KEY (`id_transaccion`),
  KEY `transacciones_tipos_transacciones_FK` (`id_tipo_transaccion`),
  KEY `fk_cuenta_idx` (`numero_cuenta`),
  CONSTRAINT `fk_cuenta` FOREIGN KEY (`numero_cuenta`) REFERENCES `cuenta` (`numero_cuenta`),
  CONSTRAINT `transacciones_tipos_transacciones_FK` FOREIGN KEY (`id_tipo_transaccion`) REFERENCES `tipos_transaccion` (`id_tipo_transaccion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion`
--

LOCK TABLES `transaccion` WRITE;
/*!40000 ALTER TABLE `transaccion` DISABLE KEYS */;
INSERT INTO `transaccion` VALUES (1,100.00,'2019-03-18',1,'CUENTA-001'),(2,100.00,'2019-03-23',1,'CUENTA-002'),(3,100.00,'2019-03-23',1,'CUENTA-002'),(4,500.00,'2019-03-23',2,'CUENTA-001'),(5,500.00,'2019-03-25',1,'CUENTA-001'),(6,100.00,'2019-03-25',2,'CUENTA-001'),(7,200.00,'2019-03-25',2,'CUENTA-008'),(8,100.00,'2019-03-26',1,'CUENTA-008'),(9,200.00,'2019-03-26',2,'CUENTA-010'),(10,200.00,'2019-03-26',1,'CUENTA-010');
/*!40000 ALTER TABLE `transaccion` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_transaccion` AFTER INSERT ON `transaccion` FOR EACH ROW BEGIN
    IF (NEW.id_tipo_transaccion = 1) THEN
		UPDATE cuenta SET cuenta.saldo = (cuenta.saldo + NEW.valor_monetario) WHERE (cuenta.numero_cuenta = NEW.numero_cuenta);
    ELSE
		UPDATE cuenta SET cuenta.saldo = (cuenta.saldo - NEW.valor_monetario) WHERE (cuenta.numero_cuenta = NEW.numero_cuenta);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'prueba_bancaria'
--

--
-- Dumping routines for database 'prueba_bancaria'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-26 13:51:42
