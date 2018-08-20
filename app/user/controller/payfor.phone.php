<?php
/*
 * Created on 2016-5-19
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
class action extends app
{
	public function display()
	{
		$action = $this->ev->url(3);
		if(!method_exists($this,$action))
		$action = "index";
		$this->$action();
		exit;
	}

	private function wxpay()
	{
		$ordersn = $this->ev->get('ordersn');
		$order = $this->order->getOrderById($ordersn,$this->_user['sessionuserid']);
		$wxpay = $this->G->make('wxpay');
		$result = $wxpay->outUrl2($order);
		$this->tpl->assign('order',$order);
		$this->tpl->assign('result',$result);
		$this->tpl->display('payfor_wxpay');
		//echo '<img src="index.php?core-api-index-qrcode&data='.urlencode($result['code_url']).'" />';
		//print_r($result);
	}

	private function ispayfor()
	{
		$ordersn = $this->ev->get('ordersn');
		$order = $this->order->getOrderById($ordersn,$this->_user['sessionuserid']);
		if($order['orderstatus'] == 2)
		{
			$message = array(
				'statusCode' => 200,
				"message" => "订单支付成功",
			    "callbackType" => 'forward',
			    "forwardUrl" => "index.php?user-center-payfor-orderdetail&ordersn=".$ordersn
			);
		}
		else
		$message = array(
			'statusCode' => 300,
			"message" => "订单未支付成功，请刷新页面重新支付"
		);
		$this->G->R($message);
	}

	private function remove()
	{
		$oid = $this->ev->get('ordersn');
		$order = $this->order->getOrderById($oid,$this->_user['sessionuserid']);
		if($order['orderstatus'] == 1)
		{
			$this->order->delOrder($oid);
			$message = array(
				'statusCode' => 200,
				"message" => "订单删除成功",
			    "callbackType" => 'forward',
			    "forwardUrl" => "reload"
			);
		}
		else
		$message = array(
			'statusCode' => 300,
			"message" => "订单操作失败"
		);
		exit(json_encode($message));
	}

	private function orderdetail()
	{
		$oid = $this->ev->get('ordersn');
		if(!$oid)
		{
			$message = array(
				'statusCode' => 300,
				"message" => "非法参数"
			);
			exit(json_encode($message));
		}
		$order = $this->order->getOrderById($oid,$this->_user['sessionuserid']);
		if($order['orderstatus'] == 1)
        {
	        $this->wxpay = $this->G->make("wxpay");
	        $jsApiParameters = $this->wxpay->outJsPay($order);
	        $this->tpl->assign('jsApiParameters',$jsApiParameters);
        }
        $this->tpl->assign('order',$order);
        $this->tpl->display('payfor_detail');
	}

	private function index()
	{
		if($this->ev->get('payforit'))
		{
			$money = intval($this->ev->get('money'));
			if($money < 1)
			{
				$message = array(
					'statusCode' => 300,
					"message" => "最少需要充值1元"
				);
				exit(json_encode($message));
			}
			$args = array();
			$args['orderprice'] = $money;
			$args['ordertitle'] = "考试系统充值 {$args['orderprice']} 元";
			$args['ordersn'] = date('YmdHi').rand(100,999);
			$args['orderstatus'] = 1;
			$args['orderuserid'] = $this->_user['sessionuserid'];
			$args['ordercreatetime'] = TIME;
			$args['orderuserinfo'] = array('username' => $this->_user['sessionusername']);
			$this->order->addOrder($args);
			$message = array(
				'statusCode' => 200,
				"message" => "订单创建成功",
			    "callbackType" => 'forward',
			    "forwardUrl" => "index.php?user-phone-payfor-orderdetail&ordersn=".$args['ordersn']
			);
			exit(json_encode($message));
		}
		else
		{
			$page = $this->ev->get('page');
			$args = array(array("AND","orderuserid = :orderuserid",'orderuserid',$this->_user['sessionuserid']));
			$myorders = $this->order->getOrderList($args,$page);
			$this->tpl->assign('orders',$myorders);
			$this->tpl->display('payfor');
		}
	}
}


?>
