/**
* 添加字段 ams_asset_exchange_register
 */

alter table ams_asset_exchange_register add value_days  int(4) DEFAULT NULL comment '期限(单位:天)' after register_time;
alter table ams_asset_exchange_register add repayment_type  tinyint(2) DEFAULT NULL comment '还款方式' after value_days;