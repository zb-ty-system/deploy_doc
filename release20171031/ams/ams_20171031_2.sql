/**
  添加字段 ams_asset_repay_plan
 */
alter table ams_asset_repay_plan add loan_purpose longtext DEFAULT NULL comment '借款用途' after loan_fee;