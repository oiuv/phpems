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

	public function smtp()
	{
		$smtp = $this->G->make('sendmail');
		$smtp->setServer('smtp.qq.com','278768688@qq.com','zqluxtzjyoyebhje/2y1o52y1','465',true);
		$smtp->setFrom('278768688@qq.com');
        $smtp->setReceiver('2241223009@qq.com');
        $smtp->setMail('验证码邮件','您的验证码是2241');
        $smtp->sendMails();
		exit('ok');
	}

	public function outtable()
	{
		$this->sql = $this->G->make('pdosql');
		$this->db = $this->G->make('pepdo');
		$r = $this->db->fetchAll(array('sql' => 'show tables'));
		echo '<table>';
		foreach($r as $p)
		{
			$table = $p['Tables_in_hangye'];
			echo '<tr><td colspan="2">'.$table.'</td></tr>';
			$rs = $this->db->fetchAll(array('sql' => 'SHOW FULL COLUMNS FROM '.$table));
			foreach($rs as $tp)
			echo "<tr><td>{$tp['Comment']}</td><td>{x2;\$device['parms']['{$tp['Field']}']}</td></tr>";
		}
		echo '</table>';
	}

	public function api()
	{
		$url = "http://hangye.ennwifi.cn/api/v1/meta/province/list";
		$post_data = array ("ENN-TOKEN" => "12345");
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_HTTPHEADER, Array("ENN-TOKEN:12345","Content-Type: application/json; charset=utf-8"));
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($post_data));
		$output = curl_exec($ch);
		curl_close($ch);
		print_r($output);
	}

	private function getsc()
	{
		$this->db = $this->G->make('pepdo');
		$this->sql = $this->G->make('pdosql');
		$data = array(false,'car_shenche_jilu',1,false,false,false);
		$sql = $this->sql->makeSelect($data);
		$r = $this->db->fetchAll($sql);
		$mm = array();
		foreach($r as $p)
		{
			$tp = eval("return {$p['zhengjian']};");
			if(!$mm[$tp['chepai']])
			{
				$mm[$tp['chepai']] = 1;
				echo "INSERT INTO `car_mycars`  (`mccarcode` ,`mcuserid` ,`mcaddtime`) VALUES ('".$tp['chepai']."', '".$tp['userid']."',".TIME.");\n";
			}
		}
	}

	private function getuserdiyu()
	{
		set_time_limit(0);
		$page = $this->ev->get('page');
		if($page < 1)$page = 1;
		$keys = ($page - 1) * 100;
		$this->sql = $this->G->make('pdosql');
		$this->db = $this->G->make('pepdo');
		$data = array(false,"guishu",array(array("AND","sf = '河南'")),false,false,array($keys,100));
		$sql = $this->sql->makeSelect($data);
		$r = $this->db->fetchAll($sql);
		foreach($r as $p)
		{
			$data = array("car_member",array("city" => $p['city']),array(array("AND","mobile LIKE :mobile","mobile","{$p['hd']}%")));
			$sql = $this->sql->makeUpdate($data);
			$this->db->exec($sql);
		}
		if(!$r)
		echo 'OK';
		else
		echo  "<script>window.location = 'index.php?core-api-index-getuserdiyu&page=".intval($page + 1)."';</script>";
		exit;


		setlocale(LC_ALL,'zh_CN');
		$handle = fopen('2.csv',"r");
		$page = $this->ev->get('page');
		if($page < 1)$page = 1;
		$keys = $page * 10;
		$m = 0;
		$n = 0;
		while($data = fgetcsv($handle,200))
		{
			$m++;
			if($m >= $keys)
			{
				$n++;
				if($m > ($keys + 10))
				{
					break;
				}
				$fm = file_get_contents('http://sj.apidata.cn/?mobile='.$data[0]);
				$r = json_decode($fm,true);
				file_put_contents('s2.csv',"{$data[0]},{$r['data']['city']}\n",FILE_APPEND);
			}

		}
		echo $keys."\n";
		sleep(1);
		if(!$data[0])
		echo 'OK';
		else
		echo  "<script>window.location = 'index.php?core-api-index-getdiyu&page=".intval($page + 1)."';</script>";
	}

	private function getdiyu()
	{
		set_time_limit(0);
		setlocale(LC_ALL,'zh_CN');
		$handle = fopen('2.csv',"r");
		$page = $this->ev->get('page');
		if($page < 1)$page = 1;
		$keys = $page * 10;
		$m = 0;
		$n = 0;
		while($data = fgetcsv($handle,200))
		{
			$m++;
			if($m >= $keys)
			{
				$n++;
				if($m > ($keys + 10))
				{
					break;
				}
				$fm = file_get_contents('http://sj.apidata.cn/?mobile='.$data[0]);
				$r = json_decode($fm,true);
				file_put_contents('s2.csv',"{$data[0]},{$r['data']['city']}\n",FILE_APPEND);
			}

		}
		echo $keys."\n";
		sleep(1);
		if(!$data[0])
		echo 'OK';
		else
		echo  "<script>window.location = 'index.php?core-api-index-getdiyu&page=".intval($page + 1)."';</script>";
	}

	private function test()
	{
		$r = array(
			'discount' => '0.00',
			'payment_type' => '1',
			'subject' => '国通商城商品',
			'trade_no' => '2016101421001004900291069193',
			'buyer_email' => '1039930842@qq.com',
			'gmt_create' => '2016-10-14 14:23:33',
			'notify_type' => 'trade_status_sync',
			'quantity' => '1',
			'out_trade_no' => '20161014142314143719',
			'seller_id' => '2088221435509601',
			'notify_time' => '2016-10-14 14:23:34',
			'body' => 'lala',
			'trade_status' => 'TRADE_SUCCESS',
			'is_total_fee_adjust' => 'N',
			'total_fee' => '0.01',
			'gmt_payment' => '2016-10-14 14:23:34',
			'seller_email' => 'gtmal@gtmal.com',
			'price' => '0.01',
			'buyer_id' => '2088612495080904',
			'notify_id' => 'fb71aa8f38787bd873267ee4e70e899my2',
			'use_coupon' => 'N',
			'sign_type' => 'RSA',
			'sign' => 'CCSJ1kQdT0+EPENBGCuHiaPzqex1NIvXIVMovx77t7h8PVRuJEquOT8lM8WMDyuy057vUpjimXe3QrqTGmIKUsifiu7aiDktNGz0XHs2YiHnuq746GZc1hVSZe6z0G5keHgcd2BS758d/XiBVpWNlxqTI2uhO3Tf/a6dytO174U='
		);

		$url = "http://m.gtmal.com/api/alipayapi.php";
		$post_data = $r;
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		// post数据
		curl_setopt($ch, CURLOPT_POST, 1);
		// post的变量
		curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);
		$output = curl_exec($ch);
		curl_close($ch);
		//打印获得的数据
		exit;
		$http = $this->G->make('http');
		$http->post('http://m.gtmal.com/api/alipayapi.php',$r);
		echo $http->data;
	}

	private function qrcode()
	{
		header("Content-type: image/png");
		require_once("lib/include/phpqrcode.php");
		$data = urldecode($this->ev->get('data'));
		QRcode::png($data);
	}

	private function index()
	{
		//
	}
}


?>
