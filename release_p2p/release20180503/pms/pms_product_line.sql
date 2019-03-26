-- ----------------------------
-- 添加产品线
-- ----------------------------
INSERT INTO `pms_product_line`
	(line_code,line_name,line_display_name,pattern_code,status,display_status,sale_channel_code,risk_level,description)
VALUES
	('051804001', '一月计划', '一个月计划', '05', '1', '1', 'MSD', '1', null),
	('051804002', '三个月计划', '三个月计划', '05', '1', '1', 'MSD', '1', null),
	('051804003', '六个月计划', '六个月计划', '05', '1', '1', 'MSD', '1', null),
	('051804004', '九个月计划', '九个月计划', '05', '1', '1', 'MSD', '1', null),
	('051804005', '十二个月计划', '十二个月计划', '05', '1', '1', 'MSD', '1', null);
