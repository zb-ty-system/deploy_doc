DROP TABLE IF EXISTS `ladder_error_log`;

CREATE TABLE `ladder_error_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `request_param` longtext,
  `error_time` datetime DEFAULT NULL,
  `error_method` varchar(64) DEFAULT NULL,
  `error_message` longtext,
  `trace` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8;
