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
		$search = $this->ev->get('search');
		$this->u = '';
		if($search)
		{
			$this->tpl->assign('search',$search);
			foreach($search as $key => $arg)
			{
				$this->u .= "&search[{$key}]={$arg}";
			}
		}
		$this->tpl->assign('search',$search);
		if(!method_exists($this,$action))
		$action = "index";
		$this->$action();
		exit;
	}

	private function catsmenu()
	{
        $catid = $this->ev->get('catid');
		$categories = $this->category->getAllCategory();
        $r = array();
        $this->category->selected = $catid;
        $this->category->hrefpre = 'index.php?content-master-contents&catid=';
        $this->category->levelCategory($r,0,$this->category->tidycategories);
        $this->category->resetCategoryIndex($r);
        echo 'var treeData = '.json_encode($r);
        exit();
	}

	private function add()
	{
		if($this->ev->get('submit'))
		{
			$args = $this->ev->get('args');
			$args['contentuserid'] = $this->_user['sessionuserid'];
			$args['contentusername'] = $this->_user['sessionusername'];
			if(!$args['contentinputtime'])$args['contentinputtime'] = TIME;
			else
			$args['contentinputtime'] = strtotime($args['contentinputtime']);
			$group = $this->user->getGroupById($this->_user['sessiongroupid']);
			$args = $this->module->tidyNeedFieldsPars($args,$args['contentmoduleid'],array('group' => $group));
			$id = $this->content->addContent($args);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => "forward",
			    "forwardUrl" => "index.php?content-master-contents&catid={$args['contentcatid']}"
			);
			exit(json_encode($message));
		}
		else
		{
			$catid = intval($this->ev->get('catid'));
            $moduleid = intval($this->ev->get('moduleid'));
			$parentcat = $this->category->getCategoriesByArgs(array(array("AND","catparent = 0")));
			$modules = $this->module->getModulesByApp($this->G->app);
            $userid = $this->_user['sessionuserid'];
            $user = $this->user->getUserById($userid);
            $group = $this->user->getGroupById($user['usergroupid']);
            $fields = $this->module->getMoudleFields($moduleid,$this->user->getModuleUserInfo());
            $forms = $this->html->buildHtml($fields);
			$tpls = array();
			foreach(glob("app/content/tpls/app/content_*.tpl") as $p)
			{
				$tpls[] = substr(basename($p),0,-4);
			}
			$this->tpl->assign('moduleid',$moduleid);
            $this->tpl->assign('forms',$forms);
            $this->tpl->assign('tpls',$tpls);
			$this->tpl->assign('modules',$modules);
			$this->tpl->assign('parentcat',$parentcat);
			$this->tpl->assign('catid',$catid);
			$this->tpl->display('content_add');
		}
	}

	private function edit()
	{
		$page = intval($this->ev->get('page'));
		if($this->ev->get('submit'))
		{
			$contentid = intval($this->ev->get('contentid'));
			$content = $this->content->getContentById($contentid);
			$args = $this->ev->get('args');
			if(!$args['contentinputtime'])$args['contentinputtime'] = TIME;
			else
			$args['contentinputtime'] = strtotime($args['contentinputtime']);
			$args['contentmodifytime'] = TIME;
			unset($args['contentcatid']);
			$group = $this->user->getGroupById($this->_user['sessiongroupid']);
			$args = $this->module->tidyNeedFieldsPars($args,$content['contentmoduleid'],array('group' => $group));
			$this->content->modifyContent($contentid,$args);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "target" => "",
			    "rel" => "",
			    "callbackType" => "forward",
			    "forwardUrl" => "index.php?content-master-contents&catid={$content['contentcatid']}&page={$page}{$u}"
			);
			exit(json_encode($message));
		}
		else
		{
			$catid = intval($this->ev->get('catid'));
			$cat = $this->category->getCategoryById($catid);
			$contentid = intval($this->ev->get('contentid'));
			$content = $this->content->getContentById($contentid);
			$userid = $this->_user['sessionuserid'];
			$user = $this->user->getUserById($userid);
			$group = $this->user->getGroupById($user['usergroupid']);
			$fields = $this->module->getMoudleFields($content['contentmoduleid'],$this->user->getModuleUserInfo());
			$forms = $this->html->buildHtml($fields,$content);
			$tpls = array();
			foreach(glob("app/content/tpls/app/content_*.tpl") as $p)
			{
				$tpls[] = substr(basename($p),0,-4);
			}
			$this->tpl->assign('tpls',$tpls);
			$this->tpl->assign('fields',$fields);
			$this->tpl->assign('catid',$catid);
			$this->tpl->assign('cat',$cat);
			$this->tpl->assign('contentid',$contentid);
			$this->tpl->assign('content',$content);
			$this->tpl->assign('page',$page);
			$this->tpl->assign('forms',$forms);
			$this->tpl->display('content_edit');
		}
	}

	private function del()
	{
		$page = intval($this->ev->get('page'));
		$contentid = intval($this->ev->get('contentid'));
		$content = $this->content->getContentById($contentid);
		$this->content->delContent($contentid);
		$message = array(
			'statusCode' => 200,
			"message" => "操作成功",
		    "target" => "",
		    "rel" => "",
		    "callbackType" => "forward",
		    "forwardUrl" => "index.php?content-master-contents&catid={$content['contentcatid']}&page={$page}"
		);
		exit(json_encode($message));
	}

	private function lite()
	{
		$catid = $this->ev->get('catid');
		$page = $this->ev->get('page');
		$this->tpl->assign('catid',$catid);
		$this->tpl->assign('page',$page);
		if($this->ev->get('modifycontentsequence'))
		{
			if($this->ev->get('action') == 'delete')
			{
				$ids = $this->ev->get('delids');
				foreach($ids as $key => $id)
				{
					$this->content->delContent($key);
				}
			}
			elseif($this->ev->get('action') == 'movecategory')
			{
				$contentids = array();
				$ids = $this->ev->get('delids');
				foreach($ids as $key => $id)
				{
					if($key)$contentids[] = $key;
				}
				$contentids = implode(',',$contentids);
				$parentcat = $this->category->getCategoriesByArgs(array(array("AND","catparent = 0")));
				$this->tpl->assign('parentcat',$parentcat);
				$this->tpl->assign('contentids',$contentids);
				$this->tpl->display('content_move');
				exit;
			}
			elseif($this->ev->get('action') == 'copycategory')
			{
				$contentids = array();
				$ids = $this->ev->get('delids');
				foreach($ids as $key => $id)
				{
					if($key)$contentids[] = $key;
				}
				$contentids = implode(',',$contentids);
				$parentcat = $this->category->getCategoriesByArgs(array(array("AND","catparent = 0")));
				$this->tpl->assign('parentcat',$parentcat);
				$this->tpl->assign('contentids',$contentids);
				$this->tpl->display('content_copy');
				exit;
			}
			elseif($this->ev->get('action') == 'moveposition')
			{
				$contentids = array();
				$ids = $this->ev->get('delids');
				foreach($ids as $key => $id)
				{
					if($key)$contentids[] = $key;
				}
				$contentids = implode(',',$contentids);
				$poses = $this->position->getPosList();
				$this->tpl->assign('poses',$poses);
				$this->tpl->assign('contentids',$contentids);
				$this->tpl->display('content_position');
				exit;
			}
			else
			{
				$ids = $this->ev->get('ids');
				foreach($ids as $key => $id)
				{
					$this->content->modifyBasciContent($key,array('contentsequence' => $id));
				}
			}
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
				"callbackType" => "forward",
			    "forwardUrl" => "index.php?content-master-contents&catid={$catid}&page={$page}{$u}"
			);
			exit(json_encode($message));
		}
		elseif($this->ev->get('movecposition'))
		{
			$contentids = explode(',',$this->ev->get('contentids'));
			$position = $this->ev->get('position');
			if($position)
			{
				foreach($contentids as $key => $id)
				{
					if($id)
					{
						$basic = $this->content->getBasicContentById($id);
						$args = array('pctitle' => $basic['contenttitle'],'pctime' => $basic['contentinputtime'],'pccontentid' => $id,'pcthumb' => $basic['contentthumb'],'pcposid' => $position);
						$this->position->addPosContent($args);
					}
				}
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功",
					"callbackType" => "forward",
				    "forwardUrl" => "index.php?content-master-contents&catid={$catid}&page={$page}{$u}"
				);
			}
			else
			$message = array(
				'statusCode' => 300,
				"message" => "操作失败"
			);
			exit(json_encode($message));
		}
		elseif($this->ev->get('movecategory'))
		{
			$contentids = explode(',',$this->ev->get('contentids'));
			$targetcatid = $this->ev->get('targetcatid');
			if($targetcatid)
			{
				foreach($contentids as $key => $id)
				{
					if($id)$this->content->modifyBasciContent($id,array('contentcatid' => $targetcatid));
				}
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功",
					"callbackType" => "forward",
				    "forwardUrl" => "?content-master-contents&catid={$catid}&page={$page}{$u}"
				);
			}
			else
			$message = array(
				'statusCode' => 300,
				"message" => "操作失败"
			);
			exit(json_encode($message));
		}
		elseif($this->ev->get('copycategory'))
		{
			$contentids = explode(',',$this->ev->get('contentids'));
			$targetcatid = $this->ev->get('targetcatid');
			if($targetcatid)
			{
				foreach($contentids as $key => $id)
				{
					if($id)
					{
						$content = $this->content->getBasicContentById($id);
						$args = array('contentcatid' => $targetcatid,'contenttitle' => $content['contenttitle'],'contentmoduleid' => $content['contentmoduleid'],'contentthumb' => $content['contentthumb'],'contentlink' => 'index.php?content-app-content&contentid='.$content['contentid']);
						$args['contentuserid'] = $this->_user['sessionuserid'];
						$args['contentusername'] = $this->_user['sessionusername'];
						$args['contentinputtime'] = TIME;
						$this->content->addContent($args);
					}
				}
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功",
					"callbackType" => "forward",
				    "forwardUrl" => "index.php?content-master-contents&catid={$catid}&page={$page}{$u}"
				);
			}
			else
			$message = array(
				'statusCode' => 300,
				"message" => "操作失败"
			);
			exit(json_encode($message));
		}
		else
		{
			$message = array(
				'statusCode' => 300,
				"message" => "无效访问"
			);
			exit(json_encode($message));
		}
	}

	private function addpage()
	{
        $modules = $this->module->getModulesByApp($this->G->app);
        $this->tpl->assign('modules',$modules);
		$this->tpl->display('addpage');
	}

	private function index()
	{
		$search = $this->ev->get('search');
		$catid = intval($this->ev->get('catid'));
		$page = intval($this->ev->get('page'));
		$page = $page?$page:1;
		if(!$catid)$catid = $search['contentcatid'];
		$categories = $this->category->getAllCategory();
		$parentcat = $this->category->getCategoriesByArgs(array(array("AND","catparent = 0"),array("AND","catapp = 'content'")));
		if($catid)
		{
			$childstring = $this->category->getChildCategoryString($catid);
			$args = array(array("AND","find_in_set(contentcatid,:contentcatid)",'contentcatid',$childstring));
		}
		else $args = array();
		if($search['contentid'])
		{
			$args[] = array("AND","contentid = :contentid",'contentid',$search['contentid']);
		}
		else
		{
			if($search['contentcatid'])$args[] = array("AND","contentcatid = :contentcatid",'contentcatid',$search['contentcatid']);
			if($search['contentmoduleid'])$args[] = array("AND","contentmoduleid = :contentmoduleid",'contentmoduleid',$search['contentmoduleid']);
			if($search['stime'])$args[] = array("AND","contentinputtime >= :scontentinputtime",'scontentinputtime',strtotime($search['stime']));
			if($search['etime'])$args[] = array("AND","contentinputtime <= :econtentinputtime",'econtentinputtime',strtotime($search['etime']));
			if($search['keyword'])$args[] = array("AND","contenttitle LIKE :contenttitle",'contenttitle',"%{$search['keyword']}%");
			if($search['username'])
			{
				$user = $this->user->getUserByUserName($search['username']);
				$args[] = array("AND","contentuserid = :contentuserid",'contentuserid',$user['userid']);
			}
		}
		$contents = $this->content->getContentList($args,$page,10);
		$modules = $this->module->getModulesByApp($this->G->app);
		$catlevel = 1;
		if($catid)
		{
            $pos = $this->category->getCategoryPos($catid);
            if(count($pos))
            $catlevel = count($pos) + 1;
		}
        $this->tpl->assign('catlevel',$catlevel);
		$this->tpl->assign('modules',$modules);
		$this->tpl->assign('catid',$catid);
		$this->tpl->assign('contents',$contents);
		$this->tpl->assign('parentcat',$parentcat);
		$this->tpl->assign('categories',$categories);
		$this->tpl->assign('page',$page);
		$this->tpl->display('content');
	}
}


?>
