/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.6.19-67.0-log : Database - ams_p2p
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ams_p2p` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ams`;

/*Data for the table `ams_global_config` */

insert  into `ams_global_config`(`id`,`group_name`,`property_name`,`property_value`,`property_desc`,`create_time`,`modify_time`) values (1,'approval_sign','asset_approval_sign','A','资产审核授权等级','2017-04-20 09:00:31','2017-04-20 09:00:31'),(2,'approval_sign','batch_asset_approval_sign','A,B','资产审核授权等级','2017-06-14 09:59:31','2017-07-03 10:34:22'),(3,'risk_switch','risk_switch','0','借款风控开关 0：关闭; 1：开启','2018-05-29 15:49:29','2018-05-29 15:49:29');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
