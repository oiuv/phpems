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
        if ($cat['catuseurl'] && $cat['caturl']) {
            $message = [
                'statusCode'   => 201,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => html_entity_decode($cat['caturl']),
            ];
            exit(json_encode($message));
        }
        if ($cat['catparent']) {
            $catparent = $this->category->getCategoryById($cat['catparent']);
        }
        $catbread = $this->category->getCategoryPos($catid);
        $catstring = $this->category->getChildCategoryString($catid);
        $catchildren = $this->category->getCategoriesByArgs([['AND', 'catparent = :catparent', 'catparent', $catid], ['AND', "catinmenu = '0'"]]);
        $contents = $this->content->getContentList([['AND', 'find_in_set(contentcatid,:contentcatid)', 'contentcatid', $catstring]], $page);
        $catbrother = $this->category->getCategoriesByArgs([['AND', 'catparent = :catparent', 'catparent', $cat['catparent']], ['AND', "catinmenu = '0'"]]);
        if ($cat['cattpl']) {
            $template = $cat['cattpl'];
        } else {
            $template = 'category_default';
        }
        $this->tpl->assign('cat', $cat);
        $this->tpl->assign('page', $page);
        $this->tpl->assign('catbrother', $catbrother);
        $this->tpl->assign('catchildren', $catchildren);
        $this->tpl->assign('catparent', $catparent);
        $this->tpl->assign('catbread', $catbread);
        $this->tpl->assign('contents', $contents);
        $this->tpl->display('category_default');
    }
}
