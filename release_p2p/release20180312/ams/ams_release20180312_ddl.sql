alter table ams_debt_right_info add COLUMN repay_status varchar(2) DEFAULT '0' COMMENT '还款状态:1-超时(逾期)，2-逾期已还款' after asset_status;

alter table ams_debt_right_info add COLUMN cash_status varchar(2) DEFAULT '1' COMMENT '兑付状态:1-兑付成功，2-兑付失败' after repay_status;