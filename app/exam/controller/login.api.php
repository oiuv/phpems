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
		$this->sc = 'JOAa4HeKdq52b7jJZYXo';//密钥，需修改双方一致
		$sign = $this->ev->get('sign');
		$userid = $this->ev->get('userid');
		$username = $this->ev->get('username');
		$useremail = $this->ev->get('useremail');
		$ts = $this->ev->get('ts');
		if($this->ev->get('checkyes'))
		{
			$rand =rand(1,6);
			if($rand == 5)
			{
				$this->session->clearOutTimeUser();
				$this->exam->clearOutTimeExamSession();
			}
			if(TIME - $ts < 300)
			{
				if($sign == md5($userid.$username.$useremail.$this->sc.$ts))
				{
					$user = $this->G->make('user','user');
					$u = $user->getUserByUserName($username);
					if(!$u)
					{
						$defaultgroup = $this->user->getDefaultGroup();
						$pass = md5(rand(1000,9999));
						$id = $this->user->insertUser(array('username' => $username,'usergroupid' => $defaultgroup['groupid'],'userpassword' => md5($pass),'useremail' => $useremail));
						$this->session->setSessionUser(array('sessionuserid'=>$id,'sessionpassword'=>md5($pass),'sessionip'=>$this->ev->getClientIp(),'sessiongroupid'=>$defaultgroup,'sessionlogintime'=>TIME,'sessionusername'=>$username));
					}
					else
					{
						$args = array('sessionuserid'=>$u['userid'],'sessionpassword'=>$u['userpassword'],'sessionip'=>$this->ev->getClientIp(),'sessiongroupid'=>$u['usergroupid'],'sessionlogintime'=>TIME,'sessionusername'=>$u['username']);
						$this->session->setSessionUser($args);
					}
					header("location:".'index.php?'.$this->G->app.'-app');
				}
				else
				header("location:".'index.php?exam');//更改为验证失败后要跳转的地址
			}
			else
			header("location:".'index.php?exam');//更改为超时失败后要跳转的地址
		}
		else header("location:".'index.php?exam-api-login&checkyes=1&sign='.$sign.'&userid='.$userid.'&username='.$username.'&useremail='.$useremail.'&ts='.$ts);
		exit();
	}
}


?>
