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
        $this->course = $this->G->make('course', 'course');
        $this->content = $this->G->make('content', 'content');
        $this->position = $this->G->make('position', 'content');
        $courses = $this->course->getCourseList([], 1, 6);
        $basic = $this->G->make('basic', 'exam');
        $basics = $basic->getBasicList([['AND', 'basicclosed = 0']], 1, 6);
        $topimgs = $this->position->getPosNewsList([['AND', 'pcposid = 1']], 1, 5);
        $topnews = $this->position->getPosNewsList([['AND', 'pcposid = 2']], 1, 10);
        $topseminars = $this->position->getPosSeminarList([['AND', 'pcposid = 3']], 1, 10);
        $links = $this->content->getContentList([['AND', 'contentcatid = 11']], 1, 10);
        $notices = $this->content->getContentList([['AND', 'contentcatid = 14']], 1, 10);
        $this->tpl->assign('notices', $notices);
        $this->tpl->assign('links', $links);
        $this->tpl->assign('courses', $courses);
        $this->tpl->assign('basics', $basics);
        $this->tpl->assign('topimgs', $topimgs);
        $this->tpl->assign('topnews', $topnews);
        $this->tpl->assign('topseminars', $topseminars);
        $this->tpl->display('index');
    }
}
