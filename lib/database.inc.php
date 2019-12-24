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

require_once __DIR__.'/config.inc.php';

use Illuminate\Database\Capsule\Manager as Capsule;

$capsule = new Capsule();

$capsule->addConnection([
    'driver'    => 'mysql',
    'host'      => DH,
    'database'  => DB,
    'username'  => DU,
    'password'  => DP,
    'charset'   => 'utf8',
    'collation' => 'utf8_unicode_ci',
    'prefix'    => DTH,
]);
// Make this Capsule instance available globally via static methods
$capsule->setAsGlobal();
// Setup the Eloquent ORM
$capsule->bootEloquent();
