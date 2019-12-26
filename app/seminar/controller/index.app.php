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
        $this->position = $this->G->make('position', 'content');
        $action = $this->ev->url(3);
        if (!method_exists($this, $action)) {
            $action = 'index';
        }
        $this->$action();
        exit;
    }

    private function index()
    {
        $catids = $this->category->getCategoriesByArgs([['AND', 'catinmenu = 0'], ['AND', "catapp = 'seminar'"]]);
        $seminars = [];
        if ($catids) {
            foreach ($catids as $p) {
                $catstring = $this->category->getChildCategoryString($p['catid']);
                $seminars[$p['catid']] = $this->seminar->getSeminarList([['AND', 'find_in_set(seminarcatid,:catstring)', 'catstring', $catstring]], 1, $p['catindex'] ? $p['catindex'] : 10);
            }
        }
        $topseminars = $this->position->getPosSeminarList([['AND', 'pcposid = 3']], 1, 10);
        $this->tpl->assign('categories', $this->category->categories);
        $this->tpl->assign('topseminars', $topseminars);
        $this->tpl->assign('seminars', $seminars);
        $this->tpl->assign('catids', $catids);
        $this->tpl->display('index');
    }
}
