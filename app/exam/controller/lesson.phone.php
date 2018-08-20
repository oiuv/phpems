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

	private function reporterror()
	{
		if($this->ev->get('reporterror'))
		{
			$args = $this->ev->get('args');
			if($args['fbquestionid'] && $args['fbtype'])
			{
				$this->feedback = $this->G->make('feedback','exam');
				$args['fbuserid'] = $this->_user['sessionuserid'];
				$this->feedback->addFeedBack($args);
				$message = array(
					'statusCode' => 200,
					"message" => "提交成功，请等待管理员处理",
					"callbackType" => 'forward',
				    "forwardUrl" => "back"
				);
			}
			else
			$message = array(
				'statusCode' => 300,
				"message" => "缺少参数"
			);
			$this->G->R($message);
		}
		else
		{
			$questionid = $this->ev->get('questionid');
			$this->tpl->assign('questionid',$questionid);
			$this->tpl->display('lesson_feedback');
		}
	}

	private function ajax()
	{
		switch($this->ev->url(4))
		{
			case 'questions':
			$number = $this->ev->get('number');
			if(!$number)$number = $this->ev->getCookie('number');
			if(!$number)$number = 1;
			$cnumber = $number;
			$this->ev->setCookie('number',$number);
			$questid = $this->ev->getCookie('questype');
			$knowsid = $this->ev->getCookie('knowsid');
			if(!$questid || !$knowsid)
			{
				$message = array(
					'statusCode' => 200,
					"message" => "操作超时，请重新开始练习",
				    "callbackType" => 'forward',
				    "forwardUrl" => "index.php?exam-phone-lesson"
				);
				$this->G->R($message);
			}
			$args = array('exeruserid' => $this->_user['sessionuserid'],'exerbasicid' => $this->data['currentbasic']['basicid'],'exerknowsid' => $knowsid,'exernumber' => $number,'exerqutype' => $questid);
			$this->G->make('exercise','exam')->setExercise($args);
			$questions = $this->question->getRandQuestionListByKnowid($knowsid,$questid);
			$allnumber = $this->exam->getQuestionNumberByQuestypeAndKnowsid($questid,$knowsid);
			$qunumber = count($questions);
			if($number > $qunumber)
			{
				$qrs = $this->question->getRandQuestionRowsListByKnowid($knowsid,$questid);
				if($number <= $allnumber)
				{
					$i = 1;
					$prenumber = 1;
					while($number > $qunumber)
					{
						$question =  $this->exam->getQuestionRowsByArgs(array(array("AND","qrnumber > 0"),array("AND","qrid = :qrid",'qrid',$qrs[intval($i-1)])));
						if($question['qrnumber'] >= 1)
						{
							$qunumber = $qunumber + $question['qrnumber'];
							if($number > $qunumber)
							$i++;
						}
						else
						break;
					}
					if($i > 0)
					{
						$prequestion =  $this->exam->getQuestionRowsByArgs(array(array("AND","qrid = :qrid",'qrid',$qrs[intval($i-1)])));
						$prenumer = $prequestion['qrnumber'];
						$tmpn = $number - $qunumber - 1;
						if($tmpn < 0)$tmpn = $prenumer + $tmpn;
						$pi = 0;
						if($tmpn < 0)$tmpn = 0;
						foreach($prequestion['data'] as $p)
						{
							if($tmpn == $pi)
							$vq = $p;
							$pi++;
						}
						$this->tpl->assign('vquestion',$vq);
						$this->tpl->assign('tmpn',$tmpn+1);
					}
				}
				else
				{
					$message = array(
						'statusCode' => 300,
						"message" => "您已经做完所有的题了"
					);
					$this->G->R($message);
				}
			}
			else
			$question = $this->exam->getQuestionByArgs(array(array("AND","questionid = :questionid",'questionid',$questions[intval($number - 1)])));
			$questype = $this->basic->getQuestypeById($questid);
			$this->tpl->assign('question',$question);
			$this->tpl->assign('questype',$questype);
			$this->tpl->assign('allnumber',$allnumber);
			$this->tpl->assign('prenumber',$prenumber);
			$this->tpl->assign('number',$number);
			$this->tpl->assign('knowsid',$knowsid);
			$this->tpl->display('lesson_ajaxquestion');
			break;

			case 'setlesson':
			$questype = intval($this->ev->get('questype'));
			$knowsid = intval($this->ev->get('knowsid'));
			$number = intval($this->ev->get('number'));
			if($questype && $knowsid)
			{
				$this->ev->setCookie('questype',$questype,3600*24);
				$this->ev->setCookie('knowsid',$knowsid,3600*24);
				$this->ev->setCookie('number',$number);
				$message = array(
					'statusCode' => 200,
				    "callbackType" => 'forward',
				    "message" => '系统正在抽题，请稍等',
				    "forwardUrl" => "index.php?exam-phone-lesson-paper"
				);
			}
			else
			{
				$message = array(
					'statusCode' => 300,
					"message" => "非法参数"
				);
			}
			$this->G->R($message);
			break;
		}
	}

	private function paper()
	{
		$questid = $this->ev->getCookie('questype');
		$knowsid = $this->ev->getCookie('knowsid');
		$questype = $this->basic->getQuestypeById($questid);
		$knows = $this->section->getKnowsByArgs(array(array("AND","knowsid = :knowsid",'knowsid',$knowsid)));
        $allnumber = $this->exam->getQuestionNumberByQuestypeAndKnowsid($questid,$knowsid);
		$this->tpl->assign('knows',$knows);
        $this->tpl->assign('allnumber',$allnumber);
		$this->tpl->assign('questype',$questype);
		$this->tpl->display('lesson_paper');
	}

	private function lessonnumber()
	{
		$questype = $this->basic->getQuestypeList();
		$knowsid = intval($this->ev->get('knowsid'));
		$numbers = array();
		foreach($questype as $p)
		{
			$numbers[$p['questid']] = intval(ceil($this->exam->getQuestionNumberByQuestypeAndKnowsid($p['questid'],$knowsid)));
		}
		$this->tpl->assign('knows',$this->section->getKnowsByArgs(array(array("AND","knowsid = :knowsid",'knowsid',$knowsid))));
		$this->tpl->assign('numbers',$numbers);
		$this->tpl->assign('questype',$questype);
		$this->tpl->display('lesson_number');
	}

	private function index()
	{
		$questype = $this->basic->getQuestypeList();
		$basic = $this->data['currentbasic'];
		$knows = $this->section->getAllKnowsBySubject($basic['basicsubjectid']);
		$sections = $this->section->getSectionListByArgs(array(array("AND","sectionsubjectid = :sectionsubjectid",'sectionsubjectid',$basic['basicsubjectid'])));
		$record = $this->G->make('exercise','exam')->getExerciseProcessByUser($this->_user['sessionuserid'],$basic['basicid']);
		$this->tpl->assign('record',$record);
		$this->tpl->assign('basic',$basic);
		$this->tpl->assign('sections',$sections);
		$this->tpl->assign('knows',$knows);
		$this->tpl->assign('questype',$questype);
		$this->tpl->display('lesson');
	}
}


?>
