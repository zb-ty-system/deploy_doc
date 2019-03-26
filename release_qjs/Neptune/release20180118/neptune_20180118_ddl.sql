alter table neptune.account add COLUMN total_addit_income  DECIMAL(16,4) NOT NULL DEFAULT 0.0000  COMMENT '总附加收益' AFTER `total_income`;

alter table neptune.daily_income add COLUMN is_processed  VARCHAR(16) NOT NULL DEFAULT 'FALSE' COMMENT '收益计算标志,TRUE已处理，FALSE未处理' AFTER `sale_channel`;

alter table `batch` DROP INDEX productAndType;

ALTER TABLE `batch`  ADD INDEX productAndType (product_code,type);


ALTER TABLE `product`
ADD COLUMN `is_transfer`  varchar(8) NULL DEFAULT 'FALSE' COMMENT '是否可转让: FALSE-否 TRUE-是' AFTER `sale_end_date`,
ADD COLUMN `low_transfer_yield_rate`  decimal(12,8) NULL DEFAULT 0 COMMENT '转让后收益率下限' AFTER `is_transfer`,
ADD COLUMN `high_transfer_yield_rate`  decimal(12,8) NULL DEFAULT 0 COMMENT '转让后收益率上限' AFTER `low_transfer_yield_rate`;




ALTER TABLE `account_transcation`
MODIFY COLUMN `business_type`  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作业务类型 CASH_AMOUNT兑付本金 CASH_INCOME兑付收益 CASH_ADDIT兑付附加收益 WITHDRAW 对公代付 WITHDRAW_TO_BALANCE转账到余额ORDER_TRANSFEROR 订单转让ORDER_TRANSFEREE 订单受让 INCOME 收益 ADDIT_INCOME 阶梯奖励收益\r\n' AFTER `account_id`;


ALTER TABLE `cash_record`
MODIFY COLUMN `ref_cash_record_id`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '转让方的兑付id' AFTER `status`,
ADD COLUMN `pre_reinvest_no`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '预约复投流水号' AFTER `ref_cash_record_id`,
DROP COLUMN `repeat_invest_flag`;


ALTER TABLE `neptune`.`product`
  ADD COLUMN `pay_channel` VARCHAR(32) NULL  COMMENT '支付渠道:宝付:QJS;银商通QJS_YST' AFTER `high_transfer_yield_rate`;

  
  ALTER TABLE `account_transcation`
MODIFY COLUMN `business_type`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作业务类型 CASH_AMOUNT兑付本金 CASH_INCOME兑付收益 CASH_ADDIT兑付附加收益 WITHDRAW 对公代付 WITHDRAW_TO_BALANCE转账到余额ORDER_TRANSFEROR 订单转让\r\nORDER_TRANSFEROR_AMOUNT 订单转让本金\r\nORDER_TRANSFEROR_INCOME 订单转让收益\r\nORDER_TRANSFEREE_AMOUNT 订单受让本金\r\nORDER_TRANSFEREE_INCOME 订单受让收益\r\nINCOME 收益 \r\nADDIT_INCOME 阶梯奖励收益' AFTER `account_id`;

CREATE TABLE `transfer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_sheet_no_old` varchar(64) NOT NULL COMMENT '原交易系统订单号',
  `app_sheet_no_new` varchar(64) NOT NULL COMMENT '新交易系统订单号',
  `transfer_amount` decimal(16,4) NOT NULL DEFAULT '0.0000' COMMENT '转让金额',
  `transferor_member_id` varchar(64) NOT NULL COMMENT '转让方会员ID',
  `transferee_member_id` varchar(64) NOT NULL COMMENT '受让方会员ID',
  `create_time` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `status` varchar(32) DEFAULT '' COMMENT 'job处理状态   INIT PROCESSING COMPLETED FAIL',
  `memo` varchar(255) DEFAULT '' COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '1' COMMENT '数据版本号',
  `modify_time` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_app_sheet_no_old` (`app_sheet_no_old`) USING BTREE,
  UNIQUE KEY `uni_app_sheet_no_new` (`app_sheet_no_new`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='转让关系表';

ALTER TABLE `neptune`.`transfer`
  ADD  INDEX `idx_status` (`status`);


ALTER TABLE `neptune`.`transfer`
  CHANGE `modify_time` `modify_time` TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) NOT NULL;

ALTER TABLE `neptune`.`invest`
  CHANGE `reinvest_flag` `reinvest_flag` VARCHAR(8) CHARSET utf8 COLLATE utf8_general_ci DEFAULT 'FALSE'   NOT NULL  COMMENT '是否复投:FALSE-否 TRUE-是  EXIT-退出';
ALTER TABLE `neptune`.`cash_record`
  CHANGE `reinvest_flag` `reinvest_flag` VARCHAR(8) CHARSET utf8 COLLATE utf8_general_ci DEFAULT 'FALSE'   NOT NULL  COMMENT '是否复投:FALSE-否 TRUE-是 EXIT-退出';

ALTER TABLE `neptune`.`invest`
  CHANGE `transfer_flag` `transfer_flag` VARCHAR(8) CHARSET utf8 COLLATE utf8_general_ci DEFAULT 'FALSE'  NOT NULL   COMMENT '是否已转让:FALSE-否 TRUE-是;INIT-转让初始化';


##设置产品默认值宝付
ALTER TABLE `neptune`.`product`
CHANGE `pay_channel` `pay_channel` VARCHAR(32) CHARSET utf8 COLLATE utf8_general_ci DEFAULT 'QJS'   NULL  COMMENT '支付渠道:宝付:QJS;银商通QJS_YST';


