/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.6.34 : Database - ams
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ams` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ams`;

/*Table structure for table `ams_asset` */

DROP TABLE IF EXISTS `ams_asset`;

CREATE TABLE `ams_asset` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `asset_code` varchar(32) DEFAULT NULL COMMENT '资产编号',
  `parent_asset_code` varchar(32) DEFAULT NULL COMMENT '资产来源编码',
  `ext_asset_code` varchar(64) DEFAULT NULL COMMENT '外部资产编码',
  `asset_name` varchar(128) DEFAULT NULL,
  `asset_type` tinyint(2) DEFAULT NULL COMMENT '融资类型:1:个人贷款,2:企业贷款,3:融资租赁,4:应收账款,5:个人贷款收益权,6:企业贷款收益权,7:融资租赁收益权,8:应收账款收益权',
  `collect_status` tinyint(2) DEFAULT NULL COMMENT '募集状态10:待审核,12:待成立,13:已成立,18:流标,99:不可用',
  `approval_require_sign` varchar(32) DEFAULT NULL COMMENT '审核需要签名',
  `approval_sign` varchar(32) DEFAULT NULL COMMENT '已审核签名',
  `approval_status` tinyint(2) DEFAULT NULL COMMENT '审核状态1:未提交审核,2:待审核,3:审核通过,4:审核未通过',
  `asset_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '资产总规模',
  `distribute_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '已分配给资产池总额',
  `stock_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '资产库存余额',
  `frozen_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '冻结金额(已关联产品,未匹配用户)',
  `sale_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '资产已售金额(实际已匹配给用户的金额)',
  `finance_subject_id` bigint(20) DEFAULT NULL COMMENT '融资方ID',
  `finance_subject_code` varchar(32) DEFAULT NULL COMMENT '融资方编码',
  `provide_loan_code` varchar(32) DEFAULT NULL COMMENT '出资方编码',
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
  `register_type` tinyint(2) DEFAULT '1' COMMENT '注册类型：1-普通录入,2-备案录入,3-交易所录入,4-马上贷,5-侨金所录入',
  `storage_status` tinyint(2) DEFAULT '1' COMMENT '资产入库状态:1-已入库,2-未入库',
  `publish_info` longtext COMMENT '披露信息(JSON格式)',
  `sale_start_time` datetime DEFAULT NULL COMMENT '募集开始日',
  `sale_end_time` datetime DEFAULT NULL COMMENT '募集结束日',
  `contract_asset_code` varchar(64) DEFAULT NULL COMMENT '底层资产合同编号',
  `item_number` varchar(64) DEFAULT NULL COMMENT '项目编号',
  `version` bigint(20) DEFAULT '0' COMMENT '版本号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后更新者',
  PRIMARY KEY (`id`),
  KEY `idx_asset_code` (`asset_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8 COMMENT='资产信息表';



/*Table structure for table `ams_asset_approval` */

DROP TABLE IF EXISTS `ams_asset_approval`;

CREATE TABLE `ams_asset_approval` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `asset_id` bigint(20) DEFAULT NULL COMMENT '资产主键',
  `asset_code` varchar(32) DEFAULT NULL COMMENT '资产编号',
  `sign` varchar(8) DEFAULT NULL COMMENT '授权级别',
  `approval_status` tinyint(2) DEFAULT NULL COMMENT '审核状态1:未提交审核,2:待审核,3:审核通过,4:审核未通过',
  `approval_suggestion` varchar(256) DEFAULT NULL COMMENT '审核意见',
  `approval_by` varchar(32) DEFAULT NULL COMMENT '审核者',
  `approval_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '审核时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  PRIMARY KEY (`id`),
  KEY `idx_asset_id` (`asset_id`) USING BTREE,
  KEY `idx_asset_code` (`asset_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8 COMMENT='资产审核信息表';



/*Table structure for table `ams_asset_exchange_register` */

DROP TABLE IF EXISTS `ams_asset_exchange_register`;

CREATE TABLE `ams_asset_exchange_register` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `asset_code` varchar(32) DEFAULT NULL COMMENT '资产编码',
  `parent_asset_code` varchar(32) DEFAULT NULL COMMENT '资产来源编码',
  `exchange_register_batch_no` varchar(32) DEFAULT NULL COMMENT '备案批次号',
  `trade_inst_code` varchar(32) DEFAULT NULL COMMENT '交易所编码',
  `delisted_inst_code` varchar(32) DEFAULT NULL COMMENT '摘牌方编码',
  `listed_inst_code` varchar(32) DEFAULT NULL COMMENT '挂牌方编码',
  `status` varchar(32) DEFAULT NULL COMMENT '状态:1-正常,2-不可用',
  `register_status` varchar(32) DEFAULT NULL COMMENT '备案状态:UN_REGISTER:未备案,REGISTERING:备案中,GENERATE_CONTRACT:生成合同,REGISTERED:完成,REGISTER_FAILED:备案失败',
  `register_name` varchar(256) DEFAULT NULL COMMENT '备案名称',
  `register_rate` decimal(12,8) DEFAULT '0.00000000' COMMENT '备案利率',
  `register_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '备案金额',
  `register_value_start_time` timestamp NULL DEFAULT NULL COMMENT '备案起息日',
  `register_value_end_time` timestamp NULL DEFAULT NULL COMMENT '备案结息日',
  `register_expire_time` timestamp NULL DEFAULT NULL COMMENT '备案到期日',
  `register_time` timestamp NULL DEFAULT NULL COMMENT '备案时间',
  `value_days` int(4) DEFAULT NULL COMMENT '期限(单位:天)',
  `repayment_type` tinyint(2) DEFAULT NULL COMMENT '还款方式',
  `memo` varchar(256) DEFAULT NULL COMMENT '备注',
  `version` bigint(20) DEFAULT '0' COMMENT '版本号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后更新者',
  PRIMARY KEY (`id`),
  KEY `idx_asset_code` (`asset_code`)
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8 COMMENT='资产备案信息表';



/*Table structure for table `ams_asset_issue_relation` */

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
  PRIMARY KEY (`id`),
  KEY `idx_asset_code` (`asset_code`),
  KEY `idx_batch_no` (`batch_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产和发行计划关联关系表';

/*Data for the table `ams_asset_issue_relation` */

/*Table structure for table `ams_asset_pool_relation` */

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
  KEY `idx_pool_id` (`pool_id`) USING BTREE,
  KEY `idx_pool_code` (`pool_code`) USING BTREE,
  KEY `idx_asset_id` (`asset_id`) USING BTREE,
  KEY `idx_asset_code` (`asset_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8 COMMENT='资产与资产池关联信息表';



/*Table structure for table `ams_asset_product_relation` */

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
  KEY `idx_product_code` (`product_code`) USING BTREE,
  KEY `idx_pool_id` (`pool_id`) USING BTREE,
  KEY `idx_pool_code` (`pool_code`) USING BTREE,
  KEY `idx_asset_id` (`asset_id`) USING BTREE,
  KEY `idx_asset_code` (`asset_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8 COMMENT='产品资产匹配关系表';



/*Table structure for table `ams_asset_repay_plan` */

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
  `finance_subject_code` varchar(32) DEFAULT NULL COMMENT '融资方编码',
  `loan_name` varchar(64) DEFAULT NULL COMMENT '借款人姓名',
  `loan_cert_no` varchar(32) DEFAULT NULL COMMENT '借款人证件号',
  `loan_cert_type` tinyint(2) DEFAULT NULL COMMENT '证件类型:1:居民身份证,2:社会信用代码,3:营业执照',
  `loan_fee` decimal(16,4) DEFAULT '0.0000' COMMENT '手续费',
  `loan_purpose` longtext COMMENT '借款用途',
  `member_id` varchar(64) DEFAULT NULL COMMENT '借款人平台ID',
  `tel` varchar(32) DEFAULT NULL COMMENT '借款人联系方式',
  `asset_type` tinyint(2) DEFAULT NULL COMMENT '融资类型:1:个人贷款,2:企业贷款,3:融资租赁,4:应收账款,5:个人贷款收益权,6:企业贷款收益权,7:融资租赁收益权,8:应收账款收益权',
  `repay_status` tinyint(2) DEFAULT '0' COMMENT '还款状态:0:待还款,1:部分还款,2:全部还款',
  `repaid_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '已还款金额',
  `waiting_repay_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '待还款金额',
  `version` bigint(20) DEFAULT '0' COMMENT '版本号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_by` varchar(32) DEFAULT NULL COMMENT '最后更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COMMENT='资产还款计划表';



/*Table structure for table `ams_business_credit` */

DROP TABLE IF EXISTS `ams_business_credit`;

CREATE TABLE `ams_business_credit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `batch_no` varchar(32) DEFAULT NULL COMMENT '录入批次号',
  `credit_business_code` varchar(32) DEFAULT NULL COMMENT '授信业务编码',
  `credit_limit_amount` decimal(16,4) DEFAULT NULL COMMENT '授信额度',
  `financing_name` varchar(256) DEFAULT NULL COMMENT '融资方',
  `provide_loan_name` varchar(256) DEFAULT NULL COMMENT '出资方名称',
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
  PRIMARY KEY (`id`),
  KEY `idx_batch_no` (`batch_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务授信表';

/*Data for the table `ams_business_credit` */

/*Table structure for table `ams_consignee` */

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
  KEY `idx_consignee_code` (`consignee_code`) USING BTREE,
  KEY `idx_cert_no` (`cert_no`) USING BTREE,
  KEY `idx_legal_person_cert_no` (`legal_person_cert_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='承销方信息表';

/*Data for the table `ams_consignee` */

/*Table structure for table `ams_exchange` */

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
  `exchange_rate` decimal(12,8) DEFAULT NULL COMMENT '交易所费率',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后更新者',
  PRIMARY KEY (`id`),
  KEY `idx_exchange_code` (`exchange_code`) USING BTREE,
  KEY `idx_cert_no` (`cert_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='交易所信息表';



/*Table structure for table `ams_file_template` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合同文件模板';

/*Data for the table `ams_file_template` */

/*Table structure for table `ams_file_template_param` */

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
  PRIMARY KEY (`id`),
  KEY `idx_template_code` (`template_code`),
  KEY `idx_asset_code` (`asset_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件模板参数';

/*Data for the table `ams_file_template_param` */

/*Table structure for table `ams_finance_subject` */

DROP TABLE IF EXISTS `ams_finance_subject`;

CREATE TABLE `ams_finance_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `subject_code` varchar(32) DEFAULT NULL COMMENT '融资主体编码',
  `subject_name` varchar(256) DEFAULT NULL COMMENT '融资方名称',
  `subject_show_name` varchar(256) DEFAULT NULL COMMENT '融资方展示名称',
  `cert_type` tinyint(2) DEFAULT NULL COMMENT '证件类型',
  `cert_no` varchar(64) DEFAULT NULL COMMENT '证件号码',
  `cert_no_show_name` varchar(256) DEFAULT NULL COMMENT '证件号码展示名称',
  `registered_capital` decimal(16,4) DEFAULT '0.0000' COMMENT '注册资本',
  `subject_address` varchar(1024) DEFAULT NULL COMMENT '公司注册地址',
  `subject_address_show_name` varchar(1024) DEFAULT NULL COMMENT '公司注册地址展示名',
  `legal_person_name` varchar(32) DEFAULT NULL COMMENT '法人代表姓名',
  `legal_person_cert_no` varchar(32) DEFAULT NULL COMMENT '法人代表身份证号码',
  `business_scope` longtext COMMENT '经营范围',
  `tel` varchar(32) DEFAULT NULL COMMENT '电话',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `introduction` longtext COMMENT '简介',
  `member_id` varchar(64) DEFAULT NULL COMMENT '会员ID',
  `status` tinyint(2) DEFAULT NULL COMMENT '发行方状态1:正常,2:冻结',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后更新者',
  PRIMARY KEY (`id`),
  KEY `idx_subject_code` (`subject_code`) USING BTREE,
  KEY `idx_cert_no` (`cert_no`) USING BTREE,
  KEY `idx_legal_person_cert_no` (`legal_person_cert_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='融资主体信息表';



/*Table structure for table `ams_global_config` */

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
  UNIQUE KEY `idx_property_name` (`property_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='资管系统全局参数表';



/*Table structure for table `ams_issue_plan` */

DROP TABLE IF EXISTS `ams_issue_plan`;

CREATE TABLE `ams_issue_plan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `credit_business_code` varchar(32) DEFAULT NULL COMMENT '业务授信编码',
  `batch_no` varchar(32) DEFAULT NULL COMMENT '录入批次号',
  `product_day_count` int(4) DEFAULT NULL COMMENT '产品天数',
  `contract_day_count` int(4) DEFAULT NULL COMMENT '合同天数',
  `value_start_time` datetime DEFAULT NULL COMMENT '合同起息(备案开始)时间',
  `value_end_time` datetime DEFAULT NULL COMMENT '备案完成',
  `free_start_time` datetime DEFAULT NULL COMMENT '空档开始时间',
  `free_end_time` datetime DEFAULT NULL COMMENT '空档结束时间',
  `sale_start_time` datetime DEFAULT NULL COMMENT '募集开始时间',
  `sale_end_time` datetime DEFAULT NULL COMMENT '募集结束时间',
  `product_value_start_time` datetime DEFAULT NULL COMMENT '产品计息开始时间',
  `product_value_end_time` datetime DEFAULT NULL COMMENT '产品结息时间(合同结息)',
  `single_amount` decimal(16,4) DEFAULT NULL COMMENT '单包金额',
  `asset_count` int(4) DEFAULT NULL COMMENT '个数',
  `total_amount` decimal(16,4) DEFAULT NULL COMMENT '总金额',
  `subject_code` varchar(32) DEFAULT NULL COMMENT '融资方编码',
  `memo` varchar(256) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后更新者',
  PRIMARY KEY (`id`),
  KEY `idx_batch_no` (`batch_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资产发行计划';

/*Data for the table `ams_issue_plan` */

/*Table structure for table `ams_pool` */

DROP TABLE IF EXISTS `ams_pool`;

CREATE TABLE `ams_pool` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `pool_code` varchar(32) DEFAULT NULL COMMENT '资产池编码',
  `pool_name` varchar(128) DEFAULT NULL COMMENT '资产池名称',
  `pool_type` tinyint(2) DEFAULT NULL COMMENT '资产池类型1:定向委托,2:p2p实时放款',
  `limit_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '资产池总额上限',
  `total_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '资产池总规模(关联资产总额)',
  `stock_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '资产池库存金额(可用金额)',
  `frozen_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '冻结金额(已分配产品,未匹配给用户总金额)',
  `sale_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '已售金额(已匹配给用户总金额)',
  `status` tinyint(2) DEFAULT NULL COMMENT '资产池状态',
  `load_switch_status` tinyint(2) DEFAULT NULL COMMENT '装载开关1:可出入,2:可出,3:可入,4:包装,5:停止出入',
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
  KEY `idx_pool_code` (`pool_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='资产池信息表';



/*Table structure for table `ams_sequence` */

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
  UNIQUE KEY `idx_seq_name` (`sequence_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='资产相关序列表';



/*Table structure for table `ams_trustee` */

DROP TABLE IF EXISTS `ams_trustee`;

CREATE TABLE `ams_trustee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `trustee_code` varchar(32) DEFAULT NULL COMMENT '受托方编码',
  `trustee_name` varchar(256) DEFAULT NULL COMMENT '受托方名称',
  `trustee_show_name` varchar(256) DEFAULT NULL COMMENT '受托方展示名',
  `cert_type` tinyint(2) DEFAULT NULL COMMENT '证件类型',
  `cert_no` varchar(64) DEFAULT NULL COMMENT '证件号码',
  `cert_no_show_name` varchar(256) DEFAULT NULL COMMENT '证件号码展示名',
  `registered_capital` decimal(16,4) DEFAULT '0.0000' COMMENT '注册资本',
  `trustee_address` varchar(1024) DEFAULT NULL COMMENT '公司注册地址',
  `trustee_address_show_name` varchar(1024) DEFAULT NULL COMMENT '公司注册地址展示名',
  `legal_person_name` varchar(32) DEFAULT NULL COMMENT '法人代表姓名',
  `legal_person_cert_no` varchar(32) DEFAULT NULL,
  `business_scope` longtext COMMENT '经营范围',
  `introduction` longtext COMMENT '简介',
  `status` tinyint(2) DEFAULT NULL COMMENT '受托方状态1:正常,2:冻结',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后修改者',
  PRIMARY KEY (`id`),
  KEY `idx_cert_no` (`cert_no`) USING BTREE,
  KEY `idx_legal_person_cert_no` (`legal_person_cert_no`) USING BTREE,
  KEY `idx_trustee_code` (`trustee_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='受托方信息表';



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
