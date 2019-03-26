DROP TABLE IF EXISTS `p2p_interface_retry`;

CREATE TABLE `p2p_interface_retry` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `business_no` varchar(64) DEFAULT NULL COMMENT '流水号,做幂等控制',
  `business_type` varchar(64) DEFAULT NULL COMMENT '业务类型（"ASSET_MATCH","资产匹配通知唐小僧"）',
  `request_param` longtext COMMENT '接口请求参数',
  `response_param` varchar(500) DEFAULT NULL COMMENT '接口响应参数',
  `status` varchar(32) DEFAULT 'INIT' COMMENT '处理状态：INIT(INIT:初始化),SUCCESS("SUCCESS","处理成功"), FAILURE("FAILURE","处理失败")',
  `retry_times` int(11) DEFAULT '0' COMMENT '重试次数',
  `memo` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_by` varchar(32) DEFAULT 'SYS' COMMENT '创建人',
  `modify_by` varchar(32) DEFAULT 'SYS' COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='接口请求重试表';

ALTER TABLE `p2p`.`p2p_loan_request`
   ADD COLUMN `loan_payment_status` VARCHAR(32) NULL   COMMENT '放款支付状态' AFTER `contract_status`;
 ALTER TABLE `p2p`.`p2p_reservation_order`
  ADD COLUMN `tel_no` VARCHAR(16) NULL   COMMENT '联系方式' AFTER `cert_no`;
