use 'ams';

CREATE TABLE `ams_asset_transfer_record` (
   `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
   `serial_no` VARCHAR(32) DEFAULT NULL COMMENT '流水号',
   `transfer_code` VARCHAR(32) DEFAULT NULL COMMENT '转让编号',
   `asset_id` BIGINT(20) NOT NULL COMMENT '资产Id',
   `asset_code` VARCHAR(32) DEFAULT NULL COMMENT '父资产编号',
   `transfer_order_no` VARCHAR(32) DEFAULT NULL COMMENT '转让订单号',
   `transfer_interest` DECIMAL(16,4) DEFAULT '0.0000' COMMENT '转让资产利息',
   `transfer_amount` DECIMAL(16,4) DEFAULT '0.0000' COMMENT '转让金额',
   `transfer_time` TIMESTAMP NULL DEFAULT NULL COMMENT '转让时间',
   `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
   `create_by` VARCHAR(32) DEFAULT 'SYS' COMMENT '创建者',
   `modify_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
   `modify_by` VARCHAR(32) DEFAULT 'SYS' COMMENT '最后更新者',
   PRIMARY KEY (`id`),
   KEY `idx_transfer_code` (`transfer_code`),
   KEY `idx_asset_code` (`asset_code`)
 ) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='资产信息拆分表';

 
 CREATE TABLE `ams_repay_plan` (
   `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
   `asset_id` bigint(20) DEFAULT NULL COMMENT '资产主键',
   `asset_code` varchar(32) DEFAULT NULL COMMENT '资产编号',
   `repay_count` int(4) DEFAULT NULL COMMENT '还款期数',
   `current_repay_count` int(4) DEFAULT NULL COMMENT '当前还款期数',
   `initial_balance` decimal(16,2) DEFAULT '0.00' COMMENT '期初余额',
   `yield_rate` decimal(12,8) DEFAULT '0.00000000' COMMENT '预期年化收益率',
   `repay_amount` decimal(16,2) DEFAULT '0.00' COMMENT '预期回款金额',
   `repay_principal` decimal(16,2) DEFAULT NULL COMMENT '回款本金',
   `repay_interest` decimal(16,2) DEFAULT NULL COMMENT '回款利息',
   `loan_name` varchar(64) DEFAULT NULL COMMENT '借款人姓名',
   `loan_cert_no` varchar(32) DEFAULT NULL COMMENT '借款人证件号',
   `loan_cert_type` tinyint(2) DEFAULT NULL COMMENT '证件类型:1:居民身份证,2:社会信用代码,3:营业执照',
   `loan_fee` decimal(16,2) DEFAULT '0.00' COMMENT '手续费',
   `repay_status` tinyint(2) DEFAULT '0' COMMENT '还款状态:0:待还款,1:部分还款,2:全部还款',
   `repaid_amount` decimal(16,2) DEFAULT '0.00' COMMENT '已还款金额',
   `waiting_repay_amount` decimal(16,2) DEFAULT '0.00' COMMENT '待还款金额',
   `repay_date` date DEFAULT NULL COMMENT '还款日',
   `repay_time` timestamp NULL DEFAULT NULL COMMENT '还款时间',
   `version` bigint(2) DEFAULT '0' COMMENT '版本号',
   `member_id` varchar(64) DEFAULT NULL COMMENT '借款人平台ID',
   `tel` varchar(32) DEFAULT NULL COMMENT '借款人联系方式',
   `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
   `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
   `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
   `modify_by` varchar(32) DEFAULT NULL COMMENT '融资方编码',
   PRIMARY KEY (`id`),
   KEY `idx_asset_code` (`asset_code`)
 ) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8 COMMENT='还款计划表';

alter table ams_pool change pool_type pool_type tinyint(2) NULL  comment '资产池类型1:定向委托,2:p2p实时放款 5:P2P计划类产品';
 
ALTER TABLE ams_asset ADD COLUMN repayment_count INT(4) NULL COMMENT '还款期数' AFTER transfer_lock_days;

ALTER TABLE ams_loan_info ADD COLUMN product_version INT(4)  NOT NULL DEFAULT 2 COMMENT '产品版本号 2：P2P2.0 3：P2P3.0' AFTER match_expire_time;

ALTER TABLE ams_asset_product_relation ADD COLUMN transfer_amount DECIMAL(16,4)  NULL DEFAULT 0.0000  COMMENT '转让金额' AFTER sale_amount;

ALTER TABLE ams_asset_pool_relation ADD COLUMN transfer_amount DECIMAL(16,4)  NULL DEFAULT 0.000  COMMENT '转让金额' AFTER sale_amount;

ALTER TABLE ams_pool ADD COLUMN transfer_amount DECIMAL(16,4)  NULL DEFAULT 0.0000  COMMENT '转让金额' AFTER frozen_amount;

alter table ams_loan_info add column person_info longtext NULL COMMENT '个人信息' after finance_project_des;



