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

session_start();
set_time_limit(0);
define('PE_VERSION', '5.0');
require __DIR__.'/vendor/autoload.php';
require __DIR__.'/lib/init.cls.php';

$ginkgo = new ginkgo();
$ginkgo->run();
