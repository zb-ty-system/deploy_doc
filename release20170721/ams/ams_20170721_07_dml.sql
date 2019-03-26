/**
 * 修改注释 ams_asset_exchange_register
 */
alter table ams_asset_exchange_register MODIFY register_status varchar(32) comment '备案状态:UN_REGISTER:未备案,REGISTERING:备案中,GENERATE_CONTRACT:生成合同,REGISTERED:完成,REGISTER_FAILED:备案失败';

/**
*数据变更 ams_issue_plan
*/

UPDATE ams_issue_plan plan set plan.single_amount = plan.single_amount*10000,plan.total_amount = plan.total_amount*10000
where plan.create_time <= NOW();