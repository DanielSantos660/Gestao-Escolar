-- MySQL dump 10.13  Distrib 8.4.3, for Win64 (x86_64)
--
-- Host: localhost    Database: gestao_escolar
-- ------------------------------------------------------
-- Server version	8.4.3

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
-- Table structure for table `tbaluno`
--

DROP TABLE IF EXISTS `tbaluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbaluno` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Sobrenome` varchar(100) NOT NULL,
  `NomeCompleto` varchar(201) GENERATED ALWAYS AS (concat(`Nome`,_utf8mb4' ',`Sobrenome`)) STORED,
  `CPF` char(11) NOT NULL,
  `dtNasc` date NOT NULL,
  `dtMatricula` date NOT NULL,
  `Senha` varchar(255) NOT NULL,
  `Status` varchar(30) NOT NULL,
  `Turma_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CPF` (`CPF`),
  KEY `Turma_id` (`Turma_id`),
  CONSTRAINT `tbaluno_ibfk_1` FOREIGN KEY (`Turma_id`) REFERENCES `tbturma` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbaluno`
--

LOCK TABLES `tbaluno` WRITE;
/*!40000 ALTER TABLE `tbaluno` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbaluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbcontaluno`
--

DROP TABLE IF EXISTS `tbcontaluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbcontaluno` (
  `Aluno_id` int NOT NULL,
  `Contato` varchar(20) NOT NULL,
  PRIMARY KEY (`Aluno_id`,`Contato`),
  CONSTRAINT `tbcontaluno_ibfk_1` FOREIGN KEY (`Aluno_id`) REFERENCES `tbaluno` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbcontaluno`
--

LOCK TABLES `tbcontaluno` WRITE;
/*!40000 ALTER TABLE `tbcontaluno` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbcontaluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbcontprofessor`
--

DROP TABLE IF EXISTS `tbcontprofessor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbcontprofessor` (
  `Professor_id` int NOT NULL,
  `Contato` varchar(20) NOT NULL,
  PRIMARY KEY (`Professor_id`,`Contato`),
  CONSTRAINT `tbcontprofessor_ibfk_1` FOREIGN KEY (`Professor_id`) REFERENCES `tbprofessor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbcontprofessor`
--

LOCK TABLES `tbcontprofessor` WRITE;
/*!40000 ALTER TABLE `tbcontprofessor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbcontprofessor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbcronograma`
--

DROP TABLE IF EXISTS `tbcronograma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbcronograma` (
  `id` int NOT NULL AUTO_INCREMENT,
  `HorarioInicio` time NOT NULL,
  `HorarioFinal` time NOT NULL,
  `Dia` varchar(20) NOT NULL,
  `Professor_id` int NOT NULL,
  `Disciplina_id` int NOT NULL,
  `Turma_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Professor_id` (`Professor_id`),
  KEY `Disciplina_id` (`Disciplina_id`),
  KEY `Turma_id` (`Turma_id`),
  CONSTRAINT `tbcronograma_ibfk_1` FOREIGN KEY (`Professor_id`) REFERENCES `tbprofessor` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `tbcronograma_ibfk_2` FOREIGN KEY (`Disciplina_id`) REFERENCES `tbdisciplina` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `tbcronograma_ibfk_3` FOREIGN KEY (`Turma_id`) REFERENCES `tbturma` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbcronograma`
--

LOCK TABLES `tbcronograma` WRITE;
/*!40000 ALTER TABLE `tbcronograma` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbcronograma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbdisciplina`
--

DROP TABLE IF EXISTS `tbdisciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbdisciplina` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Nome` (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbdisciplina`
--

LOCK TABLES `tbdisciplina` WRITE;
/*!40000 ALTER TABLE `tbdisciplina` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbdisciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbemailaluno`
--

DROP TABLE IF EXISTS `tbemailaluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbemailaluno` (
  `Aluno_id` int NOT NULL,
  `Email` varchar(255) NOT NULL,
  PRIMARY KEY (`Aluno_id`,`Email`),
  CONSTRAINT `tbemailaluno_ibfk_1` FOREIGN KEY (`Aluno_id`) REFERENCES `tbaluno` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbemailaluno`
--

LOCK TABLES `tbemailaluno` WRITE;
/*!40000 ALTER TABLE `tbemailaluno` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbemailaluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbemailprofessor`
--

DROP TABLE IF EXISTS `tbemailprofessor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbemailprofessor` (
  `Professor_id` int NOT NULL,
  `Email` varchar(255) NOT NULL,
  PRIMARY KEY (`Professor_id`,`Email`),
  CONSTRAINT `tbemailprofessor_ibfk_1` FOREIGN KEY (`Professor_id`) REFERENCES `tbprofessor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbemailprofessor`
--

LOCK TABLES `tbemailprofessor` WRITE;
/*!40000 ALTER TABLE `tbemailprofessor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbemailprofessor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbenderecoaluno`
--

DROP TABLE IF EXISTS `tbenderecoaluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbenderecoaluno` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Aluno_id` int NOT NULL,
  `CEP` char(8) NOT NULL,
  `Cidade` varchar(100) NOT NULL,
  `Bairro` varchar(255) NOT NULL,
  `Logradouro` varchar(255) NOT NULL,
  `Numero` varchar(10) DEFAULT NULL,
  `Complemento` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Aluno_id` (`Aluno_id`),
  CONSTRAINT `tbenderecoaluno_ibfk_1` FOREIGN KEY (`Aluno_id`) REFERENCES `tbaluno` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbenderecoaluno`
--

LOCK TABLES `tbenderecoaluno` WRITE;
/*!40000 ALTER TABLE `tbenderecoaluno` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbenderecoaluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbenderecoprofessor`
--

DROP TABLE IF EXISTS `tbenderecoprofessor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbenderecoprofessor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Professor_id` int NOT NULL,
  `CEP` char(8) NOT NULL,
  `Cidade` varchar(100) NOT NULL,
  `Bairro` varchar(255) NOT NULL,
  `Logradouro` varchar(255) NOT NULL,
  `Numero` varchar(10) DEFAULT NULL,
  `Complemento` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Professor_id` (`Professor_id`),
  CONSTRAINT `tbenderecoprofessor_ibfk_1` FOREIGN KEY (`Professor_id`) REFERENCES `tbprofessor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbenderecoprofessor`
--

LOCK TABLES `tbenderecoprofessor` WRITE;
/*!40000 ALTER TABLE `tbenderecoprofessor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbenderecoprofessor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbfaltas`
--

DROP TABLE IF EXISTS `tbfaltas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbfaltas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Status` varchar(30) NOT NULL,
  `Aluno_id` int NOT NULL,
  `Cronograma_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Aluno_id` (`Aluno_id`,`Cronograma_id`),
  KEY `Cronograma_id` (`Cronograma_id`),
  CONSTRAINT `tbfaltas_ibfk_1` FOREIGN KEY (`Aluno_id`) REFERENCES `tbaluno` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbfaltas_ibfk_2` FOREIGN KEY (`Cronograma_id`) REFERENCES `tbcronograma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbfaltas`
--

LOCK TABLES `tbfaltas` WRITE;
/*!40000 ALTER TABLE `tbfaltas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbfaltas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbnotas`
--

DROP TABLE IF EXISTS `tbnotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbnotas` (
  `Nota` decimal(5,2) NOT NULL,
  `Descricao` varchar(255) DEFAULT NULL,
  `dtAtribuição` date NOT NULL,
  `dtNota` date DEFAULT NULL,
  `Modificada` tinyint(1) NOT NULL DEFAULT '0',
  `Aluno_id` int NOT NULL,
  `Professor_id` int NOT NULL,
  `Disciplina_id` int NOT NULL,
  KEY `Aluno_id` (`Aluno_id`),
  KEY `Professor_id` (`Professor_id`),
  KEY `Disciplina_id` (`Disciplina_id`),
  CONSTRAINT `tbnotas_ibfk_1` FOREIGN KEY (`Aluno_id`) REFERENCES `tbaluno` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbnotas_ibfk_2` FOREIGN KEY (`Professor_id`) REFERENCES `tbprofessor` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `tbnotas_ibfk_3` FOREIGN KEY (`Disciplina_id`) REFERENCES `tbdisciplina` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbnotas`
--

LOCK TABLES `tbnotas` WRITE;
/*!40000 ALTER TABLE `tbnotas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbnotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbpdt`
--

DROP TABLE IF EXISTS `tbpdt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbpdt` (
  `Professor_id` int NOT NULL,
  `Disciplina_id` int NOT NULL,
  `Turma_id` int NOT NULL,
  PRIMARY KEY (`Professor_id`,`Disciplina_id`,`Turma_id`),
  KEY `Disciplina_id` (`Disciplina_id`),
  KEY `Turma_id` (`Turma_id`),
  CONSTRAINT `tbpdt_ibfk_1` FOREIGN KEY (`Professor_id`) REFERENCES `tbprofessor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbpdt_ibfk_2` FOREIGN KEY (`Disciplina_id`) REFERENCES `tbdisciplina` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbpdt_ibfk_3` FOREIGN KEY (`Turma_id`) REFERENCES `tbturma` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbpdt`
--

LOCK TABLES `tbpdt` WRITE;
/*!40000 ALTER TABLE `tbpdt` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbpdt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbprofessor`
--

DROP TABLE IF EXISTS `tbprofessor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbprofessor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Sobrenome` varchar(100) NOT NULL,
  `NomeCompleto` varchar(200) GENERATED ALWAYS AS (concat(`Nome`,_utf8mb4' ',`Sobrenome`)) STORED,
  `CPF` char(11) NOT NULL,
  `dtNasc` date NOT NULL,
  `dtMatricula` date NOT NULL,
  `Senha` varchar(255) NOT NULL,
  `Status` varchar(30) NOT NULL,
  `Coordenador` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `CPF` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbprofessor`
--

LOCK TABLES `tbprofessor` WRITE;
/*!40000 ALTER TABLE `tbprofessor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbprofessor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbresponsavel`
--

DROP TABLE IF EXISTS `tbresponsavel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbresponsavel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Aluno_id` int NOT NULL,
  `Nome` varchar(255) NOT NULL,
  `Contato` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Aluno_id` (`Aluno_id`),
  CONSTRAINT `tbresponsavel_ibfk_1` FOREIGN KEY (`Aluno_id`) REFERENCES `tbaluno` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbresponsavel`
--

LOCK TABLES `tbresponsavel` WRITE;
/*!40000 ALTER TABLE `tbresponsavel` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbresponsavel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbturma`
--

DROP TABLE IF EXISTS `tbturma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbturma` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Periodo` varchar(30) NOT NULL,
  `Sala` varchar(30) NOT NULL,
  `Ano` year NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbturma`
--

LOCK TABLES `tbturma` WRITE;
/*!40000 ALTER TABLE `tbturma` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbturma` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-13 12:41:07
