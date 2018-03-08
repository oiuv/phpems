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

	private function view()
	{
		$sessionvars = $this->exam->getExamSessionBySessionid();
		if($sessionvars['examsessiontype'])
		{
			if($sessionvars['examsessiontype'] == 1)
			header("location:index.php?exam-app-exampaper-view");
			else
			header("location:index.php?exam-app-exam-view");
			exit;
		}
		$this->tpl->assign('questype',$this->basic->getQuestypeList());
		$this->tpl->assign('sessionvars',$sessionvars);
		$this->tpl->display('exercise_view');
	}

	private function reload()
	{
		$args = array('examsessionkey' => 0);
		$this->exam->modifyExamSession($args);
		header("location:index.php?exam-app-exercise");
		exit;
	}

	private function ajax()
	{
		switch($this->ev->url(4))
		{
			//获取剩余考试时间
			case 'getexamlefttime':
			$sessionvars = $this->exam->getExamSessionBySessionid();
			$lefttime = 0;
			if($sessionvars['examsessionstatus'] == 0 && $sessionvars['examsessiontype'] == 1)
			{
				if(TIME > ($sessionvars['examsessionstarttime'] + $sessionvars['examsessiontime']*60))
				{
					$lefttime = $sessionvars['examsessiontime']*60;
				}
				else
				{
					$lefttime = TIME - $sessionvars['examsessionstarttime'];
				}
			}
			echo $lefttime;
			exit();
			break;

			case 'getQuestionNumber':
			$questype = $this->basic->getQuestypeList();
			$sectionid = $this->ev->get('sectionid');
			$knowids = $this->ev->get('knowsid');
			if(!$knowids)
			{
				if(!$sectionid)$knows = $this->section->getAllKnowsBySubject($this->data['currentsubject']['subjectid']);
				else
				$knows = $this->section->getKnowsListByArgs(array(array("AND","knowssectionid = :knowssectionid",'knowssectionid',$sectionid),array("AND","knowsstatus = 1")));
				foreach($knows as $key => $p)
				$knowids .= "{$key},";
				$knowids = trim($knowids," ,");
			}
			$numbers = array();
			$numbers = array();
			foreach($questype as $p)
			{
				$numbers[$p['questid']] = intval(ceil($this->exam->getQuestionNumberByQuestypeAndKnowsid($p['questid'],$knowids)));
			}
			$this->tpl->assign('numbers',$numbers);
			$this->tpl->assign('questype',$questype);
			$this->tpl->display('exercise_number');
			break;

			case 'saveUserAnswer':
			$question = $this->ev->post('question');
			foreach($question as $key => $t)
			{
				if($t == '')unset($question[$key]);
			}
			$this->exam->modifyExamSession(array('examsessionuseranswer'=>$question));
			echo is_array($question)?count($question):0;
			exit;
			break;

			default:
		}
	}

	private function makescore()
	{
		if($this->ev->get('makescore'))
		{
			$questype = $this->basic->getQuestypeList();
			$sessionvars = $this->exam->getExamSessionBySessionid();
			$score = $this->ev->get('score');
			$sumscore = 0;
			if(is_array($score))
			{
				foreach($score as $key => $p)
				{
					$sessionvars['examsessionscorelist'][$key] = $p;
				}
			}
			foreach($sessionvars['examsessionscorelist'] as $p)
			{
				$sumscore = $sumscore + floatval($p);
			}
			$sessionvars['examsessionscore'] = $sumscore;
			$args['examsessionscorelist'] = $sessionvars['examsessionscorelist'];
			$allnumber = floatval(count($sessionvars['examsessionscorelist']));
			$args['examsessionscore'] = floatval(($sessionvars['examsessionscore']*100)/$allnumber);
			$args['examsessionstatus'] = 2;
			$this->exam->modifyExamSession($args);
			$ehid = $this->favor->addExamHistory();
			if($this->ev->get('direct'))
			{
				header("location:index.php?exam-app-exercise-makescore&ehid={$ehid}");
				exit;
			}
			else
			{
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功",
				    "callbackType" => 'forward',
				    "forwardUrl" => "index.php?exam-app-exercise-makescore&ehid={$ehid}"
				);
				$this->G->R($message);
			}
		}
		else
		{
			$ehid = $this->ev->get('ehid');
			$eh = $this->favor->getExamHistoryById($ehid);
			$sessionvars = array(
				'examsession' => $eh['ehexam'],
				'examsessiontype'=> $eh['ehtype'] == 2?1:$eh['ehtype'],
				'examsessionsetting'=> $eh['ehsetting'],
				'examsessionbasic'=> $eh['ehbasicid'],
				'examsessionquestion'=> $eh['ehquestion'],
				'examsessionuseranswer'=>$eh['ehanswer'],
				'examsessiontime'=> $eh['ehtime'],
				'examsessionscorelist'=> $eh['ehscorelist'],
				'examsessionscore'=>$eh['ehscore'],
				'examsessionstarttime'=>$eh['ehstarttime']
			);

			$questype = $this->basic->getQuestypeList();
			$number = array();
			$right = array();
			$score = array();
			$allnumber = 0;
			$allright = 0;
			foreach($questype as $key => $q)
			{
				$number[$key] = 0;
				$right[$key] = 0;
				$score[$key] = 0;
				if($sessionvars['examsessionquestion']['questions'][$key])
				{
					foreach($sessionvars['examsessionquestion']['questions'][$key] as $p)
					{
						$number[$key]++;
						$allnumber++;
						if($sessionvars['examsessionscorelist'][$p['questionid']] == 1)
						{
							$right[$key]++;
							$allright++;
						}
						$score[$key] = $score[$key]+$sessionvars['examsessionscorelist'][$p['questionid']];
					}
				}
				if($sessionvars['examsessionquestion']['questionrows'][$key])
				{
					foreach($sessionvars['examsessionquestion']['questionrows'][$key] as $v)
					{
						foreach($v['data'] as $p)
						{
							$number[$key]++;
							$allnumber++;
							if($sessionvars['examsessionscorelist'][$p['questionid']] == 1)
							{
								$right[$key]++;
								$allright++;
							}
							$score[$key] = $score[$key]+$sessionvars['examsessionscorelist'][$p['questionid']];
						}
					}
				}
			}
			$this->tpl->assign('ehid',$ehid);
			$this->tpl->assign('questype',$questype);
			$this->tpl->assign('allright',$allright);
			$this->tpl->assign('allnumber',$allnumber);
			$this->tpl->assign('right',$right);
			$this->tpl->assign('score',$score);
			$this->tpl->assign('number',$number);
			$this->tpl->assign('questype',$questype);
			$this->tpl->assign('sessionvars',$sessionvars);
			$this->tpl->display('exercise_score');
		}
	}

	private function score()
	{
		$questype = $this->basic->getQuestypeList();
		$sessionvars = $this->exam->getExamSessionBySessionid();
		$needhand = 0;
		if($this->ev->get('insertscore'))
		{
			$question = $this->ev->get('question');
			foreach($question as $key => $a)
			$sessionvars['examsessionuseranswer'][$key] = $a;
			foreach($sessionvars['examsessionquestion']['questions'] as $key => $tmp)
			{
				if(!$questype[$key]['questsort'])
				{
					foreach($tmp as $p)
					{
						if(is_array($sessionvars['examsessionuseranswer'][$p['questionid']]))
						{
							$nanswer = '';
							$answer = $sessionvars['examsessionuseranswer'][$p['questionid']];
							asort($answer);
							$nanswer = implode("",$answer);
							if($nanswer == $p['questionanswer'])$score = 1;
							else
							{
								if($questype[$key]['questchoice'] == 3)
								{
									$alen = strlen($p['questionanswer']);
									$rlen = 0;
									foreach($answer as $t)
									{
										if(strpos($p['questionanswer'],$t) === false)
										{
											$rlen = 0;
											break;
										}
										else
										{
											$rlen ++;
										}
									}
									$score = floatval($rlen/$alen);
								}
								else $score = 0;
							}
						}
						else
						{
							$answer = $sessionvars['examsessionuseranswer'][$p['questionid']];
							if($answer == $p['questionanswer'])$score = 1;
							else $score = 0;
						}
						$scorelist[$p['questionid']] = $score;
					}
				}
				else
				{
					if(is_array($tmp) && count($tmp))
					$needhand = 1;
				}
			}
			foreach($sessionvars['examsessionquestion']['questionrows'] as $key => $tmp)
			{
				if(!$questype[$key]['questsort'])
				{
					foreach($tmp as $tmp2)
					{
						foreach($tmp2['data'] as $p)
						{
							if(is_array($sessionvars['examsessionuseranswer'][$p['questionid']]))
							{
								$answer = $sessionvars['examsessionuseranswer'][$p['questionid']];
								asort($answer);
								$nanswer = implode("",$answer);
								if($nanswer == $p['questionanswer'])$score = 1;
								else
								{
									if($questype[$key]['questchoice'] == 3)
									{
										$alen = strlen($p['questionanswer']);
										$rlen = 0;
										foreach($answer as $t)
										{
											if(strpos($p['questionanswer'],$t) === false)
											{
												$rlen = 0;
												break;
											}
											else
											{
												$rlen ++;
											}
										}
										$score = $rlen/$alen;
									}
									else $score = 0;
								}
							}
							else
							{
								$answer = $sessionvars['examsessionuseranswer'][$p['questionid']];
								if($answer == $p['questionanswer'])$score = 1;
								else $score = 0;
							}
							$scorelist[$p['questionid']] = $score;
						}
					}
				}
				else
				{
					if(!$needhand)
					{
						if(is_array($tmp) && count($tmp))
						$needhand = 1;
					}
				}
			}
			$args['examsessionuseranswer'] = $question;
			$args['examsessionscorelist'] = $scorelist;
			if(!$needhand)
			{
				$args['examsessionstatus'] = 2;
				$this->exam->modifyExamSession($args);
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功",
				    "callbackType" => 'forward',
				    "forwardUrl" => "index.php?exam-app-exercise-makescore&makescore=1&direct=1"
				);
			}
			else
			{
				$args['examsessionstatus'] = 1;
				$this->exam->modifyExamSession($args);
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功",
				    "callbackType" => 'forward',
				    "forwardUrl" => "index.php?exam-app-exercise-score"
				);
			}
			$this->G->R($message);
		}
		else
		{
			if($sessionvars['examsessionstatus'] == 2)
			{
				header("location:index.php?exam-app-exercise-makescore");
				exit;
			}
			else
			{
				$this->tpl->assign('sessionvars',$sessionvars);
				$this->tpl->assign('questype',$questype);
				$this->tpl->display('exercise_mkscore');
			}
		}
	}

	private function paper()
	{
		$sessionvars = $this->exam->getExamSessionBySessionid();
		$lefttime = 0;
		$questype = $this->basic->getQuestypeList();
		if($sessionvars['examsessionstatus'] == 2)
		{
			header("location:index.php?exam-app-exercise-makescore&makescore=1&direct=1");
			exit;
		}
		elseif($sessionvars['examsessionstatus'] == 1)
		{
			header("location:index.php?exam-app-exercise-score");
			exit;
		}
		else
		{
			$this->tpl->assign('questype',$questype);
			$this->tpl->assign('sessionvars',$sessionvars);
			$this->tpl->assign('lefttime',$lefttime);
			$this->tpl->assign('donumber',is_array($sessionvars['examsessionuseranswer'])?count($sessionvars['examsessionuseranswer']):0);
			$this->tpl->display('exercise_paper');
		}
	}

	private function index()
	{
		$questype = $this->basic->getQuestypeList();
		if($this->ev->get('setExecriseConfig'))
		{
			$args = $this->ev->get('args');
			$sessionvars = $this->exam->getExamSessionBySessionid();
			if(!$args['knowsid'])
			{
				$args['knowsid'] = '';
				if($args['sectionid'])
				$knowsids = $this->section->getKnowsListByArgs(array(array("AND","knowssectionid = :knowssectionid",'knowssectionid',$args['sectionid']),array("AND","knowsstatus = 1")));
				else
				{
					$knowsids = $this->section->getAllKnowsBySubject($this->data['currentsubject']['subjectid']);
				}
				foreach($knowsids as $key => $p)
				$args['knowsid'] .= intval($key).",";
				$args['knowsid'] = trim($args['knowsid']," ,");
			}
			arsort($args['number']);
			$snumber = 0;
			foreach($args['number'] as $key => $v)
			{
				$snumber += $v;
				if($snumber > 100)
				{
					$message = array(
						'statusCode' => 300,
						"message" => "强化练习最多一次只能抽取100道题"
					);
					$this->G->R($message);
				}
			}
			$dt = key($args['number']);
			$questionids = $this->question->selectQuestionsByKnows($args['knowsid'],$args['number'],$dt);
			$questions = array();
			$questionrows = array();
			foreach($questionids['question'] as $key => $p)
			{
				$ids = "";
				if(count($p))
				{
					foreach($p as $t)
					{
						$ids .= $t.',';
					}
					$ids = trim($ids," ,");
					if(!$ids)$ids = 0;
					$questions[$key] = $this->exam->getQuestionListByIds($ids);
				}
			}
			foreach($questionids['questionrow'] as $key => $p)
			{
				$ids = "";
				if(is_array($p))
				{
					if(count($p))
					{
						foreach($p as $t)
						{
							$questionrows[$key][$t] = $this->exam->getQuestionRowsById($t);
						}
					}
				}
				else $questionrows[$key][$p] = $this->exam->getQuestionRowsByArgs("qrid = '{$p}'");
			}
			$sargs['examsessionquestion'] = array('questionids'=>$questionids,'questions'=>$questions,'questionrows'=>$questionrows);
			$sargs['examsessionsetting'] = $args;
			$sargs['examsessionstarttime'] = TIME;
			$sargs['examsessionuseranswer'] = NULL;
			$sargs['examsession'] = $args['title'];
			$sargs['examsessiontime'] = $args['time']>0?$args['time']:60;
			$sargs['examsessionstatus'] = 0;
			$sargs['examsessiontype'] = 0;
			$sargs['examsessionbasic'] = $this->data['currentbasic']['basicid'];
			$sargs['examsessionkey'] = $args['knowsid'];
			$sargs['examsessionissave'] = 0;
			$sargs['examsessionsign'] = NULL;
			$sargs['examsessionsign'] = '';
			$sargs['examsessionuserid'] = $this->_user['sessionuserid'];
			if($sessionvars['examsessionid'])
			$this->exam->modifyExamSession($sargs);
			else
			$this->exam->insertExamSession($sargs);
			$message = array(
				'statusCode' => 200,
				"message" => "抽题成功，正在转入试题页面",
			    "callbackType" => 'forward',
			    "forwardUrl" => "index.php?exam-app-exercise-paper"
			);
			$this->G->R($message);
		}
		else
		{
			$sections = $this->section->getSectionListByArgs(array(array("AND","sectionsubjectid = :sectionsubjectid",'sectionsubjectid',$this->data['currentbasic']['basicsubjectid'])));
			$knows = $this->section->getAllKnowsBySubject($this->data['currentbasic']['basicsubjectid']);
			$knowids = '';
			foreach($knows as $key => $p)
			$knowids .= "{$key},";
			$knowids = trim($knowids," ,");
			$numbers = array();
			foreach($questype as $p)
			{
				$numbers[$p['questid']] = intval(ceil($this->exam->getQuestionNumberByQuestypeAndKnowsid($p['questid'],$knowids)));
			}
			$this->tpl->assign('basicnow',$this->data['currentbasic']);
			$this->tpl->assign('sections',$sections);
			$this->tpl->assign('questype',$questype);
			$this->tpl->assign('numbers',$numbers);
			$this->tpl->display('exercise');
		}
	}
}


?>
