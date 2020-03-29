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

    public function __construct(&$G)
    {
        $this->G = $G;
        $this->G = $G;
        $this->ev = $this->G->make('ev');
        $this->session = $this->G->make('session');
        $this->tpl = $this->G->make('tpl');
        $this->sql = $this->G->make('sql');
        $this->pdosql = $this->G->make('pdosql');
        $this->db = $this->G->make('pepdo');
        $this->pg = $this->G->make('pg');
        $this->html = $this->G->make('html');
        $this->module = $this->G->make('module');
        $this->apps = $this->G->make('apps', 'core');
        $this->user = $this->G->make('user', 'user');
        $this->_user = $_user = $this->session->getSessionUser();
        $group = $this->user->getGroupById($_user['sessiongroupid']);
        if (1 != $group['groupid']) {
            if ($this->ev->get('userhash')) {
                exit(json_encode([
                    'statusCode'   => 300,
                    'message'      => '请您重新登录',
                    'callbackType' => 'forward',
                    'forwardUrl'   => 'index.php?core-master-login',
                ]));
            }

            header('location:index.php?core-master-login');
            exit;
        }
        $localapps = $this->apps->getLocalAppList();
        $apps = $this->apps->getAppList();
        $this->tpl->assign('localapps', $localapps);
        $this->tpl->assign('apps', $apps);
        $modules = $this->module->getModulesByApp('user');
        $groups = $this->user->getUserGroups();
        $user = $this->user->getUserById($_user['sessionuserid']);
        $user['manager_apps'] = unserialize($user['manager_apps']);
        $this->tpl->assign('_user', $user);
        if (is_array($user['manager_apps']) && !in_array($this->G->app, $user['manager_apps']) && $apps['user']['appsetting']['managemodel']) {
            header('location:index.php?core-master');
            exit();
        }
        $this->tpl->assign('modules', $modules);
        $this->tpl->assign('groups', $groups);
        $this->tpl->assign('userhash', $this->ev->get('userhash'));
    }
}
