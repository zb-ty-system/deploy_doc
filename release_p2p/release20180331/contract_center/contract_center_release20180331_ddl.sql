ALTER TABLE `contract_center`.`contract`
CHANGE `sale_channel` `sale_channel` VARCHAR(32) CHARSET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '渠道:TXS-唐小僧 QJS-桥金所 TY-天鼋 ZD-资鼎';
ALTER TABLE `contract_center`.`sign_record`
ADD INDEX `idx_contract_no` (`contract_no`);