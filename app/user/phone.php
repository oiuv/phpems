<?php

/*
 * This file is part of the phpems/phpems.
 *
 * (c) oiuv <i@oiuv.cn>
 *
 * This source file is subject to the MIT license that is bundled.
 */

class app
{
    public $G;

    public function __construct(&$G)
    {
        $this->G = $G;
        $this->ev = $this->G->make('ev');
        $this->tpl = $this->G->make('tpl');
        $this->sql = $this->G->make('sql');
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
        $this->order = $this->G->make('orders', 'bank');
        if ($_user['sessionuserid']) {
            $this->tpl->assign('_user', $this->user->getUserById($_user['sessionuserid']));
        }
        $this->tpl->assign('userhash', $this->ev->get('userhash'));
        $orderstatus = [1 => '待付款', 2 => '已完成', 99 => '已撤单'];
        $this->tpl->assign('orderstatus', $orderstatus);
    }
}
