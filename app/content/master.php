<?php

class app
{
	public $G;

	public function __construct(&$G)
	{
		$this->G = $G;
		$this->G = $G;
		$this->ev = $this->G->make('ev');
		$this->session = $this->G->make('session');
		$this->tpl = $this->G->make('tpl');
		$this->sql = $this->G->make('sql');
		$this->pdosql = $this->G->make('pdosql');
		$this->db = $this->G->make('pdodb');
		$this->category = $this->G->make('category');
		$this->html = $this->G->make('html');
		$this->module = $this->G->make('module');
		$this->apps = $this->G->make('apps','core');
		$this->user = $this->G->make('user','user');
		$this->_user = $_user = $this->session->getSessionUser();
		$group = $this->user->getGroupById($_user['sessiongroupid']);
		if($group['groupid'] != 1)
		{
			if($this->ev->get('userhash'))
			exit(json_encode(array(
				'statusCode' => 300,
				"message" => "请您重新登录",
			    "callbackType" => 'forward',
			    "forwardUrl" => "index.php?core-master-login"
			)));
			else
			{
				header("location:index.php?core-master-login");
				exit;
			}
		}
		$localapps = $this->apps->getLocalAppList();
		$apps = $this->apps->getAppList();
		$this->tpl->assign('localapps',$localapps);
		$this->tpl->assign('apps',$apps);
		$modules = $this->module->getModulesByApp('content');
		$groups = $this->user->getUserGroups();
		$user = $this->user->getUserById($_user['sessionuserid']);
		$user['manager_apps'] = unserialize($user['manager_apps']);
		$this->tpl->assign('_user',$user);
		if(!in_array($this->G->app,$user['manager_apps']) && $apps['user']['appsetting']['managemodel'])
		{
			header("location:index.php?core-master");
			exit();
		}
		$this->tpl->assign('modules',$modules);
		$this->tpl->assign('groups',$groups);
		$this->tpl->assign('userhash',$this->ev->get('userhash'));
		$this->content = $this->G->make('content','content');
		$this->block = $this->G->make('block','content');
		$this->position = $this->G->make('position','content');
	}
}

?>