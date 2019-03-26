ALTER TABLE p2p_cash_record  ADD INDEX req_no_idx(`req_no`);
ALTER TABLE p2p_batch  ADD INDEX req_no_idx(`req_no`);
ALTER TABLE p2p_match_record  ADD INDEX asset_code_idx(`asset_code`);
ALTER TABLE p2p_account  ADD INDEX pCode_memId_idx(`product_code`,`member_id`);
ALTER TABLE p2p_interface_retry  ADD INDEX bizType_bizNo_idx(`business_type`,`business_no`);
ALTER TABLE p2p_loan_request  ADD INDEX loan_no_idx(`loan_no`);
ALTER TABLE p2p_order  ADD INDEX aCode_pCode_idx(`asset_code`,`product_code`);
ALTER TABLE p2p_reservation_order  ADD INDEX ext_reservation_no_idx(`ext_reservation_no`);