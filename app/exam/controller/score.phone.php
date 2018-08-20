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
		$page = $page < 1?1:$page;
		$this->pg->isPhone = 1;
		$this->pg->target = 'class="ajax" data-target="scores" data-page="scores" ';
		$s = $this->favor->getUserTopScore($this->data['currentbasic']['basicid'],$this->_user['sessionuserid']);
		$scores = $this->favor->getExamScoreListByBasicId($this->data['currentbasic']['basicid'],$page);
		$this->tpl->assign('s',$s);
		$this->tpl->assign('page',$page);
		$this->tpl->assign('scores',$scores);
		$this->tpl->display('scores');
	}
}


?>
