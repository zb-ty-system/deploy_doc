/**
  pms_product表修改字段【collect_status】的备注
 */
ALTER TABLE pms_product MODIFY COLUMN `collect_status` tinyint(2) DEFAULT NULL COMMENT '产品募集状态(10:待募集，11:募集期，12:募集完成)'; 

/**
  pms_product表增加字段【loan_order_no_set】【collect_mode】
 */
ALTER TABLE pms_product ADD `loan_order_no_set` longtext COMMENT '借款订单编号集' AFTER asset_pool_name;
ALTER TABLE pms_product ADD `collect_mode` varchar(8) DEFAULT NULL COMMENT '募集方式（01:募集包）' AFTER loan_order_no_set;


