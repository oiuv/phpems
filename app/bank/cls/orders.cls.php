<?php

class orders_bank
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

	public function getOrderList($args,$page,$number = 20,$order = 'ordercreatetime DESC')
	{
		$data = array(
			'select' => false,
			'table' => 'orders',
			'query' => $args,
			'orderby' => $order,
			'serial' => array('orderitems','orderuserinfo')
		);
		$r = $this->db->listElements($page,$number,$data);
		return $r;
	}

	public function delOrder($id)
	{
		return $this->db->delElement(array('table' => 'orders','query' => array(array("AND","ordersn = :ordersn",'ordersn',$id))));
	}

	public function modifyOrder($id,$args)
	{
		$data = array(
			'table' => 'orders',
			'value' => $args,
			'query' => array(array("AND","ordersn = :ordersn",'ordersn',$id))
		);
		return $this->db->updateElement($data);
	}

	public function addOrder($args)
	{
		return $this->db->insertElement(array('table' => 'orders','query' => $args));
	}

	public function getOrderById($id,$userid = null)
	{
		if($userid)
		$data = array(false,'orders',array(array("AND","ordersn = :ordersn",'ordersn',$id),array("AND","orderuserid = :orderuserid",'orderuserid',$userid)));
		else
		$data = array(false,'orders',array(array("AND","ordersn = :ordersn",'ordersn',$id)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql,array('orderitems','orderpost','orderuserinfo'));
	}

	public function modifyOrderById($id,$args)
	{
		$data = array('orders',$args,array(array("AND","ordersn = :ordersn",'ordersn',$id)));
		$sql = $this->pdosql->makeUpdate($data);
		return $this->db->exec($sql);
	}

	public function addSaledItem($args)
	{
		return $this->db->insertElement(array('table' => 'saleditems','query' => $args));
	}
}

?>
