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

class app
{
    public $G;
    public $_user;

    public function __construct(&$G)
    {
        $this->G = $G;
        $this->ev = $this->G->make('ev');
        $this->session = $this->G->make('session');
        $this->tpl = $this->G->make('tpl');
        $this->sql = $this->G->make('sql');
        $this->pdosql = $this->G->make('pdosql');
        $this->db = $this->G->make('pepdo');
        $this->apps = $this->G->make('apps', 'core');
        $this->user = $this->G->make('user', 'user');
        $this->_user = $_user = $this->session->getSessionUser();
        $group = $this->user->getGroupById($_user['sessiongroupid']);
        if (1 != $group['groupid'] && 'login' != $this->ev->url(2)) {
            if ($this->ev->get('userhash')) {
                exit(json_encode([
                'statusCode' => 300,
                'message' => '请您重新登录',
                'callbackType' => 'forward',
                'forwardUrl' => 'index.php?core-master-login',
            ]));
            }

            header('location:index.php?core-master-login');
            exit;
        }
        $user = $this->user->getUserById($_user['sessionuserid']);
        $user['manager_apps'] = unserialize($user['manager_apps']);
        $this->tpl->assign('_user', $user);
        $this->tpl->assign('action', $this->ev->url(2) ? $this->ev->url(2) : 'user');
        $localapps = $this->apps->getLocalAppList();
        $apps = $this->apps->getAppList();
        $this->tpl->assign('localapps', $localapps);
        $this->tpl->assign('apps', $apps);
    }
}
