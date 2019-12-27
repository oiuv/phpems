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
        if (!method_exists($this, $action)) {
            $action = 'index';
        }
        $search = $this->ev->get('search');
        $page = $this->ev->get('page');
        if ($search) {
            $this->tpl->assign('search', $search);
            foreach ($search as $key => $arg) {
                $u .= "&search[{$key}]={$arg}";
            }
        }
        $this->tpl->assign('page', $page);
        $this->tpl->assign('u', $u);
        $this->$action();
        exit;
    }

    private function basics()
    {
        $page = $this->ev->get('page');
        $search = $this->ev->get('search');
        $page = $page > 1 ? $page : 1;
        $userid = $this->ev->get('userid');
        $subjects = $this->basic->getSubjectList();
        if (!$search) {
            $args = 1;
        } else {
            $args = [];
        }
        if ($search['basicid']) {
            $args[] = ['AND', 'basicid = :basicid', 'basicid', $search['basicid']];
        } else {
            if ($search['keyword']) {
                $args[] = ['AND', 'basic LIKE :basic', 'basic', "%{$search['keyword']}%"];
            }
            if ($search['basicareaid']) {
                $args[] = ['AND', 'basicareaid = :basicareaid', 'basicareaid', $search['basicareaid']];
            }
            if ($search['basicsubjectid']) {
                $args[] = ['AND', 'basicsubjectid = :basicsubjectid', 'basicsubjectid', $search['basicsubjectid']];
            }
            if ($search['basicapi']) {
                $args[] = ['AND', 'basicapi = :basicapi', 'basicapi', $search['basicapi']];
            }
        }
        $basics = $this->basic->getBasicList($args, $page, 10);
        $areas = $this->area->getAreaList();
        $openbasics = $this->basic->getOpenBasicsByUserid($userid);
        $this->tpl->assign('basics', $basics);
        $this->tpl->assign('openbasics', $openbasics);
        $this->tpl->assign('areas', $areas);
        $this->tpl->assign('subjects', $subjects);
        $this->tpl->assign('basics', $basics);
        $this->tpl->assign('userid', $userid);
        $this->tpl->display('users_basic');
    }

    private function openbasics()
    {
        $basicid = $this->ev->get('basicid');
        $userid = $this->ev->get('userid');
        if ($this->basic->getOpenBasicByUseridAndBasicid($userid, $basicid)) {
            $message = [
                'statusCode' => 300,
                'message'    => '您已经开通了本考场',
            ];
        } else {
            $this->basic->openBasic(['obuserid' => $userid, 'obbasicid' => $basicid, 'obendtime' => TIME + 30 * 24 * 3600]);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?exam-master-users-basics&userid={$userid}{$u}",
            ];
        }
        $this->G->R($message);
    }

    private function closebasics()
    {
        $basicid = $this->ev->get('basicid');
        $userid = $this->ev->get('userid');
        $ob = $this->basic->getOpenBasicByUseridAndBasicid($userid, $basicid);
        $this->basic->delOpenBasic($ob['obid']);
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'callbackType' => 'forward',
            'forwardUrl'   => 'reload',
        ];
        $this->G->R($message);
    }

    private function batopen()
    {
        if ($this->ev->get('batopen')) {
            $userids = $this->ev->get('userids');
            $usernames = $this->ev->get('usernames');
            $usergroupids = $this->ev->get('usergroupids');
            $basics = $this->ev->get('basics');
            $days = $this->ev->get('days');
            if ($userids && $basics && $days) {
                $userids = explode(',', $userids);
                $basics = explode(',', $basics);
                foreach ($userids as $userid) {
                    foreach ($basics as $basicid) {
                        $this->basic->openBasic(['obuserid' => $userid, 'obbasicid' => $basicid, 'obendtime' => TIME + $days * 24 * 3600]);
                    }
                }
                $message = [
                    'statusCode' => 200,
                    'message'    => '操作成功',
                ];
            } elseif ($usernames && $basics && $days) {
                $usernames = implode(',', array_unique(explode(',', $usernames)));
                $basics = explode(',', $basics);
                $userids = $this->user->getUsersByArgs([['AND', 'find_in_set(username,:username)', 'username', $usernames], ['AND', 'user.usergroupid = user_group.groupid']], false, false, false);
                foreach ($userids as $user) {
                    foreach ($basics as $basicid) {
                        $this->basic->openBasic(['obuserid' => $user['userid'], 'obbasicid' => $basicid, 'obendtime' => TIME + $days * 24 * 3600]);
                    }
                }
                $message = [
                    'statusCode' => 200,
                    'message'    => '操作成功',
                ];
            } elseif ($usergroupids && $basics && $days) {
                $usergroupids = implode(',', array_unique(explode(',', $usergroupids)));
                $basics = explode(',', $basics);
                $userids = $this->user->getUsersByArgs([['AND', 'find_in_set(usergroupid,:usergroupid)', 'usergroupid', $usergroupids], ['AND', 'user.usergroupid = user_group.groupid']], false, false, false);
                foreach ($userids as $user) {
                    foreach ($basics as $basicid) {
                        $this->basic->openBasic(['obuserid' => $user['userid'], 'obbasicid' => $basicid, 'obendtime' => TIME + $days * 24 * 3600]);
                    }
                }
                $message = [
                    'statusCode' => 200,
                    'message'    => '操作成功',
                ];
            } else {
                $message = [
                    'statusCode' => 300,
                    'message'    => '参数错误',
                ];
            }
            $this->G->R($message);
        } else {
            $basicid = $this->ev->get('basicid');
            $this->tpl->assign('basicid', $basicid);
            $this->tpl->display('user_batopen');
        }
    }

    private function index()
    {
        $page = $this->ev->get('page') ? $this->ev->get('page') : 1;
        $search = $this->ev->get('search');
        $u = '';
        if ($search) {
            foreach ($search as $key => $arg) {
                $u .= "&search[{$key}]={$arg}";
            }
            $this->tpl->assign('search', $search);
            $this->tpl->assign('u', $u);
        }
        $args = [];
        if ($search['userid']) {
            $args[] = ['AND', 'userid = :userid', 'userid', $search['userid']];
        } elseif ($search['groupid'] || $search['username']) {
            $args = [];
            if ($search['groupid']) {
                $args[] = ['AND', 'usergroupid = :usergroupid', 'usergroupid', $search['groupid']];
            }
            if ($search['username']) {
                $args[] = ['AND', 'username LIKE :username', 'username', "%{$search['username']}%"];
            }
        }
        $users = $this->user->getUserList($args, $page, 10);
        $groups = $this->user->getUserGroups();
        $this->tpl->assign('groups', $groups);
        $this->tpl->assign('users', $users);
        $this->tpl->display('user');
    }
}
