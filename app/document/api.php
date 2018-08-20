<?php

class app
{
	public $G;
	private $sc = 'testSys&dongao';

	public function __construct(&$G)
	{
		$this->G = $G;
		$this->ev = $this->G->make('ev');
		$this->files = $this->G->make('files');
		$this->session = $this->G->make('session');
		$this->user = $this->G->make('user','user');
		$this->apps = $this->G->make('apps','core');
		$_user = $this->_user = $this->session->getSessionUser();
		$group = $this->user->getGroupById($_user['sessiongroupid']);
		if(!$_user['sessionuserid'])
		{
			if($this->ev->get('userhash'))
			exit(json_encode(array(
				'statusCode' => 300,
				"message" => "请您重新登录",
			    "callbackType" => 'forward',
			    "forwardUrl" => "index.php?user-app-login"
			)));
			else
			{
				print_r($_user);
				exit();
				//header("location:index.php?user-app-login");
				exit;
			}
		}
		$this->attach = $this->G->make('attach','document');
		$this->allowexts = $this->attach->getAllowAttachExts();
		//$this->allowexts = array('zip','jpg','rar','png','gif','mp3','mp4','ogg','webm');
	}
}

?>