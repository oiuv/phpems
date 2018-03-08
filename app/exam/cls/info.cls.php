<?php
/*
 * Created on 2011-11-21
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 * 对信息进行操作
 */
class info_exam
{
	public $G;

	public function __construct(&$G)
	{
		$this->G = $G;
		$this->sql = $this->G->make('sql');
		$this->db = $this->G->make('db');
		$this->pg = $this->G->make('pg');
		$this->ev = $this->G->make('ev');
	}

	//获取信息列表
	public function getInfoList($page,$number = 20,$args = 1)
	{
		$page = $page > 0?$page:1;
		$r = array();
		$data = array(false,'info',$args,false,'infosequence DESC,infoid DESC',array(intval($page-1)*$number,$number));
		$sql = $this->sql->makeSelect($data);
		$r['data'] = $this->db->fetchAll($sql,'infoid');
		$data = array('count(*) AS number','info',$args);
		$sql = $this->sql->makeSelect($data);
		$t = $this->db->fetch($sql);
		$pages = $this->pg->outPage($this->pg->getPagesNumber($t['number'],$number),$page);
		$r['pages'] = $pages;
		$r['number'] = $t['number'];
		return $r;
	}

	//根据ID查询信息
	public function getInfoById($infoid)
	{
		$data = array(false,'info',"infoid = '{$infoid}'");
		$sql = $this->sql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	//根据参数查询单一信息
	public function getInfoByArgs($args)
	{
		$data = array(false,'info',$args);
		$sql = $this->sql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	//增加信息
	public function addInfo($args)
	{
		$data = array('info',$args);
		$sql = $this->sql->makeInsert($data);
		$this->db->exec($sql);
		return $this->db->lastInsertId();
	}

	//删除信息
	public function delInfo($id)
	{
		$data = array('info',"infoid = '{$id}'");
		$sql = $this->sql->makeDelete($data);
		$this->db->exec($sql);
		return $this->db->affectedRows();
	}

	//修改信息内容
	public function modifyInfo($infoid,$args)
	{
		$data = array('info',$args,"infoid = '{$infoid}'");
		$sql = $this->sql->makeUpdate($data);
		$this->db->exec($sql);
		return $this->db->affectedRows();
	}

	//获取信息分类列表
	public function getCategoryList()
	{
		$data = array(false,'info_category');
		$sql = $this->sql->makeSelect($data);
		return $this->db->fetchAll($sql,'categoryid');
	}

	//根据分类名查询分类
	public function getCategoryByName($category)
	{
		$data = array(false,'info_category',"category = '{$category}'");
		$sql = $this->sql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	//根据分类ID查询分类
	public function getCategoryById($categoryid)
	{
		$data = array(false,'info_category',"categoryid = '{$categoryid}'");
		$sql = $this->sql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	//增加分类
	public function addCategory($args)
	{
		$data = array('info_category',$args);
		$sql = $this->sql->makeInsert($data);
		$this->db->exec($sql);
		return $this->db->lastInsertId();
	}

	//删除分类
	public function delCategory($id)
	{
		$data = array('info_category',"categoryid = '{$id}'");
		$sql = $this->sql->makeDelete($data);
		$this->db->exec($sql);
		return $this->db->affectedRows();
	}

	//更改分类名称
	public function modifyCategory($categoryid,$args)
	{
		$data = array('info_category',$args,"categoryid = '{$categoryid}'");
		$sql = $this->sql->makeUpdate($data);
		$this->db->exec($sql);
		return $this->db->affectedRows();
	}

	//根据分类和地区获取最新信息
	public function getLastInfoByCategoryAndArea($categoryid,$areaid)
	{
		$data = array(false,'info',array("infocategoryid = '{$categoryid}'","infoareaid = '{$areaid}'"),false,"infoid DESC",1);
		$sql = $this->sql->makeSelect($data);
		return $this->db->fetch($sql);
	}
}

?>
