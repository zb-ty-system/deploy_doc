/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.34 : Database - contract-center
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`contract-center` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `contract-center`;

/*Data for the table `position_template` */

insert  into `position_template`(`id`,`position_code`,`keyword`,`keyword_index`,`current_sign_order`,`page`,`offsetX`,`offsetY`,`acrossPagePosition`,`is_active`,`memo`,`create_time`,`modify_time`,`create_by`,`modify_by`) values (9,'p0001','甲方（盖章）',1,2,1,0.05,-0.1,NULL,'ON','','2018-01-26 11:14:24','2018-02-06 15:47:28','system','system'),(10,'p0002','甲方（盖章）',1,2,1,0.3,-0.04,NULL,'ON','','2018-01-26 11:14:29','2018-02-06 16:10:40','system','system'),(11,'p0003','乙方（盖章）',1,1,1,0.05,-0.1,NULL,'ON','','2018-01-26 11:14:47','2018-02-06 15:47:44','system','system'),(12,'p0004','乙方（盖章）',1,1,1,0.3,-0.04,NULL,'ON','','2018-01-26 11:14:53','2018-02-06 15:40:40','system','system');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
