ALTER TABLE `p2p_loan_request`
ADD UNIQUE INDEX `idx_loan_assertcode` (`asset_code`) USING BTREE ;