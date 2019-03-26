/**
  pms_product表增加字段reservation_amount
 */
ALTER TABLE pms_product ADD reservation_amount DECIMAL(16,4) DEFAULT '0.0000' COMMENT '预订金额(线下机构预订金额)' AFTER total_amount;