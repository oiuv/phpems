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
		$keyword = $this->ev->get('keyword');
		$contents = $this->content->getContentList(array(array("AND","contenttitle LIKE :contenttitle",'contenttitle',"%{$keyword}%")),$page);
		$this->tpl->assign('page',$page);
		$this->tpl->assign('contents',$contents);
		$this->tpl->display('search_default');
	}
}


?>
