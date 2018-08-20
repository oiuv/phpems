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
		$page = $this->ev->get('page');
		$search = $this->ev->get('search');
		$u = '';
		if($search)
		{
			$this->tpl->assign('search',$search);
			foreach($search as $key => $arg)
			{
				$u .= "&search[{$key}]={$arg}";
			}
		}
		if($this->ev->get('modifyuserinfo'))
		{
			$args = $this->ev->get('args');
			$userid = $this->_user['sessionuserid'];
			$group = $this->user->getGroupById($this->_user['sessiongroupid']);
			$args = $this->module->tidyNeedFieldsPars($args,$group['groupmoduleid'],array('iscurrentuser'=> 1));
			$id = $this->user->modifyUserInfo($args,$userid);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => 'forward',
			    "forwardUrl" => "index.php?user-center-privatement"
			);
			exit(json_encode($message));
		}
		elseif($this->ev->get('modifyuserpassword'))
		{
			$args = $this->ev->get('args');
			$oldpassword = $this->ev->get('oldpassword');
			$userid = $this->_user['sessionuserid'];
			$user = $this->user->getUserById($userid);
			if(md5($oldpassword) != $user['userpassword'])
			{
				$message = array(
					'statusCode' => 300,
					"message" => "操作失败，原密码验证失败"
				);
				exit(json_encode($message));
			}
			if($args['password'] == $args['password2'] && $userid)
			{
				$id = $this->user->modifyUserPassword($args,$userid);
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功",
				    "callbackType" => 'forward',
				    "forwardUrl" => "index.php?user-center-privatement&page={$page}{$u}"
				);
				exit(json_encode($message));
			}
			else
			{
				$message = array(
					'statusCode' => 300,
					"message" => "操作失败"
				);
				exit(json_encode($message));
			}
		}
		else
		{
			$userid = $this->_user['sessionuserid'];
			$user = $this->user->getUserById($userid);
			$group = $this->user->getGroupById($user['usergroupid']);
			$fields = $this->module->getMoudleFields($group['groupmoduleid'],array('iscurrentuser'=> $userid == $this->_user['sessionuserid'],'group' => null));
			$forms = $this->html->buildHtml($fields,$user);
			$actors = $this->user->getGroupsByModuleid($group['groupmoduleid']);
			$this->tpl->assign('moduleid',$group['groupmoduleid']);
			$this->tpl->assign('fields',$fields);
			$this->tpl->assign('forms',$forms);
			$this->tpl->assign('actors',$actors);
			$this->tpl->assign('user',$user);
			$this->tpl->assign('page',$page);
			$this->tpl->display('modifyuser');
		}
	}
}


?>
