use boss;


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
 ) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='模板配置表';
 
 # 20171204  增加操作记录表
 CREATE TABLE `operation_record_of_institutional_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name_for_login` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '操作者的登录名',
  `user_real_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '操作者的真实姓名',
  `institutional_member_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL COMMENT '被操作的机构账户 id',
  `operation_type` char(30) COLLATE utf8_unicode_ci NOT NULL COMMENT '操作类型',
  `amount` decimal(16,2) NOT NULL COMMENT '操作涉及的金额，以元为单位',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modify_by` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='机构账户的操作记录表';