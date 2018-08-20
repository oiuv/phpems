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

	private function ajax()
	{
		switch($this->ev->url(4))
		{
			//根据章节获取知识点
			case 'getknowsbysectionid':
			$esid = $this->ev->get('esid');
			$knowsid = $this->ev->get('knowsid');
			$aknows = $this->section->getKnowsListByArgs(array(array("AND","knowssectionid = :knowssectionid",'knowssectionid',$esid),array("AND","knowsstatus = 1")));
			echo "<option value='0'>全部</option>";
			foreach($aknows as $knows)
			{
				if($knowsid == $knows['knowsid'])
				echo "<option value='{$knows['knowsid']}' selected>{$knows['knows']}</option>";
				else
				echo "<option value='{$knows['knowsid']}'>{$knows['knows']}</option>";
				echo "\n";
			}
			exit();
			break;

			//根据科目获取章节
			case 'getsectionsbysubjectid':
			$esid = $this->ev->get('subjectid');
			$knowsid = intval($this->ev->get('knowsid'));
			if($knowsid)
			$tmp = $this->section->getSubjectAndSectionByKnowsid($knowsid);
			else
			{
				$tmp['knowssectionid'] = intval($this->ev->get('sectionid'));
			}
			$aknows = $this->section->getSectionListByArgs(array(array("AND","sectionsubjectid = :sectionsubjectid",'sectionsubjectid',$esid)));
			echo "<option value='0'>全部</option>";
			foreach($aknows as $knows)
			{
				if($tmp['knowssectionid'] == $knows['sectionid'])
				echo "<option value='{$knows['sectionid']}' selected>{$knows['section']}</option>";
				else
				echo "<option value='{$knows['sectionid']}'>{$knows['section']}</option>";
				echo "\n";
			}
			exit();
			break;

			default:
			break;
		}
	}

	private function batdel()
	{
		$askids = $this->ev->get('askids');
		foreach($askids as $id)
		{
			$this->answer->delAsksById($id);
		}
		header("location:index.php?exam-app-answer");
	}

	private function ask()
	{
		$askid = $this->ev->get('askid');
		$page = $this->ev->get('page');
		if(!$askid)
		{
			$questionid = $this->ev->get('questionid');
			if(!$questionid)
			{
				header("location:index.php?exam-app-answer");
				exit;
			}
			else
			$ask = $this->answer->getAskByArgs(array(array("AND","askuserid = :askuserid",'askuserid',$this->_user['sessionuserid']),array("AND","askquestionid = :askquestionid",'askquestionid',$questionid)));
			if(!$ask)$ask = array('askquestionid' => $questionid);
		}
		else
		$ask = $this->answer->getAskById($askid);
		$question = $this->exam->getQuestionByArgs(array(array("AND","questionid = :questionid",'questionid',$ask['askquestionid'])));
		if($ask['askid'])
		{
			$this->tpl->assign('allknows',$this->section->getAllKnowsBySubject($ask['asksubjectid']));
			$this->tpl->assign('answers',$this->answer->getAnswerList($page,20,array(array("AND","answeraskid = :answeraskid",'answeraskid',$ask['askid']))));
		}
		else
		{
			$tmp = $this->section->getSubjectAndSectionByKnowsid($question['questionknowsid']);
			$this->tpl->assign('allknows',$this->section->getAllKnowsBySubject($tmp['sectionsubjectid']));
		}
		$knows = $this->section->getKnowsByArgs(array(array("AND","knowsid = :knowsid",'knowsid',$question['questionknowsid'])));
		$this->tpl->assign('knows',$knows);
		$this->tpl->assign('question',$question);
		$this->tpl->assign('ask',$ask);
		$this->tpl->display('ask');
	}

	private function addanswer()
	{
		$questionid = $this->ev->get('questionid');
		$args = $this->ev->get('args');
		if(!$questionid)
		{
			header("location:index.php?exam-app-answer");
			exit;
		}
		else
		{
			$ask = $this->answer->getAskByArgs(array(array("AND","askuserid = :askuserid",'askuserid',$this->_user['sessionuserid']),array("AND","askquestionid = :askquestionid",'askquestionid',$questionid)));
			if(!$ask)
			{
				$question = $this->exam->getQuestionByArgs(array(array("AND","questionid = :questionid",'questionid',$questionid)));
				$tmp = $this->section->getSubjectAndSectionByKnowsid($question['questionknowsid']);
				$askargs = array('asksubjectid'=>$tmp['sectionsubjectid'],'askquestionid'=>$questionid,'askuserid'=>$this->_user['sessionuserid'],'asktime'=>TIME,'asklasttime'=>TIME);
				$id = $this->answer->insertAsks($askargs);
				$ask = $this->answer->getAskById($id);
			}
			$args['answeraskid'] = $ask['askid'];
			$args['answerasktime'] = TIME;
			$this->answer->insertAnswer($args);
			header('location:index.php?exam-app-answer-ask&askid='.$ask['askid']);
			exit;
		}
	}

	private function index()
	{
		$page = $this->ev->get('page');
		$knowsid = $this->ev->get('knowsid');
		$sectionid = $this->ev->get('sectionid');
		$status = $this->ev->get('status');
		$etime = $this->ev->get('etime');
		$subjectid = $this->ev->get('subjectid');
		if($etime)$etime = strtotime($etime);
		$subjects = $this->basic->getSubjectList();
		$args = array(array("AND","asks.askdel = 0"));
		$args[] = array("AND","asks.askquestionid = questions.questionid");
		$args[] = array("AND","asks.askuserid = :askuserid",'askuserid',$this->_user['sessionuserid']);
		if($knowsid)$args[] = array("AND","questions.questionknowsid = :questionknowsid",'questionknowsid',$knowsid);
		else
		{
			if($sectionid)
			{
				$knowsids = $this->section->getKnowsListByArgs(array(array("AND","knowssectionid = :knowssectionid",'knowssectionid',$sectionid)));
				$tm = array();
				foreach($knowsids as $p)
				{
					$tm[] = $p['knowsid'];
				}
				$ids = implode(",",$tm);
				if(!$ids)$ids = 0;
				$args[] = array("AND","questions.questionknowsid IN (:questionknowsid)",'questionknowsid',$ids);
			}
			elseif($subjectid)
			{
				$args[] = array("AND","asks.asksubjectid = :asksubjectid",'asksubjectid',$subjectid);
			}
		}
		if($etime)$args[] = array("AND","asks.asklasttime = :asklasttime",'asklasttime',$etime);
		if($status)
		{
			if($status == 1)$args[] = array("AND","asks.askstatus = '1'");
			else
			$args[] = array("AND","asks.askstatus = '0'");
		}
		$asks = $this->answer->getAskList($page,20,$args);
		$this->tpl->assign('knowsid',$knowsid);
		$this->tpl->assign('status',$status);
		$this->tpl->assign('etime',$etime);
		$this->tpl->assign('asks',$asks);
		$this->tpl->assign('subjectid',$subjectid);
		$this->tpl->assign('subjects',$subjects);
		$this->tpl->assign('sectionid',$sectionid);
		$this->tpl->display('wddy');
	}
}


?>
