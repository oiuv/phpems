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
    public $data = [];
    public $sessionvars;

    public function __construct(&$G)
    {
        $this->G = $G;
        $this->ev = $this->G->make('ev');
        $this->tpl = $this->G->make('tpl');
        $this->sql = $this->G->make('sql');
        $this->pesql = $this->G->make('pdosql');
        $this->db = $this->G->make('pepdo');
        $this->pg = $this->G->make('pg');
        $this->module = $this->G->make('module');
        $this->html = $this->G->make('html');
        $this->session = $this->G->make('session');
        $this->user = $this->G->make('user', 'user');
        $groups = $this->user->getUserGroups();
        $this->tpl->assign('groups', $groups);
        $this->tpl->assign('userhash', $this->ev->get('userhash'));
        $this->_user = $_user = $this->session->getSessionUser();
        if ($_user['sessionuserid'] && 'logout' != $this->ev->url(2)) {
            if ($this->ev->get('userhash')) {
                exit(json_encode([
                    'statusCode'   => 200,
                    'message'      => '您已经登录',
                    'callbackType' => 'forward',
                    'forwardUrl'   => 'index.php?'.$this->G->defaultApp,
                ]));
            }

            header('location:index.php?'.$this->G->defaultApp);
            exit;
        }
    }
}
