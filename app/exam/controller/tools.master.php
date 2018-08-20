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

	private function clearouttimeexamsession()
	{
		$search = $this->ev->get('search');
		if($search['argsmodel'])
		{
			if($search['stime'])$time = strtotime($search['stime']);
			$this->exam->clearOutTimeExamSession($time);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => "forward",
			    "forwardUrl" => "reload"
			);
		}
		else
		$message = array(
			'statusCode' => 300,
			"message" => "请先选择查询条件"
		);
		$this->G->R($message);
	}

	private function clearouttimesession()
	{
		$search = $this->ev->get('search');
		if($search['argsmodel'])
		{
			if($search['stime'])$time = strtotime($search['stime']);
			$this->session->clearOutTimeUser($time);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => "forward",
			    "forwardUrl" => "reload"
			);
		}
		else
		$message = array(
			'statusCode' => 300,
			"message" => "请先选择查询条件"
		);
		$this->G->R($message);
	}

	private function clearsession()
	{
		$this->tpl->display('tools_session');
	}

	private function clearquestionrows()
	{
		$search = $this->ev->get('search');
		if($search['argsmodel'])
		{
			$args = array(array("AND","quest2knows.qkquestionid = questionrows.qrid"));
			if($search['questionid'])
			{
				$args[] = array("AND","questionrows.qrid = :qrid",'qrid',$search['questionid']);
			}
			if($search['questiontype'])
			{
				$args[] = array("AND","questionrows.qrtype = :qrtype",'qrtype',$search['questiontype']);
			}
			if($search['keyword'])
			{
				$args[] = array("AND","questionrows.qrquestion LIKE :qrquestion",'qrquestion','%'.$search['keyword'].'%');
			}
			if($search['stime'])
			{
				$args[] = array("AND","questionrows.qrtime >= :stime",'stime',strtotime($search['stime']));
			}
			if($search['etime'])
			{
				$args[] = array("AND","questionrows.qrtime <= :etime",'etime',strtotime($search['etime']));
			}
			if($search['qrlevel'])
			{
				$args[] = array("AND","questionrows.qrlevel = :qrlevel",'qrlevel',$search['qrlevel']);
			}
			if($search['questionknowsid'])
			{
				$args[] = array("AND","quest2knows.qkknowsid = :qkknowsid",'qkknowsid',$search['questionknowsid']);
			}
			else
			{
				$tmpknows = '0';
				if($search['questionsectionid'])
				{
					$knows = $this->section->getKnowsListByArgs(array(array("AND","knowsstatus = 1"),array("AND","knowssectionid = :knowssectionid",'knowssectionid',$search['questionsectionid'])));
					foreach($knows as $p)
					{
						if($p['knowsid'])$tmpknows .= ','.$p['knowsid'];
					}
					$args[] = array("AND","find_in_set(quest2knows.qkknowsid,:qkknowsid)",'qkknowsid',$tmpknows);
				}
				elseif($search['questionsubjectid'])
				{
					$knows = $this->section->getAllKnowsBySubject($search['questionsubjectid']);
					foreach($knows as $p)
					{
						if($p['knowsid'])$tmpknows .= ','.$p['knowsid'];
					}
					$args[] = array("AND","find_in_set(quest2knows.qkknowsid,:qkknowsid)","qkknowsid",$tmpknows);
				}
			}
			$questions = $this->exam->getQuestionRowsByArgs($args,'qrid');
			foreach($questions as $n)
			{
				$this->exam->finalDelQuestionRows($n['qrid']);
			}
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => "forward",
			    "forwardUrl" => "reload"
			);
			$this->G->R($message);
		}
		else
		{
			$message = array(
				'statusCode' => 300,
				"message" => "请先选择查询条件"
			);
			$this->G->R($message);
		}
	}

	private function clearhistory()
	{
		$search = $this->ev->get('search');
		if($search['argsmodel'])
		{
			if($search['stime'] || $search['etime'])
			{
				$args = array();
				if($search['stime'])$args[] = array("AND","ehstarttime >= :ehstarttime",'ehstarttime',strtotime($search['stime']));
				if($search['etime'])$args[] = array("AND","ehstarttime <= :ehendtime",'ehendtime',strtotime($search['etime']));
				$this->favor->clearExamHistory($args);
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功",
				    "callbackType" => "forward",
				    "forwardUrl" => "reload"
				);
				$this->G->R($message);
			}
			else
			{
				$message = array(
					'statusCode' => 300,
					"message" => "请先选择起止时间"
				);
				$this->G->R($message);
			}
		}
		else
		$this->tpl->display('tools_history');
	}

	private function clearquestions()
	{
		$search = $this->ev->get('search');
		if($search['argsmodel'])
		{
			$args = array(array("AND","quest2knows.qkquestionid = questions.questionid"),array("AND","questions.questionparent = 0"),array("AND","quest2knows.qktype = 0"));
			if($search['knowsids'])
			{
				$args[] = array("AND","find_in_set(questions.questionknowsid,:questionknowsid)",'questionknowsid',$search['knowsids']);
			}
			if($search['stime'])
			{
				$args[] = array("AND","questions.questioncreatetime >= :stime",'stime',strtotime($search['stime']));
			}
			if($search['etime'])
			{
				$args[] = array("AND","questions.questioncreatetime <= :etime",'etime',strtotime($search['etime']));
			}
			if($search['questiontype'])
			{
				$args[] = array("AND","questions.questiontype = :questiontype",'questiontype',$search['questiontype']);
			}
			if($search['questionlevel'])
			{
				$args[] = array("AND","questions.questionlevel = :questionlevel",'questionlevel',$search['questionlevel']);
			}
			if($search['questionknowsid'])
			{
				$args[] = array("AND","quest2knows.qkknowsid = :qkknowsid",'qkknowsid',$search['questionknowsid']);
			}
			else
			{
				$tmpknows = '0';
				if($search['questionsectionid'])
				{
					$knows = $this->section->getKnowsListByArgs(array(array("AND","knowsstatus = 1"),array("AND","knowssectionid = :knowssectionid",'knowssectionid',$search['questionsectionid'])));
					foreach($knows as $p)
					{
						if($p['knowsid'])$tmpknows .= ','.$p['knowsid'];
					}
					$args[] = array("AND","find_in_set(quest2knows.qkknowsid,:qkknowsid)",'qkknowsid',$tmpknows);
				}
				elseif($search['questionsubjectid'])
				{
					$knows = $this->section->getAllKnowsBySubject($search['questionsubjectid']);
					foreach($knows as $p)
					{
						if($p['knowsid'])$tmpknows .= ','.$p['knowsid'];
					}
					$args[] = array("AND","find_in_set(quest2knows.qkknowsid,:qkknowsid",'qkknowsid',$tmpknows);
				}
			}
			$questions = $this->exam->getQuestionListByArgs($args,'questionid');
			foreach($questions as $n)
			{
				$this->exam->fanalDelQuestions($n['questionid']);
			}
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => "forward",
			    "forwardUrl" => "reload"
			);
			$this->G->R($message);
		}
		else
		{
			$message = array(
				'statusCode' => 300,
				"message" => "请先选择查询条件"
			);
			$this->G->R($message);
		}
	}

	private function index()
	{
		$search = $this->ev->get('search');
		$questypes = $this->basic->getQuestypeList();
		$subjects = $this->basic->getSubjectList();
		$sections = $this->section->getSectionListByArgs(array(array("AND","sectionsubjectid = :sectionsubjectid",'sectionsubjectid',$search['questionsubjectid'])));
		$knows = $this->section->getKnowsListByArgs(array(array("AND","knowsstatus = 1"),array("AND","knowssectionid = :knowssectionid",'knowssectionid',$search['questionsectionid'])));
		$this->tpl->assign('subjects',$subjects);
		$this->tpl->assign('sections',$sections);
		$this->tpl->assign('knows',$knows);
		$this->tpl->assign('questypes',$questypes);
		$this->tpl->display('tools');
	}
}


?>
