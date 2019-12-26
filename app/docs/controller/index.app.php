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
        $catids = $this->category->getCategoriesByArgs([['AND', 'catinmenu = 0'], ['AND', "catapp = 'docs'"], ['AND', 'catparent = 0']]);
        $contents = [];
        if ($catids) {
            foreach ($catids as $p) {
                if ($p['catindex']) {
                    $catstring = $this->category->getChildCategoryString($p['catid']);
                    $docs[$p['catid']] = $this->doc->getDocList([['AND', 'find_in_set(doccatid,:catstring)', 'catstring', $catstring]], 1, $p['catindex'] ? $p['catindex'] : 10);
                }
            }
        }
        $args = [];
        $args[] = ['AND', 'docneedmore = 1'];
        $more = $this->doc->getDocList($args, 1, 10);
        $this->tpl->assign('categories', $this->category->categories);
        $this->tpl->assign('catids', $catids);
        $this->tpl->assign('docs', $docs);
        $this->tpl->assign('more', $more);
        $this->tpl->display('index');
    }
}
