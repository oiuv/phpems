<?php

class coupon_bank
{
	public $G;

	public function __construct(&$G)
	{
		$this->G = $G;
	}

	public function _init()
	{
		$this->sql = $this->G->make('sql');
		$this->pdosql = $this->G->make('pdosql');
		$this->db = $this->G->make('pepdo');
		$this->ev = $this->G->make('ev');
		$this->files = $this->G->make('files');
	}

	public function getCouponList($args,$page,$number = 10)
	{
		$data = array(
			'select' => false,
			'table' => 'coupon',
			'query' => $args,
			'orderby' => 'couponaddtime DESC'
		);
		return $this->db->listElements($page,$number,$data);
	}

	public function clearOutTimeCoupon()
	{
		return $this->db->delElement(array('table' => 'coupon','query' => array(array("AND","couponendtime <= :couponendtime",'couponendtime',TIME))));
	}

	public function delCoupon($id)
	{
		return $this->db->delElement(array('table' => 'coupon','query' => array(array("AND","couponsn = :couponsn",'couponsn',$id))));
	}

	public function addCoupon($args)
	{
		return $this->db->insertElement(array('table' => 'coupon','query' => $args));
	}

	public function getCouponById($id)
	{
		$data = array(false,'coupon',array(array("AND","couponsn = :couponsn",'couponsn',$id)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	public function getAllOKCoupon($stime,$etime)
	{
		$data = array('couponsn','coupon',array(array("AND","couponaddtime >= :couponaddstime",'couponaddstime',$stime),array("AND","couponaddtime <= :couponaddetime",'couponaddetime',$etime),array("AND","couponstatus = 0")),false,false,false);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetchAll($sql);
	}

	public function useCouponById($id,$userid)
	{
		$r = $this->getCouponById($id);
		if(!$r)return false;
		if($r['couponstatus'])
		return 301;
		elseif($r['couponendtime'] < TIME)
		return 302;
		else
		{
			$user = $this->G->make('user','user');
			if($r['couponvalue'] < 0)$r['couponvalue'] = 0;
			$u = $user->getUserById($userid);
			$coin = $u['usercoin'] + $r['couponvalue'];
			$args = array('usercoin' => $coin);
			$user->modifyUserInfo($args,$userid);
			$args = array('couponstatus' => 1);
			$data = array('coupon',$args,array(array("AND","couponsn = :couponsn",'couponsn',$id)));
			$sql = $this->pdosql->makeUpdate($data);
			$this->db->exec($sql);
			return 200;
		}
	}

	public function randCoupon($value,$endtime = NULL)
	{
		if(!$value)return 0;
		if(!$endtime)$endtime = TIME + 3600*24*365;
		$t = microtime().rand(1000,9999).CS;
		$sn = strtoupper(substr(md5($t),0,16));
		$r = $this->getCouponById($sn);
		if($r)$this->randCoupon($value);
		else
		{
			$args = array('couponsn' => $sn,'couponvalue'=>$value,'couponstatus'=>0,'couponaddtime'=>TIME,'couponendtime'=>$endtime);
			$this->addCoupon($args);
		}
		return true;
	}
}

?>
