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

/* 常规常量设置 */
define('DEBUG', false); //开启日志和错误调试
define('DOMAINTYPE', 'off');
define('CH', 'exam_');
define('CDO', '');
define('CP', '/');
define('CRT', 180);
define('CS', md5(base64_encode($_SERVER['HTTP_HOST']))); // 可随机生成32位字符串修改此处值
define('HE', 'utf-8');
define('PN', 10);
define('TIME', time());
if (dirname($_SERVER['SCRIPT_NAME'])) {
    define('WP', '//'.$_SERVER['SERVER_NAME'].dirname($_SERVER['SCRIPT_NAME']).'/');
} else {
    define('WP', '//'.$_SERVER['SERVER_NAME'].'/');
}

/* 数据库设置 */
define('SQLDEBUG', 1);
define('DB', 'phpems'); //MYSQL数据库名
define('DH', '127.0.0.1'); //MYSQL主机名，不用改
define('DU', 'root'); //MYSQL数据库用户名
define('DP', ''); //MYSQL数据库用户密码
define('DTH', 'x2_'); //系统表前缀，不用改

define('REDIS', true);
define('SERVER', [
    'host'     => '127.0.0.1', //Redis服务器IP
    'port'     => 6379, //Redis服务器端口
    'database' => 9, //Redis数据库（0-15）
]);

/* 阿里云OSS设置 */
define('OPENOSS', false);
define('OSSKEYID', 'LTAI1gDYPJhtZlIh');
define('OSSKEYSECRET', 'bmLtFONC9OVSfS9NAWYtelVsWMzCEp');
define('OSSENDPOINT', 'http://oss-cn-beijing.aliyuncs.com');
define('OSSBUCKET', 'ossforphpems');

/* 微信相关设置 */
define('USEWX', false); //微信使用开关，绑定用户
define('WXAUTOREG', false); //微信开启自动注册
//define('FOCUSWX',true);//强制引导关注微信
//define('WXQRCODE','qrcode.png');//微信公众号二维码地址
define('EP', '@phpems.net'); //微信开启自动注册时注册邮箱后缀
define('WXAPPID', '***');
define('WXAPPSECRET', '***');
define('WXMCHID', '***');
define('WXKEY', '***');

/* 支付宝相关设置 */
define('ALIPART', '***');
define('ALIKEY', '***');
define('ALIACC', 'i@oiuv.cn');

/* payjz相关设置 */
define('PAYJSASWX', 'NO'); //使用PAYJZ的微信支付接口代替微信支付
define('PAYJSMCHID', '1551052561');
define('PAYJSKEY', 'Zz8ks1ZP3UPKeTGi');
