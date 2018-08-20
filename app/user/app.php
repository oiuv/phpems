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
		$this->pesql = $this->G->make('pdosql');
		$this->db = $this->G->make('pepdo');
		$this->pg = $this->G->make('pg');
		$this->module = $this->G->make('module');
		$this->html = $this->G->make('html');
		$this->session = $this->G->make('session');
		$this->user = $this->G->make('user','user');
		$groups = $this->user->getUserGroups();
		$this->tpl->assign('groups',$groups);
		$this->tpl->assign('userhash',$this->ev->get('userhash'));
		$this->_user = $_user = $this->session->getSessionUser();
		if($_user['sessionuserid'] && $this->ev->url(2)!= 'logout')
		{
			if($this->ev->get('userhash'))
			exit(json_encode(array(
				'statusCode' => 200,
				"message" => "您已经登录",
			    "callbackType" => 'forward',
			    "forwardUrl" => "index.php?".$this->G->defaultApp
			)));
			else
			{
				header("location:index.php?".$this->G->defaultApp);
				exit;
			}
		}
	}
}

?>