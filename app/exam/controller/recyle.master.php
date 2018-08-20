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

	private function backknows()
	{
		$knowsid = $this->ev->get('knowsid');
		$page = $this->ev->get('page');
		$nknow = $this->section->getKnowsByArgs(array(array("AND","knowsid = :knowsid",'knowsid',$knowsid)));
		$know = $this->section->getKnowsByArgs(array(array("AND","knowsstatus = 1",array("AND","knows = :knows",'knows',$nknow['knows']),array("AND","knowssectionid = :knowssectionid",'knowssectionid',$nknow['knowssectionid']))));
		if($know)
		{
			$message = array(
				'statusCode' => 300,
				"message" => "操作失败，所在章节下存在同名且未删除的知识点"
			);
			$this->G->R($message);
		}
		$this->section->backKnows($knowsid);
		$message = array(
			'statusCode' => 200,
			"message" => "操作成功",
			"callbackType" => "forward",
		    "forwardUrl" => "index.php?exam-master-recyle-knows&page={$page}"
		);
		$this->G->R($message);
	}

	private function delknows()
	{
		$knowsid = $this->ev->get('knowsid');
		$page = $this->ev->get('page');
		$this->section->delKnows($knowsid,true);
		$message = array(
			'statusCode' => 200,
			"message" => "操作成功",
			"callbackType" => "forward",
		    "forwardUrl" => "index.php?exam-master-recyle-knows&page={$page}"
		);
		$this->G->R($message);
	}

	private function knows()
	{
		$page = $this->ev->get('page');
		$page = $page > 0?$page:1;
		$args = array("knowsstatus = '0'");
		$knows = $this->section->getKnowsList($page,10,array(array("AND","knowsstatus = 0")));
		$this->tpl->assign('page',$page);
		$this->tpl->assign('knows',$knows);
		$this->tpl->display('recyle_knows');
	}

	private function rows()
	{
		$page = $this->ev->get('page');
		$page = $page > 0?$page:1;
		$args = array(array("AND","questionrows.qrstatus = '0'"),array("AND","questionrows.qrid = quest2knows.qkquestionid"),array("AND","quest2knows.qktype = 1"));
		$questypes = $this->basic->getQuestypeList();
		$questions = $this->exam->getQuestionrowsList($page,20,$args);
		$this->tpl->assign('page',$page);
		$this->tpl->assign('questypes',$questypes);
		$this->tpl->assign('questions',$questions);
		$this->tpl->display('recyle_rowsquestions');
	}

	private function finaldelquestion()
	{
		$page = $this->ev->get('page');
		$questionid = $this->ev->get('questionid');
		$this->exam->fanalDelQuestions($questionid);
		$message = array(
			'statusCode' => 200,
			"message" => "操作成功",
			"callbackType" => "forward",
		    "forwardUrl" => "index.php?exam-master-recyle&page={$page}"
		);
		$this->G->R($message);
	}

	private function finaldelrowsquestion()
	{
		$page = $this->ev->get('page');
		$questionid = $this->ev->get('questionid');
		$this->exam->finalDelQuestionRows($questionid);
		$this->exam->fanalDelQuestionsByArgs(array(array("AND","questionparent = :questionparent",'questionparent',$questionid)));
		$message = array(
			'statusCode' => 200,
			"message" => "操作成功",
			"callbackType" => "forward",
		    "forwardUrl" => "index.php?exam-master-recyle-rows&page={$page}"
		);
		$this->G->R($message);
	}

	private function index()
	{
		$page = $this->ev->get('page');
		$page = $page > 0?$page:1;
		$args = array(array("AND","quest2knows.qkquestionid = questions.questionid"),array("AND","questions.questionstatus = '0'"),array("AND","questions.questionparent = 0"),array("AND","quest2knows.qktype = 0" ));
		$questypes = $this->basic->getQuestypeList();
		$questions = $this->exam->getQuestionsList($page,20,$args);
		$this->tpl->assign('page',$page);
		$this->tpl->assign('questypes',$questypes);
		$this->tpl->assign('questions',$questions);
		$this->tpl->display('recyle_questions');
	}
}


?>
