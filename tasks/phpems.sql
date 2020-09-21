/*
 Navicat Premium Data Transfer

 Source Server         : Raspberry
 Source Server Type    : MySQL
 Source Server Version : 100028
 Source Host           : localhost:3306
 Source Schema         : phpems

 Target Server Type    : MySQL
 Target Server Version : 100028
 File Encoding         : 65001

 Date: 10/09/2020 12:34:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for x2_app
-- ----------------------------
DROP TABLE IF EXISTS `x2_app`;
CREATE TABLE `x2_app`  (
  `appid` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `appname` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `appthumb` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `appstatus` int(1) NOT NULL DEFAULT 0,
  `appsetting` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`appid`) USING BTREE,
  INDEX `appstatus`(`appstatus`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x2_app
-- ----------------------------
INSERT INTO `x2_app` VALUES ('bank', '财务', 'app/core/styles/images/noimage.gif', 1, '');
INSERT INTO `x2_app` VALUES ('certificate', '证书', 'app/core/styles/images/noimage.gif', 1, '');
INSERT INTO `x2_app` VALUES ('content', '内容', 'app/core/styles/images/noimage.gif', 1, '');
INSERT INTO `x2_app` VALUES ('core', '全局', 'app/core/styles/images/noimage.gif', 1, '');
INSERT INTO `x2_app` VALUES ('course', '课程', 'app/core/styles/images/noimage.gif', 1, '');
INSERT INTO `x2_app` VALUES ('demo', '试听中心', '', 1, 'a:1:{s:3:\"seo\";a:3:{s:5:\"title\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:11:\"description\";s:0:\"\";}}');
INSERT INTO `x2_app` VALUES ('docs', '文档', 'app/core/styles/images/noimage.gif', 1, '');
INSERT INTO `x2_app` VALUES ('document', '文件', 'app/core/styles/images/noimage.gif', 1, '');
INSERT INTO `x2_app` VALUES ('edu', '教务模块', '', 1, '');
INSERT INTO `x2_app` VALUES ('exam', '考试', 'app/core/styles/images/noimage.gif', 1, '');
INSERT INTO `x2_app` VALUES ('item', '商品模块', '', 1, 'a:1:{s:3:\"seo\";a:3:{s:5:\"title\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:11:\"description\";s:0:\"\";}}');
INSERT INTO `x2_app` VALUES ('passport', '证书模块', '', 1, '');
INSERT INTO `x2_app` VALUES ('user', '用户', 'app/core/styles/images/noimage.gif', 1, '');
INSERT INTO `x2_app` VALUES ('seminar', '专题', 'app/core/styles/images/noimage.gif', 1, '');
INSERT INTO `x2_app` VALUES ('autoform', '表单', 'app/core/styles/images/noimage.gif', 0, '');

-- ----------------------------
-- Table structure for x2_area
-- ----------------------------
DROP TABLE IF EXISTS `x2_area`;
CREATE TABLE `x2_area`  (
  `areaid` int(11) NOT NULL AUTO_INCREMENT,
  `area` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `areacode` int(12) NOT NULL DEFAULT 0,
  `arealevel` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`areaid`) USING BTREE,
  INDEX `area`(`area`, `arealevel`) USING BTREE,
  INDEX `areacode`(`areacode`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x2_area
-- ----------------------------
INSERT INTO `x2_area` VALUES (1, '全国', 1, 1);
INSERT INTO `x2_area` VALUES (3, '河南', 373, 0);
INSERT INTO `x2_area` VALUES (4, '北京', 10, 0);
INSERT INTO `x2_area` VALUES (5, '陕西', 29, 0);
INSERT INTO `x2_area` VALUES (6, '河北', 311, 0);
INSERT INTO `x2_area` VALUES (7, '天津', 22, 0);
INSERT INTO `x2_area` VALUES (8, '山东', 531, 0);
INSERT INTO `x2_area` VALUES (9, '江苏', 25, 0);
INSERT INTO `x2_area` VALUES (10, '湖北', 27, 0);
INSERT INTO `x2_area` VALUES (11, '辽宁', 24, 0);
INSERT INTO `x2_area` VALUES (12, '贵州', 851, 0);
INSERT INTO `x2_area` VALUES (13, '黑龙江', 451, 0);
INSERT INTO `x2_area` VALUES (14, '云南', 871, 0);
INSERT INTO `x2_area` VALUES (15, '四川', 28, 0);
INSERT INTO `x2_area` VALUES (16, '安徽', 551, 0);
INSERT INTO `x2_area` VALUES (17, '深圳', 755, 0);
INSERT INTO `x2_area` VALUES (18, '吉林', 431, 0);
INSERT INTO `x2_area` VALUES (19, '广东', 20, 0);
INSERT INTO `x2_area` VALUES (20, '新疆', 991, 0);
INSERT INTO `x2_area` VALUES (21, '广西', 771, 0);
INSERT INTO `x2_area` VALUES (22, '福建', 591, 0);
INSERT INTO `x2_area` VALUES (23, '湖南', 731, 0);
INSERT INTO `x2_area` VALUES (24, '上海', 21, 0);
INSERT INTO `x2_area` VALUES (25, '重庆', 23, 0);
INSERT INTO `x2_area` VALUES (26, '江西', 791, 0);
INSERT INTO `x2_area` VALUES (27, '浙江', 571, 0);
INSERT INTO `x2_area` VALUES (28, '山西', 351, 0);

-- ----------------------------
-- Table structure for x2_attach
-- ----------------------------
DROP TABLE IF EXISTS `x2_attach`;
CREATE TABLE `x2_attach`  (
  `attid` int(11) NOT NULL AUTO_INCREMENT,
  `attpath` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `atttitle` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `attext` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `attinputtime` int(11) NOT NULL DEFAULT 0,
  `attsize` int(11) NOT NULL DEFAULT 0,
  `attmd5` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `attuserid` int(11) NOT NULL DEFAULT 0,
  `attcntype` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`attid`) USING BTREE,
  INDEX `attext`(`attext`, `attinputtime`) USING BTREE,
  INDEX `attuserid`(`attuserid`) USING BTREE,
  INDEX `attcntype`(`attcntype`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x2_attach
-- ----------------------------
INSERT INTO `x2_attach` VALUES (1, 'files/attach/images/content/20180727/15326772116755.jpg', '940-355.jpg', 'jpg', 1532677211, 1111, '', 1, 'image/jpeg');

-- ----------------------------
-- Table structure for x2_attachtype
-- ----------------------------
DROP TABLE IF EXISTS `x2_attachtype`;
CREATE TABLE `x2_attachtype`  (
  `atid` int(11) NOT NULL AUTO_INCREMENT,
  `attachtype` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `attachexts` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`atid`) USING BTREE,
  INDEX `attachtype`(`attachtype`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x2_attachtype
-- ----------------------------
INSERT INTO `x2_attachtype` VALUES (1, '图片', 'jpg,png,gif,bmp');
INSERT INTO `x2_attachtype` VALUES (2, '音频', 'mp3');
INSERT INTO `x2_attachtype` VALUES (3, '多媒体', 'flv,wmv,mp4,avi');
INSERT INTO `x2_attachtype` VALUES (4, '批量导入文件', 'csv');
INSERT INTO `x2_attachtype` VALUES (5, '文字类', 'pdf');

-- ----------------------------
-- Table structure for x2_basic
-- ----------------------------
DROP TABLE IF EXISTS `x2_basic`;
CREATE TABLE `x2_basic`  (
  `basicid` int(11) NOT NULL AUTO_INCREMENT,
  `basic` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `basicareaid` int(4) NOT NULL DEFAULT 0,
  `basicsubjectid` int(11) NOT NULL DEFAULT 0,
  `basicsection` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `basicknows` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `basicexam` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `basicapi` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `basicdemo` int(1) NOT NULL DEFAULT 0,
  `basicthumb` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `basicprice` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `basicclosed` int(1) NOT NULL DEFAULT 0,
  `basictop` int(1) NULL DEFAULT NULL,
  `basicdescribe` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`basicid`) USING BTREE,
  INDEX `basicexamid`(`basicareaid`) USING BTREE,
  INDEX `basicsubjectid`(`basicsubjectid`) USING BTREE,
  INDEX `basicapi`(`basicapi`) USING BTREE,
  INDEX `basicdemo`(`basicdemo`) USING BTREE,
  INDEX `basicclosed`(`basicclosed`) USING BTREE,
  INDEX `basictop`(`basictop`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x2_basic
-- ----------------------------
INSERT INTO `x2_basic` VALUES (1, '中国近现代史纲要', 1, 1, 'a:10:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:5;i:5;i:6;i:6;i:7;i:7;i:8;i:8;i:9;i:9;i:10;}', 'a:10:{i:1;a:3:{i:1;s:1:\"1\";i:2;s:1:\"2\";i:3;s:1:\"3\";}i:2;a:3:{i:4;s:1:\"4\";i:5;s:1:\"5\";i:6;s:1:\"6\";}i:3;a:2:{i:7;s:1:\"7\";i:8;s:1:\"8\";}i:4;a:3:{i:9;s:1:\"9\";i:10;s:2:\"10\";i:11;s:2:\"11\";}i:5;a:3:{i:12;s:2:\"12\";i:13;s:2:\"13\";i:14;s:2:\"14\";}i:6;a:5:{i:15;s:2:\"15\";i:16;s:2:\"16\";i:17;s:2:\"17\";i:18;s:2:\"18\";i:19;s:2:\"19\";}i:7;a:3:{i:20;s:2:\"20\";i:21;s:2:\"21\";i:22;s:2:\"22\";}i:8;a:3:{i:23;s:2:\"23\";i:24;s:2:\"24\";i:25;s:2:\"25\";}i:9;a:3:{i:26;s:2:\"26\";i:27;s:2:\"27\";i:28;s:2:\"28\";}i:10;a:5:{i:29;s:2:\"29\";i:30;s:2:\"30\";i:31;s:2:\"31\";i:32;s:2:\"32\";i:33;s:2:\"33\";}}', 'a:12:{s:9:\"rulemodel\";s:1:\"0\";s:5:\"model\";s:1:\"0\";s:14:\"changesequence\";s:1:\"0\";s:4:\"auto\";s:1:\"1\";s:12:\"autotemplate\";s:15:\"exampaper_paper\";s:4:\"self\";s:1:\"1\";s:12:\"selftemplate\";s:10:\"exam_paper\";s:8:\"opentime\";a:2:{s:5:\"start\";b:0;s:3:\"end\";b:0;}s:10:\"selectrule\";s:1:\"1\";s:10:\"examnumber\";s:1:\"1\";s:12:\"notviewscore\";s:1:\"0\";s:10:\"allowgroup\";s:0:\"\";}', '', 1, 'app/core/styles/images/noimage.gif', '', 0, NULL, '用鸦片战争开始的中国历史');
INSERT INTO `x2_basic` VALUES (2, '魔兽正史', 1, 2, '', '', '', '', 0, 'app/core/styles/images/noimage.gif', '1:10\r\n3:20\r\n5:30', 0, 0, '魔兽世界的历史');

-- ----------------------------
-- Table structure for x2_block
-- ----------------------------
DROP TABLE IF EXISTS `x2_block`;
CREATE TABLE `x2_block`  (
  `blockid` int(11) NOT NULL AUTO_INCREMENT,
  `block` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `blocktype` int(1) NOT NULL DEFAULT 0,
  `blockposition` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `blockcontent` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`blockid`) USING BTREE,
  INDEX `blocktype`(`blocktype`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x2_book
-- ----------------------------
DROP TABLE IF EXISTS `x2_book`;
CREATE TABLE `x2_book`  (
  `bookid` int(11) NOT NULL AUTO_INCREMENT,
  `bookcontent` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bookopenid` varchar(48) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `booktime` int(11) NOT NULL,
  `bookuserid` int(11) NOT NULL,
  PRIMARY KEY (`bookid`) USING BTREE,
  INDEX `bookopenid`(`bookopenid`) USING BTREE,
  INDEX `booktime`(`booktime`) USING BTREE,
  INDEX `bookuserid`(`bookuserid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x2_category
-- ----------------------------
DROP TABLE IF EXISTS `x2_category`;
CREATE TABLE `x2_category`  (
  `catid` int(11) NOT NULL AUTO_INCREMENT,
  `catapp` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `catlite` int(11) NOT NULL DEFAULT 0,
  `catname` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `catimg` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `caturl` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `catuseurl` int(1) NOT NULL DEFAULT 0,
  `catparent` int(11) NULL DEFAULT 0,
  `catdes` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cattpl` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `catmanager` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `catinmenu` int(1) NOT NULL DEFAULT 0,
  `catindex` int(4) NOT NULL DEFAULT 0,
  `catsubject` int(11) NOT NULL,
  PRIMARY KEY (`catid`) USING BTREE,
  INDEX `catlite`(`catlite`, `catparent`) USING BTREE,
  INDEX `catappid`(`catapp`) USING BTREE,
  INDEX `catuseurl`(`catuseurl`) USING BTREE,
  INDEX `catinmenu`(`catinmenu`, `catindex`) USING BTREE,
  INDEX `catsubject`(`catsubject`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x2_category
-- ----------------------------
INSERT INTO `x2_category` VALUES (1, 'content', 0, '考试信息', '', '', 0, 0, '', 'category_default', 'a:2:{s:8:\"pubusers\";s:0:\"\";s:9:\"pubgroups\";s:0:\"\";}', 0, 1, 1);
INSERT INTO `x2_category` VALUES (2, 'content', 0, '首页头图', '', '', 0, 0, '', 'category_default', 'a:2:{s:8:\"pubusers\";s:0:\"\";s:9:\"pubgroups\";s:0:\"\";}', 1, 100, 1);
INSERT INTO `x2_category` VALUES (3, 'content', 0, '考试资料', '', '', 0, 0, '', 'category_default', 'a:2:{s:8:\"pubusers\";s:0:\"\";s:9:\"pubgroups\";s:0:\"\";}', 0, 5, 1);
INSERT INTO `x2_category` VALUES (4, 'content', 0, '帮助信息', '', '', 0, 0, '&lt;h1 class=&quot;wikititle&quot;&gt;区委区为企鹅&lt;/h1&gt;\r\n\r\n&lt;h2 class=&quot;wikititle&quot;&gt;这是一个什么段落&lt;/h2&gt;', 'category_default', 'a:2:{s:8:\"pubusers\";s:0:\"\";s:9:\"pubgroups\";s:0:\"\";}', 1, 5, 1);
INSERT INTO `x2_category` VALUES (5, 'course', 0, '魔兽世界', 'app/core/styles/images/noimage.gif', '', 0, 0, '', 'category_default', 'a:2:{s:8:\"pubusers\";s:0:\"\";s:9:\"pubgroups\";s:0:\"\";}', 0, 10, 0);
INSERT INTO `x2_category` VALUES (11, 'content', 0, '友情链接', 'app/core/styles/images/noimage.gif', '', 0, 4, '', 'category_default', 'a:2:{s:8:\\\"pubusers\\\";s:0:\\\"\\\";s:9:\\\"pubgroups\\\";s:0:\\\"\\\";}', 0, 0, 0);
INSERT INTO `x2_category` VALUES (12, 'docs', 0, '人物', 'app/core/styles/images/noimage.gif', '', 0, 0, '', 'category_default', 'a:2:{s:8:\\\"pubusers\\\";s:0:\\\"\\\";s:9:\\\"pubgroups\\\";s:0:\\\"\\\";}', 0, 0, 0);
INSERT INTO `x2_category` VALUES (14, 'content', 0, '网站公告', 'app/core/styles/images/noimage.gif', '', 0, 4, '', 'category_default', '', 0, 0, 0);

-- ----------------------------
-- Table structure for x2_cequeue
-- ----------------------------
DROP TABLE IF EXISTS `x2_cequeue`;
CREATE TABLE `x2_cequeue`  (
  `ceqid` int(11) NOT NULL AUTO_INCREMENT,
  `ceqceid` int(11) NOT NULL,
  `cequserid` int(11) NOT NULL,
  `ceqinfo` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ceqtime` int(11) NOT NULL,
  `ceqstatus` tinyint(1) NOT NULL,
  `ceqordersn` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ceqpubtime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ceqid`) USING BTREE,
  INDEX `cequserid`(`cequserid`) USING BTREE,
  INDEX `ceqtime`(`ceqtime`) USING BTREE,
  INDEX `ceqstatus`(`ceqstatus`) USING BTREE,
  INDEX `ceqordersn`(`ceqordersn`) USING BTREE,
  INDEX `ceqceid`(`ceqceid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x2_cequeue
-- ----------------------------
INSERT INTO `x2_cequeue` VALUES (1, 1, 1, 'a:7:{s:8:\"username\";s:7:\"peadmin\";s:5:\"photo\";s:55:\"files/attach/images/content/20170717/15002573305180.png\";s:12:\"usertruename\";s:4:\"test\";s:7:\"usersex\";N;s:10:\"userdegree\";N;s:9:\"userphone\";N;s:11:\"useraddress\";N;}', 1514358059, 0, '', NULL);
INSERT INTO `x2_cequeue` VALUES (2, 1, 1, 'a:7:{s:8:\"username\";s:7:\"peadmin\";s:5:\"photo\";s:55:\"files/attach/images/content/20170717/15002573305180.png\";s:12:\"usertruename\";s:4:\"test\";s:7:\"usersex\";N;s:10:\"userdegree\";N;s:9:\"userphone\";N;s:11:\"useraddress\";N;}', 1514358861, 0, '', NULL);
INSERT INTO `x2_cequeue` VALUES (3, 1, 1, 'a:7:{s:8:\"username\";s:7:\"peadmin\";s:5:\"photo\";s:55:\"files/attach/images/content/20170717/15002573305180.png\";s:12:\"usertruename\";s:4:\"test\";s:7:\"usersex\";N;s:10:\"userdegree\";N;s:9:\"userphone\";N;s:11:\"useraddress\";N;}', 1514358875, 2, '', NULL);
INSERT INTO `x2_cequeue` VALUES (4, 1, 1, 'a:7:{s:8:\"username\";s:7:\"peadmin\";s:5:\"photo\";N;s:12:\"usertruename\";s:4:\"test\";s:7:\"usersex\";N;s:10:\"userdegree\";s:6:\"本科\";s:9:\"userphone\";s:11:\"13456789234\";s:11:\"useraddress\";s:33:\"河南省郑州市管城区某地\";}', 1531133669, 0, '', 0);
INSERT INTO `x2_cequeue` VALUES (5, 1, 1, 'a:7:{s:8:\"username\";s:7:\"peadmin\";s:5:\"photo\";N;s:12:\"usertruename\";s:4:\"test\";s:7:\"usersex\";N;s:10:\"userdegree\";s:6:\"本科\";s:9:\"userphone\";s:11:\"13456789234\";s:11:\"useraddress\";s:33:\"河南省郑州市管城区某地\";}', 1531133686, 0, '', 0);
INSERT INTO `x2_cequeue` VALUES (6, 1, 1, 'a:7:{s:8:\"username\";s:7:\"peadmin\";s:5:\"photo\";N;s:12:\"usertruename\";s:4:\"test\";s:7:\"usersex\";N;s:10:\"userdegree\";s:6:\"本科\";s:9:\"userphone\";s:11:\"13456789234\";s:11:\"useraddress\";s:33:\"河南省郑州市管城区某地\";}', 1531134023, 0, '', 0);
INSERT INTO `x2_cequeue` VALUES (7, 1, 1, 'a:7:{s:8:\"username\";s:7:\"peadmin\";s:5:\"photo\";N;s:12:\"usertruename\";s:4:\"test\";s:7:\"usersex\";N;s:10:\"userdegree\";s:6:\"本科\";s:9:\"userphone\";s:11:\"13456789234\";s:11:\"useraddress\";s:33:\"河南省郑州市管城区某地\";}', 1531194290, 0, '', 0);
INSERT INTO `x2_cequeue` VALUES (8, 1, 1, 'a:7:{s:8:\"username\";s:7:\"peadmin\";s:5:\"photo\";N;s:12:\"usertruename\";s:4:\"test\";s:7:\"usersex\";N;s:10:\"userdegree\";s:6:\"本科\";s:9:\"userphone\";s:11:\"13456789234\";s:11:\"useraddress\";s:33:\"河南省郑州市管城区某地\";}', 1532680851, 0, '', 0);
INSERT INTO `x2_cequeue` VALUES (9, 1, 1, 'a:7:{s:8:\"username\";s:7:\"peadmin\";s:5:\"photo\";N;s:12:\"usertruename\";s:4:\"test\";s:7:\"usersex\";N;s:10:\"userdegree\";s:6:\"本科\";s:9:\"userphone\";s:11:\"13456789234\";s:11:\"useraddress\";s:33:\"河南省郑州市管城区某地\";}', 1532680857, 0, '', 0);
INSERT INTO `x2_cequeue` VALUES (10, 1, 1, 'a:7:{s:8:\"username\";s:7:\"peadmin\";s:5:\"photo\";N;s:12:\"usertruename\";s:4:\"test\";s:7:\"usersex\";N;s:10:\"userdegree\";s:6:\"本科\";s:9:\"userphone\";s:11:\"13456789234\";s:11:\"useraddress\";s:33:\"河南省郑州市管城区某地\";}', 1532680859, 0, '', 0);

-- ----------------------------
-- Table structure for x2_certificate
-- ----------------------------
DROP TABLE IF EXISTS `x2_certificate`;
CREATE TABLE `x2_certificate`  (
  `ceid` int(11) NOT NULL AUTO_INCREMENT,
  `cetitle` varchar(72) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cethumb` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ceprice` int(10) NOT NULL,
  `cebasic` int(11) NULL DEFAULT NULL,
  `cetime` int(11) NULL DEFAULT NULL,
  `cedays` int(11) NULL DEFAULT NULL,
  `cedescribe` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cetext` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`ceid`) USING BTREE,
  INDEX `cebasic`(`cebasic`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x2_city
-- ----------------------------
DROP TABLE IF EXISTS `x2_city`;
CREATE TABLE `x2_city`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cityid` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `father` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cityid`(`cityid`) USING BTREE,
  INDEX `father`(`father`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 371 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x2_city
-- ----------------------------
INSERT INTO `x2_city` VALUES (1, '110100', '北京市', '110000');
INSERT INTO `x2_city` VALUES (3, '120100', '天津市', '120000');
INSERT INTO `x2_city` VALUES (5, '130100', '石家庄市', '130000');
INSERT INTO `x2_city` VALUES (6, '130200', '唐山市', '130000');
INSERT INTO `x2_city` VALUES (7, '130300', '秦皇岛市', '130000');
INSERT INTO `x2_city` VALUES (8, '130400', '邯郸市', '130000');
INSERT INTO `x2_city` VALUES (9, '130500', '邢台市', '130000');
INSERT INTO `x2_city` VALUES (10, '130600', '保定市', '130000');
INSERT INTO `x2_city` VALUES (11, '130700', '张家口市', '130000');
INSERT INTO `x2_city` VALUES (12, '130800', '承德市', '130000');
INSERT INTO `x2_city` VALUES (13, '130900', '沧州市', '130000');
INSERT INTO `x2_city` VALUES (14, '131000', '廊坊市', '130000');
INSERT INTO `x2_city` VALUES (15, '131100', '衡水市', '130000');
INSERT INTO `x2_city` VALUES (16, '140100', '太原市', '140000');
INSERT INTO `x2_city` VALUES (17, '140200', '大同市', '140000');
INSERT INTO `x2_city` VALUES (18, '140300', '阳泉市', '140000');
INSERT INTO `x2_city` VALUES (19, '140400', '长治市', '140000');
INSERT INTO `x2_city` VALUES (20, '140500', '晋城市', '140000');
INSERT INTO `x2_city` VALUES (21, '140600', '朔州市', '140000');
INSERT INTO `x2_city` VALUES (22, '140700', '晋中市', '140000');
INSERT INTO `x2_city` VALUES (23, '140800', '运城市', '140000');
INSERT INTO `x2_city` VALUES (24, '140900', '忻州市', '140000');
INSERT INTO `x2_city` VALUES (25, '141000', '临汾市', '140000');
INSERT INTO `x2_city` VALUES (26, '141100', '吕梁市', '140000');
INSERT INTO `x2_city` VALUES (27, '150100', '呼和浩特市', '150000');
INSERT INTO `x2_city` VALUES (28, '150200', '包头市', '150000');
INSERT INTO `x2_city` VALUES (29, '150300', '乌海市', '150000');
INSERT INTO `x2_city` VALUES (30, '150400', '赤峰市', '150000');
INSERT INTO `x2_city` VALUES (31, '150500', '通辽市', '150000');
INSERT INTO `x2_city` VALUES (32, '150600', '鄂尔多斯市', '150000');
INSERT INTO `x2_city` VALUES (33, '150700', '呼伦贝尔市', '150000');
INSERT INTO `x2_city` VALUES (34, '150800', '巴彦淖尔市', '150000');
INSERT INTO `x2_city` VALUES (35, '150900', '乌兰察布市', '150000');
INSERT INTO `x2_city` VALUES (36, '152200', '兴安盟', '150000');
INSERT INTO `x2_city` VALUES (37, '152500', '锡林郭勒盟', '150000');
INSERT INTO `x2_city` VALUES (38, '152900', '阿拉善盟', '150000');
INSERT INTO `x2_city` VALUES (39, '210100', '沈阳市', '210000');
INSERT INTO `x2_city` VALUES (40, '210200', '大连市', '210000');
INSERT INTO `x2_city` VALUES (41, '210300', '鞍山市', '210000');
INSERT INTO `x2_city` VALUES (42, '210400', '抚顺市', '210000');
INSERT INTO `x2_city` VALUES (43, '210500', '本溪市', '210000');
INSERT INTO `x2_city` VALUES (44, '210600', '丹东市', '210000');
INSERT INTO `x2_city` VALUES (45, '210700', '锦州市', '210000');
INSERT INTO `x2_city` VALUES (46, '210800', '营口市', '210000');
INSERT INTO `x2_city` VALUES (47, '210900', '阜新市', '210000');
INSERT INTO `x2_city` VALUES (48, '211000', '辽阳市', '210000');
INSERT INTO `x2_city` VALUES (49, '211100', '盘锦市', '210000');
INSERT INTO `x2_city` VALUES (50, '211200', '铁岭市', '210000');
INSERT INTO `x2_city` VALUES (51, '211300', '朝阳市', '210000');
INSERT INTO `x2_city` VALUES (52, '211400', '葫芦岛市', '210000');
INSERT INTO `x2_city` VALUES (53, '220100', '长春市', '220000');
INSERT INTO `x2_city` VALUES (54, '220200', '吉林市', '220000');
INSERT INTO `x2_city` VALUES (55, '220300', '四平市', '220000');
INSERT INTO `x2_city` VALUES (56, '220400', '辽源市', '220000');
INSERT INTO `x2_city` VALUES (57, '220500', '通化市', '220000');
INSERT INTO `x2_city` VALUES (58, '220600', '白山市', '220000');
INSERT INTO `x2_city` VALUES (59, '220700', '松原市', '220000');
INSERT INTO `x2_city` VALUES (60, '220800', '白城市', '220000');
INSERT INTO `x2_city` VALUES (61, '222400', '延边朝鲜族自治州', '220000');
INSERT INTO `x2_city` VALUES (62, '230100', '哈尔滨市', '230000');
INSERT INTO `x2_city` VALUES (63, '230200', '齐齐哈尔市', '230000');
INSERT INTO `x2_city` VALUES (64, '230300', '鸡西市', '230000');
INSERT INTO `x2_city` VALUES (65, '230400', '鹤岗市', '230000');
INSERT INTO `x2_city` VALUES (66, '230500', '双鸭山市', '230000');
INSERT INTO `x2_city` VALUES (67, '230600', '大庆市', '230000');
INSERT INTO `x2_city` VALUES (68, '230700', '伊春市', '230000');
INSERT INTO `x2_city` VALUES (69, '230800', '佳木斯市', '230000');
INSERT INTO `x2_city` VALUES (70, '230900', '七台河市', '230000');
INSERT INTO `x2_city` VALUES (71, '231000', '牡丹江市', '230000');
INSERT INTO `x2_city` VALUES (72, '231100', '黑河市', '230000');
INSERT INTO `x2_city` VALUES (73, '231200', '绥化市', '230000');
INSERT INTO `x2_city` VALUES (74, '232700', '大兴安岭地区', '230000');
INSERT INTO `x2_city` VALUES (75, '310100', '上海市', '310000');
INSERT INTO `x2_city` VALUES (77, '320100', '南京市', '320000');
INSERT INTO `x2_city` VALUES (78, '320200', '无锡市', '320000');
INSERT INTO `x2_city` VALUES (79, '320300', '徐州市', '320000');
INSERT INTO `x2_city` VALUES (80, '320400', '常州市', '320000');
INSERT INTO `x2_city` VALUES (81, '320500', '苏州市', '320000');
INSERT INTO `x2_city` VALUES (82, '320600', '南通市', '320000');
INSERT INTO `x2_city` VALUES (83, '320700', '连云港市', '320000');
INSERT INTO `x2_city` VALUES (84, '320800', '淮安市', '320000');
INSERT INTO `x2_city` VALUES (85, '320900', '盐城市', '320000');
INSERT INTO `x2_city` VALUES (86, '321000', '扬州市', '320000');
INSERT INTO `x2_city` VALUES (87, '321100', '镇江市', '320000');
INSERT INTO `x2_city` VALUES (88, '321200', '泰州市', '320000');
INSERT INTO `x2_city` VALUES (89, '321300', '宿迁市', '320000');
INSERT INTO `x2_city` VALUES (90, '330100', '杭州市', '330000');
INSERT INTO `x2_city` VALUES (91, '330200', '宁波市', '330000');
INSERT INTO `x2_city` VALUES (92, '330300', '温州市', '330000');
INSERT INTO `x2_city` VALUES (93, '330400', '嘉兴市', '330000');
INSERT INTO `x2_city` VALUES (94, '330500', '湖州市', '330000');
INSERT INTO `x2_city` VALUES (95, '330600', '绍兴市', '330000');
INSERT INTO `x2_city` VALUES (96, '330700', '金华市', '330000');
INSERT INTO `x2_city` VALUES (97, '330800', '衢州市', '330000');
INSERT INTO `x2_city` VALUES (98, '330900', '舟山市', '330000');
INSERT INTO `x2_city` VALUES (99, '331000', '台州市', '330000');
INSERT INTO `x2_city` VALUES (100, '331100', '丽水市', '330000');
INSERT INTO `x2_city` VALUES (101, '340100', '合肥市', '340000');
INSERT INTO `x2_city` VALUES (102, '340200', '芜湖市', '340000');
INSERT INTO `x2_city` VALUES (103, '340300', '蚌埠市', '340000');
INSERT INTO `x2_city` VALUES (104, '340400', '淮南市', '340000');
INSERT INTO `x2_city` VALUES (105, '340500', '马鞍山市', '340000');
INSERT INTO `x2_city` VALUES (106, '340600', '淮北市', '340000');
INSERT INTO `x2_city` VALUES (107, '340700', '铜陵市', '340000');
INSERT INTO `x2_city` VALUES (108, '340800', '安庆市', '340000');
INSERT INTO `x2_city` VALUES (109, '341000', '黄山市', '340000');
INSERT INTO `x2_city` VALUES (110, '341100', '滁州市', '340000');
INSERT INTO `x2_city` VALUES (111, '341200', '阜阳市', '340000');
INSERT INTO `x2_city` VALUES (112, '341300', '宿州市', '340000');
INSERT INTO `x2_city` VALUES (113, '341400', '巢湖市', '340000');
INSERT INTO `x2_city` VALUES (114, '341500', '六安市', '340000');
INSERT INTO `x2_city` VALUES (115, '341600', '亳州市', '340000');
INSERT INTO `x2_city` VALUES (116, '341700', '池州市', '340000');
INSERT INTO `x2_city` VALUES (117, '341800', '宣城市', '340000');
INSERT INTO `x2_city` VALUES (118, '350100', '福州市', '350000');
INSERT INTO `x2_city` VALUES (119, '350200', '厦门市', '350000');
INSERT INTO `x2_city` VALUES (120, '350300', '莆田市', '350000');
INSERT INTO `x2_city` VALUES (121, '350400', '三明市', '350000');
INSERT INTO `x2_city` VALUES (122, '350500', '泉州市', '350000');
INSERT INTO `x2_city` VALUES (123, '350600', '漳州市', '350000');
INSERT INTO `x2_city` VALUES (124, '350700', '南平市', '350000');
INSERT INTO `x2_city` VALUES (125, '350800', '龙岩市', '350000');
INSERT INTO `x2_city` VALUES (126, '350900', '宁德市', '350000');
INSERT INTO `x2_city` VALUES (127, '360100', '南昌市', '360000');
INSERT INTO `x2_city` VALUES (128, '360200', '景德镇市', '360000');
INSERT INTO `x2_city` VALUES (129, '360300', '萍乡市', '360000');
INSERT INTO `x2_city` VALUES (130, '360400', '九江市', '360000');
INSERT INTO `x2_city` VALUES (131, '360500', '新余市', '360000');
INSERT INTO `x2_city` VALUES (132, '360600', '鹰潭市', '360000');
INSERT INTO `x2_city` VALUES (133, '360700', '赣州市', '360000');
INSERT INTO `x2_city` VALUES (134, '360800', '吉安市', '360000');
INSERT INTO `x2_city` VALUES (135, '360900', '宜春市', '360000');
INSERT INTO `x2_city` VALUES (136, '361000', '抚州市', '360000');
INSERT INTO `x2_city` VALUES (137, '361100', '上饶市', '360000');
INSERT INTO `x2_city` VALUES (138, '370100', '济南市', '370000');
INSERT INTO `x2_city` VALUES (139, '370200', '青岛市', '370000');
INSERT INTO `x2_city` VALUES (140, '370300', '淄博市', '370000');
INSERT INTO `x2_city` VALUES (141, '370400', '枣庄市', '370000');
INSERT INTO `x2_city` VALUES (142, '370500', '东营市', '370000');
INSERT INTO `x2_city` VALUES (143, '370600', '烟台市', '370000');
INSERT INTO `x2_city` VALUES (144, '370700', '潍坊市', '370000');
INSERT INTO `x2_city` VALUES (145, '370800', '济宁市', '370000');
INSERT INTO `x2_city` VALUES (146, '370900', '泰安市', '370000');
INSERT INTO `x2_city` VALUES (147, '371000', '威海市', '370000');
INSERT INTO `x2_city` VALUES (148, '371100', '日照市', '370000');
INSERT INTO `x2_city` VALUES (149, '371200', '莱芜市', '370000');
INSERT INTO `x2_city` VALUES (150, '371300', '临沂市', '370000');
INSERT INTO `x2_city` VALUES (151, '371400', '德州市', '370000');
INSERT INTO `x2_city` VALUES (152, '371500', '聊城市', '370000');
INSERT INTO `x2_city` VALUES (153, '371600', '滨州市', '370000');
INSERT INTO `x2_city` VALUES (154, '371700', '荷泽市', '370000');
INSERT INTO `x2_city` VALUES (155, '410100', '郑州市', '410000');
INSERT INTO `x2_city` VALUES (156, '410200', '开封市', '410000');
INSERT INTO `x2_city` VALUES (157, '410300', '洛阳市', '410000');
INSERT INTO `x2_city` VALUES (158, '410400', '平顶山市', '410000');
INSERT INTO `x2_city` VALUES (159, '410500', '安阳市', '410000');
INSERT INTO `x2_city` VALUES (160, '410600', '鹤壁市', '410000');
INSERT INTO `x2_city` VALUES (161, '410700', '新乡市', '410000');
INSERT INTO `x2_city` VALUES (162, '410800', '焦作市', '410000');
INSERT INTO `x2_city` VALUES (163, '410900', '濮阳市', '410000');
INSERT INTO `x2_city` VALUES (164, '411000', '许昌市', '410000');
INSERT INTO `x2_city` VALUES (165, '411100', '漯河市', '410000');
INSERT INTO `x2_city` VALUES (166, '411200', '三门峡市', '410000');
INSERT INTO `x2_city` VALUES (167, '411300', '南阳市', '410000');
INSERT INTO `x2_city` VALUES (168, '411400', '商丘市', '410000');
INSERT INTO `x2_city` VALUES (169, '411500', '信阳市', '410000');
INSERT INTO `x2_city` VALUES (170, '411600', '周口市', '410000');
INSERT INTO `x2_city` VALUES (171, '411700', '驻马店市', '410000');
INSERT INTO `x2_city` VALUES (172, '420100', '武汉市', '420000');
INSERT INTO `x2_city` VALUES (173, '420200', '黄石市', '420000');
INSERT INTO `x2_city` VALUES (174, '420300', '十堰市', '420000');
INSERT INTO `x2_city` VALUES (175, '420500', '宜昌市', '420000');
INSERT INTO `x2_city` VALUES (176, '420600', '襄樊市', '420000');
INSERT INTO `x2_city` VALUES (177, '420700', '鄂州市', '420000');
INSERT INTO `x2_city` VALUES (178, '420800', '荆门市', '420000');
INSERT INTO `x2_city` VALUES (179, '420900', '孝感市', '420000');
INSERT INTO `x2_city` VALUES (180, '421000', '荆州市', '420000');
INSERT INTO `x2_city` VALUES (181, '421100', '黄冈市', '420000');
INSERT INTO `x2_city` VALUES (182, '421200', '咸宁市', '420000');
INSERT INTO `x2_city` VALUES (183, '421300', '随州市', '420000');
INSERT INTO `x2_city` VALUES (184, '422800', '恩施土家族苗族自治州', '420000');
INSERT INTO `x2_city` VALUES (185, '429000', '省直辖行政单位', '420000');
INSERT INTO `x2_city` VALUES (186, '430100', '长沙市', '430000');
INSERT INTO `x2_city` VALUES (187, '430200', '株洲市', '430000');
INSERT INTO `x2_city` VALUES (188, '430300', '湘潭市', '430000');
INSERT INTO `x2_city` VALUES (189, '430400', '衡阳市', '430000');
INSERT INTO `x2_city` VALUES (190, '430500', '邵阳市', '430000');
INSERT INTO `x2_city` VALUES (191, '430600', '岳阳市', '430000');
INSERT INTO `x2_city` VALUES (192, '430700', '常德市', '430000');
INSERT INTO `x2_city` VALUES (193, '430800', '张家界市', '430000');
INSERT INTO `x2_city` VALUES (194, '430900', '益阳市', '430000');
INSERT INTO `x2_city` VALUES (195, '431000', '郴州市', '430000');
INSERT INTO `x2_city` VALUES (196, '431100', '永州市', '430000');
INSERT INTO `x2_city` VALUES (197, '431200', '怀化市', '430000');
INSERT INTO `x2_city` VALUES (198, '431300', '娄底市', '430000');
INSERT INTO `x2_city` VALUES (199, '433100', '湘西土家族苗族自治州', '430000');
INSERT INTO `x2_city` VALUES (200, '440100', '广州市', '440000');
INSERT INTO `x2_city` VALUES (201, '440200', '韶关市', '440000');
INSERT INTO `x2_city` VALUES (202, '440300', '深圳市', '440000');
INSERT INTO `x2_city` VALUES (203, '440400', '珠海市', '440000');
INSERT INTO `x2_city` VALUES (204, '440500', '汕头市', '440000');
INSERT INTO `x2_city` VALUES (205, '440600', '佛山市', '440000');
INSERT INTO `x2_city` VALUES (206, '440700', '江门市', '440000');
INSERT INTO `x2_city` VALUES (207, '440800', '湛江市', '440000');
INSERT INTO `x2_city` VALUES (208, '440900', '茂名市', '440000');
INSERT INTO `x2_city` VALUES (209, '441200', '肇庆市', '440000');
INSERT INTO `x2_city` VALUES (210, '441300', '惠州市', '440000');
INSERT INTO `x2_city` VALUES (211, '441400', '梅州市', '440000');
INSERT INTO `x2_city` VALUES (212, '441500', '汕尾市', '440000');
INSERT INTO `x2_city` VALUES (213, '441600', '河源市', '440000');
INSERT INTO `x2_city` VALUES (214, '441700', '阳江市', '440000');
INSERT INTO `x2_city` VALUES (215, '441800', '清远市', '440000');
INSERT INTO `x2_city` VALUES (216, '441900', '东莞市', '440000');
INSERT INTO `x2_city` VALUES (217, '442000', '中山市', '440000');
INSERT INTO `x2_city` VALUES (218, '445100', '潮州市', '440000');
INSERT INTO `x2_city` VALUES (219, '445200', '揭阳市', '440000');
INSERT INTO `x2_city` VALUES (220, '445300', '云浮市', '440000');
INSERT INTO `x2_city` VALUES (221, '450100', '南宁市', '450000');
INSERT INTO `x2_city` VALUES (222, '450200', '柳州市', '450000');
INSERT INTO `x2_city` VALUES (223, '450300', '桂林市', '450000');
INSERT INTO `x2_city` VALUES (224, '450400', '梧州市', '450000');
INSERT INTO `x2_city` VALUES (225, '450500', '北海市', '450000');
INSERT INTO `x2_city` VALUES (226, '450600', '防城港市', '450000');
INSERT INTO `x2_city` VALUES (227, '450700', '钦州市', '450000');
INSERT INTO `x2_city` VALUES (228, '450800', '贵港市', '450000');
INSERT INTO `x2_city` VALUES (229, '450900', '玉林市', '450000');
INSERT INTO `x2_city` VALUES (230, '451000', '百色市', '450000');
INSERT INTO `x2_city` VALUES (231, '451100', '贺州市', '450000');
INSERT INTO `x2_city` VALUES (232, '451200', '河池市', '450000');
INSERT INTO `x2_city` VALUES (233, '451300', '来宾市', '450000');
INSERT INTO `x2_city` VALUES (234, '451400', '崇左市', '450000');
INSERT INTO `x2_city` VALUES (235, '460100', '海口市', '460000');
INSERT INTO `x2_city` VALUES (236, '460200', '三亚市', '460000');
INSERT INTO `x2_city` VALUES (237, '469000', '省直辖县级行政单位', '460000');
INSERT INTO `x2_city` VALUES (238, '500100', '重庆市', '500000');
INSERT INTO `x2_city` VALUES (241, '510100', '成都市', '510000');
INSERT INTO `x2_city` VALUES (242, '510300', '自贡市', '510000');
INSERT INTO `x2_city` VALUES (243, '510400', '攀枝花市', '510000');
INSERT INTO `x2_city` VALUES (244, '510500', '泸州市', '510000');
INSERT INTO `x2_city` VALUES (245, '510600', '德阳市', '510000');
INSERT INTO `x2_city` VALUES (246, '510700', '绵阳市', '510000');
INSERT INTO `x2_city` VALUES (247, '510800', '广元市', '510000');
INSERT INTO `x2_city` VALUES (248, '510900', '遂宁市', '510000');
INSERT INTO `x2_city` VALUES (249, '511000', '内江市', '510000');
INSERT INTO `x2_city` VALUES (250, '511100', '乐山市', '510000');
INSERT INTO `x2_city` VALUES (251, '511300', '南充市', '510000');
INSERT INTO `x2_city` VALUES (252, '511400', '眉山市', '510000');
INSERT INTO `x2_city` VALUES (253, '511500', '宜宾市', '510000');
INSERT INTO `x2_city` VALUES (254, '511600', '广安市', '510000');
INSERT INTO `x2_city` VALUES (255, '511700', '达州市', '510000');
INSERT INTO `x2_city` VALUES (256, '511800', '雅安市', '510000');
INSERT INTO `x2_city` VALUES (257, '511900', '巴中市', '510000');
INSERT INTO `x2_city` VALUES (258, '512000', '资阳市', '510000');
INSERT INTO `x2_city` VALUES (259, '513200', '阿坝藏族羌族自治州', '510000');
INSERT INTO `x2_city` VALUES (260, '513300', '甘孜藏族自治州', '510000');
INSERT INTO `x2_city` VALUES (261, '513400', '凉山彝族自治州', '510000');
INSERT INTO `x2_city` VALUES (262, '520100', '贵阳市', '520000');
INSERT INTO `x2_city` VALUES (263, '520200', '六盘水市', '520000');
INSERT INTO `x2_city` VALUES (264, '520300', '遵义市', '520000');
INSERT INTO `x2_city` VALUES (265, '520400', '安顺市', '520000');
INSERT INTO `x2_city` VALUES (266, '522200', '铜仁地区', '520000');
INSERT INTO `x2_city` VALUES (267, '522300', '黔西南布依族苗族自治州', '520000');
INSERT INTO `x2_city` VALUES (268, '522400', '毕节地区', '520000');
INSERT INTO `x2_city` VALUES (269, '522600', '黔东南苗族侗族自治州', '520000');
INSERT INTO `x2_city` VALUES (270, '522700', '黔南布依族苗族自治州', '520000');
INSERT INTO `x2_city` VALUES (271, '530100', '昆明市', '530000');
INSERT INTO `x2_city` VALUES (272, '530300', '曲靖市', '530000');
INSERT INTO `x2_city` VALUES (273, '530400', '玉溪市', '530000');
INSERT INTO `x2_city` VALUES (274, '530500', '保山市', '530000');
INSERT INTO `x2_city` VALUES (275, '530600', '昭通市', '530000');
INSERT INTO `x2_city` VALUES (276, '530700', '丽江市', '530000');
INSERT INTO `x2_city` VALUES (277, '530800', '思茅市', '530000');
INSERT INTO `x2_city` VALUES (278, '530900', '临沧市', '530000');
INSERT INTO `x2_city` VALUES (279, '532300', '楚雄彝族自治州', '530000');
INSERT INTO `x2_city` VALUES (280, '532500', '红河哈尼族彝族自治州', '530000');
INSERT INTO `x2_city` VALUES (281, '532600', '文山壮族苗族自治州', '530000');
INSERT INTO `x2_city` VALUES (282, '532800', '西双版纳傣族自治州', '530000');
INSERT INTO `x2_city` VALUES (283, '532900', '大理白族自治州', '530000');
INSERT INTO `x2_city` VALUES (284, '533100', '德宏傣族景颇族自治州', '530000');
INSERT INTO `x2_city` VALUES (285, '533300', '怒江傈僳族自治州', '530000');
INSERT INTO `x2_city` VALUES (286, '533400', '迪庆藏族自治州', '530000');
INSERT INTO `x2_city` VALUES (287, '540100', '拉萨市', '540000');
INSERT INTO `x2_city` VALUES (288, '542100', '昌都地区', '540000');
INSERT INTO `x2_city` VALUES (289, '542200', '山南地区', '540000');
INSERT INTO `x2_city` VALUES (290, '542300', '日喀则地区', '540000');
INSERT INTO `x2_city` VALUES (291, '542400', '那曲地区', '540000');
INSERT INTO `x2_city` VALUES (292, '542500', '阿里地区', '540000');
INSERT INTO `x2_city` VALUES (293, '542600', '林芝地区', '540000');
INSERT INTO `x2_city` VALUES (294, '610100', '西安市', '610000');
INSERT INTO `x2_city` VALUES (295, '610200', '铜川市', '610000');
INSERT INTO `x2_city` VALUES (296, '610300', '宝鸡市', '610000');
INSERT INTO `x2_city` VALUES (297, '610400', '咸阳市', '610000');
INSERT INTO `x2_city` VALUES (298, '610500', '渭南市', '610000');
INSERT INTO `x2_city` VALUES (299, '610600', '延安市', '610000');
INSERT INTO `x2_city` VALUES (300, '610700', '汉中市', '610000');
INSERT INTO `x2_city` VALUES (301, '610800', '榆林市', '610000');
INSERT INTO `x2_city` VALUES (302, '610900', '安康市', '610000');
INSERT INTO `x2_city` VALUES (303, '611000', '商洛市', '610000');
INSERT INTO `x2_city` VALUES (304, '620100', '兰州市', '620000');
INSERT INTO `x2_city` VALUES (305, '620200', '嘉峪关市', '620000');
INSERT INTO `x2_city` VALUES (306, '620300', '金昌市', '620000');
INSERT INTO `x2_city` VALUES (307, '620400', '白银市', '620000');
INSERT INTO `x2_city` VALUES (308, '620500', '天水市', '620000');
INSERT INTO `x2_city` VALUES (309, '620600', '武威市', '620000');
INSERT INTO `x2_city` VALUES (310, '620700', '张掖市', '620000');
INSERT INTO `x2_city` VALUES (311, '620800', '平凉市', '620000');
INSERT INTO `x2_city` VALUES (312, '620900', '酒泉市', '620000');
INSERT INTO `x2_city` VALUES (313, '621000', '庆阳市', '620000');
INSERT INTO `x2_city` VALUES (314, '621100', '定西市', '620000');
INSERT INTO `x2_city` VALUES (315, '621200', '陇南市', '620000');
INSERT INTO `x2_city` VALUES (316, '622900', '临夏回族自治州', '620000');
INSERT INTO `x2_city` VALUES (317, '623000', '甘南藏族自治州', '620000');
INSERT INTO `x2_city` VALUES (318, '630100', '西宁市', '630000');
INSERT INTO `x2_city` VALUES (319, '632100', '海东地区', '630000');
INSERT INTO `x2_city` VALUES (320, '632200', '海北藏族自治州', '630000');
INSERT INTO `x2_city` VALUES (321, '632300', '黄南藏族自治州', '630000');
INSERT INTO `x2_city` VALUES (322, '632500', '海南藏族自治州', '630000');
INSERT INTO `x2_city` VALUES (323, '632600', '果洛藏族自治州', '630000');
INSERT INTO `x2_city` VALUES (324, '632700', '玉树藏族自治州', '630000');
INSERT INTO `x2_city` VALUES (325, '632800', '海西蒙古族藏族自治州', '630000');
INSERT INTO `x2_city` VALUES (326, '640100', '银川市', '640000');
INSERT INTO `x2_city` VALUES (327, '640200', '石嘴山市', '640000');
INSERT INTO `x2_city` VALUES (328, '640300', '吴忠市', '640000');
INSERT INTO `x2_city` VALUES (329, '640400', '固原市', '640000');
INSERT INTO `x2_city` VALUES (330, '640500', '中卫市', '640000');
INSERT INTO `x2_city` VALUES (331, '650100', '乌鲁木齐市', '650000');
INSERT INTO `x2_city` VALUES (332, '650200', '克拉玛依市', '650000');
INSERT INTO `x2_city` VALUES (333, '652100', '吐鲁番地区', '650000');
INSERT INTO `x2_city` VALUES (334, '652200', '哈密地区', '650000');
INSERT INTO `x2_city` VALUES (335, '652300', '昌吉回族自治州', '650000');
INSERT INTO `x2_city` VALUES (336, '652700', '博尔塔拉蒙古自治州', '650000');
INSERT INTO `x2_city` VALUES (337, '652800', '巴音郭楞蒙古自治州', '650000');
INSERT INTO `x2_city` VALUES (338, '652900', '阿克苏地区', '650000');
INSERT INTO `x2_city` VALUES (339, '653000', '克孜勒苏柯尔克孜自治州', '650000');
INSERT INTO `x2_city` VALUES (340, '653100', '喀什地区', '650000');
INSERT INTO `x2_city` VALUES (341, '653200', '和田地区', '650000');
INSERT INTO `x2_city` VALUES (342, '654000', '伊犁哈萨克自治州', '650000');
INSERT INTO `x2_city` VALUES (343, '654200', '塔城地区', '650000');
INSERT INTO `x2_city` VALUES (344, '654300', '阿勒泰地区', '650000');
INSERT INTO `x2_city` VALUES (345, '659000', '省直辖行政单位', '650000');
INSERT INTO `x2_city` VALUES (346, '710100', '台北市', '710000');
INSERT INTO `x2_city` VALUES (347, '710200', '高雄市', '710000');
INSERT INTO `x2_city` VALUES (348, '710300', '基隆市', '710000');
INSERT INTO `x2_city` VALUES (349, '710400', '台中市', '710000');
INSERT INTO `x2_city` VALUES (350, '710500', '台南市', '710000');
INSERT INTO `x2_city` VALUES (351, '710600', '新竹市', '710000');
INSERT INTO `x2_city` VALUES (352, '710700', '嘉义市', '710000');
INSERT INTO `x2_city` VALUES (353, '710800', '台北县', '710000');
INSERT INTO `x2_city` VALUES (354, '710900', '宜兰县', '710000');
INSERT INTO `x2_city` VALUES (355, '711000', '新竹县', '710000');
INSERT INTO `x2_city` VALUES (356, '711100', '桃园县', '710000');
INSERT INTO `x2_city` VALUES (357, '711200', '苗栗县', '710000');
INSERT INTO `x2_city` VALUES (358, '711300', '台中县', '710000');
INSERT INTO `x2_city` VALUES (359, '711400', '彰化县', '710000');
INSERT INTO `x2_city` VALUES (360, '711500', '南投县', '710000');
INSERT INTO `x2_city` VALUES (361, '711600', '嘉义县', '710000');
INSERT INTO `x2_city` VALUES (362, '711700', '云林县', '710000');
INSERT INTO `x2_city` VALUES (363, '711800', '台南县', '710000');
INSERT INTO `x2_city` VALUES (364, '711900', '高雄县', '710000');
INSERT INTO `x2_city` VALUES (365, '712000', '屏东县', '710000');
INSERT INTO `x2_city` VALUES (366, '712100', '台东县', '710000');
INSERT INTO `x2_city` VALUES (367, '712200', '花莲县', '710000');
INSERT INTO `x2_city` VALUES (368, '712300', '澎湖县', '710000');
INSERT INTO `x2_city` VALUES (369, '810100', '香港特别行政区', '810000');
INSERT INTO `x2_city` VALUES (370, '820100', '澳门特别行政区', '820000');

-- ----------------------------
-- Table structure for x2_cityarea
-- ----------------------------
DROP TABLE IF EXISTS `x2_cityarea`;
CREATE TABLE `x2_cityarea`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `areaid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `area` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `father` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `areaid`(`areaid`) USING BTREE,
  INDEX `father`(`father`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 820102 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x2_cityarea
-- ----------------------------
INSERT INTO `x2_cityarea` VALUES (110101, '110101', '东城区', '110100');
INSERT INTO `x2_cityarea` VALUES (110102, '110102', '西城区', '110100');
INSERT INTO `x2_cityarea` VALUES (110103, '110103', '崇文区', '110100');
INSERT INTO `x2_cityarea` VALUES (110104, '110104', '宣武区', '110100');
INSERT INTO `x2_cityarea` VALUES (110105, '110105', '朝阳区', '110100');
INSERT INTO `x2_cityarea` VALUES (110106, '110106', '丰台区', '110100');
INSERT INTO `x2_cityarea` VALUES (110107, '110107', '石景山区', '110100');
INSERT INTO `x2_cityarea` VALUES (110108, '110108', '海淀区', '110100');
INSERT INTO `x2_cityarea` VALUES (110109, '110109', '门头沟区', '110100');
INSERT INTO `x2_cityarea` VALUES (110111, '110111', '房山区', '110100');
INSERT INTO `x2_cityarea` VALUES (110112, '110112', '通州区', '110100');
INSERT INTO `x2_cityarea` VALUES (110113, '110113', '顺义区', '110100');
INSERT INTO `x2_cityarea` VALUES (110114, '110114', '昌平区', '110100');
INSERT INTO `x2_cityarea` VALUES (110115, '110115', '大兴区', '110100');
INSERT INTO `x2_cityarea` VALUES (110116, '110116', '怀柔区', '110100');
INSERT INTO `x2_cityarea` VALUES (110117, '110117', '平谷区', '110100');
INSERT INTO `x2_cityarea` VALUES (110228, '110228', '密云县', '110200');
INSERT INTO `x2_cityarea` VALUES (110229, '110229', '延庆县', '110200');
INSERT INTO `x2_cityarea` VALUES (120101, '120101', '和平区', '120100');
INSERT INTO `x2_cityarea` VALUES (120102, '120102', '河东区', '120100');
INSERT INTO `x2_cityarea` VALUES (120103, '120103', '河西区', '120100');
INSERT INTO `x2_cityarea` VALUES (120104, '120104', '南开区', '120100');
INSERT INTO `x2_cityarea` VALUES (120105, '120105', '河北区', '120100');
INSERT INTO `x2_cityarea` VALUES (120106, '120106', '红桥区', '120100');
INSERT INTO `x2_cityarea` VALUES (120107, '120107', '塘沽区', '120100');
INSERT INTO `x2_cityarea` VALUES (120108, '120108', '汉沽区', '120100');
INSERT INTO `x2_cityarea` VALUES (120109, '120109', '大港区', '120100');
INSERT INTO `x2_cityarea` VALUES (120110, '120110', '东丽区', '120100');
INSERT INTO `x2_cityarea` VALUES (120111, '120111', '西青区', '120100');
INSERT INTO `x2_cityarea` VALUES (120112, '120112', '津南区', '120100');
INSERT INTO `x2_cityarea` VALUES (120113, '120113', '北辰区', '120100');
INSERT INTO `x2_cityarea` VALUES (120114, '120114', '武清区', '120100');
INSERT INTO `x2_cityarea` VALUES (120115, '120115', '宝坻区', '120100');
INSERT INTO `x2_cityarea` VALUES (120221, '120221', '宁河县', '120200');
INSERT INTO `x2_cityarea` VALUES (120223, '120223', '静海县', '120200');
INSERT INTO `x2_cityarea` VALUES (120225, '120225', '蓟　县', '120200');
INSERT INTO `x2_cityarea` VALUES (130101, '130101', '市辖区', '130100');
INSERT INTO `x2_cityarea` VALUES (130102, '130102', '长安区', '130100');
INSERT INTO `x2_cityarea` VALUES (130103, '130103', '桥东区', '130100');
INSERT INTO `x2_cityarea` VALUES (130104, '130104', '桥西区', '130100');
INSERT INTO `x2_cityarea` VALUES (130105, '130105', '新华区', '130100');
INSERT INTO `x2_cityarea` VALUES (130107, '130107', '井陉矿区', '130100');
INSERT INTO `x2_cityarea` VALUES (130108, '130108', '裕华区', '130100');
INSERT INTO `x2_cityarea` VALUES (130121, '130121', '井陉县', '130100');
INSERT INTO `x2_cityarea` VALUES (130123, '130123', '正定县', '130100');
INSERT INTO `x2_cityarea` VALUES (130124, '130124', '栾城县', '130100');
INSERT INTO `x2_cityarea` VALUES (130125, '130125', '行唐县', '130100');
INSERT INTO `x2_cityarea` VALUES (130126, '130126', '灵寿县', '130100');
INSERT INTO `x2_cityarea` VALUES (130127, '130127', '高邑县', '130100');
INSERT INTO `x2_cityarea` VALUES (130128, '130128', '深泽县', '130100');
INSERT INTO `x2_cityarea` VALUES (130129, '130129', '赞皇县', '130100');
INSERT INTO `x2_cityarea` VALUES (130130, '130130', '无极县', '130100');
INSERT INTO `x2_cityarea` VALUES (130131, '130131', '平山县', '130100');
INSERT INTO `x2_cityarea` VALUES (130132, '130132', '元氏县', '130100');
INSERT INTO `x2_cityarea` VALUES (130133, '130133', '赵　县', '130100');
INSERT INTO `x2_cityarea` VALUES (130181, '130181', '辛集市', '130100');
INSERT INTO `x2_cityarea` VALUES (130182, '130182', '藁城市', '130100');
INSERT INTO `x2_cityarea` VALUES (130183, '130183', '晋州市', '130100');
INSERT INTO `x2_cityarea` VALUES (130184, '130184', '新乐市', '130100');
INSERT INTO `x2_cityarea` VALUES (130185, '130185', '鹿泉市', '130100');
INSERT INTO `x2_cityarea` VALUES (130201, '130201', '市辖区', '130200');
INSERT INTO `x2_cityarea` VALUES (130202, '130202', '路南区', '130200');
INSERT INTO `x2_cityarea` VALUES (130203, '130203', '路北区', '130200');
INSERT INTO `x2_cityarea` VALUES (130204, '130204', '古冶区', '130200');
INSERT INTO `x2_cityarea` VALUES (130205, '130205', '开平区', '130200');
INSERT INTO `x2_cityarea` VALUES (130207, '130207', '丰南区', '130200');
INSERT INTO `x2_cityarea` VALUES (130208, '130208', '丰润区', '130200');
INSERT INTO `x2_cityarea` VALUES (130223, '130223', '滦　县', '130200');
INSERT INTO `x2_cityarea` VALUES (130224, '130224', '滦南县', '130200');
INSERT INTO `x2_cityarea` VALUES (130225, '130225', '乐亭县', '130200');
INSERT INTO `x2_cityarea` VALUES (130227, '130227', '迁西县', '130200');
INSERT INTO `x2_cityarea` VALUES (130229, '130229', '玉田县', '130200');
INSERT INTO `x2_cityarea` VALUES (130230, '130230', '唐海县', '130200');
INSERT INTO `x2_cityarea` VALUES (130281, '130281', '遵化市', '130200');
INSERT INTO `x2_cityarea` VALUES (130283, '130283', '迁安市', '130200');
INSERT INTO `x2_cityarea` VALUES (130301, '130301', '市辖区', '130300');
INSERT INTO `x2_cityarea` VALUES (130302, '130302', '海港区', '130300');
INSERT INTO `x2_cityarea` VALUES (130303, '130303', '山海关区', '130300');
INSERT INTO `x2_cityarea` VALUES (130304, '130304', '北戴河区', '130300');
INSERT INTO `x2_cityarea` VALUES (130321, '130321', '青龙满族自治县', '130300');
INSERT INTO `x2_cityarea` VALUES (130322, '130322', '昌黎县', '130300');
INSERT INTO `x2_cityarea` VALUES (130323, '130323', '抚宁县', '130300');
INSERT INTO `x2_cityarea` VALUES (130324, '130324', '卢龙县', '130300');
INSERT INTO `x2_cityarea` VALUES (130401, '130401', '市辖区', '130400');
INSERT INTO `x2_cityarea` VALUES (130402, '130402', '邯山区', '130400');
INSERT INTO `x2_cityarea` VALUES (130403, '130403', '丛台区', '130400');
INSERT INTO `x2_cityarea` VALUES (130404, '130404', '复兴区', '130400');
INSERT INTO `x2_cityarea` VALUES (130406, '130406', '峰峰矿区', '130400');
INSERT INTO `x2_cityarea` VALUES (130421, '130421', '邯郸县', '130400');
INSERT INTO `x2_cityarea` VALUES (130423, '130423', '临漳县', '130400');
INSERT INTO `x2_cityarea` VALUES (130424, '130424', '成安县', '130400');
INSERT INTO `x2_cityarea` VALUES (130425, '130425', '大名县', '130400');
INSERT INTO `x2_cityarea` VALUES (130426, '130426', '涉　县', '130400');
INSERT INTO `x2_cityarea` VALUES (130427, '130427', '磁　县', '130400');
INSERT INTO `x2_cityarea` VALUES (130428, '130428', '肥乡县', '130400');
INSERT INTO `x2_cityarea` VALUES (130429, '130429', '永年县', '130400');
INSERT INTO `x2_cityarea` VALUES (130430, '130430', '邱　县', '130400');
INSERT INTO `x2_cityarea` VALUES (130431, '130431', '鸡泽县', '130400');
INSERT INTO `x2_cityarea` VALUES (130432, '130432', '广平县', '130400');
INSERT INTO `x2_cityarea` VALUES (130433, '130433', '馆陶县', '130400');
INSERT INTO `x2_cityarea` VALUES (130434, '130434', '魏　县', '130400');
INSERT INTO `x2_cityarea` VALUES (130435, '130435', '曲周县', '130400');
INSERT INTO `x2_cityarea` VALUES (130481, '130481', '武安市', '130400');
INSERT INTO `x2_cityarea` VALUES (130501, '130501', '市辖区', '130500');
INSERT INTO `x2_cityarea` VALUES (130502, '130502', '桥东区', '130500');
INSERT INTO `x2_cityarea` VALUES (130503, '130503', '桥西区', '130500');
INSERT INTO `x2_cityarea` VALUES (130521, '130521', '邢台县', '130500');
INSERT INTO `x2_cityarea` VALUES (130522, '130522', '临城县', '130500');
INSERT INTO `x2_cityarea` VALUES (130523, '130523', '内邱县', '130500');
INSERT INTO `x2_cityarea` VALUES (130524, '130524', '柏乡县', '130500');
INSERT INTO `x2_cityarea` VALUES (130525, '130525', '隆尧县', '130500');
INSERT INTO `x2_cityarea` VALUES (130526, '130526', '任　县', '130500');
INSERT INTO `x2_cityarea` VALUES (130527, '130527', '南和县', '130500');
INSERT INTO `x2_cityarea` VALUES (130528, '130528', '宁晋县', '130500');
INSERT INTO `x2_cityarea` VALUES (130529, '130529', '巨鹿县', '130500');
INSERT INTO `x2_cityarea` VALUES (130530, '130530', '新河县', '130500');
INSERT INTO `x2_cityarea` VALUES (130531, '130531', '广宗县', '130500');
INSERT INTO `x2_cityarea` VALUES (130532, '130532', '平乡县', '130500');
INSERT INTO `x2_cityarea` VALUES (130533, '130533', '威　县', '130500');
INSERT INTO `x2_cityarea` VALUES (130534, '130534', '清河县', '130500');
INSERT INTO `x2_cityarea` VALUES (130535, '130535', '临西县', '130500');
INSERT INTO `x2_cityarea` VALUES (130581, '130581', '南宫市', '130500');
INSERT INTO `x2_cityarea` VALUES (130582, '130582', '沙河市', '130500');
INSERT INTO `x2_cityarea` VALUES (130601, '130601', '市辖区', '130600');
INSERT INTO `x2_cityarea` VALUES (130602, '130602', '新市区', '130600');
INSERT INTO `x2_cityarea` VALUES (130603, '130603', '北市区', '130600');
INSERT INTO `x2_cityarea` VALUES (130604, '130604', '南市区', '130600');
INSERT INTO `x2_cityarea` VALUES (130621, '130621', '满城县', '130600');
INSERT INTO `x2_cityarea` VALUES (130622, '130622', '清苑县', '130600');
INSERT INTO `x2_cityarea` VALUES (130623, '130623', '涞水县', '130600');
INSERT INTO `x2_cityarea` VALUES (130624, '130624', '阜平县', '130600');
INSERT INTO `x2_cityarea` VALUES (130625, '130625', '徐水县', '130600');
INSERT INTO `x2_cityarea` VALUES (130626, '130626', '定兴县', '130600');
INSERT INTO `x2_cityarea` VALUES (130627, '130627', '唐　县', '130600');
INSERT INTO `x2_cityarea` VALUES (130628, '130628', '高阳县', '130600');
INSERT INTO `x2_cityarea` VALUES (130629, '130629', '容城县', '130600');
INSERT INTO `x2_cityarea` VALUES (130630, '130630', '涞源县', '130600');
INSERT INTO `x2_cityarea` VALUES (130631, '130631', '望都县', '130600');
INSERT INTO `x2_cityarea` VALUES (130632, '130632', '安新县', '130600');
INSERT INTO `x2_cityarea` VALUES (130633, '130633', '易　县', '130600');
INSERT INTO `x2_cityarea` VALUES (130634, '130634', '曲阳县', '130600');
INSERT INTO `x2_cityarea` VALUES (130635, '130635', '蠡　县', '130600');
INSERT INTO `x2_cityarea` VALUES (130636, '130636', '顺平县', '130600');
INSERT INTO `x2_cityarea` VALUES (130637, '130637', '博野县', '130600');
INSERT INTO `x2_cityarea` VALUES (130638, '130638', '雄　县', '130600');
INSERT INTO `x2_cityarea` VALUES (130681, '130681', '涿州市', '130600');
INSERT INTO `x2_cityarea` VALUES (130682, '130682', '定州市', '130600');
INSERT INTO `x2_cityarea` VALUES (130683, '130683', '安国市', '130600');
INSERT INTO `x2_cityarea` VALUES (130684, '130684', '高碑店市', '130600');
INSERT INTO `x2_cityarea` VALUES (130701, '130701', '市辖区', '130700');
INSERT INTO `x2_cityarea` VALUES (130702, '130702', '桥东区', '130700');
INSERT INTO `x2_cityarea` VALUES (130703, '130703', '桥西区', '130700');
INSERT INTO `x2_cityarea` VALUES (130705, '130705', '宣化区', '130700');
INSERT INTO `x2_cityarea` VALUES (130706, '130706', '下花园区', '130700');
INSERT INTO `x2_cityarea` VALUES (130721, '130721', '宣化县', '130700');
INSERT INTO `x2_cityarea` VALUES (130722, '130722', '张北县', '130700');
INSERT INTO `x2_cityarea` VALUES (130723, '130723', '康保县', '130700');
INSERT INTO `x2_cityarea` VALUES (130724, '130724', '沽源县', '130700');
INSERT INTO `x2_cityarea` VALUES (130725, '130725', '尚义县', '130700');
INSERT INTO `x2_cityarea` VALUES (130726, '130726', '蔚　县', '130700');
INSERT INTO `x2_cityarea` VALUES (130727, '130727', '阳原县', '130700');
INSERT INTO `x2_cityarea` VALUES (130728, '130728', '怀安县', '130700');
INSERT INTO `x2_cityarea` VALUES (130729, '130729', '万全县', '130700');
INSERT INTO `x2_cityarea` VALUES (130730, '130730', '怀来县', '130700');
INSERT INTO `x2_cityarea` VALUES (130731, '130731', '涿鹿县', '130700');
INSERT INTO `x2_cityarea` VALUES (130732, '130732', '赤城县', '130700');
INSERT INTO `x2_cityarea` VALUES (130733, '130733', '崇礼县', '130700');
INSERT INTO `x2_cityarea` VALUES (130801, '130801', '市辖区', '130800');
INSERT INTO `x2_cityarea` VALUES (130802, '130802', '双桥区', '130800');
INSERT INTO `x2_cityarea` VALUES (130803, '130803', '双滦区', '130800');
INSERT INTO `x2_cityarea` VALUES (130804, '130804', '鹰手营子矿区', '130800');
INSERT INTO `x2_cityarea` VALUES (130821, '130821', '承德县', '130800');
INSERT INTO `x2_cityarea` VALUES (130822, '130822', '兴隆县', '130800');
INSERT INTO `x2_cityarea` VALUES (130823, '130823', '平泉县', '130800');
INSERT INTO `x2_cityarea` VALUES (130824, '130824', '滦平县', '130800');
INSERT INTO `x2_cityarea` VALUES (130825, '130825', '隆化县', '130800');
INSERT INTO `x2_cityarea` VALUES (130826, '130826', '丰宁满族自治县', '130800');
INSERT INTO `x2_cityarea` VALUES (130827, '130827', '宽城满族自治县', '130800');
INSERT INTO `x2_cityarea` VALUES (130828, '130828', '围场满族蒙古族自治县', '130800');
INSERT INTO `x2_cityarea` VALUES (130901, '130901', '市辖区', '130900');
INSERT INTO `x2_cityarea` VALUES (130902, '130902', '新华区', '130900');
INSERT INTO `x2_cityarea` VALUES (130903, '130903', '运河区', '130900');
INSERT INTO `x2_cityarea` VALUES (130921, '130921', '沧　县', '130900');
INSERT INTO `x2_cityarea` VALUES (130922, '130922', '青　县', '130900');
INSERT INTO `x2_cityarea` VALUES (130923, '130923', '东光县', '130900');
INSERT INTO `x2_cityarea` VALUES (130924, '130924', '海兴县', '130900');
INSERT INTO `x2_cityarea` VALUES (130925, '130925', '盐山县', '130900');
INSERT INTO `x2_cityarea` VALUES (130926, '130926', '肃宁县', '130900');
INSERT INTO `x2_cityarea` VALUES (130927, '130927', '南皮县', '130900');
INSERT INTO `x2_cityarea` VALUES (130928, '130928', '吴桥县', '130900');
INSERT INTO `x2_cityarea` VALUES (130929, '130929', '献　县', '130900');
INSERT INTO `x2_cityarea` VALUES (130930, '130930', '孟村回族自治县', '130900');
INSERT INTO `x2_cityarea` VALUES (130981, '130981', '泊头市', '130900');
INSERT INTO `x2_cityarea` VALUES (130982, '130982', '任丘市', '130900');
INSERT INTO `x2_cityarea` VALUES (130983, '130983', '黄骅市', '130900');
INSERT INTO `x2_cityarea` VALUES (130984, '130984', '河间市', '130900');
INSERT INTO `x2_cityarea` VALUES (131001, '131001', '市辖区', '131000');
INSERT INTO `x2_cityarea` VALUES (131002, '131002', '安次区', '131000');
INSERT INTO `x2_cityarea` VALUES (131003, '131003', '广阳区', '131000');
INSERT INTO `x2_cityarea` VALUES (131022, '131022', '固安县', '131000');
INSERT INTO `x2_cityarea` VALUES (131023, '131023', '永清县', '131000');
INSERT INTO `x2_cityarea` VALUES (131024, '131024', '香河县', '131000');
INSERT INTO `x2_cityarea` VALUES (131025, '131025', '大城县', '131000');
INSERT INTO `x2_cityarea` VALUES (131026, '131026', '文安县', '131000');
INSERT INTO `x2_cityarea` VALUES (131028, '131028', '大厂回族自治县', '131000');
INSERT INTO `x2_cityarea` VALUES (131081, '131081', '霸州市', '131000');
INSERT INTO `x2_cityarea` VALUES (131082, '131082', '三河市', '131000');
INSERT INTO `x2_cityarea` VALUES (131101, '131101', '市辖区', '131100');
INSERT INTO `x2_cityarea` VALUES (131102, '131102', '桃城区', '131100');
INSERT INTO `x2_cityarea` VALUES (131121, '131121', '枣强县', '131100');
INSERT INTO `x2_cityarea` VALUES (131122, '131122', '武邑县', '131100');
INSERT INTO `x2_cityarea` VALUES (131123, '131123', '武强县', '131100');
INSERT INTO `x2_cityarea` VALUES (131124, '131124', '饶阳县', '131100');
INSERT INTO `x2_cityarea` VALUES (131125, '131125', '安平县', '131100');
INSERT INTO `x2_cityarea` VALUES (131126, '131126', '故城县', '131100');
INSERT INTO `x2_cityarea` VALUES (131127, '131127', '景　县', '131100');
INSERT INTO `x2_cityarea` VALUES (131128, '131128', '阜城县', '131100');
INSERT INTO `x2_cityarea` VALUES (131181, '131181', '冀州市', '131100');
INSERT INTO `x2_cityarea` VALUES (131182, '131182', '深州市', '131100');
INSERT INTO `x2_cityarea` VALUES (140101, '140101', '市辖区', '140100');
INSERT INTO `x2_cityarea` VALUES (140105, '140105', '小店区', '140100');
INSERT INTO `x2_cityarea` VALUES (140106, '140106', '迎泽区', '140100');
INSERT INTO `x2_cityarea` VALUES (140107, '140107', '杏花岭区', '140100');
INSERT INTO `x2_cityarea` VALUES (140108, '140108', '尖草坪区', '140100');
INSERT INTO `x2_cityarea` VALUES (140109, '140109', '万柏林区', '140100');
INSERT INTO `x2_cityarea` VALUES (140110, '140110', '晋源区', '140100');
INSERT INTO `x2_cityarea` VALUES (140121, '140121', '清徐县', '140100');
INSERT INTO `x2_cityarea` VALUES (140122, '140122', '阳曲县', '140100');
INSERT INTO `x2_cityarea` VALUES (140123, '140123', '娄烦县', '140100');
INSERT INTO `x2_cityarea` VALUES (140181, '140181', '古交市', '140100');
INSERT INTO `x2_cityarea` VALUES (140201, '140201', '市辖区', '140200');
INSERT INTO `x2_cityarea` VALUES (140202, '140202', '城　区', '140200');
INSERT INTO `x2_cityarea` VALUES (140203, '140203', '矿　区', '140200');
INSERT INTO `x2_cityarea` VALUES (140211, '140211', '南郊区', '140200');
INSERT INTO `x2_cityarea` VALUES (140212, '140212', '新荣区', '140200');
INSERT INTO `x2_cityarea` VALUES (140221, '140221', '阳高县', '140200');
INSERT INTO `x2_cityarea` VALUES (140222, '140222', '天镇县', '140200');
INSERT INTO `x2_cityarea` VALUES (140223, '140223', '广灵县', '140200');
INSERT INTO `x2_cityarea` VALUES (140224, '140224', '灵丘县', '140200');
INSERT INTO `x2_cityarea` VALUES (140225, '140225', '浑源县', '140200');
INSERT INTO `x2_cityarea` VALUES (140226, '140226', '左云县', '140200');
INSERT INTO `x2_cityarea` VALUES (140227, '140227', '大同县', '140200');
INSERT INTO `x2_cityarea` VALUES (140301, '140301', '市辖区', '140300');
INSERT INTO `x2_cityarea` VALUES (140302, '140302', '城　区', '140300');
INSERT INTO `x2_cityarea` VALUES (140303, '140303', '矿　区', '140300');
INSERT INTO `x2_cityarea` VALUES (140311, '140311', '郊　区', '140300');
INSERT INTO `x2_cityarea` VALUES (140321, '140321', '平定县', '140300');
INSERT INTO `x2_cityarea` VALUES (140322, '140322', '盂　县', '140300');
INSERT INTO `x2_cityarea` VALUES (140401, '140401', '市辖区', '140400');
INSERT INTO `x2_cityarea` VALUES (140402, '140402', '城　区', '140400');
INSERT INTO `x2_cityarea` VALUES (140411, '140411', '郊　区', '140400');
INSERT INTO `x2_cityarea` VALUES (140421, '140421', '长治县', '140400');
INSERT INTO `x2_cityarea` VALUES (140423, '140423', '襄垣县', '140400');
INSERT INTO `x2_cityarea` VALUES (140424, '140424', '屯留县', '140400');
INSERT INTO `x2_cityarea` VALUES (140425, '140425', '平顺县', '140400');
INSERT INTO `x2_cityarea` VALUES (140426, '140426', '黎城县', '140400');
INSERT INTO `x2_cityarea` VALUES (140427, '140427', '壶关县', '140400');
INSERT INTO `x2_cityarea` VALUES (140428, '140428', '长子县', '140400');
INSERT INTO `x2_cityarea` VALUES (140429, '140429', '武乡县', '140400');
INSERT INTO `x2_cityarea` VALUES (140430, '140430', '沁　县', '140400');
INSERT INTO `x2_cityarea` VALUES (140431, '140431', '沁源县', '140400');
INSERT INTO `x2_cityarea` VALUES (140481, '140481', '潞城市', '140400');
INSERT INTO `x2_cityarea` VALUES (140501, '140501', '市辖区', '140500');
INSERT INTO `x2_cityarea` VALUES (140502, '140502', '城　区', '140500');
INSERT INTO `x2_cityarea` VALUES (140521, '140521', '沁水县', '140500');
INSERT INTO `x2_cityarea` VALUES (140522, '140522', '阳城县', '140500');
INSERT INTO `x2_cityarea` VALUES (140524, '140524', '陵川县', '140500');
INSERT INTO `x2_cityarea` VALUES (140525, '140525', '泽州县', '140500');
INSERT INTO `x2_cityarea` VALUES (140581, '140581', '高平市', '140500');
INSERT INTO `x2_cityarea` VALUES (140601, '140601', '市辖区', '140600');
INSERT INTO `x2_cityarea` VALUES (140602, '140602', '朔城区', '140600');
INSERT INTO `x2_cityarea` VALUES (140603, '140603', '平鲁区', '140600');
INSERT INTO `x2_cityarea` VALUES (140621, '140621', '山阴县', '140600');
INSERT INTO `x2_cityarea` VALUES (140622, '140622', '应　县', '140600');
INSERT INTO `x2_cityarea` VALUES (140623, '140623', '右玉县', '140600');
INSERT INTO `x2_cityarea` VALUES (140624, '140624', '怀仁县', '140600');
INSERT INTO `x2_cityarea` VALUES (140701, '140701', '市辖区', '140700');
INSERT INTO `x2_cityarea` VALUES (140702, '140702', '榆次区', '140700');
INSERT INTO `x2_cityarea` VALUES (140721, '140721', '榆社县', '140700');
INSERT INTO `x2_cityarea` VALUES (140722, '140722', '左权县', '140700');
INSERT INTO `x2_cityarea` VALUES (140723, '140723', '和顺县', '140700');
INSERT INTO `x2_cityarea` VALUES (140724, '140724', '昔阳县', '140700');
INSERT INTO `x2_cityarea` VALUES (140725, '140725', '寿阳县', '140700');
INSERT INTO `x2_cityarea` VALUES (140726, '140726', '太谷县', '140700');
INSERT INTO `x2_cityarea` VALUES (140727, '140727', '祁　县', '140700');
INSERT INTO `x2_cityarea` VALUES (140728, '140728', '平遥县', '140700');
INSERT INTO `x2_cityarea` VALUES (140729, '140729', '灵石县', '140700');
INSERT INTO `x2_cityarea` VALUES (140781, '140781', '介休市', '140700');
INSERT INTO `x2_cityarea` VALUES (140801, '140801', '市辖区', '140800');
INSERT INTO `x2_cityarea` VALUES (140802, '140802', '盐湖区', '140800');
INSERT INTO `x2_cityarea` VALUES (140821, '140821', '临猗县', '140800');
INSERT INTO `x2_cityarea` VALUES (140822, '140822', '万荣县', '140800');
INSERT INTO `x2_cityarea` VALUES (140823, '140823', '闻喜县', '140800');
INSERT INTO `x2_cityarea` VALUES (140824, '140824', '稷山县', '140800');
INSERT INTO `x2_cityarea` VALUES (140825, '140825', '新绛县', '140800');
INSERT INTO `x2_cityarea` VALUES (140826, '140826', '绛　县', '140800');
INSERT INTO `x2_cityarea` VALUES (140827, '140827', '垣曲县', '140800');
INSERT INTO `x2_cityarea` VALUES (140828, '140828', '夏　县', '140800');
INSERT INTO `x2_cityarea` VALUES (140829, '140829', '平陆县', '140800');
INSERT INTO `x2_cityarea` VALUES (140830, '140830', '芮城县', '140800');
INSERT INTO `x2_cityarea` VALUES (140881, '140881', '永济市', '140800');
INSERT INTO `x2_cityarea` VALUES (140882, '140882', '河津市', '140800');
INSERT INTO `x2_cityarea` VALUES (140901, '140901', '市辖区', '140900');
INSERT INTO `x2_cityarea` VALUES (140902, '140902', '忻府区', '140900');
INSERT INTO `x2_cityarea` VALUES (140921, '140921', '定襄县', '140900');
INSERT INTO `x2_cityarea` VALUES (140922, '140922', '五台县', '140900');
INSERT INTO `x2_cityarea` VALUES (140923, '140923', '代　县', '140900');
INSERT INTO `x2_cityarea` VALUES (140924, '140924', '繁峙县', '140900');
INSERT INTO `x2_cityarea` VALUES (140925, '140925', '宁武县', '140900');
INSERT INTO `x2_cityarea` VALUES (140926, '140926', '静乐县', '140900');
INSERT INTO `x2_cityarea` VALUES (140927, '140927', '神池县', '140900');
INSERT INTO `x2_cityarea` VALUES (140928, '140928', '五寨县', '140900');
INSERT INTO `x2_cityarea` VALUES (140929, '140929', '岢岚县', '140900');
INSERT INTO `x2_cityarea` VALUES (140930, '140930', '河曲县', '140900');
INSERT INTO `x2_cityarea` VALUES (140931, '140931', '保德县', '140900');
INSERT INTO `x2_cityarea` VALUES (140932, '140932', '偏关县', '140900');
INSERT INTO `x2_cityarea` VALUES (140981, '140981', '原平市', '140900');
INSERT INTO `x2_cityarea` VALUES (141001, '141001', '市辖区', '141000');
INSERT INTO `x2_cityarea` VALUES (141002, '141002', '尧都区', '141000');
INSERT INTO `x2_cityarea` VALUES (141021, '141021', '曲沃县', '141000');
INSERT INTO `x2_cityarea` VALUES (141022, '141022', '翼城县', '141000');
INSERT INTO `x2_cityarea` VALUES (141023, '141023', '襄汾县', '141000');
INSERT INTO `x2_cityarea` VALUES (141024, '141024', '洪洞县', '141000');
INSERT INTO `x2_cityarea` VALUES (141025, '141025', '古　县', '141000');
INSERT INTO `x2_cityarea` VALUES (141026, '141026', '安泽县', '141000');
INSERT INTO `x2_cityarea` VALUES (141027, '141027', '浮山县', '141000');
INSERT INTO `x2_cityarea` VALUES (141028, '141028', '吉　县', '141000');
INSERT INTO `x2_cityarea` VALUES (141029, '141029', '乡宁县', '141000');
INSERT INTO `x2_cityarea` VALUES (141030, '141030', '大宁县', '141000');
INSERT INTO `x2_cityarea` VALUES (141031, '141031', '隰　县', '141000');
INSERT INTO `x2_cityarea` VALUES (141032, '141032', '永和县', '141000');
INSERT INTO `x2_cityarea` VALUES (141033, '141033', '蒲　县', '141000');
INSERT INTO `x2_cityarea` VALUES (141034, '141034', '汾西县', '141000');
INSERT INTO `x2_cityarea` VALUES (141081, '141081', '侯马市', '141000');
INSERT INTO `x2_cityarea` VALUES (141082, '141082', '霍州市', '141000');
INSERT INTO `x2_cityarea` VALUES (141101, '141101', '市辖区', '141100');
INSERT INTO `x2_cityarea` VALUES (141102, '141102', '离石区', '141100');
INSERT INTO `x2_cityarea` VALUES (141121, '141121', '文水县', '141100');
INSERT INTO `x2_cityarea` VALUES (141122, '141122', '交城县', '141100');
INSERT INTO `x2_cityarea` VALUES (141123, '141123', '兴　县', '141100');
INSERT INTO `x2_cityarea` VALUES (141124, '141124', '临　县', '141100');
INSERT INTO `x2_cityarea` VALUES (141125, '141125', '柳林县', '141100');
INSERT INTO `x2_cityarea` VALUES (141126, '141126', '石楼县', '141100');
INSERT INTO `x2_cityarea` VALUES (141127, '141127', '岚　县', '141100');
INSERT INTO `x2_cityarea` VALUES (141128, '141128', '方山县', '141100');
INSERT INTO `x2_cityarea` VALUES (141129, '141129', '中阳县', '141100');
INSERT INTO `x2_cityarea` VALUES (141130, '141130', '交口县', '141100');
INSERT INTO `x2_cityarea` VALUES (141181, '141181', '孝义市', '141100');
INSERT INTO `x2_cityarea` VALUES (141182, '141182', '汾阳市', '141100');
INSERT INTO `x2_cityarea` VALUES (150101, '150101', '市辖区', '150100');
INSERT INTO `x2_cityarea` VALUES (150102, '150102', '新城区', '150100');
INSERT INTO `x2_cityarea` VALUES (150103, '150103', '回民区', '150100');
INSERT INTO `x2_cityarea` VALUES (150104, '150104', '玉泉区', '150100');
INSERT INTO `x2_cityarea` VALUES (150105, '150105', '赛罕区', '150100');
INSERT INTO `x2_cityarea` VALUES (150121, '150121', '土默特左旗', '150100');
INSERT INTO `x2_cityarea` VALUES (150122, '150122', '托克托县', '150100');
INSERT INTO `x2_cityarea` VALUES (150123, '150123', '和林格尔县', '150100');
INSERT INTO `x2_cityarea` VALUES (150124, '150124', '清水河县', '150100');
INSERT INTO `x2_cityarea` VALUES (150125, '150125', '武川县', '150100');
INSERT INTO `x2_cityarea` VALUES (150201, '150201', '市辖区', '150200');
INSERT INTO `x2_cityarea` VALUES (150202, '150202', '东河区', '150200');
INSERT INTO `x2_cityarea` VALUES (150203, '150203', '昆都仑区', '150200');
INSERT INTO `x2_cityarea` VALUES (150204, '150204', '青山区', '150200');
INSERT INTO `x2_cityarea` VALUES (150205, '150205', '石拐区', '150200');
INSERT INTO `x2_cityarea` VALUES (150206, '150206', '白云矿区', '150200');
INSERT INTO `x2_cityarea` VALUES (150207, '150207', '九原区', '150200');
INSERT INTO `x2_cityarea` VALUES (150221, '150221', '土默特右旗', '150200');
INSERT INTO `x2_cityarea` VALUES (150222, '150222', '固阳县', '150200');
INSERT INTO `x2_cityarea` VALUES (150223, '150223', '达尔罕茂明安联合旗', '150200');
INSERT INTO `x2_cityarea` VALUES (150301, '150301', '市辖区', '150300');
INSERT INTO `x2_cityarea` VALUES (150302, '150302', '海勃湾区', '150300');
INSERT INTO `x2_cityarea` VALUES (150303, '150303', '海南区', '150300');
INSERT INTO `x2_cityarea` VALUES (150304, '150304', '乌达区', '150300');
INSERT INTO `x2_cityarea` VALUES (150401, '150401', '市辖区', '150400');
INSERT INTO `x2_cityarea` VALUES (150402, '150402', '红山区', '150400');
INSERT INTO `x2_cityarea` VALUES (150403, '150403', '元宝山区', '150400');
INSERT INTO `x2_cityarea` VALUES (150404, '150404', '松山区', '150400');
INSERT INTO `x2_cityarea` VALUES (150421, '150421', '阿鲁科尔沁旗', '150400');
INSERT INTO `x2_cityarea` VALUES (150422, '150422', '巴林左旗', '150400');
INSERT INTO `x2_cityarea` VALUES (150423, '150423', '巴林右旗', '150400');
INSERT INTO `x2_cityarea` VALUES (150424, '150424', '林西县', '150400');
INSERT INTO `x2_cityarea` VALUES (150425, '150425', '克什克腾旗', '150400');
INSERT INTO `x2_cityarea` VALUES (150426, '150426', '翁牛特旗', '150400');
INSERT INTO `x2_cityarea` VALUES (150428, '150428', '喀喇沁旗', '150400');
INSERT INTO `x2_cityarea` VALUES (150429, '150429', '宁城县', '150400');
INSERT INTO `x2_cityarea` VALUES (150430, '150430', '敖汉旗', '150400');
INSERT INTO `x2_cityarea` VALUES (150501, '150501', '市辖区', '150500');
INSERT INTO `x2_cityarea` VALUES (150502, '150502', '科尔沁区', '150500');
INSERT INTO `x2_cityarea` VALUES (150521, '150521', '科尔沁左翼中旗', '150500');
INSERT INTO `x2_cityarea` VALUES (150522, '150522', '科尔沁左翼后旗', '150500');
INSERT INTO `x2_cityarea` VALUES (150523, '150523', '开鲁县', '150500');
INSERT INTO `x2_cityarea` VALUES (150524, '150524', '库伦旗', '150500');
INSERT INTO `x2_cityarea` VALUES (150525, '150525', '奈曼旗', '150500');
INSERT INTO `x2_cityarea` VALUES (150526, '150526', '扎鲁特旗', '150500');
INSERT INTO `x2_cityarea` VALUES (150581, '150581', '霍林郭勒市', '150500');
INSERT INTO `x2_cityarea` VALUES (150602, '150602', '东胜区', '150600');
INSERT INTO `x2_cityarea` VALUES (150621, '150621', '达拉特旗', '150600');
INSERT INTO `x2_cityarea` VALUES (150622, '150622', '准格尔旗', '150600');
INSERT INTO `x2_cityarea` VALUES (150623, '150623', '鄂托克前旗', '150600');
INSERT INTO `x2_cityarea` VALUES (150624, '150624', '鄂托克旗', '150600');
INSERT INTO `x2_cityarea` VALUES (150625, '150625', '杭锦旗', '150600');
INSERT INTO `x2_cityarea` VALUES (150626, '150626', '乌审旗', '150600');
INSERT INTO `x2_cityarea` VALUES (150627, '150627', '伊金霍洛旗', '150600');
INSERT INTO `x2_cityarea` VALUES (150701, '150701', '市辖区', '150700');
INSERT INTO `x2_cityarea` VALUES (150702, '150702', '海拉尔区', '150700');
INSERT INTO `x2_cityarea` VALUES (150721, '150721', '阿荣旗', '150700');
INSERT INTO `x2_cityarea` VALUES (150722, '150722', '莫力达瓦达斡尔族自治旗', '150700');
INSERT INTO `x2_cityarea` VALUES (150723, '150723', '鄂伦春自治旗', '150700');
INSERT INTO `x2_cityarea` VALUES (150724, '150724', '鄂温克族自治旗', '150700');
INSERT INTO `x2_cityarea` VALUES (150725, '150725', '陈巴尔虎旗', '150700');
INSERT INTO `x2_cityarea` VALUES (150726, '150726', '新巴尔虎左旗', '150700');
INSERT INTO `x2_cityarea` VALUES (150727, '150727', '新巴尔虎右旗', '150700');
INSERT INTO `x2_cityarea` VALUES (150781, '150781', '满洲里市', '150700');
INSERT INTO `x2_cityarea` VALUES (150782, '150782', '牙克石市', '150700');
INSERT INTO `x2_cityarea` VALUES (150783, '150783', '扎兰屯市', '150700');
INSERT INTO `x2_cityarea` VALUES (150784, '150784', '额尔古纳市', '150700');
INSERT INTO `x2_cityarea` VALUES (150785, '150785', '根河市', '150700');
INSERT INTO `x2_cityarea` VALUES (150801, '150801', '市辖区', '150800');
INSERT INTO `x2_cityarea` VALUES (150802, '150802', '临河区', '150800');
INSERT INTO `x2_cityarea` VALUES (150821, '150821', '五原县', '150800');
INSERT INTO `x2_cityarea` VALUES (150822, '150822', '磴口县', '150800');
INSERT INTO `x2_cityarea` VALUES (150823, '150823', '乌拉特前旗', '150800');
INSERT INTO `x2_cityarea` VALUES (150824, '150824', '乌拉特中旗', '150800');
INSERT INTO `x2_cityarea` VALUES (150825, '150825', '乌拉特后旗', '150800');
INSERT INTO `x2_cityarea` VALUES (150826, '150826', '杭锦后旗', '150800');
INSERT INTO `x2_cityarea` VALUES (150901, '150901', '市辖区', '150900');
INSERT INTO `x2_cityarea` VALUES (150902, '150902', '集宁区', '150900');
INSERT INTO `x2_cityarea` VALUES (150921, '150921', '卓资县', '150900');
INSERT INTO `x2_cityarea` VALUES (150922, '150922', '化德县', '150900');
INSERT INTO `x2_cityarea` VALUES (150923, '150923', '商都县', '150900');
INSERT INTO `x2_cityarea` VALUES (150924, '150924', '兴和县', '150900');
INSERT INTO `x2_cityarea` VALUES (150925, '150925', '凉城县', '150900');
INSERT INTO `x2_cityarea` VALUES (150926, '150926', '察哈尔右翼前旗', '150900');
INSERT INTO `x2_cityarea` VALUES (150927, '150927', '察哈尔右翼中旗', '150900');
INSERT INTO `x2_cityarea` VALUES (150928, '150928', '察哈尔右翼后旗', '150900');
INSERT INTO `x2_cityarea` VALUES (150929, '150929', '四子王旗', '150900');
INSERT INTO `x2_cityarea` VALUES (150981, '150981', '丰镇市', '150900');
INSERT INTO `x2_cityarea` VALUES (152201, '152201', '乌兰浩特市', '152200');
INSERT INTO `x2_cityarea` VALUES (152202, '152202', '阿尔山市', '152200');
INSERT INTO `x2_cityarea` VALUES (152221, '152221', '科尔沁右翼前旗', '152200');
INSERT INTO `x2_cityarea` VALUES (152222, '152222', '科尔沁右翼中旗', '152200');
INSERT INTO `x2_cityarea` VALUES (152223, '152223', '扎赉特旗', '152200');
INSERT INTO `x2_cityarea` VALUES (152224, '152224', '突泉县', '152200');
INSERT INTO `x2_cityarea` VALUES (152501, '152501', '二连浩特市', '152500');
INSERT INTO `x2_cityarea` VALUES (152502, '152502', '锡林浩特市', '152500');
INSERT INTO `x2_cityarea` VALUES (152522, '152522', '阿巴嘎旗', '152500');
INSERT INTO `x2_cityarea` VALUES (152523, '152523', '苏尼特左旗', '152500');
INSERT INTO `x2_cityarea` VALUES (152524, '152524', '苏尼特右旗', '152500');
INSERT INTO `x2_cityarea` VALUES (152525, '152525', '东乌珠穆沁旗', '152500');
INSERT INTO `x2_cityarea` VALUES (152526, '152526', '西乌珠穆沁旗', '152500');
INSERT INTO `x2_cityarea` VALUES (152527, '152527', '太仆寺旗', '152500');
INSERT INTO `x2_cityarea` VALUES (152528, '152528', '镶黄旗', '152500');
INSERT INTO `x2_cityarea` VALUES (152529, '152529', '正镶白旗', '152500');
INSERT INTO `x2_cityarea` VALUES (152530, '152530', '正蓝旗', '152500');
INSERT INTO `x2_cityarea` VALUES (152531, '152531', '多伦县', '152500');
INSERT INTO `x2_cityarea` VALUES (152921, '152921', '阿拉善左旗', '152900');
INSERT INTO `x2_cityarea` VALUES (152922, '152922', '阿拉善右旗', '152900');
INSERT INTO `x2_cityarea` VALUES (152923, '152923', '额济纳旗', '152900');
INSERT INTO `x2_cityarea` VALUES (210101, '210101', '市辖区', '210100');
INSERT INTO `x2_cityarea` VALUES (210102, '210102', '和平区', '210100');
INSERT INTO `x2_cityarea` VALUES (210103, '210103', '沈河区', '210100');
INSERT INTO `x2_cityarea` VALUES (210104, '210104', '大东区', '210100');
INSERT INTO `x2_cityarea` VALUES (210105, '210105', '皇姑区', '210100');
INSERT INTO `x2_cityarea` VALUES (210106, '210106', '铁西区', '210100');
INSERT INTO `x2_cityarea` VALUES (210111, '210111', '苏家屯区', '210100');
INSERT INTO `x2_cityarea` VALUES (210112, '210112', '东陵区', '210100');
INSERT INTO `x2_cityarea` VALUES (210113, '210113', '新城子区', '210100');
INSERT INTO `x2_cityarea` VALUES (210114, '210114', '于洪区', '210100');
INSERT INTO `x2_cityarea` VALUES (210122, '210122', '辽中县', '210100');
INSERT INTO `x2_cityarea` VALUES (210123, '210123', '康平县', '210100');
INSERT INTO `x2_cityarea` VALUES (210124, '210124', '法库县', '210100');
INSERT INTO `x2_cityarea` VALUES (210181, '210181', '新民市', '210100');
INSERT INTO `x2_cityarea` VALUES (210201, '210201', '市辖区', '210200');
INSERT INTO `x2_cityarea` VALUES (210202, '210202', '中山区', '210200');
INSERT INTO `x2_cityarea` VALUES (210203, '210203', '西岗区', '210200');
INSERT INTO `x2_cityarea` VALUES (210204, '210204', '沙河口区', '210200');
INSERT INTO `x2_cityarea` VALUES (210211, '210211', '甘井子区', '210200');
INSERT INTO `x2_cityarea` VALUES (210212, '210212', '旅顺口区', '210200');
INSERT INTO `x2_cityarea` VALUES (210213, '210213', '金州区', '210200');
INSERT INTO `x2_cityarea` VALUES (210224, '210224', '长海县', '210200');
INSERT INTO `x2_cityarea` VALUES (210281, '210281', '瓦房店市', '210200');
INSERT INTO `x2_cityarea` VALUES (210282, '210282', '普兰店市', '210200');
INSERT INTO `x2_cityarea` VALUES (210283, '210283', '庄河市', '210200');
INSERT INTO `x2_cityarea` VALUES (210301, '210301', '市辖区', '210300');
INSERT INTO `x2_cityarea` VALUES (210302, '210302', '铁东区', '210300');
INSERT INTO `x2_cityarea` VALUES (210303, '210303', '铁西区', '210300');
INSERT INTO `x2_cityarea` VALUES (210304, '210304', '立山区', '210300');
INSERT INTO `x2_cityarea` VALUES (210311, '210311', '千山区', '210300');
INSERT INTO `x2_cityarea` VALUES (210321, '210321', '台安县', '210300');
INSERT INTO `x2_cityarea` VALUES (210323, '210323', '岫岩满族自治县', '210300');
INSERT INTO `x2_cityarea` VALUES (210381, '210381', '海城市', '210300');
INSERT INTO `x2_cityarea` VALUES (210401, '210401', '市辖区', '210400');
INSERT INTO `x2_cityarea` VALUES (210402, '210402', '新抚区', '210400');
INSERT INTO `x2_cityarea` VALUES (210403, '210403', '东洲区', '210400');
INSERT INTO `x2_cityarea` VALUES (210404, '210404', '望花区', '210400');
INSERT INTO `x2_cityarea` VALUES (210411, '210411', '顺城区', '210400');
INSERT INTO `x2_cityarea` VALUES (210421, '210421', '抚顺县', '210400');
INSERT INTO `x2_cityarea` VALUES (210422, '210422', '新宾满族自治县', '210400');
INSERT INTO `x2_cityarea` VALUES (210423, '210423', '清原满族自治县', '210400');
INSERT INTO `x2_cityarea` VALUES (210501, '210501', '市辖区', '210500');
INSERT INTO `x2_cityarea` VALUES (210502, '210502', '平山区', '210500');
INSERT INTO `x2_cityarea` VALUES (210503, '210503', '溪湖区', '210500');
INSERT INTO `x2_cityarea` VALUES (210504, '210504', '明山区', '210500');
INSERT INTO `x2_cityarea` VALUES (210505, '210505', '南芬区', '210500');
INSERT INTO `x2_cityarea` VALUES (210521, '210521', '本溪满族自治县', '210500');
INSERT INTO `x2_cityarea` VALUES (210522, '210522', '桓仁满族自治县', '210500');
INSERT INTO `x2_cityarea` VALUES (210601, '210601', '市辖区', '210600');
INSERT INTO `x2_cityarea` VALUES (210602, '210602', '元宝区', '210600');
INSERT INTO `x2_cityarea` VALUES (210603, '210603', '振兴区', '210600');
INSERT INTO `x2_cityarea` VALUES (210604, '210604', '振安区', '210600');
INSERT INTO `x2_cityarea` VALUES (210624, '210624', '宽甸满族自治县', '210600');
INSERT INTO `x2_cityarea` VALUES (210681, '210681', '东港市', '210600');
INSERT INTO `x2_cityarea` VALUES (210682, '210682', '凤城市', '210600');
INSERT INTO `x2_cityarea` VALUES (210701, '210701', '市辖区', '210700');
INSERT INTO `x2_cityarea` VALUES (210702, '210702', '古塔区', '210700');
INSERT INTO `x2_cityarea` VALUES (210703, '210703', '凌河区', '210700');
INSERT INTO `x2_cityarea` VALUES (210711, '210711', '太和区', '210700');
INSERT INTO `x2_cityarea` VALUES (210726, '210726', '黑山县', '210700');
INSERT INTO `x2_cityarea` VALUES (210727, '210727', '义　县', '210700');
INSERT INTO `x2_cityarea` VALUES (210781, '210781', '凌海市', '210700');
INSERT INTO `x2_cityarea` VALUES (210782, '210782', '北宁市', '210700');
INSERT INTO `x2_cityarea` VALUES (210801, '210801', '市辖区', '210800');
INSERT INTO `x2_cityarea` VALUES (210802, '210802', '站前区', '210800');
INSERT INTO `x2_cityarea` VALUES (210803, '210803', '西市区', '210800');
INSERT INTO `x2_cityarea` VALUES (210804, '210804', '鲅鱼圈区', '210800');
INSERT INTO `x2_cityarea` VALUES (210811, '210811', '老边区', '210800');
INSERT INTO `x2_cityarea` VALUES (210881, '210881', '盖州市', '210800');
INSERT INTO `x2_cityarea` VALUES (210882, '210882', '大石桥市', '210800');
INSERT INTO `x2_cityarea` VALUES (210901, '210901', '市辖区', '210900');
INSERT INTO `x2_cityarea` VALUES (210902, '210902', '海州区', '210900');
INSERT INTO `x2_cityarea` VALUES (210903, '210903', '新邱区', '210900');
INSERT INTO `x2_cityarea` VALUES (210904, '210904', '太平区', '210900');
INSERT INTO `x2_cityarea` VALUES (210905, '210905', '清河门区', '210900');
INSERT INTO `x2_cityarea` VALUES (210911, '210911', '细河区', '210900');
INSERT INTO `x2_cityarea` VALUES (210921, '210921', '阜新蒙古族自治县', '210900');
INSERT INTO `x2_cityarea` VALUES (210922, '210922', '彰武县', '210900');
INSERT INTO `x2_cityarea` VALUES (211001, '211001', '市辖区', '211000');
INSERT INTO `x2_cityarea` VALUES (211002, '211002', '白塔区', '211000');
INSERT INTO `x2_cityarea` VALUES (211003, '211003', '文圣区', '211000');
INSERT INTO `x2_cityarea` VALUES (211004, '211004', '宏伟区', '211000');
INSERT INTO `x2_cityarea` VALUES (211005, '211005', '弓长岭区', '211000');
INSERT INTO `x2_cityarea` VALUES (211011, '211011', '太子河区', '211000');
INSERT INTO `x2_cityarea` VALUES (211021, '211021', '辽阳县', '211000');
INSERT INTO `x2_cityarea` VALUES (211081, '211081', '灯塔市', '211000');
INSERT INTO `x2_cityarea` VALUES (211101, '211101', '市辖区', '211100');
INSERT INTO `x2_cityarea` VALUES (211102, '211102', '双台子区', '211100');
INSERT INTO `x2_cityarea` VALUES (211103, '211103', '兴隆台区', '211100');
INSERT INTO `x2_cityarea` VALUES (211121, '211121', '大洼县', '211100');
INSERT INTO `x2_cityarea` VALUES (211122, '211122', '盘山县', '211100');
INSERT INTO `x2_cityarea` VALUES (211201, '211201', '市辖区', '211200');
INSERT INTO `x2_cityarea` VALUES (211202, '211202', '银州区', '211200');
INSERT INTO `x2_cityarea` VALUES (211204, '211204', '清河区', '211200');
INSERT INTO `x2_cityarea` VALUES (211221, '211221', '铁岭县', '211200');
INSERT INTO `x2_cityarea` VALUES (211223, '211223', '西丰县', '211200');
INSERT INTO `x2_cityarea` VALUES (211224, '211224', '昌图县', '211200');
INSERT INTO `x2_cityarea` VALUES (211281, '211281', '调兵山市', '211200');
INSERT INTO `x2_cityarea` VALUES (211282, '211282', '开原市', '211200');
INSERT INTO `x2_cityarea` VALUES (211301, '211301', '市辖区', '211300');
INSERT INTO `x2_cityarea` VALUES (211302, '211302', '双塔区', '211300');
INSERT INTO `x2_cityarea` VALUES (211303, '211303', '龙城区', '211300');
INSERT INTO `x2_cityarea` VALUES (211321, '211321', '朝阳县', '211300');
INSERT INTO `x2_cityarea` VALUES (211322, '211322', '建平县', '211300');
INSERT INTO `x2_cityarea` VALUES (211324, '211324', '喀喇沁左翼蒙古族自治县', '211300');
INSERT INTO `x2_cityarea` VALUES (211381, '211381', '北票市', '211300');
INSERT INTO `x2_cityarea` VALUES (211382, '211382', '凌源市', '211300');
INSERT INTO `x2_cityarea` VALUES (211401, '211401', '市辖区', '211400');
INSERT INTO `x2_cityarea` VALUES (211402, '211402', '连山区', '211400');
INSERT INTO `x2_cityarea` VALUES (211403, '211403', '龙港区', '211400');
INSERT INTO `x2_cityarea` VALUES (211404, '211404', '南票区', '211400');
INSERT INTO `x2_cityarea` VALUES (211421, '211421', '绥中县', '211400');
INSERT INTO `x2_cityarea` VALUES (211422, '211422', '建昌县', '211400');
INSERT INTO `x2_cityarea` VALUES (211481, '211481', '兴城市', '211400');
INSERT INTO `x2_cityarea` VALUES (220101, '220101', '市辖区', '220100');
INSERT INTO `x2_cityarea` VALUES (220102, '220102', '南关区', '220100');
INSERT INTO `x2_cityarea` VALUES (220103, '220103', '宽城区', '220100');
INSERT INTO `x2_cityarea` VALUES (220104, '220104', '朝阳区', '220100');
INSERT INTO `x2_cityarea` VALUES (220105, '220105', '二道区', '220100');
INSERT INTO `x2_cityarea` VALUES (220106, '220106', '绿园区', '220100');
INSERT INTO `x2_cityarea` VALUES (220112, '220112', '双阳区', '220100');
INSERT INTO `x2_cityarea` VALUES (220122, '220122', '农安县', '220100');
INSERT INTO `x2_cityarea` VALUES (220181, '220181', '九台市', '220100');
INSERT INTO `x2_cityarea` VALUES (220182, '220182', '榆树市', '220100');
INSERT INTO `x2_cityarea` VALUES (220183, '220183', '德惠市', '220100');
INSERT INTO `x2_cityarea` VALUES (220201, '220201', '市辖区', '220200');
INSERT INTO `x2_cityarea` VALUES (220202, '220202', '昌邑区', '220200');
INSERT INTO `x2_cityarea` VALUES (220203, '220203', '龙潭区', '220200');
INSERT INTO `x2_cityarea` VALUES (220204, '220204', '船营区', '220200');
INSERT INTO `x2_cityarea` VALUES (220211, '220211', '丰满区', '220200');
INSERT INTO `x2_cityarea` VALUES (220221, '220221', '永吉县', '220200');
INSERT INTO `x2_cityarea` VALUES (220281, '220281', '蛟河市', '220200');
INSERT INTO `x2_cityarea` VALUES (220282, '220282', '桦甸市', '220200');
INSERT INTO `x2_cityarea` VALUES (220283, '220283', '舒兰市', '220200');
INSERT INTO `x2_cityarea` VALUES (220284, '220284', '磐石市', '220200');
INSERT INTO `x2_cityarea` VALUES (220301, '220301', '市辖区', '220300');
INSERT INTO `x2_cityarea` VALUES (220302, '220302', '铁西区', '220300');
INSERT INTO `x2_cityarea` VALUES (220303, '220303', '铁东区', '220300');
INSERT INTO `x2_cityarea` VALUES (220322, '220322', '梨树县', '220300');
INSERT INTO `x2_cityarea` VALUES (220323, '220323', '伊通满族自治县', '220300');
INSERT INTO `x2_cityarea` VALUES (220381, '220381', '公主岭市', '220300');
INSERT INTO `x2_cityarea` VALUES (220382, '220382', '双辽市', '220300');
INSERT INTO `x2_cityarea` VALUES (220401, '220401', '市辖区', '220400');
INSERT INTO `x2_cityarea` VALUES (220402, '220402', '龙山区', '220400');
INSERT INTO `x2_cityarea` VALUES (220403, '220403', '西安区', '220400');
INSERT INTO `x2_cityarea` VALUES (220421, '220421', '东丰县', '220400');
INSERT INTO `x2_cityarea` VALUES (220422, '220422', '东辽县', '220400');
INSERT INTO `x2_cityarea` VALUES (220501, '220501', '市辖区', '220500');
INSERT INTO `x2_cityarea` VALUES (220502, '220502', '东昌区', '220500');
INSERT INTO `x2_cityarea` VALUES (220503, '220503', '二道江区', '220500');
INSERT INTO `x2_cityarea` VALUES (220521, '220521', '通化县', '220500');
INSERT INTO `x2_cityarea` VALUES (220523, '220523', '辉南县', '220500');
INSERT INTO `x2_cityarea` VALUES (220524, '220524', '柳河县', '220500');
INSERT INTO `x2_cityarea` VALUES (220581, '220581', '梅河口市', '220500');
INSERT INTO `x2_cityarea` VALUES (220582, '220582', '集安市', '220500');
INSERT INTO `x2_cityarea` VALUES (220601, '220601', '市辖区', '220600');
INSERT INTO `x2_cityarea` VALUES (220602, '220602', '八道江区', '220600');
INSERT INTO `x2_cityarea` VALUES (220604, '220604', '江源区', '220600');
INSERT INTO `x2_cityarea` VALUES (220621, '220621', '抚松县', '220600');
INSERT INTO `x2_cityarea` VALUES (220622, '220622', '靖宇县', '220600');
INSERT INTO `x2_cityarea` VALUES (220623, '220623', '长白朝鲜族自治县', '220600');
INSERT INTO `x2_cityarea` VALUES (220681, '220681', '临江市', '220600');
INSERT INTO `x2_cityarea` VALUES (220701, '220701', '市辖区', '220700');
INSERT INTO `x2_cityarea` VALUES (220702, '220702', '宁江区', '220700');
INSERT INTO `x2_cityarea` VALUES (220721, '220721', '前郭尔罗斯蒙古族自治县', '220700');
INSERT INTO `x2_cityarea` VALUES (220722, '220722', '长岭县', '220700');
INSERT INTO `x2_cityarea` VALUES (220723, '220723', '乾安县', '220700');
INSERT INTO `x2_cityarea` VALUES (220724, '220724', '扶余县', '220700');
INSERT INTO `x2_cityarea` VALUES (220801, '220801', '市辖区', '220800');
INSERT INTO `x2_cityarea` VALUES (220802, '220802', '洮北区', '220800');
INSERT INTO `x2_cityarea` VALUES (220821, '220821', '镇赉县', '220800');
INSERT INTO `x2_cityarea` VALUES (220822, '220822', '通榆县', '220800');
INSERT INTO `x2_cityarea` VALUES (220881, '220881', '洮南市', '220800');
INSERT INTO `x2_cityarea` VALUES (220882, '220882', '大安市', '220800');
INSERT INTO `x2_cityarea` VALUES (222401, '222401', '延吉市', '222400');
INSERT INTO `x2_cityarea` VALUES (222402, '222402', '图们市', '222400');
INSERT INTO `x2_cityarea` VALUES (222403, '222403', '敦化市', '222400');
INSERT INTO `x2_cityarea` VALUES (222404, '222404', '珲春市', '222400');
INSERT INTO `x2_cityarea` VALUES (222405, '222405', '龙井市', '222400');
INSERT INTO `x2_cityarea` VALUES (222406, '222406', '和龙市', '222400');
INSERT INTO `x2_cityarea` VALUES (222424, '222424', '汪清县', '222400');
INSERT INTO `x2_cityarea` VALUES (222426, '222426', '安图县', '222400');
INSERT INTO `x2_cityarea` VALUES (230101, '230101', '市辖区', '230100');
INSERT INTO `x2_cityarea` VALUES (230102, '230102', '道里区', '230100');
INSERT INTO `x2_cityarea` VALUES (230103, '230103', '南岗区', '230100');
INSERT INTO `x2_cityarea` VALUES (230104, '230104', '道外区', '230100');
INSERT INTO `x2_cityarea` VALUES (230107, '230107', '动力区', '230100');
INSERT INTO `x2_cityarea` VALUES (230108, '230108', '平房区', '230100');
INSERT INTO `x2_cityarea` VALUES (230109, '230109', '松北区', '230100');
INSERT INTO `x2_cityarea` VALUES (230110, '230110', '香坊区', '230100');
INSERT INTO `x2_cityarea` VALUES (230111, '230111', '呼兰区', '230100');
INSERT INTO `x2_cityarea` VALUES (230112, '230112', '阿城区', '230100');
INSERT INTO `x2_cityarea` VALUES (230123, '230123', '依兰县', '230100');
INSERT INTO `x2_cityarea` VALUES (230124, '230124', '方正县', '230100');
INSERT INTO `x2_cityarea` VALUES (230125, '230125', '宾　县', '230100');
INSERT INTO `x2_cityarea` VALUES (230126, '230126', '巴彦县', '230100');
INSERT INTO `x2_cityarea` VALUES (230127, '230127', '木兰县', '230100');
INSERT INTO `x2_cityarea` VALUES (230128, '230128', '通河县', '230100');
INSERT INTO `x2_cityarea` VALUES (230129, '230129', '延寿县', '230100');
INSERT INTO `x2_cityarea` VALUES (230182, '230182', '双城市', '230100');
INSERT INTO `x2_cityarea` VALUES (230183, '230183', '尚志市', '230100');
INSERT INTO `x2_cityarea` VALUES (230184, '230184', '五常市', '230100');
INSERT INTO `x2_cityarea` VALUES (230201, '230201', '市辖区', '230200');
INSERT INTO `x2_cityarea` VALUES (230202, '230202', '龙沙区', '230200');
INSERT INTO `x2_cityarea` VALUES (230203, '230203', '建华区', '230200');
INSERT INTO `x2_cityarea` VALUES (230204, '230204', '铁锋区', '230200');
INSERT INTO `x2_cityarea` VALUES (230205, '230205', '昂昂溪区', '230200');
INSERT INTO `x2_cityarea` VALUES (230206, '230206', '富拉尔基区', '230200');
INSERT INTO `x2_cityarea` VALUES (230207, '230207', '碾子山区', '230200');
INSERT INTO `x2_cityarea` VALUES (230208, '230208', '梅里斯达斡尔族区', '230200');
INSERT INTO `x2_cityarea` VALUES (230221, '230221', '龙江县', '230200');
INSERT INTO `x2_cityarea` VALUES (230223, '230223', '依安县', '230200');
INSERT INTO `x2_cityarea` VALUES (230224, '230224', '泰来县', '230200');
INSERT INTO `x2_cityarea` VALUES (230225, '230225', '甘南县', '230200');
INSERT INTO `x2_cityarea` VALUES (230227, '230227', '富裕县', '230200');
INSERT INTO `x2_cityarea` VALUES (230229, '230229', '克山县', '230200');
INSERT INTO `x2_cityarea` VALUES (230230, '230230', '克东县', '230200');
INSERT INTO `x2_cityarea` VALUES (230231, '230231', '拜泉县', '230200');
INSERT INTO `x2_cityarea` VALUES (230281, '230281', '讷河市', '230200');
INSERT INTO `x2_cityarea` VALUES (230301, '230301', '市辖区', '230300');
INSERT INTO `x2_cityarea` VALUES (230302, '230302', '鸡冠区', '230300');
INSERT INTO `x2_cityarea` VALUES (230303, '230303', '恒山区', '230300');
INSERT INTO `x2_cityarea` VALUES (230304, '230304', '滴道区', '230300');
INSERT INTO `x2_cityarea` VALUES (230305, '230305', '梨树区', '230300');
INSERT INTO `x2_cityarea` VALUES (230306, '230306', '城子河区', '230300');
INSERT INTO `x2_cityarea` VALUES (230307, '230307', '麻山区', '230300');
INSERT INTO `x2_cityarea` VALUES (230321, '230321', '鸡东县', '230300');
INSERT INTO `x2_cityarea` VALUES (230381, '230381', '虎林市', '230300');
INSERT INTO `x2_cityarea` VALUES (230382, '230382', '密山市', '230300');
INSERT INTO `x2_cityarea` VALUES (230401, '230401', '市辖区', '230400');
INSERT INTO `x2_cityarea` VALUES (230402, '230402', '向阳区', '230400');
INSERT INTO `x2_cityarea` VALUES (230403, '230403', '工农区', '230400');
INSERT INTO `x2_cityarea` VALUES (230404, '230404', '南山区', '230400');
INSERT INTO `x2_cityarea` VALUES (230405, '230405', '兴安区', '230400');
INSERT INTO `x2_cityarea` VALUES (230406, '230406', '东山区', '230400');
INSERT INTO `x2_cityarea` VALUES (230407, '230407', '兴山区', '230400');
INSERT INTO `x2_cityarea` VALUES (230421, '230421', '萝北县', '230400');
INSERT INTO `x2_cityarea` VALUES (230422, '230422', '绥滨县', '230400');
INSERT INTO `x2_cityarea` VALUES (230501, '230501', '市辖区', '230500');
INSERT INTO `x2_cityarea` VALUES (230502, '230502', '尖山区', '230500');
INSERT INTO `x2_cityarea` VALUES (230503, '230503', '岭东区', '230500');
INSERT INTO `x2_cityarea` VALUES (230505, '230505', '四方台区', '230500');
INSERT INTO `x2_cityarea` VALUES (230506, '230506', '宝山区', '230500');
INSERT INTO `x2_cityarea` VALUES (230521, '230521', '集贤县', '230500');
INSERT INTO `x2_cityarea` VALUES (230522, '230522', '友谊县', '230500');
INSERT INTO `x2_cityarea` VALUES (230523, '230523', '宝清县', '230500');
INSERT INTO `x2_cityarea` VALUES (230524, '230524', '饶河县', '230500');
INSERT INTO `x2_cityarea` VALUES (230601, '230601', '市辖区', '230600');
INSERT INTO `x2_cityarea` VALUES (230602, '230602', '萨尔图区', '230600');
INSERT INTO `x2_cityarea` VALUES (230603, '230603', '龙凤区', '230600');
INSERT INTO `x2_cityarea` VALUES (230604, '230604', '让胡路区', '230600');
INSERT INTO `x2_cityarea` VALUES (230605, '230605', '红岗区', '230600');
INSERT INTO `x2_cityarea` VALUES (230606, '230606', '大同区', '230600');
INSERT INTO `x2_cityarea` VALUES (230621, '230621', '肇州县', '230600');
INSERT INTO `x2_cityarea` VALUES (230622, '230622', '肇源县', '230600');
INSERT INTO `x2_cityarea` VALUES (230623, '230623', '林甸县', '230600');
INSERT INTO `x2_cityarea` VALUES (230624, '230624', '杜尔伯特蒙古族自治县', '230600');
INSERT INTO `x2_cityarea` VALUES (230701, '230701', '市辖区', '230700');
INSERT INTO `x2_cityarea` VALUES (230702, '230702', '伊春区', '230700');
INSERT INTO `x2_cityarea` VALUES (230703, '230703', '南岔区', '230700');
INSERT INTO `x2_cityarea` VALUES (230704, '230704', '友好区', '230700');
INSERT INTO `x2_cityarea` VALUES (230705, '230705', '西林区', '230700');
INSERT INTO `x2_cityarea` VALUES (230706, '230706', '翠峦区', '230700');
INSERT INTO `x2_cityarea` VALUES (230707, '230707', '新青区', '230700');
INSERT INTO `x2_cityarea` VALUES (230708, '230708', '美溪区', '230700');
INSERT INTO `x2_cityarea` VALUES (230709, '230709', '金山屯区', '230700');
INSERT INTO `x2_cityarea` VALUES (230710, '230710', '五营区', '230700');
INSERT INTO `x2_cityarea` VALUES (230711, '230711', '乌马河区', '230700');
INSERT INTO `x2_cityarea` VALUES (230712, '230712', '汤旺河区', '230700');
INSERT INTO `x2_cityarea` VALUES (230713, '230713', '带岭区', '230700');
INSERT INTO `x2_cityarea` VALUES (230714, '230714', '乌伊岭区', '230700');
INSERT INTO `x2_cityarea` VALUES (230715, '230715', '红星区', '230700');
INSERT INTO `x2_cityarea` VALUES (230716, '230716', '上甘岭区', '230700');
INSERT INTO `x2_cityarea` VALUES (230722, '230722', '嘉荫县', '230700');
INSERT INTO `x2_cityarea` VALUES (230781, '230781', '铁力市', '230700');
INSERT INTO `x2_cityarea` VALUES (230801, '230801', '市辖区', '230800');
INSERT INTO `x2_cityarea` VALUES (230802, '230802', '永红区', '230800');
INSERT INTO `x2_cityarea` VALUES (230803, '230803', '向阳区', '230800');
INSERT INTO `x2_cityarea` VALUES (230804, '230804', '前进区', '230800');
INSERT INTO `x2_cityarea` VALUES (230805, '230805', '东风区', '230800');
INSERT INTO `x2_cityarea` VALUES (230811, '230811', '郊　区', '230800');
INSERT INTO `x2_cityarea` VALUES (230822, '230822', '桦南县', '230800');
INSERT INTO `x2_cityarea` VALUES (230826, '230826', '桦川县', '230800');
INSERT INTO `x2_cityarea` VALUES (230828, '230828', '汤原县', '230800');
INSERT INTO `x2_cityarea` VALUES (230833, '230833', '抚远县', '230800');
INSERT INTO `x2_cityarea` VALUES (230881, '230881', '同江市', '230800');
INSERT INTO `x2_cityarea` VALUES (230882, '230882', '富锦市', '230800');
INSERT INTO `x2_cityarea` VALUES (230901, '230901', '市辖区', '230900');
INSERT INTO `x2_cityarea` VALUES (230902, '230902', '新兴区', '230900');
INSERT INTO `x2_cityarea` VALUES (230903, '230903', '桃山区', '230900');
INSERT INTO `x2_cityarea` VALUES (230904, '230904', '茄子河区', '230900');
INSERT INTO `x2_cityarea` VALUES (230921, '230921', '勃利县', '230900');
INSERT INTO `x2_cityarea` VALUES (231001, '231001', '市辖区', '231000');
INSERT INTO `x2_cityarea` VALUES (231002, '231002', '东安区', '231000');
INSERT INTO `x2_cityarea` VALUES (231003, '231003', '阳明区', '231000');
INSERT INTO `x2_cityarea` VALUES (231004, '231004', '爱民区', '231000');
INSERT INTO `x2_cityarea` VALUES (231005, '231005', '西安区', '231000');
INSERT INTO `x2_cityarea` VALUES (231024, '231024', '东宁县', '231000');
INSERT INTO `x2_cityarea` VALUES (231025, '231025', '林口县', '231000');
INSERT INTO `x2_cityarea` VALUES (231081, '231081', '绥芬河市', '231000');
INSERT INTO `x2_cityarea` VALUES (231083, '231083', '海林市', '231000');
INSERT INTO `x2_cityarea` VALUES (231084, '231084', '宁安市', '231000');
INSERT INTO `x2_cityarea` VALUES (231085, '231085', '穆棱市', '231000');
INSERT INTO `x2_cityarea` VALUES (231101, '231101', '市辖区', '231100');
INSERT INTO `x2_cityarea` VALUES (231102, '231102', '爱辉区', '231100');
INSERT INTO `x2_cityarea` VALUES (231121, '231121', '嫩江县', '231100');
INSERT INTO `x2_cityarea` VALUES (231123, '231123', '逊克县', '231100');
INSERT INTO `x2_cityarea` VALUES (231124, '231124', '孙吴县', '231100');
INSERT INTO `x2_cityarea` VALUES (231181, '231181', '北安市', '231100');
INSERT INTO `x2_cityarea` VALUES (231182, '231182', '五大连池市', '231100');
INSERT INTO `x2_cityarea` VALUES (231201, '231201', '市辖区', '231200');
INSERT INTO `x2_cityarea` VALUES (231202, '231202', '北林区', '231200');
INSERT INTO `x2_cityarea` VALUES (231221, '231221', '望奎县', '231200');
INSERT INTO `x2_cityarea` VALUES (231222, '231222', '兰西县', '231200');
INSERT INTO `x2_cityarea` VALUES (231223, '231223', '青冈县', '231200');
INSERT INTO `x2_cityarea` VALUES (231224, '231224', '庆安县', '231200');
INSERT INTO `x2_cityarea` VALUES (231225, '231225', '明水县', '231200');
INSERT INTO `x2_cityarea` VALUES (231226, '231226', '绥棱县', '231200');
INSERT INTO `x2_cityarea` VALUES (231281, '231281', '安达市', '231200');
INSERT INTO `x2_cityarea` VALUES (231282, '231282', '肇东市', '231200');
INSERT INTO `x2_cityarea` VALUES (231283, '231283', '海伦市', '231200');
INSERT INTO `x2_cityarea` VALUES (232701, '232701', '加格达奇区', '232700');
INSERT INTO `x2_cityarea` VALUES (232702, '232702', '松岭区', '232700');
INSERT INTO `x2_cityarea` VALUES (232703, '232703', '新林区', '232700');
INSERT INTO `x2_cityarea` VALUES (232704, '232704', '呼中区', '232700');
INSERT INTO `x2_cityarea` VALUES (232721, '232721', '呼玛县', '232700');
INSERT INTO `x2_cityarea` VALUES (232722, '232722', '塔河县', '232700');
INSERT INTO `x2_cityarea` VALUES (232723, '232723', '漠河县', '232700');
INSERT INTO `x2_cityarea` VALUES (310101, '310101', '黄浦区', '310100');
INSERT INTO `x2_cityarea` VALUES (310103, '310103', '卢湾区', '310100');
INSERT INTO `x2_cityarea` VALUES (310104, '310104', '徐汇区', '310100');
INSERT INTO `x2_cityarea` VALUES (310105, '310105', '长宁区', '310100');
INSERT INTO `x2_cityarea` VALUES (310106, '310106', '静安区', '310100');
INSERT INTO `x2_cityarea` VALUES (310107, '310107', '普陀区', '310100');
INSERT INTO `x2_cityarea` VALUES (310108, '310108', '闸北区', '310100');
INSERT INTO `x2_cityarea` VALUES (310109, '310109', '虹口区', '310100');
INSERT INTO `x2_cityarea` VALUES (310110, '310110', '杨浦区', '310100');
INSERT INTO `x2_cityarea` VALUES (310112, '310112', '闵行区', '310100');
INSERT INTO `x2_cityarea` VALUES (310113, '310113', '宝山区', '310100');
INSERT INTO `x2_cityarea` VALUES (310114, '310114', '嘉定区', '310100');
INSERT INTO `x2_cityarea` VALUES (310115, '310115', '浦东新区', '310100');
INSERT INTO `x2_cityarea` VALUES (310116, '310116', '金山区', '310100');
INSERT INTO `x2_cityarea` VALUES (310117, '310117', '松江区', '310100');
INSERT INTO `x2_cityarea` VALUES (310118, '310118', '青浦区', '310100');
INSERT INTO `x2_cityarea` VALUES (310119, '310119', '南汇区', '310100');
INSERT INTO `x2_cityarea` VALUES (310120, '310120', '奉贤区', '310100');
INSERT INTO `x2_cityarea` VALUES (310230, '310230', '崇明县', '310200');
INSERT INTO `x2_cityarea` VALUES (320101, '320101', '市辖区', '320100');
INSERT INTO `x2_cityarea` VALUES (320102, '320102', '玄武区', '320100');
INSERT INTO `x2_cityarea` VALUES (320103, '320103', '白下区', '320100');
INSERT INTO `x2_cityarea` VALUES (320104, '320104', '秦淮区', '320100');
INSERT INTO `x2_cityarea` VALUES (320105, '320105', '建邺区', '320100');
INSERT INTO `x2_cityarea` VALUES (320106, '320106', '鼓楼区', '320100');
INSERT INTO `x2_cityarea` VALUES (320107, '320107', '下关区', '320100');
INSERT INTO `x2_cityarea` VALUES (320111, '320111', '浦口区', '320100');
INSERT INTO `x2_cityarea` VALUES (320113, '320113', '栖霞区', '320100');
INSERT INTO `x2_cityarea` VALUES (320114, '320114', '雨花台区', '320100');
INSERT INTO `x2_cityarea` VALUES (320115, '320115', '江宁区', '320100');
INSERT INTO `x2_cityarea` VALUES (320116, '320116', '六合区', '320100');
INSERT INTO `x2_cityarea` VALUES (320124, '320124', '溧水县', '320100');
INSERT INTO `x2_cityarea` VALUES (320125, '320125', '高淳县', '320100');
INSERT INTO `x2_cityarea` VALUES (320201, '320201', '市辖区', '320200');
INSERT INTO `x2_cityarea` VALUES (320202, '320202', '崇安区', '320200');
INSERT INTO `x2_cityarea` VALUES (320203, '320203', '南长区', '320200');
INSERT INTO `x2_cityarea` VALUES (320204, '320204', '北塘区', '320200');
INSERT INTO `x2_cityarea` VALUES (320205, '320205', '锡山区', '320200');
INSERT INTO `x2_cityarea` VALUES (320206, '320206', '惠山区', '320200');
INSERT INTO `x2_cityarea` VALUES (320211, '320211', '滨湖区', '320200');
INSERT INTO `x2_cityarea` VALUES (320281, '320281', '江阴市', '320200');
INSERT INTO `x2_cityarea` VALUES (320282, '320282', '宜兴市', '320200');
INSERT INTO `x2_cityarea` VALUES (320301, '320301', '市辖区', '320300');
INSERT INTO `x2_cityarea` VALUES (320302, '320302', '鼓楼区', '320300');
INSERT INTO `x2_cityarea` VALUES (320303, '320303', '云龙区', '320300');
INSERT INTO `x2_cityarea` VALUES (320304, '320304', '九里区', '320300');
INSERT INTO `x2_cityarea` VALUES (320305, '320305', '贾汪区', '320300');
INSERT INTO `x2_cityarea` VALUES (320311, '320311', '泉山区', '320300');
INSERT INTO `x2_cityarea` VALUES (320321, '320321', '丰　县', '320300');
INSERT INTO `x2_cityarea` VALUES (320322, '320322', '沛　县', '320300');
INSERT INTO `x2_cityarea` VALUES (320323, '320323', '铜山县', '320300');
INSERT INTO `x2_cityarea` VALUES (320324, '320324', '睢宁县', '320300');
INSERT INTO `x2_cityarea` VALUES (320381, '320381', '新沂市', '320300');
INSERT INTO `x2_cityarea` VALUES (320382, '320382', '邳州市', '320300');
INSERT INTO `x2_cityarea` VALUES (320401, '320401', '市辖区', '320400');
INSERT INTO `x2_cityarea` VALUES (320402, '320402', '天宁区', '320400');
INSERT INTO `x2_cityarea` VALUES (320404, '320404', '钟楼区', '320400');
INSERT INTO `x2_cityarea` VALUES (320405, '320405', '戚墅堰区', '320400');
INSERT INTO `x2_cityarea` VALUES (320411, '320411', '新北区', '320400');
INSERT INTO `x2_cityarea` VALUES (320412, '320412', '武进区', '320400');
INSERT INTO `x2_cityarea` VALUES (320481, '320481', '溧阳市', '320400');
INSERT INTO `x2_cityarea` VALUES (320482, '320482', '金坛市', '320400');
INSERT INTO `x2_cityarea` VALUES (320501, '320501', '市辖区', '320500');
INSERT INTO `x2_cityarea` VALUES (320502, '320502', '沧浪区', '320500');
INSERT INTO `x2_cityarea` VALUES (320503, '320503', '平江区', '320500');
INSERT INTO `x2_cityarea` VALUES (320504, '320504', '金阊区', '320500');
INSERT INTO `x2_cityarea` VALUES (320505, '320505', '虎丘区', '320500');
INSERT INTO `x2_cityarea` VALUES (320506, '320506', '吴中区', '320500');
INSERT INTO `x2_cityarea` VALUES (320507, '320507', '相城区', '320500');
INSERT INTO `x2_cityarea` VALUES (320581, '320581', '常熟市', '320500');
INSERT INTO `x2_cityarea` VALUES (320582, '320582', '张家港市', '320500');
INSERT INTO `x2_cityarea` VALUES (320583, '320583', '昆山市', '320500');
INSERT INTO `x2_cityarea` VALUES (320584, '320584', '吴江市', '320500');
INSERT INTO `x2_cityarea` VALUES (320585, '320585', '太仓市', '320500');
INSERT INTO `x2_cityarea` VALUES (320601, '320601', '市辖区', '320600');
INSERT INTO `x2_cityarea` VALUES (320602, '320602', '崇川区', '320600');
INSERT INTO `x2_cityarea` VALUES (320611, '320611', '港闸区', '320600');
INSERT INTO `x2_cityarea` VALUES (320621, '320621', '海安县', '320600');
INSERT INTO `x2_cityarea` VALUES (320623, '320623', '如东县', '320600');
INSERT INTO `x2_cityarea` VALUES (320681, '320681', '启东市', '320600');
INSERT INTO `x2_cityarea` VALUES (320682, '320682', '如皋市', '320600');
INSERT INTO `x2_cityarea` VALUES (320683, '320683', '通州市', '320600');
INSERT INTO `x2_cityarea` VALUES (320684, '320684', '海门市', '320600');
INSERT INTO `x2_cityarea` VALUES (320701, '320701', '市辖区', '320700');
INSERT INTO `x2_cityarea` VALUES (320703, '320703', '连云区', '320700');
INSERT INTO `x2_cityarea` VALUES (320705, '320705', '新浦区', '320700');
INSERT INTO `x2_cityarea` VALUES (320706, '320706', '海州区', '320700');
INSERT INTO `x2_cityarea` VALUES (320721, '320721', '赣榆县', '320700');
INSERT INTO `x2_cityarea` VALUES (320722, '320722', '东海县', '320700');
INSERT INTO `x2_cityarea` VALUES (320723, '320723', '灌云县', '320700');
INSERT INTO `x2_cityarea` VALUES (320724, '320724', '灌南县', '320700');
INSERT INTO `x2_cityarea` VALUES (320801, '320801', '市辖区', '320800');
INSERT INTO `x2_cityarea` VALUES (320802, '320802', '清河区', '320800');
INSERT INTO `x2_cityarea` VALUES (320803, '320803', '楚州区', '320800');
INSERT INTO `x2_cityarea` VALUES (320804, '320804', '淮阴区', '320800');
INSERT INTO `x2_cityarea` VALUES (320811, '320811', '清浦区', '320800');
INSERT INTO `x2_cityarea` VALUES (320826, '320826', '涟水县', '320800');
INSERT INTO `x2_cityarea` VALUES (320829, '320829', '洪泽县', '320800');
INSERT INTO `x2_cityarea` VALUES (320830, '320830', '盱眙县', '320800');
INSERT INTO `x2_cityarea` VALUES (320831, '320831', '金湖县', '320800');
INSERT INTO `x2_cityarea` VALUES (320901, '320901', '市辖区', '320900');
INSERT INTO `x2_cityarea` VALUES (320902, '320902', '亭湖区', '320900');
INSERT INTO `x2_cityarea` VALUES (320903, '320903', '盐都区', '320900');
INSERT INTO `x2_cityarea` VALUES (320921, '320921', '响水县', '320900');
INSERT INTO `x2_cityarea` VALUES (320922, '320922', '滨海县', '320900');
INSERT INTO `x2_cityarea` VALUES (320923, '320923', '阜宁县', '320900');
INSERT INTO `x2_cityarea` VALUES (320924, '320924', '射阳县', '320900');
INSERT INTO `x2_cityarea` VALUES (320925, '320925', '建湖县', '320900');
INSERT INTO `x2_cityarea` VALUES (320981, '320981', '东台市', '320900');
INSERT INTO `x2_cityarea` VALUES (320982, '320982', '大丰市', '320900');
INSERT INTO `x2_cityarea` VALUES (321001, '321001', '市辖区', '321000');
INSERT INTO `x2_cityarea` VALUES (321002, '321002', '广陵区', '321000');
INSERT INTO `x2_cityarea` VALUES (321003, '321003', '邗江区', '321000');
INSERT INTO `x2_cityarea` VALUES (321011, '321011', '维扬区', '321000');
INSERT INTO `x2_cityarea` VALUES (321023, '321023', '宝应县', '321000');
INSERT INTO `x2_cityarea` VALUES (321081, '321081', '仪征市', '321000');
INSERT INTO `x2_cityarea` VALUES (321084, '321084', '高邮市', '321000');
INSERT INTO `x2_cityarea` VALUES (321088, '321088', '江都市', '321000');
INSERT INTO `x2_cityarea` VALUES (321101, '321101', '市区', '321100');
INSERT INTO `x2_cityarea` VALUES (321102, '321102', '京口区', '321100');
INSERT INTO `x2_cityarea` VALUES (321111, '321111', '润州区', '321100');
INSERT INTO `x2_cityarea` VALUES (321112, '321112', '丹徒区', '321100');
INSERT INTO `x2_cityarea` VALUES (321181, '321181', '丹阳市', '321100');
INSERT INTO `x2_cityarea` VALUES (321182, '321182', '扬中市', '321100');
INSERT INTO `x2_cityarea` VALUES (321183, '321183', '句容市', '321100');
INSERT INTO `x2_cityarea` VALUES (321201, '321201', '市辖区', '321200');
INSERT INTO `x2_cityarea` VALUES (321202, '321202', '海陵区', '321200');
INSERT INTO `x2_cityarea` VALUES (321203, '321203', '高港区', '321200');
INSERT INTO `x2_cityarea` VALUES (321281, '321281', '兴化市', '321200');
INSERT INTO `x2_cityarea` VALUES (321282, '321282', '靖江市', '321200');
INSERT INTO `x2_cityarea` VALUES (321283, '321283', '泰兴市', '321200');
INSERT INTO `x2_cityarea` VALUES (321284, '321284', '姜堰市', '321200');
INSERT INTO `x2_cityarea` VALUES (321301, '321301', '市辖区', '321300');
INSERT INTO `x2_cityarea` VALUES (321302, '321302', '宿城区', '321300');
INSERT INTO `x2_cityarea` VALUES (321311, '321311', '宿豫区', '321300');
INSERT INTO `x2_cityarea` VALUES (321322, '321322', '沭阳县', '321300');
INSERT INTO `x2_cityarea` VALUES (321323, '321323', '泗阳县', '321300');
INSERT INTO `x2_cityarea` VALUES (321324, '321324', '泗洪县', '321300');
INSERT INTO `x2_cityarea` VALUES (330101, '330101', '市辖区', '330100');
INSERT INTO `x2_cityarea` VALUES (330102, '330102', '上城区', '330100');
INSERT INTO `x2_cityarea` VALUES (330103, '330103', '下城区', '330100');
INSERT INTO `x2_cityarea` VALUES (330104, '330104', '江干区', '330100');
INSERT INTO `x2_cityarea` VALUES (330105, '330105', '拱墅区', '330100');
INSERT INTO `x2_cityarea` VALUES (330106, '330106', '西湖区', '330100');
INSERT INTO `x2_cityarea` VALUES (330108, '330108', '滨江区', '330100');
INSERT INTO `x2_cityarea` VALUES (330109, '330109', '萧山区', '330100');
INSERT INTO `x2_cityarea` VALUES (330110, '330110', '余杭区', '330100');
INSERT INTO `x2_cityarea` VALUES (330122, '330122', '桐庐县', '330100');
INSERT INTO `x2_cityarea` VALUES (330127, '330127', '淳安县', '330100');
INSERT INTO `x2_cityarea` VALUES (330182, '330182', '建德市', '330100');
INSERT INTO `x2_cityarea` VALUES (330183, '330183', '富阳市', '330100');
INSERT INTO `x2_cityarea` VALUES (330185, '330185', '临安市', '330100');
INSERT INTO `x2_cityarea` VALUES (330201, '330201', '市辖区', '330200');
INSERT INTO `x2_cityarea` VALUES (330203, '330203', '海曙区', '330200');
INSERT INTO `x2_cityarea` VALUES (330204, '330204', '江东区', '330200');
INSERT INTO `x2_cityarea` VALUES (330205, '330205', '江北区', '330200');
INSERT INTO `x2_cityarea` VALUES (330206, '330206', '北仑区', '330200');
INSERT INTO `x2_cityarea` VALUES (330211, '330211', '镇海区', '330200');
INSERT INTO `x2_cityarea` VALUES (330212, '330212', '鄞州区', '330200');
INSERT INTO `x2_cityarea` VALUES (330225, '330225', '象山县', '330200');
INSERT INTO `x2_cityarea` VALUES (330226, '330226', '宁海县', '330200');
INSERT INTO `x2_cityarea` VALUES (330281, '330281', '余姚市', '330200');
INSERT INTO `x2_cityarea` VALUES (330282, '330282', '慈溪市', '330200');
INSERT INTO `x2_cityarea` VALUES (330283, '330283', '奉化市', '330200');
INSERT INTO `x2_cityarea` VALUES (330301, '330301', '市辖区', '330300');
INSERT INTO `x2_cityarea` VALUES (330302, '330302', '鹿城区', '330300');
INSERT INTO `x2_cityarea` VALUES (330303, '330303', '龙湾区', '330300');
INSERT INTO `x2_cityarea` VALUES (330304, '330304', '瓯海区', '330300');
INSERT INTO `x2_cityarea` VALUES (330322, '330322', '洞头县', '330300');
INSERT INTO `x2_cityarea` VALUES (330324, '330324', '永嘉县', '330300');
INSERT INTO `x2_cityarea` VALUES (330326, '330326', '平阳县', '330300');
INSERT INTO `x2_cityarea` VALUES (330327, '330327', '苍南县', '330300');
INSERT INTO `x2_cityarea` VALUES (330328, '330328', '文成县', '330300');
INSERT INTO `x2_cityarea` VALUES (330329, '330329', '泰顺县', '330300');
INSERT INTO `x2_cityarea` VALUES (330381, '330381', '瑞安市', '330300');
INSERT INTO `x2_cityarea` VALUES (330382, '330382', '乐清市', '330300');
INSERT INTO `x2_cityarea` VALUES (330401, '330401', '市辖区', '330400');
INSERT INTO `x2_cityarea` VALUES (330402, '330402', '南湖区', '330400');
INSERT INTO `x2_cityarea` VALUES (330411, '330411', '秀洲区', '330400');
INSERT INTO `x2_cityarea` VALUES (330421, '330421', '嘉善县', '330400');
INSERT INTO `x2_cityarea` VALUES (330424, '330424', '海盐县', '330400');
INSERT INTO `x2_cityarea` VALUES (330481, '330481', '海宁市', '330400');
INSERT INTO `x2_cityarea` VALUES (330482, '330482', '平湖市', '330400');
INSERT INTO `x2_cityarea` VALUES (330483, '330483', '桐乡市', '330400');
INSERT INTO `x2_cityarea` VALUES (330501, '330501', '市辖区', '330500');
INSERT INTO `x2_cityarea` VALUES (330502, '330502', '吴兴区', '330500');
INSERT INTO `x2_cityarea` VALUES (330503, '330503', '南浔区', '330500');
INSERT INTO `x2_cityarea` VALUES (330521, '330521', '德清县', '330500');
INSERT INTO `x2_cityarea` VALUES (330522, '330522', '长兴县', '330500');
INSERT INTO `x2_cityarea` VALUES (330523, '330523', '安吉县', '330500');
INSERT INTO `x2_cityarea` VALUES (330601, '330601', '市辖区', '330600');
INSERT INTO `x2_cityarea` VALUES (330602, '330602', '越城区', '330600');
INSERT INTO `x2_cityarea` VALUES (330621, '330621', '绍兴县', '330600');
INSERT INTO `x2_cityarea` VALUES (330624, '330624', '新昌县', '330600');
INSERT INTO `x2_cityarea` VALUES (330681, '330681', '诸暨市', '330600');
INSERT INTO `x2_cityarea` VALUES (330682, '330682', '上虞市', '330600');
INSERT INTO `x2_cityarea` VALUES (330683, '330683', '嵊州市', '330600');
INSERT INTO `x2_cityarea` VALUES (330701, '330701', '市辖区', '330700');
INSERT INTO `x2_cityarea` VALUES (330702, '330702', '婺城区', '330700');
INSERT INTO `x2_cityarea` VALUES (330703, '330703', '金东区', '330700');
INSERT INTO `x2_cityarea` VALUES (330723, '330723', '武义县', '330700');
INSERT INTO `x2_cityarea` VALUES (330726, '330726', '浦江县', '330700');
INSERT INTO `x2_cityarea` VALUES (330727, '330727', '磐安县', '330700');
INSERT INTO `x2_cityarea` VALUES (330781, '330781', '兰溪市', '330700');
INSERT INTO `x2_cityarea` VALUES (330782, '330782', '义乌市', '330700');
INSERT INTO `x2_cityarea` VALUES (330783, '330783', '东阳市', '330700');
INSERT INTO `x2_cityarea` VALUES (330784, '330784', '永康市', '330700');
INSERT INTO `x2_cityarea` VALUES (330801, '330801', '市辖区', '330800');
INSERT INTO `x2_cityarea` VALUES (330802, '330802', '柯城区', '330800');
INSERT INTO `x2_cityarea` VALUES (330803, '330803', '衢江区', '330800');
INSERT INTO `x2_cityarea` VALUES (330822, '330822', '常山县', '330800');
INSERT INTO `x2_cityarea` VALUES (330824, '330824', '开化县', '330800');
INSERT INTO `x2_cityarea` VALUES (330825, '330825', '龙游县', '330800');
INSERT INTO `x2_cityarea` VALUES (330881, '330881', '江山市', '330800');
INSERT INTO `x2_cityarea` VALUES (330901, '330901', '市辖区', '330900');
INSERT INTO `x2_cityarea` VALUES (330902, '330902', '定海区', '330900');
INSERT INTO `x2_cityarea` VALUES (330903, '330903', '普陀区', '330900');
INSERT INTO `x2_cityarea` VALUES (330921, '330921', '岱山县', '330900');
INSERT INTO `x2_cityarea` VALUES (330922, '330922', '嵊泗县', '330900');
INSERT INTO `x2_cityarea` VALUES (331001, '331001', '市辖区', '331000');
INSERT INTO `x2_cityarea` VALUES (331002, '331002', '椒江区', '331000');
INSERT INTO `x2_cityarea` VALUES (331003, '331003', '黄岩区', '331000');
INSERT INTO `x2_cityarea` VALUES (331004, '331004', '路桥区', '331000');
INSERT INTO `x2_cityarea` VALUES (331021, '331021', '玉环县', '331000');
INSERT INTO `x2_cityarea` VALUES (331022, '331022', '三门县', '331000');
INSERT INTO `x2_cityarea` VALUES (331023, '331023', '天台县', '331000');
INSERT INTO `x2_cityarea` VALUES (331024, '331024', '仙居县', '331000');
INSERT INTO `x2_cityarea` VALUES (331081, '331081', '温岭市', '331000');
INSERT INTO `x2_cityarea` VALUES (331082, '331082', '临海市', '331000');
INSERT INTO `x2_cityarea` VALUES (331101, '331101', '市辖区', '331100');
INSERT INTO `x2_cityarea` VALUES (331102, '331102', '莲都区', '331100');
INSERT INTO `x2_cityarea` VALUES (331121, '331121', '青田县', '331100');
INSERT INTO `x2_cityarea` VALUES (331122, '331122', '缙云县', '331100');
INSERT INTO `x2_cityarea` VALUES (331123, '331123', '遂昌县', '331100');
INSERT INTO `x2_cityarea` VALUES (331124, '331124', '松阳县', '331100');
INSERT INTO `x2_cityarea` VALUES (331125, '331125', '云和县', '331100');
INSERT INTO `x2_cityarea` VALUES (331126, '331126', '庆元县', '331100');
INSERT INTO `x2_cityarea` VALUES (331127, '331127', '景宁畲族自治县', '331100');
INSERT INTO `x2_cityarea` VALUES (331181, '331181', '龙泉市', '331100');
INSERT INTO `x2_cityarea` VALUES (340101, '340101', '市辖区', '340100');
INSERT INTO `x2_cityarea` VALUES (340102, '340102', '瑶海区', '340100');
INSERT INTO `x2_cityarea` VALUES (340103, '340103', '庐阳区', '340100');
INSERT INTO `x2_cityarea` VALUES (340104, '340104', '蜀山区', '340100');
INSERT INTO `x2_cityarea` VALUES (340111, '340111', '包河区', '340100');
INSERT INTO `x2_cityarea` VALUES (340121, '340121', '长丰县', '340100');
INSERT INTO `x2_cityarea` VALUES (340122, '340122', '肥东县', '340100');
INSERT INTO `x2_cityarea` VALUES (340123, '340123', '肥西县', '340100');
INSERT INTO `x2_cityarea` VALUES (340201, '340201', '市辖区', '340200');
INSERT INTO `x2_cityarea` VALUES (340202, '340202', '镜湖区', '340200');
INSERT INTO `x2_cityarea` VALUES (340203, '340203', '弋江区', '340200');
INSERT INTO `x2_cityarea` VALUES (340204, '340204', '新芜区', '340200');
INSERT INTO `x2_cityarea` VALUES (340207, '340207', '鸠江区', '340200');
INSERT INTO `x2_cityarea` VALUES (340208, '340208', '三山区', '340200');
INSERT INTO `x2_cityarea` VALUES (340221, '340221', '芜湖县', '340200');
INSERT INTO `x2_cityarea` VALUES (340222, '340222', '繁昌县', '340200');
INSERT INTO `x2_cityarea` VALUES (340223, '340223', '南陵县', '340200');
INSERT INTO `x2_cityarea` VALUES (340301, '340301', '市辖区', '340300');
INSERT INTO `x2_cityarea` VALUES (340302, '340302', '龙子湖区', '340300');
INSERT INTO `x2_cityarea` VALUES (340303, '340303', '蚌山区', '340300');
INSERT INTO `x2_cityarea` VALUES (340304, '340304', '禹会区', '340300');
INSERT INTO `x2_cityarea` VALUES (340311, '340311', '淮上区', '340300');
INSERT INTO `x2_cityarea` VALUES (340321, '340321', '怀远县', '340300');
INSERT INTO `x2_cityarea` VALUES (340322, '340322', '五河县', '340300');
INSERT INTO `x2_cityarea` VALUES (340323, '340323', '固镇县', '340300');
INSERT INTO `x2_cityarea` VALUES (340401, '340401', '市辖区', '340400');
INSERT INTO `x2_cityarea` VALUES (340402, '340402', '大通区', '340400');
INSERT INTO `x2_cityarea` VALUES (340403, '340403', '田家庵区', '340400');
INSERT INTO `x2_cityarea` VALUES (340404, '340404', '谢家集区', '340400');
INSERT INTO `x2_cityarea` VALUES (340405, '340405', '八公山区', '340400');
INSERT INTO `x2_cityarea` VALUES (340406, '340406', '潘集区', '340400');
INSERT INTO `x2_cityarea` VALUES (340421, '340421', '凤台县', '340400');
INSERT INTO `x2_cityarea` VALUES (340501, '340501', '市辖区', '340500');
INSERT INTO `x2_cityarea` VALUES (340502, '340502', '金家庄区', '340500');
INSERT INTO `x2_cityarea` VALUES (340503, '340503', '花山区', '340500');
INSERT INTO `x2_cityarea` VALUES (340504, '340504', '雨山区', '340500');
INSERT INTO `x2_cityarea` VALUES (340521, '340521', '当涂县', '340500');
INSERT INTO `x2_cityarea` VALUES (340601, '340601', '市辖区', '340600');
INSERT INTO `x2_cityarea` VALUES (340602, '340602', '杜集区', '340600');
INSERT INTO `x2_cityarea` VALUES (340603, '340603', '相山区', '340600');
INSERT INTO `x2_cityarea` VALUES (340604, '340604', '烈山区', '340600');
INSERT INTO `x2_cityarea` VALUES (340621, '340621', '濉溪县', '340600');
INSERT INTO `x2_cityarea` VALUES (340701, '340701', '市辖区', '340700');
INSERT INTO `x2_cityarea` VALUES (340702, '340702', '铜官山区', '340700');
INSERT INTO `x2_cityarea` VALUES (340703, '340703', '狮子山区', '340700');
INSERT INTO `x2_cityarea` VALUES (340711, '340711', '铜陵市郊区', '340700');
INSERT INTO `x2_cityarea` VALUES (340721, '340721', '铜陵县', '340700');
INSERT INTO `x2_cityarea` VALUES (340801, '340801', '市辖区', '340800');
INSERT INTO `x2_cityarea` VALUES (340802, '340802', '迎江区', '340800');
INSERT INTO `x2_cityarea` VALUES (340803, '340803', '大观区', '340800');
INSERT INTO `x2_cityarea` VALUES (340811, '340811', '宜秀区', '340800');
INSERT INTO `x2_cityarea` VALUES (340822, '340822', '怀宁县', '340800');
INSERT INTO `x2_cityarea` VALUES (340823, '340823', '枞阳县', '340800');
INSERT INTO `x2_cityarea` VALUES (340824, '340824', '潜山县', '340800');
INSERT INTO `x2_cityarea` VALUES (340825, '340825', '太湖县', '340800');
INSERT INTO `x2_cityarea` VALUES (340826, '340826', '宿松县', '340800');
INSERT INTO `x2_cityarea` VALUES (340827, '340827', '望江县', '340800');
INSERT INTO `x2_cityarea` VALUES (340828, '340828', '岳西县', '340800');
INSERT INTO `x2_cityarea` VALUES (340881, '340881', '桐城市', '340800');
INSERT INTO `x2_cityarea` VALUES (341001, '341001', '市辖区', '341000');
INSERT INTO `x2_cityarea` VALUES (341002, '341002', '屯溪区', '341000');
INSERT INTO `x2_cityarea` VALUES (341003, '341003', '黄山区', '341000');
INSERT INTO `x2_cityarea` VALUES (341004, '341004', '徽州区', '341000');
INSERT INTO `x2_cityarea` VALUES (341021, '341021', '歙　县', '341000');
INSERT INTO `x2_cityarea` VALUES (341022, '341022', '休宁县', '341000');
INSERT INTO `x2_cityarea` VALUES (341023, '341023', '黟　县', '341000');
INSERT INTO `x2_cityarea` VALUES (341024, '341024', '祁门县', '341000');
INSERT INTO `x2_cityarea` VALUES (341101, '341101', '市辖区', '341100');
INSERT INTO `x2_cityarea` VALUES (341102, '341102', '琅琊区', '341100');
INSERT INTO `x2_cityarea` VALUES (341103, '341103', '南谯区', '341100');
INSERT INTO `x2_cityarea` VALUES (341122, '341122', '来安县', '341100');
INSERT INTO `x2_cityarea` VALUES (341124, '341124', '全椒县', '341100');
INSERT INTO `x2_cityarea` VALUES (341125, '341125', '定远县', '341100');
INSERT INTO `x2_cityarea` VALUES (341126, '341126', '凤阳县', '341100');
INSERT INTO `x2_cityarea` VALUES (341181, '341181', '天长市', '341100');
INSERT INTO `x2_cityarea` VALUES (341182, '341182', '明光市', '341100');
INSERT INTO `x2_cityarea` VALUES (341201, '341201', '市辖区', '341200');
INSERT INTO `x2_cityarea` VALUES (341202, '341202', '颍州区', '341200');
INSERT INTO `x2_cityarea` VALUES (341203, '341203', '颍东区', '341200');
INSERT INTO `x2_cityarea` VALUES (341204, '341204', '颍泉区', '341200');
INSERT INTO `x2_cityarea` VALUES (341221, '341221', '临泉县', '341200');
INSERT INTO `x2_cityarea` VALUES (341222, '341222', '太和县', '341200');
INSERT INTO `x2_cityarea` VALUES (341225, '341225', '阜南县', '341200');
INSERT INTO `x2_cityarea` VALUES (341226, '341226', '颍上县', '341200');
INSERT INTO `x2_cityarea` VALUES (341282, '341282', '界首市', '341200');
INSERT INTO `x2_cityarea` VALUES (341301, '341301', '市辖区', '341300');
INSERT INTO `x2_cityarea` VALUES (341302, '341302', '墉桥区', '341300');
INSERT INTO `x2_cityarea` VALUES (341321, '341321', '砀山县', '341300');
INSERT INTO `x2_cityarea` VALUES (341322, '341322', '萧　县', '341300');
INSERT INTO `x2_cityarea` VALUES (341323, '341323', '灵璧县', '341300');
INSERT INTO `x2_cityarea` VALUES (341324, '341324', '泗　县', '341300');
INSERT INTO `x2_cityarea` VALUES (341401, '341401', '市辖区', '341400');
INSERT INTO `x2_cityarea` VALUES (341402, '341402', '居巢区', '341400');
INSERT INTO `x2_cityarea` VALUES (341421, '341421', '庐江县', '341400');
INSERT INTO `x2_cityarea` VALUES (341422, '341422', '无为县', '341400');
INSERT INTO `x2_cityarea` VALUES (341423, '341423', '含山县', '341400');
INSERT INTO `x2_cityarea` VALUES (341424, '341424', '和　县', '341400');
INSERT INTO `x2_cityarea` VALUES (341501, '341501', '市辖区', '341500');
INSERT INTO `x2_cityarea` VALUES (341502, '341502', '金安区', '341500');
INSERT INTO `x2_cityarea` VALUES (341503, '341503', '裕安区', '341500');
INSERT INTO `x2_cityarea` VALUES (341521, '341521', '寿　县', '341500');
INSERT INTO `x2_cityarea` VALUES (341522, '341522', '霍邱县', '341500');
INSERT INTO `x2_cityarea` VALUES (341523, '341523', '舒城县', '341500');
INSERT INTO `x2_cityarea` VALUES (341524, '341524', '金寨县', '341500');
INSERT INTO `x2_cityarea` VALUES (341525, '341525', '霍山县', '341500');
INSERT INTO `x2_cityarea` VALUES (341601, '341601', '市辖区', '341600');
INSERT INTO `x2_cityarea` VALUES (341602, '341602', '谯城区', '341600');
INSERT INTO `x2_cityarea` VALUES (341621, '341621', '涡阳县', '341600');
INSERT INTO `x2_cityarea` VALUES (341622, '341622', '蒙城县', '341600');
INSERT INTO `x2_cityarea` VALUES (341623, '341623', '利辛县', '341600');
INSERT INTO `x2_cityarea` VALUES (341701, '341701', '市辖区', '341700');
INSERT INTO `x2_cityarea` VALUES (341702, '341702', '贵池区', '341700');
INSERT INTO `x2_cityarea` VALUES (341721, '341721', '东至县', '341700');
INSERT INTO `x2_cityarea` VALUES (341722, '341722', '石台县', '341700');
INSERT INTO `x2_cityarea` VALUES (341723, '341723', '青阳县', '341700');
INSERT INTO `x2_cityarea` VALUES (341801, '341801', '市辖区', '341800');
INSERT INTO `x2_cityarea` VALUES (341802, '341802', '宣州区', '341800');
INSERT INTO `x2_cityarea` VALUES (341821, '341821', '郎溪县', '341800');
INSERT INTO `x2_cityarea` VALUES (341822, '341822', '广德县', '341800');
INSERT INTO `x2_cityarea` VALUES (341823, '341823', '泾　县', '341800');
INSERT INTO `x2_cityarea` VALUES (341824, '341824', '绩溪县', '341800');
INSERT INTO `x2_cityarea` VALUES (341825, '341825', '旌德县', '341800');
INSERT INTO `x2_cityarea` VALUES (341881, '341881', '宁国市', '341800');
INSERT INTO `x2_cityarea` VALUES (350101, '350101', '市辖区', '350100');
INSERT INTO `x2_cityarea` VALUES (350102, '350102', '鼓楼区', '350100');
INSERT INTO `x2_cityarea` VALUES (350103, '350103', '台江区', '350100');
INSERT INTO `x2_cityarea` VALUES (350104, '350104', '仓山区', '350100');
INSERT INTO `x2_cityarea` VALUES (350105, '350105', '马尾区', '350100');
INSERT INTO `x2_cityarea` VALUES (350111, '350111', '晋安区', '350100');
INSERT INTO `x2_cityarea` VALUES (350121, '350121', '闽侯县', '350100');
INSERT INTO `x2_cityarea` VALUES (350122, '350122', '连江县', '350100');
INSERT INTO `x2_cityarea` VALUES (350123, '350123', '罗源县', '350100');
INSERT INTO `x2_cityarea` VALUES (350124, '350124', '闽清县', '350100');
INSERT INTO `x2_cityarea` VALUES (350125, '350125', '永泰县', '350100');
INSERT INTO `x2_cityarea` VALUES (350128, '350128', '平潭县', '350100');
INSERT INTO `x2_cityarea` VALUES (350181, '350181', '福清市', '350100');
INSERT INTO `x2_cityarea` VALUES (350182, '350182', '长乐市', '350100');
INSERT INTO `x2_cityarea` VALUES (350201, '350201', '市辖区', '350200');
INSERT INTO `x2_cityarea` VALUES (350203, '350203', '思明区', '350200');
INSERT INTO `x2_cityarea` VALUES (350205, '350205', '海沧区', '350200');
INSERT INTO `x2_cityarea` VALUES (350206, '350206', '湖里区', '350200');
INSERT INTO `x2_cityarea` VALUES (350211, '350211', '集美区', '350200');
INSERT INTO `x2_cityarea` VALUES (350212, '350212', '同安区', '350200');
INSERT INTO `x2_cityarea` VALUES (350213, '350213', '翔安区', '350200');
INSERT INTO `x2_cityarea` VALUES (350301, '350301', '市辖区', '350300');
INSERT INTO `x2_cityarea` VALUES (350302, '350302', '城厢区', '350300');
INSERT INTO `x2_cityarea` VALUES (350303, '350303', '涵江区', '350300');
INSERT INTO `x2_cityarea` VALUES (350304, '350304', '荔城区', '350300');
INSERT INTO `x2_cityarea` VALUES (350305, '350305', '秀屿区', '350300');
INSERT INTO `x2_cityarea` VALUES (350322, '350322', '仙游县', '350300');
INSERT INTO `x2_cityarea` VALUES (350401, '350401', '市辖区', '350400');
INSERT INTO `x2_cityarea` VALUES (350402, '350402', '梅列区', '350400');
INSERT INTO `x2_cityarea` VALUES (350403, '350403', '三元区', '350400');
INSERT INTO `x2_cityarea` VALUES (350421, '350421', '明溪县', '350400');
INSERT INTO `x2_cityarea` VALUES (350423, '350423', '清流县', '350400');
INSERT INTO `x2_cityarea` VALUES (350424, '350424', '宁化县', '350400');
INSERT INTO `x2_cityarea` VALUES (350425, '350425', '大田县', '350400');
INSERT INTO `x2_cityarea` VALUES (350426, '350426', '尤溪县', '350400');
INSERT INTO `x2_cityarea` VALUES (350427, '350427', '沙　县', '350400');
INSERT INTO `x2_cityarea` VALUES (350428, '350428', '将乐县', '350400');
INSERT INTO `x2_cityarea` VALUES (350429, '350429', '泰宁县', '350400');
INSERT INTO `x2_cityarea` VALUES (350430, '350430', '建宁县', '350400');
INSERT INTO `x2_cityarea` VALUES (350481, '350481', '永安市', '350400');
INSERT INTO `x2_cityarea` VALUES (350501, '350501', '市辖区', '350500');
INSERT INTO `x2_cityarea` VALUES (350502, '350502', '鲤城区', '350500');
INSERT INTO `x2_cityarea` VALUES (350503, '350503', '丰泽区', '350500');
INSERT INTO `x2_cityarea` VALUES (350504, '350504', '洛江区', '350500');
INSERT INTO `x2_cityarea` VALUES (350505, '350505', '泉港区', '350500');
INSERT INTO `x2_cityarea` VALUES (350521, '350521', '惠安县', '350500');
INSERT INTO `x2_cityarea` VALUES (350524, '350524', '安溪县', '350500');
INSERT INTO `x2_cityarea` VALUES (350525, '350525', '永春县', '350500');
INSERT INTO `x2_cityarea` VALUES (350526, '350526', '德化县', '350500');
INSERT INTO `x2_cityarea` VALUES (350527, '350527', '金门县', '350500');
INSERT INTO `x2_cityarea` VALUES (350581, '350581', '石狮市', '350500');
INSERT INTO `x2_cityarea` VALUES (350582, '350582', '晋江市', '350500');
INSERT INTO `x2_cityarea` VALUES (350583, '350583', '南安市', '350500');
INSERT INTO `x2_cityarea` VALUES (350601, '350601', '市辖区', '350600');
INSERT INTO `x2_cityarea` VALUES (350602, '350602', '芗城区', '350600');
INSERT INTO `x2_cityarea` VALUES (350603, '350603', '龙文区', '350600');
INSERT INTO `x2_cityarea` VALUES (350622, '350622', '云霄县', '350600');
INSERT INTO `x2_cityarea` VALUES (350623, '350623', '漳浦县', '350600');
INSERT INTO `x2_cityarea` VALUES (350624, '350624', '诏安县', '350600');
INSERT INTO `x2_cityarea` VALUES (350625, '350625', '长泰县', '350600');
INSERT INTO `x2_cityarea` VALUES (350626, '350626', '东山县', '350600');
INSERT INTO `x2_cityarea` VALUES (350627, '350627', '南靖县', '350600');
INSERT INTO `x2_cityarea` VALUES (350628, '350628', '平和县', '350600');
INSERT INTO `x2_cityarea` VALUES (350629, '350629', '华安县', '350600');
INSERT INTO `x2_cityarea` VALUES (350681, '350681', '龙海市', '350600');
INSERT INTO `x2_cityarea` VALUES (350701, '350701', '市辖区', '350700');
INSERT INTO `x2_cityarea` VALUES (350702, '350702', '延平区', '350700');
INSERT INTO `x2_cityarea` VALUES (350721, '350721', '顺昌县', '350700');
INSERT INTO `x2_cityarea` VALUES (350722, '350722', '浦城县', '350700');
INSERT INTO `x2_cityarea` VALUES (350723, '350723', '光泽县', '350700');
INSERT INTO `x2_cityarea` VALUES (350724, '350724', '松溪县', '350700');
INSERT INTO `x2_cityarea` VALUES (350725, '350725', '政和县', '350700');
INSERT INTO `x2_cityarea` VALUES (350781, '350781', '邵武市', '350700');
INSERT INTO `x2_cityarea` VALUES (350782, '350782', '武夷山市', '350700');
INSERT INTO `x2_cityarea` VALUES (350783, '350783', '建瓯市', '350700');
INSERT INTO `x2_cityarea` VALUES (350784, '350784', '建阳市', '350700');
INSERT INTO `x2_cityarea` VALUES (350801, '350801', '市辖区', '350800');
INSERT INTO `x2_cityarea` VALUES (350802, '350802', '新罗区', '350800');
INSERT INTO `x2_cityarea` VALUES (350821, '350821', '长汀县', '350800');
INSERT INTO `x2_cityarea` VALUES (350822, '350822', '永定县', '350800');
INSERT INTO `x2_cityarea` VALUES (350823, '350823', '上杭县', '350800');
INSERT INTO `x2_cityarea` VALUES (350824, '350824', '武平县', '350800');
INSERT INTO `x2_cityarea` VALUES (350825, '350825', '连城县', '350800');
INSERT INTO `x2_cityarea` VALUES (350881, '350881', '漳平市', '350800');
INSERT INTO `x2_cityarea` VALUES (350901, '350901', '市辖区', '350900');
INSERT INTO `x2_cityarea` VALUES (350902, '350902', '蕉城区', '350900');
INSERT INTO `x2_cityarea` VALUES (350921, '350921', '霞浦县', '350900');
INSERT INTO `x2_cityarea` VALUES (350922, '350922', '古田县', '350900');
INSERT INTO `x2_cityarea` VALUES (350923, '350923', '屏南县', '350900');
INSERT INTO `x2_cityarea` VALUES (350924, '350924', '寿宁县', '350900');
INSERT INTO `x2_cityarea` VALUES (350925, '350925', '周宁县', '350900');
INSERT INTO `x2_cityarea` VALUES (350926, '350926', '柘荣县', '350900');
INSERT INTO `x2_cityarea` VALUES (350981, '350981', '福安市', '350900');
INSERT INTO `x2_cityarea` VALUES (350982, '350982', '福鼎市', '350900');
INSERT INTO `x2_cityarea` VALUES (360101, '360101', '市辖区', '360100');
INSERT INTO `x2_cityarea` VALUES (360102, '360102', '东湖区', '360100');
INSERT INTO `x2_cityarea` VALUES (360103, '360103', '西湖区', '360100');
INSERT INTO `x2_cityarea` VALUES (360104, '360104', '青云谱区', '360100');
INSERT INTO `x2_cityarea` VALUES (360105, '360105', '湾里区', '360100');
INSERT INTO `x2_cityarea` VALUES (360111, '360111', '青山湖区', '360100');
INSERT INTO `x2_cityarea` VALUES (360121, '360121', '南昌县', '360100');
INSERT INTO `x2_cityarea` VALUES (360122, '360122', '新建县', '360100');
INSERT INTO `x2_cityarea` VALUES (360123, '360123', '安义县', '360100');
INSERT INTO `x2_cityarea` VALUES (360124, '360124', '进贤县', '360100');
INSERT INTO `x2_cityarea` VALUES (360201, '360201', '市辖区', '360200');
INSERT INTO `x2_cityarea` VALUES (360202, '360202', '昌江区', '360200');
INSERT INTO `x2_cityarea` VALUES (360203, '360203', '珠山区', '360200');
INSERT INTO `x2_cityarea` VALUES (360222, '360222', '浮梁县', '360200');
INSERT INTO `x2_cityarea` VALUES (360281, '360281', '乐平市', '360200');
INSERT INTO `x2_cityarea` VALUES (360301, '360301', '市辖区', '360300');
INSERT INTO `x2_cityarea` VALUES (360302, '360302', '安源区', '360300');
INSERT INTO `x2_cityarea` VALUES (360313, '360313', '湘东区', '360300');
INSERT INTO `x2_cityarea` VALUES (360321, '360321', '莲花县', '360300');
INSERT INTO `x2_cityarea` VALUES (360322, '360322', '上栗县', '360300');
INSERT INTO `x2_cityarea` VALUES (360323, '360323', '芦溪县', '360300');
INSERT INTO `x2_cityarea` VALUES (360401, '360401', '市辖区', '360400');
INSERT INTO `x2_cityarea` VALUES (360402, '360402', '庐山区', '360400');
INSERT INTO `x2_cityarea` VALUES (360403, '360403', '浔阳区', '360400');
INSERT INTO `x2_cityarea` VALUES (360421, '360421', '九江县', '360400');
INSERT INTO `x2_cityarea` VALUES (360423, '360423', '武宁县', '360400');
INSERT INTO `x2_cityarea` VALUES (360424, '360424', '修水县', '360400');
INSERT INTO `x2_cityarea` VALUES (360425, '360425', '永修县', '360400');
INSERT INTO `x2_cityarea` VALUES (360426, '360426', '德安县', '360400');
INSERT INTO `x2_cityarea` VALUES (360427, '360427', '星子县', '360400');
INSERT INTO `x2_cityarea` VALUES (360428, '360428', '都昌县', '360400');
INSERT INTO `x2_cityarea` VALUES (360429, '360429', '湖口县', '360400');
INSERT INTO `x2_cityarea` VALUES (360430, '360430', '彭泽县', '360400');
INSERT INTO `x2_cityarea` VALUES (360481, '360481', '瑞昌市', '360400');
INSERT INTO `x2_cityarea` VALUES (360501, '360501', '市辖区', '360500');
INSERT INTO `x2_cityarea` VALUES (360502, '360502', '渝水区', '360500');
INSERT INTO `x2_cityarea` VALUES (360521, '360521', '分宜县', '360500');
INSERT INTO `x2_cityarea` VALUES (360601, '360601', '市辖区', '360600');
INSERT INTO `x2_cityarea` VALUES (360602, '360602', '月湖区', '360600');
INSERT INTO `x2_cityarea` VALUES (360622, '360622', '余江县', '360600');
INSERT INTO `x2_cityarea` VALUES (360681, '360681', '贵溪市', '360600');
INSERT INTO `x2_cityarea` VALUES (360701, '360701', '市辖区', '360700');
INSERT INTO `x2_cityarea` VALUES (360702, '360702', '章贡区', '360700');
INSERT INTO `x2_cityarea` VALUES (360721, '360721', '赣　县', '360700');
INSERT INTO `x2_cityarea` VALUES (360722, '360722', '信丰县', '360700');
INSERT INTO `x2_cityarea` VALUES (360723, '360723', '大余县', '360700');
INSERT INTO `x2_cityarea` VALUES (360724, '360724', '上犹县', '360700');
INSERT INTO `x2_cityarea` VALUES (360725, '360725', '崇义县', '360700');
INSERT INTO `x2_cityarea` VALUES (360726, '360726', '安远县', '360700');
INSERT INTO `x2_cityarea` VALUES (360727, '360727', '龙南县', '360700');
INSERT INTO `x2_cityarea` VALUES (360728, '360728', '定南县', '360700');
INSERT INTO `x2_cityarea` VALUES (360729, '360729', '全南县', '360700');
INSERT INTO `x2_cityarea` VALUES (360730, '360730', '宁都县', '360700');
INSERT INTO `x2_cityarea` VALUES (360731, '360731', '于都县', '360700');
INSERT INTO `x2_cityarea` VALUES (360732, '360732', '兴国县', '360700');
INSERT INTO `x2_cityarea` VALUES (360733, '360733', '会昌县', '360700');
INSERT INTO `x2_cityarea` VALUES (360734, '360734', '寻乌县', '360700');
INSERT INTO `x2_cityarea` VALUES (360735, '360735', '石城县', '360700');
INSERT INTO `x2_cityarea` VALUES (360781, '360781', '瑞金市', '360700');
INSERT INTO `x2_cityarea` VALUES (360782, '360782', '南康市', '360700');
INSERT INTO `x2_cityarea` VALUES (360801, '360801', '市辖区', '360800');
INSERT INTO `x2_cityarea` VALUES (360802, '360802', '吉州区', '360800');
INSERT INTO `x2_cityarea` VALUES (360803, '360803', '青原区', '360800');
INSERT INTO `x2_cityarea` VALUES (360821, '360821', '吉安县', '360800');
INSERT INTO `x2_cityarea` VALUES (360822, '360822', '吉水县', '360800');
INSERT INTO `x2_cityarea` VALUES (360823, '360823', '峡江县', '360800');
INSERT INTO `x2_cityarea` VALUES (360824, '360824', '新干县', '360800');
INSERT INTO `x2_cityarea` VALUES (360825, '360825', '永丰县', '360800');
INSERT INTO `x2_cityarea` VALUES (360826, '360826', '泰和县', '360800');
INSERT INTO `x2_cityarea` VALUES (360827, '360827', '遂川县', '360800');
INSERT INTO `x2_cityarea` VALUES (360828, '360828', '万安县', '360800');
INSERT INTO `x2_cityarea` VALUES (360829, '360829', '安福县', '360800');
INSERT INTO `x2_cityarea` VALUES (360830, '360830', '永新县', '360800');
INSERT INTO `x2_cityarea` VALUES (360881, '360881', '井冈山市', '360800');
INSERT INTO `x2_cityarea` VALUES (360901, '360901', '市辖区', '360900');
INSERT INTO `x2_cityarea` VALUES (360902, '360902', '袁州区', '360900');
INSERT INTO `x2_cityarea` VALUES (360921, '360921', '奉新县', '360900');
INSERT INTO `x2_cityarea` VALUES (360922, '360922', '万载县', '360900');
INSERT INTO `x2_cityarea` VALUES (360923, '360923', '上高县', '360900');
INSERT INTO `x2_cityarea` VALUES (360924, '360924', '宜丰县', '360900');
INSERT INTO `x2_cityarea` VALUES (360925, '360925', '靖安县', '360900');
INSERT INTO `x2_cityarea` VALUES (360926, '360926', '铜鼓县', '360900');
INSERT INTO `x2_cityarea` VALUES (360981, '360981', '丰城市', '360900');
INSERT INTO `x2_cityarea` VALUES (360982, '360982', '樟树市', '360900');
INSERT INTO `x2_cityarea` VALUES (360983, '360983', '高安市', '360900');
INSERT INTO `x2_cityarea` VALUES (361001, '361001', '市辖区', '361000');
INSERT INTO `x2_cityarea` VALUES (361002, '361002', '临川区', '361000');
INSERT INTO `x2_cityarea` VALUES (361021, '361021', '南城县', '361000');
INSERT INTO `x2_cityarea` VALUES (361022, '361022', '黎川县', '361000');
INSERT INTO `x2_cityarea` VALUES (361023, '361023', '南丰县', '361000');
INSERT INTO `x2_cityarea` VALUES (361024, '361024', '崇仁县', '361000');
INSERT INTO `x2_cityarea` VALUES (361025, '361025', '乐安县', '361000');
INSERT INTO `x2_cityarea` VALUES (361026, '361026', '宜黄县', '361000');
INSERT INTO `x2_cityarea` VALUES (361027, '361027', '金溪县', '361000');
INSERT INTO `x2_cityarea` VALUES (361028, '361028', '资溪县', '361000');
INSERT INTO `x2_cityarea` VALUES (361029, '361029', '东乡县', '361000');
INSERT INTO `x2_cityarea` VALUES (361030, '361030', '广昌县', '361000');
INSERT INTO `x2_cityarea` VALUES (361101, '361101', '市辖区', '361100');
INSERT INTO `x2_cityarea` VALUES (361102, '361102', '信州区', '361100');
INSERT INTO `x2_cityarea` VALUES (361121, '361121', '上饶县', '361100');
INSERT INTO `x2_cityarea` VALUES (361122, '361122', '广丰县', '361100');
INSERT INTO `x2_cityarea` VALUES (361123, '361123', '玉山县', '361100');
INSERT INTO `x2_cityarea` VALUES (361124, '361124', '铅山县', '361100');
INSERT INTO `x2_cityarea` VALUES (361125, '361125', '横峰县', '361100');
INSERT INTO `x2_cityarea` VALUES (361126, '361126', '弋阳县', '361100');
INSERT INTO `x2_cityarea` VALUES (361127, '361127', '余干县', '361100');
INSERT INTO `x2_cityarea` VALUES (361128, '361128', '鄱阳县', '361100');
INSERT INTO `x2_cityarea` VALUES (361129, '361129', '万年县', '361100');
INSERT INTO `x2_cityarea` VALUES (361130, '361130', '婺源县', '361100');
INSERT INTO `x2_cityarea` VALUES (361181, '361181', '德兴市', '361100');
INSERT INTO `x2_cityarea` VALUES (370101, '370101', '市辖区', '370100');
INSERT INTO `x2_cityarea` VALUES (370102, '370102', '历下区', '370100');
INSERT INTO `x2_cityarea` VALUES (370103, '370103', '市中区', '370100');
INSERT INTO `x2_cityarea` VALUES (370104, '370104', '槐荫区', '370100');
INSERT INTO `x2_cityarea` VALUES (370105, '370105', '天桥区', '370100');
INSERT INTO `x2_cityarea` VALUES (370112, '370112', '历城区', '370100');
INSERT INTO `x2_cityarea` VALUES (370113, '370113', '长清区', '370100');
INSERT INTO `x2_cityarea` VALUES (370124, '370124', '平阴县', '370100');
INSERT INTO `x2_cityarea` VALUES (370125, '370125', '济阳县', '370100');
INSERT INTO `x2_cityarea` VALUES (370126, '370126', '商河县', '370100');
INSERT INTO `x2_cityarea` VALUES (370181, '370181', '章丘市', '370100');
INSERT INTO `x2_cityarea` VALUES (370201, '370201', '市辖区', '370200');
INSERT INTO `x2_cityarea` VALUES (370202, '370202', '市南区', '370200');
INSERT INTO `x2_cityarea` VALUES (370203, '370203', '市北区', '370200');
INSERT INTO `x2_cityarea` VALUES (370205, '370205', '四方区', '370200');
INSERT INTO `x2_cityarea` VALUES (370211, '370211', '黄岛区', '370200');
INSERT INTO `x2_cityarea` VALUES (370212, '370212', '崂山区', '370200');
INSERT INTO `x2_cityarea` VALUES (370213, '370213', '李沧区', '370200');
INSERT INTO `x2_cityarea` VALUES (370214, '370214', '城阳区', '370200');
INSERT INTO `x2_cityarea` VALUES (370281, '370281', '胶州市', '370200');
INSERT INTO `x2_cityarea` VALUES (370282, '370282', '即墨市', '370200');
INSERT INTO `x2_cityarea` VALUES (370283, '370283', '平度市', '370200');
INSERT INTO `x2_cityarea` VALUES (370284, '370284', '胶南市', '370200');
INSERT INTO `x2_cityarea` VALUES (370285, '370285', '莱西市', '370200');
INSERT INTO `x2_cityarea` VALUES (370301, '370301', '市辖区', '370300');
INSERT INTO `x2_cityarea` VALUES (370302, '370302', '淄川区', '370300');
INSERT INTO `x2_cityarea` VALUES (370303, '370303', '张店区', '370300');
INSERT INTO `x2_cityarea` VALUES (370304, '370304', '博山区', '370300');
INSERT INTO `x2_cityarea` VALUES (370305, '370305', '临淄区', '370300');
INSERT INTO `x2_cityarea` VALUES (370306, '370306', '周村区', '370300');
INSERT INTO `x2_cityarea` VALUES (370321, '370321', '桓台县', '370300');
INSERT INTO `x2_cityarea` VALUES (370322, '370322', '高青县', '370300');
INSERT INTO `x2_cityarea` VALUES (370323, '370323', '沂源县', '370300');
INSERT INTO `x2_cityarea` VALUES (370401, '370401', '市辖区', '370400');
INSERT INTO `x2_cityarea` VALUES (370402, '370402', '市中区', '370400');
INSERT INTO `x2_cityarea` VALUES (370403, '370403', '薛城区', '370400');
INSERT INTO `x2_cityarea` VALUES (370404, '370404', '峄城区', '370400');
INSERT INTO `x2_cityarea` VALUES (370405, '370405', '台儿庄区', '370400');
INSERT INTO `x2_cityarea` VALUES (370406, '370406', '山亭区', '370400');
INSERT INTO `x2_cityarea` VALUES (370481, '370481', '滕州市', '370400');
INSERT INTO `x2_cityarea` VALUES (370501, '370501', '市辖区', '370500');
INSERT INTO `x2_cityarea` VALUES (370502, '370502', '东营区', '370500');
INSERT INTO `x2_cityarea` VALUES (370503, '370503', '河口区', '370500');
INSERT INTO `x2_cityarea` VALUES (370521, '370521', '垦利县', '370500');
INSERT INTO `x2_cityarea` VALUES (370522, '370522', '利津县', '370500');
INSERT INTO `x2_cityarea` VALUES (370523, '370523', '广饶县', '370500');
INSERT INTO `x2_cityarea` VALUES (370601, '370601', '市辖区', '370600');
INSERT INTO `x2_cityarea` VALUES (370602, '370602', '芝罘区', '370600');
INSERT INTO `x2_cityarea` VALUES (370611, '370611', '福山区', '370600');
INSERT INTO `x2_cityarea` VALUES (370612, '370612', '牟平区', '370600');
INSERT INTO `x2_cityarea` VALUES (370613, '370613', '莱山区', '370600');
INSERT INTO `x2_cityarea` VALUES (370634, '370634', '长岛县', '370600');
INSERT INTO `x2_cityarea` VALUES (370681, '370681', '龙口市', '370600');
INSERT INTO `x2_cityarea` VALUES (370682, '370682', '莱阳市', '370600');
INSERT INTO `x2_cityarea` VALUES (370683, '370683', '莱州市', '370600');
INSERT INTO `x2_cityarea` VALUES (370684, '370684', '蓬莱市', '370600');
INSERT INTO `x2_cityarea` VALUES (370685, '370685', '招远市', '370600');
INSERT INTO `x2_cityarea` VALUES (370686, '370686', '栖霞市', '370600');
INSERT INTO `x2_cityarea` VALUES (370687, '370687', '海阳市', '370600');
INSERT INTO `x2_cityarea` VALUES (370701, '370701', '市辖区', '370700');
INSERT INTO `x2_cityarea` VALUES (370702, '370702', '潍城区', '370700');
INSERT INTO `x2_cityarea` VALUES (370703, '370703', '寒亭区', '370700');
INSERT INTO `x2_cityarea` VALUES (370704, '370704', '坊子区', '370700');
INSERT INTO `x2_cityarea` VALUES (370705, '370705', '奎文区', '370700');
INSERT INTO `x2_cityarea` VALUES (370724, '370724', '临朐县', '370700');
INSERT INTO `x2_cityarea` VALUES (370725, '370725', '昌乐县', '370700');
INSERT INTO `x2_cityarea` VALUES (370781, '370781', '青州市', '370700');
INSERT INTO `x2_cityarea` VALUES (370782, '370782', '诸城市', '370700');
INSERT INTO `x2_cityarea` VALUES (370783, '370783', '寿光市', '370700');
INSERT INTO `x2_cityarea` VALUES (370784, '370784', '安丘市', '370700');
INSERT INTO `x2_cityarea` VALUES (370785, '370785', '高密市', '370700');
INSERT INTO `x2_cityarea` VALUES (370786, '370786', '昌邑市', '370700');
INSERT INTO `x2_cityarea` VALUES (370801, '370801', '市辖区', '370800');
INSERT INTO `x2_cityarea` VALUES (370802, '370802', '市中区', '370800');
INSERT INTO `x2_cityarea` VALUES (370811, '370811', '任城区', '370800');
INSERT INTO `x2_cityarea` VALUES (370826, '370826', '微山县', '370800');
INSERT INTO `x2_cityarea` VALUES (370827, '370827', '鱼台县', '370800');
INSERT INTO `x2_cityarea` VALUES (370828, '370828', '金乡县', '370800');
INSERT INTO `x2_cityarea` VALUES (370829, '370829', '嘉祥县', '370800');
INSERT INTO `x2_cityarea` VALUES (370830, '370830', '汶上县', '370800');
INSERT INTO `x2_cityarea` VALUES (370831, '370831', '泗水县', '370800');
INSERT INTO `x2_cityarea` VALUES (370832, '370832', '梁山县', '370800');
INSERT INTO `x2_cityarea` VALUES (370881, '370881', '曲阜市', '370800');
INSERT INTO `x2_cityarea` VALUES (370882, '370882', '兖州市', '370800');
INSERT INTO `x2_cityarea` VALUES (370883, '370883', '邹城市', '370800');
INSERT INTO `x2_cityarea` VALUES (370901, '370901', '市辖区', '370900');
INSERT INTO `x2_cityarea` VALUES (370902, '370902', '泰山区', '370900');
INSERT INTO `x2_cityarea` VALUES (370903, '370903', '岱岳区', '370900');
INSERT INTO `x2_cityarea` VALUES (370921, '370921', '宁阳县', '370900');
INSERT INTO `x2_cityarea` VALUES (370923, '370923', '东平县', '370900');
INSERT INTO `x2_cityarea` VALUES (370982, '370982', '新泰市', '370900');
INSERT INTO `x2_cityarea` VALUES (370983, '370983', '肥城市', '370900');
INSERT INTO `x2_cityarea` VALUES (371001, '371001', '市辖区', '371000');
INSERT INTO `x2_cityarea` VALUES (371002, '371002', '环翠区', '371000');
INSERT INTO `x2_cityarea` VALUES (371081, '371081', '文登市', '371000');
INSERT INTO `x2_cityarea` VALUES (371082, '371082', '荣成市', '371000');
INSERT INTO `x2_cityarea` VALUES (371083, '371083', '乳山市', '371000');
INSERT INTO `x2_cityarea` VALUES (371101, '371101', '市辖区', '371100');
INSERT INTO `x2_cityarea` VALUES (371102, '371102', '东港区', '371100');
INSERT INTO `x2_cityarea` VALUES (371103, '371103', '岚山区', '371100');
INSERT INTO `x2_cityarea` VALUES (371121, '371121', '五莲县', '371100');
INSERT INTO `x2_cityarea` VALUES (371122, '371122', '莒　县', '371100');
INSERT INTO `x2_cityarea` VALUES (371201, '371201', '市辖区', '371200');
INSERT INTO `x2_cityarea` VALUES (371202, '371202', '莱城区', '371200');
INSERT INTO `x2_cityarea` VALUES (371203, '371203', '钢城区', '371200');
INSERT INTO `x2_cityarea` VALUES (371301, '371301', '市辖区', '371300');
INSERT INTO `x2_cityarea` VALUES (371302, '371302', '兰山区', '371300');
INSERT INTO `x2_cityarea` VALUES (371311, '371311', '罗庄区', '371300');
INSERT INTO `x2_cityarea` VALUES (371312, '371312', '河东区', '371300');
INSERT INTO `x2_cityarea` VALUES (371321, '371321', '沂南县', '371300');
INSERT INTO `x2_cityarea` VALUES (371322, '371322', '郯城县', '371300');
INSERT INTO `x2_cityarea` VALUES (371323, '371323', '沂水县', '371300');
INSERT INTO `x2_cityarea` VALUES (371324, '371324', '苍山县', '371300');
INSERT INTO `x2_cityarea` VALUES (371325, '371325', '费　县', '371300');
INSERT INTO `x2_cityarea` VALUES (371326, '371326', '平邑县', '371300');
INSERT INTO `x2_cityarea` VALUES (371327, '371327', '莒南县', '371300');
INSERT INTO `x2_cityarea` VALUES (371328, '371328', '蒙阴县', '371300');
INSERT INTO `x2_cityarea` VALUES (371329, '371329', '临沭县', '371300');
INSERT INTO `x2_cityarea` VALUES (371401, '371401', '市辖区', '371400');
INSERT INTO `x2_cityarea` VALUES (371402, '371402', '德城区', '371400');
INSERT INTO `x2_cityarea` VALUES (371421, '371421', '陵　县', '371400');
INSERT INTO `x2_cityarea` VALUES (371422, '371422', '宁津县', '371400');
INSERT INTO `x2_cityarea` VALUES (371423, '371423', '庆云县', '371400');
INSERT INTO `x2_cityarea` VALUES (371424, '371424', '临邑县', '371400');
INSERT INTO `x2_cityarea` VALUES (371425, '371425', '齐河县', '371400');
INSERT INTO `x2_cityarea` VALUES (371426, '371426', '平原县', '371400');
INSERT INTO `x2_cityarea` VALUES (371427, '371427', '夏津县', '371400');
INSERT INTO `x2_cityarea` VALUES (371428, '371428', '武城县', '371400');
INSERT INTO `x2_cityarea` VALUES (371481, '371481', '乐陵市', '371400');
INSERT INTO `x2_cityarea` VALUES (371482, '371482', '禹城市', '371400');
INSERT INTO `x2_cityarea` VALUES (371501, '371501', '市辖区', '371500');
INSERT INTO `x2_cityarea` VALUES (371502, '371502', '东昌府区', '371500');
INSERT INTO `x2_cityarea` VALUES (371521, '371521', '阳谷县', '371500');
INSERT INTO `x2_cityarea` VALUES (371522, '371522', '莘　县', '371500');
INSERT INTO `x2_cityarea` VALUES (371523, '371523', '茌平县', '371500');
INSERT INTO `x2_cityarea` VALUES (371524, '371524', '东阿县', '371500');
INSERT INTO `x2_cityarea` VALUES (371525, '371525', '冠　县', '371500');
INSERT INTO `x2_cityarea` VALUES (371526, '371526', '高唐县', '371500');
INSERT INTO `x2_cityarea` VALUES (371581, '371581', '临清市', '371500');
INSERT INTO `x2_cityarea` VALUES (371601, '371601', '市辖区', '371600');
INSERT INTO `x2_cityarea` VALUES (371602, '371602', '滨城区', '371600');
INSERT INTO `x2_cityarea` VALUES (371621, '371621', '惠民县', '371600');
INSERT INTO `x2_cityarea` VALUES (371622, '371622', '阳信县', '371600');
INSERT INTO `x2_cityarea` VALUES (371623, '371623', '无棣县', '371600');
INSERT INTO `x2_cityarea` VALUES (371624, '371624', '沾化县', '371600');
INSERT INTO `x2_cityarea` VALUES (371625, '371625', '博兴县', '371600');
INSERT INTO `x2_cityarea` VALUES (371626, '371626', '邹平县', '371600');
INSERT INTO `x2_cityarea` VALUES (371701, '371701', '市辖区', '371700');
INSERT INTO `x2_cityarea` VALUES (371702, '371702', '牡丹区', '371700');
INSERT INTO `x2_cityarea` VALUES (371721, '371721', '曹　县', '371700');
INSERT INTO `x2_cityarea` VALUES (371722, '371722', '单　县', '371700');
INSERT INTO `x2_cityarea` VALUES (371723, '371723', '成武县', '371700');
INSERT INTO `x2_cityarea` VALUES (371724, '371724', '巨野县', '371700');
INSERT INTO `x2_cityarea` VALUES (371725, '371725', '郓城县', '371700');
INSERT INTO `x2_cityarea` VALUES (371726, '371726', '鄄城县', '371700');
INSERT INTO `x2_cityarea` VALUES (371727, '371727', '定陶县', '371700');
INSERT INTO `x2_cityarea` VALUES (371728, '371728', '东明县', '371700');
INSERT INTO `x2_cityarea` VALUES (410101, '410101', '市辖区', '410100');
INSERT INTO `x2_cityarea` VALUES (410102, '410102', '中原区', '410100');
INSERT INTO `x2_cityarea` VALUES (410103, '410103', '二七区', '410100');
INSERT INTO `x2_cityarea` VALUES (410104, '410104', '管城回族区', '410100');
INSERT INTO `x2_cityarea` VALUES (410105, '410105', '金水区', '410100');
INSERT INTO `x2_cityarea` VALUES (410106, '410106', '上街区', '410100');
INSERT INTO `x2_cityarea` VALUES (410108, '410108', '惠济区', '410100');
INSERT INTO `x2_cityarea` VALUES (410122, '410122', '中牟县', '410100');
INSERT INTO `x2_cityarea` VALUES (410181, '410181', '巩义市', '410100');
INSERT INTO `x2_cityarea` VALUES (410182, '410182', '荥阳市', '410100');
INSERT INTO `x2_cityarea` VALUES (410183, '410183', '新密市', '410100');
INSERT INTO `x2_cityarea` VALUES (410184, '410184', '新郑市', '410100');
INSERT INTO `x2_cityarea` VALUES (410185, '410185', '登封市', '410100');
INSERT INTO `x2_cityarea` VALUES (410186, '410186', '高新技术开发区', '410100');
INSERT INTO `x2_cityarea` VALUES (410187, '410187', '郑东新区', '410100');
INSERT INTO `x2_cityarea` VALUES (410188, '410188', '经济开发区', '410100');
INSERT INTO `x2_cityarea` VALUES (410201, '410201', '市辖区', '410200');
INSERT INTO `x2_cityarea` VALUES (410202, '410202', '龙亭区', '410200');
INSERT INTO `x2_cityarea` VALUES (410203, '410203', '顺河回族区', '410200');
INSERT INTO `x2_cityarea` VALUES (410204, '410204', '鼓楼区', '410200');
INSERT INTO `x2_cityarea` VALUES (410205, '410205', '禹王台区', '410200');
INSERT INTO `x2_cityarea` VALUES (410211, '410211', '郊   区', '410200');
INSERT INTO `x2_cityarea` VALUES (410221, '410221', '杞　县', '410200');
INSERT INTO `x2_cityarea` VALUES (410222, '410222', '通许县', '410200');
INSERT INTO `x2_cityarea` VALUES (410223, '410223', '尉氏县', '410200');
INSERT INTO `x2_cityarea` VALUES (410224, '410224', '开封县', '410200');
INSERT INTO `x2_cityarea` VALUES (410225, '410225', '兰考县', '410200');
INSERT INTO `x2_cityarea` VALUES (410301, '410301', '市辖区', '410300');
INSERT INTO `x2_cityarea` VALUES (410302, '410302', '老城区', '410300');
INSERT INTO `x2_cityarea` VALUES (410303, '410303', '西工区', '410300');
INSERT INTO `x2_cityarea` VALUES (410304, '410304', '廛河回族区', '410300');
INSERT INTO `x2_cityarea` VALUES (410305, '410305', '涧西区', '410300');
INSERT INTO `x2_cityarea` VALUES (410306, '410306', '吉利区', '410300');
INSERT INTO `x2_cityarea` VALUES (410307, '410307', '洛龙区', '410300');
INSERT INTO `x2_cityarea` VALUES (410322, '410322', '孟津县', '410300');
INSERT INTO `x2_cityarea` VALUES (410323, '410323', '新安县', '410300');
INSERT INTO `x2_cityarea` VALUES (410324, '410324', '栾川县', '410300');
INSERT INTO `x2_cityarea` VALUES (410325, '410325', '嵩　县', '410300');
INSERT INTO `x2_cityarea` VALUES (410326, '410326', '汝阳县', '410300');
INSERT INTO `x2_cityarea` VALUES (410327, '410327', '宜阳县', '410300');
INSERT INTO `x2_cityarea` VALUES (410328, '410328', '洛宁县', '410300');
INSERT INTO `x2_cityarea` VALUES (410329, '410329', '伊川县', '410300');
INSERT INTO `x2_cityarea` VALUES (410381, '410381', '偃师市', '410300');
INSERT INTO `x2_cityarea` VALUES (410401, '410401', '市辖区', '410400');
INSERT INTO `x2_cityarea` VALUES (410402, '410402', '新华区', '410400');
INSERT INTO `x2_cityarea` VALUES (410403, '410403', '卫东区', '410400');
INSERT INTO `x2_cityarea` VALUES (410404, '410404', '石龙区', '410400');
INSERT INTO `x2_cityarea` VALUES (410411, '410411', '湛河区', '410400');
INSERT INTO `x2_cityarea` VALUES (410421, '410421', '宝丰县', '410400');
INSERT INTO `x2_cityarea` VALUES (410422, '410422', '叶　县', '410400');
INSERT INTO `x2_cityarea` VALUES (410423, '410423', '鲁山县', '410400');
INSERT INTO `x2_cityarea` VALUES (410425, '410425', '郏　县', '410400');
INSERT INTO `x2_cityarea` VALUES (410481, '410481', '舞钢市', '410400');
INSERT INTO `x2_cityarea` VALUES (410482, '410482', '汝州市', '410400');
INSERT INTO `x2_cityarea` VALUES (410501, '410501', '市辖区', '410500');
INSERT INTO `x2_cityarea` VALUES (410502, '410502', '文峰区', '410500');
INSERT INTO `x2_cityarea` VALUES (410503, '410503', '北关区', '410500');
INSERT INTO `x2_cityarea` VALUES (410505, '410505', '殷都区', '410500');
INSERT INTO `x2_cityarea` VALUES (410506, '410506', '龙安区', '410500');
INSERT INTO `x2_cityarea` VALUES (410522, '410522', '安阳县', '410500');
INSERT INTO `x2_cityarea` VALUES (410523, '410523', '汤阴县', '410500');
INSERT INTO `x2_cityarea` VALUES (410526, '410526', '滑　县', '410500');
INSERT INTO `x2_cityarea` VALUES (410527, '410527', '内黄县', '410500');
INSERT INTO `x2_cityarea` VALUES (410581, '410581', '林州市', '410500');
INSERT INTO `x2_cityarea` VALUES (410601, '410601', '市辖区', '410600');
INSERT INTO `x2_cityarea` VALUES (410602, '410602', '鹤山区', '410600');
INSERT INTO `x2_cityarea` VALUES (410603, '410603', '山城区', '410600');
INSERT INTO `x2_cityarea` VALUES (410611, '410611', '淇滨区', '410600');
INSERT INTO `x2_cityarea` VALUES (410621, '410621', '浚　县', '410600');
INSERT INTO `x2_cityarea` VALUES (410622, '410622', '淇　县', '410600');
INSERT INTO `x2_cityarea` VALUES (410701, '410701', '市辖区', '410700');
INSERT INTO `x2_cityarea` VALUES (410702, '410702', '红旗区', '410700');
INSERT INTO `x2_cityarea` VALUES (410703, '410703', '卫滨区', '410700');
INSERT INTO `x2_cityarea` VALUES (410704, '410704', '凤泉区', '410700');
INSERT INTO `x2_cityarea` VALUES (410711, '410711', '牧野区', '410700');
INSERT INTO `x2_cityarea` VALUES (410721, '410721', '新乡县', '410700');
INSERT INTO `x2_cityarea` VALUES (410724, '410724', '获嘉县', '410700');
INSERT INTO `x2_cityarea` VALUES (410725, '410725', '原阳县', '410700');
INSERT INTO `x2_cityarea` VALUES (410726, '410726', '延津县', '410700');
INSERT INTO `x2_cityarea` VALUES (410727, '410727', '封丘县', '410700');
INSERT INTO `x2_cityarea` VALUES (410728, '410728', '长垣县', '410700');
INSERT INTO `x2_cityarea` VALUES (410781, '410781', '卫辉市', '410700');
INSERT INTO `x2_cityarea` VALUES (410782, '410782', '辉县市', '410700');
INSERT INTO `x2_cityarea` VALUES (410801, '410801', '市辖区', '410800');
INSERT INTO `x2_cityarea` VALUES (410802, '410802', '解放区', '410800');
INSERT INTO `x2_cityarea` VALUES (410803, '410803', '中站区', '410800');
INSERT INTO `x2_cityarea` VALUES (410804, '410804', '马村区', '410800');
INSERT INTO `x2_cityarea` VALUES (410811, '410811', '山阳区', '410800');
INSERT INTO `x2_cityarea` VALUES (410821, '410821', '修武县', '410800');
INSERT INTO `x2_cityarea` VALUES (410822, '410822', '博爱县', '410800');
INSERT INTO `x2_cityarea` VALUES (410823, '410823', '武陟县', '410800');
INSERT INTO `x2_cityarea` VALUES (410825, '410825', '温　县', '410800');
INSERT INTO `x2_cityarea` VALUES (410881, '410881', '济源市', '410800');
INSERT INTO `x2_cityarea` VALUES (410882, '410882', '沁阳市', '410800');
INSERT INTO `x2_cityarea` VALUES (410883, '410883', '孟州市', '410800');
INSERT INTO `x2_cityarea` VALUES (410901, '410901', '市辖区', '410900');
INSERT INTO `x2_cityarea` VALUES (410902, '410902', '华龙区', '410900');
INSERT INTO `x2_cityarea` VALUES (410922, '410922', '清丰县', '410900');
INSERT INTO `x2_cityarea` VALUES (410923, '410923', '南乐县', '410900');
INSERT INTO `x2_cityarea` VALUES (410926, '410926', '范　县', '410900');
INSERT INTO `x2_cityarea` VALUES (410927, '410927', '台前县', '410900');
INSERT INTO `x2_cityarea` VALUES (410928, '410928', '濮阳县', '410900');
INSERT INTO `x2_cityarea` VALUES (411001, '411001', '市辖区', '411000');
INSERT INTO `x2_cityarea` VALUES (411002, '411002', '魏都区', '411000');
INSERT INTO `x2_cityarea` VALUES (411023, '411023', '许昌县', '411000');
INSERT INTO `x2_cityarea` VALUES (411024, '411024', '鄢陵县', '411000');
INSERT INTO `x2_cityarea` VALUES (411025, '411025', '襄城县', '411000');
INSERT INTO `x2_cityarea` VALUES (411081, '411081', '禹州市', '411000');
INSERT INTO `x2_cityarea` VALUES (411082, '411082', '长葛市', '411000');
INSERT INTO `x2_cityarea` VALUES (411101, '411101', '市辖区', '411100');
INSERT INTO `x2_cityarea` VALUES (411102, '411102', '源汇区', '411100');
INSERT INTO `x2_cityarea` VALUES (411103, '411103', '郾城区', '411100');
INSERT INTO `x2_cityarea` VALUES (411104, '411104', '召陵区', '411100');
INSERT INTO `x2_cityarea` VALUES (411121, '411121', '舞阳县', '411100');
INSERT INTO `x2_cityarea` VALUES (411122, '411122', '临颍县', '411100');
INSERT INTO `x2_cityarea` VALUES (411201, '411201', '市辖区', '411200');
INSERT INTO `x2_cityarea` VALUES (411202, '411202', '湖滨区', '411200');
INSERT INTO `x2_cityarea` VALUES (411221, '411221', '渑池县', '411200');
INSERT INTO `x2_cityarea` VALUES (411222, '411222', '陕　县', '411200');
INSERT INTO `x2_cityarea` VALUES (411224, '411224', '卢氏县', '411200');
INSERT INTO `x2_cityarea` VALUES (411281, '411281', '义马市', '411200');
INSERT INTO `x2_cityarea` VALUES (411282, '411282', '灵宝市', '411200');
INSERT INTO `x2_cityarea` VALUES (411301, '411301', '市辖区', '411300');
INSERT INTO `x2_cityarea` VALUES (411302, '411302', '宛城区', '411300');
INSERT INTO `x2_cityarea` VALUES (411303, '411303', '卧龙区', '411300');
INSERT INTO `x2_cityarea` VALUES (411321, '411321', '南召县', '411300');
INSERT INTO `x2_cityarea` VALUES (411322, '411322', '方城县', '411300');
INSERT INTO `x2_cityarea` VALUES (411323, '411323', '西峡县', '411300');
INSERT INTO `x2_cityarea` VALUES (411324, '411324', '镇平县', '411300');
INSERT INTO `x2_cityarea` VALUES (411325, '411325', '内乡县', '411300');
INSERT INTO `x2_cityarea` VALUES (411326, '411326', '淅川县', '411300');
INSERT INTO `x2_cityarea` VALUES (411327, '411327', '社旗县', '411300');
INSERT INTO `x2_cityarea` VALUES (411328, '411328', '唐河县', '411300');
INSERT INTO `x2_cityarea` VALUES (411329, '411329', '新野县', '411300');
INSERT INTO `x2_cityarea` VALUES (411330, '411330', '桐柏县', '411300');
INSERT INTO `x2_cityarea` VALUES (411381, '411381', '邓州市', '411300');
INSERT INTO `x2_cityarea` VALUES (411401, '411401', '市辖区', '411400');
INSERT INTO `x2_cityarea` VALUES (411402, '411402', '梁园区', '411400');
INSERT INTO `x2_cityarea` VALUES (411403, '411403', '睢阳区', '411400');
INSERT INTO `x2_cityarea` VALUES (411421, '411421', '民权县', '411400');
INSERT INTO `x2_cityarea` VALUES (411422, '411422', '睢　县', '411400');
INSERT INTO `x2_cityarea` VALUES (411423, '411423', '宁陵县', '411400');
INSERT INTO `x2_cityarea` VALUES (411424, '411424', '柘城县', '411400');
INSERT INTO `x2_cityarea` VALUES (411425, '411425', '虞城县', '411400');
INSERT INTO `x2_cityarea` VALUES (411426, '411426', '夏邑县', '411400');
INSERT INTO `x2_cityarea` VALUES (411481, '411481', '永城市', '411400');
INSERT INTO `x2_cityarea` VALUES (411501, '411501', '市辖区', '411500');
INSERT INTO `x2_cityarea` VALUES (411502, '411502', '师河区', '411500');
INSERT INTO `x2_cityarea` VALUES (411503, '411503', '平桥区', '411500');
INSERT INTO `x2_cityarea` VALUES (411521, '411521', '罗山县', '411500');
INSERT INTO `x2_cityarea` VALUES (411522, '411522', '光山县', '411500');
INSERT INTO `x2_cityarea` VALUES (411523, '411523', '新　县', '411500');
INSERT INTO `x2_cityarea` VALUES (411524, '411524', '商城县', '411500');
INSERT INTO `x2_cityarea` VALUES (411525, '411525', '固始县', '411500');
INSERT INTO `x2_cityarea` VALUES (411526, '411526', '潢川县', '411500');
INSERT INTO `x2_cityarea` VALUES (411527, '411527', '淮滨县', '411500');
INSERT INTO `x2_cityarea` VALUES (411528, '411528', '息　县', '411500');
INSERT INTO `x2_cityarea` VALUES (411601, '411601', '市辖区', '411600');
INSERT INTO `x2_cityarea` VALUES (411602, '411602', '川汇区', '411600');
INSERT INTO `x2_cityarea` VALUES (411621, '411621', '扶沟县', '411600');
INSERT INTO `x2_cityarea` VALUES (411622, '411622', '西华县', '411600');
INSERT INTO `x2_cityarea` VALUES (411623, '411623', '商水县', '411600');
INSERT INTO `x2_cityarea` VALUES (411624, '411624', '沈丘县', '411600');
INSERT INTO `x2_cityarea` VALUES (411625, '411625', '郸城县', '411600');
INSERT INTO `x2_cityarea` VALUES (411626, '411626', '淮阳县', '411600');
INSERT INTO `x2_cityarea` VALUES (411627, '411627', '太康县', '411600');
INSERT INTO `x2_cityarea` VALUES (411628, '411628', '鹿邑县', '411600');
INSERT INTO `x2_cityarea` VALUES (411681, '411681', '项城市', '411600');
INSERT INTO `x2_cityarea` VALUES (411701, '411701', '市辖区', '411700');
INSERT INTO `x2_cityarea` VALUES (411702, '411702', '驿城区', '411700');
INSERT INTO `x2_cityarea` VALUES (411721, '411721', '西平县', '411700');
INSERT INTO `x2_cityarea` VALUES (411722, '411722', '上蔡县', '411700');
INSERT INTO `x2_cityarea` VALUES (411723, '411723', '平舆县', '411700');
INSERT INTO `x2_cityarea` VALUES (411724, '411724', '正阳县', '411700');
INSERT INTO `x2_cityarea` VALUES (411725, '411725', '确山县', '411700');
INSERT INTO `x2_cityarea` VALUES (411726, '411726', '泌阳县', '411700');
INSERT INTO `x2_cityarea` VALUES (411727, '411727', '汝南县', '411700');
INSERT INTO `x2_cityarea` VALUES (411728, '411728', '遂平县', '411700');
INSERT INTO `x2_cityarea` VALUES (411729, '411729', '新蔡县', '411700');
INSERT INTO `x2_cityarea` VALUES (420101, '420101', '市辖区', '420100');
INSERT INTO `x2_cityarea` VALUES (420102, '420102', '江岸区', '420100');
INSERT INTO `x2_cityarea` VALUES (420103, '420103', '江汉区', '420100');
INSERT INTO `x2_cityarea` VALUES (420104, '420104', '乔口区', '420100');
INSERT INTO `x2_cityarea` VALUES (420105, '420105', '汉阳区', '420100');
INSERT INTO `x2_cityarea` VALUES (420106, '420106', '武昌区', '420100');
INSERT INTO `x2_cityarea` VALUES (420107, '420107', '青山区', '420100');
INSERT INTO `x2_cityarea` VALUES (420111, '420111', '洪山区', '420100');
INSERT INTO `x2_cityarea` VALUES (420112, '420112', '东西湖区', '420100');
INSERT INTO `x2_cityarea` VALUES (420113, '420113', '汉南区', '420100');
INSERT INTO `x2_cityarea` VALUES (420114, '420114', '蔡甸区', '420100');
INSERT INTO `x2_cityarea` VALUES (420115, '420115', '江夏区', '420100');
INSERT INTO `x2_cityarea` VALUES (420116, '420116', '黄陂区', '420100');
INSERT INTO `x2_cityarea` VALUES (420117, '420117', '新洲区', '420100');
INSERT INTO `x2_cityarea` VALUES (420201, '420201', '市辖区', '420200');
INSERT INTO `x2_cityarea` VALUES (420202, '420202', '黄石港区', '420200');
INSERT INTO `x2_cityarea` VALUES (420203, '420203', '西塞山区', '420200');
INSERT INTO `x2_cityarea` VALUES (420204, '420204', '下陆区', '420200');
INSERT INTO `x2_cityarea` VALUES (420205, '420205', '铁山区', '420200');
INSERT INTO `x2_cityarea` VALUES (420222, '420222', '阳新县', '420200');
INSERT INTO `x2_cityarea` VALUES (420281, '420281', '大冶市', '420200');
INSERT INTO `x2_cityarea` VALUES (420301, '420301', '市辖区', '420300');
INSERT INTO `x2_cityarea` VALUES (420302, '420302', '茅箭区', '420300');
INSERT INTO `x2_cityarea` VALUES (420303, '420303', '张湾区', '420300');
INSERT INTO `x2_cityarea` VALUES (420321, '420321', '郧　县', '420300');
INSERT INTO `x2_cityarea` VALUES (420322, '420322', '郧西县', '420300');
INSERT INTO `x2_cityarea` VALUES (420323, '420323', '竹山县', '420300');
INSERT INTO `x2_cityarea` VALUES (420324, '420324', '竹溪县', '420300');
INSERT INTO `x2_cityarea` VALUES (420325, '420325', '房　县', '420300');
INSERT INTO `x2_cityarea` VALUES (420381, '420381', '丹江口市', '420300');
INSERT INTO `x2_cityarea` VALUES (420501, '420501', '市辖区', '420500');
INSERT INTO `x2_cityarea` VALUES (420502, '420502', '西陵区', '420500');
INSERT INTO `x2_cityarea` VALUES (420503, '420503', '伍家岗区', '420500');
INSERT INTO `x2_cityarea` VALUES (420504, '420504', '点军区', '420500');
INSERT INTO `x2_cityarea` VALUES (420505, '420505', '猇亭区', '420500');
INSERT INTO `x2_cityarea` VALUES (420506, '420506', '夷陵区', '420500');
INSERT INTO `x2_cityarea` VALUES (420525, '420525', '远安县', '420500');
INSERT INTO `x2_cityarea` VALUES (420526, '420526', '兴山县', '420500');
INSERT INTO `x2_cityarea` VALUES (420527, '420527', '秭归县', '420500');
INSERT INTO `x2_cityarea` VALUES (420528, '420528', '长阳土家族自治县', '420500');
INSERT INTO `x2_cityarea` VALUES (420529, '420529', '五峰土家族自治县', '420500');
INSERT INTO `x2_cityarea` VALUES (420581, '420581', '宜都市', '420500');
INSERT INTO `x2_cityarea` VALUES (420582, '420582', '当阳市', '420500');
INSERT INTO `x2_cityarea` VALUES (420583, '420583', '枝江市', '420500');
INSERT INTO `x2_cityarea` VALUES (420601, '420601', '市辖区', '420600');
INSERT INTO `x2_cityarea` VALUES (420602, '420602', '襄城区', '420600');
INSERT INTO `x2_cityarea` VALUES (420606, '420606', '樊城区', '420600');
INSERT INTO `x2_cityarea` VALUES (420607, '420607', '襄阳区', '420600');
INSERT INTO `x2_cityarea` VALUES (420624, '420624', '南漳县', '420600');
INSERT INTO `x2_cityarea` VALUES (420625, '420625', '谷城县', '420600');
INSERT INTO `x2_cityarea` VALUES (420626, '420626', '保康县', '420600');
INSERT INTO `x2_cityarea` VALUES (420682, '420682', '老河口市', '420600');
INSERT INTO `x2_cityarea` VALUES (420683, '420683', '枣阳市', '420600');
INSERT INTO `x2_cityarea` VALUES (420684, '420684', '宜城市', '420600');
INSERT INTO `x2_cityarea` VALUES (420701, '420701', '市辖区', '420700');
INSERT INTO `x2_cityarea` VALUES (420702, '420702', '梁子湖区', '420700');
INSERT INTO `x2_cityarea` VALUES (420703, '420703', '华容区', '420700');
INSERT INTO `x2_cityarea` VALUES (420704, '420704', '鄂城区', '420700');
INSERT INTO `x2_cityarea` VALUES (420801, '420801', '市辖区', '420800');
INSERT INTO `x2_cityarea` VALUES (420802, '420802', '东宝区', '420800');
INSERT INTO `x2_cityarea` VALUES (420804, '420804', '掇刀区', '420800');
INSERT INTO `x2_cityarea` VALUES (420821, '420821', '京山县', '420800');
INSERT INTO `x2_cityarea` VALUES (420822, '420822', '沙洋县', '420800');
INSERT INTO `x2_cityarea` VALUES (420881, '420881', '钟祥市', '420800');
INSERT INTO `x2_cityarea` VALUES (420901, '420901', '市辖区', '420900');
INSERT INTO `x2_cityarea` VALUES (420902, '420902', '孝南区', '420900');
INSERT INTO `x2_cityarea` VALUES (420921, '420921', '孝昌县', '420900');
INSERT INTO `x2_cityarea` VALUES (420922, '420922', '大悟县', '420900');
INSERT INTO `x2_cityarea` VALUES (420923, '420923', '云梦县', '420900');
INSERT INTO `x2_cityarea` VALUES (420981, '420981', '应城市', '420900');
INSERT INTO `x2_cityarea` VALUES (420982, '420982', '安陆市', '420900');
INSERT INTO `x2_cityarea` VALUES (420984, '420984', '汉川市', '420900');
INSERT INTO `x2_cityarea` VALUES (421001, '421001', '市辖区', '421000');
INSERT INTO `x2_cityarea` VALUES (421002, '421002', '沙市区', '421000');
INSERT INTO `x2_cityarea` VALUES (421003, '421003', '荆州区', '421000');
INSERT INTO `x2_cityarea` VALUES (421022, '421022', '公安县', '421000');
INSERT INTO `x2_cityarea` VALUES (421023, '421023', '监利县', '421000');
INSERT INTO `x2_cityarea` VALUES (421024, '421024', '江陵县', '421000');
INSERT INTO `x2_cityarea` VALUES (421081, '421081', '石首市', '421000');
INSERT INTO `x2_cityarea` VALUES (421083, '421083', '洪湖市', '421000');
INSERT INTO `x2_cityarea` VALUES (421087, '421087', '松滋市', '421000');
INSERT INTO `x2_cityarea` VALUES (421101, '421101', '市辖区', '421100');
INSERT INTO `x2_cityarea` VALUES (421102, '421102', '黄州区', '421100');
INSERT INTO `x2_cityarea` VALUES (421121, '421121', '团风县', '421100');
INSERT INTO `x2_cityarea` VALUES (421122, '421122', '红安县', '421100');
INSERT INTO `x2_cityarea` VALUES (421123, '421123', '罗田县', '421100');
INSERT INTO `x2_cityarea` VALUES (421124, '421124', '英山县', '421100');
INSERT INTO `x2_cityarea` VALUES (421125, '421125', '浠水县', '421100');
INSERT INTO `x2_cityarea` VALUES (421126, '421126', '蕲春县', '421100');
INSERT INTO `x2_cityarea` VALUES (421127, '421127', '黄梅县', '421100');
INSERT INTO `x2_cityarea` VALUES (421181, '421181', '麻城市', '421100');
INSERT INTO `x2_cityarea` VALUES (421182, '421182', '武穴市', '421100');
INSERT INTO `x2_cityarea` VALUES (421201, '421201', '市辖区', '421200');
INSERT INTO `x2_cityarea` VALUES (421202, '421202', '咸安区', '421200');
INSERT INTO `x2_cityarea` VALUES (421221, '421221', '嘉鱼县', '421200');
INSERT INTO `x2_cityarea` VALUES (421222, '421222', '通城县', '421200');
INSERT INTO `x2_cityarea` VALUES (421223, '421223', '崇阳县', '421200');
INSERT INTO `x2_cityarea` VALUES (421224, '421224', '通山县', '421200');
INSERT INTO `x2_cityarea` VALUES (421281, '421281', '赤壁市', '421200');
INSERT INTO `x2_cityarea` VALUES (421301, '421301', '市辖区', '421300');
INSERT INTO `x2_cityarea` VALUES (421302, '421302', '曾都区', '421300');
INSERT INTO `x2_cityarea` VALUES (421381, '421381', '广水市', '421300');
INSERT INTO `x2_cityarea` VALUES (422801, '422801', '恩施市', '422800');
INSERT INTO `x2_cityarea` VALUES (422802, '422802', '利川市', '422800');
INSERT INTO `x2_cityarea` VALUES (422822, '422822', '建始县', '422800');
INSERT INTO `x2_cityarea` VALUES (422823, '422823', '巴东县', '422800');
INSERT INTO `x2_cityarea` VALUES (422825, '422825', '宣恩县', '422800');
INSERT INTO `x2_cityarea` VALUES (422826, '422826', '咸丰县', '422800');
INSERT INTO `x2_cityarea` VALUES (422827, '422827', '来凤县', '422800');
INSERT INTO `x2_cityarea` VALUES (422828, '422828', '鹤峰县', '422800');
INSERT INTO `x2_cityarea` VALUES (429004, '429004', '仙桃市', '429000');
INSERT INTO `x2_cityarea` VALUES (429005, '429005', '潜江市', '429000');
INSERT INTO `x2_cityarea` VALUES (429006, '429006', '天门市', '429000');
INSERT INTO `x2_cityarea` VALUES (429021, '429021', '神农架林区', '429000');
INSERT INTO `x2_cityarea` VALUES (430101, '430101', '市辖区', '430100');
INSERT INTO `x2_cityarea` VALUES (430102, '430102', '芙蓉区', '430100');
INSERT INTO `x2_cityarea` VALUES (430103, '430103', '天心区', '430100');
INSERT INTO `x2_cityarea` VALUES (430104, '430104', '岳麓区', '430100');
INSERT INTO `x2_cityarea` VALUES (430105, '430105', '开福区', '430100');
INSERT INTO `x2_cityarea` VALUES (430111, '430111', '雨花区', '430100');
INSERT INTO `x2_cityarea` VALUES (430121, '430121', '长沙县', '430100');
INSERT INTO `x2_cityarea` VALUES (430122, '430122', '望城县', '430100');
INSERT INTO `x2_cityarea` VALUES (430124, '430124', '宁乡县', '430100');
INSERT INTO `x2_cityarea` VALUES (430181, '430181', '浏阳市', '430100');
INSERT INTO `x2_cityarea` VALUES (430201, '430201', '市辖区', '430200');
INSERT INTO `x2_cityarea` VALUES (430202, '430202', '荷塘区', '430200');
INSERT INTO `x2_cityarea` VALUES (430203, '430203', '芦淞区', '430200');
INSERT INTO `x2_cityarea` VALUES (430204, '430204', '石峰区', '430200');
INSERT INTO `x2_cityarea` VALUES (430211, '430211', '天元区', '430200');
INSERT INTO `x2_cityarea` VALUES (430221, '430221', '株洲县', '430200');
INSERT INTO `x2_cityarea` VALUES (430223, '430223', '攸　县', '430200');
INSERT INTO `x2_cityarea` VALUES (430224, '430224', '茶陵县', '430200');
INSERT INTO `x2_cityarea` VALUES (430225, '430225', '炎陵县', '430200');
INSERT INTO `x2_cityarea` VALUES (430281, '430281', '醴陵市', '430200');
INSERT INTO `x2_cityarea` VALUES (430301, '430301', '市辖区', '430300');
INSERT INTO `x2_cityarea` VALUES (430302, '430302', '雨湖区', '430300');
INSERT INTO `x2_cityarea` VALUES (430304, '430304', '岳塘区', '430300');
INSERT INTO `x2_cityarea` VALUES (430321, '430321', '湘潭县', '430300');
INSERT INTO `x2_cityarea` VALUES (430381, '430381', '湘乡市', '430300');
INSERT INTO `x2_cityarea` VALUES (430382, '430382', '韶山市', '430300');
INSERT INTO `x2_cityarea` VALUES (430401, '430401', '市辖区', '430400');
INSERT INTO `x2_cityarea` VALUES (430405, '430405', '珠晖区', '430400');
INSERT INTO `x2_cityarea` VALUES (430406, '430406', '雁峰区', '430400');
INSERT INTO `x2_cityarea` VALUES (430407, '430407', '石鼓区', '430400');
INSERT INTO `x2_cityarea` VALUES (430408, '430408', '蒸湘区', '430400');
INSERT INTO `x2_cityarea` VALUES (430412, '430412', '南岳区', '430400');
INSERT INTO `x2_cityarea` VALUES (430421, '430421', '衡阳县', '430400');
INSERT INTO `x2_cityarea` VALUES (430422, '430422', '衡南县', '430400');
INSERT INTO `x2_cityarea` VALUES (430423, '430423', '衡山县', '430400');
INSERT INTO `x2_cityarea` VALUES (430424, '430424', '衡东县', '430400');
INSERT INTO `x2_cityarea` VALUES (430426, '430426', '祁东县', '430400');
INSERT INTO `x2_cityarea` VALUES (430481, '430481', '耒阳市', '430400');
INSERT INTO `x2_cityarea` VALUES (430482, '430482', '常宁市', '430400');
INSERT INTO `x2_cityarea` VALUES (430501, '430501', '市辖区', '430500');
INSERT INTO `x2_cityarea` VALUES (430502, '430502', '双清区', '430500');
INSERT INTO `x2_cityarea` VALUES (430503, '430503', '大祥区', '430500');
INSERT INTO `x2_cityarea` VALUES (430511, '430511', '北塔区', '430500');
INSERT INTO `x2_cityarea` VALUES (430521, '430521', '邵东县', '430500');
INSERT INTO `x2_cityarea` VALUES (430522, '430522', '新邵县', '430500');
INSERT INTO `x2_cityarea` VALUES (430523, '430523', '邵阳县', '430500');
INSERT INTO `x2_cityarea` VALUES (430524, '430524', '隆回县', '430500');
INSERT INTO `x2_cityarea` VALUES (430525, '430525', '洞口县', '430500');
INSERT INTO `x2_cityarea` VALUES (430527, '430527', '绥宁县', '430500');
INSERT INTO `x2_cityarea` VALUES (430528, '430528', '新宁县', '430500');
INSERT INTO `x2_cityarea` VALUES (430529, '430529', '城步苗族自治县', '430500');
INSERT INTO `x2_cityarea` VALUES (430581, '430581', '武冈市', '430500');
INSERT INTO `x2_cityarea` VALUES (430601, '430601', '市辖区', '430600');
INSERT INTO `x2_cityarea` VALUES (430602, '430602', '岳阳楼区', '430600');
INSERT INTO `x2_cityarea` VALUES (430603, '430603', '云溪区', '430600');
INSERT INTO `x2_cityarea` VALUES (430611, '430611', '君山区', '430600');
INSERT INTO `x2_cityarea` VALUES (430621, '430621', '岳阳县', '430600');
INSERT INTO `x2_cityarea` VALUES (430623, '430623', '华容县', '430600');
INSERT INTO `x2_cityarea` VALUES (430624, '430624', '湘阴县', '430600');
INSERT INTO `x2_cityarea` VALUES (430626, '430626', '平江县', '430600');
INSERT INTO `x2_cityarea` VALUES (430681, '430681', '汨罗市', '430600');
INSERT INTO `x2_cityarea` VALUES (430682, '430682', '临湘市', '430600');
INSERT INTO `x2_cityarea` VALUES (430701, '430701', '市辖区', '430700');
INSERT INTO `x2_cityarea` VALUES (430702, '430702', '武陵区', '430700');
INSERT INTO `x2_cityarea` VALUES (430703, '430703', '鼎城区', '430700');
INSERT INTO `x2_cityarea` VALUES (430721, '430721', '安乡县', '430700');
INSERT INTO `x2_cityarea` VALUES (430722, '430722', '汉寿县', '430700');
INSERT INTO `x2_cityarea` VALUES (430723, '430723', '澧　县', '430700');
INSERT INTO `x2_cityarea` VALUES (430724, '430724', '临澧县', '430700');
INSERT INTO `x2_cityarea` VALUES (430725, '430725', '桃源县', '430700');
INSERT INTO `x2_cityarea` VALUES (430726, '430726', '石门县', '430700');
INSERT INTO `x2_cityarea` VALUES (430781, '430781', '津市市', '430700');
INSERT INTO `x2_cityarea` VALUES (430801, '430801', '市辖区', '430800');
INSERT INTO `x2_cityarea` VALUES (430802, '430802', '永定区', '430800');
INSERT INTO `x2_cityarea` VALUES (430811, '430811', '武陵源区', '430800');
INSERT INTO `x2_cityarea` VALUES (430821, '430821', '慈利县', '430800');
INSERT INTO `x2_cityarea` VALUES (430822, '430822', '桑植县', '430800');
INSERT INTO `x2_cityarea` VALUES (430901, '430901', '市辖区', '430900');
INSERT INTO `x2_cityarea` VALUES (430902, '430902', '资阳区', '430900');
INSERT INTO `x2_cityarea` VALUES (430903, '430903', '赫山区', '430900');
INSERT INTO `x2_cityarea` VALUES (430921, '430921', '南　县', '430900');
INSERT INTO `x2_cityarea` VALUES (430922, '430922', '桃江县', '430900');
INSERT INTO `x2_cityarea` VALUES (430923, '430923', '安化县', '430900');
INSERT INTO `x2_cityarea` VALUES (430981, '430981', '沅江市', '430900');
INSERT INTO `x2_cityarea` VALUES (431001, '431001', '市辖区', '431000');
INSERT INTO `x2_cityarea` VALUES (431002, '431002', '北湖区', '431000');
INSERT INTO `x2_cityarea` VALUES (431003, '431003', '苏仙区', '431000');
INSERT INTO `x2_cityarea` VALUES (431021, '431021', '桂阳县', '431000');
INSERT INTO `x2_cityarea` VALUES (431022, '431022', '宜章县', '431000');
INSERT INTO `x2_cityarea` VALUES (431023, '431023', '永兴县', '431000');
INSERT INTO `x2_cityarea` VALUES (431024, '431024', '嘉禾县', '431000');
INSERT INTO `x2_cityarea` VALUES (431025, '431025', '临武县', '431000');
INSERT INTO `x2_cityarea` VALUES (431026, '431026', '汝城县', '431000');
INSERT INTO `x2_cityarea` VALUES (431027, '431027', '桂东县', '431000');
INSERT INTO `x2_cityarea` VALUES (431028, '431028', '安仁县', '431000');
INSERT INTO `x2_cityarea` VALUES (431081, '431081', '资兴市', '431000');
INSERT INTO `x2_cityarea` VALUES (431101, '431101', '市辖区', '431100');
INSERT INTO `x2_cityarea` VALUES (431102, '431102', '零陵区', '431100');
INSERT INTO `x2_cityarea` VALUES (431103, '431103', '冷水滩区', '431100');
INSERT INTO `x2_cityarea` VALUES (431121, '431121', '祁阳县', '431100');
INSERT INTO `x2_cityarea` VALUES (431122, '431122', '东安县', '431100');
INSERT INTO `x2_cityarea` VALUES (431123, '431123', '双牌县', '431100');
INSERT INTO `x2_cityarea` VALUES (431124, '431124', '道　县', '431100');
INSERT INTO `x2_cityarea` VALUES (431125, '431125', '江永县', '431100');
INSERT INTO `x2_cityarea` VALUES (431126, '431126', '宁远县', '431100');
INSERT INTO `x2_cityarea` VALUES (431127, '431127', '蓝山县', '431100');
INSERT INTO `x2_cityarea` VALUES (431128, '431128', '新田县', '431100');
INSERT INTO `x2_cityarea` VALUES (431129, '431129', '江华瑶族自治县', '431100');
INSERT INTO `x2_cityarea` VALUES (431201, '431201', '市辖区', '431200');
INSERT INTO `x2_cityarea` VALUES (431202, '431202', '鹤城区', '431200');
INSERT INTO `x2_cityarea` VALUES (431221, '431221', '中方县', '431200');
INSERT INTO `x2_cityarea` VALUES (431222, '431222', '沅陵县', '431200');
INSERT INTO `x2_cityarea` VALUES (431223, '431223', '辰溪县', '431200');
INSERT INTO `x2_cityarea` VALUES (431224, '431224', '溆浦县', '431200');
INSERT INTO `x2_cityarea` VALUES (431225, '431225', '会同县', '431200');
INSERT INTO `x2_cityarea` VALUES (431226, '431226', '麻阳苗族自治县', '431200');
INSERT INTO `x2_cityarea` VALUES (431227, '431227', '新晃侗族自治县', '431200');
INSERT INTO `x2_cityarea` VALUES (431228, '431228', '芷江侗族自治县', '431200');
INSERT INTO `x2_cityarea` VALUES (431229, '431229', '靖州苗族侗族自治县', '431200');
INSERT INTO `x2_cityarea` VALUES (431230, '431230', '通道侗族自治县', '431200');
INSERT INTO `x2_cityarea` VALUES (431281, '431281', '洪江市', '431200');
INSERT INTO `x2_cityarea` VALUES (431301, '431301', '市辖区', '431300');
INSERT INTO `x2_cityarea` VALUES (431302, '431302', '娄星区', '431300');
INSERT INTO `x2_cityarea` VALUES (431321, '431321', '双峰县', '431300');
INSERT INTO `x2_cityarea` VALUES (431322, '431322', '新化县', '431300');
INSERT INTO `x2_cityarea` VALUES (431381, '431381', '冷水江市', '431300');
INSERT INTO `x2_cityarea` VALUES (431382, '431382', '涟源市', '431300');
INSERT INTO `x2_cityarea` VALUES (433101, '433101', '吉首市', '433100');
INSERT INTO `x2_cityarea` VALUES (433122, '433122', '泸溪县', '433100');
INSERT INTO `x2_cityarea` VALUES (433123, '433123', '凤凰县', '433100');
INSERT INTO `x2_cityarea` VALUES (433124, '433124', '花垣县', '433100');
INSERT INTO `x2_cityarea` VALUES (433125, '433125', '保靖县', '433100');
INSERT INTO `x2_cityarea` VALUES (433126, '433126', '古丈县', '433100');
INSERT INTO `x2_cityarea` VALUES (433127, '433127', '永顺县', '433100');
INSERT INTO `x2_cityarea` VALUES (433130, '433130', '龙山县', '433100');
INSERT INTO `x2_cityarea` VALUES (440101, '440101', '市辖区', '440100');
INSERT INTO `x2_cityarea` VALUES (440102, '440102', '东山区', '440100');
INSERT INTO `x2_cityarea` VALUES (440103, '440103', '荔湾区', '440100');
INSERT INTO `x2_cityarea` VALUES (440104, '440104', '越秀区', '440100');
INSERT INTO `x2_cityarea` VALUES (440105, '440105', '海珠区', '440100');
INSERT INTO `x2_cityarea` VALUES (440106, '440106', '天河区', '440100');
INSERT INTO `x2_cityarea` VALUES (440107, '440107', '芳村区', '440100');
INSERT INTO `x2_cityarea` VALUES (440111, '440111', '白云区', '440100');
INSERT INTO `x2_cityarea` VALUES (440112, '440112', '黄埔区', '440100');
INSERT INTO `x2_cityarea` VALUES (440113, '440113', '番禺区', '440100');
INSERT INTO `x2_cityarea` VALUES (440114, '440114', '花都区', '440100');
INSERT INTO `x2_cityarea` VALUES (440115, '440115', '南沙区', '440100');
INSERT INTO `x2_cityarea` VALUES (440116, '440116', '萝岗区', '440100');
INSERT INTO `x2_cityarea` VALUES (440183, '440183', '增城市', '440100');
INSERT INTO `x2_cityarea` VALUES (440184, '440184', '从化市', '440100');
INSERT INTO `x2_cityarea` VALUES (440201, '440201', '市辖区', '440200');
INSERT INTO `x2_cityarea` VALUES (440203, '440203', '武江区', '440200');
INSERT INTO `x2_cityarea` VALUES (440204, '440204', '浈江区', '440200');
INSERT INTO `x2_cityarea` VALUES (440205, '440205', '曲江区', '440200');
INSERT INTO `x2_cityarea` VALUES (440222, '440222', '始兴县', '440200');
INSERT INTO `x2_cityarea` VALUES (440224, '440224', '仁化县', '440200');
INSERT INTO `x2_cityarea` VALUES (440229, '440229', '翁源县', '440200');
INSERT INTO `x2_cityarea` VALUES (440232, '440232', '乳源瑶族自治县', '440200');
INSERT INTO `x2_cityarea` VALUES (440233, '440233', '新丰县', '440200');
INSERT INTO `x2_cityarea` VALUES (440281, '440281', '乐昌市', '440200');
INSERT INTO `x2_cityarea` VALUES (440282, '440282', '南雄市', '440200');
INSERT INTO `x2_cityarea` VALUES (440301, '440301', '市辖区', '440300');
INSERT INTO `x2_cityarea` VALUES (440303, '440303', '罗湖区', '440300');
INSERT INTO `x2_cityarea` VALUES (440304, '440304', '福田区', '440300');
INSERT INTO `x2_cityarea` VALUES (440305, '440305', '南山区', '440300');
INSERT INTO `x2_cityarea` VALUES (440306, '440306', '宝安区', '440300');
INSERT INTO `x2_cityarea` VALUES (440307, '440307', '龙岗区', '440300');
INSERT INTO `x2_cityarea` VALUES (440308, '440308', '盐田区', '440300');
INSERT INTO `x2_cityarea` VALUES (440401, '440401', '市辖区', '440400');
INSERT INTO `x2_cityarea` VALUES (440402, '440402', '香洲区', '440400');
INSERT INTO `x2_cityarea` VALUES (440403, '440403', '斗门区', '440400');
INSERT INTO `x2_cityarea` VALUES (440404, '440404', '金湾区', '440400');
INSERT INTO `x2_cityarea` VALUES (440501, '440501', '市辖区', '440500');
INSERT INTO `x2_cityarea` VALUES (440507, '440507', '龙湖区', '440500');
INSERT INTO `x2_cityarea` VALUES (440511, '440511', '金平区', '440500');
INSERT INTO `x2_cityarea` VALUES (440512, '440512', '濠江区', '440500');
INSERT INTO `x2_cityarea` VALUES (440513, '440513', '潮阳区', '440500');
INSERT INTO `x2_cityarea` VALUES (440514, '440514', '潮南区', '440500');
INSERT INTO `x2_cityarea` VALUES (440515, '440515', '澄海区', '440500');
INSERT INTO `x2_cityarea` VALUES (440523, '440523', '南澳县', '440500');
INSERT INTO `x2_cityarea` VALUES (440601, '440601', '市辖区', '440600');
INSERT INTO `x2_cityarea` VALUES (440604, '440604', '禅城区', '440600');
INSERT INTO `x2_cityarea` VALUES (440605, '440605', '南海区', '440600');
INSERT INTO `x2_cityarea` VALUES (440606, '440606', '顺德区', '440600');
INSERT INTO `x2_cityarea` VALUES (440607, '440607', '三水区', '440600');
INSERT INTO `x2_cityarea` VALUES (440608, '440608', '高明区', '440600');
INSERT INTO `x2_cityarea` VALUES (440701, '440701', '市辖区', '440700');
INSERT INTO `x2_cityarea` VALUES (440703, '440703', '蓬江区', '440700');
INSERT INTO `x2_cityarea` VALUES (440704, '440704', '江海区', '440700');
INSERT INTO `x2_cityarea` VALUES (440705, '440705', '新会区', '440700');
INSERT INTO `x2_cityarea` VALUES (440781, '440781', '台山市', '440700');
INSERT INTO `x2_cityarea` VALUES (440783, '440783', '开平市', '440700');
INSERT INTO `x2_cityarea` VALUES (440784, '440784', '鹤山市', '440700');
INSERT INTO `x2_cityarea` VALUES (440785, '440785', '恩平市', '440700');
INSERT INTO `x2_cityarea` VALUES (440801, '440801', '市辖区', '440800');
INSERT INTO `x2_cityarea` VALUES (440802, '440802', '赤坎区', '440800');
INSERT INTO `x2_cityarea` VALUES (440803, '440803', '霞山区', '440800');
INSERT INTO `x2_cityarea` VALUES (440804, '440804', '坡头区', '440800');
INSERT INTO `x2_cityarea` VALUES (440811, '440811', '麻章区', '440800');
INSERT INTO `x2_cityarea` VALUES (440823, '440823', '遂溪县', '440800');
INSERT INTO `x2_cityarea` VALUES (440825, '440825', '徐闻县', '440800');
INSERT INTO `x2_cityarea` VALUES (440881, '440881', '廉江市', '440800');
INSERT INTO `x2_cityarea` VALUES (440882, '440882', '雷州市', '440800');
INSERT INTO `x2_cityarea` VALUES (440883, '440883', '吴川市', '440800');
INSERT INTO `x2_cityarea` VALUES (440901, '440901', '市辖区', '440900');
INSERT INTO `x2_cityarea` VALUES (440902, '440902', '茂南区', '440900');
INSERT INTO `x2_cityarea` VALUES (440903, '440903', '茂港区', '440900');
INSERT INTO `x2_cityarea` VALUES (440923, '440923', '电白县', '440900');
INSERT INTO `x2_cityarea` VALUES (440981, '440981', '高州市', '440900');
INSERT INTO `x2_cityarea` VALUES (440982, '440982', '化州市', '440900');
INSERT INTO `x2_cityarea` VALUES (440983, '440983', '信宜市', '440900');
INSERT INTO `x2_cityarea` VALUES (441201, '441201', '市辖区', '441200');
INSERT INTO `x2_cityarea` VALUES (441202, '441202', '端州区', '441200');
INSERT INTO `x2_cityarea` VALUES (441203, '441203', '鼎湖区', '441200');
INSERT INTO `x2_cityarea` VALUES (441223, '441223', '广宁县', '441200');
INSERT INTO `x2_cityarea` VALUES (441224, '441224', '怀集县', '441200');
INSERT INTO `x2_cityarea` VALUES (441225, '441225', '封开县', '441200');
INSERT INTO `x2_cityarea` VALUES (441226, '441226', '德庆县', '441200');
INSERT INTO `x2_cityarea` VALUES (441283, '441283', '高要市', '441200');
INSERT INTO `x2_cityarea` VALUES (441284, '441284', '四会市', '441200');
INSERT INTO `x2_cityarea` VALUES (441301, '441301', '市辖区', '441300');
INSERT INTO `x2_cityarea` VALUES (441302, '441302', '惠城区', '441300');
INSERT INTO `x2_cityarea` VALUES (441303, '441303', '惠阳区', '441300');
INSERT INTO `x2_cityarea` VALUES (441322, '441322', '博罗县', '441300');
INSERT INTO `x2_cityarea` VALUES (441323, '441323', '惠东县', '441300');
INSERT INTO `x2_cityarea` VALUES (441324, '441324', '龙门县', '441300');
INSERT INTO `x2_cityarea` VALUES (441401, '441401', '市辖区', '441400');
INSERT INTO `x2_cityarea` VALUES (441402, '441402', '梅江区', '441400');
INSERT INTO `x2_cityarea` VALUES (441421, '441421', '梅　县', '441400');
INSERT INTO `x2_cityarea` VALUES (441422, '441422', '大埔县', '441400');
INSERT INTO `x2_cityarea` VALUES (441423, '441423', '丰顺县', '441400');
INSERT INTO `x2_cityarea` VALUES (441424, '441424', '五华县', '441400');
INSERT INTO `x2_cityarea` VALUES (441426, '441426', '平远县', '441400');
INSERT INTO `x2_cityarea` VALUES (441427, '441427', '蕉岭县', '441400');
INSERT INTO `x2_cityarea` VALUES (441481, '441481', '兴宁市', '441400');
INSERT INTO `x2_cityarea` VALUES (441501, '441501', '市辖区', '441500');
INSERT INTO `x2_cityarea` VALUES (441502, '441502', '城　区', '441500');
INSERT INTO `x2_cityarea` VALUES (441521, '441521', '海丰县', '441500');
INSERT INTO `x2_cityarea` VALUES (441523, '441523', '陆河县', '441500');
INSERT INTO `x2_cityarea` VALUES (441581, '441581', '陆丰市', '441500');
INSERT INTO `x2_cityarea` VALUES (441601, '441601', '市辖区', '441600');
INSERT INTO `x2_cityarea` VALUES (441602, '441602', '源城区', '441600');
INSERT INTO `x2_cityarea` VALUES (441621, '441621', '紫金县', '441600');
INSERT INTO `x2_cityarea` VALUES (441622, '441622', '龙川县', '441600');
INSERT INTO `x2_cityarea` VALUES (441623, '441623', '连平县', '441600');
INSERT INTO `x2_cityarea` VALUES (441624, '441624', '和平县', '441600');
INSERT INTO `x2_cityarea` VALUES (441625, '441625', '东源县', '441600');
INSERT INTO `x2_cityarea` VALUES (441701, '441701', '市辖区', '441700');
INSERT INTO `x2_cityarea` VALUES (441702, '441702', '江城区', '441700');
INSERT INTO `x2_cityarea` VALUES (441721, '441721', '阳西县', '441700');
INSERT INTO `x2_cityarea` VALUES (441723, '441723', '阳东县', '441700');
INSERT INTO `x2_cityarea` VALUES (441781, '441781', '阳春市', '441700');
INSERT INTO `x2_cityarea` VALUES (441801, '441801', '市辖区', '441800');
INSERT INTO `x2_cityarea` VALUES (441802, '441802', '清城区', '441800');
INSERT INTO `x2_cityarea` VALUES (441821, '441821', '佛冈县', '441800');
INSERT INTO `x2_cityarea` VALUES (441823, '441823', '阳山县', '441800');
INSERT INTO `x2_cityarea` VALUES (441825, '441825', '连山壮族瑶族自治县', '441800');
INSERT INTO `x2_cityarea` VALUES (441826, '441826', '连南瑶族自治县', '441800');
INSERT INTO `x2_cityarea` VALUES (441827, '441827', '清新县', '441800');
INSERT INTO `x2_cityarea` VALUES (441881, '441881', '英德市', '441800');
INSERT INTO `x2_cityarea` VALUES (441882, '441882', '连州市', '441800');
INSERT INTO `x2_cityarea` VALUES (441900, '441901', '莞城区', '441900');
INSERT INTO `x2_cityarea` VALUES (441902, '441902', '常平镇', '441900');
INSERT INTO `x2_cityarea` VALUES (441903, '441903', '塘厦镇', '441900');
INSERT INTO `x2_cityarea` VALUES (441904, '441904', '万江区', '441900');
INSERT INTO `x2_cityarea` VALUES (441905, '441905', '虎门镇', '441900');
INSERT INTO `x2_cityarea` VALUES (442000, '442001', '中山市', '442000');
INSERT INTO `x2_cityarea` VALUES (445101, '445101', '市辖区', '445100');
INSERT INTO `x2_cityarea` VALUES (445102, '445102', '湘桥区', '445100');
INSERT INTO `x2_cityarea` VALUES (445121, '445121', '潮安县', '445100');
INSERT INTO `x2_cityarea` VALUES (445122, '445122', '饶平县', '445100');
INSERT INTO `x2_cityarea` VALUES (445201, '445201', '市辖区', '445200');
INSERT INTO `x2_cityarea` VALUES (445202, '445202', '榕城区', '445200');
INSERT INTO `x2_cityarea` VALUES (445221, '445221', '揭东县', '445200');
INSERT INTO `x2_cityarea` VALUES (445222, '445222', '揭西县', '445200');
INSERT INTO `x2_cityarea` VALUES (445224, '445224', '惠来县', '445200');
INSERT INTO `x2_cityarea` VALUES (445281, '445281', '普宁市', '445200');
INSERT INTO `x2_cityarea` VALUES (445301, '445301', '市辖区', '445300');
INSERT INTO `x2_cityarea` VALUES (445302, '445302', '云城区', '445300');
INSERT INTO `x2_cityarea` VALUES (445321, '445321', '新兴县', '445300');
INSERT INTO `x2_cityarea` VALUES (445322, '445322', '郁南县', '445300');
INSERT INTO `x2_cityarea` VALUES (445323, '445323', '云安县', '445300');
INSERT INTO `x2_cityarea` VALUES (445381, '445381', '罗定市', '445300');
INSERT INTO `x2_cityarea` VALUES (450101, '450101', '市辖区', '450100');
INSERT INTO `x2_cityarea` VALUES (450102, '450102', '兴宁区', '450100');
INSERT INTO `x2_cityarea` VALUES (450103, '450103', '青秀区', '450100');
INSERT INTO `x2_cityarea` VALUES (450105, '450105', '江南区', '450100');
INSERT INTO `x2_cityarea` VALUES (450107, '450107', '西乡塘区', '450100');
INSERT INTO `x2_cityarea` VALUES (450108, '450108', '良庆区', '450100');
INSERT INTO `x2_cityarea` VALUES (450109, '450109', '邕宁区', '450100');
INSERT INTO `x2_cityarea` VALUES (450122, '450122', '武鸣县', '450100');
INSERT INTO `x2_cityarea` VALUES (450123, '450123', '隆安县', '450100');
INSERT INTO `x2_cityarea` VALUES (450124, '450124', '马山县', '450100');
INSERT INTO `x2_cityarea` VALUES (450125, '450125', '上林县', '450100');
INSERT INTO `x2_cityarea` VALUES (450126, '450126', '宾阳县', '450100');
INSERT INTO `x2_cityarea` VALUES (450127, '450127', '横　县', '450100');
INSERT INTO `x2_cityarea` VALUES (450201, '450201', '市辖区', '450200');
INSERT INTO `x2_cityarea` VALUES (450202, '450202', '城中区', '450200');
INSERT INTO `x2_cityarea` VALUES (450203, '450203', '鱼峰区', '450200');
INSERT INTO `x2_cityarea` VALUES (450204, '450204', '柳南区', '450200');
INSERT INTO `x2_cityarea` VALUES (450205, '450205', '柳北区', '450200');
INSERT INTO `x2_cityarea` VALUES (450221, '450221', '柳江县', '450200');
INSERT INTO `x2_cityarea` VALUES (450222, '450222', '柳城县', '450200');
INSERT INTO `x2_cityarea` VALUES (450223, '450223', '鹿寨县', '450200');
INSERT INTO `x2_cityarea` VALUES (450224, '450224', '融安县', '450200');
INSERT INTO `x2_cityarea` VALUES (450225, '450225', '融水苗族自治县', '450200');
INSERT INTO `x2_cityarea` VALUES (450226, '450226', '三江侗族自治县', '450200');
INSERT INTO `x2_cityarea` VALUES (450301, '450301', '市辖区', '450300');
INSERT INTO `x2_cityarea` VALUES (450302, '450302', '秀峰区', '450300');
INSERT INTO `x2_cityarea` VALUES (450303, '450303', '叠彩区', '450300');
INSERT INTO `x2_cityarea` VALUES (450304, '450304', '象山区', '450300');
INSERT INTO `x2_cityarea` VALUES (450305, '450305', '七星区', '450300');
INSERT INTO `x2_cityarea` VALUES (450311, '450311', '雁山区', '450300');
INSERT INTO `x2_cityarea` VALUES (450321, '450321', '阳朔县', '450300');
INSERT INTO `x2_cityarea` VALUES (450322, '450322', '临桂县', '450300');
INSERT INTO `x2_cityarea` VALUES (450323, '450323', '灵川县', '450300');
INSERT INTO `x2_cityarea` VALUES (450324, '450324', '全州县', '450300');
INSERT INTO `x2_cityarea` VALUES (450325, '450325', '兴安县', '450300');
INSERT INTO `x2_cityarea` VALUES (450326, '450326', '永福县', '450300');
INSERT INTO `x2_cityarea` VALUES (450327, '450327', '灌阳县', '450300');
INSERT INTO `x2_cityarea` VALUES (450328, '450328', '龙胜各族自治县', '450300');
INSERT INTO `x2_cityarea` VALUES (450329, '450329', '资源县', '450300');
INSERT INTO `x2_cityarea` VALUES (450330, '450330', '平乐县', '450300');
INSERT INTO `x2_cityarea` VALUES (450331, '450331', '荔蒲县', '450300');
INSERT INTO `x2_cityarea` VALUES (450332, '450332', '恭城瑶族自治县', '450300');
INSERT INTO `x2_cityarea` VALUES (450401, '450401', '市辖区', '450400');
INSERT INTO `x2_cityarea` VALUES (450403, '450403', '万秀区', '450400');
INSERT INTO `x2_cityarea` VALUES (450404, '450404', '蝶山区', '450400');
INSERT INTO `x2_cityarea` VALUES (450405, '450405', '长洲区', '450400');
INSERT INTO `x2_cityarea` VALUES (450421, '450421', '苍梧县', '450400');
INSERT INTO `x2_cityarea` VALUES (450422, '450422', '藤　县', '450400');
INSERT INTO `x2_cityarea` VALUES (450423, '450423', '蒙山县', '450400');
INSERT INTO `x2_cityarea` VALUES (450481, '450481', '岑溪市', '450400');
INSERT INTO `x2_cityarea` VALUES (450501, '450501', '市辖区', '450500');
INSERT INTO `x2_cityarea` VALUES (450502, '450502', '海城区', '450500');
INSERT INTO `x2_cityarea` VALUES (450503, '450503', '银海区', '450500');
INSERT INTO `x2_cityarea` VALUES (450512, '450512', '铁山港区', '450500');
INSERT INTO `x2_cityarea` VALUES (450521, '450521', '合浦县', '450500');
INSERT INTO `x2_cityarea` VALUES (450601, '450601', '市辖区', '450600');
INSERT INTO `x2_cityarea` VALUES (450602, '450602', '港口区', '450600');
INSERT INTO `x2_cityarea` VALUES (450603, '450603', '防城区', '450600');
INSERT INTO `x2_cityarea` VALUES (450621, '450621', '上思县', '450600');
INSERT INTO `x2_cityarea` VALUES (450681, '450681', '东兴市', '450600');
INSERT INTO `x2_cityarea` VALUES (450701, '450701', '市辖区', '450700');
INSERT INTO `x2_cityarea` VALUES (450702, '450702', '钦南区', '450700');
INSERT INTO `x2_cityarea` VALUES (450703, '450703', '钦北区', '450700');
INSERT INTO `x2_cityarea` VALUES (450721, '450721', '灵山县', '450700');
INSERT INTO `x2_cityarea` VALUES (450722, '450722', '浦北县', '450700');
INSERT INTO `x2_cityarea` VALUES (450801, '450801', '市辖区', '450800');
INSERT INTO `x2_cityarea` VALUES (450802, '450802', '港北区', '450800');
INSERT INTO `x2_cityarea` VALUES (450803, '450803', '港南区', '450800');
INSERT INTO `x2_cityarea` VALUES (450804, '450804', '覃塘区', '450800');
INSERT INTO `x2_cityarea` VALUES (450821, '450821', '平南县', '450800');
INSERT INTO `x2_cityarea` VALUES (450881, '450881', '桂平市', '450800');
INSERT INTO `x2_cityarea` VALUES (450901, '450901', '市辖区', '450900');
INSERT INTO `x2_cityarea` VALUES (450902, '450902', '玉州区', '450900');
INSERT INTO `x2_cityarea` VALUES (450921, '450921', '容　县', '450900');
INSERT INTO `x2_cityarea` VALUES (450922, '450922', '陆川县', '450900');
INSERT INTO `x2_cityarea` VALUES (450923, '450923', '博白县', '450900');
INSERT INTO `x2_cityarea` VALUES (450924, '450924', '兴业县', '450900');
INSERT INTO `x2_cityarea` VALUES (450981, '450981', '北流市', '450900');
INSERT INTO `x2_cityarea` VALUES (451001, '451001', '市辖区', '451000');
INSERT INTO `x2_cityarea` VALUES (451002, '451002', '右江区', '451000');
INSERT INTO `x2_cityarea` VALUES (451021, '451021', '田阳县', '451000');
INSERT INTO `x2_cityarea` VALUES (451022, '451022', '田东县', '451000');
INSERT INTO `x2_cityarea` VALUES (451023, '451023', '平果县', '451000');
INSERT INTO `x2_cityarea` VALUES (451024, '451024', '德保县', '451000');
INSERT INTO `x2_cityarea` VALUES (451025, '451025', '靖西县', '451000');
INSERT INTO `x2_cityarea` VALUES (451026, '451026', '那坡县', '451000');
INSERT INTO `x2_cityarea` VALUES (451027, '451027', '凌云县', '451000');
INSERT INTO `x2_cityarea` VALUES (451028, '451028', '乐业县', '451000');
INSERT INTO `x2_cityarea` VALUES (451029, '451029', '田林县', '451000');
INSERT INTO `x2_cityarea` VALUES (451030, '451030', '西林县', '451000');
INSERT INTO `x2_cityarea` VALUES (451031, '451031', '隆林各族自治县', '451000');
INSERT INTO `x2_cityarea` VALUES (451101, '451101', '市辖区', '451100');
INSERT INTO `x2_cityarea` VALUES (451102, '451102', '八步区', '451100');
INSERT INTO `x2_cityarea` VALUES (451121, '451121', '昭平县', '451100');
INSERT INTO `x2_cityarea` VALUES (451122, '451122', '钟山县', '451100');
INSERT INTO `x2_cityarea` VALUES (451123, '451123', '富川瑶族自治县', '451100');
INSERT INTO `x2_cityarea` VALUES (451201, '451201', '市辖区', '451200');
INSERT INTO `x2_cityarea` VALUES (451202, '451202', '金城江区', '451200');
INSERT INTO `x2_cityarea` VALUES (451221, '451221', '南丹县', '451200');
INSERT INTO `x2_cityarea` VALUES (451222, '451222', '天峨县', '451200');
INSERT INTO `x2_cityarea` VALUES (451223, '451223', '凤山县', '451200');
INSERT INTO `x2_cityarea` VALUES (451224, '451224', '东兰县', '451200');
INSERT INTO `x2_cityarea` VALUES (451225, '451225', '罗城仫佬族自治县', '451200');
INSERT INTO `x2_cityarea` VALUES (451226, '451226', '环江毛南族自治县', '451200');
INSERT INTO `x2_cityarea` VALUES (451227, '451227', '巴马瑶族自治县', '451200');
INSERT INTO `x2_cityarea` VALUES (451228, '451228', '都安瑶族自治县', '451200');
INSERT INTO `x2_cityarea` VALUES (451229, '451229', '大化瑶族自治县', '451200');
INSERT INTO `x2_cityarea` VALUES (451281, '451281', '宜州市', '451200');
INSERT INTO `x2_cityarea` VALUES (451301, '451301', '市辖区', '451300');
INSERT INTO `x2_cityarea` VALUES (451302, '451302', '兴宾区', '451300');
INSERT INTO `x2_cityarea` VALUES (451321, '451321', '忻城县', '451300');
INSERT INTO `x2_cityarea` VALUES (451322, '451322', '象州县', '451300');
INSERT INTO `x2_cityarea` VALUES (451323, '451323', '武宣县', '451300');
INSERT INTO `x2_cityarea` VALUES (451324, '451324', '金秀瑶族自治县', '451300');
INSERT INTO `x2_cityarea` VALUES (451381, '451381', '合山市', '451300');
INSERT INTO `x2_cityarea` VALUES (451401, '451401', '市辖区', '451400');
INSERT INTO `x2_cityarea` VALUES (451402, '451402', '江洲区', '451400');
INSERT INTO `x2_cityarea` VALUES (451421, '451421', '扶绥县', '451400');
INSERT INTO `x2_cityarea` VALUES (451422, '451422', '宁明县', '451400');
INSERT INTO `x2_cityarea` VALUES (451423, '451423', '龙州县', '451400');
INSERT INTO `x2_cityarea` VALUES (451424, '451424', '大新县', '451400');
INSERT INTO `x2_cityarea` VALUES (451425, '451425', '天等县', '451400');
INSERT INTO `x2_cityarea` VALUES (451481, '451481', '凭祥市', '451400');
INSERT INTO `x2_cityarea` VALUES (460101, '460101', '市辖区', '460100');
INSERT INTO `x2_cityarea` VALUES (460105, '460105', '秀英区', '460100');
INSERT INTO `x2_cityarea` VALUES (460106, '460106', '龙华区', '460100');
INSERT INTO `x2_cityarea` VALUES (460107, '460107', '琼山区', '460100');
INSERT INTO `x2_cityarea` VALUES (460108, '460108', '美兰区', '460100');
INSERT INTO `x2_cityarea` VALUES (460201, '460201', '市辖区', '460200');
INSERT INTO `x2_cityarea` VALUES (469001, '469001', '五指山市', '469000');
INSERT INTO `x2_cityarea` VALUES (469002, '469002', '琼海市', '469000');
INSERT INTO `x2_cityarea` VALUES (469003, '469003', '儋州市', '469000');
INSERT INTO `x2_cityarea` VALUES (469005, '469005', '文昌市', '469000');
INSERT INTO `x2_cityarea` VALUES (469006, '469006', '万宁市', '469000');
INSERT INTO `x2_cityarea` VALUES (469007, '469007', '东方市', '469000');
INSERT INTO `x2_cityarea` VALUES (469025, '469025', '定安县', '469000');
INSERT INTO `x2_cityarea` VALUES (469026, '469026', '屯昌县', '469000');
INSERT INTO `x2_cityarea` VALUES (469027, '469027', '澄迈县', '469000');
INSERT INTO `x2_cityarea` VALUES (469028, '469028', '临高县', '469000');
INSERT INTO `x2_cityarea` VALUES (469030, '469030', '白沙黎族自治县', '469000');
INSERT INTO `x2_cityarea` VALUES (469031, '469031', '昌江黎族自治县', '469000');
INSERT INTO `x2_cityarea` VALUES (469033, '469033', '乐东黎族自治县', '469000');
INSERT INTO `x2_cityarea` VALUES (469034, '469034', '陵水黎族自治县', '469000');
INSERT INTO `x2_cityarea` VALUES (469035, '469035', '保亭黎族苗族自治县', '469000');
INSERT INTO `x2_cityarea` VALUES (469036, '469036', '琼中黎族苗族自治县', '469000');
INSERT INTO `x2_cityarea` VALUES (469037, '469037', '西沙群岛', '469000');
INSERT INTO `x2_cityarea` VALUES (469038, '469038', '南沙群岛', '469000');
INSERT INTO `x2_cityarea` VALUES (469039, '469039', '中沙群岛的岛礁及其海域', '469000');
INSERT INTO `x2_cityarea` VALUES (500101, '500101', '万州区', '500100');
INSERT INTO `x2_cityarea` VALUES (500102, '500102', '涪陵区', '500100');
INSERT INTO `x2_cityarea` VALUES (500103, '500103', '渝中区', '500100');
INSERT INTO `x2_cityarea` VALUES (500104, '500104', '大渡口区', '500100');
INSERT INTO `x2_cityarea` VALUES (500105, '500105', '江北区', '500100');
INSERT INTO `x2_cityarea` VALUES (500106, '500106', '沙坪坝区', '500100');
INSERT INTO `x2_cityarea` VALUES (500107, '500107', '九龙坡区', '500100');
INSERT INTO `x2_cityarea` VALUES (500108, '500108', '南岸区', '500100');
INSERT INTO `x2_cityarea` VALUES (500109, '500109', '北碚区', '500100');
INSERT INTO `x2_cityarea` VALUES (500110, '500110', '万盛区', '500100');
INSERT INTO `x2_cityarea` VALUES (500111, '500111', '双桥区', '500100');
INSERT INTO `x2_cityarea` VALUES (500112, '500112', '渝北区', '500100');
INSERT INTO `x2_cityarea` VALUES (500113, '500113', '巴南区', '500100');
INSERT INTO `x2_cityarea` VALUES (500114, '500114', '黔江区', '500100');
INSERT INTO `x2_cityarea` VALUES (500115, '500115', '长寿区', '500100');
INSERT INTO `x2_cityarea` VALUES (500116, '500381', '江津市', '500300');
INSERT INTO `x2_cityarea` VALUES (500117, '500382', '合川市', '500300');
INSERT INTO `x2_cityarea` VALUES (500118, '500383', '永川市', '500300');
INSERT INTO `x2_cityarea` VALUES (500119, '500384', '南川市', '500300');
INSERT INTO `x2_cityarea` VALUES (500222, '500222', '綦江县', '500200');
INSERT INTO `x2_cityarea` VALUES (500223, '500223', '潼南县', '500200');
INSERT INTO `x2_cityarea` VALUES (500224, '500224', '铜梁县', '500200');
INSERT INTO `x2_cityarea` VALUES (500225, '500225', '大足县', '500200');
INSERT INTO `x2_cityarea` VALUES (500226, '500226', '荣昌县', '500200');
INSERT INTO `x2_cityarea` VALUES (500227, '500227', '璧山县', '500200');
INSERT INTO `x2_cityarea` VALUES (500228, '500228', '梁平县', '500200');
INSERT INTO `x2_cityarea` VALUES (500229, '500229', '城口县', '500200');
INSERT INTO `x2_cityarea` VALUES (500230, '500230', '丰都县', '500200');
INSERT INTO `x2_cityarea` VALUES (500231, '500231', '垫江县', '500200');
INSERT INTO `x2_cityarea` VALUES (500232, '500232', '武隆县', '500200');
INSERT INTO `x2_cityarea` VALUES (500233, '500233', '忠　县', '500200');
INSERT INTO `x2_cityarea` VALUES (500234, '500234', '开　县', '500200');
INSERT INTO `x2_cityarea` VALUES (500235, '500235', '云阳县', '500200');
INSERT INTO `x2_cityarea` VALUES (500236, '500236', '奉节县', '500200');
INSERT INTO `x2_cityarea` VALUES (500237, '500237', '巫山县', '500200');
INSERT INTO `x2_cityarea` VALUES (500238, '500238', '巫溪县', '500200');
INSERT INTO `x2_cityarea` VALUES (500240, '500240', '石柱土家族自治县', '500200');
INSERT INTO `x2_cityarea` VALUES (500241, '500241', '秀山土家族苗族自治县', '500200');
INSERT INTO `x2_cityarea` VALUES (500242, '500242', '酉阳土家族苗族自治县', '500200');
INSERT INTO `x2_cityarea` VALUES (500243, '500243', '彭水苗族土家族自治县', '500200');
INSERT INTO `x2_cityarea` VALUES (510101, '510101', '市辖区', '510100');
INSERT INTO `x2_cityarea` VALUES (510104, '510104', '锦江区', '510100');
INSERT INTO `x2_cityarea` VALUES (510105, '510105', '青羊区', '510100');
INSERT INTO `x2_cityarea` VALUES (510106, '510106', '金牛区', '510100');
INSERT INTO `x2_cityarea` VALUES (510107, '510107', '武侯区', '510100');
INSERT INTO `x2_cityarea` VALUES (510108, '510108', '成华区', '510100');
INSERT INTO `x2_cityarea` VALUES (510112, '510112', '龙泉驿区', '510100');
INSERT INTO `x2_cityarea` VALUES (510113, '510113', '青白江区', '510100');
INSERT INTO `x2_cityarea` VALUES (510114, '510114', '新都区', '510100');
INSERT INTO `x2_cityarea` VALUES (510115, '510115', '温江区', '510100');
INSERT INTO `x2_cityarea` VALUES (510121, '510121', '金堂县', '510100');
INSERT INTO `x2_cityarea` VALUES (510122, '510122', '双流县', '510100');
INSERT INTO `x2_cityarea` VALUES (510124, '510124', '郫　县', '510100');
INSERT INTO `x2_cityarea` VALUES (510129, '510129', '大邑县', '510100');
INSERT INTO `x2_cityarea` VALUES (510131, '510131', '蒲江县', '510100');
INSERT INTO `x2_cityarea` VALUES (510132, '510132', '新津县', '510100');
INSERT INTO `x2_cityarea` VALUES (510181, '510181', '都江堰市', '510100');
INSERT INTO `x2_cityarea` VALUES (510182, '510182', '彭州市', '510100');
INSERT INTO `x2_cityarea` VALUES (510183, '510183', '邛崃市', '510100');
INSERT INTO `x2_cityarea` VALUES (510184, '510184', '崇州市', '510100');
INSERT INTO `x2_cityarea` VALUES (510301, '510301', '市辖区', '510300');
INSERT INTO `x2_cityarea` VALUES (510302, '510302', '自流井区', '510300');
INSERT INTO `x2_cityarea` VALUES (510303, '510303', '贡井区', '510300');
INSERT INTO `x2_cityarea` VALUES (510304, '510304', '大安区', '510300');
INSERT INTO `x2_cityarea` VALUES (510311, '510311', '沿滩区', '510300');
INSERT INTO `x2_cityarea` VALUES (510321, '510321', '荣　县', '510300');
INSERT INTO `x2_cityarea` VALUES (510322, '510322', '富顺县', '510300');
INSERT INTO `x2_cityarea` VALUES (510401, '510401', '市辖区', '510400');
INSERT INTO `x2_cityarea` VALUES (510402, '510402', '东　区', '510400');
INSERT INTO `x2_cityarea` VALUES (510403, '510403', '西　区', '510400');
INSERT INTO `x2_cityarea` VALUES (510411, '510411', '仁和区', '510400');
INSERT INTO `x2_cityarea` VALUES (510421, '510421', '米易县', '510400');
INSERT INTO `x2_cityarea` VALUES (510422, '510422', '盐边县', '510400');
INSERT INTO `x2_cityarea` VALUES (510501, '510501', '市辖区', '510500');
INSERT INTO `x2_cityarea` VALUES (510502, '510502', '江阳区', '510500');
INSERT INTO `x2_cityarea` VALUES (510503, '510503', '纳溪区', '510500');
INSERT INTO `x2_cityarea` VALUES (510504, '510504', '龙马潭区', '510500');
INSERT INTO `x2_cityarea` VALUES (510521, '510521', '泸　县', '510500');
INSERT INTO `x2_cityarea` VALUES (510522, '510522', '合江县', '510500');
INSERT INTO `x2_cityarea` VALUES (510524, '510524', '叙永县', '510500');
INSERT INTO `x2_cityarea` VALUES (510525, '510525', '古蔺县', '510500');
INSERT INTO `x2_cityarea` VALUES (510601, '510601', '市辖区', '510600');
INSERT INTO `x2_cityarea` VALUES (510603, '510603', '旌阳区', '510600');
INSERT INTO `x2_cityarea` VALUES (510623, '510623', '中江县', '510600');
INSERT INTO `x2_cityarea` VALUES (510626, '510626', '罗江县', '510600');
INSERT INTO `x2_cityarea` VALUES (510681, '510681', '广汉市', '510600');
INSERT INTO `x2_cityarea` VALUES (510682, '510682', '什邡市', '510600');
INSERT INTO `x2_cityarea` VALUES (510683, '510683', '绵竹市', '510600');
INSERT INTO `x2_cityarea` VALUES (510701, '510701', '市辖区', '510700');
INSERT INTO `x2_cityarea` VALUES (510703, '510703', '涪城区', '510700');
INSERT INTO `x2_cityarea` VALUES (510704, '510704', '游仙区', '510700');
INSERT INTO `x2_cityarea` VALUES (510722, '510722', '三台县', '510700');
INSERT INTO `x2_cityarea` VALUES (510723, '510723', '盐亭县', '510700');
INSERT INTO `x2_cityarea` VALUES (510724, '510724', '安　县', '510700');
INSERT INTO `x2_cityarea` VALUES (510725, '510725', '梓潼县', '510700');
INSERT INTO `x2_cityarea` VALUES (510726, '510726', '北川羌族自治县', '510700');
INSERT INTO `x2_cityarea` VALUES (510727, '510727', '平武县', '510700');
INSERT INTO `x2_cityarea` VALUES (510781, '510781', '江油市', '510700');
INSERT INTO `x2_cityarea` VALUES (510801, '510801', '市辖区', '510800');
INSERT INTO `x2_cityarea` VALUES (510802, '510802', '市中区', '510800');
INSERT INTO `x2_cityarea` VALUES (510811, '510811', '元坝区', '510800');
INSERT INTO `x2_cityarea` VALUES (510812, '510812', '朝天区', '510800');
INSERT INTO `x2_cityarea` VALUES (510821, '510821', '旺苍县', '510800');
INSERT INTO `x2_cityarea` VALUES (510822, '510822', '青川县', '510800');
INSERT INTO `x2_cityarea` VALUES (510823, '510823', '剑阁县', '510800');
INSERT INTO `x2_cityarea` VALUES (510824, '510824', '苍溪县', '510800');
INSERT INTO `x2_cityarea` VALUES (510901, '510901', '市辖区', '510900');
INSERT INTO `x2_cityarea` VALUES (510903, '510903', '船山区', '510900');
INSERT INTO `x2_cityarea` VALUES (510904, '510904', '安居区', '510900');
INSERT INTO `x2_cityarea` VALUES (510921, '510921', '蓬溪县', '510900');
INSERT INTO `x2_cityarea` VALUES (510922, '510922', '射洪县', '510900');
INSERT INTO `x2_cityarea` VALUES (510923, '510923', '大英县', '510900');
INSERT INTO `x2_cityarea` VALUES (511001, '511001', '市辖区', '511000');
INSERT INTO `x2_cityarea` VALUES (511002, '511002', '市中区', '511000');
INSERT INTO `x2_cityarea` VALUES (511011, '511011', '东兴区', '511000');
INSERT INTO `x2_cityarea` VALUES (511024, '511024', '威远县', '511000');
INSERT INTO `x2_cityarea` VALUES (511025, '511025', '资中县', '511000');
INSERT INTO `x2_cityarea` VALUES (511028, '511028', '隆昌县', '511000');
INSERT INTO `x2_cityarea` VALUES (511101, '511101', '市辖区', '511100');
INSERT INTO `x2_cityarea` VALUES (511102, '511102', '市中区', '511100');
INSERT INTO `x2_cityarea` VALUES (511111, '511111', '沙湾区', '511100');
INSERT INTO `x2_cityarea` VALUES (511112, '511112', '五通桥区', '511100');
INSERT INTO `x2_cityarea` VALUES (511113, '511113', '金口河区', '511100');
INSERT INTO `x2_cityarea` VALUES (511123, '511123', '犍为县', '511100');
INSERT INTO `x2_cityarea` VALUES (511124, '511124', '井研县', '511100');
INSERT INTO `x2_cityarea` VALUES (511126, '511126', '夹江县', '511100');
INSERT INTO `x2_cityarea` VALUES (511129, '511129', '沐川县', '511100');
INSERT INTO `x2_cityarea` VALUES (511132, '511132', '峨边彝族自治县', '511100');
INSERT INTO `x2_cityarea` VALUES (511133, '511133', '马边彝族自治县', '511100');
INSERT INTO `x2_cityarea` VALUES (511181, '511181', '峨眉山市', '511100');
INSERT INTO `x2_cityarea` VALUES (511301, '511301', '市辖区', '511300');
INSERT INTO `x2_cityarea` VALUES (511302, '511302', '顺庆区', '511300');
INSERT INTO `x2_cityarea` VALUES (511303, '511303', '高坪区', '511300');
INSERT INTO `x2_cityarea` VALUES (511304, '511304', '嘉陵区', '511300');
INSERT INTO `x2_cityarea` VALUES (511321, '511321', '南部县', '511300');
INSERT INTO `x2_cityarea` VALUES (511322, '511322', '营山县', '511300');
INSERT INTO `x2_cityarea` VALUES (511323, '511323', '蓬安县', '511300');
INSERT INTO `x2_cityarea` VALUES (511324, '511324', '仪陇县', '511300');
INSERT INTO `x2_cityarea` VALUES (511325, '511325', '西充县', '511300');
INSERT INTO `x2_cityarea` VALUES (511381, '511381', '阆中市', '511300');
INSERT INTO `x2_cityarea` VALUES (511401, '511401', '市辖区', '511400');
INSERT INTO `x2_cityarea` VALUES (511402, '511402', '东坡区', '511400');
INSERT INTO `x2_cityarea` VALUES (511421, '511421', '仁寿县', '511400');
INSERT INTO `x2_cityarea` VALUES (511422, '511422', '彭山县', '511400');
INSERT INTO `x2_cityarea` VALUES (511423, '511423', '洪雅县', '511400');
INSERT INTO `x2_cityarea` VALUES (511424, '511424', '丹棱县', '511400');
INSERT INTO `x2_cityarea` VALUES (511425, '511425', '青神县', '511400');
INSERT INTO `x2_cityarea` VALUES (511501, '511501', '市辖区', '511500');
INSERT INTO `x2_cityarea` VALUES (511502, '511502', '翠屏区', '511500');
INSERT INTO `x2_cityarea` VALUES (511521, '511521', '宜宾县', '511500');
INSERT INTO `x2_cityarea` VALUES (511522, '511522', '南溪县', '511500');
INSERT INTO `x2_cityarea` VALUES (511523, '511523', '江安县', '511500');
INSERT INTO `x2_cityarea` VALUES (511524, '511524', '长宁县', '511500');
INSERT INTO `x2_cityarea` VALUES (511525, '511525', '高　县', '511500');
INSERT INTO `x2_cityarea` VALUES (511526, '511526', '珙　县', '511500');
INSERT INTO `x2_cityarea` VALUES (511527, '511527', '筠连县', '511500');
INSERT INTO `x2_cityarea` VALUES (511528, '511528', '兴文县', '511500');
INSERT INTO `x2_cityarea` VALUES (511529, '511529', '屏山县', '511500');
INSERT INTO `x2_cityarea` VALUES (511601, '511601', '市辖区', '511600');
INSERT INTO `x2_cityarea` VALUES (511602, '511602', '广安区', '511600');
INSERT INTO `x2_cityarea` VALUES (511621, '511621', '岳池县', '511600');
INSERT INTO `x2_cityarea` VALUES (511622, '511622', '武胜县', '511600');
INSERT INTO `x2_cityarea` VALUES (511623, '511623', '邻水县', '511600');
INSERT INTO `x2_cityarea` VALUES (511681, '511681', '华莹市', '511600');
INSERT INTO `x2_cityarea` VALUES (511701, '511701', '市辖区', '511700');
INSERT INTO `x2_cityarea` VALUES (511702, '511702', '通川区', '511700');
INSERT INTO `x2_cityarea` VALUES (511721, '511721', '达　县', '511700');
INSERT INTO `x2_cityarea` VALUES (511722, '511722', '宣汉县', '511700');
INSERT INTO `x2_cityarea` VALUES (511723, '511723', '开江县', '511700');
INSERT INTO `x2_cityarea` VALUES (511724, '511724', '大竹县', '511700');
INSERT INTO `x2_cityarea` VALUES (511725, '511725', '渠　县', '511700');
INSERT INTO `x2_cityarea` VALUES (511781, '511781', '万源市', '511700');
INSERT INTO `x2_cityarea` VALUES (511801, '511801', '市辖区', '511800');
INSERT INTO `x2_cityarea` VALUES (511802, '511802', '雨城区', '511800');
INSERT INTO `x2_cityarea` VALUES (511821, '511821', '名山县', '511800');
INSERT INTO `x2_cityarea` VALUES (511822, '511822', '荥经县', '511800');
INSERT INTO `x2_cityarea` VALUES (511823, '511823', '汉源县', '511800');
INSERT INTO `x2_cityarea` VALUES (511824, '511824', '石棉县', '511800');
INSERT INTO `x2_cityarea` VALUES (511825, '511825', '天全县', '511800');
INSERT INTO `x2_cityarea` VALUES (511826, '511826', '芦山县', '511800');
INSERT INTO `x2_cityarea` VALUES (511827, '511827', '宝兴县', '511800');
INSERT INTO `x2_cityarea` VALUES (511901, '511901', '市辖区', '511900');
INSERT INTO `x2_cityarea` VALUES (511902, '511902', '巴州区', '511900');
INSERT INTO `x2_cityarea` VALUES (511921, '511921', '通江县', '511900');
INSERT INTO `x2_cityarea` VALUES (511922, '511922', '南江县', '511900');
INSERT INTO `x2_cityarea` VALUES (511923, '511923', '平昌县', '511900');
INSERT INTO `x2_cityarea` VALUES (512001, '512001', '市辖区', '512000');
INSERT INTO `x2_cityarea` VALUES (512002, '512002', '雁江区', '512000');
INSERT INTO `x2_cityarea` VALUES (512021, '512021', '安岳县', '512000');
INSERT INTO `x2_cityarea` VALUES (512022, '512022', '乐至县', '512000');
INSERT INTO `x2_cityarea` VALUES (512081, '512081', '简阳市', '512000');
INSERT INTO `x2_cityarea` VALUES (513221, '513221', '汶川县', '513200');
INSERT INTO `x2_cityarea` VALUES (513222, '513222', '理　县', '513200');
INSERT INTO `x2_cityarea` VALUES (513223, '513223', '茂　县', '513200');
INSERT INTO `x2_cityarea` VALUES (513224, '513224', '松潘县', '513200');
INSERT INTO `x2_cityarea` VALUES (513225, '513225', '九寨沟县', '513200');
INSERT INTO `x2_cityarea` VALUES (513226, '513226', '金川县', '513200');
INSERT INTO `x2_cityarea` VALUES (513227, '513227', '小金县', '513200');
INSERT INTO `x2_cityarea` VALUES (513228, '513228', '黑水县', '513200');
INSERT INTO `x2_cityarea` VALUES (513229, '513229', '马尔康县', '513200');
INSERT INTO `x2_cityarea` VALUES (513230, '513230', '壤塘县', '513200');
INSERT INTO `x2_cityarea` VALUES (513231, '513231', '阿坝县', '513200');
INSERT INTO `x2_cityarea` VALUES (513232, '513232', '若尔盖县', '513200');
INSERT INTO `x2_cityarea` VALUES (513233, '513233', '红原县', '513200');
INSERT INTO `x2_cityarea` VALUES (513321, '513321', '康定县', '513300');
INSERT INTO `x2_cityarea` VALUES (513322, '513322', '泸定县', '513300');
INSERT INTO `x2_cityarea` VALUES (513323, '513323', '丹巴县', '513300');
INSERT INTO `x2_cityarea` VALUES (513324, '513324', '九龙县', '513300');
INSERT INTO `x2_cityarea` VALUES (513325, '513325', '雅江县', '513300');
INSERT INTO `x2_cityarea` VALUES (513326, '513326', '道孚县', '513300');
INSERT INTO `x2_cityarea` VALUES (513327, '513327', '炉霍县', '513300');
INSERT INTO `x2_cityarea` VALUES (513328, '513328', '甘孜县', '513300');
INSERT INTO `x2_cityarea` VALUES (513329, '513329', '新龙县', '513300');
INSERT INTO `x2_cityarea` VALUES (513330, '513330', '德格县', '513300');
INSERT INTO `x2_cityarea` VALUES (513331, '513331', '白玉县', '513300');
INSERT INTO `x2_cityarea` VALUES (513332, '513332', '石渠县', '513300');
INSERT INTO `x2_cityarea` VALUES (513333, '513333', '色达县', '513300');
INSERT INTO `x2_cityarea` VALUES (513334, '513334', '理塘县', '513300');
INSERT INTO `x2_cityarea` VALUES (513335, '513335', '巴塘县', '513300');
INSERT INTO `x2_cityarea` VALUES (513336, '513336', '乡城县', '513300');
INSERT INTO `x2_cityarea` VALUES (513337, '513337', '稻城县', '513300');
INSERT INTO `x2_cityarea` VALUES (513338, '513338', '得荣县', '513300');
INSERT INTO `x2_cityarea` VALUES (513401, '513401', '西昌市', '513400');
INSERT INTO `x2_cityarea` VALUES (513422, '513422', '木里藏族自治县', '513400');
INSERT INTO `x2_cityarea` VALUES (513423, '513423', '盐源县', '513400');
INSERT INTO `x2_cityarea` VALUES (513424, '513424', '德昌县', '513400');
INSERT INTO `x2_cityarea` VALUES (513425, '513425', '会理县', '513400');
INSERT INTO `x2_cityarea` VALUES (513426, '513426', '会东县', '513400');
INSERT INTO `x2_cityarea` VALUES (513427, '513427', '宁南县', '513400');
INSERT INTO `x2_cityarea` VALUES (513428, '513428', '普格县', '513400');
INSERT INTO `x2_cityarea` VALUES (513429, '513429', '布拖县', '513400');
INSERT INTO `x2_cityarea` VALUES (513430, '513430', '金阳县', '513400');
INSERT INTO `x2_cityarea` VALUES (513431, '513431', '昭觉县', '513400');
INSERT INTO `x2_cityarea` VALUES (513432, '513432', '喜德县', '513400');
INSERT INTO `x2_cityarea` VALUES (513433, '513433', '冕宁县', '513400');
INSERT INTO `x2_cityarea` VALUES (513434, '513434', '越西县', '513400');
INSERT INTO `x2_cityarea` VALUES (513435, '513435', '甘洛县', '513400');
INSERT INTO `x2_cityarea` VALUES (513436, '513436', '美姑县', '513400');
INSERT INTO `x2_cityarea` VALUES (513437, '513437', '雷波县', '513400');
INSERT INTO `x2_cityarea` VALUES (520101, '520101', '市辖区', '520100');
INSERT INTO `x2_cityarea` VALUES (520102, '520102', '南明区', '520100');
INSERT INTO `x2_cityarea` VALUES (520103, '520103', '云岩区', '520100');
INSERT INTO `x2_cityarea` VALUES (520111, '520111', '花溪区', '520100');
INSERT INTO `x2_cityarea` VALUES (520112, '520112', '乌当区', '520100');
INSERT INTO `x2_cityarea` VALUES (520113, '520113', '白云区', '520100');
INSERT INTO `x2_cityarea` VALUES (520114, '520114', '小河区', '520100');
INSERT INTO `x2_cityarea` VALUES (520121, '520121', '开阳县', '520100');
INSERT INTO `x2_cityarea` VALUES (520122, '520122', '息烽县', '520100');
INSERT INTO `x2_cityarea` VALUES (520123, '520123', '修文县', '520100');
INSERT INTO `x2_cityarea` VALUES (520181, '520181', '清镇市', '520100');
INSERT INTO `x2_cityarea` VALUES (520201, '520201', '钟山区', '520200');
INSERT INTO `x2_cityarea` VALUES (520203, '520203', '六枝特区', '520200');
INSERT INTO `x2_cityarea` VALUES (520221, '520221', '水城县', '520200');
INSERT INTO `x2_cityarea` VALUES (520222, '520222', '盘　县', '520200');
INSERT INTO `x2_cityarea` VALUES (520301, '520301', '市辖区', '520300');
INSERT INTO `x2_cityarea` VALUES (520302, '520302', '红花岗区', '520300');
INSERT INTO `x2_cityarea` VALUES (520303, '520303', '汇川区', '520300');
INSERT INTO `x2_cityarea` VALUES (520321, '520321', '遵义县', '520300');
INSERT INTO `x2_cityarea` VALUES (520322, '520322', '桐梓县', '520300');
INSERT INTO `x2_cityarea` VALUES (520323, '520323', '绥阳县', '520300');
INSERT INTO `x2_cityarea` VALUES (520324, '520324', '正安县', '520300');
INSERT INTO `x2_cityarea` VALUES (520325, '520325', '道真仡佬族苗族自治县', '520300');
INSERT INTO `x2_cityarea` VALUES (520326, '520326', '务川仡佬族苗族自治县', '520300');
INSERT INTO `x2_cityarea` VALUES (520327, '520327', '凤冈县', '520300');
INSERT INTO `x2_cityarea` VALUES (520328, '520328', '湄潭县', '520300');
INSERT INTO `x2_cityarea` VALUES (520329, '520329', '余庆县', '520300');
INSERT INTO `x2_cityarea` VALUES (520330, '520330', '习水县', '520300');
INSERT INTO `x2_cityarea` VALUES (520381, '520381', '赤水市', '520300');
INSERT INTO `x2_cityarea` VALUES (520382, '520382', '仁怀市', '520300');
INSERT INTO `x2_cityarea` VALUES (520401, '520401', '市辖区', '520400');
INSERT INTO `x2_cityarea` VALUES (520402, '520402', '西秀区', '520400');
INSERT INTO `x2_cityarea` VALUES (520421, '520421', '平坝县', '520400');
INSERT INTO `x2_cityarea` VALUES (520422, '520422', '普定县', '520400');
INSERT INTO `x2_cityarea` VALUES (520423, '520423', '镇宁布依族苗族自治县', '520400');
INSERT INTO `x2_cityarea` VALUES (520424, '520424', '关岭布依族苗族自治县', '520400');
INSERT INTO `x2_cityarea` VALUES (520425, '520425', '紫云苗族布依族自治县', '520400');
INSERT INTO `x2_cityarea` VALUES (522201, '522201', '铜仁市', '522200');
INSERT INTO `x2_cityarea` VALUES (522222, '522222', '江口县', '522200');
INSERT INTO `x2_cityarea` VALUES (522223, '522223', '玉屏侗族自治县', '522200');
INSERT INTO `x2_cityarea` VALUES (522224, '522224', '石阡县', '522200');
INSERT INTO `x2_cityarea` VALUES (522225, '522225', '思南县', '522200');
INSERT INTO `x2_cityarea` VALUES (522226, '522226', '印江土家族苗族自治县', '522200');
INSERT INTO `x2_cityarea` VALUES (522227, '522227', '德江县', '522200');
INSERT INTO `x2_cityarea` VALUES (522228, '522228', '沿河土家族自治县', '522200');
INSERT INTO `x2_cityarea` VALUES (522229, '522229', '松桃苗族自治县', '522200');
INSERT INTO `x2_cityarea` VALUES (522230, '522230', '万山特区', '522200');
INSERT INTO `x2_cityarea` VALUES (522301, '522301', '兴义市', '522300');
INSERT INTO `x2_cityarea` VALUES (522322, '522322', '兴仁县', '522300');
INSERT INTO `x2_cityarea` VALUES (522323, '522323', '普安县', '522300');
INSERT INTO `x2_cityarea` VALUES (522324, '522324', '晴隆县', '522300');
INSERT INTO `x2_cityarea` VALUES (522325, '522325', '贞丰县', '522300');
INSERT INTO `x2_cityarea` VALUES (522326, '522326', '望谟县', '522300');
INSERT INTO `x2_cityarea` VALUES (522327, '522327', '册亨县', '522300');
INSERT INTO `x2_cityarea` VALUES (522328, '522328', '安龙县', '522300');
INSERT INTO `x2_cityarea` VALUES (522401, '522401', '毕节市', '522400');
INSERT INTO `x2_cityarea` VALUES (522422, '522422', '大方县', '522400');
INSERT INTO `x2_cityarea` VALUES (522423, '522423', '黔西县', '522400');
INSERT INTO `x2_cityarea` VALUES (522424, '522424', '金沙县', '522400');
INSERT INTO `x2_cityarea` VALUES (522425, '522425', '织金县', '522400');
INSERT INTO `x2_cityarea` VALUES (522426, '522426', '纳雍县', '522400');
INSERT INTO `x2_cityarea` VALUES (522427, '522427', '威宁彝族回族苗族自治县', '522400');
INSERT INTO `x2_cityarea` VALUES (522428, '522428', '赫章县', '522400');
INSERT INTO `x2_cityarea` VALUES (522601, '522601', '凯里市', '522600');
INSERT INTO `x2_cityarea` VALUES (522622, '522622', '黄平县', '522600');
INSERT INTO `x2_cityarea` VALUES (522623, '522623', '施秉县', '522600');
INSERT INTO `x2_cityarea` VALUES (522624, '522624', '三穗县', '522600');
INSERT INTO `x2_cityarea` VALUES (522625, '522625', '镇远县', '522600');
INSERT INTO `x2_cityarea` VALUES (522626, '522626', '岑巩县', '522600');
INSERT INTO `x2_cityarea` VALUES (522627, '522627', '天柱县', '522600');
INSERT INTO `x2_cityarea` VALUES (522628, '522628', '锦屏县', '522600');
INSERT INTO `x2_cityarea` VALUES (522629, '522629', '剑河县', '522600');
INSERT INTO `x2_cityarea` VALUES (522630, '522630', '台江县', '522600');
INSERT INTO `x2_cityarea` VALUES (522631, '522631', '黎平县', '522600');
INSERT INTO `x2_cityarea` VALUES (522632, '522632', '榕江县', '522600');
INSERT INTO `x2_cityarea` VALUES (522633, '522633', '从江县', '522600');
INSERT INTO `x2_cityarea` VALUES (522634, '522634', '雷山县', '522600');
INSERT INTO `x2_cityarea` VALUES (522635, '522635', '麻江县', '522600');
INSERT INTO `x2_cityarea` VALUES (522636, '522636', '丹寨县', '522600');
INSERT INTO `x2_cityarea` VALUES (522701, '522701', '都匀市', '522700');
INSERT INTO `x2_cityarea` VALUES (522702, '522702', '福泉市', '522700');
INSERT INTO `x2_cityarea` VALUES (522722, '522722', '荔波县', '522700');
INSERT INTO `x2_cityarea` VALUES (522723, '522723', '贵定县', '522700');
INSERT INTO `x2_cityarea` VALUES (522725, '522725', '瓮安县', '522700');
INSERT INTO `x2_cityarea` VALUES (522726, '522726', '独山县', '522700');
INSERT INTO `x2_cityarea` VALUES (522727, '522727', '平塘县', '522700');
INSERT INTO `x2_cityarea` VALUES (522728, '522728', '罗甸县', '522700');
INSERT INTO `x2_cityarea` VALUES (522729, '522729', '长顺县', '522700');
INSERT INTO `x2_cityarea` VALUES (522730, '522730', '龙里县', '522700');
INSERT INTO `x2_cityarea` VALUES (522731, '522731', '惠水县', '522700');
INSERT INTO `x2_cityarea` VALUES (522732, '522732', '三都水族自治县', '522700');
INSERT INTO `x2_cityarea` VALUES (530101, '530101', '市辖区', '530100');
INSERT INTO `x2_cityarea` VALUES (530102, '530102', '五华区', '530100');
INSERT INTO `x2_cityarea` VALUES (530103, '530103', '盘龙区', '530100');
INSERT INTO `x2_cityarea` VALUES (530111, '530111', '官渡区', '530100');
INSERT INTO `x2_cityarea` VALUES (530112, '530112', '西山区', '530100');
INSERT INTO `x2_cityarea` VALUES (530113, '530113', '东川区', '530100');
INSERT INTO `x2_cityarea` VALUES (530121, '530121', '呈贡县', '530100');
INSERT INTO `x2_cityarea` VALUES (530122, '530122', '晋宁县', '530100');
INSERT INTO `x2_cityarea` VALUES (530124, '530124', '富民县', '530100');
INSERT INTO `x2_cityarea` VALUES (530125, '530125', '宜良县', '530100');
INSERT INTO `x2_cityarea` VALUES (530126, '530126', '石林彝族自治县', '530100');
INSERT INTO `x2_cityarea` VALUES (530127, '530127', '嵩明县', '530100');
INSERT INTO `x2_cityarea` VALUES (530128, '530128', '禄劝彝族苗族自治县', '530100');
INSERT INTO `x2_cityarea` VALUES (530129, '530129', '寻甸回族彝族自治县', '530100');
INSERT INTO `x2_cityarea` VALUES (530181, '530181', '安宁市', '530100');
INSERT INTO `x2_cityarea` VALUES (530301, '530301', '市辖区', '530300');
INSERT INTO `x2_cityarea` VALUES (530302, '530302', '麒麟区', '530300');
INSERT INTO `x2_cityarea` VALUES (530321, '530321', '马龙县', '530300');
INSERT INTO `x2_cityarea` VALUES (530322, '530322', '陆良县', '530300');
INSERT INTO `x2_cityarea` VALUES (530323, '530323', '师宗县', '530300');
INSERT INTO `x2_cityarea` VALUES (530324, '530324', '罗平县', '530300');
INSERT INTO `x2_cityarea` VALUES (530325, '530325', '富源县', '530300');
INSERT INTO `x2_cityarea` VALUES (530326, '530326', '会泽县', '530300');
INSERT INTO `x2_cityarea` VALUES (530328, '530328', '沾益县', '530300');
INSERT INTO `x2_cityarea` VALUES (530381, '530381', '宣威市', '530300');
INSERT INTO `x2_cityarea` VALUES (530401, '530401', '市辖区', '530400');
INSERT INTO `x2_cityarea` VALUES (530402, '530402', '红塔区', '530400');
INSERT INTO `x2_cityarea` VALUES (530421, '530421', '江川县', '530400');
INSERT INTO `x2_cityarea` VALUES (530422, '530422', '澄江县', '530400');
INSERT INTO `x2_cityarea` VALUES (530423, '530423', '通海县', '530400');
INSERT INTO `x2_cityarea` VALUES (530424, '530424', '华宁县', '530400');
INSERT INTO `x2_cityarea` VALUES (530425, '530425', '易门县', '530400');
INSERT INTO `x2_cityarea` VALUES (530426, '530426', '峨山彝族自治县', '530400');
INSERT INTO `x2_cityarea` VALUES (530427, '530427', '新平彝族傣族自治县', '530400');
INSERT INTO `x2_cityarea` VALUES (530428, '530428', '元江哈尼族彝族傣族自治县', '530400');
INSERT INTO `x2_cityarea` VALUES (530501, '530501', '市辖区', '530500');
INSERT INTO `x2_cityarea` VALUES (530502, '530502', '隆阳区', '530500');
INSERT INTO `x2_cityarea` VALUES (530521, '530521', '施甸县', '530500');
INSERT INTO `x2_cityarea` VALUES (530522, '530522', '腾冲县', '530500');
INSERT INTO `x2_cityarea` VALUES (530523, '530523', '龙陵县', '530500');
INSERT INTO `x2_cityarea` VALUES (530524, '530524', '昌宁县', '530500');
INSERT INTO `x2_cityarea` VALUES (530601, '530601', '市辖区', '530600');
INSERT INTO `x2_cityarea` VALUES (530602, '530602', '昭阳区', '530600');
INSERT INTO `x2_cityarea` VALUES (530621, '530621', '鲁甸县', '530600');
INSERT INTO `x2_cityarea` VALUES (530622, '530622', '巧家县', '530600');
INSERT INTO `x2_cityarea` VALUES (530623, '530623', '盐津县', '530600');
INSERT INTO `x2_cityarea` VALUES (530624, '530624', '大关县', '530600');
INSERT INTO `x2_cityarea` VALUES (530625, '530625', '永善县', '530600');
INSERT INTO `x2_cityarea` VALUES (530626, '530626', '绥江县', '530600');
INSERT INTO `x2_cityarea` VALUES (530627, '530627', '镇雄县', '530600');
INSERT INTO `x2_cityarea` VALUES (530628, '530628', '彝良县', '530600');
INSERT INTO `x2_cityarea` VALUES (530629, '530629', '威信县', '530600');
INSERT INTO `x2_cityarea` VALUES (530630, '530630', '水富县', '530600');
INSERT INTO `x2_cityarea` VALUES (530701, '530701', '市辖区', '530700');
INSERT INTO `x2_cityarea` VALUES (530702, '530702', '古城区', '530700');
INSERT INTO `x2_cityarea` VALUES (530721, '530721', '玉龙纳西族自治县', '530700');
INSERT INTO `x2_cityarea` VALUES (530722, '530722', '永胜县', '530700');
INSERT INTO `x2_cityarea` VALUES (530723, '530723', '华坪县', '530700');
INSERT INTO `x2_cityarea` VALUES (530724, '530724', '宁蒗彝族自治县', '530700');
INSERT INTO `x2_cityarea` VALUES (530801, '530801', '市辖区', '530800');
INSERT INTO `x2_cityarea` VALUES (530802, '530802', '翠云区', '530800');
INSERT INTO `x2_cityarea` VALUES (530821, '530821', '普洱哈尼族彝族自治县', '530800');
INSERT INTO `x2_cityarea` VALUES (530822, '530822', '墨江哈尼族自治县', '530800');
INSERT INTO `x2_cityarea` VALUES (530823, '530823', '景东彝族自治县', '530800');
INSERT INTO `x2_cityarea` VALUES (530824, '530824', '景谷傣族彝族自治县', '530800');
INSERT INTO `x2_cityarea` VALUES (530825, '530825', '镇沅彝族哈尼族拉祜族自治县', '530800');
INSERT INTO `x2_cityarea` VALUES (530826, '530826', '江城哈尼族彝族自治县', '530800');
INSERT INTO `x2_cityarea` VALUES (530827, '530827', '孟连傣族拉祜族佤族自治县', '530800');
INSERT INTO `x2_cityarea` VALUES (530828, '530828', '澜沧拉祜族自治县', '530800');
INSERT INTO `x2_cityarea` VALUES (530829, '530829', '西盟佤族自治县', '530800');
INSERT INTO `x2_cityarea` VALUES (530901, '530901', '市辖区', '530900');
INSERT INTO `x2_cityarea` VALUES (530902, '530902', '临翔区', '530900');
INSERT INTO `x2_cityarea` VALUES (530921, '530921', '凤庆县', '530900');
INSERT INTO `x2_cityarea` VALUES (530922, '530922', '云　县', '530900');
INSERT INTO `x2_cityarea` VALUES (530923, '530923', '永德县', '530900');
INSERT INTO `x2_cityarea` VALUES (530924, '530924', '镇康县', '530900');
INSERT INTO `x2_cityarea` VALUES (530925, '530925', '双江拉祜族佤族布朗族傣族自治县', '530900');
INSERT INTO `x2_cityarea` VALUES (530926, '530926', '耿马傣族佤族自治县', '530900');
INSERT INTO `x2_cityarea` VALUES (530927, '530927', '沧源佤族自治县', '530900');
INSERT INTO `x2_cityarea` VALUES (532301, '532301', '楚雄市', '532300');
INSERT INTO `x2_cityarea` VALUES (532322, '532322', '双柏县', '532300');
INSERT INTO `x2_cityarea` VALUES (532323, '532323', '牟定县', '532300');
INSERT INTO `x2_cityarea` VALUES (532324, '532324', '南华县', '532300');
INSERT INTO `x2_cityarea` VALUES (532325, '532325', '姚安县', '532300');
INSERT INTO `x2_cityarea` VALUES (532326, '532326', '大姚县', '532300');
INSERT INTO `x2_cityarea` VALUES (532327, '532327', '永仁县', '532300');
INSERT INTO `x2_cityarea` VALUES (532328, '532328', '元谋县', '532300');
INSERT INTO `x2_cityarea` VALUES (532329, '532329', '武定县', '532300');
INSERT INTO `x2_cityarea` VALUES (532331, '532331', '禄丰县', '532300');
INSERT INTO `x2_cityarea` VALUES (532501, '532501', '个旧市', '532500');
INSERT INTO `x2_cityarea` VALUES (532502, '532502', '开远市', '532500');
INSERT INTO `x2_cityarea` VALUES (532522, '532522', '蒙自县', '532500');
INSERT INTO `x2_cityarea` VALUES (532523, '532523', '屏边苗族自治县', '532500');
INSERT INTO `x2_cityarea` VALUES (532524, '532524', '建水县', '532500');
INSERT INTO `x2_cityarea` VALUES (532525, '532525', '石屏县', '532500');
INSERT INTO `x2_cityarea` VALUES (532526, '532526', '弥勒县', '532500');
INSERT INTO `x2_cityarea` VALUES (532527, '532527', '泸西县', '532500');
INSERT INTO `x2_cityarea` VALUES (532528, '532528', '元阳县', '532500');
INSERT INTO `x2_cityarea` VALUES (532529, '532529', '红河县', '532500');
INSERT INTO `x2_cityarea` VALUES (532530, '532530', '金平苗族瑶族傣族自治县', '532500');
INSERT INTO `x2_cityarea` VALUES (532531, '532531', '绿春县', '532500');
INSERT INTO `x2_cityarea` VALUES (532532, '532532', '河口瑶族自治县', '532500');
INSERT INTO `x2_cityarea` VALUES (532621, '532621', '文山县', '532600');
INSERT INTO `x2_cityarea` VALUES (532622, '532622', '砚山县', '532600');
INSERT INTO `x2_cityarea` VALUES (532623, '532623', '西畴县', '532600');
INSERT INTO `x2_cityarea` VALUES (532624, '532624', '麻栗坡县', '532600');
INSERT INTO `x2_cityarea` VALUES (532625, '532625', '马关县', '532600');
INSERT INTO `x2_cityarea` VALUES (532626, '532626', '丘北县', '532600');
INSERT INTO `x2_cityarea` VALUES (532627, '532627', '广南县', '532600');
INSERT INTO `x2_cityarea` VALUES (532628, '532628', '富宁县', '532600');
INSERT INTO `x2_cityarea` VALUES (532801, '532801', '景洪市', '532800');
INSERT INTO `x2_cityarea` VALUES (532822, '532822', '勐海县', '532800');
INSERT INTO `x2_cityarea` VALUES (532823, '532823', '勐腊县', '532800');
INSERT INTO `x2_cityarea` VALUES (532901, '532901', '大理市', '532900');
INSERT INTO `x2_cityarea` VALUES (532922, '532922', '漾濞彝族自治县', '532900');
INSERT INTO `x2_cityarea` VALUES (532923, '532923', '祥云县', '532900');
INSERT INTO `x2_cityarea` VALUES (532924, '532924', '宾川县', '532900');
INSERT INTO `x2_cityarea` VALUES (532925, '532925', '弥渡县', '532900');
INSERT INTO `x2_cityarea` VALUES (532926, '532926', '南涧彝族自治县', '532900');
INSERT INTO `x2_cityarea` VALUES (532927, '532927', '巍山彝族回族自治县', '532900');
INSERT INTO `x2_cityarea` VALUES (532928, '532928', '永平县', '532900');
INSERT INTO `x2_cityarea` VALUES (532929, '532929', '云龙县', '532900');
INSERT INTO `x2_cityarea` VALUES (532930, '532930', '洱源县', '532900');
INSERT INTO `x2_cityarea` VALUES (532931, '532931', '剑川县', '532900');
INSERT INTO `x2_cityarea` VALUES (532932, '532932', '鹤庆县', '532900');
INSERT INTO `x2_cityarea` VALUES (533102, '533102', '瑞丽市', '533100');
INSERT INTO `x2_cityarea` VALUES (533103, '533103', '潞西市', '533100');
INSERT INTO `x2_cityarea` VALUES (533122, '533122', '梁河县', '533100');
INSERT INTO `x2_cityarea` VALUES (533123, '533123', '盈江县', '533100');
INSERT INTO `x2_cityarea` VALUES (533124, '533124', '陇川县', '533100');
INSERT INTO `x2_cityarea` VALUES (533321, '533321', '泸水县', '533300');
INSERT INTO `x2_cityarea` VALUES (533323, '533323', '福贡县', '533300');
INSERT INTO `x2_cityarea` VALUES (533324, '533324', '贡山独龙族怒族自治县', '533300');
INSERT INTO `x2_cityarea` VALUES (533325, '533325', '兰坪白族普米族自治县', '533300');
INSERT INTO `x2_cityarea` VALUES (533421, '533421', '香格里拉县', '533400');
INSERT INTO `x2_cityarea` VALUES (533422, '533422', '德钦县', '533400');
INSERT INTO `x2_cityarea` VALUES (533423, '533423', '维西傈僳族自治县', '533400');
INSERT INTO `x2_cityarea` VALUES (540101, '540101', '市辖区', '540100');
INSERT INTO `x2_cityarea` VALUES (540102, '540102', '城关区', '540100');
INSERT INTO `x2_cityarea` VALUES (540121, '540121', '林周县', '540100');
INSERT INTO `x2_cityarea` VALUES (540122, '540122', '当雄县', '540100');
INSERT INTO `x2_cityarea` VALUES (540123, '540123', '尼木县', '540100');
INSERT INTO `x2_cityarea` VALUES (540124, '540124', '曲水县', '540100');
INSERT INTO `x2_cityarea` VALUES (540125, '540125', '堆龙德庆县', '540100');
INSERT INTO `x2_cityarea` VALUES (540126, '540126', '达孜县', '540100');
INSERT INTO `x2_cityarea` VALUES (540127, '540127', '墨竹工卡县', '540100');
INSERT INTO `x2_cityarea` VALUES (542121, '542121', '昌都县', '542100');
INSERT INTO `x2_cityarea` VALUES (542122, '542122', '江达县', '542100');
INSERT INTO `x2_cityarea` VALUES (542123, '542123', '贡觉县', '542100');
INSERT INTO `x2_cityarea` VALUES (542124, '542124', '类乌齐县', '542100');
INSERT INTO `x2_cityarea` VALUES (542125, '542125', '丁青县', '542100');
INSERT INTO `x2_cityarea` VALUES (542126, '542126', '察雅县', '542100');
INSERT INTO `x2_cityarea` VALUES (542127, '542127', '八宿县', '542100');
INSERT INTO `x2_cityarea` VALUES (542128, '542128', '左贡县', '542100');
INSERT INTO `x2_cityarea` VALUES (542129, '542129', '芒康县', '542100');
INSERT INTO `x2_cityarea` VALUES (542132, '542132', '洛隆县', '542100');
INSERT INTO `x2_cityarea` VALUES (542133, '542133', '边坝县', '542100');
INSERT INTO `x2_cityarea` VALUES (542221, '542221', '乃东县', '542200');
INSERT INTO `x2_cityarea` VALUES (542222, '542222', '扎囊县', '542200');
INSERT INTO `x2_cityarea` VALUES (542223, '542223', '贡嘎县', '542200');
INSERT INTO `x2_cityarea` VALUES (542224, '542224', '桑日县', '542200');
INSERT INTO `x2_cityarea` VALUES (542225, '542225', '琼结县', '542200');
INSERT INTO `x2_cityarea` VALUES (542226, '542226', '曲松县', '542200');
INSERT INTO `x2_cityarea` VALUES (542227, '542227', '措美县', '542200');
INSERT INTO `x2_cityarea` VALUES (542228, '542228', '洛扎县', '542200');
INSERT INTO `x2_cityarea` VALUES (542229, '542229', '加查县', '542200');
INSERT INTO `x2_cityarea` VALUES (542231, '542231', '隆子县', '542200');
INSERT INTO `x2_cityarea` VALUES (542232, '542232', '错那县', '542200');
INSERT INTO `x2_cityarea` VALUES (542233, '542233', '浪卡子县', '542200');
INSERT INTO `x2_cityarea` VALUES (542301, '542301', '日喀则市', '542300');
INSERT INTO `x2_cityarea` VALUES (542322, '542322', '南木林县', '542300');
INSERT INTO `x2_cityarea` VALUES (542323, '542323', '江孜县', '542300');
INSERT INTO `x2_cityarea` VALUES (542324, '542324', '定日县', '542300');
INSERT INTO `x2_cityarea` VALUES (542325, '542325', '萨迦县', '542300');
INSERT INTO `x2_cityarea` VALUES (542326, '542326', '拉孜县', '542300');
INSERT INTO `x2_cityarea` VALUES (542327, '542327', '昂仁县', '542300');
INSERT INTO `x2_cityarea` VALUES (542328, '542328', '谢通门县', '542300');
INSERT INTO `x2_cityarea` VALUES (542329, '542329', '白朗县', '542300');
INSERT INTO `x2_cityarea` VALUES (542330, '542330', '仁布县', '542300');
INSERT INTO `x2_cityarea` VALUES (542331, '542331', '康马县', '542300');
INSERT INTO `x2_cityarea` VALUES (542332, '542332', '定结县', '542300');
INSERT INTO `x2_cityarea` VALUES (542333, '542333', '仲巴县', '542300');
INSERT INTO `x2_cityarea` VALUES (542334, '542334', '亚东县', '542300');
INSERT INTO `x2_cityarea` VALUES (542335, '542335', '吉隆县', '542300');
INSERT INTO `x2_cityarea` VALUES (542336, '542336', '聂拉木县', '542300');
INSERT INTO `x2_cityarea` VALUES (542337, '542337', '萨嘎县', '542300');
INSERT INTO `x2_cityarea` VALUES (542338, '542338', '岗巴县', '542300');
INSERT INTO `x2_cityarea` VALUES (542421, '542421', '那曲县', '542400');
INSERT INTO `x2_cityarea` VALUES (542422, '542422', '嘉黎县', '542400');
INSERT INTO `x2_cityarea` VALUES (542423, '542423', '比如县', '542400');
INSERT INTO `x2_cityarea` VALUES (542424, '542424', '聂荣县', '542400');
INSERT INTO `x2_cityarea` VALUES (542425, '542425', '安多县', '542400');
INSERT INTO `x2_cityarea` VALUES (542426, '542426', '申扎县', '542400');
INSERT INTO `x2_cityarea` VALUES (542427, '542427', '索　县', '542400');
INSERT INTO `x2_cityarea` VALUES (542428, '542428', '班戈县', '542400');
INSERT INTO `x2_cityarea` VALUES (542429, '542429', '巴青县', '542400');
INSERT INTO `x2_cityarea` VALUES (542430, '542430', '尼玛县', '542400');
INSERT INTO `x2_cityarea` VALUES (542521, '542521', '普兰县', '542500');
INSERT INTO `x2_cityarea` VALUES (542522, '542522', '札达县', '542500');
INSERT INTO `x2_cityarea` VALUES (542523, '542523', '噶尔县', '542500');
INSERT INTO `x2_cityarea` VALUES (542524, '542524', '日土县', '542500');
INSERT INTO `x2_cityarea` VALUES (542525, '542525', '革吉县', '542500');
INSERT INTO `x2_cityarea` VALUES (542526, '542526', '改则县', '542500');
INSERT INTO `x2_cityarea` VALUES (542527, '542527', '措勤县', '542500');
INSERT INTO `x2_cityarea` VALUES (542621, '542621', '林芝县', '542600');
INSERT INTO `x2_cityarea` VALUES (542622, '542622', '工布江达县', '542600');
INSERT INTO `x2_cityarea` VALUES (542623, '542623', '米林县', '542600');
INSERT INTO `x2_cityarea` VALUES (542624, '542624', '墨脱县', '542600');
INSERT INTO `x2_cityarea` VALUES (542625, '542625', '波密县', '542600');
INSERT INTO `x2_cityarea` VALUES (542626, '542626', '察隅县', '542600');
INSERT INTO `x2_cityarea` VALUES (542627, '542627', '朗　县', '542600');
INSERT INTO `x2_cityarea` VALUES (610101, '610101', '市辖区', '610100');
INSERT INTO `x2_cityarea` VALUES (610102, '610102', '新城区', '610100');
INSERT INTO `x2_cityarea` VALUES (610103, '610103', '碑林区', '610100');
INSERT INTO `x2_cityarea` VALUES (610104, '610104', '莲湖区', '610100');
INSERT INTO `x2_cityarea` VALUES (610111, '610111', '灞桥区', '610100');
INSERT INTO `x2_cityarea` VALUES (610112, '610112', '未央区', '610100');
INSERT INTO `x2_cityarea` VALUES (610113, '610113', '雁塔区', '610100');
INSERT INTO `x2_cityarea` VALUES (610114, '610114', '阎良区', '610100');
INSERT INTO `x2_cityarea` VALUES (610115, '610115', '临潼区', '610100');
INSERT INTO `x2_cityarea` VALUES (610116, '610116', '长安区', '610100');
INSERT INTO `x2_cityarea` VALUES (610122, '610122', '蓝田县', '610100');
INSERT INTO `x2_cityarea` VALUES (610124, '610124', '周至县', '610100');
INSERT INTO `x2_cityarea` VALUES (610125, '610125', '户　县', '610100');
INSERT INTO `x2_cityarea` VALUES (610126, '610126', '高陵县', '610100');
INSERT INTO `x2_cityarea` VALUES (610201, '610201', '市辖区', '610200');
INSERT INTO `x2_cityarea` VALUES (610202, '610202', '王益区', '610200');
INSERT INTO `x2_cityarea` VALUES (610203, '610203', '印台区', '610200');
INSERT INTO `x2_cityarea` VALUES (610204, '610204', '耀州区', '610200');
INSERT INTO `x2_cityarea` VALUES (610222, '610222', '宜君县', '610200');
INSERT INTO `x2_cityarea` VALUES (610301, '610301', '市辖区', '610300');
INSERT INTO `x2_cityarea` VALUES (610302, '610302', '渭滨区', '610300');
INSERT INTO `x2_cityarea` VALUES (610303, '610303', '金台区', '610300');
INSERT INTO `x2_cityarea` VALUES (610304, '610304', '陈仓区', '610300');
INSERT INTO `x2_cityarea` VALUES (610322, '610322', '凤翔县', '610300');
INSERT INTO `x2_cityarea` VALUES (610323, '610323', '岐山县', '610300');
INSERT INTO `x2_cityarea` VALUES (610324, '610324', '扶风县', '610300');
INSERT INTO `x2_cityarea` VALUES (610326, '610326', '眉　县', '610300');
INSERT INTO `x2_cityarea` VALUES (610327, '610327', '陇　县', '610300');
INSERT INTO `x2_cityarea` VALUES (610328, '610328', '千阳县', '610300');
INSERT INTO `x2_cityarea` VALUES (610329, '610329', '麟游县', '610300');
INSERT INTO `x2_cityarea` VALUES (610330, '610330', '凤　县', '610300');
INSERT INTO `x2_cityarea` VALUES (610331, '610331', '太白县', '610300');
INSERT INTO `x2_cityarea` VALUES (610401, '610401', '市辖区', '610400');
INSERT INTO `x2_cityarea` VALUES (610402, '610402', '秦都区', '610400');
INSERT INTO `x2_cityarea` VALUES (610403, '610403', '杨凌区', '610400');
INSERT INTO `x2_cityarea` VALUES (610404, '610404', '渭城区', '610400');
INSERT INTO `x2_cityarea` VALUES (610422, '610422', '三原县', '610400');
INSERT INTO `x2_cityarea` VALUES (610423, '610423', '泾阳县', '610400');
INSERT INTO `x2_cityarea` VALUES (610424, '610424', '乾　县', '610400');
INSERT INTO `x2_cityarea` VALUES (610425, '610425', '礼泉县', '610400');
INSERT INTO `x2_cityarea` VALUES (610426, '610426', '永寿县', '610400');
INSERT INTO `x2_cityarea` VALUES (610427, '610427', '彬　县', '610400');
INSERT INTO `x2_cityarea` VALUES (610428, '610428', '长武县', '610400');
INSERT INTO `x2_cityarea` VALUES (610429, '610429', '旬邑县', '610400');
INSERT INTO `x2_cityarea` VALUES (610430, '610430', '淳化县', '610400');
INSERT INTO `x2_cityarea` VALUES (610431, '610431', '武功县', '610400');
INSERT INTO `x2_cityarea` VALUES (610481, '610481', '兴平市', '610400');
INSERT INTO `x2_cityarea` VALUES (610501, '610501', '市辖区', '610500');
INSERT INTO `x2_cityarea` VALUES (610502, '610502', '临渭区', '610500');
INSERT INTO `x2_cityarea` VALUES (610521, '610521', '华　县', '610500');
INSERT INTO `x2_cityarea` VALUES (610522, '610522', '潼关县', '610500');
INSERT INTO `x2_cityarea` VALUES (610523, '610523', '大荔县', '610500');
INSERT INTO `x2_cityarea` VALUES (610524, '610524', '合阳县', '610500');
INSERT INTO `x2_cityarea` VALUES (610525, '610525', '澄城县', '610500');
INSERT INTO `x2_cityarea` VALUES (610526, '610526', '蒲城县', '610500');
INSERT INTO `x2_cityarea` VALUES (610527, '610527', '白水县', '610500');
INSERT INTO `x2_cityarea` VALUES (610528, '610528', '富平县', '610500');
INSERT INTO `x2_cityarea` VALUES (610581, '610581', '韩城市', '610500');
INSERT INTO `x2_cityarea` VALUES (610582, '610582', '华阴市', '610500');
INSERT INTO `x2_cityarea` VALUES (610601, '610601', '市辖区', '610600');
INSERT INTO `x2_cityarea` VALUES (610602, '610602', '宝塔区', '610600');
INSERT INTO `x2_cityarea` VALUES (610621, '610621', '延长县', '610600');
INSERT INTO `x2_cityarea` VALUES (610622, '610622', '延川县', '610600');
INSERT INTO `x2_cityarea` VALUES (610623, '610623', '子长县', '610600');
INSERT INTO `x2_cityarea` VALUES (610624, '610624', '安塞县', '610600');
INSERT INTO `x2_cityarea` VALUES (610625, '610625', '志丹县', '610600');
INSERT INTO `x2_cityarea` VALUES (610626, '610626', '吴旗县', '610600');
INSERT INTO `x2_cityarea` VALUES (610627, '610627', '甘泉县', '610600');
INSERT INTO `x2_cityarea` VALUES (610628, '610628', '富　县', '610600');
INSERT INTO `x2_cityarea` VALUES (610629, '610629', '洛川县', '610600');
INSERT INTO `x2_cityarea` VALUES (610630, '610630', '宜川县', '610600');
INSERT INTO `x2_cityarea` VALUES (610631, '610631', '黄龙县', '610600');
INSERT INTO `x2_cityarea` VALUES (610632, '610632', '黄陵县', '610600');
INSERT INTO `x2_cityarea` VALUES (610701, '610701', '市辖区', '610700');
INSERT INTO `x2_cityarea` VALUES (610702, '610702', '汉台区', '610700');
INSERT INTO `x2_cityarea` VALUES (610721, '610721', '南郑县', '610700');
INSERT INTO `x2_cityarea` VALUES (610722, '610722', '城固县', '610700');
INSERT INTO `x2_cityarea` VALUES (610723, '610723', '洋　县', '610700');
INSERT INTO `x2_cityarea` VALUES (610724, '610724', '西乡县', '610700');
INSERT INTO `x2_cityarea` VALUES (610725, '610725', '勉　县', '610700');
INSERT INTO `x2_cityarea` VALUES (610726, '610726', '宁强县', '610700');
INSERT INTO `x2_cityarea` VALUES (610727, '610727', '略阳县', '610700');
INSERT INTO `x2_cityarea` VALUES (610728, '610728', '镇巴县', '610700');
INSERT INTO `x2_cityarea` VALUES (610729, '610729', '留坝县', '610700');
INSERT INTO `x2_cityarea` VALUES (610730, '610730', '佛坪县', '610700');
INSERT INTO `x2_cityarea` VALUES (610801, '610801', '市辖区', '610800');
INSERT INTO `x2_cityarea` VALUES (610802, '610802', '榆阳区', '610800');
INSERT INTO `x2_cityarea` VALUES (610821, '610821', '神木县', '610800');
INSERT INTO `x2_cityarea` VALUES (610822, '610822', '府谷县', '610800');
INSERT INTO `x2_cityarea` VALUES (610823, '610823', '横山县', '610800');
INSERT INTO `x2_cityarea` VALUES (610824, '610824', '靖边县', '610800');
INSERT INTO `x2_cityarea` VALUES (610825, '610825', '定边县', '610800');
INSERT INTO `x2_cityarea` VALUES (610826, '610826', '绥德县', '610800');
INSERT INTO `x2_cityarea` VALUES (610827, '610827', '米脂县', '610800');
INSERT INTO `x2_cityarea` VALUES (610828, '610828', '佳　县', '610800');
INSERT INTO `x2_cityarea` VALUES (610829, '610829', '吴堡县', '610800');
INSERT INTO `x2_cityarea` VALUES (610830, '610830', '清涧县', '610800');
INSERT INTO `x2_cityarea` VALUES (610831, '610831', '子洲县', '610800');
INSERT INTO `x2_cityarea` VALUES (610901, '610901', '市辖区', '610900');
INSERT INTO `x2_cityarea` VALUES (610902, '610902', '汉滨区', '610900');
INSERT INTO `x2_cityarea` VALUES (610921, '610921', '汉阴县', '610900');
INSERT INTO `x2_cityarea` VALUES (610922, '610922', '石泉县', '610900');
INSERT INTO `x2_cityarea` VALUES (610923, '610923', '宁陕县', '610900');
INSERT INTO `x2_cityarea` VALUES (610924, '610924', '紫阳县', '610900');
INSERT INTO `x2_cityarea` VALUES (610925, '610925', '岚皋县', '610900');
INSERT INTO `x2_cityarea` VALUES (610926, '610926', '平利县', '610900');
INSERT INTO `x2_cityarea` VALUES (610927, '610927', '镇坪县', '610900');
INSERT INTO `x2_cityarea` VALUES (610928, '610928', '旬阳县', '610900');
INSERT INTO `x2_cityarea` VALUES (610929, '610929', '白河县', '610900');
INSERT INTO `x2_cityarea` VALUES (611001, '611001', '市辖区', '611000');
INSERT INTO `x2_cityarea` VALUES (611002, '611002', '商州区', '611000');
INSERT INTO `x2_cityarea` VALUES (611021, '611021', '洛南县', '611000');
INSERT INTO `x2_cityarea` VALUES (611022, '611022', '丹凤县', '611000');
INSERT INTO `x2_cityarea` VALUES (611023, '611023', '商南县', '611000');
INSERT INTO `x2_cityarea` VALUES (611024, '611024', '山阳县', '611000');
INSERT INTO `x2_cityarea` VALUES (611025, '611025', '镇安县', '611000');
INSERT INTO `x2_cityarea` VALUES (611026, '611026', '柞水县', '611000');
INSERT INTO `x2_cityarea` VALUES (620101, '620101', '市辖区', '620100');
INSERT INTO `x2_cityarea` VALUES (620102, '620102', '城关区', '620100');
INSERT INTO `x2_cityarea` VALUES (620103, '620103', '七里河区', '620100');
INSERT INTO `x2_cityarea` VALUES (620104, '620104', '西固区', '620100');
INSERT INTO `x2_cityarea` VALUES (620105, '620105', '安宁区', '620100');
INSERT INTO `x2_cityarea` VALUES (620111, '620111', '红古区', '620100');
INSERT INTO `x2_cityarea` VALUES (620121, '620121', '永登县', '620100');
INSERT INTO `x2_cityarea` VALUES (620122, '620122', '皋兰县', '620100');
INSERT INTO `x2_cityarea` VALUES (620123, '620123', '榆中县', '620100');
INSERT INTO `x2_cityarea` VALUES (620201, '620201', '市辖区', '620200');
INSERT INTO `x2_cityarea` VALUES (620301, '620301', '市辖区', '620300');
INSERT INTO `x2_cityarea` VALUES (620302, '620302', '金川区', '620300');
INSERT INTO `x2_cityarea` VALUES (620321, '620321', '永昌县', '620300');
INSERT INTO `x2_cityarea` VALUES (620401, '620401', '市辖区', '620400');
INSERT INTO `x2_cityarea` VALUES (620402, '620402', '白银区', '620400');
INSERT INTO `x2_cityarea` VALUES (620403, '620403', '平川区', '620400');
INSERT INTO `x2_cityarea` VALUES (620421, '620421', '靖远县', '620400');
INSERT INTO `x2_cityarea` VALUES (620422, '620422', '会宁县', '620400');
INSERT INTO `x2_cityarea` VALUES (620423, '620423', '景泰县', '620400');
INSERT INTO `x2_cityarea` VALUES (620501, '620501', '市辖区', '620500');
INSERT INTO `x2_cityarea` VALUES (620502, '620502', '秦城区', '620500');
INSERT INTO `x2_cityarea` VALUES (620503, '620503', '北道区', '620500');
INSERT INTO `x2_cityarea` VALUES (620521, '620521', '清水县', '620500');
INSERT INTO `x2_cityarea` VALUES (620522, '620522', '秦安县', '620500');
INSERT INTO `x2_cityarea` VALUES (620523, '620523', '甘谷县', '620500');
INSERT INTO `x2_cityarea` VALUES (620524, '620524', '武山县', '620500');
INSERT INTO `x2_cityarea` VALUES (620525, '620525', '张家川回族自治县', '620500');
INSERT INTO `x2_cityarea` VALUES (620601, '620601', '市辖区', '620600');
INSERT INTO `x2_cityarea` VALUES (620602, '620602', '凉州区', '620600');
INSERT INTO `x2_cityarea` VALUES (620621, '620621', '民勤县', '620600');
INSERT INTO `x2_cityarea` VALUES (620622, '620622', '古浪县', '620600');
INSERT INTO `x2_cityarea` VALUES (620623, '620623', '天祝藏族自治县', '620600');
INSERT INTO `x2_cityarea` VALUES (620701, '620701', '市辖区', '620700');
INSERT INTO `x2_cityarea` VALUES (620702, '620702', '甘州区', '620700');
INSERT INTO `x2_cityarea` VALUES (620721, '620721', '肃南裕固族自治县', '620700');
INSERT INTO `x2_cityarea` VALUES (620722, '620722', '民乐县', '620700');
INSERT INTO `x2_cityarea` VALUES (620723, '620723', '临泽县', '620700');
INSERT INTO `x2_cityarea` VALUES (620724, '620724', '高台县', '620700');
INSERT INTO `x2_cityarea` VALUES (620725, '620725', '山丹县', '620700');
INSERT INTO `x2_cityarea` VALUES (620801, '620801', '市辖区', '620800');
INSERT INTO `x2_cityarea` VALUES (620802, '620802', '崆峒区', '620800');
INSERT INTO `x2_cityarea` VALUES (620821, '620821', '泾川县', '620800');
INSERT INTO `x2_cityarea` VALUES (620822, '620822', '灵台县', '620800');
INSERT INTO `x2_cityarea` VALUES (620823, '620823', '崇信县', '620800');
INSERT INTO `x2_cityarea` VALUES (620824, '620824', '华亭县', '620800');
INSERT INTO `x2_cityarea` VALUES (620825, '620825', '庄浪县', '620800');
INSERT INTO `x2_cityarea` VALUES (620826, '620826', '静宁县', '620800');
INSERT INTO `x2_cityarea` VALUES (620901, '620901', '市辖区', '620900');
INSERT INTO `x2_cityarea` VALUES (620902, '620902', '肃州区', '620900');
INSERT INTO `x2_cityarea` VALUES (620921, '620921', '金塔县', '620900');
INSERT INTO `x2_cityarea` VALUES (620922, '620922', '安西县', '620900');
INSERT INTO `x2_cityarea` VALUES (620923, '620923', '肃北蒙古族自治县', '620900');
INSERT INTO `x2_cityarea` VALUES (620924, '620924', '阿克塞哈萨克族自治县', '620900');
INSERT INTO `x2_cityarea` VALUES (620981, '620981', '玉门市', '620900');
INSERT INTO `x2_cityarea` VALUES (620982, '620982', '敦煌市', '620900');
INSERT INTO `x2_cityarea` VALUES (621001, '621001', '市辖区', '621000');
INSERT INTO `x2_cityarea` VALUES (621002, '621002', '西峰区', '621000');
INSERT INTO `x2_cityarea` VALUES (621021, '621021', '庆城县', '621000');
INSERT INTO `x2_cityarea` VALUES (621022, '621022', '环　县', '621000');
INSERT INTO `x2_cityarea` VALUES (621023, '621023', '华池县', '621000');
INSERT INTO `x2_cityarea` VALUES (621024, '621024', '合水县', '621000');
INSERT INTO `x2_cityarea` VALUES (621025, '621025', '正宁县', '621000');
INSERT INTO `x2_cityarea` VALUES (621026, '621026', '宁　县', '621000');
INSERT INTO `x2_cityarea` VALUES (621027, '621027', '镇原县', '621000');
INSERT INTO `x2_cityarea` VALUES (621101, '621101', '市辖区', '621100');
INSERT INTO `x2_cityarea` VALUES (621102, '621102', '安定区', '621100');
INSERT INTO `x2_cityarea` VALUES (621121, '621121', '通渭县', '621100');
INSERT INTO `x2_cityarea` VALUES (621122, '621122', '陇西县', '621100');
INSERT INTO `x2_cityarea` VALUES (621123, '621123', '渭源县', '621100');
INSERT INTO `x2_cityarea` VALUES (621124, '621124', '临洮县', '621100');
INSERT INTO `x2_cityarea` VALUES (621125, '621125', '漳　县', '621100');
INSERT INTO `x2_cityarea` VALUES (621126, '621126', '岷　县', '621100');
INSERT INTO `x2_cityarea` VALUES (621201, '621201', '市辖区', '621200');
INSERT INTO `x2_cityarea` VALUES (621202, '621202', '武都区', '621200');
INSERT INTO `x2_cityarea` VALUES (621221, '621221', '成　县', '621200');
INSERT INTO `x2_cityarea` VALUES (621222, '621222', '文　县', '621200');
INSERT INTO `x2_cityarea` VALUES (621223, '621223', '宕昌县', '621200');
INSERT INTO `x2_cityarea` VALUES (621224, '621224', '康　县', '621200');
INSERT INTO `x2_cityarea` VALUES (621225, '621225', '西和县', '621200');
INSERT INTO `x2_cityarea` VALUES (621226, '621226', '礼　县', '621200');
INSERT INTO `x2_cityarea` VALUES (621227, '621227', '徽　县', '621200');
INSERT INTO `x2_cityarea` VALUES (621228, '621228', '两当县', '621200');
INSERT INTO `x2_cityarea` VALUES (622901, '622901', '临夏市', '622900');
INSERT INTO `x2_cityarea` VALUES (622921, '622921', '临夏县', '622900');
INSERT INTO `x2_cityarea` VALUES (622922, '622922', '康乐县', '622900');
INSERT INTO `x2_cityarea` VALUES (622923, '622923', '永靖县', '622900');
INSERT INTO `x2_cityarea` VALUES (622924, '622924', '广河县', '622900');
INSERT INTO `x2_cityarea` VALUES (622925, '622925', '和政县', '622900');
INSERT INTO `x2_cityarea` VALUES (622926, '622926', '东乡族自治县', '622900');
INSERT INTO `x2_cityarea` VALUES (622927, '622927', '积石山保安族东乡族撒拉族自治县', '622900');
INSERT INTO `x2_cityarea` VALUES (623001, '623001', '合作市', '623000');
INSERT INTO `x2_cityarea` VALUES (623021, '623021', '临潭县', '623000');
INSERT INTO `x2_cityarea` VALUES (623022, '623022', '卓尼县', '623000');
INSERT INTO `x2_cityarea` VALUES (623023, '623023', '舟曲县', '623000');
INSERT INTO `x2_cityarea` VALUES (623024, '623024', '迭部县', '623000');
INSERT INTO `x2_cityarea` VALUES (623025, '623025', '玛曲县', '623000');
INSERT INTO `x2_cityarea` VALUES (623026, '623026', '碌曲县', '623000');
INSERT INTO `x2_cityarea` VALUES (623027, '623027', '夏河县', '623000');
INSERT INTO `x2_cityarea` VALUES (630101, '630101', '市辖区', '630100');
INSERT INTO `x2_cityarea` VALUES (630102, '630102', '城东区', '630100');
INSERT INTO `x2_cityarea` VALUES (630103, '630103', '城中区', '630100');
INSERT INTO `x2_cityarea` VALUES (630104, '630104', '城西区', '630100');
INSERT INTO `x2_cityarea` VALUES (630105, '630105', '城北区', '630100');
INSERT INTO `x2_cityarea` VALUES (630121, '630121', '大通回族土族自治县', '630100');
INSERT INTO `x2_cityarea` VALUES (630122, '630122', '湟中县', '630100');
INSERT INTO `x2_cityarea` VALUES (630123, '630123', '湟源县', '630100');
INSERT INTO `x2_cityarea` VALUES (632121, '632121', '平安县', '632100');
INSERT INTO `x2_cityarea` VALUES (632122, '632122', '民和回族土族自治县', '632100');
INSERT INTO `x2_cityarea` VALUES (632123, '632123', '乐都县', '632100');
INSERT INTO `x2_cityarea` VALUES (632126, '632126', '互助土族自治县', '632100');
INSERT INTO `x2_cityarea` VALUES (632127, '632127', '化隆回族自治县', '632100');
INSERT INTO `x2_cityarea` VALUES (632128, '632128', '循化撒拉族自治县', '632100');
INSERT INTO `x2_cityarea` VALUES (632221, '632221', '门源回族自治县', '632200');
INSERT INTO `x2_cityarea` VALUES (632222, '632222', '祁连县', '632200');
INSERT INTO `x2_cityarea` VALUES (632223, '632223', '海晏县', '632200');
INSERT INTO `x2_cityarea` VALUES (632224, '632224', '刚察县', '632200');
INSERT INTO `x2_cityarea` VALUES (632321, '632321', '同仁县', '632300');
INSERT INTO `x2_cityarea` VALUES (632322, '632322', '尖扎县', '632300');
INSERT INTO `x2_cityarea` VALUES (632323, '632323', '泽库县', '632300');
INSERT INTO `x2_cityarea` VALUES (632324, '632324', '河南蒙古族自治县', '632300');
INSERT INTO `x2_cityarea` VALUES (632521, '632521', '共和县', '632500');
INSERT INTO `x2_cityarea` VALUES (632522, '632522', '同德县', '632500');
INSERT INTO `x2_cityarea` VALUES (632523, '632523', '贵德县', '632500');
INSERT INTO `x2_cityarea` VALUES (632524, '632524', '兴海县', '632500');
INSERT INTO `x2_cityarea` VALUES (632525, '632525', '贵南县', '632500');
INSERT INTO `x2_cityarea` VALUES (632621, '632621', '玛沁县', '632600');
INSERT INTO `x2_cityarea` VALUES (632622, '632622', '班玛县', '632600');
INSERT INTO `x2_cityarea` VALUES (632623, '632623', '甘德县', '632600');
INSERT INTO `x2_cityarea` VALUES (632624, '632624', '达日县', '632600');
INSERT INTO `x2_cityarea` VALUES (632625, '632625', '久治县', '632600');
INSERT INTO `x2_cityarea` VALUES (632626, '632626', '玛多县', '632600');
INSERT INTO `x2_cityarea` VALUES (632721, '632721', '玉树县', '632700');
INSERT INTO `x2_cityarea` VALUES (632722, '632722', '杂多县', '632700');
INSERT INTO `x2_cityarea` VALUES (632723, '632723', '称多县', '632700');
INSERT INTO `x2_cityarea` VALUES (632724, '632724', '治多县', '632700');
INSERT INTO `x2_cityarea` VALUES (632725, '632725', '囊谦县', '632700');
INSERT INTO `x2_cityarea` VALUES (632726, '632726', '曲麻莱县', '632700');
INSERT INTO `x2_cityarea` VALUES (632801, '632801', '格尔木市', '632800');
INSERT INTO `x2_cityarea` VALUES (632802, '632802', '德令哈市', '632800');
INSERT INTO `x2_cityarea` VALUES (632821, '632821', '乌兰县', '632800');
INSERT INTO `x2_cityarea` VALUES (632822, '632822', '都兰县', '632800');
INSERT INTO `x2_cityarea` VALUES (632823, '632823', '天峻县', '632800');
INSERT INTO `x2_cityarea` VALUES (640101, '640101', '市辖区', '640100');
INSERT INTO `x2_cityarea` VALUES (640104, '640104', '兴庆区', '640100');
INSERT INTO `x2_cityarea` VALUES (640105, '640105', '西夏区', '640100');
INSERT INTO `x2_cityarea` VALUES (640106, '640106', '金凤区', '640100');
INSERT INTO `x2_cityarea` VALUES (640121, '640121', '永宁县', '640100');
INSERT INTO `x2_cityarea` VALUES (640122, '640122', '贺兰县', '640100');
INSERT INTO `x2_cityarea` VALUES (640181, '640181', '灵武市', '640100');
INSERT INTO `x2_cityarea` VALUES (640201, '640201', '市辖区', '640200');
INSERT INTO `x2_cityarea` VALUES (640202, '640202', '大武口区', '640200');
INSERT INTO `x2_cityarea` VALUES (640205, '640205', '惠农区', '640200');
INSERT INTO `x2_cityarea` VALUES (640221, '640221', '平罗县', '640200');
INSERT INTO `x2_cityarea` VALUES (640301, '640301', '市辖区', '640300');
INSERT INTO `x2_cityarea` VALUES (640302, '640302', '利通区', '640300');
INSERT INTO `x2_cityarea` VALUES (640323, '640323', '盐池县', '640300');
INSERT INTO `x2_cityarea` VALUES (640324, '640324', '同心县', '640300');
INSERT INTO `x2_cityarea` VALUES (640381, '640381', '青铜峡市', '640300');
INSERT INTO `x2_cityarea` VALUES (640401, '640401', '市辖区', '640400');
INSERT INTO `x2_cityarea` VALUES (640402, '640402', '原州区', '640400');
INSERT INTO `x2_cityarea` VALUES (640422, '640422', '西吉县', '640400');
INSERT INTO `x2_cityarea` VALUES (640423, '640423', '隆德县', '640400');
INSERT INTO `x2_cityarea` VALUES (640424, '640424', '泾源县', '640400');
INSERT INTO `x2_cityarea` VALUES (640425, '640425', '彭阳县', '640400');
INSERT INTO `x2_cityarea` VALUES (640501, '640501', '市辖区', '640500');
INSERT INTO `x2_cityarea` VALUES (640502, '640502', '沙坡头区', '640500');
INSERT INTO `x2_cityarea` VALUES (640521, '640521', '中宁县', '640500');
INSERT INTO `x2_cityarea` VALUES (640522, '640522', '海原县', '640500');
INSERT INTO `x2_cityarea` VALUES (650101, '650101', '市辖区', '650100');
INSERT INTO `x2_cityarea` VALUES (650102, '650102', '天山区', '650100');
INSERT INTO `x2_cityarea` VALUES (650103, '650103', '沙依巴克区', '650100');
INSERT INTO `x2_cityarea` VALUES (650104, '650104', '新市区', '650100');
INSERT INTO `x2_cityarea` VALUES (650105, '650105', '水磨沟区', '650100');
INSERT INTO `x2_cityarea` VALUES (650106, '650106', '头屯河区', '650100');
INSERT INTO `x2_cityarea` VALUES (650107, '650107', '达坂城区', '650100');
INSERT INTO `x2_cityarea` VALUES (650108, '650108', '东山区', '650100');
INSERT INTO `x2_cityarea` VALUES (650121, '650121', '乌鲁木齐县', '650100');
INSERT INTO `x2_cityarea` VALUES (650201, '650201', '市辖区', '650200');
INSERT INTO `x2_cityarea` VALUES (650202, '650202', '独山子区', '650200');
INSERT INTO `x2_cityarea` VALUES (650203, '650203', '克拉玛依区', '650200');
INSERT INTO `x2_cityarea` VALUES (650204, '650204', '白碱滩区', '650200');
INSERT INTO `x2_cityarea` VALUES (650205, '650205', '乌尔禾区', '650200');
INSERT INTO `x2_cityarea` VALUES (652101, '652101', '吐鲁番市', '652100');
INSERT INTO `x2_cityarea` VALUES (652122, '652122', '鄯善县', '652100');
INSERT INTO `x2_cityarea` VALUES (652123, '652123', '托克逊县', '652100');
INSERT INTO `x2_cityarea` VALUES (652201, '652201', '哈密市', '652200');
INSERT INTO `x2_cityarea` VALUES (652222, '652222', '巴里坤哈萨克自治县', '652200');
INSERT INTO `x2_cityarea` VALUES (652223, '652223', '伊吾县', '652200');
INSERT INTO `x2_cityarea` VALUES (652301, '652301', '昌吉市', '652300');
INSERT INTO `x2_cityarea` VALUES (652302, '652302', '阜康市', '652300');
INSERT INTO `x2_cityarea` VALUES (652303, '652303', '米泉市', '652300');
INSERT INTO `x2_cityarea` VALUES (652323, '652323', '呼图壁县', '652300');
INSERT INTO `x2_cityarea` VALUES (652324, '652324', '玛纳斯县', '652300');
INSERT INTO `x2_cityarea` VALUES (652325, '652325', '奇台县', '652300');
INSERT INTO `x2_cityarea` VALUES (652327, '652327', '吉木萨尔县', '652300');
INSERT INTO `x2_cityarea` VALUES (652328, '652328', '木垒哈萨克自治县', '652300');
INSERT INTO `x2_cityarea` VALUES (652701, '652701', '博乐市', '652700');
INSERT INTO `x2_cityarea` VALUES (652722, '652722', '精河县', '652700');
INSERT INTO `x2_cityarea` VALUES (652723, '652723', '温泉县', '652700');
INSERT INTO `x2_cityarea` VALUES (652801, '652801', '库尔勒市', '652800');
INSERT INTO `x2_cityarea` VALUES (652822, '652822', '轮台县', '652800');
INSERT INTO `x2_cityarea` VALUES (652823, '652823', '尉犁县', '652800');
INSERT INTO `x2_cityarea` VALUES (652824, '652824', '若羌县', '652800');
INSERT INTO `x2_cityarea` VALUES (652825, '652825', '且末县', '652800');
INSERT INTO `x2_cityarea` VALUES (652826, '652826', '焉耆回族自治县', '652800');
INSERT INTO `x2_cityarea` VALUES (652827, '652827', '和静县', '652800');
INSERT INTO `x2_cityarea` VALUES (652828, '652828', '和硕县', '652800');
INSERT INTO `x2_cityarea` VALUES (652829, '652829', '博湖县', '652800');
INSERT INTO `x2_cityarea` VALUES (652901, '652901', '阿克苏市', '652900');
INSERT INTO `x2_cityarea` VALUES (652922, '652922', '温宿县', '652900');
INSERT INTO `x2_cityarea` VALUES (652923, '652923', '库车县', '652900');
INSERT INTO `x2_cityarea` VALUES (652924, '652924', '沙雅县', '652900');
INSERT INTO `x2_cityarea` VALUES (652925, '652925', '新和县', '652900');
INSERT INTO `x2_cityarea` VALUES (652926, '652926', '拜城县', '652900');
INSERT INTO `x2_cityarea` VALUES (652927, '652927', '乌什县', '652900');
INSERT INTO `x2_cityarea` VALUES (652928, '652928', '阿瓦提县', '652900');
INSERT INTO `x2_cityarea` VALUES (652929, '652929', '柯坪县', '652900');
INSERT INTO `x2_cityarea` VALUES (653001, '653001', '阿图什市', '653000');
INSERT INTO `x2_cityarea` VALUES (653022, '653022', '阿克陶县', '653000');
INSERT INTO `x2_cityarea` VALUES (653023, '653023', '阿合奇县', '653000');
INSERT INTO `x2_cityarea` VALUES (653024, '653024', '乌恰县', '653000');
INSERT INTO `x2_cityarea` VALUES (653101, '653101', '喀什市', '653100');
INSERT INTO `x2_cityarea` VALUES (653121, '653121', '疏附县', '653100');
INSERT INTO `x2_cityarea` VALUES (653122, '653122', '疏勒县', '653100');
INSERT INTO `x2_cityarea` VALUES (653123, '653123', '英吉沙县', '653100');
INSERT INTO `x2_cityarea` VALUES (653124, '653124', '泽普县', '653100');
INSERT INTO `x2_cityarea` VALUES (653125, '653125', '莎车县', '653100');
INSERT INTO `x2_cityarea` VALUES (653126, '653126', '叶城县', '653100');
INSERT INTO `x2_cityarea` VALUES (653127, '653127', '麦盖提县', '653100');
INSERT INTO `x2_cityarea` VALUES (653128, '653128', '岳普湖县', '653100');
INSERT INTO `x2_cityarea` VALUES (653129, '653129', '伽师县', '653100');
INSERT INTO `x2_cityarea` VALUES (653130, '653130', '巴楚县', '653100');
INSERT INTO `x2_cityarea` VALUES (653131, '653131', '塔什库尔干塔吉克自治县', '653100');
INSERT INTO `x2_cityarea` VALUES (653201, '653201', '和田市', '653200');
INSERT INTO `x2_cityarea` VALUES (653221, '653221', '和田县', '653200');
INSERT INTO `x2_cityarea` VALUES (653222, '653222', '墨玉县', '653200');
INSERT INTO `x2_cityarea` VALUES (653223, '653223', '皮山县', '653200');
INSERT INTO `x2_cityarea` VALUES (653224, '653224', '洛浦县', '653200');
INSERT INTO `x2_cityarea` VALUES (653225, '653225', '策勒县', '653200');
INSERT INTO `x2_cityarea` VALUES (653226, '653226', '于田县', '653200');
INSERT INTO `x2_cityarea` VALUES (653227, '653227', '民丰县', '653200');
INSERT INTO `x2_cityarea` VALUES (654002, '654002', '伊宁市', '654000');
INSERT INTO `x2_cityarea` VALUES (654003, '654003', '奎屯市', '654000');
INSERT INTO `x2_cityarea` VALUES (654021, '654021', '伊宁县', '654000');
INSERT INTO `x2_cityarea` VALUES (654022, '654022', '察布查尔锡伯自治县', '654000');
INSERT INTO `x2_cityarea` VALUES (654023, '654023', '霍城县', '654000');
INSERT INTO `x2_cityarea` VALUES (654024, '654024', '巩留县', '654000');
INSERT INTO `x2_cityarea` VALUES (654025, '654025', '新源县', '654000');
INSERT INTO `x2_cityarea` VALUES (654026, '654026', '昭苏县', '654000');
INSERT INTO `x2_cityarea` VALUES (654027, '654027', '特克斯县', '654000');
INSERT INTO `x2_cityarea` VALUES (654028, '654028', '尼勒克县', '654000');
INSERT INTO `x2_cityarea` VALUES (654201, '654201', '塔城市', '654200');
INSERT INTO `x2_cityarea` VALUES (654202, '654202', '乌苏市', '654200');
INSERT INTO `x2_cityarea` VALUES (654221, '654221', '额敏县', '654200');
INSERT INTO `x2_cityarea` VALUES (654223, '654223', '沙湾县', '654200');
INSERT INTO `x2_cityarea` VALUES (654224, '654224', '托里县', '654200');
INSERT INTO `x2_cityarea` VALUES (654225, '654225', '裕民县', '654200');
INSERT INTO `x2_cityarea` VALUES (654226, '654226', '和布克赛尔蒙古自治县', '654200');
INSERT INTO `x2_cityarea` VALUES (654301, '654301', '阿勒泰市', '654300');
INSERT INTO `x2_cityarea` VALUES (654321, '654321', '布尔津县', '654300');
INSERT INTO `x2_cityarea` VALUES (654322, '654322', '富蕴县', '654300');
INSERT INTO `x2_cityarea` VALUES (654323, '654323', '福海县', '654300');
INSERT INTO `x2_cityarea` VALUES (654324, '654324', '哈巴河县', '654300');
INSERT INTO `x2_cityarea` VALUES (654325, '654325', '青河县', '654300');
INSERT INTO `x2_cityarea` VALUES (654326, '654326', '吉木乃县', '654300');
INSERT INTO `x2_cityarea` VALUES (659001, '659001', '石河子市', '659000');
INSERT INTO `x2_cityarea` VALUES (659002, '659002', '阿拉尔市', '659000');
INSERT INTO `x2_cityarea` VALUES (659003, '659003', '图木舒克市', '659000');
INSERT INTO `x2_cityarea` VALUES (659004, '659004', '五家渠市', '659000');
INSERT INTO `x2_cityarea` VALUES (710101, '710101', '中正区', '710100');
INSERT INTO `x2_cityarea` VALUES (710102, '710102', '大同区', '710100');
INSERT INTO `x2_cityarea` VALUES (710103, '710103', '中山区', '710100');
INSERT INTO `x2_cityarea` VALUES (710104, '710104', '松山区', '710100');
INSERT INTO `x2_cityarea` VALUES (710105, '710105', '大安区', '710100');
INSERT INTO `x2_cityarea` VALUES (710106, '710106', '万华区', '710100');
INSERT INTO `x2_cityarea` VALUES (710107, '710107', '信义区', '710100');
INSERT INTO `x2_cityarea` VALUES (710108, '710108', '士林区', '710100');
INSERT INTO `x2_cityarea` VALUES (710109, '710109', '北投区', '710100');
INSERT INTO `x2_cityarea` VALUES (710110, '710110', '内湖区', '710100');
INSERT INTO `x2_cityarea` VALUES (710111, '710111', '南港区', '710100');
INSERT INTO `x2_cityarea` VALUES (710112, '710112', '文山区', '710100');
INSERT INTO `x2_cityarea` VALUES (710201, '710201', '新兴区', '710200');
INSERT INTO `x2_cityarea` VALUES (710202, '710202', '前金区', '710200');
INSERT INTO `x2_cityarea` VALUES (710203, '710203', '芩雅区', '710200');
INSERT INTO `x2_cityarea` VALUES (710204, '710204', '盐埕区', '710200');
INSERT INTO `x2_cityarea` VALUES (710205, '710205', '鼓山区', '710200');
INSERT INTO `x2_cityarea` VALUES (710206, '710206', '旗津区', '710200');
INSERT INTO `x2_cityarea` VALUES (710207, '710207', '前镇区', '710200');
INSERT INTO `x2_cityarea` VALUES (710208, '710208', '三民区', '710200');
INSERT INTO `x2_cityarea` VALUES (710209, '710209', '左营区', '710200');
INSERT INTO `x2_cityarea` VALUES (710210, '710210', '楠梓区', '710200');
INSERT INTO `x2_cityarea` VALUES (710211, '710211', '小港区', '710200');
INSERT INTO `x2_cityarea` VALUES (710301, '710301', '仁爱区', '710300');
INSERT INTO `x2_cityarea` VALUES (710302, '710302', '信义区', '710300');
INSERT INTO `x2_cityarea` VALUES (710303, '710303', '中正区', '710300');
INSERT INTO `x2_cityarea` VALUES (710304, '710304', '中山区', '710300');
INSERT INTO `x2_cityarea` VALUES (710305, '710305', '安乐区', '710300');
INSERT INTO `x2_cityarea` VALUES (710306, '710306', '暖暖区', '710300');
INSERT INTO `x2_cityarea` VALUES (710307, '710307', '七堵区', '710300');
INSERT INTO `x2_cityarea` VALUES (710401, '710401', '中区', '710400');
INSERT INTO `x2_cityarea` VALUES (710402, '710402', '东区', '710400');
INSERT INTO `x2_cityarea` VALUES (710403, '710403', '南区', '710400');
INSERT INTO `x2_cityarea` VALUES (710404, '710404', '西区', '710400');
INSERT INTO `x2_cityarea` VALUES (710405, '710405', '北区', '710400');
INSERT INTO `x2_cityarea` VALUES (710406, '710406', '北屯区', '710400');
INSERT INTO `x2_cityarea` VALUES (710407, '710407', '西屯区', '710400');
INSERT INTO `x2_cityarea` VALUES (710408, '710408', '南屯区', '710400');
INSERT INTO `x2_cityarea` VALUES (710501, '710501', '中西区', '710500');
INSERT INTO `x2_cityarea` VALUES (710502, '710502', '东区', '710500');
INSERT INTO `x2_cityarea` VALUES (710503, '710503', '南区', '710500');
INSERT INTO `x2_cityarea` VALUES (710504, '710504', '北区', '710500');
INSERT INTO `x2_cityarea` VALUES (710505, '710505', '安平区', '710500');
INSERT INTO `x2_cityarea` VALUES (710506, '710506', '安南区', '710500');
INSERT INTO `x2_cityarea` VALUES (710601, '710601', '东区', '710600');
INSERT INTO `x2_cityarea` VALUES (710602, '710602', '北区', '710600');
INSERT INTO `x2_cityarea` VALUES (710603, '710603', '香山区', '710600');
INSERT INTO `x2_cityarea` VALUES (710701, '710701', '东区', '710700');
INSERT INTO `x2_cityarea` VALUES (710702, '710702', '西区', '710700');
INSERT INTO `x2_cityarea` VALUES (710801, '710801', '县辖区', '710800');
INSERT INTO `x2_cityarea` VALUES (710901, '710901', '县辖区', '710900');
INSERT INTO `x2_cityarea` VALUES (711001, '711001', '县辖区', '711000');
INSERT INTO `x2_cityarea` VALUES (711101, '711101', '县辖区', '711100');
INSERT INTO `x2_cityarea` VALUES (711201, '711201', '县辖区', '711200');
INSERT INTO `x2_cityarea` VALUES (711301, '711301', '县辖区', '711300');
INSERT INTO `x2_cityarea` VALUES (711401, '711401', '县辖区', '711400');
INSERT INTO `x2_cityarea` VALUES (711501, '711501', '县辖区', '711500');
INSERT INTO `x2_cityarea` VALUES (711601, '711601', '县辖区', '711600');
INSERT INTO `x2_cityarea` VALUES (711701, '711701', '县辖区', '711700');
INSERT INTO `x2_cityarea` VALUES (711801, '711801', '县辖区', '711800');
INSERT INTO `x2_cityarea` VALUES (711901, '711901', '县辖区', '711900');
INSERT INTO `x2_cityarea` VALUES (712001, '712001', '县辖区', '712000');
INSERT INTO `x2_cityarea` VALUES (712101, '712101', '县辖区', '712100');
INSERT INTO `x2_cityarea` VALUES (712201, '712201', '县辖区', '712200');
INSERT INTO `x2_cityarea` VALUES (712301, '712301', '县辖区', '712300');
INSERT INTO `x2_cityarea` VALUES (810101, '810101', '香港特别行政区', '810100');
INSERT INTO `x2_cityarea` VALUES (820101, '820101', '澳门特别行政区', '820100');

-- ----------------------------
-- Table structure for x2_comment
-- ----------------------------
DROP TABLE IF EXISTS `x2_comment`;
CREATE TABLE `x2_comment`  (
  `cmtid` int(11) NOT NULL AUTO_INCREMENT,
  `cmtopenid` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `cmtuserid` int(11) NOT NULL,
  `cmtreply` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cmtcontent` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cmttime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cmtid`) USING BTREE,
  INDEX `cmtuserid`(`cmtuserid`) USING BTREE,
  INDEX `cmtapp`(`cmtopenid`, `cmttime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x2_comment
-- ----------------------------
INSERT INTO `x2_comment` VALUES (3, 'openid1234567890', 1, '小白菜真可爱', '我是一个可爱的小白菜', 1479089640);

-- ----------------------------
-- Table structure for x2_config
-- ----------------------------
DROP TABLE IF EXISTS `x2_config`;
CREATE TABLE `x2_config`  (
  `cfgapp` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cfgsetting` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`cfgapp`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x2_consumelog
-- ----------------------------
DROP TABLE IF EXISTS `x2_consumelog`;
CREATE TABLE `x2_consumelog`  (
  `conlid` int(11) NOT NULL AUTO_INCREMENT,
  `conlcost` int(11) NOT NULL,
  `conluserid` int(11) NOT NULL,
  `conlinfo` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `conltype` int(4) NOT NULL,
  `conltime` int(11) NOT NULL,
  PRIMARY KEY (`conlid`) USING BTREE,
  INDEX `conluserid`(`conluserid`, `conltype`, `conltime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x2_consumelog
-- ----------------------------
INSERT INTO `x2_consumelog` VALUES (1, 1, 1, '申请证书会计资格证', 1, 1532680851);
INSERT INTO `x2_consumelog` VALUES (2, 1, 1, '申请证书会计资格证', 1, 1532680857);
INSERT INTO `x2_consumelog` VALUES (3, 1, 1, '申请证书会计资格证', 1, 1532680859);

-- ----------------------------
-- Table structure for x2_content
-- ----------------------------
DROP TABLE IF EXISTS `x2_content`;
CREATE TABLE `x2_content`  (
  `contentid` int(11) NOT NULL AUTO_INCREMENT,
  `contentcatid` int(11) NOT NULL DEFAULT 0,
  `contentmoduleid` int(11) NOT NULL DEFAULT 0,
  `contentuserid` int(11) NOT NULL DEFAULT 0,
  `contentusername` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `contentmodifier` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contenttitle` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `contenttags` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contentkeywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contentthumb` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `contentlink` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `contentinputtime` int(11) NOT NULL DEFAULT 0,
  `contentmodifytime` int(11) NOT NULL DEFAULT 0,
  `contentsequence` int(4) NOT NULL DEFAULT 0,
  `contentdescribe` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contentinfo` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contentstatus` int(2) NOT NULL DEFAULT 0,
  `contenttemplate` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `contenttext` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `news_title` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`contentid`) USING BTREE,
  INDEX `contentuserid`(`contentuserid`, `contentinputtime`, `contentmodifytime`, `contentsequence`) USING BTREE,
  INDEX `contentmoduleid`(`contentmoduleid`) USING BTREE,
  INDEX `contentcatid`(`contentcatid`) USING BTREE,
  INDEX `contentstatus`(`contentstatus`) USING BTREE,
  INDEX `contenttags`(`contenttags`) USING BTREE,
  FULLTEXT INDEX `contentkeywords`(`contentkeywords`)
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x2_content
-- ----------------------------
INSERT INTO `x2_content` VALUES (1, 2, 4, 1, 'peadmin', '', '首页头图', '', '', 'files/attach/images/content/20180727/15326772116755.jpg', '', 1530460518, 0, 0, '', '', 0, 'content_default', '', '');
INSERT INTO `x2_content` VALUES (2, 11, 4, 1, 'peadmin', '', 'phpems@Github', 'phpems', 'phpems', 'app/core/styles/images/noimage.gif', 'https://github.com/oiuv/phpems', 1575186908, 1577625420, 0, '', '', 0, 'content_default', '', '');
INSERT INTO `x2_content` VALUES (3, 3, 4, 1, 'peadmin', '', '教师资格证《综合素质》第一章考点', '综合素质', '教师资格证', 'app/core/styles/images/noimage.gif', '', 1575183639, 1577607553, 0, '《综合素质》是教师资格必考科目，核心内容包括教育观、教育法、职业道德、文化常识及基本能力。', '', 0, 'content_default', '&lt;p&gt;素质教育观的内涵&lt;/p&gt;\r\n\r\n&lt;p&gt;(1)素质教育以提高国民素质为根本宗旨&lt;/p&gt;\r\n\r\n&lt;p&gt;(2)素质教育是面向全体学生的教育&lt;/p&gt;\r\n\r\n&lt;p&gt;(3)素质教育是促进学生全面发展的教育&lt;/p&gt;\r\n\r\n&lt;p&gt;(4)素质教育是促进学生个性发展的教育&lt;/p&gt;\r\n\r\n&lt;p&gt;(5)素质教育是以培养学生的创新精神和实践能力为重点的教育&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;ldquo;以人为本&amp;rdquo;的的学生观&lt;/p&gt;\r\n\r\n&lt;p&gt;学生是发展的人;学生是独特的人;学生是具有独立意义的人。&lt;/p&gt;', '');
INSERT INTO `x2_content` VALUES (4, 1, 4, 1, 'peadmin', '', '教育部公布2020年研考违规违法行为举报电话', '考研', '考研', 'app/core/styles/images/noimage.gif', '', 1575129621, 1577607905, 0, '2020年全国硕士研究生招生考试将于12月21日至23日举行，报考人数341万人。为严厉打击涉考违法活动，严肃考试纪律，维护考生合法权益，现公布2020年全国硕士研究生招生考试违规违法行为举报电话。', '', 0, 'content_default', '&lt;p&gt;2020年全国硕士研究生招生考试将于12月21日至23日举行，报考人数341万人。为严厉打击涉考违法活动，严肃考试纪律，维护考生合法权益，现公布2020年全国硕士研究生招生考试违规违法行为举报电话。&lt;/p&gt;\r\n\r\n&lt;p&gt;近期，各地教育、公安、网信、工信、市场监管等相关部门正联合开展考试环境综合治理。对涉考违法违规活动，有关部门将依法严厉打击，发现一起、查处一起，坚决维护研招考试公平公正。&lt;/p&gt;\r\n\r\n&lt;p&gt;根据2019年9月4日起施行的《最高人民法院、最高人民检察院关于办理组织考试作弊等刑事案件适用法律若干问题的解释》，在研究生招生考试中&amp;ldquo;组织考试作弊&amp;rdquo;&amp;ldquo;非法出售或者提供试题、答案&amp;rdquo;等情形，均应认定为刑法第二百八十四条规定之一的&amp;ldquo;情节严重&amp;rdquo;，将依法从重追究刑事责任。&lt;/p&gt;\r\n\r\n&lt;p&gt;教育部郑重提醒广大考生，要切实增强法制观念，提高法律意识，自觉学法知法、尊法守法，诚信考试，不参与涉考违法犯罪活动，同时，不要听信一些社会培训机构&amp;ldquo;包过&amp;rdquo;&amp;ldquo;保过&amp;rdquo;的虚假宣传，不购买所谓&amp;ldquo;试题&amp;rdquo;&amp;ldquo;答案&amp;rdquo;，谨防受骗。&lt;/p&gt;\r\n\r\n&lt;p&gt;欢迎社会各界和广大考生积极参与监督，共同维护公平公正的考试环境。&lt;/p&gt;', '');
INSERT INTO `x2_content` VALUES (5, 14, 4, 1, 'peadmin', '', 'phpems 6.0发布', 'phpems', 'phpems', 'files/public/img/banner.jpg', '', 1575129614, 1577686741, 0, '免费开源的考试系统', '', 0, 'content_default', '&lt;h3&gt;说明&lt;/h3&gt;\r\n\r\n&lt;p&gt;PHPEMS属于开源免费程序，开发者为火眼，您可以自由修改其中属于PHPEMS原创部分的代码，原则上您只要不通过出售PHPEMS相关源代码盈利，即可免费使用本软件。&lt;/p&gt;\r\n\r\n&lt;p&gt;本版本在官方原始6.0版本(20190925)基础上优化，重点修复BUG(包括所有非 E_NOTICE 级别错误提示)，并根据需要优化新增一些功能。&lt;/p&gt;\r\n\r\n&lt;p&gt;如果要使用旧版本请参考 &lt;a href=&quot;https://github.com/oiuv/phpems/tree/5.0&quot;&gt;PHPEMS v5.0&lt;/a&gt;（演示地址：&lt;a href=&quot;https://phpems5.is.js.cn/&quot;&gt;https://phpems5.is.js.cn/&lt;/a&gt;）&lt;/p&gt;\r\n\r\n&lt;h3&gt;优化&amp;amp;新增功能&lt;/h3&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;新增使用composer，可直接安装第三方扩展包&lt;/li&gt;\r\n	&lt;li&gt;为所有数据表定义&amp;nbsp;&lt;a href=&quot;https://learnku.com/docs/laravel/5.8/eloquent/3931&quot; rel=&quot;nofollow&quot;&gt;Model&lt;/a&gt;&amp;nbsp;，数据库操作更灵活方便&lt;/li&gt;\r\n	&lt;li&gt;可在线&lt;a href=&quot;https://learnku.com/docs/laravel/5.8/migrations/3928&quot; rel=&quot;nofollow&quot;&gt;数据库迁移&lt;/a&gt;，请参考&amp;nbsp;&lt;code&gt;tasks&lt;/code&gt;&amp;nbsp;目录下&amp;nbsp;&lt;code&gt;Database.php&lt;/code&gt;&lt;/li&gt;\r\n	&lt;li&gt;新增部分字符串和数组&lt;a href=&quot;https://learnku.com/docs/laravel/5.8/helpers/3919&quot; rel=&quot;nofollow&quot;&gt;辅助函数&lt;/a&gt;，如：dd()&lt;/li&gt;\r\n	&lt;li&gt;新增 Redis 缓存支持，请参考&amp;nbsp;&lt;code&gt;tasks&lt;/code&gt;&amp;nbsp;目录中的&amp;nbsp;&lt;code&gt;Cache.php&lt;/code&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;使用 ORM 操作数据库示例：&lt;/p&gt;\r\n\r\n&lt;pre&gt;\r\n// 获取userid为1的用户\r\n$user = \\\\Model\\\\User::find(1);\r\n\r\n// 获取用户名\r\necho $user-&amp;gt;username;\r\n\r\n// 调试输出用户所有信息\r\ndd($user-&amp;gt;getAttributes());\r\n\r\n// 获取用户的考试记录\r\n$eh = $user-&amp;gt;examHistories;\r\nforeach ($eh as $result){\r\n    print_r($result-&amp;gt;getAttributes());\r\n}\r\n\r\n// 获取用户开通的考场\r\n$ob = $use-&amp;gt;basics;\r\nforeach($ob as $basic)\r\n{\r\n    // 考场信息\r\n    print_r($basic-&amp;gt;getAttributes());\r\n    // 开通时间等信息\r\n    print_r($basic-&amp;gt;pivot-&amp;gt;getAttributes());\r\n}\r\n\r\n// 获取basicid为1的考场\r\n$basic = \\\\Model\\\\Basic::find(1);\r\n\r\n// 获取考场考试科目信息\r\nprint_r($basic-&amp;gt;subject-&amp;gt;getAttributes());\r\n\r\n// 获取考场的考试记录\r\n$eh = $basic-&amp;gt;examHistories;\r\nforeach ($eh as $result){\r\n    print_r($result-&amp;gt;getAttributes());\r\n}\r\n\r\n// 获取开通考场的用户\r\n$ou = $basic-&amp;gt;users;\r\nforeach($ou as $user)\r\n{\r\n    // 用户信息\r\n    print_r($user-&amp;gt;getAttributes());\r\n    // 开通时间等信息\r\n    print_r($user-&amp;gt;pivot-&amp;gt;getAttributes());\r\n}\r\n\r\n// 更多方法参考 model 目录&lt;/pre&gt;\r\n\r\n&lt;p&gt;使用 Redis 缓存数据库示例：&lt;/p&gt;\r\n\r\n&lt;pre&gt;\r\n$client = new Predis\\\\Client(&amp;#39;tcp://127.0.0.1:6379&amp;#39;);\r\n$client-&amp;gt;set(&amp;#39;phpems:questions&amp;#39;, json_encode(Cache::questions()));\r\n$client-&amp;gt;set(&amp;#39;phpems:knows&amp;#39;, json_encode(Cache::knows()));&lt;/pre&gt;\r\n\r\n&lt;h3&gt;安装&lt;/h3&gt;\r\n\r\n&lt;h4&gt;方式1：使用 composer 创建项目&lt;/h4&gt;\r\n\r\n&lt;p&gt;通过&amp;nbsp;&lt;a href=&quot;https://getcomposer.org/&quot; rel=&quot;nofollow noindex noopener external&quot;&gt;composer&lt;/a&gt;&amp;nbsp;指令直接创建项目&lt;/p&gt;\r\n\r\n&lt;pre&gt;\r\n&lt;code&gt;composer create-project --prefer-dist phpems/phpems phpems\r\n&lt;/code&gt;&lt;/pre&gt;\r\n\r\n&lt;p&gt;如果要安装 v5.0 版本，请使用以下指令：&lt;/p&gt;\r\n\r\n&lt;pre&gt;\r\n&lt;code&gt;composer create-project --prefer-dist phpems/phpems phpems &amp;quot;5.*&amp;quot;\r\n&lt;/code&gt;&lt;/pre&gt;\r\n\r\n&lt;h4&gt;方式2：使用 git 创建项目&lt;/h4&gt;\r\n\r\n&lt;p&gt;使用 git 复制项目后使用 composer 安装依赖&lt;/p&gt;\r\n\r\n&lt;pre&gt;\r\n&lt;code&gt;git clone https://github.com/oiuv/phpems.git\r\ncd phpems &amp;amp;&amp;amp; composer install\r\ncd lib &amp;amp;&amp;amp; cp config.inc.example.php config.inc.php\r\n&lt;/code&gt;&lt;/pre&gt;\r\n\r\n&lt;h3&gt;配置&lt;/h3&gt;\r\n\r\n&lt;p&gt;安装完成后，根据需要修改 lib 目录下的&amp;nbsp;&lt;code&gt;config.inc.php&lt;/code&gt;&amp;nbsp;文件，配置数据库，然后使用&amp;nbsp;&lt;code&gt;tasks&lt;/code&gt;&amp;nbsp;目录下的数据库文件&amp;nbsp;&lt;code&gt;phpems.sql&lt;/code&gt;&amp;nbsp;创建数据库，项目上线后务必删除&amp;nbsp;&lt;code&gt;tasks&lt;/code&gt;&amp;nbsp;目录。&lt;/p&gt;\r\n\r\n&lt;p&gt;如果是 phpems v5.0 版本升级，请使用&amp;nbsp;&lt;code&gt;tasks&lt;/code&gt;&amp;nbsp;目录下的&amp;nbsp;&lt;code&gt;v5v6.sql&lt;/code&gt;&amp;nbsp;升级数据库。&lt;/p&gt;\r\n\r\n&lt;p&gt;如果是 linux 系统，需要保证&amp;nbsp;&lt;code&gt;data&lt;/code&gt;&amp;nbsp;目录具有可写权限，否则网站无法正常访问。&lt;/p&gt;\r\n\r\n&lt;p&gt;默认管理员账号：peadmin，密码：peadmin&lt;/p&gt;\r\n\r\n&lt;p&gt;源码默认关闭错误提示，如需调试请修改&amp;nbsp;&lt;code&gt;config.inc.php&lt;/code&gt;&amp;nbsp;中&amp;nbsp;&lt;code&gt;DEBUG&lt;/code&gt;&amp;nbsp;为&amp;nbsp;&lt;code&gt;true&lt;/code&gt;。&lt;/p&gt;\r\n\r\n&lt;blockquote&gt;提示：如果有任何安装问题或BUG反馈，请联系QQ（7300637）。&lt;/blockquote&gt;', '');

-- ----------------------------
-- Table structure for x2_coupon
-- ----------------------------
DROP TABLE IF EXISTS `x2_coupon`;
CREATE TABLE `x2_coupon`  (
  `couponsn` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `couponvalue` int(11) NOT NULL DEFAULT 0,
  `couponstatus` int(1) NOT NULL DEFAULT 0,
  `couponaddtime` int(11) NOT NULL DEFAULT 0,
  `couponendtime` int(11) NOT NULL DEFAULT 0,
  `couponusername` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `couponusetime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`couponsn`) USING BTREE,
  INDEX `couponstatus`(`couponstatus`, `couponendtime`) USING BTREE,
  INDEX `couponaddtime`(`couponaddtime`) USING BTREE,
  INDEX `couponusername`(`couponusername`) USING BTREE,
  INDEX `couponusetime`(`couponusetime`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x2_course
-- ----------------------------
DROP TABLE IF EXISTS `x2_course`;
CREATE TABLE `x2_course`  (
  `courseid` int(11) NOT NULL AUTO_INCREMENT,
  `coursetitle` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `coursemoduleid` int(11) NULL DEFAULT NULL,
  `coursecsid` int(11) NULL DEFAULT NULL,
  `coursethumb` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `courseuserid` int(11) NULL DEFAULT NULL,
  `courseinputtime` int(11) NULL DEFAULT NULL,
  `coursemodifytime` int(11) NULL DEFAULT NULL,
  `coursesequence` int(11) NULL DEFAULT NULL,
  `coursedescribe` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `course_files` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_oggfile` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_webmfile` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_youtu` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pdf_file` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `coursepasstime` int(11) NOT NULL,
  PRIMARY KEY (`courseid`) USING BTREE,
  INDEX `coursecsid`(`coursecsid`, `courseuserid`, `courseinputtime`, `coursemodifytime`, `coursesequence`) USING BTREE,
  INDEX `coursemoduleid`(`coursemoduleid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x2_course
-- ----------------------------
INSERT INTO `x2_course` VALUES (1, '了断', 14, 1, 'app/core/styles/images/noimage.gif', 1, 1577596711, 0, 0, '&lt;p&gt;当联盟士兵与萨鲁法尔大王的反抗军一同对抗女妖之王时，战争在奥格瑞玛的大门前走向最后的高潮。&lt;/p&gt;', 'https://blz-videos.nosdn.127.net/1/World%20of%20Warcraft/Saurfangs_Decision_zhCN.mp4', '', '', '', '', 0);
INSERT INTO `x2_course` VALUES (2, '避风港', 14, 1, 'app/core/styles/images/noimage.gif', 1, 1577597630, 0, 0, '&lt;p&gt;瓦罗克&amp;middot;萨鲁法尔意识到，要想捍卫部落的未来，就必须去寻找部落曾经的领袖。&lt;/p&gt;', 'https://blz-videos.nosdn.127.net/1/World%20of%20Warcraft/wx8b.mp4', '', '', '', '', 0);
INSERT INTO `x2_course` VALUES (3, '黑海岸', 14, 1, 'app/core/styles/images/noimage.gif', 1, 1577597679, 0, 0, '&lt;p&gt;唯一的巨魔生还者向纳萨诺斯&amp;middot;凋零者讲述了一个可怕的故事：他的物资运输队伍被难以言喻的自然之力袭击了。&lt;/p&gt;', 'https://blz-videos.nosdn.127.net/1/World%20of%20Warcraft/157c165f1938fda17911ab782d127613td.mp4', '', '', '', '', 0);
INSERT INTO `x2_course` VALUES (4, '老兵', 14, 1, 'app/core/styles/images/noimage.gif', 1, 1577597739, 0, 0, '&lt;p&gt;战争的怒火席卷了整个艾泽拉斯，但部落的传奇战士瓦罗克&amp;middot;萨鲁法尔却并不想加入战斗。在经历了一辈子的戎马生涯后，他所有亲近的人都已在战火中逝去，甚至包括他的爱子。在这场足以决定部落命运的战争的前夜，这名老兵必须做出选择：是否要永远放下他手中的战斧。&lt;/p&gt;', 'https://blz-videos.nosdn.127.net/1/World%20of%20Warcraft/WOW_SAURFANG_zhCN_0803CJ.mp4', '', '', '', '', 0);
INSERT INTO `x2_course` VALUES (5, '失落的荣耀', 14, 1, 'app/core/styles/images/noimage.gif', 1, 1577597797, 0, 0, '&lt;p&gt;在洛丹伦一役之后，萨鲁法尔大王被俘并被关进了暴风城监狱。安度因&amp;middot;乌瑞恩前去探视这位老将，希望摸清部落的阴谋。&lt;/p&gt;', 'https://blz-videos.nosdn.127.net/1/World%20of%20Warcraft/5f227269c9a23789cf1f0ad414554981lon.mp4', '', '', '', '', 0);
INSERT INTO `x2_course` VALUES (6, '争霸艾泽拉斯', 14, 1, 'app/core/styles/images/noimage.gif', 1, 1577601158, 0, 0, '', 'https://flv2.bn.netease.com/videolib3/1711/04/uwieG3913/HD/uwieG3913-mobile.mp4', '', '', '', '', 0);

-- ----------------------------
-- Table structure for x2_coursesubject
-- ----------------------------
DROP TABLE IF EXISTS `x2_coursesubject`;
CREATE TABLE `x2_coursesubject`  (
  `csid` int(11) NOT NULL AUTO_INCREMENT,
  `cstitle` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cscatid` int(11) NULL DEFAULT NULL,
  `csuserid` int(11) NULL DEFAULT 0,
  `csbasicid` int(11) NULL DEFAULT 0,
  `cssubjectid` int(11) NULL DEFAULT 0,
  `cstime` int(11) NULL DEFAULT 0,
  `csthumb` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cssequence` int(11) NULL DEFAULT NULL,
  `csdescribe` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `csdemo` tinyint(1) NULL DEFAULT NULL,
  `csprice` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `cstype` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`csid`) USING BTREE,
  INDEX `csbasicid`(`csbasicid`, `cssubjectid`, `cstime`) USING BTREE,
  INDEX `cscatid`(`cscatid`) USING BTREE,
  INDEX `cuserid`(`csuserid`) USING BTREE,
  INDEX `cssequence`(`cssequence`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x2_coursesubject
-- ----------------------------
INSERT INTO `x2_coursesubject` VALUES (1, '剧情故事', 5, 1, 2, 2, 1577596561, 'app/core/styles/images/noimage.gif', 0, '魔兽世界剧情动画', 1, '', 0);

-- ----------------------------
-- Table structure for x2_docfloder
-- ----------------------------
DROP TABLE IF EXISTS `x2_docfloder`;
CREATE TABLE `x2_docfloder`  (
  `dfid` int(11) NOT NULL AUTO_INCREMENT,
  `dftitle` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dfcatid` int(11) NULL DEFAULT NULL,
  `dfthumb` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dftime` int(11) NOT NULL,
  `dfdecrbie` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`dfid`) USING BTREE,
  INDEX `dfcatid`(`dfcatid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x2_dochistory
-- ----------------------------
DROP TABLE IF EXISTS `x2_dochistory`;
CREATE TABLE `x2_dochistory`  (
  `dhid` int(11) NOT NULL AUTO_INCREMENT,
  `dhdocid` int(11) NULL DEFAULT NULL,
  `dhtitle` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dhcontent` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dhtime` int(11) NOT NULL,
  `dhusername` varchar(72) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dhstatus` tinyint(4) NOT NULL,
  `dhtop` tinyint(4) NOT NULL,
  PRIMARY KEY (`dhid`) USING BTREE,
  INDEX `dhtime`(`dhtime`) USING BTREE,
  INDEX `dhstatus`(`dhstatus`) USING BTREE,
  INDEX `dhtop`(`dhtop`) USING BTREE,
  INDEX `dhdocid`(`dhdocid`) USING BTREE,
  INDEX `dhusername`(`dhusername`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x2_docs
-- ----------------------------
DROP TABLE IF EXISTS `x2_docs`;
CREATE TABLE `x2_docs`  (
  `docid` int(11) NOT NULL AUTO_INCREMENT,
  `doctitle` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `docthumb` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `doccatid` int(11) NOT NULL,
  `dockeywords` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `doccontentid` int(11) NOT NULL,
  `docinputtime` int(11) NOT NULL,
  `docmodifytime` int(11) NOT NULL,
  `docsequence` int(11) NULL DEFAULT NULL,
  `docdescribe` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `doclocker` varchar(72) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `doclocktime` int(11) NULL DEFAULT NULL,
  `docneedmore` int(1) NULL DEFAULT NULL,
  `docsyslock` tinyint(1) NULL DEFAULT NULL,
  `docistop` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`docid`) USING BTREE,
  INDEX `doctitle`(`doctitle`) USING BTREE,
  INDEX `doccatid`(`doccatid`) USING BTREE,
  INDEX `doccontentid`(`doccontentid`) USING BTREE,
  INDEX `docinputtime`(`docinputtime`) USING BTREE,
  INDEX `docmodifytime`(`docmodifytime`) USING BTREE,
  INDEX `doclocker`(`doclocker`) USING BTREE,
  INDEX `doclocktime`(`doclocktime`) USING BTREE,
  INDEX `docsyslock`(`docsyslock`) USING BTREE,
  INDEX `docsequence`(`docsequence`) USING BTREE,
  INDEX `docistop`(`docistop`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x2_examhistory
-- ----------------------------
DROP TABLE IF EXISTS `x2_examhistory`;
CREATE TABLE `x2_examhistory`  (
  `ehid` int(11) NOT NULL AUTO_INCREMENT,
  `ehexamid` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `ehexam` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `ehtype` int(11) NOT NULL DEFAULT 0,
  `ehbasicid` int(11) NOT NULL DEFAULT 0,
  `ehquestion` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ehsetting` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ehscorelist` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ehuseranswer` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ehtime` int(11) NOT NULL DEFAULT 0,
  `ehscore` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `ehuserid` int(11) NOT NULL DEFAULT 0,
  `ehusername` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `ehstarttime` int(11) NOT NULL DEFAULT 0,
  `ehendtime` int(11) NOT NULL,
  `ehstatus` int(1) NOT NULL DEFAULT 1,
  `ehdecide` int(1) NOT NULL DEFAULT 0,
  `ehtimelist` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ehopenid` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ehneedresit` tinyint(1) NOT NULL,
  `ehispass` tinyint(1) NULL DEFAULT NULL,
  `ehteacher` varchar(72) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ehdecidetime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ehid`) USING BTREE,
  INDEX `ehtype`(`ehtype`, `ehbasicid`, `ehtime`, `ehuserid`) USING BTREE,
  INDEX `ehdecide`(`ehdecide`) USING BTREE,
  INDEX `ehexamid`(`ehexamid`) USING BTREE,
  INDEX `examopenid`(`ehopenid`) USING BTREE,
  INDEX `ehneedresit`(`ehneedresit`) USING BTREE,
  INDEX `ehispass`(`ehispass`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x2_exams
-- ----------------------------
DROP TABLE IF EXISTS `x2_exams`;
CREATE TABLE `x2_exams`  (
  `examid` int(11) NOT NULL AUTO_INCREMENT,
  `examsubject` int(11) NOT NULL DEFAULT 0,
  `exam` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `examsetting` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `examquestions` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `examscore` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `examstatus` int(1) NOT NULL DEFAULT 0,
  `examtype` int(11) NOT NULL DEFAULT 0,
  `examauthorid` int(11) NOT NULL DEFAULT 0,
  `examauthor` varchar(120) CHARACTER SET utf8 COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `examtime` int(11) NOT NULL DEFAULT 0,
  `examkeyword` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `examdecide` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`examid`) USING BTREE,
  INDEX `examstatus`(`examstatus`) USING BTREE,
  INDEX `examtype`(`examtype`, `examauthorid`) USING BTREE,
  INDEX `examtime`(`examtime`) USING BTREE,
  INDEX `examsubject`(`examsubject`) USING BTREE,
  INDEX `examdecide`(`examdecide`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x2_exams
-- ----------------------------
INSERT INTO `x2_exams` VALUES (1, 1, '中国近现代史纲要试卷', 'a:7:{s:8:\"examtime\";s:2:\"90\";s:7:\"comfrom\";s:0:\"\";s:5:\"score\";s:3:\"100\";s:9:\"passscore\";s:2:\"60\";s:12:\"questypelite\";a:6:{i:1;s:1:\"1\";i:2;s:1:\"0\";i:3;s:1:\"0\";i:4;s:1:\"0\";i:5;s:1:\"0\";i:6;s:1:\"0\";}s:10:\"scalemodel\";s:1:\"0\";s:8:\"questype\";a:1:{i:1;a:6:{s:6:\"number\";s:2:\"50\";s:5:\"score\";s:1:\"2\";s:8:\"describe\";s:147:\"：本大题共50小题，每小题2分，共100分。在每小题列出的备选项中只有一项是最符合题目要求的，请将其选出。\";s:10:\"easynumber\";s:2:\"25\";s:12:\"middlenumber\";s:2:\"70\";s:10:\"hardnumber\";s:1:\"5\";}}}', '', '', 0, 1, 1, 'peadmin', 1532691442, '', 0);

-- ----------------------------
-- Table structure for x2_examsession
-- ----------------------------
DROP TABLE IF EXISTS `x2_examsession`;
CREATE TABLE `x2_examsession`  (
  `examsessionid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `examsessionuserid` int(11) NOT NULL DEFAULT 0,
  `examsession` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `examsessionsetting` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `examsessionsign` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `examsessionbasic` int(11) NOT NULL DEFAULT 0,
  `examsessiontype` int(1) NOT NULL,
  `examsessionkey` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `examsessionquestion` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `examsessionuseranswer` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `examsessionstarttime` int(11) NOT NULL DEFAULT 0,
  `examsessiontime` int(11) NOT NULL DEFAULT 0,
  `examsessionstatus` int(1) NOT NULL DEFAULT 0,
  `examsessionscore` decimal(10, 1) NOT NULL DEFAULT 0.0,
  `examsessionscorelist` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `examsessionissave` int(1) NOT NULL DEFAULT 0,
  `examsessiontimelist` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `examsessiontoken` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`examsessionid`) USING BTREE,
  INDEX `examsessionstarttime`(`examsessionstarttime`) USING BTREE,
  INDEX `examsessionstatus`(`examsessionstatus`) USING BTREE,
  INDEX `examsessiontype`(`examsessiontype`) USING BTREE,
  INDEX `examsessionkey`(`examsessionkey`) USING BTREE,
  INDEX `examsubject`(`examsessionbasic`) USING BTREE,
  INDEX `examsessionissave`(`examsessionissave`) USING BTREE,
  INDEX `examsessionuserid`(`examsessionuserid`) USING BTREE,
  INDEX `examsessiontoken`(`examsessiontoken`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x2_exercise
-- ----------------------------
DROP TABLE IF EXISTS `x2_exercise`;
CREATE TABLE `x2_exercise`  (
  `exerid` int(11) NOT NULL AUTO_INCREMENT,
  `exeruserid` int(11) NOT NULL,
  `exerbasicid` int(11) NOT NULL,
  `exerknowsid` int(11) NOT NULL,
  `exernumber` int(11) NOT NULL,
  `exerqutype` int(11) NOT NULL,
  PRIMARY KEY (`exerid`) USING BTREE,
  INDEX `exeruserid`(`exeruserid`) USING BTREE,
  INDEX `exerbasicid`(`exerbasicid`) USING BTREE,
  INDEX `exerknowsid`(`exerknowsid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of x2_exercise
-- ----------------------------
INSERT INTO `x2_exercise` VALUES (1, 0, 0, 0, 0, 0);
INSERT INTO `x2_exercise` VALUES (2, 1, 1, 1, 10, 0);
INSERT INTO `x2_exercise` VALUES (3, 0, 0, 0, 0, 0);
INSERT INTO `x2_exercise` VALUES (4, 0, 0, 0, 0, 0);
INSERT INTO `x2_exercise` VALUES (5, 0, 0, 0, 0, 0);
INSERT INTO `x2_exercise` VALUES (6, 1, 1, 2, 6, 0);
INSERT INTO `x2_exercise` VALUES (7, 0, 0, 0, 0, 0);
INSERT INTO `x2_exercise` VALUES (8, 0, 0, 0, 0, 0);
INSERT INTO `x2_exercise` VALUES (9, 0, 0, 0, 0, 0);
INSERT INTO `x2_exercise` VALUES (10, 0, 0, 0, 0, 0);
INSERT INTO `x2_exercise` VALUES (11, 0, 0, 0, 0, 0);
INSERT INTO `x2_exercise` VALUES (12, 0, 0, 0, 0, 0);
INSERT INTO `x2_exercise` VALUES (13, 0, 0, 0, 0, 0);
INSERT INTO `x2_exercise` VALUES (14, 0, 0, 0, 0, 0);
INSERT INTO `x2_exercise` VALUES (15, 0, 0, 0, 0, 0);
INSERT INTO `x2_exercise` VALUES (16, 1, 1, 5, 2, 0);
INSERT INTO `x2_exercise` VALUES (17, 0, 0, 0, 0, 0);
INSERT INTO `x2_exercise` VALUES (18, 0, 0, 0, 0, 0);
INSERT INTO `x2_exercise` VALUES (19, 1, 1, 7, 2, 0);
INSERT INTO `x2_exercise` VALUES (20, 0, 0, 0, 0, 0);
INSERT INTO `x2_exercise` VALUES (21, 1, 1, 3, 7, 0);

-- ----------------------------
-- Table structure for x2_favor
-- ----------------------------
DROP TABLE IF EXISTS `x2_favor`;
CREATE TABLE `x2_favor`  (
  `favorid` int(11) NOT NULL AUTO_INCREMENT,
  `favoruserid` int(11) NOT NULL DEFAULT 0,
  `favorsubjectid` int(11) NOT NULL DEFAULT 0,
  `favorquestionid` int(11) NOT NULL DEFAULT 0,
  `favortime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`favorid`) USING BTREE,
  INDEX `favoruserid`(`favoruserid`, `favorquestionid`, `favortime`) USING BTREE,
  INDEX `favorsubjectid`(`favorsubjectid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of x2_favor
-- ----------------------------
INSERT INTO `x2_favor` VALUES (1, 1, 1, 13, 1577442977);

-- ----------------------------
-- Table structure for x2_feedback
-- ----------------------------
DROP TABLE IF EXISTS `x2_feedback`;
CREATE TABLE `x2_feedback`  (
  `fbid` int(11) NOT NULL AUTO_INCREMENT,
  `fbquestionid` int(11) NOT NULL,
  `fbtype` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fbcontent` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fbuserid` int(11) NOT NULL,
  `fbtime` int(11) NOT NULL,
  `fbstatus` tinyint(4) NOT NULL,
  `fbdoneuserid` int(11) NOT NULL,
  `fbdonetime` int(11) NOT NULL,
  PRIMARY KEY (`fbid`) USING BTREE,
  INDEX `fbquestionid`(`fbquestionid`, `fbuserid`) USING BTREE,
  INDEX `fbtype`(`fbtype`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x2_gbook
-- ----------------------------
DROP TABLE IF EXISTS `x2_gbook`;
CREATE TABLE `x2_gbook`  (
  `gbid` int(11) NOT NULL AUTO_INCREMENT,
  `gbinfo` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gbcontent` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gbreply` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gbtime` int(11) NOT NULL DEFAULT 0,
  `gbreplytime` int(11) NOT NULL DEFAULT 0,
  `gbstatus` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`gbid`) USING BTREE,
  INDEX `gbtime`(`gbtime`) USING BTREE,
  INDEX `gbreplytime`(`gbreplytime`) USING BTREE,
  INDEX `gbstatus`(`gbstatus`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x2_knows
-- ----------------------------
DROP TABLE IF EXISTS `x2_knows`;
CREATE TABLE `x2_knows`  (
  `knowsid` int(11) NOT NULL AUTO_INCREMENT,
  `knows` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `knowssectionid` int(11) NOT NULL DEFAULT 0,
  `knowsdescribe` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `knowsstatus` int(1) NOT NULL DEFAULT 1,
  `knowssequence` int(11) NOT NULL,
  `knowsnumber` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `knowsquestions` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`knowsid`) USING BTREE,
  INDEX `knows`(`knows`, `knowssectionid`) USING BTREE,
  INDEX `knowsstatus`(`knowsstatus`) USING BTREE,
  INDEX `knowssequence`(`knowssequence`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x2_knows
-- ----------------------------
INSERT INTO `x2_knows` VALUES (1, '第一节 鸦片战争前的中国和世界', 1, '', 1, 0, 'a:1:{i:1;i:10;}', 'a:1:{i:1;a:10:{i:0;s:3:\"149\";i:1;s:3:\"150\";i:2;s:3:\"151\";i:3;s:3:\"152\";i:4;s:3:\"153\";i:5;s:3:\"154\";i:6;s:3:\"155\";i:7;s:3:\"156\";i:8;s:3:\"169\";i:9;s:3:\"353\";}}');
INSERT INTO `x2_knows` VALUES (2, '第二节 资本—帝国主义对中国的侵略及近代中国社会的演变', 1, '', 1, 0, 'a:1:{i:1;i:37;}', 'a:1:{i:1;a:37:{i:0;s:1:\"5\";i:1;s:2:\"12\";i:2;s:3:\"140\";i:3;s:3:\"157\";i:4;s:3:\"158\";i:5;s:3:\"159\";i:6;s:3:\"160\";i:7;s:3:\"161\";i:8;s:3:\"162\";i:9;s:3:\"163\";i:10;s:3:\"164\";i:11;s:3:\"165\";i:12;s:3:\"354\";i:13;s:3:\"355\";i:14;s:3:\"356\";i:15;s:3:\"357\";i:16;s:3:\"358\";i:17;s:3:\"359\";i:18;s:3:\"360\";i:19;s:3:\"361\";i:20;s:3:\"362\";i:21;s:3:\"363\";i:22;s:3:\"364\";i:23;s:3:\"365\";i:24;s:3:\"366\";i:25;s:3:\"367\";i:26;s:3:\"368\";i:27;s:3:\"369\";i:28;s:3:\"370\";i:29;s:3:\"371\";i:30;s:3:\"372\";i:31;s:3:\"373\";i:32;s:3:\"374\";i:33;s:3:\"375\";i:34;s:3:\"376\";i:35;s:3:\"377\";i:36;s:3:\"378\";}}');
INSERT INTO `x2_knows` VALUES (3, '第三节 抵御外来侵略、争取民族独立的斗争', 1, '', 1, 0, 'a:1:{i:1;i:17;}', 'a:1:{i:1;a:17:{i:0;s:2:\"13\";i:1;s:2:\"52\";i:2;s:2:\"96\";i:3;s:3:\"135\";i:4;s:3:\"138\";i:5;s:3:\"166\";i:6;s:3:\"167\";i:7;s:3:\"168\";i:8;s:3:\"379\";i:9;s:3:\"380\";i:10;s:3:\"381\";i:11;s:3:\"382\";i:12;s:3:\"383\";i:13;s:3:\"384\";i:14;s:3:\"385\";i:15;s:3:\"386\";i:16;s:3:\"387\";}}');
INSERT INTO `x2_knows` VALUES (4, '第一节 农民群众斗争风暴的起落', 2, '', 1, 0, 'a:1:{i:1;i:13;}', 'a:1:{i:1;a:13:{i:0;s:1:\"1\";i:1;s:2:\"14\";i:2;s:3:\"119\";i:3;s:3:\"120\";i:4;s:3:\"121\";i:5;s:3:\"170\";i:6;s:3:\"171\";i:7;s:3:\"172\";i:8;s:3:\"388\";i:9;s:3:\"389\";i:10;s:3:\"390\";i:11;s:3:\"391\";i:12;s:3:\"392\";}}');
INSERT INTO `x2_knows` VALUES (5, '第二节 地主阶级统治集团“自救”活动的兴衰', 2, '', 1, 0, 'a:1:{i:1;i:17;}', 'a:1:{i:1;a:17:{i:0;s:2:\"15\";i:1;s:2:\"53\";i:2;s:2:\"95\";i:3;s:3:\"105\";i:4;s:3:\"133\";i:5;s:3:\"146\";i:6;s:3:\"173\";i:7;s:3:\"174\";i:8;s:3:\"175\";i:9;s:3:\"176\";i:10;s:3:\"177\";i:11;s:3:\"393\";i:12;s:3:\"394\";i:13;s:3:\"395\";i:14;s:3:\"396\";i:15;s:3:\"397\";i:16;s:3:\"398\";}}');
INSERT INTO `x2_knows` VALUES (6, '第三节 维新运动的兴起和夭折', 2, '', 1, 0, 'a:1:{i:1;i:17;}', 'a:1:{i:1;a:17:{i:0;s:2:\"55\";i:1;s:3:\"109\";i:2;s:3:\"126\";i:3;s:3:\"127\";i:4;s:3:\"139\";i:5;s:3:\"178\";i:6;s:3:\"179\";i:7;s:3:\"180\";i:8;s:3:\"181\";i:9;s:3:\"182\";i:10;s:3:\"183\";i:11;s:3:\"184\";i:12;s:3:\"185\";i:13;s:3:\"399\";i:14;s:3:\"400\";i:15;s:3:\"401\";i:16;s:3:\"402\";}}');
INSERT INTO `x2_knows` VALUES (7, '第一节 举起近代民族民主革命的旗帜', 3, '', 1, 0, 'a:1:{i:1;i:20;}', 'a:1:{i:1;a:20:{i:0;s:2:\"16\";i:1;s:2:\"54\";i:2;s:2:\"99\";i:3;s:3:\"100\";i:4;s:3:\"103\";i:5;s:3:\"111\";i:6;s:3:\"118\";i:7;s:3:\"148\";i:8;s:3:\"186\";i:9;s:3:\"187\";i:10;s:3:\"188\";i:11;s:3:\"189\";i:12;s:3:\"190\";i:13;s:3:\"191\";i:14;s:3:\"192\";i:15;s:3:\"403\";i:16;s:3:\"404\";i:17;s:3:\"405\";i:18;s:3:\"406\";i:19;s:3:\"407\";}}');
INSERT INTO `x2_knows` VALUES (8, '第二节 辛亥革命的胜利与失败', 3, '', 1, 0, 'a:1:{i:1;i:25;}', 'a:1:{i:1;a:25:{i:0;s:1:\"6\";i:1;s:2:\"17\";i:2;s:2:\"18\";i:3;s:2:\"51\";i:4;s:2:\"56\";i:5;s:2:\"57\";i:6;s:2:\"58\";i:7;s:2:\"59\";i:8;s:3:\"112\";i:9;s:3:\"147\";i:10;s:3:\"193\";i:11;s:3:\"194\";i:12;s:3:\"195\";i:13;s:3:\"196\";i:14;s:3:\"197\";i:15;s:3:\"198\";i:16;s:3:\"199\";i:17;s:3:\"200\";i:18;s:3:\"201\";i:19;s:3:\"202\";i:20;s:3:\"408\";i:21;s:3:\"409\";i:22;s:3:\"410\";i:23;s:3:\"411\";i:24;s:3:\"412\";}}');
INSERT INTO `x2_knows` VALUES (9, '第一节 新文化运动与五四运动', 4, '', 1, 0, 'a:1:{i:1;i:8;}', 'a:1:{i:1;a:8:{i:0;s:2:\"19\";i:1;s:2:\"60\";i:2;s:3:\"102\";i:3;s:3:\"128\";i:4;s:3:\"203\";i:5;s:3:\"204\";i:6;s:3:\"205\";i:7;s:3:\"413\";}}');
INSERT INTO `x2_knows` VALUES (10, '第二节 马克思主义传播与中国共产党诞生', 4, '', 1, 0, 'a:1:{i:1;i:19;}', 'a:1:{i:1;a:19:{i:0;s:1:\"7\";i:1;s:1:\"8\";i:2;s:2:\"20\";i:3;s:2:\"61\";i:4;s:2:\"62\";i:5;s:2:\"63\";i:6;s:3:\"136\";i:7;s:3:\"206\";i:8;s:3:\"207\";i:9;s:3:\"208\";i:10;s:3:\"209\";i:11;s:3:\"210\";i:12;s:3:\"211\";i:13;s:3:\"212\";i:14;s:3:\"213\";i:15;s:3:\"214\";i:16;s:3:\"215\";i:17;s:3:\"216\";i:18;s:3:\"414\";}}');
INSERT INTO `x2_knows` VALUES (11, '第三节 国共合作与国民革命', 4, '', 1, 0, 'a:1:{i:1;i:15;}', 'a:1:{i:1;a:15:{i:0;s:1:\"2\";i:1;s:2:\"21\";i:2;s:3:\"106\";i:3;s:3:\"107\";i:4;s:3:\"217\";i:5;s:3:\"218\";i:6;s:3:\"219\";i:7;s:3:\"220\";i:8;s:3:\"221\";i:9;s:3:\"222\";i:10;s:3:\"223\";i:11;s:3:\"224\";i:12;s:3:\"415\";i:13;s:3:\"416\";i:14;s:3:\"417\";}}');
INSERT INTO `x2_knows` VALUES (12, '第一节 国民党在全国的统治和中间党派的政治主张', 5, '', 1, 0, 'a:1:{i:1;i:11;}', 'a:1:{i:1;a:11:{i:0;s:2:\"64\";i:1;s:2:\"65\";i:2;s:3:\"227\";i:3;s:3:\"228\";i:4;s:3:\"229\";i:5;s:3:\"230\";i:6;s:3:\"231\";i:7;s:3:\"232\";i:8;s:3:\"233\";i:9;s:3:\"234\";i:10;s:3:\"235\";}}');
INSERT INTO `x2_knows` VALUES (13, '第二节 中国共产党对革命新道路的艰苦探索', 5, '', 1, 0, 'a:1:{i:1;i:20;}', 'a:1:{i:1;a:20:{i:0;s:2:\"22\";i:1;s:2:\"28\";i:2;s:3:\"108\";i:3;s:3:\"142\";i:4;s:3:\"225\";i:5;s:3:\"236\";i:6;s:3:\"237\";i:7;s:3:\"238\";i:8;s:3:\"239\";i:9;s:3:\"240\";i:10;s:3:\"241\";i:11;s:3:\"418\";i:12;s:3:\"419\";i:13;s:3:\"420\";i:14;s:3:\"421\";i:15;s:3:\"422\";i:16;s:3:\"423\";i:17;s:3:\"424\";i:18;s:3:\"425\";i:19;s:3:\"426\";}}');
INSERT INTO `x2_knows` VALUES (14, '第三节 中国革命在探索中曲折前进', 5, '', 1, 0, 'a:1:{i:1;i:17;}', 'a:1:{i:1;a:17:{i:0;s:1:\"3\";i:1;s:2:\"23\";i:2;s:2:\"67\";i:3;s:2:\"71\";i:4;s:3:\"122\";i:5;s:3:\"226\";i:6;s:3:\"427\";i:7;s:3:\"428\";i:8;s:3:\"429\";i:9;s:3:\"430\";i:10;s:3:\"431\";i:11;s:3:\"432\";i:12;s:3:\"433\";i:13;s:3:\"434\";i:14;s:3:\"435\";i:15;s:3:\"436\";i:16;s:3:\"437\";}}');
INSERT INTO `x2_knows` VALUES (15, '第一节 日本发动灭亡中国的侵略战争', 6, '', 1, 0, 'a:1:{i:1;i:7;}', 'a:1:{i:1;a:7:{i:0;s:2:\"66\";i:1;s:2:\"68\";i:2;s:2:\"72\";i:3;s:3:\"243\";i:4;s:3:\"244\";i:5;s:3:\"245\";i:6;s:3:\"246\";}}');
INSERT INTO `x2_knows` VALUES (16, '第二节 从局部抗战到全国性抗战', 6, '', 1, 0, 'a:1:{i:1;i:14;}', 'a:1:{i:1;a:14:{i:0;s:1:\"9\";i:1;s:2:\"69\";i:2;s:2:\"70\";i:3;s:3:\"247\";i:4;s:3:\"248\";i:5;s:3:\"249\";i:6;s:3:\"250\";i:7;s:3:\"251\";i:8;s:3:\"252\";i:9;s:3:\"438\";i:10;s:3:\"439\";i:11;s:3:\"440\";i:12;s:3:\"441\";i:13;s:3:\"442\";}}');
INSERT INTO `x2_knows` VALUES (17, '第三节 国民党的正面战场与大后方的抗日民主运动', 6, '', 1, 0, 'a:1:{i:1;i:15;}', 'a:1:{i:1;a:15:{i:0;s:2:\"73\";i:1;s:2:\"75\";i:2;s:3:\"113\";i:3;s:3:\"242\";i:4;s:3:\"253\";i:5;s:3:\"254\";i:6;s:3:\"255\";i:7;s:3:\"256\";i:8;s:3:\"257\";i:9;s:3:\"258\";i:10;s:3:\"259\";i:11;s:3:\"260\";i:12;s:3:\"443\";i:13;s:3:\"444\";i:14;s:3:\"445\";}}');
INSERT INTO `x2_knows` VALUES (18, '第四节 中国共产党成为抗日战争的中流砥柱', 6, '', 1, 0, 'a:1:{i:1;i:27;}', 'a:1:{i:1;a:27:{i:0;s:1:\"4\";i:1;s:2:\"24\";i:2;s:2:\"25\";i:3;s:2:\"29\";i:4;s:2:\"30\";i:5;s:2:\"74\";i:6;s:2:\"76\";i:7;s:3:\"116\";i:8;s:3:\"137\";i:9;s:3:\"143\";i:10;s:3:\"446\";i:11;s:3:\"447\";i:12;s:3:\"448\";i:13;s:3:\"449\";i:14;s:3:\"450\";i:15;s:3:\"451\";i:16;s:3:\"452\";i:17;s:3:\"453\";i:18;s:3:\"454\";i:19;s:3:\"455\";i:20;s:3:\"456\";i:21;s:3:\"457\";i:22;s:3:\"458\";i:23;s:3:\"459\";i:24;s:3:\"460\";i:25;s:3:\"461\";i:26;s:3:\"462\";}}');
INSERT INTO `x2_knows` VALUES (19, '第五节 抗日战争的胜利及其意义', 6, '', 1, 0, 'a:1:{i:1;i:9;}', 'a:1:{i:1;a:9:{i:0;s:2:\"77\";i:1;s:3:\"114\";i:2;s:3:\"463\";i:3;s:3:\"464\";i:4;s:3:\"465\";i:5;s:3:\"466\";i:6;s:3:\"467\";i:7;s:3:\"468\";i:8;s:3:\"469\";}}');
INSERT INTO `x2_knows` VALUES (20, '第一节 从争取和平民主到进行自卫战争', 7, '', 1, 0, 'a:1:{i:1;i:12;}', 'a:1:{i:1;a:12:{i:0;s:2:\"79\";i:1;s:2:\"80\";i:2;s:3:\"261\";i:3;s:3:\"262\";i:4;s:3:\"263\";i:5;s:3:\"264\";i:6;s:3:\"265\";i:7;s:3:\"266\";i:8;s:3:\"470\";i:9;s:3:\"471\";i:10;s:3:\"472\";i:11;s:3:\"473\";}}');
INSERT INTO `x2_knows` VALUES (21, '第二节 国民党政府处在全民的包围中', 7, '', 1, 0, 'a:1:{i:1;i:26;}', 'a:1:{i:1;a:26:{i:0;s:2:\"78\";i:1;s:2:\"81\";i:2;s:2:\"82\";i:3;s:2:\"83\";i:4;s:2:\"84\";i:5;s:2:\"85\";i:6;s:2:\"86\";i:7;s:3:\"134\";i:8;s:3:\"267\";i:9;s:3:\"268\";i:10;s:3:\"269\";i:11;s:3:\"270\";i:12;s:3:\"271\";i:13;s:3:\"272\";i:14;s:3:\"273\";i:15;s:3:\"274\";i:16;s:3:\"474\";i:17;s:3:\"475\";i:18;s:3:\"476\";i:19;s:3:\"477\";i:20;s:3:\"478\";i:21;s:3:\"479\";i:22;s:3:\"480\";i:23;s:3:\"481\";i:24;s:3:\"482\";i:25;s:3:\"483\";}}');
INSERT INTO `x2_knows` VALUES (22, '第三节 人民共和国：中国人民的历史性选择', 7, '', 1, 0, 'a:1:{i:1;i:24;}', 'a:1:{i:1;a:24:{i:0;s:2:\"10\";i:1;s:2:\"26\";i:2;s:2:\"87\";i:3;s:3:\"275\";i:4;s:3:\"276\";i:5;s:3:\"277\";i:6;s:3:\"278\";i:7;s:3:\"279\";i:8;s:3:\"280\";i:9;s:3:\"484\";i:10;s:3:\"485\";i:11;s:3:\"486\";i:12;s:3:\"487\";i:13;s:3:\"488\";i:14;s:3:\"489\";i:15;s:3:\"490\";i:16;s:3:\"491\";i:17;s:3:\"492\";i:18;s:3:\"493\";i:19;s:3:\"494\";i:20;s:3:\"495\";i:21;s:3:\"496\";i:22;s:3:\"497\";i:23;s:3:\"498\";}}');
INSERT INTO `x2_knows` VALUES (23, '第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成', 8, '', 1, 0, 'a:1:{i:1;i:38;}', 'a:1:{i:1;a:38:{i:0;s:2:\"88\";i:1;s:2:\"89\";i:2;s:3:\"110\";i:3;s:3:\"125\";i:4;s:3:\"129\";i:5;s:3:\"130\";i:6;s:3:\"281\";i:7;s:3:\"282\";i:8;s:3:\"283\";i:9;s:3:\"284\";i:10;s:3:\"285\";i:11;s:3:\"286\";i:12;s:3:\"287\";i:13;s:3:\"288\";i:14;s:3:\"289\";i:15;s:3:\"290\";i:16;s:3:\"291\";i:17;s:3:\"292\";i:18;s:3:\"293\";i:19;s:3:\"294\";i:20;s:3:\"295\";i:21;s:3:\"296\";i:22;s:3:\"297\";i:23;s:3:\"298\";i:24;s:3:\"299\";i:25;s:3:\"300\";i:26;s:3:\"499\";i:27;s:3:\"500\";i:28;s:3:\"501\";i:29;s:3:\"502\";i:30;s:3:\"503\";i:31;s:3:\"504\";i:32;s:3:\"505\";i:33;s:3:\"506\";i:34;s:3:\"507\";i:35;s:3:\"508\";i:36;s:3:\"509\";i:37;s:3:\"510\";}}');
INSERT INTO `x2_knows` VALUES (24, '第二节 制定过渡时期总路线', 8, '', 1, 0, 'a:1:{i:1;i:7;}', 'a:1:{i:1;a:7:{i:0;s:3:\"132\";i:1;s:3:\"511\";i:2;s:3:\"512\";i:3;s:3:\"513\";i:4;s:3:\"514\";i:5;s:3:\"515\";i:6;s:3:\"516\";}}');
INSERT INTO `x2_knows` VALUES (25, '第三节 开辟中国社会主义改造道路', 8, '', 1, 0, 'a:1:{i:1;i:16;}', 'a:1:{i:1;a:16:{i:0;s:2:\"31\";i:1;s:3:\"117\";i:2;s:3:\"123\";i:3;s:3:\"124\";i:4;s:3:\"144\";i:5;s:3:\"517\";i:6;s:3:\"518\";i:7;s:3:\"519\";i:8;s:3:\"520\";i:9;s:3:\"521\";i:10;s:3:\"522\";i:11;s:3:\"523\";i:12;s:3:\"524\";i:13;s:3:\"525\";i:14;s:3:\"526\";i:15;s:3:\"527\";}}');
INSERT INTO `x2_knows` VALUES (26, '第一节 良好的开局', 9, '', 1, 0, 'a:1:{i:1;i:23;}', 'a:1:{i:1;a:23:{i:0;s:2:\"34\";i:1;s:2:\"36\";i:2;s:2:\"37\";i:3;s:2:\"38\";i:4;s:2:\"39\";i:5;s:2:\"40\";i:6;s:3:\"115\";i:7;s:3:\"301\";i:8;s:3:\"302\";i:9;s:3:\"303\";i:10;s:3:\"304\";i:11;s:3:\"305\";i:12;s:3:\"306\";i:13;s:3:\"307\";i:14;s:3:\"308\";i:15;s:3:\"309\";i:16;s:3:\"310\";i:17;s:3:\"311\";i:18;s:3:\"528\";i:19;s:3:\"529\";i:20;s:3:\"530\";i:21;s:3:\"531\";i:22;s:3:\"532\";}}');
INSERT INTO `x2_knows` VALUES (27, '第二节 探索中的严重曲折', 9, '', 1, 0, 'a:1:{i:1;i:27;}', 'a:1:{i:1;a:27:{i:0;s:2:\"27\";i:1;s:2:\"41\";i:2;s:2:\"42\";i:3;s:2:\"43\";i:4;s:2:\"44\";i:5;s:2:\"45\";i:6;s:2:\"46\";i:7;s:2:\"90\";i:8;s:3:\"312\";i:9;s:3:\"313\";i:10;s:3:\"314\";i:11;s:3:\"315\";i:12;s:3:\"316\";i:13;s:3:\"317\";i:14;s:3:\"318\";i:15;s:3:\"319\";i:16;s:3:\"320\";i:17;s:3:\"533\";i:18;s:3:\"534\";i:19;s:3:\"535\";i:20;s:3:\"536\";i:21;s:3:\"537\";i:22;s:3:\"538\";i:23;s:3:\"539\";i:24;s:3:\"540\";i:25;s:3:\"541\";i:26;s:3:\"542\";}}');
INSERT INTO `x2_knows` VALUES (28, '第三节 建设的成就 探索的成果', 9, '', 1, 0, 'a:1:{i:1;i:10;}', 'a:1:{i:1;a:10:{i:0;s:2:\"47\";i:1;s:3:\"131\";i:2;s:3:\"321\";i:3;s:3:\"322\";i:4;s:3:\"323\";i:5;s:3:\"324\";i:6;s:3:\"543\";i:7;s:3:\"544\";i:8;s:3:\"545\";i:9;s:3:\"546\";}}');
INSERT INTO `x2_knows` VALUES (29, '第一节 历史性的伟大转折和改革开放的起步', 10, '', 1, 0, 'a:1:{i:1;i:21;}', 'a:1:{i:1;a:21:{i:0;s:2:\"11\";i:1;s:2:\"32\";i:2;s:2:\"35\";i:3;s:2:\"48\";i:4;s:2:\"49\";i:5;s:2:\"50\";i:6;s:3:\"104\";i:7;s:3:\"325\";i:8;s:3:\"326\";i:9;s:3:\"327\";i:10;s:3:\"328\";i:11;s:3:\"329\";i:12;s:3:\"330\";i:13;s:3:\"331\";i:14;s:3:\"332\";i:15;s:3:\"333\";i:16;s:3:\"334\";i:17;s:3:\"335\";i:18;s:3:\"547\";i:19;s:3:\"548\";i:20;s:3:\"549\";}}');
INSERT INTO `x2_knows` VALUES (30, '第二节 改革开放和现代化建设新局面的展开', 10, '', 1, 0, 'a:1:{i:1;i:17;}', 'a:1:{i:1;a:17:{i:0;s:2:\"33\";i:1;s:2:\"91\";i:2;s:2:\"92\";i:3;s:2:\"93\";i:4;s:3:\"141\";i:5;s:3:\"336\";i:6;s:3:\"337\";i:7;s:3:\"338\";i:8;s:3:\"339\";i:9;s:3:\"340\";i:10;s:3:\"341\";i:11;s:3:\"550\";i:12;s:3:\"551\";i:13;s:3:\"552\";i:14;s:3:\"553\";i:15;s:3:\"554\";i:16;s:3:\"555\";}}');
INSERT INTO `x2_knows` VALUES (31, '第三节 改革开放和现代化建设发展的新阶段', 10, '', 1, 0, 'a:1:{i:1;i:14;}', 'a:1:{i:1;a:14:{i:0;s:2:\"94\";i:1;s:2:\"97\";i:2;s:3:\"145\";i:3;s:3:\"342\";i:4;s:3:\"343\";i:5;s:3:\"344\";i:6;s:3:\"345\";i:7;s:3:\"346\";i:8;s:3:\"347\";i:9;s:3:\"348\";i:10;s:3:\"349\";i:11;s:3:\"351\";i:12;s:3:\"556\";i:13;s:3:\"557\";}}');
INSERT INTO `x2_knows` VALUES (32, '第四节 在新的历史起点上推进中国特色社会主义', 10, '', 1, 0, 'a:1:{i:1;i:16;}', 'a:1:{i:1;a:16:{i:0;s:2:\"98\";i:1;s:3:\"350\";i:2;s:3:\"352\";i:3;s:3:\"558\";i:4;s:3:\"559\";i:5;s:3:\"560\";i:6;s:3:\"561\";i:7;s:3:\"562\";i:8;s:3:\"563\";i:9;s:3:\"564\";i:10;s:3:\"565\";i:11;s:3:\"566\";i:12;s:3:\"567\";i:13;s:3:\"568\";i:14;s:3:\"569\";i:15;s:3:\"570\";}}');
INSERT INTO `x2_knows` VALUES (33, '第五节 改革开放和社会主义现代化建设的成就', 10, '', 1, 0, 'a:1:{i:1;i:2;}', 'a:1:{i:1;a:2:{i:0;s:3:\"101\";i:1;s:3:\"571\";}}');

-- ----------------------------
-- Table structure for x2_log
-- ----------------------------
DROP TABLE IF EXISTS `x2_log`;
CREATE TABLE `x2_log`  (
  `logid` int(11) NOT NULL AUTO_INCREMENT,
  `loguserid` int(11) NULL DEFAULT 0,
  `logcourseid` int(11) NULL DEFAULT 0,
  `logtime` int(11) NULL DEFAULT 0,
  `logstatus` int(1) NULL DEFAULT NULL,
  `logendtime` int(11) NULL DEFAULT NULL,
  `logprogress` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`logid`) USING BTREE,
  INDEX `loguserid`(`loguserid`, `logcourseid`) USING BTREE,
  INDEX `logtime`(`logtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of x2_log
-- ----------------------------
INSERT INTO `x2_log` VALUES (1, 1, 1, 1577597509, 0, 0, 6);
INSERT INTO `x2_log` VALUES (2, 1, 6, 1577601170, 0, 0, 17);

-- ----------------------------
-- Table structure for x2_module
-- ----------------------------
DROP TABLE IF EXISTS `x2_module`;
CREATE TABLE `x2_module`  (
  `moduleid` int(11) NOT NULL AUTO_INCREMENT,
  `modulecode` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `modulename` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `moduledescribe` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `moduleapp` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `moduletable` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `moduleallowreg` tinyint(1) NOT NULL DEFAULT 0,
  `modulestatus` int(1) NOT NULL DEFAULT 0,
  `modulelockfields` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`moduleid`) USING BTREE,
  UNIQUE INDEX `modulecode`(`modulecode`) USING BTREE,
  INDEX `modulename`(`modulename`) USING BTREE,
  INDEX `moduleapp`(`moduleapp`) USING BTREE,
  INDEX `moduleallowreg`(`moduleallowreg`) USING BTREE,
  INDEX `modulestatus`(`modulestatus`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x2_module
-- ----------------------------
INSERT INTO `x2_module` VALUES (1, 'manager', '管理员模型', '管理员', 'user', 'user_data', 0, 0, '');
INSERT INTO `x2_module` VALUES (4, 'news', '新闻', '新闻', 'content', 'content_data', 0, 0, '');
INSERT INTO `x2_module` VALUES (9, 'normal', '普通用户模型', '普通用户', 'user', '', 0, 0, '');
INSERT INTO `x2_module` VALUES (11, 'spnormal', '普通信息', '普通信息', 'special', '', 0, 0, '');
INSERT INTO `x2_module` VALUES (12, 'teacher', '教师模型', '教师模型', 'user', '', 0, 0, '');
INSERT INTO `x2_module` VALUES (14, 'course', '视频课程', '视频课程', 'course', '', 0, 0, '');
INSERT INTO `x2_module` VALUES (15, 'pdf', '文本课程', '文本课程', 'course', '', 0, 0, '');

-- ----------------------------
-- Table structure for x2_module_fields
-- ----------------------------
DROP TABLE IF EXISTS `x2_module_fields`;
CREATE TABLE `x2_module_fields`  (
  `fieldid` int(11) NOT NULL AUTO_INCREMENT,
  `fieldappid` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `fieldmoduleid` int(4) NOT NULL DEFAULT 0,
  `fieldsequence` tinyint(4) NOT NULL DEFAULT 0,
  `field` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `fieldtitle` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `fieldlength` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `fielddescribe` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fieldtype` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `fieldhtmltype` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `fieldhtmlproperty` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fieldvalues` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fielddefault` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fieldlock` tinyint(1) NOT NULL DEFAULT 0,
  `fieldindextype` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `fieldforbidactors` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fieldsystem` int(1) NOT NULL DEFAULT 0,
  `fieldpublic` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`fieldid`) USING BTREE,
  INDEX `field`(`field`, `fieldlock`) USING BTREE,
  INDEX `fieldmoduleid`(`fieldmoduleid`) USING BTREE,
  INDEX `fieldsequence`(`fieldsequence`) USING BTREE,
  INDEX `fieldsystem`(`fieldsystem`) USING BTREE,
  INDEX `fieldpublic`(`fieldpublic`) USING BTREE,
  INDEX `fieldappid`(`fieldappid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x2_module_fields
-- ----------------------------
INSERT INTO `x2_module_fields` VALUES (1, 'user', 1, 2, 'manager_apps', '可管理模块', '240', '', 'varchar', 'checkboxarray', 'class=form-control\r\nstyle=width:30%', '用户=user\r\n内容=content\r\n考试=exam\r\n文件=document\r\n课程=course\r\n财务=bank', '', 0, '', ',-1,', 0, 0);
INSERT INTO `x2_module_fields` VALUES (3, 'user', 1, 9, 'usertruename', '真实姓名', '24', '', 'varchar', 'text', 'class=form-control', '', '', 0, '0', ',,', 0, 1);
INSERT INTO `x2_module_fields` VALUES (7, 'user', 12, 0, 'teacher_subjects', '可管理科目', '', '', 'text', 'checkboxarray', '', '演示课程=1\r\n测试科目二=2', '', 0, '0', ',-1,', 0, 0);
INSERT INTO `x2_module_fields` VALUES (8, 'content', 13, 0, 'cizhuan_guige', '规格', '60', '', 'varchar', 'radio', '', '90*90=1\r\n60*60=2', '', 0, '', ',,', 1, 0);
INSERT INTO `x2_module_fields` VALUES (9, 'content', 13, 0, 'cizhuan_brand', '品牌', '24', '', 'varchar', 'checkboxarray', '', '阿里=阿里\r\n阿里1=阿里1', '', 0, '', ',,', 0, 0);
INSERT INTO `x2_module_fields` VALUES (10, 'content', 13, 0, 'cizhuan_thumb', '缩略图', '120', '', 'varchar', 'thumb', '', '', '', 0, '', ',,', 0, 0);
INSERT INTO `x2_module_fields` VALUES (11, 'course', 14, 0, 'course_files', 'MP4视频', '240', 'MP4的视频格式，用于支持IE浏览器的H5播放', 'varchar', 'videotext', 'exectype=upfile\r\nuptypes=*.mp4\r\nfilesize=120 MB', '', '', 0, '', ',,', 0, 0);
INSERT INTO `x2_module_fields` VALUES (12, 'content', 4, 0, 'tester', '测试字段', '', '', 'text', 'picture', 'class=form-control', '', '', 0, '', ',,', 0, 1);
INSERT INTO `x2_module_fields` VALUES (14, 'user', 12, 3, 'userprofile', '个人简介', '', '', 'text', 'textarea', 'class=form-control', '', '', 0, '', ',,', 0, 1);
INSERT INTO `x2_module_fields` VALUES (16, 'course', 14, 0, 'course_oggfile', 'ogg视频', '250', 'ogg视频支持火狐和谷歌浏览器', 'varchar', 'videotext', 'exectype=upfile\r\nuptypes=*.ogg\r\nfilesize=120 MB\r\nattr-ftype=ogg', '', '', 0, '', ',,', 0, 0);
INSERT INTO `x2_module_fields` VALUES (17, 'course', 14, 0, 'course_webmfile', 'webm视频', '250', 'webm视频用户火狐和谷歌浏览器播放', 'varchar', 'videotext', 'exectype=upfile\r\nuptypes=*.webm\r\nfilesize=120 MB\r\nattr-ftype=webm', '', '', 0, '', ',,', 0, 0);
INSERT INTO `x2_module_fields` VALUES (18, 'course', 14, 0, 'course_youtu', '优酷土豆源', '240', '注意，选择优酷土豆视频后，视频课程不要使用解锁模式。', 'varchar', 'text', 'class=form-control', '', '', 0, '', ',,', 0, 0);
INSERT INTO `x2_module_fields` VALUES (20, 'content', 4, 0, 'demo', '演示', '240', '', 'varchar', 'thumb', '', '', '', 0, '', ',,', 0, 1);
INSERT INTO `x2_module_fields` VALUES (22, 'course', 15, 0, 'pdf_file', 'PDF文件', '240', '', 'varchar', 'videotext', 'exectype=upfile\r\nuptypes=*.pdf\r\nfilesize=20 MB\r\nattr-ftype=pdf', '', '', 0, '', ',,', 0, 0);
INSERT INTO `x2_module_fields` VALUES (27, 'user', 9, 8, 'userpassport', '身份证号', '24', '', 'varchar', 'text', 'class=form-control', '', '', 0, '', ',,', 0, 1);
INSERT INTO `x2_module_fields` VALUES (28, 'user', 12, 6, 'usergender', '性别', '6', '', 'varchar', 'radio', '', '男=男\r\n女=女', '男', 0, '', ',,', 0, 1);
INSERT INTO `x2_module_fields` VALUES (29, 'user', 12, 7, 'userphone', '手机号', '15', '', 'varchar', 'text', 'class=form-control', '', '', 0, 'INDEX', ',,', 0, 1);
INSERT INTO `x2_module_fields` VALUES (30, 'user', 12, 5, 'userdegree', '文化程度', '48', '', 'varchar', 'text', 'class=form-control', '', '', 0, '', ',,', 0, 1);
INSERT INTO `x2_module_fields` VALUES (31, 'user', 12, 4, 'useraddress', '地址', '120', '', 'varchar', 'text', 'class=form-control', '', '', 0, '', ',,', 0, 1);
INSERT INTO `x2_module_fields` VALUES (33, 'user', 12, 10, 'userphoto', '头像', '240', '', 'varchar', 'thumb', '', '', '', 0, '', ',,', 0, 1);

-- ----------------------------
-- Table structure for x2_openbasics
-- ----------------------------
DROP TABLE IF EXISTS `x2_openbasics`;
CREATE TABLE `x2_openbasics`  (
  `obid` int(11) NOT NULL AUTO_INCREMENT,
  `obuserid` int(11) NOT NULL DEFAULT 0,
  `obbasicid` int(11) NOT NULL DEFAULT 0,
  `obtime` int(11) NOT NULL DEFAULT 0,
  `obendtime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`obid`) USING BTREE,
  INDEX `oluserid`(`obuserid`, `obbasicid`, `obtime`, `obendtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of x2_openbasics
-- ----------------------------
INSERT INTO `x2_openbasics` VALUES (1, 1, 1, 1577412914, 1608948914);

-- ----------------------------
-- Table structure for x2_opencourse
-- ----------------------------
DROP TABLE IF EXISTS `x2_opencourse`;
CREATE TABLE `x2_opencourse`  (
  `ocid` int(11) NOT NULL AUTO_INCREMENT,
  `ocuserid` int(11) NOT NULL,
  `occourseid` int(11) NOT NULL,
  `octime` int(11) NOT NULL,
  `ocendtime` int(11) NOT NULL,
  PRIMARY KEY (`ocid`) USING BTREE,
  INDEX `ocuserid`(`ocuserid`, `occourseid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of x2_opencourse
-- ----------------------------
INSERT INTO `x2_opencourse` VALUES (1, 1, 1, 1577597508, 1609133508);

-- ----------------------------
-- Table structure for x2_orders
-- ----------------------------
DROP TABLE IF EXISTS `x2_orders`;
CREATE TABLE `x2_orders`  (
  `ordersn` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ordertitle` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `orderdescribe` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `orderitems` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `orderprice` decimal(10, 2) NOT NULL,
  `orderuserid` int(11) NOT NULL,
  `orderuserinfo` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `orderstatus` int(2) NOT NULL,
  `orderfullprice` decimal(10, 2) NOT NULL,
  `ordercreatetime` int(11) NOT NULL,
  `orderpaytime` int(11) NOT NULL,
  `orderouttime` int(11) NOT NULL,
  `orderrecivetime` int(11) NOT NULL,
  `orderfaq` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `orderpost` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ordersn`) USING BTREE,
  INDEX `orderprice`(`orderprice`, `ordercreatetime`, `orderpaytime`) USING BTREE,
  INDEX `orderuserid`(`orderuserid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x2_poscontent
-- ----------------------------
DROP TABLE IF EXISTS `x2_poscontent`;
CREATE TABLE `x2_poscontent`  (
  `pcid` int(11) NOT NULL AUTO_INCREMENT,
  `pcposid` int(11) NOT NULL DEFAULT 0,
  `pcposapp` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pccontentid` int(11) NOT NULL DEFAULT 0,
  `pcthumb` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `pcsequence` int(11) NOT NULL DEFAULT 0,
  `pctitle` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `pctime` int(11) NOT NULL DEFAULT 0,
  `pcdescribe` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`pcid`) USING BTREE,
  INDEX `pcposid`(`pcposid`, `pccontentid`, `pcsequence`) USING BTREE,
  INDEX `pctime`(`pctime`) USING BTREE,
  INDEX `pcposapp`(`pcposapp`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x2_poscontent
-- ----------------------------
INSERT INTO `x2_poscontent` VALUES (1, 2, 'content', 4, 'app/core/styles/images/noimage.gif', 0, '教育部公布2020年研考违规违法行为举报电话', 1575129621, '2020年全国硕士研究生招生考试将于12月21日至23日举行，报考人数341万人。为严厉打击涉考违法活动，严肃考试纪律，维护考生合法权益，现公布2020年全国硕士研究生招生考试违规违法行为举报电话。');
INSERT INTO `x2_poscontent` VALUES (2, 1, 'content', 5, 'files/public/img/banner.jpg', 0, 'phpems 6.0发布', 1575129614, '免费开源的考试系统');

-- ----------------------------
-- Table structure for x2_position
-- ----------------------------
DROP TABLE IF EXISTS `x2_position`;
CREATE TABLE `x2_position`  (
  `posid` int(11) NOT NULL AUTO_INCREMENT,
  `posname` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`posid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x2_position
-- ----------------------------
INSERT INTO `x2_position` VALUES (1, 'PC首页轮播图');
INSERT INTO `x2_position` VALUES (2, '热点新闻');
INSERT INTO `x2_position` VALUES (3, '精彩专题');
INSERT INTO `x2_position` VALUES (4, '手机首页轮播图');

-- ----------------------------
-- Table structure for x2_product
-- ----------------------------
DROP TABLE IF EXISTS `x2_product`;
CREATE TABLE `x2_product`  (
  `productid` int(11) NOT NULL AUTO_INCREMENT,
  `producttype` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `productpartnerid` int(11) NOT NULL DEFAULT 0,
  `productname` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `productcode` int(11) NOT NULL DEFAULT 0,
  `productprice` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `productdescribe` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `productlesson` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `producttry` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`productid`) USING BTREE,
  INDEX `partnercode`(`productcode`) USING BTREE,
  INDEX `productpartnerid`(`productpartnerid`) USING BTREE,
  INDEX `producttype`(`producttype`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x2_progress
-- ----------------------------
DROP TABLE IF EXISTS `x2_progress`;
CREATE TABLE `x2_progress`  (
  `prsid` int(11) NOT NULL AUTO_INCREMENT,
  `prsuserid` int(11) NOT NULL,
  `prstime` int(11) NOT NULL,
  `prsendtime` int(11) NOT NULL,
  `prscourseid` int(11) NOT NULL,
  `prscoursestatus` tinyint(1) NOT NULL,
  `prsexamid` int(11) NOT NULL,
  `prsexamstatus` tinyint(1) NOT NULL,
  `prstatus` tinyint(1) NOT NULL,
  PRIMARY KEY (`prsid`) USING BTREE,
  INDEX `prsuserid`(`prsuserid`) USING BTREE,
  INDEX `prscoursestatus`(`prscoursestatus`) USING BTREE,
  INDEX `prsexamstatus`(`prsexamstatus`) USING BTREE,
  INDEX `prstatus`(`prstatus`) USING BTREE,
  INDEX `prscourseid`(`prscourseid`) USING BTREE,
  INDEX `prsexamid`(`prsexamid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for x2_province
-- ----------------------------
DROP TABLE IF EXISTS `x2_province`;
CREATE TABLE `x2_province`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provinceid` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `province` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `province`(`province`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x2_province
-- ----------------------------
INSERT INTO `x2_province` VALUES (1, '110000', '北京市');
INSERT INTO `x2_province` VALUES (2, '120000', '天津市');
INSERT INTO `x2_province` VALUES (3, '130000', '河北省');
INSERT INTO `x2_province` VALUES (4, '140000', '山西省');
INSERT INTO `x2_province` VALUES (5, '150000', '内蒙古自治区');
INSERT INTO `x2_province` VALUES (6, '210000', '辽宁省');
INSERT INTO `x2_province` VALUES (7, '220000', '吉林省');
INSERT INTO `x2_province` VALUES (8, '230000', '黑龙江省');
INSERT INTO `x2_province` VALUES (9, '310000', '上海市');
INSERT INTO `x2_province` VALUES (10, '320000', '江苏省');
INSERT INTO `x2_province` VALUES (11, '330000', '浙江省');
INSERT INTO `x2_province` VALUES (12, '340000', '安徽省');
INSERT INTO `x2_province` VALUES (13, '350000', '福建省');
INSERT INTO `x2_province` VALUES (14, '360000', '江西省');
INSERT INTO `x2_province` VALUES (15, '370000', '山东省');
INSERT INTO `x2_province` VALUES (16, '410000', '河南省');
INSERT INTO `x2_province` VALUES (17, '420000', '湖北省');
INSERT INTO `x2_province` VALUES (18, '430000', '湖南省');
INSERT INTO `x2_province` VALUES (19, '440000', '广东省');
INSERT INTO `x2_province` VALUES (20, '450000', '广西壮族自治区');
INSERT INTO `x2_province` VALUES (21, '460000', '海南省');
INSERT INTO `x2_province` VALUES (22, '500000', '重庆市');
INSERT INTO `x2_province` VALUES (23, '510000', '四川省');
INSERT INTO `x2_province` VALUES (24, '520000', '贵州省');
INSERT INTO `x2_province` VALUES (25, '530000', '云南省');
INSERT INTO `x2_province` VALUES (26, '540000', '西藏自治区');
INSERT INTO `x2_province` VALUES (27, '610000', '陕西省');
INSERT INTO `x2_province` VALUES (28, '620000', '甘肃省');
INSERT INTO `x2_province` VALUES (29, '630000', '青海省');
INSERT INTO `x2_province` VALUES (30, '640000', '宁夏回族自治区');
INSERT INTO `x2_province` VALUES (31, '650000', '新疆维吾尔自治区');

-- ----------------------------
-- Table structure for x2_quest2knows
-- ----------------------------
DROP TABLE IF EXISTS `x2_quest2knows`;
CREATE TABLE `x2_quest2knows`  (
  `qkid` int(11) NOT NULL AUTO_INCREMENT,
  `qkquestionid` int(11) NOT NULL DEFAULT 0,
  `qkknowsid` int(11) NOT NULL DEFAULT 0,
  `qktype` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`qkid`) USING BTREE,
  INDEX `qkquestionid`(`qkquestionid`, `qkknowsid`) USING BTREE,
  INDEX `qktype`(`qktype`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 572 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of x2_quest2knows
-- ----------------------------
INSERT INTO `x2_quest2knows` VALUES (1, 1, 4, 0);
INSERT INTO `x2_quest2knows` VALUES (2, 2, 11, 0);
INSERT INTO `x2_quest2knows` VALUES (3, 3, 14, 0);
INSERT INTO `x2_quest2knows` VALUES (4, 4, 18, 0);
INSERT INTO `x2_quest2knows` VALUES (5, 5, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (6, 6, 8, 0);
INSERT INTO `x2_quest2knows` VALUES (7, 7, 10, 0);
INSERT INTO `x2_quest2knows` VALUES (8, 8, 10, 0);
INSERT INTO `x2_quest2knows` VALUES (9, 9, 16, 0);
INSERT INTO `x2_quest2knows` VALUES (10, 10, 22, 0);
INSERT INTO `x2_quest2knows` VALUES (11, 11, 29, 0);
INSERT INTO `x2_quest2knows` VALUES (12, 12, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (13, 13, 3, 0);
INSERT INTO `x2_quest2knows` VALUES (14, 14, 4, 0);
INSERT INTO `x2_quest2knows` VALUES (15, 15, 5, 0);
INSERT INTO `x2_quest2knows` VALUES (16, 16, 7, 0);
INSERT INTO `x2_quest2knows` VALUES (17, 17, 8, 0);
INSERT INTO `x2_quest2knows` VALUES (18, 18, 8, 0);
INSERT INTO `x2_quest2knows` VALUES (19, 19, 9, 0);
INSERT INTO `x2_quest2knows` VALUES (20, 20, 10, 0);
INSERT INTO `x2_quest2knows` VALUES (21, 21, 11, 0);
INSERT INTO `x2_quest2knows` VALUES (22, 22, 13, 0);
INSERT INTO `x2_quest2knows` VALUES (23, 23, 14, 0);
INSERT INTO `x2_quest2knows` VALUES (24, 24, 18, 0);
INSERT INTO `x2_quest2knows` VALUES (25, 25, 18, 0);
INSERT INTO `x2_quest2knows` VALUES (26, 26, 22, 0);
INSERT INTO `x2_quest2knows` VALUES (27, 27, 27, 0);
INSERT INTO `x2_quest2knows` VALUES (28, 28, 13, 0);
INSERT INTO `x2_quest2knows` VALUES (29, 29, 18, 0);
INSERT INTO `x2_quest2knows` VALUES (30, 30, 18, 0);
INSERT INTO `x2_quest2knows` VALUES (31, 31, 25, 0);
INSERT INTO `x2_quest2knows` VALUES (32, 32, 29, 0);
INSERT INTO `x2_quest2knows` VALUES (33, 33, 30, 0);
INSERT INTO `x2_quest2knows` VALUES (34, 34, 26, 0);
INSERT INTO `x2_quest2knows` VALUES (35, 35, 29, 0);
INSERT INTO `x2_quest2knows` VALUES (36, 36, 26, 0);
INSERT INTO `x2_quest2knows` VALUES (37, 37, 26, 0);
INSERT INTO `x2_quest2knows` VALUES (38, 38, 26, 0);
INSERT INTO `x2_quest2knows` VALUES (39, 39, 26, 0);
INSERT INTO `x2_quest2knows` VALUES (40, 40, 26, 0);
INSERT INTO `x2_quest2knows` VALUES (41, 41, 27, 0);
INSERT INTO `x2_quest2knows` VALUES (42, 42, 27, 0);
INSERT INTO `x2_quest2knows` VALUES (43, 43, 27, 0);
INSERT INTO `x2_quest2knows` VALUES (44, 44, 27, 0);
INSERT INTO `x2_quest2knows` VALUES (45, 45, 27, 0);
INSERT INTO `x2_quest2knows` VALUES (46, 46, 27, 0);
INSERT INTO `x2_quest2knows` VALUES (47, 47, 28, 0);
INSERT INTO `x2_quest2knows` VALUES (48, 48, 29, 0);
INSERT INTO `x2_quest2knows` VALUES (49, 49, 29, 0);
INSERT INTO `x2_quest2knows` VALUES (50, 50, 29, 0);
INSERT INTO `x2_quest2knows` VALUES (51, 51, 8, 0);
INSERT INTO `x2_quest2knows` VALUES (52, 52, 3, 0);
INSERT INTO `x2_quest2knows` VALUES (53, 53, 5, 0);
INSERT INTO `x2_quest2knows` VALUES (54, 54, 7, 0);
INSERT INTO `x2_quest2knows` VALUES (55, 55, 6, 0);
INSERT INTO `x2_quest2knows` VALUES (56, 56, 8, 0);
INSERT INTO `x2_quest2knows` VALUES (57, 57, 8, 0);
INSERT INTO `x2_quest2knows` VALUES (58, 58, 8, 0);
INSERT INTO `x2_quest2knows` VALUES (59, 59, 8, 0);
INSERT INTO `x2_quest2knows` VALUES (60, 60, 9, 0);
INSERT INTO `x2_quest2knows` VALUES (61, 61, 10, 0);
INSERT INTO `x2_quest2knows` VALUES (62, 62, 10, 0);
INSERT INTO `x2_quest2knows` VALUES (63, 63, 10, 0);
INSERT INTO `x2_quest2knows` VALUES (64, 64, 12, 0);
INSERT INTO `x2_quest2knows` VALUES (65, 65, 12, 0);
INSERT INTO `x2_quest2knows` VALUES (66, 66, 15, 0);
INSERT INTO `x2_quest2knows` VALUES (67, 67, 14, 0);
INSERT INTO `x2_quest2knows` VALUES (68, 68, 15, 0);
INSERT INTO `x2_quest2knows` VALUES (69, 69, 16, 0);
INSERT INTO `x2_quest2knows` VALUES (70, 70, 16, 0);
INSERT INTO `x2_quest2knows` VALUES (71, 71, 14, 0);
INSERT INTO `x2_quest2knows` VALUES (72, 72, 15, 0);
INSERT INTO `x2_quest2knows` VALUES (73, 73, 17, 0);
INSERT INTO `x2_quest2knows` VALUES (74, 74, 18, 0);
INSERT INTO `x2_quest2knows` VALUES (75, 75, 17, 0);
INSERT INTO `x2_quest2knows` VALUES (76, 76, 18, 0);
INSERT INTO `x2_quest2knows` VALUES (77, 77, 19, 0);
INSERT INTO `x2_quest2knows` VALUES (78, 78, 21, 0);
INSERT INTO `x2_quest2knows` VALUES (79, 79, 20, 0);
INSERT INTO `x2_quest2knows` VALUES (80, 80, 20, 0);
INSERT INTO `x2_quest2knows` VALUES (81, 81, 21, 0);
INSERT INTO `x2_quest2knows` VALUES (82, 82, 21, 0);
INSERT INTO `x2_quest2knows` VALUES (83, 83, 21, 0);
INSERT INTO `x2_quest2knows` VALUES (84, 84, 21, 0);
INSERT INTO `x2_quest2knows` VALUES (85, 85, 21, 0);
INSERT INTO `x2_quest2knows` VALUES (86, 86, 21, 0);
INSERT INTO `x2_quest2knows` VALUES (87, 87, 22, 0);
INSERT INTO `x2_quest2knows` VALUES (88, 88, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (89, 89, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (90, 90, 27, 0);
INSERT INTO `x2_quest2knows` VALUES (91, 91, 30, 0);
INSERT INTO `x2_quest2knows` VALUES (92, 92, 30, 0);
INSERT INTO `x2_quest2knows` VALUES (93, 93, 30, 0);
INSERT INTO `x2_quest2knows` VALUES (94, 94, 31, 0);
INSERT INTO `x2_quest2knows` VALUES (95, 95, 5, 0);
INSERT INTO `x2_quest2knows` VALUES (96, 96, 3, 0);
INSERT INTO `x2_quest2knows` VALUES (97, 97, 31, 0);
INSERT INTO `x2_quest2knows` VALUES (98, 98, 32, 0);
INSERT INTO `x2_quest2knows` VALUES (99, 99, 7, 0);
INSERT INTO `x2_quest2knows` VALUES (100, 100, 7, 0);
INSERT INTO `x2_quest2knows` VALUES (101, 101, 33, 0);
INSERT INTO `x2_quest2knows` VALUES (102, 102, 9, 0);
INSERT INTO `x2_quest2knows` VALUES (103, 103, 7, 0);
INSERT INTO `x2_quest2knows` VALUES (104, 104, 29, 0);
INSERT INTO `x2_quest2knows` VALUES (105, 105, 5, 0);
INSERT INTO `x2_quest2knows` VALUES (106, 106, 11, 0);
INSERT INTO `x2_quest2knows` VALUES (107, 107, 11, 0);
INSERT INTO `x2_quest2knows` VALUES (108, 108, 13, 0);
INSERT INTO `x2_quest2knows` VALUES (109, 109, 6, 0);
INSERT INTO `x2_quest2knows` VALUES (110, 110, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (111, 111, 7, 0);
INSERT INTO `x2_quest2knows` VALUES (112, 112, 8, 0);
INSERT INTO `x2_quest2knows` VALUES (113, 113, 17, 0);
INSERT INTO `x2_quest2knows` VALUES (114, 114, 19, 0);
INSERT INTO `x2_quest2knows` VALUES (115, 115, 26, 0);
INSERT INTO `x2_quest2knows` VALUES (116, 116, 18, 0);
INSERT INTO `x2_quest2knows` VALUES (117, 117, 25, 0);
INSERT INTO `x2_quest2knows` VALUES (118, 118, 7, 0);
INSERT INTO `x2_quest2knows` VALUES (119, 119, 4, 0);
INSERT INTO `x2_quest2knows` VALUES (120, 120, 4, 0);
INSERT INTO `x2_quest2knows` VALUES (121, 121, 4, 0);
INSERT INTO `x2_quest2knows` VALUES (122, 122, 14, 0);
INSERT INTO `x2_quest2knows` VALUES (123, 123, 25, 0);
INSERT INTO `x2_quest2knows` VALUES (124, 124, 25, 0);
INSERT INTO `x2_quest2knows` VALUES (125, 125, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (126, 126, 6, 0);
INSERT INTO `x2_quest2knows` VALUES (127, 127, 6, 0);
INSERT INTO `x2_quest2knows` VALUES (128, 128, 9, 0);
INSERT INTO `x2_quest2knows` VALUES (129, 129, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (130, 130, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (131, 131, 28, 0);
INSERT INTO `x2_quest2knows` VALUES (132, 132, 24, 0);
INSERT INTO `x2_quest2knows` VALUES (133, 133, 5, 0);
INSERT INTO `x2_quest2knows` VALUES (134, 134, 21, 0);
INSERT INTO `x2_quest2knows` VALUES (135, 135, 3, 0);
INSERT INTO `x2_quest2knows` VALUES (136, 136, 10, 0);
INSERT INTO `x2_quest2knows` VALUES (137, 137, 18, 0);
INSERT INTO `x2_quest2knows` VALUES (138, 138, 3, 0);
INSERT INTO `x2_quest2knows` VALUES (139, 139, 6, 0);
INSERT INTO `x2_quest2knows` VALUES (140, 140, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (141, 141, 30, 0);
INSERT INTO `x2_quest2knows` VALUES (142, 142, 13, 0);
INSERT INTO `x2_quest2knows` VALUES (143, 143, 18, 0);
INSERT INTO `x2_quest2knows` VALUES (144, 144, 25, 0);
INSERT INTO `x2_quest2knows` VALUES (145, 145, 31, 0);
INSERT INTO `x2_quest2knows` VALUES (146, 146, 5, 0);
INSERT INTO `x2_quest2knows` VALUES (147, 147, 8, 0);
INSERT INTO `x2_quest2knows` VALUES (148, 148, 7, 0);
INSERT INTO `x2_quest2knows` VALUES (149, 149, 1, 0);
INSERT INTO `x2_quest2knows` VALUES (150, 150, 1, 0);
INSERT INTO `x2_quest2knows` VALUES (151, 151, 1, 0);
INSERT INTO `x2_quest2knows` VALUES (152, 152, 1, 0);
INSERT INTO `x2_quest2knows` VALUES (153, 153, 1, 0);
INSERT INTO `x2_quest2knows` VALUES (154, 154, 1, 0);
INSERT INTO `x2_quest2knows` VALUES (155, 155, 1, 0);
INSERT INTO `x2_quest2knows` VALUES (156, 156, 1, 0);
INSERT INTO `x2_quest2knows` VALUES (157, 157, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (158, 158, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (159, 159, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (160, 160, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (161, 161, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (162, 162, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (163, 163, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (164, 164, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (165, 165, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (166, 166, 3, 0);
INSERT INTO `x2_quest2knows` VALUES (167, 167, 3, 0);
INSERT INTO `x2_quest2knows` VALUES (168, 168, 3, 0);
INSERT INTO `x2_quest2knows` VALUES (169, 169, 1, 0);
INSERT INTO `x2_quest2knows` VALUES (170, 170, 4, 0);
INSERT INTO `x2_quest2knows` VALUES (171, 171, 4, 0);
INSERT INTO `x2_quest2knows` VALUES (172, 172, 4, 0);
INSERT INTO `x2_quest2knows` VALUES (173, 173, 5, 0);
INSERT INTO `x2_quest2knows` VALUES (174, 174, 5, 0);
INSERT INTO `x2_quest2knows` VALUES (175, 175, 5, 0);
INSERT INTO `x2_quest2knows` VALUES (176, 176, 5, 0);
INSERT INTO `x2_quest2knows` VALUES (177, 177, 5, 0);
INSERT INTO `x2_quest2knows` VALUES (178, 178, 6, 0);
INSERT INTO `x2_quest2knows` VALUES (179, 179, 6, 0);
INSERT INTO `x2_quest2knows` VALUES (180, 180, 6, 0);
INSERT INTO `x2_quest2knows` VALUES (181, 181, 6, 0);
INSERT INTO `x2_quest2knows` VALUES (182, 182, 6, 0);
INSERT INTO `x2_quest2knows` VALUES (183, 183, 6, 0);
INSERT INTO `x2_quest2knows` VALUES (184, 184, 6, 0);
INSERT INTO `x2_quest2knows` VALUES (185, 185, 6, 0);
INSERT INTO `x2_quest2knows` VALUES (186, 186, 7, 0);
INSERT INTO `x2_quest2knows` VALUES (187, 187, 7, 0);
INSERT INTO `x2_quest2knows` VALUES (188, 188, 7, 0);
INSERT INTO `x2_quest2knows` VALUES (189, 189, 7, 0);
INSERT INTO `x2_quest2knows` VALUES (190, 190, 7, 0);
INSERT INTO `x2_quest2knows` VALUES (191, 191, 7, 0);
INSERT INTO `x2_quest2knows` VALUES (192, 192, 7, 0);
INSERT INTO `x2_quest2knows` VALUES (193, 193, 8, 0);
INSERT INTO `x2_quest2knows` VALUES (194, 194, 8, 0);
INSERT INTO `x2_quest2knows` VALUES (195, 195, 8, 0);
INSERT INTO `x2_quest2knows` VALUES (196, 196, 8, 0);
INSERT INTO `x2_quest2knows` VALUES (197, 197, 8, 0);
INSERT INTO `x2_quest2knows` VALUES (198, 198, 8, 0);
INSERT INTO `x2_quest2knows` VALUES (199, 199, 8, 0);
INSERT INTO `x2_quest2knows` VALUES (200, 200, 8, 0);
INSERT INTO `x2_quest2knows` VALUES (201, 201, 8, 0);
INSERT INTO `x2_quest2knows` VALUES (202, 202, 8, 0);
INSERT INTO `x2_quest2knows` VALUES (203, 203, 9, 0);
INSERT INTO `x2_quest2knows` VALUES (204, 204, 9, 0);
INSERT INTO `x2_quest2knows` VALUES (205, 205, 9, 0);
INSERT INTO `x2_quest2knows` VALUES (206, 206, 10, 0);
INSERT INTO `x2_quest2knows` VALUES (207, 207, 10, 0);
INSERT INTO `x2_quest2knows` VALUES (208, 208, 10, 0);
INSERT INTO `x2_quest2knows` VALUES (209, 209, 10, 0);
INSERT INTO `x2_quest2knows` VALUES (210, 210, 10, 0);
INSERT INTO `x2_quest2knows` VALUES (211, 211, 10, 0);
INSERT INTO `x2_quest2knows` VALUES (212, 212, 10, 0);
INSERT INTO `x2_quest2knows` VALUES (213, 213, 10, 0);
INSERT INTO `x2_quest2knows` VALUES (214, 214, 10, 0);
INSERT INTO `x2_quest2knows` VALUES (215, 215, 10, 0);
INSERT INTO `x2_quest2knows` VALUES (216, 216, 10, 0);
INSERT INTO `x2_quest2knows` VALUES (217, 217, 11, 0);
INSERT INTO `x2_quest2knows` VALUES (218, 218, 11, 0);
INSERT INTO `x2_quest2knows` VALUES (219, 219, 11, 0);
INSERT INTO `x2_quest2knows` VALUES (220, 220, 11, 0);
INSERT INTO `x2_quest2knows` VALUES (221, 221, 11, 0);
INSERT INTO `x2_quest2knows` VALUES (222, 222, 11, 0);
INSERT INTO `x2_quest2knows` VALUES (223, 223, 11, 0);
INSERT INTO `x2_quest2knows` VALUES (224, 224, 11, 0);
INSERT INTO `x2_quest2knows` VALUES (225, 225, 13, 0);
INSERT INTO `x2_quest2knows` VALUES (226, 226, 14, 0);
INSERT INTO `x2_quest2knows` VALUES (227, 227, 12, 0);
INSERT INTO `x2_quest2knows` VALUES (228, 228, 12, 0);
INSERT INTO `x2_quest2knows` VALUES (229, 229, 12, 0);
INSERT INTO `x2_quest2knows` VALUES (230, 230, 12, 0);
INSERT INTO `x2_quest2knows` VALUES (231, 231, 12, 0);
INSERT INTO `x2_quest2knows` VALUES (232, 232, 12, 0);
INSERT INTO `x2_quest2knows` VALUES (233, 233, 12, 0);
INSERT INTO `x2_quest2knows` VALUES (234, 234, 12, 0);
INSERT INTO `x2_quest2knows` VALUES (235, 235, 12, 0);
INSERT INTO `x2_quest2knows` VALUES (236, 236, 13, 0);
INSERT INTO `x2_quest2knows` VALUES (237, 237, 13, 0);
INSERT INTO `x2_quest2knows` VALUES (238, 238, 13, 0);
INSERT INTO `x2_quest2knows` VALUES (239, 239, 13, 0);
INSERT INTO `x2_quest2knows` VALUES (240, 240, 13, 0);
INSERT INTO `x2_quest2knows` VALUES (241, 241, 13, 0);
INSERT INTO `x2_quest2knows` VALUES (242, 242, 17, 0);
INSERT INTO `x2_quest2knows` VALUES (243, 243, 15, 0);
INSERT INTO `x2_quest2knows` VALUES (244, 244, 15, 0);
INSERT INTO `x2_quest2knows` VALUES (245, 245, 15, 0);
INSERT INTO `x2_quest2knows` VALUES (246, 246, 15, 0);
INSERT INTO `x2_quest2knows` VALUES (247, 247, 16, 0);
INSERT INTO `x2_quest2knows` VALUES (248, 248, 16, 0);
INSERT INTO `x2_quest2knows` VALUES (249, 249, 16, 0);
INSERT INTO `x2_quest2knows` VALUES (250, 250, 16, 0);
INSERT INTO `x2_quest2knows` VALUES (251, 251, 16, 0);
INSERT INTO `x2_quest2knows` VALUES (252, 252, 16, 0);
INSERT INTO `x2_quest2knows` VALUES (253, 253, 17, 0);
INSERT INTO `x2_quest2knows` VALUES (254, 254, 17, 0);
INSERT INTO `x2_quest2knows` VALUES (255, 255, 17, 0);
INSERT INTO `x2_quest2knows` VALUES (256, 256, 17, 0);
INSERT INTO `x2_quest2knows` VALUES (257, 257, 17, 0);
INSERT INTO `x2_quest2knows` VALUES (258, 258, 17, 0);
INSERT INTO `x2_quest2knows` VALUES (259, 259, 17, 0);
INSERT INTO `x2_quest2knows` VALUES (260, 260, 17, 0);
INSERT INTO `x2_quest2knows` VALUES (261, 261, 20, 0);
INSERT INTO `x2_quest2knows` VALUES (262, 262, 20, 0);
INSERT INTO `x2_quest2knows` VALUES (263, 263, 20, 0);
INSERT INTO `x2_quest2knows` VALUES (264, 264, 20, 0);
INSERT INTO `x2_quest2knows` VALUES (265, 265, 20, 0);
INSERT INTO `x2_quest2knows` VALUES (266, 266, 20, 0);
INSERT INTO `x2_quest2knows` VALUES (267, 267, 21, 0);
INSERT INTO `x2_quest2knows` VALUES (268, 268, 21, 0);
INSERT INTO `x2_quest2knows` VALUES (269, 269, 21, 0);
INSERT INTO `x2_quest2knows` VALUES (270, 270, 21, 0);
INSERT INTO `x2_quest2knows` VALUES (271, 271, 21, 0);
INSERT INTO `x2_quest2knows` VALUES (272, 272, 21, 0);
INSERT INTO `x2_quest2knows` VALUES (273, 273, 21, 0);
INSERT INTO `x2_quest2knows` VALUES (274, 274, 21, 0);
INSERT INTO `x2_quest2knows` VALUES (275, 275, 22, 0);
INSERT INTO `x2_quest2knows` VALUES (276, 276, 22, 0);
INSERT INTO `x2_quest2knows` VALUES (277, 277, 22, 0);
INSERT INTO `x2_quest2knows` VALUES (278, 278, 22, 0);
INSERT INTO `x2_quest2knows` VALUES (279, 279, 22, 0);
INSERT INTO `x2_quest2knows` VALUES (280, 280, 22, 0);
INSERT INTO `x2_quest2knows` VALUES (281, 281, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (282, 282, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (283, 283, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (284, 284, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (285, 285, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (286, 286, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (287, 287, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (288, 288, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (289, 289, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (290, 290, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (291, 291, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (292, 292, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (293, 293, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (294, 294, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (295, 295, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (296, 296, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (297, 297, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (298, 298, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (299, 299, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (300, 300, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (301, 301, 26, 0);
INSERT INTO `x2_quest2knows` VALUES (302, 302, 26, 0);
INSERT INTO `x2_quest2knows` VALUES (303, 303, 26, 0);
INSERT INTO `x2_quest2knows` VALUES (304, 304, 26, 0);
INSERT INTO `x2_quest2knows` VALUES (305, 305, 26, 0);
INSERT INTO `x2_quest2knows` VALUES (306, 306, 26, 0);
INSERT INTO `x2_quest2knows` VALUES (307, 307, 26, 0);
INSERT INTO `x2_quest2knows` VALUES (308, 308, 26, 0);
INSERT INTO `x2_quest2knows` VALUES (309, 309, 26, 0);
INSERT INTO `x2_quest2knows` VALUES (310, 310, 26, 0);
INSERT INTO `x2_quest2knows` VALUES (311, 311, 26, 0);
INSERT INTO `x2_quest2knows` VALUES (312, 312, 27, 0);
INSERT INTO `x2_quest2knows` VALUES (313, 313, 27, 0);
INSERT INTO `x2_quest2knows` VALUES (314, 314, 27, 0);
INSERT INTO `x2_quest2knows` VALUES (315, 315, 27, 0);
INSERT INTO `x2_quest2knows` VALUES (316, 316, 27, 0);
INSERT INTO `x2_quest2knows` VALUES (317, 317, 27, 0);
INSERT INTO `x2_quest2knows` VALUES (318, 318, 27, 0);
INSERT INTO `x2_quest2knows` VALUES (319, 319, 27, 0);
INSERT INTO `x2_quest2knows` VALUES (320, 320, 27, 0);
INSERT INTO `x2_quest2knows` VALUES (321, 321, 28, 0);
INSERT INTO `x2_quest2knows` VALUES (322, 322, 28, 0);
INSERT INTO `x2_quest2knows` VALUES (323, 323, 28, 0);
INSERT INTO `x2_quest2knows` VALUES (324, 324, 28, 0);
INSERT INTO `x2_quest2knows` VALUES (325, 325, 29, 0);
INSERT INTO `x2_quest2knows` VALUES (326, 326, 29, 0);
INSERT INTO `x2_quest2knows` VALUES (327, 327, 29, 0);
INSERT INTO `x2_quest2knows` VALUES (328, 328, 29, 0);
INSERT INTO `x2_quest2knows` VALUES (329, 329, 29, 0);
INSERT INTO `x2_quest2knows` VALUES (330, 330, 29, 0);
INSERT INTO `x2_quest2knows` VALUES (331, 331, 29, 0);
INSERT INTO `x2_quest2knows` VALUES (332, 332, 29, 0);
INSERT INTO `x2_quest2knows` VALUES (333, 333, 29, 0);
INSERT INTO `x2_quest2knows` VALUES (334, 334, 29, 0);
INSERT INTO `x2_quest2knows` VALUES (335, 335, 29, 0);
INSERT INTO `x2_quest2knows` VALUES (336, 336, 30, 0);
INSERT INTO `x2_quest2knows` VALUES (337, 337, 30, 0);
INSERT INTO `x2_quest2knows` VALUES (338, 338, 30, 0);
INSERT INTO `x2_quest2knows` VALUES (339, 339, 30, 0);
INSERT INTO `x2_quest2knows` VALUES (340, 340, 30, 0);
INSERT INTO `x2_quest2knows` VALUES (341, 341, 30, 0);
INSERT INTO `x2_quest2knows` VALUES (342, 342, 31, 0);
INSERT INTO `x2_quest2knows` VALUES (343, 343, 31, 0);
INSERT INTO `x2_quest2knows` VALUES (344, 344, 31, 0);
INSERT INTO `x2_quest2knows` VALUES (345, 345, 31, 0);
INSERT INTO `x2_quest2knows` VALUES (346, 346, 31, 0);
INSERT INTO `x2_quest2knows` VALUES (347, 347, 31, 0);
INSERT INTO `x2_quest2knows` VALUES (348, 348, 31, 0);
INSERT INTO `x2_quest2knows` VALUES (349, 349, 31, 0);
INSERT INTO `x2_quest2knows` VALUES (350, 350, 32, 0);
INSERT INTO `x2_quest2knows` VALUES (351, 351, 31, 0);
INSERT INTO `x2_quest2knows` VALUES (352, 352, 32, 0);
INSERT INTO `x2_quest2knows` VALUES (353, 353, 1, 0);
INSERT INTO `x2_quest2knows` VALUES (354, 354, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (355, 355, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (356, 356, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (357, 357, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (358, 358, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (359, 359, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (360, 360, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (361, 361, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (362, 362, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (363, 363, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (364, 364, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (365, 365, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (366, 366, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (367, 367, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (368, 368, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (369, 369, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (370, 370, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (371, 371, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (372, 372, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (373, 373, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (374, 374, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (375, 375, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (376, 376, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (377, 377, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (378, 378, 2, 0);
INSERT INTO `x2_quest2knows` VALUES (379, 379, 3, 0);
INSERT INTO `x2_quest2knows` VALUES (380, 380, 3, 0);
INSERT INTO `x2_quest2knows` VALUES (381, 381, 3, 0);
INSERT INTO `x2_quest2knows` VALUES (382, 382, 3, 0);
INSERT INTO `x2_quest2knows` VALUES (383, 383, 3, 0);
INSERT INTO `x2_quest2knows` VALUES (384, 384, 3, 0);
INSERT INTO `x2_quest2knows` VALUES (385, 385, 3, 0);
INSERT INTO `x2_quest2knows` VALUES (386, 386, 3, 0);
INSERT INTO `x2_quest2knows` VALUES (387, 387, 3, 0);
INSERT INTO `x2_quest2knows` VALUES (388, 388, 4, 0);
INSERT INTO `x2_quest2knows` VALUES (389, 389, 4, 0);
INSERT INTO `x2_quest2knows` VALUES (390, 390, 4, 0);
INSERT INTO `x2_quest2knows` VALUES (391, 391, 4, 0);
INSERT INTO `x2_quest2knows` VALUES (392, 392, 4, 0);
INSERT INTO `x2_quest2knows` VALUES (393, 393, 5, 0);
INSERT INTO `x2_quest2knows` VALUES (394, 394, 5, 0);
INSERT INTO `x2_quest2knows` VALUES (395, 395, 5, 0);
INSERT INTO `x2_quest2knows` VALUES (396, 396, 5, 0);
INSERT INTO `x2_quest2knows` VALUES (397, 397, 5, 0);
INSERT INTO `x2_quest2knows` VALUES (398, 398, 5, 0);
INSERT INTO `x2_quest2knows` VALUES (399, 399, 6, 0);
INSERT INTO `x2_quest2knows` VALUES (400, 400, 6, 0);
INSERT INTO `x2_quest2knows` VALUES (401, 401, 6, 0);
INSERT INTO `x2_quest2knows` VALUES (402, 402, 6, 0);
INSERT INTO `x2_quest2knows` VALUES (403, 403, 7, 0);
INSERT INTO `x2_quest2knows` VALUES (404, 404, 7, 0);
INSERT INTO `x2_quest2knows` VALUES (405, 405, 7, 0);
INSERT INTO `x2_quest2knows` VALUES (406, 406, 7, 0);
INSERT INTO `x2_quest2knows` VALUES (407, 407, 7, 0);
INSERT INTO `x2_quest2knows` VALUES (408, 408, 8, 0);
INSERT INTO `x2_quest2knows` VALUES (409, 409, 8, 0);
INSERT INTO `x2_quest2knows` VALUES (410, 410, 8, 0);
INSERT INTO `x2_quest2knows` VALUES (411, 411, 8, 0);
INSERT INTO `x2_quest2knows` VALUES (412, 412, 8, 0);
INSERT INTO `x2_quest2knows` VALUES (413, 413, 9, 0);
INSERT INTO `x2_quest2knows` VALUES (414, 414, 10, 0);
INSERT INTO `x2_quest2knows` VALUES (415, 415, 11, 0);
INSERT INTO `x2_quest2knows` VALUES (416, 416, 11, 0);
INSERT INTO `x2_quest2knows` VALUES (417, 417, 11, 0);
INSERT INTO `x2_quest2knows` VALUES (418, 418, 13, 0);
INSERT INTO `x2_quest2knows` VALUES (419, 419, 13, 0);
INSERT INTO `x2_quest2knows` VALUES (420, 420, 13, 0);
INSERT INTO `x2_quest2knows` VALUES (421, 421, 13, 0);
INSERT INTO `x2_quest2knows` VALUES (422, 422, 13, 0);
INSERT INTO `x2_quest2knows` VALUES (423, 423, 13, 0);
INSERT INTO `x2_quest2knows` VALUES (424, 424, 13, 0);
INSERT INTO `x2_quest2knows` VALUES (425, 425, 13, 0);
INSERT INTO `x2_quest2knows` VALUES (426, 426, 13, 0);
INSERT INTO `x2_quest2knows` VALUES (427, 427, 14, 0);
INSERT INTO `x2_quest2knows` VALUES (428, 428, 14, 0);
INSERT INTO `x2_quest2knows` VALUES (429, 429, 14, 0);
INSERT INTO `x2_quest2knows` VALUES (430, 430, 14, 0);
INSERT INTO `x2_quest2knows` VALUES (431, 431, 14, 0);
INSERT INTO `x2_quest2knows` VALUES (432, 432, 14, 0);
INSERT INTO `x2_quest2knows` VALUES (433, 433, 14, 0);
INSERT INTO `x2_quest2knows` VALUES (434, 434, 14, 0);
INSERT INTO `x2_quest2knows` VALUES (435, 435, 14, 0);
INSERT INTO `x2_quest2knows` VALUES (436, 436, 14, 0);
INSERT INTO `x2_quest2knows` VALUES (437, 437, 14, 0);
INSERT INTO `x2_quest2knows` VALUES (438, 438, 16, 0);
INSERT INTO `x2_quest2knows` VALUES (439, 439, 16, 0);
INSERT INTO `x2_quest2knows` VALUES (440, 440, 16, 0);
INSERT INTO `x2_quest2knows` VALUES (441, 441, 16, 0);
INSERT INTO `x2_quest2knows` VALUES (442, 442, 16, 0);
INSERT INTO `x2_quest2knows` VALUES (443, 443, 17, 0);
INSERT INTO `x2_quest2knows` VALUES (444, 444, 17, 0);
INSERT INTO `x2_quest2knows` VALUES (445, 445, 17, 0);
INSERT INTO `x2_quest2knows` VALUES (446, 446, 18, 0);
INSERT INTO `x2_quest2knows` VALUES (447, 447, 18, 0);
INSERT INTO `x2_quest2knows` VALUES (448, 448, 18, 0);
INSERT INTO `x2_quest2knows` VALUES (449, 449, 18, 0);
INSERT INTO `x2_quest2knows` VALUES (450, 450, 18, 0);
INSERT INTO `x2_quest2knows` VALUES (451, 451, 18, 0);
INSERT INTO `x2_quest2knows` VALUES (452, 452, 18, 0);
INSERT INTO `x2_quest2knows` VALUES (453, 453, 18, 0);
INSERT INTO `x2_quest2knows` VALUES (454, 454, 18, 0);
INSERT INTO `x2_quest2knows` VALUES (455, 455, 18, 0);
INSERT INTO `x2_quest2knows` VALUES (456, 456, 18, 0);
INSERT INTO `x2_quest2knows` VALUES (457, 457, 18, 0);
INSERT INTO `x2_quest2knows` VALUES (458, 458, 18, 0);
INSERT INTO `x2_quest2knows` VALUES (459, 459, 18, 0);
INSERT INTO `x2_quest2knows` VALUES (460, 460, 18, 0);
INSERT INTO `x2_quest2knows` VALUES (461, 461, 18, 0);
INSERT INTO `x2_quest2knows` VALUES (462, 462, 18, 0);
INSERT INTO `x2_quest2knows` VALUES (463, 463, 19, 0);
INSERT INTO `x2_quest2knows` VALUES (464, 464, 19, 0);
INSERT INTO `x2_quest2knows` VALUES (465, 465, 19, 0);
INSERT INTO `x2_quest2knows` VALUES (466, 466, 19, 0);
INSERT INTO `x2_quest2knows` VALUES (467, 467, 19, 0);
INSERT INTO `x2_quest2knows` VALUES (468, 468, 19, 0);
INSERT INTO `x2_quest2knows` VALUES (469, 469, 19, 0);
INSERT INTO `x2_quest2knows` VALUES (470, 470, 20, 0);
INSERT INTO `x2_quest2knows` VALUES (471, 471, 20, 0);
INSERT INTO `x2_quest2knows` VALUES (472, 472, 20, 0);
INSERT INTO `x2_quest2knows` VALUES (473, 473, 20, 0);
INSERT INTO `x2_quest2knows` VALUES (474, 474, 21, 0);
INSERT INTO `x2_quest2knows` VALUES (475, 475, 21, 0);
INSERT INTO `x2_quest2knows` VALUES (476, 476, 21, 0);
INSERT INTO `x2_quest2knows` VALUES (477, 477, 21, 0);
INSERT INTO `x2_quest2knows` VALUES (478, 478, 21, 0);
INSERT INTO `x2_quest2knows` VALUES (479, 479, 21, 0);
INSERT INTO `x2_quest2knows` VALUES (480, 480, 21, 0);
INSERT INTO `x2_quest2knows` VALUES (481, 481, 21, 0);
INSERT INTO `x2_quest2knows` VALUES (482, 482, 21, 0);
INSERT INTO `x2_quest2knows` VALUES (483, 483, 21, 0);
INSERT INTO `x2_quest2knows` VALUES (484, 484, 22, 0);
INSERT INTO `x2_quest2knows` VALUES (485, 485, 22, 0);
INSERT INTO `x2_quest2knows` VALUES (486, 486, 22, 0);
INSERT INTO `x2_quest2knows` VALUES (487, 487, 22, 0);
INSERT INTO `x2_quest2knows` VALUES (488, 488, 22, 0);
INSERT INTO `x2_quest2knows` VALUES (489, 489, 22, 0);
INSERT INTO `x2_quest2knows` VALUES (490, 490, 22, 0);
INSERT INTO `x2_quest2knows` VALUES (491, 491, 22, 0);
INSERT INTO `x2_quest2knows` VALUES (492, 492, 22, 0);
INSERT INTO `x2_quest2knows` VALUES (493, 493, 22, 0);
INSERT INTO `x2_quest2knows` VALUES (494, 494, 22, 0);
INSERT INTO `x2_quest2knows` VALUES (495, 495, 22, 0);
INSERT INTO `x2_quest2knows` VALUES (496, 496, 22, 0);
INSERT INTO `x2_quest2knows` VALUES (497, 497, 22, 0);
INSERT INTO `x2_quest2knows` VALUES (498, 498, 22, 0);
INSERT INTO `x2_quest2knows` VALUES (499, 499, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (500, 500, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (501, 501, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (502, 502, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (503, 503, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (504, 504, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (505, 505, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (506, 506, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (507, 507, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (508, 508, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (509, 509, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (510, 510, 23, 0);
INSERT INTO `x2_quest2knows` VALUES (511, 511, 24, 0);
INSERT INTO `x2_quest2knows` VALUES (512, 512, 24, 0);
INSERT INTO `x2_quest2knows` VALUES (513, 513, 24, 0);
INSERT INTO `x2_quest2knows` VALUES (514, 514, 24, 0);
INSERT INTO `x2_quest2knows` VALUES (515, 515, 24, 0);
INSERT INTO `x2_quest2knows` VALUES (516, 516, 24, 0);
INSERT INTO `x2_quest2knows` VALUES (517, 517, 25, 0);
INSERT INTO `x2_quest2knows` VALUES (518, 518, 25, 0);
INSERT INTO `x2_quest2knows` VALUES (519, 519, 25, 0);
INSERT INTO `x2_quest2knows` VALUES (520, 520, 25, 0);
INSERT INTO `x2_quest2knows` VALUES (521, 521, 25, 0);
INSERT INTO `x2_quest2knows` VALUES (522, 522, 25, 0);
INSERT INTO `x2_quest2knows` VALUES (523, 523, 25, 0);
INSERT INTO `x2_quest2knows` VALUES (524, 524, 25, 0);
INSERT INTO `x2_quest2knows` VALUES (525, 525, 25, 0);
INSERT INTO `x2_quest2knows` VALUES (526, 526, 25, 0);
INSERT INTO `x2_quest2knows` VALUES (527, 527, 25, 0);
INSERT INTO `x2_quest2knows` VALUES (528, 528, 26, 0);
INSERT INTO `x2_quest2knows` VALUES (529, 529, 26, 0);
INSERT INTO `x2_quest2knows` VALUES (530, 530, 26, 0);
INSERT INTO `x2_quest2knows` VALUES (531, 531, 26, 0);
INSERT INTO `x2_quest2knows` VALUES (532, 532, 26, 0);
INSERT INTO `x2_quest2knows` VALUES (533, 533, 27, 0);
INSERT INTO `x2_quest2knows` VALUES (534, 534, 27, 0);
INSERT INTO `x2_quest2knows` VALUES (535, 535, 27, 0);
INSERT INTO `x2_quest2knows` VALUES (536, 536, 27, 0);
INSERT INTO `x2_quest2knows` VALUES (537, 537, 27, 0);
INSERT INTO `x2_quest2knows` VALUES (538, 538, 27, 0);
INSERT INTO `x2_quest2knows` VALUES (539, 539, 27, 0);
INSERT INTO `x2_quest2knows` VALUES (540, 540, 27, 0);
INSERT INTO `x2_quest2knows` VALUES (541, 541, 27, 0);
INSERT INTO `x2_quest2knows` VALUES (542, 542, 27, 0);
INSERT INTO `x2_quest2knows` VALUES (543, 543, 28, 0);
INSERT INTO `x2_quest2knows` VALUES (544, 544, 28, 0);
INSERT INTO `x2_quest2knows` VALUES (545, 545, 28, 0);
INSERT INTO `x2_quest2knows` VALUES (546, 546, 28, 0);
INSERT INTO `x2_quest2knows` VALUES (547, 547, 29, 0);
INSERT INTO `x2_quest2knows` VALUES (548, 548, 29, 0);
INSERT INTO `x2_quest2knows` VALUES (549, 549, 29, 0);
INSERT INTO `x2_quest2knows` VALUES (550, 550, 30, 0);
INSERT INTO `x2_quest2knows` VALUES (551, 551, 30, 0);
INSERT INTO `x2_quest2knows` VALUES (552, 552, 30, 0);
INSERT INTO `x2_quest2knows` VALUES (553, 553, 30, 0);
INSERT INTO `x2_quest2knows` VALUES (554, 554, 30, 0);
INSERT INTO `x2_quest2knows` VALUES (555, 555, 30, 0);
INSERT INTO `x2_quest2knows` VALUES (556, 556, 31, 0);
INSERT INTO `x2_quest2knows` VALUES (557, 557, 31, 0);
INSERT INTO `x2_quest2knows` VALUES (558, 558, 32, 0);
INSERT INTO `x2_quest2knows` VALUES (559, 559, 32, 0);
INSERT INTO `x2_quest2knows` VALUES (560, 560, 32, 0);
INSERT INTO `x2_quest2knows` VALUES (561, 561, 32, 0);
INSERT INTO `x2_quest2knows` VALUES (562, 562, 32, 0);
INSERT INTO `x2_quest2knows` VALUES (563, 563, 32, 0);
INSERT INTO `x2_quest2knows` VALUES (564, 564, 32, 0);
INSERT INTO `x2_quest2knows` VALUES (565, 565, 32, 0);
INSERT INTO `x2_quest2knows` VALUES (566, 566, 32, 0);
INSERT INTO `x2_quest2knows` VALUES (567, 567, 32, 0);
INSERT INTO `x2_quest2knows` VALUES (568, 568, 32, 0);
INSERT INTO `x2_quest2knows` VALUES (569, 569, 32, 0);
INSERT INTO `x2_quest2knows` VALUES (570, 570, 32, 0);
INSERT INTO `x2_quest2knows` VALUES (571, 571, 33, 0);

-- ----------------------------
-- Table structure for x2_questionanalysis
-- ----------------------------
DROP TABLE IF EXISTS `x2_questionanalysis`;
CREATE TABLE `x2_questionanalysis`  (
  `qaid` int(11) NOT NULL AUTO_INCREMENT,
  `qabasicid` int(11) NULL DEFAULT NULL,
  `qaquestionid` int(11) NULL DEFAULT NULL,
  `qauserid` int(11) NULL DEFAULT NULL,
  `qanumber` int(11) NULL DEFAULT NULL,
  `qarightnumber` int(11) NULL DEFAULT NULL,
  `qawrongnumber` int(11) NULL DEFAULT NULL,
  `qalasttime` int(11) NULL DEFAULT NULL,
  `qafirststatus` int(1) NULL DEFAULT NULL,
  `qalaststatus` int(1) NULL DEFAULT NULL,
  `qarate` int(11) NULL DEFAULT NULL,
  `qaqnparent` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`qaid`) USING BTREE,
  INDEX `qabasicid`(`qabasicid`) USING BTREE,
  INDEX `qaquestionid`(`qaquestionid`) USING BTREE,
  INDEX `qauserid`(`qauserid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for x2_questionrows
-- ----------------------------
DROP TABLE IF EXISTS `x2_questionrows`;
CREATE TABLE `x2_questionrows`  (
  `qrid` int(11) NOT NULL AUTO_INCREMENT,
  `qrtype` tinyint(4) NOT NULL DEFAULT 2,
  `qrquestion` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qrknowsid` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qrlevel` int(1) NOT NULL DEFAULT 0,
  `qrnumber` int(4) NOT NULL DEFAULT 0,
  `qruserid` int(11) NOT NULL DEFAULT 0,
  `qrusername` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `qrlastmodifyuser` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `qrtime` int(11) NOT NULL DEFAULT 0,
  `qrstatus` tinyint(1) NOT NULL DEFAULT 1,
  `qrdeler` varchar(72) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qrdeltime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`qrid`) USING BTREE,
  INDEX `qrlevel`(`qrlevel`, `qrnumber`) USING BTREE,
  INDEX `qruserid`(`qruserid`) USING BTREE,
  INDEX `qrtime`(`qrtime`) USING BTREE,
  INDEX `qrstatus`(`qrstatus`) USING BTREE,
  INDEX `qrtype`(`qrtype`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x2_questions
-- ----------------------------
DROP TABLE IF EXISTS `x2_questions`;
CREATE TABLE `x2_questions`  (
  `questionid` int(11) NOT NULL AUTO_INCREMENT,
  `questiontype` int(3) NOT NULL DEFAULT 0,
  `question` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `questionuserid` int(11) NOT NULL DEFAULT 0,
  `questionusername` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `questionlastmodifyuser` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `questionselect` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `questionselectnumber` tinyint(11) NOT NULL DEFAULT 0,
  `questionanswer` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `questiondescribe` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `questionknowsid` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `questioncreatetime` int(11) NOT NULL DEFAULT 0,
  `questionstatus` int(1) NOT NULL DEFAULT 1,
  `questionhtml` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `questionparent` int(11) NOT NULL DEFAULT 0,
  `questionsequence` int(3) NOT NULL DEFAULT 0,
  `questionlevel` int(1) NOT NULL DEFAULT 0,
  `questiondeler` varchar(72) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `questiondeltime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`questionid`) USING BTREE,
  INDEX `questioncreatetime`(`questioncreatetime`) USING BTREE,
  INDEX `questiontype`(`questiontype`) USING BTREE,
  INDEX `questionstatus`(`questionstatus`) USING BTREE,
  INDEX `questionuserid`(`questionuserid`) USING BTREE,
  INDEX `questionparent`(`questionparent`, `questionsequence`) USING BTREE,
  INDEX `questionlevel`(`questionlevel`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 572 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x2_questions
-- ----------------------------
INSERT INTO `x2_questions` VALUES (1, 1, '中国近代史上第一个具有资本主义色彩的改革和建设方案是', 1, 'peadmin', '', '&lt;p&gt;A. 《海国图志》&lt;/p&gt;&lt;p&gt;B. 《资政新篇》&lt;/p&gt;&lt;p&gt;C. 《天朝田亩制度》&lt;/p&gt;&lt;p&gt;D. 《变法通议》&lt;/p&gt;', 4, 'B', '太平天国颁布的中国近代史上第一个具有资本主义 色彩的改革和建设方案是《资政新篇》。太平天国的两个纲领性文件是考试的重点，要很好地领会这两个文件的性质和主要内容.', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"4\";s:5:\"knows\";s:43:\"第一节 农民群众斗争风暴的起落\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (2, 1, '北伐战争期间，中国人民取得反帝斗争的一次重大胜利是', 1, 'peadmin', '', '&lt;p&gt;A. 废除不平等条约&lt;/p&gt;&lt;p&gt;B. 收回关税自主权&lt;/p&gt;&lt;p&gt;C. 汉口、九江人民收回英租界&lt;/p&gt;&lt;p&gt;D. 废除领事裁判权&lt;/p&gt;', 4, 'C', '1927年2月，国民政府外交部同英国方面签订协定，收回了汉口、九江的英租界。这是中国人民反帝斗争取得的重大胜利。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"11\";s:5:\"knows\";s:37:\"第三节 国共合作与国民革命\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (3, 1, '成为民主革命时期，中国共产党历史上一个生死攸关的转折点的会议是', 1, 'peadmin', '', '&lt;p&gt;A. 八七会议&lt;/p&gt;&lt;p&gt;B. 洛川会议&lt;/p&gt;&lt;p&gt;C. 中共六大&lt;/p&gt;&lt;p&gt;D. 遵义会议&lt;/p&gt;', 4, 'D', '本题备选项中的A 项“八七会议”是由大革命失败到土地 革命战争兴起的一个历史转折点；B 项“洛川会议”则是在全民族抗日战争爆发后的1937 年 8月召开的，这次会议通过了《抗日救国十大纲领》；C 项“中共 六大”明确肯定了农村根据 地和红军是决定革命新高潮的更大的发展基础和重要力量。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"14\";s:5:\"knows\";s:46:\"第三节 中国革命在探索中曲折前进\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (4, 1, '1940年八路军在华北发动的大规模破袭进攻战是', 1, 'peadmin', '', '&lt;p&gt;A. 平型关战役&lt;/p&gt;&lt;p&gt;B. 百团大战&lt;/p&gt;&lt;p&gt;C. 太原会战&lt;/p&gt;&lt;p&gt;D. 徐州会战&lt;/p&gt;', 4, 'B', '1940年，八路军调集一百多个团在大规模的破袭进攻战，即百团大战。故选B。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"18\";s:5:\"knows\";s:58:\"第四节 中国共产党成为抗日战争的中流砥柱\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (5, 1, '1901年，清政府与十一个国家签订的不平等条约是', 1, 'peadmin', '', '&lt;p&gt;A. 《马关条约》&lt;/p&gt;&lt;p&gt;B. 《江宁条约》&lt;/p&gt;&lt;p&gt;C. 《北京条约》&lt;/p&gt;&lt;p&gt;D. 《辛丑条约》&lt;/p&gt;', 4, 'D', '1900年，八国联军发动侵华战争，1901年，清政府与十一个国家签订《辛丑条约》；《江宁条约》又称《南京条约》是1842 年清政府与英国签订的；《北京条约》是1860 年清政府分别与英、法、俄签订的；《马 关条约》是1895 年清政府与日本签订的。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (6, 1, '1912年3月，南京临时参议院颁布了中国历史上第一部具有资产阶级共和国宪法性质的法典。它是', 1, 'peadmin', '', '&lt;p&gt;A. 《中华民国约法》&lt;/p&gt;&lt;p&gt;B. 《中华民国法典》&lt;/p&gt;&lt;p&gt;C. 《中华民国临时约法》&lt;/p&gt;&lt;p&gt;D. 《中华民国暂行约法》&lt;/p&gt;', 4, 'C', '1912年3月，临时参议院颁布《中华民国临时约法》。这是中国历史上第一部具有资产阶级共和国宪法性质的法典。临时参议院颁布的只能是“临时约法”。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"8\";s:5:\"knows\";s:40:\"第二节 辛亥革命的胜利与失败\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (7, 1, '1920年，中国共产党的最早组织建立于', 1, 'peadmin', '', '&lt;p&gt;A. 北京&lt;/p&gt;&lt;p&gt;B. 长沙&lt;/p&gt;&lt;p&gt;C. 武汉&lt;/p&gt;&lt;p&gt;D. 上海&lt;/p&gt;', 4, 'D', '1920年，中国共产党的最早组织建立于上海', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"10\";s:5:\"knows\";s:55:\"第二节 马克思主义传播与中国共产党诞生\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (8, 1, '成为第一次工人运动高潮的起点的罢工是', 1, 'peadmin', '', '&lt;p&gt;A. 京汉铁路工人大罢工&lt;/p&gt;&lt;p&gt;B. 香港海员大罢工&lt;/p&gt;&lt;p&gt;C. 安源路矿工人大罢工&lt;/p&gt;&lt;p&gt;D. 省港大罢工&lt;/p&gt;', 4, 'B', '1922年1月，香港海 员为要求增加工资举行罢工。这是中国工人阶级第一次直接同帝国主义势力进行的有组织的较量，成为第一次工人运动高潮的起点。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"10\";s:5:\"knows\";s:55:\"第二节 马克思主义传播与中国共产党诞生\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (9, 1, '1933年5月成立的察哈尔民众抗日同盟军，其主要领导人是', 1, 'peadmin', '', '&lt;p&gt;A. 冯玉祥、吉鸿昌&lt;/p&gt;&lt;p&gt;B. 冯玉祥、董振堂&lt;/p&gt;&lt;p&gt;C. 赵博生、董振堂&lt;/p&gt;&lt;p&gt;D. 蔡廷锴、蒋光鼐&lt;/p&gt;', 4, 'A', '1933年5月，原西北军将领冯玉祥在张家口成立察哈尔抗日同盟军，并任同盟军总司令。在同盟军中工作的共产党员约有300人。同盟军北路前敌总指挥吉鸿昌不久加入中国共产党（后被国民党当局杀害）。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"16\";s:5:\"knows\";s:43:\"第二节 从局部抗战到全国性抗战\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (10, 1, '1947年10月，被国民党当局宣布为“非法团体”的是', 1, 'peadmin', '', '&lt;p&gt;A. 中国国民党革命委员会&lt;/p&gt;&lt;p&gt;B. 中国民主同盟&lt;/p&gt;&lt;p&gt;C. 中国民主建国会&lt;/p&gt;&lt;p&gt;D. 中国民主促进会&lt;/p&gt;', 4, 'B', '1947年10月，国民党 当局宣布中国民主同盟为“非法团体”，明令对该组织及其成员的一切活动“严加取缔”。  同年 11月，民盟总部被迫发表公告，通告盟员自即日起一律停止政治活动，民盟总部即日解散。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"22\";s:5:\"knows\";s:58:\"第三节 人民共和国：中国人民的历史性选择\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (11, 1, '我国第一批对外开放的经济特区是', 1, 'peadmin', '', '&lt;p&gt;A. 深圳、珠海、广州、厦门&lt;/p&gt;&lt;p&gt;B. 深圳、广州、厦门、汕头&lt;/p&gt;&lt;p&gt;C. 深圳、广州、福州、厦门&lt;/p&gt;&lt;p&gt;D. 深圳、珠海、汕头、厦门&lt;/p&gt;', 4, 'D', '1980 年 5月，中央决定在深圳、珠海、汕头、厦门设立经济特区，采取多种形式吸引和利用外资，学习国外的先进技术和经营管理方法。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"29\";s:5:\"knows\";s:58:\"第一节 历史性的伟大转折和改革开放的起步\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (12, 1, '近代中国的社会性质是', 1, 'peadmin', '', '&lt;p&gt;A. 封建社会&lt;/p&gt;&lt;p&gt;B. 资本主义社会&lt;/p&gt;&lt;p&gt;C. 半殖民地半封建社会&lt;/p&gt;&lt;p&gt;D. 殖民地社会&lt;/p&gt;', 4, 'C', '近代中国，一方面国家政权仍然存在，而主权受制于外国列强的半殖民地社会；另一方面出现了资本主义生产关系，不再是完全意义上的封建社会，而是半封建社会了。故近代中国的社会性质是半殖民地半封建社会。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (13, 1, '中国近代史上，中国人民第一次大规模的反侵略武装斗争是', 1, 'peadmin', '', '&lt;p&gt;A. 虎门销烟&lt;/p&gt;&lt;p&gt;B. 三元里人民抗英斗争&lt;/p&gt;&lt;p&gt;C. 太平天国起义&lt;/p&gt;&lt;p&gt;D. 义和团运动&lt;/p&gt;', 4, 'B', '在中国近代史上，中国人民进行过1大规模的反侵略武装斗争。这道题问的是“第一次”，因此，正确答案是B。在复习中，对中国近现代历史上的“第一次”，要多加注意，这往往是单项选择题的命题内容。A 项“虎门销烟”，具有反侵略的意义，但是它不是武装斗争；C，D两项都在三元里人民抗英斗争之后，所以不是“第一次”。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"3\";s:5:\"knows\";s:58:\"第三节 抵御外来侵略、争取民族独立的斗争\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (14, 1, '太平天国由盛转衰的转折点是', 1, 'peadmin', '', '&lt;p&gt;A. 金田起义&lt;/p&gt;&lt;p&gt;B. 永安建制&lt;/p&gt;&lt;p&gt;C. 《天朝田亩制度》的颁布&lt;/p&gt;&lt;p&gt;D. 天京事变&lt;/p&gt;', 4, 'D', '1856年9月，太平天国领导集团内部发生了一场严重事变即天京事变，导致东王杨秀清、北王韦昌辉先后被杀，翼王石达开率部出走后败亡。这场事变成为太平天国由盛转衰的转折点。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"4\";s:5:\"knows\";s:43:\"第一节 农民群众斗争风暴的起落\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (15, 1, '洋务派创办的官督商办的民用企业的性质基本上是', 1, 'peadmin', '', '&lt;p&gt;A. 资本主义性质&lt;/p&gt;&lt;p&gt;B. 封建主义性质&lt;/p&gt;&lt;p&gt;C. 半封建性质&lt;/p&gt;&lt;p&gt;D. 半殖民地性质&lt;/p&gt;', 4, 'A', '洋务派创办的官督 商办的民用企业虽然受官僚的控制，发展受到很大的限制，但基本上是资本主义性质的近代企业。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"5\";s:5:\"knows\";s:61:\"第二节 地主阶级统治集团“自救”活动的兴衰\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (16, 1, '近代中国第一个资产阶级革命团体是', 1, 'peadmin', '', '&lt;p&gt;A. 兴中会&lt;/p&gt;&lt;p&gt;B. 华兴会&lt;/p&gt;&lt;p&gt;C. 光复会&lt;/p&gt;&lt;p&gt;D. 岳王会&lt;/p&gt;', 4, 'A', '1894年，孙中山在檀香山组织了中国第一个资产阶级革命组织——兴中会。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"7\";s:5:\"knows\";s:49:\"第一节 举起近代民族民主革命的旗帜\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (17, 1, '袁世凯建立的北洋军阀政权代表的是', 1, 'peadmin', '', '&lt;p&gt;A. 大地主和买办资产阶级的利益&lt;/p&gt;&lt;p&gt;B. 大资产阶级的利益&lt;/p&gt;&lt;p&gt;C. 民族资本家和中小资产阶级的利益&lt;/p&gt;&lt;p&gt;D. 无产阶级和广大人民的利益&lt;/p&gt;', 4, 'A', '袁世凯建立的北洋军阀政权集中地主和买办资产阶级的利益，实行军阀官僚的专制统治。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"8\";s:5:\"knows\";s:40:\"第二节 辛亥革命的胜利与失败\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (18, 1, '辛亥革命前夕爆发的保路运动中，斗争尤为激烈的省份是', 1, 'peadmin', '', '&lt;p&gt;A. 广东&lt;/p&gt;&lt;p&gt;B. 湖北&lt;/p&gt;&lt;p&gt;C. 湖南&lt;/p&gt;&lt;p&gt;D. 四川&lt;/p&gt;', 4, 'D', '1911年5月，保路运动兴起，四川省斗争尤其激烈，在同盟会会员的参与下，掀起了全川的武装暴动。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"8\";s:5:\"knows\";s:40:\"第二节 辛亥革命的胜利与失败\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (19, 1, '新文化运动中的第一篇白话文小说是', 1, 'peadmin', '', '&lt;p&gt;A. 《阿Q 正传》&lt;/p&gt;&lt;p&gt;B. 《祝福》&lt;/p&gt;&lt;p&gt;C. 《狂人日记》&lt;/p&gt;&lt;p&gt;D. 《故乡》&lt;/p&gt;', 4, 'C', '1918年5月，鲁迅发表《狂人日己》，这是新文化运动的第一篇白话文小说。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"9\";s:5:\"knows\";s:40:\"第一节 新文化运动与五四运动\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (20, 1, '共产党早期组织领导的第一个产业工会是', 1, 'peadmin', '', '&lt;p&gt;A. 上海印刷工会&lt;/p&gt;&lt;p&gt;B. 上海机器工会&lt;/p&gt;&lt;p&gt;C. 上海纺织工会&lt;/p&gt;&lt;p&gt;D. 北京工人俱乐部&lt;/p&gt;', 4, 'B', '1920年11月，李中主持成立了共产党早期组织领导的第一个产业工会一—一上海机器工会。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"10\";s:5:\"knows\";s:55:\"第二节 马克思主义传播与中国共产党诞生\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (21, 1, '中共三大的中心议题是', 1, 'peadmin', '', '&lt;p&gt;A. 提出民主革命纲领&lt;/p&gt;&lt;p&gt;B. 讨论国共合作，建立革命统一战线问题&lt;/p&gt;&lt;p&gt;C. 制订开展工农运动计划&lt;/p&gt;&lt;p&gt;D. 批评陈独秀的右倾错误&lt;/p&gt;', 4, 'B', '1923年6月，中共三大集中讨论革命统一战线的问题，制定了建立革命统一战线的方针政策，有力推动了第一次国共合作的形成。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"11\";s:5:\"knows\";s:37:\"第三节 国共合作与国民革命\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (22, 1, '对1927 年后共产党领导的红军和根据地斗争经验的科学概括是', 1, 'peadmin', '', '&lt;p&gt;A. 以城市为中心然后向农村发展&lt;/p&gt;&lt;p&gt;B. 坚持党对军队的领导&lt;/p&gt;&lt;p&gt;C. 农村包围城市、武装夺取政权&lt;/p&gt;&lt;p&gt;D. 坚持党的建设&lt;/p&gt;', 4, 'C', '1930年1月，毛泽东的《星星之火，可以燎原》在实际上批评了共产国际和中共党内，某些人坚持的“城市中心论”，提出了以乡村为中心的思想，初步形成了农村包围城市、武装夺取政权的理论。农村包围城市、武装夺取政权的理论，是对1927 年后共产党领导的红军和根据地斗争经验的科学概括。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"13\";s:5:\"knows\";s:58:\"第二节 中国共产党对革命新道路的艰苦探索\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (23, 1, '中华苏维埃共和国实行', 1, 'peadmin', '', '&lt;p&gt;A. 人民代表大会制度&lt;/p&gt;&lt;p&gt;B. 各级工农兵代表大会制度&lt;/p&gt;&lt;p&gt;C. 代议制&lt;/p&gt;&lt;p&gt;D. “三三制”&lt;/p&gt;', 4, 'B', '中华苏维埃共和国实行各级工农代表大崙制度。A 项“人民代表大会制度”是新中国成立后1954年正式实行的政治制度。是当代中国的根本治制度；C 项是现代国家普遍实行的一种间接民主的形式；D项“三三制”是在抗日战争时期，中国共产党在抗日根据地实行的制度，复习时要注意分辨。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"14\";s:5:\"knows\";s:46:\"第三节 中国革命在探索中曲折前进\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (24, 1, '毛泽东明确提出“马克思主义的中国化”命题是在', 1, 'peadmin', '', '&lt;p&gt;A. 瓦窑堡会议&lt;/p&gt;&lt;p&gt;B. 洛川会议&lt;/p&gt;&lt;p&gt;C. 中共六届六中全会&lt;/p&gt;&lt;p&gt;D. 中共七大&lt;/p&gt;', 4, 'C', '1938年9月至11月，中国共产党在延安举行了扩大的六届六中全会。在这次全会上，毛泽东明确地提出了“马克思主义的中国化”这个命题。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"18\";s:5:\"knows\";s:58:\"第四节 中国共产党成为抗日战争的中流砥柱\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (25, 1, '毛泽东思想作为党的指导思想确立于', 1, 'peadmin', '', '&lt;p&gt;A. 遵义会议&lt;/p&gt;&lt;p&gt;B. 1942 年整风运动&lt;/p&gt;&lt;p&gt;C. 中共七大&lt;/p&gt;&lt;p&gt;D. 中共八大&lt;/p&gt;', 4, 'C', '中共七大将以毛泽东为主要代表的中国共产党人把马克思列宁主义基本原理同中国具体实际相结合所创造的理论成果，正式命名为毛泽东思想，并将毛泽东思想规定为党的一切工作的指针。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"18\";s:5:\"knows\";s:58:\"第四节 中国共产党成为抗日战争的中流砥柱\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (26, 1, '从法律上正式确立了中国共产党在全国的执政地位的文献是', 1, 'peadmin', '', '&lt;p&gt;A. 中共七大党章&lt;/p&gt;&lt;p&gt;B. 中共七届二中全会报告&lt;/p&gt;&lt;p&gt;C. 《中国人民政治协商会议共同纲领》&lt;/p&gt;&lt;p&gt;D. 1954 年《中华人民共和国宪法》&lt;/p&gt;', 4, 'C', '《中国人民政治协商会议共同纲领》关于国体和政体的规定从法律上正式确立了中国共产党在全国的执政地位，因为中国工人阶级对国家的领导是要通过它的先锋队—一中国共产党来实现的。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"22\";s:5:\"knows\";s:58:\"第三节 人民共和国：中国人民的历史性选择\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (27, 1, '“文化大革命”中全面内乱形成于', 1, 'peadmin', '', '&lt;p&gt;A. “五一六通知”的发布&lt;/p&gt;&lt;p&gt;B. 毛泽东写出“炮打司令部”的大字报&lt;/p&gt;&lt;p&gt;C. 上海造反派“一月革命”的发动&lt;/p&gt;&lt;p&gt;D. 毛泽东开始接见红卫兵&lt;/p&gt;', 4, 'C', '1967年1月，上海造反派头目王洪文等人在张春桥、姚文元的策划下，夺取了中共上海市委、市人民委员会的领导权，号称“一月革命”，在全国掀起了“打倒一切、全面内战”的狂潮，全 面内乱形成。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"27\";s:5:\"knows\";s:34:\"第二节 探索中的严重曲折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (28, 1, '毛泽东提出“须知政权是由枪杆子中取得的”的著名论断的会议是', 1, 'peadmin', '', '&lt;p&gt;A. 中共四大&lt;/p&gt;&lt;p&gt;B. 中共六大&lt;/p&gt;&lt;p&gt;C. 八七会议&lt;/p&gt;&lt;p&gt;D. 遵义会议&lt;/p&gt;', 4, 'C', '1927年8月7日，中共中央在汉口秘密召开紧急会议(即八七会议)。毛泽东在发言中着重阐述了农民问题和武装斗争对于中国革命的极端重要性，强调党“以后要非常注意军事。须知政权是由枪杆子中取得的”。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"13\";s:5:\"knows\";s:58:\"第二节 中国共产党对革命新道路的艰苦探索\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (29, 1, '抗日根据地建设的首要的、根本的任务是', 1, 'peadmin', '', '&lt;p&gt;A. 加强文化建设&lt;/p&gt;&lt;p&gt;B. 加强经济建设&lt;/p&gt;&lt;p&gt;C. 加强政权建设&lt;/p&gt;&lt;p&gt;D. 加强社会建设&lt;/p&gt;', 4, 'C', '加强政权建设，是抗日根据地建设的首要的、根本的任务。抗日根据地的政权，是中国共产党领导下的抗日民族统一战线性质的政权，它以工农联盟为基础，是共产党领导的一切赞成抗日又赞成民主的几个革命阶级联合的政权，具有广泛的社会基础。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"18\";s:5:\"knows\";s:58:\"第四节 中国共产党成为抗日战争的中流砥柱\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (30, 1, '标志着毛泽东思想得到多方面展开而达到成熟的是', 1, 'peadmin', '', '&lt;p&gt;A. 新民主主义理论的系统阐明&lt;/p&gt;&lt;p&gt;B. 农村包围城市，武装夺取政权道路理论的系统阐述&lt;/p&gt;&lt;p&gt;C. 社会主义改造理论的系统阐明&lt;/p&gt;&lt;p&gt;D. 社会主义建设思想的系统阐述&lt;/p&gt;', 4, 'A', '毛泽东撰写了《&lt;共产党人&gt;发刊中国革命和中国共产党》《新民主主义论》等一批重要理论著作，系统地阐释了中国共产党的新民主主义理论。新民主主义理论是以毛泽东为主要代表的中国共产党人把马 克思主义基本原理同中国革命具 体实际相结合的理论成果。新民主主义理论的系统阐明，标志着毛泽东思想得到多方面展开而达到成熟。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"18\";s:5:\"knows\";s:58:\"第四节 中国共产党成为抗日战争的中流砥柱\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (31, 1, '第一个五年计划期间建成的第一座长江大桥位于', 1, 'peadmin', '', '&lt;p&gt;A. 南京&lt;/p&gt;&lt;p&gt;B. 九江&lt;/p&gt;&lt;p&gt;C. 武汉&lt;/p&gt;&lt;p&gt;D. 重庆&lt;/p&gt;', 4, 'C', '第一个五年计划期间，中国着重建设了一大批基础性的重点工程。如1957年，第一座长江大桥在武汉竣工通车。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"25\";s:5:\"knows\";s:46:\"第三节 开辟中国社会主义改造道路\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (32, 1, '以邓小平同志为核心的党的第二代领导集体形成于', 1, 'peadmin', '', '&lt;p&gt;A. “文化大革命”的结束&lt;/p&gt;&lt;p&gt;B. 十一届三中全会&lt;/p&gt;&lt;p&gt;C. 党的十二大&lt;/p&gt;&lt;p&gt;D. 十四届三中全会&lt;/p&gt;', 4, 'B', '1978年12月召开的十一届三中开始了中国共产党在思想、政治、组织等领域的全面拨乱反正，形成了以邓小平为核心的党的第二代中央领导集体，揭开了社会主义改革开放的序幕。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"29\";s:5:\"knows\";s:58:\"第一节 历史性的伟大转折和改革开放的起步\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (33, 1, '邓小平明确提出“建设有中国特色的社会主义”命题的会议是', 1, 'peadmin', '', '&lt;p&gt;A. 十一届三中全会&lt;/p&gt;&lt;p&gt;B. 十二大&lt;/p&gt;&lt;p&gt;C. 十三大&lt;/p&gt;&lt;p&gt;D. 十四大&lt;/p&gt;', 4, 'B', '1982年9月，邓小平在中共十二大开幕词中提出，“把马克思主义的普遍真理同我国的具体实际结合起来，走自己的道路，建设有中国特色的社会主义”。这是总结党的长期历史经验得出的基本结论，成为新时期指引全党和全国人民前进的旗帜。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"30\";s:5:\"knows\";s:58:\"第二节 改革开放和现代化建设新局面的展开\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (34, 1, '1957年整风运动的主题是', 1, 'peadmin', '', '&lt;p&gt;A. 正确处理人民内部矛盾&lt;/p&gt;&lt;p&gt;B. 加强执政党建设&lt;/p&gt;&lt;p&gt;C. 改进党的作风&lt;/p&gt;&lt;p&gt;D. 批评与自我批评&lt;/p&gt;', 4, 'A', '1957年4月27日，中共中央正式发出《关于整风运动的指示》，整风运动全面展开。这次整风运动，主题是正确处理人民内部矛盾。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"26\";s:5:\"knows\";s:25:\"第一节 良好的开局\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (35, 1, '1981年6月中共十一届六中全会通过的文件是', 1, 'peadmin', '', '&lt;p&gt;A. 《关于党的若干历史问题的决议》&lt;/p&gt;&lt;p&gt;B. 《关于建国以来党的若干历史问题的决议》&lt;/p&gt;&lt;p&gt;C. 《关于社会主义精神文明建设的决议》&lt;/p&gt;&lt;p&gt;D. 《关于建立社会主义市场经济体制的决定》&lt;/p&gt;', 4, 'B', '1981年6月，中共十一届 六中全会通过了《关于建国以来党的若干历史问题的决议》（简称“第二个历史决议”）。该决议从根本上，否定了“文化大革命”的理论和实践，对新中国成乓以来的重大历史事件作出了基本结论。该决议的通过，标志着指导思想上拨乱反正的胜利完成。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"29\";s:5:\"knows\";s:58:\"第一节 历史性的伟大转折和改革开放的起步\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (36, 1, '毛泽东提出实现马克思主义同中国实际“第二次结合”是在', 1, 'peadmin', '', '&lt;p&gt;A. 1956 年中共中央书记处会议&lt;/p&gt;&lt;p&gt;B. 1956 年中央政治局扩大会议&lt;/p&gt;&lt;p&gt;C. 1957 年最高国务会议&lt;/p&gt;&lt;p&gt;D. 1956 年中共八大&lt;/p&gt;', 4, 'A', '1956年4月初，在中共中央书记处会议上，毛泽东提出：最重要的是独立自主，调查研究，摸清本国国情，把马克思列宁主义的基本原理同我国革命和建设的具体实际结合起来；现在是社会主义革命和建设时期，我们要进行第二次结合，找出在中国进行社会主义革命和建设的正确道路。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"26\";s:5:\"knows\";s:25:\"第一节 良好的开局\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (37, 1, '《论十大关系》报告提出社会主义文化建设的新方针', 1, 'peadmin', '', '&lt;p&gt;A. 古为今用，洋为中用&lt;/p&gt;&lt;p&gt;B. 推陈出新&lt;/p&gt;&lt;p&gt;C. 百花齐放，百家争鸣&lt;/p&gt;&lt;p&gt;D. 大鸣大放&lt;/p&gt;', 4, 'C', '《论十大关系》报告中提出了“双百”方针这一社会主义文化建设的新方针。在之后的中共中央政治局扩大会议上，毛泽东进一步提出：“艺术问题上的百花齐放，学术问题上的百家争鸣，我看应该成为我们的方针。”', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"26\";s:5:\"knows\";s:25:\"第一节 良好的开局\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (38, 1, '中共八大的指导思想是', 1, 'peadmin', '', '&lt;p&gt;A. 调动一切积极因素，进行社会主义现代化建设&lt;/p&gt;&lt;p&gt;B. 正确处理人民内部矛盾&lt;/p&gt;&lt;p&gt;C. 加强人民民主专政，加强各民族的团结&lt;/p&gt;&lt;p&gt;D. 积极探索适合中国国情的经济体制&lt;/p&gt;', 4, 'A', '中共八大的指导思想是调动一切积极因素，进行社会主义现代化建设', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"26\";s:5:\"knows\";s:25:\"第一节 良好的开局\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (39, 1, '中共八大提出当前党和全国人民的主要任务是', 1, 'peadmin', '', '&lt;p&gt;A. 集中力量发展生产力&lt;/p&gt;&lt;p&gt;B. 重点发展重工业&lt;/p&gt;&lt;p&gt;C. 加强人民民主专政&lt;/p&gt;&lt;p&gt;D. 健全党外民主法制&lt;/p&gt;', 4, 'A', '中共八大明确提出：党和全国人民的当前的主要任务是集中力量发展生产力，把我国尽快地从落后的农业国变为先进的工业国。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"26\";s:5:\"knows\";s:25:\"第一节 良好的开局\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (40, 1, '毛泽东提出社会主义改造完成后，国家政治生活的主题应该是', 1, 'peadmin', '', '&lt;p&gt;A. 社会主义建设&lt;/p&gt;&lt;p&gt;B. 满足人民物质文化需求&lt;/p&gt;&lt;p&gt;C. 完善社会主义制度&lt;/p&gt;&lt;p&gt;D. 正确处理人民内部矛盾&lt;/p&gt;', 4, 'D', '1957年2月，毛泽东在扩大的最高国务会议上发表《关于正确处理人民内部矛盾的问题》的讲话，提出要把正确处理人民内部矛盾作为国家政治生活的主题。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"26\";s:5:\"knows\";s:25:\"第一节 良好的开局\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (41, 1, '1958年提出的社会主义建设总路线的缺点是', 1, 'peadmin', '', '&lt;p&gt;A. 高指标&lt;/p&gt;&lt;p&gt;B. 多、快、好、省&lt;/p&gt;&lt;p&gt;C. 浮夸风&lt;/p&gt;&lt;p&gt;D. 忽视客观规律&lt;/p&gt;', 4, 'D', '社会主义建设总路线，其正确的一面，是反映了广大人民群众迫切要求改变国家经济文化落后状况的普遍愿望；其缺点是忽视了客观的经济规律。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"27\";s:5:\"knows\";s:34:\"第二节 探索中的严重曲折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (42, 1, '人民公社的特点是', 1, 'peadmin', '', '&lt;p&gt;A. 高度集中制&lt;/p&gt;&lt;p&gt;B. 一大二公&lt;/p&gt;&lt;p&gt;C. 三级所有&lt;/p&gt;&lt;p&gt;D. 统分结合&lt;/p&gt;', 4, 'B', '人民公社实行“政社合一”的体制，其基本特点被概括为“一大二公”，实际上就是搞“一平二调”。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"27\";s:5:\"knows\";s:34:\"第二节 探索中的严重曲折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (43, 1, '标志着开始初步纠正“左”的错误的会议', 1, 'peadmin', '', '&lt;p&gt;A. 中共八届六中全会&lt;/p&gt;&lt;p&gt;B. 第一次郑州会议&lt;/p&gt;&lt;p&gt;C. 第二次郑州会议&lt;/p&gt;&lt;p&gt;D. 武昌中共中央政治局扩大会议&lt;/p&gt;', 4, 'B', '1958年秋冬之间，毛泽东发现“大跃进”和人民公社化运动出了不少乱子，着手纠正已经察觉到的问题。这年 l1月，毛泽东主持召开了第一次郑州会议，开始初步纠正“左”的错误。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"27\";s:5:\"knows\";s:34:\"第二节 探索中的严重曲折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (44, 1, '对“七千人大会”的情况表述，正确的是', 1, 'peadmin', '', '&lt;p&gt;A. 党中央开始纠正农村工作中的“左”倾错误&lt;/p&gt;&lt;p&gt;B. 提出了新的经济建设方针&lt;/p&gt;&lt;p&gt;C. 初步总结“大跃进”的经验教训&lt;/p&gt;&lt;p&gt;D. 为反右倾斗争中受批判的同志全部平反&lt;/p&gt;', 4, 'C', '为了统一思想，总结“大跃进”的经验教训，明确工作方向。1962年1、2月间，中共中央-在北京召开扩大的中央工作会议，被称为“七千人大会”。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"27\";s:5:\"knows\";s:34:\"第二节 探索中的严重曲折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (45, 1, '党和政府第一次向全国人民提出实现“四个现代化”奋斗目标是在', 1, 'peadmin', '', '&lt;p&gt;A. 中共八大上&lt;/p&gt;&lt;p&gt;B. 第一次全国人民代表大会上&lt;/p&gt;&lt;p&gt;C. 七千人大会上&lt;/p&gt;&lt;p&gt;D. 第三届全国人民代表大会第一次会议上&lt;/p&gt;', 4, 'D', '1964年底到 1965年初，召开了第三届全国人民代表大会第一次会议。周恩来总理在会上宣布：我国国民经济即将进入一个新的发展时期。全国人民要努力奋斗，把我国逐步建设成为一个具有现代农业、现代工业、现代国防和现代科学技术的社会主义强国。中国共产党和政府第一次郑重地向全国人民提出实现“四个现代化”的奋斗目标。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"27\";s:5:\"knows\";s:34:\"第二节 探索中的严重曲折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (46, 1, '标志“文化大革命”结束的事件是', 1, 'peadmin', '', '&lt;p&gt;A. 粉碎林彪反革命集团&lt;/p&gt;&lt;p&gt;B. 天安门事件&lt;/p&gt;&lt;p&gt;C. 粉碎江青反革命集团&lt;/p&gt;&lt;p&gt;D. 挫败“四人帮”组阁阴谋&lt;/p&gt;', 4, 'C', '1976年10月6日晚，中共中央政治局执行党和人民的意志。毅然粉碎了江青反革令集团，结束了“文化大革命”。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"27\";s:5:\"knows\";s:34:\"第二节 探索中的严重曲折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (47, 1, '社会主义探索时期，我国经济建设的最大成就是', 1, 'peadmin', '', '&lt;p&gt;A. 找到了一条具有中国特色的工业化道路&lt;/p&gt;&lt;p&gt;B. 基本建立了独立的、比较完整的工业体系和国民经济体系&lt;/p&gt;&lt;p&gt;C. 核武器研究成功，奠定了我国核大国的国际地位&lt;/p&gt;&lt;p&gt;D. 外交工作最终打开新的局面，中美关系和中日关系得到改善&lt;/p&gt;', 4, 'B', '社会主义探索时期，我国经济建设的最大成就是基本建立了独立的、比较完整的工业体系和国民经济体系，从根本上解决了工业化中“从无到有”的问题。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"28\";s:5:\"knows\";s:41:\"第三节 建设的成就 探索的成果\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (48, 1, '1978年12月，邓小平在中央工作会议闭幕会上作的讲话是', 1, 'peadmin', '', '&lt;p&gt;A. 《实践是检验真理的唯一标准》&lt;/p&gt;&lt;p&gt;B. 《解放思想，实事求是，团结一致向前看》&lt;/p&gt;&lt;p&gt;C. 《关于加快农业发展若干问题的决定》&lt;/p&gt;&lt;p&gt;D. 《党和国家领导制度的改革》&lt;/p&gt;', 4, 'B', '1978年12月，邓小平在中央工作会议闭幕会上作了题为《解放思想，实事求是，团结一致向前看》的讲话。这个讲话实际上是中共十一届三中全会的主题报告，它为中共十一届三中全会实现具有划时代意义的伟大转折奠定了重要基础。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"29\";s:5:\"knows\";s:58:\"第一节 历史性的伟大转折和改革开放的起步\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (49, 1, '邓小平指出实现四个现代化的根本前提是', 1, 'peadmin', '', '&lt;p&gt;A. 坚持共产党领导&lt;/p&gt;&lt;p&gt;B. 坚持社会主义制度&lt;/p&gt;&lt;p&gt;C. 坚持改革开放&lt;/p&gt;&lt;p&gt;D. 坚持四项基本原则&lt;/p&gt;', 4, 'D', '1979年3月，邓小平在理论工作务虚会上发表的讲话中指出：坚持社会主义道路，坚持人民民主专政，坚持共产党的领导，坚持马克思列宁主义、毛泽东思想这四项基本原则，“是实现四个现代化的根本前提”。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"29\";s:5:\"knows\";s:58:\"第一节 历史性的伟大转折和改革开放的起步\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (50, 1, '标志着党的指导思想上拨乱反正胜利完成的事件是', 1, 'peadmin', '', '&lt;p&gt;A. 《关于建国以来党的若干历史问题的决议》的通过&lt;/p&gt;&lt;p&gt;B. 1982 年平反冤、假、错案工作的结束&lt;/p&gt;&lt;p&gt;C. 中共十一届五中全会为刘少奇平反和恢复名誉&lt;/p&gt;&lt;p&gt;D. 中国共产党第十二次代表大会的召开&lt;/p&gt;', 4, 'A', '1981年6月，中共十一届六中全会通过了《关于建国以来党的若干历史问题的决议》，标志着指导思想上拔乱反正的胜利完成.', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"29\";s:5:\"knows\";s:58:\"第一节 历史性的伟大转折和改革开放的起步\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (51, 1, '“赣宁之役”主要在', 1, 'peadmin', '', '&lt;p&gt;A. 九江、南京一带进行&lt;/p&gt;&lt;p&gt;B. 上海、南京一带进行&lt;/p&gt;&lt;p&gt;C. 九江、上海一带进行&lt;/p&gt;&lt;p&gt;D. 安庆、九江一带进行&lt;/p&gt;', 4, 'A', '二次革命战争主要发生在九江、南京一带，史称“赣宁之役”。本题选A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"8\";s:5:\"knows\";s:40:\"第二节 辛亥革命的胜利与失败\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (52, 1, '1843年，魏源在《海国图志》中提出的思想主张是', 1, 'peadmin', '', '&lt;p&gt;A. 中学为体，西学为用&lt;/p&gt;&lt;p&gt;B. 师夷长技以制夷&lt;/p&gt;&lt;p&gt;C. 物竞天择，适者生存&lt;/p&gt;&lt;p&gt;D. 维新变法，救亡图存&lt;/p&gt;', 4, 'B', '严复翻译了英国博物学家赫胥黎的《进化与伦理》，汉译名为《天演论》，首先提出了“物竞天择适者生存”的思想。?魏源在其著作《海国图志》中提出“师夷长技以制夷”的著名主张；“中学为体，西学为用”是19世纪60年代以后洋务派向西方学习的指导思想。维新变法，救亡图存是康梁维新派的思想主张。本题选B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"3\";s:5:\"knows\";s:58:\"第三节 抵御外来侵略、争取民族独立的斗争\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (53, 1, '1861年，清政府设立的综理洋务的中央机关是', 1, 'peadmin', '', '&lt;p&gt;A. 江南制造总局&lt;/p&gt;&lt;p&gt;B. 京师同文馆&lt;/p&gt;&lt;p&gt;C. 总理各国事务衙门&lt;/p&gt;&lt;p&gt;D. 外务部&lt;/p&gt;', 4, 'C', '1861年，清政府设立总理各国事务衙门，作为总理洋务的中央机关，任命恭亲王奕等为总理衙门大臣。本题选C；1865年年9月，两江总督李鸿章禀报朝廷，成立江南制造局，为晚清中国最重要的军工厂。1862年8月24日清政府鉴于“与外国交涉事件，必先识其情性。”遂于北京设立旨在培养外交和翻译人才的“京师同文馆”。 京师同文馆是清末最早设立的“洋务学堂”。1901年7月24日（清·光绪二十七年），清廷明令改总理各国事务衙门为外务部，负责清廷外交事务', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"5\";s:5:\"knows\";s:61:\"第二节 地主阶级统治集团“自救”活动的兴衰\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (54, 1, '1894年，孙中山在檀香山建立的资产阶级革命组织是', 1, 'peadmin', '', '&lt;p&gt;A. 兴中会&lt;/p&gt;&lt;p&gt;B. 华兴会&lt;/p&gt;&lt;p&gt;C. 光复会&lt;/p&gt;&lt;p&gt;D. 岳王会&lt;/p&gt;', 4, 'A', '1894年，孙中山在檀香山建立的资产阶级革命组织——兴中会；1904年2月，黄兴、宋教仁在湖南长沙成立了华兴会。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"7\";s:5:\"knows\";s:49:\"第一节 举起近代民族民主革命的旗帜\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (55, 1, '1898年，严复翻译出版的 《天演论》 所宣传的思想是', 1, 'peadmin', '', '&lt;p&gt;A. 物竞天择、适者生存&lt;/p&gt;&lt;p&gt;B. 师夷长技以制夷&lt;/p&gt;&lt;p&gt;C. 中学为体、西学为用&lt;/p&gt;&lt;p&gt;D. 振兴中华&lt;/p&gt;', 4, 'A', '严复翻译了英国博物学家赫胥黎的《进化与伦理》，汉译名为《天演论》，首先提出了“物竞天择适者生存”的思想。本题选A，“师夷长技以制夷”?是魏源在其著作《海国图志》中提出的著名主张；“中学为体，西学为用”是19世纪60年代以后洋务派向西方学习的指导思想。振兴中华是孙中山提出的革命思想。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"6\";s:5:\"knows\";s:40:\"第三节 维新运动的兴起和夭折\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (56, 1, '1905年至1907年，资产阶级革命派与改良派论战的焦点是', 1, 'peadmin', '', '&lt;p&gt;A. 要不要打倒列强&lt;/p&gt;&lt;p&gt;B. 要不要推翻帝制，实行共和&lt;/p&gt;&lt;p&gt;C. 要不要以革命手段推翻清政府&lt;/p&gt;&lt;p&gt;D. 要不要废科举，兴学堂&lt;/p&gt;', 4, 'C', '1905年至1907年，革命派与改良派论战主要包括以下几个方面：第一，要不要以革命手段推翻清政府。第二，要不要推翻帝制，实行共和；第三，要不要社会革命。其中要不要以革命手段推翻清政府是论战的焦点。本题选C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"8\";s:5:\"knows\";s:40:\"第二节 辛亥革命的胜利与失败\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (57, 1, '1911年，标志辛亥革命达到高潮的起义是', 1, 'peadmin', '', '&lt;p&gt;A. 惠州起义&lt;/p&gt;&lt;p&gt;B. 河口起义&lt;/p&gt;&lt;p&gt;C. 广州起义&lt;/p&gt;&lt;p&gt;D. 武昌起义&lt;/p&gt;', 4, 'D', '1911年爆发的武昌起义是辛亥革命达到高潮的标志，本题选D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"8\";s:5:\"knows\";s:40:\"第二节 辛亥革命的胜利与失败\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (58, 1, '1911年夏，湖北、湖南、广东和四川爆发的民众运动是', 1, 'peadmin', '', '&lt;p&gt;A. 保路运动&lt;/p&gt;&lt;p&gt;B. 拒法运动&lt;/p&gt;&lt;p&gt;C. 立宪运动&lt;/p&gt;&lt;p&gt;D. 拒俄运动&lt;/p&gt;', 4, 'A', '1911年5月，清政府皇族内阁为了筹集借款，宣布铁路干线收归国有，并将粤汉、川汉铁路的路权出卖给帝国主义引起来湖北、湖南、广东、四川四省民众的强烈反对，史称“保路运动”，本题选A；1903，中国人民开展了反对法国侵略我国广西的爱国运动，史称“拒法运动”；1906年清政府根据出国考察宪政的清宗室载泽、端方等五大臣的意见，下诏预备立宪，1908年颁布《钦定宪法大纲》史称“立宪运动”。 1903年4月，俄国撕毁中俄《东三省交收条约》，并提出七项无理要求，中国人民为此集会、游行、通电，表示反对，拒俄运动爆发。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"8\";s:5:\"knows\";s:40:\"第二节 辛亥革命的胜利与失败\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (59, 1, '1914年7月，孙中山在东京正式成立了', 1, 'peadmin', '', '&lt;p&gt;A. 兴中会&lt;/p&gt;&lt;p&gt;B. 中国同盟会&lt;/p&gt;&lt;p&gt;C. 中华革命党&lt;/p&gt;&lt;p&gt;D. 中国国民党?&lt;/p&gt;', 4, 'C', '二次革命失败后，孙中山逃亡日本，1914年7月，孙中山在东京正式成立中华革命党。本题选C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"8\";s:5:\"knows\";s:40:\"第二节 辛亥革命的胜利与失败\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (60, 1, '1918年5月，鲁迅发表的第一篇白话文小说是', 1, 'peadmin', '', '&lt;p&gt;A. 《阿Q正传》&lt;/p&gt;&lt;p&gt;B. 《狂人日记》&lt;/p&gt;&lt;p&gt;C. 《药》&lt;/p&gt;&lt;p&gt;D. 《祝福》&lt;/p&gt;', 4, 'B', '1918年5月，鲁迅发表的第一篇白话文小说《狂人日记》。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"9\";s:5:\"knows\";s:40:\"第一节 新文化运动与五四运动\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (61, 1, '1919年，发表《我的马克思主义观》一文的是', 1, 'peadmin', '', '&lt;p&gt;A. 陈独秀&lt;/p&gt;&lt;p&gt;B. 李大钊&lt;/p&gt;&lt;p&gt;C. 蔡和森&lt;/p&gt;&lt;p&gt;D. 杨鲍安&lt;/p&gt;', 4, 'B', '受10月革命的影响，李大钊写了《我的马克思主义观——科学社会主义》一书，比较系统的、完整地介绍了马克思主义，成为了在中国举起了马克思主义的第一人，本题选B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"10\";s:5:\"knows\";s:55:\"第二节 马克思主义传播与中国共产党诞生\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (62, 1, '1920年11月，中国共产党早期组织领导的第一个产业工会是', 1, 'peadmin', '', '&lt;p&gt;A. 上海机器工会&lt;/p&gt;&lt;p&gt;B. 北京长辛店工人俱乐部&lt;/p&gt;&lt;p&gt;C. 中国劳动组合书记部&lt;/p&gt;&lt;p&gt;D. 中华全国总工会&lt;/p&gt;', 4, 'A', '1920年11月，中国共产党早期组织领导的第一个产业工会——上海机器工会成立，出版《机器工人》。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"10\";s:5:\"knows\";s:55:\"第二节 马克思主义传播与中国共产党诞生\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (63, 1, '1921年7月，中国共产党第一次全国代表大会召开于', 1, 'peadmin', '', '&lt;p&gt;A. 上海&lt;/p&gt;&lt;p&gt;B. 北京&lt;/p&gt;&lt;p&gt;C. 广州&lt;/p&gt;&lt;p&gt;D. 武汉&lt;/p&gt;', 4, 'A', '1921年7月，中国共产党第一次全国代表大会在上海法租界举行。本题选A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"10\";s:5:\"knows\";s:55:\"第二节 马克思主义传播与中国共产党诞生\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (64, 1, '1928年12月，在东北宣布“服从国民政府，改易旗帜”的是', 1, 'peadmin', '', '&lt;p&gt;A. 张作霖&lt;/p&gt;&lt;p&gt;B. 张学良&lt;/p&gt;&lt;p&gt;C. 冯国璋&lt;/p&gt;&lt;p&gt;D. 冯玉祥&lt;/p&gt;', 4, 'B', '1928年12月29日，张学良在东北宣布“遵守三民主义，服从国民政府，改旗易帜”，标志着国民党在全国范围内建立了自己的统治，本题选B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"12\";s:5:\"knows\";s:67:\"第一节 国民党在全国的统治和中间党派的政治主张\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (65, 1, '1930年8月，国民党民主人士邓演达领导成立的中间党派是', 1, 'peadmin', '', '&lt;p&gt;A. 中国青年党&lt;/p&gt;&lt;p&gt;B. 中国民主同盟&lt;/p&gt;&lt;p&gt;C. 中国国民党临时行动委员会&lt;/p&gt;&lt;p&gt;D. 中华职业教&lt;/p&gt;', 4, 'C', '20世纪二三十年代影响比较大的中间党派包括：邓演达领导的中国国民党临时行动委员会，梁漱溟为首的乡村建设派，黄炎培为首的中华职业教育社，曾琦等首的中国青年党等，所以本题选C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"12\";s:5:\"knows\";s:67:\"第一节 国民党在全国的统治和中间党派的政治主张\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (66, 1, '1931年，日本帝国主义制造的侵略中国东北的事变是', 1, 'peadmin', '', '&lt;p&gt;A. 一·二八事变&lt;/p&gt;&lt;p&gt;B. 九一八事变&lt;/p&gt;&lt;p&gt;C. 七七事变&lt;/p&gt;&lt;p&gt;D. 八一三事变&lt;/p&gt;', 4, 'B', '1931年9月18日夜，在日本关东军安排下，铁道“守备队”炸毁沈阳柳条湖附近日本修筑的南满铁路路轨，并栽赃嫁祸于中国军队。日军以此为借口，炮轰沈阳北大营，是为“九一八事变”，九一八事变标志着日本开始了变中国为其独占殖民地的侵华战争，同时标志着世界反法西斯战争的开始，揭开了第二次世界大战东方战场的序幕。本题选B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"15\";s:5:\"knows\";s:49:\"第一节 日本发动灭亡中国的侵略战争\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (67, 1, '1931年11月，当选为中华苏维埃共和国中央执行委员会主席的是', 1, 'peadmin', '', '&lt;p&gt;A. 毛泽东&lt;/p&gt;&lt;p&gt;B. 周恩来&lt;/p&gt;&lt;p&gt;C. 项英&lt;/p&gt;&lt;p&gt;D. 王嫁祥&lt;/p&gt;', 4, 'A', '1931年11月，中华苏维埃共和国临时中央政府在江西瑞金成立，毛泽东当选为中央执行委员会主席。本题选A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"14\";s:5:\"knows\";s:46:\"第三节 中国革命在探索中曲折前进\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (68, 1, '1931年日本帝国主义制造了侵略中国的', 1, 'peadmin', '', '&lt;p&gt;A. 九一八事变&lt;/p&gt;&lt;p&gt;B. 一二八事变&lt;/p&gt;&lt;p&gt;C. 七七事变&lt;/p&gt;&lt;p&gt;D. 八一三事变&lt;/p&gt;', 4, 'A', '1931年9月18日夜，在日本关东军安排下，铁道“守备队”炸毁沈阳柳条湖附近日本修筑的南满铁路路轨，并栽赃嫁祸于中国军队。日军以此为借口，炮轰沈阳北大营，是为“九一八事变”，九一八事变标志着日本开始了变中国为其独占殖民地的侵华战争，同时标志着世界反法西斯战争的开始，揭开了第二次世界大战东方战场的序幕。本题选A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"15\";s:5:\"knows\";s:49:\"第一节 日本发动灭亡中国的侵略战争\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (69, 1, '1935年12月，中共中央召开的确定抗日民族统一战线政策的会议是', 1, 'peadmin', '', '&lt;p&gt;A. 瓦窑堡会议&lt;/p&gt;&lt;p&gt;B. 洛川会议&lt;/p&gt;&lt;p&gt;C. 中共六届六中全会&lt;/p&gt;&lt;p&gt;D. 中共六届七中全会&lt;/p&gt;', 4, 'A', '1935年12月，中共中央召开瓦窑堡会议，会议总结了两次国内革命战争的基本经验，解决了遵义会议没有来得及解决的政治策略问题，确定了建立抗日民族统一战线的政策，为党领导全国人民迎接伟大的抗日战争奠定了政治基础，本题选A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"16\";s:5:\"knows\";s:43:\"第二节 从局部抗战到全国性抗战\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (70, 1, '1935年12月，中国共产党确定抗日民族统一战线政策的会议是', 1, 'peadmin', '', '&lt;p&gt;A. 遵义会议&lt;/p&gt;&lt;p&gt;B. 瓦窑堡会议&lt;/p&gt;&lt;p&gt;C. 洛川会议&lt;/p&gt;&lt;p&gt;D. 晋绥干部会议&lt;/p&gt;', 4, 'B', '1935年1月，中央政治局在遵义召开政治扩大会议，会议纠正了王明的左倾错误，同时确立了毛泽东的领导地位。1935年12月，中共中央召开瓦窑堡会议，总结了两次国内革命战争的基本经验，解决了遵义会议没来得及解决的政治策略问题，确定了建立抗日民族统一战线的政策，故本题选B；1937年8月中共中央政治局在陕北洛川召开洛川会议，决定把党的工作重心放在战区和敌后，在敌后发动群众，开展独立自主的游击战争，开辟敌后战场，建立敌后抗日根据地。1948年4月，毛泽东在晋绥干部会议上讲话阐述了新民主主义革命的总路线和总政策。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"16\";s:5:\"knows\";s:43:\"第二节 从局部抗战到全国性抗战\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (71, 1, '1935年1月，中国共产党召开的具有历史转折意义的会议是', 1, 'peadmin', '', '&lt;p&gt;A. 八七会议&lt;/p&gt;&lt;p&gt;B. 吉田会议&lt;/p&gt;&lt;p&gt;C. 遵义会议&lt;/p&gt;&lt;p&gt;D. 洛川会议&lt;/p&gt;', 4, 'C', '1935年1月，中央政治局在遵义召开政治扩大会议，史称遵义会议，会议纠正了王明的左倾错误，同时确立了毛泽东的领导地位，标志着党的领导进入新的历史时期。本题选C；1935年12月，中共中央召开瓦窑堡会议，确定了建立抗日民族统一战线的政策。1927年8月7日举行的八七会议，毛泽东提出了“枪杆子里出政权”的著名思想；古田会议举行于1929年12月28日至29日', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"14\";s:5:\"knows\";s:46:\"第三节 中国革命在探索中曲折前进\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (72, 1, '1937年，日本帝国主义发动全面侵华战争的标志是', 1, 'peadmin', '', '&lt;p&gt;A. 九一八事变&lt;/p&gt;&lt;p&gt;B. 一·二八事变&lt;/p&gt;&lt;p&gt;C. 华北事变&lt;/p&gt;&lt;p&gt;D. 卢沟桥事变&lt;/p&gt;', 4, 'D', '1937年7月7日的“七七卢沟桥事件”，标志着日本开始全面发动侵华战争。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"15\";s:5:\"knows\";s:49:\"第一节 日本发动灭亡中国的侵略战争\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (73, 1, '1938年3月，国民党军队在抗日战争正面战场上取得胜利的战役是', 1, 'peadmin', '', '&lt;p&gt;A. 桂南战役&lt;/p&gt;&lt;p&gt;B. 台儿庄战役&lt;/p&gt;&lt;p&gt;C. 枣宜战役&lt;/p&gt;&lt;p&gt;D. 中条山战役&lt;/p&gt;', 4, 'B', '1938年3月，李宗仁领导第五战区在台儿庄取得大捷，歼敌1万余人，成为1937年开战以来，国民党军队在正面战场取得的最大一次胜利。本题选B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"17\";s:5:\"knows\";s:67:\"第三节 国民党的正面战场与大后方的抗日民主运动\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (74, 1, '1938年5月，毛泽东发表的系统阐述抗日战争特点、前途和发展规律的著作是', 1, 'peadmin', '', '&lt;p&gt;A. 《论反对日本帝国主义的策略》&lt;/p&gt;&lt;p&gt;B. 《论持久战》&lt;/p&gt;&lt;p&gt;C. 《论政策》&lt;/p&gt;&lt;p&gt;D. 《论联合政府》&lt;/p&gt;', 4, 'B', '1935年12月27日在陕北瓦窑堡党的活动分子会议上，毛泽东做了《论反对日本帝国主义的策略》的报告，首次提出了中国人民的抗日战争是持久战，决定了建立抗日民族统一战线的策略；1938年5月至6月，毛泽东针对中国国民党内部分人的“中国必亡论”和“中国速胜论，发表了《论持久战》的著作，其基本论点包括：抗日战争是持久战，中国必将取得这场战争的最后胜利。本题选B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"18\";s:5:\"knows\";s:58:\"第四节 中国共产党成为抗日战争的中流砥柱\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (75, 1, '1940年，在枣宜会战中以身殉国的国民党爱国将领是', 1, 'peadmin', '', '&lt;p&gt;A. 佟麟阁&lt;/p&gt;&lt;p&gt;B. 赵登禹&lt;/p&gt;&lt;p&gt;C. 谢晋元&lt;/p&gt;&lt;p&gt;D. 张自忠&lt;/p&gt;', 4, 'D', '1940年5月，在枣宜会战中，第三十三集团军总司令张自忠殉国，成为国军抗日战争中死的最高将领。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"17\";s:5:\"knows\";s:67:\"第三节 国民党的正面战场与大后方的抗日民主运动\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (76, 1, '1941年3月，在大后方抗日民主运动中诞生的民主党派是', 1, 'peadmin', '', '&lt;p&gt;A. 中华民族解放行动委员会&lt;/p&gt;&lt;p&gt;B. 中国民主建国会&lt;/p&gt;&lt;p&gt;C. 中国民主促进会&lt;/p&gt;&lt;p&gt;D. 中国民主政团同盟&lt;/p&gt;', 4, 'D', '1941年3月，中国民主政团同盟成立，9月创办了《光明报》，本题选D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"18\";s:5:\"knows\";s:58:\"第四节 中国共产党成为抗日战争的中流砥柱\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (77, 1, '1945年8月，发表《对日寇的最后一战》声明的是', 1, 'peadmin', '', '&lt;p&gt;A. 朱德&lt;/p&gt;&lt;p&gt;B. 周恩来&lt;/p&gt;&lt;p&gt;C. 彭德怀&lt;/p&gt;&lt;p&gt;D. 毛泽东&lt;/p&gt;', 4, 'D', '1945年8月6日和9日，美国先后在日本广岛和长崎投下原子弹，8月9日，苏联军队从东、西、北三面进入中国东北，进攻日本关东军。8月9日，毛泽东发表《对日寇的最后一战》的声明，宣告：“对日战争已处在最后阶段，最后地战胜日本侵略者及其一切走狗的时间已经到来了，本题选D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"19\";s:5:\"knows\";s:43:\"第五节 抗日战争的胜利及其意义\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (78, 1, '1946年，中共中央决定将减租减息政策改为实现“耕者有其田”政策的文件是', 1, 'peadmin', '', '&lt;p&gt;A. 《井冈山土地法》&lt;/p&gt;&lt;p&gt;B. 《兴国土地法》&lt;/p&gt;&lt;p&gt;C. 《关于清算、减租及土地问题的指示》&lt;/p&gt;&lt;p&gt;D. 《中国土地法大纲》&lt;/p&gt;', 4, 'C', '1946年5月4日，中共中央发出《关于清算、减租及土地问题的指示》决定将党在抗日战争时期实行的减租减息政策改变为实现“耕者有其田”的政策。1947年7月到9月，通过的《中国土地法大纲》，明确规定废除封建及半封建的土地制度，实行耕者有其田的土地制度。本题选C。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"21\";s:5:\"knows\";s:49:\"第二节 国民党政府处在全民的包围中\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (79, 1, '1946年1月10日，国共双方下达停战令。同日，政治协商会议开幕，其地点在', 1, 'peadmin', '', '&lt;p&gt;A. 北平&lt;/p&gt;&lt;p&gt;B. 洛阳&lt;/p&gt;&lt;p&gt;C. 重庆&lt;/p&gt;&lt;p&gt;D. 南京&lt;/p&gt;', 4, 'C', '1946年1月10日，国共双方下达停战令，同日，政治协商会议在重庆开幕，本题选C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"20\";s:5:\"knows\";s:52:\"第一节 从争取和平民主到进行自卫战争\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (80, 1, '1946年6月，国民党当局制造的镇压上海人民团体联合会请愿团的惨案是', 1, 'peadmin', '', '&lt;p&gt;A. 二七惨案&lt;/p&gt;&lt;p&gt;B. 校场口惨案&lt;/p&gt;&lt;p&gt;C. 下关惨案&lt;/p&gt;&lt;p&gt;D. 确山惨案&lt;/p&gt;', 4, 'C', '923年2月7日北洋政府直系军阀吴佩孚镇压京汉铁路工人大罢工的流血事件史称二七惨案；1946年2月10日晨在重庆较场口发动了目的为破坏政协决议、坚持独裁内战、践踏人民民主权利的一起残害民主党派和无党派人士血案称为校场口惨案。1946年6月23日，国民党当局在南京下关车站制造了镇压上海人民团体联合会请愿团的惨案，史称下关惨案，本题选C；1939年11月11日，国民党河南省确山县县长纠集反动武装近2000人，突然对驻确山县竹沟镇的新四军第四支队第八团留守处发动突然袭击。制造了震惊全国的确山惨案。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"20\";s:5:\"knows\";s:52:\"第一节 从争取和平民主到进行自卫战争\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (81, 1, '1946年6月，国民党军队挑起全面内战的起点是', 1, 'peadmin', '', '&lt;p&gt;A. 重点进攻陕甘宁边区&lt;/p&gt;&lt;p&gt;B. 重点进攻山东解放区&lt;/p&gt;&lt;p&gt;C. 大举围攻中原解放区&lt;/p&gt;&lt;p&gt;D. 大举围攻东北解放&lt;/p&gt;', 4, 'C', '1946年月6初，蒋介石派兵围攻中原解放区，6月26日共产党在宣化店上演了震惊中外的&quot;中原突围&quot;，打响了内战第一枪。本题选C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"21\";s:5:\"knows\";s:49:\"第二节 国民党政府处在全民的包围中\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (82, 1, '1947年，国民党宪警制造的镇压爱国学生运动的惨案是', 1, 'peadmin', '', '&lt;p&gt;A. 五卅惨案&lt;/p&gt;&lt;p&gt;B. 校场口惨案&lt;/p&gt;&lt;p&gt;C. 下关惨案&lt;/p&gt;&lt;p&gt;D. 五二零惨案&lt;/p&gt;', 4, 'D', '1947年5月20日，南京、上海、苏州、杭州等地16所专科以上学校的学生举行反饥饿、反内战、挽救教育危机联合大游行，史称五二零运动；国民党当局对其进行了镇压，制造了五二零惨案。1946年2月10日晨在重庆较场口发动了目的为破坏政协决议、坚持独裁内战、践踏人民民主权利的一起残害民主党派和无党派人士血案称为校场口惨案。1946年6月23日，国民党当局在南京下关车站制造了镇压上海人民团体联合会请愿团的惨案，史称下关惨案；五卅惨案是1925年日本帝国主义勾结北洋政府制造的惨案。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"21\";s:5:\"knows\";s:49:\"第二节 国民党政府处在全民的包围中\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (83, 1, '1947年10月发布的《中国人民解放军总部宣言》正式提出的行动口号是', 1, 'peadmin', '', '&lt;p&gt;A. 和平、民主、团结&lt;/p&gt;&lt;p&gt;B. 向北发展、向南防御&lt;/p&gt;&lt;p&gt;C. 打倒蒋介石、解放全中国&lt;/p&gt;&lt;p&gt;D. 打过长江去、解放全中国&lt;/p&gt;', 4, 'C', '1947年10月20日，由中国人民解放军总部发表的《中国人民解放军总部宣言》，正式提出“打倒蒋介石，解放全中国”的行动口号，本题选C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"21\";s:5:\"knows\";s:49:\"第二节 国民党政府处在全民的包围中\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (84, 1, '1947年6月，晋冀鲁豫野战军千里跃进大别山，揭开了人民解放战争', 1, 'peadmin', '', '&lt;p&gt;A. 战略防御的序幕&lt;/p&gt;&lt;p&gt;B. 战略转移的序幕&lt;/p&gt;&lt;p&gt;C. 战略进攻的序幕&lt;/p&gt;&lt;p&gt;D. 战略决战的序幕&lt;/p&gt;', 4, 'C', '1947年6月，刘伯承、邓小平率领的晋冀鲁豫野战军主力强度黄河，千里挺进大别山，揭开了人民解放战争战略进攻的序幕。本题选C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"21\";s:5:\"knows\";s:49:\"第二节 国民党政府处在全民的包围中\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (85, 1, '1947年在国统区爆发的大规模的爱国学生运动的是', 1, 'peadmin', '', '&lt;p&gt;A. 一二九运动&lt;/p&gt;&lt;p&gt;B. 一二一运动&lt;/p&gt;&lt;p&gt;C. 一二三零运动&lt;/p&gt;&lt;p&gt;D. 五二零运动&lt;/p&gt;', 4, 'D', '1947年5月20日，南京、上海、苏州、杭州等地16所专科以上学校的学生举行反饥饿、反内战、挽救教育危机联合大游行，史称五二零运动；一二九运动是1935年12月9日，北平（北京）大中学生数千人举行了抗日救国示威运动。一二一运动发生于1945年 12月1日，是昆明爆发的 “反对内战，争取民主”的”民主运动；一二三零运动发生于1946年12月30日', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"21\";s:5:\"knows\";s:49:\"第二节 国民党政府处在全民的包围中\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (86, 1, '1948年4月，毛泽东完整提出新民主主义革命总路线的著作是', 1, 'peadmin', '', '&lt;p&gt;A. 《新民主主义论》&lt;/p&gt;&lt;p&gt;B. 《目前形势和我们的任务》&lt;/p&gt;&lt;p&gt;C. 《在晋绥干部会议上的讲话》&lt;/p&gt;&lt;p&gt;D. 《将革命进行到底》&lt;/p&gt;', 4, 'C', '1948年4月，毛泽东在晋绥干部会议上讲话阐述了新民主主义革命的总路线和总政策。本题选C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"21\";s:5:\"knows\";s:49:\"第二节 国民党政府处在全民的包围中\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (87, 1, '1949年3月，中共七届二中全会召开的地点是', 1, 'peadmin', '', '&lt;p&gt;A. 河北西柏坡村&lt;/p&gt;&lt;p&gt;B. 延安&lt;/p&gt;&lt;p&gt;C. 北平&lt;/p&gt;&lt;p&gt;D. 瓦窑堡&lt;/p&gt;', 4, 'A', '1949年3月，中共七届二中全会在河北省平山县西柏坡村召开，本题选A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"22\";s:5:\"knows\";s:58:\"第三节 人民共和国：中国人民的历史性选择\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (88, 1, '1950年6月，中共七届三中全会确定的中心任务是', 1, 'peadmin', '', '&lt;p&gt;A. 迅速消灭国民党残余势力&lt;/p&gt;&lt;p&gt;B. 完成新解放区土地改革&lt;/p&gt;&lt;p&gt;C. 统一全国财政经济工作&lt;/p&gt;&lt;p&gt;D. 争取国家财政经济状况的基本好转&lt;/p&gt;', 4, 'D', '1950年6月，中共七届三中全会，毛泽东作了《为争取国家财政经济状况的基本好转而斗争》的报告，毛泽东指出，要获得国家财政经济状况的根本好转，要用三年左右时间，创造三个条件，即土地改革的完成，现有工商业的调整，国家机构所需经费的大量节俭。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (89, 1, '1951年底到1952年春，中国共产党在党政机关工作人员中开展的运动是', 1, 'peadmin', '', '&lt;p&gt;A. 肃反运动&lt;/p&gt;&lt;p&gt;B. 整风、整党运动&lt;/p&gt;&lt;p&gt;C. “三反”运动&lt;/p&gt;&lt;p&gt;D. “五反”运动&lt;/p&gt;', 4, 'C', '1951 年底到 1952 年春，中国共产党在党政机关工作人员中开展了“反贪污、反浪费、反官僚主义”的三反运动，在私营工商业者中开展了“反行贿、反偷税漏税、反盗骗国家财产、反偷工减料、反盗窃国家经济情报”的五反运动。本题选C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (90, 1, '1962年出，中共中央为总结经验教训、明确工作方向召开的会议是', 1, 'peadmin', '', '&lt;p&gt;A. 南宁会议&lt;/p&gt;&lt;p&gt;B. “七千人大会”&lt;/p&gt;&lt;p&gt;C. 成都会议&lt;/p&gt;&lt;p&gt;D. 武昌会议&lt;/p&gt;', 4, 'B', '为了统一思想，总结经验教训，明确工作方向，1962年1-2月间，中共中央在北京召开扩大的工作会议，被称为七千人大会。本题选B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"27\";s:5:\"knows\";s:34:\"第二节 探索中的严重曲折\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (91, 1, '1979年元旦，全国人大常委会发表的重要文献是', 1, 'peadmin', '', '&lt;p&gt;A. 《关于台湾回归祖国实现和平统一的方针政策》&lt;/p&gt;&lt;p&gt;B. 《告台湾同胞书》&lt;/p&gt;&lt;p&gt;C. 《为促进祖国统一大业的完成而继续奋斗》&lt;/p&gt;&lt;p&gt;D. 《反国家分裂法》&lt;/p&gt;', 4, 'B', '1979年1月1日，全国人大常委会发表《告台湾同胞书》建议结束军事对峙。《反国家分裂法》的通过时间是2005年3月14日举行的中华人民共和国第十届全国人民代表大会第三次会议。所以本题选B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"30\";s:5:\"knows\";s:58:\"第二节 改革开放和现代化建设新局面的展开\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (92, 1, '1988年，中共中央和国务院决定建立的经济特区是', 1, 'peadmin', '', '&lt;p&gt;A. 珠海经济特区&lt;/p&gt;&lt;p&gt;B. 汕头经济特区&lt;/p&gt;&lt;p&gt;C. 厦门经济特区&lt;/p&gt;&lt;p&gt;D. 海南经济特区&lt;/p&gt;', 4, 'D', '1979年7月，中共中央、国务院同意在广东省的深圳、珠海、汕头三市和福建省的厦门市试办出口特区。1980年5月，中共中央和国务院决定将深圳、珠海、汕头和厦门这四个出口特区改称为经济特区。1988年4月建立海南省，并将海南岛辟为经济特区。本题选D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"30\";s:5:\"knows\";s:58:\"第二节 改革开放和现代化建设新局面的展开\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (93, 1, '1990年，邓小平提出的关于中国农业改革与发展的思想是', 1, 'peadmin', '', '&lt;p&gt;A. “三个主体，三个补充”&lt;/p&gt;&lt;p&gt;B. “三步走”&lt;/p&gt;&lt;p&gt;C. “两个飞跃”&lt;/p&gt;&lt;p&gt;D. “两个大局”&lt;/p&gt;', 4, 'C', '1990年3月，邓小平在同江泽民的讲话时提出了“两个飞跃”的思想。第一个飞跃是废除人民公社，实行家庭联产承包为主的责任制；第二个飞跃是发展集体经济，本题选C；1956年9月20日，陈云在中共第八次全国代表大会上作了题为《关于资本主义工商业改造高潮以后的新问题》的报告，在这个报告中，提出了著名的“三个主体、三个补充”的经济思想。邓小平1987年4月第一次提出了分“三步走”的基本实现现代化的战略。1987年10月，党的十三大把邓小平“三步走”的发展战略构想确定下来。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"30\";s:5:\"knows\";s:58:\"第二节 改革开放和现代化建设新局面的展开\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (94, 1, '1992年召开的中共十四大明确提出，我国经济体制改革的目标是建立', 1, 'peadmin', '', '&lt;p&gt;A. 社会主义市场经济体制&lt;/p&gt;&lt;p&gt;B. 社会主义有计划商品经济体制&lt;/p&gt;&lt;p&gt;C. 计划为主、市场为辅的经济体制&lt;/p&gt;&lt;p&gt;D. 市场为主、计划为辅的经济体制&lt;/p&gt;', 4, 'A', '十四大：确立邓小平建设有中国特色社会主义理论在全党的指导地位；明确我国经济体制改革的目标是建立社会主义市场经济体制。本题选A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"31\";s:5:\"knows\";s:58:\"第三节 改革开放和现代化建设发展的新阶段\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (95, 1, '19世纪60年代，洋务派最早从事的洋务事业是', 1, 'peadmin', '', '&lt;p&gt;A. 兴办民用工业&lt;/p&gt;&lt;p&gt;B. 兴办军用工业&lt;/p&gt;&lt;p&gt;C. 派遣留学生&lt;/p&gt;&lt;p&gt;D. 创立新式学堂&lt;/p&gt;', 4, 'B', '19世纪60年代，以自强、求富为目标的洋务派兴办洋务的首要目的：对内是镇压太平天国的起义，对外为了抵御外国的侵略，所以现实的需要使得洋务运动起始于现代军用工业。本题选B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"5\";s:5:\"knows\";s:61:\"第二节 地主阶级统治集团“自救”活动的兴衰\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (96, 1, '19世纪末，在帝国主义列强瓜分中国的狂潮中提出“门户开放”政策的国家是', 1, 'peadmin', '', '&lt;p&gt;A. 美国&lt;/p&gt;&lt;p&gt;B. 日本&lt;/p&gt;&lt;p&gt;C. 俄国&lt;/p&gt;&lt;p&gt;D. 德国&lt;/p&gt;', 4, 'A', '1899年，美国政府先后向英、俄等六国政府提出在中国实行所谓“门户开放”、贸易机会均等的照会。本题选A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"3\";s:5:\"knows\";s:58:\"第三节 抵御外来侵略、争取民族独立的斗争\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (97, 1, '2001年，中国对外开放进入一个新阶段的标志是', 1, 'peadmin', '', '&lt;p&gt;A. 开放十四个沿海港口城市&lt;/p&gt;&lt;p&gt;B. 设立海南经济特区&lt;/p&gt;&lt;p&gt;C. 开发和开放上海浦东新区&lt;/p&gt;&lt;p&gt;D. 加入世界贸易组织&lt;/p&gt;', 4, 'D', '2001年11月10日，在多哈举行的世贸组织第四次部长级会议上审议并批准了中国加入世贸组织，它标志着中国对外开放进入一个新阶段。本题选D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"31\";s:5:\"knows\";s:58:\"第三节 改革开放和现代化建设发展的新阶段\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (98, 1, '2013年11月，作出《关于全面深化改革若干问题的决定》的会议是', 1, 'peadmin', '', '&lt;p&gt;A. 中共十八届一中全会&lt;/p&gt;&lt;p&gt;B. 中共十八届二中全会&lt;/p&gt;&lt;p&gt;C. 中共十八届三中全会&lt;/p&gt;&lt;p&gt;D. 中共十八届四中全会&lt;/p&gt;', 4, 'C', '2013年11月，中共十八大三中全会作出《关于全面深化改革若干重大问题的决定》，本题选C。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"32\";s:5:\"knows\";s:64:\"第四节 在新的历史起点上推进中国特色社会主义\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (99, 1, '20世纪初，邹容发表的号召人民推翻清朝统治、建立“中华共和国”的著作是', 1, 'peadmin', '', '&lt;p&gt;A. 《驳康有为论革命书》&lt;/p&gt;&lt;p&gt;B. 《革命军》&lt;/p&gt;&lt;p&gt;C. 《警世钟》&lt;/p&gt;&lt;p&gt;D. 《猛回头》&lt;/p&gt;', 4, 'B', '20世纪初，资产阶级革命派的著作包括：章炳麟的《驳康有为论革命书》，邹容的《革命军》，陈天华的《猛回头》，《警世钟》，本题选B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"7\";s:5:\"knows\";s:49:\"第一节 举起近代民族民主革命的旗帜\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (100, 1, '20世纪初，邹容发表的宣传民主革命思想的著作是', 1, 'peadmin', '', '&lt;p&gt;A. 《驳康有为论革命书》&lt;/p&gt;&lt;p&gt;B. 《革命军》&lt;/p&gt;&lt;p&gt;C. 《警世钟》&lt;/p&gt;&lt;p&gt;D. 《猛回头》&lt;/p&gt;', 4, 'B', '20世纪初，资产阶级革命派的著作包括：章炳麟的《驳康有为论革命书》，邹容的《革命军》，陈天华的《猛回头》，《警世钟》，本题选B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"7\";s:5:\"knows\";s:49:\"第一节 举起近代民族民主革命的旗帜\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (101, 1, '20世纪以来，中国经历的第三次历史性巨变的是', 1, 'peadmin', '', '&lt;p&gt;A. 辛亥革命，推翻统治中国几千年的君主专制制度&lt;/p&gt;&lt;p&gt;B. 五四运动，揭开新民主主义革命的序幕&lt;/p&gt;&lt;p&gt;C. 中华人民共和国的成立和社会主义制度的建立&lt;/p&gt;&lt;p&gt;D. 改革开放，为实现社会主义现代化而奋斗&lt;/p&gt;', 4, 'D', '20世纪中国经历的三次历史性巨变包括：第一次辛亥革命；第二次是中华人民共和国的成立和社会主义制度的建立；第三次是改革开放；所以，本题选D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"33\";s:5:\"knows\";s:61:\"第五节 改革开放和社会主义现代化建设的成就\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (102, 1, '标志着中国新民主主义革命开端的运动是', 1, 'peadmin', '', '&lt;p&gt;A. 新文化运动&lt;/p&gt;&lt;p&gt;B. 五四运动&lt;/p&gt;&lt;p&gt;C. 保路运动&lt;/p&gt;&lt;p&gt;D. 五卅运动&lt;/p&gt;', 4, 'B', '五四运动标志着中国新民主主义革命运动的开端，本题选B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"9\";s:5:\"knows\";s:40:\"第一节 新文化运动与五四运动\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (103, 1, '标志着中国资产阶级民主革命进入了一个新阶段的是', 1, 'peadmin', '', '&lt;p&gt;A. 兴中会的成立&lt;/p&gt;&lt;p&gt;B. 广州起义&lt;/p&gt;&lt;p&gt;C. 中国同盟会的成立&lt;/p&gt;&lt;p&gt;D. 三民主义的提出&lt;/p&gt;', 4, 'C', '中国同盟会是近代中国第一个全国性的资产阶级性质的政党，它的成立标志着中国资产阶级民主革命进入了一个新的阶段。本题选C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"7\";s:5:\"knows\";s:49:\"第一节 举起近代民族民主革命的旗帜\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (104, 1, '促进人民公社体制解体的是', 1, 'peadmin', '', '&lt;p&gt;A. 村民自治组织的普遍建立&lt;/p&gt;&lt;p&gt;B. 乡(镇)基层政权的普遍建立&lt;/p&gt;&lt;p&gt;C. “统分结合”的农村家庭联产承包责任制的普遍实行&lt;/p&gt;&lt;p&gt;D. 乡镇企业的异军突起&lt;/p&gt;', 4, 'C', '统分结合的农村家庭联产承包责任制的普遍实行，促进了政社合一的人民公社体制的解体。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"29\";s:5:\"knows\";s:58:\"第一节 历史性的伟大转折和改革开放的起步\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (105, 1, '到19世纪90年代，洋务派建成的新式海军中的主力是', 1, 'peadmin', '', '&lt;p&gt;A. 北洋水师&lt;/p&gt;&lt;p&gt;B. 广东水师&lt;/p&gt;&lt;p&gt;C. 南洋水师&lt;/p&gt;&lt;p&gt;D. 福建水师&lt;/p&gt;', 4, 'A', '至19世纪90年代，清政府分别建成了福建水师、广东水师、南洋水师、北洋水师，其中，北洋水师是清政府海军的主力，一直由李鸿章管辖。本题选A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"5\";s:5:\"knows\";s:61:\"第二节 地主阶级统治集团“自救”活动的兴衰\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (106, 1, '第一次国共合作的政治基础是', 1, 'peadmin', '', '&lt;p&gt;A. 三民主义&lt;/p&gt;&lt;p&gt;B. 新三民主义&lt;/p&gt;&lt;p&gt;C. 新民主主义&lt;/p&gt;&lt;p&gt;D. 社会主义&lt;/p&gt;', 4, 'B', '1924年1月，中国国民党第一次全国代表大会在广州召开，大会通过的宣言对三民主义多了新的解释，史称“新三民主义”，新三民主义和中共在民主革命阶段的纲领基本一致，成为国共合作的政治基础。本题选B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"11\";s:5:\"knows\";s:37:\"第三节 国共合作与国民革命\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (107, 1, '第一次国共合作建立后，全国范围大革命风暴兴起的标志是', 1, 'peadmin', '', '&lt;p&gt;A. 护国战争&lt;/p&gt;&lt;p&gt;B. 护法运动&lt;/p&gt;&lt;p&gt;C. 北伐战争&lt;/p&gt;&lt;p&gt;D. 五卅运动&lt;/p&gt;', 4, 'D', '1924年1月中国国民党第一次全国代表大会的召开，标志着国民党改组的完成和国共合作的正式建立。护国运动发生于1915年，护法运动发生于1917年，第一次国共合作建立后，全国范围大革命风暴兴起的标志是五卅运动。本题选D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"11\";s:5:\"knows\";s:37:\"第三节 国共合作与国民革命\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (108, 1, '点燃“工农武装割据”星星之火的是', 1, 'peadmin', '', '&lt;p&gt;A. 井冈山根据地的创建&lt;/p&gt;&lt;p&gt;B. 湘赣根据地的创建&lt;/p&gt;&lt;p&gt;C. 湘鄂西根据地的创建&lt;/p&gt;&lt;p&gt;D. 陕甘宁根据地的创建&lt;/p&gt;', 4, 'A', '井冈山根据地的创建，点燃了“工农武装割据”的星星之火。本题选A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"13\";s:5:\"knows\";s:58:\"第二节 中国共产党对革命新道路的艰苦探索\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (109, 1, '光绪皇帝在维新派的推动和策划下，颁布“明定国是”诏书，宣布开始变法是在', 1, 'peadmin', '', '&lt;p&gt;A. 1895年&lt;/p&gt;&lt;p&gt;B. 1896年&lt;/p&gt;&lt;p&gt;C. 1898年&lt;/p&gt;&lt;p&gt;D. 1900年&lt;/p&gt;', 4, 'C', '1898年6月11日，光绪皇帝颁布“明定国是”诏书，宣布开始变法，本题选C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"6\";s:5:\"knows\";s:40:\"第三节 维新运动的兴起和夭折\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (110, 1, '建国初期从根本上稳定物价、争取国家财政经济状况基本好转的重大措施是', 1, 'peadmin', '', '&lt;p&gt;A. 统一全国财经工作&lt;/p&gt;&lt;p&gt;B. 打击投机倒把&lt;/p&gt;&lt;p&gt;C. 调整城市工商业&lt;/p&gt;&lt;p&gt;D. 节减国家机构经费&lt;/p&gt;', 4, 'A', '稳定物价和统一财政工作，是人民解放军在前线的胜利之外，中央人民政府为人民所做的最大的一件工作。尤其是统一全国财经工作，是从根本上稳定物价、争取国家财政经济状况基本好转的重要措施。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (111, 1, '近代中国历史上第一个全国性的资产阶级革命政党是', 1, 'peadmin', '', '&lt;p&gt;A. 兴中会&lt;/p&gt;&lt;p&gt;B. 中国同盟会&lt;/p&gt;&lt;p&gt;C. 中华革命党&lt;/p&gt;&lt;p&gt;D. 中国国民党&lt;/p&gt;', 4, 'B', '中国同盟会是近代中国第一个全国性的资产阶级政党。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"7\";s:5:\"knows\";s:49:\"第一节 举起近代民族民主革命的旗帜\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (112, 1, '旧民主主义革命时期中国反侵略斗争失败的根本原因是', 1, 'peadmin', '', '&lt;p&gt;A. 经济技术落后&lt;/p&gt;&lt;p&gt;B. 社会制度腐败&lt;/p&gt;&lt;p&gt;C. 思想文化保守&lt;/p&gt;&lt;p&gt;D. 军事指挥失误&lt;/p&gt;', 4, 'B', '经济技术的落后是中国反侵略战争失败的重要原因，但根本原因还是社会制度的腐败。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"8\";s:5:\"knows\";s:40:\"第二节 辛亥革命的胜利与失败\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (113, 1, '抗战初期，造成国民政府正面战场溃败的根本原因是', 1, 'peadmin', '', '&lt;p&gt;A. 消极抗日，积极反共的政策&lt;/p&gt;&lt;p&gt;B. 敌强我弱，国力对比悬殊&lt;/p&gt;&lt;p&gt;C. 片面的抗战路线&lt;/p&gt;&lt;p&gt;D. 战略战术的失误&lt;/p&gt;', 4, 'C', '抗战初期，国民政府正面战场溃败除了国力对比悬殊之外，最根本的原因是实行片面的抗战路线，将希望单纯寄托在政府和正规军的抵抗上。本题选C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"17\";s:5:\"knows\";s:67:\"第三节 国民党的正面战场与大后方的抗日民主运动\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (114, 1, '抗战能够取得胜利的决定性因素是', 1, 'peadmin', '', '&lt;p&gt;A. 国民政府正面战场的抗战&lt;/p&gt;&lt;p&gt;B. 敌后战场军民的英勇抗战&lt;/p&gt;&lt;p&gt;C. 世界反法西斯力量的援助&lt;/p&gt;&lt;p&gt;D. 中华民族的大团结，全民族的抗战&lt;/p&gt;', 4, 'D', '以爱国主义为核心的伟大民族精神是中国人民抗日战争胜利的决定因素。所以本题选D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"19\";s:5:\"knows\";s:43:\"第五节 抗日战争的胜利及其意义\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (115, 1, '毛泽东《论十大关系》 报告所围绕的基本方针是', 1, 'peadmin', '', '&lt;p&gt;A. 独立自主 艰苦创业&lt;/p&gt;&lt;p&gt;B. 调动一切积极因素，为社会主义事业服务&lt;/p&gt;&lt;p&gt;C. 走中国特色社会主义道路&lt;/p&gt;&lt;p&gt;D. 自力更生为主，争取外援为辅&lt;/p&gt;', 4, 'B', '1956年4月末至5月初，毛泽东做了论《十大关系》的报告，这十大关系围绕着一个基本方针：即一定要努力把党内党外、国内国外的一切积极因素，直接的、间接的积极因素，全部调动起来，把我国建设成为一个强大的社会主义国家。这也成为同年9月召开的中共八大的指导思想。本题选B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"26\";s:5:\"knows\";s:25:\"第一节 良好的开局\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (116, 1, '毛泽东在《论持久战》中指出，中国抗日战争取得胜利最关键的阶段是', 1, 'peadmin', '', '&lt;p&gt;A. 战略防御阶段&lt;/p&gt;&lt;p&gt;B. 战略相持阶段&lt;/p&gt;&lt;p&gt;C. 战略反攻阶段&lt;/p&gt;&lt;p&gt;D. 战略决战阶段&lt;/p&gt;', 4, 'B', '毛泽东在《论持久战》中还科学的预测了抗日战争的发展阶段，即抗日战争将经过战略防御、战略相持、战略反攻三个阶段。其中，战略相持阶段是中国抗日战争取得最后胜利的最关键阶段。故本题选B。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"18\";s:5:\"knows\";s:58:\"第四节 中国共产党成为抗日战争的中流砥柱\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (117, 1, '全行业公私合营阶段，对企业利润的分配实行', 1, 'peadmin', '', '&lt;p&gt;A. 定股定息&lt;/p&gt;&lt;p&gt;B. “四马分肥”&lt;/p&gt;&lt;p&gt;C. 加工订货&lt;/p&gt;&lt;p&gt;D. 统购包销&lt;/p&gt;', 4, 'A', '1955年，北京、上海、天津的一些行业先后进行全行业公私合营，这时国家队资本家原有的生产资料进行清理估价，以核实私股股额，在合营期间，每年发给资本家5%的股息，这称为定股定息。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"25\";s:5:\"knows\";s:46:\"第三节 开辟中国社会主义改造道路\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (118, 1, '三民主义中民权主义的内容是', 1, 'peadmin', '', '&lt;p&gt;A. 驱除鞑虏&lt;/p&gt;&lt;p&gt;B. 恢复中华&lt;/p&gt;&lt;p&gt;C. 创立民国&lt;/p&gt;&lt;p&gt;D. 平均地权&lt;/p&gt;', 4, 'C', '三民主义包括民族、民权、民生三大主义，其中民族主义包括“驱除鞑虏，恢复中华”两项内容；民权主义的主要内容是创立民国，即推翻封建君主专制制度，建立资产阶级的民主共和国。民生主义的内容是“平均地权”。所以本题选C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"7\";s:5:\"knows\";s:49:\"第一节 举起近代民族民主革命的旗帜\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (119, 1, '太平天国后期，提出《资政新篇》这一具有资本主义色彩改革方案的是', 1, 'peadmin', '', '&lt;p&gt;A. 洪秀全&lt;/p&gt;&lt;p&gt;B. 杨秀清&lt;/p&gt;&lt;p&gt;C. 洪仁玕&lt;/p&gt;&lt;p&gt;D. 石达开&lt;/p&gt;', 4, 'C', '太平天国后期，洪仁玕提出了具有发展资本主义主张的政治纲领——《资政新篇》本题选C。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"4\";s:5:\"knows\";s:43:\"第一节 农民群众斗争风暴的起落\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (120, 1, '太平天国农民起义爆发的时间是', 1, 'peadmin', '', '&lt;p&gt;A. 1851年&lt;/p&gt;&lt;p&gt;B. 1853年&lt;/p&gt;&lt;p&gt;C. 1856年&lt;/p&gt;&lt;p&gt;D. 1864年&lt;/p&gt;', 4, 'A', '1851年1月，洪秀全率领拜上帝教教众在广西桂平县金田村发动起义，建号太平天国。本题选A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"4\";s:5:\"knows\";s:43:\"第一节 农民群众斗争风暴的起落\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (121, 1, '太平天国在1853年冬颁布的纲领性文件是', 1, 'peadmin', '', '&lt;p&gt;A. 《天朝田亩制度》&lt;/p&gt;&lt;p&gt;B. 《十款天条》&lt;/p&gt;&lt;p&gt;C. 《原道醒世训》&lt;/p&gt;&lt;p&gt;D. 《原道觉世训》&lt;/p&gt;', 4, 'A', '1953年冬，太平天国颁布了《天朝田亩制度》，确立了平均分配土地的方案。本题选A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"4\";s:5:\"knows\";s:43:\"第一节 农民群众斗争风暴的起落\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (122, 1, '土地革命战争前中期的三次“左”倾错误不包括', 1, 'peadmin', '', '&lt;p&gt;A. 1927年11月至l928年4月的“左”倾盲动错误&lt;/p&gt;&lt;p&gt;B. 1930年6月至9月以李立三为代表的“左”倾冒险主义&lt;/p&gt;&lt;p&gt;C. 1931年1月至l935年1月以陈绍禹(王明)为代表的“左”倾教条主义&lt;/p&gt;&lt;p&gt;D. 1935年长征途中张国焘的南下&lt;/p&gt;', 4, 'D', '三次左倾错误包括：1927年11月至l928年4月的“左”倾盲动错误；1930年6月至9月以李立三为代表的“左”倾冒险主义；931年1月至l935年1月以陈绍禹(王明)为代表的“左”倾教条主义，所以，本题选D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"14\";s:5:\"knows\";s:46:\"第三节 中国革命在探索中曲折前进\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (123, 1, '我国对资本主义工商业进行社会主义改造的基本政策是', 1, 'peadmin', '', '&lt;p&gt;A. 无偿没收&lt;/p&gt;&lt;p&gt;B. 有偿征用&lt;/p&gt;&lt;p&gt;C. 和平赎买&lt;/p&gt;&lt;p&gt;D. 限制发展&lt;/p&gt;', 4, 'C', '在社会主义改造过程中，中国共产党严格区别官僚资本与民族资本界限。中国的资本主义分为官僚资本和民族资本两种。对官僚资本采取剥夺、没收的政策。对民族资本则是采取利用、限制和改造的政策，通过国家资本主义的形式，最终实现对资本主义工商业的和平赎买。本题选C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"25\";s:5:\"knows\";s:46:\"第三节 开辟中国社会主义改造道路\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (124, 1, '我国农业社会主义改造中，具有完全社会主义性质的经济组织形式是', 1, 'peadmin', '', '&lt;p&gt;A. 变工队&lt;/p&gt;&lt;p&gt;B. 互助组&lt;/p&gt;&lt;p&gt;C. 初级农业生产合作社&lt;/p&gt;&lt;p&gt;D. 高级农业生产合作社&lt;/p&gt;', 4, 'D', '1953年12月党中央通过《关于发展农业生产合作社的决议》，提出引导农民走向社会主义的几种过渡性经济组织形式：(1)具有社会主义的萌芽性质的互助组;(2)具有半社会主义性质的初级农业生产合作社;(3)具有社会主义性质的高级农业生产合作社。本题选D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"25\";s:5:\"knows\";s:46:\"第三节 开辟中国社会主义改造道路\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (125, 1, '我国西藏实现和平解放的时间是', 1, 'peadmin', '', '&lt;p&gt;A. 18172&lt;/p&gt;&lt;p&gt;B. 1950年 10月&lt;/p&gt;&lt;p&gt;C. 1951年 10月&lt;/p&gt;&lt;p&gt;D. 1952年 10月&lt;/p&gt;', 4, 'C', '1951年5月，中央人民政府同西藏地方政府达成关于和平解放西藏办法的协议，10月，人民解放军进驻拉萨，西藏和平解放。本题选C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (126, 1, '戊戌维新时期，谭嗣同撰写的宣传变法主张的著作是', 1, 'peadmin', '', '&lt;p&gt;A. 《仁学》&lt;/p&gt;&lt;p&gt;B. 《变法通义》&lt;/p&gt;&lt;p&gt;C. 《新学伪经考》&lt;/p&gt;&lt;p&gt;D. 《日本变政考》&lt;/p&gt;', 4, 'A', '戊戌维新时期，谭嗣同撰写的宣传变法主张的著作是《仁学》，《变法通义》的作者是梁启超；《新学伪经考》和《日本变政考》均是康有为的著作。本题选A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"6\";s:5:\"knows\";s:40:\"第三节 维新运动的兴起和夭折\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (127, 1, '戊戌维新时期，维新派在上海创办的影响较大的报刊是', 1, 'peadmin', '', '&lt;p&gt;A. 《万国公报》&lt;/p&gt;&lt;p&gt;B. 《国闻报》&lt;/p&gt;&lt;p&gt;C. 《湘报》&lt;/p&gt;&lt;p&gt;D. 《时务报》&lt;/p&gt;', 4, 'D', '维新时期影响较大的报纸有梁启超主笔的上海《时务报》，严复主办的天津《国闻报》以及湖南的《湘报》，其中维新派的事《时务报》。本题选D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"6\";s:5:\"knows\";s:40:\"第三节 维新运动的兴起和夭折\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (128, 1, '新文化运动兴起的标志是', 1, 'peadmin', '', '&lt;p&gt;A. 蔡元培就任北京大学校长&lt;/p&gt;&lt;p&gt;B. 鲁迅发表《狂人日记》&lt;/p&gt;&lt;p&gt;C. 陈独秀在上海创办《新青年》&lt;/p&gt;&lt;p&gt;D. 胡适发表《文学改良刍议》&lt;/p&gt;', 4, 'C', '1915年9月，陈独秀在上海创办《新青年》成为新文化运动兴起的标志。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"9\";s:5:\"knows\";s:40:\"第一节 新文化运动与五四运动\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (129, 1, '新中国成立初期，各解放区建立的过渡性临时政权形式是', 1, 'peadmin', '', '&lt;p&gt;A. 军事管制委员会&lt;/p&gt;&lt;p&gt;B. 各界人民代表会议&lt;/p&gt;&lt;p&gt;C. 各界人民代表大会&lt;/p&gt;&lt;p&gt;D. 各级人民政府&lt;/p&gt;', 4, 'A', '随着大陆的解放，执政的中国共产党在各新解放区迅速建立起军事管制委员会，作为过渡性的临时政权。本题选A。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (130, 1, '新中国成立初期，社会主义国营经济建立的主要途径是', 1, 'peadmin', '', '&lt;p&gt;A. 没收官僚资本&lt;/p&gt;&lt;p&gt;B. 征用外国资本&lt;/p&gt;&lt;p&gt;C. 赎买民族资本&lt;/p&gt;&lt;p&gt;D. 合并公营资本&lt;/p&gt;', 4, 'A', '新中国的社会主义国营经济主要是通过没收官僚资本建立起来的。本题选A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (131, 1, '新中国第一颗人造地球卫星发射成功的时间是', 1, 'peadmin', '', '&lt;p&gt;A. 23651&lt;/p&gt;&lt;p&gt;B. 24381&lt;/p&gt;&lt;p&gt;C. 24746&lt;/p&gt;&lt;p&gt;D. 25659&lt;/p&gt;', 4, 'D', '1964年10月，中国爆炸了第一颗原子弹，1967年6月爆炸了第一颗氢弹，1970年4月发射了第一颗人造地球卫星。本题选D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"28\";s:5:\"knows\";s:41:\"第三节 建设的成就 探索的成果\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (132, 1, '新中国开始实施发展国民经济第一个五年计划的时间是', 1, 'peadmin', '', '&lt;p&gt;A. 1950年&lt;/p&gt;&lt;p&gt;B. 1951年&lt;/p&gt;&lt;p&gt;C. 1952年&lt;/p&gt;&lt;p&gt;D. 1953年&lt;/p&gt;', 4, 'D', '第一个五年计划，简称“一五”计划，时间为1953—1957年，本题选D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"24\";s:5:\"knows\";s:37:\"第二节 制定过渡时期总路线\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (133, 1, '洋务派兴办洋务事业的指导思想是', 1, 'peadmin', '', '&lt;p&gt;A. “中学为体，西学为用”&lt;/p&gt;&lt;p&gt;B. 救亡图存&lt;/p&gt;&lt;p&gt;C. “适者生存”&lt;/p&gt;&lt;p&gt;D. “能变则全，不变则亡”&lt;/p&gt;', 4, 'A', '洋务派兴办洋务事业的指导思想是“中学为体，西学为用”。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"5\";s:5:\"knows\";s:61:\"第二节 地主阶级统治集团“自救”活动的兴衰\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (134, 1, '于1945年建立革命政府的少数民族群众的“三区革命”发生在', 1, 'peadmin', '', '&lt;p&gt;A. 河北省&lt;/p&gt;&lt;p&gt;B. 河南省&lt;/p&gt;&lt;p&gt;C. 陕西省&lt;/p&gt;&lt;p&gt;D. 新疆省&lt;/p&gt;', 4, 'D', '1944年8月，原新疆省的伊犁、塔城、阿山（今阿勒泰）爆发少数民族的武装斗争，1945年建立革命政府，史称“三区革命”本题选D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"21\";s:5:\"knows\";s:49:\"第二节 国民党政府处在全民的包围中\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (135, 1, '在19世纪末西方列强瓜分中国的狂潮中，提出“门户开放”政策的国家是', 1, 'peadmin', '', '&lt;p&gt;A. 美国&lt;/p&gt;&lt;p&gt;B. 日本&lt;/p&gt;&lt;p&gt;C. 俄国&lt;/p&gt;&lt;p&gt;D. 德国&lt;/p&gt;', 4, 'A', '1899年，美国政府先后向英、俄等六国政府提出在中国实行所谓“门户开放”、贸易机会均等的照会。本题选A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"3\";s:5:\"knows\";s:58:\"第三节 抵御外来侵略、争取民族独立的斗争\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (136, 1, '在俄国十月革命影响下，率先在中国举起马克思主义旗帜的是', 1, 'peadmin', '', '&lt;p&gt;A. 陈独秀&lt;/p&gt;&lt;p&gt;B. 李大钊&lt;/p&gt;&lt;p&gt;C. 李达&lt;/p&gt;&lt;p&gt;D. 毛泽东&lt;/p&gt;', 4, 'B', '受10月革命的影响，李大钊写了《我的马克思主义观——科学社会主义》一书，比较系统的、完整地介绍了马克思主义，成为了在中国举起了马克思主义的第一人。本题选B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"10\";s:5:\"knows\";s:55:\"第二节 马克思主义传播与中国共产党诞生\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (137, 1, '在抗日战争中为国捐躯的八路军副参谋长是', 1, 'peadmin', '', '&lt;p&gt;A. 彭雪枫&lt;/p&gt;&lt;p&gt;B. 赵尚志&lt;/p&gt;&lt;p&gt;C. 杨靖宇&lt;/p&gt;&lt;p&gt;D. 左权&lt;/p&gt;', 4, 'D', '1942年5月，日军对太行抗日根据地发动“大扫荡”，左权指挥部队掩护中共中央北方局和八路军总部等机关突围转移，不幸牺牲。左权是抗日战争八路军牺牲的最高指挥官', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"18\";s:5:\"knows\";s:58:\"第四节 中国共产党成为抗日战争的中流砥柱\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (138, 1, '在中国近代史上，人民群众第一次大规模的反侵略武装斗争是', 1, 'peadmin', '', '&lt;p&gt;A. 三元里人民的抗英斗争&lt;/p&gt;&lt;p&gt;B. 太平天国抗击洋枪队的斗争&lt;/p&gt;&lt;p&gt;C. 台湾人民的抗日斗争&lt;/p&gt;&lt;p&gt;D. 义和团抗击八国联军的斗争&lt;/p&gt;', 4, 'A', '1941年5月广州郊区的三元里抗英斗争是中国近代史上中国人民第一次大规模的反侵略武装斗争，所以本题答案选A；1860年太平天国抗击洋枪队的斗争打击了外来势力的干涉。台湾人民抗日斗争以及义和团抗击八国联军的斗争分别发生于甲午战争之后和1900年的八国联军侵华时期，这两个选项均不是近代史，中国人民群众第一次大规模反侵略斗争。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"3\";s:5:\"knows\";s:58:\"第三节 抵御外来侵略、争取民族独立的斗争\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (139, 1, '在中国近代史上，资产阶级思想与封建主义思想的第一次正面交锋是', 1, 'peadmin', '', '&lt;p&gt;A. 维新派与守旧派的论战&lt;/p&gt;&lt;p&gt;B. 洋务派与顽固派的论战&lt;/p&gt;&lt;p&gt;C. 洋务派与维新派的论战&lt;/p&gt;&lt;p&gt;D. 革命派与改良派的论战&lt;/p&gt;', 4, 'A', '维新派与守旧派的论战，是资产阶级思想与封建主义思想在中国的第一次正面交锋，本题选A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"6\";s:5:\"knows\";s:40:\"第三节 维新运动的兴起和夭折\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (140, 1, '在中国近代史上最先规定关税制的不平等条约是', 1, 'peadmin', '', '&lt;p&gt;A. 《南京条约》&lt;/p&gt;&lt;p&gt;B. 《望厦条约》&lt;/p&gt;&lt;p&gt;C. 《天津条约》&lt;/p&gt;&lt;p&gt;D. 《黄埔条约》&lt;/p&gt;', 4, 'A', '1842年签订的南京条约，是中国近代史上签订的第一个不平等条约。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (141, 1, '中国共产党第一次完整地概括社会主义初级阶段基本路线的会议是', 1, 'peadmin', '', '&lt;p&gt;A. 中共十三大&lt;/p&gt;&lt;p&gt;B. 中共十四大&lt;/p&gt;&lt;p&gt;C. 中共十五大&lt;/p&gt;&lt;p&gt;D. 中共十六大&lt;/p&gt;', 4, 'A', '十三大：阐明了社会主义初级阶段理论，提出了党在社会主义初级阶段的基本路线，即以经济建设为中心，坚持四项基本原则，坚持改革开放. 作出了社会主义初级阶段经济发展分三步走的战略部署。十四大：确立邓小平建设有中国特色社会主义理论在全党的指导地位；明确我国经济体制改革的目标是建立社会主义市场经济体制。本题选A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"30\";s:5:\"knows\";s:58:\"第二节 改革开放和现代化建设新局面的展开\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (142, 1, '中国共产党独立领导革命战争、创建人民军队的开端是', 1, 'peadmin', '', '&lt;p&gt;A. 秋收起义&lt;/p&gt;&lt;p&gt;B. 南昌起义&lt;/p&gt;&lt;p&gt;C. 广州起义&lt;/p&gt;&lt;p&gt;D. 百色起义&lt;/p&gt;', 4, 'B', '1927年8月1日，南昌起义打响了武装反抗国民党统治的第一枪，标志着中国共产党独立领导革命战争，创建人民军队的开端，1927年9月，毛泽东在湘赣边界领导了秋收起义，1927年12月叶挺、叶剑英领导了广州企业，南昌起义与随后的秋收起义、广州起义并称为1927年的三大起义。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"13\";s:5:\"knows\";s:58:\"第二节 中国共产党对革命新道路的艰苦探索\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (143, 1, '中国共产党开展的延安整风运动最主要的任务是', 1, 'peadmin', '', '&lt;p&gt;A. 反对主观主义&lt;/p&gt;&lt;p&gt;B. 反对宗派主义&lt;/p&gt;&lt;p&gt;C. 反对官僚主义&lt;/p&gt;&lt;p&gt;D. 反对党八股&lt;/p&gt;', 4, 'A', '1942年延安整风运动的主要内容包括：反对主观主义以整顿学风、反对宗教主义以整顿党风、反对党八股以整顿文风。其中，反对主观主义是整风运动最主要的任务。本题选A。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"18\";s:5:\"knows\";s:58:\"第四节 中国共产党成为抗日战争的中流砥柱\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (144, 1, '中国共产党在过渡时期总路线的主体是逐步实现', 1, 'peadmin', '', '&lt;p&gt;A. 国家的社会主义工业化&lt;/p&gt;&lt;p&gt;B. 对个体农业的社会主义改造&lt;/p&gt;&lt;p&gt;C. 对个体手工业的社会主义改造&lt;/p&gt;&lt;p&gt;D. 对资本主义工商业的社会主义改造&lt;/p&gt;', 4, 'A', '1953年6月15日，毛泽东在中央政治局扩大会议上发表重要讲话，对党在过渡时期的总路线和总任务的内容作了完整的表述。即要在一个相当长的时期内，逐步实现国家的社会主义工业化，并逐步实现国家对农业、对手工业和对资本主义工商业的社会主义改造。同年9月25日，党中央正式向全国公布过渡时期总路线。12月，中共中央宣传部发布《为动员一切力量把我国建设成为一个伟大的社会主义国家而斗争——关于党在过渡时期总路线的学习和宣传提纲》。本题选A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"25\";s:5:\"knows\";s:46:\"第三节 开辟中国社会主义改造道路\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (145, 1, '中国恢复对澳门行&lt;span&gt;使&lt;/span&gt;主权的时间是', 1, 'peadmin', '', '&lt;p&gt;A. 35612&lt;/p&gt;&lt;p&gt;B. 35784&lt;/p&gt;&lt;p&gt;C. 36342&lt;/p&gt;&lt;p&gt;D. 36514&lt;/p&gt;', 4, 'D', '1997年7月1日恢复对香港行使主权，1999年12月20日恢复对澳门行使主权，本题选D。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"31\";s:5:\"knows\";s:58:\"第三节 改革开放和现代化建设发展的新阶段\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (146, 1, '中国历史上达到农民战争最高峰的是', 1, 'peadmin', '', '&lt;p&gt;A. 大泽乡起义&lt;/p&gt;&lt;p&gt;B. 辛亥革命&lt;/p&gt;&lt;p&gt;C. 太平天国运动&lt;/p&gt;&lt;p&gt;D. 义和团运动&lt;/p&gt;', 4, 'C', '太平天国运动是中国旧式农民战争的最高峰。本题选C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"5\";s:5:\"knows\";s:61:\"第二节 地主阶级统治集团“自救”活动的兴衰\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (147, 1, '中国资产阶级领导的旧民主主义革命终结的标志是', 1, 'peadmin', '', '&lt;p&gt;A. 二次革命的失败&lt;/p&gt;&lt;p&gt;B. 护国运动的失败&lt;/p&gt;&lt;p&gt;C. 第一次护法运动的失败&lt;/p&gt;&lt;p&gt;D. 第二次护法运动的失败&lt;/p&gt;', 4, 'D', '1922年，第二次护法运动的失败，标志着中国资产阶级领导的旧民主主义革命的终结，本题选D。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"8\";s:5:\"knows\";s:40:\"第二节 辛亥革命的胜利与失败\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (148, 1, '邹容在下列哪本著作中阐述了在中国进行民主革命的正义性和必要性', 1, 'peadmin', '', '&lt;p&gt;A. 《猛回头》&lt;/p&gt;&lt;p&gt;B. 《警世钟》&lt;/p&gt;&lt;p&gt;C. 《游学译编》&lt;/p&gt;&lt;p&gt;D. 《革命军》&lt;/p&gt;', 4, 'D', '20世纪初，资产阶级革命派的著作包括：章炳麟的《驳康有为论革命书》，邹容的《革命军》，陈天华的《猛回头》，《警世钟》，本题选D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"7\";s:5:\"knows\";s:49:\"第一节 举起近代民族民主革命的旗帜\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (149, 1, '鸦片战争前夕，影响近代中国的最主要的政治因素是', 1, 'peadmin', '', '&lt;p&gt;A. 清朝晚期政治腐败&lt;/p&gt;&lt;p&gt;B. 封建制度已经衰落&lt;/p&gt;&lt;p&gt;C. 军备废弛，防御力差&lt;/p&gt;&lt;p&gt;D. 战和方针举棋不定&lt;/p&gt;', 4, 'B', '鸦片战争前的中国，封建统治走向衰落，落后的生产关系严重制约着生产力的发展，国内阶级矛盾十分尖锐。 因此，衰落的封建制度成为影响近代中国的最主要的政治因素。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:43:\"第一节 鸦片战争前的中国和世界\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (150, 1, '近代中国一切灾难的总根源是', 1, 'peadmin', '', '&lt;p&gt;A. 腐朽没落的清朝统治&lt;/p&gt;&lt;p&gt;B. 资本一帝国主义的侵略&lt;/p&gt;&lt;p&gt;C. 科学技术落后&lt;/p&gt;&lt;p&gt;D. 闭关锁国&lt;/p&gt;', 4, 'B', '鸦片战争是中国近代史的开端。中国近代史是中华民族遭受外国资本一帝国主义侵略、压迫、掠夺、剥削的历史，同时也是中国人民反抗外来侵略的历史。资本一帝国主义的侵略是近代中国一切灾难的总根源。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:43:\"第一节 鸦片战争前的中国和世界\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (151, 1, '中国封建社会政治的基本特征是', 1, 'peadmin', '', '&lt;p&gt;A. 高度中央集权的封建君主专制&lt;/p&gt;&lt;p&gt;B. 族权和政权相结合&lt;/p&gt;&lt;p&gt;C. 国家统一和各民族经济文化紧密联系&lt;/p&gt;&lt;p&gt;D. 结构稳定、延续，发展缓慢、迟滞&lt;/p&gt;', 4, 'A', '中国封建社会的基本特征是在政治上实行高度中央集权的封建君主专制制度。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:43:\"第一节 鸦片战争前的中国和世界\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (152, 1, '小农经济是中国封建社会的基本生产结构，其主要特征是', 1, 'peadmin', '', '&lt;p&gt;A. 个体家庭为单位并与家庭手工业结合的自给自足的自然经济&lt;/p&gt;&lt;p&gt;B. 以家族为单位的集体经济&lt;/p&gt;&lt;p&gt;C. 以机器为生产工具的工场经济&lt;/p&gt;&lt;p&gt;D. 个体家庭为单位并与家庭手工业结合的商业资本主义经济&lt;/p&gt;', 4, 'A', '小农经济是封建社会的基本生产结构，其主要特征是个体家庭为单位并与家庭手工业结合的自给自足的自然经济，它曾有利于封建社会经济的发展和社会的稳定，但又束缚了生产力的发展。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:43:\"第一节 鸦片战争前的中国和世界\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (153, 1, '1840年鸦片战争前，中国封建社会的主要矛盾是', 1, 'peadmin', '', '&lt;p&gt;A. 地主阶级和农民阶级的矛盾&lt;/p&gt;&lt;p&gt;B. 地主阶级和资产阶级的矛盾&lt;/p&gt;&lt;p&gt;C. 工人阶级和资产阶级的矛盾&lt;/p&gt;&lt;p&gt;D. 资产阶级和农民阶级的矛盾&lt;/p&gt;', 4, 'A', '鸦片战争以前，中国封建社会的主要矛盾，是地主阶级和农民阶级的矛盾。答案为A。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:43:\"第一节 鸦片战争前的中国和世界\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (154, 1, '清王朝由强盛转向衰落是在', 1, 'peadmin', '', '&lt;p&gt;A. 乾隆朝后期&lt;/p&gt;&lt;p&gt;B. 康熙朝后期&lt;/p&gt;&lt;p&gt;C. 雍正朝后期&lt;/p&gt;&lt;p&gt;D. 道光朝中期&lt;/p&gt;', 4, 'A', '清朝是中国历史上最后一个封建王朝，在其前期的康熙、雍正、乾隆三朝，中国国家统一，政权巩固，社会稳定，经济 繁荣，史称“康雍乾盛世”。乾隆朝后期，清王朝由强盛转向衰落。答案为A。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:43:\"第一节 鸦片战争前的中国和世界\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (155, 1, '中国封建社会产生过诸多“盛世”，出现在清代的是', 1, 'peadmin', '', '&lt;p&gt;A. 文景之治&lt;/p&gt;&lt;p&gt;B. 贞观之治&lt;/p&gt;&lt;p&gt;C. 开元之治&lt;/p&gt;&lt;p&gt;D. 康雍乾盛世&lt;/p&gt;', 4, 'D', '清朝是中国历史上的最后一个封建王朝。在清朝前期的康熙、雍正、乾隆三朝，中国国家统一，政权巩固，社会稳定，经济繁荣，史称“康雍乾盛世”。因此，“康雍乾盛世”出现在清代。答案为D。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:43:\"第一节 鸦片战争前的中国和世界\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (156, 1, '鸦片战争前，西方资本主义经济的发展突出表现在', 1, 'peadmin', '', '&lt;p&gt;A. 资产阶级革命的爆发&lt;/p&gt;&lt;p&gt;B. 工业革命的发生&lt;/p&gt;&lt;p&gt;C. 机器大生产的实现&lt;/p&gt;&lt;p&gt;D. 蒸汽机的发明和推广&lt;/p&gt;', 4, 'B', '至18世纪，资本主义制度在英国、美国、法国等欧美主要国家先后确立。资本主义经济的发展突出表现在工业革命的发生上。答案为B。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:43:\"第一节 鸦片战争前的中国和世界\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (157, 1, '俄国强迫清政府签订的割去黑龙江以北60多万平方公里的中国领土的不平等条约是', 1, 'peadmin', '', '&lt;p&gt;A. 《勘分西北界约记》&lt;/p&gt;&lt;p&gt;B. 《改订伊犁条约》&lt;/p&gt;&lt;p&gt;C. 《北京条约》&lt;/p&gt;&lt;p&gt;D. 《瑷珲条约》&lt;/p&gt;', 4, 'D', '中俄签订的《瑷珲条约》割去了黑龙江以北60多万平方公里的中国领土；中俄《北京条约》割去了鸟苏里江以东40余万平方公里的中国领土；《勘分西北界约记》割去了中国西北44万多平方公里的领土；《改订伊犁条约》和5个勘界议定书 共割去7万平方公里领土。答案为D。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (158, 1, '规定中国割让九龙半岛南端和昂船洲，“归英属香港界内”的不平等条约是', 1, 'peadmin', '', '&lt;p&gt;A. 《辛丑条约》&lt;/p&gt;&lt;p&gt;B. 《马关条约》&lt;/p&gt;&lt;p&gt;C. 《北京条约》&lt;/p&gt;&lt;p&gt;D. 《南京条约》&lt;/p&gt;', 4, 'C', '资本一帝国主义列强对中国的侵略，首先和主要的是进行军事侵略，并通过不平等条约，侵占中国领土。1860年中英签订的《北京条约》规定，割让九龙半岛南端和昂船洲，“归莫属香港界内”。答案为C。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (159, 1, '1860年洗劫和烧毁圆明园的是', 1, 'peadmin', '', '&lt;p&gt;A. 日本侵略军&lt;/p&gt;&lt;p&gt;B. 俄国侵略军&lt;/p&gt;&lt;p&gt;C. 英法联军&lt;/p&gt;&lt;p&gt;D. 八国联军&lt;/p&gt;', 4, 'C', '1860年，英法联军攻占北京后，对圆明园进行了连续12天的抢劫，放火烧毁了这座凝聚着中华民族聪明才智和伟大创造的皇家园林中的“万园之园”。这是对人类文明的一次空前践踏。答案为C。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (160, 1, '最早规定外国列强在中国享有领事裁判权的不平等条约是', 1, 'peadmin', '', '&lt;p&gt;A. 《辛丑条约》&lt;/p&gt;&lt;p&gt;B. 《马关条约》&lt;/p&gt;&lt;p&gt;C. 《五口通商章程》&lt;/p&gt;&lt;p&gt;D. 《南京条约》&lt;/p&gt;', 4, 'C', '享有领事裁判权是列强对中国进行政治控制的重要内容。中英《五口通商章程》和中关《望厦条约》都涉及领事裁判权，而《五口通商章程》是最早规定外国列强在中国享有领事裁判权的不平等条约。答案为C。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (161, 1, '1860年，《北京条约》开放的陆路商埠是', 1, 'peadmin', '', '&lt;p&gt;A. 伊犁和喀什噶尔  &lt;/p&gt;&lt;p&gt;B. 淡水和琼州&lt;/p&gt;&lt;p&gt;C. 汉口和九江&lt;/p&gt;&lt;p&gt;D. 镇江和南京&lt;/p&gt;', 4, 'A', '近代以来，外国列强控制中国通商口岸、剥夺中国关税自主权、对华倾销商品和资本输出，并逐渐操纵中国经济命脉。1860年，《北京条约》开放天津为通商口岸。陆路方面，开放伊犁和喀什噶尔为商埠。答案为A.', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (162, 1, '将英商进出口货物的具体税率，用中英协定方式固定下来的条约是', 1, 'peadmin', '', '&lt;p&gt;A. 《虎门条约》&lt;/p&gt;&lt;p&gt;B. 《黄埔条约》&lt;/p&gt;&lt;p&gt;C. 《望厦条约》&lt;/p&gt;&lt;p&gt;D. 《五口通商章程：海关税则》&lt;/p&gt;', 4, 'D', '剥夺中国关税自主权是近代外国列强对中国进行经济掠夺的重要内容。1843年，中英《五口通商章程：海关税则》将英商进出口货物的具体税率，用中英协定方式固定下来。答案为D。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (163, 1, '西方教会中一部分人利用传教和传播西学的名义为外国列强侵华制造舆论，较早的外文期刊不包括', 1, 'peadmin', '', '&lt;p&gt;A. 《中国丛报》&lt;/p&gt;&lt;p&gt;B. 《北华捷报》（后改名《字林西报》）&lt;/p&gt;&lt;p&gt;C. 《万国公报》&lt;/p&gt;&lt;p&gt;D. 《时务报》&lt;/p&gt;', 4, 'D', '西方教会中一部分人利用传教和传播西学的名义为外国列强侵华制造舆论。他们在中国办报纸、杂志，翻译、出版各种书刊。较早的外文期刊有《中国丛报》和《北华捷报》（后改名《宇林西报》）。广学会发行的《万国公报》除介绍西方的政治、经济、文化和社会状况外，还竭力宣扬殖民地奴化思想，为外国列强侵华进行辩护。答案为D。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (164, 1, '近代中国革命的主力军是', 1, 'peadmin', '', '&lt;p&gt;A. 工人阶级&lt;/p&gt;&lt;p&gt;B. 农民阶级&lt;/p&gt;&lt;p&gt;C. 小资产阶级&lt;/p&gt;&lt;p&gt;D. 民族资产阶级&lt;/p&gt;', 4, 'B', '旧的被统治阶级即农民阶级，仍是近代中国社会人数最多的被剥削阶级。近代中国农民阶级仍占多数，由于其社会地位低下，受剥削压迫严重，生活状况极度恶化，具有强烈的革命要求，是中国革命的主力军。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (165, 1, '近代中国社会中最革命的阶级是', 1, 'peadmin', '', '&lt;p&gt;A. 工人阶级&lt;/p&gt;&lt;p&gt;B. 农民阶级&lt;/p&gt;&lt;p&gt;C. 小资产阶级&lt;/p&gt;&lt;p&gt;D. 民族资产阶级&lt;/p&gt;', 4, 'A', '工人阶级深受帝国主义、封建势力和资产阶级三重压迫和剥削，劳动条件差，劳动时间长，工资待遇低，又毫无政治权利，其革命性最强。  中国工人阶级是近代中国社会中最先进、最革命、最有力量的阶级。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (166, 1, '甲午战争中，英勇牺牲的致远舰管带是', 1, 'peadmin', '', '&lt;p&gt;A. 邓世昌&lt;/p&gt;&lt;p&gt;B. 林永升&lt;/p&gt;&lt;p&gt;C. 刘步蟾&lt;/p&gt;&lt;p&gt;D. 左宝贵&lt;/p&gt;', 4, 'A', '中日甲午战争中，爱国将士浴血奋战。左宝贵战死平壤，致远舰管带邓世昌、经远舰管带林永升在黄海战斗中英勇牺牲，北洋舰队统帅丁汝昌、定远舰管带刘步蟾在威海战斗中为国捐躯。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"3\";s:5:\"knows\";s:58:\"第三节 抵御外来侵略、争取民族独立的斗争\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (167, 1, '近代中国睁眼看世界的第一人是', 1, 'peadmin', '', '&lt;p&gt;A. 魏源&lt;/p&gt;&lt;p&gt;B. 林则徐&lt;/p&gt;&lt;p&gt;C. 龚自珍&lt;/p&gt;&lt;p&gt;D. 洪仁玕&lt;/p&gt;', 4, 'B', '自1840年以来，从林则徐等爱国官员和将士到义和团的勇土们，进行了前赴后继的英勇斗争。尽管这些斗争最终都归于失败，但它粉碎了西方列强瓜分中国的图谋，并唤醒了中华民族的独立自强意识。林则徐在民族意识觉醒中起着重要的作用，他被誉为近代中国睁眼看世界的第一人。他除了坚决主张严禁鸦片，组织渔民等以抵御外国侵略以外，还注意了解西方，赞成正常的对外贸易。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"3\";s:5:\"knows\";s:58:\"第三节 抵御外来侵略、争取民族独立的斗争\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (168, 1, '下列不属于近代中国人民民族意识觉醒的代表作是', 1, 'peadmin', '', '&lt;p&gt;A. 《海国图志》&lt;/p&gt;&lt;p&gt;B. 《盛世危言》&lt;/p&gt;&lt;p&gt;C. 《天演论》&lt;/p&gt;&lt;p&gt;D. 《地理大全》&lt;/p&gt;', 4, 'D', '鸦片战争爆发后，先进的中国人开始寻找救国救民的真理，民族意识开始觉醒。代表作有：魏源在《四洲志》基础上编纂的《海国图志》，严复的《救亡决论》及其翻译的《天演论》，以及郑观应创作于1894年的《盛世危言》。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"3\";s:5:\"knows\";s:58:\"第三节 抵御外来侵略、争取民族独立的斗争\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (169, 1, '割让台湾全岛及所有附属岛屿和澎湖列岛给日本的不平等条约是', 1, 'peadmin', '', '&lt;p&gt;A. 《辛丑条约》&lt;/p&gt;&lt;p&gt;B. 《马关条约》&lt;/p&gt;&lt;p&gt;C. 《北京条约》&lt;/p&gt;&lt;p&gt;D. 《南京条约》&lt;/p&gt;', 4, 'B', '1895年，中日《马关条约》签订，中国割让辽东半岛（后由中国政府以3000万两白银赎回）、台湾全岛及所有附属各岛屿和澎湖列岛给日本。答案为B。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:43:\"第一节 鸦片战争前的中国和世界\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (170, 1, '太平天国农民战争爆发的标志是', 1, 'peadmin', '', '&lt;p&gt;A. 金田起义&lt;/p&gt;&lt;p&gt;B. 永安建制&lt;/p&gt;&lt;p&gt;C. 长沙战役&lt;/p&gt;&lt;p&gt;D. 南京定都&lt;/p&gt;', 4, 'A', '1851年，洪秀全在广西金田村起义，建号太平天国。金田起义是太平天国农民战争爆发的标志。答案为A.', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"4\";s:5:\"knows\";s:43:\"第一节 农民群众斗争风暴的起落\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (171, 1, '《天朝田亩制度》确立的平分土地的原则是', 1, 'peadmin', '', '&lt;p&gt;A. 平均地权&lt;/p&gt;&lt;p&gt;B. 凡天下田，天下人同耕&lt;/p&gt;&lt;p&gt;C. 均贫富、等贵贱&lt;/p&gt;&lt;p&gt;D. 免劳役、不纳粮&lt;/p&gt;', 4, 'B', '《天朝田亩制度》确立了平均分配土地的方案，根据“凡天下田，天下人同耕”的原则，田 地分为9 等，好坏搭配，不论男女老幼按人口平 均分配，16岁以上分一整份。16岁以下分一半。答案为B.', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"4\";s:5:\"knows\";s:43:\"第一节 农民群众斗争风暴的起落\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (172, 1, '《资政新篇》的致命弱点是', 1, 'peadmin', '', '&lt;p&gt;A. 没有超出农民小生产者的狭隘眼界&lt;/p&gt;&lt;p&gt;B. 所追求的社会理想，是不切实际的空想&lt;/p&gt;&lt;p&gt;C. 资本主义色彩太浓&lt;/p&gt;&lt;p&gt;D. 通篇未涉及农民问题和土地问题&lt;/p&gt;', 4, 'D', '《资政新篇》是一个带有鲜明的资本主义色彩的改 革与建设方案，但通篇未涉及农民问题和土地问题。这一致命弱点，决定了这个方案从一开始就缺乏实施的阶级基础和社会条件。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"4\";s:5:\"knows\";s:43:\"第一节 农民群众斗争风暴的起落\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (173, 1, '下列不属于洋务运动的主要代表人物有', 1, 'peadmin', '', '&lt;p&gt;A. 奕?&lt;/p&gt;&lt;p&gt;B. 李鸿章&lt;/p&gt;&lt;p&gt;C. 曾国藩&lt;/p&gt;&lt;p&gt;D. 严复&lt;/p&gt;', 4, 'D', '19世纪60年代，西方列强对中国的侵略逐步加深。同时，太平天国农民起义也极大地冲击了清政府的统治。面对中国“数千年未有之变局”，封建统治阶级中的部分成员主张仿造西方的武器装备，学习西方的科学技术，以“自强”、“求富”为目标，兴办洋务。主要代表人物如奕?、曾国藩、李鸿章、左宗棠、张之洞、刘坤一等被称为洋务派。其中，恭亲王奕?是清朝统治集团中倡导洋务的首领。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"5\";s:5:\"knows\";s:61:\"第二节 地主阶级统治集团“自救”活动的兴衰\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (174, 1, '1861年，清政府公然宣布  ，中外反动势力勾结在一起镇压太平天国。', 1, 'peadmin', '', '&lt;p&gt;A. “借师助剿”&lt;/p&gt;&lt;p&gt;B. “师夷长技”&lt;/p&gt;&lt;p&gt;C. “交通外援”&lt;/p&gt;&lt;p&gt;D. “量中华之物力，结与国之欢心”&lt;/p&gt;', 4, 'A', '1861年，清政府公然宣布“借师助剿”，中外反动势力勾结在一起镇压太平天国。太平天国将士们与英法军队和由外国军官指挥的“常胜军”、“常捷军”进行了英勇的斗争。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"5\";s:5:\"knows\";s:61:\"第二节 地主阶级统治集团“自救”活动的兴衰\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (175, 1, '洋务派举办近代军事工业的首要目的是', 1, 'peadmin', '', '&lt;p&gt;A. 加强海防、边防，抵御外国侵略&lt;/p&gt;&lt;p&gt;B. 镇压太平天国起义&lt;/p&gt;&lt;p&gt;C. 维护清朝统治&lt;/p&gt;&lt;p&gt;D. 为民用企业的创办打下基础&lt;/p&gt;', 4, 'B', '洋务派举办洋务是从近代军用工业着手的，其目的首先是为了镇压太平天国起义；同时，也是为了加强海防、边防，抵御外国侵略。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"5\";s:5:\"knows\";s:61:\"第二节 地主阶级统治集团“自救”活动的兴衰\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (176, 1, '洋务派创办的官督商办的民用企业的性质是', 1, 'peadmin', '', '&lt;p&gt;A. 资本主义性质  &lt;/p&gt;&lt;p&gt;B. 封建主义性质&lt;/p&gt;&lt;p&gt;C. 半封建性质&lt;/p&gt;&lt;p&gt;D. 半殖民地性质&lt;/p&gt;', 4, 'A', '洋务派创办的官督商办的民用企业虽然受官僚的控制，发展受到很大的限制，但基本上是资本主义性质的近代企业。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"5\";s:5:\"knows\";s:61:\"第二节 地主阶级统治集团“自救”活动的兴衰\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (177, 1, '1862年奏请创办京师同文馆的是', 1, 'peadmin', '', '&lt;p&gt;A. 曾国藩&lt;/p&gt;&lt;p&gt;B. 李鸿章&lt;/p&gt;&lt;p&gt;C. 奕?&lt;/p&gt;&lt;p&gt;D. 张之洞&lt;/p&gt;', 4, 'C', '为培养懂得西方先进技术的专业人才，洋务派创办新式学堂30多所。创建翻译学堂，培养翻译人才，便是其中一种形式。典型事件为：1862年奕?奏请创办京师同文馆，1863年李鸿章在上海创办广方言馆。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"5\";s:5:\"knows\";s:61:\"第二节 地主阶级统治集团“自救”活动的兴衰\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (178, 1, '中国近代教育的开启者是', 1, 'peadmin', '', '&lt;p&gt;A. 早期维新思想家&lt;/p&gt;&lt;p&gt;B. 洋务派&lt;/p&gt;&lt;p&gt;C. 维新派&lt;/p&gt;&lt;p&gt;D. 资产阶级革命派&lt;/p&gt;', 4, 'B', '洋务派开办了一批新式学堂，派出了最早的官派留学生，这是中国近代教育的开始。因此，洋务派是中国近代教育的开启者。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"6\";s:5:\"knows\";s:40:\"第三节 维新运动的兴起和夭折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (179, 1, '19世纪90年代，资产阶级维新派与封建守旧派论战的主要问题不包括', 1, 'peadmin', '', '&lt;p&gt;A. 要不要变法&lt;/p&gt;&lt;p&gt;B. 要不要实行君主立宪&lt;/p&gt;&lt;p&gt;C. 要不要实行民主共和&lt;/p&gt;&lt;p&gt;D. 要不要废科举和兴学堂&lt;/p&gt;', 4, 'C', '维新运动是一次具有相当规模的政治运动的兴起，它是列强在华划分势力范围、民族危机急剧激化的产物。维新运动的高涨，引起了守旧势力的反对。维新派和守旧派之间的论战主要围绕要不要变法、要不要兴民权、设议院，实行君主立宪、要不要废八股、改科举和兴学堂这三个问题展开。维新派和守旧派的论战，实质上是资产阶级思想与封建主义思想在中国的第一次正面交锋。通过这场论战，进一步开阔了知识分子的眼界，解放了思想，为维新变法运动作了思想舆论的准备。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"6\";s:5:\"knows\";s:40:\"第三节 维新运动的兴起和夭折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (180, 1, '下列不属于早期维新思想家的代表人物的是', 1, 'peadmin', '', '&lt;p&gt;A. 郑观应&lt;/p&gt;&lt;p&gt;B. 严复&lt;/p&gt;&lt;p&gt;C. 马建忠&lt;/p&gt;&lt;p&gt;D. 冯桂芬&lt;/p&gt;', 4, 'B', '早期维新思想家的代表人物有冯桂芬、王韬、薛福成、马建忠、郑观应、陈虬、陈炽、何启、胡礼垣等人。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"6\";s:5:\"knows\";s:40:\"第三节 维新运动的兴起和夭折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (181, 1, '戊戌维新运动发生在', 1, 'peadmin', '', '&lt;p&gt;A. 鸦片战争后&lt;/p&gt;&lt;p&gt;B. 中法战争后&lt;/p&gt;&lt;p&gt;C. 中日甲午战争后&lt;/p&gt;&lt;p&gt;D. 八国联军侵华战争后&lt;/p&gt;', 4, 'C', '中日甲午战争后，人们普遍对洋务派所标榜的“求富”、“自强”口号发生怀疑，逐渐形成了一种共识，即要救国，只有维新。康有为、梁启超、谭嗣同、严复等成为推动维新思想的领军人物，并于1898 年把这种思潮发展成为一场变法维新的政治运动。答案为C.', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"6\";s:5:\"knows\";s:40:\"第三节 维新运动的兴起和夭折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (182, 1, '严复将英国人赫胥黎的《进化与伦理》的前两篇翻译为', 1, 'peadmin', '', '&lt;p&gt;A. 《天演论》&lt;/p&gt;&lt;p&gt;B. 《穆勒名学》&lt;/p&gt;&lt;p&gt;C. 《原富》&lt;/p&gt;&lt;p&gt;D. 《法意》&lt;/p&gt;', 4, 'A', '著书立说是以康有为、梁启超、谭嗣同、严复等为主要代表的资产阶级维新派宣传变法维新主张的主要方式之一。严复翻译了英国博物学家赫胥黎的《进化与伦理》的前两篇，汉译名为《天演论》。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"6\";s:5:\"knows\";s:40:\"第三节 维新运动的兴起和夭折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (183, 1, '从1898年6月11日到9月21日，光绪帝颁布了一系列变法上谕，史称', 1, 'peadmin', '', '&lt;p&gt;A. 公车上书&lt;/p&gt;&lt;p&gt;B. 自强求富&lt;/p&gt;&lt;p&gt;C. 戊戌政变&lt;/p&gt;&lt;p&gt;D. 百日维新&lt;/p&gt;', 4, 'D', '1898年6月11日，光绪皇帝在维新派的推动和策划下，颁布“明定国是”诏书，宣布开始变法。在此后的103天里，光绪皇帝颁布了一系列变法上谕。史称“百日维新”。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"6\";s:5:\"knows\";s:40:\"第三节 维新运动的兴起和夭折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (184, 1, '资产阶级思想与封建主义思想在中国的第一次正面交锋是', 1, 'peadmin', '', '&lt;p&gt;A. 洋务派与守旧派的争论&lt;/p&gt;&lt;p&gt;B. 维新派与守旧派的论战&lt;/p&gt;&lt;p&gt;C. 革命派与维新派的论战&lt;/p&gt;&lt;p&gt;D. “问题与主义”之争&lt;/p&gt;', 4, 'B', '维新派和守旧派的论战，涉及领域十分广泛，比较集中反映了近代中国在文化思想领域中学和西学、新学和旧学之争。这次论战实质上是资产阶级思想与封建主义思想在中国的第一次正面交锋。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"6\";s:5:\"knows\";s:40:\"第三节 维新运动的兴起和夭折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (185, 1, '戊戌维新运动失败的主要原因是', 1, 'peadmin', '', '&lt;p&gt;A. 中国民族资本主义经济力量十分弱小&lt;/p&gt;&lt;p&gt;B. 维新派把希望完全寄托在一个没有实权的皇帝身上&lt;/p&gt;&lt;p&gt;C. 没有发动群众的支持&lt;/p&gt;&lt;p&gt;D. 维新派自身的局限和以慈禧太后为首的强大的守旧势力的反对&lt;/p&gt;', 4, 'D', '戊戌维新运动失败的主要原因在于维新派自身的局限和以慈禧太后为首的强大的守旧势力的反对。维新派既无严密的组织，又不掌握军队，也未发动群众的支持，把希望完全寄托在没有实权的皇帝身上，其结果只能是失败。答案为D.', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"6\";s:5:\"knows\";s:40:\"第三节 维新运动的兴起和夭折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (186, 1, '资产阶级革命派的骨干力量是一批资产阶级和', 1, 'peadmin', '', '&lt;p&gt;A. 地主阶级&lt;/p&gt;&lt;p&gt;B. 资产阶级知识分子&lt;/p&gt;&lt;p&gt;C. 小资产阶级知识分子&lt;/p&gt;&lt;p&gt;D. 工农阶级&lt;/p&gt;', 4, 'C', '资产阶级革命派的骨干力量是一批资产阶级和小资产阶级知识分子。这个知识分子群是随着19世纪末20世纪初清政府兴学堂、派留学生而逐渐形成的。答案为C.', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"7\";s:5:\"knows\";s:49:\"第一节 举起近代民族民主革命的旗帜\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (187, 1, '标志着以慈禧太后为首的清政府已彻底放弃了抵抗外国侵略者的念头，甘为“洋人的朝廷”的不平等条约是', 1, 'peadmin', '', '&lt;p&gt;A. 《南京条约》&lt;/p&gt;&lt;p&gt;B. 《北京条约》&lt;/p&gt;&lt;p&gt;C. 《马关条约》&lt;/p&gt;&lt;p&gt;D. 《辛丑条约》&lt;/p&gt;', 4, 'D', '《辛丑条约》的签订，标志着以慈禧太后为首的清政府已彻底放弃了抵抗外国侵略者的念头，甘为“洋人的朝廷”。答 案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"7\";s:5:\"knows\";s:49:\"第一节 举起近代民族民主革命的旗帜\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (188, 1, '1905年8月，中国同盟会成立时所确定的机关刊物是', 1, 'peadmin', '', '&lt;p&gt;A. 《民报》&lt;/p&gt;&lt;p&gt;B. 《新民丛报》&lt;/p&gt;&lt;p&gt;C. 《时务报》&lt;/p&gt;&lt;p&gt;D. 《万国公报》&lt;/p&gt;', 4, 'A', '孙中山、黄兴等人于1905年8月20日在东京成立中国同盟会，孙中山被公举为总理，黄兴被任命为执行部庶务，实际主持会内日常工作。同盟会以“驱除鞑虏，恢复中华，创立民国，平均地权”为纲领，机关报为《民报》。中国同盟会是近代中国第一个全国性的资产阶级性质的政党，它的成立标志着中国资产阶级民主革命进入了一个新阶段。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"7\";s:5:\"knows\";s:49:\"第一节 举起近代民族民主革命的旗帜\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (189, 1, '20世纪初，继兴中会之后，资产阶级革命团体在各地陆续成立。其中，华兴会的会长是', 1, 'peadmin', '', '&lt;p&gt;A. 蔡元培&lt;/p&gt;&lt;p&gt;B. 章太炎&lt;/p&gt;&lt;p&gt;C. 黄兴&lt;/p&gt;&lt;p&gt;D. 孙中山&lt;/p&gt;', 4, 'C', '20世纪初，继兴中会之后，资产阶级革命团体在各地 陆续成立。其中重要的有黄兴为会长的华兴会、蔡元培为会长的光复会以及科学补习所、岳王会等。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"7\";s:5:\"knows\";s:49:\"第一节 举起近代民族民主革命的旗帜\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (190, 1, '1905年8月20日，孙中山、黄兴等人成立中国同盟会，孙中山被公举为总理。中国同盟会的成立是在', 1, 'peadmin', '', '&lt;p&gt;A. 香港&lt;/p&gt;&lt;p&gt;B. 广州&lt;/p&gt;&lt;p&gt;C. 东京&lt;/p&gt;&lt;p&gt;D. 檀香山&lt;/p&gt;', 4, 'C', '1905年8月20日，孙中山、黄兴等人在东京成立中国同盟会，同盟会以“驱除鞑虏，恢复中华，创立民国，平均地权”为纲领，机关报为《民报》。中国同盟会是近代中国第一个全国性的资产阶级性质的政党，它的成立标志着中国资产阶级民主革命进入了一个新阶段。答 案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"7\";s:5:\"knows\";s:49:\"第一节 举起近代民族民主革命的旗帜\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (191, 1, '标志着中国资产阶级民主革命进入了一个新阶段的是', 1, 'peadmin', '', '&lt;p&gt;A. 兴中会盼成立&lt;/p&gt;&lt;p&gt;B. 广州起义&lt;/p&gt;&lt;p&gt;C. 中国同盟会的成立&lt;/p&gt;&lt;p&gt;D. 三民主义的提出&lt;/p&gt;', 4, 'C', '中国同盟会的成立标志着中国资产阶级民主革命进入了一个新阶段。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"7\";s:5:\"knows\";s:49:\"第一节 举起近代民族民主革命的旗帜\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (192, 1, '1905年8月，孙中山、黄兴 等人在东京成立中国同盟会。同盟会的纲领不包括', 1, 'peadmin', '', '&lt;p&gt;A. 驱除鞑虏，恢复中华&lt;/p&gt;&lt;p&gt;B. 驱除鞑虏，恢复中国&lt;/p&gt;&lt;p&gt;C. 创立民国&lt;/p&gt;&lt;p&gt;D. 平均地权&lt;/p&gt;', 4, 'B', '1905年8月，孙中山、黄兴等人在东京成立中国同盟会。同盟会以“驱除鞑虏，恢复中华，创立民国，平均地权”为纲领，机关报为《民报》。答案为B.', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"7\";s:5:\"knows\";s:49:\"第一节 举起近代民族民主革命的旗帜\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (193, 1, '20世纪初，以孙中山为代表的革命派和以康有为为代表的改良派，分别以《民报》和    为舆论阵地展开了论战。', 1, 'peadmin', '', '&lt;p&gt;A. 《国闻报》&lt;/p&gt;&lt;p&gt;B. 《新民丛报》&lt;/p&gt;&lt;p&gt;C. 《万国公报》&lt;/p&gt;&lt;p&gt;D. 《大公报》&lt;/p&gt;', 4, 'B', '1905 年至1907 年，以孙中山为代表的革命派和以康有为为代表的改良派，分别以《民报》和《新民丛报》为主要舆论阵地展开论战。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"8\";s:5:\"knows\";s:40:\"第二节 辛亥革命的胜利与失败\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (194, 1, '在1911年爆发的保路运动中，规模最大、斗争最激烈的省份是', 1, 'peadmin', '', '&lt;p&gt;A. 四川&lt;/p&gt;&lt;p&gt;B. 湖南&lt;/p&gt;&lt;p&gt;C. 广东&lt;/p&gt;&lt;p&gt;D. 湖北&lt;/p&gt;', 4, 'A', '1911年5月，清政府皇族内阁为筹集借款，宣布“铁路干线收归国有”，并将粤汉、川汉铁路的路权出卖给帝国主义，引起湖北、湖南、广东、四川四省民众的强烈反对，一场事关民族权益和个人利益的保路运动就这样兴起了，四川省尤其强烈。一开始各省立宪派倡导文明保路，但遭清政府镇压。署理四川总督赵尔丰竞下令向请愿群众开枪，当场打死30多人，造成成都血案。广大群众忍无可忍，在同盟会会员的参与下，掀起了全川的武装暴动。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"8\";s:5:\"knows\";s:40:\"第二节 辛亥革命的胜利与失败\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (195, 1, '清末保路运动是', 1, 'peadmin', '', '&lt;p&gt;A. 一场事关民族权益和个人利益的运动&lt;/p&gt;&lt;p&gt;B. 保护道路不受破坏的运动&lt;/p&gt;&lt;p&gt;C. 各省立宪派自始至终倡导武装保路&lt;/p&gt;&lt;p&gt;D. 直接导致了清政府的覆亡&lt;/p&gt;', 4, 'A', '一场事关民族权益和个人利益的保路运动就这样兴起了。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"8\";s:5:\"knows\";s:40:\"第二节 辛亥革命的胜利与失败\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (196, 1, '标志中国延续两千余年封建帝制覆灭的历史事件是', 1, 'peadmin', '', '&lt;p&gt;A. 武昌起义爆发&lt;/p&gt;&lt;p&gt;B. 中华民国南京临时政府成立&lt;/p&gt;&lt;p&gt;C. 清帝退位&lt;/p&gt;&lt;p&gt;D. 皇族内阁解散&lt;/p&gt;', 4, 'C', '武昌起义引来了全国响应，掀起了辛亥革命的高潮。1912年2月12日，清帝退位，在中国延续了两千 余年的封建帝制终于覆灭。因此，标志中国封建帝制覆灭的历史事件是清帝退位。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"8\";s:5:\"knows\";s:40:\"第二节 辛亥革命的胜利与失败\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (197, 1, '中华民国南京临时政府是', 1, 'peadmin', '', '&lt;p&gt;A. 资产阶级共和国性质的革命政权&lt;/p&gt;&lt;p&gt;B. 大地主大资产阶级专制政府&lt;/p&gt;&lt;p&gt;C. 无产阶级占主导地位的政权&lt;/p&gt;&lt;p&gt;D. 各阶级联合执政的政府&lt;/p&gt;', 4, 'A', '南京临时政府是一个资产阶级共和国性质的革命政权。(1)在人员构成上，资产阶级革命派控制着这个政权。(2)在实施的各项政策措施上，集中体现了中国民族资产阶级的愿望和利益，也一定程度上符合广大中国人民的利益。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"8\";s:5:\"knows\";s:40:\"第二节 辛亥革命的胜利与失败\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (198, 1, '辛亥革命的性质是', 1, 'peadmin', '', '&lt;p&gt;A. 无产阶级社会主义革命&lt;/p&gt;&lt;p&gt;B. 旧式的资产阶级民主主义革命&lt;/p&gt;&lt;p&gt;C. 新式的资产阶级民主主义革命&lt;/p&gt;&lt;p&gt;D. 资产阶级维新运动&lt;/p&gt;', 4, 'B', '辛亥革命属于旧式的资产阶级民主主义革命。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"8\";s:5:\"knows\";s:40:\"第二节 辛亥革命的胜利与失败\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (199, 1, '袁世凯建立的北洋军阀政权代表的是', 1, 'peadmin', '', '&lt;p&gt;A. 大地主和买办资产阶级的利益&lt;/p&gt;&lt;p&gt;B. 大资产阶级的利益&lt;/p&gt;&lt;p&gt;C. 民族资本家和中小资产阶级的利益&lt;/p&gt;&lt;p&gt;D. 资产阶级和广大人民的利益&lt;/p&gt;', 4, 'A', '袁世凯窃夺辛亥革命的果实之后，建立了代表大地主和买办资产阶级利益的北洋军阀政权，开始了北洋军阀统治中国的时期。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"8\";s:5:\"knows\";s:40:\"第二节 辛亥革命的胜利与失败\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (200, 1, '1919年10月，孙中山将中华革命党改组为', 1, 'peadmin', '', '&lt;p&gt;A. 中国革命党&lt;/p&gt;&lt;p&gt;B. 革命党&lt;/p&gt;&lt;p&gt;C. 中国国民党&lt;/p&gt;&lt;p&gt;D. 中华国民党&lt;/p&gt;', 4, 'C', '1919年10月，孙中山将中华 革命党 改组为中国国民党。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"8\";s:5:\"knows\";s:40:\"第二节 辛亥革命的胜利与失败\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (201, 1, '1913年，为反对袁世凯刺杀宋教仁和“善后大借款”，资产阶级革命派发动了', 1, 'peadmin', '', '&lt;p&gt;A. 二次革命&lt;/p&gt;&lt;p&gt;B. 护国运动&lt;/p&gt;&lt;p&gt;C. 第一次护法运动  &lt;/p&gt;&lt;p&gt;D. 第二次护法运动&lt;/p&gt;', 4, 'A', '为反对袁世凯刺杀宋教仁和“善后大借款”，1913 年7月，李烈钧在江西湖口通电讨袁，不久黄兴在南京宣布讨袁，其他地方如上海、安徽、湖 南、广东、福建等地也先后响应。战争主要在九江、南京一带进行，史称“赣宁之战”，又称“二次革命”。答为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"8\";s:5:\"knows\";s:40:\"第二节 辛亥革命的胜利与失败\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (202, 1, '为反对袁世凯刺杀宋教仁和“善后大借款”，1913年7月，在江西湖口通电讨袁的是', 1, 'peadmin', '', '&lt;p&gt;A. 李烈钧&lt;/p&gt;&lt;p&gt;B. 黄兴&lt;/p&gt;&lt;p&gt;C. 蔡锷&lt;/p&gt;&lt;p&gt;D. 孙中山&lt;/p&gt;', 4, 'A', '为了反对袁世凯刺杀宋教仁和“善后大借款”，1913 年 7月，李烈钧在江西湖口通电讨袁，不久黄兴在南京宣布讨袁，其他地方如上海、安徽、湖 南、广东、福建等地也先后响应。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"8\";s:5:\"knows\";s:40:\"第二节 辛亥革命的胜利与失败\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (203, 1, '新文化运动的主要内容是', 1, 'peadmin', '', '&lt;p&gt;A. “自强”、“求富”  &lt;/p&gt;&lt;p&gt;B. 传播马克思主义  &lt;/p&gt;&lt;p&gt;C. 救国图存&lt;/p&gt;&lt;p&gt;D. 提倡民主和科学&lt;/p&gt;', 4, 'D', '新文化运动的主要内容为提倡民主和科学。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"9\";s:5:\"knows\";s:40:\"第一节 新文化运动与五四运动\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (204, 1, '新文化运动倡导的是', 1, 'peadmin', '', '&lt;p&gt;A. 资产阶级的民主主义&lt;/p&gt;&lt;p&gt;B. 无产阶级的民主主义&lt;/p&gt;&lt;p&gt;C. 小资产阶级的自由主义&lt;/p&gt;&lt;p&gt;D. 农民阶级的平均主义&lt;/p&gt;', 4, 'A', '五四前的新文化运动是一场由民主主义知识分子领导的资产阶级民主主义革命性质的思想启蒙运动。  答 案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"9\";s:5:\"knows\";s:40:\"第一节 新文化运动与五四运动\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (205, 1, '五四运动的中心由北京转移到上海后，运动的新特点是', 1, 'peadmin', '', '&lt;p&gt;A. 商人罢市&lt;/p&gt;&lt;p&gt;B. 学生大规模罢课&lt;/p&gt;&lt;p&gt;C. 工人阶级登上政治舞台&lt;/p&gt;&lt;p&gt;D. 运动取得初步胜利&lt;/p&gt;', 4, 'C', '1919年六三大逮捕后，五四运动的中心从北京转到上海，运动的主力从学生转为工人。6月5日，上海工人2万余人开始罢工，揭开了工人罢工的序幕，工人阶级登上了政治舞台。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"9\";s:5:\"knows\";s:40:\"第一节 新文化运动与五四运动\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (206, 1, '哪次事件以后，无产阶级逐渐代替资产阶级成为近代中国民族民主革命的领导者？', 1, 'peadmin', '', '&lt;p&gt;A. 辛亥革命&lt;/p&gt;&lt;p&gt;B. 新文化运动&lt;/p&gt;&lt;p&gt;C. 五四运动&lt;/p&gt;&lt;p&gt;D. 第二次护法运动&lt;/p&gt;', 4, 'C', '五四运动后，无产阶级逐渐成为近代中国民族民主革命的领导者。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"10\";s:5:\"knows\";s:55:\"第二节 马克思主义传播与中国共产党诞生\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (207, 1, '1920年，陈独秀等建立的中国共产党早期组织是', 1, 'peadmin', '', '&lt;p&gt;A. 北京共产主义小组&lt;/p&gt;&lt;p&gt;B. 上海共产主义小组&lt;/p&gt;&lt;p&gt;C. 武汉共产主义小纽&lt;/p&gt;&lt;p&gt;D. 广州共产主义小组&lt;/p&gt;', 4, 'B', '中国共产党的最早组织是在中国工人阶级最密集的中心城市——上海成立的。1920 年 8月，上海共产主义小组正式成立，陈独秀任临时书记，成员有李汉俊、李达等。这是中国第一个地方共产党组织。作为党的发起组和联络中心，它在建立全国统一的工人阶级革命政党的过程中起了重要的作用。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"10\";s:5:\"knows\";s:55:\"第二节 马克思主义传播与中国共产党诞生\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (208, 1, '成为中国共产党后备力量的组织是', 1, 'peadmin', '', '&lt;p&gt;A. 中华全国总工会&lt;/p&gt;&lt;p&gt;B. 社会主义青年团&lt;/p&gt;&lt;p&gt;C. 共产主义小组&lt;/p&gt;&lt;p&gt;D. 职工运动委员会&lt;/p&gt;', 4, 'B', '1920年11月，上海 共产党发起组制定《中国共产党宣言》，阐述了共产主义者的理想、目的和阶级斗争现状。与此同时，社会主义青年团在上海成立，成为共产党的后备力量。答案为B.', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"10\";s:5:\"knows\";s:55:\"第二节 马克思主义传播与中国共产党诞生\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (209, 1, '划清了革命与改良界限的论战是', 1, 'peadmin', '', '&lt;p&gt;A. “共和与立宪” &lt;/p&gt;&lt;p&gt;B. “民主与帝制”&lt;/p&gt;&lt;p&gt;C. “问题与主义”&lt;/p&gt;&lt;p&gt;D. “救亡与启蒙”&lt;/p&gt;', 4, 'C', '产党早期组织的成员注重从马克思、恩格斯、列宁的原著来学习马 克思列宁主义，宣传俄国革命的经验，同反马克思主义的思潮进行了三次论战。其中，第一次是同胡适围绕“问题与主义”的论战，刘清了革命与改 良的界限。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"10\";s:5:\"knows\";s:55:\"第二节 马克思主义传播与中国共产党诞生\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (210, 1, '下列没有参与1920年8月上海共产主义小组的成立的是', 1, 'peadmin', '', '&lt;p&gt;A. 陈独秀&lt;/p&gt;&lt;p&gt;B. 陈潭秋&lt;/p&gt;&lt;p&gt;C. 李汉俊&lt;/p&gt;&lt;p&gt;D. 李达&lt;/p&gt;', 4, 'B', '中国共产党的最早组织是1920年8月在中国工人阶级最密集的中心城市一一上海成立的。陈独秀任书记，成员有李 汉俊、李达等。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"10\";s:5:\"knows\";s:55:\"第二节 马克思主义传播与中国共产党诞生\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (211, 1, '早期共产党组织的成员同反马克思主义思潮进行的论战不包括', 1, 'peadmin', '', '&lt;p&gt;A. 同胡适围绕“问题与主义”的论战&lt;/p&gt;&lt;p&gt;B. 同张东荪、梁启超关于社会主义的论战&lt;/p&gt;&lt;p&gt;C. 同无政府主义的论战&lt;/p&gt;&lt;p&gt;D. 同资产阶级保皇派的论战&lt;/p&gt;', 4, 'D', '进行了三次论战。第一次是同胡适围绕“问题与主义”的论战，划清了革命与改 良的界限。第二次是同张东荪、梁启超关于社会主义的论战，强调资本主义道路在中国走不通，中国的出路只能是社会主义。第三次是同无政府主义的论战，指出必须以革命的手段夺取政权，建立无产阶级专政，才能保护劳动者的利益，最终消灭阶级和阶级差别。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"10\";s:5:\"knows\";s:55:\"第二节 马克思主义传播与中国共产党诞生\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (212, 1, '下列属于中共一大通过的党纲内容的是', 1, 'peadmin', '', '&lt;p&gt;A. 消除内乱，打倒军阀&lt;/p&gt;&lt;p&gt;B. 推翻帝国主义压迫&lt;/p&gt;&lt;p&gt;C. 联合共产国际&lt;/p&gt;&lt;p&gt;D. 统一中国为真正的民主共和国&lt;/p&gt;', 4, 'C', '第一次全国代表大会通过中国共产党第一个纲领和第一个决议。规定党的纲领是以无产阶级革命军队推翻资产阶级，采用无产阶级专政以达到 阶级斗争的目的——消灭阶级、废除 资本私有制以及联合共产国际 等。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"10\";s:5:\"knows\";s:55:\"第二节 马克思主义传播与中国共产党诞生\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (213, 1, '中共二大选举了新的中央领导机构，其中，中央执行委员会委员长是', 1, 'peadmin', '', '&lt;p&gt;A. 李大钊&lt;/p&gt;&lt;p&gt;B. 陈独秀&lt;/p&gt;&lt;p&gt;C. 张国焘&lt;/p&gt;&lt;p&gt;D. 李达&lt;/p&gt;', 4, 'B', '1922年7月，中国共产党在上海召开第二次全国代表大会。大会通过了《中国共产党第二次全国代表大会宣言》、《中国共产党章程》等 9个决议案。选举了新的中央领导机构，陈独秀当选为中央执行委员会委员长。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"10\";s:5:\"knows\";s:55:\"第二节 马克思主义传播与中国共产党诞生\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (214, 1, '第一次工人运动由高潮转向低潮的事件是', 1, 'peadmin', '', '&lt;p&gt;A. 长辛店工人罢工 &lt;/p&gt;&lt;p&gt;B. 五卅惨案&lt;/p&gt;&lt;p&gt;C. 上海工人罢工&lt;/p&gt;&lt;p&gt;D. 二七惨案&lt;/p&gt;', 4, 'D', '“二七惨案”后，各地的工会组织除广东、湖 南外都遭封闭，全国工人运动暂时转入了低潮。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"10\";s:5:\"knows\";s:55:\"第二节 马克思主义传播与中国共产党诞生\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (215, 1, '中国工人阶级第一次直接同帝国主义势力进行的有组织的较量是', 1, 'peadmin', '', '&lt;p&gt;A. 香港海员罢工&lt;/p&gt;&lt;p&gt;B. 省港大罢工&lt;/p&gt;&lt;p&gt;C. 京汉铁路工人大罢工&lt;/p&gt;&lt;p&gt;D. 安源路矿工人大罢工&lt;/p&gt;', 4, 'A', '1922年1月，香港海员因要求增加工资而举行罢工。在苏兆征、林伟民等的领导下，罢工坚持了56天，迫使港英当局答应增加工资。这是中国工人阶级第一次直接同帝国主义势力进行的有组织的较量。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"10\";s:5:\"knows\";s:55:\"第二节 马克思主义传播与中国共产党诞生\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (216, 1, '下列没有领导新式农会和农民运动的是', 1, 'peadmin', '', '&lt;p&gt;A. 澎湃&lt;/p&gt;&lt;p&gt;B. 毛泽东&lt;/p&gt;&lt;p&gt;C. 沈定一&lt;/p&gt;&lt;p&gt;D. 王尽美&lt;/p&gt;', 4, 'D', '1921年9月，沈定一等在浙江省山县衙前村成立了第一个农民协会，组织农民开展反抗地主压迫与剥 削的斗争。1922年6月，彭 湃在家乡广东省海 丰县从事农民运动。次年初成立海丰县总农会，组织农民开始减租运动。1923年3月，毛泽东在主持湘区区委工作时，注重开展农民运动，参加农会的会员达10万余人。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"10\";s:5:\"knows\";s:55:\"第二节 马克思主义传播与中国共产党诞生\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (217, 1, '第一次国共合作的政治基础是', 1, 'peadmin', '', '&lt;p&gt;A. 三民主义&lt;/p&gt;&lt;p&gt;B. 新民主主义&lt;/p&gt;&lt;p&gt;C. 新三民主义&lt;/p&gt;&lt;p&gt;D. 社会主义&lt;/p&gt;', 4, 'C', '国国民党第一次全国代表大会于1924 年 1月在广州召开。大会通过的宣言将三民主义阐释为：民族主义突出了反对帝国主义的内容，强调对外争取中华民族的完全独立，同时主张国内各民族一律平等；民权主义强调民权为一般平民所共有，不应为“少数人所得而私”：民生主义在“平均地权”基础上增加了“节制资本”的原则，并提出改善工农的生活状况。这样，旧三民主义发展成为新三民主义。新三民主义和中共在民主革命时期的纲领基本一致，成为国共合作的政治基础和革命统一战线的共同纲领。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"11\";s:5:\"knows\";s:37:\"第三节 国共合作与国民革命\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (218, 1, '第一次国共合作形成的标志是', 1, 'peadmin', '', '&lt;p&gt;A. 中共杭州西湖会议的召开&lt;/p&gt;&lt;p&gt;B. 中共三大的召开&lt;/p&gt;&lt;p&gt;C. 《中国国民党改组宣言》的发表&lt;/p&gt;&lt;p&gt;D. 国民党一大的召开&lt;/p&gt;', 4, 'D', '1924年1月，中国国民党 一次全国代表大会在广州召开。 国民党一大实际上确立了联俄、联 共、扶助农工三大政策。大会的成功召开，标志着以第一次国共合作为基础的革命统一战线的正式形成。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"11\";s:5:\"knows\";s:37:\"第三节 国共合作与国民革命\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (219, 1, '1924年11月，孙中山应冯玉祥邀请北上，并发表《北上宣言》，主张召开', 1, 'peadmin', '', '&lt;p&gt;A. 国民会议&lt;/p&gt;&lt;p&gt;B. 国民参政会&lt;/p&gt;&lt;p&gt;C. 各界民众代表会议&lt;/p&gt;&lt;p&gt;D. 国民善后会议&lt;/p&gt;', 4, 'A', '1924年11月，孙中山发表《北上宣言》，并离开广州北上，沿途宣传召开国民会议和废除不平等条约的主张。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"11\";s:5:\"knows\";s:37:\"第三节 国共合作与国民革命\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (220, 1, '1924年，中国工人运动由低潮转向高潮的信号是', 1, 'peadmin', '', '&lt;p&gt;A. 广州沙面工人罢工&lt;/p&gt;&lt;p&gt;B. 青岛纱厂工人罢工&lt;/p&gt;&lt;p&gt;C. 香港海员罢工&lt;/p&gt;&lt;p&gt;D. 上海码头工人罢工&lt;/p&gt;', 4, 'A', '国共合作促进了工农运动的恢复和发展。1924年7月广州沙面租界工人罢工的胜利，成为工人运动由低潮转向高潮的信号。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"11\";s:5:\"knows\";s:37:\"第三节 国共合作与国民革命\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (221, 1, '中国共产党第一次明确提出无产阶级领导权和工农联盟问题的会议是', 1, 'peadmin', '', '&lt;p&gt;A. 中共一大&lt;/p&gt;&lt;p&gt;B. 中共二大&lt;/p&gt;&lt;p&gt;C. 中共三大&lt;/p&gt;&lt;p&gt;D. 中共四大&lt;/p&gt;', 4, 'D', '中共四大的中心议题是讨论党如何领导即将到来的革命高潮。大会提出无产阶级在民主革命中的领导权和工农联盟问题，制定了开展工农运动的计划，并决定在全国建立和加强党的组织，以适应革命形势发展的要求。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"11\";s:5:\"knows\";s:37:\"第三节 国共合作与国民革命\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (222, 1, '中国工人运动史上前所未有的壮举，对大革命高潮的形成起了重要推动作用的是', 1, 'peadmin', '', '&lt;p&gt;A. 省港大罢工&lt;/p&gt;&lt;p&gt;B. 京汉铁路工人大罢工&lt;/p&gt;&lt;p&gt;C. 五卅运动&lt;/p&gt;&lt;p&gt;D. 香港海员大罢工&lt;/p&gt;', 4, 'A', '省港大罢工是由广州、香港两地工人于1925年6月19日举行的大规模罢工运动。这次大罢工前后坚持了16个月，是中国工人运动史上前所未有的壮举，对大革命高潮的形成起了重要的推动作用。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"11\";s:5:\"knows\";s:37:\"第三节 国共合作与国民革命\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (223, 1, '北伐战争正式开始于', 1, 'peadmin', '', '&lt;p&gt;A. 9314&lt;/p&gt;&lt;p&gt;B. 9345&lt;/p&gt;&lt;p&gt;C. 9618&lt;/p&gt;&lt;p&gt;D. 9679&lt;/p&gt;', 4, 'D', '1925年7月，国民政府成立。8月，国民政府所辖各部队改编为国民革命军。1926年5月，国民革命军第四军叶挺独立团及第七军一部，作为北伐先遣队先入湖南，揭开了北伐战争的序幕。7月9日，国民革命军举行誓师典礼，北伐战争正式开始。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"11\";s:5:\"knows\";s:37:\"第三节 国共合作与国民革命\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (224, 1, '下列没有在国民党开办的农民运动讲习所中主持过工作的共产党人是', 1, 'peadmin', '', '&lt;p&gt;A. 毛泽东&lt;/p&gt;&lt;p&gt;B. 彭湃&lt;/p&gt;&lt;p&gt;C. 刘少奇&lt;/p&gt;&lt;p&gt;D. 阮啸仙&lt;/p&gt;', 4, 'C', '1924年7月起在广州开办农民运动讲习所，先后由 共产党人彭 湃、阮啸仙、毛泽东等主持，培养了一批农民运动的骨干力量。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"11\";s:5:\"knows\";s:37:\"第三节 国共合作与国民革命\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (225, 1, '中国共产党独立领导革命战争、创建人民军队的开端是', 1, 'peadmin', '', '&lt;p&gt;A. 南昌起义&lt;/p&gt;&lt;p&gt;B. 秋收起义&lt;/p&gt;&lt;p&gt;C. 广州起义&lt;/p&gt;&lt;p&gt;D. 百色起义&lt;/p&gt;', 4, 'A', '南昌起义的历史意义主要有以下几个方面：(1)它打响了武装反抗国民党反动统治的第一枪，体现了中国共产党人为实行中国人民的根本利益和中华民族的解放事业而前赴后继的革命精神。(2)它成为共产党独立领导革命战争、创建人民军队和武装夺取政权的伟大开端。(3)它揭开了土地革命战争的序幕。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"13\";s:5:\"knows\";s:58:\"第二节 中国共产党对革命新道路的艰苦探索\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (226, 1, '1935年1月，中国共产党在红军长征途中召开了具有历史转折意义的', 1, 'peadmin', '', '&lt;p&gt;A. 古田会议&lt;/p&gt;&lt;p&gt;B. 遵义会议&lt;/p&gt;&lt;p&gt;C. 两河口会议&lt;/p&gt;&lt;p&gt;D. 瓦窑堡会议&lt;/p&gt;', 4, 'B', '中共中央政治局于1935 年 1月15日至17日在遵义召开扩大会议。会议集中全力解决了当时具有决定意义的军事和组织问题。遵义会议在极其危急的情况下挽救了中国共产党、挽救了中国工农红军、挽救了中国革命，开始确立了以毛泽东为代表的新的中央的领导，成为中国共产党历史上一个生死攸关的转折点，标志着中国共产党在政治上走向成熟。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"14\";s:5:\"knows\";s:46:\"第三节 中国革命在探索中曲折前进\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (227, 1, '1928年10月，国民党中央常务委员会通过什么文件，彻底废除议会制度。', 1, 'peadmin', '', '&lt;p&gt;A. 《军政纲领》&lt;/p&gt;&lt;p&gt;B. 《训政纲领》&lt;/p&gt;&lt;p&gt;C. 《宪政纲领》&lt;/p&gt;&lt;p&gt;D. 《建国纲领》&lt;/p&gt;', 4, 'B', '国民党实行的是代表地主阶级、买办性的大资产阶级利益的一党专政和军事独裁统治。1928 年 10月，国民党中央常务委员会通过了《训政纲领》，北洋政府时期还在形式上存在的议会制度被彻底废除了。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"12\";s:5:\"knows\";s:67:\"第一节 国民党在全国的统治和中间党派的政治主张\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (228, 1, '国民党实行的一党专政和军事独裁统治代表了地主阶级和', 1, 'peadmin', '', '&lt;p&gt;A. 民族资产阶级利益&lt;/p&gt;&lt;p&gt;B. 小资产阶级利益&lt;/p&gt;&lt;p&gt;C. 买办性大资产阶级利益&lt;/p&gt;&lt;p&gt;D. 无产阶级利益&lt;/p&gt;', 4, 'C', '国民党实行的一党专政和军事独裁统治代表了地主阶级、买办性的大资产阶级利益。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"12\";s:5:\"knows\";s:67:\"第一节 国民党在全国的统治和中间党派的政治主张\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (229, 1, '国民党统治时期，其经济基础是', 1, 'peadmin', '', '&lt;p&gt;A. 封建经济&lt;/p&gt;&lt;p&gt;B. 资本主义经济&lt;/p&gt;&lt;p&gt;C. 半殖民地半封建经济&lt;/p&gt;&lt;p&gt;D. 国家垄断资本&lt;/p&gt;', 4, 'D', '国民党在全国的统治建立以后，官僚买办资本急剧地膨胀起来。官僚资本和国家政权结合在一起，同外国帝国主义、本国地主阶级密切地结合在一起，成为买办的封建的国家垄断资本，成为国民党统治的经济基础。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"12\";s:5:\"knows\";s:67:\"第一节 国民党在全国的统治和中间党派的政治主张\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (230, 1, '为镇压人民和消除异己力量，国民党建立了庞大的全国性特务系统，主要有“军统”和', 1, 'peadmin', '', '&lt;p&gt;A. “保甲”&lt;/p&gt;&lt;p&gt;B. “中统”&lt;/p&gt;&lt;p&gt;C. “青帮”&lt;/p&gt;&lt;p&gt;D. “密使”&lt;/p&gt;', 4, 'B', '为镇压人民和消除异己力量，国民党建立了庞大的全国性特务系统，主要有隶属于国民党军事委员会的调查统计局“军统”和隶属于国民党中央组织部的调查统计局“中统”。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"12\";s:5:\"knows\";s:67:\"第一节 国民党在全国的统治和中间党派的政治主张\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (231, 1, '国民党统治时期，农民受到的剥削方式是', 1, 'peadmin', '', '&lt;p&gt;A. 地租&lt;/p&gt;&lt;p&gt;B. 商业资本&lt;/p&gt;&lt;p&gt;C. 高利贷资本&lt;/p&gt;&lt;p&gt;D. 以上说法均正确&lt;/p&gt;', 4, 'D', '国民党统治时期，地租剥削侵占农民的全部剩余劳动，除地租外，农民还受商业资本、高利贷资本的超经济剥削。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"12\";s:5:\"knows\";s:67:\"第一节 国民党在全国的统治和中间党派的政治主张\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (232, 1, '国民党四大银行完成其金融垄断的有决定意义的步骤是', 1, 'peadmin', '', '&lt;p&gt;A. 发行金圆券&lt;/p&gt;&lt;p&gt;B. 发行银圆券&lt;/p&gt;&lt;p&gt;C. 发行“法币”&lt;/p&gt;&lt;p&gt;D. 发行军票&lt;/p&gt;', 4, 'C', '官僚资本的垄断活动，首先和主要的是从金融业方面开始的。以“四行二局”为中心的金融垄断体系，不仅完全主宰了全国金融业，而且直接操纵着全国经济。发行“法币”，是四大银行完成其金融垄断的具有决定意义的步骤。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"12\";s:5:\"knows\";s:67:\"第一节 国民党在全国的统治和中间党派的政治主张\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (233, 1, '中国的民族资产阶级所经营的是', 1, 'peadmin', '', '&lt;p&gt;A. 中等规模和小规模的资本主义经济&lt;/p&gt;&lt;p&gt;B. 大规模的资本主义经济&lt;/p&gt;&lt;p&gt;C. 实质上的小农经济&lt;/p&gt;&lt;p&gt;D. 与官僚勾结的官僚资本主义经济&lt;/p&gt;', 4, 'A', '中国的民族资产阶级所经营的，是中等规模和小规模的资本主义经济。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"12\";s:5:\"knows\";s:67:\"第一节 国民党在全国的统治和中间党派的政治主张\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (234, 1, '20世纪二三十年代活跃着的中间党派的社会基础主要是', 1, 'peadmin', '', '&lt;p&gt;A. 工农阶级和上层小资产阶级及其知识分子&lt;/p&gt;&lt;p&gt;B. 大地主资产阶级和民族小资产阶级&lt;/p&gt;&lt;p&gt;C. 工农阶级和大地主资产阶级&lt;/p&gt;&lt;p&gt;D. 民族资产阶级和上层小资产阶级及其知识分子&lt;/p&gt;', 4, 'D', '在20世纪二三十年代中国政治舞台上，活跃着一些处于国共两党之间的中间党派，其社会基础主要是民族资产阶级和上层小资产阶级及其知识分子。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"12\";s:5:\"knows\";s:67:\"第一节 国民党在全国的统治和中间党派的政治主张\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (235, 1, '在20世纪二三十年代中国政治舞台上影响较大的中间党派不包括', 1, 'peadmin', '', '&lt;p&gt;A. 中国国民党临时行动委员会&lt;/p&gt;&lt;p&gt;B. 乡村建设派&lt;/p&gt;&lt;p&gt;C. 华兴会&lt;/p&gt;&lt;p&gt;D. 中国青年党&lt;/p&gt;', 4, 'C', '在20世纪二三十年代中国政治舞台上影响较大的中间党派主要有：中国国民党临时行动委员会、乡村建设派、中华职业教育社、中国青年党、中国国家社会党（再造派）等。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"12\";s:5:\"knows\";s:67:\"第一节 国民党在全国的统治和中间党派的政治主张\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (236, 1, '大革命失败后，革命的力量只有', 1, 'peadmin', '', '&lt;p&gt;A. 民族资产阶级和无产阶级&lt;/p&gt;&lt;p&gt;B. 无产阶级和农民阶级&lt;/p&gt;&lt;p&gt;C. 族资产阶级、农民阶级和其他小资产阶级&lt;/p&gt;&lt;p&gt;D. 无产阶级、农民阶级和其他小资产阶级&lt;/p&gt;', 4, 'D', '大革命失败后的一个时期里，革命的力量只有无产阶级、农民阶级和其他小资产阶级。反革命力量大大超过了有组织的革命力量。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"13\";s:5:\"knows\";s:58:\"第二节 中国共产党对革命新道路的艰苦探索\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (237, 1, '大革命失败后，中国共产党人和革命群众必须回答的两个根本性问题是', 1, 'peadmin', '', '&lt;p&gt;A. 是否坚持维护革命统一战线和怎样坚持革命&lt;/p&gt;&lt;p&gt;B. 是否继续服从共产国际领导和怎样坚持革命&lt;/p&gt;&lt;p&gt;C. 敢不敢坚持革命和怎样坚持革命&lt;/p&gt;&lt;p&gt;D. 敢不敢坚持革命和是否坚持维护革命统一战线&lt;/p&gt;', 4, 'C', '大革命失败后，敢不敢坚持革命？怎样坚持革命？这是中国共产党人和革命群众必须回答的两个根本性问题。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"13\";s:5:\"knows\";s:58:\"第二节 中国共产党对革命新道路的艰苦探索\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (238, 1, '1927 年，中国共产党领导的著名武装起义不包括', 1, 'peadmin', '', '&lt;p&gt;A. 南昌起义&lt;/p&gt;&lt;p&gt;B. 秋收起义&lt;/p&gt;&lt;p&gt;C. 广州起义&lt;/p&gt;&lt;p&gt;D. 平江起义&lt;/p&gt;', 4, 'D', '1927年8月，共产党在南昌举行起义；9月9日，秋收起义爆发；12月11日，广州起义发动。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"13\";s:5:\"knows\";s:58:\"第二节 中国共产党对革命新道路的艰苦探索\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (239, 1, '下列选项中，不属于广州起义领导人的是', 1, 'peadmin', '', '&lt;p&gt;A. 张太雷&lt;/p&gt;&lt;p&gt;B. 叶挺&lt;/p&gt;&lt;p&gt;C. 张闻天&lt;/p&gt;&lt;p&gt;D. 叶剑英&lt;/p&gt;', 4, 'C', '1927年12月11日，中共广东省委书记张太雷和叶挺、叶剑英等领导发动了广州起义。答案为C.', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"13\";s:5:\"knows\";s:58:\"第二节 中国共产党对革命新道路的艰苦探索\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (240, 1, '民主主义革命的基本问题是', 1, 'peadmin', '', '&lt;p&gt;A. 政权问题&lt;/p&gt;&lt;p&gt;B. 农民土地问题&lt;/p&gt;&lt;p&gt;C. 军队问题&lt;/p&gt;&lt;p&gt;D. 领导权问题&lt;/p&gt;', 4, 'B', '红军反“围剿”战争的胜利以及革命根据地的发展，都是同土地革命的开展密切相关的。农民土地问题，是中国共产党领导的新民主主义 革命的一个基本问题。开展土地 革命，就是要消灭封建地主的土地所有制，实行农民的土地所有制。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"13\";s:5:\"knows\";s:58:\"第二节 中国共产党对革命新道路的艰苦探索\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (241, 1, '对1927年后共产党领导的红军和根据地斗争经验的科学概括是', 1, 'peadmin', '', '&lt;p&gt;A. 以城市为中心然后向农村发展&lt;/p&gt;&lt;p&gt;B. 坚持党对军队的领导&lt;/p&gt;&lt;p&gt;C. 村包围城市、武装夺取政权&lt;/p&gt;&lt;p&gt;D. 坚持党的建设&lt;/p&gt;', 4, 'C', '农村包围城市、武装夺取政权的理论，是对1927年后共产党领导的红军和根据地斗争经验的科学概括，它是在以毛泽东为主要代表的中国共产党人同当时党内盛行的把马 克思主义教条化、把共产国际决议和苏联经验神圣化的错误倾向作坚决斗争的基础上逐步 形成的。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"13\";s:5:\"knows\";s:58:\"第二节 中国共产党对革命新道路的艰苦探索\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (242, 1, '抗日战争进入相持阶段后，日本帝国主义对国民党政府采取的政策是', 1, 'peadmin', '', '&lt;p&gt;A. 以军事打击为主，政治诱降为辅&lt;/p&gt;&lt;p&gt;B. 以政治诱降为主，军事打击为辅&lt;/p&gt;&lt;p&gt;C. 军事打击和政治诱降并重&lt;/p&gt;&lt;p&gt;D. 速战速决，武力征服&lt;/p&gt;', 4, 'B', '抗日战争进入相持阶段后，日本改变了“速战速决”的战略方针，准备应付长期战争。1938 年11月，日本政府提出“善邻友好、共同防共、经济提携”的对华三原则，对国民政府采取政治诱降为主、军事打击为辅的方针。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"17\";s:5:\"knows\";s:67:\"第三节 国民党的正面战场与大后方的抗日民主运动\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (243, 1, '1931 年日本帝国主义制造了侵略中国的', 1, 'peadmin', '', '&lt;p&gt;A. 九一八事变&lt;/p&gt;&lt;p&gt;B. 一二八事变&lt;/p&gt;&lt;p&gt;C. 七七事变&lt;/p&gt;&lt;p&gt;D. 八一三事变&lt;/p&gt;', 4, 'A', '1931年日本发动侵略中国的“九一八”事变，企图把中国变为其独占的殖民地。答案为A.', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"15\";s:5:\"knows\";s:49:\"第一节 日本发动灭亡中国的侵略战争\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (244, 1, '20世纪30 年代，日本帝国主义 制造的侵华事件不包括', 1, 'peadmin', '', '&lt;p&gt;A. 九一八事变&lt;/p&gt;&lt;p&gt;B. 华北事变&lt;/p&gt;&lt;p&gt;C. 卢沟桥事变&lt;/p&gt;&lt;p&gt;D. 皖南事变&lt;/p&gt;', 4, 'D', '九一八事变、华北事变、卢沟桥事变（又称七七事变）、皖南事变的爆发时间分别是：19 31 年、1935 年、1937 年、1941 年，只有A、B、C三项发生于20世纪30 年代。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"15\";s:5:\"knows\";s:49:\"第一节 日本发动灭亡中国的侵略战争\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (245, 1, '面对日本发动的“九一八事变”和“华北事变”，国民政府奉行的妥协方针除了“攘外必先安内”之外，还有', 1, 'peadmin', '', '&lt;p&gt;A. 绥靖政策&lt;/p&gt;&lt;p&gt;B. 实行不抵抗主义&lt;/p&gt;&lt;p&gt;C. 持久消耗战&lt;/p&gt;&lt;p&gt;D. 以空间换时间&lt;/p&gt;', 4, 'B', '日本对中国东北、华北实施侵略计划时，国民政府正在全力“围剿”共产党领导的工农红军，对日本实行不抵抗主义和“攘外必先安内”的妥协方针。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"15\";s:5:\"knows\";s:49:\"第一节 日本发动灭亡中国的侵略战争\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (246, 1, '卢沟桥事变发生的时间是', 1, 'peadmin', '', '&lt;p&gt;A. 13363&lt;/p&gt;&lt;p&gt;B. 13697&lt;/p&gt;&lt;p&gt;C. 13636&lt;/p&gt;&lt;p&gt;D. 16438&lt;/p&gt;', 4, 'B', '1937年7月7日，日军挑起卢沟桥事变，发动全面侵华战争。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"15\";s:5:\"knows\";s:49:\"第一节 日本发动灭亡中国的侵略战争\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (247, 1, '1940 年，投降日本建立伪“中华民国国民政府”的是', 1, 'peadmin', '', '&lt;p&gt;A. 汪精卫&lt;/p&gt;&lt;p&gt;B. 段祺瑞&lt;/p&gt;&lt;p&gt;C. 胡汉民&lt;/p&gt;&lt;p&gt;D. 石友三&lt;/p&gt;', 4, 'A', '抗日战争进入相持阶段后，日本加紧政治诱降活动。中国国民党 副总裁汪精卫于1938 年 12月叛国投敌，并在日本的操纵下，于1940 年 3月在南京成立伪“中华民国国民政府”。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"16\";s:5:\"knows\";s:43:\"第二节 从局部抗战到全国性抗战\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (248, 1, '抗战时期，独占了东北全部重工业和铁路交通，控制了东北的经济命脉的公司是', 1, 'peadmin', '', '&lt;p&gt;A. 南满铁路株式公社和南满重工业股份公司&lt;/p&gt;&lt;p&gt;B. 南满铁路株式公社和华北开发股份公司&lt;/p&gt;&lt;p&gt;C. 华北开发股份公司和南满重工业股份公司&lt;/p&gt;&lt;p&gt;D. 华北开发股份公司和华中振兴股份公司&lt;/p&gt;', 4, 'A', '东北，“南满铁路株式会社”、“南满重工业股份公司”两大公司，独占了东北全部重工业和铁路交通，控制了东北的经济命脉，掠夺矿产资源。答案为A.', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"16\";s:5:\"knows\";s:43:\"第二节 从局部抗战到全国性抗战\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (249, 1, '中共中央曾派往东北加强中共满洲省委及各级地方党组织领导力量的人不包括', 1, 'peadmin', '', '&lt;p&gt;A. 周保中&lt;/p&gt;&lt;p&gt;B. 赵一曼&lt;/p&gt;&lt;p&gt;C. 杨靖宇&lt;/p&gt;&lt;p&gt;D. 毛泽东&lt;/p&gt;', 4, 'D', '中共中央先后选派罗登贤、杨 靖宇、赵尚志、周保中、赵一曼等 到东北，加强中共满洲省委及各级地方党组织的领导力量。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"16\";s:5:\"knows\";s:43:\"第二节 从局部抗战到全国性抗战\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (250, 1, '1936 年，东北各抗日武装统一为', 1, 'peadmin', '', '&lt;p&gt;A. 东北抗日联军&lt;/p&gt;&lt;p&gt;B. 东北义勇军&lt;/p&gt;&lt;p&gt;C. 东北人民革命军&lt;/p&gt;&lt;p&gt;D. 抗日游击队&lt;/p&gt;', 4, 'A', '中国共产党领导的抗日游击队于1933年初在东北各地崛起。1934年6月，各抗日游击队改编为东北人民革命军；1936年2月，又改建为东北抗日联军。东北抗联同日军进行了艰苦卓绝的斗争，沉重打击了日本侵略者。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"16\";s:5:\"knows\";s:43:\"第二节 从局部抗战到全国性抗战\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (251, 1, '标志着中国人民抗日救亡运动新高潮到来的是', 1, 'peadmin', '', '&lt;p&gt;A. 十九路军抗战&lt;/p&gt;&lt;p&gt;B. 卢沟桥抗战&lt;/p&gt;&lt;p&gt;C. 华北事变&lt;/p&gt;&lt;p&gt;D. 一二·九运动&lt;/p&gt;', 4, 'D', '一二·九运动打击了日本帝国主义侵略中国并吞并华北的计划，促进了中华民族的觉醒，标志着中国人民抗日救亡运动新高潮的到来。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"16\";s:5:\"knows\";s:43:\"第二节 从局部抗战到全国性抗战\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (252, 1, '1937年8月，红军主力奉命改编为国民革命军第八路军，其正、副总指挥分别是', 1, 'peadmin', '', '&lt;p&gt;A. 朱德、彭德怀&lt;/p&gt;&lt;p&gt;B. 叶挺、项英&lt;/p&gt;&lt;p&gt;C. 朱德、刘伯承&lt;/p&gt;&lt;p&gt;D. 朱德、贺龙&lt;/p&gt;', 4, 'A', '1937年8月，国共两党达成将红军主力改编为国民革命军第八路军（简称八路军，不久改称为第十八集团军）等协议。八路军由朱德担任总指挥，彭德怀任副总指挥。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"16\";s:5:\"knows\";s:43:\"第二节 从局部抗战到全国性抗战\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (253, 1, '淞沪会战中，率八百壮士坚守四行仓库的是', 1, 'peadmin', '', '&lt;p&gt;A. 李宗仁&lt;/p&gt;&lt;p&gt;B. 谢晋元&lt;/p&gt;&lt;p&gt;C. 宋哲元&lt;/p&gt;&lt;p&gt;D. 陈诚&lt;/p&gt;', 4, 'B', '正面战场的爱国官兵，不畏牺牲，英勇抗敌，用鲜血和生命维护了民族尊严，打击了日军的嚣张气焰，鼓舞了全国人民。在淞沪会战中，第八十八师五二四团团附谢晋元率孤军据守四行仓库，被上海市民誉为“八百壮士”。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"17\";s:5:\"knows\";s:67:\"第三节 国民党的正面战场与大后方的抗日民主运动\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (254, 1, '北平南苑的战斗中为国捐躯的国民党将领是', 1, 'peadmin', '', '&lt;p&gt;A. 谢晋元&lt;/p&gt;&lt;p&gt;B. 杨靖宇、左权&lt;/p&gt;&lt;p&gt;C. 佟麟阁、赵登禹  &lt;/p&gt;&lt;p&gt;D. 张自忠、戴安澜&lt;/p&gt;', 4, 'C', '正面战场的爱国官兵，不畏牺 牲，英勇抗敌，用鲜血和生命维护了民族尊严，打击了日军的嚣张气焰，鼓舞了全国人民。在北平南苑的战斗中，第二十九军副军长佟麟阁、第一三二师师长赵登禹为国捐躯。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"17\";s:5:\"knows\";s:67:\"第三节 国民党的正面战场与大后方的抗日民主运动\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (255, 1, '抗战初期国民党正面战场上组织的会战不包括', 1, 'peadmin', '', '&lt;p&gt;A. 淞沪会战&lt;/p&gt;&lt;p&gt;B. 徐州会战&lt;/p&gt;&lt;p&gt;C. 北平会战&lt;/p&gt;&lt;p&gt;D. 武汉会战&lt;/p&gt;', 4, 'C', '在正面战场，国民党 制定了持久消耗战的基本战略，组织了淞沪、忻口、徐州、武 汉会战等一系列大战役。答 案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"17\";s:5:\"knows\";s:67:\"第三节 国民党的正面战场与大后方的抗日民主运动\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (256, 1, '抗战时期中国战区成立的背景不包括', 1, 'peadmin', '', '&lt;p&gt;A. 日军偷袭珍珠港，太平洋战争爆发&lt;/p&gt;&lt;p&gt;B. 美、英等国对日宣战&lt;/p&gt;&lt;p&gt;C. 国民政府正式对日宣战&lt;/p&gt;&lt;p&gt;D. 中国远征军出国作战&lt;/p&gt;', 4, 'D', '1941年12月8日，日军偷袭珍珠港，太平洋战争爆发。美、英等国对日宣战，国民政府正式对日宣战。1942年初中国战区成立，蒋介石任最高统帅。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"17\";s:5:\"knows\";s:67:\"第三节 国民党的正面战场与大后方的抗日民主运动\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (257, 1, '国民政府正式对日宣战是在', 1, 'peadmin', '', '&lt;p&gt;A. “九一八”事变后&lt;/p&gt;&lt;p&gt;B. 卢沟桥事变后&lt;/p&gt;&lt;p&gt;C. “一·二八”事变后&lt;/p&gt;&lt;p&gt;D. 太平洋战争爆发后&lt;/p&gt;', 4, 'D', '1941年12月8日，日军偷袭珍珠港，太平洋战争爆发。美、英等国对日宣战，国民政府正式对日宣战。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"17\";s:5:\"knows\";s:67:\"第三节 国民党的正面战场与大后方的抗日民主运动\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (258, 1, '1942年初成立的中国战区的最高统帅是', 1, 'peadmin', '', '&lt;p&gt;A. 蒋介石&lt;/p&gt;&lt;p&gt;B. 毛泽东&lt;/p&gt;&lt;p&gt;C. 朱德&lt;/p&gt;&lt;p&gt;D. 史迪威&lt;/p&gt;', 4, 'A', '1941年12月8日，日军偷袭珍珠港，太平洋战争爆发。美、英等国对日宣战，国民政府正式对日宣战。中国战区于1942年初成立，蒋介石担任最高统帅.答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"17\";s:5:\"knows\";s:67:\"第三节 国民党的正面战场与大后方的抗日民主运动\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (259, 1, '1939年1月，国民党 确定“防 共、限共、溶共、反共”方针的会议是', 1, 'peadmin', '', '&lt;p&gt;A. 国民党五届三中全会&lt;/p&gt;&lt;p&gt;B. 国民党五届五中全会&lt;/p&gt;&lt;p&gt;C. 国民党五届六中全会&lt;/p&gt;&lt;p&gt;D. 国民党临时全国代表大会&lt;/p&gt;', 4, 'B', '国民党在重申坚持持久抗战的同时，其对内对外政策均发生了重大变化。1939年1月，国民党五届五中全会决定成立“防共委员会”，确定了“防共、限共、溶共、反共”的方针。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"17\";s:5:\"knows\";s:67:\"第三节 国民党的正面战场与大后方的抗日民主运动\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (260, 1, '抗战初期，造成国民政府正面战场溃败的根本原因是', 1, 'peadmin', '', '&lt;p&gt;A. 消极抗日，积极反共的政策&lt;/p&gt;&lt;p&gt;B. 敌强我弱，国力对比悬殊&lt;/p&gt;&lt;p&gt;C. 片面的抗战路线&lt;/p&gt;&lt;p&gt;D. 战略战术的失误&lt;/p&gt;', 4, 'C', '抗战初期，正面战场的溃败与国民政府战略指导方针的失误有直接关系。蒋介石集团在决心抗战的同时，又害怕群众的广泛动员可能危及自身的统治，实行 片面抗战的路线，将希望单纯地寄托在政府和正规军的抵抗上，这是其失败的根本原因。答案为C.', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"17\";s:5:\"knows\";s:67:\"第三节 国民党的正面战场与大后方的抗日民主运动\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (261, 1, '1946年1月10日，国共双方下达停战令。同日，政治协商会议开幕，其地点在', 1, 'peadmin', '', '&lt;p&gt;A. 北平&lt;/p&gt;&lt;p&gt;B. 洛阳&lt;/p&gt;&lt;p&gt;C. 重庆&lt;/p&gt;&lt;p&gt;D. 南京&lt;/p&gt;', 4, 'C', '1946年1月10日，国共双方下达了停战令。  同日，政治协商会议在重庆开幕。出席会议的有国民党、共产党、民主同盟、青年党及社会贤达代表38人。答案为C.', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"20\";s:5:\"knows\";s:52:\"第一节 从争取和平民主到进行自卫战争\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (262, 1, '中共中央在《对目前时局的宣言》中，指出的新历史时期全民族面临的重大任务不包括', 1, 'peadmin', '', '&lt;p&gt;A. 巩固国内团结，保证国内和平&lt;/p&gt;&lt;p&gt;B. 实现民主，改善民生&lt;/p&gt;&lt;p&gt;C. 在和平民主团结的基础上，实现全国的统一&lt;/p&gt;&lt;p&gt;D. “向北发展，向南防御”&lt;/p&gt;', 4, 'D', '1945 年 8月25日，中共中央在《对目前时局的宣言》中明确提出了“和平、民主、团结”的口号，指出在新的历史时期中，全民族面前的重大任务是：巩固国内。团结，保证国內和平，实现民主，改善民生，以便在和平民主团结的基础上，实现全国的统一，建立独立自由与富强的新中国。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"20\";s:5:\"knows\";s:52:\"第一节 从争取和平民主到进行自卫战争\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (263, 1, '1945年8月到重庆参加与蒋介石谈判的中共代表不包括', 1, 'peadmin', '', '&lt;p&gt;A. 刘少奇&lt;/p&gt;&lt;p&gt;B. 毛泽东&lt;/p&gt;&lt;p&gt;C. 周恩来&lt;/p&gt;&lt;p&gt;D. 王若飞&lt;/p&gt;', 4, 'A', '1945年8月14日、20日、23日，蒋介石接连发出三封电报，邀请中共中央主席毛泽东到重庆进行和平谈判。为了争取和平民主，毛泽东不顾个人安危，于1945年8月28日携周恩来、王若飞飞赴重庆与国民党当局进行谈判。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"20\";s:5:\"knows\";s:52:\"第一节 从争取和平民主到进行自卫战争\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (264, 1, '解放区军民粉碎国民党军队的重点进攻是在', 1, 'peadmin', '', '&lt;p&gt;A. 17227&lt;/p&gt;&lt;p&gt;B. 17258&lt;/p&gt;&lt;p&gt;C. 17319&lt;/p&gt;&lt;p&gt;D. 17349&lt;/p&gt;', 4, 'C', '1947年6月，中国共产党基本粉碎了国民党军队对陕甘宁边区和山东解放区的重点进攻。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"20\";s:5:\"knows\";s:52:\"第一节 从争取和平民主到进行自卫战争\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (265, 1, '提出“一切反动派都是纸老虎”著名论断的是', 1, 'peadmin', '', '&lt;p&gt;A. 毛泽东&lt;/p&gt;&lt;p&gt;B. 周恩来&lt;/p&gt;&lt;p&gt;C. 邓小平&lt;/p&gt;&lt;p&gt;D. 刘伯承&lt;/p&gt;', 4, 'A', '全面內战爆发后，中国共产党清醒地估计了国内外形势，毛泽东提出了“一切反动派都是纸老虎”的著名论断，并预言人民解放军的“小米加步枪”一定能战胜国民军队的“飞机加坦克”。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"20\";s:5:\"knows\";s:52:\"第一节 从争取和平民主到进行自卫战争\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (266, 1, '中国共产党指出，战胜蒋介石的政治基础是', 1, 'peadmin', '', '&lt;p&gt;A. 人民解放战争所具有的爱国的正义的革命的性质，必然要获得全国人民的拥护&lt;/p&gt;&lt;p&gt;B. 蒋介石多行不义必自毙&lt;/p&gt;&lt;p&gt;C. 美国看着中共壮大，不会总站在国民党这边&lt;/p&gt;&lt;p&gt;D. 中共力量不断壮大&lt;/p&gt;', 4, 'A', '全面內战爆发后，中国共产党清醒估计了国内外形势，明确而坚定地指出我们不但必须打败蒋介石，而且能够打败他，人民解放战争所具有的爱国的正义的革命的性质，必然将获得全国人民的拥护，这就是战胜蒋介石的政治基础。答 案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"20\";s:5:\"knows\";s:52:\"第一节 从争取和平民主到进行自卫战争\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (267, 1, '开创了人民军队攻占大城市的先例的是晋察冀野战军攻占', 1, 'peadmin', '', '&lt;p&gt;A. 济南&lt;/p&gt;&lt;p&gt;B. 石家庄&lt;/p&gt;&lt;p&gt;C. 南京&lt;/p&gt;&lt;p&gt;D. 北平&lt;/p&gt;', 4, 'B', '1947年11月12日，晋察冀野战军攻占石家庄，开创了人民军队攻占大城市的先例。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"21\";s:5:\"knows\";s:49:\"第二节 国民党政府处在全民的包围中\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (268, 1, '毛泽东提出新民主主义革命的三大经济纲领的著作是', 1, 'peadmin', '', '&lt;p&gt;A. 《将革命进行到底》&lt;/p&gt;&lt;p&gt;B. 《目前形势和我们的任务》&lt;/p&gt;&lt;p&gt;C. 《论人民民主专政》&lt;/p&gt;&lt;p&gt;D. 《在晋绥干部会议上的讲话》&lt;/p&gt;', 4, 'B', '毛泽东在《目前形势和我们的任务》的报告中提出了新民主主义革命的三大经济纲领，即没收封建阶级的土地 归农民所有，没收蒋介石、宋子文、孔祥熙、陈立夫为首的垄断资本归新民主主义的国家所有，保护民族工商业。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"21\";s:5:\"knows\";s:49:\"第二节 国民党政府处在全民的包围中\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (269, 1, '解放战争时期，明确规定废除封建性及半封建性剥削的土地制度的文献是', 1, 'peadmin', '', '&lt;p&gt;A. 《关于清算、减租及土地问题的指示》&lt;/p&gt;&lt;p&gt;B. 《中国土地法大纲》&lt;/p&gt;&lt;p&gt;C. 《五四指示》&lt;/p&gt;&lt;p&gt;D. 《中华人民共和国土地法大纲》&lt;/p&gt;', 4, 'B', '中国共产党于1947年7月至9月，在河北省平山县召开了全国土地会议，制定并通过了彻底实行土地 改 革的《中国土地法大纲》，明确规定废除封建性及半封建性剥削的土地制度，实现耕者有其田的土地制度。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"21\";s:5:\"knows\";s:49:\"第二节 国民党政府处在全民的包围中\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (270, 1, '1945年12月成立，成员主要是爱国的民族工商业者以及有联系的知识分子的民主党派是', 1, 'peadmin', '', '&lt;p&gt;A. 中国致公党&lt;/p&gt;&lt;p&gt;B. 中国农工民主党&lt;/p&gt;&lt;p&gt;C. 中国民主建国会&lt;/p&gt;&lt;p&gt;D. 中国民主促进会&lt;/p&gt;', 4, 'C', '1945年12月16日，由爱国的民族工商业者以及有联系的知识分子发起，在重庆成立中国民主建国会。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"21\";s:5:\"knows\";s:49:\"第二节 国民党政府处在全民的包围中\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (271, 1, '1930年8月，国民党民主人士邓演达领导成立的中间党派是', 1, 'peadmin', '', '&lt;p&gt;A. 中国青年党&lt;/p&gt;&lt;p&gt;B. 中国民主同盟&lt;/p&gt;&lt;p&gt;C. 中国国民党临时行动委员会&lt;/p&gt;&lt;p&gt;D. 中华职业教育社&lt;/p&gt;', 4, 'C', '1930年8月9日，国民党左派领导人邓演达在上海主持召开了第一次全国干部会议，成立中国国民党 临时行动委员会，邓演达当选为总干事。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"21\";s:5:\"knows\";s:49:\"第二节 国民党政府处在全民的包围中\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (272, 1, '中国国民党临时行动委员会于1947年 2月改名为', 1, 'peadmin', '', '&lt;p&gt;A. 中国国民党民主促进会&lt;/p&gt;&lt;p&gt;B. 中国农工民主党&lt;/p&gt;&lt;p&gt;C. 九三学社&lt;/p&gt;&lt;p&gt;D. 中华职业教育社&lt;/p&gt;', 4, 'B', '中国国民党 临时行动委员会成立于1930年8月9日，并于1935年11月10日改名为中华民族解放行动委员会。1947年2月3日改名为中国农工民主党。章伯钧任主席。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"21\";s:5:\"knows\";s:49:\"第二节 国民党政府处在全民的包围中\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (273, 1, '关于中国各民主党派形成时的社会基础的说法，不正确的是', 1, 'peadmin', '', '&lt;p&gt;A. 主要是民族资产阶级、城市小资产阶级以及同这些阶级相联系的知识分子和其他爱国分子&lt;/p&gt;&lt;p&gt;B. 他们所联系和代表的是相对固定的单一阶级&lt;/p&gt;&lt;p&gt;C. 是阶级联盟性质的政党&lt;/p&gt;&lt;p&gt;D. 包括一定数量的革命知识分子和少数共产党人&lt;/p&gt;', 4, 'B', '中国各民主党派形成时的社会基础，主要是民族资产阶级、城市小资产阶级以及同这些阶级相联系的知识分子和其他爱国分子。它们所联系和代表的不是单一阶级，而是这些阶级、阶层的人们在反帝爱国和争取民主的共同要求基础上的联合，是阶级联盟性质的政党。在它们的成员和领导骨干中，还有一定数量的革命知识分子和少数共产党人。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"21\";s:5:\"knows\";s:49:\"第二节 国民党政府处在全民的包围中\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (274, 1, '重庆谈判中，“第三方面”是指', 1, 'peadmin', '', '&lt;p&gt;A. 共产党&lt;/p&gt;&lt;p&gt;B. 无党派人土&lt;/p&gt;&lt;p&gt;C. 民主党派&lt;/p&gt;&lt;p&gt;D. 国民党&lt;/p&gt;', 4, 'C', '全国解放战争时期，各民主党派与中国共产党的团结合作的表现之一是：重庆国共谈判与政协会议期间，各民主党派作为“第三方面”，主要同共产党一起反对国民党反动派的内战、独裁政策，为和平民主而共同努力。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"21\";s:5:\"knows\";s:49:\"第二节 国民党政府处在全民的包围中\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (275, 1, '1948年中国共产党在“五一口号”中提出的号召是', 1, 'peadmin', '', '&lt;p&gt;A. 迅速召开政治协商会议，成立民主联合政府&lt;/p&gt;&lt;p&gt;B. 打倒蒋介石，解放全中国&lt;/p&gt;&lt;p&gt;C. 反内战、反饥饿、反迫害&lt;/p&gt;&lt;p&gt;D. 将中国由落后的农业国变为先进的工业国&lt;/p&gt;', 4, 'A', '1948年4月，中共中央在纪念五一国际劳动节的口号中提出：“各民主党派、各人民团体、各社会贤达迅速召开政治协商会议。讨论并实现召集人民代表大会，成立民主联合政府。”这个号召得到了各民主党派和社会各界的热烈响应。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"22\";s:5:\"knows\";s:58:\"第三节 人民共和国：中国人民的历史性选择\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (276, 1, '标志着民盟站到了新民主主义革命的立场上来的是', 1, 'peadmin', '', '&lt;p&gt;A. 民盟一届三中全会&lt;/p&gt;&lt;p&gt;B. 国民党当局宣布民盟“为非法团体”&lt;/p&gt;&lt;p&gt;C. 民盟总部发表公告&lt;/p&gt;&lt;p&gt;D. 中国民主同盟全国代表大会&lt;/p&gt;', 4, 'A', '1948年1月，沈钧儒等民盟领导人在香港召开了民盟一届三中全会，宣布不接受解散民盟的任何决定，并恢复民盟总部。这次会议标志着民盟站到了新民主主义革命的立场上来。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"22\";s:5:\"knows\";s:58:\"第三节 人民共和国：中国人民的历史性选择\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (277, 1, '表明中国各民主党派和无党派民主人士自愿地接受了中国共产党的领导，决心走人民革命的道路，拥护建立人民民主、的新中国的文献是', 1, 'peadmin', '', '&lt;p&gt;A. 《对时局的意见》&lt;/p&gt;&lt;p&gt;B. 《目前形势和我们的任务》&lt;/p&gt;&lt;p&gt;C. 《中国人民政治协商会议共同纲领》&lt;/p&gt;&lt;p&gt;D. 《论人民民主专政》&lt;/p&gt;', 4, 'A', '1949年1月22日，民主党派的领导人李济深、沈钧儒等和无党派民主人士55人联合发表《对时局的意见》，它表明中国各民主党派和无党派民主人士自愿地接受了中国共产党的领导，决心走人民革命的道路，拥护建立人民民主的新中国。答为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"22\";s:5:\"knows\";s:58:\"第三节 人民共和国：中国人民的历史性选择\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (278, 1, '1949年中国人民政治协商会议第一届全体会议的召开，标志着', 1, 'peadmin', '', '&lt;p&gt;A. 新民主主义革命的完成&lt;/p&gt;&lt;p&gt;B. 新民主主义革命的基本胜利&lt;/p&gt;&lt;p&gt;C. 社会主义革命的胜利&lt;/p&gt;&lt;p&gt;D. 中国半殖民地半封建社会的结束&lt;/p&gt;', 4, 'B', '解放战争后期，随着解放战争的胜利发展，建立新中国的任务被提上了历史日程。1949年9月中国人民政治协商会议第一届全体会议的召开，标志着新民主主义革命的基本胜利。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"22\";s:5:\"knows\";s:58:\"第三节 人民共和国：中国人民的历史性选择\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (279, 1, '1948年11月至1949年1月，担任淮海战役总前委书记的是', 1, 'peadmin', '', '&lt;p&gt;A. 邓小平&lt;/p&gt;&lt;p&gt;B. 刘伯承&lt;/p&gt;&lt;p&gt;C. 陈毅&lt;/p&gt;&lt;p&gt;D. 粟裕&lt;/p&gt;', 4, 'A', '淮海战役自1948年11月6日开始至1949年1月10日结束。华东野战军、中原野战军以及地方武装共60万人，在由刘伯承、陈毅、邓小平、粟裕、谭震林等组成的总前委（邓小平为书记）领导下，共歼敌55.5万人。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"22\";s:5:\"knows\";s:58:\"第三节 人民共和国：中国人民的历史性选择\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (280, 1, '标志着国民党政权在大陆统治覆灭的重大事件是', 1, 'peadmin', '', '&lt;p&gt;A. 1949年南京解放&lt;/p&gt;&lt;p&gt;B. 1949年北平解放&lt;/p&gt;&lt;p&gt;C. 1949年上海解放&lt;/p&gt;&lt;p&gt;D. 1949年中共开国大典&lt;/p&gt;', 4, 'A', '1949年4月23日，人民解放军占领南京，延续了22 年的国民党的反动统治宣告覆灭。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"22\";s:5:\"knows\";s:58:\"第三节 人民共和国：中国人民的历史性选择\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (281, 1, '1951年底1952 年春，中国共产党在党政机关中开展的“三反”运动是', 1, 'peadmin', '', '&lt;p&gt;A. 反贪污、反浪费、反官僚主义&lt;/p&gt;&lt;p&gt;B. 反主观主义、反宗派主义、反党八股&lt;/p&gt;&lt;p&gt;C. 反贪污、反受贿、反自由主义&lt;/p&gt;&lt;p&gt;D. 反浪 费、反行贿、反形式主义&lt;/p&gt;', 4, 'A', '中国共产党在国民经济全面恢复时期开展的“三反”、“五反”运动是重要的知识点。其中，针对不法资本家行贿党政干部情况的严重发展．1951 年底到 1952 年春，中国共产党在党政机构工作人员中开展了反贪污、反浪费、反官僚主义的“三反”运动。而1952 年 1月，中共中央决定开展反行贿、反偷税漏税、反盗窃国家资财、反偷工减料、反盗窃国家经济情报的“五反”运动。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (282, 1, '实现由新民主主义向社会主义过渡的政治前提是', 1, 'peadmin', '', '&lt;p&gt;A. 帝国主义侵略被打败&lt;/p&gt;&lt;p&gt;B. 封建主义统治被推翻&lt;/p&gt;&lt;p&gt;C. 官僚资本被没收&lt;/p&gt;&lt;p&gt;D. 中华人民共和国的成立&lt;/p&gt;', 4, 'D', '1949年中华人民共和国成立为新民主主义向社会主义的过渡创造了条件。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (283, 1, '中国新民主主义革命取得基本胜利的标志是', 1, 'peadmin', '', '&lt;p&gt;A. 三大战役的胜利&lt;/p&gt;&lt;p&gt;B. 《共同纲领》的颁布&lt;/p&gt;&lt;p&gt;C. 国民党逃往台湾&lt;/p&gt;&lt;p&gt;D. 中华人民共和国的成立&lt;/p&gt;', 4, 'D', '中华人民共和国的成立，标志看中国新民主主义革命取得了基本的胜利，也标志着中国半殖民地半封建社会的结束和新民主主义社会在全国范围内的建立。这是马克思主义同中国实际相结合的伟大胜利。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (284, 1, '20世纪中国人民在前进道路上经历的第二次历史性巨大变化是', 1, 'peadmin', '', '&lt;p&gt;A. 新中国成立和社会主义制度建立&lt;/p&gt;&lt;p&gt;B. 辛亥革命&lt;/p&gt;&lt;p&gt;C. 中华民国成立&lt;/p&gt;&lt;p&gt;D. 改革开放&lt;/p&gt;', 4, 'A', '新中国成立和社会主义制度建立，是20世纪中国人民在前进道路上经历的，第二次历史性巨大变化。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (285, 1, '关于中华人民共和国成立的意义，说法错误的是', 1, 'peadmin', '', '&lt;p&gt;A. 新民主主义革命取得了基本的胜利&lt;/p&gt;&lt;p&gt;B. 半殖民地半封建社会的结束&lt;/p&gt;&lt;p&gt;C. 社会主义基本制度的确立&lt;/p&gt;&lt;p&gt;D. 新民主主义社会在全国范围内的建立&lt;/p&gt;', 4, 'C', '中华人民共和国的成立，标志着中国的新民主主义革命取得了基本的胜利，标志着半殖民地半封建社会的结束和新民主主义社会在全国范围内的建立。  答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (286, 1, '近代中国面临的两大历史任务是', 1, 'peadmin', '', '&lt;p&gt;A. 争取民族独立、人民解放和实现社会主义&lt;/p&gt;&lt;p&gt;B. 推翻国民党统治，建立新民主主义共和国和实现社会主义&lt;/p&gt;&lt;p&gt;C. 争取民族独立、人民解放和建立新民主主义共和国&lt;/p&gt;&lt;p&gt;D. 争取民族独立、人民解放和实现国家繁荣富强、人民共同富裕&lt;/p&gt;', 4, 'D', '近代中国面临的两大历史任务，即求得民族独立和人民解放、实现国家的繁荣富强和人民的共同富裕。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (287, 1, '新中国成立后西方资本主义国家对华实行的政策不包括', 1, 'peadmin', '', '&lt;p&gt;A. 政治孤立&lt;/p&gt;&lt;p&gt;B. 经济封锁&lt;/p&gt;&lt;p&gt;C. 军事威胁&lt;/p&gt;&lt;p&gt;D. 文化包围&lt;/p&gt;', 4, 'D', '新中国成立后西方资本主义国家企图实行强硬的对华政策，即政治上孤立、经济上封锁、军事上威胁的政策。答 案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (288, 1, '1951年5月，中央人民政府与西藏地方政府达成', 1, 'peadmin', '', '&lt;p&gt;A. 废除农奴制协议&lt;/p&gt;&lt;p&gt;B. 和平解放协议&lt;/p&gt;&lt;p&gt;C. 进行土地改革协议&lt;/p&gt;&lt;p&gt;D. 开展社会改革协议&lt;/p&gt;', 4, 'B', '1951年5月，中央人民政府同西藏地方政府达成关于和平解放西藏办法的协议。10月，人民解放军进驻拉萨，西藏和平解放。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (289, 1, '1950年6月，中央人民政府颁布的土地法是', 1, 'peadmin', '', '&lt;p&gt;A. 《中国土地法大纲》&lt;/p&gt;&lt;p&gt;B. 《中华人民共和国土地法》&lt;/p&gt;&lt;p&gt;C. 《中国土地改革法》&lt;/p&gt;&lt;p&gt;D. 《中华人民共和国土地改革法》&lt;/p&gt;', 4, 'D', '1950年6月中央人民政府颁布《中华人民共和国土改革法》，新解放区农村掀起了轰轰烈烈的土地改革运动。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (290, 1, '中国几千年的封建土地所有制被彻底消灭的时间是', 1, 'peadmin', '', '&lt;p&gt;A. 1949年新中国成立&lt;/p&gt;&lt;p&gt;B. 1953年土地改革的基本完成&lt;/p&gt;&lt;p&gt;C. 1956年三大改造的完成&lt;/p&gt;&lt;p&gt;D. 1950年土地法的颁布&lt;/p&gt;', 4, 'B', '1953年土地改革在全国范围的基本完成，彻底摧毁了封建制度的经济基础，消灭了中国几千年的封建土地所有制，使深受剥削压迫的中国农民得到了解放，摆脫了宗法的人身束缚，极大地解放了农业生产力。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (291, 1, '建国初期，中国共产党对私营工商业的生产关系、劳资关系和产销关系进行全面调整的原则是', 1, 'peadmin', '', '&lt;p&gt;A. “消灭资本主义”&lt;/p&gt;&lt;p&gt;B. “经销代销”&lt;/p&gt;&lt;p&gt;C. “统购统销”&lt;/p&gt;&lt;p&gt;D. “公私兼顾、劳资两利”&lt;/p&gt;', 4, 'D', '新中国建立初期，中国共产党按照《中国人民政治协商会议共同纲领》规定的“公私兼顾、劳资两利”原则，对私营工商业的生产关系、劳资关系和产销关系，进行了全面调整。答案为D.', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (292, 1, '下列选项中不属于新中国成立后颁布的法律、法规、政策的是', 1, 'peadmin', '', '&lt;p&gt;A. 《中华人民共和国婚姻法》&lt;/p&gt;&lt;p&gt;B. 《关于镇压反革命活动的指示》&lt;/p&gt;&lt;p&gt;C. 《中国人民政治协商会议共同纲领》&lt;/p&gt;&lt;p&gt;D. 《中华人民共和国民族区域自治实施纲要》&lt;/p&gt;', 4, 'C', '《中国人民政治协商会议共同纲领》是194年9月通过的；1950年7月通过《关于镇压反革命活动的指示》;1950年5月颁布《中华人民共和国婚姻法》；1951年8月公布实施《中华人民共和国民族区或自治实施纲要》。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (293, 1, '第一部《中华人民共和国婚姻法》颁布于', 1, 'peadmin', '', '&lt;p&gt;A. 18384&lt;/p&gt;&lt;p&gt;B. 18749&lt;/p&gt;&lt;p&gt;C. 19115&lt;/p&gt;&lt;p&gt;D. 19480&lt;/p&gt;', 4, 'A', '人民政府于1950年5月颁布《中华人民共和国婚姻法》，废除了包办婚姻、男尊女卑的封建婚姻制度。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (294, 1, '1951年9月，在全国知识分子中开展了', 1, 'peadmin', '', '&lt;p&gt;A. 教育者先受教育运动&lt;/p&gt;&lt;p&gt;B. 整风运动&lt;/p&gt;&lt;p&gt;C. 思想改造运动&lt;/p&gt;&lt;p&gt;D. 批判旧思想运动&lt;/p&gt;', 4, 'C', '1951年9月，在全国知识分子中开展了思想改造运动，使知识分子在很大程度上摆脱了帝国主义和封建主义思想的影响，他们的立场、世界观有了很大的转变，开始树立了为人民服务的观念，为新中国的建设事业作出了积极贡献。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (295, 1, '1949年7月成立的中央财经委员会，主任是', 1, 'peadmin', '', '&lt;p&gt;A. 刘少奇&lt;/p&gt;&lt;p&gt;B. 邓小平&lt;/p&gt;&lt;p&gt;C. 陈云&lt;/p&gt;&lt;p&gt;D. 李富春&lt;/p&gt;', 4, 'C', '1949年7月成立了以陈云为主任的中央财经委员会，人民政权的金融工作从过去的分散状态逐步 走向集中统一。1950年3月，政务院颁布了《关于统一全国财政经济工作的决定》，对全国财政收支、贸易和物资调度及现金实行集中和统一管理。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (296, 1, '新中国统一货币的形成是在', 1, 'peadmin', '', '&lt;p&gt;A. 1949年&lt;/p&gt;&lt;p&gt;B. 1950年&lt;/p&gt;&lt;p&gt;C. 1951年&lt;/p&gt;&lt;p&gt;D. 1952年&lt;/p&gt;', 4, 'C', '新中国成立初期，为建立稳定的经济秩序与社会秩序，1951年11月，印有少数民族文字的人民币的发行范围扩大到所有解放区，这标志着新中国统一货币的形成。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (297, 1, '建国初期从根本上稳定物价、争取国家财政经济状况基本好转的重大措施是', 1, 'peadmin', '', '&lt;p&gt;A. 打击投机倒把&lt;/p&gt;&lt;p&gt;B. 统一全国财经工作&lt;/p&gt;&lt;p&gt;C. 调整城市工商业&lt;/p&gt;&lt;p&gt;D. 节减国家机构经费&lt;/p&gt;', 4, 'B', '稳定物价和统一财政工作，是人民解放军在前线的胜利之外，中央人民政府为人民所做的最大的一件工作。尤其是统一全国财经工作，是从根本上稳定物价、争取国家财政经济状况基本好转的重要措施。  答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (298, 1, '新中国成立初期，除了人民解放军在前线的胜利之外，中央人民政府为人民所作的最大一件工作是', 1, 'peadmin', '', '&lt;p&gt;A. 镇压反革命&lt;/p&gt;&lt;p&gt;B. 稳定物价和统一财政工作&lt;/p&gt;&lt;p&gt;C. “三反”运动&lt;/p&gt;&lt;p&gt;D. “五反”运动&lt;/p&gt;', 4, 'B', '稳定物价和统一财政工作，是人民解放军在前线的胜利之外，中央人民政府为人民所做的最大的一件工作。这证明申国共产党不仅可以取得政治上、军事上的胜利，管理经济也是难不倒共产党人的。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (299, 1, '在中共七届三中全会上，毛泽东指出争取国家财政经济状况的基本好转必须具备的条件不包括', 1, 'peadmin', '', '&lt;p&gt;A. 土地改革的完成&lt;/p&gt;&lt;p&gt;B. 国民党残余势力的消灭&lt;/p&gt;&lt;p&gt;C. 现有工商业的调整 &lt;/p&gt;&lt;p&gt;D. 国家机构所需经费的大量节减&lt;/p&gt;', 4, 'B', '1950年6月，在七届三中全会上，毛泽东作了《为争取国家财政经济状况的基本好转而斗争》的报告，指出争取国家财政经济状况的基本好转必须具备三个条件：土地改革的完成，现有工商业的调整，国家机构所需经费的大量节减。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (300, 1, '1949年10月2日，第一个同中国建交的国家是', 1, 'peadmin', '', '&lt;p&gt;A. 朝鲜&lt;/p&gt;&lt;p&gt;B. 越南&lt;/p&gt;&lt;p&gt;C. 苏联&lt;/p&gt;&lt;p&gt;D. 南斯拉夫&lt;/p&gt;', 4, 'C', '新中国成立后，中央人民政府按照《共同纲领》确定的外交原则与政策，积极开展外交工作，打开对外关系。1949 年 10月2日，苏联第一个照会中国政府，决定同中华人民共和国建立外交关系。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (301, 1, '我国社会主义改造基本完成后，党和国家的根本任务是', 1, 'peadmin', '', '&lt;p&gt;A. 进行政治建设&lt;/p&gt;&lt;p&gt;B. 进行文化建设&lt;/p&gt;&lt;p&gt;C. 保护和发展生产力&lt;/p&gt;&lt;p&gt;D. 进行社会建设&lt;/p&gt;', 4, 'C', '1956年中共八大召开，大会正确分析了国内的主要矛盾和主要任务。 国内主要矛盾是人民对于建立先进工业国的要求同落后农业国的现实之间的矛盾，是人民对经济文化迅速发展的需要同当前经济文化不能满足人民需要的状况之间的矛盾。党和全国人民的主要任务是集中力量来解决这个矛盾，把我国尽快从落后的农业国变为先进的工业国。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"26\";s:5:\"knows\";s:25:\"第一节 良好的开局\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (302, 1, '社会主义改造完成后，我国社会的主要矛盾是', 1, 'peadmin', '', '&lt;p&gt;A. 人民对于经济文化迅速发展的需要同当前经济文化不能满足人民需要的状况之间的矛盾&lt;/p&gt;&lt;p&gt;B. 无产阶级同资产阶级之间的矛盾&lt;/p&gt;&lt;p&gt;C. 人民大众与少数敌对势力的矛盾&lt;/p&gt;&lt;p&gt;D. 上层建筑和经济基础之间的矛盾&lt;/p&gt;', 4, 'A', '中共八大正确地分析了国内的主要矛盾和主要任务，指出：我们国內的主要矛盾，已经是人民对于建立先进的工业国的要求同落后的农业国的现实之间的矛盾，已经是人民对于经济文化迅速发展的需要同当前经济文化不能满足人民需要的状况之间的矛盾。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"26\";s:5:\"knows\";s:25:\"第一节 良好的开局\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (303, 1, '1956年中共八大上，代表中央委员会作政治报告的是', 1, 'peadmin', '', '&lt;p&gt;A. 毛泽东&lt;/p&gt;&lt;p&gt;B. 周 恩来&lt;/p&gt;&lt;p&gt;C. 刘少奇&lt;/p&gt;&lt;p&gt;D. 邓小平&lt;/p&gt;', 4, 'C', '中国共产党第八次全国代表大会于1956年9月15日至27日在北京举行。毛泽东致开幕词，刘少奇代表中央委员会作政治报告，周恩来作关于发展国民经济的第二个五年计划的建议的报告，邓小平作关于修改党章的报告。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"26\";s:5:\"knows\";s:25:\"第一节 良好的开局\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (304, 1, '1956年被毛泽东称作“新经济政策”的是', 1, 'peadmin', '', '&lt;p&gt;A. 社会主义条件下的商品生产&lt;/p&gt;&lt;p&gt;B. 可以消灭了资本主义，又搞资本主义&lt;/p&gt;&lt;p&gt;C. 社会主义条件下的价值规律&lt;/p&gt;&lt;p&gt;D. “三个主体、三个补充”的思想&lt;/p&gt;', 4, 'B', '中共八大后，中国共产党在探索中又提出了一些重要的新思想。1956年12月，毛泽东提出，可以消灭了资本主义，又搞资本主义，并把这称作“新经济政策”。这个意见得到了刘少奇、周恩来等领导人的赞同。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"26\";s:5:\"knows\";s:25:\"第一节 良好的开局\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (305, 1, '中共八大确定经济建设的指导方针是', 1, 'peadmin', '', '&lt;p&gt;A. 既反保守，又反冒进，坚持在综合平衡中稳步前进&lt;/p&gt;&lt;p&gt;B. 调整、巩固、充实、提高&lt;/p&gt;&lt;p&gt;C. 建设规模必须同国力相适应&lt;/p&gt;&lt;p&gt;D. 以农业为基础，以工业为主导&lt;/p&gt;', 4, 'A', '中共八大确定的经济指导方针是：既反保守，又反冒进，坚持在综合平衡中稳步前进。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"26\";s:5:\"knows\";s:25:\"第一节 良好的开局\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (306, 1, '《关于正确处理人民内部矛盾的问题》发表于', 1, 'peadmin', '', '&lt;p&gt;A. 1956年&lt;/p&gt;&lt;p&gt;B. 1957年&lt;/p&gt;&lt;p&gt;C. 1958年&lt;/p&gt;&lt;p&gt;D. 1959 年&lt;/p&gt;', 4, 'B', '1957年2月，毛泽东在扩大的最高国务会议上发表了《关于正确处理人民内部矛盾的问题》的讲话，提出要把正确处理人民内部矛盾作为国家政治生活的主题。这篇讲话经过整理和反复修改，正式发表于同年6月19日。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"26\";s:5:\"knows\";s:25:\"第一节 良好的开局\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (307, 1, '毛泽东提出要正确处理人民内部矛盾，主要是为了', 1, 'peadmin', '', '&lt;p&gt;A. 开展整风运动克服官僚主义&lt;/p&gt;&lt;p&gt;B. 维护社会的团结稳定&lt;/p&gt;&lt;p&gt;C. 团结一切力量建设社会主义新国家&lt;/p&gt;&lt;p&gt;D. 巩固发展三大改造的成果&lt;/p&gt;', 4, 'C', '关于如何正确处理人民内部矛盾，毛泽东有一个重要指导思想：“团结全国各族人民进行一场新的战争——向自然界开战，发展我们的经济，发展我们的文化，使全体人民比较顺利地走过目前的过渡时期，巩固我们的新制度，建设我们的新国家”。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"26\";s:5:\"knows\";s:25:\"第一节 良好的开局\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (308, 1, '1957年，整风运动全 面展开的标志是', 1, 'peadmin', '', '&lt;p&gt;A. 中共中央正式发出《关于整风运动的指示》&lt;/p&gt;&lt;p&gt;B. 《关于正 确处理人民内部矛盾问题》的讲话&lt;/p&gt;&lt;p&gt;C. 《论十大关系》的发表&lt;/p&gt;&lt;p&gt;D. 《这是为什么》的发表&lt;/p&gt;', 4, 'A', '1957年4月27日，中共中央正式发出《关于整风运动的指示》，这标志着整风运动全面展开。这次整风运动，主题是正确处理人民內部矛盾。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"26\";s:5:\"knows\";s:25:\"第一节 良好的开局\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (309, 1, '1957年整风运动的形式是', 1, 'peadmin', '', '&lt;p&gt;A. 闭门整风&lt;/p&gt;&lt;p&gt;B. 开门整风&lt;/p&gt;&lt;p&gt;C. 大鸣、大放、大辩论、大字报&lt;/p&gt;&lt;p&gt;D. 批评和自我批评&lt;/p&gt;', 4, 'B', '1957年整风运动采取开门整风的形式。各级党组织纷纷召开座谈会和小组会，听取党内外群众的意见，迅速在全社会形成“鸣放”的高潮。毛泽东和中共中央真诚地希望通过这种方式，听取各方面 批评意见，改进党的作风，密切党同群众的联系。  答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"26\";s:5:\"knows\";s:25:\"第一节 良好的开局\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (310, 1, '1957年2月，毛泽东在最高国务会议上提出的社会主义两类不同性质的矛盾是敌我矛盾和', 1, 'peadmin', '', '&lt;p&gt;A. 生产力与生产关系的矛盾&lt;/p&gt;&lt;p&gt;B. 经济基础和上层建筑的矛盾&lt;/p&gt;&lt;p&gt;C. 人民内部矛盾&lt;/p&gt;&lt;p&gt;D. 经济发展速度和持续发展的矛盾&lt;/p&gt;', 4, 'C', '1957年2月，毛泽东在最高国务会议上发表《关于解决人民内部矛盾的问题》的讲话，指出社会主义社会存在着敌我之间和人民内部两类性质根本不同的矛盾。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"26\";s:5:\"knows\";s:25:\"第一节 良好的开局\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (311, 1, '1957年整风运动反对的是', 1, 'peadmin', '', '&lt;p&gt;A. 教条主义  主观主义  宗派主义&lt;/p&gt;&lt;p&gt;B. 主观主义  宗派主义  官僚主义&lt;/p&gt;&lt;p&gt;C. 教条主义  宗派主义  官僚主义&lt;/p&gt;&lt;p&gt;D. 主观主义  官僚主义  教条主义&lt;/p&gt;', 4, 'B', '中国共产党在1956年11月召开的中共八届二中全会上正式提出进行整风，同主观主义、宗派主义、官僚主义倾向作斗争。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"26\";s:5:\"knows\";s:25:\"第一节 良好的开局\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (312, 1, '1958年提出的社会主义建设总路线的缺点是', 1, 'peadmin', '', '&lt;p&gt;A. 高指标&lt;/p&gt;&lt;p&gt;B. 多、快、好、省&lt;/p&gt;&lt;p&gt;C. 浮夸风&lt;/p&gt;&lt;p&gt;D. 忽视客观规律&lt;/p&gt;', 4, 'D', '中共八大二次会议通过的“鼓足干劲、力争上游、多快好省地建设社会主义”的总路线及其基本点，反映了广大人民群众迫切要求改变国家经济文化落后状况的普遍愿望，但它忽视了客观经济规律。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"27\";s:5:\"knows\";s:34:\"第二节 探索中的严重曲折\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (313, 1, '1958年兴起的人民公社的基本特点是', 1, 'peadmin', '', '&lt;p&gt;A. 政社合一&lt;/p&gt;&lt;p&gt;B. 力争上游&lt;/p&gt;&lt;p&gt;C. 一大二公&lt;/p&gt;&lt;p&gt;D. 一体两翼&lt;/p&gt;', 4, 'C', '人民公社实行“政社合一”的体制，其基本特点被概括为“一大二公”，实际上就是搞“一平二调”。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"27\";s:5:\"knows\";s:34:\"第二节 探索中的严重曲折\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (314, 1, '人民公社实行的体制是', 1, 'peadmin', '', '&lt;p&gt;A. 私有制&lt;/p&gt;&lt;p&gt;B. 集体所有制&lt;/p&gt;&lt;p&gt;C. 一大二公&lt;/p&gt;&lt;p&gt;D. 政社合一&lt;/p&gt;', 4, 'D', '人民公社实行“政社合一”的体制，其基本特点被概括为“一大二公”，实际上是搞“一平二调”。它严重地脱离了农村的生产力水平，致使“一平二调”之风泛滥，即造成各个合作社之间、社员之间严重的平均主义。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"27\";s:5:\"knows\";s:34:\"第二节 探索中的严重曲折\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (315, 1, '标志着开始初步纠正“左”的错误的会议是', 1, 'peadmin', '', '&lt;p&gt;A. 中共八届六中全会&lt;/p&gt;&lt;p&gt;B. 第一次郑州会议&lt;/p&gt;&lt;p&gt;C. 第二次郑州会议&lt;/p&gt;&lt;p&gt;D. 武昌中共中央政治局扩大会议&lt;/p&gt;', 4, 'B', '为了纠正“左”倾错误，1958年11月，毛泽东主持召开了第一次郑州会议。他指出：“现在有一种偏向，好像共产主义越快越好。”他强调：搞社会主义没有耐心是不行的。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"27\";s:5:\"knows\";s:34:\"第二节 探索中的严重曲折\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (316, 1, '以下选项不属于八届 六中全会《决议》中批评的是', 1, 'peadmin', '', '&lt;p&gt;A. 混淆集体所有制同全民所有制 界 限的思想&lt;/p&gt;&lt;p&gt;B. 否定商品生产的思想&lt;/p&gt;&lt;p&gt;C. 反“右”思想&lt;/p&gt;&lt;p&gt;D. 取消按劳分配&lt;/p&gt;', 4, 'C', '1958年11月至12月举行了八届六中全会，全会通过了《关于人民公社若干问题的决议》，《决议》批评了混淆集体所有制同全民所有制界限的思想、否定商品生产、取消按劳分配的错误思想。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"27\";s:5:\"knows\";s:34:\"第二节 探索中的严重曲折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (317, 1, '在“七千人大会”上系统阐述民主集中制原则的是', 1, 'peadmin', '', '&lt;p&gt;A. 毛泽东&lt;/p&gt;&lt;p&gt;B. 周恩来&lt;/p&gt;&lt;p&gt;C. 邓小平&lt;/p&gt;&lt;p&gt;D. 刘少奇&lt;/p&gt;', 4, 'A', '1962年1月30日，在“七千人大会”上，毛泽东发表长篇讲话，系统阐述了民主集中制原则，并对前几年的错误表示要负第一位责任。他承认在社会主义建设上，我们还有很大的盲目性，今后要下苦工夫弄清楚它的规律。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"27\";s:5:\"knows\";s:34:\"第二节 探索中的严重曲折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (318, 1, '“文化大革命”期间，中国共产党粉碎林彪反革命集团是在', 1, 'peadmin', '', '&lt;p&gt;A. 1967年&lt;/p&gt;&lt;p&gt;B. 1971年&lt;/p&gt;&lt;p&gt;C. 1972年&lt;/p&gt;&lt;p&gt;D. 1976年&lt;/p&gt;', 4, 'B', '1971年9月林彪等人在密谋杀害毛泽东未遂仓皇出逃后，在蒙古境内坠机身亡。意味着林彪反革命集团被粉碎。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"27\";s:5:\"knows\";s:34:\"第二节 探索中的严重曲折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (319, 1, '“文化大革命”的性质是', 1, 'peadmin', '', '&lt;p&gt;A. 反革命动乱&lt;/p&gt;&lt;p&gt;B. 由领导者错误发动、被反革命集团利用的内乱&lt;/p&gt;&lt;p&gt;C. 社会主义革命的继续&lt;/p&gt;&lt;p&gt;D. 封建主义的复辟动乱&lt;/p&gt;', 4, 'B', '“文化大革命”的发生，对于中国共产党、新中国和中国人民来说，都是一场灾难。历史已经判明，“文化大革命”是一场由领导者错误发动，被反革命集团利用，给党、国家和各族人民带来严重灾难的内乱。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"27\";s:5:\"knows\";s:34:\"第二节 探索中的严重曲折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (320, 1, '“文化大革命”期间，中国共产党粉碎“四人帮”反革命集团是在', 1, 'peadmin', '', '&lt;p&gt;A. 1967年&lt;/p&gt;&lt;p&gt;B. 1971年&lt;/p&gt;&lt;p&gt;C. 1972年&lt;/p&gt;&lt;p&gt;D. 1976年&lt;/p&gt;', 4, 'D', '1976年10月，中共中央政治局执行党和人民的意志，毅然粉碎了江青反革命集团。10月14日，中共中央公布粉碎“四人帮”。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"27\";s:5:\"knows\";s:34:\"第二节 探索中的严重曲折\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (321, 1, '20世纪六、七十年代，新中国在科技领域取得的重大成就不包括', 1, 'peadmin', '', '&lt;p&gt;A. 第一颗月球探测卫星发射成功&lt;/p&gt;&lt;p&gt;B. 第一颗原子 弹试验成功&lt;/p&gt;&lt;p&gt;C. 第一颗人造卫星发射成功&lt;/p&gt;&lt;p&gt;D. 第一颗氢弹实验成功&lt;/p&gt;', 4, 'A', '新中国在核技术、人造卫星和运载火箭等尖端科学领域，取得了一系列重要成就。1964年10月，爆炸第一颗原子弹。1966年10月，中近程地导弹发射成功。1967年6月，爆炸第一颗氢弹。1970年4月，第一颗人造地球卫星发射成功。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"28\";s:5:\"knows\";s:41:\"第三节 建设的成就 探索的成果\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (322, 1, '在探索中国社会主义建设道路过程中，毛泽东指出社会主义社会可能分为', 1, 'peadmin', '', '&lt;p&gt;A. 初级阶段和高级阶段社会主义&lt;/p&gt;&lt;p&gt;B. 萌芽阶段和发展阶段社会主义&lt;/p&gt;&lt;p&gt;C. 不发达和比较发达的社会主义&lt;/p&gt;&lt;p&gt;D. 发展阶段和成熟阶段社会主义&lt;/p&gt;', 4, 'C', '毛泽东指出：社会主义这个阶段可能为两个阶段，第一个阶段是不发达的社会主义，第二个阶段是比较发达的社会主义。后一阶段比前一阶段需要时间更长。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"28\";s:5:\"knows\";s:41:\"第三节 建设的成就 探索的成果\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (323, 1, '把我国建设成为“四个现代化”社会主义强国的发展战略是', 1, 'peadmin', '', '&lt;p&gt;A. “三步走”&lt;/p&gt;&lt;p&gt;B. “两步走”&lt;/p&gt;&lt;p&gt;C. 先富带后富&lt;/p&gt;&lt;p&gt;D. 多快好省&lt;/p&gt;', 4, 'B', '社会主义现代化建设的战略目标，是要把中国建设成为一个具有现代农业、现代工业、现代国防和现代科学技术的“四个现代化”强国。为此，应当采取“两步 走”的发展战略。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"28\";s:5:\"knows\";s:41:\"第三节 建设的成就 探索的成果\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (324, 1, '到1976年，与中国建交的国家有', 1, 'peadmin', '', '&lt;p&gt;A. 111个&lt;/p&gt;&lt;p&gt;B. 120个&lt;/p&gt;&lt;p&gt;C. 49个&lt;/p&gt;&lt;p&gt;D. 72个&lt;/p&gt;', 4, 'A', '随着中美关系正常化，1972 年出现了西方国家对华建交热潮，中国同英国、荷兰、希腊、联邦德国等国先后建立大使级外交关系，同中国建交的国家，从1965年的49个增加到1976年的111个。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"28\";s:5:\"knows\";s:41:\"第三节 建设的成就 探索的成果\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (325, 1, '作出《关于恢复邓小平同志职务的决议》的会议是中共十届', 1, 'peadmin', '', '&lt;p&gt;A. 三中全会&lt;/p&gt;&lt;p&gt;B. 四中全会&lt;/p&gt;&lt;p&gt;C. 五中全会&lt;/p&gt;&lt;p&gt;D. 六中全会&lt;/p&gt;', 4, 'A', '1977年7月召开的中共十届三中全会作出《关于恢复邓小平同志职务的决议》，恢复邓小平中共中央委员、中央政治局委员、常委、中共中央副主席，中共中央军委副主席，国务院 副总理，中国人民解放军总参谋长的职务。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"29\";s:5:\"knows\";s:58:\"第一节 历史性的伟大转折和改革开放的起步\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (326, 1, '1978年12月13日，邓小平在中央工作会议闭幕会上所作的讲话是', 1, 'peadmin', '', '&lt;p&gt;A. 《解放思想，实事求是，团结一致向前看》&lt;/p&gt;&lt;p&gt;B. 《坚持四项基本原则》&lt;/p&gt;&lt;p&gt;C. 《目前的形势和任务》&lt;/p&gt;&lt;p&gt;D. 《对起草&lt;关于若干历史问题的决议&gt;的意见》&lt;/p&gt;', 4, 'A', '1978年12月13日，邓小平在中央工作会议闭幕会上作了题为《解放思想，实事求是，团结一致向前看》的讲话。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"29\";s:5:\"knows\";s:58:\"第一节 历史性的伟大转折和改革开放的起步\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (327, 1, '1980年2月，中共十一届五中全会决定', 1, 'peadmin', '', '&lt;p&gt;A. 为刘少奇彻底平反&lt;/p&gt;&lt;p&gt;B. 为彭德怀彻底平反&lt;/p&gt;&lt;p&gt;C. 为贺龙彻底平反&lt;/p&gt;&lt;p&gt;D. 为“天安门事件”彻底平反&lt;/p&gt;', 4, 'A', '中共十一届三中全会以后，党和国家按照实事求是、有错必纠的原则，加快了平反冤、假、错案的步伐。1980年2月，中共十一届五中全会决定为刘少奇彻底平反并恢复名誉。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"29\";s:5:\"knows\";s:58:\"第一节 历史性的伟大转折和改革开放的起步\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (328, 1, '邓小平指出实现四个现代化的根本前提是', 1, 'peadmin', '', '&lt;p&gt;A. 坚持共产党领导&lt;/p&gt;&lt;p&gt;B. 坚持社会主义制度&lt;/p&gt;&lt;p&gt;C. 坚持改革开放&lt;/p&gt;&lt;p&gt;D. 坚持四项基本原则&lt;/p&gt;', 4, 'D', '1979年3月30日，邓小平在理论工作务虚会上发表的讲话中指出：坚持社会主义道路，坚持人民民主专政，坚持共产党的领导，坚持马克思列宁主义、毛泽东思想这四项基本原则“是实现四个现代化的根本前提”。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"29\";s:5:\"knows\";s:58:\"第一节 历史性的伟大转折和改革开放的起步\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (329, 1, '标志着中国共产党指导思想上拨乱反正的胜利完成是', 1, 'peadmin', '', '&lt;p&gt;A. 《关于党的若干历史问题的决议》的通过&lt;/p&gt;&lt;p&gt;B. 《关于建国以来党的若干历史问题的决议》的通过&lt;/p&gt;&lt;p&gt;C. 《关于加快农业发展若干问题的决定》的通过&lt;/p&gt;&lt;p&gt;D. 《关于经济体制改革的决定》的通过&lt;/p&gt;', 4, 'B', '1979年起草的《关于建国以来党的若干历史问题的决议》的通过，标志着指导思想上拔乱反正的胜利完成。它表明中国共产党是在政治上、理论上成熟的坚强的马克思主义政党。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"29\";s:5:\"knows\";s:58:\"第一节 历史性的伟大转折和改革开放的起步\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (330, 1, '从根本上否定了“文化大革命”的理论和实践的文件是', 1, 'peadmin', '', '&lt;p&gt;A. 《关于恢复邓小平同志职务的决议》&lt;/p&gt;&lt;p&gt;B. 《关于若干历史问题的决议》&lt;/p&gt;&lt;p&gt;C. 《关于进一步治理整顿和深化改革的决定》&lt;/p&gt;&lt;p&gt;D. 《关于建国以来党的若干历史问题的决议》&lt;/p&gt;', 4, 'D', '1979年起草的《关于建国以来党的若干历史问题的决议》，从根本否定了“文化大革命”的理论和实践，对新中国成立以来的重大历史事件作出了基本结论。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"29\";s:5:\"knows\";s:58:\"第一节 历史性的伟大转折和改革开放的起步\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (331, 1, '我国农村的改革首先取得突破的省份是安徽和', 1, 'peadmin', '', '&lt;p&gt;A. 江西&lt;/p&gt;&lt;p&gt;B. 四川&lt;/p&gt;&lt;p&gt;C. 湖北&lt;/p&gt;&lt;p&gt;D. 山东&lt;/p&gt;', 4, 'B', '从1978年开始，安徽、四川的基层干部和农民群众，在省委支持下，开始探索试行包产到组、包产到户、包干到户等多种形式的农业生产责任制，取得了很好的效果。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"29\";s:5:\"knows\";s:58:\"第一节 历史性的伟大转折和改革开放的起步\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (332, 1, '1980年5月，邓小平发表《关于农村政策的谈话》，肯定了', 1, 'peadmin', '', '&lt;p&gt;A. 包干到户形式&lt;/p&gt;&lt;p&gt;B. 包产到户形式&lt;/p&gt;&lt;p&gt;C. 包干到组形式&lt;/p&gt;&lt;p&gt;D. 包产到组形式&lt;/p&gt;', 4, 'B', '1980年5月，邓小平发表《关于农村政策的谈话》，肯定了包产到户这种形式，指出它不会影响我们制度的社会主义性质。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"29\";s:5:\"knows\";s:58:\"第一节 历史性的伟大转折和改革开放的起步\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (333, 1, '促进人民公社体制解体的是', 1, 'peadmin', '', '&lt;p&gt;A. 村民自治组织的普遍建立&lt;/p&gt;&lt;p&gt;B. 乡（镇）基层政权的普遍建立&lt;/p&gt;&lt;p&gt;C. “统分结合”的农村家庭联产承包责任制的普遍实行&lt;/p&gt;&lt;p&gt;D. 乡镇企业的异军突起&lt;/p&gt;', 4, 'C', '在中共中央的支持和推动下，以包产到户、包干到户为主要形式的家庭联产承包责任制，在全国各地逐渐推广开来。“统分结合”的农村家庭联产承包责任制的普遍实行，促进了“政社合一”的人民公社体制的解体。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"29\";s:5:\"knows\";s:58:\"第一节 历史性的伟大转折和改革开放的起步\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (334, 1, '中美两国正式建立外交关系是在', 1, 'peadmin', '', '&lt;p&gt;A. 1971年&lt;/p&gt;&lt;p&gt;B. 1972年&lt;/p&gt;&lt;p&gt;C. 1978年&lt;/p&gt;&lt;p&gt;D. 1979年&lt;/p&gt;', 4, 'D', '中日建交后，1979年1月1日，中美正式建立外交关系。同年1月，邓小平访问美国，实现了中国领导人对美国的首次国事访问。这些外交成就，为中国进行改革开放和现代化建设提供了有利的外部条件。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"29\";s:5:\"knows\";s:58:\"第一节 历史性的伟大转折和改革开放的起步\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (335, 1, '下列不属于1980 年邓小平在《目前的形势和任务》的讲话中指出中国人民长期奋斗的大事的是', 1, 'peadmin', '', '&lt;p&gt;A. 维护世界和平&lt;/p&gt;&lt;p&gt;B. 实现祖国统一&lt;/p&gt;&lt;p&gt;C. 加紧现代化建设  &lt;/p&gt;&lt;p&gt;D. 建设和谐社会&lt;/p&gt;', 4, 'D', '1980年1月，邓小平在《目前的形势和任务》的讲话中，明确提出维护世界和平、实现祖国统一、加紧现代化建设是中国人民长期奋斗的三件大事。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"29\";s:5:\"knows\";s:58:\"第一节 历史性的伟大转折和改革开放的起步\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (336, 1, '提出把我国建设成为高度文明、高度民主的社会主义国家的会议是中共', 1, 'peadmin', '', '&lt;p&gt;A. 十二大&lt;/p&gt;&lt;p&gt;B. 十三大&lt;/p&gt;&lt;p&gt;C. 十六大&lt;/p&gt;&lt;p&gt;D. 十七大&lt;/p&gt;', 4, 'A', '中共十二大明确了中国共产党在新的历史时期的总任务是：“团结全国各族人民，自力更生，艰苦奋斗，逐步实现工业、农业、国防和科学技术现代化，把我国建设成为高度文明、高度民主的社会主义国家。”答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"30\";s:5:\"knows\";s:58:\"第二节 改革开放和现代化建设新局面的展开\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (337, 1, '中国共产党第十二届一中全会上当选为中共中央总书记的是', 1, 'peadmin', '', '&lt;p&gt;A. 邓小平&lt;/p&gt;&lt;p&gt;B. 李先念&lt;/p&gt;&lt;p&gt;C. 胡耀邦&lt;/p&gt;&lt;p&gt;D. 赵紫阳&lt;/p&gt;', 4, 'C', '中共十二大选举产生了新的中央委员会、中央顾问委员会和中央纪律检查委员会。中共十二届一中全会选举胡耀邦为中共中央总书记；决定邓小平为中央军委主席；批准邓小平为中央顾问委员会主任，陈云为中央纪律检查委员会第一书记。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"30\";s:5:\"knows\";s:58:\"第二节 改革开放和现代化建设新局面的展开\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (338, 1, '进一步阐明关于台湾回归祖国，实现和平统一的九项方针政策的中国领导人是', 1, 'peadmin', '', '&lt;p&gt;A. 毛泽东&lt;/p&gt;&lt;p&gt;B. 邓小平&lt;/p&gt;&lt;p&gt;C. 叶剑英&lt;/p&gt;&lt;p&gt;D. 江泽民&lt;/p&gt;', 4, 'C', '为实现祖国统一大业，1979年1月1日，全国人大常委会发表《告台湾同胞书》。1981年9月30日，全国人大常委会委员长叶剑英进一步阐明了关于台湾回归祖国，实现和平统一的九项方针政策。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"30\";s:5:\"knows\";s:58:\"第二节 改革开放和现代化建设新局面的展开\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (339, 1, '1985年2月中共中央决定开辟的沿海经济开发区不包括', 1, 'peadmin', '', '&lt;p&gt;A. 长江三角洲&lt;/p&gt;&lt;p&gt;B. 珠江三角洲&lt;/p&gt;&lt;p&gt;C. 环渤海开发区&lt;/p&gt;&lt;p&gt;D. 闽南厦门泉州漳州三角地区&lt;/p&gt;', 4, 'C', '1984年初，邓小平视察深圳、珠海、厦门等地，对经济特区的发展给予充分肯定。根据他的建议，同年5月，中共中央决定进一步开放天津、上海、大连、秦皇岛、烟台、青岛、连云港、南通、宁波、温州、福州、广州、湛江、北海 14个沿海港口城市。1985年2月，决定把长江三角洲、珠江三角洲、闽南厦门泉州漳州三角地区开辟为沿海经济开放区。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"30\";s:5:\"knows\";s:58:\"第二节 改革开放和现代化建设新局面的展开\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (340, 1, '20世纪80年代我国对外开放格局具有的特点不包括', 1, 'peadmin', '', '&lt;p&gt;A. 多层次&lt;/p&gt;&lt;p&gt;B. 有重点&lt;/p&gt;&lt;p&gt;C. 点面结合&lt;/p&gt;&lt;p&gt;D. 内外相联&lt;/p&gt;', 4, 'D', '20世纪80年代我国逐步形成了“经济特区一沿海开放城市一沿海经济开放区一内地”这样一个多层次、有重点、点面结合的对外开放格局，在引进外资、先进技术和设备以及提高出口创汇能力方面取得显著成效。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"30\";s:5:\"knows\";s:58:\"第二节 改革开放和现代化建设新局面的展开\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (341, 1, '《关于经济体制改革的决定》，指出我国社会主义经济是', 1, 'peadmin', '', '&lt;p&gt;A. 计划经济&lt;/p&gt;&lt;p&gt;B. 市场经济&lt;/p&gt;&lt;p&gt;C. 社会主义市场经济&lt;/p&gt;&lt;p&gt;D. 在公有制基础上的有计划的商品经济&lt;/p&gt;', 4, 'D', '1984年10月中共十二届三中全会通过的《关于经济体制改革的决定》，突破把计划经济同商品经济对立起来的观点，指出我国社会主义经济是在公有制基础上的有计划的商品经济。 答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"30\";s:5:\"knows\";s:58:\"第二节 改革开放和现代化建设新局面的展开\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (342, 1, '从1994年起，国有企业改革的总体思路是', 1, 'peadmin', '', '&lt;p&gt;A. 提高企业竞争力&lt;/p&gt;&lt;p&gt;B. 建立现代企业制度&lt;/p&gt;&lt;p&gt;C. 实行公司制、股份制&lt;/p&gt;&lt;p&gt;D. 转换企业经营机制&lt;/p&gt;', 4, 'B', '按照中共十四届三中全会的部署，经济体制改革沿着建立社会主义市场经济的目标在各方面深入推进。从1994年起，国有企业改革按照建立现代企业制度这总体思路逐步推进。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"31\";s:5:\"knows\";s:58:\"第三节 改革开放和现代化建设发展的新阶段\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (343, 1, '提出要实现从传统的计划经济体制向社会主义市场经济体制、从粗放型增长方式向集约型增长方式转变的会议是', 1, 'peadmin', '', '&lt;p&gt;A. 八届全国人大四次会议&lt;/p&gt;&lt;p&gt;B. 中共十一大&lt;/p&gt;&lt;p&gt;C. 中共十二大&lt;/p&gt;&lt;p&gt;D. 中共十三大&lt;/p&gt;', 4, 'A', '1996年3月召开的八届全国人大四次会议上批准的“九五”计划和2010 年远景目标纲要，提出要实现从传统的计划经济体制向社会主义市场经济体制、从粗放型增长方式向集约型增长方式的两个根本转变。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"31\";s:5:\"knows\";s:58:\"第三节 改革开放和现代化建设发展的新阶段\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (344, 1, '1994年5月，江泽民指出，改革、发展和稳定三者的关系是', 1, 'peadmin', '', '&lt;p&gt;A. 发展是前提，改革是动力，稳定是目的&lt;/p&gt;&lt;p&gt;B. 稳定是前提，改革是动力，发展是目的&lt;/p&gt;&lt;p&gt;C. 改革是前提，稳定是动力，发展是目的&lt;/p&gt;&lt;p&gt;D. 在稳定中推进改革，通过改革促进发展&lt;/p&gt;', 4, 'B', '1994年初，中共中央根据十四大的精神，提出了“抓住机遇、深化改革、扩大开放、促进发展、保持稳定”的基本方针。同年 5月，江泽民进一步提出：稳定是前提，改革是动力，发展是目的，三者相互促进。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"31\";s:5:\"knows\";s:58:\"第三节 改革开放和现代化建设发展的新阶段\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (345, 1, '香港、澳门的回归使    的构想变为现实。', 1, 'peadmin', '', '&lt;p&gt;A. 和平统一&lt;/p&gt;&lt;p&gt;B. 一国两制&lt;/p&gt;&lt;p&gt;C. 改革开放&lt;/p&gt;&lt;p&gt;D. 计划生育&lt;/p&gt;', 4, 'B', '1997年7月1日，中华人民共和国香港特别行政区正式成立。1999年12月20日，澳门也回归祖国，澳门特別行政区正式成立。香港、澳门的回归，使“一国两制”从科学构想变成现实，标志着祖国统一大业又向前迈出了重要的一步。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"31\";s:5:\"knows\";s:58:\"第三节 改革开放和现代化建设发展的新阶段\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (346, 1, '20世纪90年代后期，中国改革开放和现代化建设经受的风险考验不包括', 1, 'peadmin', '', '&lt;p&gt;A. 亚洲金融危机的爆发&lt;/p&gt;&lt;p&gt;B. 北约袭击中国驻南斯拉夫使馆&lt;/p&gt;&lt;p&gt;C. 历史上罕见的洪涝灾害&lt;/p&gt;&lt;p&gt;D. “非典”疫病灾害的袭击&lt;/p&gt;', 4, 'D', '1997年爆发的亚洲金融危机．对中国经济产生了严重冲击。1998年，长江、嫩江和松花江等流域发生了历史上罕见的洪涝灾害。1999年。又接连发生以美国为的北大西洋公约集团（简称北约）袭击中国驻南斯拉夫使馆、李登辉抛出“两国论”“法轮功”邪教组织策划和煽动非法聚众闹事。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"31\";s:5:\"knows\";s:58:\"第三节 改革开放和现代化建设发展的新阶段\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (347, 1, '“三个代表”重要思想作为完整的概念，是江泽民2000年2月在   考察工作时提出的。', 1, 'peadmin', '', '&lt;p&gt;A. 江苏&lt;/p&gt;&lt;p&gt;B. 广东&lt;/p&gt;&lt;p&gt;C. 浙江&lt;/p&gt;&lt;p&gt;D. 上海&lt;/p&gt;', 4, 'B', '“三个代表”重要思想作为完整的概念，是2000年2月江泽民在广东考察工作时提出的。2001年7月1日，江泽民在庆祝中国共产党成立80周年大会上发表讲话，系统阐述“三个代表”重要思想的科学内涵和基本内容。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"31\";s:5:\"knows\";s:58:\"第三节 改革开放和现代化建设发展的新阶段\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (348, 1, '把“三个代表”重要思想确立为中国共产党指导思想的大会是', 1, 'peadmin', '', '&lt;p&gt;A. 中共十三大&lt;/p&gt;&lt;p&gt;B. 中共十四大&lt;/p&gt;&lt;p&gt;C. 中共十五大&lt;/p&gt;&lt;p&gt;D. 中共十六大&lt;/p&gt;', 4, 'D', '2002年11月8日至14日，中国共产党第十六次全国代表大会把“三个代表”重要思想同马克思列宁主义、毛泽东思想、邓小平理论一道确立为中国共产党必须长期坚持的指导思想，并写入党章。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"31\";s:5:\"knows\";s:58:\"第三节 改革开放和现代化建设发展的新阶段\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (349, 1, '江泽民在庆祝中国共产党成立80 周年大会上系统阐述了', 1, 'peadmin', '', '&lt;p&gt;A. 邓小平理论&lt;/p&gt;&lt;p&gt;B. 加强党风建设的思想&lt;/p&gt;&lt;p&gt;C. “三个代表”重要思想&lt;/p&gt;&lt;p&gt;D. 树立忧患意识的思想&lt;/p&gt;', 4, 'C', '“三个代表”重要思想作为完整的概念，是2000年2月江泽民在广、东考察工作时提出的。2001年7月1日，江泽民在庆祝中国共产党成立80周年大会上，系统阐述“三个代表”重要思想的科学内涵和基本内容。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"31\";s:5:\"knows\";s:58:\"第三节 改革开放和现代化建设发展的新阶段\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (350, 1, '中国共产党确定的新世纪前二十年的奋斗目标是', 1, 'peadmin', '', '&lt;p&gt;A. 实施西部开发战略&lt;/p&gt;&lt;p&gt;B. 解决“三农”问题&lt;/p&gt;&lt;p&gt;C. 计划经济体制向社会主义市场经济体制转变&lt;/p&gt;&lt;p&gt;D. 全面建设小康社会&lt;/p&gt;', 4, 'D', '十六大报告明确了全面建设小康社会的奋斗目标。提出要在本世纪头二十年，紧紧抓住这一重要战略机遇期；集中力量，全面建设惠及十几亿人口的更高水平的小康社会。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"32\";s:5:\"knows\";s:64:\"第四节 在新的历史起点上推进中国特色社会主义\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (351, 1, '1998年中央决定在县级以上党政领导班子、领导干部中深入开展党性党风教育活动，其主要内容不包括', 1, 'peadmin', '', '&lt;p&gt;A. 讲学习&lt;/p&gt;&lt;p&gt;B. 讲纪律&lt;/p&gt;&lt;p&gt;C. 讲政治&lt;/p&gt;&lt;p&gt;D. 讲正气&lt;/p&gt;', 4, 'B', '1998年1月21日，根据中共十五大的部署，中央决定在县级以上党政领导班子、领导干部中深入开展以讲学习、讲政治、讲正气为主要内容的党性党风教育。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"31\";s:5:\"knows\";s:58:\"第三节 改革开放和现代化建设发展的新阶段\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (352, 1, '正式提出以人为本、全面协调可持续的科学发展观的会议是', 1, 'peadmin', '', '&lt;p&gt;A. 中共十五届五中全会&lt;/p&gt;&lt;p&gt;B. 中共十五届六中全会&lt;/p&gt;&lt;p&gt;C. 中共十六届三中全会&lt;/p&gt;&lt;p&gt;D. 中共十六届四中全会&lt;/p&gt;', 4, 'C', '2003年10月召开的中共十六届三中全会，正式提出了坚持以人为本、全面 协调可持续的科学发展观。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"32\";s:5:\"knows\";s:64:\"第四节 在新的历史起点上推进中国特色社会主义\";}}', 1532691021, 1, '', 0, 0, 1, '', 0);
INSERT INTO `x2_questions` VALUES (353, 1, '下列在中国封建社会的封建宗法等级制度中不占主导地位的是', 1, 'peadmin', '', '&lt;p&gt;A. 君权&lt;/p&gt;&lt;p&gt;B. 父权&lt;/p&gt;&lt;p&gt;C. 夫权&lt;/p&gt;&lt;p&gt;D. 子权&lt;/p&gt;', 4, 'D', '中国的封建社会在社会结构上的特点是族权和政权相结合的封建宗法等级制度，核心是宗族家长制，君权、父 权、夫权占主导地位。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:43:\"第一节 鸦片战争前的中国和世界\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (354, 1, '“康雍乾盛世”指的是清朝的哪三朝？', 1, 'peadmin', '', '&lt;p&gt;A. 顺治，康熙，乾隆  &lt;/p&gt;&lt;p&gt;B. 康熙，雍正，乾隆&lt;/p&gt;&lt;p&gt;C. 康熙，乾隆，嘉庆  &lt;/p&gt;&lt;p&gt;D. 康熙，乾隆，道光&lt;/p&gt;', 4, 'B', '清朝是中国历史上最后一个封建王朝，在其前期的康熙、雍正、乾隆三朝，中国国家统一，政权巩固，社会稳定，经济繁荣，史称“康雍乾盛世”。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (355, 1, '1887年，葡萄牙胁迫清政府签订的允许葡萄牙“永驻管理澳门”的条约是', 1, 'peadmin', '', '&lt;p&gt;A. 《中葡友好通商条约》&lt;/p&gt;&lt;p&gt;B. 《五口通商条约》&lt;/p&gt;&lt;p&gt;C. 《望厦条约》&lt;/p&gt;&lt;p&gt;D. 《黄埔条约》&lt;/p&gt;', 4, 'A', '1849 年，葡萄牙 武力抢占澳门半岛，1887 年，葡萄牙胁迫清政府签订《中葡友好通商条约》，允许葡萄牙“永驻管理澳门”。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (356, 1, '西方资本主义国家入侵中国后签订的第一个不平等条约是', 1, 'peadmin', '', '&lt;p&gt;A. 《江宁条约》&lt;/p&gt;&lt;p&gt;B. 《望厦条约》&lt;/p&gt;&lt;p&gt;C. 《黄埔条约》&lt;/p&gt;&lt;p&gt;D. 《虎门条约》&lt;/p&gt;', 4, 'A', '《江宁条约》即《南京条约》，是1840 年第一次鸦片战争后，清政府与英国签订的不平 等条约，中美《望厦条约》、中法《黄埔条约》、中英《虎门条约》都签订于《江宁条约》之后。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (357, 1, '清政府与美国侵略者签订的第一个不平等条约是', 1, 'peadmin', '', '&lt;p&gt;A. 《黄埔条约》&lt;/p&gt;&lt;p&gt;B. 《广州条约》&lt;/p&gt;&lt;p&gt;C. 《望厦条约》&lt;/p&gt;&lt;p&gt;D. 《中美友好通商航海条约》&lt;/p&gt;', 4, 'C', '1840 年，英国发动第一次鸦片战争，清政府先后与英国签订了中英《江宁条约》（即《南京条约》）、《五口通商章程》、《虎门条约》。与美国签订了中美《望厦条约》，这一条约是清政府与美国签订的第一个不平 等条约。答案为C.', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (358, 1, '近代中国的社会性质是', 1, 'peadmin', '', '&lt;p&gt;A. 封建社会&lt;/p&gt;&lt;p&gt;B. 资本主义社会&lt;/p&gt;&lt;p&gt;C. 半殖民地半封建社会&lt;/p&gt;&lt;p&gt;D. 殖民地社会&lt;/p&gt;', 4, 'C', '鸦片战争签订的南京条约使中国的主权和领土完整遭到破坏，沦为半殖民地半封建社会，后来中日甲午战争签订的马关条约使这种状态大大加深，八国联军战争签订的辛丑条约使中国完全沦入半殖民地半封建状态。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (359, 1, '第一次鸦片战争后，清政府被迫与美国签订的不平等条约是', 1, 'peadmin', '', '&lt;p&gt;A. 《南京条约》&lt;/p&gt;&lt;p&gt;B. 《黄埔条约》&lt;/p&gt;&lt;p&gt;C. 《虎门条约》&lt;/p&gt;&lt;p&gt;D. 《望厦条约》&lt;/p&gt;', 4, 'D', '1840 年，英国发动第一次鸦片战争，中国战败。清政府先后与英国签订了中英《江宁条约》（即《南京条约》）、《五口通商章程》、《虎门条约》，与美国签订了中美《望厦条约》，与法国签订了中法《黄埔条约》。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (360, 1, '1860 年与清政府签订《北京条约》的，不包括', 1, 'peadmin', '', '&lt;p&gt;A. 英国&lt;/p&gt;&lt;p&gt;B. 法国&lt;/p&gt;&lt;p&gt;C. 日本&lt;/p&gt;&lt;p&gt;D. 俄国&lt;/p&gt;', 4, 'C', '1856 年，英法发动第二次鸦片战争。1858 年清政府分别与英、法、美、俄签订了《天津条约》。1860 年，清政府分别与英法签订《北京条约》，与俄国先后签订了中俄《瑷珲条约》、中俄《北京条约》、中俄《勘分西北界约记》等。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (361, 1, '第一次鸦片战争后，清政府与列强签订的不平等条约不包括', 1, 'peadmin', '', '&lt;p&gt;A. 《江宁条约》&lt;/p&gt;&lt;p&gt;B. 《望厦条约》&lt;/p&gt;&lt;p&gt;C. 《黄埔条约》&lt;/p&gt;&lt;p&gt;D. 《瑷珲条约》&lt;/p&gt;', 4, 'D', '1840 年，英国发动第一次鸦片战争，中国战败。清政府先后与英国签订了中英《江宁条约》（即《南京条约》）、《五口通商章程》、《虎门条约》，与美国签订了中美《望厦条约》，与法国签订了中法《黄埔条约》。1856 年，英法发动第二次鸦片战争。1860 年，清政府与俄国先后签订了中俄《瑷珲条约》、中俄《北京条约》、中俄《勘分西北界约记》等。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (362, 1, '19世纪五六十年代，沙皇俄国趁火打劫，通过一系列条约侵吞我国领土144万多平方公里，这些条约不包括', 1, 'peadmin', '', '&lt;p&gt;A. 《瑷珲条约》&lt;/p&gt;&lt;p&gt;B. 《北京条约》&lt;/p&gt;&lt;p&gt;C. 《勘分西北界约记》&lt;/p&gt;&lt;p&gt;D. 《改订伊犁条约》&lt;/p&gt;', 4, 'D', '1858 年，中俄《瑷珲条约》签订，割去黑龙江以北60多万平方公里的中国领土；1860 年，中俄《北京条约》签订，割去乌苏里江以东40 余万平方公里的中国领土；1864 年，中俄《勘分西北界约记》，割去中国西北44万多平方公里的领土；1881 年，通过《改订伊犁条约》和5个勘界议定书，共割去7万平方公里领土。在五六十年代一共侵吞了144万多平方公里。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (363, 1, '强行割去台湾全岛及所有附属岛屿和澎湖列岛的不平等条约是', 1, 'peadmin', '', '&lt;p&gt;A. 《虎门条约》&lt;/p&gt;&lt;p&gt;B. 《黄埔条约》&lt;/p&gt;&lt;p&gt;C. 《辛丑条约》&lt;/p&gt;&lt;p&gt;D. 《马关条约》&lt;/p&gt;', 4, 'D', '1895 年清政府在甲 午战争中战败，签订《马 关条约》，条约规定割让辽东半岛（后由中国政府以3000万两白银赎回）、台湾全岛及所有附属岛屿和澎湖列岛给日本。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (364, 1, '近代中国向资本一帝国主义列强赔款最多的不平等条约是', 1, 'peadmin', '', '&lt;p&gt;A. 《南京条约》&lt;/p&gt;&lt;p&gt;B. 《马关条约》&lt;/p&gt;&lt;p&gt;C. 《辛丑条约》&lt;/p&gt;&lt;p&gt;D. 《天津条约》&lt;/p&gt;', 4, 'C', '通过不平 等条约，资本一帝国主义列强勒索巨额赔款。1901 年签订的《辛丑条约》规定，清政府向各国赔款共 4.5亿两，分39 年还清，年 息 4厘，共 9. 82亿两，还有各地 赔款2000万两。这是近代中国向资本一帝国主义列强赔款最多的不平 等条约。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (365, 1, '近代中国，曾统治台湾半个世纪的国家是', 1, 'peadmin', '', '&lt;p&gt;A. 英国&lt;/p&gt;&lt;p&gt;B. 葡萄牙&lt;/p&gt;&lt;p&gt;C. 俄国&lt;/p&gt;&lt;p&gt;D. 日本&lt;/p&gt;', 4, 'D', '1895年，中日《马关条约》签订，中国割让辽东半岛、台湾全岛及所有附属各岛屿和澎湖列岛给日本。《马关条约》签订后，日本开始了对台湾长达50 年（即半个世纪）的殖民统治。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (366, 1, '第二次鸦片战争中，从中国攫取了一百多万平方公里的土地，获利最大的国家是', 1, 'peadmin', '', '&lt;p&gt;A. 英国&lt;/p&gt;&lt;p&gt;B. 法国&lt;/p&gt;&lt;p&gt;C. 俄国&lt;/p&gt;&lt;p&gt;D. 日本&lt;/p&gt;', 4, 'C', '1858年、1860年、1864年、1881年中俄分别签订《瑷珲条约》、《北京条约》、《勘分西北界约记》、《改订伊犁条约》和5个勘界议定书，通过这一系列不平等条约，俄国共侵占中国领土150多万平方公里。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (367, 1, '19世纪末资本主义进入帝国主义阶段之后，其对中国进行殖民剥削的主要形式是', 1, 'peadmin', '', '&lt;p&gt;A. 商品输出&lt;/p&gt;&lt;p&gt;B. 资本输出&lt;/p&gt;&lt;p&gt;C. 垄断商品倾销&lt;/p&gt;&lt;p&gt;D. 掠夺廉价劳动力&lt;/p&gt;', 4, 'B', '对华资本输出是近代外国列强对中国进行经济掠夺的重要內容。资本主义列强对华经济侵略在19世纪70 年代以前以商品输出为主，但也开始了早期的资本输出。19世纪晚期后，西方侵华以资本输出为主，商品输出为辅。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (368, 1, '1842年，中英《南京条约》开放的通商口岸是', 1, 'peadmin', '', '&lt;p&gt;A. 广州、厦门、福州、南京、上海&lt;/p&gt;&lt;p&gt;B. 广州、汉口、福州、南京、上海&lt;/p&gt;&lt;p&gt;C. 广州、厦门、福州、宁波、上海&lt;/p&gt;&lt;p&gt;D. 广州、汉口、福州、宁波、上海&lt;/p&gt;', 4, 'C', '1842年，《南京条约》开放广州、厦门、福州、宁波、上海 5口为通商口岸。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (369, 1, '在中国近代史上规定允许外国人在中国办工厂的条约是', 1, 'peadmin', '', '&lt;p&gt;A. 《南京条约》&lt;/p&gt;&lt;p&gt;B. 《北京条约》&lt;/p&gt;&lt;p&gt;C. 《天津条约》&lt;/p&gt;&lt;p&gt;D. 《马关条约》&lt;/p&gt;', 4, 'D', '甲午战争后签订的《马关条约》允许日本在中国设厂，各国也援例进行，对华进行大规模的资本输出。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (370, 1, '列强在华设立的第一家银行是', 1, 'peadmin', '', '&lt;p&gt;A. 英国东方银行&lt;/p&gt;&lt;p&gt;B. 英国汇丰银行&lt;/p&gt;&lt;p&gt;C. 法国东方汇理银行&lt;/p&gt;&lt;p&gt;D. 俄国俄华银行&lt;/p&gt;', 4, 'A', '外国列强通过在中国设立银行，使之成为对华输出资本的枢纽。1845 年，英国丽如银行（又称英国东方银行）成为在中国开办的第一家银行，以后各国纷纷在中国开办银行。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (371, 1, '1858年，《天津条约》规定开放的通商口岸城市不包括', 1, 'peadmin', '', '&lt;p&gt;A. 天津&lt;/p&gt;&lt;p&gt;B. 汉口&lt;/p&gt;&lt;p&gt;C. 九江&lt;/p&gt;&lt;p&gt;D. 南京&lt;/p&gt;', 4, 'A', '1858 年，《天津条约》开放牛庄（后改营口）、登州（后改烟台）、台湾（后定为台南）、淡水、潮州（后改汕 头）、琼州、汉口、九江、南京、镇江等10个口岸。1860 年，《北京条约》又开放天津为通商口岸。答 案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (372, 1, '基督教在中国设立的最大出版机构广学会发行的报刊是', 1, 'peadmin', '', '&lt;p&gt;A. 《中国丛报》&lt;/p&gt;&lt;p&gt;B. 《北华捷报》&lt;/p&gt;&lt;p&gt;C. 《字林西报》&lt;/p&gt;&lt;p&gt;D. 《万国公报》&lt;/p&gt;', 4, 'D', '广学会是基督教在中国设立的最大出版机构。广学会发行的《万国公报》，除介绍西方的政治、经济、文化和社会状况外，还竭力宣扬殖民地奴化思想，为外国列强侵华进行辩护。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (373, 1, '帝国主义在中国办报纸、杂志，翻译、出版各种书刊的根本目的是', 1, 'peadmin', '', '&lt;p&gt;A. 宣传自然、科学的思想，促进中外文化交流&lt;/p&gt;&lt;p&gt;B. 帮助中国建立民主政治制度&lt;/p&gt;&lt;p&gt;C. 扬“种族优劣论”，攻击污蔑中华民族的愚昧落后&lt;/p&gt;&lt;p&gt;D. 为帝国主义制造侵略有理的舆论&lt;/p&gt;', 4, 'D', '外国列强为侵略中国制造舆论是其对中国进行文化渗透的重要途径。西方教会中一部分人通过在中国办报纸、杂志，翻译、出版各种书刊，利用传教和传播西学的名义为外国列强侵华制造舆论。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (374, 1, '资本一帝国主义列强侵略中国的主要目的是', 1, 'peadmin', '', '&lt;p&gt;A. 掠夺资源&lt;/p&gt;&lt;p&gt;B. 开辟市场&lt;/p&gt;&lt;p&gt;C. 开拓疆土&lt;/p&gt;&lt;p&gt;D. 强迫中国成为其附属国&lt;/p&gt;', 4, 'D', '资本一帝国主义列强来到中国的主要目的，并非要把落后的中国变成先进的中国，而是要强迫中国永远成为西方列强的附属国。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (375, 1, '中国近代史以鸦片战争为开端，主要是因为', 1, 'peadmin', '', '&lt;p&gt;A. 中国社会性质开始发生根本变化&lt;/p&gt;&lt;p&gt;B. 中国第一次被西方国家打败&lt;/p&gt;&lt;p&gt;C. 中国长期闭关锁国状况被打破&lt;/p&gt;&lt;p&gt;D. 民族矛盾取代了阶级矛盾&lt;/p&gt;', 4, 'A', '1840 年第一次鸦片战争后，中国逐渐沦入了国家政权形式上仍然 存在，而主权受制于外国列强的半殖民地社会。与此同时，中国出现了资本主义生产关系，不再是完全意义上的封建社会，而是一个半封建社会了。中国的社会性质开始发生了根本变化，因此中国近代史以鸦片战争为开端。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (376, 1, '中国开始进入半殖民地半封建社会是在', 1, 'peadmin', '', '&lt;p&gt;A. 第一次鸦片战争后&lt;/p&gt;&lt;p&gt;B. 第二次鸦片战争后&lt;/p&gt;&lt;p&gt;C. 中日甲 午战争后&lt;/p&gt;&lt;p&gt;D. 八国联军侵华战争后&lt;/p&gt;', 4, 'A', '鸦片战争后，中国的社会性质发生了根本性变化，由一个落后封闭但独立自主的封建国家沦为一个半殖民地半封建社会。因此，中国开始进入半殖民地半封建社会，是在第一次鸦片战争后。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (377, 1, '近代中国社会的性质是', 1, 'peadmin', '', '&lt;p&gt;A. 封建主义社会&lt;/p&gt;&lt;p&gt;B. 半殖民地半封建社会&lt;/p&gt;&lt;p&gt;C. 资本主义社会&lt;/p&gt;&lt;p&gt;D. 社会主义社会&lt;/p&gt;', 4, 'B', '1840 年鸦片战争失败，中国与西方列强签订一系列不平 等 条约，迫使清政府割地、赔款，中国的主权独立受到侵犯，领土完整遭到 破坏，中国逐渐沦入了国家政权形式上仍然存在、主权受制于外国列强的半殖民地社会。同时，鸦片战争后，外国资本的入侵，促使中国传统的自然经济解体，也促进了中国城乡 商品经济的发展，中国出现了资本主义生产关系，不再是完全意义上的封建社会，而是一个半封建社会。近代中国的社会性质是半殖民地半封建社会。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (378, 1, '中国最早的一批产业工人产生在', 1, 'peadmin', '', '&lt;p&gt;A. 洋务企业中&lt;/p&gt;&lt;p&gt;B. 外国资本经营的近代工商业中&lt;/p&gt;&lt;p&gt;C. 民族资本主义企业中&lt;/p&gt;&lt;p&gt;D. 私人小作坊中&lt;/p&gt;', 4, 'B', '工人阶级是近代中国诞生的被压—迫阶级。中国工人阶级的很大一部分比中国资产阶级的年龄和资格更老一些，它的社会力量和社会基础也更广一些。鸦片战争后，外国资本在广州、上海等地经营近代工商业，其中产生了中国最早的一批产业工人。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"2\";s:5:\"knows\";s:79:\"第二节 资本—帝国主义对中国的侵略及近代中国社会的演变\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (379, 1, '1841年战死虎门的广东水师提督是', 1, 'peadmin', '', '&lt;p&gt;A. 陈化成&lt;/p&gt;&lt;p&gt;B. 海龄&lt;/p&gt;&lt;p&gt;C. 左宝贵&lt;/p&gt;&lt;p&gt;D. 关天培&lt;/p&gt;', 4, 'D', '鸦片战争开始后，清朝许多爱国官兵英勇奋战。1841 年 2月，广东水师提督关天培战死虎门；1842 年 6月，江南提督陈化成在吴淞西炮台以身殉国，7月，副都统海龄（满族）在镇江战死疆场。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"3\";s:5:\"knows\";s:58:\"第三节 抵御外来侵略、争取民族独立的斗争\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (380, 1, '中法战争期间，击退法舰保卫台湾的将领是', 1, 'peadmin', '', '&lt;p&gt;A. 林永升&lt;/p&gt;&lt;p&gt;B. 关天培&lt;/p&gt;&lt;p&gt;C. 刘铭传&lt;/p&gt;&lt;p&gt;D. 丁汝昌&lt;/p&gt;', 4, 'C', '中法战争期间，1884 年法舰攻基隆、犯淡水，都被督办台湾事务大臣刘铭传的守军击退。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"3\";s:5:\"knows\";s:58:\"第三节 抵御外来侵略、争取民族独立的斗争\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (381, 1, '在1885年中法战争中，大败法军，取得镇南关大捷的清朝将领是', 1, 'peadmin', '', '&lt;p&gt;A. 刘铭传&lt;/p&gt;&lt;p&gt;B. 冯子材&lt;/p&gt;&lt;p&gt;C. 关天培&lt;/p&gt;&lt;p&gt;D. 陈化成&lt;/p&gt;', 4, 'B', '1884 年法舰攻基隆、犯淡水，都被督办台湾事务大臣刘铭传的守军击退。1885年初，法舰炮轰 浙江镇 海炮台，被击退。3月，冯子材率领清军和当 地民众在镇南关取得关键性胜利，完全扭转了整个中法战局，史称镇南关大捷。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"3\";s:5:\"knows\";s:58:\"第三节 抵御外来侵略、争取民族独立的斗争\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (382, 1, '粉碎西方列强瓜分中国图谋的事件是', 1, 'peadmin', '', '&lt;p&gt;A. 三国干涉还辽 &lt;/p&gt;&lt;p&gt;B. 戊戌变法&lt;/p&gt;&lt;p&gt;C. 义和团运动&lt;/p&gt;&lt;p&gt;D. 辛亥革命&lt;/p&gt;', 4, 'C', '义和团运动在粉碎外国列强瓜分中国的斗争中，发挥了重大作用，遏制了侵略者瓜分中国的图谋。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"3\";s:5:\"knows\";s:58:\"第三节 抵御外来侵略、争取民族独立的斗争\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (383, 1, '资本一帝国主义列强不能灭亡和瓜分近代中国的最根本原因是', 1, 'peadmin', '', '&lt;p&gt;A. 资本一帝国主义列强之间的矛盾&lt;/p&gt;&lt;p&gt;B. 晚清政府的军事抵抗&lt;/p&gt;&lt;p&gt;C. 中国人民不屈不挠的反侵略斗争&lt;/p&gt;&lt;p&gt;D. 中国资产阶级开始登上历史舞台&lt;/p&gt;', 4, 'C', '列强不能灭亡和瓜分中国的最根本原因，是中国人民进行了不屈不挠的反侵略斗争。义和团反帝爱国运动期间，中国人民以不畏强暴，敢与敌人血战到底的气概，打击了侵略者，使他们不敢为所欲为地瓜分中国。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"3\";s:5:\"knows\";s:58:\"第三节 抵御外来侵略、争取民族独立的斗争\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (384, 1, '下列不是在第一次鸦片战争中以身殉国的是', 1, 'peadmin', '', '&lt;p&gt;A. 关天培&lt;/p&gt;&lt;p&gt;B. 邓世昌&lt;/p&gt;&lt;p&gt;C. 海龄&lt;/p&gt;&lt;p&gt;D. 陈化成&lt;/p&gt;', 4, 'B', '关天培是广东水师提督，在虎门献身。陈化成是江南提督，在吴淞口殉国。海龄是副都统，战死镇江。殉国于1841年到1842年第一次鸦片战争期间。邓世昌则在1894年甲午黄海海战中献身，不属于第一次鸦片战争时期。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"3\";s:5:\"knows\";s:58:\"第三节 抵御外来侵略、争取民族独立的斗争\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (385, 1, '1895年，严复在《救亡决论》一文中响亮地喊出的口号是', 1, 'peadmin', '', '&lt;p&gt;A. “振兴中华”&lt;/p&gt;&lt;p&gt;B. “物竞天择”&lt;/p&gt;&lt;p&gt;C. “适者生存”&lt;/p&gt;&lt;p&gt;D. “救亡”&lt;/p&gt;', 4, 'D', '鸦片战争后，民族觉醒意识还局限于少数人之中。中日甲 午战争后，帝国主义列强图谋瓜分中国，中华民族到了生死存亡的紧要关 头，中国人的民族意识逐渐觉醒.1895 年，严复在《救亡决论》一文中响亮地喊出了“救亡”的口号。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"3\";s:5:\"knows\";s:58:\"第三节 抵御外来侵略、争取民族独立的斗争\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (386, 1, '1894年11月喊出了“振兴中华”这个时代最强音的人是', 1, 'peadmin', '', '&lt;p&gt;A. 洪秀全&lt;/p&gt;&lt;p&gt;B. 严复&lt;/p&gt;&lt;p&gt;C. 孙中山&lt;/p&gt;&lt;p&gt;D. 康有为&lt;/p&gt;', 4, 'C', '民族危机激发了中华民族的觉醒，增强了中华民族的凝聚力，救亡图存成了时代的主旋律。孙中山于1894 年 11月创立了革命团体一一兴中会，喊出了“振兴中华”这个时代的最强音。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"3\";s:5:\"knows\";s:58:\"第三节 抵御外来侵略、争取民族独立的斗争\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (387, 1, '下列属于严复翻译的著作是', 1, 'peadmin', '', '&lt;p&gt;A. 《新学伪经考》&lt;/p&gt;&lt;p&gt;B. 《变法通议》&lt;/p&gt;&lt;p&gt;C. 《天演论》&lt;/p&gt;&lt;p&gt;D. 《人类公理》&lt;/p&gt;', 4, 'C', '1895 年，严复在《救亡决论》中响亮地喊出了“救亡”的口号。此后，严复翻译了《天演论》。他用“物竞天择”、“适者生存”的社会进化论思想，激发人们的危机意识和民族意识。答案为C.', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"3\";s:5:\"knows\";s:58:\"第三节 抵御外来侵略、争取民族独立的斗争\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (388, 1, '1851 年，中国爆发了一场伟大的农民战争，达到农民战争最高峰的是', 1, 'peadmin', '', '&lt;p&gt;A. 大泽乡起义&lt;/p&gt;&lt;p&gt;B. 辛亥革命&lt;/p&gt;&lt;p&gt;C. 太平天国运动&lt;/p&gt;&lt;p&gt;D. 义和团运动&lt;/p&gt;', 4, 'C', '19世纪中叶，外国资本主义的入侵激化了中国社会各种矛盾，广大农民纷纷揭竿而起。1851 年，洪秀全在广西金田 村发动起义。太平天国运动持续了14 年，势力扩展到 18个省，其规模之大，时间之长，影响之深，达到了历代农民战争的最高峰。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"4\";s:5:\"knows\";s:43:\"第一节 农民群众斗争风暴的起落\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (389, 1, '下列关于太平天国领导人希望通过《天朝田亩制度》的实施来达到理想社会状态的说法，不正确的是', 1, 'peadmin', '', '&lt;p&gt;A. 有田同耕，有饭同食&lt;/p&gt;&lt;p&gt;B. 有衣同穿，有钱同使&lt;/p&gt;&lt;p&gt;C. 无处不均匀，无人不饱暖&lt;/p&gt;&lt;p&gt;D. 苟富贵，勿相忘&lt;/p&gt;', 4, 'D', '《天朝田亩制度》颁布于1853 年冬，是最能体现太平天国社会理想和这次农民战争特点的纲领性文件。太平天国领导人希望通过这个方案，建立“有田同耕，有饭同食，有衣同穿，有钱同使，无处不均匀，无人不饱暖”的理想社会。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"4\";s:5:\"knows\";s:43:\"第一节 农民群众斗争风暴的起落\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (390, 1, '1853年3月，洪秀全领导的太平天国建都，后改称天京。', 1, 'peadmin', '', '&lt;p&gt;A. 金田&lt;/p&gt;&lt;p&gt;B. 武昌&lt;/p&gt;&lt;p&gt;C. 安庆&lt;/p&gt;&lt;p&gt;D. 南京&lt;/p&gt;', 4, 'D', '1851年1月，洪秀全率领拜上帝教教众在广西省桂平县金田村发动起义，建号太平天国。1853 年 3月，洪秀全领导的太平军攻克南京，改名天京，定为太平天国首都。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"4\";s:5:\"knows\";s:43:\"第一节 农民群众斗争风暴的起落\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (391, 1, '《天朝田亩制度》的中心内容是', 1, 'peadmin', '', '&lt;p&gt;A. 推翻清政府的统治&lt;/p&gt;&lt;p&gt;B. 反对帝国主义的侵略&lt;/p&gt;&lt;p&gt;C. 解决土地问题&lt;/p&gt;&lt;p&gt;D. 促进农副业生产发展&lt;/p&gt;', 4, 'C', '《天朝田亩制度》是一个以解决土地问题为中心的比较完整的社会改革方案，代表了农民要求平均分配土地的强烈愿望，反映了农民反对封建土地所有制的普遍要求。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"4\";s:5:\"knows\";s:43:\"第一节 农民群众斗争风暴的起落\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (392, 1, '天京事变后，洪秀全为挽救太平天国而提拔的年轻将领主要是陈玉成和', 1, 'peadmin', '', '&lt;p&gt;A. 李秀成&lt;/p&gt;&lt;p&gt;B. 石达开&lt;/p&gt;&lt;p&gt;C. 洪仁玕&lt;/p&gt;&lt;p&gt;D. 杨秀清&lt;/p&gt;', 4, 'A', '1856年9月，发生了天京事变，东王杨秀清、北王韦昌辉先后被杀，翼王石达开率部出走后败亡。天京事变则是太平天国由盛到 衰的转折点，它大大地 削 弱了太平天国的领导和军事力量，造成了严重的危机。为了挽救危局，洪秀全提拔了英王陈玉成、忠王李秀成等一批年轻的将领，封洪仁玕为干王总理朝政。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"4\";s:5:\"knows\";s:43:\"第一节 农民群众斗争风暴的起落\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (393, 1, '洋务派举办军事工业的目的不包括', 1, 'peadmin', '', '&lt;p&gt;A. 镇压太平天国农民起义&lt;/p&gt;&lt;p&gt;B. 加强海防、边防&lt;/p&gt;&lt;p&gt;C. 学习西方的先进技术&lt;/p&gt;&lt;p&gt;D. 抵御外国侵略&lt;/p&gt;', 4, 'C', '洋务派举办洋务是从近代军用工业着手的，其目的首先是为了镇压太平天国起义；同时，也是为了加强海 防、边防，抵御外国侵略。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"5\";s:5:\"knows\";s:61:\"第二节 地主阶级统治集团“自救”活动的兴衰\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (394, 1, '下列属于洋务派举办的最重要的官督商办的民用企业的是', 1, 'peadmin', '', '&lt;p&gt;A. 轮船招商局&lt;/p&gt;&lt;p&gt;B. 江南制造总局&lt;/p&gt;&lt;p&gt;C. 金陵机器局&lt;/p&gt;&lt;p&gt;D. 马尾船政局&lt;/p&gt;', 4, 'A', '洋务派举办的最重要的官督商办民用企业有轮船招商局、开平矿务局、天津电报局和上海机器织布局。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"5\";s:5:\"knows\";s:61:\"第二节 地主阶级统治集团“自救”活动的兴衰\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (395, 1, '中国近代海军的建立是在', 1, 'peadmin', '', '&lt;p&gt;A. 第一次鸦片战争时期&lt;/p&gt;&lt;p&gt;B. 第二次鸦片战争时期&lt;/p&gt;&lt;p&gt;C. 洋务运动时期&lt;/p&gt;&lt;p&gt;D. 中日甲 午战争时期&lt;/p&gt;', 4, 'C', '洋务运动时期，建立新式海陆军。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"5\";s:5:\"knows\";s:61:\"第二节 地主阶级统治集团“自救”活动的兴衰\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (396, 1, '洋务运动首先兴办的是', 1, 'peadmin', '', '&lt;p&gt;A. 民用企业&lt;/p&gt;&lt;p&gt;B. 军用工业&lt;/p&gt;&lt;p&gt;C. 商业&lt;/p&gt;&lt;p&gt;D. 农业&lt;/p&gt;', 4, 'B', '19世纪60至90年代，洋务派举办的洋务事业归纳起 来主要有三个方面：(1)兴办近代企业。(2)建立新式海 陆军。(3)创办新式学堂、派遣 留 学生。其中，洋务派最早兴办的是军用工业。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"5\";s:5:\"knows\";s:61:\"第二节 地主阶级统治集团“自救”活动的兴衰\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (397, 1, '洋务派举办的民用企业的资金有多种形式，其中多数采取的方式是', 1, 'peadmin', '', '&lt;p&gt;A. 官办&lt;/p&gt;&lt;p&gt;B. 官督商办&lt;/p&gt;&lt;p&gt;C. 官商合办&lt;/p&gt;&lt;p&gt;D. 商督官办&lt;/p&gt;', 4, 'B', '洋务派举办的民用企业的资金全部或大部由政府筹集，同时也吸收一部分商股，主要由政府派官员管理，分官办、官督商办、官商合办几种形式。其中，多数都采取官督商办的方式。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"5\";s:5:\"knows\";s:61:\"第二节 地主阶级统治集团“自救”活动的兴衰\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (398, 1, '洋务运动时期最早创办的翻译学堂是', 1, 'peadmin', '', '&lt;p&gt;A. 同文馆&lt;/p&gt;&lt;p&gt;B. 广方言馆&lt;/p&gt;&lt;p&gt;C. 译书局&lt;/p&gt;&lt;p&gt;D. 译书馆&lt;/p&gt;', 4, 'A', '洋务派创建翻译学堂，培养翻译人才。1862年奕?奏请创办京师同文馆，1863年李鸿章在上海创办广方言馆。同文馆是洋务运动时期最早创办的翻译学堂。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"5\";s:5:\"knows\";s:61:\"第二节 地主阶级统治集团“自救”活动的兴衰\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (399, 1, '近代中国派遣第一批留学生是在', 1, 'peadmin', '', '&lt;p&gt;A. 洋务运动时期  &lt;/p&gt;&lt;p&gt;B. 戊戌维新时期&lt;/p&gt;&lt;p&gt;C. 清末“新政”时期  &lt;/p&gt;&lt;p&gt;D. 辛亥革命时期&lt;/p&gt;', 4, 'A', '洋务派开办了一批新式学堂，派出最早的官派留学生，这是中国近代教育的开始。新式学堂打破了旧式教育和科举度一统天下的局面，培养了一批近代科技军事人才。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"6\";s:5:\"knows\";s:40:\"第三节 维新运动的兴起和夭折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (400, 1, '洋务运动失败的标志是', 1, 'peadmin', '', '&lt;p&gt;A. 八国联军入侵北京&lt;/p&gt;&lt;p&gt;B. 义和团运动兴起&lt;/p&gt;&lt;p&gt;C. 北洋海军全军覆没&lt;/p&gt;&lt;p&gt;D. 英法联军攻占北京&lt;/p&gt;', 4, 'C', '中日甲午战争中，洋务派经营多年的北洋海军全军覆没，标志着洋务运动的失败。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"6\";s:5:\"knows\";s:40:\"第三节 维新运动的兴起和夭折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (401, 1, '康有为在戊戌维新时期撰写的宣传变法维新主张的理论著作是', 1, 'peadmin', '', '&lt;p&gt;A. 《新学伪经考》&lt;/p&gt;&lt;p&gt;B. 《变法通义》&lt;/p&gt;&lt;p&gt;C. 《救亡决论》&lt;/p&gt;&lt;p&gt;D. 《仁学》&lt;/p&gt;', 4, 'A', '康有为写了《新学伪经考》、《孔子改制考》和《人类公理》等著作；梁启超写了《变法通义》，谭嗣同写了《仁学》，宣传变法维新主张。而《救亡决论》是严复的著作。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"6\";s:5:\"knows\";s:40:\"第三节 维新运动的兴起和夭折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (402, 1, '支持“百日维新”的清朝皇帝是', 1, 'peadmin', '', '&lt;p&gt;A. 乾隆&lt;/p&gt;&lt;p&gt;B. 咸丰&lt;/p&gt;&lt;p&gt;C. 道光&lt;/p&gt;&lt;p&gt;D. 光绪&lt;/p&gt;', 4, 'D', '维新派以各种方式宣传变法主张，培养骨干力量，制造社会舆论，重点放在争取光绪皇帝及其 周围的帝党官员的支持上，希望通过他们自上而下地实行变法。因此，支持“百日维新”的清朝皇帝是光绪。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"6\";s:5:\"knows\";s:40:\"第三节 维新运动的兴起和夭折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (403, 1, '清政府设立督办政务处，宣布实行“新政”是在', 1, 'peadmin', '', '&lt;p&gt;A. 1901 年&lt;/p&gt;&lt;p&gt;B. 1904 年&lt;/p&gt;&lt;p&gt;C. 1906 年&lt;/p&gt;&lt;p&gt;D. 1908 年&lt;/p&gt;', 4, 'A', '清王朝为了取得外国列强的信任，平息国内日益高涨的民怨，安抚统治阶级内部各派，拉拢民族资产阶级改良派，于1901年4月设立督办政务处，宣布实行“新政”。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"7\";s:5:\"knows\";s:49:\"第一节 举起近代民族民主革命的旗帜\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (404, 1, '兴中会的革命纲领不包括', 1, 'peadmin', '', '&lt;p&gt;A. 驱除鞑虏&lt;/p&gt;&lt;p&gt;B. 恢复中国&lt;/p&gt;&lt;p&gt;C. 创立合众政府    &lt;/p&gt;&lt;p&gt;D. 恢复中华&lt;/p&gt;', 4, 'D', '1894 年，孙中山在檀香山组织了中国第一个资产阶级革命组织一—兴中会。1895 年春，在香港成立兴中会总部，并以“驱除鞑虏，恢复中国，创立合众政府”为誓词。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"7\";s:5:\"knows\";s:49:\"第一节 举起近代民族民主革命的旗帜\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (405, 1, '在宣传民主革命思想的过程中，著名的资产阶级革命派知识分子不包括', 1, 'peadmin', '', '&lt;p&gt;A. 章炳麟&lt;/p&gt;&lt;p&gt;B. 邹容&lt;/p&gt;&lt;p&gt;C. 陈天华&lt;/p&gt;&lt;p&gt;D. 康有为&lt;/p&gt;', 4, 'D', '20世纪初，资产阶级革命派著 书立说，使民主革命思想迅速传播开来。其中，著名的资产阶级革命派知识分子有章炳麟、邹容、陈天华等。康有为是改 良派的代表人物，不是革命派的代表人物。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"7\";s:5:\"knows\";s:49:\"第一节 举起近代民族民主革命的旗帜\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (406, 1, '下列组织中不是由孙中山组建的是', 1, 'peadmin', '', '&lt;p&gt;A. 光复会&lt;/p&gt;&lt;p&gt;B. 中国同盟会&lt;/p&gt;&lt;p&gt;C. 兴中会&lt;/p&gt;&lt;p&gt;D. 中华革命党&lt;/p&gt;', 4, 'A', '光复会的会长是蔡元培；中国同盟会是1905 年 8月20日由 孙中山、黄兴 等人在东京成立的；兴中会是1894年，孙中山在檀香山成立的中国第一个资产阶级革命组织；中华 革命党是二次革命失败后，1914 年 7月孙中山在东京成立的。答 案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"7\";s:5:\"knows\";s:49:\"第一节 举起近代民族民主革命的旗帜\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (407, 1, '三民主义中，民族主义的内容包括', 1, 'peadmin', '', '&lt;p&gt;A. 驱除鞑虏，恢复中华&lt;/p&gt;&lt;p&gt;B. 创立合众政府&lt;/p&gt;&lt;p&gt;C. 创立民国&lt;/p&gt;&lt;p&gt;D. 平均地权&lt;/p&gt;', 4, 'A', '三民主义中，民族主义包括“驱 除鞑虏，恢复中华”两项内容。一是以革命手段推翻清王朝，改变它一贯推行的民族歧．视和压迫政策；二是变“次殖民地”的中国为独立的中国。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"7\";s:5:\"knows\";s:49:\"第一节 举起近代民族民主革命的旗帜\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (408, 1, '中国历史上第一个比较完备的民主主义革命纲领是', 1, 'peadmin', '', '&lt;p&gt;A. 《天朝田亩制度》&lt;/p&gt;&lt;p&gt;B. 《资政新篇》&lt;/p&gt;&lt;p&gt;C. 《变法通义》&lt;/p&gt;&lt;p&gt;D. 三民主义学说&lt;/p&gt;', 4, 'D', '孙中山的三民主义 学说是一个比较完备的民主主义的革命纲领，产生了积极影响，推动了革命思想的传播和革命运动的发展。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"8\";s:5:\"knows\";s:40:\"第二节 辛亥革命的胜利与失败\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (409, 1, '1915 年 5月，袁世凯为取得日本对他复辟帝制的支持，基本接受日本提出的严重损害中国权益的条约是', 1, 'peadmin', '', '&lt;p&gt;A. 西原借款&lt;/p&gt;&lt;p&gt;B. “二十一条”&lt;/p&gt;&lt;p&gt;C. 善后大借款&lt;/p&gt;&lt;p&gt;D. 铁路借款&lt;/p&gt;', 4, 'B', '北洋军阀为巩固专制统治，不惜投靠帝国主义。袁世凯未经国会同意，与列强签订了“善后大借款”合同，用盐税作抵押。1915 年 5月，为了取得日本对他复辟帝制的支持，袁世凯竟然基本接受日本提出的严重损害中国权益的“二十一条”。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"8\";s:5:\"knows\";s:40:\"第二节 辛亥革命的胜利与失败\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (410, 1, '袁世凯复辟帝制，举行登基大典是在', 1, 'peadmin', '', '&lt;p&gt;A. 1915年&lt;/p&gt;&lt;p&gt;B. 1916年&lt;/p&gt;&lt;p&gt;C. 1917年&lt;/p&gt;&lt;p&gt;D. 1918年&lt;/p&gt;', 4, 'B', '袁世凯复辟帝制，举行登基大典是在1916 年。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"8\";s:5:\"knows\";s:40:\"第二节 辛亥革命的胜利与失败\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (411, 1, '1917年6月，   率军北上，拥清废帝溥仪复辟。', 1, 'peadmin', '', '&lt;p&gt;A. 康有为&lt;/p&gt;&lt;p&gt;B. 冯国璋&lt;/p&gt;&lt;p&gt;C. 段祺瑞&lt;/p&gt;&lt;p&gt;D. 张勋&lt;/p&gt;', 4, 'D', '1917 年 6月，前清官僚张勋率领“辫子军”北上，拥清废帝溥仪复辟，仅12天就在全国人民的声讨中破产了。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"8\";s:5:\"knows\";s:40:\"第二节 辛亥革命的胜利与失败\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (412, 1, '1913 年 6月，袁世凯向全国发布  ，实行尊孔复古。', 1, 'peadmin', '', '&lt;p&gt;A. 《通令尊崇孔圣文》&lt;/p&gt;&lt;p&gt;B. 《通令尊孔读经文》&lt;/p&gt;&lt;p&gt;C. 《通令祭祀孔圣文》&lt;/p&gt;&lt;p&gt;D. 《通令尊定国教文》&lt;/p&gt;', 4, 'A', '在文化思想方面，北洋政府实行尊孔复古。1913 年 6月，袁世凯向全国发布《通令尊崇孔圣文》。不久，又命令全国恢复祀孔、祭孔典礼，恢复跪拜礼节，中小学恢复尊孔读经。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"8\";s:5:\"knows\";s:40:\"第二节 辛亥革命的胜利与失败\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (413, 1, '下列不属于五四运动中迫于全国各界的压力而罢免的亲日派官僚的是', 1, 'peadmin', '', '&lt;p&gt;A. 曹汝霖&lt;/p&gt;&lt;p&gt;B. 章宗祥&lt;/p&gt;&lt;p&gt;C. 陆宗舆&lt;/p&gt;&lt;p&gt;D. 段祺瑞&lt;/p&gt;', 4, 'D', '迫于全国各界的压力，北洋军阀政府于6月10日释放全部被捕 学生，并宣布罢免亲日派官僚曹汝霖、章宗祥、陆宗舆的职务。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"9\";s:5:\"knows\";s:40:\"第一节 新文化运动与五四运动\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (414, 1, '中共二大提出了资产阶级、小资产阶级政党从没有采取过的革命方法是', 1, 'peadmin', '', '&lt;p&gt;A. 统一战线方法&lt;/p&gt;&lt;p&gt;B. 群众路线方法&lt;/p&gt;&lt;p&gt;C. 武装斗争方法    &lt;/p&gt;&lt;p&gt;D. 议会斗争方法&lt;/p&gt;', 4, 'B', '中共二大提出了“到群众中去”，组成一个大“群众党”的任务；强调党的一切运动都必须深入到广大的群众里面去。这说明中国共产党开始采取资产阶级、小资产阶级政党从来没采取过的新的革命方法，即群众路线的方法。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"10\";s:5:\"knows\";s:55:\"第二节 马克思主义传播与中国共产党诞生\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (415, 1, '下列不属于国民党一大确立的政策的是', 1, 'peadmin', '', '&lt;p&gt;A. 联俄&lt;/p&gt;&lt;p&gt;B. 联共&lt;/p&gt;&lt;p&gt;C. 扶助农工&lt;/p&gt;&lt;p&gt;D. 平均地权&lt;/p&gt;', 4, 'D', '1924年1月，中国国民党第一次全国代表大会在广州召开。国民党一大实际上确立了联俄、联 共、扶助农工三大政策，成为第一次国共合作的政治基础。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"11\";s:5:\"knows\";s:37:\"第三节 国共合作与国民革命\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (416, 1, '黄埔军校的政治部主任是', 1, 'peadmin', '', '&lt;p&gt;A. 蒋介石&lt;/p&gt;&lt;p&gt;B. 廖仲恺&lt;/p&gt;&lt;p&gt;C. 周恩来&lt;/p&gt;&lt;p&gt;D. 李大钊&lt;/p&gt;', 4, 'C', '在苏俄政府及共产党人的帮助下，1924 年 5月，中国国民党 陆军军官学校（简称黄埔军校）成立，孙中山亲自兼任总理，蒋介石任校长，廖仲恺任党代表，聘请加伦等苏联红军将领为军事顾问。11月，周 恩 来担任黄埔军校政治部主任。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"11\";s:5:\"knows\";s:37:\"第三节 国共合作与国民革命\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (417, 1, '下列不是国民革命军发动北伐的直接目标的是', 1, 'peadmin', '', '&lt;p&gt;A. 张作霖&lt;/p&gt;&lt;p&gt;B. 吴佩孚&lt;/p&gt;&lt;p&gt;C. 孙传芳&lt;/p&gt;&lt;p&gt;D. 段祺瑞&lt;/p&gt;', 4, 'D', '北伐的直接目标是打倒帝国主义支持的北洋军阀。当时，北洋军阀统治着全国大部分地区。直系军阀吴佩孚控制着湖南、湖北、河南三省和直隶（河北）保定一带。约有兵力30万人；由直系分立出来的孙传芳盘踞在江苏、浙江、安徽、江西、福建五省，约有兵力20万人；奉系军阀张作霖控制着东北三省、热河、察哈尔、北京、天津以及山东，约有兵力30万人。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"11\";s:5:\"knows\";s:37:\"第三节 国共合作与国民革命\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (418, 1, '中共八七会议召开的地点是在', 1, 'peadmin', '', '&lt;p&gt;A. 九江&lt;/p&gt;&lt;p&gt;B. 汉口&lt;/p&gt;&lt;p&gt;C. 武昌&lt;/p&gt;&lt;p&gt;D. 上海&lt;/p&gt;', 4, 'B', '1927 年 8月7日，中共中央在汉口秘密召开紧急会议（即八七会议）。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"13\";s:5:\"knows\";s:58:\"第二节 中国共产党对革命新道路的艰苦探索\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (419, 1, '标志建设共产党领导的新型人民军队重要开端的是', 1, 'peadmin', '', '&lt;p&gt;A. 井冈山根据地的建立&lt;/p&gt;&lt;p&gt;B. 三湾改编&lt;/p&gt;&lt;p&gt;C. 南昌起义&lt;/p&gt;&lt;p&gt;D. 中共中央给红四军前委的指示信&lt;/p&gt;', 4, 'B', '三湾改编成为建设共产党领导的新型人民军队的重要开端。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"13\";s:5:\"knows\";s:58:\"第二节 中国共产党对革命新道路的艰苦探索\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (420, 1, '南昌起义的指挥者是', 1, 'peadmin', '', '&lt;p&gt;A. 周恩来、贺龙、叶挺、朱德、刘伯承&lt;/p&gt;&lt;p&gt;B. 毛泽东、周恩来、贺龙、叶挺、朱德&lt;/p&gt;&lt;p&gt;C. 毛泽东、周恩来、贺龙、叶挺、张太雷&lt;/p&gt;&lt;p&gt;D. 周恩来、贺龙、叶挺、朱德、叶剑英&lt;/p&gt;', 4, 'A', '1927年8月1日，以周 恩 来为书记的前敌委员会及贺龙、叶挺、朱德、刘伯承等人，率领共产党掌握或影响下的北伐军2万多人在南昌举行起 义，史称南昌起义。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"13\";s:5:\"knows\";s:58:\"第二节 中国共产党对革命新道路的艰苦探索\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (421, 1, '1927 年 9月9日，毛泽东领导的著名起义是', 1, 'peadmin', '', '&lt;p&gt;A. 湘赣边界秋收起义&lt;/p&gt;&lt;p&gt;B. 赣南秋收起义&lt;/p&gt;&lt;p&gt;C. 湘南秋收起义&lt;/p&gt;&lt;p&gt;D. 广州起义&lt;/p&gt;', 4, 'A', '八七会议后，毛泽东作为中央特派员到湖南改组省委并领导湘赣边界秋收起义。1927 年 9月9日，起义爆发。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"13\";s:5:\"knows\";s:58:\"第二节 中国共产党对革命新道路的艰苦探索\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (422, 1, '点燃“工农武装割据”星星之火的是', 1, 'peadmin', '', '&lt;p&gt;A. 井冈山根据地的创建&lt;/p&gt;&lt;p&gt;B. 湘赣根据地的创建&lt;/p&gt;&lt;p&gt;C. 湘鄂西根据地的创建&lt;/p&gt;&lt;p&gt;D. 陕甘宁根据地的创建&lt;/p&gt;', 4, 'A', '井冈山根据地的创建具有深远意义，它点燃了“工农武装割据”的星星之 火，为共产党领导的其他各地起义 武装树立了榜样；它从实践上开辟了一条在敌我力量十分悬殊的情况下，共产党深入农村保存和发展革命力量的正 确 道路。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"13\";s:5:\"knows\";s:58:\"第二节 中国共产党对革命新道路的艰苦探索\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (423, 1, '中国共产党独立领导革命战争、创建人民军队始于', 1, 'peadmin', '', '&lt;p&gt;A. 南昌起义&lt;/p&gt;&lt;p&gt;B. 秋收起义&lt;/p&gt;&lt;p&gt;C. 广州起义&lt;/p&gt;&lt;p&gt;D. 百色起义&lt;/p&gt;', 4, 'A', '1927 年 8月1日爆发的南昌起义，成为共产党独立领导革命战争、创建人民军队和武装夺取政权的伟大开端。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"13\";s:5:\"knows\";s:58:\"第二节 中国共产党对革命新道路的艰苦探索\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (424, 1, '在半殖民地半封建的中国，红色政权存在发展的客观条件是', 1, 'peadmin', '', '&lt;p&gt;A. 政治经济极端不平衡和国民革命影响&lt;/p&gt;&lt;p&gt;B. 相当力量正式红军存在和革命形势继续向前发展&lt;/p&gt;&lt;p&gt;C. 政治经济极端不平衡和革命形势继续向前发展&lt;/p&gt;&lt;p&gt;D. 国民革命影响和全国革命形势继续向前发展&lt;/p&gt;', 4, 'D', '毛泽东在《中国的红色政权为什么能够存在？》和《井冈山的斗争》两篇文章中，回答了红色政权存在发展的客观条件是国民革命影响和全国革命形势继续向前发展。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"13\";s:5:\"knows\";s:58:\"第二节 中国共产党对革命新道路的艰苦探索\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (425, 1, '带领红军粉碎国民党军队前三次“围剿”的是', 1, 'peadmin', '', '&lt;p&gt;A. 王明、博古&lt;/p&gt;&lt;p&gt;B. 周恩来、刘伯承&lt;/p&gt;&lt;p&gt;C. 周恩来、朱德&lt;/p&gt;&lt;p&gt;D. 毛泽东、朱德&lt;/p&gt;', 4, 'D', '从1930年10月到1931年7月，红一方面军在毛泽东、朱德等的指挥下，贯彻积极防御方针，实行“诱敌深入”、“避敌主力、打 其 虚 弱”等一整套行之有效的战术，连续粉碎了国民党军队的三次“围剿”。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"13\";s:5:\"knows\";s:58:\"第二节 中国共产党对革命新道路的艰苦探索\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (426, 1, '1929年4月，毛泽东在兴国发布第二个土地法，将“没收一切土地”改为“没收一切公共土地及地主阶级的土地”。这一个原则性的改正，保护了', 1, 'peadmin', '', '&lt;p&gt;A. 地主的利益&lt;/p&gt;&lt;p&gt;B. 富农的利益&lt;/p&gt;&lt;p&gt;C. 中农的利益&lt;/p&gt;&lt;p&gt;D. 贫农的利益&lt;/p&gt;', 4, 'C', '毛泽东在井冈山主持制定了中国共产党历史上第一个土地法后，又于1929年 4月，在兴国发布了第二个土地法，将“没收一切土地”改为“没收一切公共土地及地主阶级的土地”。这是一个原则性的改正，保护了中农的利益。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"13\";s:5:\"knows\";s:58:\"第二节 中国共产党对革命新道路的艰苦探索\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (427, 1, '左翼文化运动中，正如毛泽东所说，成为这个文化新军的最伟大和最英勇的旗手是', 1, 'peadmin', '', '&lt;p&gt;A. 瞿秋白&lt;/p&gt;&lt;p&gt;B. 茅盾&lt;/p&gt;&lt;p&gt;C. 邹韬奋&lt;/p&gt;&lt;p&gt;D. 鲁迅&lt;/p&gt;', 4, 'D', '根据地军民进行军事上反“围剿”作战的同时，国民党统治区的共产党人和文化界进步人士在文化战线上形成了左翼文化运动。鲁迅，正如毛泽东所说，成为这个文化新军的最伟大和最英勇的旗手，鲁迅的方向代表着中华民族新文化的方向。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"14\";s:5:\"knows\";s:46:\"第三节 中国革命在探索中曲折前进\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (428, 1, '1931年，中华苏维埃第一次全国代表大会召开的地点是', 1, 'peadmin', '', '&lt;p&gt;A. 江西省吉安&lt;/p&gt;&lt;p&gt;B. 江西省瑞金&lt;/p&gt;&lt;p&gt;C. 江西省兴国&lt;/p&gt;&lt;p&gt;D. 陕西省延安&lt;/p&gt;', 4, 'B', '1931 年11月，中华苏维埃第一次全国代表大会在江西省瑞金县叶坪 村举行。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"14\";s:5:\"knows\";s:46:\"第三节 中国革命在探索中曲折前进\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (429, 1, '中华苏维埃共和国实行', 1, 'peadmin', '', '&lt;p&gt;A. 政治协商制度&lt;/p&gt;&lt;p&gt;B. 各级工农兵代表大会制度&lt;/p&gt;&lt;p&gt;C. 人民代表会议制度&lt;/p&gt;&lt;p&gt;D. 人民代表大会制度&lt;/p&gt;', 4, 'B', '中华苏维埃共和国临时中央政府成立于1931 年 11月。  中华苏维埃共和国实行各级工农兵代表大会制度。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"14\";s:5:\"knows\";s:46:\"第三节 中国革命在探索中曲折前进\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (430, 1, '土地革命中采用的正确土地分配方法是', 1, 'peadmin', '', '&lt;p&gt;A. 富农分坏田&lt;/p&gt;&lt;p&gt;B. 地主不分田&lt;/p&gt;&lt;p&gt;C. 以乡为单位，按人口平分土地&lt;/p&gt;&lt;p&gt;D. 按阶级成分划分土地&lt;/p&gt;', 4, 'C', '毛泽东和邓子 恢等规定了土地革命中的阶级路线和土地分配方法。这主要是，坚定依靠贫农、雇农，联合中农，限制富农，保护中小工商业者，消灭 地主阶级；以乡为单位，按人口平分土地，在原耕地基础上，实行抽多补少，抽肥补瘦。答 案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"14\";s:5:\"knows\";s:46:\"第三节 中国革命在探索中曲折前进\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (431, 1, '下列选项不属于左翼文化运动的作品和刊物的是', 1, 'peadmin', '', '&lt;p&gt;A. 《子夜》&lt;/p&gt;&lt;p&gt;B. 《义勇军进行曲》&lt;/p&gt;&lt;p&gt;C. 《茶馆》&lt;/p&gt;&lt;p&gt;D. 《生活周刊》&lt;/p&gt;', 4, 'C', '鲁迅的杂文，瞿秋白的评论，茅盾的小说《子夜》，田 汉作词、聂耳谱曲的《义勇军进行曲》，邹韬奋主办的《生活周刊》等，都是左翼文化运动的作品和刊物。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"14\";s:5:\"knows\";s:46:\"第三节 中国革命在探索中曲折前进\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (432, 1, '在土地革命战争前中期，“左”倾错误先后在中国共产党中央领导机关取得统治地位有', 1, 'peadmin', '', '&lt;p&gt;A. 一次&lt;/p&gt;&lt;p&gt;B. 二次&lt;/p&gt;&lt;p&gt;C. 三次&lt;/p&gt;&lt;p&gt;D. 四次&lt;/p&gt;', 4, 'C', '1927年大革命失败后，纠正陈独秀右倾错误的同时，由于缺乏对中国政局的复杂性和中国革命长期性的深刻认识，中国共产党內开始滋长了“左”倾急躁情绪。土地革命战争前中期，“左”倾错误先后三次在中国共产党中央领导机关取得统治地位。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"14\";s:5:\"knows\";s:46:\"第三节 中国革命在探索中曲折前进\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (433, 1, '中共临时中央政治局迁到中央革命根据地后，全面推行“左”倾教条主义错误，在福建开展的运动是', 1, 'peadmin', '', '&lt;p&gt;A. 肃反运动&lt;/p&gt;&lt;p&gt;B. 反对“邓、毛、谢、古”的斗争&lt;/p&gt;&lt;p&gt;C. 整风运动&lt;/p&gt;&lt;p&gt;D. 反对“罗明路线”的斗争&lt;/p&gt;', 4, 'D', '中共临时中央政治局迁至中央根据地后，全面推行“左”倾教条主义错误，在福建开展了反对“罗明路线”的斗争，在江西开展反对邓（小平）、毛（泽覃）、谢（唯俊）、古（柏）的斗争。斗争的矛头实际上是对着毛泽东的正确主张的。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"14\";s:5:\"knows\";s:46:\"第三节 中国革命在探索中曲折前进\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (434, 1, '遵义会议后代替博古对党负总责的是', 1, 'peadmin', '', '&lt;p&gt;A. 毛泽东&lt;/p&gt;&lt;p&gt;B. 周恩来&lt;/p&gt;&lt;p&gt;C. 王稼祥&lt;/p&gt;&lt;p&gt;D. 张闻天&lt;/p&gt;', 4, 'D', '遵义会议决定由张闻天代替博古负总的责任。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"14\";s:5:\"knows\";s:46:\"第三节 中国革命在探索中曲折前进\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (435, 1, '中国共产党在政治上达到成熟的时期是', 1, 'peadmin', '', '&lt;p&gt;A. 国民大革命时期&lt;/p&gt;&lt;p&gt;B. 第二次国内革命战争时期&lt;/p&gt;&lt;p&gt;C. 抗日战争时期&lt;/p&gt;&lt;p&gt;D. 解放战争时期&lt;/p&gt;', 4, 'B', '遵义会议在极其危急的情况下挽救了中国共产党、挽救了中国工农红军、挽救了中国革命，开始确立了以毛泽东为代表的新的中央的领导，标志着中国共产党在政治上走向成熟。遵义会议处于第二次国内革命战争时期。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"14\";s:5:\"knows\";s:46:\"第三节 中国革命在探索中曲折前进\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (436, 1, '中国红军长征的起止时间是', 1, 'peadmin', '', '&lt;p&gt;A. 1934 年 10月～19 36 年 10月&lt;/p&gt;&lt;p&gt;B. 1934 年10月～1935 年 10月&lt;/p&gt;&lt;p&gt;C. 1935 年 10月～1936 年 10月&lt;/p&gt;&lt;p&gt;D. 1934 年 10月-1935 年 5月&lt;/p&gt;', 4, 'A', '1934年10月，红一方面军8.6万人撤离根据地，向西突围转移，开始了震惊中外的长征。1936 年 10月，红二、四方面军先后同红军一方面在甘肃会宁、静宁将台堡会师，胜利结束长征。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"14\";s:5:\"knows\";s:46:\"第三节 中国革命在探索中曲折前进\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (437, 1, '1936年10月，在甘肃会宁、静宁胜利会师的红军主力是红一，红四和', 1, 'peadmin', '', '&lt;p&gt;A. 红六方面军&lt;/p&gt;&lt;p&gt;B. 红十五军团&lt;/p&gt;&lt;p&gt;C. 红二方面军&lt;/p&gt;&lt;p&gt;D. 红五方面军&lt;/p&gt;', 4, 'C', '1936年10月，红二、四方面军先后同红一方面军在甘肃会宁、静宁将台堡会师，胜利结束长征。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"14\";s:5:\"knows\";s:46:\"第三节 中国革命在探索中曲折前进\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (438, 1, '从1931年九一八事变到 1935 年华北事变期间，中国开展的局部抗战有', 1, 'peadmin', '', '&lt;p&gt;A. 淞沪抗战和长城抗战&lt;/p&gt;&lt;p&gt;B. 淞沪抗战和察哈尔抗战&lt;/p&gt;&lt;p&gt;C. 长城抗战和察哈尔抗战&lt;/p&gt;&lt;p&gt;D. 察哈尔抗战和东北抗日游击战争&lt;/p&gt;', 4, 'D', '1933年5月察哈尔抗战，1933 年初，中国共产党领导的抗日游击队先后在东北各地崛起。1934 年 6月，各抗日游击队改编为东北人民革命军；1936 年 2月，又改建为东北抗日联军。东北抗联同日军进行了艰苦卓绝的斗争，沉重打击了日本侵略者。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"16\";s:5:\"knows\";s:43:\"第二节 从局部抗战到全国性抗战\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (439, 1, '下列不属于九一八事变后民族资产阶级对国民党当局的要求的是', 1, 'peadmin', '', '&lt;p&gt;A. 改弦更张&lt;/p&gt;&lt;p&gt;B. 与民更始&lt;/p&gt;&lt;p&gt;C. 内惩国贼&lt;/p&gt;&lt;p&gt;D. 全国一致对外&lt;/p&gt;', 4, 'C', '九一八事变后，民族资产阶级也要求国民党 当局“改弦更张”、“与民更始”，变更“剿共”政策，“全国一致对外”。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"16\";s:5:\"knows\";s:43:\"第二节 从局部抗战到全国性抗战\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (440, 1, '一二·九运动的口号不包括', 1, 'peadmin', '', '&lt;p&gt;A. 反对华北自治运动&lt;/p&gt;&lt;p&gt;B. 打倒日本帝国主义&lt;/p&gt;&lt;p&gt;C. 停止内战，一致对外&lt;/p&gt;&lt;p&gt;D. 变更“剿共”政策&lt;/p&gt;', 4, 'D', '一二·九运动中，学生们喊出“反对华北自治运动”、“打倒日本帝国主义”、“停止内战，一致对外”等口号。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"16\";s:5:\"knows\";s:43:\"第二节 从局部抗战到全国性抗战\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (441, 1, '标志十年内战的局面结束，国内和平基本实现，成为时局转换的枢纽的是', 1, 'peadmin', '', '&lt;p&gt;A. 国民党五届三中全会的召开&lt;/p&gt;&lt;p&gt;B. 西安事变的和平解决&lt;/p&gt;&lt;p&gt;C. 中共瓦窑堡会议的召开&lt;/p&gt;&lt;p&gt;D. 蒋介石发表庐山谈话&lt;/p&gt;', 4, 'B', '西安事变的和平解决成为时局转换的枢纽，十年内战的局面 由此结束，国内和平基本实现。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"16\";s:5:\"knows\";s:43:\"第二节 从局部抗战到全国性抗战\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (442, 1, '1936年5月，中共中央放弃“反蒋抗日”口号，第一次公开把蒋介石作为联合的对象的标志是', 1, 'peadmin', '', '&lt;p&gt;A. 《停战议和一致抗日通电》&lt;/p&gt;&lt;p&gt;B. 《为抗日救国告全国同胞书》&lt;/p&gt;&lt;p&gt;C. 《中国人民对日作战的基本纲领》&lt;/p&gt;&lt;p&gt;D. 《中共中央为公布国共合作宣言》&lt;/p&gt;', 4, 'A', '1936年5月，中共中央发布《停战议和一致抗日通电》，放弃了“反蒋抗日”的口号，第一次公开把蒋介石作为联合的对象。同年 9月1日，中共中央发出党内指示，明确提出党的总方针是“逼蒋抗日”。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"16\";s:5:\"knows\";s:43:\"第二节 从局部抗战到全国性抗战\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (443, 1, '以国共两党第二次合作为基础的抗日民族统一战线正式建立的标志是', 1, 'peadmin', '', '&lt;p&gt;A. 国民党中央通讯社发表《中共中央为公布国共合作宣言》&lt;/p&gt;&lt;p&gt;B. 蒋介石发表了实际上承认了中国共产党的合法地位的讲话&lt;/p&gt;&lt;p&gt;C. 局部抗战的全面胜利&lt;/p&gt;&lt;p&gt;D. A 项和B 项均正确&lt;/p&gt;', 4, 'D', '1937年9月22日，国民党中央通讯社发表《中共中央为公布国共合作宣言》；23日，蒋介石发表讲话，实际上承认了中国共产党的合法地位。  由 此，以国共两党第二次合作为基础的抗日民族统一战线正式建立，形成了全民族抗战的新局面。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"17\";s:5:\"knows\";s:67:\"第三节 国民党的正面战场与大后方的抗日民主运动\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (444, 1, '标志着国民政府抗战政策发生转变的事件是', 1, 'peadmin', '', '&lt;p&gt;A. 日本政治诱降政策的抛出&lt;/p&gt;&lt;p&gt;B. 国民党五届五中全会的召开&lt;/p&gt;&lt;p&gt;C. 皖南事变的发生&lt;/p&gt;&lt;p&gt;D. 山西阎锡山部队进攻八路军&lt;/p&gt;', 4, 'B', '1939年1月，国民党五届五中全会决定成立“防共委员会”，确定了“防共、限共、溶共、反共”的方针。蒋介石将抗战到底的含义解释为“恢复到 卢沟桥事变以前的状态”。这标志着国民党抗战政策 由片 面抗战逐步转变为消极抗战。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"17\";s:5:\"knows\";s:67:\"第三节 国民党的正面战场与大后方的抗日民主运动\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (445, 1, '1938年初，担任国民政府军事委员会政治部副部长的是', 1, 'peadmin', '', '&lt;p&gt;A. 张治中&lt;/p&gt;&lt;p&gt;B. 何应钦&lt;/p&gt;&lt;p&gt;C. 周恩来&lt;/p&gt;&lt;p&gt;D. 林伯渠&lt;/p&gt;', 4, 'C', '在抗战初期，国民政府实行过若干有利于抗战的政策。1938 年初，国民政府改组军事委员会，下设政治部，并聘请周 恩来担任政治部副部长。同年6月，成立国民参政会。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"17\";s:5:\"knows\";s:67:\"第三节 国民党的正面战场与大后方的抗日民主运动\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (446, 1, '抗战时期文化界提出的文艺创作的三大目标是', 1, 'peadmin', '', '&lt;p&gt;A. 抗战、团结、民主&lt;/p&gt;&lt;p&gt;B. 抗战、团结、文明&lt;/p&gt;&lt;p&gt;C. 团结、勇敢、创新&lt;/p&gt;&lt;p&gt;D. 救国、抗战、创新&lt;/p&gt;', 4, 'A', '抗战时期，文化界提出“抗战、团结、民主”为文艺创作的三大目标。抗战文化在斗争中得到新的发展。答 案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"18\";s:5:\"knows\";s:58:\"第四节 中国共产党成为抗日战争的中流砥柱\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (447, 1, '抗日战争中，中日双方存在着互相矛盾的特点为', 1, 'peadmin', '', '&lt;p&gt;A. 敌强我弱&lt;/p&gt;&lt;p&gt;B. 敌小我大&lt;/p&gt;&lt;p&gt;C. 敌退步我进步&lt;/p&gt;&lt;p&gt;D. 以上说法均正确&lt;/p&gt;', 4, 'D', '抗战时期，中日双方存在着互相矛盾的四个特点：敌强我弱，敌小我大，敌退步我进步，敌寡助我多助。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"18\";s:5:\"knows\";s:58:\"第四节 中国共产党成为抗日战争的中流砥柱\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (448, 1, '1937年11月太原失陷后，中国共产党先后创建的抗日根据地不包括', 1, 'peadmin', '', '&lt;p&gt;A. 晋察冀抗日根据地&lt;/p&gt;&lt;p&gt;B. 湖北抗日根据地&lt;/p&gt;&lt;p&gt;C. 大青山抗日根据地&lt;/p&gt;&lt;p&gt;D. 晋冀豫抗日根据地&lt;/p&gt;', 4, 'B', '1937年11月太原失 陷后，按照中共中央的部署，八路军在敌后实施战略展开，发动独立自主的敌后游击战争，先后开辟晋察冀、晋西北、晋冀豫、山东、大青山 等抗日根据地。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"18\";s:5:\"knows\";s:58:\"第四节 中国共产党成为抗日战争的中流砥柱\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (449, 1, '中共中央发表的《抗日救国十大纲领》指出，打倒日本帝国主义关键在于', 1, 'peadmin', '', '&lt;p&gt;A. 坚持无产阶级的领导权&lt;/p&gt;&lt;p&gt;B. 发动独立自主的游击战&lt;/p&gt;&lt;p&gt;C. 国民党正面战场应发挥主导作用&lt;/p&gt;&lt;p&gt;D. 使抗战成为全面的全民族的抗战&lt;/p&gt;', 4, 'D', '中共中央发表的《抗日救国十大纲领》，强调要打倒日本帝国主义，关键在于使已经发动的抗战成为全面的全民族的抗战，它体现了中国人民的根本利益和要求，体现了中国共产党的人民战争路线，是彻底的抗日纲领。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"18\";s:5:\"knows\";s:58:\"第四节 中国共产党成为抗日战争的中流砥柱\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (450, 1, '抗战中，八路军、新四军的作战方针是', 1, 'peadmin', '', '&lt;p&gt;A. 全面开展游击战，破坏敌人后方&lt;/p&gt;&lt;p&gt;B. 运动战为主，消灭敌人有生力量&lt;/p&gt;&lt;p&gt;C. 运动战为主，游击战为辅&lt;/p&gt;&lt;p&gt;D. 基本是游击战，不放松有利条件下的运动战&lt;/p&gt;', 4, 'D', '抗日战争中，八路军、新四军采取“基本是游击战，但不放松有利条件下的运动战”的作战方针，抗日游击战具有重要的战略地位。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"18\";s:5:\"knows\";s:58:\"第四节 中国共产党成为抗日战争的中流砥柱\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (451, 1, '抗日战争时期，国民党第二次反共高潮达到顶点的标志是', 1, 'peadmin', '', '&lt;p&gt;A. 晋西事变&lt;/p&gt;&lt;p&gt;B. 陇东事变&lt;/p&gt;&lt;p&gt;C. 平江惨案&lt;/p&gt;&lt;p&gt;D. 皖南事变&lt;/p&gt;', 4, 'D', '1941年1月，国民党顽固派，在皖南以8万余兵力包围袭击新四军军部及所属部队9000余人。蒋介石还诬称新四军“叛变”，宣布取消新四军番号，制造了皖南事变。皖南事变标志着国民党第二次反共高潮达到顶点。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"18\";s:5:\"knows\";s:58:\"第四节 中国共产党成为抗日战争的中流砥柱\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (452, 1, '抗日民族统一战线的策略总方针的中心环节是', 1, 'peadmin', '', '&lt;p&gt;A. 争取中间势力&lt;/p&gt;&lt;p&gt;B. 发展进步势力&lt;/p&gt;&lt;p&gt;C. 孤立顽固势力   &lt;/p&gt;&lt;p&gt;D. 打击大资产阶级&lt;/p&gt;', 4, 'B', '为坚持、扩大和巩固抗日民族统一战线，中国共产党 制定了“发展进步势力，争取中间势力，孤立顽固势力”的策略总方针。其中，进步势力主要是指工人、农民和城市小资产阶级，它是整个策略的中心环节。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"18\";s:5:\"knows\";s:58:\"第四节 中国共产党成为抗日战争的中流砥柱\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (453, 1, '为了坚持、扩大和巩固抗日民族统一战线，中国共产党制定的策略总方针是', 1, 'peadmin', '', '&lt;p&gt;A. 发展进步势力，争取中间势力，孤立顽固势力&lt;/p&gt;&lt;p&gt;B. 争取进步势力，发展中间势力，孤立顽固势力&lt;/p&gt;&lt;p&gt;C. 发展进步势力，孤立中间势力，争取顽固势力&lt;/p&gt;&lt;p&gt;D. 争取进步势力，孤立中间势力，发展顽固势力&lt;/p&gt;', 4, 'A', '为了坚持、扩大和巩固抗日民族统一战线，中国共产党 制定了“发展进步势力，争取中间势力，孤立顽固势力”的策略总方针。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"18\";s:5:\"knows\";s:58:\"第四节 中国共产党成为抗日战争的中流砥柱\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (454, 1, '1939年7月，针对蒋介石消极抗日积极反共，中国共产党明确提出的政治口号不包括', 1, 'peadmin', '', '&lt;p&gt;A. 坚持抗战，反对妥协&lt;/p&gt;&lt;p&gt;B. 坚持团结，反对分裂&lt;/p&gt;&lt;p&gt;C. 坚持进步，反对倒退&lt;/p&gt;&lt;p&gt;D. 坚持抗战，反对投降&lt;/p&gt;', 4, 'A', '1939年7月，针对蒋介石消极抗日，积极反共，中国共产党提出坚持抗战、反对投降，坚持团结、反对分裂，坚持进步、反对倒退三大政治口号。', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"18\";s:5:\"knows\";s:58:\"第四节 中国共产党成为抗日战争的中流砥柱\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (455, 1, '抗日根据地实行“三三制”政权，参加者为', 1, 'peadmin', '', '&lt;p&gt;A. 共产党 员、非党的右派进步分子和中间派&lt;/p&gt;&lt;p&gt;B. 共产党 员、非党的左派进步分子和中间派&lt;/p&gt;&lt;p&gt;C. 共产党员、党的左派进步分子和中间派&lt;/p&gt;&lt;p&gt;D. 共产党员、党的右派进步分子和中间派&lt;/p&gt;', 4, 'B', '抗日民主政权普遍采取民主集中制，各级抗日民主政权机构的领导人都经过人民选举产生。在政权机关工作人员的名额分配上实行“三三制”原则。即 共产党员、非党的左派进步分子和中间派各占1/3。这样做，可以容纳各方面的代表，团结一切赞成抗日又赞成民主的各阶级、阶层。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"18\";s:5:\"knows\";s:58:\"第四节 中国共产党成为抗日战争的中流砥柱\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (456, 1, '中国共产党领导的民主政权实行“三三制”原则是在', 1, 'peadmin', '', '&lt;p&gt;A. 解放战争时期&lt;/p&gt;&lt;p&gt;B. 抗日战争时期&lt;/p&gt;&lt;p&gt;C. 土地改革时期    &lt;/p&gt;&lt;p&gt;D. 大革命时期&lt;/p&gt;', 4, 'B', '在抗日战争时期，为了团结一切赞成抗日又赞成民主的各阶级、阶层，中国共产党实行“三三制”原则。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"18\";s:5:\"knows\";s:58:\"第四节 中国共产党成为抗日战争的中流砥柱\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (457, 1, '抗日根据地建设的首要的、根本的任务是', 1, 'peadmin', '', '&lt;p&gt;A. 加强文化建设&lt;/p&gt;&lt;p&gt;B. 加强经济建设&lt;/p&gt;&lt;p&gt;C. 加强政权建设    &lt;/p&gt;&lt;p&gt;D. 加强社会建设&lt;/p&gt;', 4, 'C', '加强政权建设是抗日根据地建设的首要的、根本的任务，政权建设的核心是民主政治建设。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"18\";s:5:\"knows\";s:58:\"第四节 中国共产党成为抗日战争的中流砥柱\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (458, 1, '提出“精兵简政”政策的是', 1, 'peadmin', '', '&lt;p&gt;A. 林伯渠&lt;/p&gt;&lt;p&gt;B. 李鼎铭&lt;/p&gt;&lt;p&gt;C. 董必武&lt;/p&gt;&lt;p&gt;D. 邓演达&lt;/p&gt;', 4, 'B', '1941 年抗日根据地 面 临着严重的经济困难，陕甘宁边区参议会副议长、党外人士李鼎铭提出了“精兵简政”的提案，中共中央将“精兵简政”作为一项重要的工作，要求各根据地实行。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"18\";s:5:\"knows\";s:58:\"第四节 中国共产党成为抗日战争的中流砥柱\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (459, 1, '毛泽东明确提出“马克思主义的中国化”命题是在', 1, 'peadmin', '', '&lt;p&gt;A. 瓦窑堡会议&lt;/p&gt;&lt;p&gt;B. 洛川会议&lt;/p&gt;&lt;p&gt;C. 中共六届六中全会&lt;/p&gt;&lt;p&gt;D. 中共七大&lt;/p&gt;', 4, 'C', '1938年9月至11月，中国共产党在延安举行了扩大的六届六中全会。这次全会上，毛泽东明确提出了“马克思主义的中国化”这个命题。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"18\";s:5:\"knows\";s:58:\"第四节 中国共产党成为抗日战争的中流砥柱\";}}', 1532691021, 1, '', 0, 0, 3, '', 0);
INSERT INTO `x2_questions` VALUES (460, 1, '标志着毛泽东思想得到多方面展开而达到成熟的是', 1, 'peadmin', '', '&lt;p&gt;A. 新民主主义理论的系统阐明&lt;/p&gt;&lt;p&gt;B. 农村包围城市，武装夺取政权道路理论的系统阐述&lt;/p&gt;&lt;p&gt;C. 社会主义改造理论的系统阐明&lt;/p&gt;&lt;p&gt;D. 社会主义建设思想的系统阐述&lt;/p&gt;', 4, 'A', '新民主主义理论是以毛泽东为主要代表的中国共产党人将马克思主义基本原理同中国革命具体实际相结合的理论成果。新民主主义理论的系统阐明，标志着毛泽东思想得到多方面展开而达到成熟。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"18\";s:5:\"knows\";s:58:\"第四节 中国共产党成为抗日战争的中流砥柱\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (461, 1, '中国共产党内反复出现“左”、右倾错误的思想认识根源是', 1, 'peadmin', '', '&lt;p&gt;A. 经验主义&lt;/p&gt;&lt;p&gt;B. 宗派主义&lt;/p&gt;&lt;p&gt;C. 教条主义&lt;/p&gt;&lt;p&gt;D. 主观主义&lt;/p&gt;', 4, 'C', '反对主观主义是1941年整风运动最主要的任务。教条主义和经验主义是主观主义的主要表现形式，尤其是教条主义，这是中国共产党内反复出现“左”、右倾错误的思想认识根源。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"18\";s:5:\"knows\";s:58:\"第四节 中国共产党成为抗日战争的中流砥柱\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (462, 1, '1941年到1942年毛泽东为延安整风运动所作的报告不包括', 1, 'peadmin', '', '&lt;p&gt;A. 《改造我们的学习》&lt;/p&gt;&lt;p&gt;B. 《整顿党的作风》&lt;/p&gt;&lt;p&gt;C. 《反对党八股》&lt;/p&gt;&lt;p&gt;D. 《中国革命和中国共产党》&lt;/p&gt;', 4, 'D', '1941 年 5月，毛泽东作了《改造我们的学习》的报告，整风运动首先在党的高级干部中进行。1942 年 2月，毛泽东先后作了《整顿党的作风》和《反对党八股》的讲演，整风运动在全 党范围普 遍展开。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"18\";s:5:\"knows\";s:58:\"第四节 中国共产党成为抗日战争的中流砥柱\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (463, 1, '将毛泽东思想规定为党的一切工作的指针的会议是', 1, 'peadmin', '', '&lt;p&gt;A. 中共六大&lt;/p&gt;&lt;p&gt;B. 中共八大&lt;/p&gt;&lt;p&gt;C. 遵义会议&lt;/p&gt;&lt;p&gt;D. 中共七大&lt;/p&gt;', 4, 'D', '中共七大将以毛泽东为主要代表的中国共产党人把马克思列宁主义基本原理同中国具体实际相结合所创造的理论成果，正式命名为毛泽东思想，并将毛泽东思想规定为党的一切工作的指针。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"19\";s:5:\"knows\";s:43:\"第五节 抗日战争的胜利及其意义\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (464, 1, '通过《关于若干历史问题的决议》的会议是', 1, 'peadmin', '', '&lt;p&gt;A. 瓦窑堡会议&lt;/p&gt;&lt;p&gt;B. 中共六届六中全会&lt;/p&gt;&lt;p&gt;C. 中共六届七中全会&lt;/p&gt;&lt;p&gt;D. 中共七大&lt;/p&gt;', 4, 'C', '中国共产党 六届七中全会于1945年 4月20日，通过了《关于若干历史问题的决议》，对党的若干重大历史问题作出结论，使全党尤其是党的高级干部对中国民主革命的基本问题的认识达到在马克思列宁主义基础上的一致。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"19\";s:5:\"knows\";s:43:\"第五节 抗日战争的胜利及其意义\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (465, 1, '对党的若干重大的历史问题作出结论，使全党尤其是党的高级干部对中国民主革命的基本问题的认识达到在马克思列宁主义基础上的一致的文献是', 1, 'peadmin', '', '&lt;p&gt;A. 《改造我们的学习》&lt;/p&gt;&lt;p&gt;B. 《中国革命和中国共产党》&lt;/p&gt;&lt;p&gt;C. 《新民主主义论》&lt;/p&gt;&lt;p&gt;D. 《关于若干历史问题的决议》&lt;/p&gt;', 4, 'D', '1945年4月20日，中国共产党六届七中全会通过了《关于若干历史问题的决议》，对党的若干重大历史问题作出结论，使全党尤其是党的高级干部对中国民主革命的基本问题的认识达到在马克思列宁主义基础上的一致。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"19\";s:5:\"knows\";s:43:\"第五节 抗日战争的胜利及其意义\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (466, 1, '近代以中华民族第一次取得反侵略完全胜利的战争是', 1, 'peadmin', '', '&lt;p&gt;A. 中法战争&lt;/p&gt;&lt;p&gt;B. 甲午中日战争&lt;/p&gt;&lt;p&gt;C. 中国人民抗日战争&lt;/p&gt;&lt;p&gt;D. 抗美援朝战争&lt;/p&gt;', 4, 'C', '中国人民抗日战争，是近代以来中华民族反抗外敌入侵第一次取得完全胜利的民族解放战争，是20世纪中国和人类历史上的重大事件。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"19\";s:5:\"knows\";s:43:\"第五节 抗日战争的胜利及其意义\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (467, 1, '1945年8月，毛泽东发表的号召对一切不愿投降的日本侵略者实行广泛的进攻的文章是', 1, 'peadmin', '', '&lt;p&gt;A. 《为抗日救国告全国同胞书》&lt;/p&gt;&lt;p&gt;B. 《关于目前形势与党的任务的决定》&lt;/p&gt;&lt;p&gt;C. 《论持久战》&lt;/p&gt;&lt;p&gt;D. 《对日寇的最后一战》&lt;/p&gt;', 4, 'D', '1945年8月9日，毛泽东发表《对日寇的最后一战》的声明，指出抗日战争到了最后阶段，号召八路军、新四军及其他人民军队，应在一切可能的条件下，对一切不愿投降的侵略者及其走狗实行广泛的进。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"19\";s:5:\"knows\";s:43:\"第五节 抗日战争的胜利及其意义\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (468, 1, '抗日战争取得完全胜利的重要标志是收回了', 1, 'peadmin', '', '&lt;p&gt;A. 台湾和澎湖列岛&lt;/p&gt;&lt;p&gt;B. 台湾和香港&lt;/p&gt;&lt;p&gt;C. 香港和澎湖列岛&lt;/p&gt;&lt;p&gt;D. 香港和西沙群岛&lt;/p&gt;', 4, 'A', '根据波茨坦公告，被日本占领50年之久的台湾以及澎湖列岛，由中国收回。这成为抗日战争取得完全胜利的重要标志。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"19\";s:5:\"knows\";s:43:\"第五节 抗日战争的胜利及其意义\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (469, 1, '中国抗日战争取得胜利的决定性因素不包括', 1, 'peadmin', '', '&lt;p&gt;A. 中国人民巨大的民族觉醒&lt;/p&gt;&lt;p&gt;B. 中国人民空前的民族团结&lt;/p&gt;&lt;p&gt;C. 中国人民英勇的民族抗争&lt;/p&gt;&lt;p&gt;D. 世界爱好和平与正义的国家和人民的支援&lt;/p&gt;', 4, 'D', 'D 项只是外在因素而非决定性因素，答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"19\";s:5:\"knows\";s:43:\"第五节 抗日战争的胜利及其意义\";}}', 1532691021, 1, '', 0, 0, 3, '', 0);
INSERT INTO `x2_questions` VALUES (470, 1, '第二次世界大战之后所形成的世界政治格局是', 1, 'peadmin', '', '&lt;p&gt;A. 以欧洲大国均势为中心的政治格局&lt;/p&gt;&lt;p&gt;B. 美苏两极政治格局&lt;/p&gt;&lt;p&gt;C. 美国为主的单极格局&lt;/p&gt;&lt;p&gt;D. 呈多极化的政治格局&lt;/p&gt;', 4, 'B', '抗日战争胜利后，国际格局发生了新的重大变化。其表现之一是：逐步 打破了以维持欧洲大国均势为中心的传统国际政治格局，形成了美两极的政治格局。并在此基础上，逐步 形成了分别以美、苏为首的帝国主义和社会主义两个阵营的对立。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"20\";s:5:\"knows\";s:52:\"第一节 从争取和平民主到进行自卫战争\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (471, 1, '抗日战争胜利后，国民党坚持的方针是', 1, 'peadmin', '', '&lt;p&gt;A. 独裁、内战&lt;/p&gt;&lt;p&gt;B. 民主、和平&lt;/p&gt;&lt;p&gt;C. 与中共坦诚合作  &lt;/p&gt;&lt;p&gt;D. 建立联合政府&lt;/p&gt;', 4, 'A', '抗日战争胜利后，国际格局发生了重大变化，国内形势错综复杂，国民党统治集团坚持独裁、内战的方针；中国共产党为争取和平、民主而艰苦努力，同时做好进行自卫战争的各项准备。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"20\";s:5:\"knows\";s:52:\"第一节 从争取和平民主到进行自卫战争\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (472, 1, '重庆谈判期间，中共中央正式确定的战略方针是', 1, 'peadmin', '', '&lt;p&gt;A. “让开大路，占领两厢”&lt;/p&gt;&lt;p&gt;B. “向南发展，向北防御”&lt;/p&gt;&lt;p&gt;C. “争取和平民主”&lt;/p&gt;&lt;p&gt;D. “向北发展，向南防御”&lt;/p&gt;', 4, 'D', '1945年9月19日，重庆谈判期间，中共中央为制止内战，正式确定“向北发展，向南 防御”的战略方针，以集中力量争取控制东北地区。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"20\";s:5:\"knows\";s:52:\"第一节 从争取和平民主到进行自卫战争\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (473, 1, '标志和谈之门被国民党全部关闭、国共关系彻底破裂的是', 1, 'peadmin', '', '&lt;p&gt;A. 校场口惨案&lt;/p&gt;&lt;p&gt;B. 下关惨案&lt;/p&gt;&lt;p&gt;C. 国民党军大举围攻中原解放区&lt;/p&gt;&lt;p&gt;D. 国民党逐出中共驻南京、上海、重庆三地代表及工作人员&lt;/p&gt;', 4, 'D', '1947年2月下旬，国民党当局限期令中共驻南京、上海、重庆三地代表及其工作人员全部撤退。这个事件标志着和谈之门被国民党全部关闭，国共关系彻底破裂。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"20\";s:5:\"knows\";s:52:\"第一节 从争取和平民主到进行自卫战争\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (474, 1, '1946年6月至1947年6月，人民军队处于    阶段。', 1, 'peadmin', '', '&lt;p&gt;A. 战略进攻&lt;/p&gt;&lt;p&gt;B. 战略相持&lt;/p&gt;&lt;p&gt;C. 战略决战&lt;/p&gt;&lt;p&gt;D. 战略防御&lt;/p&gt;', 4, 'D', '1946年6月至1947年6月，人民军队处于战略防御阶段。1947年6月，人民解放战争进入战略进攻阶段，解放区迅速扩大。中国共产党在解放区广泛开展土地改革运动。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"21\";s:5:\"knows\";s:49:\"第二节 国民党政府处在全民的包围中\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (475, 1, '毛泽东指出：“人民解放军转入全面反攻，这是一个历史的转折点。这是蒋介石二十年反革命统治由发展到消灭的转折点，这一百多年来帝国主义在中国的统治由发展到消灭的转折点。”提出这一观点的文献是', 1, 'peadmin', '', '&lt;p&gt;A. 《论人民民主专政》&lt;/p&gt;&lt;p&gt;B. 《目前形势和我们的任务》&lt;/p&gt;&lt;p&gt;C. 《对目前时局的宣言》&lt;/p&gt;&lt;p&gt;D. 《新民主主义论》&lt;/p&gt;', 4, 'B', '1947年12月，中共中央在陕北米脂县杨家沟召开会议，毛泽东在《目前形势和我们的任务》的报告中指出，人民解放军转入全面反攻，这是一个历史的转折点。这是蒋介石二十年反革命统治由发展到消灭的转折点，这是一百多年来帝国主义在中国的统治由发展到消灭的转折点。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"21\";s:5:\"knows\";s:49:\"第二节 国民党政府处在全民的包围中\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (476, 1, '中国共产党在新民主主义革命阶段的总路线和总政策是', 1, 'peadmin', '', '&lt;p&gt;A. 无产阶级领导的，人民大众的，反对帝国主义、封建主义和殖民主义的革命&lt;/p&gt;&lt;p&gt;B. 无产阶级领导的，人民大众的，反对帝国主义、封建主义和官僚资本主义的革命&lt;/p&gt;&lt;p&gt;C. 无产阶级领导的，联合各阶级的，反对帝国主义、封建主义和官僚资本主义的革命&lt;/p&gt;&lt;p&gt;D. 无产阶级领导的，工农群众为主体的，反对帝国主义、封建主义和官僚资本主义的革命&lt;/p&gt;', 4, 'B', '毛泽东于1948 年4月在晋绥干部会议上的讲话中完整地提出，无产阶级领导的，人民大众的，反对帝国主义、封建主义和官僚资本主义的革命，这就是中国的新民主主义 革命，这就是中国共产党在新民主主义革命阶段的总路线和总政策。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"21\";s:5:\"knows\";s:49:\"第二节 国民党政府处在全民的包围中\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (477, 1, '下列运动中不是以学生为主力的是', 1, 'peadmin', '', '&lt;p&gt;A. —二·一运动&lt;/p&gt;&lt;p&gt;B. 一二·三0运动&lt;/p&gt;&lt;p&gt;C. 反饥饿、反内战、挽救教育危机联合大游行&lt;/p&gt;&lt;p&gt;D. 二·二八起 义&lt;/p&gt;', 4, 'D', '一二·一”运动，“一二·三0运动”，以及反饥饿、反内战、挽救教育危机联合大游行都是以学生为主力的运动，只有D 项“二·二八”起义是以台湾省台北市人民为主力的运动。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"21\";s:5:\"knows\";s:49:\"第二节 国民党政府处在全民的包围中\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (478, 1, '吹响了国统区爱国学生运动的第一号角并在全国范围产生了重大影响的是', 1, 'peadmin', '', '&lt;p&gt;A. 抗暴运动&lt;/p&gt;&lt;p&gt;B. “一二，一”运动&lt;/p&gt;&lt;p&gt;C. “反饥饿、反内战、反迫害”运动&lt;/p&gt;&lt;p&gt;D. “五·二O”运动&lt;/p&gt;', 4, 'B', '国统区人民所进行的第二条战线的斗争，以学生运动为发端。1945年发生在昆明的“一二·一”运动，以“反对内战，争取自由”为基本口号，吹响了国统区爱国学生运动的第一声号角，在全国范围内产生了重大影响。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"21\";s:5:\"knows\";s:49:\"第二节 国民党政府处在全民的包围中\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (479, 1, '国统区人民所进行的第二条战线的斗争，以', 1, 'peadmin', '', '&lt;p&gt;A. 工人运动为发端&lt;/p&gt;&lt;p&gt;B. 农民运动为发端&lt;/p&gt;&lt;p&gt;C. 学生运动为发端&lt;/p&gt;&lt;p&gt;D. 城镇贫民运动为发端&lt;/p&gt;', 4, 'C', '国统区人民所进行的第二条战线的斗争，以学生运动为发端。答 案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"21\";s:5:\"knows\";s:49:\"第二节 国民党政府处在全民的包围中\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (480, 1, '1941年3月在重庆参加秘密成立的中国民主政团同盟的构成组织不包括', 1, 'peadmin', '', '&lt;p&gt;A. 农工党&lt;/p&gt;&lt;p&gt;B. 中华职业教育社&lt;/p&gt;&lt;p&gt;C. 青年党&lt;/p&gt;&lt;p&gt;D. 乡村建设协会&lt;/p&gt;', 4, 'A', '中国民主同盟（简称民盟），1941年 3月19日在重庆秘密成立，时称中国民主政团同盟。民盟由 6个组织联合组成。它们是：全国各界救国联合会、中华职业教育社、乡 村建设协会、中华民族解放行动委员会（前身为中国国民党 临时行动委员会，亦称第三党）、青 年 党、国家社会党。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"21\";s:5:\"knows\";s:49:\"第二节 国民党政府处在全民的包围中\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (481, 1, '1947年“二·二八”起义发生在', 1, 'peadmin', '', '&lt;p&gt;A. 上海&lt;/p&gt;&lt;p&gt;B. 南京&lt;/p&gt;&lt;p&gt;C. 香港&lt;/p&gt;&lt;p&gt;D. 台湾&lt;/p&gt;', 4, 'D', '“二·二八”起 义发生于1947年2月28日，是台湾省台北市人民为反抗国民党当局的暴政、抗议反动军警屠杀市民，举行的大规模示威游行运动，这次运动遭到了国民党军警的镇压。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"21\";s:5:\"knows\";s:49:\"第二节 国民党政府处在全民的包围中\";}}', 1532691021, 1, '', 0, 0, 3, '', 0);
INSERT INTO `x2_questions` VALUES (482, 1, '1947年5月1日，内蒙古自治政府成立，政府主席是', 1, 'peadmin', '', '&lt;p&gt;A. 林伯渠&lt;/p&gt;&lt;p&gt;B. 乌兰夫&lt;/p&gt;&lt;p&gt;C. 董必武&lt;/p&gt;&lt;p&gt;D. 李鼎铭&lt;/p&gt;', 4, 'B', '1947年初，内蒙古东部大部和中部部分地区获得解放。同年4月，内蒙古人民代表会议在乌兰浩特举行，通过《内蒙古自治政府施政纲领》等文件。5月1日，内蒙古自治政府宣告成立，乌兰夫为主席。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"21\";s:5:\"knows\";s:49:\"第二节 国民党政府处在全民的包围中\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (483, 1, '1948年1月1日，中国国民党革命委会在    成立。', 1, 'peadmin', '', '&lt;p&gt;A. 香港&lt;/p&gt;&lt;p&gt;B. 澳门&lt;/p&gt;&lt;p&gt;C. 广州&lt;/p&gt;&lt;p&gt;D. 上海&lt;/p&gt;', 4, 'A', '1947 年 11月，中国国民党民主派和其他爱国民主人士在香港举行第一次联合会议。1948 年 1月1日，会议宣布正式成立中国国民党 革命委员会。宋庆龄任名誉主席，李济深任主席。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"21\";s:5:\"knows\";s:49:\"第二节 国民党政府处在全民的包围中\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (484, 1, '辽沈战役的主要领导人是', 1, 'peadmin', '', '&lt;p&gt;A. 邓小平、刘伯承  &lt;/p&gt;&lt;p&gt;B. 朱德、彭德怀&lt;/p&gt;&lt;p&gt;C. 林彪、罗荣桓&lt;/p&gt;&lt;p&gt;D. 陈毅、粟裕&lt;/p&gt;', 4, 'C', '在毛泽东和中共中央军委的领导和指挥下，在人民群众的热烈支援下，中国人民解放军先后发动了辽沈、淮海、平津三大战役。其中，辽沈战役自1948年9月12日开始至11月2日结束，主要领导人是林彪、罗 荣桓。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"22\";s:5:\"knows\";s:58:\"第三节 人民共和国：中国人民的历史性选择\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (485, 1, '毛泽东为新华社写的1949年新年献词是', 1, 'peadmin', '', '&lt;p&gt;A. 《论人民民主专政》&lt;/p&gt;&lt;p&gt;B. 《将革命进行到底》&lt;/p&gt;&lt;p&gt;C. 《丢掉幻想，准备斗争》&lt;/p&gt;&lt;p&gt;D. 《唯心历史观的破产》&lt;/p&gt;', 4, 'B', '毛泽东在为新华社写的1949 年新年献词《将革命进行到底》一文指出，必须将革命进行到底，用革命的方法，坚决彻底干净全部地消灭一切反动势力，在全国范围内推翻国民党的反动统治，建立无产阶级领导的以工农联盟为主体的人民民主专政的共和国。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"22\";s:5:\"knows\";s:58:\"第三节 人民共和国：中国人民的历史性选择\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (486, 1, '规定在少数民族聚居地区实行民族区域自治的文件是', 1, 'peadmin', '', '&lt;p&gt;A. 1949 年的《共同纲领》&lt;/p&gt;&lt;p&gt;B. 《中华人民共和国民族区域自治实施纲要》&lt;/p&gt;&lt;p&gt;C. 《中华人民共和国宪法》&lt;/p&gt;&lt;p&gt;D. 《论联合政府》&lt;/p&gt;', 4, 'A', '1949年的《共同纲领》规定：“中华人民共和国境内各民族一律平 等”。“各少数民族聚 居的地区，应实行民族区域自治”。“各少数民族均有发展其语言文字、保持或改革其风俗习惯及宗教信仰的自由。人民政府应帮助各少数民族的人民大众发展其政治、经济、文化、教育的建设事业”，“使中华人民共和国成为各民族友爱合作的大家庭”。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"22\";s:5:\"knows\";s:58:\"第三节 人民共和国：中国人民的历史性选择\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (487, 1, '构成《中国人民政治协商会议共同纲领》基础的是', 1, 'peadmin', '', '&lt;p&gt;A. 毛泽东的《新民主主义论》和《论人民民主专政》&lt;/p&gt;&lt;p&gt;B. 中共七届二中全会的规定和毛泽东的《论人民民主专政》&lt;/p&gt;&lt;p&gt;C. 中共七届二中全会的规定和毛泽东的《新民主主义论》&lt;/p&gt;&lt;p&gt;D. 中共七大党章和中共七届二中全会的规定&lt;/p&gt;', 4, 'B', '1949年6月30日，毛泽东发表《论人民民主专政》一文，系统地阐明了中国共产党关于建立人民民主专政的新中国的主张，这篇文章与中共七届二中全会的规定共同构成了后来的《中国人民政治协商会议共同纲领》的基础。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"22\";s:5:\"knows\";s:58:\"第三节 人民共和国：中国人民的历史性选择\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (488, 1, '毛泽东向全世界宣告：“占人类总数四分之一的中国人从此站立起来了”，是在', 1, 'peadmin', '', '&lt;p&gt;A. 中华人民共和国开国大典上&lt;/p&gt;&lt;p&gt;B. 国人民政治协商会议第一届 全体会议开幕词中&lt;/p&gt;&lt;p&gt;C. 《论人民民主专政》中&lt;/p&gt;&lt;p&gt;D. 中国人民政治协商会议第一届全体会议．闭幕词中&lt;/p&gt;', 4, 'B', '1949年9月21日，中国人民政治协商会议第一届全体会议隆重开幕。新政协筹备会主任、中共中央主席毛泽东在开幕词中向全世界庄严地宣告：“我们的工作将写在人类的历史上，它将表明：占人类总数四分之一的中国人从此站立起 来了”。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"22\";s:5:\"knows\";s:58:\"第三节 人民共和国：中国人民的历史性选择\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (489, 1, '下列关于中国人民政治协商会议第一届全体会议的说法，不正确的是', 1, 'peadmin', '', '&lt;p&gt;A. 一致同意以新民主主义 即人民民主主义为中华人民共和国的政治基础&lt;/p&gt;&lt;p&gt;B. 通过了《中国人民政治协商会议共同纲领》&lt;/p&gt;&lt;p&gt;C. 通过了中央人民政府组织法&lt;/p&gt;&lt;p&gt;D. 制定了第一部正式宪法&lt;/p&gt;', 4, 'D', 'A、B、C三项都是关于中国人民政治协商会议第一届全体会议的正确说法。在当时的情况下，会议通过的《中国人民政治协商会议共同纲领》起着临时宪法的作用，而不是正式宪法。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"22\";s:5:\"knows\";s:58:\"第三节 人民共和国：中国人民的历史性选择\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (490, 1, '《中国人民政治协商会议共同纲领》最基本、最核心的内容是', 1, 'peadmin', '', '&lt;p&gt;A. 关于新中国的国体和政体的规定&lt;/p&gt;&lt;p&gt;B. 关于新中国的基本的民族政策的规定&lt;/p&gt;&lt;p&gt;C. 关于新中国的经济工作方针的规定&lt;/p&gt;&lt;p&gt;D. 关于新中国的外交工作原则的规定&lt;/p&gt;', 4, 'A', '关于新中国的国体和政体的规定，是《中国人民政治协商会议共同纲领》最基本、最核心的内容。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"22\";s:5:\"knows\";s:58:\"第三节 人民共和国：中国人民的历史性选择\";}}', 1532691021, 1, '', 0, 0, 3, '', 0);
INSERT INTO `x2_questions` VALUES (491, 1, '被誉为中国人民的大宪章、起着临时宪法作用的是', 1, 'peadmin', '', '&lt;p&gt;A. 《论人民民主专政》&lt;/p&gt;&lt;p&gt;B. 《中国人民政治协商会议共同纲领》&lt;/p&gt;&lt;p&gt;C. 《中国人民政治协商会议组织法》&lt;/p&gt;&lt;p&gt;D. 《新民主主义论》&lt;/p&gt;', 4, 'B', '中国人民政治协商会议第一届全体会议一致同意以新民主主义即人民民主主义为中华人民共和国的政治基础，并通过了《中国人民政治协商会议共同纲领》。在当时的情况下，《中国人民政治协商会议共同纲领》起着临时宪法的作用。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"22\";s:5:\"knows\";s:58:\"第三节 人民共和国：中国人民的历史性选择\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (492, 1, '1949年政协会议上选举的中央人民政府主席是', 1, 'peadmin', '', '&lt;p&gt;A. 朱德&lt;/p&gt;&lt;p&gt;B. 周恩来&lt;/p&gt;&lt;p&gt;C. 毛泽东&lt;/p&gt;&lt;p&gt;D. 刘少奇&lt;/p&gt;', 4, 'C', '1949年政协会议通过了中央人民政府组织法，毛泽东被选举为中央人民政府主席，朱德、刘少奇、宋庆龄、李 济深、张澜、高岗为副主席，陈毅等 56人为中央人民政府委员。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"22\";s:5:\"knows\";s:58:\"第三节 人民共和国：中国人民的历史性选择\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (493, 1, '中国民主革命的主要力量是', 1, 'peadmin', '', '&lt;p&gt;A. 工人阶级、农民阶级、民族资产阶级&lt;/p&gt;&lt;p&gt;B. 学生、民族资产阶级&lt;/p&gt;&lt;p&gt;C. 工人、农民、城市小资产阶级群众&lt;/p&gt;&lt;p&gt;D. 民主党派&lt;/p&gt;', 4, 'C', '工人、农民、城市小资产阶级群众是民主革命的主要力量。在他们中间，涌现出无数无畏的英雄和不屈的战士。随着斗争的发展，民族资产阶级也逐步向共产党靠拢，成为一股重要的革命力量。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"22\";s:5:\"knows\";s:58:\"第三节 人民共和国：中国人民的历史性选择\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (494, 1, '统一战线中存在的两个联盟中，基本的、主要的是', 1, 'peadmin', '', '&lt;p&gt;A. 劳动者与非劳动者的联盟&lt;/p&gt;&lt;p&gt;B. 劳动者与民族资产阶级的联盟&lt;/p&gt;&lt;p&gt;C. 劳动者的联盟&lt;/p&gt;&lt;p&gt;D. 与一部分大资产阶级的暂时的联盟&lt;/p&gt;', 4, 'C', '统一战线中存在着两个联盟：一个是劳动者的联盟，这是基本的、主要的；另外一个是劳动者与非劳动者的联盟，这是辅助的、同时也是重要的。必须坚决依靠第一个联盟，争取建立和扩大第二个联盟。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"22\";s:5:\"knows\";s:58:\"第三节 人民共和国：中国人民的历史性选择\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (495, 1, '近代中国半殖民地半封建的社会性质决定了中国革命的主要形式是&amp;nbsp;', 1, 'peadmin', '', '&lt;p&gt;A. 争取民主&lt;/p&gt;&lt;p&gt;B. 农民运动&lt;/p&gt;&lt;p&gt;C. 武装斗争&lt;/p&gt;&lt;p&gt;D. 工人运动&lt;/p&gt;', 4, 'C', '近代中国半殖民地半封建的社会性质，决定了中国革命只能以长期的武装斗争作为主要形式。  离开了武装斗争，就没有共产党的地位，也就不能完成任何革命任务。中国的武装斗争实质上是工人阶级领导的农民战争。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"22\";s:5:\"knows\";s:58:\"第三节 人民共和国：中国人民的历史性选择\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (496, 1, '中国革命武装斗争的实质是工人阶级领导下的', 1, 'peadmin', '', '&lt;p&gt;A. 政治革命&lt;/p&gt;&lt;p&gt;B. 土地革命&lt;/p&gt;&lt;p&gt;C. 农民战争&lt;/p&gt;&lt;p&gt;D. 群众运动&lt;/p&gt;', 4, 'C', '中国的武装斗争实质上是工人阶级领导的农民战争。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"22\";s:5:\"knows\";s:58:\"第三节 人民共和国：中国人民的历史性选择\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (497, 1, '中国共产党党内斗争的方针是', 1, 'peadmin', '', '&lt;p&gt;A. 批评与自我批评&lt;/p&gt;&lt;p&gt;B. 惩前毖后，治病救人&lt;/p&gt;&lt;p&gt;C. 坦白从宽，抗拒从严&lt;/p&gt;&lt;p&gt;D. 严厉打击犯错误的人&lt;/p&gt;', 4, 'B', '加强共产党自身的建设，首先着重加强党的思想建设，用工人阶级思想克服资产阶级、小资产阶级思想；培育和发扬理论与实际相结合、密切联系群众和自我批评的作风；在党内斗争中实行“惩前毖后，治病救人”的方针；并创造在全党通过批评与自我批评进行马克思主义思想教育的整风形式等。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"22\";s:5:\"knows\";s:58:\"第三节 人民共和国：中国人民的历史性选择\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (498, 1, '标志着近代以来中国争取民族独立和人民解放的历史任务基本完成的是', 1, 'peadmin', '', '&lt;p&gt;A. 抗日战争取得胜利&lt;/p&gt;&lt;p&gt;B. 打败国民党反动派&lt;/p&gt;&lt;p&gt;C. 人民民主专政的新中国的创建&lt;/p&gt;&lt;p&gt;D. 中共七届二中全会胜利召开&lt;/p&gt;', 4, 'C', '人民民主专政的新中国的创建，标志着近代以来中国面 临的争取民族独立、人民解放这个历史任务的基本完成，从而为中国人民集中力量进行建设，以实现国家繁 荣富强和人民共同富裕，创造了前提，开辟了道路。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"22\";s:5:\"knows\";s:58:\"第三节 人民共和国：中国人民的历史性选择\";}}', 1532691021, 1, '', 0, 0, 3, '', 0);
INSERT INTO `x2_questions` VALUES (499, 1, '新中国成立初期，指导新解放区农村土地改革运动的文件是', 1, 'peadmin', '', '&lt;p&gt;A. 《中国人民政治协商会议共同纲领》&lt;/p&gt;&lt;p&gt;B. 《中华人民共和国土地改革法》&lt;/p&gt;&lt;p&gt;C. 《中国土地法大纲》&lt;/p&gt;&lt;p&gt;D. 《中华人民共和国宪法》&lt;/p&gt;', 4, 'B', '1950年6月中央人民政府颁布《中华人民共和国土地改革法》，新解放区农村掀起了轰轰烈烈的土地改革运动。答为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (500, 1, '中国西藏和平解放的时间是', 1, 'peadmin', '', '&lt;p&gt;A. 1948 年 10月 &lt;/p&gt;&lt;p&gt;B. 1949 年 10月&lt;/p&gt;&lt;p&gt;C. 1950 年 10月  &lt;/p&gt;&lt;p&gt;D. 1951 年 10月&lt;/p&gt;', 4, 'D', '1951年10月，人民解放军进驻拉萨，西藏和平解放。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (501, 1, '随着祖国大陆的解放，执政的中国共产党在各新解放地区，迅即建立起    作为过渡性的临时政权。', 1, 'peadmin', '', '&lt;p&gt;A. 军事管制委员会  &lt;/p&gt;&lt;p&gt;B. 政治管制委员会&lt;/p&gt;&lt;p&gt;C. 军政民主政权   &lt;/p&gt;&lt;p&gt;D. 人民专政委员会&lt;/p&gt;', 4, 'A', '随着祖国大陆的解放，中国共产党在各新解放地区，迅即建立起军事管制委员会，作为过渡性的临时政权，其职能为接管旧政权机关，镇压反革命的破坏活动，维护社会秩序，恢复和发展生产，帮助召集各界人民代表会议，选举地方人民政权。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (502, 1, '1951年8月中央人民政府公布实施    ，对自治区的建立、自治机关、自治权利、区内民族关系等作了系统规定。', 1, 'peadmin', '', '&lt;p&gt;A. 中华人民共和国民族区域自治实施纲要》&lt;/p&gt;&lt;p&gt;B. 《和平解放西藏办法的协议》&lt;/p&gt;&lt;p&gt;C. 《中华人民共和国民族区域自治法》&lt;/p&gt;&lt;p&gt;D. 《中华人民共和国民族政策纲领》&lt;/p&gt;', 4, 'A', '《共同纲领》规定，在少数民族聚居地区实行民族区域自治，成立民族区域自治机关。19 51 年 8月，中央人民政府公布实施《中华人民共和国民族区域自治实施纲要》，对自治区的建立、自治机关、自治权利、区內民族关系等作了系统规定。  答 案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (503, 1, '祖国大陆基本解放和各族人民实现统一的标志是', 1, 'peadmin', '', '&lt;p&gt;A. 1950 年剿匪的完成&lt;/p&gt;&lt;p&gt;B. 1950 年国民党残余力量的消灭&lt;/p&gt;&lt;p&gt;C. 1951 年西藏的和平解放&lt;/p&gt;&lt;p&gt;D. 1951 年民族区域自治纲领的颁布实施&lt;/p&gt;', 4, 'C', '1951年5月，中央人民政府同西藏地方政府达成了关于和平解放西藏办法的协议。10月，人民解放军进驻拉萨，西藏得以和平解放。至此，除台湾和少数 海岛以外的全部中国领土得到解放，中国大陆实现了统一。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (504, 1, '新中国成立后颁布的土地法是', 1, 'peadmin', '', '&lt;p&gt;A. 《中华人民共和国土地改革法》&lt;/p&gt;&lt;p&gt;B. 《中华人民共和国土地分法》&lt;/p&gt;&lt;p&gt;C. 《中国土地法大纲》&lt;/p&gt;&lt;p&gt;D. 《中华人民共和国土地法大纲》&lt;/p&gt;', 4, 'A', '1950 年 6月，中央人民政府颁布了《中华人民共和国土地 改 革法》，新解放区农村掀起了轰 轰烈烈的土地 改革运动，这是1949 年新中国成立后颁布的土地法。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (505, 1, '新中国成立初期开展的镇压反革命运动的政策是', 1, 'peadmin', '', '&lt;p&gt;A. 坦白从宽，抗拒从严&lt;/p&gt;&lt;p&gt;B. 镇压与宽大相结合&lt;/p&gt;&lt;p&gt;C. 惩前毖后，治病救人&lt;/p&gt;&lt;p&gt;D. 知无不言，言者无罪&lt;/p&gt;', 4, 'B', '新中国成立初期，开展了镇压反革命运动，在运动中贯彻了“镇压与宽大相结合”的政策，赢得了人民的拥护。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (506, 1, '1950年3月，政务院颁布   ，对全国财政收支、贸易和物资调度及现金实行集中和统一的管理。', 1, 'peadmin', '', '&lt;p&gt;A. 《关于统一全国金融工作的决定》&lt;/p&gt;&lt;p&gt;B. 《关于统一全国财政经济工作的决定》&lt;/p&gt;&lt;p&gt;C. 《关于统一全国物资调度工作的决定》&lt;/p&gt;&lt;p&gt;D. 《关于统一全国贸易工作的决定》&lt;/p&gt;', 4, 'B', '1950年3月，政务院颁布了《关于统一全国财政经济工作的决定》，对全国的财政收支、贸易和物 资调度及现金实行集中和统一的管理。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 3, '', 0);
INSERT INTO `x2_questions` VALUES (507, 1, '1950年2月，中国政府与苏联政府签订', 1, 'peadmin', '', '&lt;p&gt;A. 《中苏友好同盟条约》&lt;/p&gt;&lt;p&gt;B. 《中苏友好条约》&lt;/p&gt;&lt;p&gt;C. 《中苏友好同盟互助条约》&lt;/p&gt;&lt;p&gt;D. 《中苏同盟条约》&lt;/p&gt;', 4, 'C', '1949年12月，毛泽东访问苏联，1950年2月，中国政府与苏联政府签订《中苏友好同盟互助条约》。中苏结成友好同盟，这对新中国是很重要的国际支持。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (508, 1, '朝鲜停战协定签订于', 1, 'peadmin', '', '&lt;p&gt;A. 1953 年 7月&lt;/p&gt;&lt;p&gt;B. 1953 年 8月&lt;/p&gt;&lt;p&gt;C. 1954 年 3月&lt;/p&gt;&lt;p&gt;D. 1955 年 6月&lt;/p&gt;', 4, 'A', '中朝两国人民及其军队经过近三年的艰苦作战和谈判斗争，终于迫使美国代表于1953 年 7月27日在停战协定上签字。抗美援朝战争的胜利，打破了美国军队不可战胜的神话。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (509, 1, '中国军队参加抗美援朝战争的最重要原因是', 1, 'peadmin', '', '&lt;p&gt;A. 朝鲜位置对中国十分重要&lt;/p&gt;&lt;p&gt;B. 打击美帝国主义的侵略气焰&lt;/p&gt;&lt;p&gt;C. 巩固社会主义阵营的需要&lt;/p&gt;&lt;p&gt;D. 美国侵略军严重威胁到中国安全&lt;/p&gt;', 4, 'D', '朝鲜战争爆发后，美国宣布武装援助南朝鲜，同时将其 海军第七舰队开进台湾海峡，公然 干涉中国内政，侵占中国领土台湾，并将朝鲜战争的战火烧到中朝交界鸭绿江边，严重威胁中国安全，因此中国政府毅然作出抗美援朝、保家卫国的决策。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (510, 1, '1950年1月，同新中国建交的欧洲家不包括', 1, 'peadmin', '', '&lt;p&gt;A. 保加利亚&lt;/p&gt;&lt;p&gt;B. 罗 马尼亚&lt;/p&gt;&lt;p&gt;C. 波兰&lt;/p&gt;&lt;p&gt;D. 越南&lt;/p&gt;', 4, 'D', '至1950 年 1月，同中国建交的国家有保加利亚、罗 马尼亚、匈牙利、朝鲜民主主义人民共和国、捷克斯洛伐克、德意志民主共和国、阿尔巴尼亚、波兰、蒙古、越南等。越南属于亚洲国家。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"23\";s:5:\"knows\";s:88:\"第一节 《共同纲领》的全面实施与新民主主义革命任务的胜利完成\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (511, 1, '新民主主义革命过程中形成和发展起来的新民主主义政治、经济、文化，都是由工人阶级领导的，因而都具有', 1, 'peadmin', '', '&lt;p&gt;A. 民主主义因素&lt;/p&gt;&lt;p&gt;B. 资本主义因素&lt;/p&gt;&lt;p&gt;C. 新民主主义因素&lt;/p&gt;&lt;p&gt;D. 社会主义因素&lt;/p&gt;', 4, 'D', '新民主主义革命过程中形成和发展起来的新民主主义政治、经济、文化，都是由工人阶级领导的，因而都具有社会主义因素。如中国共产党的政治领导、社会主义国营经济的领导地位、马克思主义在思想文化领域中的指导地位等因素的增长，为新民主主义革命胜利以后向社会主义 转变创造必要的条件。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"24\";s:5:\"knows\";s:37:\"第二节 制定过渡时期总路线\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (512, 1, '中国共产党领导的革命所包含的两个阶段是', 1, 'peadmin', '', '&lt;p&gt;A. 旧民主主义革命和新民主主义革命&lt;/p&gt;&lt;p&gt;B. 反帝国主义革命和反封建主义革命&lt;/p&gt;&lt;p&gt;C. 社会主义革命和共产主义革命&lt;/p&gt;&lt;p&gt;D. 新民主主义革命和社会主义革命&lt;/p&gt;', 4, 'D', '中国共产党领导的革命，包括新民主主义革命和社会主义革命两个阶段。开展新民主主义 革命的目的，是要建立以中国无产阶级为首领的中国各个革命阶级联合专政的新民主主义社会；然后，再使之发展至第二阶段，以建立中国社会主义社会。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"24\";s:5:\"knows\";s:37:\"第二节 制定过渡时期总路线\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (513, 1, '1949年3月，中共七届二中全会的决议指出，全国胜利并解决了土地问题后，中国社会经济中存在着五种成分，其中主要的三种是社会主义经济、个体经济和', 1, 'peadmin', '', '&lt;p&gt;A. 合作社经济&lt;/p&gt;&lt;p&gt;B. 私人资本主义经济&lt;/p&gt;&lt;p&gt;C. 国家资本主义经济&lt;/p&gt;&lt;p&gt;D. 自然经济&lt;/p&gt;', 4, 'B', '全国胜利并解决了土地问题以后，中国社会经济中存在着五种成分。其中，半社会主义性质的合作社经济是个体经济向社会主义集体经济过渡的形式，国家资本主义经济是私人资本主义经济向国营经济过渡的形式。所以，主要的经济成分是三种，即社会主义经济、个体经济和私人资本主义经济。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"24\";s:5:\"knows\";s:37:\"第二节 制定过渡时期总路线\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (514, 1, '下列选项中，不属于新民主主义向社会主义转变的必要条件的是', 1, 'peadmin', '', '&lt;p&gt;A. 中国共产党的政治领导&lt;/p&gt;&lt;p&gt;B. 社会主义国营经济的领导地位&lt;/p&gt;&lt;p&gt;C. 马克思主义在思想文化领域的指导地位&lt;/p&gt;&lt;p&gt;D. 社会主义工业化的实现&lt;/p&gt;', 4, 'D', '中国共产党的政治领导、社会主义国营经济的领导地位、马克思主义在思想文化领域的指导地位等。这些因素的增长，为新民主主义革命胜利以后向社会主义转变创造了必要条件。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"24\";s:5:\"knows\";s:37:\"第二节 制定过渡时期总路线\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (515, 1, '新民主主义社会的两种基本矛盾是指', 1, 'peadmin', '', '&lt;p&gt;A. 工人阶级和资产阶级的矛盾，新中国同帝国主义的矛盾&lt;/p&gt;&lt;p&gt;B. 人民大众与封建主义的矛盾，中国人民与帝国主义的矛盾&lt;/p&gt;&lt;p&gt;C. 无产阶级与资产阶级的矛盾，社会主义与资本主义的矛盾&lt;/p&gt;&lt;p&gt;D. 无产阶级与资产阶级的矛盾，无产阶级与封建残余势力的矛盾&lt;/p&gt;', 4, 'A', '1949年3月，中共七届二中全会决议分析了新民主主义社会的经济状况和基本矛盾，指出中国仍存在着两种基本的矛盾：国际上是新中国同帝国主义的矛盾，国内是工人阶级和资产阶级的矛盾。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"24\";s:5:\"knows\";s:37:\"第二节 制定过渡时期总路线\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (516, 1, '下面关于新民主主义社会的观点错误的是', 1, 'peadmin', '', '&lt;p&gt;A. 独立的社会形态&lt;/p&gt;&lt;p&gt;B. 具有过渡性&lt;/p&gt;&lt;p&gt;C. 具有社会主义因素&lt;/p&gt;&lt;p&gt;D. 有资本主义因素&lt;/p&gt;', 4, 'A', '新民主主义社会不是一个凝固不变的、独立的社会形态。新民主主义社会在经济上的特点，就是既有社会主义因素，又有资本主义因素。它本身具有过渡性，处在深刻变动中。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"24\";s:5:\"knows\";s:37:\"第二节 制定过渡时期总路线\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (517, 1, '对农业进行社会主义改造的途径是', 1, 'peadmin', '', '&lt;p&gt;A. 公私合营&lt;/p&gt;&lt;p&gt;B. 合作化&lt;/p&gt;&lt;p&gt;C. 国家资本主义&lt;/p&gt;&lt;p&gt;D. 和平赎买&lt;/p&gt;', 4, 'B', '中国共产党对农业进行社会主义改造的指导方针是开展合作化运动，实践证明，这项指导方针是正确的，并由此开创了一条有中国特点的农业合作化道路。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"25\";s:5:\"knows\";s:46:\"第三节 开辟中国社会主义改造道路\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (518, 1, '高级农业生产合作社的分配原则是', 1, 'peadmin', '', '&lt;p&gt;A. 平均分配&lt;/p&gt;&lt;p&gt;B. 按需分配&lt;/p&gt;&lt;p&gt;C. 各尽所能，按劳分配&lt;/p&gt;&lt;p&gt;D. 统一配给&lt;/p&gt;', 4, 'C', '高级农业生产合作社的具体内容及特点包括：将土地及其他主要生产资料归集体所有，统一经营、集体劳动，实行各尽所能、按劳分配的原则，这具有社会主义的性质。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"25\";s:5:\"knows\";s:46:\"第三节 开辟中国社会主义改造道路\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (519, 1, '农业社会主义改造坚持的原则是', 1, 'peadmin', '', '&lt;p&gt;A. 积极发展&lt;/p&gt;&lt;p&gt;B. 稳步前进&lt;/p&gt;&lt;p&gt;C. 自愿、互利&lt;/p&gt;&lt;p&gt;D. 逐步过渡&lt;/p&gt;', 4, 'C', '对农业进行社会主义改造，推动农业互助合作的发展，要坚持自愿和互利的原则，采取典型示范、逐步推广的方法，发展一批，巩固一批。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"25\";s:5:\"knows\";s:46:\"第三节 开辟中国社会主义改造道路\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (520, 1, '新中国成立初期，着重发展的是   等初级形式的国家资本主义。', 1, 'peadmin', '', '&lt;p&gt;A. 加工订货、经销代销&lt;/p&gt;&lt;p&gt;B. 参与入股、共同经营&lt;/p&gt;&lt;p&gt;C. 个别企业公私合营&lt;/p&gt;&lt;p&gt;D. 全行业公私合营&lt;/p&gt;', 4, 'A', '新中国成立初期，着重发展加工订货、经销代销等初级形式的国家资本主义。1954 年提出的《关于有步骤地将有十个工人以上的资本主义工业基本上改造成为公私合营企业的意见》，使高级形式的国家资本主义进一步发展起来。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"25\";s:5:\"knows\";s:46:\"第三节 开辟中国社会主义改造道路\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (521, 1, '改造资本主义工商业和逐步完成社会主义过渡的必经之路是', 1, 'peadmin', '', '&lt;p&gt;A. 革命&lt;/p&gt;&lt;p&gt;B. 国家资本主义&lt;/p&gt;&lt;p&gt;C. 个人私有制&lt;/p&gt;&lt;p&gt;D. 对民族资本的赎买&lt;/p&gt;', 4, 'B', '1953 年2月，毛泽东提出：“对民族资产阶级，可以采取赎买的办法。”同年9月，他明确指出：国家资本主义是“改造资本主义工商业和逐步完成社会主义过渡的必经之路”。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"25\";s:5:\"knows\";s:46:\"第三节 开辟中国社会主义改造道路\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (522, 1, '我国对资本主义工商业进行社会主改造的高级形式是', 1, 'peadmin', '', '&lt;p&gt;A. 加工订货&lt;/p&gt;&lt;p&gt;B. 统购包销&lt;/p&gt;&lt;p&gt;C. 公私合营&lt;/p&gt;&lt;p&gt;D. 经销代销&lt;/p&gt;', 4, 'C', '对资本主义工商业进行社会主义改造，就是实行赎买政策，采取国家资本主义的形式。把民族资本主义工商企业改造成为社会主义性质的企业。高级形式的国家资本主义就是公私合营，又分为个别企业的公私合营和全行业的公私合营。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"25\";s:5:\"knows\";s:46:\"第三节 开辟中国社会主义改造道路\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (523, 1, '社会主义改造中对资本主义工商业采取了“四马分肥”的办法，“四马分肥”具体是指', 1, 'peadmin', '', '&lt;p&gt;A. 国家所得税、企业公积金、工人工资、股金红利&lt;/p&gt;&lt;p&gt;B. 国家所得税、企业公积金、-工人福利费、股东股息&lt;/p&gt;&lt;p&gt;C. 国家所得税、企业公积金、工人福利费、股金红利&lt;/p&gt;&lt;p&gt;D. 国家所得税、工人工资、工人福利费、股东股息&lt;/p&gt;', 4, 'C', '社会主义改造中对资本主义工商业企业利润采取“四马分肥”的办法，即分为国家所得税、企业公积金、工人福利费、股金红利四部分。企业收益大部分归国家和工人，资本家所得不足1/4。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"25\";s:5:\"knows\";s:46:\"第三节 开辟中国社会主义改造道路\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (524, 1, '我国对资本主义工商业进行社会主义改造的基本政策是', 1, 'peadmin', '', '&lt;p&gt;A. 和平赎买&lt;/p&gt;&lt;p&gt;B. 无偿没收&lt;/p&gt;&lt;p&gt;C. 有偿征用&lt;/p&gt;&lt;p&gt;D. 自愿互利&lt;/p&gt;', 4, 'A', '经过国家资本主义来改造资本主义工商业，意味着国家对资本主义工商业采取和平赎买的政策。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"25\";s:5:\"knows\";s:46:\"第三节 开辟中国社会主义改造道路\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (525, 1, '下列不属于第一个五年计划期间建设的钢铁基地的是', 1, 'peadmin', '', '&lt;p&gt;A. 鞍山&lt;/p&gt;&lt;p&gt;B. 包头&lt;/p&gt;&lt;p&gt;C. 宝山&lt;/p&gt;&lt;p&gt;D. 武汉&lt;/p&gt;', 4, 'C', '“一五”期间，在苏联的援助下，中国着重建设了一大批基础性的重点工程。鞍山、包头、武汉三大钢铁基地的建设取得重大进展。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"25\";s:5:\"knows\";s:46:\"第三节 开辟中国社会主义改造道路\";}}', 1532691021, 1, '', 0, 0, 3, '', 0);
INSERT INTO `x2_questions` VALUES (526, 1, '社会主义革命的目的是', 1, 'peadmin', '', '&lt;p&gt;A. 解放生产力&lt;/p&gt;&lt;p&gt;B. 推进工业化&lt;/p&gt;&lt;p&gt;C. 建设现代化国家&lt;/p&gt;&lt;p&gt;D. 实现国家的繁荣富强&lt;/p&gt;', 4, 'A', '社会主义革命的目的是解放生产力。在社会主义 改造基本完成后，中国人民面 临的主要任务，是进一步推进工业化、现代化建设，为实现国家的繁 荣富强和人民的共同富裕而奋斗。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"25\";s:5:\"knows\";s:46:\"第三节 开辟中国社会主义改造道路\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (527, 1, '社会主义基本制度在中国确立的主标志是', 1, 'peadmin', '', '&lt;p&gt;A. 中华人民共和国的成立&lt;/p&gt;&lt;p&gt;B. 社会主义改造的基本完成&lt;/p&gt;&lt;p&gt;C. 全国大陆的统一&lt;/p&gt;&lt;p&gt;D. 国民经济的恢复&lt;/p&gt;', 4, 'B', '社会主义改造的基本完成，中国继建立了社会主义基本政治制度以后，社会主义的基本经济制度也建立起来了。这是中国进入社会主义社会的最主要的标志。中国已经胜利地完成了从新民主主义到社会主义的过渡，社会主义基本制度在中国得到全面的确立。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"25\";s:5:\"knows\";s:46:\"第三节 开辟中国社会主义改造道路\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (528, 1, '毛泽东提出实现马克思主义同中国实际“第二次结合”是在', 1, 'peadmin', '', '&lt;p&gt;A. 1956 年中共中央书记处会议&lt;/p&gt;&lt;p&gt;B. 1956 年中央政治局扩大会议&lt;/p&gt;&lt;p&gt;C. 1957 年最高国务会议&lt;/p&gt;&lt;p&gt;D. 1956 年中共八大&lt;/p&gt;', 4, 'A', '1956年4月，在中共中央书记处会议上，毛泽东提出：我认为最重要的是独立自主，调查研究，摸清本国国情，把马克思列宁主义的基本原理同我国革命和建设的具体实际结合起来，制定我们的路线、方针、政策。他说：现在是社会主义革命和建设时期，我们要进行第二次结合，找出在中国进行社会主义革命和建设的正确道路。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"26\";s:5:\"knows\";s:25:\"第一节 良好的开局\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (529, 1, '1956年9月召开的中共八大的指导思想是', 1, 'peadmin', '', '&lt;p&gt;A. 实现马克思主义同中国实际“第二次结合”&lt;/p&gt;&lt;p&gt;B. 正确处理人民内部矛盾&lt;/p&gt;&lt;p&gt;C. 一定要努力把一切积极因素全部调动起来，把我国建设成为一个强大的社会主义国家&lt;/p&gt;&lt;p&gt;D. 动员全党和全国人民“向科学进军”&lt;/p&gt;', 4, 'C', '1956年4月毛泽东在《论十大关系》中强调“一定要努力把党内党外、国内国外的一切积极的因素，直接的、间接的积极因素，全部调动起 来，把我国建设成为一个强大的社会主义国家”，这也成为同年9月召开的中共八大的指导思想。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"26\";s:5:\"knows\";s:25:\"第一节 良好的开局\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (530, 1, '我国社会主义改造基本完成后，党和国家的根本任务是', 1, 'peadmin', '', '&lt;p&gt;A. 进行政治建设&lt;/p&gt;&lt;p&gt;B. 进行文化建设&lt;/p&gt;&lt;p&gt;C. 保护和发展生产力&lt;/p&gt;&lt;p&gt;D. 进行社会建设&lt;/p&gt;', 4, 'C', '从1956年初开始，以毛泽东为主要表的共产党人，对中国的社会主义建设道路进行了艰苦的探索，并开始取得积极成果。社会主义改造基本完成后，中国共产党和国家的根本任务，已由解放生产力变为在新的生产关系下保护和发展生产力。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"26\";s:5:\"knows\";s:25:\"第一节 良好的开局\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (531, 1, '《论十大关系》的发表标志着', 1, 'peadmin', '', '&lt;p&gt;A. 中国共产党人开始探索自己的社会主义建设道路&lt;/p&gt;&lt;p&gt;B. 社会主义改造的完成&lt;/p&gt;&lt;p&gt;C. 新民主主义国家的建立&lt;/p&gt;&lt;p&gt;D. 阶级矛盾的消除&lt;/p&gt;', 4, 'A', '《论十大关系》是以毛泽东为主要代表的中国共产党人开始探索中国自己的社会主义建设道路的标志。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"26\";s:5:\"knows\";s:25:\"第一节 良好的开局\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (532, 1, '毛泽东在《论十大关系》中提出的中国社会主义建设的基本方针是', 1, 'peadmin', '', '&lt;p&gt;A. 不要四面出击&lt;/p&gt;&lt;p&gt;B. 调整、巩固、充实、提高&lt;/p&gt;&lt;p&gt;C. 积极引导、稳步前进&lt;/p&gt;&lt;p&gt;D. 调动一切积极因素为社会主义事业服务&lt;/p&gt;', 4, 'D', '1956 年，毛泽东作了《论十大关系》的报告。这十大关系围绕了一个基本方针，即“一定要努力把党内党外、国内国外的一切积极因素，直接的、间接的积极因素，全部调动起来，把我国建设成为一个强大的社会主义国家。”答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"26\";s:5:\"knows\";s:25:\"第一节 良好的开局\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (533, 1, '1958年5月，党的八大二次会议通过了    的总路线。', 1, 'peadmin', '', '&lt;p&gt;A. 正确处理重工业和轻工业、农业的关系&lt;/p&gt;&lt;p&gt;B. 调整、巩固、充实、提高&lt;/p&gt;&lt;p&gt;C. 在综合平衡中稳步前进&lt;/p&gt;&lt;p&gt;D. 鼓足干劲、力争上游、多快好省地建设社会主义&lt;/p&gt;', 4, 'D', '1958年5月，中共八大二次会议通过了“鼓足干劲、力争上游、多快好省地建设社会主义”的总路线。这条总路线及其基本点，反映了广大人民群众迫切要求改变国家经济文化落后状况的普遍愿望，但它忽视了客观的经济规律。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"27\";s:5:\"knows\";s:34:\"第二节 探索中的严重曲折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (534, 1, '以下选项不属于1956年至1957年，中国共产党人探索社会主义建设道路取得的积极成果的是', 1, 'peadmin', '', '&lt;p&gt;A. 社会主义建设总路线&lt;/p&gt;&lt;p&gt;B. 《论十大关系》&lt;/p&gt;&lt;p&gt;C. 《关于解决人民内部矛盾的问题》&lt;/p&gt;&lt;p&gt;D. 中共八大制定的路线方针政策&lt;/p&gt;', 4, 'A', '从1956年初开始，以毛泽东为主要代表的中国共产党人，对中国社会主义建设道路进行了艰苦的探索，并开始取得积极成果。A 项是1958年5月，中共八大二次会议通过的，内容为“鼓足干劲，力争上游，多快好省地建设社会主义”。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"27\";s:5:\"knows\";s:34:\"第二节 探索中的严重曲折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (535, 1, '1961年，中共八届九中全会指定的关于国民经济的指导方针是', 1, 'peadmin', '', '&lt;p&gt;A. 一平，二调，三收款&lt;/p&gt;&lt;p&gt;B. 调整巩固充实提高&lt;/p&gt;&lt;p&gt;C. 鼓足于劲，力争上游，多快好省建设社会主义&lt;/p&gt;&lt;p&gt;D. 以国有经济为主体，推动经济又好又快发展&lt;/p&gt;', 4, 'B', '1961年，中共八届九中全会正式决定对国民经济实行“调整、巩固、充实、提高”的方针。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"27\";s:5:\"knows\";s:34:\"第二节 探索中的严重曲折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (536, 1, '三届全国人大一次会议上正式宣布，把我国逐步建设成为社会主义强国的目标是实现', 1, 'peadmin', '', '&lt;p&gt;A. 农业现代化&lt;/p&gt;&lt;p&gt;B. 工业现代化&lt;/p&gt;&lt;p&gt;C. 国防和科学技术现代化&lt;/p&gt;&lt;p&gt;D. 以上都对&lt;/p&gt;', 4, 'D', '在三届全国人大一次会议上周恩来正式宣布，把我国逐步建设具有现代农业，现代工业，现代国防和现代科学技术的社会主义强国。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"27\";s:5:\"knows\";s:34:\"第二节 探索中的严重曲折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (537, 1, '党和政府第一次郑重地向全国人民提出实现“四个现代化”奋斗目标是在', 1, 'peadmin', '', '&lt;p&gt;A. 中共八大上&lt;/p&gt;&lt;p&gt;B. 第一次全国人民代表大会上&lt;/p&gt;&lt;p&gt;C. 七千人大会上&lt;/p&gt;&lt;p&gt;D. 第三届全国人民代表大会第一次会议上&lt;/p&gt;', 4, 'D', '1964年底到1965年初，在国民经济调整任务即将基本完成时，召开了第三届全国人民代表大会第一次会议。在这次会议上，中国共产党和政府第一次郑重地向全国人民提出实现“四个现代化”的奋斗目标。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"27\";s:5:\"knows\";s:34:\"第二节 探索中的严重曲折\";}}', 1532691021, 1, '', 0, 0, 3, '', 0);
INSERT INTO `x2_questions` VALUES (538, 1, '1965年1月，错误地提出社会主义教育运动的重点是“整党内那些走资本主义道路的当权派”观点的文件是', 1, 'peadmin', '', '&lt;p&gt;A. 《农村社会主义教育运动中目前提出的一些问题》&lt;/p&gt;&lt;p&gt;B. 《关于无产阶级文化大革命的决定》&lt;/p&gt;&lt;p&gt;C. 《农村人民公社工作条例（草案）》&lt;/p&gt;&lt;p&gt;D. 《关于人民公社若干问题的决议》&lt;/p&gt;', 4, 'A', '1964年底到1965年初，党中央转《农村社会主义教育运动中目前提出的一些问题》的文件，错误提出了“整党内那些走资本主义道路的当权派”的观点。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"27\";s:5:\"knows\";s:34:\"第二节 探索中的严重曲折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (539, 1, '1962年9月召开的中共八届十中全会进一步发展了', 1, 'peadmin', '', '&lt;p&gt;A. 社会主义经济理论&lt;/p&gt;&lt;p&gt;B. “以阶级斗争为纲”的理论&lt;/p&gt;&lt;p&gt;C. 无产阶级革命理论&lt;/p&gt;&lt;p&gt;D. 实现现代化的理论&lt;/p&gt;', 4, 'B', '1962年9月，召开了中共八届 十全会。全会公报根据毛泽东多次讲话精神，进一步发展了“以阶级斗争为纲”的理。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"27\";s:5:\"knows\";s:34:\"第二节 探索中的严重曲折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (540, 1, '“文化大革命”的导火线是', 1, 'peadmin', '', '&lt;p&gt;A. 城乡社会主义教育运动&lt;/p&gt;&lt;p&gt;B. 《评新编历史剧&lt;海瑞罢官&gt;》的发表&lt;/p&gt;&lt;p&gt;C. “五一六通知”&lt;/p&gt;&lt;p&gt;D. 对电影《武训传》的批判&lt;/p&gt;', 4, 'B', '1965年11月10日，姚文元在上海《文汇报》发表《评新编历史剧 &lt;海瑞罢官&gt;》，成为“文化大革命”的导火线。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"27\";s:5:\"knows\";s:34:\"第二节 探索中的严重曲折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (541, 1, '发动“文化大革命”的主要论点，被概括成为', 1, 'peadmin', '', '&lt;p&gt;A. “阶级斗争扩大化”的理论&lt;/p&gt;&lt;p&gt;B. “无产阶级专政下继续革命的理论”&lt;/p&gt;&lt;p&gt;C. 社会主义革命的理论&lt;/p&gt;&lt;p&gt;D. 社会主义革命和建设的理论&lt;/p&gt;', 4, 'B', '20世纪60 年代中期，在“以阶级斗争为纲”的指导思想支配下，毛泽东对当时国内阶级斗争形势以及党和国家的政治状况作出严重的错误估计，毛泽东用来发动和领导“文化大革命”的主要论点，被概括为“无产阶级专政下继续革命的理论”。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"27\";s:5:\"knows\";s:34:\"第二节 探索中的严重曲折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (542, 1, '1970～1971年发生了阴谋夺取最高权力、策动反革命武装政变的事件是', 1, 'peadmin', '', '&lt;p&gt;A. 江青反革命集团&lt;/p&gt;&lt;p&gt;B. 康生反革命集团&lt;/p&gt;&lt;p&gt;C. 林彪反革命集团&lt;/p&gt;&lt;p&gt;D. 姚文元反革命集团&lt;/p&gt;', 4, 'C', '1970～1971 年，林彪反革命集团阴谋夺取最高权力、策动反革命武装政变事件的发生，是“文化大革命”推翻党的一列基本原则的结果。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"27\";s:5:\"knows\";s:34:\"第二节 探索中的严重曲折\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (543, 1, '同中国共同倡导和平共处五项原则的国家有', 1, 'peadmin', '', '&lt;p&gt;A. 苏联印度&lt;/p&gt;&lt;p&gt;B. 印度缅甸&lt;/p&gt;&lt;p&gt;C. 缅甸泰国&lt;/p&gt;&lt;p&gt;D. 苏联泰国&lt;/p&gt;', 4, 'B', '日内瓦国际会议和万隆会议之后，中国国际地位显著提高，同印度，缅甸 等国倡导的和平 共处五项原则，成为处理国际关系公认的国际准则。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"28\";s:5:\"knows\";s:41:\"第三节 建设的成就 探索的成果\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (544, 1, '1972年2月，和我国发表上海联合公报，开辟两国关系新前景的是', 1, 'peadmin', '', '&lt;p&gt;A. 苏联&lt;/p&gt;&lt;p&gt;B. 印度&lt;/p&gt;&lt;p&gt;C. 美国&lt;/p&gt;&lt;p&gt;D. 日本&lt;/p&gt;', 4, 'C', '1972年2月，尼克松总统访华，中两国发表上海联合公报。同年9月，中日两国发表关于建交的联合声明。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"28\";s:5:\"knows\";s:41:\"第三节 建设的成就 探索的成果\";}}', 1532691021, 1, '', 0, 0, 3, '', 0);
INSERT INTO `x2_questions` VALUES (545, 1, '毛泽东号召全党提高警惕，同帝国主义   战略的危险作斗争。', 1, 'peadmin', '', '&lt;p&gt;A. 经济封锁&lt;/p&gt;&lt;p&gt;B. “和平演变”&lt;/p&gt;&lt;p&gt;C. 武装进攻&lt;/p&gt;&lt;p&gt;D. 扶植反动势力&lt;/p&gt;', 4, 'B', '关于加强共产党自身建设，毛泽东最早觉察到帝国主义“和平演变”战略的危险，号召共产党人提高警惕，同这种危险作斗争。同时，他也十分警惕党在执政以后可能产生的种种消极现象。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"28\";s:5:\"knows\";s:41:\"第三节 建设的成就 探索的成果\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (546, 1, '在探索中国社会主义建设道路过程中，毛泽东提出的对待古今中外优秀文化的方针是：古为今用、洋为中用，百花齐放和', 1, 'peadmin', '', '&lt;p&gt;A. 百家争呜&lt;/p&gt;&lt;p&gt;B. 取其精华&lt;/p&gt;&lt;p&gt;C. 弃其糟粕&lt;/p&gt;&lt;p&gt;D. 推陈出新&lt;/p&gt;', 4, 'D', '在社会主义文化建设方面，毛泽东提出，要坚持马克思主义指导地位，实行“百花齐放，百家争鸣”的方针，对古今中外的优秀文化实行“古为今用、洋为中用、百花齐放、推陈出新”的方针。 答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"28\";s:5:\"knows\";s:41:\"第三节 建设的成就 探索的成果\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (547, 1, '1978年5月11日在全国开始了关于真理标准问题的大讨论，其起点是《光明日报》发表文章，题为', 1, 'peadmin', '', '&lt;p&gt;A. 《解放思想，实事求是，团结一致向前看》&lt;/p&gt;&lt;p&gt;B. 《实践是检验真理的唯一标准》&lt;/p&gt;&lt;p&gt;C. 《关于加快农业发展若干问题的决定》&lt;/p&gt;&lt;p&gt;D. 《关于建国以来党的若干历史问题的决议》&lt;/p&gt;', 4, 'B', '1978年5月11日，《光明日报》发表了《实践是检验真理的唯一标准》的文章，在全国开始了关于真理标准问题的大讨论。这一讨论冲破了“两个凡是”的思想束缚，自始至终得到了邓小平、叶剑英、陈云、李先念、胡耀邦等的全力支持。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"29\";s:5:\"knows\";s:58:\"第一节 历史性的伟大转折和改革开放的起步\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (548, 1, '中共十一届三中全会于1978年12月在哪里举行？', 1, 'peadmin', '', '&lt;p&gt;A. 上海&lt;/p&gt;&lt;p&gt;B. 南京&lt;/p&gt;&lt;p&gt;C. 广州&lt;/p&gt;&lt;p&gt;D. 北京&lt;/p&gt;', 4, 'D', '经过两年多在徘徊中前进，迫切需要把党和国家的工作重心从根本上转到以经济建设为中心的轨道上来。1978 年 12月18日至22日，中共十一届三中全会在北京召开，实现了这一伟大的历史性转折。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"29\";s:5:\"knows\";s:58:\"第一节 历史性的伟大转折和改革开放的起步\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (549, 1, '中国进入了改革开放和社会主义现代化建设的历史新时期的起点是', 1, 'peadmin', '', '&lt;p&gt;A. 中共十一届二中全会&lt;/p&gt;&lt;p&gt;B. 中共十一届三中全会&lt;/p&gt;&lt;p&gt;C. 中共十一届五中全会&lt;/p&gt;&lt;p&gt;D. 中共十一届六中全会&lt;/p&gt;', 4, 'B', '1978年12月18日至22日，中共十一届三中全会在北京召开，会议的中心议题是把全党的工作重心转移到社会主义现代化建设上来，是改革开放与现代化建设的新起点。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"29\";s:5:\"knows\";s:58:\"第一节 历史性的伟大转折和改革开放的起步\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (550, 1, '邓小平提出“把马克思主义的普遍真理同我国的具体实际结合起来，走自己的道路，建设有中国特色的社会主义”是在', 1, 'peadmin', '', '&lt;p&gt;A. 中共十届三中全会&lt;/p&gt;&lt;p&gt;B. 中共十一届六中全会&lt;/p&gt;&lt;p&gt;C. 中共十二大&lt;/p&gt;&lt;p&gt;D. 中共十二届四中全会&lt;/p&gt;', 4, 'C', '邓小平在十二大开幕词中提出，“把马克思主义的普遍真理同我国的具体实际结合起来，走自己的道路，建设有中国特色的社会主义”。这是总结党的长期历史经验得出的基本结论。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"30\";s:5:\"knows\";s:58:\"第二节 改革开放和现代化建设新局面的展开\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (551, 1, '下列不属于1983年十二届二中全会作出的关于整党任务的内容的是', 1, 'peadmin', '', '&lt;p&gt;A. 纠正一切违反四项基本原则的错误&lt;/p&gt;&lt;p&gt;B. 纠正违反十一届三中全会以来党的路线的错误&lt;/p&gt;&lt;p&gt;C. 纠正各种利用职权谋取私利的行为&lt;/p&gt;&lt;p&gt;D. 提出“高度文明”和“高度民主”的奋斗目标&lt;/p&gt;', 4, 'D', '选项ABC 均为十二届二中全会作出的整党任务的内容，D项为中共十二大报告提出的奋斗目标。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"30\";s:5:\"knows\";s:58:\"第二节 改革开放和现代化建设新局面的展开\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (552, 1, '中国共产党在社会主义初级阶段的基本路线的“一个中心”是', 1, 'peadmin', '', '&lt;p&gt;A. 以经济建设为中心&lt;/p&gt;&lt;p&gt;B. 以坚持四项基本原则为中心&lt;/p&gt;&lt;p&gt;C. 以改革开放为中心&lt;/p&gt;&lt;p&gt;D. 以科学发展、社会和谐为中心&lt;/p&gt;', 4, 'A', '中国共产党在社会主义初级阶段的基本路线是：领导和团结全国各族人民，以经济建设为中心，坚持四项基本原则，坚持改革开放，自力更生，艰苦创业，为把我国建设成为富强、民主、文明的社会主义现代化国家而奋斗。其中，“一个中心”是指以经济建设为中心。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"30\";s:5:\"knows\";s:58:\"第二节 改革开放和现代化建设新局面的展开\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (553, 1, '社会主义现代化建设“三步走”的战略部署制定于党的', 1, 'peadmin', '', '&lt;p&gt;A. 十一大&lt;/p&gt;&lt;p&gt;B. 十二大&lt;/p&gt;&lt;p&gt;C. 十三大&lt;/p&gt;&lt;p&gt;D. 十四大&lt;/p&gt;', 4, 'C', '中共十一届三中全会以后，随着改革开放不断深入，邓小平对经济发展战略的思考也不断趋于成熟。党的十三大正式制定了社会主义现代化建设“三步走”的战略部署。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"30\";s:5:\"knows\";s:58:\"第二节 改革开放和现代化建设新局面的展开\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (554, 1, '中共十三大根据邓小平的设想，提出到20世纪末的奋斗目标是', 1, 'peadmin', '', '&lt;p&gt;A. 全面实现四个现代化&lt;/p&gt;&lt;p&gt;B. 达到中等发达国家水平&lt;/p&gt;&lt;p&gt;C. 国民生产总值翻两番，人民生活达到小康水平&lt;/p&gt;&lt;p&gt;D. 全面建设小康社会&lt;/p&gt;', 4, 'C', '“三步 走”战略部署的内容为：第一步，实现国民生产总值比1980 年翻一番，解决人民的温饱问题，这个任务已经基本实现；第二步，到 20世纪末，使国民生产总值再增长一倍，人民生活达到小康水平；第三步，到 21世纪中叶，人均国民生产总值达到中等发达国家水平，人民生活比较富裕，基本实现现代化。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"30\";s:5:\"knows\";s:58:\"第二节 改革开放和现代化建设新局面的展开\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (555, 1, '1990年邓小平提出了中国农业改革发展的“两个飞跃”，第一个飞跃是废除人民公社，实行家庭联产承包为主的责任制，第二个飞跃是', 1, 'peadmin', '', '&lt;p&gt;A. 发展集体经济&lt;/p&gt;&lt;p&gt;B. 建设社会主义新农村&lt;/p&gt;&lt;p&gt;C. 实现农业的现代化&lt;/p&gt;&lt;p&gt;D. 人民生活达到小康水平&lt;/p&gt;', 4, 'A', '邓小平强调：中国社会主义农业的改 革和发展会有两个飞跃，第一个飞跃是废除人民公社，实行家庭联产承包为主的责任制，第二个飞跃就是发展集体经济。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"30\";s:5:\"knows\";s:58:\"第二节 改革开放和现代化建设新局面的展开\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (556, 1, '党的十五大确立的社会主义初级阶段的基本经济制度是', 1, 'peadmin', '', '&lt;p&gt;A. 公有制经济为主体，多种所有制经济为补充&lt;/p&gt;&lt;p&gt;B. 公有制经济为主体，多种所有制经济为辅助&lt;/p&gt;&lt;p&gt;C. 公有制经济为主体，多种所有制经济共同发展&lt;/p&gt;&lt;p&gt;D. 计划经济为主体，市场经济为补充&lt;/p&gt;', 4, 'C', '中共十五大指出：公有制为主体、多种所有制经济共同发展，是中国社会主义初级阶段的一项基本经济制度。公有制的实现形式可以而且应当多样化。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"31\";s:5:\"knows\";s:58:\"第三节 改革开放和现代化建设发展的新阶段\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (557, 1, '将“依法治国”提到“党领导人民治理国家的基本方略”高度的会议是党的', 1, 'peadmin', '', '&lt;p&gt;A. 十四大&lt;/p&gt;&lt;p&gt;B. 十五大&lt;/p&gt;&lt;p&gt;C. 十六大&lt;/p&gt;&lt;p&gt;D. 十六届三中全会&lt;/p&gt;', 4, 'B', '中共十五大就社会主义初级阶段的所有制结构和公有制实现形式，推进政治体制改革、依法治国，建设社会主义法治国家等问题提出了新的论断。大会指出依法治国，是党领导人民治理国家的基本方略。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"31\";s:5:\"knows\";s:58:\"第三节 改革开放和现代化建设发展的新阶段\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (558, 1, '提出“构建社会主义和谐社会”这一全新理念的会议是', 1, 'peadmin', '', '&lt;p&gt;A. 党的十五大&lt;/p&gt;&lt;p&gt;B. 党的十六大&lt;/p&gt;&lt;p&gt;C. 中共十六届三中全会&lt;/p&gt;&lt;p&gt;D. 中共十六届四中全会&lt;/p&gt;', 4, 'D', '2004年9月召开的中共十六届四中全会，提出了构建社会主义和谐社会的战略任务。2005年2月，胡锦涛在中央党校省部级主要领导干部专题研讨班上，对构建社会主义和谐社会的重大战略思想作出全面论述。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"32\";s:5:\"knows\";s:64:\"第四节 在新的历史起点上推进中国特色社会主义\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (559, 1, '中国特色社会主义的本质属性是', 1, 'peadmin', '', '&lt;p&gt;A. 生产发展&lt;/p&gt;&lt;p&gt;B. 国家富强&lt;/p&gt;&lt;p&gt;C. 人民幸福&lt;/p&gt;&lt;p&gt;D. 社会和谐&lt;/p&gt;', 4, 'D', '中共十六届六中全会审议通过的《中共中央关于构建社会主义和谐社会若干重大问题的决定》指出：社会和谐是中国特色社各主义的本质属性，是国家富强、民族振兴、人民幸福的重要保证。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"32\";s:5:\"knows\";s:64:\"第四节 在新的历史起点上推进中国特色社会主义\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (560, 1, '全国范围内农业税的最终取消在', 1, 'peadmin', '', '&lt;p&gt;A. 2004 年&lt;/p&gt;&lt;p&gt;B. 2005 年&lt;/p&gt;&lt;p&gt;C. 2006 年&lt;/p&gt;&lt;p&gt;D. 2007 年&lt;/p&gt;', 4, 'C', '中共十六届五中全会提出了建设社会主义新农村的战略任务，提出了“生产发展、生活宽裕、乡风文明、村容整洁、管理民主”的要求。2006 年，在全国范围内取消农业税，为农民减轻税费负担1200多亿元。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"32\";s:5:\"knows\";s:64:\"第四节 在新的历史起点上推进中国特色社会主义\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (561, 1, '社会主义荣辱观的主要内容是', 1, 'peadmin', '', '&lt;p&gt;A. 讲学习、讲政治、讲正气&lt;/p&gt;&lt;p&gt;B. 八个坚持、八个反对&lt;/p&gt;&lt;p&gt;C. 八荣八耻&lt;/p&gt;&lt;p&gt;D. 公平正义、诚信友爱&lt;/p&gt;', 4, 'C', '2006年3月4日，胡锦涛提出了以“八荣八耻”为主要内容的社会主义 荣辱观。社会主义荣辱观体现了社会主义道德规范的本质要求，成为社会主义精神文明建设的重要指导方针。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"32\";s:5:\"knows\";s:64:\"第四节 在新的历史起点上推进中国特色社会主义\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (562, 1, '2005年10月，胡锦涛在中共十六届五中全会上明确提出了   的任务。', 1, 'peadmin', '', '&lt;p&gt;A. 建设创新型国家&lt;/p&gt;&lt;p&gt;B. 实现小康社会&lt;/p&gt;&lt;p&gt;C. 共同富裕&lt;/p&gt;&lt;p&gt;D. 2050年前达到发达国家水平&lt;/p&gt;', 4, 'A', '2005年10月，胡锦涛在中共十六届五中全会上的讲话中，明确提出了建设创新型国家的任务。2006年，中央下发了《关于实施科技规划纲要增强自主创新能力的决定》、《国家中长期科学和技术发展规划纲要（ 2006-2020年）》。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"32\";s:5:\"knows\";s:64:\"第四节 在新的历史起点上推进中国特色社会主义\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (563, 1, '胡锦涛系统地阐述走和平发展道路的基本内涵和重大意义是在', 1, 'peadmin', '', '&lt;p&gt;A. 纪念邓小平诞辰一百周年大会上&lt;/p&gt;&lt;p&gt;B. 中央党校省部级主要领导干部专题研讨班上&lt;/p&gt;&lt;p&gt;C. 英国伦敦金融城&lt;/p&gt;&lt;p&gt;D. 联合国大会上&lt;/p&gt;', 4, 'C', '胡锦涛在纪念邓小平同志诞辰一百周 年大会上的讲话中提出，要高举和平、发展、合作的旗帜，坚持走和平发展的道路。2005 年11月，他在英国伦敦金融城发表演讲，系统阐述了走和平发展道路的基本内涵和重大意义。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"32\";s:5:\"knows\";s:64:\"第四节 在新的历史起点上推进中国特色社会主义\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (564, 1, '社会主义和谐社会的主要特征不包括', 1, 'peadmin', '', '&lt;p&gt;A. 民主法治、公平正义&lt;/p&gt;&lt;p&gt;B. 诚信友爱、充满活力&lt;/p&gt;&lt;p&gt;C. 良好道德风向、和谐人际关系&lt;/p&gt;&lt;p&gt;D. 安定有序、人与自然和谐相处&lt;/p&gt;', 4, 'C', '社会和谐是中国特色社会主义的本质属性，是国家富强、民族振兴、人民幸福的重要保证。我们要构建的社会主义和谐社会，是在中国特色社会主义道路上，中国共产党领导全体人民共同建设、共同享有的和谐社会。其主要特征是民主法治、公平正义、诚信友爱、充满活力、安定有序、人与自然和谐相处。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"32\";s:5:\"knows\";s:64:\"第四节 在新的历史起点上推进中国特色社会主义\";}}', 1532691021, 1, '', 0, 0, 3, '', 0);
INSERT INTO `x2_questions` VALUES (565, 1, '中共十七大召开时间是', 1, 'peadmin', '', '&lt;p&gt;A. 2007 年 3月1日&lt;/p&gt;&lt;p&gt;B. 2007 年10月15日&lt;/p&gt;&lt;p&gt;C. 2007 年 10月25日&lt;/p&gt;&lt;p&gt;D. 2007 年 11月l5日&lt;/p&gt;', 4, 'B', '2007 年 10月15日至21日，中共十七大在北京举行。大会的主题是：高举中国特 色社会主义伟大旗帜，以邓小平理论和“三个代表”重要思想为指导。深入贯彻落实科学发展观，继续解放思想，坚持改革开放，推动科学；发展，促进，社会和谐，为夺取全面建设小康社」会新胜利而奋斗。答案为B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"32\";s:5:\"knows\";s:64:\"第四节 在新的历史起点上推进中国特色社会主义\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (566, 1, '2005年初至2006年上半年，在全党开展了以实践“三个代表”重要思想为主要内容的', 1, 'peadmin', '', '&lt;p&gt;A. 整党运动&lt;/p&gt;&lt;p&gt;B. 整风运动&lt;/p&gt;&lt;p&gt;C. 以讲学习、讲政治、讲正气为主要内容的党性党风教育活动&lt;/p&gt;&lt;p&gt;D. 保持共产党员 先进性教育活动&lt;/p&gt;', 4, 'D', '从2005 年初到 2006 年上半年，全党开展了以实践“三个代表”重要思想为主要内容的保持共产党 员 先进性教育活动。在中央的高度重视和坚强领导下，各级党组织周密部署、扎实推进，取得了比较明显的成效。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"32\";s:5:\"knows\";s:64:\"第四节 在新的历史起点上推进中国特色社会主义\";}}', 1532691021, 1, '', 0, 0, 3, '', 0);
INSERT INTO `x2_questions` VALUES (567, 1, '中共十八届一中全会批准为中央纪律检查委员会书记的是', 1, 'peadmin', '', '&lt;p&gt;A. 李克强&lt;/p&gt;&lt;p&gt;B. 张德江&lt;/p&gt;&lt;p&gt;C. 王岐山&lt;/p&gt;&lt;p&gt;D. 刘云山&lt;/p&gt;', 4, 'C', '中共十八届一中全会选举产生中央政治局，选举习近平为中共中央总书记，选举习近平、李克强、张德江、俞正声、刘云山、王岐山、张高丽为中央政治局常务委员会委员，决定习近平为中央军事委员会主席，批准王歧 山为中央纪律检查委员会书记。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"32\";s:5:\"knows\";s:64:\"第四节 在新的历史起点上推进中国特色社会主义\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (568, 1, '标志着我国文化改革发展进入一个新阶段的会议是', 1, 'peadmin', '', '&lt;p&gt;A. 中共十六届一中全会&lt;/p&gt;&lt;p&gt;B. 十七届三中全会&lt;/p&gt;&lt;p&gt;C. 十七届六中全会&lt;/p&gt;&lt;p&gt;D. 十八届一中全会&lt;/p&gt;', 4, 'C', '2011年10月，中共十七届 六中全会通过了《关于深化文化体制 改革推动社会主义文化大发展大繁荣若干重大问题的决定》，以这次全会为标志，我国文化改 革发展进入一个新阶段。答案为C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"32\";s:5:\"knows\";s:64:\"第四节 在新的历史起点上推进中国特色社会主义\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (569, 1, '十八大精神归结为一点，就是', 1, 'peadmin', '', '&lt;p&gt;A. 实现祖国统一&lt;/p&gt;&lt;p&gt;B. 坚持改革开放&lt;/p&gt;&lt;p&gt;C. 建设和谐社会&lt;/p&gt;&lt;p&gt;D. 坚持和发展中国特色社会主义&lt;/p&gt;', 4, 'D', '中共十八大是在夺取全面建成小康社会关键时刻召开的。十八大精神归结为一点，就是坚持和发展中国特色社会主义。答案为D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"32\";s:5:\"knows\";s:64:\"第四节 在新的历史起点上推进中国特色社会主义\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (570, 1, '中国的社会生产力在改革开放后迅速发展，到2012年经济总量已居世界', 1, 'peadmin', '', '&lt;p&gt;A. 第二位&lt;/p&gt;&lt;p&gt;B. 第三位&lt;/p&gt;&lt;p&gt;C. 第四位&lt;/p&gt;&lt;p&gt;D. 第五位&lt;/p&gt;', 4, 'A', '2002年到2012 年的十年间，我国经济总量从世界第六位跃升到第二位。答案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"32\";s:5:\"knows\";s:64:\"第四节 在新的历史起点上推进中国特色社会主义\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);
INSERT INTO `x2_questions` VALUES (571, 1, '改革开放以来，我国形成的基层民主自治体系不包括', 1, 'peadmin', '', '&lt;p&gt;A. 学校学生会&lt;/p&gt;&lt;p&gt;B. 农村村民委员会&lt;/p&gt;&lt;p&gt;C. 城市居民委员会&lt;/p&gt;&lt;p&gt;D. 企业职工代表大会&lt;/p&gt;', 4, 'A', '改革开放以来，我国基层民主建设取得重大进展，以农村村民委员会、城市居民委员会和企业职工代表大会为主要内谷的基层民主自治体系开始形成。截至2007 年底，全国农村建立村民委员会61万多个，全国城市建立符合新型小区建设要求的居民委员会8万多个。答 案为A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:2:\"33\";s:5:\"knows\";s:61:\"第五节 改革开放和社会主义现代化建设的成就\";}}', 1532691021, 1, '', 0, 0, 2, '', 0);

-- ----------------------------
-- Table structure for x2_questype
-- ----------------------------
DROP TABLE IF EXISTS `x2_questype`;
CREATE TABLE `x2_questype`  (
  `questid` int(11) NOT NULL AUTO_INCREMENT,
  `questype` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `questsort` int(1) NOT NULL DEFAULT 0,
  `questchoice` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`questid`) USING BTREE,
  INDEX `questchoice`(`questchoice`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x2_questype
-- ----------------------------
INSERT INTO `x2_questype` VALUES (1, '单选题', 0, 1);
INSERT INTO `x2_questype` VALUES (2, '多选题', 0, 2);
INSERT INTO `x2_questype` VALUES (3, '判断题', 0, 4);
INSERT INTO `x2_questype` VALUES (4, '定值填空', 0, 5);
INSERT INTO `x2_questype` VALUES (5, '填空题', 1, 2);
INSERT INTO `x2_questype` VALUES (6, '问答题', 1, 3);

-- ----------------------------
-- Table structure for x2_record
-- ----------------------------
DROP TABLE IF EXISTS `x2_record`;
CREATE TABLE `x2_record`  (
  `recordid` int(11) NOT NULL AUTO_INCREMENT,
  `recordquestionid` int(11) NOT NULL DEFAULT 0,
  `recorduserid` int(11) NOT NULL DEFAULT 0,
  `recordquestion` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `recordtime` int(11) NOT NULL DEFAULT 0,
  `recordsubjectid` int(11) NOT NULL DEFAULT 0,
  `recordknowsid` int(11) NOT NULL DEFAULT 0,
  `recordquestype` int(11) NOT NULL DEFAULT 0,
  `recordexamid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`recordid`) USING BTREE,
  INDEX `recordquestionid`(`recordquestionid`, `recorduserid`, `recordtime`) USING BTREE,
  INDEX `recordsubjectid`(`recordsubjectid`, `recordknowsid`, `recordquestype`) USING BTREE,
  INDEX `recordexamid`(`recordexamid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x2_reply
-- ----------------------------
DROP TABLE IF EXISTS `x2_reply`;
CREATE TABLE `x2_reply`  (
  `replyid` int(11) NOT NULL AUTO_INCREMENT,
  `replyuserid` int(11) NOT NULL DEFAULT 0,
  `replyusername` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `replycommentid` int(11) NOT NULL DEFAULT 0,
  `replytime` int(11) NOT NULL DEFAULT 0,
  `replycontent` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`replyid`) USING BTREE,
  INDEX `replyuserid`(`replyuserid`, `replycommentid`, `replytime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x2_sections
-- ----------------------------
DROP TABLE IF EXISTS `x2_sections`;
CREATE TABLE `x2_sections`  (
  `sectionid` int(11) NOT NULL AUTO_INCREMENT,
  `section` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sectionsubjectid` int(11) NOT NULL DEFAULT 0,
  `sectiondescribe` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sectionsequence` int(11) NOT NULL,
  PRIMARY KEY (`sectionid`) USING BTREE,
  INDEX `section`(`section`) USING BTREE,
  INDEX `sectionsubjectid`(`sectionsubjectid`) USING BTREE,
  INDEX `sectionsequence`(`sectionsequence`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x2_sections
-- ----------------------------
INSERT INTO `x2_sections` VALUES (1, '第一章 反对外国侵略的斗争', 1, '', 0);
INSERT INTO `x2_sections` VALUES (2, '第二章 对国家出路的早期探索', 1, '', 0);
INSERT INTO `x2_sections` VALUES (3, '第三章 辛亥革命', 1, '', 0);
INSERT INTO `x2_sections` VALUES (4, '第四章 开天辟地的大事变', 1, '', 0);
INSERT INTO `x2_sections` VALUES (5, '第五章 中国革命的新道路', 1, '', 0);
INSERT INTO `x2_sections` VALUES (6, '第六章 中华民族的抗日战争', 1, '', 0);
INSERT INTO `x2_sections` VALUES (7, '第七章 为创建新中国而奋斗', 1, '', 0);
INSERT INTO `x2_sections` VALUES (8, '第八章 社会主义基本制度的全面确立', 1, '', 0);
INSERT INTO `x2_sections` VALUES (9, '第九章 社会主义建设在探索中曲折发展', 1, '', 0);
INSERT INTO `x2_sections` VALUES (10, '第十章 改革开放与现代化建设新时期', 1, '', 0);

-- ----------------------------
-- Table structure for x2_seminar
-- ----------------------------
DROP TABLE IF EXISTS `x2_seminar`;
CREATE TABLE `x2_seminar`  (
  `seminarid` int(11) NOT NULL AUTO_INCREMENT,
  `seminartitle` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `seminartags` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `seminarkeywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `seminarcatid` int(11) NOT NULL DEFAULT 0,
  `seminarthumb` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `seminarhref` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `seminargallery` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `seminargallerylink` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `seminarcode` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `seminarusername` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `seminarmodifier` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `seminardescribe` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `seminartime` int(11) NOT NULL DEFAULT 0,
  `seminarmodifytime` int(11) NOT NULL,
  `seminarstatus` int(1) NOT NULL DEFAULT 0,
  `seminarorder` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`seminarid`) USING BTREE,
  INDEX `seminarcatid`(`seminarcatid`) USING BTREE,
  INDEX `seminarstatus`(`seminarstatus`) USING BTREE,
  INDEX `seminartime`(`seminartime`) USING BTREE,
  INDEX `seminartags`(`seminartags`) USING BTREE,
  INDEX `seminarorder`(`seminarorder`) USING BTREE,
  FULLTEXT INDEX `seminarkeywords`(`seminarkeywords`)
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x2_seminar_content
-- ----------------------------
DROP TABLE IF EXISTS `x2_seminar_content`;
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
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x2_seminar_elem
-- ----------------------------
DROP TABLE IF EXISTS `x2_seminar_elem`;
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
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x2_seminar_layout
-- ----------------------------
DROP TABLE IF EXISTS `x2_seminar_layout`;
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
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x2_seminar_tpls
-- ----------------------------
DROP TABLE IF EXISTS `x2_seminar_tpls`;
CREATE TABLE `x2_seminar_tpls`  (
  `stplid` int(11) NOT NULL AUTO_INCREMENT,
  `stplname` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stpltype` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stplgrid` int(11) NULL DEFAULT NULL,
  `stpldescribe` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `stplcode` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`stplid`) USING BTREE,
  INDEX `stpltype`(`stpltype`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x2_session
-- ----------------------------
DROP TABLE IF EXISTS `x2_session`;
CREATE TABLE `x2_session`  (
  `sessionid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sessionuserid` int(11) NOT NULL DEFAULT 0,
  `sessionusername` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sessionpassword` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sessionip` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sessionmanage` tinyint(1) NULL DEFAULT 0,
  `sessiongroupid` int(11) NOT NULL DEFAULT 0,
  `sessioncurrent` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sessionrandcode` char(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sessionlogintime` int(11) NOT NULL DEFAULT 0,
  `sessiontimelimit` int(11) NOT NULL DEFAULT 0,
  `sessionlasttime` int(11) NOT NULL DEFAULT 0,
  `sessionmaster` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`sessionid`) USING BTREE,
  INDEX `sessionlasttime`(`sessionlasttime`) USING BTREE,
  INDEX `sessioncurrent`(`sessioncurrent`) USING BTREE,
  INDEX `sessionmaster`(`sessionmaster`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x2_session
-- ----------------------------
INSERT INTO `x2_session` VALUES ('d742c16143cd9384c97cdd2927798ab4', 1, 'peadmin', '244153a2599be7685c32d2281f57ae67', '192.168.1.4', 0, 1, '1', '', 1577625746, 1577625746, 1577687288, 0);

-- ----------------------------
-- Table structure for x2_subject
-- ----------------------------
DROP TABLE IF EXISTS `x2_subject`;
CREATE TABLE `x2_subject`  (
  `subjectid` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `subjectsetting` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`subjectid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x2_subject
-- ----------------------------
INSERT INTO `x2_subject` VALUES (1, '中国近现代史纲要', 'a:1:{s:9:\"questypes\";a:1:{i:1;s:1:\"1\";}}');
INSERT INTO `x2_subject` VALUES (2, '魔兽世界', 'a:1:{s:9:\"questypes\";a:6:{i:1;s:1:\"1\";i:2;s:1:\"1\";i:3;s:1:\"1\";i:4;s:1:\"1\";i:5;s:1:\"1\";i:6;s:1:\"1\";}}');

-- ----------------------------
-- Table structure for x2_user
-- ----------------------------
DROP TABLE IF EXISTS `x2_user`;
CREATE TABLE `x2_user`  (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `useropenid` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `useremail` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `userpassword` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `usercoin` int(11) NOT NULL DEFAULT 0,
  `userregip` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `userregtime` int(11) NOT NULL DEFAULT 0,
  `userlogtime` int(11) NOT NULL DEFAULT 0,
  `userverifytime` int(11) NULL DEFAULT NULL,
  `usergroupid` int(11) NOT NULL DEFAULT 0,
  `usermoduleid` int(11) NOT NULL DEFAULT 0,
  `useranswer` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `manager_apps` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `usertruename` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `normal_favor` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `teacher_subjects` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userprofile` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userpassport` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `usergender` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userphone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userdegree` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `useraddress` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userphoto` varchar(240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`userid`) USING BTREE,
  UNIQUE INDEX `useremail`(`useremail`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  INDEX `module`(`usercoin`) USING BTREE,
  INDEX `userregtime`(`userregtime`) USING BTREE,
  INDEX `usermoduleid`(`usermoduleid`) USING BTREE,
  INDEX `userlogtime`(`userlogtime`) USING BTREE,
  INDEX `useropenid`(`useropenid`) USING BTREE,
  INDEX `userphone`(`userphone`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x2_user
-- ----------------------------
INSERT INTO `x2_user` VALUES (1, '', 'peadmin', '7300637@qq.com', '244153a2599be7685c32d2281f57ae67', 205, '127.0.0.1', 1471795200, 0, NULL, 1, 0, NULL, 'a:5:{i:0;s:4:\"user\";i:1;s:7:\"content\";i:2;s:4:\"exam\";i:3;s:6:\"course\";i:4;s:4:\"bank\";}', 'test', '', '', '', '110120199506131234', '男', '19987654321', '', '河南省郑州市管城区某地', 'app/core/styles/img/noimage.gif');
INSERT INTO `x2_user` VALUES (2, '', '教师管理员', 'oiuv@qq.com', '0744ac91af5685219a1614ad196333da', 98, '127.0.0.1', 1471795200, 0, NULL, 9, 0, NULL, '', 'iuv', '', 'a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}', '有理想信念\r\n有道德情操\r\n有仁爱之心\r\n有扎实学识', '', '', '', '', '', 'app/core/styles/img/noimage.gif');

-- ----------------------------
-- Table structure for x2_user_group
-- ----------------------------
DROP TABLE IF EXISTS `x2_user_group`;
CREATE TABLE `x2_user_group`  (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `groupmoduleid` tinyint(4) NOT NULL DEFAULT 0,
  `groupdescribe` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `groupright` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `groupmoduledefault` int(1) NOT NULL DEFAULT 0,
  `groupdefault` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`groupid`) USING BTREE,
  INDEX `groupname`(`groupname`, `groupmoduleid`) USING BTREE,
  INDEX `groupmoduledefault`(`groupmoduledefault`) USING BTREE,
  INDEX `groupdefault`(`groupdefault`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of x2_user_group
-- ----------------------------
INSERT INTO `x2_user_group` VALUES (1, '管理员', 1, '管理员', '', 1, 0);
INSERT INTO `x2_user_group` VALUES (8, '普通用户', 9, '普通用户', '', 0, 1);
INSERT INTO `x2_user_group` VALUES (9, '教师', 12, '教师', '', 0, 0);

-- ----------------------------
-- Table structure for x2_wxlogin
-- ----------------------------
DROP TABLE IF EXISTS `x2_wxlogin`;
CREATE TABLE `x2_wxlogin`  (
  `wxsid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `wxinfo` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `wxtime` int(11) NOT NULL,
  `wxtoken` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`wxsid`) USING BTREE,
  INDEX `wxtime`(`wxtime`) USING BTREE,
  INDEX `wxtoken`(`wxtoken`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
