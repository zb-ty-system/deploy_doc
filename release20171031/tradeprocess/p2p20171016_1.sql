ALTER TABLE `p2p`.`p2p_batch`
  ADD COLUMN `req_no` VARCHAR(64) NULL   COMMENT '交易生成的流水号' AFTER `id`;
ALTER TABLE `p2p`.`p2p_cash_record`
  ADD COLUMN `req_no` VARCHAR(64) NULL   COMMENT '交易生成的流水号' AFTER `id`;