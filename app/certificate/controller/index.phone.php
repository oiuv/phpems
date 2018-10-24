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
        $this->pg->isPhone = 1;
        $this->pg->target = 'class="ajax" data-target="certificate" data-page="certificate" ';
        $page = intval($this->ev->get('page'));
        $args = [];
        $args[] = ['AND', 'cequserid = :cequserid', 'cequserid', $this->_user['sessionuserid']];
        $certificates = $this->ce->getCeQueueList($args, $page, 10);
        $this->tpl->assign('certificates', $certificates);
        $this->tpl->assign('status', ['申请中', '已受理', '已出证', '申请被驳回']);
        $this->tpl->assign('page', $page);
        $this->tpl->display('index');
    }
}
