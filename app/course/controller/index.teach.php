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

	private function getajaxbasiclist()
	{
		$subjectid = $this->ev->get('subjectid');
		$current = $this->ev->get('current');
		$basics = $this->basic->getBasicsByArgs(array(array("AND","basicsubjectid = :basicsubjectid",'basicsubjectid',$subjectid)));
		if($basics)
		{
			foreach($basics as $basic)
			{
				if($current == $basic['basicid'])
				echo "<option value=\"{$basic['basicid']}\" selected>{$basic['basic']}</option>";
				else
				echo "<option value=\"{$basic['basicid']}\">{$basic['basic']}</option>";
			}
		}
		else
		echo "<option value=\"\">请先选择科目</option>";
	}

	private function index()
	{
		header("location:index.php?course-teach-course");
		exit;
		//$this->tpl->display('index');
	}
}


?>
