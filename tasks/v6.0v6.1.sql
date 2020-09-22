/*
 phpems v6.0 升级 v6.1

 Date: 20/09/2020 11:22:00
*/

SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `x2_certificate` ADD COLUMN `cedays` int NULL DEFAULT NULL AFTER `cetime`;

ALTER TABLE `x2_content` ADD COLUMN `contentview` int NOT NULL DEFAULT 0 AFTER `contenttext`;

ALTER TABLE `x2_content` DROP COLUMN `news_title`;

SET FOREIGN_KEY_CHECKS=1;
