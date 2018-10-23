<?php

/*
 * This file is part of the phpems/phpems.
 *
 * (c) oiuv <i@oiuv.cn>
 *
 * This source file is subject to the MIT license that is bundled.
 */

set_include_path('../');
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
        $this->module = $this->G->make('module');
        $this->session = $this->G->make('session');
        $this->user = $this->G->make('user', 'user');
        $this->tpl->assign('userhash', $this->ev->get('userhash'));
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
                    $this->user->modifyUserInfo($args, $order['orderuserid']);
                }
            }
        }

        header('location:../index.php?user-api&ordersn='.$orderid);
        exit();
    }
}
include '../lib/api.cls.php';
$ginkgo = new ginkgo();
$ginkgo->run();
