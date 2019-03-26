/*
* use ams txs database
*/

DROP TABLE IF EXISTS `ams_loan_info`;
CREATE TABLE `ams_loan_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `loan_order_no` varchar(32) DEFAULT '' COMMENT '借款订单编号',
  `loan_type` tinyint(2) DEFAULT '0' COMMENT '借款类型 1 个人，2 企业',
  `loan_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '借款金额(单位:元)',
  `loan_rate` decimal(12,8) DEFAULT '0.0000' COMMENT '借款利率',
  `loan_value_days` int(4) DEFAULT '0' COMMENT '借款期限(单位:天)',
  `loan_interest` decimal(16,4) DEFAULT '0.0000' COMMENT '借款利息',
  `loan_fee` decimal(12,8) DEFAULT '0.0000' COMMENT '借款手续费',
  `member_id` varchar(64) DEFAULT '' COMMENT '会员ID',
  `bank_account_no` varchar(64) DEFAULT '' COMMENT '银行卡号',
  `repayment_type` tinyint(2) DEFAULT '0' COMMENT '还款方式 1 到期还本付息，2 每月付息到期还本，3 等额本息，4 等额本金，5 利息自动拨付本金复投',
  `finance_subject_code` varchar(32) DEFAULT '' COMMENT '融资方编号',
  `finance_subject_name` varchar(512) DEFAULT '' COMMENT '融资方名称',
  `finance_subject_address` varchar(512) DEFAULT '' COMMENT '融资方地址',
  `finance_subject_tel` varchar(32) DEFAULT NULL COMMENT '融资方联系方式',
  `finance_project_code` varchar(32) DEFAULT '' COMMENT '融资方项目编号',
  `finance_project_des` longtext COMMENT '融资项目描述(JSON格式)',
  `finance_guarantee_info` longtext COMMENT '融资方担保人信息(JSON格式)',
  `survival_period_info` longtext COMMENT '存续期更新信息(JSON格式)',
  `enterprise_info` longtext COMMENT '企业信息',
  `risk_level` varchar(32) DEFAULT '' COMMENT '风险等级',
  `application_time` datetime DEFAULT NULL COMMENT '发起时间',
  `match_expire_time` timestamp NULL DEFAULT NULL COMMENT '匹配到期时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='借款信息';


DROP TABLE IF EXISTS `ams_debt_right_info`;
CREATE TABLE `ams_debt_right_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `loan_order_no` varchar(32) NOT NULL COMMENT '借款订单编号',
  `asset_no` varchar(32) DEFAULT NULL COMMENT '资产编号(系统自生成)',
  `asset_name` varchar(128) DEFAULT NULL COMMENT '资产名称(系统自生成)',
  `asset_type` varchar(2) DEFAULT '1' COMMENT '资产类型 1 普通债权, 2 债转债权',
  `match_succ_amt` decimal(16,4) DEFAULT '0.0000' COMMENT '撮合金额',
  `match_succ_date` datetime DEFAULT NULL COMMENT '撮合时间',
  `match_succ_mode` varchar(2) DEFAULT '1' COMMENT '撮合方式 1 依次匹配，2 小额分散',
  `product_code` varchar(32) DEFAULT NULL COMMENT '募集方案(产品)编号',
  `product_name` varchar(512) DEFAULT NULL COMMENT '募集方案(产品)名称',
  `product_type` varchar(2) DEFAULT '1' COMMENT '募集方案(产品)类型 1 募集包，2 募集计划，3 散标',
  `establish_time` date DEFAULT NULL COMMENT '成立日(年月日)',
  `value_start_time` date DEFAULT NULL COMMENT '起息日(年月日) 目前起息日为成立日',
  `value_end_time` date DEFAULT NULL COMMENT '结息日(年月日) 起息日加期限减一',
  `expire_time` date DEFAULT NULL COMMENT '回款日(年月日) 目前回款日为结息日后一个工作日',
  `asset_status` varchar(2) DEFAULT '1' COMMENT '资产状态 1 成立，2 存续，3 还款中，4 超时(逾期)，5 待兑付，6 兑付中，7 已兑付，8 兑付失败',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_loan_order_no` (`loan_order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='债权信息';
