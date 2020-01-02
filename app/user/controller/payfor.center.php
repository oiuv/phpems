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

class action extends app
{
    public function display()
    {
        $action = $this->ev->url(3);
        if (!method_exists($this, $action)) {
            $action = 'index';
        }
        $this->$action();
        exit;
    }

    private function wxpay()
    {
        $ordersn = $this->ev->get('ordersn');
        $order = $this->order->getOrderById($ordersn, $this->_user['sessionuserid']);
        $wxpay = $this->G->make('wxpay');
        $result = $wxpay->outUrl2($order);
        $this->tpl->assign('order', $order);
        $this->tpl->assign('result', $result);
        $this->tpl->display('payfor_wxpay');
    }

    private function payjs()
    {
        $ordersn = $this->ev->get('ordersn');
        $order = $this->order->getOrderById($ordersn, $this->_user['sessionuserid']);
        $payjs = $this->G->make('payjs');
        $result = $payjs->outQrcodePay($order);
        $this->tpl->assign('order', $order);
        $this->tpl->assign('result', $result);
        $this->tpl->display('payfor_payjs');
    }

    private function ispayfor()
    {
        $ordersn = $this->ev->get('ordersn');
        $order = $this->order->getOrderById($ordersn, $this->_user['sessionuserid']);
        if (2 == $order['orderstatus']) {
            $message = [
                'statusCode'   => 200,
                'message'      => '订单支付成功',
                'callbackType' => 'forward',
                'forwardUrl'   => 'index.php?user-center-payfor-orderdetail&ordersn='.$ordersn,
            ];
        } else {
            $message = [
                'statusCode' => 300,
                'message'    => '订单未支付成功，请刷新页面重新支付',
            ];
        }
        $this->G->R($message);
    }

    private function remove()
    {
        $oid = $this->ev->get('ordersn');
        $order = $this->order->getOrderById($oid, $this->_user['sessionuserid']);
        if (1 == $order['orderstatus']) {
            $this->order->delOrder($oid);
            $message = [
                'statusCode'   => 200,
                'message'      => '订单删除成功',
                'callbackType' => 'forward',
                'forwardUrl'   => 'reload',
            ];
        } else {
            $message = [
                'statusCode' => 300,
                'message'    => '订单操作失败',
            ];
        }
        exit(json_encode($message));
    }

    private function orderdetail()
    {
        $oid = $this->ev->get('ordersn');
        if (!$oid) {
            exit(header('location:index.php?user-center'));
        }
        $order = $this->order->getOrderById($oid, $this->_user['sessionuserid']);
        $alipay = $this->G->make('alipay');
        $payforurl = $alipay->outPayForUrl($order, WP.'/api/alinotify.php', WP.'/api/alireturn.php');
        $this->tpl->assign('payforurl', $payforurl);
        $this->tpl->assign('order', $order);
        $this->tpl->display('payfor_detail');
    }

    private function index()
    {
        if ($this->ev->get('payforit')) {
            $money = intval($this->ev->get('money'));
            if ($money < 1) {
                $message = [
                    'statusCode' => 300,
                    'message'    => '最少需要充值1元',
                ];
                exit(json_encode($message));
            }
            $args = [];
            $args['orderprice'] = $money;
            $args['ordertitle'] = "考试系统充值 {$args['orderprice']} 元";
            $args['ordersn'] = date('YmdHi').rand(100, 999);
            $args['orderstatus'] = 1;
            $args['orderuserid'] = $this->_user['sessionuserid'];
            $args['ordercreatetime'] = TIME;
            $args['orderuserinfo'] = ['username' => $this->_user['sessionusername']];
            $this->order->addOrder($args);
            $message = [
                'statusCode'   => 200,
                'message'      => '订单创建成功',
                'ordersn'      => $args['ordersn'],
                'callbackType' => 'forward',
                'forwardUrl'   => 'index.php?user-center-payfor-orderdetail&ordersn='.$args['ordersn'],
            ];
            exit(json_encode($message));
        }

        $page = $this->ev->get('page');
        $args = [['AND', 'orderuserid = :orderuserid', 'orderuserid', $this->_user['sessionuserid']]];
        $myorders = $this->order->getOrderList($args, $page);
        $this->tpl->assign('orders', $myorders);
        $this->tpl->display('payfor');
    }
}
