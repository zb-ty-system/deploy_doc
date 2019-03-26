/**
 * 新增字段 ams_asset
 */
alter table ams_asset add publish_info longtext comment '披露信息(JSON格式)';


/**
 * 新增字段 ams_asset_exchange_register
 */
alter table ams_asset_exchange_register add register_name varchar(256) comment '备案名称' after register_status;
alter table ams_asset_exchange_register add register_rate decimal(12,8) comment '备案利率' after register_name;

/**
 * 新增字段 ams_finance_subject
 */
alter table ams_finance_subject add tel varchar(32) comment '电话' after business_scope;
alter table ams_finance_subject add email varchar(32) comment '邮箱' after tel;

/**
 * 新增字段 ams_exchange
 */
alter table ams_exchange add exchange_rate decimal(12,8) comment '交易所费率' after introduction;