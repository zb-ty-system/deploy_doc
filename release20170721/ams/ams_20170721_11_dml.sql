
 /**
 * 去掉ams_asset索引
 */
 ALTER TABLE `ams_asset` DROP INDEX `idx_id`;

 /**
 * 去掉ams_asset_approval索引
 */
 ALTER TABLE `ams_asset_approval` DROP INDEX `idx_id`;

   /**
 * 去掉ams_asset_pool_relation索引
 */
 ALTER TABLE `ams_asset_pool_relation` DROP INDEX `idx_id`;

/**
 * 去掉ams_asset_product_relation索引
 */
 ALTER TABLE `ams_asset_product_relation` DROP INDEX `idx_id`;

 /**
 * 去掉ams_consignee索引
 */
 ALTER TABLE `ams_consignee` DROP INDEX `idx_id`;

  /**
 * 去掉ams_exchange索引
 */
 ALTER TABLE `ams_exchange` DROP INDEX `idx_id`;

 /**
 * 去掉ams_finance_subject索引
 */
 ALTER TABLE `ams_finance_subject` DROP INDEX `idx_id`;

  /**
 * 去掉ams_global_config索引
 */
 ALTER TABLE `ams_global_config` DROP INDEX `idx_id`;

  /**
 * 去掉ams_sequence索引
 */
 ALTER TABLE `ams_sequence` DROP INDEX `idx_id`;

  /**
 * 去掉ams_trustee索引
 */
 ALTER TABLE `ams_trustee` DROP INDEX `idx_id`;

