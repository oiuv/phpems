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
		if($this->ev->get('userlogin'))
		{
			$args = $this->ev->get('args');
			$randcode = strtoupper($this->ev->get('randcode'));
			$_user = $this->session->getSessionValue();
			if($randcode && ($randcode == $_user['sessionrandcode']))
			{
				$this->session->setRandCode(0);
				$user = $this->user->getUserByUserName($args['username']);
				if($user['userid'])
				{
					if($user['userpassword'] == md5($args['userpassword']))
					{
						$group = $this->user->getGroupById($user['groupid']);
						if($group['groupmoduleid'] != 1)
						{
							exit(json_encode(array(
								'statusCode' => 300,
								"message" => "您无权进入后台",
							    "callbackType" => 'forward',
							    "forwardUrl" => "index.php?core-master-login"
							)));
						}
						else
						{
							$this->session->setSessionUser(array('sessionuserid'=>$user['userid'],'sessionpassword'=>$user['userpassword'],'sessionip'=>$this->ev->getClientIp(),'sessiongroupid'=>$user['usergroupid'],'sessionlogintime'=>TIME,'sessionusername'=>$user['username']));
							$message = array(
								'statusCode' => 200,
								"message" => "操作成功，正在转入目标页面",
							    "callbackType" => 'forward',
							    "forwardUrl" => "index.php?core-master"
							);
							exit(json_encode($message));
						}
					}
					else
					{
						$message = array(
							"statusCode" => 300,
							"message" => "操作失败，您的用户名或者密码错误！"
						);
						exit(json_encode($message));
					}
				}
			}
			$message = array(
				"statusCode" => 300,
				"message" => "操作失败，验证码错误！".$_user['sessionrandcode']
			);
			exit(json_encode($message));
		}
		else
		{
			$this->tpl->display('login');
		}
	}
}


?>
