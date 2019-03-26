
/**
新增字段
 */
 ALTER TABLE `role` ADD COLUMN `sign_level` varchar(64) DEFAULT NULL COMMENT '授权级别（ASSET_APPROVE_LEVEL1：资产一审，ASSET_APPROVE_LEVEL2：资产二审）' AFTER `name`;

/**
新增表
 */
 DROP TABLE IF EXISTS `asset_file`;
CREATE TABLE `asset_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `file_serial_no` varchar(64) DEFAULT NULL COMMENT '文件序列号(oss文件名)',
  `file_name` varchar(128) DEFAULT NULL COMMENT '文件名',
  `status` tinyint(2) DEFAULT NULL COMMENT '1:处理成功,2:处理失败',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='上传文件';