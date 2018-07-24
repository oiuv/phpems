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
		$this->user = $this->G->make('user','user');
		$this->_user = $_user = $this->session->getSessionUser();
		$group = $this->user->getGroupById($_user['sessiongroupid']);
		if($group['groupmoduleid'] != 1)
		{
			if($this->ev->get('userhash'))
			exit(json_encode(array(
				'statusCode' => 301,
				"message" => "请您重新登录",
			    "callbackType" => 'forward',
			    "forwardUrl" => "index.php?core-master-login"
			)));
			else
			{
				header("location:?core-master-login");
				exit;
			}
		}
		//生产一个对象
		$this->tpl = $this->G->make('tpl');
		$this->pdosql = $this->G->make('pdosql');
		$this->sql = $this->G->make('sql');
		$this->db = $this->G->make('pepdo');
		$this->pg = $this->G->make('pg');
		$this->html = $this->G->make('html');
		$this->files = $this->G->make('files');
		$this->apps = $this->G->make('apps','core');
		$this->ce = $this->G->make('ce','certificate');
		$user = $this->user->getUserById($_user['sessionuserid']);
		$user['manager_apps'] = unserialize($user['manager_apps']);
		$this->tpl->assign('_user',$user);
		$localapps = $this->apps->getLocalAppList();
		$apps = $this->apps->getAppList();
		$this->tpl->assign('localapps',$localapps);
		$this->tpl->assign('apps',$apps);
		if(!in_array($this->G->app,$user['manager_apps']) && $apps['user']['appsetting']['managemodel'])
		{
			header("location:index.php?core-master");
			exit();
		}
		$this->tpl->assign('userhash',$this->ev->get('userhash'));
	}
}

?>