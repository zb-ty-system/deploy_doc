/**
  pms_global_config表增加配置数据
 */
INSERT INTO `pms_global_config` (`group_name`, `group_name_desc`, `property_name`, `property_value`) VALUES ('email_already_raise_rate','产品已募集进度','email_already_raise_rate','0.99');
INSERT INTO `pms_global_config` (`group_name`, `group_name_desc`, `property_name`, `property_value`) VALUES ('email_surplus_stock','产品剩余库存','email_surplus_stock','5000');
INSERT INTO `pms_global_config` (`group_name`, `group_name_desc`, `property_name`, `property_value`) VALUES ('email_continue_time','持续时间（单位：秒）','email_continue_time','1800');