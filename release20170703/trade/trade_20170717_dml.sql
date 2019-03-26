ALTER TABLE `trade_ladder`.`ladder_contract`
  DROP INDEX `order_salechannel`,
  ADD  UNIQUE INDEX `order_salechannel` (`order_no`, `sale_channel`);

