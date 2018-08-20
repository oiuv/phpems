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

	private function modify()
	{
		$page = $this->ev->get('page');
		if($this->ev->get('modifyblock'))
		{
			$blockid = $this->ev->get('blockid');
			$args = $this->ev->get('args');
			$args['blockcontent'] = $args['blockcontent'];
			unset($args['blocktype']);
			$this->block->modifyBlock($blockid,$args);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "target" => "",
			    "rel" => "",
			    "callbackType" => "forward",
			    "forwardUrl" => "index.php?content-master-blocks&page={$page}"
			);
			exit(json_encode($message));
		}
		else
		{
			$blockid = $this->ev->get('blockid');
			$block = $this->block->getBlockById($blockid);
			$block['blockcontent'] = $this->ev->stripSlashes($block['blockcontent']);
			$apps = $this->apps->getAppList();
			$blockapps = array();
			foreach($apps as $id => $app)
			{
				$tmp = $this->G->make('api',$app['appid']);
				if($tmp && method_exists($tmp,'parseBlock'))
				$blockapps[$id] = $app;
			}
			$this->tpl->assign('block',$block);
			$this->tpl->assign('blockapps',$blockapps);
			$this->tpl->assign('page',$page);
			$this->tpl->display('blocks_modify');
		}
	}

	private function add()
	{
		if($this->ev->get('addblock'))
		{
			$args = $this->ev->get('args');
			$args['blockcontent'] = $args['blockcontent'];
			$this->block->addBlock($args);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "target" => "",
			    "rel" => "",
			    "callbackType" => "forward",
			    "forwardUrl" => "index.php?content-master-blocks"
			);
			exit(json_encode($message));
		}
		else
		{
			$apps = $this->apps->getAppList();
			$blockapps = array();
			foreach($apps as $id => $app)
			{
				$tmp = $this->G->make('api',$app['appid']);
				if($tmp && method_exists($tmp,'parseBlock'))
				$blockapps[$id] = $app;
			}
			$this->tpl->assign('blockapps',$blockapps);
			$this->tpl->display('blocks_add');
		}
	}

	private function del()
	{
		$blockid = $this->ev->get('blockid');
		$this->block->delBlock($blockid);
		$message = array(
			'statusCode' => 200,
			"message" => "操作成功",
		    "target" => "",
		    "rel" => "",
		    "callbackType" => "forward",
		    "forwardUrl" => "index.php?content-master-blocks&page={$page}"
		);
		exit(json_encode($message));
	}

	private function change()
	{
		$blockid = $this->ev->get('blockid');
		$blocktype = $this->ev->get('blocktype');
		$this->block->modifyBlock($blockid,array('blocktype' => $blocktype));
		$message = array(
			'statusCode' => 200,
			"message" => "操作成功",
		    "target" => "",
		    "rel" => "",
		    "callbackType" => "forward",
		    "forwardUrl" => "index.php?content-master-blocks&page={$page}"
		);
		exit(json_encode($message));
	}

	private function index()
	{
		$page = $this->ev->get('page');
		$blocks = $this->block->getBlockList(1,$page,10);
		$this->tpl->assign('blocks',$blocks);
		$this->tpl->assign('page',$page);
		$this->tpl->display('blocks');
	}
}


?>
