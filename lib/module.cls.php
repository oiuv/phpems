<?php
/*
 * Created on 2011-12-19
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */
class module
{

	public $G;
	private $cache = array();

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
	}

	//查询模型
	public function searchModules($args)
	{
		$data = array(false,'module',$args);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetchAll($sql,'moduleid');
	}

	//根据应用获取模型
	public function getModulesByApp($app)
	{
		$data = array(false,'module',array(array("AND","moduleapp = :app",'app',$app)),false,'moduleid DESC',false);
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetchAll($sql,'moduleid');
	}

	//根据ID获取模型
	public function getModuleById($moduleid)
	{
		if(!$this->cache['module'][$moduleid])
		{
			$data = array(false,'module',array(array('AND',"moduleid = :moduleid",'moduleid',$moduleid)));
			$sql = $this->pdosql->makeSelect($data);
			$this->cache['module'][$moduleid] = $this->db->fetch($sql,'modulefields');
		}
		return $this->cache['module'][$moduleid];
	}

	//插入模型
	public function insertModule($args)
	{
		if(!$args['moduleapp'])$args['moduleapp'] = $this->G->app;
		$data = array('module',$args);
		$sql = $this->pdosql->makeInsert($data);
		$this->db->exec($sql);
		return $this->db->lastInsertId();
	}

	//插入默认的表，$primary为主键字段名，必须为INT 11
	private function _insertDefaultTable($table,$primary)
	{
		$fields = array(array('name'=>$primary,'type'=>'INT','length'=>11));
		$indexs = array(array('type'=>'PRIMARY KEY','field'=>$primary));
		$sql = $this->sql->createTable($table,$fields,$indexs);
		return $this->db->query($sql);
	}

	//根据用户获取模型所有字段
	//$userinfo = array('iscurrentuser' => bool,'group'=>array());
	public function getMoudleFields($moduleid,$userinfo = 1)
	{
		if($userinfo == 1)
		$data = array(false,'module_fields',array(array('AND',"fieldmoduleid = :moduleid",'moduleid',$moduleid), array('OR'," (fieldpublic = 1 AND fieldappid = :app)",'app',$this->G->app)),false,'fieldsequence DESC,fieldid DESC');
		else
		$data = array(false,'module_fields',array(array('AND',"fieldmoduleid = :moduleid",'moduleid',$moduleid), array('OR'," (fieldpublic = 1 AND fieldappid = :app)",'app',$this->G->app),array('AND',"fieldlock = '0'")),false,'fieldsequence DESC,fieldid DESC');
		$sql = $this->pdosql->makeSelect($data);
		$r = $this->db->fetchAll($sql);
		if($userinfo == 1)return $r;
		foreach($r as $key => $p)
		{
			if($userinfo['group']['groupmoduleid'] == 1)
			{
				if(strpos($p['fieldforbidactors'],','.$userinfo['group']['groupid'].',') !== false)
				unset($r[$key]);
			}
			else
			{
				if($userinfo['iscurrentuser'])
				{
					if(strpos($p['fieldforbidactors'],',-1,') !== false)
					unset($r[$key]);
				}
			}
		}
		return $r;
	}

	//获取模型直属字段
	public function getPrivateMoudleFields($moduleid)
	{
		$data = array(false,'module_fields',array(array('AND',"fieldmoduleid = :moduleid",'moduleid',$moduleid),"fieldpublic = 0"),false,'fieldsequence DESC,fieldid DESC');
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetchAll($sql);
	}

	//删除模型
	public function delModule($moduleid)
	{
		$data = array('module',array(array('AND',"moduleid = :moduleid",'moduleid',$moduleid)));
		$sql = $this->pdosql->makeDelete($data);
		$this->db->exec($sql);
		return $this->db->affectedRows();
	}

	//删除模型字段
	public function delField($fieldid)
	{
		$field = $this->getFieldById($fieldid);
		$sql = $this->sql->delField($field['field'],$this->G->app);
		$this->db->exec($sql);
		$data = array('module_fields',array(array('AND',"fieldid = :fieldid",'fieldid',$fieldid)));
		$sql = $this->pdosql->makeDelete($data);
		return $this->db->exec($sql);
		//return $this->db->affectedRows();
	}

	//整理模型所需的参数，除去多余参数
	public function tidyNeedFieldsPars($args,$moduleid,$userinfo)
	{
		$tmp = array();
		foreach($this->G->make('config',$this->G->app)->fields as $p)
		{
			if(isset($args[$p]))$tmp[$p] = $args[$p];
		}
		$r = $this->getMoudleFields($moduleid,$userinfo);
		foreach($r as $key => $data)
		{

			if($data['fieldhtmltype'] == 'htmltime')
			$tmp[$data['field']] = strtotime($args[$data['field']]);
			else
			$tmp[$data['field']] = $args[$data['field']];
		}
		return $tmp;
	}

	//根据字段名称和模型ID查找字段
	public function getFieldByNameAndModuleid($field,$moduleid = false)
	{
		if($moduleid)
		$data = array(false,'module_fields',array(array('AND',"fieldmoduleid = :moduleid",'moduleid',$moduleid),array('AND',"field = :field",'field',$field)));
		else
		$data = array(false,'module_fields',array(array('AND',"field = :field",'field',$field)));
		$sql = $this->pdosql->makeSelect($data);
		return $this->db->fetch($sql);
	}

	//根据ID获取字段
	public function getFieldById($fieldid)
	{
		if(!$this->cache['field'][$fieldid])
		{
			$data = array(false,'module_fields',array(array('AND',"fieldid = :fieldid",'fieldid',$fieldid)));
			$sql = $this->pdosql->makeSelect($data);
			$this->cache['field'][$fieldid] = $this->db->fetch($sql);
		}
		return $this->cache['field'][$fieldid];
	}

	//插入模型字段
	public function insertModuleField($args)
	{
		$args['fieldappid'] = $this->G->app;
		$this->insertModuleFieldData($args);
		$data = array('module_fields',$args);
		$sql = $this->pdosql->makeInsert($data);
		$this->db->exec($sql);
		return $this->db->lastInsertId();
	}

	//编辑字段的HTML属性
	public function modifyFieldHtmlType($args,$fieldid)
	{
		$data = array('module_fields',$args,array(array('AND',"fieldid = :fieldid",'fieldid',$fieldid)));
		$sql = $this->pdosql->makeUpdate($data);
		return $this->db->exec($sql);
	}

	//编辑字段的数据库属性
	public function modifyFieldDataType($args,$fieldid)
	{
		$this->modifyModuleField($args,$fieldid);
		$data = array('module_fields',$args,array(array('AND',"fieldid = :fieldid",'fieldid',$fieldid)));
		$sql = $this->pdosql->makeUpdate($data);
		return $this->db->exec($sql);
	}

	//插入模型字段
	public function insertModuleFieldData($args)
	{
		if(HE == 'gbk')$args['fieldcharset'] = 'gbk';
		else $args['fieldcharset'] = 'utf8';
		$r = $this->getModuleById($args['fieldmoduleid']);
		$table = $this->G->app;
		$sql = $this->sql->addField($args,$table);
		return $this->db->query($sql);
	}

	//修改模型字段
	public function modifyModuleField($args,$fieldid)
	{
		if(HE == 'gbk')$args['fieldcharset'] = 'gbk';
		else $args['fieldcharset'] = 'utf8';
		$field = $this->getFieldById($fieldid);
		$args['field'] = $field['field'];
		$r = $this->getModuleById($field['fieldmoduleid']);
		$table = $this->G->app;
		$sql = $this->sql->modifyField($args,$table);
		return $this->db->query($sql);
	}

	//修改模型
	public function modifyModule($args,$moduleid)
	{
		$data = array("module",$args,array(array('AND',"moduleid = :moduleid",'moduleid',$moduleid)));
		$sql = $this->pdosql->makeUpdate($data);
		return $this->db->exec($sql);
	}
}
?>
