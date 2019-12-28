/*
 phpems v5.0 升级 v6.0

 Date: 26/12/2019 22:18:00
*/

SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE `x2_basic` ADD COLUMN `basictop` int(1) NULL DEFAULT NULL AFTER `basicclosed`;

ALTER TABLE `x2_basic` ADD INDEX `basictop`(`basictop`) USING BTREE;

ALTER TABLE `x2_certificate` ADD COLUMN `cetext` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `cedescribe`;

ALTER TABLE `x2_content` ADD COLUMN `contentmodifier` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `contentusername`;

ALTER TABLE `x2_content` ADD COLUMN `contenttags` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `contenttitle`;

ALTER TABLE `x2_content` ADD COLUMN `contentkeywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `contenttags`;

ALTER TABLE `x2_content` ADD COLUMN `news_title` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `contenttext`;

ALTER TABLE `x2_content` ADD INDEX `contenttags`(`contenttags`) USING BTREE;

ALTER TABLE `x2_content` ADD FULLTEXT INDEX `contentkeywords`(`contentkeywords`);

ALTER TABLE `x2_coupon` ADD COLUMN `couponusername` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `couponendtime`;

ALTER TABLE `x2_coupon` ADD COLUMN `couponusetime` int(11) NULL DEFAULT NULL AFTER `couponusername`;

ALTER TABLE `x2_coupon` ADD INDEX `couponusername`(`couponusername`) USING BTREE;

ALTER TABLE `x2_coupon` ADD INDEX `couponusetime`(`couponusetime`) USING BTREE;

CREATE TABLE `x2_docfloder`  (
  `dfid` int(11) NOT NULL AUTO_INCREMENT,
  `dftitle` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dfcatid` int(11) NULL DEFAULT NULL,
  `dfthumb` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dftime` int(11) NOT NULL,
  `dfdecrbie` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`dfid`) USING BTREE,
  INDEX `dfcatid`(`dfcatid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;
/*
ALTER TABLE `x2_examhistory` MODIFY COLUMN `ehexamid` int(11) NOT NULL DEFAULT 0 AFTER `ehid`;
*/
ALTER TABLE `x2_exams` MODIFY COLUMN `examsubject` int(11) NOT NULL DEFAULT 0 AFTER `examid`;

ALTER TABLE `x2_exams` MODIFY COLUMN `examquestions` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `examsetting`;

ALTER TABLE `x2_examsession` ADD COLUMN `examsessiontoken` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `examsessiontimelist`;

ALTER TABLE `x2_examsession` MODIFY COLUMN `examsessionsetting` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `examsession`;

ALTER TABLE `x2_examsession` MODIFY COLUMN `examsessionsign` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `examsessionsetting`;

ALTER TABLE `x2_examsession` MODIFY COLUMN `examsessionuseranswer` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `examsessionquestion`;

ALTER TABLE `x2_examsession` MODIFY COLUMN `examsessionscorelist` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `examsessionscore`;

ALTER TABLE `x2_examsession` MODIFY COLUMN `examsessiontimelist` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `examsessionissave`;

ALTER TABLE `x2_examsession` ADD INDEX `examsessiontoken`(`examsessiontoken`) USING BTREE;

ALTER TABLE `x2_knows` ADD COLUMN `knowssequence` int(11) NOT NULL AFTER `knowsstatus`;

ALTER TABLE `x2_knows` ADD COLUMN `knowsnumber` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `knowssequence`;

ALTER TABLE `x2_knows` ADD COLUMN `knowsquestions` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `knowsnumber`;

ALTER TABLE `x2_knows` ADD INDEX `knowssequence`(`knowssequence`) USING BTREE;

ALTER TABLE `x2_module` ADD COLUMN `modulelockfields` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `modulestatus`;

ALTER TABLE `x2_module` MODIFY COLUMN `moduleallowreg` tinyint(1) NOT NULL DEFAULT 0 AFTER `moduletable`;

ALTER TABLE `x2_poscontent` ADD COLUMN `pcposapp` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `pcposid`;

ALTER TABLE `x2_poscontent` ADD COLUMN `pcdescribe` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `pctime`;

ALTER TABLE `x2_poscontent` ADD INDEX `pcposapp`(`pcposapp`) USING BTREE;

ALTER TABLE `x2_sections` ADD COLUMN `sectionsequence` int(11) NOT NULL AFTER `sectiondescribe`;

ALTER TABLE `x2_sections` ADD INDEX `sectionsequence`(`sectionsequence`) USING BTREE;

ALTER TABLE `x2_seminar` DROP INDEX `seminarsequence`;

ALTER TABLE `x2_seminar` DROP INDEX `seminaruserid`;

ALTER TABLE `x2_seminar` ADD COLUMN `seminartags` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `seminartitle`;

ALTER TABLE `x2_seminar` ADD COLUMN `seminarkeywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `seminartags`;

ALTER TABLE `x2_seminar` ADD COLUMN `seminarhref` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `seminarthumb`;

ALTER TABLE `x2_seminar` ADD COLUMN `seminargallerylink` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `seminargallery`;

ALTER TABLE `x2_seminar` ADD COLUMN `seminarcode` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `seminargallerylink`;

ALTER TABLE `x2_seminar` ADD COLUMN `seminarmodifier` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `seminarusername`;

ALTER TABLE `x2_seminar` ADD COLUMN `seminarmodifytime` int(11) NOT NULL AFTER `seminartime`;

ALTER TABLE `x2_seminar` ADD COLUMN `seminarorder` int(11) NOT NULL DEFAULT 0 AFTER `seminarstatus`;

ALTER TABLE `x2_seminar` MODIFY COLUMN `seminarusername` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' AFTER `seminarcode`;

ALTER TABLE `x2_seminar` DROP COLUMN `seminartpl`;

ALTER TABLE `x2_seminar` DROP COLUMN `seminaruserid`;

ALTER TABLE `x2_seminar` DROP COLUMN `seminarsequence`;

ALTER TABLE `x2_seminar` ADD INDEX `seminartags`(`seminartags`) USING BTREE;

ALTER TABLE `x2_seminar` ADD INDEX `seminarorder`(`seminarorder`) USING BTREE;

ALTER TABLE `x2_seminar` ADD FULLTEXT INDEX `seminarkeywords`(`seminarkeywords`);

CREATE TABLE `x2_seminar_content`  (
  `sctid` int(11) NOT NULL AUTO_INCREMENT,
  `sctelid` int(11) NOT NULL,
  `sctcontentid` int(11) NOT NULL,
  `sctorder` int(11) NOT NULL,
  `sctusername` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `scttime` int(11) NOT NULL,
  PRIMARY KEY (`sctid`) USING BTREE,
  INDEX `sctcontentid`(`sctcontentid`) USING BTREE,
  INDEX `sctorder`(`sctorder`) USING BTREE,
  INDEX `sctelid`(`sctelid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `x2_seminar_elem`  (
  `selid` int(11) NOT NULL AUTO_INCREMENT,
  `sellayout` int(11) NULL DEFAULT NULL,
  `selseminar` int(11) NULL DEFAULT NULL,
  `seltitle` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `selorder` int(11) NULL DEFAULT NULL,
  `selpos` tinyint(4) NULL DEFAULT NULL,
  `seldescribe` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `selcode` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `seldata` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`selid`) USING BTREE,
  INDEX `sellayout`(`sellayout`, `selseminar`) USING BTREE,
  INDEX `selorder`(`selorder`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `x2_seminar_layout`  (
  `slayoutid` int(11) NOT NULL AUTO_INCREMENT,
  `slayoutseminar` int(11) NOT NULL,
  `slayouttitle` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slayoutgrid` int(11) NOT NULL,
  `slayoutcode` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slayoutorder` int(11) NOT NULL,
  `slayoutdescribe` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`slayoutid`) USING BTREE,
  INDEX `slayoutorder`(`slayoutorder`) USING BTREE,
  INDEX `slayoutseminar`(`slayoutseminar`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `x2_seminar_tpls`  (
  `stplid` int(11) NOT NULL AUTO_INCREMENT,
  `stplname` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stpltype` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stplgrid` int(11) NULL DEFAULT NULL,
  `stpldescribe` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `stplcode` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`stplid`) USING BTREE,
  INDEX `stpltype`(`stpltype`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

ALTER TABLE `x2_user` ADD COLUMN `useranswer` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `usermoduleid`;

CREATE TABLE `x2_wxlogin`  (
  `wxsid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `wxinfo` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `wxtime` int(11) NOT NULL,
  `wxtoken` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`wxsid`) USING BTREE,
  INDEX `wxtime`(`wxtime`) USING BTREE,
  INDEX `wxtoken`(`wxtoken`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

DROP TABLE `x2_dayexam`;

DROP TABLE `x2_special`;

DROP TABLE `x2_specialsort`;

SET FOREIGN_KEY_CHECKS=1;
