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
        $search = $this->ev->get('search');
        $this->u = '';
        if ($search) {
            $this->tpl->assign('search', $search);
            foreach ($search as $key => $arg) {
                $this->u .= "&search[{$key}]={$arg}";
            }
        }
        $this->tpl->assign('search', $search);
        if (!method_exists($this, $action)) {
            $action = 'index';
        }
        $this->$action();
        exit;
    }

    private function del()
    {
        $page = $this->ev->get('page');
        $userid = $this->ev->get('userid');
        $this->user->delUserById($userid);
        $message = [
            'statusCode'   => 200,
            'message'      => '操作成功',
            'navTabId'     => '',
            'rel'          => '',
            'callbackType' => 'forward',
            'forwardUrl'   => "index.php?user-master-user&page={$page}{$this->u}",
        ];
        exit(json_encode($message));
    }

    private function batdel()
    {
        if ('delete' == $this->ev->get('action')) {
            $page = $this->ev->get('page');
            $delids = $this->ev->get('delids');
            foreach ($delids as $userid => $p) {
                $this->user->delUserById($userid);
            }
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?user-master-user&page={$page}{$this->u}",
            ];
            exit(json_encode($message));
        }
    }

    private function modify()
    {
        $page = $this->ev->get('page');
        if ($this->ev->get('modifyusergroup')) {
            $groupid = $this->ev->get('groupid');
            $userid = $this->ev->get('userid');
            $this->user->modifyUserGroup($userid, $groupid);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?user-master-user&page={$page}{$this->u}",
            ];
            exit(json_encode($message));
        } elseif ($this->ev->get('setteachsubject')) {
            $subjects = $this->ev->get('subjects');
            $userid = $this->ev->get('userid');
            $user = $this->user->getUserById($userid);
            $modules = $this->module->getModulesByApp('user');
            if ('teacher' != $modules[$user['groupmoduleid']]['modulecode']) {
                $message = [
                    'statusCode' => 300,
                    'message'    => '此用户不是教师',
                ];
                exit(json_encode($message));
            }
            $this->user->modifyUserInfo($userid, ['teacher_subjects' => $subjects]);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => 'reload',
            ];
            exit(json_encode($message));
        } elseif ($this->ev->get('modifyuserinfo')) {
            $args = $this->ev->get('args');
            $userid = $this->ev->get('userid');
            $user = $this->user->getUserById($userid);
            $group = $this->user->getGroupById($user['usergroupid']);
            $args = $this->module->tidyNeedFieldsPars($args, $group['groupmoduleid'], ['iscurrentuser' => $userid == $this->_user['sessionuserid'], 'group' => $group]);
            $id = $this->user->modifyUserInfo($userid, $args);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => "index.php?user-master-user&page={$page}{$this->u}",
            ];
            exit(json_encode($message));
        } elseif ($this->ev->get('modifyuserpassword')) {
            $args = $this->ev->get('args');
            $userid = $this->ev->get('userid');
            if ($args['password'] == $args['password2'] && $userid) {
                $id = $this->user->modifyUserPassword($userid, $args);
                $message = [
                    'statusCode'   => 200,
                    'message'      => '操作成功',
                    'callbackType' => 'forward',
                    'forwardUrl'   => "index.php?user-master-user&page={$page}{$this->u}",
                ];
                exit(json_encode($message));
            }

            $message = [
                'statusCode' => 300,
                'message'    => '操作失败',
                'navTabId'   => '',
                'rel'        => '',
            ];
            exit(json_encode($message));
        }

        $userid = $this->ev->get('userid');
        $user = $this->user->getUserById($userid);
        $group = $this->user->getGroupById($user['usergroupid']);
        $fields = $this->module->getMoudleFields($group['groupmoduleid'], 1);
        $forms = $this->html->buildHtml($fields, $user);
        $subjects = $this->G->make('basic', 'exam')->getSubjectList();
        $this->tpl->assign('subjects', $subjects);
        $this->tpl->assign('moduleid', $group['groupmoduleid']);
        $this->tpl->assign('fields', $fields);
        $this->tpl->assign('forms', $forms);
        $this->tpl->assign('user', $user);
        $this->tpl->assign('page', $page);
        $this->tpl->display('modifyuser');
    }

    private function batadd()
    {
        if ($this->ev->post('insertUser')) {
            $uploadfile = $this->ev->get('uploadfile');
            if (!file_exists($uploadfile)) {
                $message = [
                    'statusCode' => 300,
                    'message'    => '上传文件不存在',
                ];
                exit(json_encode($message));
            }

            setlocale(LC_ALL, 'zh_CN');
            $handle = fopen($uploadfile, 'r');
            $defaultgroup = $this->user->getDefaultGroup();
            $strings = $this->G->make('strings');
            $app = $this->G->make('apps', 'core')->getApp('user');
            $tpfields = explode(',', $app['appsetting']['regfields']);
            while ($data = fgetcsv($handle, 200)) {
                if ($data[0] && $data[1]) {
                    $args = [];
                    $args['username'] = iconv('GBK', 'UTF-8', $data[0]);
                    if ($strings->isUserName($args['username'])) {
                        $u = $this->user->getUserByUserName($args['username']);
                        if (!$u) {
                            $args['useremail'] = $data[1];
                            if ($strings->isEmail($args['useremail'])) {
                                $u = $this->user->getUserByEmail($args['useremail']);
                                if (!$u) {
                                    if (!$data[2]) {
                                        $data[2] = '111111';
                                    }
                                    $args['userpassword'] = md5($data[2]);
                                    $args['usergroupid'] = $defaultgroup['groupid'];
                                    $i = 3;
                                    foreach ($tpfields as $p) {
                                        $args[$p] = iconv('GBK', 'UTF-8', $data[$i]);
                                        $i++;
                                    }
                                    $this->user->insertUser($args);
                                }
                            }
                        }
                    }
                }
            }
            fclose($handle);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => 'index.php?user-master-user',
            ];
            exit(json_encode($message));
        }

        $this->tpl->display('batadduser');
    }

    private function add()
    {
        if ($this->ev->post('insertUser')) {
            $args = $this->ev->post('args');
            if ($args['userpassword'] == $args['userpassword2']) {
                $userbyname = $this->user->getUserByUserName($args['username']);
                $userbyemail = $this->user->getUserByEmail($args['useremail']);
                if ($userbyname) {
                    $errmsg = '这个用户名已经被注册了';
                }
                if ($userbyemail) {
                    $errmsg = '这个邮箱已经被注册了';
                }
                if ($errmsg) {
                    $message = [
                        'statusCode' => 300,
                        'message'    => "{$errmsg}",
                    ];
                    exit(json_encode($message));
                }
                $args['userpassword'] = md5($args['userpassword']);
                $search = $this->ev->get('search');
                $u = '';
                if ($search) {
                    foreach ($search as $key => $arg) {
                        $u .= "&search[{$key}]={$arg}";
                    }
                }
                unset($args['userpassword2']);
                $id = $this->user->insertUser($args);
                $message = [
                    'statusCode'   => 200,
                    'message'      => '操作成功',
                    'callbackType' => 'forward',
                    'forwardUrl'   => "index.php?user-master-user{$this->u}",
                ];
                exit(json_encode($message));
            }
        } else {
            $this->tpl->display('adduser');
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
        $this->tpl->assign('users', $users);
        $this->tpl->assign('page', $page);
        $this->tpl->display('user');
    }
}
