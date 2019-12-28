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
        $catids = [];
        $catids['index'] = $this->category->getCategoriesByArgs([['AND', 'catindex > 0']]);
        $contents = [];
        if ($catids['index']) {
            foreach ($catids['index'] as $p) {
                $catstring = $this->category->getChildCategoryString($p['catid']);
                $contents[$p['catid']] = $this->content->getContentList([['AND', 'find_in_set(contentcatid,:catstring)', 'catstring', $catstring]], 1, $p['catindex'] ? $p['catindex'] : 10);
            }
        }
        $this->category->app = 'course';
        $coursecats = $this->category->getCategoriesByArgs([['AND', "catparent = '0'"]]);
        $topcourse = [];
        foreach ($coursecats as $cat) {
            $catstring = $this->category->getChildCategoryString($cat['catid']);
            $topcourse[$cat['catid']] = $this->course->getCourseList([['AND', 'find_in_set(cscatid,:cscatid)', 'cscatid', $catstring]], 1, 6);
        }
        $this->tpl->assign('topcourse', $topcourse);
        $courses = $this->course->getCourseList(1, 1, 8);
        $basic = $this->G->make('basic', 'exam');
        $basics = $basic->getBestBasics();
        $this->tpl->assign('coursecats', $coursecats);
        $this->tpl->assign('courses', $courses);
        $this->tpl->assign('basics', $basics);
        $this->tpl->assign('contents', $contents);
        $this->tpl->display('index');
    }
}
