use boss;
alter table `template`  add column `template_type` tinyint(2) NULL COMMENT '模板类型 1：产品注册模板 2：签章模板' after `id`;