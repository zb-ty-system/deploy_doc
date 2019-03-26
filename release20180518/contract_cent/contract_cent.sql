ALTER TABLE `contract_center`.`position_template`   
  ADD  INDEX `position_code_index` (`position_code`);
ALTER TABLE `contract_center`.`stamper`   
  ADD COLUMN `main_channel` VARCHAR(32) DEFAULT 'ZBSZ'   NULL  COMMENT '资邦深圳:ZBSZ 资鼎:ZD' AFTER `attestation_status`;
ALTER TABLE `contract_center`.`stamper`   
  ADD  INDEX `stamper_code_index` (`code`);
CREATE TABLE `contract_origin_data` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `contract_no` VARCHAR(32) NOT NULL COMMENT '合同编号',
  `contract_data` LONGTEXT COMMENT '合同原始数据',
  `status` VARCHAR(32) DEFAULT 'INIT' COMMENT '当前状态:INIT-初始状态；DISCARD-废弃;',
  `memo` VARCHAR(256) DEFAULT '',
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` VARCHAR(16) DEFAULT 'system',
  `modify_by` VARCHAR(16) DEFAULT 'system',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_contract_no` (`contract_no`)
) ENGINE=INNODB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8 COMMENT='合同原始数据表';



