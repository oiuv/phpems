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

    public function setview()
    {
        $contentid = $this->ev->get('contentid');
        echo $this->content->setViewNumber($contentid);
    }

    public function index()
    {
        $page = $this->ev->get('page');
        $contentid = $this->ev->get('contentid');
        $content = $this->content->getContentById($contentid);
        if ($content['contentlink']) {
            $message = [
                'statusCode'   => 201,
                'message'      => '操作成功',
                'callbackType' => 'forward',
                'forwardUrl'   => html_entity_decode($content['contentlink']),
            ];
            exit(json_encode($message));
        }
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
        $this->tpl->assign('cat', $cat);
        $this->tpl->assign('nearContent', $nearContent);
        $this->tpl->assign('page', $page);
        $this->tpl->assign('catbread', $catbread);
        $this->tpl->assign('content', $content);
        $this->tpl->assign('catbrother', $catbrother);
        $this->tpl->display($template);
    }
}
