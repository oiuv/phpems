<?php

class course_course
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
		$this->pdosql = $this->G->make('pdosql');
		$this->db = $this->G->make('pepdo');
		$this->pg = $this->G->make('pg');
		$this->ev = $this->G->make('ev');
	}

	public function getCourseList($args,$page,$number = 20,$order = 'cstime DESC,csid DESC')
	{
		$data = array(
			'select' => false,
			'table' => 'coursesubject',
			'query' => $args,
			'orderby' => $order
		);
		$r = $this->db->listElements($page,$number,$data);
		return $r;
	}
	
	public function getCourseNumberByCsid($csid)
	{
		$data = array('count(*) as number','course',array(array("AND",'coursecsid = :coursecsid','coursecsid',$csid)));
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql);
        return $r['number'];
	}
	
	public function getCourseContentStatus($courseid,$userid)
	{
		$cdata = array('course' => array(),'content' => array(),'index' => array(),'lock' => array());
		$course = $this->getCourseById($courseid);
		$data = array('courseid','course',array(array('AND',"coursecsid = :coursecsid",'coursecsid',$course['csid'])),false,'coursesequence DESC,courseinputtime ASC,courseid ASC');
		$sql = $this->pdosql->makeSelect($data);
		$r = $this->db->fetchAll($sql);
		$i = 0;
		foreach($r as $p)
		{
			$cdata['course'][$i] = $p['courseid'];
			$cdata['index'][$p['courseid']] = $i;
			$this->log = $this->G->make('log','course');
			$largs = array();
			$largs[] = array("AND","loguserid = :loguserid","loguserid",$userid);
			$largs[] = array("AND","logcourseid = :logcourseid","logcourseid",$p['courseid']);
			$rs = $this->log->getLogByArgs($largs);
			if($rs['logstatus'])$cdata['content'][$i] = $rs['logid'];
			$i++;
		}
		foreach($cdata['course'] as $key => $p)
		{
			if($key)
			{
				if($cdata['content'][intval($key - 1)])$cdata['lock'][$p] = 0;
				else
				$cdata['lock'][$p] = 1;
			}
			else
			$cdata['lock'][$p] = 0;
		}
		return $cdata;
	}

	public function delCourse($id)
	{
		return $this->db->delElement(array('table' => 'coursesubject','query' => array(array('AND',"csid = :csid",'csid',$id))));
	}

	public function modifyCourse($id,$args)
	{
		$data = array(
			'table' => 'coursesubject',
			'value' => $args,
			'query' => array(array('AND',"csid = :oldcsid",'oldcsid',$id))
		);
		return $this->db->updateElement($data);
	}

	public function addCourse($args)
	{
		return $this->db->insertElement(array('table' => 'coursesubject','query' => $args));
	}

	private function _getBasicCourseById($id)
	{
		$data = array(false,'coursesubject',array(array('AND',"csid = :csid",'csid',$id)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	private function _modifyBasicCourseById($id,$args)
	{
		$data = array('coursesubject',$args,array(array('AND',"csid = :csid",'csid',$id)));
		$sql = $this->pdosql->makeUpdate($data);
		return $this->db->exec($sql);
	}

	public function modifyBasciCourse($id,$args)
	{
		$this->_modifyBasicCourseById($id,$args);
	}

	public function getBasicCourseById($id)
	{
		return $this->_getBasicCourseById($id);
	}

	public function getCourseById($id)
	{
		$data = array(false,'coursesubject',array(array('AND',"csid = :csid",'csid',$id)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	public function getNearCourseById($id,$catid)
	{
		$r = array();
		$data = array(false,'coursesubject',array(array('AND',"csid < :csid",'csid',$id),array('AND',"cscatid = :catid",'catid',$catid)),false,"csid DESC",5);
		$sql = $this->pdosql->makeSelect($data);
		$r['pre'] = $this->db->fetchAll($sql);
		$data = array(false,'coursesubject',array(array('AND',"csid > :csid",'csid',$id),array('AND',"cscatid = :catid",'catid',$catid)),false,"csid ASC",5);
		$sql = $this->pdosql->makeSelect($data);
		$r['next'] = $this->db->fetchAll($sql);
		return $r;
	}

	public function getOpenCourseByUserid($userid)
	{
		$data = array(false,array('opencourse','course'),array(array("AND","opencourse.ocuserid = :userid",'userid',$userid),array("AND","opencourse.occourseid = course.csid"),array("AND","opencourse.ocendtime > :ocendtime",'ocendtime',TIME)),false,"opencourse.ocendtime DESC,ocid DESC",false);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetchAll($sql,'occourseid');
	}

	public function getOpenCourseMember($args,$page,$number = 20,$order = 'octime DESC,ocid DESC')
	{
		$args[] = array("AND","opencourse.ocuserid = user.userid");
		$data = array(
			'select' => false,
			'table' => array('opencourse','user'),
			'query' => $args,
			'orderby' => $order
		);
		$r = $this->db->listElements($page,$number,$data);
		return $r;
	}

	public function openCourse($args)
	{
		$data = array('opencourse',array(array("AND","ocuserid = :ocuserid",'ocuserid',$args['ocuserid']),array("AND","occourseid = :occourseid",'occourseid',$args['occourseid'])));
		$sql = $this->pdosql->makeDelete($data);
		$this->db->exec($sql);
		$args['octime'] = TIME;
		$data = array('opencourse',$args);
		$sql = $this->pdosql->makeInsert($data);
		return $this->db->exec($sql);
	}

	public function delOpenCourse($ocid)
	{
		$data = array('opencourse',array(array("AND","ocid = :ocid",'ocid',$ocid)));
		$sql = $this->pdosql->makeDelete($data);
		return $this->db->exec($sql);
	}

	public function delOpenPassCourse($userid)
	{
		$data = array('opencourse',array(array("AND","ocuserid = :ocuserid",'ocuserid',$userid),array("AND","ocendtime <= :ocendtime",'ocendtime',TIME)));
		$sql = $this->pdosql->makeDelete($data);
		return $this->db->exec($sql);
	}

	public function getOpenCourseNumber($csid)
	{
		$data = array("count(*) as number",'opencourse',array(array("AND","occourseid = :occourseid",'occourseid',$csid),array("AND","ocendtime >= :ocendtime",'ocendtime',TIME)));
		$sql = $this->pdosql->makeSelect($data);
		$r = $this->db->fetch($sql);
		return $r['number'];
	}

	public function getOpenCourseById($ocid)
	{
		$data = array(false,'opencourse',array(array("AND","ocid = :ocid",'ocid',$ocid)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	public function getOpenCourseByUseridAndCsid($userid,$csid)
	{
		$data = array(false,'opencourse',array(array("AND","ocuserid = :ocuserid",'ocuserid',$userid),array("AND","occourseid = :occourseid",'occourseid',$csid),array("AND","ocendtime > :ocendtime",'ocendtime',TIME)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

    public function getOpenCourseListByUserid($userid,$page,$number = 20)
    {
        $data = array(
            'select' => false,
            'table' => array('opencourse','coursesubject'),
            'query' => array(array("AND","opencourse.ocuserid = :userid",'userid',$userid),array("AND","opencourse.occourseid = coursesubject.csid"),array("AND","opencourse.ocendtime > :ocendtime",'ocendtime',TIME)),
            'orderby' => "opencourse.ocendtime DESC,ocid DESC"
        );
        $r = $this->db->listElements($page,$number,$data);
        return $r;
    }
}

?>
