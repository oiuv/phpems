#数据库升级（5.0 -> 6.0）
## basic表
增加basictop 字段，int 1，普通索引

## certificate表
增加cetext 字段，text

## content表
增加
contentmodifier  varchar(48) 
contenttags  varchar(120) 普通索引
contentkeywords  text	全文索引

## coupon表
增加
couponusername varchar(120)  普通索引
couponusetime int(11)  普通索引

## examsession表
增加
examsessiontoken varchar(32) 普通索引

## knows表
增加
knowssequence int(11) 普通索引
knowsnumber text 
knowsquestions mediumtext

## module表
增加
modulelockfields text

## poscontent表
增加
pcposapp varchar(24) 普通索引
pcdescribe text

## sections表
增加
sectionsequence int(11) 普通索引

## 删除seminar表，并运行下面的SQL语句创建新表

CREATE TABLE IF NOT EXISTS `x2_seminar` (
  `seminarid` int(11) NOT NULL AUTO_INCREMENT,
  `seminartitle` varchar(240) NOT NULL DEFAULT '',
  `seminartags` varchar(120) NOT NULL,
  `seminarkeywords` text NOT NULL,
  `seminarcatid` int(11) NOT NULL DEFAULT '0',
  `seminarthumb` varchar(240) NOT NULL DEFAULT '',
  `seminarhref` varchar(240) NOT NULL,
  `seminargallery` tinytext NOT NULL,
  `seminargallerylink` tinytext NOT NULL,
  `seminarcode` text NOT NULL,
  `seminarusername` varchar(48) NOT NULL DEFAULT '',
  `seminarmodifier` varchar(48) NOT NULL,
  `seminardescribe` text NOT NULL,
  `seminartime` int(11) NOT NULL DEFAULT '0',
  `seminarmodifytime` int(11) NOT NULL,
  `seminarstatus` int(1) NOT NULL DEFAULT '0',
  `seminarorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seminarid`),
  KEY `seminarcatid` (`seminarcatid`),
  KEY `seminarstatus` (`seminarstatus`),
  KEY `seminartime` (`seminartime`),
  KEY `seminartags` (`seminartags`),
  KEY `seminarorder` (`seminarorder`) USING BTREE,
  FULLTEXT KEY `seminarkeywords` (`seminarkeywords`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `x2_seminar_content` (
  `sctid` int(11) NOT NULL AUTO_INCREMENT,
  `sctelid` int(11) NOT NULL,
  `sctcontentid` int(11) NOT NULL,
  `sctorder` int(11) NOT NULL,
  `sctusername` varchar(120) NOT NULL,
  `scttime` int(11) NOT NULL,
  PRIMARY KEY (`sctid`),
  KEY `sctcontentid` (`sctcontentid`),
  KEY `sctorder` (`sctorder`),
  KEY `sctelid` (`sctelid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `x2_seminar_elem` (
  `selid` int(11) NOT NULL AUTO_INCREMENT,
  `sellayout` int(11) DEFAULT NULL,
  `selseminar` int(11) DEFAULT NULL,
  `seltitle` varchar(120) DEFAULT NULL,
  `selorder` int(11) DEFAULT NULL,
  `selpos` tinyint(4) DEFAULT NULL,
  `seldescribe` tinytext,
  `selcode` text,
  `seldata` text,
  PRIMARY KEY (`selid`),
  KEY `sellayout` (`sellayout`,`selseminar`),
  KEY `selorder` (`selorder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `x2_seminar_layout` (
  `slayoutid` int(11) NOT NULL AUTO_INCREMENT,
  `slayoutseminar` int(11) NOT NULL,
  `slayouttitle` varchar(120) NOT NULL,
  `slayoutgrid` int(11) NOT NULL,
  `slayoutcode` text NOT NULL,
  `slayoutorder` int(11) NOT NULL,
  `slayoutdescribe` tinytext NOT NULL,
  PRIMARY KEY (`slayoutid`),
  KEY `slayoutorder` (`slayoutorder`),
  KEY `slayoutseminar` (`slayoutseminar`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `x2_seminar_tpls` (
  `stplid` int(11) NOT NULL AUTO_INCREMENT,
  `stplname` varchar(120) DEFAULT NULL,
  `stpltype` varchar(36) DEFAULT NULL,
  `stplgrid` int(11) DEFAULT NULL,
  `stpldescribe` tinytext,
  `stplcode` text,
  PRIMARY KEY (`stplid`),
  KEY `stpltype` (`stpltype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;