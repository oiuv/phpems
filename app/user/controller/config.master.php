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
		$appid = 'user';
		if($this->ev->get('appconfig'))
		{
			$args = $this->ev->get('args');
			$args['appsetting'] = $args['appsetting'];
			$app = $this->apps->getApp($appid);
			if($app)
			{
				$this->apps->modifyApp($appid,$args);
			}
			else
			{
				$this->apps->addApp($appid,$args);
			}
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功，正在转入目标页面",
			    "callbackType" => 'forward',
			    "forwardUrl" => "reload"
			);
			exit(json_encode($message));
		}
		else
		{
			$app = $this->apps->getApp($appid);
			$this->tpl->assign('appid',$appid);
			$this->tpl->assign('app',$app);
			$this->tpl->display('config');
		}
	}
}


?>
