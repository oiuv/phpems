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
        $this->ev = $this->G->make('ev');
        $this->tpl = $this->G->make('tpl');
        $this->sql = $this->G->make('sql');
        $this->pdosql = $this->G->make('pdosql');

        $this->db = $this->G->make('pdodb');
        $this->pg = $this->G->make('pg');
        $this->html = $this->G->make('html');
        $this->files = $this->G->make('files');
        $this->session = $this->G->make('session');
        $this->category = $this->G->make('category');
        $this->doc = $this->G->make('doc', 'docs');
        $this->user = $this->G->make('user', 'user');
        $this->_user = $_user = $this->session->getSessionUser();
        $this->tpl->assign('_user', $this->user->getUserById($this->_user['sessionuserid']));
        $rcats = $this->category->getCategoriesByArgs([['AND', "catparent = '0'"]]);
        $this->tpl->assign('rcats', $rcats);
    }
}
