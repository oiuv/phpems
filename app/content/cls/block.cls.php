<?php

class block_content
{
	public $G;

	public function __construct(&$G)
	{
		$this->G = $G;
	}

	public function _init()
	{
		$this->categories = NULL;
		$this->tidycategories = NULL;
		$this->sql = $this->G->make('sql');
		$this->pdosql = $this->G->make('pdosql');
		$this->db = $this->G->make('pepdo');
		$this->pg = $this->G->make('pg');
		$this->ev = $this->G->make('ev');
	}

	public function getBlockList($args,$page,$number = 20)
	{
		$data = array(
			'select' => false,
			'table' => 'block',
			'query' => $args,
			'orderby' => 'blockid DESC'
		);
		return $this->db->listElements($page,$number,$data);
	}

	public function addBlock($args)
	{
		$data = array('block',$args);
		$sql = $this->pdosql->makeInsert($data);
		$this->db->exec($sql);
		return $this->db->lastInsertId();
	}

	public function delBlock($id)
	{
		return $this->db->delElement(array('table' => 'block','query' => array(array("AND","blockid = :blockid",'blockid',$id))));
	}

	public function getBlockById($id)
	{
		$data = array(false,'block',array(array("AND","blockid = :blockid",'blockid',$id)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql,'blockcontent');
	}

	public function modifyBlock($id,$args)
	{
		$data = array('block',$args,array(array("AND","blockid = :blockid",'blockid',$id)));
		$sql = $this->pdosql->makeUpdate($data);
		return $this->db->exec($sql);
	}
}

?>
