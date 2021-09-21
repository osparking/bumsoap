CREATE TABLE `bumsoap` (
  `BSSN` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `bs_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '비누 통상 명칭',
  `ingridi_1` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '가장 중요한 성분 1 개',
  `fragrance` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descrip` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spec_func` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '특징-기능',
  `target` tinyint(4) DEFAULT 0 COMMENT '용도(0-인체, 1-식기, 2-세탁)',
  `mall_link` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '네이버 쇼핑 상품 링크',
  PRIMARY KEY (`BSSN`),
  CONSTRAINT `check_soap_target` CHECK (`target` in (0,1,2))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;