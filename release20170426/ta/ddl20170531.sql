CREATE TABLE `ladder_redeem_income` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invest_serial_no` varchar(64) DEFAULT NULL COMMENT '投资流水号',
  `redeem_serial_no` varchar(64) DEFAULT NULL COMMENT '赎回流水号',
  `redeem_amount` decimal(16,4) DEFAULT NULL COMMENT '赎回金额',
  `redeem_date` date DEFAULT NULL COMMENT '赎回的日期',
  `redeem_income` decimal(16,4) DEFAULT NULL,
  `sale_channel` varchar(8) DEFAULT NULL,
  `product_code` varchar(64) DEFAULT NULL,
  `trade_account_no` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
