/*
Navicat MySQL Data Transfer

Source Server         : dev76
Source Server Version : 50619
Source Host           : 192.168.0.76:3306
Source Database       : ams

Target Server Type    : MYSQL
Target Server Version : 50619
File Encoding         : 65001

Date: 2017-04-26 15:13:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ams_asset
-- ----------------------------
DROP TABLE IF EXISTS `ams_asset`;
CREATE TABLE `ams_asset` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `asset_code` varchar(32) DEFAULT NULL COMMENT '资产编号',
  `asset_name` varchar(64) DEFAULT NULL COMMENT '资产名称',
  `asset_type` tinyint(2) DEFAULT NULL COMMENT '资产类型',
  `collect_status` tinyint(2) DEFAULT NULL COMMENT '募集状态',
  `approval_require_sign` varchar(32) DEFAULT NULL COMMENT '审核需要签名',
  `approval_sign` varchar(32) DEFAULT NULL COMMENT '已审核签名',
  `approval_status` tinyint(2) DEFAULT NULL COMMENT '审核状态',
  `asset_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '资产总规模',
  `distribute_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '已分配给资产池总额',
  `stock_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '资产库存余额',
  `frozen_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '冻结金额(已关联产品,未匹配用户)',
  `sale_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '资产已售金额(实际已匹配给用户的金额)',
  `finance_subject_id` bigint(20) DEFAULT NULL COMMENT '融资主体ID',
  `finance_subject_code` varchar(32) DEFAULT NULL COMMENT '融资主体编码',
  `establish_time` timestamp NULL DEFAULT NULL COMMENT '成立日',
  `value_start_time` timestamp NULL DEFAULT NULL COMMENT '起息日',
  `value_end_time` timestamp NULL DEFAULT NULL COMMENT '止息日',
  `expire_time` timestamp NULL DEFAULT NULL COMMENT '到期日',
  `transfer_lock_days` int(11) DEFAULT '0' COMMENT '转让锁定期',
  `value_days` int(4) DEFAULT NULL COMMENT '期限(单位:天)',
  `yield_rate` decimal(12,8) DEFAULT '0.00000000' COMMENT '预期年化收益率',
  `min_invest_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '起投金额',
  `increase_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '递增金额(步长)',
  `repayment_type` tinyint(2) DEFAULT NULL COMMENT '还款方式',
  `asset_desc` varchar(1024) DEFAULT NULL COMMENT '资产描述',
  `finance_project` varchar(64) DEFAULT NULL COMMENT '融资项目',
  `project_desc` longtext COMMENT '融资项目描述',
  `repay_guarentee_mode` longtext COMMENT '还款保障措施',
  `credit_mode` longtext COMMENT '增信措施',
  `version` bigint(20) DEFAULT '0' COMMENT '版本号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_asset_code` (`asset_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='资产信息表';

-- ----------------------------
-- Table structure for ams_asset_approval
-- ----------------------------
DROP TABLE IF EXISTS `ams_asset_approval`;
CREATE TABLE `ams_asset_approval` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `asset_id` bigint(20) DEFAULT NULL COMMENT '资产主键',
  `asset_code` varchar(32) DEFAULT NULL COMMENT '资产编号',
  `sign` varchar(8) DEFAULT NULL COMMENT '授权级别',
  `approval_status` tinyint(2) DEFAULT NULL COMMENT '审核状态:1:审核通过，2:审核未通过',
  `approval_suggestion` varchar(256) DEFAULT NULL COMMENT '审核意见',
  `approval_by` varchar(32) DEFAULT NULL COMMENT '审核者',
  `approval_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '审核时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_asset_id` (`asset_id`) USING BTREE,
  KEY `idx_asset_code` (`asset_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产审核信息表';

-- ----------------------------
-- Table structure for ams_asset_pool_relation
-- ----------------------------
DROP TABLE IF EXISTS `ams_asset_pool_relation`;
CREATE TABLE `ams_asset_pool_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `pool_id` bigint(20) DEFAULT NULL COMMENT '资产池主键',
  `pool_code` varchar(32) DEFAULT NULL COMMENT '资产池编号',
  `asset_id` bigint(20) DEFAULT NULL COMMENT '资产主键',
  `asset_code` varchar(32) DEFAULT NULL COMMENT '资产编号',
  `relation_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '资产关联到资产池金额',
  `stock_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '库存金额(未分配给产品的金额)',
  `frozen_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '冻结金额(已分配给产品,未分配给用户的金额)',
  `sale_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '已售金额(已分配给用户的金额)',
  `version` bigint(20) DEFAULT '0' COMMENT '版本号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后修改者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_pool_id` (`pool_id`) USING BTREE,
  KEY `idx_pool_code` (`pool_code`) USING BTREE,
  KEY `idx_asset_id` (`asset_id`) USING BTREE,
  KEY `idx_asset_code` (`asset_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='资产与资产池关联信息表';

-- ----------------------------
-- Table structure for ams_asset_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `ams_asset_product_relation`;
CREATE TABLE `ams_asset_product_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `product_code` varchar(32) DEFAULT NULL COMMENT '产品编码',
  `pool_id` bigint(20) DEFAULT NULL COMMENT '资产池主键',
  `pool_code` varchar(32) DEFAULT NULL COMMENT '资产池编号',
  `asset_id` bigint(20) DEFAULT NULL COMMENT '资产主键',
  `asset_code` varchar(32) DEFAULT NULL COMMENT '资产编码',
  `asset_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '资产分配给产品的金额',
  `sale_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '产品已售金额',
  `release_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '释放金额',
  `product_expire_time` timestamp NULL DEFAULT NULL COMMENT '产品到期日',
  `version` bigint(20) DEFAULT '0' COMMENT '版本号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后修改者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_product_code` (`product_code`) USING BTREE,
  KEY `idx_pool_id` (`pool_id`) USING BTREE,
  KEY `idx_pool_code` (`pool_code`) USING BTREE,
  KEY `idx_asset_id` (`asset_id`) USING BTREE,
  KEY `idx_asset_code` (`asset_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='产品资产匹配关系表';

-- ----------------------------
-- Table structure for ams_asset_repay_plan
-- ----------------------------
DROP TABLE IF EXISTS `ams_asset_repay_plan`;
CREATE TABLE `ams_asset_repay_plan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `asset_id` bigint(20) DEFAULT NULL COMMENT '资产主键',
  `asset_code` varchar(32) DEFAULT NULL COMMENT '资产编号',
  `value_start_time` timestamp NULL DEFAULT NULL COMMENT '起息日',
  `value_end_time` timestamp NULL DEFAULT NULL COMMENT '止息日',
  `value_days` int(4) DEFAULT NULL COMMENT '期限(单位:天)',
  `expire_time` timestamp NULL DEFAULT NULL COMMENT '到期日',
  `yield_rate` decimal(12,8) DEFAULT '0.00000000' COMMENT '预期年化收益率',
  `repay_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '预期回款金额',
  `repay_principal` decimal(16,4) DEFAULT NULL COMMENT '回款本金',
  `repay_interest` decimal(16,4) DEFAULT NULL COMMENT '回款利息',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产还款计划表';

-- ----------------------------
-- Table structure for ams_consignee
-- ----------------------------
DROP TABLE IF EXISTS `ams_consignee`;
CREATE TABLE `ams_consignee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `consignee_code` varchar(32) DEFAULT NULL COMMENT '承销方编码',
  `consignee_name` varchar(256) DEFAULT NULL COMMENT '承销方名称',
  `cert_type` tinyint(2) DEFAULT NULL COMMENT '证件类型',
  `cert_no` varchar(64) DEFAULT NULL COMMENT '证件号码',
  `registered_capital` decimal(16,4) DEFAULT '0.0000' COMMENT '注册资本',
  `consignee_address` varchar(1024) DEFAULT NULL COMMENT '公司注册地址',
  `legal_person_name` varchar(32) DEFAULT NULL COMMENT '法人代表姓名',
  `legal_person_cert_no` varchar(32) DEFAULT NULL,
  `business_scope` longtext COMMENT '经营范围',
  `introduction` longtext COMMENT '简介',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后修改者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_consignee_code` (`consignee_code`) USING BTREE,
  KEY `idx_cert_no` (`cert_no`) USING BTREE,
  KEY `idx_legal_person_cert_no` (`legal_person_cert_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='承销方信息表';

-- ----------------------------
-- Table structure for ams_exchange
-- ----------------------------
DROP TABLE IF EXISTS `ams_exchange`;
CREATE TABLE `ams_exchange` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `exchange_code` varchar(32) DEFAULT NULL COMMENT '交易所编码',
  `exchange_name` varchar(256) DEFAULT NULL COMMENT '交易所名称',
  `cert_type` tinyint(2) DEFAULT NULL COMMENT '证件类型',
  `cert_no` varchar(64) DEFAULT NULL COMMENT '证件号码',
  `province` varchar(32) DEFAULT NULL COMMENT '所在省份',
  `registered_capital` decimal(16,4) DEFAULT '0.0000' COMMENT '注册资本',
  `introduction` longtext COMMENT '简介',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_exchange_code` (`exchange_code`) USING BTREE,
  KEY `idx_cert_no` (`cert_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='交易所信息表';

-- ----------------------------
-- Table structure for ams_finance_subject
-- ----------------------------
DROP TABLE IF EXISTS `ams_finance_subject`;
CREATE TABLE `ams_finance_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `subject_code` varchar(32) DEFAULT NULL COMMENT '融资主体编码',
  `subject_name` varchar(256) DEFAULT NULL COMMENT '融资主体名称',
  `cert_type` tinyint(2) DEFAULT NULL COMMENT '证件类型',
  `cert_no` varchar(64) DEFAULT NULL COMMENT '证件号码',
  `registered_capital` decimal(16,4) DEFAULT '0.0000' COMMENT '注册资本',
  `subject_address` varchar(1024) DEFAULT NULL COMMENT '公司注册地址',
  `legal_person_name` varchar(32) DEFAULT NULL COMMENT '法人代表姓名',
  `legal_person_cert_no` varchar(32) DEFAULT NULL COMMENT '法人代表身份证号码',
  `business_scope` longtext COMMENT '经营范围',
  `introduction` longtext COMMENT '简介',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_subject_code` (`subject_code`) USING BTREE,
  KEY `idx_cert_no` (`cert_no`) USING BTREE,
  KEY `idx_legal_person_cert_no` (`legal_person_cert_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='融资主体信息表';

-- ----------------------------
-- Table structure for ams_global_config
-- ----------------------------
DROP TABLE IF EXISTS `ams_global_config`;
CREATE TABLE `ams_global_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `group_name` varchar(255) DEFAULT NULL COMMENT '分组名称',
  `property_name` varchar(255) DEFAULT NULL COMMENT '属性名称',
  `property_value` varchar(255) DEFAULT NULL COMMENT '属性值',
  `property_desc` varchar(255) DEFAULT NULL COMMENT '属性描述',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_id` (`id`) USING BTREE,
  UNIQUE KEY `idx_property_name` (`property_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='资管系统全局参数表';

-- ----------------------------
-- Table structure for ams_pool
-- ----------------------------
DROP TABLE IF EXISTS `ams_pool`;
CREATE TABLE `ams_pool` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `pool_code` varchar(32) DEFAULT NULL COMMENT '资产池编码',
  `pool_name` varchar(32) DEFAULT NULL COMMENT '资产池名称',
  `pool_type` tinyint(2) DEFAULT NULL COMMENT '资产池类型',
  `limit_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '资产池总额上限',
  `total_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '资产池总规模(关联资产总额)',
  `stock_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '资产池库存金额(可用金额)',
  `frozen_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '冻结金额(已分配产品,未匹配给用户总金额)',
  `sale_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '已售金额(已匹配给用户总金额)',
  `status` tinyint(2) DEFAULT NULL COMMENT '资产池状态',
  `load_switch_status` tinyint(2) DEFAULT '1' COMMENT '装载开关',
  `finance_subject_id` bigint(20) DEFAULT NULL COMMENT '发行方ID',
  `finance_subject_code` varchar(32) DEFAULT NULL COMMENT '发行方编码',
  `trustee_id` bigint(20) DEFAULT NULL COMMENT '受托方ID',
  `trustee_code` varchar(32) DEFAULT NULL COMMENT '受托方编码',
  `pool_desc` longtext COMMENT '资产池描述',
  `version` bigint(20) DEFAULT '0' COMMENT '版本号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后修改者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_pool_code` (`pool_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='资产池信息表';

-- ----------------------------
-- Table structure for ams_sequence
-- ----------------------------
DROP TABLE IF EXISTS `ams_sequence`;
CREATE TABLE `ams_sequence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `sequence_name` varchar(32) DEFAULT NULL COMMENT '序列名称',
  `current_val` bigint(20) DEFAULT '0' COMMENT '当前值',
  `sequence_step` int(11) DEFAULT '1' COMMENT '步长',
  `version` bigint(20) DEFAULT '0' COMMENT '版本号(乐观锁)',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_id` (`id`) USING BTREE,
  UNIQUE KEY `idx_seq_name` (`sequence_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='资产相关序列表';

-- ----------------------------
-- Table structure for ams_trustee
-- ----------------------------
DROP TABLE IF EXISTS `ams_trustee`;
CREATE TABLE `ams_trustee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `trustee_code` varchar(32) DEFAULT NULL COMMENT '受托方编码',
  `trustee_name` varchar(256) DEFAULT NULL COMMENT '受托方名称',
  `cert_type` tinyint(2) DEFAULT NULL COMMENT '证件类型',
  `cert_no` varchar(64) DEFAULT NULL COMMENT '证件号码',
  `registered_capital` decimal(16,4) DEFAULT '0.0000' COMMENT '注册资本',
  `trustee_address` varchar(1024) DEFAULT NULL COMMENT '公司注册地址',
  `legal_person_name` varchar(32) DEFAULT NULL COMMENT '法人代表姓名',
  `legal_person_cert_no` varchar(32) DEFAULT NULL,
  `business_scope` longtext COMMENT '经营范围',
  `introduction` longtext COMMENT '简介',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后修改者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_cert_no` (`cert_no`) USING BTREE,
  KEY `idx_legal_person_cert_no` (`legal_person_cert_no`) USING BTREE,
  KEY `idx_trustee_code` (`trustee_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='受托方信息表';
