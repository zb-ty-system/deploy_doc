delete  from  ladder_error_log;
ALTER TABLE `ladder_error_log`
MODIFY COLUMN `error_message`  varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `error_method`,
MODIFY COLUMN `trace`  varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `error_message`;
