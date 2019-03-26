ALTER TABLE `p2p`.`p2p_contract`
  ADD COLUMN `loan_tel_no` VARCHAR(16) NULL   COMMENT '借款人联系方式' AFTER `loan_purpose`,
  ADD COLUMN `invest_tel_no` VARCHAR(16) NULL   COMMENT '投资人联系方式' AFTER `loan_tel_no`;