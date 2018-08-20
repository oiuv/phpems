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
		$search = $this->ev->get('search');
		$page = $this->ev->get('page');
		if($search)
		{
			$this->tpl->assign('search',$search);
			foreach($search as $key => $arg)
			{
				$u .= "&search[{$key}]={$arg}";
			}
		}
		$this->tpl->assign('page',$page);
		$this->tpl->assign('u',$u);
		$this->$action();
		exit;
	}

	private function basics()
	{
		$page = $this->ev->get('page');
		$search = $this->ev->get('search');
		$page = $page > 1?$page:1;
		$userid = $this->ev->get('userid');
		$subjects = $this->basic->getSubjectList();
		if(!$search)
		$args = 1;
		else
		$args = array();
		if($search['basicid'])$args[] = array("AND","basicid = :basicid",'basicid',$search['basicid']);
		else
		{
			if($search['keyword'])$args[] = array("AND","basic LIKE :basic",'basic',"%{$search['keyword']}%");
			if($search['basicareaid'])$args[] = array("AND","basicareaid = :basicareaid",'basicareaid',$search['basicareaid']);
			if($search['basicsubjectid'])$args[] = array("AND","basicsubjectid = :basicsubjectid",'basicsubjectid',$search['basicsubjectid']);
			if($search['basicapi'])$args[] = array("AND","basicapi = :basicapi",'basicapi',$search['basicapi']);
		}
		$basics = $this->basic->getBasicList($page,10,$args);
		$areas = $this->area->getAreaList();
		$openbasics = $this->basic->getOpenBasicsByUserid($userid);
		$this->tpl->assign('basics',$basics);
		$this->tpl->assign('openbasics',$openbasics);
		$this->tpl->assign('areas',$areas);
		$this->tpl->assign('subjects',$subjects);
		$this->tpl->assign('basics',$basics);
		$this->tpl->assign('userid',$userid);
		$this->tpl->display('users_basic');
	}

	private function openbasics()
	{
		$basicid = $this->ev->get('basicid');
		$userid = $this->ev->get('userid');
		if($this->basic->getOpenBasicByUseridAndBasicid($userid,$basicid))
		{
			$message = array(
				'statusCode' => 300,
				"message" => "您已经开通了本考场"
			);
		}
		else
		{
			$this->basic->openBasic(array('obuserid'=>$userid,'obbasicid'=>$basicid,'obendtime' => TIME + 30*24*3600));
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
				"callbackType" => "forward",
			    "forwardUrl" => "index.php?exam-master-users-basics&userid={$userid}{$u}"
			);
		}
		$this->G->R($message);
	}

	private function closebasics()
	{
		$basicid = $this->ev->get('basicid');
		$userid = $this->ev->get('userid');
		$ob = $this->basic->getOpenBasicByUseridAndBasicid($userid,$basicid);
		$this->basic->delOpenBasic($ob['obid']);
		$message = array(
			'statusCode' => 200,
			"message" => "操作成功",
			"callbackType" => "forward",
		    "forwardUrl" => "reload"
		);
		$this->G->R($message);
	}

	private function batopen()
	{
		if($this->ev->get('batopen'))
		{
			$userids = $this->ev->get('userids');
			$usernames = $this->ev->get('usernames');
			$usergroupids = $this->ev->get('usergroupids');
			$basics = $this->ev->get('basics');
			$days = $this->ev->get('days');
			if($userids && $basics && $days)
			{
				$userids = explode(",",$userids);
				$basics = explode(",",$basics);
				foreach($userids as $userid)
				{
					foreach($basics as $basicid)
					{
						$this->basic->openBasic(array('obuserid'=>$userid,'obbasicid'=>$basicid,'obendtime' => TIME + $days*24*3600));
					}
				}
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功"
				);
			}
			elseif($usernames && $basics && $days)
			{
				$usernames = implode(",",array_unique(explode(",",$usernames)));
				$basics = explode(",",$basics);
				$userids = $this->user->getUsersByArgs(array(array("AND","find_in_set(username,:username)",'username',$usernames),array("AND","user.usergroupid = user_group.groupid")),false,false,false);
				foreach($userids as $user)
				{
					foreach($basics as $basicid)
					{
						$this->basic->openBasic(array('obuserid'=>$user['userid'],'obbasicid'=>$basicid,'obendtime' => TIME + $days*24*3600));
					}
				}
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功"
				);
			}
			elseif($usergroupids && $basics && $days)
			{
				$usergroupids = implode(",",array_unique(explode(",",$usergroupids)));
				$basics = explode(",",$basics);
				$userids = $this->user->getUsersByArgs(array(array("AND","find_in_set(usergroupid,:usergroupid)",'usergroupid',$usergroupids),array("AND","user.usergroupid = user_group.groupid")),false,false,false);
				foreach($userids as $user)
				{
					foreach($basics as $basicid)
					{
						$this->basic->openBasic(array('obuserid'=>$user['userid'],'obbasicid'=>$basicid,'obendtime' => TIME + $days*24*3600));
					}
				}
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功"
				);
			}
			else
			{
				$message = array(
					'statusCode' => 300,
					"message" => "参数错误"
				);
			}
			$this->G->R($message);
		}
		else
		{
			$basicid = $this->ev->get('basicid');
			$this->tpl->assign('basicid',$basicid);
			$this->tpl->display('user_batopen');
		}
	}

	private function index()
	{
		$page = $this->ev->get('page')?$this->ev->get('page'):1;
		$search = $this->ev->get('search');
		$u = '';
		if($search)
		{
			foreach($search as $key => $arg)
			{
				$u .= "&search[{$key}]={$arg}";
			}
			$args = array();
		}
		else $args = 1;
		if($search['userid'])
		$args[] = array("AND","userid = :userid",'userid',$search['userid']);
		elseif($search['groupid'] || $search['username'])
		{
			$args = array();
			if($search['groupid'])
			$args[] = array("AND","usergroupid = :usergroupid",'usergroupid',$search['groupid']);
			if($search['username'])
			$args[] = array("AND","username LIKE :username",'username',"%{$search['username']}%");
		}
		$users = $this->user->getUserList($page,10,$args);
		$groups = $this->user->getUserGroups();
		$this->tpl->assign('groups',$groups);
		$this->tpl->assign('users',$users);
		$this->tpl->display('user');
	}
}


?>
