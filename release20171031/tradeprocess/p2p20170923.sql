ALTER TABLE `p2p`.`p2p_contract`
  ADD COLUMN `loan_no` VARCHAR(64) NULL  COMMENT '外部编号（马上贷）' AFTER `loan_display_identity_card`;
