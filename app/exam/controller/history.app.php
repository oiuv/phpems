<?php
/*
 * Created on 2016-5-19
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
class action extends app
{
	public function display()
	{
		$action = $this->ev->url(3);
		if(!method_exists($this,$action))
		$action = "index";
		$this->$action();
		exit;
	}

	private function del()
	{
		$ehid = $this->ev->get('ehid');
		$ehtype = $this->ev->get('ehtype');
		$page = $this->ev->get('page');
		$this->favor->delExamHistory($ehid,$this->_user['sessionuserid']);
		$message = array(
			'statusCode' => 200,
			"message" => "操作成功",
		    "callbackType" => 'forward',
		    "forwardUrl" => "reload"
		);
		$this->G->R($message);
	}

	private function batdelexercise()
	{
		$exercise = $this->ev->get('exercise');
		foreach($exercise as $p)
		$this->favor->delExamHistory($p,$this->_user['sessionuserid']);
		header("location:index.php?exam-app-history");
		exit;
	}

	private function batdelexam()
	{
		$exam = $this->ev->get('exam');
		foreach($exam as $p)
		$this->favor->delExamHistory($p,$this->_user['sessionuserid']);
		header("location:index.php?exam-app-history");
		exit;
	}

	private function view()
	{
		$ehid = $this->ev->get('ehid');
		$eh = $this->favor->getExamHistoryById($ehid);
		$questype = $this->basic->getQuestypeList();
		$sessionvars = array('examsession'=>$eh['ehexam'],'examsessiontimelist'=>$eh['ehtimelist'],'examsessionscore'=>$eh['ehscore'],'examsessionscorelist'=>$eh['ehscorelist'],'examsessionsetting'=>$eh['ehsetting'],'examsessionquestion'=>$eh['ehquestion'],'examsessionuseranswer'=>$eh['ehuseranswer']);
		$this->tpl->assign('sessionvars',$sessionvars);
		$this->tpl->assign('questype',$questype);
		$this->tpl->assign('ehtype',$eh['ehtype']);
		if($eh['ehtype'])
		$this->tpl->display('history_examview');
		else
		$this->tpl->display('history_exerciseview');
	}

	private function wrongs()
	{
		$ehid = $this->ev->get('ehid');
		$eh = $this->favor->getExamHistoryById($ehid);
		$questype = $this->basic->getQuestypeList();
		$sessionvars = array('examsession'=>$eh['ehexam'],'examsessionscorelist'=>$eh['ehscorelist'],'examsessionsetting'=>$eh['ehsetting'],'examsessionquestion'=>$eh['ehquestion'],'examsessionuseranswer'=>$eh['ehuseranswer']);
		$this->tpl->assign('sessionvars',$sessionvars);
		$this->tpl->assign('questype',$questype);
		if($eh['ehtype'] == 2)
		$this->tpl->display('history_examwrongs');
		elseif($eh['ehtype'] == 1)
		$this->tpl->display('history_exampaperwrongs');
		else
		$this->tpl->display('history_exercisewrongs');
	}

	private function redo()
	{
		$ehid = $this->ev->get('ehid');
		$eh = $this->favor->getExamHistoryById($ehid);
		$args = array(
						'examsession' => $eh['ehexam'].'重做',
						'examsessiontype'=>$eh['ehtype'] == 2?1:$eh['ehtype'],
						'examsessionuserid' => $this->_user['sessionuserid'],
						'examsessionkey' => $eh['examid'],
						'examsessionsetting'=>$eh['ehsetting'],
						'examsessionbasic'=>$eh['ehbasicid'],
						'examsessionquestion'=>$eh['ehquestion'],
						'examsessionuseranswer'=>'',
						'examsessiontime'=>$eh['ehtime'],
						'examsessionscorelist'=>'',
						'examsessionscore'=>0,
						'examsessionstarttime'=>TIME,
						'examsessionissave'=> 0,
						'examsessionstatus'=> 0
					);
		$es = $this->exam->getExamSessionBySessionid();
		if($es['examsessionid'])
		{
			$this->exam->modifyExamSession($args);
		}
		else
		{
			$this->exam->insertExamSession($args);
		}
		if($eh['ehtype'] == 1)
		$message = array(
			'statusCode' => 200,
			"message" => "试题加载成功，即将进入考试页面",
		    "callbackType" => 'forward',
		    "forwardUrl" => "index.php?exam-app-exampaper-paper&act=history&examid={$eh['ehkey']}"
		);
		elseif($eh['ehtype'] == 2)
		$message = array(
			'statusCode' => 200,
			"message" => "试题加载成功，即将进入考试页面",
		    "callbackType" => 'forward',
		    "forwardUrl" => "index.php?exam-app-exampaper-paper&act=history&examid={$eh['ehkey']}"
		);
		else
		$message = array(
			'statusCode' => 200,
			"message" => "试题加载成功，即将进入考试页面",
		    "callbackType" => 'forward',
		    "forwardUrl" => "index.php?exam-app-exercise-paper&act=history&examid={$eh['ehkey']}"
		);
		$this->G->R($message);
	}

	private function index()
	{
		$page = $this->ev->get('page');
		$ehtype = intval($this->ev->get('ehtype'));
		$page = $page > 0?$page:1;
		$basicid = $this->data['currentbasic']['basicid'];
		$exams = $this->favor->getExamHistoryListByArgs($page,10,array(array("AND","ehuserid = :ehuserid",'ehuserid',$this->_user['sessionuserid']),array("AND","ehbasicid = :ehbasicid",'ehbasicid',$basicid),array("AND","ehtype = :ehtype",'ehtype',$ehtype)));
		foreach($exams['data'] as $key => $p)
		{
			$exams['data'][$key]['errornumber'] = 0;
			$questions = unserialize(gzuncompress(base64_decode($p['ehquestion'])));
			$scorelist = unserialize($p['ehscorelist']);
			$examsetting = unserialize(gzuncompress(base64_decode($p['ehsetting'])));
			if(is_array($questions['questions']) && is_array($scorelist))
			{
				foreach($questions['questions'] as $nkey => $q)
				{
					if(is_array($q))
					{
						foreach($q as $qid => $t)
						{
							if($p['ehtype'] == 0)
							{
								if($scorelist[$qid] != 1)$exams['data'][$key]['errornumber']++;
							}
							elseif($p['ehtype'] == 1)
							{
								if($scorelist[$qid] != $examsetting['examsetting']['questype'][$nkey]['score'])$exams['data'][$key]['errornumber']++;
							}
							else
							{
								if($scorelist[$qid] != $examsetting['examsetting']['questype'][$nkey]['score'])$exams['data'][$key]['errornumber']++;
							}
						}
					}
				}
				foreach($questions['questionrows'] as $nkey => $qt)
				{
					foreach($qt as $qtid => $q)
					{
						if(is_array($q))
						{
							foreach($q['data'] as $qid => $t)
							{
								if($p['ehtype'] == 0)
								{
									if($scorelist[$qid] != 1)$exams['data'][$key]['errornumber']++;
								}
								elseif($p['ehtype'] == 1)
								{
									if($scorelist[$qid] != $examsetting['examsetting']['questype'][$nkey]['score'])$exams['data'][$key]['errornumber']++;
								}
								else
								{
									if($scorelist[$qid] != $examsetting['examsetting']['questype'][$nkey]['score'])$exams['data'][$key]['errornumber']++;
								}
							}
						}
					}
				}
			}
		}
		$avgscore = floatval($this->favor->getAvgScore(array(array("AND","ehuserid = :ehuserid",'ehuserid',$this->_user['sessionuserid']),array("AND","ehbasicid = :ehbasicid",'ehbasicid',$basicid),array("AND","ehtype = :ehtype",'ehtype',$ehtype))));
		$this->tpl->assign('ehtype',$ehtype);
		$this->tpl->assign('page',$page);
		$this->tpl->assign('exams',$exams);
		$this->tpl->assign('avgscore',$avgscore);
		$this->tpl->display('history');
	}
}


?>
