ALTER TABLE `pms`.`pms_product_profit`
  ADD COLUMN `floating_yield_rate` numeric(12,8) default 0.00000000   COMMENT '浮动利率' AFTER `add_yield_rate`;​




