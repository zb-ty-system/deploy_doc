ALTER TABLE `trade_ladder`.`ladder_batch`   
  ADD COLUMN `sale_channel` VARCHAR(32) NULL  COMMENT '渠道:TXS-唐小僧 QYLC-企业理财 YW-摇旺' AFTER `original_batchNo`;
  
ALTER TABLE `trade_ladder`.`ladder_redeem_confirm`   
  ADD COLUMN `interest_days` INT(32) DEFAULT 0  NULL  COMMENT '计息天数' AFTER `card_no`;
  
  
ALTER TABLE `trade_ladder`.`ladder_stage_income_plan`   
  ADD COLUMN `sale_channel` VARCHAR(32) NULL  COMMENT '渠道:TXS-唐小僧 QYLC-企业理财 YW-摇旺' AFTER `modify_by`;  
  
ALTER TABLE `trade_ladder`.`ladder_batch`   
  ADD COLUMN `expect_endliquidation_date` DATETIME DEFAULT CURRENT_TIMESTAMP   NULL  COMMENT '预计结清日' AFTER `sale_channel`;

  
ALTER TABLE `trade_ladder`.`ladder_contract`   
  DROP COLUMN `asset_id`, 
  DROP COLUMN `file_name`, 
  DROP COLUMN `file_path`, 
  DROP COLUMN `assignee_legal_person_identity_card`, 
  DROP COLUMN `calendar_model`, 
  DROP COLUMN `version`, 
  CHANGE `invest_request_id` `order_no` VARCHAR(64) CHARSET utf8 COLLATE utf8_general_ci NULL  COMMENT '订单编号',
  CHANGE `platform_member_id` `platform_member_id` VARCHAR(64) CHARSET utf8 COLLATE utf8_general_ci NULL  COMMENT '委托人id'  AFTER `contract_no`,
  CHANGE `contract_type` `contract_type` VARCHAR(32) CHARSET utf8 COLLATE utf8_general_ci NULL  COMMENT 'PERSONAL ; ENTERPRISE'  AFTER `member_identity_card`,
  CHANGE `channel_no` `sale_channel` VARCHAR(32) CHARSET utf8 COLLATE utf8_general_ci NULL  COMMENT '渠道 TXS-唐小僧 QYLC-企业理财 YW-摇旺',
  CHANGE `assignee_id` `assignee_id` VARCHAR(64) CHARSET utf8 COLLATE utf8_general_ci NULL  COMMENT '受托方id'  AFTER `sale_channel`,
  CHANGE `lock_data` `lock_data` INT(11) DEFAULT 0  NULL  COMMENT '锁定日期'  AFTER `assignee_name`,
  CHANGE `assignee_legal_person_name` `assignee_legal_person_name` VARCHAR(64) CHARSET utf8 COLLATE utf8_general_ci NULL  COMMENT '受托方法人姓名'  AFTER `lock_data`,
  CHANGE `assignee_cooperation_agency_id` `assignee_cooperation_agency_code` VARCHAR(64) CHARSET utf8 COLLATE utf8_general_ci NULL  COMMENT '受托方合作机构代码',
  CHANGE `investment_target_type` `cooperation_agency` VARCHAR(64) CHARSET utf8 COLLATE utf8_general_ci NULL  COMMENT '定向投资标的合作机构(发行方名称)',
  CHANGE `invest_date` `invest_date` DATETIME NULL  COMMENT '委托投资日(用户投资成功日期，精确到年月日)'  AFTER `year_yield`,
  CHANGE `expire_date` `expire_date` DATETIME NULL  COMMENT '委托到期日(此阶梯产品到期日)',
  ADD COLUMN `withdrawal_commission_json` VARCHAR(1024) NULL  COMMENT '阶段提前退出手续费扣减json' AFTER `expire_date`,
  ADD COLUMN `assets_match_json` VARCHAR(1024) NULL  COMMENT '订单对应资产匹配json' AFTER `withdrawal_commission_json`;  
  
ALTER TABLE `trade_ladder`.`ladder_contract`   
  ADD COLUMN `product_code` VARCHAR(64) NULL  COMMENT '产品编码' AFTER `memo`,
  ADD COLUMN `product_name` VARCHAR(64) NULL  COMMENT '产品名称' AFTER `product_code`;
  
ALTER TABLE `trade_ladder`.`ladder_contract`   
  DROP COLUMN `assignee_legal_person_name`;
ALTER TABLE `trade_ladder`.`ladder_contract`   
  DROP COLUMN `assignee_cooperation_agency_name`;  
  
  
  
  
ALTER TABLE `trade_ladder`.`ladder_batch`   
  CHANGE `modify_time` `modify_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NULL;  
ALTER TABLE `trade_ladder`.`ladder_contract`   
  CHANGE `modify_time` `modify_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NULL;  
ALTER TABLE `trade_ladder`.`ladder_daily_income`   
  CHANGE `modify_time` `modify_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NULL;  
ALTER TABLE `trade_ladder`.`ladder_invest_confirm`   
  CHANGE `modify_time` `modify_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NULL;  
ALTER TABLE `trade_ladder`.`ladder_invest_request`   
  CHANGE `modify_time` `modify_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NULL;  
ALTER TABLE `trade_ladder`.`ladder_redeem_confirm`   
  CHANGE `modify_time` `modify_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NULL;  
ALTER TABLE `trade_ladder`.`ladder_redeem_request`   
  CHANGE `modify_time` `modify_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NULL;  
ALTER TABLE `trade_ladder`.`ladder_stage_income_plan`   
  CHANGE `modify_time` `modify_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NULL;
ALTER TABLE `trade_ladder`.`ladder_user_account`   
  CHANGE `modify_time` `modify_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NULL;  
  
  
ALTER TABLE `trade_ladder`.`ladder_invest_confirm`
  ADD COLUMN `contract_status` VARCHAR(32) DEFAULT 'INIT'  NULL   COMMENT '合同状态' AFTER `modify_by`;
ALTER TABLE `trade_ladder`.`ladder_invest_confirm`
  ADD  INDEX `status_contractStatus` (`status`, `contract_status`);

ALTER TABLE `trade_ladder`.`ladder_contract`
  CHANGE `withdrawal_commission_json` `withdrawal_commission_json` VARCHAR(5120) CHARSET utf8 COLLATE utf8_general_ci NULL   COMMENT '阶段提前退出手续费扣减json',
  CHANGE `assets_match_json` `assets_match_json` VARCHAR(5120) CHARSET utf8 COLLATE utf8_general_ci NULL   COMMENT '订单对应资产匹配json';

ALTER TABLE `trade_ladder`.`ladder_contract`
  ADD  INDEX `order_salechannel` (`order_no`, `sale_channel`);
  
ALTER TABLE `trade_ladder`.`ladder_invest_confirm`
  ADD COLUMN `memo` VARCHAR(1024) NULL   COMMENT '备注' AFTER `contract_status`;
  
ALTER TABLE `trade_ladder`.`ladder_contract`
  CHANGE `status` `status` VARCHAR(32) CHARSET utf8 COLLATE utf8_general_ci DEFAULT 'INIT'  NULL   COMMENT 'INIT;SUCESS ; FAIL';
  
  
  
  
  
  
  
  