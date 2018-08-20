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

	private function selectactor()
	{
		$groupid = $this->ev->get('groupid');
		$group = $this->user->getGroupById($groupid);
		if($group)
		{
			$this->user->selectDefaultActor($groupid);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
				"callbackType" => "forward",
			    "forwardUrl" => "reload"
			);
		}
		else
		$message = array(
			'statusCode' => 300,
			"message" => "操作失败，存在同名角色！"
		);
		exit(json_encode($message));
	}

	private function modifyactor()
	{
		$page = $this->ev->get('page');
		if($this->ev->get('modifyactor'))
		{
			$groupid = $this->ev->get('groupid');
			$args = $this->ev->get('args');
			$r = $this->user->modifyActor($groupid,$args);
			if($r)
			{
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功",
					"callbackType" => "forward",
				    "forwardUrl" => "index.php?user-master-actor"
				);
			}
			else
			{
				$message = array(
					'statusCode' => 300,
					"message" => "操作失败，存在同名角色！",
				    "callbackType" => ''
				);
			}
			exit(json_encode($message));
		}
		else
		{
			$groupid = $this->ev->get('groupid');
			$group = $this->user->getGroupById($groupid);
			$this->tpl->assign('group',$group);
			$this->tpl->display('modifyactor');
		}
	}

	private function delactor()
	{
		$page = intval($this->ev->get('page'));
		$groupid = $this->ev->get('groupid');
		$r = $this->user->delActorById($groupid);
		if($r)
		{
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
				"callbackType" => "forward",
				"forwardUrl" => "index.php?user-master-actor&page={$page}"
			);
		}
		else
		{
			$message = array(
				'statusCode' => 300,
				"message" => "操作失败，该角色下存在用户，请删除所有用户后再删除本角色"
			);
		}
		exit(json_encode($message));
	}

	private function add()
	{
		if($this->ev->post('insertactor'))
		{
			$args = $this->ev->post('args');
			$id = $this->user->insertActor($args);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
				"callbackType" => "forward",
				"forwardUrl" => "index.php?user-master-actor&moduleid={$args['groupmoduleid']}"
			);
			exit(json_encode($message));
		}
		else
		{
			$this->tpl->display('addactor');
		}
	}

	private function index()
	{
		$search = $this->ev->post('search');
		$args = 1;
		$page = $this->ev->get('page');
		$page = $page>1?$page:1;
		if($search['groupmoduleid'])
		{
			$args = array(array('AND',"groupmoduleid = :groupmoduleid",'groupmoduleid',$search['groupmoduleid']));
		}
		$actors = $this->user->getUserGroupList($args,10,$page);
		$this->tpl->assign('page',$page);
		$this->tpl->assign('actors',$actors);
		$this->tpl->display('actor');
	}
}


?>
