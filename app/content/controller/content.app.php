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
        $this->position = $this->G->make('position', 'content');
        $action = $this->ev->url(3);
        if (!method_exists($this, $action)) {
            $action = 'index';
        }
        $this->$action();
        exit;
    }

    private function setview()
    {
        $contentid = $this->ev->get('contentid');
        echo $this->content->setViewNumber($contentid);
    }

    private function index()
    {
        $page = $this->ev->get('page');
        $contentid = $this->ev->get('contentid');
        $content = $this->content->getContentById($contentid);
        if ($content['contentlink']) {
            header('location:'.html_entity_decode($content['contentlink']).'');
        } else {
            $catbread = $this->category->getCategoryPos($content['contentcatid']);
            $cat = $this->category->getCategoryById($content['contentcatid']);
            $catbrother = $this->category->getCategoriesByArgs([['AND', 'catparent = :catparent', 'catparent', $cat['catparent']], ['AND', "catinmenu = '0'"]]);
            if ($content['contenttemplate']) {
                $template = $content['contenttemplate'];
            } else {
                $template = 'content_default';
            }
            $nearContent = $this->content->getNearContentById($contentid, $content['contentcatid']);
            if (!$template) {
                $template = 'content_default';
            }
            $topnews = $this->position->getPosNewsList([['AND', 'pcposid = 2']], 1, 10);
            $this->tpl->assign('topnews', $topnews);
            $this->tpl->assign('cat', $cat);
            $this->tpl->assign('nearContent', $nearContent);
            $this->tpl->assign('page', $page);
            $this->tpl->assign('catbread', $catbread);
            $this->tpl->assign('content', $content);
            $this->tpl->assign('catbrother', $catbrother);
            $this->tpl->display($template);
        }
    }
}
