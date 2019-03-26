/**
* 添加字段 ams_debt_right_info
 */

alter table ams_debt_right_info add repayment_amount decimal(16,4) DEFAULT '0.0000' COMMENT '还款金额' after match_succ_amt;