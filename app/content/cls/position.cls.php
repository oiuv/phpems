<?php

class position_content
{
	public $G;

	public function __construct(&$G)
	{
		$this->G = $G;
	}

	public function _init()
	{
		$this->positions = NULL;
		$this->sql = $this->G->make('sql');
		$this->pdosql = $this->G->make('pdosql');
		$this->db = $this->G->make('pepdo');
		$this->pg = $this->G->make('pg');
		$this->ev = $this->G->make('ev');
	}

	public function getPosList()
	{
		$data = array(false,'position');
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetchAll($sql,'posid');
	}

	public function addPos($args)
	{
		$data = array('position',$args);
		$sql = $this->pdosql->makeInsert($data);
		$this->db->exec($sql);
		return $this->db->lastInsertId();
	}

	public function delPos($id)
	{
		return $this->db->delElement(array('table' => 'position','query' => array(array("AND","posid = :posid",'posid',$id))));
	}

	public function getPosById($id)
	{
		$data = array(false,'position',array(array("AND","posid = :posid",'posid',$id)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	public function modifyPos($id,$args)
	{
		$data = array('position',$args,array(array("AND","posid = :posid",'posid',$id)));
		$sql = $this->pdosql->makeUpdate($data);
        return $this->db->exec($sql);
	}

	public function getPosContentList($args,$page,$number = 20)
	{
		$data = array(
			'select' => false,
			'table' => 'poscontent',
			'query' => $args,
			'orderby' => 'pcsequence DESC, pcid DESC'
		);
		return $this->db->listElements($page,$number,$data);
	}

	public function getPosContentById($id)
	{
		$data = array(false,'poscontent',array(array("AND","pcid = :pcid",'pcid',$id)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	public function getPosContentByArgs($args)
	{
		$data = array(false,'poscontent',$args,false,"pcid DESC");
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	public function getPosContentNumber($posid)
	{
        $data = array('count(*) as number','poscontent',array(array("AND","pcposid = :pcposid","pcposid",$posid)));
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);
        return $r['number'];
	}

	public function addPosContent($args)
	{
		$data = array('poscontent',$args);
		$sql = $this->pdosql->makeInsert($data);
		$this->db->exec($sql);
		return $this->db->lastInsertId();
	}

	public function modifyPosContentByContentId($id,$args)
	{
		$data = array('poscontent',$args,array(array("AND","pccontentid = :pccontentid",'pccontentid',$id)));
		$sql = $this->pdosql->makeUpdate($data);
		$this->db->exec($sql);
		return $this->db->affectedRows();
	}

	public function modifyPosContent($id,$args)
	{
		$data = array('poscontent',$args,array(array("AND","pcid = :pcid",'pcid',$id)));
		$sql = $this->pdosql->makeUpdate($data);
        return $this->db->exec($sql);
	}

	public function delPosContent($id)
	{
		return $this->db->delElement(array('table' => 'poscontent','query' => array(array("AND","pcid = :pcid",'pcid',$id))));
	}
}

?>
