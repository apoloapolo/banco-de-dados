CREATE DATABASE  IF NOT EXISTS `helpdesk` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `helpdesk`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: helpdesk
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `acompanhamento`
--

DROP TABLE IF EXISTS `acompanhamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acompanhamento` (
  `comentario` text NOT NULL,
  `id_chamado` int NOT NULL,
  `cpf_usuario` char(11) NOT NULL,
  PRIMARY KEY (`cpf_usuario`,`id_chamado`),
  KEY `id_chamado` (`id_chamado`),
  CONSTRAINT `acompanhamento_ibfk_1` FOREIGN KEY (`id_chamado`) REFERENCES `chamado` (`id_chamado`),
  CONSTRAINT `acompanhamento_ibfk_2` FOREIGN KEY (`cpf_usuario`) REFERENCES `usuario` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acompanhamento`
--

LOCK TABLES `acompanhamento` WRITE;
/*!40000 ALTER TABLE `acompanhamento` DISABLE KEYS */;
INSERT INTO `acompanhamento` VALUES ('Deu certo',1,'11122211111'),('Meu pc explodiu',2,'22222211111'),('Atendimento agendado',5,'33333333311'),('Roubou meu pc',3,'44422211111'),('Muito bom o atendimento',4,'55555555511');
/*!40000 ALTER TABLE `acompanhamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chamado`
--

DROP TABLE IF EXISTS `chamado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chamado` (
  `id_chamado` int NOT NULL AUTO_INCREMENT,
  `cpf_func` char(11) NOT NULL,
  `hora_abertura` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `stts` set('Novo','Pendente','Processando','Concluído') DEFAULT 'Novo',
  `descricao` text,
  `tempo_solucao` time NOT NULL DEFAULT '00:00:00',
  `categoria` set('Senha','Email','Internet','Computador','Liberação de Horário','Instalar programa','Novo usuário','Suporte') DEFAULT (_utf8mb4'Suporte'),
  PRIMARY KEY (`id_chamado`),
  KEY `cpf_func` (`cpf_func`),
  CONSTRAINT `chamado_ibfk_1` FOREIGN KEY (`cpf_func`) REFERENCES `funcionario` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chamado`
--

LOCK TABLES `chamado` WRITE;
/*!40000 ALTER TABLE `chamado` DISABLE KEYS */;
INSERT INTO `chamado` VALUES (1,'11122211111','2022-10-01 00:54:53','Novo','Favor reiniciar minha senha pois esqueci','01:00:00','Senha'),(2,'22222211111','2022-10-01 00:54:53','Novo','Minha internet está lenta','01:00:00','Internet'),(3,'33322211111','2022-10-01 00:54:53','Concluído','Irei fazer hora extra, favor liberar meu acesso até às 8 horas da noite','04:00:00','Liberação de Horário'),(4,'44422211111','2022-10-01 00:54:53','Pendente','O monitor do meu computador está apagando','08:00:00','Computador'),(5,'11122211111','2022-10-01 00:54:53','Novo','Preciso do programa para ver PDFs','24:00:00','Instalar programa');
/*!40000 ALTER TABLE `chamado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa` (
  `cnpj` char(14) NOT NULL,
  `endereco` text,
  `nome_empresa` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES ('08371598000137','Av. Gov. Agamenon Magalhães - Santo Amaro, Recife - PE','Apolo academia'),('29528114000190','Av. Prof. Moraes Rego, 1235 - Cidade Universitária, Recife - PE','Rona infotec'),('46340917000136','Rua Dom Manuel de Medeiros, s/n - Dois Irmãos, Recife - PE','Ganso vidros');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `cpf` char(11) NOT NULL,
  `cnpj` char(14) DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  KEY `cnpj` (`cnpj`),
  CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `usuario` (`cpf`),
  CONSTRAINT `funcionario_ibfk_2` FOREIGN KEY (`cnpj`) REFERENCES `empresa` (`cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES ('33322211111','08371598000137'),('44422211111','29528114000190'),('55522211111','29528114000190'),('11122211111','46340917000136'),('22222211111','46340917000136');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnico`
--

DROP TABLE IF EXISTS `tecnico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tecnico` (
  `cpf` char(11) NOT NULL,
  `grupo_tecnico` set('Sem Grupo','Elétrica','Logística','Mecânica','Hidraulica','T.I') DEFAULT (_utf8mb4'Sem Grupo'),
  PRIMARY KEY (`cpf`),
  CONSTRAINT `tecnico_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `usuario` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnico`
--

LOCK TABLES `tecnico` WRITE;
/*!40000 ALTER TABLE `tecnico` DISABLE KEYS */;
INSERT INTO `tecnico` VALUES ('11111111111','Logística'),('22222222211','Elétrica'),('33333333311','T.I'),('44422211111','Sem Grupo'),('44444444411','Mecânica');
/*!40000 ALTER TABLE `tecnico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnico_chamado`
--

DROP TABLE IF EXISTS `tecnico_chamado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tecnico_chamado` (
  `cpf` char(11) NOT NULL,
  `id_chamado` int NOT NULL,
  PRIMARY KEY (`cpf`,`id_chamado`),
  KEY `id_chamado` (`id_chamado`),
  CONSTRAINT `tecnico_chamado_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `tecnico` (`cpf`),
  CONSTRAINT `tecnico_chamado_ibfk_2` FOREIGN KEY (`id_chamado`) REFERENCES `chamado` (`id_chamado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnico_chamado`
--

LOCK TABLES `tecnico_chamado` WRITE;
/*!40000 ALTER TABLE `tecnico_chamado` DISABLE KEYS */;
INSERT INTO `tecnico_chamado` VALUES ('22222222211',1),('33333333311',2),('44444444411',3),('44422211111',4);
/*!40000 ALTER TABLE `tecnico_chamado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `cpf` char(11) NOT NULL,
  `nome` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('11111111111','Ronaldo Rodrigues'),('11122211111','Rodolfo Rodrigues'),('22222211111','Romario Rodrigues'),('22222222211','Apolo da luz'),('33322211111','Rogerio Rodrigues'),('33333333311','Vicente dos Compiuter'),('44422211111','Rodick Rodrigues'),('44444444411','Gabriel Mecânico'),('55522211111','Mario'),('55555555511','Marissol da lógica');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-01  1:25:53
