/**
* 修改ams_asset storage_status 默认值
 */
ALTER TABLE ams_asset MODIFY storage_status tinyint(2) DEFAULT '1' COMMENT '资产入库状态:1-已入库,2-未入库';

ALTER TABLE ams_asset MODIFY register_type tinyint(2) DEFAULT '1' COMMENT '注册类型：1-普通录入，2-备案录入';


/**
* 删除发行方错误数据 ams_finance_subject
 */
DELETE from ams_finance_subject where subject_code = 'TRA1700701';
DELETE from ams_finance_subject where subject_code = 'FS17070001';

/**
* 更新发行方数据
 */
UPDATE `ams_finance_subject` SET `subject_code`='GZRZ', `subject_name`='广州融早资产管理有限公司', `cert_type`='2', `cert_no`='91440101MA59H0WG12', `registered_capital`='1000.0000', `subject_address`='广州市南沙区丰泽东路（自编1号楼）X1301-C2050（仅限办公用途）(JM) ', `legal_person_name`='朱兵龙', `legal_person_cert_no`='33038219820204361X', `business_scope`='资产管理;投资咨询服务;企业管理咨询服务;投资管理服务等', `tel`='13432010848', `email`='', `introduction`='' WHERE (`subject_code`='GZRZ');

UPDATE `ams_finance_subject` SET `subject_code`='GTBL', `subject_name`='国通商业保理（天津）有限公司', `cert_type`='2', `cert_no`='91120118MA05K0334E', `registered_capital`='5000.0000', `subject_address`='天津自贸区（东疆保税港区）洛阳道601号（海丰物流园7区2单元-641）', `legal_person_name`='方红美', `legal_person_cert_no`='341021197801248384', `business_scope`='以受让应收账款的方式提供贸易融资；应收账款的收付结算、管理与催收；销售分户（分类）账管理；与本公司业务相关的非商业性坏账担保；客户资信调查与评估；相关咨询服务等', `tel`='15221830960', `email`='huiqian@zillionfortune.com', `introduction`='公司致力于打造卓越的中小企业供应链金融服务平台，深入了解中小企业的需求，采用不断创新的供应链金融服务模式，为广大中小企业提供贸易融资、销售分户账管理、客户资信调查与评估、应收账款管理与催收、信用风险担保等服务。”' WHERE (`subject_code`='GTBL');

UPDATE `ams_finance_subject` SET `subject_code`='ZS', `subject_name`='资顺（三亚）小额贷款有限公司', `cert_type`='2', `cert_no`='91460200MA5RC4XN5Q', `registered_capital`='10000.0000', `subject_address`='海南省三亚市海棠湾镇龙海起步区内C3-11房', `legal_person_name`='方艳萍', `legal_person_cert_no`='342724196912131529', `business_scope`='专营小额贷款业务', `tel`='13564473683', `email`='13564473683@163.com', `introduction`='公司秉持“小额、分散”的原则，向个人和微型企业提供信贷服务，加强信贷产品创新，如联保贷款、收益抵押贷款、小额授信贷款等以及不同期限、不同付息方式的信贷产品，不断创新信贷经营管理模式，切实加强贷款管理，形成拥有自己贷款特色的核心竞争力。' WHERE (`subject_code`='ZS');

UPDATE `ams_finance_subject` SET `subject_code`='HZXT', `subject_name`='杭州迅途资产管理有限公司', `cert_type`='2', `cert_no`='91330110MA28L7MA35', `registered_capital`='1000.0000', `subject_address`='杭州市余杭区临平街道望梅路588号15幢3单元401室-3', `legal_person_name`='王春燕', `legal_person_cert_no`='341022197703101326', `business_scope`='投资管理、资产管理、实业投资、投资咨询；企业管理咨询，公共关系咨询，商务信息咨询，经济信息咨询；文化艺术交流活动的策划，企业营销策划，承办会展，会议服务。', `tel`='', `email`='',
`introduction`='' WHERE (`subject_code`='HZXT');
