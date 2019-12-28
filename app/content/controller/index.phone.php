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

    private function test()
    {
        $this->tpl->display('test');
    }

    private function index()
    {
        $catids = $this->category->getCategoriesByArgs([['AND', 'catinmenu = 0'], ['AND', "catapp = 'content'"], ['AND', 'catparent = 0']]);
        $contents = [];
        if ($catids) {
            foreach ($catids as $p) {
                if ($p['catindex']) {
                    $catstring = $this->category->getChildCategoryString($p['catid']);
                    $contents[$p['catid']] = $this->content->getContentList([['AND', 'find_in_set(contentcatid,:catstring)', 'catstring', $catstring]], 1, $p['catindex'] ? $p['catindex'] : 10);
                }
            }
        }
        $this->tpl->assign('categories', $this->category->categories);
        $this->tpl->assign('contents', $contents);
        $this->tpl->assign('catids', $catids);
        $this->tpl->display('index');
    }
}
