/**
  pms_product_line表增加3条复投产品线
 */
INSERT INTO `pms_product_line` (`line_code`, `line_name`, `line_display_name`, `pattern_code`, `status`, `display_status`, `sale_channel_code`, `risk_level`, `description`, `create_time`, `create_by`, `modify_time`, `modify_by`)
VALUES ('021711005', '超级至尊宝', '超级至尊宝', '02', '1', '1', 'GAN', '1', null, '2018-03-05 00:00:53', 'SYS', '2018-03-05 00:00:53', 'SYS');

INSERT INTO `pms_product_line` (`line_code`, `line_name`, `line_display_name`, `pattern_code`, `status`, `display_status`, `sale_channel_code`, `risk_level`, `description`, `create_time`, `create_by`, `modify_time`, `modify_by`)
VALUES ('021711006', '月月僧', '月月僧', '02', '1', '1', 'GAN', '1', null, '2018-03-05 00:00:52', 'SYS', '2018-03-05 00:00:52', 'SYS');

INSERT INTO `pms_product_line` (`line_code`, `line_name`, `line_display_name`, `pattern_code`, `status`, `display_status`, `sale_channel_code`, `risk_level`, `description`, `create_time`, `create_by`, `modify_time`, `modify_by`)
VALUES ('021711007', '季季僧', '季季僧', '02', '1', '1', 'GAN', '1', null, '2018-03-05 00:00:51', 'SYS', '2018-03-05 00:00:51', 'SYS');


/**
  pms_global_config表增加配置数据
 */
INSERT INTO `pms_global_config` (`group_name`, `group_name_desc`, `property_name`, `property_value`) 
VALUES ('reinvest_product_line_sign','定期复投产品线配置,若多个则以英文【,】区分','reinvest_product_line_sign','021711005,021711006,021711007');

INSERT INTO `pms_global_config` (`group_name`, `group_name_desc`, `property_name`, `property_value`) 
VALUES ('email_product_line_codes','产品线编码（用于过滤，若多个则以英文【,】区分，例如：021711002,021711003）','email_product_line_codes','021711002');

/**
  pms_product表修改字段【pay_channel_code】的备注
 */
ALTER TABLE pms_product MODIFY COLUMN `pay_channel_code` varchar(16) DEFAULT 'GAN' COMMENT '支付渠道（GAN:赣金所宝付,GAN_YST:赣金所银商通）'; 