-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: peachmarket
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `agree_state`
--

DROP DATABASE IF EXISTS PEACH;

CREATE DATABASE PEACH;

USE PEACH;

DROP TABLE IF EXISTS `agree_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agree_state` (
  `as_num` int NOT NULL AUTO_INCREMENT,
  `as_name` varchar(10) NOT NULL,
  PRIMARY KEY (`as_num`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agree_state`
--

LOCK TABLES `agree_state` WRITE;
/*!40000 ALTER TABLE `agree_state` DISABLE KEYS */;
INSERT INTO `agree_state` VALUES (1,'대기'),(2,'수락'),(3,'거절');
/*!40000 ALTER TABLE `agree_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank` (
  `bk_name` varchar(10) NOT NULL,
  PRIMARY KEY (`bk_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
INSERT INTO `bank` VALUES ('KEB하나은행'),('SBI저축은행'),('SC제일은행'),('경남은행'),('광주은행'),('국민은행'),('기업은행'),('농협'),('대구은행'),('미등록'),('부산은행'),('수협'),('신한은행'),('애큐온저축은행'),('외환은행'),('우리은행'),('우리종합금융'),('우체국'),('전북은행'),('제주은행'),('키움YES저축은행'),('푸른저축은행'),('한국산업은행'),('한국수출입은행'),('한국시티은행');
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat` (
  `ch_num` int NOT NULL AUTO_INCREMENT,
  `ch_sb_num` int NOT NULL,
  `ch_me_num` int NOT NULL,
  PRIMARY KEY (`ch_num`),
  KEY `FK_sale_board_TO_chat_1` (`ch_sb_num`),
  KEY `FK_member_TO_chat_1` (`ch_me_num`),
  CONSTRAINT `FK_member_TO_chat_1` FOREIGN KEY (`ch_me_num`) REFERENCES `member` (`me_num`),
  CONSTRAINT `FK_sale_board_TO_chat_1` FOREIGN KEY (`ch_sb_num`) REFERENCES `sale_board` (`sb_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `ci_num` int NOT NULL AUTO_INCREMENT,
  `ci_large` varchar(10) DEFAULT NULL,
  `ci_medium` varchar(10) DEFAULT NULL,
  `ci_small` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ci_num`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'서울특별시','강남구','신사동'),(2,'서울특별시','강남구','논현제1동'),(3,'서울특별시','강남구','논현제2동'),(4,'서울특별시','강남구','압구정동'),(5,'서울특별시','강남구','청담동'),(6,'서울특별시','강남구','삼성제1동'),(7,'서울특별시','강남구','삼성제2동'),(8,'서울특별시','강남구','대치제1동'),(9,'서울특별시','강남구','대치제2동'),(10,'서울특별시','강남구','대치제3동'),(11,'서울특별시','강남구','대치제4동'),(12,'서울특별시','강남구','역삼제1동'),(13,'서울특별시','강남구','역삼제2동'),(14,'서울특별시','강남구','도곡제1동'),(15,'서울특별시','강남구','도곡제2동'),(16,'서울특별시','강남구','개포제1동'),(17,'서울특별시','강남구','개포제2동'),(18,'서울특별시','강남구','개포제4동'),(19,'서울특별시','강남구','일원본동'),(20,'서울특별시','강남구','일원제1동'),(21,'서울특별시','강남구','일원제2동'),(22,'서울특별시','강남구','수서동'),(23,'서울특별시','강남구','세곡동'),(24,'서울특별시','강동구','강일동'),(25,'서울특별시','강동구','상일1동'),(26,'서울특별시','강동구','상일2동'),(27,'서울특별시','강동구','명일제1동'),(28,'서울특별시','강동구','명일제2동'),(29,'서울특별시','강동구','고덕제1동'),(30,'서울특별시','강동구','고덕제2동'),(31,'서울특별시','강동구','암사제1동'),(32,'서울특별시','강동구','암사제2동'),(33,'서울특별시','강동구','암사제3동'),(34,'서울특별시','강동구','천호제1동'),(35,'서울특별시','강동구','천호제2동'),(36,'서울특별시','강동구','천호제3동'),(37,'서울특별시','강동구','성내제1동'),(38,'서울특별시','강동구','성내제2동'),(39,'서울특별시','강동구','성내제3동'),(40,'서울특별시','강동구','길동'),(41,'서울특별시','강동구','둔촌제1동'),(42,'서울특별시','강동구','둔촌제2동'),(43,'서울특별시','강북구','삼양동'),(44,'서울특별시','강북구','미아동'),(45,'서울특별시','강북구','미아동'),(46,'서울특별시','강북구','송중동'),(47,'서울특별시','강북구','송천동'),(48,'서울특별시','강북구','삼각산동'),(49,'서울특별시','강북구','번제1동'),(50,'서울특별시','강북구','번제2동'),(51,'서울특별시','강북구','번제3동'),(52,'서울특별시','강북구','수유제1동'),(53,'서울특별시','강북구','수유제2동'),(54,'서울특별시','강북구','수유제3동'),(55,'서울특별시','강북구','우이동'),(56,'서울특별시','강북구','인수동'),(57,'서울특별시','강서구','염창동'),(58,'서울특별시','강서구','등촌제1동'),(59,'서울특별시','강서구','등촌제2동'),(60,'서울특별시','강서구','등촌제3동'),(61,'서울특별시','강서구','화곡본동'),(62,'서울특별시','강서구','화곡제1동'),(63,'서울특별시','강서구','화곡제2동'),(64,'서울특별시','강서구','화곡제3동'),(65,'서울특별시','강서구','화곡제4동'),(66,'서울특별시','강서구','화곡제6동'),(67,'서울특별시','강서구','화곡제8동'),(68,'서울특별시','강서구','우장산동'),(69,'서울특별시','강서구','가양제1동'),(70,'서울특별시','강서구','가양제2동'),(71,'서울특별시','강서구','가양제3동'),(72,'서울특별시','강서구','발산제1동'),(73,'서울특별시','강서구','공항동'),(74,'서울특별시','강서구','방화제1동'),(75,'서울특별시','강서구','방화제2동'),(76,'서울특별시','강서구','방화제3동');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community`
--

DROP TABLE IF EXISTS `community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community` (
  `co_num` int NOT NULL AUTO_INCREMENT,
  `co_title` varchar(40) NOT NULL,
  `co_info` longtext,
  `co_date` datetime NOT NULL,
  `co_like` int NOT NULL DEFAULT '0',
  `co_reply` int NOT NULL DEFAULT '0',
  `co_me_num` int NOT NULL,
  `co_cc_num` int NOT NULL,
  PRIMARY KEY (`co_num`),
  KEY `FK_member_TO_community_1` (`co_me_num`),
  KEY `FK_community_category_TO_community_1` (`co_cc_num`),
  CONSTRAINT `FK_community_category_TO_community_1` FOREIGN KEY (`co_cc_num`) REFERENCES `community_category` (`cc_num`),
  CONSTRAINT `FK_member_TO_community_1` FOREIGN KEY (`co_me_num`) REFERENCES `member` (`me_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community`
--

LOCK TABLES `community` WRITE;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
/*!40000 ALTER TABLE `community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_category`
--

DROP TABLE IF EXISTS `community_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community_category` (
  `cc_num` int NOT NULL AUTO_INCREMENT,
  `cc_name` varchar(12) NOT NULL,
  PRIMARY KEY (`cc_num`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_category`
--

LOCK TABLES `community_category` WRITE;
/*!40000 ALTER TABLE `community_category` DISABLE KEYS */;
INSERT INTO `community_category` VALUES (1,'소모임'),(2,'맛집탐방'),(3,'무료나눔');
/*!40000 ALTER TABLE `community_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like`
--

DROP TABLE IF EXISTS `like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like` (
  `lk_num` int NOT NULL AUTO_INCREMENT,
  `lk_co_num` int NOT NULL,
  `lk_me_num` int NOT NULL,
  PRIMARY KEY (`lk_num`),
  KEY `FK_community_TO_like_1` (`lk_co_num`),
  KEY `FK_member_TO_like_1` (`lk_me_num`),
  CONSTRAINT `FK_community_TO_like_1` FOREIGN KEY (`lk_co_num`) REFERENCES `community` (`co_num`),
  CONSTRAINT `FK_member_TO_like_1` FOREIGN KEY (`lk_me_num`) REFERENCES `member` (`me_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like`
--

LOCK TABLES `like` WRITE;
/*!40000 ALTER TABLE `like` DISABLE KEYS */;
/*!40000 ALTER TABLE `like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `me_num` int NOT NULL AUTO_INCREMENT,
  `me_id` varchar(50) NOT NULL,
  `me_pw` varchar(255) NOT NULL,
  `me_name` varchar(50) NOT NULL,
  `me_acc` varchar(50) DEFAULT NULL,
  `me_phone` varchar(15) NOT NULL,
  `me_nick` varchar(20) NOT NULL,
  `me_au` varchar(10) NOT NULL DEFAULT 'user',
  `me_date` datetime NOT NULL,
  `me_sugar` int NOT NULL DEFAULT '5',
  `me_st_num` int NOT NULL DEFAULT '1',
  `me_ci_num` int NOT NULL,
  `me_bk_name` varchar(10) NOT NULL DEFAULT '미등록',
  `me_point` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`me_num`),
  KEY `FK_statement_TO_member_1` (`me_st_num`),
  KEY `FK_city_TO_member_1` (`me_ci_num`),
  KEY `FK_bank_TO_member_1` (`me_bk_name`),
  CONSTRAINT `FK_bank_TO_member_1` FOREIGN KEY (`me_bk_name`) REFERENCES `bank` (`bk_name`),
  CONSTRAINT `FK_city_TO_member_1` FOREIGN KEY (`me_ci_num`) REFERENCES `city` (`ci_num`),
  CONSTRAINT `FK_statement_TO_member_1` FOREIGN KEY (`me_st_num`) REFERENCES `statement` (`st_num`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'ADMIN','admin11@','관리자','110334330589','01011112222','관리자','admin','2023-10-20 08:00:00',0,1,1,'신한은행',0),(2,'USER1','user11@','김돌쇠','110234330589','01022223333','유저1','user','2023-10-20 10:00:00',0,1,2,'국민은행',0),(3,'USER2','user22@','남꽃분','110564330589','01052223333','유저2','user','2023-10-21 10:00:00',0,1,3,'기업은행',100000),(4,'USER3','user33@','김사기','110123330589','01072223333','유저3','user','2023-10-21 11:00:00',0,2,4,'국민은행',0);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `ms_num` int NOT NULL AUTO_INCREMENT,
  `ms_info` longtext,
  `ms_date` datetime NOT NULL,
  `ms_me_num` int NOT NULL,
  `ms_ch_num` int NOT NULL,
  PRIMARY KEY (`ms_num`),
  KEY `FK_member_TO_message_1` (`ms_me_num`),
  KEY `FK_chat_TO_message_1` (`ms_ch_num`),
  CONSTRAINT `FK_chat_TO_message_1` FOREIGN KEY (`ms_ch_num`) REFERENCES `chat` (`ch_num`),
  CONSTRAINT `FK_member_TO_message_1` FOREIGN KEY (`ms_me_num`) REFERENCES `member` (`me_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nickname_list`
--

DROP TABLE IF EXISTS `nickname_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nickname_list` (
  `nl_num` int NOT NULL AUTO_INCREMENT,
  `nl_prenick` varchar(12) NOT NULL,
  `nl_date` datetime NOT NULL,
  `nl_me_num` int NOT NULL,
  PRIMARY KEY (`nl_num`),
  KEY `FK_member_TO_nickname_list_1` (`nl_me_num`),
  CONSTRAINT `FK_member_TO_nickname_list_1` FOREIGN KEY (`nl_me_num`) REFERENCES `member` (`me_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nickname_list`
--

LOCK TABLES `nickname_list` WRITE;
/*!40000 ALTER TABLE `nickname_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `nickname_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `nt_num` int NOT NULL AUTO_INCREMENT,
  `nt_title` varchar(40) NOT NULL,
  `nt_info` longtext,
  `nt_date` datetime NOT NULL,
  `nt_me_num` int NOT NULL,
  PRIMARY KEY (`nt_num`),
  KEY `FK_member_TO_notice_1` (`nt_me_num`),
  CONSTRAINT `FK_member_TO_notice_1` FOREIGN KEY (`nt_me_num`) REFERENCES `member` (`me_num`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'피치마켓 베타 서비스 시작 안내','피치마켓 베타 서비스가 2023년 10월 23일에 시작됩니다.\n    많은 관심 부탁드립니다.\n    10월 20일 오전 9시부터 미리 가입이 가능합니다.','2023-10-19 18:00:00',1);
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `point_history`
--

DROP TABLE IF EXISTS `point_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `point_history` (
  `ph_num` int NOT NULL AUTO_INCREMENT,
  `ph_me_num` int NOT NULL,
  `ph_point` int NOT NULL,
  `ph_date` datetime NOT NULL,
  `ph_info` longtext,
  PRIMARY KEY (`ph_num`),
  KEY `FK_member_TO_point_history_1` (`ph_me_num`),
  CONSTRAINT `FK_member_TO_point_history_1` FOREIGN KEY (`ph_me_num`) REFERENCES `member` (`me_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point_history`
--

LOCK TABLES `point_history` WRITE;
/*!40000 ALTER TABLE `point_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `point_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `pf_num` int NOT NULL AUTO_INCREMENT,
  `pf_text` longtext,
  `pf_me_num` int NOT NULL,
  PRIMARY KEY (`pf_num`),
  KEY `FK_member_TO_profile_1` (`pf_me_num`),
  CONSTRAINT `FK_member_TO_profile_1` FOREIGN KEY (`pf_me_num`) REFERENCES `member` (`me_num`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,'관리자',1),(2,'전자기기 중고거래는 김돌쇠',2),(3,'뷰티/리빙/여성의류 전문가 남꽃분입니다~!',3),(4,'사기는? 김사기 유튜브',4);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_image`
--

DROP TABLE IF EXISTS `profile_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_image` (
  `pi_num` int NOT NULL AUTO_INCREMENT,
  `pi_name` varchar(10) NOT NULL,
  `pi_pf_num` int NOT NULL,
  PRIMARY KEY (`pi_num`),
  KEY `FK_profile_TO_profile_image_1` (`pi_pf_num`),
  CONSTRAINT `FK_profile_TO_profile_image_1` FOREIGN KEY (`pi_pf_num`) REFERENCES `profile` (`pf_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_image`
--

LOCK TABLES `profile_image` WRITE;
/*!40000 ALTER TABLE `profile_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reply` (
  `re_num` int NOT NULL AUTO_INCREMENT,
  `re_info` longtext NOT NULL,
  `re_co_num` int NOT NULL,
  `re_me_num` int NOT NULL,
  PRIMARY KEY (`re_num`),
  KEY `FK_community_TO_reply_1` (`re_co_num`),
  KEY `FK_member_TO_reply_1` (`re_me_num`),
  CONSTRAINT `FK_community_TO_reply_1` FOREIGN KEY (`re_co_num`) REFERENCES `community` (`co_num`),
  CONSTRAINT `FK_member_TO_reply_1` FOREIGN KEY (`re_me_num`) REFERENCES `member` (`me_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `rp_num` int NOT NULL AUTO_INCREMENT,
  `rp_date` datetime DEFAULT NULL,
  `rp_info` longtext NOT NULL,
  `rp_me_num` int NOT NULL,
  `rp_table` varchar(20) NOT NULL,
  `rp_key` int NOT NULL,
  PRIMARY KEY (`rp_num`),
  KEY `FK_member_TO_report_1` (`rp_me_num`),
  CONSTRAINT `FK_member_TO_report_1` FOREIGN KEY (`rp_me_num`) REFERENCES `member` (`me_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_board`
--

DROP TABLE IF EXISTS `sale_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_board` (
  `sb_num` int NOT NULL AUTO_INCREMENT,
  `sb_name` varchar(40) NOT NULL,
  `sb_price` int NOT NULL,
  `sb_info` longtext,
  `sb_date` datetime NOT NULL,
  `sb_wish` int NOT NULL DEFAULT '0',
  `sb_me_num` int NOT NULL,
  `sb_ss_num` int NOT NULL DEFAULT '1',
  `sb_sc_num` int NOT NULL,
  PRIMARY KEY (`sb_num`),
  KEY `FK_member_TO_sale_board_1` (`sb_me_num`),
  KEY `FK_sale_statement_TO_sale_board_1` (`sb_ss_num`),
  KEY `FK_sale_category_TO_sale_board_1` (`sb_sc_num`),
  CONSTRAINT `FK_member_TO_sale_board_1` FOREIGN KEY (`sb_me_num`) REFERENCES `member` (`me_num`),
  CONSTRAINT `FK_sale_category_TO_sale_board_1` FOREIGN KEY (`sb_sc_num`) REFERENCES `sale_category` (`sc_num`),
  CONSTRAINT `FK_sale_statement_TO_sale_board_1` FOREIGN KEY (`sb_ss_num`) REFERENCES `sale_statement` (`ss_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_board`
--

LOCK TABLES `sale_board` WRITE;
/*!40000 ALTER TABLE `sale_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_category`
--

DROP TABLE IF EXISTS `sale_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_category` (
  `sc_num` int NOT NULL AUTO_INCREMENT,
  `sc_name` varchar(12) NOT NULL,
  PRIMARY KEY (`sc_num`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_category`
--

LOCK TABLES `sale_category` WRITE;
/*!40000 ALTER TABLE `sale_category` DISABLE KEYS */;
INSERT INTO `sale_category` VALUES (1,'수입명품'),(2,'패션의류'),(3,'패션잡화'),(4,'뷰티'),(5,'출산/육아'),(6,'모바일/태블릿'),(7,'가전제품'),(8,'노트북/PC'),(9,'카메라/캠코더'),(10,'가구/인테리어'),(11,'리빙/생활'),(12,'게임'),(13,'악기');
/*!40000 ALTER TABLE `sale_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_image`
--

DROP TABLE IF EXISTS `sale_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_image` (
  `si_num` int NOT NULL AUTO_INCREMENT,
  `si_name` varchar(12) NOT NULL,
  `si_table` varchar(20) NOT NULL,
  `si_key` int NOT NULL,
  PRIMARY KEY (`si_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_image`
--

LOCK TABLES `sale_image` WRITE;
/*!40000 ALTER TABLE `sale_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_statement`
--

DROP TABLE IF EXISTS `sale_statement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_statement` (
  `ss_num` int NOT NULL AUTO_INCREMENT,
  `ss_name` varchar(10) NOT NULL,
  PRIMARY KEY (`ss_num`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_statement`
--

LOCK TABLES `sale_statement` WRITE;
/*!40000 ALTER TABLE `sale_statement` DISABLE KEYS */;
INSERT INTO `sale_statement` VALUES (1,'판매중'),(2,'거래중'),(3,'거래완료');
/*!40000 ALTER TABLE `sale_statement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statement`
--

DROP TABLE IF EXISTS `statement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statement` (
  `st_num` int NOT NULL AUTO_INCREMENT,
  `st_name` varchar(10) NOT NULL,
  PRIMARY KEY (`st_num`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statement`
--

LOCK TABLES `statement` WRITE;
/*!40000 ALTER TABLE `statement` DISABLE KEYS */;
INSERT INTO `statement` VALUES (1,'일반'),(2,'정지'),(3,'탈퇴');
/*!40000 ALTER TABLE `statement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sugar_list`
--

DROP TABLE IF EXISTS `sugar_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sugar_list` (
  `sl_num` int NOT NULL AUTO_INCREMENT,
  `sl_sugar` int NOT NULL,
  `sl_me_num` int NOT NULL,
  PRIMARY KEY (`sl_num`),
  KEY `FK_member_TO_sugar_list_1` (`sl_me_num`),
  CONSTRAINT `FK_member_TO_sugar_list_1` FOREIGN KEY (`sl_me_num`) REFERENCES `member` (`me_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sugar_list`
--

LOCK TABLES `sugar_list` WRITE;
/*!40000 ALTER TABLE `sugar_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `sugar_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trading`
--

DROP TABLE IF EXISTS `trading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trading` (
  `tr_tq_num` int NOT NULL AUTO_INCREMENT,
  `tr_ts_state` varchar(20) NOT NULL DEFAULT '거래중',
  PRIMARY KEY (`tr_tq_num`),
  KEY `FK_trading_state_TO_Trading_1` (`tr_ts_state`),
  CONSTRAINT `FK_trading_request_TO_Trading_1` FOREIGN KEY (`tr_tq_num`) REFERENCES `trading_request` (`tq_num`),
  CONSTRAINT `FK_trading_state_TO_Trading_1` FOREIGN KEY (`tr_ts_state`) REFERENCES `trading_state` (`ts_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trading`
--

LOCK TABLES `trading` WRITE;
/*!40000 ALTER TABLE `trading` DISABLE KEYS */;
/*!40000 ALTER TABLE `trading` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trading_request`
--

DROP TABLE IF EXISTS `trading_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trading_request` (
  `tq_num` int NOT NULL AUTO_INCREMENT,
  `tq_sb_num` int NOT NULL,
  `tq_me_num` int NOT NULL,
  `tq_as_num` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`tq_num`),
  KEY `FK_sale_board_TO_trading_request_1` (`tq_sb_num`),
  KEY `FK_member_TO_trading_request_1` (`tq_me_num`),
  KEY `FK_agree_state_TO_trading_request_1` (`tq_as_num`),
  CONSTRAINT `FK_agree_state_TO_trading_request_1` FOREIGN KEY (`tq_as_num`) REFERENCES `agree_state` (`as_num`),
  CONSTRAINT `FK_member_TO_trading_request_1` FOREIGN KEY (`tq_me_num`) REFERENCES `member` (`me_num`),
  CONSTRAINT `FK_sale_board_TO_trading_request_1` FOREIGN KEY (`tq_sb_num`) REFERENCES `sale_board` (`sb_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trading_request`
--

LOCK TABLES `trading_request` WRITE;
/*!40000 ALTER TABLE `trading_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `trading_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trading_state`
--

DROP TABLE IF EXISTS `trading_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trading_state` (
  `ts_state` varchar(10) NOT NULL,
  PRIMARY KEY (`ts_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trading_state`
--

LOCK TABLES `trading_state` WRITE;
/*!40000 ALTER TABLE `trading_state` DISABLE KEYS */;
INSERT INTO `trading_state` VALUES ('거래완료'),('거래중');
/*!40000 ALTER TABLE `trading_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wish`
--

DROP TABLE IF EXISTS `wish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wish` (
  `wi_num` int NOT NULL AUTO_INCREMENT,
  `wi_me_num` int NOT NULL,
  `wi_sb_num` int NOT NULL,
  PRIMARY KEY (`wi_num`),
  KEY `FK_member_TO_wish_1` (`wi_me_num`),
  KEY `FK_sale_board_TO_wish_1` (`wi_sb_num`),
  CONSTRAINT `FK_member_TO_wish_1` FOREIGN KEY (`wi_me_num`) REFERENCES `member` (`me_num`),
  CONSTRAINT `FK_sale_board_TO_wish_1` FOREIGN KEY (`wi_sb_num`) REFERENCES `sale_board` (`sb_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wish`
--

LOCK TABLES `wish` WRITE;
/*!40000 ALTER TABLE `wish` DISABLE KEYS */;
/*!40000 ALTER TABLE `wish` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-20 15:07:09
