ALTER TABLE `trade_ladder`.`ladder_batch`
  ADD COLUMN `confirm_count` INT NULL  COMMENT '已确认条数' AFTER `expect_endliquidation_date`;
ALTER TABLE `trade_ladder`.`ladder_batch`
  CHANGE `confirm_count` `confirm_count` INT(11) DEFAULT 0  NULL  COMMENT '已确认条数';
