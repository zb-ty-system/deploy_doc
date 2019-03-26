/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.19-67.0-log : Database - trade_ladder
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`trade_ladder` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `trade_ladder`;

/*Table structure for table `ladder_account_transaction` */

DROP TABLE IF EXISTS `ladder_account_transaction`;

CREATE TABLE `ladder_account_transaction` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `account_id` varchar(64) DEFAULT NULL COMMENT '交易系统账号ID',
  `interest_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '参与计息金额',
  `total_income` decimal(16,4) DEFAULT '0.0000' COMMENT '累计总收益',
  `withdrawed_income` decimal(16,4) DEFAULT '0.0000' COMMENT '已提取收益',
  `ref_code` varchar(64) DEFAULT NULL COMMENT '表中发生变动的code',
  `change_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '变动金额',
  `change_type` varchar(32) DEFAULT NULL COMMENT '变动类型:OPEN_ACCOUNT;INCOME ; INVEST_CONFIRM ; REDEEM_CONFIRM ;REDEEM_REQUEST',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(64) DEFAULT NULL,
  `frozen_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '冻结金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='账户变动记录表';

/*Table structure for table `ladder_batch` */

DROP TABLE IF EXISTS `ladder_batch`;

CREATE TABLE `ladder_batch` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `batch_no` varchar(64) DEFAULT NULL COMMENT '批次号',
  `thirdparty_batch_no` varchar(64) DEFAULT NULL COMMENT '关联批次号',
  `file_name` varchar(64) DEFAULT NULL COMMENT '文件名',
  `file_path` varchar(1024) DEFAULT NULL COMMENT '文件路径',
  `trade_biz_code` varchar(32) DEFAULT NULL COMMENT '022-申购申请 122-申购确认 024-赎回 025-预约赎回 124-赎回确认 125预约赎回确认 201-每日收益 301-还款计划',
  `product_code` varchar(64) DEFAULT NULL COMMENT '产品编码',
  `total_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '总金额',
  `total_count` int(11) DEFAULT NULL COMMENT '总记录数',
  `current_line_no` int(11) DEFAULT NULL COMMENT '当前行号-文件读取行数',
  `repeat_times` int(2) DEFAULT '0' COMMENT '重试次数',
  `status` varchar(32) DEFAULT NULL COMMENT '批次处理状态：INIT:初始化,PROCESSING:处理中,COMPLETED:已处理,DATA_SUCCESS 数据处理完成,PROCESS_FAIL:处理异常,UPLOAD_COMPLETE:文件上传完成;CALCULATE_ACCOUNT:修改账户金额中',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(64) DEFAULT NULL,
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `modify_by` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT '0',
  `memo` varchar(1024) DEFAULT NULL,
  `product_name` varchar(64) DEFAULT NULL COMMENT '产品名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `batchNo_index` (`batch_no`),
  UNIQUE KEY `fileName_index` (`file_name`),
  UNIQUE KEY `thirdPartBatchNo_index` (`thirdparty_batch_no`),
  FULLTEXT KEY `productCode_index` (`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8 COMMENT='批次记录表';

/*Table structure for table `ladder_contract` */

DROP TABLE IF EXISTS `ladder_contract`;

CREATE TABLE `ladder_contract` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `invest_request_id` varchar(64) DEFAULT NULL COMMENT '申购表id与申购勾上',
  `asset_id` varchar(64) DEFAULT NULL COMMENT '资产id',
  `contract_no` varchar(64) DEFAULT NULL COMMENT '合同编号',
  `file_name` varchar(64) DEFAULT NULL COMMENT '合同名称',
  `file_path` varchar(64) DEFAULT NULL COMMENT '合同存放地址',
  `contract_type` varchar(32) DEFAULT NULL COMMENT 'PERSONAL ; ENTERPRISE',
  `channel_no` varchar(32) DEFAULT NULL COMMENT '渠道 TXS-唐小僧 QYLC-企业理财 YW-摇旺',
  `platform_member_id` varchar(64) DEFAULT NULL COMMENT '委托人id',
  `member_name` varchar(64) DEFAULT NULL COMMENT '委托人名称（甲方）',
  `member_identity_card` varchar(64) DEFAULT NULL COMMENT '委托人身份证号码',
  `assignee_id` varchar(64) DEFAULT NULL COMMENT '受托方id',
  `assignee_name` varchar(64) DEFAULT NULL COMMENT '受托方名称-全称（乙方）',
  `assignee_legal_person_name` varchar(64) DEFAULT NULL COMMENT '受托方法人姓名',
  `assignee_legal_person_identity_card` varchar(64) DEFAULT NULL COMMENT '受托方法人身份证号码',
  `assignee_cooperation_agency_id` varchar(64) DEFAULT NULL COMMENT '受托方合作机构id',
  `assignee_cooperation_agency_name` varchar(64) DEFAULT NULL COMMENT '受托方合作机构名称（全称）',
  `investment_target_type` varchar(32) DEFAULT NULL COMMENT '投资标的类型 1-债权',
  `invest_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '投资金额',
  `year_yield` decimal(16,4) DEFAULT '0.0000' COMMENT '年化收益率',
  `lock_data` int(11) DEFAULT '0' COMMENT '锁定日期',
  `calendar_model` varchar(32) DEFAULT NULL COMMENT '日历模式360 365 366',
  `invest_date` datetime DEFAULT NULL COMMENT '委托投资日',
  `expire_date` datetime DEFAULT NULL COMMENT '委托到期日',
  `status` varchar(32) DEFAULT NULL COMMENT 'SUCESS ; FAIL',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(64) DEFAULT NULL,
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `modify_by` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT '0',
  `memo` varchar(1024) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合同表';

/*Table structure for table `ladder_daily_income` */

DROP TABLE IF EXISTS `ladder_daily_income`;

CREATE TABLE `ladder_daily_income` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `batch_no` varchar(64) DEFAULT NULL COMMENT '批次号',
  `app_sheet_no` varchar(64) DEFAULT NULL COMMENT 'ta系统-ta_ladder_id',
  `origin_trade_serial_no` varchar(64) DEFAULT NULL COMMENT '交易系统-申购申请流水号',
  `platform_member_id` varchar(64) DEFAULT NULL COMMENT '平台会员ID',
  `account_id` varchar(64) DEFAULT NULL COMMENT '交易系统-账户ID',
  `trade_account_no` varchar(128) DEFAULT NULL COMMENT 'TA系统-交易账户',
  `product_code` varchar(64) DEFAULT NULL COMMENT '产品编码',
  `yield` decimal(12,8) DEFAULT '0.00000000' COMMENT '年化收益率(%)',
  `income` decimal(16,4) DEFAULT '0.0000' COMMENT '收益',
  `invest_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '投资金额',
  `interest_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '计息金额',
  `income_date` datetime DEFAULT NULL COMMENT '收益日期',
  `current_stage_num` int(11) DEFAULT NULL COMMENT '当前梯段',
  `total_stage_count` int(11) DEFAULT NULL COMMENT '总梯段',
  `hold_day` int(10) DEFAULT NULL COMMENT '持有天数',
  `remain_day` int(10) DEFAULT NULL COMMENT '剩余天数',
  `recent_open_day` datetime DEFAULT NULL COMMENT '最近开放日',
  `status` varchar(32) DEFAULT NULL COMMENT '状态:INIT ; PROCESSING:处理中; (CONFIRM)处理完成 ;',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(64) DEFAULT NULL,
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `modify_by` varchar(64) DEFAULT NULL,
  `sale_channel` varchar(32) DEFAULT NULL COMMENT '渠道:TXS-唐小僧 QYLC-企业理财 YW-摇旺',
  PRIMARY KEY (`id`),
  KEY `batchNo_index` (`batch_no`),
  KEY `appSheetNo_index` (`app_sheet_no`),
  KEY `accountId_index` (`account_id`),
  FULLTEXT KEY `originTradeSerialNo_index` (`origin_trade_serial_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='每日收益记录表';

/*Table structure for table `ladder_error_log` */

DROP TABLE IF EXISTS `ladder_error_log`;

CREATE TABLE `ladder_error_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_code` varchar(64) DEFAULT NULL COMMENT '产品编码',
  `trade_serial_no` varchar(64) DEFAULT NULL COMMENT '交易系统流水号',
  `account_id` varchar(64) DEFAULT NULL COMMENT '交易账号',
  `error_time` datetime DEFAULT NULL COMMENT '发生错误的时间',
  `error_method` varchar(64) DEFAULT NULL COMMENT '出错的类和方法名',
  `error_message` varchar(64) DEFAULT NULL COMMENT '出错信息',
  `trace` varchar(2048) DEFAULT NULL COMMENT '异常信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='异常处理表';

/*Table structure for table `ladder_invest_confirm` */

DROP TABLE IF EXISTS `ladder_invest_confirm`;

CREATE TABLE `ladder_invest_confirm` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `app_sheet_no` varchar(64) NOT NULL COMMENT 'ta-申购确认流水号',
  `origin_trade_serial_no` varchar(64) DEFAULT NULL COMMENT '交易系统-原申购申请group_serial_no交易流水号',
  `batch_no` varchar(64) DEFAULT NULL COMMENT '批次号',
  `platform_member_id` varchar(64) DEFAULT NULL COMMENT '平台会员ID',
  `cert_type` varchar(32) DEFAULT NULL COMMENT '证件类型',
  `cert_no` varchar(32) DEFAULT NULL COMMENT '证件号码',
  `account_id` varchar(64) DEFAULT NULL COMMENT '交易系统-账户ID',
  `trade_account_no` varchar(128) DEFAULT NULL COMMENT 'TA系统-交易账户',
  `product_code` varchar(64) DEFAULT NULL COMMENT '产品编码',
  `request_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '申请金额',
  `confirm_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '确认金额',
  `fail_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '失败金额',
  `interest_date` datetime DEFAULT NULL COMMENT '起息日期',
  `trans_confirm_date` datetime DEFAULT NULL COMMENT 'TA系统-交易确认日期(待删除)',
  `user_type` varchar(32) DEFAULT NULL COMMENT '用户类型:个人-PERSONAL;企业-ENTERPRISE',
  `sale_channel` varchar(32) DEFAULT NULL COMMENT '渠道:TXS-唐小僧 QYLC-企业理财 YW-摇旺',
  `status` varchar(32) DEFAULT NULL COMMENT '状态-INIT 处理中-PROCESSING 成功-SUCESS 失败-FAIL',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(64) DEFAULT NULL,
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `modify_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `appSheetNo_index` (`app_sheet_no`),
  UNIQUE KEY `originTradeSerialNo_index` (`origin_trade_serial_no`),
  KEY `batchNo_index` (`batch_no`),
  KEY `platformMemberId_index` (`platform_member_id`),
  KEY `accountId_index` (`account_id`),
  KEY `productCode_index` (`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='投资确认记录表';

/*Table structure for table `ladder_invest_request` */

DROP TABLE IF EXISTS `ladder_invest_request`;

CREATE TABLE `ladder_invest_request` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `trade_serial_no` varchar(64) NOT NULL COMMENT '交易系统',
  `group_serial_no` varchar(64) DEFAULT NULL COMMENT '生成规则:memberId+"_"+productCode',
  `upload_batch_no` varchar(64) DEFAULT NULL COMMENT '上传批次号',
  `account_id` varchar(64) DEFAULT NULL COMMENT '交易系统-内部账户',
  `trade_account_no` varchar(64) DEFAULT NULL COMMENT 'TA系统-交易账户',
  `platform_member_id` varchar(64) DEFAULT NULL COMMENT '平台-会员ID',
  `member_name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `cert_type` varchar(32) DEFAULT NULL COMMENT '证件类型',
  `cert_no` varchar(32) DEFAULT NULL COMMENT '证件号',
  `order_no` varchar(64) DEFAULT NULL COMMENT '订单系统-order_id',
  `product_code` varchar(64) DEFAULT NULL COMMENT '产品编码',
  `product_name` varchar(64) DEFAULT NULL COMMENT '产品名称',
  `invest_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '投资金额',
  `user_type` varchar(32) DEFAULT NULL COMMENT '用户类型:PERSONAL ; ENTERPRISE',
  `sale_channel` varchar(32) DEFAULT NULL COMMENT '渠道:TXS-唐小僧 QYLC-企业理财 YW-摇旺',
  `order_time` datetime DEFAULT NULL COMMENT '下单时间',
  `status` varchar(32) DEFAULT NULL COMMENT '状态:初始化INIT;生成文件处理完成 COMPLETED;退款REFUND;',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(64) DEFAULT NULL,
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `modify_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tradeSerialNo_index` (`trade_serial_no`),
  UNIQUE KEY `orderNo_index` (`order_no`),
  KEY `platformMemberId_index` (`platform_member_id`),
  KEY `productCode_index` (`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COMMENT='投资申请记录表';

/*Table structure for table `ladder_redeem_confirm` */

DROP TABLE IF EXISTS `ladder_redeem_confirm`;

CREATE TABLE `ladder_redeem_confirm` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `app_sheet_no` varchar(64) DEFAULT NULL COMMENT '资产系统-赎回确认流水号（到期兑付该字段为空）',
  `origin_trade_serial_no` varchar(64) DEFAULT NULL COMMENT '原赎回申请流水号',
  `batch_no` varchar(64) DEFAULT NULL COMMENT '批次号',
  `account_id` varchar(64) DEFAULT NULL COMMENT '交易系统账户id',
  `platform_member_id` varchar(64) DEFAULT NULL COMMENT '平台会员id',
  `trade_account_no` varchar(64) DEFAULT NULL COMMENT 'TA系统-交易账户',
  `user_type` varchar(32) DEFAULT NULL COMMENT 'PERSONAL ; ENTERPRISE',
  `sale_channel` varchar(32) DEFAULT NULL COMMENT '渠道 TXS-唐小僧 QYLC-企业理财 YW-摇旺',
  `cash_type` varchar(32) DEFAULT NULL COMMENT '类型 AUTO_CASH:到期自动兑付 ADVANCE_CASH:用户提前兑付',
  `product_code` varchar(64) DEFAULT NULL COMMENT '产品编码',
  `trans_confirm_date` datetime DEFAULT NULL COMMENT '交易确认日期',
  `invest_amount` decimal(16,4) DEFAULT NULL COMMENT '投资金额(本金)',
  `interest_amount` decimal(16,4) DEFAULT NULL COMMENT '计息金额',
  `redeem_income` decimal(16,4) DEFAULT NULL COMMENT '兑付收益',
  `redeem_total_amount` decimal(16,4) DEFAULT NULL COMMENT '赎回金额',
  `redeem_time` datetime DEFAULT NULL COMMENT '兑付时间',
  `status` varchar(32) DEFAULT NULL COMMENT '状态-INIT;处理中-PROCESSING成功-SUCESS失败-FAIL通知兑付处理中-INFORM_PROCESSING兑付成功-REDEEM_SUCESS作废-CANCELLATION',
  `create_by` varchar(64) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `modify_by` varchar(64) DEFAULT NULL,
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `card_no` varchar(32) DEFAULT NULL COMMENT '银行卡卡号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `appsheetno` (`app_sheet_no`),
  UNIQUE KEY `appsheetno_org_serno` (`app_sheet_no`,`origin_trade_serial_no`),
  KEY `batchNo_index` (`batch_no`),
  KEY `platformMemberId_index` (`platform_member_id`),
  KEY `productCode_index` (`product_code`),
  KEY `productCode_cashType_status` (`cash_type`,`product_code`,`status`),
  KEY `cashType` (`cash_type`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='赎回确认记录表';

/*Table structure for table `ladder_redeem_request` */

DROP TABLE IF EXISTS `ladder_redeem_request`;

CREATE TABLE `ladder_redeem_request` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `trade_serial_no` varchar(64) DEFAULT NULL COMMENT '预约赎回单流水号',
  `group_serial_no` varchar(64) DEFAULT NULL COMMENT '生成规则:memberId+"_"+productCode',
  `pay_serial_no` varchar(64) DEFAULT NULL COMMENT '支付流水号',
  `account_id` varchar(64) DEFAULT NULL COMMENT '交易系统账户ID',
  `trade_account_no` varchar(64) DEFAULT NULL COMMENT 'TA系统交易账号',
  `platform_member_id` varchar(64) DEFAULT NULL COMMENT '平台会员ID',
  `member_name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `card_no` varchar(32) DEFAULT NULL COMMENT '银行卡卡号',
  `product_code` varchar(64) DEFAULT NULL COMMENT '产品编码',
  `product_name` varchar(64) DEFAULT NULL COMMENT '产品名称',
  `redeem_apply_date` datetime DEFAULT NULL COMMENT '赎回申请日-申请',
  `redeem_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '赎回金额',
  `redeem_date` datetime DEFAULT NULL COMMENT '赎回日期-为准',
  `status` varchar(32) DEFAULT NULL COMMENT '状态:初始化INIT;生成文件处理完成 COMPLETED;兑付完成 SUCCESS',
  `cert_type` varchar(32) DEFAULT NULL,
  `cert_no` varchar(32) DEFAULT NULL,
  `upload_batch_no` varchar(32) DEFAULT NULL,
  `user_type` varchar(32) DEFAULT NULL COMMENT '用户类型:PERSONAL ; ENTERPRISE',
  `sale_channel` varchar(32) DEFAULT NULL COMMENT '渠道:TXS-唐小僧 QYLC-企业理财 YW-摇旺',
  `order_no` varchar(64) DEFAULT NULL COMMENT '订单系统id',
  `create_by` varchar(64) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `modify_by` varchar(64) DEFAULT NULL,
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tradeSerialNo_index` (`trade_serial_no`),
  UNIQUE KEY `orderNo_index` (`order_no`),
  KEY `paySerialNo_index` (`pay_serial_no`),
  KEY `platformMemberId_index` (`platform_member_id`),
  KEY `productCode_index` (`product_code`),
  KEY `memberId_productCode` (`platform_member_id`,`product_code`),
  KEY `productCode_status` (`product_code`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='赎回申请记录表';

/*Table structure for table `ladder_sequence` */

DROP TABLE IF EXISTS `ladder_sequence`;

CREATE TABLE `ladder_sequence` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `sequence_name` varchar(32) NOT NULL COMMENT '序列号名称',
  `current_val` bigint(20) NOT NULL DEFAULT '0' COMMENT '当前值',
  `sequence_step` int(11) NOT NULL DEFAULT '1' COMMENT '步长',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `version` int(11) DEFAULT '0' COMMENT '版本号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_id` (`id`) USING BTREE,
  UNIQUE KEY `idx_sequence_name` (`sequence_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='交易系统序列表';

/*Table structure for table `ladder_stage_income_plan` */

DROP TABLE IF EXISTS `ladder_stage_income_plan`;

CREATE TABLE `ladder_stage_income_plan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `origin_trade_serial_no` varchar(64) DEFAULT NULL COMMENT '交易系统-原申购申请流水号',
  `app_sheet_no` varchar(64) DEFAULT NULL COMMENT 'ta认购记录编号',
  `account_id` varchar(64) DEFAULT NULL,
  `product_code` varchar(64) DEFAULT NULL COMMENT '产品code',
  `trade_account_no` varchar(64) DEFAULT NULL COMMENT '交易账户',
  `platform_member_id` varchar(64) DEFAULT NULL COMMENT '会员id',
  `yield` decimal(16,4) DEFAULT '0.0000' COMMENT '本期收益率',
  `total_stage_count` int(3) DEFAULT NULL COMMENT '总期数',
  `current_stage_num` int(3) DEFAULT NULL COMMENT '当前期数',
  `total_day_count` int(3) DEFAULT NULL COMMENT '每期总共多少天',
  `stage_begin_date` date DEFAULT NULL COMMENT '本阶梯开始日期',
  `stage_end_date` date DEFAULT NULL COMMENT '本阶梯结束日期',
  `invest_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '投资金额',
  `interest_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '计息金额',
  `expected_total_income` decimal(16,4) DEFAULT '0.0000' COMMENT '预计累计收益',
  `expected_current_income` decimal(16,4) DEFAULT '0.0000' COMMENT '预计本期收益',
  `income_process_date` date DEFAULT NULL COMMENT '收益处理日期',
  `status` varchar(16) DEFAULT NULL COMMENT 'INIT:初始化;\r\nPROCESSING:处理中;COMPLETED:处理结束;\r\nADVANCE_REDEEM:提前全部兑付;',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(64) DEFAULT NULL,
  `modify_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `originTradeSerialNo_index` (`origin_trade_serial_no`),
  KEY `appSheetNo_index` (`app_sheet_no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='还款计划记录表';

/*Table structure for table `ladder_user_account` */

DROP TABLE IF EXISTS `ladder_user_account`;

CREATE TABLE `ladder_user_account` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `platform_member_id` varchar(64) DEFAULT NULL COMMENT '平台用户ID',
  `trade_account_no` varchar(64) DEFAULT NULL COMMENT 'TA系统交易账号',
  `member_name` varchar(16) DEFAULT NULL COMMENT '用户姓名',
  `user_type` varchar(32) DEFAULT NULL COMMENT '用户类型:个人-PERSONAL;企业-ENTERPRISE',
  `cert_no` varchar(32) DEFAULT NULL COMMENT '证件号码',
  `cert_type` varchar(16) DEFAULT NULL COMMENT '证件类型',
  `sale_channel` varchar(32) DEFAULT NULL COMMENT '渠道:TXS-唐小僧 QYLC-企业理财 YW-摇旺',
  `product_code` varchar(64) DEFAULT NULL COMMENT '产品编码',
  `invest_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '投资本金',
  `interest_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '参与计息本金',
  `withdrawed_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '已提取本金',
  `frozen_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '冻结金额',
  `total_income` decimal(16,4) DEFAULT '0.0000' COMMENT '累计总收益',
  `yesterday_income` decimal(16,4) DEFAULT '0.0000' COMMENT '昨日收益',
  `withdrawed_income` decimal(16,4) DEFAULT '0.0000' COMMENT '已提取收益',
  `status` varchar(32) DEFAULT NULL COMMENT '状态:正常-NORMAL;冻结-FROZEN;关闭-CLOSED',
  `version` int(11) DEFAULT '0',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_by` varchar(64) DEFAULT NULL,
  `modify_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `modify_by` varchar(64) DEFAULT NULL,
  `current_stage_num` int(11) DEFAULT NULL COMMENT '当前梯段',
  `total_stage_count` int(11) DEFAULT NULL COMMENT '总梯段',
  `hold_day` int(10) DEFAULT NULL COMMENT '持有天数',
  `remain_day` int(10) DEFAULT NULL COMMENT '剩余天数',
  `recent_open_day` datetime DEFAULT NULL COMMENT '最近开放日',
  PRIMARY KEY (`id`),
  UNIQUE KEY `platformMemberId_productCode` (`platform_member_id`,`product_code`),
  UNIQUE KEY `ta_account_no` (`trade_account_no`),
  KEY `platformMemberId` (`platform_member_id`),
  KEY `certNo_certType_productCode_index` (`cert_no`,`cert_type`,`product_code`),
  KEY `pmId_pCode_Schannel` (`platform_member_id`,`sale_channel`,`product_code`)
) ENGINE=InnoDB AUTO_INCREMENT=485 DEFAULT CHARSET=utf8 COMMENT='账户表';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
