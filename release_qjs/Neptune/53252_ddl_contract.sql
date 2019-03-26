
ALTER TABLE `contract`
MODIFY COLUMN `asset_register_name`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品展示名称' AFTER `issuer_tel`;
