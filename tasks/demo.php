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

if ('cli' != php_sapi_name()) {
    exit('Access denied!');
}
set_time_limit(0);
define('PEPATH', dirname(dirname(__FILE__)));
class app
{
    public $G;

    public function __construct(&$G)
    {
        $this->G = $G;
        $this->ev = $this->G->make('ev');
    }

    public function run()
    {
        phpinfo();
    }
}

include PEPATH.'/lib/init.cls.php';
$app = new app(new ginkgo());
$app->run();
