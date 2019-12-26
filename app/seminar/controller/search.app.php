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
        $keyword = $this->ev->get('keyword');
        $contents = $this->content->getContentList([['AND', 'contenttitle LIKE :contenttitle', 'contenttitle', "%{$keyword}%"]], $page);
        $this->tpl->assign('page', $page);
        $this->tpl->assign('contents', $contents);
        $this->tpl->display('search_default');
    }
}
