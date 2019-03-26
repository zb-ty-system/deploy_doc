/**
*添加索引
 */

ALTER TABLE `ams_asset_issue_relation`  ADD  INDEX idx_asset_code (`asset_code`);
ALTER TABLE `ams_asset_issue_relation`  ADD  INDEX idx_batch_no (`batch_no`);


ALTER TABLE `ams_business_credit`  ADD  INDEX idx_batch_no (`batch_no`);


ALTER TABLE `ams_issue_plan`  ADD  INDEX idx_batch_no (`batch_no`);

ALTER TABLE `ams_file_template_param`  ADD  INDEX idx_template_code (`template_code`);
ALTER TABLE `ams_file_template_param`  ADD  INDEX idx_asset_code (`asset_code`);

ALTER TABLE `ams_asset_exchange_register`  ADD  INDEX idx_asset_code (`asset_code`);