<?php

class app
{
	public $G;

	public function __construct(&$G)
	{
		$this->G = $G;
		$this->ev = $this->G->make('ev');
		$this->tpl = $this->G->make('tpl');
		$this->sql = $this->G->make('sql');
		$this->pdosql = $this->G->make('pdosql');
		$this->db = $this->G->make('pepdo');
		$this->pg = $this->G->make('pg');
		$this->module = $this->G->make('module');
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
			    "forwardUrl" => "index.php?user-center"
			)));
			else
			{
				header("location:index.php?user-center");
				exit;
			}
		}
	}

	public function index()
	{
		$this->login();
	}

	public function login()
	{
		if($this->ev->get('userlogin'))
		{
			include './api/config.inc.php';
			include './api/uc_client/client.php';
			$args = $this->ev->get('args');
			list($uid, $username, $password, $email) = $muser = uc_user_login($args['username'], $args['userpassword']);
			if(!$email)$email = $username.'@phpems.net';
			if($uid > 0)
			{
				$ucsynlogin = uc_user_synlogin($uid);
				$ucsynlogins = explode("src=\"",$ucsynlogin);
				$ucsynlogin = array();
				foreach($ucsynlogins as $key => $p)
				{
					if($key)
					{
						$n = explode("\"",$p);
						$ucsynlogin[] = $n[0];
					}
				}
			}
			else
			{
				$message = array(
					'statusCode' => 300,
					'errorinput' => 'args[username]',
					"message" => "登录失败"
				);
				exit(json_encode($message));
			}
			/**
			exit;
			$tmp = $this->session->getSessionValue();
			if(TIME - $tmp['sessionlasttime'] < 1)
			{
				$message = array(
					'statusCode' => 300,
					"message" => "操作失败"
				);
				exit(json_encode($message));
			}
			$args = $this->ev->get('args');
			**/
			$user = $this->user->getUserByUserName($username);
			if($user['userid'])
			{
					$this->session->setSessionUser(array('sessionuserid'=>$user['userid'],'sessionpassword'=>$user['userpassword'],'sessionip'=>$this->ev->getClientIp(),'sessiongroupid'=>$user['usergroupid'],'sessionlogintime'=>TIME,'sessionusername'=>$user['username']));
					$message = array(
						'statusCode' => 201,
						"message" => "操作成功",
						"loadJs" => $ucsynlogin,
					    "callbackType" => 'forward',
					    "forwardUrl" => "index.php?".$this->G->defaultApp
					);
					$this->G->R($message);
			}
			else
			{
				$defaultgroup = $this->user->getDefaultGroup();
				$id = $this->user->insertUser(array('username' => $username,'usergroupid' => $defaultgroup['groupid'],'userpassword' => md5($password),'useremail' => $email));
				$this->session->setSessionUser(array('sessionuserid'=>$id,'sessionpassword'=>md5($password),'sessionip'=>$this->ev->getClientIp(),'sessiongroupid'=>$defaultgroup['groupid'],'sessionlogintime'=>TIME,'sessionusername'=>$username));
				$message = array(
					'statusCode' => 201,
					"message" => "操作成功",
					"loadJs" => $ucsynlogin,
					"callbackType" => 'forward',
					"forwardUrl" => "index.php?".$this->G->defaultApp
				);
				$this->G->R($message);
			}
		}
		else
		{
			$this->tpl->display('login');
		}
	}

	public function register()
	{
		if($this->ev->get('userregister'))
		{
			include './api/config.inc.php';
			include './api/uc_client/client.php';
			$args = $this->ev->get('args');
			$uid = uc_user_register($args['username'], $args['userpassword'], $args['useremail']);
			if($uid <= 0) {
				if($uid == -1) {
					$msg = '用户名不合法';
				} elseif($uid == -2) {
					$msg = '包含要允许注册的词语';
				} elseif($uid == -3) {
					$msg = '用户名已经存在';
				} elseif($uid == -4) {
					$msg = 'Email 格式有误';
				} elseif($uid == -5) {
					$msg = 'Email 不允许注册';
				} elseif($uid == -6) {
					$msg = '该 Email 已经被注册';
				} else {
					$msg = '未定义';
				}
				$message = array(
					'statusCode' => 300,
					"message" => $msg
				);
				exit(json_encode($message));
			} else {
				$username = $args['username'];
			}
			$defaultgroup = $this->user->getDefaultGroup();
			$user = $this->user->getUserByUserName($username);
			if(!$user)
			{
				$email = $args['useremail'];
				$user = $this->user->getUserByEmail($email);
				if(!$user)
				{
					$id = $this->user->insertUser(array('username' => $username,'usergroupid' => $defaultgroup['groupid'],'userpassword' => md5($args['userpassword']),'useremail' => $email));
					$this->session->setSessionUser(array('sessionuserid'=>$id,'sessionpassword'=>md5($args['userpassword']),'sessionip'=>$this->ev->getClientIp(),'sessiongroupid'=>$defaultgroup['groupid'],'sessionlogintime'=>TIME,'sessionusername'=>$username));
				}
			}
			$ucsynlogin = uc_user_synlogin($uid);
			$ucsynlogins = explode("src=\"",$ucsynlogin);
			$ucsynlogin = array();
			foreach($ucsynlogins as $key => $p)
			{
				if($key)
				{
					$n = explode("\"",$p);
					$ucsynlogin[] = $n[0];
				}
			}
			$message = array(
				'statusCode' => 201,
				"message" => "操作成功",
				"loadJs" => $ucsynlogin,
			    "callbackType" => 'forward',
			    "forwardUrl" => "index.php?".$this->G->defaultApp
			);
			exit(json_encode($message));
		}
		else
		{
			$this->tpl->display('register');
		}
	}

	public function logout()
	{
		include './api/config.inc.php';
		include './api/uc_client/client.php';
		$this->session->clearSessionUser();
		$ucsynlogout = uc_user_synlogout();
		$ucsynlogins = explode("src=\"",$ucsynlogout);
		$ucsynlogin = array();
		foreach($ucsynlogins as $key => $p)
		{
			if($key)
			{
				$n = explode("\"",$p);
				$ucsynlogin[] = $n[0];
			}

		}
		$message = array(
			'statusCode' => 201,
			"message" => "操作成功",
			"loadJs" => $ucsynlogin,
			"callbackType" => 'forward',
			"forwardUrl" => "index.php?".$this->G->defaultApp
		);
		$this->G->R($message);
		//header("location:index.php");
		exit;
	}
}

?>