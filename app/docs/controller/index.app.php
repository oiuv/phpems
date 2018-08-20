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
		if($this->ev->isMobile())
		{
			header("location:index.php?content-phone");
			exit;
		}
		$action = $this->ev->url(3);
		if(!method_exists($this,$action))
		$action = "index";
		$this->$action();
		exit;
	}

	private function index()
	{
        $number = array();
        $number['more'] = $this->doc->getDocNumber(array(array("AND","docneedmore = 1")));
        $number['all'] = $this->doc->getDocNumber(array());
		$docs = array();
        $args = array();
        $args[] = array("AND","docneedmore = 0");
        $docs['new'] = $this->doc->getDocList($args,1,10);
        $args = array();
        $args[] = array("AND","docneedmore = 1");
        $docs['more'] = $this->doc->getDocList($args,1,10);
        $args = array();
        $args[] = array("AND","docistop = 1");
        $docs['top'] = $this->doc->getDocList($args,1,4);
		$this->category->getAllCategory();
        $this->tpl->assign('categories',$this->category->tidycategories);
        $this->tpl->assign('number',$number);
        $this->tpl->assign('docs',$docs);
        $this->tpl->display('index');
	}
}


?>
