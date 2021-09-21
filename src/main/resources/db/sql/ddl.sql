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