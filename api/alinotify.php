<?php

/*
 * This file is part of the phpems/phpems.
 *
 * (c) oiuv <i@oiuv.cn>
 *
 * This source file is subject to the MIT license that is bundled.
 */

set_include_path('../');
/*
 * Created on 2013-12-26
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */

class app
{
    public $G;

    public function __construct(&$G)
    {
        $this->G = $G;
        $this->ev = $this->G->make('ev');
        $this->tpl = $this->G->make('tpl');
        $this->tpl->dir = 'tpls/';
        $this->sql = $this->G->make('pdosql');
        $this->db = $this->G->make('pepdo');
        $this->user = $this->G->make('user', 'user');
        $this->tpl->assign('userhash', $this->ev->get('userhash'));
        $this->order = $this->G->make('orders', 'bank');
    }

    public function run()
    {
        $orderobj = $this->G->make('orders', 'bank');
        $alipay = $this->G->make('alipay');
        $orderid = $this->ev->get('out_trade_no');
        $order = $this->order->getOrderById($orderid);
        $verify_result = $alipay->alinotify();
        $this->tpl->assign('order', $order);
        if ($verify_result) {
            if ('TRADE_FINISHED' == $this->ev->get('trade_status') || 'TRADE_SUCCESS' == $this->ev->get('trade_status')) {
                if (2 != $order['orderstatus']) {
                    $user = $this->user->getUserById($order['orderuserid']);
                    $orderobj->modifyOrderById($orderid, ['orderstatus' => 2]);
                    $user = $this->user->getUserById($order['orderuserid']);
                    $args['usercoin'] = $user['usercoin'] + $order['orderprice'] * 10;
                    $this->user->modifyUserInfo($args, $order['orderuserid']);
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

include '../lib/api.cls.php';
$ginkgo = new ginkgo();
$ginkgo->run();
