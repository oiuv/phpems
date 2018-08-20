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

	private function fields()
	{
		$moduleid = $this->ev->get('moduleid');
		$page = $this->ev->post('page');
		if($this->ev->get('modifyfieldsequence'))
		{
			$ids = $this->ev->post('ids');
			if($ids)
			{
				foreach($ids as $key => $value)
				{
					$args = array('fieldsequence'=>$value);
					$this->module->modifyFieldHtmlType($args,$key);
				}
			}
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
				"callbackType" => "forward",
			    "forwardUrl" => "?content-master-module-fields&moduleid={$moduleid}"
			);
			exit(json_encode($message));
		}
		else
		{
			$module = $this->module->getModuleById($moduleid);
			$fields = $this->module->getMoudleFields($moduleid,true);
			$this->tpl->assign('moduleid',$moduleid);
			$this->tpl->assign('module',$module);
			$this->tpl->assign('fields',$fields);
			$this->tpl->display('fields');
		}
	}

	private function addfield()
	{
		$moduleid = $this->ev->get('moduleid');
		$fieldpublic = $this->ev->get('fieldpublic');
		$page = $this->ev->post('page');
		if($this->ev->get('insertfield'))
		{
			$args = $this->ev->post('args');
			$moduleid = $args['fieldmoduleid'];
			$module = $this->module->getModuleById($moduleid);
			if(!$args['fieldpublic'])
			$args['field'] = $module['modulecode'].'_'.$args['field'];
			$args['fieldforbidactors'] = ','.implode(',',$args['fieldforbidactors']).',';
			$id = $this->module->insertModuleField($args);
			if($id)
			{
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功",
					"callbackType" => "forward",
				    "forwardUrl" => "?content-master-module-fields&moduleid={$moduleid}&page={$page}"
				);
			}
			else
			{
				$message = array(
					'statusCode' => 300,
					"message" => "操作失败"
				);
			}
			exit(json_encode($message));
		}
		else
		{
			$module = $this->module->getModuleById($moduleid);
			$this->tpl->assign('moduleid',$moduleid);
			$this->tpl->assign('fieldpublic',$fieldpublic);
			$this->tpl->assign('module',$module);
			$this->tpl->display('addfield');
		}
	}

	private function preview()
	{
		$moduleid = $this->ev->get('moduleid');
		$module = $this->module->getModuleById($moduleid);
		$fields = $this->module->getMoudleFields($moduleid);
		$forms = $this->html->buildHtml($fields);
		$this->tpl->assign('moduleid',$moduleid);
		$this->tpl->assign('module',$module);
		$this->tpl->assign('fields',$fields);
		$this->tpl->assign('forms',$forms);
		$this->tpl->display('preview');
	}

	private function modifyfield()
	{
		if($this->ev->get('modifyfieldhtml'))
		{
			$args = $this->ev->post('args');
			$args['fieldforbidactors'] = ','.implode(',',$args['fieldforbidactors']).',';
			$fieldid = $this->ev->post('fieldid');
			$field = $this->module->getFieldById($fieldid);
			$this->module->modifyFieldHtmlType($args,$fieldid);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "navTabId" => "",
			    "rel" => "",
			    "callbackType" => "forward",
			    "forwardUrl" => "?content-master-module-fields&moduleid={$field['fieldmoduleid']}"
			);
			exit(json_encode($message));
		}
		elseif($this->ev->get('modifyfielddata'))
		{
			$args = $this->ev->post('args');
			$fieldid = $this->ev->post('fieldid');
			$field = $this->module->getFieldById($fieldid);
			$this->module->modifyFieldDataType($args,$fieldid);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "navTabId" => "",
			    "rel" => "",
			    "callbackType" => "forward",
			    "forwardUrl" => "?content-master-module-fields&moduleid={$field['fieldmoduleid']}"
			);
			exit(json_encode($message));
		}
		else
		{
			$fieldid = $this->ev->get('fieldid');
			$field = $this->module->getFieldById($fieldid);
			$this->tpl->assign('fieldid',$fieldid);
			$this->tpl->assign('field',$field);
			$this->tpl->display('modifyfield');
		}
	}

	private function delfield()
	{
		$fieldid = $this->ev->get('fieldid');
		$moduleid = $this->ev->get('moduleid');
		$r = $this->module->delField($fieldid);
		$message = array(
			'statusCode' => 200,
			"message" => "操作成功",
		    "callbackType" => "forward",
		    "forwardUrl" => "index.php?content-master-module-fields&moduleid={$moduleid}"
		);
		exit(json_encode($message));
	}

	private function modify()
	{
		$page = $this->ev->get('page');
		if($this->ev->get('modifymodule'))
		{
			$args = $this->ev->get('args');
			$moduleid = $this->ev->get('moduleid');
			$this->module->modifyModule($args,$moduleid);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => "forward",
			    "forwardUrl" => "?content-master-module"
			);
			exit(json_encode($message));
		}
		else
		{
			$moduleid = $this->ev->get('moduleid');
			$module = $this->module->getModuleById($moduleid);
			$this->tpl->assign('module',$module);
			$this->tpl->display('modifymodule');
		}
	}

	private function forbiddenfield()
	{
		$fieldid = $this->ev->get('fieldid');
		$moduleid = $this->ev->get('moduleid');
		$field = $this->module->getFieldById($fieldid);
		if(!$moduleid)$moduleid = $field['fieldmoduleid'];
		$args = array();
		if($field['fieldlock'])
		$args['fieldlock'] = 0;
		else
		$args['fieldlock'] = 1;
		$this->module->modifyFieldHtmlType($args,$fieldid);
		$message = array(
			'statusCode' => 200,
			"message" => "操作成功",
		    "callbackType" => "forward",
		    "forwardUrl" => "index.php?content-master-module-fields&moduleid={$moduleid}"
		);
		exit(json_encode($message));
	}

	private function moduleforms()
	{
		$moduleid = $this->ev->get('moduleid');
		$userinfo = $this->user->getModuleUserInfo();
		$fields = $this->module->getMoudleFields($moduleid,$userinfo);
		$forms = $this->html->buildHtml($fields);
		$this->tpl->assign('fields',$fields);
		$this->tpl->assign('forms',$forms);
		$this->tpl->display('preview_ajax');
	}

	private function add()
	{
		$page = intval($this->ev->get('page'));
		if($this->ev->post('insertmodule'))
		{
			$args = $this->ev->post('args');
			$errmsg = false;
			if($this->module->searchModules(array(array("AND","modulecode = :modulecode",'modulecode',$args['modulecode']))))
			{
				$message = array(
					'statusCode' => 300,
					"message" => "操作失败，存在同名（代码）模型"
				);
				exit(json_encode($message));
			}
			$id = $this->module->insertModule($args);
			if(!$id)$errmsg = '模型添加出错';
			if(!$errmsg)
			{
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功",
					"callbackType" => "forward",
				    "forwardUrl" => "index.php?content-master-module&page={$page}"
				);
				exit(json_encode($message));
			}
			else
			{
				$message = array(
					'statusCode' => 300,
					"message" => "操作失败，{$errmsg}"
				);
			}
			exit(json_encode($message));
		}
		else
		$this->tpl->display('addmodule');
	}

	private function del()
	{
		$moduleid = $this->ev->get('moduleid');
		$fileds = $this->module->getPrivateMoudleFields($moduleid);
		$groups = $this->user->getGroupsByModuleid($moduleid);
		if($fileds || $groups)
		$message = array(
			'statusCode' => 300,
			"message" => "操作失败，请先删除该模型下所有模型字段和角色"
		);
		else
		{
			$this->module->delModule($moduleid);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
				"callbackType" => "forward",
				"forwardUrl" => "index.php?content-master-module&page={$page}"
			);
		}
		exit(json_encode($message));
	}

	private function index()
	{
		$this->tpl->display('module');
	}
}


?>
