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
		$page = intval($this->ev->get('page'));
		$args = array();
		$args[] = array("AND","cequserid = :cequserid","cequserid",$this->_user['sessionuserid']);
		$certificates = $this->ce->getCeQueueList($args,$page,10);
		$this->tpl->assign('certificates',$certificates);
		$this->tpl->assign('status',array('申请中','已受理','已出证','申请被驳回'));
		$this->tpl->assign('page',$page);
		$this->tpl->display('index');
	}
}


?>
