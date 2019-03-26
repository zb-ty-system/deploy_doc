/**
  添加字段 ams_asset_repay_plan
 */
alter table ams_asset_repay_plan add tel varchar(32) DEFAULT NULL comment '借款人联系方式' after member_id;