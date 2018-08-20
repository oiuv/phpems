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
		$catid = $this->ev->get('catid');
		$cat = $this->category->getCategoryById($catid);
		$catbread = $this->category->getCategoryPos($catid);
		$catstring = $this->category->getChildCategoryString($catid);
		$catchildren = $this->category->getCategoriesByArgs(array(array('AND',"catparent = :catparent",'catparent',$catid),array('AND',"catinmenu = '0'")));
		$contents = $this->course->getCourseList(array(array("AND","find_in_set(cscatid,:cscatid)",'cscatid',$catstring)),$page);
		$catbrother = $this->category->getCategoriesByArgs(array(array('AND',"catparent = :catparent",'catparent',$cat['catparent']),array('AND',"catinmenu = '0'")));
		if($cat['cattpl'])$template = $cat['cattpl'];
		else $template = 'category_default';
		$this->tpl->assign('cat',$cat);
		$this->tpl->assign('page',$page);
		$this->tpl->assign('catbrother',$catbrother);
		$this->tpl->assign('catchildren',$catchildren);
		$this->tpl->assign('catbread',$catbread);
		$this->tpl->assign('contents',$contents);
		$this->tpl->display($template);
	}
}


?>
