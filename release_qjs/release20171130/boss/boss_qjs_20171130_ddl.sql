use boss;
--创建模板表
CREATE TABLE `template` (
   `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
   `template_no` varchar(64) DEFAULT NULL COMMENT '模板编号',
   `template_name` varchar(64) DEFAULT NULL COMMENT '模板名称',
   `template_content` varchar(2048) DEFAULT NULL COMMENT '模板内容',
   `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
   `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
   `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
   `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后更新者',
   PRIMARY KEY (`id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='模板配置表'