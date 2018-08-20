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
		if($this->_user['sessionuserid'])
		{
			header("location:index.php?exam-phone");
			exit;
		}
		$appid = 'user';
		$app = $this->G->make('apps','core')->getApp($appid);
		$this->tpl->assign('app',$app);
		if($this->ev->get('userlogin'))
		{
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
			$user = $this->user->getUserByUserName($args['username']);
			if($user['userid'])
			{
				if($user['userpassword'] == md5($args['userpassword']))
				{
					if($app['appsetting']['loginmodel'] == 1)
					$this->session->offOnlineUser($user['userid']);
					if(!$user['useropenid'] && $_SESSION['openid'] && USEWX)
					{
						$this->user->modifyUserInfo(array('useropenid' => $_SESSION['openid']),$user['userid']);
					}
					$this->session->setSessionUser(array('sessionuserid'=>$user['userid'],'sessionpassword'=>$user['userpassword'],'sessionip'=>$this->ev->getClientIp(),'sessiongroupid'=>$user['usergroupid'],'sessionlogintime'=>TIME,'sessionusername'=>$user['username']));
					$message = array(
						'statusCode' => 201,
						"message" => "操作成功",
					    "callbackType" => 'forward',
					    "forwardUrl" => "index.php?content-phone"
					);
					if($this->ev->get('userhash'))
					exit(json_encode($message));
					else
					exit(header("location:{$message['forwardUrl']}"));
				}
				else
				{
					$message = array(
						'statusCode' => 300,
						'errorinput' => 'args[username]',
						"message" => "操作失败"
					);
					exit(json_encode($message));
				}
			}
			else
			{
				$message = array(
					'statusCode' => 300,
					'errorinput' => 'args[username]',
					"message" => "操作失败"
				);
				exit(json_encode($message));
			}
		}
		else
		{
			$this->tpl->display('login');
		}
	}
}


?>
