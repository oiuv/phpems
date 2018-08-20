<?php

class user_user
{
	public $G;

	public function __construct(&$G)
	{
		$this->G = $G;
	}

	public function _init()
	{
		$this->sql = $this->G->make('sql');
		$this->pdosql = $this->G->make('pdosql');
		$this->db = $this->G->make('pepdo');
		$this->pg = $this->G->make('pg');
		$this->ev = $this->G->make('ev');
		$this->module = $this->G->make('module');
		$this->session = $this->G->make('session');
	}

	public function autoLoginWxUser($openid)
	{
		$user = $this->getUserByArgs(array(array('AND','useropenid = :useropenid','useropenid',$openid)));
		if(!$user)return false;
		$this->session->setSessionUser(array('sessionuserid'=>$user['userid'],'sessionpassword'=>$user['userpassword'],'sessionip'=>$this->ev->getClientIp(),'sessiongroupid'=>$user['usergroupid'],'sessionlogintime'=>TIME,'sessionusername'=>$user['username']));
		return true;
	}

	public function getModuleUserInfo($userid = 0)
	{
		$user = $this->session->getSessionUser();
		$group = $this->getGroupById($user['sessiongroupid']);
		if($userid)
		return array('iscurrentuser'=> $userid == $user['sessionuserid'],'group' => $group);
		else
		return array('iscurrentuser'=> 0,'group' => $group);
	}

	//user function
	public function insertUser($args)
	{
		$args['userregip'] = $this->ev->getClientIp();
		$args['userregtime'] = TIME;
		$data = array('user',$args);
		$sql = $this->pdosql->makeInsert($data);
		$this->db->exec($sql);
		return $this->db->lastInsertId();
	}

	public function modifyUserGroup($groupid,$userid)
	{
		$user = $this->getUserById($userid);
		if($groupid == $user['usergroupid'])return true;
		$group = $this->getGroupById($groupid);
		if($group['groupmoduleid'] == $user['groupmoduleid'])
		{
			$data = array('user',array('usergroupid'=>$groupid),array(array("AND","userid = :userid",'userid',$userid)));
			$sql = $this->pdosql->makeUpdate($data);
			$this->db->exec($sql);
			return true;
		}
		else
		{
			$args = array('usergroupid'=>$groupid);
			$fields = $this->module->getPrivateMoudleFields($user['groupmoduleid']);
			foreach($fields as $p)
			{
				$args[$p['field']] = NULL;
			}
			$data = array('user',$args,array(array("AND","userid = :userid",'userid',$userid)));
			$sql = $this->pdosql->makeUpdate($data);
			$this->db->exec($sql);
			return true;
		}
	}

	public function modifyUserPassword($args,$userid)
	{
		$data = array('user',array('userpassword'=>md5($args['password'])),array(array("AND","userid = :userid",'userid',$userid)));
		$sql = $this->pdosql->makeUpdate($data);
		$this->db->exec($sql);
		return true;
	}

	public function modifyUserInfo($args,$userid)
	{
		if(!$args)return false;
		$data = array('user',$args,array(array('AND',"userid = :userid",'userid',$userid)));
		$sql = $this->pdosql->makeUpdate($data);
		return $this->db->exec($sql);
		//return $this->db->affectedRows();
	}

	public function delUserById($userid)
	{
		$data = array('user',array(array('AND',"userid = :userid",'userid',$userid)));
		$sql = $this->pdosql->makeDelete($data);
		return $this->db->exec($sql);
		//return $this->db->affectedRows();
	}

	public function delActorById($groupid)
	{
		$r = $this->getUserListByGroupid($groupid);
		if($r['number'])return false;
		else
		{
			$args = array(
				'table' => "user_group",
				'query' => array(array('AND',"groupid = :groupid",'groupid',$groupid))
			);
			return $this->db->delElement($args);
		}
	}

	public function getUserById($id)
	{
		$data = array(false,array('user','user_group'),array(array('AND',"user.userid = :id",'id',$id),array('AND','user.usergroupid = user_group.groupid')));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql,array('userinfo','groupright'));
	}

	public function getUserByArgs($args)
	{
		$data = array(false,array('user','user_group'),$args);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql,array('userinfo','groupright'));
	}

	public function getUsersByArgs($args)
	{
		$data = array(false,array('user','user_group'),$args,false,false,false);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetchAll($sql,'userid',array('userinfo','groupright'));
	}

	public function getUserListByArgs($page,$args,$number = 10)
	{
		$args = array(
			'table' => array('user','user_group'),
			'query' => $args,
			'serial' => array('userinfo','groupright'),
			'index' => 'userid'
		);
		return $this->db->listElements($page,$number,$args);
	}

	public function getUserListByGroupid($groupid,$number = 10,$page = 1)
	{
		$args = array(
			'table' => array('user','user_group'),
			'query' => array(array('AND',"user.usergroupid = :usergroupid",'usergroupid',$groupid),array('AND','user.usergroupid = user_group.groupid')),
			'serial' => array('userinfo','groupright')
		);
		return $this->db->listElements($page,$number,$args);
	}

	public function getUserByUserName($username)
	{
		//$username = urldecode($username);
		$data = array(false,array('user','user_group'),array(array('AND',"user.username = :username",'username',$username),array('AND','user.usergroupid = user_group.groupid')));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql,array('userinfo','groupright'));
	}

	public function getUserByEmail($email)
	{
		$data = array(false,array('user','user_group'),array(array('AND',"user.useremail = :email",'email',$email),array('AND','user.usergroupid = user_group.groupid')));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql,array('userinfo','groupright'));
	}

	public function getUserList($page,$number = 20,$args = 1)
	{
		$page = $page > 0?$page:1;
		$r = array();
		$data = array(false,'user',$args,false,'userid DESC',array(intval($page-1)*$number,$number));
		$sql = $this->pdosql->makeSelect($data);
		$r['data'] = $this->db->fetchALL($sql,false,'userinfo');
		$data = array('COUNT(*) AS number','user',$args,false,false,false);
		$sql = $this->pdosql->makeSelect($data);
		$tmp = $this->db->fetch($sql);
		$r['number'] = $tmp['number'];
		$pages = $this->pg->outPage($this->pg->getPagesNumber($tmp['number'],$number),$page);
		$r['pages'] = $pages;
		return $r;
	}

	//user group functions
	public function getGroupById($groupid)
	{
		$data = array(false,'user_group',array(array('AND',"groupid = :groupid",'groupid',$groupid)),false,'groupid DESC',false);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql,'groupright');
	}

	public function getGroupByArgs($args)
	{
		$data = array(false,'user_group',$args);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql,'groupright');
	}

	public function getUserGroups()
	{
		$data = array(false,'user_group',1,false,'groupid DESC',false);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetchAll($sql,'groupid','groupright');
	}

	public function getUserGroupList($args,$number = 10,$page = 1)
	{
		$args = array(
			'table' => 'user_group',
			'query' => $args,
			'index' => 'groupid',
			'serial' => 'groupright'
		);
		return $this->db->listElements($page,10,$args);
	}

	public function getGroupsByModuleid($moduleid)
	{
		$data = array(false,'user_group',array(array('AND',"groupmoduleid = :groupmoduleid",'groupmoduleid',$moduleid)),false,false,false);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetchAll($sql,'groupid','groupright');
	}

	public function getDefaultGroupByModuleid($moduleid)
	{
		$data = array(false,'user_group',array(array('AND',"groupmoduledefault = 1"),array('AND',"groupmoduleid = :groupmoduleid",'groupmoduleid',$moduleid)),false,'groupid DESC',false);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	public function insertActor($args)
	{
		if($args['groupmoduledefault'])
		{
			$data = array('user_group',array('groupmoduledefault'=>0),array(array('AND',"groupmoduleid = :groupmoduleid",'groupmoduleid',$args['groupmoduleid'])));
			$sql = $this->pdosql->makeUpdate($data);
			$this->db->exec($sql);
		}
		$data = array('user_group',$args);
		$sql = $this->pdosql->makeInsert($data);
		$this->db->exec($sql);
		return $this->db->lastInsertId();
	}

	public function modifyActor($groupid,$args)
	{
		$g = $this->getGroupByArgs(array(array('AND',"groupname = :groupname",'groupname',$args['groupname']),array('AND',"groupid != :groupid",'groupid',$groupid)));
		if($g)return false;
		$data = array('user_group',$args,array(array('AND',"groupid = :groupid",'groupid',$groupid)));
		$sql = $this->pdosql->makeUpdate($data);
		$this->db->exec($sql);
		return true;
	}

	public function selectDefaultActor($groupid)
	{
		$args = array("groupdefault" => 0);
		$data = array('user_group',$args);
		$sql = $this->pdosql->makeUpdate($data);
		$this->db->exec($sql);
		$args = array("groupdefault" => 1);
		$data = array('user_group',$args,array(array('AND',"groupid = :groupid",'groupid',$groupid)));
		$sql = $this->pdosql->makeUpdate($data);
		$this->db->exec($sql);
		return true;
	}

	public function getDefaultGroup()
	{
		$data = array(false,'user_group',array(array('AND',"groupdefault = 1")));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	//public function getRightModuleFileds

	/**
	public function searchModules($args)
	{
		$data = array(false,'module');
		foreach($args as $p)
		{
			$data[] = $p;
		}
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetchAll($sql,'moduleid');
	}

	public function getUserModules()
	{
		$data = array(false,'module','moduleapp = \'user\'',false,'moduleid DESC',false);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetchAll($sql,'moduleid');
	}

	public function getUserModuleById($moduleid)
	{
		$data = array(false,'module',"moduleid = '{$moduleid}'");
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql,'modulefields');
	}

	public function insertModule($args)
	{
		$args['moduleapp'] = 'user';
		$data = array('module',$args);
		$sql = $this->pdosql->makeInsert($data);
		$this->insertDefaultUserTable($args['moduletable']);
		$this->db->exec($sql);
		return $this->db->lastInsertId();
	}

	public function modifyUserModule($args,$moduleid)
	{
		$data = array("module",$args,"moduleid = '{$moduleid}'");
		$sql = $this->pdosql->makeUpdate($data);
		return $this->db->exec($sql);
	}

	public function getMoudleFields($moduleid,$showall = false)
	{
		if($showall)
		$data = array(false,'module_fields',"fieldmoduleid = '{$moduleid}'",false,'fieldsequence DESC,fieldid DESC');
		else
		$data = array(false,'module_fields',array("fieldmoduleid = '{$moduleid}'","fieldlock = 0"),false,'fieldsequence DESC,fieldid DESC');
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetchAll($sql);
	}

	public function getFieldByNameAndModuleid($field,$moduleid)
	{
		$data = array(false,'module_fields',array("fieldmoduleid = '{$moduleid}'","field = '{$field}'"));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	public function getFieldById($fieldid)
	{
		$data = array(false,'module_fields',"fieldid = '{$fieldid}'");
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	public function insertModuleFields($args)
	{
		$this->insertUserModuleField($args);
		$data = array('module_fields',$args);
		$sql = $this->pdosql->makeInsert($data);
		$this->db->exec($sql);
		return $this->db->lastInsertId();
	}

	public function getUserModuleHtml($moduleid)
	{}

	public function modifyUserFieldHtmlType($args,$fieldid)
	{
		$data = array('module_fields',$args,"fieldid = '{$fieldid}'");
		$sql = $this->pdosql->makeUpdate($data);
		return $this->db->exec($sql);
	}

	public function modifyUserFieldDataType($args,$fieldid)
	{
		$this->modifyUserModuleField($args,$fieldid);
		$data = array('module_fields',$args,"fieldid = '{$fieldid}'");
		$sql = $this->pdosql->makeUpdate($data);
		return $this->db->exec($sql);
	}

	//user database exec
	public function insertDefaultUserTable($table)
	{
		$fields = array(array('name'=>'userid','type'=>'INT','length'=>11));
		$indexs = array(array('type'=>'PRIMARY KEY','field'=>'userid'));
		$sql = $this->pdosql->createTable($table,$fields,$indexs);
		return $this->db->exec($sql);
	}

	public function insertUserModuleField($args)
	{
		if(HE == 'gbk')$args['fieldcharset'] = 'gbk';
		else $args['fieldcharset'] = 'utf8';
		$r = $this->getUserModuleById($args['fieldmoduleid']);
		$table = $r['moduletable'];
		$sql = $this->pdosql->addField($args,$table);
		return $this->db->exec($sql);
	}

	public function modifyUserModuleField($args,$fieldid)
	{
		if(HE == 'gbk')$args['fieldcharset'] = 'gbk';
		else $args['fieldcharset'] = 'utf8';
		$field = $this->getFieldById($fieldid);
		$args['field'] = $field['field'];
		$r = $this->getUserModuleById($field['fieldmoduleid']);
		$table = $r['moduletable'];
		$sql = $this->pdosql->modifyField($args,$table);
		return $this->db->exec($sql);
	}
	**/

	//public function
}

?>
