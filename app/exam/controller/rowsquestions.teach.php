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

    private function batdel()
    {
        $page = $this->ev->get('page');
        $delids = $this->ev->get('delids');
        foreach($delids as $questionid => $p)
            $this->exam->delQuestionRows($questionid);
        $message = array(
            'statusCode' => 200,
            "message" => "操作成功",
            "callbackType" => "forward",
            "forwardUrl" => "index.php?exam-teach-rowsquestions&page={$page}{$u}"
        );
        $this->G->R($message);
    }

	private function delquestion()
	{
		$page = $this->ev->get('page');
		$questionid = $this->ev->get('questionid');
		$question = $this->exam->getQuestionRowsByArgs("qrid = '{$questionid}'");
		if($question['data'])
		{
			$message = array(
				'statusCode' => 300,
				"message" => "操作失败，请先删除子试题"
			);
			exit(json_encode($message));
		}
		$this->exam->delQuestionRows($questionid);
		$message = array(
			'statusCode' => 200,
			"message" => "操作成功",
			"callbackType" => "forward",
		    "forwardUrl" => "index.php?exam-teach-rowsquestions&page={$page}{$u}"
		);
		exit(json_encode($message));
	}

	private function delchildquestion()
	{
		$page = $this->ev->get('page');
		$questionid = $this->ev->get('questionid');
		$questionparent = $this->ev->get('questionparent');
		$this->exam->delQuestions($questionid);
		$this->exam->resetRowsQuestionNumber($questionparent);
		$message = array(
			'statusCode' => 200,
			"message" => "操作成功",
			"callbackType" => "forward",
			"forwardUrl" => "index.php?exam-teach-rowsquestions-rowsdetail&questionid={$questionparent}&page={$page}{$u}"
		);
		exit(json_encode($message));
	}

	private function backquestion()
	{
		$page = $this->ev->get('page');
		$questionid = $this->ev->get('questionid');
		$questions = $this->exam->backQuestionRows($questionid);
		$message = array(
			'statusCode' => 200,
			"message" => "操作成功",
			"callbackType" => "forward",
		    "forwardUrl" => "index.php?exam-teach-recyle-rows&page={$page}"
		);
		exit(json_encode($message));
	}

	private function modifyquestion()
	{
		if($this->ev->get('modifyquestion'))
		{
			$page = $this->ev->get('page');
			$args = $this->ev->get('args');
			$questionid = $this->ev->get('questionid');
			$this->exam->modifyQuestionRows($questionid,$args);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
				"callbackType" => "forward",
			    "forwardUrl" => "index.php?exam-teach-rowsquestions&page={$page}{$u}"
			);
			exit(json_encode($message));
		}
		else
		{
			$page = $this->ev->get('page');
			$questionid = $this->ev->get('questionid');
			$question = $this->exam->getQuestionRowsByArgs(array(array("AND","qrid = :qrid",'qrid',$questionid)));
			$subjects = $this->basic->getSubjectList(array(array("AND","find_in_set(subjectid,:subjectid)",'subjectid',$this->teachsubjects)));
			$questypes = $this->basic->getQuestypeList();
			foreach($question['qrknowsid'] as $key => $p)
			{
				$knows = $this->section->getKnowsByArgs(array(array("AND","knowsid = :knowsid",'knowsid',$p['knowsid'])));
				$question['qrknowsid'][$key]['knows'] = $knows['knows'];
			}
			$this->tpl->assign('questypes',$questypes);
			$this->tpl->assign('subjects',$subjects);
			$this->tpl->assign('page',$page);
			$this->tpl->assign('question',$question);
			$this->tpl->display('questionrows_modify');
		}
	}

	private function modifychildquestion()
	{
		if($this->ev->get('modifyquestion'))
		{
			$page = $this->ev->get('page');
			$args = $this->ev->get('args');
			$questionid = $this->ev->get('questionid');
			$targs = $this->ev->get('targs');
			$questype = $this->basic->getQuestypeById($args['questiontype']);
			if($questype['questsort'])$choice = 0;
			else $choice = $questype['questchoice'];
			$args['questionanswer'] = $targs['questionanswer'.$choice];
			if(is_array($args['questionanswer']))$args['questionanswer'] = implode('',$args['questionanswer']);
			$this->exam->modifyQuestions($questionid,$args);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
				"callbackType" => "forward",
				"forwardUrl" => "index.php?exam-teach-rowsquestions-rowsdetail&questionid={$args['questionparent']}&page={$page}{$u}"
			);
			exit(json_encode($message));
		}
		else
		{
			$page = $this->ev->get('page');
			$questionparent = $this->ev->get('questionparent');
			$knowsid = $this->ev->get('knowsid');
			$questionid = $this->ev->get('questionid');
			$questypes = $this->basic->getQuestypeList();
			$question = $this->exam->getQuestionByArgs(array(array("AND","questionid = :questionid",'questionid',$questionid)));
			$subjects = $this->basic->getSubjectList(array(array("AND","find_in_set(subjectid,:subjectid)",'subjectid',$this->teachsubjects)));
			$this->tpl->assign('subjects',$subjects);
			$this->tpl->assign('questionparent',$questionparent);
			$this->tpl->assign('questypes',$questypes);
			$this->tpl->assign('page',$page);
			$this->tpl->assign('knowsid',$knowsid);
			$this->tpl->assign('question',$question);
			$this->tpl->display('questionchildrows_modify');
		}
	}

	private function detail()
	{
		$questionid = $this->ev->get('questionid');
		$question = $this->exam->getQuestionRowsByArgs("qrid = '{$questionid}'");
		$sections = array();
		foreach($question['qrknowsid'] as $key => $p)
		{
			$knows = $this->section->getKnowsByArgs("knowsid = '{$p['knowsid']}'");
			$question['qrknowsid'][$key]['knows'] = $knows['knows'];
			$sections[] = $this->section->getSectionByArgs("sectionid = '{$knows['knowssectionid']}'");
		}
		$subject = $this->basic->getSubjectById($sections[0]['sectionsubjectid']);
		$this->tpl->assign("subject",$subject);
		$this->tpl->assign("sections",$sections);
		$this->tpl->assign("question",$question);
		$this->tpl->display('questionrows_detail');
	}

	private function rowsdetail()
	{
		$questionid = $this->ev->get('questionid');
		$question = $this->exam->getQuestionRowsByArgs("qrid = '{$questionid}'");
		$questypes = $this->basic->getQuestypeList();
		$this->tpl->assign('questypes',$questypes);
		$this->tpl->assign("question",$question);
		$this->tpl->assign("questionparent",$questionid);
		$this->tpl->display('questionrows_list');
	}

	private function addchildquestion()
	{
		if($this->ev->get('insertquestion'))
		{
			$questionparent = $this->ev->get('questionparent');
			$args = $this->ev->get('args');
			$targs = $this->ev->get('targs');
			if(!$questionparent)$questionparent = $args['questionparent'];
			$questype = $this->basic->getQuestypeById($args['questiontype']);
			$args['questionuserid'] = $this->_user['sessionuserid'];
			if($questype['questsort'])$choice = 0;
			else $choice = $questype['questchoice'];
			$args['questionanswer'] = $targs['questionanswer'.$choice];
			if(is_array($args['questionanswer']))$args['questionanswer'] = implode('',$args['questionanswer']);
			$page = $this->ev->get('page');
			$args['questioncreatetime'] = TIME;
			$args['questionusername'] = $this->_user['sessionusername'];
			$this->exam->addQuestions($args);
			$this->exam->resetRowsQuestionNumber($questionparent);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
				"callbackType" => "forward",
				"forwardUrl" => "index.php?exam-teach-rowsquestions-rowsdetail&questionid={$questionparent}&page={$page}{$u}"
			);
			$this->G->R($message);
		}
		else
		{
			$questionid = $this->ev->get('questionid');
			$question = $this->exam->getQuestionRowsByArgs("qrid = '{$questionid}'");
			$questypes = $this->basic->getQuestypeList();
			$this->tpl->assign('questypes',$questypes);
			$this->tpl->assign("question",$question);
			$this->tpl->assign("questionparent",$questionid);
			$this->tpl->display('questionrows_addchild');
		}
	}

	private function bataddchildquestion()
	{
		if($this->ev->get('insertquestion'))
		{
			$questionparent = $this->ev->get('questionparent');
			$page = $this->ev->get('page');
			$content = $this->ev->get('content');
			$this->exam->insertQuestionBat($content,$questionparent);
			$this->exam->resetRowsQuestionNumber($questionparent);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
				"forwardUrl" => "index.php?exam-teach-rowsquestions-rowsdetail&questionid={$questionparent}&page={$page}{$u}"
			);
			$this->G->R($message);
		}
		else
		{
			$questionid = $this->ev->get('questionid');
			$question = $this->exam->getQuestionRowsByArgs("qrid = '{$questionid}'");
			$questypes = $this->basic->getQuestypeList();
			$this->tpl->assign('questypes',$questypes);
			$this->tpl->assign("question",$question);
			$this->tpl->assign("questionparent",$questionid);
			$this->tpl->display('questionrows_bataddchild');
		}
	}

	private function done()
	{
		$sequence = $this->ev->get('sequence');
		$questionparent = $this->ev->get('questionparent');
		foreach($sequence as $key => $l)
		{
			$this->exam->modifyQuestionSequence($key,array('questionsequence'=>$l));
		}
		$message = array(
			'statusCode' => 200,
			"message" => "操作成功",
			"callbackType" => "forward",
			"forwardUrl" => "index.php?exam-teach-rowsquestions-rowsdetail&questionid={$questionparent}&page={$page}{$u}"
		);
		exit(json_encode($message));
	}

	private function bataddquestionrows()
	{
		if($this->ev->get('insertquestion'))
		{
			$page = $this->ev->get('page');
			$content = $this->ev->get('content');
			$this->exam->insertQuestionRowsBat($content);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
				"callbackType" => "forward",
			    "forwardUrl" => "index.php?exam-teach-rowsquestions&page={$page}{$u}"
			);
			exit(json_encode($message));
		}
		else
		{
			$subjects = $this->basic->getSubjectList(array(array("AND","find_in_set(subjectid,:subjectid)",'subjectid',$this->teachsubjects)));
			$this->tpl->assign('subjects',$subjects);
			$this->tpl->display('questionrows_batadd');
		}
	}

	private function addquestionrows()
	{
		if($this->ev->get('insertquestion'))
		{
			$args = $this->ev->get('args');
			$args['qrtime'] = TIME;
			$args['qruserid'] = $this->_user['userid'];
			$args['qrusername'] = $this->_user['username'];
			$this->exam->addQuestionRows($args);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
				"callbackType" => "forward",
			    "forwardUrl" => "index.php?exam-teach-rowsquestions&page={$page}{$u}"
			);
			exit(json_encode($message));
		}
		else
		{
			$subjects = $this->basic->getSubjectList(array(array("AND","find_in_set(subjectid,:subjectid)",'subjectid',$this->teachsubjects)));
			$questypes = $this->basic->getQuestypeList();
			$this->tpl->assign('questypes',$questypes);
			$this->tpl->assign('subjects',$subjects);
			$this->tpl->display('questionrows_add');
		}
	}

	private function index()
	{
		$page = $this->ev->get('page');
		$search = $this->ev->get('search');
		$page = $page > 0?$page:1;
		$args = array(array("AND","quest2knows.qkquestionid = questionrows.qrid"),array("AND","quest2knows.qktype = 1"),array("AND","questionrows.qrstatus = '1'"));
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
			$args[] = array("AND","questionrows.qrquestion LIKE :qrquestion",'qrquestion',"%{$search['keyword']}%");
		}
		if($search['stime'])
		{
			$args[] = array("AND","questionrows.qrtime >= :sqrtime",'sqrtime',strtotime($search['stime']));
		}
		if($search['etime'])
		{
			$args[] = array("AND","questionrows.qrtime >= :eqrtime",'eqrtime',strtotime($search['etime']));
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
				$args[] = array('AND',"find_in_set(quest2knows.qkknowsid,:qkknowsids)","qkknowsids",$tmpknows);
			}
			elseif($search['questionsubjectid'])
			{
				$knows = $this->section->getAllKnowsBySubject($search['questionsubjectid']);
				foreach($knows as $p)
				{
					if($p['knowsid'])$tmpknows .= ','.$p['knowsid'];
				}
				$args[] = array('AND',"find_in_set(quest2knows.qkknowsid,:qkknowsids)","qkknowsids",$tmpknows);
			}
			else
			{
				$knows = $this->section->getAllKnowsBySubjects($this->teachsubjects);
				foreach($knows as $p)
				{
					if($p['knowsid'])$tmpknows .= ','.$p['knowsid'];
				}
				$args[] = array('AND',"find_in_set(quest2knows.qkknowsid,:qkknowsids)","qkknowsids",$tmpknows);
			}
		}
		$questypes = $this->basic->getQuestypeList();
		$questions = $this->exam->getQuestionrowsList($page,10,$args);
		$subjects = $this->basic->getSubjectList(array(array("AND","find_in_set(subjectid,:subjectid)",'subjectid',$this->teachsubjects)));
		$sections = $this->section->getSectionListByArgs(array(array("AND","sectionsubjectid = :sectionsubjectid",'sectionsubjectid',$search['questionsubjectid'])));
		$knows = $this->section->getKnowsListByArgs(array(array("AND","knowsstatus = 1"),array("AND","knowssectionid = :knowssectionid",'knowssectionid',$search['questionsectionid'])));
		$this->tpl->assign('subjects',$subjects);
		$this->tpl->assign('sections',$sections);
		$this->tpl->assign('knows',$knows);
		$this->tpl->assign('questypes',$questypes);
		$this->tpl->assign('questions',$questions);
		$this->tpl->display('questionrows');
	}
}


?>
