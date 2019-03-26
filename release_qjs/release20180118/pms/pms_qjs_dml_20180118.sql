/**
  pms_product表修改字段【reinvest_type】的备注
 */
ALTER TABLE pms_product MODIFY COLUMN `reinvest_type` tinyint(2) DEFAULT '0' COMMENT '复投类型(0:默认值（不支持复投的情况）, 1:多次复投-预留, 2:首次复投-不预留)'; 


/**
  pms_product_line表增加产品线【定期产品复投】
 */
INSERT INTO `pms_product_line` (`line_code`, `line_name`, `line_display_name`, `pattern_code`, `status`, `display_status`, `sale_channel_code`, `risk_level`, `description`, `create_time`, `create_by`, `modify_time`, `modify_by`)
VALUES ('021711005', '定期可复投', '定期可复投', '02', '1', '1', 'QJS', '1', null, '2017-11-01 00:00:53', 'SYS', '2017-11-01 00:00:53', 'SYS');

INSERT INTO `pms_product_line` (`line_code`, `line_name`, `line_display_name`, `pattern_code`, `status`, `display_status`, `sale_channel_code`, `risk_level`, `description`, `create_time`, `create_by`, `modify_time`, `modify_by`)
VALUES ('021801001', '春节佳礼专享180天', '春节佳礼专享180天', '02', '1', '1', 'QJS', '1', null, '2017-11-01 00:00:52', 'SYS', '2017-11-01 00:00:52', 'SYS');

INSERT INTO `pms_product_line` (`line_code`, `line_name`, `line_display_name`, `pattern_code`, `status`, `display_status`, `sale_channel_code`, `risk_level`, `description`, `create_time`, `create_by`, `modify_time`, `modify_by`)
VALUES ('021801002', '春节佳礼专享360天', '春节佳礼专享360天', '02', '1', '1', 'QJS', '1', null, '2017-11-01 00:00:51', 'SYS', '2017-11-01 00:00:51', 'SYS');

/**
  pms_product表增加字段【pay_channel_code】
 */
ALTER TABLE pms_product ADD `pay_channel_code` varchar(16) DEFAULT 'QJS' COMMENT '支付渠道（QJS:侨金所宝付，QJS_YST:侨金所银商通）' AFTER join_channel_code;

/**
  pms_product_transfer表增加字段【low_transfer_yield_rate】、【high_transfer_yield_rate】
 */
ALTER TABLE pms_product_transfer ADD `low_transfer_yield_rate` decimal(12,8) DEFAULT '0.00000000' COMMENT '转让后收益率下限' AFTER high_input_amount;
ALTER TABLE pms_product_transfer ADD `high_transfer_yield_rate` decimal(12,8) DEFAULT '0.00000000' COMMENT '转让后收益率上限' AFTER low_transfer_yield_rate;