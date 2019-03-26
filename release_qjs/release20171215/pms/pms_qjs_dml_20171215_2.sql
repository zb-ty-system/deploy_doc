/**
  pms_product表修改字段【collect_status】的备注
 */
ALTER TABLE pms_product MODIFY COLUMN collect_status tinyint(2) COMMENT '产品募集状态(10:待募集，11:募集期，12:待成立，13:已成立，14:存续期，15:到期，16:待兑付，17:兑付完成, 18:流标, 19:兑付中, 20:兑付逾期, 21:兑付失败)'; 