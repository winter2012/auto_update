CREATE DATABASE  IF NOT EXISTS `api_doc` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `api_doc`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: api_doc
-- ------------------------------------------------------
-- Server version	5.5.53

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
-- Table structure for table `eo_api`
--

DROP TABLE IF EXISTS `eo_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_api` (
  `apiID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `apiName` varchar(255) COLLATE utf8_bin NOT NULL,
  `apiURI` varchar(255) COLLATE utf8_bin NOT NULL,
  `apiProtocol` tinyint(1) unsigned NOT NULL,
  `apiFailureMock` text COLLATE utf8_bin,
  `apiSuccessMock` text COLLATE utf8_bin,
  `apiRequestType` tinyint(1) unsigned NOT NULL,
  `apiSuccessMockType` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `apiFailureMockType` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `apiStatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `apiUpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `groupID` int(11) unsigned NOT NULL,
  `projectID` int(11) unsigned NOT NULL,
  `starred` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `removed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `removeTime` timestamp NULL DEFAULT NULL,
  `apiNoteType` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `apiNoteRaw` text COLLATE utf8_bin,
  `apiNote` text COLLATE utf8_bin,
  `apiRequestParamType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `apiRequestRaw` text COLLATE utf8_bin,
  `updateUserID` int(11) NOT NULL DEFAULT '0',
  `mockRule` text COLLATE utf8_bin,
  `mockResult` text COLLATE utf8_bin,
  `mockConfig` text COLLATE utf8_bin,
  `apiSuccessStatusCode` varchar(255) COLLATE utf8_bin DEFAULT '200',
  `apiFailureStatusCode` varchar(255) COLLATE utf8_bin DEFAULT '200',
  `beforeInject` text COLLATE utf8_bin,
  `afterInject` text COLLATE utf8_bin,
  PRIMARY KEY (`apiID`,`groupID`,`apiURI`),
  KEY `groupID` (`groupID`),
  KEY `apiID` (`apiID`),
  KEY `projectID` (`projectID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_api`
--

LOCK TABLES `eo_api` WRITE;
/*!40000 ALTER TABLE `eo_api` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_api_cache`
--

DROP TABLE IF EXISTS `eo_api_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_api_cache` (
  `cacheID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `projectID` int(10) unsigned NOT NULL,
  `groupID` int(10) unsigned NOT NULL,
  `apiID` int(10) unsigned NOT NULL,
  `apiJson` longtext NOT NULL,
  `starred` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `updateUserID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cacheID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_api_cache`
--

LOCK TABLES `eo_api_cache` WRITE;
/*!40000 ALTER TABLE `eo_api_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_api_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_api_env`
--

DROP TABLE IF EXISTS `eo_api_env`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_api_env` (
  `envID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `envName` varchar(255) NOT NULL,
  `projectID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`envID`,`projectID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_api_env`
--

LOCK TABLES `eo_api_env` WRITE;
/*!40000 ALTER TABLE `eo_api_env` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_api_env` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_api_env_front_uri`
--

DROP TABLE IF EXISTS `eo_api_env_front_uri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_api_env_front_uri` (
  `envID` int(10) unsigned NOT NULL,
  `uri` varchar(255) NOT NULL,
  `uriID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `applyProtocol` varchar(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`uriID`,`envID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_api_env_front_uri`
--

LOCK TABLES `eo_api_env_front_uri` WRITE;
/*!40000 ALTER TABLE `eo_api_env_front_uri` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_api_env_front_uri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_api_env_header`
--

DROP TABLE IF EXISTS `eo_api_env_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_api_env_header` (
  `headerID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `envID` int(11) NOT NULL,
  `applyProtocol` varchar(255) DEFAULT NULL,
  `headerName` varchar(255) NOT NULL,
  `headerValue` text NOT NULL,
  PRIMARY KEY (`headerID`,`envID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_api_env_header`
--

LOCK TABLES `eo_api_env_header` WRITE;
/*!40000 ALTER TABLE `eo_api_env_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_api_env_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_api_env_param`
--

DROP TABLE IF EXISTS `eo_api_env_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_api_env_param` (
  `paramID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `envID` int(10) unsigned NOT NULL,
  `paramKey` varchar(255) NOT NULL,
  `paramValue` text NOT NULL,
  PRIMARY KEY (`paramID`,`envID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_api_env_param`
--

LOCK TABLES `eo_api_env_param` WRITE;
/*!40000 ALTER TABLE `eo_api_env_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_api_env_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_api_env_param_additional`
--

DROP TABLE IF EXISTS `eo_api_env_param_additional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_api_env_param_additional` (
  `paramID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `envID` int(10) unsigned NOT NULL,
  `paramKey` varchar(255) NOT NULL,
  `paramValue` text NOT NULL,
  PRIMARY KEY (`paramID`,`envID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_api_env_param_additional`
--

LOCK TABLES `eo_api_env_param_additional` WRITE;
/*!40000 ALTER TABLE `eo_api_env_param_additional` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_api_env_param_additional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_api_group`
--

DROP TABLE IF EXISTS `eo_api_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_api_group` (
  `groupID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `groupName` varchar(30) COLLATE utf8_bin NOT NULL,
  `projectID` int(11) unsigned NOT NULL,
  `parentGroupID` int(10) unsigned NOT NULL DEFAULT '0',
  `isChild` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupID`,`projectID`),
  KEY `groupID` (`groupID`),
  KEY `projectID` (`projectID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_api_group`
--

LOCK TABLES `eo_api_group` WRITE;
/*!40000 ALTER TABLE `eo_api_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_api_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_api_group_order`
--

DROP TABLE IF EXISTS `eo_api_group_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_api_group_order` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `projectID` int(11) NOT NULL,
  `orderList` text,
  PRIMARY KEY (`orderID`,`projectID`),
  UNIQUE KEY `projectID` (`projectID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_api_group_order`
--

LOCK TABLES `eo_api_group_order` WRITE;
/*!40000 ALTER TABLE `eo_api_group_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_api_group_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_api_header`
--

DROP TABLE IF EXISTS `eo_api_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_api_header` (
  `headerID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `headerName` varchar(255) NOT NULL,
  `headerValue` text NOT NULL,
  `apiID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`headerID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_api_header`
--

LOCK TABLES `eo_api_header` WRITE;
/*!40000 ALTER TABLE `eo_api_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_api_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_api_history`
--

DROP TABLE IF EXISTS `eo_api_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_api_history` (
  `historyID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `projectID` int(10) unsigned NOT NULL,
  `groupID` int(10) unsigned NOT NULL,
  `apiID` int(10) unsigned NOT NULL,
  `historyJson` longtext NOT NULL,
  `updateDesc` varchar(255) NOT NULL,
  `updateUserID` int(10) unsigned NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isNow` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`historyID`,`apiID`,`updateTime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_api_history`
--

LOCK TABLES `eo_api_history` WRITE;
/*!40000 ALTER TABLE `eo_api_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_api_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_api_request_param`
--

DROP TABLE IF EXISTS `eo_api_request_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_api_request_param` (
  `paramID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `paramName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `paramKey` varchar(255) COLLATE utf8_bin NOT NULL,
  `paramValue` text COLLATE utf8_bin NOT NULL,
  `paramType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `paramLimit` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `apiID` int(10) unsigned NOT NULL,
  `paramNotNull` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`paramID`),
  KEY `apiID` (`apiID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_api_request_param`
--

LOCK TABLES `eo_api_request_param` WRITE;
/*!40000 ALTER TABLE `eo_api_request_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_api_request_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_api_request_value`
--

DROP TABLE IF EXISTS `eo_api_request_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_api_request_value` (
  `valueID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` text,
  `valueDescription` varchar(255) DEFAULT NULL,
  `paramID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`valueID`),
  KEY `paramID` (`paramID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_api_request_value`
--

LOCK TABLES `eo_api_request_value` WRITE;
/*!40000 ALTER TABLE `eo_api_request_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_api_request_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_api_result_param`
--

DROP TABLE IF EXISTS `eo_api_result_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_api_result_param` (
  `paramID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `paramName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `paramKey` varchar(255) COLLATE utf8_bin NOT NULL,
  `apiID` int(11) unsigned NOT NULL,
  `paramNotNull` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`paramID`),
  KEY `apiID` (`apiID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_api_result_param`
--

LOCK TABLES `eo_api_result_param` WRITE;
/*!40000 ALTER TABLE `eo_api_result_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_api_result_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_api_result_value`
--

DROP TABLE IF EXISTS `eo_api_result_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_api_result_value` (
  `valueID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` text COLLATE utf8_bin NOT NULL,
  `valueDescription` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `paramID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`valueID`),
  KEY `resultParamID` (`paramID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_api_result_value`
--

LOCK TABLES `eo_api_result_value` WRITE;
/*!40000 ALTER TABLE `eo_api_result_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_api_result_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_api_status_code_group_order`
--

DROP TABLE IF EXISTS `eo_api_status_code_group_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_api_status_code_group_order` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `projectID` int(11) NOT NULL,
  `orderList` text NOT NULL,
  PRIMARY KEY (`orderID`,`projectID`),
  UNIQUE KEY `projectID` (`projectID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_api_status_code_group_order`
--

LOCK TABLES `eo_api_status_code_group_order` WRITE;
/*!40000 ALTER TABLE `eo_api_status_code_group_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_api_status_code_group_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_api_test_history`
--

DROP TABLE IF EXISTS `eo_api_test_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_api_test_history` (
  `testID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `apiID` int(10) unsigned NOT NULL,
  `requestInfo` longtext,
  `resultInfo` longtext,
  `testTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `projectID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`testID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_api_test_history`
--

LOCK TABLES `eo_api_test_history` WRITE;
/*!40000 ALTER TABLE `eo_api_test_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_api_test_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_conn_database`
--

DROP TABLE IF EXISTS `eo_conn_database`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_conn_database` (
  `connID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dbID` int(10) unsigned NOT NULL,
  `userID` int(10) unsigned NOT NULL,
  `userType` tinyint(1) NOT NULL DEFAULT '0',
  `inviteUserID` int(10) DEFAULT NULL,
  `partnerNickName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`connID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_conn_database`
--

LOCK TABLES `eo_conn_database` WRITE;
/*!40000 ALTER TABLE `eo_conn_database` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_conn_database` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_conn_project`
--

DROP TABLE IF EXISTS `eo_conn_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_conn_project` (
  `connID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `projectID` int(11) unsigned NOT NULL,
  `userID` int(11) unsigned NOT NULL,
  `userType` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `inviteUserID` int(11) DEFAULT NULL,
  `partnerNickName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`connID`,`projectID`,`userID`),
  KEY `projectID` (`projectID`),
  KEY `eo_conn_ibfk_2` (`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_conn_project`
--

LOCK TABLES `eo_conn_project` WRITE;
/*!40000 ALTER TABLE `eo_conn_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_conn_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_database`
--

DROP TABLE IF EXISTS `eo_database`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_database` (
  `dbID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dbName` varchar(255) NOT NULL,
  `dbVersion` float unsigned NOT NULL,
  `dbUpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `databaseType` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dbID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_database`
--

LOCK TABLES `eo_database` WRITE;
/*!40000 ALTER TABLE `eo_database` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_database` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_database_table`
--

DROP TABLE IF EXISTS `eo_database_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_database_table` (
  `dbID` int(10) unsigned NOT NULL,
  `tableID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tableName` varchar(255) NOT NULL,
  `tableDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tableID`,`dbID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_database_table`
--

LOCK TABLES `eo_database_table` WRITE;
/*!40000 ALTER TABLE `eo_database_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_database_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_database_table_field`
--

DROP TABLE IF EXISTS `eo_database_table_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_database_table_field` (
  `fieldID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fieldName` varchar(255) NOT NULL,
  `fieldType` varchar(10) NOT NULL,
  `fieldLength` varchar(10) NOT NULL,
  `isNotNull` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isPrimaryKey` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `fieldDescription` varchar(255) DEFAULT NULL,
  `tableID` int(10) unsigned NOT NULL,
  `defaultValue` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fieldID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_database_table_field`
--

LOCK TABLES `eo_database_table_field` WRITE;
/*!40000 ALTER TABLE `eo_database_table_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_database_table_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_log_project_operation`
--

DROP TABLE IF EXISTS `eo_log_project_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_log_project_operation` (
  `opID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `opType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `opUserID` int(10) unsigned NOT NULL,
  `opDesc` text NOT NULL,
  `opTime` datetime NOT NULL,
  `opProjectID` int(10) unsigned NOT NULL,
  `opTarget` tinyint(3) unsigned NOT NULL,
  `opTargetID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`opID`,`opTargetID`,`opProjectID`,`opUserID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_log_project_operation`
--

LOCK TABLES `eo_log_project_operation` WRITE;
/*!40000 ALTER TABLE `eo_log_project_operation` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_log_project_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_message`
--

DROP TABLE IF EXISTS `eo_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_message` (
  `msgID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `toUserID` int(10) unsigned NOT NULL,
  `fromUserID` int(10) unsigned NOT NULL,
  `msgSendTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `msgType` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `summary` varchar(255) DEFAULT NULL,
  `msg` text NOT NULL,
  `isRead` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `otherMsg` text,
  PRIMARY KEY (`msgID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_message`
--

LOCK TABLES `eo_message` WRITE;
/*!40000 ALTER TABLE `eo_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_project`
--

DROP TABLE IF EXISTS `eo_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_project` (
  `projectID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `projectType` tinyint(1) unsigned NOT NULL,
  `projectName` varchar(255) COLLATE utf8_bin NOT NULL,
  `projectUpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `projectVersion` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '1.0',
  PRIMARY KEY (`projectID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_project`
--

LOCK TABLES `eo_project` WRITE;
/*!40000 ALTER TABLE `eo_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_project_document`
--

DROP TABLE IF EXISTS `eo_project_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_project_document` (
  `documentID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` int(10) unsigned NOT NULL,
  `projectID` int(10) unsigned NOT NULL,
  `contentType` tinyint(3) unsigned NOT NULL,
  `contentRaw` longtext,
  `content` longtext,
  `title` varchar(255) NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`documentID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_project_document`
--

LOCK TABLES `eo_project_document` WRITE;
/*!40000 ALTER TABLE `eo_project_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_project_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_project_document_group`
--

DROP TABLE IF EXISTS `eo_project_document_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_project_document_group` (
  `groupID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `projectID` int(10) unsigned NOT NULL,
  `groupName` varchar(255) NOT NULL,
  `parentGroupID` int(10) unsigned NOT NULL DEFAULT '0',
  `isChild` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_project_document_group`
--

LOCK TABLES `eo_project_document_group` WRITE;
/*!40000 ALTER TABLE `eo_project_document_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_project_document_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_project_document_group_order`
--

DROP TABLE IF EXISTS `eo_project_document_group_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_project_document_group_order` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `projectID` int(11) NOT NULL,
  `orderList` text NOT NULL,
  PRIMARY KEY (`orderID`,`projectID`),
  UNIQUE KEY `projectID` (`projectID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_project_document_group_order`
--

LOCK TABLES `eo_project_document_group_order` WRITE;
/*!40000 ALTER TABLE `eo_project_document_group_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_project_document_group_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_project_environment`
--

DROP TABLE IF EXISTS `eo_project_environment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_project_environment` (
  `envID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `envName` varchar(255) NOT NULL,
  `envURI` varchar(255) NOT NULL,
  `projectID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`envID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_project_environment`
--

LOCK TABLES `eo_project_environment` WRITE;
/*!40000 ALTER TABLE `eo_project_environment` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_project_environment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_project_invite`
--

DROP TABLE IF EXISTS `eo_project_invite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_project_invite` (
  `projectID` int(11) unsigned NOT NULL,
  `inviteCode` varchar(6) NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`projectID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_project_invite`
--

LOCK TABLES `eo_project_invite` WRITE;
/*!40000 ALTER TABLE `eo_project_invite` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_project_invite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_project_status_code`
--

DROP TABLE IF EXISTS `eo_project_status_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_project_status_code` (
  `codeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `codeDescription` varchar(255) NOT NULL,
  `groupID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`codeID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_project_status_code`
--

LOCK TABLES `eo_project_status_code` WRITE;
/*!40000 ALTER TABLE `eo_project_status_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_project_status_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_project_status_code_group`
--

DROP TABLE IF EXISTS `eo_project_status_code_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_project_status_code_group` (
  `groupID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `projectID` int(10) unsigned NOT NULL,
  `groupName` varchar(255) NOT NULL,
  `parentGroupID` int(10) unsigned NOT NULL DEFAULT '0',
  `isChild` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupID`,`projectID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_project_status_code_group`
--

LOCK TABLES `eo_project_status_code_group` WRITE;
/*!40000 ALTER TABLE `eo_project_status_code_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_project_status_code_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_project_test_case`
--

DROP TABLE IF EXISTS `eo_project_test_case`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_project_test_case` (
  `caseID` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `projectID` int(11) NOT NULL COMMENT '项目ID',
  `userID` int(11) NOT NULL COMMENT '用户ID',
  `caseName` varchar(255) NOT NULL COMMENT '用例名称',
  `caseDesc` varchar(255) DEFAULT NULL COMMENT '用例描述',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` datetime NOT NULL COMMENT '更新时间',
  `groupID` int(11) NOT NULL COMMENT '分组ID',
  `caseType` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0表示简单，1表示高级',
  `caseCode` longtext,
  PRIMARY KEY (`caseID`,`projectID`,`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_project_test_case`
--

LOCK TABLES `eo_project_test_case` WRITE;
/*!40000 ALTER TABLE `eo_project_test_case` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_project_test_case` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_project_test_case_group`
--

DROP TABLE IF EXISTS `eo_project_test_case_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_project_test_case_group` (
  `groupID` int(11) NOT NULL AUTO_INCREMENT COMMENT '分组ID',
  `groupName` varchar(100) NOT NULL COMMENT '组名',
  `projectID` int(11) NOT NULL COMMENT '项目ID',
  `parentGroupID` int(11) NOT NULL DEFAULT '0' COMMENT '父分组',
  `isChild` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否子分组',
  PRIMARY KEY (`groupID`,`projectID`,`parentGroupID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_project_test_case_group`
--

LOCK TABLES `eo_project_test_case_group` WRITE;
/*!40000 ALTER TABLE `eo_project_test_case_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_project_test_case_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_project_test_case_group_order`
--

DROP TABLE IF EXISTS `eo_project_test_case_group_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_project_test_case_group_order` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `projectID` int(11) NOT NULL,
  `orderList` text NOT NULL,
  PRIMARY KEY (`orderID`,`projectID`),
  UNIQUE KEY `projectID` (`projectID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_project_test_case_group_order`
--

LOCK TABLES `eo_project_test_case_group_order` WRITE;
/*!40000 ALTER TABLE `eo_project_test_case_group_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_project_test_case_group_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_project_test_case_history`
--

DROP TABLE IF EXISTS `eo_project_test_case_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_project_test_case_history` (
  `testID` int(11) NOT NULL AUTO_INCREMENT COMMENT '测试ID',
  `caseID` int(11) NOT NULL COMMENT '用例ID',
  `result` text COMMENT '测试结果',
  `testTime` datetime DEFAULT NULL COMMENT '测试时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '0表示失败，1表示通过',
  PRIMARY KEY (`testID`,`caseID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_project_test_case_history`
--

LOCK TABLES `eo_project_test_case_history` WRITE;
/*!40000 ALTER TABLE `eo_project_test_case_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_project_test_case_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_project_test_case_single`
--

DROP TABLE IF EXISTS `eo_project_test_case_single`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_project_test_case_single` (
  `connID` int(11) NOT NULL AUTO_INCREMENT COMMENT '关联ID',
  `caseID` int(11) NOT NULL COMMENT '用例ID',
  `caseData` text COMMENT '内容',
  `caseCode` text COMMENT '用例代码',
  `statusCode` varchar(20) DEFAULT NULL,
  `matchType` tinyint(4) DEFAULT NULL,
  `matchRule` text,
  `apiName` varchar(255) NOT NULL COMMENT '接口名称',
  `apiURI` varchar(255) NOT NULL COMMENT '接口路径',
  `apiRequestType` tinyint(4) DEFAULT '0' COMMENT '请求参数类型',
  `orderNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`connID`,`caseID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_project_test_case_single`
--

LOCK TABLES `eo_project_test_case_single` WRITE;
/*!40000 ALTER TABLE `eo_project_test_case_single` DISABLE KEYS */;
/*!40000 ALTER TABLE `eo_project_test_case_single` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eo_user`
--

DROP TABLE IF EXISTS `eo_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eo_user` (
  `userID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(60) NOT NULL,
  `userPassword` varchar(60) NOT NULL,
  `userNickName` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`userID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eo_user`
--

LOCK TABLES `eo_user` WRITE;
/*!40000 ALTER TABLE `eo_user` DISABLE KEYS */;
INSERT INTO `eo_user` VALUES (1,'admin','14e1b600b1fd579f47433b88e8d85291','超级管理员');
/*!40000 ALTER TABLE `eo_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-27 16:31:05
