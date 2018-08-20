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

	private function setCurrentBasic()
	{
		$basicid = $this->ev->get('basicid');
		if($this->data['openbasics'][$basicid])
		{
			$this->session->setSessionValue(array('sessioncurrent'=>$basicid));
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => 'forward',
			    "forwardUrl" => "index.php?exam-app-basics"
			);
		}
		else
		{
			$message = array(
				'statusCode' => 200,
				"message" => "您尚未开通本考场，系统将引导您开通",
			    "callbackType" => 'forward',
			    "forwardUrl" => "index.php?exam-app-basics-detail&basicid=".$basicid
			);
		}
		$this->G->R($message);
	}

	private function ajax()
	{
		switch($this->ev->url(4))
		{
			//根据章节获取知识点信息
			case 'getknowsbysectionid':
			$sectionid = $this->ev->get('sectionid');
			$knowsids = trim(implode(",",$this->data['currentbasic']['basicknows'][$sectionid]),", ");
			$aknows = $this->section->getKnowsListByArgs(array(array("AND","find_in_set(knowsid,:knowsid)",'knowsid',$knowsids),array("AND","knowsstatus = 1")));
			if($sectionid)
			$data = '<option value="0">选择知识点</option>'."\n";
			else
			$data = '<option value="0">请先选择章节</option>'."\n";
			foreach($aknows as $knows)
			{
				$data .= '<option value="'.$knows['knowsid'].'">'.$knows['knows'].'</option>'."\n";
			}
			exit($data);
			break;

			//获取剩余时间
			case 'lefttime':
			$sessionvars = $this->exam->getExamSessionBySessionid();
			$lefttime = TIME - $sessionvars['examsessionstarttime'];
			if($lefttime < 0 )$lefttime = 0;
			exit("{$lefttime}");
			break;

			//根据科目获取章节信息
			case 'getsectionsbysubjectid':
			$esid = $this->ev->get('subjectid');
			$knowsids = trim(implode(",",$this->data['currentbasic']['basicknows'][$sectionid]),", ");
			$aknows = $this->section->getSectionListByArgs(array(array("AND","sectionsubjectid = :sectionsubjectid",'sectionsubjectid',$esid)));
			$data = array(array(0,'选择章节'));
			foreach($aknows as $knows)
			{
				$data[] = array($knows['sectionid'],$knows['section']);
			}
			exit(json_encode($data));
			break;

			//标注题目
			case 'sign':
			$questionid = intval($this->ev->get('questionid'));
			$url = $this->G->make('strings')->destr($this->ev->get('url'));
			$sessionvars = $this->exam->getExamSessionBySessionid();
			$args['examsessionsign'] = $sessionvars['examsessionsign'];
			if($questionid && !$args['examsessionsign'][$questionid])
			{
				$args['examsessionsign'][$questionid] = 1;
				$args['examsessionsign'] = $args['examsessionsign'];
				$this->exam->modifyExamSession($args);
				exit('1');
			}
			else
			{
				unset($args['examsessionsign'][$questionid]);
				$args['examsessionsign'] = $args['examsessionsign'];
				$this->exam->modifyExamSession($args);
				exit('2');
			}
			break;

			default:
		}
	}

	private function index()
	{
		$this->tpl->assign('basics',$this->data['openbasics']);
		$this->tpl->display('index');
	}
}


?>
