/**
* 添加字段 ams_listed_application
 */
alter table ams_listed_application add sign_status varchar(32) DEFAULT '' COMMENT '签章状态：01:已签章' after asset_type;

/**
* 添加字段 ams_permit_application
 */
alter table ams_permit_application add sign_status varchar(32) DEFAULT '' COMMENT '签章状态：01:已签章' after approval_suggestion;