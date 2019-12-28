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
        $catid = $this->ev->get('catid');
        $cat = $this->category->getCategoryById($catid);
        $catbread = $this->category->getCategoryPos($catid);
        $catstring = $this->category->getChildCategoryString($catid);
        $catchildren = $this->category->getCategoriesByArgs([['AND', 'catparent = :catparent', 'catparent', $catid], ['AND', "catinmenu = '0'"], ['AND', "catapp = 'course'"]]);
        $contents = $this->course->getCourseList([['AND', 'find_in_set(cscatid,:cscatid)', 'cscatid', $catstring]], $page);
        $catbrother = $this->category->getCategoriesByArgs([['AND', 'catparent = :catparent', 'catparent', $cat['catparent']], ['AND', "catinmenu = '0'"], ['AND', "catapp = 'course'"]]);
        if ($cat['cattpl']) {
            $template = $cat['cattpl'];
        } else {
            $template = 'category_default';
        }
        $this->tpl->assign('cat', $cat);
        $this->tpl->assign('page', $page);
        $this->tpl->assign('catbrother', $catbrother);
        $this->tpl->assign('catchildren', $catchildren);
        $this->tpl->assign('catbread', $catbread);
        $this->tpl->assign('contents', $contents);
        $this->tpl->assign('categories', $this->category->categories);
        $this->tpl->display($template);
    }
}
