-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2018-03-15 16:04:55
-- 服务器版本： 5.7.17
-- PHP Version: 7.0.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phpems`
--

-- --------------------------------------------------------

--
-- 表的结构 `x2_app`
--

CREATE TABLE `x2_app` (
  `appid` varchar(24) NOT NULL,
  `appname` varchar(48) NOT NULL DEFAULT '',
  `appthumb` varchar(240) NOT NULL DEFAULT '',
  `appstatus` int(1) NOT NULL DEFAULT '0',
  `appsetting` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_app`
--

INSERT INTO `x2_app` (`appid`, `appname`, `appthumb`, `appstatus`, `appsetting`) VALUES
('user', '用户模块', 'files/attach/images/content/20130401/13647895355562.png.png', 1, 'a:6:{s:11:\"closeregist\";s:1:\"0\";s:9:\"registype\";s:1:\"0\";s:11:\"managemodel\";s:1:\"0\";s:10:\"loginmodel\";s:1:\"1\";s:9:\"regfields\";s:12:\"usertruename\";s:9:\"outfields\";s:12:\"usertruename\";}'),
('exam', '考试模块', '*value*', 1, 'a:1:{s:3:\"seo\";a:3:{s:5:\"title\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:11:\"description\";s:0:\"\";}}'),
('core', '模块管理', '*value*', 1, 'a:1:{s:3:\"seo\";a:3:{s:5:\"title\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:11:\"description\";s:0:\"\";}}'),
('document', '文件模块', '*value*', 1, ''),
('content', '内容模块', '*value*', 1, ''),
('item', '商品模块', '', 1, 'a:1:{s:3:\"seo\";a:3:{s:5:\"title\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:11:\"description\";s:0:\"\";}}'),
('bank', '财务模块', '*value*', 1, ''),
('edu', '教务模块', 'app/core/styles/images/noimage.gif', 1, ''),
('course', '课程模块', '*value*', 1, ''),
('demo', '试听中心', '', 1, 'a:1:{s:3:\"seo\";a:3:{s:5:\"title\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:11:\"description\";s:0:\"\";}}'),
('passport', '证书模块', 'app/core/styles/images/noimage.gif', 1, ''),
('certificate', '证书模块', 'app/core/styles/images/noimage.gif', 1, ''),
('docs', '文档模块', 'app/core/styles/images/noimage.gif', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `x2_area`
--

CREATE TABLE `x2_area` (
  `areaid` int(11) NOT NULL,
  `area` varchar(120) NOT NULL DEFAULT '',
  `areacode` int(12) NOT NULL DEFAULT '0',
  `arealevel` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_area`
--

INSERT INTO `x2_area` (`areaid`, `area`, `areacode`, `arealevel`) VALUES
(1, '全国', 1, 1),
(3, '河南', 373, 0),
(4, '北京', 10, 0),
(5, '陕西', 29, 0),
(6, '河北', 311, 0),
(7, '天津', 22, 0),
(8, '山东', 531, 0),
(9, '江苏', 25, 0),
(10, '湖北', 27, 0),
(11, '辽宁', 24, 0),
(12, '贵州', 851, 0),
(13, '北京春雪', 1001, 0),
(14, '云南', 871, 0),
(15, '四川', 28, 0),
(16, '安徽', 551, 0),
(17, '深圳', 755, 0),
(18, '吉林', 431, 0),
(19, '广东', 20, 0),
(20, '新疆', 991, 0),
(21, '广西', 771, 0),
(22, '福建', 591, 0),
(23, '湖南', 731, 0),
(24, '上海', 21, 0),
(25, '重庆', 23, 0),
(26, '江西', 791, 0),
(27, '浙江', 571, 0),
(28, '山西', 351, 0);

-- --------------------------------------------------------

--
-- 表的结构 `x2_attach`
--

CREATE TABLE `x2_attach` (
  `attid` int(11) NOT NULL,
  `attpath` varchar(240) NOT NULL DEFAULT '',
  `atttitle` varchar(240) NOT NULL DEFAULT '',
  `attext` varchar(12) NOT NULL DEFAULT '',
  `attinputtime` int(11) NOT NULL DEFAULT '0',
  `attsize` int(11) NOT NULL DEFAULT '0',
  `attmd5` varchar(32) NOT NULL DEFAULT '',
  `attuserid` int(11) NOT NULL DEFAULT '0',
  `attcntype` varchar(12) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_attach`
--

INSERT INTO `x2_attach` (`attid`, `attpath`, `atttitle`, `attext`, `attinputtime`, `attsize`, `attmd5`, `attuserid`, `attcntype`) VALUES
(43, 'files/attach/images/content/20180314/15210369877736.jpg', '0b55b319ebc4b745b19f82c1c4fc1e178b8215d9.jpg', 'jpg', 1521036987, 237440, '', 1, 'image/jpeg'),
(44, 'files/attach/images/content/20180314/15210370376103.jpg', '0b55b319ebc4b745b19f82c1c4fc1e178b8215d9.jpg', 'jpg', 1521037037, 237440, '', 1, 'image/jpeg'),
(45, 'files/attach/images/content/20180314/15210374469850.jpg', '14887045717597.jpg', 'jpg', 1521037446, 122364, '', 1, 'image/jpeg'),
(46, 'files/attach/images/content/20180314/15210375119234.jpg', '0b55b319ebc4b745b19f82c1c4fc1e178b8215d9.jpg', 'jpg', 1521037511, 237440, '', 1, 'image/jpeg');

-- --------------------------------------------------------

--
-- 表的结构 `x2_attachtype`
--

CREATE TABLE `x2_attachtype` (
  `atid` int(11) NOT NULL,
  `attachtype` varchar(120) NOT NULL,
  `attachexts` tinytext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_attachtype`
--

INSERT INTO `x2_attachtype` (`atid`, `attachtype`, `attachexts`) VALUES
(1, '图片', 'jpg,png,gif,bmp'),
(2, '音频', 'mp3'),
(3, '多媒体', 'flv,wmv,mp4,avi'),
(4, '批量导入文件', 'csv'),
(5, '文字类', 'pdf');

-- --------------------------------------------------------

--
-- 表的结构 `x2_basic`
--

CREATE TABLE `x2_basic` (
  `basicid` int(11) NOT NULL,
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
  `basicdescribe` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_basic`
--

INSERT INTO `x2_basic` (`basicid`, `basic`, `basicareaid`, `basicsubjectid`, `basicsection`, `basicknows`, `basicexam`, `basicapi`, `basicdemo`, `basicthumb`, `basicprice`, `basicclosed`, `basicdescribe`) VALUES
(1, '演示考场', 1, 1, 'a:1:{i:0;i:1;}', 'a:1:{i:1;a:1:{i:1;s:1:\"1\";}}', 'a:12:{s:9:\"rulemodel\";s:1:\"0\";s:5:\"model\";s:1:\"0\";s:14:\"changesequence\";s:1:\"0\";s:4:\"auto\";s:3:\"1,3\";s:12:\"autotemplate\";s:15:\"exampaper_paper\";s:4:\"self\";s:3:\"4,1\";s:12:\"selftemplate\";s:10:\"exam_paper\";s:8:\"opentime\";a:2:{s:5:\"start\";b:0;s:3:\"end\";b:0;}s:10:\"selectrule\";s:1:\"0\";s:10:\"examnumber\";s:1:\"0\";s:12:\"notviewscore\";s:1:\"0\";s:10:\"allowgroup\";s:0:\"\";}', '', 0, 'files/attach/images/content/20180314/15210369877736.jpg', '1:1', 0, '本考场为PHPEMS系统演示考场');

-- --------------------------------------------------------

--
-- 表的结构 `x2_block`
--

CREATE TABLE `x2_block` (
  `blockid` int(11) NOT NULL,
  `block` varchar(120) NOT NULL DEFAULT '',
  `blocktype` int(1) NOT NULL DEFAULT '0',
  `blockposition` varchar(120) NOT NULL DEFAULT '',
  `blockcontent` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_block`
--

INSERT INTO `x2_block` (`blockid`, `block`, `blocktype`, `blockposition`, `blockcontent`) VALUES
(1, '测试SQL', 3, '多处', 'a:8:{s:7:\"dbtable\";s:4:\"user\";s:5:\"query\";s:60:\"AND|usergroupid=:usergroupid|usergroupid|v:_user[\\\'userid\\\']\";s:5:\"order\";s:0:\"\";s:5:\"limit\";a:2:{i:0;s:1:\"0\";i:1;s:1:\"5\";}s:3:\"sql\";s:0:\"\";s:5:\"index\";s:0:\"\";s:6:\"serial\";s:0:\"\";s:8:\"template\";s:31:\"{x2;eval: print_r(v:blockdata)}\";}'),
(2, 'sadsa', 1, 'asdsad', 'a:1:{s:7:\"content\";s:40:\"&lt;p&gt;asdsadsadasdasdasdasd&lt;/p&gt;\";}');

-- --------------------------------------------------------

--
-- 表的结构 `x2_book`
--

CREATE TABLE `x2_book` (
  `bookid` int(11) NOT NULL,
  `bookcontent` text CHARACTER SET latin1 NOT NULL,
  `bookopenid` varchar(48) CHARACTER SET latin1 NOT NULL,
  `booktime` int(11) NOT NULL,
  `bookuserid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `x2_category`
--

CREATE TABLE `x2_category` (
  `catid` int(11) NOT NULL,
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
  `catsubject` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_category`
--

INSERT INTO `x2_category` (`catid`, `catapp`, `catlite`, `catname`, `catimg`, `caturl`, `catuseurl`, `catparent`, `catdes`, `cattpl`, `catmanager`, `catinmenu`, `catindex`, `catsubject`) VALUES
(1, 'content', 0, '考试信息', 'files/attach/images/content/20160630/14672817197914.jpg', '', 0, 0, '', 'category_default', 'a:2:{s:8:\"pubusers\";s:0:\"\";s:9:\"pubgroups\";s:0:\"\";}', 1, 1, 1),
(2, 'content', 0, '首页头图', 'files/attach/images/content/20160630/14672817455479.jpg', '', 0, 0, '', 'category_default', 'a:2:{s:8:\"pubusers\";s:0:\"\";s:9:\"pubgroups\";s:0:\"\";}', 1, 100, 1),
(3, 'content', 0, '考试资料', 'files/attach/images/content/20160630/14672817048286.jpg', '', 0, 0, '', 'category_default', 'a:2:{s:8:\"pubusers\";s:0:\"\";s:9:\"pubgroups\";s:0:\"\";}', 1, 5, 1),
(4, 'content', 0, '帮助信息', 'files/attach/images/content/20160630/14672817317018.jpg', '', 0, 0, '&lt;h1 class=&quot;wikititle&quot;&gt;区委区为企鹅&lt;/h1&gt;\r\n\r\n&lt;h2 class=&quot;wikititle&quot;&gt;这是一个什么段落&lt;/h2&gt;', 'category_default', 'a:2:{s:8:\"pubusers\";s:0:\"\";s:9:\"pubgroups\";s:0:\"\";}', 0, 5, 1),
(5, 'course', 0, '会计基础', 'files/attach/images/content/20160630/14672924624115.jpg', '', 0, 0, '', 'category_default', 'a:2:{s:8:\"pubusers\";s:0:\"\";s:9:\"pubgroups\";s:0:\"\";}', 0, 10, 0),
(11, 'content', 0, '二级分类', 'app/core/styles/images/noimage.gif', '', 0, 4, '', 'category_default', 'a:2:{s:8:\\\"pubusers\\\";s:0:\\\"\\\";s:9:\\\"pubgroups\\\";s:0:\\\"\\\";}', 0, 0, 0),
(12, 'docs', 0, '人物', 'app/core/styles/images/noimage.gif', '', 0, 0, '', 'category_default', 'a:2:{s:8:\\\"pubusers\\\";s:0:\\\"\\\";s:9:\\\"pubgroups\\\";s:0:\\\"\\\";}', 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `x2_cequeue`
--

CREATE TABLE `x2_cequeue` (
  `ceqid` int(11) NOT NULL,
  `ceqceid` int(11) NOT NULL,
  `cequserid` int(11) NOT NULL,
  `ceqinfo` text NOT NULL,
  `ceqtime` int(11) NOT NULL,
  `ceqstatus` tinyint(1) NOT NULL,
  `ceqordersn` varchar(48) DEFAULT NULL,
  `ceqpubtime` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_cequeue`
--

INSERT INTO `x2_cequeue` (`ceqid`, `ceqceid`, `cequserid`, `ceqinfo`, `ceqtime`, `ceqstatus`, `ceqordersn`, `ceqpubtime`) VALUES
(1, 1, 1, 'a:7:{s:8:\"username\";s:7:\"peadmin\";s:5:\"photo\";s:55:\"files/attach/images/content/20170717/15002573305180.png\";s:12:\"usertruename\";s:4:\"test\";s:7:\"usersex\";N;s:10:\"userdegree\";N;s:9:\"userphone\";N;s:11:\"useraddress\";N;}', 1514358059, 0, '', NULL),
(2, 1, 1, 'a:7:{s:8:\"username\";s:7:\"peadmin\";s:5:\"photo\";s:55:\"files/attach/images/content/20170717/15002573305180.png\";s:12:\"usertruename\";s:4:\"test\";s:7:\"usersex\";N;s:10:\"userdegree\";N;s:9:\"userphone\";N;s:11:\"useraddress\";N;}', 1514358861, 0, '', NULL),
(3, 1, 1, 'a:7:{s:8:\"username\";s:7:\"peadmin\";s:5:\"photo\";s:55:\"files/attach/images/content/20170717/15002573305180.png\";s:12:\"usertruename\";s:4:\"test\";s:7:\"usersex\";N;s:10:\"userdegree\";N;s:9:\"userphone\";N;s:11:\"useraddress\";N;}', 1514358875, 2, '', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `x2_certificate`
--

CREATE TABLE `x2_certificate` (
  `ceid` int(11) NOT NULL,
  `cetitle` varchar(72) NOT NULL,
  `cethumb` varchar(120) DEFAULT NULL,
  `ceprice` decimal(10,2) NOT NULL,
  `cebasic` int(11) DEFAULT NULL,
  `cetime` int(11) DEFAULT NULL,
  `cedescribe` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_certificate`
--

INSERT INTO `x2_certificate` (`ceid`, `cetitle`, `cethumb`, `ceprice`, `cebasic`, `cetime`, `cedescribe`) VALUES
(1, '会计资格证', 'files/attach/images/content/20170912/15051466611226.jpg', '1.00', 1, 1506817500, '&lt;p&gt;会计资格证&lt;/p&gt;'),
(2, '教师资格证', 'files/attach/images/content/20170912/15051474405023.jpg', '500.00', NULL, 1505147429, '&lt;p&gt;教师资格证&lt;/p&gt;'),
(3, '2222', 'app/core/styles/images/noimage.gif', '1.00', 1, 1514867919, '&lt;p&gt;1&lt;/p&gt;');

-- --------------------------------------------------------

--
-- 表的结构 `x2_comment`
--

CREATE TABLE `x2_comment` (
  `cmtid` int(11) NOT NULL,
  `cmtopenid` varchar(48) NOT NULL DEFAULT '',
  `cmtuserid` int(11) NOT NULL,
  `cmtreply` text NOT NULL,
  `cmtcontent` text NOT NULL,
  `cmttime` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_comment`
--

INSERT INTO `x2_comment` (`cmtid`, `cmtopenid`, `cmtuserid`, `cmtreply`, `cmtcontent`, `cmttime`) VALUES
(3, 'openid1234567890', 1, '小白菜真可爱', '我是一个可爱的小白菜', 1479089640);

-- --------------------------------------------------------

--
-- 表的结构 `x2_config`
--

CREATE TABLE `x2_config` (
  `cfgapp` varchar(36) NOT NULL,
  `cfgsetting` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `x2_consumelog`
--

CREATE TABLE `x2_consumelog` (
  `conlid` int(11) NOT NULL,
  `conlcost` int(11) NOT NULL,
  `conluserid` int(11) NOT NULL,
  `conlinfo` varchar(120) NOT NULL,
  `conltype` int(4) NOT NULL,
  `conltime` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_consumelog`
--

INSERT INTO `x2_consumelog` (`conlid`, `conlcost`, `conluserid`, `conlinfo`, `conltype`, `conltime`) VALUES
(1, 10, 1, '开通课程会计基础(ID1)', 1, 1503617732),
(2, 1, 1, '开通考场演示考场(ID1)', 1, 1503617885);

-- --------------------------------------------------------

--
-- 表的结构 `x2_content`
--

CREATE TABLE `x2_content` (
  `contentid` int(11) NOT NULL,
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
  `demo` varchar(240) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_content`
--

INSERT INTO `x2_content` (`contentid`, `contentcatid`, `contentmoduleid`, `contentuserid`, `contentusername`, `contenttitle`, `contentthumb`, `contentlink`, `contentinputtime`, `contentmodifytime`, `contentsequence`, `contentdescribe`, `contentinfo`, `contentstatus`, `contenttemplate`, `contenttext`, `cizhuan_guige`, `cizhuan_brand`, `cizhuan_thumb`, `tester`, `demo`) VALUES
(56, 2, 4, 1, 'peadmin', '首页BANNER', 'files/attach/images/content/20180314/15210374469850.jpg', '', 1521037249, 0, 0, '', '', 0, 'content_default', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `x2_coupon`
--

CREATE TABLE `x2_coupon` (
  `couponsn` varchar(16) NOT NULL,
  `couponvalue` int(11) NOT NULL DEFAULT '0',
  `couponstatus` int(1) NOT NULL DEFAULT '0',
  `couponaddtime` int(11) NOT NULL DEFAULT '0',
  `couponendtime` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `x2_course`
--

CREATE TABLE `x2_course` (
  `courseid` int(11) NOT NULL,
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
  `coursepasstime` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_course`
--

INSERT INTO `x2_course` (`courseid`, `coursetitle`, `coursemoduleid`, `coursecsid`, `coursethumb`, `courseuserid`, `courseinputtime`, `coursemodifytime`, `coursesequence`, `coursedescribe`, `course_files`, `course_oggfile`, `course_webmfile`, `course_youtu`, `pdf_file`, `coursepasstime`) VALUES
(1, '第一节', 14, 1, 'files/attach/images/content/20170304/14885942847445.jpg', 1, 1467215744, 1521038142, 0, '&lt;p&gt;测试内容&lt;/p&gt;', '', '', '', '', '', 0),
(2, '第二节', 14, 1, 'files/attach/images/content/20170304/14885948427581.jpg', 1, 1467262651, 1521038104, 0, '', '', '', '', '', '', 0),
(7, '第三节', 15, 1, 'files/attach/images/content/20170824/15035606706798.png', 1, 1503560761, 1521038098, 0, '&lt;p&gt;课件&lt;/p&gt;', '', '', '', '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `x2_coursesubject`
--

CREATE TABLE `x2_coursesubject` (
  `csid` int(11) NOT NULL,
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
  `csprice` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_coursesubject`
--

INSERT INTO `x2_coursesubject` (`csid`, `cstitle`, `cscatid`, `csuserid`, `csbasicid`, `cssubjectid`, `cstime`, `csthumb`, `cssequence`, `csdescribe`, `csdemo`, `csprice`) VALUES
(1, '会计基础', 5, 1, 1, 1, 1467214449, 'files/attach/images/content/20180314/15210370376103.jpg', 0, '会计基础', 1, '10:10');

-- --------------------------------------------------------

--
-- 表的结构 `x2_dayexam`
--

CREATE TABLE `x2_dayexam` (
  `deid` int(11) NOT NULL,
  `deday` varchar(12) DEFAULT NULL,
  `deexamid` int(11) DEFAULT NULL,
  `deinfo` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `x2_dochistory`
--

CREATE TABLE `x2_dochistory` (
  `dhid` int(11) NOT NULL,
  `dhdocid` int(11) DEFAULT NULL,
  `dhtitle` varchar(240) DEFAULT NULL,
  `dhcontent` text NOT NULL,
  `dhtime` int(11) NOT NULL,
  `dhusername` varchar(72) DEFAULT NULL,
  `dhstatus` tinyint(4) NOT NULL,
  `dhtop` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_dochistory`
--

INSERT INTO `x2_dochistory` (`dhid`, `dhdocid`, `dhtitle`, `dhcontent`, `dhtime`, `dhusername`, `dhstatus`, `dhtop`) VALUES
(6, 2, '背景段落调整', '&lt;p&gt;《1787宪法》是美国1787年制定并于1789年批准生效的美利坚合众国联邦宪法，也是世界上第一部比较完整的资产阶级成文宪法。它奠定了美国政治制度的法律基础，制定后多年来附有27条修正案，迄今继续生效。1787年宪法强调加强国家权利,又在权利结构中突出&amp;ldquo;分权与制衡&amp;rdquo;的原则,以避免权力过于集中,体现了一定的民主精神。其内容是：立法、司法与行政权三权分立。分权制衡的核心精神在于权力平衡。其学说来自洛克和孟德斯鸠等人，美国人把思想、理论转变为行动、实践。政府结构必须能使各部门之间有适当的控制和平衡。使权力为公众福利和正义目的有效行使其管理职能，同时又保持对权力的优良控制，实现公共权力与公民权利的平衡，管理与控权的动态平衡，是分权和制约的归宿。通过分权、制约最终达到平衡，是宪政的最终目标。&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://127.0.0.1/phpems/files/attach/files/content/20180114/15159383851238.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;1787年宪法不仅对美国的政治和经济的发展有促进作用，而且对当今世界其他很多国家的民主与法制建设都有借鉴意义。&lt;/p&gt;\r\n\r\n&lt;h1 class=&quot;wikititle&quot; id=&quot;wkth_06227281713964983&quot;&gt;历程&lt;/h1&gt;\r\n\r\n&lt;h2 class=&quot;wikititle&quot; id=&quot;wkth_16193192912452403&quot;&gt;背景&lt;/h2&gt;\r\n\r\n&lt;p&gt;美国独立战争后，建立起来邦联制的国家，政治上的松散状态无法形成强有力的中央政府来稳定统治秩序，保护国家的利益与主权。面临既要加强中央集权，又要确保共和制的新问题。&lt;/p&gt;\r\n\r\n&lt;p&gt;1786年的谢司起义，使联邦制的统治者迫切要求强化资产阶级权利，完善资产阶级统治制度。&lt;/p&gt;\r\n\r\n&lt;h2 class=&quot;wikititle&quot; id=&quot;wkth_18527449253901063&quot;&gt;制定&lt;/h2&gt;\r\n\r\n&lt;p&gt;1777年大陆会议制定的并于1781年批准施行的《邦联条例》规定，由当时13个独立州组成邦联制国家。邦联政府的权限很小，不能有效地行使国家职权。鉴此，邦联国会于1787年2月邀请各州代表到费城召开制宪会议,修改《邦联条例》。&lt;/p&gt;\r\n\r\n&lt;p&gt;5月召开会议,出席的有12个州（罗得岛州除外）的55名代表，G.华盛顿任主席。主张废除《邦联条例》、重新制定新宪法的代表占优势，使这次会议成了全国制宪会议。出席会议的大都是资产阶级和种植园奴隶主的代表，由于利益不同，大州与小州之间又存在着矛盾。&lt;/p&gt;\r\n\r\n&lt;p&gt;经过长时间的秘密讨论，直至1787年9月17日才通过新的宪法草案,交由各州批准。全国围绕新宪法的批准问题展开广泛的激烈讨论。1789年3月4日召开的美国第1届联邦国会宣布《美利坚合众国宪法》正式生效。&lt;/p&gt;\r\n\r\n&lt;h1 class=&quot;wikititle&quot; id=&quot;wkth_8375784936343371&quot;&gt;全文&lt;/h1&gt;\r\n\r\n&lt;h2 class=&quot;wikititle&quot; id=&quot;wkth_5916713470541723&quot;&gt;英文全文&lt;/h2&gt;\r\n\r\n&lt;p&gt;THE CONSTITUTION OF THE UNITED STATES OF AMERICA&lt;/p&gt;\r\n\r\n&lt;p&gt;March 4, 1789&lt;/p&gt;\r\n\r\n&lt;p&gt;Preamble&lt;/p&gt;\r\n\r\n&lt;p&gt;We the people of the United States, in order to form a more perfect union, establish justice, insure domestic tranquility, provide for the common defense, promote the general welfare, and secure the blessings of liberty to ourselves and our posterity, do ordain and establish this Constitution for the United States of America.&lt;/p&gt;\r\n\r\n&lt;p&gt;Article I&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 1.&lt;/p&gt;\r\n\r\n&lt;p&gt;All legislative powers herein granted shall be vested in a Congress of the United States, which shall consist of a Senate and House of Representatives.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 2.&lt;/p&gt;\r\n\r\n&lt;p&gt;The House of Representatives shall be composed of members chosen every second year by the people of the several states, and the electors in each state shall have the qualifications requisite for electors of the most numerous branch of the state legislature.&lt;/p&gt;\r\n\r\n&lt;p&gt;No person shall be a Representative who shall not have attained to the age of twenty five years, and been seven years a citizen of the United States, and who shall not, when elected, be an inhabitant of that state in which he shall be chosen.&lt;/p&gt;\r\n\r\n&lt;p&gt;Representatives and direct taxes shall be apportioned among the several states which may be included within this union, according to their respective numbers, which shall be determined by adding to the whole number of free persons, including those bound to service for a term of years, and excluding Indians not taxed, three fifths of all other Persons. The actual Enumeration shall be made within three years after the first meeting of the Congress of the United States, and within every subsequent term of ten years, in such manner as they shall by law direct. The number of Representatives shall not exceed one for every thirty thousand, but each state shall have at least one Representative； and until such enumeration shall be made, the state of New Hampshire shall be entitled to choose three, Massachusetts eight, Rhode Island and Providence Plantations one, Connecticut five, New York six, New Jersey four, Pennsylvania eight, Delaware one, Maryland six, Virginia ten, North Carolina five, South Carolina five, and Georgia three.&lt;/p&gt;\r\n\r\n&lt;p&gt;When vacancies happen in the Representation from any state, the executive authority thereof shall issue writs of election to fill such vacancies.&lt;/p&gt;\r\n\r\n&lt;p&gt;The House of Representatives shall choose their speaker and other officers； and shall have the sole power of impeachment.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 3.&lt;/p&gt;\r\n\r\n&lt;p&gt;The Senate of the United States shall be composed of two Senators from each state, chosen by the legislature thereof, for six years； and each Senator shall have one vote.Immediately after they shall be assembled in consequence of the first election, they shall be divided as equally as may be into three classes. The seats of the Senators of the first class shall be vacated at the expiration of the second year, of the second class at the expiration of the fourth year, and the third class at the expiration of the sixth year, so that one third may be chosen every second year； and if vacancies happen by resignation, or otherwise, during the recess of the legislature of any state, the executive thereof may make temporary appointments until the next meeting of the legislature, which shall then fill such vacancies.&lt;/p&gt;\r\n\r\n&lt;p&gt;No person shall be a Senator who shall not have attained to the age of thirty years, and been nine years a citizen of the United States and who shall not, when elected, be an inhabitant of that state for which he shall be chosen.&lt;br /&gt;\r\nThe Vice President of the United States shall be President of the Senate, but shall have no vote, unless they be equally divided.&lt;br /&gt;\r\nThe Senate shall choose their other officers, and also a President pro tempore, in the absence of the Vice President, or when he shall exercise the office of President of the United States.&lt;/p&gt;\r\n\r\n&lt;p&gt;The Senate shall have the sole power to try all impeachments. When sitting for that purpose, they shall be on oath or affirmation. When the President of the United States is tried, the Chief Justice shall preside: And no person shall be convicted without the concurrence of two thirds of the members present.&lt;/p&gt;\r\n\r\n&lt;p&gt;Judgment in cases of impeachment shall not extend further than to removal from office, and disqualification to hold and enjoy any office of honor, trust or profit under the United States: but the party convicted shall nevertheless be liable and subject to indictment, trial, judgment and punishment, according to law.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 4.&lt;/p&gt;\r\n\r\n&lt;p&gt;The times, places and manner of holding elections for Senators and Representatives, shall be prescribed in each state by the legislature thereof； but the Congress may at any time by law make or alter such regulations, except as to the places of choosing Senators.&lt;/p&gt;\r\n\r\n&lt;p&gt;The Congress shall assemble at least once in every year, and such meeting shall be on the first Monday in December, unless they shall by law appoint a different day.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 5.&lt;/p&gt;\r\n\r\n&lt;p&gt;Each House shall be the judge of the elections, returns and qualifications of its own members, and a majority of each shall constitute a quorum to do business； but a smaller number may adjourn from day to day, and may be authorized to compel the attendance of absent members, in such manner, and under such penalties as each House may provide.&lt;br /&gt;\r\nEach House may determine the rules of its proceedings, punish its members for disorderly behavior, and, with the concurrence of two thirds, expel a member.&lt;/p&gt;\r\n\r\n&lt;p&gt;Each House shall keep a journal of its proceedings, and from time to time publish the same, excepting such parts as may in their judgment require secrecy； and the yeas and nays of the members of either House on any question shall, at the desire of one fifth of those present, be entered on the journal.&lt;/p&gt;\r\n\r\n&lt;p&gt;Neither House, during the session of Congress, shall, without the consent of the other, adjourn for more than three days, nor to any other place than that in which the two Houses shall be sitting.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 6.&lt;/p&gt;\r\n\r\n&lt;p&gt;The Senators and Representatives shall receive a compensation for their services, to be ascertained by law, and paid out of the treasury of the United States. They shall in all cases, except treason, felony and breach of the peace, be privileged from arrest during their attendance at the session of their respective Houses, and in going to and returning from the same； and for any speech or debate in either House, they shall not be questioned in any other place.&lt;/p&gt;\r\n\r\n&lt;p&gt;No Senator or Representative shall, during the time for which he was elected, be appointed to any civil office under the authority of the United States, which shall have been created, or the emoluments whereof shall have been increased during such time； and no person holding any office under the United States, shall be a member of either House during his continuance in office.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 7.&lt;/p&gt;\r\n\r\n&lt;p&gt;All bills for raising revenue shall originate in the House of Representatives； but the Senate may propose or concur with amendments as on other Bills.&lt;/p&gt;\r\n\r\n&lt;p&gt;Every bill which shall have passed the House of Representatives and the Senate, shall, before it become a law, be presented to the President of the United States； if he approve he shall sign it, but if not he shall return it, with his objections to that House in which it shall have originated, who shall enter the objections at large on their journal, and proceed to reconsider it. If after such reconsideration two thirds of that House shall agree to pass the bill, it shall be sent, together with the objections, to the other House, by which it shall likewise be reconsidered, and if approved by two thirds of that House, it shall become a law. But in all such cases the votes of both Houses shall be determined by yeas and nays, and the names of the persons voting for and against the bill shall be entered on the journal of each House respectively. If any bill shall not be returned by the President within ten days (Sundays excepted) after it shall have been presented to him, the same shall be a law, in like manner as if he had signed it, unless the Congress by their adjournment prevent its return, in which case it shall not be a law.&lt;/p&gt;\r\n\r\n&lt;p&gt;Every order, resolution, or vote to which the concurrence of the Senate and House of Representatives may be necessary (except on a question of adjournment) shall be presented to the President of the United States； and before the same shall take effect, shall be approved by him, or being disapproved by him, shall be repassed by two thirds of the Senate and House of Representatives, according to the rules and limitations prescribed in the case of a bill.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 8.&lt;/p&gt;\r\n\r\n&lt;p&gt;The Congress shall have power to lay and collect taxes, duties, imposts and excises, to pay the debts and provide for the common defense and general welfare of the United States； but all duties, imposts and excises shall be uniform throughout the United States；&lt;/p&gt;\r\n\r\n&lt;p&gt;To borrow money on the credit of the United States；&lt;/p&gt;\r\n\r\n&lt;p&gt;To regulate commerce with foreign nations, and among the several states, and with the Indian tribes；&lt;/p&gt;\r\n\r\n&lt;p&gt;To establish a uniform rule of naturalization, and uniform laws on the subject of bankruptcies throughout the United States；&lt;/p&gt;\r\n\r\n&lt;p&gt;To coin money, regulate the value thereof, and of foreign coin, and fix the standard of weights and measures；&lt;/p&gt;\r\n\r\n&lt;p&gt;To provide for the punishment of counterfeiting the securities and current coin of the United States；&lt;/p&gt;\r\n\r\n&lt;p&gt;To establish post offices and post roads；&lt;/p&gt;\r\n\r\n&lt;p&gt;To promote the progress of science and useful arts, by securing for limited times to authors and inventors the exclusive right to their respective writings and discoveries；&lt;/p&gt;\r\n\r\n&lt;p&gt;To constitute tribunals inferior to the Supreme Court；&lt;/p&gt;\r\n\r\n&lt;p&gt;To define and punish piracies and felonies committed on the high seas, and offenses against the law of nations；&lt;/p&gt;\r\n\r\n&lt;p&gt;To declare war, grant letters of marque and reprisal, and make rules concerning captures on land and water；&lt;/p&gt;\r\n\r\n&lt;p&gt;To raise and support armies, but no appropriation of money to that use shall be for a longer term than two years；&lt;/p&gt;\r\n\r\n&lt;p&gt;To provide and maintain a navy；&lt;/p&gt;\r\n\r\n&lt;p&gt;To make rules for the government and regulation of the land and naval forces；&lt;/p&gt;\r\n\r\n&lt;p&gt;To provide for calling forth the militia to execute the laws of the union, suppress insurrections and repel invasions；&lt;/p&gt;\r\n\r\n&lt;p&gt;To provide for organizing, arming, and disciplining, the militia, and for governing such part of them as may be employed in the service of the United States, reserving to the states respectively, the appointment of the officers, and the authority of training the militia according to the discipline prescribed by Congress；&lt;/p&gt;\r\n\r\n&lt;p&gt;To exercise exclusive legislation in all cases whatsoever, over such District (not exceeding ten miles square) as may, by cession of particular states, and the acceptance of Congress, become the seat of the government of the United States, and to exercise like authority over all places purchased by the consent of the legislature of the state in which the same shall be, for the erection of forts, magazines, arsenals, dockyards, and other needful buildings；&lt;/p&gt;\r\n\r\n&lt;p&gt;To make all laws which shall be necessary and proper for carrying into execution the foregoing powers, and all other powers vested by this Constitution in the government of the United States, or in any department or officer thereof.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 9.&lt;/p&gt;\r\n\r\n&lt;p&gt;The migration or importation of such persons as any of the states now existing shall think proper to admit, shall not be prohibited by the Congress prior to the year one thousand eight hundred and eight, but a tax or duty may be imposed on such importation, not exceeding ten dollars for each person.&lt;/p&gt;\r\n\r\n&lt;p&gt;The privilege of the writ of habeas corpus shall not be suspended, unless when in cases of rebellion or invasion the public safety may require it.&lt;/p&gt;\r\n\r\n&lt;p&gt;No bill of attainder or ex post facto Law shall be passed.&lt;/p&gt;\r\n\r\n&lt;p&gt;No capitation, or other direct, tax shall be laid, unless in proportion to the census or enumeration herein before directed to be taken.&lt;/p&gt;\r\n\r\n&lt;p&gt;No tax or duty shall be laid on articles exported from any state.&lt;/p&gt;\r\n\r\n&lt;p&gt;No preference shall be given by any regulation of commerce or revenue to the ports of one state over those of another: nor shall vessels bound to, or from, one state, be obliged to enter, clear or pay duties in another.&lt;/p&gt;\r\n\r\n&lt;p&gt;No money shall be drawn from the treasury, but in consequence of appropriations made by law； and a regular statement and account of receipts and expenditures of all public money shall be published from time to time.&lt;/p&gt;\r\n\r\n&lt;p&gt;No title of nobility shall be granted by the United States: and no person holding any office of profit or trust under them, shall, without the consent of the Congress, accept of any present, emolument, office, or title, of any kind whatever, from any king, prince, or foreign state.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 10.&lt;/p&gt;\r\n\r\n&lt;p&gt;No state shall enter into any treaty, alliance, or confederation； grant letters of marque and reprisal； coin money； emit bills of credit； make anything but gold and silver coin a tender in payment of debts； pass any bill of attainder, ex post facto law, or law impairing the obligation of contracts, or grant any title of nobility.&lt;/p&gt;\r\n\r\n&lt;p&gt;No state shall, without the consent of the Congress, lay any imposts or duties on imports or exports, except what may be absolutely necessary for executing it s inspection laws: and the net produce of all duties and imposts, laid by any state on imports or exports, shall be for the use of the treasury of the United States； and all such laws shall be subject to the revision and control of the Congress.&lt;/p&gt;\r\n\r\n&lt;p&gt;No state shall, without the consent of Congress, lay any duty of tonnage, keep troops, or ships of war in time of peace, enter into any agreement or compact with another state, or with a foreign power, or engage in war, unless actually invaded, or in such imminent danger as will not admit of delay.&lt;/p&gt;\r\n\r\n&lt;p&gt;Article II&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 1.&lt;/p&gt;\r\n\r\n&lt;p&gt;The executive power shall be vested in a President of the United States of America. He shall hold his office during the term of four years, and, together with the Vice President, chosen for the same term, be elected, as follows:&lt;/p&gt;\r\n\r\n&lt;p&gt;Each state shall appoint, in such manner as the Legislature thereof may direct, a number of electors, equal to the whole number of Senators and Representatives to which the State may be entitled in the Congress: but no Senator or Representative, or person holding an office of trust or profit under the United States, shall be appointed an elector.&lt;/p&gt;\r\n\r\n&lt;p&gt;The electors shall meet in their respective states, and vote by ballot for two persons, of whom one at least shall not be an inhabitant of the same state with themselves. And they shall make a list of all the persons voted for, and of the number of votes for each； which list they shall sign and certify, and transmit sealed to the seat of the government of the United States, directed to the President of the Senate. The President of the Senate shall, in the presence of the Senate and House of Representatives, open all the certificates, and the votes shall then be counted. The person having the greatest number of votes shall be the President, if such number be a majority of the whole number of electors appointed； and if there be more than one who have such majority, and have an equal number of votes, then the House of Representatives shall immediately choose by ballot one of them for President； and if no person have a majority, then from the five highest on the list the said House shall in like manner choose the President. But in choosing the President, the votes shall be taken by States, the representation from each state having one vote； A quorum for this purpose shall consist of a member or members from two thirds of the states, and a majority of all the states shall be necessary to a choice. In every case, after the choice of the President, the person having the greatest number of votes of the electors shall be the Vice President. But if there should remain two or more who have equal votes, the Senate shall choose from them by ballot the Vice President.&lt;/p&gt;\r\n\r\n&lt;p&gt;The Congress may determine the time of choosing the electors, and the day on which they shall give their votes； which day shall be the same throughout the United States.&lt;/p&gt;\r\n\r\n&lt;p&gt;No person except a natural born citizen, or a citizen of the United States, at the time of the adoption of this Constitution, shall be eligible to the office of President； neither shall any person be eligible to that office who shall not have attained to the age of thirty five years, and been fourteen Years a resident within the United States.&lt;/p&gt;\r\n\r\n&lt;p&gt;In case of the removal of the President from office, or of his death, resignation, or inability to discharge the powers and duties of the said office, the same shall devolve on the Vice President, and the Congress may by law provide for the case of removal, death, resignation or inability, both of the President and Vice President, declaring what officer shall then act as President, and such officer shall act accordingly, until the disability be removed, or a President shall be elected.&lt;/p&gt;\r\n\r\n&lt;p&gt;The President shall, at stated times, receive for his services, a compensation, which shall neither be increased nor diminished during the period for which he shall have been elected, and he shall not receive within that period any other emolument from the United States, or any of them.&lt;/p&gt;\r\n\r\n&lt;p&gt;Before he enter on the execution of his office, he shall take the following oath or affirmation:--&amp;quot;I do solemnly swear (or affirm) that I will faithfully execute the office of President of the United States, and will to the best of my ability, preserve, protect and defend the Constitution of the United States.&amp;quot;&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 2.&lt;/p&gt;\r\n\r\n&lt;p&gt;The President shall be commander in chief of the Army and Navy of the United States, and of the militia of the several states, when called into the actual service of the United States； he may require the opinion, in writing, of the principal officer in each of the executive departments, upon any subject relating to the duties of their respective offices, and he shall have power to grant reprieves and pardons for offenses against the United States, except in cases of impeachment.&lt;/p&gt;\r\n\r\n&lt;p&gt;He shall have power, by and with the advice and consent of the Senate, to make treaties, provided two thirds of the Senators present concur； and he shall nominate, and by and with the advice and consent of the Senate, shall appoint ambassadors, other public ministers and consuls, judges of the Supreme Court, and all other officers of the United States, whose appointments are not herein otherwise provided for, and which shall be established by law: but the Congress may by law vest the appointment of such inferior officers, as they think proper, in the President alone, in the courts of law, or in the heads of departments.&lt;/p&gt;\r\n\r\n&lt;p&gt;The President shall have power to fill up all vacancies that may happen during the recess of the Senate, by granting commissions which shall expire at the end of their next session.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 3.&lt;/p&gt;\r\n\r\n&lt;p&gt;He shall from time to time give to the Congress information of the state of the union, and recommend to their consideration such measures as he shall judge necessary and expedient； he may, on extraordinary occasions, convene both Houses, or either of them, and in case of disagreement between them, with respect to the time of adjournment, he may adjourn them to such time as he shall think proper； he shall receive ambassadors and other public ministers； he shall take care that the laws be faithfully executed, and shall commission all the officers of the United States.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 4.&lt;/p&gt;\r\n\r\n&lt;p&gt;The President, Vice President and all civil officers of the United States, shall be removed from office on impeachment for, and conviction of, treason, bribery, or other high crimes and misdemeanors.&lt;/p&gt;\r\n\r\n&lt;p&gt;Article III&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 1.&lt;/p&gt;\r\n\r\n&lt;p&gt;The judicial power of the United States, shall be vested in one Supreme Court, and in such inferior courts as the Congress may from time to time ordain and establish. The judges, both of the supreme and inferior courts, shall hold their offices during good behaviour, and shall, at stated times, receive for their services, a compensation, which shall not be diminished during their continuance in office.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 2.&lt;/p&gt;\r\n\r\n&lt;p&gt;The judicial power shall extend to all cases, in law and equity, arising under this Constitution, the laws of the United States, and treaties made, or which shall be made, under their authority；--to all cases affecting ambassadors, other public ministers and consuls；--to all cases of admiralty and maritime jurisdiction；--to controversies to which the United States shall be a party；--to controversies between two or more states；--between a state and citizens of another state；--between citizens of different states；--between citizens of the same state claiming lands under grants of different states, and between a state, or the citizens thereof, and foreign states, citizens or subjects.&lt;/p&gt;\r\n\r\n&lt;p&gt;In all cases affecting ambassadors, other public ministers and consuls, and those in which a state shall be party, the Supreme Court shall have original jurisdiction. In all the other cases before mentioned, the Supreme Court shall have appellate jurisdiction, both as to law and fact, with such exceptions, and under such regulations as the Congress shall make.&lt;br /&gt;\r\nThe trial of all crimes, except in cases of impeachment, shall be by jury； and such trial shall be held in the state where the said crimes shall have been committed； but when not committed within any state, the trial shall be at such place or places as the Congress may by law have directed.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 3.&lt;/p&gt;\r\n\r\n&lt;p&gt;Treason against the United States, shall consist only in levying war against them, or in adhering to their enemies, giving them aid and comfort. No person shall be convicted of treason unless on the testimony of two witnesses to the same overt act, or on confession in open court.&lt;/p&gt;\r\n\r\n&lt;p&gt;The Congress shall have power to declare the punishment of treason, but no attainder of treason shall work corruption of blood, or forfeiture except during the life of the person attainted.&lt;/p&gt;\r\n\r\n&lt;p&gt;Article IV&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 1.&lt;/p&gt;\r\n\r\n&lt;p&gt;Full faith and credit shall be given in each state to the public acts, records, and judicial proceedings of every other state. And the Congress may by general laws prescribe the manner in which such acts, records, and proceedings shall be proved, and the effect thereof.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 2.&lt;/p&gt;\r\n\r\n&lt;p&gt;The citizens of each state shall be entitled to all privileges and immunities of citizens in the several states.&lt;/p&gt;\r\n\r\n&lt;p&gt;A person charged in any state with treason, felony, or other crime, who shall flee from justice, and be found in another state, shall on demand of the executive authority of the state from which he fled, be delivered up, to be removed to the state having jurisdiction of the crime.&lt;/p&gt;\r\n\r\n&lt;p&gt;No person held to service or labor in one state, under the laws thereof, escaping into another, shall, in consequence of any law or regulation therein, be discharged from such service or labor, but shall be delivered up on claim of the party to whom such service or labor may be due.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 3.&lt;/p&gt;\r\n\r\n&lt;p&gt;New states may be admitted by the Congress into this union； but no new states shall be formed or erected within the jurisdiction of any other state； nor any state be formed by the junction of two or more states, or parts of states, without the consent of the legislatures of the states concerned as well as of the Congress.&lt;/p&gt;\r\n\r\n&lt;p&gt;The Congress shall have power to dispose of and make all needful rules and regulations respecting the territory or other property belonging to the United States； and nothing in this Constitution shall be so construed as to prejudice any claims of the United States, or of any particular state.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 4.&lt;/p&gt;\r\n\r\n&lt;p&gt;The United States shall guarantee to every state in this union a republican form of government, and shall protect each of them against invasion； and on application of the legislature, or of the executive (when the legislature cannot be convened) against domestic violence.&lt;/p&gt;\r\n\r\n&lt;p&gt;Article V&lt;/p&gt;\r\n\r\n&lt;p&gt;The Congress, whenever two thirds of both houses shall deem it necessary, shall propose amendments to this Constitution, or, on the application of the legislatures of two thirds of the several states, shall call a convention for proposing amendments, which, in either case, shall be valid to all intents and purposes, as part of this Constitution, when ratified by the legislatures of three fourths of the several states, or by conventions in three fourths thereof, as the one or the other mode of ratification may be proposed by the Congress； provided that no amendment which may be made prior to the year one thousand eight hundred and eight shall in any manner affect the first and fourth clauses in the ninth section of the first article； and that no state, without its consent, shall be deprived of its equal suffrage in the Senate.&lt;/p&gt;\r\n\r\n&lt;p&gt;Article VI&lt;/p&gt;\r\n\r\n&lt;p&gt;All debts contracted and engagements entered into, before the adoption of this Constitution, shall be as valid against the United States under this Constitution, as under the Confederation.&lt;/p&gt;\r\n\r\n&lt;p&gt;This Constitution, and the laws of the United States which shall be made in pursuance thereof； and all treaties made, or which shall be made, under the authority of the United States, shall be the supreme law of the land； and the judges in every state shall be bound thereby, anything in the Constitution or laws of any State to the contrary notwithstanding.&lt;/p&gt;\r\n\r\n&lt;p&gt;The Senators and Representatives before mentioned, and the members of the several state legislatures, and all executive and judicial officers, both of the United States and of the several states, shall be bound by oath or affirmation, to support this Constitution； but no religious test shall ever be required as a qualification to any office or public trust under the United States.&lt;/p&gt;\r\n\r\n&lt;p&gt;Article VII&lt;/p&gt;\r\n\r\n&lt;p&gt;The ratification of the conventions of nine states, shall be sufficient for the establishment of this Constitution between the states so ratifying the same.&lt;/p&gt;\r\n\r\n&lt;p&gt;Done in convention by the unanimous consent of the states present the seventeenth day of September in the year of our Lord one thousand seven hundred and eighty seven and of the independence of the United States of America the twelfth.In witness whereof We have hereunto subscribed our Names,&lt;/p&gt;\r\n\r\n&lt;p&gt;G. Washington-Presidt. and deputy from Virginia&lt;/p&gt;\r\n\r\n&lt;p&gt;New Hampshire: John Langdon, Nicholas Gilman&lt;/p&gt;\r\n\r\n&lt;p&gt;Massachusetts: Nathaniel Gorham, Rufus King&lt;/p&gt;\r\n\r\n&lt;p&gt;Connecticut: Wm: Saml. Johnson, Roger Sherman&lt;/p&gt;\r\n\r\n&lt;p&gt;New York: Alexander Hamilton&lt;/p&gt;\r\n\r\n&lt;p&gt;New Jersey: Wil: Livingston, David Brearly, Wm. Paterson, Jona: Dayton&lt;/p&gt;\r\n\r\n&lt;p&gt;Pennsylvania: B. Franklin, Thomas Mifflin, Robt. Morris, Geo. Clymer, Thos. FitzSimons, Jared Ingersoll, James Wilson, Gouv Morris&lt;/p&gt;\r\n\r\n&lt;p&gt;Delaware: Geo: Read, Gunning Bedford jun, John Dickinson, Richard Bassett, Jaco: Broom&lt;/p&gt;\r\n\r\n&lt;p&gt;Maryland: James McHenry, Dan of St Thos. Jenifer, Danl Carroll&lt;/p&gt;\r\n\r\n&lt;p&gt;Virginia: John Blair, James Madison Jr.&lt;/p&gt;\r\n\r\n&lt;p&gt;North Carolina: Wm. Blount, Richd. Dobbs Spaight, Hu Williamson&lt;/p&gt;\r\n\r\n&lt;p&gt;South Carolina: J. Rutledge, Charles Cotesworth Pinckney, Charles Pinckney, Pierce Butler&lt;/p&gt;\r\n\r\n&lt;p&gt;Georgia: William Few, Abr Baldwin&lt;/p&gt;', 1515944357, 'peadmin', 1, 0);
INSERT INTO `x2_dochistory` (`dhid`, `dhdocid`, `dhtitle`, `dhcontent`, `dhtime`, `dhusername`, `dhstatus`, `dhtop`) VALUES
(4, 2, '历史意义不再作为单独项目列出', '&lt;p&gt;《1787宪法》是美国1787年制定并于1789年批准生效的美利坚合众国联邦宪法，也是世界上第一部比较完整的资产阶级成文宪法。它奠定了美国政治制度的法律基础，制定后多年来附有27条修正案，迄今继续生效。1787年宪法强调加强国家权利,又在权利结构中突出&amp;ldquo;分权与制衡&amp;rdquo;的原则,以避免权力过于集中,体现了一定的民主精神。其内容是：立法、司法与行政权三权分立。分权制衡的核心精神在于权力平衡。其学说来自洛克和孟德斯鸠等人，美国人把思想、理论转变为行动、实践。政府结构必须能使各部门之间有适当的控制和平衡。使权力为公众福利和正义目的有效行使其管理职能，同时又保持对权力的优良控制，实现公共权力与公民权利的平衡，管理与控权的动态平衡，是分权和制约的归宿。通过分权、制约最终达到平衡，是宪政的最终目标。&lt;/p&gt;\r\n\r\n&lt;p&gt;1787年宪法不仅对美国的政治和经济的发展有促进作用，而且对当今世界其他很多国家的民主与法制建设都有借鉴意义。&lt;/p&gt;\r\n\r\n&lt;h1 class=&quot;wikititle&quot; id=&quot;wkth_06227281713964983&quot;&gt;历程&lt;/h1&gt;\r\n\r\n&lt;h2 class=&quot;wikititle&quot; id=&quot;wkth_16193192912452403&quot;&gt;背景&lt;/h2&gt;\r\n\r\n&lt;p&gt;美国独立战争后，建立起来邦联制的国家，政治上的松散状态无法形成强有力的中央政府来稳定统治秩序，保护国家的利益与主权。&lt;br /&gt;\r\n面临既要加强中央集权，又要确保共和制的新问题。&lt;/p&gt;\r\n\r\n&lt;p&gt;1786年的谢司起义，使联邦制的统治者迫切要求强化资产阶级权利，完善资产阶级统治制度。&lt;/p&gt;\r\n\r\n&lt;h2 class=&quot;wikititle&quot; id=&quot;wkth_18527449253901063&quot;&gt;制定&lt;/h2&gt;\r\n\r\n&lt;p&gt;1777年大陆会议制定的并于1781年批准施行的《邦联条例》规定，由当时13个独立州组成邦联制国家。邦联政府的权限很小，不能有效地行使国家职权。鉴此，邦联国会于1787年2月邀请各州代表到费城召开制宪会议,修改《邦联条例》。&lt;/p&gt;\r\n\r\n&lt;p&gt;5月召开会议,出席的有12个州（罗得岛州除外）的55名代表，G.华盛顿任主席。主张废除《邦联条例》、重新制定新宪法的代表占优势，使这次会议成了全国制宪会议。出席会议的大都是资产阶级和种植园奴隶主的代表，由于利益不同，大州与小州之间又存在着矛盾。&lt;/p&gt;\r\n\r\n&lt;p&gt;经过长时间的秘密讨论，直至1787年9月17日才通过新的宪法草案,交由各州批准。全国围绕新宪法的批准问题展开广泛的激烈讨论。1789年3月4日召开的美国第1届联邦国会宣布《美利坚合众国宪法》正式生效。&lt;/p&gt;\r\n\r\n&lt;h1 class=&quot;wikititle&quot; id=&quot;wkth_8375784936343371&quot;&gt;全文&lt;/h1&gt;\r\n\r\n&lt;h2 class=&quot;wikititle&quot; id=&quot;wkth_5916713470541723&quot;&gt;英文全文&lt;/h2&gt;\r\n\r\n&lt;p&gt;THE CONSTITUTION OF THE UNITED STATES OF AMERICA&lt;/p&gt;\r\n\r\n&lt;p&gt;March 4, 1789&lt;/p&gt;\r\n\r\n&lt;p&gt;Preamble&lt;/p&gt;\r\n\r\n&lt;p&gt;We the people of the United States, in order to form a more perfect union, establish justice, insure domestic tranquility, provide for the common defense, promote the general welfare, and secure the blessings of liberty to ourselves and our posterity, do ordain and establish this Constitution for the United States of America.&lt;/p&gt;\r\n\r\n&lt;p&gt;Article I&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 1.&lt;/p&gt;\r\n\r\n&lt;p&gt;All legislative powers herein granted shall be vested in a Congress of the United States, which shall consist of a Senate and House of Representatives.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 2.&lt;/p&gt;\r\n\r\n&lt;p&gt;The House of Representatives shall be composed of members chosen every second year by the people of the several states, and the electors in each state shall have the qualifications requisite for electors of the most numerous branch of the state legislature.&lt;/p&gt;\r\n\r\n&lt;p&gt;No person shall be a Representative who shall not have attained to the age of twenty five years, and been seven years a citizen of the United States, and who shall not, when elected, be an inhabitant of that state in which he shall be chosen.&lt;/p&gt;\r\n\r\n&lt;p&gt;Representatives and direct taxes shall be apportioned among the several states which may be included within this union, according to their respective numbers, which shall be determined by adding to the whole number of free persons, including those bound to service for a term of years, and excluding Indians not taxed, three fifths of all other Persons. The actual Enumeration shall be made within three years after the first meeting of the Congress of the United States, and within every subsequent term of ten years, in such manner as they shall by law direct. The number of Representatives shall not exceed one for every thirty thousand, but each state shall have at least one Representative； and until such enumeration shall be made, the state of New Hampshire shall be entitled to choose three, Massachusetts eight, Rhode Island and Providence Plantations one, Connecticut five, New York six, New Jersey four, Pennsylvania eight, Delaware one, Maryland six, Virginia ten, North Carolina five, South Carolina five, and Georgia three.&lt;/p&gt;\r\n\r\n&lt;p&gt;When vacancies happen in the Representation from any state, the executive authority thereof shall issue writs of election to fill such vacancies.&lt;/p&gt;\r\n\r\n&lt;p&gt;The House of Representatives shall choose their speaker and other officers； and shall have the sole power of impeachment.&lt;br /&gt;\r\nSection 3. The Senate of the United States shall be composed of two Senators from each state, chosen by the legislature thereof, for six years； and each Senator shall have one vote.Immediately after they shall be assembled in consequence of the first election, they shall be divided as equally as may be into three classes. The seats of the Senators of the first class shall be vacated at the expiration of the second year, of the second class at the expiration of the fourth year, and the third class at the expiration of the sixth year, so that one third may be chosen every second year； and if vacancies happen by resignation, or otherwise, during the recess of the legislature of any state, the executive thereof may make temporary appointments until the next meeting of the legislature, which shall then fill such vacancies.&lt;/p&gt;\r\n\r\n&lt;p&gt;No person shall be a Senator who shall not have attained to the age of thirty years, and been nine years a citizen of the United States and who shall not, when elected, be an inhabitant of that state for which he shall be chosen.&lt;br /&gt;\r\nThe Vice President of the United States shall be President of the Senate, but shall have no vote, unless they be equally divided.&lt;br /&gt;\r\nThe Senate shall choose their other officers, and also a President pro tempore, in the absence of the Vice President, or when he shall exercise the office of President of the United States.&lt;/p&gt;\r\n\r\n&lt;p&gt;The Senate shall have the sole power to try all impeachments. When sitting for that purpose, they shall be on oath or affirmation. When the President of the United States is tried, the Chief Justice shall preside: And no person shall be convicted without the concurrence of two thirds of the members present.&lt;/p&gt;\r\n\r\n&lt;p&gt;Judgment in cases of impeachment shall not extend further than to removal from office, and disqualification to hold and enjoy any office of honor, trust or profit under the United States: but the party convicted shall nevertheless be liable and subject to indictment, trial, judgment and punishment, according to law.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 4.&lt;/p&gt;\r\n\r\n&lt;p&gt;The times, places and manner of holding elections for Senators and Representatives, shall be prescribed in each state by the legislature thereof； but the Congress may at any time by law make or alter such regulations, except as to the places of choosing Senators.&lt;/p&gt;\r\n\r\n&lt;p&gt;The Congress shall assemble at least once in every year, and such meeting shall be on the first Monday in December, unless they shall by law appoint a different day.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 5.&lt;/p&gt;\r\n\r\n&lt;p&gt;Each House shall be the judge of the elections, returns and qualifications of its own members, and a majority of each shall constitute a quorum to do business； but a smaller number may adjourn from day to day, and may be authorized to compel the attendance of absent members, in such manner, and under such penalties as each House may provide.&lt;br /&gt;\r\nEach House may determine the rules of its proceedings, punish its members for disorderly behavior, and, with the concurrence of two thirds, expel a member.&lt;/p&gt;\r\n\r\n&lt;p&gt;Each House shall keep a journal of its proceedings, and from time to time publish the same, excepting such parts as may in their judgment require secrecy； and the yeas and nays of the members of either House on any question shall, at the desire of one fifth of those present, be entered on the journal.&lt;/p&gt;\r\n\r\n&lt;p&gt;Neither House, during the session of Congress, shall, without the consent of the other, adjourn for more than three days, nor to any other place than that in which the two Houses shall be sitting.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 6.&lt;/p&gt;\r\n\r\n&lt;p&gt;The Senators and Representatives shall receive a compensation for their services, to be ascertained by law, and paid out of the treasury of the United States. They shall in all cases, except treason, felony and breach of the peace, be privileged from arrest during their attendance at the session of their respective Houses, and in going to and returning from the same； and for any speech or debate in either House, they shall not be questioned in any other place.&lt;/p&gt;\r\n\r\n&lt;p&gt;No Senator or Representative shall, during the time for which he was elected, be appointed to any civil office under the authority of the United States, which shall have been created, or the emoluments whereof shall have been increased during such time； and no person holding any office under the United States, shall be a member of either House during his continuance in office.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 7.&lt;/p&gt;\r\n\r\n&lt;p&gt;All bills for raising revenue shall originate in the House of Representatives； but the Senate may propose or concur with amendments as on other Bills.&lt;/p&gt;\r\n\r\n&lt;p&gt;Every bill which shall have passed the House of Representatives and the Senate, shall, before it become a law, be presented to the President of the United States； if he approve he shall sign it, but if not he shall return it, with his objections to that House in which it shall have originated, who shall enter the objections at large on their journal, and proceed to reconsider it. If after such reconsideration two thirds of that House shall agree to pass the bill, it shall be sent, together with the objections, to the other House, by which it shall likewise be reconsidered, and if approved by two thirds of that House, it shall become a law. But in all such cases the votes of both Houses shall be determined by yeas and nays, and the names of the persons voting for and against the bill shall be entered on the journal of each House respectively. If any bill shall not be returned by the President within ten days (Sundays excepted) after it shall have been presented to him, the same shall be a law, in like manner as if he had signed it, unless the Congress by their adjournment prevent its return, in which case it shall not be a law.&lt;/p&gt;\r\n\r\n&lt;p&gt;Every order, resolution, or vote to which the concurrence of the Senate and House of Representatives may be necessary (except on a question of adjournment) shall be presented to the President of the United States； and before the same shall take effect, shall be approved by him, or being disapproved by him, shall be repassed by two thirds of the Senate and House of Representatives, according to the rules and limitations prescribed in the case of a bill.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 8.&lt;/p&gt;\r\n\r\n&lt;p&gt;The Congress shall have power to lay and collect taxes, duties, imposts and excises, to pay the debts and provide for the common defense and general welfare of the United States； but all duties, imposts and excises shall be uniform throughout the United States；&lt;/p&gt;\r\n\r\n&lt;p&gt;To borrow money on the credit of the United States；&lt;/p&gt;\r\n\r\n&lt;p&gt;To regulate commerce with foreign nations, and among the several states, and with the Indian tribes；&lt;/p&gt;\r\n\r\n&lt;p&gt;To establish a uniform rule of naturalization, and uniform laws on the subject of bankruptcies throughout the United States；&lt;/p&gt;\r\n\r\n&lt;p&gt;To coin money, regulate the value thereof, and of foreign coin, and fix the standard of weights and measures；&lt;/p&gt;\r\n\r\n&lt;p&gt;To provide for the punishment of counterfeiting the securities and current coin of the United States；&lt;/p&gt;\r\n\r\n&lt;p&gt;To establish post offices and post roads；&lt;/p&gt;\r\n\r\n&lt;p&gt;To promote the progress of science and useful arts, by securing for limited times to authors and inventors the exclusive right to their respective writings and discoveries；&lt;/p&gt;\r\n\r\n&lt;p&gt;To constitute tribunals inferior to the Supreme Court；&lt;/p&gt;\r\n\r\n&lt;p&gt;To define and punish piracies and felonies committed on the high seas, and offenses against the law of nations；&lt;/p&gt;\r\n\r\n&lt;p&gt;To declare war, grant letters of marque and reprisal, and make rules concerning captures on land and water；&lt;/p&gt;\r\n\r\n&lt;p&gt;To raise and support armies, but no appropriation of money to that use shall be for a longer term than two years；&lt;/p&gt;\r\n\r\n&lt;p&gt;To provide and maintain a navy；&lt;/p&gt;\r\n\r\n&lt;p&gt;To make rules for the government and regulation of the land and naval forces；&lt;/p&gt;\r\n\r\n&lt;p&gt;To provide for calling forth the militia to execute the laws of the union, suppress insurrections and repel invasions；&lt;/p&gt;\r\n\r\n&lt;p&gt;To provide for organizing, arming, and disciplining, the militia, and for governing such part of them as may be employed in the service of the United States, reserving to the states respectively, the appointment of the officers, and the authority of training the militia according to the discipline prescribed by Congress；&lt;/p&gt;\r\n\r\n&lt;p&gt;To exercise exclusive legislation in all cases whatsoever, over such District (not exceeding ten miles square) as may, by cession of particular states, and the acceptance of Congress, become the seat of the government of the United States, and to exercise like authority over all places purchased by the consent of the legislature of the state in which the same shall be, for the erection of forts, magazines, arsenals, dockyards, and other needful buildings；&lt;/p&gt;\r\n\r\n&lt;p&gt;To make all laws which shall be necessary and proper for carrying into execution the foregoing powers, and all other powers vested by this Constitution in the government of the United States, or in any department or officer thereof.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 9.&lt;/p&gt;\r\n\r\n&lt;p&gt;The migration or importation of such persons as any of the states now existing shall think proper to admit, shall not be prohibited by the Congress prior to the year one thousand eight hundred and eight, but a tax or duty may be imposed on such importation, not exceeding ten dollars for each person.&lt;/p&gt;\r\n\r\n&lt;p&gt;The privilege of the writ of habeas corpus shall not be suspended, unless when in cases of rebellion or invasion the public safety may require it.&lt;/p&gt;\r\n\r\n&lt;p&gt;No bill of attainder or ex post facto Law shall be passed.&lt;/p&gt;\r\n\r\n&lt;p&gt;No capitation, or other direct, tax shall be laid, unless in proportion to the census or enumeration herein before directed to be taken.&lt;/p&gt;\r\n\r\n&lt;p&gt;No tax or duty shall be laid on articles exported from any state.&lt;/p&gt;\r\n\r\n&lt;p&gt;No preference shall be given by any regulation of commerce or revenue to the ports of one state over those of another: nor shall vessels bound to, or from, one state, be obliged to enter, clear or pay duties in another.&lt;/p&gt;\r\n\r\n&lt;p&gt;No money shall be drawn from the treasury, but in consequence of appropriations made by law； and a regular statement and account of receipts and expenditures of all public money shall be published from time to time.&lt;/p&gt;\r\n\r\n&lt;p&gt;No title of nobility shall be granted by the United States: and no person holding any office of profit or trust under them, shall, without the consent of the Congress, accept of any present, emolument, office, or title, of any kind whatever, from any king, prince, or foreign state.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 10.&lt;/p&gt;\r\n\r\n&lt;p&gt;No state shall enter into any treaty, alliance, or confederation； grant letters of marque and reprisal； coin money； emit bills of credit； make anything but gold and silver coin a tender in payment of debts； pass any bill of attainder, ex post facto law, or law impairing the obligation of contracts, or grant any title of nobility.&lt;/p&gt;\r\n\r\n&lt;p&gt;No state shall, without the consent of the Congress, lay any imposts or duties on imports or exports, except what may be absolutely necessary for executing it s inspection laws: and the net produce of all duties and imposts, laid by any state on imports or exports, shall be for the use of the treasury of the United States； and all such laws shall be subject to the revision and control of the Congress.&lt;/p&gt;\r\n\r\n&lt;p&gt;No state shall, without the consent of Congress, lay any duty of tonnage, keep troops, or ships of war in time of peace, enter into any agreement or compact with another state, or with a foreign power, or engage in war, unless actually invaded, or in such imminent danger as will not admit of delay.&lt;/p&gt;\r\n\r\n&lt;p&gt;Article II&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 1.&lt;/p&gt;\r\n\r\n&lt;p&gt;The executive power shall be vested in a President of the United States of America. He shall hold his office during the term of four years, and, together with the Vice President, chosen for the same term, be elected, as follows:&lt;/p&gt;\r\n\r\n&lt;p&gt;Each state shall appoint, in such manner as the Legislature thereof may direct, a number of electors, equal to the whole number of Senators and Representatives to which the State may be entitled in the Congress: but no Senator or Representative, or person holding an office of trust or profit under the United States, shall be appointed an elector.&lt;/p&gt;\r\n\r\n&lt;p&gt;The electors shall meet in their respective states, and vote by ballot for two persons, of whom one at least shall not be an inhabitant of the same state with themselves. And they shall make a list of all the persons voted for, and of the number of votes for each； which list they shall sign and certify, and transmit sealed to the seat of the government of the United States, directed to the President of the Senate. The President of the Senate shall, in the presence of the Senate and House of Representatives, open all the certificates, and the votes shall then be counted. The person having the greatest number of votes shall be the President, if such number be a majority of the whole number of electors appointed； and if there be more than one who have such majority, and have an equal number of votes, then the House of Representatives shall immediately choose by ballot one of them for President； and if no person have a majority, then from the five highest on the list the said House shall in like manner choose the President. But in choosing the President, the votes shall be taken by States, the representation from each state having one vote； A quorum for this purpose shall consist of a member or members from two thirds of the states, and a majority of all the states shall be necessary to a choice. In every case, after the choice of the President, the person having the greatest number of votes of the electors shall be the Vice President. But if there should remain two or more who have equal votes, the Senate shall choose from them by ballot the Vice President.&lt;/p&gt;\r\n\r\n&lt;p&gt;The Congress may determine the time of choosing the electors, and the day on which they shall give their votes； which day shall be the same throughout the United States.&lt;/p&gt;\r\n\r\n&lt;p&gt;No person except a natural born citizen, or a citizen of the United States, at the time of the adoption of this Constitution, shall be eligible to the office of President； neither shall any person be eligible to that office who shall not have attained to the age of thirty five years, and been fourteen Years a resident within the United States.&lt;/p&gt;\r\n\r\n&lt;p&gt;In case of the removal of the President from office, or of his death, resignation, or inability to discharge the powers and duties of the said office, the same shall devolve on the Vice President, and the Congress may by law provide for the case of removal, death, resignation or inability, both of the President and Vice President, declaring what officer shall then act as President, and such officer shall act accordingly, until the disability be removed, or a President shall be elected.&lt;/p&gt;\r\n\r\n&lt;p&gt;The President shall, at stated times, receive for his services, a compensation, which shall neither be increased nor diminished during the period for which he shall have been elected, and he shall not receive within that period any other emolument from the United States, or any of them.&lt;/p&gt;\r\n\r\n&lt;p&gt;Before he enter on the execution of his office, he shall take the following oath or affirmation:--&amp;quot;I do solemnly swear (or affirm) that I will faithfully execute the office of President of the United States, and will to the best of my ability, preserve, protect and defend the Constitution of the United States.&amp;quot;&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 2.&lt;/p&gt;\r\n\r\n&lt;p&gt;The President shall be commander in chief of the Army and Navy of the United States, and of the militia of the several states, when called into the actual service of the United States； he may require the opinion, in writing, of the principal officer in each of the executive departments, upon any subject relating to the duties of their respective offices, and he shall have power to grant reprieves and pardons for offenses against the United States, except in cases of impeachment.&lt;/p&gt;\r\n\r\n&lt;p&gt;He shall have power, by and with the advice and consent of the Senate, to make treaties, provided two thirds of the Senators present concur； and he shall nominate, and by and with the advice and consent of the Senate, shall appoint ambassadors, other public ministers and consuls, judges of the Supreme Court, and all other officers of the United States, whose appointments are not herein otherwise provided for, and which shall be established by law: but the Congress may by law vest the appointment of such inferior officers, as they think proper, in the President alone, in the courts of law, or in the heads of departments.&lt;/p&gt;\r\n\r\n&lt;p&gt;The President shall have power to fill up all vacancies that may happen during the recess of the Senate, by granting commissions which shall expire at the end of their next session.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 3.&lt;/p&gt;\r\n\r\n&lt;p&gt;He shall from time to time give to the Congress information of the state of the union, and recommend to their consideration such measures as he shall judge necessary and expedient； he may, on extraordinary occasions, convene both Houses, or either of them, and in case of disagreement between them, with respect to the time of adjournment, he may adjourn them to such time as he shall think proper； he shall receive ambassadors and other public ministers； he shall take care that the laws be faithfully executed, and shall commission all the officers of the United States.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 4.&lt;/p&gt;\r\n\r\n&lt;p&gt;The President, Vice President and all civil officers of the United States, shall be removed from office on impeachment for, and conviction of, treason, bribery, or other high crimes and misdemeanors.&lt;/p&gt;\r\n\r\n&lt;p&gt;Article III&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 1.&lt;/p&gt;\r\n\r\n&lt;p&gt;The judicial power of the United States, shall be vested in one Supreme Court, and in such inferior courts as the Congress may from time to time ordain and establish. The judges, both of the supreme and inferior courts, shall hold their offices during good behaviour, and shall, at stated times, receive for their services, a compensation, which shall not be diminished during their continuance in office.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 2.&lt;/p&gt;\r\n\r\n&lt;p&gt;The judicial power shall extend to all cases, in law and equity, arising under this Constitution, the laws of the United States, and treaties made, or which shall be made, under their authority；--to all cases affecting ambassadors, other public ministers and consuls；--to all cases of admiralty and maritime jurisdiction；--to controversies to which the United States shall be a party；--to controversies between two or more states；--between a state and citizens of another state；--between citizens of different states；--between citizens of the same state claiming lands under grants of different states, and between a state, or the citizens thereof, and foreign states, citizens or subjects.&lt;/p&gt;\r\n\r\n&lt;p&gt;In all cases affecting ambassadors, other public ministers and consuls, and those in which a state shall be party, the Supreme Court shall have original jurisdiction. In all the other cases before mentioned, the Supreme Court shall have appellate jurisdiction, both as to law and fact, with such exceptions, and under such regulations as the Congress shall make.&lt;br /&gt;\r\nThe trial of all crimes, except in cases of impeachment, shall be by jury； and such trial shall be held in the state where the said crimes shall have been committed； but when not committed within any state, the trial shall be at such place or places as the Congress may by law have directed.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 3.&lt;/p&gt;\r\n\r\n&lt;p&gt;Treason against the United States, shall consist only in levying war against them, or in adhering to their enemies, giving them aid and comfort. No person shall be convicted of treason unless on the testimony of two witnesses to the same overt act, or on confession in open court.&lt;/p&gt;\r\n\r\n&lt;p&gt;The Congress shall have power to declare the punishment of treason, but no attainder of treason shall work corruption of blood, or forfeiture except during the life of the person attainted.&lt;/p&gt;\r\n\r\n&lt;p&gt;Article IV&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 1.&lt;/p&gt;\r\n\r\n&lt;p&gt;Full faith and credit shall be given in each state to the public acts, records, and judicial proceedings of every other state. And the Congress may by general laws prescribe the manner in which such acts, records, and proceedings shall be proved, and the effect thereof.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 2.&lt;/p&gt;\r\n\r\n&lt;p&gt;The citizens of each state shall be entitled to all privileges and immunities of citizens in the several states.&lt;/p&gt;\r\n\r\n&lt;p&gt;A person charged in any state with treason, felony, or other crime, who shall flee from justice, and be found in another state, shall on demand of the executive authority of the state from which he fled, be delivered up, to be removed to the state having jurisdiction of the crime.&lt;/p&gt;\r\n\r\n&lt;p&gt;No person held to service or labor in one state, under the laws thereof, escaping into another, shall, in consequence of any law or regulation therein, be discharged from such service or labor, but shall be delivered up on claim of the party to whom such service or labor may be due.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 3.&lt;/p&gt;\r\n\r\n&lt;p&gt;New states may be admitted by the Congress into this union； but no new states shall be formed or erected within the jurisdiction of any other state； nor any state be formed by the junction of two or more states, or parts of states, without the consent of the legislatures of the states concerned as well as of the Congress.&lt;/p&gt;\r\n\r\n&lt;p&gt;The Congress shall have power to dispose of and make all needful rules and regulations respecting the territory or other property belonging to the United States； and nothing in this Constitution shall be so construed as to prejudice any claims of the United States, or of any particular state.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 4.&lt;/p&gt;\r\n\r\n&lt;p&gt;The United States shall guarantee to every state in this union a republican form of government, and shall protect each of them against invasion； and on application of the legislature, or of the executive (when the legislature cannot be convened) against domestic violence.&lt;/p&gt;\r\n\r\n&lt;p&gt;Article V&lt;/p&gt;\r\n\r\n&lt;p&gt;The Congress, whenever two thirds of both houses shall deem it necessary, shall propose amendments to this Constitution, or, on the application of the legislatures of two thirds of the several states, shall call a convention for proposing amendments, which, in either case, shall be valid to all intents and purposes, as part of this Constitution, when ratified by the legislatures of three fourths of the several states, or by conventions in three fourths thereof, as the one or the other mode of ratification may be proposed by the Congress； provided that no amendment which may be made prior to the year one thousand eight hundred and eight shall in any manner affect the first and fourth clauses in the ninth section of the first article； and that no state, without its consent, shall be deprived of its equal suffrage in the Senate.&lt;/p&gt;\r\n\r\n&lt;p&gt;Article VI&lt;/p&gt;\r\n\r\n&lt;p&gt;All debts contracted and engagements entered into, before the adoption of this Constitution, shall be as valid against the United States under this Constitution, as under the Confederation.&lt;/p&gt;\r\n\r\n&lt;p&gt;This Constitution, and the laws of the United States which shall be made in pursuance thereof； and all treaties made, or which shall be made, under the authority of the United States, shall be the supreme law of the land； and the judges in every state shall be bound thereby, anything in the Constitution or laws of any State to the contrary notwithstanding.&lt;/p&gt;\r\n\r\n&lt;p&gt;The Senators and Representatives before mentioned, and the members of the several state legislatures, and all executive and judicial officers, both of the United States and of the several states, shall be bound by oath or affirmation, to support this Constitution； but no religious test shall ever be required as a qualification to any office or public trust under the United States.&lt;/p&gt;\r\n\r\n&lt;p&gt;Article VII&lt;/p&gt;\r\n\r\n&lt;p&gt;The ratification of the conventions of nine states, shall be sufficient for the establishment of this Constitution between the states so ratifying the same.&lt;/p&gt;\r\n\r\n&lt;p&gt;Done in convention by the unanimous consent of the states present the seventeenth day of September in the year of our Lord one thousand seven hundred and eighty seven and of the independence of the United States of America the twelfth.In witness whereof We have hereunto subscribed our Names,&lt;/p&gt;\r\n\r\n&lt;p&gt;G. Washington-Presidt. and deputy from Virginia&lt;/p&gt;\r\n\r\n&lt;p&gt;New Hampshire: John Langdon, Nicholas Gilman&lt;/p&gt;\r\n\r\n&lt;p&gt;Massachusetts: Nathaniel Gorham, Rufus King&lt;/p&gt;\r\n\r\n&lt;p&gt;Connecticut: Wm: Saml. Johnson, Roger Sherman&lt;/p&gt;\r\n\r\n&lt;p&gt;New York: Alexander Hamilton&lt;/p&gt;\r\n\r\n&lt;p&gt;New Jersey: Wil: Livingston, David Brearly, Wm. Paterson, Jona: Dayton&lt;/p&gt;\r\n\r\n&lt;p&gt;Pennsylvania: B. Franklin, Thomas Mifflin, Robt. Morris, Geo. Clymer, Thos. FitzSimons, Jared Ingersoll, James Wilson, Gouv Morris&lt;/p&gt;\r\n\r\n&lt;p&gt;Delaware: Geo: Read, Gunning Bedford jun, John Dickinson, Richard Bassett, Jaco: Broom&lt;/p&gt;\r\n\r\n&lt;p&gt;Maryland: James McHenry, Dan of St Thos. Jenifer, Danl Carroll&lt;/p&gt;\r\n\r\n&lt;p&gt;Virginia: John Blair, James Madison Jr.&lt;/p&gt;\r\n\r\n&lt;p&gt;North Carolina: Wm. Blount, Richd. Dobbs Spaight, Hu Williamson&lt;/p&gt;\r\n\r\n&lt;p&gt;South Carolina: J. Rutledge, Charles Cotesworth Pinckney, Charles Pinckney, Pierce Butler&lt;/p&gt;\r\n\r\n&lt;p&gt;Georgia: William Few, Abr Baldwin&lt;/p&gt;', 1515938163, 'peadmin', 1, 0);
INSERT INTO `x2_dochistory` (`dhid`, `dhdocid`, `dhtitle`, `dhcontent`, `dhtime`, `dhusername`, `dhstatus`, `dhtop`) VALUES
(5, 2, '增加插图，修改段落', '&lt;p&gt;《1787宪法》是美国1787年制定并于1789年批准生效的美利坚合众国联邦宪法，也是世界上第一部比较完整的资产阶级成文宪法。它奠定了美国政治制度的法律基础，制定后多年来附有27条修正案，迄今继续生效。1787年宪法强调加强国家权利,又在权利结构中突出&amp;ldquo;分权与制衡&amp;rdquo;的原则,以避免权力过于集中,体现了一定的民主精神。其内容是：立法、司法与行政权三权分立。分权制衡的核心精神在于权力平衡。其学说来自洛克和孟德斯鸠等人，美国人把思想、理论转变为行动、实践。政府结构必须能使各部门之间有适当的控制和平衡。使权力为公众福利和正义目的有效行使其管理职能，同时又保持对权力的优良控制，实现公共权力与公民权利的平衡，管理与控权的动态平衡，是分权和制约的归宿。通过分权、制约最终达到平衡，是宪政的最终目标。&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;http://127.0.0.1/phpems/files/attach/files/content/20180114/15159383851238.jpg&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;1787年宪法不仅对美国的政治和经济的发展有促进作用，而且对当今世界其他很多国家的民主与法制建设都有借鉴意义。&lt;/p&gt;\r\n\r\n&lt;h1 class=&quot;wikititle&quot; id=&quot;wkth_06227281713964983&quot;&gt;历程&lt;/h1&gt;\r\n\r\n&lt;h2 class=&quot;wikititle&quot; id=&quot;wkth_16193192912452403&quot;&gt;背景&lt;/h2&gt;\r\n\r\n&lt;p&gt;美国独立战争后，建立起来邦联制的国家，政治上的松散状态无法形成强有力的中央政府来稳定统治秩序，保护国家的利益与主权。&lt;br /&gt;\r\n面临既要加强中央集权，又要确保共和制的新问题。&lt;/p&gt;\r\n\r\n&lt;p&gt;1786年的谢司起义，使联邦制的统治者迫切要求强化资产阶级权利，完善资产阶级统治制度。&lt;/p&gt;\r\n\r\n&lt;h2 class=&quot;wikititle&quot; id=&quot;wkth_18527449253901063&quot;&gt;制定&lt;/h2&gt;\r\n\r\n&lt;p&gt;1777年大陆会议制定的并于1781年批准施行的《邦联条例》规定，由当时13个独立州组成邦联制国家。邦联政府的权限很小，不能有效地行使国家职权。鉴此，邦联国会于1787年2月邀请各州代表到费城召开制宪会议,修改《邦联条例》。&lt;/p&gt;\r\n\r\n&lt;p&gt;5月召开会议,出席的有12个州（罗得岛州除外）的55名代表，G.华盛顿任主席。主张废除《邦联条例》、重新制定新宪法的代表占优势，使这次会议成了全国制宪会议。出席会议的大都是资产阶级和种植园奴隶主的代表，由于利益不同，大州与小州之间又存在着矛盾。&lt;/p&gt;\r\n\r\n&lt;p&gt;经过长时间的秘密讨论，直至1787年9月17日才通过新的宪法草案,交由各州批准。全国围绕新宪法的批准问题展开广泛的激烈讨论。1789年3月4日召开的美国第1届联邦国会宣布《美利坚合众国宪法》正式生效。&lt;/p&gt;\r\n\r\n&lt;h1 class=&quot;wikititle&quot; id=&quot;wkth_8375784936343371&quot;&gt;全文&lt;/h1&gt;\r\n\r\n&lt;h2 class=&quot;wikititle&quot; id=&quot;wkth_5916713470541723&quot;&gt;英文全文&lt;/h2&gt;\r\n\r\n&lt;p&gt;THE CONSTITUTION OF THE UNITED STATES OF AMERICA&lt;/p&gt;\r\n\r\n&lt;p&gt;March 4, 1789&lt;/p&gt;\r\n\r\n&lt;p&gt;Preamble&lt;/p&gt;\r\n\r\n&lt;p&gt;We the people of the United States, in order to form a more perfect union, establish justice, insure domestic tranquility, provide for the common defense, promote the general welfare, and secure the blessings of liberty to ourselves and our posterity, do ordain and establish this Constitution for the United States of America.&lt;/p&gt;\r\n\r\n&lt;p&gt;Article I&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 1.&lt;/p&gt;\r\n\r\n&lt;p&gt;All legislative powers herein granted shall be vested in a Congress of the United States, which shall consist of a Senate and House of Representatives.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 2.&lt;/p&gt;\r\n\r\n&lt;p&gt;The House of Representatives shall be composed of members chosen every second year by the people of the several states, and the electors in each state shall have the qualifications requisite for electors of the most numerous branch of the state legislature.&lt;/p&gt;\r\n\r\n&lt;p&gt;No person shall be a Representative who shall not have attained to the age of twenty five years, and been seven years a citizen of the United States, and who shall not, when elected, be an inhabitant of that state in which he shall be chosen.&lt;/p&gt;\r\n\r\n&lt;p&gt;Representatives and direct taxes shall be apportioned among the several states which may be included within this union, according to their respective numbers, which shall be determined by adding to the whole number of free persons, including those bound to service for a term of years, and excluding Indians not taxed, three fifths of all other Persons. The actual Enumeration shall be made within three years after the first meeting of the Congress of the United States, and within every subsequent term of ten years, in such manner as they shall by law direct. The number of Representatives shall not exceed one for every thirty thousand, but each state shall have at least one Representative； and until such enumeration shall be made, the state of New Hampshire shall be entitled to choose three, Massachusetts eight, Rhode Island and Providence Plantations one, Connecticut five, New York six, New Jersey four, Pennsylvania eight, Delaware one, Maryland six, Virginia ten, North Carolina five, South Carolina five, and Georgia three.&lt;/p&gt;\r\n\r\n&lt;p&gt;When vacancies happen in the Representation from any state, the executive authority thereof shall issue writs of election to fill such vacancies.&lt;/p&gt;\r\n\r\n&lt;p&gt;The House of Representatives shall choose their speaker and other officers； and shall have the sole power of impeachment.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 3.&lt;/p&gt;\r\n\r\n&lt;p&gt;The Senate of the United States shall be composed of two Senators from each state, chosen by the legislature thereof, for six years； and each Senator shall have one vote.Immediately after they shall be assembled in consequence of the first election, they shall be divided as equally as may be into three classes. The seats of the Senators of the first class shall be vacated at the expiration of the second year, of the second class at the expiration of the fourth year, and the third class at the expiration of the sixth year, so that one third may be chosen every second year； and if vacancies happen by resignation, or otherwise, during the recess of the legislature of any state, the executive thereof may make temporary appointments until the next meeting of the legislature, which shall then fill such vacancies.&lt;/p&gt;\r\n\r\n&lt;p&gt;No person shall be a Senator who shall not have attained to the age of thirty years, and been nine years a citizen of the United States and who shall not, when elected, be an inhabitant of that state for which he shall be chosen.&lt;br /&gt;\r\nThe Vice President of the United States shall be President of the Senate, but shall have no vote, unless they be equally divided.&lt;br /&gt;\r\nThe Senate shall choose their other officers, and also a President pro tempore, in the absence of the Vice President, or when he shall exercise the office of President of the United States.&lt;/p&gt;\r\n\r\n&lt;p&gt;The Senate shall have the sole power to try all impeachments. When sitting for that purpose, they shall be on oath or affirmation. When the President of the United States is tried, the Chief Justice shall preside: And no person shall be convicted without the concurrence of two thirds of the members present.&lt;/p&gt;\r\n\r\n&lt;p&gt;Judgment in cases of impeachment shall not extend further than to removal from office, and disqualification to hold and enjoy any office of honor, trust or profit under the United States: but the party convicted shall nevertheless be liable and subject to indictment, trial, judgment and punishment, according to law.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 4.&lt;/p&gt;\r\n\r\n&lt;p&gt;The times, places and manner of holding elections for Senators and Representatives, shall be prescribed in each state by the legislature thereof； but the Congress may at any time by law make or alter such regulations, except as to the places of choosing Senators.&lt;/p&gt;\r\n\r\n&lt;p&gt;The Congress shall assemble at least once in every year, and such meeting shall be on the first Monday in December, unless they shall by law appoint a different day.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 5.&lt;/p&gt;\r\n\r\n&lt;p&gt;Each House shall be the judge of the elections, returns and qualifications of its own members, and a majority of each shall constitute a quorum to do business； but a smaller number may adjourn from day to day, and may be authorized to compel the attendance of absent members, in such manner, and under such penalties as each House may provide.&lt;br /&gt;\r\nEach House may determine the rules of its proceedings, punish its members for disorderly behavior, and, with the concurrence of two thirds, expel a member.&lt;/p&gt;\r\n\r\n&lt;p&gt;Each House shall keep a journal of its proceedings, and from time to time publish the same, excepting such parts as may in their judgment require secrecy； and the yeas and nays of the members of either House on any question shall, at the desire of one fifth of those present, be entered on the journal.&lt;/p&gt;\r\n\r\n&lt;p&gt;Neither House, during the session of Congress, shall, without the consent of the other, adjourn for more than three days, nor to any other place than that in which the two Houses shall be sitting.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 6.&lt;/p&gt;\r\n\r\n&lt;p&gt;The Senators and Representatives shall receive a compensation for their services, to be ascertained by law, and paid out of the treasury of the United States. They shall in all cases, except treason, felony and breach of the peace, be privileged from arrest during their attendance at the session of their respective Houses, and in going to and returning from the same； and for any speech or debate in either House, they shall not be questioned in any other place.&lt;/p&gt;\r\n\r\n&lt;p&gt;No Senator or Representative shall, during the time for which he was elected, be appointed to any civil office under the authority of the United States, which shall have been created, or the emoluments whereof shall have been increased during such time； and no person holding any office under the United States, shall be a member of either House during his continuance in office.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 7.&lt;/p&gt;\r\n\r\n&lt;p&gt;All bills for raising revenue shall originate in the House of Representatives； but the Senate may propose or concur with amendments as on other Bills.&lt;/p&gt;\r\n\r\n&lt;p&gt;Every bill which shall have passed the House of Representatives and the Senate, shall, before it become a law, be presented to the President of the United States； if he approve he shall sign it, but if not he shall return it, with his objections to that House in which it shall have originated, who shall enter the objections at large on their journal, and proceed to reconsider it. If after such reconsideration two thirds of that House shall agree to pass the bill, it shall be sent, together with the objections, to the other House, by which it shall likewise be reconsidered, and if approved by two thirds of that House, it shall become a law. But in all such cases the votes of both Houses shall be determined by yeas and nays, and the names of the persons voting for and against the bill shall be entered on the journal of each House respectively. If any bill shall not be returned by the President within ten days (Sundays excepted) after it shall have been presented to him, the same shall be a law, in like manner as if he had signed it, unless the Congress by their adjournment prevent its return, in which case it shall not be a law.&lt;/p&gt;\r\n\r\n&lt;p&gt;Every order, resolution, or vote to which the concurrence of the Senate and House of Representatives may be necessary (except on a question of adjournment) shall be presented to the President of the United States； and before the same shall take effect, shall be approved by him, or being disapproved by him, shall be repassed by two thirds of the Senate and House of Representatives, according to the rules and limitations prescribed in the case of a bill.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 8.&lt;/p&gt;\r\n\r\n&lt;p&gt;The Congress shall have power to lay and collect taxes, duties, imposts and excises, to pay the debts and provide for the common defense and general welfare of the United States； but all duties, imposts and excises shall be uniform throughout the United States；&lt;/p&gt;\r\n\r\n&lt;p&gt;To borrow money on the credit of the United States；&lt;/p&gt;\r\n\r\n&lt;p&gt;To regulate commerce with foreign nations, and among the several states, and with the Indian tribes；&lt;/p&gt;\r\n\r\n&lt;p&gt;To establish a uniform rule of naturalization, and uniform laws on the subject of bankruptcies throughout the United States；&lt;/p&gt;\r\n\r\n&lt;p&gt;To coin money, regulate the value thereof, and of foreign coin, and fix the standard of weights and measures；&lt;/p&gt;\r\n\r\n&lt;p&gt;To provide for the punishment of counterfeiting the securities and current coin of the United States；&lt;/p&gt;\r\n\r\n&lt;p&gt;To establish post offices and post roads；&lt;/p&gt;\r\n\r\n&lt;p&gt;To promote the progress of science and useful arts, by securing for limited times to authors and inventors the exclusive right to their respective writings and discoveries；&lt;/p&gt;\r\n\r\n&lt;p&gt;To constitute tribunals inferior to the Supreme Court；&lt;/p&gt;\r\n\r\n&lt;p&gt;To define and punish piracies and felonies committed on the high seas, and offenses against the law of nations；&lt;/p&gt;\r\n\r\n&lt;p&gt;To declare war, grant letters of marque and reprisal, and make rules concerning captures on land and water；&lt;/p&gt;\r\n\r\n&lt;p&gt;To raise and support armies, but no appropriation of money to that use shall be for a longer term than two years；&lt;/p&gt;\r\n\r\n&lt;p&gt;To provide and maintain a navy；&lt;/p&gt;\r\n\r\n&lt;p&gt;To make rules for the government and regulation of the land and naval forces；&lt;/p&gt;\r\n\r\n&lt;p&gt;To provide for calling forth the militia to execute the laws of the union, suppress insurrections and repel invasions；&lt;/p&gt;\r\n\r\n&lt;p&gt;To provide for organizing, arming, and disciplining, the militia, and for governing such part of them as may be employed in the service of the United States, reserving to the states respectively, the appointment of the officers, and the authority of training the militia according to the discipline prescribed by Congress；&lt;/p&gt;\r\n\r\n&lt;p&gt;To exercise exclusive legislation in all cases whatsoever, over such District (not exceeding ten miles square) as may, by cession of particular states, and the acceptance of Congress, become the seat of the government of the United States, and to exercise like authority over all places purchased by the consent of the legislature of the state in which the same shall be, for the erection of forts, magazines, arsenals, dockyards, and other needful buildings；&lt;/p&gt;\r\n\r\n&lt;p&gt;To make all laws which shall be necessary and proper for carrying into execution the foregoing powers, and all other powers vested by this Constitution in the government of the United States, or in any department or officer thereof.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 9.&lt;/p&gt;\r\n\r\n&lt;p&gt;The migration or importation of such persons as any of the states now existing shall think proper to admit, shall not be prohibited by the Congress prior to the year one thousand eight hundred and eight, but a tax or duty may be imposed on such importation, not exceeding ten dollars for each person.&lt;/p&gt;\r\n\r\n&lt;p&gt;The privilege of the writ of habeas corpus shall not be suspended, unless when in cases of rebellion or invasion the public safety may require it.&lt;/p&gt;\r\n\r\n&lt;p&gt;No bill of attainder or ex post facto Law shall be passed.&lt;/p&gt;\r\n\r\n&lt;p&gt;No capitation, or other direct, tax shall be laid, unless in proportion to the census or enumeration herein before directed to be taken.&lt;/p&gt;\r\n\r\n&lt;p&gt;No tax or duty shall be laid on articles exported from any state.&lt;/p&gt;\r\n\r\n&lt;p&gt;No preference shall be given by any regulation of commerce or revenue to the ports of one state over those of another: nor shall vessels bound to, or from, one state, be obliged to enter, clear or pay duties in another.&lt;/p&gt;\r\n\r\n&lt;p&gt;No money shall be drawn from the treasury, but in consequence of appropriations made by law； and a regular statement and account of receipts and expenditures of all public money shall be published from time to time.&lt;/p&gt;\r\n\r\n&lt;p&gt;No title of nobility shall be granted by the United States: and no person holding any office of profit or trust under them, shall, without the consent of the Congress, accept of any present, emolument, office, or title, of any kind whatever, from any king, prince, or foreign state.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 10.&lt;/p&gt;\r\n\r\n&lt;p&gt;No state shall enter into any treaty, alliance, or confederation； grant letters of marque and reprisal； coin money； emit bills of credit； make anything but gold and silver coin a tender in payment of debts； pass any bill of attainder, ex post facto law, or law impairing the obligation of contracts, or grant any title of nobility.&lt;/p&gt;\r\n\r\n&lt;p&gt;No state shall, without the consent of the Congress, lay any imposts or duties on imports or exports, except what may be absolutely necessary for executing it s inspection laws: and the net produce of all duties and imposts, laid by any state on imports or exports, shall be for the use of the treasury of the United States； and all such laws shall be subject to the revision and control of the Congress.&lt;/p&gt;\r\n\r\n&lt;p&gt;No state shall, without the consent of Congress, lay any duty of tonnage, keep troops, or ships of war in time of peace, enter into any agreement or compact with another state, or with a foreign power, or engage in war, unless actually invaded, or in such imminent danger as will not admit of delay.&lt;/p&gt;\r\n\r\n&lt;p&gt;Article II&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 1.&lt;/p&gt;\r\n\r\n&lt;p&gt;The executive power shall be vested in a President of the United States of America. He shall hold his office during the term of four years, and, together with the Vice President, chosen for the same term, be elected, as follows:&lt;/p&gt;\r\n\r\n&lt;p&gt;Each state shall appoint, in such manner as the Legislature thereof may direct, a number of electors, equal to the whole number of Senators and Representatives to which the State may be entitled in the Congress: but no Senator or Representative, or person holding an office of trust or profit under the United States, shall be appointed an elector.&lt;/p&gt;\r\n\r\n&lt;p&gt;The electors shall meet in their respective states, and vote by ballot for two persons, of whom one at least shall not be an inhabitant of the same state with themselves. And they shall make a list of all the persons voted for, and of the number of votes for each； which list they shall sign and certify, and transmit sealed to the seat of the government of the United States, directed to the President of the Senate. The President of the Senate shall, in the presence of the Senate and House of Representatives, open all the certificates, and the votes shall then be counted. The person having the greatest number of votes shall be the President, if such number be a majority of the whole number of electors appointed； and if there be more than one who have such majority, and have an equal number of votes, then the House of Representatives shall immediately choose by ballot one of them for President； and if no person have a majority, then from the five highest on the list the said House shall in like manner choose the President. But in choosing the President, the votes shall be taken by States, the representation from each state having one vote； A quorum for this purpose shall consist of a member or members from two thirds of the states, and a majority of all the states shall be necessary to a choice. In every case, after the choice of the President, the person having the greatest number of votes of the electors shall be the Vice President. But if there should remain two or more who have equal votes, the Senate shall choose from them by ballot the Vice President.&lt;/p&gt;\r\n\r\n&lt;p&gt;The Congress may determine the time of choosing the electors, and the day on which they shall give their votes； which day shall be the same throughout the United States.&lt;/p&gt;\r\n\r\n&lt;p&gt;No person except a natural born citizen, or a citizen of the United States, at the time of the adoption of this Constitution, shall be eligible to the office of President； neither shall any person be eligible to that office who shall not have attained to the age of thirty five years, and been fourteen Years a resident within the United States.&lt;/p&gt;\r\n\r\n&lt;p&gt;In case of the removal of the President from office, or of his death, resignation, or inability to discharge the powers and duties of the said office, the same shall devolve on the Vice President, and the Congress may by law provide for the case of removal, death, resignation or inability, both of the President and Vice President, declaring what officer shall then act as President, and such officer shall act accordingly, until the disability be removed, or a President shall be elected.&lt;/p&gt;\r\n\r\n&lt;p&gt;The President shall, at stated times, receive for his services, a compensation, which shall neither be increased nor diminished during the period for which he shall have been elected, and he shall not receive within that period any other emolument from the United States, or any of them.&lt;/p&gt;\r\n\r\n&lt;p&gt;Before he enter on the execution of his office, he shall take the following oath or affirmation:--&amp;quot;I do solemnly swear (or affirm) that I will faithfully execute the office of President of the United States, and will to the best of my ability, preserve, protect and defend the Constitution of the United States.&amp;quot;&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 2.&lt;/p&gt;\r\n\r\n&lt;p&gt;The President shall be commander in chief of the Army and Navy of the United States, and of the militia of the several states, when called into the actual service of the United States； he may require the opinion, in writing, of the principal officer in each of the executive departments, upon any subject relating to the duties of their respective offices, and he shall have power to grant reprieves and pardons for offenses against the United States, except in cases of impeachment.&lt;/p&gt;\r\n\r\n&lt;p&gt;He shall have power, by and with the advice and consent of the Senate, to make treaties, provided two thirds of the Senators present concur； and he shall nominate, and by and with the advice and consent of the Senate, shall appoint ambassadors, other public ministers and consuls, judges of the Supreme Court, and all other officers of the United States, whose appointments are not herein otherwise provided for, and which shall be established by law: but the Congress may by law vest the appointment of such inferior officers, as they think proper, in the President alone, in the courts of law, or in the heads of departments.&lt;/p&gt;\r\n\r\n&lt;p&gt;The President shall have power to fill up all vacancies that may happen during the recess of the Senate, by granting commissions which shall expire at the end of their next session.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 3.&lt;/p&gt;\r\n\r\n&lt;p&gt;He shall from time to time give to the Congress information of the state of the union, and recommend to their consideration such measures as he shall judge necessary and expedient； he may, on extraordinary occasions, convene both Houses, or either of them, and in case of disagreement between them, with respect to the time of adjournment, he may adjourn them to such time as he shall think proper； he shall receive ambassadors and other public ministers； he shall take care that the laws be faithfully executed, and shall commission all the officers of the United States.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 4.&lt;/p&gt;\r\n\r\n&lt;p&gt;The President, Vice President and all civil officers of the United States, shall be removed from office on impeachment for, and conviction of, treason, bribery, or other high crimes and misdemeanors.&lt;/p&gt;\r\n\r\n&lt;p&gt;Article III&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 1.&lt;/p&gt;\r\n\r\n&lt;p&gt;The judicial power of the United States, shall be vested in one Supreme Court, and in such inferior courts as the Congress may from time to time ordain and establish. The judges, both of the supreme and inferior courts, shall hold their offices during good behaviour, and shall, at stated times, receive for their services, a compensation, which shall not be diminished during their continuance in office.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 2.&lt;/p&gt;\r\n\r\n&lt;p&gt;The judicial power shall extend to all cases, in law and equity, arising under this Constitution, the laws of the United States, and treaties made, or which shall be made, under their authority；--to all cases affecting ambassadors, other public ministers and consuls；--to all cases of admiralty and maritime jurisdiction；--to controversies to which the United States shall be a party；--to controversies between two or more states；--between a state and citizens of another state；--between citizens of different states；--between citizens of the same state claiming lands under grants of different states, and between a state, or the citizens thereof, and foreign states, citizens or subjects.&lt;/p&gt;\r\n\r\n&lt;p&gt;In all cases affecting ambassadors, other public ministers and consuls, and those in which a state shall be party, the Supreme Court shall have original jurisdiction. In all the other cases before mentioned, the Supreme Court shall have appellate jurisdiction, both as to law and fact, with such exceptions, and under such regulations as the Congress shall make.&lt;br /&gt;\r\nThe trial of all crimes, except in cases of impeachment, shall be by jury； and such trial shall be held in the state where the said crimes shall have been committed； but when not committed within any state, the trial shall be at such place or places as the Congress may by law have directed.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 3.&lt;/p&gt;\r\n\r\n&lt;p&gt;Treason against the United States, shall consist only in levying war against them, or in adhering to their enemies, giving them aid and comfort. No person shall be convicted of treason unless on the testimony of two witnesses to the same overt act, or on confession in open court.&lt;/p&gt;\r\n\r\n&lt;p&gt;The Congress shall have power to declare the punishment of treason, but no attainder of treason shall work corruption of blood, or forfeiture except during the life of the person attainted.&lt;/p&gt;\r\n\r\n&lt;p&gt;Article IV&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 1.&lt;/p&gt;\r\n\r\n&lt;p&gt;Full faith and credit shall be given in each state to the public acts, records, and judicial proceedings of every other state. And the Congress may by general laws prescribe the manner in which such acts, records, and proceedings shall be proved, and the effect thereof.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 2.&lt;/p&gt;\r\n\r\n&lt;p&gt;The citizens of each state shall be entitled to all privileges and immunities of citizens in the several states.&lt;/p&gt;\r\n\r\n&lt;p&gt;A person charged in any state with treason, felony, or other crime, who shall flee from justice, and be found in another state, shall on demand of the executive authority of the state from which he fled, be delivered up, to be removed to the state having jurisdiction of the crime.&lt;/p&gt;\r\n\r\n&lt;p&gt;No person held to service or labor in one state, under the laws thereof, escaping into another, shall, in consequence of any law or regulation therein, be discharged from such service or labor, but shall be delivered up on claim of the party to whom such service or labor may be due.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 3.&lt;/p&gt;\r\n\r\n&lt;p&gt;New states may be admitted by the Congress into this union； but no new states shall be formed or erected within the jurisdiction of any other state； nor any state be formed by the junction of two or more states, or parts of states, without the consent of the legislatures of the states concerned as well as of the Congress.&lt;/p&gt;\r\n\r\n&lt;p&gt;The Congress shall have power to dispose of and make all needful rules and regulations respecting the territory or other property belonging to the United States； and nothing in this Constitution shall be so construed as to prejudice any claims of the United States, or of any particular state.&lt;/p&gt;\r\n\r\n&lt;p&gt;Section 4.&lt;/p&gt;\r\n\r\n&lt;p&gt;The United States shall guarantee to every state in this union a republican form of government, and shall protect each of them against invasion； and on application of the legislature, or of the executive (when the legislature cannot be convened) against domestic violence.&lt;/p&gt;\r\n\r\n&lt;p&gt;Article V&lt;/p&gt;\r\n\r\n&lt;p&gt;The Congress, whenever two thirds of both houses shall deem it necessary, shall propose amendments to this Constitution, or, on the application of the legislatures of two thirds of the several states, shall call a convention for proposing amendments, which, in either case, shall be valid to all intents and purposes, as part of this Constitution, when ratified by the legislatures of three fourths of the several states, or by conventions in three fourths thereof, as the one or the other mode of ratification may be proposed by the Congress； provided that no amendment which may be made prior to the year one thousand eight hundred and eight shall in any manner affect the first and fourth clauses in the ninth section of the first article； and that no state, without its consent, shall be deprived of its equal suffrage in the Senate.&lt;/p&gt;\r\n\r\n&lt;p&gt;Article VI&lt;/p&gt;\r\n\r\n&lt;p&gt;All debts contracted and engagements entered into, before the adoption of this Constitution, shall be as valid against the United States under this Constitution, as under the Confederation.&lt;/p&gt;\r\n\r\n&lt;p&gt;This Constitution, and the laws of the United States which shall be made in pursuance thereof； and all treaties made, or which shall be made, under the authority of the United States, shall be the supreme law of the land； and the judges in every state shall be bound thereby, anything in the Constitution or laws of any State to the contrary notwithstanding.&lt;/p&gt;\r\n\r\n&lt;p&gt;The Senators and Representatives before mentioned, and the members of the several state legislatures, and all executive and judicial officers, both of the United States and of the several states, shall be bound by oath or affirmation, to support this Constitution； but no religious test shall ever be required as a qualification to any office or public trust under the United States.&lt;/p&gt;\r\n\r\n&lt;p&gt;Article VII&lt;/p&gt;\r\n\r\n&lt;p&gt;The ratification of the conventions of nine states, shall be sufficient for the establishment of this Constitution between the states so ratifying the same.&lt;/p&gt;\r\n\r\n&lt;p&gt;Done in convention by the unanimous consent of the states present the seventeenth day of September in the year of our Lord one thousand seven hundred and eighty seven and of the independence of the United States of America the twelfth.In witness whereof We have hereunto subscribed our Names,&lt;/p&gt;\r\n\r\n&lt;p&gt;G. Washington-Presidt. and deputy from Virginia&lt;/p&gt;\r\n\r\n&lt;p&gt;New Hampshire: John Langdon, Nicholas Gilman&lt;/p&gt;\r\n\r\n&lt;p&gt;Massachusetts: Nathaniel Gorham, Rufus King&lt;/p&gt;\r\n\r\n&lt;p&gt;Connecticut: Wm: Saml. Johnson, Roger Sherman&lt;/p&gt;\r\n\r\n&lt;p&gt;New York: Alexander Hamilton&lt;/p&gt;\r\n\r\n&lt;p&gt;New Jersey: Wil: Livingston, David Brearly, Wm. Paterson, Jona: Dayton&lt;/p&gt;\r\n\r\n&lt;p&gt;Pennsylvania: B. Franklin, Thomas Mifflin, Robt. Morris, Geo. Clymer, Thos. FitzSimons, Jared Ingersoll, James Wilson, Gouv Morris&lt;/p&gt;\r\n\r\n&lt;p&gt;Delaware: Geo: Read, Gunning Bedford jun, John Dickinson, Richard Bassett, Jaco: Broom&lt;/p&gt;\r\n\r\n&lt;p&gt;Maryland: James McHenry, Dan of St Thos. Jenifer, Danl Carroll&lt;/p&gt;\r\n\r\n&lt;p&gt;Virginia: John Blair, James Madison Jr.&lt;/p&gt;\r\n\r\n&lt;p&gt;North Carolina: Wm. Blount, Richd. Dobbs Spaight, Hu Williamson&lt;/p&gt;\r\n\r\n&lt;p&gt;South Carolina: J. Rutledge, Charles Cotesworth Pinckney, Charles Pinckney, Pierce Butler&lt;/p&gt;\r\n\r\n&lt;p&gt;Georgia: William Few, Abr Baldwin&lt;/p&gt;', 1515938425, 'peadmin', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `x2_docs`
--

CREATE TABLE `x2_docs` (
  `docid` int(11) NOT NULL,
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
  `docistop` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_docs`
--

INSERT INTO `x2_docs` (`docid`, `doctitle`, `docthumb`, `doccatid`, `dockeywords`, `doccontentid`, `docinputtime`, `docmodifytime`, `docsequence`, `docdescribe`, `doclocker`, `doclocktime`, `docneedmore`, `docsyslock`, `docistop`) VALUES
(2, '1787年美国宪法', 'files/attach/images/content/20180314/15210375119234.jpg', 12, '', 6, 1515934840, 1521037513, 1, '1787年美国宪法', '', 0, 1, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `x2_examhistory`
--

CREATE TABLE `x2_examhistory` (
  `ehid` int(11) NOT NULL,
  `ehexamid` varchar(255) NOT NULL DEFAULT '0',
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
  `ehispass` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_examhistory`
--

INSERT INTO `x2_examhistory` (`ehid`, `ehexamid`, `ehexam`, `ehtype`, `ehbasicid`, `ehquestion`, `ehsetting`, `ehscorelist`, `ehuseranswer`, `ehtime`, `ehscore`, `ehuserid`, `ehusername`, `ehstarttime`, `ehendtime`, `ehstatus`, `ehdecide`, `ehtimelist`, `ehopenid`, `ehneedresit`, `ehispass`) VALUES
(33, '0', '考试开始了', 0, 1, 'eNrtVl9P2lAU/ypLH/a6lqJg+6Tzed+hYreRITpaZ4whQSf+hWoUFBHFLCiaqeDcCK2o38X19pYnv8LOLR20WiUmS9yDSZPee37n3HPu6e93ewWO5aYkjmE46vO4KMnh0Wh4WKJ4gfMRe7Bjtm1hjoEBSwY0L3F+jmJ6AizFE7s9ZRgy9dlTf8BH8fEwx0IY4wxjmT4A4u7ksdEJin/Hg7WvY5Tu5ybLkgUDVvW0s3rKmRhAXweUJ8dEywYwebu2B+YgxGGligqHen0DZ1N6famZyOPMIc7PImXOOM/eJDLwoOQxTG8bKaOwqGuasX2lNxpGrmImUs2dXVSo4nJVV5f1unaTKJj71+B8k9j5nZhByRo63YVAfFSDsbGnGtoqTM3rLVxOt1IgtQaL6FoZZ4q6pkC4saESn0QKUrTtvTRNo1IeqT/RYhrqszbg72xoXBJjrWbAbmnr3etGo8KI1Q3oHnn5HI2KCJI8Mjocfj9JHB1OzgySGBFDcqvHAL+OyPzY6w8y38+hlRKqp8zkErG9sYxtdMBCi1/Rihf6lqD4crN5dOyBDlqx6SrSDjqoVTt9t6zo+MhQq3LYvv9u6UJUmmijA3ebMyxKoVh4SHThPR38U3R0QiK9bTPalkuAo9pYh2U9tvXvMkYjg0saLu6blTk8o9oicHAxFBMFWZTDrc9D2A2iYnvpIB1k7n0EWZDHJWc6J+E/yiMRih+yNOeMGhNiYlR+iBySCKNoSHThrIMd4hcxYoMtcRPRd5GjdSw8SY4sHAFmdZqQ/kIxtlVjPY1Ks8ZSFi1U0UIOleZhCsy/bRSflfx00EV+oK5ZS3oyHyvLSD33pH3zYhZd73lz/qRoXl29EP7/InyA7UZ48lt8EuH90Cvz23e8foAWNJT8pV/nkHIBRz9aVeBPg0pp86oIhMf5eVTfAV08K+173We+kVOMrQo63XxlFM7w/nRzreqpAeJ3cmD7ISWPk2VPQYAf3t+1/czKUXOt7KkO8DOXzxx5s/P/UCqDXaQy+CKVx6XivPmRK18X0ViXwgdFw3qIxgf25o9pvHICgoAB2r6EKxnctZ5THH73LwFVVE8tNDNbT+Kq71Gu9nfhav8LVx/mKkPKj7uzxqzNCvCpp+LxP8sp6HU=', 'eNpLtDK1qi62srRSKk5NLsnMz8tMUbIutjK0UjIE0eZWStl5+eXFEFFjoKiOEYhlaqVUklmSkwpWC+S8aGh+sX7q0z0NT5d3P9nVBhI2ASnJTYWaZgaizayU8kpzk1KLlKwTgZzqTCtDiKyxknWmlTHc3kwrIyDbwEoJxDRBME0RTDMYs7YWAAdGO30=', 'a:4:{i:1472;i:1;i:1511;i:0;i:1573;i:0;i:1319;i:1;}', 'a:4:{i:1472;s:1:\"B\";i:1511;s:1:\"A\";i:1573;s:1:\"C\";i:1319;s:1:\"A\";}', 35, '50.00', 1, 'peadmin', 1521075543, 0, 1, 0, '', '', 0, 1),
(32, '0', '测试重做', 0, 1, 'eNrtlk1v0zAcxr9LDrtiJ311TqOc+Q5payCiTUvtUk1VpTIYtNsYmzR1U9fSA0NwYp2EYC+FfpepTsJpXwHb6Zqk6zp6QLvsFPt5HP8f27+8GEhDVYIgRMqLMibULFhmlii6gVShJ3xZaBBVTQR5QxMNoBMUQQqMAaDoQve6MA5FV+VdDSnJuKbotVq4RKlQUfTHOleTvkiuV+A3Cy0uI4JgRCUwO/dU36MrRSw1HkVcQ0sgKBpHyp/2ht3p2s06+9AanX9y2m8u6h228/Wi3r0cbLLjj6OzLba5x8e4w317/4i9F+3LQU/OG/EnLBNc8rLwakBeY2HXMvIyDQ8vLmogaM4gNF/Imk9WxMDAoGAFgnM4Q2Vwri7lqF5cekr1ZeTlE8IDqUysh8iL61uyMJie0yrn015Znl2drmtYpDJxl6dXlsUkUzLTOORHff+5VagQsTHjAwVXPPHNn3j+EUXH6tU09mDXOTxzep/do7fO6umYn8BBZkrYoJia3t4KMmAUajGQAAl4bQepQcskWC5IyzOazyl6WrIcvKtolLBFbzpZgnnLyuCQrwWOFr/EOb9kjSPNn4o5KE+em4VY1vg8dqvv7PY4xe7P7uh83e402WGb9XfY6fc7BhaqYWIhAGB08o4Hm0mtOs9O8bXOsR+hyAz7H7iPzOU+dQv3qXvub+Ze9bjnH4dbuJefj8W5//HN+b3urjb525s1DtiXDbe+xt/Vbv/VHXOf1ELY241ttt206137eG8m+HZ3a3TSsvs7M7lnw19suOa8bizEtXbP9f/kWuZXQ/8z8u8FoGqt9hd6ak0A', 'eNpLtDK1qi62srRSKk5NLsnMz8tMUbIutjK0UjIE0eZWStl5+eXFEFFjoKiOEYhlaqVUklmSkwpim1kpPdva/WL9VBDHBCSRCxY3slIyM4AqyCvNTUotUrJOBHKqM60MIVYYK1lnWhkB2QZWSiCmMYJpgmCaIphmMGZtLQA/GTUr', 'a:3:{i:973;i:1;i:1171;i:0;i:1600;i:0;}', 'a:3:{i:973;s:1:\"A\";i:1171;s:1:\"B\";i:1600;s:1:\"A\";}', 20, '33.30', 1, 'peadmin', 1521039526, 0, 1, 0, '', '', 0, 1),
(36, '1,2', 'TEST', 0, 1, 'eNrtU91y0kAYfZdc9M6RBCh0c1Vre+k7pHTVjBAwG2Q6HWZA+19sRS3tMCA44ow6dmipdSjG6bt0sktyxSu4G5BsaNDeeeNVNuec/f72OwoIgzUERBEIT7MQGWpaU1eQICtAYnjcg0eYCkR6ENkhJCMQAYIYm40Icl4F0iQhRWOUyPvD6+mcID+QKTrngehmdBaWnWNufSG+PoFPTEnJI43VDHQxSrOvrwF6i/7bp0Vc+2SXT+xXJbxxbnX3SKncL7Zxq0YqRwOzZHVf4u1N+0XN/tYYmA03XMSLk0VQH9ZAk4Tc76yf1ZSUWwQtmn0krr6kgoxUekV9uMqEnIjPgGASJgwXDdPQM0lDzsw8MuR5gM2m8+HdHefzV/v7BsPvusRYcY9T4M5ZgGIB2BcXVq88PcZ94PxYx1fNGwq3l9BkmVo2tTzshI4jMtmKoqHcmJ2fHNYKRAldXYY+PurxT7R0DrFZjxdrtJcxIIw577GjI/R3GGK+7bd6/cZHu73Zf3452kVuJRI6VAxoqMPnYksmRunIQ/FQXLzxKIZiZBGfjt+7x0YqKcjL7urztzKKDjVj2rIgSE9aAvr4MLct8BlMjkiJlc+ZjLnrL/5w/TfVH1KAP+J0sHh/Ex90rO5uv7p+XahZ3RbpnJPKFjnevy7Ure6Ji9eHOBWQ0hZFyHEbv/nCwPp7pr8oUusMzG3cqjqFnYG5809tFJ/z2+jU7P88omUGWogUXwdTC8A5vCJnjUDTWL0qNYxT2A2+uwhw75A0TWerRCrtYM0SwJcmPiiTvR0m5jW38N7sdO/RyS0u/cl8nuC/+wLdF2bl5/1ZdbdZha7eWj7/C3yvvX0=', 'eNpNzT0SgjAQxfG7vNqCBBLHR+0J5AKgKXaUMGPiWDDc3Sx+YLW//Tevp+OceCBSOGeZolzQJhrC6N0T1zg907vWpe6syhFZ8i2oG6I7nroPs4xrtYSvFJ6Ij3EId7R9eWah+Q0I7Z/r4opQNhvdRv/lsrwA6RkyRw==', 'a:2:{i:1764;i:0;i:1257;i:0;}', 'a:2:{i:1764;s:1:\"C\";i:1257;a:2:{i:0;s:1:\"A\";i:1;s:1:\"B\";}}', 368, '0.00', 1, 'peadmin', 1521128662, 0, 1, 0, '', '', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `x2_exams`
--

CREATE TABLE `x2_exams` (
  `examid` int(11) NOT NULL,
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
  `examdecide` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_exams`
--

INSERT INTO `x2_exams` (`examid`, `examsubject`, `exam`, `examsetting`, `examquestions`, `examscore`, `examstatus`, `examtype`, `examauthorid`, `examauthor`, `examtime`, `examkeyword`, `examdecide`) VALUES
(1, 1, '演示试卷一', 'a:7:{s:8:\"examtime\";s:2:\"60\";s:7:\"comfrom\";s:0:\"\";s:5:\"score\";s:3:\"100\";s:9:\"passscore\";s:3:\"100\";s:12:\"questypelite\";a:6:{i:1;s:1:\"1\";i:2;s:1:\"1\";i:3;s:1:\"1\";i:4;s:1:\"0\";i:5;s:1:\"0\";i:6;s:1:\"1\";}s:10:\"scalemodel\";s:1:\"0\";s:8:\"questype\";a:4:{i:1;a:6:{s:6:\"number\";s:2:\"30\";s:5:\"score\";s:1:\"1\";s:8:\"describe\";s:0:\"\";s:10:\"easynumber\";s:2:\"30\";s:12:\"middlenumber\";s:1:\"0\";s:10:\"hardnumber\";s:1:\"0\";}i:2;a:6:{s:6:\"number\";s:2:\"30\";s:5:\"score\";s:1:\"1\";s:8:\"describe\";s:0:\"\";s:10:\"easynumber\";s:2:\"30\";s:12:\"middlenumber\";s:1:\"0\";s:10:\"hardnumber\";s:1:\"0\";}i:3;a:6:{s:6:\"number\";s:2:\"40\";s:5:\"score\";s:1:\"1\";s:8:\"describe\";s:0:\"\";s:10:\"easynumber\";s:2:\"40\";s:12:\"middlenumber\";s:1:\"0\";s:10:\"hardnumber\";s:1:\"0\";}i:6;a:6:{s:6:\"number\";s:1:\"1\";s:5:\"score\";s:2:\"10\";s:8:\"describe\";s:0:\"\";s:10:\"easynumber\";s:1:\"1\";s:12:\"middlenumber\";s:1:\"0\";s:10:\"hardnumber\";s:1:\"0\";}}}', '', '', 0, 1, 1, 'peadmin', 1479265100, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `x2_examsession`
--

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
  `examsessiontimelist` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `x2_exercise`
--

CREATE TABLE `x2_exercise` (
  `exerid` int(11) NOT NULL,
  `exeruserid` int(11) NOT NULL,
  `exerbasicid` int(11) NOT NULL,
  `exerknowsid` int(11) NOT NULL,
  `exernumber` int(11) NOT NULL,
  `exerqutype` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_exercise`
--

INSERT INTO `x2_exercise` (`exerid`, `exeruserid`, `exerbasicid`, `exerknowsid`, `exernumber`, `exerqutype`) VALUES
(1, 1, 1, 1, 1, 3);

-- --------------------------------------------------------

--
-- 表的结构 `x2_favor`
--

CREATE TABLE `x2_favor` (
  `favorid` int(11) NOT NULL,
  `favoruserid` int(11) NOT NULL DEFAULT '0',
  `favorsubjectid` int(11) NOT NULL DEFAULT '0',
  `favorquestionid` int(11) NOT NULL DEFAULT '0',
  `favortime` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_favor`
--

INSERT INTO `x2_favor` (`favorid`, `favoruserid`, `favorsubjectid`, `favorquestionid`, `favortime`) VALUES
(2, 1, 1, 888, 1499409847),
(3, 1, 1, 1, 1504093527),
(4, 1, 1, 26, 1504094848);

-- --------------------------------------------------------

--
-- 表的结构 `x2_feedback`
--

CREATE TABLE `x2_feedback` (
  `fbid` int(11) NOT NULL,
  `fbquestionid` int(11) NOT NULL,
  `fbtype` varchar(120) NOT NULL,
  `fbcontent` text NOT NULL,
  `fbuserid` int(11) NOT NULL,
  `fbtime` int(11) NOT NULL,
  `fbstatus` tinyint(4) NOT NULL,
  `fbdoneuserid` int(11) NOT NULL,
  `fbdonetime` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `x2_gbook`
--

CREATE TABLE `x2_gbook` (
  `gbid` int(11) NOT NULL,
  `gbinfo` text NOT NULL,
  `gbcontent` text NOT NULL,
  `gbreply` text NOT NULL,
  `gbtime` int(11) NOT NULL DEFAULT '0',
  `gbreplytime` int(11) NOT NULL DEFAULT '0',
  `gbstatus` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `x2_knows`
--

CREATE TABLE `x2_knows` (
  `knowsid` int(11) NOT NULL,
  `knows` varchar(120) NOT NULL DEFAULT '',
  `knowssectionid` int(11) NOT NULL DEFAULT '0',
  `knowsdescribe` text NOT NULL,
  `knowsstatus` int(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_knows`
--

INSERT INTO `x2_knows` (`knowsid`, `knows`, `knowssectionid`, `knowsdescribe`, `knowsstatus`) VALUES
(1, '演示知识点', 1, '', 1),
(2, '测试2知识点', 1, '', 1),
(3, '测试知识点二', 5, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `x2_log`
--

CREATE TABLE `x2_log` (
  `logid` int(11) NOT NULL,
  `loguserid` int(11) DEFAULT '0',
  `logcourseid` int(11) DEFAULT '0',
  `logtime` int(11) DEFAULT '0',
  `logstatus` int(1) DEFAULT NULL,
  `logendtime` int(11) DEFAULT NULL,
  `logprogress` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_log`
--

INSERT INTO `x2_log` (`logid`, `loguserid`, `logcourseid`, `logtime`, `logstatus`, `logendtime`, `logprogress`) VALUES
(408, 1, 1, 1520693307, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `x2_module`
--

CREATE TABLE `x2_module` (
  `moduleid` int(11) NOT NULL,
  `modulecode` varchar(24) NOT NULL DEFAULT '',
  `modulename` varchar(60) NOT NULL DEFAULT '',
  `moduledescribe` tinytext NOT NULL,
  `moduleapp` varchar(24) NOT NULL DEFAULT '',
  `moduletable` varchar(24) NOT NULL DEFAULT '',
  `moduleallowreg` tinyint(1) DEFAULT '0',
  `modulestatus` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_module`
--

INSERT INTO `x2_module` (`moduleid`, `modulecode`, `modulename`, `moduledescribe`, `moduleapp`, `moduletable`, `moduleallowreg`, `modulestatus`) VALUES
(1, 'manager', '管理员模型', '管理员', 'user', 'user_data', 0, 0),
(9, 'normal', '普通用户模型', '普通用户', 'user', '', 0, 0),
(4, 'news', '新闻', '新闻', 'content', 'content_data', 0, 0),
(11, 'spnormal', '普通信息', '普通信息', 'special', '', 0, 0),
(12, 'teacher', '教师模型', '教师模型', 'user', '', 0, 0),
(14, 'course', '视频课程', '视频课程', 'course', '', 0, 0),
(15, 'pdf', '文本课程', '文本课程', 'course', '', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `x2_module_fields`
--

CREATE TABLE `x2_module_fields` (
  `fieldid` int(11) NOT NULL,
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
  `fieldpublic` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_module_fields`
--

INSERT INTO `x2_module_fields` (`fieldid`, `fieldappid`, `fieldmoduleid`, `fieldsequence`, `field`, `fieldtitle`, `fieldlength`, `fielddescribe`, `fieldtype`, `fieldhtmltype`, `fieldhtmlproperty`, `fieldvalues`, `fielddefault`, `fieldlock`, `fieldindextype`, `fieldforbidactors`, `fieldsystem`, `fieldpublic`) VALUES
(1, 'user', 1, 2, 'manager_apps', '可管理模块', '240', '', 'varchar', 'checkboxarray', 'class=form-control\r\nstyle=width:30%', '用户=user\r\n内容=content\r\n考试=exam\r\n文件=document\r\n课程=course\r\n财务=bank', '', 0, '', ',-1,', 0, 0),
(2, 'user', 1, 0, 'photo', '用户肖像', '120', '', 'varchar', 'thumb', '', '', '', 0, '0', ',,', 0, 1),
(3, 'user', 1, 0, 'usertruename', '真实姓名', '24', '', 'varchar', 'text', 'class=form-control', '', '', 0, '0', ',,', 0, 1),
(7, 'user', 12, 0, 'teacher_subjects', '可管理科目', '', '', 'text', 'checkboxarray', '', '演示课程=1', '', 0, '0', ',-1,', 0, 0),
(8, 'content', 13, 0, 'cizhuan_guige', '规格', '60', '', 'varchar', 'radio', '', '90*90=1\r\n60*60=2', '', 0, '', ',,', 1, 0),
(9, 'content', 13, 0, 'cizhuan_brand', '品牌', '24', '', 'varchar', 'checkboxarray', '', '阿里=阿里\r\n阿里1=阿里1', '', 0, '', ',,', 0, 0),
(10, 'content', 13, 0, 'cizhuan_thumb', '缩略图', '120', '', 'varchar', 'thumb', '', '', '', 0, '', ',,', 0, 0),
(11, 'course', 14, 0, 'course_files', 'MP4视频', '240', 'MP4的视频格式，用于支持IE浏览器的H5播放', 'varchar', 'videotext', 'exectype=upfile\r\nuptypes=*.mp4\r\nfilesize=120 MB', '', '', 0, '', ',,', 0, 0),
(12, 'content', 4, 0, 'tester', '测试字段', '', '', 'text', 'picture', 'class=form-control', '', '', 0, '', ',,', 0, 1),
(13, 'user', 9, 0, 'userischeck', '是否认证', '1', '', 'int', 'radio', '', '是=1\r\n否=0', '1', 0, '', ',-1,', 1, 1),
(14, 'user', 12, 0, 'userprofile', '个人简介', '', '', 'text', 'textarea', 'class=form-control', '', '', 0, '', ',,', 0, 1),
(16, 'course', 14, 0, 'course_oggfile', 'ogg视频', '250', 'ogg视频支持火狐和谷歌浏览器', 'varchar', 'videotext', 'exectype=upfile\r\nuptypes=*.ogg\r\nfilesize=120 MB\r\nattr-ftype=ogg', '', '', 0, '', ',,', 0, 0),
(17, 'course', 14, 0, 'course_webmfile', 'webm视频', '250', 'webm视频用户火狐和谷歌浏览器播放', 'varchar', 'videotext', 'exectype=upfile\r\nuptypes=*.webm\r\nfilesize=120 MB\r\nattr-ftype=webm', '', '', 0, '', ',,', 0, 0),
(18, 'course', 14, 0, 'course_youtu', '优酷土豆源', '240', '', 'varchar', 'text', 'class=form-control', '', '', 0, '', ',,', 0, 0),
(20, 'content', 4, 0, 'demo', '演示', '240', '', 'varchar', 'thumb', '', '', '', 0, '', ',,', 0, 1),
(22, 'course', 15, 0, 'pdf_file', 'PDF文件', '240', '', 'varchar', 'videotext', 'exectype=upfile\r\nuptypes=*.pdf\r\nfilesize=20 MB\r\nattr-ftype=pdf', '', '', 0, '', ',,', 0, 0),
(23, 'course', 15, 0, 'coursepasstime', '最低学习时间', '', '', 'int', 'text', 'class=form-control', '', '', 0, '', ',,', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `x2_openbasics`
--

CREATE TABLE `x2_openbasics` (
  `obid` int(11) NOT NULL,
  `obuserid` int(11) NOT NULL DEFAULT '0',
  `obbasicid` int(11) NOT NULL DEFAULT '0',
  `obtime` int(11) NOT NULL DEFAULT '0',
  `obendtime` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_openbasics`
--

INSERT INTO `x2_openbasics` (`obid`, `obuserid`, `obbasicid`, `obtime`, `obendtime`) VALUES
(83, 1, 2, 1502170663, 1533706663),
(69, 1, 5, 1493734345, 1525270345),
(93, 1, 1, 1513601340, 1522241340),
(76, 5, 2, 1499570149, 1500002149),
(77, 10, 2, 1499570184, 1500002184),
(94, 1, 4, 1515165445, 1546701445);

-- --------------------------------------------------------

--
-- 表的结构 `x2_opencourse`
--

CREATE TABLE `x2_opencourse` (
  `ocid` int(11) NOT NULL,
  `ocuserid` int(11) NOT NULL,
  `occourseid` int(11) NOT NULL,
  `octime` int(11) NOT NULL,
  `ocendtime` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_opencourse`
--

INSERT INTO `x2_opencourse` (`ocid`, `ocuserid`, `occourseid`, `octime`, `ocendtime`) VALUES
(15, 1, 1, 1517401557, 1548937557);

-- --------------------------------------------------------

--
-- 表的结构 `x2_orders`
--

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
  `orderpost` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_orders`
--

INSERT INTO `x2_orders` (`ordersn`, `ordertitle`, `orderdescribe`, `orderitems`, `orderprice`, `orderuserid`, `orderuserinfo`, `orderstatus`, `orderfullprice`, `ordercreatetime`, `orderpaytime`, `orderouttime`, `orderrecivetime`, `orderfaq`, `orderpost`) VALUES
('201703251017785', '考试系统充值 2 元', '', '', '2.00', 1, 'a:1:{s:8:\"username\";s:7:\"peadmin\";}', 2, '0.00', 1490408255, 0, 0, 0, '', '');

-- --------------------------------------------------------

--
-- 表的结构 `x2_poscontent`
--

CREATE TABLE `x2_poscontent` (
  `pcid` int(11) NOT NULL,
  `pcposid` int(11) NOT NULL DEFAULT '0',
  `pccontentid` int(11) NOT NULL DEFAULT '0',
  `pcthumb` varchar(120) NOT NULL DEFAULT '',
  `pcsequence` int(11) NOT NULL DEFAULT '0',
  `pctitle` varchar(240) NOT NULL DEFAULT '',
  `pctime` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `x2_position`
--

CREATE TABLE `x2_position` (
  `posid` int(11) NOT NULL,
  `posname` varchar(120) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_position`
--

INSERT INTO `x2_position` (`posid`, `posname`) VALUES
(1, '首页推荐');

-- --------------------------------------------------------

--
-- 表的结构 `x2_product`
--

CREATE TABLE `x2_product` (
  `productid` int(11) NOT NULL,
  `producttype` varchar(24) NOT NULL DEFAULT '',
  `productpartnerid` int(11) NOT NULL DEFAULT '0',
  `productname` varchar(240) NOT NULL DEFAULT '',
  `productcode` int(11) NOT NULL DEFAULT '0',
  `productprice` decimal(10,2) NOT NULL DEFAULT '0.00',
  `productdescribe` text NOT NULL,
  `productlesson` varchar(40) NOT NULL DEFAULT '',
  `producttry` varchar(240) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `x2_progress`
--

CREATE TABLE `x2_progress` (
  `prsid` int(11) NOT NULL,
  `prsuserid` int(11) NOT NULL,
  `prstime` int(11) NOT NULL,
  `prsendtime` int(11) NOT NULL,
  `prscourseid` int(11) NOT NULL,
  `prscoursestatus` tinyint(1) NOT NULL,
  `prsexamid` int(11) NOT NULL,
  `prsexamstatus` tinyint(1) NOT NULL,
  `prstatus` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `x2_quest2knows`
--

CREATE TABLE `x2_quest2knows` (
  `qkid` int(11) NOT NULL,
  `qkquestionid` int(11) NOT NULL DEFAULT '0',
  `qkknowsid` int(11) NOT NULL DEFAULT '0',
  `qktype` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_quest2knows`
--

INSERT INTO `x2_quest2knows` (`qkid`, `qkquestionid`, `qkknowsid`, `qktype`) VALUES
(1782, 5, 1, 1),
(1784, 1775, 1, 0),
(1780, 1774, 1, 0),
(1779, 1773, 1, 0),
(1778, 1772, 1, 0),
(1777, 1771, 1, 0),
(1776, 1770, 1, 0),
(1775, 1769, 1, 0),
(1774, 1768, 1, 0),
(1773, 1767, 1, 0),
(1772, 1766, 1, 0),
(1771, 1765, 1, 0),
(1770, 1764, 1, 0),
(1769, 1763, 1, 0),
(1768, 1762, 1, 0),
(1767, 1761, 1, 0),
(1766, 1760, 1, 0),
(1765, 1759, 1, 0),
(1764, 1758, 1, 0),
(1763, 1757, 1, 0),
(1762, 1756, 1, 0),
(1761, 1755, 1, 0),
(1760, 1754, 1, 0),
(1759, 1753, 1, 0),
(1758, 1752, 1, 0),
(1757, 1751, 1, 0),
(1756, 1750, 1, 0),
(1755, 1749, 1, 0),
(1754, 1748, 1, 0),
(1753, 1747, 1, 0),
(1752, 1746, 1, 0),
(1751, 1745, 1, 0),
(1750, 1744, 1, 0),
(1749, 1743, 1, 0),
(1748, 1742, 1, 0),
(1747, 1741, 1, 0),
(1746, 1740, 1, 0),
(1745, 1739, 1, 0),
(1744, 1738, 1, 0),
(1743, 1737, 1, 0),
(1742, 1736, 1, 0),
(1741, 1735, 1, 0),
(1740, 1734, 1, 0),
(1739, 1733, 1, 0),
(1738, 1732, 1, 0),
(1737, 1731, 1, 0),
(1736, 1730, 1, 0),
(1735, 1729, 1, 0),
(1734, 1728, 1, 0),
(1733, 1727, 1, 0),
(1732, 1726, 1, 0),
(1731, 1725, 1, 0),
(1730, 1724, 1, 0),
(1729, 1723, 1, 0),
(1728, 1722, 1, 0),
(1727, 1721, 1, 0),
(1726, 1720, 1, 0),
(1725, 1719, 1, 0),
(1724, 1718, 1, 0),
(1723, 1717, 1, 0),
(1722, 1716, 1, 0),
(1721, 1715, 1, 0),
(1720, 1714, 1, 0),
(1719, 1713, 1, 0),
(1718, 1712, 1, 0),
(1717, 1711, 1, 0),
(1716, 1710, 1, 0),
(1715, 1709, 1, 0),
(1714, 1708, 1, 0),
(1713, 1707, 1, 0),
(1712, 1706, 1, 0),
(1711, 1705, 1, 0),
(1710, 1704, 1, 0),
(1709, 1703, 1, 0),
(1708, 1702, 1, 0),
(1707, 1701, 1, 0),
(1706, 1700, 1, 0),
(1705, 1699, 1, 0),
(1704, 1698, 1, 0),
(1703, 1697, 1, 0),
(1702, 1696, 1, 0),
(1701, 1695, 1, 0),
(1700, 1694, 1, 0),
(1699, 1693, 1, 0),
(1698, 1692, 1, 0),
(1697, 1691, 1, 0),
(1696, 1690, 1, 0),
(1695, 1689, 1, 0),
(1694, 1688, 1, 0),
(1693, 1687, 1, 0),
(1692, 1686, 1, 0),
(1691, 1685, 1, 0),
(1690, 1684, 1, 0),
(1689, 1683, 1, 0),
(1688, 1682, 1, 0),
(1687, 1681, 1, 0),
(1686, 1680, 1, 0),
(1685, 1679, 1, 0),
(1684, 1678, 1, 0),
(1683, 1677, 1, 0),
(1682, 1676, 1, 0),
(1681, 1675, 1, 0),
(1680, 1674, 1, 0),
(1679, 1673, 1, 0),
(1678, 1672, 1, 0),
(1677, 1671, 1, 0),
(1676, 1670, 1, 0),
(1675, 1669, 1, 0),
(1674, 1668, 1, 0),
(1673, 1667, 1, 0),
(1672, 1666, 1, 0),
(1671, 1665, 1, 0),
(1670, 1664, 1, 0),
(1669, 1663, 1, 0),
(1668, 1662, 1, 0),
(1667, 1661, 1, 0),
(1666, 1660, 1, 0),
(1665, 1659, 1, 0),
(1664, 1658, 1, 0),
(1663, 1657, 1, 0),
(1662, 1656, 1, 0),
(1661, 1655, 1, 0),
(1660, 1654, 1, 0),
(1659, 1653, 1, 0),
(1658, 1652, 1, 0),
(1657, 1651, 1, 0),
(1656, 1650, 1, 0),
(1655, 1649, 1, 0),
(1654, 1648, 1, 0),
(1653, 1647, 1, 0),
(1652, 1646, 1, 0),
(1651, 1645, 1, 0),
(1650, 1644, 1, 0),
(1649, 1643, 1, 0),
(1648, 1642, 1, 0),
(1647, 1641, 1, 0),
(1646, 1640, 1, 0),
(1645, 1639, 1, 0),
(1644, 1638, 1, 0),
(1643, 1637, 1, 0),
(1642, 1636, 1, 0),
(1641, 1635, 1, 0),
(1640, 1634, 1, 0),
(1639, 1633, 1, 0),
(1638, 1632, 1, 0),
(1637, 1631, 1, 0),
(1636, 1630, 1, 0),
(1635, 1629, 1, 0),
(1634, 1628, 1, 0),
(1633, 1627, 1, 0),
(1632, 1626, 1, 0),
(1631, 1625, 1, 0),
(1630, 1624, 1, 0),
(1629, 1623, 1, 0),
(1628, 1622, 1, 0),
(1627, 1621, 1, 0),
(1626, 1620, 1, 0),
(1625, 1619, 1, 0),
(1624, 1618, 1, 0),
(1623, 1617, 1, 0),
(1622, 1616, 1, 0),
(1621, 1615, 1, 0),
(1620, 1614, 1, 0),
(1619, 1613, 1, 0),
(1618, 1612, 1, 0),
(1617, 1611, 1, 0),
(1616, 1610, 1, 0),
(1615, 1609, 1, 0),
(1614, 1608, 1, 0),
(1613, 1607, 1, 0),
(1612, 1606, 1, 0),
(1611, 1605, 1, 0),
(1610, 1604, 1, 0),
(1609, 1603, 1, 0),
(1608, 1602, 1, 0),
(1607, 1601, 1, 0),
(1606, 1600, 1, 0),
(1605, 1599, 1, 0),
(1604, 1598, 1, 0),
(1603, 1597, 1, 0),
(1602, 1596, 1, 0),
(1601, 1595, 1, 0),
(1600, 1594, 1, 0),
(1599, 1593, 1, 0),
(1598, 1592, 1, 0),
(1597, 1591, 1, 0),
(1596, 1590, 1, 0),
(1595, 1589, 1, 0),
(1594, 1588, 1, 0),
(1593, 1587, 1, 0),
(1592, 1586, 1, 0),
(1591, 1585, 1, 0),
(1590, 1584, 1, 0),
(1589, 1583, 1, 0),
(1588, 1582, 1, 0),
(1587, 1581, 1, 0),
(1586, 1580, 1, 0),
(1585, 1579, 1, 0),
(1584, 1578, 1, 0),
(1583, 1577, 1, 0),
(1582, 1576, 1, 0),
(1581, 1575, 1, 0),
(1580, 1574, 1, 0),
(1579, 1573, 1, 0),
(1578, 1572, 1, 0),
(1577, 1571, 1, 0),
(1576, 1570, 1, 0),
(1575, 1569, 1, 0),
(1574, 1568, 1, 0),
(1573, 1567, 1, 0),
(1572, 1566, 1, 0),
(1571, 1565, 1, 0),
(1570, 1564, 1, 0),
(1569, 1563, 1, 0),
(1568, 1562, 1, 0),
(1567, 1561, 1, 0),
(1566, 1560, 1, 0),
(1565, 1559, 1, 0),
(1564, 1558, 1, 0),
(1563, 1557, 1, 0),
(1562, 1556, 1, 0),
(1561, 1555, 1, 0),
(1560, 1554, 1, 0),
(1559, 1553, 1, 0),
(1558, 1552, 1, 0),
(1557, 1551, 1, 0),
(1556, 1550, 1, 0),
(1555, 1549, 1, 0),
(1554, 1548, 1, 0),
(1553, 1547, 1, 0),
(1552, 1546, 1, 0),
(1551, 1545, 1, 0),
(1550, 1544, 1, 0),
(1549, 1543, 1, 0),
(1548, 1542, 1, 0),
(1547, 1541, 1, 0),
(1546, 1540, 1, 0),
(1545, 1539, 1, 0),
(1544, 1538, 1, 0),
(1543, 1537, 1, 0),
(1542, 1536, 1, 0),
(1541, 1535, 1, 0),
(1540, 1534, 1, 0),
(1539, 1533, 1, 0),
(1538, 1532, 1, 0),
(1537, 1531, 1, 0),
(1536, 1530, 1, 0),
(1535, 1529, 1, 0),
(1534, 1528, 1, 0),
(1533, 1527, 1, 0),
(1532, 1526, 1, 0),
(1531, 1525, 1, 0),
(1530, 1524, 1, 0),
(1529, 1523, 1, 0),
(1528, 1522, 1, 0),
(1527, 1521, 1, 0),
(1526, 1520, 1, 0),
(1525, 1519, 1, 0),
(1524, 1518, 1, 0),
(1523, 1517, 1, 0),
(1522, 1516, 1, 0),
(1521, 1515, 1, 0),
(1520, 1514, 1, 0),
(1519, 1513, 1, 0),
(1518, 1512, 1, 0),
(1517, 1511, 1, 0),
(1516, 1510, 1, 0),
(1515, 1509, 1, 0),
(1514, 1508, 1, 0),
(1513, 1507, 1, 0),
(1512, 1506, 1, 0),
(1511, 1505, 1, 0),
(1510, 1504, 1, 0),
(1509, 1503, 1, 0),
(1508, 1502, 1, 0),
(1507, 1501, 1, 0),
(1506, 1500, 1, 0),
(1505, 1499, 1, 0),
(1504, 1498, 1, 0),
(1503, 1497, 1, 0),
(1502, 1496, 1, 0),
(1501, 1495, 1, 0),
(1500, 1494, 1, 0),
(1499, 1493, 1, 0),
(1498, 1492, 1, 0),
(1497, 1491, 1, 0),
(1496, 1490, 1, 0),
(1495, 1489, 1, 0),
(1494, 1488, 1, 0),
(1493, 1487, 1, 0),
(1492, 1486, 1, 0),
(1491, 1485, 1, 0),
(1490, 1484, 1, 0),
(1489, 1483, 1, 0),
(1488, 1482, 1, 0),
(1487, 1481, 1, 0),
(1486, 1480, 1, 0),
(1485, 1479, 1, 0),
(1484, 1478, 1, 0),
(1483, 1477, 1, 0),
(1482, 1476, 1, 0),
(1481, 1475, 1, 0),
(1480, 1474, 1, 0),
(1479, 1473, 1, 0),
(1478, 1472, 1, 0),
(1477, 1471, 1, 0),
(1476, 1470, 1, 0),
(1475, 1469, 1, 0),
(1474, 1468, 1, 0),
(1473, 1467, 1, 0),
(1472, 1466, 1, 0),
(1471, 1465, 1, 0),
(1470, 1464, 1, 0),
(1469, 1463, 1, 0),
(1468, 1462, 1, 0),
(1467, 1461, 1, 0),
(1466, 1460, 1, 0),
(1465, 1459, 1, 0),
(1464, 1458, 1, 0),
(1463, 1457, 1, 0),
(1462, 1456, 1, 0),
(1461, 1455, 1, 0),
(1460, 1454, 1, 0),
(1459, 1453, 1, 0),
(1458, 1452, 1, 0),
(1457, 1451, 1, 0),
(1456, 1450, 1, 0),
(1455, 1449, 1, 0),
(1454, 1448, 1, 0),
(1453, 1447, 1, 0),
(1452, 1446, 1, 0),
(1451, 1445, 1, 0),
(1450, 1444, 1, 0),
(1449, 1443, 1, 0),
(1448, 1442, 1, 0),
(1447, 1441, 1, 0),
(1446, 1440, 1, 0),
(1445, 1439, 1, 0),
(1444, 1438, 1, 0),
(1443, 1437, 1, 0),
(1442, 1436, 1, 0),
(1441, 1435, 1, 0),
(1440, 1434, 1, 0),
(1439, 1433, 1, 0),
(1438, 1432, 1, 0),
(1437, 1431, 1, 0),
(1436, 1430, 1, 0),
(1435, 1429, 1, 0),
(1434, 1428, 1, 0),
(1433, 1427, 1, 0),
(1432, 1426, 1, 0),
(1431, 1425, 1, 0),
(1430, 1424, 1, 0),
(1429, 1423, 1, 0),
(1428, 1422, 1, 0),
(1427, 1421, 1, 0),
(1426, 1420, 1, 0),
(1425, 1419, 1, 0),
(1424, 1418, 1, 0),
(1423, 1417, 1, 0),
(1422, 1416, 1, 0),
(1421, 1415, 1, 0),
(1420, 1414, 1, 0),
(1419, 1413, 1, 0),
(1418, 1412, 1, 0),
(1417, 1411, 1, 0),
(1416, 1410, 1, 0),
(1415, 1409, 1, 0),
(1414, 1408, 1, 0),
(1413, 1407, 1, 0),
(1412, 1406, 1, 0),
(1411, 1405, 1, 0),
(1410, 1404, 1, 0),
(1409, 1403, 1, 0),
(1408, 1402, 1, 0),
(1407, 1401, 1, 0),
(1406, 1400, 1, 0),
(1405, 1399, 1, 0),
(1404, 1398, 1, 0),
(1403, 1397, 1, 0),
(1402, 1396, 1, 0),
(1401, 1395, 1, 0),
(1400, 1394, 1, 0),
(1399, 1393, 1, 0),
(1398, 1392, 1, 0),
(1397, 1391, 1, 0),
(1396, 1390, 1, 0),
(1395, 1389, 1, 0),
(1394, 1388, 1, 0),
(1393, 1387, 1, 0),
(1392, 1386, 1, 0),
(1391, 1385, 1, 0),
(1390, 1384, 1, 0),
(1389, 1383, 1, 0),
(1388, 1382, 1, 0),
(1387, 1381, 1, 0),
(1386, 1380, 1, 0),
(1385, 1379, 1, 0),
(1384, 1378, 1, 0),
(1383, 1377, 1, 0),
(1382, 1376, 1, 0),
(1381, 1375, 1, 0),
(1380, 1374, 1, 0),
(1379, 1373, 1, 0),
(1378, 1372, 1, 0),
(1377, 1371, 1, 0),
(1376, 1370, 1, 0),
(1375, 1369, 1, 0),
(1374, 1368, 1, 0),
(1373, 1367, 1, 0),
(1372, 1366, 1, 0),
(1371, 1365, 1, 0),
(1370, 1364, 1, 0),
(1369, 1363, 1, 0),
(1368, 1362, 1, 0),
(1367, 1361, 1, 0),
(1366, 1360, 1, 0),
(1365, 1359, 1, 0),
(1364, 1358, 1, 0),
(1363, 1357, 1, 0),
(1362, 1356, 1, 0),
(1361, 1355, 1, 0),
(1360, 1354, 1, 0),
(1359, 1353, 1, 0),
(1358, 1352, 1, 0),
(1357, 1351, 1, 0),
(1356, 1350, 1, 0),
(1355, 1349, 1, 0),
(1354, 1348, 1, 0),
(1353, 1347, 1, 0),
(1352, 1346, 1, 0),
(1351, 1345, 1, 0),
(1350, 1344, 1, 0),
(1349, 1343, 1, 0),
(1348, 1342, 1, 0),
(1347, 1341, 1, 0),
(1346, 1340, 1, 0),
(1345, 1339, 1, 0),
(1344, 1338, 1, 0),
(1343, 1337, 1, 0),
(1342, 1336, 1, 0),
(1341, 1335, 1, 0),
(1340, 1334, 1, 0),
(1339, 1333, 1, 0),
(1338, 1332, 1, 0),
(1337, 1331, 1, 0),
(1336, 1330, 1, 0),
(1335, 1329, 1, 0),
(1334, 1328, 1, 0),
(1333, 1327, 1, 0),
(1332, 1326, 1, 0),
(1331, 1325, 1, 0),
(1330, 1324, 1, 0),
(1329, 1323, 1, 0),
(1328, 1322, 1, 0),
(1327, 1321, 1, 0),
(1326, 1320, 1, 0),
(1325, 1319, 1, 0),
(1324, 1318, 1, 0),
(1323, 1317, 1, 0),
(1322, 1316, 1, 0),
(1321, 1315, 1, 0),
(1320, 1314, 1, 0),
(1319, 1313, 1, 0),
(1318, 1312, 1, 0),
(1317, 1311, 1, 0),
(1316, 1310, 1, 0),
(1315, 1309, 1, 0),
(1314, 1308, 1, 0),
(1313, 1307, 1, 0),
(1312, 1306, 1, 0),
(1311, 1305, 1, 0),
(1310, 1304, 1, 0),
(1309, 1303, 1, 0),
(1308, 1302, 1, 0),
(1307, 1301, 1, 0),
(1306, 1300, 1, 0),
(1305, 1299, 1, 0),
(1304, 1298, 1, 0),
(1303, 1297, 1, 0),
(1302, 1296, 1, 0),
(1301, 1295, 1, 0),
(1300, 1294, 1, 0),
(1299, 1293, 1, 0),
(1298, 1292, 1, 0),
(1297, 1291, 1, 0),
(1296, 1290, 1, 0),
(1295, 1289, 1, 0),
(1294, 1288, 1, 0),
(1293, 1287, 1, 0),
(1292, 1286, 1, 0),
(1291, 1285, 1, 0),
(1290, 1284, 1, 0),
(1289, 1283, 1, 0),
(1288, 1282, 1, 0),
(1287, 1281, 1, 0),
(1286, 1280, 1, 0),
(1285, 1279, 1, 0),
(1284, 1278, 1, 0),
(1283, 1277, 1, 0),
(1282, 1276, 1, 0),
(1281, 1275, 1, 0),
(1280, 1274, 1, 0),
(1279, 1273, 1, 0),
(1278, 1272, 1, 0),
(1277, 1271, 1, 0),
(1276, 1270, 1, 0),
(1275, 1269, 1, 0),
(1274, 1268, 1, 0),
(1273, 1267, 1, 0),
(1272, 1266, 1, 0),
(1271, 1265, 1, 0),
(1270, 1264, 1, 0),
(1269, 1263, 1, 0),
(1268, 1262, 1, 0),
(1267, 1261, 1, 0),
(1266, 1260, 1, 0),
(1265, 1259, 1, 0),
(1264, 1258, 1, 0),
(1263, 1257, 1, 0),
(1262, 1256, 1, 0),
(1261, 1255, 1, 0),
(1260, 1254, 1, 0),
(1259, 1253, 1, 0),
(1258, 1252, 1, 0),
(1257, 1251, 1, 0),
(1256, 1250, 1, 0),
(1255, 1249, 1, 0),
(1254, 1248, 1, 0),
(1253, 1247, 1, 0),
(1252, 1246, 1, 0),
(1251, 1245, 1, 0),
(1250, 1244, 1, 0),
(1249, 1243, 1, 0),
(1248, 1242, 1, 0),
(1247, 1241, 1, 0),
(1246, 1240, 1, 0),
(1245, 1239, 1, 0),
(1244, 1238, 1, 0),
(1243, 1237, 1, 0),
(1242, 1236, 1, 0),
(1241, 1235, 1, 0),
(1240, 1234, 1, 0),
(1239, 1233, 1, 0),
(1238, 1232, 1, 0),
(1237, 1231, 1, 0),
(1236, 1230, 1, 0),
(1235, 1229, 1, 0),
(1234, 1228, 1, 0),
(1233, 1227, 1, 0),
(1232, 1226, 1, 0),
(1231, 1225, 1, 0),
(1230, 1224, 1, 0),
(1229, 1223, 1, 0),
(1228, 1222, 1, 0),
(1227, 1221, 1, 0),
(1226, 1220, 1, 0),
(1225, 1219, 1, 0),
(1224, 1218, 1, 0),
(1223, 1217, 1, 0),
(1222, 1216, 1, 0),
(1221, 1215, 1, 0),
(1220, 1214, 1, 0),
(1219, 1213, 1, 0),
(1218, 1212, 1, 0),
(1217, 1211, 1, 0),
(1216, 1210, 1, 0),
(1215, 1209, 1, 0),
(1214, 1208, 1, 0),
(1213, 1207, 1, 0),
(1212, 1206, 1, 0),
(1211, 1205, 1, 0),
(1210, 1204, 1, 0),
(1209, 1203, 1, 0),
(1208, 1202, 1, 0),
(1207, 1201, 1, 0),
(1206, 1200, 1, 0),
(1205, 1199, 1, 0),
(1204, 1198, 1, 0),
(1203, 1197, 1, 0),
(1202, 1196, 1, 0),
(1201, 1195, 1, 0),
(1200, 1194, 1, 0),
(1199, 1193, 1, 0),
(1198, 1192, 1, 0),
(1197, 1191, 1, 0),
(1196, 1190, 1, 0),
(1195, 1189, 1, 0),
(1194, 1188, 1, 0),
(1193, 1187, 1, 0),
(1192, 1186, 1, 0),
(1191, 1185, 1, 0),
(1190, 1184, 1, 0),
(1189, 1183, 1, 0),
(1188, 1182, 1, 0),
(1187, 1181, 1, 0),
(1186, 1180, 1, 0),
(1185, 1179, 1, 0),
(1184, 1178, 1, 0),
(1183, 1177, 1, 0),
(1182, 1176, 1, 0),
(1181, 1175, 1, 0),
(1180, 1174, 1, 0),
(1179, 1173, 1, 0),
(1178, 1172, 1, 0),
(1177, 1171, 1, 0),
(1176, 1170, 1, 0),
(1175, 1169, 1, 0),
(1174, 1168, 1, 0),
(1173, 1167, 1, 0),
(1172, 1166, 1, 0),
(1171, 1165, 1, 0),
(1170, 1164, 1, 0),
(1169, 1163, 1, 0),
(1168, 1162, 1, 0),
(1167, 1161, 1, 0),
(1166, 1160, 1, 0),
(1165, 1159, 1, 0),
(1164, 1158, 1, 0),
(1163, 1157, 1, 0),
(1162, 1156, 1, 0),
(1161, 1155, 1, 0),
(1160, 1154, 1, 0),
(1159, 1153, 1, 0),
(1158, 1152, 1, 0),
(1157, 1151, 1, 0),
(1156, 1150, 1, 0),
(1155, 1149, 1, 0),
(1154, 1148, 1, 0),
(1153, 1147, 1, 0),
(1152, 1146, 1, 0),
(1151, 1145, 1, 0),
(1150, 1144, 1, 0),
(1149, 1143, 1, 0),
(1148, 1142, 1, 0),
(1147, 1141, 1, 0),
(1146, 1140, 1, 0),
(1145, 1139, 1, 0),
(1144, 1138, 1, 0),
(1143, 1137, 1, 0),
(1142, 1136, 1, 0),
(1141, 1135, 1, 0),
(1140, 1134, 1, 0),
(1139, 1133, 1, 0),
(1138, 1132, 1, 0),
(1137, 1131, 1, 0),
(1136, 1130, 1, 0),
(1135, 1129, 1, 0),
(1134, 1128, 1, 0),
(1133, 1127, 1, 0),
(1132, 1126, 1, 0),
(1131, 1125, 1, 0),
(1130, 1124, 1, 0),
(1129, 1123, 1, 0),
(1128, 1122, 1, 0),
(1127, 1121, 1, 0),
(1126, 1120, 1, 0),
(1125, 1119, 1, 0),
(1124, 1118, 1, 0),
(1123, 1117, 1, 0),
(1122, 1116, 1, 0),
(1121, 1115, 1, 0),
(1120, 1114, 1, 0),
(1119, 1113, 1, 0),
(1118, 1112, 1, 0),
(1117, 1111, 1, 0),
(1116, 1110, 1, 0),
(1115, 1109, 1, 0),
(1114, 1108, 1, 0),
(1113, 1107, 1, 0),
(1112, 1106, 1, 0),
(1111, 1105, 1, 0),
(1110, 1104, 1, 0),
(1109, 1103, 1, 0),
(1108, 1102, 1, 0),
(1107, 1101, 1, 0),
(1106, 1100, 1, 0),
(1105, 1099, 1, 0),
(1104, 1098, 1, 0),
(1103, 1097, 1, 0),
(1102, 1096, 1, 0),
(1101, 1095, 1, 0),
(1100, 1094, 1, 0),
(1099, 1093, 1, 0),
(1098, 1092, 1, 0),
(1097, 1091, 1, 0),
(1096, 1090, 1, 0),
(1095, 1089, 1, 0),
(1094, 1088, 1, 0),
(1093, 1087, 1, 0),
(1092, 1086, 1, 0),
(1091, 1085, 1, 0),
(1090, 1084, 1, 0),
(1089, 1083, 1, 0),
(1088, 1082, 1, 0),
(1087, 1081, 1, 0),
(1086, 1080, 1, 0),
(1085, 1079, 1, 0),
(1084, 1078, 1, 0),
(1083, 1077, 1, 0),
(1082, 1076, 1, 0),
(1081, 1075, 1, 0),
(1080, 1074, 1, 0),
(1079, 1073, 1, 0),
(1078, 1072, 1, 0),
(1077, 1071, 1, 0),
(1076, 1070, 1, 0),
(1075, 1069, 1, 0),
(1074, 1068, 1, 0),
(1073, 1067, 1, 0),
(1072, 1066, 1, 0),
(1071, 1065, 1, 0),
(1070, 1064, 1, 0),
(1069, 1063, 1, 0),
(1068, 1062, 1, 0),
(1067, 1061, 1, 0),
(1066, 1060, 1, 0),
(1065, 1059, 1, 0),
(1064, 1058, 1, 0),
(1063, 1057, 1, 0),
(1062, 1056, 1, 0),
(1061, 1055, 1, 0),
(1060, 1054, 1, 0),
(1059, 1053, 1, 0),
(1058, 1052, 1, 0),
(1057, 1051, 1, 0),
(1056, 1050, 1, 0),
(1055, 1049, 1, 0),
(1054, 1048, 1, 0),
(1053, 1047, 1, 0),
(1052, 1046, 1, 0),
(1051, 1045, 1, 0),
(1050, 1044, 1, 0),
(1049, 1043, 1, 0),
(1048, 1042, 1, 0),
(1047, 1041, 1, 0),
(1046, 1040, 1, 0),
(1045, 1039, 1, 0),
(1044, 1038, 1, 0),
(1043, 1037, 1, 0),
(1042, 1036, 1, 0),
(1041, 1035, 1, 0),
(1040, 1034, 1, 0),
(1039, 1033, 1, 0),
(1038, 1032, 1, 0),
(1037, 1031, 1, 0),
(1036, 1030, 1, 0),
(1035, 1029, 1, 0),
(1034, 1028, 1, 0),
(1033, 1027, 1, 0),
(1032, 1026, 1, 0),
(1031, 1025, 1, 0),
(1030, 1024, 1, 0),
(1029, 1023, 1, 0),
(1028, 1022, 1, 0),
(1027, 1021, 1, 0),
(1026, 1020, 1, 0),
(1025, 1019, 1, 0),
(1024, 1018, 1, 0),
(1023, 1017, 1, 0),
(1022, 1016, 1, 0),
(1021, 1015, 1, 0),
(1020, 1014, 1, 0),
(1019, 1013, 1, 0),
(1018, 1012, 1, 0),
(1017, 1011, 1, 0),
(1016, 1010, 1, 0),
(1015, 1009, 1, 0),
(1014, 1008, 1, 0),
(1013, 1007, 1, 0),
(1012, 1006, 1, 0),
(1011, 1005, 1, 0),
(1010, 1004, 1, 0),
(1009, 1003, 1, 0),
(1008, 1002, 1, 0),
(1007, 1001, 1, 0),
(1006, 1000, 1, 0),
(1005, 999, 1, 0),
(1004, 998, 1, 0),
(1003, 997, 1, 0),
(1002, 996, 1, 0),
(1001, 995, 1, 0),
(1000, 994, 1, 0),
(999, 993, 1, 0),
(998, 992, 1, 0),
(997, 991, 1, 0),
(996, 990, 1, 0),
(995, 989, 1, 0),
(994, 988, 1, 0),
(993, 987, 1, 0),
(992, 986, 1, 0),
(991, 985, 1, 0),
(990, 984, 1, 0),
(989, 983, 1, 0),
(988, 982, 1, 0),
(987, 981, 1, 0),
(986, 980, 1, 0),
(985, 979, 1, 0),
(984, 978, 1, 0),
(983, 977, 1, 0),
(982, 976, 1, 0),
(981, 975, 1, 0),
(980, 974, 1, 0),
(979, 973, 1, 0),
(978, 972, 1, 0),
(977, 971, 1, 0),
(976, 970, 1, 0),
(975, 969, 1, 0),
(974, 968, 1, 0),
(973, 967, 1, 0),
(972, 966, 1, 0),
(971, 965, 1, 0),
(970, 964, 1, 0),
(969, 963, 1, 0),
(968, 962, 1, 0),
(967, 961, 1, 0),
(966, 960, 1, 0),
(965, 959, 1, 0),
(964, 958, 1, 0),
(963, 957, 1, 0),
(962, 956, 1, 0),
(961, 955, 1, 0),
(960, 954, 1, 0),
(959, 953, 1, 0),
(958, 952, 1, 0),
(957, 951, 1, 0),
(956, 950, 1, 0),
(955, 949, 1, 0),
(954, 948, 1, 0),
(953, 947, 1, 0),
(952, 946, 1, 0),
(951, 945, 1, 0),
(950, 944, 1, 0),
(949, 943, 1, 0),
(948, 942, 1, 0),
(947, 941, 1, 0),
(946, 940, 1, 0),
(945, 939, 1, 0),
(944, 938, 1, 0),
(943, 937, 1, 0),
(942, 936, 1, 0),
(941, 935, 1, 0),
(940, 934, 1, 0),
(939, 933, 1, 0),
(938, 932, 1, 0),
(937, 931, 1, 0),
(936, 930, 1, 0),
(935, 929, 1, 0),
(934, 928, 1, 0),
(933, 927, 1, 0),
(932, 926, 1, 0),
(931, 925, 1, 0),
(930, 924, 1, 0),
(929, 923, 1, 0),
(928, 922, 1, 0),
(927, 921, 1, 0),
(926, 920, 1, 0),
(925, 919, 1, 0),
(924, 918, 1, 0),
(923, 917, 1, 0),
(922, 916, 1, 0),
(921, 915, 1, 0),
(920, 914, 1, 0),
(919, 913, 1, 0),
(918, 912, 1, 0),
(917, 911, 1, 0),
(916, 910, 1, 0),
(915, 909, 1, 0),
(914, 908, 1, 0),
(913, 907, 1, 0),
(912, 906, 1, 0),
(911, 905, 1, 0),
(910, 904, 1, 0),
(909, 903, 1, 0),
(908, 902, 1, 0),
(907, 901, 1, 0),
(906, 900, 1, 0),
(905, 899, 1, 0),
(904, 898, 1, 0),
(903, 897, 1, 0),
(902, 896, 1, 0),
(901, 895, 1, 0),
(884, 884, 1, 0),
(885, 1, 1, 1),
(886, 2, 1, 1),
(900, 894, 1, 0),
(888, 888, 1, 0),
(889, 4, 1, 1),
(899, 893, 1, 0),
(1785, 1777, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `x2_questionanalysis`
--

CREATE TABLE `x2_questionanalysis` (
  `qaid` int(11) NOT NULL,
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
  `qaqnparent` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `x2_questionrows`
--

CREATE TABLE `x2_questionrows` (
  `qrid` int(11) NOT NULL,
  `qrtype` tinyint(4) NOT NULL DEFAULT '2',
  `qrquestion` mediumtext NOT NULL,
  `qrknowsid` tinytext NOT NULL,
  `qrlevel` int(1) NOT NULL DEFAULT '0',
  `qrnumber` int(4) NOT NULL DEFAULT '0',
  `qruserid` int(11) NOT NULL DEFAULT '0',
  `qrusername` varchar(120) NOT NULL DEFAULT '',
  `qrlastmodifyuser` varchar(120) NOT NULL DEFAULT '',
  `qrtime` int(11) NOT NULL DEFAULT '0',
  `qrstatus` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `x2_questions`
--

CREATE TABLE `x2_questions` (
  `questionid` int(11) NOT NULL,
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
  `questionlevel` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_questions`
--

INSERT INTO `x2_questions` (`questionid`, `questiontype`, `question`, `questionuserid`, `questionusername`, `questionlastmodifyuser`, `questionselect`, `questionselectnumber`, `questionanswer`, `questiondescribe`, `questionknowsid`, `questioncreatetime`, `questionstatus`, `questionhtml`, `questionparent`, `questionsequence`, `questionlevel`) VALUES
(1700, 1, '我国最早的军校出现于', 0, '', '', '&lt;p&gt;A:唐代&lt;/p&gt;&lt;p&gt;B:宋代&lt;/p&gt;&lt;p&gt;C:民国&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1699, 1, '到2003年4月2日为止，有群众用游行方式支持英美联军对伊拉克共和国采取军事行动的唯一一个国家是：', 0, '', '', '&lt;p&gt;A:美国&lt;/p&gt;&lt;p&gt;B:英国&lt;/p&gt;&lt;p&gt;C:伊朗&lt;/p&gt;&lt;p&gt;D:科威特&lt;/p&gt;&lt;p&gt;E:以色列&lt;/p&gt;', 5, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1698, 1, '以下哪位不属于唐宋八大家？', 0, '', '', '&lt;p&gt;A:苏洵&lt;/p&gt;&lt;p&gt;B:曾巩&lt;/p&gt;&lt;p&gt;C:杜牡&lt;/p&gt;&lt;p&gt;D:柳宗元&lt;/p&gt;&lt;p&gt;E:王安石&lt;/p&gt;', 5, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1697, 1, '伊拉克共和国成立于哪一年？', 0, '', '', '&lt;p&gt;A:1921年5月&lt;/p&gt;&lt;p&gt;B:1945年8月&lt;/p&gt;&lt;p&gt;C:1958年7月&lt;/p&gt;&lt;p&gt;D:1964年11月&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1696, 1, '中国清末最早的海军学堂是', 0, '', '', '&lt;p&gt;A:京师大学堂&lt;/p&gt;&lt;p&gt;B:船政学堂&lt;/p&gt;&lt;p&gt;C:武备学堂&lt;/p&gt;&lt;p&gt;D:水师学堂&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1695, 1, '命名“好望角”的人是：', 0, '', '', '&lt;p&gt;A:哥伦布&lt;/p&gt;&lt;p&gt;B:麦哲伦&lt;/p&gt;&lt;p&gt;C:达伽马&lt;/p&gt;&lt;p&gt;D:迪亚士&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1694, 1, '世界上第一枚邮票诞生在', 0, '', '', '&lt;p&gt;A:美国&lt;/p&gt;&lt;p&gt;B:英国&lt;/p&gt;&lt;p&gt;C:法国&lt;/p&gt;&lt;p&gt;D:中国&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1693, 1, '北京是（  ）命名的。', 0, '', '', '&lt;p&gt;A:元朝&lt;/p&gt;&lt;p&gt;B:明朝&lt;/p&gt;&lt;p&gt;C:清朝&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1692, 1, '第一个到达南极的人是哪国人？', 0, '', '', '&lt;p&gt;A:美国人&lt;/p&gt;&lt;p&gt;B:挪威人&lt;/p&gt;&lt;p&gt;C:英国人&lt;/p&gt;&lt;p&gt;D:俄国人&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1691, 1, '1840年5月6日英国发行了世界上第一枚邮票，它被称为', 0, '', '', '&lt;p&gt;A:黑便士&lt;/p&gt;&lt;p&gt;B:红便士&lt;/p&gt;&lt;p&gt;C:蓝便士&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1690, 1, '满汉全席始于_________年间，至今已二百余年。全席中热菜134道，冷荤48道及不计其数的点心、水果等。如此众多的菜肴，需分三天（六次）才能吃全。', 0, '', '', '&lt;p&gt;A:乾隆&lt;/p&gt;&lt;p&gt;B:康熙&lt;/p&gt;&lt;p&gt;C:雍正&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1689, 1, '公元618－907年是我国古代哪个朝代', 0, '', '', '&lt;p&gt;A:宋&lt;/p&gt;&lt;p&gt;B:唐&lt;/p&gt;&lt;p&gt;C:汉&lt;/p&gt;&lt;p&gt;D:春秋&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1688, 1, '世界最早的校园歌曲出现在', 0, '', '', '&lt;p&gt;A:美国&lt;/p&gt;&lt;p&gt;B:台湾&lt;/p&gt;&lt;p&gt;C:日本&lt;/p&gt;&lt;p&gt;D:英国&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1687, 1, '“建元”是我国那个皇帝使用的年号', 0, '', '', '&lt;p&gt;A:秦皇帝&lt;/p&gt;&lt;p&gt;B:汉武帝&lt;/p&gt;&lt;p&gt;C:唐太宗&lt;/p&gt;&lt;p&gt;D:元太祖&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1686, 1, '宋庆龄在什么时候从布鲁塞尔参加国际反帝同盟大会归来后满脸忧国忧民？', 0, '', '', '&lt;p&gt;A:1926年6月7日&lt;/p&gt;&lt;p&gt;B:1925年5月22日&lt;/p&gt;&lt;p&gt;C:1929年5月16日&lt;/p&gt;&lt;p&gt;D:1929年6月15日&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1685, 1, '唐朝时的师子国是今天的：', 0, '', '', '&lt;p&gt;A:越南&lt;/p&gt;&lt;p&gt;B:伊朗&lt;/p&gt;&lt;p&gt;C:斯里兰卡&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1684, 1, '美国发动海湾战争的最根本目的是：', 0, '', '', '&lt;p&gt;A:打击恐怖势力&lt;/p&gt;&lt;p&gt;B:争夺石油资源&lt;/p&gt;&lt;p&gt;C:解放伊拉克人民被独裁的苦难&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1683, 1, '迷你裙通常又称超短裙，可以说是裙装款式中的“长青树”，女性穿上这种裙子后既显示出青春魅力，又富有浓郁的时代感，你知道迷你裙是由_________国人发明的吗？', 0, '', '', '&lt;p&gt;A:美&lt;/p&gt;&lt;p&gt;B:英&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1682, 1, '在古代，谁采取“明修栈道，暗渡陈仓”的计策，平定三秦？', 0, '', '', '&lt;p&gt;A:萧何&lt;/p&gt;&lt;p&gt;B:韩信&lt;/p&gt;&lt;p&gt;C:张良&lt;/p&gt;&lt;p&gt;D:诸葛亮&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1681, 1, '纪晓岚是我国哪个朝代上的才子', 0, '', '', '&lt;p&gt;A:唐朝&lt;/p&gt;&lt;p&gt;B:宋朝&lt;/p&gt;&lt;p&gt;C:明朝&lt;/p&gt;&lt;p&gt;D:清朝&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1680, 1, '是谁在1926年7月22日为处理英国退还部分庚子赔款而奔波？', 0, '', '', '&lt;p&gt;A:桑秋&lt;/p&gt;&lt;p&gt;B:洛迪克&lt;/p&gt;&lt;p&gt;C:胡适&lt;/p&gt;&lt;p&gt;D:徐悲洪&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1679, 1, '第一个打破世界纪录的中国人是', 0, '', '', '&lt;p&gt;A:刘长春&lt;/p&gt;&lt;p&gt;B:许海峰&lt;/p&gt;&lt;p&gt;C:陈镜开&lt;/p&gt;&lt;p&gt;D:李富荣&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1678, 1, '故宫的“正大光明”匾额由（  ）书写。', 0, '', '', '&lt;p&gt;A:顺治皇帝&lt;/p&gt;&lt;p&gt;B:康熙皇帝&lt;/p&gt;&lt;p&gt;C:乾隆皇帝&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1677, 1, '以下不是我国近代签定的不平等条约的是：', 0, '', '', '&lt;p&gt;A:尼布楚条约&lt;/p&gt;&lt;p&gt;B:满洲里条约&lt;/p&gt;&lt;p&gt;C:瑷珲条约&lt;/p&gt;&lt;p&gt;D:伊犁条约&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1676, 1, '霸王龙生活在哪个时期？', 0, '', '', '&lt;p&gt;A:远古&lt;/p&gt;&lt;p&gt;B:三叠纪&lt;/p&gt;&lt;p&gt;C:侏罗纪&lt;/p&gt;&lt;p&gt;D:白垩纪&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1675, 1, '石达开最后兵败于：', 0, '', '', '&lt;p&gt;A:贵州省&lt;/p&gt;&lt;p&gt;B:四川省&lt;/p&gt;&lt;p&gt;C:湖南省&lt;/p&gt;&lt;p&gt;D:云南省&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1674, 1, '诺曼底登陆发生于1944年：', 0, '', '', '&lt;p&gt;A:6月1日&lt;/p&gt;&lt;p&gt;B:6月6日&lt;/p&gt;&lt;p&gt;C:5月30日&lt;/p&gt;&lt;p&gt;D:5月27日&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1673, 1, '“百货商场”这个名词来源于哪？', 0, '', '', '&lt;p&gt;A:商品齐全&lt;/p&gt;&lt;p&gt;B:历史传说&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1672, 1, '二战结束时日本的投降签字仪式在哪所战舰上进行：', 0, '', '', '&lt;p&gt;A:密苏里号&lt;/p&gt;&lt;p&gt;B:企业号&lt;/p&gt;&lt;p&gt;C:罗斯福号&lt;/p&gt;&lt;p&gt;D:黄蜂号&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1671, 1, '郑和共几次下西洋？', 0, '', '', '&lt;p&gt;A:5&lt;/p&gt;&lt;p&gt;B:7&lt;/p&gt;&lt;p&gt;C:9&lt;/p&gt;&lt;p&gt;D:11&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1670, 1, '欧洲中世纪什么样的人不能佩带钻石', 0, '', '', '&lt;p&gt;A:皇室&lt;/p&gt;&lt;p&gt;B:商人&lt;/p&gt;&lt;p&gt;C:贵族&lt;/p&gt;&lt;p&gt;D:教士&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1669, 1, '灭亡宋朝的势力是：', 0, '', '', '&lt;p&gt;A:辽&lt;/p&gt;&lt;p&gt;B:金&lt;/p&gt;&lt;p&gt;C:西夏&lt;/p&gt;&lt;p&gt;D:蒙古&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1668, 1, '天安门原名为：', 0, '', '', '&lt;p&gt;A:承天门&lt;/p&gt;&lt;p&gt;B:午门&lt;/p&gt;&lt;p&gt;C:广安门&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1667, 1, '我国建成的第一座长江大桥是：', 0, '', '', '&lt;p&gt;A:南京长江大桥&lt;/p&gt;&lt;p&gt;B:武汉长江大桥&lt;/p&gt;&lt;p&gt;C:重庆长江大桥&lt;/p&gt;&lt;p&gt;D:九江长江大桥&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1666, 1, '第二次海湾战争开始于哪一天：', 0, '', '', '&lt;p&gt;A:2001年3月1日&lt;/p&gt;&lt;p&gt;B:2002年6月23日&lt;/p&gt;&lt;p&gt;C:2003年3月20日&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1665, 1, '“馒头”的发明者是谁？', 0, '', '', '&lt;p&gt;A:诸葛亮&lt;/p&gt;&lt;p&gt;B:朱元璋&lt;/p&gt;&lt;p&gt;C:神农氏&lt;/p&gt;&lt;p&gt;D:岳飞&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1664, 1, '下列人物谁被捕于皖南事变？', 0, '', '', '&lt;p&gt;A:叶挺&lt;/p&gt;&lt;p&gt;B:贺龙&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1663, 1, '张爱玲于哪一年逝世？', 0, '', '', '&lt;p&gt;A:1993&lt;/p&gt;&lt;p&gt;B:1994&lt;/p&gt;&lt;p&gt;C:1995&lt;/p&gt;&lt;p&gt;D:1996&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1662, 1, '德国心理学家冯特于哪一年建立了世界上第一个心理实验室？', 0, '', '', '&lt;p&gt;A:1897&lt;/p&gt;&lt;p&gt;B:1798&lt;/p&gt;&lt;p&gt;C:1879&lt;/p&gt;&lt;p&gt;D:1789&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1661, 1, '号称“初唐四杰”的有王勃、卢照邻、骆宾王及', 0, '', '', '&lt;p&gt;A:杨炯&lt;/p&gt;&lt;p&gt;B:王勃&lt;/p&gt;&lt;p&gt;C:卢纶&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1659, 1, '第一个北京猿人头盖骨发现于哪一年', 0, '', '', '&lt;p&gt;A:1927年&lt;/p&gt;&lt;p&gt;B:1928年&lt;/p&gt;&lt;p&gt;C:1929年&lt;/p&gt;&lt;p&gt;D:1930年&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1660, 1, '中英〈南京条约〉是中国近代史上第一个不平等条约，哪一年签定的', 0, '', '', '&lt;p&gt;A:1841年&lt;/p&gt;&lt;p&gt;B:1842年&lt;/p&gt;&lt;p&gt;C:1844年&lt;/p&gt;&lt;p&gt;D:1860年&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1658, 1, '下列曾用名中，哪个不是周恩来的', 0, '', '', '&lt;p&gt;A:伍豪&lt;/p&gt;&lt;p&gt;B:飞飞&lt;/p&gt;&lt;p&gt;C:冠生&lt;/p&gt;&lt;p&gt;D:周道&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1657, 1, '司马光，司马迁，司马昭，司马懿，哪位司马先生出生最早', 0, '', '', '&lt;p&gt;A:司马光&lt;/p&gt;&lt;p&gt;B:司马迁&lt;/p&gt;&lt;p&gt;C:司马昭&lt;/p&gt;&lt;p&gt;D:司马懿&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1656, 1, '日本是哪年偷袭美国的珍珠港', 0, '', '', '&lt;p&gt;A:1939&lt;/p&gt;&lt;p&gt;B:1941&lt;/p&gt;&lt;p&gt;C:1945&lt;/p&gt;&lt;p&gt;D:1947&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1655, 1, '北京最早建成是什么朝代？', 0, '', '', '&lt;p&gt;A:宋&lt;/p&gt;&lt;p&gt;B:金&lt;/p&gt;&lt;p&gt;C:西周&lt;/p&gt;&lt;p&gt;D:清&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1654, 1, '世界上第一次实测子午线长度的我国古代科学家是', 0, '', '', '&lt;p&gt;A:郭守敬&lt;/p&gt;&lt;p&gt;B:徐光启&lt;/p&gt;&lt;p&gt;C:僧一行&lt;/p&gt;&lt;p&gt;D:祖冲之&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1653, 1, '第一届冬奥会于哪年举行即夏蒙尼冬奥会', 0, '', '', '&lt;p&gt;A:1920&lt;/p&gt;&lt;p&gt;B:1924&lt;/p&gt;&lt;p&gt;C:1928&lt;/p&gt;&lt;p&gt;D:1932&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1652, 1, '袁世凯做了几天的皇帝？', 0, '', '', '&lt;p&gt;A:83天&lt;/p&gt;&lt;p&gt;B:96天&lt;/p&gt;&lt;p&gt;C:103天&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1651, 1, '指挥雁宿崖、黄土岭战斗，歼灭日军“名将之花”阿部规秀中将旅团长的是我军将领（   ）。', 0, '', '', '&lt;p&gt;A:徐向前&lt;/p&gt;&lt;p&gt;B:聂荣臻&lt;/p&gt;&lt;p&gt;C:罗荣桓&lt;/p&gt;&lt;p&gt;D:林彪&lt;/p&gt;&lt;p&gt;E:叶剑英&lt;/p&gt;', 5, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1650, 1, '我国科举制度上最后一位状元是（   ）。', 0, '', '', '&lt;p&gt;A:左宗棠&lt;/p&gt;&lt;p&gt;B:刘师曾&lt;/p&gt;&lt;p&gt;C:张之洞&lt;/p&gt;&lt;p&gt;D:刘春霖&lt;/p&gt;&lt;p&gt;E:翁同和&lt;/p&gt;', 5, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1649, 1, '新中国成立时共鸣放礼炮（   ）。', 0, '', '', '&lt;p&gt;A:21响&lt;/p&gt;&lt;p&gt;B:28响&lt;/p&gt;&lt;p&gt;C:54响&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1648, 1, '中国传说中的炎帝中的“炎”是代表（    ）。', 0, '', '', '&lt;p&gt;A:日月星辰中的太阳&lt;/p&gt;&lt;p&gt;B:阴阳五行中的火&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1647, 1, '盛唐时期被称为（    ）。', 0, '', '', '&lt;p&gt;A:贞观之治&lt;/p&gt;&lt;p&gt;B:开元之治&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1646, 1, '地雷最早出现在（    ）。', 0, '', '', '&lt;p&gt;A:唐代&lt;/p&gt;&lt;p&gt;B:宋代&lt;/p&gt;&lt;p&gt;C:元代&lt;/p&gt;&lt;p&gt;D:明代&lt;/p&gt;&lt;p&gt;E:清代&lt;/p&gt;', 5, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1645, 1, '秦始皇时代将（   ）作为标准文字。', 0, '', '', '&lt;p&gt;A:甲骨文&lt;/p&gt;&lt;p&gt;B:隶书&lt;/p&gt;&lt;p&gt;C:楷书&lt;/p&gt;&lt;p&gt;D:小篆&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1644, 1, '1988年从（  ）开始，天安门城楼向中外游客开放。', 0, '', '', '&lt;p&gt;A:元旦&lt;/p&gt;&lt;p&gt;B:劳动节&lt;/p&gt;&lt;p&gt;C:国庆节&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1643, 1, '跆拳道起源于1500年前（   ）的武术。', 0, '', '', '&lt;p&gt;A:日本&lt;/p&gt;&lt;p&gt;B:韩国&lt;/p&gt;&lt;p&gt;C:泰国&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1641, 1, '吃元宵始于哪个朝代', 0, '', '', '&lt;p&gt;A:元朝&lt;/p&gt;&lt;p&gt;B:宋朝&lt;/p&gt;&lt;p&gt;C:清朝&lt;/p&gt;&lt;p&gt;D:明朝&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1642, 1, '明朝北京常走兵车的是哪个城门', 0, '', '', '&lt;p&gt;A:朝阳门&lt;/p&gt;&lt;p&gt;B:宣武门&lt;/p&gt;&lt;p&gt;C:西直门&lt;/p&gt;&lt;p&gt;D:德胜门&lt;/p&gt;&lt;p&gt;E:阜成门&lt;/p&gt;', 5, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1640, 1, '清宣宗在位时的年号为', 0, '', '', '&lt;p&gt;A:康熙&lt;/p&gt;&lt;p&gt;B:乾隆&lt;/p&gt;&lt;p&gt;C:道光&lt;/p&gt;&lt;p&gt;D:光绪&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1639, 1, '武则天登基后，改国号为', 0, '', '', '&lt;p&gt;A:夏&lt;/p&gt;&lt;p&gt;B:商&lt;/p&gt;&lt;p&gt;C:周&lt;/p&gt;&lt;p&gt;D:唐&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1638, 1, '国际奥委会会旗是哪个国家于1920年赠送的？', 0, '', '', '&lt;p&gt;A:美国&lt;/p&gt;&lt;p&gt;B:瑞士&lt;/p&gt;&lt;p&gt;C:挪威&lt;/p&gt;&lt;p&gt;D:日本&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1637, 1, '蒋介石出生于何地？', 0, '', '', '&lt;p&gt;A:奉化&lt;/p&gt;&lt;p&gt;B:余姚&lt;/p&gt;&lt;p&gt;C:绍兴&lt;/p&gt;&lt;p&gt;D:海宁&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1636, 3, '公元1900年是闰年', 0, '', '', '&lt;p&gt;A:对&lt;/p&gt;&lt;p&gt;B:错&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1635, 1, '清朝最后一个皇帝是谁？', 0, '', '', '&lt;p&gt;A:乾隆&lt;/p&gt;&lt;p&gt;B:道光&lt;/p&gt;&lt;p&gt;C:光绪&lt;/p&gt;&lt;p&gt;D:宣统&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1634, 1, '开国大典在1949年10月1日几时开始的？', 0, '', '', '&lt;p&gt;A:8时&lt;/p&gt;&lt;p&gt;B:10时&lt;/p&gt;&lt;p&gt;C:12时&lt;/p&gt;&lt;p&gt;D:15时&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1633, 1, '开国大典时共放了多礼炮？', 0, '', '', '&lt;p&gt;A:12&lt;/p&gt;&lt;p&gt;B:18&lt;/p&gt;&lt;p&gt;C:25&lt;/p&gt;&lt;p&gt;D:28&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1631, 1, '哪一种恐龙最小?', 0, '', '', '&lt;p&gt;A:三角龙&lt;/p&gt;&lt;p&gt;B:细颚龙&lt;/p&gt;&lt;p&gt;C:锯齿龙&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1632, 1, '最像鸟的恐龙是哪一种？', 0, '', '', '&lt;p&gt;A:翼龙&lt;/p&gt;&lt;p&gt;B:似鸟龙&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1630, 1, '世界上最早的报纸诞生于', 0, '', '', '&lt;p&gt;A:英国&lt;/p&gt;&lt;p&gt;B:意大利&lt;/p&gt;&lt;p&gt;C:法国&lt;/p&gt;&lt;p&gt;D:中国&lt;/p&gt;&lt;p&gt;E:希腊&lt;/p&gt;', 5, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1629, 1, '史料记载,内地和台湾最早的交流是', 0, '', '', '&lt;p&gt;A:秦&lt;/p&gt;&lt;p&gt;B:西汉&lt;/p&gt;&lt;p&gt;C:东汉&lt;/p&gt;&lt;p&gt;D:三国&lt;/p&gt;&lt;p&gt;E:唐&lt;/p&gt;&lt;p&gt;F:元&lt;/p&gt;', 6, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1628, 1, '我国抗日时期的八路军又称为', 0, '', '', '&lt;p&gt;A:红军&lt;/p&gt;&lt;p&gt;B:新四军&lt;/p&gt;&lt;p&gt;C:第八集团军&lt;/p&gt;&lt;p&gt;D:第十八集团军&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1627, 1, '我国最早的银币（银布币）出现于什么时候？', 0, '', '', '&lt;p&gt;A:西周&lt;/p&gt;&lt;p&gt;B:春秋&lt;/p&gt;&lt;p&gt;C:战国&lt;/p&gt;&lt;p&gt;D:汉朝&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1626, 1, '元宝始创于我国哪个朝代？', 0, '', '', '&lt;p&gt;A:唐朝&lt;/p&gt;&lt;p&gt;B:宋朝&lt;/p&gt;&lt;p&gt;C:元朝&lt;/p&gt;&lt;p&gt;D:明朝&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1625, 1, '我国宋朝采用什么样的兵役制度？', 0, '', '', '&lt;p&gt;A:义务兵役制&lt;/p&gt;&lt;p&gt;B:志愿兵役制&lt;/p&gt;&lt;p&gt;C:雇佣兵役制&lt;/p&gt;&lt;p&gt;D:终身兵役制&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1624, 1, '李龟年是哪个朝代的乐师', 0, '', '', '&lt;p&gt;A:南宋&lt;/p&gt;&lt;p&gt;B:明&lt;/p&gt;&lt;p&gt;C:清&lt;/p&gt;&lt;p&gt;D:唐&lt;/p&gt;&lt;p&gt;E:元&lt;/p&gt;', 5, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1623, 1, '秦二世是谁？', 0, '', '', '&lt;p&gt;A:胡亥&lt;/p&gt;&lt;p&gt;B:扶苏&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1622, 1, '封建社会存在了多少年？', 0, '', '', '&lt;p&gt;A:1800&lt;/p&gt;&lt;p&gt;B:1900&lt;/p&gt;&lt;p&gt;C:2000&lt;/p&gt;&lt;p&gt;D:2100&lt;/p&gt;&lt;p&gt;E:2200&lt;/p&gt;', 5, 'E', 'E', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1621, 1, '守岁作为春节期间最重要的内容，这个习俗始于哪个朝代？', 0, '', '', '&lt;p&gt;A:唐朝&lt;/p&gt;&lt;p&gt;B:宋朝&lt;/p&gt;&lt;p&gt;C:元朝&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1620, 1, '“贺年片”最早出现在哪个国家？', 0, '', '', '&lt;p&gt;A:英国&lt;/p&gt;&lt;p&gt;B:中国 （宋元时期）&lt;/p&gt;&lt;p&gt;C:法国&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1619, 1, '我国贴春联始于哪个朝代？', 0, '', '', '&lt;p&gt;A:汉朝&lt;/p&gt;&lt;p&gt;B:唐朝&lt;/p&gt;&lt;p&gt;C:五代&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1617, 1, '英国王妃戴安娜是在哪一年去世', 0, '', '', '&lt;p&gt;A:1996&lt;/p&gt;&lt;p&gt;B:1997&lt;/p&gt;&lt;p&gt;C:1998&lt;/p&gt;&lt;p&gt;D:1999&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1618, 1, '绯闻最多的美国总统是', 0, '', '', '&lt;p&gt;A:罗斯福&lt;/p&gt;&lt;p&gt;B:肯尼迪&lt;/p&gt;&lt;p&gt;C:约翰逊&lt;/p&gt;&lt;p&gt;D:克林顿&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1616, 1, '元杂剧的“楔子”即', 0, '', '', '&lt;p&gt;A:序幕&lt;/p&gt;&lt;p&gt;B:高潮&lt;/p&gt;&lt;p&gt;C:尾声&lt;/p&gt;&lt;p&gt;D:一种道具&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1615, 1, '拼音中四声起于', 0, '', '', '&lt;p&gt;A:汉&lt;/p&gt;&lt;p&gt;B:唐&lt;/p&gt;&lt;p&gt;C:宋&lt;/p&gt;&lt;p&gt;D:元&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1613, 1, '嵇康是哪一时期的琴家', 0, '', '', '&lt;p&gt;A:夏周&lt;/p&gt;&lt;p&gt;B:秦汉&lt;/p&gt;&lt;p&gt;C:三国&lt;/p&gt;&lt;p&gt;D:五代&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1614, 1, '唐代的乐队，使用的主要乐器是', 0, '', '', '&lt;p&gt;A:笛&lt;/p&gt;&lt;p&gt;B:鼓&lt;/p&gt;&lt;p&gt;C:琵琶&lt;/p&gt;&lt;p&gt;D:埙&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1612, 1, '文字狱是清朝哪位皇帝兴起的', 0, '', '', '&lt;p&gt;A:康熙&lt;/p&gt;&lt;p&gt;B:顺治&lt;/p&gt;&lt;p&gt;C:雍正&lt;/p&gt;&lt;p&gt;D:乾隆&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1611, 1, '最早的风筝用于战争是在哪个朝代？', 0, '', '', '&lt;p&gt;A:春秋战国&lt;/p&gt;&lt;p&gt;B:楚汉争霸时期&lt;/p&gt;&lt;p&gt;C:宋朝&lt;/p&gt;&lt;p&gt;D:五代&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1610, 1, '1999年11月15日，中美双方在哪里签署了关于中国加入世贸组织的双边协议？', 0, '', '', '&lt;p&gt;A:北京&lt;/p&gt;&lt;p&gt;B:多哈&lt;/p&gt;&lt;p&gt;C:华盛顿&lt;/p&gt;&lt;p&gt;D:西雅图&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1609, 1, '中国复关变成了入世，这前前后后历经了多少年的时间，充满了各种各样的挑战。', 0, '', '', '&lt;p&gt;A:15年多&lt;/p&gt;&lt;p&gt;B:12年&lt;/p&gt;&lt;p&gt;C:13年&lt;/p&gt;&lt;p&gt;D:11年&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1608, 1, '黄埔军校成立时，担任党代表的是？', 0, '', '', '&lt;p&gt;A:周恩来&lt;/p&gt;&lt;p&gt;B:恽代英&lt;/p&gt;&lt;p&gt;C:萧楚女&lt;/p&gt;&lt;p&gt;D:廖仲恺&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1607, 1, '1945年日本政府正式宣布无条件投降的时间是？', 0, '', '', '&lt;p&gt;A:8月14日&lt;/p&gt;&lt;p&gt;B:8月15日&lt;/p&gt;&lt;p&gt;C:9月2日&lt;/p&gt;&lt;p&gt;D:9月3日&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1606, 1, '人民解放军解放全国在陆的时间是？', 0, '', '', '&lt;p&gt;A:1949年10月&lt;/p&gt;&lt;p&gt;B:1950年5月&lt;/p&gt;&lt;p&gt;C:1951年5月&lt;/p&gt;&lt;p&gt;D:1951年10月&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1605, 2, '＂大跃进＂运动和人民公社化运动中＂左＂倾错误的主要标志是？（多选）', 0, '', '', '&lt;p&gt;A:高指标&lt;/p&gt;&lt;p&gt;B:瞎指挥&lt;/p&gt;&lt;p&gt;C:浮夸风&lt;/p&gt;&lt;p&gt;D:“共产风”&lt;/p&gt;', 4, 'ACD', 'ACD', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1604, 1, '1947年国民党反动派残酷镇压国统区“反饥饿、反内战、反迫害”的学生运动，制造的流血惨案是？', 0, '', '', '&lt;p&gt;A:一二．一惨案&lt;/p&gt;&lt;p&gt;B:较场口惨案&lt;/p&gt;&lt;p&gt;C:五二Ｏ惨案&lt;/p&gt;&lt;p&gt;D:下关惨案&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1603, 1, '中国近代史上睁眼看世界的第一人是？', 0, '', '', '&lt;p&gt;A:龚自珍&lt;/p&gt;&lt;p&gt;B:林则徐&lt;/p&gt;&lt;p&gt;C:马建忠&lt;/p&gt;&lt;p&gt;D:薛福成&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1601, 1, '《王二小》在山坡上放什么动物，来给游击队放哨？', 0, '', '', '&lt;p&gt;A:羊&lt;/p&gt;&lt;p&gt;B:牛&lt;/p&gt;&lt;p&gt;C:鸭&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1602, 1, '放“鞭炮”这个传统习俗，可有很久的历史了，但花炮的制作形成规模是在哪个朝代？', 0, '', '', '&lt;p&gt;A:唐朝&lt;/p&gt;&lt;p&gt;B:宋朝&lt;/p&gt;&lt;p&gt;C:明朝&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1600, 1, '涮羊肉的创始者是谁？', 0, '', '', '&lt;p&gt;A:成吉思汗&lt;/p&gt;&lt;p&gt;B:李世民&lt;/p&gt;&lt;p&gt;C:忽必烈&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1599, 1, '中国古代的一个时辰代表现在的多少时间？', 0, '', '', '&lt;p&gt;A:1小时&lt;/p&gt;&lt;p&gt;B:2小时&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1598, 1, '请问八达岭万里长城是由哪个朝代所建？', 0, '', '', '&lt;p&gt;A:宋朝&lt;/p&gt;&lt;p&gt;B:明朝&lt;/p&gt;&lt;p&gt;C:秦始皇&lt;/p&gt;&lt;p&gt;D:春秋战国&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1596, 1, '陈毅同志出生于：', 0, '', '', '&lt;p&gt;A:1901.8.26&lt;/p&gt;&lt;p&gt;B:1901.8.27&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1597, 1, '下列哪一事件具有政变性质：', 0, '', '', '&lt;p&gt;A:七国之乱&lt;/p&gt;&lt;p&gt;B:土木之变&lt;/p&gt;&lt;p&gt;C:靖康之变&lt;/p&gt;&lt;p&gt;D:陈桥兵变&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1595, 1, '前奥委会主席萨马兰奇出生于：', 0, '', '', '&lt;p&gt;A:1920.7.17&lt;/p&gt;&lt;p&gt;B:1921.8.18&lt;/p&gt;&lt;p&gt;C:1923.9.19&lt;/p&gt;&lt;p&gt;D:1924.10.20&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1594, 1, '新慕尼黑机场启用时间是：', 0, '', '', '&lt;p&gt;A:1993.5.18&lt;/p&gt;&lt;p&gt;B:1990.7.16&lt;/p&gt;&lt;p&gt;C:1992.5.17&lt;/p&gt;&lt;p&gt;D:1996.7.15&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1593, 1, '我国的奴隶社会开始于', 0, '', '', '&lt;p&gt;A:黄帝时代&lt;/p&gt;&lt;p&gt;B:尧舜禹时代&lt;/p&gt;&lt;p&gt;C:夏&lt;/p&gt;&lt;p&gt;D:商&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1592, 1, '历史之父指的是', 0, '', '', '&lt;p&gt;A:哀思库罗斯&lt;/p&gt;&lt;p&gt;B:阿里斯托芬&lt;/p&gt;&lt;p&gt;C:希罗多德&lt;/p&gt;&lt;p&gt;D:伯里克利&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1591, 1, '下列哪项不是嬉皮士的典型装扮', 0, '', '', '&lt;p&gt;A:长发&lt;/p&gt;&lt;p&gt;B:喇叭裤&lt;/p&gt;&lt;p&gt;C:花衬衫&lt;/p&gt;&lt;p&gt;D:松糕鞋&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1590, 1, '马拉松比赛最初的长度以城市马拉松到哪里的距离为准', 0, '', '', '&lt;p&gt;A:雅典&lt;/p&gt;&lt;p&gt;B:斯巴达&lt;/p&gt;&lt;p&gt;C:特洛伊&lt;/p&gt;&lt;p&gt;D:罗马&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1589, 1, '黄帝氏族以什么为图腾', 0, '', '', '&lt;p&gt;A:风&lt;/p&gt;&lt;p&gt;B:云&lt;/p&gt;&lt;p&gt;C:雨&lt;/p&gt;&lt;p&gt;D:雷&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1588, 1, '下述哪种武器不属中世纪骑士的必需装备', 0, '', '', '&lt;p&gt;A:盾牌&lt;/p&gt;&lt;p&gt;B:长矛&lt;/p&gt;&lt;p&gt;C:剑&lt;/p&gt;&lt;p&gt;D:弓箭&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1587, 1, '屈原是投哪条江自尽的', 0, '', '', '&lt;p&gt;A:汨罗江&lt;/p&gt;&lt;p&gt;B:长江&lt;/p&gt;&lt;p&gt;C:淮河&lt;/p&gt;&lt;p&gt;D:丽江&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1585, 1, '下列哪位国王曾放下屠刀，立地成佛', 0, '', '', '&lt;p&gt;A:阿育王&lt;/p&gt;&lt;p&gt;B:所罗门王&lt;/p&gt;&lt;p&gt;C:大流士&lt;/p&gt;&lt;p&gt;D:冈比西斯&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1586, 1, '古奥林匹克竞赛优胜者要戴上用什么编成的王冠', 0, '', '', '&lt;p&gt;A:百合花&lt;/p&gt;&lt;p&gt;B:柳条&lt;/p&gt;&lt;p&gt;C:橄榄枝&lt;/p&gt;&lt;p&gt;D:月桂&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1584, 1, '孟尝君招收到门下的人才称为', 0, '', '', '&lt;p&gt;A:饭客&lt;/p&gt;&lt;p&gt;B:食客&lt;/p&gt;&lt;p&gt;C:刺客&lt;/p&gt;&lt;p&gt;D:吃客&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1583, 1, '甘罗多大年纪成为相国', 0, '', '', '&lt;p&gt;A:十岁&lt;/p&gt;&lt;p&gt;B:十一岁&lt;/p&gt;&lt;p&gt;C:十二岁&lt;/p&gt;&lt;p&gt;D:十三岁&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1582, 1, '古印度的种姓制度中哪一个地位最低', 0, '', '', '&lt;p&gt;A:婆罗门&lt;/p&gt;&lt;p&gt;B:刹帝利&lt;/p&gt;&lt;p&gt;C:吠舍&lt;/p&gt;&lt;p&gt;D:首陀罗&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1581, 1, '五粮液酒历次蝉联“国家名酒”金奖，九一年被评为中国“十大驰名商标”；继1915年获巴拿马金奖八十年之后，1995年再获巴拿马国际贸易博览会酒类唯一金奖。我国的五粮液最早酿造是在_________朝。', 0, '', '', '&lt;p&gt;A:元&lt;/p&gt;&lt;p&gt;B:宋&lt;/p&gt;&lt;p&gt;C:明&lt;/p&gt;&lt;p&gt;D:清&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1580, 1, '“宁可枉杀千人，不可使一人漏网”是谁的口号？', 0, '', '', '&lt;p&gt;A:蒋介石&lt;/p&gt;&lt;p&gt;B:汪精卫&lt;/p&gt;&lt;p&gt;C:何应钦&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1579, 1, '希腊神话中赫拉也就是罗马神话中的：', 0, '', '', '&lt;p&gt;A:朱诺&lt;/p&gt;&lt;p&gt;B:黛安娜&lt;/p&gt;&lt;p&gt;C:朱彼得&lt;/p&gt;&lt;p&gt;D:维纳斯&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1578, 1, '“五虎将”是指', 0, '', '', '&lt;p&gt;A:关羽、张飞、赵云、魏延、王平&lt;/p&gt;&lt;p&gt;B:张飞、赵云、马超、王平、刘备&lt;/p&gt;&lt;p&gt;C:关羽、马超、黄忠、赵云、魏延&lt;/p&gt;&lt;p&gt;D:关羽、张飞、赵云、马超、黄忠&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1577, 1, '谁推行一条鞭法，减轻农民负担', 0, '', '', '&lt;p&gt;A:赵普&lt;/p&gt;&lt;p&gt;B:张居正&lt;/p&gt;&lt;p&gt;C:王安石&lt;/p&gt;&lt;p&gt;D:商鞅&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1576, 1, '明代科举制度考试等级不包括：', 0, '', '', '&lt;p&gt;A:乡试&lt;/p&gt;&lt;p&gt;B:会试&lt;/p&gt;&lt;p&gt;C:殿试&lt;/p&gt;&lt;p&gt;D:院试&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1575, 1, '清代唯一一位以嫡长子身份即位的皇帝是', 0, '', '', '&lt;p&gt;A:道光&lt;/p&gt;&lt;p&gt;B:乾隆&lt;/p&gt;&lt;p&gt;C:胤祯&lt;/p&gt;&lt;p&gt;D:顺治&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1574, 1, '托洛茨基被克格勃杀害于哪国', 0, '', '', '&lt;p&gt;A:墨西哥&lt;/p&gt;&lt;p&gt;B:美国&lt;/p&gt;&lt;p&gt;C:阿根廷&lt;/p&gt;&lt;p&gt;D:苏联&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1573, 1, '被瓦刺兵俘去，后有复辟的皇帝是', 0, '', '', '&lt;p&gt;A:明景宗 朱祁钰&lt;/p&gt;&lt;p&gt;B:明武宗 朱厚照&lt;/p&gt;&lt;p&gt;C:明神宗 朱诩钧&lt;/p&gt;&lt;p&gt;D:明英宗 朱祁镇&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1572, 1, '襄樊之战发生在哪一年', 0, '', '', '&lt;p&gt;A:1267年&lt;/p&gt;&lt;p&gt;B:1367年&lt;/p&gt;&lt;p&gt;C:1276年&lt;/p&gt;&lt;p&gt;D:1376年&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1571, 1, '蒙古第一次西征是', 0, '', '', '&lt;p&gt;A:1234年至1241年&lt;/p&gt;&lt;p&gt;B:1217年至1223年&lt;/p&gt;&lt;p&gt;C:1253年至1258年&lt;/p&gt;&lt;p&gt;D:1223年至1234年&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1570, 1, '汽车竞赛始于1894年，当时的赛程为：', 0, '', '', '&lt;p&gt;A:巴黎－马德里&lt;/p&gt;&lt;p&gt;B:巴黎－里昂&lt;/p&gt;&lt;p&gt;C:巴黎－纽约&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1569, 1, '孔子在哪个国家出生？', 0, '', '', '&lt;p&gt;A:鲁国&lt;/p&gt;&lt;p&gt;B:齐国&lt;/p&gt;&lt;p&gt;C:宋国&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1568, 2, '大禹治水时把天下分为九个州，以下哪几个州是其中的5个？（多选）', 0, '', '', '&lt;p&gt;A:冀&lt;/p&gt;&lt;p&gt;B:淮&lt;/p&gt;&lt;p&gt;C:徐&lt;/p&gt;&lt;p&gt;D:青&lt;/p&gt;&lt;p&gt;E:荆&lt;/p&gt;&lt;p&gt;F:豫&lt;/p&gt;', 6, 'ACD', 'ACD', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1567, 1, '美国帝国大厦建于哪一年？', 0, '', '', '&lt;p&gt;A:1930&lt;/p&gt;&lt;p&gt;B:1931&lt;/p&gt;&lt;p&gt;C:1932&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1566, 1, '世界贸易组织(WTO)是在哪界会议上正式成立的？', 0, '', '', '&lt;p&gt;A:马拉喀什谈判&lt;/p&gt;&lt;p&gt;B:马德里谈判&lt;/p&gt;&lt;p&gt;C:“乌拉圭回合”谈判&lt;/p&gt;&lt;p&gt;D:“巴拉圭回合”谈判&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1565, 1, '1991年12月，欧共体12国首脑召开的欧共体发达国家发展进程中具有里程碑意义的会议是：', 0, '', '', '&lt;p&gt;A:日内瓦会议&lt;/p&gt;&lt;p&gt;B:巴黎会议&lt;/p&gt;&lt;p&gt;C:罗马会议&lt;/p&gt;&lt;p&gt;D:马斯特里赫特会议&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1564, 1, '1990年东欧，苏联发生的事件中不包括', 0, '', '', '&lt;p&gt;A:两个德国统一&lt;/p&gt;&lt;p&gt;B:立陶宛，爱沙尼亚，拉脱维亚独立&lt;/p&gt;&lt;p&gt;C:东欧各国共产党纷纷丧失政权&lt;/p&gt;&lt;p&gt;D:南斯拉夫一分为五&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1563, 1, '标志18世纪末法国资产阶级革命结束的事件是', 0, '', '', '&lt;p&gt;A:雅各宾派分裂&lt;/p&gt;&lt;p&gt;B:热月政变&lt;/p&gt;&lt;p&gt;C:雾月政变&lt;/p&gt;&lt;p&gt;D:法兰西第一帝国建立&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1562, 1, '现在知道的我国境内的较早古人类有', 0, '', '', '&lt;p&gt;A:北京人&lt;/p&gt;&lt;p&gt;B:元谋人&lt;/p&gt;&lt;p&gt;C:蓝田人&lt;/p&gt;&lt;p&gt;D:山顶洞人&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1561, 1, '第一个提出“知识就是力量”的人是_________国著名的唯物主义哲学家和科学家弗兰西斯．培根。', 0, '', '', '&lt;p&gt;A:英&lt;/p&gt;&lt;p&gt;B:美&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1560, 1, '三国演义中的周瑜死于巴丘,是现在的:', 0, '', '', '&lt;p&gt;A:襄樊&lt;/p&gt;&lt;p&gt;B:长沙&lt;/p&gt;&lt;p&gt;C:岳阳&lt;/p&gt;&lt;p&gt;D:武汉&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1559, 1, '最早的楔形文字使用者是:', 0, '', '', '&lt;p&gt;A:古巴比伦人&lt;/p&gt;&lt;p&gt;B:苏美尔人&lt;/p&gt;&lt;p&gt;C:古埃及人&lt;/p&gt;&lt;p&gt;D:古印度人&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1558, 2, '古代社会通行的有偿婚包括哪些？（多选）', 0, '', '', '&lt;p&gt;A:买卖婚&lt;/p&gt;&lt;p&gt;B:交换婚&lt;/p&gt;&lt;p&gt;C:劳役婚&lt;/p&gt;&lt;p&gt;D:掠夺婚&lt;/p&gt;&lt;p&gt;E:共诺婚&lt;/p&gt;', 5, 'AC', 'AC', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1557, 1, '中国古代婚姻法最重要的渊源是什麽？', 0, '', '', '&lt;p&gt;A:法&lt;/p&gt;&lt;p&gt;B:礼&lt;/p&gt;&lt;p&gt;C:宗教戒律&lt;/p&gt;&lt;p&gt;D:习惯&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1556, 1, '我国开始征收契税的时间是哪一年？', 0, '', '', '&lt;p&gt;A:1950年&lt;/p&gt;&lt;p&gt;B:1951年&lt;/p&gt;&lt;p&gt;C:1956年&lt;/p&gt;&lt;p&gt;D:1973年&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1555, 1, '布达拉宫始建于公元_________世纪，是藏王松赞干布为远嫁西藏的唐朝文成公主而建。布达拉宫是当今世界上海拔最高、规模最大的宫殿式建筑群，海拔3700多米，占地总面积36万余平方米。', 0, '', '', '&lt;p&gt;A:5&lt;/p&gt;&lt;p&gt;B:6&lt;/p&gt;&lt;p&gt;C:7&lt;/p&gt;&lt;p&gt;D:8&lt;/p&gt;&lt;p&gt;E:9&lt;/p&gt;', 5, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1554, 1, '“及时雨”指谁？', 0, '', '', '&lt;p&gt;A:吴用&lt;/p&gt;&lt;p&gt;B:宋江&lt;/p&gt;&lt;p&gt;C:戴宇&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1553, 2, '“汉初三杰”指谁？（多选）', 0, '', '', '&lt;p&gt;A:韩信&lt;/p&gt;&lt;p&gt;B:萧何&lt;/p&gt;&lt;p&gt;C:刘邦&lt;/p&gt;&lt;p&gt;D:张良&lt;/p&gt;', 4, 'AD', 'AD', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1552, 1, '和琛的王府是哪个？', 0, '', '', '&lt;p&gt;A:庆王府&lt;/p&gt;&lt;p&gt;B:恭王府&lt;/p&gt;&lt;p&gt;C:宁王府&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1551, 1, '春秋时谁二桃杀三士', 0, '', '', '&lt;p&gt;A:晏婴&lt;/p&gt;&lt;p&gt;B:孙膑&lt;/p&gt;&lt;p&gt;C:计然&lt;/p&gt;&lt;p&gt;D:宋玉&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1550, 1, '司马迁是因为替谁说情而受腐刑', 0, '', '', '&lt;p&gt;A:李陵&lt;/p&gt;&lt;p&gt;B:李广&lt;/p&gt;&lt;p&gt;C:杨业&lt;/p&gt;&lt;p&gt;D:霍去病&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1549, 1, '世界第一个试管婴儿在哪一国诞生', 0, '', '', '&lt;p&gt;A:美国&lt;/p&gt;&lt;p&gt;B:法国&lt;/p&gt;&lt;p&gt;C:英国&lt;/p&gt;&lt;p&gt;D:德国&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1548, 1, '古代体操五禽戏为谁所创', 0, '', '', '&lt;p&gt;A:张仲景&lt;/p&gt;&lt;p&gt;B:华佗&lt;/p&gt;&lt;p&gt;C:扁鹊&lt;/p&gt;&lt;p&gt;D:李时珍&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1547, 1, '陆游与唐婉分离后数年又在哪里重逢过', 0, '', '', '&lt;p&gt;A:后园&lt;/p&gt;&lt;p&gt;B:张园&lt;/p&gt;&lt;p&gt;C:林园&lt;/p&gt;&lt;p&gt;D:沈园&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1546, 1, '古时的戟是一种', 0, '', '', '&lt;p&gt;A:武器&lt;/p&gt;&lt;p&gt;B:饰物&lt;/p&gt;&lt;p&gt;C:农具&lt;/p&gt;&lt;p&gt;D:餐具&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1545, 1, '下述人物中哪位不是刺客', 0, '', '', '&lt;p&gt;A:晏婴&lt;/p&gt;&lt;p&gt;B:聂政&lt;/p&gt;&lt;p&gt;C:专诸&lt;/p&gt;&lt;p&gt;D:荆轲&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1544, 1, '明代的东厂、西厂是', 0, '', '', '&lt;p&gt;A:手工作坊&lt;/p&gt;&lt;p&gt;B:特务机关&lt;/p&gt;&lt;p&gt;C:皇家园林&lt;/p&gt;&lt;p&gt;D:兵营&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1543, 1, '清朝皇帝中最勤奋好学的是', 0, '', '', '&lt;p&gt;A:道光&lt;/p&gt;&lt;p&gt;B:同治&lt;/p&gt;&lt;p&gt;C:顺治&lt;/p&gt;&lt;p&gt;D:康熙&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1542, 1, '中国第一枚邮票是什么时期发行的', 0, '', '', '&lt;p&gt;A:唐朝&lt;/p&gt;&lt;p&gt;B:宋朝&lt;/p&gt;&lt;p&gt;C:明朝&lt;/p&gt;&lt;p&gt;D:清朝&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1541, 1, '古代的国子监是', 0, '', '', '&lt;p&gt;A:秘密监狱&lt;/p&gt;&lt;p&gt;B:特务机关&lt;/p&gt;&lt;p&gt;C:高等学府&lt;/p&gt;&lt;p&gt;D:行政部门&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1540, 1, '故宫是哪一朝兴建的？', 0, '', '', '&lt;p&gt;A:元朝&lt;/p&gt;&lt;p&gt;B:明朝&lt;/p&gt;&lt;p&gt;C:清朝&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1539, 1, '灭南宋统一全国的元朝皇帝是谁？', 0, '', '', '&lt;p&gt;A:铁木真&lt;/p&gt;&lt;p&gt;B:窝阔台&lt;/p&gt;&lt;p&gt;C:拖雷&lt;/p&gt;&lt;p&gt;D:忽必烈&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1538, 1, '第一个测出子午线长度的人是？', 0, '', '', '&lt;p&gt;A:美国人&lt;/p&gt;&lt;p&gt;B:中国人&lt;/p&gt;&lt;p&gt;C:英国人&lt;/p&gt;&lt;p&gt;D:法国人&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1537, 1, '唐代印制的世界上现存最早标有确切日期的雕版印刷品是？', 0, '', '', '&lt;p&gt;A:诗经&lt;/p&gt;&lt;p&gt;B:易筋经&lt;/p&gt;&lt;p&gt;C:金刚经&lt;/p&gt;&lt;p&gt;D:唐诗三百首&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1536, 1, '唐玄宗时应日本僧人邀请6次东渡，终于到达日本的僧人是谁。', 0, '', '', '&lt;p&gt;A:玄奘&lt;/p&gt;&lt;p&gt;B:玄真&lt;/p&gt;&lt;p&gt;C:鉴真&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1535, 1, '标志着世界殖民体系的彻底灭亡的大事是？', 0, '', '', '&lt;p&gt;A:纳米比亚的独立&lt;/p&gt;&lt;p&gt;B:津巴布伟的独立&lt;/p&gt;&lt;p&gt;C:干果的独立&lt;/p&gt;&lt;p&gt;D:朝鲜的独立&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1534, 1, '中国古代四大美人中“沉鱼”是用来形容哪一位？', 0, '', '', '&lt;p&gt;A:王昭君&lt;/p&gt;&lt;p&gt;B:杨贵妃&lt;/p&gt;&lt;p&gt;C:西施&lt;/p&gt;&lt;p&gt;D:貂禅&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1533, 2, '哪两个国家的登山运动员在同一年登上珠穆朗玛峰？（多选）', 0, '', '', '&lt;p&gt;A:美国&lt;/p&gt;&lt;p&gt;B:新西兰&lt;/p&gt;&lt;p&gt;C:尼泊尔&lt;/p&gt;&lt;p&gt;D:英国&lt;/p&gt;', 4, 'BC', 'BC', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1532, 1, '谁最早提出大陆漂移学说？', 0, '', '', '&lt;p&gt;A:魏格纳&lt;/p&gt;&lt;p&gt;B:莫里&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1531, 1, '国家药局最早设立于什么朝代？', 0, '', '', '&lt;p&gt;A:唐代&lt;/p&gt;&lt;p&gt;B:北宋&lt;/p&gt;&lt;p&gt;C:南宋&lt;/p&gt;&lt;p&gt;D:明代&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1530, 1, '中医著名古籍《黄帝内经》约成书于', 0, '', '', '&lt;p&gt;A:商周时期&lt;/p&gt;&lt;p&gt;B:春秋战国时期&lt;/p&gt;&lt;p&gt;C:西汉时期&lt;/p&gt;&lt;p&gt;D:东汉时期&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1529, 2, '下列哪种是古代四大神兽（多选）', 0, '', '', '&lt;p&gt;A:青龙&lt;/p&gt;&lt;p&gt;B:白虎&lt;/p&gt;&lt;p&gt;C:朱雀&lt;/p&gt;&lt;p&gt;D:玄武&lt;/p&gt;', 4, 'ACD', 'ACD', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1528, 1, '克格勃成立于哪一年？', 0, '', '', '&lt;p&gt;A:1953&lt;/p&gt;&lt;p&gt;B:1954&lt;/p&gt;&lt;p&gt;C:1955&lt;/p&gt;&lt;p&gt;D:1956&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1527, 1, '中国哪一年发射了第一颗地球同步静止轨道卫星？', 0, '', '', '&lt;p&gt;A:1982&lt;/p&gt;&lt;p&gt;B:1984&lt;/p&gt;&lt;p&gt;C:1986&lt;/p&gt;&lt;p&gt;D:1988&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1526, 1, '清朝第三个皇帝是谁?', 0, '', '', '&lt;p&gt;A:皇太极&lt;/p&gt;&lt;p&gt;B:乾隆&lt;/p&gt;&lt;p&gt;C:雍正&lt;/p&gt;&lt;p&gt;D:康熙&lt;/p&gt;&lt;p&gt;E:顺治&lt;/p&gt;', 5, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1525, 1, '哪一位法国君王被称为“太阳王”：', 0, '', '', '&lt;p&gt;A:路易十四&lt;/p&gt;&lt;p&gt;B:路易十五&lt;/p&gt;&lt;p&gt;C:路易十六&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1524, 1, '下面哪一位不是意大利文艺复兴时期的“三杰”：', 0, '', '', '&lt;p&gt;A:米开朗基罗&lt;/p&gt;&lt;p&gt;B:达芬奇&lt;/p&gt;&lt;p&gt;C:乔托&lt;/p&gt;&lt;p&gt;D:拉菲尔&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1523, 1, '下面哪一位不是开国皇帝：', 0, '', '', '&lt;p&gt;A:隋炀帝&lt;/p&gt;&lt;p&gt;B:明太祖&lt;/p&gt;&lt;p&gt;C:元太祖&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1522, 3, '老子是春秋晚期的思想家', 0, '', '', '&lt;p&gt;A:对&lt;/p&gt;&lt;p&gt;B:错&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1521, 1, '第二次世界大战的转折点是:', 0, '', '', '&lt;p&gt;A:莫斯科保卫战&lt;/p&gt;&lt;p&gt;B:珍珠港事件&lt;/p&gt;&lt;p&gt;C:欧洲第二战场的开辟&lt;/p&gt;&lt;p&gt;D:斯大林格勒保卫战&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1520, 1, '山顶洞人的社会组织是:', 0, '', '', '&lt;p&gt;A:原始人群&lt;/p&gt;&lt;p&gt;B:母系氏族&lt;/p&gt;&lt;p&gt;C:父系氏族&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1519, 1, '山顶洞人生活在距今约:', 0, '', '', '&lt;p&gt;A:170万前年&lt;/p&gt;&lt;p&gt;B:一万八千年&lt;/p&gt;&lt;p&gt;C:四五十万年前&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1518, 1, '四羊方尊是:', 0, '', '', '&lt;p&gt;A:夏朝&lt;/p&gt;&lt;p&gt;B:商朝&lt;/p&gt;&lt;p&gt;C:西朝&lt;/p&gt;&lt;p&gt;D:春秋青铜器中的精品&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1517, 1, '我国有确切纪年的开始是在:', 0, '', '', '&lt;p&gt;A:公元前841年&lt;/p&gt;&lt;p&gt;B:前770年&lt;/p&gt;&lt;p&gt;C:前476年&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1516, 1, '我国最早制造和使用青铜器是在:', 0, '', '', '&lt;p&gt;A:夏&lt;/p&gt;&lt;p&gt;B:商&lt;/p&gt;&lt;p&gt;C:西周&lt;/p&gt;&lt;p&gt;D:春秋&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1515, 1, '抗战胜利后，美国总统杜鲁门为调处国共关系，派遣的总统驻华特使是：', 0, '', '', '&lt;p&gt;A:马歇尔&lt;/p&gt;&lt;p&gt;B:魏德迈&lt;/p&gt;&lt;p&gt;C:赫尔利&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1514, 1, '我国发射第一颗通信卫星是在：', 0, '', '', '&lt;p&gt;A:1986年&lt;/p&gt;&lt;p&gt;B:1984年&lt;/p&gt;&lt;p&gt;C:1988年&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1513, 1, '全面内战爆发后，国民党反动派在昆明杀害的民盟中央委员是：', 0, '', '', '&lt;p&gt;A:杜斌丞&lt;/p&gt;&lt;p&gt;B:杨杏佛&lt;/p&gt;&lt;p&gt;C:杜重远&lt;/p&gt;&lt;p&gt;D:李公朴&lt;/p&gt;&lt;p&gt;E:闻一多&lt;/p&gt;', 5, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1512, 1, '谁背叛了刘备？', 0, '', '', '&lt;p&gt;A:赵云&lt;/p&gt;&lt;p&gt;B:马岱&lt;/p&gt;&lt;p&gt;C:魏延&lt;/p&gt;&lt;p&gt;D:孟达&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1511, 1, '谁是从曹操处投到刘备处的？', 0, '', '', '&lt;p&gt;A:马超&lt;/p&gt;&lt;p&gt;B:王平&lt;/p&gt;&lt;p&gt;C:黄忠&lt;/p&gt;&lt;p&gt;D:孟达&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1510, 1, '曹操缴榜文以擒董卓，十八路诸侯来会盟，谁为盟主？', 0, '', '', '&lt;p&gt;A:曹操&lt;/p&gt;&lt;p&gt;B:孙坚&lt;/p&gt;&lt;p&gt;C:袁绍&lt;/p&gt;&lt;p&gt;D:刘备&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1509, 1, '诸葛亮的“八阵图”被谁破了？', 0, '', '', '&lt;p&gt;A:司马懿&lt;/p&gt;&lt;p&gt;B:陆逊&lt;/p&gt;&lt;p&gt;C:黄承彦&lt;/p&gt;&lt;p&gt;D:周瑜&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1508, 1, '谁被称为“小霸王”？', 0, '', '', '&lt;p&gt;A:赵云&lt;/p&gt;&lt;p&gt;B:典韦&lt;/p&gt;&lt;p&gt;C:孙策&lt;/p&gt;&lt;p&gt;D:文丑&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1507, 1, '曹仁布的“八门金锁阵”被谁破了？', 0, '', '', '&lt;p&gt;A:诸葛亮&lt;/p&gt;&lt;p&gt;B:庞统&lt;/p&gt;&lt;p&gt;C:徐庶&lt;/p&gt;&lt;p&gt;D:姜维&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1506, 1, '在赤壁之战前，曹操曾与孙权打了一仗，结果曹军大败，两员大将被杀，他们是谁？', 0, '', '', '&lt;p&gt;A:马延、张剀&lt;/p&gt;&lt;p&gt;B:焦触、张南&lt;/p&gt;&lt;p&gt;C:董衡、董超&lt;/p&gt;&lt;p&gt;D:宋宪、魏续&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2);
INSERT INTO `x2_questions` (`questionid`, `questiontype`, `question`, `questionuserid`, `questionusername`, `questionlastmodifyuser`, `questionselect`, `questionselectnumber`, `questionanswer`, `questiondescribe`, `questionknowsid`, `questioncreatetime`, `questionstatus`, `questionhtml`, `questionparent`, `questionsequence`, `questionlevel`) VALUES
(1505, 1, '三国时期，很多人结拜为义子、义父，下列哪一对不是义子、义父关系？', 0, '', '', '&lt;p&gt;A:吕布与丁原&lt;/p&gt;&lt;p&gt;B:刘备与刘封&lt;/p&gt;&lt;p&gt;C:马腾与马超&lt;/p&gt;&lt;p&gt;D:关羽与关平&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1504, 1, '“司马昭之心，路人皆知”是谁说的话？', 0, '', '', '&lt;p&gt;A:曹爽&lt;/p&gt;&lt;p&gt;B:曹髦&lt;/p&gt;&lt;p&gt;C:曹植&lt;/p&gt;&lt;p&gt;D:曹彰&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1503, 1, '谁收服了黄忠？', 0, '', '', '&lt;p&gt;A:赵云&lt;/p&gt;&lt;p&gt;B:关羽&lt;/p&gt;&lt;p&gt;C:魏延&lt;/p&gt;&lt;p&gt;D:廖化&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1502, 1, '化名“单福”的谋士是谁？', 0, '', '', '&lt;p&gt;A:徐庶&lt;/p&gt;&lt;p&gt;B:鲁肃&lt;/p&gt;&lt;p&gt;C:顾雍&lt;/p&gt;&lt;p&gt;D:虞翻&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1501, 1, '谁被誉为“一身都是胆”？', 0, '', '', '&lt;p&gt;A:关羽&lt;/p&gt;&lt;p&gt;B:张飞`&lt;/p&gt;&lt;p&gt;C:赵云&lt;/p&gt;&lt;p&gt;D:马超&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1499, 1, '仅用一百个兵劫掉曹操大营的人是谁？', 0, '', '', '&lt;p&gt;A:张飞&lt;/p&gt;&lt;p&gt;B:典韦&lt;/p&gt;&lt;p&gt;C:甘宁&lt;/p&gt;&lt;p&gt;D:陆逊&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1500, 1, '张飞于长坂坡吼死了哪位曹军大将？', 0, '', '', '&lt;p&gt;A:夏侯霸&lt;/p&gt;&lt;p&gt;B:夏侯渊&lt;/p&gt;&lt;p&gt;C:夏侯杰&lt;/p&gt;&lt;p&gt;D:夏侯敦&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1498, 1, '魏晋时期，出现“竹林七贤”，他们十分有才干且不追求功名利禄，下列谁不是竹林七贤之一？', 0, '', '', '&lt;p&gt;A:阮籍&lt;/p&gt;&lt;p&gt;B:嵇康&lt;/p&gt;&lt;p&gt;C:孔融&lt;/p&gt;&lt;p&gt;D:王戎&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1497, 1, '邓艾绕过汉中奇袭西蜀，在哪里杀死了诸葛亮的儿子诸葛瞻？', 0, '', '', '&lt;p&gt;A:绵竹&lt;/p&gt;&lt;p&gt;B:剑阁&lt;/p&gt;&lt;p&gt;C:定军山&lt;/p&gt;&lt;p&gt;D:祁山&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1496, 1, '公孙瓒被谁所灭？', 0, '', '', '&lt;p&gt;A:袁绍&lt;/p&gt;&lt;p&gt;B:袁术&lt;/p&gt;&lt;p&gt;C:吕布&lt;/p&gt;&lt;p&gt;D:曹操&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1495, 1, '关羽父子在哪里被擒？', 0, '', '', '&lt;p&gt;A:麦城&lt;/p&gt;&lt;p&gt;B:临沮&lt;/p&gt;&lt;p&gt;C:江陵&lt;/p&gt;&lt;p&gt;D:江夏&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1494, 1, '关羽水淹七军擒获的将领是谁？', 0, '', '', '&lt;p&gt;A:李典、于禁&lt;/p&gt;&lt;p&gt;B:庞德、曹仁&lt;/p&gt;&lt;p&gt;C:于禁、庞德&lt;/p&gt;&lt;p&gt;D:董衡、董超&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1493, 1, '董卓因何当上相国？', 0, '', '', '&lt;p&gt;A:拍马屁，贿赂大臣&lt;/p&gt;&lt;p&gt;B:护驾有功&lt;/p&gt;&lt;p&gt;C:其妹是太后&lt;/p&gt;&lt;p&gt;D:深得民心&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1492, 1, '孔融因何理由被曹操杀了？', 0, '', '', '&lt;p&gt;A:戏称曹操小名&lt;/p&gt;&lt;p&gt;B:说了曹操的坏话&lt;/p&gt;&lt;p&gt;C:借曹操之名陷害百姓&lt;/p&gt;&lt;p&gt;D:偷了曹操的东西&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1491, 1, '以下哪一条不是诸葛亮的功劳？', 0, '', '', '&lt;p&gt;A:平定南蛮，使人民安居乐业。&lt;/p&gt;&lt;p&gt;B:制造木牛流马。&lt;/p&gt;&lt;p&gt;C:为后人留下几百篇文章。&lt;/p&gt;&lt;p&gt;D:把蜀国建设的十分富强。&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1490, 1, '司马懿父子在哪次战役中几乎丧命？', 0, '', '', '&lt;p&gt;A:空城计&lt;/p&gt;&lt;p&gt;B:上方谷&lt;/p&gt;&lt;p&gt;C:汉中&lt;/p&gt;&lt;p&gt;D:长安&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1489, 1, '下列哪个人不是从袁绍处投到曹操的？', 0, '', '', '&lt;p&gt;A:陈琳&lt;/p&gt;&lt;p&gt;B:焦触&lt;/p&gt;&lt;p&gt;C:张郃&lt;/p&gt;&lt;p&gt;D:文聘&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1488, 1, '诸葛亮七擒孟获，期间孟获不断四处求救，下列哪个国家受到孟获的求救？', 0, '', '', '&lt;p&gt;A:乌戈国&lt;/p&gt;&lt;p&gt;B:西羌&lt;/p&gt;&lt;p&gt;C:吴国&lt;/p&gt;&lt;p&gt;D:匈奴&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1487, 1, '著名的《观沧海》是曹操攻击什么地方时写的？', 0, '', '', '&lt;p&gt;A:匈奴&lt;/p&gt;&lt;p&gt;B:乌桓&lt;/p&gt;&lt;p&gt;C:袁绍&lt;/p&gt;&lt;p&gt;D:张绣&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1486, 1, '吕布在哪里被杀？', 0, '', '', '&lt;p&gt;A:下邳&lt;/p&gt;&lt;p&gt;B:徐州&lt;/p&gt;&lt;p&gt;C:北海&lt;/p&gt;&lt;p&gt;D:豫州&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1485, 1, '谁没有参加密杀曹操的活动？', 0, '', '', '&lt;p&gt;A:刘备&lt;/p&gt;&lt;p&gt;B:马腾&lt;/p&gt;&lt;p&gt;C:吉太医&lt;/p&gt;&lt;p&gt;D:秦庆童&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1484, 1, '下列将领中，谁不是在吴蜀夷陵之战中战死的？', 0, '', '', '&lt;p&gt;A:张嶷&lt;/p&gt;&lt;p&gt;B:马忠&lt;/p&gt;&lt;p&gt;C:冯习&lt;/p&gt;&lt;p&gt;D:沙摩柯&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1483, 1, '谁说服马超投降刘备？', 0, '', '', '&lt;p&gt;A:诸葛亮&lt;/p&gt;&lt;p&gt;B:马良&lt;/p&gt;&lt;p&gt;C:李恢&lt;/p&gt;&lt;p&gt;D:简雍&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1482, 1, '下列哪一件事是真实的？', 0, '', '', '&lt;p&gt;A:诸葛亮草船借箭&lt;/p&gt;&lt;p&gt;B:蒋干盗书&lt;/p&gt;&lt;p&gt;C:孙策怒斩于吉&lt;/p&gt;&lt;p&gt;D:诸葛亮布“八卦阵”&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1481, 1, '诸葛亮初次打胜仗是在哪里？', 0, '', '', '&lt;p&gt;A:赤壁&lt;/p&gt;&lt;p&gt;B:博望坡&lt;/p&gt;&lt;p&gt;C:樊城&lt;/p&gt;&lt;p&gt;D:长坂坡&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1480, 1, '下列文人，哪一个不是袁绍的部下？', 0, '', '', '&lt;p&gt;A:陈琳&lt;/p&gt;&lt;p&gt;B:辛眦&lt;/p&gt;&lt;p&gt;C:逢纪&lt;/p&gt;&lt;p&gt;D:审配&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1479, 1, '中国第一枚邮票的是以什么图案为主图', 0, '', '', '&lt;p&gt;A:马&lt;/p&gt;&lt;p&gt;B:龙&lt;/p&gt;&lt;p&gt;C:牛&lt;/p&gt;&lt;p&gt;D:麒麟&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1478, 1, '萧何月下追谁', 0, '', '', '&lt;p&gt;A:刘邦&lt;/p&gt;&lt;p&gt;B:项羽&lt;/p&gt;&lt;p&gt;C:韩信&lt;/p&gt;&lt;p&gt;D:关羽&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1477, 1, '关羽在华容道放走了谁', 0, '', '', '&lt;p&gt;A:周瑜&lt;/p&gt;&lt;p&gt;B:项羽&lt;/p&gt;&lt;p&gt;C:曹操&lt;/p&gt;&lt;p&gt;D:张飞&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1476, 1, '中国古代伶人指的是', 0, '', '', '&lt;p&gt;A:聪明伶俐的人&lt;/p&gt;&lt;p&gt;B:以唱戏为职业的人&lt;/p&gt;&lt;p&gt;C:宦官&lt;/p&gt;&lt;p&gt;D:地位最低的人&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1475, 1, '明朝被称为九千岁的太监是', 0, '', '', '&lt;p&gt;A:李莲英&lt;/p&gt;&lt;p&gt;B:魏仲贤&lt;/p&gt;&lt;p&gt;C:郑和&lt;/p&gt;&lt;p&gt;D:小桂子&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1474, 1, '密特朗取消死刑前，法国主要采用何种方式行刑', 0, '', '', '&lt;p&gt;A:车裂&lt;/p&gt;&lt;p&gt;B:绞刑&lt;/p&gt;&lt;p&gt;C:上断头台&lt;/p&gt;&lt;p&gt;D:服毒&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1473, 1, '“五一”国际劳动节诞生于什么时候？', 0, '', '', '&lt;p&gt;A:1886年5月1日&lt;/p&gt;&lt;p&gt;B:1889年7月14日&lt;/p&gt;&lt;p&gt;C:1918年5月1日&lt;/p&gt;&lt;p&gt;D:1912年7月14日&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1472, 1, '现在世界上通用的历法——公历，有人曾似是而非地称之为“西历”。其实，究其根源，这种历法并非产生于西方，而是产生于6000多年前的', 0, '', '', '&lt;p&gt;A:古希腊&lt;/p&gt;&lt;p&gt;B:古埃及&lt;/p&gt;&lt;p&gt;C:古罗马&lt;/p&gt;&lt;p&gt;D:古印度&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1471, 1, '世界上第一次由广播公司正式播送电视节目是哪年？', 0, '', '', '&lt;p&gt;A:1925&lt;/p&gt;&lt;p&gt;B:1928&lt;/p&gt;&lt;p&gt;C:1936&lt;/p&gt;&lt;p&gt;D:1941&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1469, 1, '法国资产阶级革命爆发的时间', 0, '', '', '&lt;p&gt;A:1689.7.1&lt;/p&gt;&lt;p&gt;B:1789.7.14&lt;/p&gt;&lt;p&gt;C:1889.7.14&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1470, 1, '9月28日，谭嗣同等六人被杀害于北京', 0, '', '', '&lt;p&gt;A:午门&lt;/p&gt;&lt;p&gt;B:石景山&lt;/p&gt;&lt;p&gt;C:菜市口&lt;/p&gt;&lt;p&gt;D:八宝山&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1467, 1, '哪一年，我国第一颗氢弹爆炸试验成功？', 0, '', '', '&lt;p&gt;A:1965&lt;/p&gt;&lt;p&gt;B:1967&lt;/p&gt;&lt;p&gt;C:1969&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1468, 1, '在鸦片战争中，殉国于虎门靖远炮台的是', 0, '', '', '&lt;p&gt;A:关天培&lt;/p&gt;&lt;p&gt;B:林则徐 &lt;/p&gt;&lt;p&gt;C:冯子才&lt;/p&gt;&lt;p&gt;D:聂时成&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1466, 1, '刀耕时代用的工具是', 0, '', '', '&lt;p&gt;A:石斧木棒&lt;/p&gt;&lt;p&gt;B:锄头 &lt;/p&gt;&lt;p&gt;C:耙 &lt;/p&gt;&lt;p&gt;D:铜刀&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1465, 1, '春秋战国时期和伯乐齐名的相马专家是：', 0, '', '', '&lt;p&gt;A:方九皋&lt;/p&gt;&lt;p&gt;B:九方皋&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1464, 1, '九一八事变始于', 0, '', '', '&lt;p&gt;A:1930年&lt;/p&gt;&lt;p&gt;B:1931年&lt;/p&gt;&lt;p&gt;C:1932年&lt;/p&gt;&lt;p&gt;D:1937年&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1462, 1, '最早踏上南极洲的中国人是：', 0, '', '', '&lt;p&gt;A:陈德鸿和郭琨&lt;/p&gt;&lt;p&gt;B:董兆乾和张青松&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1463, 1, '中国历史最长的朝代是：', 0, '', '', '&lt;p&gt;A:周&lt;/p&gt;&lt;p&gt;B:汉&lt;/p&gt;&lt;p&gt;C:唐&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1461, 1, '最早徒步到达南极点的中国人是:', 0, '', '', '&lt;p&gt;A:张青松&lt;/p&gt;&lt;p&gt;B:秦大河&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1460, 1, '下列人类中最早使用天然火的是：', 0, '', '', '&lt;p&gt;A:元谋人&lt;/p&gt;&lt;p&gt;B:北京人&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1459, 1, '中国僵都最早、历时最长、朝代最多的古城是：', 0, '', '', '&lt;p&gt;A:长安&lt;/p&gt;&lt;p&gt;B:洛阳&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1458, 1, '中华鲟和恐龙哪一个在地球上出现的早？', 0, '', '', '&lt;p&gt;A:恐龙&lt;/p&gt;&lt;p&gt;B:中华鲟&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1457, 1, '中国是世界上最早炼锌的国家，早在什么时候开始的？', 0, '', '', '&lt;p&gt;A:东汉&lt;/p&gt;&lt;p&gt;B:西汉&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1456, 1, '中国哪位皇帝最长寿？', 0, '', '', '&lt;p&gt;A:乾隆&lt;/p&gt;&lt;p&gt;B:武则天&lt;/p&gt;&lt;p&gt;C:康熙&lt;/p&gt;&lt;p&gt;D:忽必烈&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1455, 1, '建国后上海第一任市长是：', 0, '', '', '&lt;p&gt;A:贺龙&lt;/p&gt;&lt;p&gt;B:陈毅&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1454, 1, '中国第一颗原子弹爆炸的日期是1964年的：', 0, '', '', '&lt;p&gt;A:4月24日&lt;/p&gt;&lt;p&gt;B:6月17日&lt;/p&gt;&lt;p&gt;C:10月16日&lt;/p&gt;&lt;p&gt;D:10月17日&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1453, 1, '中国历史上，政府官员最早是以什么当作工资发放？', 0, '', '', '&lt;p&gt;A:土地&lt;/p&gt;&lt;p&gt;B:粮食&lt;/p&gt;&lt;p&gt;C:奴隶&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1452, 1, '我国目前最早的砖墙出现在哪个朝代？', 0, '', '', '&lt;p&gt;A:战国&lt;/p&gt;&lt;p&gt;B:秦朝&lt;/p&gt;&lt;p&gt;C:汉朝&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1451, 1, '我国的夜市最早出现在：', 0, '', '', '&lt;p&gt;A:汉朝&lt;/p&gt;&lt;p&gt;B:唐朝&lt;/p&gt;&lt;p&gt;C:宋朝&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1449, 1, '中国第一个革命根据地是', 0, '', '', '&lt;p&gt;A:井冈山革命根据地&lt;/p&gt;&lt;p&gt;B:中央革命根据地&lt;/p&gt;&lt;p&gt;C:左右江革命根据地&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1450, 1, '和平号空间站是_________年2月20日发射的，是苏联时期发射的第三代载人空间站。它的最大特点是有6个对接口，可供多艘飞船、航天飞机和有效载荷舱对接，组成庞大的空间复合体。', 0, '', '', '&lt;p&gt;A:1985&lt;/p&gt;&lt;p&gt;B:1986&lt;/p&gt;&lt;p&gt;C:1987&lt;/p&gt;&lt;p&gt;D:1988&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1448, 1, '竹简与木牍在古代被用作记载文字的材料，其中记载较长的文字，一般用', 0, '', '', '&lt;p&gt;A:竹简&lt;/p&gt;&lt;p&gt;B:木牍&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1447, 1, '五粮液是我国的名酒，它的原名叫杂粮酒。“五粮液”之名是1929年才出现的，是谁为此酒起的名？', 0, '', '', '&lt;p&gt;A:当时宜宾县团练局局长雷东垣&lt;/p&gt;&lt;p&gt;B:晚清举人杨惠泉&lt;/p&gt;&lt;p&gt;C:“五粮液”传人邓子均&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1446, 1, '面包的故乡是古埃及，那么古埃及人是什么时候就开始制作面包的？', 0, '', '', '&lt;p&gt;A:距今5700-6900年前&lt;/p&gt;&lt;p&gt;B:距今7000-10000年前&lt;/p&gt;&lt;p&gt;C:距今2100-4000年前&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1445, 1, '旧时把多大年龄的女子称为破瓜？', 0, '', '', '&lt;p&gt;A:12岁&lt;/p&gt;&lt;p&gt;B:15岁&lt;/p&gt;&lt;p&gt;C:16岁&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1444, 1, '西方的悲剧源于古希腊祭祀_____ 的仪式。', 0, '', '', '&lt;p&gt;A:死神&lt;/p&gt;&lt;p&gt;B:酒神&lt;/p&gt;&lt;p&gt;C:太阳神&lt;/p&gt;&lt;p&gt;D:海神&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1443, 1, '下列中国封建社会时期的统一王朝中，统治时间较长的是：', 0, '', '', '&lt;p&gt;A:西汉&lt;/p&gt;&lt;p&gt;B:唐&lt;/p&gt;&lt;p&gt;C:元&lt;/p&gt;&lt;p&gt;D:明&lt;/p&gt;&lt;p&gt;E:清&lt;/p&gt;', 5, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1441, 1, '世界上最早的“太阳历”是由谁发明的', 0, '', '', '&lt;p&gt;A:古代埃及人&lt;/p&gt;&lt;p&gt;B:古代巴比伦人&lt;/p&gt;&lt;p&gt;C:古代中国人&lt;/p&gt;&lt;p&gt;D:古代希腊人&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1442, 1, '我们今天用的数字，如“1，2，3…”是由谁最先采用的？', 0, '', '', '&lt;p&gt;A:古代埃及人&lt;/p&gt;&lt;p&gt;B:古代印度人&lt;/p&gt;&lt;p&gt;C:古代阿拉伯人&lt;/p&gt;&lt;p&gt;D:古代希腊人&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1440, 1, '人类历史上的“第二次社会大分工”的标志是出现了独立的：', 0, '', '', '&lt;p&gt;A:畜牧业&lt;/p&gt;&lt;p&gt;B:农牧业&lt;/p&gt;&lt;p&gt;C:手工业&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1439, 1, '下列哪个不属于“五代十国”中的“五代”：', 0, '', '', '&lt;p&gt;A:后魏&lt;/p&gt;&lt;p&gt;B:后梁&lt;/p&gt;&lt;p&gt;C:后唐&lt;/p&gt;&lt;p&gt;D:后周&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1438, 1, '以下不属于戊戌变法“六君子”的是：', 0, '', '', '&lt;p&gt;A:刘光第&lt;/p&gt;&lt;p&gt;B:林旭&lt;/p&gt;&lt;p&gt;C:林觉民&lt;/p&gt;&lt;p&gt;D:谭嗣同&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1437, 1, '被誉为“青铜时代”的是？', 0, '', '', '&lt;p&gt;A:原始社会&lt;/p&gt;&lt;p&gt;B:夏商周时期&lt;/p&gt;&lt;p&gt;C:春秋时期&lt;/p&gt;&lt;p&gt;D:战国时期&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1436, 2, '下列是中国古代唯物主义思想家的是？（多选）', 0, '', '', '&lt;p&gt;A:范缜&lt;/p&gt;&lt;p&gt;B:王充&lt;/p&gt;&lt;p&gt;C:王克明&lt;/p&gt;&lt;p&gt;D:严复&lt;/p&gt;&lt;p&gt;E:朱熹&lt;/p&gt;', 5, 'AD', 'AD', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1435, 1, '勾股定理最早出现在？', 0, '', '', '&lt;p&gt;A:九章算术&lt;/p&gt;&lt;p&gt;B:周髀算经&lt;/p&gt;&lt;p&gt;C:方圆阐幽&lt;/p&gt;&lt;p&gt;D:决疑数学&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1433, 1, '中国历史上哪一位皇帝在位时间最长？', 0, '', '', '&lt;p&gt;A:唐太宗&lt;/p&gt;&lt;p&gt;B:康熙&lt;/p&gt;&lt;p&gt;C:乾隆&lt;/p&gt;&lt;p&gt;D:汉武帝&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1434, 1, '世界上第一部由国家颁布的医药著作是？', 0, '', '', '&lt;p&gt;A:本草纲目&lt;/p&gt;&lt;p&gt;B:唐本草&lt;/p&gt;&lt;p&gt;C:伤寒杂病论&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1432, 1, '指挥红军粉碎国民党对中央苏区第4次“围剿”的是？', 0, '', '', '&lt;p&gt;A:周恩来、朱德&lt;/p&gt;&lt;p&gt;B:毛泽东、朱德&lt;/p&gt;&lt;p&gt;C:朱德、陈毅&lt;/p&gt;&lt;p&gt;D:毛泽东、周恩来&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1431, 1, '联合国成立于', 0, '', '', '&lt;p&gt;A:1945年10月&lt;/p&gt;&lt;p&gt;B:1946年2月&lt;/p&gt;&lt;p&gt;C:1946年10月&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1430, 1, '百团大战发生于', 0, '', '', '&lt;p&gt;A:1940年2月&lt;/p&gt;&lt;p&gt;B:1940年7月&lt;/p&gt;&lt;p&gt;C:1940年8月&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1428, 1, '戊戌变法发生在那一年？', 0, '', '', '&lt;p&gt;A:1896&lt;/p&gt;&lt;p&gt;B:1898&lt;/p&gt;&lt;p&gt;C:1899&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1429, 2, '山西被称为三晋的三国包括：（多选）', 0, '', '', '&lt;p&gt;A:韩&lt;/p&gt;&lt;p&gt;B:燕&lt;/p&gt;&lt;p&gt;C:赵&lt;/p&gt;&lt;p&gt;D:魏&lt;/p&gt;&lt;p&gt;E:楚&lt;/p&gt;', 5, 'ACD', 'ACD', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1427, 1, '列宁逝世于哪一年？', 0, '', '', '&lt;p&gt;A:1921&lt;/p&gt;&lt;p&gt;B:1918&lt;/p&gt;&lt;p&gt;C:1924&lt;/p&gt;&lt;p&gt;D:1923&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1426, 1, '我国成功发射第一颗人造卫星是那一年？', 0, '', '', '&lt;p&gt;A:1970&lt;/p&gt;&lt;p&gt;B:1971&lt;/p&gt;&lt;p&gt;C:1972&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1425, 1, '我国第一个不平等条约是：', 0, '', '', '&lt;p&gt;A:马关条约&lt;/p&gt;&lt;p&gt;B:南京条约&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1424, 1, '红军长征跨越了多少个省？', 0, '', '', '&lt;p&gt;A:9&lt;/p&gt;&lt;p&gt;B:10&lt;/p&gt;&lt;p&gt;C:11&lt;/p&gt;&lt;p&gt;D:12&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1423, 1, '燕京八景是谁题写的?', 0, '', '', '&lt;p&gt;A:康熙&lt;/p&gt;&lt;p&gt;B:光旭&lt;/p&gt;&lt;p&gt;C:乾隆&lt;/p&gt;&lt;p&gt;D:雍正&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1422, 1, '人类在哪一年登上月球', 0, '', '', '&lt;p&gt;A:1968&lt;/p&gt;&lt;p&gt;B:1969&lt;/p&gt;&lt;p&gt;C:1454&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1421, 1, '世界上最早的纸币出现在哪个国家.', 0, '', '', '&lt;p&gt;A:意大利&lt;/p&gt;&lt;p&gt;B:美国&lt;/p&gt;&lt;p&gt;C:英国&lt;/p&gt;&lt;p&gt;D:中国&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1420, 1, '最早提出冷战概念的是谁?', 0, '', '', '&lt;p&gt;A:杜鲁门&lt;/p&gt;&lt;p&gt;B:丘吉尔&lt;/p&gt;&lt;p&gt;C:克林顿&lt;/p&gt;&lt;p&gt;D:马谢尔&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1419, 1, '清朝康熙皇帝曾封一名外国传教士为钦天监正，主持古观象台的观测工作，此人是：', 0, '', '', '&lt;p&gt;A:南怀仁&lt;/p&gt;&lt;p&gt;B:汤若望&lt;/p&gt;&lt;p&gt;C:利马窦&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1418, 1, '清代文学家谁的书房自己命名为“九十九砚斋”', 0, '', '', '&lt;p&gt;A:纪晓岚&lt;/p&gt;&lt;p&gt;B:曹雪芹&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1417, 1, '皇太极是哪朝太祖', 0, '', '', '&lt;p&gt;A:元朝&lt;/p&gt;&lt;p&gt;B:西汉&lt;/p&gt;&lt;p&gt;C:清朝&lt;/p&gt;&lt;p&gt;D:唐朝&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1416, 1, '十二平均律起源于：', 0, '', '', '&lt;p&gt;A:中国&lt;/p&gt;&lt;p&gt;B:德国&lt;/p&gt;&lt;p&gt;C:意大利&lt;/p&gt;&lt;p&gt;D:法国&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1415, 1, '末代皇帝的年号为：', 0, '', '', '&lt;p&gt;A:道光&lt;/p&gt;&lt;p&gt;B:崇德&lt;/p&gt;&lt;p&gt;C:宣统&lt;/p&gt;&lt;p&gt;D:嘉庆&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1414, 1, '被誉为“两弹元勋”的科学家是', 0, '', '', '&lt;p&gt;A:钱学森&lt;/p&gt;&lt;p&gt;B:邓稼先&lt;/p&gt;&lt;p&gt;C:袁隆平&lt;/p&gt;&lt;p&gt;D:吴阶平&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1413, 2, '中国古代四大名琴是：（多选）', 0, '', '', '&lt;p&gt;A:号钟&lt;/p&gt;&lt;p&gt;B:秦筝&lt;/p&gt;&lt;p&gt;C:绿绮&lt;/p&gt;&lt;p&gt;D:焦尾&lt;/p&gt;&lt;p&gt;E:绕梁&lt;/p&gt;', 5, 'ACD', 'ACD', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1412, 1, '中国古代战国时期越国大匠欧治子为楚王铸了三口名剑，下列四口名剑中哪一口不是', 0, '', '', '&lt;p&gt;A:龙渊&lt;/p&gt;&lt;p&gt;B:泰合&lt;/p&gt;&lt;p&gt;C:工布&lt;/p&gt;&lt;p&gt;D:湛卢&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1411, 1, '徽班进京距今已有多少年历史？', 0, '', '', '&lt;p&gt;A:100多年&lt;/p&gt;&lt;p&gt;B:200多年&lt;/p&gt;&lt;p&gt;C:300多年&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1410, 1, '海湾战争中多国部队的最高司令是谁？', 0, '', '', '&lt;p&gt;A:麦克阿瑟&lt;/p&gt;&lt;p&gt;B:亚历山大&lt;/p&gt;&lt;p&gt;C:施瓦茨科夫&lt;/p&gt;&lt;p&gt;D:布什&lt;/p&gt;&lt;p&gt;E:萨达姆&lt;/p&gt;', 5, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1409, 1, '中日第二次淞沪会战发生在：', 0, '', '', '&lt;p&gt;A:1932年1月28日&lt;/p&gt;&lt;p&gt;B:1937年7月7日&lt;/p&gt;&lt;p&gt;C:1937年8月13日&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1408, 1, '第二次中东战争中以色列的哪只部队因冒进遭埃及部队伏击几乎损失殆尽？', 0, '', '', '&lt;p&gt;A:第7装甲旅&lt;/p&gt;&lt;p&gt;B:第202伞兵旅&lt;/p&gt;&lt;p&gt;C:第11机步师&lt;/p&gt;&lt;p&gt;D:第1步兵师&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1407, 1, '“暴怒行动”的是美军入侵哪个国家的行动代号？', 0, '', '', '&lt;p&gt;A:格林纳达&lt;/p&gt;&lt;p&gt;B:古巴&lt;/p&gt;&lt;p&gt;C:巴拿马&lt;/p&gt;&lt;p&gt;D:伊拉克&lt;/p&gt;&lt;p&gt;E:利比亚&lt;/p&gt;', 5, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1406, 1, '秦始皇灭六国后，统一了全国文字，这种汉字称作：', 0, '', '', '&lt;p&gt;A:隶书&lt;/p&gt;&lt;p&gt;B:小篆&lt;/p&gt;&lt;p&gt;C:楷书&lt;/p&gt;&lt;p&gt;D:行书&lt;/p&gt;&lt;p&gt;E:草书&lt;/p&gt;', 5, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1405, 1, '我们现在所说的“MTV”最早是什么名字？', 0, '', '', '&lt;p&gt;A:一首歌曲&lt;/p&gt;&lt;p&gt;B:一个电视频道&lt;/p&gt;&lt;p&gt;C:一部电影&lt;/p&gt;&lt;p&gt;D:一位明星&lt;/p&gt;&lt;p&gt;E:一本小说&lt;/p&gt;', 5, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1404, 1, '项羽临死诗中提到的一个女人是谁？', 0, '', '', '&lt;p&gt;A:王昭君&lt;/p&gt;&lt;p&gt;B:西施&lt;/p&gt;&lt;p&gt;C:赵飞燕&lt;/p&gt;&lt;p&gt;D:虞姬&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1403, 1, '杭州是哪一个王朝的都城？', 0, '', '', '&lt;p&gt;A:北宋&lt;/p&gt;&lt;p&gt;B:南宋&lt;/p&gt;&lt;p&gt;C:明朝&lt;/p&gt;&lt;p&gt;D:唐朝&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1402, 1, '中国古代的神农氏是下面哪一位？', 0, '', '', '&lt;p&gt;A:帝喾&lt;/p&gt;&lt;p&gt;B:黄帝&lt;/p&gt;&lt;p&gt;C:炎帝&lt;/p&gt;&lt;p&gt;D:有巢&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1401, 1, '中国最早的纸币出现在哪一个朝代', 0, '', '', '&lt;p&gt;A:唐朝&lt;/p&gt;&lt;p&gt;B:宋朝&lt;/p&gt;&lt;p&gt;C:元朝&lt;/p&gt;&lt;p&gt;D:明朝&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1400, 1, '大禹的父亲是谁？', 0, '', '', '&lt;p&gt;A:尧&lt;/p&gt;&lt;p&gt;B:舜&lt;/p&gt;&lt;p&gt;C:鲧&lt;/p&gt;&lt;p&gt;D:共工&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1399, 1, '恺撒大帝被谁刺死的', 0, '', '', '&lt;p&gt;A:渥大卫&lt;/p&gt;&lt;p&gt;B:庞贝&lt;/p&gt;&lt;p&gt;C:布鲁图&lt;/p&gt;&lt;p&gt;D:安东尼&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1398, 1, '中国最早的现代大学是哪一所', 0, '', '', '&lt;p&gt;A:天津大学&lt;/p&gt;&lt;p&gt;B:北京大学&lt;/p&gt;&lt;p&gt;C:浙江大学&lt;/p&gt;&lt;p&gt;D:上海交大&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1397, 1, '古代的巴比伦王国的位置相当于现在的哪个国家', 0, '', '', '&lt;p&gt;A:伊拉克&lt;/p&gt;&lt;p&gt;B:伊朗&lt;/p&gt;&lt;p&gt;C:阿富汉&lt;/p&gt;&lt;p&gt;D:以色列&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1396, 1, '康熙皇帝的庙号是', 0, '', '', '&lt;p&gt;A:太宗&lt;/p&gt;&lt;p&gt;B:太祖&lt;/p&gt;&lt;p&gt;C:高祖&lt;/p&gt;&lt;p&gt;D:圣祖&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1395, 1, '我国第一套航空邮票发行于', 0, '', '', '&lt;p&gt;A:1950&lt;/p&gt;&lt;p&gt;B:1951&lt;/p&gt;&lt;p&gt;C:1952&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1394, 1, '法国资产阶级革命是以巴黎人民攻占何地的起义为序幕？', 0, '', '', '&lt;p&gt;A:凡尔赛&lt;/p&gt;&lt;p&gt;B:巴士底狱&lt;/p&gt;&lt;p&gt;C:贝尔·拉雪兹公墓&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1393, 1, '美国独立战争的序幕是哪年拉开的', 0, '', '', '&lt;p&gt;A:1774&lt;/p&gt;&lt;p&gt;B:1775&lt;/p&gt;&lt;p&gt;C:1776&lt;/p&gt;&lt;p&gt;D:1777&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1392, 1, '当代旅行家余纯顺在哪里遇难', 0, '', '', '&lt;p&gt;A:贺兰山&lt;/p&gt;&lt;p&gt;B:西藏阿里地区&lt;/p&gt;&lt;p&gt;C:黑龙江边陲&lt;/p&gt;&lt;p&gt;D:罗布泊&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1391, 1, '在我国最早介绍俄国十月革命，宣传马克思主义的是', 0, '', '', '&lt;p&gt;A:陈独秀&lt;/p&gt;&lt;p&gt;B:李大钊&lt;/p&gt;&lt;p&gt;C:李达&lt;/p&gt;&lt;p&gt;D:张国焘&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1389, 1, '下列哪种敌兵是从海上进攻中原的', 0, '', '', '&lt;p&gt;A:突厥&lt;/p&gt;&lt;p&gt;B:倭寇&lt;/p&gt;&lt;p&gt;C:匈奴&lt;/p&gt;&lt;p&gt;D:金人&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1390, 1, '哪位人物拥有无字碑', 0, '', '', '&lt;p&gt;A:唐玄宗&lt;/p&gt;&lt;p&gt;B:武则天&lt;/p&gt;&lt;p&gt;C:朱元璋&lt;/p&gt;&lt;p&gt;D:朱元璋&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1388, 1, '阿波罗号宇航员登上月球后与哪位总统通了电话', 0, '', '', '&lt;p&gt;A:肯尼迪&lt;/p&gt;&lt;p&gt;B:尼克松&lt;/p&gt;&lt;p&gt;C:福特&lt;/p&gt;&lt;p&gt;D:卡特&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1387, 1, '谁不是遇刺身亡的领导人', 0, '', '', '&lt;p&gt;A:齐亚·哈克&lt;/p&gt;&lt;p&gt;B:帕尔梅&lt;/p&gt;&lt;p&gt;C:英甘地&lt;/p&gt;&lt;p&gt;D:林肯&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1385, 1, '哪种花在历史上曾价值连城', 0, '', '', '&lt;p&gt;A:君子兰&lt;/p&gt;&lt;p&gt;B:郁金香&lt;/p&gt;&lt;p&gt;C:紫罗兰&lt;/p&gt;&lt;p&gt;D:牡丹&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1386, 1, '下列哪位大臣不是武则天时期的酷吏', 0, '', '', '&lt;p&gt;A:索元礼&lt;/p&gt;&lt;p&gt;B:周兴&lt;/p&gt;&lt;p&gt;C:来俊臣&lt;/p&gt;&lt;p&gt;D:谢瑶环&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1384, 1, '太真是谁出家时的道号', 0, '', '', '&lt;p&gt;A:貂蝉&lt;/p&gt;&lt;p&gt;B:赵飞燕&lt;/p&gt;&lt;p&gt;C:杨玉环&lt;/p&gt;&lt;p&gt;D:武则天&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1383, 1, '古巴导弹危机是谁造成的', 0, '', '', '&lt;p&gt;A:戈尔巴乔夫&lt;/p&gt;&lt;p&gt;B:勃列日涅夫&lt;/p&gt;&lt;p&gt;C:赫鲁晓夫&lt;/p&gt;&lt;p&gt;D:斯大林&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1382, 1, '韩信被称为', 0, '', '', '&lt;p&gt;A:楚王&lt;/p&gt;&lt;p&gt;B:梁王&lt;/p&gt;&lt;p&gt;C:淮南王&lt;/p&gt;&lt;p&gt;D:翼王&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1381, 1, '美国历史上第一个黑人将军是', 0, '', '', '&lt;p&gt;A:本杰明·戴维斯&lt;/p&gt;&lt;p&gt;B:科林·鲍威尔&lt;/p&gt;&lt;p&gt;C:麦克阿瑟&lt;/p&gt;&lt;p&gt;D:马歇尔&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1380, 1, '传说中耶稣死后第几天复活了', 0, '', '', '&lt;p&gt;A:三&lt;/p&gt;&lt;p&gt;B:四&lt;/p&gt;&lt;p&gt;C:五&lt;/p&gt;&lt;p&gt;D:六&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1379, 1, '下列哪位思想家被判死刑', 0, '', '', '&lt;p&gt;A:柏拉图&lt;/p&gt;&lt;p&gt;B:苏格拉底&lt;/p&gt;&lt;p&gt;C:卢梭&lt;/p&gt;&lt;p&gt;D:希波克拉底&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1378, 1, '未曾享受国葬待遇的是', 0, '', '', '&lt;p&gt;A:丘吉尔&lt;/p&gt;&lt;p&gt;B:密特朗&lt;/p&gt;&lt;p&gt;C:肯尼迪&lt;/p&gt;&lt;p&gt;D:尼克松&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1377, 1, '古城庞贝毁于', 0, '', '', '&lt;p&gt;A:战火&lt;/p&gt;&lt;p&gt;B:瘟疫&lt;/p&gt;&lt;p&gt;C:地震&lt;/p&gt;&lt;p&gt;D:火山爆发&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1376, 1, '斯巴达克思是一位', 0, '', '', '&lt;p&gt;A:角斗士&lt;/p&gt;&lt;p&gt;B:奴隶主&lt;/p&gt;&lt;p&gt;C:诗人&lt;/p&gt;&lt;p&gt;D:贱民&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1375, 1, '不属文化大革命的特殊产物是', 0, '', '', '&lt;p&gt;A:放卫星&lt;/p&gt;&lt;p&gt;B:忠字舞&lt;/p&gt;&lt;p&gt;C:大串联&lt;/p&gt;&lt;p&gt;D:语录歌&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1374, 1, '第一次进入太空的动物是', 0, '', '', '&lt;p&gt;A:狗&lt;/p&gt;&lt;p&gt;B:猴&lt;/p&gt;&lt;p&gt;C:昆虫&lt;/p&gt;&lt;p&gt;D:猫&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1373, 1, '对米开朗基罗不合适的称谓是', 0, '', '', '&lt;p&gt;A:音乐家&lt;/p&gt;&lt;p&gt;B:雕塑家&lt;/p&gt;&lt;p&gt;C:画家&lt;/p&gt;&lt;p&gt;D:建筑师&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1372, 1, '南陈王朝的陈后主在隋军攻入皇宫时与两宠妃藏在哪里', 0, '', '', '&lt;p&gt;A:厨房&lt;/p&gt;&lt;p&gt;B:水井&lt;/p&gt;&lt;p&gt;C:地窖&lt;/p&gt;&lt;p&gt;D:花园&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1371, 1, '中世纪最后一位诗人，新时代最初一位诗人指的是', 0, '', '', '&lt;p&gt;A:浮士德&lt;/p&gt;&lt;p&gt;B:维吉尔&lt;/p&gt;&lt;p&gt;C:但丁&lt;/p&gt;&lt;p&gt;D:歌德&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1370, 1, '投笔从戎的是', 0, '', '', '&lt;p&gt;A:班彪&lt;/p&gt;&lt;p&gt;B:班固&lt;/p&gt;&lt;p&gt;C:班超&lt;/p&gt;&lt;p&gt;D:班昭&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1369, 1, '为王昭君画像的画师是', 0, '', '', '&lt;p&gt;A:毛延寿&lt;/p&gt;&lt;p&gt;B:唐伯虎&lt;/p&gt;&lt;p&gt;C:郑板桥&lt;/p&gt;&lt;p&gt;D:丰子恺&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1368, 1, '人类首例心脏移植手术是哪年施行的', 0, '', '', '&lt;p&gt;A:1965&lt;/p&gt;&lt;p&gt;B:1967&lt;/p&gt;&lt;p&gt;C:1970&lt;/p&gt;&lt;p&gt;D:1972&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1367, 1, '第一个进入太空的是', 0, '', '', '&lt;p&gt;A:特里斯科娃&lt;/p&gt;&lt;p&gt;B:格伦&lt;/p&gt;&lt;p&gt;C:谢泼德&lt;/p&gt;&lt;p&gt;D:加加林&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1366, 1, '利用水力来舂米碾谷子的水碓磨是谁发明的', 0, '', '', '&lt;p&gt;A:沈括&lt;/p&gt;&lt;p&gt;B:祖冲之&lt;/p&gt;&lt;p&gt;C:徐光启&lt;/p&gt;&lt;p&gt;D:贾思勰&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1365, 1, '伊丽莎白二世加冕时年仅多少岁', 0, '', '', '&lt;p&gt;A:18&lt;/p&gt;&lt;p&gt;B:20&lt;/p&gt;&lt;p&gt;C:24&lt;/p&gt;&lt;p&gt;D:26&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1364, 1, '代表封建生产关系的是（）。', 0, '', '', '&lt;p&gt;A:铜器&lt;/p&gt;&lt;p&gt;B:陶器&lt;/p&gt;&lt;p&gt;C:青铜&lt;/p&gt;&lt;p&gt;D:铁制工具&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1362, 1, '我国第一所民办高等教育机构哪年建立', 0, '', '', '&lt;p&gt;A:1982&lt;/p&gt;&lt;p&gt;B:1985&lt;/p&gt;&lt;p&gt;C:1988&lt;/p&gt;&lt;p&gt;D:1992&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1363, 1, '中国境内迄今所知年代最早的直立人是那种人?', 0, '', '', '&lt;p&gt;A:蓝田人 &lt;/p&gt;&lt;p&gt;B:山顶洞人 &lt;/p&gt;&lt;p&gt;C:元谋人 &lt;/p&gt;&lt;p&gt;D:河姆渡人&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1361, 1, '闻鸡起舞的是谁', 0, '', '', '&lt;p&gt;A:班超&lt;/p&gt;&lt;p&gt;B:辛弃疾&lt;/p&gt;&lt;p&gt;C:祖逖&lt;/p&gt;&lt;p&gt;D:霍去病&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1360, 1, '被后人称为陶朱公的是谁', 0, '', '', '&lt;p&gt;A:商鞅&lt;/p&gt;&lt;p&gt;B:范蠡&lt;/p&gt;&lt;p&gt;C:姜太公&lt;/p&gt;&lt;p&gt;D:孟尝君&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1359, 1, '王羲之最喜玩赏什么', 0, '', '', '&lt;p&gt;A:梅花&lt;/p&gt;&lt;p&gt;B:白鹅&lt;/p&gt;&lt;p&gt;C:小狗&lt;/p&gt;&lt;p&gt;D:兰花&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1357, 1, '鸿门宴是谁设的', 0, '', '', '&lt;p&gt;A:刘邦&lt;/p&gt;&lt;p&gt;B:项羽&lt;/p&gt;&lt;p&gt;C:项庄&lt;/p&gt;&lt;p&gt;D:萧何&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1358, 1, '唐代时哪个国家派往中国进行学习的人称为遣唐使', 0, '', '', '&lt;p&gt;A:日本&lt;/p&gt;&lt;p&gt;B:印度&lt;/p&gt;&lt;p&gt;C:英国&lt;/p&gt;&lt;p&gt;D:西班牙&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1356, 1, '千里送京娘的男主角是谁', 0, '', '', '&lt;p&gt;A:赵匡胤&lt;/p&gt;&lt;p&gt;B:朱元璋&lt;/p&gt;&lt;p&gt;C:李自成&lt;/p&gt;&lt;p&gt;D:洪秀全&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1355, 1, '老子是骑着什么出函谷关后再无踪影的', 0, '', '', '&lt;p&gt;A:马&lt;/p&gt;&lt;p&gt;B:牛&lt;/p&gt;&lt;p&gt;C:驴&lt;/p&gt;&lt;p&gt;D:骡子&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1354, 1, '被腰斩而亡的是', 0, '', '', '&lt;p&gt;A:韩非子&lt;/p&gt;&lt;p&gt;B:赵高&lt;/p&gt;&lt;p&gt;C:李斯&lt;/p&gt;&lt;p&gt;D:荆轲&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1353, 1, '下述哪场战争不是以少胜多', 0, '', '', '&lt;p&gt;A:淝水之战&lt;/p&gt;&lt;p&gt;B:赤壁之战&lt;/p&gt;&lt;p&gt;C:巨鹿之战&lt;/p&gt;&lt;p&gt;D:官渡之战&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1352, 1, '明代郑和下过几次西洋', 0, '', '', '&lt;p&gt;A:三&lt;/p&gt;&lt;p&gt;B:四&lt;/p&gt;&lt;p&gt;C:六&lt;/p&gt;&lt;p&gt;D:七&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1351, 1, '孙膑的老师叫什么', 0, '', '', '&lt;p&gt;A:孙武&lt;/p&gt;&lt;p&gt;B:鬼谷子&lt;/p&gt;&lt;p&gt;C:庞涓&lt;/p&gt;&lt;p&gt;D:吴起&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1350, 1, '我们今天使用的历法是从何时开始的?', 0, '', '', '&lt;p&gt;A:一千年前&lt;/p&gt;&lt;p&gt;B:两千年前&lt;/p&gt;&lt;p&gt;C:三千年前&lt;/p&gt;&lt;p&gt;D:两千年前&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1349, 1, '谁帮田忌出计在赛马中获胜', 0, '', '', '&lt;p&gt;A:庞涓&lt;/p&gt;&lt;p&gt;B:吕不韦&lt;/p&gt;&lt;p&gt;C:孔融&lt;/p&gt;&lt;p&gt;D:孙膑&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1348, 1, '战国时哪个诸侯王最喜欢细腰', 0, '', '', '&lt;p&gt;A:楚灵王&lt;/p&gt;&lt;p&gt;B:秦穆公&lt;/p&gt;&lt;p&gt;C:鲁惠公&lt;/p&gt;&lt;p&gt;D:楚庄王&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1347, 1, '中国哪个朝代对外国文化吸收最多', 0, '', '', '&lt;p&gt;A:唐代&lt;/p&gt;&lt;p&gt;B:宋代&lt;/p&gt;&lt;p&gt;C:清代&lt;/p&gt;&lt;p&gt;D:元代&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1346, 1, '卓文君与司马相如私奔后在哪里卖酒', 0, '', '', '&lt;p&gt;A:今南京&lt;/p&gt;&lt;p&gt;B:今重庆&lt;/p&gt;&lt;p&gt;C:今成都&lt;/p&gt;&lt;p&gt;D:今北京&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1345, 1, '烽火戏诸侯是为博谁一笑', 0, '', '', '&lt;p&gt;A:褒姒&lt;/p&gt;&lt;p&gt;B:杨玉环&lt;/p&gt;&lt;p&gt;C:西施&lt;/p&gt;&lt;p&gt;D:貂蝉&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1344, 1, '美国的三K党是一个反对谁的恐怖组织', 0, '', '', '&lt;p&gt;A:黑人&lt;/p&gt;&lt;p&gt;B:南北战争&lt;/p&gt;&lt;p&gt;C:资产阶级&lt;/p&gt;&lt;p&gt;D:政府&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1343, 1, '教皇保罗二世为哪位科学家平反', 0, '', '', '&lt;p&gt;A:伽俐略&lt;/p&gt;&lt;p&gt;B:布鲁诺&lt;/p&gt;&lt;p&gt;C:哥白尼&lt;/p&gt;&lt;p&gt;D:道尔顿&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1342, 1, '中国古代著名旅行家是', 0, '', '', '&lt;p&gt;A:李时珍&lt;/p&gt;&lt;p&gt;B:苏武&lt;/p&gt;&lt;p&gt;C:徐霞客&lt;/p&gt;&lt;p&gt;D:张骞&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1341, 1, '玛雅人哪个阶层的头骨被后天压成扁形', 0, '', '', '&lt;p&gt;A:所有阶层&lt;/p&gt;&lt;p&gt;B:奴隶&lt;/p&gt;&lt;p&gt;C:贵族&lt;/p&gt;&lt;p&gt;D:平民&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1340, 1, '不属于我国食品史上的四大发明的一项是', 0, '', '', '&lt;p&gt;A:豆酱&lt;/p&gt;&lt;p&gt;B:豆腐&lt;/p&gt;&lt;p&gt;C:豆浆&lt;/p&gt;&lt;p&gt;D:豆花&lt;/p&gt;&lt;p&gt;E:豆芽&lt;/p&gt;', 5, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1339, 1, '日本三大棋战中，属于《朝日新闻》的围棋战事是哪一个？', 0, '', '', '&lt;p&gt;A:棋圣战&lt;/p&gt;&lt;p&gt;B:名人战&lt;/p&gt;&lt;p&gt;C:本因坊战&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1338, 2, '1915年，信用卡起源于美国。请问以下哪些机构是最早发行信用卡的？（多选）', 0, '', '', '&lt;p&gt;A:百货商店&lt;/p&gt;&lt;p&gt;B:银行&lt;/p&gt;&lt;p&gt;C:饮食业&lt;/p&gt;&lt;p&gt;D:娱乐业&lt;/p&gt;&lt;p&gt;E:汽油公司&lt;/p&gt;&lt;p&gt;F:信贷公司&lt;/p&gt;', 6, 'ACD', 'ACD', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1337, 1, '谁是中国第一位注册会计师？', 0, '', '', '&lt;p&gt;A:潘序伦&lt;/p&gt;&lt;p&gt;B:秦开&lt;/p&gt;&lt;p&gt;C:谢霖&lt;/p&gt;&lt;p&gt;D:张惠生（女）&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1336, 1, '大禹治水时大禹的家在', 0, '', '', '&lt;p&gt;A:重庆涂山&lt;/p&gt;&lt;p&gt;B:山西五台山&lt;/p&gt;&lt;p&gt;C:四川四姑娘山&lt;/p&gt;&lt;p&gt;D:山东泰山&lt;/p&gt;&lt;p&gt;E:安徽黄山&lt;/p&gt;', 5, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1335, 1, '成立于_________年的俄罗斯国家剧院的奠基人为尼·罗曼诺夫公爵，该团属于国家性质的机构，其创作原则是：慎重保护俄罗斯古典芭蕾舞学派的优秀传统，索与发展新的舞蹈形式。', 0, '', '', '&lt;p&gt;A:1877&lt;/p&gt;&lt;p&gt;B:1878&lt;/p&gt;&lt;p&gt;C:1879&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1334, 1, '中日甲午战争后，清政府与日本签定了下列哪一个丧权辱国的条约？', 0, '', '', '&lt;p&gt;A:《爱辉条约》&lt;/p&gt;&lt;p&gt;B:《天津条约》&lt;/p&gt;&lt;p&gt;C:《马关条约》&lt;/p&gt;&lt;p&gt;D:《南京条约》&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1333, 1, '下列那种人不是商朝请示上帝并传达上帝旨意的人的称呼：', 0, '', '', '&lt;p&gt;A:卜&lt;/p&gt;&lt;p&gt;B:士&lt;/p&gt;&lt;p&gt;C:祝&lt;/p&gt;&lt;p&gt;D:巫&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1332, 1, '中国历史上最早将礼和法结合起来，以“法治”充实“礼治”的思想家是：', 0, '', '', '&lt;p&gt;A:孔子&lt;/p&gt;&lt;p&gt;B:荀子&lt;/p&gt;&lt;p&gt;C:孟子&lt;/p&gt;&lt;p&gt;D:老子&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1331, 1, '首次将刑法铸在鼎上，公布成文法的是：', 0, '', '', '&lt;p&gt;A:邓析&lt;/p&gt;&lt;p&gt;B:孔子&lt;/p&gt;&lt;p&gt;C:子产&lt;/p&gt;&lt;p&gt;D:庄子&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1330, 1, '宗法等级制的核心内容是：', 0, '', '', '&lt;p&gt;A:男尊女卑&lt;/p&gt;&lt;p&gt;B:氏族通婚&lt;/p&gt;&lt;p&gt;C:嫡长继承制&lt;/p&gt;&lt;p&gt;D:分封制&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1329, 1, '夏、商的法律思想是：', 0, '', '', '&lt;p&gt;A:“天命”“天罚”&lt;/p&gt;&lt;p&gt;B:“以德配天”&lt;/p&gt;&lt;p&gt;C:“明德慎罚”&lt;/p&gt;&lt;p&gt;D:“仁义礼智信”&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1328, 1, '说起中国历史上的赔款，人们多数时候会想起丧权辱国，但是历史上有一笔赔款--&quot;庚子赔款&quot;却建立了一所知名学府，你知道是哪一所吗？', 0, '', '', '&lt;p&gt;A:复旦大学&lt;/p&gt;&lt;p&gt;B:南京大学&lt;/p&gt;&lt;p&gt;C:清华大学&lt;/p&gt;&lt;p&gt;D:北京大学&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1327, 1, '你知道&quot;希望工程&quot;诞生时间是_________年的10月30日吗？', 0, '', '', '&lt;p&gt;A:1988&lt;/p&gt;&lt;p&gt;B:1989&lt;/p&gt;&lt;p&gt;C:1990&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1326, 1, '清朝统治了多少年？', 0, '', '', '&lt;p&gt;A:２７０年&lt;/p&gt;&lt;p&gt;B:２６９年&lt;/p&gt;&lt;p&gt;C:２６８年&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1325, 1, '世界上最早使用地雷的是：', 0, '', '', '&lt;p&gt;A:宋代岳飞&lt;/p&gt;&lt;p&gt;B:唐代李世民&lt;/p&gt;&lt;p&gt;C:明代戚继光&lt;/p&gt;&lt;p&gt;D:清代林则徐&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1324, 1, '吕布骑的是什么马？', 0, '', '', '&lt;p&gt;A:地庐&lt;/p&gt;&lt;p&gt;B:赤兔&lt;/p&gt;&lt;p&gt;C:汉血宝马&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1323, 1, '尝百草的人是谁？', 0, '', '', '&lt;p&gt;A:华佗&lt;/p&gt;&lt;p&gt;B:扁鹊&lt;/p&gt;&lt;p&gt;C:李时珍&lt;/p&gt;&lt;p&gt;D:神农&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1322, 1, '最早使用&quot;铜&quot;的是哪个国家', 0, '', '', '&lt;p&gt;A:古巴比伦&lt;/p&gt;&lt;p&gt;B:古埃及&lt;/p&gt;&lt;p&gt;C:古印度&lt;/p&gt;&lt;p&gt;D:古中国&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1321, 3, '第一台内燃机的发明者是英国人。', 0, '', '', '&lt;p&gt;A:对&lt;/p&gt;&lt;p&gt;B:错&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1320, 3, '&quot;爱琴文明&quot;属于石器文明。', 0, '', '', '&lt;p&gt;A:对&lt;/p&gt;&lt;p&gt;B:错&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1318, 3, '始作俑者原指开始用陶佣殉葬的人。', 0, '', '', '&lt;p&gt;A:对&lt;/p&gt;&lt;p&gt;B:错&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1319, 3, '鲁班是鲁国人。', 0, '', '', '&lt;p&gt;A:对&lt;/p&gt;&lt;p&gt;B:错&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1317, 1, '关于14-16世纪文艺复兴的错误说法是', 0, '', '', '&lt;p&gt;A:欧洲资本主义萌芽和初步发展时期的艺术&lt;/p&gt;&lt;p&gt;B:起源并昌盛于法国，随后席卷全欧洲&lt;/p&gt;&lt;p&gt;C:通过复兴古希腊、罗马的民主思想来反对封建中世纪&lt;/p&gt;&lt;p&gt;D:倡导现实主义和人文精神&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1316, 1, '国际劳工组织于_________年6月正式宣告成立，中国是创始会员国。1946年成为联合国的一个专门机构，主管劳动劳工方面的事务。', 0, '', '', '&lt;p&gt;A:1909&lt;/p&gt;&lt;p&gt;B:1919&lt;/p&gt;&lt;p&gt;C:1929&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1315, 2, '西晋&quot;三张&quot;指的是（多选）', 0, '', '', '&lt;p&gt;A:张载&lt;/p&gt;&lt;p&gt;B:张协&lt;/p&gt;&lt;p&gt;C:张衡&lt;/p&gt;&lt;p&gt;D:张元&lt;/p&gt;', 4, 'AD', 'AD', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1314, 1, '&quot;和尚&quot;作为对僧侣的称谓，起源于哪朝', 0, '', '', '&lt;p&gt;A:唐朝&lt;/p&gt;&lt;p&gt;B:东汉&lt;/p&gt;&lt;p&gt;C:晋朝&lt;/p&gt;&lt;p&gt;D:战国&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1313, 1, '中国历史上第一支海军诞生于：', 0, '', '', '&lt;p&gt;A:福建省&lt;/p&gt;&lt;p&gt;B:山东省&lt;/p&gt;&lt;p&gt;C:广东省&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1312, 1, '举世震惊的“切尔诺贝利”核事故发生于：', 0, '', '', '&lt;p&gt;A:1986年&lt;/p&gt;&lt;p&gt;B:1996年&lt;/p&gt;&lt;p&gt;C:1990年&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1311, 1, '最早的打字机是为什么人设计的？', 0, '', '', '&lt;p&gt;A:聋人&lt;/p&gt;&lt;p&gt;B:盲人&lt;/p&gt;&lt;p&gt;C:商人&lt;/p&gt;&lt;p&gt;D:作家&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1309, 1, '最早的助听器的工作原理与下列哪项最相似？', 0, '', '', '&lt;p&gt;A:电话机&lt;/p&gt;&lt;p&gt;B:麦克风&lt;/p&gt;&lt;p&gt;C:对讲机&lt;/p&gt;&lt;p&gt;D:喇叭筒&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2);
INSERT INTO `x2_questions` (`questionid`, `questiontype`, `question`, `questionuserid`, `questionusername`, `questionlastmodifyuser`, `questionselect`, `questionselectnumber`, `questionanswer`, `questiondescribe`, `questionknowsid`, `questioncreatetime`, `questionstatus`, `questionhtml`, `questionparent`, `questionsequence`, `questionlevel`) VALUES
(1310, 1, '贝多芬在耳聋前本希望成为：', 0, '', '', '&lt;p&gt;A:歌唱家&lt;/p&gt;&lt;p&gt;B:指挥家&lt;/p&gt;&lt;p&gt;C:演奏家&lt;/p&gt;&lt;p&gt;D:作曲家&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1308, 1, '在明清科举考试中“大比”是指：', 0, '', '', '&lt;p&gt;A:乡试&lt;/p&gt;&lt;p&gt;B:院试&lt;/p&gt;&lt;p&gt;C:会试&lt;/p&gt;&lt;p&gt;D:殿试&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1307, 1, '水印是13世纪意大利人发明的，最早是用来：', 0, '', '', '&lt;p&gt;A:表示造纸厂的商标&lt;/p&gt;&lt;p&gt;B:防止伪造货币&lt;/p&gt;&lt;p&gt;C:体现贵族身份&lt;/p&gt;&lt;p&gt;D:表示纸张质量等级&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1306, 1, '在我国，白银用作货币最早出现在：', 0, '', '', '&lt;p&gt;A:春秋时期&lt;/p&gt;&lt;p&gt;B:唐朝&lt;/p&gt;&lt;p&gt;C:宋朝&lt;/p&gt;&lt;p&gt;D:明朝&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1305, 1, '1977年恢复高考后的第一次高考，是在哪个季节举行的？', 0, '', '', '&lt;p&gt;A:春&lt;/p&gt;&lt;p&gt;B:夏&lt;/p&gt;&lt;p&gt;C:秋&lt;/p&gt;&lt;p&gt;D:冬&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1304, 1, '西楚霸王项羽骑坐的战马叫：', 0, '', '', '&lt;p&gt;A:驷&lt;/p&gt;&lt;p&gt;B:骓&lt;/p&gt;&lt;p&gt;C:驹&lt;/p&gt;&lt;p&gt;D:骏&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1303, 1, '春卷在我国唐代以前就有，那时被称为：', 0, '', '', '&lt;p&gt;A:春条&lt;/p&gt;&lt;p&gt;B:春盘&lt;/p&gt;&lt;p&gt;C:春饼&lt;/p&gt;&lt;p&gt;D:春面&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1302, 1, '第一台机器人于1959年诞生，它被用于：', 0, '', '', '&lt;p&gt;A:工业&lt;/p&gt;&lt;p&gt;B:农业&lt;/p&gt;&lt;p&gt;C:军事&lt;/p&gt;&lt;p&gt;D:家庭&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1300, 1, '在长坂坡，单枪匹马独闯曹军重围的三国名将是：', 0, '', '', '&lt;p&gt;A:张飞&lt;/p&gt;&lt;p&gt;B:关羽&lt;/p&gt;&lt;p&gt;C:赵云&lt;/p&gt;&lt;p&gt;D:马超&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1301, 1, '火药是我国古人在什么情况下发明的？', 0, '', '', '&lt;p&gt;A:烹饪&lt;/p&gt;&lt;p&gt;B:炼丹&lt;/p&gt;&lt;p&gt;C:打仗&lt;/p&gt;&lt;p&gt;D:烧炭&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1299, 1, '“讳疾忌医”是讲古代一位国君有病却不听医生的劝告，最终病重而死。这位神医是：', 0, '', '', '&lt;p&gt;A:扁鹊&lt;/p&gt;&lt;p&gt;B:华佗&lt;/p&gt;&lt;p&gt;C:张仲景&lt;/p&gt;&lt;p&gt;D:李时珍&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1298, 1, '电控“红——绿”交通灯最早出现在：', 0, '', '', '&lt;p&gt;A:费城&lt;/p&gt;&lt;p&gt;B:底特律&lt;/p&gt;&lt;p&gt;C:盐湖城&lt;/p&gt;&lt;p&gt;D:芝加哥&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1297, 1, '2000年底，我国高速公路通车里程达到1.6万公里，跃居世界：', 0, '', '', '&lt;p&gt;A:第二位&lt;/p&gt;&lt;p&gt;B:第三位&lt;/p&gt;&lt;p&gt;C:第四位&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1296, 1, '我国第一套邮票“大龙票”共有几枚？', 0, '', '', '&lt;p&gt;A:一枚&lt;/p&gt;&lt;p&gt;B:二枚&lt;/p&gt;&lt;p&gt;C:三枚&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1294, 1, '2000年我国汽车生产量是多少？', 0, '', '', '&lt;p&gt;A:204.9万辆&lt;/p&gt;&lt;p&gt;B:205.9万辆&lt;/p&gt;&lt;p&gt;C:206.9万辆&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1295, 1, '据统计，2000年我国普通高等学校在校学生数为556万人，比上年增长：', 0, '', '', '&lt;p&gt;A:24.50%&lt;/p&gt;&lt;p&gt;B:31.50%&lt;/p&gt;&lt;p&gt;C:34.50%&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1293, 1, '2000年底，正式公布的《夏商周年表》，把我国历史纪年由公元前841年向前延伸了：', 0, '', '', '&lt;p&gt;A:400多年&lt;/p&gt;&lt;p&gt;B:800多年&lt;/p&gt;&lt;p&gt;C:1200多年&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1292, 1, '1990年9月22日至10月7日，在我国北京成功举办的是第几届亚运会？', 0, '', '', '&lt;p&gt;A:第十届&lt;/p&gt;&lt;p&gt;B:第十一届&lt;/p&gt;&lt;p&gt;C:第十二届&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1291, 1, '经有关部门统计，到2001年5月底，我国电话用户总数达到：', 0, '', '', '&lt;p&gt;A:1.7亿户&lt;/p&gt;&lt;p&gt;B:2.7亿户&lt;/p&gt;&lt;p&gt;C:3.7亿户&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1290, 1, '“中国共产党”这一名称最早出现在：', 0, '', '', '&lt;p&gt;A:宣言里&lt;/p&gt;&lt;p&gt;B:杂志上&lt;/p&gt;&lt;p&gt;C:书信中&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1289, 1, '我国发行粮油票证的最后一年是哪一年？', 0, '', '', '&lt;p&gt;A:1988年&lt;/p&gt;&lt;p&gt;B:1990年&lt;/p&gt;&lt;p&gt;C:1993年&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1288, 1, '所谓“走马灯”原指的是一种：', 0, '', '', '&lt;p&gt;A:骑马赶夜路的灯&lt;/p&gt;&lt;p&gt;B:供观赏的花灯&lt;/p&gt;&lt;p&gt;C:挂在马棚里以供夜间添草的灯&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1287, 1, '密码最早用于：', 0, '', '', '&lt;p&gt;A:交易&lt;/p&gt;&lt;p&gt;B:开锁&lt;/p&gt;&lt;p&gt;C:通信&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1286, 1, '人类最早发明的水上交通工具是：', 0, '', '', '&lt;p&gt;A:独木舟&lt;/p&gt;&lt;p&gt;B:木筏&lt;/p&gt;&lt;p&gt;C:竹排&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1285, 1, '口香糖最早起源于人们嚼食什么？', 0, '', '', '&lt;p&gt;A:树叶&lt;/p&gt;&lt;p&gt;B:树脂&lt;/p&gt;&lt;p&gt;C:树根&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1284, 1, '诸葛亮“挥泪斩马谡”，是因为马谡刚愎自用，失掉了：', 0, '', '', '&lt;p&gt;A:麦城&lt;/p&gt;&lt;p&gt;B:荆州&lt;/p&gt;&lt;p&gt;C:街亭&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1283, 1, '我国出版业中历史最悠久的出版机构是：', 0, '', '', '&lt;p&gt;A:中华书局&lt;/p&gt;&lt;p&gt;B:商务印书馆&lt;/p&gt;&lt;p&gt;C:新华书店&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1282, 1, '邮票的诞生最初是为了：', 0, '', '', '&lt;p&gt;A:支付邮费&lt;/p&gt;&lt;p&gt;B:加快邮递速度&lt;/p&gt;&lt;p&gt;C:避免邮品丢失&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1281, 1, '一星期为七天最早来自哪里？', 0, '', '', '&lt;p&gt;A:古埃及&lt;/p&gt;&lt;p&gt;B:古巴比伦&lt;/p&gt;&lt;p&gt;C:古罗马&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1280, 1, '由唐代诗人贾岛和韩愈斟酌诗句引申而来的词语是：', 0, '', '', '&lt;p&gt;A:切磋&lt;/p&gt;&lt;p&gt;B:推敲&lt;/p&gt;&lt;p&gt;C:琢磨&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1279, 1, '世界上最早的自行车是：', 0, '', '', '&lt;p&gt;A:前轮大&lt;/p&gt;&lt;p&gt;B:后轮大&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1278, 1, '我国自己设计和建造的第一座核电站是：', 0, '', '', '&lt;p&gt;A:大亚湾核电站&lt;/p&gt;&lt;p&gt;B:秦山核电站&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1277, 1, '解放前我国的人均寿命为40.8岁，2000年底，我国人均寿命达到了多少岁？', 0, '', '', '&lt;p&gt;A:68.8岁&lt;/p&gt;&lt;p&gt;B:71.8岁&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1276, 1, '1990年12月19日，新中国内地第一家证券交易所开业，它是：', 0, '', '', '&lt;p&gt;A:上海证券交易所&lt;/p&gt;&lt;p&gt;B:深圳证券交易所&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1275, 3, '新华书店是新中国成立后建立的吗？', 0, '', '', '&lt;p&gt;A:是&lt;/p&gt;&lt;p&gt;B:不是&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1274, 1, '中国作为最早使用纸币的国家，下面两种纸币中出现较早的是：', 0, '', '', '&lt;p&gt;A:宝钞&lt;/p&gt;&lt;p&gt;B:交子&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1273, 1, '“逐鹿中原”是指什么时代群雄纷争的史实？', 0, '', '', '&lt;p&gt;A:战国时代&lt;/p&gt;&lt;p&gt;B:秦末&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1272, 1, '仰韶文化时期，其建筑式样与现在的哪种建筑相类似？', 0, '', '', '&lt;p&gt;A:竹楼&lt;/p&gt;&lt;p&gt;B:窑洞&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1271, 1, '建国后，我国发行的第一枚生肖邮票的图案是哪种动物？', 0, '', '', '&lt;p&gt;A:鸡&lt;/p&gt;&lt;p&gt;B:猴&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1270, 1, '最早的“座右铭”写后是放在座位的哪一边？', 0, '', '', '&lt;p&gt;A:右边&lt;/p&gt;&lt;p&gt;B:左边&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1269, 1, '风衣起源于：', 0, '', '', '&lt;p&gt;A:军队的防风雨外衣&lt;/p&gt;&lt;p&gt;B:滑雪斗篷&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1268, 1, '现在我国实行九年义务教育，那么义务教育起源于：', 0, '', '', '&lt;p&gt;A:中国&lt;/p&gt;&lt;p&gt;B:美国&lt;/p&gt;&lt;p&gt;C:英国&lt;/p&gt;&lt;p&gt;D:法国&lt;/p&gt;&lt;p&gt;E:德国&lt;/p&gt;', 5, 'E', 'E', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1267, 1, '史记所载鸿门宴是谁摆下的？', 0, '', '', '&lt;p&gt;A:项羽&lt;/p&gt;&lt;p&gt;B:刘邦&lt;/p&gt;&lt;p&gt;C:楚怀王&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1266, 2, '明代科举制度考试等级包括：（多选）', 0, '', '', '&lt;p&gt;A:乡试&lt;/p&gt;&lt;p&gt;B:县试&lt;/p&gt;&lt;p&gt;C:会试&lt;/p&gt;&lt;p&gt;D:省试&lt;/p&gt;&lt;p&gt;E:殿试&lt;/p&gt;&lt;p&gt;F:御试&lt;/p&gt;', 6, 'ACE', 'ACE', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1265, 1, '用“正”字计票起源于：', 0, '', '', '&lt;p&gt;A:公园&lt;/p&gt;&lt;p&gt;B:戏院&lt;/p&gt;&lt;p&gt;C:澡堂&lt;/p&gt;&lt;p&gt;D:理发馆&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1264, 1, '古代所说的“促织”是指现在的：', 0, '', '', '&lt;p&gt;A:蝉&lt;/p&gt;&lt;p&gt;B:蝗虫&lt;/p&gt;&lt;p&gt;C:螳螂&lt;/p&gt;&lt;p&gt;D:蟋蟀&lt;/p&gt;&lt;p&gt;E:蝈蝈&lt;/p&gt;', 5, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1263, 1, '创立科举制度是在：', 0, '', '', '&lt;p&gt;A:南朝&lt;/p&gt;&lt;p&gt;B:隋朝&lt;/p&gt;&lt;p&gt;C:唐朝&lt;/p&gt;&lt;p&gt;D:宋朝&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1262, 1, '清代的官服饰品中常有“顶戴花翎”一说，是官位的象征标志， “花翎”是取自什么动物的毛？', 0, '', '', '&lt;p&gt;A:火鸡&lt;/p&gt;&lt;p&gt;B:锦鸡&lt;/p&gt;&lt;p&gt;C:孔雀&lt;/p&gt;&lt;p&gt;D:燕子&lt;/p&gt;&lt;p&gt;E:野鸡&lt;/p&gt;', 5, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1261, 1, '从古至今，北京有几次被定为都城？', 0, '', '', '&lt;p&gt;A:4次&lt;/p&gt;&lt;p&gt;B:8次&lt;/p&gt;&lt;p&gt;C:10次&lt;/p&gt;&lt;p&gt;D:11次&lt;/p&gt;&lt;p&gt;E:12次&lt;/p&gt;', 5, 'E', 'E', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1260, 1, '是谁邀请关羽“单刀赴会”的？', 0, '', '', '&lt;p&gt;A:鲁肃&lt;/p&gt;&lt;p&gt;B:诸葛亮&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1259, 1, '以下哪一项不是商鞅变法的内容？', 0, '', '', '&lt;p&gt;A:废井田&lt;/p&gt;&lt;p&gt;B:奖励耕战&lt;/p&gt;&lt;p&gt;C:建立县制&lt;/p&gt;&lt;p&gt;D:减轻刑罚&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1258, 2, '下面哪四种属于我国古代计时单位？（多选）', 0, '', '', '&lt;p&gt;A:时&lt;/p&gt;&lt;p&gt;B:刻&lt;/p&gt;&lt;p&gt;C:分&lt;/p&gt;&lt;p&gt;D:秒&lt;/p&gt;&lt;p&gt;E:更&lt;/p&gt;&lt;p&gt;F:鼓&lt;/p&gt;', 6, 'AEF', 'AEF', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1257, 2, '历史上的“两河文明”中的”两河“指的是哪两条河流？（多选）', 0, '', '', '&lt;p&gt;A:尼罗河&lt;/p&gt;&lt;p&gt;B:恒河&lt;/p&gt;&lt;p&gt;C:长江&lt;/p&gt;&lt;p&gt;D:亚马逊河&lt;/p&gt;&lt;p&gt;E:底格里斯河&lt;/p&gt;&lt;p&gt;F:幼发拉底河&lt;/p&gt;', 6, 'EF', 'EF', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1256, 2, '解放战争进入夺取全国胜利的判定性阶段，党中央先后组织的三大战役是：（多选）', 0, '', '', '&lt;p&gt;A:辽沈战役&lt;/p&gt;&lt;p&gt;B:淮海战役&lt;/p&gt;&lt;p&gt;C:平津战役&lt;/p&gt;&lt;p&gt;D:渡江战役&lt;/p&gt;', 4, 'AC', 'AC', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1255, 1, '李渊建唐是在什么时候？', 0, '', '', '&lt;p&gt;A:611年&lt;/p&gt;&lt;p&gt;B:618年&lt;/p&gt;&lt;p&gt;C:622年&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1254, 2, '初唐四杰是：（多选）', 0, '', '', '&lt;p&gt;A:李白&lt;/p&gt;&lt;p&gt;B:王勃&lt;/p&gt;&lt;p&gt;C:卢照邻&lt;/p&gt;&lt;p&gt;D:杜甫&lt;/p&gt;&lt;p&gt;E:骆宾王&lt;/p&gt;&lt;p&gt;F:杨炯&lt;/p&gt;', 6, 'BCE', 'BCE', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1253, 1, '我国从什么时候起就有了历法？', 0, '', '', '&lt;p&gt;A:汉&lt;/p&gt;&lt;p&gt;B:商&lt;/p&gt;&lt;p&gt;C:周&lt;/p&gt;&lt;p&gt;D:夏&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1252, 1, '春秋战国时期，法家的代表人是', 0, '', '', '&lt;p&gt;A:庄子&lt;/p&gt;&lt;p&gt;B:韩非子&lt;/p&gt;&lt;p&gt;C:墨子&lt;/p&gt;&lt;p&gt;D:蒙子&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1251, 1, '吴三桂在缅甸将哪位皇帝绞死?', 0, '', '', '&lt;p&gt;A:永历帝&lt;/p&gt;&lt;p&gt;B:永嘉帝&lt;/p&gt;&lt;p&gt;C:崇祯帝&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1250, 1, '成吉思汗写给花剌子模的战书一共有几个字？', 0, '', '', '&lt;p&gt;A:4&lt;/p&gt;&lt;p&gt;B:6&lt;/p&gt;&lt;p&gt;C:12&lt;/p&gt;&lt;p&gt;D:24&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1249, 1, '项羽在哪里自杀？', 0, '', '', '&lt;p&gt;A:闽江&lt;/p&gt;&lt;p&gt;B:漓江&lt;/p&gt;&lt;p&gt;C:乌江&lt;/p&gt;&lt;p&gt;D:长江&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1248, 1, '被唐太宗李世民比作镜子的是谁？', 0, '', '', '&lt;p&gt;A:魏征&lt;/p&gt;&lt;p&gt;B:李靖&lt;/p&gt;&lt;p&gt;C:徐茂公&lt;/p&gt;&lt;p&gt;D:刘文静&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1247, 1, '英国占领加拿大之后将当地的法国人怎样了？', 0, '', '', '&lt;p&gt;A:全部杀死&lt;/p&gt;&lt;p&gt;B:驱逐出境&lt;/p&gt;&lt;p&gt;C:把他们赶到遥远的加拿大西部&lt;/p&gt;&lt;p&gt;D:什么也没做&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1245, 1, '第一次西方工业革命的发祥地是', 0, '', '', '&lt;p&gt;A:英国&lt;/p&gt;&lt;p&gt;B:美国&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1246, 1, '第一颗人造卫星发射成功是什么时候？', 0, '', '', '&lt;p&gt;A:1937年&lt;/p&gt;&lt;p&gt;B:1947年&lt;/p&gt;&lt;p&gt;C:1957年&lt;/p&gt;&lt;p&gt;D:1967年&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1244, 1, '中国的私学即民办教育开始于', 0, '', '', '&lt;p&gt;A:夏代&lt;/p&gt;&lt;p&gt;B:商代&lt;/p&gt;&lt;p&gt;C:战国&lt;/p&gt;&lt;p&gt;D:春秋&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1243, 1, '柏林墙是东西方冷战的象征，建于1961年，柏林墙并非牢不可破，曾经有人乘坐热气球从墙上飘过，还有人以14辆载重卡车同时撞倒墙体得以逃脱，在柏林墙修建后的28年里，先后有多少人逃跑成功？', 0, '', '', '&lt;p&gt;A:187866&lt;/p&gt;&lt;p&gt;B:187868&lt;/p&gt;&lt;p&gt;C:178868&lt;/p&gt;&lt;p&gt;D:178866&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1242, 1, '最早发现无理数的数学家是谁？', 0, '', '', '&lt;p&gt;A:希伯斯&lt;/p&gt;&lt;p&gt;B:高斯&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1241, 1, '中国史上被称为“诗界之哥伦布”“一代霸才”的爱国诗人是：', 0, '', '', '&lt;p&gt;A:林则徐&lt;/p&gt;&lt;p&gt;B:文天祥&lt;/p&gt;&lt;p&gt;C:黄遵宪&lt;/p&gt;&lt;p&gt;D:岳飞&lt;/p&gt;&lt;p&gt;E:魏源&lt;/p&gt;', 5, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1239, 1, '到卫国战争打响前,苏联有几位元帅', 0, '', '', '&lt;p&gt;A:5&lt;/p&gt;&lt;p&gt;B:4&lt;/p&gt;&lt;p&gt;C:3&lt;/p&gt;&lt;p&gt;D:2&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1240, 1, '曹植是曹操的', 0, '', '', '&lt;p&gt;A:第一子&lt;/p&gt;&lt;p&gt;B:第三子&lt;/p&gt;&lt;p&gt;C:第二子&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1238, 1, '杨威利在伊谢梅伦攻防战中损失如何?', 0, '', '', '&lt;p&gt;A:10%&lt;/p&gt;&lt;p&gt;B:5%&lt;/p&gt;&lt;p&gt;C:0%&lt;/p&gt;&lt;p&gt;D:20%&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1237, 1, '杨威利因哪一战而被成为奇迹杨,魔术杨?', 0, '', '', '&lt;p&gt;A:伊谢梅伦&lt;/p&gt;&lt;p&gt;B:巴米利恩&lt;/p&gt;&lt;p&gt;C:奇霍萨姆&lt;/p&gt;&lt;p&gt;D:迪亚马特&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1236, 1, '春秋战国时期的四大死士不包括哪一个', 0, '', '', '&lt;p&gt;A:欲让&lt;/p&gt;&lt;p&gt;B:要离&lt;/p&gt;&lt;p&gt;C:荆坷&lt;/p&gt;&lt;p&gt;D:盗拓&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1235, 3, '中国最早的文字是甲骨文吗？', 0, '', '', '&lt;p&gt;A:是&lt;/p&gt;&lt;p&gt;B:不是&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1234, 1, '在战国之前“百姓”是对什么人的总称？', 0, '', '', '&lt;p&gt;A:奴隶&lt;/p&gt;&lt;p&gt;B:平民&lt;/p&gt;&lt;p&gt;C:贵族&lt;/p&gt;&lt;p&gt;D:士兵&lt;/p&gt;&lt;p&gt;E:乐师&lt;/p&gt;', 5, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1233, 1, '世界上第一个出现在电视荧屏上的形象是：', 0, '', '', '&lt;p&gt;A:一只猫&lt;/p&gt;&lt;p&gt;B:一个挂钟&lt;/p&gt;&lt;p&gt;C:一个木偶头&lt;/p&gt;&lt;p&gt;D:一位年轻的小伙子&lt;/p&gt;&lt;p&gt;E:一张地图&lt;/p&gt;', 5, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1232, 1, '最早的阿拉伯数字有几个？', 0, '', '', '&lt;p&gt;A:6个&lt;/p&gt;&lt;p&gt;B:7个&lt;/p&gt;&lt;p&gt;C:8个&lt;/p&gt;&lt;p&gt;D:9个&lt;/p&gt;&lt;p&gt;E:10个&lt;/p&gt;', 5, 'E', 'E', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1231, 1, '超市最早诞生在：', 0, '', '', '&lt;p&gt;A:车库里&lt;/p&gt;&lt;p&gt;B:仓库里&lt;/p&gt;&lt;p&gt;C:广场上&lt;/p&gt;&lt;p&gt;D:码头上&lt;/p&gt;&lt;p&gt;E:行李房&lt;/p&gt;', 5, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1230, 1, '勺在中国古代是舀什么的器具？', 0, '', '', '&lt;p&gt;A:米饭&lt;/p&gt;&lt;p&gt;B:粥&lt;/p&gt;&lt;p&gt;C:酒&lt;/p&gt;&lt;p&gt;D:水&lt;/p&gt;&lt;p&gt;E:药&lt;/p&gt;', 5, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1229, 1, '世界上第一枚邮票是1840年5月6日在英国正式发行的“黑便士”，它是因何得名的？', 0, '', '', '&lt;p&gt;A:用黑色油墨印刷&lt;/p&gt;&lt;p&gt;B:是在垃圾桶里发现的&lt;/p&gt;&lt;p&gt;C:为与通用的便士区别&lt;/p&gt;&lt;p&gt;D:设计者名字中有“黑”字&lt;/p&gt;&lt;p&gt;E:该邮票是在夜晚印刷的&lt;/p&gt;', 5, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1228, 1, '在我国古代有位名医活到101岁，被称为“百岁神医”，他是：', 0, '', '', '&lt;p&gt;A:扁鹊&lt;/p&gt;&lt;p&gt;B:华佗&lt;/p&gt;&lt;p&gt;C:孙思邈&lt;/p&gt;&lt;p&gt;D:李时珍&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1227, 1, '1991年10月16日，哪位科学家被授予“国家杰出贡献科学家”的荣誉称号？', 0, '', '', '&lt;p&gt;A:钱学森&lt;/p&gt;&lt;p&gt;B:钱三强&lt;/p&gt;&lt;p&gt;C:袁隆平&lt;/p&gt;&lt;p&gt;D:吴文俊&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1226, 1, '参加中国共产党“一大”会议的13个人，当时他们的平均年龄是：', 0, '', '', '&lt;p&gt;A:26岁&lt;/p&gt;&lt;p&gt;B:28岁&lt;/p&gt;&lt;p&gt;C:30岁&lt;/p&gt;&lt;p&gt;D:32岁&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1225, 1, '我国古代军事家孙膑是在受“膑刑”后被称为孙膑的，“膑”是指：', 0, '', '', '&lt;p&gt;A:股骨&lt;/p&gt;&lt;p&gt;B:胫骨&lt;/p&gt;&lt;p&gt;C:脚踝骨&lt;/p&gt;&lt;p&gt;D:膝盖骨&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1224, 1, '大月氏王国在5世纪后半叶亡于?', 0, '', '', '&lt;p&gt;A:柔然&lt;/p&gt;&lt;p&gt;B:鲜卑&lt;/p&gt;&lt;p&gt;C:厳哒&lt;/p&gt;&lt;p&gt;D:匈奴&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1223, 1, '击败拿破仑的滑铁卢战役的反法联军指挥官是?', 0, '', '', '&lt;p&gt;A:彼德大帝&lt;/p&gt;&lt;p&gt;B:贝当元帅&lt;/p&gt;&lt;p&gt;C:威灵顿将军&lt;/p&gt;&lt;p&gt;D:维多利亚女王&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1222, 1, '古代上对下、有道对无道的军事行动称作？', 0, '', '', '&lt;p&gt;A:征&lt;/p&gt;&lt;p&gt;B:伐&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1221, 1, '我国最早提出创建监狱的人是?', 0, '', '', '&lt;p&gt;A:皋陶&lt;/p&gt;&lt;p&gt;B:董仲舒&lt;/p&gt;&lt;p&gt;C:李斯&lt;/p&gt;&lt;p&gt;D:秦始皇&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1220, 1, '巨鹿之战中,项羽大败秦军,用的是什么战略?', 0, '', '', '&lt;p&gt;A:暗渡陈仓&lt;/p&gt;&lt;p&gt;B:以逸待劳&lt;/p&gt;&lt;p&gt;C:避实击虚&lt;/p&gt;&lt;p&gt;D:破釜沉舟&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1219, 1, '传说中武则天下令焚烧的花是什么花', 0, '', '', '&lt;p&gt;A:月季化&lt;/p&gt;&lt;p&gt;B:芍药花&lt;/p&gt;&lt;p&gt;C:牡丹花&lt;/p&gt;&lt;p&gt;D:水仙花&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1218, 1, '圆周率最早出现于', 0, '', '', '&lt;p&gt;A:巴比伦&lt;/p&gt;&lt;p&gt;B:埃及&lt;/p&gt;&lt;p&gt;C:印度&lt;/p&gt;&lt;p&gt;D:阿拉伯&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1217, 1, '中国第一颗原子弹是在哪一年研制成功的？', 0, '', '', '&lt;p&gt;A:1962&lt;/p&gt;&lt;p&gt;B:1963&lt;/p&gt;&lt;p&gt;C:1964&lt;/p&gt;&lt;p&gt;D:1965&lt;/p&gt;&lt;p&gt;E:1966&lt;/p&gt;', 5, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1216, 1, '慈禧垂帘听政的地点是', 0, '', '', '&lt;p&gt;A:坤宁宫&lt;/p&gt;&lt;p&gt;B:养心殿&lt;/p&gt;&lt;p&gt;C:太和殿&lt;/p&gt;&lt;p&gt;D:储秀宫&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1215, 1, '雍正皇帝的陵墓是', 0, '', '', '&lt;p&gt;A:景陵&lt;/p&gt;&lt;p&gt;B:泰陵&lt;/p&gt;&lt;p&gt;C:裕陵&lt;/p&gt;&lt;p&gt;D:福陵&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1214, 1, '宋徽宗名叫', 0, '', '', '&lt;p&gt;A:赵佶&lt;/p&gt;&lt;p&gt;B:赵构&lt;/p&gt;&lt;p&gt;C:赵括&lt;/p&gt;&lt;p&gt;D:赵高&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1213, 1, '建筑行业中的鲁班奖是于哪一年创建的', 0, '', '', '&lt;p&gt;A:1986&lt;/p&gt;&lt;p&gt;B:1987&lt;/p&gt;&lt;p&gt;C:1988&lt;/p&gt;&lt;p&gt;D:1989&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1212, 1, '以下哪位是古代希腊有名的医学家', 0, '', '', '&lt;p&gt;A:希波达玛斯&lt;/p&gt;&lt;p&gt;B:苏格拉底&lt;/p&gt;&lt;p&gt;C:希波克拉底&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1211, 1, '台湾是哪个皇帝收复的？', 0, '', '', '&lt;p&gt;A:康熙&lt;/p&gt;&lt;p&gt;B:秦始皇&lt;/p&gt;&lt;p&gt;C:唐太宗&lt;/p&gt;&lt;p&gt;D:乾隆&lt;/p&gt;&lt;p&gt;E:雍正&lt;/p&gt;', 5, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1210, 1, '唐太宗曾以何物博得杨贵妃一笑', 0, '', '', '&lt;p&gt;A:住院&lt;/p&gt;&lt;p&gt;B:法拉利&lt;/p&gt;&lt;p&gt;C:宠物&lt;/p&gt;&lt;p&gt;D:水果&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1209, 1, '我国历史上记载的第一个王朝是', 0, '', '', '&lt;p&gt;A:夏&lt;/p&gt;&lt;p&gt;B:商&lt;/p&gt;&lt;p&gt;C:周&lt;/p&gt;&lt;p&gt;D:三国&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1208, 1, '远古时代的恐龙属于', 0, '', '', '&lt;p&gt;A:两栖动物&lt;/p&gt;&lt;p&gt;B:爬行动物&lt;/p&gt;&lt;p&gt;C:哺乳动物&lt;/p&gt;&lt;p&gt;D:节肢动物&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1206, 1, '东汉的医聖是谁？', 0, '', '', '&lt;p&gt;A:張機&lt;/p&gt;&lt;p&gt;B:華佗&lt;/p&gt;&lt;p&gt;C:蔡倫&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1207, 1, '佛历是从什么时候开始算起的？', 0, '', '', '&lt;p&gt;A:佛祖诞生&lt;/p&gt;&lt;p&gt;B:佛祖逝世&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1205, 1, '“垂帘听政”始于何时？', 0, '', '', '&lt;p&gt;A:宋朝&lt;/p&gt;&lt;p&gt;B:元朝&lt;/p&gt;&lt;p&gt;C:唐朝&lt;/p&gt;&lt;p&gt;D:清朝&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1204, 1, '世界上最早的银行始建于哪个国家？', 0, '', '', '&lt;p&gt;A:意大利&lt;/p&gt;&lt;p&gt;B:美国&lt;/p&gt;&lt;p&gt;C:法国&lt;/p&gt;&lt;p&gt;D:瑞士&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1202, 1, '秦孝公用誰變法', 0, '', '', '&lt;p&gt;A:商鞅&lt;/p&gt;&lt;p&gt;B:李白&lt;/p&gt;&lt;p&gt;C:杜甫&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1203, 1, '在位时间最短的皇帝是东汉的刘贺，他只当了多久的皇帝就被废除了？', 0, '', '', '&lt;p&gt;A:25天&lt;/p&gt;&lt;p&gt;B:26天&lt;/p&gt;&lt;p&gt;C:27天&lt;/p&gt;&lt;p&gt;D:28天&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1201, 1, '宋朝有哪位變法？', 0, '', '', '&lt;p&gt;A:張居正&lt;/p&gt;&lt;p&gt;B:司馬遷&lt;/p&gt;&lt;p&gt;C:王安石&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1200, 1, '中國用最久的歷法是：', 0, '', '', '&lt;p&gt;A:時憲歷&lt;/p&gt;&lt;p&gt;B:授時歷&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1199, 1, '十岁以下的小娃娃就当了皇帝的，在中国历史上共有几个？', 0, '', '', '&lt;p&gt;A:19位&lt;/p&gt;&lt;p&gt;B:22位&lt;/p&gt;&lt;p&gt;C:25位&lt;/p&gt;&lt;p&gt;D:29位&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1198, 1, '下列官名中那个不是唐朝的官名？', 0, '', '', '&lt;p&gt;A:尚书&lt;/p&gt;&lt;p&gt;B:黄门&lt;/p&gt;&lt;p&gt;C:中书&lt;/p&gt;&lt;p&gt;D:巡按&lt;/p&gt;&lt;p&gt;E:殿中&lt;/p&gt;&lt;p&gt;F:御史&lt;/p&gt;', 6, 'E', 'E', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1197, 1, '从古至今北京有几次被定为都城？', 0, '', '', '&lt;p&gt;A:8次&lt;/p&gt;&lt;p&gt;B:11次&lt;/p&gt;&lt;p&gt;C:12次&lt;/p&gt;&lt;p&gt;D:14次&lt;/p&gt;&lt;p&gt;E:15次&lt;/p&gt;', 5, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1196, 2, '明代宦官控制的机构有哪些?（多选）', 0, '', '', '&lt;p&gt;A:錦衣衛&lt;/p&gt;&lt;p&gt;B:大廠&lt;/p&gt;&lt;p&gt;C:西廠&lt;/p&gt;&lt;p&gt;D:東廠&lt;/p&gt;', 4, 'ACD', 'ACD', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1195, 1, '中國焚書坑儒的是谁的结果？', 0, '', '', '&lt;p&gt;A:秦始皇&lt;/p&gt;&lt;p&gt;B:李斯&lt;/p&gt;&lt;p&gt;C:漢武帝&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1194, 1, '铁达尼号游轮是哪一年沉没的？', 0, '', '', '&lt;p&gt;A:1910&lt;/p&gt;&lt;p&gt;B:1911&lt;/p&gt;&lt;p&gt;C:1912&lt;/p&gt;&lt;p&gt;D:1913&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1193, 1, '我国的“鞠躬”礼起源于：', 0, '', '', '&lt;p&gt;A:祭天的仪式&lt;/p&gt;&lt;p&gt;B:降者伏地叩首&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1192, 1, '我国师范教育开端于：', 0, '', '', '&lt;p&gt;A:京师大学堂师范馆&lt;/p&gt;&lt;p&gt;B:上海南洋公学师范院&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1190, 1, '古埃及人在猫的木乃伊旁边放上：', 0, '', '', '&lt;p&gt;A:珠宝&lt;/p&gt;&lt;p&gt;B:鱼干&lt;/p&gt;&lt;p&gt;C:老鼠的木乃伊&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1191, 1, '鞭炮和爆竹哪一个历史比较悠久？', 0, '', '', '&lt;p&gt;A:鞭炮&lt;/p&gt;&lt;p&gt;B:爆竹&lt;/p&gt;&lt;p&gt;C:礼炮&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1189, 1, '国际奥委会评估团对北京进行了为期几天的考察？', 0, '', '', '&lt;p&gt;A:4天&lt;/p&gt;&lt;p&gt;B:3天&lt;/p&gt;&lt;p&gt;C:5天&lt;/p&gt;&lt;p&gt;D:2天&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1187, 1, '首次世界举重比赛举行的地点是：', 0, '', '', '&lt;p&gt;A:体育馆&lt;/p&gt;&lt;p&gt;B:音乐厅&lt;/p&gt;&lt;p&gt;C:商场&lt;/p&gt;&lt;p&gt;D:咖啡馆&lt;/p&gt;&lt;p&gt;E:广场&lt;/p&gt;', 5, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1188, 1, '古代政府设立“义仓”是做什么用的？', 0, '', '', '&lt;p&gt;A:救助孤寡&lt;/p&gt;&lt;p&gt;B:收集捐献场所&lt;/p&gt;&lt;p&gt;C:赈灾&lt;/p&gt;&lt;p&gt;D:救助病人&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1186, 1, '古代绘画、丝织陈列室为什么控制光线？', 0, '', '', '&lt;p&gt;A:以示珍贵&lt;/p&gt;&lt;p&gt;B:防止复制&lt;/p&gt;&lt;p&gt;C:减少紫外线侵害&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1185, 1, '最早的血压计用于测量谁的血压？', 0, '', '', '&lt;p&gt;A:牛&lt;/p&gt;&lt;p&gt;B:狗&lt;/p&gt;&lt;p&gt;C:马&lt;/p&gt;&lt;p&gt;D:骆驼&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1184, 1, '世界上最早制作葡萄酒的国家是：', 0, '', '', '&lt;p&gt;A:法国&lt;/p&gt;&lt;p&gt;B:意大利&lt;/p&gt;&lt;p&gt;C:埃及&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1183, 1, '以下不是文艺复兴时期画家的是', 0, '', '', '&lt;p&gt;A:乔托&lt;/p&gt;&lt;p&gt;B:波提切利&lt;/p&gt;&lt;p&gt;C:丢勒&lt;/p&gt;&lt;p&gt;D:列宾&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1182, 2, '被称做“意大利文艺复兴三杰”的是（多选）', 0, '', '', '&lt;p&gt;A:达·芬奇&lt;/p&gt;&lt;p&gt;B:波提切利&lt;/p&gt;&lt;p&gt;C:拉菲尔&lt;/p&gt;&lt;p&gt;D:提香&lt;/p&gt;&lt;p&gt;E:米开朗基罗&lt;/p&gt;', 5, 'ACE', 'ACE', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1181, 1, '南京大屠杀提醒国人勿忘国耻，这是一个永远的民族历史的烙印，即使与日本建立邦交，也不能轻易忘却这段屈辱。请记住，南京大屠杀发生在：', 0, '', '', '&lt;p&gt;A:1931年&lt;/p&gt;&lt;p&gt;B:1933年&lt;/p&gt;&lt;p&gt;C:1935年&lt;/p&gt;&lt;p&gt;D:1937年&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1180, 1, '大革命失败后，哪次起义为毛泽东亲自领导？', 0, '', '', '&lt;p&gt;A:广州起义&lt;/p&gt;&lt;p&gt;B:南京起义&lt;/p&gt;&lt;p&gt;C:秋收起义&lt;/p&gt;&lt;p&gt;D:武昌起义&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1179, 1, '我国关于哈雷慧星的记录最早在哪个时代？', 0, '', '', '&lt;p&gt;A:殷商时代&lt;/p&gt;&lt;p&gt;B:春秋时代&lt;/p&gt;&lt;p&gt;C:战国时代&lt;/p&gt;&lt;p&gt;D:汉代&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1178, 1, '华佗是我国东汉时的名医，请问他是：', 0, '', '', '&lt;p&gt;A:内科医生&lt;/p&gt;&lt;p&gt;B:外科医生&lt;/p&gt;&lt;p&gt;C:手术医生&lt;/p&gt;&lt;p&gt;D:专门治疗各种常见病，不分科的医生&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1177, 1, '唐朝时，文成公主为促进少数民族与中原的友好远嫁吐蕃；到了唐中宗时哪位公主又代表唐朝与吐蕃和亲？', 0, '', '', '&lt;p&gt;A:金城公主&lt;/p&gt;&lt;p&gt;B:和平公主&lt;/p&gt;&lt;p&gt;C:太平公主&lt;/p&gt;&lt;p&gt;D:大明公主&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1176, 1, '我国清朝的开国皇帝是：', 0, '', '', '&lt;p&gt;A:顺治&lt;/p&gt;&lt;p&gt;B:康熙&lt;/p&gt;&lt;p&gt;C:皇太极&lt;/p&gt;&lt;p&gt;D:努尔哈赤&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1175, 1, '第二次世界大战中，意大利法西斯头目是：', 0, '', '', '&lt;p&gt;A:希特勒&lt;/p&gt;&lt;p&gt;B:丘吉尔&lt;/p&gt;&lt;p&gt;C:杜鲁门&lt;/p&gt;&lt;p&gt;D:墨索里尼&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1174, 1, '我们从封建社会发展到今天的现代化社会，总共经历了3次划时代的工业革命，请问这3次工业革命的主要内容依次是：', 0, '', '', '&lt;p&gt;A:蒸汽机发明、飞机，汽车等问世、电脑问世&lt;/p&gt;&lt;p&gt;B:机器取代手工生产、电器化、电脑和信息产业化&lt;/p&gt;&lt;p&gt;C:电力广泛应用、用机器制造机器、计算机网络问世&lt;/p&gt;&lt;p&gt;D:工厂代替手工生产、出现近代交通工具、电脑&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1173, 1, '“内阁”作为国家的最高决策机关和行政权力机关创立于', 0, '', '', '&lt;p&gt;A:东汉&lt;/p&gt;&lt;p&gt;B:宋朝&lt;/p&gt;&lt;p&gt;C:明朝&lt;/p&gt;&lt;p&gt;D:清朝&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1172, 2, '在古爬行动物中有哪些动物残存至今？（多选）', 0, '', '', '&lt;p&gt;A:虎&lt;/p&gt;&lt;p&gt;B:鳄鱼&lt;/p&gt;&lt;p&gt;C:龟&lt;/p&gt;&lt;p&gt;D:大象&lt;/p&gt;&lt;p&gt;E:蜥蜴&lt;/p&gt;&lt;p&gt;F:蛇&lt;/p&gt;', 6, 'BCE', 'BCE', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1170, 3, '翼龙是恐龙么？', 0, '', '', '&lt;p&gt;A:是&lt;/p&gt;&lt;p&gt;B:不是&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1171, 1, '新生代距今有多少年？', 0, '', '', '&lt;p&gt;A:1000万年&lt;/p&gt;&lt;p&gt;B:2000万年&lt;/p&gt;&lt;p&gt;C:3000万年&lt;/p&gt;&lt;p&gt;D:4000万年&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1169, 2, '下面哪些是海洋中的恐龙？（多选）', 0, '', '', '&lt;p&gt;A:鱼龙&lt;/p&gt;&lt;p&gt;B:管鼻龙&lt;/p&gt;&lt;p&gt;C:蛇颈龙&lt;/p&gt;&lt;p&gt;D:海鳄龙&lt;/p&gt;&lt;p&gt;E:鸭嘴龙&lt;/p&gt;', 5, 'ACD', 'ACD', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1168, 1, '恐龙世界的短跑冠军是什么龙？', 0, '', '', '&lt;p&gt;A:肿头龙&lt;/p&gt;&lt;p&gt;B:慈母龙&lt;/p&gt;&lt;p&gt;C:鸵鸟龙&lt;/p&gt;&lt;p&gt;D:剑龙&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1167, 2, '下面有哪些是食肉恐龙？（多选）', 0, '', '', '&lt;p&gt;A:霸王龙&lt;/p&gt;&lt;p&gt;B:跃龙&lt;/p&gt;&lt;p&gt;C:梁龙&lt;/p&gt;&lt;p&gt;D:亚伯达龙&lt;/p&gt;&lt;p&gt;E:鳄龙&lt;/p&gt;&lt;p&gt;F:甲龙&lt;/p&gt;', 6, 'ADE', 'ADE', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1166, 2, '下面哪些是食草恐龙？（多选）', 0, '', '', '&lt;p&gt;A:甲龙&lt;/p&gt;&lt;p&gt;B:梁龙&lt;/p&gt;&lt;p&gt;C:鄂龙&lt;/p&gt;&lt;p&gt;D:腕龙&lt;/p&gt;&lt;p&gt;E:跃龙&lt;/p&gt;&lt;p&gt;F:鸭嘴龙&lt;/p&gt;', 6, 'ADF', 'ADF', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1165, 1, '考古学家至今发现了多少种恐龙？', 0, '', '', '&lt;p&gt;A:100多种&lt;/p&gt;&lt;p&gt;B:200多种&lt;/p&gt;&lt;p&gt;C:300多种&lt;/p&gt;&lt;p&gt;D:400多种&lt;/p&gt;&lt;p&gt;E:500多种&lt;/p&gt;&lt;p&gt;F:600多种&lt;/p&gt;', 6, 'E', 'E', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1164, 1, '已知的最重的恐龙是什么？', 0, '', '', '&lt;p&gt;A:剑龙&lt;/p&gt;&lt;p&gt;B:腔体龙&lt;/p&gt;&lt;p&gt;C:地震龙&lt;/p&gt;&lt;p&gt;D:腕龙&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1163, 1, '已知的最大恐龙是什么？', 0, '', '', '&lt;p&gt;A:剑龙&lt;/p&gt;&lt;p&gt;B:腔体龙&lt;/p&gt;&lt;p&gt;C:地震龙&lt;/p&gt;&lt;p&gt;D:腕龙&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1162, 1, '最古老的恐龙是什么？', 0, '', '', '&lt;p&gt;A:剑龙&lt;/p&gt;&lt;p&gt;B:腔体龙&lt;/p&gt;&lt;p&gt;C:地震龙&lt;/p&gt;&lt;p&gt;D:棘皮龙&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1161, 1, '下面所列生物发展进程的顺序那一个是正确的？', 0, '', '', '&lt;p&gt;A:太古代、元古代、古生代、新生代、中生代&lt;/p&gt;&lt;p&gt;B:太古代、元古代、中生代、古生代、新生代&lt;/p&gt;&lt;p&gt;C:太古代、中生代、元古代、古生代、新生代&lt;/p&gt;&lt;p&gt;D:太古代、元古代、古生代、中生代、新生代&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1160, 1, '最早的生命诞生于下面哪个地方？', 0, '', '', '&lt;p&gt;A:原始森林&lt;/p&gt;&lt;p&gt;B:原始草原&lt;/p&gt;&lt;p&gt;C:原始海洋&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1159, 3, '古代丝绸中，罗、缎、绮指的是同一种丝织物吗？', 0, '', '', '&lt;p&gt;A:是&lt;/p&gt;&lt;p&gt;B:不是&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1158, 1, '周口店猿人制造的石器是：', 0, '', '', '&lt;p&gt;A:打制的&lt;/p&gt;&lt;p&gt;B:磨制的&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1157, 1, '被称为“世界第八奇观”的是：', 0, '', '', '&lt;p&gt;A:长城&lt;/p&gt;&lt;p&gt;B:圆明园&lt;/p&gt;&lt;p&gt;C:秦始皇兵马俑坑&lt;/p&gt;&lt;p&gt;D:泰山日出&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1156, 1, '2000年11月底人们在什么地方发现了曾经被认为已经“绝种”的开普狮子?', 0, '', '', '&lt;p&gt;A:西伯利亚&lt;/p&gt;&lt;p&gt;B:南非&lt;/p&gt;&lt;p&gt;C:巴西&lt;/p&gt;&lt;p&gt;D:扎伊尔&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1155, 1, '&quot;甲骨文&quot;发现于：', 0, '', '', '&lt;p&gt;A:明末&lt;/p&gt;&lt;p&gt;B:清末&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1154, 1, '二战时期，为德国海军提出了&quot;群狼战术&quot;的海军元帅是：', 0, '', '', '&lt;p&gt;A:邓尼茨&lt;/p&gt;&lt;p&gt;B:海因里希&lt;/p&gt;&lt;p&gt;C:罗姆&lt;/p&gt;&lt;p&gt;D:格林&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1153, 1, '请问苏联是在什么时候解体的？', 0, '', '', '&lt;p&gt;A:1990.10&lt;/p&gt;&lt;p&gt;B:1990.11&lt;/p&gt;&lt;p&gt;C:1991.12&lt;/p&gt;&lt;p&gt;D:1992.10&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1152, 1, '战国时郭隗对燕昭王说“请自隗始”，是指他开始干什么呢？', 0, '', '', '&lt;p&gt;A:清查财产&lt;/p&gt;&lt;p&gt;B:聘请任用&lt;/p&gt;&lt;p&gt;C:晋升高官&lt;/p&gt;&lt;p&gt;D:严明军纪&lt;/p&gt;&lt;p&gt;E:撤职查办&lt;/p&gt;', 5, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1151, 1, '古代的死刑在什么季节行刑？', 0, '', '', '&lt;p&gt;A:春季&lt;/p&gt;&lt;p&gt;B:秋季&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1150, 3, '秦朝的阿房宫遗址在西安市郊，对吗？', 0, '', '', '&lt;p&gt;A:对&lt;/p&gt;&lt;p&gt;B:不对&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1149, 1, '古代游牧民族生活存在太阳崇拜吗？', 0, '', '', '&lt;p&gt;A:存在&lt;/p&gt;&lt;p&gt;B:不存在&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1148, 1, '1955年的亚非会议是在哪里召开的？', 0, '', '', '&lt;p&gt;A:印尼&lt;/p&gt;&lt;p&gt;B:新加坡&lt;/p&gt;&lt;p&gt;C:巴基斯坦&lt;/p&gt;&lt;p&gt;D:埃及&lt;/p&gt;&lt;p&gt;E:也门&lt;/p&gt;', 5, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1147, 1, '有人说，现在找不到恐龙了，因为恐龙早在多少年前就灭绝了？', 0, '', '', '&lt;p&gt;A:6500万年&lt;/p&gt;&lt;p&gt;B:55万年&lt;/p&gt;&lt;p&gt;C:10亿年前&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1146, 1, '西伯侯姬昌即周文王是在何地遇见的姜子牙？', 0, '', '', '&lt;p&gt;A:淮河边&lt;/p&gt;&lt;p&gt;B:长江边&lt;/p&gt;&lt;p&gt;C:泾水河边&lt;/p&gt;&lt;p&gt;D:渭水河边&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1145, 1, '人类祖先出现于地质年代的：', 0, '', '', '&lt;p&gt;A:第四纪&lt;/p&gt;&lt;p&gt;B:白垩纪&lt;/p&gt;&lt;p&gt;C:三叠纪&lt;/p&gt;&lt;p&gt;D:石炭纪&lt;/p&gt;&lt;p&gt;E:奥陶纪&lt;/p&gt;', 5, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1144, 1, '明清两代科举考试的最高级别“殿试”的第一名叫状元,第二名叫：', 0, '', '', '&lt;p&gt;A:解元&lt;/p&gt;&lt;p&gt;B:会元&lt;/p&gt;&lt;p&gt;C:榜眼&lt;/p&gt;&lt;p&gt;D:探花&lt;/p&gt;&lt;p&gt;E:贡士&lt;/p&gt;', 5, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1143, 1, '蛋筒冰淇淋最初出现的场合是：', 0, '', '', '&lt;p&gt;A:生日聚会&lt;/p&gt;&lt;p&gt;B:博览会&lt;/p&gt;&lt;p&gt;C:节日庆典活动&lt;/p&gt;&lt;p&gt;D:电影院&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1141, 1, '最早将国际法介绍到中国来的是：', 0, '', '', '&lt;p&gt;A:丁韪良&lt;/p&gt;&lt;p&gt;B:蒲安臣&lt;/p&gt;&lt;p&gt;C:林则徐&lt;/p&gt;&lt;p&gt;D:惠顿&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1142, 1, '在古代，“爵”是一种什么器皿？', 0, '', '', '&lt;p&gt;A:食器&lt;/p&gt;&lt;p&gt;B:酒器&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1140, 3, '西欧中世纪的骑士教育中是否重视文化知识教育？', 0, '', '', '&lt;p&gt;A:是&lt;/p&gt;&lt;p&gt;B:否&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1139, 1, '古时的“燕乐”最初是在什么场合中演奏的？', 0, '', '', '&lt;p&gt;A:射猎&lt;/p&gt;&lt;p&gt;B:祭祀祖先&lt;/p&gt;&lt;p&gt;C:饮酒吃饭&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1138, 1, '哺乳类出现于地质年代的：', 0, '', '', '&lt;p&gt;A:志留纪&lt;/p&gt;&lt;p&gt;B:三叠纪&lt;/p&gt;&lt;p&gt;C:奥陶纪&lt;/p&gt;&lt;p&gt;D:寒武纪&lt;/p&gt;&lt;p&gt;E:白垩纪&lt;/p&gt;', 5, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1136, 1, '“素质教育”一词的最早出现大约在：', 0, '', '', '&lt;p&gt;A:1987年&lt;/p&gt;&lt;p&gt;B:1990年&lt;/p&gt;&lt;p&gt;C:1993年&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1137, 1, '第一套奥林匹克邮票是哪个国家发行的?', 0, '', '', '&lt;p&gt;A:希腊&lt;/p&gt;&lt;p&gt;B:美国&lt;/p&gt;&lt;p&gt;C:西班牙&lt;/p&gt;&lt;p&gt;D:土耳其&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1135, 1, '在亚洲反法西斯战争中，盟军中牺牲的最高级别将领是：', 0, '', '', '&lt;p&gt;A:何应钦&lt;/p&gt;&lt;p&gt;B:叶挺&lt;/p&gt;&lt;p&gt;C:巴顿&lt;/p&gt;&lt;p&gt;D:张自忠&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1134, 1, '阿姆斯特朗是乘哪个飞船成功登月的？', 0, '', '', '&lt;p&gt;A:阿波罗8号&lt;/p&gt;&lt;p&gt;B:阿波罗9号&lt;/p&gt;&lt;p&gt;C:阿波罗11号&lt;/p&gt;&lt;p&gt;D:阿波罗13号&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1133, 1, '下列哪一项不是1993年电子部提出的三金工程？', 0, '', '', '&lt;p&gt;A:金桥工程&lt;/p&gt;&lt;p&gt;B:金路工程&lt;/p&gt;&lt;p&gt;C:金关工程&lt;/p&gt;&lt;p&gt;D:金卡工程&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1132, 1, '中国共产党的创始人李大钊是被什么人杀害的？', 0, '', '', '&lt;p&gt;A:列强&lt;/p&gt;&lt;p&gt;B:军阀&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1131, 1, '是哪国人最先制作出了牛奶巧克力？', 0, '', '', '&lt;p&gt;A:英国&lt;/p&gt;&lt;p&gt;B:西班牙&lt;/p&gt;&lt;p&gt;C:意大利&lt;/p&gt;&lt;p&gt;D:瑞士&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1130, 1, '谁第一次把中国话剧带进美国白宫？', 0, '', '', '&lt;p&gt;A:阮玲玉&lt;/p&gt;&lt;p&gt;B:胡蝶&lt;/p&gt;&lt;p&gt;C:王莹&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1129, 1, '1980年2月发行了生肖邮票“猴票”。1992年发行的生肖邮票是：', 0, '', '', '&lt;p&gt;A:羊票&lt;/p&gt;&lt;p&gt;B:猴票&lt;/p&gt;&lt;p&gt;C:鸡票&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1128, 1, '中国第一座电影院是：', 0, '', '', '&lt;p&gt;A:北京大华电影院&lt;/p&gt;&lt;p&gt;B:上海虹口电影院&lt;/p&gt;&lt;p&gt;C:北京广和电影院&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1127, 1, '铁路和火车哪一个较早出现？', 0, '', '', '&lt;p&gt;A:火车&lt;/p&gt;&lt;p&gt;B:铁路&lt;/p&gt;&lt;p&gt;C:一块出现&lt;/p&gt;&lt;p&gt;D:先有火车后有铁路&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1126, 1, '1800年以前，西方医生认为手术成功的标志是：', 0, '', '', '&lt;p&gt;A:患者疼痛&lt;/p&gt;&lt;p&gt;B:伤口愈合&lt;/p&gt;&lt;p&gt;C:解除疼痛&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1125, 1, '到21世纪中叶，中国人口总量在达到峰值后将缓慢下降，这一峰值是：', 0, '', '', '&lt;p&gt;A:14亿&lt;/p&gt;&lt;p&gt;B:15亿&lt;/p&gt;&lt;p&gt;C:16亿&lt;/p&gt;&lt;p&gt;D:17亿&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1124, 1, '最初使用的海洋捕捞工具是：', 0, '', '', '&lt;p&gt;A:渔钩&lt;/p&gt;&lt;p&gt;B:渔叉&lt;/p&gt;&lt;p&gt;C:渔网&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1123, 1, '最早系统地确定官职的是在：', 0, '', '', '&lt;p&gt;A:商朝&lt;/p&gt;&lt;p&gt;B:西周初期&lt;/p&gt;&lt;p&gt;C:春秋&lt;/p&gt;&lt;p&gt;D:汉朝初期&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1121, 1, '古东方奴隶制法是建立在甚么土地所有制基础上的?', 0, '', '', '&lt;p&gt;A:国有&lt;/p&gt;&lt;p&gt;B:私有&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1122, 1, '最早的校园歌曲出现在：', 0, '', '', '&lt;p&gt;A:中国&lt;/p&gt;&lt;p&gt;B:英国&lt;/p&gt;&lt;p&gt;C:美国&lt;/p&gt;&lt;p&gt;D:日本&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1120, 1, '侏罗纪属于地质年代中的哪一代？', 0, '', '', '&lt;p&gt;A:中生代&lt;/p&gt;&lt;p&gt;B:新生代&lt;/p&gt;&lt;p&gt;C:古生代&lt;/p&gt;&lt;p&gt;D:元古代&lt;/p&gt;&lt;p&gt;E:太古代&lt;/p&gt;', 5, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1119, 1, '中国古代名医华佗为谁所杀？', 0, '', '', '&lt;p&gt;A:董卓&lt;/p&gt;&lt;p&gt;B:曹操&lt;/p&gt;&lt;p&gt;C:司马思&lt;/p&gt;&lt;p&gt;D:吕布&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1118, 1, '西周法官在审讯中采用的方式为：', 0, '', '', '&lt;p&gt;A:五刑&lt;/p&gt;&lt;p&gt;B:五听&lt;/p&gt;&lt;p&gt;C:五行&lt;/p&gt;&lt;p&gt;D:九刑&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1117, 1, '人类最古老的绘画形式是：', 0, '', '', '&lt;p&gt;A:版画&lt;/p&gt;&lt;p&gt;B:壁画&lt;/p&gt;&lt;p&gt;C:彩陶&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1116, 1, '破除满汉不通婚这个祖训的是：', 0, '', '', '&lt;p&gt;A:康熙&lt;/p&gt;&lt;p&gt;B:雍正&lt;/p&gt;&lt;p&gt;C:乾隆&lt;/p&gt;&lt;p&gt;D:道光&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1115, 1, '公元６１８－９０７年，是我国古代的哪个朝代？', 0, '', '', '&lt;p&gt;A:唐&lt;/p&gt;&lt;p&gt;B:隋&lt;/p&gt;&lt;p&gt;C:元&lt;/p&gt;&lt;p&gt;D:清&lt;/p&gt;&lt;p&gt;E:东汉&lt;/p&gt;', 5, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1114, 1, '“老三届”指的是那几年毕业的初、高中毕业生？', 0, '', '', '&lt;p&gt;A:1964--1966&lt;/p&gt;&lt;p&gt;B:1966--1968&lt;/p&gt;&lt;p&gt;C:1969--1971&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2);
INSERT INTO `x2_questions` (`questionid`, `questiontype`, `question`, `questionuserid`, `questionusername`, `questionlastmodifyuser`, `questionselect`, `questionselectnumber`, `questionanswer`, `questiondescribe`, `questionknowsid`, `questioncreatetime`, `questionstatus`, `questionhtml`, `questionparent`, `questionsequence`, `questionlevel`) VALUES
(1113, 1, '清朝编写的中国历史上规模最大的《四库全书》先后誊缮了几部？', 0, '', '', '&lt;p&gt;A:5&lt;/p&gt;&lt;p&gt;B:6&lt;/p&gt;&lt;p&gt;C:7&lt;/p&gt;&lt;p&gt;D:8&lt;/p&gt;&lt;p&gt;E:9&lt;/p&gt;', 5, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1112, 1, '最早的印玺，是盖在什么上面的？', 0, '', '', '&lt;p&gt;A:木版&lt;/p&gt;&lt;p&gt;B:印泥&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1111, 1, '自元朝以后，年代愈近建筑斗拱愈：', 0, '', '', '&lt;p&gt;A:细而密&lt;/p&gt;&lt;p&gt;B:粗而疏&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1110, 1, '世界上第一个无产阶级政党是：', 0, '', '', '&lt;p&gt;A:巴黎公社&lt;/p&gt;&lt;p&gt;B:俄国社会&lt;/p&gt;&lt;p&gt;C:德国社会民主工党&lt;/p&gt;&lt;p&gt;D:英国工党&lt;/p&gt;&lt;p&gt;E:匈牙利小农党&lt;/p&gt;', 5, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1109, 1, '故宫是世界上最大的宫殿，共有几个朝代把它作为皇宫？', 0, '', '', '&lt;p&gt;A:一个&lt;/p&gt;&lt;p&gt;B:两个&lt;/p&gt;&lt;p&gt;C:三个&lt;/p&gt;&lt;p&gt;D:四个&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1108, 1, '帮助商鞅在秦国人民中树立威信的是：', 0, '', '', '&lt;p&gt;A:一根木杆&lt;/p&gt;&lt;p&gt;B:一柄宝剑&lt;/p&gt;&lt;p&gt;C:一幅画&lt;/p&gt;&lt;p&gt;D:一个马头&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1107, 1, '1907年11月22日，出现在大西洋上的“毛里塔尼亚”号是世界上第一艘现代化的：', 0, '', '', '&lt;p&gt;A:客轮&lt;/p&gt;&lt;p&gt;B:油轮&lt;/p&gt;&lt;p&gt;C:货轮&lt;/p&gt;&lt;p&gt;D:战舰&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1106, 1, '我国人口论思想是谁首先提出的？', 0, '', '', '&lt;p&gt;A:王安石&lt;/p&gt;&lt;p&gt;B:韩非&lt;/p&gt;&lt;p&gt;C:李斯&lt;/p&gt;&lt;p&gt;D:孔子&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1105, 1, '下列人物的历史功绩与郑成功最相似的是：', 0, '', '', '&lt;p&gt;A:岳飞&lt;/p&gt;&lt;p&gt;B:郑和&lt;/p&gt;&lt;p&gt;C:文天祥&lt;/p&gt;&lt;p&gt;D:戚继光&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1104, 1, '在远古时代金属铜的出现是：', 0, '', '', '&lt;p&gt;A:在烧烤兽肉的过程中&lt;/p&gt;&lt;p&gt;B:在烧制陶器的过程中&lt;/p&gt;&lt;p&gt;C:在雷电引起的大火中&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1103, 1, '人类有史以来第一次登月是在哪年？', 0, '', '', '&lt;p&gt;A:1965年&lt;/p&gt;&lt;p&gt;B:1966年&lt;/p&gt;&lt;p&gt;C:1969年&lt;/p&gt;&lt;p&gt;D:1972年&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1102, 1, '我国古代哪位政治家为自己立了块供后人评说的无字碑', 0, '', '', '&lt;p&gt;A:唐太宗&lt;/p&gt;&lt;p&gt;B:武则天&lt;/p&gt;&lt;p&gt;C:汉高祖&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1101, 1, '中国古代海军诞生于：', 0, '', '', '&lt;p&gt;A:春秋末期&lt;/p&gt;&lt;p&gt;B:唐朝&lt;/p&gt;&lt;p&gt;C:隋朝&lt;/p&gt;&lt;p&gt;D:明朝&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1100, 1, '以下哪一个阶级，不属于法国大革命前的第三等级？', 0, '', '', '&lt;p&gt;A:农民&lt;/p&gt;&lt;p&gt;B:下级教士&lt;/p&gt;&lt;p&gt;C:资产阶级&lt;/p&gt;&lt;p&gt;D:手工业者&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1099, 1, '“会计”业务最早出现于：', 0, '', '', '&lt;p&gt;A:古代埃及&lt;/p&gt;&lt;p&gt;B:古代巴比伦&lt;/p&gt;&lt;p&gt;C:古代印度&lt;/p&gt;&lt;p&gt;D:古代中国&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1098, 1, '“虎门销烟”的时间是：', 0, '', '', '&lt;p&gt;A:1839年6月&lt;/p&gt;&lt;p&gt;B:1840年6月&lt;/p&gt;&lt;p&gt;C:1841年1月&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1096, 1, '竹简与木牍在古代被用作记载文字的材料，其中记载较长的文字，一般用：', 0, '', '', '&lt;p&gt;A:竹简&lt;/p&gt;&lt;p&gt;B:木牍&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1097, 1, '属于元古代的植物化石的是：', 0, '', '', '&lt;p&gt;A:海绵&lt;/p&gt;&lt;p&gt;B:三叶虫&lt;/p&gt;&lt;p&gt;C:蕨类&lt;/p&gt;&lt;p&gt;D:藻类&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1095, 1, '古时称送考生入京师应会试的官车为“公车”，它是什么朝代的惯例？', 0, '', '', '&lt;p&gt;A:隋朝&lt;/p&gt;&lt;p&gt;B:汉朝&lt;/p&gt;&lt;p&gt;C:唐朝&lt;/p&gt;&lt;p&gt;D:宋朝&lt;/p&gt;&lt;p&gt;E:明朝&lt;/p&gt;', 5, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1093, 1, '下令“破釜沉舟”的我国古代将领是：', 0, '', '', '&lt;p&gt;A:项庄&lt;/p&gt;&lt;p&gt;B:项羽&lt;/p&gt;&lt;p&gt;C:刘邦&lt;/p&gt;&lt;p&gt;D:张良&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1094, 1, '古代欧洲文明发源于：', 0, '', '', '&lt;p&gt;A:爱琴文明&lt;/p&gt;&lt;p&gt;B:两河流域文明&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1092, 1, '我国的陶器出现在：', 0, '', '', '&lt;p&gt;A:旧石器时代&lt;/p&gt;&lt;p&gt;B:新石器时代&lt;/p&gt;&lt;p&gt;C:青铜器时代&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1091, 1, '“击鼓喊冤”最早产生于：', 0, '', '', '&lt;p&gt;A:汉朝&lt;/p&gt;&lt;p&gt;B:魏&lt;/p&gt;&lt;p&gt;C:隋朝&lt;/p&gt;&lt;p&gt;D:宋朝&lt;/p&gt;&lt;p&gt;E:明朝&lt;/p&gt;', 5, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1090, 1, '秦分天下为三十六郡。今天的江苏属于', 0, '', '', '&lt;p&gt;A:长沙郡&lt;/p&gt;&lt;p&gt;B:泗水郡&lt;/p&gt;&lt;p&gt;C:会稽郡&lt;/p&gt;&lt;p&gt;D:涿郡&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1089, 1, '祖冲之的《缀术》在什么时候被定为学校的课本？', 0, '', '', '&lt;p&gt;A:汉朝&lt;/p&gt;&lt;p&gt;B:南朝&lt;/p&gt;&lt;p&gt;C:隋朝&lt;/p&gt;&lt;p&gt;D:唐朝&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1087, 1, '太平天国中的西王是谁?', 0, '', '', '&lt;p&gt;A:石达开&lt;/p&gt;&lt;p&gt;B:韦昌辉&lt;/p&gt;&lt;p&gt;C:冯云山&lt;/p&gt;&lt;p&gt;D:萧朝贵&lt;/p&gt;&lt;p&gt;E:杨秀清&lt;/p&gt;&lt;p&gt;F:洪宣娇&lt;/p&gt;', 6, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1088, 3, '在11月7日纪念俄国10月25日发生的“十月革命”，这样的差异与历法有关吗？', 0, '', '', '&lt;p&gt;A:有&lt;/p&gt;&lt;p&gt;B:没有&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1086, 1, '世界上最早的自动销售机销售的是：', 0, '', '', '&lt;p&gt;A:饮料&lt;/p&gt;&lt;p&gt;B:烟草&lt;/p&gt;&lt;p&gt;C:糖果&lt;/p&gt;&lt;p&gt;D:面包&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1085, 1, '我国古代第一次正式发布成文法典是：', 0, '', '', '&lt;p&gt;A:子产铸刑鼎&lt;/p&gt;&lt;p&gt;B:邓析作竹刑&lt;/p&gt;&lt;p&gt;C:《常法》&lt;/p&gt;&lt;p&gt;D:刑书&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1084, 1, '我国诗歌创作最多的朝代是：', 0, '', '', '&lt;p&gt;A:唐代&lt;/p&gt;&lt;p&gt;B:宋代&lt;/p&gt;&lt;p&gt;C:明代&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1083, 1, '明代以后廷试的前三名依次是：', 0, '', '', '&lt;p&gt;A:榜眼 状元 探花&lt;/p&gt;&lt;p&gt;B:状元 探花 榜眼&lt;/p&gt;&lt;p&gt;C:状元 榜眼 探花&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1082, 1, '我国的科举制度始于那个朝代？', 0, '', '', '&lt;p&gt;A:东汉&lt;/p&gt;&lt;p&gt;B:魏晋&lt;/p&gt;&lt;p&gt;C:隋朝&lt;/p&gt;&lt;p&gt;D:唐朝&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1081, 1, '世界上第一张圣诞卡出现在：', 0, '', '', '&lt;p&gt;A:英国&lt;/p&gt;&lt;p&gt;B:美国&lt;/p&gt;&lt;p&gt;C:德国&lt;/p&gt;&lt;p&gt;D:意大利&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1080, 1, '王昭君没有得到汉元帝的召见而远嫁匈奴单于，是因为：', 0, '', '', '&lt;p&gt;A:王妃对她的陷害&lt;/p&gt;&lt;p&gt;B:画师歪曲她的形象&lt;/p&gt;&lt;p&gt;C:大臣说她的坏话&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1078, 1, '我国在何时将农历正月初一正式定名为春节？', 0, '', '', '&lt;p&gt;A:夏朝&lt;/p&gt;&lt;p&gt;B:辛亥革命后&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1079, 1, '中国的尼姑最早是何时出现的？', 0, '', '', '&lt;p&gt;A:夏朝&lt;/p&gt;&lt;p&gt;B:唐朝&lt;/p&gt;&lt;p&gt;C:南北朝&lt;/p&gt;&lt;p&gt;D:金朝&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1077, 1, '最先发现石油的国家是哪个？', 0, '', '', '&lt;p&gt;A:伊朗&lt;/p&gt;&lt;p&gt;B:伊拉克&lt;/p&gt;&lt;p&gt;C:沙特阿拉伯&lt;/p&gt;&lt;p&gt;D:俄罗斯&lt;/p&gt;&lt;p&gt;E:中国&lt;/p&gt;', 5, 'E', 'E', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1076, 1, '鸿门宴上范增是用什么示意项羽下决心的？', 0, '', '', '&lt;p&gt;A:玉玦&lt;/p&gt;&lt;p&gt;B:玉环&lt;/p&gt;&lt;p&gt;C:玉戒&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1075, 1, '新四军是哪一地区抗日的主力？', 0, '', '', '&lt;p&gt;A:华北&lt;/p&gt;&lt;p&gt;B:华东&lt;/p&gt;&lt;p&gt;C:华南&lt;/p&gt;&lt;p&gt;D:华中&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1073, 1, '三叶虫灭绝于地质年代中的：', 0, '', '', '&lt;p&gt;A:元古代&lt;/p&gt;&lt;p&gt;B:太古代&lt;/p&gt;&lt;p&gt;C:二叠纪&lt;/p&gt;&lt;p&gt;D:寒武纪&lt;/p&gt;&lt;p&gt;E:石炭纪&lt;/p&gt;', 5, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1074, 1, '五四运动的导火线，是巴黎和会讨论中国青岛的：', 0, '', '', '&lt;p&gt;A:瓜分问题&lt;/p&gt;&lt;p&gt;B:归属问题&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1072, 3, '我国古代有人口统计机构吗？', 0, '', '', '&lt;p&gt;A:有&lt;/p&gt;&lt;p&gt;B:没有&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1071, 1, '&quot;皇帝”作为国家元首的正式称号，始于：', 0, '', '', '&lt;p&gt;A:帝尧&lt;/p&gt;&lt;p&gt;B:朱元璋&lt;/p&gt;&lt;p&gt;C:汉武帝&lt;/p&gt;&lt;p&gt;D:秦始皇&lt;/p&gt;&lt;p&gt;E:商纣王&lt;/p&gt;', 5, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1070, 1, '明,清两代科举考试中最高级别的考试是：', 0, '', '', '&lt;p&gt;A:院试&lt;/p&gt;&lt;p&gt;B:殿试&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1069, 1, '中国古代曾有多次的焚书事件，下列帝王焚书最多的是：', 0, '', '', '&lt;p&gt;A:秦始皇&lt;/p&gt;&lt;p&gt;B:汉武帝&lt;/p&gt;&lt;p&gt;C:忽必烈&lt;/p&gt;&lt;p&gt;D:朱元璋&lt;/p&gt;&lt;p&gt;E:乾隆&lt;/p&gt;', 5, 'E', 'E', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1068, 1, '世界上第一颗商用通信卫星是：', 0, '', '', '&lt;p&gt;A:“东方红号”&lt;/p&gt;&lt;p&gt;B:“晨鸟号”&lt;/p&gt;&lt;p&gt;C:“西可尔号”&lt;/p&gt;&lt;p&gt;D:“泰罗斯号”&lt;/p&gt;&lt;p&gt;E:“实践一号”&lt;/p&gt;&lt;p&gt;F:“闪电-1”&lt;/p&gt;', 6, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1067, 1, '甲骨文是写在哪上面的？', 0, '', '', '&lt;p&gt;A:兽皮&lt;/p&gt;&lt;p&gt;B:象牙&lt;/p&gt;&lt;p&gt;C:龟骨&lt;/p&gt;&lt;p&gt;D:恐龙骨&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1066, 1, '戊戌变法运动期间，维新派创办的第一份报纸是：', 0, '', '', '&lt;p&gt;A:中外纪闻&lt;/p&gt;&lt;p&gt;B:时务报&lt;/p&gt;&lt;p&gt;C:强学报&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1065, 1, '历史上著名的“澶渊之盟”发生在哪两朝之间？', 0, '', '', '&lt;p&gt;A:楚、汉&lt;/p&gt;&lt;p&gt;B:北宋、辽&lt;/p&gt;&lt;p&gt;C:金、宋&lt;/p&gt;&lt;p&gt;D:元、明&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1064, 1, '“经济法”这个概念，最早哪国人提出的？', 0, '', '', '&lt;p&gt;A:法国&lt;/p&gt;&lt;p&gt;B:德国&lt;/p&gt;&lt;p&gt;C:英国&lt;/p&gt;&lt;p&gt;D:西班牙&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1063, 1, '中国警察最新的警服是从何时开始更换的？', 0, '', '', '&lt;p&gt;A:2000年7月1日&lt;/p&gt;&lt;p&gt;B:2000年10月1日&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1062, 1, '3月23日，在太空工作时间最长的空间站“和平号”坠毁，它是在哪年发射升空的？', 0, '', '', '&lt;p&gt;A:1984&lt;/p&gt;&lt;p&gt;B:1985&lt;/p&gt;&lt;p&gt;C:1986&lt;/p&gt;&lt;p&gt;D:1987&lt;/p&gt;&lt;p&gt;E:1988&lt;/p&gt;', 5, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1061, 1, '在唐代长安城经常可以见到的“新罗人”是现今我们所说的：', 0, '', '', '&lt;p&gt;A:朝鲜人&lt;/p&gt;&lt;p&gt;B:越南人&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1060, 1, '&quot;建元”是我国哪一个皇帝使用的年号？', 0, '', '', '&lt;p&gt;A:明成祖&lt;/p&gt;&lt;p&gt;B:晋武帝&lt;/p&gt;&lt;p&gt;C:汉武帝&lt;/p&gt;&lt;p&gt;D:唐太宗&lt;/p&gt;&lt;p&gt;E:宋高宗&lt;/p&gt;', 5, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1059, 2, '北京的故宫是哪些朝代的皇宫？（多选）', 0, '', '', '&lt;p&gt;A:宋朝&lt;/p&gt;&lt;p&gt;B:元朝&lt;/p&gt;&lt;p&gt;C:明朝&lt;/p&gt;&lt;p&gt;D:清朝&lt;/p&gt;&lt;p&gt;E:唐朝&lt;/p&gt;&lt;p&gt;F:隋朝&lt;/p&gt;', 6, 'BCD', 'BCD', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1058, 1, '80年发行的人民币二角背面的图案是：', 0, '', '', '&lt;p&gt;A:国旗&lt;/p&gt;&lt;p&gt;B:国徽&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1057, 1, '诸葛亮的办公地点，武侯祠在什么地方？', 0, '', '', '&lt;p&gt;A:河南南阳&lt;/p&gt;&lt;p&gt;B:四川成都&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1056, 1, '原始人类在造独木舟时除了用石器砍，还用了哪些办法？', 0, '', '', '&lt;p&gt;A:水泡&lt;/p&gt;&lt;p&gt;B:火烧&lt;/p&gt;&lt;p&gt;C:烟熏&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1055, 1, '我国最早的私立学校产生于：', 0, '', '', '&lt;p&gt;A:春秋时期&lt;/p&gt;&lt;p&gt;B:战国时期&lt;/p&gt;&lt;p&gt;C:汉代&lt;/p&gt;&lt;p&gt;D:唐代&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1054, 1, '唐朝将协议离婚称为：', 0, '', '', '&lt;p&gt;A:离&lt;/p&gt;&lt;p&gt;B:和离&lt;/p&gt;&lt;p&gt;C:出妻&lt;/p&gt;&lt;p&gt;D:休弃&lt;/p&gt;&lt;p&gt;E:义绝&lt;/p&gt;', 5, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1053, 1, '拿破仑统治时期，法国的主要对手是：', 0, '', '', '&lt;p&gt;A:西班牙&lt;/p&gt;&lt;p&gt;B:葡萄牙&lt;/p&gt;&lt;p&gt;C:荷兰&lt;/p&gt;&lt;p&gt;D:英国&lt;/p&gt;&lt;p&gt;E:意大利&lt;/p&gt;', 5, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1052, 1, '从何时开始，我国有了民办报纸？', 0, '', '', '&lt;p&gt;A:唐朝&lt;/p&gt;&lt;p&gt;B:宋朝&lt;/p&gt;&lt;p&gt;C:元朝&lt;/p&gt;&lt;p&gt;D:明朝&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1051, 1, '1999年12月15日，美国正式把巴拿马运河归还给巴拿马政府。此前，美国还在该地设立了一个个什么基地？', 0, '', '', '&lt;p&gt;A:商品基地&lt;/p&gt;&lt;p&gt;B:军事基地&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1050, 1, '新石器时代属于石器时代的哪个时期？', 0, '', '', '&lt;p&gt;A:早期&lt;/p&gt;&lt;p&gt;B:中期&lt;/p&gt;&lt;p&gt;C:晚期&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1048, 1, '南北朝时，北方民歌艺术的最高成就是：', 0, '', '', '&lt;p&gt;A:木兰辞&lt;/p&gt;&lt;p&gt;B:敕勒歌&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1049, 1, '我国著名的赵州桥建于哪个朝代？', 0, '', '', '&lt;p&gt;A:唐&lt;/p&gt;&lt;p&gt;B:隋&lt;/p&gt;&lt;p&gt;C:宋&lt;/p&gt;&lt;p&gt;D:元&lt;/p&gt;&lt;p&gt;E:明&lt;/p&gt;', 5, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1047, 1, '新中国第一部律师法于哪一年开始施行？', 0, '', '', '&lt;p&gt;A:1982年&lt;/p&gt;&lt;p&gt;B:1988年&lt;/p&gt;&lt;p&gt;C:1994年&lt;/p&gt;&lt;p&gt;D:1997年&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1045, 1, '中国第一部写在纸上的书是：', 0, '', '', '&lt;p&gt;A:《三国志》&lt;/p&gt;&lt;p&gt;B:《金刚经》&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1046, 1, '我国历史上公布第一批成文法的历史时期是：', 0, '', '', '&lt;p&gt;A:夏朝&lt;/p&gt;&lt;p&gt;B:商朝&lt;/p&gt;&lt;p&gt;C:周朝&lt;/p&gt;&lt;p&gt;D:春秋战国&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1044, 1, '我国最早制造飞机的人是：', 0, '', '', '&lt;p&gt;A:冯如&lt;/p&gt;&lt;p&gt;B:杨仙逸&lt;/p&gt;&lt;p&gt;C:李汉&lt;/p&gt;&lt;p&gt;D:韩兴华&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1043, 1, '世界上第一部成文宪法是：', 0, '', '', '&lt;p&gt;A:英国宪法&lt;/p&gt;&lt;p&gt;B:美国宪法&lt;/p&gt;&lt;p&gt;C:法国宪法&lt;/p&gt;&lt;p&gt;D:德国宪法&lt;/p&gt;&lt;p&gt;E:日本宪法&lt;/p&gt;', 5, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1042, 1, '最古老的医院是设在：', 0, '', '', '&lt;p&gt;A:学校里&lt;/p&gt;&lt;p&gt;B:教堂里&lt;/p&gt;&lt;p&gt;C:剧院里&lt;/p&gt;&lt;p&gt;D:宫廷里&lt;/p&gt;&lt;p&gt;E:集市里&lt;/p&gt;', 5, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1041, 1, '法国资产阶级革命爆发的时间是：', 0, '', '', '&lt;p&gt;A:1789年7月14日&lt;/p&gt;&lt;p&gt;B:1792年9月15日&lt;/p&gt;&lt;p&gt;C:1793年7月14日&lt;/p&gt;&lt;p&gt;D:1789年7月4日&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1040, 1, '在世界上首创用汤药治病的是：', 0, '', '', '&lt;p&gt;A:孙思邈&lt;/p&gt;&lt;p&gt;B:扁鹊&lt;/p&gt;&lt;p&gt;C:伊尹&lt;/p&gt;&lt;p&gt;D:李时珍&lt;/p&gt;&lt;p&gt;E:华佗&lt;/p&gt;', 5, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1039, 1, '中国第一座佛教寺院是哪一座？', 0, '', '', '&lt;p&gt;A:洛阳白马寺&lt;/p&gt;&lt;p&gt;B:北京潭柘寺&lt;/p&gt;&lt;p&gt;C:五台山清凉寺&lt;/p&gt;&lt;p&gt;D:蒿山少林寺&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1038, 1, '新中国第一套纪念邮票是：', 0, '', '', '&lt;p&gt;A:庆祝中国人民政治协商会议第一届全体会议&lt;/p&gt;&lt;p&gt;B:中华人民共和国开国纪念&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1037, 1, '我国最早的博物馆是：', 0, '', '', '&lt;p&gt;A:沈阳故宫博物院&lt;/p&gt;&lt;p&gt;B:南通博物馆&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1036, 1, '屈原是春秋时代哪国人？', 0, '', '', '&lt;p&gt;A:齐国&lt;/p&gt;&lt;p&gt;B:楚国&lt;/p&gt;&lt;p&gt;C:燕国&lt;/p&gt;&lt;p&gt;D:秦国&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1035, 1, '赤壁之战中，假装投降以接近曹军的吴国将领是：', 0, '', '', '&lt;p&gt;A:黄忠&lt;/p&gt;&lt;p&gt;B:黄巢&lt;/p&gt;&lt;p&gt;C:黄盖&lt;/p&gt;&lt;p&gt;D:姜维&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1034, 1, '清朝官员的官帽顶部称为顶戴，顶戴为红色的是几品官？', 0, '', '', '&lt;p&gt;A:一二品&lt;/p&gt;&lt;p&gt;B:三四品&lt;/p&gt;&lt;p&gt;C:五六品&lt;/p&gt;&lt;p&gt;D:七品以下&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1033, 1, '全国性抗日战争爆发的标志是？', 0, '', '', '&lt;p&gt;A:九一八事件&lt;/p&gt;&lt;p&gt;B:七七事件&lt;/p&gt;&lt;p&gt;C:一一八事件&lt;/p&gt;&lt;p&gt;D:一二八事件&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1032, 1, '下列各朝代疆域西至最远的是：', 0, '', '', '&lt;p&gt;A:秦朝&lt;/p&gt;&lt;p&gt;B:唐朝&lt;/p&gt;&lt;p&gt;C:宋朝&lt;/p&gt;&lt;p&gt;D:清朝&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1031, 1, '宋代的代表性刑罚是：', 0, '', '', '&lt;p&gt;A:腰斩&lt;/p&gt;&lt;p&gt;B:刺配&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1030, 1, '秦朝制订的《田律》是关于哪方面的规定？', 0, '', '', '&lt;p&gt;A:农业&lt;/p&gt;&lt;p&gt;B:环境保护&lt;/p&gt;&lt;p&gt;C:商品交换&lt;/p&gt;&lt;p&gt;D:税收&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1029, 1, '第一个测出了地球质量的人是?', 0, '', '', '&lt;p&gt;A:卡文迪许&lt;/p&gt;&lt;p&gt;B:阿基米德&lt;/p&gt;&lt;p&gt;C:帕斯卡&lt;/p&gt;&lt;p&gt;D:惠更斯&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1028, 1, '古代人们用来当酒杯的青铜器叫：', 0, '', '', '&lt;p&gt;A:敦&lt;/p&gt;&lt;p&gt;B:尊&lt;/p&gt;&lt;p&gt;C:爵&lt;/p&gt;&lt;p&gt;D:鼎&lt;/p&gt;&lt;p&gt;E:盘&lt;/p&gt;', 5, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1027, 1, '秦汉时代，人们说的“关中”指哪一带？', 0, '', '', '&lt;p&gt;A:函谷关以西&lt;/p&gt;&lt;p&gt;B:阳关以西&lt;/p&gt;&lt;p&gt;C:山海关以东&lt;/p&gt;&lt;p&gt;D:嘉峪关以东&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1026, 1, '我国宋代邢窑出白釉瓷、越窑出青釉瓷，所以有：', 0, '', '', '&lt;p&gt;A:“南青北白”之称&lt;/p&gt;&lt;p&gt;B:“北青南白”之称&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1025, 1, '我国西晋的第一代皇帝名叫：', 0, '', '', '&lt;p&gt;A:曹丕&lt;/p&gt;&lt;p&gt;B:司马睿&lt;/p&gt;&lt;p&gt;C:司马炎&lt;/p&gt;&lt;p&gt;D:司马懿&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1024, 1, '著名历史学家黄仁宇出生于哪一年', 0, '', '', '&lt;p&gt;A:1910年&lt;/p&gt;&lt;p&gt;B:1911年&lt;/p&gt;&lt;p&gt;C:1918年&lt;/p&gt;&lt;p&gt;D:1920年&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1023, 1, '在西方，中世纪的新年是', 0, '', '', '&lt;p&gt;A:1月1日&lt;/p&gt;&lt;p&gt;B:2月1日&lt;/p&gt;&lt;p&gt;C:3月1日&lt;/p&gt;&lt;p&gt;D:4月1日&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1022, 1, '避孕套最早出现在哪个国家', 0, '', '', '&lt;p&gt;A:埃及&lt;/p&gt;&lt;p&gt;B:美国&lt;/p&gt;&lt;p&gt;C:中国&lt;/p&gt;&lt;p&gt;D:日本&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1021, 1, '我国唐代学者一行和尚，他制订了什么历法？', 0, '', '', '&lt;p&gt;A:大明历&lt;/p&gt;&lt;p&gt;B:元嘉历&lt;/p&gt;&lt;p&gt;C:大衍历&lt;/p&gt;&lt;p&gt;D:公历&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1020, 1, '智利球星萨拉斯出生在哪一年？', 0, '', '', '&lt;p&gt;A:1972&lt;/p&gt;&lt;p&gt;B:1973&lt;/p&gt;&lt;p&gt;C:1974&lt;/p&gt;&lt;p&gt;D:1975&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1019, 1, '浪漫主义诗人济慈在世活了多少年？', 0, '', '', '&lt;p&gt;A:25&lt;/p&gt;&lt;p&gt;B:26&lt;/p&gt;&lt;p&gt;C:35&lt;/p&gt;&lt;p&gt;D:36&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1018, 1, '校园歌曲最早出现在', 0, '', '', '&lt;p&gt;A:台湾&lt;/p&gt;&lt;p&gt;B:巴西&lt;/p&gt;&lt;p&gt;C:日本&lt;/p&gt;&lt;p&gt;D:韩国&lt;/p&gt;&lt;p&gt;E:美国&lt;/p&gt;', 5, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1017, 1, '我国古代的“芙蓉城”是指：', 0, '', '', '&lt;p&gt;A:杭州&lt;/p&gt;&lt;p&gt;B:洛阳&lt;/p&gt;&lt;p&gt;C:成都&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1016, 1, '历史上的“三八线”指的是朝鲜领土上的什么线？', 0, '', '', '&lt;p&gt;A:经度３８度线&lt;/p&gt;&lt;p&gt;B:北纬３８度线&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1015, 3, '秦始皇把正月改叫端月是为了避讳自己的名字，对吗？', 0, '', '', '&lt;p&gt;A:对&lt;/p&gt;&lt;p&gt;B:不对&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1014, 1, '上个世纪60年代中期成立的第三世界组织是：', 0, '', '', '&lt;p&gt;A:非洲人国民大会&lt;/p&gt;&lt;p&gt;B:非洲统一组织&lt;/p&gt;&lt;p&gt;C:阿拉伯国家联盟&lt;/p&gt;&lt;p&gt;D:77国集团&lt;/p&gt;&lt;p&gt;E:东南亚国家联盟&lt;/p&gt;', 5, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1013, 1, '东汉末年我国的一位杰出的医学家是：', 0, '', '', '&lt;p&gt;A:扁鹊&lt;/p&gt;&lt;p&gt;B:华佗&lt;/p&gt;&lt;p&gt;C:李时珍&lt;/p&gt;&lt;p&gt;D:叶天士&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1012, 1, '以下哪一位是中西交往史上较早的人物？', 0, '', '', '&lt;p&gt;A:马可波罗&lt;/p&gt;&lt;p&gt;B:利马窦&lt;/p&gt;&lt;p&gt;C:晁衡&lt;/p&gt;&lt;p&gt;D:玄奘&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1011, 3, '秦桧是不是最早被称为汉奸的人？', 0, '', '', '&lt;p&gt;A:是&lt;/p&gt;&lt;p&gt;B:不是&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1010, 1, '最早进入青铜器时代的国家是：', 0, '', '', '&lt;p&gt;A:阿拉伯叙利亚&lt;/p&gt;&lt;p&gt;B:中国&lt;/p&gt;&lt;p&gt;C:埃及&lt;/p&gt;&lt;p&gt;D:印度&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1009, 1, '&quot;九宫格”的创始人是', 0, '', '', '&lt;p&gt;A:欧阳洵&lt;/p&gt;&lt;p&gt;B:虞世南&lt;/p&gt;&lt;p&gt;C:智永&lt;/p&gt;&lt;p&gt;D:翁方纲&lt;/p&gt;&lt;p&gt;E:米芾&lt;/p&gt;', 5, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1008, 1, '人类最早使用的工具，是什么材料的？', 0, '', '', '&lt;p&gt;A:木&lt;/p&gt;&lt;p&gt;B:石&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1007, 1, '我国哪位思想家曾提出：学校应成为民主议政的场所？', 0, '', '', '&lt;p&gt;A:王夫之&lt;/p&gt;&lt;p&gt;B:顾炎武&lt;/p&gt;&lt;p&gt;C:黄宗羲&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1006, 1, '下面不是明代的宣德炉之所以珍贵的原因是：', 0, '', '', '&lt;p&gt;A:有重大历史意义&lt;/p&gt;&lt;p&gt;B:用料精到&lt;/p&gt;&lt;p&gt;C:数量很少&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1005, 1, '古建筑屋顶中等级最高的是：', 0, '', '', '&lt;p&gt;A:悬山顶&lt;/p&gt;&lt;p&gt;B:重檐庑殿顶&lt;/p&gt;&lt;p&gt;C:重檐歇山顶&lt;/p&gt;&lt;p&gt;D:硬山顶&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1004, 1, '世界上最早的节目主持人是主持什么节目的？', 0, '', '', '&lt;p&gt;A:戏剧&lt;/p&gt;&lt;p&gt;B:广告&lt;/p&gt;&lt;p&gt;C:新闻&lt;/p&gt;&lt;p&gt;D:音乐&lt;/p&gt;&lt;p&gt;E:舞蹈&lt;/p&gt;', 5, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1003, 1, '唐太宗的“太宗”指的是他的：', 0, '', '', '&lt;p&gt;A:谥号&lt;/p&gt;&lt;p&gt;B:陵号&lt;/p&gt;&lt;p&gt;C:庙号&lt;/p&gt;&lt;p&gt;D:年号&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1001, 1, '唐代人可以称“父亲”为：', 0, '', '', '&lt;p&gt;A:伯伯&lt;/p&gt;&lt;p&gt;B:哥哥&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1002, 1, '群体诉讼最早产生于：', 0, '', '', '&lt;p&gt;A:美国&lt;/p&gt;&lt;p&gt;B:法国&lt;/p&gt;&lt;p&gt;C:中国&lt;/p&gt;&lt;p&gt;D:英国&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1000, 1, '饼干最初出现的地点是：', 0, '', '', '&lt;p&gt;A:高山&lt;/p&gt;&lt;p&gt;B:海岛&lt;/p&gt;&lt;p&gt;C:极地&lt;/p&gt;&lt;p&gt;D:峡谷&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(999, 1, '阅兵是古今中外一种隆重的军事仪式，我国最早对阅兵有记载是在：', 0, '', '', '&lt;p&gt;A:春秋&lt;/p&gt;&lt;p&gt;B:战国&lt;/p&gt;&lt;p&gt;C:秦&lt;/p&gt;&lt;p&gt;D:汉&lt;/p&gt;&lt;p&gt;E:三国&lt;/p&gt;', 5, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(998, 1, '“谬种流传”最早是宋朝人批评当时的：', 0, '', '', '&lt;p&gt;A:官场黑暗&lt;/p&gt;&lt;p&gt;B:科举制度&lt;/p&gt;&lt;p&gt;C:社会风气&lt;/p&gt;&lt;p&gt;D:诗词风格&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(997, 1, '世界上第一个空中犯罪问题的国际公约是：', 0, '', '', '&lt;p&gt;A:《东京公约》&lt;/p&gt;&lt;p&gt;B:《海牙公约》&lt;/p&gt;&lt;p&gt;C:《蒙特利尔公约》&lt;/p&gt;&lt;p&gt;D:《华沙公约》&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(996, 1, '2000年我国国内生产总值突破：', 0, '', '', '&lt;p&gt;A:1万亿美元&lt;/p&gt;&lt;p&gt;B:1.5万亿美元&lt;/p&gt;&lt;p&gt;C:2万亿美元&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(995, 1, '从何时起，对最高统治者称“王”？', 0, '', '', '&lt;p&gt;A:夏&lt;/p&gt;&lt;p&gt;B:商&lt;/p&gt;&lt;p&gt;C:春秋&lt;/p&gt;&lt;p&gt;D:周&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(994, 1, '孔乙己是科举制度的牺牲品，科举制度始创于何时？', 0, '', '', '&lt;p&gt;A:汉朝&lt;/p&gt;&lt;p&gt;B:隋朝&lt;/p&gt;&lt;p&gt;C:唐朝&lt;/p&gt;&lt;p&gt;D:元代&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(993, 1, '中国抗日战争中，最早为抗击日寇牺牲的中国将领是：', 0, '', '', '&lt;p&gt;A:张治中&lt;/p&gt;&lt;p&gt;B:张自忠&lt;/p&gt;&lt;p&gt;C:赵登禹&lt;/p&gt;&lt;p&gt;D:左权&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(992, 1, '数学符号中的&quot;0&quot;起源于：', 0, '', '', '&lt;p&gt;A:古印度&lt;/p&gt;&lt;p&gt;B:古希腊&lt;/p&gt;&lt;p&gt;C:古埃及&lt;/p&gt;&lt;p&gt;D:古罗马&lt;/p&gt;&lt;p&gt;E:中国&lt;/p&gt;', 5, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(991, 1, '世界上第一个国家颁布的药典出现在：', 0, '', '', '&lt;p&gt;A:东罗马帝国时期&lt;/p&gt;&lt;p&gt;B:印度孔雀王朝&lt;/p&gt;&lt;p&gt;C:中国唐朝&lt;/p&gt;&lt;p&gt;D:日本德川时代&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(990, 1, '有的学校实行学分制，在我国最早提倡学分制的是', 0, '', '', '&lt;p&gt;A:鲁迅&lt;/p&gt;&lt;p&gt;B:蔡元培&lt;/p&gt;&lt;p&gt;C:吴玉章&lt;/p&gt;&lt;p&gt;D:毛泽东&lt;/p&gt;&lt;p&gt;E:周恩来&lt;/p&gt;', 5, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(989, 1, '最早可卡因是一种：', 0, '', '', '&lt;p&gt;A:解酒药&lt;/p&gt;&lt;p&gt;B:麻醉剂&lt;/p&gt;&lt;p&gt;C:调料品&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(988, 1, '春秋时的齐国和鲁国，在现在的哪个省？', 0, '', '', '&lt;p&gt;A:河北&lt;/p&gt;&lt;p&gt;B:山东&lt;/p&gt;&lt;p&gt;C:江苏&lt;/p&gt;&lt;p&gt;D:安徽&lt;/p&gt;&lt;p&gt;E:河南&lt;/p&gt;', 5, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(987, 1, '相传我国古代能作“掌上舞”的人是：', 0, '', '', '&lt;p&gt;A:杨玉环&lt;/p&gt;&lt;p&gt;B:赵飞燕&lt;/p&gt;&lt;p&gt;C:西施&lt;/p&gt;&lt;p&gt;D:貂蝉&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(986, 1, '馒头起源于', 0, '', '', '&lt;p&gt;A:南方&lt;/p&gt;&lt;p&gt;B:北方&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(985, 1, '内蒙古和林格尔壁画的产生年代是：', 0, '', '', '&lt;p&gt;A:汉代&lt;/p&gt;&lt;p&gt;B:辽代&lt;/p&gt;&lt;p&gt;C:元代&lt;/p&gt;&lt;p&gt;D:清代&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(984, 1, '古陶的年代鉴别首先应该看：', 0, '', '', '&lt;p&gt;A:纹样&lt;/p&gt;&lt;p&gt;B:器形&lt;/p&gt;&lt;p&gt;C:釉色&lt;/p&gt;&lt;p&gt;D:颜色&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(983, 1, '中国最早的教育专业刊物是：', 0, '', '', '&lt;p&gt;A:《教育漫话》&lt;/p&gt;&lt;p&gt;B:《教育界》&lt;/p&gt;&lt;p&gt;C:《教育论》&lt;/p&gt;&lt;p&gt;D:《教育学》&lt;/p&gt;&lt;p&gt;E:《教育杂志》&lt;/p&gt;', 5, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(982, 1, '世界上第一个无产阶级政权建立于哪个国家？', 0, '', '', '&lt;p&gt;A:法国&lt;/p&gt;&lt;p&gt;B:俄国&lt;/p&gt;&lt;p&gt;C:中国&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(980, 1, '古时戒指用来表示？', 0, '', '', '&lt;p&gt;A:荣誉&lt;/p&gt;&lt;p&gt;B:富贵&lt;/p&gt;&lt;p&gt;C:禁戒&lt;/p&gt;&lt;p&gt;D:婚否&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(981, 1, '鼎有几个“耳朵”？', 0, '', '', '&lt;p&gt;A:没有&lt;/p&gt;&lt;p&gt;B:2个&lt;/p&gt;&lt;p&gt;C:3个&lt;/p&gt;&lt;p&gt;D:4个&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(979, 2, '下列姓氏中，哪些曾是古代的官名？（多选）', 0, '', '', '&lt;p&gt;A:欧阳&lt;/p&gt;&lt;p&gt;B:司马&lt;/p&gt;&lt;p&gt;C:上官&lt;/p&gt;&lt;p&gt;D:夏侯&lt;/p&gt;&lt;p&gt;E:司徒&lt;/p&gt;&lt;p&gt;F:司空&lt;/p&gt;', 6, 'BCD', 'BCD', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(978, 1, '第一次世界杯在哪一年举行？', 0, '', '', '&lt;p&gt;A:1904&lt;/p&gt;&lt;p&gt;B:1930&lt;/p&gt;&lt;p&gt;C:1956&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(976, 1, '在第二次世界大战中，中途岛战役发生在哪两个国家之间？', 0, '', '', '&lt;p&gt;A:英德&lt;/p&gt;&lt;p&gt;B:美日&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(977, 1, '世界上第一部《有限责任公司法》是由哪个国家制定的？', 0, '', '', '&lt;p&gt;A:美国&lt;/p&gt;&lt;p&gt;B:德国&lt;/p&gt;&lt;p&gt;C:英国&lt;/p&gt;&lt;p&gt;D:法国&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(975, 1, '历史上“乐不思蜀”的是哪位皇帝？', 0, '', '', '&lt;p&gt;A:刘备&lt;/p&gt;&lt;p&gt;B:刘秀&lt;/p&gt;&lt;p&gt;C:孙权&lt;/p&gt;&lt;p&gt;D:刘禅&lt;/p&gt;&lt;p&gt;E:刘邦&lt;/p&gt;', 5, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(974, 1, '“大禹治水”最终获得成功，是因为大禹采用了什么方法治理洪水？', 0, '', '', '&lt;p&gt;A:填塞&lt;/p&gt;&lt;p&gt;B:疏导&lt;/p&gt;&lt;p&gt;C:围堵&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(972, 1, '王安石变法发生在宋朝哪个皇帝在位期间？', 0, '', '', '&lt;p&gt;A:仁宗&lt;/p&gt;&lt;p&gt;B:神宗&lt;/p&gt;&lt;p&gt;C:英宗&lt;/p&gt;&lt;p&gt;D:哲宗&lt;/p&gt;&lt;p&gt;E:高宗&lt;/p&gt;', 5, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(973, 1, '隋朝所取代的“周”，属于北朝还是南朝？', 0, '', '', '&lt;p&gt;A:北朝&lt;/p&gt;&lt;p&gt;B:南朝&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(971, 1, '八路军的全称是', 0, '', '', '&lt;p&gt;A:中国工农红军第八军&lt;/p&gt;&lt;p&gt;B:国民革命军第八军&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(970, 1, '我国最先出现的纸币是：', 0, '', '', '&lt;p&gt;A:元代的“宝钞”&lt;/p&gt;&lt;p&gt;B:元代的“交子”&lt;/p&gt;&lt;p&gt;C:宋代的“宝钞”&lt;/p&gt;&lt;p&gt;D:宋代的“交子”&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(969, 1, '阳春白雪和下里巴人源于什么时代？', 0, '', '', '&lt;p&gt;A:春秋&lt;/p&gt;&lt;p&gt;B:战国&lt;/p&gt;&lt;p&gt;C:秦代&lt;/p&gt;&lt;p&gt;D:唐代&lt;/p&gt;&lt;p&gt;E:宋代&lt;/p&gt;', 5, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(968, 1, '清朝时，北京城的西直门是由满族那一旗驻守的？', 0, '', '', '&lt;p&gt;A:正黄旗&lt;/p&gt;&lt;p&gt;B:正红旗&lt;/p&gt;&lt;p&gt;C:镶黄旗&lt;/p&gt;&lt;p&gt;D:镶红旗&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(966, 1, '世界第一枚邮票出现在：', 0, '', '', '&lt;p&gt;A:英国&lt;/p&gt;&lt;p&gt;B:德国&lt;/p&gt;&lt;p&gt;C:法国&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(967, 1, '古人放爆竹最早是为了：', 0, '', '', '&lt;p&gt;A:庆祝节日&lt;/p&gt;&lt;p&gt;B:恭贺商店开张&lt;/p&gt;&lt;p&gt;C:庆贺生日&lt;/p&gt;&lt;p&gt;D:驱逐瘟神疫鬼&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(964, 1, '汉朝最先下诏废除肉刑的皇帝是：', 0, '', '', '&lt;p&gt;A:汉武帝&lt;/p&gt;&lt;p&gt;B:汉成帝&lt;/p&gt;&lt;p&gt;C:汉文帝&lt;/p&gt;&lt;p&gt;D:汉景帝&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(965, 1, '“王牌飞行员” 最早授予击落几架飞机的空军战士？', 0, '', '', '&lt;p&gt;A:2架&lt;/p&gt;&lt;p&gt;B:3架&lt;/p&gt;&lt;p&gt;C:5架&lt;/p&gt;&lt;p&gt;D:10架&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(963, 1, '把占城稻推广到江浙和淮河流域种植的是：', 0, '', '', '&lt;p&gt;A:北宋政府&lt;/p&gt;&lt;p&gt;B:南宋政府&lt;/p&gt;&lt;p&gt;C:元朝政府&lt;/p&gt;&lt;p&gt;D:唐朝政府&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(962, 1, '我国电视台播放的第一部外国电视剧是：', 0, '', '', '&lt;p&gt;A:朝鲜的&lt;/p&gt;&lt;p&gt;B:南斯拉夫的&lt;/p&gt;&lt;p&gt;C:古巴的&lt;/p&gt;&lt;p&gt;D:波兰的&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(961, 1, '我国珍稀野生动物特种纪念币系列的首枚纪念币图案是：', 0, '', '', '&lt;p&gt;A:大熊猫&lt;/p&gt;&lt;p&gt;B:金丝猴&lt;/p&gt;&lt;p&gt;C:扬子鳄&lt;/p&gt;&lt;p&gt;D:白鳍豚&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(960, 1, '康熙皇帝的庙号是：', 0, '', '', '&lt;p&gt;A:仁宗&lt;/p&gt;&lt;p&gt;B:太宗&lt;/p&gt;&lt;p&gt;C:穆宗&lt;/p&gt;&lt;p&gt;D:圣祖&lt;/p&gt;&lt;p&gt;E:世祖&lt;/p&gt;', 5, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(959, 1, '最早的春联是：', 0, '', '', '&lt;p&gt;A:刻在木上&lt;/p&gt;&lt;p&gt;B:写在纸上&lt;/p&gt;&lt;p&gt;C:雕在石上&lt;/p&gt;&lt;p&gt;D:绣在绸上&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(958, 1, '中国签定的第一个不平等条约是哪个？', 0, '', '', '&lt;p&gt;A:望厦条约&lt;/p&gt;&lt;p&gt;B:南京条约&lt;/p&gt;&lt;p&gt;C:辛丑条约&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(957, 1, '战国时，“纸上谈兵”招致兵败的赵国将领是：', 0, '', '', '&lt;p&gt;A:赵奢&lt;/p&gt;&lt;p&gt;B:赵构&lt;/p&gt;&lt;p&gt;C:赵括&lt;/p&gt;&lt;p&gt;D:赵盾&lt;/p&gt;&lt;p&gt;E:赵恒&lt;/p&gt;', 5, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(956, 1, '明清时期称镌刻约束在学生员条规的碑石为卧碑，它一般树于明伦堂的：', 0, '', '', '&lt;p&gt;A:前方&lt;/p&gt;&lt;p&gt;B:后方&lt;/p&gt;&lt;p&gt;C:左边&lt;/p&gt;&lt;p&gt;D:右边&lt;/p&gt;&lt;p&gt;E:室内&lt;/p&gt;', 5, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(955, 1, '以下哪种人，不属于古代日耳曼民族？', 0, '', '', '&lt;p&gt;A:西哥特人&lt;/p&gt;&lt;p&gt;B:萨克森人&lt;/p&gt;&lt;p&gt;C:希洛人&lt;/p&gt;&lt;p&gt;D:法兰克人&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(954, 1, '在我国古代曾有一次人口普查，它是在哪个朝代进行的？', 0, '', '', '&lt;p&gt;A:宋朝&lt;/p&gt;&lt;p&gt;B:元朝&lt;/p&gt;&lt;p&gt;C:明朝&lt;/p&gt;&lt;p&gt;D:清朝&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(953, 1, '人类最早的“精子库”是为谁而建的？', 0, '', '', '&lt;p&gt;A:不育男子&lt;/p&gt;&lt;p&gt;B:参战士兵&lt;/p&gt;&lt;p&gt;C:单身贵族&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(952, 1, '下列王朝中统治时间最短的是：', 0, '', '', '&lt;p&gt;A:秦朝&lt;/p&gt;&lt;p&gt;B:隋朝&lt;/p&gt;&lt;p&gt;C:西晋&lt;/p&gt;&lt;p&gt;D:元朝&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(951, 1, '东汉时，谁既是杰出的科学家又是著名的文学家？', 0, '', '', '&lt;p&gt;A:王充&lt;/p&gt;&lt;p&gt;B:张衡&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(950, 1, '西汉时期，经御史大夫杜周、杜延年解释的汉律，被称为“大杜律和小杜律”，他们两人的关系是：', 0, '', '', '&lt;p&gt;A:父子&lt;/p&gt;&lt;p&gt;B:师生&lt;/p&gt;&lt;p&gt;C:叔侄&lt;/p&gt;&lt;p&gt;D:同朝官员&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(949, 1, '世界上第一枚邮票是于哪年发行的？', 0, '', '', '&lt;p&gt;A:1820年&lt;/p&gt;&lt;p&gt;B:1840年&lt;/p&gt;&lt;p&gt;C:1860年&lt;/p&gt;&lt;p&gt;D:1900年&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(947, 1, '唐高祖武德四年的开元通宝，开元所代表的意思为：', 0, '', '', '&lt;p&gt;A:开辟新纪元&lt;/p&gt;&lt;p&gt;B:年号&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(948, 1, '秦朝开始推行郡县制度，在全国设：', 0, '', '', '&lt;p&gt;A:24郡&lt;/p&gt;&lt;p&gt;B:36郡&lt;/p&gt;&lt;p&gt;C:20郡&lt;/p&gt;&lt;p&gt;D:40郡&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(945, 1, '在荷马史诗当中，特洛伊战争持续了：', 0, '', '', '&lt;p&gt;A:8年&lt;/p&gt;&lt;p&gt;B:15年&lt;/p&gt;&lt;p&gt;C:10年&lt;/p&gt;&lt;p&gt;D:11年&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(946, 1, '“尧天禹日”是指代什么的?', 0, '', '', '&lt;p&gt;A:改朝换代&lt;/p&gt;&lt;p&gt;B:太平盛世&lt;/p&gt;&lt;p&gt;C:一朝天子一朝臣&lt;/p&gt;&lt;p&gt;D:饥荒年代&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(944, 2, '人类食品历史上先后出现了五类食品，其中第四，五类食品是？（多选）', 0, '', '', '&lt;p&gt;A:米&lt;/p&gt;&lt;p&gt;B:面&lt;/p&gt;&lt;p&gt;C:油&lt;/p&gt;&lt;p&gt;D:酱油&lt;/p&gt;&lt;p&gt;E:醋&lt;/p&gt;', 5, 'DE', 'DE', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(943, 1, '人类古代的“掠夺婚”产生于哪个时期？', 0, '', '', '&lt;p&gt;A:母权制初期&lt;/p&gt;&lt;p&gt;B:父权制初期&lt;/p&gt;&lt;p&gt;C:对偶婚时期&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(942, 1, '较早使用的活字是：', 0, '', '', '&lt;p&gt;A:木活字&lt;/p&gt;&lt;p&gt;B:铅活字&lt;/p&gt;&lt;p&gt;C:陶活字&lt;/p&gt;&lt;p&gt;D:铜活字&lt;/p&gt;&lt;p&gt;E:锡活字&lt;/p&gt;', 5, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(941, 1, '宋代的&quot;学象生&quot;同现代的：', 0, '', '', '&lt;p&gt;A:口技&lt;/p&gt;&lt;p&gt;B:相声&lt;/p&gt;&lt;p&gt;C:舞狮子&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(940, 1, '下列官名中哪些不是唐朝的官名？', 0, '', '', '&lt;p&gt;A:尚书&lt;/p&gt;&lt;p&gt;B:黄门&lt;/p&gt;&lt;p&gt;C:中书&lt;/p&gt;&lt;p&gt;D:巡按&lt;/p&gt;&lt;p&gt;E:殿中&lt;/p&gt;&lt;p&gt;F:御史&lt;/p&gt;', 6, 'E', 'E', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(939, 1, '方便面的发明者最初的愿望是：', 0, '', '', '&lt;p&gt;A:战时储备&lt;/p&gt;&lt;p&gt;B:节约时间&lt;/p&gt;&lt;p&gt;C:在家吃面&lt;/p&gt;&lt;p&gt;D:提高效益&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(938, 1, '世界上第一种基因移植作物是：', 0, '', '', '&lt;p&gt;A:番茄&lt;/p&gt;&lt;p&gt;B:烟草&lt;/p&gt;&lt;p&gt;C:白菜&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(936, 1, '据考古资料显示，我国的钻孔技术开始于：', 0, '', '', '&lt;p&gt;A:山顶洞人时代&lt;/p&gt;&lt;p&gt;B:母系氏族繁荣时期&lt;/p&gt;&lt;p&gt;C:父系氏族时期&lt;/p&gt;&lt;p&gt;D:夏朝&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(937, 1, '哪个火山的爆发毁灭了古罗马帝国的庞贝城？', 0, '', '', '&lt;p&gt;A:维苏威火山&lt;/p&gt;&lt;p&gt;B:埃特纳火山&lt;/p&gt;&lt;p&gt;C:圣海伦斯火山&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(935, 3, '中国历史上被称为始皇帝的不是嬴政，对吗？', 0, '', '', '&lt;p&gt;A:对&lt;/p&gt;&lt;p&gt;B:不对&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(934, 1, '哈雷慧星的最早记录是哪国人留下的？', 0, '', '', '&lt;p&gt;A:埃及人&lt;/p&gt;&lt;p&gt;B:希腊人&lt;/p&gt;&lt;p&gt;C:中国人&lt;/p&gt;&lt;p&gt;D:波斯人&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(932, 1, '涮羊肉起源于', 0, '', '', '&lt;p&gt;A:清朝&lt;/p&gt;&lt;p&gt;B:元朝&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(933, 1, '目前人类已知的最软的石头是：', 0, '', '', '&lt;p&gt;A:磷灰石&lt;/p&gt;&lt;p&gt;B:石膏&lt;/p&gt;&lt;p&gt;C:方解石&lt;/p&gt;&lt;p&gt;D:滑石&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(931, 1, '抗战时期，“八路军”下辖3个师和一个直属队，刘伯承在：', 0, '', '', '&lt;p&gt;A:115师&lt;/p&gt;&lt;p&gt;B:120师&lt;/p&gt;&lt;p&gt;C:129师&lt;/p&gt;&lt;p&gt;D:直属队&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(930, 1, '我国古代哪位文学家曾两度到杭州做官？', 0, '', '', '&lt;p&gt;A:欧阳修&lt;/p&gt;&lt;p&gt;B:杜甫&lt;/p&gt;&lt;p&gt;C:白居易&lt;/p&gt;&lt;p&gt;D:苏轼&lt;/p&gt;&lt;p&gt;E:韩愈&lt;/p&gt;&lt;p&gt;F:曹操&lt;/p&gt;', 6, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(929, 1, '下列对清明两代“乡试”考试地点解释正确的是：', 0, '', '', '&lt;p&gt;A:在本乡&lt;/p&gt;&lt;p&gt;B:在各县县城&lt;/p&gt;&lt;p&gt;C:在各省省城&lt;/p&gt;&lt;p&gt;D:在京城书院&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(928, 1, '蒸馏酒源于中国古代的：', 0, '', '', '&lt;p&gt;A:炼丹术&lt;/p&gt;&lt;p&gt;B:造纸术&lt;/p&gt;&lt;p&gt;C:印刷术&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(927, 1, '古代著名的水利工程都江堰是谁设计的？', 0, '', '', '&lt;p&gt;A:大禹&lt;/p&gt;&lt;p&gt;B:李冰父子&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(926, 1, '最早的纸币源于:', 0, '', '', '&lt;p&gt;A:中国&lt;/p&gt;&lt;p&gt;B:美国&lt;/p&gt;&lt;p&gt;C:苏联&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(925, 1, '《阳关三叠》是甚么时候的琴曲？', 0, '', '', '&lt;p&gt;A:汉代&lt;/p&gt;&lt;p&gt;B:隋唐&lt;/p&gt;&lt;p&gt;C:宋元&lt;/p&gt;&lt;p&gt;D:明清&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(924, 1, '谁是“中山装”的创始人？', 0, '', '', '&lt;p&gt;A:黄隆生&lt;/p&gt;&lt;p&gt;B:孙中山&lt;/p&gt;&lt;p&gt;C:汪精卫&lt;/p&gt;&lt;p&gt;D:黄兴&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(923, 1, '世界水日是哪一天?', 0, '', '', '&lt;p&gt;A:3月23日&lt;/p&gt;&lt;p&gt;B:4月23日&lt;/p&gt;&lt;p&gt;C:5月23日&lt;/p&gt;&lt;p&gt;D:6月23日&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(922, 1, '现存关于遗嘱继承的最早的法规产生于：', 0, '', '', '&lt;p&gt;A:汉代&lt;/p&gt;&lt;p&gt;B:唐代&lt;/p&gt;&lt;p&gt;C:宋代&lt;/p&gt;&lt;p&gt;D:元代&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(920, 1, '请问“法律”最早出现于哪个社会？', 0, '', '', '&lt;p&gt;A:原始社会&lt;/p&gt;&lt;p&gt;B:奴隶社会&lt;/p&gt;&lt;p&gt;C:封建社会&lt;/p&gt;&lt;p&gt;D:资本主义社会&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(921, 1, '欧元什么时候正式诞生？', 0, '', '', '&lt;p&gt;A:1999年1月1日&lt;/p&gt;&lt;p&gt;B:1999年7月1日&lt;/p&gt;&lt;p&gt;C:1999年12月1日&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(919, 1, '一个帝王陵区只有一个主神道，一般修在谁的陵前？', 0, '', '', '&lt;p&gt;A:第一个埋葬者&lt;/p&gt;&lt;p&gt;B:年龄最大者&lt;/p&gt;&lt;p&gt;C:统治时间最长者&lt;/p&gt;&lt;p&gt;D:国力最昌盛者&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(918, 1, '早期人类家庭的进步，与哪种事业关系最密切？', 0, '', '', '&lt;p&gt;A:狩猎&lt;/p&gt;&lt;p&gt;B:捕鱼&lt;/p&gt;&lt;p&gt;C:造房&lt;/p&gt;&lt;p&gt;D:饲养&lt;/p&gt;&lt;p&gt;E:纺织&lt;/p&gt;', 5, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(917, 1, '我国最早提出创建监狱的人是：', 0, '', '', '&lt;p&gt;A:皋陶&lt;/p&gt;&lt;p&gt;B:李斯&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1);
INSERT INTO `x2_questions` (`questionid`, `questiontype`, `question`, `questionuserid`, `questionusername`, `questionlastmodifyuser`, `questionselect`, `questionselectnumber`, `questionanswer`, `questiondescribe`, `questionknowsid`, `questioncreatetime`, `questionstatus`, `questionhtml`, `questionparent`, `questionsequence`, `questionlevel`) VALUES
(916, 1, '清光绪年间曾对邮票有一种非常特殊的称谓，请问当时叫什么？', 0, '', '', '&lt;p&gt;A:老人头&lt;/p&gt;&lt;p&gt;B:小孩头&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(915, 1, '我国第一所民办高等教育机构哪年建立？', 0, '', '', '&lt;p&gt;A:1982&lt;/p&gt;&lt;p&gt;B:1985&lt;/p&gt;&lt;p&gt;C:1988&lt;/p&gt;&lt;p&gt;D:1992&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(914, 1, '最早芭蕾舞出现于：', 0, '', '', '&lt;p&gt;A:杂技团&lt;/p&gt;&lt;p&gt;B:宫廷&lt;/p&gt;&lt;p&gt;C:学校&lt;/p&gt;&lt;p&gt;D:戏团&lt;/p&gt;&lt;p&gt;E:教会&lt;/p&gt;&lt;p&gt;F:军队&lt;/p&gt;', 6, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(913, 1, '美国1787年宪法规定，解释宪法的权力在：', 0, '', '', '&lt;p&gt;A:众议院&lt;/p&gt;&lt;p&gt;B:参议院&lt;/p&gt;&lt;p&gt;C:最高法院&lt;/p&gt;&lt;p&gt;D:总统&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(912, 1, '科举中，会出现一人兼解元、会元、状元的“连中三元”，其分别是在什么考试中取得的？', 0, '', '', '&lt;p&gt;A:院试、乡试、殿试&lt;/p&gt;&lt;p&gt;B:院试、会试、殿试&lt;/p&gt;&lt;p&gt;C:府试、乡试、殿试&lt;/p&gt;&lt;p&gt;D:县试、会试、殿试&lt;/p&gt;&lt;p&gt;E:乡试、会试、殿试&lt;/p&gt;&lt;p&gt;F:童试、会试、殿试&lt;/p&gt;', 6, 'E', 'E', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(911, 1, '我国宪法的监督权属于：', 0, '', '', '&lt;p&gt;A:国务院&lt;/p&gt;&lt;p&gt;B:全国人大&lt;/p&gt;&lt;p&gt;C:全国人大常委会&lt;/p&gt;&lt;p&gt;D:全国人大法律委员会&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(910, 1, '隋唐时期的官制中尚书省分为吏,户,礼,兵,刑,工六部,其中的礼部是掌管：', 0, '', '', '&lt;p&gt;A:规定礼仪,监督和教育官员和百姓懂得礼仪&lt;/p&gt;&lt;p&gt;B:掌管国家的典章法度,祭祀,学校,科举和接待四方宾客等事务&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(909, 1, '馒头是谁发明的？', 0, '', '', '&lt;p&gt;A:李冰&lt;/p&gt;&lt;p&gt;B:诸葛亮&lt;/p&gt;&lt;p&gt;C:曹操&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(908, 1, '世界上第一家麻将博物馆坐落在：', 0, '', '', '&lt;p&gt;A:中国&lt;/p&gt;&lt;p&gt;B:日本&lt;/p&gt;&lt;p&gt;C:法国&lt;/p&gt;&lt;p&gt;D:印度&lt;/p&gt;&lt;p&gt;E:阿拉伯&lt;/p&gt;&lt;p&gt;F:美国&lt;/p&gt;', 6, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(907, 1, '发生在北京卢沟桥的历史事变名叫？', 0, '', '', '&lt;p&gt;A:华北事变&lt;/p&gt;&lt;p&gt;B:戊戌政变&lt;/p&gt;&lt;p&gt;C:七七事变&lt;/p&gt;&lt;p&gt;D:皖南事变&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(906, 1, '世界最早的公用电话亭是在：', 0, '', '', '&lt;p&gt;A:银行内&lt;/p&gt;&lt;p&gt;B:公园内&lt;/p&gt;&lt;p&gt;C:商店内&lt;/p&gt;&lt;p&gt;D:电话公司内&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(905, 1, '第一次鸦片战争发生的时间是：', 0, '', '', '&lt;p&gt;A:1839年3月&lt;/p&gt;&lt;p&gt;B:1840年6月&lt;/p&gt;&lt;p&gt;C:1841年1月&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(904, 1, '以下哪一位曾被称为“药王”？', 0, '', '', '&lt;p&gt;A:孙思邈&lt;/p&gt;&lt;p&gt;B:张仲景&lt;/p&gt;&lt;p&gt;C:李时珍&lt;/p&gt;&lt;p&gt;D:扁鹊&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(903, 1, '公元前594年，实行“初税亩”，按亩收税的国家是：', 0, '', '', '&lt;p&gt;A:楚国&lt;/p&gt;&lt;p&gt;B:鲁国&lt;/p&gt;&lt;p&gt;C:郑国&lt;/p&gt;&lt;p&gt;D:魏国&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(902, 1, '下列战役中，被陈毅元帅称作“人民群众用小车推出来的”是：', 0, '', '', '&lt;p&gt;A:淮海战役&lt;/p&gt;&lt;p&gt;B:平津战役&lt;/p&gt;&lt;p&gt;C:辽沈战役&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(901, 1, '在下列哪一年Internet网延伸入中国？', 0, '', '', '&lt;p&gt;A:93年&lt;/p&gt;&lt;p&gt;B:94年&lt;/p&gt;&lt;p&gt;C:95年&lt;/p&gt;&lt;p&gt;D:96年&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(900, 1, '中国古代哪个学派的主张，与绿色和平组织的思想相近？', 0, '', '', '&lt;p&gt;A:儒家&lt;/p&gt;&lt;p&gt;B:法家&lt;/p&gt;&lt;p&gt;C:佛家&lt;/p&gt;&lt;p&gt;D:道家&lt;/p&gt;&lt;p&gt;E:阴阳&lt;/p&gt;', 5, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(899, 1, '古希腊哪个国家的儿童一出世就要受到严格挑选，体质弱的会被抛之荒野？', 0, '', '', '&lt;p&gt;A:雅典&lt;/p&gt;&lt;p&gt;B:斯巴达&lt;/p&gt;', 2, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(898, 1, '“驸马”最初是指：', 0, '', '', '&lt;p&gt;A:给皇帝养马的人&lt;/p&gt;&lt;p&gt;B:官名&lt;/p&gt;&lt;p&gt;C:给皇帝牵马的人&lt;/p&gt;&lt;p&gt;D:马的名字&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(897, 1, '我国是什么时候采用公历的？', 0, '', '', '&lt;p&gt;A:鸦片战争时期&lt;/p&gt;&lt;p&gt;B:辛亥革命时期&lt;/p&gt;&lt;p&gt;C:建国前夕&lt;/p&gt;&lt;p&gt;D:建国后&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(896, 1, '中国古建筑学科的开拓者是：', 0, '', '', '&lt;p&gt;A:鲁班&lt;/p&gt;&lt;p&gt;B:梁思成&lt;/p&gt;&lt;p&gt;C:杨廷玉&lt;/p&gt;&lt;p&gt;D:童寓&lt;/p&gt;&lt;p&gt;E:吴良镛&lt;/p&gt;&lt;p&gt;F:刘敦桢&lt;/p&gt;', 6, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(895, 1, '“腊八粥”最早起源于：', 0, '', '', '&lt;p&gt;A:祭祀&lt;/p&gt;&lt;p&gt;B:民间庆祝丰收的风俗&lt;/p&gt;&lt;p&gt;C:佛教&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(885, 1, '&lt;p&gt;asd&amp;nbsp;&lt;/p&gt;', 1, 'peadmin', '', '&lt;p&gt;asdas&amp;nbsp;&lt;/p&gt;', 4, 'A', '', '', 1483417538, 1, '', 1, 0, 0),
(886, 1, '&lt;p&gt;asdasdsadsad&lt;/p&gt;', 1, 'peadmin', '', '&lt;p&gt;asdsadsad&lt;/p&gt;', 4, 'A', '&lt;p&gt;asdasdasd&lt;/p&gt;', '', 1485101251, 1, '', 2, 0, 0),
(887, 1, '&lt;p&gt;s阿达撒旦撒打算的222&lt;/p&gt;', 1, 'peadmin', '', '&lt;p&gt;a撒旦撒打算打算&lt;/p&gt;', 4, '&lt;p&gt;A&lt;/p&gt;', '', '', 1486478140, 0, '', 0, 0, 1),
(894, 1, '世界上第一辆摩托车其主要材料是：', 0, '', '', '&lt;p&gt;A:塑料&lt;/p&gt;&lt;p&gt;B:木头&lt;/p&gt;&lt;p&gt;C:铁皮&lt;/p&gt;&lt;p&gt;D:自行车&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(893, 1, '仰韶文化是我国历史上哪个时代中期的文化？', 0, '', '', '&lt;p&gt;A:旧石器&lt;/p&gt;&lt;p&gt;B:新石器&lt;/p&gt;&lt;p&gt;C:青铜器&lt;/p&gt;&lt;p&gt;D:铁器&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1701, 1, '哪位唐代诗人被后人称为“鬼才”？', 0, '', '', '&lt;p&gt;A:李贺&lt;/p&gt;&lt;p&gt;B:李商隐&lt;/p&gt;&lt;p&gt;C:李白&lt;/p&gt;&lt;p&gt;D:杜甫&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1702, 1, '我国最早创办海军学校的人是', 0, '', '', '&lt;p&gt;A:李鸿章&lt;/p&gt;&lt;p&gt;B:左宗堂&lt;/p&gt;&lt;p&gt;C:袁世凯&lt;/p&gt;&lt;p&gt;D:张之洞&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1703, 1, '三国演义中的吕布为什么杀死董卓', 0, '', '', '&lt;p&gt;A:美女&lt;/p&gt;&lt;p&gt;B:财宝&lt;/p&gt;&lt;p&gt;C:名马&lt;/p&gt;&lt;p&gt;D:权利&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1704, 1, '下列不属于“唐宋八大家”之一的是：', 0, '', '', '&lt;p&gt;A:韩愈&lt;/p&gt;&lt;p&gt;B:李白&lt;/p&gt;&lt;p&gt;C:曾巩&lt;/p&gt;&lt;p&gt;D:王安石&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1705, 1, '成为我国上世纪30年代文化革命的主将的是：', 0, '', '', '&lt;p&gt;A:周扬&lt;/p&gt;&lt;p&gt;B:鲁迅&lt;/p&gt;&lt;p&gt;C:郭沫若&lt;/p&gt;&lt;p&gt;D:史量才&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1706, 2, '近代中国反帝民族解放斗争的先导是以(   )为代表(多选)', 0, '', '', '&lt;p&gt;A:林则徐&lt;/p&gt;&lt;p&gt;B:曾国潘&lt;/p&gt;&lt;p&gt;C:魏源&lt;/p&gt;&lt;p&gt;D:张之洞&lt;/p&gt;', 4, 'AC', 'AC', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1707, 1, '人类最先使用的制造器具的金属是', 0, '', '', '&lt;p&gt;A:铁&lt;/p&gt;&lt;p&gt;B:铜&lt;/p&gt;&lt;p&gt;C:银&lt;/p&gt;&lt;p&gt;D:金&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1708, 1, '在中国近代史上，清政府同外国签订的不平等条约中，赔款最多的是：', 0, '', '', '&lt;p&gt;A:马关条约&lt;/p&gt;&lt;p&gt;B:辛丑条约&lt;/p&gt;&lt;p&gt;C:南京条约&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1709, 1, '战国七雄中，在春秋时期称过霸的是（  ）', 0, '', '', '&lt;p&gt;A:齐、赵、燕&lt;/p&gt;&lt;p&gt;B:齐、楚、秦&lt;/p&gt;&lt;p&gt;C:楚、韩、赵&lt;/p&gt;&lt;p&gt;D:越、魏、秦&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1710, 1, '在我国近代最早提出“振兴中华”口号的是：', 0, '', '', '&lt;p&gt;A:毛泽东&lt;/p&gt;&lt;p&gt;B:梁启超&lt;/p&gt;&lt;p&gt;C:孙中山&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1711, 1, '甲骨文的发明地是：', 0, '', '', '&lt;p&gt;A:安阳&lt;/p&gt;&lt;p&gt;B:南阳&lt;/p&gt;&lt;p&gt;C:信阳&lt;/p&gt;&lt;p&gt;D:洛阳&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1712, 1, '60年代哪个国家的宇航员首次登上月球？', 0, '', '', '&lt;p&gt;A:苏联&lt;/p&gt;&lt;p&gt;B:美国&lt;/p&gt;&lt;p&gt;C:中国&lt;/p&gt;&lt;p&gt;D:英国和法国&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1713, 1, '俄罗斯最后一位沙皇是谁：', 0, '', '', '&lt;p&gt;A:尼古拉一世&lt;/p&gt;&lt;p&gt;B:尼古拉二世&lt;/p&gt;&lt;p&gt;C:亚历山大一世&lt;/p&gt;&lt;p&gt;D:亚历山大二世&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1714, 1, '最早侵占中国领土的西方殖民者是（  ）', 0, '', '', '&lt;p&gt;A:日本&lt;/p&gt;&lt;p&gt;B:葡萄牙&lt;/p&gt;&lt;p&gt;C:荷兰&lt;/p&gt;&lt;p&gt;D:沙俄&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1715, 1, '世界上最早的齿孔邮票是哪个国家发行的？', 0, '', '', '&lt;p&gt;A:法国&lt;/p&gt;&lt;p&gt;B:匈牙利&lt;/p&gt;&lt;p&gt;C:英国&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1716, 1, '“乌纱帽”始自哪个朝代', 0, '', '', '&lt;p&gt;A:北宋&lt;/p&gt;&lt;p&gt;B:南宋&lt;/p&gt;&lt;p&gt;C:明世宗&lt;/p&gt;&lt;p&gt;D:唐朝&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1717, 1, '新春燃放爆竹的风俗始于', 0, '', '', '&lt;p&gt;A:秦代&lt;/p&gt;&lt;p&gt;B:汉代&lt;/p&gt;&lt;p&gt;C:唐代&lt;/p&gt;&lt;p&gt;D:宋代&lt;/p&gt;&lt;p&gt;E:元代&lt;/p&gt;&lt;p&gt;F:明代&lt;/p&gt;', 6, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1718, 1, '酸菜是我国北方人喜欢吃的经发酵变酸的白菜，源于', 0, '', '', '&lt;p&gt;A:辽宁&lt;/p&gt;&lt;p&gt;B:吉林&lt;/p&gt;&lt;p&gt;C:黑龙江&lt;/p&gt;&lt;p&gt;D:北京&lt;/p&gt;&lt;p&gt;E:河北&lt;/p&gt;&lt;p&gt;F:山东&lt;/p&gt;', 6, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1719, 1, '古陶的年代鉴别首先应该看', 0, '', '', '&lt;p&gt;A:纹样&lt;/p&gt;&lt;p&gt;B:器形&lt;/p&gt;&lt;p&gt;C:釉色&lt;/p&gt;&lt;p&gt;D:颜色&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1720, 1, '1990年8月伊拉克入侵科威特后，美国大规模出兵干预，即所谓“沙漠风暴”行动。美国采取这个行动的原因是（  ）', 0, '', '', '&lt;p&gt;A:美国人中主持正义&lt;/p&gt;&lt;p&gt;B:联合国要求美国这样做&lt;/p&gt;&lt;p&gt;C:美国和伊拉克是宿敌，伊拉克和行径使美国找到打击伊拉克的机会&lt;/p&gt;&lt;p&gt;D:美国要保护中东的石油资源并维持其在中东的霸权地位&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1721, 1, '我国现存最早的藏书楼宁波天一阁建成于哪个朝代？', 0, '', '', '&lt;p&gt;A:元朝&lt;/p&gt;&lt;p&gt;B:明朝&lt;/p&gt;&lt;p&gt;C:清朝&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1722, 1, '我国第一家通讯社中兴通讯社于1904年在哪座城市创办？', 0, '', '', '&lt;p&gt;A:上海&lt;/p&gt;&lt;p&gt;B:广州&lt;/p&gt;&lt;p&gt;C:天津&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1723, 1, '在古代唐朝的皇宫里，夏天由宫女推动高大的水车，将水洒到宫殿的房顶上，水再顺房四周流下，这样做的主要目的是', 0, '', '', '&lt;p&gt;A:为了新奇、美观&lt;/p&gt;&lt;p&gt;B:为了寻欢作乐&lt;/p&gt;&lt;p&gt;C:为了清洁房顶&lt;/p&gt;&lt;p&gt;D:为了解暑降温&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1724, 1, '西汉时，有一名将，前后七次率军出击匈奴，屡建奇功，死后被追封为“烈侯”，他是谁？', 0, '', '', '&lt;p&gt;A:李广&lt;/p&gt;&lt;p&gt;B:卫青&lt;/p&gt;&lt;p&gt;C:霍去病&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1725, 1, '公元222年，以少胜多，火烧连营七百里，大败刘备的吴国名将是谁？', 0, '', '', '&lt;p&gt;A:吕蒙&lt;/p&gt;&lt;p&gt;B:周瑜&lt;/p&gt;&lt;p&gt;C:陆逊&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1726, 1, '人类的第一张照片是什么时候诞生的？', 0, '', '', '&lt;p&gt;A:1788年&lt;/p&gt;&lt;p&gt;B:1802年&lt;/p&gt;&lt;p&gt;C:1826年&lt;/p&gt;&lt;p&gt;D:1843年&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1727, 1, '明朝最后一个皇帝崇祯皇帝的号是什么？', 0, '', '', '&lt;p&gt;A:明神宗&lt;/p&gt;&lt;p&gt;B:明英宗&lt;/p&gt;&lt;p&gt;C:明思宗&lt;/p&gt;&lt;p&gt;D:明宣宗&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1728, 1, '顺治七年（1650）底多尔衮死后，清世祖福临为了加强对八旗的控制，对八旗的顺序进行了调整。由皇帝控制的哪三旗，称为上三旗？', 0, '', '', '&lt;p&gt;A:镶黄、正黄、正白&lt;/p&gt;&lt;p&gt;B:正黄、正红、正白&lt;/p&gt;&lt;p&gt;C:正白、镶白、正蓝&lt;/p&gt;&lt;p&gt;D:正红、镶红、镶黄&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1729, 1, '下列哪个皇帝迁都北京？', 0, '', '', '&lt;p&gt;A:朱元璋&lt;/p&gt;&lt;p&gt;B:朱隶&lt;/p&gt;&lt;p&gt;C:朱由检&lt;/p&gt;&lt;p&gt;D:爱新觉罗。玄烨&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1730, 1, '“大禹治水”主要治理的是：', 0, '', '', '&lt;p&gt;A:泾水&lt;/p&gt;&lt;p&gt;B:渭水&lt;/p&gt;&lt;p&gt;C:黄河&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1731, 1, '欧元于何时正式诞生', 0, '', '', '&lt;p&gt;A:1998年12月31日&lt;/p&gt;&lt;p&gt;B:1999年1月1日&lt;/p&gt;&lt;p&gt;C:1999年12月31日&lt;/p&gt;&lt;p&gt;D:2000年1月1日&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1732, 1, '下面哪个皇帝率清兵入关？', 0, '', '', '&lt;p&gt;A:爱新觉罗.玄烨&lt;/p&gt;&lt;p&gt;B:爱新觉罗.弘历&lt;/p&gt;&lt;p&gt;C:爱新觉罗.努尔哈赤&lt;/p&gt;&lt;p&gt;D:爱新觉罗.福临&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1733, 1, '正月初一吃饺子这一习惯是从什么朝代开始', 0, '', '', '&lt;p&gt;A:唐&lt;/p&gt;&lt;p&gt;B:元&lt;/p&gt;&lt;p&gt;C:明&lt;/p&gt;&lt;p&gt;D:清&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1734, 1, '挥剑决浮云，诸侯尽西来是说那个皇帝的？', 0, '', '', '&lt;p&gt;A:汉武帝&lt;/p&gt;&lt;p&gt;B:汉高祖&lt;/p&gt;&lt;p&gt;C:秦始皇&lt;/p&gt;&lt;p&gt;D:唐太宗&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1735, 1, '世界上最早的温标为', 0, '', '', '&lt;p&gt;A:华氏温标&lt;/p&gt;&lt;p&gt;B:摄氏温标&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1736, 1, '我国在本国西部地区第一次成功地爆炸了一颗原子弹是在哪一年？', 0, '', '', '&lt;p&gt;A:1960年&lt;/p&gt;&lt;p&gt;B:1962年&lt;/p&gt;&lt;p&gt;C:1964年&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1737, 1, '下列哪个事件不是发生在20世纪50年代', 0, '', '', '&lt;p&gt;A:大跃进&lt;/p&gt;&lt;p&gt;B:三反五反&lt;/p&gt;&lt;p&gt;C:四清&lt;/p&gt;&lt;p&gt;D:批胡风&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1738, 1, '武则天是下面哪个皇帝的母亲？', 0, '', '', '&lt;p&gt;A:唐高宗&lt;/p&gt;&lt;p&gt;B:唐玄宗&lt;/p&gt;&lt;p&gt;C:唐中宗&lt;/p&gt;&lt;p&gt;D:唐太宗&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1739, 1, '我国封建法典中规定的“十恶”不赦大罪始于（　　　）', 0, '', '', '&lt;p&gt;A:《秦律》&lt;/p&gt;&lt;p&gt;B:《北齐律》&lt;/p&gt;&lt;p&gt;C:《唐律》&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1740, 1, '中国历史上开始有确切的纪年是哪一年？', 0, '', '', '&lt;p&gt;A:太初元年&lt;/p&gt;&lt;p&gt;B:共和元年　&lt;/p&gt;&lt;p&gt;C:太始元年&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1741, 1, '为自己立了一块《无字碑》，以供后人评说的古代政治家是谁？', 0, '', '', '&lt;p&gt;A:唐太宗&lt;/p&gt;&lt;p&gt;B:曹操&lt;/p&gt;&lt;p&gt;C:武则天&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1742, 1, '中国最早的院士产生于哪一年？', 0, '', '', '&lt;p&gt;A:1946&lt;/p&gt;&lt;p&gt;B:1948&lt;/p&gt;&lt;p&gt;C:1953&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1743, 1, '我国唐朝时，曾把‘希伯来”译为什么？', 0, '', '', '&lt;p&gt;A:匈奴&lt;/p&gt;&lt;p&gt;B:石忽&lt;/p&gt;&lt;p&gt;C:一赐乐业&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1744, 2, '谜语在清朝时又叫作（多选）', 0, '', '', '&lt;p&gt;A:谜子&lt;/p&gt;&lt;p&gt;B:藏头&lt;/p&gt;&lt;p&gt;C:切口&lt;/p&gt;&lt;p&gt;D:歇后&lt;/p&gt;', 4, 'AC', 'AC', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1745, 1, '清乾隆37年开始编纂的（　　），用十年编写成，包括了我国几千年的重要文化典籍，共25万多册。', 0, '', '', '&lt;p&gt;A:《资治通鉴》&lt;/p&gt;&lt;p&gt;B:《永乐大典》&lt;/p&gt;&lt;p&gt;C:《四库全书》&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1746, 1, '历史上出现的&quot;文景之治&quot;、&quot;贞观之治&quot;是运用了谁的贵清静思想原则', 0, '', '', '&lt;p&gt;A:孙子&lt;/p&gt;&lt;p&gt;B:老子&lt;/p&gt;&lt;p&gt;C:孟子&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1747, 1, '1921年来华积极帮助创建中国共产党的共产国际代表马林是哪国人？', 0, '', '', '&lt;p&gt;A:苏联人&lt;/p&gt;&lt;p&gt;B:德国人&lt;/p&gt;&lt;p&gt;C:荷兰人&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1748, 1, '1947年8月起至解放战争结束担任中央委总参谋长的是谁？', 0, '', '', '&lt;p&gt;A:周恩来&lt;/p&gt;&lt;p&gt;B:叶剑英&lt;/p&gt;&lt;p&gt;C:彭德怀&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1749, 1, '秋瑾是什么时期的著名女革命家？', 0, '', '', '&lt;p&gt;A:戍戌政变时期&lt;/p&gt;&lt;p&gt;B:辛亥革命时期&lt;/p&gt;&lt;p&gt;C:五四运动时期&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1750, 1, '火烧园明园事件发生于哪一年？', 0, '', '', '&lt;p&gt;A:1848年&lt;/p&gt;&lt;p&gt;B:1860年&lt;/p&gt;&lt;p&gt;C:1880年&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1751, 1, '中华人民共和国首都是北京。从哪个朝代起她就开始成为全国政治中心的历史？', 0, '', '', '&lt;p&gt;A:唐代&lt;/p&gt;&lt;p&gt;B:宋代&lt;/p&gt;&lt;p&gt;C:元代&lt;/p&gt;', 3, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1752, 1, '中国封建帝王即位时间最长的是哪位皇帝？', 0, '', '', '&lt;p&gt;A:唐太宗　李世民&lt;/p&gt;&lt;p&gt;B:宋仁宗　赵祯&lt;/p&gt;&lt;p&gt;C:明神宗　朱翊钧&lt;/p&gt;&lt;p&gt;D:清圣祖　玄烨&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1753, 1, '西安交大西迁始于（）年', 0, '', '', '&lt;p&gt;A:1956&lt;/p&gt;&lt;p&gt;B:1958&lt;/p&gt;&lt;p&gt;C:1960&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1754, 1, '春联正式起始于什么皇帝', 0, '', '', '&lt;p&gt;A:明太祖&lt;/p&gt;&lt;p&gt;B:宋太祖&lt;/p&gt;&lt;p&gt;C:唐太祖&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1755, 1, '&lt;&lt;人民日报&gt;&gt;创刊于', 0, '', '', '&lt;p&gt;A:五四时期&lt;/p&gt;&lt;p&gt;B:解放战争时期&lt;/p&gt;&lt;p&gt;C:抗日战争时期&lt;/p&gt;&lt;p&gt;D:国共十年对峙时期&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1756, 1, '&quot;东风不与周郎便,铜雀春深锁二乔&quot;写的是哪一场战役?', 0, '', '', '&lt;p&gt;A:赤壁之战&lt;/p&gt;&lt;p&gt;B:长勺之战&lt;/p&gt;', 2, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 1),
(1757, 1, '我国最早的女史学家是?', 0, '', '', '&lt;p&gt;A:班昭&lt;/p&gt;&lt;p&gt;B:蔡琰&lt;/p&gt;&lt;p&gt;C:李清照&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1758, 1, '东汉末年农民起义领袖是哪一位?', 0, '', '', '&lt;p&gt;A:张角&lt;/p&gt;&lt;p&gt;B:李自成&lt;/p&gt;&lt;p&gt;C:黄巢&lt;/p&gt;', 3, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1759, 1, '世界上第一个发现地磁偏角中国人是：', 0, '', '', '&lt;p&gt;A:祖冲之&lt;/p&gt;&lt;p&gt;B:沈括&lt;/p&gt;&lt;p&gt;C:张衡&lt;/p&gt;', 3, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1760, 1, '人类第一次登月是在哪年？', 0, '', '', '&lt;p&gt;A:1965&lt;/p&gt;&lt;p&gt;B:1966&lt;/p&gt;&lt;p&gt;C:1969&lt;/p&gt;&lt;p&gt;D:1972&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1761, 1, '世界上第一辆自行车是由什么材料制成的？', 0, '', '', '&lt;p&gt;A:铁&lt;/p&gt;&lt;p&gt;B:铝&lt;/p&gt;&lt;p&gt;C:锌&lt;/p&gt;&lt;p&gt;D:木头&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1762, 1, '诸葛亮第六次伐魏时谁曾到营中诈降？', 0, '', '', '&lt;p&gt;A:岑威&lt;/p&gt;&lt;p&gt;B:郑文&lt;/p&gt;&lt;p&gt;C:秦明&lt;/p&gt;&lt;p&gt;D:杜睿&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1763, 1, '曹操为收买樊城百姓人心，派谁去说降刘备？', 0, '', '', '&lt;p&gt;A:蒋干&lt;/p&gt;&lt;p&gt;B:满宠&lt;/p&gt;&lt;p&gt;C:荀彧&lt;/p&gt;&lt;p&gt;D:徐庶&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1764, 1, '谁在葭萌关下挑灯夜斗，不分胜负？', 0, '', '', '&lt;p&gt;A:张飞-马超&lt;/p&gt;&lt;p&gt;B:张飞-马岱&lt;/p&gt;&lt;p&gt;C:赵云-马超&lt;/p&gt;&lt;p&gt;D:黄忠-马超&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1765, 1, '因暗杀未遂，被曹操断九指，割舌，分肢体而死的是谁？', 0, '', '', '&lt;p&gt;A:华佗&lt;/p&gt;&lt;p&gt;B:吉平&lt;/p&gt;&lt;p&gt;C:王子服&lt;/p&gt;&lt;p&gt;D:种辑&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1766, 1, '&lt;p&gt;诸葛亮常自比管仲和谁？&lt;/p&gt;', 0, '', '', '&lt;p&gt;A:乐毅&amp;nbsp; B:张良&amp;nbsp; C:孙武&amp;nbsp; D:姜子牙&lt;/p&gt;', 4, 'A', '&lt;p&gt;A&lt;/p&gt;', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1767, 1, '周瑜为何要派诸葛亮去聚铁山袭击曹军？', 0, '', '', '&lt;p&gt;A:借曹操子手杀死诸葛亮&lt;/p&gt;&lt;p&gt;B:探明曹军的军事部署&lt;/p&gt;&lt;p&gt;C:试探刘备的实力&lt;/p&gt;&lt;p&gt;D:试探诸葛亮的才智&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1768, 1, '谁曾因谏司马昭不可伐蜀而被杀？', 0, '', '', '&lt;p&gt;A:胡烈&lt;/p&gt;&lt;p&gt;B:夏侯咸&lt;/p&gt;&lt;p&gt;C:句安&lt;/p&gt;&lt;p&gt;D:邓敦&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1769, 1, '在第二次世界大战时期，当德军封锁列宁格勒的时候，有一条被称为“生命之路”的湖，它的命名字是什么：', 0, '', '', '&lt;p&gt;A:拉多加湖&lt;/p&gt;&lt;p&gt;B:贝加尔湖&lt;/p&gt;&lt;p&gt;C:伏尔加湖&lt;/p&gt;&lt;p&gt;D:涅瓦湖&lt;/p&gt;', 4, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1770, 1, '最近的一次俄罗斯全国性的人口普查是在哪一年：', 0, '', '', '&lt;p&gt;A:1992&lt;/p&gt;&lt;p&gt;B:1996&lt;/p&gt;&lt;p&gt;C:1999&lt;/p&gt;&lt;p&gt;D:2002&lt;/p&gt;', 4, 'D', 'D', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1771, 1, '普京什么时候当选俄罗斯总统，他是第几任：', 0, '', '', '&lt;p&gt;A:2001年，第二任&lt;/p&gt;&lt;p&gt;B:2000年，第三任&lt;/p&gt;&lt;p&gt;C:2000年，第二任&lt;/p&gt;&lt;p&gt;D:2002年，第三任&lt;/p&gt;', 4, 'C', 'C', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1772, 1, '在俄罗斯总共进行过几次车臣战争：', 0, '', '', '&lt;p&gt;A:1&lt;/p&gt;&lt;p&gt;B:2&lt;/p&gt;&lt;p&gt;C:3&lt;/p&gt;&lt;p&gt;D:4&lt;/p&gt;', 4, 'B', 'B', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2),
(1773, 1, '包括我们地球在类的太阳系诞生于50亿年前，那么地球上的生命诞生于多少年前？', 0, '', '', '&lt;p&gt;A:40亿年前&lt;/p&gt;&lt;p&gt;B:20亿年前&lt;/p&gt;&lt;p&gt;C:10亿年前&lt;/p&gt;&lt;p&gt;D:1亿年前&lt;/p&gt;&lt;p&gt;E:500万年前&lt;/p&gt;', 5, 'A', 'A', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 3),
(1774, 1, '&lt;p&gt;人类诞生于多少年前？&lt;/p&gt;', 0, '', '', '&lt;p&gt;A:1亿年前&lt;/p&gt;\r\n\r\n&lt;p&gt;B:500万年前&lt;/p&gt;\r\n\r\n&lt;p&gt;C:100万年前&lt;/p&gt;\r\n\r\n&lt;p&gt;D:5千年前&lt;/p&gt;', 4, 'B', '&lt;p&gt;B&lt;/p&gt;', 'a:1:{i:0;a:2:{s:7:\"knowsid\";s:1:\"1\";s:5:\"knows\";s:15:\"演示知识点\";}}', 1513608081, 1, '', 0, 0, 2);

-- --------------------------------------------------------

--
-- 表的结构 `x2_questype`
--

CREATE TABLE `x2_questype` (
  `questid` int(11) NOT NULL,
  `questype` varchar(60) NOT NULL DEFAULT '',
  `questsort` int(1) NOT NULL DEFAULT '0',
  `questchoice` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_questype`
--

INSERT INTO `x2_questype` (`questid`, `questype`, `questsort`, `questchoice`) VALUES
(1, '单选题', 0, 1),
(2, '多选题', 0, 2),
(3, '判断题', 0, 4),
(4, '定值填空', 0, 5),
(5, '填空题', 1, 2),
(6, '问答题', 1, 3);

-- --------------------------------------------------------

--
-- 表的结构 `x2_record`
--

CREATE TABLE `x2_record` (
  `recordid` int(11) NOT NULL,
  `recordquestionid` int(11) NOT NULL DEFAULT '0',
  `recorduserid` int(11) NOT NULL DEFAULT '0',
  `recordquestion` text NOT NULL,
  `recordtime` int(11) NOT NULL DEFAULT '0',
  `recordsubjectid` int(11) NOT NULL DEFAULT '0',
  `recordknowsid` int(11) NOT NULL DEFAULT '0',
  `recordquestype` int(11) NOT NULL DEFAULT '0',
  `recordexamid` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `x2_reply`
--

CREATE TABLE `x2_reply` (
  `replyid` int(11) NOT NULL,
  `replyuserid` int(11) NOT NULL DEFAULT '0',
  `replyusername` varchar(120) NOT NULL DEFAULT '',
  `replycommentid` int(11) NOT NULL DEFAULT '0',
  `replytime` int(11) NOT NULL DEFAULT '0',
  `replycontent` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `x2_sections`
--

CREATE TABLE `x2_sections` (
  `sectionid` int(11) NOT NULL,
  `section` varchar(120) NOT NULL DEFAULT '',
  `sectionsubjectid` int(11) NOT NULL DEFAULT '0',
  `sectiondescribe` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_sections`
--

INSERT INTO `x2_sections` (`sectionid`, `section`, `sectionsubjectid`, `sectiondescribe`) VALUES
(1, '演示章节', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `x2_seminar`
--

CREATE TABLE `x2_seminar` (
  `seminarid` int(11) NOT NULL,
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
  `seminarsequence` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `x2_session`
--

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
  `sessionmaster` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_session`
--

INSERT INTO `x2_session` (`sessionid`, `sessionuserid`, `sessionusername`, `sessionpassword`, `sessionip`, `sessionmanage`, `sessiongroupid`, `sessioncurrent`, `sessionrandcode`, `sessionlogintime`, `sessiontimelimit`, `sessionlasttime`, `sessionmaster`) VALUES
('o1589v42dm3hcdbjhss3i3m665', 1, 'peadmin', '244153a2599be7685c32d2281f57ae67', '127.0.0.1', 0, 1, '1', 'ACT4', 1521037658, 1521037658, 1521129856, 0);

-- --------------------------------------------------------

--
-- 表的结构 `x2_special`
--

CREATE TABLE `x2_special` (
  `specialid` int(11) NOT NULL,
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
  `contenttext` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `x2_specialsort`
--

CREATE TABLE `x2_specialsort` (
  `sortid` int(11) NOT NULL,
  `sorttitle` varchar(240) NOT NULL DEFAULT '',
  `sortthumb` varchar(120) NOT NULL DEFAULT '',
  `sorttpl` varchar(24) NOT NULL DEFAULT '',
  `sortseminarid` int(11) NOT NULL DEFAULT '0',
  `sortsequence` int(11) NOT NULL DEFAULT '0',
  `sortdescribe` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `x2_subject`
--

CREATE TABLE `x2_subject` (
  `subjectid` int(11) NOT NULL,
  `subject` varchar(120) NOT NULL DEFAULT '',
  `subjectsetting` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_subject`
--

INSERT INTO `x2_subject` (`subjectid`, `subject`, `subjectsetting`) VALUES
(1, '演示课程', 'a:1:{s:9:\"questypes\";a:4:{i:1;s:1:\"1\";i:2;s:1:\"1\";i:3;s:1:\"1\";i:6;s:1:\"1\";}}');

-- --------------------------------------------------------

--
-- 表的结构 `x2_user`
--

CREATE TABLE `x2_user` (
  `userid` int(11) NOT NULL,
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
  `photo` varchar(120) NOT NULL DEFAULT '',
  `usertruename` varchar(24) NOT NULL DEFAULT '',
  `normal_favor` varchar(250) NOT NULL DEFAULT '',
  `teacher_subjects` text NOT NULL,
  `userischeck` int(1) NOT NULL,
  `userprofile` text NOT NULL,
  `usersequence` int(11) NOT NULL,
  `userreferrer` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_user`
--

INSERT INTO `x2_user` (`userid`, `useropenid`, `username`, `useremail`, `userpassword`, `usercoin`, `userregip`, `userregtime`, `userlogtime`, `userverifytime`, `usergroupid`, `usermoduleid`, `manager_apps`, `photo`, `usertruename`, `normal_favor`, `teacher_subjects`, `userischeck`, `userprofile`, `usersequence`, `userreferrer`) VALUES
(1, '', 'peadmin', '7300637@qq.com', '244153a2599be7685c32d2281f57ae67', 220, '127.0.0.1', 1471795200, 0, NULL, 1, 0, 'a:5:{i:0;s:4:\"user\";i:1;s:7:\"content\";i:2;s:4:\"exam\";i:3;s:6:\"course\";i:4;s:4:\"bank\";}', 'files/attach/images/content/20170717/15002573305180.png', 'test', '', '', 0, '', 2, 0),
(2, '', '教师管理员', 'i@oiuv.cn', '96e79218965eb72c92a549dd5a330112', 0, '127.0.0.1', 1471795200, 0, NULL, 9, 0, '', 'app/core/styles/img/noimage.gif', '', '', 'a:1:{i:0;s:1:\"1\";}', 0, '', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `x2_user_group`
--

CREATE TABLE `x2_user_group` (
  `groupid` int(11) NOT NULL,
  `groupname` varchar(60) NOT NULL DEFAULT '',
  `groupmoduleid` tinyint(4) NOT NULL DEFAULT '0',
  `groupdescribe` tinytext NOT NULL,
  `groupright` text NOT NULL,
  `groupmoduledefault` int(1) NOT NULL DEFAULT '0',
  `groupdefault` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `x2_user_group`
--

INSERT INTO `x2_user_group` (`groupid`, `groupname`, `groupmoduleid`, `groupdescribe`, `groupright`, `groupmoduledefault`, `groupdefault`) VALUES
(1, '管理员', 1, '管理员', '', 1, 0),
(8, '普通用户', 9, '普通用户', '', 0, 1),
(9, '教师', 12, '教师', '', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `x2_app`
--
ALTER TABLE `x2_app`
  ADD PRIMARY KEY (`appid`),
  ADD KEY `appstatus` (`appstatus`);

--
-- Indexes for table `x2_area`
--
ALTER TABLE `x2_area`
  ADD PRIMARY KEY (`areaid`),
  ADD KEY `area` (`area`,`arealevel`),
  ADD KEY `areacode` (`areacode`);

--
-- Indexes for table `x2_attach`
--
ALTER TABLE `x2_attach`
  ADD PRIMARY KEY (`attid`),
  ADD KEY `attext` (`attext`,`attinputtime`),
  ADD KEY `attuserid` (`attuserid`),
  ADD KEY `attcntype` (`attcntype`);

--
-- Indexes for table `x2_attachtype`
--
ALTER TABLE `x2_attachtype`
  ADD PRIMARY KEY (`atid`),
  ADD KEY `attachtype` (`attachtype`);

--
-- Indexes for table `x2_basic`
--
ALTER TABLE `x2_basic`
  ADD PRIMARY KEY (`basicid`),
  ADD KEY `basicexamid` (`basicareaid`),
  ADD KEY `basicsubjectid` (`basicsubjectid`),
  ADD KEY `basicapi` (`basicapi`),
  ADD KEY `basicdemo` (`basicdemo`),
  ADD KEY `basicclosed` (`basicclosed`);

--
-- Indexes for table `x2_block`
--
ALTER TABLE `x2_block`
  ADD PRIMARY KEY (`blockid`),
  ADD KEY `blocktype` (`blocktype`);

--
-- Indexes for table `x2_book`
--
ALTER TABLE `x2_book`
  ADD PRIMARY KEY (`bookid`),
  ADD KEY `bookopenid` (`bookopenid`),
  ADD KEY `booktime` (`booktime`),
  ADD KEY `bookuserid` (`bookuserid`);

--
-- Indexes for table `x2_category`
--
ALTER TABLE `x2_category`
  ADD PRIMARY KEY (`catid`),
  ADD KEY `catlite` (`catlite`,`catparent`),
  ADD KEY `catappid` (`catapp`),
  ADD KEY `catuseurl` (`catuseurl`),
  ADD KEY `catinmenu` (`catinmenu`,`catindex`),
  ADD KEY `catsubject` (`catsubject`);

--
-- Indexes for table `x2_cequeue`
--
ALTER TABLE `x2_cequeue`
  ADD PRIMARY KEY (`ceqid`),
  ADD KEY `cequserid` (`cequserid`),
  ADD KEY `ceqtime` (`ceqtime`),
  ADD KEY `ceqstatus` (`ceqstatus`),
  ADD KEY `ceqordersn` (`ceqordersn`),
  ADD KEY `ceqceid` (`ceqceid`);

--
-- Indexes for table `x2_certificate`
--
ALTER TABLE `x2_certificate`
  ADD PRIMARY KEY (`ceid`),
  ADD KEY `cebasic` (`cebasic`);

--
-- Indexes for table `x2_comment`
--
ALTER TABLE `x2_comment`
  ADD PRIMARY KEY (`cmtid`),
  ADD KEY `cmtuserid` (`cmtuserid`),
  ADD KEY `cmtapp` (`cmtopenid`,`cmttime`);

--
-- Indexes for table `x2_config`
--
ALTER TABLE `x2_config`
  ADD PRIMARY KEY (`cfgapp`);

--
-- Indexes for table `x2_consumelog`
--
ALTER TABLE `x2_consumelog`
  ADD PRIMARY KEY (`conlid`),
  ADD KEY `conluserid` (`conluserid`,`conltype`,`conltime`);

--
-- Indexes for table `x2_content`
--
ALTER TABLE `x2_content`
  ADD PRIMARY KEY (`contentid`),
  ADD KEY `contentuserid` (`contentuserid`,`contentinputtime`,`contentmodifytime`,`contentsequence`),
  ADD KEY `contentmoduleid` (`contentmoduleid`),
  ADD KEY `contentcatid` (`contentcatid`),
  ADD KEY `contentstatus` (`contentstatus`);

--
-- Indexes for table `x2_coupon`
--
ALTER TABLE `x2_coupon`
  ADD PRIMARY KEY (`couponsn`),
  ADD KEY `couponstatus` (`couponstatus`,`couponendtime`),
  ADD KEY `couponaddtime` (`couponaddtime`);

--
-- Indexes for table `x2_course`
--
ALTER TABLE `x2_course`
  ADD PRIMARY KEY (`courseid`),
  ADD KEY `coursecsid` (`coursecsid`,`courseuserid`,`courseinputtime`,`coursemodifytime`,`coursesequence`),
  ADD KEY `coursemoduleid` (`coursemoduleid`);

--
-- Indexes for table `x2_coursesubject`
--
ALTER TABLE `x2_coursesubject`
  ADD PRIMARY KEY (`csid`),
  ADD KEY `csbasicid` (`csbasicid`,`cssubjectid`,`cstime`),
  ADD KEY `cscatid` (`cscatid`),
  ADD KEY `cuserid` (`csuserid`),
  ADD KEY `cssequence` (`cssequence`);

--
-- Indexes for table `x2_dayexam`
--
ALTER TABLE `x2_dayexam`
  ADD PRIMARY KEY (`deid`),
  ADD UNIQUE KEY `deday` (`deday`);

--
-- Indexes for table `x2_dochistory`
--
ALTER TABLE `x2_dochistory`
  ADD PRIMARY KEY (`dhid`),
  ADD KEY `dhtime` (`dhtime`),
  ADD KEY `dhstatus` (`dhstatus`),
  ADD KEY `dhtop` (`dhtop`),
  ADD KEY `dhdocid` (`dhdocid`),
  ADD KEY `dhusername` (`dhusername`);

--
-- Indexes for table `x2_docs`
--
ALTER TABLE `x2_docs`
  ADD PRIMARY KEY (`docid`),
  ADD KEY `doctitle` (`doctitle`),
  ADD KEY `doccatid` (`doccatid`),
  ADD KEY `doccontentid` (`doccontentid`),
  ADD KEY `docinputtime` (`docinputtime`),
  ADD KEY `docmodifytime` (`docmodifytime`),
  ADD KEY `doclocker` (`doclocker`) USING BTREE,
  ADD KEY `doclocktime` (`doclocktime`),
  ADD KEY `docsyslock` (`docsyslock`),
  ADD KEY `docsequence` (`docsequence`),
  ADD KEY `docistop` (`docistop`);

--
-- Indexes for table `x2_examhistory`
--
ALTER TABLE `x2_examhistory`
  ADD PRIMARY KEY (`ehid`),
  ADD KEY `ehtype` (`ehtype`,`ehbasicid`,`ehtime`,`ehuserid`),
  ADD KEY `ehdecide` (`ehdecide`),
  ADD KEY `ehexamid` (`ehexamid`),
  ADD KEY `examopenid` (`ehopenid`),
  ADD KEY `ehneedresit` (`ehneedresit`),
  ADD KEY `ehispass` (`ehispass`);

--
-- Indexes for table `x2_exams`
--
ALTER TABLE `x2_exams`
  ADD PRIMARY KEY (`examid`),
  ADD KEY `examstatus` (`examstatus`),
  ADD KEY `examtype` (`examtype`,`examauthorid`),
  ADD KEY `examtime` (`examtime`),
  ADD KEY `examsubject` (`examsubject`),
  ADD KEY `examdecide` (`examdecide`);

--
-- Indexes for table `x2_examsession`
--
ALTER TABLE `x2_examsession`
  ADD PRIMARY KEY (`examsessionid`),
  ADD KEY `examsessionstarttime` (`examsessionstarttime`),
  ADD KEY `examsessionstatus` (`examsessionstatus`),
  ADD KEY `examsessiontype` (`examsessiontype`),
  ADD KEY `examsessionkey` (`examsessionkey`),
  ADD KEY `examsubject` (`examsessionbasic`),
  ADD KEY `examsessionissave` (`examsessionissave`),
  ADD KEY `examsessionuserid` (`examsessionuserid`);

--
-- Indexes for table `x2_exercise`
--
ALTER TABLE `x2_exercise`
  ADD PRIMARY KEY (`exerid`),
  ADD KEY `exeruserid` (`exeruserid`),
  ADD KEY `exerbasicid` (`exerbasicid`),
  ADD KEY `exerknowsid` (`exerknowsid`);

--
-- Indexes for table `x2_favor`
--
ALTER TABLE `x2_favor`
  ADD PRIMARY KEY (`favorid`),
  ADD KEY `favoruserid` (`favoruserid`,`favorquestionid`,`favortime`),
  ADD KEY `favorsubjectid` (`favorsubjectid`);

--
-- Indexes for table `x2_feedback`
--
ALTER TABLE `x2_feedback`
  ADD PRIMARY KEY (`fbid`),
  ADD KEY `fbquestionid` (`fbquestionid`,`fbuserid`),
  ADD KEY `fbtype` (`fbtype`);

--
-- Indexes for table `x2_gbook`
--
ALTER TABLE `x2_gbook`
  ADD PRIMARY KEY (`gbid`),
  ADD KEY `gbtime` (`gbtime`),
  ADD KEY `gbreplytime` (`gbreplytime`),
  ADD KEY `gbstatus` (`gbstatus`);

--
-- Indexes for table `x2_knows`
--
ALTER TABLE `x2_knows`
  ADD PRIMARY KEY (`knowsid`),
  ADD KEY `knows` (`knows`,`knowssectionid`),
  ADD KEY `knowsstatus` (`knowsstatus`);

--
-- Indexes for table `x2_log`
--
ALTER TABLE `x2_log`
  ADD PRIMARY KEY (`logid`),
  ADD KEY `loguserid` (`loguserid`,`logcourseid`),
  ADD KEY `logtime` (`logtime`);

--
-- Indexes for table `x2_module`
--
ALTER TABLE `x2_module`
  ADD PRIMARY KEY (`moduleid`),
  ADD UNIQUE KEY `modulecode` (`modulecode`),
  ADD KEY `modulename` (`modulename`),
  ADD KEY `moduleapp` (`moduleapp`),
  ADD KEY `moduleallowreg` (`moduleallowreg`),
  ADD KEY `modulestatus` (`modulestatus`);

--
-- Indexes for table `x2_module_fields`
--
ALTER TABLE `x2_module_fields`
  ADD PRIMARY KEY (`fieldid`),
  ADD KEY `field` (`field`,`fieldlock`),
  ADD KEY `fieldmoduleid` (`fieldmoduleid`),
  ADD KEY `fieldsequence` (`fieldsequence`),
  ADD KEY `fieldsystem` (`fieldsystem`),
  ADD KEY `fieldpublic` (`fieldpublic`),
  ADD KEY `fieldappid` (`fieldappid`);

--
-- Indexes for table `x2_openbasics`
--
ALTER TABLE `x2_openbasics`
  ADD PRIMARY KEY (`obid`),
  ADD KEY `oluserid` (`obuserid`,`obbasicid`,`obtime`,`obendtime`);

--
-- Indexes for table `x2_opencourse`
--
ALTER TABLE `x2_opencourse`
  ADD PRIMARY KEY (`ocid`),
  ADD KEY `ocuserid` (`ocuserid`,`occourseid`);

--
-- Indexes for table `x2_orders`
--
ALTER TABLE `x2_orders`
  ADD PRIMARY KEY (`ordersn`),
  ADD KEY `orderprice` (`orderprice`,`ordercreatetime`,`orderpaytime`),
  ADD KEY `orderuserid` (`orderuserid`);

--
-- Indexes for table `x2_poscontent`
--
ALTER TABLE `x2_poscontent`
  ADD PRIMARY KEY (`pcid`),
  ADD KEY `pcposid` (`pcposid`,`pccontentid`,`pcsequence`),
  ADD KEY `pctime` (`pctime`);

--
-- Indexes for table `x2_position`
--
ALTER TABLE `x2_position`
  ADD PRIMARY KEY (`posid`);

--
-- Indexes for table `x2_product`
--
ALTER TABLE `x2_product`
  ADD PRIMARY KEY (`productid`),
  ADD KEY `partnercode` (`productcode`),
  ADD KEY `productpartnerid` (`productpartnerid`),
  ADD KEY `producttype` (`producttype`);

--
-- Indexes for table `x2_progress`
--
ALTER TABLE `x2_progress`
  ADD PRIMARY KEY (`prsid`),
  ADD KEY `prsuserid` (`prsuserid`),
  ADD KEY `prscoursestatus` (`prscoursestatus`),
  ADD KEY `prsexamstatus` (`prsexamstatus`),
  ADD KEY `prstatus` (`prstatus`),
  ADD KEY `prscourseid` (`prscourseid`),
  ADD KEY `prsexamid` (`prsexamid`);

--
-- Indexes for table `x2_quest2knows`
--
ALTER TABLE `x2_quest2knows`
  ADD PRIMARY KEY (`qkid`),
  ADD KEY `qkquestionid` (`qkquestionid`,`qkknowsid`),
  ADD KEY `qktype` (`qktype`);

--
-- Indexes for table `x2_questionanalysis`
--
ALTER TABLE `x2_questionanalysis`
  ADD PRIMARY KEY (`qaid`),
  ADD KEY `qabasicid` (`qabasicid`),
  ADD KEY `qaquestionid` (`qaquestionid`),
  ADD KEY `qauserid` (`qauserid`);

--
-- Indexes for table `x2_questionrows`
--
ALTER TABLE `x2_questionrows`
  ADD PRIMARY KEY (`qrid`),
  ADD KEY `qrlevel` (`qrlevel`,`qrnumber`),
  ADD KEY `qruserid` (`qruserid`),
  ADD KEY `qrtime` (`qrtime`),
  ADD KEY `qrstatus` (`qrstatus`),
  ADD KEY `qrtype` (`qrtype`);

--
-- Indexes for table `x2_questions`
--
ALTER TABLE `x2_questions`
  ADD PRIMARY KEY (`questionid`),
  ADD KEY `questioncreatetime` (`questioncreatetime`),
  ADD KEY `questiontype` (`questiontype`),
  ADD KEY `questionstatus` (`questionstatus`),
  ADD KEY `questionuserid` (`questionuserid`),
  ADD KEY `questionparent` (`questionparent`,`questionsequence`),
  ADD KEY `questionlevel` (`questionlevel`);

--
-- Indexes for table `x2_questype`
--
ALTER TABLE `x2_questype`
  ADD PRIMARY KEY (`questid`),
  ADD KEY `questchoice` (`questchoice`);

--
-- Indexes for table `x2_record`
--
ALTER TABLE `x2_record`
  ADD PRIMARY KEY (`recordid`),
  ADD KEY `recordquestionid` (`recordquestionid`,`recorduserid`,`recordtime`),
  ADD KEY `recordsubjectid` (`recordsubjectid`,`recordknowsid`,`recordquestype`),
  ADD KEY `recordexamid` (`recordexamid`);

--
-- Indexes for table `x2_reply`
--
ALTER TABLE `x2_reply`
  ADD PRIMARY KEY (`replyid`),
  ADD KEY `replyuserid` (`replyuserid`,`replycommentid`,`replytime`);

--
-- Indexes for table `x2_sections`
--
ALTER TABLE `x2_sections`
  ADD PRIMARY KEY (`sectionid`),
  ADD KEY `section` (`section`),
  ADD KEY `sectionsubjectid` (`sectionsubjectid`);

--
-- Indexes for table `x2_seminar`
--
ALTER TABLE `x2_seminar`
  ADD PRIMARY KEY (`seminarid`),
  ADD KEY `seminarcatid` (`seminarcatid`),
  ADD KEY `seminarstatus` (`seminarstatus`),
  ADD KEY `seminartime` (`seminartime`),
  ADD KEY `seminarsequence` (`seminarsequence`),
  ADD KEY `seminaruserid` (`seminaruserid`);

--
-- Indexes for table `x2_session`
--
ALTER TABLE `x2_session`
  ADD PRIMARY KEY (`sessionid`),
  ADD KEY `sessionlasttime` (`sessionlasttime`),
  ADD KEY `sessioncurrent` (`sessioncurrent`),
  ADD KEY `sessionmaster` (`sessionmaster`);

--
-- Indexes for table `x2_special`
--
ALTER TABLE `x2_special`
  ADD PRIMARY KEY (`specialid`),
  ADD KEY `contentuserid` (`contentuserid`,`contentinputtime`,`contentmodifytime`,`contentsequence`),
  ADD KEY `contentmoduleid` (`contentmoduleid`),
  ADD KEY `contentcatid` (`contentcatid`),
  ADD KEY `contentstatus` (`contentstatus`),
  ADD KEY `contentspecialid` (`contentspecialid`);

--
-- Indexes for table `x2_specialsort`
--
ALTER TABLE `x2_specialsort`
  ADD PRIMARY KEY (`sortid`),
  ADD KEY `sortseminarid` (`sortseminarid`,`sortsequence`);

--
-- Indexes for table `x2_subject`
--
ALTER TABLE `x2_subject`
  ADD PRIMARY KEY (`subjectid`);

--
-- Indexes for table `x2_user`
--
ALTER TABLE `x2_user`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `useremail` (`useremail`),
  ADD KEY `username` (`username`),
  ADD KEY `module` (`usercoin`),
  ADD KEY `userregtime` (`userregtime`),
  ADD KEY `usermoduleid` (`usermoduleid`),
  ADD KEY `userlogtime` (`userlogtime`),
  ADD KEY `useropenid` (`useropenid`);

--
-- Indexes for table `x2_user_group`
--
ALTER TABLE `x2_user_group`
  ADD PRIMARY KEY (`groupid`),
  ADD KEY `groupname` (`groupname`,`groupmoduleid`),
  ADD KEY `groupmoduledefault` (`groupmoduledefault`),
  ADD KEY `groupdefault` (`groupdefault`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `x2_area`
--
ALTER TABLE `x2_area`
  MODIFY `areaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- 使用表AUTO_INCREMENT `x2_attach`
--
ALTER TABLE `x2_attach`
  MODIFY `attid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- 使用表AUTO_INCREMENT `x2_attachtype`
--
ALTER TABLE `x2_attachtype`
  MODIFY `atid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `x2_basic`
--
ALTER TABLE `x2_basic`
  MODIFY `basicid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `x2_block`
--
ALTER TABLE `x2_block`
  MODIFY `blockid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `x2_book`
--
ALTER TABLE `x2_book`
  MODIFY `bookid` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `x2_category`
--
ALTER TABLE `x2_category`
  MODIFY `catid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用表AUTO_INCREMENT `x2_cequeue`
--
ALTER TABLE `x2_cequeue`
  MODIFY `ceqid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `x2_certificate`
--
ALTER TABLE `x2_certificate`
  MODIFY `ceid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `x2_comment`
--
ALTER TABLE `x2_comment`
  MODIFY `cmtid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `x2_consumelog`
--
ALTER TABLE `x2_consumelog`
  MODIFY `conlid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `x2_content`
--
ALTER TABLE `x2_content`
  MODIFY `contentid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- 使用表AUTO_INCREMENT `x2_course`
--
ALTER TABLE `x2_course`
  MODIFY `courseid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `x2_coursesubject`
--
ALTER TABLE `x2_coursesubject`
  MODIFY `csid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `x2_dayexam`
--
ALTER TABLE `x2_dayexam`
  MODIFY `deid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `x2_dochistory`
--
ALTER TABLE `x2_dochistory`
  MODIFY `dhid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `x2_docs`
--
ALTER TABLE `x2_docs`
  MODIFY `docid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `x2_examhistory`
--
ALTER TABLE `x2_examhistory`
  MODIFY `ehid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- 使用表AUTO_INCREMENT `x2_exams`
--
ALTER TABLE `x2_exams`
  MODIFY `examid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `x2_exercise`
--
ALTER TABLE `x2_exercise`
  MODIFY `exerid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `x2_favor`
--
ALTER TABLE `x2_favor`
  MODIFY `favorid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `x2_feedback`
--
ALTER TABLE `x2_feedback`
  MODIFY `fbid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `x2_gbook`
--
ALTER TABLE `x2_gbook`
  MODIFY `gbid` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `x2_knows`
--
ALTER TABLE `x2_knows`
  MODIFY `knowsid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `x2_log`
--
ALTER TABLE `x2_log`
  MODIFY `logid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=409;

--
-- 使用表AUTO_INCREMENT `x2_module`
--
ALTER TABLE `x2_module`
  MODIFY `moduleid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 使用表AUTO_INCREMENT `x2_module_fields`
--
ALTER TABLE `x2_module_fields`
  MODIFY `fieldid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- 使用表AUTO_INCREMENT `x2_openbasics`
--
ALTER TABLE `x2_openbasics`
  MODIFY `obid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- 使用表AUTO_INCREMENT `x2_opencourse`
--
ALTER TABLE `x2_opencourse`
  MODIFY `ocid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 使用表AUTO_INCREMENT `x2_poscontent`
--
ALTER TABLE `x2_poscontent`
  MODIFY `pcid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `x2_position`
--
ALTER TABLE `x2_position`
  MODIFY `posid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `x2_product`
--
ALTER TABLE `x2_product`
  MODIFY `productid` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `x2_progress`
--
ALTER TABLE `x2_progress`
  MODIFY `prsid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `x2_quest2knows`
--
ALTER TABLE `x2_quest2knows`
  MODIFY `qkid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1786;

--
-- 使用表AUTO_INCREMENT `x2_questionanalysis`
--
ALTER TABLE `x2_questionanalysis`
  MODIFY `qaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108030;

--
-- 使用表AUTO_INCREMENT `x2_questionrows`
--
ALTER TABLE `x2_questionrows`
  MODIFY `qrid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `x2_questions`
--
ALTER TABLE `x2_questions`
  MODIFY `questionid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1778;

--
-- 使用表AUTO_INCREMENT `x2_questype`
--
ALTER TABLE `x2_questype`
  MODIFY `questid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `x2_record`
--
ALTER TABLE `x2_record`
  MODIFY `recordid` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `x2_reply`
--
ALTER TABLE `x2_reply`
  MODIFY `replyid` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `x2_sections`
--
ALTER TABLE `x2_sections`
  MODIFY `sectionid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `x2_seminar`
--
ALTER TABLE `x2_seminar`
  MODIFY `seminarid` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `x2_special`
--
ALTER TABLE `x2_special`
  MODIFY `specialid` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `x2_specialsort`
--
ALTER TABLE `x2_specialsort`
  MODIFY `sortid` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `x2_subject`
--
ALTER TABLE `x2_subject`
  MODIFY `subjectid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `x2_user`
--
ALTER TABLE `x2_user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用表AUTO_INCREMENT `x2_user_group`
--
ALTER TABLE `x2_user_group`
  MODIFY `groupid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
