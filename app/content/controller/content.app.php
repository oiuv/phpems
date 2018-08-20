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
		$contentid = $this->ev->get('contentid');
		$content = $this->content->getContentById($contentid);
		if($content['contentlink'])header("location:".html_entity_decode($content['contentlink'])."");
		else
		{
			$catbread = $this->category->getCategoryPos($content['contentcatid']);
			$cat = $this->category->getCategoryById($content['contentcatid']);
			$catbrother = $this->category->getCategoriesByArgs(array(array('AND',"catparent = :catparent",'catparent',$cat['catparent']),array('AND',"catinmenu = '0'")));
			if($content['contenttemplate'])$template = $content['contenttemplate'];
			else $template = 'content_default';
			$nearContent = $this->content->getNearContentById($contentid,$content['contentcatid']);
			if(!$template)$template = 'content_default';
			$this->tpl->assign('cat',$cat);
			$this->tpl->assign('nearContent',$nearContent);
			$this->tpl->assign('page',$page);
			$this->tpl->assign('catbread',$catbread);
			$this->tpl->assign('content',$content);
			$this->tpl->assign('catbrother',$catbrother);
			$this->tpl->display($template);
		}
	}
}


?>
