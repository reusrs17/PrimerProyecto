-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (arm64)
--
-- Host: localhost    Database: proyecto
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `Cursos`
--

DROP TABLE IF EXISTS `Cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cursos` (
  `CursoID` int NOT NULL,
  `EstudianteID` int DEFAULT NULL,
  `ProfesorID` int DEFAULT NULL,
  `NombreCurso` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`CursoID`),
  KEY `EstudianteID` (`EstudianteID`),
  KEY `ProfesorID` (`ProfesorID`),
  CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`EstudianteID`) REFERENCES `Estudiantes` (`EstudianteID`),
  CONSTRAINT `cursos_ibfk_2` FOREIGN KEY (`ProfesorID`) REFERENCES `Profesores` (`ProfesorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cursos`
--

LOCK TABLES `Cursos` WRITE;
/*!40000 ALTER TABLE `Cursos` DISABLE KEYS */;
INSERT INTO `Cursos` VALUES (1,1,1,'Álgebra I',NULL,NULL,NULL),(2,2,2,'Historia Mundial',NULL,NULL,NULL),(3,3,3,'Biología Avanzada',NULL,NULL,NULL);
/*!40000 ALTER TABLE `Cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estudiantes`
--

DROP TABLE IF EXISTS `Estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Estudiantes` (
  `EstudianteID` int NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`EstudianteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estudiantes`
--

LOCK TABLES `Estudiantes` WRITE;
/*!40000 ALTER TABLE `Estudiantes` DISABLE KEYS */;
INSERT INTO `Estudiantes` VALUES (1,'Itzel Mendoza','2000-05-15','123 Main St',NULL,NULL,NULL),(2,'Maximiliano Reyes','2001-03-10','456 Elm St',NULL,NULL,NULL),(3,'Ingrid Pérez','2002-07-20','789 Oak St',NULL,NULL,NULL);
/*!40000 ALTER TABLE `Estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EstudiantesCursos`
--

DROP TABLE IF EXISTS `EstudiantesCursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EstudiantesCursos` (
  `EstudianteID` int DEFAULT NULL,
  `CursoID` int DEFAULT NULL,
  KEY `EstudianteID` (`EstudianteID`),
  KEY `CursoID` (`CursoID`),
  CONSTRAINT `estudiantescursos_ibfk_1` FOREIGN KEY (`EstudianteID`) REFERENCES `Estudiantes` (`EstudianteID`),
  CONSTRAINT `estudiantescursos_ibfk_2` FOREIGN KEY (`CursoID`) REFERENCES `Cursos` (`CursoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EstudiantesCursos`
--

LOCK TABLES `EstudiantesCursos` WRITE;
/*!40000 ALTER TABLE `EstudiantesCursos` DISABLE KEYS */;
INSERT INTO `EstudiantesCursos` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `EstudiantesCursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Materiales`
--

DROP TABLE IF EXISTS `Materiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Materiales` (
  `MaterialID` int NOT NULL,
  `CursoID` int DEFAULT NULL,
  `NombreMaterial` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MaterialID`),
  KEY `CursoID` (`CursoID`),
  CONSTRAINT `materiales_ibfk_1` FOREIGN KEY (`CursoID`) REFERENCES `Cursos` (`CursoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Materiales`
--

LOCK TABLES `Materiales` WRITE;
/*!40000 ALTER TABLE `Materiales` DISABLE KEYS */;
INSERT INTO `Materiales` VALUES (1,1,'Libro de Álgebra I'),(2,2,'Libro de Historia Mundial'),(3,3,'Laboratorio de Biología Avanzada');
/*!40000 ALTER TABLE `Materiales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Profesores`
--

DROP TABLE IF EXISTS `Profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Profesores` (
  `ProfesorID` int NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Especialidad` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`ProfesorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Profesores`
--

LOCK TABLES `Profesores` WRITE;
/*!40000 ALTER TABLE `Profesores` DISABLE KEYS */;
INSERT INTO `Profesores` VALUES (1,'Dr. Reyna','Matemáticas',NULL,NULL,NULL),(2,'Prof. Sánchez','Historia',NULL,NULL,NULL),(3,'Prof. Lozano','Ciencias',NULL,NULL,NULL);
/*!40000 ALTER TABLE `Profesores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'proyecto'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-19 21:29:26
