<?php

/*
 * This file is part of the phpems/phpems.
 *
 * (c) oiuv <i@oiuv.cn>
 *
 * 项目维护：oiuv(QQ:7300637) | 定制服务：火眼(QQ:278768688)
 *
 * This source file is subject to the MIT license that is bundled.
 */

class action extends app
{
    public function display()
    {
        $action = $this->ev->url(3);
        $subjects = $this->basic->getSubjectList();
        $this->tpl->assign('subjects', $subjects);
        if (!method_exists($this, $action)) {
            $action = 'index';
        }
        $this->$action();
        exit;
    }

    private function catsmenu()
    {
        $catid = $this->ev->get('catid');
        $categories = $this->category->getAllCategory();
        $r = [];
        $this->category->selected = $catid;
        $this->category->hrefpre = 'index.php?course-master-course&catid=';
        $this->category->levelCategory($r, 0, $this->category->tidycategories);
        $this->category->resetCategoryIndex($r);
        echo 'var treeData = '.json_encode($r);
        exit();
    }

    public function delopen()
    {
        $ocid = $this->ev->get('ocid');
        $this->course->delOpenCourse($ocid);
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => 'reload',
        ];
        exit(json_encode($message));
    }

    private function selectmember()
    {
        $page = intval($this->ev->get('page'));
        $courseid = intval($this->ev->get('courseid'));
        $course = $this->course->getCourseById($courseid);
        $search = $this->ev->get('search');
        $u = '';
        if ($search) {
            foreach ($search as $key => $arg) {
                $u .= "&search[{$key}]={$arg}";
            }
        }
        if ($this->ev->get('submit')) {
            $userids = $this->ev->get('delids');
            $days = $this->ev->get('days');
            if ($userids && $days) {
                foreach ($userids as $userid => $p) {
                    $this->course->openCourse(['ocuserid' => $userid, 'occourseid' => $courseid, 'ocendtime' => TIME + $days * 24 * 3600]);
                }
                $message = [
                    'statusCode'   => 200,
                    'message'      => '操作成功',
                    'callbackType' => 'forward',
                    'forwardUrl'   => 'index.php?course-master-course-members&courseid='.$courseid,
                ];
            } else {
                $message = [
                    'statusCode' => 300,
                    'message'    => '操作失败',
                ];
            }
            exit(json_encode($message));
        }

        $args = [];
        if ($search['userid']) {
            $args[] = ['AND', 'userid = :userid', 'userid', $search['userid']];
        }
        if ($search['username']) {
            $args[] = ['AND', 'username LIKE :username', 'username', '%'.$search['username'].'%'];
        }
        if ($search['useremail']) {
            $args[] = ['AND', 'useremail  LIKE :useremail', 'useremail', '%'.$search['useremail'].'%'];
        }
        if ($search['groupid']) {
            $args[] = ['AND', 'usergroupid = :usergroupid', 'usergroupid', $search['groupid']];
        }
        if ($search['stime'] || $search['etime']) {
            if (!is_array($args)) {
                $args = [];
            }
            if ($search['stime']) {
                $stime = strtotime($search['stime']);
                $args[] = ['AND', 'userregtime >= :userregtime', 'userregtime', $stime];
            }
            if ($search['etime']) {
                $etime = strtotime($search['etime']);
                $args[] = ['AND', 'userregtime <= :userregtime', 'userregtime', $etime];
            }
        }
        $users = $this->user->getUserList($args, $page, 10);
        $this->tpl->assign('course', $course);
        $this->tpl->assign('users', $users);
        $this->tpl->assign('search', $search);
        $this->tpl->assign('u', $u);
        $this->tpl->assign('page', $page);
        $this->tpl->display('course_selectmember');
    }

    private function add()
    {
        if ($this->ev->get('submit')) {
            $args = $this->ev->get('args');
            $args['csuserid'] = $this->_user['sessionuserid'];
            $args['cstime'] = TIME;
            $id = $this->course->addCourse($args);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?course-master-course&catid={$args['cscatid']}",
            ];
            exit(json_encode($message));
        }

        $catid = intval($this->ev->get('catid'));
        $parentcat = $this->category->getCategoriesByArgs([['AND', 'catparent = 0'], ['AND', "catapp = 'course'"]]);
        $this->tpl->assign('parentcat', $parentcat);
        $this->tpl->assign('catid', $catid);
        $this->tpl->display('course_add');
    }

    private function edit()
    {
        $page = intval($this->ev->get('page'));
        $courseid = intval($this->ev->get('courseid'));
        $course = $this->course->getCourseById($courseid);
        if ($this->ev->get('submit')) {
            $args = $this->ev->get('args');
            $this->course->modifyCourse($courseid, $args);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?course-master-course&catid={$course['cscatid']}&page={$page}{$u}",
            ];
            $this->G->R($message);
        } else {
            $catid = intval($this->ev->get('catid'));
            $cat = $this->category->getCategoryById($catid);
            $parentcat = $this->category->getCategoriesByArgs([['AND', 'catparent = 0']]);
            $this->tpl->assign('parentcat', $parentcat);
            $this->tpl->assign('catid', $catid);
            $this->tpl->assign('cat', $cat);
            $this->tpl->assign('courseid', $courseid);
            $this->tpl->assign('course', $course);
            $this->tpl->assign('page', $page);
            $this->tpl->display('course_edit');
        }
    }

    private function del()
    {
        $page = intval($this->ev->get('page'));
        $courseid = intval($this->ev->get('courseid'));
        $number = $this->content->getCourseContentNumber($courseid);
        if (!$number) {
            $this->course->delCourse($courseid);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => 'reload',
            ];
        } else {
            $message = [
                'statusCode' => 300,
                'message'    => '操作失败，请先删除本课程下所有课件',
            ];
        }
        $this->G->R($message);
    }

    private function addmember()
    {
        $courseid = $this->ev->get('courseid');
        $this->tpl->assign('courseid', $courseid);
        if ($this->ev->get('addmember')) {
            $userids = $this->ev->get('userids');
            $usernames = $this->ev->get('usernames');
            $usergroupids = $this->ev->get('usergroupids');
            $days = $this->ev->get('days');
            if ($userids && $days) {
                $userids = explode(',', $userids);
                foreach ($userids as $userid) {
                    $this->course->openCourse(['ocuserid' => $userid, 'occourseid' => $courseid, 'ocendtime' => TIME + $days * 24 * 3600]);
                }
                $message = [
                    'statusCode'   => 200,
                    'message'      => '操作成功',
                    'callbackType' => 'forward',
                    'forwardUrl'   => 'index.php?course-master-course-members&courseid='.$courseid,
                ];
            } elseif ($usernames && $days) {
                $usernames = implode(',', array_unique(explode(',', $usernames)));
                $userids = $this->user->getUsersByArgs([['AND', 'find_in_set(username,:username)', 'username', $usernames], ['AND', 'user.usergroupid = user_group.groupid']], false, false, false);
                foreach ($userids as $user) {
                    $this->course->openCourse(['ocuserid' => $user['userid'], 'occourseid' => $courseid, 'ocendtime' => TIME + $days * 24 * 3600]);
                }
                $message = [
                    'statusCode'   => 200,
                    'message'      => '操作成功',
                    'callbackType' => 'forward',
                    'forwardUrl'   => 'index.php?course-master-course-members&courseid='.$courseid,
                ];
            } elseif ($usergroupids && $days) {
                $usergroupids = implode(',', array_unique(explode(',', $usergroupids)));
                $userids = $this->user->getUsersByArgs([['AND', 'find_in_set(usergroupid,:usergroupid)', 'usergroupid', $usergroupids], ['AND', 'user.usergroupid = user_group.groupid']], false, false, false);
                foreach ($userids as $user) {
                    $this->course->openCourse(['ocuserid' => $user['userid'], 'occourseid' => $courseid, 'ocendtime' => TIME + $days * 24 * 3600]);
                }
                $message = [
                    'statusCode'   => 200,
                    'message'      => '操作成功',
                    'callbackType' => 'forward',
                    'forwardUrl'   => 'index.php?course-master-course-members&courseid='.$courseid,
                ];
            } else {
                $message = [
                    'statusCode' => 300,
                    'message'    => '参数错误',
                ];
            }
            $this->G->R($message);
        } else {
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
        $args = [];
        $args[] = ['AND', 'opencourse.occourseid = :occourseid', 'occourseid', $courseid];
        $args[] = ['AND', 'opencourse.ocendtime >= :ocendtime', 'ocendtime', TIME];
        if ($search['userid']) {
            $args[] = ['AND', 'user.userid = :userid', 'userid', $search['userid']];
        }
        if ($search['username']) {
            $args[] = ['AND', 'user.username LIKE :username', 'username', '%'.$search['username'].'%'];
        }
        $members = $this->course->getOpenCourseMember($args, $page);
        $course = $this->course->getCourseById($courseid);
        $this->tpl->assign('search', $search);
        $this->tpl->assign('courseid', $courseid);
        $this->tpl->assign('course', $course);
        $this->tpl->assign('members', $members);
        $this->tpl->assign('page', $page);
        $this->tpl->display('course_members');
    }

    private function lite()
    {
        $catid = $this->ev->get('catid');
        $page = $this->ev->get('page');
        $this->tpl->assign('catid', $catid);
        $this->tpl->assign('page', $page);
        if ($this->ev->get('modifycoursesequence')) {
            if ('delete' == $this->ev->get('action')) {
                $ids = $this->ev->get('delids');
                foreach ($ids as $key => $id) {
                    $number = $this->content->getCourseContentNumber($key);
                    if (!$number) {
                        $this->course->delCourse($key);
                    }
                }
            } elseif ('movecategory' == $this->ev->get('action')) {
                $courseids = [];
                $ids = $this->ev->get('delids');
                foreach ($ids as $key => $id) {
                    if ($key) {
                        $courseids[] = $key;
                    }
                }
                $courseids = implode(',', $courseids);
                $parentcat = $this->category->getCategoriesByArgs([['AND', 'catparent = 0']]);
                $this->tpl->assign('parentcat', $parentcat);
                $this->tpl->assign('courseids', $courseids);
                $this->tpl->display('course_move');
                exit;
            } else {
                $ids = $this->ev->get('ids');
                foreach ($ids as $key => $id) {
                    $this->course->modifyBasciCourse($key, ['cssequence' => $id]);
                }
            }
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => 'reload',
            ];
            exit(json_encode($message));
        } elseif ($this->ev->get('movecategory')) {
            $courseids = explode(',', $this->ev->get('courseids'));
            $targetcatid = $this->ev->get('targetcatid');
            if ($targetcatid) {
                foreach ($courseids as $key => $id) {
                    if ($id) {
                        $this->course->modifyBasciCourse($id, ['cscatid' => $targetcatid]);
                    }
                }
                $message = [
                    'statusCode'   => 200,
                    'message'      => '操作成功',
                    'callbackType' => 'forward',
                    'forwardUrl'   => "index.php?course-master-course&catid={$catid}&page={$page}{$u}",
                ];
            } else {
                $message = [
                    'statusCode' => 300,
                    'message'    => '操作失败',
                ];
            }
            exit(json_encode($message));
        }

        $message = [
            'statusCode' => 300,
            'message'    => '无效访问',
        ];
        exit(json_encode($message));
    }

    private function index()
    {
        $search = $this->ev->get('search');
        $catid = intval($this->ev->get('catid'));
        if (!$catid) {
            $catid = $search['cscatid'];
        }
        $page = $this->ev->get('page');
        $page = $page ? $page : 1;
        $categories = $this->category->getAllCategory();
        $parentcat = $this->category->getCategoriesByArgs([['AND', 'catparent = 0'], ['AND', "catapp = 'course'"]]);
        if ($catid) {
            $childstring = $this->category->getChildCategoryString($catid);
            $args = [['AND', 'find_in_set(cscatid,:cscatid)', 'cscatid', $childstring]];
        } else {
            $args = [];
        }
        if ($search['courseid']) {
            $args[] = ['AND', 'csid = :csid', 'csid', $search['courseid']];
        } else {
            if ($search['stime']) {
                $args[] = ['AND', 'cstime >= :csstime', 'csstime', strtotime($search['stime'])];
            }
            if ($search['etime']) {
                $args[] = ['AND', 'cstime <= :csetime', 'csetime', strtotime($search['etime'])];
            }
            if ($search['keyword']) {
                $args[] = ['AND', 'cstitle LIKE :cstitle', 'cstitle', "%{$search['keyword']}%"];
            }
            if ($search['username']) {
                $user = $this->user->getUserByUserName($search['username']);
                $args[] = ['AND', 'csuserid = :csuserid', 'csuserid', $user['userid']];
            }
        }
        $courses = $this->course->getCourseList($args, $page, 10);
        $catlevel = 1;
        if ($catid) {
            $pos = $this->category->getCategoryPos($catid);
            if (count($pos)) {
                $catlevel = count($pos) + 1;
            }
        }
        $this->tpl->assign('catlevel', $catlevel);
        $this->tpl->assign('page', $page);
        $this->tpl->assign('catid', $catid);
        $this->tpl->assign('courses', $courses);
        $this->tpl->assign('categories', $categories);
        $this->tpl->assign('parentcat', $parentcat);
        $this->tpl->display('course');
    }
}
