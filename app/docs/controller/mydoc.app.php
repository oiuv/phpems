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
        $this->_user = $this->session->getSessionUser();
        if(!$this->_user['sessionuserid'])
        {
            if($this->ev->get('userhash'))
                exit(json_encode(array(
                    'statusCode' => 301,
                    "message" => "请您重新登录",
                    "callbackType" => 'forward',
                    "forwardUrl" => "index.php?user-app-login"
                )));
            else
            {
                header("location:index.php?user-app-login");
                exit;
            }
        }
		$action = $this->ev->url(3);
		if(!method_exists($this,$action))
		$action = "index";
		$this->$action();
		exit;
	}

    private function history()
	{
        $docid = $this->ev->get('docid');
        $page = $this->ev->get('page');
        $doc = $this->doc->getDocById($docid,false);
        $args = array();
        $args[] = array("AND","dhdocid = :dhdocid","dhdocid",$docid);
        $args[] = array("AND","dhusername = :dhusername","dhusername",$this->_user['sessionusername']);
        $histories = $this->doc->getDocHistoryListByArgs($args,$page);
        $this->tpl->assign('doc',$doc);
        $this->tpl->assign('histories',$histories);
		$this->tpl->display('mydoc_history');
	}

    private function edit()
	{
        $docid = $this->ev->get('docid');
        $args = array();
        $args[] = array("AND","dhstatus = 0");
        $args[] = array("AND","dhdocid = :dhdocid","dhdocid",$docid);
        $args[] = array("AND","dhusername = :dhusername","dhusername",$this->_user['sessionusername']);
        $history = $this->doc->getDocHistoryByArgs($args);
        if($this->ev->get('submit'))
		{
			$args = $this->ev->get('args');
			if($history)
			{
				$args['dhtime'] = TIME;
                $this->doc->modifyDocHistory($history['dhid'],$args);
			}
			else
			{
				$args['dhdocid'] = $docid;
                $args['dhtime'] = TIME;
                $args['dhusername'] = $this->_user['sessionusername'];
                $this->doc->addDocHistory($args);
			}
            $message = array(
                'statusCode' => 200,
                "message" => "操作成功,请等待管理员审核",
                "callbackType" => "forward",
                "forwardUrl" => "index.php?docs-app-docs&docid={$docid}"
            );
            exit(json_encode($message));
		}
		else
		{
			if($history)
			{
				$doc = $this->doc->getDocById($docid,false);
				$doc['content'] = $history;
			}
			else
			{
				$doc = $this->doc->getDocById($docid);
				$doc['content']['dhtitle'] = '';
			}
			$this->tpl->assign('history',$history);
			$this->tpl->assign('doc',$doc);
			$this->tpl->display('mydoc_edit');
        }
    }

	private function index()
	{
		$docid = $this->ev->get('docid');
		$doc = $this->doc->getDocById($docid);
		$catbread = $this->category->getCategoryPos($doc['doccatid']);
		$cat = $this->category->getCategoryById($doc['doccatid']);
		$this->tpl->assign('cat',$cat);
		$this->tpl->assign('catbread',$catbread);
		$this->tpl->assign('doc',$doc);
		$this->tpl->display('mydoc');
	}
}


?>
