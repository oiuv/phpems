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

	private function index()
	{
		$appid = 'user';
		$app = $this->G->make('apps','core')->getApp($appid);
		$this->tpl->assign('app',$app);
		$fields = array();
		$tpfields = explode(',',$app['appsetting']['regfields']);
		foreach($tpfields as $f)
		{
			$tf = $this->module->getFieldByNameAndModuleid($f);
			if($tf && $tf['fieldappid'] == 'user')
			{
				$fields[$tf['fieldid']] = $tf;
			}
		}
		if($this->ev->get('userregister'))
		{
			if($app['appsetting']['closeregist'])
			{
				$message = array(
					'statusCode' => 300,
					"message" => "管理员禁止了用户注册"
				);
				$this->G->R($message);
			}
			$fob = array('admin','管理员','站长');
			$args = $this->ev->get('args');
			$defaultgroup = $this->user->getDefaultGroup();
			if(!$defaultgroup['groupid'] || !trim($args['username']))
			{
				$message = array(
					'statusCode' => 300,
					"message" => "用户不能注册"
				);
				exit(json_encode($message));
			}
            if($app['appsetting']['emailverify'])
            {
                $randcode = $this->ev->get('randcode');
                if((!$randcode) || ($randcode != $_SESSION['phonerandcode']['reg']))
                {
                    $message = array(
                        'statusCode' => 300,
                        "message" => "验证码错误"
                    );
                    exit(json_encode($message));
                }
                else
                {
                    $_SESSION['phonerandcode']['reg'] = 0;
                }
            }
			$username = $args['username'];
			foreach($fob as $f)
			{
				if(strpos($username,$f) !== false)
				{
					$message = array(
						'statusCode' => 300,
						'errorinput' => 'args[username]',
						"message" => "用户已经存在"
					);
					exit(json_encode($message));
				}
			}
			$user = $this->user->getUserByUserName($username);
			if($user)
			{
				$message = array(
					'statusCode' => 300,
					'errorinput' => 'args[username]',
					"message" => "用户已经存在"
				);
				exit(json_encode($message));
			}
			$email = $args['useremail'];
			$user = $this->user->getUserByEmail($email);
			if($user)
			{
				$message = array(
					'statusCode' => 300,
					'errorinput' => 'args[username]',
					"message" => "邮箱已经被注册"
				);
				exit(json_encode($message));
			}
			$fargs = array('username' => $username,'usergroupid' => $defaultgroup['groupid'],'userpassword' => md5($args['userpassword']),'useremail' => $email);
			foreach($fields as $key => $p)
			{
				$fargs[$p['field']] = $args[$p['field']];
			}
			$id = $this->user->insertUser($fargs);
			$this->session->setSessionUser(array('sessionuserid'=>$id,'sessionpassword'=>md5($args['userpassword']),'sessionip'=>$this->ev->getClientIp(),'sessiongroupid'=>$defaultgroup['groupid'],'sessionlogintime'=>TIME,'sessionusername'=>$username));
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => 'forward',
			    "forwardUrl" => "index.php?exam-phone"
			);
			exit(json_encode($message));
		}
		else
		{
			$forms = $this->html->buildHtml($fields);
			$this->tpl->assign('forms',$forms);
			$this->tpl->display('register');
		}
	}
}


?>
