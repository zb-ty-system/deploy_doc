/*
Navicat MySQL Data Transfer

*/

/**
受托方新增字段
 */
alter table ams_trustee add trustee_show_name varchar(256);
alter table ams_trustee add cert_no_show_name varchar(256);


/**
发行方新增字段
 */
alter table ams_finance_subject add subject_show_name varchar(256);
alter table ams_finance_subject add cert_no_show_name varchar(256);