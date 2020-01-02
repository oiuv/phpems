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
        $this->session = $this->G->make('session');
        $this->tpl = $this->G->make('tpl');
        $this->ev = $this->G->make('ev');
        $this->user = $this->G->make('user', 'user');
        $this->tpl->assign('userhash', $this->ev->get('userhash'));
        $this->_user = $_user = $this->session->getSessionUser();
        if (!$_user['sessionuserid']) {
            if ($this->ev->get('userhash')) {
                exit(json_encode([
                    'statusCode'   => 301,
                    'message'      => '请您重新登录',
                    'callbackType' => 'forward',
                    'forwardUrl'   => 'index.php?user-app-login',
                ]));
            }

            header('location:index.php?user-app-login');
            exit;
        }
        $this->tpl->assign('_user', $this->user->getUserById($_user['sessionuserid']));
    }
}
