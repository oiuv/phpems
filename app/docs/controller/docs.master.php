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

    private function setdochistory()
    {
        if($this->ev->get('setdochistory'))
        {
        	if($this->ev->get('action') == 'delete')
            {
                $ids = $this->ev->get('delids');
                foreach($ids as $key => $id)
                {
                    $this->doc->delDocHistory($key);
                }
            }
			elseif($this->ev->get('action') == 'pass')
            {
                $ids = $this->ev->get('delids');
                foreach($ids as $key => $id)
                {
                    $this->doc->modifyDocHistory($key,array('dhstatus' => 1));
                }
            }
			elseif($this->ev->get('action') == 'unpass')
            {
                $ids = $this->ev->get('delids');
                foreach($ids as $key => $id)
                {
                    $this->doc->modifyDocHistory($key,array('dhstatus' => 2));
                }
            }
			elseif($this->ev->get('action') == 'waitpass')
            {
                $ids = $this->ev->get('delids');
                foreach($ids as $key => $id)
                {
                    $this->doc->modifyDocHistory($key,array('dhstatus' => 0));
                }
            }
            $message = array(
                'statusCode' => 200,
                "message" => "操作成功",
                "callbackType" => "forward",
                "forwardUrl" => "reload"
            );
            exit(json_encode($message));
        }
		elseif($this->ev->get('action') == 'nowuse')
        {
            $dhid = $this->ev->get('dhid');
            $history = $this->doc->getDocHistroyById($dhid);
            $this->doc->modifyDoc($history['dhdocid'],array('doccontentid' => $dhid));
            $message = array(
                'statusCode' => 200,
                "message" => "操作成功",
                "callbackType" => "forward",
                "forwardUrl" => "reload"
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

	private function history()
	{
		$docid = $this->ev->get('docid');
        $doc = $this->doc->getDocById($docid,false);
        $args = array();
        $args[] = array("AND","dhdocid = :dhdocid","dhdocid",$docid);
        $histories = $this->doc->getDocHistoryListByArgs($args,$page);
        $this->tpl->assign('doc',$doc);
        $this->tpl->assign('histories',$histories);
        $this->tpl->display('docs_history');
	}

    private function catsmenu()
    {
        $catid = $this->ev->get('catid');
        $categories = $this->category->getAllCategory();
        $r = array();
        $this->category->selected = $catid;
        $this->category->hrefpre = 'index.php?docs-master-docs&catid=';
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
			$args['docusername'] = $this->_user['sessionusername'];
			$args['docinputtime'] = TIME;
            $args['docneedmore'] = 1;
			$id = $this->doc->addDoc($args);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => "forward",
			    "forwardUrl" => "index.php?docs-master-docs&catid={$args['doccatid']}"
			);
			exit(json_encode($message));
		}
		else
		{
			$catid = intval($this->ev->get('catid'));
			$parentcat = $this->category->getCategoriesByArgs(array(array("AND","catparent = 0")));
			$this->tpl->assign('parentcat',$parentcat);
			$this->tpl->assign('catid',$catid);
			$this->tpl->display('docs_add');
		}
	}

	private function edit()
	{
		$page = intval($this->ev->get('page'));
        $docid = intval($this->ev->get('docid'));
        $doc = $this->doc->getDocById($docid,false);
		if($this->ev->get('submit'))
		{

			$args = $this->ev->get('args');
			$args['docmodifytime'] = TIME;
			unset($args['doccatid']);
			$this->doc->modifyDoc($docid,$args);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => "forward",
			    "forwardUrl" => "index.php?docs-master-docs&catid={$doc['doccatid']}&page={$page}{$this->u}"
			);
			exit(json_encode($message));
		}
		else
		{
			$catid = intval($this->ev->get('catid'));
			$cat = $this->category->getCategoryById($catid);
			$this->tpl->assign('catid',$catid);
			$this->tpl->assign('cat',$cat);
			$this->tpl->assign('docid',$docid);
			$this->tpl->assign('doc',$doc);
			$this->tpl->assign('page',$page);
			$this->tpl->display('docs_edit');
		}
	}

	private function del()
	{
		$page = intval($this->ev->get('page'));
        $docid = intval($this->ev->get('docid'));
		$doc = $this->doc->getDocById($docid);
		if($doc)
		$this->doc->delDoc($docid);
		$message = array(
			'statusCode' => 200,
			"message" => "操作成功",
		    "callbackType" => "forward",
		    "forwardUrl" => "reload"
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
					$this->doc->delDoc($key);
				}
			}
			elseif($this->ev->get('action') == 'move')
			{
				$docids = array();
				$ids = $this->ev->get('delids');
				foreach($ids as $key => $id)
				{
					if($key)$docids[] = $key;
				}
                $docids = implode(',',$docids);
				$parentcat = $this->category->getCategoriesByArgs(array(array("AND","catparent = 0")));
				$this->tpl->assign('parentcat',$parentcat);
				$this->tpl->assign('docids',$docids);
				$this->tpl->display('docs_move');
				exit;
			}
            elseif($this->ev->get('action') == 'more')
            {
                $ids = $this->ev->get('delids');
                foreach($ids as $key => $id)
                {
                    $this->doc->modifyDoc($key,array('docneedmore' => 1));
                }
            }
            elseif($this->ev->get('action') == 'unmore')
            {
                $ids = $this->ev->get('delids');
                foreach($ids as $key => $id)
                {
                    $this->doc->modifyDoc($key,array('docneedmore' => 0));
                }
            }
            elseif($this->ev->get('action') == 'top')
            {
                $ids = $this->ev->get('delids');
                foreach($ids as $key => $id)
                {
                    $this->doc->modifyDoc($key,array('docistop' => 1));
                }
            }
            elseif($this->ev->get('action') == 'untop')
            {
                $ids = $this->ev->get('delids');
                foreach($ids as $key => $id)
                {
                    $this->doc->modifyDoc($key,array('docistop' => 0));
                }
            }
            elseif($this->ev->get('action') == 'lock')
            {
                $ids = $this->ev->get('delids');
                foreach($ids as $key => $id)
                {
                    $this->doc->modifyDoc($key,array('docsyslock' => 1));
                }
            }
            elseif($this->ev->get('action') == 'unlock')
            {
                $ids = $this->ev->get('delids');
                foreach($ids as $key => $id)
                {
                    $this->doc->modifyDoc($key,array('docsyslock' => 0));
                }
            }
			else
			{
				$ids = $this->ev->get('ids');
				foreach($ids as $key => $id)
				{
					$this->doc->modifyDoc($key,array('docsequence' => $id));
				}
			}
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
				"callbackType" => "forward",
			    "forwardUrl" => "index.php?docs-master-docs&catid={$catid}&page={$page}{$u}"
			);
			exit(json_encode($message));
		}
		elseif($this->ev->get('movecategory'))
		{
			$docids = explode(',',$this->ev->get('docids'));
			$targetcatid = $this->ev->get('targetcatid');
			if($targetcatid)
			{
				foreach($docids as $key => $id)
				{
					if($id)$this->doc->modifyDoc($id,array('doccatid' => $targetcatid));
				}
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功",
					"callbackType" => "forward",
				    "forwardUrl" => "index.php?docs-master-docs&catid={$catid}&page={$page}{$u}"
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

	private function index()
	{
		$search = $this->ev->get('search');
		$catid = intval($this->ev->get('catid'));
		$page = intval($this->ev->get('page'));
		$page = $page?$page:1;
		if(!$catid)$catid = $search['doccatid'];
		$categories = $this->category->getAllCategory();
		$parentcat = $this->category->getCategoriesByArgs(array(array("AND","catparent = 0"),array("AND","catapp = 'docs'")));
		if($catid)
		{
			$childstring = $this->category->getChildCategoryString($catid);
			$args = array(array("AND","find_in_set(doccatid,:doccatid)",'doccatid',$childstring));
		}
		else $args = array();
		if($search['docid'])
		{
			$args[] = array("AND","docid = :docid",'docid',$search['docid']);
		}
		else
		{
			if($search['doccatid'])$args[] = array("AND","doccatid = :doccatid",'doccatid',$search['doccatid']);
			if($search['stime'])$args[] = array("AND","docinputtime >= :sdocinputtime",'sdocinputtime',strtotime($search['stime']));
			if($search['etime'])$args[] = array("AND","docinputtime <= :edocinputtime",'edocinputtime',strtotime($search['etime']));
			if($search['keyword'])$args[] = array("AND","doctitle LIKE :doctitle",'doctitle',"%{$search['keyword']}%");
            if($search['docneedmore'])
            {
                if($search['docneedmore'] == '-1')$nm = 0;
                else $nm = 1;
                $args[] = array("AND","docneedmore = :docneedmore",'docneedmore',$nm);
            }
            if($search['docistop'])
            {
                if($search['docistop'] == '-1')$top = 0;
                else $top = 1;
                $args[] = array("AND","docistop = :docistop",'docistop',$top);
            }
            if($search['docsyslock'])
            {
                if($search['docsyslock'] == '-1')$lock = 0;
                else $lock = 1;
                $args[] = array("AND","docsyslock = :docsyslock",'docsyslock',$lock);
            }
		}
        $catlevel = 1;
        if($catid)
        {
            $pos = $this->category->getCategoryPos($catid);
            if(count($pos))
                $catlevel = count($pos) + 1;
        }
        $this->tpl->assign('catlevel',$catlevel);
		$docs = $this->doc->getDocList($args,$page,10);
		$this->tpl->assign('catid',$catid);
		$this->tpl->assign('docs',$docs);
		$this->tpl->assign('parentcat',$parentcat);
		$this->tpl->assign('categories',$categories);
		$this->tpl->assign('page',$page);
		$this->tpl->display('docs');
	}
}


?>
