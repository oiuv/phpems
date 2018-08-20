<?php

class app
{
	public $G;
	public $data = array();
	public $sessionvars;

	public function __construct(&$G)
	{
		$this->G = $G;
		$this->ev = $this->G->make('ev');
		$this->tpl = $this->G->make('tpl');
		$this->sql = $this->G->make('sql');
		$this->pdosql = $this->G->make('pdosql');
		$this->db = $this->G->make('pepdo');
		$this->pg = $this->G->make('pg');
		$this->html = $this->G->make('html');
		$this->session = $this->G->make('session');
		$this->_user = $this->session->getSessionUser();
		if(!$this->_user['sessionuserid'])
		{
			if($this->ev->get('userhash'))
			exit(json_encode(array(
				'statusCode' => 301,
				"message" => "请您重新登录",
			    "callbackType" => 'forward',
			    "forwardUrl" => "index.php?user-app-login"
			)));
			else
			{
				header("location:index.php?user-app-login");
				exit;
			}
		}
		$this->user = $this->G->make('user','user');
		$this->exam = $this->G->make('exam','exam');
		$this->basic = $this->G->make('basic','exam');
		$this->section = $this->G->make('section','exam');
		$this->question = $this->G->make('question','exam');
		$this->favor = $this->G->make('favor','exam');
		$this->sessionvars = $this->exam->getExamSessionBySessionid();
		$this->questypes = $this->basic->getQuestypeList();
		$this->subjects = $this->basic->getSubjectList();
		$openbasics = trim($this->sessionvars['examsessionopenbasics']," ,");
		$this->data['openbasics'] = $this->basic->getBasicsByApi($openbasics);
		if(!$this->data['openbasics'])$this->data['openbasics'] = $this->basic->getOpenBasicsByUserid($this->_user['sessionuserid']);
		//if(!$this->data['openbasics'])$this->data['openbasics'] = $this->basic->getBasicsByArgs(array(array("AND","basicdemo = '1'")));
		if(!$this->_user['sessioncurrent'] || !$this->data['openbasics'][$this->_user['sessioncurrent']])
		{
			$this->data['currentbasic'] = current($this->data['openbasics']);
			$this->_user['sessioncurrent'] = $this->data['currentbasic']['basicid'];
			$this->session->setSessionValue(array('sessioncurrent'=>$this->_user['sessioncurrent']));
		}
		else
		$this->data['currentbasic'] = $this->data['openbasics'][$this->_user['sessioncurrent']];
		$this->selectorder = array('A','B','C','D','E','F','G','H','I','J','K','L','M','N');
		$this->tpl->assign('ols',array(1=>'一','二','三','四','五','六','七','八','九','十','十一','十二','十三','十四','十五','十六','十七','十八','十九','二十'));
		$this->tpl->assign('selectorder',$this->selectorder);
		//$this->tpl->assign('data',&$this->data);
		$this->tpl->assign('data',$this->data);
		$this->tpl->assign('questypes',$this->questypes);
		$this->tpl->assign('subjects',$this->subjects);
		$this->tpl->assign('globalsections',$this->section->getSectionListByArgs(array(array("AND","sectionsubjectid = :sectionsubjectid",'sectionsubjectid',$this->data['currentbasic']['basicsubjectid']))));
		$this->tpl->assign('globalknows',$this->section->getAllKnowsBySubject($this->data['currentbasic']['basicsubjectid']));
		$this->tpl->assign('_user',$this->user->getUserById($this->_user['sessionuserid']));
		$this->tpl->assign('userhash',$this->ev->get('userhash'));
		if($this->data['currentbasic']['basicexam']['model'] == 2)
		{
			if($this->ev->url('2') && !in_array($this->ev->url('2'),array('index','basics','exam','recover')))
			{
				header("location:index.php?exam-app-exam");
				exit;
			}
		}
	}
}

?>