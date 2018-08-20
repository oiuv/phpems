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
		$subjects = $this->basic->getSubjectList();
		$this->tpl->assign('subjects',$subjects);
		if(!method_exists($this,$action))
		$action = "index";
		$this->$action();
		exit;
	}

	private function selectmember()
	{
		$page = intval($this->ev->get('page'));
		$courseid = intval($this->ev->get('courseid'));
		$course = $this->course->getCourseById($courseid);
		$search = $this->ev->get('search');
		$u = '';
		if($search)
		{
			foreach($search as $key => $arg)
			{
				$u .= "&search[{$key}]={$arg}";
			}
		}
		if($this->ev->get('submit'))
		{
			$userids = $this->ev->get('delids');
			$days = $this->ev->get('days');
			if($userids && $days)
			{
				foreach($userids as $userid => $p)
				{
					$this->course->openCourse(array('ocuserid'=>$userid,'occourseid'=>$courseid,'ocendtime' => TIME + $days*24*3600));
				}
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功",
					"callbackType" => "forward",
			    	"forwardUrl" => "index.php?course-master-course-members&courseid=".$courseid
				);
			}
			else
			{
				$message = array(
					'statusCode' => 300,
					"message" => "操作失败"
				);
			}
			exit(json_encode($message));
		}
		else
		{
			$args = array();
			if($search['userid'])$args[] = array('AND',"userid = :userid",'userid',$search['userid']);
			if($search['username'])$args[] = array('AND',"username LIKE :username",'username','%'.$search['username'].'%');
			if($search['useremail'])$args[] = array('AND',"useremail  LIKE :useremail",'useremail','%'.$search['useremail'].'%');
			if($search['groupid'])$args[] = array('AND',"usergroupid = :usergroupid",'usergroupid',$search['groupid']);
			if($search['stime'] || $search['etime'])
			{
				if(!is_array($args))$args = array();
				if($search['stime']){
					$stime = strtotime($search['stime']);
					$args[] = array('AND',"userregtime >= :userregtime",'userregtime',$stime);
				}
				if($search['etime']){
					$etime = strtotime($search['etime']);
					$args[] = array('AND',"userregtime <= :userregtime",'userregtime',$etime);
				}
			}
			$users = $this->user->getUserList($page,10,$args);
			$this->tpl->assign('course',$course);
			$this->tpl->assign('users',$users);
			$this->tpl->assign('search',$search);
			$this->tpl->assign('u',$u);
			$this->tpl->assign('page',$page);
			$this->tpl->display('course_selectmember');
		}
	}

	private function add()
	{
		if($this->ev->get('submit'))
		{
			$args = $this->ev->get('args');
			$args['csuserid'] = $this->_user['sessionuserid'];
			$args['cstime'] = TIME;
			$id = $this->course->addCourse($args);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => "forward",
			    "forwardUrl" => "index.php?course-master-course&catid={$args['cscatid']}"
			);
			exit(json_encode($message));
		}
		else
		{
			$catid = intval($this->ev->get('catid'));
			$parentcat = $this->category->getCategoriesByArgs(array(array("AND","catparent = 0")));
			$this->tpl->assign('parentcat',$parentcat);
			$this->tpl->assign('catid',$catid);
			$this->tpl->display('course_add');
		}
	}

	private function edit()
	{
		$page = intval($this->ev->get('page'));
		$courseid = intval($this->ev->get('courseid'));
		$course = $this->course->getCourseById($courseid);
		if($this->ev->get('submit'))
		{
			$args = $this->ev->get('args');
			$this->course->modifyCourse($courseid,$args);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => "forward",
			    "forwardUrl" => "index.php?course-master-course&catid={$course['cscatid']}&page={$page}{$u}"
			);
			$this->G->R($message);
		}
		else
		{
			$catid = intval($this->ev->get('catid'));
			$cat = $this->category->getCategoryById($catid);
			$parentcat = $this->category->getCategoriesByArgs(array(array("AND","catparent = 0")));
			$teachers = $this->user->getUsersByArgs(array(array("AND","groupmoduleid = 12"),array("AND","usergroupid = groupid")));
            $this->tpl->assign('teachers',$teachers);
			$this->tpl->assign('parentcat',$parentcat);
			$this->tpl->assign('catid',$catid);
			$this->tpl->assign('cat',$cat);
			$this->tpl->assign('courseid',$courseid);
			$this->tpl->assign('course',$course);
			$this->tpl->assign('page',$page);
			$this->tpl->display('course_edit');
		}
	}

	private function del()
	{
		$page = intval($this->ev->get('page'));
		$courseid = intval($this->ev->get('courseid'));
		$number = $this->content->getCourseContentNumber($courseid);
		if(!$number)
		{
			$this->course->delCourse($courseid);
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
			    "callbackType" => "forward",
			    "forwardUrl" => "reload"
			);
		}
		else
		{
			$message = array(
				'statusCode' => 300,
				"message" => "操作失败，请先删除本课程下所有课件"
			);
		}
		$this->G->R($message);
	}

	private function addmember()
	{
		$courseid = $this->ev->get('courseid');
		$this->tpl->assign('courseid',$courseid);
		if($this->ev->get('addmember'))
		{
			$userids = $this->ev->get('userids');
			$usernames = $this->ev->get('usernames');
			$usergroupids = $this->ev->get('usergroupids');
			$days = $this->ev->get('days');
			if($userids && $days)
			{
				$userids = explode(",",$userids);
				foreach($userids as $userid)
				{
					$this->course->openCourse(array('ocuserid'=>$userid,'occourseid'=>$courseid,'ocendtime' => TIME + $days*24*3600));
				}
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功",
					"callbackType" => "forward",
			    	"forwardUrl" => "index.php?course-master-course-members&courseid=".$courseid
				);
			}
			elseif($usernames && $days)
			{
				$usernames = implode(",",array_unique(explode(",",$usernames)));
				$userids = $this->user->getUsersByArgs(array(array("AND","find_in_set(username,:username)",'username',$usernames),array("AND","user.usergroupid = user_group.groupid")),false,false,false);
				foreach($userids as $user)
				{
					$this->course->openCourse(array('ocuserid'=>$user['userid'],'occourseid'=>$courseid,'ocendtime' => TIME + $days*24*3600));
				}
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功",
					"callbackType" => "forward",
			    	"forwardUrl" => "index.php?course-master-course-members&courseid=".$courseid
				);
			}
			elseif($usergroupids && $days)
			{
				$usergroupids = implode(",",array_unique(explode(",",$usergroupids)));
				$userids = $this->user->getUsersByArgs(array(array("AND","find_in_set(usergroupid,:usergroupid)",'usergroupid',$usergroupids),array("AND","user.usergroupid = user_group.groupid")),false,false,false);
				foreach($userids as $user)
				{
					$this->course->openCourse(array('ocuserid'=>$user['userid'],'occourseid'=>$courseid,'ocendtime' => TIME + $days*24*3600));
				}
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功",
					"callbackType" => "forward",
			    	"forwardUrl" => "index.php?course-master-course-members&courseid=".$courseid
				);
			}
			else
			{
				$message = array(
					'statusCode' => 300,
					"message" => "参数错误"
				);
			}
			$this->G->R($message);
		}
		else
		{
			$this->tpl->display('course_addmember');
		}
	}

	private function getcoursemembernumber()
	{
		$courseid = $this->ev->get('courseid');
		$number = $this->course->getOpenCourseNumber($courseid);
		echo intval($number);
	}

	private function members()
	{
		$courseid = $this->ev->get('courseid');
		$search = $this->ev->get('search');
		$page = $this->ev->get('page');
		$args = array();
		$args[] = array("AND",'opencourse.occourseid = :occourseid','occourseid',$courseid);
		$args[] = array("AND",'opencourse.ocendtime >= :ocendtime','ocendtime',TIME);
		if($search['userid'])
		{
			$args[] = array("AND",'user.userid = :userid','userid',$search['userid']);
		}
		if($search['username'])
		{
			$args[] = array("AND",'user.username LIKE :username','username','%'.$search['username'].'%');
		}
		$members = $this->course->getOpenCourseMember($args,$page);
		$course = $this->course->getCourseById($courseid);
		$this->tpl->assign('search',$search);
		$this->tpl->assign('courseid',$courseid);
		$this->tpl->assign('course',$course);
		$this->tpl->assign('members',$members);
		$this->tpl->assign('page',$page);
		$this->tpl->display('course_members');
	}

	private function lite()
	{
		$catid = $this->ev->get('catid');
		$page = $this->ev->get('page');
		$this->tpl->assign('catid',$catid);
		$this->tpl->assign('page',$page);
		if($this->ev->get('modifycoursesequence'))
		{
			if($this->ev->get('action') == 'delete')
			{
				$ids = $this->ev->get('delids');
				foreach($ids as $key => $id)
				{
					$number = $this->content->getCourseContentNumber($key);
					if(!$number)
					$this->course->delCourse($key);
				}
			}
			elseif($this->ev->get('action') == 'movecategory')
			{
				$courseids = array();
				$ids = $this->ev->get('delids');
				foreach($ids as $key => $id)
				{
					if($key)$courseids[] = $key;
				}
				$courseids = implode(',',$courseids);
				$parentcat = $this->category->getCategoriesByArgs(array(array("AND","catparent = 0")));
				$this->tpl->assign('parentcat',$parentcat);
				$this->tpl->assign('courseids',$courseids);
				$this->tpl->display('course_move');
				exit;
			}
			else
			{
				$ids = $this->ev->get('ids');
				foreach($ids as $key => $id)
				{
					$this->course->modifyBasciCourse($key,array('cssequence' => $id));
				}
			}
			$message = array(
				'statusCode' => 200,
				"message" => "操作成功",
				"callbackType" => "forward",
			    "forwardUrl" => "reload"
			);
			exit(json_encode($message));
		}
		elseif($this->ev->get('movecategory'))
		{
			$courseids = explode(',',$this->ev->get('courseids'));
			$targetcatid = $this->ev->get('targetcatid');
			if($targetcatid)
			{
				foreach($courseids as $key => $id)
				{
					if($id)$this->course->modifyBasciCourse($id,array('cscatid' => $targetcatid));
				}
				$message = array(
					'statusCode' => 200,
					"message" => "操作成功",
					"callbackType" => "forward",
				    "forwardUrl" => "index.php?course-master-course&catid={$catid}&page={$page}{$u}"
				);
			}
			else
			$message = array(
				'statusCode' => 300,
				"message" => "操作失败"
			);
			exit(json_encode($message));
		}
		else
		{
			$message = array(
				'statusCode' => 300,
				"message" => "无效访问"
			);
			exit(json_encode($message));
		}
	}

	private function index()
	{
		$search = $this->ev->get('search');
		$catid = intval($this->ev->get('catid'));
		if(!$catid)$catid = $search['cscatid'];
		$page = $this->ev->get('page');
		$page = $page?$page:1;
		$categories = $this->category->getAllCategory();
		$parentcat = $this->category->getCategoriesByArgs(array(array("AND","catparent = 0"),array("AND","catapp = 'course'")));
		if($catid)
		{
			$childstring = $this->category->getChildCategoryString($catid);
			$args = array(array("AND","find_in_set(cscatid,:cscatid)",'cscatid',$childstring));
		}
		else $args = array();
        //$args[] = array("AND","csteacher = :csteacher","csteacher",$this->_user['username']);
        $args[] = array("AND","find_in_set(cssubjectid,:cssubjectid)","cssubjectid",$this->teachsubjects);
		if($search['courseid'])
		{
			$args[] = array("AND","csid = :csid",'csid',$search['courseid']);
		}
		else
		{
			if($search['stime'])$args[] = array("AND","cstime >= :csstime",'csstime',strtotime($search['stime']));
			if($search['etime'])$args[] = array("AND","cstime <= :csetime",'csetime',strtotime($search['etime']));
			if($search['keyword'])$args[] = array("AND","cstitle LIKE :cstitle",'cstitle',"%{$search['keyword']}%");
			if($search['username'])
			{
				$user = $this->user->getUserByUserName($search['username']);
				$args[] = array("AND","csuserid = :csuserid",'csuserid',$user['userid']);
			}
		}
		$courses = $this->course->getCourseList($args,$page,10);
		$this->tpl->assign('page',$page);
		$this->tpl->assign('catid',$catid);
		$this->tpl->assign('courses',$courses);
		$this->tpl->assign('categories',$categories);
		$this->tpl->assign('parentcat',$parentcat);
		$this->tpl->display('course');
	}
}


?>
