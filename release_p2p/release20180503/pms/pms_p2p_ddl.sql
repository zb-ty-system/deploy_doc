CREATE DATABASE /*!32312 IF NOT EXISTS*/`pms` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `pms`;

/*Table structure for table `pms_product_create_plan` */

DROP TABLE IF EXISTS `pms_product_create_plan`;

CREATE TABLE `pms_product_create_plan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `product_code` varchar(32) DEFAULT NULL COMMENT '产品编码',
  `product_line_code` varchar(32) DEFAULT NULL COMMENT '产品线编码',
  `count_stock_time` varchar(22) DEFAULT NULL COMMENT '预计计算库存时间（格式：yyyy-MM-dd HH:mm:ss）',
  `real_count_stock_time` varchar(22) DEFAULT NULL COMMENT '实际计算库存时间（格式：yyyy-MM-dd HH:mm:ss）',
  `open_product_time` varchar(22) DEFAULT NULL COMMENT '预计开放产品时间（格式：yyyy-MM-dd HH:mm:ss）',
  `real_open_product_time` varchar(22) DEFAULT NULL COMMENT '实际开放产品时间（格式：yyyy-MM-dd HH:mm:ss）',
  `plan_time` varchar(10) DEFAULT NULL COMMENT '计划日期，指是哪一天的(YYYY-MM-DD)',
  `count_stock_status` varchar(16) DEFAULT NULL COMMENT '计算库存状态(INIT:初始化, SUCCESS:成功，FAIL:失败)',
  `open_product_status` varchar(16) DEFAULT NULL COMMENT '开放产品状态(INIT:初始化, SUCCESS:成功，FAIL:失败)',
  `total_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '库存金额',
  `open_type` varchar(16) DEFAULT NULL COMMENT '开放类型(IN:对内, OUT:对外)',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_product_code` (`product_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='产品生成计划信息表';