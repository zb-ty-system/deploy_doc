/**
* 修改ams_asset 注释
 */

ALTER table ams_asset MODIFY asset_type TINYINT(2) COMMENT '融资类型:1:个人贷款,2:企业贷款,3:融资租赁,4:应收账款,5:个人贷款收益权,6:企业贷款收益权,7:融资租赁收益权,8:应收账款收益权';
ALTER table ams_asset MODIFY register_type TINYINT(2) DEFAULT '1' COMMENT '注册类型：1-普通录入,2-授信录入,3-交易所录入';
ALTER table ams_asset MODIFY finance_subject_id bigint(20) DEFAULT NULL COMMENT '融资方ID';
ALTER table ams_asset MODIFY finance_subject_code varchar(32) DEFAULT NULL COMMENT '融资方编码';

/**
* 更新ams_asset
 */
update ams_asset set register_type=1 where register_type is null;

update ams_asset set asset_type=5 where asset_type=1;
update ams_asset set asset_type=8 where asset_type in (2,3);

/**
* 添加字段 ams_asset_exchange_register
 */

alter table ams_asset_exchange_register add parent_asset_code  varchar(32) DEFAULT NULL comment '资产来源编码' after asset_code;
alter table ams_asset_exchange_register add register_amount  decimal(16,4) DEFAULT '0.0000' comment '备案金额' after register_rate;
alter table ams_asset_exchange_register add register_value_start_time  timestamp NULL DEFAULT NULL comment '备案起息日' after register_amount;
alter table ams_asset_exchange_register add register_value_end_time  timestamp NULL DEFAULT NULL comment '备案结息日' after register_value_start_time;
alter table ams_asset_exchange_register add register_expire_time  timestamp NULL DEFAULT NULL comment '备案到期日' after register_value_end_time;
alter table ams_asset_exchange_register add register_time  timestamp NULL DEFAULT NULL comment '备案时间' after register_expire_time;

alter table ams_asset_exchange_register modify register_rate  decimal(12,8) DEFAULT '0.0000' comment '备案利率';

/**
* 添加字段 ams_asset
 */

alter table ams_asset add parent_asset_code  varchar(32) DEFAULT NULL comment '资产来源编码' after asset_code;
alter table ams_asset add provide_loan_code  varchar(32) DEFAULT NULL comment '出资方编码' after finance_subject_code;

/**
* 添加字段 ams_finance_subject
 */

alter table ams_finance_subject add subject_address_show_name varchar(1024) DEFAULT NULL comment '公司注册地址展示名' after subject_address;

/**
* 修改ams_finance_subject 注释
 */

ALTER table ams_finance_subject MODIFY subject_name varchar(256) DEFAULT NULL COMMENT '融资方名称';
ALTER table ams_finance_subject MODIFY subject_show_name varchar(256) DEFAULT NULL COMMENT '融资方展示名称';

/**
* 添加字段 ams_trustee
 */

alter table ams_trustee add trustee_address_show_name varchar(1024) DEFAULT NULL comment '公司注册地址展示名' after trustee_address;

/**
* 添加字段 ams_business_credit
 */
alter table ams_business_credit add provide_loan_name  varchar(256) DEFAULT NULL comment '出资方名称' after financing_name;