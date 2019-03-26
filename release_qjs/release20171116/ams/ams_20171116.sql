/**
  添加字段 ams_asset_product_relation
 */

alter table ams_asset_product_relation add appoint_amount decimal(16,4) DEFAULT '0.0000' comment '预约金额' after release_amount;