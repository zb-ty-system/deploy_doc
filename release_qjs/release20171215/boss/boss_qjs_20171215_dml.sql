/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.6.19-67.0-log : Database - boss
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`boss` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `boss`;

/*Data for the table `template` */

INSERT INTO `template`
            (`id`,
             `template_no`,
             `template_name`,
             `template_content`,
             `create_time`,
             `create_by`,
             `modify_time`,
             `modify_by`)
VALUES (1,
        '',
        '侨金所新手标',
        '{\"name\":\"侨金所新手标\",\"showName\":\"新手标\",\"increaseAmount\":\"100\",\"minInvestAmount\":\"1000\",\"riskLevel\":\"1\",\"productName\":\"\",\"productDisplayName\":\"\",\"reservationAmount\":\"\",\"assetPoolType\":\"3\",\"saleChannelCode\":\"\",\"patternCode\":\"定期\",\"calendarMode\":\"20\",\"productLineCode\":\"021711002\",\"describe\":\"适用于新手标\"}',
        '2017-11-16 14:36:35',
        'SYS',
        '2017-11-21 15:45:19',
        'SYS'),
       (2,
        '',
        '智富30',
        '{\"name\":\"智富30\",\"showName\":\"智富30\",\"increaseAmount\":\"100\",\"minInvestAmount\":\"1000\",\"riskLevel\":\"1\",\"productName\":\"\",\"productDisplayName\":\"\",\"reservationAmount\":\"\",\"assetPoolType\":\"3\",\"saleChannelCode\":\"\",\"patternCode\":\"定期\",\"calendarMode\":\"20\",\"productLineCode\":\"021711004\",\"describe\":\"适用于智富系列 30天定期产品\"}',
        '2017-11-16 14:38:18',
        'SYS',
        '2017-11-21 15:45:36',
        'SYS'),
       (3,
        '',
        '智富60',
        '{\"name\":\"智富60\",\"showName\":\"智富60\",\"increaseAmount\":\"100\",\"minInvestAmount\":\"1000\",\"riskLevel\":\"1\",\"productName\":\"\",\"productDisplayName\":\"\",\"reservationAmount\":\"\",\"assetPoolType\":\"3\",\"saleChannelCode\":\"\",\"patternCode\":\"定期\",\"calendarMode\":\"20\",\"productLineCode\":\"021711004\",\"describe\":\"适用于智富系列 60天定期产品\"}',
        '2017-11-16 14:38:39',
        'SYS',
        '2017-11-21 15:45:47',
        'SYS'),
       (4,
        '',
        '智盈90',
        '{\"name\":\"智盈90\",\"showName\":\"智盈90\",\"increaseAmount\":\"100\",\"minInvestAmount\":\"1000\",\"riskLevel\":\"1\",\"productName\":\"\",\"productDisplayName\":\"\",\"reservationAmount\":\"\",\"assetPoolType\":\"3\",\"saleChannelCode\":\"\",\"patternCode\":\"定期\",\"calendarMode\":\"20\",\"productLineCode\":\"021711003\",\"describe\":\"适用于智盈系列 90天定期产品\"}',
        '2017-11-16 14:39:05',
        'SYS',
        '2017-11-21 15:45:59',
        'SYS'),
       (5,
        '',
        '智盈180',
        '{\"name\":\"智盈180\",\"showName\":\"智盈180\",\"increaseAmount\":\"100\",\"minInvestAmount\":\"1000\",\"riskLevel\":\"1\",\"productName\":\"\",\"productDisplayName\":\"\",\"reservationAmount\":\"\",\"assetPoolType\":\"3\",\"saleChannelCode\":\"\",\"patternCode\":\"定期\",\"calendarMode\":\"20\",\"productLineCode\":\"021711003\",\"describe\":\"适用于智盈系列 180天定期产品\"}',
        '2017-11-16 14:39:20',
        'SYS',
        '2017-11-21 15:46:08',
        'SYS'),
       (6,
        '',
        '智汇270',
        '{\"name\":\"智汇270\",\"showName\":\"智汇270\",\"increaseAmount\":\"100\",\"minInvestAmount\":\"1000\",\"riskLevel\":\"1\",\"productName\":\"\",\"productDisplayName\":\"\",\"reservationAmount\":\"\",\"assetPoolType\":\"3\",\"saleChannelCode\":\"\",\"patternCode\":\"定期\",\"calendarMode\":\"20\",\"productLineCode\":\"021711001\",\"describe\":\"适用于智汇系列 270天定期产品\"}',
        '2017-11-16 14:39:44',
        'SYS',
        '2017-11-21 15:46:17',
        'SYS'),
       (7,
        '',
        '智汇360',
        '{\"name\":\"智汇360\",\"showName\":\"智汇360\",\"increaseAmount\":\"100\",\"minInvestAmount\":\"1000\",\"riskLevel\":\"1\",\"productName\":\"\",\"productDisplayName\":\"\",\"reservationAmount\":\"\",\"assetPoolType\":\"3\",\"saleChannelCode\":\"\",\"patternCode\":\"定期\",\"calendarMode\":\"20\",\"productLineCode\":\"021711001\",\"describe\":\"适用于智汇系列 360天定期产品\"}',
        '2017-11-16 14:39:57',
        'SYS',
        '2017-11-21 15:46:24',
        'SYS'),
       (8,
        NULL,
        '空置模板',
        '{\"name\":\"空置模板\",\"showName\":\"\",\"increaseAmount\":\"\",\"minInvestAmount\":\"\",\"riskLevel\":\"\",\"productName\":\"\",\"productDisplayName\":\"\",\"reservationAmount\":\"\",\"assetPoolType\":\"\",\"saleChannelCode\":\"\",\"patternCode\":\"\",\"calendarMode\":\"\",\"productLineCode\":\"\",\"describe\":\"目前可用于复投类产品\"}',
        '2017-11-21 15:46:52',
        'SYS',
        '2017-11-21 15:55:36',
        'SYS');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
