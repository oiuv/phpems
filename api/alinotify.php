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
        $alipay = $this->G->make('alipay');
        $orderid = $this->ev->get('out_trade_no');
        $order = $this->order->getOrderById($orderid);
        $verify_result = $alipay->alinotify();
        if ($verify_result) {
            if ('TRADE_FINISHED' == $this->ev->get('trade_status') || 'TRADE_SUCCESS' == $this->ev->get('trade_status')) {
                if (2 != $order['orderstatus']) {
                    $user = $this->user->getUserById($order['orderuserid']);
                    $this->order->modifyOrderById($orderid, ['orderstatus' => 2]);
                    $user = $this->user->getUserById($order['orderuserid']);
                    $args['usercoin'] = $user['usercoin'] + $order['orderprice'] * 10;
                    $this->user->modifyUserInfo($order['orderuserid'], $args);
                }
                exit('sucess');
            } elseif ('WAIT_BUYER_PAY' == $_POST['trade_status']) {
                exit('fail');
            }

            exit('fail');
        }

        exit('fail');
    }
}

include PEPATH.'/lib/init.cls.php';
$app = new app(new ginkgo());
$app->run();
