<?php
/*
 * Created on 2011-11-21
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 * 对地区进行操作
 */
class favor_exam
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
		$this->pg = $this->G->make('pg');
		$this->ev = $this->G->make('ev');
		$this->session = $this->G->make('session');
		$this->basic = $this->G->make('basic','exam');
		$this->exam = $this->G->make('exam','exam');
		$this->section = $this->G->make('section','exam');
	}

	public function getBestStudentsToday()
	{
		$t = TIME - 24*3600*7;
		$data = array("count(*) AS number,ehusername,max(ehscore) as ehscore",'examhistory',array(array("AND","ehstarttime >= :ehstarttime",'ehstarttime',$t)),"ehuserid","number DESC",10);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetchAll($sql);
	}

	public function getBestStudentsThisMonth()
	{
		$t = TIME - 24*3600*30;
		$data = array("count(*) AS number,ehusername,max(ehscore) as ehscore",'examhistory',array(array("AND","ehstarttime >= :ehstarttime",'ehstarttime',$t)),"ehuserid","number DESC",10);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetchAll($sql);
	}

	//通过用户ID获取收藏试题列表
	//参数：当前页码，单页显示数量，查询参数（数组或字符串）
	//返回值：试题列表数组
	public function getFavorListByUserid($page,$number = 20,$args = array(),$type = 0)
	{
		$page = $page > 0?$page:1;
		$r = array();
		if($type)
		{
			$args[] = array("AND","favor.favorquestionid = questions.questionid");
			$args[] = array("AND","questions.questionparent = questionrows.qrid");
			$args[] = array("AND","questionrows.qrid = quest2knows.qkquestionid");
			$args[] = array("AND","quest2knows.qktype = 1");
			$data = array("DISTINCT questions.*, favor.favorid, questionrows.*",array('favor','questionrows','questions','quest2knows'),$args,false,"favortime DESC,questionparent DESC,questionsequence ASC",array(intval($page-1)*$number,$number));
			$sql = $this->pdosql->makeSelect($data);
			$r['data'] = $this->db->fetchAll($sql,false,array('questionknowsid','qrknowsid'));
			$data = array('count(DISTINCT questions.questionid) AS number',array('favor','questionrows','questions','quest2knows'),$args);
			$sql = $this->pdosql->makeSelect($data);
			$t = $this->db->fetch($sql);
			$pages = $this->pg->outPage($this->pg->getPagesNumber($t['number'],$number),$page);
			$r['pages'] = $pages;
			$r['number'] = $t['number'];
		}
		else
		{
			$args[] = array("AND","favor.favorquestionid = questions.questionid");
			$args[] = array("AND","questions.questionid = quest2knows.qkquestionid");
			$args[] = array("AND","quest2knows.qktype = 0");
			$data = array("DISTINCT questions.*, favor.*",array('favor','questions','quest2knows'),$args,false,"favorid DESC",array(intval($page-1)*$number,$number));
			$sql = $this->pdosql->makeSelect($data);
			$r['data'] = $this->db->fetchAll($sql,false,'questionknowsid');
			$data = array('count(DISTINCT questions.questionid) AS number',array('favor','questions','quest2knows'),$args);
			$sql = $this->pdosql->makeSelect($data);
			$t = $this->db->fetch($sql);
			$pages = $this->pg->outPage($this->pg->getPagesNumber($t['number'],$number),$page);
			$r['pages'] = $pages;
			$r['number'] = $t['number'];
		}
		return $r;
	}

	//收藏试题
	//参数：试题ID，用户ID，考试ID
	//返回值：试题收藏后的插入ID
	public function favorQuestion($questionid,$userid,$subjectid)
	{
		$args = array("favorsubjectid"=>$subjectid,"favorquestionid" => $questionid,"favoruserid" => $userid,"favortime" => TIME );
		$data = array("favor",$args);
		$sql = $this->pdosql->makeInsert($data);
		$this->db->exec($sql);
		return $this->db->lastInsertId();
	}

	//根据ID获取试题是否收藏
	//本函数暂不用
	public function getFavorById($id)
	{
		$data = array(false,'favor',array("AND","favorid = :favorid",'favorid',$id));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql,'favorquestion');
	}

	//根据用户ID和试题ID获取试题是否收藏
	//参数：试题ID，用户ID
	//返回值：试题信息数组（无则为FALSE）
	public function getFavorByQuestionAndUserId($id,$userid)
	{
		$data = array(false,'favor',array(array("AND","favorquestionid = :favorquestionid",'favorquestionid',$id),array("AND","favoruserid = :favoruserid",'favoruserid',$userid)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql,'favorquestion');
	}

	//根据ID删除试题
	public function delFavorById($id)
	{
		$data = array("favor",array(array("AND","favorid = :favorid",'favorid',$id)));
		$sql = $this->pdosql->makeDelete($data);
		$this->db->exec($sql);
		return true;
	}

	//错题记录函数
	//新增错题记录
	public function addRecord($questionid,$userid,$examid)
	{
		$question = $this->exam->getQuestionByArgs(array(array("AND","questionid = :questionid",'questionid',$questionid)));
		$knows = $this->section->getKnowsByArgs(array(array("AND","knowsid = :knowsid",'knowsid',$question['questionknowsid'])));
		$section = $this->section->getSectionByArgs(array(array("AND","sectionid = :sectionid",'sectionid',$knows['knowssectionid'])));
		$args = array("recordexamid"=>$examid,"recordquestionid" => $questionid,"recordquestype" => $question['questiontype'],"recordquestion" => $this->ev->addSlashes(serialize($question['questionhtml'])),"recordsubjectid" => $section['sectionsubjectid'],"recordknowsid" => $question['questionknowsid'],"recorduserid" => $userid,"recordtime" => TIME );
		$data = array("record",$args);
		$sql = $this->pdosql->makeInsert($data);
		$this->db->exec($sql);
		return $this->db->lastInsertId();
	}

	//根据用户ID和试题ID获取试题是否被收入错题库
	public function getRecordByQuestionAndUserId($id,$userid)
	{
		$data = array(false,'record',array(array("AND","recordquestionid = :recordquestionid",'recordquestionid',$id),array("AND","recorduserid = :recorduserid",'recorduserid',$userid)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql,'recordquestion');
	}

	//删除错误记录
	public function delRecord($recordid)
	{
		$data = array("record",array(array("AND","recordid = :recordid",'recordid',$recordid)));
		$sql = $this->pdosql->makeDelete($data);
		$this->db->exec($sql);
		return true;
	}

	//通过用户ID获取错误试题列表
	public function getRecordListByUserid($page,$number = 20,$args = array())
	{
		$page = $page > 0?$page:1;
		$r = array();
		$data = array(false,'record',$args,false,"recordid DESC",array(intval($page-1)*$number,$number));
		$sql = $this->pdosql->makeSelect($data);
		$r['data'] = $this->db->fetchAll($sql,false,'recordquestion');
		$data = array('count(*) AS number','record',$args);
		$sql = $this->pdosql->makeSelect($data);
		$t = $this->db->fetch($sql);
		$pages = $this->pg->outPage($this->pg->getPagesNumber($t['number'],$number),$page);
		$r['pages'] = $pages;
		$r['number'] = $t['number'];
		return $r;
	}

	//根据用户和科目获取考试记录列表
	public function getExamHistoryListByArgs($page,$number = 20,$args = array(),$fields = false)
	{
		$page = $page > 0?$page:1;
		$r = array();
		$args[] = array("AND","examhistory.ehuserid = user.userid");
		$data = array($fields,array('examhistory','user'),$args,false,"ehscore DESC,ehid DESC",array(intval($page-1)*$number,$number));
		$sql = $this->pdosql->makeSelect($data);
		$r['data'] = $this->db->fetchAll($sql,'ehid');
		$data = array('count(*) AS number',array('examhistory','user'),$args);
		$sql = $this->pdosql->makeSelect($data);
		$t = $this->db->fetch($sql);
		$pages = $this->pg->outPage($this->pg->getPagesNumber($t['number'],$number),$page);
		$r['pages'] = $pages;
		$r['number'] = $t['number'];
		return $r;
	}

	//根据用户和科目获取考试记录列表
	public function getAllExamHistoryByArgs($args = array(),$fields = false)
	{
		$args[] = array("AND","examhistory.ehuserid = user.userid");
		$data = array($fields,array('examhistory','user'),$args,false,"ehscore DESC",false);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetchAll($sql);
	}

	public function getStatsAllExamHistoryByArgs($args = array())
	{
		$args[] = array("AND","examhistory.ehuserid = user.userid");
		$data = array(false,array('examhistory','user'),$args,false,"ehscore DESC",false);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetchAll($sql,false,array('ehscorelist','ehuseranswer','ehtimelist'));
	}

	//根据用户和ID获取一个考试记录
	public function getExamHistoryById($id)
	{
		$data = array(false,'examhistory',array(array("AND","ehid = :ehid",'ehid',$id)));
		$sql = $this->pdosql->makeSelect($data);
		$r = $this->db->fetch($sql,array('ehscorelist','ehuseranswer','ehtimelist'));
		$r['ehquestion'] = unserialize(gzuncompress(base64_decode($r['ehquestion'])));
		$r['ehsetting'] = unserialize(gzuncompress(base64_decode($r['ehsetting'])));
		return $r;
	}

    public function getExamHistoryByArgs($args)
    {
        $data = array(false,'examhistory',$args);
        $sql = $this->pdosql->makeSelect($data);
        $r = $this->db->fetch($sql,array('ehscorelist','ehuseranswer','ehtimelist'));
        $r['ehquestion'] = unserialize(gzuncompress(base64_decode($r['ehquestion'])));
        $r['ehsetting'] = unserialize(gzuncompress(base64_decode($r['ehsetting'])));
        return $r;
    }

	//根据ID修改一个考试记录
	public function modifyExamHistory($args,$ehid)
	{
		$data = array("examhistory",$args,array(array("AND","ehid = :ehid",'ehid',$ehid)));
		$sql = $this->pdosql->makeUpdate($data);
		$this->db->exec($sql);
		return true;
	}

	//根据ID删除一个考试记录
	public function delExamHistory($ehid,$userid)
	{
		$data = array("examhistory",array(array("AND","ehid = :ehid",'ehid',$ehid),array("AND","ehuserid = :ehuserid",'ehuserid',$userid)));
		$sql = $this->pdosql->makeDelete($data);
		$this->db->exec($sql);
		return true;
	}

	//批量清理考试记录
	public function clearExamHistory($args)
	{
		$data = array("examhistory",$args);
		$sql = $this->pdosql->makeDelete($data);
		$this->db->exec($sql);
		return true;
	}

	//获取记录数量
	public function getExamHistoryNumber($userid,$basicid,$type = 0)
	{
		$data = array('count(*) AS number',"examhistory",array(array("AND","ehuserid = :ehuserid",'ehuserid',$userid),array("AND","ehbasicid = :ehbasicid",'ehbasicid',$basicid),array("AND","ehtype = :ehtype",'ehtype',$type)));
		$sql = $this->pdosql->makeSelect($data);
		$r = $this->db->fetch($sql);
		return $r['number'];
	}

	//删除最后一个考试记录
	public function delLastExamHistory($userid,$subjectid,$type = 0)
	{
		$data = array(false,"examhistory",array(array("AND","ehuserid = :ehuserid",'ehuserid',$userid),array("AND","ehsubjectid = :ehsubjectid",'ehsubjectid',$subjectid),array("AND","ehtype = :ehtype",'ehtype',$type)),false,"ehid ASC",1);
		$sql = $this->pdosql->makeSelect($data);
		$r = $this->db->fetch($sql);
		$data = array("examhistory","ehid = '{$r['ehid']}'");
		$sql = $this->pdosql->makeDelete($data);
		$this->db->exec($sql);
		return true;
	}

	//添加一个考试记录
	public function addExamHistory($sessionid = false,$status = 1)
	{
		$exam = $this->exam->getExamSessionBySessionid($sessionid);
		if(!$exam)return false;
		$t = TIME - $exam['examsessionstarttime'];
		$user = $this->G->make('user','user')->getUserById($exam['examsessionuserid']);
		if($t >= $exam['examsessiontime']*60)$t = $exam['examsessiontime']*60;
		$args = array(
					'ehtype'=>$exam['examsessiontype'],
					'ehtimelist'=>$exam['examsessiontimelist'],
					'ehexam'=>$exam['examsession'],
					'ehexamid'=>$exam['examsessionkey'],
					'ehbasicid'=>$exam['examsessionbasic'],
					'ehquestion'=>base64_encode(gzcompress(serialize($exam['examsessionquestion']),9)),
					'ehsetting'=>base64_encode(gzcompress(serialize($exam['examsessionsetting']),9)),
					'ehuseranswer'=>$exam['examsessionuseranswer'],
					'ehstarttime'=>$exam['examsessionstarttime'],
					'ehtime'=>$t,
					'ehscore'=>$exam['examsessionscore'],
					'ehscorelist'=>$exam['examsessionscorelist'],
					'ehuserid'=>$exam['examsessionuserid'],
					'ehusername'=>$user['username'],
					'ehdecide' => intval($exam['examsessionsetting']['examdecide']),
					'ehstatus' => $status,
					'ehispass' => $exam['examsessionscore'] >= $exam['examsessionsetting']['examsetting']['passscore']?1:0
		);
		/**
		try
		{
			$this->db->beginTransaction();
			$data = array('examhistory',$args);
			$sql = $this->pdosql->makeInsert($data);
			$aff = $this->db->exec($sql);
			if(!$aff)
			throw new PDOException("Insert Examhsitory Error");
			$ehid = $this->db->lastInsertId();
			$aff = $this->exam->delExamSession($sessionid);
			if(!$aff)
			throw new PDOException("Delete Examsession Error");
			$this->db->commit();
			return $ehid;
		}
		catch(PDOException $e)
		{
			$this->db->rollback();
			return false;
		}
		**/
		$data = array('examhistory',$args);
		$sql = $this->pdosql->makeInsert($data);
		$aff = $this->db->exec($sql);
		$ehid = $this->db->lastInsertId();
		$this->exam->delExamSession($sessionid);
		return $ehid;
	}

	public function getAvgScore($args)
	{
		$data = array("avg(ehscore) as avgscore",'examhistory',$args,false,false,false);
		$sql = $this->pdosql->makeSelect($data);
		$r = $this->db->fetch($sql);
		return $r['avgscore'];
	}

	public function getExamUseNumber($userid,$examid,$basicid,$type = 2)
	{
		$data = array('count(*) AS number',"examhistory",array(array("AND","ehuserid = :ehuserid",'ehuserid',$userid),array("AND","ehexamid = :ehexamid",'ehexamid',$examid),array("AND","ehbasicid = :ehbasicid",'ehbasicid',$basicid),array("AND","ehtype = :ehtype",'ehtype',$type),array("AND","ehneedresit = 0")));
		$sql = $this->pdosql->makeSelect($data);
		$r = $this->db->fetch($sql);
		return $r['number'];
	}

	public function getExamScoreListByBasicId($basicid,$page)
	{
		$data = array(
			'select' => false,
			'table' => array('examhistory','user'),
			'query' => array(array("AND","ehbasicid = :ehbasicid",'ehbasicid',$basicid),array("AND","ehtype = 2"),array("AND","ehuserid = userid"),array("AND","ehstatus = 1")),
			'orderby' => 'ehscore DESC,ehid DESC'
		);
		return $this->db->listElements($page,10,$data);
	}

	public function getUserScoreIndex($basicid,$userid,$score)
	{
		$data = array("count(*) as number",'examhistory',array(array("AND","ehbasicid = :ehbasicid",'ehbasicid',$basicid),array("AND","ehscore > :ehscore",'ehscore',$score)),false,false,false);
		$sql = $this->pdosql->makeSelect($data);
		$r = $this->db->fetch($sql);
		return $r['number'] + 1;
	}

	public function getUserTopScore($basicid,$userid)
	{
		$data = array("max(ehscore) as ehscore",'examhistory',array(array("AND","ehbasicid = :ehbasicid",'ehbasicid',$basicid),array("AND","ehuserid = :ehuserid",'ehuserid',$userid),array("AND","ehtype = 2")),false,false,false);
		$sql = $this->pdosql->makeSelect($data);
		$r = $this->db->fetch($sql);
		if($r['ehscore'] > 0)$s = array('score' => $r['ehscore']);
		else
		$s = array('score' => 0);
		$data = array("count(*) as number",'examhistory',array(array("AND","ehbasicid = :ehbasicid",'ehbasicid',$basicid),array("AND","ehscore > :ehscore",'ehscore',$s['score']),array("AND","ehtype = 2")),false,false,false);
		$sql = $this->pdosql->makeSelect($data);
		$r = $this->db->fetch($sql);
		$s['index'] = $r['number'] + 1;
		return $s;
	}
}

?>
