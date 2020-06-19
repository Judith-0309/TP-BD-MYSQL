-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: activite_bancaire
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `affectation`
--

DROP TABLE IF EXISTS `affectation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affectation` (
  `idEmploye` int(11) NOT NULL AUTO_INCREMENT,
  `dateAffectation` date NOT NULL,
  `idAgence` int(11) NOT NULL,
  PRIMARY KEY (`idEmploye`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affectation`
--

LOCK TABLES `affectation` WRITE;
/*!40000 ALTER TABLE `affectation` DISABLE KEYS */;
/*!40000 ALTER TABLE `affectation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agence`
--

DROP TABLE IF EXISTS `agence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agence` (
  `idAgence` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `numeroAgence` varchar(20) NOT NULL,
  `adresseAgence` varchar(20) NOT NULL,
  PRIMARY KEY (`idAgence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agence`
--

LOCK TABLES `agence` WRITE;
/*!40000 ALTER TABLE `agence` DISABLE KEYS */;
/*!40000 ALTER TABLE `agence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliententreprise`
--

DROP TABLE IF EXISTS `cliententreprise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliententreprise` (
  `idEntreprise` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nomEntreprise` varchar(20) DEFAULT NULL,
  `ninea` varchar(20) DEFAULT NULL,
  `registreCom` varchar(20) DEFAULT NULL,
  `nombreEmploye` decimal(10,0) DEFAULT NULL,
  `adresse` varchar(30) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `salaire` int(15) DEFAULT NULL,
  `profession` varchar(30) DEFAULT NULL,
  `infos_employeur` text DEFAULT NULL,
  PRIMARY KEY (`idEntreprise`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliententreprise`
--

LOCK TABLES `cliententreprise` WRITE;
/*!40000 ALTER TABLE `cliententreprise` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliententreprise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientphysique`
--

DROP TABLE IF EXISTS `clientphysique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientphysique` (
  `idClientPhysique` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `telephone` decimal(9,0) NOT NULL,
  PRIMARY KEY (`idClientPhysique`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientphysique`
--

LOCK TABLES `clientphysique` WRITE;
/*!40000 ALTER TABLE `clientphysique` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientphysique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compte`
--

DROP TABLE IF EXISTS `compte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compte` (
  `numeroCompte` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeCompte` varchar(30) NOT NULL,
  `idEntreprise` int(11) unsigned NOT NULL,
  `idClientPhysique` int(10) unsigned NOT NULL,
  PRIMARY KEY (`numeroCompte`),
  KEY `fk_id_Entreprise` (`idEntreprise`),
  KEY `fk_id_Physique` (`idClientPhysique`),
  CONSTRAINT `fk_id_Entreprise` FOREIGN KEY (`idEntreprise`) REFERENCES `cliententreprise` (`idEntreprise`),
  CONSTRAINT `fk_id_Physique` FOREIGN KEY (`idClientPhysique`) REFERENCES `clientphysique` (`idClientPhysique`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compte`
--

LOCK TABLES `compte` WRITE;
/*!40000 ALTER TABLE `compte` DISABLE KEYS */;
/*!40000 ALTER TABLE `compte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employebp`
--

DROP TABLE IF EXISTS `employebp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employebp` (
  `idEmploye` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nomEmploye` varchar(30) NOT NULL,
  `prenomEmploye` varchar(30) NOT NULL,
  `agence` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idEmploye`),
  KEY `fk_id_Employe_agence` (`agence`),
  CONSTRAINT `fk_id_Employe_agence` FOREIGN KEY (`agence`) REFERENCES `agence` (`idAgence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employebp`
--

LOCK TABLES `employebp` WRITE;
/*!40000 ALTER TABLE `employebp` DISABLE KEYS */;
/*!40000 ALTER TABLE `employebp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operations`
--

DROP TABLE IF EXISTS `operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operations` (
  `idOperations` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeOperation` varchar(30) NOT NULL,
  `montant` int(15) NOT NULL,
  `date` datetime NOT NULL,
  `numeroCompte` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idOperations`),
  KEY `fk_num_compte` (`numeroCompte`),
  CONSTRAINT `fk_num_compte` FOREIGN KEY (`numeroCompte`) REFERENCES `compte` (`numeroCompte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operations`
--

LOCK TABLES `operations` WRITE;
/*!40000 ALTER TABLE `operations` DISABLE KEYS */;
/*!40000 ALTER TABLE `operations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-19  0:15:46
