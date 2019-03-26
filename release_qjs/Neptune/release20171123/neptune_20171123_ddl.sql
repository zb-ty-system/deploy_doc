
ALTER TABLE `neptune`.`product`   
  ADD COLUMN `sale_end_date` DATE NULL  COMMENT '募集截止日期' AFTER `establish_date`;
  
ALTER TABLE `neptune`.`product`   
  CHANGE `interest_date` `interest_date` DATETIME NULL  COMMENT '起息日',
  CHANGE `expire_date` `expire_date` DATETIME NULL  COMMENT '到期日',
  CHANGE `establish_date` `establish_date` DATETIME NULL  COMMENT '成立日',
  CHANGE `sale_end_date` `sale_end_date` DATETIME NULL  COMMENT '募集截止日期';
ALTER TABLE `neptune`.`batch`   
  CHANGE `widthdraw_date` `widthdraw_date` DATETIME NULL  COMMENT '代付日';
  
ALTER TABLE `neptune`.`batch`   
  ADD COLUMN `widthdraw_date` DATE NULL  COMMENT '代付日' AFTER `retry_times`;


DROP TABLE IF EXISTS `account_transcation`;

CREATE TABLE `account_transcation` (
  `id` int(11) NOT NULL,
  `account_id` varchar(64) NOT NULL DEFAULT '',
  `business_type` varchar(16) NOT NULL COMMENT '操作业务类型 CASH_AMOUNT兑付本金 CASH_INCOME兑付收益 CASH_ADDIT兑付附加收益 WITHDRAW 对公代付',
  `business_no` varchar(64) NOT NULL COMMENT '操作流水号',
  `amount` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '变动金额',
  `create_time` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `create_by` varchar(32) NOT NULL DEFAULT 'system',
  `modify_time` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `modify_by` varchar(32) NOT NULL DEFAULT 'system',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_business_typeAndNo` (`business_type`,`business_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `withdraw_record`;

CREATE TABLE `withdraw_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `withdraw_serial_no` varchar(64) NOT NULL DEFAULT '' COMMENT '流水号',
  `sale_channel` varchar(8) NOT NULL COMMENT '渠道 桥金所 QJS',
  `product_code` varchar(64) NOT NULL COMMENT '产品代码',
  `financing_member_Id` varchar(64) NOT NULL COMMENT '融资机构会员id',
  `trade_amount` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '交易金额',
  `bank_code` varchar(32) NOT NULL COMMENT '银行编码',
  `bank_account_no` varchar(64) NOT NULL COMMENT '银行账户号',
  `bank_account_name` varchar(64) NOT NULL COMMENT '银行账户姓名',
  `province` varchar(32) NOT NULL COMMENT '开户行所属省',
  `city` varchar(32) NOT NULL COMMENT '开户行所属城市',
  `branch` varchar(32) NOT NULL COMMENT '开户行所属支行',
  `mobile` varchar(32) NOT NULL COMMENT '银行预留手机号',
  `withdraw_send_time` datetime DEFAULT NULL COMMENT '发起代付时间',
  `actual_bus_withdraw_time` datetime DEFAULT NULL COMMENT '实际代付时间',
  `withdraw_ref_no` varchar(64) DEFAULT NULL COMMENT '代付流水号',
  `memo` varchar(256) DEFAULT '',
  `status` varchar(16) NOT NULL DEFAULT 'INIT' COMMENT 'INIT:待处理；WITHDRAW_ING:代付中；WITHDRAW_SUCCESS:代付成功；WITHDRAW_FAIL:代付失败',
  `version` int(11) NOT NULL DEFAULT '1',
  `create_time` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `create_by` varchar(32) NOT NULL DEFAULT 'system',
  `modify_time` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `modify_by` varchar(32) NOT NULL DEFAULT 'system',
  `withdraw_type` varchar(32) NOT NULL DEFAULT 'WITHDRAW' COMMENT '代付:WITHDRAW  代扣:WITHHOLD',
  PRIMARY KEY (`id`),
  UNIQUE KEY `payNoIndex` (`withdraw_serial_no`),
  UNIQUE KEY `busWithdrawRefNo` (`withdraw_ref_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5616 DEFAULT CHARSET=utf8 COMMENT='对公代付表';



ALTER TABLE `contract`
MODIFY COLUMN `asset_register_name`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备案名称' AFTER `issuer_tel`;











