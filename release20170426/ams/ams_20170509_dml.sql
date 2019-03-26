/*
Navicat MySQL Data Transfer

*/

/**
注释修改
 */
/**
*1、ams_asset
 */
alter table ams_asset modify asset_type tinyint(2) comment '融资类型1:小贷收益权,2:应收账款收益权,3:定向融资工具';

alter table ams_asset modify collect_status tinyint(2) comment '募集状态10:待募集,12:待成立,13:已成立,18:流标,99:不可用';

alter table ams_asset modify approval_status tinyint(2) comment '审核状态1:未提交审核,2:待审核,3:审核通过,4:审核未通过';

/**
*2、ams_asset_approval
 */
alter table ams_asset_approval modify approval_status tinyint(2) comment '审核状态1:未提交审核,2:待审核,3:审核通过,4:审核未通过';

/**
*3、ams_finance_subject
 */
alter table ams_finance_subject modify status tinyint(2) comment '发行方状态1:正常,2:冻结';

/**
*4、ams_pool
 */
alter table ams_pool modify load_switch_status tinyint(2) comment '装载开关1:可出入,2:可出,3:可入,4:包装,5:停止出入';

alter table ams_pool modify pool_type tinyint(2) comment '资产池类型1:定向委托';

/**
*5、ams_trustee
 */
alter table ams_trustee modify status tinyint(2) comment '受托方状态1:正常,2:冻结';

