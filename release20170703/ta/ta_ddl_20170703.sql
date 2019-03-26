alter table ladder_product_asset add COLUMN(asset_type VARCHAR(8)  COMMENT '融资类型1:小贷收益权,2:应收账款收益权,3:定向融资工具');
alter table ladder_product add COLUMN(floating_yield_rate DECIMAL(12,8)  COMMENT '浮动收益率');
alter table ladder_product_ladder add COLUMN(poundage DECIMAL(12,8)  COMMENT '扣减手续费率');
alter table ladder_stage_income_plan add index idx_product_code (product_code);
alter table ladder_stage_income_plan add index idx__stage_date (stage_begin_date,stage_end_date);
alter table ladder_stage_income_plan add index idx_income_date (income_process_date) ;
