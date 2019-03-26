/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.6.34 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

-- ----------------------------
-- 产品基本信息表里添加字段
-- ----------------------------
alter table pms_product add column register_type varchar(12) default 'UNAUTO' comment '注册类型（AUTO:自动,UNAUTO:非自动）';
alter table pms_product add column open_type varchar(12) default 'OUT' comment '开放类型（IN:对内，OUT:对外）';

 
-- ----------------------------
-- 产品期限表里添加字段
-- ----------------------------
alter table pms_product_period add column lock_period int(11) DEFAULT NULL COMMENT '锁定期';
alter table pms_product_period add column lock_period_unit tinyint(2) DEFAULT '1' COMMENT '锁定期限单位(1:天 2：周 3：月 4:年)';

 
-- ----------------------------
-- 全局配置表里添加记录
-- ----------------------------
INSERT INTO `pms_global_config`
	(group_name,group_name_desc,property_name,property_value)
VALUES
	('n_plan_open_time_nodes', 'N复投计划产品的开放时间节点（用#分割，单位：小时）', 'n_plan_open_time_nodes', '10#15#18#21'),
	('n_plan_count_stock_interval_out', 'N复投计划对外产品计算库存的时间间隔（单位：分钟），相对开放时间节点', 'n_plan_count_stock_interval_out', '30'),
	('n_plan_product_open_amt_threshold_out', 'N复投计划对外产品判断金额的阈值（单元：元）', 'n_plan_product_open_amt_threshold_out', '100000'),
	('n_plan_product_close_time', 'N复投计划产品的闭市时间（单位：时分秒）', 'n_plan_product_close_time', '23:00:00'),
	('n_plan_count_stock_interval_in', 'N复投计划对内产品计算库存的时间间隔（单位：分钟），相对当前日期', 'n_plan_count_stock_interval_in', '30'),
	('n_plan_open_time_interval_in', 'N复投计划对内产品开放产品的时间间隔（单位：分钟），相对n_plan_count_stock_interval_in', 'n_plan_open_time_interval_in', '30')