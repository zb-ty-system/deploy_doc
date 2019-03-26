use pms;

--（1）、创建“接口请求重试表”，ddl 如下： 
CREATE TABLE `pms_interface_retry` (
`id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
`business_no` varchar(64) DEFAULT NULL COMMENT '流水号,做幂等控制',
`business_type` varchar(64) DEFAULT NULL COMMENT '业务类型（"ASSET_MATCH","资产匹配通知交易")',
`request_param` longtext COMMENT '接口请求参数',
`response_param` longtext COMMENT '接口响应参数',
`status` varchar(32) DEFAULT 'INIT' COMMENT '处理状态：INIT(INIT:初始化),SUCCESS("SUCCESS","处理成功"), FAILURE("FAILURE","处理失败")',
`retry_times` int(11) DEFAULT '0' COMMENT '重试次数',
`memo` varchar(255) DEFAULT NULL COMMENT '备注',
`product_code` varchar(32) DEFAULT NULL COMMENT '产品编号',
`create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
`create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建人',
`modify_by` varchar(32) DEFAULT 'SYS' COMMENT '修改人',
PRIMARY KEY (`id`),
KEY `bizType_bizNo_idx` (`business_type`,`business_no`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='接口请求重试表';


--（1）、在产品系统配置表里添加一条记录，如下： 
INSERT INTO `pms_global_config` VALUES ('2', 'test_product_switch', '是否开放测试产品标的（on-开放/off-不开放）', 'test_product_switch', 'on');


use pms;
update pms_global_config SET property_value='off' where id='2'；