ALTER TABLE `p2p_account`
MODIFY COLUMN `interest_flag`  varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '收益计算标志,0:未生成,1:已生成' AFTER `cash_flag`,
MODIFY COLUMN `create_by`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'SYS' COMMENT '创建人' AFTER `modify_time`,
MODIFY COLUMN `modify_by`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'SYS' COMMENT '修改人' AFTER `create_by`;
