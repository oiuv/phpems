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

	private function getActorsByModule()
	{
		$moduleid = $this->ev->get('moduleid');
		$actors = $this->user->getGroupsByModuleid($moduleid);
		foreach($actors as $actor)
		{
			echo '<option value="'.$actor['groupid'].'">'.$actor['groupname'].'</option>';
		}
	}

	private function index()
	{
		//
	}
}


?>
