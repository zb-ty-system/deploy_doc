/*
Navicat MySQL Data Transfer

*/

/**
受托方新增字段
 */
alter table ams_trustee add status TINYINT(2);


/**
发行方新增字段
 */
alter table ams_finance_subject add status TINYINT(2);