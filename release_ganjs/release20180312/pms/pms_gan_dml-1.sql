/**
  pms_product_period表增加索引
 */
ALTER TABLE pms_product_period ADD INDEX index_sale_start_time (`sale_start_time`);
ALTER TABLE pms_product_period ADD INDEX index_sale_end_time (`sale_end_time`);
ALTER TABLE pms_product_period ADD INDEX index_invest_period (`invest_period`);