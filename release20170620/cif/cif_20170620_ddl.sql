/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.1.71 : Database - cif
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cif` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `cif`;

/*Table structure for table `enterprise_account` */

DROP TABLE IF EXISTS `enterprise_account`;

CREATE TABLE `enterprise_account` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_no` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '企业账户号',
  `trd_account_no` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_type` tinyint(1) NOT NULL COMMENT '账户类型',
  `member_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT 'memberId',
  `open_time` datetime NOT NULL COMMENT '开户时间',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `cancel_time` datetime DEFAULT NULL COMMENT '销户时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `enterprise_bind_card` */

DROP TABLE IF EXISTS `enterprise_bind_card`;

CREATE TABLE `enterprise_bind_card` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT 'member_id',
  `band_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '绑定Id',
  `bind_time` datetime DEFAULT NULL COMMENT '绑定时间',
  `unbind_time` datetime DEFAULT NULL COMMENT '解绑时间',
  `card_no` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '银行卡号',
  `reserve_mobile` varchar(11) COLLATE utf8_unicode_ci NOT NULL COMMENT '预留手机号',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 0：绑定中；1：已绑定；2：已解绑；3：绑定失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `enterprise_info` */

DROP TABLE IF EXISTS `enterprise_info`;

CREATE TABLE `enterprise_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `customer_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '客户ID',
  `enterprise_name` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '企业名称',
  `certificate_type` tinyint(1) NOT NULL COMMENT '企业证件类型',
  `certificate_no` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '企业证件号码',
  `certificate_expire_date` datetime DEFAULT NULL COMMENT '证件有效期',
  `phone_no` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系手机',
  `legal_person_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '企业法人姓名',
  `legal_person_certificate_type` tinyint(1) DEFAULT NULL COMMENT '企业法人证件类型',
  `legal_person_certificate_no` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '企业法人证件号码',
  `legal_person_certificate_expire_date` datetime DEFAULT NULL COMMENT '法人证件有效期',
  `enterprise_register_addr` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '企业经营地址',
  `post_code` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮政编码',
  `branch_bank_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '开户支行',
  `bank_account_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '企业银行账户名称',
  `bank_account_no` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '企业银行账号',
  `bank_account_region` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '开户行所在地区',
  `enterprise_type` int(3) DEFAULT NULL COMMENT '企业类型',
  `industry` int(3) DEFAULT NULL COMMENT '所属行业',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `modify_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  `enterprise_audit_status` tinyint(1) DEFAULT NULL COMMENT '企业审核状态：0：待审核；1：审核通过；2：审核不通过',
  `legal_person_audit_status` tinyint(1) DEFAULT NULL COMMENT '法人审核状态：0：待审核；1：审核通过；2：审核不通过',
  `enterprise_audit_comment` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '企业审核意见',
  `legal_person_audit_comment` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '法人资料审核意见',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_customer_id` (`customer_id`) USING BTREE,
  KEY `index_ent_certicate_type_no` (`certificate_type`,`certificate_no`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='企业信息表';

/*Table structure for table `enterprise_member` */

DROP TABLE IF EXISTS `enterprise_member`;

CREATE TABLE `enterprise_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '会员ID',
  `out_member_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '外部系统会员ID',
  `source` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '注册来源 唐小僧:TXS 摇旺:YW 企业理财:YELC',
  `customer_no` varchar(8) COLLATE utf8_unicode_ci NOT NULL COMMENT '商户号',
  `customer_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '客户ID',
  `trade_pwd` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '交易密码',
  `status` tinyint(1) DEFAULT NULL COMMENT '会员状态：1正常2冻结3注销',
  `grade` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '会员等级',
  `head_img_url` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '头像地址',
  `register_source` tinyint(1) DEFAULT NULL COMMENT '注册来源',
  `real_name_time` datetime DEFAULT NULL COMMENT '认证时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `modify_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_member_id` (`member_id`) USING BTREE,
  UNIQUE KEY `index_customer_no` (`customer_no`) USING BTREE,
  KEY `index_customer_id` (`customer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='企业会员表';

/*Table structure for table `enterprise_operator` */

DROP TABLE IF EXISTS `enterprise_operator`;

CREATE TABLE `enterprise_operator` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '会员ID',
  `user_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '别名',
  `password` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '登录密码',
  `mobile` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机号',
  `email` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `status` tinyint(1) DEFAULT NULL COMMENT '操作员状态：1正常2冻结3注销',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `modify_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  `last_login_time` timestamp NULL DEFAULT NULL COMMENT '最后一次登录时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_member_id_user_name` (`member_id`,`user_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='企业操作员表';

/*Table structure for table `object_maxsn` */

DROP TABLE IF EXISTS `object_maxsn`;

CREATE TABLE `object_maxsn` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '表名',
  `column_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '列明',
  `max_serial_no` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '最大流水号',
  `no_format` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '流水号格式类型',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `modify_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_table_column_name` (`table_name`,`column_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='记录最大流水号的表';

/*Table structure for table `person_account` */

DROP TABLE IF EXISTS `person_account`;

CREATE TABLE `person_account` (
  `id` bigint(22) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `trd_account_no` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '第三方电子账户',
  `account_no` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '个人账户号',
  `account_type` tinyint(1) NOT NULL COMMENT '账户类型 "1","个人虚拟账户" "2","个人电子账户"',
  `member_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT 'memberId',
  `open_time` datetime NOT NULL COMMENT '开户时间',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `cancel_time` datetime DEFAULT NULL COMMENT '销户时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `person_bind_card` */

DROP TABLE IF EXISTS `person_bind_card`;

CREATE TABLE `person_bind_card` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT 'member_id',
  `band_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '绑定Id',
  `bind_time` datetime DEFAULT NULL COMMENT '绑定时间',
  `unbind_time` datetime DEFAULT NULL COMMENT '解绑时间',
  `card_type` tinyint(1) DEFAULT NULL COMMENT '卡类型',
  `bank_code` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_no` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '银行卡号',
  `reserve_mobile` varchar(11) COLLATE utf8_unicode_ci NOT NULL COMMENT '预留手机号',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modify_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 0：绑定中；1：已绑定；2：已解绑；',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `person_info` */

DROP TABLE IF EXISTS `person_info`;

CREATE TABLE `person_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '客户ID',
  `person_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '个人姓名',
  `age` int(3) DEFAULT NULL COMMENT '年龄',
  `gender` tinyint(1) DEFAULT NULL COMMENT '性别（1男性 2女性）',
  `work` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '工作',
  `work_years` int(2) DEFAULT NULL COMMENT '工作年限',
  `common_address` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '常用地址',
  `marriager_status` tinyint(1) DEFAULT NULL COMMENT '婚姻状态（0未婚  1已婚）',
  `annual_salary` decimal(12,2) DEFAULT NULL COMMENT '年收入',
  `certificate_type` tinyint(1) DEFAULT NULL COMMENT '认证类型',
  `certificate_no` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '认证号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `modify_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_customer_id` (`customer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='个人会员信息表';

/*Table structure for table `person_member` */

DROP TABLE IF EXISTS `person_member`;

CREATE TABLE `person_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '会员ID',
  `out_member_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '外部系统的会员ID',
  `customer_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户ID',
  `source` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '注册来源 唐小僧:TXS 摇旺:YW 企业理财:YELC',
  `phone_no` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系手机',
  `email` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `nick_name` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '昵称',
  `user_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '别名',
  `password` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密码',
  `trade_pwd` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '交易密码',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态：1正常2冻结3注销',
  `head_img_url` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户图像',
  `register_source` tinyint(1) DEFAULT '1' COMMENT '注册来源：1pc 2Android 3ios',
  `grade` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '会员等级',
  `real_name_time` datetime DEFAULT NULL COMMENT '实名时间',
  `last_login_time` timestamp NULL DEFAULT NULL COMMENT '最后登入时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `modify_by` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_member_id` (`member_id`) USING BTREE,
  UNIQUE KEY `index_out_member_id_source` (`out_member_id`,`source`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='个人会员表';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
