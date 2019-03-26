use 'ams';

CREATE TABLE `ams_asset_transfer_record` (
   `id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '��������',
   `serial_no` VARCHAR(32) DEFAULT NULL COMMENT '��ˮ��',
   `transfer_code` VARCHAR(32) DEFAULT NULL COMMENT 'ת�ñ��',
   `asset_id` BIGINT(20) NOT NULL COMMENT '�ʲ�Id',
   `asset_code` VARCHAR(32) DEFAULT NULL COMMENT '���ʲ����',
   `transfer_order_no` VARCHAR(32) DEFAULT NULL COMMENT 'ת�ö�����',
   `transfer_interest` DECIMAL(16,4) DEFAULT '0.0000' COMMENT 'ת���ʲ���Ϣ',
   `transfer_amount` DECIMAL(16,4) DEFAULT '0.0000' COMMENT 'ת�ý��',
   `transfer_time` TIMESTAMP NULL DEFAULT NULL COMMENT 'ת��ʱ��',
   `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
   `create_by` VARCHAR(32) DEFAULT 'SYS' COMMENT '������',
   `modify_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '������ʱ��',
   `modify_by` VARCHAR(32) DEFAULT 'SYS' COMMENT '��������',
   PRIMARY KEY (`id`),
   KEY `idx_transfer_code` (`transfer_code`),
   KEY `idx_asset_code` (`asset_code`)
 ) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='�ʲ���Ϣ��ֱ�';

 
 CREATE TABLE `ams_repay_plan` (
   `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '��������',
   `asset_id` bigint(20) DEFAULT NULL COMMENT '�ʲ�����',
   `asset_code` varchar(32) DEFAULT NULL COMMENT '�ʲ����',
   `repay_count` int(4) DEFAULT NULL COMMENT '��������',
   `current_repay_count` int(4) DEFAULT NULL COMMENT '��ǰ��������',
   `initial_balance` decimal(16,2) DEFAULT '0.00' COMMENT '�ڳ����',
   `yield_rate` decimal(12,8) DEFAULT '0.00000000' COMMENT 'Ԥ���껯������',
   `repay_amount` decimal(16,2) DEFAULT '0.00' COMMENT 'Ԥ�ڻؿ���',
   `repay_principal` decimal(16,2) DEFAULT NULL COMMENT '�ؿ��',
   `repay_interest` decimal(16,2) DEFAULT NULL COMMENT '�ؿ���Ϣ',
   `loan_name` varchar(64) DEFAULT NULL COMMENT '���������',
   `loan_cert_no` varchar(32) DEFAULT NULL COMMENT '�����֤����',
   `loan_cert_type` tinyint(2) DEFAULT NULL COMMENT '֤������:1:�������֤,2:������ô���,3:Ӫҵִ��',
   `loan_fee` decimal(16,2) DEFAULT '0.00' COMMENT '������',
   `repay_status` tinyint(2) DEFAULT '0' COMMENT '����״̬:0:������,1:���ֻ���,2:ȫ������',
   `repaid_amount` decimal(16,2) DEFAULT '0.00' COMMENT '�ѻ�����',
   `waiting_repay_amount` decimal(16,2) DEFAULT '0.00' COMMENT '��������',
   `repay_date` date DEFAULT NULL COMMENT '������',
   `repay_time` timestamp NULL DEFAULT NULL COMMENT '����ʱ��',
   `version` bigint(2) DEFAULT '0' COMMENT '�汾��',
   `member_id` varchar(64) DEFAULT NULL COMMENT '�����ƽ̨ID',
   `tel` varchar(32) DEFAULT NULL COMMENT '�������ϵ��ʽ',
   `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
   `create_by` varchar(32) DEFAULT 'SYS' COMMENT '������',
   `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '������ʱ��',
   `modify_by` varchar(32) DEFAULT NULL COMMENT '���ʷ�����',
   PRIMARY KEY (`id`),
   KEY `idx_asset_code` (`asset_code`)
 ) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8 COMMENT='����ƻ���';

alter table ams_pool change pool_type pool_type tinyint(2) NULL  comment '�ʲ�������1:����ί��,2:p2pʵʱ�ſ� 5:P2P�ƻ����Ʒ';
 
ALTER TABLE ams_asset ADD COLUMN repayment_count INT(4) NULL COMMENT '��������' AFTER transfer_lock_days;

ALTER TABLE ams_loan_info ADD COLUMN product_version INT(4)  NOT NULL DEFAULT 2 COMMENT '��Ʒ�汾�� 2��P2P2.0 3��P2P3.0' AFTER match_expire_time;

ALTER TABLE ams_asset_product_relation ADD COLUMN transfer_amount DECIMAL(16,4)  NULL DEFAULT 0.0000  COMMENT 'ת�ý��' AFTER sale_amount;

ALTER TABLE ams_asset_pool_relation ADD COLUMN transfer_amount DECIMAL(16,4)  NULL DEFAULT 0.000  COMMENT 'ת�ý��' AFTER sale_amount;

ALTER TABLE ams_pool ADD COLUMN transfer_amount DECIMAL(16,4)  NULL DEFAULT 0.0000  COMMENT 'ת�ý��' AFTER frozen_amount;

alter table ams_loan_info add column person_info longtext NULL COMMENT '������Ϣ' after finance_project_des;



