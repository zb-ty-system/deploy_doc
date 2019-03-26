alter table ams_debt_right_info add COLUMN repay_status varchar(2) DEFAULT '0' COMMENT '还款状态:1-超时(逾期)，2-逾期已还款' after asset_status;

alter table ams_debt_right_info add COLUMN cash_status varchar(2) DEFAULT '1' COMMENT '兑付状态:1-兑付成功，2-兑付失败' after repay_status;


DROP TABLE IF EXISTS `ams_invest_info`;
CREATE TABLE `ams_invest_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `loan_order_no` varchar(32) NOT NULL COMMENT '借款订单号',
  `invest_no` varchar(32) NOT NULL COMMENT '投资单号',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;