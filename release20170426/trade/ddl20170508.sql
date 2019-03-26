ALTER TABLE `trade_ladder`.`ladder_daily_income`
  CHANGE `income_date` `income_date` DATE NULL  COMMENT '收益日期';
ALTER TABLE `trade_ladder`.`ladder_daily_income`
  ADD  INDEX `pId_pc_incomeD_status` (`platform_member_id`, `product_code`, `income_date`, `status`);

ALTER TABLE `trade_ladder`.`ladder_batch`
  ADD  INDEX `tbc_pd_s_ct` (`trade_biz_code`, `product_code`, `status`, `create_time`);
