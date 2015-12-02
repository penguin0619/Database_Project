-- MySQL dump 10.13  Distrib 5.6.26, for Win64 (x86_64)
--
-- Host: localhost    Database: db_design_project
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
-- Table structure for table `appraiser`
--

DROP TABLE IF EXISTS `appraiser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appraiser` (
  `appraiser_code` varchar(3) NOT NULL,
  `appraiser_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`appraiser_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appraiser`
--

LOCK TABLES `appraiser` WRITE;
/*!40000 ALTER TABLE `appraiser` DISABLE KEYS */;
INSERT INTO `appraiser` VALUES ('100','PM평가'),('101','동료평가'),('102','고객평가');
/*!40000 ALTER TABLE `appraiser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approval`
--

DROP TABLE IF EXISTS `approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approval` (
  `member_no` int(11) NOT NULL,
  `project_no` int(11) NOT NULL,
  `approval_max_num` varchar(3) NOT NULL,
  `approval_checknum` varchar(2) NOT NULL,
  `approval_count` varchar(2) NOT NULL,
  `approval_detail` text NOT NULL,
  PRIMARY KEY (`member_no`,`project_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval`
--

LOCK TABLES `approval` WRITE;
/*!40000 ALTER TABLE `approval` DISABLE KEYS */;
INSERT INTO `approval` VALUES (234700,783485,'3','0','0','이것도 부탁드립니다.'),(234700,783489,'3','3','3','이렇게 해주세요'),(234700,783492,'3','3','3','이렇게 부탁드립니다.\r\n');
/*!40000 ALTER TABLE `approval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approval_status`
--

DROP TABLE IF EXISTS `approval_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approval_status` (
  `member_no` int(11) NOT NULL,
  `project_no` int(11) NOT NULL,
  `approval_select` varchar(2) NOT NULL,
  `approval_opinion` varchar(255) NOT NULL,
  PRIMARY KEY (`member_no`,`project_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_status`
--

LOCK TABLES `approval_status` WRITE;
/*!40000 ALTER TABLE `approval_status` DISABLE KEYS */;
INSERT INTO `approval_status` VALUES (234696,783489,'Y','승인합니다.'),(234696,783492,'Y','승인합니다.'),(234697,783489,'Y','승인함미이다.'),(234697,783492,'Y','승인합니다....ㄴㅇ'),(234698,783489,'Y','승인합니다.'),(234698,783492,'Y','승인합니다.');
/*!40000 ALTER TABLE `approval_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `member_no` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(50) NOT NULL,
  `member_password` varchar(100) NOT NULL,
  `member_degree` varchar(50) NOT NULL,
  `member_name` varchar(50) NOT NULL,
  `member_cellphone` varchar(20) NOT NULL,
  `member_pos_code` varchar(3) NOT NULL,
  `member_personal_id` varchar(15) NOT NULL,
  PRIMARY KEY (`member_no`),
  KEY `member_pos_code` (`member_pos_code`),
  CONSTRAINT `member_ibfk_1` FOREIGN KEY (`member_pos_code`) REFERENCES `positions` (`position_code`)
) ENGINE=InnoDB AUTO_INCREMENT=234756 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (234696,'dladnjs1','dladnjs1','박사','임원1','010-1231-3453','0','8302051851812'),(234697,'dladnjs2','dladnjs2','박사','임원2','010-5464-3453','0','8706051851812'),(234698,'dladnjs3','dladnjs3','박사','임원3','010-5634-3434','0','9002051851812'),(234699,'pm1','pm1','대졸','피엠1','010-1354-1334','1','8406111861812'),(234700,'qltj1','qltj1','고졸','비서1','010-1234-1114','2','9408222751812'),(234701,'tkdnjs1','tkdnjs1','석사','사원1','010-1230-1203','3','9201021231203'),(234702,'tkdnjs2','tkdnjs2','고졸','사원2','010-2301-2301','3','9401021203102'),(234703,'tkdnjs3','tkdnjs3','고졸','사원3','011-2301-2030','3','9010101230120'),(234704,'qkrtkdnjs','1111aaaa','석사','박사원','010-9482-7389','3','9402092222222'),(234705,'dlroqkf','dlroqkf1','고졸','이개발','010-9283-7462','3','8702221049823'),(234706,'tjroqkf','tjroqkf1','고졸','서개발','010-2384-7647','3','9103101023945'),(234707,'dksgustjs','dksgustjs1','대졸','안현선','010-9394-7274','3','9401102093847'),(234708,'rladmsdud','rladmsdud1','석사','김은영','010-9384-7278','3','9405142093848'),(234709,'yyejjin','rladPwls1','대졸','김예진','010-9141-0209','3','9402092045222'),(234710,'raldudtn','rladudtn1','박사','김영수','010-9287-3772','3','7102281092837'),(234711,'dongwon','rkdehddnjs1','박사','강동원','010-9283-4533','3','8812041029387'),(234712,'jinyong','wlsdyd1','석사','김진용','010-2837-3626','3','7803151092838'),(234713,'diddnjscjf','diddnjscjf1','대졸','양원철','010-3832-6262','3','9104281020398'),(234714,'skarlf1','skarlf1','대졸','김남길','010-9383-7266','3','8008221029383'),(234715,'rladudqls','rladudqls1','고졸','김영빈','010-2334-5566','3','6830291029287'),(234716,'dlrhkddyd','dlrhkddyd1','대졸','이광용','010-9282-7636','3','6910231298737'),(234717,'dkstjdtn','dkstjdtn1','고졸','안성수','010-2998-2737','3','9202041029287'),(234718,'skgusdud','skgusdud1','대졸','나현영','010-9837-2882','3','9302162019187'),(234719,'whdnjstlr','whdnjstlr1','석사','조원식','010-9832-7272','3','8603051029383'),(234720,'qortjdals','qortjdals1','대졸','백성민','010-2939-8877','3','9106032019838'),(234721,'rlawogks','rlawogks1','박사','김재한','010-9837-2727','3','7009301020298'),(234722,'whtndus','whtndus1','대졸','조수연','010-982-6611','3','8905112039988'),(234723,'dkswpdnjs','dkswpdnjs1','석사','안제원','010-4647-3782','3','8806081029273'),(234724,'tjwldnjs','tjwdnjs1','석사','서지원','010-9873-6366','3','8203181029337'),(234725,'thwltjq','thwltjq1','대졸','소지섭','010-1192-0304','3','8703191072728'),(234726,'fbtmdfyd','fbtmdfyd1','박사','류승룡','010-3622-7773','3','6802091029384'),(234727,'rlatngh','rlatngh1','고졸','김수호','010-3837-4773','3','9102161029383'),(234728,'dlwlgus','dlwlgus1','석사','이지현','010-3764-6473','3','8805192039484'),(234729,'wjdgkdud','wjdgkdud1','대졸','정하영','010-9387-7484','3','8907192039484'),(234730,'rlaalthd','rlaalthd1','대졸','김미송','010-9384-7565','3','9301012030484'),(234731,'rlatjdtn','rlatjdtn1','석사','김성수','010-8928-4747','3','8408081028384'),(234732,'rnjsdydwls1','rnjsdydwls1','대졸','권용진','010-2938-7474','3','8204051029387'),(234733,'rladnwls','rladnwls1','대졸','김우진','010-2856-2859','3','8806091023837'),(234734,'dlwjdrjs','dlwjdrjs1','대졸','이정건','010-2175-8592','3','8711031023809'),(234735,'rlawogus','rlawogus1','고졸','김재현','010-2998-2174','3','8807081010472'),(234736,'qkrgmlwls','qkrgmlwls1','대졸','박희진','010-3829-3759','3','8904821382905'),(234737,'rhdrlrud','rhdrlrud1','대졸','공기경','010-9292-7937','3','9203111285038'),(234738,'rlagkscjf','rlagkscjf1','대졸','김한철','010-3295-7285','3','9102191022979'),(234739,'rlaehdwn','rlaehdwn1','대졸','김동주','010-9372-9537','3','8703291382903'),(234740,'dltprb','dltprb1','석사','이세규','010-4768-2489','3','9105281389082'),(234741,'rlagudwo','rlagudwo1','대졸','김형재','010-3873-9572','3','9009871257393'),(234742,'rladnsjgh','rlawogus1','고졸','김원호','010-2397-5752','3','8503191925853'),(234743,'chldnjsdyd','chldnjsdyd1','석사','최원용','010-2892-7597','3','7806011028370'),(234744,'qotnwl','qotnwl1','대졸','배수지','010-2785-2789','3','9102082283908'),(234745,'qltj3','qltj33','대졸','비서3','010-3925-7937','2','8603171032583'),(234746,'qltj4','qltj44','대졸','비서4','010-3838-2929','2','8904182280398'),(234747,'qltj5','qltj55','대졸','비서5','010-2395-7975','2','8708312285038'),(234748,'dlehgud','dlehgud1','대졸','이도형','010-3497-8795','3','8204191382905'),(234749,'raldudghks','raldudghks1','석사','김영환','010-2379-7575','3','7802181027937'),(234750,'tlsehdwns','tlehdwns1','고졸','신동준','010-7927-5375','3','8806181328038'),(234751,'pm2','vldpa2','대졸','pm1','010-2572-9372','1','6605051375873'),(234752,'pm3','vldpa3','박사','pm3','010-3758-2753','1','5602011285093'),(234753,'pm4','vldpa4','석사','pm4','010-2375-7329','1','7601271347893'),(234754,'pm5','vldpa5','석사','pm5','010-3295-7523','1','8205061258298'),(234755,'qltj2','qltj22','고졸','비서2','010-3275-2835','2','8806092358938');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_career`
--

DROP TABLE IF EXISTS `member_career`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_career` (
  `member_no` int(11) NOT NULL,
  `before_company_name` varchar(100) NOT NULL,
  `work_at_date` date NOT NULL,
  `work_end_date` date NOT NULL,
  `position` varchar(100) NOT NULL,
  PRIMARY KEY (`member_no`,`before_company_name`),
  CONSTRAINT `member_career_ibfk_1` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_career`
--

LOCK TABLES `member_career` WRITE;
/*!40000 ALTER TABLE `member_career` DISABLE KEYS */;
INSERT INTO `member_career` VALUES (234696,'삼성','1992-06-19','2002-04-03','과장'),(234697,'명지대','2000-10-19','2010-08-03','전임교수'),(234698,'효성','1998-11-20','2006-04-03','과장'),(234699,'다음','2008-12-02','2010-06-03','과장'),(234700,'나모웹','2014-11-20','2015-04-03','비서'),(234701,'DB솔루션','2013-12-03','2015-12-01','팀원'),(234703,'LG','2015-12-01','2015-12-08','팀장'),(234704,'삼성','2014-01-01','2015-08-12','팀원'),(234705,'현대','2013-12-04','2014-12-31','팀원'),(234706,'이랜','2013-01-01','2015-01-01','팀원'),(234710,'삼성','2005-12-01','2013-12-18','팀장'),(234711,'LG','2010-12-07','2012-12-05','팀장'),(234712,'DB솔루션','2007-12-13','2015-12-17','팀원'),(234713,'나모웹','2013-12-04','2014-12-24','팀원'),(234714,'현대','2012-12-04','2015-12-30','팀장'),(234715,'빙그레','2000-01-12','2006-12-21','과장'),(234716,'네이버','2005-03-01','2013-12-31','팀장'),(234716,'다음','1998-12-15','2004-12-23','팀원'),(234716,'라인','2014-02-28','2014-12-31','대리'),(234718,'kakao','2014-09-01','2014-12-31','인턴'),(234719,'네이버','2013-03-03','2014-12-31','인턴'),(234719,'현대','2010-03-01','2010-12-31','인턴'),(234720,'LG','2014-09-01','2014-12-31','인턴'),(234720,'네이버','2015-03-01','2015-09-30','인턴'),(234721,'네이트','2013-01-01','2014-12-31','팀장'),(234721,'명지','2002-03-01','2012-12-31','팀원'),(234722,'카카오','2013-01-01','2015-11-01','팀장'),(234722,'하나카드','2010-12-01','2012-12-31','팀원'),(234723,'현대모비스','2011-01-01','2012-01-01','인턴'),(234724,'gs','2008-03-01','2010-12-31','팀원'),(234724,'효성','2011-01-01','2015-02-28','팀장'),(234725,'LG','2013-03-01','2015-10-31','팀원'),(234725,'현대모비스','2009-03-01','2012-12-31','팀원'),(234726,'롯데','2000-03-01','2005-12-31','팀원'),(234726,'삼성','2006-03-01','2013-12-31','팀장'),(234727,'네이버','2014-01-01','2014-12-31','인턴'),(234727,'넥슨','2015-01-01','2015-06-30','인턴'),(234728,'넥슨','2011-01-01','2014-12-31','인턴'),(234729,'넷마블','2012-01-01','2014-12-31','팀원'),(234730,'라인','2014-01-01','2015-09-30','인턴'),(234731,'티몬','2012-03-01','2014-12-31','팀원'),(234732,'쿠팡','2013-03-01','2014-12-31','팀원'),(234733,'하나카드','2010-03-01','2013-12-31','팀원'),(234734,'네이버','2010-03-01','2015-09-30','팀원'),(234734,'롯데','2008-03-01','2009-02-28','인턴'),(234735,'넥슨','2010-04-01','2014-12-31','팀원'),(234736,'LG','2013-03-01','2014-12-31','팀원'),(234737,'넥슨','2013-03-01','2015-11-30','팀원'),(234738,'네이버','2013-03-01','2014-12-31','팀원'),(234739,'kt','2013-01-01','2015-08-31','팀장'),(234740,'현대','2014-01-01','2015-08-31','인턴'),(234741,'nhn','2014-01-01','2015-01-01','팀원'),(234742,'삼성','2013-01-01','2015-09-29','인턴'),(234743,'넥슨','2010-01-01','2014-12-30','팀장'),(234744,'kakao','2013-03-01','2015-09-29','인턴'),(234745,'현대','2011-01-01','2015-11-30','팀원'),(234746,'롯데','2013-03-01','2014-12-31','팀원'),(234747,'nhn','2011-06-01','2014-01-31','팀원'),(234748,'skt','2010-01-01','2013-12-31','팀원'),(234749,'애플','2009-12-24','2012-10-18','팀원'),(234750,'엘지','2006-03-02','2012-12-31','인턴'),(234751,'삼성','1991-02-01','2012-12-11','부장'),(234752,'엘쥐','1987-04-01','2009-12-10','상무'),(234753,'삼성','2005-12-01','2012-12-19','팀장'),(234754,'카카오','2013-01-24','2014-08-07','pm'),(234755,'일룸','2013-01-01','2014-12-01','비서');
/*!40000 ALTER TABLE `member_career` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_history`
--

DROP TABLE IF EXISTS `member_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_history` (
  `member_no` int(11) NOT NULL,
  `project_no` int(11) NOT NULL,
  `role_no` varchar(3) NOT NULL,
  `project_start_date` date NOT NULL,
  `project_end_date` date DEFAULT NULL,
  PRIMARY KEY (`member_no`,`project_no`),
  KEY `project_no` (`project_no`),
  KEY `role_no` (`role_no`),
  CONSTRAINT `member_history_ibfk_1` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`),
  CONSTRAINT `member_history_ibfk_2` FOREIGN KEY (`project_no`) REFERENCES `project` (`project_no`),
  CONSTRAINT `member_history_ibfk_3` FOREIGN KEY (`role_no`) REFERENCES `project_role` (`role_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_history`
--

LOCK TABLES `member_history` WRITE;
/*!40000 ALTER TABLE `member_history` DISABLE KEYS */;
INSERT INTO `member_history` VALUES (234699,783492,'10','2015-12-03','2015-12-03'),(234707,783492,'12','2015-12-03','2015-12-03'),(234719,783489,'12','2015-12-03','1111-11-11'),(234722,783489,'15','2015-12-03','1111-11-11'),(234729,783492,'14','2015-12-03','2015-12-03'),(234743,783489,'14','2015-12-03','1111-11-11'),(234751,783489,'10','2015-12-03','1111-11-11');
/*!40000 ALTER TABLE `member_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_rate`
--

DROP TABLE IF EXISTS `member_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_rate` (
  `member_no` int(11) NOT NULL,
  `project_no` int(11) NOT NULL,
  `appraiser_code` varchar(3) NOT NULL,
  `appraiser_member_no` int(11) NOT NULL,
  `performance_score` int(11) NOT NULL,
  `communication_score` int(11) NOT NULL,
  `detail` text,
  PRIMARY KEY (`member_no`,`project_no`,`appraiser_code`,`appraiser_member_no`),
  KEY `appraiser_code` (`appraiser_code`),
  CONSTRAINT `member_rate_ibfk_1` FOREIGN KEY (`member_no`, `project_no`) REFERENCES `member_history` (`member_no`, `project_no`),
  CONSTRAINT `member_rate_ibfk_2` FOREIGN KEY (`appraiser_code`) REFERENCES `appraiser` (`appraiser_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_rate`
--

LOCK TABLES `member_rate` WRITE;
/*!40000 ALTER TABLE `member_rate` DISABLE KEYS */;
INSERT INTO `member_rate` VALUES (234707,783492,'100',234699,3,3,'좋습니다.!'),(234707,783492,'101',234729,0,0,''),(234707,783492,'102',234699,5,5,'좋습니다.#'),(234729,783492,'100',234699,4,5,'나쁩니다...'),(234729,783492,'101',234707,5,5,'잘했습니다.'),(234729,783492,'102',234699,3,2,'좋습니다@');
/*!40000 ALTER TABLE `member_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_skillset`
--

DROP TABLE IF EXISTS `member_skillset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_skillset` (
  `member_no` int(11) NOT NULL,
  `member_skillset` varchar(255) NOT NULL,
  KEY `member_no` (`member_no`),
  CONSTRAINT `member_skillset_ibfk_1` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_skillset`
--

LOCK TABLES `member_skillset` WRITE;
/*!40000 ALTER TABLE `member_skillset` DISABLE KEYS */;
INSERT INTO `member_skillset` VALUES (234696,'C#,'),(234697,'C++,'),(234698,'C#,'),(234699,'자바,C언어,'),(234700,'엑셀,'),(234701,'C++,C#,'),(234702,'JAVA,'),(234703,'UML,'),(234704,'java,'),(234705,'c#,'),(234707,'엑셀,c언어java,'),(234708,'java,c#,'),(234709,'c언어,'),(234710,'c#,java,Lua ,'),(234711,'html,java,c언어,'),(234712,'java,c++,html,'),(234713,'html,c언어,java,'),(234714,'java,cobol,'),(234715,'java,c++,c언어,jsp,html,'),(234716,'java,html,c언어,'),(234717,'c언어,java,'),(234718,'java,c언어,jsp,html,'),(234719,'java,html,'),(234720,'html,jsp,'),(234721,'java,ada,'),(234722,'엑셀,java,cobol,'),(234723,'java,ada,html,'),(234724,'c언어,c#,html,'),(234725,'c언어,c++,java,jsp,'),(234726,'html,java,c++,'),(234727,'c언어,jsp,java,'),(234728,'java,html,'),(234729,'html,'),(234730,'html,jsp,'),(234731,'c언어,c#,'),(234732,'java,ada,cobol,'),(234733,'html,jsp,c#,'),(234734,'java,c++,'),(234735,'java,c++,jsp,c#,'),(234736,'java,'),(234737,'java,c++,'),(234738,'c++,java,'),(234739,'java,html,'),(234740,'java,jsp,c언어,'),(234741,'java,c언어,'),(234742,'java,'),(234743,'c#,'),(234744,'html,jsp,'),(234745,'c#,'),(234746,'html,jsp,'),(234747,'java,c++,'),(234748,'html,'),(234749,'cobol,c#,'),(234750,'java,'),(234751,'java,'),(234752,'java,'),(234753,'jsp,'),(234754,'java,'),(234755,'엑셀,');
/*!40000 ALTER TABLE `member_skillset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `positions` (
  `position_code` varchar(3) NOT NULL,
  `position_type` varchar(50) NOT NULL,
  PRIMARY KEY (`position_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES ('0','임원'),('1','PM'),('2','비서'),('3','일반사원');
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `project_no` int(11) NOT NULL,
  `project_start_date` date NOT NULL,
  `project_end_date` date DEFAULT NULL,
  PRIMARY KEY (`project_no`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`project_no`) REFERENCES `project_request` (`project_request_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (783489,'2015-12-03','1111-11-11'),(783492,'2015-12-03','2015-12-03');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_request`
--

DROP TABLE IF EXISTS `project_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_request` (
  `project_request_no` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(50) NOT NULL,
  `project_company_name` varchar(50) NOT NULL,
  `project_hope_start_date` date NOT NULL,
  `project_hope_end_date` date NOT NULL,
  `project_register_date` date NOT NULL,
  `project_postcode` varchar(15) NOT NULL,
  `project_address` varchar(100) NOT NULL,
  `project_address_detail` varchar(100) NOT NULL,
  `project_contents` text NOT NULL,
  `project_status` varchar(10) NOT NULL,
  PRIMARY KEY (`project_request_no`)
) ENGINE=InnoDB AUTO_INCREMENT=783494 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_request`
--

LOCK TABLES `project_request` WRITE;
/*!40000 ALTER TABLE `project_request` DISABLE KEYS */;
INSERT INTO `project_request` VALUES (783473,'프로젝트1','두꺼비','2015-12-01','2015-12-17','2015-12-02','04417','서울 용산구 다산로 8-11 (한남동, 응봉공원 숲속 유아쉼터)','동작동 13-2호','이런세부사항입니다','대기중'),(783474,'java프로젝트','안현선컴퍼니','2014-07-01','2015-11-26','2015-12-02','06267','서울 강남구 강남대로 238 (도곡동, 스카이쏠라빌딩)','12-31','되도록 빨리 처리해주셨으면 좋겠습니다.','대기중'),(783475,'c#프로젝트','제1컴퍼니','2015-07-01','2015-12-01','2015-12-02','13467','경기 성남시 분당구 판교로 35 (운중동)','300-12','큰 프로젝트니 많은 인원들이 참여했으면 합니다.','대기중'),(783476,'c언어프로젝트','팀컴퍼니','2015-01-01','2015-06-03','2015-12-02','04403','서울 용산구 대사관로 20 (한남동)','22-33','희망날짜 이내로 해주세요','대기중'),(783477,'쇼핑몰웹프로젝트','패션컴퍼니','2009-02-04','2009-02-28','2015-12-02','04117','서울 마포구 굴레방로 1 (아현동)','제3빌딩','디자인에 신경써주세요','대기중'),(783478,'자바프로젝트','프렌치컴퍼니','2013-12-01','2014-05-01','2015-12-02','41069','대구 동구 첨단로8길 8 (신서동)','102-82','빨리 부탁드립니다.','대기중'),(783479,'jsp프로젝트1','gs컴퍼니','2004-01-01','2004-08-01','2015-12-02','04966','서울 광진구 광장로1길 6 (광장동)','267-18','디자인에도 신경써주세요','대기중'),(783480,'앱프로젝트','앱컴퍼니','2012-05-01','2012-06-01','2015-12-02','05237','서울 강동구 암사동 445-15','12-09','급한일이므로 빠른시일 내에 완성부탁드립니다. ','대기중'),(783481,'두꺼비프로젝트','두꺼비','2013-01-01','2013-06-01','2015-12-02','03307','서울 은평구 대서문길 5 (진관동)','1빌딩 501호','신경써서 해주세요','대기중'),(783482,'명지프로젝트','명지컴퍼니','2015-01-01','2016-04-01','2015-12-02','16979','경기 용인시 기흥구 갈곡로 1 (구갈동)','3빌딩 701호','많은인원 투입해주세요','대기중'),(783483,'cobol프로젝트','cococompany','2015-10-01','2016-03-01','2015-12-02','04403','서울 용산구 대사관로 34 (한남동)','1-200','cobol전문가로 투입해주세요','대기중'),(783484,'jsp프로젝트2','죠스컴퍼니','2010-12-01','2011-07-01','2015-12-02','05408','서울 강동구 성내동 449-13','101호','많은인원을 투입해주시면 감사하겠습니다.','대기중'),(783485,'c++프로젝트','씨회사','2014-09-02','2015-12-24','2015-12-02','08263','서울 구로구 경인로 5 (온수동)','1-1','많은인원투입해주세요','결재중'),(783486,'c언어프로젝트','d회사','2015-10-01','2015-12-31','2015-12-02','14240','경기 광명시 디지털로 13 (철산동, 한국빌딩)','505호','빠른시일내 완성해주세요','대기중'),(783487,'java프로젝트3','자바컴퍼니','2015-07-01','2015-12-17','2015-12-02','02646','서울 동대문구 장안벚꽃로 11 (장안동)','101길','많은인원을 투입해주세요','대기중'),(783488,'경력프로젝트','k컴퍼니','2015-01-01','2015-12-31','2015-12-02','03900','서울 마포구 하늘공원로 86 (상암동, 마포자원회수시설)','101호','특별프로젝트입니다 경력사원들을 넣어주세요','대기중'),(783489,'c언어프로젝트5','f컴퍼니','2014-01-01','2015-01-23','2015-12-02','13485','경기 성남시 분당구 판교동 629','202호','많은인원투입해주세요','진행중'),(783490,'화이트프로젝트','화이트컴퍼니','2011-10-01','2011-12-22','2015-12-02','04199','서울 마포구 환일길 21 (아현동)','20-2','깔끔하게 부탁드려요','대기중'),(783491,'db프로젝트','dblab','2015-09-01','2015-12-31','2015-12-02','08514','서울 금천구 디지털로10길 35 (가산동)','101-22','db경력자로부탁드립니다','대기중'),(783492,'ada프로젝트','ada컴퍼니','2015-05-01','2016-12-15','2015-12-02','07900','서울 양천구 화곡로 41 (신월동)','2빌딩 608호','ada경력자로부탁드립니다.','종료'),(783493,'유니크프로젝트','unique','2015-07-01','2016-08-25','2015-12-02','48504','부산 남구 유엔평화로 5 (대연동, 세원네스텔)','101-22','독특한 아이디어로 부탁드립니다.','대기중');
/*!40000 ALTER TABLE `project_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_role`
--

DROP TABLE IF EXISTS `project_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_role` (
  `role_no` varchar(3) NOT NULL DEFAULT '',
  `role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`role_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_role`
--

LOCK TABLES `project_role` WRITE;
/*!40000 ALTER TABLE `project_role` DISABLE KEYS */;
INSERT INTO `project_role` VALUES ('10','PM'),('11','PL'),('12','분석자'),('13','설계자'),('14','프로그래머'),('15','테스터');
/*!40000 ALTER TABLE `project_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-03  5:41:35
