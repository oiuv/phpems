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

    private function remove()
    {
        $oid = $this->ev->get('ordersn');
        $order = $this->orders->getOrderById($oid);
        if (1 == $order['orderstatus'] || 99 == $order['orderstatus']) {
            $this->orders->delOrder($oid);
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

    private function batremove()
    {
        $delids = $this->ev->get('delids');
        foreach ($delids as $oid => $p) {
            $order = $this->orders->getOrderById($oid);
            if (1 == $order['orderstatus'] || 99 == $order['orderstatus']) {
                $this->orders->delOrder($oid);
            }
        }
        $message = [
            'statusCode'   => 200,
            'message'      => '订单删除成功',
            'callbackType' => 'forward',
            'forwardUrl'   => 'reload',
        ];
        exit(json_encode($message));
    }

    private function change()
    {
        $ordersn = $this->ev->get('ordersn');
        $orderstatus = $this->ev->get('orderstatus');
        $args = ['orderstatus' => $orderstatus];
        $this->orders->modifyOrderById($ordersn, $args);
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'target'       => '',
            'rel'          => '',
            'callbackType' => 'forward',
            'forwardUrl'   => 'reload',
        ];
        exit(json_encode($message));
    }

    private function index()
    {
        $search = $this->ev->get('search');
        $page = intval($this->ev->get('page'));
        $u = '';
        if ($search) {
            $this->tpl->assign('search', $search);
            foreach ($search as $key => $arg) {
                $u .= "&search[{$key}]={$arg}";
            }
        }
        $this->tpl->assign('u', $u);
        $this->tpl->assign('page', $page);
        if ($search) {
            $args = [];
        } else {
            $args = 1;
        }
        $orders = $this->orders->getOrderList($args, $page);
        $this->tpl->assign('orders', $orders);
        $this->tpl->display('orders');
    }
}
