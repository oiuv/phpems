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
        $this->$action();
        exit;
    }

    private function unbind()
    {
        $userid = $this->_user['sessionuserid'];
        $id = $this->user->modifyUserInfo($userid, ['useropenid' => '']);
        $message = [
            'statusCode'   => 200,
            'callbackType' => 'forward',
            'forwardUrl'   => 'index.php?user-phone-logout',
        ];
        exit(json_encode($message));
    }

    private function modifypass()
    {
        if ($this->ev->get('modifyuserpassword')) {
            $args = $this->ev->get('args');
            $oldpassword = $this->ev->get('oldpassword');
            $userid = $this->_user['sessionuserid'];
            $user = $this->user->getUserById($userid);
            if (md5($oldpassword) != $user['userpassword']) {
                $message = [
                    'statusCode' => 300,
                    'message'    => '操作失败，原密码验证失败',
                ];
                exit(json_encode($message));
            }
            if ($args['password'] == $args['password2'] && $userid) {
                $id = $this->user->modifyUserPassword($userid, $args);
                $message = [
                    'statusCode'   => 200,
                    'message'      => '操作成功',
                    'callbackType' => 'forward',
                    'forwardUrl'   => 'index.php?user-phone-logout',
                ];
                exit(json_encode($message));
            }

            $message = [
                'statusCode' => 300,
                'message'    => '操作失败',
            ];
            exit(json_encode($message));
        }

        $this->tpl->display('modifypass');
    }

    private function comment()
    {
        $page = $this->ev->get('page');
        $this->pg->setUrlTarget('modal-body" data-target="page6" class="ajax');
        $this->pg->setPageType('wap');
        $comments = $this->comment->getCommentList($page, $this->_user['sessionuserid']);
        $this->tpl->assign('comments', $comments);
        $this->tpl->assign('page', $page);
        $this->tpl->display('comment');
    }

    private function index()
    {
        $page = $this->ev->get('page');
        $search = $this->ev->get('search');
        $u = '';
        if ($search) {
            $this->tpl->assign('search', $search);
            foreach ($search as $key => $arg) {
                $u .= "&search[{$key}]={$arg}";
            }
        }
        if ($this->ev->get('modifyuserinfo')) {
            $args = $this->ev->get('args');
            $userid = $this->_user['sessionuserid'];
            $group = $this->user->getGroupById($this->_user['sessiongroupid']);
            $args = $this->module->tidyNeedFieldsPars($args, $group['groupmoduleid'], ['iscurrentuser' => 1, 'group' => $group]);
            unset($args['userischeck']);
            $id = $this->user->modifyUserInfo($userid, $args);
            $message = [
                'statusCode'   => 200,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => 'reload',
            ];
            exit(json_encode($message));
        }

        $userid = $this->_user['sessionuserid'];
        $user = $this->user->getUserById($userid);
        $group = $this->user->getGroupById($user['usergroupid']);
        $fields = $this->module->getMoudleFields($group['groupmoduleid']);
        $forms = $this->html->buildHtml($fields, $user);
        $actors = $this->user->getGroupsByModuleid($group['groupmoduleid']);
        $this->tpl->assign('moduleid', $group['groupmoduleid']);
        $this->tpl->assign('fields', $fields);
        $this->tpl->assign('forms', $forms);
        $this->tpl->assign('actors', $actors);
        $this->tpl->assign('user', $user);
        $this->tpl->assign('page', $page);
        $this->tpl->display('modifyuser');
    }
}
