ALTER TABLE `trade_ladder`.`ladder_user_account`
  CHANGE `member_name` `member_name` VARCHAR(64) CHARSET utf8 COLLATE utf8_general_ci NULL  COMMENT '用户姓名';
ALTER TABLE `trade_ladder`.`ladder_invest_request`
  CHANGE `group_serial_no` `group_serial_no` VARCHAR(64) CHARSET utf8 COLLATE utf8_general_ci NULL;
