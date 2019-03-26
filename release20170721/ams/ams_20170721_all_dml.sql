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

/**
  审核参数基础数据
 */
INSERT INTO `ams_global_config` (`id`, `group_name`, `property_name`, `property_value`, `property_desc`, `create_time`, `modify_time`) VALUES ('2', 'approval_sign', 'batch_asset_approval_sign', 'A,B', '资产审核授权等级', '2017-06-14 09:59:31', '2017-07-03 10:34:22');

/**
 * 新增字段 ams_asset
 */
alter table ams_asset add publish_info longtext comment '披露信息(JSON格式)';


/**
 * 新增字段 ams_asset_exchange_register
 */
alter table ams_asset_exchange_register add register_name varchar(256) comment '备案名称' after register_status;
alter table ams_asset_exchange_register add register_rate decimal(12,8) comment '备案利率' after register_name;

/**
 * 新增字段 ams_finance_subject
 */
alter table ams_finance_subject add tel varchar(32) comment '电话' after business_scope;
alter table ams_finance_subject add email varchar(32) comment '邮箱' after tel;

/**
 * 新增字段 ams_exchange
 */
alter table ams_exchange add exchange_rate decimal(12,8) comment '交易所费率' after introduction;

/**
* 机构数据
 */
INSERT INTO `ams_finance_subject` (`subject_code`, `subject_name`, `subject_show_name`, `cert_type`, `cert_no`, `cert_no_show_name`, `registered_capital`, `subject_address`, `legal_person_name`, `legal_person_cert_no`, `business_scope`, `tel`, `email`, `introduction`, `status`, `create_time`, `create_by`, `modify_time`, `modify_by`) VALUES ( 'TRA1700701', '深圳前海金融资产交易所有限公司', 'SZQH金融资产交易所有限公司', NULL, '91440300571975004R', NULL, '100000.0000', '广州市南沙区丰泽东路（自编1号楼）X1301-C2050（仅限办公用途）(JM) ', '张三', NULL, NULL, NULL, NULL, NULL, NULL, '2017-07-08 13:01:23', 'SYS', '2017-07-10 19:03:58', 'SYS');
INSERT INTO `ams_finance_subject` (`subject_code`, `subject_name`, `subject_show_name`, `cert_type`, `cert_no`, `cert_no_show_name`, `registered_capital`, `subject_address`, `legal_person_name`, `legal_person_cert_no`, `business_scope`, `tel`, `email`, `introduction`, `status`, `create_time`, `create_by`, `modify_time`, `modify_by`) VALUES ('GZRZ', '广州融早资产管理有限公司', NULL, NULL, '341021197801248384', NULL, '0.0000', '广州市南沙区丰泽东路（自编1号楼）X1301-C2050（仅限办公用途）(JM) ', '朱兵龙', NULL, NULL, '15221830960', '13564473683@163.com', NULL, NULL, '2017-07-10 17:41:03', 'SYS', '2017-07-10 19:56:47', 'SYS');
INSERT INTO `ams_finance_subject` (`subject_code`, `subject_name`, `subject_show_name`, `cert_type`, `cert_no`, `cert_no_show_name`, `registered_capital`, `subject_address`, `legal_person_name`, `legal_person_cert_no`, `business_scope`, `tel`, `email`, `introduction`, `status`, `create_time`, `create_by`, `modify_time`, `modify_by`) VALUES ( 'GTBL', '国通商业保理（天津）有限公司', '', NULL, '3410211978012483', '', '0.0000', '天津自贸区（东疆保税港区）洛阳道601号（海丰物流园7区2单元-641）', '方红美', '', '以受让应收账款的方式提供贸易融资；应收账款的收付结算、管理与催收；销售分户（分类）账管理；与本公司业务相关的非商业性坏账担保；客户资信调查与评估；相关咨询服务等', '15221830960', '13564473683@163.com', '公司致力于打造卓越的中小企业供应链金融服务平台，深入了解中小企业的需求，采用不断创新的供应链金融服务模式，为广大中小企业提供贸易融资、销售分户账管理、客户资信调查与评估、应收账款管理与催收、信用风险担保等服务。”', NULL, '2017-07-10 17:41:03', 'SYS', '2017-07-10 19:56:48', 'SYS');
INSERT INTO `ams_finance_subject` (`subject_code`, `subject_name`, `subject_show_name`, `cert_type`, `cert_no`, `cert_no_show_name`, `registered_capital`, `subject_address`, `legal_person_name`, `legal_person_cert_no`, `business_scope`, `tel`, `email`, `introduction`, `status`, `create_time`, `create_by`, `modify_time`, `modify_by`) VALUES ( 'ZS', '资顺（三亚）小额贷款有限公司', '', NULL, '91460200MA5RC4XN5Q', '', '0.0000', '海南省三亚市海棠湾镇龙海起步区内C3-11房', '方艳萍', '', '', '15221830960', '13564473683@163.com', '公司秉持“小额、分散”的原则，向个人和微型企业提供信贷服务，加强信贷产品创新，如联保贷款、收益抵押贷款、小额授信贷款等以及不同期限、不同付息方式的信贷产品，不断创新信贷经营管理模式，切实加强贷款管理，形成拥有自己贷款特色的核心竞争力。', NULL, '2017-07-10 17:41:03', 'SYS', '2017-07-10 19:56:48', 'SYS');
INSERT INTO `ams_finance_subject` (`subject_code`, `subject_name`, `subject_show_name`, `cert_type`, `cert_no`, `cert_no_show_name`, `registered_capital`, `subject_address`, `legal_person_name`, `legal_person_cert_no`, `business_scope`, `tel`, `email`, `introduction`, `status`, `create_time`, `create_by`, `modify_time`, `modify_by`) VALUES ('HZXT', '杭州迅途资产管理有限公司', '', NULL, '41021197801248384', '', '0.0000', '杭州市余杭区临平街道望梅路588号15幢3单元401室-3', '王春燕', '', '', '15221830960', '13564473683@163.com', '', NULL, '2017-07-10 17:41:03', 'SYS', '2017-07-10 19:56:49', 'SYS');

/**
* 交易所数据
 */
INSERT INTO `ams_exchange` (`exchange_code`, `exchange_name`, `cert_type`, `cert_no`, `province`, `registered_capital`, `introduction`, `exchange_rate`, `create_time`, `create_by`, `modify_time`, `modify_by`) VALUES ('SZQH', '深圳前海金融资产交易所有限公司', '2', NULL, NULL, '0.0000', NULL, '0.00300000', '2017-07-10 16:24:38', NULL, '2017-07-10 19:48:23', 'SYS');





