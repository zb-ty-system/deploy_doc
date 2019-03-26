/*
Navicat MySQL Data Transfer

Source Server         : dev76
Source Server Version : 50619
Source Host           : 192.168.0.76:3306
Source Database       : ams_batch

Target Server Type    : MYSQL
Target Server Version : 50619
File Encoding         : 65001

Date: 2017-07-06 14:24:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ams_asset_exchange_register
-- ----------------------------
DROP TABLE IF EXISTS `ams_asset_exchange_register`;
CREATE TABLE `ams_asset_exchange_register` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `asset_code` varchar(32) DEFAULT NULL COMMENT '资产编码',
  `exchange_register_batch_no` varchar(32) DEFAULT NULL COMMENT '备案批次号',
  `trade_inst_code` varchar(32) DEFAULT NULL COMMENT '交易所编码',
  `delisted_inst_code` varchar(32) DEFAULT NULL COMMENT '摘牌方编码',
  `listed_inst_code` varchar(32) DEFAULT NULL COMMENT '挂牌方编码',
  `status` varchar(32) DEFAULT NULL COMMENT '状态:1-正常,2-不可用',
  `register_status` varchar(32) DEFAULT NULL COMMENT '备案状态:1:未备案,2:备案中,3:生成合同,4:备案完成,5:备案失败',
  `memo` varchar(256) DEFAULT NULL COMMENT '备注',
  `version` bigint(20) DEFAULT '0' COMMENT '版本号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='资产备案信息表';

-- ----------------------------
-- Table structure for ams_asset_issue_relation
-- ----------------------------
DROP TABLE IF EXISTS `ams_asset_issue_relation`;
CREATE TABLE `ams_asset_issue_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `asset_code` varchar(32) DEFAULT NULL COMMENT '资产编码',
  `issue_id` bigint(20) DEFAULT NULL,
  `batch_no` varchar(32) DEFAULT NULL COMMENT '录入批次号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8 COMMENT='资产和发行计划关联关系表';

-- ----------------------------
-- Table structure for ams_business_credit
-- ----------------------------
DROP TABLE IF EXISTS `ams_business_credit`;
CREATE TABLE `ams_business_credit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `batch_no` varchar(32) DEFAULT NULL COMMENT '录入批次号',
  `credit_business_code` varchar(32) DEFAULT NULL COMMENT '授信业务编码',
  `credit_limit_amount` decimal(16,4) DEFAULT NULL COMMENT '授信额度',
  `financing_name` varchar(256) DEFAULT NULL COMMENT '融资方',
  `cert_no` varchar(64) DEFAULT NULL COMMENT '证件号码',
  `legal_person_name` varchar(256) DEFAULT NULL COMMENT '法人代表姓名',
  `contact_way` varchar(64) DEFAULT NULL COMMENT '联系方式',
  `address` varchar(256) DEFAULT NULL COMMENT '地址',
  `financing_purpose` varchar(256) DEFAULT NULL COMMENT '用途',
  `yield_rate` decimal(12,8) DEFAULT NULL COMMENT '收益率',
  `value_start_time` datetime DEFAULT NULL COMMENT '起息日',
  `value_end_time` datetime DEFAULT NULL COMMENT '结息日',
  `day_count` int(4) DEFAULT NULL COMMENT '天数',
  `repayment_type` int(2) DEFAULT NULL COMMENT '还款方式',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='业务授信表';

-- ----------------------------
-- Table structure for ams_file_template
-- ----------------------------
DROP TABLE IF EXISTS `ams_file_template`;
CREATE TABLE `ams_file_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `template_code` varchar(32) DEFAULT NULL COMMENT '模板编码',
  `file_serial_no` varchar(64) DEFAULT NULL COMMENT '文件序列号(oss文件名)',
  `file_name` varchar(128) DEFAULT NULL COMMENT '文件名',
  `file_path` varchar(256) DEFAULT NULL COMMENT '文件路径',
  `version` bigint(20) DEFAULT '0' COMMENT '版本号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='合同文件模板';

-- ----------------------------
-- Table structure for ams_file_template_param
-- ----------------------------
DROP TABLE IF EXISTS `ams_file_template_param`;
CREATE TABLE `ams_file_template_param` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `template_code` varchar(32) DEFAULT NULL COMMENT '模板编码',
  `asset_code` varchar(32) DEFAULT NULL COMMENT '资产编码',
  `template_content` longtext COMMENT '模板内容(包含html标签)',
  `template_param` longtext COMMENT '模板参数(json字符串)',
  `contract_batch_no` varchar(64) DEFAULT NULL COMMENT '合同批次号',
  `step_code` int(4) DEFAULT NULL COMMENT '步骤编码',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态:1未生成,2已生成',
  `version` bigint(20) DEFAULT '0' COMMENT '版本号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='文件模板参数';

-- ----------------------------
-- Table structure for ams_issue_plan
-- ----------------------------
DROP TABLE IF EXISTS `ams_issue_plan`;
CREATE TABLE `ams_issue_plan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `credit_business_code` varchar(32) DEFAULT NULL COMMENT '业务授信编码',
  `batch_no` varchar(32) DEFAULT NULL COMMENT '录入批次号',
  `product_day_count` int(4) DEFAULT NULL COMMENT '产品天数',
  `contract_day_count` int(4) DEFAULT NULL COMMENT '合同天数',
  `value_start_time` datetime DEFAULT NULL COMMENT '合同起息(备案开始)时间',
  `value_end_time` datetime DEFAULT NULL COMMENT '合同结息(备案完成)时间',
  `free_start_time` datetime DEFAULT NULL COMMENT '空档开始时间',
  `free_end_time` datetime DEFAULT NULL COMMENT '空档结束时间',
  `sale_start_time` datetime DEFAULT NULL COMMENT '募集开始时间',
  `sale_end_time` datetime DEFAULT NULL COMMENT '募集结束时间',
  `product_value_start_time` datetime DEFAULT NULL COMMENT '产品计息开始时间',
  `product_value_end_time` datetime DEFAULT NULL COMMENT '产品结息时间(合同结息)',
  `single_amount` decimal(16,4) DEFAULT NULL COMMENT '单包金额',
  `asset_count` int(4) DEFAULT NULL COMMENT '个数',
  `total_amount` decimal(16,4) DEFAULT NULL COMMENT '总金额',
  `subject_code` varchar(32) DEFAULT NULL COMMENT '发行方编码',
  `memo` varchar(256) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='资产发行计划';


/**
  新增字段 ams_asset
 */
alter table ams_asset add register_type tinyint(2) comment '注册类型：1-普通录入，2-备案录入';
alter table ams_asset add storage_status tinyint(2) comment '资产入库状态:1-已入库,2-未入库';