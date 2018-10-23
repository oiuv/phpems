<?php

/*
 * This file is part of the phpems/phpems.
 *
 * (c) oiuv <i@oiuv.cn>
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
        $catids = [];
        $this->category->app = 'content';
        $catids['index'] = $this->category->getCategoriesByArgs([['AND', 'catindex > 0']]);
        $contents = [];
        if ($catids['index']) {
            foreach ($catids['index'] as $p) {
                $catstring = $this->category->getChildCategoryString($p['catid']);
                $contents[$p['catid']] = $this->content->getContentList([['AND', 'find_in_set(contentcatid,:catstring)', 'catstring', $catstring]], 1, $p['catindex'] ? $p['catindex'] : 10);
            }
        }
        $basic = $this->G->make('basic', 'exam');
        $basics = $basic->getBasicList(1, 8);
        $this->tpl->assign('basics', $basics['data']);
        $this->tpl->assign('contents', $contents);
        $this->tpl->display('index');
    }
}
