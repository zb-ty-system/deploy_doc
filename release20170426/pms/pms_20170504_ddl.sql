ALTER TABLE `pms`.`pms_product`
  ADD COLUMN `asset_pool_type` tinyint(2) NULL   COMMENT '资产池类型(1:定向委托收益池)' AFTER `product_line_code`;

ALTER TABLE `pms`.`pms_product`
  ADD COLUMN `asset_pool_name` VARCHAR(128) NULL   COMMENT '资产池名称' AFTER `asset_pool_code`;

ALTER TABLE `pms`.`pms_product`
  ADD COLUMN `last_approval_time` timestamp NULL   COMMENT '最终审核时间' AFTER `approval_status`;