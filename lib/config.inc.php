<?php

define('DOMAINTYPE','off');
define('CH','exam_');
define('CDO','');
define('CP','/');
define('CRT',180);
define('CS',md5(base64_encode($_SERVER['HTTP_HOST'])));
define('HE','utf-8');
define('PN',10);
define('TIME',time());
define('USEWX',false);
if(dirname($_SERVER['SCRIPT_NAME']))
define('WP','http://'.$_SERVER['SERVER_NAME'].dirname($_SERVER['SCRIPT_NAME']));
else
define('WP','http://'.$_SERVER['SERVER_NAME'].'/');

define('DB','phpems');//MYSQL数据库名
define('DH','127.0.0.1');//MYSQL主机名，不用改
define('DU','root');//MYSQL数据库用户名
define('DP','');//MYSQL数据库用户密码
define('DTH','x2_');//系统表前缀，不用改


define('WXAPPID','wxeb0ce70607ad267f');
define('WXAPPSECRET','5b0b87722c268d89a82bcb40e3853f29');
define('WXMCHID','7300637');
define('WXKEY','zhelishi32weidewxkey');


define('ALIPART','7300637');
define('ALIKEY','5b0b87722c268d89a82bcb40e3853f29');
define('ALIACC','i@oiuv.cn');
