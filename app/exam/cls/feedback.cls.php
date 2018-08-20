<?php

class feedback_exam
{
	public $G;

	public function __construct(&$G)
	{
		$this->G = $G;
		$this->pdosql = $this->G->make('pdosql');
		$this->db = $this->G->make('pepdo');
		$this->pg = $this->G->make('pg');
		$this->ev = $this->G->make('ev');
	}

	//获取试题反馈列表
	//参数：
	//返回值：地区列表
	public function getFeedBackList($args = 1,$page,$number = 20)
	{
		$data = array(
			'select' => false,
			'table' => 'feedback',
			'query' => $args,
			'orderby' => 'fbid desc'
		);
		return $this->db->listElements($page,$number,$data);
	}

	public function addFeedBack($args)
	{
		$args['fbtime'] = TIME;
		$data = array('feedback',$args);
		$sql = $this->pdosql->makeInsert($data);
		$this->db->exec($sql);
		return $this->db->lastInsertId();
	}

	//根据地名查询
	//参数：地名字符串
	//返回值：该地名信息数组
	public function getFeedBackById($id)
	{
		$data = array(false,'feedback',array(array("AND","fbid = :fbid",'fbid',$id)),false,false,false);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	//根据ID获取地名信息
	//参数：地名ID
	//返回值：该地名信息数组
	public function modifyFeedBackById($id,$args)
	{
		$data = array('feedback',$args,array(array("AND","fbid = :fbid",'fbid',$id)));
		$sql = $this->pdosql->makeUpdate($data);
		return $this->db->exec($sql);
	}

	//修改地名信息
	//参数：地名ID,要修改的信息
	//返回值：true
	public function delFeedBack($id)
	{
		$data = array('feedback',array(array("AND","fbid = :fbid",'fbid',$id)));
		$sql = $this->pdosql->makeDelete($data);
		return $this->db->exec($sql);
	}
}

?>
