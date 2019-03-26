CREATE DATABASE /*!32312 IF NOT EXISTS*/`pms` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `pms`;

/*Table structure for table `pms_global_config` */

DROP TABLE IF EXISTS `pms_global_config`;

CREATE TABLE `pms_global_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `group_name_desc` varchar(255) DEFAULT NULL COMMENT '分类名称描述',
  `property_name` varchar(255) DEFAULT NULL COMMENT '属性名称',
  `property_value` varchar(255) DEFAULT NULL COMMENT '属性值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='产品系统配置表';

/*Data for the table `pms_global_config` */

insert  into `pms_global_config`(`id`,`group_name`,`group_name_desc`,`property_name`,`property_value`) values (1,'product_approval_sign','产品审核授权信息配置','approval_require_sign','A');

/*Table structure for table `pms_product` */

DROP TABLE IF EXISTS `pms_product`;

CREATE TABLE `pms_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `product_code` varchar(32) DEFAULT NULL COMMENT '产品编码',
  `product_name` varchar(128) DEFAULT NULL COMMENT '产品名称',
  `product_display_name` varchar(128) DEFAULT NULL COMMENT '产品展示名称',
  `product_line_id` bigint(20) DEFAULT NULL COMMENT '所属产品线主键',
  `product_line_code` varchar(32) DEFAULT NULL COMMENT '产品线编号',
  `product_line_name` varchar(64) DEFAULT NULL COMMENT '产品线展示名称',
  `asset_pool_type` tinyint(2) DEFAULT NULL COMMENT '资产池类型(1:定向委托收益池 2:p2p实时放款 )',
  `asset_pool_code` varchar(32) DEFAULT NULL COMMENT '关联资产池编号',
  `asset_pool_name` varchar(128) DEFAULT NULL COMMENT '资产池名称',
  `pattern_code` varchar(8) DEFAULT NULL COMMENT '产品的类型代码(01:现金管理, 02:定期类, 03:净值型,04:阶梯收益)',
  `sale_channel_code` varchar(16) DEFAULT NULL COMMENT '销售渠道代码(TXS:唐小僧, YW:摇旺, QYLC:企业理财, ZD:资鼎，QJS:侨金所，GAN:赣金所)',
  `join_channel_code` varchar(32) DEFAULT NULL COMMENT '接入渠道(01:资邦阶梯, 02:资邦定期)',
  `pay_channel_code` varchar(16) DEFAULT 'GAN' COMMENT '支付渠道（GAN:赣金所宝付）',
  `total_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '产品总规模',
  `reservation_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '预订金额(线下机构预订金额)',
  `sale_status` tinyint(2) DEFAULT NULL COMMENT '产品销售状态(10:待部署, 11:已部署，12:上线, 13:下线, 14:归档)',
  `collect_status` tinyint(2) DEFAULT NULL COMMENT '产品募集状态(10:待募集，11:募集期，12:待成立，13:已成立，14:存续期，15:到期，16:待兑付，17:兑付完成, 18:流标, 19:兑付中, 20:兑付逾期, 21:兑付失败)',
  `display_status` tinyint(2) DEFAULT '2' COMMENT '显示状态(1:显示,2:不显示)',
  `risk_level` varchar(8) DEFAULT NULL COMMENT '产品风险等级(1-5)',
  `fund_settle_party` varchar(64) DEFAULT NULL COMMENT '资金结算方',
  `is_open_hmt` tinyint(2) DEFAULT '0' COMMENT '是否对港澳台客户开放',
  `calendar_mode` tinyint(2) DEFAULT NULL COMMENT '日历模式(10:自然日)',
  `introduction` longtext COMMENT '产品介绍',
  `approval_require_sign` varchar(32) DEFAULT NULL COMMENT '审核需要签名',
  `approval_sign` varchar(32) DEFAULT NULL COMMENT '已审核签名',
  `approval_status` tinyint(2) DEFAULT NULL COMMENT '审核状态(10:待审核, 20:已审核, 30:审核未通过)',
  `last_approval_time` timestamp NULL DEFAULT NULL COMMENT '最终审核时间',
  `archive_time` timestamp NULL DEFAULT NULL COMMENT '归档时间',
  `sync_status` tinyint(2) DEFAULT '0' COMMENT '同步状态(0:未同步,1:已同步)',
  `product_specification_url` varchar(256) DEFAULT '' COMMENT '产品说明书URL',
  `is_transfer` tinyint(2) DEFAULT '0' COMMENT '产品是否可转让标识（0:不可转让、1:可转让）',
  `is_reinvest` tinyint(2) DEFAULT '0' COMMENT '产品是否支持复投（0:不支持，1:支持）',
  `reinvest_type` tinyint(2) DEFAULT '0' COMMENT '复投类型(0:默认值（不支持复投的情况）, 1:多次复投-预留, 2:首次复投-不预留)',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_product_code` (`product_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=430 DEFAULT CHARSET=utf8 COMMENT='产品主信息表';

/*Table structure for table `pms_product_approval` */

DROP TABLE IF EXISTS `pms_product_approval`;

CREATE TABLE `pms_product_approval` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品主键',
  `product_code` varchar(32) DEFAULT NULL COMMENT '产品编码',
  `sign` varchar(8) DEFAULT NULL COMMENT '授权级别',
  `approval_status` tinyint(2) DEFAULT NULL COMMENT '审核状态:10:提交审核, 20:审核通过，30:审核未通过',
  `approval_suggestion` varchar(256) DEFAULT NULL COMMENT '审核意见',
  `approval_by` varchar(32) DEFAULT NULL COMMENT '审核者',
  `approval_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '审核时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_product_id` (`product_id`) USING BTREE,
  KEY `idx_product_code` (`product_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=525 DEFAULT CHARSET=utf8 COMMENT='产品审核信息表';

/*Table structure for table `pms_product_contract` */

DROP TABLE IF EXISTS `pms_product_contract`;

CREATE TABLE `pms_product_contract` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品主键',
  `product_code` varchar(32) DEFAULT NULL COMMENT '产品编码',
  `contract_type` tinyint(4) DEFAULT NULL COMMENT '合同类型',
  `contract_name` varchar(128) DEFAULT NULL COMMENT '合同名称',
  `contract_display_name` varchar(128) DEFAULT NULL COMMENT '合同展示名称',
  `contract_file_url` varchar(256) DEFAULT NULL COMMENT '合同文件路径',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_product_id` (`product_id`) USING BTREE,
  KEY `idx_product_code` (`product_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=347 DEFAULT CHARSET=utf8 COMMENT='产品合同信息表';

/*Table structure for table `pms_product_ladder` */

DROP TABLE IF EXISTS `pms_product_ladder`;

CREATE TABLE `pms_product_ladder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品主键',
  `product_code` varchar(32) DEFAULT NULL COMMENT '产品编码',
  `invest_period` int(11) DEFAULT '0' COMMENT '投资期限(天)',
  `invest_period_loop_unit` int(11) DEFAULT '0' COMMENT '投资循环周期',
  `invest_period_loop_count` int(11) DEFAULT '0' COMMENT '投资总循环次数',
  `invest_period_loop_index` int(11) DEFAULT '0' COMMENT '当前循环轮次',
  `yield_rate` decimal(12,8) DEFAULT '0.00000000' COMMENT '当前轮次利率',
  `poundage` decimal(12,8) DEFAULT '0.00000000' COMMENT '手续费率',
  `value_start_time` timestamp NULL DEFAULT NULL COMMENT '阶段起息时间',
  `value_end_time` timestamp NULL DEFAULT NULL COMMENT '阶段止息时间',
  `next_redeem_time` timestamp NULL DEFAULT NULL COMMENT '下一开放赎回时间',
  `next_repay_time` timestamp NULL DEFAULT NULL COMMENT '下一回款时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_product_id` (`product_id`) USING BTREE,
  KEY `idx_product_code` (`product_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=446 DEFAULT CHARSET=utf8 COMMENT='产品阶梯信息表';

/*Table structure for table `pms_product_line` */

DROP TABLE IF EXISTS `pms_product_line`;

CREATE TABLE `pms_product_line` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `line_code` varchar(32) DEFAULT NULL COMMENT '产品线编码',
  `line_name` varchar(64) DEFAULT NULL COMMENT '产品线名称',
  `line_display_name` varchar(64) DEFAULT NULL COMMENT '产品线展示名称',
  `pattern_code` varchar(8) DEFAULT NULL COMMENT '产品线形态代码(01:现金管理,02:定期类,03:净值型,04:N日阶梯收益)',
  `status` tinyint(2) DEFAULT '1' COMMENT '产品线状态(1:正常,2:注销)',
  `display_status` tinyint(2) DEFAULT '1' COMMENT '产品线显示状态(1:显示,2:不显示)',
  `sale_channel_code` varchar(16) DEFAULT NULL COMMENT '销售渠道代码',
  `risk_level` varchar(8) DEFAULT NULL COMMENT '风险等级(1-5)',
  `description` varchar(256) DEFAULT NULL COMMENT '产品线描述',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后修改者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_id` (`id`) USING BTREE,
  UNIQUE KEY `idx_line_code` (`line_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='产品线信息表';

/*Table structure for table `pms_product_period` */

DROP TABLE IF EXISTS `pms_product_period`;

CREATE TABLE `pms_product_period` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品主键',
  `product_code` varchar(32) DEFAULT NULL COMMENT '产品编码',
  `expect_online_time` timestamp NULL DEFAULT NULL COMMENT '预期上线时间',
  `online_time` timestamp NULL DEFAULT NULL COMMENT '实际上线时间',
  `expect_offline_time` timestamp NULL DEFAULT NULL COMMENT '预期下线时间',
  `offline_time` timestamp NULL DEFAULT NULL COMMENT '实际下线时间',
  `sale_start_time` timestamp NULL DEFAULT NULL COMMENT '募集起始时间',
  `sale_end_time` timestamp NULL DEFAULT NULL COMMENT '募集截止时间',
  `sale_out_time` timestamp NULL DEFAULT NULL COMMENT '实际募集完成时间',
  `expect_establish_time` timestamp NULL DEFAULT NULL COMMENT '预期成立时间',
  `establish_time` timestamp NULL DEFAULT NULL COMMENT '实际成立时间',
  `value_time` timestamp NULL DEFAULT NULL COMMENT '起息时间',
  `expect_expire_time` timestamp NULL DEFAULT NULL COMMENT '预期到期日期',
  `expire_time` timestamp NULL DEFAULT NULL COMMENT '实际到期时间',
  `expect_clear_time` timestamp NULL DEFAULT NULL COMMENT '预期结清时间',
  `clear_time` timestamp NULL DEFAULT NULL COMMENT '实际结清时间',
  `invest_period` int(11) DEFAULT NULL COMMENT '投资期限',
  `invest_period_unit` tinyint(2) DEFAULT '1' COMMENT '资产期限单位(1:天 2：周 3：月 4:年)',
  `invest_period_description` varchar(64) DEFAULT NULL COMMENT '投资期限描述,如3个月期',
  `invest_period_loop_unit` int(11) DEFAULT '0' COMMENT '投资循环周期',
  `invest_period_loop_count` int(11) DEFAULT '0' COMMENT '投资总循环次数',
  `invest_period_loop_index` int(11) DEFAULT '0' COMMENT '当前循环轮次',
  `next_redeem_time` timestamp NULL DEFAULT NULL COMMENT '下一开放赎回时间',
  `next_repay_time` timestamp NULL DEFAULT NULL COMMENT '下一回款时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_product_id` (`product_id`) USING BTREE,
  KEY `idx_product_code` (`product_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=360 DEFAULT CHARSET=utf8 COMMENT='产品期限信息表';

/*Table structure for table `pms_product_profit` */

DROP TABLE IF EXISTS `pms_product_profit`;

CREATE TABLE `pms_product_profit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品主键',
  `product_code` varchar(32) DEFAULT NULL COMMENT '产品编码',
  `min_invest_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '起投金额',
  `single_max_invest_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '单笔投资限额',
  `max_invest_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '个人最大投资限额',
  `min_hold_amount` decimal(16,4) DEFAULT NULL COMMENT '最低可持有金额',
  `increase_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '递增金额(步长)',
  `basic_interests_period` int(8) DEFAULT '365' COMMENT '年基础计息周期(360, 365, 366三种枚举值)',
  `establish_condition` varchar(256) DEFAULT NULL COMMENT '产品成立条件',
  `unit` tinyint(2) DEFAULT '2' COMMENT '计量单位(1:份额, 2:人民币元)',
  `profit_type` tinyint(2) DEFAULT '2' COMMENT '收益方式:1:T+N,2:固定起息日',
  `calculate_invest_type` tinyint(2) DEFAULT '1' COMMENT '计息方式:1:一次性还本付息；2:按季付息 到期还本；3:按月付息，到期还本；4:等额本息',
  `min_yield_rate` decimal(12,8) DEFAULT '0.00000000' COMMENT '最低预期收益率',
  `max_yield_rate` decimal(12,8) DEFAULT '0.00000000' COMMENT '最高预期收益率',
  `current_yield_rate` decimal(12,8) DEFAULT '0.00000000' COMMENT '当期利率',
  `add_yield_rate` decimal(12,8) DEFAULT '0.00000000' COMMENT '加息利率',
  `floating_yield_rate` decimal(12,8) DEFAULT '0.00000000' COMMENT '浮动利率',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_product_id` (`product_id`) USING BTREE,
  KEY `idx_product_code` (`product_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=337 DEFAULT CHARSET=utf8 COMMENT='产品投资收益信息表';

/*Table structure for table `pms_product_stock` */

DROP TABLE IF EXISTS `pms_product_stock`;

CREATE TABLE `pms_product_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品主键',
  `product_code` varchar(32) DEFAULT NULL COMMENT '产品编码',
  `frozen_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '产品冻结金额(下单未确认金额)',
  `sale_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '已售金额',
  `stock_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '剩余库存金额(未售金额)',
  `redeem_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '已赎回金额',
  `version` int(11) DEFAULT '0' COMMENT '库存版本号(乐观锁)',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_product_id` (`product_id`) USING BTREE,
  KEY `idx_product_code` (`product_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=429 DEFAULT CHARSET=utf8 COMMENT='产品库存信息表';

/*Table structure for table `pms_product_stock_change_flow` */

DROP TABLE IF EXISTS `pms_product_stock_change_flow`;

CREATE TABLE `pms_product_stock_change_flow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品主键',
  `product_code` varchar(32) DEFAULT NULL COMMENT '产品编码',
  `ref_no` varchar(64) DEFAULT NULL COMMENT '外部编号(订单号)',
  `change_type` tinyint(2) DEFAULT NULL COMMENT '影响类型(1:冻结,2:占用,3:释放,4:赎回)',
  `change_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '影响金额',
  `frozen_amount_before` decimal(16,4) DEFAULT '0.0000' COMMENT '变化前冻结金额',
  `frozen_amount_after` decimal(16,4) DEFAULT '0.0000' COMMENT '变化后冻结金额',
  `sale_amount_before` decimal(16,4) DEFAULT '0.0000' COMMENT '变化前已售金额',
  `sale_amount_after` decimal(16,4) DEFAULT '0.0000' COMMENT '变化后已售金额',
  `stock_amount_before` decimal(16,4) DEFAULT '0.0000' COMMENT '变化前库存金额',
  `stock_amount_after` decimal(16,4) DEFAULT '0.0000' COMMENT '变化后库存金额',
  `redeem_amount_before` decimal(16,4) DEFAULT '0.0000' COMMENT '变化前已赎回金额',
  `redeem_amount_after` decimal(16,4) DEFAULT '0.0000' COMMENT '变化后已赎回金额',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_product_id` (`product_id`) USING BTREE,
  KEY `idx_product_code` (`product_code`) USING BTREE,
  KEY `idx_ref_no` (`ref_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12369 DEFAULT CHARSET=utf8 COMMENT='产品库存变更流水表';

/*Table structure for table `pms_product_stock_change_req` */

DROP TABLE IF EXISTS `pms_product_stock_change_req`;

CREATE TABLE `pms_product_stock_change_req` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `product_code` varchar(32) DEFAULT NULL COMMENT '产品编码',
  `change_type` tinyint(2) DEFAULT NULL COMMENT '更变类型(1:冻结,2:占用,3:释放, 4:赎回, 5:取消)',
  `ref_no` varchar(64) DEFAULT NULL COMMENT '外部编号',
  `change_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '变更金额',
  `status` tinyint(2) DEFAULT '1' COMMENT '变更状态(1:处理中,2:处理成功,3:库存不足,4:处理失败)',
  `memo` varchar(256) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_type_and_no` (`change_type`,`ref_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12583 DEFAULT CHARSET=utf8 COMMENT='产品库存变更请求表';

/*Table structure for table `pms_product_transfer` */

DROP TABLE IF EXISTS `pms_product_transfer`;

CREATE TABLE `pms_product_transfer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品主键',
  `product_code` varchar(32) DEFAULT NULL COMMENT '产品编码',
  `entrust_transfer_time` int(11) DEFAULT '0' COMMENT '委托转让有效时间（单位：天）',
  `lock_time` int(11) DEFAULT '0' COMMENT '转让锁定期（单位：天）',
  `procedure_fee_percent` decimal(12,8) DEFAULT '0.00000000' COMMENT '手续费百分比',
  `low_principal_percent` decimal(12,8) DEFAULT '0.00000000' COMMENT '低限本金百分比',
  `low_interest_percent` decimal(12,8) DEFAULT '0.00000000' COMMENT '低限已产生利息百分比',
  `low_input_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '低限输入金额',
  `high_principal_percent` decimal(12,8) DEFAULT '0.00000000' COMMENT '高限本金百分比',
  `high_interest_percent` decimal(12,8) DEFAULT '0.00000000' COMMENT '高限已产生利息百分比',
  `high_input_amount` decimal(16,4) DEFAULT '0.0000' COMMENT '高限输入金额',
  `low_transfer_yield_rate` decimal(12,8) DEFAULT '0.00000000' COMMENT '转让后收益率下限',
  `high_transfer_yield_rate` decimal(12,8) DEFAULT '0.00000000' COMMENT '转让后收益率上限',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建者',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '最后更新者',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_id` (`id`) USING BTREE,
  KEY `idx_product_id` (`product_id`) USING BTREE,
  KEY `idx_product_code` (`product_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8 COMMENT='产品转让信息表';

/*Table structure for table `pms_sequence` */

DROP TABLE IF EXISTS `pms_sequence`;

CREATE TABLE `pms_sequence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `sequence_name` varchar(32) DEFAULT NULL COMMENT '序列名称',
  `current_val` bigint(20) DEFAULT '0' COMMENT '当前值',
  `sequence_step` int(11) DEFAULT '1' COMMENT '步长',
  `version` bigint(20) DEFAULT '0' COMMENT '乐观锁',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_id` (`id`) USING BTREE,
  UNIQUE KEY `idx_seq_name` (`sequence_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='产品序列信息表';
