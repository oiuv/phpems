<?php

/*
 * This file is part of the phpems/phpems.
 *
 * (c) oiuv <i@oiuv.cn>
 *
 * 项目维护：oiuv(QQ:7300637) | 定制服务：火眼(QQ:278768688)
 *
 * This source file is subject to the MIT license that is bundled.
 */

define('DOMAINTYPE', 'off');
define('CH', 'exam_');
define('CDO', '');
define('CP', '/');
define('CRT', 180);
define('CS', md5(base64_encode($_SERVER['HTTP_HOST'])));
define('HE', 'utf-8');
define('PN', 10);
define('TIME', time());
define('DEBUG', false); //开启日志和错误调试
define('USEWX', false); //微信使用开关，绑定用户
define('WXAUTOREG', false); //微信开启自动注册
define('PAYJSASWX', 'YES'); //使用PAYJZ的微信支付接口代替微信支付
define('OPENOSS', false);
if (dirname($_SERVER['SCRIPT_NAME'])) {
    define('WP', '//'.$_SERVER['SERVER_NAME'].dirname($_SERVER['SCRIPT_NAME']).'/');
} else {
    define('WP', '//'.$_SERVER['SERVER_NAME'].'/');
}

define('DB', 'phpems'); //MYSQL数据库名
define('DH', '127.0.0.1'); //MYSQL主机名，不用改
define('DU', 'homestead'); //MYSQL数据库用户名
define('DP', 'secret'); //MYSQL数据库用户密码
define('DTH', 'x2_'); //系统表前缀，不用改

define('REDIS', true);
define('SERVER', [
    'host'     => '127.0.0.1', //Redis服务器IP
    'port'     => 6379, //Redis服务器端口
    'database' => 9, //Redis数据库（0-15）
]);

define('WXAPPID', '***');
define('WXAPPSECRET', '***');
define('WXMCHID', '***');
define('WXKEY', '***');

define('ALIPART', '***');
define('ALIKEY', '***');
define('ALIACC', 'i@oiuv.cn');

define('PAYJSMCHID', '1551052561');
define('PAYJSKEY', 'Zz8ks1ZP3UPKeTGi');
