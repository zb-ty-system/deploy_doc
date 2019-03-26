/**
  添加字段 ams_asset_repay_plan
 */
alter table ams_asset_repay_plan add sign_id varchar(64) DEFAULT NULL comment 'signId' after tel;