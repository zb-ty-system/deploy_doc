ALTER TABLE `trade_ladder`.`ladder_batch`   
  ADD COLUMN `original_batchNo` VARCHAR(64) NULL  COMMENT '原批次号' AFTER `product_name`;