<?php
/*
 * Created on 2015-10-29
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */

class exercise_exam
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

	//根据参数查询
	public function getExerciseProcessByUser($userid,$basicid)
	{
		$data = array(false,'exercise',array(array("AND","exeruserid = :exeruserid",'exeruserid',$userid),array("AND","exerbasicid = :exerbasicid",'exerbasicid',$basicid)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	public function setExercise($args)
	{
		$userid = $args['exeruserid'];
		$basicid = $args['exerbasicid'];
		$r = $this->getExerciseProcessByUser($userid,$basicid);
		if($r)
		{
			$data = array('exercise',$args,array(array("AND","exerid = :exerid",'exerid',$r['exerid'])));
			$sql = $this->pdosql->makeUpdate($data);
			$this->db->exec($sql);
		}
		else
		{
			$data = array('exercise',$args);
			$sql = $this->pdosql->makeInsert($data);
			$this->db->exec($sql);
		}
		return true;
	}
}


?>
