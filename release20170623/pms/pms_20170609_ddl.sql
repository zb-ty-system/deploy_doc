
ALTER TABLE `pms`.`pms_product_ladder`
  ADD COLUMN `poundage` numeric(12,8) default 0.00000000   COMMENT '手续费率' AFTER `yield_rate`;

alter table `pms`.`pms_product_profit` drop column `loop_increase_yield_rate`;

ALTER TABLE `pms`.`pms_product`
  ADD COLUMN `sync_status` tinyint(2) DEFAULT '0' COMMENT '同步状态(0:未同步,1:已同步)' AFTER `archive_time`;


