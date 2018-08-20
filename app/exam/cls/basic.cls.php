<?php
/*
 * Created on 2011-11-21
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 * 对地区进行操作
 */
class basic_exam
{
	public $G;

	public function __construct(&$G)
	{
		$this->G = $G;
		$this->sql = $this->G->make('sql');
		$this->pdosql = $this->G->make('pdosql');
		$this->db = $this->G->make('pepdo');
		$this->pg = $this->G->make('pg');
		$this->ev = $this->G->make('ev');
	}

	public function getBestBasics()
	{
		$t = TIME - 30*24*2400;
		$data = array("count(*) AS number,ehbasicid",'examhistory',array(array("AND","ehstarttime >= :ehstarttime",'ehstarttime',$t)),"ehbasicid","number DESC",6);
		$sql = $this->pdosql->makeSelect($data);
		$r = $this->db->fetchAll($sql);
		$ids = array();
		$number = array();
		foreach($r as $p)
		{
			$ids[] = $p['ehbasicid'];
			$number[$p['ehbasicid']] = $p['number'];
		}
		$ids = implode(',',$ids);
		if(!$ids)
		return false;
		$rs = array();
		$rs['basic'] = $this->getBasicsByArgs(array(array("AND","find_in_set(basicid,:ids)",'ids',$ids)));
		$rs['number'] = $number;
		return $rs;
	}

	public function getOpenBasicsByUserid($userid)
	{
		$data = array(false,array('openbasics','basic'),array(array("AND","openbasics.obuserid = :userid",'userid',$userid),array("AND","basic.basicclosed = 0"),array("AND","openbasics.obbasicid = basic.basicid"),array("AND","openbasics.obendtime > :obendtime",'obendtime',TIME)),false,"openbasics.obendtime DESC,obid DESC",false);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetchAll($sql,'obbasicid',array('basicknows','basicsection','basicexam'));
	}

	public function openBasic($args)
	{
		$data = array('openbasics',array(array("AND","obuserid = :obuserid",'obuserid',$args['obuserid']),array("AND","obbasicid = :obbasicid",'obbasicid',$args['obbasicid'])));
		$sql = $this->pdosql->makeDelete($data);
		$this->db->exec($sql);
		$args['obtime'] = TIME;
		$data = array('openbasics',$args);
		$sql = $this->pdosql->makeInsert($data);
		return $this->db->exec($sql);
	}

	public function delOpenBasic($obid)
	{
		$data = array('openbasics',array(array("AND","obid = :obid",'obid',$obid)));
		$sql = $this->pdosql->makeDelete($data);
		return $this->db->exec($sql);
	}

	public function delOpenPassBasic($userid)
	{
		$data = array('openbasics',array(array("AND","obuserid = :obuserid",'obuserid',$userid),array("AND","obendtime <= :obendtime",'obendtime',TIME)));
		$sql = $this->pdosql->makeDelete($data);
		return $this->db->exec($sql);
	}

	public function getOpenBasicMember($args,$page,$number = 20,$order = 'obtime DESC,obid DESC')
	{
		$args[] = array("AND","openbasics.obuserid = user.userid");
		$data = array(
			'select' => false,
			'table' => array('openbasics','user'),
			'query' => $args,
			'orderby' => $order
		);
		$r = $this->db->listElements($page,$number,$data);
		return $r;
	}

	public function getOpenBasicNumber($basicid)
	{
		$data = array("count(*) as number",'openbasics',array(array("AND","obbasicid = :obbasicid",'obbasicid',$basicid),array("AND","obendtime >= :obendtime",'obendtime',TIME)));
		$sql = $this->pdosql->makeSelect($data);
		$r = $this->db->fetch($sql);
		return $r['number'];
	}

	public function getOpenBasicById($obid)
	{
		$data = array(false,'openbasics',array(array("AND","obid = :obid",'obid',$obid)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	public function getOpenBasicByUseridAndBasicid($userid,$basicid)
	{
		$data = array(false,'openbasics',array(array("AND","obuserid = :obuserid",'obuserid',$userid),array("AND","obbasicid = :obbasicid",'obbasicid',$basicid),array("AND","obendtime > :obendtime",'obendtime',TIME)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	//获取科目列表
	//参数：无
	//返回值：科目列表数组
	public function getSubjectList($args = 1)
	{
		$data = array(false,'subject',$args);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetchAll($sql,'subjectid','subjectsetting');
	}

	//根据科目查询
	//参数：科目名称字符串
	//返回值：科目信息数组
	public function getSubjectByName($subject)
	{
		$data = array(false,'subject',array(array("AND","subject = :subject",'subject',$subject)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql,'subjectsetting');
	}

	//根据科目ID查询科目信息
	//参数：科目ID整数
	//返回值：科目信息数组
	public function getSubjectById($subjectid)
	{
		$data = array(false,'subject',array(array("AND","subjectid = :subjectid",'subjectid',$subjectid)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql,'subjectsetting');
	}

	//修改科目信息
	//参数：科目ID，修改的信息数组
	//返回值：true
	public function modifySubject($subjectid,$args)
	{
		$data = array('subject',$args,array(array("AND","subjectid = :subjectid",'subjectid',$subjectid)));
		$sql = $this->pdosql->makeUpdate($data);
		$this->db->exec($sql);
		return true;
	}

	//增加科目
	//参数：科目ID，修改的信息数组
	//返回值：true
	public function addSubject($args)
	{
		$data = array('subject',$args);
		$sql = $this->pdosql->makeInsert($data);
		$this->db->exec($sql);
		return $this->db->lastInsertId();
	}

	//删除科目
	//参数：科目ID
	//返回值：受影响的记录数
	public function delSubject($id)
	{
		$data = array('subject',array(array("AND","subjectid = :subjectid",'subjectid',$id)));
		$sql = $this->pdosql->makeDelete($data);
		return $this->db->exec($sql);
		//return $this->db->affectedRows();
	}

	//设置地区配置信息
	//参数：科目ID，配置信息数组
	//返回值：受影响的记录数
	public function setSubjectConfig($id,$args)
	{
		$data = array('subject',$args,array(array("AND","subjectid = :subjectid",'subjectid',$id)));
		$sql = $this->pdosql->makeUpdate($data);
		return $this->db->exec($sql);
		//return $this->db->affectedRows();
	}

	//通过获取地区、科目、代码对应关系列表
	//参数：页码，每页显示数量，查询信息数组
	//返回值：配置信息数组
	public function getBasicList($page,$number = 20,$args = 1)
	{
		$page = $page > 0?$page:1;
		$r = array();
		$data = array(false,'basic',$args,false,"basicid DESC",array(intval($page-1)*$number,$number));
		$sql = $this->pdosql->makeSelect($data);
		$r['data'] = $this->db->fetchAll($sql,'basicid',array('basicknows','basicsection','basicexam'));
		$data = array('count(*) AS number','basic',$args);
		$sql = $this->pdosql->makeSelect($data);
		$t = $this->db->fetch($sql);
		$pages = $this->pg->outPage($this->pg->getPagesNumber($t['number'],$number),$page);
		$r['pages'] = $pages;
		$r['number'] = $t['number'];
		return $r;
	}

	//通过ID获取地区、科目、代码对应关系
	//参数：页码，每页显示数量，配置信息数组
	//返回值：配置信息数组
	public function getBasicById($id)
	{
		$data = array(false,'basic',array(array("AND","basicid = :basicid",'basicid',$id)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql,array('basicknows','basicsection','basicexam'));
	}

	public function getBasicByArgs($args)
	{
		$data = array(false,'basic',$args);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql,array('basicknows','basicsection','basicexam'));
	}

	public function getBasicsByArgs($args,$ordeby = false)
	{
		$data = array(false,'basic',$args,false,$ordeby);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetchAll($sql,'basicid',array('basicknows','basicsection','basicexam'));
	}

	//通过考试ID获取地区、科目、代码对应关系
	//参数：考试ID
	//返回值：对应关系数组
	public function getBasicByExamid($id)
	{
		$data = array(false,array('basic','subject'),array(array("AND","basicexamid = :basicexamid",'basicexamid',$id),array("AND","basic.basicsubjectid = subject.subjectid")));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetchAll($sql,array('basicknows','basicsection','basicexam'));
	}

	//通过多个考试ID获取地区、科目、代码对应关系
	//参数：多个考试ID，以英文逗号连接
	//返回值：对应关系列表数组
	public function getBasicsByApi($id)
	{
		if(!$id)return false;
		$data = array(false,'basic',array(array("AND","find_in_set(basicexamid,:basicexamid)","basicexamid",$id)),false,"basicid ASC",false);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetchAll($sql,'basicid',array('basicknows','basicsection','basicexam'));
	}

	//添加地区、科目、代码对应关系
	//参数：要添加的对应关系形成的数组
	//返回值：插入的记录ID
	public function addBasic($args)
	{
		$data = array('basic',$args);
		$sql = $this->pdosql->makeInsert($data);
		$this->db->exec($sql);
		return $this->db->lastInsertId();
	}

	//设置地区、科目、代码对应关系
	//参数：要添加的对应关系形成的数组
	//返回值：插入的记录ID
	public function setBasicConfig($id,$args)
	{
		$data = array('basic',$args,array(array("AND","basicid = :basicid",'basicid',$id)));
		$sql = $this->pdosql->makeUpdate($data);
		return $this->db->exec($sql);
		//$this->db->affectedRows();
	}

	//删除地区、科目、代码对应关系
	//参数：对应关系ID
	//返回值：受影响的记录数
	public function delBasic($id)
	{
		$data = array('basic',array(array("AND","basicid = :basicid",'basicid',$id)));
		$sql = $this->pdosql->makeDelete($data);
		return $this->db->exec($sql);
		//$this->db->affectedRows();
	}

	//获取题型列表
	//参数：查询条件数组
	//返回值：题型列表数组
	public function getQuestypeList($args = 1)
	{
		$data = array(false,'questype',$args);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetchAll($sql,'questid');
	}

	//根据题型名查询
	//参数：题型名称字符串
	//返回值：题型数组
	public function getQuestypeByName($questype)
	{
		$data = array(false,'questype',array(array("AND","questype = :questype",'questype',$questype)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	//根据题型ID查询
	//参数：题型ID
	//返回值：题型数组
	public function getQuestypeById($questid)
	{
		$data = array(false,'questype',array(array("AND","questid = :questid",'questid',$questid)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	//增加题型
	//参数：题型信息数组
	//返回值：插入的ID
	public function addQuestype($args)
	{
		$data = array('questype',$args);
		$sql = $this->pdosql->makeInsert($data);
		$this->db->exec($sql);
		return $this->db->lastInsertId();
	}

	//修改题型
	//参数：题型ID，修改信息数组
	//返回值：受影响的记录数
	public function modifyQuestype($questid,$args)
	{
		$data = array('questype',$args,array(array("AND","questid = :questid",'questid',$questid)));
		$sql = $this->pdosql->makeUpdate($data);
		return $this->db->exec($sql);
		//return $this->db->affectedRows();
	}

	//删除题型
	//参数：题型ID
	//返回值：受影响的记录数
	public function delQuestype($questid)
	{
		$data = array('questype',array(array("AND","questid = :questid",'questid',$questid)));
		$sql = $this->pdosql->makeDelete($data);
		return $this->db->exec($sql);
		//return $this->db->affectedRows();
	}

}

?>
