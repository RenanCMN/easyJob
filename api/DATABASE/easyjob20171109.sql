-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: easyjobapi
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.21-MariaDB

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
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `CODITEM` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(45) NOT NULL,
  `DESCRICAO` text,
  `ACESSO` varchar(100) NOT NULL,
  PRIMARY KEY (`CODITEM`),
  UNIQUE KEY `ACESSO_UNIQUE` (`ACESSO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil` (
  `CODPERFIL` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(45) NOT NULL,
  `DESCRICAO` text,
  PRIMARY KEY (`CODPERFIL`),
  UNIQUE KEY `PERFILcol_UNIQUE` (`NOME`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES (1,'Candidato','Este perfil contém as permissões(acesso à menus) dos usuário do tipo candidato.'),(2,'Empresa','Este perfil contém as permissões(acesso à menus) dos usuário do tipo empresa.');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissoes`
--

DROP TABLE IF EXISTS `permissoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissoes` (
  `CODPERFIL` int(11) NOT NULL,
  `CODITEM` int(11) NOT NULL,
  PRIMARY KEY (`CODPERFIL`,`CODITEM`),
  KEY `PERMISSOES_ITEM_idx` (`CODITEM`),
  CONSTRAINT `PERMISSOES_ITEM` FOREIGN KEY (`CODITEM`) REFERENCES `item` (`CODITEM`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PERMISSOES_PERFIL` FOREIGN KEY (`CODPERFIL`) REFERENCES `perfil` (`CODPERFIL`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissoes`
--

LOCK TABLES `permissoes` WRITE;
/*!40000 ALTER TABLE `permissoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa` (
  `CODPESSOA` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(80) NOT NULL,
  `EMAIL` varchar(45) NOT NULL,
  `USUARIO` varchar(45) NOT NULL,
  `SENHA` text NOT NULL,
  `TIPOUSUARIO` smallint(1) NOT NULL,
  PRIMARY KEY (`CODPESSOA`),
  UNIQUE KEY `USUARIO_UNIQUE` (`USUARIO`),
  UNIQUE KEY `EMAIL_UNIQUE` (`EMAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'Max Rogério','max10rogerio@hotmail.com','max.rogerio','ae86200ba1545d3244fde3aaacba2cfc',0),(2,'max','maxrogerionogueira@outlook.com','maxrogerio','2ffe4e77325d9a7152f7086ea7aa5114',0),(3,'leonardo','leonardo@leonardo','leonardo.leonardo','020e60c6a84db8c5d4c2d56a4e4fe082',0),(4,'TS','teste@teste.com','TESTE','f3aa334b5e1c189cbab4393627825cd2',0),(5,'leonardo beraldo','leonardo.beraldo@email.com','leonardo.beraldo','e10adc3949ba59abbe56e057f20f883e',0),(6,'max','max@123','max123','a1b4e6a41314c96e0afe6bd9a67a9863',1),(30,'perfil','test3@te','teste3','e10adc3949ba59abbe56e057f20f883e',2);
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa_perfil`
--

DROP TABLE IF EXISTS `pessoa_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa_perfil` (
  `CODPESSOA` int(11) NOT NULL,
  `CODPERFIL` int(11) NOT NULL,
  PRIMARY KEY (`CODPESSOA`,`CODPERFIL`),
  KEY `PESSOAPERFIL_PERFIL_idx` (`CODPERFIL`),
  CONSTRAINT `PESSOAPERFIL_PERFIL` FOREIGN KEY (`CODPERFIL`) REFERENCES `perfil` (`CODPERFIL`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PESSOAPERFIL_PESSOA` FOREIGN KEY (`CODPESSOA`) REFERENCES `pessoa` (`CODPESSOA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_perfil`
--

LOCK TABLES `pessoa_perfil` WRITE;
/*!40000 ALTER TABLE `pessoa_perfil` DISABLE KEYS */;
INSERT INTO `pessoa_perfil` VALUES (6,2),(30,2);
/*!40000 ALTER TABLE `pessoa_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teste`
--

DROP TABLE IF EXISTS `teste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teste` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teste`
--

LOCK TABLES `teste` WRITE;
/*!40000 ALTER TABLE `teste` DISABLE KEYS */;
INSERT INTO `teste` VALUES (1,'MAX123'),(2,'MAX123'),(3,'MAX123'),(4,'MAX123'),(5,'MAX123'),(6,'MAX123'),(7,'MAX123'),(8,'MAX123'),(9,'MAX123'),(10,'MAX123'),(11,'MAX123'),(12,'MAX123'),(13,'MAX123'),(14,'MAX123'),(15,'MAX123'),(16,'MAX123'),(17,'MAX123'),(18,'MAX123'),(19,'MAX123'),(20,'MAX123'),(21,'MAX123'),(22,'MAX123'),(23,'MAX123'),(24,'MAX123'),(25,'MAX123'),(26,'MAX123'),(27,'MAX123'),(28,'MAX123'),(29,'MAX123');
/*!40000 ALTER TABLE `teste` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-09 23:26:50
