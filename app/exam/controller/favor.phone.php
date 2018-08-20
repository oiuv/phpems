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

	private function ajax()
	{
		switch($this->ev->url(4))
		{
			//添加一个收藏
			case 'addfavor':
			$questionid = $this->ev->get('questionid');
			if(!is_numeric($questionid))
			{
				$message = array(
					'statusCode' => 300,
					"message" => "即时组卷试题不能收藏！"
				);
			}
			if($this->favor->getFavorByQuestionAndUserId($questionid,$this->_user['sessionuserid']))
			{
				$message = array(
					'statusCode' => 200,
					"message" => "收藏成功！"
				);
			}
			else
			{
				$this->favor->favorQuestion($questionid,$this->_user['sessionuserid'],$this->data['currentbasic']['basicsubjectid']);
				$message = array(
					'statusCode' => 200,
					"message" => "收藏成功！"
				);
			}
			$this->G->R($message);
			break;

			//删除一个收藏
			case 'delfavor':
			$favorid = $this->ev->get('questionid');
			$this->favor->delFavorById($favorid);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => 'forward',
			    "forwardUrl" => "reload"
			);
			$this->G->R($message);
			break;

			default:
			break;
		}
	}

	private function index()
	{
		$page = $this->ev->get('page');
		$type = $this->ev->get('type');
		$search = $this->ev->get('search');
		$this->pg->isPhone = 1;
		$this->pg->target = 'class="ajax" data-target="favor" data-page="favor" ';
		$tmp = $this->section->getKnowsListByArgs(array(array("AND","knowssectionid = :knowssectionid",'knowssectionid',$search['sectionid']),array("AND","knowsstatus = 1")));
		if($search['sectionid'] && !$search['knowsid'])
		{
			$search['knowsid'] = '';
			if(is_array($tmp))
			{
				foreach($tmp as $p)
				$search['knowsid'] .= $p['knowsid'].",";
			}
		}
		$search['knowsid'] = trim($search['knowsid']," ,");
		$page = $page > 0?$page:1;
		$args = array(array("AND","favorsubjectid = :favorsubjectid",'favorsubjectid',$this->data['currentbasic']['basicsubjectid']),array("AND","favoruserid = :favoruserid",'favoruserid',$this->_user['sessionuserid']));
		if($search['knowsid'])$args[] = array("AND","quest2knows.qkknowsid IN (:qkknowsid)",'qkknowsid',$search['knowsid']);
		if($type)
		{
			if($search['questype'])$args[] = array("AND","questionrows.qrtype = :qrtype",'qrtype',$search['questype']);
			$favors = $this->favor->getFavorListByUserid($page,20,$args,1);
		}
		else
		{
			if($search['questype'])$args[] = array("AND","questions.questiontype = :questiontype",'questiontype',$search['questype']);
			$favors = $this->favor->getFavorListByUserid($page,20,$args);
		}
		$sections = $this->section->getSectionListByArgs(array("AND","sectionsubjectid = :sectionsubjectid",'sectionsubjectid',$this->_user['sessioncurrent']));
		$questype = $this->basic->getQuestypeList();
		$this->tpl->assign('sections',$sections);
		$this->tpl->assign('questype',$questype);
		$this->tpl->assign('search',$search);
		$this->tpl->assign('knowsids',$tmp);
		$this->tpl->assign('page',$page);
		$this->tpl->assign('type',$type);
		$this->tpl->assign('favors',$favors);
		$this->tpl->display('favor');
	}
}


?>
