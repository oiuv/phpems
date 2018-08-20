<?php

class app
{
	public $G;

	//初始化信息
	public function __construct(&$G)
	{
	    $this->G = $G;
		$this->ev = $this->G->make('ev');
		$this->session = $this->G->make('session');
		$this->files = $this->G->make('files');
		$this->user = $this->G->make('user','user');
		$_user = $this->session->getSessionUser();

		$this->_user = $this->user->getUserById($_user['sessionuserid']);
		$this->_user['teacher_subjects'] = unserialize($this->_user['teacher_subjects']);
		$group = $this->user->getGroupById($_user['sessiongroupid']);
		if(!$this->_user['teacher_subjects'])
		{
			if($this->ev->get('userhash'))
			exit(json_encode(array(
				'statusCode' => 300,
				"message" => "您不具备管理权限",
			    "callbackType" => 'forward',
			    "forwardUrl" => "index.php"
			)));
			else
			{
				header("location:index.php");
				exit;
			}
		}
		//生产一个对象
		$this->teachsubjects = implode(',',$this->_user['teacher_subjects']);
		$this->tpl = $this->G->make('tpl');
		$this->db = $this->G->make('pepdo');
        $this->module = $this->G->make('module');
        $modules = $this->module->getModulesByApp('course');
		$this->pg = $this->G->make('pg');
		$this->html = $this->G->make('html');
		$this->apps = $this->G->make('apps','core');
        $this->basic = $this->G->make('basic','exam');
        $this->subjects = $this->basic->getSubjectList(array(array("AND","find_in_set(subjectid,:subjectid)","subjectid",$this->teachsubjects)));
        $this->tpl->assign('subjects',$this->subjects);
		$this->tpl->assign('_user',$this->_user);
		$this->tpl->assign('userhash',$this->ev->get('userhash'));
		$apps = $this->apps->getAppList();
		$this->tpl->assign('apps',$apps);
        $groups = $this->user->getUserGroups();
        $this->tpl->assign('groups',$groups);
        $this->category = $this->G->make('category');
        $this->content = $this->G->make('content','course');
        $this->course = $this->G->make('course','course');
	}
}

?>