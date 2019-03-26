
/**
  修改字段ams_pool
 */
ALTER table ams_pool MODIFY pool_type TINYINT(2) COMMENT '资产池类型1:定向委托,2:p2p实时放款';

/**
  增加字段ams_asset_repay_plan
 */
alter table ams_asset_repay_plan add finance_subject_code varchar(32) DEFAULT NULL comment '融资方编码' after repay_interest;
alter table ams_asset_repay_plan add loan_name varchar(64) DEFAULT NULL comment '借款人姓名' after finance_subject_code;
alter table ams_asset_repay_plan add loan_cert_no varchar(32) DEFAULT NULL comment '借款人证件号' after loan_name;
alter table ams_asset_repay_plan add loan_cert_type tinyint(2) DEFAULT NULL comment '证件类型:1:居民身份证,2:社会信用代码,3:营业执照' after loan_cert_no;
alter table ams_asset_repay_plan add loan_fee decimal(16,4) DEFAULT '0.0000' comment '手续费' after loan_cert_type;
alter table ams_asset_repay_plan add member_id varchar(64) DEFAULT NULL comment '借款人平台ID' after loan_fee;
alter table ams_asset_repay_plan add asset_type tinyint(2) DEFAULT NULL comment '融资类型:1:个人贷款,2:企业贷款,3:融资租赁,4:应收账款,5:个人贷款收益权,6:企业贷款收益权,7:融资租赁收益权,8:应收账款收益权' after member_id;
alter table ams_asset_repay_plan add repay_status tinyint(2) DEFAULT '0' comment '还款状态:0:待还款,1:部分还款,2:全部还款' after loan_fee;
alter table ams_asset_repay_plan add repaid_amount decimal(16,4) DEFAULT '0.0000' comment '已还款金额' after repay_status;
alter table ams_asset_repay_plan add waiting_repay_amount decimal(16,4) DEFAULT '0.0000' comment '待还款金额' after repaid_amount;
alter table ams_asset_repay_plan add version bigint(2) DEFAULT '0' comment '版本号' after waiting_repay_amount;
alter table ams_asset_repay_plan add modify_time timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '最后更新时间' after create_by;
alter table ams_asset_repay_plan add modify_by varchar(32) DEFAULT NULL comment '融资方编码' after modify_time;

/**
  增加字段ams_asset
 */
 alter table ams_asset add ext_asset_code varchar(64) DEFAULT NULL comment '外部资产编码' after parent_asset_code;

 /**
  *初始数据
  */
INSERT INTO ams_pool (`pool_code`, `pool_name`, `pool_type`, `limit_amount`, `total_amount`, `stock_amount`, `frozen_amount`, `sale_amount`,`finance_subject_code`)
VALUES ('MSD2017001', 'p2p-21天', '2', '0', '0', '0', '0', '0','MSD');

INSERT INTO `ams_finance_subject` (`subject_code`,	`subject_name`,	`subject_show_name`,`cert_type`,`cert_no`,`cert_no_show_name`,`registered_capital`)
VALUES ('MSD','马上贷','马上贷','2','','','0.0000');