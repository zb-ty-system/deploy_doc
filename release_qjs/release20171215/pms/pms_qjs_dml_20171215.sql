/**
  pms_product表增加字段is_transfer,is_reinvest,reinvest_type
 */
ALTER TABLE pms_product ADD is_transfer tinyint(2) DEFAULT '0' COMMENT '产品是否可转让标识（0:不可转让、1:可转让）' AFTER product_specification_url;
ALTER TABLE pms_product ADD is_reinvest tinyint(2) DEFAULT '0' COMMENT '产品是否支持复投（0:不支持，1:支持）' AFTER is_transfer;
ALTER TABLE pms_product ADD reinvest_type tinyint(2) DEFAULT '0' COMMENT '复投类型(0:多次复投-预留, 1:首次复投-不预留)' AFTER is_reinvest;

/**
  增加pms_product_transfer表
 */
DROP TABLE IF EXISTS `pms_product_transfer`;

CREATE TABLE `pms_product_transfer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品主键',
  `product_code` varchar(32) DEFAULT NULL COMMENT '产品编码',
  `entrust_transfer_time` int(11) DEFAULT '0' COMMENT '委托转让有效时间（单位：天）',
  `lock_time` int(11) DEFAULT '0' COMMENT '转让锁定期（单位：天）',
  `procedure_fee_percent` decimal(12,8) DEFAULT '0.00000000' COMMENT '手续费百分比',
  `low_principal_percent` decimal(12,8) DEFAULT '0.00000000' COMMENT '低限本金百分比',
  `low_interest_percent` decimal(12,8) DEFAULT '0.00000000' COMMENT '低限已产生利息百分比',
  `low_input_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '低限输入金额',
  `high_principal_percent` decimal(12,8) DEFAULT '0.00000000' COMMENT '高限本金百分比',
  `high_interest_percent` decimal(12,8) DEFAULT '0.00000000' COMMENT '高限已产生利息百分比',
  `high_input_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '高限输入金额',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_product_id` (`product_id`) USING BTREE,
  KEY `idx_product_code` (`product_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8 COMMENT='产品转让信息表';


/**
  pms_global_config表增加配置数据
 */
INSERT INTO `pms_global_config` (`group_name`, `group_name_desc`, `property_name`, `property_value`) 
VALUES ('reinvest_product_line_sign','定期复投产品线配置','reinvest_product_line_sign','021711005');