CREATE DATABASE  IF NOT EXISTS `IOS_toon` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `IOS_toon`;
-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: localhost    Database: IOS_toon
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `Buy`
--

DROP TABLE IF EXISTS `Buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Buy` (
  `CCode` int(11) NOT NULL,
  `UEmail` varchar(45) NOT NULL,
  `Ecode` varchar(45) DEFAULT NULL,
  `BPrice` varchar(45) DEFAULT NULL,
  `BPayment` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CCode`,`UEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Buy`
--

LOCK TABLES `Buy` WRITE;
/*!40000 ALTER TABLE `Buy` DISABLE KEYS */;
/*!40000 ALTER TABLE `Buy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Content`
--

DROP TABLE IF EXISTS `Content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Content` (
  `CCode` varchar(11) NOT NULL,
  `CTitle` varchar(45) DEFAULT NULL,
  `CAuthor` varchar(45) DEFAULT NULL,
  `CGenre` varchar(45) DEFAULT NULL,
  `CCoverImage` varchar(10000) DEFAULT NULL,
  `CViewCount` varchar(45) DEFAULT NULL,
  `CDeleteDate` varchar(45) DEFAULT NULL,
  `CInsertDate` varchar(45) DEFAULT NULL,
  `CSubTitle` varchar(1000) DEFAULT NULL,
  `CEpisode` varchar(45) DEFAULT NULL,
  `CContentImage1` varchar(45) DEFAULT NULL,
  `CContentImage2` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CCode`),
  UNIQUE KEY `CCode_UNIQUE` (`CCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Content`
--

LOCK TABLES `Content` WRITE;
/*!40000 ALTER TABLE `Content` DISABLE KEYS */;
INSERT INTO `Content` VALUES ('1','원피스','오다 에이치로','모험','https://1.bp.blogspot.com/-iPEopZqtUNA/WqlBILuZvgI/AAAAAAAAYco/Cxa2791vzzQdOThAwQ1udMySCOxAVndhACLcBGAs/s1600/001.jpg','1002','55555','5555','http://blog.naver.com/PostView.nhn?blogId=gkswowls9468&logNo=221295506220&parentCategoryNo=&categoryNo=21&viewDate=&isShowPopularPosts=true&from=search','admin','Y','55555'),('10','보노보노','이가라시 미키오','일상','http://image.yes24.com/momo/TopCate1865/MidCate003/186421229.jpg','3244','5555','5555','Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.','admin','Y','55555'),('11','외계행성 다방유랑기','탠바케이크','판타지','https://image.slidesharecdn.com/thecreatorproject-131120121653-phpapp02/95/the-creator-project-1-638.jpg?cb=1422511512','3',NULL,NULL,NULL,'ddd','Y',NULL),('12','영화볼까','도영','로맨스','https://image.slidesharecdn.com/thecreatorproject-131120121653-phpapp02/95/the-creator-project-1-638.jpg?cb=1422511512','3',NULL,NULL,NULL,'ddd','N',NULL),('13','창작물','ddd','모름','https://lh3.googleusercontent.com/proxy/uloenDkEWLsDFltJePFHN-tu7cUqLF7kQipdPmJg1p6Jh1YlGyKofjfeZhSqnfWbBgkZBfA6w6O18uvmYglJ0skAJ97FwIuAsZXYhTler4IlqCoH6wQ','3',NULL,NULL,NULL,'aaa','Y',NULL),('14','창작물','ddd','모름','https://lh3.googleusercontent.com/proxy/uloenDkEWLsDFltJePFHN-tu7cUqLF7kQipdPmJg1p6Jh1YlGyKofjfeZhSqnfWbBgkZBfA6w6O18uvmYglJ0skAJ97FwIuAsZXYhTler4IlqCoH6wQ','3',NULL,NULL,NULL,'aaa','N',NULL),('15','창작물','ddd','모름','https://lh3.googleusercontent.com/proxy/uloenDkEWLsDFltJePFHN-tu7cUqLF7kQipdPmJg1p6Jh1YlGyKofjfeZhSqnfWbBgkZBfA6w6O18uvmYglJ0skAJ97FwIuAsZXYhTler4IlqCoH6wQ','3',NULL,NULL,NULL,'aaa','Y',NULL),('16','창작물','ddd','모름','https://lh3.googleusercontent.com/proxy/uloenDkEWLsDFltJePFHN-tu7cUqLF7kQipdPmJg1p6Jh1YlGyKofjfeZhSqnfWbBgkZBfA6w6O18uvmYglJ0skAJ97FwIuAsZXYhTler4IlqCoH6wQ','3',NULL,NULL,NULL,'aaa','N',NULL),('2','원펀맨','ONE','격투','http://toonimage.angle777899.com/small/8059.jpg','23423','55555','5555','5555','admin','Y','55555'),('3','이누야샤','타카하시 루미코','시대','https://youth.sangju.go.kr/fileUpload/contentsboard/book_00072.jpg','4234','55555','5555','5555','admin','Y','55555'),('4','귀멸의 칼날','코토게 코요하루','시대','https://image.aladin.co.kr/product/18116/28/cover500/ek48253175_3.jpg','3424','55555','5555','5555','admin','Y','55555'),('5','체인소맨','후지모토 타츠키','개그','http://image.yes24.com/momo/TopCate0001/kepub/X_1216483.jpg','11233','5555','5555','5555','admin','Y','55555'),('6','진격의거인','이시야마 하지메','액션','https://image.aladin.co.kr/product/3545/14/cover500/6000693408_1.jpg','3242','5555','5555','5555','admin','Y','55555'),('7','약속의네버랜드','시라이 카이우','판타지','https://image.aladin.co.kr/product/13865/94/cover500/k022532324_1.jpg','24234','5555','5555','5555','admin','Y','55555'),('8','나루토','키시모토 마사시','액션','https://image.aladin.co.kr/product/226/19/cover500/8925229102_1.jpg','6756','5555','5555','5555','admin','Y','55555'),('9','암살교실','마츠이 유세이','SF','https://image.aladin.co.kr/product/5337/0/cover500/1125604344_1.jpg','5555','5555','5555','5555','admin','Y','55555');
/*!40000 ALTER TABLE `Content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Episode`
--

DROP TABLE IF EXISTS `Episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Episode` (
  `ECode` int(11) NOT NULL,
  `CCode` varchar(45) NOT NULL,
  `EContentImage1` varchar(500) DEFAULT NULL,
  `EContentImage2` varchar(500) DEFAULT NULL,
  `EContentImage3` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ECode`,`CCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Episode`
--

LOCK TABLES `Episode` WRITE;
/*!40000 ALTER TABLE `Episode` DISABLE KEYS */;
INSERT INTO `Episode` VALUES (1,'1','http://www.batoon3.net/bbs/board.php?bo_table=toons&table=toons&wr_id=446217&is=9780','1-1-2','1-1-3'),(1,'10','http://www.batoon3.net/bbs/board.php?bo_table=toons&table=toons&wr_id=126713&is=5725','10-1-2','10-1-3'),(1,'11','https://signfang-and-jumsoon.postype.com/post/9369782',NULL,NULL),(1,'12','https://doyoungsome.postype.com/post/9262069',NULL,NULL),(1,'4','http://www.batoon3.net/bbs/board.php?bo_table=toons&table=toons&wr_id=108545&is=9478','1','1'),(1,'7','http://batoon3.net/bbs/board.php?bo_table=toons&table=toons&wr_id=174036&is=8147','1','1'),(2,'1','http://www.batoon3.net/bbs/board.php?bo_table=toons&table=toons&wr_id=446216&is=9780','1-1-3','1-1-3'),(2,'10','http://www.batoon3.net/bbs/board.php?bo_table=toons&table=toons&wr_id=126712&is=5725&cid=','10-2-2-','10-2-3'),(2,'11','https://signfang-and-jumsoon.postype.com/post/9369797',NULL,NULL),(2,'12','https://doyoungsome.postype.com/post/9262130',NULL,NULL),(2,'4','http://www.batoon3.net/bbs/board.php?bo_table=toons&table=toons&wr_id=108544&is=9478&cid=','1','1'),(2,'7','http://batoon3.net/bbs/board.php?bo_table=toons&table=toons&wr_id=174035&is=8147','1','1'),(3,'1','http://www.batoon3.net/bbs/board.php?bo_table=toons&table=toons&wr_id=111332&is=9780','1-1-3','1-1-3'),(3,'10','http://www.batoon3.net/bbs/board.php?bo_table=toons&table=toons&wr_id=126711&is=5725&cid=','10-1-1','10-1-1'),(3,'11','https://signfang-and-jumsoon.postype.com/post/9369802',NULL,NULL),(3,'12','https://doyoungsome.postype.com/post/9262139',NULL,NULL),(3,'4','http://www.batoon3.net/bbs/board.php?bo_table=toons&table=toons&wr_id=108543&is=9478&cid=','1','1'),(3,'7','http://batoon3.net/bbs/board.php?bo_table=toons&table=toons&wr_id=174034&is=8147&cid=','1','1'),(4,'1','http://www.batoon3.net/bbs/board.php?bo_table=toons&table=toons&wr_id=446214&is=9780','1-1-3','1-1-3'),(4,'10','http://www.batoon3.net/bbs/board.php?bo_table=toons&table=toons&wr_id=126710&is=5725&cid=','10-1-1','10-1-1'),(4,'12','https://doyoungsome.postype.com/post/9285036',NULL,NULL),(4,'4','http://www.batoon3.net/bbs/board.php?bo_table=toons&table=toons&wr_id=108542&is=9478&cid=','1','1'),(4,'7','http://batoon3.net/bbs/board.php?bo_table=toons&table=toons&wr_id=174033&is=8147&cid=','1','1'),(5,'1','http://www.batoon3.net/bbs/board.php?bo_table=toons&table=toons&wr_id=446213&is=9780','11','111'),(5,'4','http://www.batoon3.net/bbs/board.php?bo_table=toons&table=toons&wr_id=108541&is=9478&cid=','1','1'),(5,'7','http://www.batoon3.net/bbs/board.php?bo_table=toons&table=toons&wr_id=174032&is=8147','1','1'),(6,'1','http://www.batoon3.net/bbs/board.php?bo_table=toons&table=toons&wr_id=446212&is=9780','1-1-3','1-1-3'),(6,'7','http://www.batoon3.net/bbs/board.php?bo_table=toons&table=toons&wr_id=174031&is=8147&cid=','1','1'),(7,'1','http://www.batoon3.net/bbs/board.php?bo_table=toons&table=toons&wr_id=446211&is=9780','1-1-3','1-1-3'),(7,'7','http://www.batoon3.net/bbs/board.php?bo_table=toons&table=toons&wr_id=174030&is=8147&cid=','1','1'),(8,'1','http://www.batoon3.net/bbs/board.php?bo_table=toons&table=toons&wr_id=446210&is=9780','1-1-3','1-1-3'),(8,'7','http://www.batoon3.net/bbs/board.php?bo_table=toons&table=toons&wr_id=174029&is=8147&cid=','1','1'),(9,'7','http://www.batoon3.net/bbs/board.php?bo_table=toons&table=toons&wr_id=174028&is=8147&cid=','1','1'),(10,'7','http://www.batoon3.net/bbs/board.php?bo_table=toons&table=toons&wr_id=174027&is=8147&cid=','1','1');
/*!40000 ALTER TABLE `Episode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Liked`
--

DROP TABLE IF EXISTS `Liked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Liked` (
  `UEmail` varchar(45) NOT NULL,
  `CCode` varchar(11) NOT NULL,
  `LCode` varchar(45) NOT NULL,
  PRIMARY KEY (`UEmail`,`CCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Liked`
--

LOCK TABLES `Liked` WRITE;
/*!40000 ALTER TABLE `Liked` DISABLE KEYS */;
INSERT INTO `Liked` VALUES ('aaa','10','1'),('ddd','1','1'),('ddd','11','1'),('ddd','2','1'),('ddd','3','0');
/*!40000 ALTER TABLE `Liked` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Review`
--

DROP TABLE IF EXISTS `Review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Review` (
  `RCode` varchar(45) NOT NULL,
  `CCode` int(11) NOT NULL,
  `UEmail` varchar(45) NOT NULL,
  `RContent` varchar(45) DEFAULT NULL,
  `RInsertDate` varchar(45) DEFAULT NULL,
  `RDeleteDate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`RCode`,`CCode`,`UEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Review`
--

LOCK TABLES `Review` WRITE;
/*!40000 ALTER TABLE `Review` DISABLE KEYS */;
INSERT INTO `Review` VALUES ('1',1,'원피스','재밌어요!','2021.01.11','2021.01.11'),('10',1,'ㅇㄴㄹ','개노잼 이딴거 보지마라','2021.02.25','2021.11'),('10',6,'aaa','재밌어요!','2021.02.25','2021.11'),('11',6,'aaa','재밌어요!','2021.01.11','2021.01.11'),('12',1,'11','재밌어요!','2021.02.25','2021.11'),('13',10,'aaa','재밌어요!','2021.01.11','2021.01.11'),('14',2,'aaa','재밌어요!','2021.02.25','2021.11'),('15',3,'aaa','재밌어요!','2021.01.11','2021.01.11'),('16',4,'aaa','재밌어요!','2021.02.25','2021.11'),('17',7,'약네랜','재밌어요!','2021.01.11','2021.01.11'),('18',8,'aaa','개노잼 이딴거 보지마라','2021.02.25','2021.11'),('19',8,'aaa','재밌어요!','2021.01.11','2021.01.11'),('2',1,'1','개노잼 이딴거 보지마라','2021.02.25','2021.11'),('3',7,'aaa','재밌어요!','2021.01.11','2021.01.11'),('4',10,'aaa','개노잼 이딴거 보지마라','2021.02.25','2021.11'),('5',10,'aaa','재밌어요!','2021.01.11','2021.01.11'),('6',10,'aaa','개노잼 이딴거 보지마라','2021.02.25','2021.11'),('7',7,'aaa','재밌어요!','2021.01.11','2021.01.11'),('8',5,'aaa','개노잼 이딴거 보지마라','2021.02.25','2021.11'),('9',5,'aaa','재밌어요!','2021.01.11','2021.01.11');
/*!40000 ALTER TABLE `Review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `UEmail` varchar(50) NOT NULL,
  `UName` varchar(45) DEFAULT NULL,
  `UTel` varchar(45) DEFAULT NULL,
  `UPostcode` varchar(45) DEFAULT NULL,
  `UAddr` varchar(45) DEFAULT NULL,
  `UPassword` varchar(45) DEFAULT NULL,
  `UPasswordCheck` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`UEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES ('1111@fsdf.fsdf','123','ㅂㅈㄷㅂ','1212ㄷ','ㅂㅈㅂㅈㄷ','aaaa1111','aaaa1111'),('asdasda@naver.com','1','1','1','1','1111aaaa','1111aaaa'),('ddd','aa','aa','aaaa','aaa','aaa','1111');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-24 13:49:30
