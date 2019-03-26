				ALTER TABLE `trade_ladder`.`ladder_daily_income`
  ADD COLUMN `total_income` DECIMAL(16,4) DEFAULT 0.0000  NULL  COMMENT '累计总收益' AFTER `sale_channel`;
