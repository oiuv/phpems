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
        if ($this->ev->isMobile()) {
            header('location:index.php?content-phone');
            exit;
        }
        $action = $this->ev->url(3);
        if (!method_exists($this, $action)) {
            $action = 'index';
        }
        $this->$action();
        exit;
    }

    private function index()
    {
        $number = [];
        $number['more'] = $this->doc->getDocNumber([['AND', 'docneedmore = 1']]);
        $number['all'] = $this->doc->getDocNumber([]);
        $docs = [];
        $args = [];
        $args[] = ['AND', 'docneedmore = 0'];
        $docs['new'] = $this->doc->getDocList($args, 1, 10);
        $args = [];
        $args[] = ['AND', 'docneedmore = 1'];
        $docs['more'] = $this->doc->getDocList($args, 1, 10);
        $args = [];
        $args[] = ['AND', 'docistop = 1'];
        $docs['top'] = $this->doc->getDocList($args, 1, 4);
        $this->category->getAllCategory();
        $this->tpl->assign('categories', $this->category->tidycategories);
        $this->tpl->assign('number', $number);
        $this->tpl->assign('docs', $docs);
        $this->tpl->display('index');
    }
}
