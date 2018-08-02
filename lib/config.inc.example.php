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
define('DU','homestead');//MYSQL数据库用户名
define('DP','secret');//MYSQL数据库用户密码
define('DTH','x2_');//系统表前缀，不用改

define('REDIS',true);

define('WXAPPID','***');
define('WXAPPSECRET','***');
define('WXMCHID','***');
define('WXKEY','***');

define('ALIPART','***');
define('ALIKEY','***');
define('ALIACC','i@oiuv.cn');
