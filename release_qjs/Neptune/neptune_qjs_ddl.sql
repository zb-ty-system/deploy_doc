/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.19-67.0-log : Database - neptune
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`neptune` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `neptune`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `member_id` varchar(64) DEFAULT NULL COMMENT '平台用户ID',
  `sale_channel` varchar(32) DEFAULT NULL COMMENT '渠道 TXS-唐小僧',
  `product_code` varchar(32) DEFAULT NULL COMMENT '产品代码',
  `total_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '累计总本金',
  `total_income` decimal(16,4) DEFAULT '0.0000' COMMENT '累计总收益',
  `version` int(11) DEFAULT '1' COMMENT '版本号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `modify_by` varchar(32) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mIdsChannelPcode` (`member_id`,`sale_channel`,`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3757 DEFAULT CHARSET=utf8 COMMENT='账户表';

/*Table structure for table `batch` */

DROP TABLE IF EXISTS `batch`;

CREATE TABLE `batch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(16) DEFAULT NULL COMMENT '//产品流标FAILURE,//匹配MATCH,//放款LOAN,//合同CONTRACT,//兑付计划CASHPLAN,//每日收益INCOME,//兑付CASH//逾期兑付OVERDUECASH',
  `status` varchar(32) DEFAULT NULL COMMENT 'INIT PROCESSING COMPLETE FAIL',
  `product_code` varchar(64) DEFAULT NULL COMMENT '产品编号',
  `version` int(11) DEFAULT '1',
  `memo` varchar(218) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) DEFAULT 'system',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `modify_by` varchar(64) DEFAULT 'system',
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `sale_channel` varchar(32) DEFAULT NULL COMMENT '渠道 QJS 侨金所',
  `total_amount` decimal(16,4) DEFAULT NULL,
  `set_up_type` varchar(32) DEFAULT NULL COMMENT '自动成立：AUTO_SETUP,部分成立：PART_SETUP',
  `record_count` int(11) DEFAULT '0',
  `retry_times` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `productAndType` (`type`,`product_code`),
  KEY `pCodeTypeStatusIndex` (`type`,`status`,`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=416 DEFAULT CHARSET=utf8 COMMENT='批次表';

/*Table structure for table `cash_record` */

DROP TABLE IF EXISTS `cash_record`;

CREATE TABLE `cash_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `app_sheet_no` varchar(64) DEFAULT NULL COMMENT '投资申请号',
  `ext_order_no` varchar(64) DEFAULT NULL COMMENT '外部系统订单号',
  `product_code` varchar(64) NOT NULL COMMENT '产品代码',
  `member_id` varchar(64) NOT NULL COMMENT '平台用户ID',
  `sale_channel` varchar(8) NOT NULL COMMENT '渠道 唐小僧 TXS|企业理财QYLIC|摇旺YW',
  `amount` decimal(16,4) DEFAULT NULL COMMENT '本金',
  `income` decimal(16,4) DEFAULT NULL COMMENT '收益',
  `cash_amount` decimal(16,4) DEFAULT NULL COMMENT '兑付总金额',
  `expect_cash_date` date DEFAULT NULL COMMENT '预计兑付日期',
  `cash_time` datetime DEFAULT NULL COMMENT '发起兑付时间',
  `pay_no` varchar(64) DEFAULT NULL COMMENT '支付流水号',
  `actual_cash_time` datetime DEFAULT NULL COMMENT '实际兑付时间',
  `sign_id` varchar(64) DEFAULT NULL COMMENT '投资人签约协议号',
  `cash_ref_no` varchar(64) DEFAULT NULL COMMENT '兑付流水号',
  `memo` varchar(256) DEFAULT NULL,
  `status` varchar(16) DEFAULT NULL COMMENT 'INIT:待处理；CASHING:兑付中；CASH_SUCCESS:兑付成功；CASH_FAIL:兑付失败；OVERDUE:逾期',
  `version` int(11) DEFAULT '1',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(32) DEFAULT 'system',
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modify_by` varchar(32) DEFAULT 'system',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cash_appSheetNo` (`app_sheet_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5602 DEFAULT CHARSET=utf8 COMMENT='投资人兑付表';

/*Table structure for table `contract` */

DROP TABLE IF EXISTS `contract`;

CREATE TABLE `contract` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `contract_no` varchar(64) DEFAULT NULL COMMENT '合同编号',
  `app_sheet_no` varchar(64) DEFAULT NULL COMMENT '交易系统订单号',
  `sale_channel` varchar(64) DEFAULT NULL COMMENT '投资渠道:TXS-唐小僧  ',
  `product_code` varchar(64) DEFAULT NULL COMMENT '产品编码',
  `product_name` varchar(64) DEFAULT NULL COMMENT '产品名称',
  `product_collect_amount` decimal(20,2) DEFAULT '0.00' COMMENT '产品募集金额',
  `product_invest_min_amount` decimal(20,2) DEFAULT '0.00' COMMENT '产品起购金额',
  `increase_amount` decimal(20,2) DEFAULT '0.00' COMMENT '步长',
  `asset_code` varchar(64) DEFAULT NULL COMMENT '资产编码',
  `asset_name` varchar(64) DEFAULT NULL COMMENT '资产名称',
  `invest_amount` decimal(16,2) DEFAULT '0.00' COMMENT '投资金额(元)',
  `invest_year_yield` decimal(12,8) DEFAULT '0.00000000' COMMENT '投资年化收益率',
  `invest_lock_date` int(11) DEFAULT '0' COMMENT '投资期限(天)',
  `invest_start_date` date DEFAULT NULL COMMENT '起息日',
  `invest_end_date` date DEFAULT NULL COMMENT '到期日',
  `investor_member_id` varchar(64) DEFAULT NULL COMMENT '投资人会员id',
  `investor_member_name` varchar(64) DEFAULT NULL COMMENT '投资人姓名',
  `investor_identity_card` varchar(64) DEFAULT NULL COMMENT '投资人身份证号码',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '生成时间',
  `investor_bank_account_name` varchar(64) DEFAULT NULL COMMENT '投资人银行账户户名',
  `investor_opening_bank` varchar(128) DEFAULT NULL COMMENT '投资人银行账户开户行',
  `investor_bank_card_no` varchar(64) DEFAULT NULL COMMENT '投资人银行账号',
  `issuer` varchar(128) DEFAULT NULL COMMENT '发行方',
  `issuer_legal_person` varchar(32) DEFAULT NULL COMMENT '发行方法人',
  `issuer_address` varchar(255) DEFAULT NULL COMMENT '发行方地址',
  `issuer_tel` varchar(32) DEFAULT NULL COMMENT '发行方联系电话',
  `asset_register_name` varchar(200) DEFAULT NULL COMMENT '资产备案名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_contract_no` (`contract_no`),
  UNIQUE KEY `uni_app_sheet_no` (`app_sheet_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='合同';

/*Table structure for table `daily_income` */

DROP TABLE IF EXISTS `daily_income`;

CREATE TABLE `daily_income` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `account_id` varchar(64) DEFAULT NULL COMMENT '交易账号',
  `product_code` varchar(64) DEFAULT NULL COMMENT '产品code',
  `app_sheet_no` varchar(64) DEFAULT NULL COMMENT 'TA投资记录流水号',
  `interest_amount` decimal(16,4) DEFAULT NULL COMMENT '计息本金',
  `income` decimal(16,4) DEFAULT NULL COMMENT '收益',
  `income_date` date DEFAULT NULL COMMENT '收益日期',
  `ext_order_no` varchar(64) DEFAULT NULL COMMENT '外部订单号',
  `member_id` varchar(64) DEFAULT NULL,
  `sale_channel` varchar(8) DEFAULT NULL COMMENT '渠道 |侨金所QJS',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(64) DEFAULT NULL,
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `modify_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_income_date` (`income_date`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='每日收益';

/*Table structure for table `invest` */

DROP TABLE IF EXISTS `invest`;

CREATE TABLE `invest` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_sheet_no` varchar(64) DEFAULT NULL COMMENT '交易系统流水号',
  `ext_order_no` varchar(64) DEFAULT NULL COMMENT '外部系统订单号',
  `member_id` varchar(64) DEFAULT NULL COMMENT '会员ID',
  `member_name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `cert_no` varchar(32) DEFAULT NULL COMMENT '证件号',
  `product_code` varchar(64) DEFAULT NULL COMMENT '产品编码',
  `product_name` varchar(64) DEFAULT NULL COMMENT '产品名称',
  `invest_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '投资金额',
  `sale_channel` varchar(32) DEFAULT NULL COMMENT '渠道:TXS-唐小僧',
  `order_time` datetime DEFAULT NULL COMMENT '下单时间',
  `status` varchar(32) DEFAULT 'MATCH_INIT' COMMENT '状态:MATCH_INIT-匹配中;MATCH_SUCCESS-匹配成功;MATCH_FAIL-流标',
  `cash_flag` varchar(8) DEFAULT 'FALSE' COMMENT '兑付标志：FALSE-未生成兑付计划；TRUE-已生成兑付计划;',
  `interest_flag` varchar(8) DEFAULT 'FALSE' COMMENT '收益计算标志,FALSE:未生成,TRUE:已生成',
  `version` int(11) DEFAULT '1',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(64) DEFAULT NULL,
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modify_by` varchar(64) DEFAULT NULL,
  `investor_bank_account_name` varchar(64) DEFAULT NULL COMMENT '投资人银行账户户名',
  `investor_opening_bank` varchar(128) DEFAULT NULL COMMENT '投资人银行账户开户行',
  `investor_bank_card_no` varchar(64) DEFAULT NULL COMMENT '投资人银行账号',
  `sign_id` varchar(64) DEFAULT NULL COMMENT '投资人签约协议号',
  `match_flag` varchar(8) DEFAULT 'FALSE' COMMENT '匹配标志:FALSE-未生成；TRUE-已生成;',
  `loan_flag` varchar(8) DEFAULT 'FALSE' COMMENT '放款标志:FALSE-未生成；TRUE-已生成;',
  `mobile_no` varchar(32) DEFAULT NULL COMMENT '手机号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `appSheetNoIndex` (`app_sheet_no`),
  UNIQUE KEY `extOrderNoIndex` (`ext_order_no`),
  KEY `productAndStatusIndex` (`product_code`,`status`),
  KEY `pssmIndex` (`product_code`,`sale_channel`,`status`,`match_flag`),
  KEY `psslIndex` (`product_code`,`sale_channel`,`status`,`loan_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COMMENT='投资表';

/*Table structure for table `invoke_error` */

DROP TABLE IF EXISTS `invoke_error`;

CREATE TABLE `invoke_error` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `business_no` varchar(64) DEFAULT NULL COMMENT '流水号,做幂等控制',
  `business_type` varchar(64) DEFAULT NULL COMMENT '业务类型 PRODUCT_SETUP,通知产品成立,PRODUCT_FAILURE,通知流标,AMS_ASSET_OCCUPY,通知AMS资产占用,LOAN_PAYMENT,通知放款,PRODUCT_CASH,通知产品兑付,ORDER_CASH,通知订单兑付,PAY_CASH,通知支付开始兑付;',
  `request` longtext COMMENT '接口请求参数',
  `response` longtext COMMENT '接口响应参数',
  `status` varchar(32) DEFAULT 'INIT' COMMENT '处理状态：INIT(INIT:初始化),SUCCESS("SUCCESS","处理成功"), FAILURE("FAILURE","处理失败")',
  `retry_times` int(11) DEFAULT '0' COMMENT '重试次数',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_by` varchar(32) DEFAULT 'system' COMMENT '创建人',
  `modify_by` varchar(32) DEFAULT 'system' COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_business_noAndType` (`business_no`,`business_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8686 DEFAULT CHARSET=utf8 COMMENT='接口请求重试表';

/*Table structure for table `loan_record` */

DROP TABLE IF EXISTS `loan_record`;

CREATE TABLE `loan_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `app_sheet_no` varchar(64) DEFAULT NULL COMMENT '投资申请号',
  `ext_order_no` varchar(64) DEFAULT NULL COMMENT '外部系统订单号',
  `product_code` varchar(64) NOT NULL COMMENT '产品代码',
  `member_id` varchar(64) NOT NULL COMMENT '平台用户ID',
  `financing_member_Id` varchar(64) NOT NULL COMMENT '融资机构会员id',
  `sale_channel` varchar(8) NOT NULL COMMENT '渠道 唐小僧 TXS|企业理财QYLIC|摇旺YW',
  `amount` decimal(16,2) DEFAULT NULL COMMENT '本金',
  `loan_time` datetime DEFAULT NULL COMMENT '发起放款时间',
  `actual_cash_time` datetime DEFAULT NULL COMMENT '实际放付时间',
  `pay_no` varchar(64) DEFAULT NULL COMMENT '支付流水号',
  `status` varchar(16) DEFAULT 'LOAN_PROCESSING' COMMENT 'LOAN_PROCESSING:放款中LOAN_SUCCESS:放款成功',
  `version` int(11) DEFAULT '1',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(32) DEFAULT 'system',
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modify_by` varchar(32) DEFAULT 'system',
  `memo` varchar(256) DEFAULT NULL,
  `loan_no` varchar(64) DEFAULT NULL COMMENT '放款流水号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `payNoIndex` (`pay_no`),
  UNIQUE KEY `appsheetnoIndex` (`app_sheet_no`),
  KEY `lonaIndex` (`loan_no`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='投资人放款表';

/*Table structure for table `match_record` */

DROP TABLE IF EXISTS `match_record`;

CREATE TABLE `match_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `member_id` varchar(64) DEFAULT NULL COMMENT '平台用户ID',
  `asset_code` varchar(64) DEFAULT NULL COMMENT '资产code',
  `asset_amount` decimal(16,4) DEFAULT NULL COMMENT '资产总金额',
  `app_sheet_no` varchar(64) DEFAULT NULL COMMENT '交易系统生成的订单编号',
  `ext_order_no` varchar(64) DEFAULT NULL COMMENT '外部订单号（唐小僧）',
  `product_code` varchar(64) DEFAULT NULL COMMENT '产品code',
  `matched_amount` decimal(16,4) DEFAULT NULL COMMENT '匹配金额',
  `match_status` varchar(32) DEFAULT 'MATCH_SUCCESS' COMMENT '匹配状态(MATCH_SUCCESS:匹配成功',
  `version` int(11) DEFAULT '1' COMMENT '版本号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `modify_by` varchar(32) DEFAULT NULL COMMENT '修改人',
  `financing_member_Id` varchar(64) DEFAULT NULL COMMENT '融资机构会员id',
  `financing_code` varchar(64) DEFAULT NULL COMMENT '融资机构编码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `appsheetnoIndex` (`app_sheet_no`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8 COMMENT='配订单表';

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `sale_channel` varchar(8) DEFAULT NULL COMMENT '渠道',
  `product_code` varchar(64) NOT NULL COMMENT '产品代码',
  `product_name` varchar(128) DEFAULT NULL COMMENT '产品名称',
  `expect_clear_date` date DEFAULT NULL COMMENT '回款日',
  `status` varchar(16) DEFAULT 'INIT' COMMENT '状态 INIT:初始SETUP:产品成立;FAILURE:流标;',
  `amount` decimal(16,4) DEFAULT '0.0000' COMMENT '本金',
  `count` int(11) DEFAULT '0' COMMENT '投资笔数',
  `asset_code` varchar(64) DEFAULT NULL COMMENT '资产编号',
  `financing_member_id` varchar(64) DEFAULT NULL COMMENT '融资方会员ID',
  `financing_party_name` varchar(128) DEFAULT NULL COMMENT '融资方名称',
  `financing_code` varchar(64) DEFAULT NULL COMMENT '融资方编码',
  `interest_date` date DEFAULT NULL COMMENT '起息日',
  `expire_date` date DEFAULT NULL COMMENT '到期日',
  `establish_date` date DEFAULT NULL COMMENT '成立日',
  `duration` int(8) DEFAULT NULL COMMENT '存续期',
  `yield` decimal(12,8) DEFAULT '0.00000000' COMMENT '基础收益',
  `version` int(11) DEFAULT '0',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(32) DEFAULT 'system',
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `modify_by` varchar(32) DEFAULT 'system',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_productCode_channel` (`sale_channel`,`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COMMENT='产品';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
