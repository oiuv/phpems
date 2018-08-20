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
	
	private function filebataddquestion()
	{
		setlocale(LC_ALL,'zh_CN');
		if($this->ev->get('insertquestion'))
		{
			$page = $this->ev->get('page');
			$uploadfile = $this->ev->get('uploadfile');
			$knowsid = trim($this->ev->get('knowsid'));
			$this->exam->importQuestionBat($uploadfile,$knowsid);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
				"callbackType" => "forward",
			    "forwardUrl" => "index.php?exam-teach-questions&page={$page}{$u}"
			);
			$this->G->R($message);
		}
		else
		$this->tpl->display('question_filebatadd');
	}

	private function addquestion()
	{
		if($this->ev->get('insertquestion'))
		{
			$type = $this->ev->get('type');
			$questionparent = $this->ev->get('questionparent');
			//批量添加
			if($type)
			{
				$page = $this->ev->get('page');
				$content = $this->ev->get('content');
				$this->exam->insertQuestionBat($content,$questionparent);
			}
			//单个添加
			else
			{
				$args = $this->ev->get('args');
				$targs = $this->ev->get('targs');
				if(!$questionparent)$questionparent = $args['questionparent'];
				$questype = $this->basic->getQuestypeById($args['questiontype']);
				$args['questionuserid'] = $this->_user['userid'];
				if($questype['questsort'])$choice = 0;
				else $choice = $questype['questchoice'];
				$args['questionanswer'] = $targs['questionanswer'.$choice];
				if(is_array($args['questionanswer']))$args['questionanswer'] = implode('',$args['questionanswer']);
				$page = $this->ev->get('page');
				$args['questioncreatetime'] = TIME;
				$args['questionusername'] = $this->_user['username'];
				$this->exam->addQuestions($args);
			}
			if($questionparent)
			{
				$this->exam->resetRowsQuestionNumber($questionparent);
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功",
					"callbackType" => "forward",
					"forwardUrl" => "?exam-teach-rowsquestions-rowsdetail&questionid={$questionparent}&page={$page}{$u}"
				);
			}
			else
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
				"callbackType" => "forward",
			    "forwardUrl" => "?exam-teach-questions&page={$page}{$u}"
			);
			exit(json_encode($message));
		}
		else
		{
			$search = $this->ev->get('search');
			$questypes = $this->basic->getQuestypeList();
			$subjects = $this->basic->getSubjectList(array(array('AND','find_in_set(subjectid,:subjectid)','subjectid',$this->teachsubjects)));
			$sections = $this->section->getSectionListByArgs(array(array('AND',"sectionsubjectid = :sectionsubjectid",'sectionsubjectid',$search['questionsubjectid'])));
			$knows = $this->section->getKnowsListByArgs(array(array('AND',"knowsstatus = 1"),array('AND',"knowssectionid = :knowssectionid",'knowssectionid',$search['questionsectionid'])));
			$this->tpl->assign('subjects',$subjects);
			$this->tpl->assign('sections',$sections);
			$this->tpl->assign('knows',$knows);
			$this->tpl->assign('questypes',$questypes);
			$this->tpl->display('question_add');
		}
	}

	private function bataddquestion()
	{
		if($this->ev->get('insertquestion'))
		{
			$page = $this->ev->get('page');
			$content = $this->ev->get('content');
			$this->exam->insertQuestionBat($content);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
				"callbackType" => "forward",
			    "forwardUrl" => "index.php?exam-teach-questions&page={$page}{$u}"
			);
			exit(json_encode($message));
		}
		else
		{
			$this->tpl->display('question_batadd');
		}
	}

    private function batdel()
    {
        $page = $this->ev->get('page');
        $delids = $this->ev->get('delids');
        foreach($delids as $questionid => $p)
            $this->exam->delQuestions($questionid);
        $message = array(
            'statusCode' => 200,
            "message" => "操作成功",
            "callbackType" => "forward",
            "forwardUrl" => "index.php?exam-teach-questions&page={$page}{$u}"
        );
        $this->G->R($message);
    }

	private function delquestion()
	{
		$page = $this->ev->get('page');
		$questionid = $this->ev->get('questionid');
		$questionparent = $this->ev->get('questionparent');
		$this->exam->delQuestions($questionid);
		$message = array(
			'statusCode' => 200,
			"message" => "操作成功",
			"callbackType" => "forward",
		    "forwardUrl" => "index.php?exam-teach-questions&page={$page}{$u}"
		);
		exit(json_encode($message));
	}

	private function backquestion()
	{
		$page = $this->ev->get('page');
		$questionid = $this->ev->get('questionid');
		$questions = $this->exam->backQuestions($questionid);
		$message = array(
			'statusCode' => 200,
			"message" => "操作成功",
			"callbackType" => "forward",
		    "forwardUrl" => "index.php?exam-teach-recyle&page={$page}"
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
			$targs = $this->ev->get('targs');
			$questype = $this->basic->getQuestypeById($args['questiontype']);
			if($questype['questsort'])$choice = 0;
			else $choice = $questype['questchoice'];
			$args['questionanswer'] = $targs['questionanswer'.$choice];
			if(is_array($args['questionanswer']))$args['questionanswer'] = implode('',$args['questionanswer']);
			$this->exam->modifyQuestions($questionid,$args);
			if($args['questionparent'])
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
				"callbackType" => "forward",
				"forwardUrl" => "?exam-teach-questions&page={$page}{$u}"
			);
			else
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
				"callbackType" => "forward",
			    "forwardUrl" => "?exam-teach-questions&page={$page}{$u}"
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
			$question = $this->exam->getQuestionByArgs(array(array('AND',"questionid = :questionid",'questionid',$questionid)));
			$subjects = $this->basic->getSubjectList(array(array('AND','find_in_set(subjectid,:subjectid)','subjectid',$this->teachsubjects)));
			foreach($question['questionknowsid'] as $key => $p)
			{
				$knows = $this->section->getKnowsByArgs(array(array('AND',"knowsid = :knowsid",'knowsid',$p['knowsid'])));
				$question['questionknowsid'][$key]['knows'] = $knows['knows'];
			}
			$this->tpl->assign('subjects',$subjects);
			$this->tpl->assign('questionparent',$questionparent);
			$this->tpl->assign('questypes',$questypes);
			$this->tpl->assign('page',$page);
			$this->tpl->assign('knowsid',$knowsid);
			$this->tpl->assign('question',$question);
			if($questionparent)
			$this->tpl->display('questionchildrows_modify');
			else
			$this->tpl->display('questions_modify');
		}
	}

	private function ajax()
	{
		switch($this->ev->url(4))
		{
			//根据章节获取知识点信息
			case 'getknowsbysectionid':
			$sectionid = $this->ev->get('sectionid');
			$aknows = $this->section->getKnowsListByArgs(array(array('AND',"knowssectionid = :knowssectionid",'knowssectionid',$sectionid),array('AND',"knowsstatus = 1")));
			$data = array(array("",'选择知识点'));
			foreach($aknows as $knows)
			{
				$data[] = array($knows['knowsid'],$knows['knows']);
			}
			foreach($data as $p)
			{
				echo "<option value=\"{$p[0]}\">{$p[1]}</option>";
			}
			//exit(json_encode($data));
			break;

			//根据科目获取章节信息
			case 'getsectionsbysubjectid':
			$esid = $this->ev->get('subjectid');
			$aknows = $this->section->getSectionListByArgs(array(array('AND',"sectionsubjectid = :sectionsubjectid",'sectionsubjectid',$esid)));
			$data = array(array(0,'选择章节'));
			foreach($aknows as $knows)
			{
				$data[] = array($knows['sectionid'],$knows['section']);
			}
			foreach($data as $p)
			{
				echo "<option value=\"{$p[0]}\">{$p[1]}</option>";
			}
			//exit(json_encode($data));
			break;

			default:
		}
	}

	private function detail()
	{
		$questionid = $this->ev->get('questionid');
		$questionparent = $this->ev->get('questionparent');
		if($questionparent)
		{
			$questions = $this->exam->getQuestionByArgs(array(array('AND',"questionparent = :questionparent",'questionparent',$questionparent)));
		}
		else
		{
			$question = $this->exam->getQuestionByArgs(array(array('AND',"questionid = :questionid",'questionid',$questionid)));
			$sections = array();
			foreach($question['questionknowsid'] as $key => $p)
			{
				$knows = $this->section->getKnowsByArgs(array(array('AND',"knowsid = :knowsid",'knowsid',$p['knowsid'])));
				$question['questionknowsid'][$key]['knows'] = $knows['knows'];
				$sections[] = $this->section->getSectionByArgs(array(array('AND',"sectionid = :sectionid",'sectionid',$knows['knowssectionid'])));
			}
			$subject = $this->basic->getSubjectById($sections[0]['sectionsubjectid']);
		}
		$this->tpl->assign("subject",$subject);
		$this->tpl->assign("sections",$sections);
		$this->tpl->assign("question",$question);
		$this->tpl->assign("questions",$questions);
		$this->tpl->display('question_detail');
	}

	private function index()
	{
		$search = $this->ev->get('search');
		$page = $this->ev->get('page');
		$page = $page > 0?$page:1;
		$args = array(array('AND',"quest2knows.qkquestionid = questions.questionid"),array('AND',"questions.questionstatus = '1'"),array('AND',"questions.questionparent = 0"),array('AND',"quest2knows.qktype = 0") );
		if($search['questionid'])
		{
			$args[] = array('AND',"questions.questionid = :questionid",'questionid',$search['questionid']);
		}
		if($search['keyword'])
		{
			$args[] = array('AND',"questions.question LIKE :question",'question','%'.$search['keyword'].'%');
		}
		if($search['knowsids'])
		{
			$args[] = array('AND',"find_in_set(questions.questionknowsid ,:questionknowsid)",'questionknowsid',$search['knowsids']);
		}
		if($search['stime'])
		{
			$args[] = array('AND',"questions.questioncreatetime >= :questioncreatetime",'questioncreatetime',strtotime($search['stime']));
		}
		if($search['etime'])
		{
			$args[] = array('AND',"questions.questioncreatetime <= :questionendtime",'questionendtime',strtotime($search['etime']));
		}
		if($search['questiontype'])
		{
			$args[] = array('AND',"questions.questiontype = :questiontype",'questiontype',$search['questiontype']);
		}
		if($search['questionlevel'])
		{
			$args[] = array('AND',"questions.questionlevel = :questionlevel",'questionlevel',$search['questionlevel']);
		}
		if($search['questionknowsid'])
		{
			$args[] = array('AND',"quest2knows.qkknowsid = :qkknowsid",'qkknowsid',$search['questionknowsid']);
		}
		else
		{
			$tmpknows = '0';
			if($search['questionsectionid'])
			{
				$knows = $this->section->getKnowsListByArgs(array(array('AND',"knowsstatus = 1"),array('AND',"knowssectionid = :knowssectionid",'knowssectionid',$search['questionsectionid'])));
				foreach($knows as $p)
				{
					if($p['knowsid'])$tmpknows .= ','.$p['knowsid'];
				}
				$args[] = array('AND',"find_in_set(quest2knows.qkknowsid,:qkknowsid)",'qkknowsid',$tmpknows);
			}
			elseif($search['questionsubjectid'])
			{
				$knows = $this->section->getAllKnowsBySubject($search['questionsubjectid']);
				foreach($knows as $p)
				{
					if($p['knowsid'])$tmpknows .= ','.$p['knowsid'];
				}
				$args[] = array('AND',"find_in_set(quest2knows.qkknowsid,:qkknowsid)",'qkknowsid',$tmpknows);
			}
			else
			{
				$knows = $this->section->getAllKnowsBySubjects($this->teachsubjects);
				foreach($knows as $p)
				{
					if($p['knowsid'])$tmpknows .= ','.$p['knowsid'];
				}
				$args[] = array('AND',"find_in_set(quest2knows.qkknowsid,:qkknowsid)",'qkknowsid',$tmpknows);
			}
		}
		$questypes = $this->basic->getQuestypeList();
		$questions = $this->exam->getQuestionsList($page,10,$args);
		$subjects = $this->basic->getSubjectList(array(array('AND','find_in_set(subjectid,:subjectid)','subjectid',$this->teachsubjects)));
		$sections = $this->section->getSectionListByArgs(array(array('AND',"sectionsubjectid = :sectionsubjectid",'sectionsubjectid',$search['questionsubjectid'])));
		$knows = $this->section->getKnowsListByArgs(array(array('AND',"knowsstatus = 1"),array('AND',"knowssectionid = :knowssectionid",'knowssectionid',$search['questionsectionid'])));
		$this->tpl->assign('subjects',$subjects);
		$this->tpl->assign('sections',$sections);
		$this->tpl->assign('knows',$knows);
		$this->tpl->assign('questypes',$questypes);
		$this->tpl->assign('questions',$questions);
		$this->tpl->display('questions');
	}
}


?>
