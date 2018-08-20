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

	private function getknowsbysectionid()
	{
		$sectionid = $this->ev->get('sectionid');
		$aknows = $this->section->getKnowsListByArgs(array(array("AND","knowssectionid = :knowssectionid",'knowssectionid',$sectionid),array("AND","knowsstatus = 1")));
		$data = array(array("",'选择知识点'));
		foreach($aknows as $knows)
		{
			$data[] = array($knows['knowsid'],$knows['knows']);
		}
		foreach($data as $p)
		{
			echo "<option value=\"{$p[0]}\">{$p[1]}</option>";
		}
	}

	private function detail()
	{
		$questionid = $this->ev->get('questionid');
		$questionparent = $this->ev->get('questionparent');
		if($questionparent)
		{
			$questions = $this->exam->getQuestionByArgs(array(array("AND","questionparent = :questionparent",'questionparent',$questionparent)));
		}
		else
		{
			$question = $this->exam->getQuestionByArgs(array(array("AND","questionid = :questionid",'questionid',$questionid)));
			$sections = array();
			foreach($question['questionknowsid'] as $key => $p)
			{
				$knows = $this->section->getKnowsByArgs(array(array("AND","knowsid = :knowsid",'knowsid',$p['knowsid'])));
				$question['questionknowsid'][$key]['knows'] = $knows['knows'];
				$sections[] = $this->section->getSectionByArgs(array(array("AND","sectionid = :sectionid",'sectionid',$knows['knowssectionid'])));
			}
			$subject = $this->basic->getSubjectById($sections[0]['sectionsubjectid']);
		}
		$this->tpl->assign("subject",$subject);
		$this->tpl->assign("sections",$sections);
		$this->tpl->assign("question",$question);
		$this->tpl->assign("questions",$questions);
		$this->tpl->display('question_detail');
	}

	private function rowsdetail()
	{
		$questionid = $this->ev->get('questionid');
		$question = $this->exam->getQuestionRowsByArgs(array(array("AND","qrid = :qrid",'qrid',$questionid)));
		$sections = array();
		foreach($question['qrknowsid'] as $key => $p)
		{
			$knows = $this->section->getKnowsByArgs(array(array("AND","knowsid = :knowsid",'knowsid',$p['knowsid'])));
			$question['qrknowsid'][$key]['knows'] = $knows['knows'];
			$sections[] = $this->section->getSectionByArgs(array(array("AND","sectionid = :sectionid",'sectionid',$knows['knowssectionid'])));
		}
		$subject = $this->basic->getSubjectById($sections[0]['sectionsubjectid']);
		$this->tpl->assign("subject",$subject);
		$this->tpl->assign("sections",$sections);
		$this->tpl->assign("question",$question);
		$this->tpl->display('questionrows_detail');
	}

	private function questionrows()
	{
		$this->pg->isPhone = 1;
		$this->pg->target = 'class="ajax" data-target="questions" data-page="questions" ';
		$page = $this->ev->get('page');
		$page = $page > 0?$page:1;
		$questypes = $this->basic->getQuestypeList();
		$basic = $this->data['currentbasic'];
		$search = $this->ev->get('search');
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
			$args[] = array("AND","questionrows.qrquestion LIKE :qrquestion",'qrquestion',"%".$search['keyword']."%");
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
			else
			{
				$knows = $this->section->getAllKnowsBySubject($basic['basicsubjectid']);
				foreach($knows as $p)
				{
					if($p['knowsid'])$tmpknows .= ','.$p['knowsid'];
				}
				$args[] = array("AND","find_in_set(quest2knows.qkknowsid,:qkknowsid)",'qkknowsid',$tmpknows);
			}
		}
		$questions = $this->exam->getQuestionrowsList($page,10,$args);
		$subjects = $this->basic->getSubjectList();
		$sections = $this->section->getSectionListByArgs(array(array("AND","sectionsubjectid = :sectionsubjectid",'sectionsubjectid',$basic['basicsubjectid'])));
		$knows = $this->section->getKnowsListByArgs(array(array("AND","knowsstatus = 1"),array("AND","knowssectionid = :knowssectionid",'knowssectionid',$search['questionsectionid'])));
		$this->tpl->assign('search',$search);
		$this->tpl->assign('subjects',$subjects);
		$this->tpl->assign('sections',$sections);
		$this->tpl->assign('knows',$knows);
		$this->tpl->assign('questypes',$questypes);
		$this->tpl->assign('questions',$questions);
		$this->tpl->display('questionrows');
	}

	private function index()
	{
		$this->pg->isPhone = 1;
		$this->pg->target = 'class="ajax" data-target="questions" data-page="questions" ';
		$page = $this->ev->get('page');
		$search = $this->ev->get('search');
		$basic = $this->data['currentbasic'];
		$sections = $this->section->getSectionListByArgs(array(array("AND","sectionsubjectid = :sectionsubjectid",'sectionsubjectid',$basic['basicsubjectid'])));
		$args = array(array("AND","quest2knows.qkquestionid = questions.questionid"),array("AND","questions.questionstatus = '1'"),array("AND","questions.questionparent = 0"),array("AND","quest2knows.qktype = 0") );
		if($search['questionid'])
		{
			$args[] = array("AND","questions.questionid = :questionid",'questionid',$search['questionid']);
		}
		if($search['keyword'])
		{
			$args[] = array("AND","questions.question LIKE :question",'question','%'.$search['keyword'].'%');
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
			else
			{
				$knows = $this->section->getAllKnowsBySubject($basic['basicsubjectid']);
				foreach($knows as $p)
				{
					if($p['knowsid'])$tmpknows .= ','.$p['knowsid'];
				}
				$args[] = array("AND","find_in_set(quest2knows.qkknowsid,:qkknowsid)",'qkknowsid',$tmpknows);
			}
		}
		$questions = $this->exam->getQuestionsList($page,10,$args);
		$knows = $this->section->getKnowsListByArgs(array(array("AND","knowsstatus = 1"),array("AND","knowssectionid = :knowssectionid",'knowssectionid',$search['questionsectionid'])));
		$this->tpl->assign('knows',$knows);
		$this->tpl->assign('questions',$questions);
		$this->tpl->assign('sections',$sections);
		$this->tpl->assign('search',$search);
		$this->tpl->assign('page',$page);
		$this->tpl->display('questions');
	}
}


?>
