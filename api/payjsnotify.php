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

define('PEPATH', dirname(dirname(__FILE__)));
class app
{
    public $G;

    public function __construct(&$G)
    {
        $this->G = $G;
    }

    public function run()
    {
        //使用通用通知接口
        $this->G->make('payjs')->notify();
    }
}
include PEPATH.'/lib/init.cls.php';
$app = new app(new ginkgo());
$app->run();
