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

    private function lists()
    {
        $this->pg->isPhone = 1;
        $this->pg->target = 'class="ajax" data-target="courselists" data-page="courselists" ';
    	$catids = array();
        $catids['index'] = $this->category->getCategoriesByArgs(array(array("AND","catindex > 0")));
        $contents = array();
        if($catids['index'])
        {
            foreach($catids['index'] as $p)
            {
                $catstring = $this->category->getChildCategoryString($p['catid']);
                $contents[$p['catid']] = $this->course->getCourseList(array(array("AND","find_in_set(cscatid,:catstring)",'catstring',$catstring)),1,$p['catindex']?$p['catindex']:12);
            }
        }
        $this->tpl->assign('catids',$catids['index']);
        $this->tpl->assign('contents',$contents);
        $this->tpl->display('index_lists');
    }

    private function index()
    {
        $this->pg->isPhone = 1;
        $this->pg->target = 'class="ajax" data-target="course" data-page="course" ';
    	$page = $this->ev->get('page');
        $contents = $this->course->getOpenCourseListByUserid($this->_user['sessionuserid'],$page);
        $this->tpl->assign('contents',$contents);
        $this->tpl->assign('page',$page);
        $this->tpl->display('index');
    }
}


?>
