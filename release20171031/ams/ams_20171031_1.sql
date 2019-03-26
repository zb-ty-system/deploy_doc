/**
  修改字段ams_asset
 */
ALTER table ams_asset MODIFY register_type TINYINT(2) DEFAULT '1' COMMENT '注册类型：1-普通录入,2-备案录入,3-交易所录入,4-马上贷';