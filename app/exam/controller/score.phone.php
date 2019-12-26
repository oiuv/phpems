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

    private function index()
    {
        $page = $this->ev->get('page');
        $page = $page < 1 ? 1 : $page;
        $s = $this->favor->getUserTopScore($this->data['currentbasic']['basicid'], $this->_user['sessionuserid']);
        $scores = $this->favor->getExamScoreListByBasicId($this->data['currentbasic']['basicid'], $page, 10);
        $this->tpl->assign('s', $s);
        $this->tpl->assign('page', $page);
        $this->tpl->assign('scores', $scores);
        $this->tpl->display('scores');
    }
}
