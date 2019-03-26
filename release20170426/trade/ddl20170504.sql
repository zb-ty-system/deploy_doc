ALTER TABLE `trade_ladder`.`ladder_stage_income_plan`
  ADD COLUMN `batch_no` VARCHAR(64) NULL   COMMENT '批次号' AFTER `income_process_date`;


ALTER TABLE `trade_ladder`.`ladder_redeem_confirm`
  CHANGE `invest_amount` `invest_amount` DECIMAL(16,4) DEFAULT 0.0000  NULL  COMMENT '投资金额(本金)',
  CHANGE `interest_amount` `interest_amount` DECIMAL(16,4) DEFAULT 0.0000  NULL  COMMENT '计息金额',
  CHANGE `redeem_income` `redeem_income` DECIMAL(16,4) DEFAULT 0.0000  NULL  COMMENT '兑付收益',
  CHANGE `redeem_total_amount` `redeem_total_amount` DECIMAL(16,4) DEFAULT 0.0000  NULL  COMMENT '赎回金额';
ALTER TABLE `trade_ladder`.`ladder_stage_income_plan`
  DROP INDEX `originTradeSerialNo_index`,
  DROP INDEX `appSheetNo_index`,
  ADD  INDEX `appSheetNo_currentStageNum_index` (`app_sheet_no`, `current_stage_num`);


ALTER TABLE `trade_ladder`.`ladder_error_log`
  CHANGE `request_param` `request_param` VARCHAR(1024) CHARSET utf8 COLLATE utf8_general_ci NULL,
  CHANGE `error_message` `error_message` VARCHAR(512) CHARSET utf8 COLLATE utf8_general_ci NULL,
  CHANGE `trace` `trace` VARCHAR(1024) CHARSET utf8 COLLATE utf8_general_ci NULL;


ALTER TABLE `trade_ladder`.`ladder_stage_income_plan`
  DROP INDEX `appSheetNo_currentStageNum_index`,
  ADD  UNIQUE INDEX `appSheetNo_currentStageNum_index` (`app_sheet_no`, `current_stage_num`);