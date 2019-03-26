/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.19-67.0-log : Database - p2p
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`p2p` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `p2p`;

/*Table structure for table `p2p_account` */

DROP TABLE IF EXISTS `p2p_account`;

CREATE TABLE `p2p_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `account_no` varchar(64) DEFAULT NULL COMMENT '持仓单编号',
  `member_id` varchar(64) DEFAULT NULL COMMENT '平台用户ID',
  `sale_channel` varchar(32) DEFAULT NULL COMMENT '渠道 TXS-唐小僧 QYLC-企业理财 YW-摇旺',
  `product_code` varchar(32) DEFAULT NULL COMMENT '产品代码',
  `amount` decimal(16,2) DEFAULT NULL COMMENT '累计总本金',
  `version` int(11) DEFAULT '1' COMMENT '版本号',
  `cash_flag` int(1) DEFAULT '0' COMMENT '兑付标志:0-未生成兑付计划;1-已生成兑付计划;2-已兑付',
  `interest_flag` varchar(1) DEFAULT NULL COMMENT '收益计算标志,0:未生成,1:已生成',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `modify_by` varchar(32) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3733 DEFAULT CHARSET=utf8 COMMENT='持仓表';

/*Table structure for table `p2p_batch` */

DROP TABLE IF EXISTS `p2p_batch`;

CREATE TABLE `p2p_batch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batch_type` varchar(16) DEFAULT NULL COMMENT 'CASH-兑付;DIFFER-尾差',
  `status` varchar(32) DEFAULT NULL COMMENT 'INIT:初始化;PROCESSING:处理中;DIFFER_SUCCESS:差额批次处理完成;PROCESS_FAIL:流程处理异常,PROCESS_SUCCESS:流程处理成功；PAY_FAIL:支付处理异常;PAY_SUCCESS:支付处理成功',
  `product_code` varchar(64) DEFAULT NULL COMMENT '产品编号',
  `product_total_amount` decimal(16,2) DEFAULT NULL COMMENT '产品兑付总金额',
  `repay_total_amount` decimal(16,2) DEFAULT NULL COMMENT '资产还款总金额',
  `batch_date` date DEFAULT NULL COMMENT '流程处理日期',
  `memo` varchar(512) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) DEFAULT 'SYS',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `modify_by` varchar(64) DEFAULT 'SYS',
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `productAndType` (`batch_type`,`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='批次表';

/*Table structure for table `p2p_cash_record` */

DROP TABLE IF EXISTS `p2p_cash_record`;

CREATE TABLE `p2p_cash_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `product_code` varchar(64) NOT NULL COMMENT '产品代码',
  `account_no` varchar(64) DEFAULT NULL COMMENT '持仓单编号',
  `member_id` varchar(64) NOT NULL COMMENT '平台用户ID',
  `sale_channel` varchar(8) NOT NULL COMMENT '渠道 唐小僧 TXS|企业理财QYLIC|摇旺YW',
  `cash_amount` decimal(16,2) DEFAULT NULL COMMENT '兑付总本金',
  `cash_income` decimal(16,2) DEFAULT NULL COMMENT '兑付总利息',
  `cash_date` date DEFAULT NULL COMMENT '兑付日期',
  `status` varchar(16) DEFAULT NULL COMMENT 'INIT:待处理；CASHING:兑付中；CASH_SUCCESS:兑付成功；CASH_FAIL:兑付失败；',
  `version` int(11) DEFAULT '1',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(32) DEFAULT 'SYS',
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modify_by` varchar(32) DEFAULT 'SYS',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mermberAndchannelAndProduct` (`product_code`,`sale_channel`,`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3714 DEFAULT CHARSET=utf8 COMMENT='投资人兑付表';

/*Table structure for table `p2p_contract` */

DROP TABLE IF EXISTS `p2p_contract`;

CREATE TABLE `p2p_contract` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `invest_contract_no` varchar(64) DEFAULT NULL COMMENT '投资合同编号(投资人持仓维度)',
  `loan_contract_no` varchar(64) DEFAULT NULL COMMENT '借款合同编号(资产维度)',
  `reservation_no` varchar(64) DEFAULT NULL COMMENT '预约订单号',
  `invest_order_no` varchar(64) DEFAULT NULL COMMENT '交易内部订单号',
  `ext_invest_order_no` varchar(64) DEFAULT NULL COMMENT '投资交易外部订单号',
  `loan_order_no` varchar(64) DEFAULT NULL COMMENT '借款方订单号',
  `invest_sale_channel` varchar(32) DEFAULT NULL COMMENT '投资渠道:TXS-唐小僧',
  `loan_sale_channel` varchar(32) DEFAULT NULL COMMENT '借款渠道:MSD-马上贷',
  `product_code` varchar(64) DEFAULT NULL COMMENT '产品编码',
  `product_name` varchar(64) DEFAULT NULL COMMENT '产品名称',
  `asset_code` varchar(64) DEFAULT NULL COMMENT '资产编码',
  `asset_name` varchar(64) DEFAULT NULL COMMENT '资产名称',
  `invest_amount` decimal(16,2) DEFAULT '0.00' COMMENT '投资金额',
  `loan_amount` decimal(16,2) DEFAULT '0.00' COMMENT '借款金额',
  `invest_year_yield` decimal(12,8) DEFAULT '0.00000000' COMMENT '投资年化收益率',
  `loan_year_yield` decimal(12,8) DEFAULT '0.00000000' COMMENT '借款年化利率',
  `loan_fee` decimal(16,2) DEFAULT '0.00' COMMENT '借款手续费(元)',
  `invest_lock_date` int(11) DEFAULT '0' COMMENT '投资期限(天)',
  `loan_lock_date` int(11) DEFAULT '0' COMMENT '借款期限(天)',
  `invest_start_date` datetime DEFAULT NULL COMMENT '委托投资日(用户投资成功日期，精确到年月日)',
  `invest_end_date` datetime DEFAULT NULL COMMENT '委托到期日(产品到期日)',
  `loan_start_date` datetime DEFAULT NULL COMMENT '委托借款日(用户借款成功日期，精确到年月日)',
  `loan_end_date` datetime DEFAULT NULL COMMENT '借款到期日',
  `invest_member_id` varchar(64) DEFAULT NULL COMMENT '投资人id',
  `loan_member_id` varchar(64) DEFAULT NULL COMMENT '借款人id',
  `invest_member_name` varchar(64) DEFAULT NULL COMMENT '投资人名称',
  `loan_member_name` varchar(64) DEFAULT NULL COMMENT '借款人名称',
  `invest_identity_card` varchar(64) DEFAULT NULL COMMENT '投资人身份证号码',
  `loan_identity_card` varchar(64) DEFAULT NULL COMMENT '借款人身份证号码',
  `status` varchar(32) DEFAULT 'INIT' COMMENT '状态:INIT-初始化;FAIL-废弃',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `modify_by` varchar(32) DEFAULT NULL COMMENT '修改人',
  `memo` varchar(1024) DEFAULT NULL COMMENT '备注',
  `product_display_name` varchar(64) DEFAULT NULL COMMENT '前端展示名',
  `invest_display_member_name` varchar(64) DEFAULT NULL COMMENT '投资人前端展示名',
  `invest_display_identity_card` varchar(64) DEFAULT NULL COMMENT '投资人前端展示身份证号码',
  `loan_display_member_name` varchar(64) DEFAULT NULL COMMENT '借款人前端展示名',
  `loan_display_identity_card` varchar(64) DEFAULT NULL COMMENT '借款人前端展示身份证号码',
  PRIMARY KEY (`id`),
  KEY `imemberid_productCode` (`product_code`,`invest_member_id`),
  KEY `lmemberid_assetCode` (`asset_code`,`loan_member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='合同关系表';

/*Table structure for table `p2p_daily_income` */

DROP TABLE IF EXISTS `p2p_daily_income`;

CREATE TABLE `p2p_daily_income` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `member_id` varchar(32) NOT NULL COMMENT '投资人ID',
  `account_no` varchar(32) DEFAULT NULL COMMENT '持仓单编号',
  `product_code` varchar(32) NOT NULL COMMENT '产品编号',
  `interest_amount` decimal(16,2) DEFAULT NULL COMMENT '收益金额',
  `interest_date` date DEFAULT NULL COMMENT '收益日期',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(64) DEFAULT NULL,
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modify_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_memberId_productCode_interestDate` (`member_id`,`product_code`,`interest_date`)
) ENGINE=InnoDB AUTO_INCREMENT=48605 DEFAULT CHARSET=utf8 COMMENT='每日收益表';

/*Table structure for table `p2p_loan_request` */

DROP TABLE IF EXISTS `p2p_loan_request`;

CREATE TABLE `p2p_loan_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `member_id` varchar(64) DEFAULT NULL COMMENT '借款人ID',
  `loan_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '借款金额',
  `loan_no` varchar(64) DEFAULT NULL COMMENT '外部编号（马上贷）',
  `loan_fee` decimal(16,4) DEFAULT '0.0000' COMMENT '借款手续费',
  `loan_interests` decimal(16,4) DEFAULT '0.0000' COMMENT '借款利息',
  `asset_code` varchar(64) DEFAULT NULL COMMENT '资产编号',
  `product_code` varchar(64) DEFAULT NULL COMMENT '产品编号',
  `product_name` varchar(64) DEFAULT NULL COMMENT '产品名',
  `asset_pool_code` varchar(64) DEFAULT NULL COMMENT '资产池编号',
  `asset_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '资产金额',
  `asset_name` varchar(64) DEFAULT NULL COMMENT '资产名称',
  `value_start_time` datetime DEFAULT NULL COMMENT '资产起息日期',
  `value_end_time` datetime DEFAULT NULL COMMENT '资产止息日期',
  `expire_date` datetime DEFAULT NULL COMMENT '资产到期日',
  `asset_year_yield` decimal(16,4) DEFAULT '0.0000' COMMENT '资产年化利率',
  `lock_date` int(11) DEFAULT '0' COMMENT '借款期限(天)',
  `loan_time` datetime DEFAULT NULL COMMENT '借款时间',
  `loan_status` varchar(32) DEFAULT NULL COMMENT '借款匹配状态：LOAN_UNMATCHED:借款待匹配,LOAN_SUCCESS:借款成功,LOAN_FAILED:借款失败; LOAN_LOCKED:借款锁定',
  `invested_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '已投资金额',
  `repay_status` varchar(32) DEFAULT NULL COMMENT '还款状态',
  `is_overdue` tinyint(1) DEFAULT NULL COMMENT '是否预期',
  `repaid_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '还款金额',
  `sale_channel` varchar(32) DEFAULT NULL COMMENT '资产来源(MSD:马上贷)',
  `version` int(11) DEFAULT '1' COMMENT '版本号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `modify_by` varchar(32) DEFAULT NULL COMMENT '修改人',
  `contract_status` varchar(32) DEFAULT 'INIT' COMMENT '合同状态: INIT-默认  PROCESSING-处理中 SUCCESS-成功',
  PRIMARY KEY (`id`),
  KEY `product_code` (`product_code`),
  KEY `loan_status` (`loan_status`),
  KEY `create_time` (`loan_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2032 DEFAULT CHARSET=utf8 COMMENT='借款表';

/*Table structure for table `p2p_match_record` */

DROP TABLE IF EXISTS `p2p_match_record`;

CREATE TABLE `p2p_match_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `member_id` varchar(64) DEFAULT NULL COMMENT '平台用户ID',
  `asset_code` varchar(64) DEFAULT NULL COMMENT '资产code',
  `asset_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '借款总金额',
  `order_no` varchar(64) DEFAULT NULL COMMENT '交易系统生成的订单编号',
  `ext_order_no` varchar(64) DEFAULT NULL COMMENT '外部订单号（唐小僧）',
  `reservation_no` varchar(64) DEFAULT NULL COMMENT '交易系统生成的预约单编号',
  `ext_reservation_no` varchar(64) DEFAULT NULL COMMENT '外部预约单号（唐小僧）',
  `product_code` varchar(64) DEFAULT NULL COMMENT '产品code',
  `matched_amount` decimal(16,4) DEFAULT NULL COMMENT '预约匹配金额',
  `match_status` varchar(32) DEFAULT NULL COMMENT '匹配状态(RESERVATION_MATCH_SUCCESS:预匹配成功,RESERVATION_MATCH_FAIL:匹配失败)',
  `version` int(11) DEFAULT '1' COMMENT '版本号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `modify_by` varchar(32) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 COMMENT='预匹配订单表';

/*Table structure for table `p2p_operation_record` */

DROP TABLE IF EXISTS `p2p_operation_record`;

CREATE TABLE `p2p_operation_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `operation_type` varchar(32) DEFAULT NULL COMMENT '操作类别',
  `refer_id` varchar(32) DEFAULT NULL COMMENT '关联请求编号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `modify_by` varchar(32) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `op_ref` (`operation_type`,`refer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27678 DEFAULT CHARSET=utf8 COMMENT='操作记录表';

/*Table structure for table `p2p_order` */

DROP TABLE IF EXISTS `p2p_order`;

CREATE TABLE `p2p_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `member_id` varchar(64) DEFAULT NULL COMMENT '平台用户ID',
  `asset_code` varchar(64) DEFAULT NULL COMMENT '资产code',
  `asset_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '借款总金额',
  `order_no` varchar(64) DEFAULT NULL COMMENT '交易系统生成的订单编号',
  `reservation_no` varchar(64) DEFAULT NULL COMMENT '交易系统生成的预约单编号',
  `ext_order_no` varchar(64) DEFAULT NULL COMMENT '外部订单号（唐小僧）',
  `product_code` varchar(64) DEFAULT NULL COMMENT '产品code',
  `invest_amount` decimal(16,4) DEFAULT NULL COMMENT '投资金额',
  `version` int(11) DEFAULT '1' COMMENT '版本号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `modify_by` varchar(32) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5154 DEFAULT CHARSET=utf8 COMMENT='订单表';

/*Table structure for table `p2p_reservation_order` */

DROP TABLE IF EXISTS `p2p_reservation_order`;

CREATE TABLE `p2p_reservation_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `member_id` varchar(64) DEFAULT NULL COMMENT '平台用户ID',
  `ext_reservation_no` varchar(64) DEFAULT NULL COMMENT '外部订单号（唐小僧）',
  `reservation_no` varchar(64) DEFAULT NULL COMMENT '交易系统生成的预约单编号',
  `product_code` varchar(64) DEFAULT NULL COMMENT '产品编号',
  `sale_channel` varchar(8) DEFAULT NULL COMMENT '渠道 唐小僧 TXS|企业理财QYLIC|摇旺YW',
  `reservation_amount` decimal(16,4) DEFAULT NULL COMMENT '预约金额',
  `frozen_amount` decimal(16,4) DEFAULT NULL COMMENT '冻结金额',
  `invested_amount` decimal(16,4) DEFAULT NULL COMMENT '已投资金额',
  `reservation_time` datetime DEFAULT NULL COMMENT '预约时间',
  `reservation_status` varchar(32) DEFAULT NULL COMMENT '预约状态：RESERVATION_UNMATCHED:预约待匹配,RESERVATION_SUCCESS:预约成功,RESERVATION_FAIL:预约失败,PARTLY_RESERVATION_SUCCESS:部分预约成功;',
  `version` int(11) DEFAULT '1' COMMENT '版本号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `modify_by` varchar(32) DEFAULT NULL COMMENT '修改人',
  `name` varchar(32) DEFAULT NULL COMMENT '用户名称',
  `cert_no` varchar(32) DEFAULT NULL COMMENT '身份证号码',
  PRIMARY KEY (`id`),
  KEY `idx_pcode` (`product_code`),
  KEY `idx_status` (`reservation_status`),
  KEY `idx_ctime` (`reservation_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9957 DEFAULT CHARSET=utf8 COMMENT='预约投资';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
