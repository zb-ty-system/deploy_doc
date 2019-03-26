/**
  pms_product表增加字段product_specification_url
 */
ALTER TABLE pms_product ADD product_specification_url varchar(256) DEFAULT '' COMMENT '产品说明书URL' AFTER sync_status;