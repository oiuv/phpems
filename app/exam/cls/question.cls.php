<?php
/*
 * Created on 2011-12-18
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
class question_exam
{
	public $G;

	public function __construct(&$G)
	{
		$this->G = $G;
	}

	public function _init()
	{
		if(!$this->init)
		{
			$this->sql = $this->G->make('sql');
			$this->pdosql = $this->G->make('pdosql');
			$this->db = $this->G->make('pepdo');
			$this->ev = $this->G->make('ev');
			$this->html = $this->G->make('html');
			$this->basic = $this->G->make('basic','exam');
			$this->exam = $this->G->make('exam','exam');
			$this->section = $this->G->make('section','exam');
			$this->tpl = $this->G->make('tpl');
			$this->selectorder = array('A','B','C','D','E','F','G','H','I','J','K','L','M','N');
			$this->tpl->assign('selectorder',$this->selectorder);
			$this->init = 1;
		}
	}

	public function parse($question)
	{
		$questype = $this->basic->getQuestypeById($question['questiontype']);
		if($questype['questsort'])return $this->subjective($question);
		switch($questype['questchoice'])
		{
			case '1':
			case '4':
			return $this->objective($question);
			break;

			default:
			return $this->objective($question,true);
			break;
		}
	}

	public function subjective($question)
	{
		$r = array('title'=>$question['question'],'selectlist'=>false,'selects'=>'','answer'=>$question['questionanswer'],'describe'=>$question['questiondescribe']);
		return $r;
	}

	public function objective($question,$isMultiple = false)
	{
		$r = array('title'=>$question['question'],'describe'=>$question['questiondescribe'],'type' => $question['questiontype']);
		$question['questionselect'] = explode("\n",$question['questionselect']);
		if(!$question['questionselect'][0])
		{
			$question['questionselect'] = array('对','错');
		}
		$r['selectlist'] = $question['questionselect'];
		$values = array();
		foreach($question['questionselect'] as $id => $select)
		{
			//$values[] = array('key'=>$this->selectorder[$id].':'.$select,'value'=>$this->selectorder[$id]);
			$values[] = array('key'=>$this->selectorder[$id],'value'=>$this->selectorder[$id]);
		}
		if($isMultiple)
		{
			$args = array('pars'=>array(array('key'=>'name','value'=>'question['.$question['questionid'].']')),'values'=>$values);
			$r['selects'] = $this->html->checkBoxArray($args);
		}
		else
		{
			$args = array('pars'=>array(array('key'=>'name','value'=>'question['.$question['questionid'].']')),'values'=>$values);
			$r['selects'] = $this->html->radio($args);
		}
		$r['answer'] = explode("\n",$question['questionanswer']);
		sort($r['answer']);
		foreach($r['answer'] as $id=>$p)
		{
			$r['answer'][$id] = trim($p);
		}
		$r['answer'] = implode('',$r['answer']);
		return $r;
	}

	//获取某些指定知识点的试题列表
	public function getRandQuestionListByKnowid($knowid,$typeid)
	{
		$data = array('DISTINCT questions.questionid',array('questions','quest2knows'),array(array("AND","find_in_set(quest2knows.qkknowsid,:knowid)",'knowid',$knowid),array("AND","quest2knows.qktype = 0"),array("AND","quest2knows.qkquestionid = questions.questionid"),array("AND","questions.questiontype = :typeid",'typeid',$typeid),array("AND","questions.questionstatus = 1")),false,"questionid asc",false);
		$sql = $this->pdosql->makeSelect($data);
		$r = $this->db->fetchAll($sql);
		$t = array();
		foreach($r as $p)
		{
			$t[] = $p['questionid'];
		}
		return $t;
	}

	//获取某些指定知识点的题帽题列表
	public function getRandQuestionRowsListByKnowid($knowid,$typeid,$number = false)
	{
		if($number)
		$data = array('DISTINCT questionrows.qrid',array('questionrows','quest2knows'),array(array("AND","find_in_set(quest2knows.qkknowsid,:knowid)",'knowid',$knowid),array("AND","quest2knows.qktype = 1"),array("AND","quest2knows.qkquestionid = questionrows.qrid"),array("AND","questionrows.qrtype = :typeid",'typeid',$typeid),array("AND","questionrows.qrnumber <= :number",'number',$number),array("AND","questionrows.qrstatus = 1")),false,false,false);
		else
		$data = array('DISTINCT questionrows.qrid',array('questionrows','quest2knows'),array(array("AND","find_in_set(quest2knows.qkknowsid ,:knowid)",'knowid',$knowid),array("AND","quest2knows.qktype = 1"),array("AND","quest2knows.qkquestionid = questionrows.qrid"),array("AND","questionrows.qrtype = :typeid",'typeid',$typeid),array("AND","questionrows.qrstatus = 1")),false,false,false);
		$sql = $this->pdosql->makeSelect($data);
		$r = $this->db->fetchAll($sql);
		$t = array();
		foreach($r as $p)
		{
			$t[] = $p['qrid'];
		}
		return $t;
	}

	//获取试题列表
	public function getRandQuestionList($args = 1)
	{
		if(!is_array($args))$args = array();
		$args[] = array("AND","questions.questionstatus = 1");
		$args[] = array("AND","quest2knows.qkquestionid = questions.questionid");
		$args[] = array("AND","quest2knows.qktype = 0");
		$data = array('DISTINCT questions.questionid',array('questions','quest2knows'),$args,false,false,false);
		$sql = $this->pdosql->makeSelect($data);
		$r = $this->db->fetchAll($sql);
		$t = array();
		foreach($r as $p)
		{
			$t[] = $p['questionid'];
		}
		return $t;
	}

	//获取特殊试题列表
	public function getRandQuestionRowsList($args = 1)
	{
		if(!is_array($args))$args = array();
		$args[] = array("AND","questionrows.qrstatus = 1");
		$args[] = array("AND","quest2knows.qkquestionid = questionrows.qrid");
		$args[] = array("AND","quest2knows.qktype = 1");
		$data = array('DISTINCT questionrows.qrid',array('questionrows','quest2knows'),$args,false,false,false);
		$sql = $this->pdosql->makeSelect($data);
		$r = $this->db->fetchAll($sql);
		$t = array();
		foreach($r as $p)
		{
			$t[] = $p['qrid'];
		}
		return $t;
	}

	//根据ID获取特殊试题编号
	public function getSpecialQuestionById($questionid)
	{
		$data = array('questionid','questions',array(array("AND","questionparent = :questionid",'questionid',$questionid),array("AND","questionstatus = 1")),false,"questionsequence ASC");
		$sql = $this->pdosql->makeSelect($data);
		$r = $this->db->fetchAll($sql);
		$t = array(0 => $questionid);
		foreach($r as $p)
		{
			$t[] = $p['questionid'];
		}
		return $t;
	}

	//根据科目和地区信息获取知识点
	public function getKnowsBySubjectAndAreaid($subjectid,$areaid)
	{
		$data = array('esknowsids','examsection',array(array("AND","essubjectid = :subjectid",'subjectid',$subjectid),array("AND","esareaid = :esareaid",'esareaid',$areaid)));
		$sql = $this->pdosql->makeSelect($data);
		$r = $this->db->fetchAll($sql);
		foreach($r as $p)
		{
			$t[] = $p['esknowsids'];
		}
		$n = implode(',',$t);
		$data = array("knowsid","knows",array(array("AND","find_in_set(knowsid,:knowsid)",'knowsid',$n),array("AND","knowsstatus = 1")));
		$sql = $this->pdosql->makeSelect($data);
		$r = $this->db->fetchAll($sql);
		foreach($r as $p)
		{
			$m[] = $p['knowsid'];
		}
		return implode(',',$m);
	}

	public function selectScaleQuestions($examid,$basic)
	{
		$exam = $this->exam->getExamSettingById($examid);
		if(!$exam['examsetting']['scalemodel'])
		return $this->selectQuestions($examid,$basic);
		$settings = $exam['examsetting'];
		foreach($settings['examscale'] as $key => $p)
		{
			$s1 = explode("\n",$p);
			foreach($s1 as $s2)
			{
				$s2 = trim($s2,"\n\r");
				$s2 = explode(":",$s2);
				if($s2[2])$num = explode(',',$s2[2]);
				else $num = $s2[1];
				$knowsids = explode(',',$s2[0]);
				if(!$basic['basicexam']['rulemodel'])
				{
					$tmp = array();
					foreach($basic['basicknows'] as $bp)
					{
						foreach($bp as $tbp)
						{
							$tmp[] = $tbp;
						}
					}
					$knowsids = array_intersect($knowsids, $tmp);
				}

				$knowsids = implode(',',$knowsids);
				if(!$knowsids)$knowsids = '0';
				if(is_array($num))
				{
					$number = array('1'=>intval($num[0]),'2'=>intval($num[1]),'3'=>intval($num[2]));
					arsort($number);
					$par = 0;
					foreach($number as $nkey => $t)
					{
						if(!$par && ($t > 0))
						{
							$par++;
							$trand = rand(1,4);
							if($trand < 3)
							{
								$qrs = $this->getRandQuestionRowsList(array(array("AND","find_in_set(quest2knows.qkknowsid,:knowsids)",'knowsids',$knowsids),array("AND","questionrows.qrlevel = :qrlevel",'qrlevel',$nkey),array("AND","questionrows.qrtype = :qrtype",'qrtype',$key),array("AND","questionrows.qrnumber <= :qrnumber",'qrnumber',$t)));
								if(count($qrs))
								{
									$qrid = $qrs[array_rand($qrs,1)];
									$questionrow[$key][] = $qrid;
									$qr = $this->exam->getQuestionRowsByArgs(array(array("AND","qrid = :qrid",'qrid',$qrid)));
									$t = intval($t - $qr['qrnumber']);
								}
							}
						}
						if($t)
						{
							$r = $this->getRandQuestionList(array(array("AND","find_in_set(quest2knows.qkknowsid,:knowsids)",'knowsids',$knowsids),array("AND","questions.questionlevel = :questionlevel",'questionlevel',$nkey),array("AND","questions.questiontype = :questiontype",'questiontype',$key)));
							if(is_array($r))
							{
								if((count($r) >= $t))
								{
									if($t <= 1)
									{
										$question[$key][] = $r[array_rand($r,1)];
									}
									else
									{
										$ts = array_rand($r,$t);
										foreach($ts as $tmp)
										{
											$question[$key][] = $r[$tmp];
										}
									}
								}
								else
								{
									foreach($r as $tmp)
									$question[$key][] = $tmp;
								}
							}
						}
						$expqr = 0;
						if($qrid)$expqr = $expqr.','.$qrid;
						while($t > 0)
						{
							$expqr = trim($expqr,',');
							if($expqr)
							$qrs = $this->getRandQuestionRowsList(array(array("AND","find_in_set(quest2knows.qkknowsid,:knowsids)",'knowsids',$knowsids),array("AND","NOT find_in_set(questionrows.qrid,:expqr)",'expqr',$expqr),array("AND","questionrows.qrlevel = :qrlevel",'qrlevel',$nkey),array("AND","questionrows.qrtype = :qrtype",'qrtype',$key),array("AND","questionrows.qrnumber <= :qrnumber",'qrnumber',$t),array("AND","questionrows.qrnumber > 0")));
							else
							$qrs = $this->getRandQuestionRowsList(array(array("AND","find_in_set(quest2knows.qkknowsid,:knowsids)",'knowsids',$knowsids),array("AND","questionrows.qrlevel = :qrlevel",'qrlevel',$nkey),array("AND","questionrows.qrtype = :qrtype",'qrtype',$key),array("AND","questionrows.qrnumber <= :qrnumber",'qrnumber',$t),array("AND","questionrows.qrnumber > 0")));
							if(count($qrs))
							{
								$qrid = $qrs[array_rand($qrs,1)];
								$questionrow[$key][] = $qrid;
								$qr = $this->exam->getQuestionRowsByArgs(array(array("AND","qrid = :qrid",'qrid',$qrid)));
								if($qr['qrnumber'])
								{
									$t = intval($t - $qr['qrnumber']);
									$expqr = $expqr.','.$qrid;
								}
							}
							else
							break;
						}
						/**
						if($t > 0)
						{
							if($expqr)
							$qrs = $this->getRandQuestionRowsList(array(array("AND","find_in_set(quest2knows.qkknowsid,:knowsids)",'knowsids',$knowsids),array("AND","questionrows.qrtype = :qrtype",'qrtype',$key),array("AND","NOT find_in_set(questionrows.qrid,:expqr)",'expqr',$expqr),array("AND","questionrows.qrnumber >= :qrnumber",'qrnumber',$t)));
							else
							{
								$qrs = $this->getRandQuestionRowsList(array(array("AND","find_in_set(quest2knows.qkknowsid,:knowsids)",'knowsids',$knowsids),array("AND","questionrows.qrtype = :qrtype",'qrtype',$key),array("AND","questionrows.qrnumber >= :qrnumber",'qrnumber',$t)));
							}
							if(count($qrs))
							{
								$qrid = $qrs[array_rand($qrs,1)];
								$questionrow[$key][] = $qrid;
								if($qrid)
								{
									$qr = $this->exam->getQuestionRowsByArgs(array(array("AND","qrid = :qrid",'qrid',$qrid)));
									if($qr['qrnumber'])
									{
										$t = intval($t - $qr['qrnumber']);
										$expqr = $expqr.','.$qrid;
									}
								}
							}
						}
						**/
					}
				}
				else
				{
					$par = 0;
					$t = $num;
					if(!$par)
					{
						$par++;
						$trand = rand(1,4);
						if($trand < 3)
						{
							$qrs = $this->getRandQuestionRowsList(array(array("AND","find_in_set(quest2knows.qkknowsid,:knowsids)",'knowsids',$knowsids),array("AND","questionrows.qrtype = :qrtype",'qrtype',$key),array("AND","questionrows.qrnumber <= :qrnumber",'qrnumber',$t)));
							if(count($qrs))
							{
								$qrid = $qrs[array_rand($qrs,1)];
								$questionrow[$key][] = $qrid;
								$qr = $this->exam->getQuestionRowsByArgs(array(array("AND","qrid = :qrid",'qrid',$qrid)));
								$t = intval($t - $qr['qrnumber']);
							}
						}
					}
					if($t)
					{
						$r = $this->getRandQuestionList(array(array("AND","find_in_set(quest2knows.qkknowsid,:knowsids)",'knowsids',$knowsids),array("AND","questions.questiontype = :questiontype",'questiontype',$key)));
						if(is_array($r))
						{
							if((count($r) >= $t))
							{
								if($t <= 1)
								{
									$question[$key][] = $r[array_rand($r,1)];
								}
								else
								{
									$ts = array_rand($r,$t);
									foreach($ts as $tmp)
									{
										$question[$key][] = $r[$tmp];
									}
								}
								$t = 0;
							}
							else
							{
								foreach($r as $tmp)
								$question[$key][] = $tmp;
								$t = $t - count($r);
							}
						}
					}
					$expqr = 0;
					if($qrid)$expqr = $expqr.','.$qrid;
					while($t > 0)
					{
						$expqr = trim($expqr,',');
						if($expqr)
						$qrs = $this->getRandQuestionRowsList(array(array("AND","find_in_set(quest2knows.qkknowsid,:knowsids)",array("AND","questionrows.qrtype = :qrtype",'qrtype',$key),array("AND","NOT find_in_set(questionrows.qrid,:expqr)",'expqr',$expqr),array("AND","questionrows.qrnumber <= :qrnumber",'qrnumber',$t))));
						else
						$qrs = $this->getRandQuestionRowsList(array(array("AND","find_in_set(quest2knows.qkknowsid,:knowsids)",array("AND","questionrows.qrtype = :qrtype",'qrtype',$key),array("AND","questionrows.qrnumber <= :qrnumber",'qrnumber',$t))));
						if(count($qrs))
						{
							$qrid = $qrs[array_rand($qrs,1)];
							$questionrow[$key][] = $qrid;
							if($qrid)
							{
								$qr = $this->exam->getQuestionRowsByArgs(array(array("AND","qrid = :qrid",'qrid',$qrid)));
								if($qr['qrnumber'])
								{
									$t = intval($t - $qr['qrnumber']);
									$expqr = $expqr.','.$qrid;
								}
								else
								break;
							}
						}
						else
						break;
					}
					/**
					if($t >= 0)
					{
						if($expqr)
						$qrs = $this->getRandQuestionRowsList(array(array("AND","find_in_set(quest2knows.qkknowsid,:knowsids)",'knowsids',$knowsids),array("AND","questionrows.qrtype = :qrtype",'qrtype',$key),array("AND","NOT find_in_set(questionrows.qrid,:expqr)",'expqr',$expqr),array("AND","questionrows.qrnumber >= :qrnumber",'qrnumber',$t)));
						if(count($qrs))
						{
							$qrid = $qrs[array_rand($qrs,1)];
							$questionrow[$key][] = $qrid;
							if($qrid)
							{
								$qr = $this->exam->getQuestionRowsByArgs(array(array("AND","qrid = :qrid",'qrid',$qrid)));
								if($qr['qrnumber'])
								{
									$t = intval($t - $qr['qrnumber']);
									$expqr = $expqr.','.$qrid;
								}
							}
						}
					}
					**/
				}
			}
		}
		return array('question'=>$question,'questionrow'=>$questionrow,'setting'=>$exam);
	}

	//筛选随机试题
	public function selectQuestions($examid,$basic)
	{
		$exam = $this->exam->getExamSettingById($examid);
		if($exam['examsetting']['scalemodel'])
		return $this->selectScaleQuestions($examid,$basic);
		$knowsids = '';
		foreach($basic['basicknows'] as $p)
		{
			$knowsids .= trim(implode(',',$p),', ').',';
		}
		$knowsids = trim($knowsids,', ');
		$settings = $exam['examsetting'];
		foreach($settings['questype'] as $key => $p)
		{
			$number = array('1'=>$p['easynumber'],'2'=>$p['middlenumber'],'3'=>$p['hardnumber']);
			arsort($number);
			$par = 0;
			foreach($number as $nkey => $t)
			{
				if(!$par)
				{
					$par++;
					$trand = rand(1,4);
					if($trand < 3)
					{
						$qrs = $this->getRandQuestionRowsList(array(array("AND","find_in_set(quest2knows.qkknowsid,:knowsids)",'knowsids',$knowsids),array("AND","questionrows.qrlevel = :qrlevel",'qrlevel',$nkey),array("AND","questionrows.qrtype = :qrtype",'qrtype',$key),array("AND","questionrows.qrnumber <= :qrnumber",'qrnumber',$t)));
						if(count($qrs))
						{
							$qrid = $qrs[array_rand($qrs,1)];
							$questionrow[$key][] = $qrid;
							$qr = $this->exam->getQuestionRowsByArgs(array(array("AND","qrid = :qrid",'qrid',$qrid)));
							$t = intval($t - $qr['qrnumber']);
						}
					}
				}
				if($t)
				{
					$r = $this->getRandQuestionList(array(array("AND","find_in_set(quest2knows.qkknowsid,:knowsids)",'knowsids',$knowsids),array("AND","questions.questionlevel = :questionlevel",'questionlevel',$nkey),array("AND","questions.questiontype = :questiontype",'questiontype',$key)));
					if(is_array($r))
					{
						if((count($r) >= $t))
						{
							if($t <= 1)
							{
								$question[$key][] = $r[array_rand($r,1)];
							}
							else
							{
								$ts = array_rand($r,$t);
								foreach($ts as $tmp)
								{
									$question[$key][] = $r[$tmp];
								}
							}
							$t = 0;
						}
						else
						{
							foreach($r as $tmp)
							$question[$key][] = $tmp;
							$t = intval($t - count($r));
						}
					}
				}
				$expqr = 0;
				if($qrid)$expqr = $expqr.','.$qrid;
				while($t > 0)
				{
					$expqr = trim($expqr,',');
					if($expqr)
					$qrs = $this->getRandQuestionRowsList(array(array("AND","find_in_set(quest2knows.qkknowsid,:knowsids)",'knowsids',$knowsids),array("AND","questionrows.qrlevel = :qrlevel",'qrlevel',$nkey),array("AND","questionrows.qrtype = :qrtype",'qrtype',$key),array("AND","NOT find_in_set(questionrows.qrid,:expqr)",'expqr',$expqr),array("AND","questionrows.qrnumber <= :qrnumber",'qrnumber',$t)));
					else
					$qrs = $this->getRandQuestionRowsList(array(array("AND","find_in_set(quest2knows.qkknowsid,:knowsids)",'knowsids',$knowsids),array("AND","questionrows.qrlevel = :qrlevel",'qrlevel',$nkey),array("AND","questionrows.qrtype = :qrtype",'qrtype',$key),array("AND","questionrows.qrnumber <= :qrnumber",'qrnumber',$t)));
					if(count($qrs))
					{
						$qrid = $qrs[array_rand($qrs,1)];
						$questionrow[$key][] = $qrid;

						if($qrid)
						{
							$qr = $this->exam->getQuestionRowsByArgs(array(array("AND","qrid = :qrid",'qrid',$qrid)));
							if($qr['qrnumber'])
							{
								$t = intval($t - $qr['qrnumber']);
								$expqr = $expqr.','.$qrid;
							}
							else
							break;
						}
					}
					else
					break;
				}
				/**
				if($t > 0)
				{
					if($expqr)
					$qrs = $this->getRandQuestionRowsList(array(array("AND","find_in_set(quest2knows.qkknowsid,:knowsids)",'knowsids',$knowsids),array("AND","questionrows.qrtype = :qrtype",'qrtype',$key),array("AND","NOT find_in_set(questionrows.qrid,:expqr)",'expqr',$expqr),array("AND","questionrows.qrnumber >= :qrnumber",'qrnumber',$t)));
					if(count($qrs))
					{
						$qrid = $qrs[array_rand($qrs,1)];
						$questionrow[$key][] = $qrid;
						if($qrid)
						{
							$qr = $this->exam->getQuestionRowsByArgs(array(array("AND","qrid = :qrid",'qrid',$qrid)));
							if($qr['qrnumber'])
							{
								$t = intval($t - $qr['qrnumber']);
								$expqr = $expqr.','.$qrid;
							}
						}
					}
				}
				**/
			}
		}
		return array('question'=>$question,'questionrow'=>$questionrow,'setting'=>$exam);
	}

	public function selectQuestionsByKnows($knowsid,$qt)
	{
		$knowsids = $knowsid;
		foreach($qt as $key => $t)
		{
			$qrid = 0;
			$par = 0;
			if(!$par)
			{
				$par++;
				$trand = rand(1,4);
				if($trand < 3)
				{
					$qrs = $this->getRandQuestionRowsList(array(array("AND","find_in_set(quest2knows.qkknowsid,:knowsids)",'knowsids',$knowsids),array("AND","questionrows.qrtype = :qrtype",'qrtype',$key),array("AND","questionrows.qrnumber <= :qrnumber",'qrnumber',$t)));
					if(count($qrs))
					{
						$qrid = $qrs[array_rand($qrs,1)];
						$questionrow[$key][] = $qrid;
						$qr = $this->exam->getQuestionRowsByArgs(array(array("AND","qrid = :qrid",'qrid',$qrid)));
						$t = intval($t - $qr['qrnumber']);
					}
				}
			}
			if($t)
			{
				$r = $this->getRandQuestionList(array(array("AND","find_in_set(quest2knows.qkknowsid,:knowsids)",'knowsids',$knowsids),array("AND","questions.questiontype = :questiontype",'questiontype',$key)));
				if(is_array($r))
				{
					if((count($r) >= $t))
					{
						if($t <= 1)
						{
							$question[$key][] = $r[array_rand($r,1)];
							$t--;
						}
						else
						{
							$ts = array_rand($r,$t);
							foreach($ts as $tmp)
							{
								$question[$key][] = $r[$tmp];
							}
							$t = 0;
						}
					}
					else
					{
						foreach($r as $tmp)
						$question[$key][] = $tmp;
						$t = $t - count($r);
					}
				}
			}
			$expqr = 0;
			if($qrid)$expqr = $expqr.','.$qrid;
			while($t)
			{
				$expqr = trim($expqr,',');
				if($expqr)
				$qrs = $this->getRandQuestionRowsList(array(array("AND","find_in_set(quest2knows.qkknowsid,:knowsids)",'knowsids',$knowsids),array("AND","questionrows.qrtype = :qrtype",'qrtype',$key),array("AND","NOT find_in_set(questionrows.qrid,:expqr)",'expqr',$expqr),array("AND","questionrows.qrnumber <= :qrnumber",'qrnumber',$t)));
				else
				$qrs = $this->getRandQuestionRowsList(array(array("AND","find_in_set(quest2knows.qkknowsid,:knowsids)",'knowsids',$knowsids),array("AND","questionrows.qrtype = :qrtype",'qrtype',$key),array("AND","questionrows.qrnumber <= :qrnumber",'qrnumber',$t)));
				if(count($qrs))
				{
					$qrid = $qrs[array_rand($qrs,1)];
					if($qrid)
					{
						$questionrow[$key][] = $qrid;
						$qr = $this->exam->getQuestionRowsByArgs(array(array("AND","qrid = :qrid",'qrid',$qrid)));
						if($qr['qrnumber'])
						{
							$t = intval($t - $qr['qrnumber']);
							$expqr = $expqr.','.$qrid;
						}
						else
						break;
					}
				}
				else
				break;
			}
			/**
			if($t >= 0)
			{
				if($expqr)
				$qrs = $this->getRandQuestionRowsList(array(array("AND","find_in_set(quest2knows.qkknowsid,:knowsids)",'knowsids',$knowsids),array("AND","questionrows.qrtype = :qrtype",'qrtype',$key),array("AND","NOT find_in_set(questionrows.qrid,:expqr)",'expqr',$expqr),array("AND","questionrows.qrnumber >= :qrnumber",'qrnumber',$t)));
				if(count($qrs))
				{
					$qrid = $qrs[array_rand($qrs,1)];
					$questionrow[$key][] = $qrid;
					if($qrid)
					{
						$qr = $this->exam->getQuestionRowsByArgs(array(array("AND","qrid = :qrid",'qrid',$qrid)));
						if($qr['qrnumber'])
						{
							$t = intval($t - $qr['qrnumber']);
							$expqr = $expqr.','.$qrid;
						}
					}
				}
			}
			**/
		}
		$r = array('question'=>$question,'questionrow'=>$questionrow);
		return $r;
	}
}
?>
