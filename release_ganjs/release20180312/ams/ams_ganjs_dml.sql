
-- ----------------------------
-- Records of ams_exchange
-- ----------------------------
INSERT INTO `ams_exchange` (`exchange_code`, `exchange_name`, `cert_type`, `cert_no`, `province`, `registered_capital`, `introduction`, `exchange_rate`)
VALUES ('GanJS', '江西赣南金融资产交易中心有限责任公司', '2', '9136070039970296XL', '江西省', '5000.0000', NULL, '0.00300000');

-- ----------------------------
-- Records of ams_finance_subject
-- ----------------------------
INSERT INTO `ams_finance_subject` (`subject_code`, `subject_name`, `subject_show_name`, `cert_type`, `cert_no`, `cert_no_show_name`, `registered_capital`, `subject_address`, `subject_address_show_name`, `legal_person_name`, `legal_person_cert_no`, `business_scope`, `tel`, `email`, `introduction`, `member_id`, `status`) VALUES ('GZRZ', '广州融早资产管理有限公司', 'GZRZ资产管理有限公司', '2', '91440101MA59H0WG12', '', '1000.0000', '广州市南沙区丰泽东路（自编1号楼）X1301-C2050（仅限办公用途）(JM) ', '广州市', '朱兵龙', '33038219820204361X', '资产管理;投资咨询服务;企业管理咨询服务;投资管理服务等', '13432010848', '', '', '123456', NULL);
INSERT INTO `ams_finance_subject` (`subject_code`, `subject_name`, `subject_show_name`, `cert_type`, `cert_no`, `cert_no_show_name`, `registered_capital`, `subject_address`, `subject_address_show_name`, `legal_person_name`, `legal_person_cert_no`, `business_scope`, `tel`, `email`, `introduction`, `member_id`, `status`) VALUES ('GTBL', '国通商业保理（天津）有限公司', 'GTSY保理（天津）有限公司', '2', '91120118MA05K0334E', '', '5000.0000', '天津自贸区（东疆保税港区）洛阳道601号（海丰物流园7区2单元-641）', '天津自贸区', '方红美', '341021197801248384', '以受让应收账款的方式提供贸易融资；应收账款的收付结算、管理与催收；销售分户（分类）账管理；与本公司业务相关的非商业性坏账担保；客户资信调查与评估；相关咨询服务等', '15221830960', 'huiqian@zillionfortune.com', '公司致力于打造卓越的中小企业供应链金融服务平台，深入了解中小企业的需求，采用不断创新的供应链金融服务模式，为广大中小企业提供贸易融资、销售分户账管理、客户资信调查与评估、应收账款管理与催收、信用风险担保等服务。', '100002', NULL);
INSERT INTO `ams_finance_subject` (`subject_code`, `subject_name`, `subject_show_name`, `cert_type`, `cert_no`, `cert_no_show_name`, `registered_capital`, `subject_address`, `subject_address_show_name`, `legal_person_name`, `legal_person_cert_no`, `business_scope`, `tel`, `email`, `introduction`, `member_id`, `status`) VALUES ('SZZY', '深圳中赢商业保理有限公司', 'SZZY商业保理有限公司', '2', '9144030035979787XB', NULL, '5000.0000', '广东省', '深圳市***', '李荣珍', '411527198512174022', '创业投资业务;受托管理股权投资基金(不得从事证券投资活动,不得公开募集基金开展投资活动,不得从事公开募集基金管理业务);投资咨询(法律、行政法规、国务院决定禁止的项目除外,限制的项目须取得许可后方可经营);非融资性担保业务(财产保全担保、预付款担保;不得从事吸收存款、集资收款、受托贷款、发行票据、发放贷款等国家金融监管及财政信用业务。);从事保付代理(非银行融资类)(法律、行政法规、国务院决定禁止的项目除外,限制的项目须取得许可后方可经营)', '13967174573', '43406288@qq.com', '深圳中赢商业保理有限公司是一家针对中小企业融资需求，以风险控制为核心，围绕央企、国企、上市公司以及大型民企等核心企业的保理资产融资而组建的专业化金融服务平台。', '100001', NULL);
INSERT INTO `ams_finance_subject` (`subject_code`, `subject_name`, `subject_show_name`, `cert_type`, `cert_no`, `cert_no_show_name`, `registered_capital`, `subject_address`, `subject_address_show_name`, `legal_person_name`, `legal_person_cert_no`, `business_scope`, `tel`, `email`, `introduction`, `member_id`, `status`) VALUES ('QDQP', '青岛乾澎资产管理有限公司', 'QDQP资产管理有限公司', '2', '91370202MA3D39WN7N', NULL, '1000.0000', '山东省', '山东省***', '邹丽燕', '341002198512170029', '【以自有资金进行投资管理、资产管理,投资咨询(不含证券咨询)】(未经金融监管部门依法批准,不得从事向公众吸收存款、融资担保、代客理财等金融服务),企业管理咨询,企业营销策划。(依法须经批准的项目,经相关部门批准后方可开展经营活动)', '123456789', '123@qq.com', '公司成立于2017-01-04，属租赁和商服服务业。公司主营业务范围以自有资金进行投资管理、资产管理，投资咨询（不含证券咨询）企业管理咨询，企业营销策划。', NULL, NULL);

-- ----------------------------
-- Records of ams_global_config
-- ----------------------------
INSERT INTO `ams_global_config` VALUES ('1', 'approval_sign', 'asset_approval_sign', 'A', '资产审核授权等级', '2018-02-28 17:25:48', '2018-02-28 17:25:48');
INSERT INTO `ams_global_config` VALUES ('2', 'approval_sign', 'batch_asset_approval_sign', 'A,B', '资产审核授权等级', '2018-02-28 17:25:48', '2018-02-28 17:25:48');

-- ----------------------------
-- Records of ams_pool
-- ----------------------------
INSERT INTO `ams_pool` VALUES ('1', 'GanJS20180312', '赣金中心C端直销', '3', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', null, '1', null, 'GTBL', null, '', '', '83', '2018-02-28 22:52:24', 'SYS', '2018-02-28 17:47:52', 'SYS');

-- ----------------------------
-- Records of ams_trustee
-- ----------------------------
INSERT INTO `ams_trustee` VALUES ('1', 'HZXT', '杭州迅途资产管理有限公司', 'HZXT资产管理有限公司', '2', '91330110MA28L7MA35', '', '1000.0000', '杭州市余杭区临平街道望梅路588号15幢3单元401室-3', '杭州市', '王春燕', '341022197703101326', '投资管理、资产管理、实业投资、投资咨询；企业管理咨询，公共关系咨询，商务信息咨询，经济信息咨询；文化艺术交流活动的策划，企业营销策划，承办会展，会议服务。', '', null, '2018-02-28 17:25:48', 'SYS', '2018-02-28 17:25:48', 'SYS');
