delete  from  ladder_batch;
ALTER TABLE `ta_ladder`.`ladder_batch`
  CHANGE `file_name` `file_name` VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci NULL   COMMENT '文件名',
  ADD  UNIQUE INDEX `fileName_index` (`file_name`),
  ADD  UNIQUE INDEX `batchNo_index` (`batch_no`);