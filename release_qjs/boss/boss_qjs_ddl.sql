/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.6.34 : Database - boss
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`boss` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `boss`;

/*Table structure for table `asset_file` */

DROP TABLE IF EXISTS `asset_file`;

CREATE TABLE `asset_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `file_serial_no` varchar(64) DEFAULT NULL COMMENT '文件序列号(oss文件名)',
  `file_name` varchar(128) DEFAULT NULL COMMENT '文件名',
  `status` tinyint(2) DEFAULT NULL COMMENT '1:处理成功,2:处理失败',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='上传文件';

/*Data for the table `asset_file` */

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '字典名称',
  `code` varchar(32) NOT NULL COMMENT '字典编码',
  `key` varchar(64) NOT NULL COMMENT '键',
  `value` varchar(64) DEFAULT NULL COMMENT '字典值',
  `create_by` varchar(128) DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_by` varchar(128) DEFAULT NULL COMMENT '更新人',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT NULL COMMENT '启用状态：1：已启用（不可修改）；0：未启用（可修改）；',
  `seq` tinyint(2) DEFAULT NULL COMMENT '顺序',
  `delete_flag` tinyint(1) DEFAULT NULL COMMENT '删除状态：1：已删除；0：未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8;



/*Table structure for table `file_info` */

DROP TABLE IF EXISTS `file_info`;

CREATE TABLE `file_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `file_name` varchar(256) DEFAULT NULL COMMENT '文件名称',
  `show_name` varchar(256) DEFAULT NULL COMMENT '文件展示名称',
  `download_url` varchar(256) DEFAULT NULL COMMENT '文件下载地址',
  `file_type` char(1) DEFAULT NULL COMMENT '文件类型: 1 pdf，2 word',
  `hook_type` char(1) DEFAULT NULL COMMENT '勾选类型: 1 纯披露，2 动态生成，3 内部信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_by` varchar(128) DEFAULT NULL COMMENT '创建人',
  `modify_by` varchar(128) DEFAULT NULL COMMENT '修改人',
  `ext_info` varchar(1024) DEFAULT NULL COMMENT '扩展信息，保存格式为json',
  `relation_product` text COMMENT '披露文件关联的所有产品',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;


/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL COMMENT '菜单名称',
  `parent_id` int(11) DEFAULT NULL COMMENT '上级菜单ID',
  `display_order` int(11) DEFAULT NULL COMMENT '显示顺序',
  `memo` varchar(256) DEFAULT NULL COMMENT '备注',
  `refer_url` varchar(256) DEFAULT NULL COMMENT '菜单链接',
  `is_valid` tinyint(3) DEFAULT NULL COMMENT '是否有效 1 有效 2 无效',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(128) DEFAULT NULL COMMENT '创建人',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modify_by` varchar(128) DEFAULT NULL COMMENT '修改人',
  `icon` varchar(128) DEFAULT NULL COMMENT '图标地址',
  `delete_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识：1：已删除；0：未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8;



/*Table structure for table `operation_history` */

DROP TABLE IF EXISTS `operation_history`;

CREATE TABLE `operation_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(128) NOT NULL DEFAULT '0' COMMENT '创建人',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modify_by` varchar(128) DEFAULT NULL COMMENT '修改人',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户Id',
  `operation_type` varchar(128) NOT NULL COMMENT '操作类型   userRegister:用户注册  userLogin:用户登录',
  `content` varchar(64) DEFAULT NULL COMMENT '操作描述',
  `refer_id` varchar(10) DEFAULT NULL COMMENT '业务ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2921 DEFAULT CHARSET=utf8;



/*Table structure for table `power` */

DROP TABLE IF EXISTS `power`;

CREATE TABLE `power` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menu_id` int(11) NOT NULL COMMENT '菜单id',
  `operation_code` varchar(64) NOT NULL COMMENT '操作权限类型',
  `name` varchar(64) DEFAULT NULL COMMENT '操作权限名称',
  `request_url` varchar(128) DEFAULT NULL COMMENT '操作权限请求地址',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(128) DEFAULT NULL COMMENT '创建人',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modify_by` varchar(128) DEFAULT NULL COMMENT '更新人',
  `delete_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识：1：已删除；0：未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;



/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) NOT NULL COMMENT '角色名称',
  `sign_level` varchar(64) DEFAULT NULL COMMENT '授权级别（ASSET_APPROVE_LEVEL1：资产一审，ASSET_APPROVE_LEVEL2：资产二审）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(128) DEFAULT NULL COMMENT '创建人',
  `modify_by` varchar(128) DEFAULT NULL COMMENT '修改人',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注',
  `delete_flag` tinyint(1) DEFAULT '0' COMMENT '删除标识：1：已删除；0：未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;


/*Table structure for table `role_power` */

DROP TABLE IF EXISTS `role_power`;

CREATE TABLE `role_power` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(128) DEFAULT NULL COMMENT '创建人',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modify_by` varchar(128) DEFAULT NULL COMMENT '修改人',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `power_id` int(11) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3304 DEFAULT CHARSET=utf8;



/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(128) DEFAULT NULL COMMENT '创建人',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modify_by` varchar(128) DEFAULT NULL COMMENT '修改人',
  `name` varchar(128) NOT NULL COMMENT '用户名',
  `password` varchar(128) NOT NULL COMMENT '登录密码',
  `email` varchar(64) NOT NULL COMMENT '公司邮箱',
  `mobile` varchar(16) DEFAULT NULL COMMENT '手机号',
  `real_name` varchar(64) DEFAULT NULL COMMENT '真实姓名',
  `delete_flag` tinyint(1) DEFAULT '0' COMMENT '删除状态：1：已删除；0：未删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;



/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int(11) NOT NULL COMMENT '用户Id',
  `role_id` int(11) NOT NULL COMMENT '角色Id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(128) DEFAULT NULL COMMENT '创建人',
  `modify_by` varchar(128) DEFAULT NULL COMMENT '修改人',
  `modify_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
