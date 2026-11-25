-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: loja_tech
-- ------------------------------------------------------
-- Server version	9.7.1

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '3e45457a-8600-11f1-ae75-d0c1b57f6211:1-1334';

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` text,
  `ativo` tinyint(1) DEFAULT '1',
  `criado_em` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Notebooks','Notebooks e laptops',1,'2026-11-25 08:13:25'),(2,'Smartphones','Celulares e smartphones',1,'2026-11-25 08:13:25'),(3,'Periféricos','Teclados, mouses, headsets',1,'2026-11-25 08:13:25'),(4,'Monitores','Monitores e telas',1,'2026-11-25 08:13:25'),(5,'Armazenamento','HDs, SSDs e pen drives',1,'2026-11-25 08:13:25'),(6,'acessórios','cabos, adaptadores e capas',1,'2026-11-25 08:18:25');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `email` varchar(200) NOT NULL,
  `cpf` char(11) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  `criado_em` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Ana Silva','ana.silva@email.com','12345678901','11999998888','1995-03-15',1,'2026-11-25 08:13:25'),(2,'Bruno Oliveira','bruno.oliveira@email.com','23456789012','11976543210','1990-07-22',1,'2026-11-25 08:13:25'),(3,'Carla Santos','carla.santos@email.com','34567890123','21965432109','1988-11-08',1,'2026-11-25 08:13:25'),(4,'Daniel Costa','daniel.costa@email.com','45678901234','31954321098','2000-01-30',1,'2026-11-25 08:13:25'),(5,'Elena Ferreira','elena.ferreira@email.com','56789012345','41943210987','1998-06-12',1,'2026-11-25 08:13:25');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_pedido`
--

DROP TABLE IF EXISTS `itens_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens_pedido` (
  `id_item` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `id_produto` int NOT NULL,
  `quantidade` int NOT NULL DEFAULT '1',
  `preco_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) GENERATED ALWAYS AS ((`quantidade` * `preco_unitario`)) STORED,
  PRIMARY KEY (`id_item`),
  KEY `fk_item_pedido` (`id_pedido`),
  KEY `fk_item_produto` (`id_produto`),
  CONSTRAINT `fk_item_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  CONSTRAINT `fk_item_produto` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_pedido`
--

LOCK TABLES `itens_pedido` WRITE;
/*!40000 ALTER TABLE `itens_pedido` DISABLE KEYS */;
INSERT INTO `itens_pedido` (`id_item`, `id_pedido`, `id_produto`, `quantidade`, `preco_unitario`) VALUES (1,1,1,1,3499.90),(2,1,5,1,249.90),(3,2,3,1,4299.00),(4,3,6,1,349.90),(5,3,5,3,249.90),(6,4,4,1,6499.00),(7,5,5,1,249.90);
/*!40000 ALTER TABLE `itens_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_operacoes`
--

DROP TABLE IF EXISTS `log_operacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_operacoes` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `tabela_afetada` varchar(100) DEFAULT NULL,
  `operacao` varchar(50) DEFAULT NULL,
  `descricao` text,
  `usuario` varchar(100) DEFAULT (current_user()),
  `data_operacao` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_operacoes`
--

LOCK TABLES `log_operacoes` WRITE;
/*!40000 ALTER TABLE `log_operacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_operacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `data_pedido` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('pendente','processando','enviado','entregue','cancelado') DEFAULT 'pendente',
  `valor_total` decimal(10,2) DEFAULT '0.00',
  `observacao` text,
  `criado_em` datetime DEFAULT CURRENT_TIMESTAMP,
  `atualizado_em` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_pedido_cliente` (`id_cliente`),
  CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,'2026-11-25 08:13:25','entregue',3749.80,NULL,'2026-11-25 08:13:25','2026-11-25 08:13:25'),(2,2,'2026-11-25 08:13:25','enviado',4299.00,NULL,'2026-11-25 08:13:25','2026-11-25 08:13:25'),(3,3,'2026-11-25 08:13:25','pendente',1099.70,NULL,'2026-11-25 08:13:25','2026-11-25 08:13:25'),(4,1,'2026-11-25 08:13:25','processando',6499.00,NULL,'2026-11-25 08:13:25','2026-11-25 08:13:25'),(5,4,'2026-11-25 08:13:25','cancelado',249.90,NULL,'2026-11-25 08:13:25','2026-11-25 08:13:25');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `id_categoria` int NOT NULL,
  `nome` varchar(200) NOT NULL,
  `descricao` text,
  `preco` decimal(10,2) NOT NULL,
  `estoque` int NOT NULL DEFAULT '0',
  `estoque_minimo` int NOT NULL DEFAULT '5',
  `ativo` tinyint(1) DEFAULT '1',
  `criado_em` datetime DEFAULT CURRENT_TIMESTAMP,
  `atualizado_em` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_produto`),
  KEY `fk_produto_categoria` (`id_categoria`),
  CONSTRAINT `fk_produto_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,1,'Notebook Dell Inspiron 15',NULL,3499.90,25,5,1,'2026-11-25 08:13:25','2026-11-25 08:13:25'),(2,1,'Notebook Lenovo IdeaPad 3',NULL,2899.00,18,5,1,'2026-11-25 08:13:25','2026-11-25 08:13:25'),(3,2,'Samsung Galaxy S24',NULL,4299.00,40,10,1,'2026-11-25 08:13:25','2026-11-25 08:13:25'),(4,2,'iPhone 15',NULL,6499.00,15,5,1,'2026-11-25 08:13:25','2026-11-25 08:13:25'),(5,3,'Teclado Mecânico Redragon',NULL,249.90,60,10,1,'2026-11-25 08:13:25','2026-11-25 08:13:25'),(6,3,'Mouse Logitech G502',NULL,349.90,45,10,1,'2026-11-25 08:13:25','2026-11-25 08:13:25'),(7,3,'Headset HyperX Cloud II',NULL,499.90,30,8,1,'2026-11-25 08:13:25','2026-11-25 08:13:25'),(8,4,'Monitor LG UltraWide 29\"',NULL,1599.00,12,3,1,'2026-11-25 08:13:25','2026-11-25 08:13:25'),(9,4,'Monitor Samsung Curvo 27\"',NULL,1899.00,10,3,1,'2026-11-25 08:13:25','2026-11-25 08:13:25'),(10,5,'SSD Kingston 480GB',NULL,219.90,80,15,1,'2026-11-25 08:13:25','2026-11-25 08:13:25'),(11,5,'HD Externo Seagate 1TB',NULL,329.90,35,8,1,'2026-11-25 08:13:25','2026-11-25 08:13:25');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-25  8:22:44
