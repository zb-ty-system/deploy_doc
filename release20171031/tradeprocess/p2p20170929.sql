ALTER TABLE `p2p`.`p2p_contract`
  ADD COLUMN `loan_purpose` VARCHAR(512) NULL  COMMENT '借款用途' AFTER `loan_no`;
