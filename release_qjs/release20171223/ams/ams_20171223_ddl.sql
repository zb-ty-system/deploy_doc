
USE `ams_qjs`;

DROP TABLE IF EXISTS `ams_permit_application`;

CREATE TABLE `ams_permit_application` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `credit_business_code` varchar(32) DEFAULT '' COMMENT '授信业务编号',
  `credit_asset_code` varchar(32) DEFAULT '' COMMENT '授信资产代码（底层名称）',
  `credit_limit_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '授信额度',
  `repayment_type` int(2) DEFAULT '0' COMMENT '还款方式',
  `transferor_name` varchar(128) DEFAULT '' COMMENT '转让人',
  `service_provider` varchar(128) DEFAULT '' COMMENT '综合服务商',
  `service_rate` decimal(12,8) DEFAULT '0.000000' COMMENT '服务费费率',
  `registe_rate` decimal(12,8) DEFAULT '0.000000' COMMENT '登记费费率',
  `current_node` varchar(32) DEFAULT '' COMMENT '当前节点:01:填报,02:提交一审,03:一审通过,04:提交二审,05:二审通过,06:归档',
  `approval_status` varchar(32) DEFAULT '' COMMENT '审核状态：01:审核通过,02:审核未通过,03:退回,04:归档',
  `approval_suggestion` varchar(256) DEFAULT '' COMMENT '审核意见',
  `version` bigint(10) DEFAULT '0' COMMENT '版本号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后更新者',
  PRIMARY KEY (`id`),
  KEY `idx_credit_asset_code` (`credit_asset_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='准入申请表';


DROP TABLE IF EXISTS `ams_listed_application`;

CREATE TABLE `ams_listed_application` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `credit_asset_code` varchar(32) DEFAULT '' COMMENT '授信资产代码（底层名称）',
  `asset_contract_code` varchar(32) DEFAULT '' COMMENT '底层资产合同编号',
  `transfer_contract_code` varchar(32) DEFAULT '' COMMENT '转让说明书合同编号',
  `asset_name` varchar(128) DEFAULT '' COMMENT '资产名称',
  `register_name` varchar(128) DEFAULT '' COMMENT '备案名称',
  `product_code` varchar(32) DEFAULT '' COMMENT '产品代码',
  `product_value_days` int(4) DEFAULT '0' COMMENT '产品期限（天）',
  `total_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '募集总规模',
  `sale_start_time` timestamp NULL DEFAULT NULL COMMENT '募集开始日',
  `sale_end_time` timestamp NULL DEFAULT NULL COMMENT '募集结束日',
  `value_start_time` timestamp NULL DEFAULT NULL COMMENT '起息日',
  `value_end_time` timestamp NULL DEFAULT NULL COMMENT '止息日',
  `expire_time` timestamp NULL DEFAULT NULL COMMENT '到期日',
  `yield_rate` decimal(12,8) DEFAULT '0.00000000' COMMENT '预期年化收益率',
  `financing_start_time` timestamp NULL DEFAULT NULL COMMENT '融资开始日',
  `financing_end_time` timestamp NULL DEFAULT NULL COMMENT '融资结束日',
  `repayment_type` int(2) DEFAULT '0' COMMENT '还款方式',
  `listed_inst_code` varchar(32) DEFAULT NULL COMMENT '挂牌方编码',
  `trade_inst_code` varchar(32) DEFAULT NULL COMMENT '交易所编码',
  `current_node` varchar(32) DEFAULT '' COMMENT '当前节点:01:填报,02:提交一审,03:一审通过,04:提交二审,05:二审通过,06:归档',
  `approval_status` varchar(32) DEFAULT '' COMMENT '审核状态：01:审核通过,02:审核未通过,03:退回,04:归档',
  `approval_suggestion` varchar(256) DEFAULT '' COMMENT '审核意见',
  `asset_type` tinyint(2) DEFAULT NULL COMMENT '融资类型:1:个人贷款,2:企业贷款,3:融资租赁,4:应收账款,5:个人贷款收益权,6:企业贷款收益权,7:融资租赁收益权,8:应收账款收益权',
  `version` bigint(10) DEFAULT '0' COMMENT '版本号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后更新者',
  PRIMARY KEY (`id`),
  KEY `idx_credit_asset_code` (`credit_asset_code`),
  KEY `idx_asset_contract_code` (`asset_contract_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='挂牌申请表';


DROP TABLE IF EXISTS `ams_qys_sign_contract`;

CREATE TABLE `ams_qys_sign_contract` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色id',
  `template_id` bigint(20) DEFAULT NULL COMMENT '模板id',
  `credit_asset_code` varchar(64) DEFAULT NULL COMMENT '授信资产代码',
  `upload_file_id` bigint(20) DEFAULT NULL COMMENT '上传合同id(原始合同文件)',
  `document_id` bigint(20) DEFAULT NULL COMMENT '签署后返回契约锁id',
  `file_name` varchar(64) DEFAULT NULL COMMENT '文件名称',
  `oss_path` varchar(1024) DEFAULT NULL COMMENT '签署合同后生成pdf,oss地址',
  `oss_old_path` varchar(1024) DEFAULT NULL COMMENT '原合同oss地址',
  `current_sign_sequence` int(11) DEFAULT '0' COMMENT '当前签章顺序',
  `status` varchar(32) DEFAULT 'UNSIGNE' COMMENT '状态:UNSIGNE-未签章;SIGNING-签章中;SAVE-保存;COMPLETE-签章完成;REMOVE-去章;FAIL-签章失败;',
  `version` int(11) DEFAULT '0',
  `create_by` varchar(32) DEFAULT 'system',
  `modify_by` varchar(32) DEFAULT 'system',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `memo` varchar(512) DEFAULT NULL COMMENT '备注',
  `last_flag` varchar(32) DEFAULT 'FALSE' COMMENT '是否为最后一个签章',
  `qys_path` varchar(1024) DEFAULT NULL COMMENT '契约锁地址',
  PRIMARY KEY (`id`),
  KEY `COMMON_INDEX` (`role_id`,`template_id`,`credit_asset_code`,`upload_file_id`,`document_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合同签署表';


DROP TABLE IF EXISTS `ams_qys_transcation`;

CREATE TABLE `ams_qys_transcation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_no` varchar(64) DEFAULT NULL COMMENT '操作流水号',
  `business_type` varchar(16) DEFAULT NULL COMMENT '操作业务类型:SIGN ；去章 REMOVE',
  `role_id` varchar(64) DEFAULT NULL COMMENT '角色id',
  `template_id` varchar(64) DEFAULT NULL COMMENT '模板id',
  `create_time` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `create_by` varchar(32) NOT NULL DEFAULT 'system',
  `modify_time` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `modify_by` varchar(32) NOT NULL DEFAULT 'system',
  PRIMARY KEY (`id`),
  UNIQUE KEY `NoAndTypeIndex` (`business_no`,`business_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='契约锁操作表';


DROP TABLE IF EXISTS `ams_file_info`;

CREATE TABLE `ams_file_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `biz_code` varchar(32) NOT NULL COMMENT '业务编码',
  `biz_type` varchar(32) NOT NULL COMMENT '业务类型: A 准入，L 挂牌',
  `file_name` varchar(128) NOT NULL COMMENT '文件名',
  `show_name` varchar(128) DEFAULT NULL COMMENT '文件展示名',
  `file_type` varchar(32) NOT NULL COMMENT '文件类型',
  `status` varchar(16) NOT NULL COMMENT '状态: 01 一审，02 二审',
  `source_download_url` varchar(512) NOT NULL COMMENT '源文件下载地址',
  `change_download_url` varchar(512) DEFAULT NULL COMMENT '转换后下载地址',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bizCode_bizType_fileName_status` (`biz_code`,`biz_type`,`file_name`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传记录表';