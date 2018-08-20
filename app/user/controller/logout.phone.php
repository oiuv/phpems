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
		$this->session->clearSessionUser();
		$message = array(
			'statusCode' => 201,
			"message" => "操作成功",
            "callbackType" => 'forward',
            "forwardUrl" => "index.php"
		);
		$this->G->R($message);
	}
}


?>
