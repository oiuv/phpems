<?php

/*
 * Created on 2016-5-19
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */

class action extends app
{
    public function display()
    {
        $action = $this->ev->url(3);
        if (!method_exists($this, $action))
            $action = "index";
        $this->$action();
        exit;
    }

    private function test()
    {
        $this->tpl->display('test');
    }

    private function index()
    {
        $catids = array();
        $catids['index'] = $this->category->getCategoriesByArgs(array(array("AND", "catindex > 0")));
        $contents = array();
        if ($catids['index']) {
            foreach ($catids['index'] as $p) {
                $catstring = $this->category->getChildCategoryString($p['catid']);
                $contents[$p['catid']] = $this->content->getContentList(array(array("AND", "find_in_set(contentcatid,:catstring)", 'catstring', $catstring)), 1, $p['catindex'] ? $p['catindex'] : 10);
            }
        }
        $this->category->app = 'course';
        $coursecats = $this->category->getCategoriesByArgs(array(array("AND", "catparent = '0'")));
        $topcourse = array();
        foreach ($coursecats as $cat) {
            $catstring = $this->category->getChildCategoryString($cat['catid']);
            $topcourse[$cat['catid']] = $this->course->getCourseList(array(array("AND", "find_in_set(cscatid,:cscatid)", 'cscatid', $catstring)), 1, 6);
        }

        // 获取最新30条考试记录
        $eh = \Model\ExamHistory::orderBy('ehstarttime', 'desc')->take(30)->get();
        $eh = json_decode($eh->toJson(), true);
        // 获取考场列表
        $basic = \Model\Basic::pluck('basic', 'basicid');
        $this->tpl->assign('eh', $eh);
        $this->tpl->assign('basic', $basic);

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
