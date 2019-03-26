/**
  pms_product_line表增加产品线
 */
INSERT INTO `pms_product_line` (`line_code`, `line_name`, `line_display_name`, `pattern_code`, `status`, `display_status`, `sale_channel_code`, `risk_level`, `description`, `create_time`, `create_by`, `modify_time`, `modify_by`)
VALUES ('021711002', '新手标', '新手标', '02', '1', '1', 'GAN', '1', null, '2018-03-05 00:00:59', 'SYS', '2018-03-05 00:00:59', 'SYS');

INSERT INTO `pms_product_line` (`line_code`, `line_name`, `line_display_name`, `pattern_code`, `status`, `display_status`, `sale_channel_code`, `risk_level`, `description`, `create_time`, `create_by`, `modify_time`, `modify_by`)
VALUES ('021803001', '金刚30', '金刚30', '02', '1', '1', 'GAN', '1', null, '2018-03-05 00:00:58', 'SYS', '2018-03-05 00:00:58', 'SYS');

INSERT INTO `pms_product_line` (`line_code`, `line_name`, `line_display_name`, `pattern_code`, `status`, `display_status`, `sale_channel_code`, `risk_level`, `description`, `create_time`, `create_by`, `modify_time`, `modify_by`)
VALUES ('021803002', '金刚60', '金刚60', '02', '1', '1', 'GAN', '1', null, '2018-03-05 00:00:57', 'SYS', '2018-03-05 00:00:57', 'SYS');

INSERT INTO `pms_product_line` (`line_code`, `line_name`, `line_display_name`, `pattern_code`, `status`, `display_status`, `sale_channel_code`, `risk_level`, `description`, `create_time`, `create_by`, `modify_time`, `modify_by`)
VALUES ('021803003', '金刚90', '金刚90', '02', '1', '1', 'GAN', '1', null, '2018-03-05 00:00:56', 'SYS', '2018-03-05 00:00:56', 'SYS');

INSERT INTO `pms_product_line` (`line_code`, `line_name`, `line_display_name`, `pattern_code`, `status`, `display_status`, `sale_channel_code`, `risk_level`, `description`, `create_time`, `create_by`, `modify_time`, `modify_by`)
VALUES ('021803004', '风火轮180', '风火轮180', '02', '1', '1', 'GAN', '1', null, '2018-03-05 00:00:55', 'SYS', '2018-03-05 00:00:55', 'SYS');

INSERT INTO `pms_product_line` (`line_code`, `line_name`, `line_display_name`, `pattern_code`, `status`, `display_status`, `sale_channel_code`, `risk_level`, `description`, `create_time`, `create_by`, `modify_time`, `modify_by`)
VALUES ('021803005', '如意棒360', '如意棒360', '02', '1', '1', 'GAN', '1', null, '2018-03-05 00:00:54', 'SYS', '2018-03-05 00:00:54', 'SYS');


/**
  pms_global_config表增加配置数据
 */
INSERT INTO `pms_global_config` (`group_name`, `group_name_desc`, `property_name`, `property_value`) VALUES ('email_already_raise_rate','产品已募集进度','email_already_raise_rate','0.99');
INSERT INTO `pms_global_config` (`group_name`, `group_name_desc`, `property_name`, `property_value`) VALUES ('email_surplus_stock','产品剩余库存','email_surplus_stock','5000');
INSERT INTO `pms_global_config` (`group_name`, `group_name_desc`, `property_name`, `property_value`) VALUES ('email_continue_time','持续时间（单位：秒）','email_continue_time','1800');