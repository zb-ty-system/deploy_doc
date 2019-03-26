
USE `ams`;

/**
* 全局变量表
*/
INSERT INTO `ams_global_config` (`group_name`, `property_name`, `property_value`, `property_desc`) VALUES ('approval_sign', 'asset_approval_sign', 'A', '资产审核授权等级');
INSERT INTO `ams_global_config` (`group_name`, `property_name`, `property_value`, `property_desc`) VALUES ('approval_sign', 'batch_asset_approval_sign', 'A,B', '资产审核授权等级');

/**
* 受托方
*/
INSERT INTO `ams_trustee` (`trustee_code`, `trustee_name`, `trustee_show_name`, `cert_type`, `cert_no`, `cert_no_show_name`, `registered_capital`, `trustee_address`, `trustee_address_show_name`, `legal_person_name`, `legal_person_cert_no`, `business_scope`, `introduction`, `status`, `create_by`,`modify_by`) VALUES ('HZXT', '杭州迅途资产管理有限公司', 'HZXT资产管理有限公司', '2', '91330110MA28L7MA35', '', '1000.0000', '杭州市余杭区临平街道望梅路588号15幢3单元401室-3', '杭州市', '王春燕', '341022197703101326', '投资管理、资产管理、实业投资、投资咨询；企业管理咨询，公共关系咨询，商务信息咨询，经济信息咨询；文化艺术交流活动的策划，企业营销策划，承办会展，会议服务。', '', NULL, 'SYS', 'SYS');

/**
* 融资方
*/
INSERT INTO `ams_finance_subject` (`subject_code`, `subject_name`, `subject_show_name`, `cert_type`, `cert_no`, `cert_no_show_name`, `registered_capital`, `subject_address`, `subject_address_show_name`, `legal_person_name`, `legal_person_cert_no`, `business_scope`, `tel`, `email`, `introduction`, `member_id`, `status`, `create_by`,`modify_by`) VALUES ('GZRZ', '广州融早资产管理有限公司', 'GZRZ资产管理有限公司', '2', '91440101MA59H0WG12', NULL, '1000.0000', '广州市南沙区丰泽东路（自编1号楼）X1301-C2050（仅限办公用途）(JM) ', '广州市', '朱兵龙', '33038219820204361X', '资产管理;投资咨询服务;企业管理咨询服务;投资管理服务等', '13432010848', '', NULL, '123456', NULL,'SYS','SYS');
INSERT INTO `ams_finance_subject` (`subject_code`, `subject_name`, `subject_show_name`, `cert_type`, `cert_no`, `cert_no_show_name`, `registered_capital`, `subject_address`, `subject_address_show_name`, `legal_person_name`, `legal_person_cert_no`, `business_scope`, `tel`, `email`, `introduction`, `member_id`, `status`,`create_by`,`modify_by`) VALUES ('GTBL', '国通商业保理（天津）有限公司', 'GTSY保理（天津）有限公司', '2', '91120118MA05K0334E', '', '5000.0000', '天津自贸区（东疆保税港区）洛阳道601号（海丰物流园7区2单元-641）', '天津自贸区', '方红美', '341021197801248384', '以受让应收账款的方式提供贸易融资；应收账款的收付结算、管理与催收；销售分户（分类）账管理；与本公司业务相关的非商业性坏账担保；客户资信调查与评估；相关咨询服务等', '15221830960', 'huiqian@zillionfortune.com', '公司致力于打造卓越的中小企业供应链金融服务平台，深入了解中小企业的需求，采用不断创新的供应链金融服务模式，为广大中小企业提供贸易融资、销售分户账管理、客户资信调查与评估、应收账款管理与催收、信用风险担保等服务。”', '123456', NULL,'SYS','SYS');
INSERT INTO `ams_finance_subject` (`subject_code`, `subject_name`, `subject_show_name`, `cert_type`, `cert_no`, `cert_no_show_name`, `registered_capital`, `subject_address`, `subject_address_show_name`, `legal_person_name`, `legal_person_cert_no`, `business_scope`, `tel`, `email`, `introduction`, `member_id`, `status`,`create_by`,`modify_by`) VALUES ('ZS', '资顺（三亚）小额贷款有限公司', 'ZSSY小额贷款有限公司', '2', '91460200MA5RC4XN5Q', '', '10000.0000', '海南省三亚市海棠湾镇龙海起步区内C3-11房', '海南省三亚市', '方艳萍', '342724196912131529', '专营小额贷款业务', '13564473683', '13564473683@163.com', '公司秉持“小额、分散”的原则，向个人和微型企业提供信贷服务，加强信贷产品创新，如联保贷款、收益抵押贷款、小额授信贷款等以及不同期限、不同付息方式的信贷产品，不断创新信贷经营管理模式，切实加强贷款管理，形成拥有自己贷款特色的核心竞争力。', '123456', NULL,'SYS','SYS');
INSERT INTO `ams_finance_subject` (`subject_code`, `subject_name`, `subject_show_name`, `cert_type`, `cert_no`, `cert_no_show_name`, `registered_capital`, `subject_address`, `subject_address_show_name`, `legal_person_name`, `legal_person_cert_no`, `business_scope`, `tel`, `email`, `introduction`, `member_id`, `status`,`create_by`,`modify_by`) VALUES ('HZXT', '杭州迅途资产管理有限公司', 'HZXT资产管理有限公司', '2', '91330110MA28L7MA35', '', '1000.0000', '杭州市余杭区临平街道望梅路588号15幢3单元401室-3', '杭州市', '王春燕', '341022197703101326', '投资管理、资产管理、实业投资、投资咨询；企业管理咨询，公共关系咨询，商务信息咨询，经济信息咨询；文化艺术交流活动的策划，企业营销策划，承办会展，会议服务。', '', '', '', '123456', NULL,'SYS','SYS');

/**
* 交易所
*/
INSERT INTO `ams_exchange` (`exchange_code`, `exchange_name`, `cert_type`, `cert_no`, `province`, `registered_capital`, `introduction`, `exchange_rate`,`create_by`,`modify_by`) VALUES ('SZQH', '深圳前海金融资产交易所有限公司', '2', NULL, NULL, '0.0000', NULL, '0.00300000', NULL,'SYS');
INSERT INTO `ams_exchange` (`exchange_code`, `exchange_name`, `cert_type`, `cert_no`, `province`, `registered_capital`, `introduction`, `exchange_rate`,`create_by`,`modify_by`) VALUES ('QJS', '广东华侨金融资产交易中心', '2', NULL, NULL, '0.0000', NULL, '0.00300000',NULL,'SYS');

/**
* 资产池
*/
INSERT INTO `ams_pool` (`pool_code`, `pool_name`, `pool_type`, `limit_amount`, `total_amount`, `stock_amount`, `frozen_amount`, `sale_amount`, `status`, `load_switch_status`, `finance_subject_id`, `finance_subject_code`, `trustee_id`, `trustee_code`, `pool_desc`, `create_by`, `modify_by`)
VALUES ('QJS20171013', '侨金所C端直销', '3', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, '1', NULL, 'GTBL', NULL, '', '','SYS','SYS');
