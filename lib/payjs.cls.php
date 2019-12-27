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

class payjs
{
    public $G;

    public $config = [];

    public function __construct($G)
    {
        $this->G = $G;
        $this->ev = $this->G->make('ev');
    }

    public function post($url, $data)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_TIMEOUT, 10);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_USERAGENT, 'HTTP CLIENT');
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        $data = curl_exec($ch);
        curl_close($ch);

        return json_decode($data, true);
    }

    public function sign($data, $key)
    {
        $data = array_filter($data);
        ksort($data);
        $sign = strtoupper(md5(urldecode(http_build_query($data).'&key='.$key)));

        return $sign;
    }

    public function outQrcodePay($order)
    {
        $data = [
            'mchid'        => PAYJSMCHID,
            'total_fee'    => $order['orderprice'] * 100,
            'out_trade_no' => $order['ordersn'],
            'type'         => '',
            'body'         => $order['ordertitle'],
            'attach'       => 'phpems',
            'notify_url'   => WP.'api/payjsnotify.php',
        ];
        $data['sign'] = $this->sign($data, PAYJSKEY);
        $r = $this->post('https://payjz.cn/api/native', $data);

        return $r;
    }

    public function outJsApiPay($order, $openid)
    {
        $data = [
            'mchid'        => PAYJSMCHID,
            'total_fee'    => $order['orderprice'] * 100,
            'out_trade_no' => $order['ordersn'],
            'type'         => '',
            'body'         => $order['ordertitle'],
            'attach'       => 'phpems',
            'notify_url'   => WP.'api/payjsnotify.php',
            'openid'       => $openid,
        ];
        $data['sign'] = $this->sign($data, PAYJSKEY);
        $r = $this->post('https://payjz.cn/api/jsapi', $data);

        return $r;
    }

    public function notify()
    {
        $post = $this->ev->post;
        $data = [
            'return_code'    => $post['return_code'],
            'total_fee'      => $post['total_fee'],
            'out_trade_no'   => $post['out_trade_no'],
            'payjs_order_id' => $post['payjs_order_id'],
            'transaction_id' => $post['transaction_id'],
            'time_end'       => $post['time_end'],
            'openid'         => $post['openid'],
            'attach'         => $post['attach'],
            'mchid'          => $post['mchid'],
            'type'           => $post['type'],
        ];
        $sign = $this->sign($data, PAYJSKEY);
        if (1 == $data['return_code'] && $sign == $post['sign']) {
            $this->user = $this->G->make('user', 'user');
            $this->order = $this->G->make('orders', 'bank');
            $order = $this->order->getOrderById($data['out_trade_no']);
            if (2 != $order['orderstatus']) {
                $user = $this->user->getUserById($order['orderuserid']);
                $this->order->modifyOrderById($data['out_trade_no'], ['orderstatus' => 2]);
                $user = $this->user->getUserById($order['orderuserid']);
                $args['usercoin'] = $user['usercoin'] + $order['orderprice'] * 10;
                $this->user->modifyUserInfo($order['orderuserid'], $args);
            }
            echo 'success';
        } else {
            echo 'fail';
        }
    }
}
