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

    private function history()
	{
        $docid = $this->ev->get('docid');
        $page = $this->ev->get('page');
        $doc = $this->doc->getDocById($docid,false);
        $args = array();
        $args[] = array("AND","dhstatus = 1");
        $args[] = array("AND","dhdocid = :dhdocid","dhdocid",$docid);
        $histories = $this->doc->getDocHistoryListByArgs($args,$page);
        $this->tpl->assign('doc',$doc);
        $this->tpl->assign('histories',$histories);
		$this->tpl->display('history');
	}

    private function viewhistory()
	{
        $dhid = $this->ev->get('dhid');
        $history = $this->doc->getDocHistroyById($dhid);
        $doc = $this->doc->getDocById($history['dhdocid']);
        $doc['content'] = $history;
        $this->tpl->assign('doc',$doc);
        $this->tpl->display('history_view');
    }

	private function index()
	{
		$docid = $this->ev->get('docid');
		$doc = $this->doc->getDocById($docid);
		$catbread = $this->category->getCategoryPos($doc['doccatid']);
		$cat = $this->category->getCategoryById($doc['doccatid']);
		$template = 'doc_default';
		$this->tpl->assign('cat',$cat);
		$this->tpl->assign('catbread',$catbread);
		$this->tpl->assign('doc',$doc);
		$this->tpl->display($template);
	}
}


?>
