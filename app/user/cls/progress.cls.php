<?php

class progress_user
{
	public $G;

	public function __construct(&$G)
	{
		$this->G = $G;
	}

	public function _init()
	{
		$this->pdosql = $this->G->make('pdosql');
		$this->db = $this->G->make('pepdo');
		$this->ev = $this->G->make('ev');
	}

	public function addProgress($args)
	{
        $data = array('progress',$args);
        $sql = $this->pdosql->makeInsert($data);
        $this->db->exec($sql);
        return $this->db->lastInsertId();
	}

	public function modifyProgress($prsid,$args)
	{
        $data = array('progress',$args,array(array('AND',"prsid = :prsid",'prsid',$prsid)));
        $sql = $this->pdosql->makeUpdate($data);
        return $this->db->exec($sql);
	}

    public function modifyProgressByArgs($sargs,$args)
    {
        $data = array('progress',$args,$sargs);
        $sql = $this->pdosql->makeUpdate($data);
        return $this->db->exec($sql);
    }

	public function delProgress($prsid)
	{
		$data = array('progress',array(array('AND',"prsid = :prsid",'prsid',$prsid)));
		$sql = $this->pdosql->makeDelete($data);
		return $this->db->exec($sql);
	}

	public function getProgressById($prsid)
	{
        $data = array(false,'progress',array(array('AND',"prsid = :prsid",'prsid',$prsid)));
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);
	}

	public function getProgressByArgs($args)
	{
        $data = array(false,'progress',$args);
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetch($sql);
	}

	public function getProgressesByArgs($args)
	{
        $data = array(false,'progress',$args);
        $sql = $this->pdosql->makeSelect($data);
        return $this->db->fetchAll($sql);
	}

	public function getUserProgressesListByArgs($args,$page,$number = 10)
	{
        $args[] = array("AND",'prsuserid = userid');
		$args = array(
			'table' => array('user','progress'),
			'query' => $args,
			'index' => 'prsid'
		);
		return $this->db->listElements($page,$number,$args);
	}
}

?>
