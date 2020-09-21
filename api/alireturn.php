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
        $this->ev = $this->G->make('ev');
        $this->user = $this->G->make('user', 'user');
        $this->order = $this->G->make('orders', 'bank');
    }

    public function run()
    {
        $orderobj = $this->G->make('orders', 'bank');
        $alipay = $this->G->make('alipay');
        $orderid = $this->ev->get('out_trade_no');
        $order = $orderobj->getOrderById($orderid);
        $verify_result = $alipay->alireturn();
        if ($verify_result) {
            if (2 == $order['orderstatus']) {
            } else {
                if ('TRADE_FINISHED' == $this->ev->get('trade_status') || 'TRADE_SUCCESS' == $this->ev->get('trade_status')) {
                    $orderobj->modifyOrderById($orderid, ['orderstatus' => 2]);
                    $user = $this->user->getUserById($order['orderuserid']);
                    $args['usercoin'] = $user['usercoin'] + $order['orderprice'] * 10;
                    $this->user->modifyUserInfo($order['orderuserid'], $args);
                }
            }
        }

        if ($this->ev->isMobile()) {
            header('location:../index.php?user-phone-payfor-orderdetail&ordersn='.$orderid);
        } else {
            header('location:../index.php?user-center-payfor-orderdetail&ordersn='.$orderid);
        }
        exit();
    }
}
include PEPATH.'/lib/init.cls.php';
$app = new app(new ginkgo());
$app->run();
