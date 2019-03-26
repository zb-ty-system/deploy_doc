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

/*Table structure for table `contract` */

DROP TABLE IF EXISTS `contract`;

CREATE TABLE `contract` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `contract_no` varchar(32) NOT NULL COMMENT '合同编号',
  `contract_template_code` varchar(32) DEFAULT NULL COMMENT '合同模板code',
  `file_name` varchar(32) DEFAULT NULL COMMENT '文件名称',
  `biz_type` varchar(32) NOT NULL COMMENT '业务类型:P2P;B2B',
  `sale_channel` varchar(32) NOT NULL COMMENT '渠道:TXS-唐小僧 QJS-桥金所 TY-天鼋',
  `ext_serial_no` varchar(32) NOT NULL COMMENT '外部系统流水号',
  `oss_html_path` varchar(256) DEFAULT '' COMMENT '原始合同oss-htnl地址',
  `oss_pdf_path` varchar(256) DEFAULT '' COMMENT '原始合同oss-pdf地址',
  `oss_qys_path` varchar(256) DEFAULT '' COMMENT '契约锁当前签章合同地址',
  `contract_data` longtext COMMENT '合同原始数据',
  `status` varchar(32) DEFAULT 'INIT' COMMENT '当前状态:INIT-初始状态；PROCESSING-处理中；COMPLETED-完成；DISCARD-废弃;FAIL-处理失败',
  `sign_stauts` varchar(32) DEFAULT 'COMPLETE' COMMENT '签章状态:REQUIRED-待签章;SIGNING-签署中;WAITING-已签名;COMPLETE-签章完成(无需签章默认显示);REMOVE-去章;FAIL-签章失败;REMOVE-已去章',
  `version` int(11) DEFAULT '0',
  `memo` varchar(256) DEFAULT '',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(16) DEFAULT 'system',
  `modify_by` varchar(16) DEFAULT 'system',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_ext_no` (`ext_serial_no`,`biz_type`,`sale_channel`),
  UNIQUE KEY `idx_contract_no` (`contract_no`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8 COMMENT='合同';

/*Table structure for table `contract_template` */

DROP TABLE IF EXISTS `contract_template`;

CREATE TABLE `contract_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(32) NOT NULL COMMENT '模板编号',
  `biz_type` varchar(32) NOT NULL COMMENT '业务类型:P2P;B2B',
  `name` varchar(32) NOT NULL COMMENT '名称',
  `sign_total_count` int(11) DEFAULT '0' COMMENT '签章总次数',
  `content_template_name` varchar(128) DEFAULT NULL COMMENT '内容模板文件名称（一般是vm文件）',
  `is_active` varchar(16) DEFAULT 'ON' COMMENT '状态:ON-开启 OFF-关闭',
  `is_sign` varchar(16) DEFAULT 'FALSE' COMMENT '是否需要签章:FALSE-否；TRUE-是',
  `qys_template` varchar(32) DEFAULT '' COMMENT '契约锁后台模板',
  `qys_template_param` longtext COMMENT '契约锁后台模板参数',
  `memo` varchar(256) DEFAULT '' COMMENT '备注',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(32) DEFAULT 'system',
  `modify_by` varchar(32) DEFAULT 'system',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8;

/*Table structure for table `position_template` */

DROP TABLE IF EXISTS `position_template`;

CREATE TABLE `position_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `position_code` varchar(64) NOT NULL COMMENT '模板code',
  `keyword` varchar(64) DEFAULT '' COMMENT '关键字',
  `keyword_index` int(11) DEFAULT '1' COMMENT '关键字索引',
  `current_sign_order` int(11) DEFAULT '1' COMMENT '印章顺序',
  `page` int(11) DEFAULT '1' COMMENT '印章所在页码,从1开始',
  `offsetX` float DEFAULT NULL COMMENT '横坐标偏移量；默认合同页的宽为1，所以取值范围是(-1, 1)',
  `offsetY` float DEFAULT NULL COMMENT '纵坐标偏移量；默认合同页的高为1，所有取值范围是(-1, 1)',
  `acrossPagePosition` double DEFAULT NULL COMMENT '骑缝章位置:为空时不签署骑缝章',
  `is_active` varchar(32) DEFAULT 'ON' COMMENT '状态:ON-开启 OFF-关闭',
  `memo` varchar(256) DEFAULT '' COMMENT '备注',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(32) DEFAULT 'system',
  `modify_by` varchar(32) DEFAULT 'system',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='位置模板表';

/*Table structure for table `relation_template_stamper` */

DROP TABLE IF EXISTS `relation_template_stamper`;

CREATE TABLE `relation_template_stamper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `template_code` varchar(32) NOT NULL COMMENT '模板code',
  `stamper_code` varchar(32) NOT NULL COMMENT '印章code',
  `keyword` varchar(64) DEFAULT '' COMMENT '关键字',
  `keyword_index` int(11) DEFAULT '1' COMMENT '关键字索引',
  `current_sign_order` int(11) DEFAULT '1' COMMENT '印章顺序',
  `page` int(11) DEFAULT '1' COMMENT '印章所在页码,从1开始',
  `offsetX` float DEFAULT NULL COMMENT '横坐标偏移量；默认合同页的宽为1，所以取值范围是(-1, 1)',
  `offsetY` float DEFAULT NULL COMMENT '纵坐标偏移量；默认合同页的高为1，所有取值范围是(-1, 1)',
  `acrossPagePosition` double DEFAULT NULL COMMENT '骑缝章位置:为空时不签署骑缝章',
  `is_active` varchar(32) DEFAULT 'ON' COMMENT '状态:ON-开启 OFF-关闭',
  `memo` varchar(256) DEFAULT '' COMMENT '备注',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(32) DEFAULT 'system',
  `modify_by` varchar(32) DEFAULT 'system',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=495 DEFAULT CHARSET=utf8 COMMENT='模板印章关系表';

/*Table structure for table `sign_record` */

DROP TABLE IF EXISTS `sign_record`;

CREATE TABLE `sign_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `contract_no` varchar(32) NOT NULL COMMENT '合同号',
  `document_id` bigint(20) DEFAULT NULL COMMENT '签署后返回契约锁id',
  `template_code` varchar(32) DEFAULT NULL COMMENT '模板code',
  `sign_type` varchar(32) DEFAULT 'REMOTE' COMMENT '签章类型:REMOTE-远程签；LOCAL-本地签；STANDARD-标准签',
  `total_sign_sequence` int(11) DEFAULT '1' COMMENT '签章总次数',
  `current_sign_sequence` int(11) DEFAULT '1' COMMENT '当前为第几个签章',
  `oss_sign_path` varchar(1024) DEFAULT NULL COMMENT '签署合同后生成pdf,oss地址',
  `sign_again_flag` varchar(32) DEFAULT 'FALSE' COMMENT '是否重签:TRUE-是  FALSE-否',
  `status` varchar(32) DEFAULT 'COMPLETE' COMMENT '状态:COMPLETE-签章完成;REMOVE-作废;',
  `memo` varchar(512) DEFAULT '' COMMENT '备注',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(32) DEFAULT 'system',
  `modify_by` varchar(32) DEFAULT 'system',
  PRIMARY KEY (`id`),
  KEY `COMMON_INDEX` (`document_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8 COMMENT='合同签署表';

/*Table structure for table `stamper` */

DROP TABLE IF EXISTS `stamper`;

CREATE TABLE `stamper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(32) NOT NULL COMMENT '编码',
  `type` varchar(32) DEFAULT 'SEAL' COMMENT '印章类型：SEAL-公章；COMPANY-公司签署；PERSON-个人章',
  `name` varchar(64) NOT NULL COMMENT '签署方印章名称',
  `seal_id` bigint(20) DEFAULT NULL COMMENT '运营方印章在契约锁的唯一标识，此印章在契约锁云平台维护，请到契约锁云平台查看印章ID',
  `card_no` varchar(64) DEFAULT '' COMMENT '卡号',
  `register_no` varchar(64) DEFAULT '' COMMENT '注册号',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机号码',
  `e_mail` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `address` varchar(128) DEFAULT NULL COMMENT '地址',
  `seal_data` longtext COMMENT '印章图片的base64格式数据，可以由运营方自行生成，也可以调用印章接口-创建公司印章来获取，印章数据不能大于20Kb',
  `telephone` varchar(16) DEFAULT NULL COMMENT '固定电话',
  `is_active` varchar(32) DEFAULT 'ON' COMMENT '状态:ON-开启 OFF-关闭',
  `memo` varchar(256) DEFAULT '' COMMENT '备注',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(32) DEFAULT 'system',
  `modify_by` varchar(32) DEFAULT 'system',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='印章表';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
