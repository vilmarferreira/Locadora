-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: locadora
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidade` (
  `idCidade` int(11) NOT NULL AUTO_INCREMENT,
  `nomeCidade` varchar(45) DEFAULT NULL,
  `Estado_idEstado` int(11) NOT NULL,
  PRIMARY KEY (`idCidade`),
  KEY `fk_Cidade_Estado1_idx` (`Estado_idEstado`),
  CONSTRAINT `fk_Cidade_Estado1` FOREIGN KEY (`Estado_idEstado`) REFERENCES `estado` (`idEstado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (0,'Palmas',27),(1,'São Paulo',26),(2,'palmas',27),(3,'Palmas',27),(4,'SP',26),(10,'teste',27);
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `Status` tinyint(1) DEFAULT NULL,
  `Pessoa_idPessoa` int(11) NOT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `fk_Cliente_Pessoa1_idx` (`Pessoa_idPessoa`),
  CONSTRAINT `fk_Cliente_Pessoa1` FOREIGN KEY (`Pessoa_idPessoa`) REFERENCES `pessoa` (`idPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contato`
--

DROP TABLE IF EXISTS `contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contato` (
  `idContato` int(11) NOT NULL AUTO_INCREMENT,
  `DDD` char(2) DEFAULT NULL,
  `tel` varchar(9) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idContato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contato`
--

LOCK TABLES `contato` WRITE;
/*!40000 ALTER TABLE `contato` DISABLE KEYS */;
INSERT INTO `contato` VALUES (0,'63','99999999','teste@teste.com'),(1,'63','99999999','teste@teste.com'),(2,'63','99999999','teste@teste.com'),(3,'63','99999999','teste@teste.com'),(4,'63','35713479','ferreiragomes7792@gmail.com'),(5,'63','32190000','teste@teste.com'),(6,'63','35710202','12312@gmail.com');
/*!40000 ALTER TABLE `contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependente`
--

DROP TABLE IF EXISTS `dependente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependente` (
  `idDependente` int(11) NOT NULL AUTO_INCREMENT,
  `nomeDependente` varchar(45) DEFAULT NULL,
  `Cliente_idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idDependente`),
  KEY `fk_Dependente_Cliente1_idx` (`Cliente_idCliente`),
  CONSTRAINT `fk_Dependente_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependente`
--

LOCK TABLES `dependente` WRITE;
/*!40000 ALTER TABLE `dependente` DISABLE KEYS */;
/*!40000 ALTER TABLE `dependente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endereco` (
  `idEndereco` int(11) NOT NULL AUTO_INCREMENT,
  `logradouro` varchar(45) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `CEP` varchar(10) DEFAULT NULL,
  `Cidade_idCidade` int(11) NOT NULL,
  PRIMARY KEY (`idEndereco`),
  KEY `fk_Endereco_Cidade1_idx` (`Cidade_idCidade`),
  CONSTRAINT `fk_Endereco_Cidade1` FOREIGN KEY (`Cidade_idCidade`) REFERENCES `cidade` (`idCidade`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (0,'TESTE','s/n','7700000',0),(1,'TESTE','s/n','7700000',0),(2,'TESTE','s/n','7700000',0),(3,'TESTE','s/n','7700000',1),(4,'av brasil qnw 04','77000000','77000000',2),(5,'401 sul','77000000','77000000',3),(6,'asssas','77060768','77060768',4);
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `idEstado` int(11) NOT NULL AUTO_INCREMENT,
  `UF` char(2) DEFAULT NULL,
  `nomeEstado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'AC','Acre'),(2,'AL','Alagoas'),(3,'AM','Amazonas'),(4,'AP','Amapá'),(5,'BA','Bahia'),(6,'CE','Ceará'),(7,'DF','Distrito Federal'),(8,'ES','Espírito Santo'),(9,'GO','Goiás'),(10,'MA','Maranhão'),(11,'MG','Minas Gerais'),(12,'MS','Mato Grosso do Sul'),(13,'MT','Mato Grosso'),(14,'PA','Pará'),(15,'PB','Paraíba'),(16,'PE','Pernambuco'),(17,'PI','Piauí'),(18,'PR','Paraná'),(19,'RJ','Rio de Janeiro'),(20,'RN','Rio Grande do Norte'),(21,'RO','Rondônia'),(22,'RR','Roraima'),(23,'RS','Rio Grande do Sul'),(24,'SC','Santa Catarina'),(25,'SE','Sergipe'),(26,'SP','São Paulo'),(27,'TO','Tocantins');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filme`
--

DROP TABLE IF EXISTS `filme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filme` (
  `idFilme` int(11) NOT NULL AUTO_INCREMENT,
  `nomeFilme` varchar(45) DEFAULT NULL,
  `numeroCopia` int(11) DEFAULT NULL,
  `duracao` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idFilme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filme`
--

LOCK TABLES `filme` WRITE;
/*!40000 ALTER TABLE `filme` DISABLE KEYS */;
/*!40000 ALTER TABLE `filme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filme_has_genero`
--

DROP TABLE IF EXISTS `filme_has_genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filme_has_genero` (
  `Filme_idFilme` int(11) NOT NULL,
  `Genero_idGenero` int(11) NOT NULL,
  PRIMARY KEY (`Filme_idFilme`,`Genero_idGenero`),
  KEY `fk_Filme_has_Genero_Genero1_idx` (`Genero_idGenero`),
  KEY `fk_Filme_has_Genero_Filme_idx` (`Filme_idFilme`),
  CONSTRAINT `fk_Filme_has_Genero_Filme` FOREIGN KEY (`Filme_idFilme`) REFERENCES `filme` (`idFilme`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Filme_has_Genero_Genero1` FOREIGN KEY (`Genero_idGenero`) REFERENCES `genero` (`idGenero`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filme_has_genero`
--

LOCK TABLES `filme_has_genero` WRITE;
/*!40000 ALTER TABLE `filme_has_genero` DISABLE KEYS */;
/*!40000 ALTER TABLE `filme_has_genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genero` (
  `idGenero` int(11) NOT NULL AUTO_INCREMENT,
  `nomeGenero` varchar(50) DEFAULT NULL,
  `obs` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idGenero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locacao`
--

DROP TABLE IF EXISTS `locacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locacao` (
  `idLocacao` int(11) NOT NULL AUTO_INCREMENT,
  `dataEmprestimo` char(10) DEFAULT NULL,
  `dataPrevDevolucao` char(10) DEFAULT NULL,
  `dataDevolvido` char(10) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `tipoCliente` char(1) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `Filme_idFilme` int(11) NOT NULL,
  `Cliente_idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idLocacao`),
  KEY `fk_Locacao_Filme1_idx` (`Filme_idFilme`),
  KEY `fk_Locacao_Cliente1_idx` (`Cliente_idCliente`),
  CONSTRAINT `fk_Locacao_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Locacao_Filme1` FOREIGN KEY (`Filme_idFilme`) REFERENCES `filme` (`idFilme`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locacao`
--

LOCK TABLES `locacao` WRITE;
/*!40000 ALTER TABLE `locacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `locacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa` (
  `idPessoa` int(11) NOT NULL AUTO_INCREMENT,
  `nomePessoa` varchar(100) DEFAULT NULL,
  `dataNascimento` char(10) DEFAULT NULL,
  `CPF` varchar(11) DEFAULT NULL,
  `RG` varchar(20) DEFAULT NULL,
  `Contato_idContato` int(11) NOT NULL,
  `Endereco_idEndereco` int(11) NOT NULL,
  PRIMARY KEY (`idPessoa`),
  KEY `fk_Pessoa_Contato1_idx` (`Contato_idContato`),
  KEY `fk_Pessoa_Endereco1_idx` (`Endereco_idEndereco`),
  CONSTRAINT `fk_Pessoa_Contato1` FOREIGN KEY (`Contato_idContato`) REFERENCES `contato` (`idContato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pessoa_Endereco1` FOREIGN KEY (`Endereco_idEndereco`) REFERENCES `endereco` (`idEndereco`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vwcidade`
--

DROP TABLE IF EXISTS `vwcidade`;
/*!50001 DROP VIEW IF EXISTS `vwcidade`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vwcidade` AS SELECT 
 1 AS `idCidade`,
 1 AS `nomeCidade`,
 1 AS `nomeEstado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vwcliente`
--

DROP TABLE IF EXISTS `vwcliente`;
/*!50001 DROP VIEW IF EXISTS `vwcliente`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vwcliente` AS SELECT 
 1 AS `idCliente`,
 1 AS `Status`,
 1 AS `nomePessoa`,
 1 AS `dataNascimento`,
 1 AS `CPF`,
 1 AS `rg`,
 1 AS `logradouro`,
 1 AS `numero`,
 1 AS `nomeCidade`,
 1 AS `nomeEstado`,
 1 AS `DDD`,
 1 AS `tel`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vwendereco`
--

DROP TABLE IF EXISTS `vwendereco`;
/*!50001 DROP VIEW IF EXISTS `vwendereco`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vwendereco` AS SELECT 
 1 AS `idEndereco`,
 1 AS `logradouro`,
 1 AS `numero`,
 1 AS `CEP`,
 1 AS `nomeCidade`,
 1 AS `nomeEstado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vwfilme`
--

DROP TABLE IF EXISTS `vwfilme`;
/*!50001 DROP VIEW IF EXISTS `vwfilme`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vwfilme` AS SELECT 
 1 AS `idFilme`,
 1 AS `nomeFilme`,
 1 AS `numeroCopia`,
 1 AS `duracao`,
 1 AS `nomeGenero`,
 1 AS `obs`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vwlocacao`
--

DROP TABLE IF EXISTS `vwlocacao`;
/*!50001 DROP VIEW IF EXISTS `vwlocacao`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vwlocacao` AS SELECT 
 1 AS `idLocacao`,
 1 AS `dataEmprestimo`,
 1 AS `dataPrevDevolucao`,
 1 AS `dataDevolvido`,
 1 AS `valor`,
 1 AS `tipoCliente`,
 1 AS `nomeFilme`,
 1 AS `numeroCopia`,
 1 AS `nomePessoa`,
 1 AS `dataNascimento`,
 1 AS `CPF`,
 1 AS `rg`,
 1 AS `logradouro`,
 1 AS `numero`,
 1 AS `nomeCidade`,
 1 AS `nomeEstado`,
 1 AS `DDD`,
 1 AS `tel`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vwpessoa`
--

DROP TABLE IF EXISTS `vwpessoa`;
/*!50001 DROP VIEW IF EXISTS `vwpessoa`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vwpessoa` AS SELECT 
 1 AS `idPessoa`,
 1 AS `nomePessoa`,
 1 AS `dataNascimento`,
 1 AS `CPF`,
 1 AS `rg`,
 1 AS `logradouro`,
 1 AS `numero`,
 1 AS `CEP`,
 1 AS `nomeCidade`,
 1 AS `nomeEstado`,
 1 AS `DDD`,
 1 AS `tel`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vwcidade`
--

/*!50001 DROP VIEW IF EXISTS `vwcidade`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwcidade` AS select `cid`.`idCidade` AS `idCidade`,`cid`.`nomeCidade` AS `nomeCidade`,`es`.`nomeEstado` AS `nomeEstado` from (`cidade` `cid` join `estado` `es` on((`es`.`idEstado` = `cid`.`Estado_idEstado`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vwcliente`
--

/*!50001 DROP VIEW IF EXISTS `vwcliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwcliente` AS select `cli`.`idCliente` AS `idCliente`,`cli`.`Status` AS `Status`,`pes`.`nomePessoa` AS `nomePessoa`,`pes`.`dataNascimento` AS `dataNascimento`,`pes`.`CPF` AS `CPF`,`pes`.`rg` AS `rg`,`pes`.`logradouro` AS `logradouro`,`pes`.`numero` AS `numero`,`pes`.`nomeCidade` AS `nomeCidade`,`pes`.`nomeEstado` AS `nomeEstado`,`pes`.`DDD` AS `DDD`,`pes`.`tel` AS `tel`,`pes`.`email` AS `email` from (`cliente` `cli` join `vwpessoa` `pes` on((`pes`.`idPessoa` = `cli`.`idCliente`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vwendereco`
--

/*!50001 DROP VIEW IF EXISTS `vwendereco`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwendereco` AS select `ende`.`idEndereco` AS `idEndereco`,`ende`.`logradouro` AS `logradouro`,`ende`.`numero` AS `numero`,`ende`.`CEP` AS `CEP`,`cid`.`nomeCidade` AS `nomeCidade`,`es`.`nomeEstado` AS `nomeEstado` from ((`endereco` `ende` join `cidade` `cid` on((`cid`.`idCidade` = `ende`.`Cidade_idCidade`))) join `estado` `es` on((`es`.`idEstado` = `cid`.`Estado_idEstado`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vwfilme`
--

/*!50001 DROP VIEW IF EXISTS `vwfilme`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwfilme` AS select `filme`.`idFilme` AS `idFilme`,`filme`.`nomeFilme` AS `nomeFilme`,`filme`.`numeroCopia` AS `numeroCopia`,`filme`.`duracao` AS `duracao`,`genero`.`nomeGenero` AS `nomeGenero`,`genero`.`obs` AS `obs` from ((`filme_has_genero` `aux` join `filme` on((`filme`.`idFilme` = `aux`.`Filme_idFilme`))) join `genero` on((`genero`.`idGenero` = `aux`.`Genero_idGenero`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vwlocacao`
--

/*!50001 DROP VIEW IF EXISTS `vwlocacao`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwlocacao` AS select `loc`.`idLocacao` AS `idLocacao`,`loc`.`dataEmprestimo` AS `dataEmprestimo`,`loc`.`dataPrevDevolucao` AS `dataPrevDevolucao`,`loc`.`dataDevolvido` AS `dataDevolvido`,`loc`.`valor` AS `valor`,`loc`.`tipoCliente` AS `tipoCliente`,`fil`.`nomeFilme` AS `nomeFilme`,`fil`.`numeroCopia` AS `numeroCopia`,`cli`.`nomePessoa` AS `nomePessoa`,`cli`.`dataNascimento` AS `dataNascimento`,`cli`.`CPF` AS `CPF`,`cli`.`rg` AS `rg`,`cli`.`logradouro` AS `logradouro`,`cli`.`numero` AS `numero`,`cli`.`nomeCidade` AS `nomeCidade`,`cli`.`nomeEstado` AS `nomeEstado`,`cli`.`DDD` AS `DDD`,`cli`.`tel` AS `tel`,`cli`.`email` AS `email` from ((`locacao` `loc` join `filme` `fil` on((`fil`.`idFilme` = `loc`.`Filme_idFilme`))) join `vwcliente` `cli` on((`cli`.`idCliente` = `loc`.`Cliente_idCliente`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vwpessoa`
--

/*!50001 DROP VIEW IF EXISTS `vwpessoa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwpessoa` AS select `pes`.`idPessoa` AS `idPessoa`,`pes`.`nomePessoa` AS `nomePessoa`,`pes`.`dataNascimento` AS `dataNascimento`,`pes`.`CPF` AS `CPF`,`pes`.`RG` AS `rg`,`ende`.`logradouro` AS `logradouro`,`ende`.`numero` AS `numero`,`ende`.`CEP` AS `CEP`,`ende`.`nomeCidade` AS `nomeCidade`,`ende`.`nomeEstado` AS `nomeEstado`,`con`.`DDD` AS `DDD`,`con`.`tel` AS `tel`,`con`.`email` AS `email` from ((`pessoa` `pes` join `vwendereco` `ende` on((`ende`.`idEndereco` = `pes`.`Endereco_idEndereco`))) join `contato` `con` on((`con`.`idContato` = `pes`.`Contato_idContato`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-28 16:49:11
