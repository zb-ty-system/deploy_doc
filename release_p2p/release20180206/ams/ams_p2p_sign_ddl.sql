-- ----------------------------
-- use txs ams database
-- ----------------------------
DROP TABLE IF EXISTS `ams_contract_info`;
CREATE TABLE `ams_contract_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `file_biz_code` varchar(32) NOT NULL COMMENT '文件编码',
  `contract_code` varchar(32) DEFAULT NULL COMMENT '合同编码',
  `signed_status` varchar(16) DEFAULT 'UNSIGNE' COMMENT 'UNSIGNE-未签章;SIGNING-签章中;SAVE-保存;COMPLETE-签章完成;REMOVE-去章;FAIL-签章失败',
  `party_a` varchar(128) DEFAULT NULL COMMENT '甲方',
  `party_b` varchar(128) DEFAULT NULL COMMENT '乙方',
  `template_code_a` varchar(32) DEFAULT NULL COMMENT '甲方模板编号',
  `template_code_b` varchar(32) DEFAULT NULL COMMENT '乙方模板编号',
  `signed_time` datetime DEFAULT NULL COMMENT '发起签章时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建人',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ams_file_info`;
CREATE TABLE `ams_file_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `biz_code` varchar(32) NOT NULL COMMENT '业务编码',
  `file_name` varchar(128) NOT NULL COMMENT '文件名称',
  `show_name` varchar(128) DEFAULT NULL COMMENT '文件展示名',
  `file_type` varchar(16) DEFAULT NULL COMMENT '文件类型',
  `source_download_url` varchar(512) DEFAULT NULL COMMENT '源文件下载地址',
  `change_download_url` varchar(512) DEFAULT NULL COMMENT '转换后下载地址',
  `upload_time` datetime DEFAULT NULL COMMENT '上传时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bizCode_fileName` (`biz_code`,`file_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传记录表';

DROP TABLE IF EXISTS `ams_qys_sign_contract`;
CREATE TABLE `ams_qys_sign_contract` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` varchar(32) DEFAULT NULL COMMENT '角色id',
  `contract_code` varchar(32) NOT NULL COMMENT '合同编码',
  `template_code` varchar(64) DEFAULT NULL COMMENT '模板编号',
  `file_name` varchar(256) DEFAULT NULL COMMENT '文件名称',
  `oss_path` varchar(1024) DEFAULT NULL COMMENT '签署合同后生成pdf,oss地址',
  `oss_old_path` varchar(1024) DEFAULT NULL COMMENT '原合同oss地址',
  `current_sign_sequence` int(2) DEFAULT '0' COMMENT '当前签章顺序',
  `status` varchar(32) DEFAULT 'UNSIGNE' COMMENT '状态:UNSIGNE-未签章;COMPLETE-签章完成;REMOVE-去章;FAIL-签章失败;',
  `last_flag` varchar(32) DEFAULT 'FALSE' COMMENT '是否为最后一个签章',
  `qys_path` varchar(1024) DEFAULT NULL COMMENT '契约锁地址',
  `sign_again_flag` varchar(32) DEFAULT 'FALSE' COMMENT '是否重签:TRUE-是  FALSE-否',
  `apply_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '发起时间',
  `signed_time` datetime DEFAULT NULL COMMENT '签章时间',
  `complete_time` datetime DEFAULT NULL COMMENT '完成签署时间',
  `version` int(11) DEFAULT '0',
  `memo` varchar(512) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(32) DEFAULT 'system',
  `modify_by` varchar(32) DEFAULT 'system',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合同盖章表';