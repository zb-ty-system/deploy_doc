ALTER TABLE `pms`.`pms_product`
  ADD COLUMN `product_line_name` VARCHAR (64) NULL   COMMENT '产品线名称' AFTER `product_line_code`;

