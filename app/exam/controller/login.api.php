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

	private function coin()
	{
		$this->sc = 'exam@phpems.net';//密钥，需修改双方一致
		$sign = $this->ev->get('sign');
		$username = $this->ev->get('username');
		$action = $this->ev->get('action');
		$number = $this->ev->get('number');
		$ts = $this->ev->get('ts');
		if(TIME - $ts <= 5)
		{
			if($sign == md5($username.$action.$number.$this->sc.$ts))
			{
				$this->user = $this->G->make('user','user');
				if($action == 'add')
				{
					$user = $this->user->getUserByUserName($username);
					if($user)
					{
						$coin = $user['usercoin'] + intval($number);
						$this->user->modifyUserInfo(array('usercoin' => $coin),$user['userid']);
						exit(json_encode(array('status' => 200,'msg' => '操作成功')));
					}
					else
					exit(json_encode(array('status' => 300,'msg' => '错误的用户')));
				}
				elseif($action == 'remove')
				{
					$user = $this->user->getUserByUserName($username);
					if($user)
					{
						$coin = $user['usercoin'] - intval($number);
						if($coin > 0)
						{
							$this->user->modifyUserInfo(array('usercoin' => $coin),$user['userid']);
							exit(json_encode(array('status' => 200,'msg' => '操作成功')));
						}
						else
						exit(json_encode(array('status' => 301,'msg' => '余额不足，扣除失败')));
					}
					else
					exit(json_encode(array('status' => 300,'msg' => '错误的用户')));
				}
				else
				exit(json_encode(array('status' => 300,'msg' => '错误的操作指令')));
			}
			else
			exit(json_encode(array('status' => 300,'msg' => '签名验证错误')));
		}
		else
		exit(json_encode(array('status' => 300,'msg' => '超时错误')));
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
			if(TIME - $ts < 1600)
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
				exit('cc');
				//header("location:".'index.php?exam');//更改为验证失败后要跳转的地址
			}
			else
			exit('dd');
			//header("location:".'index.php?exam');//更改为超时失败后要跳转的地址
		}
		else header("location:".'index.php?exam-api-login&checkyes=1&sign='.$sign.'&userid='.$userid.'&username='.$username.'&useremail='.$useremail.'&ts='.$ts);
		exit(0);
	}
}


?>
