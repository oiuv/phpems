<?php

class work
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
		$this->tpl = $this->G->make('tpl');
		$this->pg = $this->G->make('pg');
		$this->ev = $this->G->make('ev');
	}

	public function getStartTime()
	{
		$n = date('Y-m-d',TIME);
		$week = date('w',TIME);
		$starttime = strtotime($n) - $week*24*3600;
		return $starttime;
	}

	public function getThisWorkList($args)
	{
		$time = $this->getStartTime();
		$endtime = $time+7*24*3600;
		$data = array(false,'work',array(array("AND","workday >= :workday",'workday',$time),array("AND","workday < :workday",'workday',$endtime)),false,'workday ASC',false);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetchAll($sql,false,'workinfo');
	}

	public function getNewTime()
	{
		$data = array("MAX(workday) AS maxday",'work',1);
		$sql = $this->pdosql->makeSelect($data);
		$r = $this->db->fetch($sql);
		if($r['maxday'])
		return $r['maxday'] + 24*3600;
		else
		return strtotime(date('Y-m-d',TIME));
	}

	public function addWork($args)
	{
		return $this->db->insertElement(array('table' => 'work','query' => $args));
	}

	public function modifyWork($id,$args)
	{
		$data = array('work',$args,"workid = '{$id}'");
		$sql = $this->pdosql->makeUpdate($data);
		return $this->db->exec($sql);
	}

	public function delWork($id)
	{
		return $this->db->delElement(array('table' => 'work','query' => array(array("AND","workid = :workid",'workid',$id))));
	}

	public function getWorkById($id)
	{
		$data = array(false,'work',array(array("AND","workid = :workid",'workid',$id)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql,'workinfo');
	}

	public function getWorkList($args,$page,$number = 10)
	{
		$data = array(
			'select' => false,
			'table' => 'work',
			'query' => $args,
			'serial' => 'workinfo',
			'orderby' => 'workday DESC'
		);
		$r = $this->db->listElements($page,$number,$data);
		return $r;
	}

}

?>
