CREATE DATABASE `bumsoap` 
/*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

CREATE USER 'bumee'@'%';
GRANT Alter ON bumsoap.* TO 'bumee'@'%';
GRANT Create ON bumsoap.* TO 'bumee'@'%';
GRANT Create view ON bumsoap.* TO 'bumee'@'%';
GRANT Delete ON bumsoap.* TO 'bumee'@'%';
GRANT Delete history ON bumsoap.* TO 'bumee'@'%';
GRANT Drop ON bumsoap.* TO 'bumee'@'%';
GRANT Grant option ON bumsoap.* TO 'bumee'@'%';
GRANT Index ON bumsoap.* TO 'bumee'@'%';
GRANT Insert ON bumsoap.* TO 'bumee'@'%';
GRANT References ON bumsoap.* TO 'bumee'@'%';
GRANT Select ON bumsoap.* TO 'bumee'@'%';
GRANT Show view ON bumsoap.* TO 'bumee'@'%';
GRANT Trigger ON bumsoap.* TO 'bumee'@'%';
GRANT Update ON bumsoap.* TO 'bumee'@'%';
GRANT Alter routine ON bumsoap.* TO 'bumee'@'%';
GRANT Create routine ON bumsoap.* TO 'bumee'@'%';
GRANT Execute ON bumsoap.* TO 'bumee'@'%';

ALTER USER 'bumee'@'%' IDENTIFIED BY '1234';

-- bumsoap.bumsoap definition
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

-- bumsoap.soap_pic definition
CREATE TABLE `soap_pic` (
  `PIC_SN` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '영상 일련번호',
  `BSSN` int(10) unsigned DEFAULT NULL COMMENT '비누번호-외래키',
  `PICTURE` mediumblob NOT NULL COMMENT '사진 영상 자체',
  `DP_ORDER` tinyint(4) NOT NULL DEFAULT 1 COMMENT '표시 순서',
  `EXT_NAME` char(4) CHARACTER SET ascii DEFAULT 'jpg' COMMENT '영상 파일 확장자 이름',
  `SHAPE` tinyint(4) DEFAULT 0 COMMENT '백설공주, 메주비누, 등',
  PRIMARY KEY (`PIC_SN`),
  KEY `soap_SN_FK` (`BSSN`),
  CONSTRAINT `soap_SN_FK` FOREIGN KEY (`BSSN`) REFERENCES `bumsoap` (`BSSN`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `soap_shape_check` CHECK (`SHAPE` in (0,1,2))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- bumsoap.soap_price definition
CREATE TABLE `soap_price` (
  `Price_SN` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `BSSN` int(10) unsigned NOT NULL,
  `SHAPE` tinyint(4) DEFAULT NULL COMMENT '백설공주 등',
  `PRICE` double DEFAULT NULL COMMENT '비누 가격',
  `INS_TIME` datetime DEFAULT current_timestamp() COMMENT '가격 삽입 일시',
  PRIMARY KEY (`Price_SN`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;