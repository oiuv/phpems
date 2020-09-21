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

require_once PEPATH.'/lib/include/WxPay.Config.php';
require_once PEPATH.'/lib/include/WxPay.Exception.php';
require_once PEPATH.'/lib/include/WxPay.Data.php';
require_once PEPATH.'/lib/include/WxPay.Api.php';
require_once PEPATH.'/lib/include/WxPay.Notify.php';
require_once PEPATH.'/lib/include/WxPay.JsApiPay.php';

class PayNotifyCallBack extends WxPayNotify
{
    public function __construct($G)
    {
        $this->G = $G;
    }

    //查询订单
    public function Queryorder($transaction_id)
    {
        $input = new WxPayOrderQuery();
        $input->SetTransaction_id($transaction_id);
        $result = WxPayApi::orderQuery($input);
        //Log::DEBUG("query:" . json_encode($result));
        if (array_key_exists('return_code', $result)
            && array_key_exists('result_code', $result)
            && 'SUCCESS' == $result['return_code']
            && 'SUCCESS' == $result['result_code']) {
            return true;
        }

        return false;
    }

    //重写回调处理函数
    public function NotifyProcess($data, &$msg)
    {
        //Log::DEBUG("call back:" . json_encode($data));
        $notfiyOutput = [];
        if (!array_key_exists('transaction_id', $data)) {
            $msg = '输入参数不正确';

            return false;
        }
        //查询订单，判断订单真实性
        if (!$this->Queryorder($data['transaction_id'])) {
            $msg = '订单查询失败';

            return false;
        }
        $ordersn = $data['out_trade_no'];
        $orders = $this->G->make('orders', 'bank');
        $order = $orders->getOrderById($ordersn);
        if (2 == $order['orderstatus']) {
            exit;
        }

        $this->user = $this->G->make('user', 'user');
        $orders->modifyOrderById($ordersn, ['orderstatus' => 2, 'orderpayfortime' => TIME]);
        $user = $this->user->getUserById($order['orderuserid']);
        $args['usercoin'] = $user['usercoin'] + $order['orderprice'] * 10;
        $this->user->modifyUserInfo($order['orderuserid'], $args);
        $this->G->make('consume', 'bank')->addConsumeLog(['conluserid' => $order['orderuserid'], 'conlcost' => $order['orderprice'] * 10, 'conltype' => 2, 'conltime' => TIME, 'conlinfo' => '微信充值']);

        return true;
    }
}

class wxpay
{
    public $G;

    public $config = [];

    public function __construct($G)
    {
        $this->G = $G;
        $this->tools = new JsApiPay();
    }

    public function getwxopenid($reget = false)
    {
        if (!$_SESSION['openid'] || $reget) {
            $_SESSION['openid'] = $this->tools->GetOpenid();
        }

        return $_SESSION['openid'];
    }

    public function getUserInfo()
    {
        if ($_SESSION['openid']) {
            return $this->tools->GetUserInfoByToken();
        }

        return false;
    }

    public function outJsPay($order)
    {
        if (!$_SESSION['openid']) {
            $this->getwxopenid();
        }
        $tools = new JsApiPay();
        $input = new WxPayUnifiedOrder();
        $input->SetBody('test');
        $input->SetAttach('test');
        $input->SetOut_trade_no($order['ordersn']);
        $input->SetTotal_fee(intval($order['orderprice'] * 100));
        //$input->SetTotal_fee(intval($order['orderprice']));
        $input->SetTime_start(date('YmdHis'));
        $input->SetTime_expire(date('YmdHis', time() + 600));
        $input->SetGoods_tag('test');
        $input->SetNotify_url(WP.'api/wxnotify.php');
        $input->SetTrade_type('JSAPI');
        $input->SetOpenid($_SESSION['openid']);
        $order = WxPayApi::unifiedOrder($input);
        $jsApiParameters = $tools->GetJsApiParameters($order);

        return $jsApiParameters;
    }

    public function getNotifyPubObject()
    {
        return new PayNotifyCallBack($this->G);
    }

    public function GetPrePayUrl($productId)
    {
        $biz = new WxPayBizPayUrl();
        $biz->SetProduct_id($productId);
        $values = WxpayApi::bizpayurl($biz);
        $url = 'weixin://wxpay/bizpayurl?'.$this->ToUrlParams($values);

        return $url;
    }

    /**
     * 参数数组转换为url参数.
     *
     * @param array $urlObj
     */
    private function ToUrlParams($urlObj)
    {
        $buff = '';
        foreach ($urlObj as $k => $v) {
            $buff .= $k.'='.$v.'&';
        }

        $buff = trim($buff, '&');

        return $buff;
    }

    /**
     * 生成直接支付url，支付url有效期为2小时,模式二.
     *
     * @param UnifiedOrderInput $input
     */
    public function GetPayUrl($input)
    {
        if ('NATIVE' == $input->GetTrade_type() || 'MWEB' == $input->GetTrade_type()) {
            $result = WxPayApi::unifiedOrder($input);

            return $result;
        }
    }

    public function outUrl1($order)
    {
        return $this->GetPrePayUrl($order['ordersn']);
    }

    public function outUrl2($order)
    {
        $input = new WxPayUnifiedOrder();
        $input->SetBody($order['ordertitle']);
        $input->SetAttach($order['ordertitle']);
        //$input->SetOut_trade_no(WxPayConfig::MCHID.date("YmdHis"));
        $input->SetOut_trade_no($order['ordersn']);
        $price = intval($order['orderprice'] * 100);
        $input->SetTotal_fee($price);
        //$input->SetTotal_fee("1");
        $input->SetTime_start(date('YmdHis'));
        $input->SetTime_expire(date('YmdHis', time() + 600));
        $input->SetGoods_tag($order['ordertitle']);
        $input->SetNotify_url(WP.'api/wxnotify.php');
        $input->SetTrade_type('NATIVE');
        $input->SetProduct_id($order['ordersn']);
        $result = $this->GetPayUrl($input);

        return $result;
        //$result["code_url"];
    }

    public function outUrl3($order)
    {
        $input = new WxPayUnifiedOrder();
        $input->SetBody($order['ordertitle']);
        $input->SetAttach($order['ordertitle']);
        //$input->SetOut_trade_no(WxPayConfig::MCHID.date("YmdHis"));
        $input->SetOut_trade_no($order['ordersn']);
        $price = intval($order['orderprice'] * 100);
        $input->SetTotal_fee($price);
        //$input->SetTotal_fee("1");
        $input->SetTime_start(date('YmdHis'));
        $input->SetTime_expire(date('YmdHis', time() + 600));
        $input->SetGoods_tag($order['ordertitle']);
        $input->SetNotify_url(WP.'api/wxnotify.php');
        $input->SetTrade_type('MWEB');
        $input->SetProduct_id($order['ordersn']);
        $result = $this->GetPayUrl($input);

        return $result;
        //$result["code_url"];
    }
}
