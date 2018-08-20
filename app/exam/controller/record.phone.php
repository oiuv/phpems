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

	private function ajax()
	{
		switch($this->ev->url(4))
		{
			//删除一个错题记录
			case 'delrecord':
			$recordid = $this->ev->get('questionid');
			$this->favor->delRecord($recordid);
			exit('1');
			break;

			default:
			break;
		}
	}

	private function index()
	{
		header("location:index.php?exam-phone-history");
	}
}


?>
