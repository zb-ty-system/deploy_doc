/*
Navicat MySQL Data Transfer

*/

/**
注释修改
 */
alter table ams_asset modify collect_status tinyint(2) comment '募集状态10:待审核,12:待成立,13:已成立,18:流标,99:不可用';

/**
受托方
 */
alter table ams_trustee modify trustee_show_name varchar(256) comment '受托方展示名';
alter table ams_trustee modify cert_no_show_name varchar(256) comment '证件号码展示名';


/**
发行方
 */
alter table ams_finance_subject modify subject_show_name varchar(256) comment '发行方展示名';
alter table ams_finance_subject modify cert_no_show_name varchar(256) comment '证件号码展示名';