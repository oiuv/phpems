-- ----------------------------
-- Table structure for `x2_app`
-- ----------------------------
DROP TABLE IF EXISTS `x2_app`;
CREATE TABLE `x2_app` (
  `appid` varchar(24) NOT NULL,
  `appname` varchar(48) NOT NULL DEFAULT '',
  `appthumb` varchar(240) NOT NULL DEFAULT '',
  `appstatus` int(1) NOT NULL DEFAULT '0',
  `appsetting` text NOT NULL,
  PRIMARY KEY (`appid`),
  KEY `appstatus` (`appstatus`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_app
-- ----------------------------
INSERT INTO `x2_app` VALUES ('user', '用户模块', 'files/attach/images/content/20130401/13647895355562.png.png', '1', 'a:9:{s:11:\"closeregist\";s:1:\"0\";s:9:\"registype\";s:1:\"0\";s:11:\"managemodel\";s:1:\"0\";s:10:\"loginmodel\";s:1:\"1\";s:11:\"emailverify\";s:1:\"0\";s:12:\"emailaccount\";s:16:\"278768688@qq.com\";s:13:\"emailpassword\";s:0:\"\";s:9:\"regfields\";s:12:\"usertruename\";s:9:\"outfields\";s:12:\"usertruename\";}');
INSERT INTO `x2_app` VALUES ('exam', '考试模块', '*value*', '1', 'a:1:{s:3:\"seo\";a:3:{s:5:\"title\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:11:\"description\";s:0:\"\";}}');
INSERT INTO `x2_app` VALUES ('core', '模块管理', '*value*', '1', 'a:1:{s:3:\"seo\";a:3:{s:5:\"title\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:11:\"description\";s:0:\"\";}}');
INSERT INTO `x2_app` VALUES ('document', '文件模块', '*value*', '1', '');
INSERT INTO `x2_app` VALUES ('content', '内容模块', '*value*', '1', '');
INSERT INTO `x2_app` VALUES ('item', '商品模块', '', '1', 'a:1:{s:3:\"seo\";a:3:{s:5:\"title\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:11:\"description\";s:0:\"\";}}');
INSERT INTO `x2_app` VALUES ('bank', '财务模块', '*value*', '1', '');
INSERT INTO `x2_app` VALUES ('edu', '教务模块', 'app/core/styles/images/noimage.gif', '1', '');
INSERT INTO `x2_app` VALUES ('course', '课程模块', '*value*', '1', '');
INSERT INTO `x2_app` VALUES ('demo', '试听中心', '', '1', 'a:1:{s:3:\"seo\";a:3:{s:5:\"title\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:11:\"description\";s:0:\"\";}}');
INSERT INTO `x2_app` VALUES ('passport', '证书模块', 'app/core/styles/images/noimage.gif', '1', '');
INSERT INTO `x2_app` VALUES ('certificate', '证书模块', 'app/core/styles/images/noimage.gif', '1', '');
INSERT INTO `x2_app` VALUES ('docs', '文档模块', 'app/core/styles/images/noimage.gif', '1', '');

-- ----------------------------
-- Table structure for `x2_area`
-- ----------------------------
DROP TABLE IF EXISTS `x2_area`;
CREATE TABLE `x2_area` (
  `areaid` int(11) NOT NULL AUTO_INCREMENT,
  `area` varchar(120) NOT NULL DEFAULT '',
  `areacode` int(12) NOT NULL DEFAULT '0',
  `arealevel` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`areaid`),
  KEY `area` (`area`,`arealevel`),
  KEY `areacode` (`areacode`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_area
-- ----------------------------
INSERT INTO `x2_area` VALUES ('1', '全国', '1', '1');
INSERT INTO `x2_area` VALUES ('3', '河南', '373', '0');
INSERT INTO `x2_area` VALUES ('4', '北京', '10', '0');
INSERT INTO `x2_area` VALUES ('5', '陕西', '29', '0');
INSERT INTO `x2_area` VALUES ('6', '河北', '311', '0');
INSERT INTO `x2_area` VALUES ('7', '天津', '22', '0');
INSERT INTO `x2_area` VALUES ('8', '山东', '531', '0');
INSERT INTO `x2_area` VALUES ('9', '江苏', '25', '0');
INSERT INTO `x2_area` VALUES ('10', '湖北', '27', '0');
INSERT INTO `x2_area` VALUES ('11', '辽宁', '24', '0');
INSERT INTO `x2_area` VALUES ('12', '贵州', '851', '0');
INSERT INTO `x2_area` VALUES ('13', '北京春雪', '1001', '0');
INSERT INTO `x2_area` VALUES ('14', '云南', '871', '0');
INSERT INTO `x2_area` VALUES ('15', '四川', '28', '0');
INSERT INTO `x2_area` VALUES ('16', '安徽', '551', '0');
INSERT INTO `x2_area` VALUES ('17', '深圳', '755', '0');
INSERT INTO `x2_area` VALUES ('18', '吉林', '431', '0');
INSERT INTO `x2_area` VALUES ('19', '广东', '20', '0');
INSERT INTO `x2_area` VALUES ('20', '新疆', '991', '0');
INSERT INTO `x2_area` VALUES ('21', '广西', '771', '0');
INSERT INTO `x2_area` VALUES ('22', '福建', '591', '0');
INSERT INTO `x2_area` VALUES ('23', '湖南', '731', '0');
INSERT INTO `x2_area` VALUES ('24', '上海', '21', '0');
INSERT INTO `x2_area` VALUES ('25', '重庆', '23', '0');
INSERT INTO `x2_area` VALUES ('26', '江西', '791', '0');
INSERT INTO `x2_area` VALUES ('27', '浙江', '571', '0');
INSERT INTO `x2_area` VALUES ('28', '山西', '351', '0');

-- ----------------------------
-- Table structure for `x2_attach`
-- ----------------------------
DROP TABLE IF EXISTS `x2_attach`;
CREATE TABLE `x2_attach` (
  `attid` int(11) NOT NULL AUTO_INCREMENT,
  `attpath` varchar(240) NOT NULL DEFAULT '',
  `atttitle` varchar(240) NOT NULL DEFAULT '',
  `attext` varchar(12) NOT NULL DEFAULT '',
  `attinputtime` int(11) NOT NULL DEFAULT '0',
  `attsize` int(11) NOT NULL DEFAULT '0',
  `attmd5` varchar(32) NOT NULL DEFAULT '',
  `attuserid` int(11) NOT NULL DEFAULT '0',
  `attcntype` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`attid`),
  KEY `attext` (`attext`,`attinputtime`),
  KEY `attuserid` (`attuserid`),
  KEY `attcntype` (`attcntype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_attach
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_attachtype`
-- ----------------------------
DROP TABLE IF EXISTS `x2_attachtype`;
CREATE TABLE `x2_attachtype` (
  `atid` int(11) NOT NULL AUTO_INCREMENT,
  `attachtype` varchar(120) NOT NULL,
  `attachexts` tinytext NOT NULL,
  PRIMARY KEY (`atid`),
  KEY `attachtype` (`attachtype`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_attachtype
-- ----------------------------
INSERT INTO `x2_attachtype` VALUES ('1', '图片', 'jpg,png,gif,bmp');
INSERT INTO `x2_attachtype` VALUES ('2', '音频', 'mp3');
INSERT INTO `x2_attachtype` VALUES ('3', '多媒体', 'flv,wmv,mp4,avi');
INSERT INTO `x2_attachtype` VALUES ('4', '批量导入文件', 'csv');
INSERT INTO `x2_attachtype` VALUES ('5', '文字类', 'pdf');

-- ----------------------------
-- Table structure for `x2_basic`
-- ----------------------------
DROP TABLE IF EXISTS `x2_basic`;
CREATE TABLE `x2_basic` (
  `basicid` int(11) NOT NULL AUTO_INCREMENT,
  `basic` varchar(120) NOT NULL DEFAULT '',
  `basicareaid` int(4) NOT NULL DEFAULT '0',
  `basicsubjectid` int(11) NOT NULL DEFAULT '0',
  `basicsection` text NOT NULL,
  `basicknows` text NOT NULL,
  `basicexam` text NOT NULL,
  `basicapi` varchar(32) NOT NULL DEFAULT '',
  `basicdemo` int(1) NOT NULL DEFAULT '0',
  `basicthumb` varchar(240) NOT NULL DEFAULT '',
  `basicprice` tinytext NOT NULL,
  `basicclosed` int(1) NOT NULL DEFAULT '0',
  `basicdescribe` text NOT NULL,
  PRIMARY KEY (`basicid`),
  KEY `basicexamid` (`basicareaid`),
  KEY `basicsubjectid` (`basicsubjectid`),
  KEY `basicapi` (`basicapi`),
  KEY `basicdemo` (`basicdemo`),
  KEY `basicclosed` (`basicclosed`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_basic
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_block`
-- ----------------------------
DROP TABLE IF EXISTS `x2_block`;
CREATE TABLE `x2_block` (
  `blockid` int(11) NOT NULL AUTO_INCREMENT,
  `block` varchar(120) NOT NULL DEFAULT '',
  `blocktype` int(1) NOT NULL DEFAULT '0',
  `blockposition` varchar(120) NOT NULL DEFAULT '',
  `blockcontent` text NOT NULL,
  PRIMARY KEY (`blockid`),
  KEY `blocktype` (`blocktype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_block
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_book`
-- ----------------------------
DROP TABLE IF EXISTS `x2_book`;
CREATE TABLE `x2_book` (
  `bookid` int(11) NOT NULL AUTO_INCREMENT,
  `bookcontent` text CHARACTER SET latin1 NOT NULL,
  `bookopenid` varchar(48) CHARACTER SET latin1 NOT NULL,
  `booktime` int(11) NOT NULL,
  `bookuserid` int(11) NOT NULL,
  PRIMARY KEY (`bookid`),
  KEY `bookopenid` (`bookopenid`),
  KEY `booktime` (`booktime`),
  KEY `bookuserid` (`bookuserid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_book
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_category`
-- ----------------------------
DROP TABLE IF EXISTS `x2_category`;
CREATE TABLE `x2_category` (
  `catid` int(11) NOT NULL AUTO_INCREMENT,
  `catapp` varchar(24) NOT NULL DEFAULT '',
  `catlite` int(11) NOT NULL DEFAULT '0',
  `catname` varchar(240) NOT NULL DEFAULT '',
  `catimg` varchar(240) NOT NULL DEFAULT '',
  `caturl` varchar(120) NOT NULL DEFAULT '',
  `catuseurl` int(1) NOT NULL DEFAULT '0',
  `catparent` int(11) DEFAULT '0',
  `catdes` text NOT NULL,
  `cattpl` varchar(36) NOT NULL DEFAULT '',
  `catmanager` text NOT NULL,
  `catinmenu` int(1) NOT NULL DEFAULT '0',
  `catindex` int(4) NOT NULL DEFAULT '0',
  `catsubject` int(11) NOT NULL,
  PRIMARY KEY (`catid`),
  KEY `catlite` (`catlite`,`catparent`),
  KEY `catappid` (`catapp`),
  KEY `catuseurl` (`catuseurl`),
  KEY `catinmenu` (`catinmenu`,`catindex`),
  KEY `catsubject` (`catsubject`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_category
-- ----------------------------
INSERT INTO `x2_category` VALUES ('1', 'content', '0', '考试信息', 'files/attach/images/content/20160630/14672817197914.jpg', '', '0', '0', '', 'category_default', 'a:2:{s:8:\"pubusers\";s:0:\"\";s:9:\"pubgroups\";s:0:\"\";}', '1', '1', '1');
INSERT INTO `x2_category` VALUES ('2', 'content', '0', '首页头图', 'files/attach/images/content/20160630/14672817455479.jpg', '', '0', '0', '', 'category_default', 'a:2:{s:8:\"pubusers\";s:0:\"\";s:9:\"pubgroups\";s:0:\"\";}', '1', '100', '1');
INSERT INTO `x2_category` VALUES ('3', 'content', '0', '考试资料', 'files/attach/images/content/20160630/14672817048286.jpg', '', '0', '0', '', 'category_default', 'a:2:{s:8:\"pubusers\";s:0:\"\";s:9:\"pubgroups\";s:0:\"\";}', '1', '5', '1');
INSERT INTO `x2_category` VALUES ('4', 'content', '0', '帮助信息', 'files/attach/images/content/20160630/14672817317018.jpg', '', '0', '0', '&lt;h1 class=&quot;wikititle&quot;&gt;区委区为企鹅&lt;/h1&gt;\r\n\r\n&lt;h2 class=&quot;wikititle&quot;&gt;这是一个什么段落&lt;/h2&gt;', 'category_default', 'a:2:{s:8:\"pubusers\";s:0:\"\";s:9:\"pubgroups\";s:0:\"\";}', '0', '5', '1');
INSERT INTO `x2_category` VALUES ('5', 'course', '0', '会计基础', 'files/attach/images/content/20180709/15311345313268.png', '', '0', '0', '', 'category_default', 'a:2:{s:8:\"pubusers\";s:0:\"\";s:9:\"pubgroups\";s:0:\"\";}', '0', '10', '0');
INSERT INTO `x2_category` VALUES ('11', 'content', '0', '二级分类', 'app/core/styles/images/noimage.gif', '', '0', '4', '', 'category_default', 'a:2:{s:8:\\\"pubusers\\\";s:0:\\\"\\\";s:9:\\\"pubgroups\\\";s:0:\\\"\\\";}', '0', '0', '0');
INSERT INTO `x2_category` VALUES ('12', 'docs', '0', '人物', 'app/core/styles/images/noimage.gif', '', '0', '0', '', 'category_default', 'a:2:{s:8:\\\"pubusers\\\";s:0:\\\"\\\";s:9:\\\"pubgroups\\\";s:0:\\\"\\\";}', '0', '0', '0');

-- ----------------------------
-- Table structure for `x2_cequeue`
-- ----------------------------
DROP TABLE IF EXISTS `x2_cequeue`;
CREATE TABLE `x2_cequeue` (
  `ceqid` int(11) NOT NULL AUTO_INCREMENT,
  `ceqceid` int(11) NOT NULL,
  `cequserid` int(11) NOT NULL,
  `ceqinfo` text NOT NULL,
  `ceqtime` int(11) NOT NULL,
  `ceqstatus` tinyint(1) NOT NULL,
  `ceqordersn` varchar(48) DEFAULT NULL,
  `ceqpubtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`ceqid`),
  KEY `cequserid` (`cequserid`),
  KEY `ceqtime` (`ceqtime`),
  KEY `ceqstatus` (`ceqstatus`),
  KEY `ceqordersn` (`ceqordersn`),
  KEY `ceqceid` (`ceqceid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_cequeue
-- ----------------------------
INSERT INTO `x2_cequeue` VALUES ('1', '1', '1', 'a:7:{s:8:\"username\";s:7:\"peadmin\";s:5:\"photo\";s:55:\"files/attach/images/content/20170717/15002573305180.png\";s:12:\"usertruename\";s:4:\"test\";s:7:\"usersex\";N;s:10:\"userdegree\";N;s:9:\"userphone\";N;s:11:\"useraddress\";N;}', '1514358059', '0', '', null);
INSERT INTO `x2_cequeue` VALUES ('2', '1', '1', 'a:7:{s:8:\"username\";s:7:\"peadmin\";s:5:\"photo\";s:55:\"files/attach/images/content/20170717/15002573305180.png\";s:12:\"usertruename\";s:4:\"test\";s:7:\"usersex\";N;s:10:\"userdegree\";N;s:9:\"userphone\";N;s:11:\"useraddress\";N;}', '1514358861', '0', '', null);
INSERT INTO `x2_cequeue` VALUES ('3', '1', '1', 'a:7:{s:8:\"username\";s:7:\"peadmin\";s:5:\"photo\";s:55:\"files/attach/images/content/20170717/15002573305180.png\";s:12:\"usertruename\";s:4:\"test\";s:7:\"usersex\";N;s:10:\"userdegree\";N;s:9:\"userphone\";N;s:11:\"useraddress\";N;}', '1514358875', '2', '', null);
INSERT INTO `x2_cequeue` VALUES ('4', '1', '1', 'a:7:{s:8:\"username\";s:7:\"peadmin\";s:5:\"photo\";N;s:12:\"usertruename\";s:4:\"test\";s:7:\"usersex\";N;s:10:\"userdegree\";s:6:\"本科\";s:9:\"userphone\";s:11:\"13456789234\";s:11:\"useraddress\";s:33:\"河南省郑州市管城区某地\";}', '1531133669', '0', '', '0');
INSERT INTO `x2_cequeue` VALUES ('5', '1', '1', 'a:7:{s:8:\"username\";s:7:\"peadmin\";s:5:\"photo\";N;s:12:\"usertruename\";s:4:\"test\";s:7:\"usersex\";N;s:10:\"userdegree\";s:6:\"本科\";s:9:\"userphone\";s:11:\"13456789234\";s:11:\"useraddress\";s:33:\"河南省郑州市管城区某地\";}', '1531133686', '0', '', '0');
INSERT INTO `x2_cequeue` VALUES ('6', '1', '1', 'a:7:{s:8:\"username\";s:7:\"peadmin\";s:5:\"photo\";N;s:12:\"usertruename\";s:4:\"test\";s:7:\"usersex\";N;s:10:\"userdegree\";s:6:\"本科\";s:9:\"userphone\";s:11:\"13456789234\";s:11:\"useraddress\";s:33:\"河南省郑州市管城区某地\";}', '1531134023', '0', '', '0');
INSERT INTO `x2_cequeue` VALUES ('7', '1', '1', 'a:7:{s:8:\"username\";s:7:\"peadmin\";s:5:\"photo\";N;s:12:\"usertruename\";s:4:\"test\";s:7:\"usersex\";N;s:10:\"userdegree\";s:6:\"本科\";s:9:\"userphone\";s:11:\"13456789234\";s:11:\"useraddress\";s:33:\"河南省郑州市管城区某地\";}', '1531194290', '0', '', '0');

-- ----------------------------
-- Table structure for `x2_certificate`
-- ----------------------------
DROP TABLE IF EXISTS `x2_certificate`;
CREATE TABLE `x2_certificate` (
  `ceid` int(11) NOT NULL AUTO_INCREMENT,
  `cetitle` varchar(72) NOT NULL,
  `cethumb` varchar(120) DEFAULT NULL,
  `ceprice` int(10) NOT NULL,
  `cebasic` int(11) DEFAULT NULL,
  `cetime` int(11) DEFAULT NULL,
  `cedescribe` text NOT NULL,
  PRIMARY KEY (`ceid`),
  KEY `cebasic` (`cebasic`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_certificate
-- ----------------------------
INSERT INTO `x2_certificate` VALUES ('1', '会计资格证', 'files/attach/images/content/20170912/15051466611226.jpg', '1', '1', '1506817500', '&lt;p&gt;会计资格证&lt;/p&gt;');
INSERT INTO `x2_certificate` VALUES ('2', '教师资格证', 'files/attach/images/content/20170912/15051474405023.jpg', '500', null, '1505147429', '&lt;p&gt;教师资格证&lt;/p&gt;');
INSERT INTO `x2_certificate` VALUES ('3', '2222', 'app/core/styles/images/noimage.gif', '1', '1', '1514867919', '&lt;p&gt;1&lt;/p&gt;');

-- ----------------------------
-- Table structure for `x2_city`
-- ----------------------------
DROP TABLE IF EXISTS `x2_city`;
CREATE TABLE `x2_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cityid` varchar(6) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `father` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cityid` (`cityid`),
  KEY `father` (`father`)
) ENGINE=MyISAM AUTO_INCREMENT=371 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_city
-- ----------------------------
INSERT INTO `x2_city` VALUES ('1', '110100', '北京市', '110000');
INSERT INTO `x2_city` VALUES ('3', '120100', '天津市', '120000');
INSERT INTO `x2_city` VALUES ('5', '130100', '石家庄市', '130000');
INSERT INTO `x2_city` VALUES ('6', '130200', '唐山市', '130000');
INSERT INTO `x2_city` VALUES ('7', '130300', '秦皇岛市', '130000');
INSERT INTO `x2_city` VALUES ('8', '130400', '邯郸市', '130000');
INSERT INTO `x2_city` VALUES ('9', '130500', '邢台市', '130000');
INSERT INTO `x2_city` VALUES ('10', '130600', '保定市', '130000');
INSERT INTO `x2_city` VALUES ('11', '130700', '张家口市', '130000');
INSERT INTO `x2_city` VALUES ('12', '130800', '承德市', '130000');
INSERT INTO `x2_city` VALUES ('13', '130900', '沧州市', '130000');
INSERT INTO `x2_city` VALUES ('14', '131000', '廊坊市', '130000');
INSERT INTO `x2_city` VALUES ('15', '131100', '衡水市', '130000');
INSERT INTO `x2_city` VALUES ('16', '140100', '太原市', '140000');
INSERT INTO `x2_city` VALUES ('17', '140200', '大同市', '140000');
INSERT INTO `x2_city` VALUES ('18', '140300', '阳泉市', '140000');
INSERT INTO `x2_city` VALUES ('19', '140400', '长治市', '140000');
INSERT INTO `x2_city` VALUES ('20', '140500', '晋城市', '140000');
INSERT INTO `x2_city` VALUES ('21', '140600', '朔州市', '140000');
INSERT INTO `x2_city` VALUES ('22', '140700', '晋中市', '140000');
INSERT INTO `x2_city` VALUES ('23', '140800', '运城市', '140000');
INSERT INTO `x2_city` VALUES ('24', '140900', '忻州市', '140000');
INSERT INTO `x2_city` VALUES ('25', '141000', '临汾市', '140000');
INSERT INTO `x2_city` VALUES ('26', '141100', '吕梁市', '140000');
INSERT INTO `x2_city` VALUES ('27', '150100', '呼和浩特市', '150000');
INSERT INTO `x2_city` VALUES ('28', '150200', '包头市', '150000');
INSERT INTO `x2_city` VALUES ('29', '150300', '乌海市', '150000');
INSERT INTO `x2_city` VALUES ('30', '150400', '赤峰市', '150000');
INSERT INTO `x2_city` VALUES ('31', '150500', '通辽市', '150000');
INSERT INTO `x2_city` VALUES ('32', '150600', '鄂尔多斯市', '150000');
INSERT INTO `x2_city` VALUES ('33', '150700', '呼伦贝尔市', '150000');
INSERT INTO `x2_city` VALUES ('34', '150800', '巴彦淖尔市', '150000');
INSERT INTO `x2_city` VALUES ('35', '150900', '乌兰察布市', '150000');
INSERT INTO `x2_city` VALUES ('36', '152200', '兴安盟', '150000');
INSERT INTO `x2_city` VALUES ('37', '152500', '锡林郭勒盟', '150000');
INSERT INTO `x2_city` VALUES ('38', '152900', '阿拉善盟', '150000');
INSERT INTO `x2_city` VALUES ('39', '210100', '沈阳市', '210000');
INSERT INTO `x2_city` VALUES ('40', '210200', '大连市', '210000');
INSERT INTO `x2_city` VALUES ('41', '210300', '鞍山市', '210000');
INSERT INTO `x2_city` VALUES ('42', '210400', '抚顺市', '210000');
INSERT INTO `x2_city` VALUES ('43', '210500', '本溪市', '210000');
INSERT INTO `x2_city` VALUES ('44', '210600', '丹东市', '210000');
INSERT INTO `x2_city` VALUES ('45', '210700', '锦州市', '210000');
INSERT INTO `x2_city` VALUES ('46', '210800', '营口市', '210000');
INSERT INTO `x2_city` VALUES ('47', '210900', '阜新市', '210000');
INSERT INTO `x2_city` VALUES ('48', '211000', '辽阳市', '210000');
INSERT INTO `x2_city` VALUES ('49', '211100', '盘锦市', '210000');
INSERT INTO `x2_city` VALUES ('50', '211200', '铁岭市', '210000');
INSERT INTO `x2_city` VALUES ('51', '211300', '朝阳市', '210000');
INSERT INTO `x2_city` VALUES ('52', '211400', '葫芦岛市', '210000');
INSERT INTO `x2_city` VALUES ('53', '220100', '长春市', '220000');
INSERT INTO `x2_city` VALUES ('54', '220200', '吉林市', '220000');
INSERT INTO `x2_city` VALUES ('55', '220300', '四平市', '220000');
INSERT INTO `x2_city` VALUES ('56', '220400', '辽源市', '220000');
INSERT INTO `x2_city` VALUES ('57', '220500', '通化市', '220000');
INSERT INTO `x2_city` VALUES ('58', '220600', '白山市', '220000');
INSERT INTO `x2_city` VALUES ('59', '220700', '松原市', '220000');
INSERT INTO `x2_city` VALUES ('60', '220800', '白城市', '220000');
INSERT INTO `x2_city` VALUES ('61', '222400', '延边朝鲜族自治州', '220000');
INSERT INTO `x2_city` VALUES ('62', '230100', '哈尔滨市', '230000');
INSERT INTO `x2_city` VALUES ('63', '230200', '齐齐哈尔市', '230000');
INSERT INTO `x2_city` VALUES ('64', '230300', '鸡西市', '230000');
INSERT INTO `x2_city` VALUES ('65', '230400', '鹤岗市', '230000');
INSERT INTO `x2_city` VALUES ('66', '230500', '双鸭山市', '230000');
INSERT INTO `x2_city` VALUES ('67', '230600', '大庆市', '230000');
INSERT INTO `x2_city` VALUES ('68', '230700', '伊春市', '230000');
INSERT INTO `x2_city` VALUES ('69', '230800', '佳木斯市', '230000');
INSERT INTO `x2_city` VALUES ('70', '230900', '七台河市', '230000');
INSERT INTO `x2_city` VALUES ('71', '231000', '牡丹江市', '230000');
INSERT INTO `x2_city` VALUES ('72', '231100', '黑河市', '230000');
INSERT INTO `x2_city` VALUES ('73', '231200', '绥化市', '230000');
INSERT INTO `x2_city` VALUES ('74', '232700', '大兴安岭地区', '230000');
INSERT INTO `x2_city` VALUES ('75', '310100', '上海市', '310000');
INSERT INTO `x2_city` VALUES ('77', '320100', '南京市', '320000');
INSERT INTO `x2_city` VALUES ('78', '320200', '无锡市', '320000');
INSERT INTO `x2_city` VALUES ('79', '320300', '徐州市', '320000');
INSERT INTO `x2_city` VALUES ('80', '320400', '常州市', '320000');
INSERT INTO `x2_city` VALUES ('81', '320500', '苏州市', '320000');
INSERT INTO `x2_city` VALUES ('82', '320600', '南通市', '320000');
INSERT INTO `x2_city` VALUES ('83', '320700', '连云港市', '320000');
INSERT INTO `x2_city` VALUES ('84', '320800', '淮安市', '320000');
INSERT INTO `x2_city` VALUES ('85', '320900', '盐城市', '320000');
INSERT INTO `x2_city` VALUES ('86', '321000', '扬州市', '320000');
INSERT INTO `x2_city` VALUES ('87', '321100', '镇江市', '320000');
INSERT INTO `x2_city` VALUES ('88', '321200', '泰州市', '320000');
INSERT INTO `x2_city` VALUES ('89', '321300', '宿迁市', '320000');
INSERT INTO `x2_city` VALUES ('90', '330100', '杭州市', '330000');
INSERT INTO `x2_city` VALUES ('91', '330200', '宁波市', '330000');
INSERT INTO `x2_city` VALUES ('92', '330300', '温州市', '330000');
INSERT INTO `x2_city` VALUES ('93', '330400', '嘉兴市', '330000');
INSERT INTO `x2_city` VALUES ('94', '330500', '湖州市', '330000');
INSERT INTO `x2_city` VALUES ('95', '330600', '绍兴市', '330000');
INSERT INTO `x2_city` VALUES ('96', '330700', '金华市', '330000');
INSERT INTO `x2_city` VALUES ('97', '330800', '衢州市', '330000');
INSERT INTO `x2_city` VALUES ('98', '330900', '舟山市', '330000');
INSERT INTO `x2_city` VALUES ('99', '331000', '台州市', '330000');
INSERT INTO `x2_city` VALUES ('100', '331100', '丽水市', '330000');
INSERT INTO `x2_city` VALUES ('101', '340100', '合肥市', '340000');
INSERT INTO `x2_city` VALUES ('102', '340200', '芜湖市', '340000');
INSERT INTO `x2_city` VALUES ('103', '340300', '蚌埠市', '340000');
INSERT INTO `x2_city` VALUES ('104', '340400', '淮南市', '340000');
INSERT INTO `x2_city` VALUES ('105', '340500', '马鞍山市', '340000');
INSERT INTO `x2_city` VALUES ('106', '340600', '淮北市', '340000');
INSERT INTO `x2_city` VALUES ('107', '340700', '铜陵市', '340000');
INSERT INTO `x2_city` VALUES ('108', '340800', '安庆市', '340000');
INSERT INTO `x2_city` VALUES ('109', '341000', '黄山市', '340000');
INSERT INTO `x2_city` VALUES ('110', '341100', '滁州市', '340000');
INSERT INTO `x2_city` VALUES ('111', '341200', '阜阳市', '340000');
INSERT INTO `x2_city` VALUES ('112', '341300', '宿州市', '340000');
INSERT INTO `x2_city` VALUES ('113', '341400', '巢湖市', '340000');
INSERT INTO `x2_city` VALUES ('114', '341500', '六安市', '340000');
INSERT INTO `x2_city` VALUES ('115', '341600', '亳州市', '340000');
INSERT INTO `x2_city` VALUES ('116', '341700', '池州市', '340000');
INSERT INTO `x2_city` VALUES ('117', '341800', '宣城市', '340000');
INSERT INTO `x2_city` VALUES ('118', '350100', '福州市', '350000');
INSERT INTO `x2_city` VALUES ('119', '350200', '厦门市', '350000');
INSERT INTO `x2_city` VALUES ('120', '350300', '莆田市', '350000');
INSERT INTO `x2_city` VALUES ('121', '350400', '三明市', '350000');
INSERT INTO `x2_city` VALUES ('122', '350500', '泉州市', '350000');
INSERT INTO `x2_city` VALUES ('123', '350600', '漳州市', '350000');
INSERT INTO `x2_city` VALUES ('124', '350700', '南平市', '350000');
INSERT INTO `x2_city` VALUES ('125', '350800', '龙岩市', '350000');
INSERT INTO `x2_city` VALUES ('126', '350900', '宁德市', '350000');
INSERT INTO `x2_city` VALUES ('127', '360100', '南昌市', '360000');
INSERT INTO `x2_city` VALUES ('128', '360200', '景德镇市', '360000');
INSERT INTO `x2_city` VALUES ('129', '360300', '萍乡市', '360000');
INSERT INTO `x2_city` VALUES ('130', '360400', '九江市', '360000');
INSERT INTO `x2_city` VALUES ('131', '360500', '新余市', '360000');
INSERT INTO `x2_city` VALUES ('132', '360600', '鹰潭市', '360000');
INSERT INTO `x2_city` VALUES ('133', '360700', '赣州市', '360000');
INSERT INTO `x2_city` VALUES ('134', '360800', '吉安市', '360000');
INSERT INTO `x2_city` VALUES ('135', '360900', '宜春市', '360000');
INSERT INTO `x2_city` VALUES ('136', '361000', '抚州市', '360000');
INSERT INTO `x2_city` VALUES ('137', '361100', '上饶市', '360000');
INSERT INTO `x2_city` VALUES ('138', '370100', '济南市', '370000');
INSERT INTO `x2_city` VALUES ('139', '370200', '青岛市', '370000');
INSERT INTO `x2_city` VALUES ('140', '370300', '淄博市', '370000');
INSERT INTO `x2_city` VALUES ('141', '370400', '枣庄市', '370000');
INSERT INTO `x2_city` VALUES ('142', '370500', '东营市', '370000');
INSERT INTO `x2_city` VALUES ('143', '370600', '烟台市', '370000');
INSERT INTO `x2_city` VALUES ('144', '370700', '潍坊市', '370000');
INSERT INTO `x2_city` VALUES ('145', '370800', '济宁市', '370000');
INSERT INTO `x2_city` VALUES ('146', '370900', '泰安市', '370000');
INSERT INTO `x2_city` VALUES ('147', '371000', '威海市', '370000');
INSERT INTO `x2_city` VALUES ('148', '371100', '日照市', '370000');
INSERT INTO `x2_city` VALUES ('149', '371200', '莱芜市', '370000');
INSERT INTO `x2_city` VALUES ('150', '371300', '临沂市', '370000');
INSERT INTO `x2_city` VALUES ('151', '371400', '德州市', '370000');
INSERT INTO `x2_city` VALUES ('152', '371500', '聊城市', '370000');
INSERT INTO `x2_city` VALUES ('153', '371600', '滨州市', '370000');
INSERT INTO `x2_city` VALUES ('154', '371700', '荷泽市', '370000');
INSERT INTO `x2_city` VALUES ('155', '410100', '郑州市', '410000');
INSERT INTO `x2_city` VALUES ('156', '410200', '开封市', '410000');
INSERT INTO `x2_city` VALUES ('157', '410300', '洛阳市', '410000');
INSERT INTO `x2_city` VALUES ('158', '410400', '平顶山市', '410000');
INSERT INTO `x2_city` VALUES ('159', '410500', '安阳市', '410000');
INSERT INTO `x2_city` VALUES ('160', '410600', '鹤壁市', '410000');
INSERT INTO `x2_city` VALUES ('161', '410700', '新乡市', '410000');
INSERT INTO `x2_city` VALUES ('162', '410800', '焦作市', '410000');
INSERT INTO `x2_city` VALUES ('163', '410900', '濮阳市', '410000');
INSERT INTO `x2_city` VALUES ('164', '411000', '许昌市', '410000');
INSERT INTO `x2_city` VALUES ('165', '411100', '漯河市', '410000');
INSERT INTO `x2_city` VALUES ('166', '411200', '三门峡市', '410000');
INSERT INTO `x2_city` VALUES ('167', '411300', '南阳市', '410000');
INSERT INTO `x2_city` VALUES ('168', '411400', '商丘市', '410000');
INSERT INTO `x2_city` VALUES ('169', '411500', '信阳市', '410000');
INSERT INTO `x2_city` VALUES ('170', '411600', '周口市', '410000');
INSERT INTO `x2_city` VALUES ('171', '411700', '驻马店市', '410000');
INSERT INTO `x2_city` VALUES ('172', '420100', '武汉市', '420000');
INSERT INTO `x2_city` VALUES ('173', '420200', '黄石市', '420000');
INSERT INTO `x2_city` VALUES ('174', '420300', '十堰市', '420000');
INSERT INTO `x2_city` VALUES ('175', '420500', '宜昌市', '420000');
INSERT INTO `x2_city` VALUES ('176', '420600', '襄樊市', '420000');
INSERT INTO `x2_city` VALUES ('177', '420700', '鄂州市', '420000');
INSERT INTO `x2_city` VALUES ('178', '420800', '荆门市', '420000');
INSERT INTO `x2_city` VALUES ('179', '420900', '孝感市', '420000');
INSERT INTO `x2_city` VALUES ('180', '421000', '荆州市', '420000');
INSERT INTO `x2_city` VALUES ('181', '421100', '黄冈市', '420000');
INSERT INTO `x2_city` VALUES ('182', '421200', '咸宁市', '420000');
INSERT INTO `x2_city` VALUES ('183', '421300', '随州市', '420000');
INSERT INTO `x2_city` VALUES ('184', '422800', '恩施土家族苗族自治州', '420000');
INSERT INTO `x2_city` VALUES ('185', '429000', '省直辖行政单位', '420000');
INSERT INTO `x2_city` VALUES ('186', '430100', '长沙市', '430000');
INSERT INTO `x2_city` VALUES ('187', '430200', '株洲市', '430000');
INSERT INTO `x2_city` VALUES ('188', '430300', '湘潭市', '430000');
INSERT INTO `x2_city` VALUES ('189', '430400', '衡阳市', '430000');
INSERT INTO `x2_city` VALUES ('190', '430500', '邵阳市', '430000');
INSERT INTO `x2_city` VALUES ('191', '430600', '岳阳市', '430000');
INSERT INTO `x2_city` VALUES ('192', '430700', '常德市', '430000');
INSERT INTO `x2_city` VALUES ('193', '430800', '张家界市', '430000');
INSERT INTO `x2_city` VALUES ('194', '430900', '益阳市', '430000');
INSERT INTO `x2_city` VALUES ('195', '431000', '郴州市', '430000');
INSERT INTO `x2_city` VALUES ('196', '431100', '永州市', '430000');
INSERT INTO `x2_city` VALUES ('197', '431200', '怀化市', '430000');
INSERT INTO `x2_city` VALUES ('198', '431300', '娄底市', '430000');
INSERT INTO `x2_city` VALUES ('199', '433100', '湘西土家族苗族自治州', '430000');
INSERT INTO `x2_city` VALUES ('200', '440100', '广州市', '440000');
INSERT INTO `x2_city` VALUES ('201', '440200', '韶关市', '440000');
INSERT INTO `x2_city` VALUES ('202', '440300', '深圳市', '440000');
INSERT INTO `x2_city` VALUES ('203', '440400', '珠海市', '440000');
INSERT INTO `x2_city` VALUES ('204', '440500', '汕头市', '440000');
INSERT INTO `x2_city` VALUES ('205', '440600', '佛山市', '440000');
INSERT INTO `x2_city` VALUES ('206', '440700', '江门市', '440000');
INSERT INTO `x2_city` VALUES ('207', '440800', '湛江市', '440000');
INSERT INTO `x2_city` VALUES ('208', '440900', '茂名市', '440000');
INSERT INTO `x2_city` VALUES ('209', '441200', '肇庆市', '440000');
INSERT INTO `x2_city` VALUES ('210', '441300', '惠州市', '440000');
INSERT INTO `x2_city` VALUES ('211', '441400', '梅州市', '440000');
INSERT INTO `x2_city` VALUES ('212', '441500', '汕尾市', '440000');
INSERT INTO `x2_city` VALUES ('213', '441600', '河源市', '440000');
INSERT INTO `x2_city` VALUES ('214', '441700', '阳江市', '440000');
INSERT INTO `x2_city` VALUES ('215', '441800', '清远市', '440000');
INSERT INTO `x2_city` VALUES ('216', '441900', '东莞市', '440000');
INSERT INTO `x2_city` VALUES ('217', '442000', '中山市', '440000');
INSERT INTO `x2_city` VALUES ('218', '445100', '潮州市', '440000');
INSERT INTO `x2_city` VALUES ('219', '445200', '揭阳市', '440000');
INSERT INTO `x2_city` VALUES ('220', '445300', '云浮市', '440000');
INSERT INTO `x2_city` VALUES ('221', '450100', '南宁市', '450000');
INSERT INTO `x2_city` VALUES ('222', '450200', '柳州市', '450000');
INSERT INTO `x2_city` VALUES ('223', '450300', '桂林市', '450000');
INSERT INTO `x2_city` VALUES ('224', '450400', '梧州市', '450000');
INSERT INTO `x2_city` VALUES ('225', '450500', '北海市', '450000');
INSERT INTO `x2_city` VALUES ('226', '450600', '防城港市', '450000');
INSERT INTO `x2_city` VALUES ('227', '450700', '钦州市', '450000');
INSERT INTO `x2_city` VALUES ('228', '450800', '贵港市', '450000');
INSERT INTO `x2_city` VALUES ('229', '450900', '玉林市', '450000');
INSERT INTO `x2_city` VALUES ('230', '451000', '百色市', '450000');
INSERT INTO `x2_city` VALUES ('231', '451100', '贺州市', '450000');
INSERT INTO `x2_city` VALUES ('232', '451200', '河池市', '450000');
INSERT INTO `x2_city` VALUES ('233', '451300', '来宾市', '450000');
INSERT INTO `x2_city` VALUES ('234', '451400', '崇左市', '450000');
INSERT INTO `x2_city` VALUES ('235', '460100', '海口市', '460000');
INSERT INTO `x2_city` VALUES ('236', '460200', '三亚市', '460000');
INSERT INTO `x2_city` VALUES ('237', '469000', '省直辖县级行政单位', '460000');
INSERT INTO `x2_city` VALUES ('238', '500100', '重庆市', '500000');
INSERT INTO `x2_city` VALUES ('241', '510100', '成都市', '510000');
INSERT INTO `x2_city` VALUES ('242', '510300', '自贡市', '510000');
INSERT INTO `x2_city` VALUES ('243', '510400', '攀枝花市', '510000');
INSERT INTO `x2_city` VALUES ('244', '510500', '泸州市', '510000');
INSERT INTO `x2_city` VALUES ('245', '510600', '德阳市', '510000');
INSERT INTO `x2_city` VALUES ('246', '510700', '绵阳市', '510000');
INSERT INTO `x2_city` VALUES ('247', '510800', '广元市', '510000');
INSERT INTO `x2_city` VALUES ('248', '510900', '遂宁市', '510000');
INSERT INTO `x2_city` VALUES ('249', '511000', '内江市', '510000');
INSERT INTO `x2_city` VALUES ('250', '511100', '乐山市', '510000');
INSERT INTO `x2_city` VALUES ('251', '511300', '南充市', '510000');
INSERT INTO `x2_city` VALUES ('252', '511400', '眉山市', '510000');
INSERT INTO `x2_city` VALUES ('253', '511500', '宜宾市', '510000');
INSERT INTO `x2_city` VALUES ('254', '511600', '广安市', '510000');
INSERT INTO `x2_city` VALUES ('255', '511700', '达州市', '510000');
INSERT INTO `x2_city` VALUES ('256', '511800', '雅安市', '510000');
INSERT INTO `x2_city` VALUES ('257', '511900', '巴中市', '510000');
INSERT INTO `x2_city` VALUES ('258', '512000', '资阳市', '510000');
INSERT INTO `x2_city` VALUES ('259', '513200', '阿坝藏族羌族自治州', '510000');
INSERT INTO `x2_city` VALUES ('260', '513300', '甘孜藏族自治州', '510000');
INSERT INTO `x2_city` VALUES ('261', '513400', '凉山彝族自治州', '510000');
INSERT INTO `x2_city` VALUES ('262', '520100', '贵阳市', '520000');
INSERT INTO `x2_city` VALUES ('263', '520200', '六盘水市', '520000');
INSERT INTO `x2_city` VALUES ('264', '520300', '遵义市', '520000');
INSERT INTO `x2_city` VALUES ('265', '520400', '安顺市', '520000');
INSERT INTO `x2_city` VALUES ('266', '522200', '铜仁地区', '520000');
INSERT INTO `x2_city` VALUES ('267', '522300', '黔西南布依族苗族自治州', '520000');
INSERT INTO `x2_city` VALUES ('268', '522400', '毕节地区', '520000');
INSERT INTO `x2_city` VALUES ('269', '522600', '黔东南苗族侗族自治州', '520000');
INSERT INTO `x2_city` VALUES ('270', '522700', '黔南布依族苗族自治州', '520000');
INSERT INTO `x2_city` VALUES ('271', '530100', '昆明市', '530000');
INSERT INTO `x2_city` VALUES ('272', '530300', '曲靖市', '530000');
INSERT INTO `x2_city` VALUES ('273', '530400', '玉溪市', '530000');
INSERT INTO `x2_city` VALUES ('274', '530500', '保山市', '530000');
INSERT INTO `x2_city` VALUES ('275', '530600', '昭通市', '530000');
INSERT INTO `x2_city` VALUES ('276', '530700', '丽江市', '530000');
INSERT INTO `x2_city` VALUES ('277', '530800', '思茅市', '530000');
INSERT INTO `x2_city` VALUES ('278', '530900', '临沧市', '530000');
INSERT INTO `x2_city` VALUES ('279', '532300', '楚雄彝族自治州', '530000');
INSERT INTO `x2_city` VALUES ('280', '532500', '红河哈尼族彝族自治州', '530000');
INSERT INTO `x2_city` VALUES ('281', '532600', '文山壮族苗族自治州', '530000');
INSERT INTO `x2_city` VALUES ('282', '532800', '西双版纳傣族自治州', '530000');
INSERT INTO `x2_city` VALUES ('283', '532900', '大理白族自治州', '530000');
INSERT INTO `x2_city` VALUES ('284', '533100', '德宏傣族景颇族自治州', '530000');
INSERT INTO `x2_city` VALUES ('285', '533300', '怒江傈僳族自治州', '530000');
INSERT INTO `x2_city` VALUES ('286', '533400', '迪庆藏族自治州', '530000');
INSERT INTO `x2_city` VALUES ('287', '540100', '拉萨市', '540000');
INSERT INTO `x2_city` VALUES ('288', '542100', '昌都地区', '540000');
INSERT INTO `x2_city` VALUES ('289', '542200', '山南地区', '540000');
INSERT INTO `x2_city` VALUES ('290', '542300', '日喀则地区', '540000');
INSERT INTO `x2_city` VALUES ('291', '542400', '那曲地区', '540000');
INSERT INTO `x2_city` VALUES ('292', '542500', '阿里地区', '540000');
INSERT INTO `x2_city` VALUES ('293', '542600', '林芝地区', '540000');
INSERT INTO `x2_city` VALUES ('294', '610100', '西安市', '610000');
INSERT INTO `x2_city` VALUES ('295', '610200', '铜川市', '610000');
INSERT INTO `x2_city` VALUES ('296', '610300', '宝鸡市', '610000');
INSERT INTO `x2_city` VALUES ('297', '610400', '咸阳市', '610000');
INSERT INTO `x2_city` VALUES ('298', '610500', '渭南市', '610000');
INSERT INTO `x2_city` VALUES ('299', '610600', '延安市', '610000');
INSERT INTO `x2_city` VALUES ('300', '610700', '汉中市', '610000');
INSERT INTO `x2_city` VALUES ('301', '610800', '榆林市', '610000');
INSERT INTO `x2_city` VALUES ('302', '610900', '安康市', '610000');
INSERT INTO `x2_city` VALUES ('303', '611000', '商洛市', '610000');
INSERT INTO `x2_city` VALUES ('304', '620100', '兰州市', '620000');
INSERT INTO `x2_city` VALUES ('305', '620200', '嘉峪关市', '620000');
INSERT INTO `x2_city` VALUES ('306', '620300', '金昌市', '620000');
INSERT INTO `x2_city` VALUES ('307', '620400', '白银市', '620000');
INSERT INTO `x2_city` VALUES ('308', '620500', '天水市', '620000');
INSERT INTO `x2_city` VALUES ('309', '620600', '武威市', '620000');
INSERT INTO `x2_city` VALUES ('310', '620700', '张掖市', '620000');
INSERT INTO `x2_city` VALUES ('311', '620800', '平凉市', '620000');
INSERT INTO `x2_city` VALUES ('312', '620900', '酒泉市', '620000');
INSERT INTO `x2_city` VALUES ('313', '621000', '庆阳市', '620000');
INSERT INTO `x2_city` VALUES ('314', '621100', '定西市', '620000');
INSERT INTO `x2_city` VALUES ('315', '621200', '陇南市', '620000');
INSERT INTO `x2_city` VALUES ('316', '622900', '临夏回族自治州', '620000');
INSERT INTO `x2_city` VALUES ('317', '623000', '甘南藏族自治州', '620000');
INSERT INTO `x2_city` VALUES ('318', '630100', '西宁市', '630000');
INSERT INTO `x2_city` VALUES ('319', '632100', '海东地区', '630000');
INSERT INTO `x2_city` VALUES ('320', '632200', '海北藏族自治州', '630000');
INSERT INTO `x2_city` VALUES ('321', '632300', '黄南藏族自治州', '630000');
INSERT INTO `x2_city` VALUES ('322', '632500', '海南藏族自治州', '630000');
INSERT INTO `x2_city` VALUES ('323', '632600', '果洛藏族自治州', '630000');
INSERT INTO `x2_city` VALUES ('324', '632700', '玉树藏族自治州', '630000');
INSERT INTO `x2_city` VALUES ('325', '632800', '海西蒙古族藏族自治州', '630000');
INSERT INTO `x2_city` VALUES ('326', '640100', '银川市', '640000');
INSERT INTO `x2_city` VALUES ('327', '640200', '石嘴山市', '640000');
INSERT INTO `x2_city` VALUES ('328', '640300', '吴忠市', '640000');
INSERT INTO `x2_city` VALUES ('329', '640400', '固原市', '640000');
INSERT INTO `x2_city` VALUES ('330', '640500', '中卫市', '640000');
INSERT INTO `x2_city` VALUES ('331', '650100', '乌鲁木齐市', '650000');
INSERT INTO `x2_city` VALUES ('332', '650200', '克拉玛依市', '650000');
INSERT INTO `x2_city` VALUES ('333', '652100', '吐鲁番地区', '650000');
INSERT INTO `x2_city` VALUES ('334', '652200', '哈密地区', '650000');
INSERT INTO `x2_city` VALUES ('335', '652300', '昌吉回族自治州', '650000');
INSERT INTO `x2_city` VALUES ('336', '652700', '博尔塔拉蒙古自治州', '650000');
INSERT INTO `x2_city` VALUES ('337', '652800', '巴音郭楞蒙古自治州', '650000');
INSERT INTO `x2_city` VALUES ('338', '652900', '阿克苏地区', '650000');
INSERT INTO `x2_city` VALUES ('339', '653000', '克孜勒苏柯尔克孜自治州', '650000');
INSERT INTO `x2_city` VALUES ('340', '653100', '喀什地区', '650000');
INSERT INTO `x2_city` VALUES ('341', '653200', '和田地区', '650000');
INSERT INTO `x2_city` VALUES ('342', '654000', '伊犁哈萨克自治州', '650000');
INSERT INTO `x2_city` VALUES ('343', '654200', '塔城地区', '650000');
INSERT INTO `x2_city` VALUES ('344', '654300', '阿勒泰地区', '650000');
INSERT INTO `x2_city` VALUES ('345', '659000', '省直辖行政单位', '650000');
INSERT INTO `x2_city` VALUES ('346', '710100', '台北市', '710000');
INSERT INTO `x2_city` VALUES ('347', '710200', '高雄市', '710000');
INSERT INTO `x2_city` VALUES ('348', '710300', '基隆市', '710000');
INSERT INTO `x2_city` VALUES ('349', '710400', '台中市', '710000');
INSERT INTO `x2_city` VALUES ('350', '710500', '台南市', '710000');
INSERT INTO `x2_city` VALUES ('351', '710600', '新竹市', '710000');
INSERT INTO `x2_city` VALUES ('352', '710700', '嘉义市', '710000');
INSERT INTO `x2_city` VALUES ('353', '710800', '台北县', '710000');
INSERT INTO `x2_city` VALUES ('354', '710900', '宜兰县', '710000');
INSERT INTO `x2_city` VALUES ('355', '711000', '新竹县', '710000');
INSERT INTO `x2_city` VALUES ('356', '711100', '桃园县', '710000');
INSERT INTO `x2_city` VALUES ('357', '711200', '苗栗县', '710000');
INSERT INTO `x2_city` VALUES ('358', '711300', '台中县', '710000');
INSERT INTO `x2_city` VALUES ('359', '711400', '彰化县', '710000');
INSERT INTO `x2_city` VALUES ('360', '711500', '南投县', '710000');
INSERT INTO `x2_city` VALUES ('361', '711600', '嘉义县', '710000');
INSERT INTO `x2_city` VALUES ('362', '711700', '云林县', '710000');
INSERT INTO `x2_city` VALUES ('363', '711800', '台南县', '710000');
INSERT INTO `x2_city` VALUES ('364', '711900', '高雄县', '710000');
INSERT INTO `x2_city` VALUES ('365', '712000', '屏东县', '710000');
INSERT INTO `x2_city` VALUES ('366', '712100', '台东县', '710000');
INSERT INTO `x2_city` VALUES ('367', '712200', '花莲县', '710000');
INSERT INTO `x2_city` VALUES ('368', '712300', '澎湖县', '710000');
INSERT INTO `x2_city` VALUES ('369', '810100', '香港特别行政区', '810000');
INSERT INTO `x2_city` VALUES ('370', '820100', '澳门特别行政区', '820000');

-- ----------------------------
-- Table structure for `x2_cityarea`
-- ----------------------------
DROP TABLE IF EXISTS `x2_cityarea`;
CREATE TABLE `x2_cityarea` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `areaid` varchar(50) DEFAULT NULL,
  `area` varchar(60) DEFAULT NULL,
  `father` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `areaid` (`areaid`),
  KEY `father` (`father`)
) ENGINE=MyISAM AUTO_INCREMENT=820102 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_cityarea
-- ----------------------------
INSERT INTO `x2_cityarea` VALUES ('110101', '110101', '东城区', '110100');
INSERT INTO `x2_cityarea` VALUES ('110102', '110102', '西城区', '110100');
INSERT INTO `x2_cityarea` VALUES ('110103', '110103', '崇文区', '110100');
INSERT INTO `x2_cityarea` VALUES ('110104', '110104', '宣武区', '110100');
INSERT INTO `x2_cityarea` VALUES ('110105', '110105', '朝阳区', '110100');
INSERT INTO `x2_cityarea` VALUES ('110106', '110106', '丰台区', '110100');
INSERT INTO `x2_cityarea` VALUES ('110107', '110107', '石景山区', '110100');
INSERT INTO `x2_cityarea` VALUES ('110108', '110108', '海淀区', '110100');
INSERT INTO `x2_cityarea` VALUES ('110109', '110109', '门头沟区', '110100');
INSERT INTO `x2_cityarea` VALUES ('110111', '110111', '房山区', '110100');
INSERT INTO `x2_cityarea` VALUES ('110112', '110112', '通州区', '110100');
INSERT INTO `x2_cityarea` VALUES ('110113', '110113', '顺义区', '110100');
INSERT INTO `x2_cityarea` VALUES ('110114', '110114', '昌平区', '110100');
INSERT INTO `x2_cityarea` VALUES ('110115', '110115', '大兴区', '110100');
INSERT INTO `x2_cityarea` VALUES ('110116', '110116', '怀柔区', '110100');
INSERT INTO `x2_cityarea` VALUES ('110117', '110117', '平谷区', '110100');
INSERT INTO `x2_cityarea` VALUES ('110228', '110228', '密云县', '110200');
INSERT INTO `x2_cityarea` VALUES ('110229', '110229', '延庆县', '110200');
INSERT INTO `x2_cityarea` VALUES ('120101', '120101', '和平区', '120100');
INSERT INTO `x2_cityarea` VALUES ('120102', '120102', '河东区', '120100');
INSERT INTO `x2_cityarea` VALUES ('120103', '120103', '河西区', '120100');
INSERT INTO `x2_cityarea` VALUES ('120104', '120104', '南开区', '120100');
INSERT INTO `x2_cityarea` VALUES ('120105', '120105', '河北区', '120100');
INSERT INTO `x2_cityarea` VALUES ('120106', '120106', '红桥区', '120100');
INSERT INTO `x2_cityarea` VALUES ('120107', '120107', '塘沽区', '120100');
INSERT INTO `x2_cityarea` VALUES ('120108', '120108', '汉沽区', '120100');
INSERT INTO `x2_cityarea` VALUES ('120109', '120109', '大港区', '120100');
INSERT INTO `x2_cityarea` VALUES ('120110', '120110', '东丽区', '120100');
INSERT INTO `x2_cityarea` VALUES ('120111', '120111', '西青区', '120100');
INSERT INTO `x2_cityarea` VALUES ('120112', '120112', '津南区', '120100');
INSERT INTO `x2_cityarea` VALUES ('120113', '120113', '北辰区', '120100');
INSERT INTO `x2_cityarea` VALUES ('120114', '120114', '武清区', '120100');
INSERT INTO `x2_cityarea` VALUES ('120115', '120115', '宝坻区', '120100');
INSERT INTO `x2_cityarea` VALUES ('120221', '120221', '宁河县', '120200');
INSERT INTO `x2_cityarea` VALUES ('120223', '120223', '静海县', '120200');
INSERT INTO `x2_cityarea` VALUES ('120225', '120225', '蓟　县', '120200');
INSERT INTO `x2_cityarea` VALUES ('130101', '130101', '市辖区', '130100');
INSERT INTO `x2_cityarea` VALUES ('130102', '130102', '长安区', '130100');
INSERT INTO `x2_cityarea` VALUES ('130103', '130103', '桥东区', '130100');
INSERT INTO `x2_cityarea` VALUES ('130104', '130104', '桥西区', '130100');
INSERT INTO `x2_cityarea` VALUES ('130105', '130105', '新华区', '130100');
INSERT INTO `x2_cityarea` VALUES ('130107', '130107', '井陉矿区', '130100');
INSERT INTO `x2_cityarea` VALUES ('130108', '130108', '裕华区', '130100');
INSERT INTO `x2_cityarea` VALUES ('130121', '130121', '井陉县', '130100');
INSERT INTO `x2_cityarea` VALUES ('130123', '130123', '正定县', '130100');
INSERT INTO `x2_cityarea` VALUES ('130124', '130124', '栾城县', '130100');
INSERT INTO `x2_cityarea` VALUES ('130125', '130125', '行唐县', '130100');
INSERT INTO `x2_cityarea` VALUES ('130126', '130126', '灵寿县', '130100');
INSERT INTO `x2_cityarea` VALUES ('130127', '130127', '高邑县', '130100');
INSERT INTO `x2_cityarea` VALUES ('130128', '130128', '深泽县', '130100');
INSERT INTO `x2_cityarea` VALUES ('130129', '130129', '赞皇县', '130100');
INSERT INTO `x2_cityarea` VALUES ('130130', '130130', '无极县', '130100');
INSERT INTO `x2_cityarea` VALUES ('130131', '130131', '平山县', '130100');
INSERT INTO `x2_cityarea` VALUES ('130132', '130132', '元氏县', '130100');
INSERT INTO `x2_cityarea` VALUES ('130133', '130133', '赵　县', '130100');
INSERT INTO `x2_cityarea` VALUES ('130181', '130181', '辛集市', '130100');
INSERT INTO `x2_cityarea` VALUES ('130182', '130182', '藁城市', '130100');
INSERT INTO `x2_cityarea` VALUES ('130183', '130183', '晋州市', '130100');
INSERT INTO `x2_cityarea` VALUES ('130184', '130184', '新乐市', '130100');
INSERT INTO `x2_cityarea` VALUES ('130185', '130185', '鹿泉市', '130100');
INSERT INTO `x2_cityarea` VALUES ('130201', '130201', '市辖区', '130200');
INSERT INTO `x2_cityarea` VALUES ('130202', '130202', '路南区', '130200');
INSERT INTO `x2_cityarea` VALUES ('130203', '130203', '路北区', '130200');
INSERT INTO `x2_cityarea` VALUES ('130204', '130204', '古冶区', '130200');
INSERT INTO `x2_cityarea` VALUES ('130205', '130205', '开平区', '130200');
INSERT INTO `x2_cityarea` VALUES ('130207', '130207', '丰南区', '130200');
INSERT INTO `x2_cityarea` VALUES ('130208', '130208', '丰润区', '130200');
INSERT INTO `x2_cityarea` VALUES ('130223', '130223', '滦　县', '130200');
INSERT INTO `x2_cityarea` VALUES ('130224', '130224', '滦南县', '130200');
INSERT INTO `x2_cityarea` VALUES ('130225', '130225', '乐亭县', '130200');
INSERT INTO `x2_cityarea` VALUES ('130227', '130227', '迁西县', '130200');
INSERT INTO `x2_cityarea` VALUES ('130229', '130229', '玉田县', '130200');
INSERT INTO `x2_cityarea` VALUES ('130230', '130230', '唐海县', '130200');
INSERT INTO `x2_cityarea` VALUES ('130281', '130281', '遵化市', '130200');
INSERT INTO `x2_cityarea` VALUES ('130283', '130283', '迁安市', '130200');
INSERT INTO `x2_cityarea` VALUES ('130301', '130301', '市辖区', '130300');
INSERT INTO `x2_cityarea` VALUES ('130302', '130302', '海港区', '130300');
INSERT INTO `x2_cityarea` VALUES ('130303', '130303', '山海关区', '130300');
INSERT INTO `x2_cityarea` VALUES ('130304', '130304', '北戴河区', '130300');
INSERT INTO `x2_cityarea` VALUES ('130321', '130321', '青龙满族自治县', '130300');
INSERT INTO `x2_cityarea` VALUES ('130322', '130322', '昌黎县', '130300');
INSERT INTO `x2_cityarea` VALUES ('130323', '130323', '抚宁县', '130300');
INSERT INTO `x2_cityarea` VALUES ('130324', '130324', '卢龙县', '130300');
INSERT INTO `x2_cityarea` VALUES ('130401', '130401', '市辖区', '130400');
INSERT INTO `x2_cityarea` VALUES ('130402', '130402', '邯山区', '130400');
INSERT INTO `x2_cityarea` VALUES ('130403', '130403', '丛台区', '130400');
INSERT INTO `x2_cityarea` VALUES ('130404', '130404', '复兴区', '130400');
INSERT INTO `x2_cityarea` VALUES ('130406', '130406', '峰峰矿区', '130400');
INSERT INTO `x2_cityarea` VALUES ('130421', '130421', '邯郸县', '130400');
INSERT INTO `x2_cityarea` VALUES ('130423', '130423', '临漳县', '130400');
INSERT INTO `x2_cityarea` VALUES ('130424', '130424', '成安县', '130400');
INSERT INTO `x2_cityarea` VALUES ('130425', '130425', '大名县', '130400');
INSERT INTO `x2_cityarea` VALUES ('130426', '130426', '涉　县', '130400');
INSERT INTO `x2_cityarea` VALUES ('130427', '130427', '磁　县', '130400');
INSERT INTO `x2_cityarea` VALUES ('130428', '130428', '肥乡县', '130400');
INSERT INTO `x2_cityarea` VALUES ('130429', '130429', '永年县', '130400');
INSERT INTO `x2_cityarea` VALUES ('130430', '130430', '邱　县', '130400');
INSERT INTO `x2_cityarea` VALUES ('130431', '130431', '鸡泽县', '130400');
INSERT INTO `x2_cityarea` VALUES ('130432', '130432', '广平县', '130400');
INSERT INTO `x2_cityarea` VALUES ('130433', '130433', '馆陶县', '130400');
INSERT INTO `x2_cityarea` VALUES ('130434', '130434', '魏　县', '130400');
INSERT INTO `x2_cityarea` VALUES ('130435', '130435', '曲周县', '130400');
INSERT INTO `x2_cityarea` VALUES ('130481', '130481', '武安市', '130400');
INSERT INTO `x2_cityarea` VALUES ('130501', '130501', '市辖区', '130500');
INSERT INTO `x2_cityarea` VALUES ('130502', '130502', '桥东区', '130500');
INSERT INTO `x2_cityarea` VALUES ('130503', '130503', '桥西区', '130500');
INSERT INTO `x2_cityarea` VALUES ('130521', '130521', '邢台县', '130500');
INSERT INTO `x2_cityarea` VALUES ('130522', '130522', '临城县', '130500');
INSERT INTO `x2_cityarea` VALUES ('130523', '130523', '内邱县', '130500');
INSERT INTO `x2_cityarea` VALUES ('130524', '130524', '柏乡县', '130500');
INSERT INTO `x2_cityarea` VALUES ('130525', '130525', '隆尧县', '130500');
INSERT INTO `x2_cityarea` VALUES ('130526', '130526', '任　县', '130500');
INSERT INTO `x2_cityarea` VALUES ('130527', '130527', '南和县', '130500');
INSERT INTO `x2_cityarea` VALUES ('130528', '130528', '宁晋县', '130500');
INSERT INTO `x2_cityarea` VALUES ('130529', '130529', '巨鹿县', '130500');
INSERT INTO `x2_cityarea` VALUES ('130530', '130530', '新河县', '130500');
INSERT INTO `x2_cityarea` VALUES ('130531', '130531', '广宗县', '130500');
INSERT INTO `x2_cityarea` VALUES ('130532', '130532', '平乡县', '130500');
INSERT INTO `x2_cityarea` VALUES ('130533', '130533', '威　县', '130500');
INSERT INTO `x2_cityarea` VALUES ('130534', '130534', '清河县', '130500');
INSERT INTO `x2_cityarea` VALUES ('130535', '130535', '临西县', '130500');
INSERT INTO `x2_cityarea` VALUES ('130581', '130581', '南宫市', '130500');
INSERT INTO `x2_cityarea` VALUES ('130582', '130582', '沙河市', '130500');
INSERT INTO `x2_cityarea` VALUES ('130601', '130601', '市辖区', '130600');
INSERT INTO `x2_cityarea` VALUES ('130602', '130602', '新市区', '130600');
INSERT INTO `x2_cityarea` VALUES ('130603', '130603', '北市区', '130600');
INSERT INTO `x2_cityarea` VALUES ('130604', '130604', '南市区', '130600');
INSERT INTO `x2_cityarea` VALUES ('130621', '130621', '满城县', '130600');
INSERT INTO `x2_cityarea` VALUES ('130622', '130622', '清苑县', '130600');
INSERT INTO `x2_cityarea` VALUES ('130623', '130623', '涞水县', '130600');
INSERT INTO `x2_cityarea` VALUES ('130624', '130624', '阜平县', '130600');
INSERT INTO `x2_cityarea` VALUES ('130625', '130625', '徐水县', '130600');
INSERT INTO `x2_cityarea` VALUES ('130626', '130626', '定兴县', '130600');
INSERT INTO `x2_cityarea` VALUES ('130627', '130627', '唐　县', '130600');
INSERT INTO `x2_cityarea` VALUES ('130628', '130628', '高阳县', '130600');
INSERT INTO `x2_cityarea` VALUES ('130629', '130629', '容城县', '130600');
INSERT INTO `x2_cityarea` VALUES ('130630', '130630', '涞源县', '130600');
INSERT INTO `x2_cityarea` VALUES ('130631', '130631', '望都县', '130600');
INSERT INTO `x2_cityarea` VALUES ('130632', '130632', '安新县', '130600');
INSERT INTO `x2_cityarea` VALUES ('130633', '130633', '易　县', '130600');
INSERT INTO `x2_cityarea` VALUES ('130634', '130634', '曲阳县', '130600');
INSERT INTO `x2_cityarea` VALUES ('130635', '130635', '蠡　县', '130600');
INSERT INTO `x2_cityarea` VALUES ('130636', '130636', '顺平县', '130600');
INSERT INTO `x2_cityarea` VALUES ('130637', '130637', '博野县', '130600');
INSERT INTO `x2_cityarea` VALUES ('130638', '130638', '雄　县', '130600');
INSERT INTO `x2_cityarea` VALUES ('130681', '130681', '涿州市', '130600');
INSERT INTO `x2_cityarea` VALUES ('130682', '130682', '定州市', '130600');
INSERT INTO `x2_cityarea` VALUES ('130683', '130683', '安国市', '130600');
INSERT INTO `x2_cityarea` VALUES ('130684', '130684', '高碑店市', '130600');
INSERT INTO `x2_cityarea` VALUES ('130701', '130701', '市辖区', '130700');
INSERT INTO `x2_cityarea` VALUES ('130702', '130702', '桥东区', '130700');
INSERT INTO `x2_cityarea` VALUES ('130703', '130703', '桥西区', '130700');
INSERT INTO `x2_cityarea` VALUES ('130705', '130705', '宣化区', '130700');
INSERT INTO `x2_cityarea` VALUES ('130706', '130706', '下花园区', '130700');
INSERT INTO `x2_cityarea` VALUES ('130721', '130721', '宣化县', '130700');
INSERT INTO `x2_cityarea` VALUES ('130722', '130722', '张北县', '130700');
INSERT INTO `x2_cityarea` VALUES ('130723', '130723', '康保县', '130700');
INSERT INTO `x2_cityarea` VALUES ('130724', '130724', '沽源县', '130700');
INSERT INTO `x2_cityarea` VALUES ('130725', '130725', '尚义县', '130700');
INSERT INTO `x2_cityarea` VALUES ('130726', '130726', '蔚　县', '130700');
INSERT INTO `x2_cityarea` VALUES ('130727', '130727', '阳原县', '130700');
INSERT INTO `x2_cityarea` VALUES ('130728', '130728', '怀安县', '130700');
INSERT INTO `x2_cityarea` VALUES ('130729', '130729', '万全县', '130700');
INSERT INTO `x2_cityarea` VALUES ('130730', '130730', '怀来县', '130700');
INSERT INTO `x2_cityarea` VALUES ('130731', '130731', '涿鹿县', '130700');
INSERT INTO `x2_cityarea` VALUES ('130732', '130732', '赤城县', '130700');
INSERT INTO `x2_cityarea` VALUES ('130733', '130733', '崇礼县', '130700');
INSERT INTO `x2_cityarea` VALUES ('130801', '130801', '市辖区', '130800');
INSERT INTO `x2_cityarea` VALUES ('130802', '130802', '双桥区', '130800');
INSERT INTO `x2_cityarea` VALUES ('130803', '130803', '双滦区', '130800');
INSERT INTO `x2_cityarea` VALUES ('130804', '130804', '鹰手营子矿区', '130800');
INSERT INTO `x2_cityarea` VALUES ('130821', '130821', '承德县', '130800');
INSERT INTO `x2_cityarea` VALUES ('130822', '130822', '兴隆县', '130800');
INSERT INTO `x2_cityarea` VALUES ('130823', '130823', '平泉县', '130800');
INSERT INTO `x2_cityarea` VALUES ('130824', '130824', '滦平县', '130800');
INSERT INTO `x2_cityarea` VALUES ('130825', '130825', '隆化县', '130800');
INSERT INTO `x2_cityarea` VALUES ('130826', '130826', '丰宁满族自治县', '130800');
INSERT INTO `x2_cityarea` VALUES ('130827', '130827', '宽城满族自治县', '130800');
INSERT INTO `x2_cityarea` VALUES ('130828', '130828', '围场满族蒙古族自治县', '130800');
INSERT INTO `x2_cityarea` VALUES ('130901', '130901', '市辖区', '130900');
INSERT INTO `x2_cityarea` VALUES ('130902', '130902', '新华区', '130900');
INSERT INTO `x2_cityarea` VALUES ('130903', '130903', '运河区', '130900');
INSERT INTO `x2_cityarea` VALUES ('130921', '130921', '沧　县', '130900');
INSERT INTO `x2_cityarea` VALUES ('130922', '130922', '青　县', '130900');
INSERT INTO `x2_cityarea` VALUES ('130923', '130923', '东光县', '130900');
INSERT INTO `x2_cityarea` VALUES ('130924', '130924', '海兴县', '130900');
INSERT INTO `x2_cityarea` VALUES ('130925', '130925', '盐山县', '130900');
INSERT INTO `x2_cityarea` VALUES ('130926', '130926', '肃宁县', '130900');
INSERT INTO `x2_cityarea` VALUES ('130927', '130927', '南皮县', '130900');
INSERT INTO `x2_cityarea` VALUES ('130928', '130928', '吴桥县', '130900');
INSERT INTO `x2_cityarea` VALUES ('130929', '130929', '献　县', '130900');
INSERT INTO `x2_cityarea` VALUES ('130930', '130930', '孟村回族自治县', '130900');
INSERT INTO `x2_cityarea` VALUES ('130981', '130981', '泊头市', '130900');
INSERT INTO `x2_cityarea` VALUES ('130982', '130982', '任丘市', '130900');
INSERT INTO `x2_cityarea` VALUES ('130983', '130983', '黄骅市', '130900');
INSERT INTO `x2_cityarea` VALUES ('130984', '130984', '河间市', '130900');
INSERT INTO `x2_cityarea` VALUES ('131001', '131001', '市辖区', '131000');
INSERT INTO `x2_cityarea` VALUES ('131002', '131002', '安次区', '131000');
INSERT INTO `x2_cityarea` VALUES ('131003', '131003', '广阳区', '131000');
INSERT INTO `x2_cityarea` VALUES ('131022', '131022', '固安县', '131000');
INSERT INTO `x2_cityarea` VALUES ('131023', '131023', '永清县', '131000');
INSERT INTO `x2_cityarea` VALUES ('131024', '131024', '香河县', '131000');
INSERT INTO `x2_cityarea` VALUES ('131025', '131025', '大城县', '131000');
INSERT INTO `x2_cityarea` VALUES ('131026', '131026', '文安县', '131000');
INSERT INTO `x2_cityarea` VALUES ('131028', '131028', '大厂回族自治县', '131000');
INSERT INTO `x2_cityarea` VALUES ('131081', '131081', '霸州市', '131000');
INSERT INTO `x2_cityarea` VALUES ('131082', '131082', '三河市', '131000');
INSERT INTO `x2_cityarea` VALUES ('131101', '131101', '市辖区', '131100');
INSERT INTO `x2_cityarea` VALUES ('131102', '131102', '桃城区', '131100');
INSERT INTO `x2_cityarea` VALUES ('131121', '131121', '枣强县', '131100');
INSERT INTO `x2_cityarea` VALUES ('131122', '131122', '武邑县', '131100');
INSERT INTO `x2_cityarea` VALUES ('131123', '131123', '武强县', '131100');
INSERT INTO `x2_cityarea` VALUES ('131124', '131124', '饶阳县', '131100');
INSERT INTO `x2_cityarea` VALUES ('131125', '131125', '安平县', '131100');
INSERT INTO `x2_cityarea` VALUES ('131126', '131126', '故城县', '131100');
INSERT INTO `x2_cityarea` VALUES ('131127', '131127', '景　县', '131100');
INSERT INTO `x2_cityarea` VALUES ('131128', '131128', '阜城县', '131100');
INSERT INTO `x2_cityarea` VALUES ('131181', '131181', '冀州市', '131100');
INSERT INTO `x2_cityarea` VALUES ('131182', '131182', '深州市', '131100');
INSERT INTO `x2_cityarea` VALUES ('140101', '140101', '市辖区', '140100');
INSERT INTO `x2_cityarea` VALUES ('140105', '140105', '小店区', '140100');
INSERT INTO `x2_cityarea` VALUES ('140106', '140106', '迎泽区', '140100');
INSERT INTO `x2_cityarea` VALUES ('140107', '140107', '杏花岭区', '140100');
INSERT INTO `x2_cityarea` VALUES ('140108', '140108', '尖草坪区', '140100');
INSERT INTO `x2_cityarea` VALUES ('140109', '140109', '万柏林区', '140100');
INSERT INTO `x2_cityarea` VALUES ('140110', '140110', '晋源区', '140100');
INSERT INTO `x2_cityarea` VALUES ('140121', '140121', '清徐县', '140100');
INSERT INTO `x2_cityarea` VALUES ('140122', '140122', '阳曲县', '140100');
INSERT INTO `x2_cityarea` VALUES ('140123', '140123', '娄烦县', '140100');
INSERT INTO `x2_cityarea` VALUES ('140181', '140181', '古交市', '140100');
INSERT INTO `x2_cityarea` VALUES ('140201', '140201', '市辖区', '140200');
INSERT INTO `x2_cityarea` VALUES ('140202', '140202', '城　区', '140200');
INSERT INTO `x2_cityarea` VALUES ('140203', '140203', '矿　区', '140200');
INSERT INTO `x2_cityarea` VALUES ('140211', '140211', '南郊区', '140200');
INSERT INTO `x2_cityarea` VALUES ('140212', '140212', '新荣区', '140200');
INSERT INTO `x2_cityarea` VALUES ('140221', '140221', '阳高县', '140200');
INSERT INTO `x2_cityarea` VALUES ('140222', '140222', '天镇县', '140200');
INSERT INTO `x2_cityarea` VALUES ('140223', '140223', '广灵县', '140200');
INSERT INTO `x2_cityarea` VALUES ('140224', '140224', '灵丘县', '140200');
INSERT INTO `x2_cityarea` VALUES ('140225', '140225', '浑源县', '140200');
INSERT INTO `x2_cityarea` VALUES ('140226', '140226', '左云县', '140200');
INSERT INTO `x2_cityarea` VALUES ('140227', '140227', '大同县', '140200');
INSERT INTO `x2_cityarea` VALUES ('140301', '140301', '市辖区', '140300');
INSERT INTO `x2_cityarea` VALUES ('140302', '140302', '城　区', '140300');
INSERT INTO `x2_cityarea` VALUES ('140303', '140303', '矿　区', '140300');
INSERT INTO `x2_cityarea` VALUES ('140311', '140311', '郊　区', '140300');
INSERT INTO `x2_cityarea` VALUES ('140321', '140321', '平定县', '140300');
INSERT INTO `x2_cityarea` VALUES ('140322', '140322', '盂　县', '140300');
INSERT INTO `x2_cityarea` VALUES ('140401', '140401', '市辖区', '140400');
INSERT INTO `x2_cityarea` VALUES ('140402', '140402', '城　区', '140400');
INSERT INTO `x2_cityarea` VALUES ('140411', '140411', '郊　区', '140400');
INSERT INTO `x2_cityarea` VALUES ('140421', '140421', '长治县', '140400');
INSERT INTO `x2_cityarea` VALUES ('140423', '140423', '襄垣县', '140400');
INSERT INTO `x2_cityarea` VALUES ('140424', '140424', '屯留县', '140400');
INSERT INTO `x2_cityarea` VALUES ('140425', '140425', '平顺县', '140400');
INSERT INTO `x2_cityarea` VALUES ('140426', '140426', '黎城县', '140400');
INSERT INTO `x2_cityarea` VALUES ('140427', '140427', '壶关县', '140400');
INSERT INTO `x2_cityarea` VALUES ('140428', '140428', '长子县', '140400');
INSERT INTO `x2_cityarea` VALUES ('140429', '140429', '武乡县', '140400');
INSERT INTO `x2_cityarea` VALUES ('140430', '140430', '沁　县', '140400');
INSERT INTO `x2_cityarea` VALUES ('140431', '140431', '沁源县', '140400');
INSERT INTO `x2_cityarea` VALUES ('140481', '140481', '潞城市', '140400');
INSERT INTO `x2_cityarea` VALUES ('140501', '140501', '市辖区', '140500');
INSERT INTO `x2_cityarea` VALUES ('140502', '140502', '城　区', '140500');
INSERT INTO `x2_cityarea` VALUES ('140521', '140521', '沁水县', '140500');
INSERT INTO `x2_cityarea` VALUES ('140522', '140522', '阳城县', '140500');
INSERT INTO `x2_cityarea` VALUES ('140524', '140524', '陵川县', '140500');
INSERT INTO `x2_cityarea` VALUES ('140525', '140525', '泽州县', '140500');
INSERT INTO `x2_cityarea` VALUES ('140581', '140581', '高平市', '140500');
INSERT INTO `x2_cityarea` VALUES ('140601', '140601', '市辖区', '140600');
INSERT INTO `x2_cityarea` VALUES ('140602', '140602', '朔城区', '140600');
INSERT INTO `x2_cityarea` VALUES ('140603', '140603', '平鲁区', '140600');
INSERT INTO `x2_cityarea` VALUES ('140621', '140621', '山阴县', '140600');
INSERT INTO `x2_cityarea` VALUES ('140622', '140622', '应　县', '140600');
INSERT INTO `x2_cityarea` VALUES ('140623', '140623', '右玉县', '140600');
INSERT INTO `x2_cityarea` VALUES ('140624', '140624', '怀仁县', '140600');
INSERT INTO `x2_cityarea` VALUES ('140701', '140701', '市辖区', '140700');
INSERT INTO `x2_cityarea` VALUES ('140702', '140702', '榆次区', '140700');
INSERT INTO `x2_cityarea` VALUES ('140721', '140721', '榆社县', '140700');
INSERT INTO `x2_cityarea` VALUES ('140722', '140722', '左权县', '140700');
INSERT INTO `x2_cityarea` VALUES ('140723', '140723', '和顺县', '140700');
INSERT INTO `x2_cityarea` VALUES ('140724', '140724', '昔阳县', '140700');
INSERT INTO `x2_cityarea` VALUES ('140725', '140725', '寿阳县', '140700');
INSERT INTO `x2_cityarea` VALUES ('140726', '140726', '太谷县', '140700');
INSERT INTO `x2_cityarea` VALUES ('140727', '140727', '祁　县', '140700');
INSERT INTO `x2_cityarea` VALUES ('140728', '140728', '平遥县', '140700');
INSERT INTO `x2_cityarea` VALUES ('140729', '140729', '灵石县', '140700');
INSERT INTO `x2_cityarea` VALUES ('140781', '140781', '介休市', '140700');
INSERT INTO `x2_cityarea` VALUES ('140801', '140801', '市辖区', '140800');
INSERT INTO `x2_cityarea` VALUES ('140802', '140802', '盐湖区', '140800');
INSERT INTO `x2_cityarea` VALUES ('140821', '140821', '临猗县', '140800');
INSERT INTO `x2_cityarea` VALUES ('140822', '140822', '万荣县', '140800');
INSERT INTO `x2_cityarea` VALUES ('140823', '140823', '闻喜县', '140800');
INSERT INTO `x2_cityarea` VALUES ('140824', '140824', '稷山县', '140800');
INSERT INTO `x2_cityarea` VALUES ('140825', '140825', '新绛县', '140800');
INSERT INTO `x2_cityarea` VALUES ('140826', '140826', '绛　县', '140800');
INSERT INTO `x2_cityarea` VALUES ('140827', '140827', '垣曲县', '140800');
INSERT INTO `x2_cityarea` VALUES ('140828', '140828', '夏　县', '140800');
INSERT INTO `x2_cityarea` VALUES ('140829', '140829', '平陆县', '140800');
INSERT INTO `x2_cityarea` VALUES ('140830', '140830', '芮城县', '140800');
INSERT INTO `x2_cityarea` VALUES ('140881', '140881', '永济市', '140800');
INSERT INTO `x2_cityarea` VALUES ('140882', '140882', '河津市', '140800');
INSERT INTO `x2_cityarea` VALUES ('140901', '140901', '市辖区', '140900');
INSERT INTO `x2_cityarea` VALUES ('140902', '140902', '忻府区', '140900');
INSERT INTO `x2_cityarea` VALUES ('140921', '140921', '定襄县', '140900');
INSERT INTO `x2_cityarea` VALUES ('140922', '140922', '五台县', '140900');
INSERT INTO `x2_cityarea` VALUES ('140923', '140923', '代　县', '140900');
INSERT INTO `x2_cityarea` VALUES ('140924', '140924', '繁峙县', '140900');
INSERT INTO `x2_cityarea` VALUES ('140925', '140925', '宁武县', '140900');
INSERT INTO `x2_cityarea` VALUES ('140926', '140926', '静乐县', '140900');
INSERT INTO `x2_cityarea` VALUES ('140927', '140927', '神池县', '140900');
INSERT INTO `x2_cityarea` VALUES ('140928', '140928', '五寨县', '140900');
INSERT INTO `x2_cityarea` VALUES ('140929', '140929', '岢岚县', '140900');
INSERT INTO `x2_cityarea` VALUES ('140930', '140930', '河曲县', '140900');
INSERT INTO `x2_cityarea` VALUES ('140931', '140931', '保德县', '140900');
INSERT INTO `x2_cityarea` VALUES ('140932', '140932', '偏关县', '140900');
INSERT INTO `x2_cityarea` VALUES ('140981', '140981', '原平市', '140900');
INSERT INTO `x2_cityarea` VALUES ('141001', '141001', '市辖区', '141000');
INSERT INTO `x2_cityarea` VALUES ('141002', '141002', '尧都区', '141000');
INSERT INTO `x2_cityarea` VALUES ('141021', '141021', '曲沃县', '141000');
INSERT INTO `x2_cityarea` VALUES ('141022', '141022', '翼城县', '141000');
INSERT INTO `x2_cityarea` VALUES ('141023', '141023', '襄汾县', '141000');
INSERT INTO `x2_cityarea` VALUES ('141024', '141024', '洪洞县', '141000');
INSERT INTO `x2_cityarea` VALUES ('141025', '141025', '古　县', '141000');
INSERT INTO `x2_cityarea` VALUES ('141026', '141026', '安泽县', '141000');
INSERT INTO `x2_cityarea` VALUES ('141027', '141027', '浮山县', '141000');
INSERT INTO `x2_cityarea` VALUES ('141028', '141028', '吉　县', '141000');
INSERT INTO `x2_cityarea` VALUES ('141029', '141029', '乡宁县', '141000');
INSERT INTO `x2_cityarea` VALUES ('141030', '141030', '大宁县', '141000');
INSERT INTO `x2_cityarea` VALUES ('141031', '141031', '隰　县', '141000');
INSERT INTO `x2_cityarea` VALUES ('141032', '141032', '永和县', '141000');
INSERT INTO `x2_cityarea` VALUES ('141033', '141033', '蒲　县', '141000');
INSERT INTO `x2_cityarea` VALUES ('141034', '141034', '汾西县', '141000');
INSERT INTO `x2_cityarea` VALUES ('141081', '141081', '侯马市', '141000');
INSERT INTO `x2_cityarea` VALUES ('141082', '141082', '霍州市', '141000');
INSERT INTO `x2_cityarea` VALUES ('141101', '141101', '市辖区', '141100');
INSERT INTO `x2_cityarea` VALUES ('141102', '141102', '离石区', '141100');
INSERT INTO `x2_cityarea` VALUES ('141121', '141121', '文水县', '141100');
INSERT INTO `x2_cityarea` VALUES ('141122', '141122', '交城县', '141100');
INSERT INTO `x2_cityarea` VALUES ('141123', '141123', '兴　县', '141100');
INSERT INTO `x2_cityarea` VALUES ('141124', '141124', '临　县', '141100');
INSERT INTO `x2_cityarea` VALUES ('141125', '141125', '柳林县', '141100');
INSERT INTO `x2_cityarea` VALUES ('141126', '141126', '石楼县', '141100');
INSERT INTO `x2_cityarea` VALUES ('141127', '141127', '岚　县', '141100');
INSERT INTO `x2_cityarea` VALUES ('141128', '141128', '方山县', '141100');
INSERT INTO `x2_cityarea` VALUES ('141129', '141129', '中阳县', '141100');
INSERT INTO `x2_cityarea` VALUES ('141130', '141130', '交口县', '141100');
INSERT INTO `x2_cityarea` VALUES ('141181', '141181', '孝义市', '141100');
INSERT INTO `x2_cityarea` VALUES ('141182', '141182', '汾阳市', '141100');
INSERT INTO `x2_cityarea` VALUES ('150101', '150101', '市辖区', '150100');
INSERT INTO `x2_cityarea` VALUES ('150102', '150102', '新城区', '150100');
INSERT INTO `x2_cityarea` VALUES ('150103', '150103', '回民区', '150100');
INSERT INTO `x2_cityarea` VALUES ('150104', '150104', '玉泉区', '150100');
INSERT INTO `x2_cityarea` VALUES ('150105', '150105', '赛罕区', '150100');
INSERT INTO `x2_cityarea` VALUES ('150121', '150121', '土默特左旗', '150100');
INSERT INTO `x2_cityarea` VALUES ('150122', '150122', '托克托县', '150100');
INSERT INTO `x2_cityarea` VALUES ('150123', '150123', '和林格尔县', '150100');
INSERT INTO `x2_cityarea` VALUES ('150124', '150124', '清水河县', '150100');
INSERT INTO `x2_cityarea` VALUES ('150125', '150125', '武川县', '150100');
INSERT INTO `x2_cityarea` VALUES ('150201', '150201', '市辖区', '150200');
INSERT INTO `x2_cityarea` VALUES ('150202', '150202', '东河区', '150200');
INSERT INTO `x2_cityarea` VALUES ('150203', '150203', '昆都仑区', '150200');
INSERT INTO `x2_cityarea` VALUES ('150204', '150204', '青山区', '150200');
INSERT INTO `x2_cityarea` VALUES ('150205', '150205', '石拐区', '150200');
INSERT INTO `x2_cityarea` VALUES ('150206', '150206', '白云矿区', '150200');
INSERT INTO `x2_cityarea` VALUES ('150207', '150207', '九原区', '150200');
INSERT INTO `x2_cityarea` VALUES ('150221', '150221', '土默特右旗', '150200');
INSERT INTO `x2_cityarea` VALUES ('150222', '150222', '固阳县', '150200');
INSERT INTO `x2_cityarea` VALUES ('150223', '150223', '达尔罕茂明安联合旗', '150200');
INSERT INTO `x2_cityarea` VALUES ('150301', '150301', '市辖区', '150300');
INSERT INTO `x2_cityarea` VALUES ('150302', '150302', '海勃湾区', '150300');
INSERT INTO `x2_cityarea` VALUES ('150303', '150303', '海南区', '150300');
INSERT INTO `x2_cityarea` VALUES ('150304', '150304', '乌达区', '150300');
INSERT INTO `x2_cityarea` VALUES ('150401', '150401', '市辖区', '150400');
INSERT INTO `x2_cityarea` VALUES ('150402', '150402', '红山区', '150400');
INSERT INTO `x2_cityarea` VALUES ('150403', '150403', '元宝山区', '150400');
INSERT INTO `x2_cityarea` VALUES ('150404', '150404', '松山区', '150400');
INSERT INTO `x2_cityarea` VALUES ('150421', '150421', '阿鲁科尔沁旗', '150400');
INSERT INTO `x2_cityarea` VALUES ('150422', '150422', '巴林左旗', '150400');
INSERT INTO `x2_cityarea` VALUES ('150423', '150423', '巴林右旗', '150400');
INSERT INTO `x2_cityarea` VALUES ('150424', '150424', '林西县', '150400');
INSERT INTO `x2_cityarea` VALUES ('150425', '150425', '克什克腾旗', '150400');
INSERT INTO `x2_cityarea` VALUES ('150426', '150426', '翁牛特旗', '150400');
INSERT INTO `x2_cityarea` VALUES ('150428', '150428', '喀喇沁旗', '150400');
INSERT INTO `x2_cityarea` VALUES ('150429', '150429', '宁城县', '150400');
INSERT INTO `x2_cityarea` VALUES ('150430', '150430', '敖汉旗', '150400');
INSERT INTO `x2_cityarea` VALUES ('150501', '150501', '市辖区', '150500');
INSERT INTO `x2_cityarea` VALUES ('150502', '150502', '科尔沁区', '150500');
INSERT INTO `x2_cityarea` VALUES ('150521', '150521', '科尔沁左翼中旗', '150500');
INSERT INTO `x2_cityarea` VALUES ('150522', '150522', '科尔沁左翼后旗', '150500');
INSERT INTO `x2_cityarea` VALUES ('150523', '150523', '开鲁县', '150500');
INSERT INTO `x2_cityarea` VALUES ('150524', '150524', '库伦旗', '150500');
INSERT INTO `x2_cityarea` VALUES ('150525', '150525', '奈曼旗', '150500');
INSERT INTO `x2_cityarea` VALUES ('150526', '150526', '扎鲁特旗', '150500');
INSERT INTO `x2_cityarea` VALUES ('150581', '150581', '霍林郭勒市', '150500');
INSERT INTO `x2_cityarea` VALUES ('150602', '150602', '东胜区', '150600');
INSERT INTO `x2_cityarea` VALUES ('150621', '150621', '达拉特旗', '150600');
INSERT INTO `x2_cityarea` VALUES ('150622', '150622', '准格尔旗', '150600');
INSERT INTO `x2_cityarea` VALUES ('150623', '150623', '鄂托克前旗', '150600');
INSERT INTO `x2_cityarea` VALUES ('150624', '150624', '鄂托克旗', '150600');
INSERT INTO `x2_cityarea` VALUES ('150625', '150625', '杭锦旗', '150600');
INSERT INTO `x2_cityarea` VALUES ('150626', '150626', '乌审旗', '150600');
INSERT INTO `x2_cityarea` VALUES ('150627', '150627', '伊金霍洛旗', '150600');
INSERT INTO `x2_cityarea` VALUES ('150701', '150701', '市辖区', '150700');
INSERT INTO `x2_cityarea` VALUES ('150702', '150702', '海拉尔区', '150700');
INSERT INTO `x2_cityarea` VALUES ('150721', '150721', '阿荣旗', '150700');
INSERT INTO `x2_cityarea` VALUES ('150722', '150722', '莫力达瓦达斡尔族自治旗', '150700');
INSERT INTO `x2_cityarea` VALUES ('150723', '150723', '鄂伦春自治旗', '150700');
INSERT INTO `x2_cityarea` VALUES ('150724', '150724', '鄂温克族自治旗', '150700');
INSERT INTO `x2_cityarea` VALUES ('150725', '150725', '陈巴尔虎旗', '150700');
INSERT INTO `x2_cityarea` VALUES ('150726', '150726', '新巴尔虎左旗', '150700');
INSERT INTO `x2_cityarea` VALUES ('150727', '150727', '新巴尔虎右旗', '150700');
INSERT INTO `x2_cityarea` VALUES ('150781', '150781', '满洲里市', '150700');
INSERT INTO `x2_cityarea` VALUES ('150782', '150782', '牙克石市', '150700');
INSERT INTO `x2_cityarea` VALUES ('150783', '150783', '扎兰屯市', '150700');
INSERT INTO `x2_cityarea` VALUES ('150784', '150784', '额尔古纳市', '150700');
INSERT INTO `x2_cityarea` VALUES ('150785', '150785', '根河市', '150700');
INSERT INTO `x2_cityarea` VALUES ('150801', '150801', '市辖区', '150800');
INSERT INTO `x2_cityarea` VALUES ('150802', '150802', '临河区', '150800');
INSERT INTO `x2_cityarea` VALUES ('150821', '150821', '五原县', '150800');
INSERT INTO `x2_cityarea` VALUES ('150822', '150822', '磴口县', '150800');
INSERT INTO `x2_cityarea` VALUES ('150823', '150823', '乌拉特前旗', '150800');
INSERT INTO `x2_cityarea` VALUES ('150824', '150824', '乌拉特中旗', '150800');
INSERT INTO `x2_cityarea` VALUES ('150825', '150825', '乌拉特后旗', '150800');
INSERT INTO `x2_cityarea` VALUES ('150826', '150826', '杭锦后旗', '150800');
INSERT INTO `x2_cityarea` VALUES ('150901', '150901', '市辖区', '150900');
INSERT INTO `x2_cityarea` VALUES ('150902', '150902', '集宁区', '150900');
INSERT INTO `x2_cityarea` VALUES ('150921', '150921', '卓资县', '150900');
INSERT INTO `x2_cityarea` VALUES ('150922', '150922', '化德县', '150900');
INSERT INTO `x2_cityarea` VALUES ('150923', '150923', '商都县', '150900');
INSERT INTO `x2_cityarea` VALUES ('150924', '150924', '兴和县', '150900');
INSERT INTO `x2_cityarea` VALUES ('150925', '150925', '凉城县', '150900');
INSERT INTO `x2_cityarea` VALUES ('150926', '150926', '察哈尔右翼前旗', '150900');
INSERT INTO `x2_cityarea` VALUES ('150927', '150927', '察哈尔右翼中旗', '150900');
INSERT INTO `x2_cityarea` VALUES ('150928', '150928', '察哈尔右翼后旗', '150900');
INSERT INTO `x2_cityarea` VALUES ('150929', '150929', '四子王旗', '150900');
INSERT INTO `x2_cityarea` VALUES ('150981', '150981', '丰镇市', '150900');
INSERT INTO `x2_cityarea` VALUES ('152201', '152201', '乌兰浩特市', '152200');
INSERT INTO `x2_cityarea` VALUES ('152202', '152202', '阿尔山市', '152200');
INSERT INTO `x2_cityarea` VALUES ('152221', '152221', '科尔沁右翼前旗', '152200');
INSERT INTO `x2_cityarea` VALUES ('152222', '152222', '科尔沁右翼中旗', '152200');
INSERT INTO `x2_cityarea` VALUES ('152223', '152223', '扎赉特旗', '152200');
INSERT INTO `x2_cityarea` VALUES ('152224', '152224', '突泉县', '152200');
INSERT INTO `x2_cityarea` VALUES ('152501', '152501', '二连浩特市', '152500');
INSERT INTO `x2_cityarea` VALUES ('152502', '152502', '锡林浩特市', '152500');
INSERT INTO `x2_cityarea` VALUES ('152522', '152522', '阿巴嘎旗', '152500');
INSERT INTO `x2_cityarea` VALUES ('152523', '152523', '苏尼特左旗', '152500');
INSERT INTO `x2_cityarea` VALUES ('152524', '152524', '苏尼特右旗', '152500');
INSERT INTO `x2_cityarea` VALUES ('152525', '152525', '东乌珠穆沁旗', '152500');
INSERT INTO `x2_cityarea` VALUES ('152526', '152526', '西乌珠穆沁旗', '152500');
INSERT INTO `x2_cityarea` VALUES ('152527', '152527', '太仆寺旗', '152500');
INSERT INTO `x2_cityarea` VALUES ('152528', '152528', '镶黄旗', '152500');
INSERT INTO `x2_cityarea` VALUES ('152529', '152529', '正镶白旗', '152500');
INSERT INTO `x2_cityarea` VALUES ('152530', '152530', '正蓝旗', '152500');
INSERT INTO `x2_cityarea` VALUES ('152531', '152531', '多伦县', '152500');
INSERT INTO `x2_cityarea` VALUES ('152921', '152921', '阿拉善左旗', '152900');
INSERT INTO `x2_cityarea` VALUES ('152922', '152922', '阿拉善右旗', '152900');
INSERT INTO `x2_cityarea` VALUES ('152923', '152923', '额济纳旗', '152900');
INSERT INTO `x2_cityarea` VALUES ('210101', '210101', '市辖区', '210100');
INSERT INTO `x2_cityarea` VALUES ('210102', '210102', '和平区', '210100');
INSERT INTO `x2_cityarea` VALUES ('210103', '210103', '沈河区', '210100');
INSERT INTO `x2_cityarea` VALUES ('210104', '210104', '大东区', '210100');
INSERT INTO `x2_cityarea` VALUES ('210105', '210105', '皇姑区', '210100');
INSERT INTO `x2_cityarea` VALUES ('210106', '210106', '铁西区', '210100');
INSERT INTO `x2_cityarea` VALUES ('210111', '210111', '苏家屯区', '210100');
INSERT INTO `x2_cityarea` VALUES ('210112', '210112', '东陵区', '210100');
INSERT INTO `x2_cityarea` VALUES ('210113', '210113', '新城子区', '210100');
INSERT INTO `x2_cityarea` VALUES ('210114', '210114', '于洪区', '210100');
INSERT INTO `x2_cityarea` VALUES ('210122', '210122', '辽中县', '210100');
INSERT INTO `x2_cityarea` VALUES ('210123', '210123', '康平县', '210100');
INSERT INTO `x2_cityarea` VALUES ('210124', '210124', '法库县', '210100');
INSERT INTO `x2_cityarea` VALUES ('210181', '210181', '新民市', '210100');
INSERT INTO `x2_cityarea` VALUES ('210201', '210201', '市辖区', '210200');
INSERT INTO `x2_cityarea` VALUES ('210202', '210202', '中山区', '210200');
INSERT INTO `x2_cityarea` VALUES ('210203', '210203', '西岗区', '210200');
INSERT INTO `x2_cityarea` VALUES ('210204', '210204', '沙河口区', '210200');
INSERT INTO `x2_cityarea` VALUES ('210211', '210211', '甘井子区', '210200');
INSERT INTO `x2_cityarea` VALUES ('210212', '210212', '旅顺口区', '210200');
INSERT INTO `x2_cityarea` VALUES ('210213', '210213', '金州区', '210200');
INSERT INTO `x2_cityarea` VALUES ('210224', '210224', '长海县', '210200');
INSERT INTO `x2_cityarea` VALUES ('210281', '210281', '瓦房店市', '210200');
INSERT INTO `x2_cityarea` VALUES ('210282', '210282', '普兰店市', '210200');
INSERT INTO `x2_cityarea` VALUES ('210283', '210283', '庄河市', '210200');
INSERT INTO `x2_cityarea` VALUES ('210301', '210301', '市辖区', '210300');
INSERT INTO `x2_cityarea` VALUES ('210302', '210302', '铁东区', '210300');
INSERT INTO `x2_cityarea` VALUES ('210303', '210303', '铁西区', '210300');
INSERT INTO `x2_cityarea` VALUES ('210304', '210304', '立山区', '210300');
INSERT INTO `x2_cityarea` VALUES ('210311', '210311', '千山区', '210300');
INSERT INTO `x2_cityarea` VALUES ('210321', '210321', '台安县', '210300');
INSERT INTO `x2_cityarea` VALUES ('210323', '210323', '岫岩满族自治县', '210300');
INSERT INTO `x2_cityarea` VALUES ('210381', '210381', '海城市', '210300');
INSERT INTO `x2_cityarea` VALUES ('210401', '210401', '市辖区', '210400');
INSERT INTO `x2_cityarea` VALUES ('210402', '210402', '新抚区', '210400');
INSERT INTO `x2_cityarea` VALUES ('210403', '210403', '东洲区', '210400');
INSERT INTO `x2_cityarea` VALUES ('210404', '210404', '望花区', '210400');
INSERT INTO `x2_cityarea` VALUES ('210411', '210411', '顺城区', '210400');
INSERT INTO `x2_cityarea` VALUES ('210421', '210421', '抚顺县', '210400');
INSERT INTO `x2_cityarea` VALUES ('210422', '210422', '新宾满族自治县', '210400');
INSERT INTO `x2_cityarea` VALUES ('210423', '210423', '清原满族自治县', '210400');
INSERT INTO `x2_cityarea` VALUES ('210501', '210501', '市辖区', '210500');
INSERT INTO `x2_cityarea` VALUES ('210502', '210502', '平山区', '210500');
INSERT INTO `x2_cityarea` VALUES ('210503', '210503', '溪湖区', '210500');
INSERT INTO `x2_cityarea` VALUES ('210504', '210504', '明山区', '210500');
INSERT INTO `x2_cityarea` VALUES ('210505', '210505', '南芬区', '210500');
INSERT INTO `x2_cityarea` VALUES ('210521', '210521', '本溪满族自治县', '210500');
INSERT INTO `x2_cityarea` VALUES ('210522', '210522', '桓仁满族自治县', '210500');
INSERT INTO `x2_cityarea` VALUES ('210601', '210601', '市辖区', '210600');
INSERT INTO `x2_cityarea` VALUES ('210602', '210602', '元宝区', '210600');
INSERT INTO `x2_cityarea` VALUES ('210603', '210603', '振兴区', '210600');
INSERT INTO `x2_cityarea` VALUES ('210604', '210604', '振安区', '210600');
INSERT INTO `x2_cityarea` VALUES ('210624', '210624', '宽甸满族自治县', '210600');
INSERT INTO `x2_cityarea` VALUES ('210681', '210681', '东港市', '210600');
INSERT INTO `x2_cityarea` VALUES ('210682', '210682', '凤城市', '210600');
INSERT INTO `x2_cityarea` VALUES ('210701', '210701', '市辖区', '210700');
INSERT INTO `x2_cityarea` VALUES ('210702', '210702', '古塔区', '210700');
INSERT INTO `x2_cityarea` VALUES ('210703', '210703', '凌河区', '210700');
INSERT INTO `x2_cityarea` VALUES ('210711', '210711', '太和区', '210700');
INSERT INTO `x2_cityarea` VALUES ('210726', '210726', '黑山县', '210700');
INSERT INTO `x2_cityarea` VALUES ('210727', '210727', '义　县', '210700');
INSERT INTO `x2_cityarea` VALUES ('210781', '210781', '凌海市', '210700');
INSERT INTO `x2_cityarea` VALUES ('210782', '210782', '北宁市', '210700');
INSERT INTO `x2_cityarea` VALUES ('210801', '210801', '市辖区', '210800');
INSERT INTO `x2_cityarea` VALUES ('210802', '210802', '站前区', '210800');
INSERT INTO `x2_cityarea` VALUES ('210803', '210803', '西市区', '210800');
INSERT INTO `x2_cityarea` VALUES ('210804', '210804', '鲅鱼圈区', '210800');
INSERT INTO `x2_cityarea` VALUES ('210811', '210811', '老边区', '210800');
INSERT INTO `x2_cityarea` VALUES ('210881', '210881', '盖州市', '210800');
INSERT INTO `x2_cityarea` VALUES ('210882', '210882', '大石桥市', '210800');
INSERT INTO `x2_cityarea` VALUES ('210901', '210901', '市辖区', '210900');
INSERT INTO `x2_cityarea` VALUES ('210902', '210902', '海州区', '210900');
INSERT INTO `x2_cityarea` VALUES ('210903', '210903', '新邱区', '210900');
INSERT INTO `x2_cityarea` VALUES ('210904', '210904', '太平区', '210900');
INSERT INTO `x2_cityarea` VALUES ('210905', '210905', '清河门区', '210900');
INSERT INTO `x2_cityarea` VALUES ('210911', '210911', '细河区', '210900');
INSERT INTO `x2_cityarea` VALUES ('210921', '210921', '阜新蒙古族自治县', '210900');
INSERT INTO `x2_cityarea` VALUES ('210922', '210922', '彰武县', '210900');
INSERT INTO `x2_cityarea` VALUES ('211001', '211001', '市辖区', '211000');
INSERT INTO `x2_cityarea` VALUES ('211002', '211002', '白塔区', '211000');
INSERT INTO `x2_cityarea` VALUES ('211003', '211003', '文圣区', '211000');
INSERT INTO `x2_cityarea` VALUES ('211004', '211004', '宏伟区', '211000');
INSERT INTO `x2_cityarea` VALUES ('211005', '211005', '弓长岭区', '211000');
INSERT INTO `x2_cityarea` VALUES ('211011', '211011', '太子河区', '211000');
INSERT INTO `x2_cityarea` VALUES ('211021', '211021', '辽阳县', '211000');
INSERT INTO `x2_cityarea` VALUES ('211081', '211081', '灯塔市', '211000');
INSERT INTO `x2_cityarea` VALUES ('211101', '211101', '市辖区', '211100');
INSERT INTO `x2_cityarea` VALUES ('211102', '211102', '双台子区', '211100');
INSERT INTO `x2_cityarea` VALUES ('211103', '211103', '兴隆台区', '211100');
INSERT INTO `x2_cityarea` VALUES ('211121', '211121', '大洼县', '211100');
INSERT INTO `x2_cityarea` VALUES ('211122', '211122', '盘山县', '211100');
INSERT INTO `x2_cityarea` VALUES ('211201', '211201', '市辖区', '211200');
INSERT INTO `x2_cityarea` VALUES ('211202', '211202', '银州区', '211200');
INSERT INTO `x2_cityarea` VALUES ('211204', '211204', '清河区', '211200');
INSERT INTO `x2_cityarea` VALUES ('211221', '211221', '铁岭县', '211200');
INSERT INTO `x2_cityarea` VALUES ('211223', '211223', '西丰县', '211200');
INSERT INTO `x2_cityarea` VALUES ('211224', '211224', '昌图县', '211200');
INSERT INTO `x2_cityarea` VALUES ('211281', '211281', '调兵山市', '211200');
INSERT INTO `x2_cityarea` VALUES ('211282', '211282', '开原市', '211200');
INSERT INTO `x2_cityarea` VALUES ('211301', '211301', '市辖区', '211300');
INSERT INTO `x2_cityarea` VALUES ('211302', '211302', '双塔区', '211300');
INSERT INTO `x2_cityarea` VALUES ('211303', '211303', '龙城区', '211300');
INSERT INTO `x2_cityarea` VALUES ('211321', '211321', '朝阳县', '211300');
INSERT INTO `x2_cityarea` VALUES ('211322', '211322', '建平县', '211300');
INSERT INTO `x2_cityarea` VALUES ('211324', '211324', '喀喇沁左翼蒙古族自治县', '211300');
INSERT INTO `x2_cityarea` VALUES ('211381', '211381', '北票市', '211300');
INSERT INTO `x2_cityarea` VALUES ('211382', '211382', '凌源市', '211300');
INSERT INTO `x2_cityarea` VALUES ('211401', '211401', '市辖区', '211400');
INSERT INTO `x2_cityarea` VALUES ('211402', '211402', '连山区', '211400');
INSERT INTO `x2_cityarea` VALUES ('211403', '211403', '龙港区', '211400');
INSERT INTO `x2_cityarea` VALUES ('211404', '211404', '南票区', '211400');
INSERT INTO `x2_cityarea` VALUES ('211421', '211421', '绥中县', '211400');
INSERT INTO `x2_cityarea` VALUES ('211422', '211422', '建昌县', '211400');
INSERT INTO `x2_cityarea` VALUES ('211481', '211481', '兴城市', '211400');
INSERT INTO `x2_cityarea` VALUES ('220101', '220101', '市辖区', '220100');
INSERT INTO `x2_cityarea` VALUES ('220102', '220102', '南关区', '220100');
INSERT INTO `x2_cityarea` VALUES ('220103', '220103', '宽城区', '220100');
INSERT INTO `x2_cityarea` VALUES ('220104', '220104', '朝阳区', '220100');
INSERT INTO `x2_cityarea` VALUES ('220105', '220105', '二道区', '220100');
INSERT INTO `x2_cityarea` VALUES ('220106', '220106', '绿园区', '220100');
INSERT INTO `x2_cityarea` VALUES ('220112', '220112', '双阳区', '220100');
INSERT INTO `x2_cityarea` VALUES ('220122', '220122', '农安县', '220100');
INSERT INTO `x2_cityarea` VALUES ('220181', '220181', '九台市', '220100');
INSERT INTO `x2_cityarea` VALUES ('220182', '220182', '榆树市', '220100');
INSERT INTO `x2_cityarea` VALUES ('220183', '220183', '德惠市', '220100');
INSERT INTO `x2_cityarea` VALUES ('220201', '220201', '市辖区', '220200');
INSERT INTO `x2_cityarea` VALUES ('220202', '220202', '昌邑区', '220200');
INSERT INTO `x2_cityarea` VALUES ('220203', '220203', '龙潭区', '220200');
INSERT INTO `x2_cityarea` VALUES ('220204', '220204', '船营区', '220200');
INSERT INTO `x2_cityarea` VALUES ('220211', '220211', '丰满区', '220200');
INSERT INTO `x2_cityarea` VALUES ('220221', '220221', '永吉县', '220200');
INSERT INTO `x2_cityarea` VALUES ('220281', '220281', '蛟河市', '220200');
INSERT INTO `x2_cityarea` VALUES ('220282', '220282', '桦甸市', '220200');
INSERT INTO `x2_cityarea` VALUES ('220283', '220283', '舒兰市', '220200');
INSERT INTO `x2_cityarea` VALUES ('220284', '220284', '磐石市', '220200');
INSERT INTO `x2_cityarea` VALUES ('220301', '220301', '市辖区', '220300');
INSERT INTO `x2_cityarea` VALUES ('220302', '220302', '铁西区', '220300');
INSERT INTO `x2_cityarea` VALUES ('220303', '220303', '铁东区', '220300');
INSERT INTO `x2_cityarea` VALUES ('220322', '220322', '梨树县', '220300');
INSERT INTO `x2_cityarea` VALUES ('220323', '220323', '伊通满族自治县', '220300');
INSERT INTO `x2_cityarea` VALUES ('220381', '220381', '公主岭市', '220300');
INSERT INTO `x2_cityarea` VALUES ('220382', '220382', '双辽市', '220300');
INSERT INTO `x2_cityarea` VALUES ('220401', '220401', '市辖区', '220400');
INSERT INTO `x2_cityarea` VALUES ('220402', '220402', '龙山区', '220400');
INSERT INTO `x2_cityarea` VALUES ('220403', '220403', '西安区', '220400');
INSERT INTO `x2_cityarea` VALUES ('220421', '220421', '东丰县', '220400');
INSERT INTO `x2_cityarea` VALUES ('220422', '220422', '东辽县', '220400');
INSERT INTO `x2_cityarea` VALUES ('220501', '220501', '市辖区', '220500');
INSERT INTO `x2_cityarea` VALUES ('220502', '220502', '东昌区', '220500');
INSERT INTO `x2_cityarea` VALUES ('220503', '220503', '二道江区', '220500');
INSERT INTO `x2_cityarea` VALUES ('220521', '220521', '通化县', '220500');
INSERT INTO `x2_cityarea` VALUES ('220523', '220523', '辉南县', '220500');
INSERT INTO `x2_cityarea` VALUES ('220524', '220524', '柳河县', '220500');
INSERT INTO `x2_cityarea` VALUES ('220581', '220581', '梅河口市', '220500');
INSERT INTO `x2_cityarea` VALUES ('220582', '220582', '集安市', '220500');
INSERT INTO `x2_cityarea` VALUES ('220601', '220601', '市辖区', '220600');
INSERT INTO `x2_cityarea` VALUES ('220602', '220602', '八道江区', '220600');
INSERT INTO `x2_cityarea` VALUES ('220621', '220621', '抚松县', '220600');
INSERT INTO `x2_cityarea` VALUES ('220622', '220622', '靖宇县', '220600');
INSERT INTO `x2_cityarea` VALUES ('220623', '220623', '长白朝鲜族自治县', '220600');
INSERT INTO `x2_cityarea` VALUES ('220604', '220604', '江源区', '220600');
INSERT INTO `x2_cityarea` VALUES ('220681', '220681', '临江市', '220600');
INSERT INTO `x2_cityarea` VALUES ('220701', '220701', '市辖区', '220700');
INSERT INTO `x2_cityarea` VALUES ('220702', '220702', '宁江区', '220700');
INSERT INTO `x2_cityarea` VALUES ('220721', '220721', '前郭尔罗斯蒙古族自治县', '220700');
INSERT INTO `x2_cityarea` VALUES ('220722', '220722', '长岭县', '220700');
INSERT INTO `x2_cityarea` VALUES ('220723', '220723', '乾安县', '220700');
INSERT INTO `x2_cityarea` VALUES ('220724', '220724', '扶余县', '220700');
INSERT INTO `x2_cityarea` VALUES ('220801', '220801', '市辖区', '220800');
INSERT INTO `x2_cityarea` VALUES ('220802', '220802', '洮北区', '220800');
INSERT INTO `x2_cityarea` VALUES ('220821', '220821', '镇赉县', '220800');
INSERT INTO `x2_cityarea` VALUES ('220822', '220822', '通榆县', '220800');
INSERT INTO `x2_cityarea` VALUES ('220881', '220881', '洮南市', '220800');
INSERT INTO `x2_cityarea` VALUES ('220882', '220882', '大安市', '220800');
INSERT INTO `x2_cityarea` VALUES ('222401', '222401', '延吉市', '222400');
INSERT INTO `x2_cityarea` VALUES ('222402', '222402', '图们市', '222400');
INSERT INTO `x2_cityarea` VALUES ('222403', '222403', '敦化市', '222400');
INSERT INTO `x2_cityarea` VALUES ('222404', '222404', '珲春市', '222400');
INSERT INTO `x2_cityarea` VALUES ('222405', '222405', '龙井市', '222400');
INSERT INTO `x2_cityarea` VALUES ('222406', '222406', '和龙市', '222400');
INSERT INTO `x2_cityarea` VALUES ('222424', '222424', '汪清县', '222400');
INSERT INTO `x2_cityarea` VALUES ('222426', '222426', '安图县', '222400');
INSERT INTO `x2_cityarea` VALUES ('230101', '230101', '市辖区', '230100');
INSERT INTO `x2_cityarea` VALUES ('230102', '230102', '道里区', '230100');
INSERT INTO `x2_cityarea` VALUES ('230103', '230103', '南岗区', '230100');
INSERT INTO `x2_cityarea` VALUES ('230104', '230104', '道外区', '230100');
INSERT INTO `x2_cityarea` VALUES ('230110', '230110', '香坊区', '230100');
INSERT INTO `x2_cityarea` VALUES ('230107', '230107', '动力区', '230100');
INSERT INTO `x2_cityarea` VALUES ('230108', '230108', '平房区', '230100');
INSERT INTO `x2_cityarea` VALUES ('230109', '230109', '松北区', '230100');
INSERT INTO `x2_cityarea` VALUES ('230111', '230111', '呼兰区', '230100');
INSERT INTO `x2_cityarea` VALUES ('230123', '230123', '依兰县', '230100');
INSERT INTO `x2_cityarea` VALUES ('230124', '230124', '方正县', '230100');
INSERT INTO `x2_cityarea` VALUES ('230125', '230125', '宾　县', '230100');
INSERT INTO `x2_cityarea` VALUES ('230126', '230126', '巴彦县', '230100');
INSERT INTO `x2_cityarea` VALUES ('230127', '230127', '木兰县', '230100');
INSERT INTO `x2_cityarea` VALUES ('230128', '230128', '通河县', '230100');
INSERT INTO `x2_cityarea` VALUES ('230129', '230129', '延寿县', '230100');
INSERT INTO `x2_cityarea` VALUES ('230112', '230112', '阿城区', '230100');
INSERT INTO `x2_cityarea` VALUES ('230182', '230182', '双城市', '230100');
INSERT INTO `x2_cityarea` VALUES ('230183', '230183', '尚志市', '230100');
INSERT INTO `x2_cityarea` VALUES ('230184', '230184', '五常市', '230100');
INSERT INTO `x2_cityarea` VALUES ('230201', '230201', '市辖区', '230200');
INSERT INTO `x2_cityarea` VALUES ('230202', '230202', '龙沙区', '230200');
INSERT INTO `x2_cityarea` VALUES ('230203', '230203', '建华区', '230200');
INSERT INTO `x2_cityarea` VALUES ('230204', '230204', '铁锋区', '230200');
INSERT INTO `x2_cityarea` VALUES ('230205', '230205', '昂昂溪区', '230200');
INSERT INTO `x2_cityarea` VALUES ('230206', '230206', '富拉尔基区', '230200');
INSERT INTO `x2_cityarea` VALUES ('230207', '230207', '碾子山区', '230200');
INSERT INTO `x2_cityarea` VALUES ('230208', '230208', '梅里斯达斡尔族区', '230200');
INSERT INTO `x2_cityarea` VALUES ('230221', '230221', '龙江县', '230200');
INSERT INTO `x2_cityarea` VALUES ('230223', '230223', '依安县', '230200');
INSERT INTO `x2_cityarea` VALUES ('230224', '230224', '泰来县', '230200');
INSERT INTO `x2_cityarea` VALUES ('230225', '230225', '甘南县', '230200');
INSERT INTO `x2_cityarea` VALUES ('230227', '230227', '富裕县', '230200');
INSERT INTO `x2_cityarea` VALUES ('230229', '230229', '克山县', '230200');
INSERT INTO `x2_cityarea` VALUES ('230230', '230230', '克东县', '230200');
INSERT INTO `x2_cityarea` VALUES ('230231', '230231', '拜泉县', '230200');
INSERT INTO `x2_cityarea` VALUES ('230281', '230281', '讷河市', '230200');
INSERT INTO `x2_cityarea` VALUES ('230301', '230301', '市辖区', '230300');
INSERT INTO `x2_cityarea` VALUES ('230302', '230302', '鸡冠区', '230300');
INSERT INTO `x2_cityarea` VALUES ('230303', '230303', '恒山区', '230300');
INSERT INTO `x2_cityarea` VALUES ('230304', '230304', '滴道区', '230300');
INSERT INTO `x2_cityarea` VALUES ('230305', '230305', '梨树区', '230300');
INSERT INTO `x2_cityarea` VALUES ('230306', '230306', '城子河区', '230300');
INSERT INTO `x2_cityarea` VALUES ('230307', '230307', '麻山区', '230300');
INSERT INTO `x2_cityarea` VALUES ('230321', '230321', '鸡东县', '230300');
INSERT INTO `x2_cityarea` VALUES ('230381', '230381', '虎林市', '230300');
INSERT INTO `x2_cityarea` VALUES ('230382', '230382', '密山市', '230300');
INSERT INTO `x2_cityarea` VALUES ('230401', '230401', '市辖区', '230400');
INSERT INTO `x2_cityarea` VALUES ('230402', '230402', '向阳区', '230400');
INSERT INTO `x2_cityarea` VALUES ('230403', '230403', '工农区', '230400');
INSERT INTO `x2_cityarea` VALUES ('230404', '230404', '南山区', '230400');
INSERT INTO `x2_cityarea` VALUES ('230405', '230405', '兴安区', '230400');
INSERT INTO `x2_cityarea` VALUES ('230406', '230406', '东山区', '230400');
INSERT INTO `x2_cityarea` VALUES ('230407', '230407', '兴山区', '230400');
INSERT INTO `x2_cityarea` VALUES ('230421', '230421', '萝北县', '230400');
INSERT INTO `x2_cityarea` VALUES ('230422', '230422', '绥滨县', '230400');
INSERT INTO `x2_cityarea` VALUES ('230501', '230501', '市辖区', '230500');
INSERT INTO `x2_cityarea` VALUES ('230502', '230502', '尖山区', '230500');
INSERT INTO `x2_cityarea` VALUES ('230503', '230503', '岭东区', '230500');
INSERT INTO `x2_cityarea` VALUES ('230505', '230505', '四方台区', '230500');
INSERT INTO `x2_cityarea` VALUES ('230506', '230506', '宝山区', '230500');
INSERT INTO `x2_cityarea` VALUES ('230521', '230521', '集贤县', '230500');
INSERT INTO `x2_cityarea` VALUES ('230522', '230522', '友谊县', '230500');
INSERT INTO `x2_cityarea` VALUES ('230523', '230523', '宝清县', '230500');
INSERT INTO `x2_cityarea` VALUES ('230524', '230524', '饶河县', '230500');
INSERT INTO `x2_cityarea` VALUES ('230601', '230601', '市辖区', '230600');
INSERT INTO `x2_cityarea` VALUES ('230602', '230602', '萨尔图区', '230600');
INSERT INTO `x2_cityarea` VALUES ('230603', '230603', '龙凤区', '230600');
INSERT INTO `x2_cityarea` VALUES ('230604', '230604', '让胡路区', '230600');
INSERT INTO `x2_cityarea` VALUES ('230605', '230605', '红岗区', '230600');
INSERT INTO `x2_cityarea` VALUES ('230606', '230606', '大同区', '230600');
INSERT INTO `x2_cityarea` VALUES ('230621', '230621', '肇州县', '230600');
INSERT INTO `x2_cityarea` VALUES ('230622', '230622', '肇源县', '230600');
INSERT INTO `x2_cityarea` VALUES ('230623', '230623', '林甸县', '230600');
INSERT INTO `x2_cityarea` VALUES ('230624', '230624', '杜尔伯特蒙古族自治县', '230600');
INSERT INTO `x2_cityarea` VALUES ('230701', '230701', '市辖区', '230700');
INSERT INTO `x2_cityarea` VALUES ('230702', '230702', '伊春区', '230700');
INSERT INTO `x2_cityarea` VALUES ('230703', '230703', '南岔区', '230700');
INSERT INTO `x2_cityarea` VALUES ('230704', '230704', '友好区', '230700');
INSERT INTO `x2_cityarea` VALUES ('230705', '230705', '西林区', '230700');
INSERT INTO `x2_cityarea` VALUES ('230706', '230706', '翠峦区', '230700');
INSERT INTO `x2_cityarea` VALUES ('230707', '230707', '新青区', '230700');
INSERT INTO `x2_cityarea` VALUES ('230708', '230708', '美溪区', '230700');
INSERT INTO `x2_cityarea` VALUES ('230709', '230709', '金山屯区', '230700');
INSERT INTO `x2_cityarea` VALUES ('230710', '230710', '五营区', '230700');
INSERT INTO `x2_cityarea` VALUES ('230711', '230711', '乌马河区', '230700');
INSERT INTO `x2_cityarea` VALUES ('230712', '230712', '汤旺河区', '230700');
INSERT INTO `x2_cityarea` VALUES ('230713', '230713', '带岭区', '230700');
INSERT INTO `x2_cityarea` VALUES ('230714', '230714', '乌伊岭区', '230700');
INSERT INTO `x2_cityarea` VALUES ('230715', '230715', '红星区', '230700');
INSERT INTO `x2_cityarea` VALUES ('230716', '230716', '上甘岭区', '230700');
INSERT INTO `x2_cityarea` VALUES ('230722', '230722', '嘉荫县', '230700');
INSERT INTO `x2_cityarea` VALUES ('230781', '230781', '铁力市', '230700');
INSERT INTO `x2_cityarea` VALUES ('230801', '230801', '市辖区', '230800');
INSERT INTO `x2_cityarea` VALUES ('230802', '230802', '永红区', '230800');
INSERT INTO `x2_cityarea` VALUES ('230803', '230803', '向阳区', '230800');
INSERT INTO `x2_cityarea` VALUES ('230804', '230804', '前进区', '230800');
INSERT INTO `x2_cityarea` VALUES ('230805', '230805', '东风区', '230800');
INSERT INTO `x2_cityarea` VALUES ('230811', '230811', '郊　区', '230800');
INSERT INTO `x2_cityarea` VALUES ('230822', '230822', '桦南县', '230800');
INSERT INTO `x2_cityarea` VALUES ('230826', '230826', '桦川县', '230800');
INSERT INTO `x2_cityarea` VALUES ('230828', '230828', '汤原县', '230800');
INSERT INTO `x2_cityarea` VALUES ('230833', '230833', '抚远县', '230800');
INSERT INTO `x2_cityarea` VALUES ('230881', '230881', '同江市', '230800');
INSERT INTO `x2_cityarea` VALUES ('230882', '230882', '富锦市', '230800');
INSERT INTO `x2_cityarea` VALUES ('230901', '230901', '市辖区', '230900');
INSERT INTO `x2_cityarea` VALUES ('230902', '230902', '新兴区', '230900');
INSERT INTO `x2_cityarea` VALUES ('230903', '230903', '桃山区', '230900');
INSERT INTO `x2_cityarea` VALUES ('230904', '230904', '茄子河区', '230900');
INSERT INTO `x2_cityarea` VALUES ('230921', '230921', '勃利县', '230900');
INSERT INTO `x2_cityarea` VALUES ('231001', '231001', '市辖区', '231000');
INSERT INTO `x2_cityarea` VALUES ('231002', '231002', '东安区', '231000');
INSERT INTO `x2_cityarea` VALUES ('231003', '231003', '阳明区', '231000');
INSERT INTO `x2_cityarea` VALUES ('231004', '231004', '爱民区', '231000');
INSERT INTO `x2_cityarea` VALUES ('231005', '231005', '西安区', '231000');
INSERT INTO `x2_cityarea` VALUES ('231024', '231024', '东宁县', '231000');
INSERT INTO `x2_cityarea` VALUES ('231025', '231025', '林口县', '231000');
INSERT INTO `x2_cityarea` VALUES ('231081', '231081', '绥芬河市', '231000');
INSERT INTO `x2_cityarea` VALUES ('231083', '231083', '海林市', '231000');
INSERT INTO `x2_cityarea` VALUES ('231084', '231084', '宁安市', '231000');
INSERT INTO `x2_cityarea` VALUES ('231085', '231085', '穆棱市', '231000');
INSERT INTO `x2_cityarea` VALUES ('231101', '231101', '市辖区', '231100');
INSERT INTO `x2_cityarea` VALUES ('231102', '231102', '爱辉区', '231100');
INSERT INTO `x2_cityarea` VALUES ('231121', '231121', '嫩江县', '231100');
INSERT INTO `x2_cityarea` VALUES ('231123', '231123', '逊克县', '231100');
INSERT INTO `x2_cityarea` VALUES ('231124', '231124', '孙吴县', '231100');
INSERT INTO `x2_cityarea` VALUES ('231181', '231181', '北安市', '231100');
INSERT INTO `x2_cityarea` VALUES ('231182', '231182', '五大连池市', '231100');
INSERT INTO `x2_cityarea` VALUES ('231201', '231201', '市辖区', '231200');
INSERT INTO `x2_cityarea` VALUES ('231202', '231202', '北林区', '231200');
INSERT INTO `x2_cityarea` VALUES ('231221', '231221', '望奎县', '231200');
INSERT INTO `x2_cityarea` VALUES ('231222', '231222', '兰西县', '231200');
INSERT INTO `x2_cityarea` VALUES ('231223', '231223', '青冈县', '231200');
INSERT INTO `x2_cityarea` VALUES ('231224', '231224', '庆安县', '231200');
INSERT INTO `x2_cityarea` VALUES ('231225', '231225', '明水县', '231200');
INSERT INTO `x2_cityarea` VALUES ('231226', '231226', '绥棱县', '231200');
INSERT INTO `x2_cityarea` VALUES ('231281', '231281', '安达市', '231200');
INSERT INTO `x2_cityarea` VALUES ('231282', '231282', '肇东市', '231200');
INSERT INTO `x2_cityarea` VALUES ('231283', '231283', '海伦市', '231200');
INSERT INTO `x2_cityarea` VALUES ('232721', '232721', '呼玛县', '232700');
INSERT INTO `x2_cityarea` VALUES ('232722', '232722', '塔河县', '232700');
INSERT INTO `x2_cityarea` VALUES ('232723', '232723', '漠河县', '232700');
INSERT INTO `x2_cityarea` VALUES ('310101', '310101', '黄浦区', '310100');
INSERT INTO `x2_cityarea` VALUES ('310103', '310103', '卢湾区', '310100');
INSERT INTO `x2_cityarea` VALUES ('310104', '310104', '徐汇区', '310100');
INSERT INTO `x2_cityarea` VALUES ('310105', '310105', '长宁区', '310100');
INSERT INTO `x2_cityarea` VALUES ('310106', '310106', '静安区', '310100');
INSERT INTO `x2_cityarea` VALUES ('310107', '310107', '普陀区', '310100');
INSERT INTO `x2_cityarea` VALUES ('310108', '310108', '闸北区', '310100');
INSERT INTO `x2_cityarea` VALUES ('310109', '310109', '虹口区', '310100');
INSERT INTO `x2_cityarea` VALUES ('310110', '310110', '杨浦区', '310100');
INSERT INTO `x2_cityarea` VALUES ('310112', '310112', '闵行区', '310100');
INSERT INTO `x2_cityarea` VALUES ('310113', '310113', '宝山区', '310100');
INSERT INTO `x2_cityarea` VALUES ('310114', '310114', '嘉定区', '310100');
INSERT INTO `x2_cityarea` VALUES ('310115', '310115', '浦东新区', '310100');
INSERT INTO `x2_cityarea` VALUES ('310116', '310116', '金山区', '310100');
INSERT INTO `x2_cityarea` VALUES ('310117', '310117', '松江区', '310100');
INSERT INTO `x2_cityarea` VALUES ('310118', '310118', '青浦区', '310100');
INSERT INTO `x2_cityarea` VALUES ('310119', '310119', '南汇区', '310100');
INSERT INTO `x2_cityarea` VALUES ('310120', '310120', '奉贤区', '310100');
INSERT INTO `x2_cityarea` VALUES ('310230', '310230', '崇明县', '310200');
INSERT INTO `x2_cityarea` VALUES ('320101', '320101', '市辖区', '320100');
INSERT INTO `x2_cityarea` VALUES ('320102', '320102', '玄武区', '320100');
INSERT INTO `x2_cityarea` VALUES ('320103', '320103', '白下区', '320100');
INSERT INTO `x2_cityarea` VALUES ('320104', '320104', '秦淮区', '320100');
INSERT INTO `x2_cityarea` VALUES ('320105', '320105', '建邺区', '320100');
INSERT INTO `x2_cityarea` VALUES ('320106', '320106', '鼓楼区', '320100');
INSERT INTO `x2_cityarea` VALUES ('320107', '320107', '下关区', '320100');
INSERT INTO `x2_cityarea` VALUES ('320111', '320111', '浦口区', '320100');
INSERT INTO `x2_cityarea` VALUES ('320113', '320113', '栖霞区', '320100');
INSERT INTO `x2_cityarea` VALUES ('320114', '320114', '雨花台区', '320100');
INSERT INTO `x2_cityarea` VALUES ('320115', '320115', '江宁区', '320100');
INSERT INTO `x2_cityarea` VALUES ('320116', '320116', '六合区', '320100');
INSERT INTO `x2_cityarea` VALUES ('320124', '320124', '溧水县', '320100');
INSERT INTO `x2_cityarea` VALUES ('320125', '320125', '高淳县', '320100');
INSERT INTO `x2_cityarea` VALUES ('320201', '320201', '市辖区', '320200');
INSERT INTO `x2_cityarea` VALUES ('320202', '320202', '崇安区', '320200');
INSERT INTO `x2_cityarea` VALUES ('320203', '320203', '南长区', '320200');
INSERT INTO `x2_cityarea` VALUES ('320204', '320204', '北塘区', '320200');
INSERT INTO `x2_cityarea` VALUES ('320205', '320205', '锡山区', '320200');
INSERT INTO `x2_cityarea` VALUES ('320206', '320206', '惠山区', '320200');
INSERT INTO `x2_cityarea` VALUES ('320211', '320211', '滨湖区', '320200');
INSERT INTO `x2_cityarea` VALUES ('320281', '320281', '江阴市', '320200');
INSERT INTO `x2_cityarea` VALUES ('320282', '320282', '宜兴市', '320200');
INSERT INTO `x2_cityarea` VALUES ('320301', '320301', '市辖区', '320300');
INSERT INTO `x2_cityarea` VALUES ('320302', '320302', '鼓楼区', '320300');
INSERT INTO `x2_cityarea` VALUES ('320303', '320303', '云龙区', '320300');
INSERT INTO `x2_cityarea` VALUES ('320304', '320304', '九里区', '320300');
INSERT INTO `x2_cityarea` VALUES ('320305', '320305', '贾汪区', '320300');
INSERT INTO `x2_cityarea` VALUES ('320311', '320311', '泉山区', '320300');
INSERT INTO `x2_cityarea` VALUES ('320321', '320321', '丰　县', '320300');
INSERT INTO `x2_cityarea` VALUES ('320322', '320322', '沛　县', '320300');
INSERT INTO `x2_cityarea` VALUES ('320323', '320323', '铜山县', '320300');
INSERT INTO `x2_cityarea` VALUES ('320324', '320324', '睢宁县', '320300');
INSERT INTO `x2_cityarea` VALUES ('320381', '320381', '新沂市', '320300');
INSERT INTO `x2_cityarea` VALUES ('320382', '320382', '邳州市', '320300');
INSERT INTO `x2_cityarea` VALUES ('320401', '320401', '市辖区', '320400');
INSERT INTO `x2_cityarea` VALUES ('320402', '320402', '天宁区', '320400');
INSERT INTO `x2_cityarea` VALUES ('320404', '320404', '钟楼区', '320400');
INSERT INTO `x2_cityarea` VALUES ('320405', '320405', '戚墅堰区', '320400');
INSERT INTO `x2_cityarea` VALUES ('320411', '320411', '新北区', '320400');
INSERT INTO `x2_cityarea` VALUES ('320412', '320412', '武进区', '320400');
INSERT INTO `x2_cityarea` VALUES ('320481', '320481', '溧阳市', '320400');
INSERT INTO `x2_cityarea` VALUES ('320482', '320482', '金坛市', '320400');
INSERT INTO `x2_cityarea` VALUES ('320501', '320501', '市辖区', '320500');
INSERT INTO `x2_cityarea` VALUES ('320502', '320502', '沧浪区', '320500');
INSERT INTO `x2_cityarea` VALUES ('320503', '320503', '平江区', '320500');
INSERT INTO `x2_cityarea` VALUES ('320504', '320504', '金阊区', '320500');
INSERT INTO `x2_cityarea` VALUES ('320505', '320505', '虎丘区', '320500');
INSERT INTO `x2_cityarea` VALUES ('320506', '320506', '吴中区', '320500');
INSERT INTO `x2_cityarea` VALUES ('320507', '320507', '相城区', '320500');
INSERT INTO `x2_cityarea` VALUES ('320581', '320581', '常熟市', '320500');
INSERT INTO `x2_cityarea` VALUES ('320582', '320582', '张家港市', '320500');
INSERT INTO `x2_cityarea` VALUES ('320583', '320583', '昆山市', '320500');
INSERT INTO `x2_cityarea` VALUES ('320584', '320584', '吴江市', '320500');
INSERT INTO `x2_cityarea` VALUES ('320585', '320585', '太仓市', '320500');
INSERT INTO `x2_cityarea` VALUES ('320601', '320601', '市辖区', '320600');
INSERT INTO `x2_cityarea` VALUES ('320602', '320602', '崇川区', '320600');
INSERT INTO `x2_cityarea` VALUES ('320611', '320611', '港闸区', '320600');
INSERT INTO `x2_cityarea` VALUES ('320621', '320621', '海安县', '320600');
INSERT INTO `x2_cityarea` VALUES ('320623', '320623', '如东县', '320600');
INSERT INTO `x2_cityarea` VALUES ('320681', '320681', '启东市', '320600');
INSERT INTO `x2_cityarea` VALUES ('320682', '320682', '如皋市', '320600');
INSERT INTO `x2_cityarea` VALUES ('320683', '320683', '通州市', '320600');
INSERT INTO `x2_cityarea` VALUES ('320684', '320684', '海门市', '320600');
INSERT INTO `x2_cityarea` VALUES ('320701', '320701', '市辖区', '320700');
INSERT INTO `x2_cityarea` VALUES ('320703', '320703', '连云区', '320700');
INSERT INTO `x2_cityarea` VALUES ('320705', '320705', '新浦区', '320700');
INSERT INTO `x2_cityarea` VALUES ('320706', '320706', '海州区', '320700');
INSERT INTO `x2_cityarea` VALUES ('320721', '320721', '赣榆县', '320700');
INSERT INTO `x2_cityarea` VALUES ('320722', '320722', '东海县', '320700');
INSERT INTO `x2_cityarea` VALUES ('320723', '320723', '灌云县', '320700');
INSERT INTO `x2_cityarea` VALUES ('320724', '320724', '灌南县', '320700');
INSERT INTO `x2_cityarea` VALUES ('320801', '320801', '市辖区', '320800');
INSERT INTO `x2_cityarea` VALUES ('320802', '320802', '清河区', '320800');
INSERT INTO `x2_cityarea` VALUES ('320803', '320803', '楚州区', '320800');
INSERT INTO `x2_cityarea` VALUES ('320804', '320804', '淮阴区', '320800');
INSERT INTO `x2_cityarea` VALUES ('320811', '320811', '清浦区', '320800');
INSERT INTO `x2_cityarea` VALUES ('320826', '320826', '涟水县', '320800');
INSERT INTO `x2_cityarea` VALUES ('320829', '320829', '洪泽县', '320800');
INSERT INTO `x2_cityarea` VALUES ('320830', '320830', '盱眙县', '320800');
INSERT INTO `x2_cityarea` VALUES ('320831', '320831', '金湖县', '320800');
INSERT INTO `x2_cityarea` VALUES ('320901', '320901', '市辖区', '320900');
INSERT INTO `x2_cityarea` VALUES ('320902', '320902', '亭湖区', '320900');
INSERT INTO `x2_cityarea` VALUES ('320903', '320903', '盐都区', '320900');
INSERT INTO `x2_cityarea` VALUES ('320921', '320921', '响水县', '320900');
INSERT INTO `x2_cityarea` VALUES ('320922', '320922', '滨海县', '320900');
INSERT INTO `x2_cityarea` VALUES ('320923', '320923', '阜宁县', '320900');
INSERT INTO `x2_cityarea` VALUES ('320924', '320924', '射阳县', '320900');
INSERT INTO `x2_cityarea` VALUES ('320925', '320925', '建湖县', '320900');
INSERT INTO `x2_cityarea` VALUES ('320981', '320981', '东台市', '320900');
INSERT INTO `x2_cityarea` VALUES ('320982', '320982', '大丰市', '320900');
INSERT INTO `x2_cityarea` VALUES ('321001', '321001', '市辖区', '321000');
INSERT INTO `x2_cityarea` VALUES ('321002', '321002', '广陵区', '321000');
INSERT INTO `x2_cityarea` VALUES ('321003', '321003', '邗江区', '321000');
INSERT INTO `x2_cityarea` VALUES ('321011', '321011', '维扬区', '321000');
INSERT INTO `x2_cityarea` VALUES ('321023', '321023', '宝应县', '321000');
INSERT INTO `x2_cityarea` VALUES ('321081', '321081', '仪征市', '321000');
INSERT INTO `x2_cityarea` VALUES ('321084', '321084', '高邮市', '321000');
INSERT INTO `x2_cityarea` VALUES ('321088', '321088', '江都市', '321000');
INSERT INTO `x2_cityarea` VALUES ('321101', '321101', '市区', '321100');
INSERT INTO `x2_cityarea` VALUES ('321102', '321102', '京口区', '321100');
INSERT INTO `x2_cityarea` VALUES ('321111', '321111', '润州区', '321100');
INSERT INTO `x2_cityarea` VALUES ('321112', '321112', '丹徒区', '321100');
INSERT INTO `x2_cityarea` VALUES ('321181', '321181', '丹阳市', '321100');
INSERT INTO `x2_cityarea` VALUES ('321182', '321182', '扬中市', '321100');
INSERT INTO `x2_cityarea` VALUES ('321183', '321183', '句容市', '321100');
INSERT INTO `x2_cityarea` VALUES ('321201', '321201', '市辖区', '321200');
INSERT INTO `x2_cityarea` VALUES ('321202', '321202', '海陵区', '321200');
INSERT INTO `x2_cityarea` VALUES ('321203', '321203', '高港区', '321200');
INSERT INTO `x2_cityarea` VALUES ('321281', '321281', '兴化市', '321200');
INSERT INTO `x2_cityarea` VALUES ('321282', '321282', '靖江市', '321200');
INSERT INTO `x2_cityarea` VALUES ('321283', '321283', '泰兴市', '321200');
INSERT INTO `x2_cityarea` VALUES ('321284', '321284', '姜堰市', '321200');
INSERT INTO `x2_cityarea` VALUES ('321301', '321301', '市辖区', '321300');
INSERT INTO `x2_cityarea` VALUES ('321302', '321302', '宿城区', '321300');
INSERT INTO `x2_cityarea` VALUES ('321311', '321311', '宿豫区', '321300');
INSERT INTO `x2_cityarea` VALUES ('321322', '321322', '沭阳县', '321300');
INSERT INTO `x2_cityarea` VALUES ('321323', '321323', '泗阳县', '321300');
INSERT INTO `x2_cityarea` VALUES ('321324', '321324', '泗洪县', '321300');
INSERT INTO `x2_cityarea` VALUES ('330101', '330101', '市辖区', '330100');
INSERT INTO `x2_cityarea` VALUES ('330102', '330102', '上城区', '330100');
INSERT INTO `x2_cityarea` VALUES ('330103', '330103', '下城区', '330100');
INSERT INTO `x2_cityarea` VALUES ('330104', '330104', '江干区', '330100');
INSERT INTO `x2_cityarea` VALUES ('330105', '330105', '拱墅区', '330100');
INSERT INTO `x2_cityarea` VALUES ('330106', '330106', '西湖区', '330100');
INSERT INTO `x2_cityarea` VALUES ('330108', '330108', '滨江区', '330100');
INSERT INTO `x2_cityarea` VALUES ('330109', '330109', '萧山区', '330100');
INSERT INTO `x2_cityarea` VALUES ('330110', '330110', '余杭区', '330100');
INSERT INTO `x2_cityarea` VALUES ('330122', '330122', '桐庐县', '330100');
INSERT INTO `x2_cityarea` VALUES ('330127', '330127', '淳安县', '330100');
INSERT INTO `x2_cityarea` VALUES ('330182', '330182', '建德市', '330100');
INSERT INTO `x2_cityarea` VALUES ('330183', '330183', '富阳市', '330100');
INSERT INTO `x2_cityarea` VALUES ('330185', '330185', '临安市', '330100');
INSERT INTO `x2_cityarea` VALUES ('330201', '330201', '市辖区', '330200');
INSERT INTO `x2_cityarea` VALUES ('330203', '330203', '海曙区', '330200');
INSERT INTO `x2_cityarea` VALUES ('330204', '330204', '江东区', '330200');
INSERT INTO `x2_cityarea` VALUES ('330205', '330205', '江北区', '330200');
INSERT INTO `x2_cityarea` VALUES ('330206', '330206', '北仑区', '330200');
INSERT INTO `x2_cityarea` VALUES ('330211', '330211', '镇海区', '330200');
INSERT INTO `x2_cityarea` VALUES ('330212', '330212', '鄞州区', '330200');
INSERT INTO `x2_cityarea` VALUES ('330225', '330225', '象山县', '330200');
INSERT INTO `x2_cityarea` VALUES ('330226', '330226', '宁海县', '330200');
INSERT INTO `x2_cityarea` VALUES ('330281', '330281', '余姚市', '330200');
INSERT INTO `x2_cityarea` VALUES ('330282', '330282', '慈溪市', '330200');
INSERT INTO `x2_cityarea` VALUES ('330283', '330283', '奉化市', '330200');
INSERT INTO `x2_cityarea` VALUES ('330301', '330301', '市辖区', '330300');
INSERT INTO `x2_cityarea` VALUES ('330302', '330302', '鹿城区', '330300');
INSERT INTO `x2_cityarea` VALUES ('330303', '330303', '龙湾区', '330300');
INSERT INTO `x2_cityarea` VALUES ('330304', '330304', '瓯海区', '330300');
INSERT INTO `x2_cityarea` VALUES ('330322', '330322', '洞头县', '330300');
INSERT INTO `x2_cityarea` VALUES ('330324', '330324', '永嘉县', '330300');
INSERT INTO `x2_cityarea` VALUES ('330326', '330326', '平阳县', '330300');
INSERT INTO `x2_cityarea` VALUES ('330327', '330327', '苍南县', '330300');
INSERT INTO `x2_cityarea` VALUES ('330328', '330328', '文成县', '330300');
INSERT INTO `x2_cityarea` VALUES ('330329', '330329', '泰顺县', '330300');
INSERT INTO `x2_cityarea` VALUES ('330381', '330381', '瑞安市', '330300');
INSERT INTO `x2_cityarea` VALUES ('330382', '330382', '乐清市', '330300');
INSERT INTO `x2_cityarea` VALUES ('330401', '330401', '市辖区', '330400');
INSERT INTO `x2_cityarea` VALUES ('330402', '330402', '南湖区', '330400');
INSERT INTO `x2_cityarea` VALUES ('330411', '330411', '秀洲区', '330400');
INSERT INTO `x2_cityarea` VALUES ('330421', '330421', '嘉善县', '330400');
INSERT INTO `x2_cityarea` VALUES ('330424', '330424', '海盐县', '330400');
INSERT INTO `x2_cityarea` VALUES ('330481', '330481', '海宁市', '330400');
INSERT INTO `x2_cityarea` VALUES ('330482', '330482', '平湖市', '330400');
INSERT INTO `x2_cityarea` VALUES ('330483', '330483', '桐乡市', '330400');
INSERT INTO `x2_cityarea` VALUES ('330501', '330501', '市辖区', '330500');
INSERT INTO `x2_cityarea` VALUES ('330502', '330502', '吴兴区', '330500');
INSERT INTO `x2_cityarea` VALUES ('330503', '330503', '南浔区', '330500');
INSERT INTO `x2_cityarea` VALUES ('330521', '330521', '德清县', '330500');
INSERT INTO `x2_cityarea` VALUES ('330522', '330522', '长兴县', '330500');
INSERT INTO `x2_cityarea` VALUES ('330523', '330523', '安吉县', '330500');
INSERT INTO `x2_cityarea` VALUES ('330601', '330601', '市辖区', '330600');
INSERT INTO `x2_cityarea` VALUES ('330602', '330602', '越城区', '330600');
INSERT INTO `x2_cityarea` VALUES ('330621', '330621', '绍兴县', '330600');
INSERT INTO `x2_cityarea` VALUES ('330624', '330624', '新昌县', '330600');
INSERT INTO `x2_cityarea` VALUES ('330681', '330681', '诸暨市', '330600');
INSERT INTO `x2_cityarea` VALUES ('330682', '330682', '上虞市', '330600');
INSERT INTO `x2_cityarea` VALUES ('330683', '330683', '嵊州市', '330600');
INSERT INTO `x2_cityarea` VALUES ('330701', '330701', '市辖区', '330700');
INSERT INTO `x2_cityarea` VALUES ('330702', '330702', '婺城区', '330700');
INSERT INTO `x2_cityarea` VALUES ('330703', '330703', '金东区', '330700');
INSERT INTO `x2_cityarea` VALUES ('330723', '330723', '武义县', '330700');
INSERT INTO `x2_cityarea` VALUES ('330726', '330726', '浦江县', '330700');
INSERT INTO `x2_cityarea` VALUES ('330727', '330727', '磐安县', '330700');
INSERT INTO `x2_cityarea` VALUES ('330781', '330781', '兰溪市', '330700');
INSERT INTO `x2_cityarea` VALUES ('330782', '330782', '义乌市', '330700');
INSERT INTO `x2_cityarea` VALUES ('330783', '330783', '东阳市', '330700');
INSERT INTO `x2_cityarea` VALUES ('330784', '330784', '永康市', '330700');
INSERT INTO `x2_cityarea` VALUES ('330801', '330801', '市辖区', '330800');
INSERT INTO `x2_cityarea` VALUES ('330802', '330802', '柯城区', '330800');
INSERT INTO `x2_cityarea` VALUES ('330803', '330803', '衢江区', '330800');
INSERT INTO `x2_cityarea` VALUES ('330822', '330822', '常山县', '330800');
INSERT INTO `x2_cityarea` VALUES ('330824', '330824', '开化县', '330800');
INSERT INTO `x2_cityarea` VALUES ('330825', '330825', '龙游县', '330800');
INSERT INTO `x2_cityarea` VALUES ('330881', '330881', '江山市', '330800');
INSERT INTO `x2_cityarea` VALUES ('330901', '330901', '市辖区', '330900');
INSERT INTO `x2_cityarea` VALUES ('330902', '330902', '定海区', '330900');
INSERT INTO `x2_cityarea` VALUES ('330903', '330903', '普陀区', '330900');
INSERT INTO `x2_cityarea` VALUES ('330921', '330921', '岱山县', '330900');
INSERT INTO `x2_cityarea` VALUES ('330922', '330922', '嵊泗县', '330900');
INSERT INTO `x2_cityarea` VALUES ('331001', '331001', '市辖区', '331000');
INSERT INTO `x2_cityarea` VALUES ('331002', '331002', '椒江区', '331000');
INSERT INTO `x2_cityarea` VALUES ('331003', '331003', '黄岩区', '331000');
INSERT INTO `x2_cityarea` VALUES ('331004', '331004', '路桥区', '331000');
INSERT INTO `x2_cityarea` VALUES ('331021', '331021', '玉环县', '331000');
INSERT INTO `x2_cityarea` VALUES ('331022', '331022', '三门县', '331000');
INSERT INTO `x2_cityarea` VALUES ('331023', '331023', '天台县', '331000');
INSERT INTO `x2_cityarea` VALUES ('331024', '331024', '仙居县', '331000');
INSERT INTO `x2_cityarea` VALUES ('331081', '331081', '温岭市', '331000');
INSERT INTO `x2_cityarea` VALUES ('331082', '331082', '临海市', '331000');
INSERT INTO `x2_cityarea` VALUES ('331101', '331101', '市辖区', '331100');
INSERT INTO `x2_cityarea` VALUES ('331102', '331102', '莲都区', '331100');
INSERT INTO `x2_cityarea` VALUES ('331121', '331121', '青田县', '331100');
INSERT INTO `x2_cityarea` VALUES ('331122', '331122', '缙云县', '331100');
INSERT INTO `x2_cityarea` VALUES ('331123', '331123', '遂昌县', '331100');
INSERT INTO `x2_cityarea` VALUES ('331124', '331124', '松阳县', '331100');
INSERT INTO `x2_cityarea` VALUES ('331125', '331125', '云和县', '331100');
INSERT INTO `x2_cityarea` VALUES ('331126', '331126', '庆元县', '331100');
INSERT INTO `x2_cityarea` VALUES ('331127', '331127', '景宁畲族自治县', '331100');
INSERT INTO `x2_cityarea` VALUES ('331181', '331181', '龙泉市', '331100');
INSERT INTO `x2_cityarea` VALUES ('340101', '340101', '市辖区', '340100');
INSERT INTO `x2_cityarea` VALUES ('340102', '340102', '瑶海区', '340100');
INSERT INTO `x2_cityarea` VALUES ('340103', '340103', '庐阳区', '340100');
INSERT INTO `x2_cityarea` VALUES ('340104', '340104', '蜀山区', '340100');
INSERT INTO `x2_cityarea` VALUES ('340111', '340111', '包河区', '340100');
INSERT INTO `x2_cityarea` VALUES ('340121', '340121', '长丰县', '340100');
INSERT INTO `x2_cityarea` VALUES ('340122', '340122', '肥东县', '340100');
INSERT INTO `x2_cityarea` VALUES ('340123', '340123', '肥西县', '340100');
INSERT INTO `x2_cityarea` VALUES ('340201', '340201', '市辖区', '340200');
INSERT INTO `x2_cityarea` VALUES ('340202', '340202', '镜湖区', '340200');
INSERT INTO `x2_cityarea` VALUES ('340203', '340203', '弋江区', '340200');
INSERT INTO `x2_cityarea` VALUES ('340204', '340204', '新芜区', '340200');
INSERT INTO `x2_cityarea` VALUES ('340207', '340207', '鸠江区', '340200');
INSERT INTO `x2_cityarea` VALUES ('340221', '340221', '芜湖县', '340200');
INSERT INTO `x2_cityarea` VALUES ('340222', '340222', '繁昌县', '340200');
INSERT INTO `x2_cityarea` VALUES ('340223', '340223', '南陵县', '340200');
INSERT INTO `x2_cityarea` VALUES ('340301', '340301', '市辖区', '340300');
INSERT INTO `x2_cityarea` VALUES ('340302', '340302', '龙子湖区', '340300');
INSERT INTO `x2_cityarea` VALUES ('340303', '340303', '蚌山区', '340300');
INSERT INTO `x2_cityarea` VALUES ('340304', '340304', '禹会区', '340300');
INSERT INTO `x2_cityarea` VALUES ('340311', '340311', '淮上区', '340300');
INSERT INTO `x2_cityarea` VALUES ('340321', '340321', '怀远县', '340300');
INSERT INTO `x2_cityarea` VALUES ('340322', '340322', '五河县', '340300');
INSERT INTO `x2_cityarea` VALUES ('340323', '340323', '固镇县', '340300');
INSERT INTO `x2_cityarea` VALUES ('340401', '340401', '市辖区', '340400');
INSERT INTO `x2_cityarea` VALUES ('340402', '340402', '大通区', '340400');
INSERT INTO `x2_cityarea` VALUES ('340403', '340403', '田家庵区', '340400');
INSERT INTO `x2_cityarea` VALUES ('340404', '340404', '谢家集区', '340400');
INSERT INTO `x2_cityarea` VALUES ('340405', '340405', '八公山区', '340400');
INSERT INTO `x2_cityarea` VALUES ('340406', '340406', '潘集区', '340400');
INSERT INTO `x2_cityarea` VALUES ('340421', '340421', '凤台县', '340400');
INSERT INTO `x2_cityarea` VALUES ('340501', '340501', '市辖区', '340500');
INSERT INTO `x2_cityarea` VALUES ('340502', '340502', '金家庄区', '340500');
INSERT INTO `x2_cityarea` VALUES ('340503', '340503', '花山区', '340500');
INSERT INTO `x2_cityarea` VALUES ('340504', '340504', '雨山区', '340500');
INSERT INTO `x2_cityarea` VALUES ('340521', '340521', '当涂县', '340500');
INSERT INTO `x2_cityarea` VALUES ('340601', '340601', '市辖区', '340600');
INSERT INTO `x2_cityarea` VALUES ('340602', '340602', '杜集区', '340600');
INSERT INTO `x2_cityarea` VALUES ('340603', '340603', '相山区', '340600');
INSERT INTO `x2_cityarea` VALUES ('340604', '340604', '烈山区', '340600');
INSERT INTO `x2_cityarea` VALUES ('340621', '340621', '濉溪县', '340600');
INSERT INTO `x2_cityarea` VALUES ('340701', '340701', '市辖区', '340700');
INSERT INTO `x2_cityarea` VALUES ('340702', '340702', '铜官山区', '340700');
INSERT INTO `x2_cityarea` VALUES ('340703', '340703', '狮子山区', '340700');
INSERT INTO `x2_cityarea` VALUES ('340711', '340711', '铜陵市郊区', '340700');
INSERT INTO `x2_cityarea` VALUES ('340721', '340721', '铜陵县', '340700');
INSERT INTO `x2_cityarea` VALUES ('340801', '340801', '市辖区', '340800');
INSERT INTO `x2_cityarea` VALUES ('340802', '340802', '迎江区', '340800');
INSERT INTO `x2_cityarea` VALUES ('340803', '340803', '大观区', '340800');
INSERT INTO `x2_cityarea` VALUES ('340811', '340811', '宜秀区', '340800');
INSERT INTO `x2_cityarea` VALUES ('340822', '340822', '怀宁县', '340800');
INSERT INTO `x2_cityarea` VALUES ('340823', '340823', '枞阳县', '340800');
INSERT INTO `x2_cityarea` VALUES ('340824', '340824', '潜山县', '340800');
INSERT INTO `x2_cityarea` VALUES ('340825', '340825', '太湖县', '340800');
INSERT INTO `x2_cityarea` VALUES ('340826', '340826', '宿松县', '340800');
INSERT INTO `x2_cityarea` VALUES ('340827', '340827', '望江县', '340800');
INSERT INTO `x2_cityarea` VALUES ('340828', '340828', '岳西县', '340800');
INSERT INTO `x2_cityarea` VALUES ('340881', '340881', '桐城市', '340800');
INSERT INTO `x2_cityarea` VALUES ('341001', '341001', '市辖区', '341000');
INSERT INTO `x2_cityarea` VALUES ('341002', '341002', '屯溪区', '341000');
INSERT INTO `x2_cityarea` VALUES ('341003', '341003', '黄山区', '341000');
INSERT INTO `x2_cityarea` VALUES ('341004', '341004', '徽州区', '341000');
INSERT INTO `x2_cityarea` VALUES ('341021', '341021', '歙　县', '341000');
INSERT INTO `x2_cityarea` VALUES ('341022', '341022', '休宁县', '341000');
INSERT INTO `x2_cityarea` VALUES ('341023', '341023', '黟　县', '341000');
INSERT INTO `x2_cityarea` VALUES ('341024', '341024', '祁门县', '341000');
INSERT INTO `x2_cityarea` VALUES ('341101', '341101', '市辖区', '341100');
INSERT INTO `x2_cityarea` VALUES ('341102', '341102', '琅琊区', '341100');
INSERT INTO `x2_cityarea` VALUES ('341103', '341103', '南谯区', '341100');
INSERT INTO `x2_cityarea` VALUES ('341122', '341122', '来安县', '341100');
INSERT INTO `x2_cityarea` VALUES ('341124', '341124', '全椒县', '341100');
INSERT INTO `x2_cityarea` VALUES ('341125', '341125', '定远县', '341100');
INSERT INTO `x2_cityarea` VALUES ('341126', '341126', '凤阳县', '341100');
INSERT INTO `x2_cityarea` VALUES ('341181', '341181', '天长市', '341100');
INSERT INTO `x2_cityarea` VALUES ('341182', '341182', '明光市', '341100');
INSERT INTO `x2_cityarea` VALUES ('341201', '341201', '市辖区', '341200');
INSERT INTO `x2_cityarea` VALUES ('341202', '341202', '颍州区', '341200');
INSERT INTO `x2_cityarea` VALUES ('341203', '341203', '颍东区', '341200');
INSERT INTO `x2_cityarea` VALUES ('341204', '341204', '颍泉区', '341200');
INSERT INTO `x2_cityarea` VALUES ('341221', '341221', '临泉县', '341200');
INSERT INTO `x2_cityarea` VALUES ('341222', '341222', '太和县', '341200');
INSERT INTO `x2_cityarea` VALUES ('341225', '341225', '阜南县', '341200');
INSERT INTO `x2_cityarea` VALUES ('341226', '341226', '颍上县', '341200');
INSERT INTO `x2_cityarea` VALUES ('341282', '341282', '界首市', '341200');
INSERT INTO `x2_cityarea` VALUES ('341301', '341301', '市辖区', '341300');
INSERT INTO `x2_cityarea` VALUES ('341302', '341302', '墉桥区', '341300');
INSERT INTO `x2_cityarea` VALUES ('341321', '341321', '砀山县', '341300');
INSERT INTO `x2_cityarea` VALUES ('341322', '341322', '萧　县', '341300');
INSERT INTO `x2_cityarea` VALUES ('341323', '341323', '灵璧县', '341300');
INSERT INTO `x2_cityarea` VALUES ('341324', '341324', '泗　县', '341300');
INSERT INTO `x2_cityarea` VALUES ('341401', '341401', '市辖区', '341400');
INSERT INTO `x2_cityarea` VALUES ('341402', '341402', '居巢区', '341400');
INSERT INTO `x2_cityarea` VALUES ('341421', '341421', '庐江县', '341400');
INSERT INTO `x2_cityarea` VALUES ('341422', '341422', '无为县', '341400');
INSERT INTO `x2_cityarea` VALUES ('341423', '341423', '含山县', '341400');
INSERT INTO `x2_cityarea` VALUES ('341424', '341424', '和　县', '341400');
INSERT INTO `x2_cityarea` VALUES ('341501', '341501', '市辖区', '341500');
INSERT INTO `x2_cityarea` VALUES ('341502', '341502', '金安区', '341500');
INSERT INTO `x2_cityarea` VALUES ('341503', '341503', '裕安区', '341500');
INSERT INTO `x2_cityarea` VALUES ('341521', '341521', '寿　县', '341500');
INSERT INTO `x2_cityarea` VALUES ('341522', '341522', '霍邱县', '341500');
INSERT INTO `x2_cityarea` VALUES ('341523', '341523', '舒城县', '341500');
INSERT INTO `x2_cityarea` VALUES ('341524', '341524', '金寨县', '341500');
INSERT INTO `x2_cityarea` VALUES ('341525', '341525', '霍山县', '341500');
INSERT INTO `x2_cityarea` VALUES ('341601', '341601', '市辖区', '341600');
INSERT INTO `x2_cityarea` VALUES ('341602', '341602', '谯城区', '341600');
INSERT INTO `x2_cityarea` VALUES ('341621', '341621', '涡阳县', '341600');
INSERT INTO `x2_cityarea` VALUES ('341622', '341622', '蒙城县', '341600');
INSERT INTO `x2_cityarea` VALUES ('341623', '341623', '利辛县', '341600');
INSERT INTO `x2_cityarea` VALUES ('341701', '341701', '市辖区', '341700');
INSERT INTO `x2_cityarea` VALUES ('341702', '341702', '贵池区', '341700');
INSERT INTO `x2_cityarea` VALUES ('341721', '341721', '东至县', '341700');
INSERT INTO `x2_cityarea` VALUES ('341722', '341722', '石台县', '341700');
INSERT INTO `x2_cityarea` VALUES ('341723', '341723', '青阳县', '341700');
INSERT INTO `x2_cityarea` VALUES ('341801', '341801', '市辖区', '341800');
INSERT INTO `x2_cityarea` VALUES ('341802', '341802', '宣州区', '341800');
INSERT INTO `x2_cityarea` VALUES ('341821', '341821', '郎溪县', '341800');
INSERT INTO `x2_cityarea` VALUES ('341822', '341822', '广德县', '341800');
INSERT INTO `x2_cityarea` VALUES ('341823', '341823', '泾　县', '341800');
INSERT INTO `x2_cityarea` VALUES ('341824', '341824', '绩溪县', '341800');
INSERT INTO `x2_cityarea` VALUES ('341825', '341825', '旌德县', '341800');
INSERT INTO `x2_cityarea` VALUES ('341881', '341881', '宁国市', '341800');
INSERT INTO `x2_cityarea` VALUES ('350101', '350101', '市辖区', '350100');
INSERT INTO `x2_cityarea` VALUES ('350102', '350102', '鼓楼区', '350100');
INSERT INTO `x2_cityarea` VALUES ('350103', '350103', '台江区', '350100');
INSERT INTO `x2_cityarea` VALUES ('350104', '350104', '仓山区', '350100');
INSERT INTO `x2_cityarea` VALUES ('350105', '350105', '马尾区', '350100');
INSERT INTO `x2_cityarea` VALUES ('350111', '350111', '晋安区', '350100');
INSERT INTO `x2_cityarea` VALUES ('350121', '350121', '闽侯县', '350100');
INSERT INTO `x2_cityarea` VALUES ('350122', '350122', '连江县', '350100');
INSERT INTO `x2_cityarea` VALUES ('350123', '350123', '罗源县', '350100');
INSERT INTO `x2_cityarea` VALUES ('350124', '350124', '闽清县', '350100');
INSERT INTO `x2_cityarea` VALUES ('350125', '350125', '永泰县', '350100');
INSERT INTO `x2_cityarea` VALUES ('350128', '350128', '平潭县', '350100');
INSERT INTO `x2_cityarea` VALUES ('350181', '350181', '福清市', '350100');
INSERT INTO `x2_cityarea` VALUES ('350182', '350182', '长乐市', '350100');
INSERT INTO `x2_cityarea` VALUES ('350201', '350201', '市辖区', '350200');
INSERT INTO `x2_cityarea` VALUES ('350203', '350203', '思明区', '350200');
INSERT INTO `x2_cityarea` VALUES ('350205', '350205', '海沧区', '350200');
INSERT INTO `x2_cityarea` VALUES ('350206', '350206', '湖里区', '350200');
INSERT INTO `x2_cityarea` VALUES ('350211', '350211', '集美区', '350200');
INSERT INTO `x2_cityarea` VALUES ('350212', '350212', '同安区', '350200');
INSERT INTO `x2_cityarea` VALUES ('350213', '350213', '翔安区', '350200');
INSERT INTO `x2_cityarea` VALUES ('350301', '350301', '市辖区', '350300');
INSERT INTO `x2_cityarea` VALUES ('350302', '350302', '城厢区', '350300');
INSERT INTO `x2_cityarea` VALUES ('350303', '350303', '涵江区', '350300');
INSERT INTO `x2_cityarea` VALUES ('350304', '350304', '荔城区', '350300');
INSERT INTO `x2_cityarea` VALUES ('350305', '350305', '秀屿区', '350300');
INSERT INTO `x2_cityarea` VALUES ('350322', '350322', '仙游县', '350300');
INSERT INTO `x2_cityarea` VALUES ('350401', '350401', '市辖区', '350400');
INSERT INTO `x2_cityarea` VALUES ('350402', '350402', '梅列区', '350400');
INSERT INTO `x2_cityarea` VALUES ('350403', '350403', '三元区', '350400');
INSERT INTO `x2_cityarea` VALUES ('350421', '350421', '明溪县', '350400');
INSERT INTO `x2_cityarea` VALUES ('350423', '350423', '清流县', '350400');
INSERT INTO `x2_cityarea` VALUES ('350424', '350424', '宁化县', '350400');
INSERT INTO `x2_cityarea` VALUES ('350425', '350425', '大田县', '350400');
INSERT INTO `x2_cityarea` VALUES ('350426', '350426', '尤溪县', '350400');
INSERT INTO `x2_cityarea` VALUES ('350427', '350427', '沙　县', '350400');
INSERT INTO `x2_cityarea` VALUES ('350428', '350428', '将乐县', '350400');
INSERT INTO `x2_cityarea` VALUES ('350429', '350429', '泰宁县', '350400');
INSERT INTO `x2_cityarea` VALUES ('350430', '350430', '建宁县', '350400');
INSERT INTO `x2_cityarea` VALUES ('350481', '350481', '永安市', '350400');
INSERT INTO `x2_cityarea` VALUES ('350501', '350501', '市辖区', '350500');
INSERT INTO `x2_cityarea` VALUES ('350502', '350502', '鲤城区', '350500');
INSERT INTO `x2_cityarea` VALUES ('350503', '350503', '丰泽区', '350500');
INSERT INTO `x2_cityarea` VALUES ('350504', '350504', '洛江区', '350500');
INSERT INTO `x2_cityarea` VALUES ('350505', '350505', '泉港区', '350500');
INSERT INTO `x2_cityarea` VALUES ('350521', '350521', '惠安县', '350500');
INSERT INTO `x2_cityarea` VALUES ('350524', '350524', '安溪县', '350500');
INSERT INTO `x2_cityarea` VALUES ('350525', '350525', '永春县', '350500');
INSERT INTO `x2_cityarea` VALUES ('350526', '350526', '德化县', '350500');
INSERT INTO `x2_cityarea` VALUES ('350527', '350527', '金门县', '350500');
INSERT INTO `x2_cityarea` VALUES ('350581', '350581', '石狮市', '350500');
INSERT INTO `x2_cityarea` VALUES ('350582', '350582', '晋江市', '350500');
INSERT INTO `x2_cityarea` VALUES ('350583', '350583', '南安市', '350500');
INSERT INTO `x2_cityarea` VALUES ('350601', '350601', '市辖区', '350600');
INSERT INTO `x2_cityarea` VALUES ('350602', '350602', '芗城区', '350600');
INSERT INTO `x2_cityarea` VALUES ('350603', '350603', '龙文区', '350600');
INSERT INTO `x2_cityarea` VALUES ('350622', '350622', '云霄县', '350600');
INSERT INTO `x2_cityarea` VALUES ('350623', '350623', '漳浦县', '350600');
INSERT INTO `x2_cityarea` VALUES ('350624', '350624', '诏安县', '350600');
INSERT INTO `x2_cityarea` VALUES ('350625', '350625', '长泰县', '350600');
INSERT INTO `x2_cityarea` VALUES ('350626', '350626', '东山县', '350600');
INSERT INTO `x2_cityarea` VALUES ('350627', '350627', '南靖县', '350600');
INSERT INTO `x2_cityarea` VALUES ('350628', '350628', '平和县', '350600');
INSERT INTO `x2_cityarea` VALUES ('350629', '350629', '华安县', '350600');
INSERT INTO `x2_cityarea` VALUES ('350681', '350681', '龙海市', '350600');
INSERT INTO `x2_cityarea` VALUES ('350701', '350701', '市辖区', '350700');
INSERT INTO `x2_cityarea` VALUES ('350702', '350702', '延平区', '350700');
INSERT INTO `x2_cityarea` VALUES ('350721', '350721', '顺昌县', '350700');
INSERT INTO `x2_cityarea` VALUES ('350722', '350722', '浦城县', '350700');
INSERT INTO `x2_cityarea` VALUES ('350723', '350723', '光泽县', '350700');
INSERT INTO `x2_cityarea` VALUES ('350724', '350724', '松溪县', '350700');
INSERT INTO `x2_cityarea` VALUES ('350725', '350725', '政和县', '350700');
INSERT INTO `x2_cityarea` VALUES ('350781', '350781', '邵武市', '350700');
INSERT INTO `x2_cityarea` VALUES ('350782', '350782', '武夷山市', '350700');
INSERT INTO `x2_cityarea` VALUES ('350783', '350783', '建瓯市', '350700');
INSERT INTO `x2_cityarea` VALUES ('350784', '350784', '建阳市', '350700');
INSERT INTO `x2_cityarea` VALUES ('350801', '350801', '市辖区', '350800');
INSERT INTO `x2_cityarea` VALUES ('350802', '350802', '新罗区', '350800');
INSERT INTO `x2_cityarea` VALUES ('350821', '350821', '长汀县', '350800');
INSERT INTO `x2_cityarea` VALUES ('350822', '350822', '永定县', '350800');
INSERT INTO `x2_cityarea` VALUES ('350823', '350823', '上杭县', '350800');
INSERT INTO `x2_cityarea` VALUES ('350824', '350824', '武平县', '350800');
INSERT INTO `x2_cityarea` VALUES ('350825', '350825', '连城县', '350800');
INSERT INTO `x2_cityarea` VALUES ('350881', '350881', '漳平市', '350800');
INSERT INTO `x2_cityarea` VALUES ('350901', '350901', '市辖区', '350900');
INSERT INTO `x2_cityarea` VALUES ('350902', '350902', '蕉城区', '350900');
INSERT INTO `x2_cityarea` VALUES ('350921', '350921', '霞浦县', '350900');
INSERT INTO `x2_cityarea` VALUES ('350922', '350922', '古田县', '350900');
INSERT INTO `x2_cityarea` VALUES ('350923', '350923', '屏南县', '350900');
INSERT INTO `x2_cityarea` VALUES ('350924', '350924', '寿宁县', '350900');
INSERT INTO `x2_cityarea` VALUES ('350925', '350925', '周宁县', '350900');
INSERT INTO `x2_cityarea` VALUES ('350926', '350926', '柘荣县', '350900');
INSERT INTO `x2_cityarea` VALUES ('350981', '350981', '福安市', '350900');
INSERT INTO `x2_cityarea` VALUES ('350982', '350982', '福鼎市', '350900');
INSERT INTO `x2_cityarea` VALUES ('360101', '360101', '市辖区', '360100');
INSERT INTO `x2_cityarea` VALUES ('360102', '360102', '东湖区', '360100');
INSERT INTO `x2_cityarea` VALUES ('360103', '360103', '西湖区', '360100');
INSERT INTO `x2_cityarea` VALUES ('360104', '360104', '青云谱区', '360100');
INSERT INTO `x2_cityarea` VALUES ('360105', '360105', '湾里区', '360100');
INSERT INTO `x2_cityarea` VALUES ('360111', '360111', '青山湖区', '360100');
INSERT INTO `x2_cityarea` VALUES ('360121', '360121', '南昌县', '360100');
INSERT INTO `x2_cityarea` VALUES ('360122', '360122', '新建县', '360100');
INSERT INTO `x2_cityarea` VALUES ('360123', '360123', '安义县', '360100');
INSERT INTO `x2_cityarea` VALUES ('360124', '360124', '进贤县', '360100');
INSERT INTO `x2_cityarea` VALUES ('360201', '360201', '市辖区', '360200');
INSERT INTO `x2_cityarea` VALUES ('360202', '360202', '昌江区', '360200');
INSERT INTO `x2_cityarea` VALUES ('360203', '360203', '珠山区', '360200');
INSERT INTO `x2_cityarea` VALUES ('360222', '360222', '浮梁县', '360200');
INSERT INTO `x2_cityarea` VALUES ('360281', '360281', '乐平市', '360200');
INSERT INTO `x2_cityarea` VALUES ('360301', '360301', '市辖区', '360300');
INSERT INTO `x2_cityarea` VALUES ('360302', '360302', '安源区', '360300');
INSERT INTO `x2_cityarea` VALUES ('360313', '360313', '湘东区', '360300');
INSERT INTO `x2_cityarea` VALUES ('360321', '360321', '莲花县', '360300');
INSERT INTO `x2_cityarea` VALUES ('360322', '360322', '上栗县', '360300');
INSERT INTO `x2_cityarea` VALUES ('360323', '360323', '芦溪县', '360300');
INSERT INTO `x2_cityarea` VALUES ('360401', '360401', '市辖区', '360400');
INSERT INTO `x2_cityarea` VALUES ('360402', '360402', '庐山区', '360400');
INSERT INTO `x2_cityarea` VALUES ('360403', '360403', '浔阳区', '360400');
INSERT INTO `x2_cityarea` VALUES ('360421', '360421', '九江县', '360400');
INSERT INTO `x2_cityarea` VALUES ('360423', '360423', '武宁县', '360400');
INSERT INTO `x2_cityarea` VALUES ('360424', '360424', '修水县', '360400');
INSERT INTO `x2_cityarea` VALUES ('360425', '360425', '永修县', '360400');
INSERT INTO `x2_cityarea` VALUES ('360426', '360426', '德安县', '360400');
INSERT INTO `x2_cityarea` VALUES ('360427', '360427', '星子县', '360400');
INSERT INTO `x2_cityarea` VALUES ('360428', '360428', '都昌县', '360400');
INSERT INTO `x2_cityarea` VALUES ('360429', '360429', '湖口县', '360400');
INSERT INTO `x2_cityarea` VALUES ('360430', '360430', '彭泽县', '360400');
INSERT INTO `x2_cityarea` VALUES ('360481', '360481', '瑞昌市', '360400');
INSERT INTO `x2_cityarea` VALUES ('360501', '360501', '市辖区', '360500');
INSERT INTO `x2_cityarea` VALUES ('360502', '360502', '渝水区', '360500');
INSERT INTO `x2_cityarea` VALUES ('360521', '360521', '分宜县', '360500');
INSERT INTO `x2_cityarea` VALUES ('360601', '360601', '市辖区', '360600');
INSERT INTO `x2_cityarea` VALUES ('360602', '360602', '月湖区', '360600');
INSERT INTO `x2_cityarea` VALUES ('360622', '360622', '余江县', '360600');
INSERT INTO `x2_cityarea` VALUES ('360681', '360681', '贵溪市', '360600');
INSERT INTO `x2_cityarea` VALUES ('360701', '360701', '市辖区', '360700');
INSERT INTO `x2_cityarea` VALUES ('360702', '360702', '章贡区', '360700');
INSERT INTO `x2_cityarea` VALUES ('360721', '360721', '赣　县', '360700');
INSERT INTO `x2_cityarea` VALUES ('360722', '360722', '信丰县', '360700');
INSERT INTO `x2_cityarea` VALUES ('360723', '360723', '大余县', '360700');
INSERT INTO `x2_cityarea` VALUES ('360724', '360724', '上犹县', '360700');
INSERT INTO `x2_cityarea` VALUES ('360725', '360725', '崇义县', '360700');
INSERT INTO `x2_cityarea` VALUES ('360726', '360726', '安远县', '360700');
INSERT INTO `x2_cityarea` VALUES ('360727', '360727', '龙南县', '360700');
INSERT INTO `x2_cityarea` VALUES ('360728', '360728', '定南县', '360700');
INSERT INTO `x2_cityarea` VALUES ('360729', '360729', '全南县', '360700');
INSERT INTO `x2_cityarea` VALUES ('360730', '360730', '宁都县', '360700');
INSERT INTO `x2_cityarea` VALUES ('360731', '360731', '于都县', '360700');
INSERT INTO `x2_cityarea` VALUES ('360732', '360732', '兴国县', '360700');
INSERT INTO `x2_cityarea` VALUES ('360733', '360733', '会昌县', '360700');
INSERT INTO `x2_cityarea` VALUES ('360734', '360734', '寻乌县', '360700');
INSERT INTO `x2_cityarea` VALUES ('360735', '360735', '石城县', '360700');
INSERT INTO `x2_cityarea` VALUES ('360781', '360781', '瑞金市', '360700');
INSERT INTO `x2_cityarea` VALUES ('360782', '360782', '南康市', '360700');
INSERT INTO `x2_cityarea` VALUES ('360801', '360801', '市辖区', '360800');
INSERT INTO `x2_cityarea` VALUES ('360802', '360802', '吉州区', '360800');
INSERT INTO `x2_cityarea` VALUES ('360803', '360803', '青原区', '360800');
INSERT INTO `x2_cityarea` VALUES ('360821', '360821', '吉安县', '360800');
INSERT INTO `x2_cityarea` VALUES ('360822', '360822', '吉水县', '360800');
INSERT INTO `x2_cityarea` VALUES ('360823', '360823', '峡江县', '360800');
INSERT INTO `x2_cityarea` VALUES ('360824', '360824', '新干县', '360800');
INSERT INTO `x2_cityarea` VALUES ('360825', '360825', '永丰县', '360800');
INSERT INTO `x2_cityarea` VALUES ('360826', '360826', '泰和县', '360800');
INSERT INTO `x2_cityarea` VALUES ('360827', '360827', '遂川县', '360800');
INSERT INTO `x2_cityarea` VALUES ('360828', '360828', '万安县', '360800');
INSERT INTO `x2_cityarea` VALUES ('360829', '360829', '安福县', '360800');
INSERT INTO `x2_cityarea` VALUES ('360830', '360830', '永新县', '360800');
INSERT INTO `x2_cityarea` VALUES ('360881', '360881', '井冈山市', '360800');
INSERT INTO `x2_cityarea` VALUES ('360901', '360901', '市辖区', '360900');
INSERT INTO `x2_cityarea` VALUES ('360902', '360902', '袁州区', '360900');
INSERT INTO `x2_cityarea` VALUES ('360921', '360921', '奉新县', '360900');
INSERT INTO `x2_cityarea` VALUES ('360922', '360922', '万载县', '360900');
INSERT INTO `x2_cityarea` VALUES ('360923', '360923', '上高县', '360900');
INSERT INTO `x2_cityarea` VALUES ('360924', '360924', '宜丰县', '360900');
INSERT INTO `x2_cityarea` VALUES ('360925', '360925', '靖安县', '360900');
INSERT INTO `x2_cityarea` VALUES ('360926', '360926', '铜鼓县', '360900');
INSERT INTO `x2_cityarea` VALUES ('360981', '360981', '丰城市', '360900');
INSERT INTO `x2_cityarea` VALUES ('360982', '360982', '樟树市', '360900');
INSERT INTO `x2_cityarea` VALUES ('360983', '360983', '高安市', '360900');
INSERT INTO `x2_cityarea` VALUES ('361001', '361001', '市辖区', '361000');
INSERT INTO `x2_cityarea` VALUES ('361002', '361002', '临川区', '361000');
INSERT INTO `x2_cityarea` VALUES ('361021', '361021', '南城县', '361000');
INSERT INTO `x2_cityarea` VALUES ('361022', '361022', '黎川县', '361000');
INSERT INTO `x2_cityarea` VALUES ('361023', '361023', '南丰县', '361000');
INSERT INTO `x2_cityarea` VALUES ('361024', '361024', '崇仁县', '361000');
INSERT INTO `x2_cityarea` VALUES ('361025', '361025', '乐安县', '361000');
INSERT INTO `x2_cityarea` VALUES ('361026', '361026', '宜黄县', '361000');
INSERT INTO `x2_cityarea` VALUES ('361027', '361027', '金溪县', '361000');
INSERT INTO `x2_cityarea` VALUES ('361028', '361028', '资溪县', '361000');
INSERT INTO `x2_cityarea` VALUES ('361029', '361029', '东乡县', '361000');
INSERT INTO `x2_cityarea` VALUES ('361030', '361030', '广昌县', '361000');
INSERT INTO `x2_cityarea` VALUES ('361101', '361101', '市辖区', '361100');
INSERT INTO `x2_cityarea` VALUES ('361102', '361102', '信州区', '361100');
INSERT INTO `x2_cityarea` VALUES ('361121', '361121', '上饶县', '361100');
INSERT INTO `x2_cityarea` VALUES ('361122', '361122', '广丰县', '361100');
INSERT INTO `x2_cityarea` VALUES ('361123', '361123', '玉山县', '361100');
INSERT INTO `x2_cityarea` VALUES ('361124', '361124', '铅山县', '361100');
INSERT INTO `x2_cityarea` VALUES ('361125', '361125', '横峰县', '361100');
INSERT INTO `x2_cityarea` VALUES ('361126', '361126', '弋阳县', '361100');
INSERT INTO `x2_cityarea` VALUES ('361127', '361127', '余干县', '361100');
INSERT INTO `x2_cityarea` VALUES ('361128', '361128', '鄱阳县', '361100');
INSERT INTO `x2_cityarea` VALUES ('361129', '361129', '万年县', '361100');
INSERT INTO `x2_cityarea` VALUES ('361130', '361130', '婺源县', '361100');
INSERT INTO `x2_cityarea` VALUES ('361181', '361181', '德兴市', '361100');
INSERT INTO `x2_cityarea` VALUES ('370101', '370101', '市辖区', '370100');
INSERT INTO `x2_cityarea` VALUES ('370102', '370102', '历下区', '370100');
INSERT INTO `x2_cityarea` VALUES ('370103', '370103', '市中区', '370100');
INSERT INTO `x2_cityarea` VALUES ('370104', '370104', '槐荫区', '370100');
INSERT INTO `x2_cityarea` VALUES ('370105', '370105', '天桥区', '370100');
INSERT INTO `x2_cityarea` VALUES ('370112', '370112', '历城区', '370100');
INSERT INTO `x2_cityarea` VALUES ('370113', '370113', '长清区', '370100');
INSERT INTO `x2_cityarea` VALUES ('370124', '370124', '平阴县', '370100');
INSERT INTO `x2_cityarea` VALUES ('370125', '370125', '济阳县', '370100');
INSERT INTO `x2_cityarea` VALUES ('370126', '370126', '商河县', '370100');
INSERT INTO `x2_cityarea` VALUES ('370181', '370181', '章丘市', '370100');
INSERT INTO `x2_cityarea` VALUES ('370201', '370201', '市辖区', '370200');
INSERT INTO `x2_cityarea` VALUES ('370202', '370202', '市南区', '370200');
INSERT INTO `x2_cityarea` VALUES ('370203', '370203', '市北区', '370200');
INSERT INTO `x2_cityarea` VALUES ('370205', '370205', '四方区', '370200');
INSERT INTO `x2_cityarea` VALUES ('370211', '370211', '黄岛区', '370200');
INSERT INTO `x2_cityarea` VALUES ('370212', '370212', '崂山区', '370200');
INSERT INTO `x2_cityarea` VALUES ('370213', '370213', '李沧区', '370200');
INSERT INTO `x2_cityarea` VALUES ('370214', '370214', '城阳区', '370200');
INSERT INTO `x2_cityarea` VALUES ('370281', '370281', '胶州市', '370200');
INSERT INTO `x2_cityarea` VALUES ('370282', '370282', '即墨市', '370200');
INSERT INTO `x2_cityarea` VALUES ('370283', '370283', '平度市', '370200');
INSERT INTO `x2_cityarea` VALUES ('370284', '370284', '胶南市', '370200');
INSERT INTO `x2_cityarea` VALUES ('370285', '370285', '莱西市', '370200');
INSERT INTO `x2_cityarea` VALUES ('370301', '370301', '市辖区', '370300');
INSERT INTO `x2_cityarea` VALUES ('370302', '370302', '淄川区', '370300');
INSERT INTO `x2_cityarea` VALUES ('370303', '370303', '张店区', '370300');
INSERT INTO `x2_cityarea` VALUES ('370304', '370304', '博山区', '370300');
INSERT INTO `x2_cityarea` VALUES ('370305', '370305', '临淄区', '370300');
INSERT INTO `x2_cityarea` VALUES ('370306', '370306', '周村区', '370300');
INSERT INTO `x2_cityarea` VALUES ('370321', '370321', '桓台县', '370300');
INSERT INTO `x2_cityarea` VALUES ('370322', '370322', '高青县', '370300');
INSERT INTO `x2_cityarea` VALUES ('370323', '370323', '沂源县', '370300');
INSERT INTO `x2_cityarea` VALUES ('370401', '370401', '市辖区', '370400');
INSERT INTO `x2_cityarea` VALUES ('370402', '370402', '市中区', '370400');
INSERT INTO `x2_cityarea` VALUES ('370403', '370403', '薛城区', '370400');
INSERT INTO `x2_cityarea` VALUES ('370404', '370404', '峄城区', '370400');
INSERT INTO `x2_cityarea` VALUES ('370405', '370405', '台儿庄区', '370400');
INSERT INTO `x2_cityarea` VALUES ('370406', '370406', '山亭区', '370400');
INSERT INTO `x2_cityarea` VALUES ('370481', '370481', '滕州市', '370400');
INSERT INTO `x2_cityarea` VALUES ('370501', '370501', '市辖区', '370500');
INSERT INTO `x2_cityarea` VALUES ('370502', '370502', '东营区', '370500');
INSERT INTO `x2_cityarea` VALUES ('370503', '370503', '河口区', '370500');
INSERT INTO `x2_cityarea` VALUES ('370521', '370521', '垦利县', '370500');
INSERT INTO `x2_cityarea` VALUES ('370522', '370522', '利津县', '370500');
INSERT INTO `x2_cityarea` VALUES ('370523', '370523', '广饶县', '370500');
INSERT INTO `x2_cityarea` VALUES ('370601', '370601', '市辖区', '370600');
INSERT INTO `x2_cityarea` VALUES ('370602', '370602', '芝罘区', '370600');
INSERT INTO `x2_cityarea` VALUES ('370611', '370611', '福山区', '370600');
INSERT INTO `x2_cityarea` VALUES ('370612', '370612', '牟平区', '370600');
INSERT INTO `x2_cityarea` VALUES ('370613', '370613', '莱山区', '370600');
INSERT INTO `x2_cityarea` VALUES ('370634', '370634', '长岛县', '370600');
INSERT INTO `x2_cityarea` VALUES ('370681', '370681', '龙口市', '370600');
INSERT INTO `x2_cityarea` VALUES ('370682', '370682', '莱阳市', '370600');
INSERT INTO `x2_cityarea` VALUES ('370683', '370683', '莱州市', '370600');
INSERT INTO `x2_cityarea` VALUES ('370684', '370684', '蓬莱市', '370600');
INSERT INTO `x2_cityarea` VALUES ('370685', '370685', '招远市', '370600');
INSERT INTO `x2_cityarea` VALUES ('370686', '370686', '栖霞市', '370600');
INSERT INTO `x2_cityarea` VALUES ('370687', '370687', '海阳市', '370600');
INSERT INTO `x2_cityarea` VALUES ('370701', '370701', '市辖区', '370700');
INSERT INTO `x2_cityarea` VALUES ('370702', '370702', '潍城区', '370700');
INSERT INTO `x2_cityarea` VALUES ('370703', '370703', '寒亭区', '370700');
INSERT INTO `x2_cityarea` VALUES ('370704', '370704', '坊子区', '370700');
INSERT INTO `x2_cityarea` VALUES ('370705', '370705', '奎文区', '370700');
INSERT INTO `x2_cityarea` VALUES ('370724', '370724', '临朐县', '370700');
INSERT INTO `x2_cityarea` VALUES ('370725', '370725', '昌乐县', '370700');
INSERT INTO `x2_cityarea` VALUES ('370781', '370781', '青州市', '370700');
INSERT INTO `x2_cityarea` VALUES ('370782', '370782', '诸城市', '370700');
INSERT INTO `x2_cityarea` VALUES ('370783', '370783', '寿光市', '370700');
INSERT INTO `x2_cityarea` VALUES ('370784', '370784', '安丘市', '370700');
INSERT INTO `x2_cityarea` VALUES ('370785', '370785', '高密市', '370700');
INSERT INTO `x2_cityarea` VALUES ('370786', '370786', '昌邑市', '370700');
INSERT INTO `x2_cityarea` VALUES ('370801', '370801', '市辖区', '370800');
INSERT INTO `x2_cityarea` VALUES ('370802', '370802', '市中区', '370800');
INSERT INTO `x2_cityarea` VALUES ('370811', '370811', '任城区', '370800');
INSERT INTO `x2_cityarea` VALUES ('370826', '370826', '微山县', '370800');
INSERT INTO `x2_cityarea` VALUES ('370827', '370827', '鱼台县', '370800');
INSERT INTO `x2_cityarea` VALUES ('370828', '370828', '金乡县', '370800');
INSERT INTO `x2_cityarea` VALUES ('370829', '370829', '嘉祥县', '370800');
INSERT INTO `x2_cityarea` VALUES ('370830', '370830', '汶上县', '370800');
INSERT INTO `x2_cityarea` VALUES ('370831', '370831', '泗水县', '370800');
INSERT INTO `x2_cityarea` VALUES ('370832', '370832', '梁山县', '370800');
INSERT INTO `x2_cityarea` VALUES ('370881', '370881', '曲阜市', '370800');
INSERT INTO `x2_cityarea` VALUES ('370882', '370882', '兖州市', '370800');
INSERT INTO `x2_cityarea` VALUES ('370883', '370883', '邹城市', '370800');
INSERT INTO `x2_cityarea` VALUES ('370901', '370901', '市辖区', '370900');
INSERT INTO `x2_cityarea` VALUES ('370902', '370902', '泰山区', '370900');
INSERT INTO `x2_cityarea` VALUES ('370903', '370903', '岱岳区', '370900');
INSERT INTO `x2_cityarea` VALUES ('370921', '370921', '宁阳县', '370900');
INSERT INTO `x2_cityarea` VALUES ('370923', '370923', '东平县', '370900');
INSERT INTO `x2_cityarea` VALUES ('370982', '370982', '新泰市', '370900');
INSERT INTO `x2_cityarea` VALUES ('370983', '370983', '肥城市', '370900');
INSERT INTO `x2_cityarea` VALUES ('371001', '371001', '市辖区', '371000');
INSERT INTO `x2_cityarea` VALUES ('371002', '371002', '环翠区', '371000');
INSERT INTO `x2_cityarea` VALUES ('371081', '371081', '文登市', '371000');
INSERT INTO `x2_cityarea` VALUES ('371082', '371082', '荣成市', '371000');
INSERT INTO `x2_cityarea` VALUES ('371083', '371083', '乳山市', '371000');
INSERT INTO `x2_cityarea` VALUES ('371101', '371101', '市辖区', '371100');
INSERT INTO `x2_cityarea` VALUES ('371102', '371102', '东港区', '371100');
INSERT INTO `x2_cityarea` VALUES ('371103', '371103', '岚山区', '371100');
INSERT INTO `x2_cityarea` VALUES ('371121', '371121', '五莲县', '371100');
INSERT INTO `x2_cityarea` VALUES ('371122', '371122', '莒　县', '371100');
INSERT INTO `x2_cityarea` VALUES ('371201', '371201', '市辖区', '371200');
INSERT INTO `x2_cityarea` VALUES ('371202', '371202', '莱城区', '371200');
INSERT INTO `x2_cityarea` VALUES ('371203', '371203', '钢城区', '371200');
INSERT INTO `x2_cityarea` VALUES ('371301', '371301', '市辖区', '371300');
INSERT INTO `x2_cityarea` VALUES ('371302', '371302', '兰山区', '371300');
INSERT INTO `x2_cityarea` VALUES ('371311', '371311', '罗庄区', '371300');
INSERT INTO `x2_cityarea` VALUES ('371312', '371312', '河东区', '371300');
INSERT INTO `x2_cityarea` VALUES ('371321', '371321', '沂南县', '371300');
INSERT INTO `x2_cityarea` VALUES ('371322', '371322', '郯城县', '371300');
INSERT INTO `x2_cityarea` VALUES ('371323', '371323', '沂水县', '371300');
INSERT INTO `x2_cityarea` VALUES ('371324', '371324', '苍山县', '371300');
INSERT INTO `x2_cityarea` VALUES ('371325', '371325', '费　县', '371300');
INSERT INTO `x2_cityarea` VALUES ('371326', '371326', '平邑县', '371300');
INSERT INTO `x2_cityarea` VALUES ('371327', '371327', '莒南县', '371300');
INSERT INTO `x2_cityarea` VALUES ('371328', '371328', '蒙阴县', '371300');
INSERT INTO `x2_cityarea` VALUES ('371329', '371329', '临沭县', '371300');
INSERT INTO `x2_cityarea` VALUES ('371401', '371401', '市辖区', '371400');
INSERT INTO `x2_cityarea` VALUES ('371402', '371402', '德城区', '371400');
INSERT INTO `x2_cityarea` VALUES ('371421', '371421', '陵　县', '371400');
INSERT INTO `x2_cityarea` VALUES ('371422', '371422', '宁津县', '371400');
INSERT INTO `x2_cityarea` VALUES ('371423', '371423', '庆云县', '371400');
INSERT INTO `x2_cityarea` VALUES ('371424', '371424', '临邑县', '371400');
INSERT INTO `x2_cityarea` VALUES ('371425', '371425', '齐河县', '371400');
INSERT INTO `x2_cityarea` VALUES ('371426', '371426', '平原县', '371400');
INSERT INTO `x2_cityarea` VALUES ('371427', '371427', '夏津县', '371400');
INSERT INTO `x2_cityarea` VALUES ('371428', '371428', '武城县', '371400');
INSERT INTO `x2_cityarea` VALUES ('371481', '371481', '乐陵市', '371400');
INSERT INTO `x2_cityarea` VALUES ('371482', '371482', '禹城市', '371400');
INSERT INTO `x2_cityarea` VALUES ('371501', '371501', '市辖区', '371500');
INSERT INTO `x2_cityarea` VALUES ('371502', '371502', '东昌府区', '371500');
INSERT INTO `x2_cityarea` VALUES ('371521', '371521', '阳谷县', '371500');
INSERT INTO `x2_cityarea` VALUES ('371522', '371522', '莘　县', '371500');
INSERT INTO `x2_cityarea` VALUES ('371523', '371523', '茌平县', '371500');
INSERT INTO `x2_cityarea` VALUES ('371524', '371524', '东阿县', '371500');
INSERT INTO `x2_cityarea` VALUES ('371525', '371525', '冠　县', '371500');
INSERT INTO `x2_cityarea` VALUES ('371526', '371526', '高唐县', '371500');
INSERT INTO `x2_cityarea` VALUES ('371581', '371581', '临清市', '371500');
INSERT INTO `x2_cityarea` VALUES ('371601', '371601', '市辖区', '371600');
INSERT INTO `x2_cityarea` VALUES ('371602', '371602', '滨城区', '371600');
INSERT INTO `x2_cityarea` VALUES ('371621', '371621', '惠民县', '371600');
INSERT INTO `x2_cityarea` VALUES ('371622', '371622', '阳信县', '371600');
INSERT INTO `x2_cityarea` VALUES ('371623', '371623', '无棣县', '371600');
INSERT INTO `x2_cityarea` VALUES ('371624', '371624', '沾化县', '371600');
INSERT INTO `x2_cityarea` VALUES ('371625', '371625', '博兴县', '371600');
INSERT INTO `x2_cityarea` VALUES ('371626', '371626', '邹平县', '371600');
INSERT INTO `x2_cityarea` VALUES ('371701', '371701', '市辖区', '371700');
INSERT INTO `x2_cityarea` VALUES ('371702', '371702', '牡丹区', '371700');
INSERT INTO `x2_cityarea` VALUES ('371721', '371721', '曹　县', '371700');
INSERT INTO `x2_cityarea` VALUES ('371722', '371722', '单　县', '371700');
INSERT INTO `x2_cityarea` VALUES ('371723', '371723', '成武县', '371700');
INSERT INTO `x2_cityarea` VALUES ('371724', '371724', '巨野县', '371700');
INSERT INTO `x2_cityarea` VALUES ('371725', '371725', '郓城县', '371700');
INSERT INTO `x2_cityarea` VALUES ('371726', '371726', '鄄城县', '371700');
INSERT INTO `x2_cityarea` VALUES ('371727', '371727', '定陶县', '371700');
INSERT INTO `x2_cityarea` VALUES ('371728', '371728', '东明县', '371700');
INSERT INTO `x2_cityarea` VALUES ('410101', '410101', '市辖区', '410100');
INSERT INTO `x2_cityarea` VALUES ('410102', '410102', '中原区', '410100');
INSERT INTO `x2_cityarea` VALUES ('410103', '410103', '二七区', '410100');
INSERT INTO `x2_cityarea` VALUES ('410104', '410104', '管城回族区', '410100');
INSERT INTO `x2_cityarea` VALUES ('410105', '410105', '金水区', '410100');
INSERT INTO `x2_cityarea` VALUES ('410106', '410106', '上街区', '410100');
INSERT INTO `x2_cityarea` VALUES ('410108', '410108', '惠济区', '410100');
INSERT INTO `x2_cityarea` VALUES ('410122', '410122', '中牟县', '410100');
INSERT INTO `x2_cityarea` VALUES ('410181', '410181', '巩义市', '410100');
INSERT INTO `x2_cityarea` VALUES ('410182', '410182', '荥阳市', '410100');
INSERT INTO `x2_cityarea` VALUES ('410183', '410183', '新密市', '410100');
INSERT INTO `x2_cityarea` VALUES ('410184', '410184', '新郑市', '410100');
INSERT INTO `x2_cityarea` VALUES ('410185', '410185', '登封市', '410100');
INSERT INTO `x2_cityarea` VALUES ('410201', '410201', '市辖区', '410200');
INSERT INTO `x2_cityarea` VALUES ('410202', '410202', '龙亭区', '410200');
INSERT INTO `x2_cityarea` VALUES ('410203', '410203', '顺河回族区', '410200');
INSERT INTO `x2_cityarea` VALUES ('410204', '410204', '鼓楼区', '410200');
INSERT INTO `x2_cityarea` VALUES ('410205', '410205', '禹王台区', '410200');
INSERT INTO `x2_cityarea` VALUES ('410211', '410211', '郊   区', '410200');
INSERT INTO `x2_cityarea` VALUES ('410221', '410221', '杞　县', '410200');
INSERT INTO `x2_cityarea` VALUES ('410222', '410222', '通许县', '410200');
INSERT INTO `x2_cityarea` VALUES ('410223', '410223', '尉氏县', '410200');
INSERT INTO `x2_cityarea` VALUES ('410224', '410224', '开封县', '410200');
INSERT INTO `x2_cityarea` VALUES ('410225', '410225', '兰考县', '410200');
INSERT INTO `x2_cityarea` VALUES ('410301', '410301', '市辖区', '410300');
INSERT INTO `x2_cityarea` VALUES ('410302', '410302', '老城区', '410300');
INSERT INTO `x2_cityarea` VALUES ('410303', '410303', '西工区', '410300');
INSERT INTO `x2_cityarea` VALUES ('410304', '410304', '廛河回族区', '410300');
INSERT INTO `x2_cityarea` VALUES ('410305', '410305', '涧西区', '410300');
INSERT INTO `x2_cityarea` VALUES ('410306', '410306', '吉利区', '410300');
INSERT INTO `x2_cityarea` VALUES ('410307', '410307', '洛龙区', '410300');
INSERT INTO `x2_cityarea` VALUES ('410322', '410322', '孟津县', '410300');
INSERT INTO `x2_cityarea` VALUES ('410323', '410323', '新安县', '410300');
INSERT INTO `x2_cityarea` VALUES ('410324', '410324', '栾川县', '410300');
INSERT INTO `x2_cityarea` VALUES ('410325', '410325', '嵩　县', '410300');
INSERT INTO `x2_cityarea` VALUES ('410326', '410326', '汝阳县', '410300');
INSERT INTO `x2_cityarea` VALUES ('410327', '410327', '宜阳县', '410300');
INSERT INTO `x2_cityarea` VALUES ('410328', '410328', '洛宁县', '410300');
INSERT INTO `x2_cityarea` VALUES ('410329', '410329', '伊川县', '410300');
INSERT INTO `x2_cityarea` VALUES ('410381', '410381', '偃师市', '410300');
INSERT INTO `x2_cityarea` VALUES ('410401', '410401', '市辖区', '410400');
INSERT INTO `x2_cityarea` VALUES ('410402', '410402', '新华区', '410400');
INSERT INTO `x2_cityarea` VALUES ('410403', '410403', '卫东区', '410400');
INSERT INTO `x2_cityarea` VALUES ('410404', '410404', '石龙区', '410400');
INSERT INTO `x2_cityarea` VALUES ('410411', '410411', '湛河区', '410400');
INSERT INTO `x2_cityarea` VALUES ('410421', '410421', '宝丰县', '410400');
INSERT INTO `x2_cityarea` VALUES ('410422', '410422', '叶　县', '410400');
INSERT INTO `x2_cityarea` VALUES ('410423', '410423', '鲁山县', '410400');
INSERT INTO `x2_cityarea` VALUES ('410425', '410425', '郏　县', '410400');
INSERT INTO `x2_cityarea` VALUES ('410481', '410481', '舞钢市', '410400');
INSERT INTO `x2_cityarea` VALUES ('410482', '410482', '汝州市', '410400');
INSERT INTO `x2_cityarea` VALUES ('410501', '410501', '市辖区', '410500');
INSERT INTO `x2_cityarea` VALUES ('410502', '410502', '文峰区', '410500');
INSERT INTO `x2_cityarea` VALUES ('410503', '410503', '北关区', '410500');
INSERT INTO `x2_cityarea` VALUES ('410505', '410505', '殷都区', '410500');
INSERT INTO `x2_cityarea` VALUES ('410506', '410506', '龙安区', '410500');
INSERT INTO `x2_cityarea` VALUES ('410522', '410522', '安阳县', '410500');
INSERT INTO `x2_cityarea` VALUES ('410523', '410523', '汤阴县', '410500');
INSERT INTO `x2_cityarea` VALUES ('410526', '410526', '滑　县', '410500');
INSERT INTO `x2_cityarea` VALUES ('410527', '410527', '内黄县', '410500');
INSERT INTO `x2_cityarea` VALUES ('410581', '410581', '林州市', '410500');
INSERT INTO `x2_cityarea` VALUES ('410601', '410601', '市辖区', '410600');
INSERT INTO `x2_cityarea` VALUES ('410602', '410602', '鹤山区', '410600');
INSERT INTO `x2_cityarea` VALUES ('410603', '410603', '山城区', '410600');
INSERT INTO `x2_cityarea` VALUES ('410611', '410611', '淇滨区', '410600');
INSERT INTO `x2_cityarea` VALUES ('410621', '410621', '浚　县', '410600');
INSERT INTO `x2_cityarea` VALUES ('410622', '410622', '淇　县', '410600');
INSERT INTO `x2_cityarea` VALUES ('410701', '410701', '市辖区', '410700');
INSERT INTO `x2_cityarea` VALUES ('410702', '410702', '红旗区', '410700');
INSERT INTO `x2_cityarea` VALUES ('410703', '410703', '卫滨区', '410700');
INSERT INTO `x2_cityarea` VALUES ('410704', '410704', '凤泉区', '410700');
INSERT INTO `x2_cityarea` VALUES ('410711', '410711', '牧野区', '410700');
INSERT INTO `x2_cityarea` VALUES ('410721', '410721', '新乡县', '410700');
INSERT INTO `x2_cityarea` VALUES ('410724', '410724', '获嘉县', '410700');
INSERT INTO `x2_cityarea` VALUES ('410725', '410725', '原阳县', '410700');
INSERT INTO `x2_cityarea` VALUES ('410726', '410726', '延津县', '410700');
INSERT INTO `x2_cityarea` VALUES ('410727', '410727', '封丘县', '410700');
INSERT INTO `x2_cityarea` VALUES ('410728', '410728', '长垣县', '410700');
INSERT INTO `x2_cityarea` VALUES ('410781', '410781', '卫辉市', '410700');
INSERT INTO `x2_cityarea` VALUES ('410782', '410782', '辉县市', '410700');
INSERT INTO `x2_cityarea` VALUES ('410801', '410801', '市辖区', '410800');
INSERT INTO `x2_cityarea` VALUES ('410802', '410802', '解放区', '410800');
INSERT INTO `x2_cityarea` VALUES ('410803', '410803', '中站区', '410800');
INSERT INTO `x2_cityarea` VALUES ('410804', '410804', '马村区', '410800');
INSERT INTO `x2_cityarea` VALUES ('410811', '410811', '山阳区', '410800');
INSERT INTO `x2_cityarea` VALUES ('410821', '410821', '修武县', '410800');
INSERT INTO `x2_cityarea` VALUES ('410822', '410822', '博爱县', '410800');
INSERT INTO `x2_cityarea` VALUES ('410823', '410823', '武陟县', '410800');
INSERT INTO `x2_cityarea` VALUES ('410825', '410825', '温　县', '410800');
INSERT INTO `x2_cityarea` VALUES ('410881', '410881', '济源市', '410800');
INSERT INTO `x2_cityarea` VALUES ('410882', '410882', '沁阳市', '410800');
INSERT INTO `x2_cityarea` VALUES ('410883', '410883', '孟州市', '410800');
INSERT INTO `x2_cityarea` VALUES ('410901', '410901', '市辖区', '410900');
INSERT INTO `x2_cityarea` VALUES ('410902', '410902', '华龙区', '410900');
INSERT INTO `x2_cityarea` VALUES ('410922', '410922', '清丰县', '410900');
INSERT INTO `x2_cityarea` VALUES ('410923', '410923', '南乐县', '410900');
INSERT INTO `x2_cityarea` VALUES ('410926', '410926', '范　县', '410900');
INSERT INTO `x2_cityarea` VALUES ('410927', '410927', '台前县', '410900');
INSERT INTO `x2_cityarea` VALUES ('410928', '410928', '濮阳县', '410900');
INSERT INTO `x2_cityarea` VALUES ('411001', '411001', '市辖区', '411000');
INSERT INTO `x2_cityarea` VALUES ('411002', '411002', '魏都区', '411000');
INSERT INTO `x2_cityarea` VALUES ('411023', '411023', '许昌县', '411000');
INSERT INTO `x2_cityarea` VALUES ('411024', '411024', '鄢陵县', '411000');
INSERT INTO `x2_cityarea` VALUES ('411025', '411025', '襄城县', '411000');
INSERT INTO `x2_cityarea` VALUES ('411081', '411081', '禹州市', '411000');
INSERT INTO `x2_cityarea` VALUES ('411082', '411082', '长葛市', '411000');
INSERT INTO `x2_cityarea` VALUES ('411101', '411101', '市辖区', '411100');
INSERT INTO `x2_cityarea` VALUES ('411102', '411102', '源汇区', '411100');
INSERT INTO `x2_cityarea` VALUES ('411103', '411103', '郾城区', '411100');
INSERT INTO `x2_cityarea` VALUES ('411104', '411104', '召陵区', '411100');
INSERT INTO `x2_cityarea` VALUES ('411121', '411121', '舞阳县', '411100');
INSERT INTO `x2_cityarea` VALUES ('411122', '411122', '临颍县', '411100');
INSERT INTO `x2_cityarea` VALUES ('411201', '411201', '市辖区', '411200');
INSERT INTO `x2_cityarea` VALUES ('411202', '411202', '湖滨区', '411200');
INSERT INTO `x2_cityarea` VALUES ('411221', '411221', '渑池县', '411200');
INSERT INTO `x2_cityarea` VALUES ('411222', '411222', '陕　县', '411200');
INSERT INTO `x2_cityarea` VALUES ('411224', '411224', '卢氏县', '411200');
INSERT INTO `x2_cityarea` VALUES ('411281', '411281', '义马市', '411200');
INSERT INTO `x2_cityarea` VALUES ('411282', '411282', '灵宝市', '411200');
INSERT INTO `x2_cityarea` VALUES ('411301', '411301', '市辖区', '411300');
INSERT INTO `x2_cityarea` VALUES ('411302', '411302', '宛城区', '411300');
INSERT INTO `x2_cityarea` VALUES ('411303', '411303', '卧龙区', '411300');
INSERT INTO `x2_cityarea` VALUES ('411321', '411321', '南召县', '411300');
INSERT INTO `x2_cityarea` VALUES ('411322', '411322', '方城县', '411300');
INSERT INTO `x2_cityarea` VALUES ('411323', '411323', '西峡县', '411300');
INSERT INTO `x2_cityarea` VALUES ('411324', '411324', '镇平县', '411300');
INSERT INTO `x2_cityarea` VALUES ('411325', '411325', '内乡县', '411300');
INSERT INTO `x2_cityarea` VALUES ('411326', '411326', '淅川县', '411300');
INSERT INTO `x2_cityarea` VALUES ('411327', '411327', '社旗县', '411300');
INSERT INTO `x2_cityarea` VALUES ('411328', '411328', '唐河县', '411300');
INSERT INTO `x2_cityarea` VALUES ('411329', '411329', '新野县', '411300');
INSERT INTO `x2_cityarea` VALUES ('411330', '411330', '桐柏县', '411300');
INSERT INTO `x2_cityarea` VALUES ('411381', '411381', '邓州市', '411300');
INSERT INTO `x2_cityarea` VALUES ('411401', '411401', '市辖区', '411400');
INSERT INTO `x2_cityarea` VALUES ('411402', '411402', '梁园区', '411400');
INSERT INTO `x2_cityarea` VALUES ('411403', '411403', '睢阳区', '411400');
INSERT INTO `x2_cityarea` VALUES ('411421', '411421', '民权县', '411400');
INSERT INTO `x2_cityarea` VALUES ('411422', '411422', '睢　县', '411400');
INSERT INTO `x2_cityarea` VALUES ('411423', '411423', '宁陵县', '411400');
INSERT INTO `x2_cityarea` VALUES ('411424', '411424', '柘城县', '411400');
INSERT INTO `x2_cityarea` VALUES ('411425', '411425', '虞城县', '411400');
INSERT INTO `x2_cityarea` VALUES ('411426', '411426', '夏邑县', '411400');
INSERT INTO `x2_cityarea` VALUES ('411481', '411481', '永城市', '411400');
INSERT INTO `x2_cityarea` VALUES ('411501', '411501', '市辖区', '411500');
INSERT INTO `x2_cityarea` VALUES ('411502', '411502', '师河区', '411500');
INSERT INTO `x2_cityarea` VALUES ('411503', '411503', '平桥区', '411500');
INSERT INTO `x2_cityarea` VALUES ('411521', '411521', '罗山县', '411500');
INSERT INTO `x2_cityarea` VALUES ('411522', '411522', '光山县', '411500');
INSERT INTO `x2_cityarea` VALUES ('411523', '411523', '新　县', '411500');
INSERT INTO `x2_cityarea` VALUES ('411524', '411524', '商城县', '411500');
INSERT INTO `x2_cityarea` VALUES ('411525', '411525', '固始县', '411500');
INSERT INTO `x2_cityarea` VALUES ('411526', '411526', '潢川县', '411500');
INSERT INTO `x2_cityarea` VALUES ('411527', '411527', '淮滨县', '411500');
INSERT INTO `x2_cityarea` VALUES ('411528', '411528', '息　县', '411500');
INSERT INTO `x2_cityarea` VALUES ('411601', '411601', '市辖区', '411600');
INSERT INTO `x2_cityarea` VALUES ('411602', '411602', '川汇区', '411600');
INSERT INTO `x2_cityarea` VALUES ('411621', '411621', '扶沟县', '411600');
INSERT INTO `x2_cityarea` VALUES ('411622', '411622', '西华县', '411600');
INSERT INTO `x2_cityarea` VALUES ('411623', '411623', '商水县', '411600');
INSERT INTO `x2_cityarea` VALUES ('411624', '411624', '沈丘县', '411600');
INSERT INTO `x2_cityarea` VALUES ('411625', '411625', '郸城县', '411600');
INSERT INTO `x2_cityarea` VALUES ('411626', '411626', '淮阳县', '411600');
INSERT INTO `x2_cityarea` VALUES ('411627', '411627', '太康县', '411600');
INSERT INTO `x2_cityarea` VALUES ('411628', '411628', '鹿邑县', '411600');
INSERT INTO `x2_cityarea` VALUES ('411681', '411681', '项城市', '411600');
INSERT INTO `x2_cityarea` VALUES ('411701', '411701', '市辖区', '411700');
INSERT INTO `x2_cityarea` VALUES ('411702', '411702', '驿城区', '411700');
INSERT INTO `x2_cityarea` VALUES ('411721', '411721', '西平县', '411700');
INSERT INTO `x2_cityarea` VALUES ('411722', '411722', '上蔡县', '411700');
INSERT INTO `x2_cityarea` VALUES ('411723', '411723', '平舆县', '411700');
INSERT INTO `x2_cityarea` VALUES ('411724', '411724', '正阳县', '411700');
INSERT INTO `x2_cityarea` VALUES ('411725', '411725', '确山县', '411700');
INSERT INTO `x2_cityarea` VALUES ('411726', '411726', '泌阳县', '411700');
INSERT INTO `x2_cityarea` VALUES ('411727', '411727', '汝南县', '411700');
INSERT INTO `x2_cityarea` VALUES ('411728', '411728', '遂平县', '411700');
INSERT INTO `x2_cityarea` VALUES ('411729', '411729', '新蔡县', '411700');
INSERT INTO `x2_cityarea` VALUES ('420101', '420101', '市辖区', '420100');
INSERT INTO `x2_cityarea` VALUES ('420102', '420102', '江岸区', '420100');
INSERT INTO `x2_cityarea` VALUES ('420103', '420103', '江汉区', '420100');
INSERT INTO `x2_cityarea` VALUES ('420104', '420104', '乔口区', '420100');
INSERT INTO `x2_cityarea` VALUES ('420105', '420105', '汉阳区', '420100');
INSERT INTO `x2_cityarea` VALUES ('420106', '420106', '武昌区', '420100');
INSERT INTO `x2_cityarea` VALUES ('420107', '420107', '青山区', '420100');
INSERT INTO `x2_cityarea` VALUES ('420111', '420111', '洪山区', '420100');
INSERT INTO `x2_cityarea` VALUES ('420112', '420112', '东西湖区', '420100');
INSERT INTO `x2_cityarea` VALUES ('420113', '420113', '汉南区', '420100');
INSERT INTO `x2_cityarea` VALUES ('420114', '420114', '蔡甸区', '420100');
INSERT INTO `x2_cityarea` VALUES ('420115', '420115', '江夏区', '420100');
INSERT INTO `x2_cityarea` VALUES ('420116', '420116', '黄陂区', '420100');
INSERT INTO `x2_cityarea` VALUES ('420117', '420117', '新洲区', '420100');
INSERT INTO `x2_cityarea` VALUES ('420201', '420201', '市辖区', '420200');
INSERT INTO `x2_cityarea` VALUES ('420202', '420202', '黄石港区', '420200');
INSERT INTO `x2_cityarea` VALUES ('420203', '420203', '西塞山区', '420200');
INSERT INTO `x2_cityarea` VALUES ('420204', '420204', '下陆区', '420200');
INSERT INTO `x2_cityarea` VALUES ('420205', '420205', '铁山区', '420200');
INSERT INTO `x2_cityarea` VALUES ('420222', '420222', '阳新县', '420200');
INSERT INTO `x2_cityarea` VALUES ('420281', '420281', '大冶市', '420200');
INSERT INTO `x2_cityarea` VALUES ('420301', '420301', '市辖区', '420300');
INSERT INTO `x2_cityarea` VALUES ('420302', '420302', '茅箭区', '420300');
INSERT INTO `x2_cityarea` VALUES ('420303', '420303', '张湾区', '420300');
INSERT INTO `x2_cityarea` VALUES ('420321', '420321', '郧　县', '420300');
INSERT INTO `x2_cityarea` VALUES ('420322', '420322', '郧西县', '420300');
INSERT INTO `x2_cityarea` VALUES ('420323', '420323', '竹山县', '420300');
INSERT INTO `x2_cityarea` VALUES ('420324', '420324', '竹溪县', '420300');
INSERT INTO `x2_cityarea` VALUES ('420325', '420325', '房　县', '420300');
INSERT INTO `x2_cityarea` VALUES ('420381', '420381', '丹江口市', '420300');
INSERT INTO `x2_cityarea` VALUES ('420501', '420501', '市辖区', '420500');
INSERT INTO `x2_cityarea` VALUES ('420502', '420502', '西陵区', '420500');
INSERT INTO `x2_cityarea` VALUES ('420503', '420503', '伍家岗区', '420500');
INSERT INTO `x2_cityarea` VALUES ('420504', '420504', '点军区', '420500');
INSERT INTO `x2_cityarea` VALUES ('420505', '420505', '猇亭区', '420500');
INSERT INTO `x2_cityarea` VALUES ('420506', '420506', '夷陵区', '420500');
INSERT INTO `x2_cityarea` VALUES ('420525', '420525', '远安县', '420500');
INSERT INTO `x2_cityarea` VALUES ('420526', '420526', '兴山县', '420500');
INSERT INTO `x2_cityarea` VALUES ('420527', '420527', '秭归县', '420500');
INSERT INTO `x2_cityarea` VALUES ('420528', '420528', '长阳土家族自治县', '420500');
INSERT INTO `x2_cityarea` VALUES ('420529', '420529', '五峰土家族自治县', '420500');
INSERT INTO `x2_cityarea` VALUES ('420581', '420581', '宜都市', '420500');
INSERT INTO `x2_cityarea` VALUES ('420582', '420582', '当阳市', '420500');
INSERT INTO `x2_cityarea` VALUES ('420583', '420583', '枝江市', '420500');
INSERT INTO `x2_cityarea` VALUES ('420601', '420601', '市辖区', '420600');
INSERT INTO `x2_cityarea` VALUES ('420602', '420602', '襄城区', '420600');
INSERT INTO `x2_cityarea` VALUES ('420606', '420606', '樊城区', '420600');
INSERT INTO `x2_cityarea` VALUES ('420607', '420607', '襄阳区', '420600');
INSERT INTO `x2_cityarea` VALUES ('420624', '420624', '南漳县', '420600');
INSERT INTO `x2_cityarea` VALUES ('420625', '420625', '谷城县', '420600');
INSERT INTO `x2_cityarea` VALUES ('420626', '420626', '保康县', '420600');
INSERT INTO `x2_cityarea` VALUES ('420682', '420682', '老河口市', '420600');
INSERT INTO `x2_cityarea` VALUES ('420683', '420683', '枣阳市', '420600');
INSERT INTO `x2_cityarea` VALUES ('420684', '420684', '宜城市', '420600');
INSERT INTO `x2_cityarea` VALUES ('420701', '420701', '市辖区', '420700');
INSERT INTO `x2_cityarea` VALUES ('420702', '420702', '梁子湖区', '420700');
INSERT INTO `x2_cityarea` VALUES ('420703', '420703', '华容区', '420700');
INSERT INTO `x2_cityarea` VALUES ('420704', '420704', '鄂城区', '420700');
INSERT INTO `x2_cityarea` VALUES ('420801', '420801', '市辖区', '420800');
INSERT INTO `x2_cityarea` VALUES ('420802', '420802', '东宝区', '420800');
INSERT INTO `x2_cityarea` VALUES ('420804', '420804', '掇刀区', '420800');
INSERT INTO `x2_cityarea` VALUES ('420821', '420821', '京山县', '420800');
INSERT INTO `x2_cityarea` VALUES ('420822', '420822', '沙洋县', '420800');
INSERT INTO `x2_cityarea` VALUES ('420881', '420881', '钟祥市', '420800');
INSERT INTO `x2_cityarea` VALUES ('420901', '420901', '市辖区', '420900');
INSERT INTO `x2_cityarea` VALUES ('420902', '420902', '孝南区', '420900');
INSERT INTO `x2_cityarea` VALUES ('420921', '420921', '孝昌县', '420900');
INSERT INTO `x2_cityarea` VALUES ('420922', '420922', '大悟县', '420900');
INSERT INTO `x2_cityarea` VALUES ('420923', '420923', '云梦县', '420900');
INSERT INTO `x2_cityarea` VALUES ('420981', '420981', '应城市', '420900');
INSERT INTO `x2_cityarea` VALUES ('420982', '420982', '安陆市', '420900');
INSERT INTO `x2_cityarea` VALUES ('420984', '420984', '汉川市', '420900');
INSERT INTO `x2_cityarea` VALUES ('421001', '421001', '市辖区', '421000');
INSERT INTO `x2_cityarea` VALUES ('421002', '421002', '沙市区', '421000');
INSERT INTO `x2_cityarea` VALUES ('421003', '421003', '荆州区', '421000');
INSERT INTO `x2_cityarea` VALUES ('421022', '421022', '公安县', '421000');
INSERT INTO `x2_cityarea` VALUES ('421023', '421023', '监利县', '421000');
INSERT INTO `x2_cityarea` VALUES ('421024', '421024', '江陵县', '421000');
INSERT INTO `x2_cityarea` VALUES ('421081', '421081', '石首市', '421000');
INSERT INTO `x2_cityarea` VALUES ('421083', '421083', '洪湖市', '421000');
INSERT INTO `x2_cityarea` VALUES ('421087', '421087', '松滋市', '421000');
INSERT INTO `x2_cityarea` VALUES ('421101', '421101', '市辖区', '421100');
INSERT INTO `x2_cityarea` VALUES ('421102', '421102', '黄州区', '421100');
INSERT INTO `x2_cityarea` VALUES ('421121', '421121', '团风县', '421100');
INSERT INTO `x2_cityarea` VALUES ('421122', '421122', '红安县', '421100');
INSERT INTO `x2_cityarea` VALUES ('421123', '421123', '罗田县', '421100');
INSERT INTO `x2_cityarea` VALUES ('421124', '421124', '英山县', '421100');
INSERT INTO `x2_cityarea` VALUES ('421125', '421125', '浠水县', '421100');
INSERT INTO `x2_cityarea` VALUES ('421126', '421126', '蕲春县', '421100');
INSERT INTO `x2_cityarea` VALUES ('421127', '421127', '黄梅县', '421100');
INSERT INTO `x2_cityarea` VALUES ('421181', '421181', '麻城市', '421100');
INSERT INTO `x2_cityarea` VALUES ('421182', '421182', '武穴市', '421100');
INSERT INTO `x2_cityarea` VALUES ('421201', '421201', '市辖区', '421200');
INSERT INTO `x2_cityarea` VALUES ('421202', '421202', '咸安区', '421200');
INSERT INTO `x2_cityarea` VALUES ('421221', '421221', '嘉鱼县', '421200');
INSERT INTO `x2_cityarea` VALUES ('421222', '421222', '通城县', '421200');
INSERT INTO `x2_cityarea` VALUES ('421223', '421223', '崇阳县', '421200');
INSERT INTO `x2_cityarea` VALUES ('421224', '421224', '通山县', '421200');
INSERT INTO `x2_cityarea` VALUES ('421281', '421281', '赤壁市', '421200');
INSERT INTO `x2_cityarea` VALUES ('421301', '421301', '市辖区', '421300');
INSERT INTO `x2_cityarea` VALUES ('421302', '421302', '曾都区', '421300');
INSERT INTO `x2_cityarea` VALUES ('421381', '421381', '广水市', '421300');
INSERT INTO `x2_cityarea` VALUES ('422801', '422801', '恩施市', '422800');
INSERT INTO `x2_cityarea` VALUES ('422802', '422802', '利川市', '422800');
INSERT INTO `x2_cityarea` VALUES ('422822', '422822', '建始县', '422800');
INSERT INTO `x2_cityarea` VALUES ('422823', '422823', '巴东县', '422800');
INSERT INTO `x2_cityarea` VALUES ('422825', '422825', '宣恩县', '422800');
INSERT INTO `x2_cityarea` VALUES ('422826', '422826', '咸丰县', '422800');
INSERT INTO `x2_cityarea` VALUES ('422827', '422827', '来凤县', '422800');
INSERT INTO `x2_cityarea` VALUES ('422828', '422828', '鹤峰县', '422800');
INSERT INTO `x2_cityarea` VALUES ('429004', '429004', '仙桃市', '429000');
INSERT INTO `x2_cityarea` VALUES ('429005', '429005', '潜江市', '429000');
INSERT INTO `x2_cityarea` VALUES ('429006', '429006', '天门市', '429000');
INSERT INTO `x2_cityarea` VALUES ('429021', '429021', '神农架林区', '429000');
INSERT INTO `x2_cityarea` VALUES ('430101', '430101', '市辖区', '430100');
INSERT INTO `x2_cityarea` VALUES ('430102', '430102', '芙蓉区', '430100');
INSERT INTO `x2_cityarea` VALUES ('430103', '430103', '天心区', '430100');
INSERT INTO `x2_cityarea` VALUES ('430104', '430104', '岳麓区', '430100');
INSERT INTO `x2_cityarea` VALUES ('430105', '430105', '开福区', '430100');
INSERT INTO `x2_cityarea` VALUES ('430111', '430111', '雨花区', '430100');
INSERT INTO `x2_cityarea` VALUES ('430121', '430121', '长沙县', '430100');
INSERT INTO `x2_cityarea` VALUES ('430122', '430122', '望城县', '430100');
INSERT INTO `x2_cityarea` VALUES ('430124', '430124', '宁乡县', '430100');
INSERT INTO `x2_cityarea` VALUES ('430181', '430181', '浏阳市', '430100');
INSERT INTO `x2_cityarea` VALUES ('430201', '430201', '市辖区', '430200');
INSERT INTO `x2_cityarea` VALUES ('430202', '430202', '荷塘区', '430200');
INSERT INTO `x2_cityarea` VALUES ('430203', '430203', '芦淞区', '430200');
INSERT INTO `x2_cityarea` VALUES ('430204', '430204', '石峰区', '430200');
INSERT INTO `x2_cityarea` VALUES ('430211', '430211', '天元区', '430200');
INSERT INTO `x2_cityarea` VALUES ('430221', '430221', '株洲县', '430200');
INSERT INTO `x2_cityarea` VALUES ('430223', '430223', '攸　县', '430200');
INSERT INTO `x2_cityarea` VALUES ('430224', '430224', '茶陵县', '430200');
INSERT INTO `x2_cityarea` VALUES ('430225', '430225', '炎陵县', '430200');
INSERT INTO `x2_cityarea` VALUES ('430281', '430281', '醴陵市', '430200');
INSERT INTO `x2_cityarea` VALUES ('430301', '430301', '市辖区', '430300');
INSERT INTO `x2_cityarea` VALUES ('430302', '430302', '雨湖区', '430300');
INSERT INTO `x2_cityarea` VALUES ('430304', '430304', '岳塘区', '430300');
INSERT INTO `x2_cityarea` VALUES ('430321', '430321', '湘潭县', '430300');
INSERT INTO `x2_cityarea` VALUES ('430381', '430381', '湘乡市', '430300');
INSERT INTO `x2_cityarea` VALUES ('430382', '430382', '韶山市', '430300');
INSERT INTO `x2_cityarea` VALUES ('430401', '430401', '市辖区', '430400');
INSERT INTO `x2_cityarea` VALUES ('430405', '430405', '珠晖区', '430400');
INSERT INTO `x2_cityarea` VALUES ('430406', '430406', '雁峰区', '430400');
INSERT INTO `x2_cityarea` VALUES ('430407', '430407', '石鼓区', '430400');
INSERT INTO `x2_cityarea` VALUES ('430408', '430408', '蒸湘区', '430400');
INSERT INTO `x2_cityarea` VALUES ('430412', '430412', '南岳区', '430400');
INSERT INTO `x2_cityarea` VALUES ('430421', '430421', '衡阳县', '430400');
INSERT INTO `x2_cityarea` VALUES ('430422', '430422', '衡南县', '430400');
INSERT INTO `x2_cityarea` VALUES ('430423', '430423', '衡山县', '430400');
INSERT INTO `x2_cityarea` VALUES ('430424', '430424', '衡东县', '430400');
INSERT INTO `x2_cityarea` VALUES ('430426', '430426', '祁东县', '430400');
INSERT INTO `x2_cityarea` VALUES ('430481', '430481', '耒阳市', '430400');
INSERT INTO `x2_cityarea` VALUES ('430482', '430482', '常宁市', '430400');
INSERT INTO `x2_cityarea` VALUES ('430501', '430501', '市辖区', '430500');
INSERT INTO `x2_cityarea` VALUES ('430502', '430502', '双清区', '430500');
INSERT INTO `x2_cityarea` VALUES ('430503', '430503', '大祥区', '430500');
INSERT INTO `x2_cityarea` VALUES ('430511', '430511', '北塔区', '430500');
INSERT INTO `x2_cityarea` VALUES ('430521', '430521', '邵东县', '430500');
INSERT INTO `x2_cityarea` VALUES ('430522', '430522', '新邵县', '430500');
INSERT INTO `x2_cityarea` VALUES ('430523', '430523', '邵阳县', '430500');
INSERT INTO `x2_cityarea` VALUES ('430524', '430524', '隆回县', '430500');
INSERT INTO `x2_cityarea` VALUES ('430525', '430525', '洞口县', '430500');
INSERT INTO `x2_cityarea` VALUES ('430527', '430527', '绥宁县', '430500');
INSERT INTO `x2_cityarea` VALUES ('430528', '430528', '新宁县', '430500');
INSERT INTO `x2_cityarea` VALUES ('430529', '430529', '城步苗族自治县', '430500');
INSERT INTO `x2_cityarea` VALUES ('430581', '430581', '武冈市', '430500');
INSERT INTO `x2_cityarea` VALUES ('430601', '430601', '市辖区', '430600');
INSERT INTO `x2_cityarea` VALUES ('430602', '430602', '岳阳楼区', '430600');
INSERT INTO `x2_cityarea` VALUES ('430603', '430603', '云溪区', '430600');
INSERT INTO `x2_cityarea` VALUES ('430611', '430611', '君山区', '430600');
INSERT INTO `x2_cityarea` VALUES ('430621', '430621', '岳阳县', '430600');
INSERT INTO `x2_cityarea` VALUES ('430623', '430623', '华容县', '430600');
INSERT INTO `x2_cityarea` VALUES ('430624', '430624', '湘阴县', '430600');
INSERT INTO `x2_cityarea` VALUES ('430626', '430626', '平江县', '430600');
INSERT INTO `x2_cityarea` VALUES ('430681', '430681', '汨罗市', '430600');
INSERT INTO `x2_cityarea` VALUES ('430682', '430682', '临湘市', '430600');
INSERT INTO `x2_cityarea` VALUES ('430701', '430701', '市辖区', '430700');
INSERT INTO `x2_cityarea` VALUES ('430702', '430702', '武陵区', '430700');
INSERT INTO `x2_cityarea` VALUES ('430703', '430703', '鼎城区', '430700');
INSERT INTO `x2_cityarea` VALUES ('430721', '430721', '安乡县', '430700');
INSERT INTO `x2_cityarea` VALUES ('430722', '430722', '汉寿县', '430700');
INSERT INTO `x2_cityarea` VALUES ('430723', '430723', '澧　县', '430700');
INSERT INTO `x2_cityarea` VALUES ('430724', '430724', '临澧县', '430700');
INSERT INTO `x2_cityarea` VALUES ('430725', '430725', '桃源县', '430700');
INSERT INTO `x2_cityarea` VALUES ('430726', '430726', '石门县', '430700');
INSERT INTO `x2_cityarea` VALUES ('430781', '430781', '津市市', '430700');
INSERT INTO `x2_cityarea` VALUES ('430801', '430801', '市辖区', '430800');
INSERT INTO `x2_cityarea` VALUES ('430802', '430802', '永定区', '430800');
INSERT INTO `x2_cityarea` VALUES ('430811', '430811', '武陵源区', '430800');
INSERT INTO `x2_cityarea` VALUES ('430821', '430821', '慈利县', '430800');
INSERT INTO `x2_cityarea` VALUES ('430822', '430822', '桑植县', '430800');
INSERT INTO `x2_cityarea` VALUES ('430901', '430901', '市辖区', '430900');
INSERT INTO `x2_cityarea` VALUES ('430902', '430902', '资阳区', '430900');
INSERT INTO `x2_cityarea` VALUES ('430903', '430903', '赫山区', '430900');
INSERT INTO `x2_cityarea` VALUES ('430921', '430921', '南　县', '430900');
INSERT INTO `x2_cityarea` VALUES ('430922', '430922', '桃江县', '430900');
INSERT INTO `x2_cityarea` VALUES ('430923', '430923', '安化县', '430900');
INSERT INTO `x2_cityarea` VALUES ('430981', '430981', '沅江市', '430900');
INSERT INTO `x2_cityarea` VALUES ('431001', '431001', '市辖区', '431000');
INSERT INTO `x2_cityarea` VALUES ('431002', '431002', '北湖区', '431000');
INSERT INTO `x2_cityarea` VALUES ('431003', '431003', '苏仙区', '431000');
INSERT INTO `x2_cityarea` VALUES ('431021', '431021', '桂阳县', '431000');
INSERT INTO `x2_cityarea` VALUES ('431022', '431022', '宜章县', '431000');
INSERT INTO `x2_cityarea` VALUES ('431023', '431023', '永兴县', '431000');
INSERT INTO `x2_cityarea` VALUES ('431024', '431024', '嘉禾县', '431000');
INSERT INTO `x2_cityarea` VALUES ('431025', '431025', '临武县', '431000');
INSERT INTO `x2_cityarea` VALUES ('431026', '431026', '汝城县', '431000');
INSERT INTO `x2_cityarea` VALUES ('431027', '431027', '桂东县', '431000');
INSERT INTO `x2_cityarea` VALUES ('431028', '431028', '安仁县', '431000');
INSERT INTO `x2_cityarea` VALUES ('431081', '431081', '资兴市', '431000');
INSERT INTO `x2_cityarea` VALUES ('431101', '431101', '市辖区', '431100');
INSERT INTO `x2_cityarea` VALUES ('431102', '431102', '零陵区', '431100');
INSERT INTO `x2_cityarea` VALUES ('431103', '431103', '冷水滩区', '431100');
INSERT INTO `x2_cityarea` VALUES ('431121', '431121', '祁阳县', '431100');
INSERT INTO `x2_cityarea` VALUES ('431122', '431122', '东安县', '431100');
INSERT INTO `x2_cityarea` VALUES ('431123', '431123', '双牌县', '431100');
INSERT INTO `x2_cityarea` VALUES ('431124', '431124', '道　县', '431100');
INSERT INTO `x2_cityarea` VALUES ('431125', '431125', '江永县', '431100');
INSERT INTO `x2_cityarea` VALUES ('431126', '431126', '宁远县', '431100');
INSERT INTO `x2_cityarea` VALUES ('431127', '431127', '蓝山县', '431100');
INSERT INTO `x2_cityarea` VALUES ('431128', '431128', '新田县', '431100');
INSERT INTO `x2_cityarea` VALUES ('431129', '431129', '江华瑶族自治县', '431100');
INSERT INTO `x2_cityarea` VALUES ('431201', '431201', '市辖区', '431200');
INSERT INTO `x2_cityarea` VALUES ('431202', '431202', '鹤城区', '431200');
INSERT INTO `x2_cityarea` VALUES ('431221', '431221', '中方县', '431200');
INSERT INTO `x2_cityarea` VALUES ('431222', '431222', '沅陵县', '431200');
INSERT INTO `x2_cityarea` VALUES ('431223', '431223', '辰溪县', '431200');
INSERT INTO `x2_cityarea` VALUES ('431224', '431224', '溆浦县', '431200');
INSERT INTO `x2_cityarea` VALUES ('431225', '431225', '会同县', '431200');
INSERT INTO `x2_cityarea` VALUES ('431226', '431226', '麻阳苗族自治县', '431200');
INSERT INTO `x2_cityarea` VALUES ('431227', '431227', '新晃侗族自治县', '431200');
INSERT INTO `x2_cityarea` VALUES ('431228', '431228', '芷江侗族自治县', '431200');
INSERT INTO `x2_cityarea` VALUES ('431229', '431229', '靖州苗族侗族自治县', '431200');
INSERT INTO `x2_cityarea` VALUES ('431230', '431230', '通道侗族自治县', '431200');
INSERT INTO `x2_cityarea` VALUES ('431281', '431281', '洪江市', '431200');
INSERT INTO `x2_cityarea` VALUES ('431301', '431301', '市辖区', '431300');
INSERT INTO `x2_cityarea` VALUES ('431302', '431302', '娄星区', '431300');
INSERT INTO `x2_cityarea` VALUES ('431321', '431321', '双峰县', '431300');
INSERT INTO `x2_cityarea` VALUES ('431322', '431322', '新化县', '431300');
INSERT INTO `x2_cityarea` VALUES ('431381', '431381', '冷水江市', '431300');
INSERT INTO `x2_cityarea` VALUES ('431382', '431382', '涟源市', '431300');
INSERT INTO `x2_cityarea` VALUES ('433101', '433101', '吉首市', '433100');
INSERT INTO `x2_cityarea` VALUES ('433122', '433122', '泸溪县', '433100');
INSERT INTO `x2_cityarea` VALUES ('433123', '433123', '凤凰县', '433100');
INSERT INTO `x2_cityarea` VALUES ('433124', '433124', '花垣县', '433100');
INSERT INTO `x2_cityarea` VALUES ('433125', '433125', '保靖县', '433100');
INSERT INTO `x2_cityarea` VALUES ('433126', '433126', '古丈县', '433100');
INSERT INTO `x2_cityarea` VALUES ('433127', '433127', '永顺县', '433100');
INSERT INTO `x2_cityarea` VALUES ('433130', '433130', '龙山县', '433100');
INSERT INTO `x2_cityarea` VALUES ('440101', '440101', '市辖区', '440100');
INSERT INTO `x2_cityarea` VALUES ('440102', '440102', '东山区', '440100');
INSERT INTO `x2_cityarea` VALUES ('440103', '440103', '荔湾区', '440100');
INSERT INTO `x2_cityarea` VALUES ('440104', '440104', '越秀区', '440100');
INSERT INTO `x2_cityarea` VALUES ('440105', '440105', '海珠区', '440100');
INSERT INTO `x2_cityarea` VALUES ('440106', '440106', '天河区', '440100');
INSERT INTO `x2_cityarea` VALUES ('440107', '440107', '芳村区', '440100');
INSERT INTO `x2_cityarea` VALUES ('440111', '440111', '白云区', '440100');
INSERT INTO `x2_cityarea` VALUES ('440112', '440112', '黄埔区', '440100');
INSERT INTO `x2_cityarea` VALUES ('440113', '440113', '番禺区', '440100');
INSERT INTO `x2_cityarea` VALUES ('440114', '440114', '花都区', '440100');
INSERT INTO `x2_cityarea` VALUES ('440183', '440183', '增城市', '440100');
INSERT INTO `x2_cityarea` VALUES ('440184', '440184', '从化市', '440100');
INSERT INTO `x2_cityarea` VALUES ('440201', '440201', '市辖区', '440200');
INSERT INTO `x2_cityarea` VALUES ('440203', '440203', '武江区', '440200');
INSERT INTO `x2_cityarea` VALUES ('440204', '440204', '浈江区', '440200');
INSERT INTO `x2_cityarea` VALUES ('440205', '440205', '曲江区', '440200');
INSERT INTO `x2_cityarea` VALUES ('440222', '440222', '始兴县', '440200');
INSERT INTO `x2_cityarea` VALUES ('440224', '440224', '仁化县', '440200');
INSERT INTO `x2_cityarea` VALUES ('440229', '440229', '翁源县', '440200');
INSERT INTO `x2_cityarea` VALUES ('440232', '440232', '乳源瑶族自治县', '440200');
INSERT INTO `x2_cityarea` VALUES ('440233', '440233', '新丰县', '440200');
INSERT INTO `x2_cityarea` VALUES ('440281', '440281', '乐昌市', '440200');
INSERT INTO `x2_cityarea` VALUES ('440282', '440282', '南雄市', '440200');
INSERT INTO `x2_cityarea` VALUES ('440301', '440301', '市辖区', '440300');
INSERT INTO `x2_cityarea` VALUES ('440303', '440303', '罗湖区', '440300');
INSERT INTO `x2_cityarea` VALUES ('440304', '440304', '福田区', '440300');
INSERT INTO `x2_cityarea` VALUES ('440305', '440305', '南山区', '440300');
INSERT INTO `x2_cityarea` VALUES ('440306', '440306', '宝安区', '440300');
INSERT INTO `x2_cityarea` VALUES ('440307', '440307', '龙岗区', '440300');
INSERT INTO `x2_cityarea` VALUES ('440308', '440308', '盐田区', '440300');
INSERT INTO `x2_cityarea` VALUES ('440401', '440401', '市辖区', '440400');
INSERT INTO `x2_cityarea` VALUES ('440402', '440402', '香洲区', '440400');
INSERT INTO `x2_cityarea` VALUES ('440403', '440403', '斗门区', '440400');
INSERT INTO `x2_cityarea` VALUES ('440404', '440404', '金湾区', '440400');
INSERT INTO `x2_cityarea` VALUES ('440501', '440501', '市辖区', '440500');
INSERT INTO `x2_cityarea` VALUES ('440507', '440507', '龙湖区', '440500');
INSERT INTO `x2_cityarea` VALUES ('440511', '440511', '金平区', '440500');
INSERT INTO `x2_cityarea` VALUES ('440512', '440512', '濠江区', '440500');
INSERT INTO `x2_cityarea` VALUES ('440513', '440513', '潮阳区', '440500');
INSERT INTO `x2_cityarea` VALUES ('440514', '440514', '潮南区', '440500');
INSERT INTO `x2_cityarea` VALUES ('440515', '440515', '澄海区', '440500');
INSERT INTO `x2_cityarea` VALUES ('440523', '440523', '南澳县', '440500');
INSERT INTO `x2_cityarea` VALUES ('440601', '440601', '市辖区', '440600');
INSERT INTO `x2_cityarea` VALUES ('440604', '440604', '禅城区', '440600');
INSERT INTO `x2_cityarea` VALUES ('440605', '440605', '南海区', '440600');
INSERT INTO `x2_cityarea` VALUES ('440606', '440606', '顺德区', '440600');
INSERT INTO `x2_cityarea` VALUES ('440607', '440607', '三水区', '440600');
INSERT INTO `x2_cityarea` VALUES ('440608', '440608', '高明区', '440600');
INSERT INTO `x2_cityarea` VALUES ('440701', '440701', '市辖区', '440700');
INSERT INTO `x2_cityarea` VALUES ('440703', '440703', '蓬江区', '440700');
INSERT INTO `x2_cityarea` VALUES ('440704', '440704', '江海区', '440700');
INSERT INTO `x2_cityarea` VALUES ('440705', '440705', '新会区', '440700');
INSERT INTO `x2_cityarea` VALUES ('440781', '440781', '台山市', '440700');
INSERT INTO `x2_cityarea` VALUES ('440783', '440783', '开平市', '440700');
INSERT INTO `x2_cityarea` VALUES ('440784', '440784', '鹤山市', '440700');
INSERT INTO `x2_cityarea` VALUES ('440785', '440785', '恩平市', '440700');
INSERT INTO `x2_cityarea` VALUES ('440801', '440801', '市辖区', '440800');
INSERT INTO `x2_cityarea` VALUES ('440802', '440802', '赤坎区', '440800');
INSERT INTO `x2_cityarea` VALUES ('440803', '440803', '霞山区', '440800');
INSERT INTO `x2_cityarea` VALUES ('440804', '440804', '坡头区', '440800');
INSERT INTO `x2_cityarea` VALUES ('440811', '440811', '麻章区', '440800');
INSERT INTO `x2_cityarea` VALUES ('440823', '440823', '遂溪县', '440800');
INSERT INTO `x2_cityarea` VALUES ('440825', '440825', '徐闻县', '440800');
INSERT INTO `x2_cityarea` VALUES ('440881', '440881', '廉江市', '440800');
INSERT INTO `x2_cityarea` VALUES ('440882', '440882', '雷州市', '440800');
INSERT INTO `x2_cityarea` VALUES ('440883', '440883', '吴川市', '440800');
INSERT INTO `x2_cityarea` VALUES ('440901', '440901', '市辖区', '440900');
INSERT INTO `x2_cityarea` VALUES ('440902', '440902', '茂南区', '440900');
INSERT INTO `x2_cityarea` VALUES ('440903', '440903', '茂港区', '440900');
INSERT INTO `x2_cityarea` VALUES ('440923', '440923', '电白县', '440900');
INSERT INTO `x2_cityarea` VALUES ('440981', '440981', '高州市', '440900');
INSERT INTO `x2_cityarea` VALUES ('440982', '440982', '化州市', '440900');
INSERT INTO `x2_cityarea` VALUES ('440983', '440983', '信宜市', '440900');
INSERT INTO `x2_cityarea` VALUES ('441201', '441201', '市辖区', '441200');
INSERT INTO `x2_cityarea` VALUES ('441202', '441202', '端州区', '441200');
INSERT INTO `x2_cityarea` VALUES ('441203', '441203', '鼎湖区', '441200');
INSERT INTO `x2_cityarea` VALUES ('441223', '441223', '广宁县', '441200');
INSERT INTO `x2_cityarea` VALUES ('441224', '441224', '怀集县', '441200');
INSERT INTO `x2_cityarea` VALUES ('441225', '441225', '封开县', '441200');
INSERT INTO `x2_cityarea` VALUES ('441226', '441226', '德庆县', '441200');
INSERT INTO `x2_cityarea` VALUES ('441283', '441283', '高要市', '441200');
INSERT INTO `x2_cityarea` VALUES ('441284', '441284', '四会市', '441200');
INSERT INTO `x2_cityarea` VALUES ('441301', '441301', '市辖区', '441300');
INSERT INTO `x2_cityarea` VALUES ('441302', '441302', '惠城区', '441300');
INSERT INTO `x2_cityarea` VALUES ('441303', '441303', '惠阳区', '441300');
INSERT INTO `x2_cityarea` VALUES ('441322', '441322', '博罗县', '441300');
INSERT INTO `x2_cityarea` VALUES ('441323', '441323', '惠东县', '441300');
INSERT INTO `x2_cityarea` VALUES ('441324', '441324', '龙门县', '441300');
INSERT INTO `x2_cityarea` VALUES ('441401', '441401', '市辖区', '441400');
INSERT INTO `x2_cityarea` VALUES ('441402', '441402', '梅江区', '441400');
INSERT INTO `x2_cityarea` VALUES ('441421', '441421', '梅　县', '441400');
INSERT INTO `x2_cityarea` VALUES ('441422', '441422', '大埔县', '441400');
INSERT INTO `x2_cityarea` VALUES ('441423', '441423', '丰顺县', '441400');
INSERT INTO `x2_cityarea` VALUES ('441424', '441424', '五华县', '441400');
INSERT INTO `x2_cityarea` VALUES ('441426', '441426', '平远县', '441400');
INSERT INTO `x2_cityarea` VALUES ('441427', '441427', '蕉岭县', '441400');
INSERT INTO `x2_cityarea` VALUES ('441481', '441481', '兴宁市', '441400');
INSERT INTO `x2_cityarea` VALUES ('441501', '441501', '市辖区', '441500');
INSERT INTO `x2_cityarea` VALUES ('441502', '441502', '城　区', '441500');
INSERT INTO `x2_cityarea` VALUES ('441521', '441521', '海丰县', '441500');
INSERT INTO `x2_cityarea` VALUES ('441523', '441523', '陆河县', '441500');
INSERT INTO `x2_cityarea` VALUES ('441581', '441581', '陆丰市', '441500');
INSERT INTO `x2_cityarea` VALUES ('441601', '441601', '市辖区', '441600');
INSERT INTO `x2_cityarea` VALUES ('441602', '441602', '源城区', '441600');
INSERT INTO `x2_cityarea` VALUES ('441621', '441621', '紫金县', '441600');
INSERT INTO `x2_cityarea` VALUES ('441622', '441622', '龙川县', '441600');
INSERT INTO `x2_cityarea` VALUES ('441623', '441623', '连平县', '441600');
INSERT INTO `x2_cityarea` VALUES ('441624', '441624', '和平县', '441600');
INSERT INTO `x2_cityarea` VALUES ('441625', '441625', '东源县', '441600');
INSERT INTO `x2_cityarea` VALUES ('441701', '441701', '市辖区', '441700');
INSERT INTO `x2_cityarea` VALUES ('441702', '441702', '江城区', '441700');
INSERT INTO `x2_cityarea` VALUES ('441721', '441721', '阳西县', '441700');
INSERT INTO `x2_cityarea` VALUES ('441723', '441723', '阳东县', '441700');
INSERT INTO `x2_cityarea` VALUES ('441781', '441781', '阳春市', '441700');
INSERT INTO `x2_cityarea` VALUES ('441801', '441801', '市辖区', '441800');
INSERT INTO `x2_cityarea` VALUES ('441802', '441802', '清城区', '441800');
INSERT INTO `x2_cityarea` VALUES ('441821', '441821', '佛冈县', '441800');
INSERT INTO `x2_cityarea` VALUES ('441823', '441823', '阳山县', '441800');
INSERT INTO `x2_cityarea` VALUES ('441825', '441825', '连山壮族瑶族自治县', '441800');
INSERT INTO `x2_cityarea` VALUES ('441826', '441826', '连南瑶族自治县', '441800');
INSERT INTO `x2_cityarea` VALUES ('441827', '441827', '清新县', '441800');
INSERT INTO `x2_cityarea` VALUES ('441881', '441881', '英德市', '441800');
INSERT INTO `x2_cityarea` VALUES ('441882', '441882', '连州市', '441800');
INSERT INTO `x2_cityarea` VALUES ('445101', '445101', '市辖区', '445100');
INSERT INTO `x2_cityarea` VALUES ('445102', '445102', '湘桥区', '445100');
INSERT INTO `x2_cityarea` VALUES ('445121', '445121', '潮安县', '445100');
INSERT INTO `x2_cityarea` VALUES ('445122', '445122', '饶平县', '445100');
INSERT INTO `x2_cityarea` VALUES ('445201', '445201', '市辖区', '445200');
INSERT INTO `x2_cityarea` VALUES ('445202', '445202', '榕城区', '445200');
INSERT INTO `x2_cityarea` VALUES ('445221', '445221', '揭东县', '445200');
INSERT INTO `x2_cityarea` VALUES ('445222', '445222', '揭西县', '445200');
INSERT INTO `x2_cityarea` VALUES ('445224', '445224', '惠来县', '445200');
INSERT INTO `x2_cityarea` VALUES ('445281', '445281', '普宁市', '445200');
INSERT INTO `x2_cityarea` VALUES ('445301', '445301', '市辖区', '445300');
INSERT INTO `x2_cityarea` VALUES ('445302', '445302', '云城区', '445300');
INSERT INTO `x2_cityarea` VALUES ('445321', '445321', '新兴县', '445300');
INSERT INTO `x2_cityarea` VALUES ('445322', '445322', '郁南县', '445300');
INSERT INTO `x2_cityarea` VALUES ('445323', '445323', '云安县', '445300');
INSERT INTO `x2_cityarea` VALUES ('445381', '445381', '罗定市', '445300');
INSERT INTO `x2_cityarea` VALUES ('450101', '450101', '市辖区', '450100');
INSERT INTO `x2_cityarea` VALUES ('450102', '450102', '兴宁区', '450100');
INSERT INTO `x2_cityarea` VALUES ('450103', '450103', '青秀区', '450100');
INSERT INTO `x2_cityarea` VALUES ('450105', '450105', '江南区', '450100');
INSERT INTO `x2_cityarea` VALUES ('450107', '450107', '西乡塘区', '450100');
INSERT INTO `x2_cityarea` VALUES ('450108', '450108', '良庆区', '450100');
INSERT INTO `x2_cityarea` VALUES ('450109', '450109', '邕宁区', '450100');
INSERT INTO `x2_cityarea` VALUES ('450122', '450122', '武鸣县', '450100');
INSERT INTO `x2_cityarea` VALUES ('450123', '450123', '隆安县', '450100');
INSERT INTO `x2_cityarea` VALUES ('450124', '450124', '马山县', '450100');
INSERT INTO `x2_cityarea` VALUES ('450125', '450125', '上林县', '450100');
INSERT INTO `x2_cityarea` VALUES ('450126', '450126', '宾阳县', '450100');
INSERT INTO `x2_cityarea` VALUES ('450127', '450127', '横　县', '450100');
INSERT INTO `x2_cityarea` VALUES ('450201', '450201', '市辖区', '450200');
INSERT INTO `x2_cityarea` VALUES ('450202', '450202', '城中区', '450200');
INSERT INTO `x2_cityarea` VALUES ('450203', '450203', '鱼峰区', '450200');
INSERT INTO `x2_cityarea` VALUES ('450204', '450204', '柳南区', '450200');
INSERT INTO `x2_cityarea` VALUES ('450205', '450205', '柳北区', '450200');
INSERT INTO `x2_cityarea` VALUES ('450221', '450221', '柳江县', '450200');
INSERT INTO `x2_cityarea` VALUES ('450222', '450222', '柳城县', '450200');
INSERT INTO `x2_cityarea` VALUES ('450223', '450223', '鹿寨县', '450200');
INSERT INTO `x2_cityarea` VALUES ('450224', '450224', '融安县', '450200');
INSERT INTO `x2_cityarea` VALUES ('450225', '450225', '融水苗族自治县', '450200');
INSERT INTO `x2_cityarea` VALUES ('450226', '450226', '三江侗族自治县', '450200');
INSERT INTO `x2_cityarea` VALUES ('450301', '450301', '市辖区', '450300');
INSERT INTO `x2_cityarea` VALUES ('450302', '450302', '秀峰区', '450300');
INSERT INTO `x2_cityarea` VALUES ('450303', '450303', '叠彩区', '450300');
INSERT INTO `x2_cityarea` VALUES ('450304', '450304', '象山区', '450300');
INSERT INTO `x2_cityarea` VALUES ('450305', '450305', '七星区', '450300');
INSERT INTO `x2_cityarea` VALUES ('450311', '450311', '雁山区', '450300');
INSERT INTO `x2_cityarea` VALUES ('450321', '450321', '阳朔县', '450300');
INSERT INTO `x2_cityarea` VALUES ('450322', '450322', '临桂县', '450300');
INSERT INTO `x2_cityarea` VALUES ('450323', '450323', '灵川县', '450300');
INSERT INTO `x2_cityarea` VALUES ('450324', '450324', '全州县', '450300');
INSERT INTO `x2_cityarea` VALUES ('450325', '450325', '兴安县', '450300');
INSERT INTO `x2_cityarea` VALUES ('450326', '450326', '永福县', '450300');
INSERT INTO `x2_cityarea` VALUES ('450327', '450327', '灌阳县', '450300');
INSERT INTO `x2_cityarea` VALUES ('450328', '450328', '龙胜各族自治县', '450300');
INSERT INTO `x2_cityarea` VALUES ('450329', '450329', '资源县', '450300');
INSERT INTO `x2_cityarea` VALUES ('450330', '450330', '平乐县', '450300');
INSERT INTO `x2_cityarea` VALUES ('450331', '450331', '荔蒲县', '450300');
INSERT INTO `x2_cityarea` VALUES ('450332', '450332', '恭城瑶族自治县', '450300');
INSERT INTO `x2_cityarea` VALUES ('450401', '450401', '市辖区', '450400');
INSERT INTO `x2_cityarea` VALUES ('450403', '450403', '万秀区', '450400');
INSERT INTO `x2_cityarea` VALUES ('450404', '450404', '蝶山区', '450400');
INSERT INTO `x2_cityarea` VALUES ('450405', '450405', '长洲区', '450400');
INSERT INTO `x2_cityarea` VALUES ('450421', '450421', '苍梧县', '450400');
INSERT INTO `x2_cityarea` VALUES ('450422', '450422', '藤　县', '450400');
INSERT INTO `x2_cityarea` VALUES ('450423', '450423', '蒙山县', '450400');
INSERT INTO `x2_cityarea` VALUES ('450481', '450481', '岑溪市', '450400');
INSERT INTO `x2_cityarea` VALUES ('450501', '450501', '市辖区', '450500');
INSERT INTO `x2_cityarea` VALUES ('450502', '450502', '海城区', '450500');
INSERT INTO `x2_cityarea` VALUES ('450503', '450503', '银海区', '450500');
INSERT INTO `x2_cityarea` VALUES ('450512', '450512', '铁山港区', '450500');
INSERT INTO `x2_cityarea` VALUES ('450521', '450521', '合浦县', '450500');
INSERT INTO `x2_cityarea` VALUES ('450601', '450601', '市辖区', '450600');
INSERT INTO `x2_cityarea` VALUES ('450602', '450602', '港口区', '450600');
INSERT INTO `x2_cityarea` VALUES ('450603', '450603', '防城区', '450600');
INSERT INTO `x2_cityarea` VALUES ('450621', '450621', '上思县', '450600');
INSERT INTO `x2_cityarea` VALUES ('450681', '450681', '东兴市', '450600');
INSERT INTO `x2_cityarea` VALUES ('450701', '450701', '市辖区', '450700');
INSERT INTO `x2_cityarea` VALUES ('450702', '450702', '钦南区', '450700');
INSERT INTO `x2_cityarea` VALUES ('450703', '450703', '钦北区', '450700');
INSERT INTO `x2_cityarea` VALUES ('450721', '450721', '灵山县', '450700');
INSERT INTO `x2_cityarea` VALUES ('450722', '450722', '浦北县', '450700');
INSERT INTO `x2_cityarea` VALUES ('450801', '450801', '市辖区', '450800');
INSERT INTO `x2_cityarea` VALUES ('450802', '450802', '港北区', '450800');
INSERT INTO `x2_cityarea` VALUES ('450803', '450803', '港南区', '450800');
INSERT INTO `x2_cityarea` VALUES ('450804', '450804', '覃塘区', '450800');
INSERT INTO `x2_cityarea` VALUES ('450821', '450821', '平南县', '450800');
INSERT INTO `x2_cityarea` VALUES ('450881', '450881', '桂平市', '450800');
INSERT INTO `x2_cityarea` VALUES ('450901', '450901', '市辖区', '450900');
INSERT INTO `x2_cityarea` VALUES ('450902', '450902', '玉州区', '450900');
INSERT INTO `x2_cityarea` VALUES ('450921', '450921', '容　县', '450900');
INSERT INTO `x2_cityarea` VALUES ('450922', '450922', '陆川县', '450900');
INSERT INTO `x2_cityarea` VALUES ('450923', '450923', '博白县', '450900');
INSERT INTO `x2_cityarea` VALUES ('450924', '450924', '兴业县', '450900');
INSERT INTO `x2_cityarea` VALUES ('450981', '450981', '北流市', '450900');
INSERT INTO `x2_cityarea` VALUES ('451001', '451001', '市辖区', '451000');
INSERT INTO `x2_cityarea` VALUES ('451002', '451002', '右江区', '451000');
INSERT INTO `x2_cityarea` VALUES ('451021', '451021', '田阳县', '451000');
INSERT INTO `x2_cityarea` VALUES ('451022', '451022', '田东县', '451000');
INSERT INTO `x2_cityarea` VALUES ('451023', '451023', '平果县', '451000');
INSERT INTO `x2_cityarea` VALUES ('451024', '451024', '德保县', '451000');
INSERT INTO `x2_cityarea` VALUES ('451025', '451025', '靖西县', '451000');
INSERT INTO `x2_cityarea` VALUES ('451026', '451026', '那坡县', '451000');
INSERT INTO `x2_cityarea` VALUES ('451027', '451027', '凌云县', '451000');
INSERT INTO `x2_cityarea` VALUES ('451028', '451028', '乐业县', '451000');
INSERT INTO `x2_cityarea` VALUES ('451029', '451029', '田林县', '451000');
INSERT INTO `x2_cityarea` VALUES ('451030', '451030', '西林县', '451000');
INSERT INTO `x2_cityarea` VALUES ('451031', '451031', '隆林各族自治县', '451000');
INSERT INTO `x2_cityarea` VALUES ('451101', '451101', '市辖区', '451100');
INSERT INTO `x2_cityarea` VALUES ('451102', '451102', '八步区', '451100');
INSERT INTO `x2_cityarea` VALUES ('451121', '451121', '昭平县', '451100');
INSERT INTO `x2_cityarea` VALUES ('451122', '451122', '钟山县', '451100');
INSERT INTO `x2_cityarea` VALUES ('451123', '451123', '富川瑶族自治县', '451100');
INSERT INTO `x2_cityarea` VALUES ('451201', '451201', '市辖区', '451200');
INSERT INTO `x2_cityarea` VALUES ('451202', '451202', '金城江区', '451200');
INSERT INTO `x2_cityarea` VALUES ('451221', '451221', '南丹县', '451200');
INSERT INTO `x2_cityarea` VALUES ('451222', '451222', '天峨县', '451200');
INSERT INTO `x2_cityarea` VALUES ('451223', '451223', '凤山县', '451200');
INSERT INTO `x2_cityarea` VALUES ('451224', '451224', '东兰县', '451200');
INSERT INTO `x2_cityarea` VALUES ('451225', '451225', '罗城仫佬族自治县', '451200');
INSERT INTO `x2_cityarea` VALUES ('451226', '451226', '环江毛南族自治县', '451200');
INSERT INTO `x2_cityarea` VALUES ('451227', '451227', '巴马瑶族自治县', '451200');
INSERT INTO `x2_cityarea` VALUES ('451228', '451228', '都安瑶族自治县', '451200');
INSERT INTO `x2_cityarea` VALUES ('451229', '451229', '大化瑶族自治县', '451200');
INSERT INTO `x2_cityarea` VALUES ('451281', '451281', '宜州市', '451200');
INSERT INTO `x2_cityarea` VALUES ('451301', '451301', '市辖区', '451300');
INSERT INTO `x2_cityarea` VALUES ('451302', '451302', '兴宾区', '451300');
INSERT INTO `x2_cityarea` VALUES ('451321', '451321', '忻城县', '451300');
INSERT INTO `x2_cityarea` VALUES ('451322', '451322', '象州县', '451300');
INSERT INTO `x2_cityarea` VALUES ('451323', '451323', '武宣县', '451300');
INSERT INTO `x2_cityarea` VALUES ('451324', '451324', '金秀瑶族自治县', '451300');
INSERT INTO `x2_cityarea` VALUES ('451381', '451381', '合山市', '451300');
INSERT INTO `x2_cityarea` VALUES ('451401', '451401', '市辖区', '451400');
INSERT INTO `x2_cityarea` VALUES ('451402', '451402', '江洲区', '451400');
INSERT INTO `x2_cityarea` VALUES ('451421', '451421', '扶绥县', '451400');
INSERT INTO `x2_cityarea` VALUES ('451422', '451422', '宁明县', '451400');
INSERT INTO `x2_cityarea` VALUES ('451423', '451423', '龙州县', '451400');
INSERT INTO `x2_cityarea` VALUES ('451424', '451424', '大新县', '451400');
INSERT INTO `x2_cityarea` VALUES ('451425', '451425', '天等县', '451400');
INSERT INTO `x2_cityarea` VALUES ('451481', '451481', '凭祥市', '451400');
INSERT INTO `x2_cityarea` VALUES ('460101', '460101', '市辖区', '460100');
INSERT INTO `x2_cityarea` VALUES ('460105', '460105', '秀英区', '460100');
INSERT INTO `x2_cityarea` VALUES ('460106', '460106', '龙华区', '460100');
INSERT INTO `x2_cityarea` VALUES ('460107', '460107', '琼山区', '460100');
INSERT INTO `x2_cityarea` VALUES ('460108', '460108', '美兰区', '460100');
INSERT INTO `x2_cityarea` VALUES ('460201', '460201', '市辖区', '460200');
INSERT INTO `x2_cityarea` VALUES ('469001', '469001', '五指山市', '469000');
INSERT INTO `x2_cityarea` VALUES ('469002', '469002', '琼海市', '469000');
INSERT INTO `x2_cityarea` VALUES ('469003', '469003', '儋州市', '469000');
INSERT INTO `x2_cityarea` VALUES ('469005', '469005', '文昌市', '469000');
INSERT INTO `x2_cityarea` VALUES ('469006', '469006', '万宁市', '469000');
INSERT INTO `x2_cityarea` VALUES ('469007', '469007', '东方市', '469000');
INSERT INTO `x2_cityarea` VALUES ('469025', '469025', '定安县', '469000');
INSERT INTO `x2_cityarea` VALUES ('469026', '469026', '屯昌县', '469000');
INSERT INTO `x2_cityarea` VALUES ('469027', '469027', '澄迈县', '469000');
INSERT INTO `x2_cityarea` VALUES ('469028', '469028', '临高县', '469000');
INSERT INTO `x2_cityarea` VALUES ('469030', '469030', '白沙黎族自治县', '469000');
INSERT INTO `x2_cityarea` VALUES ('469031', '469031', '昌江黎族自治县', '469000');
INSERT INTO `x2_cityarea` VALUES ('469033', '469033', '乐东黎族自治县', '469000');
INSERT INTO `x2_cityarea` VALUES ('469034', '469034', '陵水黎族自治县', '469000');
INSERT INTO `x2_cityarea` VALUES ('469035', '469035', '保亭黎族苗族自治县', '469000');
INSERT INTO `x2_cityarea` VALUES ('469036', '469036', '琼中黎族苗族自治县', '469000');
INSERT INTO `x2_cityarea` VALUES ('469037', '469037', '西沙群岛', '469000');
INSERT INTO `x2_cityarea` VALUES ('469038', '469038', '南沙群岛', '469000');
INSERT INTO `x2_cityarea` VALUES ('469039', '469039', '中沙群岛的岛礁及其海域', '469000');
INSERT INTO `x2_cityarea` VALUES ('500101', '500101', '万州区', '500100');
INSERT INTO `x2_cityarea` VALUES ('500102', '500102', '涪陵区', '500100');
INSERT INTO `x2_cityarea` VALUES ('500103', '500103', '渝中区', '500100');
INSERT INTO `x2_cityarea` VALUES ('500104', '500104', '大渡口区', '500100');
INSERT INTO `x2_cityarea` VALUES ('500105', '500105', '江北区', '500100');
INSERT INTO `x2_cityarea` VALUES ('500106', '500106', '沙坪坝区', '500100');
INSERT INTO `x2_cityarea` VALUES ('500107', '500107', '九龙坡区', '500100');
INSERT INTO `x2_cityarea` VALUES ('500108', '500108', '南岸区', '500100');
INSERT INTO `x2_cityarea` VALUES ('500109', '500109', '北碚区', '500100');
INSERT INTO `x2_cityarea` VALUES ('500110', '500110', '万盛区', '500100');
INSERT INTO `x2_cityarea` VALUES ('500111', '500111', '双桥区', '500100');
INSERT INTO `x2_cityarea` VALUES ('500112', '500112', '渝北区', '500100');
INSERT INTO `x2_cityarea` VALUES ('500113', '500113', '巴南区', '500100');
INSERT INTO `x2_cityarea` VALUES ('500114', '500114', '黔江区', '500100');
INSERT INTO `x2_cityarea` VALUES ('500115', '500115', '长寿区', '500100');
INSERT INTO `x2_cityarea` VALUES ('500222', '500222', '綦江县', '500200');
INSERT INTO `x2_cityarea` VALUES ('500223', '500223', '潼南县', '500200');
INSERT INTO `x2_cityarea` VALUES ('500224', '500224', '铜梁县', '500200');
INSERT INTO `x2_cityarea` VALUES ('500225', '500225', '大足县', '500200');
INSERT INTO `x2_cityarea` VALUES ('500226', '500226', '荣昌县', '500200');
INSERT INTO `x2_cityarea` VALUES ('500227', '500227', '璧山县', '500200');
INSERT INTO `x2_cityarea` VALUES ('500228', '500228', '梁平县', '500200');
INSERT INTO `x2_cityarea` VALUES ('500229', '500229', '城口县', '500200');
INSERT INTO `x2_cityarea` VALUES ('500230', '500230', '丰都县', '500200');
INSERT INTO `x2_cityarea` VALUES ('500231', '500231', '垫江县', '500200');
INSERT INTO `x2_cityarea` VALUES ('500232', '500232', '武隆县', '500200');
INSERT INTO `x2_cityarea` VALUES ('500233', '500233', '忠　县', '500200');
INSERT INTO `x2_cityarea` VALUES ('500234', '500234', '开　县', '500200');
INSERT INTO `x2_cityarea` VALUES ('500235', '500235', '云阳县', '500200');
INSERT INTO `x2_cityarea` VALUES ('500236', '500236', '奉节县', '500200');
INSERT INTO `x2_cityarea` VALUES ('500237', '500237', '巫山县', '500200');
INSERT INTO `x2_cityarea` VALUES ('500238', '500238', '巫溪县', '500200');
INSERT INTO `x2_cityarea` VALUES ('500240', '500240', '石柱土家族自治县', '500200');
INSERT INTO `x2_cityarea` VALUES ('500241', '500241', '秀山土家族苗族自治县', '500200');
INSERT INTO `x2_cityarea` VALUES ('500242', '500242', '酉阳土家族苗族自治县', '500200');
INSERT INTO `x2_cityarea` VALUES ('500243', '500243', '彭水苗族土家族自治县', '500200');
INSERT INTO `x2_cityarea` VALUES ('500116', '500381', '江津市', '500300');
INSERT INTO `x2_cityarea` VALUES ('500117', '500382', '合川市', '500300');
INSERT INTO `x2_cityarea` VALUES ('500118', '500383', '永川市', '500300');
INSERT INTO `x2_cityarea` VALUES ('500119', '500384', '南川市', '500300');
INSERT INTO `x2_cityarea` VALUES ('510101', '510101', '市辖区', '510100');
INSERT INTO `x2_cityarea` VALUES ('510104', '510104', '锦江区', '510100');
INSERT INTO `x2_cityarea` VALUES ('510105', '510105', '青羊区', '510100');
INSERT INTO `x2_cityarea` VALUES ('510106', '510106', '金牛区', '510100');
INSERT INTO `x2_cityarea` VALUES ('510107', '510107', '武侯区', '510100');
INSERT INTO `x2_cityarea` VALUES ('510108', '510108', '成华区', '510100');
INSERT INTO `x2_cityarea` VALUES ('510112', '510112', '龙泉驿区', '510100');
INSERT INTO `x2_cityarea` VALUES ('510113', '510113', '青白江区', '510100');
INSERT INTO `x2_cityarea` VALUES ('510114', '510114', '新都区', '510100');
INSERT INTO `x2_cityarea` VALUES ('510115', '510115', '温江区', '510100');
INSERT INTO `x2_cityarea` VALUES ('510121', '510121', '金堂县', '510100');
INSERT INTO `x2_cityarea` VALUES ('510122', '510122', '双流县', '510100');
INSERT INTO `x2_cityarea` VALUES ('510124', '510124', '郫　县', '510100');
INSERT INTO `x2_cityarea` VALUES ('510129', '510129', '大邑县', '510100');
INSERT INTO `x2_cityarea` VALUES ('510131', '510131', '蒲江县', '510100');
INSERT INTO `x2_cityarea` VALUES ('510132', '510132', '新津县', '510100');
INSERT INTO `x2_cityarea` VALUES ('510181', '510181', '都江堰市', '510100');
INSERT INTO `x2_cityarea` VALUES ('510182', '510182', '彭州市', '510100');
INSERT INTO `x2_cityarea` VALUES ('510183', '510183', '邛崃市', '510100');
INSERT INTO `x2_cityarea` VALUES ('510184', '510184', '崇州市', '510100');
INSERT INTO `x2_cityarea` VALUES ('510301', '510301', '市辖区', '510300');
INSERT INTO `x2_cityarea` VALUES ('510302', '510302', '自流井区', '510300');
INSERT INTO `x2_cityarea` VALUES ('510303', '510303', '贡井区', '510300');
INSERT INTO `x2_cityarea` VALUES ('510304', '510304', '大安区', '510300');
INSERT INTO `x2_cityarea` VALUES ('510311', '510311', '沿滩区', '510300');
INSERT INTO `x2_cityarea` VALUES ('510321', '510321', '荣　县', '510300');
INSERT INTO `x2_cityarea` VALUES ('510322', '510322', '富顺县', '510300');
INSERT INTO `x2_cityarea` VALUES ('510401', '510401', '市辖区', '510400');
INSERT INTO `x2_cityarea` VALUES ('510402', '510402', '东　区', '510400');
INSERT INTO `x2_cityarea` VALUES ('510403', '510403', '西　区', '510400');
INSERT INTO `x2_cityarea` VALUES ('510411', '510411', '仁和区', '510400');
INSERT INTO `x2_cityarea` VALUES ('510421', '510421', '米易县', '510400');
INSERT INTO `x2_cityarea` VALUES ('510422', '510422', '盐边县', '510400');
INSERT INTO `x2_cityarea` VALUES ('510501', '510501', '市辖区', '510500');
INSERT INTO `x2_cityarea` VALUES ('510502', '510502', '江阳区', '510500');
INSERT INTO `x2_cityarea` VALUES ('510503', '510503', '纳溪区', '510500');
INSERT INTO `x2_cityarea` VALUES ('510504', '510504', '龙马潭区', '510500');
INSERT INTO `x2_cityarea` VALUES ('510521', '510521', '泸　县', '510500');
INSERT INTO `x2_cityarea` VALUES ('510522', '510522', '合江县', '510500');
INSERT INTO `x2_cityarea` VALUES ('510524', '510524', '叙永县', '510500');
INSERT INTO `x2_cityarea` VALUES ('510525', '510525', '古蔺县', '510500');
INSERT INTO `x2_cityarea` VALUES ('510601', '510601', '市辖区', '510600');
INSERT INTO `x2_cityarea` VALUES ('510603', '510603', '旌阳区', '510600');
INSERT INTO `x2_cityarea` VALUES ('510623', '510623', '中江县', '510600');
INSERT INTO `x2_cityarea` VALUES ('510626', '510626', '罗江县', '510600');
INSERT INTO `x2_cityarea` VALUES ('510681', '510681', '广汉市', '510600');
INSERT INTO `x2_cityarea` VALUES ('510682', '510682', '什邡市', '510600');
INSERT INTO `x2_cityarea` VALUES ('510683', '510683', '绵竹市', '510600');
INSERT INTO `x2_cityarea` VALUES ('510701', '510701', '市辖区', '510700');
INSERT INTO `x2_cityarea` VALUES ('510703', '510703', '涪城区', '510700');
INSERT INTO `x2_cityarea` VALUES ('510704', '510704', '游仙区', '510700');
INSERT INTO `x2_cityarea` VALUES ('510722', '510722', '三台县', '510700');
INSERT INTO `x2_cityarea` VALUES ('510723', '510723', '盐亭县', '510700');
INSERT INTO `x2_cityarea` VALUES ('510724', '510724', '安　县', '510700');
INSERT INTO `x2_cityarea` VALUES ('510725', '510725', '梓潼县', '510700');
INSERT INTO `x2_cityarea` VALUES ('510726', '510726', '北川羌族自治县', '510700');
INSERT INTO `x2_cityarea` VALUES ('510727', '510727', '平武县', '510700');
INSERT INTO `x2_cityarea` VALUES ('510781', '510781', '江油市', '510700');
INSERT INTO `x2_cityarea` VALUES ('510801', '510801', '市辖区', '510800');
INSERT INTO `x2_cityarea` VALUES ('510802', '510802', '市中区', '510800');
INSERT INTO `x2_cityarea` VALUES ('510811', '510811', '元坝区', '510800');
INSERT INTO `x2_cityarea` VALUES ('510812', '510812', '朝天区', '510800');
INSERT INTO `x2_cityarea` VALUES ('510821', '510821', '旺苍县', '510800');
INSERT INTO `x2_cityarea` VALUES ('510822', '510822', '青川县', '510800');
INSERT INTO `x2_cityarea` VALUES ('510823', '510823', '剑阁县', '510800');
INSERT INTO `x2_cityarea` VALUES ('510824', '510824', '苍溪县', '510800');
INSERT INTO `x2_cityarea` VALUES ('510901', '510901', '市辖区', '510900');
INSERT INTO `x2_cityarea` VALUES ('510903', '510903', '船山区', '510900');
INSERT INTO `x2_cityarea` VALUES ('510904', '510904', '安居区', '510900');
INSERT INTO `x2_cityarea` VALUES ('510921', '510921', '蓬溪县', '510900');
INSERT INTO `x2_cityarea` VALUES ('510922', '510922', '射洪县', '510900');
INSERT INTO `x2_cityarea` VALUES ('510923', '510923', '大英县', '510900');
INSERT INTO `x2_cityarea` VALUES ('511001', '511001', '市辖区', '511000');
INSERT INTO `x2_cityarea` VALUES ('511002', '511002', '市中区', '511000');
INSERT INTO `x2_cityarea` VALUES ('511011', '511011', '东兴区', '511000');
INSERT INTO `x2_cityarea` VALUES ('511024', '511024', '威远县', '511000');
INSERT INTO `x2_cityarea` VALUES ('511025', '511025', '资中县', '511000');
INSERT INTO `x2_cityarea` VALUES ('511028', '511028', '隆昌县', '511000');
INSERT INTO `x2_cityarea` VALUES ('511101', '511101', '市辖区', '511100');
INSERT INTO `x2_cityarea` VALUES ('511102', '511102', '市中区', '511100');
INSERT INTO `x2_cityarea` VALUES ('511111', '511111', '沙湾区', '511100');
INSERT INTO `x2_cityarea` VALUES ('511112', '511112', '五通桥区', '511100');
INSERT INTO `x2_cityarea` VALUES ('511113', '511113', '金口河区', '511100');
INSERT INTO `x2_cityarea` VALUES ('511123', '511123', '犍为县', '511100');
INSERT INTO `x2_cityarea` VALUES ('511124', '511124', '井研县', '511100');
INSERT INTO `x2_cityarea` VALUES ('511126', '511126', '夹江县', '511100');
INSERT INTO `x2_cityarea` VALUES ('511129', '511129', '沐川县', '511100');
INSERT INTO `x2_cityarea` VALUES ('511132', '511132', '峨边彝族自治县', '511100');
INSERT INTO `x2_cityarea` VALUES ('511133', '511133', '马边彝族自治县', '511100');
INSERT INTO `x2_cityarea` VALUES ('511181', '511181', '峨眉山市', '511100');
INSERT INTO `x2_cityarea` VALUES ('511301', '511301', '市辖区', '511300');
INSERT INTO `x2_cityarea` VALUES ('511302', '511302', '顺庆区', '511300');
INSERT INTO `x2_cityarea` VALUES ('511303', '511303', '高坪区', '511300');
INSERT INTO `x2_cityarea` VALUES ('511304', '511304', '嘉陵区', '511300');
INSERT INTO `x2_cityarea` VALUES ('511321', '511321', '南部县', '511300');
INSERT INTO `x2_cityarea` VALUES ('511322', '511322', '营山县', '511300');
INSERT INTO `x2_cityarea` VALUES ('511323', '511323', '蓬安县', '511300');
INSERT INTO `x2_cityarea` VALUES ('511324', '511324', '仪陇县', '511300');
INSERT INTO `x2_cityarea` VALUES ('511325', '511325', '西充县', '511300');
INSERT INTO `x2_cityarea` VALUES ('511381', '511381', '阆中市', '511300');
INSERT INTO `x2_cityarea` VALUES ('511401', '511401', '市辖区', '511400');
INSERT INTO `x2_cityarea` VALUES ('511402', '511402', '东坡区', '511400');
INSERT INTO `x2_cityarea` VALUES ('511421', '511421', '仁寿县', '511400');
INSERT INTO `x2_cityarea` VALUES ('511422', '511422', '彭山县', '511400');
INSERT INTO `x2_cityarea` VALUES ('511423', '511423', '洪雅县', '511400');
INSERT INTO `x2_cityarea` VALUES ('511424', '511424', '丹棱县', '511400');
INSERT INTO `x2_cityarea` VALUES ('511425', '511425', '青神县', '511400');
INSERT INTO `x2_cityarea` VALUES ('511501', '511501', '市辖区', '511500');
INSERT INTO `x2_cityarea` VALUES ('511502', '511502', '翠屏区', '511500');
INSERT INTO `x2_cityarea` VALUES ('511521', '511521', '宜宾县', '511500');
INSERT INTO `x2_cityarea` VALUES ('511522', '511522', '南溪县', '511500');
INSERT INTO `x2_cityarea` VALUES ('511523', '511523', '江安县', '511500');
INSERT INTO `x2_cityarea` VALUES ('511524', '511524', '长宁县', '511500');
INSERT INTO `x2_cityarea` VALUES ('511525', '511525', '高　县', '511500');
INSERT INTO `x2_cityarea` VALUES ('511526', '511526', '珙　县', '511500');
INSERT INTO `x2_cityarea` VALUES ('511527', '511527', '筠连县', '511500');
INSERT INTO `x2_cityarea` VALUES ('511528', '511528', '兴文县', '511500');
INSERT INTO `x2_cityarea` VALUES ('511529', '511529', '屏山县', '511500');
INSERT INTO `x2_cityarea` VALUES ('511601', '511601', '市辖区', '511600');
INSERT INTO `x2_cityarea` VALUES ('511602', '511602', '广安区', '511600');
INSERT INTO `x2_cityarea` VALUES ('511621', '511621', '岳池县', '511600');
INSERT INTO `x2_cityarea` VALUES ('511622', '511622', '武胜县', '511600');
INSERT INTO `x2_cityarea` VALUES ('511623', '511623', '邻水县', '511600');
INSERT INTO `x2_cityarea` VALUES ('511681', '511681', '华莹市', '511600');
INSERT INTO `x2_cityarea` VALUES ('511701', '511701', '市辖区', '511700');
INSERT INTO `x2_cityarea` VALUES ('511702', '511702', '通川区', '511700');
INSERT INTO `x2_cityarea` VALUES ('511721', '511721', '达　县', '511700');
INSERT INTO `x2_cityarea` VALUES ('511722', '511722', '宣汉县', '511700');
INSERT INTO `x2_cityarea` VALUES ('511723', '511723', '开江县', '511700');
INSERT INTO `x2_cityarea` VALUES ('511724', '511724', '大竹县', '511700');
INSERT INTO `x2_cityarea` VALUES ('511725', '511725', '渠　县', '511700');
INSERT INTO `x2_cityarea` VALUES ('511781', '511781', '万源市', '511700');
INSERT INTO `x2_cityarea` VALUES ('511801', '511801', '市辖区', '511800');
INSERT INTO `x2_cityarea` VALUES ('511802', '511802', '雨城区', '511800');
INSERT INTO `x2_cityarea` VALUES ('511821', '511821', '名山县', '511800');
INSERT INTO `x2_cityarea` VALUES ('511822', '511822', '荥经县', '511800');
INSERT INTO `x2_cityarea` VALUES ('511823', '511823', '汉源县', '511800');
INSERT INTO `x2_cityarea` VALUES ('511824', '511824', '石棉县', '511800');
INSERT INTO `x2_cityarea` VALUES ('511825', '511825', '天全县', '511800');
INSERT INTO `x2_cityarea` VALUES ('511826', '511826', '芦山县', '511800');
INSERT INTO `x2_cityarea` VALUES ('511827', '511827', '宝兴县', '511800');
INSERT INTO `x2_cityarea` VALUES ('511901', '511901', '市辖区', '511900');
INSERT INTO `x2_cityarea` VALUES ('511902', '511902', '巴州区', '511900');
INSERT INTO `x2_cityarea` VALUES ('511921', '511921', '通江县', '511900');
INSERT INTO `x2_cityarea` VALUES ('511922', '511922', '南江县', '511900');
INSERT INTO `x2_cityarea` VALUES ('511923', '511923', '平昌县', '511900');
INSERT INTO `x2_cityarea` VALUES ('512001', '512001', '市辖区', '512000');
INSERT INTO `x2_cityarea` VALUES ('512002', '512002', '雁江区', '512000');
INSERT INTO `x2_cityarea` VALUES ('512021', '512021', '安岳县', '512000');
INSERT INTO `x2_cityarea` VALUES ('512022', '512022', '乐至县', '512000');
INSERT INTO `x2_cityarea` VALUES ('512081', '512081', '简阳市', '512000');
INSERT INTO `x2_cityarea` VALUES ('513221', '513221', '汶川县', '513200');
INSERT INTO `x2_cityarea` VALUES ('513222', '513222', '理　县', '513200');
INSERT INTO `x2_cityarea` VALUES ('513223', '513223', '茂　县', '513200');
INSERT INTO `x2_cityarea` VALUES ('513224', '513224', '松潘县', '513200');
INSERT INTO `x2_cityarea` VALUES ('513225', '513225', '九寨沟县', '513200');
INSERT INTO `x2_cityarea` VALUES ('513226', '513226', '金川县', '513200');
INSERT INTO `x2_cityarea` VALUES ('513227', '513227', '小金县', '513200');
INSERT INTO `x2_cityarea` VALUES ('513228', '513228', '黑水县', '513200');
INSERT INTO `x2_cityarea` VALUES ('513229', '513229', '马尔康县', '513200');
INSERT INTO `x2_cityarea` VALUES ('513230', '513230', '壤塘县', '513200');
INSERT INTO `x2_cityarea` VALUES ('513231', '513231', '阿坝县', '513200');
INSERT INTO `x2_cityarea` VALUES ('513232', '513232', '若尔盖县', '513200');
INSERT INTO `x2_cityarea` VALUES ('513233', '513233', '红原县', '513200');
INSERT INTO `x2_cityarea` VALUES ('513321', '513321', '康定县', '513300');
INSERT INTO `x2_cityarea` VALUES ('513322', '513322', '泸定县', '513300');
INSERT INTO `x2_cityarea` VALUES ('513323', '513323', '丹巴县', '513300');
INSERT INTO `x2_cityarea` VALUES ('513324', '513324', '九龙县', '513300');
INSERT INTO `x2_cityarea` VALUES ('513325', '513325', '雅江县', '513300');
INSERT INTO `x2_cityarea` VALUES ('513326', '513326', '道孚县', '513300');
INSERT INTO `x2_cityarea` VALUES ('513327', '513327', '炉霍县', '513300');
INSERT INTO `x2_cityarea` VALUES ('513328', '513328', '甘孜县', '513300');
INSERT INTO `x2_cityarea` VALUES ('513329', '513329', '新龙县', '513300');
INSERT INTO `x2_cityarea` VALUES ('513330', '513330', '德格县', '513300');
INSERT INTO `x2_cityarea` VALUES ('513331', '513331', '白玉县', '513300');
INSERT INTO `x2_cityarea` VALUES ('513332', '513332', '石渠县', '513300');
INSERT INTO `x2_cityarea` VALUES ('513333', '513333', '色达县', '513300');
INSERT INTO `x2_cityarea` VALUES ('513334', '513334', '理塘县', '513300');
INSERT INTO `x2_cityarea` VALUES ('513335', '513335', '巴塘县', '513300');
INSERT INTO `x2_cityarea` VALUES ('513336', '513336', '乡城县', '513300');
INSERT INTO `x2_cityarea` VALUES ('513337', '513337', '稻城县', '513300');
INSERT INTO `x2_cityarea` VALUES ('513338', '513338', '得荣县', '513300');
INSERT INTO `x2_cityarea` VALUES ('513401', '513401', '西昌市', '513400');
INSERT INTO `x2_cityarea` VALUES ('513422', '513422', '木里藏族自治县', '513400');
INSERT INTO `x2_cityarea` VALUES ('513423', '513423', '盐源县', '513400');
INSERT INTO `x2_cityarea` VALUES ('513424', '513424', '德昌县', '513400');
INSERT INTO `x2_cityarea` VALUES ('513425', '513425', '会理县', '513400');
INSERT INTO `x2_cityarea` VALUES ('513426', '513426', '会东县', '513400');
INSERT INTO `x2_cityarea` VALUES ('513427', '513427', '宁南县', '513400');
INSERT INTO `x2_cityarea` VALUES ('513428', '513428', '普格县', '513400');
INSERT INTO `x2_cityarea` VALUES ('513429', '513429', '布拖县', '513400');
INSERT INTO `x2_cityarea` VALUES ('513430', '513430', '金阳县', '513400');
INSERT INTO `x2_cityarea` VALUES ('513431', '513431', '昭觉县', '513400');
INSERT INTO `x2_cityarea` VALUES ('513432', '513432', '喜德县', '513400');
INSERT INTO `x2_cityarea` VALUES ('513433', '513433', '冕宁县', '513400');
INSERT INTO `x2_cityarea` VALUES ('513434', '513434', '越西县', '513400');
INSERT INTO `x2_cityarea` VALUES ('513435', '513435', '甘洛县', '513400');
INSERT INTO `x2_cityarea` VALUES ('513436', '513436', '美姑县', '513400');
INSERT INTO `x2_cityarea` VALUES ('513437', '513437', '雷波县', '513400');
INSERT INTO `x2_cityarea` VALUES ('520101', '520101', '市辖区', '520100');
INSERT INTO `x2_cityarea` VALUES ('520102', '520102', '南明区', '520100');
INSERT INTO `x2_cityarea` VALUES ('520103', '520103', '云岩区', '520100');
INSERT INTO `x2_cityarea` VALUES ('520111', '520111', '花溪区', '520100');
INSERT INTO `x2_cityarea` VALUES ('520112', '520112', '乌当区', '520100');
INSERT INTO `x2_cityarea` VALUES ('520113', '520113', '白云区', '520100');
INSERT INTO `x2_cityarea` VALUES ('520114', '520114', '小河区', '520100');
INSERT INTO `x2_cityarea` VALUES ('520121', '520121', '开阳县', '520100');
INSERT INTO `x2_cityarea` VALUES ('520122', '520122', '息烽县', '520100');
INSERT INTO `x2_cityarea` VALUES ('520123', '520123', '修文县', '520100');
INSERT INTO `x2_cityarea` VALUES ('520181', '520181', '清镇市', '520100');
INSERT INTO `x2_cityarea` VALUES ('520201', '520201', '钟山区', '520200');
INSERT INTO `x2_cityarea` VALUES ('520203', '520203', '六枝特区', '520200');
INSERT INTO `x2_cityarea` VALUES ('520221', '520221', '水城县', '520200');
INSERT INTO `x2_cityarea` VALUES ('520222', '520222', '盘　县', '520200');
INSERT INTO `x2_cityarea` VALUES ('520301', '520301', '市辖区', '520300');
INSERT INTO `x2_cityarea` VALUES ('520302', '520302', '红花岗区', '520300');
INSERT INTO `x2_cityarea` VALUES ('520303', '520303', '汇川区', '520300');
INSERT INTO `x2_cityarea` VALUES ('520321', '520321', '遵义县', '520300');
INSERT INTO `x2_cityarea` VALUES ('520322', '520322', '桐梓县', '520300');
INSERT INTO `x2_cityarea` VALUES ('520323', '520323', '绥阳县', '520300');
INSERT INTO `x2_cityarea` VALUES ('520324', '520324', '正安县', '520300');
INSERT INTO `x2_cityarea` VALUES ('520325', '520325', '道真仡佬族苗族自治县', '520300');
INSERT INTO `x2_cityarea` VALUES ('520326', '520326', '务川仡佬族苗族自治县', '520300');
INSERT INTO `x2_cityarea` VALUES ('520327', '520327', '凤冈县', '520300');
INSERT INTO `x2_cityarea` VALUES ('520328', '520328', '湄潭县', '520300');
INSERT INTO `x2_cityarea` VALUES ('520329', '520329', '余庆县', '520300');
INSERT INTO `x2_cityarea` VALUES ('520330', '520330', '习水县', '520300');
INSERT INTO `x2_cityarea` VALUES ('520381', '520381', '赤水市', '520300');
INSERT INTO `x2_cityarea` VALUES ('520382', '520382', '仁怀市', '520300');
INSERT INTO `x2_cityarea` VALUES ('520401', '520401', '市辖区', '520400');
INSERT INTO `x2_cityarea` VALUES ('520402', '520402', '西秀区', '520400');
INSERT INTO `x2_cityarea` VALUES ('520421', '520421', '平坝县', '520400');
INSERT INTO `x2_cityarea` VALUES ('520422', '520422', '普定县', '520400');
INSERT INTO `x2_cityarea` VALUES ('520423', '520423', '镇宁布依族苗族自治县', '520400');
INSERT INTO `x2_cityarea` VALUES ('520424', '520424', '关岭布依族苗族自治县', '520400');
INSERT INTO `x2_cityarea` VALUES ('520425', '520425', '紫云苗族布依族自治县', '520400');
INSERT INTO `x2_cityarea` VALUES ('522201', '522201', '铜仁市', '522200');
INSERT INTO `x2_cityarea` VALUES ('522222', '522222', '江口县', '522200');
INSERT INTO `x2_cityarea` VALUES ('522223', '522223', '玉屏侗族自治县', '522200');
INSERT INTO `x2_cityarea` VALUES ('522224', '522224', '石阡县', '522200');
INSERT INTO `x2_cityarea` VALUES ('522225', '522225', '思南县', '522200');
INSERT INTO `x2_cityarea` VALUES ('522226', '522226', '印江土家族苗族自治县', '522200');
INSERT INTO `x2_cityarea` VALUES ('522227', '522227', '德江县', '522200');
INSERT INTO `x2_cityarea` VALUES ('522228', '522228', '沿河土家族自治县', '522200');
INSERT INTO `x2_cityarea` VALUES ('522229', '522229', '松桃苗族自治县', '522200');
INSERT INTO `x2_cityarea` VALUES ('522230', '522230', '万山特区', '522200');
INSERT INTO `x2_cityarea` VALUES ('522301', '522301', '兴义市', '522300');
INSERT INTO `x2_cityarea` VALUES ('522322', '522322', '兴仁县', '522300');
INSERT INTO `x2_cityarea` VALUES ('522323', '522323', '普安县', '522300');
INSERT INTO `x2_cityarea` VALUES ('522324', '522324', '晴隆县', '522300');
INSERT INTO `x2_cityarea` VALUES ('522325', '522325', '贞丰县', '522300');
INSERT INTO `x2_cityarea` VALUES ('522326', '522326', '望谟县', '522300');
INSERT INTO `x2_cityarea` VALUES ('522327', '522327', '册亨县', '522300');
INSERT INTO `x2_cityarea` VALUES ('522328', '522328', '安龙县', '522300');
INSERT INTO `x2_cityarea` VALUES ('522401', '522401', '毕节市', '522400');
INSERT INTO `x2_cityarea` VALUES ('522422', '522422', '大方县', '522400');
INSERT INTO `x2_cityarea` VALUES ('522423', '522423', '黔西县', '522400');
INSERT INTO `x2_cityarea` VALUES ('522424', '522424', '金沙县', '522400');
INSERT INTO `x2_cityarea` VALUES ('522425', '522425', '织金县', '522400');
INSERT INTO `x2_cityarea` VALUES ('522426', '522426', '纳雍县', '522400');
INSERT INTO `x2_cityarea` VALUES ('522427', '522427', '威宁彝族回族苗族自治县', '522400');
INSERT INTO `x2_cityarea` VALUES ('522428', '522428', '赫章县', '522400');
INSERT INTO `x2_cityarea` VALUES ('522601', '522601', '凯里市', '522600');
INSERT INTO `x2_cityarea` VALUES ('522622', '522622', '黄平县', '522600');
INSERT INTO `x2_cityarea` VALUES ('522623', '522623', '施秉县', '522600');
INSERT INTO `x2_cityarea` VALUES ('522624', '522624', '三穗县', '522600');
INSERT INTO `x2_cityarea` VALUES ('522625', '522625', '镇远县', '522600');
INSERT INTO `x2_cityarea` VALUES ('522626', '522626', '岑巩县', '522600');
INSERT INTO `x2_cityarea` VALUES ('522627', '522627', '天柱县', '522600');
INSERT INTO `x2_cityarea` VALUES ('522628', '522628', '锦屏县', '522600');
INSERT INTO `x2_cityarea` VALUES ('522629', '522629', '剑河县', '522600');
INSERT INTO `x2_cityarea` VALUES ('522630', '522630', '台江县', '522600');
INSERT INTO `x2_cityarea` VALUES ('522631', '522631', '黎平县', '522600');
INSERT INTO `x2_cityarea` VALUES ('522632', '522632', '榕江县', '522600');
INSERT INTO `x2_cityarea` VALUES ('522633', '522633', '从江县', '522600');
INSERT INTO `x2_cityarea` VALUES ('522634', '522634', '雷山县', '522600');
INSERT INTO `x2_cityarea` VALUES ('522635', '522635', '麻江县', '522600');
INSERT INTO `x2_cityarea` VALUES ('522636', '522636', '丹寨县', '522600');
INSERT INTO `x2_cityarea` VALUES ('522701', '522701', '都匀市', '522700');
INSERT INTO `x2_cityarea` VALUES ('522702', '522702', '福泉市', '522700');
INSERT INTO `x2_cityarea` VALUES ('522722', '522722', '荔波县', '522700');
INSERT INTO `x2_cityarea` VALUES ('522723', '522723', '贵定县', '522700');
INSERT INTO `x2_cityarea` VALUES ('522725', '522725', '瓮安县', '522700');
INSERT INTO `x2_cityarea` VALUES ('522726', '522726', '独山县', '522700');
INSERT INTO `x2_cityarea` VALUES ('522727', '522727', '平塘县', '522700');
INSERT INTO `x2_cityarea` VALUES ('522728', '522728', '罗甸县', '522700');
INSERT INTO `x2_cityarea` VALUES ('522729', '522729', '长顺县', '522700');
INSERT INTO `x2_cityarea` VALUES ('522730', '522730', '龙里县', '522700');
INSERT INTO `x2_cityarea` VALUES ('522731', '522731', '惠水县', '522700');
INSERT INTO `x2_cityarea` VALUES ('522732', '522732', '三都水族自治县', '522700');
INSERT INTO `x2_cityarea` VALUES ('530101', '530101', '市辖区', '530100');
INSERT INTO `x2_cityarea` VALUES ('530102', '530102', '五华区', '530100');
INSERT INTO `x2_cityarea` VALUES ('530103', '530103', '盘龙区', '530100');
INSERT INTO `x2_cityarea` VALUES ('530111', '530111', '官渡区', '530100');
INSERT INTO `x2_cityarea` VALUES ('530112', '530112', '西山区', '530100');
INSERT INTO `x2_cityarea` VALUES ('530113', '530113', '东川区', '530100');
INSERT INTO `x2_cityarea` VALUES ('530121', '530121', '呈贡县', '530100');
INSERT INTO `x2_cityarea` VALUES ('530122', '530122', '晋宁县', '530100');
INSERT INTO `x2_cityarea` VALUES ('530124', '530124', '富民县', '530100');
INSERT INTO `x2_cityarea` VALUES ('530125', '530125', '宜良县', '530100');
INSERT INTO `x2_cityarea` VALUES ('530126', '530126', '石林彝族自治县', '530100');
INSERT INTO `x2_cityarea` VALUES ('530127', '530127', '嵩明县', '530100');
INSERT INTO `x2_cityarea` VALUES ('530128', '530128', '禄劝彝族苗族自治县', '530100');
INSERT INTO `x2_cityarea` VALUES ('530129', '530129', '寻甸回族彝族自治县', '530100');
INSERT INTO `x2_cityarea` VALUES ('530181', '530181', '安宁市', '530100');
INSERT INTO `x2_cityarea` VALUES ('530301', '530301', '市辖区', '530300');
INSERT INTO `x2_cityarea` VALUES ('530302', '530302', '麒麟区', '530300');
INSERT INTO `x2_cityarea` VALUES ('530321', '530321', '马龙县', '530300');
INSERT INTO `x2_cityarea` VALUES ('530322', '530322', '陆良县', '530300');
INSERT INTO `x2_cityarea` VALUES ('530323', '530323', '师宗县', '530300');
INSERT INTO `x2_cityarea` VALUES ('530324', '530324', '罗平县', '530300');
INSERT INTO `x2_cityarea` VALUES ('530325', '530325', '富源县', '530300');
INSERT INTO `x2_cityarea` VALUES ('530326', '530326', '会泽县', '530300');
INSERT INTO `x2_cityarea` VALUES ('530328', '530328', '沾益县', '530300');
INSERT INTO `x2_cityarea` VALUES ('530381', '530381', '宣威市', '530300');
INSERT INTO `x2_cityarea` VALUES ('530401', '530401', '市辖区', '530400');
INSERT INTO `x2_cityarea` VALUES ('530402', '530402', '红塔区', '530400');
INSERT INTO `x2_cityarea` VALUES ('530421', '530421', '江川县', '530400');
INSERT INTO `x2_cityarea` VALUES ('530422', '530422', '澄江县', '530400');
INSERT INTO `x2_cityarea` VALUES ('530423', '530423', '通海县', '530400');
INSERT INTO `x2_cityarea` VALUES ('530424', '530424', '华宁县', '530400');
INSERT INTO `x2_cityarea` VALUES ('530425', '530425', '易门县', '530400');
INSERT INTO `x2_cityarea` VALUES ('530426', '530426', '峨山彝族自治县', '530400');
INSERT INTO `x2_cityarea` VALUES ('530427', '530427', '新平彝族傣族自治县', '530400');
INSERT INTO `x2_cityarea` VALUES ('530428', '530428', '元江哈尼族彝族傣族自治县', '530400');
INSERT INTO `x2_cityarea` VALUES ('530501', '530501', '市辖区', '530500');
INSERT INTO `x2_cityarea` VALUES ('530502', '530502', '隆阳区', '530500');
INSERT INTO `x2_cityarea` VALUES ('530521', '530521', '施甸县', '530500');
INSERT INTO `x2_cityarea` VALUES ('530522', '530522', '腾冲县', '530500');
INSERT INTO `x2_cityarea` VALUES ('530523', '530523', '龙陵县', '530500');
INSERT INTO `x2_cityarea` VALUES ('530524', '530524', '昌宁县', '530500');
INSERT INTO `x2_cityarea` VALUES ('530601', '530601', '市辖区', '530600');
INSERT INTO `x2_cityarea` VALUES ('530602', '530602', '昭阳区', '530600');
INSERT INTO `x2_cityarea` VALUES ('530621', '530621', '鲁甸县', '530600');
INSERT INTO `x2_cityarea` VALUES ('530622', '530622', '巧家县', '530600');
INSERT INTO `x2_cityarea` VALUES ('530623', '530623', '盐津县', '530600');
INSERT INTO `x2_cityarea` VALUES ('530624', '530624', '大关县', '530600');
INSERT INTO `x2_cityarea` VALUES ('530625', '530625', '永善县', '530600');
INSERT INTO `x2_cityarea` VALUES ('530626', '530626', '绥江县', '530600');
INSERT INTO `x2_cityarea` VALUES ('530627', '530627', '镇雄县', '530600');
INSERT INTO `x2_cityarea` VALUES ('530628', '530628', '彝良县', '530600');
INSERT INTO `x2_cityarea` VALUES ('530629', '530629', '威信县', '530600');
INSERT INTO `x2_cityarea` VALUES ('530630', '530630', '水富县', '530600');
INSERT INTO `x2_cityarea` VALUES ('530701', '530701', '市辖区', '530700');
INSERT INTO `x2_cityarea` VALUES ('530702', '530702', '古城区', '530700');
INSERT INTO `x2_cityarea` VALUES ('530721', '530721', '玉龙纳西族自治县', '530700');
INSERT INTO `x2_cityarea` VALUES ('530722', '530722', '永胜县', '530700');
INSERT INTO `x2_cityarea` VALUES ('530723', '530723', '华坪县', '530700');
INSERT INTO `x2_cityarea` VALUES ('530724', '530724', '宁蒗彝族自治县', '530700');
INSERT INTO `x2_cityarea` VALUES ('530801', '530801', '市辖区', '530800');
INSERT INTO `x2_cityarea` VALUES ('530802', '530802', '翠云区', '530800');
INSERT INTO `x2_cityarea` VALUES ('530821', '530821', '普洱哈尼族彝族自治县', '530800');
INSERT INTO `x2_cityarea` VALUES ('530822', '530822', '墨江哈尼族自治县', '530800');
INSERT INTO `x2_cityarea` VALUES ('530823', '530823', '景东彝族自治县', '530800');
INSERT INTO `x2_cityarea` VALUES ('530824', '530824', '景谷傣族彝族自治县', '530800');
INSERT INTO `x2_cityarea` VALUES ('530825', '530825', '镇沅彝族哈尼族拉祜族自治县', '530800');
INSERT INTO `x2_cityarea` VALUES ('530826', '530826', '江城哈尼族彝族自治县', '530800');
INSERT INTO `x2_cityarea` VALUES ('530827', '530827', '孟连傣族拉祜族佤族自治县', '530800');
INSERT INTO `x2_cityarea` VALUES ('530828', '530828', '澜沧拉祜族自治县', '530800');
INSERT INTO `x2_cityarea` VALUES ('530829', '530829', '西盟佤族自治县', '530800');
INSERT INTO `x2_cityarea` VALUES ('530901', '530901', '市辖区', '530900');
INSERT INTO `x2_cityarea` VALUES ('530902', '530902', '临翔区', '530900');
INSERT INTO `x2_cityarea` VALUES ('530921', '530921', '凤庆县', '530900');
INSERT INTO `x2_cityarea` VALUES ('530922', '530922', '云　县', '530900');
INSERT INTO `x2_cityarea` VALUES ('530923', '530923', '永德县', '530900');
INSERT INTO `x2_cityarea` VALUES ('530924', '530924', '镇康县', '530900');
INSERT INTO `x2_cityarea` VALUES ('530925', '530925', '双江拉祜族佤族布朗族傣族自治县', '530900');
INSERT INTO `x2_cityarea` VALUES ('530926', '530926', '耿马傣族佤族自治县', '530900');
INSERT INTO `x2_cityarea` VALUES ('530927', '530927', '沧源佤族自治县', '530900');
INSERT INTO `x2_cityarea` VALUES ('532301', '532301', '楚雄市', '532300');
INSERT INTO `x2_cityarea` VALUES ('532322', '532322', '双柏县', '532300');
INSERT INTO `x2_cityarea` VALUES ('532323', '532323', '牟定县', '532300');
INSERT INTO `x2_cityarea` VALUES ('532324', '532324', '南华县', '532300');
INSERT INTO `x2_cityarea` VALUES ('532325', '532325', '姚安县', '532300');
INSERT INTO `x2_cityarea` VALUES ('532326', '532326', '大姚县', '532300');
INSERT INTO `x2_cityarea` VALUES ('532327', '532327', '永仁县', '532300');
INSERT INTO `x2_cityarea` VALUES ('532328', '532328', '元谋县', '532300');
INSERT INTO `x2_cityarea` VALUES ('532329', '532329', '武定县', '532300');
INSERT INTO `x2_cityarea` VALUES ('532331', '532331', '禄丰县', '532300');
INSERT INTO `x2_cityarea` VALUES ('532501', '532501', '个旧市', '532500');
INSERT INTO `x2_cityarea` VALUES ('532502', '532502', '开远市', '532500');
INSERT INTO `x2_cityarea` VALUES ('532522', '532522', '蒙自县', '532500');
INSERT INTO `x2_cityarea` VALUES ('532523', '532523', '屏边苗族自治县', '532500');
INSERT INTO `x2_cityarea` VALUES ('532524', '532524', '建水县', '532500');
INSERT INTO `x2_cityarea` VALUES ('532525', '532525', '石屏县', '532500');
INSERT INTO `x2_cityarea` VALUES ('532526', '532526', '弥勒县', '532500');
INSERT INTO `x2_cityarea` VALUES ('532527', '532527', '泸西县', '532500');
INSERT INTO `x2_cityarea` VALUES ('532528', '532528', '元阳县', '532500');
INSERT INTO `x2_cityarea` VALUES ('532529', '532529', '红河县', '532500');
INSERT INTO `x2_cityarea` VALUES ('532530', '532530', '金平苗族瑶族傣族自治县', '532500');
INSERT INTO `x2_cityarea` VALUES ('532531', '532531', '绿春县', '532500');
INSERT INTO `x2_cityarea` VALUES ('532532', '532532', '河口瑶族自治县', '532500');
INSERT INTO `x2_cityarea` VALUES ('532621', '532621', '文山县', '532600');
INSERT INTO `x2_cityarea` VALUES ('532622', '532622', '砚山县', '532600');
INSERT INTO `x2_cityarea` VALUES ('532623', '532623', '西畴县', '532600');
INSERT INTO `x2_cityarea` VALUES ('532624', '532624', '麻栗坡县', '532600');
INSERT INTO `x2_cityarea` VALUES ('532625', '532625', '马关县', '532600');
INSERT INTO `x2_cityarea` VALUES ('532626', '532626', '丘北县', '532600');
INSERT INTO `x2_cityarea` VALUES ('532627', '532627', '广南县', '532600');
INSERT INTO `x2_cityarea` VALUES ('532628', '532628', '富宁县', '532600');
INSERT INTO `x2_cityarea` VALUES ('532801', '532801', '景洪市', '532800');
INSERT INTO `x2_cityarea` VALUES ('532822', '532822', '勐海县', '532800');
INSERT INTO `x2_cityarea` VALUES ('532823', '532823', '勐腊县', '532800');
INSERT INTO `x2_cityarea` VALUES ('532901', '532901', '大理市', '532900');
INSERT INTO `x2_cityarea` VALUES ('532922', '532922', '漾濞彝族自治县', '532900');
INSERT INTO `x2_cityarea` VALUES ('532923', '532923', '祥云县', '532900');
INSERT INTO `x2_cityarea` VALUES ('532924', '532924', '宾川县', '532900');
INSERT INTO `x2_cityarea` VALUES ('532925', '532925', '弥渡县', '532900');
INSERT INTO `x2_cityarea` VALUES ('532926', '532926', '南涧彝族自治县', '532900');
INSERT INTO `x2_cityarea` VALUES ('532927', '532927', '巍山彝族回族自治县', '532900');
INSERT INTO `x2_cityarea` VALUES ('532928', '532928', '永平县', '532900');
INSERT INTO `x2_cityarea` VALUES ('532929', '532929', '云龙县', '532900');
INSERT INTO `x2_cityarea` VALUES ('532930', '532930', '洱源县', '532900');
INSERT INTO `x2_cityarea` VALUES ('532931', '532931', '剑川县', '532900');
INSERT INTO `x2_cityarea` VALUES ('532932', '532932', '鹤庆县', '532900');
INSERT INTO `x2_cityarea` VALUES ('533102', '533102', '瑞丽市', '533100');
INSERT INTO `x2_cityarea` VALUES ('533103', '533103', '潞西市', '533100');
INSERT INTO `x2_cityarea` VALUES ('533122', '533122', '梁河县', '533100');
INSERT INTO `x2_cityarea` VALUES ('533123', '533123', '盈江县', '533100');
INSERT INTO `x2_cityarea` VALUES ('533124', '533124', '陇川县', '533100');
INSERT INTO `x2_cityarea` VALUES ('533321', '533321', '泸水县', '533300');
INSERT INTO `x2_cityarea` VALUES ('533323', '533323', '福贡县', '533300');
INSERT INTO `x2_cityarea` VALUES ('533324', '533324', '贡山独龙族怒族自治县', '533300');
INSERT INTO `x2_cityarea` VALUES ('533325', '533325', '兰坪白族普米族自治县', '533300');
INSERT INTO `x2_cityarea` VALUES ('533421', '533421', '香格里拉县', '533400');
INSERT INTO `x2_cityarea` VALUES ('533422', '533422', '德钦县', '533400');
INSERT INTO `x2_cityarea` VALUES ('533423', '533423', '维西傈僳族自治县', '533400');
INSERT INTO `x2_cityarea` VALUES ('540101', '540101', '市辖区', '540100');
INSERT INTO `x2_cityarea` VALUES ('540102', '540102', '城关区', '540100');
INSERT INTO `x2_cityarea` VALUES ('540121', '540121', '林周县', '540100');
INSERT INTO `x2_cityarea` VALUES ('540122', '540122', '当雄县', '540100');
INSERT INTO `x2_cityarea` VALUES ('540123', '540123', '尼木县', '540100');
INSERT INTO `x2_cityarea` VALUES ('540124', '540124', '曲水县', '540100');
INSERT INTO `x2_cityarea` VALUES ('540125', '540125', '堆龙德庆县', '540100');
INSERT INTO `x2_cityarea` VALUES ('540126', '540126', '达孜县', '540100');
INSERT INTO `x2_cityarea` VALUES ('540127', '540127', '墨竹工卡县', '540100');
INSERT INTO `x2_cityarea` VALUES ('542121', '542121', '昌都县', '542100');
INSERT INTO `x2_cityarea` VALUES ('542122', '542122', '江达县', '542100');
INSERT INTO `x2_cityarea` VALUES ('542123', '542123', '贡觉县', '542100');
INSERT INTO `x2_cityarea` VALUES ('542124', '542124', '类乌齐县', '542100');
INSERT INTO `x2_cityarea` VALUES ('542125', '542125', '丁青县', '542100');
INSERT INTO `x2_cityarea` VALUES ('542126', '542126', '察雅县', '542100');
INSERT INTO `x2_cityarea` VALUES ('542127', '542127', '八宿县', '542100');
INSERT INTO `x2_cityarea` VALUES ('542128', '542128', '左贡县', '542100');
INSERT INTO `x2_cityarea` VALUES ('542129', '542129', '芒康县', '542100');
INSERT INTO `x2_cityarea` VALUES ('542132', '542132', '洛隆县', '542100');
INSERT INTO `x2_cityarea` VALUES ('542133', '542133', '边坝县', '542100');
INSERT INTO `x2_cityarea` VALUES ('542221', '542221', '乃东县', '542200');
INSERT INTO `x2_cityarea` VALUES ('542222', '542222', '扎囊县', '542200');
INSERT INTO `x2_cityarea` VALUES ('542223', '542223', '贡嘎县', '542200');
INSERT INTO `x2_cityarea` VALUES ('542224', '542224', '桑日县', '542200');
INSERT INTO `x2_cityarea` VALUES ('542225', '542225', '琼结县', '542200');
INSERT INTO `x2_cityarea` VALUES ('542226', '542226', '曲松县', '542200');
INSERT INTO `x2_cityarea` VALUES ('542227', '542227', '措美县', '542200');
INSERT INTO `x2_cityarea` VALUES ('542228', '542228', '洛扎县', '542200');
INSERT INTO `x2_cityarea` VALUES ('542229', '542229', '加查县', '542200');
INSERT INTO `x2_cityarea` VALUES ('542231', '542231', '隆子县', '542200');
INSERT INTO `x2_cityarea` VALUES ('542232', '542232', '错那县', '542200');
INSERT INTO `x2_cityarea` VALUES ('542233', '542233', '浪卡子县', '542200');
INSERT INTO `x2_cityarea` VALUES ('542301', '542301', '日喀则市', '542300');
INSERT INTO `x2_cityarea` VALUES ('542322', '542322', '南木林县', '542300');
INSERT INTO `x2_cityarea` VALUES ('542323', '542323', '江孜县', '542300');
INSERT INTO `x2_cityarea` VALUES ('542324', '542324', '定日县', '542300');
INSERT INTO `x2_cityarea` VALUES ('542325', '542325', '萨迦县', '542300');
INSERT INTO `x2_cityarea` VALUES ('542326', '542326', '拉孜县', '542300');
INSERT INTO `x2_cityarea` VALUES ('542327', '542327', '昂仁县', '542300');
INSERT INTO `x2_cityarea` VALUES ('542328', '542328', '谢通门县', '542300');
INSERT INTO `x2_cityarea` VALUES ('542329', '542329', '白朗县', '542300');
INSERT INTO `x2_cityarea` VALUES ('542330', '542330', '仁布县', '542300');
INSERT INTO `x2_cityarea` VALUES ('542331', '542331', '康马县', '542300');
INSERT INTO `x2_cityarea` VALUES ('542332', '542332', '定结县', '542300');
INSERT INTO `x2_cityarea` VALUES ('542333', '542333', '仲巴县', '542300');
INSERT INTO `x2_cityarea` VALUES ('542334', '542334', '亚东县', '542300');
INSERT INTO `x2_cityarea` VALUES ('542335', '542335', '吉隆县', '542300');
INSERT INTO `x2_cityarea` VALUES ('542336', '542336', '聂拉木县', '542300');
INSERT INTO `x2_cityarea` VALUES ('542337', '542337', '萨嘎县', '542300');
INSERT INTO `x2_cityarea` VALUES ('542338', '542338', '岗巴县', '542300');
INSERT INTO `x2_cityarea` VALUES ('542421', '542421', '那曲县', '542400');
INSERT INTO `x2_cityarea` VALUES ('542422', '542422', '嘉黎县', '542400');
INSERT INTO `x2_cityarea` VALUES ('542423', '542423', '比如县', '542400');
INSERT INTO `x2_cityarea` VALUES ('542424', '542424', '聂荣县', '542400');
INSERT INTO `x2_cityarea` VALUES ('542425', '542425', '安多县', '542400');
INSERT INTO `x2_cityarea` VALUES ('542426', '542426', '申扎县', '542400');
INSERT INTO `x2_cityarea` VALUES ('542427', '542427', '索　县', '542400');
INSERT INTO `x2_cityarea` VALUES ('542428', '542428', '班戈县', '542400');
INSERT INTO `x2_cityarea` VALUES ('542429', '542429', '巴青县', '542400');
INSERT INTO `x2_cityarea` VALUES ('542430', '542430', '尼玛县', '542400');
INSERT INTO `x2_cityarea` VALUES ('542521', '542521', '普兰县', '542500');
INSERT INTO `x2_cityarea` VALUES ('542522', '542522', '札达县', '542500');
INSERT INTO `x2_cityarea` VALUES ('542523', '542523', '噶尔县', '542500');
INSERT INTO `x2_cityarea` VALUES ('542524', '542524', '日土县', '542500');
INSERT INTO `x2_cityarea` VALUES ('542525', '542525', '革吉县', '542500');
INSERT INTO `x2_cityarea` VALUES ('542526', '542526', '改则县', '542500');
INSERT INTO `x2_cityarea` VALUES ('542527', '542527', '措勤县', '542500');
INSERT INTO `x2_cityarea` VALUES ('542621', '542621', '林芝县', '542600');
INSERT INTO `x2_cityarea` VALUES ('542622', '542622', '工布江达县', '542600');
INSERT INTO `x2_cityarea` VALUES ('542623', '542623', '米林县', '542600');
INSERT INTO `x2_cityarea` VALUES ('542624', '542624', '墨脱县', '542600');
INSERT INTO `x2_cityarea` VALUES ('542625', '542625', '波密县', '542600');
INSERT INTO `x2_cityarea` VALUES ('542626', '542626', '察隅县', '542600');
INSERT INTO `x2_cityarea` VALUES ('542627', '542627', '朗　县', '542600');
INSERT INTO `x2_cityarea` VALUES ('610101', '610101', '市辖区', '610100');
INSERT INTO `x2_cityarea` VALUES ('610102', '610102', '新城区', '610100');
INSERT INTO `x2_cityarea` VALUES ('610103', '610103', '碑林区', '610100');
INSERT INTO `x2_cityarea` VALUES ('610104', '610104', '莲湖区', '610100');
INSERT INTO `x2_cityarea` VALUES ('610111', '610111', '灞桥区', '610100');
INSERT INTO `x2_cityarea` VALUES ('610112', '610112', '未央区', '610100');
INSERT INTO `x2_cityarea` VALUES ('610113', '610113', '雁塔区', '610100');
INSERT INTO `x2_cityarea` VALUES ('610114', '610114', '阎良区', '610100');
INSERT INTO `x2_cityarea` VALUES ('610115', '610115', '临潼区', '610100');
INSERT INTO `x2_cityarea` VALUES ('610116', '610116', '长安区', '610100');
INSERT INTO `x2_cityarea` VALUES ('610122', '610122', '蓝田县', '610100');
INSERT INTO `x2_cityarea` VALUES ('610124', '610124', '周至县', '610100');
INSERT INTO `x2_cityarea` VALUES ('610125', '610125', '户　县', '610100');
INSERT INTO `x2_cityarea` VALUES ('610126', '610126', '高陵县', '610100');
INSERT INTO `x2_cityarea` VALUES ('610201', '610201', '市辖区', '610200');
INSERT INTO `x2_cityarea` VALUES ('610202', '610202', '王益区', '610200');
INSERT INTO `x2_cityarea` VALUES ('610203', '610203', '印台区', '610200');
INSERT INTO `x2_cityarea` VALUES ('610204', '610204', '耀州区', '610200');
INSERT INTO `x2_cityarea` VALUES ('610222', '610222', '宜君县', '610200');
INSERT INTO `x2_cityarea` VALUES ('610301', '610301', '市辖区', '610300');
INSERT INTO `x2_cityarea` VALUES ('610302', '610302', '渭滨区', '610300');
INSERT INTO `x2_cityarea` VALUES ('610303', '610303', '金台区', '610300');
INSERT INTO `x2_cityarea` VALUES ('610304', '610304', '陈仓区', '610300');
INSERT INTO `x2_cityarea` VALUES ('610322', '610322', '凤翔县', '610300');
INSERT INTO `x2_cityarea` VALUES ('610323', '610323', '岐山县', '610300');
INSERT INTO `x2_cityarea` VALUES ('610324', '610324', '扶风县', '610300');
INSERT INTO `x2_cityarea` VALUES ('610326', '610326', '眉　县', '610300');
INSERT INTO `x2_cityarea` VALUES ('610327', '610327', '陇　县', '610300');
INSERT INTO `x2_cityarea` VALUES ('610328', '610328', '千阳县', '610300');
INSERT INTO `x2_cityarea` VALUES ('610329', '610329', '麟游县', '610300');
INSERT INTO `x2_cityarea` VALUES ('610330', '610330', '凤　县', '610300');
INSERT INTO `x2_cityarea` VALUES ('610331', '610331', '太白县', '610300');
INSERT INTO `x2_cityarea` VALUES ('610401', '610401', '市辖区', '610400');
INSERT INTO `x2_cityarea` VALUES ('610402', '610402', '秦都区', '610400');
INSERT INTO `x2_cityarea` VALUES ('610403', '610403', '杨凌区', '610400');
INSERT INTO `x2_cityarea` VALUES ('610404', '610404', '渭城区', '610400');
INSERT INTO `x2_cityarea` VALUES ('610422', '610422', '三原县', '610400');
INSERT INTO `x2_cityarea` VALUES ('610423', '610423', '泾阳县', '610400');
INSERT INTO `x2_cityarea` VALUES ('610424', '610424', '乾　县', '610400');
INSERT INTO `x2_cityarea` VALUES ('610425', '610425', '礼泉县', '610400');
INSERT INTO `x2_cityarea` VALUES ('610426', '610426', '永寿县', '610400');
INSERT INTO `x2_cityarea` VALUES ('610427', '610427', '彬　县', '610400');
INSERT INTO `x2_cityarea` VALUES ('610428', '610428', '长武县', '610400');
INSERT INTO `x2_cityarea` VALUES ('610429', '610429', '旬邑县', '610400');
INSERT INTO `x2_cityarea` VALUES ('610430', '610430', '淳化县', '610400');
INSERT INTO `x2_cityarea` VALUES ('610431', '610431', '武功县', '610400');
INSERT INTO `x2_cityarea` VALUES ('610481', '610481', '兴平市', '610400');
INSERT INTO `x2_cityarea` VALUES ('610501', '610501', '市辖区', '610500');
INSERT INTO `x2_cityarea` VALUES ('610502', '610502', '临渭区', '610500');
INSERT INTO `x2_cityarea` VALUES ('610521', '610521', '华　县', '610500');
INSERT INTO `x2_cityarea` VALUES ('610522', '610522', '潼关县', '610500');
INSERT INTO `x2_cityarea` VALUES ('610523', '610523', '大荔县', '610500');
INSERT INTO `x2_cityarea` VALUES ('610524', '610524', '合阳县', '610500');
INSERT INTO `x2_cityarea` VALUES ('610525', '610525', '澄城县', '610500');
INSERT INTO `x2_cityarea` VALUES ('610526', '610526', '蒲城县', '610500');
INSERT INTO `x2_cityarea` VALUES ('610527', '610527', '白水县', '610500');
INSERT INTO `x2_cityarea` VALUES ('610528', '610528', '富平县', '610500');
INSERT INTO `x2_cityarea` VALUES ('610581', '610581', '韩城市', '610500');
INSERT INTO `x2_cityarea` VALUES ('610582', '610582', '华阴市', '610500');
INSERT INTO `x2_cityarea` VALUES ('610601', '610601', '市辖区', '610600');
INSERT INTO `x2_cityarea` VALUES ('610602', '610602', '宝塔区', '610600');
INSERT INTO `x2_cityarea` VALUES ('610621', '610621', '延长县', '610600');
INSERT INTO `x2_cityarea` VALUES ('610622', '610622', '延川县', '610600');
INSERT INTO `x2_cityarea` VALUES ('610623', '610623', '子长县', '610600');
INSERT INTO `x2_cityarea` VALUES ('610624', '610624', '安塞县', '610600');
INSERT INTO `x2_cityarea` VALUES ('610625', '610625', '志丹县', '610600');
INSERT INTO `x2_cityarea` VALUES ('610626', '610626', '吴旗县', '610600');
INSERT INTO `x2_cityarea` VALUES ('610627', '610627', '甘泉县', '610600');
INSERT INTO `x2_cityarea` VALUES ('610628', '610628', '富　县', '610600');
INSERT INTO `x2_cityarea` VALUES ('610629', '610629', '洛川县', '610600');
INSERT INTO `x2_cityarea` VALUES ('610630', '610630', '宜川县', '610600');
INSERT INTO `x2_cityarea` VALUES ('610631', '610631', '黄龙县', '610600');
INSERT INTO `x2_cityarea` VALUES ('610632', '610632', '黄陵县', '610600');
INSERT INTO `x2_cityarea` VALUES ('610701', '610701', '市辖区', '610700');
INSERT INTO `x2_cityarea` VALUES ('610702', '610702', '汉台区', '610700');
INSERT INTO `x2_cityarea` VALUES ('610721', '610721', '南郑县', '610700');
INSERT INTO `x2_cityarea` VALUES ('610722', '610722', '城固县', '610700');
INSERT INTO `x2_cityarea` VALUES ('610723', '610723', '洋　县', '610700');
INSERT INTO `x2_cityarea` VALUES ('610724', '610724', '西乡县', '610700');
INSERT INTO `x2_cityarea` VALUES ('610725', '610725', '勉　县', '610700');
INSERT INTO `x2_cityarea` VALUES ('610726', '610726', '宁强县', '610700');
INSERT INTO `x2_cityarea` VALUES ('610727', '610727', '略阳县', '610700');
INSERT INTO `x2_cityarea` VALUES ('610728', '610728', '镇巴县', '610700');
INSERT INTO `x2_cityarea` VALUES ('610729', '610729', '留坝县', '610700');
INSERT INTO `x2_cityarea` VALUES ('610730', '610730', '佛坪县', '610700');
INSERT INTO `x2_cityarea` VALUES ('610801', '610801', '市辖区', '610800');
INSERT INTO `x2_cityarea` VALUES ('610802', '610802', '榆阳区', '610800');
INSERT INTO `x2_cityarea` VALUES ('610821', '610821', '神木县', '610800');
INSERT INTO `x2_cityarea` VALUES ('610822', '610822', '府谷县', '610800');
INSERT INTO `x2_cityarea` VALUES ('610823', '610823', '横山县', '610800');
INSERT INTO `x2_cityarea` VALUES ('610824', '610824', '靖边县', '610800');
INSERT INTO `x2_cityarea` VALUES ('610825', '610825', '定边县', '610800');
INSERT INTO `x2_cityarea` VALUES ('610826', '610826', '绥德县', '610800');
INSERT INTO `x2_cityarea` VALUES ('610827', '610827', '米脂县', '610800');
INSERT INTO `x2_cityarea` VALUES ('610828', '610828', '佳　县', '610800');
INSERT INTO `x2_cityarea` VALUES ('610829', '610829', '吴堡县', '610800');
INSERT INTO `x2_cityarea` VALUES ('610830', '610830', '清涧县', '610800');
INSERT INTO `x2_cityarea` VALUES ('610831', '610831', '子洲县', '610800');
INSERT INTO `x2_cityarea` VALUES ('610901', '610901', '市辖区', '610900');
INSERT INTO `x2_cityarea` VALUES ('610902', '610902', '汉滨区', '610900');
INSERT INTO `x2_cityarea` VALUES ('610921', '610921', '汉阴县', '610900');
INSERT INTO `x2_cityarea` VALUES ('610922', '610922', '石泉县', '610900');
INSERT INTO `x2_cityarea` VALUES ('610923', '610923', '宁陕县', '610900');
INSERT INTO `x2_cityarea` VALUES ('610924', '610924', '紫阳县', '610900');
INSERT INTO `x2_cityarea` VALUES ('610925', '610925', '岚皋县', '610900');
INSERT INTO `x2_cityarea` VALUES ('610926', '610926', '平利县', '610900');
INSERT INTO `x2_cityarea` VALUES ('610927', '610927', '镇坪县', '610900');
INSERT INTO `x2_cityarea` VALUES ('610928', '610928', '旬阳县', '610900');
INSERT INTO `x2_cityarea` VALUES ('610929', '610929', '白河县', '610900');
INSERT INTO `x2_cityarea` VALUES ('611001', '611001', '市辖区', '611000');
INSERT INTO `x2_cityarea` VALUES ('611002', '611002', '商州区', '611000');
INSERT INTO `x2_cityarea` VALUES ('611021', '611021', '洛南县', '611000');
INSERT INTO `x2_cityarea` VALUES ('611022', '611022', '丹凤县', '611000');
INSERT INTO `x2_cityarea` VALUES ('611023', '611023', '商南县', '611000');
INSERT INTO `x2_cityarea` VALUES ('611024', '611024', '山阳县', '611000');
INSERT INTO `x2_cityarea` VALUES ('611025', '611025', '镇安县', '611000');
INSERT INTO `x2_cityarea` VALUES ('611026', '611026', '柞水县', '611000');
INSERT INTO `x2_cityarea` VALUES ('620101', '620101', '市辖区', '620100');
INSERT INTO `x2_cityarea` VALUES ('620102', '620102', '城关区', '620100');
INSERT INTO `x2_cityarea` VALUES ('620103', '620103', '七里河区', '620100');
INSERT INTO `x2_cityarea` VALUES ('620104', '620104', '西固区', '620100');
INSERT INTO `x2_cityarea` VALUES ('620105', '620105', '安宁区', '620100');
INSERT INTO `x2_cityarea` VALUES ('620111', '620111', '红古区', '620100');
INSERT INTO `x2_cityarea` VALUES ('620121', '620121', '永登县', '620100');
INSERT INTO `x2_cityarea` VALUES ('620122', '620122', '皋兰县', '620100');
INSERT INTO `x2_cityarea` VALUES ('620123', '620123', '榆中县', '620100');
INSERT INTO `x2_cityarea` VALUES ('620201', '620201', '市辖区', '620200');
INSERT INTO `x2_cityarea` VALUES ('620301', '620301', '市辖区', '620300');
INSERT INTO `x2_cityarea` VALUES ('620302', '620302', '金川区', '620300');
INSERT INTO `x2_cityarea` VALUES ('620321', '620321', '永昌县', '620300');
INSERT INTO `x2_cityarea` VALUES ('620401', '620401', '市辖区', '620400');
INSERT INTO `x2_cityarea` VALUES ('620402', '620402', '白银区', '620400');
INSERT INTO `x2_cityarea` VALUES ('620403', '620403', '平川区', '620400');
INSERT INTO `x2_cityarea` VALUES ('620421', '620421', '靖远县', '620400');
INSERT INTO `x2_cityarea` VALUES ('620422', '620422', '会宁县', '620400');
INSERT INTO `x2_cityarea` VALUES ('620423', '620423', '景泰县', '620400');
INSERT INTO `x2_cityarea` VALUES ('620501', '620501', '市辖区', '620500');
INSERT INTO `x2_cityarea` VALUES ('620502', '620502', '秦城区', '620500');
INSERT INTO `x2_cityarea` VALUES ('620503', '620503', '北道区', '620500');
INSERT INTO `x2_cityarea` VALUES ('620521', '620521', '清水县', '620500');
INSERT INTO `x2_cityarea` VALUES ('620522', '620522', '秦安县', '620500');
INSERT INTO `x2_cityarea` VALUES ('620523', '620523', '甘谷县', '620500');
INSERT INTO `x2_cityarea` VALUES ('620524', '620524', '武山县', '620500');
INSERT INTO `x2_cityarea` VALUES ('620525', '620525', '张家川回族自治县', '620500');
INSERT INTO `x2_cityarea` VALUES ('620601', '620601', '市辖区', '620600');
INSERT INTO `x2_cityarea` VALUES ('620602', '620602', '凉州区', '620600');
INSERT INTO `x2_cityarea` VALUES ('620621', '620621', '民勤县', '620600');
INSERT INTO `x2_cityarea` VALUES ('620622', '620622', '古浪县', '620600');
INSERT INTO `x2_cityarea` VALUES ('620623', '620623', '天祝藏族自治县', '620600');
INSERT INTO `x2_cityarea` VALUES ('620701', '620701', '市辖区', '620700');
INSERT INTO `x2_cityarea` VALUES ('620702', '620702', '甘州区', '620700');
INSERT INTO `x2_cityarea` VALUES ('620721', '620721', '肃南裕固族自治县', '620700');
INSERT INTO `x2_cityarea` VALUES ('620722', '620722', '民乐县', '620700');
INSERT INTO `x2_cityarea` VALUES ('620723', '620723', '临泽县', '620700');
INSERT INTO `x2_cityarea` VALUES ('620724', '620724', '高台县', '620700');
INSERT INTO `x2_cityarea` VALUES ('620725', '620725', '山丹县', '620700');
INSERT INTO `x2_cityarea` VALUES ('620801', '620801', '市辖区', '620800');
INSERT INTO `x2_cityarea` VALUES ('620802', '620802', '崆峒区', '620800');
INSERT INTO `x2_cityarea` VALUES ('620821', '620821', '泾川县', '620800');
INSERT INTO `x2_cityarea` VALUES ('620822', '620822', '灵台县', '620800');
INSERT INTO `x2_cityarea` VALUES ('620823', '620823', '崇信县', '620800');
INSERT INTO `x2_cityarea` VALUES ('620824', '620824', '华亭县', '620800');
INSERT INTO `x2_cityarea` VALUES ('620825', '620825', '庄浪县', '620800');
INSERT INTO `x2_cityarea` VALUES ('620826', '620826', '静宁县', '620800');
INSERT INTO `x2_cityarea` VALUES ('620901', '620901', '市辖区', '620900');
INSERT INTO `x2_cityarea` VALUES ('620902', '620902', '肃州区', '620900');
INSERT INTO `x2_cityarea` VALUES ('620921', '620921', '金塔县', '620900');
INSERT INTO `x2_cityarea` VALUES ('620922', '620922', '安西县', '620900');
INSERT INTO `x2_cityarea` VALUES ('620923', '620923', '肃北蒙古族自治县', '620900');
INSERT INTO `x2_cityarea` VALUES ('620924', '620924', '阿克塞哈萨克族自治县', '620900');
INSERT INTO `x2_cityarea` VALUES ('620981', '620981', '玉门市', '620900');
INSERT INTO `x2_cityarea` VALUES ('620982', '620982', '敦煌市', '620900');
INSERT INTO `x2_cityarea` VALUES ('621001', '621001', '市辖区', '621000');
INSERT INTO `x2_cityarea` VALUES ('621002', '621002', '西峰区', '621000');
INSERT INTO `x2_cityarea` VALUES ('621021', '621021', '庆城县', '621000');
INSERT INTO `x2_cityarea` VALUES ('621022', '621022', '环　县', '621000');
INSERT INTO `x2_cityarea` VALUES ('621023', '621023', '华池县', '621000');
INSERT INTO `x2_cityarea` VALUES ('621024', '621024', '合水县', '621000');
INSERT INTO `x2_cityarea` VALUES ('621025', '621025', '正宁县', '621000');
INSERT INTO `x2_cityarea` VALUES ('621026', '621026', '宁　县', '621000');
INSERT INTO `x2_cityarea` VALUES ('621027', '621027', '镇原县', '621000');
INSERT INTO `x2_cityarea` VALUES ('621101', '621101', '市辖区', '621100');
INSERT INTO `x2_cityarea` VALUES ('621102', '621102', '安定区', '621100');
INSERT INTO `x2_cityarea` VALUES ('621121', '621121', '通渭县', '621100');
INSERT INTO `x2_cityarea` VALUES ('621122', '621122', '陇西县', '621100');
INSERT INTO `x2_cityarea` VALUES ('621123', '621123', '渭源县', '621100');
INSERT INTO `x2_cityarea` VALUES ('621124', '621124', '临洮县', '621100');
INSERT INTO `x2_cityarea` VALUES ('621125', '621125', '漳　县', '621100');
INSERT INTO `x2_cityarea` VALUES ('621126', '621126', '岷　县', '621100');
INSERT INTO `x2_cityarea` VALUES ('621201', '621201', '市辖区', '621200');
INSERT INTO `x2_cityarea` VALUES ('621202', '621202', '武都区', '621200');
INSERT INTO `x2_cityarea` VALUES ('621221', '621221', '成　县', '621200');
INSERT INTO `x2_cityarea` VALUES ('621222', '621222', '文　县', '621200');
INSERT INTO `x2_cityarea` VALUES ('621223', '621223', '宕昌县', '621200');
INSERT INTO `x2_cityarea` VALUES ('621224', '621224', '康　县', '621200');
INSERT INTO `x2_cityarea` VALUES ('621225', '621225', '西和县', '621200');
INSERT INTO `x2_cityarea` VALUES ('621226', '621226', '礼　县', '621200');
INSERT INTO `x2_cityarea` VALUES ('621227', '621227', '徽　县', '621200');
INSERT INTO `x2_cityarea` VALUES ('621228', '621228', '两当县', '621200');
INSERT INTO `x2_cityarea` VALUES ('622901', '622901', '临夏市', '622900');
INSERT INTO `x2_cityarea` VALUES ('622921', '622921', '临夏县', '622900');
INSERT INTO `x2_cityarea` VALUES ('622922', '622922', '康乐县', '622900');
INSERT INTO `x2_cityarea` VALUES ('622923', '622923', '永靖县', '622900');
INSERT INTO `x2_cityarea` VALUES ('622924', '622924', '广河县', '622900');
INSERT INTO `x2_cityarea` VALUES ('622925', '622925', '和政县', '622900');
INSERT INTO `x2_cityarea` VALUES ('622926', '622926', '东乡族自治县', '622900');
INSERT INTO `x2_cityarea` VALUES ('622927', '622927', '积石山保安族东乡族撒拉族自治县', '622900');
INSERT INTO `x2_cityarea` VALUES ('623001', '623001', '合作市', '623000');
INSERT INTO `x2_cityarea` VALUES ('623021', '623021', '临潭县', '623000');
INSERT INTO `x2_cityarea` VALUES ('623022', '623022', '卓尼县', '623000');
INSERT INTO `x2_cityarea` VALUES ('623023', '623023', '舟曲县', '623000');
INSERT INTO `x2_cityarea` VALUES ('623024', '623024', '迭部县', '623000');
INSERT INTO `x2_cityarea` VALUES ('623025', '623025', '玛曲县', '623000');
INSERT INTO `x2_cityarea` VALUES ('623026', '623026', '碌曲县', '623000');
INSERT INTO `x2_cityarea` VALUES ('623027', '623027', '夏河县', '623000');
INSERT INTO `x2_cityarea` VALUES ('630101', '630101', '市辖区', '630100');
INSERT INTO `x2_cityarea` VALUES ('630102', '630102', '城东区', '630100');
INSERT INTO `x2_cityarea` VALUES ('630103', '630103', '城中区', '630100');
INSERT INTO `x2_cityarea` VALUES ('630104', '630104', '城西区', '630100');
INSERT INTO `x2_cityarea` VALUES ('630105', '630105', '城北区', '630100');
INSERT INTO `x2_cityarea` VALUES ('630121', '630121', '大通回族土族自治县', '630100');
INSERT INTO `x2_cityarea` VALUES ('630122', '630122', '湟中县', '630100');
INSERT INTO `x2_cityarea` VALUES ('630123', '630123', '湟源县', '630100');
INSERT INTO `x2_cityarea` VALUES ('632121', '632121', '平安县', '632100');
INSERT INTO `x2_cityarea` VALUES ('632122', '632122', '民和回族土族自治县', '632100');
INSERT INTO `x2_cityarea` VALUES ('632123', '632123', '乐都县', '632100');
INSERT INTO `x2_cityarea` VALUES ('632126', '632126', '互助土族自治县', '632100');
INSERT INTO `x2_cityarea` VALUES ('632127', '632127', '化隆回族自治县', '632100');
INSERT INTO `x2_cityarea` VALUES ('632128', '632128', '循化撒拉族自治县', '632100');
INSERT INTO `x2_cityarea` VALUES ('632221', '632221', '门源回族自治县', '632200');
INSERT INTO `x2_cityarea` VALUES ('632222', '632222', '祁连县', '632200');
INSERT INTO `x2_cityarea` VALUES ('632223', '632223', '海晏县', '632200');
INSERT INTO `x2_cityarea` VALUES ('632224', '632224', '刚察县', '632200');
INSERT INTO `x2_cityarea` VALUES ('632321', '632321', '同仁县', '632300');
INSERT INTO `x2_cityarea` VALUES ('632322', '632322', '尖扎县', '632300');
INSERT INTO `x2_cityarea` VALUES ('632323', '632323', '泽库县', '632300');
INSERT INTO `x2_cityarea` VALUES ('632324', '632324', '河南蒙古族自治县', '632300');
INSERT INTO `x2_cityarea` VALUES ('632521', '632521', '共和县', '632500');
INSERT INTO `x2_cityarea` VALUES ('632522', '632522', '同德县', '632500');
INSERT INTO `x2_cityarea` VALUES ('632523', '632523', '贵德县', '632500');
INSERT INTO `x2_cityarea` VALUES ('632524', '632524', '兴海县', '632500');
INSERT INTO `x2_cityarea` VALUES ('632525', '632525', '贵南县', '632500');
INSERT INTO `x2_cityarea` VALUES ('632621', '632621', '玛沁县', '632600');
INSERT INTO `x2_cityarea` VALUES ('632622', '632622', '班玛县', '632600');
INSERT INTO `x2_cityarea` VALUES ('632623', '632623', '甘德县', '632600');
INSERT INTO `x2_cityarea` VALUES ('632624', '632624', '达日县', '632600');
INSERT INTO `x2_cityarea` VALUES ('632625', '632625', '久治县', '632600');
INSERT INTO `x2_cityarea` VALUES ('632626', '632626', '玛多县', '632600');
INSERT INTO `x2_cityarea` VALUES ('632721', '632721', '玉树县', '632700');
INSERT INTO `x2_cityarea` VALUES ('632722', '632722', '杂多县', '632700');
INSERT INTO `x2_cityarea` VALUES ('632723', '632723', '称多县', '632700');
INSERT INTO `x2_cityarea` VALUES ('632724', '632724', '治多县', '632700');
INSERT INTO `x2_cityarea` VALUES ('632725', '632725', '囊谦县', '632700');
INSERT INTO `x2_cityarea` VALUES ('632726', '632726', '曲麻莱县', '632700');
INSERT INTO `x2_cityarea` VALUES ('632801', '632801', '格尔木市', '632800');
INSERT INTO `x2_cityarea` VALUES ('632802', '632802', '德令哈市', '632800');
INSERT INTO `x2_cityarea` VALUES ('632821', '632821', '乌兰县', '632800');
INSERT INTO `x2_cityarea` VALUES ('632822', '632822', '都兰县', '632800');
INSERT INTO `x2_cityarea` VALUES ('632823', '632823', '天峻县', '632800');
INSERT INTO `x2_cityarea` VALUES ('640101', '640101', '市辖区', '640100');
INSERT INTO `x2_cityarea` VALUES ('640104', '640104', '兴庆区', '640100');
INSERT INTO `x2_cityarea` VALUES ('640105', '640105', '西夏区', '640100');
INSERT INTO `x2_cityarea` VALUES ('640106', '640106', '金凤区', '640100');
INSERT INTO `x2_cityarea` VALUES ('640121', '640121', '永宁县', '640100');
INSERT INTO `x2_cityarea` VALUES ('640122', '640122', '贺兰县', '640100');
INSERT INTO `x2_cityarea` VALUES ('640181', '640181', '灵武市', '640100');
INSERT INTO `x2_cityarea` VALUES ('640201', '640201', '市辖区', '640200');
INSERT INTO `x2_cityarea` VALUES ('640202', '640202', '大武口区', '640200');
INSERT INTO `x2_cityarea` VALUES ('640205', '640205', '惠农区', '640200');
INSERT INTO `x2_cityarea` VALUES ('640221', '640221', '平罗县', '640200');
INSERT INTO `x2_cityarea` VALUES ('640301', '640301', '市辖区', '640300');
INSERT INTO `x2_cityarea` VALUES ('640302', '640302', '利通区', '640300');
INSERT INTO `x2_cityarea` VALUES ('640323', '640323', '盐池县', '640300');
INSERT INTO `x2_cityarea` VALUES ('640324', '640324', '同心县', '640300');
INSERT INTO `x2_cityarea` VALUES ('640381', '640381', '青铜峡市', '640300');
INSERT INTO `x2_cityarea` VALUES ('640401', '640401', '市辖区', '640400');
INSERT INTO `x2_cityarea` VALUES ('640402', '640402', '原州区', '640400');
INSERT INTO `x2_cityarea` VALUES ('640422', '640422', '西吉县', '640400');
INSERT INTO `x2_cityarea` VALUES ('640423', '640423', '隆德县', '640400');
INSERT INTO `x2_cityarea` VALUES ('640424', '640424', '泾源县', '640400');
INSERT INTO `x2_cityarea` VALUES ('640425', '640425', '彭阳县', '640400');
INSERT INTO `x2_cityarea` VALUES ('640501', '640501', '市辖区', '640500');
INSERT INTO `x2_cityarea` VALUES ('640502', '640502', '沙坡头区', '640500');
INSERT INTO `x2_cityarea` VALUES ('640521', '640521', '中宁县', '640500');
INSERT INTO `x2_cityarea` VALUES ('640522', '640522', '海原县', '640500');
INSERT INTO `x2_cityarea` VALUES ('650101', '650101', '市辖区', '650100');
INSERT INTO `x2_cityarea` VALUES ('650102', '650102', '天山区', '650100');
INSERT INTO `x2_cityarea` VALUES ('650103', '650103', '沙依巴克区', '650100');
INSERT INTO `x2_cityarea` VALUES ('650104', '650104', '新市区', '650100');
INSERT INTO `x2_cityarea` VALUES ('650105', '650105', '水磨沟区', '650100');
INSERT INTO `x2_cityarea` VALUES ('650106', '650106', '头屯河区', '650100');
INSERT INTO `x2_cityarea` VALUES ('650107', '650107', '达坂城区', '650100');
INSERT INTO `x2_cityarea` VALUES ('650108', '650108', '东山区', '650100');
INSERT INTO `x2_cityarea` VALUES ('650121', '650121', '乌鲁木齐县', '650100');
INSERT INTO `x2_cityarea` VALUES ('650201', '650201', '市辖区', '650200');
INSERT INTO `x2_cityarea` VALUES ('650202', '650202', '独山子区', '650200');
INSERT INTO `x2_cityarea` VALUES ('650203', '650203', '克拉玛依区', '650200');
INSERT INTO `x2_cityarea` VALUES ('650204', '650204', '白碱滩区', '650200');
INSERT INTO `x2_cityarea` VALUES ('650205', '650205', '乌尔禾区', '650200');
INSERT INTO `x2_cityarea` VALUES ('652101', '652101', '吐鲁番市', '652100');
INSERT INTO `x2_cityarea` VALUES ('652122', '652122', '鄯善县', '652100');
INSERT INTO `x2_cityarea` VALUES ('652123', '652123', '托克逊县', '652100');
INSERT INTO `x2_cityarea` VALUES ('652201', '652201', '哈密市', '652200');
INSERT INTO `x2_cityarea` VALUES ('652222', '652222', '巴里坤哈萨克自治县', '652200');
INSERT INTO `x2_cityarea` VALUES ('652223', '652223', '伊吾县', '652200');
INSERT INTO `x2_cityarea` VALUES ('652301', '652301', '昌吉市', '652300');
INSERT INTO `x2_cityarea` VALUES ('652302', '652302', '阜康市', '652300');
INSERT INTO `x2_cityarea` VALUES ('652303', '652303', '米泉市', '652300');
INSERT INTO `x2_cityarea` VALUES ('652323', '652323', '呼图壁县', '652300');
INSERT INTO `x2_cityarea` VALUES ('652324', '652324', '玛纳斯县', '652300');
INSERT INTO `x2_cityarea` VALUES ('652325', '652325', '奇台县', '652300');
INSERT INTO `x2_cityarea` VALUES ('652327', '652327', '吉木萨尔县', '652300');
INSERT INTO `x2_cityarea` VALUES ('652328', '652328', '木垒哈萨克自治县', '652300');
INSERT INTO `x2_cityarea` VALUES ('652701', '652701', '博乐市', '652700');
INSERT INTO `x2_cityarea` VALUES ('652722', '652722', '精河县', '652700');
INSERT INTO `x2_cityarea` VALUES ('652723', '652723', '温泉县', '652700');
INSERT INTO `x2_cityarea` VALUES ('652801', '652801', '库尔勒市', '652800');
INSERT INTO `x2_cityarea` VALUES ('652822', '652822', '轮台县', '652800');
INSERT INTO `x2_cityarea` VALUES ('652823', '652823', '尉犁县', '652800');
INSERT INTO `x2_cityarea` VALUES ('652824', '652824', '若羌县', '652800');
INSERT INTO `x2_cityarea` VALUES ('652825', '652825', '且末县', '652800');
INSERT INTO `x2_cityarea` VALUES ('652826', '652826', '焉耆回族自治县', '652800');
INSERT INTO `x2_cityarea` VALUES ('652827', '652827', '和静县', '652800');
INSERT INTO `x2_cityarea` VALUES ('652828', '652828', '和硕县', '652800');
INSERT INTO `x2_cityarea` VALUES ('652829', '652829', '博湖县', '652800');
INSERT INTO `x2_cityarea` VALUES ('652901', '652901', '阿克苏市', '652900');
INSERT INTO `x2_cityarea` VALUES ('652922', '652922', '温宿县', '652900');
INSERT INTO `x2_cityarea` VALUES ('652923', '652923', '库车县', '652900');
INSERT INTO `x2_cityarea` VALUES ('652924', '652924', '沙雅县', '652900');
INSERT INTO `x2_cityarea` VALUES ('652925', '652925', '新和县', '652900');
INSERT INTO `x2_cityarea` VALUES ('652926', '652926', '拜城县', '652900');
INSERT INTO `x2_cityarea` VALUES ('652927', '652927', '乌什县', '652900');
INSERT INTO `x2_cityarea` VALUES ('652928', '652928', '阿瓦提县', '652900');
INSERT INTO `x2_cityarea` VALUES ('652929', '652929', '柯坪县', '652900');
INSERT INTO `x2_cityarea` VALUES ('653001', '653001', '阿图什市', '653000');
INSERT INTO `x2_cityarea` VALUES ('653022', '653022', '阿克陶县', '653000');
INSERT INTO `x2_cityarea` VALUES ('653023', '653023', '阿合奇县', '653000');
INSERT INTO `x2_cityarea` VALUES ('653024', '653024', '乌恰县', '653000');
INSERT INTO `x2_cityarea` VALUES ('653101', '653101', '喀什市', '653100');
INSERT INTO `x2_cityarea` VALUES ('653121', '653121', '疏附县', '653100');
INSERT INTO `x2_cityarea` VALUES ('653122', '653122', '疏勒县', '653100');
INSERT INTO `x2_cityarea` VALUES ('653123', '653123', '英吉沙县', '653100');
INSERT INTO `x2_cityarea` VALUES ('653124', '653124', '泽普县', '653100');
INSERT INTO `x2_cityarea` VALUES ('653125', '653125', '莎车县', '653100');
INSERT INTO `x2_cityarea` VALUES ('653126', '653126', '叶城县', '653100');
INSERT INTO `x2_cityarea` VALUES ('653127', '653127', '麦盖提县', '653100');
INSERT INTO `x2_cityarea` VALUES ('653128', '653128', '岳普湖县', '653100');
INSERT INTO `x2_cityarea` VALUES ('653129', '653129', '伽师县', '653100');
INSERT INTO `x2_cityarea` VALUES ('653130', '653130', '巴楚县', '653100');
INSERT INTO `x2_cityarea` VALUES ('653131', '653131', '塔什库尔干塔吉克自治县', '653100');
INSERT INTO `x2_cityarea` VALUES ('653201', '653201', '和田市', '653200');
INSERT INTO `x2_cityarea` VALUES ('653221', '653221', '和田县', '653200');
INSERT INTO `x2_cityarea` VALUES ('653222', '653222', '墨玉县', '653200');
INSERT INTO `x2_cityarea` VALUES ('653223', '653223', '皮山县', '653200');
INSERT INTO `x2_cityarea` VALUES ('653224', '653224', '洛浦县', '653200');
INSERT INTO `x2_cityarea` VALUES ('653225', '653225', '策勒县', '653200');
INSERT INTO `x2_cityarea` VALUES ('653226', '653226', '于田县', '653200');
INSERT INTO `x2_cityarea` VALUES ('653227', '653227', '民丰县', '653200');
INSERT INTO `x2_cityarea` VALUES ('654002', '654002', '伊宁市', '654000');
INSERT INTO `x2_cityarea` VALUES ('654003', '654003', '奎屯市', '654000');
INSERT INTO `x2_cityarea` VALUES ('654021', '654021', '伊宁县', '654000');
INSERT INTO `x2_cityarea` VALUES ('654022', '654022', '察布查尔锡伯自治县', '654000');
INSERT INTO `x2_cityarea` VALUES ('654023', '654023', '霍城县', '654000');
INSERT INTO `x2_cityarea` VALUES ('654024', '654024', '巩留县', '654000');
INSERT INTO `x2_cityarea` VALUES ('654025', '654025', '新源县', '654000');
INSERT INTO `x2_cityarea` VALUES ('654026', '654026', '昭苏县', '654000');
INSERT INTO `x2_cityarea` VALUES ('654027', '654027', '特克斯县', '654000');
INSERT INTO `x2_cityarea` VALUES ('654028', '654028', '尼勒克县', '654000');
INSERT INTO `x2_cityarea` VALUES ('654201', '654201', '塔城市', '654200');
INSERT INTO `x2_cityarea` VALUES ('654202', '654202', '乌苏市', '654200');
INSERT INTO `x2_cityarea` VALUES ('654221', '654221', '额敏县', '654200');
INSERT INTO `x2_cityarea` VALUES ('654223', '654223', '沙湾县', '654200');
INSERT INTO `x2_cityarea` VALUES ('654224', '654224', '托里县', '654200');
INSERT INTO `x2_cityarea` VALUES ('654225', '654225', '裕民县', '654200');
INSERT INTO `x2_cityarea` VALUES ('654226', '654226', '和布克赛尔蒙古自治县', '654200');
INSERT INTO `x2_cityarea` VALUES ('654301', '654301', '阿勒泰市', '654300');
INSERT INTO `x2_cityarea` VALUES ('654321', '654321', '布尔津县', '654300');
INSERT INTO `x2_cityarea` VALUES ('654322', '654322', '富蕴县', '654300');
INSERT INTO `x2_cityarea` VALUES ('654323', '654323', '福海县', '654300');
INSERT INTO `x2_cityarea` VALUES ('654324', '654324', '哈巴河县', '654300');
INSERT INTO `x2_cityarea` VALUES ('654325', '654325', '青河县', '654300');
INSERT INTO `x2_cityarea` VALUES ('654326', '654326', '吉木乃县', '654300');
INSERT INTO `x2_cityarea` VALUES ('659001', '659001', '石河子市', '659000');
INSERT INTO `x2_cityarea` VALUES ('659002', '659002', '阿拉尔市', '659000');
INSERT INTO `x2_cityarea` VALUES ('659003', '659003', '图木舒克市', '659000');
INSERT INTO `x2_cityarea` VALUES ('659004', '659004', '五家渠市', '659000');
INSERT INTO `x2_cityarea` VALUES ('441900', '441901', '莞城区', '441900');
INSERT INTO `x2_cityarea` VALUES ('442000', '442001', '中山市', '442000');
INSERT INTO `x2_cityarea` VALUES ('810101', '810101', '香港特别行政区', '810100');
INSERT INTO `x2_cityarea` VALUES ('820101', '820101', '澳门特别行政区', '820100');
INSERT INTO `x2_cityarea` VALUES ('710101', '710101', '中正区', '710100');
INSERT INTO `x2_cityarea` VALUES ('710102', '710102', '大同区', '710100');
INSERT INTO `x2_cityarea` VALUES ('710103', '710103', '中山区', '710100');
INSERT INTO `x2_cityarea` VALUES ('710104', '710104', '松山区', '710100');
INSERT INTO `x2_cityarea` VALUES ('710105', '710105', '大安区', '710100');
INSERT INTO `x2_cityarea` VALUES ('710106', '710106', '万华区', '710100');
INSERT INTO `x2_cityarea` VALUES ('710107', '710107', '信义区', '710100');
INSERT INTO `x2_cityarea` VALUES ('710108', '710108', '士林区', '710100');
INSERT INTO `x2_cityarea` VALUES ('710109', '710109', '北投区', '710100');
INSERT INTO `x2_cityarea` VALUES ('710110', '710110', '内湖区', '710100');
INSERT INTO `x2_cityarea` VALUES ('710111', '710111', '南港区', '710100');
INSERT INTO `x2_cityarea` VALUES ('710112', '710112', '文山区', '710100');
INSERT INTO `x2_cityarea` VALUES ('710201', '710201', '新兴区', '710200');
INSERT INTO `x2_cityarea` VALUES ('710202', '710202', '前金区', '710200');
INSERT INTO `x2_cityarea` VALUES ('710203', '710203', '芩雅区', '710200');
INSERT INTO `x2_cityarea` VALUES ('710204', '710204', '盐埕区', '710200');
INSERT INTO `x2_cityarea` VALUES ('710205', '710205', '鼓山区', '710200');
INSERT INTO `x2_cityarea` VALUES ('710206', '710206', '旗津区', '710200');
INSERT INTO `x2_cityarea` VALUES ('710207', '710207', '前镇区', '710200');
INSERT INTO `x2_cityarea` VALUES ('710208', '710208', '三民区', '710200');
INSERT INTO `x2_cityarea` VALUES ('710209', '710209', '左营区', '710200');
INSERT INTO `x2_cityarea` VALUES ('710210', '710210', '楠梓区', '710200');
INSERT INTO `x2_cityarea` VALUES ('710211', '710211', '小港区', '710200');
INSERT INTO `x2_cityarea` VALUES ('710301', '710301', '仁爱区', '710300');
INSERT INTO `x2_cityarea` VALUES ('710302', '710302', '信义区', '710300');
INSERT INTO `x2_cityarea` VALUES ('710303', '710303', '中正区', '710300');
INSERT INTO `x2_cityarea` VALUES ('710304', '710304', '中山区', '710300');
INSERT INTO `x2_cityarea` VALUES ('710305', '710305', '安乐区', '710300');
INSERT INTO `x2_cityarea` VALUES ('710306', '710306', '暖暖区', '710300');
INSERT INTO `x2_cityarea` VALUES ('710307', '710307', '七堵区', '710300');
INSERT INTO `x2_cityarea` VALUES ('710401', '710401', '中区', '710400');
INSERT INTO `x2_cityarea` VALUES ('710402', '710402', '东区', '710400');
INSERT INTO `x2_cityarea` VALUES ('710403', '710403', '南区', '710400');
INSERT INTO `x2_cityarea` VALUES ('710404', '710404', '西区', '710400');
INSERT INTO `x2_cityarea` VALUES ('710405', '710405', '北区', '710400');
INSERT INTO `x2_cityarea` VALUES ('710406', '710406', '北屯区', '710400');
INSERT INTO `x2_cityarea` VALUES ('710407', '710407', '西屯区', '710400');
INSERT INTO `x2_cityarea` VALUES ('710408', '710408', '南屯区', '710400');
INSERT INTO `x2_cityarea` VALUES ('710501', '710501', '中西区', '710500');
INSERT INTO `x2_cityarea` VALUES ('710502', '710502', '东区', '710500');
INSERT INTO `x2_cityarea` VALUES ('710503', '710503', '南区', '710500');
INSERT INTO `x2_cityarea` VALUES ('710504', '710504', '北区', '710500');
INSERT INTO `x2_cityarea` VALUES ('710505', '710505', '安平区', '710500');
INSERT INTO `x2_cityarea` VALUES ('710506', '710506', '安南区', '710500');
INSERT INTO `x2_cityarea` VALUES ('710601', '710601', '东区', '710600');
INSERT INTO `x2_cityarea` VALUES ('710602', '710602', '北区', '710600');
INSERT INTO `x2_cityarea` VALUES ('710603', '710603', '香山区', '710600');
INSERT INTO `x2_cityarea` VALUES ('710701', '710701', '东区', '710700');
INSERT INTO `x2_cityarea` VALUES ('710702', '710702', '西区', '710700');
INSERT INTO `x2_cityarea` VALUES ('710801', '710801', '县辖区', '710800');
INSERT INTO `x2_cityarea` VALUES ('710901', '710901', '县辖区', '710900');
INSERT INTO `x2_cityarea` VALUES ('711001', '711001', '县辖区', '711000');
INSERT INTO `x2_cityarea` VALUES ('711101', '711101', '县辖区', '711100');
INSERT INTO `x2_cityarea` VALUES ('711201', '711201', '县辖区', '711200');
INSERT INTO `x2_cityarea` VALUES ('711301', '711301', '县辖区', '711300');
INSERT INTO `x2_cityarea` VALUES ('711401', '711401', '县辖区', '711400');
INSERT INTO `x2_cityarea` VALUES ('711501', '711501', '县辖区', '711500');
INSERT INTO `x2_cityarea` VALUES ('711601', '711601', '县辖区', '711600');
INSERT INTO `x2_cityarea` VALUES ('711701', '711701', '县辖区', '711700');
INSERT INTO `x2_cityarea` VALUES ('711801', '711801', '县辖区', '711800');
INSERT INTO `x2_cityarea` VALUES ('711901', '711901', '县辖区', '711900');
INSERT INTO `x2_cityarea` VALUES ('712001', '712001', '县辖区', '712000');
INSERT INTO `x2_cityarea` VALUES ('712101', '712101', '县辖区', '712100');
INSERT INTO `x2_cityarea` VALUES ('712201', '712201', '县辖区', '712200');
INSERT INTO `x2_cityarea` VALUES ('712301', '712301', '县辖区', '712300');
INSERT INTO `x2_cityarea` VALUES ('441902', '441902', '常平镇', '441900');
INSERT INTO `x2_cityarea` VALUES ('441903', '441903', '塘厦镇', '441900');
INSERT INTO `x2_cityarea` VALUES ('441904', '441904', '万江区', '441900');
INSERT INTO `x2_cityarea` VALUES ('441905', '441905', '虎门镇', '441900');
INSERT INTO `x2_cityarea` VALUES ('410186', '410186', '高新技术开发区', '410100');
INSERT INTO `x2_cityarea` VALUES ('410187', '410187', '郑东新区', '410100');
INSERT INTO `x2_cityarea` VALUES ('410188', '410188', '经济开发区', '410100');
INSERT INTO `x2_cityarea` VALUES ('232701', '232701', '加格达奇区', '232700');
INSERT INTO `x2_cityarea` VALUES ('232702', '232702', '松岭区', '232700');
INSERT INTO `x2_cityarea` VALUES ('232703', '232703', '新林区', '232700');
INSERT INTO `x2_cityarea` VALUES ('232704', '232704', '呼中区', '232700');
INSERT INTO `x2_cityarea` VALUES ('340208', '340208', '三山区', '340200');
INSERT INTO `x2_cityarea` VALUES ('440115', '440115', '南沙区', '440100');
INSERT INTO `x2_cityarea` VALUES ('440116', '440116', '萝岗区', '440100');

-- ----------------------------
-- Table structure for `x2_comment`
-- ----------------------------
DROP TABLE IF EXISTS `x2_comment`;
CREATE TABLE `x2_comment` (
  `cmtid` int(11) NOT NULL AUTO_INCREMENT,
  `cmtopenid` varchar(48) NOT NULL DEFAULT '',
  `cmtuserid` int(11) NOT NULL,
  `cmtreply` text NOT NULL,
  `cmtcontent` text NOT NULL,
  `cmttime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cmtid`),
  KEY `cmtuserid` (`cmtuserid`),
  KEY `cmtapp` (`cmtopenid`,`cmttime`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_comment
-- ----------------------------
INSERT INTO `x2_comment` VALUES ('3', 'openid1234567890', '1', '小白菜真可爱', '我是一个可爱的小白菜', '1479089640');

-- ----------------------------
-- Table structure for `x2_config`
-- ----------------------------
DROP TABLE IF EXISTS `x2_config`;
CREATE TABLE `x2_config` (
  `cfgapp` varchar(36) NOT NULL,
  `cfgsetting` text NOT NULL,
  PRIMARY KEY (`cfgapp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_config
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_consumelog`
-- ----------------------------
DROP TABLE IF EXISTS `x2_consumelog`;
CREATE TABLE `x2_consumelog` (
  `conlid` int(11) NOT NULL AUTO_INCREMENT,
  `conlcost` int(11) NOT NULL,
  `conluserid` int(11) NOT NULL,
  `conlinfo` varchar(120) NOT NULL,
  `conltype` int(4) NOT NULL,
  `conltime` int(11) NOT NULL,
  PRIMARY KEY (`conlid`),
  KEY `conluserid` (`conluserid`,`conltype`,`conltime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_consumelog
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_content`
-- ----------------------------
DROP TABLE IF EXISTS `x2_content`;
CREATE TABLE `x2_content` (
  `contentid` int(11) NOT NULL AUTO_INCREMENT,
  `contentcatid` int(11) NOT NULL DEFAULT '0',
  `contentmoduleid` int(11) NOT NULL DEFAULT '0',
  `contentuserid` int(11) NOT NULL DEFAULT '0',
  `contentusername` varchar(48) NOT NULL DEFAULT '',
  `contenttitle` varchar(240) NOT NULL DEFAULT '',
  `contentthumb` varchar(120) NOT NULL DEFAULT '',
  `contentlink` varchar(240) NOT NULL DEFAULT '',
  `contentinputtime` int(11) NOT NULL DEFAULT '0',
  `contentmodifytime` int(11) NOT NULL DEFAULT '0',
  `contentsequence` int(4) NOT NULL DEFAULT '0',
  `contentdescribe` text NOT NULL,
  `contentinfo` text NOT NULL,
  `contentstatus` int(2) NOT NULL DEFAULT '0',
  `contenttemplate` varchar(120) NOT NULL DEFAULT '',
  `contenttext` mediumtext NOT NULL,
  `cizhuan_guige` varchar(60) NOT NULL,
  `cizhuan_brand` varchar(24) NOT NULL,
  `cizhuan_thumb` varchar(120) NOT NULL,
  `tester` text NOT NULL,
  `demo` varchar(240) NOT NULL,
  PRIMARY KEY (`contentid`),
  KEY `contentuserid` (`contentuserid`,`contentinputtime`,`contentmodifytime`,`contentsequence`),
  KEY `contentmoduleid` (`contentmoduleid`),
  KEY `contentcatid` (`contentcatid`),
  KEY `contentstatus` (`contentstatus`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_content
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_coupon`
-- ----------------------------
DROP TABLE IF EXISTS `x2_coupon`;
CREATE TABLE `x2_coupon` (
  `couponsn` varchar(16) NOT NULL,
  `couponvalue` int(11) NOT NULL DEFAULT '0',
  `couponstatus` int(1) NOT NULL DEFAULT '0',
  `couponaddtime` int(11) NOT NULL DEFAULT '0',
  `couponendtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`couponsn`),
  KEY `couponstatus` (`couponstatus`,`couponendtime`),
  KEY `couponaddtime` (`couponaddtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_course`
-- ----------------------------
DROP TABLE IF EXISTS `x2_course`;
CREATE TABLE `x2_course` (
  `courseid` int(11) NOT NULL AUTO_INCREMENT,
  `coursetitle` varchar(240) DEFAULT NULL,
  `coursemoduleid` int(11) DEFAULT NULL,
  `coursecsid` int(11) DEFAULT NULL,
  `coursethumb` varchar(240) DEFAULT NULL,
  `courseuserid` int(11) DEFAULT NULL,
  `courseinputtime` int(11) DEFAULT NULL,
  `coursemodifytime` int(11) DEFAULT NULL,
  `coursesequence` int(11) DEFAULT NULL,
  `coursedescribe` text,
  `course_files` varchar(240) NOT NULL,
  `course_oggfile` varchar(250) NOT NULL,
  `course_webmfile` varchar(250) NOT NULL,
  `course_youtu` varchar(240) NOT NULL,
  `pdf_file` varchar(240) NOT NULL,
  `coursepasstime` int(11) NOT NULL,
  PRIMARY KEY (`courseid`),
  KEY `coursecsid` (`coursecsid`,`courseuserid`,`courseinputtime`,`coursemodifytime`,`coursesequence`),
  KEY `coursemoduleid` (`coursemoduleid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_course
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_coursesubject`
-- ----------------------------
DROP TABLE IF EXISTS `x2_coursesubject`;
CREATE TABLE `x2_coursesubject` (
  `csid` int(11) NOT NULL AUTO_INCREMENT,
  `cstitle` varchar(240) DEFAULT '',
  `cscatid` int(11) DEFAULT NULL,
  `csuserid` int(11) DEFAULT '0',
  `csbasicid` int(11) DEFAULT '0',
  `cssubjectid` int(11) DEFAULT '0',
  `cstime` int(11) DEFAULT '0',
  `csthumb` varchar(120) DEFAULT '',
  `cssequence` int(11) DEFAULT NULL,
  `csdescribe` text,
  `csdemo` tinyint(1) DEFAULT NULL,
  `csprice` text,
  `cstype` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`csid`),
  KEY `csbasicid` (`csbasicid`,`cssubjectid`,`cstime`),
  KEY `cscatid` (`cscatid`),
  KEY `cuserid` (`csuserid`),
  KEY `cssequence` (`cssequence`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_coursesubject
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_dayexam`
-- ----------------------------
DROP TABLE IF EXISTS `x2_dayexam`;
CREATE TABLE `x2_dayexam` (
  `deid` int(11) NOT NULL AUTO_INCREMENT,
  `deday` varchar(12) DEFAULT NULL,
  `deexamid` int(11) DEFAULT NULL,
  `deinfo` text,
  PRIMARY KEY (`deid`),
  UNIQUE KEY `deday` (`deday`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_dayexam
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_dochistory`
-- ----------------------------
DROP TABLE IF EXISTS `x2_dochistory`;
CREATE TABLE `x2_dochistory` (
  `dhid` int(11) NOT NULL AUTO_INCREMENT,
  `dhdocid` int(11) DEFAULT NULL,
  `dhtitle` varchar(240) DEFAULT NULL,
  `dhcontent` text NOT NULL,
  `dhtime` int(11) NOT NULL,
  `dhusername` varchar(72) DEFAULT NULL,
  `dhstatus` tinyint(4) NOT NULL,
  `dhtop` tinyint(4) NOT NULL,
  PRIMARY KEY (`dhid`),
  KEY `dhtime` (`dhtime`),
  KEY `dhstatus` (`dhstatus`),
  KEY `dhtop` (`dhtop`),
  KEY `dhdocid` (`dhdocid`),
  KEY `dhusername` (`dhusername`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_dochistory
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_docs`
-- ----------------------------
DROP TABLE IF EXISTS `x2_docs`;
CREATE TABLE `x2_docs` (
  `docid` int(11) NOT NULL AUTO_INCREMENT,
  `doctitle` varchar(240) NOT NULL,
  `docthumb` varchar(240) DEFAULT NULL,
  `doccatid` int(11) NOT NULL,
  `dockeywords` varchar(240) NOT NULL,
  `doccontentid` int(11) NOT NULL,
  `docinputtime` int(11) NOT NULL,
  `docmodifytime` int(11) NOT NULL,
  `docsequence` int(11) DEFAULT NULL,
  `docdescribe` varchar(240) NOT NULL,
  `doclocker` varchar(72) NOT NULL,
  `doclocktime` int(11) DEFAULT NULL,
  `docneedmore` int(1) DEFAULT NULL,
  `docsyslock` tinyint(1) DEFAULT NULL,
  `docistop` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`docid`),
  KEY `doctitle` (`doctitle`),
  KEY `doccatid` (`doccatid`),
  KEY `doccontentid` (`doccontentid`),
  KEY `docinputtime` (`docinputtime`),
  KEY `docmodifytime` (`docmodifytime`),
  KEY `doclocker` (`doclocker`),
  KEY `doclocktime` (`doclocktime`),
  KEY `docsyslock` (`docsyslock`),
  KEY `docsequence` (`docsequence`),
  KEY `docistop` (`docistop`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_docs
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_examhistory`
-- ----------------------------
DROP TABLE IF EXISTS `x2_examhistory`;
CREATE TABLE `x2_examhistory` (
  `ehid` int(11) NOT NULL AUTO_INCREMENT,
  `ehexamid` int(11) NOT NULL DEFAULT '0',
  `ehexam` varchar(240) NOT NULL DEFAULT '',
  `ehtype` int(11) NOT NULL DEFAULT '0',
  `ehbasicid` int(11) NOT NULL DEFAULT '0',
  `ehquestion` longtext NOT NULL,
  `ehsetting` text,
  `ehscorelist` text,
  `ehuseranswer` text,
  `ehtime` int(11) NOT NULL DEFAULT '0',
  `ehscore` decimal(10,2) NOT NULL DEFAULT '0.00',
  `ehuserid` int(11) NOT NULL DEFAULT '0',
  `ehusername` varchar(120) NOT NULL DEFAULT '',
  `ehstarttime` int(11) NOT NULL DEFAULT '0',
  `ehendtime` int(11) NOT NULL,
  `ehstatus` int(1) NOT NULL DEFAULT '1',
  `ehdecide` int(1) NOT NULL DEFAULT '0',
  `ehtimelist` text,
  `ehopenid` varchar(48) NOT NULL,
  `ehneedresit` tinyint(1) NOT NULL,
  `ehispass` tinyint(1) DEFAULT NULL,
  `ehteacher` varchar(72) DEFAULT NULL,
  `ehdecidetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`ehid`),
  KEY `ehtype` (`ehtype`,`ehbasicid`,`ehtime`,`ehuserid`),
  KEY `ehdecide` (`ehdecide`),
  KEY `ehexamid` (`ehexamid`),
  KEY `examopenid` (`ehopenid`),
  KEY `ehneedresit` (`ehneedresit`),
  KEY `ehispass` (`ehispass`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_examhistory
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_exams`
-- ----------------------------
DROP TABLE IF EXISTS `x2_exams`;
CREATE TABLE `x2_exams` (
  `examid` int(11) NOT NULL AUTO_INCREMENT,
  `examsubject` tinyint(4) NOT NULL DEFAULT '0',
  `exam` varchar(120) NOT NULL DEFAULT '',
  `examsetting` text NOT NULL,
  `examquestions` text NOT NULL,
  `examscore` text NOT NULL,
  `examstatus` int(1) NOT NULL DEFAULT '0',
  `examtype` int(11) NOT NULL DEFAULT '0',
  `examauthorid` int(11) NOT NULL DEFAULT '0',
  `examauthor` varchar(120) CHARACTER SET utf8 COLLATE utf8_estonian_ci NOT NULL DEFAULT '',
  `examtime` int(11) NOT NULL DEFAULT '0',
  `examkeyword` varchar(240) NOT NULL DEFAULT '',
  `examdecide` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`examid`),
  KEY `examstatus` (`examstatus`),
  KEY `examtype` (`examtype`,`examauthorid`),
  KEY `examtime` (`examtime`),
  KEY `examsubject` (`examsubject`),
  KEY `examdecide` (`examdecide`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_exams
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_examsession`
-- ----------------------------
DROP TABLE IF EXISTS `x2_examsession`;
CREATE TABLE `x2_examsession` (
  `examsessionid` varchar(32) NOT NULL,
  `examsessionuserid` int(11) NOT NULL DEFAULT '0',
  `examsession` varchar(240) NOT NULL DEFAULT '',
  `examsessionsetting` text NOT NULL,
  `examsessionsign` text,
  `examsessionbasic` int(11) NOT NULL DEFAULT '0',
  `examsessiontype` int(1) NOT NULL,
  `examsessionkey` varchar(32) NOT NULL DEFAULT '',
  `examsessionquestion` longtext NOT NULL,
  `examsessionuseranswer` text,
  `examsessionstarttime` int(11) NOT NULL DEFAULT '0',
  `examsessiontime` int(11) NOT NULL DEFAULT '0',
  `examsessionstatus` int(1) NOT NULL DEFAULT '0',
  `examsessionscore` decimal(10,1) NOT NULL DEFAULT '0.0',
  `examsessionscorelist` text,
  `examsessionissave` int(1) NOT NULL DEFAULT '0',
  `examsessiontimelist` text,
  PRIMARY KEY (`examsessionid`),
  KEY `examsessionstarttime` (`examsessionstarttime`),
  KEY `examsessionstatus` (`examsessionstatus`),
  KEY `examsessiontype` (`examsessiontype`),
  KEY `examsessionkey` (`examsessionkey`),
  KEY `examsubject` (`examsessionbasic`),
  KEY `examsessionissave` (`examsessionissave`),
  KEY `examsessionuserid` (`examsessionuserid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_examsession
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_exercise`
-- ----------------------------
DROP TABLE IF EXISTS `x2_exercise`;
CREATE TABLE `x2_exercise` (
  `exerid` int(11) NOT NULL AUTO_INCREMENT,
  `exeruserid` int(11) NOT NULL,
  `exerbasicid` int(11) NOT NULL,
  `exerknowsid` int(11) NOT NULL,
  `exernumber` int(11) NOT NULL,
  `exerqutype` int(11) NOT NULL,
  PRIMARY KEY (`exerid`),
  KEY `exeruserid` (`exeruserid`),
  KEY `exerbasicid` (`exerbasicid`),
  KEY `exerknowsid` (`exerknowsid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_exercise
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_favor`
-- ----------------------------
DROP TABLE IF EXISTS `x2_favor`;
CREATE TABLE `x2_favor` (
  `favorid` int(11) NOT NULL AUTO_INCREMENT,
  `favoruserid` int(11) NOT NULL DEFAULT '0',
  `favorsubjectid` int(11) NOT NULL DEFAULT '0',
  `favorquestionid` int(11) NOT NULL DEFAULT '0',
  `favortime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`favorid`),
  KEY `favoruserid` (`favoruserid`,`favorquestionid`,`favortime`),
  KEY `favorsubjectid` (`favorsubjectid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_favor
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `x2_feedback`;
CREATE TABLE `x2_feedback` (
  `fbid` int(11) NOT NULL AUTO_INCREMENT,
  `fbquestionid` int(11) NOT NULL,
  `fbtype` varchar(120) NOT NULL,
  `fbcontent` text NOT NULL,
  `fbuserid` int(11) NOT NULL,
  `fbtime` int(11) NOT NULL,
  `fbstatus` tinyint(4) NOT NULL,
  `fbdoneuserid` int(11) NOT NULL,
  `fbdonetime` int(11) NOT NULL,
  PRIMARY KEY (`fbid`),
  KEY `fbquestionid` (`fbquestionid`,`fbuserid`),
  KEY `fbtype` (`fbtype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_gbook`
-- ----------------------------
DROP TABLE IF EXISTS `x2_gbook`;
CREATE TABLE `x2_gbook` (
  `gbid` int(11) NOT NULL AUTO_INCREMENT,
  `gbinfo` text NOT NULL,
  `gbcontent` text NOT NULL,
  `gbreply` text NOT NULL,
  `gbtime` int(11) NOT NULL DEFAULT '0',
  `gbreplytime` int(11) NOT NULL DEFAULT '0',
  `gbstatus` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gbid`),
  KEY `gbtime` (`gbtime`),
  KEY `gbreplytime` (`gbreplytime`),
  KEY `gbstatus` (`gbstatus`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_gbook
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_knows`
-- ----------------------------
DROP TABLE IF EXISTS `x2_knows`;
CREATE TABLE `x2_knows` (
  `knowsid` int(11) NOT NULL AUTO_INCREMENT,
  `knows` varchar(120) NOT NULL DEFAULT '',
  `knowssectionid` int(11) NOT NULL DEFAULT '0',
  `knowsdescribe` text NOT NULL,
  `knowsstatus` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`knowsid`),
  KEY `knows` (`knows`,`knowssectionid`),
  KEY `knowsstatus` (`knowsstatus`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_knows
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_log`
-- ----------------------------
DROP TABLE IF EXISTS `x2_log`;
CREATE TABLE `x2_log` (
  `logid` int(11) NOT NULL AUTO_INCREMENT,
  `loguserid` int(11) DEFAULT '0',
  `logcourseid` int(11) DEFAULT '0',
  `logtime` int(11) DEFAULT '0',
  `logstatus` int(1) DEFAULT NULL,
  `logendtime` int(11) DEFAULT NULL,
  `logprogress` int(11) DEFAULT NULL,
  PRIMARY KEY (`logid`),
  KEY `loguserid` (`loguserid`,`logcourseid`),
  KEY `logtime` (`logtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_log
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_module`
-- ----------------------------
DROP TABLE IF EXISTS `x2_module`;
CREATE TABLE `x2_module` (
  `moduleid` int(11) NOT NULL AUTO_INCREMENT,
  `modulecode` varchar(24) NOT NULL DEFAULT '',
  `modulename` varchar(60) NOT NULL DEFAULT '',
  `moduledescribe` tinytext NOT NULL,
  `moduleapp` varchar(24) NOT NULL DEFAULT '',
  `moduletable` varchar(24) NOT NULL DEFAULT '',
  `moduleallowreg` tinyint(1) DEFAULT '0',
  `modulestatus` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`),
  UNIQUE KEY `modulecode` (`modulecode`),
  KEY `modulename` (`modulename`),
  KEY `moduleapp` (`moduleapp`),
  KEY `moduleallowreg` (`moduleallowreg`),
  KEY `modulestatus` (`modulestatus`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_module
-- ----------------------------
INSERT INTO `x2_module` VALUES ('1', 'manager', '管理员模型', '管理员', 'user', 'user_data', '0', '0');
INSERT INTO `x2_module` VALUES ('9', 'normal', '普通用户模型', '普通用户', 'user', '', '0', '0');
INSERT INTO `x2_module` VALUES ('4', 'news', '新闻', '新闻', 'content', 'content_data', '0', '0');
INSERT INTO `x2_module` VALUES ('11', 'spnormal', '普通信息', '普通信息', 'special', '', '0', '0');
INSERT INTO `x2_module` VALUES ('12', 'teacher', '教师模型', '教师模型', 'user', '', '0', '0');
INSERT INTO `x2_module` VALUES ('14', 'course', '视频课程', '视频课程', 'course', '', '0', '0');
INSERT INTO `x2_module` VALUES ('15', 'pdf', '文本课程', '文本课程', 'course', '', '0', '0');

-- ----------------------------
-- Table structure for `x2_module_fields`
-- ----------------------------
DROP TABLE IF EXISTS `x2_module_fields`;
CREATE TABLE `x2_module_fields` (
  `fieldid` int(11) NOT NULL AUTO_INCREMENT,
  `fieldappid` varchar(12) NOT NULL DEFAULT '',
  `fieldmoduleid` int(4) NOT NULL DEFAULT '0',
  `fieldsequence` tinyint(4) NOT NULL DEFAULT '0',
  `field` varchar(24) NOT NULL DEFAULT '',
  `fieldtitle` varchar(60) NOT NULL DEFAULT '',
  `fieldlength` varchar(12) NOT NULL DEFAULT '',
  `fielddescribe` text NOT NULL,
  `fieldtype` varchar(24) NOT NULL DEFAULT '',
  `fieldhtmltype` varchar(24) NOT NULL DEFAULT '',
  `fieldhtmlproperty` text NOT NULL,
  `fieldvalues` text NOT NULL,
  `fielddefault` text NOT NULL,
  `fieldlock` tinyint(1) NOT NULL DEFAULT '0',
  `fieldindextype` varchar(12) NOT NULL DEFAULT '',
  `fieldforbidactors` tinytext NOT NULL,
  `fieldsystem` int(1) NOT NULL DEFAULT '0',
  `fieldpublic` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldid`),
  KEY `field` (`field`,`fieldlock`),
  KEY `fieldmoduleid` (`fieldmoduleid`),
  KEY `fieldsequence` (`fieldsequence`),
  KEY `fieldsystem` (`fieldsystem`),
  KEY `fieldpublic` (`fieldpublic`),
  KEY `fieldappid` (`fieldappid`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_module_fields
-- ----------------------------
INSERT INTO `x2_module_fields` VALUES ('1', 'user', '1', '2', 'manager_apps', '可管理模块', '240', '', 'varchar', 'checkboxarray', 'class=form-control\r\nstyle=width:30%', '用户=user\r\n内容=content\r\n考试=exam\r\n文件=document\r\n课程=course\r\n财务=bank', '', '0', '', ',-1,', '0', '0');
INSERT INTO `x2_module_fields` VALUES ('33', 'user', '12', '10', 'userphoto', '头像', '240', '', 'varchar', 'thumb', '', '', '', '0', '', ',,', '0', '1');
INSERT INTO `x2_module_fields` VALUES ('3', 'user', '1', '9', 'usertruename', '真实姓名', '24', '', 'varchar', 'text', 'class=form-control', '', '', '0', '0', ',,', '0', '1');
INSERT INTO `x2_module_fields` VALUES ('27', 'user', '9', '8', 'userpassport', '身份证号', '24', '', 'varchar', 'text', 'class=form-control', '', '', '0', '', ',,', '0', '1');
INSERT INTO `x2_module_fields` VALUES ('7', 'user', '12', '0', 'teacher_subjects', '可管理科目', '', '', 'text', 'checkboxarray', '', '演示课程=1\r\n测试科目二=2', '', '0', '0', ',-1,', '0', '0');
INSERT INTO `x2_module_fields` VALUES ('8', 'content', '13', '0', 'cizhuan_guige', '规格', '60', '', 'varchar', 'radio', '', '90*90=1\r\n60*60=2', '', '0', '', ',,', '1', '0');
INSERT INTO `x2_module_fields` VALUES ('9', 'content', '13', '0', 'cizhuan_brand', '品牌', '24', '', 'varchar', 'checkboxarray', '', '阿里=阿里\r\n阿里1=阿里1', '', '0', '', ',,', '0', '0');
INSERT INTO `x2_module_fields` VALUES ('10', 'content', '13', '0', 'cizhuan_thumb', '缩略图', '120', '', 'varchar', 'thumb', '', '', '', '0', '', ',,', '0', '0');
INSERT INTO `x2_module_fields` VALUES ('11', 'course', '14', '0', 'course_files', 'MP4视频', '240', 'MP4的视频格式，用于支持IE浏览器的H5播放', 'varchar', 'videotext', 'exectype=upfile\r\nuptypes=*.mp4\r\nfilesize=120 MB', '', '', '0', '', ',,', '0', '0');
INSERT INTO `x2_module_fields` VALUES ('12', 'content', '4', '0', 'tester', '测试字段', '', '', 'text', 'picture', 'class=form-control', '', '', '0', '', ',,', '0', '1');
INSERT INTO `x2_module_fields` VALUES ('14', 'user', '12', '3', 'userprofile', '个人简介', '', '', 'text', 'textarea', 'class=form-control', '', '', '0', '', ',,', '0', '1');
INSERT INTO `x2_module_fields` VALUES ('16', 'course', '14', '0', 'course_oggfile', 'ogg视频', '250', 'ogg视频支持火狐和谷歌浏览器', 'varchar', 'videotext', 'exectype=upfile\r\nuptypes=*.ogg\r\nfilesize=120 MB\r\nattr-ftype=ogg', '', '', '0', '', ',,', '0', '0');
INSERT INTO `x2_module_fields` VALUES ('17', 'course', '14', '0', 'course_webmfile', 'webm视频', '250', 'webm视频用户火狐和谷歌浏览器播放', 'varchar', 'videotext', 'exectype=upfile\r\nuptypes=*.webm\r\nfilesize=120 MB\r\nattr-ftype=webm', '', '', '0', '', ',,', '0', '0');
INSERT INTO `x2_module_fields` VALUES ('18', 'course', '14', '0', 'course_youtu', '优酷土豆源', '240', '注意，选择优酷土豆视频后，视频课程不要使用解锁模式。', 'varchar', 'text', 'class=form-control', '', '', '0', '', ',,', '0', '0');
INSERT INTO `x2_module_fields` VALUES ('20', 'content', '4', '0', 'demo', '演示', '240', '', 'varchar', 'thumb', '', '', '', '0', '', ',,', '0', '1');
INSERT INTO `x2_module_fields` VALUES ('22', 'course', '15', '0', 'pdf_file', 'PDF文件', '240', '', 'varchar', 'videotext', 'exectype=upfile\r\nuptypes=*.pdf\r\nfilesize=20 MB\r\nattr-ftype=pdf', '', '', '0', '', ',,', '0', '0');
INSERT INTO `x2_module_fields` VALUES ('29', 'user', '12', '7', 'userphone', '手机号', '15', '', 'varchar', 'text', 'class=form-control', '', '', '0', 'INDEX', ',,', '0', '1');
INSERT INTO `x2_module_fields` VALUES ('30', 'user', '12', '5', 'userdegree', '文化程度', '48', '', 'varchar', 'text', 'class=form-control', '', '', '0', '', ',,', '0', '1');
INSERT INTO `x2_module_fields` VALUES ('31', 'user', '12', '4', 'useraddress', '地址', '120', '', 'varchar', 'text', 'class=form-control', '', '', '0', '', ',,', '0', '1');
INSERT INTO `x2_module_fields` VALUES ('28', 'user', '12', '6', 'usergender', '性别', '6', '', 'varchar', 'radio', '', '男=男\r\n女=女', '男', '0', '', ',,', '0', '1');

-- ----------------------------
-- Table structure for `x2_openbasics`
-- ----------------------------
DROP TABLE IF EXISTS `x2_openbasics`;
CREATE TABLE `x2_openbasics` (
  `obid` int(11) NOT NULL AUTO_INCREMENT,
  `obuserid` int(11) NOT NULL DEFAULT '0',
  `obbasicid` int(11) NOT NULL DEFAULT '0',
  `obtime` int(11) NOT NULL DEFAULT '0',
  `obendtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`obid`),
  KEY `oluserid` (`obuserid`,`obbasicid`,`obtime`,`obendtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_openbasics
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_opencourse`
-- ----------------------------
DROP TABLE IF EXISTS `x2_opencourse`;
CREATE TABLE `x2_opencourse` (
  `ocid` int(11) NOT NULL AUTO_INCREMENT,
  `ocuserid` int(11) NOT NULL,
  `occourseid` int(11) NOT NULL,
  `octime` int(11) NOT NULL,
  `ocendtime` int(11) NOT NULL,
  PRIMARY KEY (`ocid`),
  KEY `ocuserid` (`ocuserid`,`occourseid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_opencourse
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_orders`
-- ----------------------------
DROP TABLE IF EXISTS `x2_orders`;
CREATE TABLE `x2_orders` (
  `ordersn` varchar(15) NOT NULL,
  `ordertitle` varchar(240) NOT NULL,
  `orderdescribe` text NOT NULL,
  `orderitems` text NOT NULL,
  `orderprice` decimal(10,2) NOT NULL,
  `orderuserid` int(11) NOT NULL,
  `orderuserinfo` text NOT NULL,
  `orderstatus` int(2) NOT NULL,
  `orderfullprice` decimal(10,2) NOT NULL,
  `ordercreatetime` int(11) NOT NULL,
  `orderpaytime` int(11) NOT NULL,
  `orderouttime` int(11) NOT NULL,
  `orderrecivetime` int(11) NOT NULL,
  `orderfaq` text NOT NULL,
  `orderpost` text NOT NULL,
  PRIMARY KEY (`ordersn`),
  KEY `orderprice` (`orderprice`,`ordercreatetime`,`orderpaytime`),
  KEY `orderuserid` (`orderuserid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_orders
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_poscontent`
-- ----------------------------
DROP TABLE IF EXISTS `x2_poscontent`;
CREATE TABLE `x2_poscontent` (
  `pcid` int(11) NOT NULL AUTO_INCREMENT,
  `pcposid` int(11) NOT NULL DEFAULT '0',
  `pccontentid` int(11) NOT NULL DEFAULT '0',
  `pcthumb` varchar(120) NOT NULL DEFAULT '',
  `pcsequence` int(11) NOT NULL DEFAULT '0',
  `pctitle` varchar(240) NOT NULL DEFAULT '',
  `pctime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pcid`),
  KEY `pcposid` (`pcposid`,`pccontentid`,`pcsequence`),
  KEY `pctime` (`pctime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_poscontent
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_position`
-- ----------------------------
DROP TABLE IF EXISTS `x2_position`;
CREATE TABLE `x2_position` (
  `posid` int(11) NOT NULL AUTO_INCREMENT,
  `posname` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`posid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_position
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_product`
-- ----------------------------
DROP TABLE IF EXISTS `x2_product`;
CREATE TABLE `x2_product` (
  `productid` int(11) NOT NULL AUTO_INCREMENT,
  `producttype` varchar(24) NOT NULL DEFAULT '',
  `productpartnerid` int(11) NOT NULL DEFAULT '0',
  `productname` varchar(240) NOT NULL DEFAULT '',
  `productcode` int(11) NOT NULL DEFAULT '0',
  `productprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `productdescribe` text NOT NULL,
  `productlesson` varchar(40) NOT NULL DEFAULT '',
  `producttry` varchar(240) NOT NULL DEFAULT '',
  PRIMARY KEY (`productid`),
  KEY `partnercode` (`productcode`),
  KEY `productpartnerid` (`productpartnerid`),
  KEY `producttype` (`producttype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_product
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_progress`
-- ----------------------------
DROP TABLE IF EXISTS `x2_progress`;
CREATE TABLE `x2_progress` (
  `prsid` int(11) NOT NULL AUTO_INCREMENT,
  `prsuserid` int(11) NOT NULL,
  `prstime` int(11) NOT NULL,
  `prsendtime` int(11) NOT NULL,
  `prscourseid` int(11) NOT NULL,
  `prscoursestatus` tinyint(1) NOT NULL,
  `prsexamid` int(11) NOT NULL,
  `prsexamstatus` tinyint(1) NOT NULL,
  `prstatus` tinyint(1) NOT NULL,
  PRIMARY KEY (`prsid`),
  KEY `prsuserid` (`prsuserid`),
  KEY `prscoursestatus` (`prscoursestatus`),
  KEY `prsexamstatus` (`prsexamstatus`),
  KEY `prstatus` (`prstatus`),
  KEY `prscourseid` (`prscourseid`),
  KEY `prsexamid` (`prsexamid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_progress
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_province`
-- ----------------------------
DROP TABLE IF EXISTS `x2_province`;
CREATE TABLE `x2_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provinceid` varchar(6) DEFAULT NULL,
  `province` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `province` (`province`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_province
-- ----------------------------
INSERT INTO `x2_province` VALUES ('1', '110000', '北京市');
INSERT INTO `x2_province` VALUES ('2', '120000', '天津市');
INSERT INTO `x2_province` VALUES ('3', '130000', '河北省');
INSERT INTO `x2_province` VALUES ('4', '140000', '山西省');
INSERT INTO `x2_province` VALUES ('5', '150000', '内蒙古自治区');
INSERT INTO `x2_province` VALUES ('6', '210000', '辽宁省');
INSERT INTO `x2_province` VALUES ('7', '220000', '吉林省');
INSERT INTO `x2_province` VALUES ('8', '230000', '黑龙江省');
INSERT INTO `x2_province` VALUES ('9', '310000', '上海市');
INSERT INTO `x2_province` VALUES ('10', '320000', '江苏省');
INSERT INTO `x2_province` VALUES ('11', '330000', '浙江省');
INSERT INTO `x2_province` VALUES ('12', '340000', '安徽省');
INSERT INTO `x2_province` VALUES ('13', '350000', '福建省');
INSERT INTO `x2_province` VALUES ('14', '360000', '江西省');
INSERT INTO `x2_province` VALUES ('15', '370000', '山东省');
INSERT INTO `x2_province` VALUES ('16', '410000', '河南省');
INSERT INTO `x2_province` VALUES ('17', '420000', '湖北省');
INSERT INTO `x2_province` VALUES ('18', '430000', '湖南省');
INSERT INTO `x2_province` VALUES ('19', '440000', '广东省');
INSERT INTO `x2_province` VALUES ('20', '450000', '广西壮族自治区');
INSERT INTO `x2_province` VALUES ('21', '460000', '海南省');
INSERT INTO `x2_province` VALUES ('22', '500000', '重庆市');
INSERT INTO `x2_province` VALUES ('23', '510000', '四川省');
INSERT INTO `x2_province` VALUES ('24', '520000', '贵州省');
INSERT INTO `x2_province` VALUES ('25', '530000', '云南省');
INSERT INTO `x2_province` VALUES ('26', '540000', '西藏自治区');
INSERT INTO `x2_province` VALUES ('27', '610000', '陕西省');
INSERT INTO `x2_province` VALUES ('28', '620000', '甘肃省');
INSERT INTO `x2_province` VALUES ('29', '630000', '青海省');
INSERT INTO `x2_province` VALUES ('30', '640000', '宁夏回族自治区');
INSERT INTO `x2_province` VALUES ('31', '650000', '新疆维吾尔自治区');

-- ----------------------------
-- Table structure for `x2_quest2knows`
-- ----------------------------
DROP TABLE IF EXISTS `x2_quest2knows`;
CREATE TABLE `x2_quest2knows` (
  `qkid` int(11) NOT NULL AUTO_INCREMENT,
  `qkquestionid` int(11) NOT NULL DEFAULT '0',
  `qkknowsid` int(11) NOT NULL DEFAULT '0',
  `qktype` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`qkid`),
  KEY `qkquestionid` (`qkquestionid`,`qkknowsid`),
  KEY `qktype` (`qktype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_quest2knows
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_questionanalysis`
-- ----------------------------
DROP TABLE IF EXISTS `x2_questionanalysis`;
CREATE TABLE `x2_questionanalysis` (
  `qaid` int(11) NOT NULL AUTO_INCREMENT,
  `qabasicid` int(11) DEFAULT NULL,
  `qaquestionid` int(11) DEFAULT NULL,
  `qauserid` int(11) DEFAULT NULL,
  `qanumber` int(11) DEFAULT NULL,
  `qarightnumber` int(11) DEFAULT NULL,
  `qawrongnumber` int(11) DEFAULT NULL,
  `qalasttime` int(11) DEFAULT NULL,
  `qafirststatus` int(1) DEFAULT NULL,
  `qalaststatus` int(1) DEFAULT NULL,
  `qarate` int(11) DEFAULT NULL,
  `qaqnparent` int(11) DEFAULT NULL,
  PRIMARY KEY (`qaid`),
  KEY `qabasicid` (`qabasicid`),
  KEY `qaquestionid` (`qaquestionid`),
  KEY `qauserid` (`qauserid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_questionanalysis
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_questionrows`
-- ----------------------------
DROP TABLE IF EXISTS `x2_questionrows`;
CREATE TABLE `x2_questionrows` (
  `qrid` int(11) NOT NULL AUTO_INCREMENT,
  `qrtype` tinyint(4) NOT NULL DEFAULT '2',
  `qrquestion` mediumtext NOT NULL,
  `qrknowsid` tinytext NOT NULL,
  `qrlevel` int(1) NOT NULL DEFAULT '0',
  `qrnumber` int(4) NOT NULL DEFAULT '0',
  `qruserid` int(11) NOT NULL DEFAULT '0',
  `qrusername` varchar(120) NOT NULL DEFAULT '',
  `qrlastmodifyuser` varchar(120) NOT NULL DEFAULT '',
  `qrtime` int(11) NOT NULL DEFAULT '0',
  `qrstatus` tinyint(1) NOT NULL DEFAULT '1',
  `qrdeler` varchar(72) DEFAULT NULL,
  `qrdeltime` int(11) DEFAULT NULL,
  PRIMARY KEY (`qrid`),
  KEY `qrlevel` (`qrlevel`,`qrnumber`),
  KEY `qruserid` (`qruserid`),
  KEY `qrtime` (`qrtime`),
  KEY `qrstatus` (`qrstatus`),
  KEY `qrtype` (`qrtype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_questionrows
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_questions`
-- ----------------------------
DROP TABLE IF EXISTS `x2_questions`;
CREATE TABLE `x2_questions` (
  `questionid` int(11) NOT NULL AUTO_INCREMENT,
  `questiontype` int(3) NOT NULL DEFAULT '0',
  `question` text NOT NULL,
  `questionuserid` int(11) NOT NULL DEFAULT '0',
  `questionusername` varchar(120) NOT NULL DEFAULT '',
  `questionlastmodifyuser` varchar(120) NOT NULL DEFAULT '',
  `questionselect` text NOT NULL,
  `questionselectnumber` tinyint(11) NOT NULL DEFAULT '0',
  `questionanswer` text NOT NULL,
  `questiondescribe` text NOT NULL,
  `questionknowsid` text NOT NULL,
  `questioncreatetime` int(11) NOT NULL DEFAULT '0',
  `questionstatus` int(1) NOT NULL DEFAULT '1',
  `questionhtml` text NOT NULL,
  `questionparent` int(11) NOT NULL DEFAULT '0',
  `questionsequence` int(3) NOT NULL DEFAULT '0',
  `questionlevel` int(1) NOT NULL DEFAULT '0',
  `questiondeler` varchar(72) DEFAULT NULL,
  `questiondeltime` int(11) DEFAULT NULL,
  PRIMARY KEY (`questionid`),
  KEY `questioncreatetime` (`questioncreatetime`),
  KEY `questiontype` (`questiontype`),
  KEY `questionstatus` (`questionstatus`),
  KEY `questionuserid` (`questionuserid`),
  KEY `questionparent` (`questionparent`,`questionsequence`),
  KEY `questionlevel` (`questionlevel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_questions
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_questype`
-- ----------------------------
DROP TABLE IF EXISTS `x2_questype`;
CREATE TABLE `x2_questype` (
  `questid` int(11) NOT NULL AUTO_INCREMENT,
  `questype` varchar(60) NOT NULL DEFAULT '',
  `questsort` int(1) NOT NULL DEFAULT '0',
  `questchoice` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`questid`),
  KEY `questchoice` (`questchoice`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_questype
-- ----------------------------
INSERT INTO `x2_questype` VALUES ('1', '单选题', '0', '1');
INSERT INTO `x2_questype` VALUES ('2', '多选题', '0', '2');
INSERT INTO `x2_questype` VALUES ('3', '判断题', '0', '4');
INSERT INTO `x2_questype` VALUES ('4', '定值填空', '0', '5');
INSERT INTO `x2_questype` VALUES ('5', '填空题', '1', '2');
INSERT INTO `x2_questype` VALUES ('6', '问答题', '1', '3');

-- ----------------------------
-- Table structure for `x2_record`
-- ----------------------------
DROP TABLE IF EXISTS `x2_record`;
CREATE TABLE `x2_record` (
  `recordid` int(11) NOT NULL AUTO_INCREMENT,
  `recordquestionid` int(11) NOT NULL DEFAULT '0',
  `recorduserid` int(11) NOT NULL DEFAULT '0',
  `recordquestion` text NOT NULL,
  `recordtime` int(11) NOT NULL DEFAULT '0',
  `recordsubjectid` int(11) NOT NULL DEFAULT '0',
  `recordknowsid` int(11) NOT NULL DEFAULT '0',
  `recordquestype` int(11) NOT NULL DEFAULT '0',
  `recordexamid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`recordid`),
  KEY `recordquestionid` (`recordquestionid`,`recorduserid`,`recordtime`),
  KEY `recordsubjectid` (`recordsubjectid`,`recordknowsid`,`recordquestype`),
  KEY `recordexamid` (`recordexamid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_record
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_reply`
-- ----------------------------
DROP TABLE IF EXISTS `x2_reply`;
CREATE TABLE `x2_reply` (
  `replyid` int(11) NOT NULL AUTO_INCREMENT,
  `replyuserid` int(11) NOT NULL DEFAULT '0',
  `replyusername` varchar(120) NOT NULL DEFAULT '',
  `replycommentid` int(11) NOT NULL DEFAULT '0',
  `replytime` int(11) NOT NULL DEFAULT '0',
  `replycontent` text NOT NULL,
  PRIMARY KEY (`replyid`),
  KEY `replyuserid` (`replyuserid`,`replycommentid`,`replytime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_reply
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_sections`
-- ----------------------------
DROP TABLE IF EXISTS `x2_sections`;
CREATE TABLE `x2_sections` (
  `sectionid` int(11) NOT NULL AUTO_INCREMENT,
  `section` varchar(120) NOT NULL DEFAULT '',
  `sectionsubjectid` int(11) NOT NULL DEFAULT '0',
  `sectiondescribe` text NOT NULL,
  PRIMARY KEY (`sectionid`),
  KEY `section` (`section`),
  KEY `sectionsubjectid` (`sectionsubjectid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_sections
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_seminar`
-- ----------------------------
DROP TABLE IF EXISTS `x2_seminar`;
CREATE TABLE `x2_seminar` (
  `seminarid` int(11) NOT NULL AUTO_INCREMENT,
  `seminartitle` varchar(240) NOT NULL DEFAULT '',
  `seminarcatid` int(11) NOT NULL DEFAULT '0',
  `seminarthumb` varchar(240) NOT NULL DEFAULT '',
  `seminargallery` tinytext NOT NULL,
  `seminartpl` varchar(120) NOT NULL DEFAULT '',
  `seminaruserid` int(11) NOT NULL DEFAULT '0',
  `seminarusername` varchar(120) NOT NULL DEFAULT '',
  `seminardescribe` text NOT NULL,
  `seminartime` int(11) NOT NULL DEFAULT '0',
  `seminarstatus` int(1) NOT NULL DEFAULT '0',
  `seminarsequence` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seminarid`),
  KEY `seminarcatid` (`seminarcatid`),
  KEY `seminarstatus` (`seminarstatus`),
  KEY `seminartime` (`seminartime`),
  KEY `seminarsequence` (`seminarsequence`),
  KEY `seminaruserid` (`seminaruserid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_seminar
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_session`
-- ----------------------------
DROP TABLE IF EXISTS `x2_session`;
CREATE TABLE `x2_session` (
  `sessionid` varchar(32) NOT NULL,
  `sessionuserid` int(11) NOT NULL DEFAULT '0',
  `sessionusername` varchar(120) NOT NULL DEFAULT '',
  `sessionpassword` varchar(32) NOT NULL DEFAULT '',
  `sessionip` varchar(24) NOT NULL DEFAULT '',
  `sessionmanage` tinyint(1) DEFAULT '0',
  `sessiongroupid` tinyint(4) NOT NULL DEFAULT '0',
  `sessioncurrent` varchar(16) NOT NULL DEFAULT '',
  `sessionrandcode` char(6) NOT NULL DEFAULT '',
  `sessionlogintime` int(11) NOT NULL DEFAULT '0',
  `sessiontimelimit` int(11) NOT NULL DEFAULT '0',
  `sessionlasttime` int(11) NOT NULL DEFAULT '0',
  `sessionmaster` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sessionid`),
  KEY `sessionlasttime` (`sessionlasttime`),
  KEY `sessioncurrent` (`sessioncurrent`),
  KEY `sessionmaster` (`sessionmaster`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_session
-- ----------------------------
INSERT INTO `x2_session` VALUES ('fi5lu89pgk3elhb577d3urqka2', '0', '', '', '127.0.0.1', '0', '0', '', '', '0', '0', '1531927237', '0');

-- ----------------------------
-- Table structure for `x2_special`
-- ----------------------------
DROP TABLE IF EXISTS `x2_special`;
CREATE TABLE `x2_special` (
  `specialid` int(11) NOT NULL AUTO_INCREMENT,
  `contentspecialid` int(11) NOT NULL DEFAULT '0',
  `contentcatid` int(11) NOT NULL DEFAULT '0',
  `contentmoduleid` int(11) NOT NULL DEFAULT '0',
  `contentuserid` int(11) NOT NULL DEFAULT '0',
  `contentusername` varchar(48) NOT NULL DEFAULT '',
  `contenttitle` varchar(240) NOT NULL DEFAULT '',
  `contentthumb` varchar(120) DEFAULT '',
  `contentlink` varchar(240) NOT NULL DEFAULT '',
  `contentinputtime` int(11) NOT NULL DEFAULT '0',
  `contentmodifytime` int(11) NOT NULL DEFAULT '0',
  `contentsequence` int(4) NOT NULL DEFAULT '0',
  `contentdescribe` text NOT NULL,
  `contentinfo` text NOT NULL,
  `contentstatus` int(2) NOT NULL DEFAULT '0',
  `contenttemplate` varchar(120) NOT NULL DEFAULT '',
  `contenttext` mediumtext NOT NULL,
  PRIMARY KEY (`specialid`),
  KEY `contentuserid` (`contentuserid`,`contentinputtime`,`contentmodifytime`,`contentsequence`),
  KEY `contentmoduleid` (`contentmoduleid`),
  KEY `contentcatid` (`contentcatid`),
  KEY `contentstatus` (`contentstatus`),
  KEY `contentspecialid` (`contentspecialid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_special
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_specialsort`
-- ----------------------------
DROP TABLE IF EXISTS `x2_specialsort`;
CREATE TABLE `x2_specialsort` (
  `sortid` int(11) NOT NULL AUTO_INCREMENT,
  `sorttitle` varchar(240) NOT NULL DEFAULT '',
  `sortthumb` varchar(120) NOT NULL DEFAULT '',
  `sorttpl` varchar(24) NOT NULL DEFAULT '',
  `sortseminarid` int(11) NOT NULL DEFAULT '0',
  `sortsequence` int(11) NOT NULL DEFAULT '0',
  `sortdescribe` text NOT NULL,
  PRIMARY KEY (`sortid`),
  KEY `sortseminarid` (`sortseminarid`,`sortsequence`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_specialsort
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_subject`
-- ----------------------------
DROP TABLE IF EXISTS `x2_subject`;
CREATE TABLE `x2_subject` (
  `subjectid` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(120) NOT NULL DEFAULT '',
  `subjectsetting` text NOT NULL,
  PRIMARY KEY (`subjectid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_subject
-- ----------------------------

-- ----------------------------
-- Table structure for `x2_user`
-- ----------------------------
DROP TABLE IF EXISTS `x2_user`;
CREATE TABLE `x2_user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `useropenid` varchar(48) NOT NULL,
  `username` varchar(60) NOT NULL DEFAULT '',
  `useremail` varchar(60) NOT NULL DEFAULT '',
  `userpassword` char(32) NOT NULL DEFAULT '',
  `usercoin` int(11) NOT NULL DEFAULT '0',
  `userregip` varchar(24) NOT NULL DEFAULT '',
  `userregtime` int(11) NOT NULL DEFAULT '0',
  `userlogtime` int(11) NOT NULL DEFAULT '0',
  `userverifytime` int(11) DEFAULT NULL,
  `usergroupid` tinyint(4) NOT NULL DEFAULT '0',
  `usermoduleid` int(11) NOT NULL DEFAULT '0',
  `manager_apps` varchar(240) NOT NULL,
  `usertruename` varchar(24) NOT NULL DEFAULT '',
  `normal_favor` varchar(250) NOT NULL DEFAULT '',
  `teacher_subjects` text NOT NULL,
  `userprofile` text NOT NULL,
  `userpassport` varchar(24) NOT NULL,
  `usergender` varchar(6) NOT NULL,
  `userphone` varchar(15) NOT NULL,
  `userdegree` varchar(48) NOT NULL,
  `useraddress` varchar(120) NOT NULL,
  `userphoto` varchar(240) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `useremail` (`useremail`),
  KEY `username` (`username`),
  KEY `module` (`usercoin`),
  KEY `userregtime` (`userregtime`),
  KEY `usermoduleid` (`usermoduleid`),
  KEY `userlogtime` (`userlogtime`),
  KEY `useropenid` (`useropenid`),
  KEY `userphone` (`userphone`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_user
-- ----------------------------
INSERT INTO `x2_user` VALUES ('1', '', 'peadmin', '958074@163.com', '244153a2599be7685c32d2281f57ae67', '208', '127.0.0.1', '1471795200', '0', null, '1', '0', 'a:5:{i:0;s:4:\"user\";i:1;s:7:\"content\";i:2;s:4:\"exam\";i:3;s:6:\"course\";i:4;s:4:\"bank\";}', 'test', '', '', '', '32123456783245678x', '男', '13456789234', '本科', '河南省郑州市管城区某地', '');
INSERT INTO `x2_user` VALUES ('2', '', '教师管理员', '958074@126.com', '96e79218965eb72c92a549dd5a330112', '98', '127.0.0.1', '1471795200', '0', null, '9', '0', '', '213123', '', 'a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}', '77777', '', '', '', '', '', '');
INSERT INTO `x2_user` VALUES ('3', '', 'aboboli', '', '96e79218965eb72c92a549dd5a330112', '0', '127.0.0.1', '1489046159', '0', null, '8', '0', '', '阿卜卜', '', '', '', '', '', '', '', '', '');
INSERT INTO `x2_user` VALUES ('4', '', 'wmlzjs', 'arris@qq.com', '30d3aee234b10c1e6a0eab1262ce917d', '0', '127.0.0.1', '1490184419', '0', null, '8', '0', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `x2_user` VALUES ('5', '', 'xiaodouya', 'xiaodouya@163.com', '96e79218965eb72c92a549dd5a330112', '0', '127.0.0.1', '1492619421', '0', null, '8', '0', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `x2_user` VALUES ('6', '', 'xiaoluobo', 'xiaoluobo@163.com', '96e79218965eb72c92a549dd5a330112', '0', '127.0.0.1', '1492619694', '0', null, '8', '0', '', '问题2', '', '', '', '', '', '', '', '', '');
INSERT INTO `x2_user` VALUES ('7', '', '18738317214', '410782198502140077', '96e79218965eb72c92a549dd5a330112', '0', '127.0.0.1', '1492670532', '0', null, '8', '0', '', '问题1', '', '', '', '', '', '', '', '', '');
INSERT INTO `x2_user` VALUES ('9', '', 'zzl', 'zzl@seactl.com', 'a73957f4597bf809a0282daaa1f428a3', '0', '127.0.0.1', '1494210327', '0', null, '8', '0', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `x2_user` VALUES ('10', '', 'chenhua', 'chenhua@seactrl.com', '814444127604540e1fba1e28ea85b181', '0', '127.0.0.1', '1494210327', '0', null, '8', '0', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `x2_user` VALUES ('11', '', 'lyx', 'lyx@seactrl.com', '24039cd1651b80de0570fddf3e5e6036', '0', '127.0.0.1', '1494210327', '0', null, '8', '0', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `x2_user` VALUES ('12', '', '2016101158', '2016101158@', '67dfff3cd681f933af2808bca96f0d84', '0', '127.0.0.1', '1522723493', '0', '0', '8', '0', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `x2_user` VALUES ('13', '', 'redrangon', '18738317214', 'd41d8cd98f00b204e9800998ecf8427e', '0', '127.0.0.1', '1523541071', '0', '0', '8', '0', '', '', '', '', '', '', '男', '', '', '', 'app/core/styles/img/noimage.gif');

-- ----------------------------
-- Table structure for `x2_user_group`
-- ----------------------------
DROP TABLE IF EXISTS `x2_user_group`;
CREATE TABLE `x2_user_group` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(60) NOT NULL DEFAULT '',
  `groupmoduleid` tinyint(4) NOT NULL DEFAULT '0',
  `groupdescribe` tinytext NOT NULL,
  `groupright` text NOT NULL,
  `groupmoduledefault` int(1) NOT NULL DEFAULT '0',
  `groupdefault` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `groupname` (`groupname`,`groupmoduleid`),
  KEY `groupmoduledefault` (`groupmoduledefault`),
  KEY `groupdefault` (`groupdefault`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of x2_user_group
-- ----------------------------
INSERT INTO `x2_user_group` VALUES ('1', '管理员', '1', '管理员', '', '1', '0');
INSERT INTO `x2_user_group` VALUES ('8', '普通用户', '9', '普通用户', '', '0', '1');
INSERT INTO `x2_user_group` VALUES ('9', '教师', '12', '教师', '', '0', '0');
