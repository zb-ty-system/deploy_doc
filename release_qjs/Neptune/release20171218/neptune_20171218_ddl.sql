ALTER TABLE `neptune`.`invest`
  ADD COLUMN `reinvest_yield` DECIMAL(16,4) DEFAULT 0.0000  NOT NULL  COMMENT '复投收益' AFTER `mobile_no`,
  ADD COLUMN `transfer_flag` VARCHAR(8) DEFAULT 'FALSE'   NOT NULL  COMMENT '是否转让:FALSE-否 TRUE-是' AFTER `reinvest_yield`,
  ADD COLUMN `reinvest_flag` VARCHAR(8) DEFAULT 'FALSE'   NULL  COMMENT '是否复投:FALSE-否 TRUE-是' AFTER `transfer_flag`,
  ADD COLUMN `ext_pay_no` VARCHAR(64) NULL  COMMENT '直销系统支付流水号' AFTER `reinvest_flag`;


ALTER TABLE `neptune`.`match_record`
  ADD COLUMN `transfer_flag` VARCHAR(8) DEFAULT 'FALSE'   NOT NULL  COMMENT '是否转让:FALSE-否 TRUE-是' AFTER `financing_code`;

ALTER TABLE `neptune`.`account`
  ADD COLUMN `transfer_flag` VARCHAR(8) DEFAULT 'FALSE'   NOT NULL  COMMENT '是否转让:FALSE-否 TRUE-是' AFTER `modify_by`;

ALTER TABLE `neptune`.`daily_income`
  ADD COLUMN `addit_income` DECIMAL(16,4) NOT NULL DEFAULT 0.0000  COMMENT '附加收益' AFTER `income`;
ALTER TABLE `neptune`.`product`
 ADD COLUMN `reinvest_flag` VARCHAR(8) DEFAULT 'FALSE'   NULL  COMMENT '是否复投:FALSE-否 TRUE-是' AFTER `yield`;

ALTER TABLE `neptune`.`cash_record`
ADD COLUMN `addit_income`  DECIMAL(16,4) NOT NULL DEFAULT 0.0000  COMMENT '附加收益' AFTER `income`,
ADD COLUMN `repeat_invest_flag`  VARCHAR(16) NOT NULL DEFAULT 'FALSE' COMMENT '复投标志 TRUE 是； FALSE 不是' AFTER `memo`,
MODIFY COLUMN `status`  VARCHAR(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'INIT:待处理；CASHING:兑付中；CASH_SUCCESS:兑付成功；CASH_FAIL:兑付失败；OVERDUE:逾期；TRANSFER:已转让；INVALID：已作废' AFTER `repeat_invest_flag`,
ADD COLUMN `ref_cash_record_id`  VARCHAR(64) NOT NULL DEFAULT '' COMMENT '转让方的交易流水号' AFTER `status`,
ADD COLUMN `pay_code`  VARCHAR(64) NOT NULL DEFAULT '' COMMENT '支付返回码' AFTER `version`,
ADD COLUMN `pay_msg`  VARCHAR(256) NOT NULL DEFAULT '' COMMENT '支付返回描述' AFTER `pay_code`,
ADD COLUMN `reinvest_flag`  VARCHAR(64) NOT NULL DEFAULT 'FALSE' COMMENT '是否复投:FALSE-否 TRUE-是' AFTER `pay_msg`,
DROP INDEX `idx_cash_appSheetNo`,
ADD UNIQUE INDEX `idx_cash_ref_no` (`cash_ref_no`,`app_sheet_no`) USING BTREE ;


ALTER TABLE `batch`
MODIFY COLUMN `type`  VARCHAR(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '//产品流标FAILURE,//匹配MATCH,//放款LOAN,//合同CONTRACT,//兑付计划CASHPLAN,//每日收益INCOME,//兑付CASH//逾期兑付OVERDUECASH//失败兑付 FAILCASH//对公代付WITHDRAW' AFTER `id`;
