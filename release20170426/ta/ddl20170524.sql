ALTER TABLE `ta_ladder`.`ladder_trade_account_transaction`
  ADD COLUMN `ref_type` VARCHAR(40) NULL   COMMENT '变动表名' AFTER `change_amount`,
  ADD COLUMN `ref_id` BIGINT(20) NULL   COMMENT '变动表ID' AFTER `ref_type`;