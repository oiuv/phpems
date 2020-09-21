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
        $this->html = $this->G->make('html');
        if (!method_exists($this, $action)) {
            $action = 'index';
        }
        $this->$action();
        exit;
    }

    private function addpage()
    {
        $courseid = intval($this->ev->get('courseid'));
        $modules = $this->module->getModulesByApp($this->G->app);
        $this->tpl->assign('courseid', $courseid);
        $this->tpl->assign('modules', $modules);
        $this->tpl->display('addpage');
    }

    private function add()
    {
        if ($this->ev->get('submit')) {
            $args = $this->ev->get('args');
            $args['courseuserid'] = $this->_user['userid'];
            $args['courseusername'] = $this->_user['username'];
            $args['courseinputtime'] = TIME;
            $group = $this->user->getGroupById($this->_user['groupid']);
            $args = $this->module->tidyNeedFieldsPars($args, $args['coursemoduleid'], 1);
            $id = $this->content->addCourse($args);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?course-teach-contents&courseid={$args['coursecsid']}",
            ];
            exit(json_encode($message));
        }

        $courseid = intval($this->ev->get('courseid'));
        $moduleid = intval($this->ev->get('moduleid'));
        $parentcat = $this->category->getCategoriesByArgs([['AND', 'catparent = 0'], ['AND', "catapp = 'course'"]]);
        $modules = $this->module->getModulesByApp($this->G->app);
        $fields = $this->module->getMoudleFields($moduleid, 1);
        $forms = $this->html->buildHtml($fields);
        $tpls = [];
        foreach (glob('app/content/tpls/app/content_*.tpl') as $p) {
            $tpls[] = substr(basename($p), 0, -4);
        }
        $this->tpl->assign('tpls', $tpls);
        $this->tpl->assign('moduleid', $moduleid);
        $this->tpl->assign('modules', $modules);
        $this->tpl->assign('parentcat', $parentcat);
        $this->tpl->assign('courseid', $courseid);
        $this->tpl->assign('forms', $forms);
        $this->tpl->display('content_add');
    }

    private function edit()
    {
        $page = intval($this->ev->get('page'));
        $contentid = intval($this->ev->get('contentid'));
        $content = $this->content->getCourseById($contentid);
        if ($this->ev->get('submit')) {
            $args = $this->ev->get('args');
            $args['coursemodifytime'] = TIME;
            $group = $this->user->getGroupById($this->_user['sessiongroupid']);
            $args = $this->module->tidyNeedFieldsPars($args, $content['coursemoduleid'], 1);
            $this->content->modifyCourse($contentid, $args);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?course-teach-contents&courseid={$content['coursecsid']}&page={$page}{$u}",
            ];
            exit(json_encode($message));
        }

        $userid = $this->_user['sessionuserid'];
        $user = $this->user->getUserById($userid);
        $group = $this->user->getGroupById($user['usergroupid']);
        $fields = $this->module->getMoudleFields($content['coursemoduleid'], 1);
        $forms = $this->html->buildHtml($fields, $content);
        $tpls = [];
        foreach (glob('app/content/tpls/app/content_*.tpl') as $p) {
            $tpls[] = substr(basename($p), 0, -4);
        }
        $this->tpl->assign('tpls', $tpls);
        $this->tpl->assign('fields', $fields);
        $this->tpl->assign('contentid', $contentid);
        $this->tpl->assign('content', $content);
        $this->tpl->assign('page', $page);
        $this->tpl->assign('forms', $forms);
        $this->tpl->display('content_edit');
    }

    private function del()
    {
        $page = intval($this->ev->get('page'));
        $contentid = intval($this->ev->get('contentid'));
        $this->content->delCourse($contentid);
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => 'reload',
        ];
        exit(json_encode($message));
    }

    private function lite()
    {
        $catid = $this->ev->get('catid');
        $page = $this->ev->get('page');
        $this->tpl->assign('catid', $catid);
        $this->tpl->assign('page', $page);
        if ($this->ev->get('modifycontentsequence')) {
            if ('delete' == $this->ev->get('action')) {
                $ids = $this->ev->get('delids');
                foreach ($ids as $key => $id) {
                    $this->content->delCourse($key);
                }
            } elseif ('movecategory' == $this->ev->get('action')) {
                $contentids = [];
                $ids = $this->ev->get('delids');
                foreach ($ids as $key => $id) {
                    if ($key) {
                        $contentids[] = $key;
                    }
                }
                $contentids = implode(',', $contentids);
                $parentcat = $this->category->getCategoriesByArgs([['AND', 'catparent = 0']]);
                $this->tpl->assign('parentcat', $parentcat);
                $this->tpl->assign('contentids', $contentids);
                $this->tpl->display('content_move');
                exit;
            } elseif ('copycategory' == $this->ev->get('action')) {
                $contentids = [];
                $ids = $this->ev->get('delids');
                foreach ($ids as $key => $id) {
                    if ($key) {
                        $contentids[] = $key;
                    }
                }
                $contentids = implode(',', $contentids);
                $parentcat = $this->category->getCategoriesByArgs([['AND', 'catparent = 0']]);
                $this->tpl->assign('parentcat', $parentcat);
                $this->tpl->assign('contentids', $contentids);
                $this->tpl->display('content_copy');
                exit;
            } elseif ('moveposition' == $this->ev->get('action')) {
                $contentids = [];
                $ids = $this->ev->get('delids');
                foreach ($ids as $key => $id) {
                    if ($key) {
                        $contentids[] = $key;
                    }
                }
                $contentids = implode(',', $contentids);
                $poses = $this->position->getPosList();
                $this->tpl->assign('poses', $poses);
                $this->tpl->assign('contentids', $contentids);
                $this->tpl->display('content_position');
                exit;
            } else {
                $ids = $this->ev->get('ids');
                foreach ($ids as $key => $id) {
                    $this->content->modifyBasciCourse($key, ['coursesequence' => $id]);
                }
            }
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => 'reload',
            ];
            exit(json_encode($message));
        } elseif ($this->ev->get('movecposition')) {
            $contentids = explode(',', $this->ev->get('contentids'));
            $position = $this->ev->get('position');
            if ($position) {
                foreach ($contentids as $key => $id) {
                    if ($id) {
                        $basic = $this->content->getBasicContentById($id);
                        $args = ['pctitle' => $basic['contenttitle'], 'pctime' => $basic['contentinputtime'], 'pccontentid' => $id, 'pcthumb' => $basic['contentthumb'], 'pcposid' => $position];
                        $this->position->addPosContent($args);
                    }
                }
                $message = [
                    'statusCode'   => 200,
                    'message'      => '操作成功',
                    'callbackType' => 'forward',
                    'forwardUrl'   => "index.php?course-teach-contents&catid={$catid}&page={$page}{$u}",
                ];
            } else {
                $message = [
                    'statusCode' => 300,
                    'message'    => '操作失败',
                ];
            }
            exit(json_encode($message));
        } elseif ($this->ev->get('movecategory')) {
            $contentids = explode(',', $this->ev->get('contentids'));
            $targetcatid = $this->ev->get('targetcatid');
            if ($targetcatid) {
                foreach ($contentids as $key => $id) {
                    if ($id) {
                        $this->content->modifyBasciContent($id, ['contentcatid' => $targetcatid]);
                    }
                }
                $message = [
                    'statusCode'   => 200,
                    'message'      => '操作成功',
                    'callbackType' => 'forward',
                    'forwardUrl'   => "index.php?course-teach-contents&catid={$catid}&page={$page}{$u}",
                ];
            } else {
                $message = [
                    'statusCode' => 300,
                    'message'    => '操作失败',
                ];
            }
            exit(json_encode($message));
        } elseif ($this->ev->get('copycategory')) {
            $contentids = explode(',', $this->ev->get('contentids'));
            $targetcatid = $this->ev->get('targetcatid');
            if ($targetcatid) {
                foreach ($contentids as $key => $id) {
                    if ($id) {
                        $content = $this->content->getBasicContentById($id);
                        $args = ['contentcatid' => $targetcatid, 'contenttitle' => $content['contenttitle'], 'contentmoduleid' => $content['contentmoduleid'], 'contentthumb' => $content['contentthumb'], 'contentlink' => 'index.php?course-app-content&contentid='.$content['contentid']];
                        $args['contentuserid'] = $this->_user['sessionuserid'];
                        $args['contentusername'] = $this->_user['sessionusername'];
                        $args['contentinputtime'] = TIME;
                        $this->content->addContent($args);
                    }
                }
                $message = [
                    'statusCode'   => 200,
                    'message'      => '操作成功',
                    'callbackType' => 'forward',
                    'forwardUrl'   => "index.php?course-teach-contents&catid={$catid}&page={$page}{$u}",
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
        $courseid = intval($this->ev->get('courseid'));
        $page = $this->ev->get('page');
        $search = $this->ev->get('search');
        if (!$courseid) {
            header('location:index.php?course-teach-course');
            exit;
        }
        if ($courseid) {
            $args = [['AND', 'find_in_set(coursecsid,:coursecsid)', 'coursecsid', $courseid]];
        } else {
            $args = [];
        }
        if ($search['courseid']) {
            $args[] = ['AND', 'courseid = :courseid', 'courseid', $search['courseid']];
        } else {
            if ($search['coursemoduleid']) {
                $args[] = ['AND', 'coursemoduleid = :coursemoduleid', 'coursemoduleid', $search['coursemoduleid']];
            }
            if ($search['stime']) {
                $args[] = ['AND', 'courseinputtime >= :scourseinputtime', 'scourseinputtime', strtotime($search['stime'])];
            }
            if ($search['etime']) {
                $args[] = ['AND', 'courseinputtime <= :ecourseinputtime', 'ecourseinputtime', strtotime($search['etime'])];
            }
            if ($search['keyword']) {
                $args[] = ['AND', 'coursetitle LIKE :coursetitle', 'coursetitle', "%{$search['keyword']}%"];
            }
            if ($search['username']) {
                $user = $this->user->getUserByUserName($search['username']);
                $args[] = ['AND', 'courseuserid = :courseuserid', 'courseuserid', $user['userid']];
            }
        }
        $course = $this->course->getCourseById($courseid);
        $contents = $this->content->getCourseList($args, $page, 10);
        $modules = $this->module->getModulesByApp($this->G->app);
        $this->tpl->assign('modules', $modules);
        $this->tpl->assign('course', $course);
        $this->tpl->assign('contents', $contents);
        $this->tpl->assign('search', $search);
        $this->tpl->assign('page', $page);
        $this->tpl->display('content');
    }
}
