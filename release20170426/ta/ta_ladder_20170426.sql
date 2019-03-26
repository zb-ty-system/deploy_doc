/*
Navicat MySQL Data Transfer

Source Server         : 192.168.0.76
Source Server Version : 50619
Source Host           : 192.168.0.76:3306
Source Database       : ta_ladder

Target Server Type    : MYSQL
Target Server Version : 50619
File Encoding         : 65001

Date: 2017-04-26 13:51:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ladder_account_info
-- ----------------------------
DROP TABLE IF EXISTS `ladder_account_info`;
CREATE TABLE `ladder_account_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `cert_type` varchar(32) DEFAULT NULL COMMENT '证件类型',
  `cert_no` varchar(32) DEFAULT NULL COMMENT '证件号码',
  `ta_account_no` varchar(32) DEFAULT NULL COMMENT 'ta账号',
  `status` varchar(32) DEFAULT NULL COMMENT '账户状态 NORMAL:正常,FROZEN:冻结,CLOSED:销户',
  `create_time` datetime DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_by` varchar(64) DEFAULT NULL,
  `member_name` varchar(64) DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='用户交易账户表';

-- ----------------------------
-- Table structure for ladder_batch
-- ----------------------------
DROP TABLE IF EXISTS `ladder_batch`;
CREATE TABLE `ladder_batch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_biz_code` varchar(8) DEFAULT NULL COMMENT '022-申购申请 122-申购确认 024-赎回 025-预约赎回 124-赎回确认 125预约赎回确认 201-每日收益 301-还款计划',
  `file_name` varchar(256) DEFAULT NULL COMMENT '文件名',
  `file_path` varchar(512) DEFAULT NULL COMMENT '文件路径',
  `status` varchar(32) DEFAULT NULL COMMENT 'INIT:初始化,COMPLETE:处理完成,PROCESS_FAIL:处理异常,DATA_SUCCESS:数据处理完成;\r\nASSET_SUCCESS:资产匹配完成;FILE_UPLOADING:文件上传中;FILE_UPLOADED:文件上传完成;PROCESSING：处理中；DATA_PROCESSING：数据落地钟；CONFIRM_SUCCESS：已确认；ASSET_SUCCESS：资产匹配完成；FILE_UPLOADING：文件上传中；UPLOAD_COMPLETE：文件上传完成',
  `thirdparty_batch_no` varchar(32) DEFAULT NULL COMMENT '交易系统文件批次号',
  `batch_no` char(32) DEFAULT NULL COMMENT '批次号',
  `parent_batch_no` varchar(32) DEFAULT NULL COMMENT '关联的批次号',
  `product_code` varchar(64) DEFAULT NULL COMMENT '产品编号',
  `total_amount` decimal(16,4) DEFAULT NULL COMMENT '总金额',
  `total_count` int(11) DEFAULT NULL COMMENT '总记录数',
  `current_line_no` int(11) DEFAULT NULL COMMENT '文件读取行数',
  `retry_times` tinyint(4) DEFAULT NULL COMMENT '重试次数',
  `memo` varchar(512) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_by` varchar(64) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `version` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24520 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ladder_daily_income
-- ----------------------------
DROP TABLE IF EXISTS `ladder_daily_income`;
CREATE TABLE `ladder_daily_income` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `trade_account_no` varchar(64) DEFAULT NULL COMMENT '交易账号',
  `product_code` varchar(64) DEFAULT NULL COMMENT '产品code',
  `app_sheet_no` varchar(64) DEFAULT NULL COMMENT 'TA投资记录流水号',
  `trade_serial_no` varchar(64) DEFAULT NULL COMMENT '交易系统流水号',
  `yield` decimal(12,8) DEFAULT NULL COMMENT '年化收益率',
  `invest_amount` decimal(16,4) DEFAULT NULL COMMENT '本金',
  `interest_amount` decimal(16,4) DEFAULT NULL COMMENT '计息本金',
  `income` decimal(16,4) DEFAULT NULL COMMENT '收益',
  `income_date` date DEFAULT NULL COMMENT '收益日期',
  `total_stage_count` int(3) DEFAULT NULL COMMENT '总期数',
  `current_stage_num` int(3) DEFAULT NULL COMMENT '当前期数',
  `have_days` int(3) DEFAULT NULL COMMENT '已持有天数',
  `surplus_days` int(3) DEFAULT NULL COMMENT '剩余天数',
  `next_open_date` date DEFAULT NULL COMMENT '下个开放赎回日期',
  `status` varchar(16) DEFAULT NULL COMMENT '状态：INIT 初始化 ；SUCCESS：已生成文件',
  `platform_member_id` varchar(64) DEFAULT NULL,
  `sale_channel` varchar(8) DEFAULT NULL COMMENT '渠道 唐小僧 TXS|企业理财QYLIC|摇旺YW',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ladder_error_log
-- ----------------------------
DROP TABLE IF EXISTS `ladder_error_log`;
CREATE TABLE `ladder_error_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `request_param` longtext,
  `error_time` datetime DEFAULT NULL,
  `error_method` varchar(64) DEFAULT NULL,
  `error_message` longtext,
  `trace` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ladder_invest_asset_match
-- ----------------------------
DROP TABLE IF EXISTS `ladder_invest_asset_match`;
CREATE TABLE `ladder_invest_asset_match` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `app_sheet_no` varchar(64) DEFAULT NULL COMMENT 'TA流水号',
  `trade_amount` decimal(16,4) DEFAULT NULL COMMENT '交易金额',
  `product_code` varchar(64) DEFAULT NULL COMMENT '产品code',
  `asset_code` varchar(64) DEFAULT NULL COMMENT '资产code',
  `matched_amount` decimal(16,4) DEFAULT NULL COMMENT '匹配金额',
  `release_amount` decimal(16,4) DEFAULT NULL COMMENT '释放金额',
  `using_amount` decimal(16,4) DEFAULT NULL COMMENT '占用金额',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  `create_time` datetime DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ladder_invest_record
-- ----------------------------
DROP TABLE IF EXISTS `ladder_invest_record`;
CREATE TABLE `ladder_invest_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `trade_account_no` varchar(64) DEFAULT NULL COMMENT 'TA交易账号',
  `platform_member_id` varchar(64) DEFAULT NULL COMMENT '平台用户ID',
  `trade_serial_no` varchar(64) DEFAULT NULL COMMENT '交易系统流水号',
  `app_sheet_no` varchar(64) DEFAULT NULL COMMENT '投资申请流水号',
  `sale_channel` varchar(8) DEFAULT NULL COMMENT '渠道 唐小僧 TXS|企业理财QYLIC|摇旺YW',
  `invest_amount` decimal(16,4) DEFAULT NULL COMMENT '投资金额',
  `invest_time` datetime DEFAULT NULL COMMENT '投资时间',
  `cert_type` varchar(32) DEFAULT NULL COMMENT '证件类型',
  `cert_no` varchar(32) DEFAULT NULL COMMENT '证件号码',
  `member_name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `product_code` varchar(64) DEFAULT NULL COMMENT '产品编号',
  `status` varchar(32) DEFAULT NULL COMMENT '投资状态：INIT:初始化,DATA_PROCESSING:数据处理中,CONFIRM_SUCCESS:投资成功,CONFIRM_FAIL:投资失败;',
  `asset_match_status` varchar(32) DEFAULT NULL COMMENT '资产匹配状态：UNMATCHED:未匹配,MATCHED:匹配成功,FAILED:匹配失败;',
  `version` int(11) DEFAULT '1' COMMENT '版本号',
  `create_by` varchar(64) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modify_by` varchar(64) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `batch_no` varchar(64) DEFAULT NULL COMMENT '文件批次号',
  `order_time` datetime DEFAULT NULL COMMENT '订单时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='用户投资记录表';

-- ----------------------------
-- Table structure for ladder_product
-- ----------------------------
DROP TABLE IF EXISTS `ladder_product`;
CREATE TABLE `ladder_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `product_code` varchar(64) DEFAULT NULL COMMENT '产品编号',
  `product_name` varchar(128) DEFAULT NULL COMMENT '产品名称',
  `product_line_code` varchar(64) DEFAULT NULL COMMENT '产品线编号',
  `pattern_code` varchar(8) DEFAULT NULL COMMENT '产品的类型代码(01:现金管理, 02:定期类, 03:净值型)',
  `sale_channel` varchar(8) DEFAULT NULL COMMENT '销售机构代码 唐小僧 TXS|企业理财QYLIC|摇旺YW',
  `product_status` varchar(32) DEFAULT NULL COMMENT 'REGISTERED("REGISTERED", "已登记"), AIT_ESTABLISH("WAIT_ESTABLISH","待成立"),\r\nESTABLISH("ESTABLISH","已成立"),\r\nBEARING("BEARING","开始计息"),\r\nEXPIRE("EXPIRE","到期"),\r\nWAIT_SETTLE("WAIT_SETTLE","待结清"),\r\nSETTLE("SETTLE","结清"),\r\nFLOW_STANDARD("FLOW_STANDARD","流标");AUDIT_NOT_PASS("AUDIT_NOT_PASS","审核不通过")',
  `duration` int(8) DEFAULT NULL COMMENT '存续期',
  `duration_unit` varchar(8) DEFAULT NULL COMMENT '存续期单位',
  `product_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '产品规模',
  `calendar_mode` varchar(32) DEFAULT NULL COMMENT '日历模式 1：自然日 2：交易日',
  `interest_date` date DEFAULT NULL COMMENT '起息日',
  `establish_date` date DEFAULT NULL COMMENT '成立日',
  `expire_date` date DEFAULT NULL COMMENT '到期日',
  `settlement_date` date DEFAULT NULL COMMENT '结清日',
  `stage_num` int(11) DEFAULT NULL COMMENT '循环周期，表示多少天一个阶梯',
  `total_interest_stage_count` int(11) DEFAULT NULL COMMENT '总循环轮次',
  `memo` varchar(1024) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_by` varchar(64) DEFAULT NULL,
  `increase_yield` decimal(12,8) DEFAULT NULL COMMENT '收益递增系数',
  `yield` decimal(12,8) DEFAULT NULL COMMENT '基础收益',
  `interest_days` int(11) DEFAULT NULL COMMENT '计息天数(默认365)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8 COMMENT='产品登记表';

-- ----------------------------
-- Table structure for ladder_product_asset
-- ----------------------------
DROP TABLE IF EXISTS `ladder_product_asset`;
CREATE TABLE `ladder_product_asset` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `product_code` varchar(64) DEFAULT NULL COMMENT '产品代码',
  `asset_code` varchar(64) DEFAULT NULL COMMENT '资产代码',
  `asset_assign_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '资产分配金额',
  `asset_matched_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '已匹配金额',
  `asset_released_amount` decimal(16,4) DEFAULT NULL COMMENT '已释放金额',
  `match_status` varchar(32) DEFAULT NULL COMMENT '匹配状态 UNMATCHED 未完成,MATCH_FAILED 匹配失败,MATCHED 已完成',
  `asset_name` varchar(64) DEFAULT NULL COMMENT '资产名称',
  `asset_date` date DEFAULT NULL COMMENT '资产到期时间',
  `priority` int(4) DEFAULT NULL COMMENT '匹配优先级',
  `create_time` datetime DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_by` varchar(64) DEFAULT NULL,
  `asset_pool_code` varchar(64) DEFAULT NULL COMMENT '资产池编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COMMENT='产品-资产登记表';

-- ----------------------------
-- Table structure for ladder_product_ladder
-- ----------------------------
DROP TABLE IF EXISTS `ladder_product_ladder`;
CREATE TABLE `ladder_product_ladder` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `product_code` varchar(64) DEFAULT NULL COMMENT '产品代码',
  `stage_begin_date` date DEFAULT NULL COMMENT '阶段开始日期',
  `stage_end_date` date DEFAULT NULL COMMENT '阶段结束日期',
  `yield` decimal(12,8) DEFAULT NULL COMMENT '年华收益率',
  `total_stage_count` int(11) DEFAULT NULL COMMENT '总期数',
  `current_stage_num` int(3) DEFAULT NULL COMMENT '当前期数',
  `redeem_date` date DEFAULT NULL COMMENT '回款日',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4445 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ladder_redeem_record
-- ----------------------------
DROP TABLE IF EXISTS `ladder_redeem_record`;
CREATE TABLE `ladder_redeem_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `product_code` varchar(64) DEFAULT NULL COMMENT '产品代码',
  `trade_account_no` varchar(64) DEFAULT NULL COMMENT '交易账户',
  `platform_member_id` varchar(64) DEFAULT NULL COMMENT '平台用户ID',
  `sale_channel` varchar(8) DEFAULT NULL COMMENT '渠道 唐小僧 TXS|企业理财QYLIC|摇旺YW',
  `trade_serial_no` varchar(64) DEFAULT NULL COMMENT '交易系统的交易流水号',
  `app_sheet_no` varchar(64) DEFAULT NULL COMMENT '认购记录编号',
  `redeem_trade_time` datetime DEFAULT NULL COMMENT '发起赎回的时间',
  `redeem_amount` decimal(16,4) DEFAULT NULL COMMENT '赎回金额',
  `redeem_date` date DEFAULT NULL COMMENT '赎回日期',
  `expected_redeem_date` date DEFAULT NULL COMMENT '预计赎回日期',
  `status` varchar(32) DEFAULT NULL COMMENT 'INIT:待处理；EXPECTING:预约赎回中；REDEEMED:已赎回；',
  `redeem_income` decimal(16,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ladder_sequence
-- ----------------------------
DROP TABLE IF EXISTS `ladder_sequence`;
CREATE TABLE `ladder_sequence` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `sequence_name` varchar(32) NOT NULL COMMENT '序列号名称',
  `current_val` int(11) NOT NULL DEFAULT '0' COMMENT '当前值',
  `sequence_step` int(11) NOT NULL DEFAULT '1' COMMENT '步长',
  `version` int(11) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_id` (`id`) USING BTREE,
  UNIQUE KEY `idx_sequence_name` (`sequence_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='TA系统序列表';

-- ----------------------------
-- Table structure for ladder_stage_income_plan
-- ----------------------------
DROP TABLE IF EXISTS `ladder_stage_income_plan`;
CREATE TABLE `ladder_stage_income_plan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `app_sheet_no` varchar(64) DEFAULT NULL COMMENT '最终认购记录编号(投资申请流水号)',
  `product_code` varchar(64) DEFAULT NULL COMMENT '产品code',
  `trade_serial_no` varchar(64) DEFAULT NULL COMMENT '交易流水号(删除?)',
  `trade_account_no` varchar(64) DEFAULT NULL COMMENT 'TA交易账户',
  `yield` decimal(12,8) DEFAULT NULL COMMENT '本期收益率',
  `interest_days` int(11) DEFAULT NULL COMMENT '计息天数(默认365)',
  `total_stage_count` int(3) DEFAULT NULL COMMENT '总期数',
  `current_stage_num` int(3) DEFAULT NULL COMMENT '当前期数',
  `total_day_count` int(3) DEFAULT NULL COMMENT '每期总共多少天',
  `stage_begin_date` date DEFAULT NULL COMMENT '本阶梯开始日期',
  `stage_end_date` date DEFAULT NULL COMMENT '本阶梯结束日期',
  `invest_amount` decimal(16,4) DEFAULT NULL COMMENT '投资金额',
  `interest_amount` decimal(16,4) DEFAULT NULL COMMENT '计息金额',
  `expected_total_income` decimal(16,4) DEFAULT NULL COMMENT '预计累计收益',
  `expected_current_income` decimal(16,4) DEFAULT NULL COMMENT '预计本期收益',
  `status` varchar(32) DEFAULT NULL COMMENT 'INIT:初始化;PROCESSING:处理中;INIT_FILE_SUCCESS;初始生成文件成功;COMPLETE:处理结束;ADVANCE_REDEEM:提前全部兑付;',
  `income_process_date` date DEFAULT NULL COMMENT '收益处理日期',
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `platform_member_id` varchar(64) DEFAULT NULL,
  `sale_channel` varchar(8) DEFAULT NULL COMMENT '渠道 唐小僧 TXS|企业理财QYLIC|摇旺YW',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=519 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ladder_trade_account_info
-- ----------------------------
DROP TABLE IF EXISTS `ladder_trade_account_info`;
CREATE TABLE `ladder_trade_account_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `ta_account_no` varchar(32) DEFAULT NULL COMMENT 'ta账户',
  `trade_account_no` varchar(32) DEFAULT NULL COMMENT '交易账户',
  `sale_channel` varchar(32) DEFAULT NULL COMMENT '渠道 TXS-唐小僧 QYLC-企业理财 YW-摇旺',
  `product_code` varchar(32) DEFAULT NULL COMMENT '产品代码',
  `invest_amount` decimal(16,4) DEFAULT NULL COMMENT '本金',
  `interest_amount` decimal(16,4) DEFAULT NULL COMMENT '参与计息金额',
  `total_income` decimal(16,4) DEFAULT NULL COMMENT '累计总收益',
  `withdrawed_income` decimal(16,4) DEFAULT NULL COMMENT '已提取收益',
  `status` varchar(32) DEFAULT NULL COMMENT '账户状态 NORMAL:正常,FROZEN:冻结,CLOSED:已销户',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  `create_time` datetime DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ladder_trade_account_transaction
-- ----------------------------
DROP TABLE IF EXISTS `ladder_trade_account_transaction`;
CREATE TABLE `ladder_trade_account_transaction` (
  `id` int(16) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `trade_account_no` varchar(32) DEFAULT NULL COMMENT '交易账户',
  `change_type` varchar(32) DEFAULT NULL COMMENT 'OPEN:产品账户开户, CONFIRMED:投资确认-金额增加,INTEREST:利息发放-金额增加,REDEEM 提前赎回,金额减少,CASHED:产品兑付-金额减小,FROZEN:产品账户冻结,CLOSED:产品账户销户;',
  `change_amount` decimal(16,4) DEFAULT NULL COMMENT '变动金额',
  `create_time` datetime DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_by` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;




ALTER TABLE `ladder_account_info`
ADD UNIQUE INDEX `certTypeAndNo` (`cert_type`, `cert_no`) USING BTREE ;


ALTER TABLE `ladder_trade_account_info`
ADD UNIQUE INDEX `accountAndSalAndProduct` (`ta_account_no`, `sale_channel`, `product_code`) USING BTREE ;

ALTER TABLE `ladder_batch`
MODIFY COLUMN `status`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'INIT:初始化,COMPLETE:处理完成,PROCESS_FAIL:处理异常,DATA_SUCCESS:数据处理完成；PROCESSING：处理中；CONFIRM_SUCCESS：已确认；ASSET_SUCCESS：资产匹配完成；FILE_UPLOADING：文件上传中；UPLOAD_COMPLETE：文件上传完成；' AFTER `file_path`,
MODIFY COLUMN `thirdparty_batch_no`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易系统文件批次号' AFTER `status`,
MODIFY COLUMN `batch_no`  char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批次号' AFTER `thirdparty_batch_no`;